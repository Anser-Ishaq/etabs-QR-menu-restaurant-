<?php $__env->startSection('content'); ?>
<div class="header bg-gradient-default pb-6 pt-5 pt-md-8"">
</div>
<div class="container-fluid mt--7">
    <div class="row">
       
        <div class="col-xl-3 flex-row">
                <div class="nav-wrapper flex-row">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <ul class="nav nav-pills nav-fill flex-column" id="tabs-icons-text" role="tablist">

                                        <?php $__currentLoopData = $separators; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $separator): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <li class="nav-item pb-2">
                                                <a class="nav-link mb-sm-3 mb-md-0 <?php if($loop->first): ?> active <?php endif; ?>" id="<?php echo e($separator['snake']."_tab"); ?>" data-toggle="tab" href="#<?php echo e($separator['snake']); ?>" role="tab" aria-controls="<?php echo e($separator['snake']); ?>" aria-selected="true"><i class="<?php echo e($separator['icon']); ?> mr-2"></i><?php echo e($separator['name']); ?></a>
                                            </li>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        
                
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
        </div>
        <div class="col-xl-9 mt-3">
            <?php echo $__env->make('partials.flash', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <form id="restorant-apps-form" method="post" autocomplete="off" enctype="multipart/form-data" action="<?php echo e(route('admin.owner.updateApps',$company)); ?>">
                <?php echo csrf_field(); ?>
                <?php echo method_field('put'); ?>
                    <div class="card shadow">
                    
                        <div class="card-body">
                        
                                <div class="tab-content" id="myTabContent">
                                    <?php $__currentLoopData = $separators; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $separator): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="tab-pane fade show <?php if($loop->first): ?> active <?php endif; ?>" id="<?php echo e($separator['snake']); ?>" role="tabpanel" aria-labelledby="<?php echo e($separator['snake']); ?>">
                                            <?php echo $__env->make('partials.fields',['fields'=>$separator['fields']], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                
                                    
                                </div>
                                
                        </div>
                    
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success mt-4"><?php echo e(__('Save')); ?></button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', ['title' => __('Apps')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/resources/views/apps/company.blade.php ENDPATH**/ ?>