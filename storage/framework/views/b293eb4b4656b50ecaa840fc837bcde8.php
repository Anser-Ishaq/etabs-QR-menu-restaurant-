<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag; ?>
<?php foreach($attributes->onlyProps([
    'dotColor' => 'white',
]) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $attributes = $attributes->exceptProps([
    'dotColor' => 'white',
]); ?>
<?php foreach (array_filter(([
    'dotColor' => 'white',
]), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $__defined_vars = get_defined_vars(); ?>
<?php foreach ($attributes as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
} ?>
<?php unset($__defined_vars); ?>
<div <?php echo e($attributes->class(['webapp-loader-container'])->merge()); ?>>
    <div class="webapp-loader" style="--bg:<?php echo e($dotColor); ?>;"></div>
    <div class="webapp-loader" style="--bg:<?php echo e($dotColor); ?>;--anime: .2s"></div>
    <div class="webapp-loader" style="--bg:<?php echo e($dotColor); ?>;--anime: .4s"></div>
</div>
<?php /**PATH /home/vagrant/Sites/lara2/resources/views/components/webapp/loader.blade.php ENDPATH**/ ?>