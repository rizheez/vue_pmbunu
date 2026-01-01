<?php

namespace App\Mail;

use App\Models\Registration;
use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class RegistrationReceivedMail extends Mailable
{
    use Queueable, SerializesModels;

    public User $student;

    public Registration $registration;

    /**
     * Create a new message instance.
     */
    public function __construct(User $student, Registration $registration)
    {
        $this->student = $student;
        $this->registration = $registration;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Pendaftaran Anda Telah Diterima - PMB UNU Kaltim',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'emails.registration-received',
            with: [
                'student' => $this->student,
                'registration' => $this->registration,
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
