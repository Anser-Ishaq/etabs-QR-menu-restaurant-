<thead class="thead-light">
    <tr>
        <th scope="col">{{ __('ID') }}</th>
        @hasrole('admin|driver')
            <th scope="col">{{ __('Restaurant') }}</th>
        @endhasrole
        <th class="table-web" scope="col">{{ __('Created') }}</th>
        <th class="table-web" scope="col">{{ !config('settings.is_whatsapp_ordering_mode') ? __('Table / Area') : __('Method') }}</th>
        @if (!isset($hideAction))
            <th class="table-web" scope="col">{{ __('Items') }}</th>
        @endif
        <th class="table-web" scope="col">{{ __('Total') }}</th>
        <th scope="col">{{ __('Status') }}</th>
        @if (!isset($hideAction))
            <th scope="col">{{ __('Actions') }}</th>
        @endif
    </tr>
</thead>
<tbody>
@foreach($orders as $order)
{{-- @dd($orders) --}}
<tr>
    <td>
        
        <a class="btn badge badge-success badge-pill" href="{{ route('orders.show',$order->id )}}">#{{ $order->id_formated }}</a>
    </td>
    @hasrole('admin|driver')
    <th scope="row">
        <div class="media align-items-center">
            <a class="avatar-custom mr-3">
                <img class="rounded" alt="..." src={{ $order->restorant->icon }}>
            </a>
            <div class="media-body">
                <span class="mb-0 text-sm">{{ $order->restorant->name }}</span>
            </div>
        </div>
    </th>
    @endif

    <td class="table-web">
        {{ $order->created_at->locale(Config::get('app.locale'))->isoFormat('LLLL')  }}
    </td>
    <td class="table-web">
        {{ $order->table?->getFullNameAttribute() }}
    </td>
    @if (!isset($hideAction))
        <td class="table-web">
            {{ count($order->items) }}
        </td>
    @endif
    <td class="table-web">
        @money($order->sub_total, config('settings.cashier_currency'),config('settings.do_convertion'))
    </td>
    <td>
        @if ($order->situation)
            {!! $order->situation->badge() !!}
        @endif
        {{-- @include('orders.partials.laststatus') --}}
    </td>
    @if (!isset($hideAction))
        @include('orders.partials.actions.table',['order' => $order ]) 
    @endif
    
</tr>
@endforeach
</tbody>
