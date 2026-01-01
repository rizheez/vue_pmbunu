<?php

namespace App\Http\Controllers\Admin;

use App\Exports\StudentsExport;
use App\Http\Controllers\Controller;
use App\Mail\ManualRegistrationCredentials;
use App\Mail\StudentAcceptedMail;
use App\Mail\StudentRejectedMail;
use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPath;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\StudentBiodata;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Inertia\Inertia;
use Inertia\Response;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class StudentController extends Controller
{
    public function create(): Response|RedirectResponse
    {
        $activePeriod = RegistrationPeriod::where('is_active', true)->first();

        if (! $activePeriod) {
            return redirect()->route('admin.dashboard')->with('error', 'Tidak ada periode pendaftaran aktif. Silakan aktifkan periode pendaftaran terlebih dahulu.');
        }

        $fakultas = Fakultas::where('is_active', true)
            ->with(['programStudi' => fn ($q) => $q->where('is_active', true)->orderBy('name')])
            ->orderBy('name')
            ->get();
        $types = RegistrationType::where('is_active', true)->get();
        $paths = RegistrationPath::where('is_active', true)->get();

        return Inertia::render('admin/students/Create', [
            'activePeriod' => $activePeriod,
            'fakultas' => $fakultas,
            'types' => $types,
            'paths' => $paths,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            // Account
            'email' => 'required|email|unique:users,email',
            'phone' => ['required', 'string', 'regex:/^(\+62|62|0)8[1-9][0-9]{7,10}$/'],
            // Personal
            'name' => 'required|string|max:255',
            'nik' => 'required|string|size:16',
            'nisn' => 'nullable|string|max:20',
            'gender' => 'required|in:Laki-laki,Perempuan',
            'birth_place' => 'required|string|max:100',
            'birth_date' => 'required|date|before:-15 years',
            'religion' => 'required|in:Islam,Kristen,Katolik,Hindu,Buddha,Konghucu',
            'address' => 'required|string|max:500',
            'last_education' => 'required|in:SMA/SMK Sederajat,Paket C,D3,S1',
            'school_origin' => 'required|string|max:255',
            'major' => 'nullable|string|max:100',
            // Documents
            'photo' => 'required|file|image|max:1024',
            'ktp' => 'required|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'kk' => 'required|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'certificate' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
            // Registration
            'period_id' => 'required|exists:registration_periods,id',
            'type_id' => 'required|exists:registration_types,id',
            'path_id' => 'required|exists:registration_paths,id',
            'program_studi_1' => 'required|exists:program_studi,id',
            'program_studi_2' => 'required|exists:program_studi,id|different:program_studi_1',
            // Referral
            'referral_source' => 'nullable|string|max:255',
            'referral_detail' => 'nullable|string|max:255',
            // Status options
        ], [
            'required' => ':attribute wajib diisi.',
            'email.email' => 'Format email tidak valid.',
            'email.unique' => 'Email sudah terdaftar.',
            'phone.regex' => 'Format nomor HP tidak valid (contoh: 081234567890).',
            'nik.size' => 'NIK harus 16 digit.',
            'birth_date.before' => 'Minimal usia 15 tahun.',
            'program_studi_2.different' => 'Pilihan 2 harus berbeda dengan Pilihan 1.',
            'photo.max' => 'Foto maksimal 1MB.',
            'photo.image' => 'Foto harus berupa gambar.',
            'ktp.max' => 'KTP maksimal 2MB.',
            'kk.max' => 'KK maksimal 2MB.',
            'certificate.max' => 'Ijazah maksimal 2MB.',
            'mimes' => 'Format :attribute harus: :values.',
        ]);

        DB::transaction(function () use ($validated, $request) {
            // Generate password
            $password = 'pmbunukaltim';

            // Create user
            $user = User::create([
                'name' => $validated['name'],
                'email' => $validated['email'],
                'phone' => $validated['phone'],
                'role' => 'student',
                'password' => Hash::make($password),
                'email_verified_at' => now(),
            ]);

            // Upload documents
            $photoPath = $request->file('photo')->store('biodata/photos', 'public');
            $ktpPath = $request->file('ktp')->store('biodata/ktp', 'public');
            $kkPath = $request->file('kk')->store('biodata/kk', 'public');
            $certPath = $request->hasFile('certificate')
                ? $request->file('certificate')->store('biodata/certificates', 'public')
                : null;

            // Create biodata
            // Create biodata
            $biodata = StudentBiodata::create([
                'user_id' => $user->id,
                'name' => $validated['name'],
                'nik' => $validated['nik'],
                'nisn' => $validated['nisn'] ?? null,
                'phone' => $validated['phone'],
                'gender' => $validated['gender'],
                'birth_place' => $validated['birth_place'],
                'birth_date' => $validated['birth_date'],
                'religion' => $validated['religion'],
                'address' => $validated['address'],
                'last_education' => $validated['last_education'],
                'school_origin' => $validated['school_origin'],
                'major' => $validated['major'] ?? null,
                'photo_path' => $photoPath,
                'ktp_path' => $ktpPath,
                'kk_path' => $kkPath,
                'certificate_path' => $certPath,
            ]);

            // Create verification records
            $biodata->updateVerificationStatus('biodata');
            $biodata->updateVerificationStatus('photo');
            $biodata->updateVerificationStatus('ktp');
            $biodata->updateVerificationStatus('kk');
            if ($certPath) {
                $biodata->updateVerificationStatus('certificate');
            }

            // Generate registration number using model method
            $period = RegistrationPeriod::find($validated['period_id']);
            $regNumber = Registration::generateRegistrationNumber($period);

            Registration::create([
                'user_id' => $user->id,
                'registration_period_id' => $validated['period_id'],
                'registration_type_id' => $validated['type_id'],
                'registration_path_id' => $validated['path_id'],
                'registration_number' => $regNumber,
                'choice_1' => $validated['program_studi_1'],
                'choice_2' => $validated['program_studi_2'],
                'referral_source' => $validated['referral_source'] ?? null,
                'referral_detail' => $validated['referral_detail'] ?? null,
                'status' => $request->boolean('set_verified') ? 'verified' : 'submitted',
            ]);

            // Send email with credentials to student
            Mail::to($user->email)->send(new ManualRegistrationCredentials($user, $password, $regNumber));
        });

        return redirect()->route('admin.students.index')->with('success', 'Calon mahasiswa berhasil didaftarkan dan email kredensial telah dikirim.');
    }

    public function index(Request $request): Response
    {
        $periods = RegistrationPeriod::orderByDesc('academic_year')
            ->orderByDesc('wave_number')
            ->get();

        $query = User::with([
            'studentBiodata',
            'registration.registrationPeriod',
            'registration.programStudiChoice1.fakultas',
            'registration.registrationType',
        ])
            ->where('role', 'student')
            ->whereHas('registration');

        // Filter by status
        if ($request->filled('status') && $request->status !== 'all') {
            $query->whereHas('registration', fn ($q) => $q->where('status', $request->status));
        }

        // Filter by period
        if ($request->filled('period') && $request->period !== 'all') {
            $query->whereHas('registration', fn ($q) => $q->where('registration_period_id', $request->period));
        }

        // Search
        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('users.name', 'like', "%{$search}%")
                    ->orWhere('users.email', 'like', "%{$search}%")
                    ->orWhereHas('studentBiodata', fn ($bq) => $bq->where('name', 'like', "%{$search}%"))
                    ->orWhereHas('registration', fn ($rq) => $rq->where('registration_number', 'like', "%{$search}%"));
            });
        }

        $perPage = min((int) $request->input('per_page', 10), 100);

        $students = $query
            ->join('registrations', 'users.id', '=', 'registrations.user_id')
            ->orderByDesc('registrations.created_at')
            ->select('users.*')
            ->paginate($perPage)
            ->withQueryString();

        return Inertia::render('admin/students/Index', [
            'students' => $students,
            'periods' => $periods,
            'filters' => $request->only(['status', 'period', 'search', 'per_page']),
        ]);
    }

    public function show(int $id): Response
    {
        $student = User::with([
            'studentBiodata.verifications',
            'studentBiodata.parents',
            'studentBiodata.specialNeeds',
            'registration.registrationPeriod',
            'registration.registrationType',
            'registration.registrationPath',
            'registration.programStudiChoice1.fakultas',
            'registration.programStudiChoice2.fakultas',
            'registration.programStudiChoice3.fakultas',
            'registration.acceptedProgramStudi.fakultas',
            'reregistrationPayment.verifier',
        ])
            ->where('role', 'student')
            ->findOrFail($id);

        return Inertia::render('admin/students/Show', [
            'student' => $student,
        ]);
    }

    public function edit(int $id): Response
    {
        $student = User::with([
            'studentBiodata',
            'registration',
        ])
            ->where('role', 'student')
            ->findOrFail($id);

        $fakultas = Fakultas::where('is_active', true)
            ->with(['programStudi' => fn ($q) => $q->where('is_active', true)->orderBy('name')])
            ->orderBy('name')
            ->get();

        $types = RegistrationType::where('is_active', true)->get();
        $paths = RegistrationPath::where('is_active', true)->get();
        $periods = RegistrationPeriod::orderByDesc('created_at')->get();

        return Inertia::render('admin/students/Edit', [
            'student' => $student,
            'fakultas' => $fakultas,
            'types' => $types,
            'paths' => $paths,
            'periods' => $periods,
        ]);
    }

    public function update(Request $request, int $id): RedirectResponse
    {
        $user = User::where('role', 'student')->findOrFail($id);
        $biodata = $user->studentBiodata;
        $registration = $user->registration;

        $validated = $request->validate([
            // Account
            'email' => 'required|email|unique:users,email,'.$user->id,
            'phone' => ['required', 'string', 'regex:/^(\+62|62|0)8[1-9][0-9]{7,10}$/'],
            // Personal
            'name' => 'required|string|max:255',
            'nik' => 'required|string|size:16',
            'nisn' => 'nullable|string|max:20',
            'gender' => 'required|in:Laki-laki,Perempuan',
            'birth_place' => 'required|string|max:100',
            'birth_date' => 'required|date|before:-15 years',
            'religion' => 'required|in:Islam,Kristen,Katolik,Hindu,Buddha,Konghucu',
            'address' => 'required|string|max:500',
            'last_education' => 'required|in:SMA/SMK Sederajat,Paket C,D3,S1',
            'school_origin' => 'required|string|max:255',
            'major' => 'nullable|string|max:100',
            // Documents (Nullable on update)
            'photo' => 'nullable|file|image|max:1024',
            'ktp' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'kk' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'certificate' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
            // Registration
            'period_id' => 'required|exists:registration_periods,id',
            'type_id' => 'required|exists:registration_types,id',
            'path_id' => 'required|exists:registration_paths,id',
            'program_studi_1' => 'required|exists:program_studi,id',
            'program_studi_2' => 'required|exists:program_studi,id|different:program_studi_1',
            // Referral
            'referral_source' => 'nullable|string|max:255',
            'referral_detail' => 'nullable|string|max:255',
        ], [
            'required' => ':attribute wajib diisi.',
            'email.email' => 'Format email tidak valid.',
            'email.unique' => 'Email sudah terdaftar.',
            'phone.regex' => 'Format nomor HP tidak valid (contoh: 081234567890).',
            'nik.size' => 'NIK harus 16 digit.',
            'birth_date.before' => 'Minimal usia 15 tahun.',
            'program_studi_2.different' => 'Pilihan 2 harus berbeda dengan Pilihan 1.',
            'photo.max' => 'Foto maksimal 1MB.',
            'photo.image' => 'Foto harus berupa gambar.',
            'ktp.max' => 'KTP maksimal 2MB.',
            'kk.max' => 'KK maksimal 2MB.',
            'certificate.max' => 'Ijazah maksimal 2MB.',
            'mimes' => 'Format :attribute harus: :values.',
        ]);

        DB::transaction(function () use ($validated, $request, $user, $biodata, $registration) {
            // Update user
            $user->update([
                'name' => $validated['name'],
                'email' => $validated['email'],
                'phone' => $validated['phone'],
            ]);

            // Handle file uploads if available
            if ($request->hasFile('photo')) {
                if ($biodata->photo_path) {
                    Storage::disk('public')->delete($biodata->photo_path);
                }
                $biodata->photo_path = $request->file('photo')->store('biodata/photos', 'public');
                $biodata->updateVerificationStatus('photo');
            }
            if ($request->hasFile('ktp')) {
                if ($biodata->ktp_path) {
                    Storage::disk('public')->delete($biodata->ktp_path);
                }
                $biodata->ktp_path = $request->file('ktp')->store('biodata/ktp', 'public');
                $biodata->updateVerificationStatus('ktp');
            }
            if ($request->hasFile('kk')) {
                if ($biodata->kk_path) {
                    Storage::disk('public')->delete($biodata->kk_path);
                }
                $biodata->kk_path = $request->file('kk')->store('biodata/kk', 'public');
                $biodata->updateVerificationStatus('kk');
            }
            if ($request->hasFile('certificate')) {
                if ($biodata->certificate_path) {
                    Storage::disk('public')->delete($biodata->certificate_path);
                }
                $biodata->certificate_path = $request->file('certificate')->store('biodata/certificates', 'public');
                $biodata->updateVerificationStatus('certificate');
            }

            // Update biodata
            $biodata->update([
                'name' => $validated['name'],
                'nik' => $validated['nik'],
                'nisn' => $validated['nisn'] ?? null,
                'phone' => $validated['phone'],
                'gender' => $validated['gender'],
                'birth_place' => $validated['birth_place'],
                'birth_date' => $validated['birth_date'],
                'religion' => $validated['religion'],
                'address' => $validated['address'],
                'last_education' => $validated['last_education'],
                'school_origin' => $validated['school_origin'],
                'major' => $validated['major'] ?? null,
                // Files are updated above directly on model instance? No, need to save.
                'photo_path' => $biodata->photo_path,
                'ktp_path' => $biodata->ktp_path,
                'kk_path' => $biodata->kk_path,
                'certificate_path' => $biodata->certificate_path,
            ]);
            $biodata->updateVerificationStatus('biodata');

            // Update registration
            $registration->update([
                'registration_period_id' => $validated['period_id'],
                'registration_type_id' => $validated['type_id'],
                'registration_path_id' => $validated['path_id'],
                'choice_1' => $validated['program_studi_1'],
                'choice_2' => $validated['program_studi_2'],
                'referral_source' => $validated['referral_source'] ?? null,
                'referral_detail' => $validated['referral_detail'] ?? null,
            ]);
        });

        return redirect()->route('admin.students.show', $user->id)
            ->with('success', 'Data calon mahasiswa berhasil diperbarui.');
    }

    public function verify(int $id): RedirectResponse
    {
        $student = User::with('registration')->findOrFail($id);

        if (! $student->registration || $student->registration->status !== 'submitted') {
            return redirect()->back()->with('error', 'Status tidak valid untuk verifikasi.');
        }

        $student->registration->update([
            'status' => 'verified',
        ]);

        return redirect()->back()->with('success', 'Pendaftaran berhasil diverifikasi.');
    }

    public function accept(Request $request, int $id): RedirectResponse
    {
        $request->validate([
            'program_studi_id' => 'required|exists:program_studi,id',
            'notes' => 'nullable|string|max:500',
        ]);

        $student = User::with('registration')->findOrFail($id);

        if (! $student->registration || $student->registration->status !== 'verified') {
            return redirect()->back()->with('error', 'Status tidak valid untuk penerimaan.');
        }

        $prodi = ProgramStudi::find($request->program_studi_id);

        $student->registration->update([
            'status' => 'accepted',
            'accepted_at' => now(),
            'accepted_by' => auth()->id(),
            'acceptance_notes' => $request->notes,
            'accepted_program_studi_id' => $request->program_studi_id,
        ]);

        // Send acceptance email
        $prodiName = $prodi->jenjang.' '.$prodi->name;
        Mail::to($student->email)->send(new StudentAcceptedMail($student, $student->registration, $prodiName));

        return redirect()->back()->with('success', "Mahasiswa diterima di {$prodi->name} dan email notifikasi telah dikirim.");
    }

    public function reject(Request $request, int $id): RedirectResponse
    {
        $request->validate([
            'reason' => 'required|string|max:500',
        ]);

        $student = User::with('registration')->findOrFail($id);

        if (! $student->registration || $student->registration->status !== 'verified') {
            return redirect()->back()->with('error', 'Status tidak valid untuk penolakan.');
        }

        $student->registration->update([
            'status' => 'rejected',
            'rejected_at' => now(),
            'rejected_by' => auth()->id(),
            'rejection_reason' => $request->reason,
        ]);

        // Send rejection email
        Mail::to($student->email)->send(new StudentRejectedMail($student, $student->registration, $request->reason));

        return redirect()->back()->with('success', 'Pendaftaran ditolak dan email notifikasi telah dikirim.');
    }

    public function export(Request $request): BinaryFileResponse
    {
        $filename = 'mahasiswa-'.now()->format('Y-m-d-His').'.xlsx';

        return Excel::download(new StudentsExport($request), $filename);
    }
}
