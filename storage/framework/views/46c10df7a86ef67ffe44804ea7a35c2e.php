<?php if($enabled): ?>
    <script>
        function gtmPush() {
            <?php if (! (empty($dataLayer->toArray()))): ?>
            window.dataLayer.push(<?php echo $dataLayer->toJson(); ?>);
            <?php endif; ?>
            <?php $__currentLoopData = $pushData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            window.dataLayer.push(<?php echo $item->toJson(); ?>);
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        }
        addEventListener("load", gtmPush);
    </script>
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=<?php echo e($id); ?>"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<?php endif; ?>

<?php /**PATH /var/www/html/vendor/spatie/laravel-googletagmanager/src/../resources/views/body.blade.php ENDPATH**/ ?>