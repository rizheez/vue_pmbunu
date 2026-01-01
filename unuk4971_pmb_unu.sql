-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 01, 2026 at 07:47 PM
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
(1, '⚠️Waspada Penipuan PMB UNU Kaltim', 'Kepada seluruh calon mahasiswa, pendaftaran Penerimaan Mahasiswa Baru (PMB) Universitas Nahdlatul Ulama Kalimantan Timur secara online hanya dilakukan melalui situs resmi PMB UNU Kaltim. Untuk informasi dan pelayanan PMB secara offline, silakan datang langsung ke Sekretariat Penerimaan Mahasiswa Baru Universitas Nahdlatul Ulama Kalimantan Timur sesuai dengan jam operasional kampus. Apabila terdapat pihak yang mengatasnamakan PMB UNU Kaltim di luar kanal resmi, diimbau untuk tidak menanggapi dan segera melakukan konfirmasi melalui kontak resmi universitas.', 1, '2025-12-13 15:17:36', '2025-12-15 12:41:53');

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
('pmb-unu-kaltim-cache-08eaff7e39bdeead91cba2d57c45b80f', 'i:1;', 1767228025),
('pmb-unu-kaltim-cache-08eaff7e39bdeead91cba2d57c45b80f:timer', 'i:1767228025;', 1767228025),
('pmb-unu-kaltim-cache-19294fb93a5b96ae949b724b276192ed', 'i:1;', 1767076702),
('pmb-unu-kaltim-cache-19294fb93a5b96ae949b724b276192ed:timer', 'i:1767076702;', 1767076702),
('pmb-unu-kaltim-cache-22f45531dcafd11c51c06dc5da3ad9ed', 'i:1;', 1767103641),
('pmb-unu-kaltim-cache-22f45531dcafd11c51c06dc5da3ad9ed:timer', 'i:1767103641;', 1767103641),
('pmb-unu-kaltim-cache-309aa85e12405a46bc2160ad031457f8', 'i:1;', 1767174227),
('pmb-unu-kaltim-cache-309aa85e12405a46bc2160ad031457f8:timer', 'i:1767174227;', 1767174227),
('pmb-unu-kaltim-cache-3f688ed4fbd5f0ab550a9b6b629dea8d', 'i:1;', 1767068022),
('pmb-unu-kaltim-cache-3f688ed4fbd5f0ab550a9b6b629dea8d:timer', 'i:1767068022;', 1767068022),
('pmb-unu-kaltim-cache-5496973b7dc1385a411dbf0860575b88', 'i:1;', 1767256080),
('pmb-unu-kaltim-cache-5496973b7dc1385a411dbf0860575b88:timer', 'i:1767256080;', 1767256080),
('pmb-unu-kaltim-cache-5528468a1d47469c194c6544cac404bd', 'i:1;', 1767163626),
('pmb-unu-kaltim-cache-5528468a1d47469c194c6544cac404bd:timer', 'i:1767163626;', 1767163626),
('pmb-unu-kaltim-cache-7314243f7561b444d4485195fb53c702', 'i:1;', 1767059304),
('pmb-unu-kaltim-cache-7314243f7561b444d4485195fb53c702:timer', 'i:1767059304;', 1767059304),
('pmb-unu-kaltim-cache-73e3c6c815e97a878fe6d9b33a31fab0', 'i:1;', 1767059282),
('pmb-unu-kaltim-cache-73e3c6c815e97a878fe6d9b33a31fab0:timer', 'i:1767059282;', 1767059282),
('pmb-unu-kaltim-cache-775e662033e80aa1867fd56ab51df2e1', 'i:1;', 1767219318),
('pmb-unu-kaltim-cache-775e662033e80aa1867fd56ab51df2e1:timer', 'i:1767219318;', 1767219318),
('pmb-unu-kaltim-cache-802919df94ac593884342488c93aef07', 'i:2;', 1767157785),
('pmb-unu-kaltim-cache-802919df94ac593884342488c93aef07:timer', 'i:1767157785;', 1767157785),
('pmb-unu-kaltim-cache-8e2f4e3a1ae20c898c7b7e6237cd2f33', 'i:1;', 1767156787),
('pmb-unu-kaltim-cache-8e2f4e3a1ae20c898c7b7e6237cd2f33:timer', 'i:1767156787;', 1767156787),
('pmb-unu-kaltim-cache-92cfceb39d57d914ed8b14d0e37643de0797ae56', 'i:1;', 1767158405),
('pmb-unu-kaltim-cache-92cfceb39d57d914ed8b14d0e37643de0797ae56:timer', 'i:1767158405;', 1767158405),
('pmb-unu-kaltim-cache-b79e6a7dd0570cd9a57168db74dc78dd', 'i:3;', 1766989041),
('pmb-unu-kaltim-cache-b79e6a7dd0570cd9a57168db74dc78dd:timer', 'i:1766989041;', 1766989041),
('pmb-unu-kaltim-cache-c3081b3004cd1fefc25044d67caff896', 'i:1;', 1767173949),
('pmb-unu-kaltim-cache-c3081b3004cd1fefc25044d67caff896:timer', 'i:1767173949;', 1767173949),
('pmb-unu-kaltim-cache-d18d51cfb4368bd8c1caf4c4655cd907', 'i:1;', 1767063411),
('pmb-unu-kaltim-cache-d18d51cfb4368bd8c1caf4c4655cd907:timer', 'i:1767063411;', 1767063411),
('pmb-unu-kaltim-cache-ea648de16e58124c44f2a91ea743c730', 'i:1;', 1766995922),
('pmb-unu-kaltim-cache-ea648de16e58124c44f2a91ea743c730:timer', 'i:1766995922;', 1766995922);

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
(4, 4, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(5, 4, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(6, 4, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(7, 4, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(8, 4, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(9, 5, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(10, 5, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(11, 5, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(12, 5, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(13, 6, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(14, 6, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(15, 6, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(16, 6, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(17, 7, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(18, 7, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(19, 7, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(20, 7, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(21, 7, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(22, 8, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(23, 8, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(24, 8, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(25, 8, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(26, 8, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(27, 9, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(28, 9, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(29, 9, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(30, 9, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(31, 9, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(32, 10, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(33, 10, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(34, 10, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(35, 10, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(36, 10, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(37, 11, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(38, 11, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(39, 11, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(40, 11, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(41, 11, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(42, 12, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(43, 12, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(44, 12, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(45, 12, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(46, 12, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(47, 13, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(48, 13, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(49, 13, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(50, 13, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(51, 13, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(52, 14, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(53, 14, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(54, 14, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(55, 14, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(56, 16, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(57, 16, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(58, 16, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(59, 16, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(60, 16, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(61, 18, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(62, 18, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(63, 18, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(64, 18, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(65, 18, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(66, 19, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(67, 19, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(68, 19, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(69, 19, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(70, 19, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(71, 20, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(72, 20, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(73, 20, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(74, 20, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(75, 20, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(76, 21, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(77, 21, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(78, 21, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(79, 21, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(80, 21, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(81, 22, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(82, 22, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(83, 22, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(84, 22, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(85, 22, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-26 17:58:56', '2025-12-26 17:58:56'),
(86, 23, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-27 17:07:42', '2025-12-27 17:07:42'),
(87, 23, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-27 17:07:42', '2025-12-27 17:07:42'),
(88, 23, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-27 17:07:42', '2025-12-27 17:07:42'),
(89, 23, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-27 17:07:42', '2025-12-27 17:07:42'),
(90, 25, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-30 22:20:05', '2025-12-30 22:20:05'),
(91, 25, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-30 22:20:05', '2025-12-30 22:20:05'),
(92, 25, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-30 22:20:05', '2025-12-30 22:20:05'),
(93, 25, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-30 22:20:05', '2025-12-30 22:20:05'),
(94, 25, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-30 22:20:05', '2025-12-30 22:20:05'),
(95, 26, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-31 03:12:45', '2025-12-31 03:12:45'),
(96, 26, NULL, 'photo', 'pending', NULL, NULL, 0, '2025-12-31 03:12:45', '2025-12-31 03:12:45'),
(97, 26, NULL, 'ktp', 'pending', NULL, NULL, 0, '2025-12-31 03:12:45', '2025-12-31 03:12:45'),
(98, 26, NULL, 'kk', 'pending', NULL, NULL, 0, '2025-12-31 03:12:45', '2025-12-31 03:12:45'),
(99, 26, NULL, 'certificate', 'pending', NULL, NULL, 0, '2025-12-31 03:12:45', '2025-12-31 03:12:45');

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
(1, 'Fakultas Ekonomi dan Bisnis', 'FEB', 'Fakultas yang menyelenggarakan pendidikan di bidang ekonomi dan bisnis', 1, '2025-12-12 19:57:10', '2025-12-12 19:57:10'),
(2, 'Fakultas Teknik', 'FT', 'Fakultas yang menyelenggarakan pendidikan di bidang teknik dan teknologi', 1, '2025-12-12 19:57:10', '2025-12-12 19:57:10'),
(3, 'Fakultas Ilmu Sosial dan Kependidikan', 'FISKEP', 'Fakultas yang menyelenggarakan pendidikan di bidang ilmu sosial dan pendidikan', 1, '2025-12-12 19:57:10', '2025-12-12 19:57:10'),
(4, 'Fakultas Farmasi', 'FF', 'Fakultas yang menyelenggarakan pendidikan di bidang farmasi', 1, '2025-12-12 19:57:10', '2025-12-12 19:57:10');

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
(1, 'hero_title', 'PMB Universitas Nahdlatul Ulama Kalimantan Timur', 'text', 'hero', '2025-12-12 19:57:34', '2025-12-15 18:31:26'),
(2, 'hero_subtitle', 'Kuliah Mudah, Terjangkau, dan Berbasis Nilai Keislaman', 'text', 'hero', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(3, 'hero_description', 'Universitas Nahdlatul Ulama Kalimantan Timur membuka Penerimaan Mahasiswa Baru (PMB) melalui sistem pendaftaran online. Tersedia berbagai jalur masuk serta kesempatan mendapatkan beasiswa dan bantuan biaya pendidikan bagi calon mahasiswa yang memenuhi persyaratan.', 'textarea', 'hero', '2025-12-12 19:57:34', '2025-12-15 18:31:26'),
(4, 'hero_button_text', 'Daftar Sekarang', 'text', 'hero', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(5, 'hero_button_url', '/login', 'url', 'hero', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(6, 'hero_background_image', 'landing-page/AGTvP1xN1DocnjKQGz9UaZlNzCB0nEgu3OaeHwka.jpg', 'image', 'hero', '2025-12-12 19:57:34', '2025-12-14 13:23:18'),
(7, 'feature_1_title', 'Beasiswa & Bantuan Pendidikan', 'text', 'features', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(8, 'feature_1_description', 'UNU Kaltim menyediakan kesempatan beasiswa dan bantuan biaya pendidikan, termasuk program KIP-Kuliah, GratisPol, dan skema pendukung lainnya, untuk membantu mahasiswa menyelesaikan studi dengan lebih ringan.', 'textarea', 'features', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(9, 'feature_1_icon', 'clipboard-check', 'text', 'features', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(10, 'feature_2_title', 'Program Studi', 'text', 'features', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(11, 'feature_2_description', 'Tersedia berbagai program studi unggulan pada beberapa fakultas yang dirancang selaras dengan kebutuhan dunia kerja dan perkembangan ilmu pengetahuan serta teknologi, membekali mahasiswa dengan kompetensi siap kerja, ijazah resmi, dan peluang meraih sertifikat kompetensi BNSP sesuai bidang keahlian.', 'textarea', 'features', '2025-12-12 19:57:34', '2025-12-15 03:02:34'),
(12, 'feature_2_icon', 'graduation-cap', 'text', 'features', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(13, 'feature_3_title', 'Lingkungan Akademik', 'text', 'features', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(14, 'feature_3_description', 'Lingkungan akademik yang kondusif, islami, dan berlandaskan nilai Ahlussunnah Wal Jamaah untuk mendukung proses pembelajaran dan pengembangan karakter mahasiswa.', 'textarea', 'features', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(15, 'feature_3_icon', 'building-2', 'text', 'features', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(16, 'about_title', 'Tentang Universitas Nahdlatul Ulama Kalimantan Timur', 'text', 'about', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(17, 'about_description', 'Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim) merupakan perguruan tinggi yang berlandaskan nilai Islam Ahlussunnah Wal Jamaah dan kebangsaan. UNU Kaltim menyelenggarakan pendidikan tinggi melalui kegiatan pendidikan, penelitian, dan pengabdian kepada masyarakat dengan tujuan menghasilkan lulusan yang berilmu, berakhlak, dan mampu berkontribusi bagi pembangunan daerah serta bangsa. Dengan sistem pembelajaran yang terus dikembangkan dan dukungan fasilitas akademik yang memadai, UNU Kaltim berkomitmen menghadirkan pendidikan tinggi yang inklusif dan terjangkau.', 'textarea', 'about', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(18, 'contact_address', 'Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang', 'text', 'contact', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(19, 'contact_email', 'pmb@unukaltim.ac.id', 'text', 'contact', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(20, 'contact_phone_1', '0812-5317-738', 'text', 'contact', '2025-12-12 19:57:34', '2025-12-18 21:13:43'),
(21, 'contact_phone_1_label', 'Panitia PMB UNU Kaltim', 'text', 'contact', '2025-12-12 19:57:34', '2025-12-18 21:13:43'),
(22, 'contact_phone_2', '0811-4200-9990', 'text', 'contact', '2025-12-12 19:57:34', '2025-12-18 21:13:43'),
(23, 'contact_phone_2_label', 'Admin UNU Kaltim', 'text', 'contact', '2025-12-12 19:57:34', '2025-12-18 21:13:43'),
(24, 'contact_phone_3', NULL, 'text', 'contact', '2025-12-12 19:57:34', '2025-12-12 20:00:34'),
(25, 'contact_phone_3_label', NULL, 'text', 'contact', '2025-12-12 19:57:34', '2025-12-12 20:00:34'),
(26, 'university_logo', 'landing-page/DECjIPli9sVnmJvWroThG0lUp1e0oHj0Col766ye.webp', 'image', 'contact', '2025-12-12 19:57:34', '2025-12-13 17:13:44'),
(27, 'social_media_facebook', 'https://www.facebook.com/unukaltim.official', 'text', 'social_media', '2025-12-12 19:57:34', '2025-12-12 22:02:47'),
(28, 'social_media_instagram', 'https://instagram.com/unukaltim', 'text', 'social_media', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(29, 'social_media_website', 'https://unukaltim.ac.id', 'text', 'social_media', '2025-12-12 19:57:34', '2025-12-12 19:57:34'),
(30, 'about_image', 'landing-page/iHjHWrIV9sukVCjvZ0tCZxrZKScBIPM1dZCVX4o5.jpg', 'image', 'about', '2025-12-12 21:34:07', '2025-12-12 21:34:07'),
(31, 'hero_background_image_desktop', 'landing-page/zyjWM64QvYtp9z3klM9EURL5bOtLydUknYwYXroN.png', 'image', 'hero', '2025-12-18 18:56:34', '2025-12-18 21:48:42'),
(32, 'hero_background_image_mobile', 'landing-page/fltTXNz7G1id0hsPL4VxOjOiUr1SAjpjJ3iuEqPy.png', 'image', 'hero', '2025-12-18 18:56:34', '2025-12-18 18:56:34');

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
(30, '2025_12_29_000001_create_chat_training_table', 1);

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
('rezamuhammad980@gmail.com', '$2y$12$nqMMX4tL./mlrbdEJB/cv.oZFPXWMfbzTBPeVLMalOxMSiMORvSr.', '2025-12-16 18:04:40');

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
(1, 1, 'Akuntansi', 'AKT', 'S1', 'Program Studi Akuntansi', 100, 1, '2025-12-12 19:57:17', '2025-12-12 19:57:17'),
(2, 2, 'Teknik Informatika', 'TI', 'S1', 'Program Studi Teknik Informatika', 120, 1, '2025-12-12 19:57:17', '2025-12-12 19:57:17'),
(3, 2, 'Teknik Industri', 'TIN', 'S1', 'Program Studi Teknik Industri', 200, 1, '2025-12-12 19:57:17', '2025-12-12 19:57:17'),
(4, 2, 'Arsitektur', 'ARS', 'S1', 'Program Studi Arsitektur', 60, 1, '2025-12-12 19:57:17', '2025-12-12 19:57:17'),
(5, 2, 'Desain Interior', 'DI', 'S1', 'Program Studi Desain Interior', 50, 1, '2025-12-12 19:57:17', '2025-12-12 19:57:17'),
(6, 3, 'Hubungan Internasional', 'HI', 'S1', 'Program Studi Hubungan Internasional', 70, 1, '2025-12-12 19:57:17', '2025-12-12 19:57:17'),
(7, 3, 'Ilmu Komunikasi', 'ILKOM', 'S1', 'Program Studi Ilmu Komunikasi', 90, 1, '2025-12-12 19:57:17', '2025-12-30 04:45:38'),
(8, 2, 'Teknologi Industri Pertanian', 'TIP', 'S1', 'Program Studi Teknologi Industri Pertanian', 60, 1, '2025-12-12 19:57:17', '2025-12-12 19:57:17'),
(9, 3, 'Pendidikan Anak Usia Dini', 'PAUD', 'S1', 'Program Studi Pendidikan Anak Usia Dini', 80, 1, '2025-12-12 19:57:17', '2025-12-12 19:57:17'),
(10, 4, 'Farmasi', 'FARM', 'S1', 'Program Studi Farmasi', 70, 1, '2025-12-12 19:57:17', '2025-12-30 04:45:47');

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
(5, '26270100001', 19, 'submitted', NULL, '2025-12-16 21:29:33', '2025-12-26 18:00:12', 1, 1, NULL, 'Umum', 'Teman/Keluarga', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '26270100002', 22, 'submitted', NULL, '2025-12-17 12:10:56', '2025-12-26 18:00:12', 1, 1, NULL, 'Kelas Karyawan', 'Dosen/Panitia PMB UNU Kaltim', 'Ahmad Khoirul Anwar, S.Sos', 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '26270100003', 23, 'submitted', NULL, '2025-12-17 12:41:21', '2025-12-26 18:00:12', 1, 1, NULL, 'Umum', 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '26270100004', 25, 'submitted', NULL, '2025-12-18 00:28:47', '2025-12-26 18:00:12', 1, 1, 1, 'Umum', 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '26270100005', 18, 'submitted', NULL, '2025-12-20 10:20:43', '2025-12-31 15:16:16', 1, 1, 2, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'Kartika Fajriani', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '26270100006', 28, 'submitted', NULL, '2025-12-20 10:52:03', '2025-12-26 18:00:12', 1, 1, 1, 'Umum', 'Website Resmi UNU Kaltim', NULL, 10, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '26270100007', 30, 'submitted', NULL, '2025-12-22 00:17:16', '2025-12-26 18:00:12', 1, 1, 1, 'Umum', 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '26270100008', 32, 'submitted', NULL, '2025-12-22 14:27:28', '2025-12-26 18:00:12', 1, 1, 1, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / MISSYA', 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '26270100009', 34, 'submitted', NULL, '2025-12-22 15:16:40', '2025-12-26 18:00:12', 1, 1, 1, 'Umum', 'Lainnya', 'Dr. Rudi mulyadi', 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '26270100010', 35, 'submitted', NULL, '2025-12-22 15:26:53', '2025-12-26 18:00:12', 1, 1, NULL, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'Prof. Dr. M. Akbar', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '26270100012', 36, 'submitted', NULL, '2025-12-22 19:06:19', '2025-12-26 18:00:12', 1, 1, 1, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / GRUP RT', 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '26270100013', 39, 'submitted', NULL, '2025-12-24 22:29:33', '2025-12-26 18:00:12', 1, 1, 1, 'Umum', 'Teman/Keluarga', NULL, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '26270100014', 43, 'submitted', NULL, '2025-12-30 22:20:05', '2025-12-30 22:20:05', 1, 1, 1, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / SUCI', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '26270100015', 44, 'submitted', NULL, '2025-12-31 03:12:45', '2025-12-31 03:12:45', 1, 1, 2, 'Umum', 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, 'Umum/Reguler', 'Jalur pendaftaran umum untuk calon mahasiswa baru', 1, '2025-12-17 17:30:03', '2025-12-17 17:30:21'),
(2, 'Kelas Karyawan', 'Jalur pendaftaran khusus untuk karyawan yang ingin melanjutkan pendidikan', 1, '2025-12-17 17:30:03', '2025-12-17 17:30:03');

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
(1, 'Gelombang 1 2026/2027', 1, '2026/2027', '2025-12-01', '2026-02-28', 1, NULL, '2025-12-12 01:45:50', '2025-12-12 01:45:50'),
(2, 'Gelombang 2 2026/2027', 2, '2026/2027', '2026-03-01', '2026-06-30', 0, 1000, '2025-12-20 21:54:43', '2025-12-20 21:54:54');

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
(1, 'Peserta Didik Baru', 'Jalur penerimaan calon mahasiswa baru.', 1, '2025-12-12 02:25:28', '2025-12-17 18:23:31'),
(2, 'Alih Jenjang ( RPL Transfer SKS)', 'Jalur penerimaan mahasiswa melalui pengakuan pembelajaran lampau yang diperoleh dari pengalaman kerja dan/atau pendidikan formal sebelumnya (termasuk alih jenjang).', 0, '2025-12-12 02:25:39', '2025-12-31 01:29:43'),
(4, 'Pindahan', 'Jalur penerimaan mahasiswa pindahan dari perguruan tinggi lain.', 0, '2025-12-12 02:26:13', '2025-12-30 20:41:12');

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
('2k8ydjsE9Sv3oCMrZz4CGiI6C8EDgkAyfi6W26sw', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzJZRkJFcFBFcU82R1BKTFlzdDBYdnpyNnB1RzM4Nk1NM1dtd3lPeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767216554),
('2RIzK2WQc5PID8XLWrgXk5awm2dS405nu3SgoBdl', NULL, '69.171.230.6', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0JyODdZbEZaTHpNdWlORGplREt6RDNkSE1NV0NyRnpBcFo1M29NciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC8/YnJpZD1PTWxrOS1pdnozWFNjTWhBZU9hdUFBIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767257701),
('3XlEIbckvUjEk2nuM4awPmtTYmEJ4pTp4TbBWAdH', NULL, '146.70.185.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOTN6QVVza2liRlAyOTlsZE5YRzdtU0pDYXl2dG82VElIaVJBMkdrTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767256401),
('5MHmu7BVyASUY0vVEWCnPefUyBdmG3LINkRCTpgB', 18, '125.160.123.4', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/21D61 Instagram 410.1.0.36.70 (iPhone14,7; iOS 17_3_1; id_ID; id; scale=3.00; 1170x2532; IABMV/1; 849447290) Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUklGdkNET1U5eHczeXFYajFxS0xZUzBpYUx2NUlQSk5JSklRcnY2UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9wYW5kdWFuLWxlbmdrYXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxODt9', 1767219446),
('66doaFHxv0cyRR1l2Ooqkc3yysua6WP9KrXq0awC', NULL, '147.182.218.214', 'Mozilla/5.0 (X11; Linux x86_64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1NEMEFBYnM1NDNSRm8zVWZQSjV6a2c2TnA3R2Jxc1BsemRWTEt5VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767261667),
('7qwWxVvRQ6cTxJ3pHyDZ03lrodqtX3E6ZYBsL2bE', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejZiT0FLOG1zTEN1ZnhkVFRZZm5CWlp1dXNhbUlXdEdad20zT2JrTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767220363),
('8kaLal9vic16aXGH71N83jo818X0fx2nCqJErVT0', NULL, '69.171.231.24', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUlIaVhCOU43WGRVd3ZBa1o5cTVQYjYwc2xzSWlUMHJORkNWUFNzViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC8/YnJpZD1PTWxrOS1pdnozWFNjTWhBZU9hdUFBIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767257721),
('aAx9Lquz9D3H2gBkn08LbSDnDfPsmGwQAQAt7oS0', NULL, '47.128.60.230', 'Mozilla/5.0 (Linux; Android 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmg3RFhvZ0FwSzNtRk42TWN3M0hqUk12bDhIZjFlQkh0SURwUzhIOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767227612),
('AC2WhUtPiEAXAcT7EP7UVgOhEAR77d2iwwNHWuTW', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkhWTDEyaHFEdjhvVXlLb1RhbWZneWFHNXYzcG5SN1JtN050bmhMWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767268987),
('B7wk6heXykCgfD2bnEHneLW9nXZLsGswxpUbHc9f', 1, '182.8.161.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibHMwc1prQ0ZFaHpxYWFZWG9BR0FEdUZsSWU1Y3d2THJVU2NPb292eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1767256037),
('b8Ao0kjTCAMMf4vHjmbKZAnQ3IpUKy6HcNnPQlkt', NULL, '45.148.10.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlhUNDhVNTk4WDlGSEt4cU5BaGdscEhab2hOd2QwOWJnNFg5QUlMQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767217221),
('bwz15Upvr0T63h2Q8NbRmIDTfcitPytLgidXznxW', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkdOZkljMzBZeXpkN0Y1NENxSUx6cnZiZEhXekZqUU5VbDZRa1lxRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767230953),
('cE7rfPqeFOpauMlMWQ7NzfyOebgmAIeFAOJeTjzu', NULL, '69.171.230.19', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWwxdkthaDhNVjNpU1Y5dmN5TXhuMWg2Z2M5R2RnZDNxdm04b0swViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC8/YnJpZD1PTWxrOS1pdnozWFNjTWhBZU9hdUFBIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767257705),
('Ch9iBsyBFpkBd7A4ymGDTSs37hw4xzudrsD0WJKN', NULL, '54.89.229.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1R0aHIzOUpsaEk3MVQwUUlaTUw5ZFE0Mk5leEtVTVBoc1FSQlI1dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767258022),
('eFF7kl67qIyJiHHktpQmoxqPXjdQoZnIV9nA7mNd', NULL, '64.227.161.156', 'Mozilla/5.0 (compatible; WP-Safe-Scanner/1.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzFVV1ZwbHFpU1MyTmJtcHJHUW5GTGpDbGtwQVRqa2s4TXRZaFhLYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767228472),
('ek7vLzROAInSCW6PDK8SMgKqUUQ3KRgs655wmIVM', NULL, '54.164.180.60', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWdjVGsxOE9iTkV5UGNFQ3NDTWIzQlA3WG9ORGc1bE5QVFRpMTlNNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767200414),
('F4z83y4ZFKuPaxbvo1cLTHwdaGrj5XlDdVrqOs7c', NULL, '69.171.230.1', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0hxaDlMb2EzR0NwUXJseFpPdjNNNVY0aHowTlBNQkZlTlpmMUgwMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTEyOiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2JyaWQ9T01sazktaXZ6M1hTY01oQWVPYXVBQSZ1dG1fY29udGVudD1saW5rX2luX2JpbyZ1dG1fbWVkaXVtPXNvY2lhbCZ1dG1fc291cmNlPWlnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767257707),
('FKUfFMbXpkEpjbMbFVOkzEmbzOzOC1lbgEmRGvx5', NULL, '98.80.228.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEdxekFqTTlNNnB0YUR3dlZwOHNMc21EWkd6eWFBWXJIa1Y2REN1USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767200394),
('fRfqt1t5yKBQvcnSBVyblXy2Jjjr8LXlYERwyatG', NULL, '44.222.80.35', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3dFYTBVUEswQTRuQjVnaTdRM0VBVjZHUzNuRkNxYlFWTktnT1ZTYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767257996),
('fvKHCtEpKxT8KHk3bOQBtvHZCReEi6ANXTZKNn6o', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTZFWGFQelF4d3pEdlAzSEc1ZkkzNkI2UVBrT09pdGNibUE2U091dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767215927),
('GFnfgcoJjzk3uN1fkmRFlOPjwUnICUS2smeo08lc', NULL, '64.227.161.156', 'Mozilla/5.0 (compatible; WP-Safe-Scanner/1.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzhNOXJEdGFvWHd6QVY0d2ZlcElwV2poUzIxU2tBM2NOUDRCSHVsbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767228472),
('HB57CioOE91sqLNv3t5oe0AsJsx8BUJTwBgUUQI6', NULL, '69.171.230.3', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWFvdEZsSHlRN0ZraDRiSzVURFhyNEttYlU4ek1mUkJRQ1F2NFdLTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC8/YnJpZD1PTWxrOS1pdnozWFNjTWhBZU9hdUFBIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767259049),
('hvrHh92c2s5gnUL5PkwXom3JJhauc4dCQKLJ4sd5', NULL, '69.171.230.5', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnlYMk94TEZsaDViRVB2Y3RGRVFUQW1DcTgwU29ONXFsMUZVaXM0YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC8/YnJpZD1PTWxrOS1pdnozWFNjTWhBZU9hdUFBIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767257706),
('isf9XbHtqQPkK4XO8vNXYjkXYNFg2O0fpb9wWWyt', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWhjVDQwcDd5QW5aTDM2emRxUzJHaFRITkUwUjJtV0VyWkI2T1ZqdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767189730),
('iUvBYimnRcWkjZ6yaClRk7cfiO8hF6ZUm08XqtEd', NULL, '66.249.70.8', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.7390.122 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXJ2V0ZQQXRoUWFJbHI3VmJqcEhJSnJwVEtTbWVGNUVJZXA1S1h0SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767222635),
('K0IIYXADEgvq1XGrMFyOvyoGxRY7HQE9ntPf6jda', NULL, '3.92.197.93', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXZuRnQ5SHRObERqejJGekJhUEw1akMzZ2dnYVdOU1VoSmcxOERnTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767229163),
('kh4eeWIaEFCVCEe2uvWpeAn2LtiiwKnqewtimb33', NULL, '44.204.39.219', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieldyQUx6MThHdk5QNDFGVmJUUkd1NWxmWFZFNkhURzJkWWtFMUlpZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767229189),
('KjqooAu3BbR74IS2bGtKRTCCGxlrx7YcwQFmLjD0', NULL, '66.249.70.1', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2loSzM1ZnAxa0w4U3g2WVh3bGxnTUpwNHJEU1N4TzdNRUpvbU5ZRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767202497),
('LE0p9Z9kuk2teNTmrQgxVIsfjTxiD8e4KLuVoRZy', NULL, '69.171.230.10', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2FFbEtwTXVmQ1dxc1FPOXU2VWF4WDlCQ0VqOEtuN25PT0Vud2w0ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTEyOiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2JyaWQ9T01sazktaXZ6M1hTY01oQWVPYXVBQSZ1dG1fY29udGVudD1saW5rX2luX2JpbyZ1dG1fbWVkaXVtPXNvY2lhbCZ1dG1fc291cmNlPWlnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767259048),
('NAATfFPqb5O5MmcxptxTSWgZBIVCEtMnKt7vf6gW', NULL, '64.227.161.156', 'Mozilla/5.0 (compatible; WP-Safe-Scanner/1.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamFUSUFaYmdyZk1NeWRkYlJuYlgxa1ZqRTBPZEN4dUpyQzYxUUs1YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767228472),
('PD9Tu3DlqZKJJKXMX4qs4tC0D24nRXLqt8o6WnCv', 28, '182.8.183.127', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.7 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRG5DaGNLek0yVkJyMmhzaVhmYlVXdVVua1Ayc3NyNmdBaXNjbUZNVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI4O30=', 1767227966),
('pvto4kArhrbUbUnhx9Eb0ZXBKsUC4kWhYKzTkpAw', NULL, '182.8.161.191', 'Mozilla/5.0 (Linux; Android 14; V2207 Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/143.0.7499.114 Mobile Safari/537.36 Instagram 410.1.0.63.71 Android (34/14; 300dpi; 720x1489; vivo; V2207; V2207; mt6768; in_ID; 846519340; IABMV/1)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN09XZm1wT1hwck5TdjBWVjRTR3k2ak1sSVFaa003U1drNXN6VWxndCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM2OiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2ZiY2xpZD1QQVpYaDBiZ05oWlcwQ01URUFjM0owWXdaaGNIQmZhV1FQTlRZM01EWTNNelF6TXpVeU5ESTNBQUduVHI4UkZxZTZ5RmJTb0tYRkFxVUJQbHpIUW84YndLTGVfQmxJU3BMR0JLdDlibWpKU1dhNy1ObzR3NXdfYWVtX204Q2hqUjlkM3BzTDYyRjNsbzFJWkEmdXRtX2NvbnRlbnQ9bGlua19pbl9iaW8mdXRtX21lZGl1bT1zb2NpYWwmdXRtX3NvdXJjZT1pZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767238739),
('QzrpKSHtHTTrIss2uLIzV35Fk5JuAjZcGrspwsrH', NULL, '69.171.230.112', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnkxcWw5Q1J4TEV4Q3p2NWg1MDFrRGZlWm5aeE5RVVZNaWd4TmpLbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTEyOiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2JyaWQ9T01sazktaXZ6M1hTY01oQWVPYXVBQSZ1dG1fY29udGVudD1saW5rX2luX2JpbyZ1dG1fbWVkaXVtPXNvY2lhbCZ1dG1fc291cmNlPWlnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767257700),
('Sd466APNCw1HgmlMxBhyzJsOtVRSsSsCtffBh154', NULL, '45.148.10.204', 'Mozilla/5.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUdZNEtUNVE0MU5RNXd0S0tydFJXMjVIVnIzcHNVRkFXYlJtRVBHNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767217222),
('sLYyXAE4S5HKAh14BXZNAYrCXuOOccjfmF8FK8kQ', NULL, '198.235.24.78', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTW1PWWFhb2IxSDFhMERBN2U3MUFESTEyWk5oYUNQbFIxZ2paNXFieSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767213065),
('TIIAK7zL7HVABHK35H3kJYceC483th9thatbQQ5c', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzBWb1BGQWhRakpWWm5IS0dtQVBFb3JzZkdOOEZsT2wxcGhuQWpxbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767269770),
('u4OUnVTDxNBAAFNoN0pPdgo8cuoJ0LI7uvg4VhtS', NULL, '104.28.245.127', 'Mozilla/5.0 (Linux; Android 15; Infinix X6858 Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/143.0.7499.114 Mobile Safari/537.36 Instagram 410.1.0.63.71 Android (35/15; 440dpi; 1080x2436; INFINIX/Infinix; Infinix X6858; Infinix-X6858; mt6789; id_ID; 846519237; IABMV/1)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienVYVEwzUXpaWkNDUk1ERFoyb1NGNDhGTElQWGJGZnNsN3BKMHlWQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjIxOiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2JyaWQ9T01sazktaXZ6M1hTY01oQWVPYXVBQSZmYmNsaWQ9UEFjM0owWXdaaGNIQmZhV1FQTlRZM01EWTNNelF6TXpVeU5ESTNBQUduYWM4NUY1cFYtYWhfX3RmSHJGVEozTU9DUzZRMUcxWGdkRUpsZ2NkNXBLd25nRUN5N25TOVgteGx1YTAmdXRtX2NvbnRlbnQ9bGlua19pbl9iaW8mdXRtX21lZGl1bT1zb2NpYWwmdXRtX3NvdXJjZT1pZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767250931),
('ueZ2p4Mgxm1ar5ExSgNM1yOHJqdXw7kDtasqtnor', NULL, '69.171.230.113', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGI3ck8yTWUxZTBMOXB2OHZEZ3doUjQ1aEozOVJJMndTZ0dPY01QbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTEyOiJodHRwczovL3BtYi51bnVrYWx0aW0uYWMuaWQvP2JyaWQ9T01sazktaXZ6M1hTY01oQWVPYXVBQSZ1dG1fY29udGVudD1saW5rX2luX2JpbyZ1dG1fbWVkaXVtPXNvY2lhbCZ1dG1fc291cmNlPWlnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767257705),
('UkIlOz5k1wnkZad4ovyWA9wcvAxF7lY5UOlWuOuM', NULL, '23.27.145.188', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialdrVEs4UHR4TFZkelJFbGpRMUZpZ2hXc1pKbm1IeEVwRGYyRVh0UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767194309),
('uSaRcntZx5LjR3psaRBWPaLuetcYMwyZ1FPCxlSy', NULL, '216.73.216.35', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHo5Ykx2Y0hpRFJPWGxVbjBEbXN6ZzE0R0lwRWswQnQ0YkkwNHZyZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767192029),
('vi4erugjsqYPVIOu8vaTodafcxjd55hSovLHKu4Z', NULL, '52.167.144.210', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTJEWnM2OGd2RjMyOUtCamE4MVJQelVvQlRzNFlncnVGdlZwVHd6UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767190749),
('w4IFlkj22XnqsK7Wa9oVQmHBqQDbPzOJkYr5JdsE', NULL, '45.148.10.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYjFoR2JDa0NpaUttaEZkMFRZdjBwSzBJT20wVjZlUWNGU2lUWjVGbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767217220),
('XH4JwXJsTJDWZZj8PFJr0qUIE1P6u0b16uePikBm', NULL, '52.167.144.172', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFdTd2JzMEZHZVNNWEQwOURlbDN3VXBkQW5oNUpWeURPejVyZjZ6dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767258730),
('yBqI2artrTI2i035YM1sH3YwVUnKDTR65yfYB3dk', NULL, '149.57.180.95', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFFzNmFLaE9zOGxyRmVFNW1zOVdBc3pZNGRxTm1heDhaU2tYV2F2SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767193471),
('zUvc7Sts3VtC6eZQWjZcmBnoIkOi7UQt5RtMjSiY', NULL, '100.50.77.146', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2RiNWtLbWJpMndVUmZyVmx0bjdHWXFTYnFVN3dxd0lwcjVWbEhxSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LnBtYi51bnVrYWx0aW0uYWMuaWQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767240748);

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
(4, 14, 'terimakasih', '1111111111155555', '1111222234', 'SMA/SMK Sederajat', 'SMAN 99', 'IPA', '00000009999', 'Laki-laki', '1999-09-01', 'Goa', 'Buddha', 'Sangkotek', 'students/photos/9maStVt6FYMWBEn5AxHNHo07kwd924FY0a0dbMt5.png', 'students/kk/9mFMppWZW93l9zCOox2BQ9iJXuI9TFfAE6khEGwG.pdf', 'students/ktp/zHEQRfV8hInQcs5bn9NMoVahJsCLlH4UkrAXknAK.png', 'students/certificates/oe3w6Cv9w0pBfbieKDjq090OMrVnwirnJZ5t5SHx.png', '2025-12-15 14:22:00', '2025-12-15 14:22:00'),
(5, 20, 'tes', '6472012505940002', '0000446789', 'SMA/SMK Sederajat', 'SMKN11 Samarinda', 'Tata boga', '08164500575', 'Laki-laki', '1997-12-17', 'Jakarta', 'Islam', 'jalan anugrah', 'students/photos/JaECwJShMzsSu92gy9lvsz1k6pIB2L1nR3PtHBEJ.jpg', 'students/kk/26Gc7p7Lmzw8IH96lKQVyx6y7Rq9KXiuYVlOEprz.jpeg', 'students/ktp/ZtvSJChaAYPGfgHHvRfLS1drnSYcdi1EqipzKJVh.jpg', NULL, '2025-12-16 16:04:32', '2025-12-16 16:04:32'),
(6, 21, 'kapunkapmoi', '0000000000000002', '0900000009', 'SMA/SMK Sederajat', 'SMAN 99', 'Iwak', '09990000888', 'Laki-laki', '2004-09-01', 'HIJAU', 'Konghucu', 'Jl. APT. Pranoto, Kel. Gunung Panjang, Kec. Samarinda Seberang, Kota Samarinda', 'students/photos/xzuuHaqnaBjscb5yrzp0h8iMaZhbYTjFwbwYjQ0D.png', 'students/kk/lk42Tu3ndCUbpz0fGkEWDnooNUfaY7JXLWrSUxN7.pdf', 'students/ktp/kwtyVnglX5fIx4TRIL42KdlMSmZbbltpE1NyCD5e.pdf', NULL, '2025-12-16 16:22:59', '2025-12-16 16:22:59'),
(7, 19, 'Muhammad Raihan Pratama', '6472061907050003', '0059984152', 'SMA/SMK', 'SMK KEHUTANAN NEGERI SAMARINDA', 'Teknologi Produksi Hasil Hutan', '081256538995', 'Laki-laki', '2005-07-19', 'Samarinda', 'Islam', 'Jl. Jakarta 1 Perum BCL Blok B.8 No.4, Kel. Loa Bakung, Kec. Sungai Kunjang, Kota Samarinda, Provinsi Kalimantan Timur.', 'students/photos/Oqjx2EG2Y3FGkKglFlHUyi7HfmIftu9rUjkl5LpE.jpg', 'students/kk/FHUWyk1Mu1hXgtYrPl7yBmRrehTS1Soy0lNgEHLj.pdf', 'students/ktp/KL3WIEVOtO69cHaKO4nNMRvsJjXtoc7BHnUKNkvY.jpg', 'students/certificates/RVsD0TzmGLZwByUfRAl1VlQigV9ULuBQe3KWrPiw.pdf', '2025-12-16 21:23:27', '2025-12-17 17:31:06'),
(8, 22, 'IKWALUDIN IRKHAMNI', '6472051103030004', '0031739671', 'SMA/SMK', 'SMK Negeri 5 Samarinda', 'Bisnis dan Pemasaran', '083852596613', 'Laki-laki', '2003-03-11', 'Samarinda', 'Islam', 'Jl. Trisari RT. 21', 'students/photos/cW8q2NeIXCma3zQZj2vpT5nD6CI8HJlHgWJwQEVY.jpg', 'students/kk/03Pq9ptRVeRvL8fYgI4gcLheLD1Dx8tYFhr0u69r.pdf', 'students/ktp/mBTvA8mNVAQY3UxTFsWCzIGJxPS1O7pmEEdmCTu5.pdf', 'students/certificates/MPHNqMF169WN15cniuo7fLHkvA2wQAD5ElMKDEO4.jpg', '2025-12-17 12:09:08', '2025-12-17 15:56:58'),
(9, 23, 'Mouhammed Zidane Basayev Al Usman', '6471031207030005', NULL, 'SMA/SMK', 'SMK TI LABBAIKA', 'Teknik komputer dan jaringan', '087715729215', 'Laki-laki', '2003-07-12', 'Bogor', 'Islam', 'Jl. Pada Elo No.173 Rt.002', 'students/photos/zY63zlZaqPuQH4OsYSW59rjwtJeP8voE2ZwN9IIH.jpg', 'students/kk/2JAHuXJQZGy70tkgomE2sqOz6cqfyMtgcHkxjLkx.pdf', 'students/ktp/ZQl4MtufylugATjl0MmAoferoQWaIgiEGqX9W6RJ.pdf', 'students/certificates/RVItoQy8UeMTBXeedacw04p1ZaHeQ0XKaJCDyuVl.pdf', '2025-12-17 12:38:31', '2025-12-17 17:31:46'),
(10, 25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', '6472023105050001', '0052490733', 'SMA/SMK Sederajat', 'PONPES IMAM ASY-SYATHIBY Gowa Makassar', 'Agama Islam', '085750296152', 'Laki-laki', '2005-05-31', 'Samarinda', 'Islam', 'JL. Tanjung Aru, RT.015, Kelurahan Mangkupalas, Kecamatan Samarinda Seberang', 'students/photos/vIeTCL0dRes0kR2st8pnRLf5E8Ckh7h6ha1JUCpE.jpg', 'students/kk/L37drQJW68CkHE7nzl4e4vBolrP5KLVmSpPgYboH.jpg', 'students/ktp/X0PzllONDdkUMvIqN2Hll3KWWlzCGyzlzoggBjHB.jpg', 'students/certificates/rUw64FZchQvpuyUmUeEbyYiatrwnl46CzoHC7q8I.jpg', '2025-12-18 00:19:10', '2025-12-18 00:19:10'),
(11, 26, 'Emilda Ainun alzahra', '6472066005070007', '0074866571', 'SMA/SMK Sederajat', 'SMA BUDI LUHUR', NULL, '085934592604', 'Perempuan', '2007-05-20', 'Samarinda', 'Islam', 'Jalan KS Tubun dalam gang wiratirta RT 17 no 02', 'students/photos/4Itf0t8FJB2DRFumklRxMC1N8LhlLkUZQKc2LVHz.png', 'students/kk/YJ5jfMkcGcDJkjemPWXGUo1eSEU5i5LeAtfiM8yl.pdf', 'students/ktp/lqvOn4UHKIhLAYA2dmKeG92NSOmjuPaoabuSnAP1.pdf', 'students/certificates/T3V2cXFjXIsdlfegXK9NDfGljmkjW92ckJjtKz97.pdf', '2025-12-18 16:59:12', '2025-12-18 16:59:12'),
(12, 18, 'Sindiya kartika', '6402034107991004', '9993349686', 'SMA/SMK Sederajat', 'SMAN 2 LOA JANAN', 'IPA', '085163137202', 'Perempuan', '1999-09-21', 'Bakungan', 'Islam', 'Jl.gerbang dayaku desa bakungan rt 08', 'students/photos/2lj5u37uBswis7H9fk2vBVGUQbaw4xD5MEXwk9qF.jpeg', 'students/kk/z9NjdCiFTtIKHDowiOgu6xUloviZeQ4e5dEh7qBk.jpeg', 'students/ktp/P9yyaXBEYnpEVj7XzNSSJr5Yu5ZRKmnQPTjrJ2Vf.jpeg', 'students/certificates/l9MauTw5EAvvluSLozuUQ8A73fxzAWnGCJodUUhS.jpeg', '2025-12-20 10:11:48', '2025-12-20 10:11:48'),
(13, 28, 'Eka putri nur aisyah', '6402164906050002', '0059599318', 'SMA/SMK Sederajat', 'SMK YPM DIPONEGORO', 'Multimedia', '085822516904', 'Perempuan', '2005-06-09', 'Tenggarong', 'Islam', 'Tenggarong seberang,Manunggal jaya L2 blok E rt 06', 'students/photos/IPSHAQJRU7Z9Vf2PO1l86No8WBADg9Aip3bGKHR2.jpeg', 'students/kk/Jw5mlD9Lhr67Gfh7EwoLT2lEinjTuuHBrhTWwHoz.jpeg', 'students/ktp/7ssLFs75WC089fWZiBT57LsbJ4JOB5m0OW1WgFUM.jpeg', 'students/certificates/LOPIFOZySZgEk2fB3Uq3JgM3wefJZikPck7IA2Fp.jpeg', '2025-12-20 10:50:26', '2025-12-20 10:50:26'),
(14, 30, 'Egha Aulia Renatasari', '6402165606050003', NULL, 'SMA/SMK Sederajat', 'Sma Negeri 1 Tenggarong Seberang', 'ipa', '082255726898', 'Perempuan', '2005-06-16', 'Kutai Kartanegara', 'Islam', 'Desa Sukamaju, Rt 12, No. 16, Kec. Tenggarong Seberang', 'students/photos/SJMqh40UBhODcbFm0bLOm67O704goSFEX59BtjXs.JPG', 'students/kk/sE4Kijmkrs3qQrPEvx2nAAhAvkR1uB0yU4s8SOo3.jpeg', 'students/ktp/OcM50ZemRmstkYZcOUzGbFgEz9JExBjmHThDzouT.jpeg', NULL, '2025-12-21 23:07:19', '2025-12-21 23:07:19'),
(16, 32, 'DHINI ALEXANDRA KUMALASARI', '6472075903060002', '3067311527', 'SMA/SMK', 'SMAN 4 SAMARINDA', NULL, '0895 3443 22525', 'Perempuan', '2006-04-19', 'PETUNG', 'Islam', 'JL. PATIMURA\r\nMANGKUPALAS\r\nSAMARINDA SEBERANG', 'students/photos/fGlHvzBYl3ukSY2wVVZrHjXOKfWHJ0kxl6MEgw6Y.jpeg', 'students/kk/cgQLHvr577X55JFBiseZfaSBEtslwoS2xzPnZsd9.pdf', 'students/ktp/Ri8YCNoIJATEPCmjEPpPEJsNxJ8EKXrxLeppYrQ5.pdf', 'students/certificates/SWBZwfKAtadJW2TgCS9y8GdDvbaxY8Pv4lqYOnEo.pdf', '2025-12-22 14:27:28', '2025-12-22 14:27:28'),
(18, 34, 'Jorong coba saja', '6472050606790017', '84848484', 'SMA/SMK Sederajat', 'Sma', 'Ipa', '08111111111', 'Laki-laki', '2005-09-17', 'Samarinda', 'Buddha', 'Blas bla', 'students/photos/LxoZW3z6qFKa9PbO6UPHytRVOMUl8uLhCmdQ1jm5.jpg', 'students/kk/SadKtrI44PVFWf5oucGmS1wms9HbDm9vuPYrS1kT.pdf', 'students/ktp/wRcVdxBxQF40LXFve5nQvorm6QYwYY8DMyK9w74P.pdf', 'students/certificates/QSoJqdDU9Gmk0Q8vpq8U7o3n7Qp2WEg9Y11sYLO9.pdf', '2025-12-22 15:15:28', '2025-12-22 15:15:28'),
(19, 35, 'Rektor UNU', '6472060820000016', '97392739273', 'SMA/SMK', 'SMA 1', 'IPA', '08155145193', 'Laki-laki', '2000-12-20', 'Samarinda', 'Islam', 'Samarinda', 'students/photos/BhT2obPeemtekrGelKZWIEdIgeEauDzWPV1x24Ug.jpeg', 'students/kk/PMYwkhWObsgtpBTgLbD4j8buHl1VjPnmr7MnCMUp.pdf', 'students/ktp/PrHUPUvqchjebhdpXrdhj09XcRebH9WGsnMjfYyB.pdf', 'students/certificates/u2urQZSkpnk6ze8ZYW7Mxbak4CZPDUBamg4otwjT.pdf', '2025-12-22 15:24:54', '2025-12-22 16:22:24'),
(20, 36, 'ALVIN', '6472012708030002', '0025776132', 'SMA/SMK', 'SMK KESEHATAN', NULL, '+62 851-8498-4637', 'Laki-laki', '2003-08-27', 'SAMARINDA', 'Islam', 'JL. KESEHATAN RAWA MAKMUR PALARAN', 'students/photos/1weXtCAu4a30K365YiXnZSSOBeBiyiXbz6H8TtIN.jpeg', 'students/kk/glzumttGhNAqLhPMTnbp37UJuwtbpNnOfwaLreAP.pdf', 'students/ktp/ueOfE3ud7bgDb53qVI1w5N0IGPvhYAVsobryWOnR.pdf', 'students/certificates/HiQc0HGSuDmW8gjJPU3Q4AEogNb2JUvPgKgbsrQc.pdf', '2025-12-22 19:06:19', '2025-12-22 19:06:19'),
(21, 39, 'Nur Ayu Syafutri', '6472016609030002', '0030295995', 'SMA/SMK Sederajat', 'SMK farmasi Samarinda', 'Teknologi laboratorium medik', '082154177300', 'Perempuan', '2004-09-26', 'Pallangga', 'Islam', 'Jalan Borneo rt 24 samping spbu', 'students/photos/06JZkxVlYrAmXeaJeHMfoftDGC5umQDpubYCS5EW.JPG', 'students/kk/IKIJCdWwCh00Q0sUkOcq3rBYpMZnnv0niw79UVjJ.pdf', 'students/ktp/P6MqzJvaC5Yvd6fD53Ab39bmsTsKYW3Cnm8j88r5.pdf', 'students/certificates/65TdjfFDfotNqh5m9kLKmnrlWBdVZZf50p54P2sw.pdf', '2025-12-24 22:22:32', '2025-12-24 22:22:32'),
(22, 37, 'Dhava ade syawaluddin', '6402160112040001', NULL, 'SMA/SMK Sederajat', 'SMA NEGERI 2 TENGGARONG', 'IPS', '085651251219', 'Laki-laki', '2004-12-01', 'SAMARINDA', 'Islam', 'KUTAI KARTANEGARA TENGGARONG SEBRANG LOA LEPU RT 03', 'students/photos/Rh8TNXBvACZAMBBb7a6s7NM1jWXDzPGPaOq83P8E.jpg', 'students/kk/R89tFAo2sO9NSJp6hRW452HEyCcTGJlvJ35O45wB.jpg', 'students/ktp/f5NKcSpFufVrnVKmPLh9pMftRZBkJ6pk0bKU78qC.jpg', 'students/certificates/ZVxm6jyutNIBo4CGnXKr4TAWWznLCKbOKcomJq66.jpg', '2025-12-25 15:05:15', '2025-12-25 15:05:15'),
(23, 41, 'Xaviera Fowler', '6472015102990222', '0000645689', 'SMA/SMK Sederajat', 'SMKN 22 Samarinda', 'TKJ', '08123344556', 'Laki-laki', '2005-09-25', 'Samarinda', 'Islam', 'Ut elit non recusan', 'students/photos/icM7MdGsVgT6pdzcXe9I1lXMQn6F1jmaxtmVj9wD.jpg', 'students/kk/fG9ZJ9yHOGrqq9Z13LiutGgoeeqefbMfWZgCRcDj.pdf', 'students/ktp/6vUZ9YOYRlf6Kj8THNvRAJifIFgTKie7LdgsTPb9.png', NULL, '2025-12-27 17:07:42', '2025-12-27 17:07:42'),
(24, 42, 'Fadhilah ramdaniah', NULL, NULL, NULL, NULL, NULL, '082150207691', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-30 22:18:40', '2025-12-30 22:18:40'),
(25, 43, 'SILVANA TIARA ANGGRENI', '6408076403070001', '30405722', 'SMA/SMK Sederajat', 'SMKS TI LABAIKA', NULL, '081549738581', 'Perempuan', '2007-03-24', 'MARAH HALOQ', 'Islam', 'MARAH HALOQ RT 01 KECAMATA TELEN', 'biodata/photos/4c3QE1MckstWNR4T5JimEtgoYwerMTwOpjyBLvwZ.jpg', 'biodata/kk/PtGC8JY36BYshZ1GmeJ8uVKhwDHKIdvivrsfMNtj.pdf', 'biodata/ktp/XSVOPEvoWXxazZIfa6ZHxeyRdt3dnDZn47Y0JUhK.pdf', 'biodata/certificates/bUD0GqsUJ6Ev5ATRVqNJeuXfTt108UcSyB3S2RIs.pdf', '2025-12-30 22:20:05', '2025-12-30 22:20:05'),
(26, 44, 'RIDWAN', '6402040203010002', '0018099699', 'SMA/SMK Sederajat', 'MA MIFTAHUL ULUM ANGGANA', NULL, '081255422011', 'Laki-laki', '2001-04-02', 'TANJONGE', 'Islam', 'JL. PEMBANGUNAN\r\nANGGANA\r\nRT 14', 'biodata/photos/8cDzi8GYncPzg2QvJH8xWjLGDsOgJ23zSHw5gFhh.jpg', 'biodata/kk/HY5Bw3GKFsqxr9MQ4O1NxsIeU7J0cL46R68IuvGq.pdf', 'biodata/ktp/OhxzdtDk1YEhOvqdxEk8hmRbaqqFyd9eRWdv8lrV.pdf', 'biodata/certificates/dqE7dQBks398A2asmgKD5c4gYUtqdGzkfC9e3hzD.pdf', '2025-12-31 03:12:45', '2025-12-31 03:12:45');

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

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@unukaltim.ac.id', '081155664477', 'admin', '2025-12-13 15:47:43', '$2y$12$sIlHNsGX1IqJU9wWEVP8c.iF1CslG6ixfm7OiKyGZeLVUfLtOf6Di', NULL, NULL, NULL, NULL, '2025-12-11 20:52:02', '2025-12-14 12:19:43'),
(3, 'tes', 'tes@mail.com', '081213141516', 'student', NULL, '$2y$12$2I.oEw3NT9TF6GNDh2I0VuW7prw6pC.vLJAsgtJ83vB2ofuTSM0zG', NULL, NULL, NULL, NULL, '2025-12-11 20:59:48', '2025-12-11 20:59:48'),
(4, 'Miftahurroyyan Al Hasan', 'royyandalhasan@gmail.com', '082197658372', 'student', NULL, '$2y$12$zK30sxpCoB.E4CKaUrJUC.97RhVM3DRlYiwVJuFr6AOXSkaeaZHs6', NULL, NULL, NULL, NULL, '2025-12-11 21:28:40', '2025-12-11 21:28:40'),
(8, '1234567Patimah', 'patimahlim62@gmail.com', '081322915486', 'student', NULL, '$2y$12$DXaj/WMRBp7aWgxLxZyYNuXdv6qVhlsXOKNKA/PhR.zo8Mqz.ztTu', NULL, NULL, NULL, NULL, '2025-12-13 01:16:19', '2025-12-13 01:16:19'),
(9, 'teslagi', 'tes@exmail.com', '081213251513', 'student', NULL, '$2y$12$gwY.s6XnWbqKy5EbF3hlJuPd9IpwhkRacyVeLwzNSbkbbwRnsblfa', NULL, NULL, NULL, NULL, '2025-12-13 02:56:00', '2025-12-13 02:56:00'),
(11, 'Wulandari', 'wulandariiii1801@gmail.com', '083894877734', 'student', NULL, '$2y$12$WmVjyBSE6FCQ1IOJ6mqIzuqg54NtqklK8GmLFCI14QAEMfqikohVG', NULL, NULL, NULL, NULL, '2025-12-13 15:45:55', '2025-12-13 15:45:55'),
(12, 'Wulandari', 'wulann1810@gmail.com', '083894877734', 'student', '2025-12-13 15:47:43', '$2y$12$VNm/0bHtm2gUJihSbeDOdOhvfC92MdYu8.EyIG99OZq.2AFcgou0q', NULL, NULL, NULL, NULL, '2025-12-13 15:46:25', '2025-12-13 15:47:43'),
(14, 'Terima Gaji', 'raya@unukaltim.ac.id', '00000009999', 'student', '2025-12-14 11:25:28', '$2y$12$xlZ703/LVBLOWExZp4Ar8OCjvfiaMcpMR2ncfLhd84b9/ftfOpRYq', NULL, NULL, NULL, NULL, '2025-12-14 11:24:45', '2025-12-28 23:09:05'),
(16, 'Keisya Nur Alya', 'keisyanuralya0@gmail.com', '081521711804', 'student', '2025-12-14 21:32:58', '$2y$12$xllSYVPPkzCTpQ/XLU8s0OfLCW2SX7tQxqCBH2L8D.rMFPSvAyrE2', NULL, NULL, NULL, 'YAJByxtyh1DNibGUYtikG5xYH5A15OIkX1f1iJMHsy5a344VoqRGjVwIFwLf', '2025-12-14 21:31:42', '2025-12-14 21:32:58'),
(17, 'PMB UNU KALTIM', 'pmb@unukaltim.ac.id', '-', 'staff', '2025-12-15 03:45:14', '$2y$12$fKfSBershUG375WI.ZSJu.FrBGtGB3agP8LGlaXvpjBvIfJX7UEo2', NULL, NULL, NULL, 'sgc1iEL4mcGUWEtJvewgHAivUZosXvmJ7zDZFsRCOwV3B3a0maobvdGXN1rr', '2025-12-15 03:45:14', '2025-12-15 12:39:48'),
(18, 'Sindiya kartika', 'sindiyakartika34@gmail.com', '085163137202', 'student', '2025-12-15 17:28:39', '$2y$12$ly4fNnBXGYPYif68qCJn1OsFLfNQAwFFbxjWxclNjJlPZ8Mc.oaaa', NULL, NULL, NULL, 'wcuBGpB64pOTc3R68Uht4GIpnvD9nk1MFeb5ndeqmt3s34S5SnN7tJUniBEI', '2025-12-15 17:25:23', '2025-12-15 17:28:39'),
(19, 'Muhammad Raihan Pratama', 'muhammadraihanpratama23@gmail.com', '081256538995', 'student', '2025-12-16 15:17:42', '$2y$12$QTkiBoYgkIIADjbrhgOk0e5fmFX66zVXg9E5KOYkaOLb/tDWswZHe', NULL, NULL, NULL, 'xWNMHhajAzlXRWX0tCgoNYQoHLxWh7rL1SfVIk0YpJF2Oi7Lr8hLBDMlp7oJ', '2025-12-16 15:16:36', '2025-12-16 15:17:42'),
(20, 'tes', 'rezamuhammad980@gmail.com', '08164500575', 'student', '2025-12-16 16:01:53', '$2y$12$2iJeAbMvrBi/GjsO7GdIvukx9ZZxkuhdsNY9ah8hQHfY7W9xxIpbi', NULL, NULL, NULL, NULL, '2025-12-16 16:01:36', '2025-12-16 16:01:53'),
(21, 'kapunkapmoi', 'rayafachreza739@gmail.com', '09990000888', 'student', '2025-12-16 16:20:45', '$2y$12$zXLs.Us0Hhuyxf1XNJ9jVuU7QLeoNv3UEdvOr2Jd4fojyiRPiTYqG', NULL, NULL, NULL, NULL, '2025-12-16 16:18:57', '2025-12-16 16:20:45'),
(22, 'IKWALUDIN IRKHAMNI', 'ikwaludini@gmail.com', '083852596613', 'student', '2025-12-17 11:59:18', '$2y$12$qU0AjNX3rssjnYXVdq1mBusUNovMgZXBAJhNcwbXaJZ2QlUsUgGyK', NULL, NULL, NULL, 'AXp1dDjn99MP9zWGEwkpn2UXxWmMpOZT5seEDoME0LC3gxgNqUV2pvcNCSRu', '2025-12-17 11:55:26', '2025-12-17 11:59:18'),
(23, 'Mouhammed Zidane Basayev Al Usman', 'zidanbasayev7@gmail.com', '087715729215', 'student', '2025-12-17 12:31:09', '$2y$12$PW/jiamA6f1/jJMWPOacyOlxB5C59aL8p5gsdSF1fN1ojLbIaBNLq', NULL, NULL, NULL, NULL, '2025-12-17 12:30:35', '2025-12-17 12:31:09'),
(24, 'WR 1', 'wr1@unukaltim.ac.id', '080000000000', 'staff', '2025-12-17 13:38:43', '$2y$12$es48CvnMfpfsFFGnNqG7eOK3pvyXp3vxWSWFwssd0Z9.mVKGRY8u6', NULL, NULL, NULL, 'p12lWwMTtqE1MwJKGMxzYcUXdvd2WwTko4AG4ZOs5YSsSt66abgABsjZm3bj', '2025-12-17 13:38:43', '2025-12-17 13:38:43'),
(25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', 'shevapratama946@gmail.com', '085750296152', 'student', '2025-12-17 23:24:24', '$2y$12$ctZ22aZ.AkW4e1LUDSZ5Fut2sCFUxFvWE7M9ElBnxsHYDET06exi2', NULL, NULL, NULL, 'Q3WvUjJLgZvFuubswOf6OPEBTHH85GflSI5WQ6Q3yQ8hPQ6FnZ4baAw9UMjy', '2025-12-17 23:23:33', '2025-12-17 23:24:24'),
(26, 'Emilda Ainun alzahra', 'emildaazzahra79@gmail.com', '085934592604', 'student', '2025-12-18 16:24:38', '$2y$12$gg0n0K46o47gwDxHAEOrQOUnsHYxMyVt7rX7tJhDzfo2Q0QpBUu.6', NULL, NULL, NULL, NULL, '2025-12-18 16:11:24', '2025-12-18 16:24:38'),
(27, 'rizalmulyono', 'ka.upm.feb@unpad.ac.id', '08564789632', 'student', NULL, '$2y$12$wkIx2Z4ws7.0pwYftQhXFO.f1htJ5svhwwBGfe.bX9keBq2oLrL3G', NULL, NULL, NULL, NULL, '2025-12-18 23:52:06', '2025-12-18 23:52:06'),
(28, 'Eka putri nur aisyah', 'ekaputrinuraisyah2@gmail.com', '085822516904', 'student', '2025-12-19 23:26:31', '$2y$12$Bs/gQJCaz8nZeueC0peKz.tzCwqBSqGl/.8eOIeftqZwX9QnmgG76', NULL, NULL, NULL, 'xZZk0tGw5bKIs4eCavVPtXadCgYfpItIlekrIYzNAojBMeE6BEgCRJvLcUUz', '2025-12-19 23:25:13', '2025-12-19 23:26:31'),
(29, 'Egha Aulia Renatasari', 'eghaauliaaa@icloud.com', '082255726898', 'student', NULL, '$2y$12$Q8CXctEVlYfw8nOsVnCTqOA3p1ANSy8PGZwzmPccv56P1ySCENPg6', NULL, NULL, NULL, 'CRVlyWOWGv5CLtTj4EvS8yTsAUg0G8ahORx3rIu3YeB2YsLMiYPScD4GsGsR', '2025-12-20 17:51:03', '2025-12-20 17:51:03'),
(30, 'Egha Aulia Renatasari', 'auliaegha045@gmail.com', '082255726898', 'student', '2025-12-21 16:06:11', '$2y$12$Gbc7sHFv4KSxUSNvZura3uMXFLDq2gEscEDpA816tqkUbKbpygB/u', NULL, NULL, NULL, 'fyW6t6sCw7mGTJRPIqM1nSkXlBGb98Uj9isyQTg0DW7b4qRrTtwsSSbQd20p', '2025-12-21 16:01:51', '2025-12-21 16:06:11'),
(32, 'DHINI ALEXANDRA KUMALASARI', 'ghinaahyti03@gmail.com', '0895 3443 22525', 'student', '2025-12-22 14:27:28', '$2y$12$eHXIrVz7IOWnXYRJhYxyAOgYCWk01vuuCrqoloJbERDGyuAJH.JZC', NULL, NULL, NULL, NULL, '2025-12-22 14:27:28', '2025-12-22 14:27:28'),
(34, 'Jorong coba saja', 'thekoetai@gmail.com', '08111111111', 'student', '2025-12-22 15:10:48', '$2y$12$mDKhzKuTSOEcfyFzUQpedOba2alth6eNIT3QBTMuVNxGMbn2bYMeO', NULL, NULL, NULL, NULL, '2025-12-22 15:09:44', '2025-12-22 15:10:48'),
(35, 'Rektor UNU', 'rektor@unukaltim.ac.id', '08155145193', 'student', '2025-12-22 15:19:34', '$2y$12$vQ8aDxPP4WsGGb8FAkmdBOIKEsoHa9J89MjDWlHAtU4/mMohK33Me', NULL, NULL, NULL, NULL, '2025-12-22 15:18:42', '2025-12-22 16:22:24'),
(36, 'ALVIN', 'anaksultan2708@gmail.com', '+62 851-8498-4637', 'student', '2025-12-22 19:06:19', '$2y$12$Tei/9jSGqFMnsjBKjFjgZurCjQ.TP3GtHP4e/0TAqrG.Qg6Xenzay', NULL, NULL, NULL, NULL, '2025-12-22 19:06:19', '2025-12-22 19:06:19'),
(37, 'Dhava ade syawaluddin', 'dhavaade112@gmail.com', '085651251219', 'student', '2025-12-23 14:39:19', '$2y$12$xPeFVtHde9NQyZq.O3Pf.u5PFebtHJtHH5l91f7NK6ZxsTJ5NSF02', NULL, NULL, NULL, NULL, '2025-12-23 14:38:18', '2025-12-23 14:39:19'),
(38, 'Nurul alfira', 'nurul.alfira048@gmail.com', '085183040894', 'student', '2025-12-23 15:11:58', '$2y$12$0p4gSqg.6dv3.XSWOmibYuHYRBTRYR6H9XI.CrqeaTFbbrl7SC/E.', NULL, NULL, NULL, NULL, '2025-12-23 15:11:13', '2025-12-23 15:11:58'),
(39, 'Nur Ayu Syafutri', 'ayusyahfutri479@gmail.com', '082154177300', 'student', '2025-12-24 16:28:11', '$2y$12$489UjJ0BAjO9p/VcK5hlCuPgIxGiP6U/0ymmxt.7gAKkaKkOfpNEq', NULL, NULL, NULL, 'AZQNnvo96q3nQtRhCZ8uErXnGArSBvmnuvQwpzfDahHM64Ni9e0MLxlt3Ujg', '2025-12-24 16:21:38', '2025-12-24 16:43:34'),
(40, 'Anita Ardian', 'anitaardian680@gmail.com', '085651337295', 'student', '2025-12-25 23:38:43', '$2y$12$wzCkco3gnhNQQHeJtG/8BO6wvL05OG4wfA7/.W/EKL/sHpTY/a6/C', NULL, NULL, NULL, NULL, '2025-12-25 23:38:20', '2025-12-25 23:38:43'),
(41, 'zeze', 'rezamuhammad981@gmail.com', '085157411283', 'student', '2025-12-27 17:05:47', '$2y$12$pA4mhfb1DOTrBcxPr9L7VOw.rSUW9843qxHZPU9dldyJ8q.FeUGfu', NULL, NULL, NULL, NULL, '2025-12-27 17:04:52', '2025-12-27 17:05:47'),
(42, 'Fadhilah ramdaniah', 'ramdovan1215@gmail.com', '082150207691', 'student', '2025-12-30 22:19:05', '$2y$12$kxDLXr4DaSo1mcyiPkuzLOOyYAgiOe60CtbGMdRkRtD6/phgQmYxe', NULL, NULL, NULL, NULL, '2025-12-30 22:18:40', '2025-12-30 22:19:05'),
(43, 'SILVANA TIARA ANGGRENI', 'tiaraalaaa5@gmail.com', '081549738581', 'student', '2025-12-30 22:20:05', '$2y$12$tJwWM6za8xxxdtb1Kb7uGeIx2xWu8b4jlJ7EdsTq2peA6bSEHzT4u', NULL, NULL, NULL, NULL, '2025-12-30 22:20:05', '2025-12-30 22:20:05'),
(44, 'RIDWAN', 'ridwanalbugisi686@gmail.com', '081255422011', 'student', '2025-12-31 03:12:45', '$2y$12$wALC5W1WWtIzAfAX6lFNyOUKAbeA3KujhxAiSlvqzZ7WfS8qi8aq.', NULL, NULL, NULL, NULL, '2025-12-31 03:12:45', '2025-12-31 03:15:18');

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
-- AUTO_INCREMENT for table `chat_training`
--
ALTER TABLE `chat_training`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_verifications`
--
ALTER TABLE `document_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
