<?php

use App\Http\Controllers\Webapp\PaymentController;
use App\Livewire\Webapp\Home;
use App\Livewire\Webapp\OrderPage;
use App\Livewire\Webapp\OrderSuccessPage;
use App\Livewire\Webapp\ProductsPage;
use Illuminate\Support\Facades\Route;

Route::get('stripe/success', [PaymentController::class, 'stripeSuccess'])->name('checkout.success');
Route::get('stripe/cancel', [PaymentController::class, 'stripeCancel'])->name('checkout.cancel');
Route::get('order/cancel/{transaction}', [PaymentController::class, 'orderCancel'])->name('order.cancel');
Route::get('order/success/{transaction}', OrderSuccessPage::class)->name('order.success');
Route::get('order/{company:subdomain}/{table}', OrderPage::class)->name('order.show');
Route::get('products/{company:subdomain}/{table}', ProductsPage::class)->name('products.show');
Route::get('{company:subdomain}/{table}', Home::class)->name('table.show');
