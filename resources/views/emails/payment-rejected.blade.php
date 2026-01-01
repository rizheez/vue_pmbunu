<x-mail::message>
# Pembayaran Ditolak ❌

Halo, {{ $student->name }},

Mohon maaf, bukti pembayaran daftar ulang Anda **tidak dapat diverifikasi**.

<x-mail::panel>
**Jumlah yang Diupload:** Rp {{ number_format($payment->amount, 0, ',', '.') }}

@if($reason)
**Alasan Penolakan:** {{ $reason }}
@else
**Alasan:** Bukti pembayaran tidak valid atau tidak jelas.
@endif
</x-mail::panel>

## Yang Perlu Anda Lakukan

1. Login ke portal PMB
2. Buka halaman **Pembayaran Daftar Ulang**
3. Upload ulang bukti pembayaran yang jelas dan valid

<x-mail::button :url="config('app.url') . '/student/reregistration/payment'">
Upload Ulang Bukti Pembayaran
</x-mail::button>

Jika Anda memiliki pertanyaan, silakan hubungi panitia PMB.

Salam,<br>
**Panitia PMB UNU Kaltim**<br>
{{ config('app.name') }}
</x-mail::message>
