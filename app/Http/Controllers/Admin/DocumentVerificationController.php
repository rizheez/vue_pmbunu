<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\DocumentRejectedMail;
use App\Models\DocumentVerification;
use App\Models\StudentBiodata;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Inertia\Inertia;
use Inertia\Response;

class DocumentVerificationController extends Controller
{
    /**
     * Show documents for a specific student
     */
    public function show(int $studentId): Response
    {
        $student = User::with([
            'studentBiodata.verifications',
            'registration.registrationPeriod',
        ])
            ->where('role', 'student')
            ->findOrFail($studentId);

        return Inertia::render('admin/students/Documents', [
            'student' => $student,
        ]);
    }

    /**
     * Approve a document
     */
    public function approve(Request $request, int $verificationId): RedirectResponse
    {
        $verification = DocumentVerification::findOrFail($verificationId);

        $verification->update([
            'status' => 'approved',
            'verified_by' => auth()->id(),
            'verified_at' => now(),
            'notes' => $request->notes,
        ]);

        // Check if all documents are approved to update registration status
        $biodata = $verification->studentBiodata;
        if ($biodata && $biodata->user && $biodata->user->registration) {
            $biodata->user->registration->checkAndUpdateVerificationStatus();
        }

        return redirect()->back()->with('success', 'Dokumen berhasil disetujui.');
    }

    /**
     * Reject a document
     */
    public function reject(Request $request, int $verificationId): RedirectResponse
    {
        $request->validate([
            'notes' => 'required|string|max:500',
        ]);

        $verification = DocumentVerification::findOrFail($verificationId);

        $verification->update([
            'status' => 'rejected',
            'verified_by' => auth()->id(),
            'verified_at' => now(),
            'notes' => $request->notes,
        ]);

        // Check and update registration status
        $biodata = $verification->studentBiodata;
        if ($biodata && $biodata->user && $biodata->user->registration) {
            $biodata->user->registration->checkAndUpdateVerificationStatus();
        }

        return redirect()->back()->with('success', 'Dokumen ditolak.');
    }

    /**
     * Bulk verify documents and send email if any rejected
     */
    public function bulkVerify(Request $request, int $studentId): RedirectResponse
    {
        $request->validate([
            'verifications' => 'required|array',
            'verifications.*.id' => 'required|exists:document_verifications,id',
            'verifications.*.status' => 'required|in:approved,rejected',
            'verifications.*.notes' => 'nullable|string|max:500',
        ]);

        $student = User::with('studentBiodata.verifications', 'registration')
            ->where('role', 'student')
            ->findOrFail($studentId);

        $rejectedDocuments = [];

        foreach ($request->verifications as $verData) {
            $verification = DocumentVerification::find($verData['id']);

            if ($verification) {
                $verification->update([
                    'status' => $verData['status'],
                    'verified_by' => auth()->id(),
                    'verified_at' => now(),
                    'notes' => $verData['notes'] ?? null,
                ]);

                // Collect rejected documents for email
                if ($verData['status'] === 'rejected') {
                    $rejectedDocuments[] = [
                        'type' => $verification->document_type,
                        'notes' => $verData['notes'] ?? null,
                    ];
                }
            }
        }

        // Update registration status
        if ($student->registration) {
            $student->registration->checkAndUpdateVerificationStatus();
        }

        // Send email if any documents were rejected
        if (! empty($rejectedDocuments)) {
            Mail::to($student->email)->send(new DocumentRejectedMail($student, $rejectedDocuments));

            return redirect()->back()->with('success', 'Verifikasi dokumen selesai. Email notifikasi penolakan telah dikirim.');
        }

        return redirect()->route('admin.students.show', $studentId)->with('success', 'Semua dokumen berhasil diverifikasi.');
    }
}
