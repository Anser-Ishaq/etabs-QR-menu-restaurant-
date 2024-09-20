<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag; ?>
<?php foreach($attributes->onlyProps([
    'prefix' => '',
    'suffix' => '',
    'wireKey' => 'People',
    'wireValue' => null,
    'total' => null,
    'live' => false,
    'size' => '1.5rem',
    'length' => '40px',
]) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $attributes = $attributes->exceptProps([
    'prefix' => '',
    'suffix' => '',
    'wireKey' => 'People',
    'wireValue' => null,
    'total' => null,
    'live' => false,
    'size' => '1.5rem',
    'length' => '40px',
]); ?>
<?php foreach (array_filter(([
    'prefix' => '',
    'suffix' => '',
    'wireKey' => 'People',
    'wireValue' => null,
    'total' => null,
    'live' => false,
    'size' => '1.5rem',
    'length' => '40px',
]), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $__defined_vars = get_defined_vars(); ?>
<?php foreach ($attributes as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
} ?>
<?php unset($__defined_vars); ?>
<div <?php echo e($attributes->class(['d-flex align-items-center w-100 overflow-hidden max-w-screen gap-3'])); ?>>
    <!--[if BLOCK]><![endif]--><?php if($prefix): ?>
        <div class="text-break flex-1"><?php echo e($prefix); ?></div>
    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
    <div class="text-break flex-2 d-flex counter justify-content-between bg-dark align-items-center rounded-pill">
        <button class="square rounded-circle border-0 fw-bold bg-white text-black"
            style="margin: 5px;font-size: <?php echo e($size); ?>;--l:<?php echo e($length); ?>"
            <?php if($live): ?> wire:click="decrease<?php echo e($wireKey); ?>('<?php echo e($wireValue); ?>')" <?php endif; ?>>-</button>
        <div class="fw-bold text-white mx-3" style="font-size: <?php echo e($size); ?>;--l:<?php echo e($length); ?>">
            <?php echo e($total ?? $this->people); ?></div>
        <button class="square rounded-circle border-0 fw-bold bg-white text-black"
            style="margin: 5px;font-size: <?php echo e($size); ?>;--l:<?php echo e($length); ?>"
            <?php if($live): ?> wire:click="increase<?php echo e($wireKey); ?>('<?php echo e($wireValue); ?>')" <?php endif; ?>>+</button>
    </div>
    <!--[if BLOCK]><![endif]--><?php if($suffix): ?>
        <div class="text-break flex-1"><?php echo e($suffix); ?></div>
    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
</div>
<?php /**PATH /var/www/html/resources/views/components/webapp/counter.blade.php ENDPATH**/ ?>