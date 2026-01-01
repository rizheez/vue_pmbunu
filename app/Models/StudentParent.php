<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class StudentParent extends Model
{
    protected $fillable = [
        'student_biodata_id',
        'type',
        'name',
        'nik',
        'nik',
        'birth_date',
        'is_alive',
        'education',
        'occupation',
        'income',
        'phone',
        'address',
    ];

    protected $appends = [
        'type_label',
        'education_label',
        'income_label',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'is_alive' => 'boolean',
            'birth_date' => 'date',
        ];
    }

    // ==================== RELATIONSHIPS ====================

    public function studentBiodata(): BelongsTo
    {
        return $this->belongsTo(StudentBiodata::class);
    }

    // ==================== ENUM OPTIONS ====================

    public static function typeOptions(): array
    {
        return [
            'ayah' => 'Ayah',
            'ibu' => 'Ibu',
            'wali' => 'Wali',
        ];
    }

    public static function educationOptions(): array
    {
        return [
            'tidak_sekolah' => 'Tidak Sekolah',
            'sd' => 'SD / Sederajat',
            'smp' => 'SMP / Sederajat',
            'sma' => 'SMA / Sederajat',
            'd1' => 'D1',
            'd2' => 'D2',
            'd3' => 'D3',
            'd4_s1' => 'D4 / S1',
            's2' => 'S2',
            's3' => 'S3',
        ];
    }

    public static function incomeOptions(): array
    {
        return [
            'tidak_berpenghasilan' => 'Tidak Berpenghasilan',
            'kurang_500rb' => 'Kurang dari Rp 500.000',
            '500rb_1jt' => 'Rp 500.000 - Rp 1.000.000',
            '1jt_2jt' => 'Rp 1.000.000 - Rp 2.000.000',
            '2jt_3jt' => 'Rp 2.000.000 - Rp 3.000.000',
            '3jt_5jt' => 'Rp 3.000.000 - Rp 5.000.000',
            'lebih_5jt' => 'Lebih dari Rp 5.000.000',
        ];
    }

    // ==================== ACCESSORS ====================

    public function getTypeLabelAttribute(): string
    {
        return self::typeOptions()[$this->type] ?? $this->type;
    }

    public function getEducationLabelAttribute(): string
    {
        return self::educationOptions()[$this->education] ?? $this->education ?? '-';
    }

    public function getIncomeLabelAttribute(): string
    {
        return self::incomeOptions()[$this->income] ?? $this->income ?? '-';
    }
}
