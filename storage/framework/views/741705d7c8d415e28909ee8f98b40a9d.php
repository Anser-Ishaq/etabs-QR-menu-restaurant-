<?php $__env->startSection('admin_title'); ?>
    <?php echo e(__('Finances')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>
    <div class="container-fluid mt--9">
        
        <div class="row">
            
            
        </div>

        <br />
        <div class="container mt-3">
            <div class="row justify-content-end mb-5 ml-4">
                <div class="col-xl-3 col-lg-6">
                    <select name="filter" id="filterSelect" class="form-control">
                        <option selected value="30">Last 30 days</option>
                        <option value="7">Last 7 days</option>
                        <option value="14">Last 14 days</option>
                        <option value="30">Last 30 days</option>
                        <option value="60">Last 60 days</option>
                        <option value="90">Last 90 days</option>
                    </select>
                </div>
            </div>
        </div>
        <!-- Info cards -->
        <?php if(isset($cards)): ?>                                                                                
            <?php echo $__env->make('partials.infoboxes.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?> 
        <?php endif; ?>


        <br />
        <div class="row">
            <div class="col">
                <!-- Order Card -->
                <?php echo $__env->make('orders.partials.ordercard',['financialReport'=>true], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
        </div>


    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', ['title' => __('Orders')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/resources/views/finances/index.blade.php ENDPATH**/ ?>