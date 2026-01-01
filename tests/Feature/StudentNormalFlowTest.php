<?php

/**
 * Test Alur Normal: Student Daftar Akun hingga Admin Generate NIM
 *
 * Flow: Register → Biodata → Submit → Verify → Accept → Re-registration → Payment → NIM
 */

use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPath;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\StudentBiodata;
use App\Models\User;

uses(\Illuminate\Foundation\Testing\RefreshDatabase::class);

beforeEach(function () {
    $this->period = RegistrationPeriod::create([
        'name' => 'Gelombang 1 2026/2027',
        'wave_number' => 1,
        'academic_year' => '2026/2027',
        'start_date' => '2026-01-01',
        'end_date' => '2026-06-30',
        'is_active' => true,
    ]);

    $this->type = RegistrationType::create([
        'name' => 'Peserta Didik Baru',
        'is_active' => true,
    ]);

    $this->path = RegistrationPath::create([
        'name' => 'Umum/Reguler',
        'is_active' => true,
    ]);

    $this->fakultas = Fakultas::create([
        'name' => 'Fakultas Teknik',
        'code' => 'FT',
        'is_active' => true,
    ]);

    $this->prodi1 = ProgramStudi::create([
        'fakultas_id' => $this->fakultas->id,
        'name' => 'Teknik Informatika',
        'code' => 'TI',
        'jenjang' => 'S1',
        'nim_code' => '0101',
        'is_active' => true,
    ]);

    $this->prodi2 = ProgramStudi::create([
        'fakultas_id' => $this->fakultas->id,
        'name' => 'Teknik Industri',
        'code' => 'TIN',
        'jenjang' => 'S1',
        'nim_code' => '0102',
        'is_active' => true,
    ]);

    $this->admin = User::factory()->create([
        'role' => 'admin',
        'email' => 'admin@test.com',
    ]);
});

describe('Student Normal Flow: Registration to NIM Generation', function () {
    it('Step 1: Student registers account', function () {
        $response = $this->post('/register', [
            'name' => 'Mahasiswa Baru',
            'email' => 'mahasiswa@test.com',
            'phone' => '081234567890',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ]);

        $response->assertRedirect();

        $student = User::where('email', 'mahasiswa@test.com')->first();
        expect($student)->not->toBeNull();
        expect($student->role)->toBe('student');
    });

    it('Step 2: Student can access registration form and submit', function () {
        $student = User::factory()->create([
            'role' => 'student',
            'email' => 'student@test.com',
        ]);

        // Submit registration via correct route with student prefix
        $response = $this->actingAs($student)->post('/student/pendaftaran', [
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
        ]);

        $response->assertRedirect();

        $registration = Registration::where('user_id', $student->id)->first();
        expect($registration)->not->toBeNull();
        expect($registration->status)->toBe('submitted');
        expect($registration->registration_number)->not->toBeNull();
    });

    it('Step 3: Admin verifies student registration', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_path' => 'Umum',
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 'submitted',
        ]);

        $this->actingAs($this->admin)
            ->post("/admin/students/{$student->id}/verify")
            ->assertRedirect();

        $registration->refresh();
        expect($registration->status)->toBe('verified');
    });

    it('Step 4: Admin accepts student with program studi', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_path' => 'Umum',
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 'verified',
        ]);

        $this->actingAs($this->admin)
            ->post("/admin/students/{$student->id}/accept", [
                'program_studi_id' => $this->prodi1->id,
                'notes' => 'Diterima',
            ])
            ->assertRedirect();

        $registration->refresh();
        expect($registration->status)->toBe('accepted');
        expect($registration->accepted_program_studi_id)->toBe($this->prodi1->id);
    });

    it('Step 5: Student accesses re-registration page (status changes automatically)', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_path' => 'Umum',
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 'accepted',
            'accepted_program_studi_id' => $this->prodi1->id,
        ]);

        StudentBiodata::create([
            'user_id' => $student->id,
            'name' => $student->name,
        ]);

        $this->actingAs($student)
            ->get('/student/reregistration')
            ->assertOk();

        $registration->refresh();
        expect($registration->status)->toBe('re_registration_pending');
    });

    it('Step 6: Student uploads payment proof', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_path' => 'Umum',
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 're_registration_pending',
            'accepted_program_studi_id' => $this->prodi1->id,
        ]);

        StudentBiodata::create([
            'user_id' => $student->id,
            'name' => $student->name,
        ]);

        // Simulate payment upload
        $payment = \App\Models\ReregistrationPayment::create([
            'user_id' => $student->id,
            'amount' => 300000,
            'payment_proof_path' => 'payments/proof.jpg',
            'status' => 'pending',
        ]);

        expect($payment)->not->toBeNull();
        expect($payment->status)->toBe('pending');
    });

    it('Step 7: Admin verifies payment (status changes to re_registration_verified)', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_path' => 'Umum',
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 're_registration_pending',
            'accepted_program_studi_id' => $this->prodi1->id,
        ]);

        $payment = \App\Models\ReregistrationPayment::create([
            'user_id' => $student->id,
            'amount' => 300000,
            'payment_proof_path' => 'payments/proof.jpg',
            'status' => 'pending',
        ]);

        $this->actingAs($this->admin)
            ->post("/admin/reregistration-payments/{$payment->id}/verify", [
                'notes' => 'Pembayaran valid',
            ])
            ->assertRedirect();

        $registration->refresh();
        expect($registration->status)->toBe('re_registration_verified');
    });

    it('Step 8: Admin generates NIM (final step - enrolled)', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_path' => 'Umum',
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 're_registration_verified',
            'accepted_program_studi_id' => $this->prodi1->id,
        ]);

        $this->actingAs($this->admin)
            ->post('/admin/nim-generation/generate', [
                'registration_ids' => [$registration->id],
            ])
            ->assertOk();

        $registration->refresh();
        $student->refresh();

        expect($registration->status)->toBe('enrolled');
        expect($student->nim)->not->toBeNull();
        expect($student->nim)->toStartWith('26');
    });
});
