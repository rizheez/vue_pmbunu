<?php

namespace App\Services;

use App\Models\ChatTraining;
use App\Models\ProgramStudi;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationPath;
use App\Models\LandingPageSetting;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ChatService
{
    private string $provider;

    public function __construct()
    {
        $this->provider = config('services.chat.provider', 'openrouter');
    }

    /**
     * Send a message to the AI and get a response
     *
     * @param  array  $history  Previous conversation history
     * @param  string|null  $systemPrompt  System prompt for context
     * @return array{success: bool, message: string, error?: string}
     */
    public function chat(string $message, array $history = [], ?string $systemPrompt = null): array
    {
        // First, try to find a relevant answer from the training data
        $dbAnswer = $this->getRelevantAnswer($message);
        if ($dbAnswer !== null) {
            return [
                'success' => true,
                'message' => $dbAnswer,
                'provider' => 'database',
            ];
        }

        // If no DB answer, reject out‑of‑scope queries (PMB specific)
        if ($this->isOutOfScope($message)) {
            return [
                'success' => false,
                'message' => 'Maaf, pertanyaan di luar topik PMB tidak dapat dijawab.',
                'provider' => 'rejection',
            ];
        }

        // Inject dynamic context into system prompt
        $context = $this->getSystemPromptContext();
        $enhancedSystemPrompt = $systemPrompt ? ($systemPrompt . "\n\n" . $context) : $context;

        // Fallback to OpenRouter (Gemini removed)
        return $this->chatWithOpenRouter($message, $history, $enhancedSystemPrompt);
    }

    /**
     * Chat using OpenRouter API
     */
    private function chatWithOpenRouter(string $message, array $history, ?string $systemPrompt): array
    {
        try {
            $apiKey = config('services.openrouter.api_key');
            $messages = [];

            // Add system prompt if provided
            if ($systemPrompt) {
                $messages[] = ['role' => 'system', 'content' => $systemPrompt];
            }

            // Add conversation history
            foreach ($history as $item) {
                $messages[] = [
                    'role' => $item['role'],
                    'content' => $item['content'],
                ];
            }

            // Add current user message
            $messages[] = ['role' => 'user', 'content' => $message];

            $response = Http::timeout(60)
                ->withHeaders([
                    'Authorization' => "Bearer {$apiKey}",
                    'Content-Type' => 'application/json',
                    'HTTP-Referer' => config('app.url'),
                    'X-Title' => config('app.name'),
                ])
                ->post('https://openrouter.ai/api/v1/chat/completions', [
                    'model' => 'xiaomi/mimo-v2-flash:free',
                    'messages' => $messages,
                    'reasoning' => ['enabled' => false],
                ]);

            if ($response->successful()) {
                $text = $response->json()['choices'][0]['message']['content'] ?? 'Maaf, tidak ada respons.';

                return [
                    'success' => true,
                    'message' => $text,
                    'provider' => 'openrouter',
                ];
            }

            // Handle rate limit exceeded (429)
            if ($response->status() === 429) {
                Log::warning('OpenRouter Rate Limit Exceeded', [
                    'status' => $response->status(),
                    'body' => $response->body(),
                ]);

                return [
                    'success' => false,
                    'message' => 'Maaf, layanan AI sedang sibuk. Silakan tunggu beberapa saat dan coba lagi.',
                    'error' => 'rate_limit_exceeded',
                ];
            }

            Log::error('OpenRouter API Error', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            return [
                'success' => false,
                'message' => 'Gagal mendapatkan respons dari AI.',
                'error' => $response->body(),
            ];
        } catch (\Exception $e) {
            Log::error('OpenRouter Exception', ['message' => $e->getMessage()]);

            return [
                'success' => false,
                'message' => 'Terjadi kesalahan pada layanan AI.',
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Test the API connection
     */
    public function testConnection(): array
    {
        $result = $this->chat('Halo! Jawab dengan singkat: siapa kamu?');

        if ($result['success']) {
            return [
                'success' => true,
                'message' => $result['message'],
                'provider' => $result['provider'] ?? $this->provider,
            ];
        }

        return $result;
    }

    /**
     * Retrieve a relevant answer from the training table.
     */
    private function getRelevantAnswer(string $question): ?string
    {
        // Simple case‑insensitive LIKE search; adjust as needed for more advanced matching.
        $record = ChatTraining::where('question', 'like', "%{$question}%")
            ->first();
        return $record ? $record->answer : null;
    }

    /**
     * Determine if a question is out of scope for PMB.
     * This basic implementation checks for keywords that are clearly unrelated.
     */
    private function isOutOfScope(string $question): bool
    {
        $outOfScopeKeywords = ['weather', 'sports', 'music', 'movie', 'game'];
        foreach ($outOfScopeKeywords as $keyword) {
            if (stripos($question, $keyword) !== false) {
                return true;
            }
        }
        return false;
    }
    /**
     * Get all training data records.
     */
    public function getAllTrainingData(): \Illuminate\Database\Eloquent\Collection
    {
        return \App\Models\ChatTraining::all();
    }

    /**
     * Generate system prompt context from generated file.
     */
    public function getSystemPromptContext(): string
    {
        if (!\Illuminate\Support\Facades\Storage::exists('chat_context.txt')) {
            \Illuminate\Support\Facades\Artisan::call('chat:generate-context');
        }

        return \Illuminate\Support\Facades\Storage::get('chat_context.txt');
    }
}
