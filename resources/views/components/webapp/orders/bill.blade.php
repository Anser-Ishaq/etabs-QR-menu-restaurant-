<div>
    @if ($this->company->can_pickup)
        <x-webapp.button class="btn-dark w-100 mb-3" :href="$this->company->getConfig('disable_ordering', true)
            ? route('webapp.products.show', [
                'company' => $this->company->subdomain,
                'table' => $this->table->id,
            ])
            : '/api/download-pdf'">{{ __('View Menu') }}</x-webapp.button>
    @endif

    <p class="mb-3 fw-bolder">{{ __('Table') }}: {{ $this->table->name }}</p>
    <div class="order-items">
        <table class="table">
            <tbody>
                @foreach ($this->order->items as $item)
                    @php
                        $theItemPrice = $item->pivot->variant_price ? $item->pivot->variant_price : $item->price;
                        $qty = $item->pivot->qty;
                        if ($this->transactionItems->has($item->pivot->id)) {
                            $qty = $item->pivot->qty - $this->transactionItems->get($item->pivot->id);
                        }
                        $itemPrice = $theItemPrice * $qty + get_percent($theItemPrice, $item->pivot->vat, $qty);
                    @endphp
                    @if ($qty < 1)
                        @continue
                    @endif
                    <tr>
                        <td>{{ $qty }}x</td>
                        <td>{{ $item->name }}</td>
                        <td class="text-end">
                            @money($itemPrice, $this->currency, $this->convert)
                        </td>
                    </tr>


                    {{-- @if (strlen($item->pivot->variant_name) > 2)
                        <br />
                        <table class="table align-items-center">
                            <thead class="thead-light">
                                <tr>
                                    @foreach ($item->options as $option)
                                        <th>{{ $option->name }}</th>
                                    @endforeach
                                </tr>
                            </thead>
                            <tbody class="list">
                                <tr>
                                    @foreach (explode(',', $item->pivot->variant_name) as $optionValue)
                                        <td>{{ $optionValue }}</td>
                                    @endforeach
                                </tr>
                            </tbody>
                        </table>
                    @endif --}}

                    {{-- @if (strlen($item->pivot->extras) > 2)
                        <br /><span>{{ __('Extras') }}</span><br />
                        <ul>
                            @foreach (json_decode($item->pivot->extras) as $extra)
                                <li> {{ $extra }}</li>
                            @endforeach
                        </ul>
                        <br />
                    @endif --}}
                @endforeach
            </tbody>
        </table>
    </div>
</div>
<div>
    <div class="divider"></div>
    <div class="align-items-center d-flex justify-content-between fw-bold py-1 text-lg">
        <span>{{ __('Total amount due') }}</span>
        <span>@money($this->orderPriceWithTax, $this->currency, $this->convert)</span>
    </div>
    <div class="align-items-center d-flex justify-content-between text-black-50 pb-1">
        <span>{{ __('Incl. all taxes') }}</span>
    </div>
    <x-webapp.poweredBy />
    <div class="d-flex gap-2 justify-content-between mt-3">
        <x-webapp.button class="btn-brand-outline" data-bs-toggle="modal" data-bs-target="#SplitBill"
            @click="$wire.set('showModal', true)">
            {{ __('Split bill') }}
        </x-webapp.button>
        <x-webapp.button class="btn-brand" wire:click="confirm(true)">{{ __('Pay in full') }}</x-webapp.button>
    </div>
</div>

<!-- Modal -->
<div class="modal fade {{ $this->showModal ? 'show' : '' }}" id="SplitBill" tabindex="-1"
    aria-labelledby="SplitBillLabel" style="display: {{ $this->showModal ? 'block' : 'none' }};"
    data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title fw-bolder" id="SplitBillLabel">{{ __('Split the bill') }}</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                    @click="$wire.set('showModal', false)"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex flex-column gap-3">

                    <div class="p-3 rounded-5 border d-flex justify-content-start gap-3 align-items-center">
                        <div>
                            <input class="form-check-input" type="radio" name="splitBill"
                                wire:click="setSplitType('{{ \App\Enums\OrderPageType::PAY_EQUALLY }}')"
                                @checked(\App\Enums\OrderPageType::PAY_EQUALLY === $this->splitType) />
                        </div>
                        <div class="d-flex gap-2 align-items-center">
                            <span>{{ __('Pay for') }}</span>
                            <input type="number" style="width: 20%;" class="border border-secondary form-control py-0"
                                @if ($this->splitType !== \App\Enums\OrderPageType::PAY_EQUALLY) disabled @else wire:model.live="people" @endif>
                            <span>{{ __('of') }}</span>
                            <input type="number" style="width: 20%;" class="border border-secondary form-control py-0"
                                @if ($this->splitType !== \App\Enums\OrderPageType::PAY_EQUALLY) disabled @else  wire:model.live="totalPeople" @endif>
                            <span>{{ __('people') }}</span>
                        </div>
                    </div>

                    <div class="p-3 rounded-5 border d-flex justify-content-start gap-3 align-items-center">
                        <div>
                            <input class="form-check-input" type="radio" name="splitBill"
                                wire:click="setSplitType('{{ \App\Enums\OrderPageType::PAY_AMOUNT }}')"
                                @checked(\App\Enums\OrderPageType::PAY_AMOUNT === $this->splitType) />
                        </div>
                        <div class="d-flex gap-2 align-items-center">
                            <span>{{ __('Pay') }} {{ currency($this->currency)->getSymbol() }}</span>
                            <input type="number" style="width: 20%;" class="border border-secondary form-control py-0"
                                @if ($this->splitType !== \App\Enums\OrderPageType::PAY_AMOUNT) disabled @else wire:model.blur="yourShareValue" @endif>
                            <span>{{ __('of') }}</span>
                            <span class="fw-bolder">@money($this->orderPriceWithTax, $this->currency, $this->convert)</span>
                        </div>
                    </div>

                    <div class="p-3 rounded-5 border d-flex justify-content-start gap-3 align-items-center">
                        <div>
                            <input class="form-check-input" type="radio" name="splitBill"
                                wire:click="setSplitType('{{ \App\Enums\OrderPageType::PAY_YOUR_ITEMS }}')"
                                @checked(\App\Enums\OrderPageType::PAY_YOUR_ITEMS === $this->splitType) />
                        </div>
                        <div class="d-flex gap-2 align-items-center">
                            <span>{{ __('Pay for Your Items') }}</span>

                        </div>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="align-items-center d-flex justify-content-between py-2">
                    <span>{{ __('Your share') }}</span>
                    <span>@money($this->yourShare ?? 0, $this->currency, $this->convert)</span>
                </div>
                <div class="align-items-center d-flex justify-content-between py-2">
                    <span>{{ __('Left to pay') }}</span>
                    <span>@money($this->orderPriceWithTax - ($this->yourShare ?? 0), $this->currency, $this->convert)</span>
                </div>
                <div class="text-start text-black-50">
                    <span>{{ __('Incl. all taxes') }}</span>
                </div>
                <x-webapp.poweredBy class="py-2" />
                <x-webapp.button :disabled="$this->splitType === \App\Enums\OrderPageType::BILL" wire:click="confirm" class="btn-brand">
                    {{ __('Confirm') }}
                </x-webapp.button>
            </div>
        </div>
    </div>
</div>
