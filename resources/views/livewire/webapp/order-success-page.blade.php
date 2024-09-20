<div class="container">
    <div class="row justify-content-center">
        <div class="card shadow border-0 mt-8 col-lg-6 mx-auto">
            <div class="card-body d-flex flex-column h-screen justify-content-around text-center">
                <div>
                    <h1 class="display-4">{{ __('Payment Successful!') }}</h1>
                </div>
                <div class="justify-content-center text-center">
                    <x-svg-check />
                </div>
                <h3 class="text-success">
                    @if ($transaction->order->payment_status === 'paid')
                        {{ __('Bill paid in full to ') }}
                        {{ $transaction->order->restorant->name }}’s
                    @else
                        {{ __('Bill partially paid to ') }}
                        {{ $transaction->order->restorant->name }}’s
                </h3>
                @endif
                <h3>{{ __('Confirmation for Table') }}: {{ $transaction->order->table->name }}</h3>
                <x-webapp.poweredBy />
                @if ($transaction->order->payment_status === 'paid')
                    <div class="text-success p-2" style="background-color: lightgreen;">
                        {{ __('Your waiter knows your bill has been paid in full. Feel free to head out.') }}
                    </div>
                @else
                    <div class="p-2" style="background-color: #FFFFCC;color: darkgoldenrod;">
                        <span> {{ __('Your share of the bill is paid up') }}!</span>
                        <br />
                        <strong>
                            @money($transaction->order->remaining_price, $transaction->currency, false)
                            {{ __('remaining of total bill') }}.
                        </strong>
                    </div>
                @endif
                @if ($emailSent)
                    <h5 class="bg-success p-1 text-light">{{ __('Your receipt has been sent to your email!') }}</h5>
                @endif
                @if ($emailFailed)
                    <h5 class="bg-danger p-1 text-light">{{ __('Your receipt can not be sent to your email!') }}</h5>
                @endif
                <form wire:submit="sendEmail" class="d-flex flex-column gap-2 justify-content-between mt-3">
                    <input wire:model="email" class="form-control" placeholder="{{ __('Your email address') }}"
                        type="email" name="email" required />

                    <x-webapp.button :asLink="false" type="submit" class="btn-brand" :disabled="$emailSent || $emailFailed">
                        {{ __('Email my receipt') }}
                    </x-webapp.button>
                    <x-webapp.button class="btn-brand-outline"
                        href="{{ route('webapp.table.show', ['company' => $transaction->order->restorant->subdomain, 'table' => $transaction->order->table->id]) }}">
                        {{ __('Go to home') }}
                    </x-webapp.button>
                </form>
            </div>
        </div>
    </div>
</div>
