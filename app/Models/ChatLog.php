<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ChatLog extends Model
{
    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
        'user_id',
        'user_input',
        'ai_response',
        'provider',
        'session_id',
        'ip_address',
        'response_time_ms',
        'is_successful',
        'error_message',
    ];

    /**
     * Get the attributes that should be cast.
     */
    protected function casts(): array
    {
        return [
            'is_successful' => 'boolean',
        ];
    }

    /**
     * Get the user that owns the chat log.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
