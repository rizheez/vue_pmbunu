<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Storage;

class AdmissionLetter extends Model
{
    protected $fillable = [
        'user_id',
        'letter_number',
        'letter_date',
        'subject',
        'signatory_name',
        'verification_token',
        'pdf_path',
        'generated_at',
        'sent_at',
        'created_by',
    ];

    protected $appends = [
        'download_url',
        'pdf_url',
    ];

    protected function casts(): array
    {
        return [
            'letter_date' => 'date',
            'generated_at' => 'datetime',
            'sent_at' => 'datetime',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function getPdfUrlAttribute(): ?string
    {
        return $this->pdf_path ? Storage::disk('public')->url($this->pdf_path) : null;
    }

    public function getDownloadUrlAttribute(): ?string
    {
        return $this->pdf_path ? route('admin.admission-letters.pdf', $this) : null;
    }
}
