<?php

namespace App\Enums;

enum PaymentType: string
{
    case UNPAID = 'unpaid';
    case PARTIAL_PAID = 'partial_paid';
    case PAID = 'paid';
    case CANCEL = 'cancel';

    public function title(): string
    {
        return match ($this) {
            self::PAID => __('Paid'),
            self::UNPAID => __('Just created'),
            self::PARTIAL_PAID => __('Partial paid'),
            self::CANCEL => __('Cancel'),
            default => __('Un paid'),
        };
    }

    public function badge(): string
    {
        $badgeTypes = [
            'badge-info',
        ];

        $badgeType = match ($this) {
            self::PAID => 'badge-success',
            self::CANCEL => 'badge-danger',
            self::UNPAID => 'badge-primary',
            self::PARTIAL_PAID => 'badge-warning',
            default => 'badge-default',
        };

        $badge = "<span class='badge {$badgeType} badge-pill'>".$this->title().'</span>';

        return $badge;
    }

    public static function forSelect(): array
    {
        $items = [];

        foreach (self::cases() as $case) {
            $items[$case->value] = $case->title();
        }

        return $items;
    }
}
