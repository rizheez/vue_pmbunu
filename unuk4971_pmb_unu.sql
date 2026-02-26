-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 15, 2026 at 02:53 PM
-- Server version: 11.4.9-MariaDB-cll-lve
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unuk4971_pmb_unu`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `is_published`, `created_at`, `updated_at`) VALUES
(1, '⚠️Waspada Penipuan PMB UNU Kaltim', 'Kepada seluruh calon mahasiswa, pendaftaran Penerimaan Mahasiswa Baru (PMB) Universitas Nahdlatul Ulama Kalimantan Timur secara online hanya dilakukan melalui situs resmi PMB UNU Kaltim. Untuk informasi dan pelayanan PMB secara offline, silakan datang langsung ke Sekretariat Penerimaan Mahasiswa Baru Universitas Nahdlatul Ulama Kalimantan Timur sesuai dengan jam operasional kampus. Apabila terdapat pihak yang mengatasnamakan PMB UNU Kaltim di luar kanal resmi, diimbau untuk tidak menanggapi dan segera melakukan konfirmasi melalui kontak resmi universitas.', 1, '2025-12-13 01:17:36', '2025-12-14 22:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('pmb-unu-kaltim-cache-3216ef0adfaccff5de48684284a192e6', 'i:1;', 1768462898),
('pmb-unu-kaltim-cache-3216ef0adfaccff5de48684284a192e6:timer', 'i:1768462898;', 1768462898),
('pmb-unu-kaltim-cache-a278ee54b57731fbf3d750a2564c83be', 'i:1;', 1768462891),
('pmb-unu-kaltim-cache-a278ee54b57731fbf3d750a2564c83be:timer', 'i:1768462891;', 1768462891),
('pmb-unu-kaltim-cache-admin@unukaltim.ac.idre|180.243.109.204', 'i:1;', 1768462891),
('pmb-unu-kaltim-cache-admin@unukaltim.ac.idre|180.243.109.204:timer', 'i:1768462891;', 1768462891),
('pmb-unu-kaltim-cache-ed7a04e8d36786ac631fcaf54bae3142', 'i:1;', 1768462894),
('pmb-unu-kaltim-cache-ed7a04e8d36786ac631fcaf54bae3142:timer', 'i:1768462894;', 1768462894);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_logs`
--

CREATE TABLE `chat_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_input` text NOT NULL,
  `ai_response` text NOT NULL,
  `provider` varchar(50) NOT NULL DEFAULT 'openrouter',
  `session_id` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `response_time_ms` int(10) UNSIGNED DEFAULT NULL,
  `is_successful` tinyint(1) NOT NULL DEFAULT 1,
  `error_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_logs`
--

INSERT INTO `chat_logs` (`id`, `user_id`, `user_input`, `ai_response`, `provider`, `session_id`, `ip_address`, `response_time_ms`, `is_successful`, `error_message`, `created_at`, `updated_at`) VALUES
(1, 1, 'biaya pendaftaran', 'Tentu, saya bantu informasikan ya! 😊\n\nBerikut rincian biaya terkait pendaftaran di UNU Kaltim:\n\n**💰 BIAYA REGISTRASI AWAL / DAFTAR ULANG**\n- **Nominal:** Rp 300.000\n- **Dibayar saat:** Daftar ulang (setelah lolos verifikasi)\n- **Mencakup:** Pembuatan NIM, KTM (Kartu Tanda Mahasiswa), dan Jaket Almamater\n\n**📚 BIAYA UKT (Uang Kuliah Tunggal) PER SEMESTER**\n- **Reguler Non-Farmasi:** Rp 5.000.000\n- **Reguler Farmasi:** Rp 7.000.000\n- **Kelas Karyawan:** Cek simulasi cicilan di [edunitas.com](https://edunitas.com/kampus/unu-kaltim)\n\n**🔄 BIAYA RPL (Alih Jenjang/Pindahan)**\n- **Biaya Konversi:** Rp 120.000 per SKS\n\n**📌 PENTING:**\n- Pembayaran biaya registrasi awal dilakukan **SAAT DAFTAR ULANG**, bukan saat mengisi formulir awal.\n- Panitia **TIDAK PERNAH** meminta transfer uang ke rekening pribadi.\n\nKalau ada pertanyaan lain atau butuh info lebih detail, jangan ragu untuk bertanya ya! 🙏', 'openrouter', 'YYEtjcaeRTBKJBtwhpkwcEv08uAj4DhjDLEw9hK6', '36.83.56.18', 5419, 1, NULL, '2026-01-06 23:41:38', '2026-01-06 23:41:38'),
(2, 1, 'biaya pendidikan', 'Tentu, saya informasikan mengenai biaya pendidikan di UNU Kaltim:\n\n**BIAYA REGISTRASI AWAL / DAFTAR ULANG**  \n*Dibayar saat melakukan daftar ulang*\n\n- Nominal: **Rp 300.000**\n- Mencakup: Pembuatan NIM, KTM (Kartu Tanda Mahasiswa), dan Jaket Almamater.\n\n**BIAYA UKT (Uang Kuliah Tunggal) PER SEMESTER**\n\n- Reguler Non-Farmasi: **Rp 5.000.000**\n- Reguler Farmasi: **Rp 7.000.000**\n- Kelas Karyawan: Kunjungi [https://edunitas.com/kampus/unu-kaltim](https://edunitas.com/kampus/unu-kaltim) untuk simulasi cicilan.\n\n**BIAYA RPL (Rekognisi Pembelajaran Lampau) / ALIH JENJANG / PINDAHAN**\n\n- Biaya Konversi: **Rp 120.000 per SKS**\n\nUntuk info lebih lanjut atau pertanyaan spesifik, silakan hubungi kontak resmi PMB UNU Kaltim melalui:\n- Telepon/WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id', 'openrouter', 'YYEtjcaeRTBKJBtwhpkwcEv08uAj4DhjDLEw9hK6', '36.83.56.18', 4079, 1, NULL, '2026-01-06 23:45:59', '2026-01-06 23:45:59'),
(3, 1, 'halo', 'Halo! Selamat datang di PMB Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim)!\n\nSaya siap membantu Anda dengan informasi seputar:\n- Proses pendaftaran mahasiswa baru\n- Program studi yang tersedia\n- Persyaratan pendaftaran\n- Jadwal dan tahapan seleksi\n- Biaya pendidikan & beasiswa\n- Fasilitas kampus\n\nAda pertanyaan spesifik yang ingin Anda tanyakan? Atau mungkin Anda ingin tahu cara memulai pendaftaran? 😊', 'openrouter', 'YYEtjcaeRTBKJBtwhpkwcEv08uAj4DhjDLEw9hK6', '36.83.56.18', 2783, 1, NULL, '2026-01-06 23:48:15', '2026-01-06 23:48:15'),
(4, 1, 'biaya pendidikan', 'Berikut informasi biaya pendidikan di UNU Kaltim:\n\n**BIAYA REGISTRASI AWAL / DAFTAR ULANG**\n- **Nominal:** Rp 300.000\n- **Dibayar saat:** Daftar ulang (bukan saat pengisian formulir awal)\n- **Mencakup:** Pembuatan NIM, KTM (Kartu Tanda Mahasiswa), dan Jaket Almamater\n\n---\n\n**BIAYA UKT (Uang Kuliah Tunggal) PER SEMESTER**\n- **Reguler Non-Farmasi:** Rp 5.000.000\n- **Reguler Farmasi:** Rp 7.000.000\n- **Kelas Karyawan:** Silakan hubungi panitia PMB untuk informasi lebih lanjut\n\n---\n\n**BIAYA RPL (Rekognisi Pembelajaran Lampau) / ALIH JENJANG / PINDAHAN**\n- **Biaya Konversi:** Rp 120.000 per SKS\n\n---\n\nAda lagi yang ingin Anda tanyakan tentang biaya atau topik lainnya? 😊', 'openrouter', 'YYEtjcaeRTBKJBtwhpkwcEv08uAj4DhjDLEw9hK6', '36.83.56.18', 6011, 1, NULL, '2026-01-06 23:48:59', '2026-01-06 23:48:59'),
(5, 1, 'nomor panitia pmb', 'Berikut nomor kontak resmi panitia PMB UNU Kaltim:\n\n**📞 Telepon/WA:**\n**0812-5317-738**\n\n---\n\n**📧 Email:**\n**pmb@unukaltim.ac.id**\n\n---\n\n**📍 Alamat Kampus:**\nJl. APT. Pranoto, Kel. Gunung Panjang, Kec. Samarinda Seberang\n\n---\n\n**🌐 Website:**\nhttps://pmb.unukaltim.ac.id\n\n---\n\n**PENTING:** Pastikan Anda hanya menghubungi kontak resmi di atas untuk menghindari penipuan. Panitia tidak pernah meminta transfer uang ke rekening pribadi.', 'openrouter', 'YYEtjcaeRTBKJBtwhpkwcEv08uAj4DhjDLEw9hK6', '36.83.56.18', 4341, 1, NULL, '2026-01-06 23:49:30', '2026-01-06 23:49:30'),
(6, 52, 'Kapan biasa nya di verifikasi nya', 'Maaf, maksud Anda adalah kapan proses verifikasi dokumen pendaftaran biasanya dilakukan setelah saya mengunggah dokumen, ya?\n\nBerdasarkan informasi yang ada, proses verifikasi dokumen dilakukan oleh Tim PMB setelah Anda menyelesaikan langkah-langkah pendaftaran (registrasi akun, lengkapi biodata, upload dokumen, dan pilih program studi).\n\nSetelah dokumen terunggah, Tim PMB akan melakukan verifikasi. Jika dinyatakan lolos verifikasi, Anda akan dihubungi untuk proses **daftar ulang**.\n\nUntuk informasi lebih detail mengenai waktu pasti proses verifikasi, disarankan untuk menghubungi panitia resmi PMB UNU Kaltim melalui:\n- **Telepon/WA:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\nAnda juga bisa mengecek status pendaftaran melalui akun Anda di website PMB.', 'openrouter', 'UFg18YPckdgTtLytqnIS1y9Xv4LMad4Mmp7rcWp9', '2a04:4e41:5eec:6ac::a5ec:6ac', 6293, 1, NULL, '2026-01-07 02:47:04', '2026-01-07 02:47:04'),
(7, 64, 'selamat sore, saya mau bertanya tentang gratis pol, apakah yang daftar pada gelombang satu sudah lewat jalur reguler/umum pasti dapat gratis pol?', 'Selamat sore! Terima kasih atas pertanyaannya.\n\nMengenai program **Gratiskan Pendidikan (Gratiskan Pol) Kalimantan Timur**, perlu saya informasikan bahwa:\n\n**Pendaftaran dan penerimaan beasiswa Gratiskan Pol tidak otomatis didapatkan** oleh calon mahasiswa yang mendaftar melalui jalur reguler/umum pada gelombang 1.\n\nProgram Gratiskan Pol merupakan **beasiswa khusus** yang memiliki mekanisme dan persyaratan seleksi tersendiri. Meskipun Anda sudah dinyatakan lolos melalui jalur reguler/umum, Anda tetap harus **mengajukan permohonan beasiswa** dan mengikuti proses seleksi yang ditetapkan oleh pihak Gratiskan Pol.\n\nUntuk informasi lebih detail mengenai:\n- Persyaratan pengajuan beasiswa\n- Tata cara pendaftaran beasiswa\n- Jadwal dan tahapan seleksi beasiswa\n- Kuota dan kriteria penerima\n\n**Saya sarankan untuk langsung menghubungi kontak resmi UNU Kaltim:**\n\n📞 **Telepon/WA:** 0812-5317-738  \n📧 **Email:** pmb@unukaltim.ac.id\n\nAtau Anda bisa kunjungi website resmi PMB UNU Kaltim di [https://pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id) untuk informasi lebih lanjut.\n\nSemoga membantu! Ada pertanyaan lain?', 'openrouter', 'ah3P4wQ8kf2U2nvmkQIQhrRg3aiGvLcxRhV8Q0fM', '2404:c0:8cd0::65c:23b4', 5507, 1, NULL, '2026-01-10 00:06:15', '2026-01-10 00:06:15'),
(8, 56, 'Bagaimana cara daftar ulang', 'Tentu, saya bantu jelaskan prosedur daftar ulang di UNU Kaltim. 😊\n\nSebelum melakukan daftar ulang, pastikan Anda sudah menyelesaikan 5 langkah pendaftaran online melalui website PMB terlebih dahulu dan mendapatkan notifikasi bahwa Anda **lolos verifikasi**.\n\nBerikut adalah langkah-langkah daftar ulang:\n\n**1. Pembayaran Biaya Registrasi Awal**\n   - Setelah lolos verifikasi, Anda akan dihubungi oleh tim PMB via WhatsApp untuk informasi pembayaran.\n   - Silakan transfer biaya registrasi awal sebesar **Rp 300.000** ke rekening resmi universitas yang akan diberikan nanti.\n   - **PENTING:** Hati-hati penipuan! Panitia TIDAK PERNAH meminta transfer ke rekening pribadi.\n\n**2. Konfirmasi Pembayaran**\n   - Setelah melakukan transfer, simpan bukti pembayarannya (screenshot).\n   - Konfirmasi pembayaran Anda melalui WhatsApp ke nomor resmi PMB (0812-5317-738) atau melalui fitur yang tersedia di portal pendaftaran Anda.\n\n**3. Pengisian Formulir Daftar Ulang (Offline)**\n   - Anda akan diminta untuk melengkapi formulir daftar ulang yang disediakan oleh panitia.\n   - Isi semua data dengan lengkap dan benar.\n\n**4. Pengumpulan Berkas Asli**\n   - Serahkan dokumen asli yang sudah diupload saat pendaftaran untuk diverifikasi ulang, seperti:\n     - KTP & KK\n     - Ijazah/SKL\n     - Pas foto terbaru\n\nSetelah semua proses di atas selesai, Anda akan menerima **NIM (Nomor Induk Mahasiswa)** dan berhak mengikuti kegiatan perkuliahan.\n\nJika ada yang kurang jelas atau Anda ingin mengetahui jadwal pasti daftar ulang, silakan hubungi langsung panitia resmi PMB UNU Kaltim melalui:\n- **WA:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\nSemoga membantu! 🙏', 'openrouter', 'WR73uXtUilfUwXD1uozsc9ox20YtgwvRYJ4ZGHrp', '141.0.8.230', 7243, 1, NULL, '2026-01-10 22:27:53', '2026-01-10 22:27:53'),
(9, 72, 'ini mau isi foto kok ga bisa di pencet', 'Halo! Maaf ya kalau ada kendala. Soal tombol upload foto yang tidak bisa diklik, biasanya ada beberapa penyebab umum:\n\n**Coba cek hal-hal berikut:**\n\n📱 **Di HP:**\n- Pastikan browser sudah di-update (Chrome/Safari terbaru)\n- Coba refresh halaman atau buka di tab baru\n- Kalau pakai aplikasi, coba clear cache atau reinstall\n\n💻 **Di Komputer:**\n- Pastikan browser mendukung (Chrome/Firefox/Edge)\n- Nonaktifkan ad-blocker sementara\n- Coba pakai mode incognito/private\n\n**Penyebab lain:**\n- Format file tidak didukung (harus JPG, PNG, atau PDF)\n- Ukuran file terlalu besar (maks 2MB)\n- Koneksi internet lambat\n\n**Solusi cepat:**\nKalau masih tidak bisa, coba pakai perangkat lain atau hubungi panitia PMB di **0812-5317-738** (WA) untuk bantuan teknis langsung.\n\nAtau, kamu bisa coba fitur chatbot AI di website PMB (pmb.unukaltim.ac.id) dengan klik ikon hijau di pojok kanan bawah.\n\nAda yang masih bingung? 😊', 'openrouter', '13b2FotbhQsIThTqgDbo2j2XkGZTm5zVNRSbSLvO', '140.213.1.207', 13661, 1, NULL, '2026-01-11 01:32:41', '2026-01-11 01:32:41'),
(10, NULL, 'halo', 'Halo! Selamat datang di PMB Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim)!\n\nSaya siap membantu Anda dengan informasi seputar:\n- Proses pendaftaran mahasiswa baru\n- Program studi yang tersedia\n- Persyaratan dan jadwal pendaftaran\n- Biaya pendidikan & beasiswa\n- Fasilitas kampus\n\nAda yang ingin Anda tanyakan? 🎓', 'openrouter', 'Gehw7g89L1hd75288GsYoBkiYY2vm1dRthwYqvv2', '180.243.109.204', 3840, 1, NULL, '2026-01-11 20:37:39', '2026-01-11 20:37:39'),
(11, NULL, 'apa saja yang dipersiapkan', 'Halo! 👋 Tenang, saya akan bantu infokan apa saja yang perlu dipersiapkan untuk pendaftaran mahasiswa baru UNU Kaltim.\n\n## 📋 DOKUMEN PENTING YANG PERLU DISIAPKAN:\n\n**1. Dokumen Utama:**\n- Foto 4x6 latar merah (digital)\n- Scan/foto KTP (milik sendiri)\n- Scan/foto Kartu Keluarga (KK)\n- Scan/foto Ijazah atau Surat Keterangan Lulus (SKL)\n\n**2. Persiapan Teknis:**\n- Email aktif (untuk registrasi akun)\n- Nomor WhatsApp aktif (PENTING! untuk info status pendaftaran)\n- File dokumen dalam format: PDF, JPG, atau PNG\n- Maksimal ukuran file: 2MB per dokumen\n\n**3. Persiapan Data Diri:**\n- NIK (Nomor Induk Kependudukan)\n- NISN (Nomor Induk Siswa Nasional)\n- Tempat, tanggal lahir\n- Alamat lengkap\n- Nama lengkap\n\n## 💡 TIPS PENTING:\n- Pastikan foto/scan dokumen jelas dan terbaca\n- Siapkan semua dokumen sebelum mulai pendaftaran\n- Gunakan data sesuai dokumen resmi (KTP/Ijazah)\n- Cek email secara berkala untuk verifikasi akun\n\nKalau sudah siap semua, kamu bisa langsung daftar di [website PMB UNU Kaltim](https://pmb.unukaltim.ac.id). Ada pertanyaan lain? 😊', 'openrouter', '67k2FaCNIqhcCpQJ4BTfDaqjHbVdLR2MSMlrYcs5', '103.141.47.152', 5964, 1, NULL, '2026-01-11 21:07:11', '2026-01-11 21:07:11'),
(12, NULL, 'pembayaran untuk jurusan ilmu komunikasi berapa', 'Untuk jurusan **S1 Ilmu Komunikasi**, biaya yang perlu disiapkan adalah:\n\n## 💰 STRUKTUR BIAYA:\n\n**1. Biaya Registrasi Awal / Daftar Ulang:**\n- Rp 300.000 (dibayar saat daftar ulang)\n- Mencakup: Pembuatan NIM, KTM, dan Jaket Almamater\n\n**2. Biaya UKT (Uang Kuliah Tunggal) per Semester:**\n- **Rp 5.000.000** (program reguler non-farmasi)\n\nBiaya UKT ini berlaku untuk S1 Ilmu Komunikasi di jalur reguler ya.\n\n## ⚠️ PENTING:\n- Pembayaran biaya registrasi dilakukan SAAT DAFTAR ULANG (bukan saat mengisi formulir awal)\n- Pastikan hanya transfer ke rekening resmi UNU Kaltim\n- Hati-hati penipuan!\n\nUntuk informasi lebih lengkap atau penjelasan lebih detail, kamu bisa hubungi:\n- **WA/Telp:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\nAda pertanyaan lain? 😊', 'openrouter', '67k2FaCNIqhcCpQJ4BTfDaqjHbVdLR2MSMlrYcs5', '103.141.47.152', 4557, 1, NULL, '2026-01-11 21:08:06', '2026-01-11 21:08:06'),
(13, NULL, 'pembayaran untuk jurusan ilmu komunikasi berapa', 'Untuk jurusan **S1 Ilmu Komunikasi**, besaran biayanya sebagai berikut:\n\n## 💰 BIAYA PENDIDIKAN:\n\n**1. Biaya Registrasi Awal / Daftar Ulang:**\n- **Rp 300.000** (dibayar saat daftar ulang)\n- Mencakup: Pembuatan NIM, KTM (Kartu Tanda Mahasiswa), dan Jaket Almamater\n\n**2. Biaya UKT (Uang Kuliah Tunggal) per Semester:**\n- **Rp 5.000.000** (untuk program reguler non-Farmasi)\n- Ilmu Komunikasi termasuk dalam kategori ini\n\n**3. Biaya Tambahan (jika ada):**\n- Biaya RPL (Rekognisi Pembelajaran Lampau) / Alih Jenjang / Pindahan: **Rp 120.000 per SKS** (hanya jika kamu transfer dari kampus lain)\n\n---\n\n📍 **PENTING:** Pembayaran biaya registrasi awal dilakukan SAAT DAFTAR ULANG (setelah lolos verifikasi), bukan saat mengisi formulir pendaftaran awal.\n\nUntuk informasi lebih detail atau pertanyaan khusus, kamu bisa hubungi kontak resmi PMB UNU Kaltim:\n- **WA:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\nAda pertanyaan lain? 😊', 'openrouter', '67k2FaCNIqhcCpQJ4BTfDaqjHbVdLR2MSMlrYcs5', '103.141.47.152', 5139, 1, NULL, '2026-01-11 21:09:32', '2026-01-11 21:09:32'),
(14, 1, 'apa saja yang dipersiapkan', 'Untuk mendaftar di UNU Kaltim, Anda perlu mempersiapkan:\n\n**📄 DOKUMEN YANG DIBUTUHKAN:**\n\n- Foto 4x6 latar merah\n- Scan/Foto KTP\n- Scan/Foto Kartu Keluarga (KK)\n- Scan/Foto Ijazah atau Surat Keterangan Lulus (SKL)\n\n**📝 FORMAT FILE:**\n- PDF, JPG, atau PNG\n- Maksimal 2MB per file\n\n**💡 PERSIAPAN LAINNYA:**\n- Email aktif untuk registrasi\n- Nomor WhatsApp aktif (penting untuk info status pendaftaran)\n- Siapkan data pribadi: NIK, NISN, tempat tanggal lahir, alamat lengkap\n\n**🎯 TIPS:**\n- Pastikan foto/scan dokumen jelas dan terbaca\n- Isi data sesuai dokumen resmi (KTP/Ijazah)\n- Cek email dan WhatsApp secara rutin\n\nButuh bantuan lebih lanjut? 😊', 'openrouter', 'j1ZHokTzNkG2dtgrY2jC2UyhyxNzer0SMJksUMN9', '180.243.109.204', 7060, 1, NULL, '2026-01-11 21:34:00', '2026-01-11 21:34:00'),
(15, 74, 'Apakah biodata bisa dirubah setelah daftar?', 'Maaf, untuk informasi mengenai apakah biodata dapat diubah setelah pendaftaran, saya tidak memiliki data yang pasti mengenai kebijakan ini di sistem PMB UNU Kaltim.\n\n**Saya sarankan Anda untuk menghubungi bagian admisi langsung** melalui:\n\n📞 **Telepon/WA:** 0812-5317-738  \n📧 **Email:** pmb@unukaltim.ac.id\n\nMereka akan dapat memberikan informasi yang akurat mengenai prosedur perubahan data dan batas waktunya.', 'openrouter', 'XUviRVyT39BFxXWN1ePFZdMiOec1dJIFkKpJi9IT', '182.3.141.247', 4207, 1, NULL, '2026-01-13 04:13:08', '2026-01-13 04:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `chat_training`
--

CREATE TABLE `chat_training` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_verifications`
--

CREATE TABLE `document_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_biodata_id` bigint(20) UNSIGNED NOT NULL,
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `document_type` enum('kk','ktp','certificate','photo','biodata') NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_verifications`
--

INSERT INTO `document_verifications` (`id`, `student_biodata_id`, `verified_by`, `document_type`, `status`, `notes`, `verified_at`, `is_read`, `created_at`, `updated_at`) VALUES
(4, 4, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(5, 4, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(6, 4, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(7, 4, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(8, 4, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(9, 5, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(10, 5, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(11, 5, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(12, 5, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(13, 6, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(14, 6, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(15, 6, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(16, 6, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(17, 7, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(18, 7, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(19, 7, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(20, 7, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(21, 7, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(22, 8, 17, 'biodata', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(23, 8, 17, 'photo', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(24, 8, 17, 'ktp', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(25, 8, 17, 'kk', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(26, 8, 17, 'certificate', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(27, 9, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(28, 9, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(29, 9, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(30, 9, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(31, 9, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(32, 10, 17, 'biodata', 'approved', NULL, '2026-01-15 00:12:38', 0, '2025-12-26 03:58:56', '2026-01-15 00:12:38'),
(33, 10, 17, 'photo', 'approved', NULL, '2026-01-15 00:12:38', 0, '2025-12-26 03:58:56', '2026-01-15 00:12:38'),
(34, 10, 17, 'ktp', 'approved', NULL, '2026-01-15 00:12:38', 0, '2025-12-26 03:58:56', '2026-01-15 00:12:38'),
(35, 10, 17, 'kk', 'approved', NULL, '2026-01-15 00:12:38', 0, '2025-12-26 03:58:56', '2026-01-15 00:12:38'),
(36, 10, 17, 'certificate', 'approved', NULL, '2026-01-15 00:12:38', 0, '2025-12-26 03:58:56', '2026-01-15 00:12:38'),
(37, 11, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(38, 11, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(39, 11, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(40, 11, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(41, 11, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(42, 12, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(43, 12, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(44, 12, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(45, 12, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(46, 12, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(47, 13, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(48, 13, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(49, 13, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(50, 13, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(51, 13, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(52, 14, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(53, 14, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(54, 14, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(55, 14, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(56, 16, 17, 'biodata', 'approved', NULL, '2026-01-02 14:37:11', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:11'),
(57, 16, 17, 'photo', 'approved', NULL, '2026-01-02 14:37:11', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:11'),
(58, 16, 17, 'ktp', 'approved', NULL, '2026-01-02 14:37:11', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:11'),
(59, 16, 17, 'kk', 'approved', NULL, '2026-01-02 14:37:11', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:11'),
(60, 16, 17, 'certificate', 'approved', NULL, '2026-01-02 14:37:11', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:11'),
(71, 20, 17, 'biodata', 'approved', NULL, '2026-01-02 14:37:40', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:40'),
(72, 20, 17, 'photo', 'approved', NULL, '2026-01-02 14:37:40', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:40'),
(73, 20, 17, 'ktp', 'approved', NULL, '2026-01-02 14:37:40', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:40'),
(74, 20, 17, 'kk', 'approved', NULL, '2026-01-02 14:37:40', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:40'),
(75, 20, 17, 'certificate', 'approved', NULL, '2026-01-02 14:37:40', 0, '2025-12-26 03:58:56', '2026-01-02 14:37:40'),
(76, 21, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(77, 21, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(78, 21, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(79, 21, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(80, 21, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(81, 22, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(82, 22, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(83, 22, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(84, 22, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(85, 22, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2025-12-26 03:58:56'),
(86, 23, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 03:07:42', '2025-12-27 03:07:42'),
(87, 23, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 03:07:42', '2025-12-27 03:07:42'),
(88, 23, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 03:07:42', '2025-12-27 03:07:42'),
(89, 23, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 03:07:42', '2025-12-27 03:07:42'),
(90, 25, 17, 'biodata', 'approved', NULL, '2026-01-02 14:40:45', 0, '2025-12-30 08:20:05', '2026-01-02 14:40:45'),
(91, 25, 17, 'photo', 'approved', NULL, '2026-01-02 14:40:45', 0, '2025-12-30 08:20:05', '2026-01-02 14:40:45'),
(92, 25, 17, 'ktp', 'approved', NULL, '2026-01-02 14:40:45', 0, '2025-12-30 08:20:05', '2026-01-02 14:40:45'),
(93, 25, 17, 'kk', 'approved', NULL, '2026-01-02 14:40:45', 0, '2025-12-30 08:20:05', '2026-01-02 14:40:45'),
(94, 25, 17, 'certificate', 'approved', NULL, '2026-01-02 14:40:45', 0, '2025-12-30 08:20:05', '2026-01-02 14:40:45'),
(95, 26, 17, 'biodata', 'approved', NULL, '2026-01-02 14:36:21', 0, '2025-12-30 13:12:45', '2026-01-02 14:36:21'),
(96, 26, 17, 'photo', 'approved', NULL, '2026-01-02 14:36:21', 0, '2025-12-30 13:12:45', '2026-01-02 14:36:21'),
(97, 26, 17, 'ktp', 'approved', NULL, '2026-01-02 14:36:21', 0, '2025-12-30 13:12:45', '2026-01-02 14:36:21'),
(98, 26, 17, 'kk', 'approved', NULL, '2026-01-02 14:36:21', 0, '2025-12-30 13:12:45', '2026-01-02 14:36:21'),
(99, 26, 17, 'certificate', 'approved', NULL, '2026-01-02 14:36:21', 0, '2025-12-30 13:12:45', '2026-01-02 14:36:21'),
(100, 29, 17, 'biodata', 'approved', NULL, '2026-01-02 14:34:06', 0, '2026-01-01 13:34:48', '2026-01-02 14:34:06'),
(101, 29, 17, 'photo', 'approved', NULL, '2026-01-02 14:34:06', 0, '2026-01-01 13:34:48', '2026-01-02 14:34:06'),
(102, 29, 17, 'ktp', 'approved', NULL, '2026-01-02 14:34:06', 0, '2026-01-01 13:34:48', '2026-01-02 14:34:06'),
(103, 29, 17, 'kk', 'approved', NULL, '2026-01-02 14:34:06', 0, '2026-01-01 13:34:48', '2026-01-02 14:34:06'),
(104, 29, 17, 'certificate', 'approved', NULL, '2026-01-02 14:34:06', 0, '2026-01-01 13:34:48', '2026-01-02 14:34:06'),
(105, 31, 17, 'photo', 'approved', NULL, '2026-01-15 00:09:27', 0, '2026-01-02 10:06:47', '2026-01-15 00:09:27'),
(106, 31, 17, 'ktp', 'approved', NULL, '2026-01-15 00:09:27', 0, '2026-01-02 10:06:47', '2026-01-15 00:09:27'),
(107, 31, 17, 'kk', 'approved', NULL, '2026-01-15 00:09:27', 0, '2026-01-02 10:06:47', '2026-01-15 00:09:27'),
(108, 31, 17, 'certificate', 'approved', NULL, '2026-01-15 00:09:27', 0, '2026-01-02 10:06:47', '2026-01-15 00:09:27'),
(109, 31, 17, 'biodata', 'approved', NULL, '2026-01-15 00:09:27', 0, '2026-01-02 10:06:47', '2026-01-15 00:09:27'),
(110, 32, 17, 'biodata', 'approved', NULL, '2026-01-15 00:24:39', 0, '2026-01-02 15:45:30', '2026-01-15 00:24:39'),
(111, 32, 17, 'photo', 'approved', NULL, '2026-01-15 00:24:39', 0, '2026-01-02 15:45:30', '2026-01-15 00:24:39'),
(112, 32, 17, 'ktp', 'approved', NULL, '2026-01-15 00:24:39', 0, '2026-01-02 15:45:30', '2026-01-15 00:24:39'),
(113, 32, 17, 'kk', 'approved', NULL, '2026-01-15 00:24:39', 0, '2026-01-02 15:45:30', '2026-01-15 00:24:39'),
(114, 32, 17, 'certificate', 'approved', NULL, '2026-01-15 00:24:39', 0, '2026-01-02 15:45:30', '2026-01-15 00:24:39'),
(115, 33, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-04 13:38:57', '2026-01-04 13:38:57'),
(116, 33, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-04 13:38:57', '2026-01-04 13:38:57'),
(117, 33, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-04 13:38:57', '2026-01-04 13:38:57'),
(118, 33, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-04 13:38:57', '2026-01-04 13:38:57'),
(119, 33, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-04 13:38:57', '2026-01-04 13:38:57'),
(120, 34, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-05 13:37:56', '2026-01-05 13:37:56'),
(121, 34, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-05 13:37:56', '2026-01-05 13:37:56'),
(122, 34, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-05 13:37:56', '2026-01-05 13:37:56'),
(123, 34, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-05 13:37:56', '2026-01-05 13:37:56'),
(124, 34, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-05 13:37:56', '2026-01-05 13:37:56'),
(125, 37, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-06 16:01:33', '2026-01-06 16:01:33'),
(126, 37, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-06 16:01:33', '2026-01-06 16:01:33'),
(127, 37, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-06 16:01:33', '2026-01-06 16:01:33'),
(128, 37, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-06 16:01:33', '2026-01-06 16:01:33'),
(129, 37, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-06 16:01:33', '2026-01-06 16:01:33'),
(130, 38, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(131, 38, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(132, 38, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(133, 38, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(134, 38, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(135, 39, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-07 17:43:19', '2026-01-07 17:43:19'),
(136, 39, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-07 17:43:19', '2026-01-07 17:43:19'),
(137, 39, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-07 17:43:19', '2026-01-07 17:43:19'),
(138, 39, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-07 17:43:19', '2026-01-07 17:43:19'),
(139, 39, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-07 17:43:19', '2026-01-07 17:43:19'),
(140, 27, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-09 04:21:45', '2026-01-09 04:21:45'),
(141, 27, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-09 04:21:45', '2026-01-09 04:21:45'),
(142, 27, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-09 04:21:45', '2026-01-09 04:21:45'),
(143, 27, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-09 04:21:45', '2026-01-09 04:21:45'),
(144, 35, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-09 16:16:30', '2026-01-09 16:16:30'),
(145, 35, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-09 16:16:30', '2026-01-09 16:16:30'),
(146, 35, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-09 16:16:30', '2026-01-09 16:16:30'),
(147, 35, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-09 16:16:30', '2026-01-09 16:16:30'),
(148, 35, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-09 16:16:30', '2026-01-09 16:16:30'),
(149, 42, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-09 19:25:31', '2026-01-09 19:25:31'),
(150, 42, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-09 19:25:31', '2026-01-09 19:25:31'),
(151, 42, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-09 19:25:31', '2026-01-09 19:25:31'),
(152, 42, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-09 19:25:31', '2026-01-09 19:25:31'),
(153, 41, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-09 19:31:03', '2026-01-09 19:31:03'),
(154, 41, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-09 19:31:03', '2026-01-09 19:31:03'),
(155, 41, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-09 19:31:03', '2026-01-09 19:31:03'),
(156, 41, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-09 19:31:03', '2026-01-09 19:31:03'),
(157, 41, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-09 19:31:03', '2026-01-09 19:31:03'),
(158, 45, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-09 23:13:47', '2026-01-09 23:13:47'),
(159, 45, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-09 23:13:47', '2026-01-09 23:13:47'),
(160, 45, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-09 23:13:47', '2026-01-09 23:13:47'),
(161, 45, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-09 23:13:47', '2026-01-09 23:13:47'),
(162, 46, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-09 23:17:10', '2026-01-09 23:17:10'),
(163, 46, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-09 23:17:10', '2026-01-09 23:17:10'),
(164, 46, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-09 23:17:10', '2026-01-09 23:17:10'),
(165, 46, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-09 23:17:10', '2026-01-09 23:17:10'),
(166, 47, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-09 23:19:36', '2026-01-09 23:19:36'),
(167, 47, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-09 23:19:36', '2026-01-09 23:19:36'),
(168, 47, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-09 23:19:36', '2026-01-09 23:19:36'),
(169, 47, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-09 23:19:36', '2026-01-09 23:19:36'),
(170, 47, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-09 23:19:36', '2026-01-09 23:19:36'),
(171, 49, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-10 00:58:57', '2026-01-10 00:58:57'),
(172, 49, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-10 00:58:57', '2026-01-10 00:58:57'),
(173, 49, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-10 00:58:57', '2026-01-10 00:58:57'),
(174, 49, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-10 00:58:57', '2026-01-10 00:58:57'),
(175, 49, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-10 00:58:57', '2026-01-10 00:58:57'),
(176, 50, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-10 23:03:22', '2026-01-10 23:03:22'),
(177, 50, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-10 23:03:22', '2026-01-10 23:03:22'),
(178, 50, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-10 23:03:22', '2026-01-10 23:03:22'),
(179, 50, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-10 23:03:22', '2026-01-10 23:03:22'),
(180, 50, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-10 23:03:22', '2026-01-10 23:03:22'),
(181, 54, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-11 01:44:25', '2026-01-11 01:44:25'),
(182, 54, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-11 01:44:25', '2026-01-11 01:44:25'),
(183, 54, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-11 01:44:25', '2026-01-11 01:44:25'),
(184, 54, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-11 01:44:25', '2026-01-11 01:44:25'),
(185, 57, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-11 20:00:59', '2026-01-11 20:00:59'),
(186, 57, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-11 20:00:59', '2026-01-11 20:00:59'),
(187, 57, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-11 20:00:59', '2026-01-11 20:00:59'),
(188, 57, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-11 20:00:59', '2026-01-11 20:00:59'),
(189, 57, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-11 20:00:59', '2026-01-11 20:00:59'),
(190, 58, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-12 05:59:14', '2026-01-12 05:59:14'),
(191, 58, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-12 05:59:14', '2026-01-12 05:59:14'),
(192, 58, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-12 05:59:14', '2026-01-12 05:59:14'),
(193, 58, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-12 05:59:14', '2026-01-12 05:59:14'),
(194, 58, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-12 05:59:14', '2026-01-12 05:59:14'),
(195, 56, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-13 03:55:10', '2026-01-13 03:55:10'),
(196, 56, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-13 03:55:10', '2026-01-13 03:55:10'),
(197, 56, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-13 03:55:10', '2026-01-13 03:55:10'),
(198, 56, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-13 03:55:10', '2026-01-13 03:55:10'),
(199, 63, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-14 02:03:39', '2026-01-14 02:03:39'),
(200, 63, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-14 02:03:39', '2026-01-14 02:03:39'),
(201, 63, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-14 02:03:39', '2026-01-14 02:03:39'),
(202, 63, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-14 02:03:39', '2026-01-14 02:03:39'),
(203, 63, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-14 02:03:39', '2026-01-14 02:03:39'),
(204, 65, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-14 22:05:25', '2026-01-14 22:05:25'),
(205, 65, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-14 22:05:25', '2026-01-14 22:05:25'),
(206, 65, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-14 22:05:25', '2026-01-14 22:05:25'),
(207, 65, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-14 22:05:25', '2026-01-14 22:05:25'),
(208, 65, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-14 22:05:25', '2026-01-14 22:05:25'),
(209, 66, 17, 'biodata', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(210, 66, 17, 'photo', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(211, 66, 17, 'ktp', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(212, 66, 17, 'kk', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(213, 66, 17, 'certificate', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id`, `name`, `code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Fakultas Ekonomi dan Bisnis', 'FEB', 'Fakultas yang menyelenggarakan pendidikan di bidang ekonomi dan bisnis', 1, '2025-12-12 05:57:10', '2025-12-12 05:57:10'),
(2, 'Fakultas Teknik', 'FT', 'Fakultas yang menyelenggarakan pendidikan di bidang teknik dan teknologi', 1, '2025-12-12 05:57:10', '2025-12-12 05:57:10'),
(3, 'Fakultas Ilmu Sosial dan Kependidikan', 'FISKEP', 'Fakultas yang menyelenggarakan pendidikan di bidang ilmu sosial dan pendidikan', 1, '2025-12-12 05:57:10', '2025-12-12 05:57:10'),
(4, 'Fakultas Farmasi', 'FF', 'Fakultas yang menyelenggarakan pendidikan di bidang farmasi', 1, '2025-12-12 05:57:10', '2025-12-12 05:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_settings`
--

CREATE TABLE `landing_page_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` enum('text','textarea','image','url') NOT NULL DEFAULT 'text',
  `group` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landing_page_settings`
--

INSERT INTO `landing_page_settings` (`id`, `key`, `value`, `type`, `group`, `created_at`, `updated_at`) VALUES
(1, 'hero_title', 'Penerimaan Mahasiswa Baru (PMB) Universitas Nahdlatul Ulama Kalimantan Timur', 'text', 'hero', '2025-12-12 05:57:34', '2026-01-01 14:02:51'),
(2, 'hero_subtitle', 'Kuliah Mudah, Terjangkau, dan Berbasis Nilai Keislaman', 'text', 'hero', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(3, 'hero_description', 'PMB Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim). Daftar mahasiswa baru secara online, cek jalur masuk, informasi beasiswa, dan bantuan biaya pendidikan resmi.', 'textarea', 'hero', '2025-12-12 05:57:34', '2026-01-01 14:02:51'),
(4, 'hero_button_text', 'Daftar Sekarang', 'text', 'hero', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(5, 'hero_button_url', '/login', 'url', 'hero', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(6, 'hero_background_image', 'landing-page/AGTvP1xN1DocnjKQGz9UaZlNzCB0nEgu3OaeHwka.jpg', 'image', 'hero', '2025-12-12 05:57:34', '2025-12-13 23:23:18'),
(7, 'feature_1_title', 'Beasiswa & Bantuan Pendidikan', 'text', 'features', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(8, 'feature_1_description', 'UNU Kaltim menyediakan kesempatan beasiswa dan bantuan biaya pendidikan, termasuk program KIP-Kuliah, GratisPol, dan skema pendukung lainnya, untuk membantu mahasiswa menyelesaikan studi dengan lebih ringan.', 'textarea', 'features', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(9, 'feature_1_icon', 'clipboard-check', 'text', 'features', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(10, 'feature_2_title', 'Program Studi', 'text', 'features', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(11, 'feature_2_description', 'Tersedia berbagai program studi unggulan pada beberapa fakultas yang dirancang selaras dengan kebutuhan dunia kerja dan perkembangan ilmu pengetahuan serta teknologi, membekali mahasiswa dengan kompetensi siap kerja, ijazah resmi, dan peluang meraih sertifikat kompetensi BNSP sesuai bidang keahlian.', 'textarea', 'features', '2025-12-12 05:57:34', '2025-12-14 13:02:34'),
(12, 'feature_2_icon', 'graduation-cap', 'text', 'features', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(13, 'feature_3_title', 'Lingkungan Akademik', 'text', 'features', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(14, 'feature_3_description', 'Lingkungan akademik yang kondusif, islami, dan berlandaskan nilai Ahlussunnah Wal Jamaah untuk mendukung proses pembelajaran dan pengembangan karakter mahasiswa.', 'textarea', 'features', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(15, 'feature_3_icon', 'building-2', 'text', 'features', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(16, 'about_title', 'Tentang Universitas Nahdlatul Ulama Kalimantan Timur', 'text', 'about', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(17, 'about_description', 'Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim) merupakan perguruan tinggi yang berlandaskan nilai Islam Ahlussunnah Wal Jamaah dan kebangsaan. UNU Kaltim menyelenggarakan pendidikan tinggi melalui kegiatan pendidikan, penelitian, dan pengabdian kepada masyarakat dengan tujuan menghasilkan lulusan yang berilmu, berakhlak, dan mampu berkontribusi bagi pembangunan daerah serta bangsa. Dengan sistem pembelajaran yang terus dikembangkan dan dukungan fasilitas akademik yang memadai, UNU Kaltim berkomitmen menghadirkan pendidikan tinggi yang inklusif dan terjangkau.', 'textarea', 'about', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(18, 'contact_address', 'Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang', 'text', 'contact', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(19, 'contact_email', 'pmb@unukaltim.ac.id', 'text', 'contact', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(20, 'contact_phone_1', '0812-5317-738', 'text', 'contact', '2025-12-12 05:57:34', '2025-12-18 07:13:43'),
(21, 'contact_phone_1_label', 'Panitia PMB UNU Kaltim', 'text', 'contact', '2025-12-12 05:57:34', '2025-12-18 07:13:43'),
(22, 'contact_phone_2', '0811-4200-9990', 'text', 'contact', '2025-12-12 05:57:34', '2025-12-18 07:13:43'),
(23, 'contact_phone_2_label', 'Admin UNU Kaltim', 'text', 'contact', '2025-12-12 05:57:34', '2025-12-18 07:13:43'),
(24, 'contact_phone_3', NULL, 'text', 'contact', '2025-12-12 05:57:34', '2025-12-12 06:00:34'),
(25, 'contact_phone_3_label', NULL, 'text', 'contact', '2025-12-12 05:57:34', '2025-12-12 06:00:34'),
(26, 'university_logo', 'landing-page/DECjIPli9sVnmJvWroThG0lUp1e0oHj0Col766ye.webp', 'image', 'contact', '2025-12-12 05:57:34', '2025-12-13 03:13:44'),
(27, 'social_media_facebook', 'https://www.facebook.com/unukaltim.official', 'text', 'social_media', '2025-12-12 05:57:34', '2025-12-12 08:02:47'),
(28, 'social_media_instagram', 'https://instagram.com/unukaltim', 'text', 'social_media', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(29, 'social_media_website', 'https://unukaltim.ac.id', 'text', 'social_media', '2025-12-12 05:57:34', '2025-12-12 05:57:34'),
(30, 'about_image', 'landing-page/iHjHWrIV9sukVCjvZ0tCZxrZKScBIPM1dZCVX4o5.jpg', 'image', 'about', '2025-12-12 07:34:07', '2025-12-12 07:34:07'),
(31, 'hero_background_image_desktop', 'landing-page/ZhhRrQjrN1bbkvDfDEM8JbvoN7sVRrRMa9yOjtfp.png', 'image', 'hero', '2025-12-18 04:56:34', '2026-01-01 13:35:17'),
(32, 'hero_background_image_mobile', 'landing-page/5JAGVl3MxvKYbWknlVVZV80SRtQd5TEf0unque4O.png', 'image', 'hero', '2025-12-18 04:56:34', '2026-01-01 13:35:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_14_170933_add_two_factor_columns_to_users_table', 1),
(5, '2025_12_11_043337_create_student_biodatas_table', 1),
(6, '2025_12_11_043338_create_registrations_table', 1),
(7, '2025_12_11_071600_add_role_to_users_table', 1),
(8, '2025_12_11_071601_create_announcements_table', 1),
(9, '2025_12_11_075455_create_registration_periods_table', 1),
(10, '2025_12_11_075456_add_registration_period_id_to_registrations_table', 1),
(11, '2025_12_11_084358_add_document_fields_to_student_biodatas_table', 1),
(12, '2025_12_12_022202_create_document_verifications_table', 1),
(13, '2025_12_12_061136_add_phone_to_users_table', 1),
(14, '2025_12_12_062800_update_registrations_status_enum', 1),
(15, '2025_12_12_155138_create_registration_types_table', 1),
(16, '2025_12_12_155236_modify_registrations_table_for_registration_types', 1),
(17, '2025_12_13_031321_create_fakultas_table', 1),
(18, '2025_12_13_031322_create_program_studi_table', 1),
(19, '2025_12_13_031322_modify_registrations_choices_to_foreign_keys', 1),
(20, '2025_12_13_032621_create_landing_page_settings_table', 1),
(21, '2025_12_13_155552_add_birth_place_and_religion_to_student_biodata_table', 1),
(22, '2025_12_13_160228_add_address_to_student_biodatas_table', 1),
(23, '2025_12_15_070521_add_registration_path_to_registrations_table', 1),
(24, '2025_12_15_133231_add_referral_source_to_registrations_table', 1),
(25, '2025_12_18_055943_create_registration_paths_table', 1),
(26, '2025_12_18_060010_modify_registrations_table_for_registration_path_id', 1),
(27, '2025_12_21_105543_add_extended_status_and_audit_to_registrations', 1),
(28, '2025_12_21_105931_add_accepted_program_studi_to_registrations', 1),
(29, '2025_12_23_103645_add_registration_number_to_registrations_table', 1),
(30, '2025_12_29_000001_create_chat_training_table', 1),
(31, '2025_12_31_033859_add_reregistration_fields_to_student_biodatas_table', 1),
(32, '2025_12_31_033900_create_student_parents_table', 1),
(33, '2025_12_31_033901_create_student_special_needs_table', 1),
(34, '2025_12_31_042538_create_reregistration_payments_table', 1),
(35, '2025_12_31_072355_change_birth_year_to_birth_date_in_student_parents_table', 1),
(36, '2026_01_01_061438_add_nim_code_to_program_studi_table', 1),
(37, '2026_01_01_061439_add_nim_to_users_table', 1),
(38, '2026_01_01_081948_remove_registration_path_from_registrations_table', 1),
(39, '2026_01_01_113931_create_payment_settings_table', 1),
(40, '2026_01_07_014926_create_chat_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('iissetiana130982@gmail.com', '$2y$12$xdh98ONRwHMwJpSCTmk/vOmw1I5gGLZ83CtWGStgNREyyjrc0LXym', '2026-01-14 19:21:55'),
('rezamuhammad980@gmail.com', '$2y$12$nqMMX4tL./mlrbdEJB/cv.oZFPXWMfbzTBPeVLMalOxMSiMORvSr.', '2025-12-16 04:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'payment_type', 'bank_transfer', 'select', '2026-01-06 23:40:40', '2026-01-06 23:40:40'),
(2, 'payment_bank_name', 'BRI', 'text', '2026-01-06 23:40:40', '2026-01-06 23:40:40'),
(3, 'payment_account_number', '0123-01-012345-50-8', 'text', '2026-01-06 23:40:40', '2026-01-06 23:40:40'),
(4, 'payment_account_name', 'Universitas Nahdlatul Ulama Kaltim', 'text', '2026-01-06 23:40:40', '2026-01-06 23:40:40'),
(5, 'payment_amount', '300000', 'number', '2026-01-06 23:40:40', '2026-01-06 23:40:40'),
(6, 'payment_instructions', 'Transfer sesuai nominal yang tertera. Pastikan menyimpan bukti transfer.', 'textarea', '2026-01-06 23:40:40', '2026-01-06 23:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE `program_studi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fakultas_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `nim_code` varchar(4) DEFAULT NULL,
  `jenjang` enum('D3','D4','S1','S2','S3') NOT NULL,
  `description` text DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_studi`
--

INSERT INTO `program_studi` (`id`, `fakultas_id`, `name`, `code`, `nim_code`, `jenjang`, `description`, `quota`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Akuntansi', 'AKT', '0203', 'S1', 'Program Studi Akuntansi', 100, 1, '2025-12-12 05:57:17', '2025-12-12 05:57:17'),
(2, 2, 'Teknik Informatika', 'TI', '0105', 'S1', 'Program Studi Teknik Informatika', 120, 1, '2025-12-12 05:57:17', '2025-12-12 05:57:17'),
(3, 2, 'Teknik Industri', 'TIN', '0104', 'S1', 'Program Studi Teknik Industri', 200, 1, '2025-12-12 05:57:17', '2025-12-12 05:57:17'),
(4, 2, 'Arsitektur', 'ARS', '0101', 'S1', 'Program Studi Arsitektur', 60, 1, '2025-12-12 05:57:17', '2025-12-12 05:57:17'),
(5, 2, 'Desain Interior', 'DI', '0102', 'S1', 'Program Studi Desain Interior', 50, 1, '2025-12-12 05:57:17', '2025-12-12 05:57:17'),
(6, 3, 'Hubungan Internasional', 'HI', '0201', 'S1', 'Program Studi Hubungan Internasional', 70, 1, '2025-12-12 05:57:17', '2025-12-12 05:57:17'),
(7, 3, 'Ilmu Komunikasi', 'ILKOM', '0202', 'S1', 'Program Studi Ilmu Komunikasi', 90, 1, '2025-12-12 05:57:17', '2025-12-29 14:45:38'),
(8, 2, 'Teknologi Industri Pertanian', 'TIP', '0106', 'S1', 'Program Studi Teknologi Industri Pertanian', 60, 1, '2025-12-12 05:57:17', '2025-12-12 05:57:17'),
(9, 3, 'Pendidikan Anak Usia Dini', 'PAUD', '0204', 'S1', 'Program Studi Pendidikan Anak Usia Dini', 80, 1, '2025-12-12 05:57:17', '2025-12-12 05:57:17'),
(10, 4, 'Farmasi', 'FARM', '0103', 'S1', 'Program Studi Farmasi', 70, 1, '2025-12-12 05:57:17', '2025-12-29 14:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registration_period_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registration_type_id` bigint(20) UNSIGNED NOT NULL,
  `registration_path_id` bigint(20) UNSIGNED DEFAULT NULL,
  `referral_source` varchar(255) DEFAULT NULL,
  `referral_detail` text DEFAULT NULL,
  `choice_1` bigint(20) UNSIGNED DEFAULT NULL,
  `choice_2` bigint(20) UNSIGNED DEFAULT NULL,
  `choice_3` bigint(20) UNSIGNED DEFAULT NULL,
  `accepted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `acceptance_notes` text DEFAULT NULL,
  `accepted_program_studi_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `rejected_by` bigint(20) UNSIGNED DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `registration_number`, `user_id`, `status`, `accepted_at`, `created_at`, `updated_at`, `registration_period_id`, `registration_type_id`, `registration_path_id`, `referral_source`, `referral_detail`, `choice_1`, `choice_2`, `choice_3`, `accepted_by`, `acceptance_notes`, `accepted_program_studi_id`, `rejected_at`, `rejected_by`, `rejection_reason`) VALUES
(5, '26270100001', 19, 'submitted', NULL, '2025-12-16 07:29:33', '2025-12-26 04:00:12', 1, 1, NULL, 'Teman/Keluarga', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '26270100002', 22, 'accepted', '2026-01-15 00:25:56', '2025-12-16 22:10:56', '2026-01-15 00:25:56', 1, 1, NULL, 'Dosen/Panitia PMB UNU Kaltim', 'Ahmad Khoirul Anwar, S.Sos', 7, 2, NULL, 17, NULL, 7, NULL, NULL, NULL),
(7, '26270100003', 23, 'submitted', NULL, '2025-12-16 22:41:21', '2025-12-26 04:00:12', 1, 1, NULL, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '26270100004', 25, 'accepted', '2026-01-15 00:13:24', '2025-12-17 10:28:47', '2026-01-15 00:13:24', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 7, 8, NULL, 17, 'SUDAH MEMBAYAR ALMAMATER DAN KTM', 7, NULL, NULL, NULL),
(9, '26270100005', 18, 'submitted', NULL, '2025-12-19 20:20:43', '2025-12-31 01:16:16', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'Kartika Fajriani', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '26270100006', 28, 'submitted', NULL, '2025-12-19 20:52:03', '2025-12-26 04:00:12', 1, 1, 1, 'Website Resmi UNU Kaltim', NULL, 10, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '26270100007', 30, 'submitted', NULL, '2025-12-21 10:17:16', '2025-12-26 04:00:12', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '26270100008', 32, 'verified', NULL, '2025-12-22 00:27:28', '2026-01-02 14:37:11', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / MISSYA', 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '26270100012', 36, 'verified', NULL, '2025-12-22 05:06:19', '2026-01-02 14:37:40', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / GRUP RT', 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '26270100013', 39, 'submitted', NULL, '2025-12-24 08:29:33', '2025-12-26 04:00:12', 1, 1, 1, 'Teman/Keluarga', NULL, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '26270100014', 43, 'verified', NULL, '2025-12-30 08:20:05', '2026-01-02 14:40:45', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / SUCI', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '26270100015', 44, 'verified', NULL, '2025-12-30 13:12:45', '2026-01-02 14:36:21', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '26270100016', 37, 'submitted', NULL, '2025-12-31 23:08:48', '2025-12-31 23:08:48', 1, 1, 1, 'Teman/Keluarga', NULL, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '26270100017', 47, 'accepted', '2026-01-15 00:25:10', '2026-01-01 13:34:48', '2026-01-15 00:25:10', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 2, 10, NULL, 17, NULL, 2, NULL, NULL, NULL),
(24, '26270100018', 49, 'accepted', '2026-01-15 00:09:46', '2026-01-02 10:08:39', '2026-01-15 00:09:46', 1, 1, 1, 'Website Resmi UNU Kaltim', NULL, 10, 2, NULL, 17, NULL, 10, NULL, NULL, NULL),
(25, '26270100019', 50, 'accepted', '2026-01-15 00:22:48', '2026-01-02 15:45:30', '2026-01-15 00:22:48', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD LHOIRUL ANWAR / ARS', 2, 3, NULL, 17, NULL, 2, NULL, NULL, NULL),
(26, '26270100020', 51, 'submitted', NULL, '2026-01-04 13:38:57', '2026-01-04 13:38:57', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '26270100021', 52, 'submitted', NULL, '2026-01-05 13:40:31', '2026-01-05 13:40:31', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '26270100022', 55, 'submitted', NULL, '2026-01-06 16:01:33', '2026-01-06 16:01:33', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'DHIVA ANDHINI (MAHASISWA AKUTANSI)', 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '26270100023', 56, 'submitted', NULL, '2026-01-07 00:14:43', '2026-01-07 00:14:43', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'IBU PURBAWATI', 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '26270100024', 57, 'submitted', NULL, '2026-01-07 17:45:45', '2026-01-08 16:08:20', 1, 1, 2, 'Teman/Keluarga', NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '26270100025', 45, 'submitted', NULL, '2026-01-09 04:24:56', '2026-01-09 04:26:16', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '26270100026', 53, 'submitted', NULL, '2026-01-09 16:25:18', '2026-01-09 18:44:18', 1, 1, 2, 'Lainnya', 'MAJELIS DZIKRUSSADAH', 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '26270100027', 59, 'submitted', NULL, '2026-01-09 19:44:14', '2026-01-09 19:44:14', 1, 1, 2, 'Lainnya', 'majelis dzikrussadah', 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '26270100028', 60, 'submitted', NULL, '2026-01-09 19:48:12', '2026-01-09 19:48:12', 1, 1, 2, 'Lainnya', 'Majelis dzikrussadah', 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '26270100029', 65, 'submitted', NULL, '2026-01-09 23:19:36', '2026-01-09 23:20:25', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '26270100030', 67, 'submitted', NULL, '2026-01-10 01:06:57', '2026-01-10 01:06:57', 1, 1, 2, 'Lainnya', 'majelis dzikrussadah', 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '26270100031', 68, 'submitted', NULL, '2026-01-10 23:08:30', '2026-01-10 23:08:30', 1, 1, 1, 'Teman/Keluarga', NULL, 7, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '26270100032', 72, 'submitted', NULL, '2026-01-11 01:51:37', '2026-01-11 01:52:01', 1, 1, 1, 'Sekolah/Guru', 'Taufik Irwan Marwedi - SMK Negeri 17 Samarinda (082254502004)', 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '26270100033', 75, 'submitted', NULL, '2026-01-11 20:02:58', '2026-01-11 20:02:58', 1, 1, 1, 'Website Resmi UNU Kaltim', NULL, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '26270100034', 76, 'submitted', NULL, '2026-01-12 06:07:49', '2026-01-12 06:07:49', 1, 1, 2, 'Lainnya', 'majelis dzikrussaadah', 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '26270100035', 74, 'submitted', NULL, '2026-01-13 03:59:40', '2026-01-13 03:59:40', 1, 1, 2, 'Teman/Keluarga', NULL, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, '26270100036', 81, 'submitted', NULL, '2026-01-14 02:04:38', '2026-01-14 02:04:38', 1, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '26270100037', 83, 'submitted', NULL, '2026-01-14 22:06:43', '2026-01-14 22:06:43', 1, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '26270100038', 84, 'verified', NULL, '2026-01-14 22:29:49', '2026-01-14 23:06:40', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / NH', 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `registration_paths`
--

CREATE TABLE `registration_paths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registration_paths`
--

INSERT INTO `registration_paths` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Umum/Reguler', 'Jalur pendaftaran umum untuk calon mahasiswa baru', 1, '2025-12-17 03:30:03', '2025-12-17 03:30:21'),
(2, 'Kelas Karyawan', 'Jalur pendaftaran khusus untuk karyawan yang ingin melanjutkan pendidikan', 1, '2025-12-17 03:30:03', '2025-12-17 03:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `registration_periods`
--

CREATE TABLE `registration_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `wave_number` int(11) NOT NULL,
  `academic_year` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `quota` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registration_periods`
--

INSERT INTO `registration_periods` (`id`, `name`, `wave_number`, `academic_year`, `start_date`, `end_date`, `is_active`, `quota`, `created_at`, `updated_at`) VALUES
(1, 'Gelombang 1 2026/2027', 1, '2026/2027', '2025-12-01', '2026-02-28', 1, NULL, '2025-12-11 11:45:50', '2025-12-11 11:45:50'),
(2, 'Gelombang 2 2026/2027', 2, '2026/2027', '2026-03-01', '2026-06-30', 0, 1000, '2025-12-20 07:54:43', '2025-12-20 07:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `registration_types`
--

CREATE TABLE `registration_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registration_types`
--

INSERT INTO `registration_types` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Peserta Didik Baru', 'Jalur penerimaan calon mahasiswa baru.', 1, '2025-12-11 12:25:28', '2025-12-17 04:23:31'),
(2, 'Alih Jenjang', 'Jalur penerimaan mahasiswa melalui pengakuan pembelajaran lampau yang diperoleh dari pengalaman kerja dan/atau pendidikan formal sebelumnya (termasuk alih jenjang).', 1, '2025-12-11 12:25:39', '2026-01-01 00:06:50'),
(4, 'Pindahan', 'Jalur penerimaan mahasiswa pindahan dari perguruan tinggi lain.', 1, '2025-12-11 12:26:13', '2026-01-01 00:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `reregistration_payments`
--

CREATE TABLE `reregistration_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 300000.00,
  `payment_proof_path` varchar(255) DEFAULT NULL,
  `status` enum('pending','verified','rejected') NOT NULL DEFAULT 'pending',
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2dnYB0pRMBxcuVHlbZVyjDlB8ts6I0Su7t3XRTBB', 49, '2404:c0:8ce0::692:6dc0', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM3UwdzRlU3haOEV5NFkzMWthTWYwS2EyUloxeTJIZElBb0RUVVp0TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ5O30=', 1768462838),
('3PHTc2FnrLOC6ssBZs2zK4ps53f6qR7riK9vJKRJ', NULL, '2001:448a:d100:846:cd57:9b68:5230:d1d', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUdGbzN0bm1nZjZaUGxWWDV0ZlgzV1QzUkM0Z0NrajRUUVdYeWdiQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9wYW5kdWFuLWxlbmdrYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768460252),
('7bd6s0GbR5Aii1DUvjT7yaaM6NzNGfWQAZ4QtLjG', 83, '182.8.178.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_1_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/403.0.853868894 Mobile/15E148 Safari/604.1', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYjNjVUZ3OG9yNW53MDlMYnNCRjFkaDdYRGF3UlJDMlRMZUpJVzc0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjgzO3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mzc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9kYXNoYm9hcmQiO319', 1768453192),
('lpY0KR3HSe7gj5ghQhk4vswuXcxTiED78W3oimSB', 17, '182.8.161.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYTFTRXJCT3NVaFRtMmVLQXZhWkp1dFBjQjc2ZE41cExqM2xoY2gwaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9hZG1pbi9zdHVkZW50cy1leHBvcnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNzt9', 1768462211),
('NmqZjsHzodYjh86ACv4pUAP45CteDRUzcqayfUO3', NULL, '182.8.178.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMmpFaERJcnllNlFrcG1tU2Nnc3pOb0VXYlZXa01yWk9oUEtndE9lcCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NToiaHR0cHM6Ly9wbWIudW51a2FsdGltLmFjLmlkL3N0dWRlbnQvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768454509),
('TWTGxxy9aWzORmIObpPYysXrhX3pAKT9DyICp6Dn', NULL, '100.52.3.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVNUb0pRMDg4WWY0b3JwQVhGdnN3cE9EOHBrSml4cG8ydUoxYW9OeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768463126),
('vBDF4IezuYV5X7U9THFP2MFUgfgDoRWTeed6qMcm', NULL, '180.243.109.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHlmZWh0aU93MFNJZ21aTnptSDJUaVQ0UGpBU3NtR3IyclJDTk1MSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768455220),
('VZsgMDnliNcZxiTeWuN3kaOWJGb6jxTuGKwcj54b', 83, '182.8.178.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.1 Mobile/15E148 Safari/604.1', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN2lOUlFKbHdtemRJeHY5d2RuZ1p4Y3hBckJHajRFNllCeTRaMmkycyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU2OiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvc3R1ZGVudC9kYXNoYm9hcmQ/dmVyaWZpZWQ9MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjgzO30=', 1768453613),
('wz5KBjHDNQms3TXfCP1uUQh2kceFhugeTfJMWwXc', NULL, '117.103.171.5', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.7499.192 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGlYZlJlbzhBRElDMTZ4U0E3UTFTMjFyVTlZSEpQVUljYkZzWFBVdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768461931),
('XyTcNZWIreClOrAKSJDt8TDnK4MvHxv2KLFMdgfA', NULL, '2001:4860:7:b06::e5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieldMc09pcFhCNml1TzUwT1ZiTTVnVVhNVFB3bElFRFJCT1dSaXBNYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768454500),
('ySCLtyC2dXYX8JNgXz4t0RMB8JHulJFHg2YTcAvv', 1, '180.243.109.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRTVRQ2VtQ2toUDdCczlLdnVOM0tvRkRMT1hMY0VNbHdLODhYYXVCZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9hZG1pbi9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1768463521);

-- --------------------------------------------------------

--
-- Table structure for table `student_biodatas`
--

CREATE TABLE `student_biodatas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `nisn` varchar(255) DEFAULT NULL,
  `last_education` varchar(255) DEFAULT NULL,
  `school_origin` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `gender` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dusun` varchar(255) DEFAULT NULL,
  `rt` varchar(255) DEFAULT NULL,
  `rw` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kode_pos` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kabupaten` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  `kps_recipient` tinyint(1) NOT NULL DEFAULT 0,
  `kps_number` varchar(255) DEFAULT NULL,
  `residence_type` enum('bersama_orang_tua','wali','kost','asrama','panti_asuhan','lainnya') DEFAULT NULL,
  `transportation` enum('jalan_kaki','sepeda','sepeda_motor','mobil_pribadi','angkutan_umum','ojek','andong','perahu','lainnya') DEFAULT NULL,
  `reregistration_status` enum('not_started','form_completed','payment_pending','completed') NOT NULL DEFAULT 'not_started',
  `photo_path` varchar(255) DEFAULT NULL,
  `kk_path` varchar(255) DEFAULT NULL,
  `ktp_path` varchar(255) DEFAULT NULL,
  `certificate_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_biodatas`
--

INSERT INTO `student_biodatas` (`id`, `user_id`, `name`, `nik`, `nisn`, `last_education`, `school_origin`, `major`, `phone`, `gender`, `birth_date`, `birth_place`, `religion`, `address`, `mother_name`, `npwp`, `telephone`, `email`, `dusun`, `rt`, `rw`, `kelurahan`, `kode_pos`, `kecamatan`, `kabupaten`, `provinsi`, `kps_recipient`, `kps_number`, `residence_type`, `transportation`, `reregistration_status`, `photo_path`, `kk_path`, `ktp_path`, `certificate_path`, `created_at`, `updated_at`) VALUES
(4, 14, 'terimakasih', '1111111111155555', '1111222234', 'SMA/SMK Sederajat', 'SMAN 99', 'IPA', '00000009999', 'Laki-laki', '1999-09-01', 'Goa', 'Buddha', 'Sangkotek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/9maStVt6FYMWBEn5AxHNHo07kwd924FY0a0dbMt5.png', 'students/kk/9mFMppWZW93l9zCOox2BQ9iJXuI9TFfAE6khEGwG.pdf', 'students/ktp/zHEQRfV8hInQcs5bn9NMoVahJsCLlH4UkrAXknAK.png', 'students/certificates/oe3w6Cv9w0pBfbieKDjq090OMrVnwirnJZ5t5SHx.png', '2025-12-15 00:22:00', '2025-12-15 00:22:00'),
(5, 20, 'tes', '6472012505940002', '0000446789', 'SMA/SMK Sederajat', 'SMKN11 Samarinda', 'Tata boga', '08164500575', 'Laki-laki', '1997-12-17', 'Jakarta', 'Islam', 'jalan anugrah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/JaECwJShMzsSu92gy9lvsz1k6pIB2L1nR3PtHBEJ.jpg', 'students/kk/26Gc7p7Lmzw8IH96lKQVyx6y7Rq9KXiuYVlOEprz.jpeg', 'students/ktp/ZtvSJChaAYPGfgHHvRfLS1drnSYcdi1EqipzKJVh.jpg', NULL, '2025-12-16 02:04:32', '2025-12-16 02:04:32'),
(6, 21, 'kapunkapmoi', '0000000000000002', '0900000009', 'SMA/SMK Sederajat', 'SMAN 99', 'Iwak', '09990000888', 'Laki-laki', '2004-09-01', 'HIJAU', 'Konghucu', 'Jl. APT. Pranoto, Kel. Gunung Panjang, Kec. Samarinda Seberang, Kota Samarinda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/xzuuHaqnaBjscb5yrzp0h8iMaZhbYTjFwbwYjQ0D.png', 'students/kk/lk42Tu3ndCUbpz0fGkEWDnooNUfaY7JXLWrSUxN7.pdf', 'students/ktp/kwtyVnglX5fIx4TRIL42KdlMSmZbbltpE1NyCD5e.pdf', NULL, '2025-12-16 02:22:59', '2025-12-16 02:22:59'),
(7, 19, 'Muhammad Raihan Pratama', '6472061907050003', '0059984152', 'SMA/SMK', 'SMK KEHUTANAN NEGERI SAMARINDA', 'Teknologi Produksi Hasil Hutan', '081256538995', 'Laki-laki', '2005-07-19', 'Samarinda', 'Islam', 'Jl. Jakarta 1 Perum BCL Blok B.8 No.4, Kel. Loa Bakung, Kec. Sungai Kunjang, Kota Samarinda, Provinsi Kalimantan Timur.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Oqjx2EG2Y3FGkKglFlHUyi7HfmIftu9rUjkl5LpE.jpg', 'students/kk/FHUWyk1Mu1hXgtYrPl7yBmRrehTS1Soy0lNgEHLj.pdf', 'students/ktp/KL3WIEVOtO69cHaKO4nNMRvsJjXtoc7BHnUKNkvY.jpg', 'students/certificates/RVsD0TzmGLZwByUfRAl1VlQigV9ULuBQe3KWrPiw.pdf', '2025-12-16 07:23:27', '2025-12-17 03:31:06'),
(8, 22, 'IKWALUDIN IRKHAMNI', '6472051103030004', '0031739671', 'SMA/SMK', 'SMK Negeri 5 Samarinda', 'Bisnis dan Pemasaran', '083852596613', 'Laki-laki', '2003-03-11', 'Samarinda', 'Islam', 'Jl. Trisari RT. 21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/cW8q2NeIXCma3zQZj2vpT5nD6CI8HJlHgWJwQEVY.jpg', 'students/kk/03Pq9ptRVeRvL8fYgI4gcLheLD1Dx8tYFhr0u69r.pdf', 'students/ktp/mBTvA8mNVAQY3UxTFsWCzIGJxPS1O7pmEEdmCTu5.pdf', 'students/certificates/MPHNqMF169WN15cniuo7fLHkvA2wQAD5ElMKDEO4.jpg', '2025-12-16 22:09:08', '2025-12-17 01:56:58'),
(9, 23, 'Mouhammed Zidane Basayev Al Usman', '6471031207030005', NULL, 'SMA/SMK', 'SMK TI LABBAIKA', 'Teknik komputer dan jaringan', '087715729215', 'Laki-laki', '2003-07-12', 'Bogor', 'Islam', 'Jl. Pada Elo No.173 Rt.002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/zY63zlZaqPuQH4OsYSW59rjwtJeP8voE2ZwN9IIH.jpg', 'students/kk/2JAHuXJQZGy70tkgomE2sqOz6cqfyMtgcHkxjLkx.pdf', 'students/ktp/ZQl4MtufylugATjl0MmAoferoQWaIgiEGqX9W6RJ.pdf', 'students/certificates/RVItoQy8UeMTBXeedacw04p1ZaHeQ0XKaJCDyuVl.pdf', '2025-12-16 22:38:31', '2025-12-17 03:31:46'),
(10, 25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', '6472023105050001', '0052490733', 'SMA/SMK Sederajat', 'PONPES IMAM ASY-SYATHIBY Gowa Makassar', 'Agama Islam', '085750296152', 'Laki-laki', '2005-05-31', 'Samarinda', 'Islam', 'JL. Tanjung Aru, RT.015, Kelurahan Mangkupalas, Kecamatan Samarinda Seberang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/vIeTCL0dRes0kR2st8pnRLf5E8Ckh7h6ha1JUCpE.jpg', 'students/kk/L37drQJW68CkHE7nzl4e4vBolrP5KLVmSpPgYboH.jpg', 'students/ktp/X0PzllONDdkUMvIqN2Hll3KWWlzCGyzlzoggBjHB.jpg', 'students/certificates/rUw64FZchQvpuyUmUeEbyYiatrwnl46CzoHC7q8I.jpg', '2025-12-17 10:19:10', '2025-12-17 10:19:10'),
(11, 26, 'Emilda Ainun alzahra', '6472066005070007', '0074866571', 'SMA/SMK Sederajat', 'SMA BUDI LUHUR', NULL, '085934592604', 'Perempuan', '2007-05-20', 'Samarinda', 'Islam', 'Jalan KS Tubun dalam gang wiratirta RT 17 no 02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/4Itf0t8FJB2DRFumklRxMC1N8LhlLkUZQKc2LVHz.png', 'students/kk/YJ5jfMkcGcDJkjemPWXGUo1eSEU5i5LeAtfiM8yl.pdf', 'students/ktp/lqvOn4UHKIhLAYA2dmKeG92NSOmjuPaoabuSnAP1.pdf', 'students/certificates/T3V2cXFjXIsdlfegXK9NDfGljmkjW92ckJjtKz97.pdf', '2025-12-18 02:59:12', '2025-12-18 02:59:12'),
(12, 18, 'Sindiya kartika', '6402034107991004', '9993349686', 'SMA/SMK Sederajat', 'SMAN 2 LOA JANAN', 'IPA', '085163137202', 'Perempuan', '1999-09-21', 'Bakungan', 'Islam', 'Jl.gerbang dayaku desa bakungan rt 08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/2lj5u37uBswis7H9fk2vBVGUQbaw4xD5MEXwk9qF.jpeg', 'students/kk/z9NjdCiFTtIKHDowiOgu6xUloviZeQ4e5dEh7qBk.jpeg', 'students/ktp/P9yyaXBEYnpEVj7XzNSSJr5Yu5ZRKmnQPTjrJ2Vf.jpeg', 'students/certificates/l9MauTw5EAvvluSLozuUQ8A73fxzAWnGCJodUUhS.jpeg', '2025-12-19 20:11:48', '2025-12-19 20:11:48'),
(13, 28, 'Eka putri nur aisyah', '6402164906050002', '0059599318', 'SMA/SMK Sederajat', 'SMK YPM DIPONEGORO', 'Multimedia', '085822516904', 'Perempuan', '2005-06-09', 'Tenggarong', 'Islam', 'Tenggarong seberang,Manunggal jaya L2 blok E rt 06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/IPSHAQJRU7Z9Vf2PO1l86No8WBADg9Aip3bGKHR2.jpeg', 'students/kk/Jw5mlD9Lhr67Gfh7EwoLT2lEinjTuuHBrhTWwHoz.jpeg', 'students/ktp/7ssLFs75WC089fWZiBT57LsbJ4JOB5m0OW1WgFUM.jpeg', 'students/certificates/LOPIFOZySZgEk2fB3Uq3JgM3wefJZikPck7IA2Fp.jpeg', '2025-12-19 20:50:26', '2025-12-19 20:50:26'),
(14, 30, 'Egha Aulia Renatasari', '6402165606050003', NULL, 'SMA/SMK Sederajat', 'Sma Negeri 1 Tenggarong Seberang', 'ipa', '082255726898', 'Perempuan', '2005-06-16', 'Kutai Kartanegara', 'Islam', 'Desa Sukamaju, Rt 12, No. 16, Kec. Tenggarong Seberang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/SJMqh40UBhODcbFm0bLOm67O704goSFEX59BtjXs.JPG', 'students/kk/sE4Kijmkrs3qQrPEvx2nAAhAvkR1uB0yU4s8SOo3.jpeg', 'students/ktp/OcM50ZemRmstkYZcOUzGbFgEz9JExBjmHThDzouT.jpeg', NULL, '2025-12-21 09:07:19', '2025-12-21 09:07:19'),
(16, 32, 'DHINI ALEXANDRA KUMALASARI', '6472075903060002', '3067311527', 'SMA/SMK', 'SMAN 4 SAMARINDA', NULL, '0895 3443 22525', 'Perempuan', '2006-04-19', 'PETUNG', 'Islam', 'JL. PATIMURA\r\nMANGKUPALAS\r\nSAMARINDA SEBERANG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/fGlHvzBYl3ukSY2wVVZrHjXOKfWHJ0kxl6MEgw6Y.jpeg', 'students/kk/cgQLHvr577X55JFBiseZfaSBEtslwoS2xzPnZsd9.pdf', 'students/ktp/Ri8YCNoIJATEPCmjEPpPEJsNxJ8EKXrxLeppYrQ5.pdf', 'students/certificates/SWBZwfKAtadJW2TgCS9y8GdDvbaxY8Pv4lqYOnEo.pdf', '2025-12-22 00:27:28', '2025-12-22 00:27:28'),
(20, 36, 'ALVIN', '6472012708030002', '0025776132', 'SMA/SMK', 'SMK KESEHATAN', NULL, '+62 851-8498-4637', 'Laki-laki', '2003-08-27', 'SAMARINDA', 'Islam', 'JL. KESEHATAN RAWA MAKMUR PALARAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/1weXtCAu4a30K365YiXnZSSOBeBiyiXbz6H8TtIN.jpeg', 'students/kk/glzumttGhNAqLhPMTnbp37UJuwtbpNnOfwaLreAP.pdf', 'students/ktp/ueOfE3ud7bgDb53qVI1w5N0IGPvhYAVsobryWOnR.pdf', 'students/certificates/HiQc0HGSuDmW8gjJPU3Q4AEogNb2JUvPgKgbsrQc.pdf', '2025-12-22 05:06:19', '2025-12-22 05:06:19'),
(21, 39, 'Nur Ayu Syafutri', '6472016609030002', '0030295995', 'SMA/SMK Sederajat', 'SMK farmasi Samarinda', 'Teknologi laboratorium medik', '082154177300', 'Perempuan', '2004-09-26', 'Pallangga', 'Islam', 'Jalan Borneo rt 24 samping spbu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/06JZkxVlYrAmXeaJeHMfoftDGC5umQDpubYCS5EW.JPG', 'students/kk/IKIJCdWwCh00Q0sUkOcq3rBYpMZnnv0niw79UVjJ.pdf', 'students/ktp/P6MqzJvaC5Yvd6fD53Ab39bmsTsKYW3Cnm8j88r5.pdf', 'students/certificates/65TdjfFDfotNqh5m9kLKmnrlWBdVZZf50p54P2sw.pdf', '2025-12-24 08:22:32', '2025-12-24 08:22:32'),
(22, 37, 'Dhava ade syawaluddin', '6402160112040001', '0044526688', 'SMA/SMK Sederajat', 'SMA NEGERI 2 TENGGARONG', 'IPS', '085651251219', 'Laki-laki', '2004-12-01', 'SAMARINDA', 'Islam', 'KUTAI KARTANEGARA TENGGARONG SEBRANG LOA LEPU RT 03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Rh8TNXBvACZAMBBb7a6s7NM1jWXDzPGPaOq83P8E.jpg', 'students/kk/R89tFAo2sO9NSJp6hRW452HEyCcTGJlvJ35O45wB.jpg', 'students/ktp/f5NKcSpFufVrnVKmPLh9pMftRZBkJ6pk0bKU78qC.jpg', 'students/certificates/ZVxm6jyutNIBo4CGnXKr4TAWWznLCKbOKcomJq66.jpg', '2025-12-25 01:05:15', '2026-01-04 13:54:56'),
(23, 41, 'Xaviera Fowlers', '6472015102990222', '0000645689', 'SMA/SMK Sederajat', 'SMKN 22 Samarinda', 'TKJ', '08123344556', 'Laki-laki', '2005-09-25', 'Samarinda', 'Islam', 'Ut elit non recusans', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/icM7MdGsVgT6pdzcXe9I1lXMQn6F1jmaxtmVj9wD.jpg', 'students/kk/fG9ZJ9yHOGrqq9Z13LiutGgoeeqefbMfWZgCRcDj.pdf', 'students/ktp/6vUZ9YOYRlf6Kj8THNvRAJifIFgTKie7LdgsTPb9.png', NULL, '2025-12-27 03:07:42', '2026-01-04 18:15:00'),
(25, 43, 'SILVANA TIARA ANGGRENI', '6408076403070001', '30405722', 'SMA/SMK Sederajat', 'SMKS TI LABAIKA', NULL, '081549738581', 'Perempuan', '2007-03-24', 'MARAH HALOQ', 'Islam', 'MARAH HALOQ RT 01 KECAMATA TELEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/4c3QE1MckstWNR4T5JimEtgoYwerMTwOpjyBLvwZ.jpg', 'biodata/kk/PtGC8JY36BYshZ1GmeJ8uVKhwDHKIdvivrsfMNtj.pdf', 'biodata/ktp/XSVOPEvoWXxazZIfa6ZHxeyRdt3dnDZn47Y0JUhK.pdf', 'biodata/certificates/bUD0GqsUJ6Ev5ATRVqNJeuXfTt108UcSyB3S2RIs.pdf', '2025-12-30 08:20:05', '2025-12-30 08:20:05'),
(26, 44, 'RIDWAN', '6402040203010002', '0018099699', 'SMA/SMK Sederajat', 'MA MIFTAHUL ULUM ANGGANA', NULL, '081255422011', 'Laki-laki', '2001-04-02', 'TANJONGE', 'Islam', 'JL. PEMBANGUNAN\r\nANGGANA\r\nRT 14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/8cDzi8GYncPzg2QvJH8xWjLGDsOgJ23zSHw5gFhh.jpg', 'biodata/kk/HY5Bw3GKFsqxr9MQ4O1NxsIeU7J0cL46R68IuvGq.pdf', 'biodata/ktp/OhxzdtDk1YEhOvqdxEk8hmRbaqqFyd9eRWdv8lrV.pdf', 'biodata/certificates/dqE7dQBks398A2asmgKD5c4gYUtqdGzkfC9e3hzD.pdf', '2025-12-30 13:12:45', '2025-12-30 13:12:45'),
(27, 45, 'ABRIAN ISLAMI PERKASA.S', '6408182001070001', '0076466671', 'SMA/SMK Sederajat', 'SMK MEDIKA SAMARINDA', 'TBSM', '082252542337', 'Laki-laki', '2007-01-20', 'kuala bali', 'Islam', 'JL.POROS RT. 003 MUKTI UTAMA LONGMESANGAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/js9lMIot6WDa0dWVhrZ622Np1xYG8Pz1FEzNeWFi.jpg', 'students/kk/HnRzJhw0tXQmwMbEuuDVvszshgKmkhWLfGuCnfi5.pdf', 'students/ktp/sZzhPeEVJAuQGe1U3IUMRgC4QifkSFINWkEN11H5.jpg', NULL, '2026-01-01 10:23:31', '2026-01-09 04:21:45'),
(28, 46, 'ABRIAN ISLAMI PERKASA.S', NULL, NULL, NULL, NULL, NULL, '082252542337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-01 10:27:08', '2026-01-01 10:27:08'),
(29, 47, 'FADHILAH RAMDANIAH', '6402085212010004', '0018533295', 'SMA/SMK Sederajat', 'SMA ISLAM TERPADU NURUL ILMI TENGGARONG', NULL, '082150207691', 'Perempuan', '2001-12-12', 'KOTA BANGUN', 'Islam', 'JL. SRI BANGUN RT. 19 DESA. KOTA BANGUN ULU KEC. KOTA BANGUN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/6OGijskkYzAluy3RsUVc01Bdh2CPHWXjF4C91wQm.jpg', 'biodata/kk/EhqGivExjzlQ8bBQGlgvxtnAfKi3MQCPfwOBQzWa.pdf', 'biodata/ktp/h06NXotkXONGcgp8Vfs5YBoRzvRC6FkhoigsYN3M.pdf', 'biodata/certificates/eUzaQSgMj3ke4yoZO0nTRY5pQFTaPSwqTYovsZbt.pdf', '2026-01-01 13:34:48', '2026-01-01 13:34:48'),
(31, 49, 'ISMAIL HASAL AL - AZZAM', '6472030610070008', '0072420082', 'SMA/SMK Sederajat', 'SMK 17 SAMARINDA', 'Farmasi', '081522546898', 'Laki-laki', '2007-10-06', 'Samarinda', 'Islam', 'Jl. Rejo Mulyo RT 32 NO 19 Kelurahan Lempake Kecamatan Samarinda Utara Kota Samarinda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/ppwoJ30g0qa5NI2SyRXCDoZQ7CiKJwevIHM7fQtR.jpg', 'students/kk/z1G3l89DXZbY8nJZYL36G45yFkwlkt4MDASk1T3F.jpg', 'students/ktp/j3X1sWBUtMhb2EvwDh7WFfKic2CF2ldthAPw96ts.jpg', 'students/certificates/afchkLopMB5ZNyZXVqU2LxD50toSiW1uky3tWLcP.jpg', '2026-01-02 07:51:43', '2026-01-02 10:06:47'),
(32, 50, 'JULIANDA FEBRIANNUR', '6402082107040004', '0042151699', 'Paket C', 'ABDI BANGSA KOTA BANGUN', NULL, '081255758610', 'Laki-laki', '2004-07-21', 'KOTA BANGUN', 'Islam', 'JL. SRINBANGUN RT. 19 KEC. KOTA BANGUN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/Bo1mAlFTeaPEb3vWwwmIUdYqnU1o8z1OefBgLwMG.jpg', 'biodata/kk/5LM3JPU71H1xJeIQanQ4b98XSaZdSRZjTKaqC4zq.pdf', 'biodata/ktp/GjEjFkgyHoyUiuEeIsy1n1NNwlInzRI8e3bx6r4e.pdf', 'biodata/certificates/TNy5GfQu2TjDWJ8CK7eSSUJYA0TBvZz788nDxyca.pdf', '2026-01-02 15:45:30', '2026-01-02 15:45:30'),
(33, 51, 'FAUZIAH MAULIDYA', '6402066404050003', '0050617089', 'SMA/SMK Sederajat', 'SMA ISLAM TERPADU NURUL ILMI TENGGARONG', NULL, '082157598157', 'Perempuan', '2005-04-24', 'KUTAI KARTANEGARA', 'Islam', 'JL. SUAKA POLEWALI RT.4 DESA. JONGKANG KEC. LOA KULU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/m9ZBtf76iq7D5Rf6kcHYZ5741Cwzs0PmQPLlKDnm.jpg', 'biodata/kk/d6oLclqur6ymjKifFs0QmVlAu1fgnkLGY1dE2FF4.pdf', 'biodata/ktp/4Qe2v0MjPvHz6j33PkpAF26e84WimTa6jHXlXNpa.pdf', 'biodata/certificates/C2AJH42O3lR4IPzhTP1AfGIwjpRhbWry4GHnFY9x.pdf', '2026-01-04 13:38:57', '2026-01-06 14:14:05'),
(34, 52, 'Jannatul aulia', '6472066606030001', '3034235511', 'Paket C', 'Sma albanjari', 'Ips', '085750314922', 'Perempuan', '2003-06-26', 'Samarinda', 'Islam', 'Jln datu iba gg datu umar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/DatoUUsNGttEUidZxETcjJb0f4T6paI1H7Fcsj51.png', 'students/kk/sjGtdVlslP6UZUt6tCdzfSS3LLJYTd4NSDh3yKSa.jpg', 'students/ktp/rEmZAcJq2q1s76ld19a9hfO0xVCCceJC3lwwCKmc.jpg', 'students/certificates/Tgc5aJaKDFfR56b5MA4DqPPpQb3PcoLB0bNwZbSo.jpg', '2026-01-05 13:08:47', '2026-01-05 13:37:56'),
(35, 53, 'Muhammad Fahmi', '6472062001010003', '0010259768', 'SMA/SMK Sederajat', 'SMA MA\'ARIF SAMARINDA', 'ILMU PENGETAHUAN SOSIAL', '085185948789', 'Laki-laki', '2001-01-20', 'SAMARINDA', 'Islam', 'JL. SLAMET RIYADI NO. 1 RT. 12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/nXSjoiwKw6YOoD8SmRWlPosqABNVRGbGpKUf2O12.jpg', 'students/kk/tULRKVXlKU3zu8gbnDqe9xy2hF6l4cJT8clTU0uu.jpg', 'students/ktp/Ke4sL71ZaGZS0U8yw9oRbYwDLnCVMVsDY6mOzoVY.jpg', 'students/certificates/BeBgxZlCxB85pokMobxY3gRamvEAMFi4yQslbVdX.jpg', '2026-01-05 18:06:42', '2026-01-09 16:16:30'),
(36, 54, 'Sahrul halil', NULL, NULL, NULL, NULL, NULL, '087850933180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-05 20:30:09', '2026-01-05 20:30:09'),
(37, 55, 'Yunitha Hapsari Hidayat', '6402037006060004', '0063951695', 'SMA/SMK Sederajat', 'SMK FARMASI SAMARINDA', NULL, '083130670823', 'Perempuan', '2006-06-30', 'Loa Duri Kutai Kartanegara', 'Islam', 'jl.gerbang dayaku gg mahakam 10 rt03 loa duri ulu kec loa janan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/5zdb3WMuN3469p6W1hln5LUcjaSrheNgc4ehDBkn.jpg', 'biodata/kk/8T2yTp0lwTnjraB1dgFCqscsGE3GfJpjPilZj9ms.jpg', 'biodata/ktp/Ksn50suTFXn06mB4KdkMcqK4GnBt9VHYAp84tfXO.jpg', 'biodata/certificates/BVoXyJGQv1ttUeWRuh6A1OLi1qBFr74MTYLBZXkr.jpg', '2026-01-06 16:01:33', '2026-01-06 16:09:02'),
(38, 56, 'M. FAUZAN DIYANTO', '6402152112050001', '0052531311', 'SMA/SMK Sederajat', 'SMKN 1 SANGA SANGA', NULL, '082255374647', 'Laki-laki', '2005-12-21', 'SANGA SANGA MUARA', 'Islam', 'Jl.Budiono RT,02 Sanga-sanga muara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/WaitewoeyocAdoZTtbQLcpADZGRPsUYfZo1WSbA6.jpg', 'biodata/kk/gDxzLHAfNJhnBx5bbQya4JTbt8hLHJ4dIPfMOckA.jpg', 'biodata/ktp/YiHDL0XxMwUGCY7fAFPIWUCMYw0SBN3xQnupogvA.jpg', 'biodata/certificates/10xtt1MgfvkcUYhBfV7gCTHi28PAbmsA5EPwIpoi.jpg', '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(39, 57, 'Ahmad zaini', '6402131509010001', '0010147821', 'SMA/SMK Sederajat', 'Smk pesisir samboja', 'Administrasi perkantoran', '081254632095', 'Laki-laki', '2001-09-15', 'Martapura', 'Islam', 'Sei tanggi rt 2,kel. Handil baru, kec. Samboja, Ku-kar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/mtLEQmQ20Z5O9MJNzf2IQNSIUv0xHfPbVC5C5RaD.jpg', 'students/kk/PNAijOpIydiyCem1jbVQju42gHuXLuAvHHcz2P8e.jpg', 'students/ktp/pf8S6KAJlS9nLkmwHIW83Ljzb9c3vAZDBLNa3nOZ.jpg', 'students/certificates/7sIFVnnzxwJLrUuPuCuBmalHRVAFelBkp7Tp78lY.jpg', '2026-01-07 17:34:49', '2026-01-07 17:44:00'),
(40, 58, 'HUSNI MUBARAK', NULL, NULL, NULL, NULL, NULL, '081347159070', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-09 04:06:38', '2026-01-09 04:06:38'),
(41, 59, 'Nadya salwa maharani', '6472026806060005', '0061352892', 'SMA/SMK Sederajat', 'SMKN 8 Samarinda', 'Otomatisasi tata kelola perkantoran', '089526615664', 'Perempuan', '2006-06-28', 'samarinda', 'Islam', 'jl.mangkupalas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/NVPysVIAlvNHzjmjIkRsEzxmbJXcJTC3DmA0Hj61.jpg', 'students/kk/gMVp53Ej6HIMKwRBxO8iFgOpI08vOHaL0kqwqLEu.pdf', 'students/ktp/C5ph2kjL7BdYAI960y4mhbU5gIudbvXfW3W3mtCh.pdf', 'students/certificates/GV0X2HfFmsgO0K9ABa0yuX4vASVyQ4Fm1uNrpzJl.pdf', '2026-01-09 18:39:47', '2026-01-09 19:31:03'),
(42, 60, 'Selviana rahmadani', '6472024310060004', '0069252883', 'SMA/SMK Sederajat', 'SMAN 4 Samarinda', 'IPA', '085393356619', 'Perempuan', '2006-10-03', 'Samarinda', 'Islam', 'Jl mas penghulu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/H7LACUmO3ckG4GITHh045lmWxgGMRg0zh2x3ioiv.jpg', 'students/kk/17PNRc1r41pyWXQyUyALFvWcJUhbjS6EnMzpC2aD.jpg', 'students/ktp/ejwJ01p1Wo8enfUqEAHKkFlPssx70Dg130NHhCRI.jpg', NULL, '2026-01-09 18:41:19', '2026-01-09 19:25:31'),
(43, 61, 'fitra ainun bukari', NULL, NULL, NULL, NULL, NULL, '085845917001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-09 19:23:19', '2026-01-09 19:23:19'),
(44, 62, 'SHANDY BAGUS NUR RAHMAD', NULL, NULL, NULL, NULL, NULL, '087887099742', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-09 22:18:57', '2026-01-09 22:18:57'),
(45, 63, 'Amelia Rahma', '6472036205080003', '0085913806', 'SMA/SMK Sederajat', 'SMK NEGERI 17 SAMARINDA', 'Farmasi', '085182334491', 'Perempuan', '2008-05-22', 'Samarinda', 'Islam', 'Jl.P.Antasari Gg.6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/D553FZj3N30gVodCV2SkrTBZOZ5XqyTbD9rNzTPm.jpg', 'students/kk/6ngD7MPuKkufhFFRzLXUE11Y6UPmuc1HQCo84eQS.jpg', 'students/ktp/dtSnLmbyrIEnfRCcOnQXp7IT6VKsTUFzTvdczJr2.jpg', NULL, '2026-01-09 22:27:48', '2026-01-09 23:13:47'),
(46, 64, 'Siti Aisiyah Maura Bunga Meyriska', '6472036905080001', '0081877105', 'SMA/SMK Sederajat', 'SMK NEGERI 17 SAMARINDA', 'FARMASI', '082159049201', 'Perempuan', '2008-05-29', 'Samarinda', 'Islam', 'JL. KS. TUBUN DALAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/q7cqMtNudS8NatqjtOmwdrwDWAe3gjWQKVoK3N6I.jpg', 'students/kk/buSidxQZMrRDDXKrlOiVSjIuRt1teNuUThPypOCu.jpg', 'students/ktp/mbSk39tSWPreaI7SrICU2uY2V0DtFPbz7pAqqxm0.jpg', NULL, '2026-01-09 22:29:18', '2026-01-09 23:17:10'),
(47, 65, 'NUR WAFIQ AZIZAH', '6402114407030003', '0034861436', 'SMA/SMK Sederajat', 'SMA NEGERI 1 MUARA KAMAN', NULL, '082254265670', 'Perempuan', '2003-07-04', 'MUARA KAMAN', 'Islam', 'JL. MULAWARMAN DS. SUMBERSARI KEC. SEBULU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/iX6XSHixsL0TxT8moVpXVHLTfrCuiQI6EtcxAn5Q.jpg', 'biodata/kk/l7BsxT3vXztfpwW3N0smt5DtkopaLmqal7EuSnVG.jpg', 'biodata/ktp/QiZJPHGdGuv6Y3hWgsdNiKxSBEhc1S3pG0lZgwXh.jpg', 'biodata/certificates/MmMVKSX80Ls4KBrsTucsJSlUFA2eh17WAHRtcY30.jpg', '2026-01-09 23:19:36', '2026-01-09 23:30:46'),
(48, 66, 'Cinta', NULL, NULL, NULL, NULL, NULL, '085256927248', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-10 00:15:38', '2026-01-10 00:15:38'),
(49, 67, 'Cinta', '6472025310207000', '0077317590', 'SMA/SMK Sederajat', 'SMKN 8 Samarinda', 'akuntansi dan keuangan', '085256927248', 'Perempuan', '2007-02-13', 'samarinda', 'Islam', 'jl. mas penghulu gg. hm. idris', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/w9lXPa03JHNcSgGxr5YGS36OZ6mkqtLXlxJO2njW.jpg', 'students/kk/bkEnNg509v50pgzFg9V0IOtIJSfeFVmxkGnXanaC.jpg', 'students/ktp/06eym5PIsDkHpvNPFzamacSBoXTd4RJzFe40d5AF.jpg', 'students/certificates/GWEpQ4GPOlROnmkLO4TLhS53L96ro66klwl9gNNo.jpg', '2026-01-10 00:18:08', '2026-01-10 00:58:57'),
(50, 68, 'Desty Amanda Lukman', '6472054812050004', '0059070301', 'Paket C', 'Pusat Kegiatan Belajar Masyarakat Yukitablajar', 'IPS', '085751529642', 'Perempuan', '2005-12-08', 'Samarinda', 'Islam', 'JL. KH. USMAN BERAHIM, RT.14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/13YubxrgqFqHjpyPqvudKuzSeo3us5sAnmFArmSb.png', 'students/kk/nkbP74rhx66mHGfTfiKQsZL8R1K2X9EjRfIb6gFt.jpg', 'students/ktp/P8QWWuruaxO77lTMMZrHkavSDD9PyDoPnxr57WwE.jpg', 'students/certificates/QVgk2yvvqpk6sOYDKnWauKpMqQ19Yr3Ugbm3NdUx.jpg', '2026-01-10 00:35:15', '2026-01-10 23:03:22'),
(51, 69, 'Heri Purnomo', NULL, NULL, NULL, NULL, NULL, '082260704959', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-10 01:17:06', '2026-01-10 01:17:06'),
(52, 70, 'iisSetianah', NULL, NULL, NULL, NULL, NULL, '+6282155588906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-10 21:35:08', '2026-01-10 21:35:08'),
(53, 71, 'Ahmad Jefri Murtadho', NULL, NULL, NULL, NULL, NULL, '083141638159', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-11 00:22:32', '2026-01-11 00:22:32'),
(54, 72, 'Nurul Azizah Azzarah', '6472036506080005', '0082226430', 'SMA/SMK Sederajat', 'Smk Negeri 17 Samarinda', 'Farmasi', '083894783725', 'Perempuan', '2008-06-25', 'Samarinda', 'Islam', 'Harapan baru Jl. Jati II Loa janan ilir rt. 027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Dgd0bbAFh1bKUb8XBOjT9nzXD097iXRLm5JaCko3.jpg', 'students/kk/JEoCoSg7Z1e0EPPlmGzkme805BCqSXovCUxMLEmU.jpg', 'students/ktp/C3Q6wEETxZhrkl9DE7gTL19nQK4sBJ19dMViYzjc.jpg', NULL, '2026-01-11 01:17:05', '2026-01-11 01:44:25'),
(55, 73, 'MUHAMMAD NANDA BASTIAN', NULL, NULL, NULL, NULL, NULL, '08225572279', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-11 09:46:57', '2026-01-11 09:46:57'),
(56, 74, 'Enggal Wrihatnolo', '6472030707010001', '0010258834', 'SMA/SMK Sederajat', 'S', 'Teknik Audio dan Video', '089654807163', 'Laki-laki', '2001-07-07', 'Samarinda', 'Islam', 'Jl. Trisari RT 21 No 29\r\nKelurahan Sidodadi \r\nKecamatan Samarinda Ulu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/N2xycLmkAfZQxTK6wSAN1UFHx0btV1qZ5DsrlS7M.jpg', 'students/kk/kKy6ChTFn1l6b8g3kWBOz2CHps7jvr0bBPqK829p.jpg', 'students/ktp/GqsujiMo77D4JaGi0TZNjKMEcfzFC4j30ZEgnuKf.jpg', NULL, '2026-01-11 17:57:18', '2026-01-13 03:55:10'),
(57, 75, 'Dinda Aprilly arham', '6472056104000008', '0005081989', 'SMA/SMK Sederajat', 'SMA negeri 16 Samarinda', 'Ips', '0882022601734', 'Perempuan', '2000-04-21', 'Samarinda', 'Islam', 'Jalan sejati gang rambai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/VQ7jbBomq8dOWy7kwkzMKmtZ3roPQxSYUfIM3eho.jpg', 'students/kk/9CtBBwuz2xNwmITE2adDsm5ZfXCSU6XR7CtS2VQS.jpg', 'students/ktp/kfQNtffgLjo33REXVioENPXsCi6hNDjhhhnmPUSz.jpg', 'students/certificates/fvNSm9ioNcFIMtgS7eY9XEtmMWXFoEAGnGn1RjLe.jpg', '2026-01-11 19:45:45', '2026-01-11 20:00:59'),
(58, 76, 'karin aprila', '6402024804070001', '0073925820', 'SMA/SMK Sederajat', 'Sma Negeri 5 Samarinda', 'IPA', '083190932564', 'Perempuan', '2007-04-08', 'Samarinda', 'Islam', 'JL. P. SURYANATA GG. 9 RT 27 AIR PUTIH SAMARINDA ULU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/DV9e5kwcjpWKaL7RWKh12TpxyC1EIxI3aG1o96YR.jpg', 'students/kk/fDyaO0hH4hJ2LcZS57w9W5J7DahN0HmSHX11mF8h.jpg', 'students/ktp/gYY4tY6vhA0zVnS2cU1iXHxoE7znURmdLfeg3V6N.jpg', 'students/certificates/Sug71IvrRlUfImUqurz0WELK3BRZcNLn80iLXIKz.jpg', '2026-01-11 20:07:03', '2026-01-12 05:59:14'),
(59, 77, 'Inzalna', NULL, NULL, NULL, NULL, NULL, '085820766365', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-12 05:35:10', '2026-01-12 05:35:10'),
(60, 78, 'risna mangindara', NULL, NULL, NULL, NULL, NULL, '088242026730', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-12 19:22:04', '2026-01-12 19:22:04'),
(61, 79, 'Arma Wati', NULL, NULL, NULL, NULL, NULL, '083812754543', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-13 01:42:44', '2026-01-13 01:42:44'),
(62, 80, 'RIZKYNA RAMADHANI', NULL, NULL, NULL, NULL, NULL, '085020401755', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-13 19:22:54', '2026-01-13 19:22:54'),
(63, 81, 'Muhammad adam', '6402032801040002', '0040471661', 'Paket C', 'PKBM BUMI ETAM', 'ips', '083877731362', 'Laki-laki', '2004-01-28', 'Bakungan', 'Islam', 'Jl.Gerbang Dayaku', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/8sIyaSZ24H8Erk6M4wVczb8mw5iJDDeKHtt9atuU.jpg', 'students/kk/QCB8Gt6HuArLDiBg3UTXBBfNnYrTuh5fbkoferdS.jpg', 'students/ktp/MfmObjily1kzCO1GPgMCsbSCd9w3MnoS3JnVbtyC.jpg', 'students/certificates/iWLXLmEaahRyhsqtPyz2tDmVY33Rwt9L0nwIlwEA.jpg', '2026-01-14 01:56:59', '2026-01-14 02:03:39'),
(64, 82, 'Iis Setianah', NULL, NULL, NULL, NULL, NULL, '+6282155588906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-14 19:35:20', '2026-01-14 19:35:20'),
(65, 83, 'Raudah nur fauziah nisa', '6471056810030004', NULL, 'SMA/SMK Sederajat', 'SMK negeri 1 muara jawa', 'Asisten keperawatan', '085820942765', 'Perempuan', '2003-10-28', 'Balikpapan', 'Islam', 'Jln Mulawarman rt11 handil baru kecamatan samboja Kutai katanegara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Lm23l0RQFuHsBnzTdZRI9qlXnFXojxlDR2jXklov.png', 'students/kk/4jK5WpMdy76LREkTZs86XKGAyz7ELhS9DKWb7QDG.png', 'students/ktp/IHUu4FwSC2DXBIgsnMizyWN3jsBFuMsCoSikzRI2.png', 'students/certificates/rxIf3quidRCcnjTdY0bHLvU8Z9XMroQd9D2epBAk.png', '2026-01-14 21:59:43', '2026-01-14 22:05:25'),
(66, 84, 'ANDRA SATRIANIE RASYID', '6472022304010001', '0010274258', 'SMA/SMK Sederajat', 'SMKN 2 SAMARINDA', NULL, '085219460661', 'Laki-laki', '2001-04-23', 'SAMARINDA', 'Islam', 'JL. CIPTO MANGUN KUSUMO LOA JANAN ILIR SAMARINDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/Sc7HtRvDClVJ5l5Y6YPICXBBrZ00Qe42eF32uGUa.jpg', 'biodata/kk/pr0oA6F2jP58LhMlzSlGX6AzZ05QUbQptUiVjA8k.jpg', 'biodata/ktp/LDW1zt0rDI7Wemb6UO6H9hJ1St3aBehWlbG9XLTV.jpg', 'biodata/certificates/P8KAEq35ypwYFj0mm5tNYR3BS4GaYETQbKTiDGIq.jpg', '2026-01-14 22:29:49', '2026-01-14 22:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `student_parents`
--

CREATE TABLE `student_parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_biodata_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('ayah','ibu','wali') NOT NULL,
  `name` varchar(255) NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `is_alive` tinyint(1) NOT NULL DEFAULT 1,
  `education` enum('tidak_sekolah','sd','smp','sma','d1','d2','d3','d4_s1','s2','s3') DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `income` enum('tidak_berpenghasilan','kurang_500rb','500rb_1jt','1jt_2jt','2jt_3jt','3jt_5jt','lebih_5jt') DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_special_needs`
--

CREATE TABLE `student_special_needs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_biodata_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('tidak_ada','tunanetra','tunarungu','tunawicara','tunadaksa','tunagrahita','tunalaras','autis','adhd','kesulitan_belajar','down_syndrome','lainnya') NOT NULL DEFAULT 'tidak_ada',
  `description` text DEFAULT NULL,
  `assistance_needed` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nim` varchar(9) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'student',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `nim`, `phone`, `role`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@unukaltim.ac.id', NULL, '081155664477', 'admin', '2025-12-13 01:47:43', '$2y$12$sIlHNsGX1IqJU9wWEVP8c.iF1CslG6ixfm7OiKyGZeLVUfLtOf6Di', NULL, NULL, NULL, NULL, '2025-12-11 06:52:02', '2025-12-13 22:19:43'),
(3, 'tes', 'tes@mail.com', NULL, '081213141516', 'student', NULL, '$2y$12$2I.oEw3NT9TF6GNDh2I0VuW7prw6pC.vLJAsgtJ83vB2ofuTSM0zG', NULL, NULL, NULL, NULL, '2025-12-11 06:59:48', '2025-12-11 06:59:48'),
(4, 'Miftahurroyyan Al Hasan', 'royyandalhasan@gmail.com', NULL, '082197658372', 'student', NULL, '$2y$12$zK30sxpCoB.E4CKaUrJUC.97RhVM3DRlYiwVJuFr6AOXSkaeaZHs6', NULL, NULL, NULL, NULL, '2025-12-11 07:28:40', '2025-12-11 07:28:40'),
(8, '1234567Patimah', 'patimahlim62@gmail.com', NULL, '081322915486', 'student', NULL, '$2y$12$DXaj/WMRBp7aWgxLxZyYNuXdv6qVhlsXOKNKA/PhR.zo8Mqz.ztTu', NULL, NULL, NULL, NULL, '2025-12-12 11:16:19', '2025-12-12 11:16:19'),
(9, 'teslagi', 'tes@exmail.com', NULL, '081213251513', 'student', NULL, '$2y$12$gwY.s6XnWbqKy5EbF3hlJuPd9IpwhkRacyVeLwzNSbkbbwRnsblfa', NULL, NULL, NULL, NULL, '2025-12-12 12:56:00', '2025-12-12 12:56:00'),
(11, 'Wulandari', 'wulandariiii1801@gmail.com', NULL, '083894877734', 'student', NULL, '$2y$12$WmVjyBSE6FCQ1IOJ6mqIzuqg54NtqklK8GmLFCI14QAEMfqikohVG', NULL, NULL, NULL, NULL, '2025-12-13 01:45:55', '2025-12-13 01:45:55'),
(12, 'Wulandari', 'wulann1810@gmail.com', NULL, '083894877734', 'student', '2025-12-13 01:47:43', '$2y$12$VNm/0bHtm2gUJihSbeDOdOhvfC92MdYu8.EyIG99OZq.2AFcgou0q', NULL, NULL, NULL, NULL, '2025-12-13 01:46:25', '2025-12-13 01:47:43'),
(14, 'Terima Gaji', 'raya@unukaltim.ac.id', NULL, '00000009999', 'student', '2025-12-13 21:25:28', '$2y$12$xlZ703/LVBLOWExZp4Ar8OCjvfiaMcpMR2ncfLhd84b9/ftfOpRYq', NULL, NULL, NULL, NULL, '2025-12-13 21:24:45', '2025-12-28 09:09:05'),
(16, 'Keisya Nur Alya', 'keisyanuralya0@gmail.com', NULL, '081521711804', 'student', '2025-12-14 07:32:58', '$2y$12$xllSYVPPkzCTpQ/XLU8s0OfLCW2SX7tQxqCBH2L8D.rMFPSvAyrE2', NULL, NULL, NULL, 'YAJByxtyh1DNibGUYtikG5xYH5A15OIkX1f1iJMHsy5a344VoqRGjVwIFwLf', '2025-12-14 07:31:42', '2025-12-14 07:32:58'),
(17, 'PMB UNU KALTIM', 'pmb@unukaltim.ac.id', NULL, '-', 'staff', '2025-12-14 13:45:14', '$2y$12$fKfSBershUG375WI.ZSJu.FrBGtGB3agP8LGlaXvpjBvIfJX7UEo2', NULL, NULL, NULL, 'sgc1iEL4mcGUWEtJvewgHAivUZosXvmJ7zDZFsRCOwV3B3a0maobvdGXN1rr', '2025-12-14 13:45:14', '2025-12-14 22:39:48'),
(18, 'Sindiya kartika', 'sindiyakartika34@gmail.com', NULL, '085163137202', 'student', '2025-12-15 03:28:39', '$2y$12$ly4fNnBXGYPYif68qCJn1OsFLfNQAwFFbxjWxclNjJlPZ8Mc.oaaa', NULL, NULL, NULL, 'wcuBGpB64pOTc3R68Uht4GIpnvD9nk1MFeb5ndeqmt3s34S5SnN7tJUniBEI', '2025-12-15 03:25:23', '2025-12-15 03:28:39'),
(19, 'Muhammad Raihan Pratama', 'muhammadraihanpratama23@gmail.com', NULL, '081256538995', 'student', '2025-12-16 01:17:42', '$2y$12$QTkiBoYgkIIADjbrhgOk0e5fmFX66zVXg9E5KOYkaOLb/tDWswZHe', NULL, NULL, NULL, 'xWNMHhajAzlXRWX0tCgoNYQoHLxWh7rL1SfVIk0YpJF2Oi7Lr8hLBDMlp7oJ', '2025-12-16 01:16:36', '2025-12-16 01:17:42'),
(20, 'tes', 'rezamuhammad980@gmail.com', NULL, '08164500575', 'student', '2025-12-16 02:01:53', '$2y$12$2iJeAbMvrBi/GjsO7GdIvukx9ZZxkuhdsNY9ah8hQHfY7W9xxIpbi', NULL, NULL, NULL, NULL, '2025-12-16 02:01:36', '2025-12-16 02:01:53'),
(21, 'kapunkapmoi', 'rayafachreza739@gmail.com', NULL, '09990000888', 'student', '2025-12-16 02:20:45', '$2y$12$zXLs.Us0Hhuyxf1XNJ9jVuU7QLeoNv3UEdvOr2Jd4fojyiRPiTYqG', NULL, NULL, NULL, NULL, '2025-12-16 02:18:57', '2025-12-16 02:20:45'),
(22, 'IKWALUDIN IRKHAMNI', 'ikwaludini@gmail.com', NULL, '083852596613', 'student', '2025-12-16 21:59:18', '$2y$12$qU0AjNX3rssjnYXVdq1mBusUNovMgZXBAJhNcwbXaJZ2QlUsUgGyK', NULL, NULL, NULL, 'AXp1dDjn99MP9zWGEwkpn2UXxWmMpOZT5seEDoME0LC3gxgNqUV2pvcNCSRu', '2025-12-16 21:55:26', '2025-12-16 21:59:18'),
(23, 'Mouhammed Zidane Basayev Al Usman', 'zidanbasayev7@gmail.com', NULL, '087715729215', 'student', '2025-12-16 22:31:09', '$2y$12$PW/jiamA6f1/jJMWPOacyOlxB5C59aL8p5gsdSF1fN1ojLbIaBNLq', NULL, NULL, NULL, NULL, '2025-12-16 22:30:35', '2025-12-16 22:31:09'),
(24, 'WR 1', 'wr1@unukaltim.ac.id', NULL, '080000000000', 'staff', '2025-12-16 23:38:43', '$2y$12$es48CvnMfpfsFFGnNqG7eOK3pvyXp3vxWSWFwssd0Z9.mVKGRY8u6', NULL, NULL, NULL, 'p12lWwMTtqE1MwJKGMxzYcUXdvd2WwTko4AG4ZOs5YSsSt66abgABsjZm3bj', '2025-12-16 23:38:43', '2025-12-16 23:38:43'),
(25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', 'shevapratama946@gmail.com', NULL, '085750296152', 'student', '2025-12-17 09:24:24', '$2y$12$ctZ22aZ.AkW4e1LUDSZ5Fut2sCFUxFvWE7M9ElBnxsHYDET06exi2', NULL, NULL, NULL, 'Q3WvUjJLgZvFuubswOf6OPEBTHH85GflSI5WQ6Q3yQ8hPQ6FnZ4baAw9UMjy', '2025-12-17 09:23:33', '2025-12-17 09:24:24'),
(26, 'Emilda Ainun alzahra', 'emildaazzahra79@gmail.com', NULL, '085934592604', 'student', '2025-12-18 02:24:38', '$2y$12$gg0n0K46o47gwDxHAEOrQOUnsHYxMyVt7rX7tJhDzfo2Q0QpBUu.6', NULL, NULL, NULL, NULL, '2025-12-18 02:11:24', '2025-12-18 02:24:38'),
(27, 'rizalmulyono', 'ka.upm.feb@unpad.ac.id', NULL, '08564789632', 'student', NULL, '$2y$12$wkIx2Z4ws7.0pwYftQhXFO.f1htJ5svhwwBGfe.bX9keBq2oLrL3G', NULL, NULL, NULL, NULL, '2025-12-18 09:52:06', '2025-12-18 09:52:06'),
(28, 'Eka putri nur aisyah', 'ekaputrinuraisyah2@gmail.com', NULL, '085822516904', 'student', '2025-12-19 09:26:31', '$2y$12$Bs/gQJCaz8nZeueC0peKz.tzCwqBSqGl/.8eOIeftqZwX9QnmgG76', NULL, NULL, NULL, 'xZZk0tGw5bKIs4eCavVPtXadCgYfpItIlekrIYzNAojBMeE6BEgCRJvLcUUz', '2025-12-19 09:25:13', '2025-12-19 09:26:31'),
(29, 'Egha Aulia Renatasari', 'eghaauliaaa@icloud.com', NULL, '082255726898', 'student', NULL, '$2y$12$Q8CXctEVlYfw8nOsVnCTqOA3p1ANSy8PGZwzmPccv56P1ySCENPg6', NULL, NULL, NULL, 'CRVlyWOWGv5CLtTj4EvS8yTsAUg0G8ahORx3rIu3YeB2YsLMiYPScD4GsGsR', '2025-12-20 03:51:03', '2025-12-20 03:51:03'),
(30, 'Egha Aulia Renatasari', 'auliaegha045@gmail.com', NULL, '082255726898', 'student', '2025-12-21 02:06:11', '$2y$12$Gbc7sHFv4KSxUSNvZura3uMXFLDq2gEscEDpA816tqkUbKbpygB/u', NULL, NULL, NULL, 'fyW6t6sCw7mGTJRPIqM1nSkXlBGb98Uj9isyQTg0DW7b4qRrTtwsSSbQd20p', '2025-12-21 02:01:51', '2025-12-21 02:06:11'),
(32, 'DHINI ALEXANDRA KUMALASARI', 'ghinaahyti03@gmail.com', NULL, '0895 3443 22525', 'student', '2025-12-22 00:27:28', '$2y$12$eHXIrVz7IOWnXYRJhYxyAOgYCWk01vuuCrqoloJbERDGyuAJH.JZC', NULL, NULL, NULL, NULL, '2025-12-22 00:27:28', '2025-12-22 00:27:28'),
(36, 'ALVIN', 'anaksultan2708@gmail.com', NULL, '+62 851-8498-4637', 'student', '2025-12-22 05:06:19', '$2y$12$Tei/9jSGqFMnsjBKjFjgZurCjQ.TP3GtHP4e/0TAqrG.Qg6Xenzay', NULL, NULL, NULL, NULL, '2025-12-22 05:06:19', '2025-12-22 05:06:19'),
(37, 'Dhava ade syawaluddin', 'dhavaade112@gmail.com', NULL, '085651251219', 'student', '2025-12-23 00:39:19', '$2y$12$xPeFVtHde9NQyZq.O3Pf.u5PFebtHJtHH5l91f7NK6ZxsTJ5NSF02', NULL, NULL, NULL, 'ApyiOuzElTar6THQGnNedIGsf5xA2AzJsqAQpcSAclGuHceV75VTO6xCWDkM', '2025-12-23 00:38:18', '2025-12-23 00:39:19'),
(38, 'Nurul alfira', 'nurul.alfira048@gmail.com', NULL, '085183040894', 'student', '2025-12-23 01:11:58', '$2y$12$0p4gSqg.6dv3.XSWOmibYuHYRBTRYR6H9XI.CrqeaTFbbrl7SC/E.', NULL, NULL, NULL, NULL, '2025-12-23 01:11:13', '2025-12-23 01:11:58'),
(39, 'Nur Ayu Syafutri', 'ayusyahfutri479@gmail.com', NULL, '082154177300', 'student', '2025-12-24 02:28:11', '$2y$12$489UjJ0BAjO9p/VcK5hlCuPgIxGiP6U/0ymmxt.7gAKkaKkOfpNEq', NULL, NULL, NULL, 'AZQNnvo96q3nQtRhCZ8uErXnGArSBvmnuvQwpzfDahHM64Ni9e0MLxlt3Ujg', '2025-12-24 02:21:38', '2025-12-24 02:43:34'),
(40, 'Anita Ardian', 'anitaardian680@gmail.com', NULL, '085651337295', 'student', '2025-12-25 09:38:43', '$2y$12$wzCkco3gnhNQQHeJtG/8BO6wvL05OG4wfA7/.W/EKL/sHpTY/a6/C', NULL, NULL, NULL, NULL, '2025-12-25 09:38:20', '2025-12-25 09:38:43'),
(41, 'Xaviera Fowlers', 'rezamuhammad981@gmail.com', NULL, '08123344556', 'student', '2025-12-27 03:05:47', '$2y$12$pA4mhfb1DOTrBcxPr9L7VOw.rSUW9843qxHZPU9dldyJ8q.FeUGfu', NULL, NULL, NULL, NULL, '2025-12-27 03:04:52', '2026-01-04 18:15:00'),
(43, 'SILVANA TIARA ANGGRENI', 'tiaraalaaa5@gmail.com', NULL, '081549738581', 'student', '2025-12-30 08:20:05', '$2y$12$tJwWM6za8xxxdtb1Kb7uGeIx2xWu8b4jlJ7EdsTq2peA6bSEHzT4u', NULL, NULL, NULL, NULL, '2025-12-30 08:20:05', '2025-12-30 08:20:05'),
(44, 'RIDWAN', 'ridwanalbugisi686@gmail.com', NULL, '081255422011', 'student', '2025-12-30 13:12:45', '$2y$12$wALC5W1WWtIzAfAX6lFNyOUKAbeA3KujhxAiSlvqzZ7WfS8qi8aq.', NULL, NULL, NULL, NULL, '2025-12-30 13:12:45', '2025-12-30 13:15:18'),
(45, 'ABRIAN ISLAMI PERKASA.S', 'arbianperkasa27@gmail.com', NULL, '082252542337', 'student', '2026-01-04 10:11:10', '$2y$12$aGfEhQb/uwBG2uIIDA9TeeP7YaS7DxurmBfRz5SBSS2az4N5fOBdK', NULL, NULL, NULL, '60oavblXESK9OAst3VfKnzqoBcY42A4COZsQaEc2AMv0gnUZZce5r9D0E4E6', '2026-01-01 10:23:31', '2026-01-04 10:11:10'),
(46, 'ABRIAN ISLAMI PERKASA.S', 'bggusk123@gmail.com', NULL, '082252542337', 'student', NULL, '$2y$12$RYOoOu0po19IYCfVDGeO3upy9Lkhs5/FAb.IQNSomwbqT0s5fbO0.', NULL, NULL, NULL, NULL, '2026-01-01 10:27:08', '2026-01-01 10:27:08'),
(47, 'FADHILAH RAMDANIAH', 'ramdovan1215@gmail.com', NULL, '082150207691', 'student', '2026-01-01 13:34:48', '$2y$12$uPtcmyVDXdWWSgqH4nKaeOvwafceF.jtADu64BhWKmZH8j87uMqd.', NULL, NULL, NULL, NULL, '2026-01-01 13:34:48', '2026-01-01 13:34:48'),
(49, 'ISMAIL HASAL AL - AZZAM', 'ismahariyanto@yahoo.co.id', NULL, '081522546898', 'student', '2026-01-02 08:02:40', '$2y$12$z54YLEJtz/w3/s3zfs6AMO16MMeFDkI.BB4YbtB.S4QhM33Hjbs52', NULL, NULL, NULL, NULL, '2026-01-02 07:51:43', '2026-01-02 10:06:47'),
(50, 'JULIANDA FEBRIANNUR', 'jabosawung552@gmail.com', NULL, '081255758610', 'student', '2026-01-02 15:45:30', '$2y$12$plgdJCcj.OOsFgky6d9/mO4YiX7Q3sUk39r15zeDWxOUC10.YgkdO', NULL, NULL, NULL, NULL, '2026-01-02 15:45:30', '2026-01-02 15:45:30'),
(51, 'FAUZIAH MAULIDYA', 'fauziahmaulidya22@gmail.com', NULL, '082157598157', 'student', '2026-01-04 13:38:57', '$2y$12$czsbWSdKwh6yzbnDSTKVoOD3jm/CfYyJENRuZloRfpugskDXemEs2', NULL, NULL, NULL, NULL, '2026-01-04 13:38:57', '2026-01-04 13:38:57'),
(52, 'Jannatul aulia', 'auliajannatul731@gmail.com', NULL, '085750314922', 'student', '2026-01-05 13:10:46', '$2y$12$gpVOGOu9XjD/Nz2qAzWmBeXAPIR3Z5SsIDCfqu2jsl0VL9OhoE4ea', NULL, NULL, NULL, 'yhKAZzjMICWoo3dzFE2CAROYX1dmgidLVblSKP2T9iLFqSngMJlHsEQtDFWq', '2026-01-05 13:08:47', '2026-01-05 13:10:46'),
(53, 'Muhammad Fahmi', 'mfahmiel024@gmail.com', NULL, '085185948789', 'student', '2026-01-05 18:11:24', '$2y$12$ySDk8WYAG3BKsmn5u8xgjOFA9v2Vfl5g6Z.36FN5qR/EklND2gRSa', NULL, NULL, NULL, 'h1hvw8vHwT7iCCEntGGp5TwDJAM2vRiCfQHKitdn2dmdzmukChHYi0o89FIe', '2026-01-05 18:06:42', '2026-01-05 18:11:24'),
(54, 'Sahrul halil', 'halilsahrul932@gmail.com', NULL, '087850933180', 'student', '2026-01-05 20:31:16', '$2y$12$3fGuXXz8f9eu06BxonG1Q.oeIVJVNGz8dteplnhJmWBZD/g/VXENS', NULL, NULL, NULL, NULL, '2026-01-05 20:30:09', '2026-01-05 20:31:16'),
(55, 'Yunitha Hapsari Hidayat', 'yunitahapsari851@gmail.com', NULL, '083130670823', 'student', '2026-01-06 16:01:33', '$2y$12$TfDwn8RBiZL/7kBYvPEDIu9mD2lYbxh/GiTkSfxHCQhr0qwO89Enm', NULL, NULL, NULL, NULL, '2026-01-06 16:01:33', '2026-01-06 16:01:33'),
(56, 'M. FAUZAN DIYANTO', 'fauzanx83@gmail.com', NULL, '082255374647', 'student', '2026-01-07 00:14:43', '$2y$12$KhNGSs7iXAIsAitgF3eN3.Opb/UQC9b8rVTjaM1S/NSfnLQoQS0tS', NULL, NULL, NULL, NULL, '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(57, 'Ahmad zaini', 'a.zaini89@yahoo.com', NULL, '081254632095', 'student', '2026-01-07 17:35:30', '$2y$12$NkO5QkUwJi2uj6a0mBL6l.7CTZsZwuhgOANKlOMknTlXg6T4CPK36', NULL, NULL, NULL, NULL, '2026-01-07 17:34:49', '2026-01-07 17:35:30'),
(58, 'HUSNI MUBARAK', 'husnimubarakcfc11@gmail.com', NULL, '081347159070', 'student', '2026-01-09 04:06:58', '$2y$12$ZYGlP4pSAaI9kxb8nO.MVu2vQ8oWIO9/GaQIPrazM1ArgVDv2Jydq', NULL, NULL, NULL, NULL, '2026-01-09 04:06:38', '2026-01-09 04:06:58'),
(59, 'Nadya salwa maharani', 'nadiyasalwamaharani28@gmail.com', NULL, '089526615664', 'student', '2026-01-09 18:40:31', '$2y$12$4bUDE2GIPqi6o07CsnVkiOzM.QopAKKfk5uHCrZuH2fVAvHXEqlJi', NULL, NULL, NULL, NULL, '2026-01-09 18:39:47', '2026-01-09 18:40:31'),
(60, 'Selviana rahmadani', 'selvianarahmadani08@gmail.com', NULL, '085393356619', 'student', '2026-01-09 18:42:03', '$2y$12$IyEHBMUbL2ycunfsFQbyS.zHBptMXiZuJOQqCFW6EWDtu0bGzsmgu', NULL, NULL, NULL, NULL, '2026-01-09 18:41:19', '2026-01-09 18:42:03'),
(61, 'fitra ainun bukari', 'ainunbukhorifitra@gmail.com', NULL, '085845917001', 'student', '2026-01-09 19:25:29', '$2y$12$zQBzI5pvl0oxui8wOfQ/4.uEl0GLG.6J/9Eks.Dp/KG24lNTcHxeq', NULL, NULL, NULL, NULL, '2026-01-09 19:23:19', '2026-01-09 19:25:29'),
(62, 'SHANDY BAGUS NUR RAHMAD', 'bagussandi1206@gmail.com', NULL, '087887099742', 'student', '2026-01-09 22:19:45', '$2y$12$GOPorngvp/iAAXBG.hHKjOaQukDk6.53vPUOZPSB1T4ogo6UmH5U2', NULL, NULL, NULL, NULL, '2026-01-09 22:18:57', '2026-01-09 22:19:45'),
(63, 'Amelia Rahma', 'rahmaamelia2205@gmail.com', NULL, '085182334491', 'student', '2026-01-09 22:29:18', '$2y$12$OBeJ5QS6EeQB6S56I4QSsOZEzz7TFbtTm.KzT7asJ0RVnMZTjMDdi', NULL, NULL, NULL, NULL, '2026-01-09 22:27:48', '2026-01-09 22:29:18'),
(64, 'Siti Aisiyah Maura Bunga Meyriska', 'mauraariska05@gmail.com', NULL, '082159049201', 'student', '2026-01-09 22:29:59', '$2y$12$DK5Hi2g9BpeT34r82I.sb.xLe2eM4Xdn9S4s0KQY33gmn5waMw1uC', NULL, NULL, NULL, NULL, '2026-01-09 22:29:18', '2026-01-09 22:29:59'),
(65, 'NUR WAFIQ AZIZAH', 'nurwafiqazizah574@gmail.com', NULL, '082254265670', 'student', '2026-01-09 23:19:36', '$2y$12$E/MQRcqpvxiEI99P4lS55eg6afil9QA7.Bfs8e7gS9O4cOtqlJs.i', NULL, NULL, NULL, NULL, '2026-01-09 23:19:36', '2026-01-09 23:19:36'),
(66, 'Cinta', 'cnta0114@gmail.com', NULL, '085256927248', 'student', NULL, '$2y$12$SBkIQ/b8o/NxB6ZTu5HmseNsCFwhbHFuU1UyW9o8wbQw.dZhv3ZjW', NULL, NULL, NULL, NULL, '2026-01-10 00:15:38', '2026-01-10 00:15:38'),
(67, 'Cinta', 'cintaaa.13@icloud.com', NULL, '085256927248', 'student', '2026-01-10 00:18:30', '$2y$12$XDOegRkfoTcjBEVp9ECKhuia8tq1iF7DYTUPzIzcIkZF2q6hfT0/G', NULL, NULL, NULL, NULL, '2026-01-10 00:18:08', '2026-01-10 00:18:30'),
(68, 'Desty Amanda Lukman', 'dedesshii@gmail.com', NULL, '085751529642', 'student', '2026-01-10 00:35:48', '$2y$12$HA63J8qmZKvqJu2pfwdcee.zUhyney51R.m8BMfPopJ5n5Un1HkM2', NULL, NULL, NULL, NULL, '2026-01-10 00:35:15', '2026-01-10 00:35:48'),
(69, 'Heri Purnomo', 'purr1102@gmail.com', NULL, '082260704959', 'student', '2026-01-10 01:18:27', '$2y$12$90r1ZC3tdbxUdXum8Sa3TuAn6bB7VLxTLpwtZVr5etqsn0GtBqQYq', NULL, NULL, NULL, NULL, '2026-01-10 01:17:06', '2026-01-10 01:18:27'),
(70, 'iisSetianah', 'iissetiana130982@gmail.com', NULL, '+6282155588906', 'student', NULL, '$2y$12$KFzOtM9QzK5mPDgKrHB3w.DRmhXn1qSHl3Zihwf4kSdHqJdzHyLWi', NULL, NULL, NULL, NULL, '2026-01-10 21:35:08', '2026-01-10 21:35:08'),
(71, 'Ahmad Jefri Murtadho', 'ahmadjefrimrtdh@gmail.com', NULL, '083141638159', 'student', '2026-01-11 00:24:04', '$2y$12$fQRAwZWfaagnza33pNOZvedbUHzNNMCEr/.GjrhiwcH8vqF.cQIBu', NULL, NULL, NULL, NULL, '2026-01-11 00:22:32', '2026-01-11 00:24:04'),
(72, 'Nurul Azizah Azzarah', 'nurulazizahazzarah@gmail.com', NULL, '083894783725', 'student', '2026-01-11 01:17:57', '$2y$12$5iJ910g302YmaQlT89Xt4.UjqqXrQSYgqKmNh6x4yWRha4HLe0aQy', NULL, NULL, NULL, NULL, '2026-01-11 01:17:05', '2026-01-11 01:17:57'),
(73, 'MUHAMMAD NANDA BASTIAN', 'nndabastian@gmail.com', NULL, '08225572279', 'student', '2026-01-11 09:47:18', '$2y$12$R6LDrwYAOwERS0ZDOSolpO0LSU1DtCEB1fJEBCKCJvpq2Go2sH0uy', NULL, NULL, NULL, NULL, '2026-01-11 09:46:57', '2026-01-11 09:47:18'),
(74, 'Enggal Wrihatnolo', 'enggalw404@gmail.com', NULL, '089654807163', 'student', '2026-01-11 17:57:47', '$2y$12$UOJwtoWl9TdEHA6M13cPxe.mpNAVzL1VDfhXOLKP8U/QQPmfnzhES', NULL, NULL, NULL, NULL, '2026-01-11 17:57:18', '2026-01-11 17:57:47'),
(75, 'Dinda Aprilly arham', 'dindaaprillya4@gmail.com', NULL, '0882022601734', 'student', '2026-01-11 19:46:12', '$2y$12$GnSojVEWodGhWn4uUIvndOLMuFjDzcnp.8f68xjm9YhsIlLuACzfy', NULL, NULL, NULL, NULL, '2026-01-11 19:45:45', '2026-01-11 19:46:12'),
(76, 'karin aprila', 'kaarinaprila@gmail.com', NULL, '083190932564', 'student', '2026-01-11 20:07:31', '$2y$12$oH7hSmX0PI61vQHy1N7h9OjCtDw3vBo70g7OYXOLZO0kW3OXSjQLu', NULL, NULL, NULL, NULL, '2026-01-11 20:07:03', '2026-01-11 20:07:31'),
(77, 'Inzalna', 'ncece164@gmail.com', NULL, '085820766365', 'student', '2026-01-12 05:35:56', '$2y$12$A2kQFQjQlmqRcU5QrUoxBO1EQTdu/xqMehIFl5YXSIjqW3cfHElA6', NULL, NULL, NULL, NULL, '2026-01-12 05:35:10', '2026-01-12 05:35:56'),
(78, 'risna mangindara', 'mangindararisna@gmail.com', NULL, '088242026730', 'student', '2026-01-12 19:23:45', '$2y$12$0CldQfc5EVd5pI3iRHPfpOdhrpdgn2g2bA5pX7hN0Kh9WDGoZKvRS', NULL, NULL, NULL, NULL, '2026-01-12 19:22:04', '2026-01-12 19:23:45'),
(79, 'Arma Wati', 'armaw737@gmail.com', NULL, '083812754543', 'student', NULL, '$2y$12$OR4aSH/JPksOI4trVkFDSubNufVCIHOrI.gzzAtWUuakbecFk0ApK', NULL, NULL, NULL, NULL, '2026-01-13 01:42:44', '2026-01-13 01:42:44'),
(80, 'RIZKYNA RAMADHANI', 'rizkynarahmadhani@gmail.com', NULL, '085020401755', 'student', '2026-01-13 19:23:48', '$2y$12$kO098T3vTKo9xZJ47N0Q4OFL5Fx.LhzFKJ7CrBWVDl.cYPv1oOQNu', NULL, NULL, NULL, NULL, '2026-01-13 19:22:54', '2026-01-13 19:23:48'),
(81, 'Muhammad adam', 'muhammadam2801@gmail.com', NULL, '083877731362', 'student', '2026-01-14 01:57:21', '$2y$12$uU7zEv7n/Hqq87xp/L7UmOv3Ht83z9yxB50822MG9ZS.Bz6SbzRKC', NULL, NULL, NULL, NULL, '2026-01-14 01:56:59', '2026-01-14 02:03:39'),
(82, 'Iis Setianah', 'interiorbyiissetianah@gmail.com', NULL, '+6282155588906', 'student', '2026-01-14 19:36:26', '$2y$12$fTObfRuvNLVhc2jmeIJoeeCJScY.fTlbT41Bw7zIxfjdGNWA31GPy', NULL, NULL, NULL, NULL, '2026-01-14 19:35:20', '2026-01-14 19:36:26'),
(83, 'Raudah nur fauziah nisa', 'raudahnurfauziahnisa281023@gmail.com', NULL, '085820942765', 'student', '2026-01-14 22:00:55', '$2y$12$/GW2916ua7p6Aa/1p3Zj1OhZW5EK2T4OIJu8e.8snu/eQ1ankTfzm', NULL, NULL, NULL, 'NwcEp3jJ98WnjAlTbiLXmGMwsvpSOlCFnwK4lVKD1rxy0shY4K3zgo3eXI9N', '2026-01-14 21:59:43', '2026-01-14 22:00:55'),
(84, 'ANDRA SATRIANIE RASYID', 'andrasatrianie1@gmail.com', NULL, '085219460661', 'student', '2026-01-14 22:29:49', '$2y$12$QVnqDfQRuBCvms2fm4pAS.V0.9oKGMW2Vx/qilD5JgSSLqmEqf7Aq', NULL, NULL, NULL, NULL, '2026-01-14 22:29:49', '2026-01-14 22:29:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `chat_logs`
--
ALTER TABLE `chat_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_logs_user_id_created_at_index` (`user_id`,`created_at`),
  ADD KEY `chat_logs_session_id_index` (`session_id`),
  ADD KEY `chat_logs_provider_index` (`provider`),
  ADD KEY `chat_logs_created_at_index` (`created_at`);

--
-- Indexes for table `chat_training`
--
ALTER TABLE `chat_training`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_verifications`
--
ALTER TABLE `document_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_verifications_student_biodata_id_foreign` (`student_biodata_id`),
  ADD KEY `document_verifications_verified_by_foreign` (`verified_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fakultas_code_unique` (`code`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_page_settings`
--
ALTER TABLE `landing_page_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `landing_page_settings_key_unique` (`key`),
  ADD KEY `landing_page_settings_group_index` (`group`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_settings_key_unique` (`key`);

--
-- Indexes for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `program_studi_code_unique` (`code`),
  ADD KEY `program_studi_fakultas_id_is_active_index` (`fakultas_id`,`is_active`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registrations_registration_number_unique` (`registration_number`),
  ADD KEY `registrations_user_id_foreign` (`user_id`),
  ADD KEY `registrations_registration_period_id_foreign` (`registration_period_id`),
  ADD KEY `registrations_registration_type_id_foreign` (`registration_type_id`),
  ADD KEY `registrations_choice_1_foreign` (`choice_1`),
  ADD KEY `registrations_choice_2_foreign` (`choice_2`),
  ADD KEY `registrations_choice_3_foreign` (`choice_3`),
  ADD KEY `registrations_registration_path_id_foreign` (`registration_path_id`),
  ADD KEY `registrations_accepted_by_foreign` (`accepted_by`),
  ADD KEY `registrations_rejected_by_foreign` (`rejected_by`),
  ADD KEY `registrations_accepted_program_studi_id_foreign` (`accepted_program_studi_id`);

--
-- Indexes for table `registration_paths`
--
ALTER TABLE `registration_paths`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_paths_name_unique` (`name`),
  ADD KEY `registration_paths_is_active_index` (`is_active`);

--
-- Indexes for table `registration_periods`
--
ALTER TABLE `registration_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration_types`
--
ALTER TABLE `registration_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_types_name_unique` (`name`),
  ADD KEY `registration_types_is_active_index` (`is_active`);

--
-- Indexes for table `reregistration_payments`
--
ALTER TABLE `reregistration_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reregistration_payments_user_id_foreign` (`user_id`),
  ADD KEY `reregistration_payments_verified_by_foreign` (`verified_by`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `student_biodatas`
--
ALTER TABLE `student_biodatas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_biodatas_nik_unique` (`nik`),
  ADD UNIQUE KEY `student_biodatas_nisn_unique` (`nisn`),
  ADD KEY `student_biodatas_user_id_foreign` (`user_id`);

--
-- Indexes for table `student_parents`
--
ALTER TABLE `student_parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_parents_student_biodata_id_foreign` (`student_biodata_id`);

--
-- Indexes for table `student_special_needs`
--
ALTER TABLE `student_special_needs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_special_needs_student_biodata_id_foreign` (`student_biodata_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nim_unique` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_logs`
--
ALTER TABLE `chat_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `chat_training`
--
ALTER TABLE `chat_training`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_verifications`
--
ALTER TABLE `document_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_page_settings`
--
ALTER TABLE `landing_page_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `registration_paths`
--
ALTER TABLE `registration_paths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `registration_periods`
--
ALTER TABLE `registration_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `registration_types`
--
ALTER TABLE `registration_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reregistration_payments`
--
ALTER TABLE `reregistration_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_biodatas`
--
ALTER TABLE `student_biodatas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `student_parents`
--
ALTER TABLE `student_parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_special_needs`
--
ALTER TABLE `student_special_needs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_logs`
--
ALTER TABLE `chat_logs`
  ADD CONSTRAINT `chat_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `document_verifications`
--
ALTER TABLE `document_verifications`
  ADD CONSTRAINT `document_verifications_student_biodata_id_foreign` FOREIGN KEY (`student_biodata_id`) REFERENCES `student_biodatas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_verifications_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `program_studi_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_accepted_by_foreign` FOREIGN KEY (`accepted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `registrations_accepted_program_studi_id_foreign` FOREIGN KEY (`accepted_program_studi_id`) REFERENCES `program_studi` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `registrations_choice_1_foreign` FOREIGN KEY (`choice_1`) REFERENCES `program_studi` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `registrations_choice_2_foreign` FOREIGN KEY (`choice_2`) REFERENCES `program_studi` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `registrations_choice_3_foreign` FOREIGN KEY (`choice_3`) REFERENCES `program_studi` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `registrations_registration_path_id_foreign` FOREIGN KEY (`registration_path_id`) REFERENCES `registration_paths` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `registrations_registration_period_id_foreign` FOREIGN KEY (`registration_period_id`) REFERENCES `registration_periods` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `registrations_registration_type_id_foreign` FOREIGN KEY (`registration_type_id`) REFERENCES `registration_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `registrations_rejected_by_foreign` FOREIGN KEY (`rejected_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `registrations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reregistration_payments`
--
ALTER TABLE `reregistration_payments`
  ADD CONSTRAINT `reregistration_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reregistration_payments_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `student_biodatas`
--
ALTER TABLE `student_biodatas`
  ADD CONSTRAINT `student_biodatas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_parents`
--
ALTER TABLE `student_parents`
  ADD CONSTRAINT `student_parents_student_biodata_id_foreign` FOREIGN KEY (`student_biodata_id`) REFERENCES `student_biodatas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_special_needs`
--
ALTER TABLE `student_special_needs`
  ADD CONSTRAINT `student_special_needs_student_biodata_id_foreign` FOREIGN KEY (`student_biodata_id`) REFERENCES `student_biodatas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
