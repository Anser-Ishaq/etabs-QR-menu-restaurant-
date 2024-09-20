 <div class="d-flex flex-column justify-content-between gap-5 align-items-center h-100">
     <div>{{-- for css --}}</div>
     <div class="restaurant-logo bg-image border border-dark rounded-circle square {{ $this->step === 2 ? 'visible' : '' }}"
         style="visibility: hidden;background-image: url('{{ asset($this->company->logom) }}');background-color: white;background-size: contain;">
     </div>
     <div class="d-flex flex-column gap-2 w-100">
         <x-webapp.button class="btn-brand" wire:navigate :href="route('webapp.order.show', ['company' => $this->company->subdomain, 'table' => $this->table])">
             <div class="d-flex justify-content-center gap-1">
                 <span>{{ __('Pay now') }}</span>
                 @if ($this->finalPrice)
                     <span>|</span>
                     <span>
                         @money($this->finalPrice, config('settings.cashier_currency'), config('settings.do_convertion'))
                     </span>
                 @endif
             </div>
         </x-webapp.button>
         @if ($this->company->can_pickup)
             <x-webapp.button class="btn-brand-outline" :href="$this->company->getConfig('disable_ordering', true)
                 ? route('webapp.products.show', [
                     'company' => $this->company->subdomain,
                     'table' => $this->table,
                 ])
                 : '/api/download-pdf'">{{ __('View menu') }}</x-webapp.button>
         @endif
         <h2 class="font-futura text-white text-center mt-xs-4">{{ __('Hi') }} {{ $this->name }}!</h2>
     </div>
     <x-webapp.logo class="w-25 mb-3" />
 </div>
