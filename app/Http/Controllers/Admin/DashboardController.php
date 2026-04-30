<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Announcement;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\ReregistrationPayment;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;
use Inertia\Response;

class DashboardController extends Controller
{
    public function index(): Response
    {
        $allPeriods = RegistrationPeriod::orderByDesc('academic_year')
            ->orderByDesc('wave_number')
            ->get();

        $activePeriod = RegistrationPeriod::where('is_active', true)->first();

        $selectedPeriodId = request('period_id');

        // If period_id is explicitly in the request, use it (empty = all periods)
        // If not in request at all (first load), default to active period
        if (request()->has('period_id')) {
            $selectedPeriod = $selectedPeriodId
                ? RegistrationPeriod::find($selectedPeriodId)
                : null;
        } else {
            $selectedPeriod = $activePeriod;
        }

        $filterPeriodId = $selectedPeriod?->id;

        // Global stats
        $totalStudents = User::where('role', 'student')
            ->whereHas('registration')
            ->count();

        $totalAnnouncements = Announcement::count();

        // Registration by status
        $statusStats = Registration::select('status', DB::raw('count(*) as total'))
            ->when($filterPeriodId, fn ($q) => $q->where('registration_period_id', $filterPeriodId))
            ->groupBy('status')
            ->pluck('total', 'status')
            ->toArray();

        // Program stats (all active prodi)
        $programStats = ProgramStudi::active()
            ->withCount(['registrationsChoice1 as total' => function ($q) use ($filterPeriodId) {
                $q->when($filterPeriodId, fn ($q2) => $q2->where('registration_period_id', $filterPeriodId));
            }])
            ->orderByDesc('total')
            ->get()
            ->map(fn ($prodi) => [
                'program_studi' => $prodi,
                'total' => $prodi->total,
            ]);

        // Pending verifications
        $pendingVerifications = Registration::where('status', 'submitted')
            ->when($filterPeriodId, fn ($q) => $q->where('registration_period_id', $filterPeriodId))
            ->count();

        // Pending payment verifications
        $pendingPaymentVerifications = ReregistrationPayment::where('status', 'pending')
            ->when($filterPeriodId, function ($q) use ($filterPeriodId) {
                $q->whereHas('user.registration', fn ($r) => $r->where('registration_period_id', $filterPeriodId));
            })
            ->count();

        // Recent registrations
        $recentRegistrations = Registration::with(['user.studentBiodata', 'programStudiChoice1'])
            ->when($filterPeriodId, fn ($q) => $q->where('registration_period_id', $filterPeriodId))
            ->where('created_at', '>=', now()->subDays(7))
            ->orderByDesc('created_at')
            ->limit(10)
            ->get();

        // Today/week stats
        $todayRegistrations = Registration::whereDate('created_at', today())
            ->when($filterPeriodId, fn ($q) => $q->where('registration_period_id', $filterPeriodId))
            ->count();

        $weekRegistrations = Registration::where('created_at', '>=', now()->startOfWeek())
            ->when($filterPeriodId, fn ($q) => $q->where('registration_period_id', $filterPeriodId))
            ->count();

        return Inertia::render('admin/Dashboard', [
            'totalStudents' => $totalStudents,
            'totalAnnouncements' => $totalAnnouncements,
            'statusStats' => [
                'draft' => $statusStats['draft'] ?? 0,
                'submitted' => $statusStats['submitted'] ?? 0,
                'verified' => $statusStats['verified'] ?? 0,
                'accepted' => $statusStats['accepted'] ?? 0,
                'rejected' => $statusStats['rejected'] ?? 0,
                're_registration_pending' => $statusStats['re_registration_pending'] ?? 0,
                're_registration_verified' => $statusStats['re_registration_verified'] ?? 0,
                'enrolled' => $statusStats['enrolled'] ?? 0,
                'cancelled' => $statusStats['cancelled'] ?? 0,
            ],
            'programStats' => $programStats,
            'pendingVerifications' => $pendingVerifications,
            'pendingPaymentVerifications' => $pendingPaymentVerifications,
            'recentRegistrations' => $recentRegistrations,
            'todayRegistrations' => $todayRegistrations,
            'weekRegistrations' => $weekRegistrations,
            'activePeriod' => $activePeriod,
            'allPeriods' => $allPeriods,
            'selectedPeriod' => $selectedPeriod,
        ]);
    }
}
