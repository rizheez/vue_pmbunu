<?php

declare(strict_types=1);

use App\Services\ChatService;

test('it responds to greetings without calling the API', function (string $greeting) {
    $service = app(ChatService::class);
    $result = $service->chat($greeting);

    expect($result)
        ->success->toBeTrue()
        ->provider->toBe('greeting')
        ->message->toContain('asisten virtual PMB UNU Kaltim');
})->with([
    'halo' => 'halo',
    'hai' => 'hai',
    'halo kak' => 'halo kak',
    'hi kak' => 'hi kak',
    'selamat pagi' => 'selamat pagi',
    'selamat siang' => 'selamat siang',
    'assalamualaikum' => 'assalamualaikum',
    'permisi kak' => 'permisi kak',
    'kak' => 'kak',
    'p' => 'p',
    'HALO KAK' => 'HALO KAK',
    'halo!' => 'halo!',
    'hai kak!' => 'hai kak!',
]);

test('it rejects clearly off-topic questions', function (string $question) {
    $service = app(ChatService::class);

    $method = new ReflectionMethod($service, 'isOutOfScope');
    $method->setAccessible(true);

    expect($method->invoke($service, $question))->toBeTrue();
})->with([
    'resep masakan' => 'resep masakan padang',
    'bitcoin' => 'berapa harga bitcoin sekarang',
    'game' => 'cara main valorant',
    'film' => 'rekomendasi film terbaru',
    'musik' => 'lagu terpopuler 2026',
    'politik' => 'siapa presiden sekarang',
    'payment gateway' => 'cara integrasi payment gateway',
    'e-commerce' => 'jualan di tokopedia',
    'crypto' => 'trading crypto halal atau haram',
]);

test('it does NOT reject PMB-related questions', function (string $question) {
    $service = app(ChatService::class);

    $method = new ReflectionMethod($service, 'isOutOfScope');
    $method->setAccessible(true);

    expect($method->invoke($service, $question))->toBeFalse();
})->with([
    'pendaftaran' => 'bagaimana cara pendaftaran mahasiswa baru',
    'biaya' => 'berapa biaya kuliah di UNU Kaltim',
    'prodi' => 'apa saja program studi yang tersedia',
    'beasiswa' => 'apakah ada beasiswa KIP',
    'jadwal' => 'kapan jadwal seleksi gelombang 2',
    'dokumen' => 'dokumen apa saja yang harus disiapkan',
    'daftar ulang' => 'kapan daftar ulang dimulai',
    'jalur reguler' => 'apa beda jalur reguler dan karyawan',
    'upload foto' => 'cara upload foto di portal PMB',
    'UKT' => 'berapa UKT farmasi',
]);

test('greeting handler is case insensitive and ignores punctuation', function () {
    $service = app(ChatService::class);

    $method = new ReflectionMethod($service, 'handleGreeting');
    $method->setAccessible(true);

    expect($method->invoke($service, 'HALO KAK!'))->not->toBeNull();
    expect($method->invoke($service, '  hai  '))->not->toBeNull();
    expect($method->invoke($service, 'Assalamualaikum!!'))->not->toBeNull();
});

test('greeting handler returns null for non-greeting messages', function () {
    $service = app(ChatService::class);

    $method = new ReflectionMethod($service, 'handleGreeting');
    $method->setAccessible(true);

    expect($method->invoke($service, 'berapa biaya pendaftaran'))->toBeNull();
    expect($method->invoke($service, 'program studi apa saja'))->toBeNull();
    expect($method->invoke($service, 'cara upload dokumen'))->toBeNull();
});
