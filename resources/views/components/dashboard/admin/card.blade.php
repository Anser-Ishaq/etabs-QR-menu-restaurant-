@props(['stat', 'id'])
<div {{ $attributes->class(['mt-3 col-lg-6']) }}>
    <div class="card card-stats mb-4 mb-xl-0">
        <div class="card-body">
            <div style="position: relative" class="row">
                <div class="col">
                    <h5 class="card-title text-uppercase text-muted mb-0">{{ $stat['title'] }}</h5>
                    <h2 class="h2 font-weight-bold mb-0" id="{{ $id }}">
                        {{ $stat['value'] }}
                    </h2>
                </div>
                <div style="position: absolute; right:0" class="col-auto">
                    <div class="icon icon-shape {{ $stat['iconBg'] }} text-white rounded-circle shadow">
                        <i class="fas {{ $stat['icon'] }}"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
