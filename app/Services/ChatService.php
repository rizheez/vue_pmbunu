<?php

namespace App\Services;

use App\Models\ChatTraining;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

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
        // Handle greetings directly without calling API
        $greetingResponse = $this->handleGreeting($message);
        if ($greetingResponse !== null) {
            return [
                'success' => true,
                'message' => $greetingResponse,
                'provider' => 'greeting',
            ];
        }

        // Try to find a relevant answer from the training data
        $dbAnswer = $this->getRelevantAnswer($message);
        if ($dbAnswer !== null) {
            return [
                'success' => true,
                'message' => $dbAnswer,
                'provider' => 'database',
            ];
        }

        // Reject clearly out‑of‑scope queries (non-PMB topics)
        if ($this->isOutOfScope($message)) {
            return [
                'success' => true,
                'message' => 'Maaf, saya hanya dapat membantu seputar informasi PMB UNU Kaltim. Ada yang ingin ditanyakan tentang pendaftaran mahasiswa baru? 😊',
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

            $primaryModel = config('services.openrouter.model', 'openrouter/free');
            $fallbackModels = config('services.openrouter.fallback_models', ['openrouter/free']);
            $models = collect([$primaryModel, ...$fallbackModels])
                ->filter()
                ->unique()
                ->values();
            $lastResponse = null;

            foreach ($models as $index => $model) {
                $response = Http::timeout(60)
                    ->withHeaders([
                        'Authorization' => "Bearer {$apiKey}",
                        'Content-Type' => 'application/json',
                        'HTTP-Referer' => config('app.url'),
                        'X-Title' => config('app.name'),
                    ])
                    ->post('https://openrouter.ai/api/v1/chat/completions', [
                        'model' => $model,
                        'messages' => $messages,
                        'reasoning' => ['enabled' => $index > 0],
                    ]);

                if ($response->successful()) {
                    $text = $response->json()['choices'][0]['message']['content'] ?? 'Maaf, tidak ada respons.';

                    return [
                        'success' => true,
                        'message' => $text,
                        'model' => $model,
                        'provider' => 'openrouter',
                    ];
                }

                $lastResponse = $response;

                Log::warning('OpenRouter model failed, trying fallback if available', [
                    'model' => $model,
                    'status' => $response->status(),
                    'body' => $response->body(),
                ]);
            }

            // Handle rate limit exceeded (429)
            if ($lastResponse?->status() === 429) {
                Log::warning('OpenRouter Rate Limit Exceeded', [
                    'status' => $lastResponse->status(),
                    'body' => $lastResponse->body(),
                ]);

                return [
                    'success' => false,
                    'message' => 'Maaf, layanan AI sedang sibuk. Silakan tunggu beberapa saat dan coba lagi.',
                    'error' => 'rate_limit_exceeded',
                ];
            }

            Log::error('OpenRouter API Error', [
                'status' => $lastResponse?->status(),
                'body' => $lastResponse?->body(),
            ]);

            return [
                'success' => false,
                'message' => 'Gagal mendapatkan respons dari AI.',
                'error' => $lastResponse?->body(),
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
     * Handle greeting messages directly without calling the AI API.
     * Returns a greeting response or null if the message is not a greeting.
     */
    private function handleGreeting(string $message): ?string
    {
        $message = strtolower(trim($message));

        // Remove common punctuation for matching
        $cleaned = preg_replace('/[^a-z\s]/', '', $message);
        $cleaned = trim((string) preg_replace('/\s+/', ' ', $cleaned));

        $greetings = [
            'halo', 'hai', 'hi', 'hey', 'hello',
            'halo kak', 'hai kak', 'hi kak',
            'selamat pagi', 'selamat siang', 'selamat sore', 'selamat malam',
            'pagi', 'siang', 'sore', 'malam',
            'pagi kak', 'siang kak', 'sore kak', 'malam kak',
            'assalamualaikum', 'assalamu alaikum', 'assalamualaikum wr wb',
            'permisi', 'permisi kak',
            'hallo', 'hallo kak',
            'kak', 'min',
            'p', 'ping',
        ];

        if (in_array($cleaned, $greetings)) {
            return 'Halo! 👋 Saya asisten virtual PMB UNU Kaltim. Ada yang bisa saya bantu tentang pendaftaran mahasiswa baru?';
        }

        return null;
    }

    /**
     * Determine if a question is out of scope for PMB.
     * Uses a dual approach: checks for off-topic keywords AND verifies
     * absence of PMB-related keywords for ambiguous messages.
     */
    private function isOutOfScope(string $question): bool
    {
        $question = strtolower(trim($question));

        // Keywords that indicate PMB-related topics — if present, NOT out of scope
        $pmbKeywords = [
            'daftar', 'pendaftaran', 'pmb', 'mahasiswa', 'kuliah', 'kampus',
            'prodi', 'program studi', 'jurusan', 'fakultas',
            'biaya', 'ukt', 'spp', 'bayar', 'pembayaran',
            'beasiswa', 'kip', 'gratis',
            'jadwal', 'seleksi', 'gelombang', 'jalur',
            'syarat', 'persyaratan', 'dokumen', 'berkas', 'ijazah', 'ktp', 'kk',
            'daftar ulang', 'registrasi', 'herregistrasi',
            'unu', 'kaltim', 'unukaltim', 'nahdlatul',
            'akreditasi', 'visi', 'misi',
            'wisuda', 'lulus', 'kelulusan',
            'nim', 'ktm', 'almamater',
            'kontak', 'alamat', 'telepon', 'whatsapp', 'email',
            'farmasi', 'akuntansi', 'teknik', 'informatika', 'manajemen',
            'login', 'akun', 'password', 'verifikasi',
            'upload', 'foto', 'pas foto',
            'alur', 'langkah', 'prosedur', 'tahap',
            'deadline',
            'reguler', 'karyawan', 'pindahan', 'rpl',
        ];

        foreach ($pmbKeywords as $keyword) {
            if (str_contains($question, $keyword)) {
                return false;
            }
        }

        // Keywords that are clearly off-topic
        $offTopicKeywords = [
            'resep', 'masak', 'makanan', 'minuman',
            'bitcoin', 'crypto', 'saham', 'trading', 'forex', 'investasi',
            'cuaca', 'weather',
            'game', 'gaming', 'mobile legend', 'ff', 'pubg', 'valorant',
            'film', 'movie', 'drama', 'anime', 'manga',
            'musik', 'lagu', 'artis', 'idol', 'kpop',
            'sepak bola', 'bola', 'liga', 'piala',
            'politik', 'pilkada', 'pemilu', 'presiden', 'partai',
            'gossip', 'viral', 'tiktoker', 'youtuber', 'selebgram',
            'coding', 'programming', 'javascript', 'python',
            'ai', 'chatgpt', 'openai', 'gemini',
            'payment gateway', 'merchant', 'e-commerce', 'tokopedia', 'shopee',
            'ojek', 'grab', 'gojek',
            'hotel', 'wisata', 'liburan', 'tiket', 'pesawat',
        ];

        foreach ($offTopicKeywords as $keyword) {
            if (str_contains($question, $keyword)) {
                return true;
            }
        }

        return false;
    }

    /**
     * Get all training data records.
     */
    public function getAllTrainingData(): Collection
    {
        return ChatTraining::all();
    }

    /**
     * Generate system prompt context from generated file with caching.
     */
    public function getSystemPromptContext(): string
    {
        // Cache context for 24 hours to reduce file reads
        $cacheKey = 'chat_context_'.app()->environment();

        return Cache::remember($cacheKey, 3600 * 24, function () {
            if (! Storage::disk('local')->exists('chat_context.txt')) {
                // Use cache lock to prevent race conditions when multiple requests
                // attempt to generate the context simultaneously
                Cache::lock('chat_context_generation', 10)->block(5, function () {
                    // Double-check after acquiring lock in case another request already generated it
                    if (! Storage::disk('local')->exists('chat_context.txt')) {
                        Artisan::call('chat:generate-context');
                    }
                });
            }

            // Final safety check - throw if file still doesn't exist
            if (! Storage::disk('local')->exists('chat_context.txt')) {
                throw new \RuntimeException('Chat context file could not be generated.');
            }

            return Storage::disk('local')->get('chat_context.txt');
        });
    }
}
