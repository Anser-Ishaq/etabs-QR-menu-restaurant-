<div class="card-body">
    <?php echo $__env->make('partials.flash', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    



    <?php if(config('app.isft') && $order->client): ?>
        <h6 class="heading-small text-muted mb-4"><?php echo e(__('Client Information')); ?></h6>
        <div class="pl-lg-4">
            <h3><?php echo e($order->client ? $order->client->name : ''); ?></h3>
            <h4><?php echo e($order->client ? $order->client->email : ''); ?></h4>
            <h4><?php echo e($order->address ? $order->address->address : ''); ?></h4>

            <?php if(!empty($order->address->apartment)): ?>
                <h4><?php echo e(__('Apartment number')); ?>: <?php echo e($order->address->apartment); ?></h4>
            <?php endif; ?>
            <?php if(!empty($order->address->entry)): ?>
                <h4><?php echo e(__('Entry number')); ?>: <?php echo e($order->address->entry); ?></h4>
            <?php endif; ?>
            <?php if(!empty($order->address->floor)): ?>
                <h4><?php echo e(__('Floor')); ?>: <?php echo e($order->address->floor); ?></h4>
            <?php endif; ?>
            <?php if(!empty($order->address->intercom)): ?>
                <h4><?php echo e(__('Intercom')); ?>: <?php echo e($order->address->intercom); ?></h4>
            <?php endif; ?>
            <?php if($order->client && !empty($order->client->phone)): ?>
                <br />
                <h4><?php echo e(__('Contact')); ?>: <?php echo e($order->client->phone); ?></h4>
            <?php endif; ?>
        </div>
        <hr class="my-4" />
    <?php else: ?>
        <?php if($order->table): ?>
            <h6 class="heading-small text-muted mb-4"><?php echo e(__('Table Information')); ?></h6>
            <div class="pl-lg-4">
                <?php
                    // Extract the number from the table name
                    $tableNameParts = explode(' ', $order->table->name);
                    $tableNumber = end($tableNameParts);
                ?>
                <h3><?php echo e(__('Table No :') . ' ' . $tableNumber); ?></h3>
                
                <?php if($order->table->restoarea): ?>
                    <h4><?php echo e(__('Area:') . ' ' . $order->table->restoarea->name); ?></h4>
                <?php endif; ?>
                <h5><?php echo e(__('Waiter Name :') . ' ' . $order->table->waiter_name); ?></h5>
                

            </div>
            <hr class="my-4" />
        <?php endif; ?>
    <?php endif; ?>



    <?php
    $currency = config('settings.cashier_currency');
    $convert = config('settings.do_convertion');
    ?>

    <?php if($order->driver): ?>
        <?php if(\Spatie\Permission\PermissionServiceProvider::bladeMethodWrapper('hasRole', 'admin|owner|staff')): ?>
            <h6 class="heading-small text-muted mb-4"><?php echo e(__('Driver')); ?></h6>
            <p><a href="/drivers/<?php echo e($order->driver->id); ?>/edit"><?php echo e($order->driver->name); ?></a></p>
            <hr class="my-4" />
        <?php endif; ?>
    <?php endif; ?>
    <?php if(count($order->items) > 0): ?>
        <h6 class="heading-small text-muted mb-4"><?php echo e(__('Order')); ?></h6>

        <ul id="order-items">
            <?php $__currentLoopData = $order->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php
                $theItemPrice = $item->pivot->variant_price ? $item->pivot->variant_price : $item->price;
                ?>
                <?php if($item->pivot->qty > 0): ?>
                    <li style="line-height: 0;">
                        <h4 class="mb-0"><?php echo e($item->pivot->qty . ' X ' . $item->name); ?> - <?php echo money($theItemPrice, $currency, $convert); ?>
                            

                            

                            <?php if($item->pivot->vatvalue > 0): ?>)
                                <span class="small"> <?php echo e($item->pivot->vat . '%: '); ?> ( <?php echo money($item->pivot->vatvalue, $currency, $convert); ?> )</span>
                            <?php endif; ?>
                            <?php if(\Spatie\Permission\PermissionServiceProvider::bladeMethodWrapper('hasRole', 'admin|owner|staff')): ?>
                                <?php $lasStatusId = $order->status->pluck('id')->last(); ?>
                                <?php if(false && $lasStatusId != 7 && $lasStatusId != 11): ?>
                                    <span class="small">
                                        <button data-toggle="modal" data-target="#modal-order-item-count" type="button"
                                            onclick="$('#item_qty').val('<?php echo e($item->pivot->qty); ?>'); $('#pivot_id').val('<?php echo e($item->pivot->id); ?>');   $('#order_id').val('<?php echo e($order->id); ?>');"
                                            class="btn btn-outline-danger btn-sm">
                                            <span class="btn-inner--icon">
                                                
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-sliders" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                        d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1z" />
                                                </svg>
                                            </span>
                                        </button>
                                    </span>
                                <?php endif; ?>
                    <?php endif; ?>
                    </h4>
                    <?php if(strlen($item->pivot->variant_name) > 2): ?>
                        <br />
                        <table class="table align-items-center">
                            <thead class="thead-light">
                                <tr>
                                    <?php $__currentLoopData = $item->options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <th><?php echo e($option->name); ?></th>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


                                </tr>
                            </thead>
                            <tbody class="list">
                                <tr>
                                    <?php $__currentLoopData = explode(',', $item->pivot->variant_name); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $optionValue): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <td><?php echo e($optionValue); ?></td>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tr>
                            </tbody>
                        </table>
                    <?php endif; ?>

                    <?php if(strlen($item->pivot->extras) > 2): ?>
                        <br /><span><?php echo e(__('Extras')); ?></span><br />
                        <ul>
                            <?php $__currentLoopData = json_decode($item->pivot->extras); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $extra): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li> <?php echo e($extra); ?></li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul><br />
                    <?php endif; ?>
                    <br />
                    </li>
                <?php else: ?>
                    <li>
                        <?php echo e(__('Removed')); ?>

                        <h4 class="text-muted"><?php echo e($item->name); ?> - <?php echo money($theItemPrice, $currency, $convert); ?>

                            <?php if($item->pivot->vatvalue > 0): ?>)
                                <span class="small">-- <?php echo e(__('VAT ') . $item->pivot->vat . '%: '); ?> ( <?php echo money($item->pivot->vatvalue, $currency, $convert); ?>
                                    )</span>
                            <?php endif; ?>
                        </h4>
                        <br />
                    </li>
                <?php endif; ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
        <?php endif; ?>
        <?php if(!empty($order->whatsapp_address)): ?>
            <br />
            <h4><?php echo e(__('Address')); ?>: <?php echo e($order->whatsapp_address); ?></h4>
        <?php endif; ?>
        <?php if(!empty($order->comment)): ?>
            <br />
            <h4><?php echo e(__('Comment')); ?>: <?php echo e($order->comment); ?></h4>
        <?php endif; ?>
        <?php if(strlen($order->phone) > 2): ?>
            <h4><?php echo e(__('Phone')); ?>: <?php echo e($order->phone); ?></h4>
        <?php endif; ?>
        <br />
        <?php if(!empty($order->time_to_prepare)): ?>
            <br />
            <h4><?php echo e(__('Time to prepare')); ?>: <?php echo e($order->time_to_prepare . ' ' . __('minutes')); ?></h4>
            <br />
        <?php endif; ?>

        <h5><?php echo e(__('NET')); ?>: <?php echo money($order->order_price, $currency, $convert); ?></h5>
        <h5><?php echo e(__('VAT')); ?>: <?php echo money($order->vatvalue, $currency); ?></h5>
        <h5><?php echo e(__("Processing Fee")); ?>: <?php echo money($order->fee_value, $currency, $convert); ?> (<?php echo e($order->fee); ?>%)</h5>
        <h4><?php echo e(__('Sub Total')); ?>: <?php echo money($order->order_price+$order->vatvalue+$order->fee_value, $currency, $convert); ?></h4>
        <?php if($order->delivery_method == 1): ?>
            <h4><?php echo e(__('Delivery')); ?>: <?php echo money($order->delivery_price, $currency, $convert); ?></h4>
        <?php endif; ?>
        <?php if($order->discount > 0): ?>
            <h4><?php echo e(__('Discount')); ?>: <?php echo money($order->discount, $currency, $convert); ?></h4>
            <h4><?php echo e(__('Coupon code')); ?>: <?php echo e($order->coupon); ?></h4>
        <?php endif; ?>
        <?php if($order->tip > 0): ?>
            <h4><?php echo e(__('Tip')); ?>: <?php echo money($order->tip, $currency, $convert); ?></h4>
        <?php endif; ?>
        <hr />
        <h3><?php echo e(__('TOTAL')); ?>: <?php echo money($order->delivery_price + $order->sub_total + $order->tip, $currency, $convert); ?></h3>
        <hr />
        <h4><?php echo e(__('Payment method')); ?>: <?php echo e(__(strtoupper($order->payment_method))); ?></h4>
        <h4><?php echo e(__('Payment status')); ?>: <?php echo e($order->situation->title()); ?></h4>
        <?php if($order->payment_status == 'unpaid' && strlen($order->payment_link) > 5): ?>
            <button onclick="location.href='<?php echo e($order->payment_link); ?>'"
                class="btn btn-success"><?php echo e(__('Pay now')); ?></button>
        <?php endif; ?>
        <hr />
        <?php if(config('app.isft') || config('app.iswp')): ?>
            <h4><?php echo e(__('Delivery method')); ?>: <?php echo e($order->getExpeditionType()); ?></h4>
            <h3><?php echo e(__('Time slot')); ?>: <?php echo $__env->make('orders.partials.time', ['time' => $order->time_formated], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?></h3>
        <?php else: ?>
            
            <?php if($order->delivery_method != 3): ?>
                <h3><?php echo e(__('Time slot')); ?>: <?php echo $__env->make('orders.partials.time', ['time' => $order->time_formated], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?></h3>
            <?php endif; ?>
        <?php endif; ?>

        <?php if(isset($custom_data) && count($custom_data) > 0): ?>
            <hr />
            <h3><?php echo e(__(config('settings.label_on_custom_fields'))); ?></h3>
            <?php $__currentLoopData = $custom_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $keyCutom => $itemValue): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <h4><?php echo e(__('custom.' . $keyCutom)); ?>: <?php echo e($itemValue); ?></h4>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php endif; ?>




    </div>
<?php /**PATH /var/www/html/resources/views/orders/partials/orderinfo.blade.php ENDPATH**/ ?>