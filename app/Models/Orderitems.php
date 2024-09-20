<?php

namespace App\Models;

use App\Items;

class Orderitems extends Posts
{
    protected $table = 'order_has_items';

    public function item()
    {
        return $this->belongsTo(Items::class, 'item_id');
    }
}
