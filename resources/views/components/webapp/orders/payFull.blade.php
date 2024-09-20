<div>
    <div class="align-items-center d-flex justify-content-between py-2">
        <span>{{ __('Your share to pay') }}</span>
        <span>@money($this->yourShare, $this->currency, $this->convert)</span>
    </div>
    <div class="align-items-center d-flex justify-content-between text-black-50 py-0">
        <span>{{ __('Incl. all taxes') }}</span>
    </div>
    <div class="d-flex gap-2 justify-content-between mt-3">
        <x-webapp.button class="btn-brand-outline" wire:click="setBillView()">
            {{ __('View bill') }}
        </x-webapp.button>
    </div>
    <div class="divider"></div>
</div>
<div class="border rounded-3 px-3 py-1">
    <div class="align-items-center d-flex justify-content-between fw-bold py-2">
        <span>{{ __('Say thanks to your waiter!') }}</span>
    </div>
    <div class="d-flex gap-3 align-items-center justify-content-between my-3">
        <div wire:click="setTip(10)" @class([
            'flex-fill rounded-pill border border-2 px-3 py-1 d-flex align-items-center justify-content-center gap-1 cursor-pointer position-relative fw-bold',
            'border-brand bg-brand text-white' =>
                $this->isTipPercentage && (int) $this->tip === 10,
        ])>
            <span>10%</span>
            <x-svg-ice-cream />
        </div>
        <div wire:click="setTip(15)" @class([
            'flex-fill rounded-pill border border-2 px-3 py-1 d-flex align-items-center justify-content-center gap-1 cursor-pointer fw-bold',
            'border-brand bg-brand text-white' =>
                $this->isTipPercentage && (int) $this->tip === 15,
        ])>
            <span>15%</span>
            <x-svg-cupcake />
        </div>
        <div @class([
            'flex-fill rounded-pill border border-2 px-2 py-1 d-flex align-items-center justify-content-between gap-1',
            'border-brand bg-brand text-white' =>
                !$this->isTipPercentage && $this->tipValue,
        ])>
            <div class="d-flex">
                @if (!is_null($this->tipValue))
                    <span>{{ currency($this->currency)->getSymbol() }}</span>
                @endif
                <input type="number" wire:model.blur="tipValue" placeholder="Custom"
                    class="py-0 border-0 bg-transparent focus-none w-100" required style="color: inherit;" />
            </div>
            <div class=""><x-svg-pencil /></div>
        </div>
    </div>
</div>
<div class="divider"></div>
<div>
    <div class="align-items-center d-flex justify-content-between text-black-50 py-2">
        <span>{{ __('Tip amount') }}</span>
        <span>@money($this->tipAmount, $this->currency, $this->convert)</span>
    </div>
    <div x-data="{ tooltip: false }" class="align-items-center d-flex justify-content-between text-black-50 py-2">
        <div class="position-relative d-inline-flex gap-1">
            <span>{{ __('Service fee') }}</span>
            <span @click="tooltip = !tooltip" class="cursor-pointer">
                <x-svg-info />
            </span>
            <div class="position-relative" x-cloak x-show="tooltip">
                <div class="info-tip" @click.away="tooltip = false">
                    Small service fee charged for using etabs fast checkout service
                </div>
            </div>
        </div>
        <div>@money($this->serviceFee, $this->currency, $this->convert)</div>
    </div>
    <div class="align-items-center d-flex justify-content-between fw-bold py-2">
        <span>{{ __('Total amount you pay') }}</span>
        <span>@money(ceil($this->yourShare + $this->serviceFee + $this->tipAmount), $this->currency, $this->convert)</span>
    </div>
    <div class="align-items-center d-flex justify-content-between text-black-50 py-1">
        <span>{{ __('Incl. all taxes') }}</span>
    </div>
</div>
@error('amount')
    <div class="text-danger">{{ $message }}</div>
@enderror

<div>
    <div class="align-items-center d-flex justify-content-between fw-bold py-3">
        <span>{{ __('How would you like to pay?') }}</span>
    </div>
    @if ($this->showApplePay)
        <label class="d-flex justify-content-between align-items-center my-2 cursor-pointer p-3 rounded-5 border"
            wire:target="payWithApplePay" wire:click="payWithApplePay" for="payWithApplePay">
            <div class="d-flex gap-2 align-items-start">
                <x-svg-apple />
                <span class="ms-2">{{ __('Apple Pay') }}</span>
            </div>
            <div class="text-end">
                <input class="form-check-input" type="radio" name="splitBill" id="payWithApplePay" />
            </div>
        </label>
    @endif
    @if ($this->showGooglePay)
        <label class="d-flex justify-content-between align-items-center my-2 cursor-pointer p-3 rounded-5 border"
            wire:target="payWithGooglePay" wire:click="payWithGooglePay" for="payWithGooglePay">
            <div class="d-flex gap-2 align-items-start">
                <x-svg-google />
                <span class="ms-2">{{ __('Google Pay') }}</span>
            </div>
            <div class="text-end">
                <input class="form-check-input" type="radio" name="splitBill" id="payWithGooglePay" />
            </div>
        </label>
    @endif
    <label class="d-flex justify-content-between align-items-center my-2 cursor-pointer p-3 rounded-5 border"
        wire:target="payWithCard" wire:click="payWithCard" for="payWithCard">
        <div class="d-flex gap-2 align-items-start">
            <x-svg-credit-card />
            <span class="ms-2">{{ __('Card') }}</span>
        </div>
        <div class="text-end">
            <input class="form-check-input" type="radio" name="splitBill" id="payWithCard" />
        </div>
    </label>
</div>
