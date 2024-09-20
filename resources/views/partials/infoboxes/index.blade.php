<div class="row">
    @foreach ($cards as $card)
        @if (!in_array($card['title'], ['PROCESSOR FEE', 'Deliveries', 'DELIVERY INCOME', 'PLATFORM PROFIT']))
            <div class="col-xl-3 col-lg-6">
                @include('partials.infoboxes.box', ['card' => $card])
            </div>
        @endif
    @endforeach
</div>
