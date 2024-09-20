<?php

namespace App\Livewire\Webapp;

use App\Enums\PaymentType;
use App\Models\Company;
use App\Order;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class Home extends Component
{
    public int $step = 3;

    public string $name = '';

    public float $finalPrice = 0;

    public Company $company;

    public int $table;

    public function mount(Company $company, int $table): void
    {
        abort_unless($company->active, 403, __('Restaurant is not active'));

        if (Auth::check()) {
            $this->name = Auth::user()->name;
            session(['WebappUserName' => $this->name]);
            $this->step = 2;
        }
        $this->company = $company;
        $this->table = $table;

        /** @var Order */
        $order = Order::query()
            ->with('items')
            ->where('table_id', $table)
            ->whereIn('payment_status', [PaymentType::UNPAID->value, PaymentType::PARTIAL_PAID->value])
            ->latest('id')
            ->first();

        if ($order) {
            $this->finalPrice = $order->remainingPrice;
        }
    }

    public function render()
    {
        return view('livewire.webapp.home');
    }

    public function addName(): void
    {
        $this->validateOnly('name', ['name' => ['required', 'string', 'max:255']]);

        session(['WebappUserName' => $this->name]);
        $this->step = 2;
    }

    public function loaded(): void
    {
        $this->step = Auth::check() ? 2 : 1;
    }
}
