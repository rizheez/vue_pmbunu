<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\AdmissionLetter;
use BaconQrCode\Common\ErrorCorrectionLevel;
use BaconQrCode\Renderer\Image\SvgImageBackEnd;
use BaconQrCode\Renderer\ImageRenderer;
use BaconQrCode\Renderer\RendererStyle\RendererStyle;
use BaconQrCode\Writer;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class AdmissionLetterPdfService
{
    public function generate(AdmissionLetter $letter): string
    {
        File::ensureDirectoryExists(storage_path('fonts'));

        $letter->loadMissing([
            'user.studentBiodata',
            'user.registration.acceptedProgramStudi',
        ]);

        $verificationUrl = route('admission-letters.short-verify', $letter->verification_token);
        $pdf = Pdf::loadView('pdf.admission-letter', [
            'letter' => $letter,
            'user' => $letter->user,
            'biodata' => $letter->user->studentBiodata,
            'registration' => $letter->user->registration,
            'verificationUrl' => $verificationUrl,
            'qrCodeBase64' => $this->makeQrCodeBase64($verificationUrl),
            'headerBase64' => $this->imageBase64(public_path('assets/letter_header.jpg'), 'image/jpeg'),
            'footerBase64' => $this->imageBase64(public_path('assets/letter_footer.jpg'), 'image/jpeg'),
            'logoBase64' => $this->imageBase64(public_path('assets/images/logo_unu.png'), 'image/png'),
        ]);

        $pdf->setPaper('a4', 'portrait');
        $pdf->setOption('isRemoteEnabled', false);
        $pdf->setOption('isHtml5ParserEnabled', true);

        $path = 'admission-letters/'.$this->safeFileName($letter->letter_number).'.pdf';
        Storage::disk('public')->put($path, $pdf->output());

        return $path;
    }

    private function makeQrCodeBase64(string $content): string
    {
        $renderer = new ImageRenderer(
            new RendererStyle(220, 3),
            new SvgImageBackEnd
        );

        $svg = (new Writer($renderer))->writeString($content, 'UTF-8', ErrorCorrectionLevel::Q());

        return 'data:image/svg+xml;base64,'.base64_encode($svg);
    }

    private function imageBase64(string $path, string $mime): ?string
    {
        if (! file_exists($path)) {
            return null;
        }

        return 'data:'.$mime.';base64,'.base64_encode((string) file_get_contents($path));
    }

    private function safeFileName(string $value): string
    {
        $filename = preg_replace('/[^A-Za-z0-9\-]+/', '-', $value) ?: 'surat-penerimaan';

        return trim($filename, '-');
    }
}
