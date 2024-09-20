<?php use \App\Enums\OrderPageType; ?>

<div class="d-flex flex-column h-screen">
    <!--[if BLOCK]><![endif]--><?php if($componentName === OrderPageType::BILL): ?>
        <div class="bg-image mb-4 position-relative"
            style="background-image: url('<?php echo e(asset($company->coverm)); ?>');height: 140px;">
            <div class="profile-image square bg-image rounded-circle position-absolute"
                style="--l: 100px;background-image: url('<?php echo e(asset($company->logom)); ?>');background-color: white;background-size: contain;">
            </div>
        </div>
    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
    <div class="<?php echo \Illuminate\Support\Arr::toCssClasses([
        'text-center p-3 d-flex flex-column flex-grow-1 mx-auto w-100 h-100',
        'justify-content-evenly' => is_null($order),
        'justify-content-between' => !is_null($order),
    ]); ?>" style="max-width: 700px;">
        <!--[if BLOCK]><![endif]--><?php if(is_null($order)): ?>
            <div class="d-flex justify-content-center">
                <h1 class="font-futura" wire:loading.remove>
                    <?php echo e(__('You can pay your bill here once you’ve placed an order')); ?>!
                </h1>
                <?php if (isset($component)) { $__componentOriginal37a666dabf9339cff1e17f0197e0966b = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal37a666dabf9339cff1e17f0197e0966b = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.loader','data' => ['dotColor' => 'var(--km-main)','wire:loading.flex' => true]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.loader'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['dotColor' => 'var(--km-main)','wire:loading.flex' => true]); ?>
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
            <div class="d-flex flex-column gap-4">
                <?php if (isset($component)) { $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['asLink' => 'false','class' => 'btn-brand','wire:click' => '$refresh']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['asLink' => 'false','class' => 'btn-brand','wire:click' => '$refresh']); ?>
                    <?php echo e(__('Try again')); ?>

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
                <!--[if BLOCK]><![endif]--><?php if($this->company->can_pickup): ?>
                    <?php if (isset($component)) { $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['href' => $this->company->getConfig('disable_ordering', true)
                        ? route('webapp.products.show', [
                            'company' => $this->company->subdomain,
                            'table' => $this->table->id,
                        ])
                        : '/api/download-pdf','class' => 'btn-brand-outline']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['href' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($this->company->getConfig('disable_ordering', true)
                        ? route('webapp.products.show', [
                            'company' => $this->company->subdomain,
                            'table' => $this->table->id,
                        ])
                        : '/api/download-pdf'),'class' => 'btn-brand-outline']); ?>
                        <?php echo e(__('View menu')); ?>

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
                <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
            </div>
        <?php else: ?>
            <?php if (isset($component)) { $__componentOriginal511d4862ff04963c3c16115c05a86a9d = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal511d4862ff04963c3c16115c05a86a9d = $attributes; } ?>
<?php $component = Illuminate\View\DynamicComponent::resolve(['component' => $componentName->name()] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('dynamic-component'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\DynamicComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal511d4862ff04963c3c16115c05a86a9d)): ?>
<?php $attributes = $__attributesOriginal511d4862ff04963c3c16115c05a86a9d; ?>
<?php unset($__attributesOriginal511d4862ff04963c3c16115c05a86a9d); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal511d4862ff04963c3c16115c05a86a9d)): ?>
<?php $component = $__componentOriginal511d4862ff04963c3c16115c05a86a9d; ?>
<?php unset($__componentOriginal511d4862ff04963c3c16115c05a86a9d); ?>
<?php endif; ?>
        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
    </div>
</div>
    <?php
        $__scriptKey = '781925879-0';
        ob_start();
    ?>
    <script>
        document.addEventListener("drawDonutChart", () => {
            $wire.setViewPort(getWidthForCanvas());
        });
    </script>
    <?php
        $__output = ob_get_clean();

        \Livewire\store($this)->push('scripts', $__output, $__scriptKey)
    ?>
<?php /**PATH /var/www/html/resources/views/livewire/webapp/order-page.blade.php ENDPATH**/ ?>