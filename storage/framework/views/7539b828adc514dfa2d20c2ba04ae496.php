<ul class="navbar-nav">
    <?php if(config('app.ordering')): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('home')); ?>">
                <i class="ni ni-tv-2 text-primary"></i> <?php echo e(__('Analytics')); ?>

            </a>
        </li>
        <?php if(config('app.isft')): ?>
            <li class="nav-item">
                <a class="nav-link" href="<?php echo e(route('orders.index')); ?>">
                    <i class="ni ni-basket text-orange"></i> <?php echo e(__('Orders')); ?>

                </a>
            </li>
        <?php endif; ?>
    <?php endif; ?>

    <?php if(config('app.isft')): ?>
        <li class="nav-item">
            <a class="nav-link" href="/live">
                <i class="ni ni-basket text-success"></i> <?php echo e(__('Live Orders')); ?><div class="blob red"></div>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('drivers.index')); ?>">
                <i class="ni ni-delivery-fast text-pink"></i> <?php echo e(__('Drivers')); ?>

            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('clients.index')); ?>">
                <i class="ni ni-single-02 text-blue"></i> <?php echo e(__('Clients')); ?>

            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('reviews.index')); ?>">
                <i class="ni ni-diamond text-info"></i> <?php echo e(__('Reviews')); ?>

            </a>
        </li>
    <?php endif; ?>
    <li class="nav-item">
        <a class="nav-link" href="<?php echo e(route('admin.restaurants.index')); ?>">
            <i class="ni ni-shop text-info"></i> <?php echo e(__('Restaurants')); ?>

        </a>
    </li>
     <li class="nav-item">
        <a class="nav-link" href="<?php echo e(route('admin.groups.index')); ?>">
            <i class="ni ni-support-16 text-green"></i> <?php echo e(__('Groups')); ?>

        </a>
    </li>
    <?php if(config('settings.multi_city')): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('cities.index')); ?>">
                <i class="ni ni-building text-orange"></i> <?php echo e(__('Cities')); ?>

            </a>
        </li>
    <?php endif; ?>
    <?php if(config('app.ordering')&&config('settings.enable_finances_admin')): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('finances.admin')); ?>">
                <i class="ni ni-money-coins text-blue"></i> <?php echo e(__('Finances')); ?>

            </a>
        </li>
    <?php endif; ?>

    <?php if(config('settings.app_dev')): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('admin.restaurant.banners.index')); ?>">
                <i class="ni ni-album-2 text-green"></i> <?php echo e(__('Banners')); ?>

            </a>
         </li>
     <?php endif; ?>


        

    <?php if(config('app.isqrexact')&&!config('settings.makePureSaaS',false)): ?>
    
    
<?php endif; ?>

         

        <li class="nav-item">
            <a class="nav-link" href="#navbar-system" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-maps">
                <i class="ni ni-settings text-primary"></i>
                <span class="nav-link-text"><?php echo e(__('System')); ?></span>
            </a>
            <div class="collapse" id="navbar-system" style="">
                <ul class="nav nav-sm flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo e(route('settings.index')); ?>">
                            <i class="ni ni-settings text-black"></i> <?php echo e(__('Site Settings')); ?>

                        </a>
                    </li>
                   
                    <?php if(config('app.isqrsaas')): ?>
                        <?php if(config('settings.showlandingmanagment',false)||!config('app.isqrexact')): ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route('admin.landing')); ?>">
                                    <i class="ni ni-html5 text-green"></i> <?php echo e(__('Landing Page')); ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    <?php endif; ?>
                    <?php if(config('settings.enable_pricing')): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo e(route('plans.index')); ?>">
                                <i class="ni ni-credit-card text-orange"></i> <?php echo e(__('Pricing plans')); ?>

                            </a>
                        </li>
                    <?php endif; ?>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo e(route('serviceFee.index')); ?>">
                            <i class="ni ni-settings text-black"></i> <?php echo e(__('Service Fee')); ?>

                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo e(route('minOrder.index')); ?>">
                            <i class="ni ni-settings text-black"></i> <?php echo e(__('Order minimum price')); ?>

                        </a>
                    </li>
                    

                    
                </ul>
            </div>
        </li>

        



</ul>
<?php /**PATH /var/www/html/resources/views/layouts/navbars/menus/admin.blade.php ENDPATH**/ ?>