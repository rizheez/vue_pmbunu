<?php

namespace App\Mail;

use App\Models\ReregistrationPayment;
use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class PaymentRejectedMail extends Mailable
{
    use Queueable, SerializesModels;

    public User $student;

    public ReregistrationPayment $payment;

    public ?string $reason;

    /**
     * Create a new message instance.
     */
    public function __construct(User $student, ReregistrationPayment $payment, ?string $reason = null)
    {
        $this->student = $student;
        $this->payment = $payment;
        $this->reason = $reason;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Pembayaran Daftar Ulang Ditolak - PMB UNU Kaltim',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'emails.payment-rejected',
            with: [
                'student' => $this->student,
                'payment' => $this->payment,
                'reason' => $this->reason,
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
