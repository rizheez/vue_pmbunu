<?php

namespace App\Mail;

use App\Models\AdmissionLetter;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Attachment;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class AdmissionLetterMail extends Mailable
{
    use Queueable, SerializesModels;

    public AdmissionLetter $letter;

    public function __construct(AdmissionLetter $letter)
    {
        $this->letter = $letter;
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Surat Penerimaan Mahasiswa Baru UNU Kaltim',
        );
    }

    public function content(): Content
    {
        return new Content(
            markdown: 'emails.admission-letter',
            with: [
                'letter' => $this->letter,
                'student' => $this->letter->user,
                'biodata' => $this->letter->user->studentBiodata,
                'registration' => $this->letter->user->registration,
            ],
        );
    }

    /**
     * @return array<int, Attachment>
     */
    public function attachments(): array
    {
        if (! $this->letter->pdf_path) {
            return [];
        }

        return [
            Attachment::fromStorageDisk('public', $this->letter->pdf_path)
                ->as('Surat-Penerimaan-'.$this->safeFilename($this->letter->letter_number).'.pdf')
                ->withMime('application/pdf'),
        ];
    }

    private function safeFilename(string $letterNumber): string
    {
        return trim((string) preg_replace('/[^A-Za-z0-9\-]+/', '-', $letterNumber), '-');
    }
}
