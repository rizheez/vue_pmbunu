<?php

use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

beforeEach(function () {
    $this->period = RegistrationPeriod::factory()->create([
        'academic_year' => '2025/2026',
        'wave_number' => 1,
        'is_active' => true,
    ]);

    $this->fakultas = Fakultas::create([
        'id' => 1,
        'name' => 'Fakultas Teknik',
        'code' => 'FT',
        'is_active' => true,
    ]);

    $this->prodi = ProgramStudi::create([
        'fakultas_id' => 1,
        'name' => 'Teknik Informatika',
        'code' => 'TI',
        'nim_code' => '0105',
        'jenjang' => 'S1',
        'quota' => 100,
        'is_active' => true,
    ]);

    $this->type = RegistrationType::create([
        'id' => 1,
        'name' => 'Peserta Didik Baru',
        'is_active' => true,
    ]);

    $this->admin = User::factory()->create([
        'role' => 'admin',
        'email' => 'admin@pmbunu.ac.id',
    ]);
});

it('allows admin to edit NIM sequence for enrolled student', function () {
    $student = User::factory()->create(['nim' => '250105001']);

    $registration = Registration::create([
        'user_id' => $student->id,
        'registration_number' => '252601000001',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => $this->type->id,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 'enrolled',
    ]);

    // Admin updates sequence to 015
    $response = $this->actingAs($this->admin)
        ->patch(route('admin.enrolled-students.update-nim', $registration), [
            'sequence' => '015',
        ]);

    $response->assertSessionHasNoErrors();
    $response->assertSessionHas('success');

    // NIM should be prefix (250105) + sequence (015) = 250105015
    expect($student->fresh()->nim)->toBe('250105015');
});

it('pads sequence with leading zeroes when less than 3 digits', function () {
    $student = User::factory()->create(['nim' => '250105001']);

    $registration = Registration::create([
        'user_id' => $student->id,
        'registration_number' => '252601000002',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => $this->type->id,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 'enrolled',
    ]);

    // Admin inputs '5' -> should be padded to '005'
    $response = $this->actingAs($this->admin)
        ->patch(route('admin.enrolled-students.update-nim', $registration), [
            'sequence' => '5',
        ]);

    $response->assertSessionHasNoErrors();
    expect($student->fresh()->nim)->toBe('250105005');
});

it('prevents assigning duplicate NIM', function () {
    // Another student already has 250105020
    User::factory()->create(['nim' => '250105020']);

    $student = User::factory()->create(['nim' => '250105001']);
    $registration = Registration::create([
        'user_id' => $student->id,
        'registration_number' => '252601000003',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => $this->type->id,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 'enrolled',
    ]);

    $response = $this->actingAs($this->admin)
        ->patch(route('admin.enrolled-students.update-nim', $registration), [
            'sequence' => '020',
        ]);

    $response->assertSessionHasErrors('sequence');
    expect($student->fresh()->nim)->toBe('250105001'); // remains unchanged
});

it('rejects NIM edit for non-enrolled students', function () {
    $student = User::factory()->create(['nim' => null]);
    $registration = Registration::create([
        'user_id' => $student->id,
        'registration_number' => '252601000004',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => $this->type->id,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 'submitted', // Not enrolled
    ]);

    $response = $this->actingAs($this->admin)
        ->patch(route('admin.enrolled-students.update-nim', $registration), [
            'sequence' => '010',
        ]);

    $response->assertSessionHas('error');
    expect($student->fresh()->nim)->toBeNull();
});

it('forbids unauthenticated or non-admin users from editing NIM', function () {
    $student = User::factory()->create(['nim' => '250105001', 'role' => 'student']);
    $registration = Registration::create([
        'user_id' => $student->id,
        'registration_number' => '252601000005',
        'registration_period_id' => $this->period->id,
        'registration_type_id' => $this->type->id,
        'accepted_program_studi_id' => $this->prodi->id,
        'status' => 'enrolled',
    ]);

    $response = $this->actingAs($student)
        ->patch(route('admin.enrolled-students.update-nim', $registration), [
            'sequence' => '010',
        ]);

    $response->assertRedirect(route('student.dashboard'));
});
