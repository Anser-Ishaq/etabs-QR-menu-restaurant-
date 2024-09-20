@extends('general.index', $setup)
@section('tbody')
    @foreach ($setup['items'] as $item)
        <tr>
            <td>{{ $item->name }}</td>
            <td>{{ $item->size }}</td>
            <td>{{ $item->restoarea ? $item->restoarea->name : '' }}</td>
            <td>{{ $item->waiter_name }}</td>
            <td>
                <?php
                $param[$setup['parameter_name']] = $item->id;
                ?>
                @if ($setup['hasQR'])
                    <a href="{{ route('download.menu', [
                        'filename' => 'table' . $item->name,
                        'code' => route('webapp.table.show', [
                            'table' => $item->id,
                            'company' => auth()->user()->restorant->subdomain,
                        ]),
                    ]) }}"
                        class="btn btn-success btn-sm">
                        <span class="btn-inner--icon">
                            <i class="fas fa-qrcode"></i>
                        </span>
                        <span>{{ __('Table QR') }}</span>
                    </a>
                @endif
                <a href="{{ route($setup['webroute_path'] . 'edit', $param) }}" class="btn btn-primary btn-sm">
                    <span class="btn-inner--icon"><i class="ni ni-ruler-pencil"></i></span>
                    <span>{{ __('crud.edit') }}</span>
                </a>
                <a href="{{ route($setup['webroute_path'] . 'delete', $param) }}" class="btn btn-danger btn-sm">
                    <span class="btn-inner--icon"><i class="ni ni-fat-remove"></i></span>
                    <span>{{ __('crud.delete') }}</span>
                </a>
                @if ($setup['hasQR'] && $item->orders_count > 0)
                    <a href="{{ route('download.menu', [
                        'filename' => 'order-of-' . $item->name,
                        'code' => route('webapp.order.show', [
                            'table' => $item->id,
                            'company' => auth()->user()->restorant->subdomain,
                        ]),
                    ]) }}"
                        class="btn btn-success btn-sm">
                        <span class="btn-inner--icon">
                            <i class="fas fa-qrcode"></i>
                        </span>
                        <span>{{ __('Order QR') }}</span>
                    </a>
                @endif
            </td>
        </tr>
    @endforeach
@endsection
