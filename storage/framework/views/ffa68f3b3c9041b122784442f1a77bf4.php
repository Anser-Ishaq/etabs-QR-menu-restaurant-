<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo e($subjectTitle); ?></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 12px;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .bg-image {
            display: block;
            margin: 0 auto;
            width: 120px;
            height: 120px;
            background-size: cover;
            background-position: center;
        }

        .divider {
            height: 2px;
            background-color: lightgray;
            margin: 8px 0;
        }

        .text-center {
            text-align: center;
        }

        .text-gray {
            color: gray;
        }

        .fw-bold {
            font-weight: bold;
        }

        .financial-details,
        .order-items {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        .financial-details td,
        .order-items td {
            padding: 6px;
        }

        .financial-details td:first-child,
        .order-items td:first-child {
            text-align: left;
        }

        .financial-details td:last-child,
        .order-items td:last-child {
            text-align: right;
        }

        .footer-table {
            margin: 10px auto;
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h2 style="margin: 0;">Your <?php echo e($transaction->order->restorant->name); ?>'s Receipt</h2>
            <div class="bg-image" style="background-image: url('<?php echo e(asset($transaction->order->restorant->logom)); ?>');">
            </div>
            <h4 style="margin: 0;"><?php echo e($transaction->order->restorant->address); ?></h4>
        </div>
        <div class="divider"></div>
        <div class="text-center">
            <?php echo e(__('Table')); ?>: <?php echo e($transaction->order->table->name); ?>

        </div>

        <table class="order-items">
            <?php if($transaction->items->isNotEmpty()): ?>
                <?php $__currentLoopData = $transaction->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php ($theItemPrice = $item->variant_price ? $item->variant_price : $item->orderItem->item->price); ?>
                    <tr>
                        <td>
                            <span><?php echo e($item->quantity); ?>x <?php echo e($item->orderItem->item->name); ?></span>
                        </td>
                        <td style="text-align: end;">
                            <?php echo money($theItemPrice * $item->quantity + $item->vatvalue, $transaction->currency, config('settings.do_convertion')); ?>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php else: ?>
                <?php $__currentLoopData = $transaction->order->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php ($theItemPrice = $item->pivot->variant_price ? $item->pivot->variant_price : $item->price); ?>
                    <?php if($item->pivot->qty > 0): ?>
                        <tr>
                            <td>
                                <span><?php echo e($item->pivot->qty); ?>x <?php echo e($item->name); ?></span>
                            </td>
                            <td style="text-align: end;">
                                <?php echo money($theItemPrice * $item->pivot->qty + $item->pivot->vatvalue, $transaction->currency, config('settings.do_convertion')); ?>
                            </td>
                        </tr>
                    <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php endif; ?>

        </table>
        <div class="divider"></div>

        <table class="financial-details">
            <tr class="text-gray">
                <td><?php echo e(__('VAT')); ?> (@ 15%)</td>
                <td style="text-align: end;">
                    <?php echo money($transaction->tax, $transaction->currency, config('settings.do_convertion')); ?>
                </td>
            </tr>
            <tr class="fw-bold">
                <td><?php echo e(__('Total incl. VAT')); ?></td>
                <td style="text-align: end;">
                    <?php echo money($transaction->amount_with_tax, $transaction->currency, config('settings.do_convertion')); ?>
                </td>
            </tr>
            <tr class="text-gray">
                <td><?php echo e(__('Tip')); ?></td>
                <td style="text-align: end;">
                    <?php echo money($transaction->tip, $transaction->currency, config('settings.do_convertion')); ?>
                </td>
            </tr>
            <tr class="text-gray">
                <td><?php echo e(__('Service fee')); ?></td>
                <td style="text-align: end;">
                    <?php echo money($transaction->service, $transaction->currency, config('settings.do_convertion')); ?>
                </td>
            </tr>
            <tr class="fw-bold">
                <td><?php echo e(__('Total amount paid')); ?></td>
                <td style="text-align: end;">
                    <?php echo money($transaction->total, $transaction->currency, config('settings.do_convertion')); ?>
                </td>
            </tr>
        </table>
        <div class="divider"></div>
        <?php if($transaction->order->payment_status === 'paid'): ?>
            <?php if($transaction->payment_method): ?>
                <div style="margin-bottom: 1rem;">
                    <span><?php echo e(__('Paid with')); ?>:</span>
                    <span><?php echo e(str($transaction->payment_method)->headline()); ?></span>
                    <?php if($transaction->last4): ?>
                        <span>****<?php echo e($transaction->last4); ?></span>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
            <div style="margin-bottom: 1rem;" class="fw-bold">
                <span><?php echo e(__('Bill closed')); ?>:</span>
                <span><?php echo e($transaction->order->updated_at->format('d/m/Y, h:i A')); ?></span>
            </div>
        <?php endif; ?>
        <table class="footer-table">
            <tr>
                <td class="text-center">
                    <p class="mb-0" style="padding-bottom: 6px;"><?php echo e(__('Powered by')); ?></p>
                </td>
                <td>
                    <img src='<?php echo e(asset('assets/images/logo-dark.png')); ?>' alt="logo"
                        style="max-width: 50px; height: auto;">
                </td>
            </tr>
        </table>
    </div>
</body>

</html>
<?php /**PATH /var/www/html/resources/views/emails/webapp/orderReceipt.blade.php ENDPATH**/ ?>