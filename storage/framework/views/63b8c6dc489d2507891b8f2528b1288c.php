<?php $__env->startSection('admin_title'); ?>
    <?php echo e(__('Restaurants')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <?php echo $__env->make('restorants.partials.modals', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>

    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col">
                <div class="card shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0"><?php echo e(__('Restaurants')); ?></h3>
                            </div>
                            <div class="col-4 text-right">
                                <?php if(auth()->user()->hasRole('admin')): ?>
                                    <a href="<?php echo e(route('admin.restaurants.create')); ?>"
                                        class="btn btn-sm btn-primary"><?php echo e(__('Add Restaurant')); ?></a>
                                <?php endif; ?>
                                <a href="<?php echo e(route('admin.restaurants.index')); ?>?downlodcsv=true"
                                    class="btn btn-sm btn-outline-primary"><?php echo e(__('Export CSV')); ?></a>
                                <?php if(auth()->user()->hasRole('admin') && config('settings.enable_import_csv')): ?>
                                    <button type="button" class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#modal-import-restaurants"><?php echo e(__('Import from CSV')); ?></button>
                                <?php endif; ?>
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
                                                <?php
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
                                                ?>
                                        
                                                <?php $__currentLoopData = $groupedOptions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $groupLabel => $options): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php if($options->isNotEmpty()): ?>
                                                        <div class="dropdown-submenu">
                                                            <a class="dropdown-item dropdown-toggle" href="#" data-group="<?php echo e($groupLabel); ?>"><?php echo e($groupLabel); ?></a>
                                                            <div class="dropdown-menu">
                                                                <?php $__currentLoopData = $options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <?php echo $option; ?>

                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            </div>
                                                        </div>
                                                    <?php endif; ?>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    



                                </div>

                            </div>

                        </div>


                    </div>

                    <div class="col-12">
                        <?php echo $__env->make('partials.flash', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col"><?php echo e(__('Name')); ?></th>
                                    <th scope="col"><?php echo e(__('Group')); ?></th>
                                    <th scope="col"><?php echo e(__('Owner')); ?></th>
                                    <th scope="col"><?php echo e(__('Owner email')); ?></th>
                                    <th scope="col"><?php echo e(__('Creation Date')); ?></th>
                                    <th scope="col"><?php echo e(__('Active')); ?></th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody id="restaurantTableBody">
                                <?php $__currentLoopData = $restorants; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $restorant): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr class="restaurant-row group-<?php echo e($restorant->user->restaurant_group); ?>">
                                        <?php if(auth()->user()->hasRole('manager')): ?>
                                            <td><a href="<?php echo e(route('admin.restaurants.loginas', $restorant)); ?>"><?php echo e($restorant->name); ?></a></td>
                                        <?php else: ?>
                                            <td><a href="<?php echo e(route('admin.restaurants.edit', $restorant)); ?>"><?php echo e($restorant->name); ?></a></td>
                                        <?php endif; ?>
                                        <td><?php echo e($restorant->user->restaurant_group); ?></td>
                                        <td><?php echo e($restorant->user ? $restorant->user->name : __('Deleted')); ?></td>
                                        <td>
                                            <a href="mailto: <?php echo e($restorant->user ? $restorant->user->email : ''); ?>"><?php echo e($restorant->user ? $restorant->user->email : __('Deleted')); ?></a>
                                        </td>
                                        <td><?php echo e($restorant->created_at->locale(Config::get('app.locale'))->isoFormat('LLLL')); ?></td>
                                        <td>
                                            <?php if($restorant->active == 1): ?>
                                                <span class="badge badge-success"><?php echo e(__('Active')); ?></span>
                                            <?php else: ?>
                                                <span class="badge badge-warning"><?php echo e(__('Not active')); ?></span>
                                            <?php endif; ?>
                                        </td>
                                        <td class="d-flex justify-content-end">
                                            <?php if($restorant->active == 0): ?>
                                                <a class="btn btn-primary btn-sm" href="<?php echo e(route('restaurant.activate', $restorant)); ?>"><?php echo e(__('Activate')); ?></a>
                                            <?php else: ?>
                                                <form action="<?php echo e(route('admin.restaurants.destroy', $restorant)); ?>" method="post" class="mb-0">
                                                <?php echo csrf_field(); ?>
                                                <?php echo method_field('delete'); ?>
                                                    <button class="btn btn-sm btn-warning" onclick="confirm('<?php echo e(__('Are you sure you want to deactivate this restaurant?')); ?>') ? this.parentElement.submit() : ''">
                                                        <?php echo e(__('Deactivate')); ?>

                                                    </button>
                                                </form>
                                            <?php endif; ?>
                                            <div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
                                                <a class="btn btn-info" href="<?php echo e(route('admin.restaurants.edit', $restorant)); ?>"><?php echo e(__('Edit')); ?></a>
                                                <a class="btn btn-dark" href="<?php echo e(route('admin.restaurants.loginas', $restorant)); ?>"><?php echo e(__('Login as')); ?></a>
                                                <?php if($hasCloner): ?>
                                                    <a class="btn btn-secondary" href="<?php echo e(route('admin.restaurants.create') . '?cloneWith=' . $restorant->id); ?>"><?php echo e(__('Clone it')); ?></a>
                                                <?php endif; ?>
                                                <a class="btn btn-danger" onclick="return confirm(' <?php echo e(__('Are you sure you want to delete this Restaurant from Database? This will also delete all data related to it. This is irreversible step.')); ?>')" href="<?php echo e(route('admin.restaurant.remove', $restorant)); ?>">
                                                    <?php echo e(__('Delete')); ?>

                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                        
                        
                        
                    </div>
                    <div class="card-footer py-4">
                        <nav class="d-flex justify-content-end" aria-label="...">
                            <?php echo e($restorants->links()); ?>

                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <?php echo $__env->make('layouts.footers.auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
    <script type="text/javascript">
        var resUrl = "<?php echo e(route('admin.restaurants.edit', 0)); ?>";
    </script>
<?php $__env->stopSection(); ?>
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

<?php echo $__env->make('layouts.app', ['title' => __('Restaurants')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/vagrant/Sites/lara2/resources/views/restorants/index.blade.php ENDPATH**/ ?>