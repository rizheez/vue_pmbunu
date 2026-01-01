<x-mail::message>
# Pembayaran Terverifikasi ✅

Halo, {{ $student->name }}!

Pembayaran daftar ulang Anda **telah berhasil diverifikasi**.

<x-mail::panel>
**Jumlah Pembayaran:** Rp {{ number_format($payment->amount, 0, ',', '.') }}

**Diverifikasi pada:** {{ $payment->verified_at?->locale('id')->translatedFormat('d F Y') ?? '-' }}
</x-mail::panel>

Proses daftar ulang Anda hampir selesai. Admin akan segera memproses data Anda untuk mendapatkan NIM resmi.

<x-mail::button :url="config('app.url') . '/student/dashboard'">
Lihat Status Pendaftaran
</x-mail::button>

Terima kasih telah melengkapi proses daftar ulang.

Salam,<br>
**Panitia PMB UNU Kaltim**<br>
{{ config('app.name') }}
</x-mail::message>
