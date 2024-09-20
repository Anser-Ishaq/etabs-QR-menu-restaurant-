<thead class="thead-light">
    <tr>
        <th scope="col"><?php echo e(__('ID')); ?></th>
        <?php if(\Spatie\Permission\PermissionServiceProvider::bladeMethodWrapper('hasRole', 'admin|driver')): ?>
            <th scope="col"><?php echo e(__('Restaurant')); ?></th>
        <?php endif; ?>
        <th class="table-web" scope="col"><?php echo e(__('Created')); ?></th>
        <th class="table-web" scope="col"><?php echo e(!config('settings.is_whatsapp_ordering_mode') ? __('Table / Area') : __('Method')); ?></th>
        <?php if(!isset($hideAction)): ?>
            <th class="table-web" scope="col"><?php echo e(__('Items')); ?></th>
        <?php endif; ?>
        <th class="table-web" scope="col"><?php echo e(__('Total')); ?></th>
        <th scope="col"><?php echo e(__('Status')); ?></th>
        <?php if(!isset($hideAction)): ?>
            <th scope="col"><?php echo e(__('Actions')); ?></th>
        <?php endif; ?>
    </tr>
</thead>
<tbody>
<?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

<tr>
    <td>
        
        <a class="btn badge badge-success badge-pill" href="<?php echo e(route('orders.show',$order->id )); ?>">#<?php echo e($order->id_formated); ?></a>
    </td>
    <?php if(\Spatie\Permission\PermissionServiceProvider::bladeMethodWrapper('hasRole', 'admin|driver')): ?>
    <th scope="row">
        <div class="media align-items-center">
            <a class="avatar-custom mr-3">
                <img class="rounded" alt="..." src=<?php echo e($order->restorant->icon); ?>>
            </a>
            <div class="media-body">
                <span class="mb-0 text-sm"><?php echo e($order->restorant->name); ?></span>
            </div>
        </div>
    </th>
    <?php endif; ?>

    <td class="table-web">
        <?php echo e($order->created_at->locale(Config::get('app.locale'))->isoFormat('LLLL')); ?>

    </td>
    <td class="table-web">
        <?php echo e($order->table?->getFullNameAttribute()); ?>

    </td>
    <?php if(!isset($hideAction)): ?>
        <td class="table-web">
            <?php echo e(count($order->items)); ?>

        </td>
    <?php endif; ?>
    <td class="table-web">
        <?php echo money($order->sub_total, config('settings.cashier_currency'),config('settings.do_convertion')); ?>
    </td>
    <td>
        <?php if($order->situation): ?>
            <?php echo $order->situation->badge(); ?>

        <?php endif; ?>
        
    </td>
    <?php if(!isset($hideAction)): ?>
        <?php echo $__env->make('orders.partials.actions.table',['order' => $order ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?> 
    <?php endif; ?>
    
</tr>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</tbody>
<?php /**PATH /var/www/html/resources/views/orders/partials/orderdisplay_local.blade.php ENDPATH**/ ?>