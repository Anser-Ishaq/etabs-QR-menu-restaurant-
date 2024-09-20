<?php

namespace App\Livewire\Webapp;

use App\Enums\OrderPageType;
use App\Enums\PaymentType;
use App\Models\Company;
use App\Models\Transaction;
use App\Models\TransactionItem;
use App\Order;
use App\Services\ConfChanger;
use App\Tables;
use Detection\MobileDetect;
use Illuminate\Support\Collection;
use Livewire\Component;
use Stripe\Checkout\Session;
use Stripe\Stripe;

class OrderPage extends Component
{
    public Company $company;

    public Tables $table;

    public OrderPageType $componentName = OrderPageType::BILL;

    public OrderPageType $splitType = OrderPageType::PAY_EQUALLY;

    public ?Order $order = null;

    public int $people = 1;

    public int $totalPeople = 1;

    public ?float $yourShare = null;

    public ?float $yourShareValue = null;

    public float $orderPriceWithTax = 0;

    public float $serviceFee = 0;

    public float $tip = 10;

    public ?float $tipValue = null;

    public float $tipAmount = 0;

    public bool $isTipPercentage = true;

    public array $tips = [
        10 => true,
        12 => false,
        15 => false,
    ];

    /**
     * @var array<int, array<string, mixed>>
     */
    public array $yourItems = [];

    /**
     * @var array<int, array<string, mixed>>
     */
    public Collection $transactionItems;

    public bool $showModal = false;

    public string $currency;

    public bool $convert;

    public bool $showApplePay = false;

    public bool $showGooglePay = false;

    public int $chartSize = 380;

    public function mount(Company $company, Tables $table): void
    {
        abort_unless($company->active, 403, __('Restaurant is not active'));

        $detect = new MobileDetect;

        $userAgent = $_SERVER['HTTP_USER_AGENT'];

        $this->showApplePay = $detect->isiOS() || stripos($userAgent, 'Macintosh') !== false;
        $this->showGooglePay = $detect->isAndroidOS() || stripos($userAgent, 'Windows') !== false;

        ConfChanger::switchCurrency($company);
        ConfChanger::switchLanguage($company);

        $this->currency = config('settings.cashier_currency');
        $this->convert = config('settings.do_convertion');

        config(['app.timezone' => $company->getConfig('time_zone', config('app.timezone'))]);

        $this->company = $company;
        $this->table = $table;

        $this->order = Order::query()
            ->with('items')
            ->where('table_id', $table->id)
            ->whereIn('payment_status', [PaymentType::UNPAID->value, PaymentType::PARTIAL_PAID->value])
            ->latest('id')
            ->first();

        $this->transactionItems = collect();

        if ($this->order) {
            $this->totalPeople = $table->size;
            $this->orderPriceWithTax = $this->order->remainingPrice;

            $this->serviceFee = get_percent($this->orderPriceWithTax, $this->order->fee);

            $this->setTipAmount();

            $this->transactionItems = TransactionItem::whereHas('transaction', function ($query) {
                $query->where('is_paid', true)->where('order_id', $this->order->id);
            })
                ->get()
                ->groupBy('order_item_id')
                ->map(function ($group) {
                    return $group->sum('quantity');
                });
        }

        $this->setSplitType(OrderPageType::PAY_EQUALLY);
    }

    public function render()
    {
        return view('livewire.webapp.order-page');
    }

    public function setViewPort($chartSize): void
    {
        $this->chartSize = $chartSize;
    }

    public function updatedTipValue(): void
    {
        $this->isTipPercentage = false;
        $this->setTipAmount();
    }

    public function updatedYourShareValue($value): void
    {
        $this->yourShare = $value * 100;

        if ($this->yourShare > $this->orderPriceWithTax) {
            $this->yourShare = $this->orderPriceWithTax;
            $this->yourShareValue = number_format(($this->orderPriceWithTax / 100), 2);
        }

        $this->setTipAmount();
    }

    public function updatedShowModal($value): void
    {
        if (! $value) {
            $this->splitType = OrderPageType::PAY_EQUALLY;
        }
    }

    public function updatedTip($value): void
    {
        if (is_null($value)) {
            $this->tip = 1;

            return;

        }
        try {
            if ($this->isTipPercentage && $this->tip > 100) {
                $this->tip = 100;
            }
            $this->setTipAmount();
        } catch (\Throwable $th) {
        }
    }

    public function updatedPeople(): void
    {
        try {
            if ($this->totalPeople < $this->people) {
                $this->people = $this->totalPeople;
            }
            if ($this->people < 1) {
                $this->people = 1;
            }
            $this->setYourShareFromPeople();
        } catch (\Throwable $th) {
        }
    }

    public function updatedTotalPeople(): void
    {
        try {
            if ($this->totalPeople < $this->people) {
                $this->totalPeople = $this->people;
            }
            if ($this->totalPeople < 1) {
                $this->totalPeople = 1;
            }
            $this->setYourShareFromPeople();
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function confirm(bool $resetShare = false, bool $goToPayFull = false): void
    {
        if (is_null($this->yourShare) || $resetShare) {
            $this->yourShare = $this->orderPriceWithTax;
        }
        $this->serviceFee = get_percent($this->yourShare, $this->order->fee);
        $this->setTipAmount();
        if ($goToPayFull) {
            $this->componentName = OrderPageType::PAY_FULL;
        } else {
            $this->componentName = $this->splitType === OrderPageType::PAY_YOUR_ITEMS ? OrderPageType::PAY_YOUR_ITEMS : OrderPageType::PAY_FULL;
        }

        $this->showModal = false;
        $this->dispatch('hideBsModal', id: 'SplitBill');
    }

    public function setBillView(): void
    {
        $this->componentName = OrderPageType::BILL;
        $this->dispatch('hideBsModal', id: 'SplitBill');
        $this->showModal = false;

        $this->setSplitType(OrderPageType::PAY_EQUALLY);
    }

    public function setSplitType(OrderPageType $orderPageType): void
    {
        $this->splitType = $orderPageType;
        $this->yourShare = null;
        $this->yourShareValue = null;
        $this->people = 1;
        $this->yourItems = [];
        if ($orderPageType === OrderPageType::PAY_EQUALLY) {
            $this->setYourShareFromPeople();
        }
    }

    public function setTipType(bool $type): void
    {
        $this->isTipPercentage = $type;
    }

    public function setTip(int $value): void
    {
        $this->tip = $value;
        $this->isTipPercentage = true;
        $this->tipValue = null;
        $this->setTipAmount();
    }

    public function increaseQuantity(int $id): void
    {
        $this->updateItemQuantity($id, 1);
    }

    public function decreaseQuantity(int $id): void
    {
        $this->updateItemQuantity($id, -1);
    }

    public function increasePeople(): void
    {
        if ($this->totalPeople > $this->people) {
            $this->people += 1;
            $this->drawDonutChart();
        }
    }

    public function decreasePeople(): void
    {
        if ($this->people > 1) {
            $this->people -= 1;
            $this->drawDonutChart();
        }
    }

    public function payWithApplePay(): void
    {
        $this->payWithCard();
    }

    public function payWithGooglePay(): void
    {
        $this->payWithCard();
    }

    public function payWithCard()
    {
        $message = config('global.min_order_message', __('Minimum amount you can pay when splitting the bill is R20, however the remaining bill amount can’t be less than R20. Please increase amount.'));

        $minAmount = ((int) config('global.min_order_amount', 20)) * 100;

        $totalPrice = (int) ceil($this->yourShare + $this->tipAmount + $this->serviceFee);

        $remainingPrice = $this->orderPriceWithTax - $this->yourShare;

        if ($totalPrice < $minAmount || ($remainingPrice > 0 && $remainingPrice < $minAmount)) {
            $this->addError('amount', $message);

            return;
        }

        \App\Services\ConfChanger::switchCurrency($this->order->restorant);

        Stripe::setApiKey(config('settings.stripe_secret'));

        $lineItems = [
            [
                'price_data' => [
                    'currency' => $this->currency,
                    'product_data' => [
                        'name' => __('Order').' #'.$this->order->id_formated,
                    ],
                    'unit_amount' => $totalPrice,
                ],
                'quantity' => 1,
            ],
        ];

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => $lineItems,
            'mode' => 'payment',
            'success_url' => route('webapp.checkout.success', [], true).'?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => route('webapp.checkout.cancel', [], true).'?session_id={CHECKOUT_SESSION_ID}',
        ]);

        $price = ($this->yourShare ?? $this->orderPriceWithTax);

        $tax = $this->getTaxAmount($price);

        $transaction = Transaction::create([
            'user_name' => $this->order->client?->name,
            'amount' => $price - $tax,
            'currency' => $this->currency,
            'tip' => $this->tipAmount,
            'tax' => $tax,
            'service' => $this->serviceFee,
            'session_id' => $session->id,
            'user_id' => $this->order->client?->id,
            'order_id' => $this->order->id,
        ]);

        foreach ($this->yourItems as $orderItemItem => $item) {
            $transaction->items()->create([
                'quantity' => $item['quantity'],
                'order_item_id' => $orderItemItem,
            ]);
        }

        return redirect($session->url);
    }

    private function setTipAmount(): void
    {
        if ($this->isTipPercentage) {
            $this->tipAmount = (($this->yourShare ?? $this->orderPriceWithTax) * $this->tip) / 100;

            return;
        }

        if ($this->tipValue <= 0) {
            $this->tipValue = null;
            $this->tipAmount = 0;

            return;
        }

        if ($this->tipValue) {
            $this->tipAmount = $this->tipValue * 100;

            return;
        }

        $this->isTipPercentage = true;

        $this->setTipAmount();

    }

    private function setYourShareFromPeople(): void
    {
        $this->yourShare = ($this->people / $this->totalPeople) * $this->orderPriceWithTax;
    }

    private function calculateYourShareFromYourItems(): void
    {
        $this->yourShare = 0;

        foreach ($this->yourItems as $myItem) {
            $this->yourShare += $myItem['price'] * $myItem['quantity'];
        }

        if ($this->yourShare > $this->orderPriceWithTax) {
            $this->yourShare = $this->orderPriceWithTax;
        }
    }

    private function drawDonutChart(): void
    {
        $this->setYourShareFromPeople();
        $this->dispatch('drawDonutChart', people: $this->people, total: $this->totalPeople);
    }

    private function updateItemQuantity(int $id, int $quantity): void
    {
        if (! isset($this->yourItems[$id])) {
            $this->createNewItem($id);
        }

        $newQuantity = $this->yourItems[$id]['quantity'] + $quantity;

        if ($newQuantity < 0 || $this->yourItems[$id]['maxQuantity'] < $newQuantity) {
            return;
        }

        $this->yourItems[$id]['quantity'] = $newQuantity;
        $this->calculateYourShareFromYourItems();
    }

    private function createNewItem(int $id): void
    {
        /** @var \App\Items|null */
        $item = $this->order->items->first(fn ($item) => $item->pivot->id === $id);
        if (is_null($item) || $item->pivot->qty < 1) {
            return;
        }

        $theItemPrice = $item->pivot->variant_price ? $item->pivot->variant_price : $item->price;

        $itemPrice = $theItemPrice + get_percent($theItemPrice, $item->pivot->vat);

        $maxQuantity = $item->pivot->qty - ($this->transactionItems[$id] ?? 0);

        $this->yourItems[$id] = [
            'quantity' => 0,
            'maxQuantity' => $maxQuantity,
            'price' => $itemPrice,
        ];
    }

    private function getTaxAmount(float $priceInclusiveOfTax)
    {
        $taxRate = 15 / 100; // 15%
        $originalPrice = $priceInclusiveOfTax / (1 + $taxRate);
        $taxAmount = $priceInclusiveOfTax - $originalPrice;

        return $taxAmount;
    }
}
