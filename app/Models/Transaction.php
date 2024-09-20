<?php

namespace App\Models;

use App\Order;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Transaction extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $casts = [
        'is_paid' => 'boolean',
    ];

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class);
    }

    public function items(): HasMany
    {
        return $this->hasMany(TransactionItem::class);
    }

    protected function amountWithTax(): Attribute
    {
        return Attribute::get(fn () => $this->amount + $this->tax);
    }

    protected function total(): Attribute
    {
        return Attribute::get(fn () => $this->amount + $this->tax + $this->service + $this->tip);
    }
}
