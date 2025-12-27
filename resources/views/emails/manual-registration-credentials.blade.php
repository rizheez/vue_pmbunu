<x-mail::message>
# Selamat Datang di PMB UNU Kaltim!

Halo **{{ $user->name }}**,

Akun pendaftaran Anda telah berhasil dibuat oleh panitia PMB. Berikut adalah informasi akun Anda:

<x-mail::panel>
**Nomor Pendaftaran:** {{ $registrationNumber }}

**Email:** {{ $user->email }}

**Password:** {{ $password }}
</x-mail::panel>

<x-mail::button :url="$loginUrl">
Login Sekarang
</x-mail::button>

**Penting:**
- Segera login dan ubah password Anda untuk keamanan akun.
- Lengkapi biodata dan dokumen yang diperlukan.
- Pantau status pendaftaran Anda secara berkala.

Jika Anda mengalami kendala, silakan hubungi panitia PMB.

Salam,<br>
Panitia PMB UNU Kaltim
</x-mail::message>
