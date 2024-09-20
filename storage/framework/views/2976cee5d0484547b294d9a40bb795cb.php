<div class="position-relative">
    <div class="d-flex flex-column h-screen justify-content-between align-items-center mx-auto pb-5 px-4"
        style="max-width: 600px;" x-on:load.window="$wire.loaded()">
        <!--[if BLOCK]><![endif]--><?php if($step === 1): ?>
            <?php if (isset($component)) { $__componentOriginal877620d256eb6fb2d2f85fad61b177e2 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal877620d256eb6fb2d2f85fad61b177e2 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.home.index','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.home'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal877620d256eb6fb2d2f85fad61b177e2)): ?>
<?php $attributes = $__attributesOriginal877620d256eb6fb2d2f85fad61b177e2; ?>
<?php unset($__attributesOriginal877620d256eb6fb2d2f85fad61b177e2); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal877620d256eb6fb2d2f85fad61b177e2)): ?>
<?php $component = $__componentOriginal877620d256eb6fb2d2f85fad61b177e2; ?>
<?php unset($__componentOriginal877620d256eb6fb2d2f85fad61b177e2); ?>
<?php endif; ?>
        <?php elseif($step === 2): ?>
            <?php if (isset($component)) { $__componentOriginal72b57d1a8774121f7705cd1a4ec12b97 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal72b57d1a8774121f7705cd1a4ec12b97 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.home.restaurant','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.home.restaurant'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal72b57d1a8774121f7705cd1a4ec12b97)): ?>
<?php $attributes = $__attributesOriginal72b57d1a8774121f7705cd1a4ec12b97; ?>
<?php unset($__attributesOriginal72b57d1a8774121f7705cd1a4ec12b97); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal72b57d1a8774121f7705cd1a4ec12b97)): ?>
<?php $component = $__componentOriginal72b57d1a8774121f7705cd1a4ec12b97; ?>
<?php unset($__componentOriginal72b57d1a8774121f7705cd1a4ec12b97); ?>
<?php endif; ?>
        <?php else: ?>
            <?php if (isset($component)) { $__componentOriginaleb8707ad25bd08864258675e9f46184d = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb8707ad25bd08864258675e9f46184d = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.home.loading','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.home.loading'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginaleb8707ad25bd08864258675e9f46184d)): ?>
<?php $attributes = $__attributesOriginaleb8707ad25bd08864258675e9f46184d; ?>
<?php unset($__attributesOriginaleb8707ad25bd08864258675e9f46184d); ?>
<?php endif; ?>
<?php if (isset($__componentOriginaleb8707ad25bd08864258675e9f46184d)): ?>
<?php $component = $__componentOriginaleb8707ad25bd08864258675e9f46184d; ?>
<?php unset($__componentOriginaleb8707ad25bd08864258675e9f46184d); ?>
<?php endif; ?>
        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
        <div class="text-nowrap text-white pb-2 <?php echo e(in_array($step, [1, 2]) ? 'visible' : ''); ?>"
            style="visibility: hidden;">
            <span><?php echo e(__('Find out more about ')); ?></span>
            <span><?php echo e(config('app.name')); ?></span>
            <span><?php echo e(__('on our')); ?></span>
            <a class="text-white" href="https://etabs.io"><?php echo e(__('website')); ?>.</a>
        </div>
    </div>
    <div class="-z-1 position-absolute top-0 left-0 h-100 w-100 bg-image <?php echo e($step === 2 ? 'visible' : ''); ?>"
        style="visibility: hidden; background-image: url('<?php echo e(asset($company->coverm)); ?>')"></div>
    <div class="-z-1 position-absolute top-0 left-0 h-100 w-100 d-block"
        style="<?php echo e($step === 2 ? 'opacity: 0.5;background: black;' : 'background: var(--km-main);'); ?>">
    </div>
</div>
<?php /**PATH /home/vagrant/Sites/lara2/resources/views/livewire/webapp/home.blade.php ENDPATH**/ ?>