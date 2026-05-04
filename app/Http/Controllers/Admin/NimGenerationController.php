<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class NimGenerationController extends Controller
{
    private const LEGACY_COMPLETED_REREGISTRATION_STATUSES = [
        'form_completed',
        'payment_pending',
        'completed',
    ];

    /**
     * Display the NIM generation page.
     */
    public function index(Request $request): Response
    {
        $this->releaseCancelledNims();

        $query = Registration::with([
            'user.studentBiodata',
            'acceptedProgramStudi',
            'registrationType',
            'registrationPeriod',
        ])
            ->where(function ($query) {
                $query->where('status', 're_registration_verified')
                    ->orWhere('status', 'cancelled')
                    ->orWhere(function ($query) {
                        $query
                            ->where('status', 're_registration_pending')
                            ->whereHas('user.studentBiodata', function ($query) {
                                $query->whereIn(
                                    'reregistration_status',
                                    self::LEGACY_COMPLETED_REREGISTRATION_STATUSES,
                                );
                            });
                    });
            })
            ->whereHas('user', fn ($q) => $q->whereNull('nim'));

        // Filter by prodi
        if ($request->has('prodi') && $request->prodi) {
            $query->where('accepted_program_studi_id', $request->prodi);
        }

        // Filter by registration type
        if ($request->has('type') && $request->type) {
            $query->where('registration_type_id', $request->type);
        }

        // Search by name
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->whereHas('user', function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                    ->orWhere('email', 'like', "%{$search}%");
            });
        }

        $registrations = $query->orderBy('created_at', 'asc')
            ->paginate(20)
            ->withQueryString();

        // Get prodi list for filter
        $programStudi = ProgramStudi::where('is_active', true)
            ->whereNotNull('nim_code')
            ->orderBy('name')
            ->get(['id', 'name', 'nim_code']);

        return Inertia::render('admin/nim-generation/Index', [
            'registrations' => $registrations,
            'programStudi' => $programStudi,
            'filters' => [
                'prodi' => $request->prodi ?? '',
                'type' => $request->type ?? '',
                'search' => $request->search ?? '',
            ],
        ]);
    }

    /**
     * Generate NIM for selected registrations (bulk).
     */
    public function generate(Request $request): JsonResponse
    {
        $request->validate([
            'registration_ids' => 'required|array|min:1',
            'registration_ids.*' => 'exists:registrations,id',
        ]);

        $results = [
            'success' => [],
            'failed' => [],
        ];

        foreach ($request->registration_ids as $id) {
            try {
                $registration = Registration::with(['user', 'acceptedProgramStudi'])
                    ->find($id);

                if (! $registration) {
                    $results['failed'][] = [
                        'id' => $id,
                        'reason' => 'Registrasi tidak ditemukan',
                    ];

                    continue;
                }

                $this->finalizeLegacyReregistration($registration);
                $this->releaseCancelledNim($registration);

                if ($registration->user->nim) {
                    $results['failed'][] = [
                        'id' => $id,
                        'name' => $registration->user->name,
                        'reason' => 'Sudah memiliki NIM: '.$registration->user->nim,
                    ];

                    continue;
                }

                $nim = $registration->enrollStudent();

                // Send enrollment completed email with NIM
                \Illuminate\Support\Facades\Mail::to($registration->user)->send(
                    new \App\Mail\EnrollmentCompletedMail(
                        $registration->user,
                        $registration,
                        $nim,
                        $registration->acceptedProgramStudi->name
                    )
                );

                $results['success'][] = [
                    'id' => $id,
                    'name' => $registration->user->name,
                    'nim' => $nim,
                ];
            } catch (\Exception $e) {
                $results['failed'][] = [
                    'id' => $id,
                    'name' => $registration->user->name ?? 'Unknown',
                    'reason' => $e->getMessage(),
                ];
            }
        }

        $message = count($results['success']).' NIM berhasil digenerate.';
        if (count($results['failed']) > 0) {
            $message .= ' '.count($results['failed']).' gagal.';
        }

        return response()->json([
            'message' => $message,
            'results' => $results,
        ]);
    }

    private function finalizeLegacyReregistration(Registration $registration): void
    {
        if ($registration->status !== 're_registration_pending') {
            return;
        }

        $biodata = $registration->user->studentBiodata;

        if (
            ! $biodata ||
            ! in_array($biodata->reregistration_status, self::LEGACY_COMPLETED_REREGISTRATION_STATUSES, true)
        ) {
            return;
        }

        $biodata->update(['reregistration_status' => 'completed']);
        $registration->update(['status' => 're_registration_verified']);
        $registration->refresh();
    }

    private function releaseCancelledNims(): void
    {
        User::whereNotNull('nim')
            ->whereHas('registration', fn ($query) => $query->where('status', 'cancelled'))
            ->update(['nim' => null]);
    }

    private function releaseCancelledNim(Registration $registration): void
    {
        if ($registration->status !== 'cancelled' || ! $registration->user?->nim) {
            return;
        }

        $registration->user->update(['nim' => null]);
        $registration->user->refresh();
    }
}
