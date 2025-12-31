<?php

namespace App\Http\Controllers;

use App\Models\RegistrationPeriod;
use App\Models\ReregistrationPayment;
use App\Models\StudentBiodata;
use App\Models\StudentParent;
use App\Models\StudentSpecialNeed;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;
use Inertia\Response;

class ReregistrationController extends Controller
{
    /**
     * Show the re-registration form.
     */
    public function edit(): Response|RedirectResponse
    {
        $activePeriod = RegistrationPeriod::where('is_active', true)->first();

        if (! $activePeriod) {
            return redirect()->route('student.dashboard')
                ->with('error', 'Tidak ada periode pendaftaran yang aktif saat ini.');
        }

        // Check if registration is accepted
        $registration = \App\Models\Registration::where('user_id', Auth::id())->first();

        if (! $registration || $registration->status !== 'accepted') {
            return redirect()->route('student.dashboard')
                ->with('error', 'Daftar ulang hanya untuk mahasiswa yang sudah diterima.');
        }

        $biodata = StudentBiodata::with(['parents', 'specialNeeds'])
            ->where('user_id', Auth::id())
            ->first();

        if (! $biodata) {
            return redirect()->route('student.biodata.edit')
                ->with('error', 'Silakan lengkapi biodata terlebih dahulu.');
        }

        // Get payment data
        $payment = ReregistrationPayment::where('user_id', Auth::id())->first();

        return Inertia::render('student/reregistration/Edit', [
            'biodata' => $biodata,
            'parents' => $biodata->parents,
            'specialNeeds' => $biodata->specialNeeds->first(),
            'activePeriod' => $activePeriod,
            'options' => $this->getFormOptions(),
            'payment' => $payment,
            'paymentAmount' => 300000,
        ]);
    }

    /**
     * Update re-registration data.
     */
    public function update(Request $request): RedirectResponse
    {
        $biodata = StudentBiodata::where('user_id', Auth::id())->firstOrFail();

        $validated = $request->validate([
            // Contact info
            'npwp' => 'nullable|string|max:30',

            // Address details
            'dusun' => 'nullable|string|max:100',
            'rt' => 'nullable|string|max:5',
            'rw' => 'nullable|string|max:5',
            'kelurahan' => 'required|string|max:100',
            'kode_pos' => 'nullable|string|max:10',
            'kecamatan' => 'required|string|max:100',
            'kabupaten' => 'required|string|max:100',
            'provinsi' => 'required|string|max:100',

            // Additional info
            'kps_recipient' => 'boolean',
            'kps_number' => 'nullable|required_if:kps_recipient,true|string|max:50',
            'residence_type' => 'required|string|in:' . implode(',', array_keys(StudentBiodata::residenceTypeOptions())),
            'transportation' => 'required|string|in:' . implode(',', array_keys(StudentBiodata::transportationOptions())),

            // Parents data
            'parents' => 'required|array|min:1',
            'parents.*.type' => 'required|string|in:ayah,ibu,wali',
            'parents.*.name' => 'required|string|max:255',
            'parents.*.nik' => 'nullable|string|max:16',
            'parents.*.birth_date' => 'nullable|date|before:today',
            'parents.*.is_alive' => 'boolean',
            'parents.*.education' => 'nullable|string|in:' . implode(',', array_keys(StudentParent::educationOptions())),
            'parents.*.occupation' => 'nullable|string|max:100',
            'parents.*.income' => 'nullable|string|in:' . implode(',', array_keys(StudentParent::incomeOptions())),
            'parents.*.phone' => 'nullable|string|max:20',
            'parents.*.address' => 'nullable|string',

            // Special needs
            'special_need_type' => 'required|string|in:' . implode(',', array_keys(StudentSpecialNeed::typeOptions())),
            'special_need_description' => 'nullable|string',
            'special_need_assistance' => 'nullable|string',
        ], [
            'required' => ':attribute wajib diisi.',
            'email' => 'Format email tidak valid.',
            'parents.required' => 'Data orang tua wajib diisi.',
            'parents.min' => 'Minimal 1 data orang tua harus diisi.',
            'parents.*.name.required' => 'Nama :position wajib diisi.',
            'parents.*.type.required' => 'Tipe orang tua wajib dipilih.',
        ]);

        DB::transaction(function () use ($biodata, $validated) {
            // Get mother's name from parents data
            $motherName = collect($validated['parents'])
                ->firstWhere('type', 'ibu')['name'] ?? null;

            // Update biodata
            $biodata->update([
                'mother_name' => $motherName,
                'npwp' => $validated['npwp'] ?? null,
                'dusun' => $validated['dusun'] ?? null,
                'rt' => $validated['rt'] ?? null,
                'rw' => $validated['rw'] ?? null,
                'kelurahan' => $validated['kelurahan'],
                'kode_pos' => $validated['kode_pos'] ?? null,
                'kecamatan' => $validated['kecamatan'],
                'kabupaten' => $validated['kabupaten'],
                'provinsi' => $validated['provinsi'],
                'kps_recipient' => $validated['kps_recipient'] ?? false,
                'kps_number' => $validated['kps_recipient'] ? ($validated['kps_number'] ?? null) : null,
                'residence_type' => $validated['residence_type'],
                'transportation' => $validated['transportation'],
                'reregistration_status' => 'form_completed',
            ]);

            // Sync parents data
            $biodata->parents()->delete();
            foreach ($validated['parents'] as $parentData) {
                $biodata->parents()->create($parentData);
            }

            // Sync special needs
            $biodata->specialNeeds()->delete();
            $biodata->specialNeeds()->create([
                'type' => $validated['special_need_type'],
                'description' => $validated['special_need_description'] ?? null,
                'assistance_needed' => $validated['special_need_assistance'] ?? null,
            ]);
        });

        return redirect()->route('student.reregistration.edit')
            ->with('success', 'Data daftar ulang berhasil disimpan. Silakan lanjutkan ke pembayaran.');
    }

    /**
     * Upload payment proof.
     */
    public function uploadPayment(Request $request): RedirectResponse
    {
        $request->validate([
            'payment_proof' => 'required|file|mimes:jpg,jpeg,png,pdf|max:2048',
        ], [
            'payment_proof.required' => 'Bukti pembayaran wajib diunggah.',
            'payment_proof.mimes' => 'File harus berupa JPG, PNG, atau PDF.',
            'payment_proof.max' => 'Ukuran file maksimal 2MB.',
        ]);

        $biodata = StudentBiodata::where('user_id', Auth::id())->firstOrFail();

        // Check if form is completed first
        if (! in_array($biodata->reregistration_status, ['form_completed', 'payment_pending'])) {
            return redirect()->route('student.reregistration.edit')
                ->with('error', 'Silakan lengkapi form daftar ulang terlebih dahulu.');
        }

        $path = $request->file('payment_proof')->store('reregistration-payments', 'public');

        // Create or update payment record
        $payment = ReregistrationPayment::updateOrCreate(
            ['user_id' => Auth::id()],
            [
                'amount' => 300000,
                'payment_proof_path' => $path,
                'status' => 'pending',
                'verified_by' => null,
                'verified_at' => null,
                'notes' => null,
            ]
        );

        // Update biodata status
        $biodata->update(['reregistration_status' => 'payment_pending']);

        return redirect()->route('student.reregistration.edit')
            ->with('success', 'Bukti pembayaran berhasil diunggah. Menunggu verifikasi admin.');
    }

    /**
     * Get form select options.
     */
    private function getFormOptions(): array
    {
        return [
            'residenceTypes' => StudentBiodata::residenceTypeOptions(),
            'transportations' => StudentBiodata::transportationOptions(),
            'religions' => StudentBiodata::religionOptions(),
            'parentTypes' => StudentParent::typeOptions(),
            'educations' => StudentParent::educationOptions(),
            'incomes' => StudentParent::incomeOptions(),
            'specialNeedTypes' => StudentSpecialNeed::typeOptions(),
        ];
    }
}
