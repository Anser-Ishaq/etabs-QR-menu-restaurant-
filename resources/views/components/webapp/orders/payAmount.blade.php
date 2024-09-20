<div class="text-start">
    <div class="d-flex justify-content-between align-items-center">
        <h1 class="mt-3">{{ __('Pay a custom amount') }}</h1>
        <button wire:click="setBillView()" class="btn-close"></button>
    </div>
    <div class="underline-border mb-4"></div>
    <div class="d-flex flex-column gap-3">
        <h3>{{ __('Pay') }}</h3>
        <x-webapp.input wire:model.live="yourShareValue" step="0.01" type="number"
            placeholder="{{ __('Enter amount') }}" aria-label="__('Enter amount')" required />
        <div class="py-2">of @money($this->orderPriceWithTax, $this->currency, $this->convert)</div>
    </div>
    <div class="divider"></div>
</div>
<div>
    <div><span>Powered by</span> <span class="text-xl"><strong>e</strong> <span>tabs</span></span></div>
    <div class="divider"></div>
    <div class="align-items-center d-flex justify-content-between py-2">
        <span>{{ __('Left to pay') }}</span>
        <span>@money($this->orderPriceWithTax - $this->yourShare ?? 0, $this->currency, $this->convert)</span>
    </div>

    <div class="align-items-center d-flex justify-content-between fw-bold py-2">
        <span>{{ __('Your share') }}</span>
        <span>@money($this->yourShare ?? 0, $this->currency, $this->convert)</span>
    </div>
    <div class="text-start text-black-50">
        <span>{{ __('Incl. all taxes') }}</span>
    </div>
    <div class="d-flex gap-2 justify-content-between mt-3">
        <x-webapp.button class="btn-brand-outline" wire:click="setBillView()">
            {{ __('Remove split') }}
        </x-webapp.button>
        <x-webapp.button class="btn-brand" wire:click="confirm" :disabled="is_null($this->yourShare)">
            {{ __('Confirm') }}
        </x-webapp.button>
    </div>
</div>
