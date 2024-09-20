<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $subjectTitle }}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 12px;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .bg-image {
            display: block;
            margin: 0 auto;
            width: 120px;
            height: 120px;
            background-size: cover;
            background-position: center;
        }

        .divider {
            height: 2px;
            background-color: lightgray;
            margin: 8px 0;
        }

        .text-center {
            text-align: center;
        }

        .text-gray {
            color: gray;
        }

        .fw-bold {
            font-weight: bold;
        }

        .financial-details,
        .order-items {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        .financial-details td,
        .order-items td {
            padding: 6px;
        }

        .financial-details td:first-child,
        .order-items td:first-child {
            text-align: left;
        }

        .financial-details td:last-child,
        .order-items td:last-child {
            text-align: right;
        }

        .footer-table {
            margin: 10px auto;
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h2 style="margin: 0;">Your {{ $transaction->order->restorant->name }}'s Receipt</h2>
            <div class="bg-image" style="background-image: url('{{ asset($transaction->order->restorant->logom) }}');">
            </div>
            <h4 style="margin: 0;">{{ $transaction->order->restorant->address }}</h4>
        </div>
        <div class="divider"></div>
        <div class="text-center">
            {{ __('Table') }}: {{ $transaction->order->table->name }}
        </div>

        <table class="order-items">
            @if ($transaction->items->isNotEmpty())
                @foreach ($transaction->items as $item)
                    @php($theItemPrice = $item->variant_price ? $item->variant_price : $item->orderItem->item->price)
                    <tr>
                        <td>
                            <span>{{ $item->quantity }}x {{ $item->orderItem->item->name }}</span>
                        </td>
                        <td style="text-align: end;">
                            @money($theItemPrice * $item->quantity + $item->vatvalue, $transaction->currency, config('settings.do_convertion'))
                        </td>
                    </tr>
                @endforeach
            @else
                @foreach ($transaction->order->items as $item)
                    @php($theItemPrice = $item->pivot->variant_price ? $item->pivot->variant_price : $item->price)
                    @if ($item->pivot->qty > 0)
                        <tr>
                            <td>
                                <span>{{ $item->pivot->qty }}x {{ $item->name }}</span>
                            </td>
                            <td style="text-align: end;">
                                @money($theItemPrice * $item->pivot->qty + $item->pivot->vatvalue, $transaction->currency, config('settings.do_convertion'))
                            </td>
                        </tr>
                    @endif
                @endforeach
            @endif

        </table>
        <div class="divider"></div>

        <table class="financial-details">
            <tr class="text-gray">
                <td>{{ __('VAT') }} (@ 15%)</td>
                <td style="text-align: end;">
                    @money($transaction->tax, $transaction->currency, config('settings.do_convertion'))
                </td>
            </tr>
            <tr class="fw-bold">
                <td>{{ __('Total incl. VAT') }}</td>
                <td style="text-align: end;">
                    @money($transaction->amount_with_tax, $transaction->currency, config('settings.do_convertion'))
                </td>
            </tr>
            <tr class="text-gray">
                <td>{{ __('Tip') }}</td>
                <td style="text-align: end;">
                    @money($transaction->tip, $transaction->currency, config('settings.do_convertion'))
                </td>
            </tr>
            <tr class="text-gray">
                <td>{{ __('Service fee') }}</td>
                <td style="text-align: end;">
                    @money($transaction->service, $transaction->currency, config('settings.do_convertion'))
                </td>
            </tr>
            <tr class="fw-bold">
                <td>{{ __('Total amount paid') }}</td>
                <td style="text-align: end;">
                    @money($transaction->total, $transaction->currency, config('settings.do_convertion'))
                </td>
            </tr>
        </table>
        <div class="divider"></div>
        @if ($transaction->order->payment_status === 'paid')
            @if ($transaction->payment_method)
                <div style="margin-bottom: 1rem;">
                    <span>{{ __('Paid with') }}:</span>
                    <span>{{ str($transaction->payment_method)->headline() }}</span>
                    @if ($transaction->last4)
                        <span>****{{ $transaction->last4 }}</span>
                    @endif
                </div>
            @endif
            <div style="margin-bottom: 1rem;" class="fw-bold">
                <span>{{ __('Bill closed') }}:</span>
                <span>{{ $transaction->order->updated_at->format('d/m/Y, h:i A') }}</span>
            </div>
        @endif
        <table class="footer-table">
            <tr>
                <td class="text-center">
                    <p class="mb-0" style="padding-bottom: 6px;">{{ __('Powered by') }}</p>
                </td>
                <td>
                    <img src='{{ asset('assets/images/logo-dark.png') }}' alt="logo"
                        style="max-width: 50px; height: auto;">
                </td>
            </tr>
        </table>
    </div>
</body>

</html>
