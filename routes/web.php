<?php

use App\Http\Controllers\Admin\AdminReregistrationController;
use App\Http\Controllers\Admin\AdmissionLetterController;
use App\Http\Controllers\Admin\AnnouncementController;
use App\Http\Controllers\Admin\ChatLogController;
use App\Http\Controllers\Admin\DashboardController as AdminDashboardController;
use App\Http\Controllers\Admin\DocumentVerificationController;
use App\Http\Controllers\Admin\EnrolledStudentController;
use App\Http\Controllers\Admin\FakultasController;
use App\Http\Controllers\Admin\LandingPageSettingController;
use App\Http\Controllers\Admin\NimGenerationController;
use App\Http\Controllers\Admin\PaymentSettingController;
use App\Http\Controllers\Admin\PeriodController;
use App\Http\Controllers\Admin\ProgramStudiController;
use App\Http\Controllers\Admin\RegistrationPathController;
use App\Http\Controllers\Admin\RegistrationTypeController;
use App\Http\Controllers\Admin\ReregistrationPaymentController;
use App\Http\Controllers\Admin\ScholarshipController;
use App\Http\Controllers\Admin\StudentController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\AdmissionLetterVerificationController;
use App\Http\Controllers\Api\ChatController;
use App\Http\Controllers\GuideController;
use App\Http\Controllers\RegistrationCardController;
use App\Http\Controllers\ReregistrationController;
use App\Http\Controllers\StudentAdmissionLetterController;
use App\Http\Controllers\StudentBiodataController;
use App\Http\Controllers\StudentDashboardController;
use App\Http\Controllers\StudentRegistrationController;
use App\Models\Fakultas;
use App\Models\LandingPageSetting;
use App\Models\RegistrationPeriod;
use Illuminate\Http\Request;
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

Route::get('/panduan', [GuideController::class, 'index'])->name('panduan');
Route::get('/panduan-lengkap', [GuideController::class, 'view'])->name('panduan.view');
Route::get('/s/{token}', [AdmissionLetterVerificationController::class, 'show'])->name('admission-letters.short-verify');
Route::get('/verifikasi-surat/{token}', [AdmissionLetterVerificationController::class, 'show'])->name('admission-letters.verify');

Route::get('dashboard', function (Request $request) {
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

    // Re-registration routes (Neo Feeder compatible)
    Route::get('/reregistration', [ReregistrationController::class, 'edit'])->name('reregistration.edit');
    Route::post('/reregistration', [ReregistrationController::class, 'update'])->name('reregistration.update');
    Route::get('/reregistration/payment', [ReregistrationController::class, 'paymentPage'])->name('reregistration.payment.page');
    Route::post('/reregistration/payment', [ReregistrationController::class, 'uploadPayment'])->name('reregistration.payment');

    // Registration card PDF
    Route::get('/registration-card', [RegistrationCardController::class, 'showStudent'])->name('registration-card');
    Route::get('/admission-letter', [StudentAdmissionLetterController::class, 'show'])->name('admission-letter');
});

// Admin Panel Routes
Route::middleware(['auth', 'verified', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');

    // Students
    Route::get('/students', [StudentController::class, 'index'])->name('students.index');
    Route::get('/students/create', [StudentController::class, 'create'])->name('students.create');
    Route::post('/students', [StudentController::class, 'store'])->name('students.store');
    Route::get('/students-export', [StudentController::class, 'export'])->name('students.export');

    // Student routes with hashed ID
    Route::middleware('hashid')->group(function () {
        Route::get('/students/{id}/edit', [StudentController::class, 'edit'])->name('students.edit');
        Route::put('/students/{id}', [StudentController::class, 'update'])->name('students.update');
        Route::get('/students/{id}', [StudentController::class, 'show'])->name('students.show');
        Route::post('/students/{id}/verify', [StudentController::class, 'verify'])->name('students.verify');
        Route::post('/students/{id}/accept', [StudentController::class, 'accept'])->name('students.accept');
        Route::post('/students/{id}/reject', [StudentController::class, 'reject'])->name('students.reject');
        Route::get('/students/{id}/registration-card', [RegistrationCardController::class, 'show'])->name('students.registration-card');

        // Document Verification
        Route::get('/students/{id}/documents', [DocumentVerificationController::class, 'show'])->name('students.documents');
        Route::post('/students/{id}/documents/bulk-verify', [DocumentVerificationController::class, 'bulkVerify'])->name('students.documents.bulkVerify');
    });

    // Document approval/rejection (uses document ID, not student ID)
    Route::post('/documents/{id}/approve', [DocumentVerificationController::class, 'approve'])->name('documents.approve');
    Route::post('/documents/{id}/reject', [DocumentVerificationController::class, 'reject'])->name('documents.reject');

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
    Route::get('/registration-types', [RegistrationTypeController::class, 'index'])->name('registration-types.index');
    Route::post('/registration-types', [RegistrationTypeController::class, 'store'])->name('registration-types.store');
    Route::put('/registration-types/{id}', [RegistrationTypeController::class, 'update'])->name('registration-types.update');
    Route::delete('/registration-types/{id}', [RegistrationTypeController::class, 'destroy'])->name('registration-types.destroy');

    // Registration Paths
    Route::get('/registration-paths', [RegistrationPathController::class, 'index'])->name('registration-paths.index');
    Route::post('/registration-paths', [RegistrationPathController::class, 'store'])->name('registration-paths.store');
    Route::put('/registration-paths/{id}', [RegistrationPathController::class, 'update'])->name('registration-paths.update');
    Route::delete('/registration-paths/{id}', [RegistrationPathController::class, 'destroy'])->name('registration-paths.destroy');

    // Scholarships
    Route::get('/scholarships', [ScholarshipController::class, 'index'])->name('scholarships.index');
    Route::post('/scholarships', [ScholarshipController::class, 'store'])->name('scholarships.store');
    Route::put('/scholarships/{id}', [ScholarshipController::class, 'update'])->name('scholarships.update');
    Route::delete('/scholarships/{id}', [ScholarshipController::class, 'destroy'])->name('scholarships.destroy');

    // Landing Page Settings
    Route::get('/landing-page', [LandingPageSettingController::class, 'index'])->name('landing-page.index');
    Route::post('/landing-page', [LandingPageSettingController::class, 'update'])->name('landing-page.update');

    // User Management
    Route::get('/users', [UserController::class, 'index'])->name('users.index');
    Route::post('/users', [UserController::class, 'store'])->name('users.store');
    Route::middleware('hashid')->group(function () {
        Route::put('/users/{id}', [UserController::class, 'update'])->name('users.update');
        Route::delete('/users/{id}', [UserController::class, 'destroy'])->name('users.destroy');
    });

    // Dokumentasi
    Route::get('/dokumentasi', fn () => Inertia::render('admin/Dokumentasi'))->name('dokumentasi');

    // Reregistration Payments
    Route::get('/reregistration-payments', [ReregistrationPaymentController::class, 'index'])->name('reregistration-payments.index');
    Route::post('/reregistration-payments', [ReregistrationPaymentController::class, 'store'])->name('reregistration-payments.store');
    Route::put('/reregistration-payments/{payment}', [ReregistrationPaymentController::class, 'update'])->name('reregistration-payments.update');
    Route::post('/reregistration-payments/{payment}/verify', [ReregistrationPaymentController::class, 'verify'])->name('reregistration-payments.verify');
    Route::post('/reregistration-payments/{payment}/reject', [ReregistrationPaymentController::class, 'reject'])->name('reregistration-payments.reject');

    // NIM Generation
    Route::get('/nim-generation', [NimGenerationController::class, 'index'])->name('nim-generation.index');
    Route::post('/nim-generation/generate', [NimGenerationController::class, 'generate'])->name('nim-generation.generate');

    // Admission Letters
    Route::get('/admission-letters', [AdmissionLetterController::class, 'index'])->name('admission-letters.index');
    Route::post('/admission-letters', [AdmissionLetterController::class, 'store'])->name('admission-letters.store');
    Route::post('/admission-letters/{letter}/regenerate', [AdmissionLetterController::class, 'regenerate'])->name('admission-letters.regenerate');
    Route::post('/admission-letters/{letter}/send-email', [AdmissionLetterController::class, 'sendEmail'])->name('admission-letters.send-email');
    Route::get('/admission-letters/{letter}/pdf', [AdmissionLetterController::class, 'pdf'])->name('admission-letters.pdf');

    // Admin Reregistration (Manual)
    Route::get('/reregistration', [AdminReregistrationController::class, 'index'])->name('reregistration.index');
    Route::middleware('hashid')->group(function () {
        Route::get('/reregistration/{id}/edit', [AdminReregistrationController::class, 'edit'])->name('reregistration.edit');
        Route::put('/reregistration/{id}', [AdminReregistrationController::class, 'update'])->name('reregistration.update');
    });

    // Enrolled Students
    Route::get('/enrolled-students', [EnrolledStudentController::class, 'index'])->name('enrolled-students.index');
    Route::patch('/enrolled-students/{registration}/nim', [EnrolledStudentController::class, 'updateNim'])->name('enrolled-students.update-nim');
    Route::post('/enrolled-students/{registration}/cancel', [EnrolledStudentController::class, 'cancel'])->name('enrolled-students.cancel');

    // Payment Settings
    Route::get('/payment-settings', [PaymentSettingController::class, 'index'])->name('payment-settings.index');
    Route::post('/payment-settings', [PaymentSettingController::class, 'update'])->name('payment-settings.update');

    // Chat Logs
    Route::get('/chat-logs', [ChatLogController::class, 'index'])->name('chat-logs.index');
    Route::delete('/chat-logs/{chatLog}', [ChatLogController::class, 'destroy'])->name('chat-logs.destroy');
    Route::delete('/chat-logs', [ChatLogController::class, 'destroyAll'])->name('chat-logs.destroy-all');
});

// Chat API
Route::post('/api/chat', [ChatController::class, 'send'])->name('api.chat');
Route::get('/api/chat/training-data', [ChatController::class, 'trainingData'])->name('api.chat.training');

require __DIR__.'/settings.php';
