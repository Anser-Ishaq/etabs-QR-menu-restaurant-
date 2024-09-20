<div>
    <div class="mb-3">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="display-1 fw-normal text-start">{{ $this->order->client?->name }}</h1>
            <button wire:click="setBillView()" class="btn-close" aria-label="Close"></button>
        </div>
        <div class="underline-border"></div>
        <h2 class="mt-2">{{ __('Pay for your items') }}</h2>
    </div>
    <div class="order-items w-100" style="--h: 50vh">
        @foreach ($this->order->items as $item)
            @php
                $theItemPrice = $item->pivot->variant_price ? $item->pivot->variant_price : $item->price;
                $qty = $item->pivot->qty;
                if ($this->transactionItems->has($item->pivot->id)) {
                    $qty = $item->pivot->qty - $this->transactionItems->get($item->pivot->id);
                }
                $itemPrice = $theItemPrice + get_percent($theItemPrice, $item->pivot->vat);
            @endphp
            @if ($qty < 1)
                @continue
            @endif
            <div class="d-flex justify-content-between align-items-center py-2">
                <div class="d-flex align-items-center gap-2">
                    <div>{{ $qty }}x</div>
                    <div class="d-flex flex-column justify-content-start">
                        <div class="text-start">{{ $item->name }}</div>
                        <div class="text-start me-3">
                            @money($itemPrice, $this->currency, $this->convert)
                        </div>
                    </div>
                </div>
                <div class="flex-2 d-flex bg-white shadow-sm justify-content-between align-items-center rounded-5">
                    <button class="border-0 bg-transparent text-brand text-xxl"
                        wire:click="decreaseQuantity({{ $item->pivot->id }})">-</button>
                    <div class="fw-bold text-lg text-black mx-2">
                        {{ $this->yourItems[$item->pivot->id]['quantity'] ?? 0 }}</div>
                    <button class="border-0 bg-transparent text-brand text-xxl"
                        wire:click="increaseQuantity({{ $item->pivot->id }})">+</button>
                </div>
            </div>
        @endforeach
    </div>
</div>
<div>
    <div class="divider"></div>
    <div class="align-items-center d-flex justify-content-between py-2">
        <span>{{ __('Left to pay') }}</span>
        <span>@money($this->orderPriceWithTax - ($this->yourShare ?? 0), $this->currency, $this->convert)</span>
    </div>

    <div class="align-items-center d-flex justify-content-between fw-bold py-2">
        <span>{{ __('Your share') }}</span>
        <span>@money($this->yourShare ?? 0, $this->currency, $this->convert)</span>
    </div>
    <div class="text-start text-black-50">
        <span>{{ __('Incl. all taxes') }}</span>
    </div>
    <x-webapp.poweredBy />
    <div class="d-flex gap-2 justify-content-between mt-3">
        <x-webapp.button class="btn-brand-outline" wire:click="setBillView()">
            {{ __('Remove split') }}
        </x-webapp.button>
        <x-webapp.button class="btn-brand" :disabled="is_null($this->yourShare)" wire:click="confirm(false, true)">
            {{ __('Confirm') }}
        </x-webapp.button>
    </div>
</div>
