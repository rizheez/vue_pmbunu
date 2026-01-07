<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ChatLog;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class ChatLogController extends Controller
{
    public function index(Request $request): Response
    {
        $query = ChatLog::with('user:id,name,email')
            ->orderByDesc('created_at');

        // Filter by provider
        if ($request->filled('provider') && $request->provider !== 'all') {
            $query->where('provider', $request->provider);
        }

        // Filter by status
        if ($request->filled('status') && $request->status !== 'all') {
            $query->where('is_successful', $request->status === 'success');
        }

        // Filter by date range
        if ($request->filled('date_from')) {
            $query->whereDate('created_at', '>=', $request->date_from);
        }
        if ($request->filled('date_to')) {
            $query->whereDate('created_at', '<=', $request->date_to);
        }

        // Search
        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('user_input', 'like', "%{$search}%")
                    ->orWhere('ai_response', 'like', "%{$search}%")
                    ->orWhereHas('user', fn ($uq) => $uq->where('name', 'like', "%{$search}%")
                        ->orWhere('email', 'like', "%{$search}%"));
            });
        }

        $perPage = min((int) $request->input('per_page', 15), 100);

        $logs = $query->paginate($perPage)->withQueryString();

        // Get statistics
        $stats = [
            'total' => ChatLog::count(),
            'today' => ChatLog::whereDate('created_at', today())->count(),
            'database_responses' => ChatLog::where('provider', 'database')->count(),
            'api_responses' => ChatLog::where('provider', 'openrouter')->count(),
            'failed' => ChatLog::where('is_successful', false)->count(),
            'avg_response_time' => (int) ChatLog::avg('response_time_ms'),
        ];

        return Inertia::render('admin/chat-logs/Index', [
            'logs' => $logs,
            'filters' => $request->only(['provider', 'status', 'date_from', 'date_to', 'search', 'per_page']),
            'stats' => $stats,
        ]);
    }

    public function destroy(ChatLog $chatLog): RedirectResponse
    {
        $chatLog->delete();

        return redirect()->back()->with('success', 'Log berhasil dihapus.');
    }

    public function destroyAll(): RedirectResponse
    {
        ChatLog::truncate();

        return redirect()->back()->with('success', 'Semua log berhasil dihapus.');
    }
}
