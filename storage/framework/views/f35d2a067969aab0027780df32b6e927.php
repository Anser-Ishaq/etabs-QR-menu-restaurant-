
    <div class="row">
        <div class="col-md-12">
            <ul class="list-inline ">
                <?php if($restorant->getConfig('facebook', '')): ?>
                    <li class="list-inline-item">
                        <a href="<?php echo e($restorant->getConfig('facebook', '')); ?>" target="_blank">
                            <i class="fa fa-facebook"  style="font-size: 24px;" ></i>
                        </a>    
                    </li>
                <?php endif; ?>
                <?php if($restorant->getConfig('instagram', '')): ?>
                    <li class="list-inline-item">
                        <a href="<?php echo e($restorant->getConfig('instagram', '')); ?>" target="_blank">
                            <i class="fa fa-instagram"  style="font-size: 24px;"></i>
                        </a>
                    </li>
                <?php endif; ?>
                <?php if($restorant->getConfig('youtube', '')): ?>
                    <li class="list-inline-item">
                        <a href="<?php echo e($restorant->getConfig('youtube', '')); ?>" target="_blank">
                            <i class="fa fa-youtube"  style="font-size: 24px;"></i>
                        </a>
                    </li>
                <?php endif; ?>
                <?php if($restorant->getConfig('twitter', '')): ?>
                    <li class="list-inline-item">
                        <a href="<?php echo e($restorant->getConfig('twitter', '')); ?>" target="_blank">
                            <i class="fa fa-twitter"  style="font-size: 24px;"></i>
                        </a>
                    </li>
                <?php endif; ?>
                <?php if($restorant->getConfig('website', '')): ?>
                    <li class="list-inline-item">
                        <a href="<?php echo e($restorant->getConfig('website', '')); ?>" target="_blank">
                            <i class="fa fa-globe" style="font-size: 24px;"></i>
                        </a>
                    </li>
                <?php endif; ?>
            </ul>
        </div>
    </div>

<?php /**PATH /var/www/html/resources/views/restorants/partials/social_links.blade.php ENDPATH**/ ?>