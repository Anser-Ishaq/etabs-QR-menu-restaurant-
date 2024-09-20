<?php if(strlen(config('settings.recaptcha_site_key'))>2): ?>
    <?php $__env->startSection('head'); ?>
    <?php echo htmlScriptTagJsApi([]); ?>

    <?php $__env->stopSection(); ?>
<?php endif; ?>

<?php $__env->startSection('content'); ?>
    <?php echo $__env->make('layouts.headers.guest', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <div class="container mt--8 pb-5">
        <!-- Table -->
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="card bg-secondary shadow border-0">
                    <div class="card-body px-lg-5 py-lg-5">
                        <form id="<?php echo e(getFormId()); ?>" role="form" method="POST" action="<?php echo e(route('register')); ?>">
                            <?php echo csrf_field(); ?>

                            <div class="form-group<?php echo e($errors->has('name') ? ' has-danger' : ''); ?>">
                                <div class="input-group input-group-alternative mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                                    </div>
                                    <input class="form-control<?php echo e($errors->has('name') ? ' is-invalid' : ''); ?>" placeholder="<?php echo e(__('Name')); ?>" type="text" name="name" value="<?php echo e(old('name')); ?>" required autofocus>
                                </div>
                                <?php if($errors->has('name')): ?>
                                    <span class="invalid-feedback" style="display: block;" role="alert">
                                        <strong><?php echo e($errors->first('name')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                            <div class="form-group<?php echo e($errors->has('email') ? ' has-danger' : ''); ?>">
                                <div class="input-group input-group-alternative mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                    </div>
                                    <input class="form-control<?php echo e($errors->has('email') ? ' is-invalid' : ''); ?>" placeholder="<?php echo e(__('Email')); ?>" type="email" name="email" value="<?php echo e(old('email')); ?>" required>
                                </div>
                                <?php if($errors->has('email')): ?>
                                    <span class="invalid-feedback" style="display: block;" role="alert">
                                        <strong><?php echo e($errors->first('email')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                            <div class="form-group<?php echo e($errors->has('phone') ? ' has-danger' : ''); ?>">
                                <div class="input-group input-group-alternative mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-mobile-button"></i></span>
                                    </div>
                                    <input class="form-control<?php echo e($errors->has('phone') ? ' is-invalid' : ''); ?>" placeholder="<?php echo e(__('Phone')); ?>" type="phone" name="phone" value="<?php echo e(old('phone')); ?>" required>
                                </div>
                                <?php if($errors->has('phone')): ?>
                                    <span class="invalid-feedback" style="display: block;" role="alert">
                                        <strong><?php echo e($errors->first('phone')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                            <div class="form-group<?php echo e($errors->has('password') ? ' has-danger' : ''); ?>">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                    </div>
                                    <input class="form-control<?php echo e($errors->has('password') ? ' is-invalid' : ''); ?>" placeholder="<?php echo e(__('Password')); ?>" type="password" name="password" required>
                                </div>
                                <?php if($errors->has('password')): ?>
                                    <span class="invalid-feedback" style="display: block;" role="alert">
                                        <strong><?php echo e($errors->first('password')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                    </div>
                                    <input class="form-control" placeholder="<?php echo e(__('Confirm Password')); ?>" type="password" name="password_confirmation" required>
                                </div>
                            </div>

                            <?php if(config('settings.enable_birth_date_on_register')): ?>
                            <div class="form-group">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-badge"></i></span>
                                    </div>
                                    <input class="form-control" placeholder="<?php echo e(__('Date of Birth')); ?>" id="birth_date" type="date" name="birth_date" required>
                                </div>
                                <?php if($errors->has('birth_date')): ?>
                                <span class="invalid-feedback" style="display: block;" role="alert">
                                    <strong><?php echo e($errors->first('birth_date')); ?></strong>
                                </span>
                            <?php endif; ?>
                            </div>
                            <?php endif; ?>




                            <div class="text-center">
                                <?php if(strlen(config('settings.recaptcha_site_key'))>2): ?>

                                    <?php if($errors->has('g-recaptcha-response')): ?>
                                        <span class="invalid-feedback" role="alert">
                                            <strong><?php echo e($errors->first('g-recaptcha-response')); ?></strong>
                                        </span>
                                    <?php endif; ?>

                                    <?php echo htmlFormButton(__('Save'), ['id'=>'thesubmitbtn','class' => 'btn btn-primary mt-4', 'disabled'=>"true"]); ?>

                                <?php else: ?>
                                    <button disabled id="thesubmitbtn" type="submit" class="btn btn-primary mt-4"><?php echo e(__('Create account')); ?></button>
                                <?php endif; ?>

                                <br /><br />
                                <div class="form-check"><input type="checkbox" name="termsCheckBox" id="termsCheckBox" class="h-4 w-4 border border-gray-300 rounded-sm bg-white checked:bg-blue-600 checked:border-blue-600 focus:outline-none transition duration-200 mt-1 align-top  ">
                                    <label for="terms" class="form-check-label text-gray-500">
                                    &nbsp;&nbsp;<?php echo e(__('i_agree_to')); ?>

                                    <a href="<?php echo e(config('settings.link_to_ts')); ?>" target="_blank" style="text-decoration: underline;"><?php echo e(__('terms_of_service')); ?></a> <?php echo e(__('and')); ?>

                                    <a href="<?php echo e(config('settings.link_to_pr')); ?>" target="_blank" style="text-decoration: underline;"><?php echo e(__('privacy_policy')); ?></a>.
                                    </label>
                                </div>

                                <script>
                                    window.onload = function () {

                                    $('#termsCheckBox').on('click',function () {
                                        $('#thesubmitbtn').prop("disabled", !$("#termsCheckBox").prop("checked"));
                                        if(this.checked){
                                            $('#thesubmitbtn').addClass('opacity-100');
                                        }else{
                                            $('#thesubmitbtn').removeClass('opacity-100');

                                        }

                                    })
                                }
                                </script>

                            </div>
                        </form>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-6">
                        <?php if(Route::has('password.request')): ?>
                            <a href="<?php echo e(route('password.request')); ?>" class="text-light">
                                <small><?php echo e(__('Forgot password?')); ?></small>
                            </a>
                        <?php endif; ?>
                    </div>
                    <div class="col-6 text-right">
                        <a href="<?php echo e(route('login')); ?>" class="text-light">
                            <small><?php echo e(__('Back to login')); ?></small>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', ['class' => config('app.isloyalty')?"":'bg-default'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/resources/views/auth/register.blade.php ENDPATH**/ ?>