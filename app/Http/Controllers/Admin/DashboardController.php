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
            ->when($filterPeriodId, fn($q) => $q->where('registration_period_id', $filterPeriodId))
            ->groupBy('status')
            ->pluck('total', 'status')
            ->toArray();

        // Program stats (all active prodi)
        $programStats = ProgramStudi::active()
            ->withCount(['registrationsChoice1 as total' => function ($q) use ($filterPeriodId) {
                $q->when($filterPeriodId, fn($q2) => $q2->where('registration_period_id', $filterPeriodId));
            }])
            ->orderByDesc('total')
            ->get()
            ->map(fn($prodi) => [
                'program_studi' => $prodi,
                'total' => $prodi->total,
            ]);

        // Pending verifications
        $pendingVerifications = Registration::where('status', 'submitted')
            ->when($filterPeriodId, fn($q) => $q->where('registration_period_id', $filterPeriodId))
            ->count();

        // Pending payment verifications
        $pendingPaymentVerifications = ReregistrationPayment::where('status', 'pending')
            ->when($filterPeriodId, function ($q) use ($filterPeriodId) {
                $q->whereHas('user.registration', fn($r) => $r->where('registration_period_id', $filterPeriodId));
            })
            ->count();

        // Recent registrations
        $recentRegistrations = Registration::with(['user.studentBiodata', 'programStudiChoice1'])
            ->when($filterPeriodId, fn($q) => $q->where('registration_period_id', $filterPeriodId))
            ->where('created_at', '>=', now()->subDays(7))
            ->orderByDesc('created_at')
            ->limit(10)
            ->get();

        // Today/week/month stats
        $todayRegistrations = Registration::whereDate('created_at', today())
            ->when($filterPeriodId, fn($q) => $q->where('registration_period_id', $filterPeriodId))
            ->count();

        $weekRegistrations = Registration::where('created_at', '>=', now()->startOfWeek())
            ->when($filterPeriodId, fn($q) => $q->where('registration_period_id', $filterPeriodId))
            ->count();

        $monthRegistrations = Registration::where('created_at', '>=', now()->startOfMonth())
            ->when($filterPeriodId, fn($q) => $q->where('registration_period_id', $filterPeriodId))
            ->count();

        // Per-wave (period) breakdown
        $waveStats = RegistrationPeriod::withCount(['registrations as total_registrations'])
            ->orderByDesc('academic_year')
            ->orderByDesc('wave_number')
            ->get()
            ->map(fn($p) => [
                'name' => $p->name,
                'wave_number' => $p->wave_number,
                'academic_year' => $p->academic_year,
                'total' => $p->total_registrations,
                'is_active' => $p->is_active,
            ]);

        // 14 Days Trend
        $trendRegistrations = Registration::select(DB::raw('DATE(created_at) as date'), DB::raw('count(*) as total'))
            ->when($filterPeriodId, fn($q) => $q->where('registration_period_id', $filterPeriodId))
            ->where('created_at', '>=', now()->subDays(14)->startOfDay())
            ->groupBy('date')
            ->orderBy('date')
            ->pluck('total', 'date')
            ->toArray();

        $trendDates = [];
        $trendData = [];
        for ($i = 13; $i >= 0; $i--) {
            $dateStr = now()->subDays($i)->format('Y-m-d');
            $trendDates[] = now()->subDays($i)->format('d M');
            $trendData[] = $trendRegistrations[$dateStr] ?? 0;
        }

        $registrationTrend = [
            'labels' => $trendDates,
            'data' => $trendData,
        ];

        $aiInsight = Inertia::defer(function () use ($statusStats, $todayRegistrations, $weekRegistrations, $monthRegistrations, $pendingVerifications, $selectedPeriod) {
            $periodName = $selectedPeriod ? $selectedPeriod->name : 'Semua Gelombang';
            $prompt = 'Anda adalah AI Asisten untuk Admin PMB UNU Kaltim. Berikut adalah data pendaftaran untuk gelombang "' . $periodName . '" saat ini: ' . json_encode([
                'total_pendaftar_hari_ini' => $todayRegistrations,
                'total_pendaftar_minggu_ini' => $weekRegistrations,
                'total_pendaftar_bulan_ini' => $monthRegistrations,
                'menunggu_verifikasi' => $pendingVerifications,
                'diterima' => $statusStats['accepted'] ?? 0,
                'ditolak' => $statusStats['rejected'] ?? 0,
            ]) . '. Berikan SATU paragraf berupa insight dan saran tindakan yang profesional mempertimbangkan tren pendaftaran saat ini. Gunakan bahasa Indonesia yang profesional namun menyemangati. Jangan gunakan markdown tebal/miring, cukup teks biasa.';

            try {
                $response = \Illuminate\Support\Facades\Http::timeout(15)->withHeaders([
                    'Authorization' => 'Bearer ' . config('services.openrouter.api_key'),
                    'Content-Type' => 'application/json',
                ])->post('https://openrouter.ai/api/v1/chat/completions', [
                    'model' => config('services.openrouter.model', 'openrouter/free'),
                    'messages' => [['role' => 'user', 'content' => $prompt]],
                ]);

                if ($response->successful()) {
                    $content = $response->json()['choices'][0]['message']['content'];
                    if ($content) {
                        return $content;
                    }
                }
            } catch (\Exception $e) {
                // Return fallback
            }

            return 'Grafik pendaftaran terlihat menjanjikan. Tetap semangat dalam memverifikasi data calon mahasiswa baru agar kuota segera terpenuhi!';
        });

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
            'monthRegistrations' => $monthRegistrations,
            'waveStats' => $waveStats,
            'activePeriod' => $activePeriod,
            'allPeriods' => $allPeriods,
            'selectedPeriod' => $selectedPeriod,
            'registrationTrend' => $registrationTrend,
            'aiInsight' => $aiInsight,
        ]);
    }
}
