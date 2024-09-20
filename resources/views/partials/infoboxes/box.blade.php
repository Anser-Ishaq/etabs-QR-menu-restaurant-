<div class="card card-stats mb-4 mb-xl-0 mt-2">
    <div class="card-body">
        <div class="row">
            <div class="col">
                <h5 class="card-title text-uppercase text-muted mb-0">{{ __($card['title']) }}</h5>
                <span class="h2 font-weight-bold mb-0">{{ isset($card['isMoney']) && $card['isMoney'] ? money($card['value'], config('settings.cashier_currency'), config('settings.do_convertion')) : $card['value'] }}</span>
            </div>
            @if (isset($card['icon']))
                <div class="col-auto">
                    <div class="icon icon-shape {{ isset($card['icon_color']) ? $card['icon_color'] : '' }} bg-yellow text-white rounded-circle shadow">
                        <i class="{{ $card['icon'] }}"></i>
                    </div>
                </div>
            @endif
        </div>
    </div>
</div>
