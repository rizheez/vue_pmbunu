<x-mail::message>
# Selamat, {{ $student->name }}! 🎓

Kami dengan bangga mengumumkan bahwa Anda **resmi menjadi mahasiswa** Universitas Nahdlatul Ulama Kalimantan Timur!

<x-mail::panel>
**Nomor Induk Mahasiswa (NIM):** {{ $nim }}

**Program Studi:** {{ $programStudiName }}

**Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim)**
</x-mail::panel>

## Informasi Penting

Simpan NIM Anda dengan baik, karena akan digunakan untuk:
- Login ke sistem akademik
- Keperluan administrasi kampus
- Identitas mahasiswa resmi

<x-mail::button :url="config('app.url') . '/login'">
Masuk ke Portal PMB
</x-mail::button>

Selamat bergabung di keluarga besar UNU Kaltim! 🎉

Salam,<br>
**Panitia PMB UNU Kaltim**<br>
{{ config('app.name') }}
</x-mail::message>
