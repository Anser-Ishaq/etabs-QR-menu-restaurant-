<x-layouts.webapp>
    <div class="container">
        <div class="row justify-content-center">
            <div class="card shadow border-0 mt-8 col-lg-6 mx-auto">
                <div class="card-body text-center">
                    <div class="swal2-icon swal2-error swal2-animate-error-icon" style="display: flex;"><span
                            class="swal2-x-mark"><span class="swal2-x-mark-line-left"></span><span
                                class="swal2-x-mark-line-right"></span></span></div>
                    <h2 class="display-2">{{ __('Order payment canceled!') }}</h2>
                    <h1 class="mb-4">
                        <span
                            class="badge badge-primary">{{ __('Order') . ' #' . $transaction->order->id_formated }}</span>
                    </h1>
                    <div class="d-flex justify-content-center">
                        <div class="col-8">
                            <h5 class="mt-0 mb-5 heading-small text-muted">
                                {{ __('You can make another try to pay.') }}
                            </h5>
                            <div class="d-flex justify-content-center align-items-baseline gap-2">
                                <h5>{{ __('Powered by') }}</h5><x-webapp.logo mode="dark" class="w-25" />
                            </div>
                            <x-webapp.button class="btn-brand-outline"
                                href="{{ route('webapp.table.show', ['company' => $transaction->order->restorant->subdomain, 'table' => $transaction->order->table->id]) }}">
                                {{ __('Go to home') }}
                            </x-webapp.button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-layouts.webapp>
