<?php

use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPath;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\User;

uses(\Illuminate\Foundation\Testing\RefreshDatabase::class);

beforeEach(function () {
    // Create base data without factories
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

describe('PMB Flow', function () {
    it('1. can create registration with submitted status', function () {
        $student = User::factory()->create([
            'role' => 'student',
            'email' => 'student@test.com',
        ]);

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

        expect($registration->status)->toBe('submitted');
        expect($registration->registration_number)->not->toBeNull();
        expect($registration->registration_number)->toContain('2627'); // Year 26, period wave
    });

    it('2. admin can verify registration (submitted -> verified)', function () {
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

    it('3. admin can accept student (verified -> accepted)', function () {
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
                'notes' => 'Diterima',
            ])
            ->assertRedirect();

        $registration->refresh();
        expect($registration->status)->toBe('accepted');
        expect($registration->accepted_program_studi_id)->toBe($this->prodi1->id);
    });

    it('4. accepted student status changes to re_registration_pending when accessing reregistration', function () {
        $student = User::factory()->create(['role' => 'student']);
        $registration = Registration::create([
            'user_id' => $student->id,
            'registration_period_id' => $this->period->id,
            'registration_type_id' => $this->type->id,
            'registration_path_id' => $this->path->id,
            'registration_number' => Registration::generateRegistrationNumber($this->period),
            'choice_1' => $this->prodi1->id,
            'choice_2' => $this->prodi2->id,
            'status' => 'accepted',
            'accepted_program_studi_id' => $this->prodi1->id,
        ]);

        // Create student biodata (required for reregistration page access)
        \App\Models\StudentBiodata::create([
            'user_id' => $student->id,
            'name' => $student->name,
        ]);

        $this->actingAs($student)
            ->get('/student/reregistration')
            ->assertOk();

        $registration->refresh();
        expect($registration->status)->toBe('re_registration_pending');
    });

    it('5. admin can verify payment (re_registration_pending -> re_registration_verified)', function () {
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
        $payment = \App\Models\ReregistrationPayment::create([
            'user_id' => $student->id,
            'amount' => 300000,
            'payment_proof_path' => 'payments/test.jpg',
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

    it('6. admin can generate NIM (re_registration_verified -> enrolled)', function () {
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
        expect($student->nim)->toStartWith('26'); // Year prefix
    });
});
