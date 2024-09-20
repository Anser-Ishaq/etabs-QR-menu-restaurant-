<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag; ?>
<?php foreach($attributes->onlyProps([
    'width' => '3.5rem',
    'mode' => 'dark',
]) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $attributes = $attributes->exceptProps([
    'width' => '3.5rem',
    'mode' => 'dark',
]); ?>
<?php foreach (array_filter(([
    'width' => '3.5rem',
    'mode' => 'dark',
]), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
} ?>
<?php $__defined_vars = get_defined_vars(); ?>
<?php foreach ($attributes as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
} ?>
<?php unset($__defined_vars); ?>
<div <?php echo e($attributes->class('d-flex justify-content-center align-items-baseline gap-2')); ?>>
    <p class="mb-0"><?php echo e(__('Powered by')); ?></p>
    <?php if (isset($component)) { $__componentOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.logo','data' => ['mode' => $mode,'style' => 'width: '.e($width).'']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.logo'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['mode' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($mode),'style' => 'width: '.e($width).'']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1)): ?>
<?php $attributes = $__attributesOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1; ?>
<?php unset($__attributesOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1)): ?>
<?php $component = $__componentOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1; ?>
<?php unset($__componentOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1); ?>
<?php endif; ?>
</div>
<?php /**PATH /var/www/html/resources/views/components/webapp/poweredBy.blade.php ENDPATH**/ ?>