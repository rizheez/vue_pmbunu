<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Registration;
use App\Models\ReregistrationPayment;
use App\Models\StudentBiodata;
use App\Models\StudentParent;
use App\Models\StudentSpecialNeed;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;
use Inertia\Response;

class AdminReregistrationController extends Controller
{
    /**
     * Display list of students eligible for manual reregistration.
     */
    public function index(Request $request): Response
    {
        $query = Registration::with([
            'user.studentBiodata',
            'acceptedProgramStudi',
            'registrationType',
        ])
            ->whereIn('status', ['accepted', 're_registration_pending'])
            ->whereHas('user');

        // Filter by status
        if ($request->has('status') && $request->status) {
            $query->where('status', $request->status);
        }

        // Search
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->whereHas('user', function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                    ->orWhere('email', 'like', "%{$search}%");
            });
        }

        $registrations = $query->orderBy('created_at', 'desc')
            ->paginate(15)
            ->withQueryString();

        return Inertia::render('admin/reregistration/Index', [
            'registrations' => $registrations,
            'filters' => [
                'status' => $request->status ?? '',
                'search' => $request->search ?? '',
            ],
        ]);
    }

    /**
     * Show the manual reregistration form for a student.
     */
    public function edit(int $id): Response|RedirectResponse
    {
        $user = User::with(['studentBiodata.parents', 'studentBiodata.specialNeeds', 'registration.acceptedProgramStudi'])
            ->findOrFail($id);

        if (! $user->registration || ! in_array($user->registration->status, ['accepted', 're_registration_pending'])) {
            return redirect()->route('admin.reregistration.index')
                ->with('error', 'Mahasiswa tidak dalam status yang dapat melakukan daftar ulang.');
        }

        // Get payment data
        $payment = ReregistrationPayment::where('user_id', $user->id)->first();

        return Inertia::render('admin/reregistration/Edit', [
            'student' => $user,
            'biodata' => $user->studentBiodata,
            'parents' => $user->studentBiodata?->parents ?? [],
            'specialNeeds' => $user->studentBiodata?->specialNeeds?->first(),
            'registration' => $user->registration,
            'payment' => $payment,
            'paymentAmount' => 300000,
            'options' => $this->getFormOptions(),
        ]);
    }

    /**
     * Update reregistration data for a student.
     */
    public function update(Request $request, int $id): RedirectResponse
    {
        $user = User::with(['studentBiodata', 'registration'])->findOrFail($id);

        if (! $user->registration || ! in_array($user->registration->status, ['accepted', 're_registration_pending'])) {
            return redirect()->back()->with('error', 'Status tidak valid untuk daftar ulang.');
        }

        $biodata = $user->studentBiodata;

        if (! $biodata) {
            return redirect()->back()->with('error', 'Biodata mahasiswa tidak ditemukan.');
        }

        $validated = $request->validate([
            // Address details
            'npwp' => 'nullable|string|max:30',
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

            // Payment
            'payment_proof' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',

            // Status update option
            'mark_as_verified' => 'boolean',
        ]);

        DB::transaction(function () use ($biodata, $user, $validated) {
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
                'kps_number' => ($validated['kps_recipient'] ?? false) ? ($validated['kps_number'] ?? null) : null,
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

            // Update registration status if requested
            if ($validated['mark_as_verified'] ?? false) {
                $user->registration->update([
                    'status' => 're_registration_verified',
                ]);
            } elseif ($user->registration->status === 'accepted') {
                $user->registration->update([
                    'status' => 're_registration_pending',
                ]);
            }
        });

        // Handle payment proof upload (outside transaction for file handling)
        if ($request->hasFile('payment_proof')) {
            $path = $request->file('payment_proof')->store('reregistration-payments', 'public');

            ReregistrationPayment::updateOrCreate(
                ['user_id' => $user->id],
                [
                    'amount' => 300000,
                    'payment_proof_path' => $path,
                    'status' => ($validated['mark_as_verified'] ?? false) ? 'verified' : 'pending',
                    'verified_by' => ($validated['mark_as_verified'] ?? false) ? Auth::id() : null,
                    'verified_at' => ($validated['mark_as_verified'] ?? false) ? now() : null,
                ]
            );
        }

        $message = 'Data daftar ulang berhasil disimpan.';
        if ($validated['mark_as_verified'] ?? false) {
            $message .= ' Status diubah ke "Daftar Ulang Terverifikasi".';
        }

        return redirect()->route('admin.reregistration.index')
            ->with('success', $message);
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
