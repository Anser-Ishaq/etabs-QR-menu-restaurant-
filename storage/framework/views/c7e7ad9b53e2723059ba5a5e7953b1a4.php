<div class="container">
    <div class="row justify-content-center">
        <div class="card shadow border-0 mt-8 col-lg-6 mx-auto">
            <div class="card-body d-flex flex-column h-screen justify-content-around text-center">
                <div>
                    <h1 class="display-4"><?php echo e(__('Payment Successful!')); ?></h1>
                </div>
                <div class="justify-content-center text-center">
                    <?php if (isset($component)) { $__componentOriginal643fe1b47aec0b76658e1a0200b34b2c = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal643fe1b47aec0b76658e1a0200b34b2c = $attributes; } ?>
<?php $component = BladeUI\Icons\Components\Svg::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('svg-check'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(BladeUI\Icons\Components\Svg::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal643fe1b47aec0b76658e1a0200b34b2c)): ?>
<?php $attributes = $__attributesOriginal643fe1b47aec0b76658e1a0200b34b2c; ?>
<?php unset($__attributesOriginal643fe1b47aec0b76658e1a0200b34b2c); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal643fe1b47aec0b76658e1a0200b34b2c)): ?>
<?php $component = $__componentOriginal643fe1b47aec0b76658e1a0200b34b2c; ?>
<?php unset($__componentOriginal643fe1b47aec0b76658e1a0200b34b2c); ?>
<?php endif; ?>
                </div>
                <h3 class="text-success">
                    <!--[if BLOCK]><![endif]--><?php if($transaction->order->payment_status === 'paid'): ?>
                        <?php echo e(__('Bill paid in full to ')); ?>

                        <?php echo e($transaction->order->restorant->name); ?>’s
                    <?php else: ?>
                        <?php echo e(__('Bill partially paid to ')); ?>

                        <?php echo e($transaction->order->restorant->name); ?>’s
                </h3>
                <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                <h3><?php echo e(__('Confirmation for Table')); ?>: <?php echo e($transaction->order->table->name); ?></h3>
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
                <!--[if BLOCK]><![endif]--><?php if($transaction->order->payment_status === 'paid'): ?>
                    <div class="text-success p-2" style="background-color: lightgreen;">
                        <?php echo e(__('Your waiter knows your bill has been paid in full. Feel free to head out.')); ?>

                    </div>
                <?php else: ?>
                    <div class="p-2" style="background-color: #FFFFCC;color: darkgoldenrod;">
                        <span> <?php echo e(__('Your share of the bill is paid up')); ?>!</span>
                        <br />
                        <strong>
                            <?php echo money($transaction->order->remaining_price, $transaction->currency, false); ?>
                            <?php echo e(__('remaining of total bill')); ?>.
                        </strong>
                    </div>
                <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                <!--[if BLOCK]><![endif]--><?php if($emailSent): ?>
                    <h5 class="bg-success p-1 text-light"><?php echo e(__('Your receipt has been sent to your email!')); ?></h5>
                <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                <!--[if BLOCK]><![endif]--><?php if($emailFailed): ?>
                    <h5 class="bg-danger p-1 text-light"><?php echo e(__('Your receipt can not be sent to your email!')); ?></h5>
                <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                <form wire:submit="sendEmail" class="d-flex flex-column gap-2 justify-content-between mt-3">
                    <input wire:model="email" class="form-control" placeholder="<?php echo e(__('Your email address')); ?>"
                        type="email" name="email" required />

                    <?php if (isset($component)) { $__componentOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginaleb68e4f4cf96411213b473dcbb0c24b9 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['asLink' => false,'type' => 'submit','class' => 'btn-brand','disabled' => $emailSent || $emailFailed]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['asLink' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(false),'type' => 'submit','class' => 'btn-brand','disabled' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($emailSent || $emailFailed)]); ?>
                        <?php echo e(__('Email my receipt')); ?>

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
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.webapp.button','data' => ['class' => 'btn-brand-outline','href' => ''.e(route('webapp.table.show', ['company' => $transaction->order->restorant->subdomain, 'table' => $transaction->order->table->id])).'']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('webapp.button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'btn-brand-outline','href' => ''.e(route('webapp.table.show', ['company' => $transaction->order->restorant->subdomain, 'table' => $transaction->order->table->id])).'']); ?>
                        <?php echo e(__('Go to home')); ?>

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
                </form>
            </div>
        </div>
    </div>
</div>
<?php /**PATH /var/www/html/resources/views/livewire/webapp/order-success-page.blade.php ENDPATH**/ ?>