<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class GeminiService
{
    private string $apiKey;

    private string $baseUrl = 'https://generativelanguage.googleapis.com/v1beta';

    private string $model = 'gemini-2.5-flash-lite';

    public function __construct()
    {
        $this->apiKey = config('services.gemini.api_key');
    }

    /**
     * Send a message to Gemini and get a response
     *
     * @param  array  $history  Previous conversation history
     * @return array{success: bool, message: string, error?: string}
     */
    public function chat(string $message, array $history = []): array
    {
        try {
            $contents = [];

            // Add conversation history
            foreach ($history as $item) {
                $contents[] = [
                    'role' => $item['role'],
                    'parts' => [['text' => $item['content']]],
                ];
            }

            // Add current user message
            $contents[] = [
                'role' => 'user',
                'parts' => [['text' => $message]],
            ];

            $response = Http::timeout(30)
                ->post("{$this->baseUrl}/models/{$this->model}:generateContent?key={$this->apiKey}", [
                    'contents' => $contents,
                    'generationConfig' => [
                        'temperature' => 0.7,
                        'topK' => 40,
                        'topP' => 0.95,
                        'maxOutputTokens' => 1024,
                    ],
                ]);

            if ($response->successful()) {
                $data = $response->json();
                $text = $data['candidates'][0]['content']['parts'][0]['text'] ?? 'Maaf, tidak ada respons.';

                return [
                    'success' => true,
                    'message' => $text,
                ];
            }

            Log::error('Gemini API Error', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            return [
                'success' => false,
                'message' => 'Gagal mendapatkan respons dari AI.',
                'error' => $response->body(),
            ];
        } catch (\Exception $e) {
            Log::error('Gemini Service Exception', [
                'message' => $e->getMessage(),
            ]);

            return [
                'success' => false,
                'message' => 'Terjadi kesalahan pada layanan AI.',
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Test the API connection
     *
     * @return array{success: bool, message: string, model?: string}
     */
    public function testConnection(): array
    {
        $result = $this->chat('Halo! Jawab dengan singkat: siapa kamu?');

        if ($result['success']) {
            return [
                'success' => true,
                'message' => $result['message'],
                'model' => $this->model,
            ];
        }

        return $result;
    }
}
