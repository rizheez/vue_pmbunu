<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ChatLog;
use App\Services\ChatService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
    /**
     * PMB Chatbot system prompt
     */
    private const SYSTEM_PROMPT = <<<'PROMPT'
Kamu adalah asisten virtual PMB (Penerimaan Mahasiswa Baru) Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim).

Tugasmu adalah membantu calon mahasiswa dengan informasi seputar:
- Proses pendaftaran mahasiswa baru
- Program studi yang tersedia
- Persyaratan pendaftaran
- Jadwal dan tahapan seleksi
- Biaya pendidikan
- Beasiswa yang tersedia
- Fasilitas kampus

Panduan menjawab:
1. Jawab dengan ramah dan profesional dalam Bahasa Indonesia
2. Berikan informasi yang akurat dan jelas
3. Jika tidak yakin dengan informasi, sarankan untuk menghubungi bagian admisi
4. Gunakan format yang mudah dibaca (bullet points jika perlu)
5. Jawab dengan singkat dan to the point
6. Percantik jawabanmu dengan markdown yang rapi.
7. PENTING: Gunakan baris kosong (double enter) sebelum memulai daftar (bullet points) agar format list terbaca dengan benar.
8. Jika ada link, gunakan format markdown [teks](url).
9. untuk beasiswa tidak ada informasi di portal PMB, jadi informasinya diambil dari kontak resmi admin UNU Kaltim.

Informasi Kontak PMB UNU Kaltim:
- Website: https://pmb.unukaltim.ac.id
PROMPT;

    public function __construct(
        private ChatService $chatService
    ) {}

    /**
     * Send a message to the chatbot
     */
    public function send(Request $request): JsonResponse
    {
        $request->validate([
            'message' => ['required', 'string', 'max:1000'],
            'history' => ['sometimes', 'array'],
            'history.*.role' => ['required_with:history', 'string', 'in:user,assistant'],
            'history.*.content' => ['required_with:history', 'string'],
        ]);

        $startTime = microtime(true);

        $result = $this->chatService->chat(
            message: $request->input('message'),
            history: $request->input('history', []),
            systemPrompt: self::SYSTEM_PROMPT,
        );

        $responseTimeMs = (int) ((microtime(true) - $startTime) * 1000);

        // Log the chat interaction
        $this->logChat(
            $request,
            $request->input('message'),
            $result['message'],
            $result['provider'] ?? 'openrouter',
            $result['success'],
            $responseTimeMs,
            $result['error'] ?? null
        );

        if ($result['success']) {
            return response()->json([
                'success' => true,
                'message' => $result['message'],
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => $result['message'],
        ], 500);
    }

    /**
     * Log chat interaction to database
     */
    private function logChat(
        Request $request,
        string $userInput,
        string $aiResponse,
        string $provider,
        bool $isSuccessful,
        int $responseTimeMs,
        ?string $errorMessage = null
    ): void {
        try {
            ChatLog::create([
                'user_id' => Auth::id(),
                'user_input' => $userInput,
                'ai_response' => $aiResponse,
                'provider' => $provider,
                'session_id' => $request->session()->getId(),
                'ip_address' => $request->ip(),
                'response_time_ms' => $responseTimeMs,
                'is_successful' => $isSuccessful,
                'error_message' => $errorMessage,
            ]);
        } catch (\Exception $e) {
            // Log error but don't break the chat response
            \Illuminate\Support\Facades\Log::error('Failed to log chat interaction', [
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Return all chatbot training data.
     */
    public function trainingData(): \Illuminate\Http\JsonResponse
    {
        $data = $this->chatService->getAllTrainingData();

        return response()->json([
            'success' => true,
            'data' => $data,
        ]);
    }
}
