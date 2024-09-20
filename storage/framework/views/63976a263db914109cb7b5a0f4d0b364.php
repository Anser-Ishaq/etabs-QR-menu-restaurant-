<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag; ?>
<?php foreach($attributes->onlyProps(['stat', 'id']) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $attributes = $attributes->exceptProps(['stat', 'id']); ?>
<?php foreach (array_filter((['stat', 'id']), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $__defined_vars = get_defined_vars(); ?>
<?php foreach ($attributes as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
} ?>
<?php unset($__defined_vars); ?>
<div <?php echo e($attributes->class(['mt-3 col-lg-6'])); ?>>
    <div class="card card-stats mb-4 mb-xl-0">
        <div class="card-body">
            <div style="position: relative" class="row">
                <div class="col">
                    <h5 class="card-title text-uppercase text-muted mb-0"><?php echo e($stat['title']); ?></h5>
                    <h2 class="h2 font-weight-bold mb-0" id="<?php echo e($id); ?>">
                        <?php echo e($stat['value']); ?>

                    </h2>
                </div>
                <div style="position: absolute; right:0" class="col-auto">
                    <div class="icon icon-shape <?php echo e($stat['iconBg']); ?> text-white rounded-circle shadow">
                        <i class="fas <?php echo e($stat['icon']); ?>"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php /**PATH /var/www/html/resources/views/components/dashboard/admin/card.blade.php ENDPATH**/ ?>