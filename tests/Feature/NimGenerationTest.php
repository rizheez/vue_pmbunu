<?php

use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\User;

uses(\Illuminate\Foundation\Testing\RefreshDatabase::class);

beforeEach(function () {
    // Create registration period
    $this->period = RegistrationPeriod::factory()->create([
        'academic_year' => '2025/2026',
        'wave_number' => 1,
        'is_active' => true,
    ]);

    // Create program studi with nim_code
    $this->prodi = ProgramStudi::create([
        'fakultas_id' => 1,
        'name' => 'Teknik Informatika',
        'code' => 'TI',
        'nim_code' => '0105',
        'jenjang' => 'S1',
        'quota' => 100,
        'is_active' => true,
    ]);

    // Create registration types
    $this->typePesertaDidikBaru = RegistrationType::updateOrCreate(
        ['id' => 1],
        ['name' => 'Peserta Didik Baru', 'is_active' => true]
    );

    $this->typeAlihJenjang = RegistrationType::updateOrCreate(
        ['id' => 2],
        ['name' => 'Alih Jenjang', 'is_active' => true]
    );

    $this->typePindahan = RegistrationType::updateOrCreate(
        ['id' => 4],
        ['name' => 'Pindahan', 'is_active' => true]
    );
});

it('generates NIM with correct format for Peserta Didik Baru', function () {
    $user = User::factory()->create();

    $registration = Registration::create([
        'user_id' => $user->id,
        'registration_number' => '252601000001',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => Registration::TYPE_PESERTA_DIDIK_BARU,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 're_registration_verified',
    ]);

    $nim = $registration->enrollStudent();

    // Format: 25 (year) + 0105 (prodi) + 001 (sequence)
    expect($nim)->toBe('250105001');
    expect($user->fresh()->nim)->toBe('250105001');
    expect($registration->fresh()->status)->toBe('enrolled');
});

it('generates NIM with correct format for Alih Jenjang (starts at 901)', function () {
    $user = User::factory()->create();

    $registration = Registration::create([
        'user_id' => $user->id,
        'registration_number' => '252601000002',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => Registration::TYPE_ALIH_JENJANG,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 're_registration_verified',
    ]);

    $nim = $registration->enrollStudent();

    // Format: 25 (year) + 0105 (prodi) + 901 (sequence for Alih Jenjang)
    expect($nim)->toBe('250105901');
});

it('generates NIM with correct format for Pindahan (starts at 801)', function () {
    $user = User::factory()->create();

    $registration = Registration::create([
        'user_id' => $user->id,
        'registration_number' => '252601000003',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => Registration::TYPE_PINDAHAN,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 're_registration_verified',
    ]);

    $nim = $registration->enrollStudent();

    // Format: 25 (year) + 0105 (prodi) + 801 (sequence for Pindahan)
    expect($nim)->toBe('250105801');
});

it('increments NIM sequence correctly', function () {
    // Create first student with NIM
    $user1 = User::factory()->create(['nim' => '250105001']);

    // Create second registration
    $user2 = User::factory()->create();
    $registration2 = Registration::create([
        'user_id' => $user2->id,
        'registration_number' => '252601000002',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => Registration::TYPE_PESERTA_DIDIK_BARU,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 're_registration_verified',
    ]);

    $nim = $registration2->enrollStudent();

    expect($nim)->toBe('250105002');
});

it('throws exception when status is not re_registration_verified', function () {
    $user = User::factory()->create();

    $registration = Registration::create([
        'user_id' => $user->id,
        'registration_number' => '252601000001',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => Registration::TYPE_PESERTA_DIDIK_BARU,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 'accepted', // Wrong status
    ]);

    $registration->enrollStudent();
})->throws(\RuntimeException::class, 'Status harus "Daftar Ulang Terverifikasi" untuk melakukan enrollment');

it('throws exception when accepted_program_studi_id is not set', function () {
    $user = User::factory()->create();

    $registration = Registration::create([
        'user_id' => $user->id,
        'registration_number' => '252601000001',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => Registration::TYPE_PESERTA_DIDIK_BARU,
        'status' => 're_registration_verified',
    ]);

    $registration->enrollStudent();
})->throws(\RuntimeException::class, 'Program studi yang diterima belum ditentukan');
