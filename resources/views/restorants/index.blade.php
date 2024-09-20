@extends('layouts.app', ['title' => __('Restaurants')])
@section('admin_title')
    {{ __('Restaurants') }}
@endsection
@section('content')
    @include('restorants.partials.modals')
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>

    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col">
                <div class="card shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Restaurants') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                @if (auth()->user()->hasRole('admin'))
                                    <a href="{{ route('admin.restaurants.create') }}"
                                        class="btn btn-sm btn-primary">{{ __('Add Restaurant') }}</a>
                                @endif
                                <a href="{{ route('admin.restaurants.index') }}?downlodcsv=true"
                                    class="btn btn-sm btn-outline-primary">{{ __('Export CSV') }}</a>
                                @if (auth()->user()->hasRole('admin') && config('settings.enable_import_csv'))
                                    <button type="button" class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#modal-import-restaurants">{{ __('Import from CSV') }}</button>
                                @endif
                                <button id="show-hide-filters" class="btn btn-icon btn-1 btn-sm btn-outline-secondary"
                                    type="button">
                                    <span class="btn-inner--icon"><i id="button-filters" class="ni ni-bold-down"></i></span>
                                </button>
                            </div>
                        </div>




                        <div class="tab-content orders-filters">
                            <br />
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="container mt-3">
                                        <div class="dropdown">
                                            <button class="btn btn-primary dropdown-toggle" type="button" id="restaurantDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Select a group
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="restaurantDropdown">
                                                @php
                                                $groupedOptions = \App\Models\Group::pluck('name')
                                                ->mapWithKeys(fn ($value) => [$value => collect()]);
                                        
                                                    foreach ($allRes as $key => $res) {
                                                        $restaurantGroup = $restaurantGroups
                                                            ->where('restaurant_id', $key)
                                                            ->first();
                                                        $group = $restaurantGroup
                                                            ? $restaurantGroup['restaurant_group']
                                                            : 'Individual';
                                                        $option =
                                                            '<a class="dropdown-item group-' .
                                                            $group .
                                                            '" href="#" data-value="' .
                                                            $key .
                                                            '" data-group="' .
                                                            $group .
                                                            '">' .
                                                            $res .
                                                            '</a>';
                                        
                                                        if (isset($groupedOptions[$group])) {
                                                            $groupedOptions[$group]->push($option);
                                                        }
                                                    }
                                                @endphp
                                        
                                                @foreach ($groupedOptions as $groupLabel => $options)
                                                    @if ($options->isNotEmpty())
                                                        <div class="dropdown-submenu">
                                                            <a class="dropdown-item dropdown-toggle" href="#" data-group="{{ $groupLabel }}">{{ $groupLabel }}</a>
                                                            <div class="dropdown-menu">
                                                                @foreach ($options as $option)
                                                                    {!! $option !!}
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                    @endif
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    



                                </div>

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
                                    <th scope="col">{{ __('Group') }}</th>
                                    <th scope="col">{{ __('Owner') }}</th>
                                    <th scope="col">{{ __('Owner email') }}</th>
                                    <th scope="col">{{ __('Creation Date') }}</th>
                                    <th scope="col">{{ __('Active') }}</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody id="restaurantTableBody">
                                @foreach ($restorants as $restorant)
                                    <tr class="restaurant-row group-{{ $restorant->user->restaurant_group }}">
                                        @if (auth()->user()->hasRole('manager'))
                                            <td><a href="{{ route('admin.restaurants.loginas', $restorant) }}">{{ $restorant->name }}</a></td>
                                        @else
                                            <td><a href="{{ route('admin.restaurants.edit', $restorant) }}">{{ $restorant->name }}</a></td>
                                        @endif
                                        <td>{{ $restorant->user->restaurant_group }}</td>
                                        <td>{{ $restorant->user ? $restorant->user->name : __('Deleted') }}</td>
                                        <td>
                                            <a href="mailto: {{ $restorant->user ? $restorant->user->email : '' }}">{{ $restorant->user ? $restorant->user->email : __('Deleted') }}</a>
                                        </td>
                                        <td>{{ $restorant->created_at->locale(Config::get('app.locale'))->isoFormat('LLLL') }}</td>
                                        <td>
                                            @if ($restorant->active == 1)
                                                <span class="badge badge-success">{{ __('Active') }}</span>
                                            @else
                                                <span class="badge badge-warning">{{ __('Not active') }}</span>
                                            @endif
                                        </td>
                                        <td class="d-flex justify-content-end">
                                            @if ($restorant->active == 0)
                                                <a class="btn btn-primary btn-sm" href="{{ route('restaurant.activate', $restorant) }}">{{ __('Activate') }}</a>
                                            @else
                                                <form action="{{ route('admin.restaurants.destroy', $restorant) }}" method="post" class="mb-0">
                                                @csrf
                                                @method('delete')
                                                    <button class="btn btn-sm btn-warning" onclick="confirm('{{ __('Are you sure you want to deactivate this restaurant?') }}') ? this.parentElement.submit() : ''">
                                                        {{ __('Deactivate') }}
                                                    </button>
                                                </form>
                                            @endif
                                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                                <a class="btn btn-info" href="{{ route('admin.restaurants.edit', $restorant) }}">{{ __('Edit') }}</a>
                                                <a class="btn btn-dark" href="{{ route('admin.restaurants.loginas', $restorant) }}">{{ __('Login as') }}</a>
                                                @if ($hasCloner)
                                                    <a class="btn btn-secondary" href="{{ route('admin.restaurants.create') . '?cloneWith=' . $restorant->id }}">{{ __('Clone it') }}</a>
                                                @endif
                                                <a class="btn btn-danger" onclick="return confirm(' {{ __('Are you sure you want to delete this Restaurant from Database? This will also delete all data related to it. This is irreversible step.') }}')" href="{{ route('admin.restaurant.remove', $restorant) }}">
                                                    {{ __('Delete') }}
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        
                        
                        
                    </div>
                    <div class="card-footer py-4">
                        <nav class="d-flex justify-content-end" aria-label="...">
                            {{ $restorants->links() }}
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        @include('layouts.footers.auth')
    </div>
    <script type="text/javascript">
        var resUrl = "{{ route('admin.restaurants.edit', 0) }}";
    </script>
@endsection
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // jQuery script to handle group visibility toggling
    $(document).ready(function() {
        $('.restaurantSearch').on('change', function() {
            var selectedGroup = $(this).val();
            $('.group-options').hide(); // Hide all groups initially
            $('optgroup[data-group="' + selectedGroup + '"]')
        .show(); // Show options of the selected group
        });
    });





    document.getElementById('restaurantSearch')?.addEventListener('change', function() {
        var selectedGroup = this.value;

        // Hide all restaurant options
        document.querySelectorAll('.restaurant-options').forEach(function(element) {
            element.style.display = 'none';
        });

        if (selectedGroup) {
            // Show the selected group's restaurant options
            var optionsContainer = document.querySelector('.group-' + selectedGroup);
            if (optionsContainer) {
                optionsContainer.style.display = 'block';
            }
        }
    });
</script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $('.dropdown-submenu a.dropdown-toggle').on('click', function(e) {
            e.stopPropagation();
            e.preventDefault();
            var submenu = $(this).next('.dropdown-menu');
            submenu.toggle();
        });

        $('.dropdown-menu a').on('click', function(e) {
            e.preventDefault();
            var restaurantId = $(this).data('value');
            if (restaurantId) {
                window.location.href = '/restaurants/' + restaurantId + '/edit';
            }
        });
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const dropdownItems = document.querySelectorAll('.dropdown-item[data-group]');
        const tableRows = document.querySelectorAll('.restaurant-row');

        function filterRows(selectedGroup) {
            tableRows.forEach(row => {
                const rowGroup = row.classList.contains('restaurant-row') ? row.classList[1].substring(6) : '';
                if (selectedGroup === 'All' || rowGroup === selectedGroup || (selectedGroup === 'Individual' && rowGroup === 'Individual')) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        dropdownItems.forEach(item => {
            item.addEventListener('click', function(event) {
                event.preventDefault();
                const selectedGroup = this.getAttribute('data-group');
                filterRows(selectedGroup);
            });
        });
    });
</script>





<style>
    .dropdown-submenu {
        position: relative;
    }

    .dropdown-submenu .dropdown-menu {
        top: 0;
        left: 100%;
        margin-top: -1px;
    }
</style>
