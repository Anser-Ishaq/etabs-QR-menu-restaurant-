 <div class="d-flex flex-column justify-content-between gap-5 align-items-center h-100">
     <div></div>
     <div class="restaurant-logo bg-image border border-dark rounded-circle square <?php echo e($this->step === 2 ? 'visible' : ''); ?>"
         style="visibility: hidden;background-image: url('<?php echo e(asset($this->company->logom)); ?>');background-color: white;background-size: contain;">
     </div>
     <div class="d-flex flex-column gap-2 w-100">
         <?php if (isset($component)) { $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['class' => 'btn-brand','wire:navigate' => true,'href' => route('webapp.order.show', ['company' => $this->company->subdomain, 'table' => $this->table])]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'btn-brand','wire:navigate' => true,'href' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(route('webapp.order.show', ['company' => $this->company->subdomain, 'table' => $this->table]))]); ?>
             <div class="d-flex justify-content-center gap-1">
                 <span><?php echo e(__('Pay now')); ?></span>
                 <!--[if BLOCK]><![endif]--><?php if($this->finalPrice): ?>
                     <span>|</span>
                     <span>
                         <?php echo money($this->finalPrice, config('settings.cashier_currency'), config('settings.do_convertion')); ?>
                     </span>
                 <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
             </div>
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
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['class' => 'btn-brand-outline','href' => $this->company->getConfig('disable_ordering', true)
                 ? route('webapp.products.show', [
                     'company' => $this->company->subdomain,
                     'table' => $this->table,
                 ])
                 : '/api/download-pdf']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'btn-brand-outline','href' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($this->company->getConfig('disable_ordering', true)
                 ? route('webapp.products.show', [
                     'company' => $this->company->subdomain,
                     'table' => $this->table,
                 ])
                 : '/api/download-pdf')]); ?><?php echo e(__('View menu')); ?> <?php echo $__env->renderComponent(); ?>
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
         <h2 class="font-futura text-white text-center mt-xs-4"><?php echo e(__('Hi')); ?> <?php echo e($this->name); ?>!</h2>
     </div>
     <?php if (isset($component)) { $__componentOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalaa6f641f1ee9270e6ddd1aa725f8a9d1 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.logo','data' => ['class' => 'w-25 mb-3']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.logo'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'w-25 mb-3']); ?>
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
<?php /**PATH /var/www/html/resources/views/components/webapp/home/restaurant.blade.php ENDPATH**/ ?>