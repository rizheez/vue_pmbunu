<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Models\AdmissionLetter;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\StreamedResponse;

class StudentAdmissionLetterController extends Controller
{
    public function show(): StreamedResponse
    {
        $letter = AdmissionLetter::query()
            ->where('user_id', Auth::id())
            ->firstOrFail();

        abort_unless($letter->pdf_path && Storage::disk('public')->exists($letter->pdf_path), 404);

        return Storage::disk('public')->response(
            $letter->pdf_path,
            'Surat-Penerimaan-'.$this->safeDownloadFilename($letter->letter_number).'.pdf'
        );
    }

    private function safeDownloadFilename(string $letterNumber): string
    {
        return trim((string) preg_replace('/[^A-Za-z0-9\-]+/', '-', $letterNumber), '-');
    }
}
