<?php

namespace App\Services;

use App\Models\ChatTraining;
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
        $enhancedSystemPrompt = $systemPrompt ? ($systemPrompt."\n\n".$context) : $context;

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
     * Uses keyword matching to find the best answer.
     */
    private function getRelevantAnswer(string $question): ?string
    {
        $question = strtolower(trim($question));

        // Extract keywords from question (remove common words)
        $stopWords = ['apa', 'apakah', 'bagaimana', 'dimana', 'kapan', 'siapa', 'berapa', 'yang', 'di', 'ke', 'dari', 'untuk', 'dengan', 'adalah', 'ini', 'itu', 'dan', 'atau', 'saya', 'mau', 'ingin', 'bisa', 'ada', 'tidak', 'ya', 'juga', 'nya'];
        $words = preg_split('/\s+/', $question);
        $keywords = array_filter($words, fn ($w) => strlen($w) > 2 && ! in_array($w, $stopWords));

        if (empty($keywords)) {
            return null;
        }

        // Try exact match first
        $record = ChatTraining::whereRaw('LOWER(question) LIKE ?', ["%{$question}%"])->first();
        if ($record) {
            return $record->answer;
        }

        // Try keyword matching - find record with most keyword matches
        $bestMatch = null;
        $bestScore = 0;

        $allTraining = ChatTraining::all();
        foreach ($allTraining as $training) {
            $trainingQuestion = strtolower($training->question);
            $score = 0;

            foreach ($keywords as $keyword) {
                if (str_contains($trainingQuestion, $keyword)) {
                    $score++;
                }
            }

            // Need at least 2 keyword matches or 50% of keywords
            $threshold = max(2, count($keywords) * 0.5);
            if ($score >= $threshold && $score > $bestScore) {
                $bestScore = $score;
                $bestMatch = $training;
            }
        }

        return $bestMatch?->answer;
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
     * Generate system prompt context from generated file with caching.
     */
    public function getSystemPromptContext(): string
    {
        // Cache context for 24 hours to reduce file reads
        $cacheKey = 'chat_context_'.app()->environment();

        return \Illuminate\Support\Facades\Cache::remember($cacheKey, 3600 * 24, function () {
            if (! \Illuminate\Support\Facades\Storage::disk('local')->exists('chat_context.txt')) {
                // Use cache lock to prevent race conditions when multiple requests
                // attempt to generate the context simultaneously
                \Illuminate\Support\Facades\Cache::lock('chat_context_generation', 10)->block(5, function () {
                    // Double-check after acquiring lock in case another request already generated it
                    if (! \Illuminate\Support\Facades\Storage::disk('local')->exists('chat_context.txt')) {
                        \Illuminate\Support\Facades\Artisan::call('chat:generate-context');
                    }
                });
            }

            // Final safety check - throw if file still doesn't exist
            if (! \Illuminate\Support\Facades\Storage::disk('local')->exists('chat_context.txt')) {
                throw new \RuntimeException('Chat context file could not be generated.');
            }

            return \Illuminate\Support\Facades\Storage::disk('local')->get('chat_context.txt');
        });
    }
}
