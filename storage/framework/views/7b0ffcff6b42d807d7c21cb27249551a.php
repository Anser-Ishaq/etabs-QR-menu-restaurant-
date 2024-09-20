<div>
    <div class="mb-3">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="display-1 fw-normal text-start"><?php echo e($this->order->client?->name); ?></h1>
            <button wire:click="setBillView()" class="btn-close" aria-label="Close"></button>
        </div>
        <div class="underline-border"></div>
        <h2 class="mt-2"><?php echo e(__('Pay for your items')); ?></h2>
    </div>
    <div class="order-items w-100" style="--h: 50vh">
        <!--[if BLOCK]><![endif]--><?php $__currentLoopData = $this->order->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php
                $theItemPrice = $item->pivot->variant_price ? $item->pivot->variant_price : $item->price;
                $qty = $item->pivot->qty;
                if ($this->transactionItems->has($item->pivot->id)) {
                    $qty = $item->pivot->qty - $this->transactionItems->get($item->pivot->id);
                }
                $itemPrice = $theItemPrice + get_percent($theItemPrice, $item->pivot->vat);
            ?>
            <!--[if BLOCK]><![endif]--><?php if($qty < 1): ?>
                <?php continue; ?>
            <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
            <div class="d-flex justify-content-between align-items-center py-2">
                <div class="d-flex align-items-center gap-2">
                    <div><?php echo e($qty); ?>x</div>
                    <div class="d-flex flex-column justify-content-start">
                        <div class="text-start"><?php echo e($item->name); ?></div>
                        <div class="text-start me-3">
                            <?php echo money($itemPrice, $this->currency, $this->convert); ?>
                        </div>
                    </div>
                </div>
                <div class="flex-2 d-flex bg-white shadow-sm justify-content-between align-items-center rounded-5">
                    <button class="border-0 bg-transparent text-brand text-xxl"
                        wire:click="decreaseQuantity(<?php echo e($item->pivot->id); ?>)">-</button>
                    <div class="fw-bold text-lg text-black mx-2">
                        <?php echo e($this->yourItems[$item->pivot->id]['quantity'] ?? 0); ?></div>
                    <button class="border-0 bg-transparent text-brand text-xxl"
                        wire:click="increaseQuantity(<?php echo e($item->pivot->id); ?>)">+</button>
                </div>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><!--[if ENDBLOCK]><![endif]-->
    </div>
</div>
<div>
    <div class="divider"></div>
    <div class="align-items-center d-flex justify-content-between py-2">
        <span><?php echo e(__('Left to pay')); ?></span>
        <span><?php echo money($this->orderPriceWithTax - ($this->yourShare ?? 0), $this->currency, $this->convert); ?></span>
    </div>

    <div class="align-items-center d-flex justify-content-between fw-bold py-2">
        <span><?php echo e(__('Your share')); ?></span>
        <span><?php echo money($this->yourShare ?? 0, $this->currency, $this->convert); ?></span>
    </div>
    <div class="text-start text-black-50">
        <span><?php echo e(__('Incl. all taxes')); ?></span>
    </div>
    <?php if (isset($component)) { $__componentOriginal3e73276385d46aec1e111dfa034c4f4a = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal3e73276385d46aec1e111dfa034c4f4a = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.poweredBy','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.poweredBy'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal3e73276385d46aec1e111dfa034c4f4a)): ?>
<?php $attributes = $__attributesOriginal3e73276385d46aec1e111dfa034c4f4a; ?>
<?php unset($__attributesOriginal3e73276385d46aec1e111dfa034c4f4a); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal3e73276385d46aec1e111dfa034c4f4a)): ?>
<?php $component = $__componentOriginal3e73276385d46aec1e111dfa034c4f4a; ?>
<?php unset($__componentOriginal3e73276385d46aec1e111dfa034c4f4a); ?>
<?php endif; ?>
    <div class="d-flex gap-2 justify-content-between mt-3">
        <?php if (isset($component)) { $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['class' => 'btn-brand-outline','wire:click' => 'setBillView()']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'btn-brand-outline','wire:click' => 'setBillView()']); ?>
            <?php echo e(__('Remove split')); ?>

         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9)): ?>
<?php $attributes = $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9; ?>
<?php unset($__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9); ?>
<?php endif; ?>
<?php if (isset($__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9)): ?>
<?php $component = $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9; ?>
<?php unset($__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9); ?>
<?php endif; ?>
        <?php if (isset($component)) { $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['class' => 'btn-brand','disabled' => is_null($this->yourShare),'wire:click' => 'confirm(false, true)']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'btn-brand','disabled' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(is_null($this->yourShare)),'wire:click' => 'confirm(false, true)']); ?>
            <?php echo e(__('Confirm')); ?>

         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9)): ?>
<?php $attributes = $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9; ?>
<?php unset($__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9); ?>
<?php endif; ?>
<?php if (isset($__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9)): ?>
<?php $component = $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9; ?>
<?php unset($__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9); ?>
<?php endif; ?>
    </div>
</div>
<?php /**PATH /var/www/html/resources/views/components/webapp/orders/payYourItems.blade.php ENDPATH**/ ?>