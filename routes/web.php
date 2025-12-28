<?php

use App\Http\Controllers\Admin\AnnouncementController;
use App\Http\Controllers\Admin\DashboardController as AdminDashboardController;
use App\Http\Controllers\Admin\DocumentVerificationController;
use App\Http\Controllers\Admin\FakultasController;
use App\Http\Controllers\Admin\PeriodController;
use App\Http\Controllers\Admin\ProgramStudiController;
use App\Http\Controllers\Admin\StudentController;
use App\Http\Controllers\RegistrationCardController;
use App\Http\Controllers\StudentBiodataController;
use App\Http\Controllers\StudentDashboardController;
use App\Http\Controllers\StudentRegistrationController;
use App\Models\Fakultas;
use App\Models\LandingPageSetting;
use App\Models\RegistrationPeriod;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;

Route::get('/', function () {
    $fakultas = Fakultas::where('is_active', true)
        ->with(['programStudi' => fn ($q) => $q->where('is_active', true)->orderBy('jenjang')->orderBy('name')])
        ->orderBy('name')
        ->get();

    $activePeriod = RegistrationPeriod::where('is_active', true)->first();

    // Get landing page settings grouped by section
    $settings = LandingPageSetting::all()->groupBy('group')->map(function ($group) {
        return $group->mapWithKeys(function ($setting) {
            return [$setting->key => $setting->type === 'image' ? $setting->image_url : $setting->value];
        });
    });

    return Inertia::render('Welcome', [
        'canRegister' => Features::enabled(Features::registration()),
        'fakultas' => $fakultas,
        'activePeriod' => $activePeriod,
        'settings' => $settings,
    ]);
})->name('home');

Route::get('/panduan', [App\Http\Controllers\GuideController::class, 'index'])->name('panduan');
Route::get('/panduan-lengkap', [App\Http\Controllers\GuideController::class, 'view'])->name('panduan.view');

Route::get('dashboard', function (Illuminate\Http\Request $request) {
    if ($request->user()->isStudent()) {
        return redirect()->route('student.dashboard', $request->query());
    }
    if ($request->user()->isAdmin()) {
        return redirect()->route('admin.dashboard');
    }

    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// Student Portal Routes
Route::middleware(['auth', 'verified', 'student'])->prefix('student')->name('student.')->group(function () {
    Route::get('/dashboard', [StudentDashboardController::class, 'index'])->name('dashboard');

    // Biodata routes
    Route::get('/biodata', [StudentBiodataController::class, 'index'])->name('biodata.index');
    Route::get('/biodata/edit', [StudentBiodataController::class, 'edit'])->name('biodata.edit');
    Route::post('/biodata', [StudentBiodataController::class, 'update'])->name('biodata.update');

    // Registration routes
    Route::get('/pendaftaran', [StudentRegistrationController::class, 'index'])->name('pendaftaran.index');
    Route::post('/pendaftaran', [StudentRegistrationController::class, 'store'])->name('pendaftaran.store');

    // Re-registration routes (placeholder)
    Route::get('/daftar-ulang', function () {
        return Inertia::render('student/daftar-ulang/Index');
    })->name('daftar-ulang.index');

    // Registration card PDF
    Route::get('/registration-card', [RegistrationCardController::class, 'showStudent'])->name('registration-card');
});

// Admin Panel Routes
Route::middleware(['auth', 'verified', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');

    // Students
    Route::get('/students', [StudentController::class, 'index'])->name('students.index');
    Route::get('/students/create', [StudentController::class, 'create'])->name('students.create');
    Route::post('/students', [StudentController::class, 'store'])->name('students.store');
    Route::get('/students/{id}/edit', [StudentController::class, 'edit'])->name('students.edit');
    Route::put('/students/{id}', [StudentController::class, 'update'])->name('students.update');
    Route::get('/students/{id}', [StudentController::class, 'show'])->name('students.show');
    Route::post('/students/{id}/verify', [StudentController::class, 'verify'])->name('students.verify');
    Route::post('/students/{id}/accept', [StudentController::class, 'accept'])->name('students.accept');
    Route::post('/students/{id}/reject', [StudentController::class, 'reject'])->name('students.reject');
    Route::get('/students/{id}/registration-card', [RegistrationCardController::class, 'show'])->name('students.registration-card');

    // Document Verification
    Route::get('/students/{id}/documents', [DocumentVerificationController::class, 'show'])->name('students.documents');
    Route::post('/documents/{id}/approve', [DocumentVerificationController::class, 'approve'])->name('documents.approve');
    Route::post('/documents/{id}/reject', [DocumentVerificationController::class, 'reject'])->name('documents.reject');
    Route::post('/students/{id}/documents/bulk-verify', [DocumentVerificationController::class, 'bulkVerify'])->name('students.documents.bulkVerify');

    // Periods
    Route::get('/periods', [PeriodController::class, 'index'])->name('periods.index');
    Route::post('/periods', [PeriodController::class, 'store'])->name('periods.store');
    Route::put('/periods/{id}', [PeriodController::class, 'update'])->name('periods.update');
    Route::delete('/periods/{id}', [PeriodController::class, 'destroy'])->name('periods.destroy');
    Route::post('/periods/{id}/activate', [PeriodController::class, 'activate'])->name('periods.activate');

    // Fakultas
    Route::get('/fakultas', [FakultasController::class, 'index'])->name('fakultas.index');
    Route::post('/fakultas', [FakultasController::class, 'store'])->name('fakultas.store');
    Route::put('/fakultas/{id}', [FakultasController::class, 'update'])->name('fakultas.update');
    Route::delete('/fakultas/{id}', [FakultasController::class, 'destroy'])->name('fakultas.destroy');

    // Program Studi
    Route::get('/program-studi', [ProgramStudiController::class, 'index'])->name('program-studi.index');
    Route::post('/program-studi', [ProgramStudiController::class, 'store'])->name('program-studi.store');
    Route::put('/program-studi/{id}', [ProgramStudiController::class, 'update'])->name('program-studi.update');
    Route::delete('/program-studi/{id}', [ProgramStudiController::class, 'destroy'])->name('program-studi.destroy');

    // Announcements
    Route::get('/announcements', [AnnouncementController::class, 'index'])->name('announcements.index');
    Route::post('/announcements', [AnnouncementController::class, 'store'])->name('announcements.store');
    Route::put('/announcements/{id}', [AnnouncementController::class, 'update'])->name('announcements.update');
    Route::delete('/announcements/{id}', [AnnouncementController::class, 'destroy'])->name('announcements.destroy');

    // Registration Types
    Route::get('/registration-types', [\App\Http\Controllers\Admin\RegistrationTypeController::class, 'index'])->name('registration-types.index');
    Route::post('/registration-types', [\App\Http\Controllers\Admin\RegistrationTypeController::class, 'store'])->name('registration-types.store');
    Route::put('/registration-types/{id}', [\App\Http\Controllers\Admin\RegistrationTypeController::class, 'update'])->name('registration-types.update');
    Route::delete('/registration-types/{id}', [\App\Http\Controllers\Admin\RegistrationTypeController::class, 'destroy'])->name('registration-types.destroy');

    // Registration Paths
    Route::get('/registration-paths', [\App\Http\Controllers\Admin\RegistrationPathController::class, 'index'])->name('registration-paths.index');
    Route::post('/registration-paths', [\App\Http\Controllers\Admin\RegistrationPathController::class, 'store'])->name('registration-paths.store');
    Route::put('/registration-paths/{id}', [\App\Http\Controllers\Admin\RegistrationPathController::class, 'update'])->name('registration-paths.update');
    Route::delete('/registration-paths/{id}', [\App\Http\Controllers\Admin\RegistrationPathController::class, 'destroy'])->name('registration-paths.destroy');

    // Landing Page Settings
    Route::get('/landing-page', [\App\Http\Controllers\Admin\LandingPageSettingController::class, 'index'])->name('landing-page.index');
    Route::post('/landing-page', [\App\Http\Controllers\Admin\LandingPageSettingController::class, 'update'])->name('landing-page.update');

    // User Management
    Route::get('/users', [\App\Http\Controllers\Admin\UserController::class, 'index'])->name('users.index');
    Route::post('/users', [\App\Http\Controllers\Admin\UserController::class, 'store'])->name('users.store');
    Route::put('/users/{id}', [\App\Http\Controllers\Admin\UserController::class, 'update'])->name('users.update');
    Route::delete('/users/{id}', [\App\Http\Controllers\Admin\UserController::class, 'destroy'])->name('users.destroy');

    // Dokumentasi
    Route::get('/dokumentasi', fn () => \Inertia\Inertia::render('admin/Dokumentasi'))->name('dokumentasi');
});

require __DIR__.'/settings.php';
