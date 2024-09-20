<style>
    /* #filterSelect{width: 100% !important; border: none !important} */
</style>

<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">

    <div class="container-fluid">
        <div class="header-body">
            <div class="container mt-3">
                <div class="row justify-content-end mb-5 ml-4">
                    <div class="col-xl-3 col-lg-6">
                        <select name="filter" id="filterSelect" class="form-control">
                            @foreach ($filters as $filterKey => $filter)
                                <option @selected($filter['selected']) value="{{ $filterKey }}">
                                    {{ $filter['name'] }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($stats[0] ?? [] as $statId => $stat)
                    <x-dashboard.admin.card class="col-xl-4" :stat="$stat" :id="$statId" />
                @endforeach
            </div>

            <br />
            @if (auth()->user()->hasRole('admin'))
                @if (config('app.isft'))
                    <div class="row">
                        <div class="col-xl-3 col-lg-6">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">
                                                {{ __('Delivery Fee') }} ( 30 {{ __('days') }} )</h5>
                                            <span class="h2 font-weight-bold mb-0"> @money(is_numeric($last30daysDeliveryFee) ? $last30daysDeliveryFee : 0, config('settings.cashier_currency'), config('settings.do_convertion'))</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                                                <i class="fas fa-truck"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">
                                                {{ __('Static Fee') }} ( 30 {{ __('days') }} )</h5>
                                            <span class="h2 font-weight-bold mb-0">@money(is_numeric($last30daysStaticFee) ? $last30daysStaticFee : 0, config('settings.cashier_currency'), config('settings.do_convertion'))</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                                                <i class="fas fa-chart-bar"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">
                                                {{ __('Dynamic Fee') }} ( 30 {{ __('days') }} )</h5>
                                            <span class="h2 font-weight-bold mb-0">@money(is_numeric($last30daysDynamicFee) ? $last30daysDynamicFee : 0, config('settings.cashier_currency'), config('settings.do_convertion'))</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                                                <i class="fas fa-percent"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-lg-6">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">
                                                {{ __('Total Fee') }} ( 30 {{ __('days') }} )</h5>
                                            <span class="h2 font-weight-bold mb-0">@money(is_numeric($last30daysTotalFee) ? $last30daysTotalFee : 0, config('settings.cashier_currency'), config('settings.do_convertion'))</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                                                <i class="fas fa-coins"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            @endif
        </div>
    </div>
</div>

@section('js')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const stats = @json($stats);
            const filterSelect = document.getElementById('filterSelect');

            $('#filterSelect').on('select2:select', function(e) {
                if (stats[this.value]) {
                    const ids = Object.keys(stats[this.value]);
                    for (let i = 0; i < ids.length; i++) {
                        const ele = document.getElementById(ids[i]);
                        if (ele && stats[this.value][ids[i]]['value']) {
                            ele.innerText = stats[this.value][ids[i]]['value']
                        }
                    }
                }
            });

            function isNumeric(value) {
                return !isNaN(value - parseFloat(value));
            }

            function formatMoney(amount, currency, doConversion) {
                return new Intl.NumberFormat('en-US', {
                    style: 'currency',
                    currency: currency,
                    minimumFractionDigits: 2
                }).format(amount);
            }
        });
    </script>
@endsection
