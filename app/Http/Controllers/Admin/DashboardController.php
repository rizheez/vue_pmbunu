<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Announcement;
use App\Models\Registration;
use App\Models\RegistrationPeriod;
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
        $selectedPeriod = $selectedPeriodId
            ? RegistrationPeriod::find($selectedPeriodId)
            : $activePeriod;

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

        // Program stats (top 5)
        $programStats = Registration::select('choice_1', DB::raw('count(*) as total'))
            ->when($filterPeriodId, fn ($q) => $q->where('registration_period_id', $filterPeriodId))
            ->with('programStudiChoice1')
            ->groupBy('choice_1')
            ->orderByDesc('total')
            ->get();

        // Pending verifications
        $pendingVerifications = Registration::where('status', 'submitted')
            ->when($filterPeriodId, fn ($q) => $q->where('registration_period_id', $filterPeriodId))
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
            ],
            'programStats' => $programStats,
            'pendingVerifications' => $pendingVerifications,
            'recentRegistrations' => $recentRegistrations,
            'todayRegistrations' => $todayRegistrations,
            'weekRegistrations' => $weekRegistrations,
            'activePeriod' => $activePeriod,
            'allPeriods' => $allPeriods,
            'selectedPeriod' => $selectedPeriod,
        ]);
    }
}
