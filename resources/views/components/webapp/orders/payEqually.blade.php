<div class="text-start">
    <div class="d-flex justify-content-between align-items-center">
        <h1 class="mt-3">
            {{ __('Divide the bill equally') }}
        </h1>
        <button wire:click="setBillView()" class="btn-close" aria-label="Close"></button>
    </div>
    <div class="underline-border mb-4"></div>
    <div class="donut-chart mx-auto position-relative square" style="--l: {{ $this->chartSize }}px" id="donutChart">
        <canvas id="donutCanvas" width="{{ $this->chartSize }}" height="{{ $this->chartSize }}"
            class="left-0 position-absolute top-0 z-0"></canvas>
        <div class="donut-center position-absolute text-black text-enter">
            <h1 class="text-center">@money($this->yourShare ?? 0, $this->currency, $this->convert)</h1>
            <div class="text-center text-xl">{{ __('Amount to share') }}</div>
        </div>
    </div>
    <x-webapp.counter class="mt-4" :prefix="__('Paying for')" :total="$this->people" :live="true" :suffix="__('person')" />
    <x-webapp.counter class="mt-4" :prefix="__('Out of')" :total="$this->totalPeople" :suffix="__('at the table')" />
</div>
<div>
    <div class="divider"></div>
    <div class="align-items-center d-flex justify-content-between py-2">
        <span>{{ __('Left to pay') }}</span>
        <span>@money($this->orderPriceWithTax - $this->yourShare ?? 0, $this->currency, $this->convert)</span>
    </div>
    <div class="text-start text-black-50">
        <span>{{ __('Incl. all taxes') }}</span>
    </div>
    <div class="d-flex gap-2 justify-content-between mt-3">
        <x-webapp.button class="btn-brand-outline" wire:click="setBillView()">
            {{ __('Remove split') }}
        </x-webapp.button>
        <x-webapp.button class="btn-brand" :disabled="$this->yourShare === 0.0" wire:click="confirm">{{ __('Confirm') }}</x-webapp.button>
    </div>
</div>
