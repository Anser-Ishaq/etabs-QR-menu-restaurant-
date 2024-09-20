<?php

namespace App\Livewire\Webapp;

use App\Mail\OrderReceiptMail;
use App\Models\Transaction;
use Illuminate\Support\Facades\Mail;
use Livewire\Component;

class OrderSuccessPage extends Component
{
    public ?string $email = null;

    public bool $emailSent = false;

    public bool $emailFailed = false;

    public Transaction $transaction;

    public function mount(Transaction $transaction)
    {
        $this->transaction = $transaction;
    }

    public function render()
    {
        return view('livewire.webapp.order-success-page');
    }

    public function sendEmail(): void
    {
        $this->validateOnly('email');

        try {
            Mail::to($this->email)->send(new OrderReceiptMail($this->transaction));
            $this->emailSent = true;
        } catch (\Throwable $th) {
            $this->emailFailed = true;
        }

    }

    public function rules(): array
    {
        return [
            'email' => ['required', 'email'],
        ];
    }
}
