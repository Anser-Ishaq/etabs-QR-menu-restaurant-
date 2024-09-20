<?php if(!config('settings.makePureSaaS', false) && !(config('app.isdrive', false) || config('app.issd', false))): ?>
    <?php
    $fields = [
        [
            'ftype' => 'bool',
            'name' => 'View Menu',
            'id' => 'can_pickup',
            'value' => $restorant->can_pickup == 1 ? 'true' : 'false',
        ],
        [
            'ftype' => 'bool',
            'name' => 'Pay with QR code',
            'id' => 'can_deliver',
            'value' => $restorant->can_deliver == 1 ? 'true' : 'false',
        ],
        [
            'ftype' => 'bool',
            'name' => 'In Store Ordering',
            'id' => 'disable_ordering',
            'value' => $restorant->getConfig('disable_ordering', false) ? 'true' : 'false',
        ],
    ];
    
    if (auth()->user()->hasRole('owner')) {
        $fields[] = [
            'ftype' => 'bool',
            'name' => 'Enable Audio',
            'id' => 'enable_audio',
            'value' => $restorant->enable_audio == 1 ? 'true' : 'false',
            'checked' => $restorant->enable_audio == 1, 
        ];
    }
    ?>

    <?php echo $__env->make('partials.fields', ['fields' => $fields], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php if(config('app.isft') && auth()->user()->hasRole('admin')): ?>
        <?php echo $__env->make('partials.fields', [
            'fields' => [
                [
                    'ftype' => 'bool',
                    'name' => 'Self Delivery',
                    'id' => 'self_deliver',
                    'value' => $restorant->self_deliver == 1 ? 'true' : 'false',
                ],
            ],
        ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php endif; ?>

    <?php if(config('app.isqrexact')): ?>
        <?php echo $__env->make('partials.fields', [
            'fields' => [
                [
                    'ftype' => 'bool',
                    'name' => 'Call Waiter',
                    'id' => 'disable_callwaiter',
                    'value' => $restorant->getConfig('disable_callwaiter', 0) ? 'true' : 'false',
                ],
                // ['ftype'=>'bool','name'=>"Disable continues orders",'id'=>"disable_continues_ordering",'value'=>$restorant->getConfig('disable_continues_ordering', 0) ? "true" : "false"],
                // ['ftype'=>'bool','name'=>"Dine In",'id'=>"can_dinein",'value'=>$restorant->can_dinein == 1 ? "true" : "false"],
            ],
        ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php endif; ?>
<?php endif; ?>
<?php /**PATH /var/www/html/resources/views/restorants/partials/options.blade.php ENDPATH**/ ?>