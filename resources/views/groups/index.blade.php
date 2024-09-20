@extends('layouts.app', ['title' => __('Groups')])
@section('admin_title')
    {{ __('Groups') }}
@endsection
@section('content')
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>

    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col">
                <div class="card shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Groups') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                @if (auth()->user()->hasRole('admin'))
                                    <a href="{{ route('admin.groups.create') }}"
                                        class="btn btn-sm btn-warning">{{ __('Add Group') }}</a>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        @include('partials.flash')
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">{{ __('Name') }}</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody id="restaurantTableBody">
                                @foreach ($groups as $group)
                                    <tr class="restaurant-row">
                                        <td>{{ $group->name }}</td>
                                        <td class="d-flex justify-content-end">
                                            <form class="btn-group btn-group-sm" role="group" aria-label="Basic example"
                                                method="POST" action="{{ route('admin.groups.destroy', $group) }}">
                                                @csrf
                                                @method('DELETE')
                                                <a class="btn btn-info"
                                                    href="{{ route('admin.groups.edit', $group) }}">{{ __('Edit') }}</a>
                                                <button class="btn btn-danger"
                                                    onclick="return confirm(' {{ __('Are you sure you want to delete this Restaurant from Database? This will also delete all data related to it. This is irreversible step.') }}')">
                                                    {{ __('Delete') }}
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer py-4">
                        <nav class="d-flex justify-content-end" aria-label="...">
                            {{ $groups->links() }}
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        @include('layouts.footers.auth')
    </div>
@endsection
