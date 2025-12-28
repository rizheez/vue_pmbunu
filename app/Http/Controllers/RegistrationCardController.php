<?php

namespace App\Http\Controllers;

use App\Models\Registration;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class RegistrationCardController extends Controller
{
    /**
     * Show registration card for admin (by user ID)
     */
    public function show(int $id): Response
    {
        $user = User::with([
            'studentBiodata',
            'registration.registrationPeriod',
            'registration.registrationType',
            'registration.registrationPath',
            'registration.programStudiChoice1.fakultas',
            'registration.programStudiChoice2.fakultas',
        ])->findOrFail($id);

        if (! $user->registration) {
            abort(404, 'Registration not found');
        }

        return $this->generatePdf($user);
    }

    /**
     * Show registration card for logged-in student
     */
    public function showStudent(): Response
    {
        $user = User::with([
            'studentBiodata',
            'registration.registrationPeriod',
            'registration.registrationType',
            'registration.registrationPath',
            'registration.programStudiChoice1.fakultas',
            'registration.programStudiChoice2.fakultas',
        ])->findOrFail(Auth::id());

        if (! $user->registration) {
            abort(404, 'Anda belum memiliki pendaftaran');
        }

        return $this->generatePdf($user);
    }

    /**
     * Generate PDF registration card
     */
    private function generatePdf(User $user): Response
    {
        $registration = $user->registration;
        $biodata = $user->studentBiodata;

        // Get photo as base64 for embedding in PDF
        $photoBase64 = null;
        if ($biodata && $biodata->photo_path) {
            try {
                $photoPath = Storage::disk('public')->path($biodata->photo_path);
                if (file_exists($photoPath)) {
                    $photoData = file_get_contents($photoPath);
                    $photoBase64 = 'data:image/jpeg;base64,'.base64_encode($photoData);
                }
            } catch (\Exception $e) {
                // Photo not available, use placeholder
            }
        }

        // Get logo as base64
        $logoBase64 = null;
        $logoPath = public_path('assets/images/logo_unu.png');
        if (file_exists($logoPath)) {
            $logoData = file_get_contents($logoPath);
            $logoBase64 = 'data:image/png;base64,'.base64_encode($logoData);
        }

        $pdf = Pdf::loadView('pdf.registration-card', [
            'user' => $user,
            'registration' => $registration,
            'biodata' => $biodata,
            'photoBase64' => $photoBase64,
            'logoBase64' => $logoBase64,
        ]);

        $pdf->setPaper('a4', 'portrait');

        $filename = 'Kartu-Peserta-'.($registration->registration_number ?? $user->id).'.pdf';

        return $pdf->stream($filename);
    }
}
