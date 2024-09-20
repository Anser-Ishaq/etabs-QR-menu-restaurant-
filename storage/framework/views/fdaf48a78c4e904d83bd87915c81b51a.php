<?php extract(collect($attributes->getAttributes())->mapWithKeys(function ($value, $key) { return [Illuminate\Support\Str::camel(str_replace([':', '.'], ' ', $key)) => $value]; })->all(), EXTR_SKIP); ?>

<?php if (isset($component)) { $__componentOriginal5234d121713536d10b44b75f6848dbc4 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal5234d121713536d10b44b75f6848dbc4 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.orders.bill','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.orders.bill'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>

<?php echo e($slot ?? ""); ?>

 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal5234d121713536d10b44b75f6848dbc4)): ?>
<?php $attributes = $__attributesOriginal5234d121713536d10b44b75f6848dbc4; ?>
<?php unset($__attributesOriginal5234d121713536d10b44b75f6848dbc4); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal5234d121713536d10b44b75f6848dbc4)): ?>
<?php $component = $__componentOriginal5234d121713536d10b44b75f6848dbc4; ?>
<?php unset($__componentOriginal5234d121713536d10b44b75f6848dbc4); ?>
<?php endif; ?><?php /**PATH /var/www/html/storage/framework/views/0b461a807a8d4d66b151283956ab7044.blade.php ENDPATH**/ ?>