-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2026 at 01:26 PM
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
(1, '⚠️Waspada Penipuan PMB UNU Kaltim', 'Kepada seluruh calon mahasiswa, pendaftaran Penerimaan Mahasiswa Baru (PMB) Universitas Nahdlatul Ulama Kalimantan Timur secara online hanya dilakukan melalui situs resmi PMB UNU Kaltim. Untuk informasi dan pelayanan PMB secara offline, silakan datang langsung ke Sekretariat Penerimaan Mahasiswa Baru Universitas Nahdlatul Ulama Kalimantan Timur sesuai dengan jam operasional kampus. Apabila terdapat pihak yang mengatasnamakan PMB UNU Kaltim di luar kanal resmi, diimbau untuk tidak menanggapi dan segera melakukan konfirmasi melalui kontak resmi universitas.', 1, '2025-12-13 08:17:36', '2025-12-15 05:41:53');

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
('pmb-unu-kaltim-cache-08aecfc54367fa6b8b06577883e26ecb', 'i:2;', 1767341209),
('pmb-unu-kaltim-cache-08aecfc54367fa6b8b06577883e26ecb:timer', 'i:1767341209;', 1767341209),
('pmb-unu-kaltim-cache-14d1a0e22b0a92c8a4e3b7250d398e19', 'i:3;', 1767571914),
('pmb-unu-kaltim-cache-14d1a0e22b0a92c8a4e3b7250d398e19:timer', 'i:1767571914;', 1767571914),
('pmb-unu-kaltim-cache-172ccdf6d4e35452f76fdf4ac938bb4e', 'i:1;', 1767649765),
('pmb-unu-kaltim-cache-172ccdf6d4e35452f76fdf4ac938bb4e:timer', 'i:1767649765;', 1767649765),
('pmb-unu-kaltim-cache-1b697bbebfa62c64cbf4a627df5a1380', 'i:1;', 1767598888),
('pmb-unu-kaltim-cache-1b697bbebfa62c64cbf4a627df5a1380:timer', 'i:1767598888;', 1767598888),
('pmb-unu-kaltim-cache-2e01e17467891f7c933dbaa00e1459d23db3fe4f', 'i:1;', 1767397240),
('pmb-unu-kaltim-cache-2e01e17467891f7c933dbaa00e1459d23db3fe4f:timer', 'i:1767397240;', 1767397240),
('pmb-unu-kaltim-cache-3438f6b7f34827861e76b6ca017fa31b', 'i:1;', 1767759238),
('pmb-unu-kaltim-cache-3438f6b7f34827861e76b6ca017fa31b:timer', 'i:1767759238;', 1767759238),
('pmb-unu-kaltim-cache-3bfe13a43bd0fdba557025d04494ad52', 'i:1;', 1767354026),
('pmb-unu-kaltim-cache-3bfe13a43bd0fdba557025d04494ad52:timer', 'i:1767354026;', 1767354026),
('pmb-unu-kaltim-cache-3d0434a1cb098c56d7ebcb5b0cdcf82b', 'i:2;', 1767660987),
('pmb-unu-kaltim-cache-3d0434a1cb098c56d7ebcb5b0cdcf82b:timer', 'i:1767660987;', 1767660987),
('pmb-unu-kaltim-cache-3ede078d588d2ce990c3a5be788450e5', 'i:1;', 1767412687),
('pmb-unu-kaltim-cache-3ede078d588d2ce990c3a5be788450e5:timer', 'i:1767412687;', 1767412687),
('pmb-unu-kaltim-cache-4aab5a33e74c0ddac29356293039c2c3', 'i:1;', 1767694095),
('pmb-unu-kaltim-cache-4aab5a33e74c0ddac29356293039c2c3:timer', 'i:1767694095;', 1767694095),
('pmb-unu-kaltim-cache-4bcfb3ac8582dc6ad6a83ddb03ab68a4', 'i:1;', 1767347798),
('pmb-unu-kaltim-cache-4bcfb3ac8582dc6ad6a83ddb03ab68a4:timer', 'i:1767347798;', 1767347798),
('pmb-unu-kaltim-cache-5496973b7dc1385a411dbf0860575b88', 'i:1;', 1767347815),
('pmb-unu-kaltim-cache-5496973b7dc1385a411dbf0860575b88:timer', 'i:1767347815;', 1767347815),
('pmb-unu-kaltim-cache-58a4b5169b6dfcc6f64029d715b9b76f', 'i:1;', 1767669105),
('pmb-unu-kaltim-cache-58a4b5169b6dfcc6f64029d715b9b76f:timer', 'i:1767669105;', 1767669105),
('pmb-unu-kaltim-cache-6140b04ad8de578e4141bc8d54820837', 'i:1;', 1767341306),
('pmb-unu-kaltim-cache-6140b04ad8de578e4141bc8d54820837:timer', 'i:1767341306;', 1767341306),
('pmb-unu-kaltim-cache-618c7c0bf6a093c7935c5524871a4ec4', 'i:1;', 1767366593),
('pmb-unu-kaltim-cache-618c7c0bf6a093c7935c5524871a4ec4:timer', 'i:1767366593;', 1767366593),
('pmb-unu-kaltim-cache-64e095fe763fc62418378753f9402623bea9e227', 'i:1;', 1767333589),
('pmb-unu-kaltim-cache-64e095fe763fc62418378753f9402623bea9e227:timer', 'i:1767333589;', 1767333589),
('pmb-unu-kaltim-cache-66c03237642bdcec4f16106833e69d1f', 'i:1;', 1767571929),
('pmb-unu-kaltim-cache-66c03237642bdcec4f16106833e69d1f:timer', 'i:1767571929;', 1767571929),
('pmb-unu-kaltim-cache-6c5ec612601d92cd7264332249a86ee4', 'i:1;', 1767687143),
('pmb-unu-kaltim-cache-6c5ec612601d92cd7264332249a86ee4:timer', 'i:1767687143;', 1767687143),
('pmb-unu-kaltim-cache-759723923c14b33102fe2e99d48177a2', 'i:3;', 1767667684),
('pmb-unu-kaltim-cache-759723923c14b33102fe2e99d48177a2:timer', 'i:1767667684;', 1767667684),
('pmb-unu-kaltim-cache-7621edef6b98116d41e6baea1469bdb4', 'i:1;', 1767666035),
('pmb-unu-kaltim-cache-7621edef6b98116d41e6baea1469bdb4:timer', 'i:1767666034;', 1767666034),
('pmb-unu-kaltim-cache-775e662033e80aa1867fd56ab51df2e1', 'i:1;', 1767486825),
('pmb-unu-kaltim-cache-775e662033e80aa1867fd56ab51df2e1:timer', 'i:1767486825;', 1767486825),
('pmb-unu-kaltim-cache-80e28a51cbc26fa4bd34938c5e593b36146f5e0c', 'i:2;', 1767695489),
('pmb-unu-kaltim-cache-80e28a51cbc26fa4bd34938c5e593b36146f5e0c:timer', 'i:1767695489;', 1767695489),
('pmb-unu-kaltim-cache-8b61eedc22fd22c76743a2696e3c0fe9', 'i:1;', 1767685318),
('pmb-unu-kaltim-cache-8b61eedc22fd22c76743a2696e3c0fe9:timer', 'i:1767685318;', 1767685318),
('pmb-unu-kaltim-cache-8e2f4e3a1ae20c898c7b7e6237cd2f33', 'i:1;', 1767597420),
('pmb-unu-kaltim-cache-8e2f4e3a1ae20c898c7b7e6237cd2f33:timer', 'i:1767597420;', 1767597420),
('pmb-unu-kaltim-cache-957fba465d31e4cd58e56c85e5202e99', 'i:1;', 1767313574),
('pmb-unu-kaltim-cache-957fba465d31e4cd58e56c85e5202e99:timer', 'i:1767313574;', 1767313574),
('pmb-unu-kaltim-cache-a43a86dc44a3ea6a543d090251637cf2', 'i:1;', 1767764401),
('pmb-unu-kaltim-cache-a43a86dc44a3ea6a543d090251637cf2:timer', 'i:1767764401;', 1767764401),
('pmb-unu-kaltim-cache-a9334987ece78b6fe8bf130ef00b74847c1d3da6', 'i:1;', 1767669106),
('pmb-unu-kaltim-cache-a9334987ece78b6fe8bf130ef00b74847c1d3da6:timer', 'i:1767669106;', 1767669106),
('pmb-unu-kaltim-cache-arbianperkasa27@gmail.com|104.28.213.128', 'i:1;', 1767313574),
('pmb-unu-kaltim-cache-arbianperkasa27@gmail.com|104.28.213.128:timer', 'i:1767313574;', 1767313574),
('pmb-unu-kaltim-cache-arbianperkasa7@gmail.com|202.65.238.252', 'i:3;', 1767571914),
('pmb-unu-kaltim-cache-arbianperkasa7@gmail.com|202.65.238.252:timer', 'i:1767571914;', 1767571914),
('pmb-unu-kaltim-cache-b73f116e1e0cb533f9b5868c022eb200', 'i:1;', 1767757061),
('pmb-unu-kaltim-cache-b73f116e1e0cb533f9b5868c022eb200:timer', 'i:1767757061;', 1767757061),
('pmb-unu-kaltim-cache-c5b76da3e608d34edb07244cd9b875ee86906328', 'i:1;', 1767687144),
('pmb-unu-kaltim-cache-c5b76da3e608d34edb07244cd9b875ee86906328:timer', 'i:1767687144;', 1767687144),
('pmb-unu-kaltim-cache-ce61f630b183e32386e218c06c9b89e5', 'i:1;', 1767600927),
('pmb-unu-kaltim-cache-ce61f630b183e32386e218c06c9b89e5:timer', 'i:1767600927;', 1767600927),
('pmb-unu-kaltim-cache-chat_context_production', 's:4074:\"[DATA REAL-TIME UNU KALTIM]\n\nGelombang saat ini: Gelombang 1 2026/2027 (01 Dec 2025 - 28 Feb 2026).\nJalur pendaftaran yang tersedia: Umum/Reguler, Kelas Karyawan.\n\nProgram Studi yang tersedia:\n- S1 Akuntansi\n- S1 Teknik Informatika\n- S1 Teknik Industri\n- S1 Arsitektur\n- S1 Desain Interior\n- S1 Hubungan Internasional\n- S1 Ilmu Komunikasi\n- S1 Teknologi Industri Pertanian\n- S1 Pendidikan Anak Usia Dini\n- S1 Farmasi\n\nALUR PENDAFTARAN PMB (5 Langkah):\n1. REGISTRASI AKUN: Buka website PMB, klik tombol Daftar. Isi email aktif, nama lengkap, nomor WhatsApp aktif, dan password. Cek email untuk verifikasi dan aktifkan akun.\n2. LENGKAPI BIODATA: Login ke akun, lalu lengkapi data pribadi: NIK, NISN, tempat tanggal lahir, alamat lengkap, dan upload foto 4x6 latar merah.\n3. UPLOAD DOKUMEN: Upload dokumen yang diperlukan: KTP, Kartu Keluarga, dan Ijazah/SKL. Format: PDF, JPG, atau PNG (maks 2MB).\n4. PILIH PROGRAM STUDI: Pilih jenis pendaftaran, jalur masuk, dan 2 pilihan program studi sesuai dengan minat dan bakat.\n5. VERIFIKASI DAN DAFTAR ULANG: Tunggu proses verifikasi dari Tim PMB. Setelah dinyatakan lolos, akan dihubungi untuk proses daftar ulang dan informasi selanjutnya.\n\nDOKUMEN YANG DIPERLUKAN:\n- Foto 4x6 latar merah\n- Scan/Foto KTP\n- Scan/Foto Kartu Keluarga (KK)\n- Scan/Foto Ijazah atau Surat Keterangan Lulus (SKL)\nFormat file: PDF, JPG, atau PNG dengan ukuran maksimal 2MB per file.\n\nTIPS SUKSES PENDAFTARAN:\n- Gunakan email aktif yang sering dicek\n- Gunakan nomor WhatsApp aktif (PENTING: informasi status pendaftaran dan jadwal daftar ulang dikirim via WhatsApp)\n- Siapkan semua dokumen sebelum mendaftar\n- Pastikan foto/scan dokumen jelas dan terbaca\n- Isi data sesuai dokumen resmi (KTP/Ijazah)\n- Simpan nomor WA panitia PMB\n\nINFORMASI PENTING:\n- Pembayaran biaya registrasi awal dilakukan SAAT DAFTAR ULANG, bukan saat mengisi formulir awal.\n- Panitia TIDAK PERNAH meminta transfer uang ke rekening PRIBADI.\n- Hati-hati terhadap penipuan yang mengatasnamakan PMB UNU Kaltim.\n- Jika mengalami kendala teknis, hubungi panitia resmi melalui kontak yang tertera di website.\n\nINFORMASI BIAYA:\n1. BIAYA REGISTRASI AWAL / DAFTAR ULANG (Dibayar saat melakukan daftar ulang):\n   - Nominal: Rp 300.000\n   - Mencakup: Pembuatan NIM, KTM (Kartu Tanda Mahasiswa), dan Jaket Almamater.\n2. BIAYA RPL (Rekognisi Pembelajaran Lampau) / ALIH JENJANG / PINDAHAN:\n   - Biaya Konversi: Rp 120.000 per SKS\n3. BIAYA UKT (Uang Kuliah Tunggal) PER SEMESTER:\n   - Reguler Non-Farmasi: Rp 5.000.000\n   - Reguler Farmasi: Rp 7.000.000\n   - Kelas Karyawan: Kunjungi https://edunitas.com/kampus/unu-kaltim untuk simulasi cicilan.\n\n\nKONTAK RESMI:\n- Telepon/WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n- Alamat Kampus: Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang\n\nSOCIAL MEDIA:\n- Website: https://unukaltim.ac.id\n- Instagram: https://instagram.com/unukaltim\n- Facebook: https://www.facebook.com/unukaltim.official\n\nTENTANG UNU KALTIM:\nUniversitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim) merupakan perguruan tinggi yang berlandaskan nilai Islam Ahlussunnah Wal Jamaah dan kebangsaan. UNU Kaltim menyelenggarakan pendidikan tinggi melalui kegiatan pendidikan, penelitian, dan pengabdian kepada masyarakat dengan tujuan menghasilkan lulusan yang berilmu, berakhlak, dan mampu berkontribusi bagi pembangunan daerah serta bangsa. Dengan sistem pembelajaran yang terus dikembangkan dan dukungan fasilitas akademik yang memadai, UNU Kaltim berkomitmen menghadirkan pendidikan tinggi yang inklusif dan terjangkau.\n\nBEASISWA TERSEDIA: KIP-K, GratisPol (PENDIDIKAN GRATISPOL KALIMANTAN TIMUR). Jika ingin mengajukan beasiswa, silahkan menghubungi kontak resmi UNU Kaltim.\n\nFITUR WEBSITE PMB:\n- Di website PMB (pmb.unukaltim.ac.id) terdapat Asisten Virtual AI (chatbot) yang dapat membantu menjawab pertanyaan seputar pendaftaran.\n- Tombol chat AI terletak di pojok kanan bawah halaman landing page, berbentuk ikon bulat berwarna hijau.\n- Calon mahasiswa dapat bertanya langsung kepada chatbot ini kapan saja untuk mendapatkan informasi PMB.\n\n\n\n[AKHIR DATA REAL-TIME]\";', 1767758303),
('pmb-unu-kaltim-cache-dhavaade112@gmail.com|114.10.139.143', 'i:1;', 1767366594),
('pmb-unu-kaltim-cache-dhavaade112@gmail.com|114.10.139.143:timer', 'i:1767366594;', 1767366594),
('pmb-unu-kaltim-cache-dhavaade112@gmail.com|114.10.139.151', 'i:3;', 1767667685),
('pmb-unu-kaltim-cache-dhavaade112@gmail.com|114.10.139.151:timer', 'i:1767667685;', 1767667685),
('pmb-unu-kaltim-cache-e62998faa1160d16c33d26ef7ebd7bf7', 'i:1;', 1767695771),
('pmb-unu-kaltim-cache-e62998faa1160d16c33d26ef7ebd7bf7:timer', 'i:1767695771;', 1767695771),
('pmb-unu-kaltim-cache-ee863b0f6f31f03bfffcc51e28754a71', 'i:1;', 1767579927),
('pmb-unu-kaltim-cache-ee863b0f6f31f03bfffcc51e28754a71:timer', 'i:1767579927;', 1767579927),
('pmb-unu-kaltim-cache-fb644351560d8296fe6da332236b1f8d61b2828a', 'i:1;', 1767571930),
('pmb-unu-kaltim-cache-fb644351560d8296fe6da332236b1f8d61b2828a:timer', 'i:1767571930;', 1767571930),
('pmb-unu-kaltim-cache-fe2ef495a1152561572949784c16bf23abb28057', 'i:1;', 1767313691),
('pmb-unu-kaltim-cache-fe2ef495a1152561572949784c16bf23abb28057:timer', 'i:1767313691;', 1767313691),
('pmb-unu-kaltim-cache-febrianigabrieladwi1@gmail.com|125.160.113.157', 'i:2;', 1767341209),
('pmb-unu-kaltim-cache-febrianigabrieladwi1@gmail.com|125.160.113.157:timer', 'i:1767341209;', 1767341209),
('pmb-unu-kaltim-cache-gabrieladwifebriani@gmail.com|125.160.113.157', 'i:1;', 1767341306),
('pmb-unu-kaltim-cache-gabrieladwifebriani@gmail.com|125.160.113.157:timer', 'i:1767341306;', 1767341306),
('pmb-unu-kaltim-cache-opreza@unukaltim.ac.id|182.8.161.72', 'i:1;', 1767347798),
('pmb-unu-kaltim-cache-opreza@unukaltim.ac.id|182.8.161.72:timer', 'i:1767347798;', 1767347798);

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
(4, 4, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(5, 4, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(6, 4, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(7, 4, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(8, 4, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(9, 5, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(10, 5, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(11, 5, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(12, 5, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(13, 6, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(14, 6, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(15, 6, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(16, 6, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(17, 7, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(18, 7, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(19, 7, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(20, 7, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(21, 7, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(22, 8, 17, 'biodata', 'approved', NULL, '2026-01-02 21:35:23', 0, '2025-12-26 10:58:56', '2026-01-02 21:35:23'),
(23, 8, 17, 'photo', 'approved', NULL, '2026-01-02 21:35:23', 0, '2025-12-26 10:58:56', '2026-01-02 21:35:23'),
(24, 8, 17, 'ktp', 'approved', NULL, '2026-01-02 21:35:23', 0, '2025-12-26 10:58:56', '2026-01-02 21:35:23'),
(25, 8, 17, 'kk', 'approved', NULL, '2026-01-02 21:35:23', 0, '2025-12-26 10:58:56', '2026-01-02 21:35:23'),
(26, 8, 17, 'certificate', 'approved', NULL, '2026-01-02 21:35:23', 0, '2025-12-26 10:58:56', '2026-01-02 21:35:23'),
(27, 9, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(28, 9, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(29, 9, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(30, 9, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(31, 9, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(32, 10, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(33, 10, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(34, 10, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(35, 10, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(36, 10, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(37, 11, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(38, 11, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(39, 11, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(40, 11, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(41, 11, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(42, 12, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(43, 12, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(44, 12, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(45, 12, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(46, 12, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(47, 13, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(48, 13, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(49, 13, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(50, 13, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(51, 13, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(52, 14, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(53, 14, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(54, 14, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(55, 14, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(56, 16, 17, 'biodata', 'approved', NULL, '2026-01-02 21:37:11', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:11'),
(57, 16, 17, 'photo', 'approved', NULL, '2026-01-02 21:37:11', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:11'),
(58, 16, 17, 'ktp', 'approved', NULL, '2026-01-02 21:37:11', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:11'),
(59, 16, 17, 'kk', 'approved', NULL, '2026-01-02 21:37:11', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:11'),
(60, 16, 17, 'certificate', 'approved', NULL, '2026-01-02 21:37:11', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:11'),
(61, 18, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(62, 18, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(63, 18, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(64, 18, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(65, 18, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(66, 19, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(67, 19, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(68, 19, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(69, 19, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(70, 19, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(71, 20, 17, 'biodata', 'approved', NULL, '2026-01-02 21:37:40', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:40'),
(72, 20, 17, 'photo', 'approved', NULL, '2026-01-02 21:37:40', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:40'),
(73, 20, 17, 'ktp', 'approved', NULL, '2026-01-02 21:37:40', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:40'),
(74, 20, 17, 'kk', 'approved', NULL, '2026-01-02 21:37:40', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:40'),
(75, 20, 17, 'certificate', 'approved', NULL, '2026-01-02 21:37:40', 0, '2025-12-26 10:58:56', '2026-01-02 21:37:40'),
(76, 21, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(77, 21, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(78, 21, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(79, 21, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(80, 21, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(81, 22, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(82, 22, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(83, 22, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(84, 22, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(85, 22, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 10:58:56', '2025-12-26 10:58:56'),
(86, 23, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 10:07:42', '2025-12-27 10:07:42'),
(87, 23, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 10:07:42', '2025-12-27 10:07:42'),
(88, 23, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 10:07:42', '2025-12-27 10:07:42'),
(89, 23, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 10:07:42', '2025-12-27 10:07:42'),
(90, 25, 17, 'biodata', 'approved', NULL, '2026-01-02 21:40:45', 0, '2025-12-30 15:20:05', '2026-01-02 21:40:45'),
(91, 25, 17, 'photo', 'approved', NULL, '2026-01-02 21:40:45', 0, '2025-12-30 15:20:05', '2026-01-02 21:40:45'),
(92, 25, 17, 'ktp', 'approved', NULL, '2026-01-02 21:40:45', 0, '2025-12-30 15:20:05', '2026-01-02 21:40:45'),
(93, 25, 17, 'kk', 'approved', NULL, '2026-01-02 21:40:45', 0, '2025-12-30 15:20:05', '2026-01-02 21:40:45'),
(94, 25, 17, 'certificate', 'approved', NULL, '2026-01-02 21:40:45', 0, '2025-12-30 15:20:05', '2026-01-02 21:40:45'),
(95, 26, 17, 'biodata', 'approved', NULL, '2026-01-02 21:36:21', 0, '2025-12-30 20:12:45', '2026-01-02 21:36:21'),
(96, 26, 17, 'photo', 'approved', NULL, '2026-01-02 21:36:21', 0, '2025-12-30 20:12:45', '2026-01-02 21:36:21'),
(97, 26, 17, 'ktp', 'approved', NULL, '2026-01-02 21:36:21', 0, '2025-12-30 20:12:45', '2026-01-02 21:36:21'),
(98, 26, 17, 'kk', 'approved', NULL, '2026-01-02 21:36:21', 0, '2025-12-30 20:12:45', '2026-01-02 21:36:21'),
(99, 26, 17, 'certificate', 'approved', NULL, '2026-01-02 21:36:21', 0, '2025-12-30 20:12:45', '2026-01-02 21:36:21'),
(100, 29, 17, 'biodata', 'approved', NULL, '2026-01-02 21:34:06', 0, '2026-01-01 20:34:48', '2026-01-02 21:34:06'),
(101, 29, 17, 'photo', 'approved', NULL, '2026-01-02 21:34:06', 0, '2026-01-01 20:34:48', '2026-01-02 21:34:06'),
(102, 29, 17, 'ktp', 'approved', NULL, '2026-01-02 21:34:06', 0, '2026-01-01 20:34:48', '2026-01-02 21:34:06'),
(103, 29, 17, 'kk', 'approved', NULL, '2026-01-02 21:34:06', 0, '2026-01-01 20:34:48', '2026-01-02 21:34:06'),
(104, 29, 17, 'certificate', 'approved', NULL, '2026-01-02 21:34:06', 0, '2026-01-01 20:34:48', '2026-01-02 21:34:06'),
(105, 31, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-02 17:06:47', '2026-01-02 17:06:47'),
(106, 31, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-02 17:06:47', '2026-01-02 17:06:47'),
(107, 31, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-02 17:06:47', '2026-01-02 17:06:47'),
(108, 31, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-02 17:06:47', '2026-01-02 17:06:47'),
(109, 31, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-02 17:06:47', '2026-01-02 17:06:47'),
(110, 32, 17, 'biodata', 'approved', NULL, '2026-01-02 22:47:05', 0, '2026-01-02 22:45:30', '2026-01-02 22:47:05'),
(111, 32, 17, 'photo', 'approved', NULL, '2026-01-02 22:47:05', 0, '2026-01-02 22:45:30', '2026-01-02 22:47:05'),
(112, 32, 17, 'ktp', 'approved', NULL, '2026-01-02 22:47:05', 0, '2026-01-02 22:45:30', '2026-01-02 22:47:05'),
(113, 32, 17, 'kk', 'approved', NULL, '2026-01-02 22:47:05', 0, '2026-01-02 22:45:30', '2026-01-02 22:47:05'),
(114, 32, 17, 'certificate', 'approved', NULL, '2026-01-02 22:47:05', 0, '2026-01-02 22:45:30', '2026-01-02 22:47:05'),
(115, 33, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-04 20:38:57', '2026-01-04 20:38:57'),
(116, 33, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-04 20:38:57', '2026-01-04 20:38:57'),
(117, 33, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-04 20:38:57', '2026-01-04 20:38:57'),
(118, 33, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-04 20:38:57', '2026-01-04 20:38:57'),
(119, 33, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-04 20:38:57', '2026-01-04 20:38:57'),
(120, 34, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-05 20:37:56', '2026-01-05 20:37:56'),
(121, 34, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-05 20:37:56', '2026-01-05 20:37:56'),
(122, 34, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-05 20:37:56', '2026-01-05 20:37:56'),
(123, 34, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-05 20:37:56', '2026-01-05 20:37:56'),
(124, 34, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-05 20:37:56', '2026-01-05 20:37:56'),
(125, 37, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-06 23:01:33', '2026-01-06 23:01:33'),
(126, 37, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-01-06 23:01:33', '2026-01-06 23:01:33'),
(127, 37, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-01-06 23:01:33', '2026-01-06 23:01:33'),
(128, 37, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-01-06 23:01:33', '2026-01-06 23:01:33'),
(129, 37, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-01-06 23:01:33', '2026-01-06 23:01:33');

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
(1, 'Fakultas Ekonomi dan Bisnis', 'FEB', 'Fakultas yang menyelenggarakan pendidikan di bidang ekonomi dan bisnis', 1, '2025-12-12 12:57:10', '2025-12-12 12:57:10'),
(2, 'Fakultas Teknik', 'FT', 'Fakultas yang menyelenggarakan pendidikan di bidang teknik dan teknologi', 1, '2025-12-12 12:57:10', '2025-12-12 12:57:10'),
(3, 'Fakultas Ilmu Sosial dan Kependidikan', 'FISKEP', 'Fakultas yang menyelenggarakan pendidikan di bidang ilmu sosial dan pendidikan', 1, '2025-12-12 12:57:10', '2025-12-12 12:57:10'),
(4, 'Fakultas Farmasi', 'FF', 'Fakultas yang menyelenggarakan pendidikan di bidang farmasi', 1, '2025-12-12 12:57:10', '2025-12-12 12:57:10');

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
(1, 'hero_title', 'Penerimaan Mahasiswa Baru (PMB) Universitas Nahdlatul Ulama Kalimantan Timur', 'text', 'hero', '2025-12-12 12:57:34', '2026-01-01 21:02:51'),
(2, 'hero_subtitle', 'Kuliah Mudah, Terjangkau, dan Berbasis Nilai Keislaman', 'text', 'hero', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(3, 'hero_description', 'PMB Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim). Daftar mahasiswa baru secara online, cek jalur masuk, informasi beasiswa, dan bantuan biaya pendidikan resmi.', 'textarea', 'hero', '2025-12-12 12:57:34', '2026-01-01 21:02:51'),
(4, 'hero_button_text', 'Daftar Sekarang', 'text', 'hero', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(5, 'hero_button_url', '/login', 'url', 'hero', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(6, 'hero_background_image', 'landing-page/AGTvP1xN1DocnjKQGz9UaZlNzCB0nEgu3OaeHwka.jpg', 'image', 'hero', '2025-12-12 12:57:34', '2025-12-14 06:23:18'),
(7, 'feature_1_title', 'Beasiswa & Bantuan Pendidikan', 'text', 'features', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(8, 'feature_1_description', 'UNU Kaltim menyediakan kesempatan beasiswa dan bantuan biaya pendidikan, termasuk program KIP-Kuliah, GratisPol, dan skema pendukung lainnya, untuk membantu mahasiswa menyelesaikan studi dengan lebih ringan.', 'textarea', 'features', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(9, 'feature_1_icon', 'clipboard-check', 'text', 'features', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(10, 'feature_2_title', 'Program Studi', 'text', 'features', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(11, 'feature_2_description', 'Tersedia berbagai program studi unggulan pada beberapa fakultas yang dirancang selaras dengan kebutuhan dunia kerja dan perkembangan ilmu pengetahuan serta teknologi, membekali mahasiswa dengan kompetensi siap kerja, ijazah resmi, dan peluang meraih sertifikat kompetensi BNSP sesuai bidang keahlian.', 'textarea', 'features', '2025-12-12 12:57:34', '2025-12-14 20:02:34'),
(12, 'feature_2_icon', 'graduation-cap', 'text', 'features', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(13, 'feature_3_title', 'Lingkungan Akademik', 'text', 'features', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(14, 'feature_3_description', 'Lingkungan akademik yang kondusif, islami, dan berlandaskan nilai Ahlussunnah Wal Jamaah untuk mendukung proses pembelajaran dan pengembangan karakter mahasiswa.', 'textarea', 'features', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(15, 'feature_3_icon', 'building-2', 'text', 'features', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(16, 'about_title', 'Tentang Universitas Nahdlatul Ulama Kalimantan Timur', 'text', 'about', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(17, 'about_description', 'Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim) merupakan perguruan tinggi yang berlandaskan nilai Islam Ahlussunnah Wal Jamaah dan kebangsaan. UNU Kaltim menyelenggarakan pendidikan tinggi melalui kegiatan pendidikan, penelitian, dan pengabdian kepada masyarakat dengan tujuan menghasilkan lulusan yang berilmu, berakhlak, dan mampu berkontribusi bagi pembangunan daerah serta bangsa. Dengan sistem pembelajaran yang terus dikembangkan dan dukungan fasilitas akademik yang memadai, UNU Kaltim berkomitmen menghadirkan pendidikan tinggi yang inklusif dan terjangkau.', 'textarea', 'about', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(18, 'contact_address', 'Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang', 'text', 'contact', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(19, 'contact_email', 'pmb@unukaltim.ac.id', 'text', 'contact', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(20, 'contact_phone_1', '0812-5317-738', 'text', 'contact', '2025-12-12 12:57:34', '2025-12-18 14:13:43'),
(21, 'contact_phone_1_label', 'Panitia PMB UNU Kaltim', 'text', 'contact', '2025-12-12 12:57:34', '2025-12-18 14:13:43'),
(22, 'contact_phone_2', '0811-4200-9990', 'text', 'contact', '2025-12-12 12:57:34', '2025-12-18 14:13:43'),
(23, 'contact_phone_2_label', 'Admin UNU Kaltim', 'text', 'contact', '2025-12-12 12:57:34', '2025-12-18 14:13:43'),
(24, 'contact_phone_3', NULL, 'text', 'contact', '2025-12-12 12:57:34', '2025-12-12 13:00:34'),
(25, 'contact_phone_3_label', NULL, 'text', 'contact', '2025-12-12 12:57:34', '2025-12-12 13:00:34'),
(26, 'university_logo', 'landing-page/DECjIPli9sVnmJvWroThG0lUp1e0oHj0Col766ye.webp', 'image', 'contact', '2025-12-12 12:57:34', '2025-12-13 10:13:44'),
(27, 'social_media_facebook', 'https://www.facebook.com/unukaltim.official', 'text', 'social_media', '2025-12-12 12:57:34', '2025-12-12 15:02:47'),
(28, 'social_media_instagram', 'https://instagram.com/unukaltim', 'text', 'social_media', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(29, 'social_media_website', 'https://unukaltim.ac.id', 'text', 'social_media', '2025-12-12 12:57:34', '2025-12-12 12:57:34'),
(30, 'about_image', 'landing-page/iHjHWrIV9sukVCjvZ0tCZxrZKScBIPM1dZCVX4o5.jpg', 'image', 'about', '2025-12-12 14:34:07', '2025-12-12 14:34:07'),
(31, 'hero_background_image_desktop', 'landing-page/ZhhRrQjrN1bbkvDfDEM8JbvoN7sVRrRMa9yOjtfp.png', 'image', 'hero', '2025-12-18 11:56:34', '2026-01-01 20:35:17'),
(32, 'hero_background_image_mobile', 'landing-page/5JAGVl3MxvKYbWknlVVZV80SRtQd5TEf0unque4O.png', 'image', 'hero', '2025-12-18 11:56:34', '2026-01-01 20:35:17');

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
(39, '2026_01_01_113931_create_payment_settings_table', 1);

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
('rezamuhammad980@gmail.com', '$2y$12$nqMMX4tL./mlrbdEJB/cv.oZFPXWMfbzTBPeVLMalOxMSiMORvSr.', '2025-12-16 11:04:40');

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
(1, 'payment_type', 'bank_transfer', 'select', '2026-01-01 05:51:42', '2026-01-02 23:17:45'),
(2, 'payment_bank_name', 'BSI', 'text', '2026-01-01 05:51:42', '2026-01-02 22:37:53'),
(3, 'payment_account_number', '2020230425', 'text', '2026-01-01 05:51:42', '2026-01-02 22:37:53'),
(4, 'payment_account_name', 'Universitas Nahdlatul Ulama Kalimantan Timur', 'text', '2026-01-01 05:51:42', '2026-01-01 05:54:49'),
(5, 'payment_amount', '300123', 'number', '2026-01-01 05:51:42', '2026-01-02 22:38:29'),
(6, 'payment_instructions', 'Silakan melakukan transfer sesuai dengan nominal yang tertera. Pastikan Anda menyimpan bukti transfer sebagai bukti pembayaran, kemudian unggah melalui formulir di bawah ini.', 'textarea', '2026-01-01 05:51:42', '2026-01-02 22:37:53');

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
(1, 1, 'Akuntansi', 'AKT', '0203', 'S1', 'Program Studi Akuntansi', 100, 1, '2025-12-12 12:57:17', '2025-12-12 12:57:17'),
(2, 2, 'Teknik Informatika', 'TI', '0105', 'S1', 'Program Studi Teknik Informatika', 120, 1, '2025-12-12 12:57:17', '2025-12-12 12:57:17'),
(3, 2, 'Teknik Industri', 'TIN', '0104', 'S1', 'Program Studi Teknik Industri', 200, 1, '2025-12-12 12:57:17', '2025-12-12 12:57:17'),
(4, 2, 'Arsitektur', 'ARS', '0101', 'S1', 'Program Studi Arsitektur', 60, 1, '2025-12-12 12:57:17', '2025-12-12 12:57:17'),
(5, 2, 'Desain Interior', 'DI', '0102', 'S1', 'Program Studi Desain Interior', 50, 1, '2025-12-12 12:57:17', '2025-12-12 12:57:17'),
(6, 3, 'Hubungan Internasional', 'HI', '0201', 'S1', 'Program Studi Hubungan Internasional', 70, 1, '2025-12-12 12:57:17', '2025-12-12 12:57:17'),
(7, 3, 'Ilmu Komunikasi', 'ILKOM', '0202', 'S1', 'Program Studi Ilmu Komunikasi', 90, 1, '2025-12-12 12:57:17', '2025-12-29 21:45:38'),
(8, 2, 'Teknologi Industri Pertanian', 'TIP', '0106', 'S1', 'Program Studi Teknologi Industri Pertanian', 60, 1, '2025-12-12 12:57:17', '2025-12-12 12:57:17'),
(9, 3, 'Pendidikan Anak Usia Dini', 'PAUD', '0204', 'S1', 'Program Studi Pendidikan Anak Usia Dini', 80, 1, '2025-12-12 12:57:17', '2025-12-12 12:57:17'),
(10, 4, 'Farmasi', 'FARM', '0103', 'S1', 'Program Studi Farmasi', 70, 1, '2025-12-12 12:57:17', '2025-12-29 21:45:47');

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
(5, '26270100001', 19, 'submitted', NULL, '2025-12-16 14:29:33', '2025-12-26 11:00:12', 1, 1, NULL, 'Teman/Keluarga', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '26270100002', 22, 'verified', NULL, '2025-12-17 05:10:56', '2026-01-02 21:35:23', 1, 1, NULL, 'Dosen/Panitia PMB UNU Kaltim', 'Ahmad Khoirul Anwar, S.Sos', 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '26270100003', 23, 'submitted', NULL, '2025-12-17 05:41:21', '2025-12-26 11:00:12', 1, 1, NULL, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '26270100004', 25, 'submitted', NULL, '2025-12-17 17:28:47', '2025-12-26 11:00:12', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '26270100005', 18, 'submitted', NULL, '2025-12-20 03:20:43', '2025-12-31 08:16:16', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'Kartika Fajriani', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '26270100006', 28, 'submitted', NULL, '2025-12-20 03:52:03', '2025-12-26 11:00:12', 1, 1, 1, 'Website Resmi UNU Kaltim', NULL, 10, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '26270100007', 30, 'submitted', NULL, '2025-12-21 17:17:16', '2025-12-26 11:00:12', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '26270100008', 32, 'verified', NULL, '2025-12-22 07:27:28', '2026-01-02 21:37:11', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / MISSYA', 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '26270100009', 34, 'submitted', NULL, '2025-12-22 08:16:40', '2025-12-26 11:00:12', 1, 1, 1, 'Lainnya', 'Dr. Rudi mulyadi', 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '26270100010', 35, 'submitted', NULL, '2025-12-22 08:26:53', '2025-12-26 11:00:12', 1, 1, NULL, 'Dosen/Panitia PMB UNU Kaltim', 'Prof. Dr. M. Akbar', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '26270100012', 36, 'verified', NULL, '2025-12-22 12:06:19', '2026-01-02 21:37:40', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / GRUP RT', 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '26270100013', 39, 'submitted', NULL, '2025-12-24 15:29:33', '2025-12-26 11:00:12', 1, 1, 1, 'Teman/Keluarga', NULL, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '26270100014', 43, 'verified', NULL, '2025-12-30 15:20:05', '2026-01-02 21:40:45', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / SUCI', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '26270100015', 44, 'verified', NULL, '2025-12-30 20:12:45', '2026-01-02 21:36:21', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '26270100016', 37, 'submitted', NULL, '2026-01-01 06:08:48', '2026-01-01 06:08:48', 1, 1, 1, 'Teman/Keluarga', NULL, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '26270100017', 47, 'verified', NULL, '2026-01-01 20:34:48', '2026-01-02 21:34:06', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '26270100018', 49, 'submitted', NULL, '2026-01-02 17:08:39', '2026-01-02 17:08:39', 1, 1, 1, 'Website Resmi UNU Kaltim', NULL, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '26270100019', 50, 'verified', NULL, '2026-01-02 22:45:30', '2026-01-02 22:47:05', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD LHOIRUL ANWAR / ARS', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '26270100020', 51, 'submitted', NULL, '2026-01-04 20:38:57', '2026-01-04 20:38:57', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '26270100021', 52, 'submitted', NULL, '2026-01-05 20:40:31', '2026-01-05 20:40:31', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '26270100022', 55, 'submitted', NULL, '2026-01-06 23:01:33', '2026-01-06 23:01:33', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'DHIVA ANDHINI (MAHASISWA AKUTANSI)', 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, 'Umum/Reguler', 'Jalur pendaftaran umum untuk calon mahasiswa baru', 1, '2025-12-17 10:30:03', '2025-12-17 10:30:21'),
(2, 'Kelas Karyawan', 'Jalur pendaftaran khusus untuk karyawan yang ingin melanjutkan pendidikan', 1, '2025-12-17 10:30:03', '2025-12-17 10:30:03');

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
(1, 'Gelombang 1 2026/2027', 1, '2026/2027', '2025-12-01', '2026-02-28', 1, NULL, '2025-12-11 18:45:50', '2025-12-11 18:45:50'),
(2, 'Gelombang 2 2026/2027', 2, '2026/2027', '2026-03-01', '2026-06-30', 0, 1000, '2025-12-20 14:54:43', '2025-12-20 14:54:54');

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
(1, 'Peserta Didik Baru', 'Jalur penerimaan calon mahasiswa baru.', 1, '2025-12-11 19:25:28', '2025-12-17 11:23:31'),
(2, 'Alih Jenjang', 'Jalur penerimaan mahasiswa melalui pengakuan pembelajaran lampau yang diperoleh dari pengalaman kerja dan/atau pendidikan formal sebelumnya (termasuk alih jenjang).', 1, '2025-12-11 19:25:39', '2026-01-01 07:06:50'),
(4, 'Pindahan', 'Jalur penerimaan mahasiswa pindahan dari perguruan tinggi lain.', 1, '2025-12-11 19:26:13', '2026-01-01 07:06:56');

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
('5kPaeRGaTGLTKD6pmxs2z0UFOnMyAFlaTjd1mwlu', NULL, '180.243.110.85', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUtwZ0FCM1RGRnpFSGRibjdCVVhWbkpDWUVIenNzMjZzN2pTMnAyNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ3OiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2ZiY2xpZD1QQWIyMWpjQVBHdHVwbGVIUnVBMkZsYlFJeE1RQnpjblJqQm1Gd2NGOXBaQTgxTmpjd05qY3pORE16TlRJME1qY0FBYWRIRXJWN1RoUXVCNzlVT0xEVHRMWVd5SGtvdTlhSlQ0ZkdZQm0zZVozS0UyUWhsQ0ltblpQV2hFV2hCQV9hZW1fVHhGM2dLdm1SN3hyenp4OEY2QnBBUSZ1dG1fY29udGVudD1saW5rX2luX2JpbyZ1dG1fbWVkaXVtPXNvY2lhbCZ1dG1fc291cmNlPWlnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767757690),
('CiL16Moo4lX5a4IDMzMUfg2bBkGBpGqBVQ1GP16p', 26, '125.160.123.181', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRWZBbWZKMTZqQ0tRODFzWHNTZGhOdEZ5a0d3RkpuNlZDR3RERzBLViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9wYW5kdWFuLWxlbmdrYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyNjt9', 1767764374),
('FwQAMl51rLeNXetIkpC8ttRPNE6I13s2gMEbjSwZ', NULL, '40.77.167.61', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTU9xbFV0ZGRYRzhxaWphbWVwUkxVOW4zNnUxb1loVnoyNnpLM0VyQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767760265),
('h95AowOu1bOLKzxBfTIcFbmm5VRSsIBMbGMSbnKx', NULL, '2620:96:e000::10c', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblZOWUZOMDV4clcxTVZPbEtVc2ZBMDI4TXRmOHpWUHNya0g5NjBwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767757036),
('j3VvB6hNlD8BlaE84osTfhwG5OA1lmvnCgPDU3ur', 17, '182.8.161.198', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUDFOVExUZ0ZhRzNkVXlnVWZTSm5hSU84ek5zTTJaMjhFQWRwbHg1aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9hZG1pbi9zdHVkZW50cy9aQTN6WEJqSi9yZWdpc3RyYXRpb24tY2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE3O30=', 1767766150),
('jUUBG04JzQEbR6ZV6TRsixc574n7wEShAkDwZkjB', NULL, '213.209.159.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:121.0) Gecko/20100101 Firefox/121.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib3ZOb1NOdW1sZHdtUUJhWDhGTjl1TG5vRHdJVVVNWFFhb3ZhdFE5dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767754167),
('KOblwHZGTeXZJbamxiE7WLhWSKW6NDEhzFJIGMN7', NULL, '2001:4860:7:402::f6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2loR3M1N1cxRUV2RnNhTVhBZ2tYNzBNeFpLd0t6R2tGR3A0dWFmcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767759156),
('l3vvw8404ZxKB5tubjm3C2IlJuvtS60uPefsvzkA', NULL, '114.10.139.156', 'Mozilla/5.0 (Linux; Android 14; SM-A556E Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/143.0.7499.146 Mobile Safari/537.36 Instagram 410.1.0.63.71 Android (34/14; 450dpi; 1080x2340; samsung; SM-A556E; a55x; s5e8845; in_ID; 846519237; IABMV/1)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWU1dWNDTUk1VlFNM3Eyck4xSlBVUXh6dEUzbFNlMWdvOVpDVHRscyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjIxOiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2JyaWQ9MmV2ODh0QjVhMF82QkN1N1F3M1pRdyZmYmNsaWQ9UEFjM0owWXdaaGNIQmZhV1FQTlRZM01EWTNNelF6TXpVeU5ESTNBQUduVEk1QlFoS0d3R0VwZFNqWW1TWWJ1WEhsR1daVWtUWnBUUkc3MWE1OVpmNVg4ZWN3alNTT3pnVjF1QUUmdXRtX2NvbnRlbnQ9bGlua19pbl9iaW8mdXRtX21lZGl1bT1zb2NpYWwmdXRtX3NvdXJjZT1pZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767763104),
('MfaEp7yaewtc1egHs1etgHt0Wei82QKzMwKMwOED', NULL, '36.83.56.18', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmUxbTV1UW5BOEJZWnlsM3hFVk5Qd1RWakhhYmppbmwzZjNPRlJmWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767755616),
('mwHyy4UkPKDpNbxNjDTHRiqRTWAdhSKHQseuONDp', NULL, '74.125.215.128', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkliaFJGN1VqUng5dnJNSTZ3NXpRUEtIMGl5N2xwRE1FeHBRNGRONiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767764319),
('QltvrdYz98QOLOjow8DaiIchfnWljhGyHzIxhqB5', NULL, '74.125.215.141', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczJIbWhLRDMxb2gxanZFeGJLaGR0SHhJT2ZpenB3enBTWXJwaEw2TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767764320),
('ReaoJ5TrBvnAYekDIjn7Td9qxr9vKdobOpj3Rut3', NULL, '74.7.227.63', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicW9SbFp4Y3poTElkbVRzRTVMRW5CTWFNRzJkTWdwVmhTY1pNb05SUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767755314),
('wlE5XZbTmfhPS7ZcTGfbW4OOrcAsV09UhP3yBaXw', NULL, '213.209.159.150', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmdpakg3R25VcVJYNGdFN2ZBVTB1QWlRRVhyT2NMbU9VWkNwSHQyRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767754167),
('wnRTKT6PNKL2tuvtreZxCmOicKD3pCk3qFQXzUkG', NULL, '3.236.158.248', 'python-requests/2.32.5', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZTVmRXV2cjhGNDRPTm5mZzBqb2NzdlFrN1ZCcUkybTI1Rk1kNm1xdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767757640),
('XJukABYVcpERYOTXj4DlnfYo6MhLQLk1YZPU4ef3', 1, '36.83.56.18', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYk1mV0o3SjJGSDRxdWszY200SE5FOUh6RE1EdVRCSVpBWTJXUkFuWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1767757047),
('YORjgzkhl8obvheNbIorEJItMmwUSHCCuFHx2nnX', NULL, '74.7.227.189', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUdpcVp4SEZaTVZVMDNCODZ1ejdONVZrdTJJTVByTENXSFprUUswTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767757407);

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
(4, 14, 'terimakasih', '1111111111155555', '1111222234', 'SMA/SMK Sederajat', 'SMAN 99', 'IPA', '00000009999', 'Laki-laki', '1999-09-01', 'Goa', 'Buddha', 'Sangkotek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/9maStVt6FYMWBEn5AxHNHo07kwd924FY0a0dbMt5.png', 'students/kk/9mFMppWZW93l9zCOox2BQ9iJXuI9TFfAE6khEGwG.pdf', 'students/ktp/zHEQRfV8hInQcs5bn9NMoVahJsCLlH4UkrAXknAK.png', 'students/certificates/oe3w6Cv9w0pBfbieKDjq090OMrVnwirnJZ5t5SHx.png', '2025-12-15 07:22:00', '2025-12-15 07:22:00'),
(5, 20, 'tes', '6472012505940002', '0000446789', 'SMA/SMK Sederajat', 'SMKN11 Samarinda', 'Tata boga', '08164500575', 'Laki-laki', '1997-12-17', 'Jakarta', 'Islam', 'jalan anugrah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/JaECwJShMzsSu92gy9lvsz1k6pIB2L1nR3PtHBEJ.jpg', 'students/kk/26Gc7p7Lmzw8IH96lKQVyx6y7Rq9KXiuYVlOEprz.jpeg', 'students/ktp/ZtvSJChaAYPGfgHHvRfLS1drnSYcdi1EqipzKJVh.jpg', NULL, '2025-12-16 09:04:32', '2025-12-16 09:04:32'),
(6, 21, 'kapunkapmoi', '0000000000000002', '0900000009', 'SMA/SMK Sederajat', 'SMAN 99', 'Iwak', '09990000888', 'Laki-laki', '2004-09-01', 'HIJAU', 'Konghucu', 'Jl. APT. Pranoto, Kel. Gunung Panjang, Kec. Samarinda Seberang, Kota Samarinda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/xzuuHaqnaBjscb5yrzp0h8iMaZhbYTjFwbwYjQ0D.png', 'students/kk/lk42Tu3ndCUbpz0fGkEWDnooNUfaY7JXLWrSUxN7.pdf', 'students/ktp/kwtyVnglX5fIx4TRIL42KdlMSmZbbltpE1NyCD5e.pdf', NULL, '2025-12-16 09:22:59', '2025-12-16 09:22:59'),
(7, 19, 'Muhammad Raihan Pratama', '6472061907050003', '0059984152', 'SMA/SMK', 'SMK KEHUTANAN NEGERI SAMARINDA', 'Teknologi Produksi Hasil Hutan', '081256538995', 'Laki-laki', '2005-07-19', 'Samarinda', 'Islam', 'Jl. Jakarta 1 Perum BCL Blok B.8 No.4, Kel. Loa Bakung, Kec. Sungai Kunjang, Kota Samarinda, Provinsi Kalimantan Timur.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Oqjx2EG2Y3FGkKglFlHUyi7HfmIftu9rUjkl5LpE.jpg', 'students/kk/FHUWyk1Mu1hXgtYrPl7yBmRrehTS1Soy0lNgEHLj.pdf', 'students/ktp/KL3WIEVOtO69cHaKO4nNMRvsJjXtoc7BHnUKNkvY.jpg', 'students/certificates/RVsD0TzmGLZwByUfRAl1VlQigV9ULuBQe3KWrPiw.pdf', '2025-12-16 14:23:27', '2025-12-17 10:31:06'),
(8, 22, 'IKWALUDIN IRKHAMNI', '6472051103030004', '0031739671', 'SMA/SMK', 'SMK Negeri 5 Samarinda', 'Bisnis dan Pemasaran', '083852596613', 'Laki-laki', '2003-03-11', 'Samarinda', 'Islam', 'Jl. Trisari RT. 21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/cW8q2NeIXCma3zQZj2vpT5nD6CI8HJlHgWJwQEVY.jpg', 'students/kk/03Pq9ptRVeRvL8fYgI4gcLheLD1Dx8tYFhr0u69r.pdf', 'students/ktp/mBTvA8mNVAQY3UxTFsWCzIGJxPS1O7pmEEdmCTu5.pdf', 'students/certificates/MPHNqMF169WN15cniuo7fLHkvA2wQAD5ElMKDEO4.jpg', '2025-12-17 05:09:08', '2025-12-17 08:56:58'),
(9, 23, 'Mouhammed Zidane Basayev Al Usman', '6471031207030005', NULL, 'SMA/SMK', 'SMK TI LABBAIKA', 'Teknik komputer dan jaringan', '087715729215', 'Laki-laki', '2003-07-12', 'Bogor', 'Islam', 'Jl. Pada Elo No.173 Rt.002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/zY63zlZaqPuQH4OsYSW59rjwtJeP8voE2ZwN9IIH.jpg', 'students/kk/2JAHuXJQZGy70tkgomE2sqOz6cqfyMtgcHkxjLkx.pdf', 'students/ktp/ZQl4MtufylugATjl0MmAoferoQWaIgiEGqX9W6RJ.pdf', 'students/certificates/RVItoQy8UeMTBXeedacw04p1ZaHeQ0XKaJCDyuVl.pdf', '2025-12-17 05:38:31', '2025-12-17 10:31:46'),
(10, 25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', '6472023105050001', '0052490733', 'SMA/SMK Sederajat', 'PONPES IMAM ASY-SYATHIBY Gowa Makassar', 'Agama Islam', '085750296152', 'Laki-laki', '2005-05-31', 'Samarinda', 'Islam', 'JL. Tanjung Aru, RT.015, Kelurahan Mangkupalas, Kecamatan Samarinda Seberang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/vIeTCL0dRes0kR2st8pnRLf5E8Ckh7h6ha1JUCpE.jpg', 'students/kk/L37drQJW68CkHE7nzl4e4vBolrP5KLVmSpPgYboH.jpg', 'students/ktp/X0PzllONDdkUMvIqN2Hll3KWWlzCGyzlzoggBjHB.jpg', 'students/certificates/rUw64FZchQvpuyUmUeEbyYiatrwnl46CzoHC7q8I.jpg', '2025-12-17 17:19:10', '2025-12-17 17:19:10'),
(11, 26, 'Emilda Ainun alzahra', '6472066005070007', '0074866571', 'SMA/SMK Sederajat', 'SMA BUDI LUHUR', NULL, '085934592604', 'Perempuan', '2007-05-20', 'Samarinda', 'Islam', 'Jalan KS Tubun dalam gang wiratirta RT 17 no 02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/4Itf0t8FJB2DRFumklRxMC1N8LhlLkUZQKc2LVHz.png', 'students/kk/YJ5jfMkcGcDJkjemPWXGUo1eSEU5i5LeAtfiM8yl.pdf', 'students/ktp/lqvOn4UHKIhLAYA2dmKeG92NSOmjuPaoabuSnAP1.pdf', 'students/certificates/T3V2cXFjXIsdlfegXK9NDfGljmkjW92ckJjtKz97.pdf', '2025-12-18 09:59:12', '2025-12-18 09:59:12'),
(12, 18, 'Sindiya kartika', '6402034107991004', '9993349686', 'SMA/SMK Sederajat', 'SMAN 2 LOA JANAN', 'IPA', '085163137202', 'Perempuan', '1999-09-21', 'Bakungan', 'Islam', 'Jl.gerbang dayaku desa bakungan rt 08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/2lj5u37uBswis7H9fk2vBVGUQbaw4xD5MEXwk9qF.jpeg', 'students/kk/z9NjdCiFTtIKHDowiOgu6xUloviZeQ4e5dEh7qBk.jpeg', 'students/ktp/P9yyaXBEYnpEVj7XzNSSJr5Yu5ZRKmnQPTjrJ2Vf.jpeg', 'students/certificates/l9MauTw5EAvvluSLozuUQ8A73fxzAWnGCJodUUhS.jpeg', '2025-12-20 03:11:48', '2025-12-20 03:11:48'),
(13, 28, 'Eka putri nur aisyah', '6402164906050002', '0059599318', 'SMA/SMK Sederajat', 'SMK YPM DIPONEGORO', 'Multimedia', '085822516904', 'Perempuan', '2005-06-09', 'Tenggarong', 'Islam', 'Tenggarong seberang,Manunggal jaya L2 blok E rt 06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/IPSHAQJRU7Z9Vf2PO1l86No8WBADg9Aip3bGKHR2.jpeg', 'students/kk/Jw5mlD9Lhr67Gfh7EwoLT2lEinjTuuHBrhTWwHoz.jpeg', 'students/ktp/7ssLFs75WC089fWZiBT57LsbJ4JOB5m0OW1WgFUM.jpeg', 'students/certificates/LOPIFOZySZgEk2fB3Uq3JgM3wefJZikPck7IA2Fp.jpeg', '2025-12-20 03:50:26', '2025-12-20 03:50:26'),
(14, 30, 'Egha Aulia Renatasari', '6402165606050003', NULL, 'SMA/SMK Sederajat', 'Sma Negeri 1 Tenggarong Seberang', 'ipa', '082255726898', 'Perempuan', '2005-06-16', 'Kutai Kartanegara', 'Islam', 'Desa Sukamaju, Rt 12, No. 16, Kec. Tenggarong Seberang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/SJMqh40UBhODcbFm0bLOm67O704goSFEX59BtjXs.JPG', 'students/kk/sE4Kijmkrs3qQrPEvx2nAAhAvkR1uB0yU4s8SOo3.jpeg', 'students/ktp/OcM50ZemRmstkYZcOUzGbFgEz9JExBjmHThDzouT.jpeg', NULL, '2025-12-21 16:07:19', '2025-12-21 16:07:19'),
(16, 32, 'DHINI ALEXANDRA KUMALASARI', '6472075903060002', '3067311527', 'SMA/SMK', 'SMAN 4 SAMARINDA', NULL, '0895 3443 22525', 'Perempuan', '2006-04-19', 'PETUNG', 'Islam', 'JL. PATIMURA\r\nMANGKUPALAS\r\nSAMARINDA SEBERANG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/fGlHvzBYl3ukSY2wVVZrHjXOKfWHJ0kxl6MEgw6Y.jpeg', 'students/kk/cgQLHvr577X55JFBiseZfaSBEtslwoS2xzPnZsd9.pdf', 'students/ktp/Ri8YCNoIJATEPCmjEPpPEJsNxJ8EKXrxLeppYrQ5.pdf', 'students/certificates/SWBZwfKAtadJW2TgCS9y8GdDvbaxY8Pv4lqYOnEo.pdf', '2025-12-22 07:27:28', '2025-12-22 07:27:28'),
(18, 34, 'Jorong coba saja', '6472050606790017', '84848484', 'SMA/SMK Sederajat', 'Sma', 'Ipa', '08111111111', 'Laki-laki', '2005-09-17', 'Samarinda', 'Buddha', 'Blas bla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/LxoZW3z6qFKa9PbO6UPHytRVOMUl8uLhCmdQ1jm5.jpg', 'students/kk/SadKtrI44PVFWf5oucGmS1wms9HbDm9vuPYrS1kT.pdf', 'students/ktp/wRcVdxBxQF40LXFve5nQvorm6QYwYY8DMyK9w74P.pdf', 'students/certificates/QSoJqdDU9Gmk0Q8vpq8U7o3n7Qp2WEg9Y11sYLO9.pdf', '2025-12-22 08:15:28', '2025-12-22 08:15:28'),
(19, 35, 'Rektor UNU', '6472060820000016', '97392739273', 'SMA/SMK', 'SMA 1', 'IPA', '08155145193', 'Laki-laki', '2000-12-20', 'Samarinda', 'Islam', 'Samarinda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/BhT2obPeemtekrGelKZWIEdIgeEauDzWPV1x24Ug.jpeg', 'students/kk/PMYwkhWObsgtpBTgLbD4j8buHl1VjPnmr7MnCMUp.pdf', 'students/ktp/PrHUPUvqchjebhdpXrdhj09XcRebH9WGsnMjfYyB.pdf', 'students/certificates/u2urQZSkpnk6ze8ZYW7Mxbak4CZPDUBamg4otwjT.pdf', '2025-12-22 08:24:54', '2025-12-22 09:22:24'),
(20, 36, 'ALVIN', '6472012708030002', '0025776132', 'SMA/SMK', 'SMK KESEHATAN', NULL, '+62 851-8498-4637', 'Laki-laki', '2003-08-27', 'SAMARINDA', 'Islam', 'JL. KESEHATAN RAWA MAKMUR PALARAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/1weXtCAu4a30K365YiXnZSSOBeBiyiXbz6H8TtIN.jpeg', 'students/kk/glzumttGhNAqLhPMTnbp37UJuwtbpNnOfwaLreAP.pdf', 'students/ktp/ueOfE3ud7bgDb53qVI1w5N0IGPvhYAVsobryWOnR.pdf', 'students/certificates/HiQc0HGSuDmW8gjJPU3Q4AEogNb2JUvPgKgbsrQc.pdf', '2025-12-22 12:06:19', '2025-12-22 12:06:19'),
(21, 39, 'Nur Ayu Syafutri', '6472016609030002', '0030295995', 'SMA/SMK Sederajat', 'SMK farmasi Samarinda', 'Teknologi laboratorium medik', '082154177300', 'Perempuan', '2004-09-26', 'Pallangga', 'Islam', 'Jalan Borneo rt 24 samping spbu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/06JZkxVlYrAmXeaJeHMfoftDGC5umQDpubYCS5EW.JPG', 'students/kk/IKIJCdWwCh00Q0sUkOcq3rBYpMZnnv0niw79UVjJ.pdf', 'students/ktp/P6MqzJvaC5Yvd6fD53Ab39bmsTsKYW3Cnm8j88r5.pdf', 'students/certificates/65TdjfFDfotNqh5m9kLKmnrlWBdVZZf50p54P2sw.pdf', '2025-12-24 15:22:32', '2025-12-24 15:22:32'),
(22, 37, 'Dhava ade syawaluddin', '6402160112040001', '0044526688', 'SMA/SMK Sederajat', 'SMA NEGERI 2 TENGGARONG', 'IPS', '085651251219', 'Laki-laki', '2004-12-01', 'SAMARINDA', 'Islam', 'KUTAI KARTANEGARA TENGGARONG SEBRANG LOA LEPU RT 03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Rh8TNXBvACZAMBBb7a6s7NM1jWXDzPGPaOq83P8E.jpg', 'students/kk/R89tFAo2sO9NSJp6hRW452HEyCcTGJlvJ35O45wB.jpg', 'students/ktp/f5NKcSpFufVrnVKmPLh9pMftRZBkJ6pk0bKU78qC.jpg', 'students/certificates/ZVxm6jyutNIBo4CGnXKr4TAWWznLCKbOKcomJq66.jpg', '2025-12-25 08:05:15', '2026-01-04 20:54:56'),
(23, 41, 'Xaviera Fowlers', '6472015102990222', '0000645689', 'SMA/SMK Sederajat', 'SMKN 22 Samarinda', 'TKJ', '08123344556', 'Laki-laki', '2005-09-25', 'Samarinda', 'Islam', 'Ut elit non recusans', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/icM7MdGsVgT6pdzcXe9I1lXMQn6F1jmaxtmVj9wD.jpg', 'students/kk/fG9ZJ9yHOGrqq9Z13LiutGgoeeqefbMfWZgCRcDj.pdf', 'students/ktp/6vUZ9YOYRlf6Kj8THNvRAJifIFgTKie7LdgsTPb9.png', NULL, '2025-12-27 10:07:42', '2026-01-05 01:15:00'),
(25, 43, 'SILVANA TIARA ANGGRENI', '6408076403070001', '30405722', 'SMA/SMK Sederajat', 'SMKS TI LABAIKA', NULL, '081549738581', 'Perempuan', '2007-03-24', 'MARAH HALOQ', 'Islam', 'MARAH HALOQ RT 01 KECAMATA TELEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/4c3QE1MckstWNR4T5JimEtgoYwerMTwOpjyBLvwZ.jpg', 'biodata/kk/PtGC8JY36BYshZ1GmeJ8uVKhwDHKIdvivrsfMNtj.pdf', 'biodata/ktp/XSVOPEvoWXxazZIfa6ZHxeyRdt3dnDZn47Y0JUhK.pdf', 'biodata/certificates/bUD0GqsUJ6Ev5ATRVqNJeuXfTt108UcSyB3S2RIs.pdf', '2025-12-30 15:20:05', '2025-12-30 15:20:05'),
(26, 44, 'RIDWAN', '6402040203010002', '0018099699', 'SMA/SMK Sederajat', 'MA MIFTAHUL ULUM ANGGANA', NULL, '081255422011', 'Laki-laki', '2001-04-02', 'TANJONGE', 'Islam', 'JL. PEMBANGUNAN\r\nANGGANA\r\nRT 14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/8cDzi8GYncPzg2QvJH8xWjLGDsOgJ23zSHw5gFhh.jpg', 'biodata/kk/HY5Bw3GKFsqxr9MQ4O1NxsIeU7J0cL46R68IuvGq.pdf', 'biodata/ktp/OhxzdtDk1YEhOvqdxEk8hmRbaqqFyd9eRWdv8lrV.pdf', 'biodata/certificates/dqE7dQBks398A2asmgKD5c4gYUtqdGzkfC9e3hzD.pdf', '2025-12-30 20:12:45', '2025-12-30 20:12:45'),
(27, 45, 'ABRIAN ISLAMI PERKASA.S', NULL, NULL, NULL, NULL, NULL, '082252542337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-01 17:23:31', '2026-01-01 17:23:31'),
(28, 46, 'ABRIAN ISLAMI PERKASA.S', NULL, NULL, NULL, NULL, NULL, '082252542337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-01 17:27:08', '2026-01-01 17:27:08'),
(29, 47, 'FADHILAH RAMDANIAH', '6402085212010004', '0018533295', 'SMA/SMK Sederajat', 'SMA ISLAM TERPADU NURUL ILMI TENGGARONG', NULL, '082150207691', 'Perempuan', '2001-12-12', 'KOTA BANGUN', 'Islam', 'JL. SRI BANGUN RT. 19 DESA. KOTA BANGUN ULU KEC. KOTA BANGUN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/6OGijskkYzAluy3RsUVc01Bdh2CPHWXjF4C91wQm.jpg', 'biodata/kk/EhqGivExjzlQ8bBQGlgvxtnAfKi3MQCPfwOBQzWa.pdf', 'biodata/ktp/h06NXotkXONGcgp8Vfs5YBoRzvRC6FkhoigsYN3M.pdf', 'biodata/certificates/eUzaQSgMj3ke4yoZO0nTRY5pQFTaPSwqTYovsZbt.pdf', '2026-01-01 20:34:48', '2026-01-01 20:34:48'),
(31, 49, 'ISMAIL HASAL AL - AZZAM', '6472030610070008', '0072420082', 'SMA/SMK Sederajat', 'SMK 17 SAMARINDA', 'Farmasi', '081522546898', 'Laki-laki', '2007-10-06', 'Samarinda', 'Islam', 'Jl. Rejo Mulyo RT 32 NO 19 Kelurahan Lempake Kecamatan Samarinda Utara Kota Samarinda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/ppwoJ30g0qa5NI2SyRXCDoZQ7CiKJwevIHM7fQtR.jpg', 'students/kk/z1G3l89DXZbY8nJZYL36G45yFkwlkt4MDASk1T3F.jpg', 'students/ktp/j3X1sWBUtMhb2EvwDh7WFfKic2CF2ldthAPw96ts.jpg', 'students/certificates/afchkLopMB5ZNyZXVqU2LxD50toSiW1uky3tWLcP.jpg', '2026-01-02 14:51:43', '2026-01-02 17:06:47'),
(32, 50, 'JULIANDA FEBRIANNUR', '6402082107040004', '0042151699', 'Paket C', 'ABDI BANGSA KOTA BANGUN', NULL, '081255758610', 'Laki-laki', '2004-07-21', 'KOTA BANGUN', 'Islam', 'JL. SRINBANGUN RT. 19 KEC. KOTA BANGUN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/Bo1mAlFTeaPEb3vWwwmIUdYqnU1o8z1OefBgLwMG.jpg', 'biodata/kk/5LM3JPU71H1xJeIQanQ4b98XSaZdSRZjTKaqC4zq.pdf', 'biodata/ktp/GjEjFkgyHoyUiuEeIsy1n1NNwlInzRI8e3bx6r4e.pdf', 'biodata/certificates/TNy5GfQu2TjDWJ8CK7eSSUJYA0TBvZz788nDxyca.pdf', '2026-01-02 22:45:30', '2026-01-02 22:45:30'),
(33, 51, 'FAUZIAH MAULIDYA', '6402066404050003', '0050617089', 'SMA/SMK Sederajat', 'SMA ISLAM TERPADU NURUL ILMI TENGGARONG', NULL, '082157598157', 'Perempuan', '2005-04-24', 'KUTAI KARTANEGARA', 'Islam', 'JL. SUAKA POLEWALI RT.4 DESA. JONGKANG KEC. LOA KULU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/m9ZBtf76iq7D5Rf6kcHYZ5741Cwzs0PmQPLlKDnm.jpg', 'biodata/kk/d6oLclqur6ymjKifFs0QmVlAu1fgnkLGY1dE2FF4.pdf', 'biodata/ktp/4Qe2v0MjPvHz6j33PkpAF26e84WimTa6jHXlXNpa.pdf', 'biodata/certificates/C2AJH42O3lR4IPzhTP1AfGIwjpRhbWry4GHnFY9x.pdf', '2026-01-04 20:38:57', '2026-01-06 21:14:05'),
(34, 52, 'Jannatul aulia', '6472066606030001', '3034235511', 'Paket C', 'Sma albanjari', 'Ips', '085750314922', 'Perempuan', '2003-06-26', 'Samarinda', 'Islam', 'Jln datu iba gg datu umar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/DatoUUsNGttEUidZxETcjJb0f4T6paI1H7Fcsj51.png', 'students/kk/sjGtdVlslP6UZUt6tCdzfSS3LLJYTd4NSDh3yKSa.jpg', 'students/ktp/rEmZAcJq2q1s76ld19a9hfO0xVCCceJC3lwwCKmc.jpg', 'students/certificates/Tgc5aJaKDFfR56b5MA4DqPPpQb3PcoLB0bNwZbSo.jpg', '2026-01-05 20:08:47', '2026-01-05 20:37:56'),
(35, 53, 'Muhammad Fahmi', NULL, NULL, NULL, NULL, NULL, '085185948789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-06 01:06:42', '2026-01-06 01:06:42'),
(36, 54, 'Sahrul halil', NULL, NULL, NULL, NULL, NULL, '087850933180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-06 03:30:09', '2026-01-06 03:30:09'),
(37, 55, 'Yunitha Hapsari Hidayat', '6402037006060004', '0063951695', 'SMA/SMK Sederajat', 'SMK FARMASI SAMARINDA', NULL, '083130670823', 'Perempuan', '2006-06-30', 'Loa Duri Kutai Kartanegara', 'Islam', 'jl.gerbang dayaku gg mahakam 10 rt03 loa duri ulu kec loa janan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/5zdb3WMuN3469p6W1hln5LUcjaSrheNgc4ehDBkn.jpg', 'biodata/kk/8T2yTp0lwTnjraB1dgFCqscsGE3GfJpjPilZj9ms.jpg', 'biodata/ktp/Ksn50suTFXn06mB4KdkMcqK4GnBt9VHYAp84tfXO.jpg', 'biodata/certificates/BVoXyJGQv1ttUeWRuh6A1OLi1qBFr74MTYLBZXkr.jpg', '2026-01-06 23:01:33', '2026-01-06 23:09:02');

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
(1, 'Admin User', 'admin@unukaltim.ac.id', NULL, '081155664477', 'admin', '2025-12-13 08:47:43', '$2y$12$sIlHNsGX1IqJU9wWEVP8c.iF1CslG6ixfm7OiKyGZeLVUfLtOf6Di', NULL, NULL, NULL, NULL, '2025-12-11 13:52:02', '2025-12-14 05:19:43'),
(3, 'tes', 'tes@mail.com', NULL, '081213141516', 'student', NULL, '$2y$12$2I.oEw3NT9TF6GNDh2I0VuW7prw6pC.vLJAsgtJ83vB2ofuTSM0zG', NULL, NULL, NULL, NULL, '2025-12-11 13:59:48', '2025-12-11 13:59:48'),
(4, 'Miftahurroyyan Al Hasan', 'royyandalhasan@gmail.com', NULL, '082197658372', 'student', NULL, '$2y$12$zK30sxpCoB.E4CKaUrJUC.97RhVM3DRlYiwVJuFr6AOXSkaeaZHs6', NULL, NULL, NULL, NULL, '2025-12-11 14:28:40', '2025-12-11 14:28:40'),
(8, '1234567Patimah', 'patimahlim62@gmail.com', NULL, '081322915486', 'student', NULL, '$2y$12$DXaj/WMRBp7aWgxLxZyYNuXdv6qVhlsXOKNKA/PhR.zo8Mqz.ztTu', NULL, NULL, NULL, NULL, '2025-12-12 18:16:19', '2025-12-12 18:16:19'),
(9, 'teslagi', 'tes@exmail.com', NULL, '081213251513', 'student', NULL, '$2y$12$gwY.s6XnWbqKy5EbF3hlJuPd9IpwhkRacyVeLwzNSbkbbwRnsblfa', NULL, NULL, NULL, NULL, '2025-12-12 19:56:00', '2025-12-12 19:56:00'),
(11, 'Wulandari', 'wulandariiii1801@gmail.com', NULL, '083894877734', 'student', NULL, '$2y$12$WmVjyBSE6FCQ1IOJ6mqIzuqg54NtqklK8GmLFCI14QAEMfqikohVG', NULL, NULL, NULL, NULL, '2025-12-13 08:45:55', '2025-12-13 08:45:55'),
(12, 'Wulandari', 'wulann1810@gmail.com', NULL, '083894877734', 'student', '2025-12-13 08:47:43', '$2y$12$VNm/0bHtm2gUJihSbeDOdOhvfC92MdYu8.EyIG99OZq.2AFcgou0q', NULL, NULL, NULL, NULL, '2025-12-13 08:46:25', '2025-12-13 08:47:43'),
(14, 'Terima Gaji', 'raya@unukaltim.ac.id', NULL, '00000009999', 'student', '2025-12-14 04:25:28', '$2y$12$xlZ703/LVBLOWExZp4Ar8OCjvfiaMcpMR2ncfLhd84b9/ftfOpRYq', NULL, NULL, NULL, NULL, '2025-12-14 04:24:45', '2025-12-28 16:09:05'),
(16, 'Keisya Nur Alya', 'keisyanuralya0@gmail.com', NULL, '081521711804', 'student', '2025-12-14 14:32:58', '$2y$12$xllSYVPPkzCTpQ/XLU8s0OfLCW2SX7tQxqCBH2L8D.rMFPSvAyrE2', NULL, NULL, NULL, 'YAJByxtyh1DNibGUYtikG5xYH5A15OIkX1f1iJMHsy5a344VoqRGjVwIFwLf', '2025-12-14 14:31:42', '2025-12-14 14:32:58'),
(17, 'PMB UNU KALTIM', 'pmb@unukaltim.ac.id', NULL, '-', 'staff', '2025-12-14 20:45:14', '$2y$12$fKfSBershUG375WI.ZSJu.FrBGtGB3agP8LGlaXvpjBvIfJX7UEo2', NULL, NULL, NULL, 'sgc1iEL4mcGUWEtJvewgHAivUZosXvmJ7zDZFsRCOwV3B3a0maobvdGXN1rr', '2025-12-14 20:45:14', '2025-12-15 05:39:48'),
(18, 'Sindiya kartika', 'sindiyakartika34@gmail.com', NULL, '085163137202', 'student', '2025-12-15 10:28:39', '$2y$12$ly4fNnBXGYPYif68qCJn1OsFLfNQAwFFbxjWxclNjJlPZ8Mc.oaaa', NULL, NULL, NULL, 'wcuBGpB64pOTc3R68Uht4GIpnvD9nk1MFeb5ndeqmt3s34S5SnN7tJUniBEI', '2025-12-15 10:25:23', '2025-12-15 10:28:39'),
(19, 'Muhammad Raihan Pratama', 'muhammadraihanpratama23@gmail.com', NULL, '081256538995', 'student', '2025-12-16 08:17:42', '$2y$12$QTkiBoYgkIIADjbrhgOk0e5fmFX66zVXg9E5KOYkaOLb/tDWswZHe', NULL, NULL, NULL, 'xWNMHhajAzlXRWX0tCgoNYQoHLxWh7rL1SfVIk0YpJF2Oi7Lr8hLBDMlp7oJ', '2025-12-16 08:16:36', '2025-12-16 08:17:42'),
(20, 'tes', 'rezamuhammad980@gmail.com', NULL, '08164500575', 'student', '2025-12-16 09:01:53', '$2y$12$2iJeAbMvrBi/GjsO7GdIvukx9ZZxkuhdsNY9ah8hQHfY7W9xxIpbi', NULL, NULL, NULL, NULL, '2025-12-16 09:01:36', '2025-12-16 09:01:53'),
(21, 'kapunkapmoi', 'rayafachreza739@gmail.com', NULL, '09990000888', 'student', '2025-12-16 09:20:45', '$2y$12$zXLs.Us0Hhuyxf1XNJ9jVuU7QLeoNv3UEdvOr2Jd4fojyiRPiTYqG', NULL, NULL, NULL, NULL, '2025-12-16 09:18:57', '2025-12-16 09:20:45'),
(22, 'IKWALUDIN IRKHAMNI', 'ikwaludini@gmail.com', NULL, '083852596613', 'student', '2025-12-17 04:59:18', '$2y$12$qU0AjNX3rssjnYXVdq1mBusUNovMgZXBAJhNcwbXaJZ2QlUsUgGyK', NULL, NULL, NULL, 'AXp1dDjn99MP9zWGEwkpn2UXxWmMpOZT5seEDoME0LC3gxgNqUV2pvcNCSRu', '2025-12-17 04:55:26', '2025-12-17 04:59:18'),
(23, 'Mouhammed Zidane Basayev Al Usman', 'zidanbasayev7@gmail.com', NULL, '087715729215', 'student', '2025-12-17 05:31:09', '$2y$12$PW/jiamA6f1/jJMWPOacyOlxB5C59aL8p5gsdSF1fN1ojLbIaBNLq', NULL, NULL, NULL, NULL, '2025-12-17 05:30:35', '2025-12-17 05:31:09'),
(24, 'WR 1', 'wr1@unukaltim.ac.id', NULL, '080000000000', 'staff', '2025-12-17 06:38:43', '$2y$12$es48CvnMfpfsFFGnNqG7eOK3pvyXp3vxWSWFwssd0Z9.mVKGRY8u6', NULL, NULL, NULL, 'p12lWwMTtqE1MwJKGMxzYcUXdvd2WwTko4AG4ZOs5YSsSt66abgABsjZm3bj', '2025-12-17 06:38:43', '2025-12-17 06:38:43'),
(25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', 'shevapratama946@gmail.com', NULL, '085750296152', 'student', '2025-12-17 16:24:24', '$2y$12$ctZ22aZ.AkW4e1LUDSZ5Fut2sCFUxFvWE7M9ElBnxsHYDET06exi2', NULL, NULL, NULL, 'Q3WvUjJLgZvFuubswOf6OPEBTHH85GflSI5WQ6Q3yQ8hPQ6FnZ4baAw9UMjy', '2025-12-17 16:23:33', '2025-12-17 16:24:24'),
(26, 'Emilda Ainun alzahra', 'emildaazzahra79@gmail.com', NULL, '085934592604', 'student', '2025-12-18 09:24:38', '$2y$12$gg0n0K46o47gwDxHAEOrQOUnsHYxMyVt7rX7tJhDzfo2Q0QpBUu.6', NULL, NULL, NULL, NULL, '2025-12-18 09:11:24', '2025-12-18 09:24:38'),
(27, 'rizalmulyono', 'ka.upm.feb@unpad.ac.id', NULL, '08564789632', 'student', NULL, '$2y$12$wkIx2Z4ws7.0pwYftQhXFO.f1htJ5svhwwBGfe.bX9keBq2oLrL3G', NULL, NULL, NULL, NULL, '2025-12-18 16:52:06', '2025-12-18 16:52:06'),
(28, 'Eka putri nur aisyah', 'ekaputrinuraisyah2@gmail.com', NULL, '085822516904', 'student', '2025-12-19 16:26:31', '$2y$12$Bs/gQJCaz8nZeueC0peKz.tzCwqBSqGl/.8eOIeftqZwX9QnmgG76', NULL, NULL, NULL, 'xZZk0tGw5bKIs4eCavVPtXadCgYfpItIlekrIYzNAojBMeE6BEgCRJvLcUUz', '2025-12-19 16:25:13', '2025-12-19 16:26:31'),
(29, 'Egha Aulia Renatasari', 'eghaauliaaa@icloud.com', NULL, '082255726898', 'student', NULL, '$2y$12$Q8CXctEVlYfw8nOsVnCTqOA3p1ANSy8PGZwzmPccv56P1ySCENPg6', NULL, NULL, NULL, 'CRVlyWOWGv5CLtTj4EvS8yTsAUg0G8ahORx3rIu3YeB2YsLMiYPScD4GsGsR', '2025-12-20 10:51:03', '2025-12-20 10:51:03'),
(30, 'Egha Aulia Renatasari', 'auliaegha045@gmail.com', NULL, '082255726898', 'student', '2025-12-21 09:06:11', '$2y$12$Gbc7sHFv4KSxUSNvZura3uMXFLDq2gEscEDpA816tqkUbKbpygB/u', NULL, NULL, NULL, 'fyW6t6sCw7mGTJRPIqM1nSkXlBGb98Uj9isyQTg0DW7b4qRrTtwsSSbQd20p', '2025-12-21 09:01:51', '2025-12-21 09:06:11'),
(32, 'DHINI ALEXANDRA KUMALASARI', 'ghinaahyti03@gmail.com', NULL, '0895 3443 22525', 'student', '2025-12-22 07:27:28', '$2y$12$eHXIrVz7IOWnXYRJhYxyAOgYCWk01vuuCrqoloJbERDGyuAJH.JZC', NULL, NULL, NULL, NULL, '2025-12-22 07:27:28', '2025-12-22 07:27:28'),
(34, 'Jorong coba saja', 'thekoetai@gmail.com', NULL, '08111111111', 'student', '2025-12-22 08:10:48', '$2y$12$mDKhzKuTSOEcfyFzUQpedOba2alth6eNIT3QBTMuVNxGMbn2bYMeO', NULL, NULL, NULL, NULL, '2025-12-22 08:09:44', '2025-12-22 08:10:48'),
(35, 'Rektor UNU', 'rektor@unukaltim.ac.id', NULL, '08155145193', 'student', '2025-12-22 08:19:34', '$2y$12$vQ8aDxPP4WsGGb8FAkmdBOIKEsoHa9J89MjDWlHAtU4/mMohK33Me', NULL, NULL, NULL, NULL, '2025-12-22 08:18:42', '2025-12-22 09:22:24'),
(36, 'ALVIN', 'anaksultan2708@gmail.com', NULL, '+62 851-8498-4637', 'student', '2025-12-22 12:06:19', '$2y$12$Tei/9jSGqFMnsjBKjFjgZurCjQ.TP3GtHP4e/0TAqrG.Qg6Xenzay', NULL, NULL, NULL, NULL, '2025-12-22 12:06:19', '2025-12-22 12:06:19'),
(37, 'Dhava ade syawaluddin', 'dhavaade112@gmail.com', NULL, '085651251219', 'student', '2025-12-23 07:39:19', '$2y$12$xPeFVtHde9NQyZq.O3Pf.u5PFebtHJtHH5l91f7NK6ZxsTJ5NSF02', NULL, NULL, NULL, 'ApyiOuzElTar6THQGnNedIGsf5xA2AzJsqAQpcSAclGuHceV75VTO6xCWDkM', '2025-12-23 07:38:18', '2025-12-23 07:39:19'),
(38, 'Nurul alfira', 'nurul.alfira048@gmail.com', NULL, '085183040894', 'student', '2025-12-23 08:11:58', '$2y$12$0p4gSqg.6dv3.XSWOmibYuHYRBTRYR6H9XI.CrqeaTFbbrl7SC/E.', NULL, NULL, NULL, NULL, '2025-12-23 08:11:13', '2025-12-23 08:11:58'),
(39, 'Nur Ayu Syafutri', 'ayusyahfutri479@gmail.com', NULL, '082154177300', 'student', '2025-12-24 09:28:11', '$2y$12$489UjJ0BAjO9p/VcK5hlCuPgIxGiP6U/0ymmxt.7gAKkaKkOfpNEq', NULL, NULL, NULL, 'AZQNnvo96q3nQtRhCZ8uErXnGArSBvmnuvQwpzfDahHM64Ni9e0MLxlt3Ujg', '2025-12-24 09:21:38', '2025-12-24 09:43:34'),
(40, 'Anita Ardian', 'anitaardian680@gmail.com', NULL, '085651337295', 'student', '2025-12-25 16:38:43', '$2y$12$wzCkco3gnhNQQHeJtG/8BO6wvL05OG4wfA7/.W/EKL/sHpTY/a6/C', NULL, NULL, NULL, NULL, '2025-12-25 16:38:20', '2025-12-25 16:38:43'),
(41, 'Xaviera Fowlers', 'rezamuhammad981@gmail.com', NULL, '08123344556', 'student', '2025-12-27 10:05:47', '$2y$12$pA4mhfb1DOTrBcxPr9L7VOw.rSUW9843qxHZPU9dldyJ8q.FeUGfu', NULL, NULL, NULL, NULL, '2025-12-27 10:04:52', '2026-01-05 01:15:00'),
(43, 'SILVANA TIARA ANGGRENI', 'tiaraalaaa5@gmail.com', NULL, '081549738581', 'student', '2025-12-30 15:20:05', '$2y$12$tJwWM6za8xxxdtb1Kb7uGeIx2xWu8b4jlJ7EdsTq2peA6bSEHzT4u', NULL, NULL, NULL, NULL, '2025-12-30 15:20:05', '2025-12-30 15:20:05'),
(44, 'RIDWAN', 'ridwanalbugisi686@gmail.com', NULL, '081255422011', 'student', '2025-12-30 20:12:45', '$2y$12$wALC5W1WWtIzAfAX6lFNyOUKAbeA3KujhxAiSlvqzZ7WfS8qi8aq.', NULL, NULL, NULL, NULL, '2025-12-30 20:12:45', '2025-12-30 20:15:18'),
(45, 'ABRIAN ISLAMI PERKASA.S', 'arbianperkasa27@gmail.com', NULL, '082252542337', 'student', '2026-01-04 17:11:10', '$2y$12$aGfEhQb/uwBG2uIIDA9TeeP7YaS7DxurmBfRz5SBSS2az4N5fOBdK', NULL, NULL, NULL, '60oavblXESK9OAst3VfKnzqoBcY42A4COZsQaEc2AMv0gnUZZce5r9D0E4E6', '2026-01-01 17:23:31', '2026-01-04 17:11:10'),
(46, 'ABRIAN ISLAMI PERKASA.S', 'bggusk123@gmail.com', NULL, '082252542337', 'student', NULL, '$2y$12$RYOoOu0po19IYCfVDGeO3upy9Lkhs5/FAb.IQNSomwbqT0s5fbO0.', NULL, NULL, NULL, NULL, '2026-01-01 17:27:08', '2026-01-01 17:27:08'),
(47, 'FADHILAH RAMDANIAH', 'ramdovan1215@gmail.com', NULL, '082150207691', 'student', '2026-01-01 20:34:48', '$2y$12$uPtcmyVDXdWWSgqH4nKaeOvwafceF.jtADu64BhWKmZH8j87uMqd.', NULL, NULL, NULL, NULL, '2026-01-01 20:34:48', '2026-01-01 20:34:48'),
(49, 'ISMAIL HASAL AL - AZZAM', 'ismahariyanto@yahoo.co.id', NULL, '081522546898', 'student', '2026-01-02 15:02:40', '$2y$12$z54YLEJtz/w3/s3zfs6AMO16MMeFDkI.BB4YbtB.S4QhM33Hjbs52', NULL, NULL, NULL, NULL, '2026-01-02 14:51:43', '2026-01-02 17:06:47'),
(50, 'JULIANDA FEBRIANNUR', 'jabosawung552@gmail.com', NULL, '081255758610', 'student', '2026-01-02 22:45:30', '$2y$12$plgdJCcj.OOsFgky6d9/mO4YiX7Q3sUk39r15zeDWxOUC10.YgkdO', NULL, NULL, NULL, NULL, '2026-01-02 22:45:30', '2026-01-02 22:45:30'),
(51, 'FAUZIAH MAULIDYA', 'fauziahmaulidya22@gmail.com', NULL, '082157598157', 'student', '2026-01-04 20:38:57', '$2y$12$czsbWSdKwh6yzbnDSTKVoOD3jm/CfYyJENRuZloRfpugskDXemEs2', NULL, NULL, NULL, NULL, '2026-01-04 20:38:57', '2026-01-04 20:38:57'),
(52, 'Jannatul aulia', 'auliajannatul731@gmail.com', NULL, '085750314922', 'student', '2026-01-05 20:10:46', '$2y$12$gpVOGOu9XjD/Nz2qAzWmBeXAPIR3Z5SsIDCfqu2jsl0VL9OhoE4ea', NULL, NULL, NULL, 'yhKAZzjMICWoo3dzFE2CAROYX1dmgidLVblSKP2T9iLFqSngMJlHsEQtDFWq', '2026-01-05 20:08:47', '2026-01-05 20:10:46'),
(53, 'Muhammad Fahmi', 'mfahmiel024@gmail.com', NULL, '085185948789', 'student', '2026-01-06 01:11:24', '$2y$12$ySDk8WYAG3BKsmn5u8xgjOFA9v2Vfl5g6Z.36FN5qR/EklND2gRSa', NULL, NULL, NULL, 'h1hvw8vHwT7iCCEntGGp5TwDJAM2vRiCfQHKitdn2dmdzmukChHYi0o89FIe', '2026-01-06 01:06:42', '2026-01-06 01:11:24'),
(54, 'Sahrul halil', 'halilsahrul932@gmail.com', NULL, '087850933180', 'student', '2026-01-06 03:31:16', '$2y$12$3fGuXXz8f9eu06BxonG1Q.oeIVJVNGz8dteplnhJmWBZD/g/VXENS', NULL, NULL, NULL, NULL, '2026-01-06 03:30:09', '2026-01-06 03:31:16'),
(55, 'Yunitha Hapsari Hidayat', 'yunitahapsari851@gmail.com', NULL, '083130670823', 'student', '2026-01-06 23:01:33', '$2y$12$TfDwn8RBiZL/7kBYvPEDIu9mD2lYbxh/GiTkSfxHCQhr0qwO89Enm', NULL, NULL, NULL, NULL, '2026-01-06 23:01:33', '2026-01-06 23:01:33');

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
-- AUTO_INCREMENT for table `chat_training`
--
ALTER TABLE `chat_training`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_verifications`
--
ALTER TABLE `document_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

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
