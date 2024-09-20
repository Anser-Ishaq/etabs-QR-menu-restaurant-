<?php extract(collect($attributes->getAttributes())->mapWithKeys(function ($value, $key) { return [Illuminate\Support\Str::camel(str_replace([':', '.'], ' ', $key)) => $value]; })->all(), EXTR_SKIP); ?>

<?php if (isset($component)) { $__componentOriginal424c1567b1e441318eca10602276d9aa = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal424c1567b1e441318eca10602276d9aa = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.orders.payYourItems','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.orders.payYourItems'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>

<?php echo e($slot ?? ""); ?>

 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal424c1567b1e441318eca10602276d9aa)): ?>
<?php $attributes = $__attributesOriginal424c1567b1e441318eca10602276d9aa; ?>
<?php unset($__attributesOriginal424c1567b1e441318eca10602276d9aa); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal424c1567b1e441318eca10602276d9aa)): ?>
<?php $component = $__componentOriginal424c1567b1e441318eca10602276d9aa; ?>
<?php unset($__componentOriginal424c1567b1e441318eca10602276d9aa); ?>
<?php endif; ?><?php /**PATH /var/www/html/storage/framework/views/3b29ecc9c120bb425d2641168a6ae369.blade.php ENDPATH**/ ?>