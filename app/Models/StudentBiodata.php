<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Facades\Storage;

class StudentBiodata extends Model
{
    protected $fillable = [
        'user_id',
        'name',
        'nik',
        'nisn',
        'last_education',
        'school_origin',
        'major',
        'phone',
        'gender',
        'birth_place',
        'birth_date',
        'religion',
        'address',
        'photo_path',
        'kk_path',
        'ktp_path',
        'certificate_path',
        // Re-registration fields (Neo Feeder compatible)
        'mother_name',
        'npwp',
        'telephone',
        'email',
        'dusun',
        'rt',
        'rw',
        'kelurahan',
        'kode_pos',
        'kecamatan',
        'kabupaten',
        'provinsi',
        'kps_recipient',
        'kps_number',
        'residence_type',
        'transportation',
        'reregistration_status',
    ];

    protected $appends = ['photo_url', 'kk_url', 'ktp_url', 'certificate_url'];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'birth_date' => 'date',
            'kps_recipient' => 'boolean',
        ];
    }

    // ==================== RELATIONSHIPS ====================

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function parents(): HasMany
    {
        return $this->hasMany(StudentParent::class);
    }

    public function father(): HasOne
    {
        return $this->hasOne(StudentParent::class)->where('type', 'ayah');
    }

    public function mother(): HasOne
    {
        return $this->hasOne(StudentParent::class)->where('type', 'ibu');
    }

    public function guardian(): HasOne
    {
        return $this->hasOne(StudentParent::class)->where('type', 'wali');
    }

    public function specialNeeds(): HasMany
    {
        return $this->hasMany(StudentSpecialNeed::class);
    }

    public function verifications(): HasMany
    {
        return $this->hasMany(DocumentVerification::class);
    }

    // ==================== ACCESSORS ====================

    public function getPhotoUrlAttribute(): string
    {
        return $this->photo_path
            ? Storage::url($this->photo_path)
            : 'https://placehold.co/200x200?text=No+Photo';
    }

    public function getKkUrlAttribute(): ?string
    {
        return $this->kk_path
            ? Storage::url($this->kk_path)
            : null;
    }

    public function getKtpUrlAttribute(): ?string
    {
        return $this->ktp_path
            ? Storage::url($this->ktp_path)
            : null;
    }

    public function getCertificateUrlAttribute(): ?string
    {
        return $this->certificate_path
            ? Storage::url($this->certificate_path)
            : null;
    }

    public function getPendingVerificationsAttribute(): int
    {
        return $this->verifications()
            ->where('status', 'rejected')
            ->where('is_read', false)
            ->count();
    }

    // ==================== ENUM OPTIONS ====================

    public static function residenceTypeOptions(): array
    {
        return [
            'bersama_orang_tua' => 'Bersama Orang Tua',
            'wali' => 'Bersama Wali',
            'kost' => 'Kost',
            'asrama' => 'Asrama',
            'panti_asuhan' => 'Panti Asuhan',
            'lainnya' => 'Lainnya',
        ];
    }

    public static function transportationOptions(): array
    {
        return [
            'jalan_kaki' => 'Jalan Kaki',
            'sepeda' => 'Sepeda',
            'sepeda_motor' => 'Sepeda Motor',
            'mobil_pribadi' => 'Mobil Pribadi',
            'angkutan_umum' => 'Angkutan Umum',
            'ojek' => 'Ojek',
            'andong' => 'Andong/Bendi/Dokar',
            'perahu' => 'Perahu/Sampan',
            'lainnya' => 'Lainnya',
        ];
    }

    public static function religionOptions(): array
    {
        return [
            'Islam' => 'Islam',
            'Kristen' => 'Kristen Protestan',
            'Katolik' => 'Katolik',
            'Hindu' => 'Hindu',
            'Buddha' => 'Buddha',
            'Konghucu' => 'Konghucu',
        ];
    }

    // ==================== METHODS ====================

    /**
     * Create or update verification record for a document type
     */
    public function updateVerificationStatus(string $type, string $status = 'pending'): void
    {
        $this->verifications()->updateOrCreate(
            ['document_type' => $type],
            ['status' => $status, 'verified_at' => null, 'verified_by' => null, 'notes' => null]
        );
    }

    /**
     * Check if re-registration data is complete
     */
    public function isReregistrationComplete(): bool
    {
        $requiredFields = [
            'name',
            'nik',
            'nisn',
            'gender',
            'birth_place',
            'birth_date',
            'religion',
            'address',
            'phone',
            'mother_name',
        ];

        foreach ($requiredFields as $field) {
            if (empty($this->$field)) {
                return false;
            }
        }

        // Check if parents data exists
        return $this->parents()->whereIn('type', ['ayah', 'ibu'])->count() >= 1;
    }
}
