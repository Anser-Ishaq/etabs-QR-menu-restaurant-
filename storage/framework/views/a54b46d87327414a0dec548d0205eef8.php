<div class="card card-profile">
    <div class="row justify-content-center">
        <div class="col-lg-3 order-lg-2">
            <div class="card-profile-image">
                <a href="#">
                    
                    <img src="https://www.gravatar.com/avatar/<?php echo e(md5($client->email)); ?>?d=mp" class="rounded-circle">
                </a>
            </div>
        </div>
    </div>
    <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
        <div class="d-flex justify-content-between">
            
            
        </div>
    </div>
    <div class="card-body pt-0">
        <div class="row">
            
            <div class="col">
                <div class="card-profile-stats d-flex justify-content-center">
                    <?php if(isset($orderCount)): ?>
                        <div>
                            <span class="heading"><?php echo e($orderCount); ?></span>
                            <span class="description"><?php echo e(__('Orders')); ?></span>
                        </div> 
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <div class="text-center">
            <h5 class="h3">
                <?php echo e($client->name); ?><span class="font-weight-light"></span>
            </h5>
            <div class="h5 font-weight-300">
                
                
            </div>
            <div class="h5 mt-4">
                <?php echo e($client->created_at->format(config('settings.datetime_display_format'))); ?>

            </div>
            
        </div>
    </div>
</div><?php /**PATH /var/www/html/resources/views/clients/profile.blade.php ENDPATH**/ ?>