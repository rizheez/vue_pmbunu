<?php

namespace App\Mail;

use App\Models\Registration;
use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class EnrollmentCompletedMail extends Mailable
{
    use Queueable, SerializesModels;

    public User $student;

    public Registration $registration;

    public string $nim;

    public string $programStudiName;

    /**
     * Create a new message instance.
     */
    public function __construct(User $student, Registration $registration, string $nim, string $programStudiName)
    {
        $this->student = $student;
        $this->registration = $registration;
        $this->nim = $nim;
        $this->programStudiName = $programStudiName;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Selamat! Anda Resmi Menjadi Mahasiswa UNU Kaltim - NIM: '.$this->nim,
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'emails.enrollment-completed',
            with: [
                'student' => $this->student,
                'registration' => $this->registration,
                'nim' => $this->nim,
                'programStudiName' => $this->programStudiName,
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
