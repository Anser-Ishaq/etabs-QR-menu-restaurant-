<div class="card-body">
    <div class="timeline timeline-one-side" id="status-history" data-timeline-content="axis" data-timeline-axis-style="dashed">
    <?php $__currentLoopData = $order->stakeholders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$stakeholder): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    
        <div class="timeline-block">
            <span class="timeline-step badge-success">
                <i class="ni ni-bell-55"></i>
            </span>
            <div class="timeline-content">
                <div class="d-flex justify-content-between pt-1">
                    <div>
                        <span class="text-muted text-sm font-weight-bold">New Bill Started</span>
                    </div>
                    <div class="text-right">
                        <small class="text-muted"><i class="fas fa-clock mr-1"></i><?php echo e($stakeholder->pivot->created_at->locale(Config::get('app.locale'))->isoFormat('LLLL')); ?></small>
                    </div>
                </div>
                <h6 class="text-sm mt-1 mb-0"><?php echo e(__('Status from')); ?>: <?php echo e($stakeholder->name); ?></h6>
            </div>
        </div>
        <div class="timeline-block">
            <span class="timeline-step badge-success">
                <i class="ni ni-bell-55"></i>
            </span>
            <div class="timeline-content">
                <div class="d-flex justify-content-between pt-1">
                    <div>
                        <span class="text-muted text-sm font-weight-bold"> Payment </span>
                    </div>
                    <div class="text-right">
                        <small class="text-muted"><i class="fas fa-clock mr-1"></i><?php echo e($stakeholder->pivot->created_at->locale(Config::get('app.locale'))->isoFormat('LLLL')); ?></small>
                    </div>
                </div>
                <h6 class="text-sm mt-1 mb-0">-<?php echo e($order->order_price); ?> paid towards bil </h6>
            </div>
        </div>
        <div class="timeline-block">
            <span class="timeline-step badge-success">
                <i class="ni ni-bell-55"></i>
            </span>
            <div class="timeline-content">
                <div class="d-flex justify-content-between pt-1">
                    <div>
                        <span class="text-muted text-sm font-weight-bold"> Payment </span>
                    </div>
                    <div class="text-right">
                        <small class="text-muted"><i class="fas fa-clock mr-1"></i><?php echo e($stakeholder->pivot->created_at->locale(Config::get('app.locale'))->isoFormat('LLLL')); ?></small>
                    </div>
                </div>
                <h6 class="text-sm mt-1 mb-0">-<?php echo e($order->order_price); ?> paid towards bil</h6>
            </div>
        </div>
        <div class="timeline-block">
            <span class="timeline-step badge-success">
                <i class="ni ni-bell-55"></i>
            </span>
            <div class="timeline-content">
                <div class="d-flex justify-content-between pt-1">
                    <div>
                        <span class="text-muted text-sm font-weight-bold"> Bill Settled in Full </span>
                    </div>
                    <div class="text-right">
                        <small class="text-muted"><i class="fas fa-clock mr-1"></i><?php echo e($stakeholder->pivot->created_at->locale(Config::get('app.locale'))->isoFormat('LLLL')); ?></small>
                    </div>
                </div>
                <h6 class="text-sm mt-1 mb-0">No Outstanding Balance</h6>
            </div>
        </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
</div><?php /**PATH /var/www/html/resources/views/orders/partials/orderstatus.blade.php ENDPATH**/ ?>