<?php $__env->startSection('thead'); ?>
    <th><?php echo e(__('Price')); ?></th>
    <th><?php echo e(__('Options')); ?></th>
    <?php if($restorant->getConfig('stock_enabled',"false")!="false"): ?>
        <?php if($item->qty_management==1): ?>
            <th><?php echo e(__('Stock')); ?></th>
        <?php endif; ?>
    <?php endif; ?>
    <th><?php echo e(__('Actions')); ?></th>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('tbody'); ?>
<?php $__currentLoopData = $setup['items']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $variant): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
<tr>
    <td><?php echo e($variant->price); ?></td>
    <td>
        <?php echo e($variant->optionsList); ?>

    </td>
    <?php if($restorant->getConfig('stock_enabled',"false")!="false"): ?>
        <?php if($item->qty_management==1): ?>
            <td><?php echo e($variant->qty); ?></td>
        <?php endif; ?>
    <?php endif; ?>
    <td><a href="<?php echo e(route("items.variants.edit",["variant"=>$variant->id])); ?>" class="btn btn-primary btn-sm"><?php echo e(__('Edit')); ?></a><a href="<?php echo e(route("items.variants.delete",["variant"=>$variant->id])); ?>" class="btn btn-danger btn-sm"><?php echo e(__('Delete')); ?></a></td>
</tr> 
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

<?php $__env->stopSection(); ?><?php /**PATH /var/www/html/resources/views/items/variants/content.blade.php ENDPATH**/ ?>