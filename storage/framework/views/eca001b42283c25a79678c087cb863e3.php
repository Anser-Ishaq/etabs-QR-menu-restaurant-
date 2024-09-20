<?php $__env->startSection('content'); ?>
    <div class="header bg-gradient-info pb-6 pt-5 pt-md-8">
    </div>
    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col-12">
                <?php echo $__env->make('partials.flash', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <div class="col-12">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0"><?php echo e(__('Google Review')); ?></h3>
                            </div>
                        </div>
                    </div>
                    <form class="card-body" method="POST" action="<?php echo e(route('admin.googleReview.store')); ?>">
                        <?php echo csrf_field(); ?>
                        <div class="pl-lg-4">
                            <div class="form-group focused">
                                <label class="form-control-label" for="google_review">
                                    <?php echo e(__('Google review link')); ?>

                                </label>
                                <input type="url" name="google_review" id="google_review"
                                    class="form-control form-control-alternative"
                                    placeholder="<?php echo e(__('Enter google review link')); ?>" required
                                    value="<?php echo e(old('google_review', auth()->user()->restaurant->google_review)); ?>">
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success mt-4">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <?php echo $__env->make('layouts.footers.auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', ['title' => __('Google reivews')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/resources/views/googleReview/index.blade.php ENDPATH**/ ?>