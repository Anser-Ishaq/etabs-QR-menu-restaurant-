<style>
    /* #filterSelect{width: 100% !important; border: none !important} */
</style>

<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">

    <div class="container-fluid">
        <div class="header-body">
            <div class="container mt-3">
                <div class="row justify-content-end mb-5 ml-4">
                    <div class="col-xl-3 col-lg-6">
                        <select name="filter" id="filterSelect" class="form-control">
                            <?php $__currentLoopData = $filters; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $filterKey => $filter): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option <?php if($filter['selected']): echo 'selected'; endif; ?> value="<?php echo e($filterKey); ?>">
                                    <?php echo e($filter['name']); ?>

                                </option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <?php $__currentLoopData = $stats[0] ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $statId => $stat): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if (isset($component)) { $__componentOriginal87dd96fabcb1ce9254eda7ff7199227b = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal87dd96fabcb1ce9254eda7ff7199227b = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.dashboard.admin.card','data' => ['class' => 'col-xl-4','stat' => $stat,'id' => $statId]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('dashboard.admin.card'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['class' => 'col-xl-4','stat' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($stat),'id' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($statId)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal87dd96fabcb1ce9254eda7ff7199227b)): ?>
<?php $attributes = $__attributesOriginal87dd96fabcb1ce9254eda7ff7199227b; ?>
<?php unset($__attributesOriginal87dd96fabcb1ce9254eda7ff7199227b); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal87dd96fabcb1ce9254eda7ff7199227b)): ?>
<?php $component = $__componentOriginal87dd96fabcb1ce9254eda7ff7199227b; ?>
<?php unset($__componentOriginal87dd96fabcb1ce9254eda7ff7199227b); ?>
<?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>

            <br />
            <?php if(auth()->user()->hasRole('admin')): ?>
                <?php if(config('app.isft')): ?>
                    <div class="row">
                        <div class="col-xl-3 col-lg-6">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">
                                                <?php echo e(__('Delivery Fee')); ?> ( 30 <?php echo e(__('days')); ?> )</h5>
                                            <span class="h2 font-weight-bold mb-0"> <?php echo money(is_numeric($last30daysDeliveryFee) ? $last30daysDeliveryFee : 0, config('settings.cashier_currency'), config('settings.do_convertion')); ?></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                                                <i class="fas fa-truck"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">
                                                <?php echo e(__('Static Fee')); ?> ( 30 <?php echo e(__('days')); ?> )</h5>
                                            <span class="h2 font-weight-bold mb-0"><?php echo money(is_numeric($last30daysStaticFee) ? $last30daysStaticFee : 0, config('settings.cashier_currency'), config('settings.do_convertion')); ?></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                                                <i class="fas fa-chart-bar"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">
                                                <?php echo e(__('Dynamic Fee')); ?> ( 30 <?php echo e(__('days')); ?> )</h5>
                                            <span class="h2 font-weight-bold mb-0"><?php echo money(is_numeric($last30daysDynamicFee) ? $last30daysDynamicFee : 0, config('settings.cashier_currency'), config('settings.do_convertion')); ?></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                                                <i class="fas fa-percent"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-lg-6">
                            <div class="card card-stats mb-4 mb-xl-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">
                                                <?php echo e(__('Total Fee')); ?> ( 30 <?php echo e(__('days')); ?> )</h5>
                                            <span class="h2 font-weight-bold mb-0"><?php echo money(is_numeric($last30daysTotalFee) ? $last30daysTotalFee : 0, config('settings.cashier_currency'), config('settings.do_convertion')); ?></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                                                <i class="fas fa-coins"></i>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
            <?php endif; ?>
        </div>
    </div>
</div>

<?php $__env->startSection('js'); ?>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const stats = <?php echo json_encode($stats, 15, 512) ?>;
            const filterSelect = document.getElementById('filterSelect');

            $('#filterSelect').on('select2:select', function(e) {
                if (stats[this.value]) {
                    const ids = Object.keys(stats[this.value]);
                    for (let i = 0; i < ids.length; i++) {
                        const ele = document.getElementById(ids[i]);
                        if (ele && stats[this.value][ids[i]]['value']) {
                            ele.innerText = stats[this.value][ids[i]]['value']
                        }
                    }
                }
            });

            function isNumeric(value) {
                return !isNaN(value - parseFloat(value));
            }

            function formatMoney(amount, currency, doConversion) {
                return new Intl.NumberFormat('en-US', {
                    style: 'currency',
                    currency: currency,
                    minimumFractionDigits: 2
                }).format(amount);
            }
        });
    </script>
<?php $__env->stopSection(); ?>
<?php /**PATH /home/vagrant/Sites/lara2/resources/views/layouts/headers/cards/general.blade.php ENDPATH**/ ?>