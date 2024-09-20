<section x-data="{ cartOpen: false, mobileMenuOpen: false, }">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center py-3">
            <img src="<?php echo e(asset($company->logom)); ?>" alt="Logo" class="square">
            <div class="">
                <button class="btn btn-outline-secondary me-2" @click="cartOpen = !cartOpen">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-cart" viewBox="0 0 16 16">
                        <path
                            d="M0 1a1 1 0 0 1 1-1h1.25a1 1 0 0 1 .97.757l.428 2.11A1 1 0 0 0 4.64 4h9.72a1 1 0 0 1 .992 1.138l-1 8A1 1 0 0 1 13.36 14H3a1 1 0 0 1-.992-.885L.219 2.057A1 1 0 0 1 0 1zm3 5v7a1 1 0 0 0 1 1h10.36a1 1 0 0 0 .992-.885l1-8a1 1 0 0 0-.992-1.138H4.64L3.546 3H1.25a1 1 0 0 0-.97.757L.431 4H3zm1 2a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-5a1 1 0 0 0-1-1H4zm0 2v4H13v-4H4z" />
                    </svg>
                    <span><?php echo e(__('Cart')); ?></span>
                    <!--[if BLOCK]><![endif]--><?php if(Cart::getTotalQuantity() > 0): ?>
                        <span class="badge rounded-pill bg-warning"><?php echo e(Cart::getTotalQuantity()); ?></span>
                    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                </button>
            </div>
        </div>
        <!--[if BLOCK]><![endif]--><?php if(!$company->categories->isEmpty()): ?>
            <nav class="tabbable sticky" style="top: <?php echo e(config('app.isqrsaas') ? 64 : 88); ?>px;">
                <ul class="nav nav-pills bg-white mb-2">
                    <li class="nav-item nav-item-category ">
                        <a class="nav-link  mb-sm-3 mb-md-0 active" data-toggle="tab" role="tab"
                            href=""><?php echo e(__('All categories')); ?></a>
                    </li>
                    <!--[if BLOCK]><![endif]--><?php $__currentLoopData = $company->categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <!--[if BLOCK]><![endif]--><?php if(!$category->aitems->isEmpty()): ?>
                            <li class="nav-item nav-item-category"
                                id="<?php echo e('cat_' . str_replace(' ', '', strtolower($category->name)) . strval($key)); ?>">
                                <a class="nav-link mb-sm-3 mb-md-0" data-toggle="tab" role="tab"
                                    id="<?php echo e('nav_' . str_replace(' ', '', strtolower($category->name)) . strval($key)); ?>"
                                    href="#<?php echo e(str_replace(' ', '', strtolower($category->name)) . strval($key)); ?>"><?php echo e($category->name); ?></a>

                            </li>
                        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><!--[if ENDBLOCK]><![endif]-->
                    <li class="nav-item nav-item-category">
                        <a href="/api/download-pdf" target="_blank"class="nav-link  mb-sm-3 mb-md-0 active"
                            id="downloadPdfButton" title="<?php echo e(__('Download Pdf')); ?>">
                            <?php echo e(__('Download PDF')); ?>

                        </a>
                    </li>

                </ul>
            </nav>
        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
        <div class="row">
            <!--[if BLOCK]><![endif]--><?php $__empty_1 = true; $__currentLoopData = $company->categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <!--[if BLOCK]><![endif]--><?php $__currentLoopData = $category->aitems; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 mb-4">
                        <div class="card p-3 cursor-pointer"
                            <?php if(!($item->qty_management == 1 && $item->qty < 1)): ?> wire:click="addToCart(<?php echo e($item->id); ?>)" <?php endif; ?>>
                            <img src="<?php echo e($item->logom); ?>" alt="Product Image" class="img-fluid mb-3">
                            <h5 class="fw-bold">
                                <!--[if BLOCK]><![endif]--><?php if($item->qty_management == 1 && $item->qty < 1): ?>
                                    [<?php echo e(__('Out of stock')); ?>] -
                                <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                                <?php echo e($item->name); ?>

                            </h5>
                            <p><?php echo e($item->short_description); ?></p>
                            <div class="row">
                                <div class="col-6 text-muted">
                                    <!--[if BLOCK]><![endif]--><?php if($item->discounted_price > 0): ?>
                                        <span class="text-muted"
                                            style="text-decoration: line-through;"><?php echo money($item->discounted_price, config('settings.cashier_currency'), config('settings.do_convertion')); ?></span>
                                    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                                    <?php echo money($item->price, config('settings.cashier_currency'), config('settings.do_convertion')); ?>
                                </div>
                                <div class="col-6 text-end">
                                    <!--[if BLOCK]><![endif]--><?php if(Cart::has($item->id)): ?>
                                        <?php echo e(__('In cart')); ?>

                                    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                                    <div class="allergens d-none">
                                        <!--[if BLOCK]><![endif]--><?php $__currentLoopData = $item->allergens; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $allergen): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <div class='allergen' data-toggle="tooltip" data-placement="bottom"
                                                title="<?php echo e($allergen->title); ?>">
                                                <img src="<?php echo e($allergen->image_link); ?>" />
                                            </div>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><!--[if ENDBLOCK]><![endif]-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><!--[if ENDBLOCK]><![endif]-->
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
        </div>
    </div>

    <div class="sidebar" :class="{ 'open': cartOpen }">
        <button class="btn btn-danger mb-3" @click="cartOpen = false">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x"
                viewBox="0 0 16 16">
                <path
                    d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
            </svg>
        </button>
        <!--[if BLOCK]><![endif]--><?php if($cartItems->isNotEmpty()): ?>
            <!--[if BLOCK]><![endif]--><?php $__currentLoopData = $cartItems; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $cartIndex => $cartItem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="align-items-center d-flex gap-3 justify-content-between mb-3">
                    <div class="d-flex gap-4">
                        <img class="square" src="<?php echo e(asset($cartItem['attributes']['image'])); ?>" alt="Product Image">
                        <h5 class="fw-bold"><?php echo e($cartItem['name']); ?></h5>
                    </div>
                    <div class="d-flex gap-2 align-items-center">
                        <?php echo money($cartItem['price'], config('settings.cashier_currency'), config('settings.do_convertion')); ?>
                        <input type="number" class="form-control"
                            wire:model.live="cartItems.<?php echo e($cartIndex); ?>.quantity" min="1"
                            style="width: 80px">
                        <button class="btn btn-danger delete-icon" wire:click="removeFromCart('<?php echo e($cartIndex); ?>')">
                            <?php if (isset($component)) { $__componentOriginal643fe1b47aec0b76658e1a0200b34b2c = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal643fe1b47aec0b76658e1a0200b34b2c = $attributes; } ?>
<?php $component = BladeUI\Icons\Components\Svg::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('svg-delete'); ?>
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
                        </button>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><!--[if ENDBLOCK]><![endif]-->
            <div class="d-grid gap-2 mt-3">
                <div>
                    <?php echo e(__('Subtotal')); ?>: <?php echo money(Cart::getSubTotal(), config('settings.cashier_currency'), config('settings.do_convertion')); ?>
                </div>
                <button class="btn btn-primary" wire:click="createOrder"><?php echo e(__('Create Order')); ?></button>
            </div>
        <?php else: ?>
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                    <p class="text-muted mb-0"><?php echo e(__('Cart is empty')); ?></p>
                </div>
            </div>
            <button class="btn btn-secondary" @click="cartOpen = false"><?php echo e(__('Continue Shopping')); ?></button>
        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
    </div>
</section>
<?php /**PATH /var/www/html/resources/views/livewire/webapp/products-page.blade.php ENDPATH**/ ?>