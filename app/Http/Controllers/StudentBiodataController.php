<?php

namespace App\Http\Controllers;

use App\Models\DocumentVerification;
use App\Models\RegistrationPeriod;
use App\Models\StudentBiodata;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;
use Inertia\Response;

class StudentBiodataController extends Controller
{
    public function index(): Response
    {
        $biodata = StudentBiodata::with('verifications')
            ->where('user_id', Auth::id())
            ->first();

        return Inertia::render('student/biodata/Index', [
            'biodata' => $biodata,
        ]);
    }

    public function edit(): Response|RedirectResponse
    {
        $activePeriod = RegistrationPeriod::where('is_active', true)->first();

        if (! $activePeriod) {
            return redirect()->route('student.biodata.index')
                ->with('error', 'Tidak ada periode pendaftaran yang aktif saat ini.');
        }

        $biodata = StudentBiodata::firstOrNew(['user_id' => Auth::id()]);

        return Inertia::render('student/biodata/Edit', [
            'biodata' => $biodata,
            'activePeriod' => $activePeriod,
        ]);
    }

    public function update(Request $request): RedirectResponse
    {
        $existingBiodata = StudentBiodata::where('user_id', Auth::id())->first();

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'nik' => [
                'required',
                'numeric',
                'digits:16',
                'unique:student_biodatas,nik,'.($existingBiodata->id ?? 'NULL'),
            ],
            'nisn' => [
                'nullable',
                'numeric',
                'unique:student_biodatas,nisn,'.($existingBiodata->id ?? 'NULL'),
            ],
            'phone' => ['required', 'string', 'regex:/^(\+62|62|0)8[1-9][0-9]{7,10}$/'],
            'gender' => 'required|in:Laki-laki,Perempuan',
            'birth_place' => 'required|string|max:255',
            'birth_date' => 'required|date|before:-15 years',
            'religion' => 'required|string|max:255',
            'address' => 'required|string',
            'last_education' => 'nullable|string',
            'school_origin' => 'required|string',
            'major' => 'nullable|string',
            'photo' => ($existingBiodata?->photo_path ? 'nullable' : 'required').'|image|max:1024',
            'ktp' => ($existingBiodata?->ktp_path ? 'nullable' : 'required').'|file|mimes:pdf,jpg,jpeg,png|max:2048',
            'kk' => ($existingBiodata?->kk_path ? 'nullable' : 'required').'|file|mimes:pdf,jpg,jpeg,png|max:2048',
            'certificate' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048',
        ], [
            'required' => ':attribute wajib diisi.',
            'numeric' => ':attribute harus berupa angka.',
            'digits' => ':attribute harus berjumlah :digits digit.',
            'unique' => ':attribute sudah terdaftar.',
            'phone.regex' => 'Format nomor HP tidak valid (contoh: 081234567890).',
            'image' => ':attribute harus berupa gambar.',
            'mimes' => 'Format :attribute harus: :values.',
            'birth_date.before' => 'Minimal usia 15 tahun.',
            'photo.max' => 'Foto maksimal 1MB.',
            'ktp.max' => 'KTP maksimal 2MB.',
            'kk.max' => 'KK maksimal 2MB.',
            'certificate.max' => 'Ijazah maksimal 2MB.',
        ]);

        $data = [
            'user_id' => Auth::id(),
            'name' => $validated['name'],
            'nik' => $validated['nik'],
            'nisn' => $validated['nisn'] ?? null,
            'birth_place' => $validated['birth_place'],
            'birth_date' => $validated['birth_date'],
            'religion' => $validated['religion'],
            'address' => $validated['address'],
            'last_education' => $validated['last_education'] ?? null,
            'school_origin' => $validated['school_origin'],
            'major' => $validated['major'] ?? null,
            'phone' => $validated['phone'],
            'gender' => $validated['gender'],
        ];

        // Handle file uploads
        if ($request->hasFile('photo')) {
            if ($existingBiodata?->photo_path) {
                Storage::disk('public')->delete($existingBiodata->photo_path);
            }
            $data['photo_path'] = $request->file('photo')->store('students/photos', 'public');
        }

        if ($request->hasFile('ktp')) {
            if ($existingBiodata?->ktp_path) {
                Storage::disk('public')->delete($existingBiodata->ktp_path);
            }
            $data['ktp_path'] = $request->file('ktp')->store('students/ktp', 'public');
        }

        if ($request->hasFile('kk')) {
            if ($existingBiodata?->kk_path) {
                Storage::disk('public')->delete($existingBiodata->kk_path);
            }
            $data['kk_path'] = $request->file('kk')->store('students/kk', 'public');
        }

        if ($request->hasFile('certificate')) {
            if ($existingBiodata?->certificate_path) {
                Storage::disk('public')->delete($existingBiodata->certificate_path);
            }
            $data['certificate_path'] = $request->file('certificate')->store('students/certificates', 'public');
        }

        $biodata = StudentBiodata::updateOrCreate(
            ['user_id' => Auth::id()],
            $data
        );

        // Reset verification status for changed documents
        $this->resetVerificationStatus($biodata, $request);

        return redirect()->route('student.biodata.index')
            ->with('success', 'Biodata berhasil disimpan.');
    }

    private function resetVerificationStatus(StudentBiodata $biodata, Request $request): void
    {
        if ($request->hasFile('photo')) {
            $biodata->updateVerificationStatus('photo');
        }
        if ($request->hasFile('ktp')) {
            $biodata->updateVerificationStatus('ktp');
        }
        if ($request->hasFile('kk')) {
            $biodata->updateVerificationStatus('kk');
        }
        if ($request->hasFile('certificate')) {
            $biodata->updateVerificationStatus('certificate');
        }

        // Always reset biodata verification on update
        $biodata->updateVerificationStatus('biodata');
    }
}
