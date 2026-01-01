<x-mail::message>
# Pendaftaran Diterima 📋

Halo, {{ $student->name }}!

Pendaftaran Anda di PMB UNU Kaltim **telah kami terima** dan sedang dalam proses verifikasi.

<x-mail::panel>
**Nomor Pendaftaran:** {{ $registration->registration_number }}

**Pilihan Program Studi 1:** {{ $registration->programStudiChoice1?->name ?? '-' }}

@if($registration->choice_2)
**Pilihan Program Studi 2:** {{ $registration->programStudiChoice2?->name ?? '-' }}
@endif

**Tanggal Pendaftaran:** {{ $registration->created_at->locale('id')->translatedFormat('d F Y') }}
</x-mail::panel>

## Langkah Selanjutnya

1. Tim kami akan memverifikasi data dan dokumen Anda
2. Anda akan mendapatkan notifikasi melalui email jika ada perkembangan
3. Pantau terus status pendaftaran Anda melalui portal PMB

<x-mail::button :url="config('app.url') . '/student/dashboard'">
Cek Status Pendaftaran
</x-mail::button>

Terima kasih telah mendaftar di UNU Kaltim!

Salam,<br>
**Panitia PMB UNU Kaltim**<br>
{{ config('app.name') }}
</x-mail::message>
