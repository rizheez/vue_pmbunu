<?php

/**
 * Test Alur Admin Manual: Dari Daftar Manual hingga Generate NIM
 *
 * Flow: Admin Verify → Admin Accept → Payment Verify → Admin Generate NIM
 * (Tests admin actions on pre-existing registrations)
 */

use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPath;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\ReregistrationPayment;
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

describe('Admin Manual Flow: Full Admin Registration to NIM Generation', function () {
    it('Step 1: Admin can verify a registration (submitted -> verified)', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
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

    it('Step 2: Admin can accept student (verified -> accepted)', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 'verified',
        ]);

        $this->actingAs($this->admin)
            ->post("/admin/students/{$student->id}/accept", [
                'program_studi_id' => $this->prodi1->id,
                'notes' => 'Diterima via admin',
            ])
            ->assertRedirect();

        $registration->refresh();
        expect($registration->status)->toBe('accepted');
        expect($registration->accepted_program_studi_id)->toBe($this->prodi1->id);
    });

    it('Step 3: Admin can verify payment (re_registration_pending -> re_registration_verified)', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 're_registration_pending',
            'accepted_program_studi_id' => $this->prodi1->id,
        ]);

        // Create payment record
        $payment = ReregistrationPayment::create([
            'user_id' => $student->id,
            'amount' => 300000,
            'payment_proof_path' => 'payments/test.jpg',
            'status' => 'pending',
        ]);

        $this->actingAs($this->admin)
            ->post("/admin/reregistration-payments/{$payment->id}/verify", [
                'notes' => 'Payment valid',
            ])
            ->assertRedirect();

        $registration->refresh();
        expect($registration->status)->toBe('re_registration_verified');
    });

    it('Step 4: Admin can generate NIM (re_registration_verified -> enrolled)', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
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
        expect($student->nim)->toContain('0101'); // prodi nim_code
    });

    it('Complete Flow: submitted -> verified -> accepted -> re_registration_pending -> re_registration_verified -> enrolled', function () {
        $student = User::factory()->create(['role' => 'student', 'email' => 'complete@test.com']);

        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 'submitted',
        ]);

        // Step 1: Verify
        $this->actingAs($this->admin)->post("/admin/students/{$student->id}/verify");
        $registration->refresh();
        expect($registration->status)->toBe('verified');

        // Step 2: Accept
        $this->actingAs($this->admin)
            ->post("/admin/students/{$student->id}/accept", [
                'program_studi_id' => $this->prodi1->id,
                'notes' => 'Diterima',
            ]);
        $registration->refresh();
        expect($registration->status)->toBe('accepted');

        // Step 3: Simulate student accessing re-registration (status changes to pending)
        \App\Models\StudentBiodata::create([
            'user_id' => $student->id,
            'name' => $student->name,
        ]);
        $this->actingAs($student)->get('/student/reregistration');
        $registration->refresh();
        expect($registration->status)->toBe('re_registration_pending');

        // Step 4: Admin verifies payment
        $payment = ReregistrationPayment::create([
            'user_id' => $student->id,
            'amount' => 300000,
            'payment_proof_path' => 'payments/test.jpg',
            'status' => 'pending',
        ]);

        $this->actingAs($this->admin)
            ->post("/admin/reregistration-payments/{$payment->id}/verify", [
                'notes' => 'Pembayaran valid',
            ]);
        $registration->refresh();
        expect($registration->status)->toBe('re_registration_verified');

        // Step 5: Generate NIM
        $this->actingAs($this->admin)
            ->post('/admin/nim-generation/generate', [
                'registration_ids' => [$registration->id],
            ])
            ->assertOk();

        $registration->refresh();
        $student->refresh();

        expect($registration->status)->toBe('enrolled');
        expect($student->nim)->not->toBeNull();
    });
});
