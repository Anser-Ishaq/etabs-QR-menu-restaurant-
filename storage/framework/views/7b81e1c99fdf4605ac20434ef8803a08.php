<form class="d-flex flex-column justify-content-center gap-5 align-items-center h-100" wire:submit="addName"
    method="post">
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
    <?php if (isset($component)) { $__componentOriginalc7e4a43f4ffaff72826c23cdc992ea37 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalc7e4a43f4ffaff72826c23cdc992ea37 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.input','data' => ['wire:model' => 'name','class' => 'focus-none','placeholder' => ''.e(__('Enter name')).'','required' => true]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.input'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['wire:model' => 'name','class' => 'focus-none','placeholder' => ''.e(__('Enter name')).'','required' => true]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalc7e4a43f4ffaff72826c23cdc992ea37)): ?>
<?php $attributes = $__attributesOriginalc7e4a43f4ffaff72826c23cdc992ea37; ?>
<?php unset($__attributesOriginalc7e4a43f4ffaff72826c23cdc992ea37); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc7e4a43f4ffaff72826c23cdc992ea37)): ?>
<?php $component = $__componentOriginalc7e4a43f4ffaff72826c23cdc992ea37; ?>
<?php unset($__componentOriginalc7e4a43f4ffaff72826c23cdc992ea37); ?>
<?php endif; ?>
    <button class="btn" type="submit">
        <i class="arrow-right"></i><i class="arrow-right"></i><i class="arrow-right"></i>
    </button>
</form>
<?php /**PATH /home/vagrant/Sites/lara2/resources/views/components/webapp/home/index.blade.php ENDPATH**/ ?>