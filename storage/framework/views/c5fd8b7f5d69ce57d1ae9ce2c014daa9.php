<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag; ?>
<?php foreach($attributes->onlyProps([
    'mode' => 'light',
]) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $attributes = $attributes->exceptProps([
    'mode' => 'light',
]); ?>
<?php foreach (array_filter(([
    'mode' => 'light',
]), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $__defined_vars = get_defined_vars(); ?>
<?php foreach ($attributes as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
} ?>
<?php unset($__defined_vars); ?>
<div <?php echo e($attributes->class(['text-center'])); ?>>
    <img src='<?php echo e(asset("assets/images/logo-$mode.png")); ?>' alt="logo" class="img-fluid">
</div>
<?php /**PATH /home/vagrant/Sites/lara2/resources/views/components/webapp/logo.blade.php ENDPATH**/ ?>