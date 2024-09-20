<?php

namespace App\Http\Controllers\Webapp;

use App\Enums\PaymentType;
use App\Events\OrderPlaced;
use App\Http\Controllers\Controller;
use App\Mail\OrderReceiptMail;
use App\Models\Transaction;
use App\Order;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Stripe\Stripe;

class PaymentController extends Controller
{
    public function orderCancel(Transaction $transaction)
    {
        return view('webapp.orders.cancel', ['transaction' => $transaction]);
    }

    public function stripeSuccess(Request $request)
    {
        abort_unless($request->has('session_id'), 404);

        Stripe::setApiKey(config('settings.stripe_secret'));

        try {
            $session = \Stripe\Checkout\Session::retrieve($request->get('session_id'));
        } catch (\Error $e) {
            abort(404);
        }

        $transaction = Transaction::query()
            ->where('session_id', $session->id)
            ->where('is_paid', false)
            ->latest('id')
            ->firstOrFail();

        $order = Order::query()
            ->whereIn('payment_status', [PaymentType::UNPAID->value, PaymentType::PARTIAL_PAID->value])
            ->latest('id')
            ->findOrFail($transaction->order_id);

        $transactionUpdate = ['is_paid' => true];
        $paymentType = null;
        try {
            $paymentIntent = \Stripe\PaymentIntent::retrieve($session->payment_intent);
            $paymentMethod = \Stripe\PaymentMethod::retrieve($paymentIntent->payment_method);

            if ($paymentMethod->card) {
                $paymentType = $paymentMethod->card->wallet?->type ?? $paymentMethod->card->display_brand;
                $transactionUpdate += [
                    'payment_method' => $paymentType,
                    'last4' => $paymentMethod->card->last4,
                ];
            }
        } catch (\Throwable $th) {
            //throw $th;
        }

        if ($order->situation === PaymentType::UNPAID) {
            event(new OrderPlaced());
        }

        $transaction->update($transactionUpdate);

        $paymentStatus = $order->order_price <= (float) $order->transactions()->where('is_paid', true)->sum('amount') ? PaymentType::PAID : PaymentType::PARTIAL_PAID;

        $order->update([
            'tip' => $order->tip + $transaction->tip,
            'payment_status' => $paymentStatus->value,
            'payment_method' => $paymentType,
        ]);

        $users = [$order->restorant->user->email];

        if ($session->customer_email) {
            $users[] = $session->customer_email;
        } elseif ($session->customer_details) {
            $users[] = $session->customer_details->email;
        }

        foreach (User::query()->role('admin')->get() as $admin) {
            $users[] = $admin->email;
        }

        try {
            Mail::to($users)->send(new OrderReceiptMail($transaction));
        } catch (\Throwable $th) {
        }

        return redirect()->route('webapp.order.success', ['transaction' => $transaction->id]);
    }

    public function stripeCancel(Request $request)
    {
        abort_unless($request->has('session_id'), 404);

        $transaction = Transaction::query()
            ->where('session_id', $request->get('session_id'))
            ->where('is_paid', false)
            ->latest('id')
            ->firstOrFail();

        // $order = Order::query()
        //     ->whereIn('payment_status', [PaymentType::UNPAID->value, PaymentType::PARTIAL_PAID->value])
        //     ->latest('id')
        //     ->findOrFail($transaction->order_id);

        $transaction->forceFill([
            'session_id' => null,
        ]);

        // $transaction->delete();

        return redirect()->route('webapp.order.cancel', ['transaction' => $transaction->id]);
    }
}
