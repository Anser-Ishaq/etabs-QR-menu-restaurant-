<?php

namespace App\Livewire\Webapp;

use App\Enums\PaymentType;
use App\Items;
use App\Models\Company;
use App\Models\User;
use App\Models\Variants;
use App\Order;
use App\Tables;
use Cart;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Livewire\Component;

class ProductsPage extends Component
{
    public ?Order $order = null;

    public Company $company;

    public Tables $table;

    public Collection $cartItems;

    public function mount(Company $company, Tables $table): void
    {
        abort_unless($company->can_pickup, 404, 'Page is not enabled');

        $this->company = $company;
        $this->table = $table;

        $this->cartItems = collect();

        $this->order = Order::query()
            ->with('items')
            ->where('table_id', $table->id)
            ->whereIn('payment_status', [PaymentType::UNPAID->value, PaymentType::PARTIAL_PAID->value])
            ->latest('id')
            ->first();

        foreach (Cart::getContent() as $item) {
            $this->cartItems->add([
                'id' => $item->id,
                'name' => $item->name,
                'price' => $item->price,
                'quantity' => $item->quantity,
                'attributes' => [
                    'image' => $item->attributes->image,
                ],
            ]);
        }
    }

    public function render()
    {
        // $this->cartItems = Cart::getContent()->map(fn ($item) => ['quantity' => $item->quantity, 'price' => $item->price]);

        return view('livewire.webapp.products-page');
    }

    public function updatedCartItems(): void
    {
        foreach ($this->cartItems as $item) {
            if (! $item['quantity']) {

                return;
            }
        }

        $this->refreshCart();
    }

    public function addToCart(Items $items): void
    {
        foreach ($this->cartItems as $key => $item) {
            if ($item['id'] === $items->id) {
                $item['quantity'] = $item['quantity'] + 1;
                $this->cartItems->put($key, $item);
                $this->refreshCart();

                return;
            }
        }

        $this->cartItems->add([
            'id' => $items->id,
            'name' => $items->name,
            'price' => $items->price,
            'quantity' => 1,
            'attributes' => [
                'image' => $items->icon,
            ],
        ]);

        $this->refreshCart();
    }

    public function removeFromCart($itemId): void
    {
        $this->cartItems->forget($itemId);
        $this->refreshCart();
    }

    public function createOrder()
    {
        config(['app.timezone' => $this->company->getConfig('time_zone', config('app.timezone'))]);

        if (! Auth::check()) {
            $user = User::create([
                'name' => session('WebappUserName'),
                'email' => $email = $this->generateUniqueUserField(10, 'email', 'example.com'),
                'password' => encrypt($email),
                'api_token' => $this->generateUniqueUserField(80, 'api_token', ''),
            ]);

            Auth::loginUsingId($user->id);
        }

        $user = Auth::user();

        $order = $this->order;

        if (is_null($this->order)) {
            /** @var Order */
            $order = $this->company->orders()->create([
                'client_id' => $user->id,
                'comment' => '',
                'payment_status' => PaymentType::UNPAID->value,
                'delivery_method' => 3, // dinein'
                'table_id' => $this->table->id,
                'order_price' => Cart::getSubTotal(),
                'fee' => $this->company->fee,
                'fee_value' => get_percent(Cart::getSubTotal(), $this->company->fee),
                'static_fee' => 0,
                'vatvalue' => 0,
                // 'payment_process_fee' => 0,
            ]);
        }

        $this->setItems($order);

        Cart::clear();

        return redirect()->route('webapp.order.show', [
            'company' => $this->company->subdomain,
            'table' => $this->table->id,
        ]);
    }

    private function setItems(Order $order)
    {
        foreach (Cart::getContent() as $item) {

            $theItem = Items::findOrFail($item['id']);

            \App\Services\ConfChanger::switchCurrency($this->company);

            $extras = [];

            //The price of the item or variant
            $itemSelectedPrice = $theItem->price;

            //Find the variant
            $variantName = '';
            if ($item['attributes']['variant'] ?? false) {
                //Find the variant
                $variant = Variants::findOrFail($item['attributes']['variant']);
                $itemSelectedPrice = $variant->price;
                $variantName = $variant->optionsList;

                //Check if qty is available
                $variant->decrement('qty', $item['quantity']);
                $theItem->calculateQTYBasedOnVariants();

            } else {
                //Decrement from item
                $theItem->decrement('qty', $item['quantity']);
            }

            //Find the extras
            foreach ($item['attributes']['extras'] ?? [] as $extra) {
                $theExtra = $theItem->extras()->findOrFail($extra['id']);
                $itemSelectedPrice += $theExtra->price;
                array_push($extras, $theExtra->name.' + '.money($theExtra->price, config('settings.cashier_currency'), config('settings.do_convertion')));
            }

            $this->createOrUpdate($order, [
                'id' => $item['id'],
                'qty' => $item['quantity'],
                'extras' => json_encode($extras),
                'vat' => $theItem->vat,
                'vatvalue' => get_percent($itemSelectedPrice, $theItem->vat, $item['quantity']),
                'variant_name' => $variantName,
                'variant_price' => $itemSelectedPrice,
            ]);
        }

        //After we have updated the list of items, we need to update the order price
        $order_price = 0;
        $total_order_vat = 0;
        foreach ($order->items()->get() as $orderItem) {
            $order_price += $orderItem->pivot->qty * $orderItem->pivot->variant_price;
            $total_order_vat += $orderItem->pivot->vatvalue;
        }
        $order->order_price = $order_price;
        $order->vatvalue = $total_order_vat;
        $order->fee_value = get_percent($order_price + $total_order_vat, $this->company->fee);

        //Update the order with the item
        $order->update();
    }

    private function createOrUpdate(Order $order, array $item)
    {
        $pivot = $order->items()->find($item['id'])?->pivot;
        if ($pivot) {
            if ($pivot['variant_price'] === $item['variant_price'] && $pivot['vat'] === $item['vat']) {
                $qty = $pivot->qty + $item['qty'];

                $pivot->qty = $qty;
                $pivot->vatvalue = get_percent($item['variant_price'], $item['vat'], $qty);
                $pivot->save();

                return;
            }
        }

        $order->items()->attach($item['id'], [
            'qty' => $item['qty'],
            'extras' => $item['extras'],
            'vat' => $item['vat'],
            'vatvalue' => $item['vatvalue'],
            'variant_name' => $item['variant_name'],
            'variant_price' => $item['variant_price'],
        ]);
    }

    private function generateUniqueUserField(int $prefixLength, string $field, string $suffix)
    {
        $uniqueString = '';

        do {
            $string = Str::random($prefixLength);

            $uniqueString = $string.$suffix;

            $fieldExists = User::where($field, $uniqueString)->exists();
        } while ($fieldExists);

        return $uniqueString;
    }

    private function refreshCart(): void
    {
        Cart::clear();
        foreach ($this->cartItems as $item) {
            Cart::add($item['id'], $item['name'], $item['price'], (int) $item['quantity'], $item['attributes']);
        }
    }
}
