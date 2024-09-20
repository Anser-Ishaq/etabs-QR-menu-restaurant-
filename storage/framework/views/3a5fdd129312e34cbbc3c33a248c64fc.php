<div class="row align-items-center" v-cloak>
    <div :class="item.pulse"></div>
 
    <div class="col ml--2">
        
        <h4 class="mb-0">
            <a href="#!">Waiter name: {{ item.waiter_name}} </a>
        </h4>
        
        <small> {{ item.time }}</small>
        <h4 class="mb-0">
            <a href="#!">Order #{{ item.id_formated }} </a>
        </h4>
        <small>Table : {{ item.client }}</small><br />
        <small>Outstanding: {{ item.price }}</small><br />
    </div>
    <div class="col-auto">
        <a class="btn btn-sm btn-primary" :href="item.link"><?php echo e(__('Details')); ?></a>
    </div>
  </div>
<?php /**PATH /var/www/html/resources/views/orders/partials/liveitem.blade.php ENDPATH**/ ?>