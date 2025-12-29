<?php

use App\Models\LandingPageSetting;
use App\Models\ProgramStudi;
use App\Models\RegistrationPath;
use App\Models\RegistrationPeriod;
use App\Services\ChatService;
use Mockery\MockInterface;

test('it generates correct system prompt context with mocks', function () {
    // Mock RegistrationPeriod
    $this->mock(RegistrationPeriod::class, function (MockInterface $mock) {
        $period = new RegistrationPeriod([
            'name' => 'Gelombang 1',
            'start_date' => now(),
            'end_date' => now()->addMonth(),
        ]);
        $mock->shouldReceive('where')->with('is_active', true)->andReturnSelf();
        $mock->shouldReceive('first')->andReturn($period);
    });

    // Mock RegistrationPath
    $this->mock(RegistrationPath::class, function (MockInterface $mock) {
        $pathCollection = collect([
            new RegistrationPath(['name' => 'Reguler']),
            new RegistrationPath(['name' => 'Beasiswa']),
        ]);
        $mock->shouldReceive('where')->with('is_active', true)->andReturnSelf();
        $mock->shouldReceive('pluck')->with('name')->andReturn($pathCollection->pluck('name'));
    });

    // Mock ProgramStudi
    $this->mock(ProgramStudi::class, function (MockInterface $mock) {
        $prodiCollection = collect([
            new ProgramStudi(['name' => 'Informatika', 'jenjang' => 'S1', 'quota' => 50]),
            new ProgramStudi(['name' => 'Akuntansi', 'jenjang' => 'S1', 'quota' => 40]),
        ]);
        $mock->shouldReceive('where')->with('is_active', true)->andReturnSelf();
        $mock->shouldReceive('get')->andReturn($prodiCollection);
    });

    // Mock LandingPageSetting
    $this->mock(LandingPageSetting::class, function (MockInterface $mock) {
        $settingsCollection = collect([
            'contact_phone_1' => '08123456789',
            'contact_email' => 'info@unukaltim.ac.id',
        ]);
        $mock->shouldReceive('where')->with('group', 'contact')->andReturnSelf();
        $mock->shouldReceive('pluck')->with('value', 'key')->andReturn($settingsCollection);
    });

    // Instantiate Service
    $chatService = new ChatService();

    // Call Method
    $context = $chatService->getSystemPromptContext();

    // Assert Content
    expect($context)->toContain('Gelombang saat ini: Gelombang 1')
        ->toContain('Reguler, Beasiswa')
        ->toContain('- S1 Informatika (Kuota: 50)')
        ->toContain('- S1 Akuntansi (Kuota: 40)')
        ->toContain('Telepon/WA: 08123456789')
        ->toContain('Email: info@unukaltim.ac.id');
});
