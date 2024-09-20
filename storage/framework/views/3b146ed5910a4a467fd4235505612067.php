<div class="d-flex flex-column justify-content-center gap-5 align-items-center h-100">
    <?php if (isset($component)) { $__componentOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.logo','data' => ['class' => 'mb-3 w-75']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.logo'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'mb-3 w-75']); ?>
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
    <h4 class="text-white text-center"><?php echo e(__('Wait a sec whilst we prepare your bill')); ?>!</h4>
    <?php if (isset($component)) { $__componentOriginal37a666dabf9339cff1e17f0197e0966b = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal37a666dabf9339cff1e17f0197e0966b = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.loader','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.loader'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal37a666dabf9339cff1e17f0197e0966b)): ?>
<?php $attributes = $__attributesOriginal37a666dabf9339cff1e17f0197e0966b; ?>
<?php unset($__attributesOriginal37a666dabf9339cff1e17f0197e0966b); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal37a666dabf9339cff1e17f0197e0966b)): ?>
<?php $component = $__componentOriginal37a666dabf9339cff1e17f0197e0966b; ?>
<?php unset($__componentOriginal37a666dabf9339cff1e17f0197e0966b); ?>
<?php endif; ?>
</div>
<?php /**PATH /var/www/html/resources/views/components/webapp/home/loading.blade.php ENDPATH**/ ?>