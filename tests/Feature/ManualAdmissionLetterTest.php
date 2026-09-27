<?php

use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

beforeEach(function () {
    $this->period = RegistrationPeriod::factory()->create([
        'academic_year' => '2026/2027',
        'is_active' => true,
    ]);

    $this->type = RegistrationType::create([
        'id' => 1,
        'name' => 'Peserta Didik Baru',
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

    $this->admin = User::factory()->create([
        'role' => 'admin',
        'email' => 'admin@unukaltim.ac.id',
    ]);
});

it('allows admin to create admission letter for non-registered student via manual input', function () {
    $response = $this->actingAs($this->admin)
        ->post(route('admin.admission-letters.store'), [
            'entry_mode' => 'manual',
            'student_name' => 'Ahmad Dahlan',
            'nim' => '220105088',
            'program_studi_id' => $this->prodi->id,
            'registration_number' => 'UNU-2022-0088',
            'email' => 'ahmad.dahlan@example.com',
            'source_type' => 'generate_web',
            'letter_date' => '2026-09-24',
            'subject' => 'Pemberitahuan',
            'signatory_name' => 'Drs. H. Sus Eko Zuhri Ernada, Grad.Dipl.IR., M.A., P.hD., CIQnR., CIQaR.',
        ]);

    $response->assertSessionHasNoErrors();
    $response->assertRedirect(route('admin.admission-letters.index'));

    $user = User::where('nim', '220105088')->first();
    expect($user)->not->toBeNull();
    expect($user->name)->toBe('Ahmad Dahlan');
    expect($user->email)->toBe('ahmad.dahlan@example.com');
    expect($user->role)->toBe('student');

    $registration = $user->registration;
    expect($registration)->not->toBeNull();
    expect($registration->accepted_program_studi_id)->toBe($this->prodi->id);
    expect($registration->status)->toBe('enrolled');
    expect($registration->registration_number)->toBe('UNU-2022-0088');

    $letter = $user->admissionLetter;
    expect($letter)->not->toBeNull();
    expect($letter->pdf_path)->not->toBeNull();
});

it('auto-generates student email when email is omitted in manual mode', function () {
    $response = $this->actingAs($this->admin)
        ->post(route('admin.admission-letters.store'), [
            'entry_mode' => 'manual',
            'student_name' => 'Siti Nurhaliza',
            'nim' => '210105011',
            'program_studi_id' => $this->prodi->id,
            'source_type' => 'generate_web',
            'letter_date' => '2026-09-24',
            'subject' => 'Pemberitahuan',
            'signatory_name' => 'Drs. H. Sus Eko Zuhri Ernada, Grad.Dipl.IR., M.A., P.hD., CIQnR., CIQaR.',
        ]);

    $response->assertSessionHasNoErrors();

    $user = User::where('nim', '210105011')->first();
    expect($user)->not->toBeNull();
    expect($user->email)->toBe('210105011@student.unukaltim.ac.id');
    expect($user->registration->registration_number)->toBeNull();
});

it('prevents creating duplicate admission letter for the same NIM in manual mode', function () {
    // First creation
    $this->actingAs($this->admin)
        ->post(route('admin.admission-letters.store'), [
            'entry_mode' => 'manual',
            'student_name' => 'Budi Santoso',
            'nim' => '230105012',
            'program_studi_id' => $this->prodi->id,
            'source_type' => 'generate_web',
            'letter_date' => '2026-09-24',
            'subject' => 'Pemberitahuan',
            'signatory_name' => 'Drs. H. Sus Eko Zuhri Ernada, Grad.Dipl.IR., M.A., P.hD., CIQnR., CIQaR.',
        ]);

    // Second creation with same NIM
    $response = $this->actingAs($this->admin)
        ->post(route('admin.admission-letters.store'), [
            'entry_mode' => 'manual',
            'student_name' => 'Budi Santoso',
            'nim' => '230105012',
            'program_studi_id' => $this->prodi->id,
            'source_type' => 'generate_web',
            'letter_date' => '2026-09-24',
            'subject' => 'Pemberitahuan',
            'signatory_name' => 'Drs. H. Sus Eko Zuhri Ernada, Grad.Dipl.IR., M.A., P.hD., CIQnR., CIQaR.',
        ]);

    $response->assertSessionHasErrors('nim');
});

it('validates required fields in manual mode', function () {
    $response = $this->actingAs($this->admin)
        ->post(route('admin.admission-letters.store'), [
            'entry_mode' => 'manual',
            'student_name' => '',
            'nim' => '',
            'program_studi_id' => '',
            'source_type' => 'generate_web',
            'letter_date' => '',
            'subject' => '',
            'signatory_name' => '',
        ]);

    $response->assertSessionHasErrors(['student_name', 'nim', 'program_studi_id', 'letter_date', 'subject', 'signatory_name']);
});
