<?php

use App\Exports\StudentsExport;
use App\Models\Fakultas;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\Request;

uses(RefreshDatabase::class);

it('includes prodi diterima in headings and mapped data', function () {
    $period = RegistrationPeriod::create([
        'name' => 'Gelombang 1 2026/2027',
        'wave_number' => 1,
        'academic_year' => '2026/2027',
        'start_date' => '2026-01-01',
        'end_date' => '2026-06-30',
        'is_active' => true,
    ]);

    $type = RegistrationType::create([
        'name' => 'Peserta Didik Baru',
        'is_active' => true,
    ]);

    $fakultas = Fakultas::create([
        'code' => 'FT',
        'name' => 'Fakultas Teknik',
        'is_active' => true,
    ]);

    $prodi = ProgramStudi::create([
        'fakultas_id' => $fakultas->id,
        'code' => 'TI',
        'nim_code' => '55',
        'name' => 'Teknik Informatika',
        'jenjang' => 'S1',
        'is_active' => true,
    ]);

    $user = User::factory()->create(['role' => 'student']);
    $registration = Registration::create([
        'user_id' => $user->id,
        'registration_number' => 'PMB2026001',
        'registration_period_id' => $period->id,
        'registration_type_id' => $type->id,
        'accepted_program_studi_id' => $prodi->id,
        'status' => 'accepted',
    ]);

    $export = new StudentsExport(new Request);

    expect($export->headings())->toContain('Prodi Diterima');

    $mapped = $export->map($user->fresh());

    expect($mapped)->toContain('S1 - Teknik Informatika');
});

it('allows admin to download student export excel file', function () {
    $admin = User::factory()->create(['role' => 'admin']);

    $response = $this->actingAs($admin)
        ->get(route('admin.students.export'));

    $response->assertSuccessful();
    $response->assertHeader('content-disposition');
});
