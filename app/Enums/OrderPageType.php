<?php

namespace App\Enums;

enum OrderPageType: string
{
    case BILL = 'bill';
    case PAY_FULL = 'payFull';
    case PAY_YOUR_ITEMS = 'payYourItems';
    case PAY_EQUALLY = 'payEqually';
    case PAY_AMOUNT = 'payAmount';

    public function name(): string
    {
        return "webapp.orders.{$this->value}"; // these values must match with the view blade files
    }
}
