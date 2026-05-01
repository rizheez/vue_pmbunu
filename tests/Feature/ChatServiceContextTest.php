<?php

declare(strict_types=1);

use App\Models\ChatTraining;
use App\Models\Fakultas;
use App\Models\LandingPageSetting;
use App\Models\ProgramStudi;
use App\Models\RegistrationPath;
use App\Models\RegistrationPeriod;
use App\Services\ChatService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;

uses(RefreshDatabase::class);

test('it generates compact system prompt context', function () {
    Storage::fake('local');
    Cache::flush();

    RegistrationPeriod::create([
        'name' => 'Gelombang 1',
        'wave_number' => 1,
        'academic_year' => '2026/2027',
        'start_date' => now(),
        'end_date' => now()->addMonth(),
        'is_active' => true,
    ]);

    RegistrationPath::create(['name' => 'Reguler', 'is_active' => true]);
    RegistrationPath::create(['name' => 'Beasiswa', 'is_active' => true]);

    $fakultas = Fakultas::create([
        'name' => 'Fakultas Test',
        'code' => 'FT',
        'is_active' => true,
    ]);

    ProgramStudi::create([
        'fakultas_id' => $fakultas->id,
        'name' => 'Informatika',
        'code' => 'INF',
        'jenjang' => 'S1',
        'quota' => 50,
        'is_active' => true,
    ]);

    ProgramStudi::create([
        'fakultas_id' => $fakultas->id,
        'name' => 'Akuntansi',
        'code' => 'AK',
        'jenjang' => 'S1',
        'quota' => 40,
        'is_active' => true,
    ]);

    LandingPageSetting::create([
        'key' => 'contact_phone_1',
        'value' => '08123456789',
        'type' => 'text',
        'group' => 'contact',
    ]);

    LandingPageSetting::create([
        'key' => 'contact_email',
        'value' => 'info@unukaltim.ac.id',
        'type' => 'text',
        'group' => 'contact',
    ]);

    ChatTraining::create([
        'question' => "Bagaimana cara daftar?\n",
        'answer' => "Daftar lewat website PMB.\nLengkapi data.",
    ]);

    $context = app(ChatService::class)->getSystemPromptContext();

    expect($context)
        ->toContain('[KONTEKS PMB UNU KALTIM]')
        ->toContain('Gelombang: Gelombang 1')
        ->toContain('Jalur: Reguler, Beasiswa')
        ->toContain('Prodi: S1 Informatika kuota 50; S1 Akuntansi kuota 40')
        ->toContain('Kontak resmi: WA 08123456789; email info@unukaltim.ac.id')
        ->toContain('Q: Bagaimana cara daftar? | A: Daftar lewat website PMB. Lengkapi data.')
        ->not->toContain("\n\n\n");
});
