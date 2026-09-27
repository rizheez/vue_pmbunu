<?php

use App\Models\AdmissionLetter;
use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\StudentBiodata;
use App\Models\User;
use App\Services\AdmissionLetterPdfService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Str;

uses(RefreshDatabase::class);

it('renders admission letter on exactly 1 page', function () {
    $period = RegistrationPeriod::factory()->create([
        'academic_year' => '2026/2027',
        'is_active' => true,
    ]);

    $fakultas = Fakultas::create([
        'id' => 1,
        'name' => 'Fakultas Ekonomi dan Bisnis',
        'code' => 'FEB',
        'is_active' => true,
    ]);

    $prodi = ProgramStudi::create([
        'fakultas_id' => 1,
        'name' => 'Akuntansi',
        'code' => 'AKT',
        'nim_code' => '0203',
        'jenjang' => 'S1',
        'quota' => 100,
        'is_active' => true,
    ]);

    $user = User::factory()->create([
        'name' => 'ROBIATUL MELINDA',
        'nim' => '260203031',
    ]);

    $biodata = StudentBiodata::create([
        'user_id' => $user->id,
        'name' => 'ROBIATUL MELINDA',
    ]);

    $type = RegistrationType::create([
        'id' => 1,
        'name' => 'Peserta Didik Baru',
        'is_active' => true,
    ]);

    $registration = Registration::create([
        'user_id' => $user->id,
        'registration_number' => 'UNU-26270300146',
        'registration_period_id' => $period->id,
        'registration_type_id' => $type->id,
        'accepted_program_studi_id' => $prodi->id,
        'status' => 'enrolled',
    ]);

    $letter = AdmissionLetter::create([
        'user_id' => $user->id,
        'source_type' => 'generate_web',
        'letter_number' => '273/PMB/UNU-KT/09/2026',
        'letter_date' => now(),
        'subject' => 'Pemberitahuan',
        'signatory_name' => 'Drs. H. Sus Eko Zuhri Ernada, Grad.Dipl.IR., M.A., P.hD., CIQnR., CIQaR.',
        'verification_token' => Str::random(24),
        'created_by' => $user->id,
        'generated_at' => now(),
    ]);

    $verificationUrl = 'https://pmb.unukaltim.ac.id/v/'.$letter->verification_token;
    $service = app(AdmissionLetterPdfService::class);
    $reflection = new ReflectionClass($service);
    $makeQr = $reflection->getMethod('makeQrCodeBase64');
    $makeQr->setAccessible(true);
    $qrBase64 = $makeQr->invoke($service, $verificationUrl);

    $imageBase64 = $reflection->getMethod('imageBase64');
    $imageBase64->setAccessible(true);

    $renderedHtml = view('pdf.admission-letter', [
        'letter' => $letter,
        'user' => $user,
        'biodata' => $biodata,
        'registration' => $registration,
        'verificationUrl' => $verificationUrl,
        'qrCodeBase64' => $qrBase64,
        'headerBase64' => $imageBase64->invoke($service, public_path('assets/letter_header.jpg'), 'image/jpeg'),
        'footerBase64' => $imageBase64->invoke($service, public_path('assets/letter_footer.jpg'), 'image/jpeg'),
        'logoBase64' => $imageBase64->invoke($service, public_path('assets/images/logo_unu.png'), 'image/png'),
    ])->render();

    expect($renderedHtml)->toContain('No. Pendaftaran');
    expect($renderedHtml)->toContain('UNU-26270300146');

    $dompdf = Pdf::loadHTML($renderedHtml);
    $dompdf->setPaper('a4', 'portrait');
    $dompdf->setOption('isRemoteEnabled', false);
    $dompdf->setOption('isHtml5ParserEnabled', true);

    $dompdf->render();
    $pageCount = $dompdf->getCanvas()->get_page_count();

    expect($pageCount)->toBe(1);
});

it('omits no pendaftaran in admission letter pdf when registration number is empty', function () {
    $period = RegistrationPeriod::factory()->create([
        'academic_year' => '2026/2027',
        'is_active' => true,
    ]);

    $fakultas = Fakultas::firstOrCreate(
        ['id' => 1],
        ['name' => 'Fakultas Ekonomi dan Bisnis', 'code' => 'FEB', 'is_active' => true]
    );

    $prodi = ProgramStudi::firstOrCreate(
        ['code' => 'AKT'],
        ['fakultas_id' => 1, 'name' => 'Akuntansi', 'nim_code' => '0203', 'jenjang' => 'S1', 'quota' => 100, 'is_active' => true]
    );

    $user = User::factory()->create([
        'name' => 'SITI NURHALIZA',
        'nim' => '210105011',
    ]);

    $biodata = StudentBiodata::create([
        'user_id' => $user->id,
        'name' => 'SITI NURHALIZA',
    ]);

    $type = RegistrationType::firstOrCreate(
        ['id' => 1],
        ['name' => 'Peserta Didik Baru', 'is_active' => true]
    );

    $registration = Registration::create([
        'user_id' => $user->id,
        'registration_number' => null,
        'registration_period_id' => $period->id,
        'registration_type_id' => $type->id,
        'accepted_program_studi_id' => $prodi->id,
        'status' => 'enrolled',
    ]);

    $letter = AdmissionLetter::create([
        'user_id' => $user->id,
        'source_type' => 'generate_web',
        'letter_number' => '274/PMB/UNU-KT/09/2026',
        'letter_date' => now(),
        'subject' => 'Pemberitahuan',
        'signatory_name' => 'Drs. H. Sus Eko Zuhri Ernada, Grad.Dipl.IR., M.A., P.hD., CIQnR., CIQaR.',
        'verification_token' => Str::random(24),
        'created_by' => $user->id,
        'generated_at' => now(),
    ]);

    $verificationUrl = 'https://pmb.unukaltim.ac.id/v/'.$letter->verification_token;
    $service = app(AdmissionLetterPdfService::class);
    $reflection = new ReflectionClass($service);
    $makeQr = $reflection->getMethod('makeQrCodeBase64');
    $makeQr->setAccessible(true);
    $qrBase64 = $makeQr->invoke($service, $verificationUrl);

    $imageBase64 = $reflection->getMethod('imageBase64');
    $imageBase64->setAccessible(true);

    $renderedHtml = view('pdf.admission-letter', [
        'letter' => $letter,
        'user' => $user,
        'biodata' => $biodata,
        'registration' => $registration,
        'verificationUrl' => $verificationUrl,
        'qrCodeBase64' => $qrBase64,
        'headerBase64' => $imageBase64->invoke($service, public_path('assets/letter_header.jpg'), 'image/jpeg'),
        'footerBase64' => $imageBase64->invoke($service, public_path('assets/letter_footer.jpg'), 'image/jpeg'),
        'logoBase64' => $imageBase64->invoke($service, public_path('assets/images/logo_unu.png'), 'image/png'),
    ])->render();

    expect($renderedHtml)->not->toContain('No. Pendaftaran');

    $dompdf = Pdf::loadHTML($renderedHtml);
    $dompdf->setPaper('a4', 'portrait');
    $dompdf->setOption('isRemoteEnabled', false);
    $dompdf->setOption('isHtml5ParserEnabled', true);

    $dompdf->render();
    $pageCount = $dompdf->getCanvas()->get_page_count();

    expect($pageCount)->toBe(1);
});
