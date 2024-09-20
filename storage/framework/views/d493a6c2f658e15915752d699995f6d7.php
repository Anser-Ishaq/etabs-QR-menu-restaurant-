<?php extract(collect($attributes->getAttributes())->mapWithKeys(function ($value, $key) { return [Illuminate\Support\Str::camel(str_replace([':', '.'], ' ', $key)) => $value]; })->all(), EXTR_SKIP); ?>

<?php if (isset($component)) { $__componentOriginal6ea9ca2080130985690c3ee12042ca40 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal6ea9ca2080130985690c3ee12042ca40 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.orders.payFull','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.orders.payFull'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>

<?php echo e($slot ?? ""); ?>

 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal6ea9ca2080130985690c3ee12042ca40)): ?>
<?php $attributes = $__attributesOriginal6ea9ca2080130985690c3ee12042ca40; ?>
<?php unset($__attributesOriginal6ea9ca2080130985690c3ee12042ca40); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal6ea9ca2080130985690c3ee12042ca40)): ?>
<?php $component = $__componentOriginal6ea9ca2080130985690c3ee12042ca40; ?>
<?php unset($__componentOriginal6ea9ca2080130985690c3ee12042ca40); ?>
<?php endif; ?><?php /**PATH /var/www/html/storage/framework/views/1d1b647663798a4a9921ed51dccc96c6.blade.php ENDPATH**/ ?>