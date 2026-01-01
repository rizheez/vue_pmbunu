<?php

namespace App\Mail;

use App\Models\ReregistrationPayment;
use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class PaymentVerifiedMail extends Mailable
{
    use Queueable, SerializesModels;

    public User $student;

    public ReregistrationPayment $payment;

    /**
     * Create a new message instance.
     */
    public function __construct(User $student, ReregistrationPayment $payment)
    {
        $this->student = $student;
        $this->payment = $payment;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Pembayaran Daftar Ulang Telah Diverifikasi - PMB UNU Kaltim',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'emails.payment-verified',
            with: [
                'student' => $this->student,
                'payment' => $this->payment,
            ],
        );
    }

    /**
     * Get the attachments for the message.
     */
    public function attachments(): array
    {
        return [];
    }
}
