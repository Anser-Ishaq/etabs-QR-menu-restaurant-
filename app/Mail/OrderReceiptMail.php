<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class OrderReceiptMail extends Mailable
{
    use Queueable, SerializesModels;

    public $transaction;

    public $subjectTitle;

    public function __construct($transaction)
    {
        $this->transaction = $transaction;
        $transaction->load('items.orderItem.item');
        $this->subjectTitle = config('app.name', 'etabs').__(' Payment Receipt');
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: $this->subjectTitle,
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.webapp.orderReceipt',
        );
    }

    public function attachments(): array
    {
        return [];
    }
}
