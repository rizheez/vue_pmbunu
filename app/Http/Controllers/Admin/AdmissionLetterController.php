<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreAdmissionLetterRequest;
use App\Mail\AdmissionLetterMail;
use App\Models\AdmissionLetter;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\StudentBiodata;
use App\Models\User;
use App\Services\AdmissionLetterPdfService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\StreamedResponse;

class AdmissionLetterController extends Controller
{
    public function index(Request $request): Response
    {
        $eligibleStudents = User::query()
            ->select(['id', 'name', 'email', 'nim'])
            ->with([
                'studentBiodata:id,user_id,name',
                'registration:id,user_id,accepted_program_studi_id,status',
                'registration.acceptedProgramStudi:id,jenjang,name',
            ])
            ->where('role', 'student')
            ->whereNotNull('nim')
            ->whereDoesntHave('admissionLetter')
            ->whereHas('registration', fn ($query) => $query->where('status', 'enrolled'))
            ->orderBy('name')
            ->get();

        $perPage = min((int) $request->input('per_page', 10), 100);

        $letters = AdmissionLetter::query()
            ->with([
                'user:id,name,email,nim',
                'user.studentBiodata:id,user_id,name',
                'user.registration:id,user_id,accepted_program_studi_id',
                'user.registration.acceptedProgramStudi:id,jenjang,name',
                'creator:id,name',
            ])
            ->when($request->filled('search'), function ($query) use ($request) {
                $search = $request->string('search')->toString();

                $query->where(function ($letterQuery) use ($search) {
                    $letterQuery->where('letter_number', 'like', "%{$search}%")
                        ->orWhereHas('user', fn ($userQuery) => $userQuery
                            ->where('name', 'like', "%{$search}%")
                            ->orWhere('nim', 'like', "%{$search}%"));
                });
            })
            ->latest()
            ->paginate($perPage)
            ->withQueryString();

        $programStudi = ProgramStudi::where('is_active', true)
            ->orderBy('name')
            ->get(['id', 'name', 'jenjang', 'nim_code']);

        return Inertia::render('admin/admission-letters/Index', [
            'eligibleStudents' => $eligibleStudents,
            'letters' => $letters,
            'programStudi' => $programStudi,
            'filters' => $request->only(['search', 'per_page']),
        ]);
    }

    public function store(
        StoreAdmissionLetterRequest $request,
        AdmissionLetterPdfService $pdfService
    ): RedirectResponse {
        $validated = $request->validated();
        $isManual = ($validated['entry_mode'] ?? 'registered') === 'manual';

        $letter = DB::transaction(function () use ($validated, $isManual, $pdfService) {
            if ($isManual) {
                $nim = trim((string) $validated['nim']);
                $name = trim((string) $validated['student_name']);
                $email = ! empty($validated['email']) ? trim((string) $validated['email']) : null;

                $existingUser = User::where('nim', $nim)->first();

                if ($existingUser && $existingUser->admissionLetter()->exists()) {
                    throw ValidationException::withMessages([
                        'nim' => "Mahasiswa dengan NIM {$nim} sudah memiliki surat penerimaan.",
                    ]);
                }

                if ($existingUser) {
                    $student = $existingUser;
                    if ($email && $student->email !== $email) {
                        $emailTaken = User::where('email', $email)
                            ->where('id', '!=', $student->id)
                            ->exists();
                        if ($emailTaken) {
                            throw ValidationException::withMessages([
                                'email' => "Email {$email} sudah digunakan oleh pengguna lain.",
                            ]);
                        }
                        $student->email = $email;
                    }
                    if ($student->name !== $name) {
                        $student->name = $name;
                    }
                    $student->save();
                } else {
                    if ($email) {
                        $emailTaken = User::where('email', $email)->exists();
                        if ($emailTaken) {
                            throw ValidationException::withMessages([
                                'email' => "Email {$email} sudah digunakan oleh pengguna lain.",
                            ]);
                        }
                    } else {
                        $baseEmail = strtolower($nim).'@student.unukaltim.ac.id';
                        $email = $baseEmail;
                        $counter = 1;
                        while (User::where('email', $email)->exists()) {
                            $email = strtolower($nim).$counter.'@student.unukaltim.ac.id';
                            $counter++;
                        }
                    }

                    $student = User::create([
                        'name' => $name,
                        'email' => $email,
                        'nim' => $nim,
                        'role' => 'student',
                        'password' => Hash::make(Str::random(16)),
                        'email_verified_at' => now(),
                    ]);
                }

                StudentBiodata::updateOrCreate(
                    ['user_id' => $student->id],
                    ['name' => $name]
                );

                $activePeriodId = RegistrationPeriod::where('is_active', true)->value('id')
                    ?? RegistrationPeriod::latest('id')->value('id');
                $defaultTypeId = RegistrationType::where('is_active', true)->value('id')
                    ?? RegistrationType::first()?->id
                    ?? 1;

                $regNumber = ! empty($validated['registration_number']) ? trim((string) $validated['registration_number']) : null;

                $registration = Registration::firstOrCreate(
                    ['user_id' => $student->id],
                    [
                        'registration_number' => $regNumber,
                        'accepted_program_studi_id' => $validated['program_studi_id'],
                        'status' => 'enrolled',
                        'registration_period_id' => $activePeriodId,
                        'registration_type_id' => $defaultTypeId,
                    ]
                );

                $updateData = [];
                if ((int) $registration->accepted_program_studi_id !== (int) $validated['program_studi_id']) {
                    $updateData['accepted_program_studi_id'] = $validated['program_studi_id'];
                }
                if ($registration->status !== 'enrolled') {
                    $updateData['status'] = 'enrolled';
                }
                if ($regNumber !== null && $registration->registration_number !== $regNumber) {
                    $updateData['registration_number'] = $regNumber;
                }
                if (! empty($updateData)) {
                    $registration->update($updateData);
                }
            } else {
                $student = User::query()
                    ->where('role', 'student')
                    ->whereNotNull('nim')
                    ->whereDoesntHave('admissionLetter')
                    ->whereHas('registration', fn ($query) => $query->where('status', 'enrolled'))
                    ->findOrFail($validated['user_id']);
            }

            $letter = AdmissionLetter::create([
                'user_id' => $student->id,
                'source_type' => $validated['source_type'],
                'letter_number' => $this->nextLetterNumber($validated['letter_date']),
                'letter_date' => $validated['letter_date'],
                'subject' => $validated['subject'],
                'signatory_name' => $validated['signatory_name'],
                'verification_token' => Str::random(24),
                'created_by' => auth()->id(),
                'generated_at' => now(),
            ]);

            $pdfPath = $validated['source_type'] === 'upload_file'
                ? $this->storeUploadedPdf($validated['uploaded_pdf'], $letter->letter_number)
                : $pdfService->generate($letter);

            $letter->update(['pdf_path' => $pdfPath]);

            return $letter;
        });

        return redirect()
            ->route('admin.admission-letters.index')
            ->with(
                'success',
                $validated['source_type'] === 'upload_file'
                    ? 'Surat penerimaan berhasil diunggah.'
                    : 'Surat penerimaan berhasil dibuat.'
            )
            ->with('pdf_url', $letter->pdf_url);
    }

    public function pdf(AdmissionLetter $letter): StreamedResponse
    {
        abort_unless($letter->pdf_path && Storage::disk('public')->exists($letter->pdf_path), 404);

        return Storage::disk('public')->response(
            $letter->pdf_path,
            'Surat-Penerimaan-'.$this->safeDownloadFilename($letter->letter_number).'.pdf'
        );
    }

    public function regenerate(AdmissionLetter $letter, AdmissionLetterPdfService $pdfService): RedirectResponse
    {
        if ($letter->source_type !== 'generate_web') {
            return redirect()
                ->route('admin.admission-letters.index')
                ->with('error', 'Surat upload file tidak dapat diregenerate dari web.');
        }

        if (strlen($letter->verification_token) > 24) {
            $letter->verification_token = Str::random(24);
        }

        $defaultSignatory = 'Drs. H. Sus Eko Zuhri Ernada, Grad.Dipl.IR., M.A., P.hD., CIQnR., CIQaR.';

        $letter->update([
            'signatory_name' => (empty($letter->signatory_name) || str_contains($letter->signatory_name, 'Hamdani'))
                ? $defaultSignatory
                : $letter->signatory_name,
            'generated_at' => now(),
            'verification_token' => $letter->verification_token,
        ]);

        $letter->update([
            'pdf_path' => $pdfService->generate($letter),
        ]);

        return redirect()
            ->route('admin.admission-letters.index')
            ->with('success', 'PDF surat penerimaan berhasil diperbarui.');
    }

    public function sendEmail(AdmissionLetter $letter): RedirectResponse
    {
        if (! $letter->pdf_path || ! Storage::disk('public')->exists($letter->pdf_path)) {
            return redirect()
                ->route('admin.admission-letters.index')
                ->with('error', 'PDF surat penerimaan belum tersedia.');
        }

        $letter->loadMissing([
            'user.studentBiodata',
            'user.registration.acceptedProgramStudi',
        ]);

        Mail::to($letter->user->email)->send(new AdmissionLetterMail($letter));

        $letter->update(['sent_at' => now()]);

        return redirect()
            ->route('admin.admission-letters.index')
            ->with('success', 'Surat penerimaan berhasil dikirim ke email mahasiswa.');
    }

    private function safeDownloadFilename(string $letterNumber): string
    {
        return trim((string) preg_replace('/[^A-Za-z0-9\-]+/', '-', $letterNumber), '-');
    }

    private function nextLetterNumber(string $letterDate): string
    {
        $date = Carbon::parse($letterDate);
        $suffix = '/PMB/UNU-KT/'.$date->format('m/Y');

        $lastNumber = AdmissionLetter::query()
            ->where('letter_number', 'like', '%/PMB/UNU-KT/%/'.$date->format('Y'))
            ->lockForUpdate()
            ->pluck('letter_number')
            ->map(function (string $letterNumber): int {
                preg_match('/^(\d+)\/PMB\/UNU-KT\/\d{2}\/\d{4}$/', $letterNumber, $matches);

                return isset($matches[1]) ? (int) $matches[1] : 0;
            })
            ->max() ?? 0;

        return str_pad((string) ($lastNumber + 1), 3, '0', STR_PAD_LEFT).$suffix;
    }

    private function storeUploadedPdf(UploadedFile $file, string $letterNumber): string
    {
        $filename = $this->safeDownloadFilename($letterNumber).'-'.now()->format('YmdHis').'.pdf';

        return $file->storeAs('admission-letters/uploads', $filename, 'public');
    }
}
