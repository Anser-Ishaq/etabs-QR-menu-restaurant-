@use('App\Enums\OrderPageType')

<div class="d-flex flex-column h-screen">
    @if ($componentName === OrderPageType::BILL)
        <div class="bg-image mb-4 position-relative"
            style="background-image: url('{{ asset($company->coverm) }}');height: 140px;">
            <div class="profile-image square bg-image rounded-circle position-absolute"
                style="--l: 100px;background-image: url('{{ asset($company->logom) }}');background-color: white;background-size: contain;">
            </div>
        </div>
    @endif
    <div @class([
        'text-center p-3 d-flex flex-column flex-grow-1 mx-auto w-100 h-100',
        'justify-content-evenly' => is_null($order),
        'justify-content-between' => !is_null($order),
    ]) style="max-width: 700px;">
        @if (is_null($order))
            <div class="d-flex justify-content-center">
                <h1 class="font-futura" wire:loading.remove>
                    {{ __('You can pay your bill here once you’ve placed an order') }}!
                </h1>
                <x-webapp.loader dotColor="var(--km-main)" wire:loading.flex />
            </div>
            <div class="d-flex flex-column gap-4">
                <x-webapp.button asLink="false" class="btn-brand" wire:click="$refresh">
                    {{ __('Try again') }}
                </x-webapp.button>
                @if ($this->company->can_pickup)
                    <x-webapp.button :href="$this->company->getConfig('disable_ordering', true)
                        ? route('webapp.products.show', [
                            'company' => $this->company->subdomain,
                            'table' => $this->table->id,
                        ])
                        : '/api/download-pdf'" class="btn-brand-outline">
                        {{ __('View menu') }}
                    </x-webapp.button>
                @endif
            </div>
        @else
            <x-dynamic-component :component="$componentName->name()" />
        @endif
    </div>
</div>
@script
    <script>
        document.addEventListener("drawDonutChart", () => {
            $wire.setViewPort(getWidthForCanvas());
        });
    </script>
@endscript
