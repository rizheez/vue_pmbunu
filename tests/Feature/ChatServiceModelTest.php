<?php

declare(strict_types=1);

use App\Services\ChatService;
use Illuminate\Support\Facades\Http;

test('it uses the configured openrouter model in the api payload', function () {
    config()->set('services.openrouter.api_key', 'test-api-key');
    config()->set('services.openrouter.model', 'openai/gpt-test');
    config()->set('services.openrouter.fallback_models', ['openrouter/free']);

    Http::fake([
        'https://openrouter.ai/api/v1/chat/completions' => Http::response([
            'choices' => [
                [
                    'message' => [
                        'content' => 'Respons test.',
                    ],
                ],
            ],
        ]),
    ]);

    $service = new ChatService;
    $method = new ReflectionMethod($service, 'chatWithOpenRouter');
    $method->setAccessible(true);

    $result = $method->invoke($service, 'Halo', [], 'System prompt');

    expect($result)
        ->success->toBeTrue()
        ->model->toBe('openai/gpt-test');

    Http::assertSent(fn ($request) => $request['model'] === 'openai/gpt-test');
});

test('it retries with openrouter fallback model when primary model fails', function () {
    config()->set('services.openrouter.api_key', 'test-api-key');
    config()->set('services.openrouter.model', 'provider/primary-free');
    config()->set('services.openrouter.fallback_models', ['openrouter/free']);

    Http::fakeSequence('https://openrouter.ai/api/v1/chat/completions')
        ->push(['error' => ['message' => 'Primary model unavailable.']], 503)
        ->push([
            'choices' => [
                [
                    'message' => [
                        'content' => 'Respons fallback.',
                    ],
                ],
            ],
        ]);

    $service = new ChatService;
    $method = new ReflectionMethod($service, 'chatWithOpenRouter');
    $method->setAccessible(true);

    $result = $method->invoke($service, 'Halo', [], 'System prompt');

    expect($result)
        ->success->toBeTrue()
        ->message->toBe('Respons fallback.')
        ->model->toBe('openrouter/free');

    Http::assertSentCount(2);
    Http::assertSent(fn ($request) => $request['model'] === 'provider/primary-free');
    Http::assertSent(fn ($request) => $request['model'] === 'openrouter/free');
});
