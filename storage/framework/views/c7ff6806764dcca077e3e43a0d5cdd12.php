<ul class="navbar-nav">
    <?php if(config('settings.makePureSaaS',false)): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('home')); ?>">
                <i class="ni ni-tv-2 text-primary"></i> <?php echo e(__('Analytics')); ?>

            </a>
        </li>
    <?php endif; ?>
    <?php if(config('app.ordering')&&!config('settings.makePureSaaS',false)): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('home')); ?>">
                <i class="ni ni-tv-2 text-primary"></i> <?php echo e(__('Analytics')); ?>

            </a>
        </li>
        <?php if(!config('app.issd')): ?>
            <li class="nav-item">
                <a class="nav-link" href="/live">
                    <i class="ni ni-basket text-success"></i> <?php echo e(__('Live Orders')); ?><div class="blob red"></div>
                </a>
            </li>
        <?php endif; ?>

        <?php if(!config('app.issd')): ?>
            <li class="nav-item">
                <a class="nav-link" href="<?php echo e(route('orders.index')); ?>">
                    <i class="ni ni-basket text-orangse"></i> <?php echo e(__('Orders History')); ?>

                </a>
            </li>
        <?php endif; ?>
    <?php endif; ?>

    <li class="nav-item">
        <a class="nav-link" href="<?php echo e(route('admin.restaurants.edit',  auth()->user()->restorant->id)); ?>">
            <i class="ni ni-shop text-info"></i> <?php echo e(__('Restaurant Management')); ?>

        </a>
    </li>
   
    <?php if(!config('app.issd')&&!config('settings.makePureSaaS',false)): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('items.index')); ?>">
                <i class="ni ni-collection text-pink"></i> <?php echo e(__('Menu Management')); ?>

            </a>
        </li>
    <?php endif; ?>
    <?php if(config('app.isft')): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('clients.index')); ?>">
                <i class="ni ni-single-02 text-blue"></i> <?php echo e(__('Clients')); ?>

            </a>
        </li>
    <?php endif; ?>

    <?php if(!config('settings.makePureSaaS',false)): ?>
        <?php if(config('app.isqrsaas') && (!config('settings.qrsaas_disable_odering') || config('settings.enable_guest_log'))): ?>
            <?php if(!config('settings.is_whatsapp_ordering_mode') || in_array("poscloud", config('global.modules',[]))  || in_array("deliveryqr", config('global.modules',[])) ): ?>
                
            <?php endif; ?>
        <?php elseif(config('app.isft') && in_array("poscloud", config('global.modules',[])) ): ?>
            <li class="nav-item">
                <a class="nav-link" href="<?php echo e(route('admin.restaurant.tables.index')); ?>">
                    <i class="ni ni-ungroup text-red"></i> <?php echo e(__('Tables')); ?>

                </a>
            </li>
        <?php endif; ?>
    <?php endif; ?>


    <!-- Exrta menus -->
    <?php $__currentLoopData = auth()->user()->getExtraMenus(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php if(isset($menu['isGroup']) && $menu['isGroup']): ?>

                <a class="nav-link" href="#navbar-<?php echo e($menu['id']); ?>" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-<?php echo e($menu['id']); ?>">
                    <i class="ni ni-single-copy-04 text-primary"></i>
                    <span class="nav-link-text"><?php echo e(__($menu['name'])); ?></span>
                </a>
                <div class="collapse" id="navbar-<?php echo e($menu['id']); ?>" style="">
                    <ul class="nav nav-sm flex-column">
                        <?php $__currentLoopData = $menu['menus']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $submenu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo e(route($submenu['route'],isset($submenu['params'])?$submenu['params']:[])); ?>">
                                    <i class="<?php echo e($submenu['icon']); ?>"></i> <?php echo e(__($submenu['name'])); ?>

                                </a>
                            </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
            <?php else: ?>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo e(route($menu['route'],isset($menu['params'])?$menu['params']:[])); ?>">
                        <i class="<?php echo e($menu['icon']); ?>"></i> <?php echo e(__($menu['name'])); ?>

                    </a>
                </li>
            <?php endif; ?>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


    <?php if(config('app.isqrexact')&&!config('settings.makePureSaaS',false)): ?>
        
        
    <?php endif; ?>

    <?php if((config('settings.is_agris_mode') || config('settings.is_whatsapp_ordering_mode')  || in_array("poscloud", config('global.modules',[]))   )): ?>
        <?php if(!in_array("deliveryqr", config('global.modules',[]))): ?>
            <li class="nav-item">
                <a class="nav-link" href="<?php echo e(route('admin.restaurant.simpledelivery.index')); ?>">
                    <i class="ni ni-pin-3 text-blue"></i> <?php echo e(__('Delivery areas')); ?>

                </a>
            </li>
        <?php endif; ?>
    <?php endif; ?>

    <?php if(config('settings.enable_pricing')): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(route('plans.current')); ?>">
                <i class="ni ni-credit-card text-orange"></i> <?php echo e(__('Plan')); ?>

            </a>
        </li>
    <?php endif; ?>

        <?php if(config('app.ordering')&&config('settings.enable_finances_owner')): ?>
            <li class="nav-item">
                <a class="nav-link" href="<?php echo e(route('finances.owner')); ?>">
                    <i class="ni ni-money-coins text-blue"></i> <?php echo e(__('Finances')); ?>

                </a>
            </li>
        <?php endif; ?>


        


    
    <li class="nav-item">
        <a class="nav-link" href="<?php echo e(route('admin.googleReview.index')); ?>">
            <i class="ni ni-send text-green"></i> <?php echo e(__('Google Reviews')); ?>

        </a>
    </li>


</ul>
<?php if(config('vendorlinks.enable',false)): ?>
<hr class="my-3">
<h6 class="navbar-heading p-0 text-muted">
    <span class="docs-normal"><?php echo e(__(config('vendorlinks.name',""))); ?></span>
</h6>
<ul class="navbar-nav mb-md-3">
    <?php if(strlen(config('vendorlinks.link1link',""))>4): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(config('vendorlinks.link1link',"")); ?>" target="_blank">
                <span class="nav-link-text"><?php echo e(__(config('vendorlinks.link1name',""))); ?></span>
            </a>
        </li>
    <?php endif; ?>

    <?php if(strlen(config('vendorlinks.link2link',""))>4): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(config('vendorlinks.link2link',"")); ?>" target="_blank">
                <span class="nav-link-text"><?php echo e(__(config('vendorlinks.link2name',""))); ?></span>
            </a>
        </li>
    <?php endif; ?>

    <?php if(strlen(config('vendorlinks.link3link',""))>4): ?>
        <li class="nav-item">
            <a class="nav-link" href="<?php echo e(config('vendorlinks.link3link',"")); ?>" target="_blank">
                <span class="nav-link-text"><?php echo e(__(config('vendorlinks.link3name',""))); ?></span>
            </a>
        </li>
    <?php endif; ?>

</ul>
<?php endif; ?>

<?php /**PATH /var/www/html/resources/views/layouts/navbars/menus/owner.blade.php ENDPATH**/ ?>