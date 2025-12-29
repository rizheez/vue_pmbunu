-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 29, 2025 at 08:23 AM
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
(1, '⚠️Waspada Penipuan PMB UNU Kaltim', 'Kepada seluruh calon mahasiswa, pendaftaran Penerimaan Mahasiswa Baru (PMB) Universitas Nahdlatul Ulama Kalimantan Timur secara online hanya dilakukan melalui situs resmi PMB UNU Kaltim. Untuk informasi dan pelayanan PMB secara offline, silakan datang langsung ke Sekretariat Penerimaan Mahasiswa Baru Universitas Nahdlatul Ulama Kalimantan Timur sesuai dengan jam operasional kampus. Apabila terdapat pihak yang mengatasnamakan PMB UNU Kaltim di luar kanal resmi, diimbau untuk tidak menanggapi dan segera melakukan konfirmasi melalui kontak resmi universitas.', 1, '2025-12-13 22:17:36', '2025-12-15 19:41:53');

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
('pmb-unu-kaltim-cache-22f45531dcafd11c51c06dc5da3ad9ed', 'i:1;', 1766931263),
('pmb-unu-kaltim-cache-22f45531dcafd11c51c06dc5da3ad9ed:timer', 'i:1766931263;', 1766931263);

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
(4, 4, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(5, 4, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(6, 4, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(7, 4, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(8, 4, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(9, 5, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(10, 5, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(11, 5, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(12, 5, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(13, 6, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(14, 6, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(15, 6, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(16, 6, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(17, 7, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(18, 7, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(19, 7, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(20, 7, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(21, 7, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(22, 8, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(23, 8, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(24, 8, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(25, 8, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(26, 8, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(27, 9, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(28, 9, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(29, 9, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(30, 9, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(31, 9, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(32, 10, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(33, 10, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(34, 10, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(35, 10, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(36, 10, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(37, 11, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(38, 11, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(39, 11, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(40, 11, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(41, 11, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(42, 12, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(43, 12, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(44, 12, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(45, 12, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(46, 12, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(47, 13, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(48, 13, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(49, 13, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(50, 13, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(51, 13, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(52, 14, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(53, 14, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(54, 14, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(55, 14, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(56, 16, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(57, 16, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(58, 16, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(59, 16, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(60, 16, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(61, 18, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(62, 18, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(63, 18, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(64, 18, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(65, 18, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(66, 19, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(67, 19, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(68, 19, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(69, 19, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(70, 19, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(71, 20, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(72, 20, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(73, 20, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(74, 20, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(75, 20, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(76, 21, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(77, 21, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(78, 21, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(79, 21, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(80, 21, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(81, 22, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(82, 22, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(83, 22, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(84, 22, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(85, 22, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-27 00:58:56', '2025-12-27 00:58:56'),
(86, 23, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-28 00:07:42', '2025-12-28 00:07:42'),
(87, 23, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-28 00:07:42', '2025-12-28 00:07:42'),
(88, 23, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-28 00:07:42', '2025-12-28 00:07:42'),
(89, 23, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-28 00:07:42', '2025-12-28 00:07:42');

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
(1, 'Fakultas Ekonomi dan Bisnis', 'FEB', 'Fakultas yang menyelenggarakan pendidikan di bidang ekonomi dan bisnis', 1, '2025-12-13 02:57:10', '2025-12-13 02:57:10'),
(2, 'Fakultas Teknik', 'FT', 'Fakultas yang menyelenggarakan pendidikan di bidang teknik dan teknologi', 1, '2025-12-13 02:57:10', '2025-12-13 02:57:10'),
(3, 'Fakultas Ilmu Sosial dan Kependidikan', 'FISKEP', 'Fakultas yang menyelenggarakan pendidikan di bidang ilmu sosial dan pendidikan', 1, '2025-12-13 02:57:10', '2025-12-13 02:57:10'),
(4, 'Fakultas Farmasi', 'FF', 'Fakultas yang menyelenggarakan pendidikan di bidang farmasi', 1, '2025-12-13 02:57:10', '2025-12-13 02:57:10');

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
(1, 'hero_title', 'PMB Universitas Nahdlatul Ulama Kalimantan Timur', 'text', 'hero', '2025-12-13 02:57:34', '2025-12-16 01:31:26'),
(2, 'hero_subtitle', 'Kuliah Mudah, Terjangkau, dan Berbasis Nilai Keislaman', 'text', 'hero', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(3, 'hero_description', 'Universitas Nahdlatul Ulama Kalimantan Timur membuka Penerimaan Mahasiswa Baru (PMB) melalui sistem pendaftaran online. Tersedia berbagai jalur masuk serta kesempatan mendapatkan beasiswa dan bantuan biaya pendidikan bagi calon mahasiswa yang memenuhi persyaratan.', 'textarea', 'hero', '2025-12-13 02:57:34', '2025-12-16 01:31:26'),
(4, 'hero_button_text', 'Daftar Sekarang', 'text', 'hero', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(5, 'hero_button_url', '/login', 'url', 'hero', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(6, 'hero_background_image', 'landing-page/AGTvP1xN1DocnjKQGz9UaZlNzCB0nEgu3OaeHwka.jpg', 'image', 'hero', '2025-12-13 02:57:34', '2025-12-14 20:23:18'),
(7, 'feature_1_title', 'Beasiswa & Bantuan Pendidikan', 'text', 'features', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(8, 'feature_1_description', 'UNU Kaltim menyediakan kesempatan beasiswa dan bantuan biaya pendidikan, termasuk program KIP-Kuliah, GratisPol, dan skema pendukung lainnya, untuk membantu mahasiswa menyelesaikan studi dengan lebih ringan.', 'textarea', 'features', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(9, 'feature_1_icon', 'clipboard-check', 'text', 'features', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(10, 'feature_2_title', 'Program Studi', 'text', 'features', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(11, 'feature_2_description', 'Tersedia berbagai program studi unggulan pada beberapa fakultas yang dirancang selaras dengan kebutuhan dunia kerja dan perkembangan ilmu pengetahuan serta teknologi, membekali mahasiswa dengan kompetensi siap kerja, ijazah resmi, dan peluang meraih sertifikat kompetensi BNSP sesuai bidang keahlian.', 'textarea', 'features', '2025-12-13 02:57:34', '2025-12-15 10:02:34'),
(12, 'feature_2_icon', 'graduation-cap', 'text', 'features', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(13, 'feature_3_title', 'Lingkungan Akademik', 'text', 'features', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(14, 'feature_3_description', 'Lingkungan akademik yang kondusif, islami, dan berlandaskan nilai Ahlussunnah Wal Jamaah untuk mendukung proses pembelajaran dan pengembangan karakter mahasiswa.', 'textarea', 'features', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(15, 'feature_3_icon', 'building-2', 'text', 'features', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(16, 'about_title', 'Tentang Universitas Nahdlatul Ulama Kalimantan Timur', 'text', 'about', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(17, 'about_description', 'Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim) merupakan perguruan tinggi yang berlandaskan nilai Islam Ahlussunnah Wal Jamaah dan kebangsaan. UNU Kaltim menyelenggarakan pendidikan tinggi melalui kegiatan pendidikan, penelitian, dan pengabdian kepada masyarakat dengan tujuan menghasilkan lulusan yang berilmu, berakhlak, dan mampu berkontribusi bagi pembangunan daerah serta bangsa. Dengan sistem pembelajaran yang terus dikembangkan dan dukungan fasilitas akademik yang memadai, UNU Kaltim berkomitmen menghadirkan pendidikan tinggi yang inklusif dan terjangkau.', 'textarea', 'about', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(18, 'contact_address', 'Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang', 'text', 'contact', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(19, 'contact_email', 'pmb@unukaltim.ac.id', 'text', 'contact', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(20, 'contact_phone_1', '0812-5317-738', 'text', 'contact', '2025-12-13 02:57:34', '2025-12-19 04:13:43'),
(21, 'contact_phone_1_label', 'Panitia PMB UNU Kaltim', 'text', 'contact', '2025-12-13 02:57:34', '2025-12-19 04:13:43'),
(22, 'contact_phone_2', '0811-4200-9990', 'text', 'contact', '2025-12-13 02:57:34', '2025-12-19 04:13:43'),
(23, 'contact_phone_2_label', 'Admin UNU Kaltim', 'text', 'contact', '2025-12-13 02:57:34', '2025-12-19 04:13:43'),
(24, 'contact_phone_3', NULL, 'text', 'contact', '2025-12-13 02:57:34', '2025-12-13 03:00:34'),
(25, 'contact_phone_3_label', NULL, 'text', 'contact', '2025-12-13 02:57:34', '2025-12-13 03:00:34'),
(26, 'university_logo', 'landing-page/DECjIPli9sVnmJvWroThG0lUp1e0oHj0Col766ye.webp', 'image', 'contact', '2025-12-13 02:57:34', '2025-12-14 00:13:44'),
(27, 'social_media_facebook', 'https://www.facebook.com/unukaltim.official', 'text', 'social_media', '2025-12-13 02:57:34', '2025-12-13 05:02:47'),
(28, 'social_media_instagram', 'https://instagram.com/unukaltim', 'text', 'social_media', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(29, 'social_media_website', 'https://unukaltim.ac.id', 'text', 'social_media', '2025-12-13 02:57:34', '2025-12-13 02:57:34'),
(30, 'about_image', 'landing-page/iHjHWrIV9sukVCjvZ0tCZxrZKScBIPM1dZCVX4o5.jpg', 'image', 'about', '2025-12-13 04:34:07', '2025-12-13 04:34:07'),
(31, 'hero_background_image_desktop', 'landing-page/zyjWM64QvYtp9z3klM9EURL5bOtLydUknYwYXroN.png', 'image', 'hero', '2025-12-19 01:56:34', '2025-12-19 04:48:42'),
(32, 'hero_background_image_mobile', 'landing-page/fltTXNz7G1id0hsPL4VxOjOiUr1SAjpjJ3iuEqPy.png', 'image', 'hero', '2025-12-19 01:56:34', '2025-12-19 01:56:34');

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
(4, '2025_12_11_043337_create_student_biodatas_table', 1),
(5, '2025_12_11_043338_create_registrations_table', 1),
(6, '2025_12_11_071600_add_role_to_users_table', 1),
(7, '2025_12_11_071601_create_announcements_table', 1),
(8, '2025_12_11_075455_create_registration_periods_table', 1),
(9, '2025_12_11_075456_add_registration_period_id_to_registrations_table', 1),
(10, '2025_12_11_084358_add_document_fields_to_student_biodatas_table', 1),
(11, '2025_12_12_022202_create_document_verifications_table', 1),
(12, '2025_12_12_061136_add_phone_to_users_table', 1),
(13, '2025_12_12_062800_update_registrations_status_enum', 1),
(14, '2025_12_12_155138_create_registration_types_table', 2),
(15, '2025_12_12_155236_modify_registrations_table_for_registration_types', 2),
(16, '2025_12_13_031321_create_fakultas_table', 3),
(17, '2025_12_13_031322_create_program_studi_table', 3),
(18, '2025_12_13_031322_modify_registrations_choices_to_foreign_keys', 3),
(19, '2025_12_13_032621_create_landing_page_settings_table', 3),
(20, '2025_12_13_155552_add_birth_place_and_religion_to_student_biodata_table', 4),
(21, '2025_12_13_160228_add_address_to_student_biodatas_table', 4),
(22, '2025_12_15_070521_add_registration_path_to_registrations_table', 5),
(23, '2025_12_15_133231_add_referral_source_to_registrations_table', 6),
(24, '2025_12_18_055943_create_registration_paths_table', 7),
(25, '2025_12_18_060010_modify_registrations_table_for_registration_path_id', 7),
(26, '2025_12_21_105543_add_extended_status_and_audit_to_registrations', 8),
(27, '2025_12_21_105931_add_accepted_program_studi_to_registrations', 8),
(28, '2025_12_23_103645_add_registration_number_to_registrations_table', 8);

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
('rezamuhammad980@gmail.com', '$2y$12$nqMMX4tL./mlrbdEJB/cv.oZFPXWMfbzTBPeVLMalOxMSiMORvSr.', '2025-12-17 01:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE `program_studi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fakultas_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
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

INSERT INTO `program_studi` (`id`, `fakultas_id`, `name`, `code`, `jenjang`, `description`, `quota`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Akuntansi', 'AKT', 'S1', 'Program Studi Akuntansi', 100, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(2, 2, 'Teknik Informatika', 'TI', 'S1', 'Program Studi Teknik Informatika', 120, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(3, 2, 'Teknik Industri', 'TIN', 'S1', 'Program Studi Teknik Industri', 200, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(4, 2, 'Arsitektur', 'ARS', 'S1', 'Program Studi Arsitektur', 60, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(5, 2, 'Desain Interior', 'DI', 'S1', 'Program Studi Desain Interior', 50, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(6, 3, 'Hubungan Internasional', 'HI', 'S1', 'Program Studi Hubungan Internasional', 70, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(7, 3, 'Ilmu Komunikasi', 'IKOM', 'S1', 'Program Studi Ilmu Komunikasi', 90, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(8, 2, 'Teknologi Industri Pertanian', 'TIP', 'S1', 'Program Studi Teknologi Industri Pertanian', 60, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(9, 3, 'Pendidikan Anak Usia Dini', 'PAUD', 'S1', 'Program Studi Pendidikan Anak Usia Dini', 80, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17'),
(10, 4, 'Farmasi', 'FAR', 'S1', 'Program Studi Farmasi', 70, 1, '2025-12-13 02:57:17', '2025-12-13 02:57:17');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('draft','submitted','verified','accepted','rejected','re_registration_pending','re_registration_verified','enrolled') DEFAULT 'draft',
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `registration_period_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registration_type_id` bigint(20) UNSIGNED NOT NULL,
  `registration_path_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registration_path` enum('Umum','Kelas Karyawan') NOT NULL,
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

INSERT INTO `registrations` (`id`, `registration_number`, `user_id`, `status`, `accepted_at`, `created_at`, `updated_at`, `registration_period_id`, `registration_type_id`, `registration_path_id`, `registration_path`, `referral_source`, `referral_detail`, `choice_1`, `choice_2`, `choice_3`, `accepted_by`, `acceptance_notes`, `accepted_program_studi_id`, `rejected_at`, `rejected_by`, `rejection_reason`) VALUES
(5, '26270100001', 19, 'submitted', NULL, '2025-12-17 04:29:33', '2025-12-27 01:00:12', 1, 1, NULL, 'Umum', 'Teman/Keluarga', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '26270100002', 22, 'submitted', NULL, '2025-12-17 19:10:56', '2025-12-27 01:00:12', 1, 1, NULL, 'Kelas Karyawan', 'Dosen/Panitia PMB UNU Kaltim', 'Ahmad Khoirul Anwar, S.Sos', 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '26270100003', 23, 'submitted', NULL, '2025-12-17 19:41:21', '2025-12-27 01:00:12', 1, 1, NULL, 'Umum', 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '26270100004', 25, 'submitted', NULL, '2025-12-18 07:28:47', '2025-12-27 01:00:12', 1, 1, 1, 'Umum', 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '26270100005', 18, 'submitted', NULL, '2025-12-20 17:20:43', '2025-12-27 01:00:12', 1, 2, 2, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'Kartika Fajriani', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '26270100006', 28, 'submitted', NULL, '2025-12-20 17:52:03', '2025-12-27 01:00:12', 1, 1, 1, 'Umum', 'Website Resmi UNU Kaltim', NULL, 10, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '26270100007', 30, 'submitted', NULL, '2025-12-22 07:17:16', '2025-12-27 01:00:12', 1, 1, 1, 'Umum', 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '26270100008', 32, 'submitted', NULL, '2025-12-22 21:27:28', '2025-12-27 01:00:12', 1, 1, 1, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / MISSYA', 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '26270100009', 34, 'submitted', NULL, '2025-12-22 22:16:40', '2025-12-27 01:00:12', 1, 1, 1, 'Umum', 'Lainnya', 'Dr. Rudi mulyadi', 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '26270100010', 35, 'submitted', NULL, '2025-12-22 22:26:53', '2025-12-27 01:00:12', 1, 1, NULL, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'Prof. Dr. M. Akbar', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '26270100012', 36, 'submitted', NULL, '2025-12-23 02:06:19', '2025-12-27 01:00:12', 1, 1, 1, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / GRUP RT', 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '26270100013', 39, 'submitted', NULL, '2025-12-25 05:29:33', '2025-12-27 01:00:12', 1, 1, 1, 'Umum', 'Teman/Keluarga', NULL, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, 'Umum/Reguler', 'Jalur pendaftaran umum untuk calon mahasiswa baru', 1, '2025-12-18 00:30:03', '2025-12-18 00:30:21'),
(2, 'Kelas Karyawan', 'Jalur pendaftaran khusus untuk karyawan yang ingin melanjutkan pendidikan', 1, '2025-12-18 00:30:03', '2025-12-18 00:30:03');

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
(1, 'Gelombang 1 2026/2027', 1, '2026/2027', '2025-12-01', '2026-02-28', 1, NULL, '2025-12-12 08:45:50', '2025-12-12 08:45:50'),
(2, 'Gelombang 2 2026/2027', 2, '2026/2027', '2026-03-01', '2026-06-30', 0, 1000, '2025-12-21 04:54:43', '2025-12-21 04:54:54');

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
(1, 'Peserta Didik Baru', 'Jalur penerimaan calon mahasiswa baru.', 1, '2025-12-12 09:25:28', '2025-12-18 01:23:31'),
(2, 'RPL (Rekognisi Pembelajaran Lampau)', 'Jalur penerimaan mahasiswa melalui pengakuan pembelajaran lampau yang diperoleh dari pengalaman kerja dan/atau pendidikan formal sebelumnya (termasuk alih jenjang).', 1, '2025-12-12 09:25:39', '2025-12-19 05:16:08'),
(4, 'Pindahan', 'Jalur penerimaan mahasiswa pindahan dari perguruan tinggi lain.', 1, '2025-12-12 09:26:13', '2025-12-18 01:23:25');

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
('6JtzA5HUyzQmqAv4sbLYRKUODzhE2FwDVFJKSesg', NULL, '66.249.70.7', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.7390.122 Mobile Safari/537.36 (compatible; Google-InspectionTool/1.0;)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWw4bmJ0Qm8yM1hVWThhZTJucGswQ3d2WkE1djVCR1FIUTdhUGtLbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766927282),
('6xmMqEmHxgJ8y4b09nr0LQuv3RkjILfRwyCO2HbE', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjJ5UnRCOGV1ZHVuQ3cyenRRcEI0dlgyOWh1ODZMWjZoVTZhejV6QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766924495),
('a73HNvVH2tIXD2zpiP1w9vkSQYvtKt3W9q4LFzSQ', NULL, '66.249.70.7', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.7390.122 Mobile Safari/537.36 (compatible; Google-InspectionTool/1.0;)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE5jcGZzeG90VElNUmZhcHBEOFNwdXNmeXY1MWdiQjFFb3U3aXFCTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766927350),
('aSqnme7yU9kJ9p2Gm8osyes48eyl7DQ8RkJQLgPp', NULL, '23.27.145.46', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXptd1k3N3ByS0R5M2NvSUZvbUZ0MERDZGJHVnpqSjlwczhTYVVSbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766931654),
('bSrrB2YWlBXpGZn7XW4mnkr98NkLADrdRSYUZYyQ', NULL, '66.249.70.8', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.7390.122 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjIzWlhTVE9KUWJpYWlDRzlKSE5TQWhZOXRZMWNneHFGS3N5VkVvUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766927399),
('bvx7cVo0sVTlNr3aUeOswQQTly38cGTo0lkVnJMo', NULL, '182.8.179.116', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTZlSnhvOEtMQlBEdklpM1NwYTNUMEtSUUZ6TGRMdUcyRmVwSEJINiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766971240),
('c4yPDMW16H8ePYTmXc1FN5rHvrjf7FeqrLK6mrV0', NULL, '47.128.122.111', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; TikTokSpider; ttspider-feedback@tiktok.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnhzV0dCRXo2MlZSbkVKVUlCcUFWY0NHZ3FOd1JwS2Q1cFhCeDRVdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766957521),
('czjpV4KBWl3d3LZHN0hmxNEy8SqzK3sfeF09lUUH', 1, '182.8.179.116', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWmd2Mm0wbVNKUEVLRE84RkpWSjlHMGZQNDB5N2NtdFg2T25NUmhGNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1766919145),
('F910GFBMeaqPTg09dPtvqVo3vbXYV3kUWHy2DNiP', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkVPUXJOS2VSRklpdGRDQ05jRmw4VlI3cFdqUDJpUEFTMXZMRXFtSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQvc2l0ZW1hcC54bWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766957365),
('feYXNriVDvv88SKkaQAmegT7AoaP9WJCDSt2rski', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0lLaWtNS0ZWaFg5eUQwUDRhRExGV2hnRVVmNkFKYnpBTEtzZEdjMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQvc2l0ZW1hcC54bWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766964493),
('fIxTMjjeFwSEdHdxkDcPND8FmKNz7cUYdSeDJXD9', 1, '182.8.179.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYXdTRmdxRWUzWGhuc3ZFeW9VSUtNUk5wNm5YY2hvOVFMOXFQeXFjNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1766927731),
('GGeGDjp56MkwNG1BADiiHk0aOc1PT78M4koy0AsY', NULL, '57.141.2.33', 'meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2oweEJWTEJnVmt2RFA3aWN4VlVQeE91UzRZakVqU1Z4TTNpZmJOSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9wYW5kdWFuLWxlbmdrYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766956693),
('gRUTPGkKI2fhZjHi5lORjlSQ1iDO48mCoeoB2RpE', NULL, '57.141.2.26', 'meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXlLeHZjZEI1Tm9WTGd0NVFDbk5abFBzOHFRbGFTejRWQ2dWUnpZdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766958498),
('h3QX4YCwKe70CMdWYxXYQy1fnyAyNOLaanQRkg9v', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHFGU0tVVVR1emhYdGo4SDNYQkoxcWpvYThKNmJLWmZyS0szVmJjWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766931074),
('h8cBBPjVU5DIX023J3KzUS0jQkjyq526NDZfRrNH', NULL, '185.247.137.116', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUFxVkg4QThQb2pLRzRlVzd0S1RmUlBsUW1hcnZiV1pZU0xHQk9tRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766957221),
('irkw2lax0nMNJDphRYr8rlt2kX8AJjgBa0PDo8iW', NULL, '114.10.139.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22F76 Instagram 397.1.0.38.81 (iPhone14,5; iOS 18_5; id_ID; id; scale=3.00; 1170x2532; IABMV/1; 790717060)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnd2RDMyTk11MW44TWVqVXEwTUJxbWE5VEJpTFpNdDdWVHlmVzBSWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM2OiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2ZiY2xpZD1QQVpYaDBiZ05oWlcwQ01URUFjM0owWXdaaGNIQmZhV1FQTVRJME1ESTBOVGMwTWpnM05ERTBBQUduVzdQWjRzaVFTeEtKWWgySDZwNHFweXlrbGEtUmg4U0hYUWIxUnFRS3FSanNMMUlMeU1qVzdzV01fblVfYWVtX3U1WXloQ2gzT0xrai1zU2tvc0pwOEEmdXRtX2NvbnRlbnQ9bGlua19pbl9iaW8mdXRtX21lZGl1bT1zb2NpYWwmdXRtX3NvdXJjZT1pZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766926724),
('LzkTjEm62EHiTyXEkHrVTl9paPixDpJ7j93pmR5v', 1, '182.8.179.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN09vaW8yMVNsbEdlbkY2WWpoa1dWQzFBaG1SbUxpN21xaTdvUkdrdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1766931204),
('M2lnnKUiMLlai2AijzYQkR51zxjU2cTwmrcqeJ3t', NULL, '52.87.188.199', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUR1YkF4eU9JSnhaMlJPeGRJcG5BbEN0dEpIdlc4TDBDbWdtTmtRciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766940891),
('NmDhumrTU80YFAOmmTjwSlcXKzaPINYWj7LByd7U', NULL, '35.174.113.77', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV205QjhrY0pPelg4NEJodTVJOVFkVWRGeVZmTGtVcjNjR2YzTVN3QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766940892),
('NSSOUcHvKj3b28e59vDqyycAvrqUuGoYgwiNekdR', NULL, '66.249.70.1', 'Mozilla/5.0 (compatible; Google-InspectionTool/1.0;)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3lTc0VaQVVRa2VaWFh5THlwMnk4WkFPeXZwdUVUQzZVVDc0NG02aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766927281),
('nwFXrKNILqgmG3AI1zYBZG1z4QaBMgYtCTnTEqvm', NULL, '66.249.70.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.7390.122 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlpoYXkzUjZDNnQwOU5seG9UelEwWHFVYXVIUjlPZWRlQ0NKYXhUVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766960112),
('nzuu9yn6nZiDskLRAGeZcB6oEw0xqSSodpMYaU3G', NULL, '74.7.227.19', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNURzVU1ZbmZsdDRWck1ZbzA4WHQwaXRzSms0bEFzSmJCWDRnNFg3TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766961588),
('O3y80wNX4yJkxQNLk2D7GVOWT5qQc28dfHRRnNyO', NULL, '182.8.179.116', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjJ1c0NiR1NuNWM5ZkJvcTE2MlFyUVN5Z3Vnc0twZDBKTHBWSWJWRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766937218),
('ORUGL08raZoGnxt0nZXwFgsHtoaeaJFQIJdSFJQ3', NULL, '3.231.225.47', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmo1SjFpaGR5RW5jVWc1Uk1kVHdMOXhTNGlsR2RqR000VEJ5ZXlVNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766969680),
('rihQrlZQshLFS2tp52b4QtWLoXezFfuL877jIqO5', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1JzdnBtazNESmNPMVAxa28xRlZhb0QzYUlJSTJ3RVdkbHpyM29vYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQvc2l0ZW1hcC54bWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766969702),
('sCqKpLo7AONeZCDIrAD55dIUB3yq85UKpoQwi16j', NULL, '66.249.70.8', 'Mozilla/5.0 (compatible; Google-InspectionTool/1.0;)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlBzR2dhU1NTUkFSWWw2WnpIZVljWndjUklEV2o3cERPVkpyc2FKbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766927355),
('t4ARnUHHBOeMQj0K30ZmTtprm92KJk5FNUJ4kaDQ', 17, '103.166.213.250', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibGlWdDNkQ0R6N1JnT3FmU2VCZkNQYU5vTTRWWDRSS080ZW5tc1ZxQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9hZG1pbi9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNzt9', 1766925966),
('TG8hn1voEJQLNXFYV6Z6rBJjgbyoyxWe6fo8EnBh', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaE1NYzI0N2dLYk1VR1JYWFliZ0VLUFNmODV4TmFjazdGbTdaZG9UMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQvc2l0ZW1hcC54bWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766961942),
('UAmDk6EMytoBO0R11eK7HrgglkqNCoxic6VqEHfO', NULL, '34.169.98.130', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUxmNjE0ajhPNE5XNFZvVTdMNnY2eE95RHYxV1JjZ2Z0MDA3cTVtTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766918121),
('uOsZt1vYejiPrd0b6IqNQGPAeJWhMhrqLkqDQMzo', NULL, '149.57.180.99', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3hZV2x3WGZGakZtZ2tUb0V3d3VnZTNPcU9jQkpBSlVuZGF3YlRQdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766931243),
('uQh0hfa2o1Xk4MfGpEDFNcYMByAi89igaMUn7enE', NULL, '71.6.134.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicENPdUp1Z0c2NVZ4eHU4cUdIbXRQaVZueFFkUnJ3RGVBNE1UMXIyeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766965293),
('V5IFFys3ZtHuecRXOENkpUrtOVuu4Jvnl53zmanM', NULL, '44.202.83.181', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkkyRmpDRll3NHVWaWNNbG0zV3JjcGltbElEMkpxam1WVnVKMHR4QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766969690),
('vV3bh9sYhfxqiVTK9piSRBAJ5Faj3ViDvdT9YH71', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGZ3c2NxdEJ6U3ZOVTJzSDRDYXI2VjVKa1VZbXluQWtPRkh5VXBFWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766947471),
('xZFShZmo0bZHjJjzz0TQGc4FMpqjpiVDwKrhWQHU', NULL, '23.27.145.215', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzJmZUNFT0thQ2JNV3ZvT0lOMWozV0paVm05QklHSUhrbGs2Y05SUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766924631),
('YWQ39S0c7K5kbYTIHTwxV3uB32qHi50Z05s66HKb', NULL, '66.249.70.8', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFF4WGUyU21hczBUdjZ0VlExZnF2eUJUeFpWMFdrakZCN1hqaFZscSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766953629),
('Z6efKzHVjlh3qMGh4nllFDOY8M6TbXomqU9Ue7RE', 1, '182.8.179.116', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT25SaEk4OUdQejZYSjg1ZlJsbGxuOVF1QVNTSjNzZ09YOGxYWnZ0UiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cHM6Ly9wbWIudW51a2FsdGltLmFjLmlkIjt9fQ==', 1766926579),
('zlvl2zoyXsO3nfkvgGfbHQ4vjbs6j1DnKyTPbaKL', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2J3MFVpZjdibFNRTjBHQkl4YmxoRVdQV1p2TVMzZWdyVlFpNlpEUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766918052);

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

INSERT INTO `student_biodatas` (`id`, `user_id`, `name`, `nik`, `nisn`, `last_education`, `school_origin`, `major`, `phone`, `gender`, `birth_date`, `birth_place`, `religion`, `address`, `photo_path`, `kk_path`, `ktp_path`, `certificate_path`, `created_at`, `updated_at`) VALUES
(4, 14, 'terimakasih', '1111111111155555', '1111222234', 'SMA/SMK Sederajat', 'SMAN 99', 'IPA', '00000009999', 'Laki-laki', '1999-09-01', 'Goa', 'Buddha', 'Sangkotek', 'students/photos/9maStVt6FYMWBEn5AxHNHo07kwd924FY0a0dbMt5.png', 'students/kk/9mFMppWZW93l9zCOox2BQ9iJXuI9TFfAE6khEGwG.pdf', 'students/ktp/zHEQRfV8hInQcs5bn9NMoVahJsCLlH4UkrAXknAK.png', 'students/certificates/oe3w6Cv9w0pBfbieKDjq090OMrVnwirnJZ5t5SHx.png', '2025-12-15 21:22:00', '2025-12-15 21:22:00'),
(5, 20, 'tes', '6472012505940002', '0000446789', 'SMA/SMK Sederajat', 'SMKN11 Samarinda', 'Tata boga', '08164500575', 'Laki-laki', '1997-12-17', 'Jakarta', 'Islam', 'jalan anugrah', 'students/photos/JaECwJShMzsSu92gy9lvsz1k6pIB2L1nR3PtHBEJ.jpg', 'students/kk/26Gc7p7Lmzw8IH96lKQVyx6y7Rq9KXiuYVlOEprz.jpeg', 'students/ktp/ZtvSJChaAYPGfgHHvRfLS1drnSYcdi1EqipzKJVh.jpg', NULL, '2025-12-16 23:04:32', '2025-12-16 23:04:32'),
(6, 21, 'kapunkapmoi', '0000000000000002', '0900000009', 'SMA/SMK Sederajat', 'SMAN 99', 'Iwak', '09990000888', 'Laki-laki', '2004-09-01', 'HIJAU', 'Konghucu', 'Jl. APT. Pranoto, Kel. Gunung Panjang, Kec. Samarinda Seberang, Kota Samarinda', 'students/photos/xzuuHaqnaBjscb5yrzp0h8iMaZhbYTjFwbwYjQ0D.png', 'students/kk/lk42Tu3ndCUbpz0fGkEWDnooNUfaY7JXLWrSUxN7.pdf', 'students/ktp/kwtyVnglX5fIx4TRIL42KdlMSmZbbltpE1NyCD5e.pdf', NULL, '2025-12-16 23:22:59', '2025-12-16 23:22:59'),
(7, 19, 'Muhammad Raihan Pratama', '6472061907050003', '0059984152', 'SMA/SMK', 'SMK KEHUTANAN NEGERI SAMARINDA', 'Teknologi Produksi Hasil Hutan', '081256538995', 'Laki-laki', '2005-07-19', 'Samarinda', 'Islam', 'Jl. Jakarta 1 Perum BCL Blok B.8 No.4, Kel. Loa Bakung, Kec. Sungai Kunjang, Kota Samarinda, Provinsi Kalimantan Timur.', 'students/photos/Oqjx2EG2Y3FGkKglFlHUyi7HfmIftu9rUjkl5LpE.jpg', 'students/kk/FHUWyk1Mu1hXgtYrPl7yBmRrehTS1Soy0lNgEHLj.pdf', 'students/ktp/KL3WIEVOtO69cHaKO4nNMRvsJjXtoc7BHnUKNkvY.jpg', 'students/certificates/RVsD0TzmGLZwByUfRAl1VlQigV9ULuBQe3KWrPiw.pdf', '2025-12-17 04:23:27', '2025-12-18 00:31:06'),
(8, 22, 'IKWALUDIN IRKHAMNI', '6472051103030004', '0031739671', 'SMA/SMK', 'SMK Negeri 5 Samarinda', 'Bisnis dan Pemasaran', '083852596613', 'Laki-laki', '2003-03-11', 'Samarinda', 'Islam', 'Jl. Trisari RT. 21', 'students/photos/cW8q2NeIXCma3zQZj2vpT5nD6CI8HJlHgWJwQEVY.jpg', 'students/kk/03Pq9ptRVeRvL8fYgI4gcLheLD1Dx8tYFhr0u69r.pdf', 'students/ktp/mBTvA8mNVAQY3UxTFsWCzIGJxPS1O7pmEEdmCTu5.pdf', 'students/certificates/MPHNqMF169WN15cniuo7fLHkvA2wQAD5ElMKDEO4.jpg', '2025-12-17 19:09:08', '2025-12-17 22:56:58'),
(9, 23, 'Mouhammed Zidane Basayev Al Usman', '6471031207030005', NULL, 'SMA/SMK', 'SMK TI LABBAIKA', 'Teknik komputer dan jaringan', '087715729215', 'Laki-laki', '2003-07-12', 'Bogor', 'Islam', 'Jl. Pada Elo No.173 Rt.002', 'students/photos/zY63zlZaqPuQH4OsYSW59rjwtJeP8voE2ZwN9IIH.jpg', 'students/kk/2JAHuXJQZGy70tkgomE2sqOz6cqfyMtgcHkxjLkx.pdf', 'students/ktp/ZQl4MtufylugATjl0MmAoferoQWaIgiEGqX9W6RJ.pdf', 'students/certificates/RVItoQy8UeMTBXeedacw04p1ZaHeQ0XKaJCDyuVl.pdf', '2025-12-17 19:38:31', '2025-12-18 00:31:46'),
(10, 25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', '6472023105050001', '0052490733', 'SMA/SMK Sederajat', 'PONPES IMAM ASY-SYATHIBY Gowa Makassar', 'Agama Islam', '085750296152', 'Laki-laki', '2005-05-31', 'Samarinda', 'Islam', 'JL. Tanjung Aru, RT.015, Kelurahan Mangkupalas, Kecamatan Samarinda Seberang', 'students/photos/vIeTCL0dRes0kR2st8pnRLf5E8Ckh7h6ha1JUCpE.jpg', 'students/kk/L37drQJW68CkHE7nzl4e4vBolrP5KLVmSpPgYboH.jpg', 'students/ktp/X0PzllONDdkUMvIqN2Hll3KWWlzCGyzlzoggBjHB.jpg', 'students/certificates/rUw64FZchQvpuyUmUeEbyYiatrwnl46CzoHC7q8I.jpg', '2025-12-18 07:19:10', '2025-12-18 07:19:10'),
(11, 26, 'Emilda Ainun alzahra', '6472066005070007', '0074866571', 'SMA/SMK Sederajat', 'SMA BUDI LUHUR', NULL, '085934592604', 'Perempuan', '2007-05-20', 'Samarinda', 'Islam', 'Jalan KS Tubun dalam gang wiratirta RT 17 no 02', 'students/photos/4Itf0t8FJB2DRFumklRxMC1N8LhlLkUZQKc2LVHz.png', 'students/kk/YJ5jfMkcGcDJkjemPWXGUo1eSEU5i5LeAtfiM8yl.pdf', 'students/ktp/lqvOn4UHKIhLAYA2dmKeG92NSOmjuPaoabuSnAP1.pdf', 'students/certificates/T3V2cXFjXIsdlfegXK9NDfGljmkjW92ckJjtKz97.pdf', '2025-12-18 23:59:12', '2025-12-18 23:59:12'),
(12, 18, 'Sindiya kartika', '6402034107991004', '9993349686', 'SMA/SMK Sederajat', 'SMAN 2 LOA JANAN', 'IPA', '085163137202', 'Perempuan', '1999-09-21', 'Bakungan', 'Islam', 'Jl.gerbang dayaku desa bakungan rt 08', 'students/photos/2lj5u37uBswis7H9fk2vBVGUQbaw4xD5MEXwk9qF.jpeg', 'students/kk/z9NjdCiFTtIKHDowiOgu6xUloviZeQ4e5dEh7qBk.jpeg', 'students/ktp/P9yyaXBEYnpEVj7XzNSSJr5Yu5ZRKmnQPTjrJ2Vf.jpeg', 'students/certificates/l9MauTw5EAvvluSLozuUQ8A73fxzAWnGCJodUUhS.jpeg', '2025-12-20 17:11:48', '2025-12-20 17:11:48'),
(13, 28, 'Eka putri nur aisyah', '6402164906050002', '0059599318', 'SMA/SMK Sederajat', 'SMK YPM DIPONEGORO', 'Multimedia', '085822516904', 'Perempuan', '2005-06-09', 'Tenggarong', 'Islam', 'Tenggarong seberang,Manunggal jaya L2 blok E rt 06', 'students/photos/IPSHAQJRU7Z9Vf2PO1l86No8WBADg9Aip3bGKHR2.jpeg', 'students/kk/Jw5mlD9Lhr67Gfh7EwoLT2lEinjTuuHBrhTWwHoz.jpeg', 'students/ktp/7ssLFs75WC089fWZiBT57LsbJ4JOB5m0OW1WgFUM.jpeg', 'students/certificates/LOPIFOZySZgEk2fB3Uq3JgM3wefJZikPck7IA2Fp.jpeg', '2025-12-20 17:50:26', '2025-12-20 17:50:26'),
(14, 30, 'Egha Aulia Renatasari', '6402165606050003', NULL, 'SMA/SMK Sederajat', 'Sma Negeri 1 Tenggarong Seberang', 'ipa', '082255726898', 'Perempuan', '2005-06-16', 'Kutai Kartanegara', 'Islam', 'Desa Sukamaju, Rt 12, No. 16, Kec. Tenggarong Seberang', 'students/photos/SJMqh40UBhODcbFm0bLOm67O704goSFEX59BtjXs.JPG', 'students/kk/sE4Kijmkrs3qQrPEvx2nAAhAvkR1uB0yU4s8SOo3.jpeg', 'students/ktp/OcM50ZemRmstkYZcOUzGbFgEz9JExBjmHThDzouT.jpeg', NULL, '2025-12-22 06:07:19', '2025-12-22 06:07:19'),
(16, 32, 'DHINI ALEXANDRA KUMALASARI', '6472075903060002', '3067311527', 'SMA/SMK', 'SMAN 4 SAMARINDA', NULL, '0895 3443 22525', 'Perempuan', '2006-04-19', 'PETUNG', 'Islam', 'JL. PATIMURA\r\nMANGKUPALAS\r\nSAMARINDA SEBERANG', 'students/photos/fGlHvzBYl3ukSY2wVVZrHjXOKfWHJ0kxl6MEgw6Y.jpeg', 'students/kk/cgQLHvr577X55JFBiseZfaSBEtslwoS2xzPnZsd9.pdf', 'students/ktp/Ri8YCNoIJATEPCmjEPpPEJsNxJ8EKXrxLeppYrQ5.pdf', 'students/certificates/SWBZwfKAtadJW2TgCS9y8GdDvbaxY8Pv4lqYOnEo.pdf', '2025-12-22 21:27:28', '2025-12-22 21:27:28'),
(18, 34, 'Jorong coba saja', '6472050606790017', '84848484', 'SMA/SMK Sederajat', 'Sma', 'Ipa', '08111111111', 'Laki-laki', '2005-09-17', 'Samarinda', 'Buddha', 'Blas bla', 'students/photos/LxoZW3z6qFKa9PbO6UPHytRVOMUl8uLhCmdQ1jm5.jpg', 'students/kk/SadKtrI44PVFWf5oucGmS1wms9HbDm9vuPYrS1kT.pdf', 'students/ktp/wRcVdxBxQF40LXFve5nQvorm6QYwYY8DMyK9w74P.pdf', 'students/certificates/QSoJqdDU9Gmk0Q8vpq8U7o3n7Qp2WEg9Y11sYLO9.pdf', '2025-12-22 22:15:28', '2025-12-22 22:15:28'),
(19, 35, 'Rektor UNU', '6472060820000016', '97392739273', 'SMA/SMK', 'SMA 1', 'IPA', '08155145193', 'Laki-laki', '2000-12-20', 'Samarinda', 'Islam', 'Samarinda', 'students/photos/BhT2obPeemtekrGelKZWIEdIgeEauDzWPV1x24Ug.jpeg', 'students/kk/PMYwkhWObsgtpBTgLbD4j8buHl1VjPnmr7MnCMUp.pdf', 'students/ktp/PrHUPUvqchjebhdpXrdhj09XcRebH9WGsnMjfYyB.pdf', 'students/certificates/u2urQZSkpnk6ze8ZYW7Mxbak4CZPDUBamg4otwjT.pdf', '2025-12-22 22:24:54', '2025-12-22 23:22:24'),
(20, 36, 'ALVIN', '6472012708030002', '0025776132', 'SMA/SMK', 'SMK KESEHATAN', NULL, '+62 851-8498-4637', 'Laki-laki', '2003-08-27', 'SAMARINDA', 'Islam', 'JL. KESEHATAN RAWA MAKMUR PALARAN', 'students/photos/1weXtCAu4a30K365YiXnZSSOBeBiyiXbz6H8TtIN.jpeg', 'students/kk/glzumttGhNAqLhPMTnbp37UJuwtbpNnOfwaLreAP.pdf', 'students/ktp/ueOfE3ud7bgDb53qVI1w5N0IGPvhYAVsobryWOnR.pdf', 'students/certificates/HiQc0HGSuDmW8gjJPU3Q4AEogNb2JUvPgKgbsrQc.pdf', '2025-12-23 02:06:19', '2025-12-23 02:06:19'),
(21, 39, 'Nur Ayu Syafutri', '6472016609030002', '0030295995', 'SMA/SMK Sederajat', 'SMK farmasi Samarinda', 'Teknologi laboratorium medik', '082154177300', 'Perempuan', '2004-09-26', 'Pallangga', 'Islam', 'Jalan Borneo rt 24 samping spbu', 'students/photos/06JZkxVlYrAmXeaJeHMfoftDGC5umQDpubYCS5EW.JPG', 'students/kk/IKIJCdWwCh00Q0sUkOcq3rBYpMZnnv0niw79UVjJ.pdf', 'students/ktp/P6MqzJvaC5Yvd6fD53Ab39bmsTsKYW3Cnm8j88r5.pdf', 'students/certificates/65TdjfFDfotNqh5m9kLKmnrlWBdVZZf50p54P2sw.pdf', '2025-12-25 05:22:32', '2025-12-25 05:22:32'),
(22, 37, 'Dhava ade syawaluddin', '6402160112040001', NULL, 'SMA/SMK Sederajat', 'SMA NEGERI 2 TENGGARONG', 'IPS', '085651251219', 'Laki-laki', '2004-12-01', 'SAMARINDA', 'Islam', 'KUTAI KARTANEGARA TENGGARONG SEBRANG LOA LEPU RT 03', 'students/photos/Rh8TNXBvACZAMBBb7a6s7NM1jWXDzPGPaOq83P8E.jpg', 'students/kk/R89tFAo2sO9NSJp6hRW452HEyCcTGJlvJ35O45wB.jpg', 'students/ktp/f5NKcSpFufVrnVKmPLh9pMftRZBkJ6pk0bKU78qC.jpg', 'students/certificates/ZVxm6jyutNIBo4CGnXKr4TAWWznLCKbOKcomJq66.jpg', '2025-12-25 22:05:15', '2025-12-25 22:05:15'),
(23, 41, 'Xaviera Fowler', '6472015102990222', '0000645689', 'SMA/SMK Sederajat', 'SMKN 22 Samarinda', 'TKJ', '08123344556', 'Laki-laki', '2005-09-25', 'Samarinda', 'Islam', 'Ut elit non recusan', 'students/photos/icM7MdGsVgT6pdzcXe9I1lXMQn6F1jmaxtmVj9wD.jpg', 'students/kk/fG9ZJ9yHOGrqq9Z13LiutGgoeeqefbMfWZgCRcDj.pdf', 'students/ktp/6vUZ9YOYRlf6Kj8THNvRAJifIFgTKie7LdgsTPb9.png', NULL, '2025-12-28 00:07:42', '2025-12-28 00:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'student',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@unukaltim.ac.id', '081155664477', 'admin', '2025-12-13 22:47:43', '$2y$12$sIlHNsGX1IqJU9wWEVP8c.iF1CslG6ixfm7OiKyGZeLVUfLtOf6Di', NULL, '2025-12-12 03:52:02', '2025-12-14 19:19:43'),
(3, 'tes', 'tes@mail.com', '081213141516', 'student', NULL, '$2y$12$2I.oEw3NT9TF6GNDh2I0VuW7prw6pC.vLJAsgtJ83vB2ofuTSM0zG', NULL, '2025-12-12 03:59:48', '2025-12-12 03:59:48'),
(4, 'Miftahurroyyan Al Hasan', 'royyandalhasan@gmail.com', '082197658372', 'student', NULL, '$2y$12$zK30sxpCoB.E4CKaUrJUC.97RhVM3DRlYiwVJuFr6AOXSkaeaZHs6', NULL, '2025-12-12 04:28:40', '2025-12-12 04:28:40'),
(8, '1234567Patimah', 'patimahlim62@gmail.com', '081322915486', 'student', NULL, '$2y$12$DXaj/WMRBp7aWgxLxZyYNuXdv6qVhlsXOKNKA/PhR.zo8Mqz.ztTu', NULL, '2025-12-13 08:16:19', '2025-12-13 08:16:19'),
(9, 'teslagi', 'tes@exmail.com', '081213251513', 'student', NULL, '$2y$12$gwY.s6XnWbqKy5EbF3hlJuPd9IpwhkRacyVeLwzNSbkbbwRnsblfa', NULL, '2025-12-13 09:56:00', '2025-12-13 09:56:00'),
(11, 'Wulandari', 'wulandariiii1801@gmail.com', '083894877734', 'student', NULL, '$2y$12$WmVjyBSE6FCQ1IOJ6mqIzuqg54NtqklK8GmLFCI14QAEMfqikohVG', NULL, '2025-12-13 22:45:55', '2025-12-13 22:45:55'),
(12, 'Wulandari', 'wulann1810@gmail.com', '083894877734', 'student', '2025-12-13 22:47:43', '$2y$12$VNm/0bHtm2gUJihSbeDOdOhvfC92MdYu8.EyIG99OZq.2AFcgou0q', NULL, '2025-12-13 22:46:25', '2025-12-13 22:47:43'),
(14, 'terimakasih', 'raya@unukaltim.ac.id', '00000009999', 'student', '2025-12-14 18:25:28', '$2y$12$xlZ703/LVBLOWExZp4Ar8OCjvfiaMcpMR2ncfLhd84b9/ftfOpRYq', NULL, '2025-12-14 18:24:45', '2025-12-14 18:25:28'),
(16, 'Keisya Nur Alya', 'keisyanuralya0@gmail.com', '081521711804', 'student', '2025-12-15 04:32:58', '$2y$12$xllSYVPPkzCTpQ/XLU8s0OfLCW2SX7tQxqCBH2L8D.rMFPSvAyrE2', 'YAJByxtyh1DNibGUYtikG5xYH5A15OIkX1f1iJMHsy5a344VoqRGjVwIFwLf', '2025-12-15 04:31:42', '2025-12-15 04:32:58'),
(17, 'PMB UNU KALTIM', 'pmb@unukaltim.ac.id', '-', 'staff', '2025-12-15 10:45:14', '$2y$12$fKfSBershUG375WI.ZSJu.FrBGtGB3agP8LGlaXvpjBvIfJX7UEo2', 'sgc1iEL4mcGUWEtJvewgHAivUZosXvmJ7zDZFsRCOwV3B3a0maobvdGXN1rr', '2025-12-15 10:45:14', '2025-12-15 19:39:48'),
(18, 'Sindiya kartika', 'sindiyakartika34@gmail.com', '085163137202', 'student', '2025-12-16 00:28:39', '$2y$12$ly4fNnBXGYPYif68qCJn1OsFLfNQAwFFbxjWxclNjJlPZ8Mc.oaaa', 'wcuBGpB64pOTc3R68Uht4GIpnvD9nk1MFeb5ndeqmt3s34S5SnN7tJUniBEI', '2025-12-16 00:25:23', '2025-12-16 00:28:39'),
(19, 'Muhammad Raihan Pratama', 'muhammadraihanpratama23@gmail.com', '081256538995', 'student', '2025-12-16 22:17:42', '$2y$12$QTkiBoYgkIIADjbrhgOk0e5fmFX66zVXg9E5KOYkaOLb/tDWswZHe', 'xWNMHhajAzlXRWX0tCgoNYQoHLxWh7rL1SfVIk0YpJF2Oi7Lr8hLBDMlp7oJ', '2025-12-16 22:16:36', '2025-12-16 22:17:42'),
(20, 'tes', 'rezamuhammad980@gmail.com', '08164500575', 'student', '2025-12-16 23:01:53', '$2y$12$2iJeAbMvrBi/GjsO7GdIvukx9ZZxkuhdsNY9ah8hQHfY7W9xxIpbi', NULL, '2025-12-16 23:01:36', '2025-12-16 23:01:53'),
(21, 'kapunkapmoi', 'rayafachreza739@gmail.com', '09990000888', 'student', '2025-12-16 23:20:45', '$2y$12$zXLs.Us0Hhuyxf1XNJ9jVuU7QLeoNv3UEdvOr2Jd4fojyiRPiTYqG', NULL, '2025-12-16 23:18:57', '2025-12-16 23:20:45'),
(22, 'IKWALUDIN IRKHAMNI', 'ikwaludini@gmail.com', '083852596613', 'student', '2025-12-17 18:59:18', '$2y$12$qU0AjNX3rssjnYXVdq1mBusUNovMgZXBAJhNcwbXaJZ2QlUsUgGyK', 'AXp1dDjn99MP9zWGEwkpn2UXxWmMpOZT5seEDoME0LC3gxgNqUV2pvcNCSRu', '2025-12-17 18:55:26', '2025-12-17 18:59:18'),
(23, 'Mouhammed Zidane Basayev Al Usman', 'zidanbasayev7@gmail.com', '087715729215', 'student', '2025-12-17 19:31:09', '$2y$12$PW/jiamA6f1/jJMWPOacyOlxB5C59aL8p5gsdSF1fN1ojLbIaBNLq', NULL, '2025-12-17 19:30:35', '2025-12-17 19:31:09'),
(24, 'WR 1', 'wr1@unukaltim.ac.id', '080000000000', 'staff', '2025-12-17 20:38:43', '$2y$12$es48CvnMfpfsFFGnNqG7eOK3pvyXp3vxWSWFwssd0Z9.mVKGRY8u6', 'p12lWwMTtqE1MwJKGMxzYcUXdvd2WwTko4AG4ZOs5YSsSt66abgABsjZm3bj', '2025-12-17 20:38:43', '2025-12-17 20:38:43'),
(25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', 'shevapratama946@gmail.com', '085750296152', 'student', '2025-12-18 06:24:24', '$2y$12$ctZ22aZ.AkW4e1LUDSZ5Fut2sCFUxFvWE7M9ElBnxsHYDET06exi2', 'Q3WvUjJLgZvFuubswOf6OPEBTHH85GflSI5WQ6Q3yQ8hPQ6FnZ4baAw9UMjy', '2025-12-18 06:23:33', '2025-12-18 06:24:24'),
(26, 'Emilda Ainun alzahra', 'emildaazzahra79@gmail.com', '085934592604', 'student', '2025-12-18 23:24:38', '$2y$12$gg0n0K46o47gwDxHAEOrQOUnsHYxMyVt7rX7tJhDzfo2Q0QpBUu.6', NULL, '2025-12-18 23:11:24', '2025-12-18 23:24:38'),
(27, 'rizalmulyono', 'ka.upm.feb@unpad.ac.id', '08564789632', 'student', NULL, '$2y$12$wkIx2Z4ws7.0pwYftQhXFO.f1htJ5svhwwBGfe.bX9keBq2oLrL3G', NULL, '2025-12-19 06:52:06', '2025-12-19 06:52:06'),
(28, 'Eka putri nur aisyah', 'ekaputrinuraisyah2@gmail.com', '085822516904', 'student', '2025-12-20 06:26:31', '$2y$12$Bs/gQJCaz8nZeueC0peKz.tzCwqBSqGl/.8eOIeftqZwX9QnmgG76', 'xZZk0tGw5bKIs4eCavVPtXadCgYfpItIlekrIYzNAojBMeE6BEgCRJvLcUUz', '2025-12-20 06:25:13', '2025-12-20 06:26:31'),
(29, 'Egha Aulia Renatasari', 'eghaauliaaa@icloud.com', '082255726898', 'student', NULL, '$2y$12$Q8CXctEVlYfw8nOsVnCTqOA3p1ANSy8PGZwzmPccv56P1ySCENPg6', 'vjnuS6pdyd1wmoyFBr4uuRNklZT8QwevqZ8JFW7AEsBv0UrUvIB9jIr2W9Ro', '2025-12-21 00:51:03', '2025-12-21 00:51:03'),
(30, 'Egha Aulia Renatasari', 'auliaegha045@gmail.com', '082255726898', 'student', '2025-12-21 23:06:11', '$2y$12$Gbc7sHFv4KSxUSNvZura3uMXFLDq2gEscEDpA816tqkUbKbpygB/u', 'fyW6t6sCw7mGTJRPIqM1nSkXlBGb98Uj9isyQTg0DW7b4qRrTtwsSSbQd20p', '2025-12-21 23:01:51', '2025-12-21 23:06:11'),
(32, 'DHINI ALEXANDRA KUMALASARI', 'ghinaahyti03@gmail.com', '0895 3443 22525', 'student', '2025-12-22 21:27:28', '$2y$12$eHXIrVz7IOWnXYRJhYxyAOgYCWk01vuuCrqoloJbERDGyuAJH.JZC', NULL, '2025-12-22 21:27:28', '2025-12-22 21:27:28'),
(34, 'Jorong coba saja', 'thekoetai@gmail.com', '08111111111', 'student', '2025-12-22 22:10:48', '$2y$12$mDKhzKuTSOEcfyFzUQpedOba2alth6eNIT3QBTMuVNxGMbn2bYMeO', NULL, '2025-12-22 22:09:44', '2025-12-22 22:10:48'),
(35, 'Rektor UNU', 'rektor@unukaltim.ac.id', '08155145193', 'student', '2025-12-22 22:19:34', '$2y$12$vQ8aDxPP4WsGGb8FAkmdBOIKEsoHa9J89MjDWlHAtU4/mMohK33Me', NULL, '2025-12-22 22:18:42', '2025-12-22 23:22:24'),
(36, 'ALVIN', 'anaksultan2708@gmail.com', '+62 851-8498-4637', 'student', '2025-12-23 02:06:19', '$2y$12$Tei/9jSGqFMnsjBKjFjgZurCjQ.TP3GtHP4e/0TAqrG.Qg6Xenzay', NULL, '2025-12-23 02:06:19', '2025-12-23 02:06:19'),
(37, 'Dhava ade syawaluddin', 'dhavaade112@gmail.com', '085651251219', 'student', '2025-12-23 21:39:19', '$2y$12$xPeFVtHde9NQyZq.O3Pf.u5PFebtHJtHH5l91f7NK6ZxsTJ5NSF02', NULL, '2025-12-23 21:38:18', '2025-12-23 21:39:19'),
(38, 'Nurul alfira', 'nurul.alfira048@gmail.com', '085183040894', 'student', '2025-12-23 22:11:58', '$2y$12$0p4gSqg.6dv3.XSWOmibYuHYRBTRYR6H9XI.CrqeaTFbbrl7SC/E.', NULL, '2025-12-23 22:11:13', '2025-12-23 22:11:58'),
(39, 'Nur Ayu Syafutri', 'ayusyahfutri479@gmail.com', '082154177300', 'student', '2025-12-24 23:28:11', '$2y$12$489UjJ0BAjO9p/VcK5hlCuPgIxGiP6U/0ymmxt.7gAKkaKkOfpNEq', 'AZQNnvo96q3nQtRhCZ8uErXnGArSBvmnuvQwpzfDahHM64Ni9e0MLxlt3Ujg', '2025-12-24 23:21:38', '2025-12-24 23:43:34'),
(40, 'Anita Ardian', 'anitaardian680@gmail.com', '085651337295', 'student', '2025-12-26 06:38:43', '$2y$12$wzCkco3gnhNQQHeJtG/8BO6wvL05OG4wfA7/.W/EKL/sHpTY/a6/C', NULL, '2025-12-26 06:38:20', '2025-12-26 06:38:43'),
(41, 'zeze', 'rezamuhammad981@gmail.com', '085157411283', 'student', '2025-12-28 00:05:47', '$2y$12$pA4mhfb1DOTrBcxPr9L7VOw.rSUW9843qxHZPU9dldyJ8q.FeUGfu', NULL, '2025-12-28 00:04:52', '2025-12-28 00:05:47');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `document_verifications`
--
ALTER TABLE `document_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- AUTO_INCREMENT for table `student_biodatas`
--
ALTER TABLE `student_biodatas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
-- Constraints for table `student_biodatas`
--
ALTER TABLE `student_biodatas`
  ADD CONSTRAINT `student_biodatas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
