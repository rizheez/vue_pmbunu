<?php

declare(strict_types=1);

namespace App\Exports;

use App\Models\User;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class StudentsExport implements FromQuery, ShouldAutoSize, WithColumnFormatting, WithHeadings, WithMapping, WithStyles
{
    protected Request $request;

    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    public function query()
    {
        $query = User::query()
            ->with([
                'studentBiodata.father',
                'studentBiodata.mother',
                'registration.registrationPeriod',
                'registration.programStudiChoice1.fakultas',
                'registration.programStudiChoice2.fakultas',
                'registration.acceptedProgramStudi',
                'registration.registrationType',
                'registration.registrationPath',
                'registration.scholarship',
            ])
            ->where('role', 'student')
            ->whereHas('registration');

        // Filter by status
        if ($this->request->filled('status') && $this->request->status !== 'all') {
            $query->whereHas('registration', fn ($q) => $q->where('status', $this->request->status));
        }

        // Filter by period
        if ($this->request->filled('period') && $this->request->period !== 'all') {
            $query->whereHas('registration', fn ($q) => $q->where('registration_period_id', $this->request->period));
        }

        // Filter by registration type
        if ($this->request->filled('type') && $this->request->type !== 'all') {
            $query->whereHas('registration', fn ($q) => $q->where('registration_type_id', $this->request->type));
        }

        // Search
        if ($this->request->filled('search')) {
            $search = $this->request->search;
            $query->where(function ($q) use ($search) {
                $q->where('users.name', 'like', "%{$search}%")
                    ->orWhere('users.email', 'like', "%{$search}%")
                    ->orWhereHas('studentBiodata', fn ($bq) => $bq->where('name', 'like', "%{$search}%"))
                    ->orWhereHas('registration', fn ($rq) => $rq->where('registration_number', 'like', "%{$search}%"));
            });
        }

        return $query
            ->join('registrations', 'users.id', '=', 'registrations.user_id')
            ->orderByDesc('registrations.created_at')
            ->select('users.*');
    }

    public function headings(): array
    {
        return [
            'No. Pendaftaran',
            'NIM',
            'Nama Lengkap',
            'Email',
            'No. HP',
            'Telepon',
            'NIK',
            'NISN',
            'NPWP',
            'Jenis Kelamin',
            'Tempat Lahir',
            'Tanggal Lahir',
            'Agama',
            'Alamat',
            'Dusun',
            'RT',
            'RW',
            'Kelurahan',
            'Kecamatan',
            'Kabupaten / Kota',
            'Provinsi',
            'Kode Pos',
            'Nama Ibu Kandung',
            'NIK Ibu',
            'Nama Ayah',
            'NIK Ayah',
            'Asal Sekolah',
            'Jurusan',
            'Periode',
            'Jenis Pendaftaran',
            'Jalur Pendaftaran',
            'Pilihan Beasiswa',
            'Pilihan 1',
            'Kode Prodi Pilihan 1',
            'Kode Fakultas Pilihan 1',
            'Pilihan 2',
            'Prodi Diterima',
            'Status',
            'Sumber Informasi',
            'Detail Referral',
            'Tanggal Daftar',
        ];
    }

    /**
     * @param  User  $user
     */
    public function map($user): array
    {
        $biodata = $user->studentBiodata;
        $registration = $user->registration;
        $father = $biodata?->father;
        $mother = $biodata?->mother;
        $choice1 = $registration?->programStudiChoice1;
        $choice2 = $registration?->programStudiChoice2;

        $birthDate = '-';
        if ($biodata?->birth_date) {
            $birthDate = $biodata->birth_date instanceof \DateTimeInterface
                ? $biodata->birth_date->format('d/m/Y')
                : (string) $biodata->birth_date;
        }

        return [
            "'".($registration?->registration_number ?? '-'),
            ($user->nim ?? '-'),
            $biodata?->name ?? $user->name,
            $user->email,
            "'".(string) ($biodata?->phone ?? $user->phone ?? '-'),
            "'".(string) ($biodata?->telephone ?? '-'),
            "'".(string) ($biodata?->nik ?? '-'),
            "'".(string) ($biodata?->nisn ?? '-'),
            "'".(string) ($biodata?->npwp ?? '-'),
            $biodata?->gender ?? '-',
            $biodata?->birth_place ?? '-',
            $birthDate,
            $biodata?->religion ?? '-',
            $biodata?->address ?? '-',
            $biodata?->dusun ?? '-',
            $biodata?->rt ?? '-',
            $biodata?->rw ?? '-',
            $biodata?->kelurahan ?? '-',
            $biodata?->kecamatan ?? '-',
            $biodata?->kabupaten ?? '-',
            $biodata?->provinsi ?? '-',
            $biodata?->kode_pos ?? '-',
            $biodata?->mother_name ?? $mother?->name ?? '-',
            "'".(string) ($mother?->nik ?? '-'),
            $father?->name ?? '-',
            "'".(string) ($father?->nik ?? '-'),
            $biodata?->school_origin ?? '-',
            $biodata?->major ?? '-',
            $registration?->registrationPeriod?->name ?? '-',
            $registration?->registrationType?->name ?? '-',
            $registration?->registrationPath?->name ?? '-',
            $registration?->scholarship?->name ?? '-',
            $choice1 ? ($choice1->jenjang.' - '.$choice1->name) : '-',
            $choice1?->code ?? '-',
            $choice1?->fakultas?->code ?? '-',
            $choice2 ? ($choice2->jenjang.' - '.$choice2->name) : '-',
            $registration?->acceptedProgramStudi ? ($registration->acceptedProgramStudi->jenjang.' - '.$registration->acceptedProgramStudi->name) : '-',
            $this->getStatusLabel($registration?->status),
            $registration?->referral_source ?? '-',
            $registration?->referral_detail ?? '-',
            $registration?->created_at?->format('d/m/Y H:i') ?? '-',
        ];
    }

    protected function getStatusLabel(?string $status): string
    {
        return match ($status) {
            'draft' => 'Draft',
            'submitted' => 'Terdaftar (Menunggu hasil verifikasi)',
            'verified' => 'Terverifikasi',
            'accepted' => 'Diterima',
            'rejected' => 'Ditolak',
            're_registration_pending' => 'Daftar Ulang Pending',
            're_registration_verified' => 'Daftar Ulang Terverifikasi',
            'enrolled' => 'Diterima dan NIM terbit',
            'cancelled' => 'Mahasiswa Dibatalkan',
            default => $status ? ucfirst(str_replace('_', ' ', $status)) : '-',
        };
    }

    public function columnFormats(): array
    {
        return [
            // 'A' => NumberFormat::FORMAT_TEXT, // No. Pendaftaran
            // 'D' => NumberFormat::FORMAT_TEXT, // No. HP
            // 'E' => NumberFormat::FORMAT_TEXT, // NIK
            // 'F' => NumberFormat::FORMAT_TEXT, // NISN
        ];
    }

    public function styles(Worksheet $sheet): array
    {
        return [
            1 => [
                'font' => ['bold' => true, 'color' => ['argb' => 'FFFFFFFF']],
                'fill' => [
                    'fillType' => Fill::FILL_SOLID,
                    'startColor' => ['argb' => 'FF0D9488'],
                ],
            ],
        ];
    }
}
