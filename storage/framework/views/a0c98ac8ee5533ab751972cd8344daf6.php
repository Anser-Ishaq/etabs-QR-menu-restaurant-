<!-- resources/views/partials/file.blade.php -->
<div class="form-group">
    <label for="<?php echo e($id); ?>"><?php echo e($name); ?></label>
    <input type="file" class="form-control" id="<?php echo e($id); ?>" name="<?php echo e($id); ?>" accept="audio/mp3" <?php echo e($required ? 'required' : ''); ?>>
</div>
<?php /**PATH /var/www/html/resources/views/partials/file.blade.php ENDPATH**/ ?>