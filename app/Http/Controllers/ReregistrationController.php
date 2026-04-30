<?php

namespace App\Http\Controllers;

use App\Models\RegistrationPeriod;
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

        // Check if registration is accepted or already in re-registration process
        $registration = \App\Models\Registration::where('user_id', Auth::id())->first();

        if (! $registration || ! in_array($registration->status, ['accepted', 're_registration_pending', 're_registration_verified'])) {
            return redirect()->route('student.dashboard')
                ->with('error', 'Daftar ulang hanya untuk mahasiswa yang sudah diterima.');
        }

        // Auto-update status to re_registration_pending if currently accepted
        if ($registration->status === 'accepted') {
            $registration->update(['status' => 're_registration_pending']);
        }

        $biodata = StudentBiodata::with(['parents', 'specialNeeds'])
            ->where('user_id', Auth::id())
            ->first();

        if (! $biodata) {
            return redirect()->route('student.biodata.edit')
                ->with('error', 'Silakan lengkapi biodata terlebih dahulu.');
        }

        return Inertia::render('student/reregistration/Edit', [
            'biodata' => $biodata,
            'parents' => $biodata->parents,
            'specialNeeds' => $biodata->specialNeeds->first(),
            'activePeriod' => $activePeriod,
            'options' => $this->getFormOptions(),
        ]);
    }

    /**
     * Redirect legacy payment page requests back to data finalization.
     */
    public function paymentPage(): Response|RedirectResponse
    {
        return redirect()->route('student.reregistration.edit')
            ->with('info', 'Daftar ulang gratis. Silakan finalisasi data daftar ulang Anda.');
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
            'residence_type' => 'required|string|in:'.implode(',', array_keys(StudentBiodata::residenceTypeOptions())),
            'transportation' => 'required|string|in:'.implode(',', array_keys(StudentBiodata::transportationOptions())),

            // Parents data
            'parents' => 'required|array|min:1',
            'parents.*.type' => 'required|string|in:ayah,ibu,wali',
            'parents.*.name' => 'required|string|max:255',
            'parents.*.nik' => 'nullable|string|max:16',
            'parents.*.birth_date' => 'nullable|date|before:today',
            'parents.*.is_alive' => 'boolean',
            'parents.*.education' => 'nullable|string|in:'.implode(',', array_keys(StudentParent::educationOptions())),
            'parents.*.occupation' => 'nullable|string|max:100',
            'parents.*.income' => 'nullable|string|in:'.implode(',', array_keys(StudentParent::incomeOptions())),
            'parents.*.phone' => 'nullable|string|max:20',
            'parents.*.address' => 'nullable|string',

            // Special needs
            'special_need_type' => 'required|string|in:'.implode(',', array_keys(StudentSpecialNeed::typeOptions())),
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
                'reregistration_status' => 'completed',
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

            $biodata->user?->registration?->update([
                'status' => 're_registration_verified',
            ]);
        });

        return redirect()->route('student.dashboard')
            ->with('success', 'Data daftar ulang berhasil difinalisasi. Daftar ulang gratis; pembayaran hanya diperlukan jika mahasiswa membeli almamater dan KTM.');
    }

    /**
     * Reject legacy payment proof uploads because re-registration is free.
     */
    public function uploadPayment(Request $request): RedirectResponse
    {
        return redirect()->route('student.reregistration.edit')
            ->with('info', 'Upload bukti pembayaran tidak diperlukan untuk daftar ulang.');
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
