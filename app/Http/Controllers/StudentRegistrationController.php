<?php

namespace App\Http\Controllers;

use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPath;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\StudentBiodata;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Inertia\Response;

class StudentRegistrationController extends Controller
{
    public function index(): Response|RedirectResponse
    {
        $biodata = StudentBiodata::where('user_id', Auth::id())->first();

        if (! $biodata) {
            return redirect()->route('student.biodata.index')
                ->with('error', 'Silakan lengkapi biodata terlebih dahulu.');
        }

        $activePeriod = RegistrationPeriod::where('is_active', true)->first();

        if (! $activePeriod) {
            return redirect()->route('student.dashboard')
                ->with('error', 'Tidak ada periode pendaftaran yang aktif.');
        }

        $registration = Registration::with([
            'registrationType',
            'registrationPath',
            'programStudiChoice1.fakultas',
            'programStudiChoice2.fakultas',
            'programStudiChoice3.fakultas',
        ])->where('user_id', Auth::id())->first();

        $registrationTypes = RegistrationType::where('is_active', true)->get();
        $registrationPaths = RegistrationPath::where('is_active', true)->get();

        $fakultas = Fakultas::where('is_active', true)
            ->with(['programStudi' => function ($query) {
                $query->where('is_active', true)
                    ->orderBy('jenjang')
                    ->orderBy('name');
            }])
            ->orderBy('name')
            ->get();

        $programStudi = ProgramStudi::with('fakultas')
            ->where('is_active', true)
            ->orderBy('jenjang')
            ->orderBy('name')
            ->get();

        return Inertia::render('student/pendaftaran/Index', [
            'registration' => $registration,
            'activePeriod' => $activePeriod,
            'registrationTypes' => $registrationTypes,
            'registrationPaths' => $registrationPaths,
            'fakultas' => $fakultas,
            'programStudi' => $programStudi,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $activePeriod = RegistrationPeriod::where('is_active', true)->first();

        if (! $activePeriod) {
            return redirect()->back()->with('error', 'Tidak ada periode pendaftaran aktif.');
        }

        $validated = $request->validate([
            'registration_type_id' => 'required|exists:registration_types,id',
            'registration_path_id' => 'required|exists:registration_paths,id',
            'referral_source' => 'nullable|string|max:255',
            'referral_detail' => 'nullable|string|max:255',
            'choice_1' => 'required|exists:program_studi,id',
            'choice_2' => 'required|exists:program_studi,id|different:choice_1',
            'choice_3' => 'nullable|exists:program_studi,id|different:choice_1|different:choice_2',
        ], [
            'required' => ':attribute wajib diisi.',
            'exists' => ':attribute tidak valid.',
            'different' => ':attribute tidak boleh sama dengan pilihan lain.',
        ], [
            'registration_type_id' => 'Jenis Pendaftaran',
            'registration_path_id' => 'Jalur Pendaftaran',
            'choice_1' => 'Pilihan 1',
            'choice_2' => 'Pilihan 2',
            'choice_3' => 'Pilihan 3',
        ]);

        $existingRegistration = Registration::where('user_id', Auth::id())->first();

        if ($existingRegistration && $existingRegistration->status !== 'submitted') {
            return redirect()->back()->with('error', 'Pendaftaran tidak dapat diubah karena sudah diproses (Status: '.$existingRegistration->status.').');
        }

        $data = [
            'registration_type_id' => $validated['registration_type_id'],
            'registration_path_id' => $validated['registration_path_id'],
            'referral_source' => $validated['referral_source'] ?? null,
            'referral_detail' => $validated['referral_detail'] ?? null,
            'choice_1' => $validated['choice_1'],
            'choice_2' => $validated['choice_2'],
            'choice_3' => $validated['choice_3'] ?? null,
            'status' => 'submitted',
            'registration_period_id' => $activePeriod->id,
        ];

        if (! $existingRegistration || ! $existingRegistration->registration_number) {
            $data['registration_number'] = Registration::generateRegistrationNumber($activePeriod);
        }

        Registration::updateOrCreate(
            ['user_id' => Auth::id()],
            $data
        );

        $message = $existingRegistration ? 'Pendaftaran berhasil diperbarui!' : 'Pendaftaran berhasil dikirim!';

        return redirect()->route('student.pendaftaran.index')->with('success', $message);
    }
}
