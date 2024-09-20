<?php $__env->startSection('admin_title'); ?>
    <?php echo e(__('Groups')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>

    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col">
                <div class="card shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0"><?php echo e(__('Groups')); ?></h3>
                            </div>
                            <div class="col-4 text-right">
                                <?php if(auth()->user()->hasRole('admin')): ?>
                                    <a href="<?php echo e(route('admin.groups.create')); ?>"
                                        class="btn btn-sm btn-warning"><?php echo e(__('Add Group')); ?></a>
                                <?php endif; ?>
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
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody id="restaurantTableBody">
                                <?php $__currentLoopData = $groups; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $group): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr class="restaurant-row">
                                        <td><?php echo e($group->name); ?></td>
                                        <td class="d-flex justify-content-end">
                                            <form class="btn-group btn-group-sm" role="group" aria-label="Basic example"
                                                method="POST" action="<?php echo e(route('admin.groups.destroy', $group)); ?>">
                                                <?php echo csrf_field(); ?>
                                                <?php echo method_field('DELETE'); ?>
                                                <a class="btn btn-info"
                                                    href="<?php echo e(route('admin.groups.edit', $group)); ?>"><?php echo e(__('Edit')); ?></a>
                                                <button class="btn btn-danger"
                                                    onclick="return confirm(' <?php echo e(__('Are you sure you want to delete this Restaurant from Database? This will also delete all data related to it. This is irreversible step.')); ?>')">
                                                    <?php echo e(__('Delete')); ?>

                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer py-4">
                        <nav class="d-flex justify-content-end" aria-label="...">
                            <?php echo e($groups->links()); ?>

                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <?php echo $__env->make('layouts.footers.auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', ['title' => __('Groups')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/resources/views/groups/index.blade.php ENDPATH**/ ?>