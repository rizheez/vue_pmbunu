<?php

namespace App\Exports;

use App\Models\User;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class StudentsExport implements FromQuery, WithHeadings, WithMapping, ShouldAutoSize, WithStyles, WithColumnFormatting
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
                'studentBiodata',
                'registration.registrationPeriod',
                'registration.programStudiChoice1.fakultas',
                'registration.programStudiChoice2.fakultas',
                'registration.registrationType',
                'registration.registrationPath',
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
            'Nama Lengkap',
            'Email',
            'No. HP',
            'NIK',
            'NISN',
            'Jenis Kelamin',
            'Tempat Lahir',
            'Tanggal Lahir',
            'Agama',
            'Alamat',
            'Asal Sekolah',
            'Jurusan',
            'Periode',
            'Jenis Pendaftaran',
            'Jalur Pendaftaran',
            'Pilihan 1',
            'Pilihan 2',
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

        return [
            "'".$registration?->registration_number ?? '-',
            $biodata?->name ?? $user->name,
            $user->email,
            "'".(string) ($biodata?->phone ?? $user->phone ?? '-'),
            "'".(string) ($biodata?->nik ?? '-'),
            "'".(string) ($biodata?->nisn ?? '-'),
            $biodata?->gender ?? '-',
            $biodata?->birth_place ?? '-',
            $biodata?->birth_date ?? '-',
            $biodata?->religion ?? '-',
            $biodata?->address ?? '-',
            $biodata?->school_origin ?? '-',
            $biodata?->major ?? '-',
            $registration?->registrationPeriod?->name ?? '-',
            $registration?->registrationType?->name ?? '-',
            $registration?->registrationPath?->name ?? '-',
            $registration?->programStudiChoice1 ? ($registration->programStudiChoice1->jenjang.' - '.$registration->programStudiChoice1->name) : '-',
            $registration?->programStudiChoice2 ? ($registration->programStudiChoice2->jenjang.' - '.$registration->programStudiChoice2->name) : '-',
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
            'submitted' => 'Terdaftar',
            'verified' => 'Terverifikasi',
            'accepted' => 'Diterima',
            'rejected' => 'Ditolak',
            default => '-',
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
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'startColor' => ['argb' => 'FF0D9488'],
                ],
            ],
        ];
    }
}

