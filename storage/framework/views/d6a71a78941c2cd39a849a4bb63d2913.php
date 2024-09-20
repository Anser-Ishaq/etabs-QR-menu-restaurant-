<div class="row">
    <?php $__currentLoopData = $cards; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $card): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php if(!in_array($card['title'], ['PROCESSOR FEE', 'Deliveries', 'DELIVERY INCOME', 'PLATFORM PROFIT'])): ?>
            <div class="col-xl-3 col-lg-6">
                <?php echo $__env->make('partials.infoboxes.box', ['card' => $card], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
        <?php endif; ?>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</div>
<?php /**PATH /var/www/html/resources/views/partials/infoboxes/index.blade.php ENDPATH**/ ?>