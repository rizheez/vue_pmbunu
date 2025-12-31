<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class StudentSpecialNeed extends Model
{
    protected $fillable = [
        'student_biodata_id',
        'type',
        'description',
        'assistance_needed',
    ];

    // ==================== RELATIONSHIPS ====================

    public function studentBiodata(): BelongsTo
    {
        return $this->belongsTo(StudentBiodata::class);
    }

    // ==================== ENUM OPTIONS ====================

    public static function typeOptions(): array
    {
        return [
            'tidak_ada' => 'Tidak Ada',
            'tunanetra' => 'Tunanetra (Buta)',
            'tunarungu' => 'Tunarungu (Tuli)',
            'tunawicara' => 'Tunawicara (Bisu)',
            'tunadaksa' => 'Tunadaksa (Cacat Tubuh)',
            'tunagrahita' => 'Tunagrahita (Keterbelakangan Mental)',
            'tunalaras' => 'Tunalaras (Gangguan Emosi/Perilaku)',
            'autis' => 'Autis',
            'adhd' => 'ADHD',
            'kesulitan_belajar' => 'Kesulitan Belajar Spesifik',
            'down_syndrome' => 'Down Syndrome',
            'lainnya' => 'Lainnya',
        ];
    }

    // ==================== ACCESSORS ====================

    public function getTypeLabelAttribute(): string
    {
        return self::typeOptions()[$this->type] ?? $this->type;
    }

    public function hasSpecialNeed(): bool
    {
        return $this->type !== 'tidak_ada';
    }
}
