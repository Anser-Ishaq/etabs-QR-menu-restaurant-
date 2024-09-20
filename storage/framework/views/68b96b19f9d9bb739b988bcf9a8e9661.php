<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag; ?>
<?php foreach($attributes->onlyProps([
    'asLink' => true,
    'disabled' => false,
]) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $attributes = $attributes->exceptProps([
    'asLink' => true,
    'disabled' => false,
]); ?>
<?php foreach (array_filter(([
    'asLink' => true,
    'disabled' => false,
]), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $__defined_vars = get_defined_vars(); ?>
<?php foreach ($attributes as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
} ?>
<?php unset($__defined_vars); ?>
<!--[if BLOCK]><![endif]--><?php if($asLink): ?>
    <a <?php echo e($attributes->class(['btn w-100 rounded-pill', 'disabled' => $disabled])); ?>>
        <?php echo e($label ?? $slot); ?>

    </a>
<?php else: ?>
    <button <?php echo e($attributes->class(['btn w-100 rounded-pill', 'disabled' => $disabled])->merge(['type' => 'button'])); ?>>
        <?php echo e($label ?? $slot); ?>

    </button>
<?php endif; ?><!--[if ENDBLOCK]><![endif]-->
<?php /**PATH /var/www/html/resources/views/components/webapp/button.blade.php ENDPATH**/ ?>