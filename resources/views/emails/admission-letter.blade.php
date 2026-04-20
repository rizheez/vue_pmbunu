<x-mail::message>
# Surat Penerimaan Mahasiswa Baru

Yth. {{ $biodata?->name ?? $student->name }},

Selamat, surat penerimaan Anda sebagai mahasiswa baru Universitas Nahdlatul Ulama Kalimantan Timur telah diterbitkan.

<x-mail::panel>
**Nomor Surat:** {{ $letter->letter_number }}

**Tanggal Surat:** {{ $letter->letter_date->locale('id')->translatedFormat('d F Y') }}

**NIM:** {{ $student->nim }}

**Program Studi:** {{ $registration?->acceptedProgramStudi?->jenjang }} {{ $registration?->acceptedProgramStudi?->name ?? '-' }}
</x-mail::panel>

Silakan unduh dan simpan surat penerimaan yang terlampir pada email ini. Surat juga dapat diakses melalui portal PMB.

<x-mail::button :url="config('app.url') . '/student/admission-letter'">
Download Surat Penerimaan
</x-mail::button>

Salam,<br>
**Panitia PMB UNU Kaltim**<br>
{{ config('app.name') }}
</x-mail::message>
