<div>
    <!--[if BLOCK]><![endif]--><?php if($this->company->can_pickup): ?>
        <?php if (isset($component)) { $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['class' => 'btn-dark w-100 mb-3','href' => $this->company->getConfig('disable_ordering', true)
            ? route('webapp.products.show', [
                'company' => $this->company->subdomain,
                'table' => $this->table->id,
            ])
            : '/api/download-pdf']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'btn-dark w-100 mb-3','href' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($this->company->getConfig('disable_ordering', true)
            ? route('webapp.products.show', [
                'company' => $this->company->subdomain,
                'table' => $this->table->id,
            ])
            : '/api/download-pdf')]); ?><?php echo e(__('View Menu')); ?> <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9)): ?>
<?php $attributes = $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9; ?>
<?php unset($__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9); ?>
<?php endif; ?>
<?php if (isset($__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9)): ?>
<?php $component = $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9; ?>
<?php unset($__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9); ?>
<?php endif; ?>
    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->

    <p class="mb-3 fw-bolder"><?php echo e(__('Table')); ?>: <?php echo e($this->table->name); ?></p>
    <div class="order-items">
        <table class="table">
            <tbody>
                <!--[if BLOCK]><![endif]--><?php $__currentLoopData = $this->order->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                        $theItemPrice = $item->pivot->variant_price ? $item->pivot->variant_price : $item->price;
                        $qty = $item->pivot->qty;
                        if ($this->transactionItems->has($item->pivot->id)) {
                            $qty = $item->pivot->qty - $this->transactionItems->get($item->pivot->id);
                        }
                        $itemPrice = $theItemPrice * $qty + get_percent($theItemPrice, $item->pivot->vat, $qty);
                    ?>
                    <!--[if BLOCK]><![endif]--><?php if($qty < 1): ?>
                        <?php continue; ?>
                    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                    <tr>
                        <td><?php echo e($qty); ?>x</td>
                        <td><?php echo e($item->name); ?></td>
                        <td class="text-end">
                            <?php echo money($itemPrice, $this->currency, $this->convert); ?>
                        </td>
                    </tr>


                    

                    
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><!--[if ENDBLOCK]><![endif]-->
            </tbody>
        </table>
    </div>
</div>
<div>
    <div class="divider"></div>
    <div class="align-items-center d-flex justify-content-between fw-bold py-1 text-lg">
        <span><?php echo e(__('Total amount due')); ?></span>
        <span><?php echo money($this->orderPriceWithTax, $this->currency, $this->convert); ?></span>
    </div>
    <div class="align-items-center d-flex justify-content-between text-black-50 pb-1">
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
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['class' => 'btn-brand-outline','dataBsToggle' => 'modal','dataBsTarget' => '#SplitBill','@click' => '$wire.set(\'showModal\', true)']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'btn-brand-outline','data-bs-toggle' => 'modal','data-bs-target' => '#SplitBill','@click' => '$wire.set(\'showModal\', true)']); ?>
            <?php echo e(__('Split bill')); ?>

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
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['class' => 'btn-brand','wire:click' => 'confirm(true)']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'btn-brand','wire:click' => 'confirm(true)']); ?><?php echo e(__('Pay in full')); ?> <?php echo $__env->renderComponent(); ?>
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

<!-- Modal -->
<div class="modal fade <?php echo e($this->showModal ? 'show' : ''); ?>" id="SplitBill" tabindex="-1"
    aria-labelledby="SplitBillLabel" style="display: <?php echo e($this->showModal ? 'block' : 'none'); ?>;"
    data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title fw-bolder" id="SplitBillLabel"><?php echo e(__('Split the bill')); ?></h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                    @click="$wire.set('showModal', false)"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex flex-column gap-3">

                    <div class="p-3 rounded-5 border d-flex justify-content-start gap-3 align-items-center">
                        <div>
                            <input class="form-check-input" type="radio" name="splitBill"
                                wire:click="setSplitType('<?php echo e(\App\Enums\OrderPageType::PAY_EQUALLY); ?>')"
                                <?php if(\App\Enums\OrderPageType::PAY_EQUALLY === $this->splitType): echo 'checked'; endif; ?> />
                        </div>
                        <div class="d-flex gap-2 align-items-center">
                            <span><?php echo e(__('Pay for')); ?></span>
                            <input type="number" style="width: 20%;" class="border border-secondary form-control py-0"
                                <?php if($this->splitType !== \App\Enums\OrderPageType::PAY_EQUALLY): ?> disabled <?php else: ?> wire:model.live="people" <?php endif; ?>>
                            <span><?php echo e(__('of')); ?></span>
                            <input type="number" style="width: 20%;" class="border border-secondary form-control py-0"
                                <?php if($this->splitType !== \App\Enums\OrderPageType::PAY_EQUALLY): ?> disabled <?php else: ?>  wire:model.live="totalPeople" <?php endif; ?>>
                            <span><?php echo e(__('people')); ?></span>
                        </div>
                    </div>

                    <div class="p-3 rounded-5 border d-flex justify-content-start gap-3 align-items-center">
                        <div>
                            <input class="form-check-input" type="radio" name="splitBill"
                                wire:click="setSplitType('<?php echo e(\App\Enums\OrderPageType::PAY_AMOUNT); ?>')"
                                <?php if(\App\Enums\OrderPageType::PAY_AMOUNT === $this->splitType): echo 'checked'; endif; ?> />
                        </div>
                        <div class="d-flex gap-2 align-items-center">
                            <span><?php echo e(__('Pay')); ?> <?php echo e(currency($this->currency)->getSymbol()); ?></span>
                            <input type="number" style="width: 20%;" class="border border-secondary form-control py-0"
                                <?php if($this->splitType !== \App\Enums\OrderPageType::PAY_AMOUNT): ?> disabled <?php else: ?> wire:model.blur="yourShareValue" <?php endif; ?>>
                            <span><?php echo e(__('of')); ?></span>
                            <span class="fw-bolder"><?php echo money($this->orderPriceWithTax, $this->currency, $this->convert); ?></span>
                        </div>
                    </div>

                    <div class="p-3 rounded-5 border d-flex justify-content-start gap-3 align-items-center">
                        <div>
                            <input class="form-check-input" type="radio" name="splitBill"
                                wire:click="setSplitType('<?php echo e(\App\Enums\OrderPageType::PAY_YOUR_ITEMS); ?>')"
                                <?php if(\App\Enums\OrderPageType::PAY_YOUR_ITEMS === $this->splitType): echo 'checked'; endif; ?> />
                        </div>
                        <div class="d-flex gap-2 align-items-center">
                            <span><?php echo e(__('Pay for Your Items')); ?></span>

                        </div>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="align-items-center d-flex justify-content-between py-2">
                    <span><?php echo e(__('Your share')); ?></span>
                    <span><?php echo money($this->yourShare ?? 0, $this->currency, $this->convert); ?></span>
                </div>
                <div class="align-items-center d-flex justify-content-between py-2">
                    <span><?php echo e(__('Left to pay')); ?></span>
                    <span><?php echo money($this->orderPriceWithTax - ($this->yourShare ?? 0), $this->currency, $this->convert); ?></span>
                </div>
                <div class="text-start text-black-50">
                    <span><?php echo e(__('Incl. all taxes')); ?></span>
                </div>
                <?php if (isset($component)) { $__componentOriginal3e73276385d46aec1e111dfa034c4f4a = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal3e73276385d46aec1e111dfa034c4f4a = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.poweredBy','data' => ['class' => 'py-2']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.poweredBy'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'py-2']); ?>
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
                <?php if (isset($component)) { $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['disabled' => $this->splitType === \App\Enums\OrderPageType::BILL,'wire:click' => 'confirm','class' => 'btn-brand']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['disabled' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($this->splitType === \App\Enums\OrderPageType::BILL),'wire:click' => 'confirm','class' => 'btn-brand']); ?>
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
    </div>
</div>
<?php /**PATH /var/www/html/resources/views/components/webapp/orders/bill.blade.php ENDPATH**/ ?>