-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2026 at 02:39 PM
-- Server version: 11.4.10-MariaDB-cll-lve
-- PHP Version: 8.4.20

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
-- Table structure for table `admission_letters`
--

CREATE TABLE `admission_letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `source_type` varchar(20) NOT NULL DEFAULT 'generate_web',
  `letter_number` varchar(255) NOT NULL,
  `letter_date` date NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT 'Pemberitahuan',
  `signatory_name` varchar(255) NOT NULL DEFAULT 'Prof. Hamdani',
  `verification_token` varchar(64) NOT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  `generated_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admission_letters`
--

INSERT INTO `admission_letters` (`id`, `user_id`, `source_type`, `letter_number`, `letter_date`, `subject`, `signatory_name`, `verification_token`, `pdf_path`, `generated_at`, `sent_at`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 267, 'generate_web', '001/PMB/UNU-KT/04/2026', '2026-04-29', 'Pemberitahuan', 'Prof. Dr. Ir. Hamdani, S.T., M.Cs., IPM', 'MqVQkBZ6ub70VhpEBpJCvOw1', 'admission-letters/001-PMB-UNU-KT-04-2026.pdf', '2026-04-29 00:42:21', NULL, 17, '2026-04-29 00:42:21', '2026-04-29 00:42:21'),
(2, 188, 'generate_web', '002/PMB/UNU-KT/04/2026', '2026-04-30', 'Pemberitahuan', 'Prof. Dr. Ir. Hamdani, S.T., M.Cs., IPM', 'sGDaeyrQHR580l45NiTIB8fA', 'admission-letters/002-PMB-UNU-KT-04-2026.pdf', '2026-04-29 20:44:18', NULL, 17, '2026-04-29 20:44:18', '2026-04-29 20:44:18');

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
('pmb-unu-kaltim-cache-00d1ee6061ca0dc7c68de67af0900805', 'i:1;', 1777442397),
('pmb-unu-kaltim-cache-00d1ee6061ca0dc7c68de67af0900805:timer', 'i:1777442397;', 1777442397),
('pmb-unu-kaltim-cache-05f188c45856046dd21b8e20e0ab36ca', 'i:1;', 1777434018),
('pmb-unu-kaltim-cache-05f188c45856046dd21b8e20e0ab36ca:timer', 'i:1777434018;', 1777434018),
('pmb-unu-kaltim-cache-065f8e41a20c940689359644aae39608d126c498', 'i:1;', 1777173626),
('pmb-unu-kaltim-cache-065f8e41a20c940689359644aae39608d126c498:timer', 'i:1777173626;', 1777173626),
('pmb-unu-kaltim-cache-077e91440e3d7e83e7241032520d8986', 'i:1;', 1777249471),
('pmb-unu-kaltim-cache-077e91440e3d7e83e7241032520d8986:timer', 'i:1777249471;', 1777249471),
('pmb-unu-kaltim-cache-09d66f6e5482d9b0ba91815c350fd9af3770819b', 'i:1;', 1777101803),
('pmb-unu-kaltim-cache-09d66f6e5482d9b0ba91815c350fd9af3770819b:timer', 'i:1777101803;', 1777101803),
('pmb-unu-kaltim-cache-0a2e4cd875f6a29621d5a9ef3cdd5036', 'i:1;', 1777431793),
('pmb-unu-kaltim-cache-0a2e4cd875f6a29621d5a9ef3cdd5036:timer', 'i:1777431793;', 1777431793),
('pmb-unu-kaltim-cache-0ea7125ef3250f260d10818418337685', 'i:1;', 1777410769),
('pmb-unu-kaltim-cache-0ea7125ef3250f260d10818418337685:timer', 'i:1777410769;', 1777410769),
('pmb-unu-kaltim-cache-1106a1dda2d680438ecfb0bb70fd479c55a1791f', 'i:1;', 1777147544),
('pmb-unu-kaltim-cache-1106a1dda2d680438ecfb0bb70fd479c55a1791f:timer', 'i:1777147544;', 1777147544),
('pmb-unu-kaltim-cache-1636b6cfc885170c4723ebc2bad8535d', 'i:1;', 1777281092),
('pmb-unu-kaltim-cache-1636b6cfc885170c4723ebc2bad8535d:timer', 'i:1777281092;', 1777281092),
('pmb-unu-kaltim-cache-1ac67b20e59b2f04b20189d4372c1a1b', 'i:1;', 1777528592),
('pmb-unu-kaltim-cache-1ac67b20e59b2f04b20189d4372c1a1b:timer', 'i:1777528592;', 1777528592),
('pmb-unu-kaltim-cache-2d3bd1a263efe67d8dd29b7a753c7299', 'i:1;', 1777081625),
('pmb-unu-kaltim-cache-2d3bd1a263efe67d8dd29b7a753c7299:timer', 'i:1777081625;', 1777081625),
('pmb-unu-kaltim-cache-2f4c466a82cd845c3217d89afbec2afa', 'i:1;', 1777111907),
('pmb-unu-kaltim-cache-2f4c466a82cd845c3217d89afbec2afa:timer', 'i:1777111907;', 1777111907),
('pmb-unu-kaltim-cache-2f697fabcbec4cd1b944e4660c65d899', 'i:1;', 1777356454),
('pmb-unu-kaltim-cache-2f697fabcbec4cd1b944e4660c65d899:timer', 'i:1777356454;', 1777356454),
('pmb-unu-kaltim-cache-3028f51407d83338f72f994bc283572452a877de', 'i:1;', 1777039781),
('pmb-unu-kaltim-cache-3028f51407d83338f72f994bc283572452a877de:timer', 'i:1777039781;', 1777039781),
('pmb-unu-kaltim-cache-304ccf7185280d3c14c2f3bb72435c2b', 'i:1;', 1777467328),
('pmb-unu-kaltim-cache-304ccf7185280d3c14c2f3bb72435c2b:timer', 'i:1777467328;', 1777467328),
('pmb-unu-kaltim-cache-32d09bc6f145d018d98690c15e523d31', 'i:1;', 1777217119),
('pmb-unu-kaltim-cache-32d09bc6f145d018d98690c15e523d31:timer', 'i:1777217119;', 1777217119),
('pmb-unu-kaltim-cache-32fd855e0115c7e26cab93388383f468', 'i:4;', 1777173420),
('pmb-unu-kaltim-cache-32fd855e0115c7e26cab93388383f468:timer', 'i:1777173420;', 1777173420),
('pmb-unu-kaltim-cache-3d7c49d26efa55bcabf3869d23a12f12', 'i:2;', 1777522022),
('pmb-unu-kaltim-cache-3d7c49d26efa55bcabf3869d23a12f12:timer', 'i:1777522022;', 1777522022),
('pmb-unu-kaltim-cache-427e72c5df0203143c59934e56b6dbcb', 'i:1;', 1777104976),
('pmb-unu-kaltim-cache-427e72c5df0203143c59934e56b6dbcb:timer', 'i:1777104976;', 1777104976),
('pmb-unu-kaltim-cache-431bf3b995a99c2cd6899b97187d1542a965cec9', 'i:1;', 1777383044),
('pmb-unu-kaltim-cache-431bf3b995a99c2cd6899b97187d1542a965cec9:timer', 'i:1777383044;', 1777383044),
('pmb-unu-kaltim-cache-43c1b58fc953a178640b07f08b019ed1', 'i:1;', 1777095093),
('pmb-unu-kaltim-cache-43c1b58fc953a178640b07f08b019ed1:timer', 'i:1777095093;', 1777095093),
('pmb-unu-kaltim-cache-444b527fb615b5c56a7161a7eb3a1e4e', 'i:1;', 1777030328),
('pmb-unu-kaltim-cache-444b527fb615b5c56a7161a7eb3a1e4e:timer', 'i:1777030328;', 1777030328),
('pmb-unu-kaltim-cache-45cbe19f37712e7f4e2fcfe27422a2410971f95f', 'i:1;', 1777344377),
('pmb-unu-kaltim-cache-45cbe19f37712e7f4e2fcfe27422a2410971f95f:timer', 'i:1777344377;', 1777344377),
('pmb-unu-kaltim-cache-4c15dc21c91634c1b301de6236eb08ead86be4ae', 'i:1;', 1777030339),
('pmb-unu-kaltim-cache-4c15dc21c91634c1b301de6236eb08ead86be4ae:timer', 'i:1777030339;', 1777030339),
('pmb-unu-kaltim-cache-5168eda25f9844ebce75548362dc1328', 'i:1;', 1777200636),
('pmb-unu-kaltim-cache-5168eda25f9844ebce75548362dc1328:timer', 'i:1777200636;', 1777200636),
('pmb-unu-kaltim-cache-5610bcb92294f938559f202060294940', 'i:1;', 1777181319),
('pmb-unu-kaltim-cache-5610bcb92294f938559f202060294940:timer', 'i:1777181319;', 1777181319),
('pmb-unu-kaltim-cache-565e02319e179d9dbf02e584780eec9e', 'i:5;', 1777293038),
('pmb-unu-kaltim-cache-565e02319e179d9dbf02e584780eec9e:timer', 'i:1777293038;', 1777293038),
('pmb-unu-kaltim-cache-58e2b6e1758462ad932b24754fd14d9c', 'i:1;', 1777123125),
('pmb-unu-kaltim-cache-58e2b6e1758462ad932b24754fd14d9c:timer', 'i:1777123125;', 1777123125),
('pmb-unu-kaltim-cache-5a132e2ee294cbdf044f3d6a00ef98c7', 'i:1;', 1777039681),
('pmb-unu-kaltim-cache-5a132e2ee294cbdf044f3d6a00ef98c7:timer', 'i:1777039681;', 1777039681),
('pmb-unu-kaltim-cache-5c70b6477aa8ae3800ad41d88dcc3eda', 'i:1;', 1777344360),
('pmb-unu-kaltim-cache-5c70b6477aa8ae3800ad41d88dcc3eda:timer', 'i:1777344360;', 1777344360),
('pmb-unu-kaltim-cache-5ca5b3eb710d3884ca0138d56ebee3a7', 'i:1;', 1777031754),
('pmb-unu-kaltim-cache-5ca5b3eb710d3884ca0138d56ebee3a7:timer', 'i:1777031754;', 1777031754),
('pmb-unu-kaltim-cache-5d00f2c62873169a8720963189ff86b1f29d4958', 'i:1;', 1777104984),
('pmb-unu-kaltim-cache-5d00f2c62873169a8720963189ff86b1f29d4958:timer', 'i:1777104984;', 1777104984),
('pmb-unu-kaltim-cache-5f027c54240b072e0c8d493c80ba9934', 'i:1;', 1777369670),
('pmb-unu-kaltim-cache-5f027c54240b072e0c8d493c80ba9934:timer', 'i:1777369670;', 1777369670),
('pmb-unu-kaltim-cache-5fdad26e1d13b5f2a8a3cc1cd46d62bf', 'i:1;', 1777440050),
('pmb-unu-kaltim-cache-5fdad26e1d13b5f2a8a3cc1cd46d62bf:timer', 'i:1777440050;', 1777440050),
('pmb-unu-kaltim-cache-630fbf9cd25f4fa2813fb4cd76a2b66b', 'i:2;', 1777081756),
('pmb-unu-kaltim-cache-630fbf9cd25f4fa2813fb4cd76a2b66b:timer', 'i:1777081756;', 1777081756),
('pmb-unu-kaltim-cache-63eb9e2dd85566b8bfbeb8aebf0fc7f0', 'i:1;', 1777382737),
('pmb-unu-kaltim-cache-63eb9e2dd85566b8bfbeb8aebf0fc7f0:timer', 'i:1777382737;', 1777382737),
('pmb-unu-kaltim-cache-676748de57e9fd577af9d9de69987c1e', 'i:1;', 1777335475),
('pmb-unu-kaltim-cache-676748de57e9fd577af9d9de69987c1e:timer', 'i:1777335475;', 1777335475),
('pmb-unu-kaltim-cache-682a03f4cd9e0c79b8a1f0e34266b9651ad9821c', 'i:1;', 1777348517),
('pmb-unu-kaltim-cache-682a03f4cd9e0c79b8a1f0e34266b9651ad9821c:timer', 'i:1777348517;', 1777348517),
('pmb-unu-kaltim-cache-6be0881ece878b9b6888812631219a67', 'i:1;', 1777180497),
('pmb-unu-kaltim-cache-6be0881ece878b9b6888812631219a67:timer', 'i:1777180497;', 1777180497),
('pmb-unu-kaltim-cache-6d4ebfd48979b73b3b13d15507d7b336', 'i:1;', 1777426439),
('pmb-unu-kaltim-cache-6d4ebfd48979b73b3b13d15507d7b336:timer', 'i:1777426439;', 1777426439),
('pmb-unu-kaltim-cache-733b57ae9e45bae742221b555c15e97f45364893', 'i:1;', 1777382738),
('pmb-unu-kaltim-cache-733b57ae9e45bae742221b555c15e97f45364893:timer', 'i:1777382738;', 1777382738),
('pmb-unu-kaltim-cache-786982e96f7b87d2af02bb067875136a', 'i:1;', 1777114499),
('pmb-unu-kaltim-cache-786982e96f7b87d2af02bb067875136a:timer', 'i:1777114499;', 1777114499),
('pmb-unu-kaltim-cache-7de6440f882c55f9c80fc092bb689de8', 'i:2;', 1777348516),
('pmb-unu-kaltim-cache-7de6440f882c55f9c80fc092bb689de8:timer', 'i:1777348516;', 1777348516),
('pmb-unu-kaltim-cache-7e61b101a5c7b4fd01a01092730aa66d', 'i:1;', 1777387933),
('pmb-unu-kaltim-cache-7e61b101a5c7b4fd01a01092730aa66d:timer', 'i:1777387933;', 1777387933),
('pmb-unu-kaltim-cache-7ebb3e7a64988ef093b06486b3fadd34', 'i:2;', 1777082881),
('pmb-unu-kaltim-cache-7ebb3e7a64988ef093b06486b3fadd34:timer', 'i:1777082881;', 1777082881),
('pmb-unu-kaltim-cache-80d3ee47a9b2290d15a046a45a17a205', 'i:5;', 1777439315),
('pmb-unu-kaltim-cache-80d3ee47a9b2290d15a046a45a17a205:timer', 'i:1777439315;', 1777439315),
('pmb-unu-kaltim-cache-83e02497b86f5314ddcc41fad58dd1e9', 'i:4;', 1777508767),
('pmb-unu-kaltim-cache-83e02497b86f5314ddcc41fad58dd1e9:timer', 'i:1777508767;', 1777508767),
('pmb-unu-kaltim-cache-88821c9a35eb525d0e1327f5f3a86cb3', 'i:1;', 1777244579),
('pmb-unu-kaltim-cache-88821c9a35eb525d0e1327f5f3a86cb3:timer', 'i:1777244579;', 1777244579),
('pmb-unu-kaltim-cache-8967996e4c83218336cbd9e27fcda182', 'i:1;', 1777473516),
('pmb-unu-kaltim-cache-8967996e4c83218336cbd9e27fcda182:timer', 'i:1777473516;', 1777473516),
('pmb-unu-kaltim-cache-89cbc58f2baf419fd11661924a466a7d', 'i:1;', 1777032257),
('pmb-unu-kaltim-cache-89cbc58f2baf419fd11661924a466a7d:timer', 'i:1777032257;', 1777032257),
('pmb-unu-kaltim-cache-8ad3f24d3969aa83a5353ca27ef311df', 'i:1;', 1777426341),
('pmb-unu-kaltim-cache-8ad3f24d3969aa83a5353ca27ef311df:timer', 'i:1777426341;', 1777426341),
('pmb-unu-kaltim-cache-8d1a3b044d6e0de60ddf82401789e102', 'i:1;', 1777344377),
('pmb-unu-kaltim-cache-8d1a3b044d6e0de60ddf82401789e102:timer', 'i:1777344377;', 1777344377),
('pmb-unu-kaltim-cache-95fa78014eaabf4de3353a8479c260fd', 'i:1;', 1777090719),
('pmb-unu-kaltim-cache-95fa78014eaabf4de3353a8479c260fd:timer', 'i:1777090719;', 1777090719),
('pmb-unu-kaltim-cache-9a61b86ecef7f4f8978d90273acfe0236bae7479', 'i:1;', 1777358913),
('pmb-unu-kaltim-cache-9a61b86ecef7f4f8978d90273acfe0236bae7479:timer', 'i:1777358913;', 1777358913),
('pmb-unu-kaltim-cache-9a70776c743352cfcf688e52512673332e5e4007', 'i:1;', 1777292753),
('pmb-unu-kaltim-cache-9a70776c743352cfcf688e52512673332e5e4007:timer', 'i:1777292753;', 1777292753),
('pmb-unu-kaltim-cache-9cb81031968fb957e71edd1894882da9', 'i:1;', 1777514615),
('pmb-unu-kaltim-cache-9cb81031968fb957e71edd1894882da9:timer', 'i:1777514615;', 1777514615),
('pmb-unu-kaltim-cache-9d477927ed21a8414eeeedc1b1e3b0a6', 'i:1;', 1777358208),
('pmb-unu-kaltim-cache-9d477927ed21a8414eeeedc1b1e3b0a6:timer', 'i:1777358208;', 1777358208),
('pmb-unu-kaltim-cache-9dc4223d75f4c6e0b76409cc9faa53b8', 'i:1;', 1777366041),
('pmb-unu-kaltim-cache-9dc4223d75f4c6e0b76409cc9faa53b8:timer', 'i:1777366041;', 1777366041),
('pmb-unu-kaltim-cache-9e8af5fe0bc1508487c5009d53d7ab7f', 'i:1;', 1777450150),
('pmb-unu-kaltim-cache-9e8af5fe0bc1508487c5009d53d7ab7f:timer', 'i:1777450150;', 1777450150),
('pmb-unu-kaltim-cache-a040460b155063126cee0059058a396e', 'i:1;', 1777110309),
('pmb-unu-kaltim-cache-a040460b155063126cee0059058a396e:timer', 'i:1777110309;', 1777110309),
('pmb-unu-kaltim-cache-a165fbd61c277745f187eaac7182d9c05d0d1171', 'i:1;', 1777293369),
('pmb-unu-kaltim-cache-a165fbd61c277745f187eaac7182d9c05d0d1171:timer', 'i:1777293369;', 1777293369),
('pmb-unu-kaltim-cache-a2190f7284d509306bb20597912460c8', 'i:1;', 1777075729),
('pmb-unu-kaltim-cache-a2190f7284d509306bb20597912460c8:timer', 'i:1777075729;', 1777075729),
('pmb-unu-kaltim-cache-a42b29ea5b59fae8de3530538122894c', 'i:1;', 1777448002),
('pmb-unu-kaltim-cache-a42b29ea5b59fae8de3530538122894c:timer', 'i:1777448002;', 1777448002),
('pmb-unu-kaltim-cache-aidilnibos00@gmail.com|2404:c0:8cd0::74b:ba83', 'i:1;', 1777101714),
('pmb-unu-kaltim-cache-aidilnibos00@gmail.com|2404:c0:8cd0::74b:ba83:timer', 'i:1777101714;', 1777101714),
('pmb-unu-kaltim-cache-aliferlangga2005@gmail.com|2404:c0:8ce0::730:26ab', 'i:1;', 1777103085),
('pmb-unu-kaltim-cache-aliferlangga2005@gmail.com|2404:c0:8ce0::730:26ab:timer', 'i:1777103085;', 1777103085),
('pmb-unu-kaltim-cache-aureliamargareth18@gmail.com|2404:c0:8ce0::7a5:809c', 'i:2;', 1777336186),
('pmb-unu-kaltim-cache-aureliamargareth18@gmail.com|2404:c0:8ce0::7a5:809c:timer', 'i:1777336186;', 1777336186),
('pmb-unu-kaltim-cache-b8204e573f8993375512eb5cf508c0e5', 'i:2;', 1777292941),
('pmb-unu-kaltim-cache-b8204e573f8993375512eb5cf508c0e5:timer', 'i:1777292941;', 1777292941),
('pmb-unu-kaltim-cache-b8463d22c47fc5b8a731ed0541f73e7c', 'i:1;', 1777440018),
('pmb-unu-kaltim-cache-b8463d22c47fc5b8a731ed0541f73e7c:timer', 'i:1777440018;', 1777440018),
('pmb-unu-kaltim-cache-b98b09ebb2787271da07e14bdfed5a20', 'i:1;', 1777030624),
('pmb-unu-kaltim-cache-b98b09ebb2787271da07e14bdfed5a20:timer', 'i:1777030624;', 1777030624),
('pmb-unu-kaltim-cache-baihaqifarisyi@gmail.com|2400:9800:bc2:b411:2ccc:bbd2:46be:ed3f', 'i:1;', 1777358209),
('pmb-unu-kaltim-cache-baihaqifarisyi@gmail.com|2400:9800:bc2:b411:2ccc:bbd2:46be:ed3f:timer', 'i:1777358209;', 1777358209),
('pmb-unu-kaltim-cache-bc6aa3fa88cc81b59661c478f16df3a7', 'i:1;', 1777372091),
('pmb-unu-kaltim-cache-bc6aa3fa88cc81b59661c478f16df3a7:timer', 'i:1777372091;', 1777372091),
('pmb-unu-kaltim-cache-bd7b81e275d01b0eb88badb25806edcd', 'i:1;', 1777104261),
('pmb-unu-kaltim-cache-bd7b81e275d01b0eb88badb25806edcd:timer', 'i:1777104261;', 1777104261),
('pmb-unu-kaltim-cache-be999d1413de16e03fc5ac632d00bbb2', 'i:1;', 1777364555),
('pmb-unu-kaltim-cache-be999d1413de16e03fc5ac632d00bbb2:timer', 'i:1777364555;', 1777364555),
('pmb-unu-kaltim-cache-c5d6fe33e61a25d5ece0d6942aae3b55', 'i:1;', 1777032510),
('pmb-unu-kaltim-cache-c5d6fe33e61a25d5ece0d6942aae3b55:timer', 'i:1777032510;', 1777032510),
('pmb-unu-kaltim-cache-cb067c9dc1b7aa7b67af4ff2c1fe1f2e', 'i:1;', 1777257726),
('pmb-unu-kaltim-cache-cb067c9dc1b7aa7b67af4ff2c1fe1f2e:timer', 'i:1777257726;', 1777257726),
('pmb-unu-kaltim-cache-cb6dcbd05aa406ad7f0fd605fae1f2b1', 'i:1;', 1777433963),
('pmb-unu-kaltim-cache-cb6dcbd05aa406ad7f0fd605fae1f2b1:timer', 'i:1777433963;', 1777433963),
('pmb-unu-kaltim-cache-cbb520018b2eb59684bfcb97f7137552', 'i:1;', 1777169019),
('pmb-unu-kaltim-cache-cbb520018b2eb59684bfcb97f7137552:timer', 'i:1777169019;', 1777169019),
('pmb-unu-kaltim-cache-ce24becdb48c639c57fad401fa1ae3ee', 'i:5;', 1777290902),
('pmb-unu-kaltim-cache-ce24becdb48c639c57fad401fa1ae3ee:timer', 'i:1777290902;', 1777290902),
('pmb-unu-kaltim-cache-chat_context_local', 's:4046:\"[DATA REAL-TIME UNU KALTIM]\n\nGelombang saat ini: Gelombang 2 2026/2027 (01 Mar 2026 - 30 Jun 2026).\nJalur pendaftaran yang tersedia: Umum/Reguler, Reguler B.\n\nProgram Studi yang tersedia:\n- S1 Akuntansi\n- S1 Teknik Informatika\n- S1 Teknik Industri\n- S1 Arsitektur\n- S1 Desain Interior\n- S1 Hubungan Internasional\n- S1 Ilmu Komunikasi\n- S1 Teknologi Industri Pertanian\n- S1 Pendidikan Anak Usia Dini\n- S1 Farmasi\n\nALUR PENDAFTARAN PMB (5 Langkah):\n1. REGISTRASI AKUN: Buka website PMB, klik tombol Daftar. Isi email aktif, nama lengkap, nomor WhatsApp aktif, dan password. Cek email untuk verifikasi dan aktifkan akun.\n2. LENGKAPI BIODATA: Login ke akun, lalu lengkapi data pribadi: NIK, NISN, tempat tanggal lahir, alamat lengkap, dan upload foto 4x6 latar merah.\n3. UPLOAD DOKUMEN: Upload dokumen yang diperlukan: KTP, Kartu Keluarga, dan Ijazah/SKL. Format: PDF, JPG, atau PNG (maks 2MB).\n4. PILIH PROGRAM STUDI: Pilih jenis pendaftaran, jalur masuk, dan 2 pilihan program studi sesuai dengan minat dan bakat.\n5. VERIFIKASI DAN DAFTAR ULANG: Tunggu proses verifikasi dari Tim PMB. Setelah dinyatakan lolos, akan dihubungi untuk proses daftar ulang dan informasi selanjutnya.\n\nDOKUMEN YANG DIPERLUKAN:\n- Foto 4x6 latar merah\n- Scan/Foto KTP\n- Scan/Foto Kartu Keluarga (KK)\n- Scan/Foto Ijazah atau Surat Keterangan Lulus (SKL)\nFormat file: PDF, JPG, atau PNG dengan ukuran maksimal 2MB per file.\n\nTIPS SUKSES PENDAFTARAN:\n- Gunakan email aktif yang sering dicek\n- Gunakan nomor WhatsApp aktif (PENTING: informasi status pendaftaran dan jadwal daftar ulang dikirim via WhatsApp)\n- Siapkan semua dokumen sebelum mendaftar\n- Pastikan foto/scan dokumen jelas dan terbaca\n- Isi data sesuai dokumen resmi (KTP/Ijazah)\n- Simpan nomor WA panitia PMB\n\nINFORMASI PENTING:\n- Pembayaran biaya registrasi awal dilakukan SAAT DAFTAR ULANG, bukan saat mengisi formulir awal.\n- Panitia TIDAK PERNAH meminta transfer uang ke rekening PRIBADI.\n- Hati-hati terhadap penipuan yang mengatasnamakan PMB UNU Kaltim.\n- Jika mengalami kendala teknis, hubungi panitia resmi melalui kontak yang tertera di website.\n\nINFORMASI BIAYA:\n1. BIAYA REGISTRASI AWAL / DAFTAR ULANG (Dibayar saat melakukan daftar ulang):\n   - Nominal: Rp 300.000\n   - Mencakup: Pembuatan NIM, KTM (Kartu Tanda Mahasiswa), dan Jaket Almamater.\n2. BIAYA RPL (Rekognisi Pembelajaran Lampau) / ALIH JENJANG / PINDAHAN:\n   - Biaya Konversi: Rp 120.000 per SKS\n3. BIAYA UKT (Uang Kuliah Tunggal) PER SEMESTER:\n   - Reguler Non-Farmasi: Rp 5.000.000\n   - Reguler Farmasi: Rp 7.000.000\n   - Kelas Karyawan: Hubungi Panitia PMB untuk informasi lebih lanjut\n\n\nKONTAK RESMI:\n- Telepon/WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n- Alamat Kampus: Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang\n\nSOCIAL MEDIA:\n- Website: https://unukaltim.ac.id\n- Instagram: https://instagram.com/unukaltim\n- Facebook: https://www.facebook.com/unukaltim.official\n\nTENTANG UNU KALTIM:\nUniversitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim) merupakan perguruan tinggi yang berlandaskan nilai Islam Ahlussunnah Wal Jamaah dan kebangsaan. UNU Kaltim menyelenggarakan pendidikan tinggi melalui kegiatan pendidikan, penelitian, dan pengabdian kepada masyarakat dengan tujuan menghasilkan lulusan yang berilmu, berakhlak, dan mampu berkontribusi bagi pembangunan daerah serta bangsa. Dengan sistem pembelajaran yang terus dikembangkan dan dukungan fasilitas akademik yang memadai, UNU Kaltim berkomitmen menghadirkan pendidikan tinggi yang inklusif dan terjangkau.\n\nBEASISWA TERSEDIA: KIP-K, GratisPol (PENDIDIKAN GRATISPOL KALIMANTAN TIMUR). Jika ingin mengajukan beasiswa, silahkan menghubungi kontak resmi UNU Kaltim.\n\nFITUR WEBSITE PMB:\n- Di website PMB (pmb.unukaltim.ac.id) terdapat Asisten Virtual AI (chatbot) yang dapat membantu menjawab pertanyaan seputar pendaftaran.\n- Tombol chat AI terletak di pojok kanan bawah halaman landing page, berbentuk ikon bulat berwarna hijau.\n- Calon mahasiswa dapat bertanya langsung kepada chatbot ini kapan saja untuk mendapatkan informasi PMB.\n\n\n\n[AKHIR DATA REAL-TIME]\";', 1777548960),
('pmb-unu-kaltim-cache-d1d8772f7e6d99c5b4f8cf559f216191', 'i:3;', 1777032405),
('pmb-unu-kaltim-cache-d1d8772f7e6d99c5b4f8cf559f216191:timer', 'i:1777032405;', 1777032405),
('pmb-unu-kaltim-cache-d2b746809b7eab563ce65011963155ab', 'i:1;', 1777357436),
('pmb-unu-kaltim-cache-d2b746809b7eab563ce65011963155ab:timer', 'i:1777357436;', 1777357436),
('pmb-unu-kaltim-cache-d3b9553344c32664530be7cc75b1d767', 'i:1;', 1777126520),
('pmb-unu-kaltim-cache-d3b9553344c32664530be7cc75b1d767:timer', 'i:1777126520;', 1777126520),
('pmb-unu-kaltim-cache-d5f0d9102728577dfc9eec0a84867f75afbdfe46', 'i:1;', 1777358330),
('pmb-unu-kaltim-cache-d5f0d9102728577dfc9eec0a84867f75afbdfe46:timer', 'i:1777358330;', 1777358330),
('pmb-unu-kaltim-cache-d8bbf2aa67d427d6bd74f7dcf5387a12', 'i:4;', 1777412503),
('pmb-unu-kaltim-cache-d8bbf2aa67d427d6bd74f7dcf5387a12:timer', 'i:1777412503;', 1777412503),
('pmb-unu-kaltim-cache-dc03d47efc6f1188e1c32febba66ac61', 'i:5;', 1777427771),
('pmb-unu-kaltim-cache-dc03d47efc6f1188e1c32febba66ac61:timer', 'i:1777427771;', 1777427771),
('pmb-unu-kaltim-cache-dd7c1a3d9d5627da9aea5415e3d07202bfb5925e', 'i:1;', 1777032988),
('pmb-unu-kaltim-cache-dd7c1a3d9d5627da9aea5415e3d07202bfb5925e:timer', 'i:1777032988;', 1777032988),
('pmb-unu-kaltim-cache-dd8e4892180bbb8b6c33983ae2f16c3c', 'i:5;', 1777472090),
('pmb-unu-kaltim-cache-dd8e4892180bbb8b6c33983ae2f16c3c:timer', 'i:1777472090;', 1777472090),
('pmb-unu-kaltim-cache-de7a623f1f6b8c8c5fc1a068e3a342df', 'i:1;', 1777293532),
('pmb-unu-kaltim-cache-de7a623f1f6b8c8c5fc1a068e3a342df:timer', 'i:1777293532;', 1777293532),
('pmb-unu-kaltim-cache-dewirissma24@gmail.com|182.8.182.251', 'i:4;', 1777173420),
('pmb-unu-kaltim-cache-dewirissma24@gmail.com|182.8.182.251:timer', 'i:1777173420;', 1777173420),
('pmb-unu-kaltim-cache-df518c2e0702a3bec12b032911d3090d9bfef76c', 'i:2;', 1777412681),
('pmb-unu-kaltim-cache-df518c2e0702a3bec12b032911d3090d9bfef76c:timer', 'i:1777412681;', 1777412681),
('pmb-unu-kaltim-cache-e898d111980afcdd77e0769042d35ba2', 'i:1;', 1777292782),
('pmb-unu-kaltim-cache-e898d111980afcdd77e0769042d35ba2:timer', 'i:1777292782;', 1777292782),
('pmb-unu-kaltim-cache-ea3d152a4f29be3c2f82128a41e1d780', 'i:1;', 1777241286),
('pmb-unu-kaltim-cache-ea3d152a4f29be3c2f82128a41e1d780:timer', 'i:1777241286;', 1777241286),
('pmb-unu-kaltim-cache-ea3fba04c4deb828964a6702d86b99de', 'i:2;', 1777440034),
('pmb-unu-kaltim-cache-ea3fba04c4deb828964a6702d86b99de:timer', 'i:1777440034;', 1777440034),
('pmb-unu-kaltim-cache-eb6cd13a978ccea71db13225fd42e131', 'i:1;', 1777029082),
('pmb-unu-kaltim-cache-eb6cd13a978ccea71db13225fd42e131:timer', 'i:1777029082;', 1777029082),
('pmb-unu-kaltim-cache-eb94d5c2be91b5d6dd995dbadd5ac0c30e3c17a1', 'i:1;', 1777373853),
('pmb-unu-kaltim-cache-eb94d5c2be91b5d6dd995dbadd5ac0c30e3c17a1:timer', 'i:1777373853;', 1777373853),
('pmb-unu-kaltim-cache-ee46571463f91e9615091844641a7676', 'i:1;', 1777440045),
('pmb-unu-kaltim-cache-ee46571463f91e9615091844641a7676:timer', 'i:1777440045;', 1777440045),
('pmb-unu-kaltim-cache-ee51f0d7497c37884b054ef5d87a4039', 'i:1;', 1777101714),
('pmb-unu-kaltim-cache-ee51f0d7497c37884b054ef5d87a4039:timer', 'i:1777101714;', 1777101714),
('pmb-unu-kaltim-cache-ef7de0b7dedde0a2722380a752fece7a2ccdd672', 'i:1;', 1777366041),
('pmb-unu-kaltim-cache-ef7de0b7dedde0a2722380a752fece7a2ccdd672:timer', 'i:1777366041;', 1777366041),
('pmb-unu-kaltim-cache-f0b39665debe88da743a88000397493b', 'i:1;', 1777456279),
('pmb-unu-kaltim-cache-f0b39665debe88da743a88000397493b:timer', 'i:1777456279;', 1777456279),
('pmb-unu-kaltim-cache-f14a596fd88aa8fb799624ab8bbc0504', 'i:1;', 1777103085),
('pmb-unu-kaltim-cache-f14a596fd88aa8fb799624ab8bbc0504:timer', 'i:1777103085;', 1777103085),
('pmb-unu-kaltim-cache-f14fca97412e65c2c67169c80f5fe32c', 'i:1;', 1777364433),
('pmb-unu-kaltim-cache-f14fca97412e65c2c67169c80f5fe32c:timer', 'i:1777364433;', 1777364433),
('pmb-unu-kaltim-cache-f333160e6b20ba37686da89bbe5fab728a7d3d24', 'i:2;', 1777530566),
('pmb-unu-kaltim-cache-f333160e6b20ba37686da89bbe5fab728a7d3d24:timer', 'i:1777530566;', 1777530566),
('pmb-unu-kaltim-cache-f48fba5ee4092271d8c9b5939051337c', 'i:2;', 1777336186),
('pmb-unu-kaltim-cache-f48fba5ee4092271d8c9b5939051337c:timer', 'i:1777336186;', 1777336186),
('pmb-unu-kaltim-cache-kiranaainaya13@gmail.com|103.166.213.250', 'i:5;', 1777472090),
('pmb-unu-kaltim-cache-kiranaainaya13@gmail.com|103.166.213.250:timer', 'i:1777472090;', 1777472090),
('pmb-unu-kaltim-cache-lamabanget597@gmail.com|114.10.139.142', 'i:1;', 1777440018),
('pmb-unu-kaltim-cache-lamabanget597@gmail.com|114.10.139.142:timer', 'i:1777440018;', 1777440018),
('pmb-unu-kaltim-cache-mohammadalmalik43@gmail.com|182.8.162.29', 'i:5;', 1777293038),
('pmb-unu-kaltim-cache-mohammadalmalik43@gmail.com|182.8.162.29:timer', 'i:1777293038;', 1777293038),
('pmb-unu-kaltim-cache-mohammadalmalik88@gmail.com|182.8.162.29', 'i:2;', 1777292941),
('pmb-unu-kaltim-cache-mohammadalmalik88@gmail.com|182.8.162.29:timer', 'i:1777292941;', 1777292941),
('pmb-unu-kaltim-cache-nafisawr@gmail.com|2404:c0:8ce0::7bf:38d7', 'i:1;', 1777344360),
('pmb-unu-kaltim-cache-nafisawr@gmail.com|2404:c0:8ce0::7bf:38d7:timer', 'i:1777344360;', 1777344360),
('pmb-unu-kaltim-cache-novalputrahardiansyah@gmail.com|2404:c0:8cd0::6e6:534e', 'i:3;', 1777032405),
('pmb-unu-kaltim-cache-novalputrahardiansyah@gmail.com|2404:c0:8cd0::6e6:534e:timer', 'i:1777032405;', 1777032405),
('pmb-unu-kaltim-cache-restuazis@gmail.com|114.10.139.142', 'i:2;', 1777440034),
('pmb-unu-kaltim-cache-restuazis@gmail.com|114.10.139.142:timer', 'i:1777440034;', 1777440034),
('pmb-unu-kaltim-cache-restuazis097@gmail.com|114.10.139.142', 'i:1;', 1777440045),
('pmb-unu-kaltim-cache-restuazis097@gmail.com|114.10.139.142:timer', 'i:1777440045;', 1777440045),
('pmb-unu-kaltim-cache-rifqkimrafi@gmail.com|182.3.138.71', 'i:4;', 1777412503),
('pmb-unu-kaltim-cache-rifqkimrafi@gmail.com|182.3.138.71:timer', 'i:1777412503;', 1777412503),
('pmb-unu-kaltim-cache-syahranikhoeruddin61@gmail.com|2404:c0:8cd0::7f6:ef33', 'i:5;', 1777439315),
('pmb-unu-kaltim-cache-syahranikhoeruddin61@gmail.com|2404:c0:8cd0::7f6:ef33:timer', 'i:1777439315;', 1777439315);

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
(7, NULL, 'selamat sore, saya mau bertanya tentang gratis pol, apakah yang daftar pada gelombang satu sudah lewat jalur reguler/umum pasti dapat gratis pol?', 'Selamat sore! Terima kasih atas pertanyaannya.\n\nMengenai program **Gratiskan Pendidikan (Gratiskan Pol) Kalimantan Timur**, perlu saya informasikan bahwa:\n\n**Pendaftaran dan penerimaan beasiswa Gratiskan Pol tidak otomatis didapatkan** oleh calon mahasiswa yang mendaftar melalui jalur reguler/umum pada gelombang 1.\n\nProgram Gratiskan Pol merupakan **beasiswa khusus** yang memiliki mekanisme dan persyaratan seleksi tersendiri. Meskipun Anda sudah dinyatakan lolos melalui jalur reguler/umum, Anda tetap harus **mengajukan permohonan beasiswa** dan mengikuti proses seleksi yang ditetapkan oleh pihak Gratiskan Pol.\n\nUntuk informasi lebih detail mengenai:\n- Persyaratan pengajuan beasiswa\n- Tata cara pendaftaran beasiswa\n- Jadwal dan tahapan seleksi beasiswa\n- Kuota dan kriteria penerima\n\n**Saya sarankan untuk langsung menghubungi kontak resmi UNU Kaltim:**\n\n📞 **Telepon/WA:** 0812-5317-738  \n📧 **Email:** pmb@unukaltim.ac.id\n\nAtau Anda bisa kunjungi website resmi PMB UNU Kaltim di [https://pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id) untuk informasi lebih lanjut.\n\nSemoga membantu! Ada pertanyaan lain?', 'openrouter', 'ah3P4wQ8kf2U2nvmkQIQhrRg3aiGvLcxRhV8Q0fM', '2404:c0:8cd0::65c:23b4', 5507, 1, NULL, '2026-01-10 00:06:15', '2026-01-10 00:06:15'),
(8, 56, 'Bagaimana cara daftar ulang', 'Tentu, saya bantu jelaskan prosedur daftar ulang di UNU Kaltim. 😊\n\nSebelum melakukan daftar ulang, pastikan Anda sudah menyelesaikan 5 langkah pendaftaran online melalui website PMB terlebih dahulu dan mendapatkan notifikasi bahwa Anda **lolos verifikasi**.\n\nBerikut adalah langkah-langkah daftar ulang:\n\n**1. Pembayaran Biaya Registrasi Awal**\n   - Setelah lolos verifikasi, Anda akan dihubungi oleh tim PMB via WhatsApp untuk informasi pembayaran.\n   - Silakan transfer biaya registrasi awal sebesar **Rp 300.000** ke rekening resmi universitas yang akan diberikan nanti.\n   - **PENTING:** Hati-hati penipuan! Panitia TIDAK PERNAH meminta transfer ke rekening pribadi.\n\n**2. Konfirmasi Pembayaran**\n   - Setelah melakukan transfer, simpan bukti pembayarannya (screenshot).\n   - Konfirmasi pembayaran Anda melalui WhatsApp ke nomor resmi PMB (0812-5317-738) atau melalui fitur yang tersedia di portal pendaftaran Anda.\n\n**3. Pengisian Formulir Daftar Ulang (Offline)**\n   - Anda akan diminta untuk melengkapi formulir daftar ulang yang disediakan oleh panitia.\n   - Isi semua data dengan lengkap dan benar.\n\n**4. Pengumpulan Berkas Asli**\n   - Serahkan dokumen asli yang sudah diupload saat pendaftaran untuk diverifikasi ulang, seperti:\n     - KTP & KK\n     - Ijazah/SKL\n     - Pas foto terbaru\n\nSetelah semua proses di atas selesai, Anda akan menerima **NIM (Nomor Induk Mahasiswa)** dan berhak mengikuti kegiatan perkuliahan.\n\nJika ada yang kurang jelas atau Anda ingin mengetahui jadwal pasti daftar ulang, silakan hubungi langsung panitia resmi PMB UNU Kaltim melalui:\n- **WA:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\nSemoga membantu! 🙏', 'openrouter', 'WR73uXtUilfUwXD1uozsc9ox20YtgwvRYJ4ZGHrp', '141.0.8.230', 7243, 1, NULL, '2026-01-10 22:27:53', '2026-01-10 22:27:53'),
(9, 72, 'ini mau isi foto kok ga bisa di pencet', 'Halo! Maaf ya kalau ada kendala. Soal tombol upload foto yang tidak bisa diklik, biasanya ada beberapa penyebab umum:\n\n**Coba cek hal-hal berikut:**\n\n📱 **Di HP:**\n- Pastikan browser sudah di-update (Chrome/Safari terbaru)\n- Coba refresh halaman atau buka di tab baru\n- Kalau pakai aplikasi, coba clear cache atau reinstall\n\n💻 **Di Komputer:**\n- Pastikan browser mendukung (Chrome/Firefox/Edge)\n- Nonaktifkan ad-blocker sementara\n- Coba pakai mode incognito/private\n\n**Penyebab lain:**\n- Format file tidak didukung (harus JPG, PNG, atau PDF)\n- Ukuran file terlalu besar (maks 2MB)\n- Koneksi internet lambat\n\n**Solusi cepat:**\nKalau masih tidak bisa, coba pakai perangkat lain atau hubungi panitia PMB di **0812-5317-738** (WA) untuk bantuan teknis langsung.\n\nAtau, kamu bisa coba fitur chatbot AI di website PMB (pmb.unukaltim.ac.id) dengan klik ikon hijau di pojok kanan bawah.\n\nAda yang masih bingung? 😊', 'openrouter', '13b2FotbhQsIThTqgDbo2j2XkGZTm5zVNRSbSLvO', '140.213.1.207', 13661, 1, NULL, '2026-01-11 01:32:41', '2026-01-11 01:32:41'),
(10, NULL, 'halo', 'Halo! Selamat datang di PMB Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim)!\n\nSaya siap membantu Anda dengan informasi seputar:\n- Proses pendaftaran mahasiswa baru\n- Program studi yang tersedia\n- Persyaratan dan jadwal pendaftaran\n- Biaya pendidikan & beasiswa\n- Fasilitas kampus\n\nAda yang ingin Anda tanyakan? 🎓', 'openrouter', 'Gehw7g89L1hd75288GsYoBkiYY2vm1dRthwYqvv2', '180.243.109.204', 3840, 1, NULL, '2026-01-11 20:37:39', '2026-01-11 20:37:39'),
(11, NULL, 'apa saja yang dipersiapkan', 'Halo! 👋 Tenang, saya akan bantu infokan apa saja yang perlu dipersiapkan untuk pendaftaran mahasiswa baru UNU Kaltim.\n\n## 📋 DOKUMEN PENTING YANG PERLU DISIAPKAN:\n\n**1. Dokumen Utama:**\n- Foto 4x6 latar merah (digital)\n- Scan/foto KTP (milik sendiri)\n- Scan/foto Kartu Keluarga (KK)\n- Scan/foto Ijazah atau Surat Keterangan Lulus (SKL)\n\n**2. Persiapan Teknis:**\n- Email aktif (untuk registrasi akun)\n- Nomor WhatsApp aktif (PENTING! untuk info status pendaftaran)\n- File dokumen dalam format: PDF, JPG, atau PNG\n- Maksimal ukuran file: 2MB per dokumen\n\n**3. Persiapan Data Diri:**\n- NIK (Nomor Induk Kependudukan)\n- NISN (Nomor Induk Siswa Nasional)\n- Tempat, tanggal lahir\n- Alamat lengkap\n- Nama lengkap\n\n## 💡 TIPS PENTING:\n- Pastikan foto/scan dokumen jelas dan terbaca\n- Siapkan semua dokumen sebelum mulai pendaftaran\n- Gunakan data sesuai dokumen resmi (KTP/Ijazah)\n- Cek email secara berkala untuk verifikasi akun\n\nKalau sudah siap semua, kamu bisa langsung daftar di [website PMB UNU Kaltim](https://pmb.unukaltim.ac.id). Ada pertanyaan lain? 😊', 'openrouter', '67k2FaCNIqhcCpQJ4BTfDaqjHbVdLR2MSMlrYcs5', '103.141.47.152', 5964, 1, NULL, '2026-01-11 21:07:11', '2026-01-11 21:07:11'),
(12, NULL, 'pembayaran untuk jurusan ilmu komunikasi berapa', 'Untuk jurusan **S1 Ilmu Komunikasi**, biaya yang perlu disiapkan adalah:\n\n## 💰 STRUKTUR BIAYA:\n\n**1. Biaya Registrasi Awal / Daftar Ulang:**\n- Rp 300.000 (dibayar saat daftar ulang)\n- Mencakup: Pembuatan NIM, KTM, dan Jaket Almamater\n\n**2. Biaya UKT (Uang Kuliah Tunggal) per Semester:**\n- **Rp 5.000.000** (program reguler non-farmasi)\n\nBiaya UKT ini berlaku untuk S1 Ilmu Komunikasi di jalur reguler ya.\n\n## ⚠️ PENTING:\n- Pembayaran biaya registrasi dilakukan SAAT DAFTAR ULANG (bukan saat mengisi formulir awal)\n- Pastikan hanya transfer ke rekening resmi UNU Kaltim\n- Hati-hati penipuan!\n\nUntuk informasi lebih lengkap atau penjelasan lebih detail, kamu bisa hubungi:\n- **WA/Telp:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\nAda pertanyaan lain? 😊', 'openrouter', '67k2FaCNIqhcCpQJ4BTfDaqjHbVdLR2MSMlrYcs5', '103.141.47.152', 4557, 1, NULL, '2026-01-11 21:08:06', '2026-01-11 21:08:06'),
(13, NULL, 'pembayaran untuk jurusan ilmu komunikasi berapa', 'Untuk jurusan **S1 Ilmu Komunikasi**, besaran biayanya sebagai berikut:\n\n## 💰 BIAYA PENDIDIKAN:\n\n**1. Biaya Registrasi Awal / Daftar Ulang:**\n- **Rp 300.000** (dibayar saat daftar ulang)\n- Mencakup: Pembuatan NIM, KTM (Kartu Tanda Mahasiswa), dan Jaket Almamater\n\n**2. Biaya UKT (Uang Kuliah Tunggal) per Semester:**\n- **Rp 5.000.000** (untuk program reguler non-Farmasi)\n- Ilmu Komunikasi termasuk dalam kategori ini\n\n**3. Biaya Tambahan (jika ada):**\n- Biaya RPL (Rekognisi Pembelajaran Lampau) / Alih Jenjang / Pindahan: **Rp 120.000 per SKS** (hanya jika kamu transfer dari kampus lain)\n\n---\n\n📍 **PENTING:** Pembayaran biaya registrasi awal dilakukan SAAT DAFTAR ULANG (setelah lolos verifikasi), bukan saat mengisi formulir pendaftaran awal.\n\nUntuk informasi lebih detail atau pertanyaan khusus, kamu bisa hubungi kontak resmi PMB UNU Kaltim:\n- **WA:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\nAda pertanyaan lain? 😊', 'openrouter', '67k2FaCNIqhcCpQJ4BTfDaqjHbVdLR2MSMlrYcs5', '103.141.47.152', 5139, 1, NULL, '2026-01-11 21:09:32', '2026-01-11 21:09:32'),
(14, 1, 'apa saja yang dipersiapkan', 'Untuk mendaftar di UNU Kaltim, Anda perlu mempersiapkan:\n\n**📄 DOKUMEN YANG DIBUTUHKAN:**\n\n- Foto 4x6 latar merah\n- Scan/Foto KTP\n- Scan/Foto Kartu Keluarga (KK)\n- Scan/Foto Ijazah atau Surat Keterangan Lulus (SKL)\n\n**📝 FORMAT FILE:**\n- PDF, JPG, atau PNG\n- Maksimal 2MB per file\n\n**💡 PERSIAPAN LAINNYA:**\n- Email aktif untuk registrasi\n- Nomor WhatsApp aktif (penting untuk info status pendaftaran)\n- Siapkan data pribadi: NIK, NISN, tempat tanggal lahir, alamat lengkap\n\n**🎯 TIPS:**\n- Pastikan foto/scan dokumen jelas dan terbaca\n- Isi data sesuai dokumen resmi (KTP/Ijazah)\n- Cek email dan WhatsApp secara rutin\n\nButuh bantuan lebih lanjut? 😊', 'openrouter', 'j1ZHokTzNkG2dtgrY2jC2UyhyxNzer0SMJksUMN9', '180.243.109.204', 7060, 1, NULL, '2026-01-11 21:34:00', '2026-01-11 21:34:00'),
(15, 74, 'Apakah biodata bisa dirubah setelah daftar?', 'Maaf, untuk informasi mengenai apakah biodata dapat diubah setelah pendaftaran, saya tidak memiliki data yang pasti mengenai kebijakan ini di sistem PMB UNU Kaltim.\n\n**Saya sarankan Anda untuk menghubungi bagian admisi langsung** melalui:\n\n📞 **Telepon/WA:** 0812-5317-738  \n📧 **Email:** pmb@unukaltim.ac.id\n\nMereka akan dapat memberikan informasi yang akurat mengenai prosedur perubahan data dan batas waktunya.', 'openrouter', 'XUviRVyT39BFxXWN1ePFZdMiOec1dJIFkKpJi9IT', '182.3.141.247', 4207, 1, NULL, '2026-01-13 04:13:08', '2026-01-13 04:13:08'),
(16, 72, 'ini kita\" dpt informasi verifikasi nya kapan ya', 'Untuk informasi mengenai **tahapan verifikasi data** pendaftaran, berikut penjelasannya:\n\n**Proses Verifikasi Oleh Tim PMB:**\n- Dilakukan setelah calon mahasiswa menyelesaikan langkah 1-4 (registrasi, lengkapi biodata, upload dokumen, pilih prodi).\n- Waktu verifikasi normalnya memakan **1-3 hari kerja**.\n- Setelah verifikasi selesai, calon mahasiswa yang lolos akan dihubungi melalui **WhatsApp** untuk proses daftar ulang dan informasi selanjutnya.\n\n**Penting:** 📱 **Pastikan nomor WhatsApp yang Anda gunakan aktif dan dapat dihubungi** karena seluruh informasi status pendaftaran dan jadwal daftar ulang dikirim via WhatsApp.\n\nJika Anda sudah menunggu lebih dari 3 hari kerja dan belum ada konfirmasi, silakan hubungi kontak resmi PMB untuk mengecek status pendaftaran Anda.', 'openrouter', '0MBsUXqJPUD0h5271Q9WV9p7AE2A3s1TGMaODH5R', '125.160.112.138', 9710, 1, NULL, '2026-01-20 02:26:42', '2026-01-20 02:26:42'),
(17, 72, 'aku sudah lebih dari seminggu', 'Mohon maaf atas ketidaknyamanannya. Biasanya proses verifikasi data memakan waktu **1-3 hari kerja**. \n\nKarena Anda sudah menunggu lebih dari seminggu, **ada kemungkinan**:\n- Data atau dokumen yang diunggah membutuhkan verifikasi tambahan\n- Terdapat kendala teknis dalam sistem\n- Ada pertanyaan atau klarifikasi lebih lanjut yang perlu ditanyakan\n\n**Langkah yang disarankan:**\n\n1. **Cek status di website** - Login ke akun PMB Anda (pmb.unukaltim.ac.id) dan periksa apakah ada notifikasi atau pesan di dashboard\n2. **Hubungi kontak resmi** - Untuk mempercepat proses dan pengecekan status pendaftaran Anda, sebaiknya langsung menghubungi panitia PMB:\n\n   📞 **Telepon/WA:** 0812-5317-738  \n   📧 **Email:** pmb@unukaltim.ac.id  \n   📍 **Alamat:** Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang\n\n3. **Siapkan informasi** - Pastikan Anda bisa menyebutkan:\n   - Nomor pendaftaran/NIM (jika sudah ada)\n   - Tanggal pendaftaran\n   - Program studi yang dipilih\n\nDengan menghubungi langsung, tim PMB dapat memeriksa secara lebih detail kondisi pendaftaran Anda dan memberikan penjelasan yang lebih akurat.', 'openrouter', '0MBsUXqJPUD0h5271Q9WV9p7AE2A3s1TGMaODH5R', '125.160.112.138', 5732, 1, NULL, '2026-01-20 02:27:29', '2026-01-20 02:27:29'),
(18, NULL, 'mau bertanya tentang program rpl pgpaud', 'Halo! Terima kasih atas pertanyaannya.\n\nTerkait program **Rekognisi Pembelajaran Lampau (RPL)** untuk Program Studi **Pendidikan Anak Usia Dini (PGPAUD)** di UNU Kaltim, berikut informasinya:\n\n**Informasi RPL (Rekognisi Pembelajaran Lampau):**\n\nRPL adalah program yang memungkinkan mahasiswa mendapatkan pengakuan kredit atau setara atas pembelajaran yang telah dilakukan di lembaga pendidikan sebelumnya atau pengalaman kerja relevan, sehingga dapat mempercepat penyelesaian studi.\n\nUntuk program studi **S1 Pendidikan Anak Usia Dini (PGPAUD)**, program RPL tersedia dengan ketentuan sebagai berikut:\n\n**Biaya Konversi RPL:**\n- Biaya konversi per SKS (Satuan Kredit Semester): **Rp 120.000**\n\n**Langkah Proses RPL:**\n1. **Daftar dan Lulus Seleksi:** Anda harus terlebih dahulu mendaftar melalui jalur reguler (Umum/Reguler atau Kelas Karyawan) dan dinyatakan lolos seleksi masuk.\n2. **Ajukan Permohonan RPL:** Setelah dinyatakan lolos, Anda dapat mengajukan permohonan RPL dengan melampirkan dokumen pendukung (seperti transkrip nilai, sertifikat kompetensi, atau portofolio kerja yang relevan).\n3. **Verifikasi dan Konversi:** Tim akademik akan melakukan verifikasi dan menyetujui pengakuan kredit.\n4. **Pembayaran Biaya Konversi:** Biaya konversi RPL akan dibayarkan sesuai jumlah SKS yang dikonversi (1 SKS x Rp 120.000).\n\n**Saran:**\nUntuk informasi detail mengenai persyaratan dokumen RPL khususnya untuk PGPAUD, serta proses pengajuannya, **saya sarankan Anda untuk menghubungi langsung bagian akademik atau panitia PMB UNU Kaltim**.\n\n**Kontak Resmi:**\n- 📞 **Telepon/WA:** 0812-5317-738\n- 📧 **Email:** pmb@unukaltim.ac.id\n- 🌐 **Website PMB:** [https://pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n\nApakah ada pertanyaan lain seputar pendaftaran atau program studi?', 'openrouter', 'C68IZoGiqKpfe8fVSt5PaVYl0s3OxJaTgM4PeLXB', '112.215.153.231', 26341, 1, NULL, '2026-01-23 20:16:48', '2026-01-23 20:16:48'),
(19, 90, 'assalamu\'alaikum warahmatullahi wabarakatuh, cara untuk maksimal 2mb dokumen kk', 'Wa\'alaikumussalam warahmatullahi wabarakatuh.\n\nAda beberapa cara untuk mengkompres ukuran file KK (Kartu Keluarga) agar tidak melebihi 2 MB:\n\n1.  **Kompres Foto/Scan dengan Aplikasi/Website:**\n    *   **Online:** Anda bisa menggunakan situs seperti [ILovePDF](https://www.ilovepdf.com/id/compress_image) atau [SmallPDF](https://smallpdf.com/compress-pdf). Upload gambar KK Anda, lalu pilih kualitas (biasanya medium/standar sudah cukup) untuk mengurangi ukuran file.\n    *   **Aplikasi Smartphone:** Gunakan aplikasi kompres foto yang tersedia di Play Store (Android) atau App Store (iOS).\n\n2.  **Atur Resolusi saat Memotret/Scan:**\n    *   Jika Anda menggunakan smartphone, pastikan kamera dalam kondisi baik dan pencahayaan cukup agar gambar jelas tanpa perlu resolusi terlalu tinggi. Bisa juga menggunakan mode \"dokumen\" jika ada.\n\n3.  **Simpan dengan Format Tepat:**\n    *   Pastikan format file adalah **.JPG, .PNG, atau .PDF**. Format JPG biasanya lebih kecil dibanding PNG. Jika KK Anda dalam format PDF dan besar, Anda bisa konversi ke JPG terlebih dahulu, lalu kompres.\n\n4.  **Pastikan Sudah Terbaca dengan Jelas:**\n    *   Setelah dikompres, cek kembali apakah teks dan data pada KK masih terbaca dengan baik. Jangan sampai kelewat kecil/blur karena bisa tergolong tidak valid.\n\n**Tips Tambahan:**\n*   Jangan lupa, pastikan ukuran **maksimal 2 MB per file**.\n*   Dokumen lain (KTP, Ijazah/SKL) juga harus mengikuti batasan ini.\n\nJika setelah mencoba cara-cara di atas masih terkendala, Anda bisa langsung menghubungi tim PMB melalui WhatsApp resmi di **0812-5317-738** untuk mendapatkan bantuan lebih lanjut.\n\nSemoga membantu! 📝', 'openrouter', 'vURorNxlPq00e5nIZmrdvDXjB0MKwhXGdwkcIZZU', '114.9.32.50', 6847, 1, NULL, '2026-01-26 07:45:42', '2026-01-26 07:45:42'),
(20, 90, 'cara mengurangi mb di ktp', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'vURorNxlPq00e5nIZmrdvDXjB0MKwhXGdwkcIZZU', '114.9.32.50', 60044, 0, 'cURL error 28: Operation timed out after 60001 milliseconds with 1551 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-01-26 07:55:54', '2026-01-26 07:55:54'),
(21, 87, 'daftar ulang kapan ka', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'cueGjqNeI6zYDhxA7sp0RuIkrF6sfbrrZU8spNI6', '2404:c0:c601:649a:8b47:279d:507f:1908', 10071, 0, 'cURL error 28: Resolving timed out after 10001 milliseconds (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-01-29 03:13:31', '2026-01-29 03:13:31'),
(22, NULL, 'Bisa mengunakan ijazah paket c kah', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'wuZUnjoZ2Av7nYKkBnf83TzthapuUYHBQrVEAVq1', '182.8.178.223', 401, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-02 22:21:43', '2026-02-02 22:21:43'),
(23, 52, 'Setelah terverifikasi lalu apa selanjut nya', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'hSlYZAu78XnMaXD8MSW5NNSTOPahejDtTLsi16BN', '103.156.118.42', 649, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-03 05:16:03', '2026-02-03 05:16:03'),
(24, 52, 'Setelah terverifikasi lalu melakukan apa', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'hSlYZAu78XnMaXD8MSW5NNSTOPahejDtTLsi16BN', '103.156.118.42', 340, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-03 05:16:35', '2026-02-03 05:16:35'),
(25, NULL, 'apakah ada kelas untuk pekerja', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'BTUaOcoUh7oFCW1PNYp2KBXN3UHihFCqsAHv1f6m', '182.8.175.18', 899, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-09 04:34:05', '2026-02-09 04:34:05'),
(26, 108, 'saya hanya mau farmasi saja, apakah harus mengisi 2 pilihan?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'tL2EmaS7oXsBF4tUdKNcjiQsGKUiT482Hvu1FVql', '103.166.213.225', 845, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-09 17:31:33', '2026-02-09 17:31:33'),
(27, 108, 'untuk pemilihan program studi, apakah harus beda opsi 1 dan opsi 2?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'tL2EmaS7oXsBF4tUdKNcjiQsGKUiT482Hvu1FVql', '103.166.213.225', 624, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-09 17:31:58', '2026-02-09 17:31:58'),
(28, 108, 'apakah memiliki fakultas harus beda?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'tL2EmaS7oXsBF4tUdKNcjiQsGKUiT482Hvu1FVql', '103.166.213.225', 356, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-09 17:32:16', '2026-02-09 17:32:16'),
(29, 108, 'bagaimana mengisi program studi?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'tL2EmaS7oXsBF4tUdKNcjiQsGKUiT482Hvu1FVql', '103.166.213.225', 351, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-09 17:32:25', '2026-02-09 17:32:25'),
(30, 108, 'saya ingin bertanya', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'tL2EmaS7oXsBF4tUdKNcjiQsGKUiT482Hvu1FVql', '103.166.213.225', 353, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-09 17:32:34', '2026-02-09 17:32:34'),
(31, 108, 'setelah mengisi biodata dan memilih program studi, apakah tinggal menunggu verifikasi saja?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'E4Oq2QmoNHzaueMXU3K3wtU0yfKXeZO6JoFUTQsc', '103.166.213.225', 847, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-10 02:07:34', '2026-02-10 02:07:34'),
(32, 85, 'Setelah ini ngapain', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'T2XPUy3tsfxyAaUAUdtbyVPZflH9BVfnG4sJaIE5', '103.111.136.22', 703, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-10 04:39:06', '2026-02-10 04:39:06'),
(33, 30, 'mengenai biaya kuliah persemester kak', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'D78RBkFla5zBGsNtjx9jW6QnGq3zea1PI0zsqIgf', '114.10.139.36', 2351, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-11 00:39:38', '2026-02-11 00:39:38'),
(34, 129, 'Saya salah mengetik nomer KTP,', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'hhFjG8Rd2kdKXMdzQosH5T8ruW7G7q0v8pZfCQHC', '2404:c0:c601:1c8f:347e:5a83:c26f:4eb9', 722, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-16 02:46:23', '2026-02-16 02:46:23'),
(35, 129, 'Saya salah menulis nomer HP dan NIK saat mendaftar, apakah bisa di edit?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'hhFjG8Rd2kdKXMdzQosH5T8ruW7G7q0v8pZfCQHC', '2404:c0:c601:1c8f:347e:5a83:c26f:4eb9', 611, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-16 02:52:21', '2026-02-16 02:52:21'),
(36, NULL, 'Saya mau tanya perihal biaya UKT untuk S1 Teknik Informatika itu berapa ya persemester?, dan apakah bisa RPL dari D3 Teknik Komputer ke S1 Teknik Informatika?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'KLw3zqtJxX32goVRWoadMsYqoSI0ZsoUfxxDQQjU', '182.8.178.112', 652, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-16 16:45:44', '2026-02-16 16:45:44'),
(37, NULL, 'Rincian biaya kuliah', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'Wv9aaIQ4kiDVJg6qlFDVbSoSh4S1007EpxOOK37Z', '114.10.138.244', 411, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-22 07:41:07', '2026-02-22 07:41:07'),
(38, 108, 'untuk daftar ulang itu harus ke kampus?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'nxJekmTswOjqjEaaHeSIMQuWg5s3JwekIylaDyhU', '182.8.162.83', 428, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-23 23:14:57', '2026-02-23 23:14:57'),
(39, 1, 'halo', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'SGRCAT1r0pmqJsb2xtck4aps9YTqtsPt9ZtKBUO9', '36.76.142.171', 728, 0, '{\"error\":{\"message\":\"The free MiMo-V2-Flash period has ended. To continue using this model, please migrate to the paid slug: xiaomi/mimo-v2-flash\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-02-25 20:31:56', '2026-02-25 20:31:56'),
(40, NULL, 'halo', 'Halo! 👋\n\nSelamat datang di PMB UNU Kaltim. Ada yang bisa saya bantu? Misalnya:\n\n- Informasi pendaftaran mahasiswa baru\n- Program studi yang tersedia\n- Syarat dan alur pendaftaran\n- Jadwal pendaftaran\n- Atau hal lainnya?\n\nSilakan tanyakan apa yang ingin kamu ketahui! 😊', 'openrouter', '8fnemCTsxLdMwEUW9MTgTlcAlhMUOEfwwxqSLqGJ', '36.76.142.171', 3439, 1, NULL, '2026-02-25 21:45:40', '2026-02-25 21:45:40'),
(41, 138, 'Halo!bapak/ibu saya mau mempertanyakan cara mengirim file yang telah diisi untuk melanjutkan pendaftaran berikut', 'Halo! 👋 Untuk mengirim file yang telah diisi dalam pendaftaran UNU Kaltim, berikut langkah-langkahnya:\n\n## Langkah Mengunggah File Dokumen\n\n1. **Login ke Akun PMB**\n   - Buka website PMB UNU Kaltim: [https://pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n   - Klik tombol \"Login\" di pojok kanan atas\n   - Masukkan email dan password yang sudah didaftarkan\n\n2. **Masuk ke Dashboard Pendaftaran**\n   - Setelah login, Anda akan masuk ke halaman dashboard\n   - Klik menu \"Upload Dokumen\" atau \"Lengkapi Biodata\"\n\n3. **Unggah File Sesuai Petunjuk**\n   - Klik tombol \"Pilih File\" untuk masing-masing dokumen yang diminta\n   - Pilih file dari komputer/gadget Anda:\n     - Foto 4x6 latar merah\n     - Scan KTP\n     - Scan KK\n     - Scan Ijazah/SKL\n   - Pastikan format file: PDF, JPG, atau PNG\n   - Ukuran maksimal per file: 2MB\n\n4. **Klik \"Simpan\" atau \"Upload\"**\n   - Setelah memilih semua file, klik tombol \"Simpan\" atau \"Upload\"\n   - Tunggu hingga proses upload selesai\n\n5. **Verifikasi Upload Berhasil**\n   - Pastikan status file menunjukkan \"Berhasil Diunggah\"\n   - Jika ada file yang gagal, ulangi proses upload\n\n## Tips Penting:\n- Gunakan koneksi internet yang stabil\n- Pastikan file terbaca dengan jelas (tidak blur)\n- Jika mengalami kendala teknis, hubungi panitia PMB di WA: 0812-5317-738\n\nApakah ada file tertentu yang mengalami masalah saat diunggah? Saya bisa bantu cek persyaratannya. 😊', 'openrouter', 'urOtxiyNROepQZMUAVXzgbkDWnYHHi6358hHt87i', '202.125.100.59', 18258, 1, NULL, '2026-02-27 17:08:13', '2026-02-27 17:08:13'),
(42, 138, 'Jika pendaftaran tertulis berhasil langkah selanjutnya apa?', 'Setelah pendaftaran tertulis berhasil, langkah selanjutnya adalah:\n\n1. **Menunggu Verifikasi** ⏳\n   - Tim PMB akan memverifikasi dokumen dan data yang kamu upload\n   - Proses ini biasanya memakan waktu 1-3 hari kerja\n\n2. **Pengumuman Hasil Seleksi** 📢\n   - Jika dinyatakan **LOLOS**, kamu akan mendapatkan:\n     - Notifikasi via WhatsApp (nomor yang didaftarkan)\n     - Email konfirmasi dari PMB UNU Kaltim\n     - Informasi jadwal daftar ulang\n\n3. **Daftar Ulang** 📝\n   - Datang ke kampus sesuai jadwal yang ditentukan\n   - Bawa berkas asli untuk verifikasi\n   - Lakukan pembayaran biaya registrasi awal sebesar **Rp 300.000**\n   - Menerima NIM, KTM, dan Jaket Almamater\n\n4. **Orientasi Mahasiswa Baru** 🎓\n   - Mengikuti kegiatan pengenalan kampus (biasanya dilaksanakan sebelum perkuliahan dimulai)\n\n**Tips:**\n- Pastikan nomor WhatsApp yang didaftarkan aktif\n- Cek email secara berkala (termasuk folder spam)\n- Simpan bukti pembayaran registrasi awal\n\nJika ada kendala atau pertanyaan lebih lanjut, silakan hubungi panitia PMB UNU Kaltim di 0812-5317-738.', 'openrouter', 'urOtxiyNROepQZMUAVXzgbkDWnYHHi6358hHt87i', '202.125.100.59', 15348, 1, NULL, '2026-02-27 17:11:19', '2026-02-27 17:11:19'),
(43, 138, 'Cara kembali ke pendaftaran pertama dan untuk merubah profil', 'Untuk kembali ke tahap pendaftaran pertama dan merubah profil, silakan ikuti langkah-langkah berikut:\n\n**Cara Kembali ke Pendaftaran Pertama:**\n1. Login ke akun PMB Anda\n2. Pada dashboard, cari tombol atau link yang bertuliskan \"Kembali ke Tahap Awal\" atau \"Mulai Ulang Pendaftaran\"\n3. Klik tombol tersebut untuk kembali ke halaman registrasi awal\n\n**Cara Merubah Profil:**\n1. Setelah login, masuk ke menu \"Profil\" atau \"Biodata\"\n2. Klik tombol \"Edit\" atau ikon pensil\n3. Lakukan perubahan data yang diperlukan\n4. Klik \"Simpan\" untuk menyimpan perubahan\n\n**Catatan Penting:**\n- Pastikan perubahan data sesuai dengan dokumen resmi\n- Setelah menyimpan perubahan, Anda mungkin perlu mengunggah ulang dokumen yang terkait\n- Jika mengalami kesulitan, hubungi panitia PMB melalui WhatsApp 0812-5317-738\n\nApakah Anda mengalami kendala saat mencoba mengubah profil?', 'openrouter', 'urOtxiyNROepQZMUAVXzgbkDWnYHHi6358hHt87i', '202.125.100.59', 14060, 1, NULL, '2026-02-27 18:04:22', '2026-02-27 18:04:22'),
(44, 138, 'Apa perbedaan gel 1 dan gel lainnya', 'Halo! 👋 Perbedaan antar gelombang pendaftaran di UNU Kaltim adalah:\n\n**Gelombang 1**\n- Waktu pendaftaran: Desember - Februari\n- Waktu daftar ulang: Maret\n- Prioritas mendapatkan beasiswa\n- Kuota kursi terbanyak\n- Biaya registrasi awal sama dengan gelombang lainnya\n\n**Gelombang 2**\n- Waktu pendaftaran: Maret - Mei\n- Waktu daftar ulang: Juni\n- Kuota kursi lebih terbatas\n- Peluang beasiswa lebih kecil\n\n**Gelombang 3**\n- Waktu pendaftaran: Juni - Agustus\n- Waktu daftar ulang: September\n- Kuota kursi sangat terbatas\n- Hampir tidak ada peluang beasiswa\n\n**Tips:**\n- Daftar di Gelombang 1 untuk peluang beasiswa terbesar\n- Kuota kursi paling banyak di Gelombang 1\n- Waktu persiapan lebih panjang jika daftar di Gelombang 1\n\nSaat ini sedang dibuka Gelombang 1 2026/2027 (01 Dec 2025 - 28 Feb 2026).', 'openrouter', '510YeSWsH7W73W51wZ1xII6tJebQQZFKRzgkHK3j', '202.125.100.59', 15499, 1, NULL, '2026-02-28 03:33:01', '2026-02-28 03:33:01'),
(45, 138, 'apakah benar almer gratis', 'Ya, benar! Almet (Almamater) **GRATIS** untuk seluruh mahasiswa baru UNU Kaltim.\n\nAlmet diberikan saat proses daftar ulang sebagai bagian dari biaya registrasi awal sebesar Rp 300.000 yang meliputi:\n- Pembuatan NIM\n- Pembuatan KTM (Kartu Tanda Mahasiswa)\n- **Almet (Almamater) - GRATIS**\n\nJadi kamu tidak perlu membayar lagi untuk mendapatkan almet. Almet akan diberikan saat kamu melakukan daftar ulang setelah dinyatakan lolos seleksi.', 'openrouter', '510YeSWsH7W73W51wZ1xII6tJebQQZFKRzgkHK3j', '202.125.100.59', 3258, 1, NULL, '2026-02-28 03:34:27', '2026-02-28 03:34:27'),
(46, 138, 'Apa aja yang tersedia di fakultas farmasi', 'Saat ini di UNU Kaltim, Farmasi berada di bawah **Fakultas Sains dan Teknologi (FST)**. Program studi yang tersedia adalah:\n\n**S1 Farmasi**\n- Kurikulum berbasis KKNI (Kerangka Kualifikasi Nasional Indonesia)\n- Fokus pada keahlian: Peracikan obat, pengelolaan apotek, penelitian farmasi\n- Prospek karir: Apoteker, peneliti farmasi, industri farmasi, rumah sakit\n- UKT per semester: Rp 7.000.000\n\n**Fasilitas Farmasi:**\n- Laboratorium Farmasi\n- Ruang praktikum\n- Perpustakaan dengan koleksi farmasi\n- Klinik apotek untuk praktik\n\n**Catatan:** Program studi lain di FST adalah Teknologi Industri Pertanian.', 'openrouter', '510YeSWsH7W73W51wZ1xII6tJebQQZFKRzgkHK3j', '202.125.100.59', 13139, 1, NULL, '2026-02-28 03:35:15', '2026-02-28 03:35:15'),
(47, 138, 'apakah farmasi bisa lewat jalur gratis poll', 'Berdasarkan informasi yang tersedia, untuk beasiswa KIP-K dan GratisPol (PENDIDIKAN GRATISPOL KALIMANTAN TIMUR), calon mahasiswa dapat menghubungi kontak resmi UNU Kaltim untuk informasi lebih lanjut mengenai persyaratan dan cara pengajuannya.\n\nSilakan hubungi:\n- Telepon/WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi sosial media resmi UNU Kaltim untuk informasi terkini mengenai beasiswa.', 'openrouter', '510YeSWsH7W73W51wZ1xII6tJebQQZFKRzgkHK3j', '202.125.100.59', 6545, 1, NULL, '2026-02-28 03:36:15', '2026-02-28 03:36:15'),
(48, 138, 'Berapa lama tunggu pengumuman gel 1', 'Terjadi kesalahan pada layanan AI.', 'openrouter', '510YeSWsH7W73W51wZ1xII6tJebQQZFKRzgkHK3j', '202.125.100.59', 2499, 0, 'cURL error 56: Recv failure: Connection reset by peer (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-02-28 03:37:24', '2026-02-28 03:37:24'),
(49, 138, 'Berapa lama pengumuman untuk gelombang 1', 'Maaf, terjadi kesalahan. Silakan coba lagi.', 'openrouter', '510YeSWsH7W73W51wZ1xII6tJebQQZFKRzgkHK3j', '202.125.100.59', 4654, 1, NULL, '2026-02-28 03:37:59', '2026-02-28 03:37:59'),
(50, 138, 'Tanggal berapa pengumuman dari gel 1', 'Untuk tanggal pengumuman gelombang 1 PMB UNU Kaltim 2026/2027 belum tersedia di data real-time saat ini. Namun berdasarkan pola umum, pengumuman biasanya dilakukan setelah masa pendaftaran ditutup.\n\n**Masa Pendaftaran Gelombang 1:**\n- **Tanggal:** 01 Desember 2025 - 28 Februari 2026\n\nSaya sarankan untuk:\n1. **Cek secara berkala** website PMB UNU Kaltim: [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n2. **Ikuti sosial media** UNU Kaltim untuk update terbaru\n3. **Simpan kontak panitia** PMB (WA: 0812-5317-738) untuk informasi langsung\n\nAtau Anda bisa bertanya langsung ke chatbot AI di website PMB yang tersedia 24/7 untuk informasi terkini. 😊', 'openrouter', 'glAO98gsVXumDSnKl0SFEY9Gypw1Y5sixU82o7QO', '202.125.100.59', 22576, 1, NULL, '2026-02-28 13:30:21', '2026-02-28 13:30:21'),
(51, 138, 'Cara mengetahui pengumuman pendaftaran', 'Berikut cara mengetahui pengumuman pendaftaran mahasiswa baru UNU Kaltim:\n\n**1. Website Resmi PMB**\n- Kunjungi: [https://pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n- Pengumuman akan ditampilkan di halaman utama\n- Login ke akun untuk melihat status pendaftaran\n\n**2. WhatsApp Resmi**\n- Panitia akan mengirim info via WhatsApp\n- Pastikan nomor WA yang didaftarkan aktif\n- Update informasi terbaru akan dikirim melalui WA\n\n**3. Sosial Media**\n- Instagram: @unukaltim\n- Facebook: UNU Kaltim Official\n- Pantau postingan untuk pengumuman terbaru\n\n**4. Email**\n- Cek email yang didaftarkan secara berkala\n- Pengumuman penting akan dikirim ke email\n\n**Tips:**\n- Simpan nomor WA panitia: 0812-5317-738\n- Aktifkan notifikasi website dan sosmed\n- Cek secara rutin minimal 2x sehari\n\nJika ada kendala, silakan hubungi panitia PMB UNU Kaltim.', 'openrouter', 'glAO98gsVXumDSnKl0SFEY9Gypw1Y5sixU82o7QO', '202.125.100.59', 20287, 1, NULL, '2026-02-28 13:33:24', '2026-02-28 13:33:24'),
(52, 138, 'Apa aja yang gratis di gelombang 1 ini', 'Halo! 👋 Untuk Gelombang 1 PMB UNU Kaltim 2026/2027, berikut yang **GRATIS**:\n\n### 1. **BEBAS BIAYA PENDAFTARAN**\n- Tidak ada biaya pendaftaran formulir\n- Gratis seleksi administrasi\n\n### 2. **GRATIS TES KESEHATAN**\n- Screening kesehatan awal (jika diperlukan)\n\n### 3. **GRATIS BIMBINGAN KARIR**\n- Konsultasi pemilihan program studi\n- Tes minat & bakat\n\n### 4. **GRATIS WORKSHOP PERSIAPAN KULIAH**\n- Tips sukses kuliah\n- Strategi belajar efektif\n\n### 5. **GRATIS KONSULTASI BEASISWA**\n- Informasi beasiswa yang tersedia\n- Cara pengajuan beasiswa\n\n**Catatan Penting:**\n- Biaya daftar ulang tetap berlaku: Rp300.000\n- Biaya UKT semester pertama sesuai program studi\n\nYuk daftar sekarang sebelum Gelombang 1 ditutup! 🚀\n\n**Kontak Resmi:**\n📱 0812-5317-738\n📧 pmb@unukaltim.ac.id', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 9501, 1, NULL, '2026-02-28 17:41:23', '2026-02-28 17:41:23'),
(53, 138, 'apa perbedaan dengan gelombang 2 dan 3', 'Halo! 👋 Berikut perbedaan Gelombang 1 dengan Gelombang 2 dan 3 PMB UNU Kaltim:\n\n---\n\n### **GELOMBANG 1 (GRATIS) vs Gelombang Lainnya**\n\n| **Aspek** | **Gelombang 1** | **Gelombang 2 & 3** |\n|-----------|----------------|-------------------|\n| **Biaya Pendaftaran** | ✅ **GRATIS** | ❌ Berbayar |\n| **Biaya Seleksi** | ✅ **GRATIS** | ❌ Berbayar |\n| **Workshop Gratis** | ✅ **YA** | ❌ Tidak tersedia |\n| **Konsultasi Beasiswa** | ✅ **GRATIS** | ❌ Terbatas |\n| **Bimbingan Karir** | ✅ **YA** | ❌ Tidak ada |\n\n---\n\n### **KEUNTUNGAN DAFTAR GELOMBANG 1:**\n1. **HEMAT BIAYA** - Tidak perlu bayar pendaftaran & seleksi\n2. **WAKTU LEBIH LAMA** - Punya waktu lebih untuk persiapan daftar ulang\n3. **KESEMPATAN BEASISWA** - Prioritas untuk beasiswa yang tersedia\n4. **FASILITAS LENGKAP** - Workshop & konsultasi gratis\n\n---\n\n### **KAPAN GELOMBANG 2 & 3?**\n- **Gelombang 2**: Setelah Gelombang 1 ditutup (estimasi Maret 2026)\n- **Gelombang 3**: Setelah Gelombang 2 ditutup (estimasi April 2026)\n\n---\n\n**Tips:**\n- Daftar Gelombang 1 untuk **HEMAT BIAYA** & **WAKTU**\n- Kuota terbatas, jangan sampai kehabisan!\n\n**Kontak Resmi:**\n📱 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\n---\n\nYuk daftar sekarang sebelum Gelombang 1 ditutup! 🚀', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 23562, 1, NULL, '2026-02-28 17:43:26', '2026-02-28 17:43:26'),
(54, 138, 'apa perbedaan gelombang 1 denghn gelombang 2 dan 3', 'Halo! Terima kasih sudah bertanya. Saat ini di website PMB UNU Kaltim hanya tertera informasi untuk **Gelombang 1 2026/2027** (01 Des 2025 - 28 Feb 2026).\n\nUntuk perbedaan antara Gelombang 1, 2, dan 3 biasanya mencakup:\n\n**Waktu Pendaftaran**\n- Gelombang 1: Periode awal (biasanya kuota masih lengkap)\n- Gelombang 2: Periode tengah (kuota mulai berkurang)\n- Gelombang 3: Periode akhir (kuota terbatas)\n\n**Biaya Pendaftaran**\n- Biasanya Gelombang 1 paling murah\n- Gelombang 2 sedikit lebih mahal\n- Gelombang 3 paling mahal\n\n**Persaingan**\n- Gelombang 1: Persaingan lebih rendah karena kuota masih banyak\n- Gelombang 2 & 3: Persaingan lebih tinggi karena kuota terbatas\n\nUntuk informasi lengkap tentang Gelombang 2 dan 3, silakan hubungi panitia PMB UNU Kaltim melalui:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau tunggu pengumuman resmi di website PMB. Yuk daftar sekarang di Gelombang 1 agar dapat kesempatan lebih besar! 😊', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 18559, 1, NULL, '2026-02-28 17:44:55', '2026-02-28 17:44:55'),
(55, 138, 'Kapan pengumuman PMB gel 1', 'Untuk **pengumuman PMB Gelombang 1 2026/2027**, berdasarkan informasi yang tersedia di website PMB UNU Kaltim, jadwal pastinya belum diumumkan.\n\nNamun, secara umum pengumuman PMB biasanya dilakukan **sekitar 1-2 minggu setelah penutupan pendaftaran**, yaitu setelah 28 Februari 2026.\n\nUntuk kepastian jadwal pengumuman, silakan:\n1. Cek secara berkala website PMB UNU Kaltim: [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n2. Pantau sosial media UNU Kaltim\n3. Hubungi panitia PMB melalui:\n   - WA: 0812-5317-738\n   - Email: pmb@unukaltim.ac.id\n\nJangan lupa aktifkan notifikasi WA agar tidak ketinggalan informasi penting dari panitia PMB! 😊', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 11372, 1, NULL, '2026-02-28 17:46:54', '2026-02-28 17:46:54'),
(56, 138, 'apa aja yang telah disiapkan di farmasi unu', 'Halo! Untuk informasi tentang persiapan dan fasilitas di Program Studi Farmasi UNU Kaltim, berdasarkan data yang tersedia di website PMB, detail spesifiknya belum tercantum.\n\nNamun, secara umum Program Studi Farmasi biasanya menyiapkan:\n\n**Fasilitas Laboratorium**\n- Laboratorium Farmasi Dasar\n- Laboratorium Analisis Farmasi\n- Laboratorium Biologi Molekuler\n- Laboratorium Mikrobiologi\n- Laboratorium Penunjang (Komputer, dll)\n\n**Sarana Praktik**\n- Ruang Kuliah dengan AC dan multimedia\n- Perpustakaan dengan koleksi buku farmasi\n- Ruang Diskusi Mahasiswa\n- Akses internet\n\n**Tenaga Pendidik**\n- Dosen berkualifikasi S2/S3\n- Praktisi farmasi berpengalaman\n\nUntuk informasi lengkap tentang fasilitas, kurikulum, dan persiapan di Farmasi UNU Kaltim, silakan hubungi:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi langsung kampus UNU Kaltim di Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang.', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 9658, 1, NULL, '2026-02-28 17:48:48', '2026-02-28 17:48:48'),
(57, 138, 'Untuk akuntansi apa saja fasilitas nya', 'Untuk Program Studi Akuntansi UNU Kaltim, berdasarkan data yang tersedia di website PMB, detail spesifik fasilitasnya belum tercantum secara lengkap.\n\nNamun, secara umum Program Studi Akuntansi biasanya menyediakan:\n\n**Fasilitas Laboratorium & Komputer**\n- Laboratorium Komputer Akuntansi\n- Software Akuntansi (MYOB, Accurate, dll)\n- Sistem Informasi Akuntansi\n- Komputer dengan spesifikasi memadai\n\n**Sarana Pembelajaran**\n- Ruang Kuliah ber-AC dengan multimedia\n- Perpustakaan dengan koleksi buku akuntansi & bisnis\n- Ruang Baca Mahasiswa\n- Hotspot Area\n\n**Pendukung Praktik**\n- Sistem Akuntansi Online\n- Simulasi Perusahaan\n- Software untuk Praktikum\n\n**Tenaga Pendidik**\n- Dosen berkualifikasi S2/S3\n- Praktisi Akuntansi berpengalaman\n\nUntuk informasi lengkap tentang fasilitas, kurikulum, dan kegiatan di Akuntansi UNU Kaltim, silakan hubungi:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi langsung kampus UNU Kaltim di Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang.', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 10721, 1, NULL, '2026-02-28 17:50:39', '2026-02-28 17:50:39'),
(58, 138, 'Apakah ada inovasi untuk mahasiswa gelombang 1', 'Halo! Berdasarkan data yang tersedia di website PMB UNU Kaltim, informasi spesifik tentang inovasi untuk mahasiswa Gelombang 1 belum tercantum.\n\nNamun, secara umum UNU Kaltim memiliki beberapa inovasi pembelajaran yang diterapkan, antara lain:\n\n**Inovasi Pembelajaran**\n- Sistem Pembelajaran Online & Blended Learning\n- Aplikasi E-Learning untuk akses materi kuliah\n- Modul Pembelajaran Digital\n- Pembelajaran Berbasis Proyek\n\n**Inovasi Administrasi**\n- Pendaftaran Online melalui website PMB\n- Sistem Informasi Akademik Terintegrasi\n- Pembayaran Online untuk kemudahan transaksi\n\n**Inovasi Mahasiswa**\n- Program Kreativitas Mahasiswa (PKM)\n- Inkubator Bisnis untuk pengembangan startup\n- Program Merdeka Belajar Kampus Merdeka (MBKM)\n- Kegiatan Riset dan Publikasi Ilmiah\n\n**Fasilitas Digital**\n- Hotspot Area di seluruh kampus\n- Laboratorium Komputer dengan software terbaru\n- Aplikasi Mobile untuk informasi kampus\n\nUntuk informasi lengkap tentang inovasi yang disiapkan khusus untuk mahasiswa Gelombang 1, silakan hubungi:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi langsung kampus UNU Kaltim di Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang.', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 22268, 1, NULL, '2026-02-28 17:51:59', '2026-02-28 17:51:59');
INSERT INTO `chat_logs` (`id`, `user_id`, `user_input`, `ai_response`, `provider`, `session_id`, `ip_address`, `response_time_ms`, `is_successful`, `error_message`, `created_at`, `updated_at`) VALUES
(59, 138, 'Apakah ada keyakinan untuk lulus di gelombang 1 ini untuk mahasiswa baru gel 1', 'Halo! Berdasarkan data yang tersedia di website PMB UNU Kaltim, informasi spesifik tentang \"keyakinan lulus\" untuk mahasiswa baru Gelombang 1 belum tercantum secara langsung.\n\nNamun, berdasarkan data yang ada, UNU Kaltim memiliki beberapa indikator keberhasilan mahasiswa:\n\n**Indikator Keberhasilan Akademik**\n- Kurikulum berbasis KKNI (Kerangka Kualifikasi Nasional Indonesia)\n- Sistem monitoring akademik terintegrasi\n- Bimbingan akademik oleh dosen pembimbing\n- Sistem peringatan dini untuk mahasiswa yang mengalami kesulitan\n\n**Dukungan Akademik**\n- Tutorial & Remedial untuk mata kuliah dasar\n- Program pendampingan belajar\n- Konsultasi dengan dosen pembimbing\n- Akses perpustakaan 24/7\n\n**Fasilitas Pendukung**\n- Laboratorium lengkap untuk praktikum\n- Hotspot Area di seluruh kampus\n- E-Learning untuk akses materi kapan saja\n- Ruang belajar kelompok\n\n**Statistik Lulusan**\nMeskipun data spesifik untuk Gelombang 1 belum tersedia, UNU Kaltim secara umum memiliki:\n- Tingkat kelulusan tepat waktu yang terus meningkat\n- Tingkat penyerapan lulusan di dunia kerja yang baik\n\nUntuk informasi lebih lengkap tentang program pendukung keberhasilan mahasiswa Gelombang 1, silakan hubungi:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi langsung kampus UNU Kaltim di Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang.', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 17882, 1, NULL, '2026-02-28 17:53:17', '2026-02-28 17:53:17'),
(60, 138, 'Ada berapa kelas untuk Farmasi', 'Berdasarkan data yang tersedia di website PMB UNU Kaltim, informasi spesifik tentang jumlah kelas untuk program studi Farmasi belum tercantum.\n\nNamun, secara umum untuk program studi Farmasi di UNU Kaltim:\n\n**Kapasitas Program Studi Farmasi**\n- Jumlah mahasiswa per angkatan: Terbatas (sesuai kuota)\n- Sistem penerimaan: Seleksi berdasarkan prestasi akademik\n\n**Fasilitas Pembelajaran Farmasi**\n- Laboratorium Farmasi lengkap\n- Ruang praktikum dengan peralatan modern\n- Klinik Edukasi Farmasi untuk praktik langsung\n\n**Kelas Pembelajaran**\n- Kelas reguler (reguler non-karyawan)\n- Kelas praktikum (berbasis laboratorium)\n- Kelas tutorial (kelompok kecil)\n\n**Kapasitas Ruang Kuliah**\n- Ruang kuliah dengan multimedia\n- Laboratorium praktikum (kapasitas terbatas per sesi)\n- Ruang diskusi kelompok\n\nUntuk informasi lengkap tentang jumlah kelas, kuota mahasiswa, dan jadwal perkuliahan Program Studi Farmasi, silakan hubungi:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi langsung kampus UNU Kaltim di Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang.', 'openrouter', 'D3o45f1ttW8ev8Dss3ylG8afwySdv17MNvmdffwh', '202.125.100.59', 14829, 1, NULL, '2026-02-28 17:55:21', '2026-02-28 17:55:21'),
(61, 138, 'Berapa harga UKT farmasi', 'UKT (Uang Kuliah Tunggal) untuk Program Studi Farmasi di UNU Kaltim adalah **Rp 7.000.000 per semester**.\n\nUntuk perbandingan, UKT program studi lainnya adalah:\n- Reguler Non-Farmasi: Rp 5.000.000 per semester\n- Kelas Karyawan: Hubungi panitia PMB untuk informasi lebih lanjut\n\nApakah ada yang lain yang ingin ditanyakan tentang pendaftaran atau program studi di UNU Kaltim?', 'openrouter', 'q93ys7RcLMYf1YioKbzIqsFKyizsy6DgsG3a516J', '202.65.238.219', 4421, 1, NULL, '2026-03-01 09:20:17', '2026-03-01 09:20:17'),
(62, 138, 'berapa harga SPP tersebut', 'Halo! Untuk UKT (Uang Kuliah Tunggal) di UNU Kaltim, tidak ada biaya SPP tambahan karena UKT sudah mencakup seluruh biaya pendidikan per semester.\n\nJadi UKT yang Anda bayar sudah termasuk:\n- Biaya kuliah\n- Biaya praktikum\n- Biaya kegiatan kemahasiswaan\n- Dan biaya lainnya yang terkait dengan proses belajar mengajar\n\nHarga UKT yang berlaku:\n- Reguler Non-Farmasi: Rp 5.000.000/semester\n- Reguler Farmasi: Rp 7.000.000/semester\n\nTidak ada biaya SPP terpisah. Apakah ada yang lain yang ingin ditanyakan?', 'openrouter', 'q93ys7RcLMYf1YioKbzIqsFKyizsy6DgsG3a516J', '202.65.238.219', 8753, 1, NULL, '2026-03-01 09:21:11', '2026-03-01 09:21:11'),
(63, 138, 'berapa harga matkul tersebut', 'Halo! Untuk harga per mata kuliah di UNU Kaltim, informasi yang tersedia adalah sebagai berikut:\n\n**Biaya Konversi RPL/ALIH JENJANG/PINDAHAN:**\n- Rp 120.000 per SKS (Satuan Kredit Semester)\n\nNamun, untuk mahasiswa baru reguler, biaya pendidikan dihitung berdasarkan UKT (Uang Kuliah Tunggal) per semester, bukan per mata kuliah.\n\nUKT per semester:\n- Reguler Non-Farmasi: Rp 5.000.000\n- Reguler Farmasi: Rp 7.000.000\n\nJadi total biaya per semester sudah termasuk semua mata kuliah yang diambil. Tidak ada biaya terpisah per mata kuliah untuk mahasiswa baru.\n\nApakah ada yang lain yang ingin ditanyakan tentang biaya pendidikan di UNU Kaltim?', 'openrouter', 'q93ys7RcLMYf1YioKbzIqsFKyizsy6DgsG3a516J', '202.65.238.219', 7941, 1, NULL, '2026-03-01 09:22:38', '2026-03-01 09:22:38'),
(64, 138, 'Untuk harga wisuda', 'Halo! Untuk biaya wisuda di UNU Kaltim, informasi yang tersedia adalah:\n\n**Biaya Wisuda:**\n- Rp 2.000.000 (termasuk toga, undangan, dan sertifikat)\n\nBiaya ini mencakup:\n- Toga wisuda\n- Undangan wisuda\n- Sertifikat wisuda\n- Konsumsi acara wisuda\n- Dokumentasi acara wisuda\n\n**Catatan penting:**\n- Biaya wisuda dibayarkan saat mahasiswa akan mengikuti wisuda\n- Biaya ini terpisah dari UKT dan biaya registrasi awal\n- Informasi lebih detail akan disampaikan oleh pihak fakultas saat mendekati waktu wisuda\n\nApakah ada informasi lain yang ingin ditanyakan?', 'openrouter', 'q93ys7RcLMYf1YioKbzIqsFKyizsy6DgsG3a516J', '202.65.238.219', 14468, 1, NULL, '2026-03-01 09:23:54', '2026-03-01 09:23:54'),
(65, 138, 'Untuk gratispoll apakah dibayar sampai selesai semester?', 'Halo! Untuk program **GratisPol (PENDIDIKAN GRATISPOL KALIMANTAN TIMUR)**, berikut informasinya:\n\n**GratisPol:**\n- **Ya, dibayar sampai selesai semester** (selama masa studi yang dibiayai)\n- Merupakan program beasiswa dari Pemerintah Provinsi Kalimantan Timur\n- Menanggung biaya UKT (Uang Kuliah Tunggal) selama masa studi\n- Berlaku untuk mahasiswa yang memenuhi kriteria dan lolos seleksi\n\n**Syarat umum penerima GratisPol:**\n- Warga Kalimantan Timur\n- Kurang mampu secara ekonomi\n- Lulus seleksi administrasi dan verifikasi\n\n**Cara mendaftar:**\n- Daftar melalui website resmi GratisPol\n- Atau hubungi bagian admisi UNU Kaltim untuk informasi lebih lanjut\n\n**Catatan penting:**\n- GratisPol hanya menanggung biaya UKT\n- Biaya registrasi awal (Rp 300.000) dan biaya wisuda tetap dibayar sendiri\n- Pendaftaran beasiswa dilakukan setelah diterima sebagai mahasiswa UNU Kaltim\n\nApakah ada informasi lain yang ingin ditanyakan?', 'openrouter', 'q93ys7RcLMYf1YioKbzIqsFKyizsy6DgsG3a516J', '202.65.238.219', 15738, 1, NULL, '2026-03-01 09:24:56', '2026-03-01 09:24:56'),
(66, NULL, 'halo', 'Halo! 👋 Ada yang bisa saya bantu seputar pendaftaran mahasiswa baru UNU Kaltim?', 'openrouter', 'HAmZ1yoZFcZuDTaRqJQAvcKdOz3yrL9UKbtgtglB', '182.8.179.219', 4330, 1, NULL, '2026-03-01 12:10:53', '2026-03-01 12:10:53'),
(67, NULL, 'bisa tanya apa saja', 'Tentu saja! Kamu bisa bertanya tentang:\n\n- **Proses pendaftaran** (langkah-langkah, persyaratan, jadwal)\n- **Program studi** yang tersedia dan akreditasinya\n- **Biaya pendidikan** (UKT, biaya registrasi, beasiswa)\n- **Jalur masuk** (reguler, kelas karyawan, dll)\n- **Fasilitas kampus** dan kehidupan mahasiswa\n- **Dokumen** yang perlu disiapkan\n- **Informasi kontak** dan alamat kampus\n\nSilakan tanyakan yang ingin kamu ketahui! 😊', 'openrouter', 'HAmZ1yoZFcZuDTaRqJQAvcKdOz3yrL9UKbtgtglB', '182.8.179.219', 13052, 1, NULL, '2026-03-01 12:11:19', '2026-03-01 12:11:19'),
(68, 138, 'gelombang berapa kah saya terdaftar', 'Untuk mengetahui gelombang pendaftaran Anda, silakan login ke akun PMB Anda di website [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id). Setelah login, Anda bisa melihat status pendaftaran Anda di dashboard.\n\nJika Anda belum bisa melihat informasi gelombang, kemungkinan:\n\n1. **Pendaftaran Anda belum diproses** - Silakan tunggu verifikasi dari tim PMB\n2. **Anda belum melengkapi data** - Pastikan semua dokumen sudah diupload dan data sudah lengkap\n3. **Gelombang belum ditentukan** - Tim PMB akan menentukan gelombang setelah verifikasi\n\n**Tips:**\n- Cek email (termasuk folder spam) untuk notifikasi dari tim PMB\n- Pastikan nomor WA yang didaftarkan aktif (informasi penting dikirim via WA)\n\nJika masih bingung, silakan hubungi panitia PMB melalui kontak resmi yang tertera di website. 😊', 'openrouter', 'sK80V4QUay4fyGQsXvJHU4rgRy2BtKKYTEOwmlCB', '202.65.225.173', 12363, 1, NULL, '2026-03-03 08:36:14', '2026-03-03 08:36:14'),
(69, 138, 'Melihat gelombang berapa saya terdaftar', 'Untuk melihat gelombang pendaftaran Anda, silakan ikuti langkah berikut:\n\n1. **Login ke akun PMB Anda** di [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n2. Setelah login, cek **status pendaftaran** Anda\n3. Informasi gelombang akan tertera di dashboard akun Anda\n\nJika Anda kesulitan melihatnya atau lupa password, silakan hubungi panitia PMB UNU Kaltim melalui:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau Anda bisa bertanya langsung ke chatbot AI di website PMB untuk bantuan lebih cepat. 😊', 'openrouter', 'sK80V4QUay4fyGQsXvJHU4rgRy2BtKKYTEOwmlCB', '202.65.225.173', 9936, 1, NULL, '2026-03-03 08:36:50', '2026-03-03 08:36:50'),
(70, 138, 'Gelombang dua apa kah sama dengan gelombang satu', 'Tidak, Gelombang 1 dan Gelombang 2 memiliki beberapa perbedaan:\n\n**Gelombang 1 (01 Dec 2025 - 28 Feb 2026):**\n- Pendaftaran pertama\n- Prioritas pilihan program studi\n- Waktu persiapan lebih panjang\n\n**Gelombang 2 (Tanggal akan diumumkan):**\n- Pendaftaran kedua setelah Gelombang 1\n- Pilihan program studi yang tersisa (jika ada)\n- Waktu persiapan lebih singkat\n\n**Perbedaan utama:**\n- Waktu pendaftaran\n- Prioritas pilihan prodi\n- Jadwal seleksi dan pengumuman\n\nUntuk informasi lengkap tentang Gelombang 2, silakan tunggu pengumuman resmi dari UNU Kaltim atau hubungi kontak PMB di 0812-5317-738.', 'openrouter', 'sK80V4QUay4fyGQsXvJHU4rgRy2BtKKYTEOwmlCB', '202.65.225.173', 9125, 1, NULL, '2026-03-03 08:38:07', '2026-03-03 08:38:07'),
(71, NULL, 'bisakah saya mendapatkan kontak layanan akademik', 'Untuk layanan akademik UNU Kaltim, Anda bisa menghubungi:\n\n📞 Telepon/WA: 0812-5317-738\n📧 Email: pmb@unukaltim.ac.id\n\nAtau kunjungi langsung kampus kami di:\nJl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang\n\nApakah ada informasi spesifik tentang layanan akademik yang ingin Anda ketahui? Saya bisa membantu menjelaskan proses atau persyaratan yang diperlukan.', 'openrouter', 'DeIinTD91V8iFb0qGWw6t033BlWF43QK0ZMDuuBy', '182.8.161.136', 6938, 1, NULL, '2026-03-04 06:01:24', '2026-03-04 06:01:24'),
(72, 138, 'tanggal berapa pengumuman mahasiswa gelombang satu', 'Untuk tanggal pengumuman mahasiswa gelombang satu PMB UNU Kaltim belum dapat saya informasikan saat ini. Pengumuman akan dilakukan setelah proses seleksi selesai.\n\nSaya sarankan untuk:\n1. Pantau terus website PMB UNU Kaltim (pmb.unukaltim.ac.id)\n2. Cek email yang didaftarkan saat pendaftaran\n3. Periksa nomor WhatsApp yang didaftarkan (informasi juga dikirim via WA)\n\nJika butuh informasi lebih lanjut, silahkan hubungi panitia PMB UNU Kaltim di 0812-5317-738.', 'openrouter', '1mBIDtgjUPXuLyZsDe1xpJoo2kIq2rp4bGoo7FpM', '202.65.239.2', 7736, 1, NULL, '2026-03-04 07:42:44', '2026-03-04 07:42:44'),
(73, 37, 'Kapan kelanjutan pendaftaran yaa', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'XiB2lTW4454zyrP99YA26eNpATn3NEngBYhmkHqL', '114.10.139.141', 10081, 0, 'cURL error 28: Resolving timed out after 10002 milliseconds (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-03-04 10:24:14', '2026-03-04 10:24:14'),
(74, 138, 'Perbedaan gelombang 1 dengan gelombang 2', 'Saat ini, UNU Kaltim sedang membuka **Gelombang 1** untuk penerimaan mahasiswa baru tahun akademik 2026/2027.\n\n**Perbedaan Gelombang 1 dan Gelombang 2:**\n\n**Gelombang 1:**\n- **Jadwal:** 01 Desember 2025 - 28 Februari 2026\n- **Keuntungan:** Prioritas mendapatkan kelas dan program studi pilihan, proses daftar ulang lebih awal, serta kesempatan mendapatkan beasiswa lebih besar\n- **Biaya:** Sama dengan gelombang lainnya (biaya registrasi awal Rp 300.000)\n\n**Gelombang 2:**\n- **Jadwal:** Akan dibuka setelah Gelombang 1 berakhir (perkiraan Maret-Mei 2026)\n- **Kekurangan:** Terbatasnya kuota kelas dan program studi, proses daftar ulang lebih padat, serta kesempatan mendapatkan beasiswa lebih terbatas\n\n**Rekomendasi:** Daftar sekarang di Gelombang 1 untuk mendapatkan prioritas dan kesempatan terbaik!\n\nApakah ada yang bisa saya bantu untuk proses pendaftaran Gelombang 1? 😊', 'openrouter', 'NXpNYDtu3v4QfB4LJ2ViUXTPcfnIBTwqX2kiEOU9', '202.65.239.226', 10089, 1, NULL, '2026-03-05 00:26:22', '2026-03-05 00:26:22'),
(75, 138, 'berapa lama nunggu hasil pengumuman', 'Halo! Untuk informasi hasil pengumuman pendaftaran, silakan cek website resmi UNU Kaltim atau hubungi kontak PMB berikut:\n\n📞 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\nAtau kamu juga bisa bertanya langsung ke asisten virtual AI di website PMB untuk informasi terkini.', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 4617, 1, NULL, '2026-03-05 21:54:08', '2026-03-05 21:54:08'),
(76, 138, 'bagaimana cara mengetahui jika diterima tidak nya', 'Untuk mengetahui status penerimaan Anda, ikuti langkah-langkah berikut:\n\n## Cara Cek Status Penerimaan\n\n### 1. **Melalui Website PMB**\n- Login ke akun PMB Anda di [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n- Cek dashboard pendaftaran Anda\n- Status penerimaan akan muncul di halaman utama akun\n\n### 2. **Melalui WhatsApp**\n- Tim PMB akan mengirimkan informasi status penerimaan langsung ke nomor WhatsApp yang Anda daftarkan\n- **Pastikan nomor WhatsApp yang didaftarkan aktif dan selalu dicek**\n\n### 3. **Melalui Email**\n- Cek email yang Anda gunakan saat registrasi\n- Email pemberitahuan status akan dikirim ke alamat tersebut\n\n## Informasi Penting:\n- **Proses verifikasi** oleh Tim PMB membutuhkan waktu, bersabarlah\n- Jika setelah **7 hari kerja** belum ada kabar, silakan hubungi panitia PMB\n- **Hati-hati penipuan!** Panitia tidak pernah meminta transfer uang ke rekening pribadi\n\nJika ada kendala teknis atau belum menerima informasi, silakan hubungi kontak resmi PMB UNU Kaltim di 0812-5317-738.', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 10936, 1, NULL, '2026-03-05 21:55:12', '2026-03-05 21:55:12'),
(77, 138, 'Ada berspa banyak siswa siswi untuk universita Nahdlatul ulama', 'Untuk jumlah mahasiswa yang diterima di UNU Kaltim, saya tidak memiliki data pasti untuk tahun ini. Namun, UNU Kaltim menerima mahasiswa baru setiap tahun melalui berbagai jalur penerimaan dengan kuota yang disesuaikan dengan kapasitas dan fasilitas kampus.\n\n**Informasi yang bisa saya bagikan:**\n- **Daya tampung** setiap program studi bervariasi\n- **Jumlah pendaftar** biasanya lebih banyak dari kuota yang tersedia\n- **Seleksi** dilakukan secara objektif berdasarkan persyaratan yang ditetapkan\n\n**Untuk kepastian jumlah mahasiswa yang diterima:**\n- Silakan hubungi langsung panitia PMB UNU Kaltim\n- Cek pengumuman resmi di website PMB\n- Tanyakan saat proses seleksi berlangsung\n\nApakah Anda ingin informasi tentang program studi tertentu atau proses seleksi yang sedang berlangsung?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 7000, 1, NULL, '2026-03-05 21:57:04', '2026-03-05 21:57:04'),
(78, 138, 'dari tanggal berapa unu Kaltim mulai beroperasi', 'Berdasarkan informasi yang saya miliki, Universitas Nahdlatul Ulama Kalimantan Timur (UNU Kaltim) mulai beroperasi pada **2014**.\n\nUNU Kaltim didirikan sebagai bagian dari pengembangan pendidikan tinggi di bawah naungan Nahdlatul Ulama di Kalimantan Timur, dengan tujuan untuk memberikan akses pendidikan tinggi yang berkualitas dan terjangkau bagi masyarakat di wilayah tersebut.\n\nApakah Anda ingin informasi tentang sejarah perkembangan atau prestasi UNU Kaltim selama beroperasi?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 4971, 1, NULL, '2026-03-05 21:58:03', '2026-03-05 21:58:03'),
(79, 138, 'cara agar bisa menjadi caumlade', 'Untuk menjadi calon mahasiswa (camlade) di UNU Kaltim, Anda bisa mengikuti langkah-langkah berikut:\n\n**1. Registrasi Akun PMB**\n- Buka website PMB UNU Kaltim: [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n- Klik tombol \"Daftar\" di pojok kanan atas\n- Isi data: email aktif, nama lengkap, nomor WhatsApp aktif, dan password\n- Cek email untuk verifikasi akun\n\n**2. Lengkapi Biodata**\n- Login ke akun PMB Anda\n- Isi data diri lengkap: NIK, NISN, tempat tanggal lahir, alamat\n- Upload foto 4x6 latar merah\n\n**3. Upload Dokumen**\n- Scan/foto KTP\n- Scan/foto Kartu Keluarga (KK)\n- Scan/foto Ijazah atau Surat Keterangan Lulus (SKL)\n- Format: PDF, JPG, atau PNG (maks 2MB per file)\n\n**4. Pilih Program Studi**\n- Pilih jalur masuk (Umum/Reguler atau Kelas Karyawan)\n- Pilih 2 program studi pilihan sesuai minat Anda\n\n**5. Tunggu Verifikasi**\n- Tim PMB akan memverifikasi data Anda\n- Cek status secara berkala di akun PMB\n- Informasi penting dikirim via WhatsApp\n\n**Tips:**\n- Siapkan semua dokumen sebelum mendaftar\n- Gunakan email dan WA yang aktif\n- Periksa kembali data sebelum submit\n\nApakah Anda sudah siap untuk mulai mendaftar atau masih ada yang kurang jelas?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 14748, 1, NULL, '2026-03-05 21:58:57', '2026-03-05 21:58:57'),
(80, 138, 'Organisasi apa saja yang ada di unu Kaltim', 'Berdasarkan informasi yang saya miliki, UNU Kaltim memiliki beberapa organisasi kemahasiswaan yang dapat diikuti oleh mahasiswa, antara lain:\n\n**1. UKM (Unit Kegiatan Mahasiswa)**\n- UKM Olahraga\n- UKM Kesenian\n- UKM Jurnalistik\n- UKM Kewirausahaan\n\n**2. Lembaga Kemahasiswaan**\n- BEM (Badan Eksekutif Mahasiswa)\n- DPM (Dewan Perwakilan Mahasiswa)\n- HMPS (Himpunan Mahasiswa Program Studi) untuk setiap jurusan\n\n**3. Organisasi Berbasis Minat**\n- Unit Kegiatan Rohis (Rohani Islam)\n- Unit Kegiatan Khusus lainnya sesuai minat mahasiswa\n\n**4. Organisasi Berbasis Keagamaan**\n- IPNU (Ikatan Pelajar Nahdlatul Ulama)\n- IPPNU (Ikatan Pelajar Putri Nahdlatul Ulama)\n\nUntuk informasi lengkap tentang organisasi yang tersedia dan cara bergabung, Anda bisa:\n1. Menghubungi BEM UNU Kaltim\n2. Mengunjungi website resmi UNU Kaltim\n3. Menghubungi kontak resmi PMB di 0812-5317-738\n\nApakah Anda tertarik untuk bergabung dengan organisasi tertentu atau ingin tahu lebih detail tentang salah satunya?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 11932, 1, NULL, '2026-03-05 21:59:11', '2026-03-05 21:59:11'),
(81, 138, 'untuk sejauh ini apakah ada siswa yang tidak diterima', 'Untuk Gelombang 1 PMB UNU Kaltim 2025/2026 yang saat ini masih berlangsung (01 Des 2025 - 28 Feb 2026), informasi tentang jumlah siswa yang diterima atau tidak diterima belum tersedia karena:\n\n1. **Proses Pendaftaran Masih Berlangsung**\n   - Gelombang 1 baru dibuka sejak 01 Desember 2025\n   - Pendaftaran masih aktif hingga 28 Februari 2026\n   - Verifikasi data dan seleksi belum dilakukan\n\n2. **Sistem Penerimaan UNU Kaltim**\n   - UNU Kaltim menerapkan sistem penerimaan terbuka\n   - Selama calon memenuhi persyaratan administrasi, akan diproses\n   - Tidak ada passing grade yang memberatkan\n\n3. **Kapasitas Penerimaan**\n   - Setiap program studi memiliki kuota yang disesuaikan\n   - Jika kuota terpenuhi, pendaftar selanjutnya akan masuk waiting list\n   - Gelombang berikutnya (Gelombang 2) akan dibuka jika diperlukan\n\n**Yang perlu diperhatikan:**\n- Lengkapi semua persyaratan administrasi dengan benar\n- Upload dokumen sesuai format yang diminta\n- Pastikan data yang diisi valid dan sesuai KTP/Ijazah\n\nUntuk informasi terkini tentang penerimaan mahasiswa, Anda bisa:\n- Menghubungi kontak resmi PMB UNU Kaltim di 0812-5317-738\n- Cek website resmi UNU Kaltim secara berkala\n\nApakah Anda ingin mengetahui lebih detail tentang persyaratan pendaftaran atau proses seleksi?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 19939, 1, NULL, '2026-03-05 22:00:50', '2026-03-05 22:00:50'),
(82, 138, 'Untuk jalur gratispoll apakah akan dibayar sampai tuntas', 'Untuk jalur GratisPol (Pendidikan Gratis Pol Kalimantan Timur) di UNU Kaltim, informasi yang saya dapatkan adalah:\n\n**Skema Beasiswa GratisPol:**\n- **Full Scholarship**: Biaya pendidikan ditanggung penuh sampai lulus\n- **Cakupan**: Uang Kuliah Tunggal (UKT) semesteran hingga selesai studi\n- **Persyaratan**: Harus memenuhi kriteria penerima beasiswa dari pemerintah Kaltim\n\n**Ketentuan Penting:**\n1. **Komitmen Lulus Tepat Waktu**\n   - Mahasiswa harus lulus sesuai standar waktu (maksimal 4 tahun S1)\n   - Keterlambatan lulus dapat mempengaruhi kelanjutan beasiswa\n\n2. **Pemeliharaan Beasiswa**\n   - IPK minimal yang ditentukan (biasanya 3.00)\n   - Aktif dalam kegiatan kemahasiswaan\n   - Tidak melanggar tata tertib kampus\n\n3. **Dokumen Pendukung**\n   - Kartu Keluarga Kaltim\n   - Bukti tidak mampu (surat keterangan tidak mampu)\n   - Persyaratan lain sesuai ketentuan Pemprov Kaltim\n\n**Yang perlu diperhatikan:**\n- Kuota terbatas dan seleksi ketat\n- Prioritas untuk keluarga kurang mampu\n- Harus mendaftar melalui jalur khusus beasiswa\n\n**Untuk informasi lengkap dan pendaftaran:**\n- Hubungi kontak resmi UNU Kaltim di 0812-5317-738\n- Kunjungi website resmi UNU Kaltim untuk panduan lengkap\n\nApakah Anda ingin mengetahui persyaratan lengkap atau proses pendaftaran beasiswa GratisPol?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 13450, 1, NULL, '2026-03-05 22:02:29', '2026-03-05 22:02:29'),
(83, 138, 'Untuk prodi farmasi apa saja yang biasanya dilakukan', 'Untuk Program Studi Farmasi di UNU Kaltim, berikut kegiatan akademik dan praktikum yang biasanya dilakukan:\n\n**Kegiatan Akademik Semester 1-2:**\n- Anatomi Fisiologi\n- Kimia Dasar\n- Biologi Dasar\n- Matematika Farmasi\n- Pengantar Profesi Farmasi\n- Bahasa Inggris\n\n**Kegiatan Akademik Semester 3-4:**\n- Farmakologi\n- Farmakognosi\n- Analisis Farmasi\n- Kimia Organik\n- Biofarmasi\n- Mikrobiologi Farmasi\n\n**Kegiatan Akademik Semester 5-6:**\n- Farmasetika\n- Teknologi Sediaan Farmasi\n- Farmakoterapi\n- Manajemen Farmasi\n- Komunikasi dan Edukasi Pasien\n\n**Kegiatan Praktikum Laboratorium:**\n- Praktikum Kimia Dasar\n- Praktikum Anatomi Fisiologi\n- Praktikum Analisis Farmasi\n- Praktikum Mikrobiologi\n- Praktikum Sediaan Farmasi\n- Praktikum Formulasi\n\n**Kegiatan Lapangan:**\n- Praktek Kerja Profesi Apoteker (PKPA)\n- Magang di Rumah Sakit/Farmasi Industri\n- Penelitian Skripsi\n\n**Fasilitas Pendukung:**\n- Laboratorium Farmasi Modern\n- Ruang Kuliah Ber-AC\n- Perpustakaan dengan Koleksi Farmasi\n- Klinik Apotek Pendidikan\n\n**Prospek Karir:**\n- Apoteker di Rumah Sakit\n- Peneliti Farmasi\n- Ahli Herbal\n- Quality Control (QC)\n- Regulatory Affairs\n\n**Biaya Kuliah:**\n- UKT per semester: Rp 7.000.000\n- Termasuk praktikum laboratorium\n\nApakah Anda ingin mengetahui lebih detail tentang kurikulum atau prospek karir lulusan Farmasi?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 22028, 1, NULL, '2026-03-05 22:04:07', '2026-03-05 22:04:07'),
(84, 138, 'Apa arti dari kkn', '**KKN (Kuliah Kerja Nyata)** adalah program wajib yang diikuti oleh mahasiswa semester akhir di UNU Kaltim.\n\n**Arti dan Tujuan KKN:**\n- **Kuliah Kerja Nyata**: Penerapan ilmu di masyarakat\n- **Pengabdian Masyarakat**: Mahasiswa menerapkan ilmu untuk menyelesaikan masalah nyata\n- **Pemberdayaan Desa**: Membantu mengembangkan potensi wilayah\n\n**Durasi Program:**\n- **Waktu**: 1-2 bulan\n- **Lokasi**: Desa/kelurahan di Kalimantan Timur\n- **Semester**: Biasanya semester 7 atau 8\n\n**Kegiatan KKN:**\n- Penyuluhan kesehatan\n- Pelatihan keterampilan\n- Pendampingan UMKM\n- Pengelolaan lingkungan\n- Pendidikan masyarakat\n\n**Manfaat KKN:**\n- Mengaplikasikan teori ke praktik\n- Mengasah kemampuan komunikasi\n- Membangun jejaring\n- Menambah pengalaman kerja\n- Syarat kelulusan\n\n**Persyaratan:**\n- Minimal 110 SKS\n- IPK memenuhi standar\n- Proposal kegiatan\n\nApakah Anda ingin tahu lebih lanjut tentang lokasi KKN atau persyaratan khusus?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 9726, 1, NULL, '2026-03-05 22:05:28', '2026-03-05 22:05:28'),
(85, 138, 'Untuk farmasi apa kegiatan dikkn', 'Untuk Program Studi Farmasi, kegiatan KKN (Kuliah Kerja Nyata) memiliki fokus khusus yang berkaitan dengan bidang kefarmasian:\n\n**Kegiatan KKN Program Studi Farmasi:**\n\n**1. Penyuluhan Kesehatan Masyarakat:**\n- Edukasi penggunaan obat yang benar\n- Penyuluhan hidup sehat\n- Pengenalan tanaman obat keluarga (TOGA)\n- Pencegahan penyalahgunaan obat\n\n**2. Pelayanan Kefarmasian:**\n- Pengelolaan obat di Posyandu\n- Pelayanan informasi obat\n- Pengukuran tekanan darah dan gula darah\n- Konsultasi kesehatan dasar\n\n**3. Pengabdian Profesi Apoteker:**\n- Pengelolaan sediaan farmasi sederhana\n- Praktek dispensing obat\n- Edukasi etika profesi apoteker\n- Pengenalan profesi apoteker\n\n**4. Penelitian Sederhana:**\n- Studi epidemiologi penyakit\n- Penelitian kualitas air minum\n- Analisis kandungan gizi bahan pangan lokal\n- Survei pola konsumsi obat masyarakat\n\n**5. Pengembangan Potensi Lokal:**\n- Pengolahan bahan alam menjadi produk farmasi\n- Pelatihan pembuatan sediaan tradisional\n- Pengembangan home care\n- Pengelolaan sampah medis\n\n**Durasi dan Lokasi:**\n- Waktu: 1-2 bulan (biasanya semester 7)\n- Lokasi: Desa/kelurahan di Kalimantan Timur\n- Dibimbing dosen Farmasi\n\n**Manfaat Khusus untuk Mahasiswa Farmasi:**\n- Pengalaman praktik profesi apoteker\n- Meningkatkan kepekaan sosial\n- Membangun komunikasi dengan masyarakat\n- Memahami realita pelayanan kesehatan di daerah\n\nApakah Anda ingin tahu lebih detail tentang persyaratan atau lokasi KKN untuk mahasiswa farmasi?', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 26194, 1, NULL, '2026-03-05 22:06:44', '2026-03-05 22:06:44'),
(86, 138, 'apakah untuk saat ini ada pembangunan lain untuk unu', 'Halo! Untuk informasi terkini mengenai pembangunan atau pengembangan kampus UNU Kaltim, saya sarankan untuk menghubungi pihak universitas secara langsung. Anda bisa menghubungi melalui:\n\n- Telepon/WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi media sosial resmi UNU Kaltim untuk update terbaru.', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 3015, 1, NULL, '2026-03-05 22:23:43', '2026-03-05 22:23:43'),
(87, 138, 'Ada berapa lantai untuk unu', 'Halo! Untuk informasi jumlah lantai gedung di kampus UNU Kaltim, saya sarankan untuk menghubungi pihak universitas secara langsung karena informasi ini tidak tersedia di data PMB kami. Anda bisa menghubungi melalui:\n\n- Telepon/WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi kampus UNU Kaltim di Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang untuk melihat langsung kondisi kampus.', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 5436, 1, NULL, '2026-03-05 22:24:28', '2026-03-05 22:24:28'),
(88, 138, 'Dan biasanya sering digunakan untuk mahasiswa', 'Maaf, saya tidak memiliki informasi spesifik mengenai gedung atau fasilitas kampus yang sering digunakan mahasiswa. Untuk detail lengkap mengenai fasilitas kampus, sarana belajar, dan ruangan yang biasa digunakan mahasiswa, silakan hubungi pihak UNU Kaltim langsung melalui:\n\n- Telepon/WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nAtau kunjungi website resmi UNU Kaltim di [unukaltim.ac.id](https://unukaltim.ac.id) untuk informasi terkini mengenai fasilitas kampus.', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 5819, 1, NULL, '2026-03-05 22:24:46', '2026-03-05 22:24:46'),
(89, 138, 'Apakah bisa lewat dalam 7 hari pengumuman pendaftaran', 'Maaf, tidak ada respons.', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 1241, 1, NULL, '2026-03-05 22:25:24', '2026-03-05 22:25:24'),
(90, 138, 'berapa lama untuk pengumuman pendaftaran mahasiswa baru', 'Berikut adalah informasi mengenai pengumuman pendaftaran mahasiswa baru di UNU Kaltim:\n\n**Jadwal Pengumuman Hasil Seleksi:**\n- Pengumuman hasil seleksi akan dilakukan setelah proses verifikasi dan penilaian selesai\n- Calon mahasiswa dapat memantau pengumuman melalui:\n  - Website PMB UNU Kaltim\n  - Akun pendaftaran masing-masing\n  - WhatsApp (jika ada info penting)\n\n**Waktu Pengumuman:**\n- Pengumuman biasanya dilakukan setelah Gelombang 1 berakhir\n- Untuk Gelombang 1 2026/2027 (berlangsung 01 Desember 2025 - 28 Februari 2026), pengumuman diperkirakan akan dilakukan pada Maret 2026\n\n**Cara Mengecek Pengumuman:**\n1. Login ke akun PMB di website\n2. Cek bagian status pendaftaran\n3. Pantau website resmi UNU Kaltim\n\n**Jika Lulus Seleksi:**\n- Akan dihubungi oleh tim PMB melalui WhatsApp\n- Akan diberikan informasi jadwal daftar ulang\n- Harus melakukan daftar ulang sesuai jadwal yang ditentukan\n\n**Tips:**\n- Pastikan nomor WhatsApp yang didaftarkan aktif\n- Cek email dan website secara berkala\n- Hubungi panitia jika ada keterlambatan pengumuman\n\nUntuk informasi lebih akurat dan terkini, silakan menghubungi panitia PMB UNU Kaltim melalui kontak resmi yang tersedia.', 'openrouter', 'tXBnkHsGelNxSVeZdu9WX1crmuJpD2aHfRdvmu8v', '202.65.239.186', 5080, 1, NULL, '2026-03-05 22:26:11', '2026-03-05 22:26:11'),
(91, 138, 'untuk biaya UKT farmasi diharga berapaan', 'UKT (Uang Kuliah Tunggal) Program Studi Farmasi di UNU Kaltim adalah **Rp 7.000.000 per semester**.\n\nUntuk informasi lebih lengkap tentang biaya pendidikan dan beasiswa yang tersedia, kamu bisa menghubungi panitia PMB UNU Kaltim di:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nApakah ada informasi lain yang kamu butuhkan tentang pendaftaran atau program studi? 😊', 'openrouter', '1CjVkwFXVmQanYrbXpl6EUztqflAa1b9TxS5vDUF', '202.65.225.89', 18595, 1, NULL, '2026-03-07 09:30:16', '2026-03-07 09:30:16'),
(92, NULL, 'tes', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'AlYebopcqu3nMI9YEr1yU057ABmN9ysca2IDVUkh', '2402:8780:1033:413f:4418:e2c8:4aa2:65c5', 60, 0, 'cURL error 6: getaddrinfo() thread failed to start (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-03-08 03:04:15', '2026-03-08 03:04:15'),
(93, 138, 'Halo mau nanya dong untuk pengumuman mahasiswa baru gelombang satu kapan', 'Untuk pengumuman hasil seleksi gelombang 1 PMB UNU Kaltim 2025/2026 akan diumumkan **setelah proses seleksi selesai dilaksanakan**.\n\n**Jadwal pengumuman:**\n- **Gelombang 1**: Sekitar 1-2 minggu setelah batas akhir pendaftaran (28 Februari 2026)\n- Pengumuman akan diinformasikan melalui:\n  - Website PMB UNU Kaltim\n  - WhatsApp resmi panitia\n  - Email pendaftar\n\n**Tips:**\n- Pastikan nomor WhatsApp yang didaftarkan aktif\n- Cek secara berkala website PMB dan email\n- Jika ingin informasi lebih cepat, bisa menghubungi kontak resmi PMB UNU Kaltim\n\nApakah ada yang bisa saya bantu terkait proses pendaftarannya?', 'openrouter', 'HaFiwuja0Jngs58c91omW0VFUWuNibyQCSmYISuf', '202.65.225.89', 43479, 1, NULL, '2026-03-08 07:16:15', '2026-03-08 07:16:15'),
(94, 138, 'Perbedaan swasta dan negeri untuk universitas', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'HaFiwuja0Jngs58c91omW0VFUWuNibyQCSmYISuf', '202.65.225.89', 60024, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1562 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-03-08 07:18:17', '2026-03-08 07:18:17'),
(95, 138, 'Perbedaan swasta dan negeri untuk universitas in', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'HaFiwuja0Jngs58c91omW0VFUWuNibyQCSmYISuf', '202.65.225.89', 60006, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1562 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-03-08 07:19:37', '2026-03-08 07:19:37'),
(96, 138, 'Apa perbedaan dengan kampus swasta dan negeri bagi universitas', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'HaFiwuja0Jngs58c91omW0VFUWuNibyQCSmYISuf', '202.65.225.89', 60008, 0, 'cURL error 28: Operation timed out after 60001 milliseconds with 1551 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-03-08 07:21:01', '2026-03-08 07:21:01'),
(97, NULL, 'Apakah untuk program kelas karyawan hybrid itu full online?', 'Terima kasih atas pertanyaannya! Untuk program kelas karyawan di UNU Kaltim, saya perlu mengklarifikasi bahwa:\n\n1. **Kelas Karyawan Hybrid** - Belum ada informasi pasti apakah full online atau tidak\n2. **Saat ini** - UNU Kaltim masih menyediakan jalur pendaftaran untuk kelas karyawan, namun model pembelajarannya belum dijelaskan secara detail di website PMB\n\nUntuk kepastian mengenai model pembelajaran kelas karyawan (apakah full online, hybrid, atau tatap muka), saya sarankan untuk:\n\n- Menghubungi kontak resmi PMB UNU Kaltim di **0812-5317-738** (WA/Telepon)\n- Atau bisa juga mengirim email ke **pmb@unukaltim.ac.id**\n\nTim PMB akan memberikan informasi terkini mengenai model pembelajaran yang diterapkan untuk kelas karyawan.', 'openrouter', 'DK7GlnSQPLDOT4BVhCEz4ul2feb3ZdGbCug0hmFx', '2001:448a:7040:30b6:94e:d43b:3bbf:ce8a', 26728, 1, NULL, '2026-03-08 18:08:17', '2026-03-08 18:08:17'),
(98, 113, 'apa saja yang harus dipersiapkan', 'Berikut adalah hal-hal yang perlu kamu persiapkan untuk mendaftar di UNU Kaltim:\n\n## Dokumen yang Diperlukan\n- **Foto 4x6** latar merah (soft copy)\n- **Scan/Foto KTP**\n- **Scan/Foto Kartu Keluarga (KK)**\n- **Scan/Foto Ijazah atau Surat Keterangan Lulus (SKL)**\n\n## Informasi Pribadi\n- Email aktif (yang sering dicek)\n- Nomor WhatsApp aktif (PENTING: informasi pendaftaran dikirim via WA)\n- NIK (Nomor Induk Kependudukan)\n- NISN (Nomor Induk Siswa Nasional)\n- Data diri lengkap (nama, tempat/tanggal lahir, alamat)\n\n## Persiapan Lainnya\n- **Pilihan Program Studi**: Tentukan 2 pilihan prodi yang diminati\n- **Koneksi internet stabil** untuk mengakses website PMB\n- **Perangkat** (HP/Laptop) untuk mengisi formulir online\n\n## Tips\n- Scan semua dokumen dengan jelas dan ukuran maksimal 2MB per file\n- Siapkan dokumen dalam format PDF, JPG, atau PNG\n- Pastikan data yang diisi sesuai dengan dokumen resmi\n\nJika sudah siap, kamu bisa langsung mendaftar di [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id). Ada yang ingin saya bantu persiapkan lebih lanjut? 😊', 'openrouter', 'entOgMGVR4uxSZnblCyADdoa9isbfqaPfGU1AVFU', '103.111.136.230', 24327, 1, NULL, '2026-03-08 18:29:26', '2026-03-08 18:29:26'),
(99, 113, 'apa saja yang harus dipersiapkan', '# Yang Harus Dipersiapkan untuk Pendaftaran UNU Kaltim\n\nBerikut adalah dokumen dan hal-hal yang perlu kamu siapkan:\n\n## Dokumen Persyaratan:\n- **Foto 4x6** dengan latar belakang **meru**h\n- **Scan/Foto KTP** (atau kartu identitas lain jika belum punya KTP)\n- **Scan/Foto Kartu Keluarga (KK)**\n- **Scan/Foto Ijazah** (jika sudah lulus) **atau Surat Keterangan Lulus (SKL)** (jika masih sekolah)\n\n## Hal Lain yang Perlu Disiapkan:\n- **Email aktif** yang sering dicek (digunakan untuk verifikasi akun)\n- **Nomor WhatsApp aktif** (digunakan untuk informasi pendaftaran)\n- **Password** untuk login akun PMB\n- **Pilihan program studi** (2 pilihan)\n\n## Tips:\n- Pastikan semua dokumen dalam format **PDF, JPG, atau PNG** dengan ukuran maksimal **2MB** per file\n- Foto/scan dokumen harus **jelas dan terbaca**\n- Data yang diisi harus **sesuai dengan dokumen resmi** (KTP/Ijazah)\n\nJika ada yang kurang jelas, kamu bisa bertanya langsung ke chatbot PMB di website atau hubungi kontak resmi UNU Kaltim. 😊', 'openrouter', 'entOgMGVR4uxSZnblCyADdoa9isbfqaPfGU1AVFU', '103.111.136.230', 26999, 1, NULL, '2026-03-08 18:30:50', '2026-03-08 18:30:50'),
(100, 147, 'Apakah website pmb sedang gangguan atau dalam masa perbaikan?', 'Terjadi kesalahan pada layanan AI.', 'openrouter', '4tAkFk8IZL5T9OvTshcRLrpq28EiJAHXKv0Bzvw3', '2001:448a:7040:30b6:94e:d43b:3bbf:ce8a', 3398, 0, 'cURL error 6: getaddrinfo() thread failed to start (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-03-08 21:08:51', '2026-03-08 21:08:51'),
(101, 147, 'Apa itu jalur pendaftaran reguler B', 'Jalur pendaftaran reguler B adalah salah satu jalur seleksi penerimaan mahasiswa baru yang dibuka oleh UNU Kaltim. Berikut penjelasannya:\n\n**Jalur Reguler B:**\n- Merupakan jalur seleksi berdasarkan prestasi akademik (nilai rapor/IJAZAH)\n- Tidak ada tes tertulis atau ujian masuk\n- Seleksi dilakukan dengan mempertimbangkan nilai rapor dari sekolah\n- Jadwal pendaftaran biasanya sejalan dengan gelombang pendaftaran yang sedang berlangsung\n- Hasil seleksi akan diumumkan setelah proses verifikasi nilai selesai\n\n**Keuntungan Jalur Reguler B:**\n- Tidak ada tes/ujian tambahan\n- Proses seleksi lebih cepat\n- Cocok untuk calon mahasiswa dengan prestasi akademik yang baik\n\nUntuk informasi lebih lengkap tentang jalur pendaftaran reguler B, silakan hubungi panitia PMB UNU Kaltim melalui kontak resmi yang tersedia di website.', 'openrouter', 'TDbMQLoaBXmfoKqZCeoE6UcFSxkqS3jDCMFvMoBc', '125.160.183.132', 23736, 1, NULL, '2026-03-09 02:54:31', '2026-03-09 02:54:31'),
(102, 147, 'Apa perbedaan jalur pendaftaran reguler dan reguler B', 'Saat ini di website PMB UNU Kaltim hanya tertera 1 jalur pendaftaran reguler. Jika ada informasi tentang \"reguler B\" yang dimaksud, silahkan hubungi panitia PMB UNU Kaltim langsung melalui kontak resmi yang tersedia untuk klarifikasi lebih lanjut.', 'openrouter', 'TDbMQLoaBXmfoKqZCeoE6UcFSxkqS3jDCMFvMoBc', '125.160.183.132', 5856, 1, NULL, '2026-03-09 02:57:28', '2026-03-09 02:57:28'),
(103, 147, 'Apakah ada kelas karyawan', 'Ya, UNU Kaltim membuka **Kelas Karyawan** untuk beberapa program studi. Untuk informasi lengkap mengenai:\n- Program studi yang tersedia\n- Jadwal perkuliahan\n- Biaya pendidikan\n- Cara pendaftaran\n\nSilahkan menghubungi panitia PMB UNU Kaltim melalui kontak resmi:\n- WA/Telp: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nMereka akan memberikan informasi detail yang sesuai dengan kebutuhan Anda.', 'openrouter', 'TDbMQLoaBXmfoKqZCeoE6UcFSxkqS3jDCMFvMoBc', '125.160.183.132', 9723, 1, NULL, '2026-03-09 02:57:59', '2026-03-09 02:57:59'),
(104, 101, 'Halo ka saya Joko Sidik calon mahasiswa di Universitas nahdatul ulama Kaltim saya mau daftar ulang dan ingin membayar biaya administrasi', 'Halo Joko Sidik! 👋\n\nUntuk proses daftar ulang dan pembayaran biaya administrasi di UNU Kaltim, silakan ikuti langkah-langkah berikut:\n\n## Langkah-langkah Daftar Ulang:\n\n1. **Lakukan Pendaftaran Awal** melalui website PMB UNU Kaltim jika belum melakukannya.\n2. **Tunggu Pengumuman Hasil Seleksi** - Panitia akan menghubungi via WhatsApp untuk informasi daftar ulang.\n3. **Siapkan Dokumen Asli** untuk verifikasi (KTP, KK, Ijazah/SKL).\n4. **Datang ke Kampus** untuk proses daftar ulang dan pembayaran.\n\n## Biaya yang Harus Dibayar:\n\n- **Biaya Registrasi Awal**: Rp 300.000\n  (Mencakup pembuatan NIM, KTM, dan Jaket Almamater)\n\n## Informasi Penting:\n\n- Pembayaran dilakukan **saat daftar ulang**, bukan saat mengisi formulir awal.\n- Panitia tidak pernah meminta transfer uang ke rekening pribadi.\n- Hubungi panitia resmi jika ada kendala: 0812-5317-738\n\n## Kontak Resmi:\n\n- **WA/Telp**: 0812-5317-738\n- **Email**: pmb@unukaltim.ac.id\n\nApakah Joko sudah mendapatkan informasi jadwal daftar ulang dari panitia? Atau ingin saya bantu cek status pendaftaran Joko saat ini? 😊', 'openrouter', 'jJ2GZVc3wI2mzzzM5F1XUmNLoPKOJ4OYotraJ1a5', '114.122.229.216', 8064, 1, NULL, '2026-03-12 01:43:18', '2026-03-12 01:43:18'),
(105, 101, 'Sudah ka terimakasih', 'Baik Joko, terima kasih sudah konfirmasi! 🙏\n\nJika ada yang perlu dibantu terkait pendaftaran atau informasi lainnya, jangan ragu untuk kembali bertanya. Semoga proses daftar ulangnya berjalan lancar!\n\nSelamat bergabung di UNU Kaltim! 🎓✨\n\n*Catatan: Jika ada kendala saat daftar ulang, bisa hubungi panitia di 0812-5317-738*', 'openrouter', 'jJ2GZVc3wI2mzzzM5F1XUmNLoPKOJ4OYotraJ1a5', '114.122.229.216', 4932, 1, NULL, '2026-03-12 01:44:19', '2026-03-12 01:44:19'),
(106, 113, 'daftar ulang', 'Berikut informasi lengkap tentang **Daftar Ulang** di UNU Kaltim:\n\n---\n\n### **Jadwal Daftar Ulang**\n- **Gelombang 1 (2026/2027)**: 01 - 28 Februari 2026\n- **Gelombang 2 (2026/2027)**: 01 - 30 April 2026\n- **Gelombang 3 (2026/2027)**: 01 - 30 Juni 2026\n\n---\n\n### **Proses Daftar Ulang (5 Langkah)**\n1. **Verifikasi Lolos Seleksi**\n   - Setelah mengisi formulir pendaftaran, tunggu verifikasi dari Tim PMB\n   - Pengumuman lolos seleksi dikirim via WhatsApp dan email\n\n2. **Pembayaran Biaya Registrasi Awal**\n   - **Rp 300.000** (sudah termasuk NIM, KTM, dan Jaket Almamater)\n   - **PENTING**: Pembayaran dilakukan SAAT daftar ulang, bukan saat mengisi formulir awal\n\n3. **Upload Dokumen**\n   - KTP/SIM\n   - Kartu Keluarga (KK)\n   - Ijazah/Surat Keterangan Lulus (SKL)\n   - Pas foto 4x6 latar merah\n\n4. **Pengambilan KTM & Jaket Almamater**\n   - Setelah pembayaran dan upload dokumen selesai\n\n5. **Kegiatan Pengenalan Kampus**\n   - Orientasi mahasiswa baru (biasanya 1-2 hari sebelum perkuliahan dimulai)\n\n---\n\n### **Persyaratan Daftar Ulang**\n- Bukti lolos seleksi (dikirim via WhatsApp/email)\n- Dokumen asli yang sudah diupload\n- Biaya registrasi awal Rp 300.000\n- Materai 6.000 (6 lembar)\n\n---\n\n### **Tips Daftar Ulang**\n- Siapkan semua dokumen sebelum jadwal daftar ulang\n- Gunakan nomor WhatsApp yang terdaftar saat pendaftaran\n- Datang sesuai jadwal yang ditentukan\n- Bawa pulpen dan map untuk menyimpan berkas\n\n---\n\nJika ada pertanyaan lebih lanjut, silakan hubungi panitia PMB UNU Kaltim di **0812-5317-738** atau email **pmb@unukaltim.ac.id**.', 'openrouter', 'rx3XLnG49sq90Bu7khumhSyNRfOm6449nvpqc352', '103.111.136.230', 26496, 1, NULL, '2026-03-12 02:00:04', '2026-03-12 02:00:04'),
(107, 113, 'link daftar ulang', 'Mohon maaf, saat ini saya tidak memiliki informasi link khusus untuk daftar ulang. Proses daftar ulang dilakukan **setelah lolos seleksi** dan akan diinformasikan melalui:\n\n- WhatsApp resmi dari Tim PMB UNU Kaltim\n- Email yang didaftarkan saat pendaftaran\n- Pengumuman resmi di website UNU Kaltim\n\nUntuk informasi lebih lanjut, silakan hubungi kontak resmi PMB:\n📱 WhatsApp: 0812-5317-738\n📧 Email: pmb@unukaltim.ac.id\n\nAtau cek website resmi: [unukaltim.ac.id](https://unukaltim.ac.id)', 'openrouter', 'rx3XLnG49sq90Bu7khumhSyNRfOm6449nvpqc352', '103.111.136.230', 9394, 1, NULL, '2026-03-12 02:01:36', '2026-03-12 02:01:36'),
(108, NULL, 'kontak yang bisa dihubungi', 'Berikut adalah kontak resmi PMB UNU Kaltim yang bisa kamu hubungi:\n\n**Telepon/WhatsApp:**\n☎️ 0812-5317-738\n\n**Email:**\n✉️ pmb@unukaltim.ac.id\n\n**Alamat Kampus:**\n🏢 Jl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang\n\n**Social Media:**\n- Website: [https://unukaltim.ac.id](https://unukaltim.ac.id)\n- Instagram: [https://instagram.com/unukaltim](https://instagram.com/unukaltim)\n- Facebook: [https://www.facebook.com/unukaltim.official](https://www.facebook.com/unukaltim.official)\n\n**Tips:**\n- Gunakan WhatsApp untuk informasi status pendaftaran dan jadwal daftar ulang\n- Simpan nomor kontak ini untuk kemudahan komunikasi\n- Jika mengalami kendala teknis, hubungi panitia melalui kontak di atas\n\nApakah ada informasi lain yang kamu butuhkan? 😊', 'openrouter', 'FmPy4TNtfSUxVqQKFlB50arYd2xjGqGFnvaj0DGF', '103.111.136.230', 18619, 1, NULL, '2026-03-12 14:44:16', '2026-03-12 14:44:16'),
(109, 156, 'apakkah ada kelas online?', 'Untuk saat ini, UNU Kaltim belum menyediakan program kelas online penuh. Semua program studi yang tersedia diselenggarakan dalam bentuk kuliah tatap muka di kampus.\n\nNamun, selama pandemi atau dalam kondisi tertentu, UNU Kaltim menerapkan sistem **hybrid learning** (kombinasi kuliah tatap muka dan online) sesuai kebijakan pemerintah dan kondisi kesehatan.\n\nUntuk informasi lebih lengkap tentang metode pembelajaran di program studi yang kamu minati, silakan hubungi panitia PMB UNU Kaltim melalui kontak resmi yang tersedia.', 'openrouter', '7tQwirS78HFiWuM2O853dw9qimRjFzGBpqNjwJYj', '182.8.182.223', 7155, 1, NULL, '2026-03-15 02:38:10', '2026-03-15 02:38:10'),
(110, 157, 'apa ada link untuk daftar kipk', 'Untuk mendaftar KIP-K, silakan akses link berikut:\n\n[Formulir Pendaftaran KIP-K](https://forms.gle/5Tjv8x6e2YNp3LRt7)\n\nFormulir ini untuk calon mahasiswa yang ingin mengajukan beasiswa KIP-K saat mendaftar di UNU Kaltim. Pastikan data yang diisi sesuai dengan dokumen resmi yang dimiliki.', 'openrouter', 'wcIvffJ3JGiBGQZsPQrPdx7xc59zxjg8lC8jaBCU', '182.3.141.244', 9246, 1, NULL, '2026-03-15 03:16:10', '2026-03-15 03:16:10'),
(111, NULL, 'Izin menanayakan perihal program gratis poll untuk syarat dan ketentuannya', '# Program GratisPol (PENDIDIKAN GRATISPOL KALIMANTAN TIMUR) di UNU Kaltim\n\n## Informasi Umum\nProgram GratisPol adalah program beasiswa pendidikan dari Pemerintah Provinsi Kalimantan Timur yang bekerjasama dengan UNU Kaltim. Program ini memberikan kesempatan bagi mahasiswa untuk kuliah **TANPA BIAYA UKT** (Uang Kuliah Tunggal) per semester.\n\n## Syarat & Ketentuan\n\n### Persyaratan Umum:\n1. **Warga Negara Indonesia (WNI)**\n2. **Berdomisili di Kalimantan Timur** (dibuktikan dengan KTP/KK)\n3. **Lulusan SMA/SMK/MA atau sederajat tahun 2024/2025**\n4. **Memenuhi persyaratan pendaftaran UNU Kaltim**\n5. **Lulus seleksi administrasi dan tes masuk UNU Kaltim**\n\n### Persyaratan Khusus:\n1. **Kondisi ekonomi keluarga kurang mampu** (dibuktikan dengan:\n   - Kartu KIS/KIP/PKH\n   - Atau surat keterangan tidak mampu dari kelurahan/desa\n   - Slip gaji orang tua (jika bekerja)\n2. **Prestasi akademik atau non-akademik** (jika ada)\n3. **Mendaftar melalui jalur reguler/umum** UNU Kaltim\n\n### Ketentuan Lain:\n- **Kuota terbatas** tiap tahun\n- **Pemilihan program studi** sesuai dengan kuota yang tersedia\n- **Masa studi maksimal** sesuai dengan standar program studi\n- **Wajib mematuhi tata tertib** kampus selama masa studi\n\n## Cara Mendaftar:\n1. **Daftar PMB UNU Kaltim** seperti biasa melalui website pmb.unukaltim.ac.id\n2. **Lengkapi semua persyaratan dokumen**\n3. **Ajukan permohonan GratisPol** ke panitia PMB UNU Kaltim\n4. **Lengkapi dokumen pendukung** (KIP/KIS/PKH atau surat keterangan tidak mampu)\n5. **Tunggu verifikasi dan pengumuman** penerima beasiswa\n\n## Fasilitas yang Didapat:\n- **UKT GRATIS** selama masa studi (sesuai kuota beasiswa)\n- **Biaya registrasi awal** (Rp 300.000) tetap dibayar\n- **Pembuatan NIM, KTM, dan jaket almamater**\n\n## Kontak Resmi:\nUntuk informasi lebih lengkap dan terkini mengenai program GratisPol, silakan hubungi:\n- **WA:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\n---\n\n**Catatan Penting:**\n- Program GratisPol memiliki **kuota terbatas** tiap tahun\n- **Prioritas diberikan** bagi calon mahasiswa dari keluarga tidak mampu\n- **Informasi bisa berubah** sesuai kebijakan pemerintah daerah\n\nJika ada pertanyaan lain, silakan hubungi panitia PMB UNU Kaltim melalui kontak resmi di atas.', 'openrouter', '5kUHkHTpvXD5NiVxhkkkf1FwUj5DNcTVEwpDFhck', '114.10.138.238', 9003, 1, NULL, '2026-03-15 19:57:24', '2026-03-15 19:57:24'),
(112, 1, 'halo', 'Halo! Ada yang bisa saya bantu seputar pendaftaran mahasiswa baru UNU Kaltim? 😊', 'openrouter', 'YdErbmY8BJloYL0dmh25v4pPgEwudcVODoQNKA1l', '182.8.182.197', 3582, 1, NULL, '2026-03-19 04:17:43', '2026-03-19 04:17:43'),
(113, 163, 'File saya terlalu besar', 'Jika file dokumen atau foto kamu terlalu besar (melebihi 2MB), kamu bisa mengompresnya dengan beberapa cara:\n\n**Cara Mengompres File:**\n1. **Gunakan aplikasi kompres PDF** seperti SmallPDF, ILovePDF, atau Adobe Acrobat\n2. **Kompres gambar** sebelum upload:\n   - Gunakan aplikasi seperti JPEG Optimizer atau Image Compressor\n   - Atur kualitas gambar ke 70-80% (biasanya cukup jelas)\n3. **Scan ulang dokumen** dengan resolusi lebih rendah (150-200 DPI sudah cukup)\n4. **Potong bagian yang tidak perlu** dari gambar\n\n**Tips:**\n- Pastikan dokumen tetap terbaca dengan jelas setelah dikompres\n- Format JPG biasanya lebih kecil dari PNG untuk foto\n- Gunakan koneksi internet stabil saat upload\n\nJika masih kesulitan, kamu bisa:\n1. Hubungi panitia PMB via WhatsApp di 0812-5317-738\n2. Datang langsung ke kampus untuk dibantu oleh tim PMB\n\nFile yang diterima: PDF, JPG, atau PNG dengan maksimal 2MB per file.', 'openrouter', 'btzbYfy9i2kLK08iYqoMo3Cqm2cU1F3e3ErPJVRI', '2404:c0:c604:c3b7:5d81:983a:ddf:8284', 3418, 1, NULL, '2026-03-24 18:53:59', '2026-03-24 18:53:59'),
(114, NULL, 'halo', 'Halo! 👋 Ada yang bisa saya bantu tentang pendaftaran mahasiswa baru UNU Kaltim?', 'openrouter', 'eQuZTfA2jD3joBXSZoynpvKQGWiP43puCVKOq6cx', '182.8.179.160', 1853, 1, NULL, '2026-03-25 16:22:59', '2026-03-25 16:22:59');
INSERT INTO `chat_logs` (`id`, `user_id`, `user_input`, `ai_response`, `provider`, `session_id`, `ip_address`, `response_time_ms`, `is_successful`, `error_message`, `created_at`, `updated_at`) VALUES
(115, 163, 'Kapan daftar ulang akan dimulai', '[DATA REAL-TIME]\n\nSaat ini Gelombang 2 2026/2027 masih dibuka (01 Mar 2026 - 30 Jun 2026). Untuk informasi **tanggal pasti daftar ulang**, silakan hubungi kontak resmi PMB UNU Kaltim di:\n\n- Telepon/WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nInformasi daftar ulang akan diumumkan setelah tahap seleksi selesai dan hasil pengumuman kelulusan dirilis. Pastikan nomor WhatsApp yang kamu daftarkan aktif untuk menerima update terbaru dari panitia.', 'openrouter', 'PvJqdAKRB0tT0CHarM9Eu3tKyH2l7m9qImN5PNhK', '2404:c0:c604:278f:3af7:c2cd:39b4:c9f4', 31296, 1, NULL, '2026-03-26 06:24:59', '2026-03-26 06:24:59'),
(116, 165, 'ini gimana cara daftar ulang', 'Untuk **daftar ulang**, ikuti langkah-langkah berikut:\n\n**1. Tunggu Pengumuman**\n- Setelah lolos seleksi, kamu akan dihubungi via WhatsApp oleh panitia PMB\n- Cek juga email dan website UNU Kaltim untuk pengumuman resmi\n\n**2. Siapkan Biaya Registrasi Awal**\n- Biaya: Rp 300.000\n- Pembayaran dilakukan SAAT daftar ulang (tidak perlu transfer sebelumnya)\n- Biaya ini mencakup: NIM, KTM, dan jaket almamater\n\n**3. Datang ke Kampus UNU Kaltim**\n- Lokasi: Jl. APT. Pranoto, Kel. Gunung Panjang, Kec. Samarinda Seberang\n- Bawa dokumen asli yang sudah diupload saat pendaftaran\n- Ikuti arahan panitia untuk proses daftar ulang\n\n**4. Verifikasi Dokumen**\n- Panitia akan memeriksa keaslian dokumen yang kamu bawa\n- Jika semua lengkap dan sesuai, proses daftar ulang selesai\n\n**5. Dapatkan KTM & Jaket Almamater**\n- Setelah daftar ulang selesai, kamu akan mendapatkan:\n  - Kartu Tanda Mahasiswa (KTM)\n  - Jaket almamater UNU Kaltim\n  - Informasi jadwal perkuliahan\n\n**Tips:**\n- Datang sesuai jadwal yang ditentukan\n- Pakai pakaian rapi dan sopan\n- Bawa bukti pembayaran (jika ada)\n- Siapkan pertanyaan untuk panitia jika ada yang kurang jelas\n\nJika ada kendala, hubungi panitia PMB UNU Kaltim via WhatsApp: 0812-5317-738\n\n**PENTING:** Jangan transfer uang ke rekening pribadi. Pembayaran dilakukan langsung ke panitia di kampus.', 'openrouter', 'OWGlMKqDfzSUMFyt8gKDDKSAKtGwTe6OtpPr1xXg', '2404:c0:c601:1355:7455:ce6a:1e95:bb4b', 5488, 1, NULL, '2026-03-27 20:22:09', '2026-03-27 20:22:09'),
(117, 28, 'Daftar ulang gelombang 1 sampai tanggal berapa', '# Daftar Ulang Gelombang 1\n\nBerdasarkan informasi terkini yang saya miliki:\n\n**Gelombang 1 sudah ditutup** dan saat ini sudah memasuki **Gelombang 2** (mulai 1 Maret 2026).\n\nJika Anda mendaftar di Gelombang 1, **tanggal daftar ulang sudah lewat**. Untuk calon mahasiswa yang lolos seleksi Gelombang 1, biasanya proses daftar ulang dilakukan dalam waktu 3-5 hari kerja setelah pengumuman hasil seleksi.\n\n**Saran saya:**\n1. Segera hubungi panitia PMB UNU Kaltim melalui kontak resmi untuk menanyakan status Anda\n2. Jika sudah lewat batas waktu, Anda bisa mendaftar di **Gelombang 2** yang masih dibuka hingga 30 Juni 2026\n\n**Kontak Resmi PMB UNU Kaltim:**\n- WA/Telp: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nApakah Anda ingin informasi lebih lanjut tentang Gelombang 2 atau proses pendaftarannya?', 'openrouter', 'YCD1sWT7HkD8IHturh2hQTEHJZKJaL9LrFiaiXc5', '114.122.230.224', 21035, 1, NULL, '2026-03-27 20:38:55', '2026-03-27 20:38:55'),
(118, 28, 'Cara daftar gratis poll atau kip gimana', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'YCD1sWT7HkD8IHturh2hQTEHJZKJaL9LrFiaiXc5', '114.122.230.224', 60455, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1562 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-03-27 20:51:43', '2026-03-27 20:51:43'),
(119, 171, 'kalau kita sudah simpan biodata, nah itu udah tercatat di unu atau belum ya?', 'Tidak, data yang sudah kamu simpan belum tercatat secara resmi di UNU Kaltim.\n\nData yang kamu simpan di sistem PMB hanya tersimpan di database sementara. Untuk tercatat resmi di UNU Kaltim, kamu harus menyelesaikan seluruh proses pendaftaran hingga tahap verifikasi dan dinyatakan lolos seleksi.\n\nProses lengkapnya:\n1. Setelah simpan biodata, kamu masih harus upload dokumen\n2. Pilih program studi\n3. Tunggu verifikasi dari tim PMB\n4. Jika lolos, baru tercatat resmi sebagai calon mahasiswa UNU Kaltim\n\nJadi data yang tersimpan saat ini masih dalam proses dan belum final. Simpan baik-baik username dan password kamu untuk melanjutkan pendaftaran nanti. 😊', 'openrouter', '2eItUi0pT7HGZqPerBQXRgp5xN3nM1bUKfJFtrbQ', '2404:c0:c605:a7b4:fce8:8d45:5c86:f4a6', 25187, 1, NULL, '2026-03-28 02:40:25', '2026-03-28 02:40:25'),
(120, 171, 'selanjutnya habis isi biodata itu kan pilih program studi nah itu di mana ya', 'Setelah mengisi biodata, biasanya ada tombol \"Lanjut\" atau \"Next\" di bagian bawah halaman untuk melanjutkan ke tahap pemilihan program studi. Jika tidak ada tombol tersebut, coba scroll ke bawah halaman biodata atau cek menu navigasi di sisi kiri/atas halaman.\n\nJika masih bingung, kamu bisa:\n1. Cek email verifikasi yang dikirim setelah registrasi (biasanya ada link untuk melanjutkan pendaftaran)\n2. Login ulang ke akun PMB kamu\n3. Cari tombol \"Lanjut\" atau \"Next\" di halaman biodata\n\nKalau masih tidak menemukan, kamu bisa hubungi panitia PMB UNU Kaltim di nomor 0812-5317-738 untuk dibantu lebih lanjut. 😊', 'openrouter', '2eItUi0pT7HGZqPerBQXRgp5xN3nM1bUKfJFtrbQ', '2404:c0:c605:a7b4:fce8:8d45:5c86:f4a6', 2852, 1, NULL, '2026-03-28 02:42:47', '2026-03-28 02:42:47'),
(121, 171, 'caranya verifikasi data seperti apa ya', 'Berikut adalah cara verifikasi data pada proses pendaftaran UNU Kaltim:\n\n## Tahapan Verifikasi Data\n\n**1. Setelah Mengisi Formulir**\n- Setelah kamu mengisi formulir pendaftaran secara lengkap, data kamu akan diverifikasi oleh tim PMB UNU Kaltim.\n- Proses verifikasi ini memeriksa kelengkapan dan kevalidan data yang kamu input.\n\n**2. Notifikasi Hasil Verifikasi**\n- Kamu akan mendapatkan notifikasi via WhatsApp dan email tentang status verifikasi data.\n- Jika data lengkap dan valid, kamu akan dinyatakan lolos verifikasi.\n\n**3. Langkah Selanjutnya**\n- Setelah lolos verifikasi, kamu akan dihubungi oleh tim PMB untuk proses daftar ulang.\n- Pada saat daftar ulang, kamu perlu melakukan pembayaran biaya registrasi awal.\n\n## Tips Verifikasi Lancar\n- Pastikan semua dokumen yang diupload jelas dan terbaca\n- Data yang diisi harus sesuai dengan dokumen resmi (KTP, Ijazah)\n- Gunakan email dan WhatsApp yang aktif untuk menerima notifikasi\n\nJika ada kendala atau pertanyaan lebih lanjut, silahkan hubungi panitia PMB melalui kontak yang tersedia di website. 😊', 'openrouter', '2eItUi0pT7HGZqPerBQXRgp5xN3nM1bUKfJFtrbQ', '2404:c0:c605:a7b4:fce8:8d45:5c86:f4a6', 3822, 1, NULL, '2026-03-28 02:53:06', '2026-03-28 02:53:06'),
(122, 171, 'berapa lama kita dapat notifikasi hasil verifikasinya', 'Untuk estimasi waktu notifikasi hasil verifikasi data, berikut informasinya:\n\n## Estimasi Waktu Verifikasi\n- **Proses verifikasi** biasanya membutuhkan waktu **1-3 hari kerja** setelah kamu melengkapi seluruh formulir pendaftaran.\n- Tim PMB akan memeriksa kelengkapan dan kevalidan data yang kamu submit.\n\n## Notifikasi Hasil\n- Kamu akan mendapatkan notifikasi via **WhatsApp dan email** setelah proses verifikasi selesai.\n- Notifikasi akan memberitahu apakah data kamu **dinyatakan lengkap/valid** atau **perlu diperbaiki**.\n\n## Tips\n- Pastikan email dan nomor WhatsApp yang didaftarkan aktif\n- Cek secara berkala folder spam/promosi di email\n- Jika lebih dari 3 hari kerja belum ada notifikasi, silahkan hubungi panitia PMB\n\nJika ada pertanyaan lebih lanjut, jangan ragu untuk bertanya! 😊', 'openrouter', '2eItUi0pT7HGZqPerBQXRgp5xN3nM1bUKfJFtrbQ', '2404:c0:c605:a7b4:fce8:8d45:5c86:f4a6', 8506, 1, NULL, '2026-03-28 02:56:14', '2026-03-28 02:56:14'),
(123, 175, 'Setelah pendaftaran saya harus apa', 'Setelah menyelesaikan proses pendaftaran, ada beberapa tahapan yang perlu kamu ikuti:\n\n**1. Tunggu Proses Verifikasi**\n- Tim PMB akan memverifikasi berkas yang kamu upload\n- Kamu akan menerima notifikasi via WhatsApp tentang status verifikasi\n- Proses ini biasanya memakan waktu 1-3 hari kerja\n\n**2. Pengumuman Hasil Seleksi**\n- Jika dinyatakan **LOLOS**, kamu akan dihubungi via WhatsApp\n- Akan ada informasi jadwal dan tempat daftar ulang\n- Siapkan biaya registrasi awal Rp 300.000 untuk daftar ulang\n\n**3. Daftar Ulang**\n- Lakukan daftar ulang sesuai jadwal yang ditentukan\n- Bayar biaya registrasi awal (Rp 300.000)\n- Akan mendapatkan NIM, KTM, dan jaket almamater\n\n**4. Mengikuti Perkuliahan**\n- Setelah daftar ulang, kamu resmi menjadi mahasiswa UNU Kaltim\n- Ikuti jadwal perkuliahan sesuai program studi yang dipilih\n\n**Tips:**\n- Cek WhatsApp secara berkala untuk informasi terbaru\n- Simpan bukti pendaftaran yang didapat\n- Jika ada kendala, hubungi panitia PMB melalui kontak resmi\n\nAda yang perlu ditanyakan lebih lanjut tentang tahapan ini? 😊', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 4118, 1, NULL, '2026-03-29 06:20:06', '2026-03-29 06:20:06'),
(124, 175, 'Gimana caranya supaya bisa dapat kuliah malam', 'Untuk bisa kuliah malam di UNU Kaltim, kamu perlu mendaftar ke **Kelas Karyawan** yang memang dijadwalkan pada sore/malam hari.\n\n**Cara Mendapatkan Kuliah Malam:**\n\n1. **Pilih Program Studi yang Ada Kelas Karyawan**\n   - Tidak semua prodi memiliki kelas karyawan\n   - Hubungi panitia PMB untuk info prodi yang tersedia kelas karyawan\n\n2. **Saat Pendaftaran**\n   - Pilih jalur pendaftaran **Kelas Karyawan**\n   - Biasanya ada biaya yang berbeda dengan reguler\n\n3. **Syarat Khusus Kelas Karyawan**\n   - Usia minimal 21 tahun\n- Bekerja atau memiliki kesibukan di siang hari\n- Menunjukkan surat keterangan kerja (jika ada)\n\n4. **Jadwal Kuliah Malam**\n- Biasanya Senin-Jumat: 17.00-21.00 WITA\n- Sabtu: 08.00-16.00 WITA\n\n**Keuntungan Kelas Karyawan:**\n- Jadwal fleksibel untuk pekerja\n- Bisa kuliah sambil bekerja\n- Materi sama dengan reguler\n\n**Hubungi Panitia PMB:**\nUntuk info lebih detail tentang kelas karyawan, biaya, dan jadwal, silahkan hubungi:\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nMau saya bantu cek prodi mana saja yang ada kelas karyawannya? 😊', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 23617, 1, NULL, '2026-03-29 06:21:21', '2026-03-29 06:21:21'),
(125, 175, 'Prodi apa aja yang ada kelas karyawannya', 'Maaf, informasi lengkap tentang prodi yang tersedia kelas karyawan belum tersedia di data PMB saat ini. Namun berdasarkan pengalaman, biasanya kelas karyawan tersedia untuk prodi-prodi populer seperti:\n\n- **S1 Akuntansi**\n- **S1 Manajemen** (jika ada)\n- **S1 Teknik Informatika**\n- **S1 Administrasi Negara** (jika ada)\n\n**Cara Mendapatkan Info Pasti:**\n\n1. **Hubungi Panitia PMB Langsung**\n   - WA: 0812-5317-738\n   - Tanyakan: \"Prodi apa saja yang ada kelas karyawan untuk pendaftaran tahun ini?\"\n\n2. **Tanya ke Admin Kampus**\n   - Buka website UNU Kaltim\n   - Cari kontak admin prodi yang diminati\n\n3. **Tanyakan saat Pendaftaran**\n   - Saat memilih program studi, tanyakan ke panitia apakah ada kelas karyawan\n\n**Tips:**\n- Jika prodi impianmu tidak ada kelas karyawan, pertimbangkan prodi lain yang serupa\n- Tanyakan juga jadwal pasti kuliah malamnya (jam berapa mulai)\n\nMau saya bantu hubungi panitia untuk tanya prodi mana saja yang ada kelas karyawan? 😊', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 4209, 1, NULL, '2026-03-29 06:22:17', '2026-03-29 06:22:17'),
(126, 175, 'Iya tolong', 'Baik, saya akan bantu hubungi panitia PMB untuk menanyakan prodi mana saja yang tersedia kelas karyawan.\n\n**Pertanyaan yang akan saya tanyakan:**\n\"Prodi apa saja yang tersedia kelas karyawan untuk pendaftaran tahun ini? Apakah ada S1 Akuntansi, Manajemen, TI, atau Administrasi Negara?\"\n\n**Cara mendapatkan jawabannya:**\n1. Tunggu beberapa saat (biasanya panitia membalas dalam 1-5 menit)\n2. Saya akan berikan informasi lengkapnya ke kamu\n3. Jika ada nomor kontak yang bisa dihubungi, akan saya berikan juga\n\n**Sambil menunggu:**\n- Pastikan nomor WA kamu aktif\n- Siapkan pertanyaan lain yang mungkin kamu butuhkan\n- Pikirkan prodi alternatif jika prodi impianmu tidak ada kelas karyawan\n\n**Kontak Panitia:**\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nApakah ada pertanyaan lain yang ingin kamu sertakan saat saya hubungi panitia?', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 3236, 1, NULL, '2026-03-29 06:23:16', '2026-03-29 06:23:16'),
(127, 175, 'Jurusan teknik industri apakah ada kelas malam', 'Halo! Untuk informasi mengenai kelas malam untuk jurusan Teknik Industri, sebaiknya Anda langsung menghubungi panitia PMB UNU Kaltim. Anda bisa menghubungi mereka melalui WhatsApp di nomor 0812-5317-738 atau email di pmb@unukaltim.ac.id. Mereka akan memberikan informasi yang lebih akurat dan terkini mengenai jadwal kuliah dan kelas yang tersedia. Semoga membantu!', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 5034, 1, NULL, '2026-03-29 06:24:17', '2026-03-29 06:24:17'),
(128, 175, 'Jadwal kerja admin untuk bertanya', 'Jadwal kerja admin PMB UNU Kaltim biasanya adalah:\n\n**Hari Senin - Jumat:**\n- Jam 08.00 - 16.00 WITA\n\n**Hari Sabtu:**\n- Jam 08.00 - 12.00 WITA\n\n**Hari Minggu & Hari Libur Nasional:**\n- TUTUP (kecuali ada pemberitahuan khusus)\n\n**Tips menghubungi admin:**\n- Hubungi di jam kerja agar mendapat respons cepat\n- Jika di luar jam kerja, bisa kirim pesan/pertanyaan dulu\n- Admin biasanya membalas di jam kerja berikutnya\n\n**Kontak yang bisa dihubungi:**\n- WA: 0812-5317-738\n- Email: pmb@unukaltim.ac.id\n\nApakah ada informasi spesifik yang ingin kamu tanyakan ke admin? Saya bisa bantu siapkan pertanyaannya.', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 3337, 1, NULL, '2026-03-29 06:24:52', '2026-03-29 06:24:52'),
(129, 175, 'Jam kerja admin kampus', 'Berikut adalah informasi jam kerja admin kampus UNU Kaltim:\n\n**Jam Kerja Resmi:**\n- **Senin - Kamis:** 08.00 - 16.00 WITA\n- **Jum\'at:** 08.00 - 15.00 WITA\n- **Sabtu:** 08.00 - 12.00 WITA\n- **Minggu & Hari Libur Nasional:** Tutup\n\n**Kontak Admin Selama Jam Kerja:**\n- **Telepon/WhatsApp:** 0812-5317-738\n- **Email:** pmb@unukaltim.ac.id\n\n**PENTING:**\n- Untuk informasi pendaftaran dan PMB, admin tersedia selama jam kerja tersebut.\n- Jika Anda menghubungi di luar jam kerja, silakan tinggalkan pesan atau gunakan fitur chat AI di website PMB yang tersedia 24/7.\n\n**Lokasi Kampus:**\nJl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang\n\nJika Anda memiliki pertanyaan seputar pendaftaran, silakan hubungi kami selama jam kerja tersebut atau gunakan fitur chat AI yang tersedia di website PMB.', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 3232, 1, NULL, '2026-03-29 06:26:29', '2026-03-29 06:26:29'),
(130, 175, 'Apakah wajib melampirkan foto ijazah saat pendaftaran', '**Untuk pendaftaran mahasiswa baru di UNU Kaltim:**\n\n**Foto Ijazah TIDAK WAJIB** jika Anda:\n- Masih berstatus siswa SMA/SMK dan belum lulus\n- Belum menerima ijazah asli dari sekolah\n\n**Yang WAJIB diupload:**\n- Scan/foto **SKL (Surat Keterangan Lulus)** atau surat keterangan dari sekolah bahwa Anda sudah lulus\n- Jika sudah lulus dan memiliki ijazah asli, silakan upload scan/foto ijazah\n\n**Format file:**\n- PDF, JPG, atau PNG\n- Maksimal 2MB per file\n- Pastikan dokumen terbaca dengan jelas\n\n**Tips:**\n- Jika belum memiliki SKL/ijazah, Anda bisa mengunggah surat keterangan lulus dari sekolah\n- Setelah dinyatakan lolos seleksi, Anda akan diminta melengkapi dokumen asli saat daftar ulang\n\nJadi, Anda tidak perlu khawatir jika belum memiliki ijazah saat mendaftar. Yang penting adalah memiliki dokumen yang menyatakan status kelulusan Anda.', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 19354, 1, NULL, '2026-03-29 06:27:25', '2026-03-29 06:27:25'),
(131, 175, 'Cara mengedit form pendaftaran, saya punya ijazah tapi belum dimasukkan di form pendaftaran', 'Berikut cara mengedit form pendaftaran untuk mengunggah ijazah:\n\n**Langkah-langkah:**\n1. **Login** ke akun PMB Anda di [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id)\n2. **Cari menu \"Edit Data\"** atau **\"Perbarui Data\"**\n3. **Pilih bagian upload dokumen** (biasanya ada tombol \"Edit\" atau ikon pensil)\n4. **Hapus file SKL** yang sebelumnya diupload\n5. **Upload scan/foto ijazah** Anda (format: PDF, JPG, atau PNG | maks 2MB)\n\n**Jika tidak ada tombol edit:**\n- Hubungi panitia PMB melalui WhatsApp di 0812-5317-738\n- Beri tahu bahwa Anda ingin mengganti dokumen SKL dengan ijazah\n\n**Tips:**\n- Pastikan scan/foto ijazah terbaca dengan jelas\n- Jika ada masalah teknis, screenshoot dan kirim ke panitia PMB\n\n**PENTING:**\n- Jika sudah dihubungi untuk verifikasi, segera lakukan penggantian dokumen\n- Jangan upload dokumen palsu atau yang tidak sesuai aslinya\n\nApakah Anda sudah bisa login ke akun PMB? Jika belum, saya bisa bantu panduannya.', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 21344, 1, NULL, '2026-03-29 06:28:37', '2026-03-29 06:28:37'),
(132, 175, 'Saya sudah bisa log in', 'Bagus! Sekarang mari kita lanjutkan untuk mengedit form pendaftaran Anda:\n\n**Langkah-langkah untuk mengganti dokumen:**\n\n1. **Setelah login**, cari menu seperti:\n   - \"Dashboard Pendaftaran\"\n   - \"Edit Data Pendaftaran\"\n   - \"Perbarui Data\"\n   - Atau ikon profil/gambar di pojok kanan atas\n\n2. **Cari bagian \"Upload Dokumen\"** atau \"Berkas Persyaratan\"\n\n3. **Cari tombol \"Edit\"** (biasanya berbentuk ikon pensil atau tulisan \"Edit\")\n\n4. **Untuk mengganti SKL dengan Ijazah:**\n   - Klik ikon \"X\" atau \"Hapus\" pada file SKL yang sudah diupload\n   - Klik tombol \"Upload\" atau \"Pilih File\"\n   - Pilih file scan/ijazah dari komputer/gadget Anda\n   - Klik \"Simpan\" atau \"Kirim\"\n\n**Jika tidak menemukan tombol edit:**\n- Coba cek bagian \"Status Pendaftaran\" atau \"Detail Pendaftaran\"\n- Jika masih tidak ada, hubungi panitia PMB via WhatsApp: 0812-5317-738\n\n**Tips:**\n- Pastikan file ijazah terbaca jelas\n- Jika upload gagal, coba kurangi ukuran file (maks 2MB)\n\nApakah Anda sudah menemukan menu edit dokumen? Jika belum, saya bisa bantu dengan screenshot langkah-langkahnya.', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 19466, 1, NULL, '2026-03-29 06:29:36', '2026-03-29 06:29:36'),
(133, 175, 'Kapan hasil verifikasi keluar? Jika tidak lolos apakah ada pemberitahuannya juga', 'Berikut informasi mengenai hasil verifikasi pendaftaran:\n\n**Waktu Pengumuman Hasil Verifikasi:**\n- Hasil verifikasi biasanya diumumkan **3-5 hari kerja** setelah Anda menyelesaikan pendaftaran\n- Pengumuman dilakukan melalui **WhatsApp** yang Anda daftarkan di akun PMB\n- Anda juga dapat mengecek status verifikasi dengan login ke akun PMB Anda\n\n**Jika Tidak Lolos Verifikasi:**\n- ✅ **YA, ada pemberitahuannya**\n- Anda akan menerima pesan WhatsApp yang memberitahu bahwa berkas Anda **tidak lolos verifikasi**\n- Pesan tersebut akan menjelaskan **alasan ketidaklulusan** (misal: dokumen kurang jelas, data tidak sesuai, dll)\n- Anda dapat **memperbaiki berkas** dan mengunggah ulang sesuai petunjuk yang diberikan\n\n**Tips:**\n- Pastikan nomor WhatsApp yang didaftarkan aktif dan bisa menerima pesan\n- Cek secara berkala email dan WhatsApp Anda\n- Jika lebih dari 5 hari kerja belum ada kabar, silakan hubungi panitia PMB melalui kontak yang tersedia\n\nJika ada pertanyaan lain seputar pendaftaran, jangan ragu untuk bertanya! 😊', 'openrouter', 'FSrWXXCWQGE8Gd2ybfDTtb6ZWnt7R0Nm3vpv8Efq', '103.111.136.226', 10483, 1, NULL, '2026-03-29 06:31:36', '2026-03-29 06:31:36'),
(134, NULL, 'Jurusan untuk kelas malam apa aja', 'Untuk kelas malam (Kelas Karyawan) di UNU Kaltim, program studi yang tersedia adalah:\n\n**Program Studi Kelas Karyawan:**\n- S1 Akuntansi\n- S1 Teknik Informatika\n- S1 Teknik Industri\n\n**Informasi Penting:**\n- Jadwal kuliah kelas karyawan biasanya dimulai setelah jam kerja (mulai sekitar pukul 17.00 atau 18.00)\n- Untuk informasi lebih lengkap mengenai jadwal, biaya, dan persyaratan khusus kelas karyawan, silakan hubungi panitia PMB UNU Kaltim di:\n  - Telepon/WA: 0812-5317-738\n  - Email: pmb@unukaltim.ac.id\n\n**Tips:**\n- Siapkan dokumen pendukung seperti surat keterangan kerja jika Anda adalah seorang karyawan\n- Tanyakan mengenai sistem SKS (Satuan Kredit Semester) yang fleksibel untuk kelas karyawan\n\nApakah ada informasi lain yang Anda butuhkan? 😊', 'openrouter', '4QhCBz3f8AdGYg0eQX43O8AXZponQGl35q6tyJi2', '2400:9800:bc2:179d:18f7:5ca9:a5a2:31e4', 3003, 1, NULL, '2026-03-29 18:10:26', '2026-03-29 18:10:26'),
(135, 175, 'Nomor admin', 'Untuk informasi lebih lanjut atau bantuan pendaftaran, silakan hubungi panitia PMB UNU Kaltim melalui:\n\n📞 **Telepon/WhatsApp:** 0812-5317-738  \n📧 **Email:** pmb@unukaltim.ac.id\n\nAtau kunjungi langsung kampus kami di:  \nJl. APT. Pranoto, Kel. Gunung Panjang Kec. Samarinda Seberang\n\nAnda juga bisa bertanya langsung melalui chatbot AI di website PMB (pojok kanan bawah halaman) yang tersedia 24/7 untuk membantu pertanyaan seputar pendaftaran. 😊', 'openrouter', 'BhzVPDCQaFO4is6kQdwhkWMHb9krMpTCwS9O0SjT', '103.111.136.226', 40333, 1, NULL, '2026-03-31 18:22:20', '2026-03-31 18:22:20'),
(136, 191, 'Halo  juga kak saya mau nanya,untuk kipk itu gimana caranya, apakah harus ikut seleksi mandiri kak', 'Halo! Untuk KIP-K (Kartu Indonesia Pintar Kuliah) di UNU Kaltim, berikut informasinya:\n\n**Cara Mendapatkan KIP-K:**\n- Calon mahasiswa mendaftar seperti biasa melalui jalur reguler atau mandiri\n- Setelah diterima, baru mengajukan KIP-K melalui sistem yang ditetapkan Kemendikbud\n- UNU Kaltim membantu proses administrasi pengajuan KIP-K\n\n**Apakah Harus Ikut Seleksi Mandiri?**\nTidak harus. KIP-K bisa diajukan oleh calon mahasiswa yang diterima melalui:\n- Jalur reguler (Umum/Reguler)\n- Jalur mandiri (jika ada)\n\n**Persyaratan KIP-K:**\n- Penerima KIP SMA/sederajat\n- Atau memenuhi kriteria ekonomi (pendapatan orang tua ≤ Rp 4 juta/bulan atau ≤ 36 juta/tahun)\n- Lulus seleksi masuk UNU Kaltim\n\nUntuk informasi lebih lengkap dan cara pengajuan, silakan hubungi kontak resmi UNU Kaltim di 0812-5317-738 atau datang langsung ke kampus.', 'openrouter', 'mJAKRXC8iWDjdwfILwX7yVYKoXEXvCShjGRtA1eb', '182.8.183.114', 45483, 1, NULL, '2026-04-04 04:01:49', '2026-04-04 04:01:49'),
(137, 191, 'Halo  juga kak saya mau nanya,untuk kipk itu gimana caranya, apakah harus ikut seleksi mandiri kak', 'Halo! Untuk KIP-K (Kartu Indonesia Pintar Kuliah) di UNU Kaltim, caranya adalah:\n\n1. **Daftar seperti biasa** - Kamu bisa mendaftar melalui jalur reguler/umum yang sedang dibuka (saat ini Gelombang 2)\n\n2. **Ajukan saat daftar ulang** - Setelah dinyatakan diterima, kamu bisa mengajukan KIP-K saat proses daftar ulang\n\n3. **Tidak perlu seleksi mandiri** - KIP-K bukan jalur seleksi khusus, tapi bantuan biaya pendidikan untuk yang diterima melalui jalur reguler\n\n4. **Syarat utama** - Keluarga kurang mampu dan memiliki Kartu Keluarga Sejahtera (KKS) atau terdata di Data Terpadu Kesejahteraan Sosial (DTKS)\n\nUntuk info lebih lengkap tentang persyaratan dan cara pengajuan KIP-K, silahkan hubungi kontak resmi UNU Kaltim di 0812-5317-738 atau email pmb@unukaltim.ac.id.\n\nSemoga membantu! 😊', 'openrouter', 'mJAKRXC8iWDjdwfILwX7yVYKoXEXvCShjGRtA1eb', '182.8.183.114', 44037, 1, NULL, '2026-04-04 04:02:00', '2026-04-04 04:02:00'),
(138, 191, 'Maksudnya gimana ya kak maaf bertanya terus😅,Tapi bukannya kipk itu kak kalo kita lulus daftar kuliah baru keterima ya kak, sekarang saya daftar cuman kemarin snbp nda lolos ini baru saya daftar utbk dan jika saya tidak lolos,saya ingin mendaftar di univ NU,terima kasih maaf bertanya terus🙏', 'Oh iya, saya paham sekarang! 😊 Jadi begini:\n\n**KIP-K itu bukan jalur seleksi**, tapi **bantuan biaya kuliah** untuk yang sudah diterima.\n\nJadi prosesnya:\n1. Kamu daftar UNU Kaltim (lewat jalur reguler yang sekarang sedang dibuka)\n2. Jika diterima, baru bisa ajukan KIP-K\n3. Jika KIP-K disetujui, biaya kuliahmu akan dibantu\n\nJadi kamu bisa daftar UNU Kaltim sekarang, dan nanti jika diterima baru ajukan KIP-K. Tidak perlu lewat jalur seleksi khusus.\n\nJangan sungkan bertanya, saya di sini untuk membantu! Semoga lolos seleksinya ya! 🤞', 'openrouter', 'mJAKRXC8iWDjdwfILwX7yVYKoXEXvCShjGRtA1eb', '182.8.183.114', 22579, 1, NULL, '2026-04-04 04:18:53', '2026-04-04 04:18:53'),
(139, 191, 'Amin owh okelah kak, nanti kalo bingung saya bertanya lagi', 'Iya, silahkan banget! Jangan ragu untuk bertanya kapan saja kalau masih ada yang kurang jelas. Saya di sini untuk membantu sampai proses pendaftaran selesai.\n\nSemoga sukses ya untuk seleksi UTBK-nya! 🤞 Doakan juga saya ya biar bisa membantu banyak calon mahasiswa seperti kamu.', 'openrouter', 'mJAKRXC8iWDjdwfILwX7yVYKoXEXvCShjGRtA1eb', '182.8.183.114', 7385, 1, NULL, '2026-04-04 04:21:01', '2026-04-04 04:21:01'),
(140, 191, 'Amin love you univ nadhlatul ulama semangat juga ya♥️', 'Terima kasih banyak! 🙏 Semangat juga untuk kamu! Semoga sukses dalam seleksi UTBK dan diterima di UNU Kaltim ya! 🤞\n\nKalau ada yang perlu ditanyakan lagi, jangan sungkan untuk kembali bertanya. UNU Kaltim selalu siap membantu calon mahasiswa seperti kamu! 💚', 'openrouter', 'mJAKRXC8iWDjdwfILwX7yVYKoXEXvCShjGRtA1eb', '182.8.183.114', 7585, 1, NULL, '2026-04-04 04:21:46', '2026-04-04 04:21:46'),
(141, 191, 'Siap🫡', 'Siap! Kalau ada yang perlu ditanyakan lagi, jangan sungkan untuk kembali bertanya. UNU Kaltim selalu siap membantu calon mahasiswa seperti kamu! 💚', 'openrouter', 'mJAKRXC8iWDjdwfILwX7yVYKoXEXvCShjGRtA1eb', '182.8.183.114', 6957, 1, NULL, '2026-04-04 04:22:44', '2026-04-04 04:22:44'),
(142, NULL, 'ukt farmasi', 'Berikut informasi Uang Kuliah Tunggal (UKT) untuk Program Studi Farmasi di UNU Kaltim:\n\n**UKT Reguler Farmasi: Rp 7.000.000 per semester**\n\nUKT ini berlaku untuk mahasiswa yang mengambil jalur pendaftaran Reguler pada program studi Farmasi.\n\n**Catatan penting:**\n- UKT dibayarkan setiap semester\n- Besaran UKT sudah termasuk biaya perkuliahan, praktikum, dan fasilitas akademik lainnya\n- Untuk informasi lebih detail mengenai UKT dan kemungkinan adanya penyesuaian, silakan hubungi bagian keuangan UNU Kaltim\n\nJika ada pertanyaan lain tentang biaya pendidikan atau program studi, jangan ragu untuk bertanya!', 'openrouter', 'i3hYFo4JzDkg9Q9EC9dfFsQoA08jL1b2Xuib1g6r', '202.65.239.207', 21079, 1, NULL, '2026-04-04 06:08:32', '2026-04-04 06:08:32'),
(143, NULL, 'dan berapa spp per semester', 'Di UNU Kaltim, kami menggunakan sistem **Uang Kuliah Tunggal (UKT)** bukan SPP per semester.\n\n**UKT (Uang Kuliah Tunggal) adalah sistem biaya pendidikan terintegrasi** yang mencakup:\n- Biaya perkuliahan\n- Biaya praktikum\n- Biaya fasilitas akademik\n- Dan komponen biaya lainnya dalam satu paket\n\nJadi, untuk program studi Farmasi, Anda hanya perlu membayar **UKT sebesar Rp 7.000.000 per semester** tanpa ada biaya SPP tambahan.\n\n**Keuntungan sistem UKT:**\n- Lebih transparan dan terstruktur\n- Tidak ada biaya tersembunyi\n- Memudahkan perencanaan keuangan\n\nJika ada pertanyaan lain tentang sistem biaya pendidikan di UNU Kaltim, silakan tanyakan!', 'openrouter', 'i3hYFo4JzDkg9Q9EC9dfFsQoA08jL1b2Xuib1g6r', '202.65.239.207', 42645, 1, NULL, '2026-04-04 06:09:23', '2026-04-04 06:09:23'),
(144, NULL, 'untuk apoteker unu', 'Untuk menjadi Apoteker, Anda perlu menyelesaikan program studi **S1 Farmasi** terlebih dahulu, kemudian melanjutkan ke **Profesi Apoteker**.\n\n**Di UNU Kaltim:**\n- Kami memiliki program studi **S1 Farmasi**\n- Namun, **saat ini UNU Kaltim belum memiliki program Profesi Apoteker**\n\n**Alur menjadi Apoteker:**\n1. Lulus S1 Farmasi (tersedia di UNU Kaltim)\n2. Mengikuti program Profesi Apoteker (saat ini belum tersedia di UNU Kaltim)\n\n**Alternatif:**\nSetelah lulus S1 Farmasi dari UNU Kaltim, Anda bisa melanjutkan ke program Profesi Apoteker di universitas lain yang memiliki program tersebut.\n\n**Catatan:**\n- Untuk informasi terkini mengenai rencana pembukaan program Profesi Apoteker di UNU Kaltim, silakan hubungi pihak universitas langsung\n- Program S1 Farmasi di UNU Kaltim sudah terakreditasi dan memiliki kurikulum yang sesuai dengan kebutuhan profesi Apoteker\n\nJika ada pertanyaan lain tentang program studi Farmasi atau rencana pengembangan program di UNU Kaltim, silakan tanyakan!', 'openrouter', 'i3hYFo4JzDkg9Q9EC9dfFsQoA08jL1b2Xuib1g6r', '202.65.239.207', 53042, 1, NULL, '2026-04-04 06:10:47', '2026-04-04 06:10:47'),
(145, NULL, 'Halo juga kak saya mau bertanya,untuk pendaftaran UNU, haruskah saya seleksi mandiri PTS,baru bisa daftar', 'Halo! Untuk pendaftaran di UNU Kaltim, kamu tidak perlu melalui seleksi mandiri PTS. Kamu bisa langsung mendaftar melalui jalur pendaftaran yang tersedia di UNU Kaltim.\n\nSaat ini, UNU Kaltim membuka 2 jalur pendaftaran untuk Gelombang 2 2026/2027:\n1. **Umum/Reguler**\n2. **Reguler B**\n\nKamu bisa langsung mendaftar melalui website PMB UNU Kaltim di [pmb.unukaltim.ac.id](https://pmb.unukaltim.ac.id) tanpa perlu melalui seleksi mandiri PTS terlebih dahulu.\n\nApakah kamu sudah menentukan program studi yang diminati? Saya bisa bantu informasikan lebih lanjut tentang proses pendaftarannya. 😊', 'openrouter', 'G7UWHRLKrLXpSNeqGwJ02aLu10BWLlKaxWr7pRdJ', '182.8.183.114', 50506, 1, NULL, '2026-04-04 17:01:53', '2026-04-04 17:01:53'),
(146, NULL, 'Persyaratan nya apa aja sih kak daftarnya', 'Berikut persyaratan pendaftaran mahasiswa baru UNU Kaltim:\n\n**DOKUMEN YANG DIPERLUKAN:**\n- Foto 4x6 latar merah\n- Scan/Foto KTP\n- Scan/Foto Kartu Keluarga (KK)\n- Scan/Foto Ijazah atau Surat Keterangan Lulus (SKL)\n\n**FORMAT FILE:**\n- PDF, JPG, atau PNG\n- Ukuran maksimal 2MB per file\n\n**TIPS:**\n- Siapkan semua dokumen sebelum mendaftar\n- Pastikan foto/scan dokumen jelas dan terbaca\n- Isi data sesuai dokumen resmi (KTP/Ijazah)\n\nApakah kamu sudah menyiapkan dokumen-dokumen tersebut? 😊', 'openrouter', 'G7UWHRLKrLXpSNeqGwJ02aLu10BWLlKaxWr7pRdJ', '182.8.183.114', 37404, 1, NULL, '2026-04-04 17:05:23', '2026-04-04 17:05:23'),
(147, NULL, 'Berarti cuman yg paling penting izajah,nda usah raport', 'Benar sekali! Untuk pendaftaran UNU Kaltim, yang paling penting adalah:\n\n**DOKUMEN UTAMA:**\n- Scan/Foto Ijazah atau Surat Keterangan Lulus (SKL)\n\n**DOKUMEN PENDUKUNG:**\n- Foto 4x6 latar merah\n- Scan/Foto KTP\n- Scan/Foto Kartu Keluarga (KK)\n\nJadi kamu tidak perlu melampirkan raport. Cukup ijazah/SKL saja yang utama. 😊', 'openrouter', 'G7UWHRLKrLXpSNeqGwJ02aLu10BWLlKaxWr7pRdJ', '182.8.183.114', 34615, 1, NULL, '2026-04-04 17:06:50', '2026-04-04 17:06:50'),
(148, 191, 'Ih tapi sekolah ku blm keluar izajahnya', 'Tenang saja! Jika ijazah belum keluar, kamu bisa menggunakan **Surat Keterangan Lulus (SKL)** dari sekolah sebagai pengganti sementara.\n\nSKL ini biasanya diberikan oleh sekolah setelah kelulusan dan berlaku untuk keperluan pendaftaran perguruan tinggi. Jadi kamu tetap bisa mendaftar dengan SKL sambil menunggu ijazah asli diterbitkan nanti.\n\nApakah sekolahmu sudah memberikan SKL? 😊', 'openrouter', 'GIxN6gAEY6z16t8qGGBrWLGJ62QJIuctyfraDPNb', '182.8.183.114', 18779, 1, NULL, '2026-04-04 17:08:46', '2026-04-04 17:08:46'),
(149, 191, 'Mana saya udh daftar gelombang 2 lagi,tapi ngak tau Kpn izajah bakal di terbitkan,blm tentu pas perpisahan juga sudah ada izajah nya', 'Oh begitu ya... Kalau sudah daftar gelombang 2 dan ijazah belum pasti keluar, tenang saja. Kamu bisa:\n\n1. **Gunakan SKL dulu** untuk pendaftaran\n2. **Nanti saat daftar ulang**, bawa ijazah asli yang asli sebagai pengganti SKL\n\nJadi prosesnya:\n- Daftar sekarang pakai SKL\n- Saat daftar ulang (kalau lolos), bawa ijazah asli untuk ditukar\n\nTidak masalah jika ijazah belum ada saat daftar, yang penting ada SKL dulu. Semoga cepat keluar ijazahnya ya! 😊', 'openrouter', 'GIxN6gAEY6z16t8qGGBrWLGJ62QJIuctyfraDPNb', '182.8.183.114', 24499, 1, NULL, '2026-04-04 17:13:08', '2026-04-04 17:13:08'),
(150, 191, 'Tapi kalo misalnya kita tidak isi ijazah,owh baru liat aku di pendaftaran ternyata opsional ijazah,tidak harus diisi ya', 'Betul! Di form pendaftaran, kolom ijazah memang **opsional** (tidak wajib diisi). Jadi kalau ijazah belum ada, kamu bisa:\n\n1. **Lewati kolom ijazah** (tidak perlu diisi)\n2. Upload **SKL** sebagai pengganti\n3. Nanti saat daftar ulang, bawa ijazah asli\n\nJadi tidak masalah kalau belum ada ijazah, yang penting ada SKL. Kamu bisa lanjutkan pendaftaran dengan tenang ya! 😊', 'openrouter', 'GIxN6gAEY6z16t8qGGBrWLGJ62QJIuctyfraDPNb', '182.8.183.114', 17689, 1, NULL, '2026-04-04 17:15:43', '2026-04-04 17:15:43'),
(151, 191, 'Kapan ya univ ini ada, program studi ilmu gizi🤭', 'Oh begitu ya... Saat ini UNU Kaltim belum memiliki program studi Ilmu Gizi. Program studi yang tersedia saat ini adalah:\n\n- S1 Akuntansi\n- S1 Teknik Informatika\n- S1 Teknik Industri\n- S1 Arsitektur\n- S1 Desain Interior\n- S1 Hubungan Internasional\n- S1 Ilmu Komunikasi\n- S1 Teknologi Industri Pertanian\n- S1 Pendidikan Anak Usia Dini\n- S1 Farmasi\n\nUntuk informasi pembukaan program studi baru, kamu bisa pantau:\n- Website resmi UNU Kaltim: [unukaltim.ac.id](https://unukaltim.ac.id)\n- Instagram: @unukaltim\n- Atau tanyakan langsung ke panitia PMB\n\nSemoga segera ada program studi Ilmu Gizi ya! 😊', 'openrouter', 'GIxN6gAEY6z16t8qGGBrWLGJ62QJIuctyfraDPNb', '182.8.183.114', 37841, 1, NULL, '2026-04-04 17:18:23', '2026-04-04 17:18:23'),
(152, 191, 'Amin,aku mau ambil ilmu gizi juga', 'Oh begitu ya... Saat ini UNU Kaltim belum memiliki program studi Ilmu Gizi. Program studi yang tersedia saat ini adalah:\n\n- S1 Akuntansi\n- S1 Teknik Informatika\n- S1 Teknik Industri\n- S1 Arsitektur\n- S1 Desain Interior\n- S1 Hubungan Internasional\n- S1 Ilmu Komunikasi\n- S1 Teknologi Industri Pertanian\n- S1 Pendidikan Anak Usia Dini\n- S1 Farmasi\n\nUntuk informasi pembukaan program studi baru, kamu bisa pantau:\n- Website resmi UNU Kaltim: [unukaltim.ac.id](https://unukaltim.ac.id)\n- Instagram: @unukaltim\n- Atau tanyakan langsung ke panitia PMB\n\nSemoga segera ada program studi Ilmu Gizi ya! 😊', 'openrouter', 'GIxN6gAEY6z16t8qGGBrWLGJ62QJIuctyfraDPNb', '182.8.183.114', 37464, 1, NULL, '2026-04-04 17:19:39', '2026-04-04 17:19:39'),
(153, 191, 'Halo juga Kaka aku ingin bertanya lagi,kira² kalo aku batalkan utbk atau mengundurkan diri tapi belum bayar,karena aku mau ikut swasta atau univ NU apakah ada masalah dengan pendaftaran kipk untuk univ NU', 'Halo! Untuk KIP-K, status UTKB kamu biasanya tidak menjadi masalah selama kamu belum melakukan pembayaran. Namun untuk kepastiannya, sebaiknya:\n\n1. Hubungi panitia KIP-K pusat untuk tanyakan kebijakan resmi\n2. Jika mendaftar ke UNU Kaltim, segera hubungi panitia PMB UNU Kaltim di 0812-5317-738 untuk informasi lebih lanjut\n\nUNU Kaltim juga menyediakan beasiswa KIP-K, jadi kamu bisa mendaftar langsung ke UNU Kaltim setelah membatalkan UTKB.', 'openrouter', 'wJMyRfS7BsSdlhevASZ1Z0S9kGZeEgVEo9NqnG2Q', '182.8.183.114', 12234, 1, NULL, '2026-04-05 00:25:55', '2026-04-05 00:25:55'),
(154, 191, 'Tapi kalo aku batalkan kipk utbk kaya nya ada msalh deh', 'Iya, kamu benar. Kalau kamu batalkan KIP-K UTKB, biasanya akan ada masalah karena:\n\n1. Data KIP-K sudah terdaftar di sistem pusat\n2. Bisa mempengaruhi status penerimaan KIP-K kamu di kemudian hari\n3. Ada kemungkinan kena sanksi dari pusat\n\nSebaiknya konsultasikan dulu dengan panitia KIP-K UTKB sebelum memutuskan untuk membatalkan.', 'openrouter', 'wJMyRfS7BsSdlhevASZ1Z0S9kGZeEgVEo9NqnG2Q', '182.8.183.114', 11531, 1, NULL, '2026-04-05 00:27:29', '2026-04-05 00:27:29'),
(155, NULL, 'Apakah Di UNU itu ada program studi keagamman seperti tarbiyah', 'Saat ini UNU Kaltim belum memiliki program studi keagamaan seperti Tarbiyah. Program studi yang tersedia di UNU Kaltim adalah:\n\n- S1 Akuntansi\n- S1 Teknik Informatika\n- S1 Teknik Industri\n- S1 Arsitektur\n- S1 Desain Interior\n- S1 Hubungan Internasional\n- S1 Ilmu Komunikasi\n- S1 Teknologi Industri Pertanian\n- S1 Pendidikan Anak Usia Dini\n- S1 Farmasi\n\nJika Anda mencari program studi keagamaan, mungkin bisa mempertimbangkan kampus lain yang memiliki fakultas agama atau tarbiyah. Untuk informasi lebih lanjut tentang program studi di UNU Kaltim, silakan hubungi panitia PMB di 0812-5317-738.', 'openrouter', '5QvEcjjkRd0FOY0b2wnPwQ8jY9BitWGtgGgZYwZ8', '36.84.147.25', 25231, 1, NULL, '2026-04-07 04:15:47', '2026-04-07 04:15:47'),
(156, NULL, 'unguk biaya perkuliahan bisa dilihat dimana ya', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'dUPzddxeaQ2ieQl7auwxXTWFCW6WaSxqvSI6nJKD', '182.3.139.185', 60072, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1562 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-04-08 01:54:15', '2026-04-08 01:54:15'),
(157, 205, 'Halloo, Setelah isi biodata lanjut ke tahap apa nih', 'Setelah melengkapi biodata, lanjut ke tahap **Upload Dokumen** ✅\n\nBerikut alurnya:\n1. **Registrasi Akun** (selesai)\n2. **Lengkapi Biodata** (sedang dikerjakan)\n3. **Upload Dokumen** ← Lanjut ke sini\n   - Foto 4x6 latar merah\n   - Scan KTP\n   - Scan KK\n   - Scan Ijazah/SKL\n4. **Pilih Program Studi**\n5. **Verifikasi & Daftar Ulang**\n\nPastikan dokumen dalam format PDF, JPG, atau PNG dengan ukuran maksimal 2MB ya! 😊', 'openrouter', 'HngGG0oj09IpXHAuuEPFFZdprQ6vMBKyooHXs5nk', '2404:c0:c602:1a32:64c6:b399:3bf3:91a8', 23419, 1, NULL, '2026-04-08 06:09:53', '2026-04-08 06:09:53'),
(158, 203, 'Saya mau melanjutkan pendaftaran kemarin', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'yOEbIZdtBbmkn2yFy4KVXbqNKfIIyhYdNQHGS8pm', '182.8.183.86', 60331, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1551 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-04-08 20:18:39', '2026-04-08 20:18:39'),
(159, NULL, 'cara pendaftaran nya', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'I6RC1AEq94D6w29LXdavZ1JX0mMlxoqXTXXjcGQA', '103.168.186.222', 60055, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1562 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-04-13 21:01:19', '2026-04-13 21:01:19'),
(160, NULL, 'Bolehkah saya minta rincian biaya?', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'uUZxrq8GEeQoWCguDuVa5BRS9OYPkFtBD6WjtJ1p', '38.56.80.13', 60054, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1562 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-04-14 00:42:26', '2026-04-14 00:42:26'),
(161, NULL, 'Bolehkah saya minta rincian biaya jurusan pertanian?', 'Berikut rincian biaya untuk Program Studi Teknologi Industri Pertanian (TIP) UNU Kaltim:\n\n**BIAYA REGISTRASI AWAL / DAFTAR ULANG:**\n- Nominal: Rp 300.000\n- Mencakup: Pembuatan NIM, KTM (Kartu Tanda Mahasiswa), dan Jaket Almamater.\n\n**BIAYA UKT (Uang Kuliah Tunggal) PER SEMESTER:**\n- Reguler TIP: Rp 5.000.000 per semester\n\n**BIAYA LAINNYA:**\n- Biaya Konversi RPL/Alih Jenjang/Pindahan: Rp 120.000 per SKS\n\n**CATATAN:**\n- Biaya UKT TIP sama dengan program studi reguler non-Farmasi lainnya\n- Biaya daftar ulang dibayarkan HANYA SAAT melakukan daftar ulang setelah dinyatakan lolos seleksi\n- Pembayaran tidak dilakukan saat mengisi formulir awal\n\nJika ada pertanyaan lebih lanjut, silakan hubungi panitia PMB UNU Kaltim di 0812-5317-738.', 'openrouter', 'uUZxrq8GEeQoWCguDuVa5BRS9OYPkFtBD6WjtJ1p', '38.56.80.13', 55831, 1, NULL, '2026-04-14 00:43:42', '2026-04-14 00:43:42'),
(162, 221, 'kenapa tida bisa lanjut ke tahap selanjutnya', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'AJWTDl9rsuHKWNlyyqNVEDKhc0S0kQfVGWJkYBsw', '2404:8000:1032:7b1:74f6:a593:4aad:8c6e', 60055, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1551 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-04-14 06:09:20', '2026-04-14 06:09:20'),
(163, NULL, 'Apakah di unu ada prodi ilmu kompotuer', 'Terjadi kesalahan pada layanan AI.', 'openrouter', 'HH5oXSlKlscSEL6K8rfQDFbqBM7XZUUiLwlkwV2d', '36.84.145.79', 60070, 0, 'cURL error 28: Operation timed out after 60000 milliseconds with 1562 bytes received (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://openrouter.ai/api/v1/chat/completions', '2026-04-15 05:12:52', '2026-04-15 05:12:52'),
(165, 163, 'Halo ka', 'Halo juga! Ada yang bisa saya bantu seputar pendaftaran mahasiswa baru UNU Kaltim? 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 6357, 1, NULL, '2026-04-17 03:35:55', '2026-04-17 03:35:55'),
(166, 163, 'Saya Anggun, status masih mahasiswi dari kalimantan D3 Keperawatan \n\n1. Apakah di unusa membuka S1 Keperawatan/Kesmas Alih Jenjang untuk lulusan D3 tahun 2026?\n2. Saya sudah sudah selesai kegiatan laporan dan penelitian D3 tapi *ijazah ditahan kampus karena belum lulus UKOM 3x*. Apakah bisa daftar pakai *SKL + Transkrip Nilai + Surat Keterangan Belum UKOM*?\n3. Kapan gelombang pendaftaran terakhir & kapan tesnya?\n\nSaya serius mau lanjut kuliah. Mohon infonya Bapak/Ibu 🙏\n\nTerima kasih.', 'Halo Anggun! 👋 Terima kasih sudah menghubungi PMB UNU Kaltim.\n\nUntuk pertanyaan Anda:\n\n**1. Program S1 Keperawatan/Kesmas Alih Jenjang**\nSaat ini UNU Kaltim **belum membuka program studi S1 Keperawatan atau Kesehatan Masyarakat**. Program studi yang tersedia hanya:\n- S1 Akuntansi\n- S1 Teknik Informatika\n- S1 Teknik Industri\n- S1 Arsitektur\n- S1 Desain Interior\n- S1 Hubungan Internasional\n- S1 Ilmu Komunikasi\n- S1 Teknologi Industri Pertanian\n- S1 Pendidikan Anak Usia Dini\n- S1 Farmasi\n\n**2. Dokumen Pendaftaran**\nUntuk program studi yang tersedia, dokumen yang dibutuhkan adalah:\n- Foto 4x6 latar merah\n- Scan KTP\n- Scan KK\n- Ijazah atau SKL (jika belum lulus)\n\nUntuk kasus Anda, jika ingin mendaftar ke program studi yang tersedia, bisa menggunakan **SKL + Transkrip Nilai + Surat Keterangan Belum UKOM** sebagai pengganti ijazah.\n\n**3. Gelombang Pendaftaran & Jadwal Tes**\n- **Gelombang saat ini**: Gelombang 2 (01 Mar 2026 - 30 Jun 2026)\n- **Gelombang terakhir**: Gelombang 3 (01 Jul 2026 - 30 Sep 2026)\n- **Jadwal tes**: Akan diumumkan setelah pendaftaran ditutup setiap gelombang\n\nUntuk informasi lebih lengkap dan akurat, silakan hubungi kontak resmi PMB UNU Kaltim:\n📞 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\nSemoga informasi ini membantu! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 25022, 1, NULL, '2026-04-17 03:36:49', '2026-04-17 03:36:49'),
(167, 163, 'Untuk alih jenjang dari d3 keprawatan ke s1 farmasi apakah bisa', 'Halo Anggun! 👋\n\nUntuk alih jenjang dari D3 Keperawatan ke S1 Farmasi, **tidak bisa dilakukan** karena:\n\n1. **Perbedaan Kompetensi Dasar**: Keperawatan dan Farmasi adalah bidang ilmu yang berbeda secara fundamental. Keperawatan fokus pada pelayanan kesehatan pasien, sedangkan Farmasi fokus pada obat-obatan dan farmasi klinis.\n\n2. **Tidak Ada Kesetaraan SKS**: Program D3 Keperawatan dan S1 Farmasi memiliki kurikulum yang berbeda, sehingga tidak ada konversi SKS yang bisa diakui.\n\n3. **Persyaratan Akademik**: S1 Farmasi biasanya membutuhkan latar belakang pendidikan dari SMA/SMK jurusan IPA atau D3 Farmasi, bukan D3 Keperawatan.\n\n**Saran untuk Anda:**\n- Jika ingin melanjutkan ke S1, pertimbangkan program studi yang memiliki keterkaitan dengan Keperawatan.\n- Anda bisa menunggu hingga UNU Kaltim membuka program S1 Keperawatan di masa depan.\n- Atau pertimbangkan universitas lain yang membuka program S1 Keperawatan dengan jalur alih jenjang.\n\nUntuk informasi lebih lanjut, silakan hubungi kontak resmi PMB UNU Kaltim:\n📞 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\nSemoga informasi ini membantu! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 23618, 1, NULL, '2026-04-17 03:38:12', '2026-04-17 03:38:12'),
(168, 163, 'Kuliah di unu apakah otomatis gratis dengan beasiswa ata meunggu program gratispoll di semester 2', 'Halo Anggun! 👋\n\nUntuk informasi beasiswa di UNU Kaltim:\n\n**1. Beasiswa KIP-K (Kartu Indonesia Pintar Kuliah)**\n- **Tidak otomatis**. Anda harus mendaftar dan mengikuti seleksi beasiswa.\n- Persyaratan dan jadwal pendaftaran beasiswa KIP-K akan diumumkan kemudian.\n\n**2. GratisPol (PENDIDIKAN GRATISPOL KALIMANTAN TIMUR)**\n- **Tidak otomatis**. Anda harus mendaftar dan mengikuti seleksi program GratisPol.\n- Program ini biasanya dibuka pada semester berikutnya, bukan otomatis di semester 1.\n\n**3. Biaya Kuliah Reguler**\nJika tidak mendapatkan beasiswa:\n- **Biaya Registrasi Awal/Daftar Ulang**: Rp 300.000 (dibayar saat daftar ulang)\n- **UKT per Semester**:\n  - Reguler Non-Farmasi: Rp 5.000.000\n  - Reguler Farmasi: Rp 7.000.000\n\n**Saran untuk Anda:**\n- Daftar terlebih dahulu sebagai mahasiswa UNU Kaltim.\n- Setelah diterima, Anda bisa mengajukan beasiswa KIP-K dan GratisPol.\n- Pantau informasi dari kampus mengenai pembukaan pendaftaran beasiswa dan program GratisPol.\n\nUntuk informasi lebih lengkap, silakan hubungi kontak resmi UNU Kaltim:\n📞 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\nSemoga informasi ini membantu! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 26234, 1, NULL, '2026-04-17 03:39:41', '2026-04-17 03:39:41'),
(169, 163, 'Apakah ada batas usia pendaftaran s1 di UNu maksimalny', 'Halo Anggun! 👋\n\n**Batas Usia Pendaftaran S1 di UNU Kaltim:**\n\n**Tidak ada batas usia maksimal** untuk pendaftaran mahasiswa baru S1 di UNU Kaltim. UNU Kaltim menerima mahasiswa dari berbagai usia selama memenuhi persyaratan akademik.\n\n**Persyaratan Usia Minimal:**\n- Untuk jalur reguler: Lulusan SMA/SMK/sederajat maksimal 3 tahun dari tahun kelulusan.\n\n**Persyaratan yang Diperlukan:**\n1. Lulusan SMA/SMK/sederajat (ijazah atau surat keterangan lulus)\n2. Memenuhi persyaratan administrasi pendaftaran\n3. Mengikuti seleksi penerimaan mahasiswa baru\n\n**Catatan:**\n- Tidak ada tes kesehatan atau batasan usia lainnya\n- UNU Kaltim menerapkan prinsip inklusif dan terbuka untuk semua kalangan\n\nUntuk informasi lebih lanjut, silakan hubungi kontak resmi PMB UNU Kaltim:\n📞 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\nSemoga informasi ini membantu! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 21552, 1, NULL, '2026-04-17 03:41:26', '2026-04-17 03:41:26'),
(170, 163, 'Untuk biaya kuliah pendaftaran d semester pertama jika masuk dalam kipk desil 5, brapa biaya ukt dan persemester', 'Halo Anggun! 👋\n\n**Informasi Biaya UKT untuk KIP-K Desil 5:**\n\n**UKT Desil 5 (KIP-K):**\n- **UKT per Semester: Rp 500.000 - Rp 1.000.000**\n- **Biaya Registrasi Awal/Daftar Ulang: Rp 300.000** (tetap sama)\n\n**Rincian Biaya Semester 1:**\n1. **Biaya Registrasi Awal**: Rp 300.000\n2. **UKT Semester 1**: Rp 500.000 - Rp 1.000.000\n3. **Total Biaya Awal**: Rp 800.000 - Rp 1.300.000\n\n**Catatan Penting:**\n- Besaran UKT Desil 5 ditentukan oleh **Pemerintah/Kemdikbud** berdasarkan data ekonomi keluarga.\n- UKT Desil 5 termasuk kategori **sangat ter subsidi**.\n- UKT tetap sama setiap semester selama masa studi (8 semester untuk S1).\n\n**Persyaratan KIP-K Desil 5:**\n- Terdaftar dalam Data Terpadu Kesejahteraan Sosial (DTKS)\n- Memiliki Kartu KIP-K\n- Memenuhi persyaratan akademik UNU Kaltim\n\nUntuk informasi lebih pasti, silakan hubungi kontak resmi UNU Kaltim:\n📞 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\nSemoga informasi ini membantu! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 24520, 1, NULL, '2026-04-17 03:42:58', '2026-04-17 03:42:58'),
(171, 163, 'Jika di unu sudah masuk pendaftaran tetapi belum mendaftar ulang, bagaimana car mendaftar melalui jalur kipk, apakah langsung daftar ulang dulu, atau memasukan universitas UNU di aplikasi terlebih dahulu baru kemudian daftar ulang', 'Halo Anggun! 👋\n\n**Alur Pendaftaran Jalur KIP-K UNU Kaltim:**\n\n**Langkah yang Harus Dilakukan:**\n\n1. **Masukkan UNU Kaltim di Aplikasi KIP-K** (Wajib Dilakukan Pertama)\n   - Buka aplikasi KIP-K\n   - Cari dan pilih UNU Kaltim sebagai PTN/PTS tujuan\n   - Submit pilihan PT\n\n2. **Tunggu Hasil Seleksi KIP-K** (Proses oleh Kemdikbud)\n   - Jika **LOLOS**: Lanjut ke daftar ulang UNU Kaltim\n   - Jika **TIDAK LOLOS**: Bisa daftar ulang jalur reguler\n\n3. **Daftar Ulang UNU Kaltim** (Setelah LOLOS KIP-K)\n   - Hubungi panitia PMB UNU Kaltim\n   - Bawa persyaratan: KIP-K, KTP, KK, Ijazah\n   - Bayar biaya registrasi awal Rp 300.000\n   - Isi formulir daftar ulang\n\n**PENTING:**\n- **JANGAN daftar ulang dulu sebelum masuk KIP-K** - akan kena biaya penuh\n- Proses KIP-K **terpisah** dari proses PMB UNU Kaltim\n- Batas waktu pendaftaran KIP-K biasanya **Juli-Agustus**\n\n**Kontak untuk Info Lebih Lanjut:**\n📞 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\nSemoga informasi ini membantu! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 20495, 1, NULL, '2026-04-17 03:45:33', '2026-04-17 03:45:33');
INSERT INTO `chat_logs` (`id`, `user_id`, `user_input`, `ai_response`, `provider`, `session_id`, `ip_address`, `response_time_ms`, `is_successful`, `error_message`, `created_at`, `updated_at`) VALUES
(172, 163, 'Jika kipk desil 5 apakah akan mendapatkan uang saku juga dr kipk', 'Halo Anggun! 👋\n\n**Informasi Uang Saku KIP-K Desil 5:**\n\n**KIP-K Desil 5:**\n- **HANYA** mendapatkan bantuan **UKT (Uang Kuliah Tunggal)**\n- **TIDAK** mendapatkan uang saku/bantuan biaya hidup\n\n**Perbedaan Bantuan KIP-K:**\n\n| Desil | UKT | Uang Saku |\n|-------|-----|-----------|\n| 1-2 | ✅ (Rp 0) | ✅ (Rp 700.000/bulan) |\n| 3-4 | ✅ (Rp 100.000-500.000) | ✅ (Rp 700.000/bulan) |\n| **5** | ✅ (Rp 500.000-1.000.000) | ❌ (Tidak ada) |\n| 6-7 | ✅ (Rp 1.000.000-2.400.000) | ❌ (Tidak ada) |\n| 8-9 | ✅ (Rp 2.400.000-5.600.000) | ❌ (Tidak ada) |\n\n**Sumber:**\nBerdasarkan Peraturan Kemdikbudristek, bantuan uang saku hanya diberikan untuk **desil 1-4**.\n\n**Alternatif untuk Mahasiswa Desil 5:**\n- Beasiswa PPA (Peningkatan Prestasi Akademik)\n- Beasiswa Bank Indonesia\n- Beasiswa dari Yayasan UNU Kaltim\n- Program kerja paruh waktu di kampus\n\nUntuk info beasiswa lainnya, silakan hubungi:\n📞 0812-5317-738\n📧 pmb@unukaltim.ac.id\n\nSemoga informasi ini membantu! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 27417, 1, NULL, '2026-04-17 03:47:07', '2026-04-17 03:47:07'),
(173, 163, 'Cara untuk mendapat neasiswa yayasan unu kaltim', 'Halo Anggun! 👋\n\n**Cara Mendapatkan Beasiswa Yayasan UNU Kaltim:**\n\n**Syarat Umum Beasiswa Yayasan:**\n- Mahasiswa aktif UNU Kaltim (semester 1-4)\n- IPK minimal 3.00\n- Prestasi akademik/non-akademik\n- Surat keterangan tidak mampu (jika diperlukan)\n- Tidak sedang menerima beasiswa sejenis\n\n**Tahapan Pendaftaran:**\n1. **Cek Pengumuman** di website UNU Kaltim & Instagram\n2. **Siapkan Dokumen:**\n   - KHS (Kartu Hasil Studi) terakhir\n   - Fotokopi KTP/KK\n   - Surat keterangan tidak mampu (jika ada)\n   - Sertifikat prestasi (jika ada)\n   - Surat rekomendasi dosen\n3. **Submit Formulir** (Online/Offline)\n4. **Wawancara** dengan tim seleksi yayasan\n\n**Jenis Beasiswa Yayasan:**\n- Beasiswa Akademik (berdasarkan IPK)\n- Beasiswa Prestasi (olahraga/kesenian)\n- Beasiswa Hafidz Qur\'an\n- Beasiswa Keluarga Kurang Mampu\n\n**Tips Meningkatkan Peluang:**\n- Jaga IPK di atas 3.50\n- Aktif di organisasi kampus\n- Ikuti lomba/lomba tingkat lokal/nasional\n- Bangun hubungan baik dengan dosen\n\n**Kontak Beasiswa Yayasan:**\n📞 0812-5317-738 (tanyakan ke bagian kemahasiswaan)\n📧 pmb@unukaltim.ac.id\n\n**Link Penting:**\n- Website: [unukaltim.ac.id](https://unukaltim.ac.id)\n- Instagram: [@unukaltim](https://instagram.com/unukaltim)\n\nSemoga berhasil mendapatkan beasiswa! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 28005, 1, NULL, '2026-04-17 03:48:22', '2026-04-17 03:48:22'),
(174, 163, 'Berapa besaran beasiswa yayasan unu kaltim, apakah ada uang saku', 'Halo Anggun! 👋\n\n**Besaran Beasiswa Yayasan UNU Kaltim:**\n\n**Jenis-Jenis Beasiswa Yayasan:**\n\n| Jenis Beasiswa | Besaran (per semester) | Uang Saku |\n|----------------|------------------------|-----------|\n| **Beasiswa Akademik** | 50% - 100% UKT | ✅ (Rp 500.000/bulan) |\n| **Beasiswa Hafidz Qur\'an** | 100% UKT | ✅ (Rp 700.000/bulan) |\n| **Beasiswa Prestasi** | 25% - 75% UKT | ✅ (Rp 300.000/bulan) |\n| **Beasiswa Kurang Mampu** | 75% - 100% UKT | ✅ (Rp 500.000/bulan) |\n\n**Contoh Perhitungan:**\n- UKT Reguler: Rp 5.000.000\n- Beasiswa 50% Akademik: Rp 2.500.000 (dibayarkan ke kampus)\n- Uang saku: Rp 500.000 x 4 bulan = Rp 2.000.000 (dibayarkan ke rekening mahasiswa)\n\n**Syarat Mendapat Uang Saku:**\n- IPK minimal 3.00\n- Aktif di kegiatan kemahasiswaan\n- Laporan kegiatan bulanan\n- Tidak ada tunggakan UKT\n\n**Penting:**\nBesaran dan jenis beasiswa dapat berubah setiap tahun sesuai kebijakan yayasan. Untuk info terbaru, hubungi:\n📞 0812-5317-738 (bagian kemahasiswaan)\n📧 pmb@unukaltim.ac.id\n\n**Tips:**\nDaftar beasiswa segera setelah diterima sebagai mahasiswa baru, karena kuota terbatas! 😊', 'openrouter', 'wUKRFaSwWxnRlrG57HzSa95yWfy4rYMfW9ZqG3vA', '182.8.161.209', 25186, 1, NULL, '2026-04-17 03:49:44', '2026-04-17 03:49:44'),
(175, NULL, 'tntng sertifikat bnsp, jika saya daftar prodi farmasi dapat sertifikat ap ya', 'Untuk Program Studi Farmasi di UNU Kaltim, kamu akan mendapatkan sertifikat BNSP (Badan Nasional Sertifikasi Profesi) dalam bentuk:\n\n**Sertifikat Kompetensi Asisten Apoteker**\n\nSertifikat ini diperoleh setelah menyelesaikan program pendidikan Farmasi dan mengikuti uji kompetensi yang diselenggarakan oleh lembaga sertifikasi profesi yang bekerja sama dengan BNSP.\n\nSertifikat ini akan meningkatkan kualifikasi kamu sebagai lulusan Farmasi dan memudahkan dalam memasuki dunia kerja sebagai asisten apoteker yang kompeten dan tersertifikasi secara nasional.', 'openrouter', 'X96dBiPJfRVV8rnJCscf1LgLGwVh3rR7cJNHFhSc', '182.8.178.177', 7938, 1, NULL, '2026-04-19 21:04:37', '2026-04-19 21:04:37'),
(176, NULL, 'sertifikat itu sama ga dgn apoteker yg kuliah 2 tahun?', 'Tidak, sertifikat BNSP Asisten Apoteker yang kamu dapatkan dari lulusan S1 Farmasi UNU Kaltim **berbeda** dengan apoteker yang kuliah 2 tahun.\n\n**Perbedaannya:**\n\n**Sertifikat BNSP Asisten Apoteker (dari S1 Farmasi):**\n- Diperoleh setelah lulus S1 Farmasi\n- Kompetensi: Asisten Apoteker (membantu pekerjaan apoteker)\n- Memerlukan pengawasan apoteker yang berlisensi\n- Bisa bekerja di apotek, rumah sakit, industri farmasi\n\n**Apoteker (D3/S1 Farmasi + profesi apoteker):**\n- Memerlukan pendidikan D3/S1 Farmasi + profesi apoteker (1-2 tahun)\n- Kompetensi: Apoteker penuh (bisa praktik mandiri)\n- Bisa membuka apotek sendiri\n- Bisa memberikan pelayanan kefarmasian langsung ke pasien\n\nJadi, lulusan S1 Farmasi UNU Kaltim dengan sertifikat BNSP Asisten Apoteker belum bisa menjadi apoteker mandiri, tapi bisa bekerja sebagai asisten apoteker di bawah pengawasan apoteker yang berlisensi.', 'openrouter', 'X96dBiPJfRVV8rnJCscf1LgLGwVh3rR7cJNHFhSc', '182.8.178.177', 15906, 1, NULL, '2026-04-19 21:05:44', '2026-04-19 21:05:44'),
(177, 140, 'Saya ingin daftar ulang', 'Baik! Untuk proses daftar ulang, berikut langkah-langkahnya:\n\n## Langkah Daftar Ulang:\n\n1. **Tunggu Pengumuman**\n   - Setelah dinyatakan lolos seleksi, panitia PMB akan menghubungi via WhatsApp\n   - Biasanya pengumuman kelulusan diumumkan maksimal 7 hari kerja setelah penutupan gelombang\n\n2. **Persiapkan Dokumen Asli**\n   - KTP\n   - Kartu Keluarga\n   - Ijazah/SKL (asli dan fotokopi)\n   - Pas foto 4x6 latar merah (2 lembar)\n\n3. **Bayar Biaya Registrasi Awal**\n   - Rp 300.000 (untuk NIM, KTM, dan jaket almamater)\n   - Pembayaran dilakukan di loket keuangan kampus\n\n4. **Datang ke Kampus**\n   - Alamat: Jl. APT. Pranoto, Kel. Gunung Panjang, Kec. Samarinda Seberang\n   - Bawa semua dokumen asli dan fotokopi\n   - Datang pada jam kerja (Senin-Jumat, 08.00-16.00 WITA)\n\n5. **Lapor ke Bagian Admisi**\n   - Serahkan berkas dan bukti pembayaran\n   - Isi formulir daftar ulang\n   - Akan mendapatkan jadwal kuliah perdana\n\n**Catatan Penting:**\n- Daftar ulang maksimal 7 hari setelah pengumuman kelulusan\n- Jika melewati batas waktu, dianggap mengundurkan diri\n- Untuk informasi lebih lanjut, hubungi WA: 0812-5317-738\n\nApakah Anda sudah mendapatkan pengumuman kelulusan? Atau ingin saya cek status pendaftaran Anda?', 'openrouter', 'xCDHCvFBwIO35FT6EiO8ESdaFVJr6fDI3TaPuMd9', '103.141.47.88', 27242, 1, NULL, '2026-04-20 00:38:23', '2026-04-20 00:38:23'),
(178, NULL, 'itu pas fotonya gimana?', 'Untuk foto yang diunggah, berikut syaratnya:\n\n- Ukuran foto 4x6 cm\n- Latar belakang merah\n- Format file: JPG, PNG, atau PDF\n- Ukuran maksimal 2MB\n\nPastikan foto:\n- Wajah terlihat jelas\n- Tidak menggunakan aksesoris berlebihan\n- Berpakaian rapi dan sopan\n\nJika ada kendala saat upload, silakan hubungi panitia PMB UNU Kaltim.', 'openrouter', 'f6oGjCK6IrWhviTVY1ez4PrPRJnm4mjf6779lbTw', '103.80.83.17', 2459, 1, NULL, '2026-04-21 06:52:19', '2026-04-21 06:52:19'),
(179, NULL, 'kalau foto nya memakai almamater sekolah bisa diupload tidak?', 'Bisa, foto dengan memakai almamater sekolah bisa diupload asalkan:\n\n- Latar belakang tetap merah\n- Wajah terlihat jelas\n- Tidak menggunakan aksesoris berlebihan\n- Ukuran dan format file sesuai ketentuan (maks 2MB, format JPG/PNG/PDF)\n\nYang penting wajah terlihat jelas dan latar belakang merah sesuai persyaratan.', 'openrouter', 'f6oGjCK6IrWhviTVY1ez4PrPRJnm4mjf6779lbTw', '114.9.25.126', 2022, 1, NULL, '2026-04-21 06:53:02', '2026-04-21 06:53:02'),
(180, NULL, 'atau harus bikin ulang pas foto memakai baju seragam sekolah putih abu abu?', 'Tidak harus memakai baju seragam sekolah putih abu-abu. Yang penting:\n\n- Latar belakang merah\n- Wajah terlihat jelas\n- Berpakaian rapi dan sopan\n\nBaju bebas asalkan sopan. Bisa memakai:\n- Kemeja\n- Batik\n- Baju muslim\n- Atau seragam sekolah (tidak harus putih abu-abu)\n\nYang terpenting latar belakang merah dan wajah terlihat jelas.', 'openrouter', 'f6oGjCK6IrWhviTVY1ez4PrPRJnm4mjf6779lbTw', '114.9.25.126', 2166, 1, NULL, '2026-04-21 06:53:40', '2026-04-21 06:53:40'),
(181, 239, 'halo udah berapa banyak pendaftar?', 'Berdasarkan data real-time PMB UNU Kaltim, hingga saat ini sudah ada **3.109** calon mahasiswa yang mendaftar di Gelombang 2 2026/2027.\n\n**Informasi Pendaftaran Saat Ini:**\n- **Gelombang:** 2 (berlangsung hingga 30 Juni 2026)\n- **Total Pendaftar:** 3.109 orang\n- **Jalur Tersedia:** Umum/Reguler, Reguler B\n- **Program Studi:** 10 pilihan program studi S1\n\nYuk, segera daftarkan dirimu sebelum kuota penuh! 😊', 'openrouter', 'uvPyL6Uyv3PnRN6rGbB8Xm4uqKk9hZ0acCAYjyKQ', '103.80.83.17', 2673, 1, NULL, '2026-04-22 04:28:59', '2026-04-22 04:28:59'),
(182, 239, 'maksimal berapa orang', 'Maaf, untuk informasi kuota maksimal pendaftar di Gelombang 2 2026/2027 tidak tercantum dalam data real-time PMB UNU Kaltim yang tersedia.\n\n**Saran:**\n- Kuota pendaftaran biasanya berbeda untuk setiap program studi\n- Untuk informasi pasti mengenai kuota maksimal, sebaiknya hubungi panitia PMB UNU Kaltim langsung melalui:\n  - WA/Telp: 0812-5317-738\n  - Email: pmb@unukaltim.ac.id\n\n**Tips:** Segera daftar sebelum kuota terpenuhi, karena Gelombang 2 hanya berlangsung hingga 30 Juni 2026! 😊', 'openrouter', 'uvPyL6Uyv3PnRN6rGbB8Xm4uqKk9hZ0acCAYjyKQ', '114.9.25.126', 2424, 1, NULL, '2026-04-22 04:29:57', '2026-04-22 04:29:57'),
(183, 239, 'apa serunya disana?', 'Berikut ini beberapa hal seru dan menarik tentang berkuliah di UNU Kaltim:\n\n**1. Suasana Kampus yang Nyaman**\n- Kampus terletak di Jl. APT. Pranoto, Samarinda Seberang dengan lingkungan yang asri\n- Suasana kampus yang kondusif untuk belajar dan berdiskusi\n\n**2. Komunitas yang Solid**\n- Mahasiswa berasal dari berbagai daerah di Kaltim dan luar Kaltim\n- Komunitas yang ramah dan solid dengan semangat kekeluargaan\n- Banyak kegiatan bersama antar mahasiswa lintas program studi\n\n**3. Kegiatan Kemahasiswaan yang Beragam**\n- Unit Kegiatan Mahasiswa (UKM) untuk pengembangan minat dan bakat\n- Organisasi intra kampus seperti BEM, DPM, dan HMPS\n- Kegiatan olahraga, seni, dan keagamaan\n- Seminar, workshop, dan kuliah umum dengan narasumber berkompeten\n\n**4. Lokasi Strategis**\n- Berada di Samarinda, ibu kota Kaltim\n- Mudah mengakses berbagai fasilitas kota\n- Banyak tempat kuliner dan wisata di sekitar kampus\n\n**5. Pendekatan Pendidikan yang Modern**\n- Kurikulum berbasis KKNI (Kerangka Kualifikasi Nasional Indonesia)\n- Metode pembelajaran yang interaktif dan berbasis teknologi\n- Dosen yang berkualifikasi dan berpengalaman\n\n**6. Nilai Keislaman yang Kuat**\n- Berlandaskan nilai Islam Ahlussunnah Wal Jamaah\n- Pembentukan karakter dan akhlak mulia\n- Kegiatan keagamaan yang rutin dilaksanakan\n\n**7. Biaya Terjangkau dengan Banyak Beasiswa**\n- Biaya pendidikan yang kompetitif\n- Banyak beasiswa tersedia seperti KIP-K dan GratisPol\n- Fasilitas kampus yang memadai\n\nIngin tahu lebih banyak tentang kehidupan kampus? Yuk, datang langsung ke UNU Kaltim atau hubungi panitia PMB untuk informasi lebih lengkap! 😊', 'openrouter', 'uvPyL6Uyv3PnRN6rGbB8Xm4uqKk9hZ0acCAYjyKQ', '114.9.25.126', 5289, 1, NULL, '2026-04-22 04:30:43', '2026-04-22 04:30:43'),
(184, 239, 'apakah boleh rambut panahang', 'Untuk aturan rambut panjang di UNU Kaltim:\n\n**Untuk Mahasiswa Pria:**\n- Secara umum, UNU Kaltim menerapkan aturan kerapian penampilan\n- Rambut panjang untuk mahasiswa pria **TIDAK DIBOLEHKAN** sesuai dengan aturan kampus\n- Rambut diharapkan rapi dan tidak menutupi telinga atau kemeja\n\n**Untuk Mahasiswa Wanita:**\n- Rambut panjang **DIBOLEHKAN**\n- Disarankan untuk diikat rapi\n- Sesuai dengan tata tertib mahasiswa UNU Kaltim\n\n**Tips:**\n- Selalu perhatikan tata tertib mahasiswa yang berlaku\n- Untuk kepastian, bisa ditanyakan langsung ke panitia PMB atau bagian kemahasiswaan\n- Penampilan yang rapi mencerminkan kedisiplinan dan profesionalisme\n\nJika kamu memiliki kebutuhan khusus terkait penampilan, sebaiknya diskusikan dengan pihak kampus sebelum mendaftar. 😊', 'openrouter', 'uvPyL6Uyv3PnRN6rGbB8Xm4uqKk9hZ0acCAYjyKQ', '103.80.83.17', 4142, 1, NULL, '2026-04-22 04:31:46', '2026-04-22 04:31:46'),
(185, 239, 'berapa cm mininmal rambut', 'Untuk aturan panjang rambut minimal di UNU Kaltim:\n\n**Untuk Mahasiswa Pria:**\n- Tidak ada aturan khusus tentang panjang minimal\n- Yang penting **TIDAK BOLEH PANJANG** (melebihi batas telinga atau kerah kemeja)\n- Rambut diharapkan pendek dan rapi\n\n**Untuk Mahasiswa Wanita:**\n- Tidak ada aturan khusus tentang panjang minimal\n- Rambut panjang **DIBOLEHKAN**\n- Disarankan untuk diikat rapi jika panjang\n\n**Intinya:**\n- **Pria:** Pendek dan rapi (tidak ada ukuran cm pasti, tapi jangan sampai panjang)\n- **Wanita:** Bebas panjangnya, asal rapi\n\n**Tips:**\n- Jika ragu, lebih baik konsultasikan langsung dengan panitia PMB\n- Tujuannya adalah menjaga kerapian dan kesopanan sesuai tata tertib kampus\n\nMau tanya lebih lanjut tentang aturan kampus lainnya? 😊', 'openrouter', 'uvPyL6Uyv3PnRN6rGbB8Xm4uqKk9hZ0acCAYjyKQ', '103.80.83.17', 3194, 1, NULL, '2026-04-22 04:32:30', '2026-04-22 04:32:30'),
(186, 239, 'apakah ada lift disana', 'Ya, UNU Kaltim **SUDAH MEMILIKI LIFT** di gedung kampusnya!\n\n**Fasilitas Lift di UNU Kaltim:**\n- Terdapat lift yang melayani mahasiswa dan dosen\n- Memudahkan akses antar lantai, terutama untuk:\n  - Mahasiswa berkebutuhan khusus\n  - Membawa barang berat\n  - Kenyamanan umum\n\n**Lokasi Lift:**\n- Gedung utama kampus UNU Kaltim\n- Berada di area strategis untuk akses mudah\n\n**Manfaat Lift:**\n- Mempermudah mobilitas mahasiswa\n- Memenuhi standar aksesibilitas kampus\n- Menunjang kenyamanan belajar-mengajar\n\nSelain lift, UNU Kaltim juga dilengkapi dengan berbagai fasilitas pendukung lainnya seperti ruang kelas ber-AC, laboratorium, perpustakaan, dan area parkir yang luas.\n\nMau tanya tentang fasilitas lainnya? 😊', 'openrouter', 'uvPyL6Uyv3PnRN6rGbB8Xm4uqKk9hZ0acCAYjyKQ', '103.80.83.17', 3012, 1, NULL, '2026-04-22 04:33:17', '2026-04-22 04:33:17'),
(187, NULL, 'Brpa biaya pendaftarannya , kuliah 1tahun lebih acara online kah ini', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'yxG83QjMgvXTu54aQ82PNKp5iGZJFbNcVhAJDGyb', '2001:448a:6102:d475:315f:1873:9eaa:8d95', 381, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-22 19:05:24', '2026-04-22 19:05:24'),
(188, 239, 'permisi', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'aE4LXm8zXpTwhmoMVm32UltIJUpvXzzi5VyBZPh6', '103.80.83.17', 336, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-22 19:20:51', '2026-04-22 19:20:51'),
(189, 239, 'misi', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'aE4LXm8zXpTwhmoMVm32UltIJUpvXzzi5VyBZPh6', '103.80.83.17', 47, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-22 19:21:01', '2026-04-22 19:21:01'),
(190, NULL, 'halo', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'YRUq0g5RMJ7EpnGtbN1AeJSoL4VyBm3JuaqRNXMx', '103.80.83.17', 61, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-22 19:21:42', '2026-04-22 19:21:42'),
(191, 239, 'cara isi ijasah gimana?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'gbhoabgRxpkuGEYjmCAewCmrb0HfTUTibozfuqCC', '103.80.83.17', 445, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-22 21:51:08', '2026-04-22 21:51:08'),
(192, NULL, 'Apakah ada sistem kuliah online', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'SYqSiw7rTiIcZ41TgsqnEoR8yk5pdlw4WDiAAIqj', '114.122.231.111', 399, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-22 23:21:51', '2026-04-22 23:21:51'),
(193, 239, 'halo', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'GGTHYQtdfhNI03dAvquR0UlGAih2806UNm3rpi0i', '114.9.25.126', 459, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-23 05:24:11', '2026-04-23 05:24:11'),
(194, 227, 'Permisi maksud dari pendaftaran ulang itu saya harus gimana ya', 'Gagal mendapatkan respons dari AI.', 'openrouter', '0roOHIEf1058y9qBqiKjYSwUrxTUiCZhc4jOc9pI', '182.8.162.67', 449, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-24 04:37:38', '2026-04-24 04:37:38'),
(195, 227, 'Maksud dari pendaftaran ulang itu gimana ya', 'Gagal mendapatkan respons dari AI.', 'openrouter', '0roOHIEf1058y9qBqiKjYSwUrxTUiCZhc4jOc9pI', '182.8.162.67', 31, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-24 04:38:00', '2026-04-24 04:38:00'),
(196, 227, 'Aneh', 'Gagal mendapatkan respons dari AI.', 'openrouter', '0roOHIEf1058y9qBqiKjYSwUrxTUiCZhc4jOc9pI', '182.8.162.67', 123, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-24 04:38:11', '2026-04-24 04:38:11'),
(197, 163, 'halo kak, saya udah daftar unu nih, infonya suru daftar ulang bayar 300rb, info dari saudara saya bisa kuliah gratis, apakah otomatis saya dapat beasiswa atau saya d awaal tetap bayar uang pangkal dan ukt', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'OOnTkGnGHalLwCedqnEYFpaV56mk65LMm04qZ85A', '182.8.179.91', 389, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-25 03:55:31', '2026-04-25 03:55:31'),
(198, 163, 'halo kak, saya udah daftar unu nih, infonya suru daftar ulang bayar 300rb, info dari saudara saya bisa kuliah gratis, apakah otomatis saya dapat beasiswa atau saya d awaal tetap bayar uang pangkal dan ukt', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'OOnTkGnGHalLwCedqnEYFpaV56mk65LMm04qZ85A', '182.8.179.91', 58, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-25 03:55:43', '2026-04-25 03:55:43'),
(199, 163, 'apakah otomatis saya dapat beasiswa atau saya d awaal tetap bayar uang pangkal dan ukt', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'OOnTkGnGHalLwCedqnEYFpaV56mk65LMm04qZ85A', '182.8.179.91', 51, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-25 03:56:04', '2026-04-25 03:56:04'),
(200, NULL, 'Hai', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'pJtIDpzYUX9lsXJFCkQPRB7nVcnBsMynRoyW10oD', '114.122.232.39', 457, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-26 23:10:21', '2026-04-26 23:10:21'),
(201, NULL, 'Halo', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'pJtIDpzYUX9lsXJFCkQPRB7nVcnBsMynRoyW10oD', '114.122.232.39', 63, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-26 23:10:28', '2026-04-26 23:10:28'),
(202, NULL, 'pendaftaran mahasiswa pindahan', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'yH8oB05TdOosorZIJBmCa9sCSchxAjuA45U7HEbn', '2404:c0:8ce0::78d:fa9b', 363, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-26 23:23:48', '2026-04-26 23:23:48'),
(203, 203, 'gimana tahap selanjutnya', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'fPiAW2TgrHc5NpP8mHOStPrEpscNA5dkfY1o8jgv', '182.8.162.29', 1618, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-27 05:39:10', '2026-04-27 05:39:10'),
(204, 221, 'proses selanjutnya apa ya', 'Gagal mendapatkan respons dari AI.', 'openrouter', 't9F26gUJgD56jZq4DNz7A5FG3PeTif9tqXLULy1U', '182.8.162.29', 45, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-27 05:40:06', '2026-04-27 05:40:06'),
(205, NULL, 'hallo kak', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'sCc1xW9jR66FFP7MvTIhl0TuiCOqHb4aQ9OQj8On', '2404:c0:8ce0::7a5:809c', 395, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-27 17:30:11', '2026-04-27 17:30:11'),
(206, NULL, 'untuk pendaftaran apa bisa langsung ke kampus?', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'sCc1xW9jR66FFP7MvTIhl0TuiCOqHb4aQ9OQj8On', '2404:c0:8ce0::7a5:809c', 45, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-27 17:30:32', '2026-04-27 17:30:32'),
(207, 163, 'Cara saya mengupload bukti pembayaran', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'kcCpD4hGLTwHxPIsD9ZedGkT4ziHWDOHNn8BPA44', '182.3.141.238', 1616, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-27 23:45:43', '2026-04-27 23:45:43'),
(208, 163, 'Cara upload bukti pembayaran', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'kcCpD4hGLTwHxPIsD9ZedGkT4ziHWDOHNn8BPA44', '182.3.141.238', 49, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-27 23:46:05', '2026-04-27 23:46:05'),
(209, 275, 'Berapa MB untuk ukuran foto kartu keluarga', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'Xn8TQgPWEK7bv0Y4Rd2H8UutiIjbsTA6SPDNl781', '182.3.138.71', 404, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-28 15:08:25', '2026-04-28 15:08:25'),
(210, 259, 'Ini kaya apa caranyaa', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'hiw8JFrhNetrx5AbHYFUjgYSewpdAAIRvCBjeoYP', '2404:c0:8cd0::7cc:3765', 420, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-28 22:38:49', '2026-04-28 22:38:49'),
(211, 259, 'Itu kaya apa cara nya', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'hiw8JFrhNetrx5AbHYFUjgYSewpdAAIRvCBjeoYP', '2404:c0:8cd0::7cc:3765', 31, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-28 22:39:06', '2026-04-28 22:39:06'),
(212, 259, 'Itu kapan', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'hiw8JFrhNetrx5AbHYFUjgYSewpdAAIRvCBjeoYP', '2404:c0:8cd0::7cc:3765', 28, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-28 22:39:24', '2026-04-28 22:39:24'),
(213, 259, 'Itu pendaftaran nya kaya apa', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'hiw8JFrhNetrx5AbHYFUjgYSewpdAAIRvCBjeoYP', '2404:c0:8cd0::7cc:3765', 42, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-28 22:39:43', '2026-04-28 22:39:43'),
(214, 251, 'Link daftar ulang nya ilang', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'XeR7dhS6TdrixXWlf5K600Br49tIOB5O18BZiWtS', '103.176.177.249', 422, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-29 04:36:00', '2026-04-29 04:36:00'),
(215, NULL, 'Berapa biaya ukt teknologi industri pertanian', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'p9j6heyhOYg4UgcallwmpeGH63wUnRA2h3AgATxP', '36.76.78.44', 389, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-29 07:42:55', '2026-04-29 07:42:55'),
(216, NULL, 'Berapa biaya pendaftaran nya', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'p9j6heyhOYg4UgcallwmpeGH63wUnRA2h3AgATxP', '36.76.78.44', 33, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-29 07:43:11', '2026-04-29 07:43:11'),
(217, 277, 'Betulan gratis pol kah', 'Gagal mendapatkan respons dari AI.', 'openrouter', 'P7lYSZLAi6sCaQKyJ5BLvZaxCbOHNZ6c0imyS3CR', '2404:c0:c601:4321:2db8:639e:ffed:e088', 526, 0, '{\"error\":{\"message\":\"No endpoints found for arcee-ai/trinity-large-preview:free.\",\"code\":404},\"user_id\":\"user_37US5MKmNfP2PXDKAwZ2eab5uev\"}', '2026-04-29 23:29:52', '2026-04-29 23:29:52');

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
(17, 7, 17, 'biodata', 'approved', NULL, '2026-03-03 00:01:13', 0, '2025-12-26 03:58:56', '2026-03-03 00:01:13'),
(18, 7, 17, 'photo', 'approved', NULL, '2026-03-03 00:01:13', 0, '2025-12-26 03:58:56', '2026-03-03 00:01:13'),
(19, 7, 17, 'ktp', 'approved', NULL, '2026-03-03 00:01:13', 0, '2025-12-26 03:58:56', '2026-03-03 00:01:13'),
(20, 7, 17, 'kk', 'approved', NULL, '2026-03-03 00:01:13', 0, '2025-12-26 03:58:56', '2026-03-03 00:01:13'),
(21, 7, 17, 'certificate', 'approved', NULL, '2026-03-03 00:01:13', 0, '2025-12-26 03:58:56', '2026-03-03 00:01:13'),
(22, 8, 17, 'biodata', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(23, 8, 17, 'photo', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(24, 8, 17, 'ktp', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(25, 8, 17, 'kk', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(26, 8, 17, 'certificate', 'approved', NULL, '2026-01-02 14:35:23', 0, '2025-12-26 03:58:56', '2026-01-02 14:35:23'),
(27, 9, 17, 'biodata', 'approved', NULL, '2026-02-01 23:15:45', 0, '2025-12-26 03:58:56', '2026-02-01 23:15:45'),
(28, 9, 17, 'photo', 'approved', NULL, '2026-02-01 23:15:45', 0, '2025-12-26 03:58:56', '2026-02-01 23:15:45'),
(29, 9, 17, 'ktp', 'approved', NULL, '2026-02-01 23:15:45', 0, '2025-12-26 03:58:56', '2026-02-01 23:15:45'),
(30, 9, 17, 'kk', 'approved', NULL, '2026-02-01 23:15:45', 0, '2025-12-26 03:58:56', '2026-02-01 23:15:45'),
(31, 9, 17, 'certificate', 'approved', NULL, '2026-02-01 23:15:45', 0, '2025-12-26 03:58:56', '2026-02-01 23:15:45'),
(32, 10, 17, 'biodata', 'approved', NULL, '2026-02-25 23:32:16', 0, '2025-12-26 03:58:56', '2026-02-25 23:32:16'),
(33, 10, 17, 'photo', 'approved', NULL, '2026-02-25 23:32:16', 0, '2025-12-26 03:58:56', '2026-02-25 23:32:16'),
(34, 10, 17, 'ktp', 'approved', NULL, '2026-02-25 23:32:16', 0, '2025-12-26 03:58:56', '2026-02-25 23:32:16'),
(35, 10, 17, 'kk', 'approved', NULL, '2026-02-25 23:32:16', 0, '2025-12-26 03:58:56', '2026-02-25 23:32:16'),
(36, 10, 17, 'certificate', 'approved', NULL, '2026-02-25 23:32:16', 0, '2025-12-26 03:58:56', '2026-02-25 23:32:16'),
(37, 11, 17, 'biodata', 'approved', NULL, '2026-04-28 01:17:40', 0, '2025-12-26 03:58:56', '2026-04-28 01:17:40'),
(38, 11, 17, 'photo', 'approved', NULL, '2026-04-28 01:17:40', 0, '2025-12-26 03:58:56', '2026-04-28 01:17:40'),
(39, 11, 17, 'ktp', 'approved', NULL, '2026-04-28 01:17:40', 0, '2025-12-26 03:58:56', '2026-04-28 01:17:40'),
(40, 11, 17, 'kk', 'approved', NULL, '2026-04-28 01:17:40', 0, '2025-12-26 03:58:56', '2026-04-28 01:17:40'),
(41, 11, 17, 'certificate', 'approved', NULL, '2026-04-28 01:17:40', 0, '2025-12-26 03:58:56', '2026-04-28 01:17:40'),
(42, 12, 17, 'biodata', 'approved', NULL, '2026-02-02 00:10:50', 0, '2025-12-26 03:58:56', '2026-02-02 00:10:50'),
(43, 12, 17, 'photo', 'approved', NULL, '2026-02-02 00:10:50', 0, '2025-12-26 03:58:56', '2026-02-02 00:10:50'),
(44, 12, 17, 'ktp', 'approved', NULL, '2026-02-02 00:10:50', 0, '2025-12-26 03:58:56', '2026-02-02 00:10:50'),
(45, 12, 17, 'kk', 'approved', NULL, '2026-02-02 00:10:50', 0, '2025-12-26 03:58:56', '2026-02-02 00:10:50'),
(46, 12, 17, 'certificate', 'approved', NULL, '2026-02-02 00:10:50', 0, '2025-12-26 03:58:56', '2026-02-02 00:10:50'),
(47, 13, 17, 'biodata', 'approved', NULL, '2026-02-01 23:30:25', 0, '2025-12-26 03:58:56', '2026-02-01 23:30:25'),
(48, 13, 17, 'photo', 'approved', NULL, '2026-02-01 23:30:25', 0, '2025-12-26 03:58:56', '2026-02-01 23:30:25'),
(49, 13, 17, 'ktp', 'approved', NULL, '2026-02-01 23:30:25', 0, '2025-12-26 03:58:56', '2026-02-01 23:30:25'),
(50, 13, 17, 'kk', 'approved', NULL, '2026-02-01 23:30:25', 0, '2025-12-26 03:58:56', '2026-02-01 23:30:25'),
(51, 13, 17, 'certificate', 'approved', NULL, '2026-02-01 23:30:25', 0, '2025-12-26 03:58:56', '2026-02-01 23:30:25'),
(52, 14, 17, 'biodata', 'approved', NULL, '2026-02-01 23:27:01', 0, '2025-12-26 03:58:56', '2026-02-01 23:27:01'),
(53, 14, 17, 'photo', 'approved', NULL, '2026-02-01 23:27:01', 0, '2025-12-26 03:58:56', '2026-02-01 23:27:01'),
(54, 14, 17, 'ktp', 'approved', NULL, '2026-02-01 23:27:01', 0, '2025-12-26 03:58:56', '2026-02-01 23:27:01'),
(55, 14, 17, 'kk', 'approved', NULL, '2026-02-01 23:27:01', 0, '2025-12-26 03:58:56', '2026-02-01 23:27:01'),
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
(76, 21, NULL, 'biodata', 'pending', NULL, NULL, 0, '2025-12-26 03:58:56', '2026-04-13 22:17:08'),
(77, 21, 17, 'photo', 'approved', NULL, '2026-04-13 02:55:22', 0, '2025-12-26 03:58:56', '2026-04-13 02:55:22'),
(78, 21, 17, 'ktp', 'approved', NULL, '2026-04-13 02:55:22', 0, '2025-12-26 03:58:56', '2026-04-13 02:55:22'),
(79, 21, 17, 'kk', 'approved', NULL, '2026-04-13 02:55:22', 0, '2025-12-26 03:58:56', '2026-04-13 02:55:22'),
(80, 21, 17, 'certificate', 'approved', NULL, '2026-04-13 02:55:22', 0, '2025-12-26 03:58:56', '2026-04-13 02:55:22'),
(81, 22, 17, 'biodata', 'approved', NULL, '2026-03-25 21:11:14', 0, '2025-12-26 03:58:56', '2026-03-25 21:11:14'),
(82, 22, 17, 'photo', 'approved', NULL, '2026-03-25 21:11:14', 0, '2025-12-26 03:58:56', '2026-03-25 21:11:14'),
(83, 22, 17, 'ktp', 'approved', NULL, '2026-03-25 21:11:14', 0, '2025-12-26 03:58:56', '2026-03-25 21:11:14'),
(84, 22, 17, 'kk', 'approved', NULL, '2026-03-25 21:11:14', 0, '2025-12-26 03:58:56', '2026-03-25 21:11:14'),
(85, 22, 17, 'certificate', 'approved', NULL, '2026-03-25 21:11:14', 0, '2025-12-26 03:58:56', '2026-03-25 21:11:14'),
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
(100, 29, 17, 'biodata', 'approved', NULL, '2026-03-29 22:54:41', 0, '2026-01-01 13:34:48', '2026-03-29 22:54:41'),
(101, 29, 17, 'photo', 'approved', NULL, '2026-03-29 22:54:41', 0, '2026-01-01 13:34:48', '2026-03-29 22:54:41'),
(102, 29, 17, 'ktp', 'approved', NULL, '2026-03-29 22:54:41', 0, '2026-01-01 13:34:48', '2026-03-29 22:54:41'),
(103, 29, 17, 'kk', 'approved', NULL, '2026-03-29 22:54:41', 0, '2026-01-01 13:34:48', '2026-03-29 22:54:41'),
(104, 29, 17, 'certificate', 'approved', NULL, '2026-03-29 22:54:41', 0, '2026-01-01 13:34:48', '2026-03-29 22:54:41'),
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
(115, 33, 17, 'biodata', 'approved', NULL, '2026-02-01 23:36:56', 0, '2026-01-04 13:38:57', '2026-02-01 23:36:56'),
(116, 33, 17, 'photo', 'approved', NULL, '2026-02-01 23:36:56', 0, '2026-01-04 13:38:57', '2026-02-01 23:36:56'),
(117, 33, 17, 'ktp', 'approved', NULL, '2026-02-01 23:36:56', 0, '2026-01-04 13:38:57', '2026-02-01 23:36:56'),
(118, 33, 17, 'kk', 'approved', NULL, '2026-02-01 23:36:56', 0, '2026-01-04 13:38:57', '2026-02-01 23:36:56'),
(119, 33, 17, 'certificate', 'approved', NULL, '2026-02-01 23:36:56', 0, '2026-01-04 13:38:57', '2026-02-01 23:36:56'),
(120, 34, 17, 'photo', 'approved', NULL, '2026-02-02 00:22:41', 0, '2026-01-05 13:37:56', '2026-02-02 00:22:41'),
(121, 34, 17, 'ktp', 'approved', NULL, '2026-02-02 00:22:41', 0, '2026-01-05 13:37:56', '2026-02-02 00:22:41'),
(122, 34, 17, 'kk', 'approved', NULL, '2026-02-02 00:22:41', 0, '2026-01-05 13:37:56', '2026-02-02 00:22:41'),
(123, 34, 17, 'certificate', 'approved', NULL, '2026-02-02 00:22:41', 0, '2026-01-05 13:37:56', '2026-02-02 00:22:41'),
(124, 34, 17, 'biodata', 'approved', NULL, '2026-02-02 00:22:41', 0, '2026-01-05 13:37:56', '2026-02-02 00:22:41'),
(125, 37, 17, 'biodata', 'approved', NULL, '2026-02-01 23:51:06', 0, '2026-01-06 16:01:33', '2026-02-01 23:51:06'),
(126, 37, 17, 'photo', 'approved', NULL, '2026-02-01 23:51:06', 0, '2026-01-06 16:01:33', '2026-02-01 23:51:06'),
(127, 37, 17, 'ktp', 'approved', NULL, '2026-02-01 23:51:06', 0, '2026-01-06 16:01:33', '2026-02-01 23:51:06'),
(128, 37, 17, 'kk', 'approved', NULL, '2026-02-01 23:51:06', 0, '2026-01-06 16:01:33', '2026-02-01 23:51:06'),
(129, 37, 17, 'certificate', 'approved', NULL, '2026-02-01 23:51:06', 0, '2026-01-06 16:01:33', '2026-02-01 23:51:06'),
(130, 38, 17, 'biodata', 'approved', NULL, '2026-03-29 21:06:39', 0, '2026-01-07 00:14:43', '2026-03-29 21:06:39'),
(131, 38, 17, 'photo', 'approved', NULL, '2026-03-29 21:06:39', 0, '2026-01-07 00:14:43', '2026-03-29 21:06:39'),
(132, 38, 17, 'ktp', 'approved', NULL, '2026-03-29 21:06:39', 0, '2026-01-07 00:14:43', '2026-03-29 21:06:39'),
(133, 38, 17, 'kk', 'approved', NULL, '2026-03-29 21:06:39', 0, '2026-01-07 00:14:43', '2026-03-29 21:06:39'),
(134, 38, 17, 'certificate', 'approved', NULL, '2026-03-29 21:06:39', 0, '2026-01-07 00:14:43', '2026-03-29 21:06:39'),
(135, 39, 17, 'photo', 'approved', NULL, '2026-03-11 01:56:15', 0, '2026-01-07 17:43:19', '2026-03-11 01:56:15'),
(136, 39, 17, 'ktp', 'approved', NULL, '2026-03-11 01:56:15', 0, '2026-01-07 17:43:19', '2026-03-11 01:56:15'),
(137, 39, 17, 'kk', 'approved', NULL, '2026-03-11 01:56:15', 0, '2026-01-07 17:43:19', '2026-03-11 01:56:15'),
(138, 39, 17, 'certificate', 'approved', NULL, '2026-03-11 01:56:15', 0, '2026-01-07 17:43:19', '2026-03-11 01:56:15'),
(139, 39, 17, 'biodata', 'approved', NULL, '2026-03-11 01:56:15', 0, '2026-01-07 17:43:19', '2026-03-11 01:56:15'),
(140, 27, 17, 'photo', 'approved', NULL, '2026-02-02 00:28:58', 0, '2026-01-09 04:21:45', '2026-02-02 00:28:58'),
(141, 27, 17, 'ktp', 'approved', NULL, '2026-02-02 00:28:58', 0, '2026-01-09 04:21:45', '2026-02-02 00:28:58'),
(142, 27, 17, 'kk', 'approved', NULL, '2026-02-02 00:28:58', 0, '2026-01-09 04:21:45', '2026-02-02 00:28:58'),
(143, 27, 17, 'biodata', 'approved', NULL, '2026-02-02 00:28:58', 0, '2026-01-09 04:21:45', '2026-02-02 00:28:58'),
(144, 35, 17, 'photo', 'approved', NULL, '2026-03-30 23:55:58', 0, '2026-01-09 16:16:30', '2026-03-30 23:55:58'),
(145, 35, 17, 'ktp', 'approved', NULL, '2026-03-30 23:55:58', 0, '2026-01-09 16:16:30', '2026-03-30 23:55:58'),
(146, 35, 17, 'kk', 'approved', NULL, '2026-03-30 23:55:58', 0, '2026-01-09 16:16:30', '2026-03-30 23:55:58'),
(147, 35, 17, 'certificate', 'approved', NULL, '2026-03-30 23:55:58', 0, '2026-01-09 16:16:30', '2026-03-30 23:55:58'),
(148, 35, 17, 'biodata', 'approved', NULL, '2026-03-30 23:55:58', 0, '2026-01-09 16:16:30', '2026-03-30 23:55:58'),
(149, 42, 17, 'photo', 'approved', NULL, '2026-04-06 06:14:49', 0, '2026-01-09 19:25:31', '2026-04-06 06:14:49'),
(150, 42, 17, 'ktp', 'approved', NULL, '2026-04-06 06:14:49', 0, '2026-01-09 19:25:31', '2026-04-06 06:14:49'),
(151, 42, 17, 'kk', 'approved', NULL, '2026-04-06 06:14:49', 0, '2026-01-09 19:25:31', '2026-04-06 06:14:49'),
(152, 42, 17, 'biodata', 'approved', NULL, '2026-04-06 06:14:49', 0, '2026-01-09 19:25:31', '2026-04-06 06:14:49'),
(153, 41, 17, 'photo', 'approved', NULL, '2026-03-12 02:45:14', 0, '2026-01-09 19:31:03', '2026-03-12 02:45:14'),
(154, 41, 17, 'ktp', 'approved', NULL, '2026-03-12 02:45:14', 0, '2026-01-09 19:31:03', '2026-03-12 02:45:14'),
(155, 41, 17, 'kk', 'approved', NULL, '2026-03-12 02:45:14', 0, '2026-01-09 19:31:03', '2026-03-12 02:45:14'),
(156, 41, 17, 'certificate', 'approved', NULL, '2026-03-12 02:45:14', 0, '2026-01-09 19:31:03', '2026-03-12 02:45:14'),
(157, 41, 17, 'biodata', 'approved', NULL, '2026-03-12 02:45:14', 0, '2026-01-09 19:31:03', '2026-03-12 02:45:14'),
(166, 47, 17, 'biodata', 'approved', NULL, '2026-02-02 00:52:49', 0, '2026-01-09 23:19:36', '2026-02-02 00:52:49'),
(167, 47, 17, 'photo', 'approved', NULL, '2026-02-02 00:52:49', 0, '2026-01-09 23:19:36', '2026-02-02 00:52:49'),
(168, 47, 17, 'ktp', 'approved', NULL, '2026-02-02 00:52:49', 0, '2026-01-09 23:19:36', '2026-02-02 00:52:49'),
(169, 47, 17, 'kk', 'approved', NULL, '2026-02-02 00:52:49', 0, '2026-01-09 23:19:36', '2026-02-02 00:52:49'),
(170, 47, 17, 'certificate', 'approved', NULL, '2026-02-02 00:52:49', 0, '2026-01-09 23:19:36', '2026-02-02 00:52:49'),
(171, 49, 17, 'photo', 'approved', NULL, '2026-03-30 23:53:01', 0, '2026-01-10 00:58:57', '2026-03-30 23:53:01'),
(172, 49, 17, 'ktp', 'approved', NULL, '2026-03-30 23:53:01', 0, '2026-01-10 00:58:57', '2026-03-30 23:53:01'),
(173, 49, 17, 'kk', 'approved', NULL, '2026-03-30 23:53:01', 0, '2026-01-10 00:58:57', '2026-03-30 23:53:01'),
(174, 49, 17, 'certificate', 'approved', NULL, '2026-03-30 23:53:01', 0, '2026-01-10 00:58:57', '2026-03-30 23:53:01'),
(175, 49, 17, 'biodata', 'approved', NULL, '2026-03-30 23:53:01', 0, '2026-01-10 00:58:57', '2026-03-30 23:53:01'),
(176, 50, 17, 'photo', 'approved', NULL, '2026-03-30 11:38:52', 0, '2026-01-10 23:03:22', '2026-03-30 11:38:52'),
(177, 50, 17, 'ktp', 'approved', NULL, '2026-03-30 11:38:52', 0, '2026-01-10 23:03:22', '2026-03-30 11:38:52'),
(178, 50, 17, 'kk', 'approved', NULL, '2026-03-30 11:38:52', 0, '2026-01-10 23:03:22', '2026-03-30 11:38:52'),
(179, 50, 17, 'certificate', 'approved', NULL, '2026-03-30 11:38:52', 0, '2026-01-10 23:03:22', '2026-03-30 11:38:52'),
(180, 50, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-10 23:03:22', '2026-03-31 00:09:05'),
(181, 54, 17, 'photo', 'approved', NULL, '2026-04-01 05:01:47', 0, '2026-01-11 01:44:25', '2026-04-01 05:01:47'),
(182, 54, 17, 'ktp', 'approved', NULL, '2026-04-01 05:01:47', 0, '2026-01-11 01:44:25', '2026-04-01 05:01:47'),
(183, 54, 17, 'kk', 'approved', NULL, '2026-04-01 05:01:47', 0, '2026-01-11 01:44:25', '2026-04-01 05:01:47'),
(184, 54, 17, 'biodata', 'approved', NULL, '2026-04-01 05:01:47', 0, '2026-01-11 01:44:25', '2026-04-01 05:01:47'),
(185, 57, 17, 'photo', 'approved', NULL, '2026-02-02 01:05:37', 0, '2026-01-11 20:00:59', '2026-02-02 01:05:37'),
(186, 57, 17, 'ktp', 'approved', NULL, '2026-02-02 01:05:37', 0, '2026-01-11 20:00:59', '2026-02-02 01:05:37'),
(187, 57, 17, 'kk', 'approved', NULL, '2026-02-02 01:05:37', 0, '2026-01-11 20:00:59', '2026-02-02 01:05:37'),
(188, 57, 17, 'certificate', 'approved', NULL, '2026-02-02 01:05:37', 0, '2026-01-11 20:00:59', '2026-02-02 01:05:37'),
(189, 57, 17, 'biodata', 'approved', NULL, '2026-02-02 01:05:37', 0, '2026-01-11 20:00:59', '2026-02-02 01:05:37'),
(190, 58, 17, 'photo', 'approved', NULL, '2026-03-31 00:16:06', 0, '2026-01-12 05:59:14', '2026-03-31 00:16:06'),
(191, 58, 17, 'ktp', 'approved', NULL, '2026-03-31 00:16:06', 0, '2026-01-12 05:59:14', '2026-03-31 00:16:06'),
(192, 58, 17, 'kk', 'approved', NULL, '2026-03-31 00:16:06', 0, '2026-01-12 05:59:14', '2026-03-31 00:16:06'),
(193, 58, 17, 'certificate', 'approved', NULL, '2026-03-31 00:16:06', 0, '2026-01-12 05:59:14', '2026-03-31 00:16:06'),
(194, 58, 17, 'biodata', 'approved', NULL, '2026-03-31 00:16:06', 0, '2026-01-12 05:59:14', '2026-03-31 00:16:06'),
(195, 56, 17, 'photo', 'approved', NULL, '2026-02-02 01:09:59', 0, '2026-01-13 03:55:10', '2026-02-02 01:09:59'),
(196, 56, 17, 'ktp', 'approved', NULL, '2026-02-02 01:09:59', 0, '2026-01-13 03:55:10', '2026-02-02 01:09:59'),
(197, 56, 17, 'kk', 'approved', NULL, '2026-02-02 01:09:59', 0, '2026-01-13 03:55:10', '2026-02-02 01:09:59'),
(198, 56, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-13 03:55:10', '2026-03-06 00:46:34'),
(199, 63, 17, 'photo', 'approved', NULL, '2026-02-02 01:12:57', 0, '2026-01-14 02:03:39', '2026-02-02 01:12:57'),
(200, 63, 17, 'ktp', 'approved', NULL, '2026-02-02 01:12:57', 0, '2026-01-14 02:03:39', '2026-02-02 01:12:57'),
(201, 63, 17, 'kk', 'approved', NULL, '2026-02-02 01:12:57', 0, '2026-01-14 02:03:39', '2026-02-02 01:12:57'),
(202, 63, 17, 'certificate', 'approved', NULL, '2026-02-02 01:12:57', 0, '2026-01-14 02:03:39', '2026-02-02 01:12:57'),
(203, 63, 17, 'biodata', 'approved', NULL, '2026-02-02 01:12:57', 0, '2026-01-14 02:03:39', '2026-02-02 01:12:57'),
(204, 65, 1, 'photo', 'approved', NULL, '2026-01-15 01:04:06', 0, '2026-01-14 22:05:25', '2026-01-15 01:04:06'),
(205, 65, 1, 'ktp', 'approved', NULL, '2026-01-15 01:04:06', 0, '2026-01-14 22:05:25', '2026-01-15 01:04:06'),
(206, 65, 1, 'kk', 'approved', NULL, '2026-01-15 01:04:06', 0, '2026-01-14 22:05:25', '2026-01-15 01:04:06'),
(207, 65, 1, 'certificate', 'approved', NULL, '2026-01-15 01:04:06', 0, '2026-01-14 22:05:25', '2026-01-15 01:04:06'),
(208, 65, 1, 'biodata', 'approved', NULL, '2026-01-15 01:04:06', 0, '2026-01-14 22:05:25', '2026-01-15 01:04:06'),
(209, 66, 17, 'biodata', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(210, 66, 17, 'photo', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(211, 66, 17, 'ktp', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(212, 66, 17, 'kk', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(213, 66, 17, 'certificate', 'approved', NULL, '2026-01-14 23:06:40', 0, '2026-01-14 22:29:49', '2026-01-14 23:06:40'),
(214, 67, 17, 'photo', 'approved', NULL, '2026-02-02 20:56:20', 0, '2026-01-15 05:19:40', '2026-02-02 20:56:20'),
(215, 67, 17, 'ktp', 'approved', NULL, '2026-02-02 20:56:20', 0, '2026-01-15 05:19:40', '2026-02-02 20:56:20'),
(216, 67, 17, 'kk', 'approved', NULL, '2026-02-02 20:56:20', 0, '2026-01-15 05:19:40', '2026-02-02 20:56:20'),
(217, 67, 17, 'certificate', 'approved', NULL, '2026-02-02 20:56:20', 0, '2026-01-15 05:19:40', '2026-02-02 20:56:20'),
(218, 67, 17, 'biodata', 'approved', NULL, '2026-02-02 20:56:20', 0, '2026-01-15 05:19:40', '2026-02-02 20:56:20'),
(219, 40, 17, 'photo', 'approved', NULL, '2026-03-25 21:56:39', 0, '2026-01-16 00:04:38', '2026-03-25 21:56:39'),
(220, 40, 17, 'ktp', 'approved', NULL, '2026-03-25 21:56:39', 0, '2026-01-16 00:04:38', '2026-03-25 21:56:39'),
(221, 40, 17, 'kk', 'approved', NULL, '2026-03-25 21:56:39', 0, '2026-01-16 00:04:38', '2026-03-25 21:56:39'),
(222, 40, 17, 'biodata', 'approved', NULL, '2026-03-25 21:56:39', 0, '2026-01-16 00:04:38', '2026-03-25 21:56:39'),
(223, 40, 17, 'certificate', 'approved', NULL, '2026-03-25 21:56:39', 0, '2026-01-16 00:19:41', '2026-03-25 21:56:39'),
(224, 69, 24, 'photo', 'approved', NULL, '2026-01-27 20:51:20', 0, '2026-01-16 09:59:07', '2026-01-27 20:51:20'),
(225, 69, 24, 'ktp', 'approved', NULL, '2026-01-27 20:51:20', 0, '2026-01-16 09:59:07', '2026-01-27 20:51:20'),
(226, 69, 24, 'kk', 'approved', NULL, '2026-01-27 20:51:20', 0, '2026-01-16 09:59:07', '2026-01-27 20:51:20'),
(227, 69, 24, 'certificate', 'approved', NULL, '2026-01-27 20:51:20', 0, '2026-01-16 09:59:07', '2026-01-27 20:51:20'),
(228, 69, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-16 09:59:07', '2026-04-06 06:25:53'),
(229, 70, 24, 'photo', 'approved', NULL, '2026-01-27 20:57:43', 0, '2026-01-19 23:18:23', '2026-01-27 20:57:43'),
(230, 70, 24, 'ktp', 'approved', NULL, '2026-01-27 20:57:43', 0, '2026-01-19 23:18:23', '2026-01-27 20:57:43'),
(231, 70, 24, 'kk', 'approved', NULL, '2026-01-27 20:57:43', 0, '2026-01-19 23:18:23', '2026-01-27 20:57:43'),
(232, 70, 24, 'certificate', 'approved', NULL, '2026-01-27 20:57:43', 0, '2026-01-19 23:18:23', '2026-01-27 20:57:43'),
(233, 70, 24, 'biodata', 'approved', NULL, '2026-01-27 20:57:43', 0, '2026-01-19 23:18:23', '2026-01-27 20:57:43'),
(234, 82, 17, 'biodata', 'approved', NULL, '2026-02-02 21:04:22', 0, '2026-01-25 23:13:17', '2026-02-02 21:04:22'),
(235, 82, 17, 'photo', 'approved', NULL, '2026-02-02 21:04:22', 0, '2026-01-25 23:13:17', '2026-02-02 21:04:22'),
(236, 82, 17, 'ktp', 'approved', NULL, '2026-02-02 21:04:22', 0, '2026-01-25 23:13:17', '2026-02-02 21:04:22'),
(237, 82, 17, 'kk', 'approved', NULL, '2026-02-02 21:04:22', 0, '2026-01-25 23:13:17', '2026-02-02 21:04:22'),
(238, 82, 17, 'certificate', 'approved', NULL, '2026-02-02 21:04:22', 0, '2026-01-25 23:13:17', '2026-02-02 21:04:22'),
(239, 83, 17, 'biodata', 'approved', NULL, '2026-02-02 21:05:40', 0, '2026-01-26 00:57:41', '2026-02-02 21:05:40'),
(240, 83, 17, 'photo', 'approved', NULL, '2026-02-02 21:05:40', 0, '2026-01-26 00:57:41', '2026-02-02 21:05:40'),
(241, 83, 17, 'ktp', 'approved', NULL, '2026-02-02 21:05:40', 0, '2026-01-26 00:57:41', '2026-02-02 21:05:40'),
(242, 83, 17, 'kk', 'approved', NULL, '2026-02-02 21:05:40', 0, '2026-01-26 00:57:41', '2026-02-02 21:05:40'),
(243, 83, 17, 'certificate', 'approved', NULL, '2026-02-02 21:05:40', 0, '2026-01-26 00:57:41', '2026-02-02 21:05:40'),
(244, 73, 17, 'photo', 'approved', NULL, '2026-03-01 21:24:59', 0, '2026-01-26 08:14:33', '2026-03-01 21:24:59'),
(245, 73, 17, 'ktp', 'approved', NULL, '2026-03-01 21:24:59', 0, '2026-01-26 08:14:33', '2026-03-01 21:24:59'),
(246, 73, 17, 'kk', 'approved', NULL, '2026-03-01 21:24:59', 0, '2026-01-26 08:14:33', '2026-03-01 21:24:59'),
(247, 73, 17, 'biodata', 'approved', NULL, '2026-03-01 21:24:59', 0, '2026-01-26 08:14:33', '2026-03-01 21:24:59'),
(248, 85, 17, 'biodata', 'approved', NULL, '2026-02-02 21:12:15', 0, '2026-01-26 21:07:01', '2026-02-02 21:12:15'),
(249, 85, 17, 'photo', 'approved', NULL, '2026-02-02 21:12:15', 0, '2026-01-26 21:07:01', '2026-02-02 21:12:15'),
(250, 85, 17, 'ktp', 'approved', NULL, '2026-02-02 21:12:15', 0, '2026-01-26 21:07:01', '2026-02-02 21:12:15'),
(251, 85, 17, 'kk', 'approved', NULL, '2026-02-02 21:12:15', 0, '2026-01-26 21:07:01', '2026-02-02 21:12:15'),
(252, 85, 17, 'certificate', 'approved', NULL, '2026-02-02 21:12:15', 0, '2026-01-26 21:07:01', '2026-02-02 21:12:15'),
(253, 86, 17, 'biodata', 'approved', NULL, '2026-04-01 05:04:18', 0, '2026-01-27 00:27:44', '2026-04-01 05:04:18'),
(254, 86, 17, 'photo', 'approved', NULL, '2026-04-01 05:04:18', 0, '2026-01-27 00:27:44', '2026-04-01 05:04:18'),
(255, 86, 17, 'ktp', 'approved', NULL, '2026-04-01 05:04:18', 0, '2026-01-27 00:27:44', '2026-04-01 05:04:18'),
(256, 86, 17, 'kk', 'approved', NULL, '2026-04-01 05:04:18', 0, '2026-01-27 00:27:44', '2026-04-01 05:04:18'),
(257, 86, 17, 'certificate', 'approved', NULL, '2026-04-01 05:04:18', 0, '2026-01-27 00:27:44', '2026-04-01 05:04:18'),
(258, 87, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-01-27 00:32:38', '2026-04-14 00:30:48'),
(259, 87, 24, 'photo', 'approved', NULL, '2026-01-27 21:05:09', 0, '2026-01-27 00:32:38', '2026-01-27 21:05:09'),
(260, 87, 24, 'ktp', 'approved', NULL, '2026-01-27 21:05:09', 0, '2026-01-27 00:32:38', '2026-01-27 21:05:09'),
(261, 87, 24, 'kk', 'approved', NULL, '2026-01-27 21:05:09', 0, '2026-01-27 00:32:38', '2026-01-27 21:05:09'),
(262, 87, 24, 'certificate', 'approved', NULL, '2026-01-27 21:05:09', 0, '2026-01-27 00:32:38', '2026-01-27 21:05:09'),
(263, 71, 17, 'photo', 'approved', NULL, '2026-04-01 05:07:18', 0, '2026-01-27 01:08:41', '2026-04-01 05:07:18'),
(264, 71, 17, 'ktp', 'approved', NULL, '2026-04-01 05:07:18', 0, '2026-01-27 01:08:41', '2026-04-01 05:07:18'),
(265, 71, 17, 'kk', 'approved', NULL, '2026-04-01 05:07:18', 0, '2026-01-27 01:08:41', '2026-04-01 05:07:18'),
(266, 71, 17, 'biodata', 'approved', NULL, '2026-04-01 05:07:18', 0, '2026-01-27 01:08:41', '2026-04-01 05:07:18'),
(267, 89, 17, 'biodata', 'approved', NULL, '2026-03-12 01:18:41', 0, '2026-01-27 01:50:02', '2026-03-12 01:18:41'),
(268, 89, 17, 'photo', 'approved', NULL, '2026-03-12 01:18:41', 0, '2026-01-27 01:50:02', '2026-03-12 01:18:41'),
(269, 89, 17, 'ktp', 'approved', NULL, '2026-03-12 01:18:41', 0, '2026-01-27 01:50:02', '2026-03-12 01:18:41'),
(270, 89, 17, 'kk', 'approved', NULL, '2026-03-12 01:18:41', 0, '2026-01-27 01:50:02', '2026-03-12 01:18:41'),
(271, 89, 17, 'certificate', 'approved', NULL, '2026-03-12 01:18:41', 0, '2026-01-27 01:50:02', '2026-03-12 01:18:41'),
(272, 94, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-02-01 21:35:04', '2026-04-23 01:02:13'),
(273, 94, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-02-01 21:35:04', '2026-04-23 01:02:13'),
(274, 94, 17, 'ktp', 'approved', NULL, '2026-04-01 04:59:21', 0, '2026-02-01 21:35:04', '2026-04-01 04:59:21'),
(275, 94, 17, 'kk', 'approved', NULL, '2026-04-01 04:59:21', 0, '2026-02-01 21:35:04', '2026-04-01 04:59:21'),
(276, 94, 17, 'certificate', 'approved', NULL, '2026-04-01 04:59:21', 0, '2026-02-01 21:35:04', '2026-04-01 04:59:21'),
(277, 95, 17, 'biodata', 'approved', NULL, '2026-03-27 20:12:05', 0, '2026-02-01 23:06:54', '2026-03-27 20:12:05'),
(278, 95, 17, 'photo', 'approved', NULL, '2026-03-27 20:12:05', 0, '2026-02-01 23:06:54', '2026-03-27 20:12:05'),
(279, 95, 17, 'ktp', 'approved', NULL, '2026-03-27 20:12:05', 0, '2026-02-01 23:06:54', '2026-03-27 20:12:06'),
(280, 95, 17, 'kk', 'approved', NULL, '2026-03-27 20:12:06', 0, '2026-02-01 23:06:54', '2026-03-27 20:12:06'),
(281, 95, 17, 'certificate', 'approved', NULL, '2026-03-27 20:12:06', 0, '2026-02-01 23:06:54', '2026-03-27 20:12:06'),
(282, 56, 17, 'certificate', 'approved', NULL, '2026-02-02 01:09:59', 0, '2026-02-02 01:09:07', '2026-02-02 01:09:59'),
(288, 96, 17, 'photo', 'approved', NULL, '2026-04-15 19:43:05', 0, '2026-02-02 20:14:39', '2026-04-15 19:43:05'),
(289, 96, 17, 'ktp', 'approved', NULL, '2026-04-15 19:43:05', 0, '2026-02-02 20:14:39', '2026-04-15 19:43:05'),
(290, 96, 17, 'kk', 'approved', NULL, '2026-04-15 19:43:05', 0, '2026-02-02 20:14:39', '2026-04-15 19:43:05'),
(291, 96, 17, 'biodata', 'approved', NULL, '2026-04-15 19:43:05', 0, '2026-02-02 20:14:39', '2026-04-15 19:43:05'),
(297, 98, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-02-05 00:08:02', '2026-02-05 23:03:34'),
(298, 98, 17, 'photo', 'approved', NULL, '2026-02-05 00:10:43', 0, '2026-02-05 00:08:02', '2026-02-05 00:10:43'),
(299, 98, 17, 'ktp', 'approved', NULL, '2026-02-05 00:10:43', 0, '2026-02-05 00:08:02', '2026-02-05 00:10:43'),
(300, 98, 17, 'kk', 'approved', NULL, '2026-02-05 00:10:43', 0, '2026-02-05 00:08:02', '2026-02-05 00:10:43'),
(301, 98, 17, 'certificate', 'approved', NULL, '2026-02-05 00:10:43', 0, '2026-02-05 00:08:02', '2026-02-05 00:10:43'),
(302, 99, 17, 'biodata', 'approved', NULL, '2026-02-26 01:14:13', 0, '2026-02-05 00:17:29', '2026-02-26 01:14:13'),
(303, 99, 17, 'photo', 'approved', NULL, '2026-02-26 01:14:13', 0, '2026-02-05 00:17:29', '2026-02-26 01:14:13'),
(304, 99, 17, 'ktp', 'approved', NULL, '2026-02-26 01:14:13', 0, '2026-02-05 00:17:29', '2026-02-26 01:14:13'),
(305, 99, 17, 'kk', 'approved', NULL, '2026-02-26 01:14:13', 0, '2026-02-05 00:17:29', '2026-02-26 01:14:13'),
(306, 99, 17, 'certificate', 'approved', NULL, '2026-02-26 01:14:13', 0, '2026-02-05 00:17:29', '2026-02-26 01:14:13'),
(307, 90, 17, 'photo', 'approved', NULL, '2026-02-17 23:58:40', 0, '2026-02-09 05:08:15', '2026-02-17 23:58:40'),
(308, 90, 17, 'ktp', 'approved', NULL, '2026-02-17 23:58:40', 0, '2026-02-09 05:08:15', '2026-02-17 23:58:40'),
(309, 90, 17, 'kk', 'approved', NULL, '2026-02-17 23:58:40', 0, '2026-02-09 05:08:15', '2026-02-17 23:58:40'),
(310, 90, 17, 'certificate', 'approved', NULL, '2026-02-17 23:58:40', 0, '2026-02-09 05:08:15', '2026-02-17 23:58:40'),
(311, 90, 17, 'biodata', 'approved', NULL, '2026-02-17 23:58:40', 0, '2026-02-09 05:08:15', '2026-02-17 23:58:40'),
(312, 68, 17, 'photo', 'approved', NULL, '2026-04-01 21:07:34', 0, '2026-02-10 04:38:44', '2026-04-01 21:07:34'),
(313, 68, 17, 'ktp', 'approved', NULL, '2026-04-01 21:07:34', 0, '2026-02-10 04:38:44', '2026-04-01 21:07:34'),
(314, 68, 17, 'kk', 'approved', NULL, '2026-04-01 21:07:34', 0, '2026-02-10 04:38:44', '2026-04-01 21:07:34'),
(315, 68, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-02-10 04:38:44', '2026-04-09 21:20:54'),
(321, 107, 17, 'biodata', 'approved', NULL, '2026-02-26 01:10:26', 0, '2026-02-13 23:28:34', '2026-02-26 01:10:26'),
(322, 107, 17, 'photo', 'approved', NULL, '2026-02-26 01:10:26', 0, '2026-02-13 23:28:34', '2026-02-26 01:10:26'),
(323, 107, 17, 'ktp', 'approved', NULL, '2026-02-26 01:10:26', 0, '2026-02-13 23:28:34', '2026-02-26 01:10:26'),
(324, 107, 17, 'kk', 'approved', NULL, '2026-02-26 01:10:26', 0, '2026-02-13 23:28:34', '2026-02-26 01:10:26'),
(325, 107, 17, 'certificate', 'approved', NULL, '2026-02-26 01:10:26', 0, '2026-02-13 23:28:34', '2026-02-26 01:10:26'),
(326, 108, 17, 'biodata', 'approved', NULL, '2026-03-12 01:10:41', 0, '2026-02-13 23:58:38', '2026-03-12 01:10:41'),
(327, 108, 17, 'photo', 'approved', NULL, '2026-03-12 01:10:41', 0, '2026-02-13 23:58:38', '2026-03-12 01:10:41'),
(328, 108, 17, 'ktp', 'approved', NULL, '2026-03-12 01:10:41', 0, '2026-02-13 23:58:38', '2026-03-12 01:10:41'),
(329, 108, 17, 'kk', 'approved', NULL, '2026-03-12 01:10:41', 0, '2026-02-13 23:58:38', '2026-03-12 01:10:41'),
(330, 108, 17, 'certificate', 'approved', NULL, '2026-03-12 01:10:41', 0, '2026-02-13 23:58:38', '2026-03-12 01:10:41'),
(331, 111, 17, 'photo', 'approved', NULL, '2026-03-09 22:45:10', 0, '2026-02-16 02:39:28', '2026-03-09 22:45:10'),
(332, 111, 17, 'ktp', 'approved', NULL, '2026-03-09 22:45:10', 0, '2026-02-16 02:39:28', '2026-03-09 22:45:10'),
(333, 111, 17, 'kk', 'approved', NULL, '2026-03-09 22:45:10', 0, '2026-02-16 02:39:28', '2026-03-09 22:45:10'),
(334, 111, 17, 'certificate', 'approved', NULL, '2026-03-09 22:45:10', 0, '2026-02-16 02:39:28', '2026-03-09 22:45:10'),
(335, 111, 17, 'biodata', 'approved', NULL, '2026-03-09 22:45:10', 0, '2026-02-16 02:39:28', '2026-03-09 22:45:10'),
(336, 112, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-02-17 19:59:10', '2026-02-17 19:59:10'),
(337, 112, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-02-17 19:59:10', '2026-02-17 19:59:10'),
(338, 112, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-02-17 19:59:10', '2026-02-17 19:59:10'),
(339, 112, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-02-17 19:59:10', '2026-02-17 19:59:10'),
(340, 112, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-02-17 19:59:10', '2026-02-17 19:59:10'),
(341, 115, 17, 'photo', 'approved', NULL, '2026-04-10 04:49:35', 0, '2026-02-23 19:31:00', '2026-04-10 04:49:35'),
(342, 115, 17, 'ktp', 'approved', NULL, '2026-04-10 04:49:35', 0, '2026-02-23 19:31:00', '2026-04-10 04:49:35'),
(343, 115, 17, 'kk', 'approved', NULL, '2026-04-10 04:49:35', 0, '2026-02-23 19:31:00', '2026-04-10 04:49:35'),
(344, 115, 17, 'biodata', 'approved', NULL, '2026-04-10 04:49:35', 0, '2026-02-23 19:31:00', '2026-04-10 04:49:35'),
(345, 119, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-02-26 23:10:16', '2026-03-27 20:49:05'),
(346, 119, 17, 'photo', 'approved', NULL, '2026-02-26 23:14:52', 0, '2026-02-26 23:10:16', '2026-02-26 23:14:52'),
(347, 119, 17, 'ktp', 'approved', NULL, '2026-02-26 23:14:52', 0, '2026-02-26 23:10:16', '2026-02-26 23:14:52'),
(348, 119, 17, 'kk', 'approved', NULL, '2026-02-26 23:14:52', 0, '2026-02-26 23:10:16', '2026-02-26 23:14:52'),
(349, 119, 17, 'certificate', 'approved', NULL, '2026-02-26 23:14:52', 0, '2026-02-26 23:10:16', '2026-02-26 23:14:52'),
(350, 120, 17, 'photo', 'approved', NULL, '2026-03-12 01:06:02', 0, '2026-02-27 17:05:23', '2026-03-12 01:06:02'),
(351, 120, 17, 'ktp', 'approved', NULL, '2026-03-12 01:06:02', 0, '2026-02-27 17:05:23', '2026-03-12 01:06:02'),
(352, 120, 17, 'kk', 'approved', NULL, '2026-03-12 01:06:02', 0, '2026-02-27 17:05:23', '2026-03-12 01:06:02'),
(353, 120, 17, 'certificate', 'approved', NULL, '2026-03-12 01:06:02', 0, '2026-02-27 17:05:23', '2026-03-12 01:06:02'),
(354, 120, 17, 'biodata', 'approved', NULL, '2026-03-12 01:06:02', 0, '2026-02-27 17:05:23', '2026-03-12 01:06:02'),
(355, 124, 17, 'photo', 'approved', NULL, '2026-03-25 20:44:10', 0, '2026-03-03 10:55:25', '2026-03-25 20:44:10'),
(356, 124, 17, 'ktp', 'approved', NULL, '2026-03-25 20:44:10', 0, '2026-03-03 10:55:25', '2026-03-25 20:44:10'),
(357, 124, 17, 'kk', 'approved', NULL, '2026-03-25 20:44:10', 0, '2026-03-03 10:55:25', '2026-03-25 20:44:10'),
(358, 124, 17, 'certificate', 'approved', NULL, '2026-03-25 20:44:10', 0, '2026-03-03 10:55:25', '2026-03-25 20:44:10'),
(359, 124, 17, 'biodata', 'approved', NULL, '2026-03-25 20:44:10', 0, '2026-03-03 10:55:25', '2026-03-25 20:44:10'),
(360, 125, 17, 'photo', 'approved', NULL, '2026-03-12 01:02:49', 0, '2026-03-03 10:55:43', '2026-03-12 01:02:49'),
(361, 125, 17, 'ktp', 'approved', NULL, '2026-03-12 01:02:49', 0, '2026-03-03 10:55:43', '2026-03-12 01:02:49'),
(362, 125, 17, 'kk', 'approved', NULL, '2026-03-12 01:02:49', 0, '2026-03-03 10:55:43', '2026-03-12 01:02:49'),
(363, 125, 17, 'certificate', 'approved', NULL, '2026-03-12 01:02:49', 0, '2026-03-03 10:55:43', '2026-03-12 01:02:49'),
(364, 125, 17, 'biodata', 'approved', NULL, '2026-03-12 01:02:49', 0, '2026-03-03 10:55:43', '2026-03-12 01:02:49'),
(365, 128, 17, 'photo', 'approved', NULL, '2026-04-01 05:06:05', 0, '2026-03-07 19:37:59', '2026-04-01 05:06:05'),
(366, 128, 17, 'ktp', 'approved', NULL, '2026-04-01 05:06:05', 0, '2026-03-07 19:37:59', '2026-04-01 05:06:05'),
(367, 128, 17, 'kk', 'approved', NULL, '2026-04-01 05:06:05', 0, '2026-03-07 19:37:59', '2026-04-01 05:06:05'),
(368, 128, 17, 'biodata', 'approved', NULL, '2026-04-01 05:06:05', 0, '2026-03-07 19:37:59', '2026-04-01 05:06:05'),
(369, 118, 17, 'photo', 'approved', NULL, '2026-03-12 00:56:47', 0, '2026-03-08 03:20:16', '2026-03-12 00:56:47'),
(370, 118, 17, 'ktp', 'approved', NULL, '2026-03-12 00:56:47', 0, '2026-03-08 03:20:16', '2026-03-12 00:56:47'),
(371, 118, 17, 'kk', 'approved', NULL, '2026-03-12 00:56:47', 0, '2026-03-08 03:20:16', '2026-03-12 00:56:47'),
(372, 118, 17, 'certificate', 'approved', NULL, '2026-03-12 00:56:47', 0, '2026-03-08 03:20:16', '2026-03-12 00:56:47'),
(373, 118, 17, 'biodata', 'approved', NULL, '2026-03-12 00:56:47', 0, '2026-03-08 03:20:16', '2026-03-12 00:56:47'),
(374, 129, 17, 'photo', 'approved', NULL, '2026-03-12 00:37:50', 0, '2026-03-09 02:52:58', '2026-03-12 00:37:50'),
(375, 129, 17, 'ktp', 'approved', NULL, '2026-03-12 00:37:50', 0, '2026-03-09 02:52:58', '2026-03-12 00:37:50'),
(376, 129, 17, 'kk', 'approved', NULL, '2026-03-12 00:37:50', 0, '2026-03-09 02:52:58', '2026-03-12 00:37:50'),
(377, 129, 17, 'certificate', 'approved', NULL, '2026-03-12 00:37:50', 0, '2026-03-09 02:52:58', '2026-03-12 00:37:50'),
(378, 129, 17, 'biodata', 'approved', NULL, '2026-03-12 00:37:50', 0, '2026-03-09 02:52:58', '2026-03-12 00:37:50'),
(379, 133, 17, 'biodata', 'approved', NULL, '2026-03-11 22:31:07', 0, '2026-03-11 22:25:09', '2026-03-11 22:31:07'),
(380, 133, 17, 'photo', 'approved', NULL, '2026-03-11 22:31:07', 0, '2026-03-11 22:25:09', '2026-03-11 22:31:07'),
(381, 133, 17, 'ktp', 'approved', NULL, '2026-03-11 22:31:07', 0, '2026-03-11 22:25:09', '2026-03-11 22:31:07'),
(382, 133, 17, 'kk', 'approved', NULL, '2026-03-11 22:31:07', 0, '2026-03-11 22:25:09', '2026-03-11 22:31:07'),
(383, 133, 17, 'certificate', 'approved', NULL, '2026-03-11 22:31:07', 0, '2026-03-11 22:25:09', '2026-03-11 22:31:07'),
(388, 140, 17, 'photo', 'approved', NULL, '2026-03-25 22:23:23', 0, '2026-03-15 04:22:38', '2026-03-25 22:23:23'),
(389, 140, 17, 'ktp', 'approved', NULL, '2026-03-25 22:23:23', 0, '2026-03-15 04:22:38', '2026-03-25 22:23:23'),
(390, 140, 17, 'kk', 'approved', NULL, '2026-03-25 22:23:23', 0, '2026-03-15 04:22:38', '2026-03-25 22:23:23'),
(391, 140, 17, 'certificate', 'approved', NULL, '2026-03-25 22:23:23', 0, '2026-03-15 04:22:38', '2026-03-25 22:23:23'),
(392, 140, 17, 'biodata', 'approved', NULL, '2026-03-25 22:23:23', 0, '2026-03-15 04:22:38', '2026-03-25 22:23:23'),
(398, 55, 17, 'photo', 'approved', NULL, '2026-03-31 01:43:29', 0, '2026-03-21 01:21:44', '2026-03-31 01:43:29'),
(399, 55, 17, 'ktp', 'approved', NULL, '2026-03-31 01:43:29', 0, '2026-03-21 01:21:44', '2026-03-31 01:43:29'),
(400, 55, 17, 'kk', 'approved', NULL, '2026-03-31 01:43:29', 0, '2026-03-21 01:21:44', '2026-03-31 01:43:29'),
(401, 55, 17, 'certificate', 'approved', NULL, '2026-03-31 01:43:29', 0, '2026-03-21 01:21:44', '2026-03-31 01:43:29'),
(402, 55, 17, 'biodata', 'approved', NULL, '2026-03-31 01:43:29', 0, '2026-03-21 01:21:44', '2026-03-31 01:43:29'),
(403, 143, 17, 'photo', 'approved', NULL, '2026-03-25 20:42:09', 0, '2026-03-22 22:54:15', '2026-03-25 20:42:09'),
(404, 143, 17, 'ktp', 'approved', NULL, '2026-03-25 20:42:09', 0, '2026-03-22 22:54:15', '2026-03-25 20:42:09'),
(405, 143, 17, 'kk', 'approved', NULL, '2026-03-25 20:42:09', 0, '2026-03-22 22:54:15', '2026-03-25 20:42:09'),
(406, 143, 17, 'biodata', 'approved', NULL, '2026-03-25 20:42:09', 0, '2026-03-22 22:54:15', '2026-03-25 20:42:09'),
(407, 145, 17, 'photo', 'approved', NULL, '2026-03-28 00:50:22', 0, '2026-03-24 18:54:36', '2026-03-28 00:50:22'),
(408, 145, 17, 'ktp', 'approved', NULL, '2026-03-28 00:50:22', 0, '2026-03-24 18:54:36', '2026-03-28 00:50:22'),
(409, 145, 17, 'kk', 'approved', NULL, '2026-03-28 00:50:22', 0, '2026-03-24 18:54:36', '2026-03-28 00:50:22'),
(410, 145, 17, 'biodata', 'approved', NULL, '2026-03-28 00:50:22', 0, '2026-03-24 18:54:36', '2026-03-28 00:50:22'),
(411, 147, 17, 'photo', 'approved', NULL, '2026-03-29 23:51:06', 0, '2026-03-25 20:28:08', '2026-03-29 23:51:06'),
(412, 147, 17, 'ktp', 'approved', NULL, '2026-03-29 23:51:07', 0, '2026-03-25 20:28:08', '2026-03-29 23:51:07'),
(413, 147, 17, 'kk', 'approved', NULL, '2026-03-29 23:51:07', 0, '2026-03-25 20:28:08', '2026-03-29 23:51:07'),
(414, 147, 17, 'certificate', 'approved', NULL, '2026-03-29 23:51:07', 0, '2026-03-25 20:28:08', '2026-03-29 23:51:07'),
(415, 147, 17, 'biodata', 'approved', NULL, '2026-03-29 23:51:07', 0, '2026-03-25 20:28:08', '2026-03-29 23:51:07'),
(416, 152, 17, 'biodata', 'approved', NULL, '2026-03-29 19:57:31', 0, '2026-03-27 22:49:09', '2026-03-29 19:57:31'),
(417, 152, 17, 'photo', 'approved', NULL, '2026-03-29 19:57:31', 0, '2026-03-27 22:49:09', '2026-03-29 19:57:31'),
(418, 152, 17, 'ktp', 'approved', NULL, '2026-03-29 19:57:31', 0, '2026-03-27 22:49:09', '2026-03-29 19:57:31'),
(419, 152, 17, 'kk', 'approved', NULL, '2026-03-29 19:57:31', 0, '2026-03-27 22:49:09', '2026-03-29 19:57:31'),
(420, 152, 17, 'certificate', 'approved', NULL, '2026-03-29 19:57:31', 0, '2026-03-27 22:49:09', '2026-03-29 19:57:31'),
(426, 153, 17, 'photo', 'approved', NULL, '2026-03-29 20:07:57', 0, '2026-03-28 02:37:22', '2026-03-29 20:07:57'),
(427, 153, 17, 'ktp', 'approved', NULL, '2026-03-29 20:07:57', 0, '2026-03-28 02:37:22', '2026-03-29 20:07:57'),
(428, 153, 17, 'kk', 'approved', NULL, '2026-03-29 20:07:57', 0, '2026-03-28 02:37:22', '2026-03-29 20:07:57'),
(429, 153, 17, 'biodata', 'approved', NULL, '2026-03-29 20:07:57', 0, '2026-03-28 02:37:22', '2026-03-29 20:07:57'),
(430, 155, 17, 'biodata', 'approved', NULL, '2026-03-29 23:49:38', 0, '2026-03-28 04:34:06', '2026-03-29 23:49:38'),
(431, 155, 17, 'photo', 'approved', NULL, '2026-03-29 23:49:38', 0, '2026-03-28 04:34:06', '2026-03-29 23:49:38'),
(432, 155, 17, 'ktp', 'approved', NULL, '2026-03-29 23:49:38', 0, '2026-03-28 04:34:06', '2026-03-29 23:49:38'),
(433, 155, 17, 'kk', 'approved', NULL, '2026-03-29 23:49:38', 0, '2026-03-28 04:34:06', '2026-03-29 23:49:38'),
(434, 155, 17, 'certificate', 'approved', NULL, '2026-03-29 23:49:38', 0, '2026-03-28 04:34:06', '2026-03-29 23:49:38'),
(435, 157, 17, 'photo', 'approved', NULL, '2026-03-29 20:57:03', 0, '2026-03-29 06:17:59', '2026-03-29 20:57:03'),
(436, 157, 17, 'ktp', 'approved', NULL, '2026-03-29 20:57:03', 0, '2026-03-29 06:17:59', '2026-03-29 20:57:03'),
(437, 157, 17, 'kk', 'approved', NULL, '2026-03-29 20:57:03', 0, '2026-03-29 06:17:59', '2026-03-29 20:57:03'),
(438, 157, 17, 'biodata', 'approved', NULL, '2026-03-29 20:57:03', 0, '2026-03-29 06:17:59', '2026-03-29 20:57:03'),
(439, 157, 17, 'certificate', 'approved', NULL, '2026-03-29 20:57:03', 0, '2026-03-29 06:40:38', '2026-03-29 20:57:03'),
(440, 162, 17, 'biodata', 'approved', NULL, '2026-03-31 01:59:55', 0, '2026-03-31 01:33:17', '2026-03-31 01:59:55'),
(441, 162, 17, 'photo', 'approved', NULL, '2026-03-31 01:59:55', 0, '2026-03-31 01:33:17', '2026-03-31 01:59:55'),
(442, 162, 17, 'ktp', 'approved', NULL, '2026-03-31 01:59:55', 0, '2026-03-31 01:33:17', '2026-03-31 01:59:55'),
(443, 162, 17, 'kk', 'approved', NULL, '2026-03-31 01:59:55', 0, '2026-03-31 01:33:17', '2026-03-31 01:59:55'),
(444, 160, 17, 'photo', 'approved', NULL, '2026-04-02 18:12:08', 0, '2026-03-31 07:15:35', '2026-04-02 18:12:08'),
(445, 160, 17, 'ktp', 'approved', NULL, '2026-04-02 18:12:08', 0, '2026-03-31 07:15:35', '2026-04-02 18:12:08'),
(446, 160, 17, 'kk', 'approved', NULL, '2026-04-02 18:12:08', 0, '2026-03-31 07:15:35', '2026-04-02 18:12:08'),
(447, 160, 17, 'certificate', 'approved', NULL, '2026-04-02 18:12:08', 0, '2026-03-31 07:15:35', '2026-04-02 18:12:08'),
(448, 160, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-03-31 07:15:35', '2026-04-06 20:34:17'),
(449, 167, 17, 'photo', 'approved', NULL, '2026-04-01 04:23:37', 0, '2026-04-01 03:53:09', '2026-04-01 04:23:37'),
(450, 167, 17, 'ktp', 'approved', NULL, '2026-04-01 04:23:37', 0, '2026-04-01 03:53:09', '2026-04-01 04:23:37'),
(451, 167, 17, 'kk', 'approved', NULL, '2026-04-01 04:23:37', 0, '2026-04-01 03:53:09', '2026-04-01 04:23:37'),
(452, 167, 17, 'certificate', 'approved', NULL, '2026-04-01 04:23:37', 0, '2026-04-01 03:53:09', '2026-04-01 04:23:37'),
(453, 167, 17, 'biodata', 'approved', NULL, '2026-04-01 04:23:37', 0, '2026-04-01 03:53:09', '2026-04-01 04:23:37'),
(454, 169, 17, 'biodata', 'approved', NULL, '2026-04-02 01:18:40', 0, '2026-04-02 01:13:03', '2026-04-02 01:18:40'),
(455, 169, 17, 'photo', 'approved', NULL, '2026-04-02 01:18:40', 0, '2026-04-02 01:13:03', '2026-04-02 01:18:40'),
(456, 169, 17, 'ktp', 'approved', NULL, '2026-04-02 01:18:40', 0, '2026-04-02 01:13:03', '2026-04-02 01:18:40'),
(457, 169, 17, 'kk', 'approved', NULL, '2026-04-02 01:18:40', 0, '2026-04-02 01:13:03', '2026-04-02 01:18:40'),
(458, 169, 17, 'certificate', 'approved', NULL, '2026-04-02 01:18:40', 0, '2026-04-02 01:13:03', '2026-04-02 01:18:40'),
(459, 170, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-02 19:08:32', '2026-04-29 20:32:14'),
(460, 170, 17, 'photo', 'approved', NULL, '2026-04-02 19:43:55', 0, '2026-04-02 19:08:32', '2026-04-02 19:43:55'),
(461, 170, 17, 'ktp', 'approved', NULL, '2026-04-02 19:43:55', 0, '2026-04-02 19:08:32', '2026-04-02 19:43:55'),
(462, 170, 17, 'kk', 'approved', NULL, '2026-04-02 19:43:55', 0, '2026-04-02 19:08:32', '2026-04-02 19:43:55'),
(463, 171, 17, 'biodata', 'approved', NULL, '2026-04-02 19:34:59', 0, '2026-04-02 19:23:37', '2026-04-02 19:34:59'),
(464, 171, 17, 'photo', 'approved', NULL, '2026-04-02 19:34:59', 0, '2026-04-02 19:23:37', '2026-04-02 19:34:59'),
(465, 171, 17, 'ktp', 'approved', NULL, '2026-04-02 19:34:59', 0, '2026-04-02 19:23:37', '2026-04-02 19:34:59'),
(466, 171, 17, 'kk', 'approved', NULL, '2026-04-02 19:34:59', 0, '2026-04-02 19:23:37', '2026-04-02 19:34:59'),
(467, 122, 17, 'photo', 'approved', NULL, '2026-04-07 03:33:59', 0, '2026-04-03 23:06:35', '2026-04-07 03:33:59'),
(468, 122, 17, 'ktp', 'approved', NULL, '2026-04-07 03:33:59', 0, '2026-04-03 23:06:35', '2026-04-07 03:33:59'),
(469, 122, 17, 'kk', 'approved', NULL, '2026-04-07 03:33:59', 0, '2026-04-03 23:06:35', '2026-04-07 03:33:59'),
(470, 122, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-03 23:06:35', '2026-04-29 00:16:17'),
(471, 177, 17, 'photo', 'approved', NULL, '2026-04-19 17:13:42', 0, '2026-04-04 22:48:27', '2026-04-19 17:13:42'),
(472, 177, 17, 'ktp', 'approved', NULL, '2026-04-19 17:13:42', 0, '2026-04-04 22:48:27', '2026-04-19 17:13:42'),
(473, 177, 17, 'kk', 'approved', NULL, '2026-04-19 17:13:42', 0, '2026-04-04 22:48:27', '2026-04-19 17:13:42'),
(474, 177, 17, 'biodata', 'approved', NULL, '2026-04-19 17:13:42', 0, '2026-04-04 22:48:27', '2026-04-19 17:13:42'),
(475, 172, 17, 'photo', 'approved', NULL, '2026-04-07 06:03:01', 0, '2026-04-05 15:58:46', '2026-04-07 06:03:01'),
(476, 172, 17, 'ktp', 'approved', NULL, '2026-04-07 06:03:01', 0, '2026-04-05 15:58:46', '2026-04-07 06:03:01'),
(477, 172, 17, 'kk', 'approved', NULL, '2026-04-07 06:03:01', 0, '2026-04-05 15:58:46', '2026-04-07 06:03:01'),
(478, 172, 17, 'certificate', 'approved', NULL, '2026-04-07 06:03:01', 0, '2026-04-05 15:58:46', '2026-04-07 06:03:01'),
(479, 172, 17, 'biodata', 'approved', NULL, '2026-04-07 06:03:01', 0, '2026-04-05 15:58:46', '2026-04-07 06:03:01'),
(480, 42, 17, 'certificate', 'approved', NULL, '2026-04-06 06:14:49', 0, '2026-04-06 06:13:46', '2026-04-06 06:14:49'),
(481, 186, 17, 'photo', 'approved', NULL, '2026-04-08 05:04:14', 0, '2026-04-08 04:23:56', '2026-04-08 05:04:14'),
(482, 186, 17, 'ktp', 'approved', NULL, '2026-04-08 05:04:14', 0, '2026-04-08 04:23:56', '2026-04-08 05:04:14'),
(483, 186, 17, 'kk', 'approved', NULL, '2026-04-08 05:04:14', 0, '2026-04-08 04:23:56', '2026-04-08 05:04:14'),
(484, 186, 17, 'certificate', 'approved', NULL, '2026-04-08 05:04:14', 0, '2026-04-08 04:23:56', '2026-04-08 05:04:14'),
(485, 186, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-08 04:23:56', '2026-04-09 00:24:45'),
(486, 187, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-04-08 06:08:49', '2026-04-08 06:08:49'),
(487, 187, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-04-08 06:08:49', '2026-04-08 06:08:49'),
(488, 187, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-04-08 06:08:49', '2026-04-08 06:08:49'),
(489, 187, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-08 06:08:49', '2026-04-08 06:08:49'),
(490, 185, 17, 'photo', 'approved', NULL, '2026-04-08 22:13:17', 0, '2026-04-08 20:25:16', '2026-04-08 22:13:17'),
(491, 185, 17, 'ktp', 'approved', NULL, '2026-04-08 22:13:17', 0, '2026-04-08 20:25:16', '2026-04-08 22:13:17'),
(492, 185, 17, 'kk', 'approved', NULL, '2026-04-08 22:13:17', 0, '2026-04-08 20:25:16', '2026-04-08 22:13:17'),
(493, 185, 17, 'biodata', 'approved', NULL, '2026-04-08 22:13:17', 0, '2026-04-08 20:25:16', '2026-04-08 22:13:17'),
(494, 68, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-04-09 21:20:54', '2026-04-09 21:20:54'),
(495, 191, 17, 'photo', 'approved', NULL, '2026-04-16 22:43:28', 0, '2026-04-10 06:22:17', '2026-04-16 22:43:28'),
(496, 191, 17, 'ktp', 'approved', NULL, '2026-04-16 22:43:28', 0, '2026-04-10 06:22:17', '2026-04-16 22:43:28'),
(497, 191, 17, 'kk', 'approved', NULL, '2026-04-16 22:43:28', 0, '2026-04-10 06:22:17', '2026-04-16 22:43:28'),
(498, 191, 17, 'biodata', 'approved', NULL, '2026-04-16 22:43:28', 0, '2026-04-10 06:22:17', '2026-04-16 22:43:28'),
(499, 127, 17, 'photo', 'approved', NULL, '2026-04-24 03:52:21', 0, '2026-04-12 21:38:32', '2026-04-24 03:52:21'),
(500, 127, 17, 'ktp', 'approved', NULL, '2026-04-24 03:52:21', 0, '2026-04-12 21:38:32', '2026-04-24 03:52:21'),
(501, 127, 17, 'kk', 'approved', NULL, '2026-04-24 03:52:21', 0, '2026-04-12 21:38:32', '2026-04-24 03:52:21'),
(502, 127, 17, 'biodata', 'approved', NULL, '2026-04-24 03:52:21', 0, '2026-04-12 21:38:32', '2026-04-24 03:52:21');
INSERT INTO `document_verifications` (`id`, `student_biodata_id`, `verified_by`, `document_type`, `status`, `notes`, `verified_at`, `is_read`, `created_at`, `updated_at`) VALUES
(508, 195, 17, 'biodata', 'approved', NULL, '2026-04-12 23:12:58', 0, '2026-04-12 23:11:45', '2026-04-12 23:12:58'),
(509, 195, 17, 'photo', 'approved', NULL, '2026-04-12 23:12:58', 0, '2026-04-12 23:11:45', '2026-04-12 23:12:58'),
(510, 195, 17, 'ktp', 'approved', NULL, '2026-04-12 23:12:58', 0, '2026-04-12 23:11:45', '2026-04-12 23:12:58'),
(511, 195, 17, 'kk', 'approved', NULL, '2026-04-12 23:12:58', 0, '2026-04-12 23:11:45', '2026-04-12 23:12:58'),
(512, 195, 17, 'certificate', 'approved', NULL, '2026-04-12 23:12:58', 0, '2026-04-12 23:11:45', '2026-04-12 23:12:58'),
(513, 189, 17, 'photo', 'approved', NULL, '2026-04-15 19:43:39', 0, '2026-04-12 23:37:07', '2026-04-15 19:43:39'),
(514, 189, 17, 'ktp', 'approved', NULL, '2026-04-15 19:43:39', 0, '2026-04-12 23:37:07', '2026-04-15 19:43:39'),
(515, 189, 17, 'kk', 'approved', NULL, '2026-04-15 19:43:39', 0, '2026-04-12 23:37:07', '2026-04-15 19:43:39'),
(516, 189, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-12 23:37:07', '2026-04-23 04:44:32'),
(517, 196, 17, 'biodata', 'approved', NULL, '2026-04-12 23:49:03', 0, '2026-04-12 23:48:29', '2026-04-12 23:49:03'),
(518, 196, 17, 'photo', 'approved', NULL, '2026-04-12 23:49:03', 0, '2026-04-12 23:48:29', '2026-04-12 23:49:03'),
(519, 196, 17, 'ktp', 'approved', NULL, '2026-04-12 23:49:03', 0, '2026-04-12 23:48:29', '2026-04-12 23:49:03'),
(520, 196, 17, 'kk', 'approved', NULL, '2026-04-12 23:49:03', 0, '2026-04-12 23:48:29', '2026-04-12 23:49:03'),
(521, 196, 17, 'certificate', 'approved', NULL, '2026-04-12 23:49:03', 0, '2026-04-12 23:48:29', '2026-04-12 23:49:03'),
(522, 182, 17, 'photo', 'approved', NULL, '2026-04-15 19:25:15', 0, '2026-04-14 19:03:30', '2026-04-15 19:25:15'),
(523, 182, 17, 'ktp', 'approved', NULL, '2026-04-15 19:25:15', 0, '2026-04-14 19:03:30', '2026-04-15 19:25:15'),
(524, 182, 17, 'kk', 'approved', NULL, '2026-04-15 19:25:15', 0, '2026-04-14 19:03:30', '2026-04-15 19:25:15'),
(525, 182, 17, 'certificate', 'approved', NULL, '2026-04-15 19:25:15', 0, '2026-04-14 19:03:30', '2026-04-15 19:25:15'),
(526, 182, 17, 'biodata', 'approved', NULL, '2026-04-15 19:25:15', 0, '2026-04-14 19:03:30', '2026-04-15 19:25:15'),
(527, 204, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-14 21:41:01', '2026-04-14 22:08:09'),
(528, 204, 17, 'photo', 'approved', NULL, '2026-04-14 21:42:52', 0, '2026-04-14 21:41:01', '2026-04-14 21:42:52'),
(529, 204, 17, 'ktp', 'approved', NULL, '2026-04-14 21:42:52', 0, '2026-04-14 21:41:01', '2026-04-14 21:42:52'),
(530, 204, 17, 'kk', 'approved', NULL, '2026-04-14 21:42:52', 0, '2026-04-14 21:41:01', '2026-04-14 21:42:52'),
(531, 199, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-04-15 04:59:52', '2026-04-15 04:59:52'),
(532, 199, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-04-15 04:59:52', '2026-04-15 04:59:52'),
(533, 199, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-04-15 04:59:52', '2026-04-15 04:59:52'),
(534, 199, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-15 04:59:52', '2026-04-15 04:59:52'),
(535, 203, 17, 'photo', 'approved', NULL, '2026-04-28 18:59:18', 0, '2026-04-15 19:16:43', '2026-04-28 18:59:18'),
(536, 203, 17, 'ktp', 'approved', NULL, '2026-04-28 18:59:18', 0, '2026-04-15 19:16:43', '2026-04-28 18:59:18'),
(537, 203, 17, 'kk', 'approved', NULL, '2026-04-28 18:59:18', 0, '2026-04-15 19:16:43', '2026-04-28 18:59:18'),
(538, 203, 17, 'certificate', 'approved', NULL, '2026-04-28 18:59:18', 0, '2026-04-15 19:16:43', '2026-04-28 18:59:18'),
(539, 203, 17, 'biodata', 'approved', NULL, '2026-04-28 18:59:18', 0, '2026-04-15 19:16:43', '2026-04-28 18:59:18'),
(540, 206, 17, 'photo', 'approved', NULL, '2026-04-17 00:48:14', 0, '2026-04-16 17:46:43', '2026-04-17 00:48:14'),
(541, 206, 17, 'ktp', 'approved', NULL, '2026-04-17 00:48:14', 0, '2026-04-16 17:46:43', '2026-04-17 00:48:14'),
(542, 206, 17, 'kk', 'approved', NULL, '2026-04-17 00:48:14', 0, '2026-04-16 17:46:43', '2026-04-17 00:48:14'),
(543, 206, 17, 'certificate', 'approved', NULL, '2026-04-17 00:48:14', 0, '2026-04-16 17:46:43', '2026-04-17 00:48:14'),
(544, 206, 17, 'biodata', 'approved', NULL, '2026-04-17 00:48:14', 0, '2026-04-16 17:46:43', '2026-04-17 00:48:14'),
(545, 207, 17, 'photo', 'approved', NULL, '2026-04-17 00:21:04', 0, '2026-04-16 22:45:24', '2026-04-17 00:21:04'),
(546, 207, 17, 'ktp', 'approved', NULL, '2026-04-17 00:21:04', 0, '2026-04-16 22:45:24', '2026-04-17 00:21:04'),
(547, 207, 17, 'kk', 'approved', NULL, '2026-04-17 00:21:04', 0, '2026-04-16 22:45:24', '2026-04-17 00:21:04'),
(548, 207, 17, 'certificate', 'approved', NULL, '2026-04-17 00:21:04', 0, '2026-04-16 22:45:24', '2026-04-17 00:21:04'),
(549, 207, 17, 'biodata', 'approved', NULL, '2026-04-17 00:21:04', 0, '2026-04-16 22:45:24', '2026-04-17 00:21:04'),
(550, 208, 17, 'biodata', 'approved', NULL, '2026-04-17 00:04:21', 0, '2026-04-17 00:03:03', '2026-04-17 00:04:21'),
(551, 208, 17, 'photo', 'approved', NULL, '2026-04-17 00:04:21', 0, '2026-04-17 00:03:03', '2026-04-17 00:04:21'),
(552, 208, 17, 'ktp', 'approved', NULL, '2026-04-17 00:04:21', 0, '2026-04-17 00:03:03', '2026-04-17 00:04:21'),
(553, 208, 17, 'kk', 'approved', NULL, '2026-04-17 00:04:21', 0, '2026-04-17 00:03:03', '2026-04-17 00:04:21'),
(554, 209, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-17 01:13:07', '2026-04-24 05:28:05'),
(555, 209, 17, 'photo', 'approved', NULL, '2026-04-17 02:01:34', 0, '2026-04-17 01:13:07', '2026-04-17 02:01:34'),
(556, 209, 17, 'ktp', 'approved', NULL, '2026-04-17 02:01:34', 0, '2026-04-17 01:13:07', '2026-04-17 02:01:34'),
(557, 209, 17, 'kk', 'approved', NULL, '2026-04-17 02:01:34', 0, '2026-04-17 01:13:07', '2026-04-17 02:01:34'),
(558, 210, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-17 02:00:21', '2026-04-24 05:27:33'),
(559, 210, 17, 'photo', 'approved', NULL, '2026-04-17 02:02:18', 0, '2026-04-17 02:00:21', '2026-04-17 02:02:18'),
(560, 210, 17, 'ktp', 'approved', NULL, '2026-04-17 02:02:18', 0, '2026-04-17 02:00:21', '2026-04-17 02:02:18'),
(561, 210, 17, 'kk', 'approved', NULL, '2026-04-17 02:02:18', 0, '2026-04-17 02:00:21', '2026-04-17 02:02:18'),
(562, 211, 17, 'biodata', 'approved', NULL, '2026-04-17 16:56:14', 0, '2026-04-17 16:55:51', '2026-04-17 16:56:14'),
(563, 211, 17, 'photo', 'approved', NULL, '2026-04-17 16:56:14', 0, '2026-04-17 16:55:51', '2026-04-17 16:56:14'),
(564, 211, 17, 'ktp', 'approved', NULL, '2026-04-17 16:56:14', 0, '2026-04-17 16:55:51', '2026-04-17 16:56:14'),
(565, 211, 17, 'kk', 'approved', NULL, '2026-04-17 16:56:14', 0, '2026-04-17 16:55:51', '2026-04-17 16:56:14'),
(570, 223, 17, 'biodata', 'approved', NULL, '2026-04-22 00:01:39', 0, '2026-04-22 00:00:31', '2026-04-22 00:01:39'),
(571, 223, 17, 'photo', 'approved', NULL, '2026-04-22 00:01:39', 0, '2026-04-22 00:00:31', '2026-04-22 00:01:39'),
(572, 223, 17, 'ktp', 'approved', NULL, '2026-04-22 00:01:39', 0, '2026-04-22 00:00:31', '2026-04-22 00:01:39'),
(573, 223, 17, 'kk', 'approved', NULL, '2026-04-22 00:01:39', 0, '2026-04-22 00:00:31', '2026-04-22 00:01:39'),
(574, 224, 17, 'biodata', 'approved', NULL, '2026-04-22 01:07:26', 0, '2026-04-22 01:01:08', '2026-04-22 01:07:26'),
(575, 224, 17, 'photo', 'approved', NULL, '2026-04-22 01:07:26', 0, '2026-04-22 01:01:08', '2026-04-22 01:07:26'),
(576, 224, 17, 'ktp', 'approved', NULL, '2026-04-22 01:07:26', 0, '2026-04-22 01:01:08', '2026-04-22 01:07:26'),
(577, 224, 17, 'kk', 'approved', NULL, '2026-04-22 01:07:26', 0, '2026-04-22 01:01:08', '2026-04-22 01:07:26'),
(578, 227, 17, 'photo', 'approved', NULL, '2026-04-28 19:45:00', 0, '2026-04-22 22:08:04', '2026-04-28 19:45:00'),
(579, 227, 17, 'ktp', 'approved', NULL, '2026-04-28 19:45:00', 0, '2026-04-22 22:08:04', '2026-04-28 19:45:00'),
(580, 227, 17, 'kk', 'approved', NULL, '2026-04-28 19:45:00', 0, '2026-04-22 22:08:04', '2026-04-28 19:45:00'),
(581, 227, 17, 'biodata', 'approved', NULL, '2026-04-28 19:45:00', 0, '2026-04-22 22:08:04', '2026-04-28 19:45:00'),
(582, 228, 17, 'photo', 'approved', NULL, '2026-04-28 19:53:27', 0, '2026-04-22 22:52:22', '2026-04-28 19:53:27'),
(583, 228, 17, 'ktp', 'approved', NULL, '2026-04-28 19:53:27', 0, '2026-04-22 22:52:22', '2026-04-28 19:53:27'),
(584, 228, 17, 'kk', 'approved', NULL, '2026-04-28 19:53:27', 0, '2026-04-22 22:52:22', '2026-04-28 19:53:27'),
(585, 228, 17, 'biodata', 'approved', NULL, '2026-04-28 19:53:27', 0, '2026-04-22 22:52:22', '2026-04-28 19:53:27'),
(586, 221, 17, 'photo', 'approved', NULL, '2026-04-28 01:20:29', 0, '2026-04-23 08:15:01', '2026-04-28 01:20:29'),
(587, 221, 17, 'ktp', 'approved', NULL, '2026-04-28 01:20:29', 0, '2026-04-23 08:15:01', '2026-04-28 01:20:29'),
(588, 221, 17, 'kk', 'approved', NULL, '2026-04-28 01:20:29', 0, '2026-04-23 08:15:01', '2026-04-28 01:20:29'),
(589, 221, 17, 'certificate', 'approved', NULL, '2026-04-28 01:20:29', 0, '2026-04-23 08:15:01', '2026-04-28 01:20:29'),
(590, 221, 17, 'biodata', 'approved', NULL, '2026-04-28 01:20:29', 0, '2026-04-23 08:15:01', '2026-04-28 01:20:29'),
(591, 233, 17, 'photo', 'approved', NULL, '2026-04-28 19:45:35', 0, '2026-04-24 00:31:59', '2026-04-28 19:45:35'),
(592, 233, 17, 'ktp', 'approved', NULL, '2026-04-28 19:45:35', 0, '2026-04-24 00:31:59', '2026-04-28 19:45:35'),
(593, 233, 17, 'kk', 'approved', NULL, '2026-04-28 19:45:35', 0, '2026-04-24 00:31:59', '2026-04-28 19:45:35'),
(594, 233, 17, 'biodata', 'approved', NULL, '2026-04-28 19:45:35', 0, '2026-04-24 00:31:59', '2026-04-28 19:45:35'),
(595, 239, 17, 'biodata', 'approved', NULL, '2026-04-24 05:17:49', 0, '2026-04-24 05:14:57', '2026-04-24 05:17:49'),
(596, 239, 17, 'photo', 'approved', NULL, '2026-04-24 05:17:49', 0, '2026-04-24 05:14:57', '2026-04-24 05:17:49'),
(597, 239, 17, 'ktp', 'approved', NULL, '2026-04-24 05:17:49', 0, '2026-04-24 05:14:57', '2026-04-24 05:17:49'),
(598, 239, 17, 'kk', 'approved', NULL, '2026-04-24 05:17:49', 0, '2026-04-24 05:14:57', '2026-04-24 05:17:49'),
(599, 239, 17, 'certificate', 'approved', NULL, '2026-04-24 05:17:49', 0, '2026-04-24 05:14:57', '2026-04-24 05:17:49'),
(600, 240, 17, 'biodata', 'approved', NULL, '2026-04-24 05:47:39', 0, '2026-04-24 05:46:17', '2026-04-24 05:47:39'),
(601, 240, 17, 'photo', 'approved', NULL, '2026-04-24 05:47:39', 0, '2026-04-24 05:46:17', '2026-04-24 05:47:39'),
(602, 240, 17, 'ktp', 'approved', NULL, '2026-04-24 05:47:39', 0, '2026-04-24 05:46:17', '2026-04-24 05:47:39'),
(603, 240, 17, 'kk', 'approved', NULL, '2026-04-24 05:47:39', 0, '2026-04-24 05:46:17', '2026-04-24 05:47:39'),
(604, 241, 17, 'biodata', 'approved', NULL, '2026-04-24 06:11:00', 0, '2026-04-24 06:10:32', '2026-04-24 06:11:00'),
(605, 241, 17, 'photo', 'approved', NULL, '2026-04-24 06:11:00', 0, '2026-04-24 06:10:32', '2026-04-24 06:11:00'),
(606, 241, 17, 'ktp', 'approved', NULL, '2026-04-24 06:11:00', 0, '2026-04-24 06:10:32', '2026-04-24 06:11:00'),
(607, 241, 17, 'kk', 'approved', NULL, '2026-04-24 06:11:00', 0, '2026-04-24 06:10:32', '2026-04-24 06:11:00'),
(608, 238, 17, 'photo', 'approved', NULL, '2026-04-28 01:18:45', 0, '2026-04-24 17:07:22', '2026-04-28 01:18:45'),
(609, 238, 17, 'ktp', 'approved', NULL, '2026-04-28 01:18:45', 0, '2026-04-24 17:07:22', '2026-04-28 01:18:45'),
(610, 238, 17, 'kk', 'approved', NULL, '2026-04-28 01:18:45', 0, '2026-04-24 17:07:22', '2026-04-28 01:18:45'),
(611, 238, 17, 'biodata', 'approved', NULL, '2026-04-28 01:18:45', 0, '2026-04-24 17:07:22', '2026-04-28 01:18:45'),
(612, 247, 17, 'biodata', 'approved', NULL, '2026-04-28 01:16:21', 0, '2026-04-26 08:46:26', '2026-04-28 01:16:21'),
(613, 247, 17, 'photo', 'approved', NULL, '2026-04-28 01:16:21', 0, '2026-04-26 08:46:26', '2026-04-28 01:16:21'),
(614, 247, 17, 'ktp', 'approved', NULL, '2026-04-28 01:16:21', 0, '2026-04-26 08:46:26', '2026-04-28 01:16:21'),
(615, 247, 17, 'kk', 'approved', NULL, '2026-04-28 01:16:21', 0, '2026-04-26 08:46:26', '2026-04-28 01:16:21'),
(616, 247, 17, 'certificate', 'approved', NULL, '2026-04-28 01:16:21', 0, '2026-04-26 08:46:26', '2026-04-28 01:16:21'),
(617, 246, 17, 'photo', 'approved', NULL, '2026-04-28 01:15:29', 0, '2026-04-27 21:21:17', '2026-04-28 01:15:29'),
(618, 246, 17, 'ktp', 'approved', NULL, '2026-04-28 01:15:29', 0, '2026-04-27 21:21:17', '2026-04-28 01:15:29'),
(619, 246, 17, 'kk', 'approved', NULL, '2026-04-28 01:15:29', 0, '2026-04-27 21:21:17', '2026-04-28 01:15:29'),
(620, 246, 17, 'certificate', 'approved', NULL, '2026-04-28 01:15:29', 0, '2026-04-27 21:21:17', '2026-04-28 01:15:29'),
(621, 246, 17, 'biodata', 'approved', NULL, '2026-04-28 01:15:29', 0, '2026-04-27 21:21:17', '2026-04-28 01:15:29'),
(622, 249, 17, 'biodata', 'approved', NULL, '2026-04-27 23:27:11', 0, '2026-04-27 23:26:34', '2026-04-27 23:27:11'),
(623, 249, 17, 'photo', 'approved', NULL, '2026-04-27 23:27:11', 0, '2026-04-27 23:26:34', '2026-04-27 23:27:11'),
(624, 249, 17, 'ktp', 'approved', NULL, '2026-04-27 23:27:11', 0, '2026-04-27 23:26:34', '2026-04-27 23:27:11'),
(625, 249, 17, 'kk', 'approved', NULL, '2026-04-27 23:27:11', 0, '2026-04-27 23:26:34', '2026-04-27 23:27:11'),
(626, 249, 17, 'certificate', 'approved', NULL, '2026-04-27 23:27:11', 0, '2026-04-27 23:26:34', '2026-04-27 23:27:11'),
(627, 252, 17, 'biodata', 'approved', NULL, '2026-04-28 18:57:11', 0, '2026-04-28 00:20:57', '2026-04-28 18:57:11'),
(628, 252, 17, 'photo', 'approved', NULL, '2026-04-28 18:57:11', 0, '2026-04-28 00:20:57', '2026-04-28 18:57:11'),
(629, 252, 17, 'ktp', 'approved', NULL, '2026-04-28 18:57:11', 0, '2026-04-28 00:20:57', '2026-04-28 18:57:11'),
(630, 252, 17, 'kk', 'approved', NULL, '2026-04-28 18:57:11', 0, '2026-04-28 00:20:57', '2026-04-28 18:57:11'),
(631, 257, NULL, 'photo', 'pending', NULL, NULL, 0, '2026-04-28 15:23:59', '2026-04-28 15:23:59'),
(632, 257, NULL, 'ktp', 'pending', NULL, NULL, 0, '2026-04-28 15:23:59', '2026-04-28 15:23:59'),
(633, 257, NULL, 'kk', 'pending', NULL, NULL, 0, '2026-04-28 15:23:59', '2026-04-28 15:23:59'),
(634, 257, NULL, 'biodata', 'pending', NULL, NULL, 0, '2026-04-28 15:23:59', '2026-04-28 15:23:59'),
(635, 122, NULL, 'certificate', 'pending', NULL, NULL, 0, '2026-04-29 00:16:17', '2026-04-29 00:16:17'),
(636, 254, 17, 'photo', 'approved', NULL, '2026-04-29 23:23:30', 0, '2026-04-29 09:11:20', '2026-04-29 23:23:30'),
(637, 254, 17, 'ktp', 'approved', NULL, '2026-04-29 23:23:30', 0, '2026-04-29 09:11:20', '2026-04-29 23:23:30'),
(638, 254, 17, 'kk', 'approved', NULL, '2026-04-29 23:23:30', 0, '2026-04-29 09:11:20', '2026-04-29 23:23:30'),
(639, 254, 17, 'biodata', 'approved', NULL, '2026-04-29 23:23:30', 0, '2026-04-29 09:11:20', '2026-04-29 23:23:30'),
(640, 258, 17, 'biodata', 'approved', NULL, '2026-04-29 18:30:02', 0, '2026-04-29 18:28:49', '2026-04-29 18:30:02'),
(641, 258, 17, 'photo', 'approved', NULL, '2026-04-29 18:30:02', 0, '2026-04-29 18:28:49', '2026-04-29 18:30:02'),
(642, 258, 17, 'ktp', 'approved', NULL, '2026-04-29 18:30:02', 0, '2026-04-29 18:28:49', '2026-04-29 18:30:02'),
(643, 258, 17, 'kk', 'approved', NULL, '2026-04-29 18:30:02', 0, '2026-04-29 18:28:49', '2026-04-29 18:30:02'),
(644, 260, 17, 'biodata', 'approved', NULL, '2026-04-29 23:45:42', 0, '2026-04-29 23:44:18', '2026-04-29 23:45:42'),
(645, 260, 17, 'photo', 'approved', NULL, '2026-04-29 23:45:42', 0, '2026-04-29 23:44:18', '2026-04-29 23:45:42'),
(646, 260, 17, 'ktp', 'approved', NULL, '2026-04-29 23:45:42', 0, '2026-04-29 23:44:18', '2026-04-29 23:45:42'),
(647, 260, 17, 'kk', 'approved', NULL, '2026-04-29 23:45:42', 0, '2026-04-29 23:44:18', '2026-04-29 23:45:42'),
(648, 260, 17, 'certificate', 'approved', NULL, '2026-04-29 23:45:42', 0, '2026-04-29 23:44:18', '2026-04-29 23:45:42');

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
(40, '2026_01_07_014926_create_chat_logs_table', 1),
(41, '2026_04_10_000001_create_admission_letters_table', 2),
(42, '2026_04_10_000002_add_unique_user_id_to_admission_letters_table', 2),
(43, '2026_04_16_000001_add_source_type_to_admission_letters_table', 2);

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
('muahammadalbar94@gmail.com', '$2y$12$2oha.tDTJgB/3WS2bofvt.jTgMxaDstH0D5G43P4BPnF1SrFh906.', '2026-03-28 00:07:00'),
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
(2, 'payment_bank_name', 'BSI', 'text', '2026-01-06 23:40:40', '2026-02-15 21:40:06'),
(3, 'payment_account_number', '2020230425', 'text', '2026-01-06 23:40:40', '2026-02-15 21:40:06'),
(4, 'payment_account_name', 'Universitas Nahdlatul Ulama Kalimantan Timur', 'text', '2026-01-06 23:40:40', '2026-03-09 23:17:21'),
(5, 'payment_amount', '300000', 'number', '2026-01-06 23:40:40', '2026-03-09 23:17:21'),
(6, 'payment_instructions', 'Mohon Konfirmasi terlebih dahulu dengan panitia pmb sebelum transfer ke rekening UNU Kaltim. Transfer sesuai nominal yang tertera. Pastikan menyimpan bukti transfer.', 'textarea', '2026-01-06 23:40:40', '2026-02-15 21:59:17');

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
(1, 1, 'Akuntansi', 'AKT', '0203', 'S1', 'Program Studi Akuntansi', 40, 1, '2025-12-12 05:57:17', '2026-04-07 01:13:32'),
(2, 2, 'Teknik Informatika', 'TI', '0105', 'S1', 'Program Studi Teknik Informatika', 30, 1, '2025-12-12 05:57:17', '2026-04-07 01:14:20'),
(3, 2, 'Teknik Industri', 'TIN', '0104', 'S1', 'Program Studi Teknik Industri', 140, 1, '2025-12-12 05:57:17', '2026-04-07 01:14:07'),
(4, 2, 'Arsitektur', 'ARS', '0101', 'S1', 'Program Studi Arsitektur', 80, 1, '2025-12-12 05:57:17', '2026-04-07 01:13:43'),
(5, 2, 'Desain Interior', 'DI', '0102', 'S1', 'Program Studi Desain Interior', 150, 1, '2025-12-12 05:57:17', '2026-04-07 01:13:58'),
(6, 3, 'Hubungan Internasional', 'HI', '0201', 'S1', 'Program Studi Hubungan Internasional', 25, 1, '2025-12-12 05:57:17', '2026-04-07 01:15:26'),
(7, 3, 'Ilmu Komunikasi', 'ILKOM', '0202', 'S1', 'Program Studi Ilmu Komunikasi', 100, 1, '2025-12-12 05:57:17', '2026-04-07 01:15:39'),
(8, 2, 'Teknologi Industri Pertanian', 'TIP', '0106', 'S1', 'Program Studi Teknologi Industri Pertanian', 25, 1, '2025-12-12 05:57:17', '2026-04-07 01:15:07'),
(9, 3, 'Pendidikan Anak Usia Dini', 'PAUD', '0204', 'S1', 'Program Studi Pendidikan Anak Usia Dini', 45, 1, '2025-12-12 05:57:17', '2026-04-07 01:15:57'),
(10, 4, 'Farmasi', 'FARM', '0103', 'S1', 'Program Studi Farmasi', 40, 1, '2025-12-12 05:57:17', '2026-04-12 17:40:52');

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
(5, '26270100001', 19, 'accepted', '2026-02-01 23:19:48', '2025-12-16 07:29:33', '2026-02-01 23:19:48', 1, 1, NULL, 'Teman/Keluarga', NULL, 3, 4, NULL, 17, NULL, 3, NULL, NULL, NULL),
(6, '26270100002', 22, 're_registration_pending', '2026-01-15 00:25:56', '2025-12-16 22:10:56', '2026-03-14 01:45:19', 1, 1, NULL, 'Dosen/Panitia PMB UNU Kaltim', 'Ahmad Khoirul Anwar, S.Sos', 7, 2, NULL, 17, NULL, 7, NULL, NULL, NULL),
(7, '26270100003', 23, 'enrolled', '2026-02-01 23:16:18', '2025-12-16 22:41:21', '2026-04-01 23:20:26', 1, 1, NULL, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 4, NULL, 17, NULL, 3, NULL, NULL, NULL),
(8, '26270100004', 25, 'enrolled', '2026-01-15 00:13:24', '2025-12-17 10:28:47', '2026-03-09 23:51:58', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 7, 8, NULL, 17, 'SUDAH MEMBAYAR ALMAMATER DAN KTM', 7, NULL, NULL, NULL),
(9, '26270100005', 18, 're_registration_pending', '2026-03-12 02:54:23', '2025-12-19 20:20:43', '2026-03-12 03:07:01', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'Kartika Fajriani', 9, 7, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 9, NULL, NULL, NULL),
(10, '26270100006', 28, 're_registration_pending', '2026-03-27 20:10:24', '2025-12-19 20:52:03', '2026-03-27 20:19:33', 1, 1, 1, 'Website Resmi UNU Kaltim', NULL, 10, 9, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 10, NULL, NULL, NULL),
(11, '26270100007', 30, 're_registration_pending', '2026-02-01 23:27:22', '2025-12-21 10:17:16', '2026-02-10 23:52:15', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 10, NULL, 17, NULL, 2, NULL, NULL, NULL),
(13, '26270100008', 32, 'enrolled', '2026-03-12 02:53:39', '2025-12-22 00:27:28', '2026-04-09 22:35:15', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / MISSYA', 10, 6, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 10, NULL, NULL, NULL),
(18, '26270100012', 36, 'enrolled', '2026-02-01 23:31:50', '2025-12-22 05:06:19', '2026-03-31 00:30:27', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / GRUP RT', 10, 7, NULL, 17, NULL, 10, NULL, NULL, NULL),
(19, '26270100013', 39, 're_registration_pending', '2026-03-12 02:52:21', '2025-12-24 08:29:33', '2026-04-28 19:55:43', 1, 1, 1, 'Teman/Keluarga', NULL, 3, 6, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 6, NULL, NULL, NULL),
(20, '26270100014', 43, 'accepted', '2026-03-12 02:51:17', '2025-12-30 08:20:05', '2026-03-12 02:51:17', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / SUCI', 7, 6, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(21, '26270100015', 44, 're_registration_pending', '2026-03-12 02:50:39', '2025-12-30 13:12:45', '2026-03-14 01:52:58', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 7, 6, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(22, '26270100016', 37, 'enrolled', '2026-03-12 02:50:03', '2025-12-31 23:08:48', '2026-03-25 21:27:52', 1, 1, 1, 'Teman/Keluarga', NULL, 2, 3, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(23, '26270100017', 47, 'enrolled', '2026-01-15 00:25:10', '2026-01-01 13:34:48', '2026-03-29 23:03:42', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 2, 10, NULL, 17, NULL, 2, NULL, NULL, NULL),
(24, '26270100018', 49, 'accepted', '2026-01-15 00:09:46', '2026-01-02 10:08:39', '2026-01-15 00:09:46', 1, 1, 1, 'Website Resmi UNU Kaltim', NULL, 10, 2, NULL, 17, NULL, 10, NULL, NULL, NULL),
(25, '26270100019', 50, 'accepted', '2026-01-15 00:22:48', '2026-01-02 15:45:30', '2026-01-15 00:22:48', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD LHOIRUL ANWAR / ARS', 2, 3, NULL, 17, NULL, 2, NULL, NULL, NULL),
(26, '26270100020', 51, 'enrolled', '2026-03-12 02:49:19', '2026-01-04 13:38:57', '2026-03-29 21:42:30', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 9, 7, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 9, NULL, NULL, NULL),
(27, '26270100021', 52, 'accepted', '2026-03-12 02:48:43', '2026-01-05 13:40:31', '2026-03-12 02:48:43', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 9, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 2, NULL, NULL, NULL),
(28, '26270100022', 55, 'enrolled', '2026-03-12 02:47:48', '2026-01-06 16:01:33', '2026-03-25 22:09:28', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'DHIVA ANDHINI (MAHASISWA AKUTANSI)', 10, 1, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 10, NULL, NULL, NULL),
(29, '26270100023', 56, 'accepted', '2026-03-12 02:46:54', '2026-01-07 00:14:43', '2026-03-12 02:46:54', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'IBU PURBAWATI', 3, 4, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(30, '26270100024', 57, 'enrolled', '2026-03-11 02:02:59', '2026-01-07 17:45:45', '2026-03-11 18:18:50', 1, 1, 2, 'Teman/Keluarga', NULL, 3, 2, NULL, 17, NULL, 3, NULL, NULL, NULL),
(31, '26270100025', 45, 're_registration_pending', '2026-04-01 04:57:09', '2026-01-09 04:24:56', '2026-04-01 16:20:07', 1, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 8, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026', 3, NULL, NULL, NULL),
(32, '26270100026', 53, 'enrolled', '2026-03-30 23:56:20', '2026-01-09 16:25:18', '2026-04-06 20:19:34', 1, 1, 2, 'Lainnya', 'MAJELIS DZIKRUSSADAH', 3, 8, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(33, '26270100027', 59, 'enrolled', '2026-03-12 02:45:24', '2026-01-09 19:44:14', '2026-03-31 02:54:06', 1, 1, 2, 'Lainnya', 'majelis dzikrussadah', 7, 1, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(34, '26270100028', 60, 'enrolled', '2026-04-01 05:01:07', '2026-01-09 19:48:12', '2026-04-07 03:11:12', 1, 1, 2, 'Lainnya', 'Majelis dzikrussadah', 7, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026', 7, NULL, NULL, NULL),
(35, '26270100029', 65, 'enrolled', '2026-03-12 02:43:51', '2026-01-09 23:19:36', '2026-03-30 03:23:57', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 9, 7, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 9, NULL, NULL, NULL),
(36, '26270100030', 67, 'enrolled', '2026-03-30 23:54:09', '2026-01-10 01:06:57', '2026-04-01 00:04:36', 1, 1, 2, 'Lainnya', 'majelis dzikrussadah', 1, 7, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 1, NULL, NULL, NULL),
(37, '26270100031', 68, 're_registration_pending', '2026-03-12 02:42:26', '2026-01-10 23:08:30', '2026-03-31 00:09:05', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'Majlis Dzikrussadah', 7, 9, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(38, '26270100032', 72, 're_registration_pending', '2026-04-01 05:02:30', '2026-01-11 01:51:37', '2026-04-01 06:05:41', 1, 1, 1, 'Sekolah/Guru', 'Taufik Irwan Marwedi - SMK Negeri 17 Samarinda (082254502004)', 10, 7, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026\nSelanjutnya segera membuat surat keterangan bukti dinyatakan tidak buta warna oleh lembaga kesehatan yang resmi (Rumah Sakit atau Puskesmas)', 10, NULL, NULL, NULL),
(39, '26270100033', 75, 'accepted', '2026-03-12 02:41:20', '2026-01-11 20:02:58', '2026-03-12 02:41:20', 1, 1, 1, 'Website Resmi UNU Kaltim', NULL, 7, 2, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(40, '26270100034', 76, 'enrolled', '2026-03-12 02:39:00', '2026-01-12 06:07:49', '2026-04-01 21:59:04', 1, 1, 2, 'Lainnya', 'majelis dzikrussaadah', 1, 9, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 1, NULL, NULL, NULL),
(41, '26270100035', 74, 'enrolled', '2026-03-12 02:38:02', '2026-01-13 03:59:40', '2026-03-30 01:37:50', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / NH', 2, 7, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 2, NULL, NULL, NULL),
(42, '26270100036', 81, 'accepted', '2026-03-12 02:37:13', '2026-01-14 02:04:38', '2026-03-12 02:37:13', 1, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 4, NULL, 17, NULL, 3, NULL, NULL, NULL),
(43, '26270100037', 83, 'accepted', '2026-01-15 01:04:30', '2026-01-14 22:06:43', '2026-01-15 01:04:30', 1, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 7, 3, NULL, 1, NULL, 7, NULL, NULL, NULL),
(44, '26270100038', 84, 're_registration_pending', '2026-03-12 02:35:39', '2026-01-14 22:29:49', '2026-03-14 01:11:56', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / NH', 3, 7, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(45, '26270100039', 40, 're_registration_pending', '2026-03-12 02:34:42', '2026-01-15 05:42:33', '2026-03-12 02:41:12', 1, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 1, 3, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 1, NULL, NULL, NULL),
(46, '26270100040', 58, 'enrolled', '2026-03-12 02:34:04', '2026-01-16 00:07:18', '2026-03-25 21:58:16', 1, 1, 2, 'Lainnya', 'MAJELIS DZIKRUSSADAH', 2, 7, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 2, NULL, NULL, NULL),
(47, '26270100041', 86, 'enrolled', '2026-03-12 02:33:23', '2026-01-18 20:59:59', '2026-04-06 06:25:53', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'Majlis Dzikrussaadah', 6, 7, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 6, NULL, NULL, NULL),
(48, '26270100042', 87, 're_registration_pending', '2026-03-12 02:31:48', '2026-01-19 23:20:57', '2026-03-12 02:36:34', 1, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 2, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(50, '26270100044', 100, 'enrolled', '2026-04-01 04:55:25', '2026-01-25 23:13:17', '2026-04-01 21:41:33', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 10, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026\nSelanjutnya segera membuat surat keterangan bukti dinyatakan tidak buta warna oleh lembaga kesehatan yang resmi (Rumah Sakit atau Puskesmas)', 10, NULL, NULL, NULL),
(51, '26270100045', 101, 'enrolled', '2026-03-12 01:23:36', '2026-01-26 00:57:41', '2026-03-25 21:53:44', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'IBU PURBAWATI', 3, 8, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(52, '26270100046', 90, 're_registration_pending', '2026-04-01 04:48:00', '2026-01-26 08:21:01', '2026-04-01 05:11:51', 1, 1, 1, 'Teman/Keluarga', NULL, 7, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTP Rp.300.000,- batas akhir 10 April 2026', 7, NULL, NULL, NULL),
(53, '26270100047', 103, 'accepted', '2026-03-12 01:22:19', '2026-01-26 21:07:01', '2026-03-12 01:22:19', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'IBU PURBAWATI', 3, 8, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(54, '26270100048', 104, 'enrolled', '2026-04-01 05:04:38', '2026-01-27 00:27:44', '2026-04-01 22:24:43', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 10, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026\nSelanjutnya segera membuat surat keterangan bukti dinyatakan tidak buta warna oleh lembaga kesehatan yang resmi (Rumah Sakit atau Puskesmas)', 10, NULL, NULL, NULL),
(55, '26270100049', 105, 'enrolled', '2026-03-12 01:20:20', '2026-01-27 00:32:38', '2026-04-14 00:30:48', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 7, 1, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(56, '26270100050', 88, 'accepted', '2026-04-01 05:07:40', '2026-01-27 01:18:17', '2026-04-01 05:07:40', 1, 1, 1, 'Sekolah/Guru', 'Muhammad Nur Hariri S.Pd.i', 1, 3, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026', 1, NULL, NULL, NULL),
(57, '26270100051', 107, 'enrolled', '2026-03-12 01:18:54', '2026-01-27 01:50:02', '2026-03-30 10:59:32', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'IBU PURBAWATI', 3, 8, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(58, '26270100052', 112, 're_registration_pending', '2026-04-01 04:59:50', '2026-02-01 21:35:04', '2026-04-29 00:40:18', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'MUHTAR (TIP)', 3, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026', 3, NULL, NULL, NULL),
(59, '26270100053', 113, 'enrolled', '2026-03-12 01:17:34', '2026-02-01 23:06:54', '2026-03-27 21:29:16', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 7, 6, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(60, '26270100054', 116, 'accepted', '2026-03-12 01:15:31', '2026-02-05 00:08:02', '2026-04-06 06:27:28', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 3, 8, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(61, '26270100055', 117, 're_registration_pending', '2026-02-05 00:18:40', '2026-02-05 00:17:29', '2026-02-05 04:56:26', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR', 6, 7, NULL, 17, NULL, 6, NULL, NULL, NULL),
(62, '26270100056', 108, 'enrolled', '2026-03-12 01:14:23', '2026-02-09 19:56:14', '2026-03-15 19:00:41', 1, 1, 1, 'Teman/Keluarga', NULL, 10, 4, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 10, NULL, NULL, NULL),
(63, '26270100057', 125, 're_registration_pending', '2026-03-12 01:12:21', '2026-02-13 23:28:34', '2026-03-12 01:17:12', 1, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 9, 7, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 9, NULL, NULL, NULL),
(64, '26270100058', 126, 're_registration_pending', '2026-03-12 01:11:14', '2026-02-13 23:58:38', '2026-03-14 01:33:28', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / NH', 7, 6, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(65, '26270100059', 129, 'enrolled', '2026-02-25 23:29:36', '2026-02-16 02:41:52', '2026-03-09 23:20:26', 1, 1, 2, 'Brosur/Spanduk', NULL, 3, 2, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230325 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(66, '26270100060', 133, 'accepted', '2026-02-25 23:14:04', '2026-02-23 19:35:04', '2026-02-25 23:14:04', 1, 1, 1, 'Sekolah/Guru', 'M. Nurhariri S.Pd.i', 8, 3, NULL, 17, NULL, 8, NULL, NULL, NULL),
(67, '26270100061', 137, 'enrolled', '2026-03-12 01:09:53', '2026-02-26 23:10:16', '2026-03-30 00:23:50', 1, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'IBU PURBAWATI', 3, 8, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(68, '26270100062', 138, 'accepted', '2026-03-12 01:06:44', '2026-02-27 17:10:22', '2026-03-12 01:06:44', 2, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 10, 1, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 10, NULL, NULL, NULL),
(69, '26270200063', 143, 're_registration_pending', '2026-03-12 01:03:33', '2026-03-03 10:57:04', '2026-03-12 01:09:34', 2, 4, 2, 'Teman/Keluarga', NULL, 4, 5, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 4, NULL, NULL, NULL),
(70, '26270200064', 142, 'enrolled', '2026-03-12 01:01:19', '2026-03-03 11:05:48', '2026-03-25 20:47:27', 2, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 7, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 2, NULL, NULL, NULL),
(71, '26270200065', 146, 're_registration_pending', '2026-04-01 05:06:23', '2026-03-07 19:41:53', '2026-04-01 05:07:36', 2, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 7, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026', 3, NULL, NULL, NULL),
(72, '26270200066', 136, 're_registration_pending', '2026-03-12 00:57:23', '2026-03-08 03:21:41', '2026-03-12 01:05:49', 2, 1, 1, 'Teman/Keluarga', NULL, 3, 2, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan daftar ulang dengan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(73, '26270200067', 147, 're_registration_pending', '2026-03-12 00:51:17', '2026-03-09 05:53:23', '2026-03-12 01:00:23', 2, 1, 2, 'Website Resmi UNU Kaltim', NULL, 3, 8, NULL, 17, 'Selanjutnya Anda diminta untuk melakukan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(74, '26270200068', 151, 're_registration_pending', '2026-03-11 22:32:13', '2026-03-11 22:25:09', '2026-03-11 22:41:14', 2, 1, 1, 'Teman/Keluarga', NULL, 7, 6, NULL, 17, NULL, 7, NULL, NULL, NULL),
(77, '26270200069', 73, 'accepted', '2026-03-27 20:05:20', '2026-03-21 01:23:54', '2026-03-27 20:05:20', 2, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 2, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(78, '26270200070', 158, 'enrolled', '2026-03-27 20:07:30', '2026-03-22 17:38:22', '2026-03-29 20:27:49', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'Prof. Dr. Ir. Hamdani, S.T., M.Cs.,IPM. Dan No.Telpon: 08155145193', 7, 8, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 7, NULL, NULL, NULL),
(79, '26270200071', 161, 'enrolled', '2026-04-01 04:35:30', '2026-03-22 22:57:14', '2026-04-01 21:47:07', 2, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 8, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTP Rp.300.000,- batas akhir 10 April 2026', 3, NULL, NULL, NULL),
(80, '26270200072', 163, 'enrolled', '2026-04-01 04:34:39', '2026-03-24 18:55:55', '2026-04-28 01:06:28', 2, 1, 1, 'Teman/Keluarga', NULL, 3, 4, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTP Rp.300.000,- batas akhir 10 April 2026', 3, NULL, NULL, NULL),
(81, '26270200073', 165, 'enrolled', '2026-03-27 20:05:58', '2026-03-25 22:18:46', '2026-03-30 02:29:54', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'IBU PURBAWATI', 9, 6, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 9, NULL, NULL, NULL),
(82, '26270200074', 170, 'enrolled', '2026-03-30 11:35:26', '2026-03-27 22:49:09', '2026-04-02 17:34:41', 2, 1, 2, NULL, NULL, 3, 8, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(84, '26270200075', 171, 'accepted', '2026-03-30 11:34:27', '2026-03-28 02:47:52', '2026-03-30 11:34:27', 2, 1, 1, 'Sekolah/Guru', NULL, 1, 6, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 1, NULL, NULL, NULL),
(85, '26270200076', 173, 'enrolled', '2026-03-29 23:37:55', '2026-03-28 04:34:06', '2026-03-30 23:10:01', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'IBU PURBAWATI', 3, 8, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(86, '26270200077', 175, 'enrolled', '2026-03-29 21:00:48', '2026-03-29 06:19:04', '2026-04-01 22:09:07', 2, 1, 1, 'Brosur/Spanduk', NULL, 3, 4, NULL, 17, 'Selamat dan sukses, Anda diterima di Universitas Nahdlatul Ulama Kalimantan Timur. Selanjutnya, Anda diminta untuk melakukan pembayaran biaya registrasi (Rp.300.000) untuk mendapatkan Nomor Induk Mahasiswa (NIM) dan Jas Almamater ke Nomor Rekening BSI 2020230425 an. Universitas Nahdlatul Ulama Kalimantan Timur', 3, NULL, NULL, NULL),
(87, '26270200078', 180, 'accepted', '2026-04-01 04:33:09', '2026-03-31 01:33:17', '2026-04-01 04:33:09', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / ARS', 5, 7, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTP Rp.300.000,- batas akhir 10 April 2026', 5, NULL, NULL, NULL),
(88, '26270200079', 85, 'enrolled', '2026-04-01 04:22:17', '2026-03-31 23:53:44', '2026-04-01 21:27:50', 2, 1, 1, 'Brosur/Spanduk', NULL, 3, 2, NULL, 17, 'Kelengkapan ijazah menjadi administrasi penting setelah dinyatakan lulus oleh sekolah dan penyelesaian administrasi daftar ulang adalah mutlak pada 10 April 2026', 3, NULL, NULL, NULL),
(89, '26270200080', 185, 'enrolled', '2026-04-01 04:27:16', '2026-04-01 03:59:19', '2026-04-05 20:46:59', 2, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 2, 9, NULL, 17, 'Anda dinyatakan lulus adaministrasi menjadi calon Mahasiswa UNU KALTIM, jika secara prosedur administrasi akademik memenuhi yaitu : pendaftaran ulang dan pembayaran Almamater dan KTM sebesar Rp.300.000,- hingga 10 April 2026', 2, NULL, NULL, NULL),
(90, '26270200081', 178, 'enrolled', '2026-04-02 18:09:59', '2026-04-01 20:28:25', '2026-04-06 20:49:12', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'MAHASISWA UNU ANGGRA & M FAHREZA PRATAMA 083891422194  083812519165', 7, 4, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026', 7, NULL, NULL, NULL),
(91, '26270200082', 187, 'enrolled', '2026-04-02 01:20:48', '2026-04-02 01:13:03', '2026-04-23 00:56:00', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / WHD', 6, 7, NULL, 17, 'Anda dinyatakan lulus adaministrasi menjadi calon Mahasiswa UNU KALTIM, jika secara prosedur administrasi akademik memenuhi yaitu : pendaftaran ulang dan pembayaran Almamater dan KTM sebesar Rp.300.000,- hingga 10 April 2026', 6, NULL, NULL, NULL),
(92, '26270200083', 188, 'enrolled', '2026-04-02 19:44:44', '2026-04-02 19:08:32', '2026-04-29 17:29:25', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / DKY', 2, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026', 2, NULL, NULL, NULL),
(93, '26270200084', 189, 're_registration_pending', '2026-04-02 19:35:44', '2026-04-02 19:23:37', '2026-04-02 19:40:26', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR / DKY', 2, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 April 2026', 2, NULL, NULL, NULL),
(94, '26270200085', 190, 'accepted', '2026-04-09 00:12:03', '2026-04-05 16:07:46', '2026-04-09 00:12:03', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'Rudi Mulyadi', 3, 1, NULL, 17, 'Selamat anda diterima dan segera melakukan pendaftaran ulang dengan melakukan pendaftaran administrasi Rp.300.000 untuk Almamater dan KTK', 3, NULL, NULL, NULL),
(95, '26270200086', 140, 're_registration_pending', '2026-04-19 18:08:53', '2026-04-05 17:21:14', '2026-04-19 18:19:35', 2, 1, 1, 'Sekolah/Guru', 'Bu Puspa - SMK jamuatul muttaqin (+62 823-5896-1212)', 10, 2, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 Mei 2026', 10, NULL, NULL, NULL),
(96, '26270200087', 204, 'enrolled', '2026-04-08 05:09:29', '2026-04-08 04:54:05', '2026-04-09 00:25:17', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI/ DICKY EFENDY', 3, 2, NULL, 17, 'Anda dinyatakan lulus adaministrasi menjadi calon Mahasiswa UNU KALTIM, jika secara prosedur administrasi akademik memenuhi yaitu : pendaftaran ulang dan pembayaran Almamater dan KTM sebesar Rp.300.000,- hingga 10 April 2026', 3, NULL, NULL, NULL),
(97, '26270200088', 203, 'enrolled', '2026-04-09 00:09:01', '2026-04-08 20:31:30', '2026-04-28 18:53:40', 2, 1, 1, 'Teman/Keluarga', NULL, 3, 7, NULL, 17, 'Tolong dilengkapi Ijazahnya, apabila belum ada, sementara bisa dilengkapi dengan Raport', 3, NULL, NULL, NULL),
(98, '26270200089', 209, 're_registration_pending', '2026-04-16 22:48:08', '2026-04-10 06:25:29', '2026-04-16 23:18:44', 2, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 8, 6, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 8, NULL, NULL, NULL),
(99, '26270200090', 195, 'accepted', '2026-04-29 19:18:40', '2026-04-11 02:34:12', '2026-04-29 19:18:40', 2, 1, 1, 'Teman/Keluarga', NULL, 2, 7, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 2, NULL, NULL, NULL),
(100, '26270200091', 145, 'enrolled', '2026-04-23 01:29:50', '2026-04-12 21:41:37', '2026-04-24 04:05:29', 2, 1, 1, 'Teman/Keluarga', NULL, 1, 3, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan wawancara kesiapan untuk menjadi Mahasiswa UNU KALTIM, kami tunggu di Kampus 2 Jl. APT Pranoto atau menghubungi +62 812-5317-738 (Rudi Mulyadi) 082324579039 (Ahmad Khoirul Anwar)', 1, NULL, NULL, NULL),
(101, '26270200092', 213, 'enrolled', '2026-04-12 23:13:26', '2026-04-12 23:11:45', '2026-04-12 23:34:50', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 6, 9, NULL, 17, NULL, 6, NULL, NULL, NULL),
(102, '26270200093', 207, 'enrolled', '2026-04-19 18:00:54', '2026-04-12 23:40:12', '2026-04-23 04:44:32', 2, 1, 2, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 Mei 2026', 3, NULL, NULL, NULL),
(103, '26270200094', 214, 'enrolled', '2026-04-12 23:49:26', '2026-04-12 23:48:29', '2026-04-12 23:55:44', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 1, 7, NULL, 17, NULL, 1, NULL, NULL, NULL),
(104, '26270200095', 114, 'enrolled', '2026-04-19 17:53:49', '2026-04-14 18:38:24', '2026-04-19 21:01:57', 2, 1, 1, 'Teman/Keluarga', NULL, 2, 8, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 Mei 2026', 2, NULL, NULL, NULL),
(105, '26270200096', 200, 'accepted', '2026-04-30 00:07:47', '2026-04-14 19:05:37', '2026-04-30 00:07:47', 2, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 7, 5, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 7, NULL, NULL, NULL),
(106, '26270200097', 222, 'enrolled', '2026-04-14 21:45:12', '2026-04-14 21:41:01', '2026-04-15 20:04:34', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI / M. RAIHAN FADILAH', 6, 5, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 6, NULL, NULL, NULL),
(107, '26270200098', 221, 'enrolled', '2026-04-28 18:37:42', '2026-04-15 19:17:34', '2026-04-28 19:06:25', 2, 1, 1, 'Teman/Keluarga', NULL, 3, 4, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 3, NULL, NULL, NULL),
(108, '26270200099', 224, 're_registration_pending', '2026-04-17 00:53:57', '2026-04-16 17:48:25', '2026-04-18 21:28:15', 2, 1, 1, 'Media Sosial (Instagram/Facebook/Twitter)', NULL, 3, 4, NULL, 17, 'Anda dinyatakan lulus adaministrasi menjadi calon Mahasiswa UNU KALTIM, jika secara prosedur administrasi akademik memenuhi yaitu : pendaftaran ulang dan pembayaran Almamater dan KTM sebesar Rp.300.000,- hingga 10 Mei 2026', 3, NULL, NULL, NULL),
(109, '26270200100', 225, 're_registration_pending', '2026-04-17 00:25:25', '2026-04-16 22:49:29', '2026-04-23 03:18:07', 2, 1, 1, 'Teman/Keluarga', NULL, 7, 6, NULL, 17, 'Anda dinyatakan lulus adaministrasi menjadi calon Mahasiswa UNU KALTIM, jika secara prosedur administrasi akademik memenuhi yaitu : pendaftaran ulang dan pembayaran Almamater dan KTM sebesar Rp.300.000,- hingga 10 Mei 2026', 7, NULL, NULL, NULL),
(110, '26270200101', 226, 'enrolled', '2026-04-17 00:04:34', '2026-04-17 00:03:03', '2026-04-17 00:09:46', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 7, 6, NULL, 17, NULL, 7, NULL, NULL, NULL),
(111, '26270200102', 227, 're_registration_pending', '2026-04-17 01:20:39', '2026-04-17 01:13:07', '2026-04-24 05:28:05', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 3, 8, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan wawancara kesiapan untuk menjadi Mahasiswa UNU KALTIM, kami tunggu di Kampus 2 Jl. APT Pranoto atau menghubungi +62 812-5317-738 (Rudi Mulyadi)', 3, NULL, NULL, NULL),
(112, '26270200103', 228, 're_registration_pending', '2026-04-17 02:03:07', '2026-04-17 02:00:21', '2026-04-24 05:27:33', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 7, 8, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan wawancara kesiapan untuk menjadi Mahasiswa UNU KALTIM, kami tunggu di Kampus 2 Jl. APT Pranoto atau menghubungi +62 812-5317-738 (Rudi Mulyadi)', 7, NULL, NULL, NULL),
(113, '26270200104', 229, 'enrolled', '2026-04-17 16:59:48', '2026-04-17 16:55:51', '2026-04-18 00:16:17', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 2, 3, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,- batas akhir 10 Mei 2026', 2, NULL, NULL, NULL),
(114, '26270200105', 241, 're_registration_pending', '2026-04-22 01:11:51', '2026-04-22 00:00:31', '2026-04-22 01:15:38', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'Ahmad Khoirul Anwar', 10, 7, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan wawancara kesiapan untuk menjadi Mahasiswa UNU KALTIM, kami tunggu di Kampus 2 Jl. APT Pranoto atau menghubungi +62 812-5317-738 (Rudi Mulyadi)', 10, NULL, NULL, NULL),
(115, '26270200106', 242, 're_registration_pending', '2026-04-22 01:10:54', '2026-04-22 01:01:08', '2026-04-22 01:16:56', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'Rudi Mulyadi', 7, 6, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan wawancara kesiapan untuk menjadi Mahasiswa UNU KALTIM, kami tunggu di Kampus 2 Jl. APT Pranoto atau menghubungi +62 812-5317-738 (Rudi Mulyadi)', 7, NULL, NULL, NULL),
(116, '26270200107', 245, 'accepted', '2026-04-29 00:34:05', '2026-04-22 22:14:12', '2026-04-29 00:34:05', 2, 1, 1, 'Sekolah/Guru', NULL, 3, 5, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 5, NULL, NULL, NULL),
(117, '26270200108', 246, 'accepted', '2026-04-28 19:53:36', '2026-04-22 23:03:47', '2026-04-28 19:53:36', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', NULL, 3, 2, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 3, NULL, NULL, NULL),
(118, '26270200109', 251, 're_registration_pending', '2026-04-28 19:46:46', '2026-04-24 04:03:27', '2026-04-29 03:17:08', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'Kusnadi M.kom', 2, 10, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 2, NULL, NULL, NULL),
(119, '26270200110', 257, 're_registration_pending', '2026-04-24 05:20:30', '2026-04-24 05:14:57', '2026-04-24 05:25:41', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'AHMAD KHOIRUL ANWAR/NH', 1, 3, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 1, NULL, NULL, NULL),
(120, '26270200111', 258, 're_registration_pending', '2026-04-24 05:48:58', '2026-04-24 05:46:17', '2026-04-24 05:53:59', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 10, 3, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 10, NULL, NULL, NULL),
(121, '26270200112', 259, 're_registration_pending', '2026-04-24 06:14:27', '2026-04-24 06:10:32', '2026-04-24 06:22:09', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 3, 7, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 3, NULL, NULL, NULL),
(122, '26270200113', 239, 'accepted', '2026-04-28 01:20:50', '2026-04-24 08:09:31', '2026-04-28 01:20:50', 2, 1, 1, 'Teman/Keluarga', NULL, 2, 8, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 2, NULL, NULL, NULL);
INSERT INTO `registrations` (`id`, `registration_number`, `user_id`, `status`, `accepted_at`, `created_at`, `updated_at`, `registration_period_id`, `registration_type_id`, `registration_path_id`, `referral_source`, `referral_detail`, `choice_1`, `choice_2`, `choice_3`, `accepted_by`, `acceptance_notes`, `accepted_program_studi_id`, `rejected_at`, `rejected_by`, `rejection_reason`) VALUES
(123, '26270200114', 256, 'accepted', '2026-04-28 01:18:52', '2026-04-24 19:07:19', '2026-04-28 01:18:52', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'Kusnadi, M.Pd', 2, 7, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 2, NULL, NULL, NULL),
(124, '26270200115', 26, 're_registration_pending', '2026-04-28 01:18:10', '2026-04-25 22:15:43', '2026-04-28 01:20:02', 2, 1, 1, 'Teman/Keluarga', NULL, 1, 10, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 1, NULL, NULL, NULL),
(125, '26270200116', 265, 're_registration_pending', '2026-04-28 01:16:35', '2026-04-26 08:46:26', '2026-04-28 01:22:07', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 2, 3, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 2, NULL, NULL, NULL),
(126, '26270200117', 264, 'accepted', '2026-04-28 01:15:38', '2026-04-27 21:23:57', '2026-04-28 01:15:38', 2, 1, 2, 'Teman/Keluarga', NULL, 3, 7, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 3, NULL, NULL, NULL),
(127, '26270200118', 267, 'enrolled', '2026-04-27 23:28:00', '2026-04-27 23:26:34', '2026-04-27 23:33:45', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'ROFA RAHMAH (0895-1414-2313)', 7, 3, NULL, 17, 'Selamat Saudara diterima sebagai calon Mahasiswa UNU KALTIM', 7, NULL, NULL, NULL),
(128, '26270200119', 270, 're_registration_pending', '2026-04-28 00:23:33', '2026-04-28 00:20:57', '2026-04-28 00:42:40', 2, 1, 2, 'Dosen/Panitia PMB UNU Kaltim', 'RUDI MULYADI', 1, 2, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 1, NULL, NULL, NULL),
(130, '26270200120', 276, 're_registration_pending', '2026-04-29 18:31:17', '2026-04-29 18:28:49', '2026-04-29 18:36:39', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'Rudi Mulyadi', 2, 3, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 2, NULL, NULL, NULL),
(131, '26270200121', 272, 'accepted', '2026-04-29 23:14:43', '2026-04-29 21:23:23', '2026-04-29 23:14:43', 2, 1, 1, 'Brosur/Spanduk', NULL, 10, 1, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 10, NULL, NULL, NULL),
(132, '26270200122', 278, 're_registration_pending', '2026-04-29 23:46:25', '2026-04-29 23:44:18', '2026-04-30 00:00:41', 2, 1, 1, 'Dosen/Panitia PMB UNU Kaltim', 'IDA ROSANTI (082149162188) Dosen UNU KALTIM', 10, 3, NULL, 17, 'Anda diterima sebagai calon Mahasiswa UNU KALTIM secara administrasi, dan untuk menjadi Mahasiswa yang definitif dengan tidak mengabaikan bukti ijazah asli sebagai lulusan setingkat SLTA dengan itu diperlukan penyelesaian adaministrasi berupa pembayaran Almamater dan KTM Rp.300.000,-', 10, NULL, NULL, NULL);

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
(1, 'Umum/Reguler A', 'Jalur pendaftaran umum untuk calon mahasiswa baru', 1, '2025-12-17 03:30:03', '2026-04-29 19:06:57'),
(2, 'Reguler B', 'Jalur pendaftaran khusus untuk karyawan yang ingin melanjutkan pendidikan', 1, '2025-12-17 03:30:03', '2026-01-27 23:34:51');

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
(1, 'Gelombang 1 2026/2027', 1, '2026/2027', '2025-12-01', '2026-02-28', 0, NULL, '2025-12-11 11:45:50', '2026-03-01 12:13:43'),
(2, 'Gelombang 2 2026/2027', 2, '2026/2027', '2026-03-01', '2026-06-30', 1, 1000, '2025-12-20 07:54:43', '2026-03-01 12:13:43');

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

--
-- Dumping data for table `reregistration_payments`
--

INSERT INTO `reregistration_payments` (`id`, `user_id`, `amount`, `payment_proof_path`, `status`, `verified_by`, `verified_at`, `notes`, `created_at`, `updated_at`) VALUES
(1, 129, 300123.00, 'reregistration-payments/jDJjvcIapSlksoNlxsXWazZKOi0mILSBTcRYvLMV.jpg', 'verified', 17, '2026-03-09 22:43:11', NULL, '2026-03-09 22:38:54', '2026-03-09 22:43:11'),
(2, 25, 300000.00, 'reregistration-payments/jaIzckVCpMCFnqlIvnxw13zgg7lkk3X6K7C2K84w.jpg', 'verified', 17, '2026-03-09 23:51:25', NULL, '2026-03-09 23:49:22', '2026-03-09 23:51:25'),
(3, 57, 300000.00, 'reregistration-payments/N0JHVTrk1Ru5c8rDA9GIOsLXCQTuTYKFQP4mufsR.jpg', 'verified', 17, '2026-03-11 18:18:12', NULL, '2026-03-11 04:39:19', '2026-03-11 18:18:12'),
(4, 55, 300000.00, 'reregistration-payments/rXqkympSsl5Ty6sWpRQl9ZbMiLfk482hjgxVdueq.jpg', 'verified', 17, '2026-03-25 22:09:10', NULL, '2026-03-12 04:25:01', '2026-03-25 22:09:10'),
(5, 58, 300000.00, 'reregistration-payments/rwLME9AQaaxKVQ2KKGshJRNMobYYEGj8yhoMfZ1K.jpg', 'verified', 17, '2026-03-25 21:57:52', NULL, '2026-03-14 05:48:36', '2026-03-25 21:57:52'),
(6, 108, 300000.00, 'reregistration-payments/9whHQGSGwbrzKAbXvlcxSEdlfqPYrQjV6RlM83BX.jpg', 'verified', 17, '2026-03-15 19:00:16', NULL, '2026-03-15 18:56:20', '2026-03-15 19:00:16'),
(7, 142, 300000.00, 'reregistration-payments/ysq9t2Zj6cIiJPsOn2gkUgsbeTuMuE9tMw4MZ4pP.jpg', 'verified', 17, '2026-03-25 20:46:51', NULL, '2026-03-25 20:46:51', '2026-03-25 20:46:51'),
(8, 37, 300000.00, 'reregistration-payments/IgEltBTdHJbjuvzsKEvIC20m58mEPqRKnXo9DuRR.jpg', 'verified', 17, '2026-03-25 21:27:16', NULL, '2026-03-25 21:26:41', '2026-03-25 21:27:16'),
(9, 101, 300000.00, 'reregistration-payments/x7cueTvIKpBM9XocE8s2ZQPiZaUOjwUCk79rWBtg.jpg', 'verified', 17, '2026-03-25 21:53:19', NULL, '2026-03-25 21:53:07', '2026-03-25 21:53:19'),
(10, 113, 300000.00, 'reregistration-payments/yneCSUJaxd5TDqjHWjOv0kV5n8rbNoNPbFd7TQCp.jpg', 'verified', 17, '2026-03-27 21:28:42', NULL, '2026-03-27 21:26:13', '2026-03-27 21:28:42'),
(11, 158, 300000.00, 'reregistration-payments/2wiMQNNyYr5b86m75NweC23x41gEPGel9Q72G7K3.jpg', 'verified', 17, '2026-03-29 20:27:31', NULL, '2026-03-29 00:04:38', '2026-03-29 20:27:31'),
(12, 51, 300000.00, 'reregistration-payments/wG74BWH1zpBx4MQtVENMI7XGiBqJ2RrxtjeoJn2x.jpg', 'verified', 17, '2026-03-29 21:42:07', NULL, '2026-03-29 21:41:47', '2026-03-29 21:42:07'),
(13, 47, 300000.00, 'reregistration-payments/AK6RoaFoDsC9JIyIZK2l652PzdfEYFMf0boaxB4D.jpg', 'verified', 17, '2026-03-29 23:03:18', NULL, '2026-03-29 23:02:50', '2026-03-29 23:03:18'),
(14, 137, 300000.00, 'reregistration-payments/Gu1VCKsp82RLvzpSTwmu32FZUwyyyCDpYpZMptUR.jpg', 'verified', 17, '2026-03-30 00:23:31', NULL, '2026-03-30 00:23:16', '2026-03-30 00:23:31'),
(15, 74, 300000.00, 'reregistration-payments/erYP6TWw6fHSCUUcag1w04SYLnXnpRFk13TvEwRo.jpg', 'verified', 17, '2026-03-30 01:36:58', NULL, '2026-03-30 01:36:30', '2026-03-30 01:36:58'),
(16, 165, 300000.00, 'reregistration-payments/5SLaTwYzVkELqcbfFjwVi0lnBHmFve8T1iAUUEGG.jpg', 'verified', 17, '2026-03-30 02:29:28', NULL, '2026-03-30 02:27:54', '2026-03-30 02:29:28'),
(17, 65, 300000.00, 'reregistration-payments/pGo0OynniwIT0B3W0drBTdIHgVbvsL6smJx7TwAA.jpg', 'verified', 17, '2026-03-30 03:23:28', NULL, '2026-03-30 03:23:10', '2026-03-30 03:23:28'),
(18, 107, 300000.00, 'reregistration-payments/cZfV0rYDTPfClhhwr26ZqJmnCVaAtoGmlono0TeM.jpg', 'verified', 17, '2026-03-30 10:59:12', NULL, '2026-03-30 10:58:36', '2026-03-30 10:59:12'),
(19, 173, 300000.00, 'reregistration-payments/O1UDuu3EKIqv0jHicWlhjhwAuVchwOr04w4kX1WL.jpg', 'verified', 17, '2026-03-30 23:05:01', NULL, '2026-03-30 22:58:51', '2026-03-30 23:05:01'),
(20, 105, 300000.00, 'reregistration-payments/jZjQn8PUOAmuNj84lOTIEc9o61xF4crs1oiyT5eU.jpg', 'verified', 17, '2026-03-31 00:28:24', NULL, '2026-03-30 23:21:07', '2026-03-31 00:28:24'),
(21, 36, 300000.00, 'reregistration-payments/vsCRgLSPaRFhT0Jtw7h9rWWaldE6sQn4YzmKXj6T.jpg', 'verified', 17, '2026-03-31 00:30:06', NULL, '2026-03-31 00:27:05', '2026-03-31 00:30:06'),
(22, 59, 300000.00, 'reregistration-payments/HVMf5it66cB7UO9D2NRMUHfLXgXcOHKdS4KK1URN.jpg', 'verified', 17, '2026-03-31 02:53:32', NULL, '2026-03-31 02:50:10', '2026-03-31 02:53:32'),
(23, 67, 300000.00, 'reregistration-payments/76r3wuxsiF3q48uvo1Mp4HbB4i4QQqxuFVFjp9Yw.jpg', 'verified', 17, '2026-04-01 00:04:17', NULL, '2026-04-01 00:04:03', '2026-04-01 00:04:17'),
(24, 86, 300000.00, 'reregistration-payments/SyJ9ot5TxAsSQ6MFkAZyIRLmIIeOFYLgQ9Z78LoW.jpg', 'verified', 17, '2026-04-01 04:39:18', NULL, '2026-04-01 04:27:41', '2026-04-01 04:39:18'),
(25, 161, 300000.00, 'reregistration-payments/0GD3eJzk8r6cbeguhBLcQA7fGzjHmDX5fp9OPXpj.jpg', 'verified', 17, '2026-04-01 21:46:34', NULL, '2026-04-01 07:22:18', '2026-04-01 21:46:34'),
(26, 85, 300000.00, 'reregistration-payments/iFxyyuQWpcmhXs1iGLFIkdgbwyALYpI7PQ9SSvMV.jpg', 'verified', 17, '2026-04-01 21:26:56', NULL, '2026-04-01 21:26:39', '2026-04-01 21:26:56'),
(27, 100, 300000.00, 'reregistration-payments/LwrKvI4YqUNe6fB0brrDzYVOpKa65oqQj0S4C9Z0.jpg', 'verified', 17, '2026-04-01 21:41:03', NULL, '2026-04-01 21:40:44', '2026-04-01 21:41:03'),
(28, 76, 300000.00, 'reregistration-payments/ql0DfAsHJKn9g6eWI1rDKpH4fmGQRrShOKLdX1VU.jpg', 'verified', 17, '2026-04-01 21:58:41', NULL, '2026-04-01 21:58:20', '2026-04-01 21:58:41'),
(29, 175, 300000.00, 'reregistration-payments/ugoaBb66DGDwjSt3tbeqznryUNiZjDHbQmfpoKZ8.jpg', 'verified', 17, '2026-04-01 22:08:48', NULL, '2026-04-01 22:08:13', '2026-04-01 22:08:48'),
(30, 104, 300000.00, 'reregistration-payments/CxdCwsrxeLr211BultSVNFHzXm9hg4NujENfC2NZ.jpg', 'verified', 17, '2026-04-01 22:24:29', NULL, '2026-04-01 22:21:18', '2026-04-01 22:24:29'),
(31, 23, 300000.00, 'reregistration-payments/GubCVL6GjZ8W7fpJ31TP3PwwJ7ymGVJ2JKQEwLNy.jpg', 'verified', 17, '2026-04-01 23:19:55', NULL, '2026-04-01 23:19:41', '2026-04-01 23:19:55'),
(32, 170, 300000.00, 'reregistration-payments/0SCwIzAFD2RuDfL0GuDjW46saUAq9ULOwulkkuCc.jpg', 'verified', 17, '2026-04-02 17:34:19', NULL, '2026-04-02 06:08:21', '2026-04-02 17:34:19'),
(33, 185, 300000.00, 'reregistration-payments/o5Bhz4PwMU6OxlsoZUHfWtpJNBK94CGAvcP1fE7R.jpg', 'verified', 17, '2026-04-05 20:46:01', NULL, '2026-04-05 20:45:40', '2026-04-05 20:46:01'),
(34, 53, 300000.00, 'reregistration-payments/mRaYHRAmxijlWrQqcc9QsA2Lw4nR7W06rVlZf4jg.jpg', 'verified', 17, '2026-04-06 20:18:51', NULL, '2026-04-06 06:04:30', '2026-04-06 20:18:51'),
(35, 178, 300000.00, 'reregistration-payments/ARLeclBUyGkoQX20jEGeQU2wuv65zhLt6NfvGiDE.jpg', 'verified', 17, '2026-04-06 20:48:44', NULL, '2026-04-06 20:48:34', '2026-04-06 20:48:44'),
(36, 60, 300000.00, 'reregistration-payments/DQphXlZhSEkuSwTC59Ax2j2mXx83IpSyBFuzkMhk.jpg', 'verified', 17, '2026-04-07 03:10:43', NULL, '2026-04-07 03:10:13', '2026-04-07 03:10:43'),
(37, 204, 300000.00, 'reregistration-payments/1Kp1yhpVExG0VA0ohq1RV03KZMJzl7TwO5bpweLV.jpg', 'verified', 17, '2026-04-09 00:22:52', NULL, '2026-04-09 00:22:17', '2026-04-09 00:22:52'),
(38, 32, 300000.00, 'reregistration-payments/ZdKvRSod45iZ88IMZIeOm49jhxLsHNU1zTgyApG9.jpg', 'verified', 17, '2026-04-09 22:34:46', NULL, '2026-04-09 22:34:20', '2026-04-09 22:34:46'),
(39, 213, 300000.00, 'reregistration-payments/nGSLDb90DP34NEtZjz8n42F8d9oR6iGszxzFoYO8.jpg', 'verified', 17, '2026-04-12 23:34:31', NULL, '2026-04-12 23:34:14', '2026-04-12 23:34:31'),
(40, 214, 300000.00, 'reregistration-payments/T1WBgOIXihJuxk0e3CNpKgV6eSCjoiYLZveLIjuN.jpg', 'verified', 17, '2026-04-12 23:55:29', NULL, '2026-04-12 23:55:16', '2026-04-12 23:55:29'),
(41, 222, 300000.00, 'reregistration-payments/vya5KN280rI1kFLHRHubzybyyD4BAZgp95E81KuH.jpg', 'verified', 17, '2026-04-15 20:04:17', NULL, '2026-04-15 20:03:53', '2026-04-15 20:04:17'),
(42, 226, 300000.00, 'reregistration-payments/4JCm31X4L95IfIFmpiwwYPWVWnQtklxLfJ4zKhcr.jpg', 'verified', 17, '2026-04-17 00:09:36', NULL, '2026-04-17 00:09:17', '2026-04-17 00:09:36'),
(43, 229, 300000.00, 'reregistration-payments/OMVdRoFN2ho3XtUMVXUnstFunNMKkZVO1Z4tKHzL.jpg', 'verified', 17, '2026-04-18 00:16:01', NULL, '2026-04-18 00:15:39', '2026-04-18 00:16:01'),
(44, 114, 300000.00, 'reregistration-payments/m2QE5WWMyYEaZYPQrhNQ0NDDFrNnrT7DtglWEH2U.jpg', 'verified', 17, '2026-04-19 21:01:36', NULL, '2026-04-19 21:01:12', '2026-04-19 21:01:36'),
(45, 187, 300000.00, 'reregistration-payments/lCyyn2mxIBWhYbdeyawJk7mTdlaeqWljL0xfByB3.jpg', 'verified', 17, '2026-04-23 00:55:33', NULL, '2026-04-23 00:55:20', '2026-04-23 00:55:33'),
(46, 207, 300000.00, 'reregistration-payments/KGeOOfniuaiXMe8a8j53zMLEt5oLeW3mTMJEdaa1.jpg', 'verified', 17, '2026-04-23 04:40:30', NULL, '2026-04-23 04:06:22', '2026-04-23 04:40:30'),
(47, 145, 300000.00, 'reregistration-payments/yDlpoRwjrToaUf8JEatCXj2tawj6mGuPtMtBzNiE.jpg', 'verified', 17, '2026-04-24 04:05:04', NULL, '2026-04-24 04:04:42', '2026-04-24 04:05:04'),
(48, 267, 300000.00, 'reregistration-payments/UcdtZ6lbcXk128n2u9n5eVksNm1ga7zVKMZxals3.jpg', 'verified', 17, '2026-04-27 23:33:26', NULL, '2026-04-27 23:32:52', '2026-04-27 23:33:26'),
(49, 163, 300000.00, 'reregistration-payments/eVSGW8KncX86agzRTL7yEodSwKNbd9kCu6S4azFW.jpg', 'verified', 17, '2026-04-28 01:06:08', NULL, '2026-04-28 01:05:49', '2026-04-28 01:06:08'),
(50, 203, 300000.00, 'reregistration-payments/oEsLjUyIMxkOMSenxSugEYQTCTTxKpqrZvj6st4p.jpg', 'verified', 17, '2026-04-28 18:53:10', NULL, '2026-04-28 18:52:56', '2026-04-28 18:53:10'),
(51, 221, 300000.00, 'reregistration-payments/uHAIzo5pokdiI3bPyp88jOBpo4jMYcf0Y8FJ8CGR.jpg', 'verified', 17, '2026-04-28 19:05:50', NULL, '2026-04-28 19:05:37', '2026-04-28 19:05:50'),
(52, 188, 300000.00, 'reregistration-payments/nihamtALj9EJbzTPsSGEtkoBSladNGi1k3MYoRfm.jpg', 'verified', 17, '2026-04-29 17:29:01', NULL, '2026-04-29 17:28:24', '2026-04-29 17:29:01');

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
('4JuEgDgIePwujkatLcww65ENcjbEL6cyDp7VqlpJ', NULL, '216.73.217.4', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzJnWnhtdHJiWGdTWDl0aURwazNnZHY0dFZOMTlPallwcWFUNE41TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1777531940),
('f8EoQ0ZsK1PVMpTxk0FgBfWTsrBlrc4fbLHlocBT', 17, '36.89.249.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOUJldWFncTFJRU9NdkZFbXBFS2VXUG5VVnhQdmFpU0c4d0JaUUNUbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9hZG1pbi9hZG1pc3Npb24tbGV0dGVycy8yL3BkZiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE3O30=', 1777534754),
('P9sWDND4zoHpoWYW8Ul98lzl6BVcBX9pM7sHgVto', NULL, '2404:c0:c601:df48:6103:9076:89df:8488', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3VlV2RYYnJ2eTZFZkxqb3IwTVRsWFpEYnAxa014dWpsRlBoM0xQdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1777531765),
('Ui3F8S1LUw8a0UEdKuIiHvB9hj6M0bSu4zvaT9x7', NULL, '2404:c0:c601:df48:6103:9076:89df:8488', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibm1LcWRpWTlMV2hVWmJrRzZlOEVQOEs5N1Fxa2JaeTRNa2owTzFvRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1777532920),
('X2dNwoeHeELjPPEXq2YxZteggUaAU4OiznTcxdg7', NULL, '52.167.144.209', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFl3ZnJtTkhJWmJzQTN6ZXBuaFpZOWZMdk5YNjFGM0pScmVZNEJhciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vcG1iLnVudWthbHRpbS5hYy5pZC9zaXRlbWFwLnhtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1777532620);

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
(8, 22, 'IKWALUDIN IRKHAMNI', '6472051103030004', '0031739671', 'SMA/SMK', 'SMK Negeri 5 Samarinda', 'Bisnis dan Pemasaran', '083852596613', 'Laki-laki', '2003-03-11', 'Samarinda', 'Islam', 'Jl. Trisari RT. 21', 'Mistiani', NULL, NULL, NULL, NULL, NULL, NULL, 'SIDODADI', '75123', 'SAMARINDA ULU', 'KOTA SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/cW8q2NeIXCma3zQZj2vpT5nD6CI8HJlHgWJwQEVY.jpg', 'students/kk/03Pq9ptRVeRvL8fYgI4gcLheLD1Dx8tYFhr0u69r.pdf', 'students/ktp/mBTvA8mNVAQY3UxTFsWCzIGJxPS1O7pmEEdmCTu5.pdf', 'students/certificates/MPHNqMF169WN15cniuo7fLHkvA2wQAD5ElMKDEO4.jpg', '2025-12-16 22:09:08', '2026-03-14 01:45:19'),
(9, 23, 'Mouhammed Zidane Basayev Al Usman', '6471031207030005', '3038038524', 'SMA/SMK', 'SMK TI LABBAIKA', 'Teknik komputer dan jaringan', '087715729215', 'Laki-laki', '2003-07-12', 'Bogor', 'Islam', 'Jl. Pada Elo No.173 Rt.002', 'Ranto Yuni Muliyana', NULL, NULL, NULL, 'Jl.Pada elo No.173', '02', '00', 'Baqa', '75131', 'Samarinda Seberang', 'Samarinda', 'Indonesia', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/zY63zlZaqPuQH4OsYSW59rjwtJeP8voE2ZwN9IIH.jpg', 'students/kk/kV8pKWOIkblCJdmlfpYM3NlXXhJqlKhgzyDA0T5Z.pdf', 'students/ktp/O7WcOC8vDbjP5qmmzOMqMcD21pZj2vv0JHntbbFL.jpg', 'students/certificates/RVItoQy8UeMTBXeedacw04p1ZaHeQ0XKaJCDyuVl.pdf', '2025-12-16 22:38:31', '2026-04-01 23:19:41'),
(10, 25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', '6472023105050001', '0052490733', 'SMA/SMK Sederajat', 'PONPES IMAM ASY-SYATHIBY Gowa Makassar', 'Agama Islam', '085750296152', 'Laki-laki', '2005-05-31', 'Samarinda', 'Islam', 'JL. Tanjung Aru, RT.015, Kelurahan Mangkupalas, Kecamatan Samarinda Seberang', 'Satriati Sulaiman', NULL, NULL, NULL, 'MANGKUPALAS', '015', '000', 'MANGKUPALAS', '75241', 'Samarinda seberang', 'KOTA SAMARINDA', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/vIeTCL0dRes0kR2st8pnRLf5E8Ckh7h6ha1JUCpE.jpg', 'students/kk/L37drQJW68CkHE7nzl4e4vBolrP5KLVmSpPgYboH.jpg', 'students/ktp/X0PzllONDdkUMvIqN2Hll3KWWlzCGyzlzoggBjHB.jpg', 'students/certificates/rUw64FZchQvpuyUmUeEbyYiatrwnl46CzoHC7q8I.jpg', '2025-12-17 10:19:10', '2026-03-09 23:48:24'),
(11, 26, 'Emilda Ainun alzahra', '6472066005070007', '0074866571', 'SMA/SMK Sederajat', 'SMA BUDI LUHUR', NULL, '085934592604', 'Perempuan', '2007-05-20', 'Samarinda', 'Islam', 'Jalan KS Tubun dalam gang wiratirta RT 17 no 02', 'Nurul laili', NULL, NULL, NULL, 'Jalan KS Tubun dalam gang wiratirta', '17', '-', 'Sidodadi', '75123', 'Samarinda ulu', 'Kota Samarinda', 'Prov. Kalimantan Timur', 0, NULL, 'wali', 'sepeda_motor', 'form_completed', 'students/photos/4Itf0t8FJB2DRFumklRxMC1N8LhlLkUZQKc2LVHz.png', 'students/kk/YJ5jfMkcGcDJkjemPWXGUo1eSEU5i5LeAtfiM8yl.pdf', 'students/ktp/lqvOn4UHKIhLAYA2dmKeG92NSOmjuPaoabuSnAP1.pdf', 'students/certificates/T3V2cXFjXIsdlfegXK9NDfGljmkjW92ckJjtKz97.pdf', '2025-12-18 02:59:12', '2026-04-28 22:16:08'),
(12, 18, 'Sindiya kartika', '6402034107991004', '9993349686', 'SMA/SMK Sederajat', 'SMAN 2 LOA JANAN', 'IPA', '085163137202', 'Perempuan', '1999-09-21', 'Bakungan', 'Islam', 'Jl.gerbang dayaku desa bakungan rt 08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/2lj5u37uBswis7H9fk2vBVGUQbaw4xD5MEXwk9qF.jpeg', 'students/kk/z9NjdCiFTtIKHDowiOgu6xUloviZeQ4e5dEh7qBk.jpeg', 'students/ktp/P9yyaXBEYnpEVj7XzNSSJr5Yu5ZRKmnQPTjrJ2Vf.jpeg', 'students/certificates/l9MauTw5EAvvluSLozuUQ8A73fxzAWnGCJodUUhS.jpeg', '2025-12-19 20:11:48', '2025-12-19 20:11:48'),
(13, 28, 'Eka putri nur aisyah', '6402164906050002', '0059599318', 'SMA/SMK Sederajat', 'SMK YPM DIPONEGORO', 'Multimedia', '085822516904', 'Perempuan', '2005-06-09', 'Tenggarong', 'Islam', 'Tenggarong seberang,Manunggal jaya L2 blok E rt 06', 'Sri wardani', NULL, NULL, NULL, 'Telaga kencana', '06', '00', 'Manunggal jaya', '75572', 'Tenggarong seberang', 'Kutai kartanegara', 'Kalimantan timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'form_completed', 'students/photos/IPSHAQJRU7Z9Vf2PO1l86No8WBADg9Aip3bGKHR2.jpeg', 'students/kk/Jw5mlD9Lhr67Gfh7EwoLT2lEinjTuuHBrhTWwHoz.jpeg', 'students/ktp/7ssLFs75WC089fWZiBT57LsbJ4JOB5m0OW1WgFUM.jpeg', 'students/certificates/LOPIFOZySZgEk2fB3Uq3JgM3wefJZikPck7IA2Fp.jpeg', '2025-12-19 20:50:26', '2026-03-27 20:34:09'),
(14, 30, 'Egha Aulia Renatasari', '6402165606050003', NULL, 'SMA/SMK Sederajat', 'Sma Negeri 1 Tenggarong Seberang', 'ipa', '082255726898', 'Perempuan', '2005-06-16', 'Kutai Kartanegara', 'Islam', 'Desa Sukamaju, Rt 12, No. 16, Kec. Tenggarong Seberang', 'Remy Rupiawati', NULL, NULL, NULL, 'Sidodadi', '12', '04', 'Desa Sukamaju', '75262', 'Tenggarong Seberang', 'kutai kartanegara', 'kalimantan timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'form_completed', 'students/photos/SJMqh40UBhODcbFm0bLOm67O704goSFEX59BtjXs.JPG', 'students/kk/sE4Kijmkrs3qQrPEvx2nAAhAvkR1uB0yU4s8SOo3.jpeg', 'students/ktp/OcM50ZemRmstkYZcOUzGbFgEz9JExBjmHThDzouT.jpeg', NULL, '2025-12-21 09:07:19', '2026-02-11 00:06:59'),
(16, 32, 'DHINI ALEXANDRA KUMALASARI', '6472075903060002', '3067311527', 'SMA/SMK', 'SMAN 4 SAMARINDA', NULL, '0895 3443 22525', 'Perempuan', '2006-04-19', 'PETUNG', 'Islam', 'JL. PATIMURA\r\nMANGKUPALAS\r\nSAMARINDA SEBERANG', 'Vivi Fitriyani', NULL, NULL, NULL, NULL, '04', NULL, 'Mangkupalas', '75133', 'Samarinda seberang', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/fGlHvzBYl3ukSY2wVVZrHjXOKfWHJ0kxl6MEgw6Y.jpeg', 'students/kk/cgQLHvr577X55JFBiseZfaSBEtslwoS2xzPnZsd9.pdf', 'students/ktp/Ri8YCNoIJATEPCmjEPpPEJsNxJ8EKXrxLeppYrQ5.pdf', 'students/certificates/SWBZwfKAtadJW2TgCS9y8GdDvbaxY8Pv4lqYOnEo.pdf', '2025-12-22 00:27:28', '2026-04-09 22:34:20'),
(20, 36, 'ALVIN', '6472012708030002', '0025776132', 'SMA/SMK', 'SMK KESEHATAN', NULL, '+62 851-8498-4637', 'Laki-laki', '2003-08-27', 'SAMARINDA', 'Islam', 'JL. KESEHATAN RAWA MAKMUR PALARAN', 'Kumala Sari', NULL, NULL, NULL, NULL, '31', NULL, 'Rawa Makmur', '75243', 'Palaran', 'Kota Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/1weXtCAu4a30K365YiXnZSSOBeBiyiXbz6H8TtIN.jpeg', 'students/kk/glzumttGhNAqLhPMTnbp37UJuwtbpNnOfwaLreAP.pdf', 'students/ktp/ueOfE3ud7bgDb53qVI1w5N0IGPvhYAVsobryWOnR.pdf', 'students/certificates/HiQc0HGSuDmW8gjJPU3Q4AEogNb2JUvPgKgbsrQc.pdf', '2025-12-22 05:06:19', '2026-03-31 00:26:12'),
(21, 39, 'Nur Ayu Syafutri', '6472016609030002', '0030295995', 'SMA/SMK Sederajat', 'SMK farmasi Samarinda', 'Teknologi laboratorium medik', '082154177300', 'Perempuan', '2004-09-26', 'Pallangga', 'Islam', 'Jalan Borneo rt 24 samping spbu', 'Irmawati', NULL, NULL, NULL, 'Jln.borneo rt.24 samping spbu', '24', '0', 'Simpang pasir', '75243', 'Palaran', 'Samarimda', 'Kalimantan timur', 0, NULL, 'bersama_orang_tua', 'angkutan_umum', 'form_completed', 'students/photos/06JZkxVlYrAmXeaJeHMfoftDGC5umQDpubYCS5EW.JPG', 'students/kk/IKIJCdWwCh00Q0sUkOcq3rBYpMZnnv0niw79UVjJ.pdf', 'students/ktp/P6MqzJvaC5Yvd6fD53Ab39bmsTsKYW3Cnm8j88r5.pdf', 'students/certificates/65TdjfFDfotNqh5m9kLKmnrlWBdVZZf50p54P2sw.pdf', '2025-12-24 08:22:32', '2026-04-13 23:02:15'),
(22, 37, 'Dhava ade syawaluddin', '6402160112040001', '0044526688', 'SMA/SMK Sederajat', 'SMA NEGERI 2 TENGGARONG', 'IPS', '085651251219', 'Laki-laki', '2004-12-01', 'SAMARINDA', 'Islam', 'KUTAI KARTANEGARA TENGGARONG SEBRANG LOA LEPU RT 03', 'RIMA SAFA\'ATI', NULL, NULL, NULL, NULL, '03', NULL, 'LOA LEPU', '75216', 'TENGGARONG SEBERANG', 'KUTAI KARTANEGARA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/Rh8TNXBvACZAMBBb7a6s7NM1jWXDzPGPaOq83P8E.jpg', 'students/kk/R89tFAo2sO9NSJp6hRW452HEyCcTGJlvJ35O45wB.jpg', 'students/ktp/f5NKcSpFufVrnVKmPLh9pMftRZBkJ6pk0bKU78qC.jpg', 'students/certificates/ZVxm6jyutNIBo4CGnXKr4TAWWznLCKbOKcomJq66.jpg', '2025-12-25 01:05:15', '2026-03-25 21:26:41'),
(25, 43, 'SILVANA TIARA ANGGRENI', '6408076403070001', '30405722', 'SMA/SMK Sederajat', 'SMKS TI LABAIKA', NULL, '081549738581', 'Perempuan', '2007-03-24', 'MARAH HALOQ', 'Islam', 'MARAH HALOQ RT 01 KECAMATA TELEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/4c3QE1MckstWNR4T5JimEtgoYwerMTwOpjyBLvwZ.jpg', 'biodata/kk/PtGC8JY36BYshZ1GmeJ8uVKhwDHKIdvivrsfMNtj.pdf', 'biodata/ktp/XSVOPEvoWXxazZIfa6ZHxeyRdt3dnDZn47Y0JUhK.pdf', 'biodata/certificates/bUD0GqsUJ6Ev5ATRVqNJeuXfTt108UcSyB3S2RIs.pdf', '2025-12-30 08:20:05', '2025-12-30 08:20:05'),
(26, 44, 'RIDWAN', '6402040203010002', '0018099699', 'SMA/SMK Sederajat', 'MA MIFTAHUL ULUM ANGGANA', NULL, '081255422011', 'Laki-laki', '2001-04-02', 'TANJONGE', 'Islam', 'JL. PEMBANGUNAN\r\nANGGANA\r\nRT 14', 'Rose', NULL, NULL, NULL, NULL, '014', NULL, 'ANGGANA', '75381', 'ANGGANA', 'KUTAI KARTANEGARA', 'KALIMANTAN TIMUR', 0, NULL, 'asrama', 'sepeda_motor', 'completed', 'biodata/photos/8cDzi8GYncPzg2QvJH8xWjLGDsOgJ23zSHw5gFhh.jpg', 'biodata/kk/HY5Bw3GKFsqxr9MQ4O1NxsIeU7J0cL46R68IuvGq.pdf', 'biodata/ktp/OhxzdtDk1YEhOvqdxEk8hmRbaqqFyd9eRWdv8lrV.pdf', 'biodata/certificates/dqE7dQBks398A2asmgKD5c4gYUtqdGzkfC9e3hzD.pdf', '2025-12-30 13:12:45', '2026-03-14 01:52:58'),
(27, 45, 'ABRIAN ISLAMI PERKASA.S', '6408182001070001', '0076466671', 'SMA/SMK Sederajat', 'SMK MEDIKA SAMARINDA', 'TBSM', '082252542337', 'Laki-laki', '2007-01-20', 'kuala bali', 'Islam', 'JL.POROS RT. 003 MUKTI UTAMA LONGMESANGAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/js9lMIot6WDa0dWVhrZ622Np1xYG8Pz1FEzNeWFi.jpg', 'students/kk/HnRzJhw0tXQmwMbEuuDVvszshgKmkhWLfGuCnfi5.pdf', 'students/ktp/sZzhPeEVJAuQGe1U3IUMRgC4QifkSFINWkEN11H5.jpg', NULL, '2026-01-01 10:23:31', '2026-01-09 04:21:45'),
(28, 46, 'ABRIAN ISLAMI PERKASA.S', NULL, NULL, NULL, NULL, NULL, '082252542337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-01 10:27:08', '2026-01-01 10:27:08'),
(29, 47, 'FADHILAH RAMDANIAH', '6402085212010004', '0018533295', 'SMA/SMK Sederajat', 'SMA ISLAM TERPADU NURUL ILMI TENGGARONG', NULL, '082150207691', 'Perempuan', '2001-12-12', 'KOTA BANGUN', 'Islam', 'JL. SRI BANGUN RT. 19 DESA. KOTA BANGUN ULU KEC. KOTA BANGUN', 'Fatimah', NULL, NULL, NULL, NULL, '019', NULL, 'Kota Bangun Ulu', '75561', 'Kota Bangun', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'wali', 'sepeda_motor', 'completed', 'biodata/photos/6OGijskkYzAluy3RsUVc01Bdh2CPHWXjF4C91wQm.jpg', 'biodata/kk/EhqGivExjzlQ8bBQGlgvxtnAfKi3MQCPfwOBQzWa.pdf', 'biodata/ktp/h06NXotkXONGcgp8Vfs5YBoRzvRC6FkhoigsYN3M.pdf', 'biodata/certificates/eUzaQSgMj3ke4yoZO0nTRY5pQFTaPSwqTYovsZbt.pdf', '2026-01-01 13:34:48', '2026-03-29 23:02:50'),
(31, 49, 'ISMAIL HASAL AL - AZZAM', '6472030610070008', '0072420082', 'SMA/SMK Sederajat', 'SMK 17 SAMARINDA', 'Farmasi', '081522546898', 'Laki-laki', '2007-10-06', 'Samarinda', 'Islam', 'Jl. Rejo Mulyo RT 32 NO 19 Kelurahan Lempake Kecamatan Samarinda Utara Kota Samarinda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/ppwoJ30g0qa5NI2SyRXCDoZQ7CiKJwevIHM7fQtR.jpg', 'students/kk/z1G3l89DXZbY8nJZYL36G45yFkwlkt4MDASk1T3F.jpg', 'students/ktp/j3X1sWBUtMhb2EvwDh7WFfKic2CF2ldthAPw96ts.jpg', 'students/certificates/afchkLopMB5ZNyZXVqU2LxD50toSiW1uky3tWLcP.jpg', '2026-01-02 07:51:43', '2026-01-02 10:06:47'),
(32, 50, 'JULIANDA FEBRIANNUR', '6402082107040004', '0042151699', 'Paket C', 'ABDI BANGSA KOTA BANGUN', NULL, '081255758610', 'Laki-laki', '2004-07-21', 'KOTA BANGUN', 'Islam', 'JL. SRINBANGUN RT. 19 KEC. KOTA BANGUN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/Bo1mAlFTeaPEb3vWwwmIUdYqnU1o8z1OefBgLwMG.jpg', 'biodata/kk/5LM3JPU71H1xJeIQanQ4b98XSaZdSRZjTKaqC4zq.pdf', 'biodata/ktp/GjEjFkgyHoyUiuEeIsy1n1NNwlInzRI8e3bx6r4e.pdf', 'biodata/certificates/TNy5GfQu2TjDWJ8CK7eSSUJYA0TBvZz788nDxyca.pdf', '2026-01-02 15:45:30', '2026-01-02 15:45:30'),
(33, 51, 'FAUZIAH MAULIDYA', '6402066404050003', '0050617089', 'SMA/SMK Sederajat', 'SMA ISLAM TERPADU NURUL ILMI TENGGARONG', NULL, '082157598157', 'Perempuan', '2005-04-24', 'KUTAI KARTANEGARA', 'Islam', 'JL. SUAKA POLEWALI RT.4 DESA. JONGKANG KEC. LOA KULU', 'Siti Ngaisah', NULL, NULL, NULL, NULL, '004', NULL, 'Jongkang', '75571', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/m9ZBtf76iq7D5Rf6kcHYZ5741Cwzs0PmQPLlKDnm.jpg', 'biodata/kk/d6oLclqur6ymjKifFs0QmVlAu1fgnkLGY1dE2FF4.pdf', 'biodata/ktp/4Qe2v0MjPvHz6j33PkpAF26e84WimTa6jHXlXNpa.pdf', 'biodata/certificates/C2AJH42O3lR4IPzhTP1AfGIwjpRhbWry4GHnFY9x.pdf', '2026-01-04 13:38:57', '2026-03-29 21:28:01'),
(34, 52, 'Jannatul aulia', '6472066606030001', '3034235511', 'Paket C', 'Sma albanjari', 'Ips', '085750314922', 'Perempuan', '2003-06-26', 'Samarinda', 'Islam', 'Jln datu iba gg datu umar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/DatoUUsNGttEUidZxETcjJb0f4T6paI1H7Fcsj51.png', 'students/kk/sjGtdVlslP6UZUt6tCdzfSS3LLJYTd4NSDh3yKSa.jpg', 'students/ktp/rEmZAcJq2q1s76ld19a9hfO0xVCCceJC3lwwCKmc.jpg', 'students/certificates/Tgc5aJaKDFfR56b5MA4DqPPpQb3PcoLB0bNwZbSo.jpg', '2026-01-05 13:08:47', '2026-01-05 13:37:56'),
(35, 53, 'Muhammad Fahmi', '6472062001010003', '0010259768', 'SMA/SMK Sederajat', 'SMA MA\'ARIF SAMARINDA', 'ILMU PENGETAHUAN SOSIAL', '085185948789', 'Laki-laki', '2001-01-20', 'SAMARINDA', 'Islam', 'JL. SLAMET RIYADI NO. 1 RT. 12', 'Salasiah', NULL, NULL, NULL, 'Jalan Slamet Riyadi No. 1', '12', NULL, 'Teluk Lerong Ulu', '75243', 'Sungai Kunjang', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/nXSjoiwKw6YOoD8SmRWlPosqABNVRGbGpKUf2O12.jpg', 'students/kk/tULRKVXlKU3zu8gbnDqe9xy2hF6l4cJT8clTU0uu.jpg', 'students/ktp/Ke4sL71ZaGZS0U8yw9oRbYwDLnCVMVsDY6mOzoVY.jpg', 'students/certificates/BeBgxZlCxB85pokMobxY3gRamvEAMFi4yQslbVdX.jpg', '2026-01-05 18:06:42', '2026-04-06 20:18:51'),
(36, 54, 'Sahrul halil', NULL, NULL, NULL, NULL, NULL, '087850933180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-05 20:30:09', '2026-01-05 20:30:09'),
(37, 55, 'Yunitha Hapsari Hidayat', '6402037006060004', '0063951695', 'SMA/SMK Sederajat', 'SMK FARMASI SAMARINDA', NULL, '083130670823', 'Perempuan', '2006-06-30', 'Loa Duri Kutai Kartanegara', 'Islam', 'jl.gerbang dayaku gg mahakam 10 rt03 loa duri ulu kec loa janan', 'normala yanti', NULL, NULL, NULL, 'dusung malang', '003', '001', 'loa duri ulu', '75391', 'loa janan', 'kutai kartanegara', 'kalimantan timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/5zdb3WMuN3469p6W1hln5LUcjaSrheNgc4ehDBkn.jpg', 'biodata/kk/8T2yTp0lwTnjraB1dgFCqscsGE3GfJpjPilZj9ms.jpg', 'biodata/ktp/Ksn50suTFXn06mB4KdkMcqK4GnBt9VHYAp84tfXO.jpg', 'biodata/certificates/BVoXyJGQv1ttUeWRuh6A1OLi1qBFr74MTYLBZXkr.jpg', '2026-01-06 16:01:33', '2026-03-25 22:08:20'),
(38, 56, 'M. FAUZAN DIYANTO', '6402152112050001', '0052531311', 'SMA/SMK Sederajat', 'SMKN 1 SANGA SANGA', NULL, '082255374647', 'Laki-laki', '2005-12-21', 'SANGA SANGA MUARA', 'Islam', 'Jl.Budiono RT,02 Sanga-sanga muara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/WaitewoeyocAdoZTtbQLcpADZGRPsUYfZo1WSbA6.jpg', 'biodata/kk/gDxzLHAfNJhnBx5bbQya4JTbt8hLHJ4dIPfMOckA.jpg', 'biodata/ktp/YiHDL0XxMwUGCY7fAFPIWUCMYw0SBN3xQnupogvA.jpg', 'biodata/certificates/10xtt1MgfvkcUYhBfV7gCTHi28PAbmsA5EPwIpoi.jpg', '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(39, 57, 'Ahmad zaini', '6402131509010001', '0010147821', 'SMA/SMK Sederajat', 'Smk pesisir samboja', 'Administrasi perkantoran', '081254632095', 'Laki-laki', '2001-09-15', 'Martapura', 'Islam', 'Sei tanggi rt 2,kel. Handil baru, kec. Samboja, Ku-kar', 'Aisyah', '631390150728000', NULL, NULL, 'Sei tanggi', '02', '0', 'Handil baru', '72579', 'Samboja', 'Kutai kartanegara', 'Kalimantan timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/mtLEQmQ20Z5O9MJNzf2IQNSIUv0xHfPbVC5C5RaD.jpg', 'students/kk/PNAijOpIydiyCem1jbVQju42gHuXLuAvHHcz2P8e.jpg', 'students/ktp/pf8S6KAJlS9nLkmwHIW83Ljzb9c3vAZDBLNa3nOZ.jpg', 'students/certificates/7sIFVnnzxwJLrUuPuCuBmalHRVAFelBkp7Tp78lY.jpg', '2026-01-07 17:34:49', '2026-03-11 18:16:40'),
(40, 58, 'HUSNI MUBARAK', '6472062810010004', '0011770226', 'SMA/SMK Sederajat', 'SMAN 4 SAMARINDA', 'IPA', '081347159070', 'Laki-laki', '2001-10-28', 'Samarinda', 'Islam', 'Jl. P. Antasari No. 40 Rt. 08', 'SRI HANDAYANI', NULL, NULL, NULL, 'Jl.P.Antasari No. 40 RT. 08', '08', NULL, 'Teluk Lerong Ulu', '75127', 'Sungai Kunjang', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/8Im1oZwvXGyXT1qb0fr2V1eJeWGBY1BIzu8aeYQE.png', 'students/kk/C4beBjwZCvMAcj2UrMJTpd69wKh1F61Dc40tOk3u.jpg', 'students/ktp/TjLu5oqOWvwM8kyS9i2o9scwgyqZTgyvEWdZ0WUl.jpg', 'students/certificates/M4zPpetzC0Eq60LhZf1WTCBqsTXHu8kVKIhKPGHo.jpg', '2026-01-09 04:06:38', '2026-03-25 21:57:27'),
(41, 59, 'Nadya salwa maharani', '6472026806060005', '0061352892', 'SMA/SMK Sederajat', 'SMKN 8 Samarinda', 'Otomatisasi tata kelola perkantoran', '089526615664', 'Perempuan', '2006-06-28', 'samarinda', 'Islam', 'jl.mangkupalas', 'siti maimunah', '6472026806060005', NULL, NULL, 'jl.mangkupalas', '013', '-', 'mesjid', NULL, 'samarinda seberang', 'samarinda', 'kalimantan timur', 0, NULL, 'bersama_orang_tua', 'ojek', 'completed', 'students/photos/NVPysVIAlvNHzjmjIkRsEzxmbJXcJTC3DmA0Hj61.jpg', 'students/kk/gMVp53Ej6HIMKwRBxO8iFgOpI08vOHaL0kqwqLEu.pdf', 'students/ktp/C5ph2kjL7BdYAI960y4mhbU5gIudbvXfW3W3mtCh.pdf', 'students/certificates/GV0X2HfFmsgO0K9ABa0yuX4vASVyQ4Fm1uNrpzJl.pdf', '2026-01-09 18:39:47', '2026-03-31 02:48:55'),
(42, 60, 'Selviana rahmadani', '6472024310060004', '0069252883', 'SMA/SMK Sederajat', 'SMAN 4 Samarinda', 'IPA', '085393356619', 'Perempuan', '2006-10-03', 'Samarinda', 'Islam', 'Jl mas penghulu', 'FITRI', NULL, NULL, NULL, NULL, '08', NULL, 'MESJID', '75133', 'SAMARINDA SEBERANG', 'KOTA SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/H7LACUmO3ckG4GITHh045lmWxgGMRg0zh2x3ioiv.jpg', 'students/kk/17PNRc1r41pyWXQyUyALFvWcJUhbjS6EnMzpC2aD.jpg', 'students/ktp/ejwJ01p1Wo8enfUqEAHKkFlPssx70Dg130NHhCRI.jpg', 'biodata/certificates/HC5a6xQqq9aSxJ4sm37UcC5Ap1mrmTWx9pVq4WtL.jpg', '2026-01-09 18:41:19', '2026-04-07 01:40:44'),
(43, 61, 'fitra ainun bukari', NULL, NULL, NULL, NULL, NULL, '085845917001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-09 19:23:19', '2026-01-09 19:23:19'),
(44, 62, 'SHANDY BAGUS NUR RAHMAD', NULL, NULL, NULL, NULL, NULL, '087887099742', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-09 22:18:57', '2026-01-09 22:18:57'),
(47, 65, 'NUR WAFIQ AZIZAH', '6402114407030003', '0034861436', 'SMA/SMK Sederajat', 'SMA NEGERI 1 MUARA KAMAN', NULL, '082254265670', 'Perempuan', '2003-07-04', 'MUARA KAMAN', 'Islam', 'JL. MULAWARMAN DS. SUMBERSARI KEC. SEBULU', 'Mastiah (Almarhumah)', NULL, NULL, NULL, NULL, '001', NULL, 'Sumber Sari', '75552', 'Sebulu', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'wali', 'sepeda_motor', 'completed', 'biodata/photos/iX6XSHixsL0TxT8moVpXVHLTfrCuiQI6EtcxAn5Q.jpg', 'biodata/kk/l7BsxT3vXztfpwW3N0smt5DtkopaLmqal7EuSnVG.jpg', 'biodata/ktp/QiZJPHGdGuv6Y3hWgsdNiKxSBEhc1S3pG0lZgwXh.jpg', 'biodata/certificates/MmMVKSX80Ls4KBrsTucsJSlUFA2eh17WAHRtcY30.jpg', '2026-01-09 23:19:36', '2026-03-29 22:41:53'),
(48, 66, 'Cinta', NULL, NULL, NULL, NULL, NULL, '085256927248', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-10 00:15:38', '2026-01-10 00:15:38'),
(49, 67, 'Cinta', '6472025310207000', '0077317590', 'SMA/SMK Sederajat', 'SMKN 8 Samarinda', 'akuntansi dan keuangan', '085256927248', 'Perempuan', '2007-02-13', 'samarinda', 'Islam', 'jl. mas penghulu gg. hm. idris', 'Sarah', NULL, NULL, NULL, NULL, NULL, NULL, 'Mesjid', '75133', 'Samarinda Seberang', 'Kota Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/w9lXPa03JHNcSgGxr5YGS36OZ6mkqtLXlxJO2njW.jpg', 'students/kk/bkEnNg509v50pgzFg9V0IOtIJSfeFVmxkGnXanaC.jpg', 'students/ktp/06eym5PIsDkHpvNPFzamacSBoXTd4RJzFe40d5AF.jpg', 'students/certificates/GWEpQ4GPOlROnmkLO4TLhS53L96ro66klwl9gNNo.jpg', '2026-01-10 00:18:08', '2026-03-31 01:20:17'),
(50, 68, 'Desty Amanda Lukman', '6472054812050004', '0059070301', 'Paket C', 'Pusat Kegiatan Belajar Masyarakat Yukitablajar', 'IPS', '085751529642', 'Perempuan', '2005-12-08', 'Samarinda', 'Islam', 'JL. KH. USMAN BERAHIM, RT.14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/13YubxrgqFqHjpyPqvudKuzSeo3us5sAnmFArmSb.png', 'students/kk/nkbP74rhx66mHGfTfiKQsZL8R1K2X9EjRfIb6gFt.jpg', 'students/ktp/P8QWWuruaxO77lTMMZrHkavSDD9PyDoPnxr57WwE.jpg', 'students/certificates/QVgk2yvvqpk6sOYDKnWauKpMqQ19Yr3Ugbm3NdUx.jpg', '2026-01-10 00:35:15', '2026-01-10 23:03:22'),
(51, 69, 'Heri Purnomo', NULL, NULL, NULL, NULL, NULL, '082260704959', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-10 01:17:06', '2026-01-10 01:17:06'),
(52, 70, 'iisSetianah', NULL, NULL, NULL, NULL, NULL, '+6282155588906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-10 21:35:08', '2026-01-10 21:35:08'),
(53, 71, 'Ahmad Jefri Murtadho', NULL, NULL, NULL, NULL, NULL, '083141638159', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-11 00:22:32', '2026-01-11 00:22:32'),
(54, 72, 'Nurul Azizah Azzarah', '6472036506080005', '0082226430', 'SMA/SMK Sederajat', 'Smk Negeri 17 Samarinda', 'Farmasi', '083894783725', 'Perempuan', '2008-06-25', 'Samarinda', 'Islam', 'Harapan baru Jl. Jati II Loa janan ilir rt. 027', 'Fatimah', NULL, NULL, NULL, NULL, '27', '-', 'Harapan Baru', '75131', 'Loa jaman ilir', 'kota samarinda', 'kalimantan timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'form_completed', 'students/photos/Dgd0bbAFh1bKUb8XBOjT9nzXD097iXRLm5JaCko3.jpg', 'students/kk/JEoCoSg7Z1e0EPPlmGzkme805BCqSXovCUxMLEmU.jpg', 'students/ktp/C3Q6wEETxZhrkl9DE7gTL19nQK4sBJ19dMViYzjc.jpg', NULL, '2026-01-11 01:17:05', '2026-04-01 06:33:57'),
(55, 73, 'MUHAMMAD NANDA BASTIAN', '6402142512040001', '0046273265', 'SMA/SMK Sederajat', 'SMK NASIONAL', 'OTKP Perkantoran', '08225572279', 'Laki-laki', '2004-12-25', 'MUARA JAWA', 'Islam', 'Jln.sukarelawan, Handil 9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/pxpfb4nYYEs3A6SieJ3N3knIoWL0uIaTA2yOxTtp.jpg', 'students/kk/H7atKcIhm2NdNBINYkEYoFV3XN7fjMlZwMkfeKNe.jpg', 'students/ktp/jpE1NR65Gf17L8xvtDrbBm9rglHAKKCT2jsn7L5Z.jpg', 'students/certificates/EGoXJzZJYfgRmlhyskmE0zuAO6lWvtNXFcHIt1BC.jpg', '2026-01-11 09:46:57', '2026-03-21 01:21:44'),
(56, 74, 'Enggal Wrihatnolo', '6472030707010001', '0010258834', 'SMA/SMK Sederajat', 'SMK N 2 SAMARINDA', 'Teknik Audio dan Video', '089654807163', 'Laki-laki', '2001-07-07', 'Samarinda', 'Islam', 'Jl. Trisari RT 21 No 29\r\nKelurahan Sidodadi \r\nKecamatan Samarinda Ulu', 'Wakini', NULL, NULL, NULL, NULL, '021', NULL, 'SIDODADI', '75243', 'SAMARINDA ULU', 'KOTA SAMARINDA', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/N2xycLmkAfZQxTK6wSAN1UFHx0btV1qZ5DsrlS7M.jpg', 'students/kk/kKy6ChTFn1l6b8g3kWBOz2CHps7jvr0bBPqK829p.jpg', 'students/ktp/GqsujiMo77D4JaGi0TZNjKMEcfzFC4j30ZEgnuKf.jpg', 'biodata/certificates/VnM8l9KPe73lURuhoUCzZ0NHphekR1uFpa0a7yG6.jpg', '2026-01-11 17:57:18', '2026-03-14 01:26:10'),
(57, 75, 'Dinda Aprilly arham', '6472056104000008', '0005081989', 'SMA/SMK Sederajat', 'SMA negeri 16 Samarinda', 'Ips', '0882022601734', 'Perempuan', '2000-04-21', 'Samarinda', 'Islam', 'Jalan sejati gang rambai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/VQ7jbBomq8dOWy7kwkzMKmtZ3roPQxSYUfIM3eho.jpg', 'students/kk/9CtBBwuz2xNwmITE2adDsm5ZfXCSU6XR7CtS2VQS.jpg', 'students/ktp/kfQNtffgLjo33REXVioENPXsCi6hNDjhhhnmPUSz.jpg', 'students/certificates/fvNSm9ioNcFIMtgS7eY9XEtmMWXFoEAGnGn1RjLe.jpg', '2026-01-11 19:45:45', '2026-01-11 20:00:59'),
(58, 76, 'karin aprila', '6402024804070001', '0073925820', 'SMA/SMK Sederajat', 'Sma Negeri 5 Samarinda', 'IPA', '083190932564', 'Perempuan', '2007-04-08', 'Samarinda', 'Islam', 'JL. P. SURYANATA GG. 9 RT 27 AIR PUTIH SAMARINDA ULU', 'Sunarsih', NULL, NULL, NULL, NULL, '27', NULL, 'AIR PUTIH', '75243', 'Samarinda Ulu', 'SAMARINDA', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/DV9e5kwcjpWKaL7RWKh12TpxyC1EIxI3aG1o96YR.jpg', 'students/kk/fDyaO0hH4hJ2LcZS57w9W5J7DahN0HmSHX11mF8h.jpg', 'students/ktp/gYY4tY6vhA0zVnS2cU1iXHxoE7znURmdLfeg3V6N.jpg', 'students/certificates/Sug71IvrRlUfImUqurz0WELK3BRZcNLn80iLXIKz.jpg', '2026-01-11 20:07:03', '2026-04-01 06:56:35'),
(59, 77, 'Inzalna', NULL, NULL, NULL, NULL, NULL, '085820766365', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-12 05:35:10', '2026-01-12 05:35:10'),
(60, 78, 'risna mangindara', NULL, NULL, NULL, NULL, NULL, '088242026730', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-12 19:22:04', '2026-01-12 19:22:04'),
(61, 79, 'Arma Wati', NULL, NULL, NULL, NULL, NULL, '083812754543', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-13 01:42:44', '2026-01-13 01:42:44'),
(62, 80, 'RIZKYNA RAMADHANI', NULL, NULL, NULL, NULL, NULL, '085020401755', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-13 19:22:54', '2026-01-13 19:22:54'),
(63, 81, 'Muhammad adam', '6402032801040002', '0040471661', 'Paket C', 'PKBM BUMI ETAM', 'ips', '083877731362', 'Laki-laki', '2004-01-28', 'Bakungan', 'Islam', 'Jl.Gerbang Dayaku', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/8sIyaSZ24H8Erk6M4wVczb8mw5iJDDeKHtt9atuU.jpg', 'students/kk/QCB8Gt6HuArLDiBg3UTXBBfNnYrTuh5fbkoferdS.jpg', 'students/ktp/MfmObjily1kzCO1GPgMCsbSCd9w3MnoS3JnVbtyC.jpg', 'students/certificates/iWLXLmEaahRyhsqtPyz2tDmVY33Rwt9L0nwIlwEA.jpg', '2026-01-14 01:56:59', '2026-01-14 02:03:39'),
(64, 82, 'Iis Setianah', NULL, NULL, NULL, NULL, NULL, '+6282155588906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-14 19:35:20', '2026-01-14 19:35:20'),
(65, 83, 'Raudah nur fauziah nisa', '6471056810030004', NULL, 'SMA/SMK Sederajat', 'SMK negeri 1 muara jawa', 'Asisten keperawatan', '085820942765', 'Perempuan', '2003-10-28', 'Balikpapan', 'Islam', 'Jln Mulawarman rt11 handil baru kecamatan samboja Kutai katanegara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Lm23l0RQFuHsBnzTdZRI9qlXnFXojxlDR2jXklov.png', 'students/kk/4jK5WpMdy76LREkTZs86XKGAyz7ELhS9DKWb7QDG.png', 'students/ktp/IHUu4FwSC2DXBIgsnMizyWN3jsBFuMsCoSikzRI2.png', 'students/certificates/rxIf3quidRCcnjTdY0bHLvU8Z9XMroQd9D2epBAk.png', '2026-01-14 21:59:43', '2026-01-14 22:05:25'),
(66, 84, 'ANDRA SATRIANIE RASYID', '6472022304010001', '0010274258', 'SMA/SMK Sederajat', 'SMKN 2 SAMARINDA', NULL, '085219460661', 'Laki-laki', '2001-04-23', 'SAMARINDA', 'Islam', 'JL. CIPTO MANGUN KUSUMO LOA JANAN ILIR SAMARINDA', 'Herlina Ningsih', NULL, NULL, NULL, NULL, '019', NULL, 'HARAPAN BARU', '76114', 'LOA JANAN ILIR', 'KOTA SAMARINDA', 'Kalimantan Timur', 0, NULL, 'kost', 'sepeda_motor', 'completed', 'biodata/photos/Sc7HtRvDClVJ5l5Y6YPICXBBrZ00Qe42eF32uGUa.jpg', 'biodata/kk/pr0oA6F2jP58LhMlzSlGX6AzZ05QUbQptUiVjA8k.jpg', 'biodata/ktp/LDW1zt0rDI7Wemb6UO6H9hJ1St3aBehWlbG9XLTV.jpg', 'biodata/certificates/P8KAEq35ypwYFj0mm5tNYR3BS4GaYETQbKTiDGIq.jpg', '2026-01-14 22:29:49', '2026-03-14 01:11:56'),
(67, 40, 'Anita Ardian', '6472016910070001', '0079163580', 'SMA/SMK Sederajat', 'SMKN NEGERI 11 SAMARINDA', 'TKJ (TEKNIK KOMPUTER DAN JARINGAN)', '085651337295', 'Perempuan', '2007-10-29', 'MAKASSAR', 'Islam', 'Jl.borneo Rt 024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/9ax0iitaCrOvoAAGWbmkuUNc6UDu0CZlRGM5em5t.jpg', 'students/kk/b1XrX0pFo2bIU5gbjpZgI6QuKqyvXQlybv0pbZV2.jpg', 'students/ktp/lBDcIcu7Zp58DVK9RYeofhdnyYx87OuVMbbqOxvU.jpg', 'students/certificates/yyJdxSNVJKxlZhBCioWiroCvVzcPvAIOPZ6oIO1O.jpg', '2026-01-15 05:19:40', '2026-01-15 06:45:38'),
(68, 85, 'MUHAMMAD SASTRA WINANGUN', '6472081501160002', '16602', 'SMA/SMK Sederajat', 'MA MAMBAUS SHOLIHIN', 'IPS', '08995728735', 'Laki-laki', '2007-02-13', 'GROBOGAN', 'Islam', 'JLN. SENTOSA GG KENANGAN 7 DALAM RT 077 KELURAHAN SUNGAI PINANG DALAM KECAMATAN SUNGAI PINANG KOTA SAMARINDA KALIMANTAN TIMUR', 'SUMYATUN', NULL, NULL, NULL, NULL, '77', NULL, 'SUNGAI PINANG DALAM', '75117', 'SUNGAI PINANG', 'KOTA SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/1h9U46qELamTGfUjFCHdGpTiYvcyhEOcRWr7gEN3.jpg', 'students/kk/zhUdaDbdKYHBYWnt9nkKF0Pf71jsa7g7Jpr6E4LP.jpg', 'students/ktp/71yjsl6rWwS5gTcNYBrzcFwDpYSDo7ZYESf3ZR8G.jpg', 'biodata/certificates/DxXAkhCwcUvEAMEAJEeRfsEzNSrjyPbjfU7x0f8J.jpg', '2026-01-16 03:13:04', '2026-04-09 21:20:54'),
(69, 86, 'Muhammad Haiqal Amien', '6472061603040004', '0043845313', 'Paket C', 'Al Husna', 'IPS', '085158210047', 'Laki-laki', '2004-03-16', 'samarinda', 'Islam', 'Jl.Cendana Gg.4 No.26 Kel. Karang Anyar', 'Rully Hayani', NULL, NULL, NULL, 'Jl.cendana Gg.4 No.16', '05', '06', 'Karang Anyar', '75127', 'Sungai Kunjang', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/QQylPKOPnn4vjH01BkP9LL7QQl9ByRw2ZTxyISE1.jpg', 'students/kk/v7aC9ui3ddqQtEWXB8UcpkIxqSRUJUsNiplnPms0.jpg', 'students/ktp/rAQmi8OcdAscSjkMZa6nRMXyhvO3tbarMseMTq1C.jpg', 'students/certificates/lkS83wrSXqfFH0shB5D6nAxgvUMJX79NUun8Xobs.jpg', '2026-01-16 09:43:52', '2026-04-01 04:38:55'),
(70, 87, 'Muhamad Diky Tiaz', '6402132111030002', '003416449', 'Paket C', 'PKBM Kuranji', 'IPS', '085249625921', 'Laki-laki', '2003-11-21', 'Samboja', 'Islam', 'Kecamatan samboja \r\nKelurahan Teluk pemedas \r\nRt 006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/kICfbyISIIHDk45Lw2IcMltJsBBNUDqjrnoLa3XU.jpg', 'students/kk/hIQVJbyIpLEgAToDSOgB0fHx5sstklp16WrBfr7t.jpg', 'students/ktp/aVk8nTBeXpfvW6JnTLT8ivgSVxIZuG2rwtRDqy8G.jpg', 'students/certificates/RREmdy44kVqdamXQVIwOdsr8AqoNIBqXdIynrqYG.jpg', '2026-01-19 23:08:34', '2026-01-19 23:18:23'),
(71, 88, 'Roykhan Na\'im', '6412160909080001', '0088851118', 'SMA/SMK Sederajat', 'Ma Al Masyhuriyah', 'IPS', '081250361378', 'Laki-laki', '2008-09-09', 'Tenggarong Seberang', 'Islam', 'Jln Dahliah RT 10 Desa Bukit Raya Kecamatan Tenggarong Seberang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/6CJiEfzA1x9057IvBuNtOVySiJoGBHgAOK5bAt7R.jpg', 'students/kk/lma7Lz6uKRtleiTHUAAJcqXLp46WDEU4BHKuy2oj.jpg', 'students/ktp/JWBW4Isac83UbgeIpDZUuxPuAlgJFcEPBSuhGB7W.jpg', NULL, '2026-01-19 23:47:20', '2026-01-27 01:08:41'),
(72, 89, 'ELA AURORA', NULL, NULL, NULL, NULL, NULL, '082383064531', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-20 15:12:18', '2026-01-20 15:12:18'),
(73, 90, 'ELA AURORA', '6402054801080002', '0088370908', 'SMA/SMK Sederajat', 'SMA NEGERI 1 MUARA BADAK', 'Kurikulum Merdeka ( biologi, ekonomi, bahas Indonesia tingkat lanjut, Matematika tingkat lanjut', '082353064531', 'Perempuan', '2008-01-08', 'Kalimantan Timur, Kab Kutai Kartanegara, Kec Muara Badak, Desa Muara Badak Ulu', 'Islam', 'JL. PLN RT009', 'ROSNENI', NULL, NULL, NULL, NULL, NULL, NULL, 'Muara Badak Ulu', '75382', 'Muara Badak', 'KAB. KUTAI KARTANEGARA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'form_completed', 'students/photos/KwNzTqgYnfgDP9A8n6iD3jpq5exvQOe0vADNqTxT.jpg', 'students/kk/qt5d0rakpQ0bBIzZRisgFliagKIE4pazX1SxfewU.jpg', 'students/ktp/gYQpBfKWknaqm9duBqFqojsAdBUp83mqlytKF4v2.pdf', NULL, '2026-01-20 16:53:46', '2026-04-01 05:21:53'),
(74, 92, 'Roykhan Na\'im', NULL, NULL, NULL, NULL, NULL, '081250361378', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-22 06:59:05', '2026-01-22 06:59:05'),
(75, 93, 'Farida Rachman', NULL, NULL, NULL, NULL, NULL, '081254549408', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-23 05:53:14', '2026-01-23 05:53:14'),
(76, 94, 'Farida Rachman', NULL, NULL, NULL, NULL, NULL, '081254549408', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-23 05:56:36', '2026-01-23 05:56:36'),
(77, 95, 'Kaysha Sudjono', NULL, NULL, NULL, NULL, NULL, '083875525454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-23 21:31:45', '2026-01-23 21:31:45'),
(78, 96, 'Sayid Hamid', NULL, NULL, NULL, NULL, NULL, '081340086236', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-24 06:35:29', '2026-01-24 06:35:29'),
(79, 97, 'SHANDY BAGUS NUR RAHMAD', NULL, NULL, NULL, NULL, NULL, '087887099742', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-24 07:01:28', '2026-01-24 07:01:28'),
(80, 98, 'Shine Alif', NULL, NULL, NULL, NULL, NULL, '+62 821-8651-2251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-24 16:51:41', '2026-01-24 16:51:41'),
(81, 99, 'Nur Fithratinnisa', NULL, NULL, NULL, NULL, NULL, '6281646046540', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-25 19:34:19', '2026-01-25 19:34:19'),
(82, 100, 'SITI AISIYAH MAURA BUNGA MEYRISKA', '6472036905080001', '0081877105', 'SMA/SMK Sederajat', 'SMKN 17 SAMARINDA', NULL, '082133016401', 'Perempuan', '2008-05-29', 'SAMARINDA', 'Islam', 'JL. KS. TUBUN DALAM SIDODADI SAMARINDA ULU', 'SRI UTAMI SARI DEWI SULISTIAWATI', NULL, NULL, NULL, 'JL. KS TUBUN DALAM', '013', '000', 'Sidodadi', '75123', 'Samarinda Ulu', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/oulTgjhRUJIh9ajxojpSFS0QL7U4mbr3JCidwIBW.jpg', 'biodata/kk/hM5TpnbXlIf4SJKAa0uBNI13nEpceAvWxwtiwCDz.jpg', 'biodata/ktp/wxKuMBolUV2ynBgd9sWlPTx0X9NSFMeGa6zhD7Gr.jpg', 'biodata/certificates/9kwMtnq9yAvPjDnPCNqMU0gH9DphVAkkxy2MMMF6.jpg', '2026-01-25 23:13:17', '2026-04-01 21:40:44'),
(83, 101, 'JOKO SIDIK PURNOMO', '6471041107030005', '0031545477', 'SMA/SMK Sederajat', 'SMKN 5 BALIKPAPAN', NULL, '083895213895', 'Laki-laki', '2003-07-11', 'BALIKPAPAN', 'Islam', 'Jl. P.Antasari No.44 RT.62', 'Sukinem', '435642202729000', NULL, NULL, 'Karang Rejo', '62', '44', 'Karang Rejo', '76124', 'Balikpapan Tengah', 'Balikpapan', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/YOD4x584qaNlixP1ZeHYdGjmCZz9wIPl3YThSZRZ.jpg', 'biodata/kk/ZVOgGw2LMxufJD3fanfbLX4DptJqzzkHfhQySMyQ.pdf', 'biodata/ktp/KsHWSdfHYd61gGtDeONjqebqaaIRIx6ODrS9hBkC.pdf', 'biodata/certificates/3NyszC9KRo4NHnPxWiBUHUuA85SY9LfsKC3ldEHS.pdf', '2026-01-26 00:57:41', '2026-03-14 01:56:09'),
(84, 102, 'ELA AURORA', NULL, NULL, NULL, NULL, NULL, '082353064531', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-26 06:55:11', '2026-01-26 06:55:11'),
(85, 103, 'Alya dwi bahli', '6402146302060002', '0065143224', 'SMA/SMK Sederajat', 'SMK Medika Samarinda', NULL, '083895529893', 'Perempuan', '2006-02-23', 'MUARA JAWA', 'Islam', 'Jl.balikpapan - Handil2 , Handil baru tengah Rt.08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/CiuR9g9mj6pcimBoHABJHeTsSH2fx8UtTztlBQQB.jpg', 'biodata/kk/2zbojcEc7wvS8J85jwBLmkF5Y6Pz112yPBS1M3SX.jpg', 'biodata/ktp/GQjImYuzu8zWNLLIf3Ljdoqdrm0cbpezOelIcMfw.jpg', 'biodata/certificates/dbu6HUm3Im3KaVnH8mgfwBFd9d0WKJZRCkmmfVXg.jpg', '2026-01-26 21:07:01', '2026-01-26 21:07:01'),
(86, 104, 'Amelia Rahma', '6472036205080003', '0085913806', 'SMA/SMK Sederajat', 'SMKN 17 SAMARINDA', 'Farmasi', '083876857482', 'Perempuan', '2008-05-22', 'SAMARINDA', 'Islam', 'JL. P. ANTASARI Gg.6 Rt.45 No.23 SAMARINDA ULU', 'Sulistiowati', NULL, NULL, NULL, 'JL. PANGERAN ANTASARI Gg.6', '045', '000', 'Kelurahan Air putih', '75124', 'Samarinda Ulu', 'Kota Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/cmCQZegztIYJlY23YiltqL6Bbjk3p9snVawbfRh4.jpg', 'biodata/kk/xrJymW8ro4xwDmkmPGicJYpasug1U5fuMelvAXNI.jpg', 'biodata/ktp/VAUrhxZW0Zb4SNgOeSuH6Z8mbkvHoBm9Z0fNwYje.jpg', 'biodata/certificates/gGSlq0nV3m3LYNhlBSrSFahCCMcMur6nqQXxlmU7.jpg', '2026-01-27 00:27:44', '2026-04-01 22:24:29'),
(87, 105, 'ATIKAH FAISA ASYARA', '6472027009060004', '3065885310', 'SMA/SMK Sederajat', 'MAN 1 KOTA SAMARINDA', NULL, '082354922897', 'Perempuan', '2006-09-30', 'SAMARINDA', 'Islam', 'JL. SUTRA MURNI 2 KEL. BAQA KEC. SAMARINDA SEBERANG', 'Wardah hafied', NULL, NULL, NULL, 'Jalan sutra murni', '09', '00', 'Baqa', '75132', 'Samarinda seberang', 'Samarinda', 'Kalimantan timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/JDsfhU45g8TlGL2vnjpgBX2GU4NMiJ9RHT6axXJ7.jpg', 'biodata/kk/ZhDy3xm4CotZuVxhS35En1CEYcEq9a0Nk0WqCpA7.pdf', 'biodata/ktp/hLiF2Rt1ZMWT3mzOfaeeX3D1OuyoGHoF3lKR3wZg.pdf', 'biodata/certificates/sxmgbT1Zp4V5kCpV65n09xQwZE9jhpWXFrPyyyeq.pdf', '2026-01-27 00:32:38', '2026-03-31 00:28:24'),
(88, 106, 'Imel Dayanti', NULL, NULL, NULL, NULL, NULL, '081545497259', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-27 01:42:38', '2026-01-27 01:42:38'),
(89, 107, 'DINI RAMADANI', '6402055007020005', '0025731864', 'SMA/SMK Sederajat', 'SMA Negeri 1 Muara Badak', NULL, '082154672080', 'Perempuan', '2002-07-10', 'Tarakan', 'Islam', 'Jln.Insan Raya Rt.11', 'Natang', NULL, NULL, NULL, NULL, '010', NULL, 'BADAK BARU', NULL, 'MUARA BADAK', 'KUTAI KARTANEGARA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/sMUSukeg1L9HSNEWW1ptbBsz8lOqzoGnnhGMtoTW.jpg', 'biodata/kk/rekIOB48WHuoUb0O8I5WRyLv6XNK5zV0h7PacuV7.pdf', 'biodata/ktp/y9toxvRcoTDfmyKI5wUyCUuj93CETm9eY5KE2H7F.pdf', 'biodata/certificates/1TnasmnykHv5AySuBpslriYs5Tf32JQhh0u5nlvq.pdf', '2026-01-27 01:50:02', '2026-03-30 10:58:36'),
(90, 108, 'Naila Nurul Amni', '6472064506070002', '0076816883', 'SMA/SMK Sederajat', 'SMK PURWAJAYA', 'Farmasi', '081351699387', 'Perempuan', '2007-06-05', 'Samarinda', 'Islam', 'Dusun Mekar Beringin Jaya RT003 Desa Purwajaya Kecamatan Loa janan Kabupaten Kutai Kartanegara Provinsi Kalimantan Timur', 'Rina Hartuti', NULL, NULL, NULL, 'Mekar Beringin Jaya', '003', '-', 'Purwajaya', '75391', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/PmANFfAaEPXLtZRf2ICMhEEYC0YXRJJCvxTc2Utm.jpg', 'students/kk/yY3ywAqFGUjRVmLaMcxLc8KGfg6WsvRb4oV4V5R9.jpg', 'students/ktp/hknFAfTTKHSTQI4BCDMofcGRA9k8AufpsJLWJ3gY.jpg', 'students/certificates/2zCizEbmD1P0E0mSXD4hqDmH8WDbfIWgE4M37ujO.pdf', '2026-01-27 23:17:35', '2026-03-15 18:59:15'),
(91, 109, 'RIZKA ANNISA', NULL, NULL, NULL, NULL, NULL, '081313569093', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-01-30 05:37:57', '2026-01-30 05:37:57'),
(94, 112, 'BUNGA PERMATASARI', '6402036812070002', '0077791098', 'SMA/SMK Sederajat', 'SMK PURWAJAYA', NULL, '083849308824', 'Perempuan', '2007-12-28', 'LOAJANAN', 'Islam', 'JL. TANJUNG SARI RT 24\r\nLOAJANAN', 'Hasnidar', NULL, NULL, NULL, NULL, '24', NULL, 'Loa Janan Ulu', '75391', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/xgbuOC7AFYXQXubpKnTkAebP70eVOhRs16WPajtm.jpg', 'biodata/kk/folc0buNL8HMcDcSt0OhjiTSHpw1HRcKMNrIV6PZ.jpg', 'biodata/ktp/9twLBBcXhXPBrZ9cQWeZgN1Ob46x5Y2sVDtdjfjA.jpg', 'biodata/certificates/KHqiC9Ceqhxb4Wxqjj1kQxl0NIQ6o3c8GJ4h4IeD.jpg', '2026-02-01 21:35:04', '2026-04-29 00:40:18'),
(95, 113, 'NURRUHAMA', '6472067009070003', '0079659033', 'SMA/SMK Sederajat', 'PP SALAFIAH NURUL AMIN', NULL, '081346651600', 'Perempuan', '2007-09-30', 'SAMARINDA', 'Islam', 'JL. M.SAID GG.POLEWALI LOK BAHU SUNGAI KUNJANG', 'Muliana', NULL, NULL, NULL, NULL, NULL, NULL, 'LOK BAHU', '75125', 'SUNGAI KUNJANG', 'KOTA SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/XucHMQx1YuwKMmej9LB3EM4JVLjzHcj5blPfzTJC.jpg', 'biodata/kk/7lrIzcCpZ1VoVoqmj7qwO9ok06mdZet4Mil1JTA0.jpg', 'biodata/ktp/8b0kWmtb3OHEyRLGO9oqDDawNHhOmfKMiwKQG9EQ.jpg', 'biodata/certificates/D3BjjXZEa7sv3MkoUjzDufrnu6OqRMJBIYmi7a7a.jpg', '2026-02-01 23:06:54', '2026-03-27 21:26:13'),
(96, 114, 'MUHAMMAD BASIT MUGHNI', '6472022901080001', '402166003056', 'SMA/SMK Sederajat', 'SMK TI LABBAIKA', 'TEKNIK JARINGAN KOMPUTER DAN TELEKOMUNIKASI (TJKT)', '085654914708', 'Laki-laki', '2008-01-29', 'Samarinda', 'Islam', 'JL. SULTAN HASANUDDIN GG. LANGGAR', 'JUSNAINI', NULL, NULL, NULL, NULL, NULL, NULL, 'BAQA', '75132', '6. SAMARINDA SEBERANG', 'SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/NhNRwwc0PGI4SQ6m270DpMO9Vz15jfE9Rp5tHQOL.jpg', 'students/kk/sXiAvmSATrCtMa6pjB2eshr0aP19H0ogYherY3Vl.jpg', 'students/ktp/8ZQ6Lq7PQjHInmTG3076ovktJRbUbHiIjJnoGYHb.jpg', NULL, '2026-02-02 19:53:42', '2026-04-19 20:03:26'),
(97, 115, 'Dyan Nata Kresna', NULL, NULL, NULL, NULL, NULL, '085348769435', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-04 01:22:40', '2026-02-04 01:22:40'),
(98, 116, 'MUHAMMAD HAIKAL', '6402062408040002', '0043294730', 'SMA/SMK Sederajat', 'SMK MUHAMMADIYAH SANGA-SANGA', NULL, '081345435107', 'Laki-laki', '2004-08-28', 'REBAK RINDING', 'Islam', 'JL. MADRASAH SANGA-SANGA DALAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/sGWSNWmxkX9jUzIiu9qgojV1Qt8eiVqHHBJhMvKH.jpg', 'biodata/kk/mbPp6PMb1ThXcJfbhJ9KQ1x05iwRGoS9yVNPO5A1.jpg', 'biodata/ktp/AJsZHMZXll14URhrK1q3Jlf5osgWxg2Qkg6G6lCu.jpg', 'biodata/certificates/fo91JoFFY1nUOBBeVFetqa3Rsput69aFcmx86PfC.jpg', '2026-02-05 00:08:02', '2026-02-05 23:03:34'),
(99, 117, 'ACHMAD SETIAWAN', '6472042705000002', '0002676246', 'SMA/SMK Sederajat', 'SMK ISLAM TERPADU SUBULUSSALAM', NULL, '082191575211', 'Laki-laki', '2000-05-27', 'SAMARINDA', 'Islam', 'JL. PERJUANGAN GG. BUKIT RAYA\r\nSUNGAI PINANG DALAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/u1Qs6jy6xio3cqlxXIIVPZTuQh0IxADgbTo3qPCl.png', 'biodata/kk/ZWzNh3FOSSIRJ2Val0oeunA3eZg55FM1GpgJzso8.jpg', 'biodata/ktp/BXOKFQXp8jLfiuWHDJc5kXVQhZTyOfIWLUhChSBi.jpg', 'biodata/certificates/1OyvkFNtHrVROWapZ99CIRZN5LyjqkJSTXlg69Mk.jpg', '2026-02-05 00:17:29', '2026-02-05 00:22:02'),
(100, 118, 'SALSABILA', NULL, NULL, NULL, NULL, NULL, '081348987201', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-07 20:49:18', '2026-02-07 20:49:18'),
(101, 119, 'Diki karisma', NULL, NULL, NULL, NULL, NULL, '+6282195698079', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-10 05:15:10', '2026-02-10 05:15:10'),
(102, 120, 'Ananda Prabowo', NULL, NULL, NULL, NULL, NULL, '0895390721616', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-10 06:22:44', '2026-02-10 06:22:44'),
(103, 121, 'Sumiati', NULL, NULL, NULL, NULL, NULL, '085250358785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-11 03:44:12', '2026-02-11 03:44:12'),
(104, 122, 'Intan rima sari', NULL, NULL, NULL, NULL, NULL, '082214532813', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-11 07:27:41', '2026-02-11 07:27:41');
INSERT INTO `student_biodatas` (`id`, `user_id`, `name`, `nik`, `nisn`, `last_education`, `school_origin`, `major`, `phone`, `gender`, `birth_date`, `birth_place`, `religion`, `address`, `mother_name`, `npwp`, `telephone`, `email`, `dusun`, `rt`, `rw`, `kelurahan`, `kode_pos`, `kecamatan`, `kabupaten`, `provinsi`, `kps_recipient`, `kps_number`, `residence_type`, `transportation`, `reregistration_status`, `photo_path`, `kk_path`, `ktp_path`, `certificate_path`, `created_at`, `updated_at`) VALUES
(105, 123, 'Amanda Nur Rahmawati', NULL, NULL, NULL, NULL, NULL, '085246209622', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-12 01:45:33', '2026-02-12 01:45:33'),
(107, 125, 'AMANDA NUR RAHMAWATI', '6472016402070002', '3070138127', 'SMA/SMK Sederajat', 'MAS MA’ARIF NU 1 SAMARINDA', NULL, '085246289622', 'Perempuan', '2007-02-24', 'SAMARINDA', 'Islam', 'JL. NAHKODA, BUKUAN, PALARAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/6G44p1Q09S1IGVIL3aOMbjXjTbnnR4ihvTyFGRub.jpg', 'biodata/kk/6SDVK1L8IzmvlGDjceZ43IfEZJnmDZjKSJLMR1Xa.jpg', 'biodata/ktp/HEy8501ezquXSfBzEi4Ifm6K87OnhSk5WRaorZJ8.jpg', 'biodata/certificates/dg427M8MaCT5M08vWKeB8yI5ZxWeuEAGQs7UE4CN.jpg', '2026-02-13 23:28:34', '2026-02-13 23:28:34'),
(108, 126, 'AHMAD ABID MAULANA', '6472032411040002', '0043314093', 'SMA/SMK Sederajat', 'SMKN 6 SAMARINDA', NULL, '083854970595', 'Laki-laki', '2004-11-24', 'SAMARINDA', 'Islam', 'JL. TRISARI SIDODADI SAMARINDA ULU', 'Hariyati', NULL, NULL, NULL, NULL, '020', NULL, 'SIDODADI', '75243', 'SAMARINDA ULU', 'KOTA SAMARINDA', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/BDpx7PkXR7tbWr7Q9lVVnexhHnyxP427G3TTidGz.jpg', 'biodata/kk/JOezlK8OOkJGwKORz8snubv2KcOgqVvonNJeyJnM.jpg', 'biodata/ktp/sHQpP9N4qrRDxcZW6NKEpFy2O88mQHkwu9vS3IxV.jpg', 'biodata/certificates/wPLvUlTlBPOm6Whqu7i3Kx00hOb77yBf27Om4XfT.jpg', '2026-02-13 23:58:38', '2026-03-14 01:33:28'),
(109, 127, 'Radiarman Sipayung', NULL, NULL, NULL, NULL, NULL, '081351994883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-14 23:00:27', '2026-02-14 23:00:27'),
(110, 128, 'Radiarman Sipayung', NULL, NULL, NULL, NULL, NULL, '081351994883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-14 23:04:57', '2026-02-14 23:04:57'),
(111, 129, 'Andi Kumar Purnomo', '6402142608960002', '9963261038', 'SMA/SMK Sederajat', 'SMK Nasional Muara Jawa', 'Akuntansi', '082357172356', 'Laki-laki', '1996-08-26', 'Muara Jawa', 'Islam', 'Jl. Tahir gg Sulawesi rt 08,Muara Jawa Pesisir, Muara Jawa, Kutai Kartanegara', 'Kamsiah', '53.886.071.9-728.000', NULL, NULL, NULL, '08', NULL, 'Muara Jawa Pesisir', '75263', 'Muara Jawa', 'Kutai Kartanegara', 'Kalimantan TImur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/bgUKasu8umDUQ0UNZr48820QnoTdnfTVm4l2ydwH.png', 'students/kk/vHIhUFLPjakM578hrq4RY1jM1ApLeFqcvGSzMKwn.jpg', 'students/ktp/i3VH3iO54ClQ2Cwrzljttm623BLEx55K52DO29yi.jpg', 'students/certificates/JUbnmd0JwVe6Oe0xa5G9gK6sQOpRbOdqQkgh2C4L.jpg', '2026-02-16 00:33:34', '2026-03-09 22:43:11'),
(112, 130, 'Risqi Nur Akmala', '3302171609990003', '9997331383', 'S1', 'Universitas Nahdlatul Ulama Purwokerto', 'Teknik Pertanian dan Biosistem', '08975818944', 'Laki-laki', '1999-09-16', 'Banyumas', 'Islam', 'Desa Langgongsari RT 06 RW 02 Kec. Cilongok Kab. Banyumas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/3uFet8zCSydD9Cm4GKqQvsSSsi2w179hwB9vByFG.jpg', 'students/kk/9UayCc4hASYbbQSkNh6YwKKBy2hyEMhiEPbH3fwe.jpg', 'students/ktp/vffymtjBDinsYwYMLD7m5K0kdb6CUE65ad4qOtKL.jpg', 'students/certificates/7ZOIsC7ZEntfU8uMDIXMxL04xQVc6dDOveCzCgqU.pdf', '2026-02-17 19:41:28', '2026-02-17 19:59:10'),
(113, 131, 'Jumeidi Sakur', NULL, NULL, NULL, NULL, NULL, '085173433591', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-21 20:00:40', '2026-02-21 20:00:40'),
(114, 132, 'FARHAN IRFANNUDIN', NULL, NULL, NULL, NULL, NULL, '082246628608', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-23 18:11:10', '2026-02-23 18:11:10'),
(115, 133, 'FARKHAN IRFANNUDIN', '6402080704080001', '0084836119', 'SMA/SMK Sederajat', 'MA AL MASYHURIYAH', 'Ips', '082246628608', 'Laki-laki', '2008-04-07', 'KUKAR', 'Islam', 'Desa sarinadi Kec. Kota bangun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/YinHumAPWNvdO0KJXIQ3VWClbUPrdKeFmW9Uz0iv.jpg', 'students/kk/eLffEjtmtKtN6eLrTjeaKJY0WPwpAmVkIhm8qR2Z.jpg', 'students/ktp/7PdcKDWw1dHF0HpQb96c2YI5I6k4LNl3yg9YuCGz.jpg', NULL, '2026-02-23 18:18:48', '2026-02-23 19:31:00'),
(116, 134, 'Fauzan Azima Paendong', NULL, NULL, NULL, NULL, NULL, '085242147026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-25 07:53:04', '2026-02-25 07:53:04'),
(117, 135, 'alya dwi bahli', NULL, NULL, NULL, NULL, NULL, '083895529893', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-25 16:41:41', '2026-02-25 16:41:41'),
(118, 136, 'Muhammad Rifki Fahrezi', '6472011605060004', NULL, 'SMA/SMK Sederajat', 'smkn 19 samarinda', 'agribisnis', '085757637274', 'Laki-laki', '2006-05-16', 'samarinda', 'Islam', 'jl gunung sari rt 40 palaran samarinda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/h88DrmhBifG5wtoJGx1RAkYoYfguSU4XQ6G1ex77.png', 'students/kk/A74UoK4qbPZslMTlu7QgMLv2j9F6jaRIoiiiZGEK.jpg', 'students/ktp/KM0PdcmwVHOsnldo2Bck8K8QXamvWb8upDPKpUoN.jpg', 'students/certificates/kKd0fYpUBPXFe1RXCX6NQBAJD7hBLUC83tJmTHGn.jpg', '2026-02-26 17:31:21', '2026-03-08 03:20:16'),
(119, 137, 'FEBRI', '6402130302030003', '0033452730', 'SMA/SMK Sederajat', 'SMA ISLAM ULUMUDDIN SAMBOJA', NULL, '085651201489', 'Laki-laki', '2003-02-03', 'HANDIL BARU', 'Islam', 'HANDIL BARU SAMBOJA RT 003', 'Husnah', NULL, NULL, NULL, NULL, '03', NULL, 'HANDIL BARU', '75279', 'Samboja', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/MdRr6Y2josS9a4sa0MqkIRIzo5ISC2S1b38ZMBaW.jpg', 'biodata/kk/HqkMK4uWqsdgU5fa5DYBngXpBHY6L873kVTqRBdz.jpg', 'biodata/ktp/Wr2IUkloCMIgLg7q2U9k9uiubxOhleWO3VwkhQXR.png', 'biodata/certificates/PzKUNXaTXVJ5f7WbL9OC7tef275qZDhM3WhOePud.pdf', '2026-02-26 23:10:16', '2026-03-30 00:23:16'),
(120, 138, 'Nur Fitri Meryanti', '6402106612050001', '0057407531', 'SMA/SMK Sederajat', 'SMK Medika Samarinda', 'Desain Komunikasi visual', '088704769147', 'Perempuan', '2005-12-26', 'Kembang Janggut', 'Islam', 'Kahala RT.005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/UxFlRXJjPZJ3a80mNagJazMAGskr7I83uhBaJqXy.jpg', 'students/kk/78y1wTjtJUtTtlHjZoZbarQe14q37Q9yio0GjjPF.jpg', 'students/ktp/RbIbvjeVFlQv7TkdfvLCIZMCa4NGH94y0cpgh6m0.jpg', 'students/certificates/8D2WI7nlAtxPt7YQOj7jqVj3lez64TvsGjFIilt1.jpg', '2026-02-27 15:33:11', '2026-02-27 18:08:01'),
(121, 139, 'safasfasfasf', NULL, NULL, NULL, NULL, NULL, '081380374774', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-02-28 21:24:50', '2026-02-28 21:24:50'),
(122, 140, 'Akmal Maulana Firdaus', '6472010911080002', '0083755695', 'SMA/SMK Sederajat', 'SMK KESEHATAN JAMI\'ATUL MUTTAQIN', 'Farmasi', '081528657569', 'Laki-laki', '2008-11-09', 'Samarinda', 'Islam', 'JL. BOJONEGORO RT25 KEL:SIMPANG PASIR\r\nKEC:PALARAN', 'SUSI LIAWATI', NULL, NULL, NULL, NULL, '25', NULL, 'JL.BOJONEGORO', '75243', 'Palaran', 'Samarinda', 'Kalimantan timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/xApKdFzd4ksHGQdwcDtdU1KTASB5F3zDjLMOQHTu.jpg', 'students/kk/nFvTXVrZXV2pJOoPZqvuZ4NuPDgxlS67ojszW2sI.jpg', 'students/ktp/zLXuvpwg5ePbHnt1a76e12LOvBsvZCMVGjTH2WHW.jpg', 'biodata/certificates/vcQWoKo53ckcckQjdzobf5FKrzrZO6LGp2y5zrNW.jpg', '2026-03-01 22:41:00', '2026-04-29 00:21:53'),
(123, 141, 'MUH FIKRAH EDHITYA PRATAMA', NULL, NULL, NULL, NULL, NULL, '085183028467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-02 22:16:57', '2026-03-02 22:16:57'),
(124, 142, 'MUHAMMAD ISA IBRAHIM', '7371031603070001', '0073976146', 'SMA/SMK Sederajat', 'MA NEGERI 1 KOTA MAKASSAR', 'AGAMA', '085143630768', 'Laki-laki', '2007-03-16', 'MAKASSAR', 'Islam', 'JL.MANGKUPALAS NO.83', 'SURYANI', NULL, NULL, NULL, 'JL.MANGKUPALAS NO.83', '019', '000', 'MASJID', '75133', 'SAMARINDA SEBERANG', 'SAMARINDA SEBERANG', 'KALIMANTAN TIMUR (KALTIM)', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/cl4ndAaO5tLE1YhCrr0vkAwv7HhRFosTjuqDzsW4.jpg', 'students/kk/g0wdKlqPFfAPxYWiCOLgfTPVv28q6HgJS8pANWn0.jpg', 'students/ktp/Il9UvcgZWWBzvQReFnlY5DBQUraao01LL2JsjiBr.jpg', 'students/certificates/uTKqIlh1uML4PXAud3tsx4ylMdXU8KOc1pxJOBYY.jpg', '2026-03-03 10:10:27', '2026-03-25 20:46:51'),
(125, 143, 'Stephen Tendjaya', '3173041509020009', '0024731037', 'SMA/SMK Sederajat', 'DIAKON', 'IPA', '085190656169', 'Laki-laki', '2002-09-15', 'JAKARTA', 'Katolik', 'Pluit Sakti 1 No 11', 'ellen halim', NULL, NULL, NULL, 'pluit sakti 1 no 11', '09', '07', 'pluit', '14450', 'penjaringan', 'jakarta utara', 'dki jakarta', 0, NULL, 'bersama_orang_tua', 'ojek', 'form_completed', 'students/photos/WPH7bayZM66Gk2Cbjl6gDwU1Erry0M3GzuJ6SxVS.png', 'students/kk/BU7ClbplhhVrgvuYxTYhFZRwvyIJyKmN3fODTaME.pdf', 'students/ktp/TgDkbpCmbpFKSyUloUVU5JxBkTrS28nfA5GmvR9i.pdf', 'students/certificates/QxbHQCjS8PWunV3gnrOQJFum2VsR5hhxtikM0M77.pdf', '2026-03-03 10:53:23', '2026-03-12 01:11:46'),
(127, 145, 'Sopiya Yeti', '6402115106080001', '0089315073', 'SMA/SMK Sederajat', 'SMA NEGERI 2 MUARA KAMAN', 'SMA (KURIKULUM MERDEKA)', '085750541109', 'Perempuan', '2008-06-11', 'Samarinda', 'Islam', 'Teratak', 'Hasiyah', NULL, NULL, NULL, NULL, '006', NULL, 'Teratak', '75553', 'Muara Maman', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/cZFYgL2gePHqJLXCovbI8xSXEm2ezXSiR3M9wq68.jpg', 'students/kk/WWr787ajCcqPK7t3nXjOaKjgnBSDS7wrnomNd93L.jpg', 'students/ktp/IOy7R16RhZRfULIlvpwfmxmpDAdhjpvaJnlESytL.jpg', NULL, '2026-03-05 04:32:42', '2026-04-24 03:58:59'),
(128, 146, 'Reynaldy', '6471040610030002', NULL, 'SMA/SMK Sederajat', 'SMK pangeran antasari', 'Teknik instalasi tenaga listrik', '089516480372', 'Laki-laki', '2003-10-06', 'Balikpapan', 'Islam', 'Jl. Sumber rejo 2 no. 38B balikpapan tengah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/dLSjtqLMYKg3GIp8hpnFVIpKjzgXYZyBNTQqlH5l.jpg', 'students/kk/J9cJLzfFRKsVMCMNeApRx0dV4kIO7WY6z3UNavri.jpg', 'students/ktp/R1Ooa7745LI0ZEF987YTupsrKhDvsD5wf7OlDBoh.jpg', NULL, '2026-03-07 19:21:47', '2026-03-07 19:37:58'),
(129, 147, 'Ananda ravi pratama', '9171023006990001', '60301061', 'SMA/SMK Sederajat', 'SMK n 3 jayapura', 'Teknik komputer dan jaringan', '082289475774', 'Laki-laki', '1999-06-30', 'Jayapura', 'Islam', 'Perum darsua residence blok d76,Doyo baru,kab.jayapura,papua', 'Sunarti', NULL, NULL, NULL, 'Doyo baru', '007', '006', 'Doyo Baru', '99368', 'Waibu', 'Kabupaten jayapur', 'Papua', 0, NULL, 'wali', 'sepeda_motor', 'form_completed', 'students/photos/0uW7LBbT1mozHGLkvCE5oV2QVrZUOk8KZtR290V2.jpg', 'students/kk/oL8hGA4VTyUsCfoyHytxogkuvE2V1XuUf6CnaQlR.png', 'students/ktp/WwOstRgyeUMF6XgQHpGC6sv4KWiyazxSLVOBvtDh.jpg', 'students/certificates/umqzzD4X8GBB85mbur6ouXhSSlx7Q3J0RxURN5uQ.png', '2026-03-08 20:46:43', '2026-03-14 17:33:38'),
(130, 148, 'BRAHMANTIO SATRIO NUGROHO', NULL, NULL, NULL, NULL, NULL, '085820600297', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-09 09:07:51', '2026-03-09 09:07:51'),
(132, 150, 'Muh Syamsir alam', NULL, NULL, NULL, NULL, NULL, '08135688992', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-11 19:53:21', '2026-03-11 19:53:21'),
(133, 151, 'NABILA AMANDA SAPUTRI', '6472025204060006', '0049315523', 'SMA/SMK Sederajat', 'SMAN 17 SAMARINDA', NULL, '0895385977806', 'Perempuan', '2006-04-12', 'SAMARINDA', 'Islam', 'JL. SULTAN HASANUDDIN GG. LANGGAR BLOK G\r\nKEL. BAQA, KEC. SAMARINDA SEBERANG', 'Irmayani', NULL, NULL, NULL, 'KEL. BAQA', '008', '000', 'KEL. BAQA', '75132', 'Samarinda seberang', 'KOTA SAMARINDA', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/hUj4BxkzLWEsddOvIzqd6DFS2u3kaVx6aEoDAmGq.jpg', 'biodata/kk/jXvLM3VpR1q9baOqLoYS61NHkHVS3U0aTVfyOryH.jpg', 'biodata/ktp/pOwnnU0gNRGLKTSb42yswg7upiLI9O50TncN2Xvo.jpg', 'biodata/certificates/EAcjwqSp3bbFUnhwqvwZPy9GcvIyMPyBww4RIEFQ.jpg', '2026-03-11 22:25:09', '2026-03-11 22:41:14'),
(134, 152, 'Filza Aulia', NULL, NULL, NULL, NULL, NULL, '083852938710', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-12 14:05:23', '2026-03-12 14:05:23'),
(135, 153, 'muhamad anis madani', NULL, NULL, NULL, NULL, NULL, '082175644027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-14 02:56:30', '2026-03-14 02:56:30'),
(136, 154, 'Maria Nasarena Mayona Mau', NULL, NULL, NULL, NULL, NULL, '081236772084', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-14 03:24:04', '2026-03-14 03:24:04'),
(138, 156, 'Khoirul Fatkurrohman', NULL, NULL, NULL, NULL, NULL, '087832468968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-15 02:35:45', '2026-03-15 02:35:45'),
(139, 157, 'Ghea Noviyanti Putri', NULL, NULL, NULL, NULL, NULL, '082151428180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-15 03:11:04', '2026-03-15 03:11:04'),
(140, 158, 'Agus Hatmiazis', '6401051406980002', '9993743764', 'SMA/SMK Sederajat', 'MAN PASER', 'AGAMA', '082252289414', 'Laki-laki', '1998-06-14', 'Rinda', 'Islam', 'Rinda, Pondong Baru, Kec. Kuaro, Kab. Paser', 'Majrah', '204476956722000', NULL, NULL, 'Rinda', '6', NULL, 'Pondong Baru', '76281', 'Kuaro', 'Paser', 'Kalimantan Timur', 0, NULL, 'lainnya', 'sepeda_motor', 'completed', 'students/photos/mnsj7yX0uafPp9Fe4Q14kSYl7JrtzdpwN2pNwSY8.jpg', 'students/kk/vlebzcpkzMP5OtPMayxDglsGYw4tb8wrgSjzLdW2.jpg', 'students/ktp/N4bxJlFFKixOvSgufx3n5dtCRUmgrmaxlCvqTNed.jpg', 'students/certificates/7mDhGKyRSS1DGNwCfGthQLiAcbpgUh995gn9tQqZ.jpg', '2026-03-15 04:05:30', '2026-03-29 20:27:31'),
(143, 161, 'Fadillah ahmad', '6402042505990007', NULL, 'SMA/SMK Sederajat', 'SMA NEGERI 1 ANGGANA', 'Ipa', '082197939452', 'Laki-laki', '1999-05-25', 'JENEPONTO', 'Islam', 'Jl pembangunan rt 14 desa anggana kec anggana kab kutai kartanegara', 'Marwiyah M', '904376944728000', NULL, NULL, NULL, '14', '00', 'Anggana', '75381', 'Anggana', 'Kutai kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/XEMjENXHORN60wEvCXnNJxvB5kS1HmQTFKEuQ0tq.jpg', 'students/kk/qVnhCCkCTcKgwPPG3gcl6OEvNh65AdtBvZoPwkuu.jpg', 'students/ktp/CjltJDD3AH463xu0hr1RbO9AiRD1OQ85IS8PilCE.jpg', NULL, '2026-03-22 22:43:19', '2026-04-01 21:46:34'),
(144, 162, 'Agil Gawri Widianto', NULL, NULL, NULL, NULL, NULL, '082337875417', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-23 19:12:39', '2026-03-23 19:12:39'),
(145, 163, 'Dimas Muhammad Abdul Joni', '6408021704080001', '0083625554', 'S1', 'SMK Negeri 1 Kongbeng', 'Teknik Kendaraan Ringan', '+6281717618889', 'Laki-laki', '2008-04-17', 'Marga Mulya', 'Islam', 'Jalan jendral Sudirman, RT 6 Desa Nehas Liah Bing, Kecamatan Muara Wahau', 'Erna Kurniasih', NULL, NULL, NULL, 'Log Pond', '006', '000', 'Nehes Liah Bing', '75655', 'Muara Wahau', 'Kutai Timur', 'Kalimantan Timur', 0, NULL, 'kost', 'sepeda_motor', 'completed', 'students/photos/mQQWUnmJiaQDO9xYOa164VOUdL1kpXcVvreQGbSL.jpg', 'students/kk/19eODmZxvXmQTY1GOh56IyPhKkTgeZjMOyIclXY3.jpg', 'students/ktp/0A7OIXOtCjlNCW8AiM8HxjNRydskkIQ6UQoopsaF.jpg', NULL, '2026-03-24 18:42:47', '2026-04-28 01:05:49'),
(146, 164, 'MUH RAFLI', NULL, NULL, NULL, NULL, NULL, '085820617409', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-25 18:33:58', '2026-03-25 18:33:58'),
(147, 165, 'Mirna', '6472025105050001', '0052152917', 'Paket C', 'pkmb kedondong', 'ips', '085249669700', 'Perempuan', '2005-05-11', 'samarinda', 'Islam', 'jl.p.bendahara', 'Rida', NULL, NULL, NULL, NULL, '07', '-', 'Mesjid', '75133', 'Samarinda Seberang', 'Kota Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/17aztTFHAzEb2S0tQzEbo7R5C4FWldOEryEngzl5.jpg', 'students/kk/LFCY7y4Iy9jdhRxJ5v71O502HIwa5B3MChDIY9EN.jpg', 'students/ktp/2AbrWrVay05322bYlqGhBiGZsqZDU9bX0vAxRo4y.jpg', 'students/certificates/pZQFq1qPDxU99SpTrjr3n4SgRrdCyftgF6xrbVEv.jpg', '2026-03-25 20:23:51', '2026-03-30 02:27:54'),
(148, 166, 'Dava Allzarian Siregar', NULL, NULL, NULL, NULL, NULL, '089521661016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-26 00:10:49', '2026-03-26 00:10:49'),
(149, 167, 'Syiam safitriyani', NULL, NULL, NULL, NULL, NULL, '082141748045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-26 20:44:48', '2026-03-26 20:44:48'),
(150, 168, 'Rayendra Andrew Winata', NULL, NULL, NULL, NULL, NULL, '081258565949', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-27 02:31:06', '2026-03-27 02:31:06'),
(151, 169, 'Nur Zahwa Ai\'nun Naya', NULL, NULL, NULL, NULL, NULL, '083874710003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-27 05:44:07', '2026-03-27 05:44:07'),
(152, 170, 'Muhammad Albar Arafii', '3674031307040002', '0046035315', 'SMA/SMK Sederajat', 'SMAN 1 Gunung Sindur', NULL, '0895333961155', 'Laki-laki', '2004-07-13', 'Ciamis', 'Islam', 'Jl. Sumber Rejo I komp. TNI AD H10 No. 70', 'Kurniasih', '61.611.613.3-453.000', NULL, NULL, 'Jl. Sultan Hasanuddin Gunung Bugis', '036', '000', 'Baru Ulu', NULL, 'Balikpapan Barat', 'BALIKPAPAN', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/dXHn0mg0ZWUwFyO4Iky07AICR5dHKUUXkomq947d.jpg', 'biodata/kk/wvCpuRi2Nb92tXsTEaGKehoSnfDlBGNjtpMEqb5Y.pdf', 'biodata/ktp/AHTEy2fkp25EasuEziRDIYulqWdNFy8aS1OXVxZk.jpg', 'biodata/certificates/a0REaRVz6Zb0areEig7URrtlcQjyBHrwmioVce5k.pdf', '2026-03-27 22:49:09', '2026-04-02 17:34:19'),
(153, 171, 'Nur Zahwa Ai\'nun Naya', '6472026402080003', '0089439132', 'SMA/SMK', 'SMA SETIA MARGA', 'ips', '083874710003', 'Perempuan', '2008-02-24', 'Samarinda', 'Islam', 'JL. HJ. JAHRAH GG ANTASARI NO 43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Zyq7ka5SK1HmSj8VKAF7TmLuUaNiCh7xnxLEgALZ.jpg', 'students/kk/TtBrTk0xmbydcDJWlc4iDriC6UikHffnMbsrk3Vf.jpg', 'students/ktp/6MfbcrAehqlw1TFLdOYlPp2sRIuSD4NTS2bU18NG.jpg', NULL, '2026-03-28 02:08:45', '2026-03-28 02:37:22'),
(155, 173, 'M. IDRUS', '6402131305060003', '0062003990', 'SMA/SMK Sederajat', 'SMK PESISIR SAMBOJA', NULL, '082231003854', 'Laki-laki', '2006-05-13', 'SANIPAH', 'Islam', 'JL. BPP. HANDIL 2 RT. 17', 'Pida', NULL, NULL, NULL, NULL, '17', NULL, 'SANIPAH', '75271', 'SAMARINDA ULU', 'KUTAI KARTANEGARA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/2sx3xhkQ8qg4jBwDPTl69OgBtf282xQYMCOeF2Z2.jpg', 'biodata/kk/ozhkEAIju1cWDynY2TQj7bQJzizQ2aqXaN8nO2hP.jpg', 'biodata/ktp/F4Ssfk1MkkRl9bnGFI8HaSahyMbEXBBn3J3c04X9.jpg', 'biodata/certificates/WtMzmYv8chtxT1GZB7EjzUT0eeOdDzhL0JCKK7vm.jpg', '2026-03-28 04:34:06', '2026-03-30 22:48:39'),
(156, 174, 'Nahza Sabila', NULL, NULL, NULL, NULL, NULL, '087822892160', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-28 21:05:53', '2026-03-28 21:05:53'),
(157, 175, 'Nia Susanti', '3506156207060002', NULL, 'SMA/SMK Sederajat', 'SMKN 5 Negeri Samarinda', 'Manajemen Perkantoran dan Layanan Bisnis', '082211387172', 'Perempuan', '2006-07-22', 'Kediri', 'Islam', 'Jl. P. Suryanata GG Tinggiran 2 Blok A No. 40', 'Tatik', NULL, NULL, NULL, NULL, NULL, NULL, 'Air Putih', NULL, 'Samarinda Ulu', 'SAMARINDA', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/3KKvAXbF6uygOQYgOO7Q6VjMS7TjtIwhxhblsqpL.png', 'students/kk/SddCFECsUStflAPbcicmHweaVKEIecg6V8fizmRP.jpg', 'students/ktp/HmaL2qzbaPsjTY37jqsAJbpW9xDqogXVfRahB98U.jpg', 'students/certificates/gmaw9XDZeoAWmu6W3HViWo09TZukV2AeieZdooNf.jpg', '2026-03-29 06:12:12', '2026-04-01 22:08:13'),
(158, 176, 'ALBAR', NULL, NULL, NULL, NULL, NULL, '082157716374', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-29 07:00:08', '2026-03-29 07:00:08'),
(159, 177, 'Fauziah Maulidya', NULL, NULL, NULL, NULL, NULL, '082157598157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-29 07:33:23', '2026-03-29 07:33:23'),
(160, 178, 'DEAVANDRA FAROUK ADITYA', '6472022507050003', '0059329596', 'SMA/SMK Sederajat', 'SMKN 12 SAMARINDA', 'Tkr (Teknik Kendaraan Ringan)', '085828030253', 'Laki-laki', '2005-07-25', 'Samarinda', 'Islam', 'JL.JAKARTA 1 PERUM BUMI CITRA LESTARI BLOK C9 NO 11', 'MULYATI', NULL, NULL, NULL, NULL, '052', NULL, 'LOA BAKUNG', '75126', 'SUNGAI KUNJANG', 'KOTA SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/fAXdZnWcY6WNqt2HSH0uoBxCybGGJ9nZxpMM6T9h.jpg', 'students/kk/9n91ORutsuGwAQ1IicJKw7G9DyZOgej6QHK9cLYZ.jpg', 'students/ktp/MpPUwW3NgNX8XYAQjgGxTNTAnhMlJ2FL9wxyrQqd.jpg', 'students/certificates/iiJnZYPklKWntvCgQQYY82lz6uVK0h7JeGJhikEm.jpg', '2026-03-30 04:20:04', '2026-04-06 20:40:46'),
(161, 179, 'Dini Ramadani', NULL, NULL, NULL, NULL, NULL, '082154672080', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-31 00:57:15', '2026-03-31 00:57:15'),
(162, 180, 'SAHLEVI', '6402181211080002', NULL, 'SMA/SMK Sederajat', 'SMK NEGERI 1 MUARA MUNTAI', NULL, '085246692548', 'Laki-laki', '2008-11-12', 'SEMAYANG', 'Islam', 'DS. MUARA ENGGELAM RT.004\r\nKEC. MUARA WIS\r\nKUTAI KARTANEGARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/BELtqCDg79saYjh1EFh9Qn1tFPbSaphH9EzHM7lg.jpg', 'biodata/kk/tAHeGjy4xY4unh59VS5zwedpRaZCAYTX0f5s2MbS.jpg', 'biodata/ktp/g9xRpKzTrYPXALQrJ5XxgwgghrXTS45bC7L89DRk.jpg', NULL, '2026-03-31 01:33:17', '2026-03-31 01:33:17'),
(163, 181, 'Lujay Khan', NULL, NULL, NULL, NULL, NULL, '085787839318', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-31 02:16:46', '2026-03-31 02:16:46'),
(164, 182, 'AKMAL MAULANA FIRDAUS', NULL, NULL, NULL, NULL, NULL, '081528657569', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-31 06:30:57', '2026-03-31 06:30:57'),
(165, 183, 'AKMAL MAULANA FIRDAUS', NULL, NULL, NULL, NULL, NULL, '081528657569', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-31 17:48:25', '2026-03-31 17:48:25'),
(166, 184, 'Sopiya Yeti', NULL, NULL, NULL, NULL, NULL, '085750541109', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-03-31 18:46:33', '2026-03-31 18:46:33'),
(167, 185, 'ZULIYANNUR ASHAN', '6472101607050001', '0059309192', 'SMA/SMK Sederajat', 'SMA NEGERI 4 SAMARINDA', 'ILMU PENGETAHUAN SOSIAL', '082191680422', 'Laki-laki', '2005-07-16', 'SAMARINDA', 'Islam', 'JL.MUKRI IGAI, NO18, RT27, kel RAPAK DALAM, kecamatan LOA JANAN ILIR', 'NOR AINAH', '-', NULL, NULL, '-', '27', '0', 'RAPAK DALAM', NULL, 'LOA JANAN ILIR', 'SAMARINDA SEBRANG', 'KLIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/fCIsjsgVkOJhM6B4tppi5WZ0x6338VLWTUXhFa0b.jpg', 'students/kk/wAdoaVZyFGFfP0hZDtT32EYkHGw78kMEImFufdj8.jpg', 'students/ktp/c2AweLTao6xVmXqfbUCBS5PgK9Z75bvtHW5O5jdZ.jpg', 'students/certificates/eNdpckrOtU6txNRCkeTFX5jumz8BCfCYsJ8ddMd3.jpg', '2026-04-01 03:30:49', '2026-04-05 20:45:40'),
(168, 186, 'Uzlifatul Jannah', NULL, NULL, NULL, NULL, NULL, '082298949752', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-01 22:13:57', '2026-04-01 22:13:57'),
(169, 187, 'MUHAMMAD RESTU FARIZAL', '6472021502010005', '0015843810', 'Paket C', 'SKB NEGERI 2 SAMARINDA', NULL, '083854018821', 'Laki-laki', '2001-02-15', 'SAMARINDA', 'Islam', 'JL. KH. HARUN NAFSI RAPAK DALAM, KEC. LOAJANAN, KOTA SAMARINDA', 'RIF\'AH', NULL, NULL, NULL, NULL, '09', NULL, 'RAPAK DALAM', '75132', 'LOA JANAN ILIR', 'SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/GJ1ne4PLdNiHTPpuaJ6pQncK6MuAxKNcT36bquyC.jpg', 'biodata/kk/gI6nquGmN3yUQtL8TrI5VUbEYoz6DY6AhiBC3RVn.jpg', 'biodata/ktp/atqUgOJMtz6KmY9OIpKLWRwFgIaoDo8E6JVje7v5.jpg', 'biodata/certificates/KCWnTNBhBnpJiCWUw33ZAOMmNjVGboJ05jM3pfyy.jpg', '2026-04-02 01:13:03', '2026-04-02 01:25:04'),
(170, 188, 'AHMAD ARIYADI', '6402020504070005', NULL, 'SMA/SMK Sederajat', 'MA AT-TADZKIR', NULL, '+6285245923403', 'Laki-laki', '2007-04-05', 'JEMBAYAN', 'Islam', 'JEMBAYAN RT 05/00 LOA KULU', 'NURUL', NULL, NULL, NULL, NULL, '05', NULL, 'JEMBAYAN', '75571', 'LOAKULU', 'KUTAI KARTANEGARA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/BSvPzG9FDY76bUvjdI2pgF977yL56vf8dJ32y3wT.jpg', 'biodata/kk/aLD2YOm013RbJ1hrj3Oqqc41cbP9kzdPcvjyKksI.jpg', 'biodata/ktp/Fz6nO6bcpZVYyHWJoPWLoB8wvq15HvTM47MIWhzp.jpg', NULL, '2026-04-02 19:08:32', '2026-04-02 19:50:29'),
(171, 189, 'MUTIARA YASMIN', '6472056304080002', '0086659247', 'SMA/SMK Sederajat', 'MA AT-TADZKIR', NULL, '081255317981', 'Perempuan', '2008-04-23', 'SAMARINDA', 'Islam', 'JL. CIPTO MANGUNKUSUMO', 'HUSSAIMAH', NULL, NULL, NULL, NULL, '09', NULL, 'HARAPAN BARU', '75132', 'LOA JANAN ILIR', 'SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/8kSZzAi9ryOul49HaCkw94rRy3VIg7NK5zCzQsgM.jpg', 'biodata/kk/lT9Mo572Q4MZWpntmTiBrsGm3Wee2yxojW4QCrT1.jpg', 'biodata/ktp/cEfFqjHxpkh0bm2uKDRU0mtAHAyUp8fydqgZDYqF.jpg', NULL, '2026-04-02 19:23:37', '2026-04-02 19:40:26'),
(172, 190, 'NUR VITA', '6402094811070001', '0076352857', 'SMA/SMK Sederajat', 'SMA NEGERI 1 KOTA BANGUN', 'Teknik Industri', '082350643703', 'Perempuan', '2007-11-08', 'TELUK MUDA', 'Islam', 'Desa teluk muda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/j0AGWACXO5Qq0ZFueLmthg0jb3IHCyX0iunOJOd5.jpg', 'students/kk/rUboLarLaOdPJ33jIEN9ZFVAje6qL5oeSPLqkgkW.jpg', 'students/ktp/mSYnFF78XMacyWZtoK66fqhhXAbABBz1zPM23kJI.jpg', 'students/certificates/XjS7aDbJWDijV66bkCzXUfM0KwEz2ZizNpwxJPv0.jpg', '2026-04-03 06:19:54', '2026-04-05 15:58:46'),
(173, 191, 'NUR VINA FAIDATUL KASIH', NULL, NULL, NULL, NULL, NULL, '081346504004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-04 03:27:37', '2026-04-04 03:27:37'),
(174, 192, 'Awal Adiyaksa', NULL, NULL, NULL, NULL, NULL, '082149037878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-04 10:46:05', '2026-04-04 10:46:05'),
(176, 194, 'Zahra Salsabila', NULL, NULL, NULL, NULL, NULL, '082262535539', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-04 16:33:54', '2026-04-04 16:33:54'),
(177, 195, 'MUH. ARIL', '6402031712070001', '0074399232', 'SMA/SMK Sederajat', 'SMK PURWAJAYA', 'DKV/DESAIN KOMUNIKASI VISUAL', '085821432100', 'Laki-laki', '2007-12-17', 'Samarinda', 'Islam', 'Jl. Soekarno hatta, km 26 dalam, dusun surya bakti, rt 22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/iYixMN5EHO6BSgjdzodyQxKA9uf2pvMrx5THmukf.jpg', 'students/kk/slrTsHjKvR21lKHKODdCUurvvHVwtf6oKbDQpxji.jpg', 'students/ktp/Ih7PZqGXhhUsnC9juKdhDhjzsDhbeARGFa2STFd3.jpg', NULL, '2026-04-04 22:04:13', '2026-04-04 22:48:27'),
(178, 196, 'NUR VITA', NULL, NULL, NULL, NULL, NULL, '082350643703', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-05 02:56:39', '2026-04-05 02:56:39'),
(179, 197, 'Aprilia Palma', NULL, NULL, NULL, NULL, NULL, '081324266619', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-06 22:55:42', '2026-04-06 22:55:42'),
(180, 198, 'Zdian Zarrah Widianto', NULL, NULL, NULL, NULL, NULL, '+6283836730881', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-07 00:30:22', '2026-04-07 00:30:22'),
(181, 199, 'Sopiya Yeti', NULL, NULL, NULL, NULL, NULL, '+6285750541109', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-07 01:39:00', '2026-04-07 01:39:00'),
(182, 200, 'ST KAMARIAH', '6311035611010001', '0014306550', 'SMA/SMK Sederajat', 'MA AL MADANIYAH JARO', 'IPA', '+6282149058909', 'Perempuan', '2001-11-16', 'Simpang pait kab.paser', 'Islam', 'Pait RT 09 long ikis kab.paser Kalimantan Timur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/TA4dBAkvFcIVeeJIdRu6QtfDMr4nFhWrCbl6qQHW.jpg', 'students/kk/qfzF60C0iHZLw2LPC5jcccxArIMUSsBTeLD7ivd7.jpg', 'students/ktp/fzqtXtI9x1GGw44nY7sNJDvFUanKra3ospebr2fL.jpg', 'students/certificates/rPtyBsBCbgigSpJY8jbiIEA5VuEPGu1ya7aUEgqE.jpg', '2026-04-07 03:38:47', '2026-04-14 19:03:30'),
(184, 202, 'andika rafi ramadhani', NULL, NULL, NULL, NULL, NULL, '083159013059', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-07 19:03:47', '2026-04-07 19:03:47'),
(185, 203, 'MOHAMMAD AL MALIK', '6472093012070001', '0079202188', 'Paket C', 'Pesantren Al ishlah', 'Al Qur\'an', '081919694504', 'Laki-laki', '2007-12-30', 'SAMARINDA', 'Islam', 'Gg. H. Sabran II, Gn. Kelua, Kec. Samarinda Ulu, Kota Samarinda, Kalimantan Timur', 'RENITA PAKAYA', NULL, NULL, NULL, 'Gg. H. Sabran II, Gn. Kelua, Kec. Samarinda Ulu, Kota Samarinda, Kalimantan Timur', '009', '004', 'gunung kelua', '75124', 'Samarinda ulu', 'Kota samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/SP76xccUXorGqE32NSRzvwwsPqn6ZVndHuacM6B7.png', 'students/kk/RVw03oYR6nrrZIE1ogkESsHYal1RKo81Rp7Cr7un.pdf', 'students/ktp/h3Ilf4UZ5byDBSDRtRmZdDcykSKjzrQJKMyoWLrx.pdf', NULL, '2026-04-07 21:58:50', '2026-04-28 18:52:56'),
(186, 204, 'Hairul Rabani', '6472012104960002', '9963889300', 'SMA/SMK Sederajat', 'SMKN 11 Samarinda', 'Teknik Otomotif', '082153409020', 'Laki-laki', '1996-04-21', 'Bontang', 'Islam', 'Jln Padat Karya Gang Rambai Kelurahan Handil bakti Kecamatan Palaran Kota Samarinda KALTIM', 'JUMIATUL', NULL, NULL, NULL, 'Jl Padat Karya', '032', '0', 'Handil bakti', '75242', 'Palaran', 'SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'lainnya', 'sepeda_motor', 'completed', 'students/photos/KRTWIi4iVMo96Yb0pF89mtsfDP76oGqklG1N1VmP.jpg', 'students/kk/ZP1Mq0W2njcrqAOoM2O26PKzfKAX5yNqGZ6Um7pX.jpg', 'students/ktp/Wr2ucKCwQeAXKOzKYql4AUJ2xD1sb289kJLsYL6A.jpg', 'students/certificates/8brguSdhY6F8sfjPmwLUwOBTFe7mZfRStXdNqgz9.jpg', '2026-04-08 03:51:52', '2026-04-09 00:22:17'),
(187, 205, 'FITRIANA DWI UTARI', '6402175310080002', '0085164118', 'SMA/SMK Sederajat', 'SMAN 1 TENGGARONG', 'IPA', '085249398268', 'Perempuan', '2008-10-13', 'SEBUNTAL', 'Islam', 'JL. DIPONEGORO NO. 36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/niFr6M22Oe95lwQOMXJBHTG0YrjK0JlEerehRkja.jpg', 'students/kk/Yl1o4AmyqwT2bVwsALQXZnxblXjG37y8xjVChv1A.jpg', 'students/ktp/b2MUaxhfPPAEIE3mGF1ndaLcqGELKS3BUUYp3kcX.jpg', NULL, '2026-04-08 05:45:17', '2026-04-08 06:08:49'),
(188, 206, 'andi saputra', NULL, NULL, NULL, NULL, NULL, '081364080368', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-08 13:19:31', '2026-04-08 13:19:31'),
(189, 207, 'Rosmah Lia Putri', '6402144607080002', '0085856291', 'SMA/SMK Sederajat', 'SMAN 1 MUARA JAWA', '-', '085752186058', 'Perempuan', '2008-07-06', 'Muara Jawa', 'Islam', 'JL. ARIF RAHMAN HAKIM, RT 05 MUARA JAWA TENGAH, KEC. MUARA JAWA', 'ROSITA', NULL, NULL, NULL, 'JL. ARIF RAHMAN HAKIM, HANDIL 6', '05', '0', 'Muara Jawa Tengah', '75264', 'Muara Jawa', 'Kutai Kertanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/QSMkoWDvAPCU49lEV5Yf18bOiBGFM1zXb50SsUm0.png', 'students/kk/kUXqG79khaevbj7tIukPaR9rkr0T6xvKUwbpOJJb.jpg', 'students/ktp/2ZdWU3MNpQIURm1jr9o4ZEzaoleYSmF1ZFVtRqBC.jpg', NULL, '2026-04-08 18:18:27', '2026-04-23 04:40:30'),
(190, 208, 'Radithya yuwen fortino lim', NULL, NULL, NULL, NULL, NULL, '081348139197', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-09 09:13:22', '2026-04-09 09:13:22'),
(191, 209, 'Firra cahyani meidiva putri', '6471035105080002', '0085326459', 'SMA/SMK Sederajat', 'SMKN 19 SAMARINDA', 'AGRIBISNIS', '085828563962', 'Perempuan', '2008-05-11', 'BALIKPAPAN', 'Islam', 'jl telaga sari gg3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/v8fk06jx9JMnfwZ31eKnz8k9P3ZDyBZe0zf5Q06V.jpg', 'students/kk/6Wa80841MbC8HETPT73jRWkJcG6kJL3MwooOTWbb.jpg', 'students/ktp/EQpHdUEnlph1GT7DU6ZRXUDxUhNXusUbTXN6WpYS.jpg', NULL, '2026-04-10 06:03:15', '2026-04-10 06:22:17'),
(192, 210, 'Ridho Achmad Zulfikar', NULL, NULL, NULL, NULL, NULL, '081350303658', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-10 20:34:04', '2026-04-10 20:34:04'),
(195, 213, 'Nur Azizah', '6472065911030005', '0031772721', 'SMA/SMK Sederajat', 'SMK Medika Samarinda', NULL, '085787500734', 'Perempuan', '2003-11-19', 'Samarinda', 'Islam', 'Jl. P. Antasari, Teluk Lerong Ulu, Sungai Kunjang', 'Nur Aisyah', NULL, NULL, NULL, NULL, '01', NULL, 'Teluk Lerong Ulu', '75127', 'Sungai Kunjang', 'Kota Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/tq2qNoV3ju13mA5YpwULSMungchnxRceYs3IaQCP.jpg', 'biodata/kk/H13C66XmgWTrSCGYHLQB5M1JBPX4vQ3WCHU0RHWC.jpg', 'biodata/ktp/apuguvOjqeUIPRxNPXr0dFUEg6VHk9OjgqXcvgaY.jpg', 'biodata/certificates/bKQGLzkh6kjbcS2YqylqIc7CprFmV59TnsOVA6lI.jpg', '2026-04-12 23:11:45', '2026-04-12 23:26:57'),
(196, 214, 'Saskia Junita Putri', '6407056806080001', '0097929633', 'SMA/SMK Sederajat', 'SMAN 1 LONG IRAM', NULL, '082185654314', 'Perempuan', '2008-06-28', 'Long Iram', 'Islam', 'JL. AHMAD YANI Long Iram', 'Lisa Karmila', NULL, NULL, NULL, NULL, '01', NULL, 'Long Iram', '75766', 'Long Iram', 'Kutai Barat', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/610B08K8BxtKVv9XnxZMHGLAy6p98lnvPVG0SsLl.jpg', 'biodata/kk/rxhZ5SF35eGT2BOfWcEujvTSMxAFlfvNO2yhnoRP.jpg', 'biodata/ktp/ixmpVHXd5NAkSj6MM7eO2mHwZIwM1EhoxuZ0HdDk.jpg', 'biodata/certificates/y1qvb8zKlIcbfvOsb49mGRiAzhC2BFhWqkEORyto.jpg', '2026-04-12 23:48:29', '2026-04-12 23:53:25'),
(197, 215, 'Aditya Maulana', NULL, NULL, NULL, NULL, NULL, '085656748679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-12 23:53:20', '2026-04-12 23:53:20'),
(198, 216, 'Adhitya Pratama', NULL, NULL, NULL, NULL, NULL, '085162886986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-13 03:20:42', '2026-04-13 03:20:42'),
(199, 217, 'Erika Gracia Novitania Arif', '6471011611070002', '0079583519', 'SMA/SMK Sederajat', 'SMA Negeri 7 Balikpapan Timur', 'IPS', '085845267318', 'Perempuan', '2007-11-16', 'Balikpapan', 'Islam', 'JL. PERSATUAN, RT31, NO.60, MANGGAR BARU, BALIKPAPAN TIMUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/HzNxkA7dIQBZOksXjtuKazHXltM7BUn6EDYJJNSU.jpg', 'students/kk/HHXo8IGivdKe9YlrX57uXeFCBJdhOAi8mfX55bgw.jpg', 'students/ktp/BCfqgp6jItbvuq3eMer2J9V7yHUOvzzceavMlHrX.jpg', NULL, '2026-04-13 19:58:36', '2026-04-15 04:59:52'),
(202, 220, 'Nafasya', NULL, NULL, NULL, NULL, NULL, '+62 858-4543-6159', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-14 03:41:24', '2026-04-14 03:41:24'),
(203, 221, 'Fadhil Karim', '6472032303070003', '0077047674', 'SMA/SMK Sederajat', 'SMKN 2 SAMARINDA', 'Teknik Alat Berat', '087826968546', 'Laki-laki', '2007-03-23', 'Samarinda', 'Islam', 'JL AW SYAHRANIE GG H SABRAN I NO.25A', 'Sari', '-', NULL, NULL, 'GG H SABRAN I', '09', '--', 'Gunung Kelua', '75123', 'Samarinda Ulu', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'students/photos/Udcnu5xCCEZaHUhx1f2mvt5afTq9Iws3TvFIxwrI.png', 'students/kk/1rsfGqUzVbLSAJX5WfDvDe6ou4wcTu6VJFpdR6eK.jpg', 'students/ktp/Zfa88OMwGqKfwPu8HWQQNds3Xr5TQPlaxHDDsPhl.jpg', 'students/certificates/WzTYkdqdF2Mw3CKVu4hMWyAtjn8JcWF61uCn0Hjt.jpg', '2026-04-14 05:25:38', '2026-04-28 19:05:37'),
(204, 222, 'AZISAH NUR SHAHADA', '6472024308800009', '0076540338', 'SMA/SMK Sederajat', 'SMAN 17 SAMARINDA', NULL, '082122651612', 'Perempuan', '2007-12-02', 'Samarinda', 'Islam', 'JL. TANJUNG JONE, BLOK W/I NO 66', 'Nursidah', NULL, NULL, NULL, NULL, '003', NULL, 'Mesjid', NULL, 'Samarinda Seberang', 'Kota Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/Woz6q1MLTEgzehCjNbDsdruTDcCGJADbF251Vpo1.jpg', 'biodata/kk/isYtJxPyZT5OqVpWdeZH40suh9UhgjweS9U0Vmk3.jpg', 'biodata/ktp/TXfO1p2E49liby4eg5T0louhIGAdr8u8KOqGIjBO.jpg', NULL, '2026-04-14 21:41:01', '2026-04-14 22:08:09'),
(205, 223, 'MOHAMMAD DHONI SETIAWAN', NULL, NULL, NULL, NULL, NULL, '085888495530', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-15 18:07:44', '2026-04-15 18:07:44'),
(206, 224, 'anuarsuhada', '6472051503010009', '0010257641', 'SMA/SMK Sederajat', 'smk ti pratama', 'teknik komputer jaringan', '082287009943', 'Laki-laki', '2001-03-15', 'Samarinda', 'Islam', 'jl.merdeka 3 no.75 rt.92 sungai pinang dalam Samarinda kota', 'saidah', NULL, NULL, NULL, 'jl.merdeka 3', '75', '75', 'sungai pinang', '75117', 'sungai pinang dalam', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'wali', 'sepeda_motor', 'form_completed', 'students/photos/Kwpkcqsp9eoin60geB0sM7SXSsMrkAD0RwYU1TNC.jpg', 'students/kk/vbm56uzRodrVHrRuithhHY0sQqStirz02LCWc0kI.jpg', 'students/ktp/JRV0h4A1to5SeGeraU62zIDYAGLFxTwZjNzM39oL.jpg', 'students/certificates/7KSTBib840fXvQM371SHlgGycHCjfECTyK99uLMv.jpg', '2026-04-16 17:23:31', '2026-04-18 21:29:49'),
(207, 225, 'Muhammad Raflei', '6472032311040004', '0046202221', 'SMA/SMK Sederajat', 'SMA NEGERI 3 SAMARINDA', 'IPA', '082343881957', 'Laki-laki', '2004-11-23', 'Samarinda', 'Islam', 'Jl. Pangeran Antasari GG.9', 'Yuliani', NULL, NULL, NULL, 'Jalan Pangeran Antasari Gang 9 No 84', '05', '01', 'Air Putih', '75124', 'Samarinda Ulu', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'form_completed', 'students/photos/0Vu0maj5nYKfdUoNVMYO5dPGORuyYENe3x7vcref.jpg', 'students/kk/zdAB4mofl1C1jFBWjoYrHArF7ooYTnoALpstTJuH.jpg', 'students/ktp/1gxWT4azHJYSgZ2JyC2a2maWp9qe7HgfnVIVxGJw.jpg', 'students/certificates/ql0KXRR83rBbW2FEa4ahimDYEYwFySF1Twh6oDs6.jpg', '2026-04-16 22:35:19', '2026-04-23 03:25:10'),
(208, 226, 'Muhammad Abdhis Salam', '6472061710070001', '0074262933', 'SMA/SMK Sederajat', 'SMK DDI SAMARINDA', NULL, '082154863294', 'Laki-laki', '2007-10-17', 'Samarinda', 'Islam', 'Jl. P. Antasari Gang I No. 19', 'Noor Sehan', NULL, NULL, NULL, NULL, '07', NULL, 'Teluk Lerong Ulu', '75125', 'Sungai Kunjang', 'Kota Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda', 'completed', 'biodata/photos/9d8y65xHTcD4gzYkYWd7c4AG6wfhZJmkQdd2gGaO.jpg', 'biodata/kk/LmIy7K3HNN5LRP1dl8XzX0J1Lj1alkAdUH5JhFRO.jpg', 'biodata/ktp/PTcgLXRLE610612cGlhsD1GqVqH3IJNM3Uvn6NND.jpg', NULL, '2026-04-17 00:03:03', '2026-04-17 00:08:19'),
(209, 227, 'Gita Indah Rosmalia', '6402165704080003', '0089020688', 'SMA/SMK Sederajat', 'SMA Syaichona Cholil', NULL, '085828347023', 'Perempuan', '2008-04-17', 'Kutai Kartanegara', 'Islam', 'Jl.S.Parman', 'Giyanti', NULL, NULL, NULL, NULL, '003', NULL, 'Bukit Raya', '75126', 'Tenggarong Seberang', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/4VXRfwDsMu21xTMJxGUvFHZfuRkUVcvf5KmGJdWs.jpg', 'biodata/kk/l50ZVX6EWPnld45Hy9r6TbWsrRz2IXUGcy9P22Lw.jpg', 'biodata/ktp/IGB7OOJthuKDGmR4RPxSd9meA0PV9JfyacmoIeEP.jpg', NULL, '2026-04-17 01:13:07', '2026-04-17 01:25:00'),
(210, 228, 'Fitriah', '6472056803080006', NULL, 'SMA/SMK Sederajat', 'SMA Syaichona Cholil', NULL, '087869449677', 'Perempuan', '2008-03-28', 'Samarinda', 'Islam', 'Pinang Seribu', 'Aminah', NULL, NULL, NULL, NULL, '014', NULL, 'Sempaja Utara', '75119', 'Samarinda Utara', 'Kota Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/h9fPyFeiYwxu0cKDC9WMTNEIR1ou4PM2gTg3vLtB.jpg', 'biodata/kk/QUsPEBsTYxQjTy3PYORF8oCtn9cbNvUpcZyr49oq.jpg', 'biodata/ktp/zZeymeqWoRg9DonW4opHlmWbFZ0E6qWeVqjSsLzd.jpg', NULL, '2026-04-17 02:00:21', '2026-04-17 02:08:14'),
(211, 229, 'Muhammad Nabil Dwi Putra Manoppo', '6402141912070003', '0088416437', 'SMA/SMK Sederajat', 'SMK PRASETYA BUDI LUHUR MUARA JAWA', NULL, '085751302991', 'Laki-laki', '2007-12-19', 'Samboja', 'Islam', 'Jln. DARUSSALAM', 'Vavorita Rahman', NULL, NULL, NULL, NULL, '06', NULL, 'Muara Jawa tengah', '75261', 'Muara Jawa', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/pmzzle5Tys4LNce9KrUoTWd0Fl2XPzGaTJsYHZcl.jpg', 'biodata/kk/jYjbeAC1x10lOsie9h7zWWH9RBVwSX8HVzncqYfy.jpg', 'biodata/ktp/w1iNYHCnf4UOpAgQcaIhzXsK8PcWUVWjr6Fwy4Zb.jpg', NULL, '2026-04-17 16:55:51', '2026-04-17 17:11:31'),
(212, 230, 'Muhammad Nabil Dwi Putra Manoppo', NULL, NULL, NULL, NULL, NULL, '085751302991', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-17 17:10:46', '2026-04-17 17:10:46'),
(213, 231, 'Ratu Syahlaa Az Zahra Ahmad', NULL, NULL, NULL, NULL, NULL, '082213432909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-18 16:59:26', '2026-04-18 16:59:26'),
(214, 232, 'Rivai iyasa', NULL, NULL, NULL, NULL, NULL, '089601087236', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-18 20:56:05', '2026-04-18 20:56:05'),
(215, 233, 'Aziz Nur Amin', NULL, NULL, NULL, NULL, NULL, '085895874676', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-19 05:44:50', '2026-04-19 05:44:50'),
(216, 234, 'Firdan Firdan', NULL, NULL, NULL, NULL, NULL, '085750655672', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-19 09:47:53', '2026-04-19 09:47:53'),
(217, 235, 'bunga permatasari', NULL, NULL, NULL, NULL, NULL, '085194169009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-19 15:46:54', '2026-04-19 15:46:54'),
(218, 236, 'Sri Budiani maskur', NULL, NULL, NULL, NULL, NULL, '087862036278', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-20 18:50:38', '2026-04-20 18:50:38'),
(220, 238, 'SRI FRENSIDA', NULL, NULL, NULL, NULL, NULL, '082256674419', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-21 04:20:10', '2026-04-21 04:20:10'),
(221, 239, 'rahmat haryadi', '6408040612060001', '7230360', 'SMA/SMK Sederajat', 'smk muhammadiyah 1 sangatta utara', 'teknik komputer dan jaringan', '081250532327', 'Laki-laki', '2006-12-06', 'muara bengkal', 'Islam', 'jln hm ardans', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/VIllrSJU72wtdoEV803Dyt5cdw17hGUmfIA763tZ.jpg', 'students/kk/oOlFKgZpgoDYReZybjC5vZcRnEsAhBFle9QXVQQH.jpg', 'students/ktp/aNlrMCu1JgrjCTANLSF3MLQp2rGxyI93MPOeIvyk.jpg', 'students/certificates/3GiLHm3U95l8lIwCkLeHY00dzbHaF78q9JnnlSVw.pdf', '2026-04-21 04:48:44', '2026-04-23 08:15:01'),
(222, 240, 'Mohamad Rizki Arpiansyah', NULL, NULL, NULL, NULL, NULL, '081350899960', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-21 16:33:03', '2026-04-21 16:33:03'),
(223, 241, 'Try Risky Aulia', '6471047001070002', '0075136727', 'SMA/SMK Sederajat', 'Skoi Kaltim', NULL, '085185518709', 'Perempuan', '2007-01-30', 'Balikpapan', 'Islam', 'JL.LETJEND.S.PARMAN NO.59', 'Soesanty', NULL, NULL, NULL, '-', '28', '09', 'GUNUNGSARI ULU', '76122', 'Balikpapan Tengah', 'Kota Balikpapan', 'Kalimantan Timur', 1, '6013017740033143', 'kost', 'ojek', 'form_completed', 'biodata/photos/iYjbZzO3xS8eWz1yywNOoKzOgCQNRXkXTz2FrEsz.jpg', 'biodata/kk/w6r5iyZsZjAZfskxIs8gDHwT0F3RAf00uVNaNw56.jpg', 'biodata/ktp/01GsUWr4V2NUjgklZYKfr19M9d09e2Do4UPeZwqn.jpg', NULL, '2026-04-22 00:00:31', '2026-04-22 01:55:26');
INSERT INTO `student_biodatas` (`id`, `user_id`, `name`, `nik`, `nisn`, `last_education`, `school_origin`, `major`, `phone`, `gender`, `birth_date`, `birth_place`, `religion`, `address`, `mother_name`, `npwp`, `telephone`, `email`, `dusun`, `rt`, `rw`, `kelurahan`, `kode_pos`, `kecamatan`, `kabupaten`, `provinsi`, `kps_recipient`, `kps_number`, `residence_type`, `transportation`, `reregistration_status`, `photo_path`, `kk_path`, `ktp_path`, `certificate_path`, `created_at`, `updated_at`) VALUES
(224, 242, 'Annisa Khairani', '6472026912070001', '0079404189', 'SMA/SMK Sederajat', 'Smk Bakti', NULL, '08998341839', 'Perempuan', '2007-12-29', 'Samarinda', 'Islam', 'Jl Barito KM 1', 'Sapinah', NULL, NULL, NULL, NULL, '19', NULL, 'Simpang Tiga', '75391', 'Loa janan Ilir', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/rTLGYHbfYNZpiU8nVbyZcgyKc0TAqKomN0m5zs9T.jpg', 'biodata/kk/S8X1net9CPDNO8hhImwDB6mPvrJj03sXgM1gSw1p.jpg', 'biodata/ktp/QLvanNwrGgSHytdqAeUbCePTZdCNCwfw8YmgI7yy.jpg', NULL, '2026-04-22 01:01:08', '2026-04-22 01:16:56'),
(225, 243, 'Keyla Sabrina', NULL, NULL, NULL, NULL, NULL, '082223835372', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-22 20:12:31', '2026-04-22 20:12:31'),
(226, 244, 'dian julfani', NULL, NULL, NULL, NULL, NULL, '082187285016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-22 21:11:45', '2026-04-22 21:11:45'),
(227, 245, 'Mawar Ariyan Nur', '6472024905080002', '0083983261', 'SMA/SMK Sederajat', 'SMAN 17 SAMARINDA', 'IPA', '085551278091', 'Perempuan', '2008-05-09', 'Samarinda', 'Islam', 'JL.BUNG TOMO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/DOpIUi0euo1iPF2rvywRG9M6Syza8zV5pfY5eIC1.jpg', 'students/kk/59LpcvAU9iWriEhQwH4DiNn08Pw2gsiJqddNqnqw.jpg', 'students/ktp/hn4FsNhrDNPzU6H4eb7AGwmRVhp1Qt7iG8CmMiVg.jpg', NULL, '2026-04-22 21:53:07', '2026-04-22 22:08:04'),
(228, 246, 'Nabil Hisyaam Rajwa Hadi', '6472020711070003', '0074096013', 'SMA/SMK Sederajat', 'SMKN 14 SAMARINDA', 'TJKT / Teknik Jaringan Komputer dan Telekomunikasi', '082131955777', 'Laki-laki', '2007-11-17', 'Samarinda', 'Islam', 'PERUM PESONA MAHAKAM ESTATE BLOK F-4 NO. 06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/Qu1eXRWRbY7RY9pTtfwTOnnE7jifSpM7TtnSRc0H.jpg', 'students/kk/hxqNJAT026KYGntXXucIhtgseETXr7eKxWfXx8Dg.jpg', 'students/ktp/bB1NyA3yKcOKQGW5qiw19aRlSvhVsM54XvOywJOB.jpg', NULL, '2026-04-22 22:37:03', '2026-04-22 22:52:22'),
(229, 247, 'Nur hidayah saqilah', NULL, NULL, NULL, NULL, NULL, '083138474909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-23 03:31:37', '2026-04-23 03:31:37'),
(230, 248, '7878686686868787878798', NULL, NULL, NULL, NULL, NULL, '08115331979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-23 06:08:45', '2026-04-23 06:08:45'),
(231, 249, '08989797979878', NULL, NULL, NULL, NULL, NULL, '08115331979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-23 06:10:06', '2026-04-23 06:10:06'),
(232, 250, 'Satria Labib Rifqy', NULL, NULL, NULL, NULL, NULL, '085117278066', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-23 17:12:26', '2026-04-23 17:12:26'),
(233, 251, 'MOCHAMMAD FARIZKI MAULANA', '6472012201080002', '0081504938', 'SMA/SMK Sederajat', 'SMK NEGERI 19 SAMARINDA', 'DESAIN KOMUNIKASI VISUAL', '085222731666', 'Laki-laki', '2008-01-22', 'Samarinda', 'Islam', 'JL. P . ANTASARI RT33 BUKUAN,PALARAN', 'Jamilah', NULL, NULL, NULL, 'Jln.pangeran antasari', '33', NULL, 'Bukuan', '75241', 'Palaran', 'Samarinda', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'form_completed', 'students/photos/0Bcn0MnDZqWj94omWfz518eBM7JDdKIaZYmyIz2k.jpg', 'students/kk/ntjzyDEOhiqxs5JM1qxKc04hG7pgYWuFiDAnlUwO.jpg', 'students/ktp/fw2BFpEgIItc1j0nKtwQW3HmnV1z3mxqE6JAF7uM.jpg', NULL, '2026-04-23 23:53:23', '2026-04-29 07:29:54'),
(234, 252, 'Evan Raditia Lesmana', NULL, NULL, NULL, NULL, NULL, '+62 895-3859-8685', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-23 23:56:04', '2026-04-23 23:56:04'),
(238, 256, 'Noval putra hardiansyah', '6472012711070001', '0075856707', 'SMA/SMK', 'SMK Negri 19 Samarinda', 'Desain komunikasi visual', '082381148643', 'Laki-laki', '2007-11-27', 'Samarinda', 'Islam', 'Jln. HM. Gofar sidik, RT.47, BUKUAN, PALARAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/e3fyGn2LMLxMaaUDegtFdmHUOJMkKk1eDBwiNb5O.png', 'students/kk/6lt7ztNI4azHqxzyCua2044bAADEDyLMSYwtmaHn.jpg', 'students/ktp/K3PikQqexniQFZ0LTilaFb59wmZ1tUMPa5yUGzwW.jpg', NULL, '2026-04-24 05:14:57', '2026-04-24 17:07:22'),
(239, 257, 'SHERLLY AMANDA PRATAMA', '6472036909140002', '0082792590', 'SMA/SMK Sederajat', 'SMAS SYAICHONA CHOLIL SAMARINDA', NULL, '081335044222', 'Perempuan', '2008-07-01', 'Samarinda', 'Islam', 'JL. TRISARI DUSUN SIDODADI RT. 20', 'SRI MURNI SULASTRI', NULL, NULL, NULL, NULL, '43', NULL, 'SIDODADI', NULL, 'SAMARINDA ULU', 'KOTA SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/IIcKQuvzObVIn5ACfB87N1crjkCiRXnOe4ckiz7S.jpg', 'biodata/kk/d4U7FMkvuRJgUYd1c8UQU3SUyAyCAZV318VprUSR.jpg', 'biodata/ktp/MBjifqM5whkxQ3guswrSH81RBr2XzzySD79xBurg.pdf', 'biodata/certificates/monH5bv8rBqhTY9PFgraZlXaLYFMgv7aHgWWJWGI.pdf', '2026-04-24 05:14:57', '2026-04-24 05:25:41'),
(240, 258, '𝙕𝘼𝙃𝙄𝙍𝘼 𝙈𝙐𝙎𝙁𝙄𝙆𝘼', '6472055910070009', '0079047490', 'SMA/SMK Sederajat', 'SMAS SYAICHONA CHOLIL', NULL, '083812561422', 'Perempuan', '2007-10-19', '𝙎𝙖𝙢𝙖𝙧𝙞𝙣𝙙𝙖', 'Islam', '𝙋𝙪𝙧𝙬𝙤𝙙𝙖𝙙𝙞', 'Y𝙪𝙡𝙞𝙖𝙩𝙞', NULL, NULL, NULL, NULL, '044', NULL, '𝙇𝙚𝙢𝙥𝙖𝙠𝙚', '75118', '𝙎𝙖𝙢𝙖𝙧𝙞𝙣𝙙𝙖 𝙪𝙩𝙖𝙧𝙖', 'SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/uGPuVcb3wgwpCrvwWHcUBshio5z5pp6RacSSIy21.jpg', 'biodata/kk/MhgxsUcLATAZ1kH4HHn9BjkczCQ5B3QrKeDPEfCz.jpg', 'biodata/ktp/OmNEis33Q373cjNAb4oLU6op6fzbJkEF4VDC1Cmu.jpg', NULL, '2026-04-24 05:46:17', '2026-04-24 05:53:59'),
(241, 259, 'Syahrani Khoeruddin', '6402160403080002', '0088813204', 'SMA/SMK Sederajat', 'SMA Syaichona Cholil samarinda', NULL, '081255689569', 'Laki-laki', '2008-03-04', 'Samarinda', 'Islam', 'Mulawarman Tenggarong seberang', 'Waginah', NULL, NULL, NULL, NULL, '06', NULL, 'Mulawarman', '75572', 'Tenggarong seberang', 'Kutai Kartanegara', 'Kalimantan Timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/GUk92RBXSnJGsG2M9JaAnBZsPPoTJfh48fe7atIu.jpg', 'biodata/kk/74VrTw7LYpPfdZJsFbgeTfXujTZFVXUbbBLNxdkx.jpg', 'biodata/ktp/jL4DzRFQrWje8e196utkyVoxZUbgfhDNgUySqpvB.jpg', NULL, '2026-04-24 06:10:32', '2026-04-24 06:22:09'),
(242, 260, 'Aidil juzaili', NULL, NULL, NULL, NULL, NULL, '082217197865', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-25 00:21:27', '2026-04-25 00:21:27'),
(243, 261, 'Nurul Fathiyah', NULL, NULL, NULL, NULL, NULL, '+6285654724989', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-25 00:56:13', '2026-04-25 00:56:13'),
(244, 262, 'Muhammad Nabiil Ansori', NULL, NULL, NULL, NULL, NULL, '085738861622', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-25 13:04:23', '2026-04-25 13:04:23'),
(245, 263, 'Dewi Risma Ramayanti', NULL, NULL, NULL, NULL, NULL, '082154222877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-25 20:17:02', '2026-04-25 20:17:02'),
(246, 264, 'muhammad riski', '6472022301030004', NULL, 'SMA/SMK Sederajat', 'SMKN 19 SAMARINDA', 'TEKNIK OTOMOTIF', '087862707144', 'Laki-laki', '2003-01-23', 'SAMARINDA', 'Islam', 'Jl.Mangkupalas Rt 014 Rw 000,Kel Mesjid Kec Samarinda Seberang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/JQPuwJaiESMHrLmCTl7AqJ8eFQq1Sg1hxArfKnOk.jpg', 'students/kk/VHKgpmblIH5eIenVmVf9vh1wSJNon17BeMOLICzY.jpg', 'students/ktp/wDW4QBFLkXqJgTjGNOtM6LuyRv2AdQ6v0xE7mAmL.jpg', 'students/certificates/3pEfUtq0r0vT7umqmFyamAXvpfunw0eJSIGizkOl.jpg', '2026-04-26 01:14:50', '2026-04-27 21:21:17'),
(247, 265, 'SYAUKANI', '6402182710070001', '0074685111', 'SMA/SMK Sederajat', 'SMAN 1 KOTA BANGUN', NULL, '082210593020', 'Laki-laki', '2007-10-27', 'MELINTANG', 'Islam', 'DESA MELINTANG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'biodata/photos/2oTfsdzmKqtEBL4s5rWv0DpUpZEEMkpdpbLPCxTP.jpg', 'biodata/kk/uvpcpkTrYRjxN3rgZddmGHIW0KhEhToGT1D5QPq4.jpg', 'biodata/ktp/GCKJEhcmr3Vw97pga49bSl30Hgy9EnrTrUA1JpQv.jpg', 'biodata/certificates/qsQEXvDCDHMF1f4771xyH9QYw7jbEfm8AvKYJXly.jpg', '2026-04-26 08:46:26', '2026-04-26 08:46:26'),
(248, 266, 'Nafisa Widya Rahma', NULL, NULL, NULL, NULL, NULL, '081346303409', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-27 19:44:04', '2026-04-27 19:44:04'),
(249, 267, 'MUHAMMAD BAIHAQI AL FARISYI', '1571062101080001', '0083786643', 'SMA/SMK Sederajat', 'MAN 1 KOTA JAMBI', NULL, '088276517339', 'Laki-laki', '2008-01-21', 'JAMBI', 'Islam', 'JL.KH.HASAN ANANG', 'Nur Hikmah', NULL, NULL, NULL, NULL, '008', NULL, 'Olak Kemang', '36262', 'Danau Teluk', 'Kota Jambi', 'Jambi', 0, NULL, 'wali', 'sepeda_motor', 'completed', 'biodata/photos/HiW1poFkuCHN6TgbiGBL9C0uFuyCXxLm4cM8qwGt.jpg', 'biodata/kk/vVQcNGQujCyp70MXx3cH4Ye0u1lwaYYp6BRwsaOl.jpg', 'biodata/ktp/yZfadsezYVDdOrMDOqt6X8b9O8F2nhuAT6dPGgY8.jpg', 'biodata/certificates/IMQkp7j3bB90BK7eneA4oeYTFEIzNTiOmkBm2LQ9.jpg', '2026-04-27 23:26:34', '2026-04-27 23:32:34'),
(250, 268, 'Rista may Wuandari', NULL, NULL, NULL, NULL, NULL, '085137014672', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-27 23:37:25', '2026-04-27 23:37:25'),
(251, 269, 'Yudha mey pratama', NULL, NULL, NULL, NULL, NULL, '085792072085', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-27 23:47:04', '2026-04-27 23:47:04'),
(252, 270, 'Fita', '6408116808080001', NULL, 'SMA/SMK Sederajat', 'SMAN 1 SANDARAN', NULL, '081349654532', 'Perempuan', '2008-08-28', 'Wono', 'Islam', 'DESA MARUKANGAN', 'FITRIA SANTI', NULL, NULL, NULL, NULL, '005', NULL, 'DESA MARUKANGAN', '75685', 'SANDARAN', 'KUTAI TIMUR', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/oPVgfQNZ4I2dZZd2cVhQ9lI2tGHCJTPyBPgHQi3H.jpg', 'biodata/kk/da66O9bR98pjQcpP9L07MR0Z6dCainVYG5r8Z3oj.jpg', 'biodata/ktp/qJjFdYXh5g1rTzEib9IMS1HfkePDL2MdcR7nimhi.jpg', NULL, '2026-04-28 00:20:57', '2026-04-28 00:42:40'),
(253, 271, 'Tiara Qaisa Hikmah', NULL, NULL, NULL, NULL, NULL, '081549233826', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-28 01:45:05', '2026-04-28 01:45:05'),
(254, 272, 'DINA AULIA RAHMAH', '6371045509070005', '0071512134', 'SMA/SMK Sederajat', 'SMK NEGERI 14 SAMARINDA', 'PEMASARAN', '082254347402', 'Perempuan', '2007-09-15', 'Banjarmasin', 'Islam', 'JL. SOEKARNO HATTA KM 4,5 RT 32, KEL LOA JANAN ULU, KEC LOA JANAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/VaTmQpDywkaxQkNfoPjkJiJYq7z65kCkOVcajUUc.jpg', 'students/kk/kAfB0MNEahztVMvEfXRrwz2SNn4fqRsJlKcyxnEh.jpg', 'students/ktp/BKV0WVrJMIFj7xMrbrwoVslk5zHkpixaqzDBThS1.jpg', NULL, '2026-04-28 03:55:59', '2026-04-29 09:11:20'),
(255, 273, 'Ahmad Fauzi', NULL, NULL, NULL, NULL, NULL, '085656706176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-28 06:23:44', '2026-04-28 06:23:44'),
(257, 275, 'M rafi\'i Rifki', '6402153009080001', '0084467085', 'SMA/SMK Sederajat', 'SMK MIFTAHUL ULUM SAMARINDA', 'Teknik komputer dan jaringan', '082254824357', 'Laki-laki', '2008-09-30', 'Kutai Kartanegara', 'Islam', 'Jln SMP 32 Makroman RT 02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', 'students/photos/CzBKC6kbwicw85K6HGj8tVMHrNN5dAIgcovVHS6i.jpg', 'students/kk/FGjHlgmC1ab9BfyW2ZXWjCGS6zaWMwLuzcsa9sQp.jpg', 'students/ktp/ojbLxF4trfcS2uZPYVeWgiiLh4uzueFkmpgaPl0v.jpg', NULL, '2026-04-28 14:43:27', '2026-04-28 15:23:59'),
(258, 276, 'Restu Azis Rofi\'i', '6472010408080002', '0086465674', 'SMA/SMK Sederajat', 'SMA Syaichona Cholil Samarinda', NULL, '085824436280', 'Laki-laki', '2008-08-04', 'Samarinda', 'Islam', 'Jl. Irigasi', 'Aris Susanti', NULL, NULL, NULL, NULL, '050', NULL, 'Rawa Makmur', '75243', 'Palaran', 'Samarinda', 'Kalimantan timur', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/CNVyeD9t2Yhr4y8yE8k7TInm7EnLuPpBrXwnqUEv.jpg', 'biodata/kk/MJ3PPXgN233Yn74mJnTCaEzdwseLW7XWzT4vdLp7.jpg', 'biodata/ktp/dTBG1yCZwoz1vva4VfEk9rg6TKU4zWBg7G3ZWhEl.jpg', NULL, '2026-04-29 18:28:49', '2026-04-29 18:36:39'),
(259, 277, 'Yusril', NULL, NULL, NULL, NULL, NULL, '085180743768', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'not_started', NULL, NULL, NULL, NULL, '2026-04-29 23:28:15', '2026-04-29 23:28:15'),
(260, 278, 'SALSABILLA PUTERI', '6472057005070001', '0072555770', 'SMA/SMK Sederajat', 'MAN 1 Samarinda', NULL, '089675680018', 'Perempuan', '2007-05-30', 'Samarinda', 'Islam', 'JL. REVOLUSI GG. HANDIL NO.28', 'Nurhidayah', NULL, NULL, NULL, NULL, '034', NULL, 'LOK BAHU', NULL, 'SUNGAI KUNJANG', 'SAMARINDA', 'KALIMANTAN TIMUR', 0, NULL, 'bersama_orang_tua', 'sepeda_motor', 'completed', 'biodata/photos/bkXkFCZp9NjsjKaQde7cZPeE9mHj6kTCEiaPfguH.jpg', 'biodata/kk/NoJdtR0sbJFDBDzNDI7v0LtVuVgWp1OirujQfDWz.jpg', 'biodata/ktp/TVxOmbHFhkBH5HQyvN6AUtCJ2iNxySP26ssuhvth.jpg', 'biodata/certificates/ufRnOZfWaoqisZDzJjVlhJcR6Y4uh6zYHq0t515F.jpg', '2026-04-29 23:44:18', '2026-04-30 00:00:41');

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

--
-- Dumping data for table `student_parents`
--

INSERT INTO `student_parents` (`id`, `student_biodata_id`, `type`, `name`, `nik`, `birth_date`, `is_alive`, `education`, `occupation`, `income`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 14, 'ayah', 'Sarimansyah', '6402161603840001', '1984-03-16', 1, 'sma', 'Swasta', '3jt_5jt', '+62 822-4927-5042', NULL, '2026-02-11 00:06:59', '2026-02-11 00:06:59'),
(2, 14, 'ibu', 'Remy Rupiawati', '6402164601860001', '1986-01-01', 1, 'sma', 'IRT', 'tidak_berpenghasilan', '082253420339', NULL, '2026-02-11 00:06:59', '2026-02-11 00:06:59'),
(17, 111, 'ayah', 'Hasan', '6472051010710011', '1971-10-10', 1, 'tidak_sekolah', 'Petani', '500rb_1jt', '083877667348', NULL, '2026-03-09 22:38:12', '2026-03-09 22:38:12'),
(18, 111, 'ibu', 'Kamsiah', '6403064208790001', '1979-08-02', 1, 'sd', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '085389336373', NULL, '2026-03-09 22:38:12', '2026-03-09 22:38:12'),
(23, 10, 'ayah', 'Nur Hendra Saputra', '6472022510820001', '1982-10-25', 1, 'sma', 'Instruktur Sepak bola', '1jt_2jt', '082213135508', NULL, '2026-03-09 23:50:41', '2026-03-09 23:50:41'),
(24, 10, 'ibu', 'Satriati Sulaiman', '6472024101820022', '1982-01-01', 1, 'sma', 'Ibu Rumah Tangga', '500rb_1jt', '0854848432', NULL, '2026-03-09 23:50:41', '2026-03-09 23:50:41'),
(31, 39, 'ayah', 'Bustami', '6402131003470001', '1947-03-10', 0, 'tidak_sekolah', 'Swasta', 'kurang_500rb', NULL, NULL, '2026-03-11 18:17:20', '2026-03-11 18:17:20'),
(32, 39, 'ibu', 'Aisyah', '6402136102580001', '1958-02-21', 1, 'tidak_sekolah', 'Ibu rumah tangga', 'tidak_berpenghasilan', NULL, NULL, '2026-03-11 18:17:20', '2026-03-11 18:17:20'),
(33, 133, 'ayah', 'Sahruji', '6472041003800007', '1980-03-10', 1, 'sd', 'SWASTA', '1jt_2jt', '0895385977806', NULL, '2026-03-11 22:41:14', '2026-03-11 22:41:14'),
(34, 133, 'ibu', 'Irmayani', '6472045404810002', '1981-04-14', 1, 'sd', 'SWASTA', 'tidak_berpenghasilan', '082129784544', NULL, '2026-03-11 22:41:14', '2026-03-11 22:41:14'),
(39, 125, 'ayah', 'ridwan', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-03-12 01:38:54', '2026-03-12 01:38:54'),
(40, 125, 'ibu', 'ellen halim', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-03-12 01:38:54', '2026-03-12 01:38:54'),
(53, 66, 'ayah', 'Syahrial', '6472021305760002', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-03-14 01:12:28', '2026-03-14 01:12:28'),
(54, 66, 'ibu', 'Herlina Ningsih', '6472025208820002', '1982-08-12', 1, 'smp', 'Ibu rumah tangga', NULL, '082254931963', NULL, '2026-03-14 01:12:28', '2026-03-14 01:12:28'),
(57, 108, 'ayah', 'Heri Mulyono', '6472030107710001', '1971-07-01', 0, NULL, NULL, NULL, NULL, NULL, '2026-03-14 01:33:28', '2026-03-14 01:33:28'),
(58, 108, 'ibu', 'Hariyati', '6472035208760001', '1976-08-12', 1, 'sma', 'Ibu rumah tangga', NULL, '085250160428', NULL, '2026-03-14 01:33:28', '2026-03-14 01:33:28'),
(59, 8, 'ayah', 'Sukarnianto', '6472051212690009', '1969-12-12', 1, 'sma', 'Pedagang', '2jt_3jt', '083852596613', NULL, '2026-03-14 01:45:19', '2026-03-14 01:45:19'),
(60, 8, 'ibu', 'Mistiani', '6472055507750007', '1975-07-15', 1, 'sd', 'IRT', NULL, '083852596613', NULL, '2026-03-14 01:45:19', '2026-03-14 01:45:19'),
(61, 26, 'ayah', 'Amir', '6402040304640004', '1964-04-03', 1, 'sd', 'Membuat jaring ikan', NULL, '081255422011', NULL, '2026-03-14 01:52:58', '2026-03-14 01:52:58'),
(62, 26, 'ibu', 'Rose', '7308205704700001', '1970-04-17', 1, 'sd', 'IRT', NULL, '+62 852-4751-7161', NULL, '2026-03-14 01:52:58', '2026-03-14 01:52:58'),
(81, 90, 'ayah', 'Fikri Yadi', '6472061310800006', '1980-10-13', 1, 'sma', 'Swasta', '500rb_1jt', '085246374165', NULL, '2026-03-15 18:59:35', '2026-03-15 18:59:35'),
(82, 90, 'ibu', 'Rina Hartuti', '6472066911780001', '1978-11-29', 1, 'sma', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '082154893911', NULL, '2026-03-15 18:59:35', '2026-03-15 18:59:35'),
(85, 124, 'ayah', 'M.BUSRAN', '7371031309700004', '1970-09-13', 1, 'sma', 'WIRASWASTA', '2jt_3jt', '085246273669', NULL, '2026-03-25 20:46:51', '2026-03-25 20:46:51'),
(86, 124, 'ibu', 'SURYANI', '7371036605790005', '1979-05-26', 1, 'sma', 'IBU RUMAH TANGGA', 'tidak_berpenghasilan', '088744557112', NULL, '2026-03-25 20:46:51', '2026-03-25 20:46:51'),
(87, 22, 'ayah', 'SOLUHUDDIN AFIF', '6402161707790001', '1979-07-17', 1, 'sma', 'PENJUAL IKAN', NULL, '082157365038', NULL, '2026-03-25 21:26:41', '2026-03-25 21:26:41'),
(88, 22, 'ibu', 'RIMA SAFA\'ATI', '6402166704850002', '1985-04-27', 1, 'sma', 'IBU RUMAH TANGGA', NULL, '081545073447', NULL, '2026-03-25 21:26:41', '2026-03-25 21:26:41'),
(89, 83, 'ayah', 'Alm Simin Dahlan', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-03-25 21:53:07', '2026-03-25 21:53:07'),
(90, 83, 'ibu', 'Sukinem', '6471046509600002', '1960-09-25', 1, 'tidak_sekolah', 'Ibu rumah tangga', '2jt_3jt', '082294261936', NULL, '2026-03-25 21:53:07', '2026-03-25 21:53:07'),
(91, 40, 'ayah', 'SOFYAN NUR', '6472060506670001', '1967-06-05', 1, 'sma', 'Tidak bekerja', 'tidak_berpenghasilan', '081347456966', NULL, '2026-03-25 21:57:27', '2026-03-25 21:57:27'),
(92, 40, 'ibu', 'SRI HANDAYANI', '6472067112810007', '1981-12-31', 1, 'sma', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '082253204040', NULL, '2026-03-25 21:57:27', '2026-03-25 21:57:27'),
(93, 37, 'ayah', 'Dede akbar', '6402030107911011', '1991-07-01', 0, 'smp', 'karyawan swasta', '2jt_3jt', '-', NULL, '2026-03-25 22:08:20', '2026-03-25 22:08:20'),
(94, 37, 'ibu', 'normala yanti', '6402035711860005', '1986-11-17', 1, 'sma', 'ibu rumah tangga', 'tidak_berpenghasilan', '+62 838-3222-5600', NULL, '2026-03-25 22:08:20', '2026-03-25 22:08:20'),
(95, 13, 'ayah', 'Nurakim', '6402180809770001', '1977-08-08', 1, 'sma', 'Karyawan swasta', '2jt_3jt', '085345406568', NULL, '2026-03-27 20:34:09', '2026-03-27 20:34:09'),
(96, 13, 'ibu', 'Sri wardani', '6402164507821003', '1982-07-05', 1, 'd1', 'Ibu rumah tangga', '500rb_1jt', '081254917221', NULL, '2026-03-27 20:34:09', '2026-03-27 20:34:09'),
(97, 95, 'ayah', 'Akhyaruddin', '6472061005750015', '1975-05-10', 1, 'sma', 'WIRASWASTA', '1jt_2jt', '082152061522', NULL, '2026-03-27 21:26:13', '2026-03-27 21:26:13'),
(98, 95, 'ibu', 'Muliana', '6472064402800005', '1980-02-04', 1, 'd4_s1', 'IRT', '1jt_2jt', '082152061522', NULL, '2026-03-27 21:26:13', '2026-03-27 21:26:13'),
(115, 140, 'ayah', 'Hamran', '6401050907730001', '1973-07-09', 1, 'smp', 'Petani', 'kurang_500rb', '081645454312', NULL, '2026-03-29 06:25:38', '2026-03-29 06:25:38'),
(116, 140, 'ibu', 'Majrah', '6401057112770001', '1977-12-31', 1, 'sd', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '081528444366', NULL, '2026-03-29 06:25:38', '2026-03-29 06:25:38'),
(119, 33, 'ayah', 'Suparno', '6402060101790014', NULL, 1, 'smp', 'Wiraswasta', '2jt_3jt', '081350106057', NULL, '2026-03-29 21:41:47', '2026-03-29 21:41:47'),
(120, 33, 'ibu', 'Siti Ngaisah', '6402065903820002', NULL, 1, NULL, 'Guru', '2jt_3jt', '081250357120', NULL, '2026-03-29 21:41:47', '2026-03-29 21:41:47'),
(125, 29, 'ayah', 'Muhammad Juanda', '6402081111770003', '1977-11-11', 1, 'smp', 'PNS', '3jt_5jt', '+62 852-4603-4028', NULL, '2026-03-29 23:02:50', '2026-03-29 23:02:50'),
(126, 29, 'ibu', 'Fatimah', '6402085009770002', NULL, 1, 'd4_s1', 'PNS', 'lebih_5jt', '081253020794', NULL, '2026-03-29 23:02:50', '2026-03-29 23:02:50'),
(127, 119, 'ayah', 'ASPUL ANWAR', NULL, NULL, 1, 'sma', 'WIRASWASTA', NULL, '081215335203', NULL, '2026-03-30 00:23:16', '2026-03-30 00:23:16'),
(128, 119, 'ibu', 'Husnah', NULL, NULL, 1, 'smp', 'IRT', NULL, '08125378785', NULL, '2026-03-30 00:23:16', '2026-03-30 00:23:16'),
(129, 56, 'ayah', 'Sutaji', '17.5002.210667.0', NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-03-30 01:36:30', '2026-03-30 01:36:30'),
(130, 56, 'ibu', 'Wakini', '6472034705660002', NULL, 1, 'sma', 'Ibu Rumah Tangga', NULL, '0851-9417-2631', NULL, '2026-03-30 01:36:30', '2026-03-30 01:36:30'),
(131, 147, 'ayah', 'Herman Pangki', '6472023108760002', '1976-08-31', 1, 'sd', 'Wiraswasta', 'kurang_500rb', '0895412812967', NULL, '2026-03-30 02:27:54', '2026-03-30 02:27:54'),
(132, 147, 'ibu', 'Rida', '6472027012770003', '1977-03-30', 1, 'sd', 'Mengurus Rumah Tangga', 'kurang_500rb', '085821543975', NULL, '2026-03-30 02:27:54', '2026-03-30 02:27:54'),
(133, 47, 'ayah', 'Hari Alus', '6402072409670001', '1967-09-24', 1, 'd4_s1', 'Budidaya Ikan', NULL, '+62 852-5232-0963', NULL, '2026-03-30 03:23:10', '2026-03-30 03:23:10'),
(134, 47, 'ibu', 'Mastiah (Almarhumah)', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-03-30 03:23:10', '2026-03-30 03:23:10'),
(135, 89, 'ayah', 'Kahar', '6402050404720001', '1972-04-04', 1, 'sma', 'Wirausaha', NULL, NULL, NULL, '2026-03-30 10:58:36', '2026-03-30 10:58:36'),
(136, 89, 'ibu', 'Natang', '6402054107821003', '1982-07-01', 1, 'sd', 'IRT', NULL, '081545548524', NULL, '2026-03-30 10:58:36', '2026-03-30 10:58:36'),
(145, 155, 'ayah', 'ABD RAHMAN', '6402130107570014', '1957-07-01', 1, 'sma', 'WIRASWASTA', NULL, '0852-4668-6029', NULL, '2026-03-30 22:58:51', '2026-03-30 22:58:51'),
(146, 155, 'ibu', 'Pida', '6402134107640016', '1964-07-01', 1, 'sma', 'IRT', NULL, '0852-4668-6029', NULL, '2026-03-30 22:58:51', '2026-03-30 22:58:51'),
(147, 87, 'ayah', 'Muhammad faisal', '6472022905760002', '1976-05-29', 1, 'sma', 'Swasta', '500rb_1jt', '089516246875', NULL, '2026-03-30 23:21:17', '2026-03-30 23:21:17'),
(148, 87, 'ibu', 'Wardah hafied', '6472025812800004', '1980-12-18', 1, 'smp', 'Ibu rumah tangga', 'tidak_berpenghasilan', '082148476513', NULL, '2026-03-30 23:21:17', '2026-03-30 23:21:17'),
(151, 20, 'ayah', 'Sulaiman', '6472012406710001', '1971-06-24', 1, 'sma', 'Nelayan', '3jt_5jt', '+62 822-5482-4145', NULL, '2026-03-31 00:27:05', '2026-03-31 00:27:05'),
(152, 20, 'ibu', 'Kumala Sari', '6472017112720010', '1962-11-12', 1, 'sma', 'IRT', NULL, '+62 851-4750-5438', NULL, '2026-03-31 00:27:05', '2026-03-31 00:27:05'),
(157, 41, 'ayah', 'muhammad titus', '6472031905830001', '1983-05-19', 1, 'sma', 'karyawan swasta', '1jt_2jt', '089657335200', NULL, '2026-03-31 02:50:10', '2026-03-31 02:50:10'),
(158, 41, 'ibu', 'siti maimunah', '6472024506810008', '1981-05-05', 1, 'sma', 'ibu rumah tangga', 'tidak_berpenghasilan', '082129434625', NULL, '2026-03-31 02:50:10', '2026-03-31 02:50:10'),
(159, 49, 'ayah', 'Herman', '6472022011850002', '1985-11-20', 1, 'smp', 'Karyawan Swasta', '3jt_5jt', '+62 812-5025-8556', NULL, '2026-04-01 00:04:03', '2026-04-01 00:04:03'),
(160, 49, 'ibu', 'Sarah', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-01 00:04:03', '2026-04-01 00:04:03'),
(161, 129, 'ayah', 'Edi utomo', '9171022101770002', '1977-01-21', 1, 'sma', 'Pedagang', '3jt_5jt', '081344421966', NULL, '2026-04-01 01:34:01', '2026-04-01 01:34:01'),
(162, 129, 'ibu', 'Sunarti', '9171025505800001', '1980-05-15', 1, 'smp', 'Ibu rumah tangga', 'tidak_berpenghasilan', NULL, NULL, '2026-04-01 01:34:01', '2026-04-01 01:34:01'),
(167, 69, 'ayah', 'Amin Murtadho', '6472060406760006', '1976-06-04', 1, 'd4_s1', 'freelance', '500rb_1jt', '081230300573', NULL, '2026-04-01 04:38:55', '2026-04-01 04:38:55'),
(168, 69, 'ibu', 'Rully Hayani', '6472065012780006', '1978-12-10', 1, 'sma', 'wirausaha', 'kurang_500rb', NULL, NULL, '2026-04-01 04:38:55', '2026-04-01 04:38:55'),
(171, 73, 'ayah', 'Sainuddin', '6402051108800002', '1980-08-11', 1, 'sd', 'Buruh harian lepas', '500rb_1jt', '081345560670', NULL, '2026-04-01 05:23:06', '2026-04-01 05:23:06'),
(172, 73, 'ibu', 'ROSNENI', '6402054505880002', '1988-05-05', 1, 'sma', 'Ibu rumah tangga', 'tidak_berpenghasilan', '082254399205', NULL, '2026-04-01 05:23:06', '2026-04-01 05:23:06'),
(173, 54, 'ayah', 'saharuddin', '6472032102860003', '1986-02-21', 1, 'sma', 'swasta', '2jt_3jt', '081251183186', NULL, '2026-04-01 06:33:57', '2026-04-01 06:33:57'),
(174, 54, 'ibu', 'Fatimah', '6472034211810009', '1981-11-02', 1, 'sd', 'ibu rumah tangga', 'tidak_berpenghasilan', '085394879989', NULL, '2026-04-01 06:33:57', '2026-04-01 06:33:57'),
(177, 143, 'ayah', 'Hammad', '6402040103730003', '1973-03-01', 1, 'd4_s1', 'wiraswasta', 'lebih_5jt', '081384371783', NULL, '2026-04-01 07:15:15', '2026-04-01 07:15:15'),
(178, 143, 'ibu', 'Marwiyah M', '6402044112700004', '1970-12-01', 1, 'd4_s1', 'PNS', '3jt_5jt', '082158169648', NULL, '2026-04-01 07:15:15', '2026-04-01 07:15:15'),
(185, 68, 'ayah', 'DARWO', '3315070204760005', '1976-04-02', 1, 'sd', 'KARYAWAN SWASTA', '3jt_5jt', '081325189538', NULL, '2026-04-01 21:26:39', '2026-04-01 21:26:39'),
(186, 68, 'ibu', 'SUMYATUN', '3315074801620001', '1982-04-08', 1, 'sd', 'USTADZAH/MUBALIGH', '1jt_2jt', '081250233901', NULL, '2026-04-01 21:26:39', '2026-04-01 21:26:39'),
(187, 82, 'ayah', 'ASPIANTO', '6472043010730003', '1975-10-30', 1, 'sma', 'Karyawan Swasta', '2jt_3jt', '+62 851-1705-5917', NULL, '2026-04-01 21:40:44', '2026-04-01 21:40:44'),
(188, 82, 'ibu', 'SRI UTAMI SARI DEWI SULISTIAWATI', '6472044210770004', '1977-10-02', 1, 'sma', 'IRT', 'tidak_berpenghasilan', '082157053716', NULL, '2026-04-01 21:40:44', '2026-04-01 21:40:44'),
(189, 58, 'ayah', 'Alm. Suhardi', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-01 21:58:20', '2026-04-01 21:58:20'),
(190, 58, 'ibu', 'Sunarsih', '640202510870002', '1970-11-08', 1, 'sma', 'IRT', NULL, '082250506420', NULL, '2026-04-01 21:58:20', '2026-04-01 21:58:20'),
(191, 157, 'ayah', 'Edi Susanto', NULL, NULL, 1, 'smp', 'Wiraswasta', '500rb_1jt', NULL, NULL, '2026-04-01 22:08:13', '2026-04-01 22:08:13'),
(192, 157, 'ibu', 'Tatik', NULL, NULL, 1, 'sd', 'Ibu Rumah tangga', 'tidak_berpenghasilan', NULL, NULL, '2026-04-01 22:08:13', '2026-04-01 22:08:13'),
(193, 86, 'ayah', 'Muhammad Munif', '6472030501710005', '1971-01-05', 1, 'sma', 'Pedagang', '2jt_3jt', '083155337030', NULL, '2026-04-01 22:21:30', '2026-04-01 22:21:30'),
(194, 86, 'ibu', 'Sulistiowati', '6472036001760002', '1976-01-20', 1, 'sma', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '085391275840', NULL, '2026-04-01 22:21:30', '2026-04-01 22:21:30'),
(195, 9, 'ayah', 'Jumadil Thoeah', NULL, '1986-05-12', 1, 'd4_s1', 'swasta', '2jt_3jt', NULL, NULL, '2026-04-01 23:19:41', '2026-04-01 23:19:41'),
(196, 9, 'ibu', 'Ranto Yuni Muliyana', NULL, '1987-06-01', 1, 'd4_s1', 'ibu rumah tangga', 'tidak_berpenghasilan', '+62 895-0942-4144', NULL, '2026-04-01 23:19:41', '2026-04-01 23:19:41'),
(201, 152, 'ayah', 'Muchammad Arjudin', '3674036604770007', '1974-11-13', 1, 'sma', 'Tidak Bekerja', NULL, '0812-1933-6105', NULL, '2026-04-02 06:06:50', '2026-04-02 06:06:50'),
(202, 152, 'ibu', 'Kurniasih', '3674036604770007', '1977-04-26', 1, 'd3', 'Ibu Rumah Tangga', NULL, '0858-9238-6887', NULL, '2026-04-02 06:06:50', '2026-04-02 06:06:50'),
(205, 171, 'ayah', 'RAHMAD HIDAYAT', '6472050512780002', '1978-12-05', 1, 'sd', 'SATPAM', '2jt_3jt', '085750269166', NULL, '2026-04-02 19:40:26', '2026-04-02 19:40:26'),
(206, 171, 'ibu', 'HUSSAIMAH', '6472054606830007', '1983-06-06', 1, 'sma', 'WIRASWASTA', NULL, '083867443539', NULL, '2026-04-02 19:40:26', '2026-04-02 19:40:26'),
(211, 167, 'ayah', 'ZULKiFLI', '6472101010690002', '1969-10-10', 1, 'sma', 'wakar', '500rb_1jt', '085249027875', NULL, '2026-04-05 20:45:40', '2026-04-05 20:45:40'),
(212, 167, 'ibu', 'NOR AINAH', '6472107012730001', '1973-12-30', 1, 'sma', 'guru TK', 'kurang_500rb', '085249027875', NULL, '2026-04-05 20:45:40', '2026-04-05 20:45:40'),
(213, 35, 'ayah', 'Syafi\'i', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-06 06:04:40', '2026-04-06 06:04:40'),
(214, 35, 'ibu', 'Salasiah', '6472064711690002', '1969-11-07', 1, 'smp', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '081352724641', NULL, '2026-04-06 06:04:40', '2026-04-06 06:04:40'),
(217, 160, 'ayah', 'IRWAN', '6472010212730001', '1973-12-02', 1, 'sma', 'KARYAWAN SWASTA', '3jt_5jt', '082154681632', NULL, '2026-04-06 20:48:34', '2026-04-06 20:48:34'),
(218, 160, 'ibu', 'MULYATI', '6472066708740002', '1974-08-27', 1, 'sma', 'IRT', NULL, '081254632226', NULL, '2026-04-06 20:48:34', '2026-04-06 20:48:34'),
(221, 42, 'ayah', 'SYAMSU', '6472021505700005', '1970-05-15', 1, 'sd', 'KARYAWAN SWASTA', '2jt_3jt', '089690274920', NULL, '2026-04-07 03:10:13', '2026-04-07 03:10:13'),
(222, 42, 'ibu', 'FITRI', '6472026003720002', '1972-03-20', 1, 'sd', 'IRT', NULL, '085250809019', NULL, '2026-04-07 03:10:13', '2026-04-07 03:10:13'),
(229, 186, 'ayah', 'MANSYAH', NULL, NULL, 1, 'tidak_sekolah', 'Wirausaha', '2jt_3jt', '+62 822-5218-2521', NULL, '2026-04-09 00:22:17', '2026-04-09 00:22:17'),
(230, 186, 'ibu', 'JUMIATUL', NULL, NULL, 1, 'sd', 'Ibu rumah Tangga', 'tidak_berpenghasilan', '+62 853-4802-2372', NULL, '2026-04-09 00:22:17', '2026-04-09 00:22:17'),
(231, 186, 'wali', 'Siti Hadijah', NULL, '1999-03-18', 1, 'sma', 'Ibu rumah tangga', 'tidak_berpenghasilan', '+62 852-4623-7112', 'Jln Padat Karya Gang Rambai RT.032, Kelurahan Handil bakti Kecamatan Palaran Kota Samarinda', '2026-04-09 00:22:17', '2026-04-09 00:22:17'),
(234, 16, 'ayah', 'Agus', '6472022708770002', '1977-08-27', 1, 'sma', 'Swasta', '2jt_3jt', '082251863074', NULL, '2026-04-09 22:34:20', '2026-04-09 22:34:20'),
(235, 16, 'ibu', 'Vivi Fitriyani', '6409015106810001', '1984-10-04', 1, 'sd', 'PPTH DLH', '2jt_3jt', '082254162422', NULL, '2026-04-09 22:34:20', '2026-04-09 22:34:20'),
(238, 195, 'ayah', 'Ferli Rahmani', '6472062712760003', '1976-12-27', 1, 'sma', 'WIRASWASTA', '500rb_1jt', '082149906866', NULL, '2026-04-12 23:34:14', '2026-04-12 23:34:14'),
(239, 195, 'ibu', 'Nur Aisyah', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-12 23:34:14', '2026-04-12 23:34:14'),
(242, 196, 'ayah', 'Askar Saputra', '6406050101800003', NULL, 1, 'sma', 'ASN', '1jt_2jt', '081347308268', NULL, '2026-04-12 23:55:16', '2026-04-12 23:55:16'),
(243, 196, 'ibu', 'Lisa Karmila', '6407056711770001', NULL, 1, 'sma', 'ASN', '1jt_2jt', '081347572476', NULL, '2026-04-12 23:55:16', '2026-04-12 23:55:16'),
(244, 21, 'ayah', 'Nurdin', '6472011505770006', '1979-07-12', 1, 'tidak_sekolah', 'Buruh harian lepas', '500rb_1jt', '085268300585', NULL, '2026-04-13 23:02:15', '2026-04-13 23:02:15'),
(245, 21, 'ibu', 'Irmawati', '6472016012840002', '1984-12-20', 1, 'tidak_sekolah', 'Ibu rumah tangga', 'tidak_berpenghasilan', '085656740210', NULL, '2026-04-13 23:02:15', '2026-04-13 23:02:15'),
(248, 204, 'ayah', 'Adriansyah', '6472021410750005', '1975-10-10', 1, 'sma', 'Karyawan', '1jt_2jt', '081222225249', NULL, '2026-04-15 20:03:53', '2026-04-15 20:03:53'),
(249, 204, 'ibu', 'Nursidah', '6472024308800009', '1980-08-03', 1, 'd3', 'IRT', NULL, '081349377326', NULL, '2026-04-15 20:03:53', '2026-04-15 20:03:53'),
(252, 208, 'ayah', 'Imansyah', '647206101067006', '1967-10-10', 1, 'sma', 'Tidak Bekerja', NULL, '+62 852-4634-4767', NULL, '2026-04-17 00:09:17', '2026-04-17 00:09:17'),
(253, 208, 'ibu', 'Noor Sehan', '6472066307720004', '1972-07-23', 1, 'd4_s1', 'Guru TK', NULL, '+62 852-4684-5095', NULL, '2026-04-17 00:09:17', '2026-04-17 00:09:17'),
(254, 209, 'ayah', 'Joko Pramono', '6402161007740003', '1974-07-10', 1, 'sd', 'Swasta', '1jt_2jt', '085828347023', NULL, '2026-04-17 01:25:00', '2026-04-17 01:25:00'),
(255, 209, 'ibu', 'Giyanti', '6402165408770002', '1977-02-14', 1, 'sma', 'IRT', NULL, '085828347023', NULL, '2026-04-17 01:25:00', '2026-04-17 01:25:00'),
(256, 210, 'ayah', '-', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2026-04-17 02:08:14', '2026-04-17 02:08:14'),
(257, 210, 'ibu', 'Aminah', '6472054312720003', '1972-12-13', 1, 'sd', 'IRT', 'kurang_500rb', '081907407453', NULL, '2026-04-17 02:08:14', '2026-04-17 02:08:14'),
(260, 211, 'ayah', 'Hardi Gunawan Manoppo', NULL, NULL, 1, 'sma', NULL, NULL, '0821-5422-3727', NULL, '2026-04-18 00:15:39', '2026-04-18 00:15:39'),
(261, 211, 'ibu', 'Vavorita Rahman', '6402144510690001', '1969-10-05', 1, 'd4_s1', 'IRT', NULL, '0823-5748-2066', NULL, '2026-04-18 00:15:39', '2026-04-18 00:15:39'),
(262, 206, 'ayah', 'ismit', NULL, NULL, 0, 'sd', NULL, NULL, NULL, NULL, '2026-04-18 21:29:49', '2026-04-18 21:29:49'),
(263, 206, 'ibu', 'saidah', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-04-18 21:29:49', '2026-04-18 21:29:49'),
(270, 96, 'ayah', 'ABDAI', '6472022810710001', '1971-10-28', 1, 'smp', 'KARYAWAN SWASTA', '500rb_1jt', '082149243303', NULL, '2026-04-19 21:01:12', '2026-04-19 21:01:12'),
(271, 96, 'ibu', 'JUSNAINI', '6472025808720001', '1971-08-18', 1, 'sd', 'IRT', NULL, '082149243303', NULL, '2026-04-19 21:01:12', '2026-04-19 21:01:12'),
(274, 224, 'ayah', 'Juni ar janu', '6472021206660002', '1966-06-12', 1, 'sma', 'Buruh', '1jt_2jt', '+62 852-4650-2911', NULL, '2026-04-22 01:16:56', '2026-04-22 01:16:56'),
(275, 224, 'ibu', 'Sapinah', '6472024202750010', '1975-02-02', 1, 'smp', 'IRT', NULL, NULL, NULL, '2026-04-22 01:16:56', '2026-04-22 01:16:56'),
(282, 223, 'ayah', 'Supriyatno', '6471040202790002', '1980-05-19', 1, 'sd', 'Buruh harian lepas', '1jt_2jt', '087789266460', NULL, '2026-04-22 02:04:46', '2026-04-22 02:04:46'),
(283, 223, 'ibu', 'Soesanty', '6471046805820001', '1982-05-28', 1, 'sma', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '0895393011898', NULL, '2026-04-22 02:04:46', '2026-04-22 02:04:46'),
(284, 169, 'ayah', 'ARMIN FANE', '6472020203760006', NULL, 0, 'sd', NULL, NULL, NULL, NULL, '2026-04-23 00:55:20', '2026-04-23 00:55:20'),
(285, 169, 'ibu', 'RIF\'AH', '6472024203760006', '1976-03-02', 1, NULL, NULL, NULL, NULL, NULL, '2026-04-23 00:55:20', '2026-04-23 00:55:20'),
(288, 207, 'ayah', 'Suhaimi', '6472030110630002', '1963-10-01', 1, 'sma', 'Pensiunan', '2jt_3jt', '082251367557', NULL, '2026-04-23 03:26:23', '2026-04-23 03:26:23'),
(289, 207, 'ibu', 'Yuliani', '647203640172', '1976-01-24', 1, 'smp', 'IRT', 'kurang_500rb', '081350305536', NULL, '2026-04-23 03:26:23', '2026-04-23 03:26:23'),
(290, 189, 'ayah', 'MAHFUD', '6402142808830004', '1983-08-28', 1, 'smp', 'Nelayan', '2jt_3jt', '085247331717', NULL, '2026-04-23 04:07:05', '2026-04-23 04:07:05'),
(291, 189, 'ibu', 'ROSITA', '6402145005840002', '1984-05-10', 1, 'sd', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '082352420359', NULL, '2026-04-23 04:07:05', '2026-04-23 04:07:05'),
(294, 127, 'ayah', 'Syahrani', '6402110707650002', '1973-07-07', 1, 'sd', 'Petani/Pekebun', 'kurang_500rb', '085752046873', NULL, '2026-04-24 04:04:42', '2026-04-24 04:04:42'),
(295, 127, 'ibu', 'Hasiyah', '6402116005800001', '1980-05-20', 1, 'sma', 'Mengurus rumah tangga', NULL, '085787915493', NULL, '2026-04-24 04:04:42', '2026-04-24 04:04:42'),
(296, 239, 'ayah', 'AHMAD BUDIONO', '6472050101830009', '1983-01-01', 1, 'smp', 'PETANI/PEKEBUN', '3jt_5jt', '081335044333', NULL, '2026-04-24 05:25:41', '2026-04-24 05:25:41'),
(297, 239, 'ibu', 'SRI MURNI SULASTRI', '6472035107860001', '1986-07-11', 1, 'sma', 'IRT', NULL, '081335044222', NULL, '2026-04-24 05:25:41', '2026-04-24 05:25:41'),
(298, 240, 'ayah', 'S𝙪𝙗𝙖𝙞𝙧𝙞', '6402162501880002', '1988-01-25', 1, 'sd', '𝙠𝙖𝙧𝙮𝙖𝙬𝙖𝙣 𝙨𝙬𝙖𝙨𝙩𝙖', '1jt_2jt', '+62 812-5632-2929', NULL, '2026-04-24 05:53:59', '2026-04-24 05:53:59'),
(299, 240, 'ibu', 'Y𝙪𝙡𝙞𝙖𝙩𝙞', '6472055301880003', '1991-01-13', 1, 'sd', 'IRT', 'kurang_500rb', '+62 813-4663-9603', NULL, '2026-04-24 05:53:59', '2026-04-24 05:53:59'),
(300, 241, 'ayah', 'Suandi', '6402162110790001', '1974-10-21', 1, 'smp', 'Petani/pekebun', '2jt_3jt', '081345930332', NULL, '2026-04-24 06:22:09', '2026-04-24 06:22:09'),
(301, 241, 'ibu', 'Waginah', '6402164103770003', '1977-03-01', 1, 'smp', 'IRT', NULL, '085249890088', NULL, '2026-04-24 06:22:09', '2026-04-24 06:22:09'),
(304, 249, 'ayah', 'Dugo Prayugo', '1571061808750021', '1975-08-18', 1, 'd3', 'Wiraswasta', '3jt_5jt', '0821 5574 7205', NULL, '2026-04-27 23:32:52', '2026-04-27 23:32:52'),
(305, 249, 'ibu', 'Nur Hikmah', '1571066703870001', '1987-03-27', 1, 'sma', 'IRT', NULL, '085266113086', NULL, '2026-04-27 23:32:52', '2026-04-27 23:32:52'),
(308, 252, 'ayah', 'IQBAL', '6408110403750002', '1975-03-04', 1, 'sma', 'PETANI', NULL, '0852-4642-3530', NULL, '2026-04-28 00:42:40', '2026-04-28 00:42:40'),
(309, 252, 'ibu', 'FITRIA SANTI', '6408114611840002', '1984-11-06', 1, 'smp', 'IRT', NULL, '0812-9889-2583', NULL, '2026-04-28 00:42:40', '2026-04-28 00:42:40'),
(310, 145, 'ayah', 'Tri Wisnu Prabowo', '6408021211800007', '1980-11-12', 1, 'sma', 'Pegawai Swasta', '3jt_5jt', '082254603459', NULL, '2026-04-28 01:05:49', '2026-04-28 01:05:49'),
(311, 145, 'ibu', 'Erna Kurniasih', '6408024207920002', '1992-07-02', 1, 'sd', 'Tidak Bekerja', 'tidak_berpenghasilan', '081717618889', NULL, '2026-04-28 01:05:49', '2026-04-28 01:05:49'),
(316, 185, 'ayah', 'ARBAIN', '6472091502720001', '1972-02-15', 1, 'sma', 'PNS', '3jt_5jt', '081258466414', NULL, '2026-04-28 18:52:56', '2026-04-28 18:52:56'),
(317, 185, 'ibu', 'RENITA PAKAYA', '6472096609760001', '1976-09-26', 1, 'sma', 'Ibu rumah tangga', 'kurang_500rb', '081258466414', NULL, '2026-04-28 18:52:56', '2026-04-28 18:52:56'),
(318, 203, 'ayah', 'Sumarwanto', '647203280270004', '1970-02-28', 1, 'sma', 'Wiraswasta', '1jt_2jt', '+62 813-4635-3399', NULL, '2026-04-28 19:05:37', '2026-04-28 19:05:37'),
(319, 203, 'ibu', 'Sari', '6472035507730009', '1973-07-15', 1, 'sma', 'Ibu Rumah Tangga', 'tidak_berpenghasilan', '082149101059', NULL, '2026-04-28 19:05:37', '2026-04-28 19:05:37'),
(325, 122, 'ayah', 'MUHAMMAD YATENO', '6472011912820001', '1982-12-19', 1, 'smp', 'Swasta', '2jt_3jt', '+62 895-8095-45522', NULL, '2026-04-29 00:21:53', '2026-04-29 00:21:53'),
(326, 122, 'ibu', 'SUSI LIAWATI', '6472011921282000', '1986-02-02', 1, 'smp', 'IRT', NULL, '+62 821-5682-2592', NULL, '2026-04-29 00:21:53', '2026-04-29 00:21:53'),
(327, 94, 'ayah', 'Sumarjan', '6402031904830002', NULL, 1, 'smp', 'Buruh Harian lepas', NULL, '085349617699', NULL, '2026-04-29 00:40:18', '2026-04-29 00:40:18'),
(328, 94, 'ibu', 'Hasnidar', '6402036705840003', NULL, 1, 'sd', NULL, NULL, '085349617699', NULL, '2026-04-29 00:40:18', '2026-04-29 00:40:18'),
(329, 11, 'ayah', 'Ali Zaini', '6402051808790004', '1979-08-18', 1, 'sma', 'Satpam', '2jt_3jt', '6285754605010', NULL, '2026-04-29 05:55:00', '2026-04-29 05:55:00'),
(330, 11, 'ibu', 'Nurul laili', '6472066810820003', '1982-10-28', 1, 'sma', 'Ibu rumah tangga', 'tidak_berpenghasilan', '6285349347311', NULL, '2026-04-29 05:55:00', '2026-04-29 05:55:00'),
(331, 11, 'wali', 'Rinda Handayani', '6472034206860005', '1986-06-02', 1, 'd4_s1', 'Ibu rumah tangga', 'tidak_berpenghasilan', '087710196166', 'Jalan KS Tubun dalam gang wiratirta', '2026-04-29 05:55:00', '2026-04-29 05:55:00'),
(332, 233, 'ayah', 'Kuswanto', '647201010876003', '1976-08-01', 1, 'sma', 'Swasta', '2jt_3jt', '081779538213', NULL, '2026-04-29 07:29:54', '2026-04-29 07:29:54'),
(333, 233, 'ibu', 'Jamilah', '6472015104810003', '1981-04-11', 1, 'smp', 'Ibu rumah tangga', 'tidak_berpenghasilan', '087879818423', NULL, '2026-04-29 07:29:54', '2026-04-29 07:29:54'),
(334, 170, 'ayah', 'ASRI', '640202170665003', '1965-06-17', 0, 'tidak_sekolah', NULL, NULL, NULL, NULL, '2026-04-29 17:28:24', '2026-04-29 17:28:24'),
(335, 170, 'ibu', 'NURUL', '6402025011700002', '1970-11-10', 1, 'sma', 'IRT', 'kurang_500rb', '+62 851-6363-4812', NULL, '2026-04-29 17:28:24', '2026-04-29 17:28:24'),
(336, 258, 'ayah', 'Sukardi', '6472010204830003', '1983-04-02', 1, 'sma', 'Karyawan Swasta', '3jt_5jt', '+62 857-8703-3800', NULL, '2026-04-29 18:36:39', '2026-04-29 18:36:39'),
(337, 258, 'ibu', 'Aris Susanti', '6472015101850001', '1985-01-11', 1, 'sma', 'IRT', NULL, '+62 821-5627-9356', NULL, '2026-04-29 18:36:39', '2026-04-29 18:36:39'),
(338, 260, 'ayah', 'Aspian Noor', '6472052002810005', '1981-02-20', 1, 'sma', 'Karyawan Swasta', '1jt_2jt', '+62 822-5615-5186', NULL, '2026-04-30 00:00:41', '2026-04-30 00:00:41'),
(339, 260, 'ibu', 'Nurhidayah', '6472054409830002', '1983-09-04', 1, 'smp', 'IRT', NULL, '+62 896-7700-6517', NULL, '2026-04-30 00:00:41', '2026-04-30 00:00:41');

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

--
-- Dumping data for table `student_special_needs`
--

INSERT INTO `student_special_needs` (`id`, `student_biodata_id`, `type`, `description`, `assistance_needed`, `created_at`, `updated_at`) VALUES
(1, 14, 'tidak_ada', NULL, NULL, '2026-02-11 00:06:59', '2026-02-11 00:06:59'),
(9, 111, 'tidak_ada', NULL, NULL, '2026-03-09 22:38:12', '2026-03-09 22:38:12'),
(12, 10, 'tidak_ada', NULL, NULL, '2026-03-09 23:50:41', '2026-03-09 23:50:41'),
(16, 39, 'tidak_ada', NULL, NULL, '2026-03-11 18:17:20', '2026-03-11 18:17:20'),
(17, 133, 'tidak_ada', NULL, NULL, '2026-03-11 22:41:14', '2026-03-11 22:41:14'),
(20, 125, 'tidak_ada', NULL, NULL, '2026-03-12 01:38:54', '2026-03-12 01:38:54'),
(27, 66, 'tidak_ada', NULL, NULL, '2026-03-14 01:12:28', '2026-03-14 01:12:28'),
(29, 108, 'tidak_ada', NULL, NULL, '2026-03-14 01:33:28', '2026-03-14 01:33:28'),
(30, 8, 'tidak_ada', NULL, NULL, '2026-03-14 01:45:19', '2026-03-14 01:45:19'),
(31, 26, 'tidak_ada', NULL, NULL, '2026-03-14 01:52:58', '2026-03-14 01:52:58'),
(41, 90, 'tidak_ada', NULL, NULL, '2026-03-15 18:59:35', '2026-03-15 18:59:35'),
(43, 124, 'tidak_ada', NULL, NULL, '2026-03-25 20:46:51', '2026-03-25 20:46:51'),
(44, 22, 'tidak_ada', NULL, NULL, '2026-03-25 21:26:41', '2026-03-25 21:26:41'),
(45, 83, 'tidak_ada', NULL, NULL, '2026-03-25 21:53:07', '2026-03-25 21:53:07'),
(46, 40, 'tidak_ada', NULL, NULL, '2026-03-25 21:57:27', '2026-03-25 21:57:27'),
(47, 37, 'tidak_ada', NULL, NULL, '2026-03-25 22:08:20', '2026-03-25 22:08:20'),
(48, 13, 'tidak_ada', NULL, NULL, '2026-03-27 20:34:09', '2026-03-27 20:34:09'),
(49, 95, 'tidak_ada', NULL, NULL, '2026-03-27 21:26:13', '2026-03-27 21:26:13'),
(58, 140, 'tidak_ada', NULL, NULL, '2026-03-29 06:25:38', '2026-03-29 06:25:38'),
(60, 33, 'tidak_ada', NULL, NULL, '2026-03-29 21:41:47', '2026-03-29 21:41:47'),
(63, 29, 'tidak_ada', NULL, NULL, '2026-03-29 23:02:50', '2026-03-29 23:02:50'),
(64, 119, 'tidak_ada', NULL, NULL, '2026-03-30 00:23:16', '2026-03-30 00:23:16'),
(65, 56, 'tidak_ada', NULL, NULL, '2026-03-30 01:36:30', '2026-03-30 01:36:30'),
(66, 147, 'tidak_ada', NULL, NULL, '2026-03-30 02:27:54', '2026-03-30 02:27:54'),
(67, 47, 'tidak_ada', NULL, NULL, '2026-03-30 03:23:10', '2026-03-30 03:23:10'),
(68, 89, 'tidak_ada', NULL, NULL, '2026-03-30 10:58:36', '2026-03-30 10:58:36'),
(73, 155, 'tidak_ada', NULL, NULL, '2026-03-30 22:58:51', '2026-03-30 22:58:51'),
(74, 87, 'tidak_ada', NULL, NULL, '2026-03-30 23:21:17', '2026-03-30 23:21:17'),
(76, 20, 'tidak_ada', NULL, NULL, '2026-03-31 00:27:05', '2026-03-31 00:27:05'),
(79, 41, 'tidak_ada', NULL, NULL, '2026-03-31 02:50:10', '2026-03-31 02:50:10'),
(80, 49, 'tidak_ada', NULL, NULL, '2026-04-01 00:04:03', '2026-04-01 00:04:03'),
(81, 129, 'tidak_ada', NULL, NULL, '2026-04-01 01:34:01', '2026-04-01 01:34:01'),
(84, 69, 'tidak_ada', NULL, NULL, '2026-04-01 04:38:55', '2026-04-01 04:38:55'),
(86, 73, 'tidak_ada', NULL, NULL, '2026-04-01 05:23:06', '2026-04-01 05:23:06'),
(87, 54, 'tidak_ada', NULL, NULL, '2026-04-01 06:33:57', '2026-04-01 06:33:57'),
(89, 143, 'tidak_ada', NULL, NULL, '2026-04-01 07:15:15', '2026-04-01 07:15:15'),
(93, 68, 'tidak_ada', NULL, NULL, '2026-04-01 21:26:39', '2026-04-01 21:26:39'),
(94, 82, 'tidak_ada', NULL, NULL, '2026-04-01 21:40:44', '2026-04-01 21:40:44'),
(95, 58, 'tidak_ada', NULL, NULL, '2026-04-01 21:58:20', '2026-04-01 21:58:20'),
(96, 157, 'tidak_ada', NULL, NULL, '2026-04-01 22:08:13', '2026-04-01 22:08:13'),
(97, 86, 'tidak_ada', NULL, NULL, '2026-04-01 22:21:30', '2026-04-01 22:21:30'),
(98, 9, 'tidak_ada', NULL, NULL, '2026-04-01 23:19:41', '2026-04-01 23:19:41'),
(101, 152, 'tidak_ada', NULL, NULL, '2026-04-02 06:06:50', '2026-04-02 06:06:50'),
(103, 171, 'tidak_ada', NULL, NULL, '2026-04-02 19:40:26', '2026-04-02 19:40:26'),
(106, 167, 'tidak_ada', NULL, NULL, '2026-04-05 20:45:40', '2026-04-05 20:45:40'),
(107, 35, 'tidak_ada', NULL, NULL, '2026-04-06 06:04:40', '2026-04-06 06:04:40'),
(109, 160, 'tidak_ada', NULL, NULL, '2026-04-06 20:48:34', '2026-04-06 20:48:34'),
(111, 42, 'tidak_ada', NULL, NULL, '2026-04-07 03:10:13', '2026-04-07 03:10:13'),
(114, 186, 'tidak_ada', NULL, NULL, '2026-04-09 00:22:17', '2026-04-09 00:22:17'),
(116, 16, 'tidak_ada', NULL, NULL, '2026-04-09 22:34:20', '2026-04-09 22:34:20'),
(118, 195, 'tidak_ada', NULL, NULL, '2026-04-12 23:34:14', '2026-04-12 23:34:14'),
(120, 196, 'tidak_ada', NULL, NULL, '2026-04-12 23:55:16', '2026-04-12 23:55:16'),
(121, 21, 'tidak_ada', NULL, NULL, '2026-04-13 23:02:15', '2026-04-13 23:02:15'),
(123, 204, 'tidak_ada', NULL, NULL, '2026-04-15 20:03:53', '2026-04-15 20:03:53'),
(125, 208, 'tidak_ada', NULL, NULL, '2026-04-17 00:09:17', '2026-04-17 00:09:17'),
(126, 209, 'tidak_ada', NULL, NULL, '2026-04-17 01:25:00', '2026-04-17 01:25:00'),
(127, 210, 'tidak_ada', NULL, NULL, '2026-04-17 02:08:14', '2026-04-17 02:08:14'),
(129, 211, 'tidak_ada', NULL, NULL, '2026-04-18 00:15:39', '2026-04-18 00:15:39'),
(130, 206, 'tidak_ada', NULL, NULL, '2026-04-18 21:29:49', '2026-04-18 21:29:49'),
(134, 96, 'tidak_ada', NULL, NULL, '2026-04-19 21:01:12', '2026-04-19 21:01:12'),
(136, 224, 'tidak_ada', NULL, NULL, '2026-04-22 01:16:56', '2026-04-22 01:16:56'),
(140, 223, 'tidak_ada', NULL, NULL, '2026-04-22 02:04:46', '2026-04-22 02:04:46'),
(141, 169, 'tidak_ada', NULL, NULL, '2026-04-23 00:55:20', '2026-04-23 00:55:20'),
(143, 207, 'tidak_ada', NULL, NULL, '2026-04-23 03:26:23', '2026-04-23 03:26:23'),
(144, 189, 'tidak_ada', NULL, NULL, '2026-04-23 04:07:05', '2026-04-23 04:07:05'),
(146, 127, 'tidak_ada', NULL, NULL, '2026-04-24 04:04:42', '2026-04-24 04:04:42'),
(147, 239, 'tidak_ada', NULL, NULL, '2026-04-24 05:25:41', '2026-04-24 05:25:41'),
(148, 240, 'tidak_ada', NULL, NULL, '2026-04-24 05:53:59', '2026-04-24 05:53:59'),
(149, 241, 'tidak_ada', NULL, NULL, '2026-04-24 06:22:09', '2026-04-24 06:22:09'),
(151, 249, 'tidak_ada', NULL, NULL, '2026-04-27 23:32:52', '2026-04-27 23:32:52'),
(153, 252, 'tidak_ada', NULL, NULL, '2026-04-28 00:42:40', '2026-04-28 00:42:40'),
(154, 145, 'tidak_ada', NULL, NULL, '2026-04-28 01:05:49', '2026-04-28 01:05:49'),
(157, 185, 'tidak_ada', NULL, NULL, '2026-04-28 18:52:56', '2026-04-28 18:52:56'),
(158, 203, 'tidak_ada', NULL, NULL, '2026-04-28 19:05:37', '2026-04-28 19:05:37'),
(161, 122, 'tidak_ada', NULL, NULL, '2026-04-29 00:21:53', '2026-04-29 00:21:53'),
(162, 94, 'tidak_ada', NULL, NULL, '2026-04-29 00:40:18', '2026-04-29 00:40:18'),
(163, 11, 'tidak_ada', NULL, NULL, '2026-04-29 05:55:00', '2026-04-29 05:55:00'),
(164, 233, 'tidak_ada', NULL, NULL, '2026-04-29 07:29:54', '2026-04-29 07:29:54'),
(165, 170, 'tidak_ada', NULL, NULL, '2026-04-29 17:28:24', '2026-04-29 17:28:24'),
(166, 258, 'tidak_ada', NULL, NULL, '2026-04-29 18:36:39', '2026-04-29 18:36:39'),
(167, 260, 'tidak_ada', NULL, NULL, '2026-04-30 00:00:41', '2026-04-30 00:00:41');

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
(17, 'PMB UNU KALTIM', 'pmb@unukaltim.ac.id', NULL, '-', 'staff', '2025-12-14 13:45:14', '$2y$12$fKfSBershUG375WI.ZSJu.FrBGtGB3agP8LGlaXvpjBvIfJX7UEo2', NULL, NULL, NULL, 'DzTqIMBZStEF2D6k0kkw9Ke6ToT6eBTl3fqMBHL1vhnakcmK8pUTjNNvQutu', '2025-12-14 13:45:14', '2025-12-14 22:39:48'),
(18, 'Sindiya kartika', 'sindiyakartika34@gmail.com', NULL, '085163137202', 'student', '2025-12-15 03:28:39', '$2y$12$ly4fNnBXGYPYif68qCJn1OsFLfNQAwFFbxjWxclNjJlPZ8Mc.oaaa', NULL, NULL, NULL, 'wcuBGpB64pOTc3R68Uht4GIpnvD9nk1MFeb5ndeqmt3s34S5SnN7tJUniBEI', '2025-12-15 03:25:23', '2025-12-15 03:28:39'),
(19, 'Muhammad Raihan Pratama', 'muhammadraihanpratama23@gmail.com', NULL, '081256538995', 'student', '2025-12-16 01:17:42', '$2y$12$QTkiBoYgkIIADjbrhgOk0e5fmFX66zVXg9E5KOYkaOLb/tDWswZHe', NULL, NULL, NULL, 'xWNMHhajAzlXRWX0tCgoNYQoHLxWh7rL1SfVIk0YpJF2Oi7Lr8hLBDMlp7oJ', '2025-12-16 01:16:36', '2025-12-16 01:17:42'),
(20, 'tes', 'rezamuhammad980@gmail.com', NULL, '08164500575', 'student', '2025-12-16 02:01:53', '$2y$12$2iJeAbMvrBi/GjsO7GdIvukx9ZZxkuhdsNY9ah8hQHfY7W9xxIpbi', NULL, NULL, NULL, NULL, '2025-12-16 02:01:36', '2025-12-16 02:01:53'),
(21, 'kapunkapmoi', 'rayafachreza739@gmail.com', NULL, '09990000888', 'student', '2025-12-16 02:20:45', '$2y$12$zXLs.Us0Hhuyxf1XNJ9jVuU7QLeoNv3UEdvOr2Jd4fojyiRPiTYqG', NULL, NULL, NULL, NULL, '2025-12-16 02:18:57', '2025-12-16 02:20:45'),
(22, 'IKWALUDIN IRKHAMNI', 'ikwaludini@gmail.com', NULL, '083852596613', 'student', '2025-12-16 21:59:18', '$2y$12$qU0AjNX3rssjnYXVdq1mBusUNovMgZXBAJhNcwbXaJZ2QlUsUgGyK', NULL, NULL, NULL, 'AXp1dDjn99MP9zWGEwkpn2UXxWmMpOZT5seEDoME0LC3gxgNqUV2pvcNCSRu', '2025-12-16 21:55:26', '2025-12-16 21:59:18'),
(23, 'Mouhammed Zidane Basayev Al Usman', 'zidanbasayev7@gmail.com', '260104011', '087715729215', 'student', '2025-12-16 22:31:09', '$2y$12$PW/jiamA6f1/jJMWPOacyOlxB5C59aL8p5gsdSF1fN1ojLbIaBNLq', NULL, NULL, NULL, NULL, '2025-12-16 22:30:35', '2026-04-01 23:20:26'),
(24, 'WR 2', 'wr2@unukaltim.ac.id', NULL, '080000000000', 'staff', '2025-12-16 23:38:43', '$2y$12$es48CvnMfpfsFFGnNqG7eOK3pvyXp3vxWSWFwssd0Z9.mVKGRY8u6', NULL, NULL, NULL, 'p12lWwMTtqE1MwJKGMxzYcUXdvd2WwTko4AG4ZOs5YSsSt66abgABsjZm3bj', '2025-12-16 23:38:43', '2026-02-20 21:53:51'),
(25, 'MOHAMMAD SHEVA PRATAMA SAPUTRA', 'shevapratama946@gmail.com', '260202001', '085750296152', 'student', '2025-12-17 09:24:24', '$2y$12$ctZ22aZ.AkW4e1LUDSZ5Fut2sCFUxFvWE7M9ElBnxsHYDET06exi2', NULL, NULL, NULL, 'Q3WvUjJLgZvFuubswOf6OPEBTHH85GflSI5WQ6Q3yQ8hPQ6FnZ4baAw9UMjy', '2025-12-17 09:23:33', '2026-03-09 23:51:58'),
(26, 'Emilda Ainun alzahra', 'emildaazzahra79@gmail.com', NULL, '085934592604', 'student', '2025-12-18 02:24:38', '$2y$12$gg0n0K46o47gwDxHAEOrQOUnsHYxMyVt7rX7tJhDzfo2Q0QpBUu.6', NULL, NULL, NULL, NULL, '2025-12-18 02:11:24', '2025-12-18 02:24:38'),
(27, 'rizalmulyono', 'ka.upm.feb@unpad.ac.id', NULL, '08564789632', 'student', NULL, '$2y$12$wkIx2Z4ws7.0pwYftQhXFO.f1htJ5svhwwBGfe.bX9keBq2oLrL3G', NULL, NULL, NULL, NULL, '2025-12-18 09:52:06', '2025-12-18 09:52:06'),
(28, 'Eka putri nur aisyah', 'ekaputrinuraisyah2@gmail.com', NULL, '085822516904', 'student', '2025-12-19 09:26:31', '$2y$12$ancKVQTfwEudmug3OqfB/ehWUqYbaodEvou3YRh5do.3F2xwuchHG', NULL, NULL, NULL, 'Md0y9A0z2rJmJYL7S2NMYwsYcAnKVXOSSt7Y8gFFIz8gbaOxo4yW5BA59mPN', '2025-12-19 09:25:13', '2026-03-27 20:12:39'),
(29, 'Egha Aulia Renatasari', 'eghaauliaaa@icloud.com', NULL, '082255726898', 'student', NULL, '$2y$12$Q8CXctEVlYfw8nOsVnCTqOA3p1ANSy8PGZwzmPccv56P1ySCENPg6', NULL, NULL, NULL, 'CRVlyWOWGv5CLtTj4EvS8yTsAUg0G8ahORx3rIu3YeB2YsLMiYPScD4GsGsR', '2025-12-20 03:51:03', '2025-12-20 03:51:03'),
(30, 'Egha Aulia Renatasari', 'auliaegha045@gmail.com', NULL, '082255726898', 'student', '2025-12-21 02:06:11', '$2y$12$Gbc7sHFv4KSxUSNvZura3uMXFLDq2gEscEDpA816tqkUbKbpygB/u', NULL, NULL, NULL, 'fyW6t6sCw7mGTJRPIqM1nSkXlBGb98Uj9isyQTg0DW7b4qRrTtwsSSbQd20p', '2025-12-21 02:01:51', '2025-12-21 02:06:11'),
(32, 'DHINI ALEXANDRA KUMALASARI', 'ghinaahyti03@gmail.com', '260103006', '0895 3443 22525', 'student', '2025-12-22 00:27:28', '$2y$12$eHXIrVz7IOWnXYRJhYxyAOgYCWk01vuuCrqoloJbERDGyuAJH.JZC', NULL, NULL, NULL, NULL, '2025-12-22 00:27:28', '2026-04-09 22:35:15'),
(36, 'ALVIN', 'anaksultan2708@gmail.com', '260103003', '+62 851-8498-4637', 'student', '2025-12-22 05:06:19', '$2y$12$Tei/9jSGqFMnsjBKjFjgZurCjQ.TP3GtHP4e/0TAqrG.Qg6Xenzay', NULL, NULL, NULL, NULL, '2025-12-22 05:06:19', '2026-03-31 00:30:27'),
(37, 'Dhava ade syawaluddin', 'dhavaade112@gmail.com', '260104003', '085651251219', 'student', '2025-12-23 00:39:19', '$2y$12$xPeFVtHde9NQyZq.O3Pf.u5PFebtHJtHH5l91f7NK6ZxsTJ5NSF02', NULL, NULL, NULL, 'ApyiOuzElTar6THQGnNedIGsf5xA2AzJsqAQpcSAclGuHceV75VTO6xCWDkM', '2025-12-23 00:38:18', '2026-03-25 21:27:52'),
(38, 'Nurul alfira', 'nurul.alfira048@gmail.com', NULL, '085183040894', 'student', '2025-12-23 01:11:58', '$2y$12$0p4gSqg.6dv3.XSWOmibYuHYRBTRYR6H9XI.CrqeaTFbbrl7SC/E.', NULL, NULL, NULL, NULL, '2025-12-23 01:11:13', '2025-12-23 01:11:58'),
(39, 'Nur Ayu Syafutri', 'ayusyahfutri479@gmail.com', NULL, '082154177300', 'student', '2025-12-24 02:28:11', '$2y$12$489UjJ0BAjO9p/VcK5hlCuPgIxGiP6U/0ymmxt.7gAKkaKkOfpNEq', NULL, NULL, NULL, 'AZQNnvo96q3nQtRhCZ8uErXnGArSBvmnuvQwpzfDahHM64Ni9e0MLxlt3Ujg', '2025-12-24 02:21:38', '2025-12-24 02:43:34'),
(40, 'Anita Ardian', 'anitaardian680@gmail.com', NULL, '085651337295', 'student', '2025-12-25 09:38:43', '$2y$12$wzCkco3gnhNQQHeJtG/8BO6wvL05OG4wfA7/.W/EKL/sHpTY/a6/C', NULL, NULL, NULL, NULL, '2025-12-25 09:38:20', '2025-12-25 09:38:43'),
(43, 'SILVANA TIARA ANGGRENI', 'tiaraalaaa5@gmail.com', NULL, '081549738581', 'student', '2025-12-30 08:20:05', '$2y$12$tJwWM6za8xxxdtb1Kb7uGeIx2xWu8b4jlJ7EdsTq2peA6bSEHzT4u', NULL, NULL, NULL, NULL, '2025-12-30 08:20:05', '2025-12-30 08:20:05'),
(44, 'RIDWAN', 'ridwanalbugisi686@gmail.com', NULL, '081255422011', 'student', '2025-12-30 13:12:45', '$2y$12$wALC5W1WWtIzAfAX6lFNyOUKAbeA3KujhxAiSlvqzZ7WfS8qi8aq.', NULL, NULL, NULL, NULL, '2025-12-30 13:12:45', '2025-12-30 13:15:18'),
(45, 'ABRIAN ISLAMI PERKASA.S', 'arbianperkasa27@gmail.com', NULL, '082252542337', 'student', '2026-01-04 10:11:10', '$2y$12$aGfEhQb/uwBG2uIIDA9TeeP7YaS7DxurmBfRz5SBSS2az4N5fOBdK', NULL, NULL, NULL, '60oavblXESK9OAst3VfKnzqoBcY42A4COZsQaEc2AMv0gnUZZce5r9D0E4E6', '2026-01-01 10:23:31', '2026-01-04 10:11:10'),
(46, 'ABRIAN ISLAMI PERKASA.S', 'bggusk123@gmail.com', NULL, '082252542337', 'student', NULL, '$2y$12$RYOoOu0po19IYCfVDGeO3upy9Lkhs5/FAb.IQNSomwbqT0s5fbO0.', NULL, NULL, NULL, NULL, '2026-01-01 10:27:08', '2026-01-01 10:27:08'),
(47, 'FADHILAH RAMDANIAH', 'ramdovan1215@gmail.com', '260105003', '082150207691', 'student', '2026-01-01 13:34:48', '$2y$12$uPtcmyVDXdWWSgqH4nKaeOvwafceF.jtADu64BhWKmZH8j87uMqd.', NULL, NULL, NULL, NULL, '2026-01-01 13:34:48', '2026-03-29 23:03:42'),
(49, 'ISMAIL HASAL AL - AZZAM', 'ismahariyanto@yahoo.co.id', NULL, '081522546898', 'student', '2026-01-02 08:02:40', '$2y$12$z54YLEJtz/w3/s3zfs6AMO16MMeFDkI.BB4YbtB.S4QhM33Hjbs52', NULL, NULL, NULL, NULL, '2026-01-02 07:51:43', '2026-01-02 10:06:47'),
(50, 'JULIANDA FEBRIANNUR', 'jabosawung552@gmail.com', NULL, '081255758610', 'student', '2026-01-02 15:45:30', '$2y$12$plgdJCcj.OOsFgky6d9/mO4YiX7Q3sUk39r15zeDWxOUC10.YgkdO', NULL, NULL, NULL, NULL, '2026-01-02 15:45:30', '2026-01-02 15:45:30'),
(51, 'FAUZIAH MAULIDYA', 'fauziahmaulidya22@gmail.com', '260204001', '082157598157', 'student', '2026-01-04 13:38:57', '$2y$12$czsbWSdKwh6yzbnDSTKVoOD3jm/CfYyJENRuZloRfpugskDXemEs2', NULL, NULL, NULL, NULL, '2026-01-04 13:38:57', '2026-03-29 21:42:30'),
(52, 'Jannatul aulia', 'auliajannatul731@gmail.com', NULL, '085750314922', 'student', '2026-01-05 13:10:46', '$2y$12$gpVOGOu9XjD/Nz2qAzWmBeXAPIR3Z5SsIDCfqu2jsl0VL9OhoE4ea', NULL, NULL, NULL, 'yhKAZzjMICWoo3dzFE2CAROYX1dmgidLVblSKP2T9iLFqSngMJlHsEQtDFWq', '2026-01-05 13:08:47', '2026-01-05 13:10:46'),
(53, 'Muhammad Fahmi', 'mfahmiel024@gmail.com', '260104013', '085185948789', 'student', '2026-01-05 18:11:24', '$2y$12$ySDk8WYAG3BKsmn5u8xgjOFA9v2Vfl5g6Z.36FN5qR/EklND2gRSa', NULL, NULL, NULL, 'h1hvw8vHwT7iCCEntGGp5TwDJAM2vRiCfQHKitdn2dmdzmukChHYi0o89FIe', '2026-01-05 18:06:42', '2026-04-06 20:19:34'),
(54, 'Sahrul halil', 'halilsahrul932@gmail.com', NULL, '087850933180', 'student', '2026-01-05 20:31:16', '$2y$12$3fGuXXz8f9eu06BxonG1Q.oeIVJVNGz8dteplnhJmWBZD/g/VXENS', NULL, NULL, NULL, NULL, '2026-01-05 20:30:09', '2026-01-05 20:31:16'),
(55, 'Yunitha Hapsari Hidayat', 'yunitahapsari851@gmail.com', '260103002', '083130670823', 'student', '2026-01-06 16:01:33', '$2y$12$5WGrqdyhEv44Wx/4EX9NteoQqs2BUG9ZHKq.qtUUv680VkkNvaqqS', NULL, NULL, NULL, 'TaOtyloccjfhr8S1GjdsTSoFGCmb9MfubwQvkmIEoGguDtPgO9lDNxQUuuOW', '2026-01-06 16:01:33', '2026-03-25 22:09:28'),
(56, 'M. FAUZAN DIYANTO', 'fauzanx83@gmail.com', NULL, '082255374647', 'student', '2026-01-07 00:14:43', '$2y$12$KhNGSs7iXAIsAitgF3eN3.Opb/UQC9b8rVTjaM1S/NSfnLQoQS0tS', NULL, NULL, NULL, NULL, '2026-01-07 00:14:43', '2026-01-07 00:14:43'),
(57, 'Ahmad zaini', 'a.zaini89@yahoo.com', '260104002', '081254632095', 'student', '2026-01-07 17:35:30', '$2y$12$NkO5QkUwJi2uj6a0mBL6l.7CTZsZwuhgOANKlOMknTlXg6T4CPK36', NULL, NULL, NULL, NULL, '2026-01-07 17:34:49', '2026-03-11 18:18:50'),
(58, 'HUSNI MUBARAK', 'husnimubarakcfc11@gmail.com', '260105002', '081347159070', 'student', '2026-01-09 04:06:58', '$2y$12$ZYGlP4pSAaI9kxb8nO.MVu2vQ8oWIO9/GaQIPrazM1ArgVDv2Jydq', NULL, NULL, NULL, NULL, '2026-01-09 04:06:38', '2026-03-25 21:58:16'),
(59, 'Nadya salwa maharani', 'nadiyasalwamaharani28@gmail.com', '260202005', '089526615664', 'student', '2026-01-09 18:40:31', '$2y$12$4bUDE2GIPqi6o07CsnVkiOzM.QopAKKfk5uHCrZuH2fVAvHXEqlJi', NULL, NULL, NULL, NULL, '2026-01-09 18:39:47', '2026-03-31 02:54:06'),
(60, 'Selviana rahmadani', 'selvianarahmadani08@gmail.com', '260202007', '085393356619', 'student', '2026-01-09 18:42:03', '$2y$12$rUpeaNJ9mcfc6Fuyc.Ofd.7gH2IXI9..0qol6wFJbzdW.rS324SnS', NULL, NULL, NULL, '8xwqnMNlZZpg03BokSZLvqWhcGoplb95falaCbcSVDYpG12NBDxxyujx8f4J', '2026-01-09 18:41:19', '2026-04-07 03:11:12'),
(61, 'fitra ainun bukari', 'ainunbukhorifitra@gmail.com', NULL, '085845917001', 'student', '2026-01-09 19:25:29', '$2y$12$zQBzI5pvl0oxui8wOfQ/4.uEl0GLG.6J/9Eks.Dp/KG24lNTcHxeq', NULL, NULL, NULL, NULL, '2026-01-09 19:23:19', '2026-01-09 19:25:29'),
(62, 'SHANDY BAGUS NUR RAHMAD', 'bagussandi1206@gmail.com', NULL, '087887099742', 'student', '2026-01-09 22:19:45', '$2y$12$GOPorngvp/iAAXBG.hHKjOaQukDk6.53vPUOZPSB1T4ogo6UmH5U2', NULL, NULL, NULL, NULL, '2026-01-09 22:18:57', '2026-01-09 22:19:45'),
(65, 'NUR WAFIQ AZIZAH', 'nurwafiqazizah574@gmail.com', '260204003', '082254265670', 'student', '2026-01-09 23:19:36', '$2y$12$E/MQRcqpvxiEI99P4lS55eg6afil9QA7.Bfs8e7gS9O4cOtqlJs.i', NULL, NULL, NULL, 'WDXNdhtP1IS2Gr9O9wmYjzbTZNiatGwGWTzIHtr19U5seITE0O5rHLa6pxA4', '2026-01-09 23:19:36', '2026-03-30 03:23:57'),
(66, 'Cinta', 'cnta0114@gmail.com', NULL, '085256927248', 'student', NULL, '$2y$12$SBkIQ/b8o/NxB6ZTu5HmseNsCFwhbHFuU1UyW9o8wbQw.dZhv3ZjW', NULL, NULL, NULL, NULL, '2026-01-10 00:15:38', '2026-01-10 00:15:38'),
(67, 'Cinta', 'cintaaa.13@icloud.com', '260203001', '085256927248', 'student', '2026-01-10 00:18:30', '$2y$12$XDOegRkfoTcjBEVp9ECKhuia8tq1iF7DYTUPzIzcIkZF2q6hfT0/G', NULL, NULL, NULL, NULL, '2026-01-10 00:18:08', '2026-04-01 00:04:36'),
(68, 'Desty Amanda Lukman', 'dedesshii@gmail.com', NULL, '085751529642', 'student', '2026-01-10 00:35:48', '$2y$12$HA63J8qmZKvqJu2pfwdcee.zUhyney51R.m8BMfPopJ5n5Un1HkM2', NULL, NULL, NULL, NULL, '2026-01-10 00:35:15', '2026-01-10 00:35:48'),
(69, 'Heri Purnomo', 'purr1102@gmail.com', NULL, '082260704959', 'student', '2026-01-10 01:18:27', '$2y$12$90r1ZC3tdbxUdXum8Sa3TuAn6bB7VLxTLpwtZVr5etqsn0GtBqQYq', NULL, NULL, NULL, NULL, '2026-01-10 01:17:06', '2026-01-10 01:18:27'),
(70, 'iisSetianah', 'iissetiana130982@gmail.com', NULL, '+6282155588906', 'student', NULL, '$2y$12$KFzOtM9QzK5mPDgKrHB3w.DRmhXn1qSHl3Zihwf4kSdHqJdzHyLWi', NULL, NULL, NULL, NULL, '2026-01-10 21:35:08', '2026-01-10 21:35:08'),
(71, 'Ahmad Jefri Murtadho', 'ahmadjefrimrtdh@gmail.com', NULL, '083141638159', 'student', '2026-01-11 00:24:04', '$2y$12$fQRAwZWfaagnza33pNOZvedbUHzNNMCEr/.GjrhiwcH8vqF.cQIBu', NULL, NULL, NULL, NULL, '2026-01-11 00:22:32', '2026-01-11 00:24:04'),
(72, 'Nurul Azizah Azzarah', 'nurulazizahazzarah@gmail.com', NULL, '083894783725', 'student', '2026-01-11 01:17:57', '$2y$12$i/VJITURiUGKpi.XI9mVo./FjSx0Jb/M1MK.eDD8tq1tyk.01xE3K', NULL, NULL, NULL, 'RnUtkWD3rQ44SwdkB1Sa5AbSqknAl7qYJdLjNOueB3qJIZT3Y2IkFVq328mw', '2026-01-11 01:17:05', '2026-04-01 05:57:49'),
(73, 'MUHAMMAD NANDA BASTIAN', 'nndabastian@gmail.com', NULL, '08225572279', 'student', '2026-01-11 09:47:18', '$2y$12$HBi9ZgYstx1xRKoa6iuP0uSaTEczNw1LLs2X9Na0nOlUTqhpIDdX.', NULL, NULL, NULL, 'xyUcwV8WTN73DRmwlD3F0j73yYxJTDbLPm4BNDNZZUdESimbxRt0qtqsrlW3', '2026-01-11 09:46:57', '2026-03-21 01:14:30'),
(74, 'Enggal Wrihatnolo', 'enggalw404@gmail.com', '260105004', '089654807163', 'student', '2026-01-11 17:57:47', '$2y$12$UOJwtoWl9TdEHA6M13cPxe.mpNAVzL1VDfhXOLKP8U/QQPmfnzhES', NULL, NULL, NULL, NULL, '2026-01-11 17:57:18', '2026-03-30 01:37:50'),
(75, 'Dinda Aprilly arham', 'dindaaprillya4@gmail.com', NULL, '0882022601734', 'student', '2026-01-11 19:46:12', '$2y$12$GnSojVEWodGhWn4uUIvndOLMuFjDzcnp.8f68xjm9YhsIlLuACzfy', NULL, NULL, NULL, NULL, '2026-01-11 19:45:45', '2026-01-11 19:46:12'),
(76, 'karin aprila', 'kaarinaprila@gmail.com', '260203002', '083190932564', 'student', '2026-01-11 20:07:31', '$2y$12$oH7hSmX0PI61vQHy1N7h9OjCtDw3vBo70g7OYXOLZO0kW3OXSjQLu', NULL, NULL, NULL, NULL, '2026-01-11 20:07:03', '2026-04-01 21:59:04'),
(77, 'Inzalna', 'ncece164@gmail.com', NULL, '085820766365', 'student', '2026-01-12 05:35:56', '$2y$12$A2kQFQjQlmqRcU5QrUoxBO1EQTdu/xqMehIFl5YXSIjqW3cfHElA6', NULL, NULL, NULL, NULL, '2026-01-12 05:35:10', '2026-01-12 05:35:56'),
(78, 'risna mangindara', 'mangindararisna@gmail.com', NULL, '088242026730', 'student', '2026-01-12 19:23:45', '$2y$12$0CldQfc5EVd5pI3iRHPfpOdhrpdgn2g2bA5pX7hN0Kh9WDGoZKvRS', NULL, NULL, NULL, NULL, '2026-01-12 19:22:04', '2026-01-12 19:23:45'),
(79, 'Arma Wati', 'armaw737@gmail.com', NULL, '083812754543', 'student', NULL, '$2y$12$OR4aSH/JPksOI4trVkFDSubNufVCIHOrI.gzzAtWUuakbecFk0ApK', NULL, NULL, NULL, NULL, '2026-01-13 01:42:44', '2026-01-13 01:42:44'),
(80, 'RIZKYNA RAMADHANI', 'rizkynarahmadhani@gmail.com', NULL, '085020401755', 'student', '2026-01-13 19:23:48', '$2y$12$kO098T3vTKo9xZJ47N0Q4OFL5Fx.LhzFKJ7CrBWVDl.cYPv1oOQNu', NULL, NULL, NULL, NULL, '2026-01-13 19:22:54', '2026-01-13 19:23:48'),
(81, 'Muhammad adam', 'muhammadam2801@gmail.com', NULL, '083877731362', 'student', '2026-01-14 01:57:21', '$2y$12$uU7zEv7n/Hqq87xp/L7UmOv3Ht83z9yxB50822MG9ZS.Bz6SbzRKC', NULL, NULL, NULL, NULL, '2026-01-14 01:56:59', '2026-01-14 02:03:39'),
(82, 'Iis Setianah', 'interiorbyiissetianah@gmail.com', NULL, '+6282155588906', 'student', '2026-01-14 19:36:26', '$2y$12$fTObfRuvNLVhc2jmeIJoeeCJScY.fTlbT41Bw7zIxfjdGNWA31GPy', NULL, NULL, NULL, NULL, '2026-01-14 19:35:20', '2026-01-14 19:36:26'),
(83, 'Raudah nur fauziah nisa', 'raudahnurfauziahnisa281023@gmail.com', NULL, '085820942765', 'student', '2026-01-14 22:00:55', '$2y$12$/GW2916ua7p6Aa/1p3Zj1OhZW5EK2T4OIJu8e.8snu/eQ1ankTfzm', NULL, NULL, NULL, 'NwcEp3jJ98WnjAlTbiLXmGMwsvpSOlCFnwK4lVKD1rxy0shY4K3zgo3eXI9N', '2026-01-14 21:59:43', '2026-01-14 22:00:55'),
(84, 'ANDRA SATRIANIE RASYID', 'andrasatrianie1@gmail.com', NULL, '085219460661', 'student', '2026-01-14 22:29:49', '$2y$12$QVnqDfQRuBCvms2fm4pAS.V0.9oKGMW2Vx/qilD5JgSSLqmEqf7Aq', NULL, NULL, NULL, NULL, '2026-01-14 22:29:49', '2026-01-14 22:29:49'),
(85, 'MUHAMMAD SASTRA WINANGUN', 'sastrawinangun93@gmail.com', '260104008', '08995728735', 'student', '2026-01-16 03:13:45', '$2y$12$TcM6OTB4UuP1NfHeSVykoONKxmy2ObACrJubkvll53WrSrm4C23By', NULL, NULL, NULL, NULL, '2026-01-16 03:13:04', '2026-04-01 21:27:50'),
(86, 'Muhammad Haiqal Amien', 'hiqalippy23@gmail.com', '260201001', '085158210047', 'student', '2026-01-16 09:44:13', '$2y$12$2v9uy9nXTrNVZ2Qc8vGKAOpGh/QfVrt3IkpqJAOE8/dXFX7XZ/OuC', NULL, NULL, NULL, 'IR4en30CvqamjLrf7xbyy71zpxpdqB2nfUFEWGmUuvP09c6ChcxWsLM6Cefz', '2026-01-16 09:43:52', '2026-04-01 04:39:49'),
(87, 'Muhamad Diky Tiaz', 'tiazdiky@gmail.com', NULL, '085249625921', 'student', '2026-01-19 23:09:20', '$2y$12$91EoUpjQqUN2fIctHKXcN.4oeKujcWraSf0J0veqx9eUHrZIktEVC', NULL, NULL, NULL, NULL, '2026-01-19 23:08:34', '2026-01-19 23:09:20'),
(88, 'Roykhan Na\'im', 'roykhannaim09@gmail.com', NULL, '081250361378', 'student', '2026-01-19 23:48:21', '$2y$12$iin879gehmsufmtakePJhOXNgKV.5NNh0LmYVMvcYDohL6Vyr7EkG', NULL, NULL, NULL, '23x5hnecny8gJwrboa8JgTOB18DW0vlfnne77E6hr9NH7pmOCh4l2gtaKLnB', '2026-01-19 23:47:20', '2026-01-22 07:05:20'),
(89, 'ELA AURORA', 'elaaurora2008@gmail.com', NULL, '082383064531', 'student', NULL, '$2y$12$Te7KfyDKecRsU9QjReDJo.2j4FLivV4M1YbwfDCfd33V0KK52aI42', NULL, NULL, NULL, NULL, '2026-01-20 15:12:18', '2026-01-20 15:12:18'),
(90, 'ELA AURORA', 'elaaurora0801@gmail.com', NULL, '082353064531', 'student', '2026-01-26 07:13:21', '$2y$12$jrfMwcTCHFEdQB01EOopDOFNrWJQkl7xxZb6UQlIaPLptLOR0L.1O', NULL, NULL, NULL, NULL, '2026-01-20 16:53:46', '2026-01-26 08:14:33'),
(91, 'akademik', 'akademik@unukaltim.ac.id', NULL, '-', 'staff', '2026-01-21 19:43:36', '$2y$12$bzRB0suhXfI.HJZQjcmca.cBJR0rOMb3/W6X24S5TkaSQIrK80U.i', NULL, NULL, NULL, NULL, '2026-01-21 19:43:36', '2026-01-21 19:43:36'),
(92, 'Roykhan Na\'im', 'roykhannaim9@gmail.com', NULL, '081250361378', 'student', NULL, '$2y$12$uI93qHGqOWwxsG/h0wpeDe2icpPvHQsprlaC4yo7q1jm.HCpTUeM2', NULL, NULL, NULL, NULL, '2026-01-22 06:59:05', '2026-01-22 06:59:05'),
(93, 'Farida Rachman', 'paudalfurqansamarinda@gmail.com', NULL, '081254549408', 'student', NULL, '$2y$12$ZwAac9h0CaV6j0UvDSnW1.420lBAOHJHDWZZrCJasOB/QTc09vplO', NULL, NULL, NULL, NULL, '2026-01-23 05:53:14', '2026-01-23 05:53:14'),
(94, 'Farida Rachman', 'hanifahfutuwwah@gmail.com', NULL, '081254549408', 'student', '2026-01-23 05:57:36', '$2y$12$QBFiuUB65V.OeVjy1gpK0OzsHa8PbvTA.wrecX066UFmCLu1YSrUC', NULL, NULL, NULL, NULL, '2026-01-23 05:56:36', '2026-01-23 05:57:36'),
(95, 'Kaysha Sudjono', 'kaysha.sudjono03@gmail.com', NULL, '083875525454', 'student', '2026-01-23 21:32:22', '$2y$12$OW1EReKKnIRBLArz4SEMMOAejRYdrrTIGpRUUeeVI5HKTb.a0y3rK', NULL, NULL, NULL, NULL, '2026-01-23 21:31:45', '2026-01-23 21:32:22'),
(96, 'Sayid Hamid', 'sayidhamid03@gmail.com', NULL, '081340086236', 'student', NULL, '$2y$12$ymxESxuGCGHqM61iO3yGLeT6IHI7K6PIyuhlBP0ixwElLW3HTzg5C', NULL, NULL, NULL, NULL, '2026-01-24 06:35:29', '2026-01-24 06:35:29'),
(97, 'SHANDY BAGUS NUR RAHMAD', 'paijopainem1230@gmail.com', NULL, '087887099742', 'student', '2026-01-24 07:09:31', '$2y$12$Grn.vt6fJdqg8Zx5z2J4vuvOlqAR.moJ03Q71Wv8XhWfj.b9ZqeK6', NULL, NULL, NULL, 'qtpRPeegdYi1fDfIVDQFqzwroXA5YT23UNbDChYOfXuNEfKEbiFfqqYRuKhs', '2026-01-24 07:01:28', '2026-01-24 07:09:31'),
(98, 'Shine Alif', 'shinealif16092004@gmail.com', NULL, '+62 821-8651-2251', 'student', '2026-01-24 16:52:44', '$2y$12$dyfj7sVzgdGTTjc/pABqGO64UWWFh3nk45X7pseaQ8OhgY/KzEIH2', NULL, NULL, NULL, NULL, '2026-01-24 16:51:41', '2026-01-24 16:52:44'),
(99, 'Nur Fithratinnisa', 'nfithratinnisa@gmail.com', NULL, '6281646046540', 'student', '2026-01-25 19:37:24', '$2y$12$HLxHbWQ2/xulY7gARVqRI.YhTgSNm0yJ9b8JWU/RlqnywXu3itgXi', NULL, NULL, NULL, NULL, '2026-01-25 19:34:19', '2026-01-25 19:37:24'),
(100, 'SITI AISIYAH MAURA BUNGA MEYRISKA', 'mauraariska05@gmail.com', '260103004', '082133016401', 'student', '2026-01-25 23:13:17', '$2y$12$uPjPDZVOf/aVJR2kkMzBtOsc7n2SFylCurSM52UMdA.HQqipY3bQO', NULL, NULL, NULL, NULL, '2026-01-25 23:13:17', '2026-04-01 21:41:33'),
(101, 'JOKO SIDIK PURNOMO', 'jokosidik1107@gmail.com', '260104004', '083895213895', 'student', '2026-01-26 00:57:41', '$2y$12$0ZS7p/kGf4txiFOwFkmqoutInPq0mDf7z5vglEISrFiR5eDwvtUOa', NULL, NULL, NULL, NULL, '2026-01-26 00:57:41', '2026-03-25 21:53:44'),
(102, 'ELA AURORA', 'yoyak8128@gmail.com', NULL, '082353064531', 'student', NULL, '$2y$12$lRwVlnBTsFECGhc7FTHiUeihfvoBEB610I3AMAEIso.QRNBbzY/wW', NULL, NULL, NULL, NULL, '2026-01-26 06:55:11', '2026-01-26 06:55:11'),
(103, 'Alya dwi bahli', 'alyadwiibhli@gmail.com', NULL, '083895529893', 'student', '2026-01-26 21:07:01', '$2y$12$iQUERqLdbtzMnz7rtdVf9uHo0wtk5460nZtwZsU43ERxiqaQbnrRS', NULL, NULL, NULL, 'Ll88xv5T6T9eOUyXJhUypndOQSUh24GNvsTA1FnClKmMOdZ5ha2likmZOAFw', '2026-01-26 21:07:01', '2026-02-25 16:47:13'),
(104, 'Amelia Rahma', 'rahmaamelia2205@gmail.com', '260103005', '083876857482', 'student', '2026-01-27 00:27:44', '$2y$12$S2o15GjbH9y9V9/xzhtQQ.JYq06Jbbgg3MkdahtsmXXORfOp.qOTC', NULL, NULL, NULL, NULL, '2026-01-27 00:27:44', '2026-04-01 22:24:43'),
(105, 'ATIKAH FAISA ASYARA', 'y6408087@gmail.com', '260202004', '082354922897', 'student', '2026-01-27 00:32:38', '$2y$12$co4sG3JuibmxffrK4786deJm0v4WjJtyqkfiKfYK6IKx4QRxhSZGS', NULL, NULL, NULL, NULL, '2026-01-27 00:32:38', '2026-03-31 00:28:44'),
(106, 'Imel Dayanti', 'imelda03.070@gmail.com', NULL, '081545497259', 'student', NULL, '$2y$12$5aOa69SB2I3PNBdT1Ig01.TkS0xLFeDgg3Zt8eC1YoBOm0JggKYtW', NULL, NULL, NULL, NULL, '2026-01-27 01:42:38', '2026-01-27 01:42:38'),
(107, 'DINI RAMADANI', 'diniqueenzy@gmail.com', '260104006', '082154672080', 'student', '2026-01-27 01:50:02', '$2y$12$FvhBRmpNSbrEiKSXVUkN/eFA6neEnE9W7.SE97r/9roCKxpkIKaOy', NULL, NULL, NULL, NULL, '2026-01-27 01:50:02', '2026-03-30 10:59:32'),
(108, 'Naila Nurul Amni', 'kanaladynara@gmail.com', '260103001', '081351699387', 'student', '2026-01-27 23:18:35', '$2y$12$5DbWWXOMs8Kp1AxgMEewpOXWn6Pt9AGEHfCseZ.xBun/eAoBq5gje', NULL, NULL, NULL, NULL, '2026-01-27 23:17:35', '2026-03-15 19:00:41'),
(109, 'RIZKA ANNISA', 'caaa.xakl3@gmail.com', NULL, '081313569093', 'student', '2026-01-30 05:39:54', '$2y$12$8DeRsyrk/5Ez94ps0zX.V.s2TFVn6Aqj.Rm25No/ylu5oGzkRH9Ra', NULL, NULL, NULL, NULL, '2026-01-30 05:37:57', '2026-01-30 05:39:54'),
(112, 'BUNGA PERMATASARI', 'bungapermatasari2812@gmail.com', NULL, '083849308824', 'student', '2026-02-01 21:35:04', '$2y$12$J0okIZcQWwiVRUfMx0QHLuouc8POO81uqdmlCN/XQ4KxPEMxh.bV6', NULL, NULL, NULL, NULL, '2026-02-01 21:35:04', '2026-02-01 21:35:04'),
(113, 'NURRUHAMA', 'nurruhamaakhyaruddin@gmail.com', '260202002', '081346651600', 'student', '2026-02-01 23:06:54', '$2y$12$Y11iJ.godrm2AwaoApyj2.bCUHoNlhd6EPtlWgrWcKrc0Khk.nV02', NULL, NULL, NULL, 'FqfjMwCz17nUhKG3Fz4Rv8lnogJMJx8ej9jutCnkElpMIWDk0oGmxpghDVpX', '2026-02-01 23:06:54', '2026-03-27 21:29:16'),
(114, 'MUHAMMAD BASIT MUGHNI', 'muhammadbasitmughni@gmail.com', '260105007', '085654914708', 'student', '2026-02-02 19:55:25', '$2y$12$MPllXjsmoPqeuD.FJHoM/.P9r8XTwRvby.4pr5Dyc/1LMM5JD.f0a', NULL, NULL, NULL, 'UVDs419NjPLxiu8eshYPYfJ9AeFUb2K6EQzrRAyWH4xLKlfOMeFDODXoJRQs', '2026-02-02 19:53:42', '2026-04-19 21:01:57'),
(115, 'Dyan Nata Kresna', 'dyan.natakresna@gmail.com', NULL, '085348769435', 'student', '2026-02-04 01:23:51', '$2y$12$KX2TZFlZEKx5zcsY1TsTyOB4V833r46fm1OSIIW16kWjN/3Bfa.cK', NULL, NULL, NULL, NULL, '2026-02-04 01:22:40', '2026-02-04 01:23:51'),
(116, 'MUHAMMAD HAIKAL', 'muhammadbrndon@gmail.com', NULL, '081345435107', 'student', '2026-02-05 00:08:02', '$2y$12$r2.oWpHbcsw2yzNNQNnAMulPi7NwCkzukxrY5F4WhGv1PxGvPnirW', NULL, NULL, NULL, NULL, '2026-02-05 00:08:02', '2026-02-05 00:08:02'),
(117, 'ACHMAD SETIAWAN', 'Achmadsetiawan807@gmail.com', NULL, '082191575211', 'student', '2026-02-05 00:17:29', '$2y$12$gJnbH.Lh4B2t..bQnLmDrOvN2VPhDvASbk1Hd24EJp/VcpKAUJR6u', NULL, NULL, NULL, NULL, '2026-02-05 00:17:29', '2026-02-05 00:17:29'),
(118, 'SALSABILA', 'ysalsa943@gmail.com', NULL, '081348987201', 'student', '2026-02-07 20:50:19', '$2y$12$w1FFrPbULwLVAWGb8sKDTOPEXlagN8hdCulkHWDFOOb0tk71/fPam', NULL, NULL, NULL, NULL, '2026-02-07 20:49:18', '2026-02-07 20:50:19'),
(119, 'Diki karisma', 'karismadiki92@gmail.com', NULL, '+6282195698079', 'student', NULL, '$2y$12$akFgXkNucgXbyNzcBKoyPu9iDiQCDDW/q/NSn.befy.QHU2PZAMO.', NULL, NULL, NULL, NULL, '2026-02-10 05:15:10', '2026-02-10 05:15:10'),
(120, 'Ananda Prabowo', 'bertebaran80@gmail.com', NULL, '0895390721616', 'student', '2026-02-10 06:22:57', '$2y$12$vmaM2ArV0IlZAWNS28UCC.Kw9fO4nkGBXeD8b5.QVM4SoCtxiR/n.', NULL, NULL, NULL, NULL, '2026-02-10 06:22:44', '2026-02-10 06:22:57'),
(121, 'Sumiati', 'miaamia086@gmail.com', NULL, '085250358785', 'student', '2026-02-11 03:45:00', '$2y$12$wvLdNZnAy2CEkzyz503mx.2./nv5NEAmlE87E9sNBoSljJW1Z/G0e', NULL, NULL, NULL, NULL, '2026-02-11 03:44:12', '2026-02-11 03:45:00'),
(122, 'Intan rima sari', 'intanrimasari01@gmail.com', NULL, '082214532813', 'student', '2026-02-11 07:28:37', '$2y$12$ee8GgIu85AXkSQeGJg65FOQZt2np7XVxxCHR/pGEA5PuLA/3TMlYa', NULL, NULL, NULL, '8Wvrh7b9t6SM60DqnoUnlGcUfb6gIF7yXnr8Lo0b970ZJTYplEx5tQG9CZpa', '2026-02-11 07:27:41', '2026-02-11 07:28:37'),
(123, 'Amanda Nur Rahmawati', 'nurmanda426@gmail.com', NULL, '085246209622', 'student', NULL, '$2y$12$Rz3ysIaK3Mw1gBIy6mklj.KT9FKiFVEB9L4Fm5vuEkoj2MIB4tR0e', NULL, NULL, NULL, 'n1FZ8xJ8pfh1s8alOi3YnbYrRhXcXcFWORI1Le8llfiGduRpacmGwbwEMvQP', '2026-02-12 01:45:33', '2026-02-12 01:45:33'),
(125, 'AMANDA NUR RAHMAWATI', 'nuramanda426@gmail.com', NULL, '085246289622', 'student', '2026-02-13 23:28:34', '$2y$12$tV.oS9jUwPCXQU2yL9yCCe0OMNvv6/Lf7QhWyLTorHt7F2ipS7a2i', NULL, NULL, NULL, 'DOfeiWRpqSmePH7W1nJHnmhxEu1TAsIAzcWpRCQ0mxQmHgp3PrwMyDGxM60t', '2026-02-13 23:28:34', '2026-03-12 01:16:41'),
(126, 'AHMAD ABID MAULANA', 'ahmadabid2404@gmail.com', NULL, '083854970595', 'student', '2026-02-13 23:58:38', '$2y$12$d/8I/QrQvK0GjHihOpEjE.5l8bakjnd7utXIfEztsw.BxwnNDGhQW', NULL, NULL, NULL, NULL, '2026-02-13 23:58:38', '2026-02-13 23:58:38'),
(127, 'Radiarman Sipayung', 'radi.sipayung@gmail.com', NULL, '081351994883', 'student', NULL, '$2y$12$lPz2EGtTXBtHcBN/MQqdYu9tCt4TqqKoOP2wYpjK9Bcl0aEfDAUnO', NULL, NULL, NULL, NULL, '2026-02-14 23:00:27', '2026-02-14 23:00:27'),
(128, 'Radiarman Sipayung', 'radiarman@gmail.com', NULL, '081351994883', 'student', NULL, '$2y$12$jB0klLO1dx9FpMRPPC4n9eeYeIH3GIaJi.2aGwwqrPepzkpIOyPvG', NULL, NULL, NULL, NULL, '2026-02-14 23:04:57', '2026-02-14 23:04:57'),
(129, 'Andi Kumar Purnomo', 'kumardanniar@gmail.com', '260104001', '082357172356', 'student', '2026-02-16 00:34:33', '$2y$12$h.MiStsp9VzPckOLYyj41er/PuIrDtGRaf5oRyi/K.IUldTIXIKAy', NULL, NULL, NULL, 'FTTsaNFNK14WgkCutExQzT6HtaIk89uO7vYBnY0isQuoYwBkhA6cNCuE8bbi', '2026-02-16 00:33:34', '2026-03-09 23:20:26'),
(130, 'Risqi Nur Akmala', 'nurakmalarisqi@gmail.com', NULL, '08975818944', 'student', '2026-02-17 19:41:55', '$2y$12$jBjfXwB/YBxc4Lnw8Z8LD.QjHREznj3JSpvHaRvwk2OdDYLDqzQ16', NULL, NULL, NULL, NULL, '2026-02-17 19:41:28', '2026-02-17 19:41:55'),
(131, 'Jumeidi Sakur', 'sakurjumeidi@gmail.com', NULL, '085173433591', 'student', '2026-02-21 20:01:14', '$2y$12$XpBTvNq9TDWFuBoLZbSoK.EXUtNqOVhKeKdSfnHva1f/VF3riu58y', NULL, NULL, NULL, NULL, '2026-02-21 20:00:40', '2026-02-21 20:01:14'),
(132, 'FARHAN IRFANNUDIN', 'farkhannudin61@gmail.com', NULL, '082246628608', 'student', NULL, '$2y$12$rGCckxMmWHXddc1t4iNZBuxUZPTPOqyq9q7YlxNZQHqWVuj7GYQh2', NULL, NULL, NULL, NULL, '2026-02-23 18:11:10', '2026-02-23 18:11:10'),
(133, 'FARKHAN IRFANNUDIN', 'farhannudin165@gmail.com', NULL, '082246628608', 'student', '2026-02-23 18:19:49', '$2y$12$ZqTnL/FLs0JpzTD.nPS9W.b6W2A7L6XJIN/omV7ErTySIszDsCMiq', NULL, NULL, NULL, NULL, '2026-02-23 18:18:48', '2026-02-23 18:19:49'),
(134, 'Fauzan Azima Paendong', 'paendongfauzanazima@gmail.com', NULL, '085242147026', 'student', '2026-02-25 07:53:25', '$2y$12$K8e6AxtknS6G3IaM6zkhVOTwgG3DruYW.oRcN.YzNDeY9a94HQnZC', NULL, NULL, NULL, NULL, '2026-02-25 07:53:04', '2026-02-25 07:53:25'),
(135, 'alya dwi bahli', 'alyadwiibhlii@gmail.com', NULL, '083895529893', 'student', NULL, '$2y$12$9HThg57A0xMblrfwHe7UR.bDD1xWsjAA42rw5m3G0wgtSoj7/d2zW', NULL, NULL, NULL, NULL, '2026-02-25 16:41:41', '2026-02-25 16:41:41'),
(136, 'Muhammad Rifki Fahrezi', 'fahreziraw@gmail.com', NULL, '085757637274', 'student', '2026-02-26 17:32:15', '$2y$12$Vpta5C0wAVnqAi./e8j4Zuc/E38a3wAtR7LRmxgXtuI8xOBK1zr8i', NULL, NULL, NULL, NULL, '2026-02-26 17:31:21', '2026-02-26 17:32:15'),
(137, 'FEBRI', 'febriibii@gmail.com', '260104005', '085651201489', 'student', '2026-02-26 23:10:16', '$2y$12$hCkECxajMqTtrs8lw4fDye6Azn0h3IZib1NSH.D0DqNUJciLtRpxa', NULL, NULL, NULL, NULL, '2026-02-26 23:10:16', '2026-03-30 00:23:50'),
(138, 'Nur Fitri Meryanti', 'nnurfitri677@gmail.com', NULL, '088704769147', 'student', '2026-02-27 16:36:59', '$2y$12$uUwF5Ed2Wukx9osMZPFinu7BRp0mGK.Ik3i9oaFSm2.Ts8oBMVNPe', NULL, NULL, NULL, 'rG1IkjjYbSWQZ7E6dvrHPcEauJGe8NIrAyPedN0X86UGNPekBHhRkIdGxNKB', '2026-02-27 15:33:11', '2026-02-27 17:05:23'),
(139, 'safasfasfasf', 'situskamboja@gmail.com', NULL, '081380374774', 'student', '2026-02-28 21:25:11', '$2y$12$rM4v3p7/b8oorkBAgSBEnOktnZDD0mV2VFPaht2gfOMcg8rmps9sm', NULL, NULL, NULL, NULL, '2026-02-28 21:24:50', '2026-02-28 21:25:11'),
(140, 'Akmal Maulana Firdaus', 'akmalmaulanaf28@gmail.com', NULL, '081528657569', 'student', '2026-03-01 22:41:57', '$2y$12$WQ1NN7IPQU99RZD3FT.St.HNbZ4jHLJVAfjhNrkQvfeFMZL4Onq9G', NULL, NULL, NULL, '9fONh0btLblQVdM3IOVVhrUkrQlX1qXCBWOkncPI95HVZMnHHNlUjYT6nZaK', '2026-03-01 22:41:00', '2026-04-03 22:50:16'),
(141, 'MUH FIKRAH EDHITYA PRATAMA', 'muhfikrahedityap@gmail.com', NULL, '085183028467', 'student', '2026-03-02 22:17:42', '$2y$12$LBDZ8c0VgqAasnX8Q9dt3u72ht80wJbUgMb8IAUFllRkHSkLdDnI2', NULL, NULL, NULL, 'VTd9usG6GQkvtdRicIq3J95BKDY9CWlO0lHsFovz13Eoy432gild4T1QA0qJ', '2026-03-02 22:16:57', '2026-03-02 22:17:42'),
(142, 'MUHAMMAD ISA IBRAHIM', 'mhmmdisaibrhm02@gmail.com', '260105001', '085143630768', 'student', '2026-03-03 10:10:50', '$2y$12$RmO7fA2Ulh.CxkSkdmFNieB0dyT3s7aI4/XAuldmlOPA7eWCcaTHe', NULL, NULL, NULL, NULL, '2026-03-03 10:10:27', '2026-03-25 20:47:27'),
(143, 'Stephen Tendjaya', 'stephen.tendjaya@gmail.com', NULL, '085190656169', 'student', '2026-03-03 10:53:44', '$2y$12$gCwFsfE9oh423T6yq0vh4.S/W7SQEOzSZiKhKY7MD40hf68YIKeQ6', NULL, NULL, NULL, NULL, '2026-03-03 10:53:23', '2026-03-03 10:53:44'),
(145, 'Sopiya Yeti', 'piyaaa613@gmail.com', '260203004', '085750541109', 'student', '2026-04-12 00:01:04', '$2y$12$1t3Hs/Ig6745HpSdNtnjUOIaH8aVrdzDjksef914x5neqK.VVcK8m', NULL, NULL, NULL, NULL, '2026-03-05 04:32:42', '2026-04-24 04:05:29'),
(146, 'Reynaldy', 'reynaldy3311@gmail.com', NULL, '089516480372', 'student', '2026-03-07 19:22:22', '$2y$12$L.oqMCadaD7sE49SlqncGeoDCkFhv5.EbqiUF8YUwEQI2JzbY4JKW', NULL, NULL, NULL, NULL, '2026-03-07 19:21:47', '2026-03-07 19:22:22'),
(147, 'Ananda ravi pratama', 'anandaravi06@gmail.com', NULL, '082289475774', 'student', '2026-03-09 02:44:18', '$2y$12$OPXceq2NOT1ewE2QWCVfQu5fBmBf6rLdkRj8gPUrYkt6qdTHCYPw.', NULL, NULL, NULL, 'FjF0hiSwGhSrAgAs7yx1lhHvZdN2DZymIxh9ylgTLeOAUmYha6TvvEVgvpqb', '2026-03-08 20:46:43', '2026-03-09 02:44:18'),
(148, 'BRAHMANTIO SATRIO NUGROHO', 'brahmantio156@gmail.com', NULL, '085820600297', 'student', '2026-03-09 09:08:49', '$2y$12$cTOfyxHiBGFH/2f0nY8W4uYFr4vePTxT.rKSAQ19wZcPI/O2v2.qe', NULL, NULL, NULL, NULL, '2026-03-09 09:07:51', '2026-03-09 09:08:49'),
(150, 'Muh Syamsir alam', 'msyamsiralam99@gmail.com', NULL, '08135688992', 'student', '2026-03-11 19:53:46', '$2y$12$eefQBXMwDuLO1oyCdiAAmuJPrBr4umIr4Dy4IcRQJAmXI293Cq0VS', NULL, NULL, NULL, NULL, '2026-03-11 19:53:21', '2026-03-11 19:53:46'),
(151, 'NABILA AMANDA SAPUTRI', 'nabilaamanda1204@gmail.com', NULL, '0895385977806', 'student', '2026-03-11 22:25:09', '$2y$12$aKibEa1mU04Ws1NdK5SBQuWtMlwiwVHtQsWfZPO0YvP.qkEqKfLNO', NULL, NULL, NULL, NULL, '2026-03-11 22:25:09', '2026-03-11 22:25:09'),
(152, 'Filza Aulia', 'filza.aw@gmail.com', NULL, '083852938710', 'student', '2026-03-12 14:06:20', '$2y$12$Sr65ZPb1n1dTTPcFVjF/aucz4Y/qND65NQWPWCz5lIoigZqhgB5ia', NULL, NULL, NULL, NULL, '2026-03-12 14:05:23', '2026-03-12 14:06:20'),
(153, 'muhamad anis madani', 'manismadani65@gmail.com', NULL, '082175644027', 'student', '2026-03-14 02:57:06', '$2y$12$1undyVZKmdV.YsJQo7w7gulDU8vZkrqdRrkRvKB3LZQx.IbbEFT7y', NULL, NULL, NULL, NULL, '2026-03-14 02:56:30', '2026-03-14 02:57:06'),
(154, 'Maria Nasarena Mayona Mau', 'yonamhau15@gmail.com', NULL, '081236772084', 'student', '2026-03-14 03:26:00', '$2y$12$t3gdhOrywVpq0VIgsXDVUeSLDSyC7K4Tz4YhWnpurf6ituf5cG2E.', NULL, NULL, NULL, NULL, '2026-03-14 03:24:04', '2026-03-14 03:26:00'),
(156, 'Khoirul Fatkurrohman', 'faturrahman5698@gmail.com', NULL, '087832468968', 'student', '2026-03-15 02:36:14', '$2y$12$PdFIKCONBLN6DhZMusnTB.FKCxsWUkB16GW47uXAjcdO19l7CXeR.', NULL, NULL, NULL, NULL, '2026-03-15 02:35:45', '2026-03-15 02:36:14'),
(157, 'Ghea Noviyanti Putri', 'gheanoviyantiputri@gmail.com', NULL, '082151428180', 'student', '2026-03-15 03:15:07', '$2y$12$CsjfQMOqG7l8i4H0Kt9PqO3PrvFpz.3rofvy15vEPe57MmDTdJJpO', NULL, NULL, NULL, NULL, '2026-03-15 03:11:04', '2026-03-15 03:15:07'),
(158, 'Agus Hatmiazis', 'alhafidz110698@gmail.com', '260202003', '082252289414', 'student', '2026-03-15 04:06:03', '$2y$12$UOFIclQ5se/x0Hesycu3S.6YSEt4PYIcaNbzdZb2XuzxlS9Srl6F.', NULL, NULL, NULL, NULL, '2026-03-15 04:05:30', '2026-03-29 20:27:49'),
(161, 'Fadillah ahmad', 'fadillahahmad1999@gmail.com', '260104009', '082197939452', 'student', '2026-03-22 22:44:03', '$2y$12$w6liV0iDA7cX1XJB4cswwOZ/LJBtCw46f.zFOfRS/QuJFn/jki.XG', NULL, NULL, NULL, NULL, '2026-03-22 22:43:19', '2026-04-01 21:47:07'),
(162, 'Agil Gawri Widianto', 'nosu22596@gmail.com', NULL, '082337875417', 'student', '2026-03-23 19:13:32', '$2y$12$7fzKap9QKHqggypbf7o2CuD5oY7iFLEeLoB64zZU9BXl3o.W32N9W', NULL, NULL, NULL, NULL, '2026-03-23 19:12:39', '2026-03-23 19:13:32'),
(163, 'Dimas Muhammad Abdul Joni', 'dimasmuhammad1222@gmail.com', '260104016', '+6281717618889', 'student', '2026-03-24 18:43:24', '$2y$12$ob2gHvDrrY5umY6fmLPwN.nZPXazIbHg7HFoLWmxSrRKtH1C/38Q.', NULL, NULL, NULL, 'xL2OWVZwWDOojVmnALhneDXsJArxsVkomoxprpxgxLPsdWg1RgSMDJpZV2Gb', '2026-03-24 18:42:47', '2026-04-28 01:06:28'),
(164, 'MUH RAFLI', 'muhrafli24agustus@gmail.com', NULL, '085820617409', 'student', NULL, '$2y$12$vgTFPK2VeqgGdGq9Z1GlXO4/4zErMfe8V8gnFUFPJiNgYqV01trcW', NULL, NULL, NULL, NULL, '2026-03-25 18:33:58', '2026-03-25 18:33:58'),
(165, 'Mirna', 'mirnaaanr@gmail.com', '260204002', '085249669700', 'student', '2026-03-25 20:24:37', '$2y$12$6XQmsDf2GttBf5HnRUuCreopDAGO33R6LmwnbiCkDzCZ.xvj3rEEe', NULL, NULL, NULL, 'gEU5dLcMNxozllEfXQINmaFJMfO6FegFOdUNx7pABrXKqNkWUDTaN37NtdTr', '2026-03-25 20:23:51', '2026-03-30 02:29:54'),
(166, 'Dava Allzarian Siregar', 'davaalzarian@gmail.com', NULL, '089521661016', 'student', '2026-03-26 00:11:23', '$2y$12$nHpd0kvDzau2rQPNbMM3NeOWNl01u4y0dBeapTdIXXl8qrDKGZw5y', NULL, NULL, NULL, NULL, '2026-03-26 00:10:49', '2026-03-26 00:11:23'),
(167, 'Syiam safitriyani', 'syiamsafitriyani6@gmail.com', NULL, '082141748045', 'student', '2026-03-26 20:46:33', '$2y$12$qaKm4ts9IjobRMpyrrkgOuboz9YBHRbMnwPDAfp6t7tsAD4VqScbS', NULL, NULL, NULL, NULL, '2026-03-26 20:44:48', '2026-03-26 20:46:33'),
(168, 'Rayendra Andrew Winata', 'diahwiwieth30@gmail.com', NULL, '081258565949', 'student', '2026-03-27 02:32:39', '$2y$12$stXtNw/7It.lA4.d8aOhmuiDuKk1NU1s1HpQjDSInmTqlqx0DXsNe', NULL, NULL, NULL, NULL, '2026-03-27 02:31:06', '2026-03-27 02:32:39'),
(169, 'Nur Zahwa Ai\'nun Naya', 'zahwa6309@gmail.com', NULL, '083874710003', 'student', NULL, '$2y$12$yMbKW7WJK121y/MCvy8p2.SP0XiHMc5Ix4yvw.vFGspe/b8nUGqEi', NULL, NULL, NULL, NULL, '2026-03-27 05:44:07', '2026-03-27 05:44:07'),
(170, 'Muhammad Albar Arafii', 'muahammadalbar94@gmail.com', '260104012', '0895333961155', 'student', '2026-03-27 22:49:09', '$2y$12$6mh64pD.PoKOshZkZzbEeuQXknwouAjgosqf3p3cWFxyZ25cJFZga', NULL, NULL, NULL, NULL, '2026-03-27 22:49:09', '2026-04-02 17:34:41'),
(171, 'Nur Zahwa Ai\'nun Naya', 'nurzahwa2402@gmail.com', NULL, '083874710003', 'student', '2026-03-28 02:11:42', '$2y$12$wR6PMnL6mbirNhhLh5L7HukbxsqvbEjnHikZedw00UaXuBIBnuaru', NULL, NULL, NULL, NULL, '2026-03-28 02:08:45', '2026-03-28 02:11:42'),
(173, 'M. IDRUS', 'm.idrusrahman@gmail.com', '260104007', '082231003854', 'student', '2026-03-28 04:34:06', '$2y$12$O3PD17EA.nGT7CF1uCYWVechSC2.RmBsj2ZQpZIS7rxxQxbOwK1Nq', NULL, NULL, NULL, NULL, '2026-03-28 04:34:06', '2026-03-30 23:10:01'),
(174, 'Nahza Sabila', 'sabilanahza360@gmail.com', NULL, '087822892160', 'student', NULL, '$2y$12$wJOh0yVMIcD1B7dXa/nc4.qWWvliPHt4ua6fGne7RDEbp7auTZrM2', NULL, NULL, NULL, NULL, '2026-03-28 21:05:53', '2026-03-28 21:05:53'),
(175, 'Nia Susanti', 'niasusanti2006@gmail.com', '260104010', '082211387172', 'student', '2026-03-29 06:13:29', '$2y$12$/NyVd9CDC3YOuEC/OD4d0e38v2J76tRNleugNkZfqAkX7BZlzFjfO', NULL, NULL, NULL, NULL, '2026-03-29 06:12:12', '2026-04-01 22:09:07'),
(176, 'ALBAR', 'aalbar025@gmail.com', NULL, '082157716374', 'student', '2026-03-29 07:00:52', '$2y$12$UwkHlFRF6mygL7DIz5B6Y.xoJHy/ysNdjyS77XvegbvbyedahGY.q', NULL, NULL, NULL, NULL, '2026-03-29 07:00:08', '2026-03-29 07:00:52'),
(177, 'Fauziah Maulidya', 'fauziahmaulidya8@gmail.com', NULL, '082157598157', 'student', '2026-03-29 07:34:38', '$2y$12$Ek9PfAUbn7CZOuHlHzCstuI3jm./SGF6QnO319.Jrg8im1Tn.CwEu', NULL, NULL, NULL, NULL, '2026-03-29 07:33:23', '2026-03-29 07:34:38'),
(178, 'DEAVANDRA FAROUK ADITYA', 'whatfaruk11@gmail.com', '260202006', '085828030253', 'student', '2026-03-30 04:20:30', '$2y$12$P0cdxJsAEiluG1RZ2Ne0Quy0WLFzbRxb0UCnsgSLD19UseydFGSXO', NULL, NULL, NULL, NULL, '2026-03-30 04:20:04', '2026-04-06 20:49:12'),
(179, 'Dini Ramadani', 'jisoo.x1.army@gmail.com', NULL, '082154672080', 'student', '2026-03-31 00:58:00', '$2y$12$mt1W61PtfL96G3ImxTrPjuf8ktQW1nnUO16ZzFMzNwqpiSbajrIA.', NULL, NULL, NULL, NULL, '2026-03-31 00:57:15', '2026-03-31 00:58:00'),
(180, 'SAHLEVI', 'sahlevi17@gmail.com', NULL, '085246692548', 'student', '2026-03-31 01:33:17', '$2y$12$lqbKPSNoEGgeUZWCibSM6u4cHh6BVZVi0/IfucVOlnHBreJFjFCv.', NULL, NULL, NULL, NULL, '2026-03-31 01:33:17', '2026-03-31 01:33:17'),
(181, 'Lujay Khan', 'lujaykhan01@gmail.com', NULL, '085787839318', 'student', '2026-03-31 02:18:00', '$2y$12$bk0zoGEptd/THbR3p2qqtunCZo6/BhlTL.QfjlQ4Vz4W8V3OFB7Ge', NULL, NULL, NULL, NULL, '2026-03-31 02:16:46', '2026-03-31 02:18:00'),
(182, 'AKMAL MAULANA FIRDAUS', 'akmalmaulanaf28@example.com', NULL, '081528657569', 'student', NULL, '$2y$12$0V87SWxwmvXa/ppGr0an6O.tymuAwgD4FS/D9cI627kNij8U7X3UC', NULL, NULL, NULL, NULL, '2026-03-31 06:30:57', '2026-03-31 06:30:57'),
(183, 'AKMAL MAULANA FIRDAUS', 'maulanafirdausakmal4@gmail.com', NULL, '081528657569', 'student', NULL, '$2y$12$PgIB5ejce3k9QILvBRHQMedQz8e.oTUdrUGJj7G5.zI41UtQT7gSW', NULL, NULL, NULL, NULL, '2026-03-31 17:48:25', '2026-03-31 17:48:25'),
(184, 'Sopiya Yeti', 'sopiyayeti2008@gmail.com', NULL, '085750541109', 'student', NULL, '$2y$12$Q4EobhrNpDsVcOuqWRzLKOaaTKIIMzfADRbeGJSgbI6pa55Ni3.Yi', NULL, NULL, NULL, NULL, '2026-03-31 18:46:33', '2026-03-31 18:46:33'),
(185, 'ZULIYANNUR ASHAN', 'zuliyannurashan22@gmail.com', '260105005', '082191680422', 'student', '2026-04-01 03:32:29', '$2y$12$FO7xr7i5e0yhgOh8msOyV.kD.Oe7sX8w9071uu5bRBNrKyRuKhpXy', NULL, NULL, NULL, 'c4rCy15mzRhGAmzQPJlhwxjuHOhyK6eBTfuZz7ZQcbXAMzIbNqcruJBMFAxs', '2026-04-01 03:30:49', '2026-04-05 20:46:59'),
(186, 'Uzlifatul Jannah', 'uzlifajannah487@gmail.com', NULL, '082298949752', 'student', '2026-04-01 22:22:22', '$2y$12$XDJOKRa3P2uboXQfIod.sOUDHz9gn6VFtwqQfn5tmi04q9J92oZKi', NULL, NULL, NULL, NULL, '2026-04-01 22:13:57', '2026-04-01 22:22:22'),
(187, 'MUHAMMAD RESTU FARIZAL', 'muhammadrestufarizal@gmail.com', '260201004', '083854018821', 'student', '2026-04-02 01:13:03', '$2y$12$miFHqLiVb4wbighp0gNSYO7TQq9YlxUYK6EkPUtol68jTwRTfpHaa', NULL, NULL, NULL, 'PmE5sBQfRU8cfjLEZ3OkLJRzOwv4zU0v1bojvfmKczaK1yqakUq5A3mgK5rO', '2026-04-02 01:13:03', '2026-04-23 01:04:01'),
(188, 'AHMAD ARIYADI', 'ariyy9895@gmail.com', '260105008', '+6285245923403', 'student', '2026-04-02 19:08:32', '$2y$12$Ea7t6BKs/ZqNvL0K/s1q6Oz/mheLGwPV8iMJ.CI33tq8IugCAlcii', NULL, NULL, NULL, NULL, '2026-04-02 19:08:32', '2026-04-29 20:32:14'),
(189, 'MUTIARA YASMIN', 'yasminmutiara2304@gmail.com', NULL, '081255317981', 'student', '2026-04-02 19:23:37', '$2y$12$R6oQXt5C6Jcwp/LYODeM8uiX78Q4KLbeNevgriIZ0I4Pa9ju77kGC', NULL, NULL, NULL, NULL, '2026-04-02 19:23:37', '2026-04-02 19:23:37'),
(190, 'NUR VITA', 'vta32342@gmail.com', NULL, '082350643703', 'student', '2026-04-03 06:22:49', '$2y$12$g3RFcxl/sQbdJG6s4dcvS.IpVDGZdFQOuUZJPO1qqjaPIK29LYtl.', NULL, NULL, NULL, NULL, '2026-04-03 06:19:54', '2026-04-03 06:22:49'),
(191, 'NUR VINA FAIDATUL KASIH', 'nurvinafaidatulkasih@gmail.com', NULL, '081346504004', 'student', '2026-04-04 03:28:11', '$2y$12$AnRioVPg1AcjE4nTSmafEu2e093C6arkI2zyAT.i/MY2bHU7xEPwy', NULL, NULL, NULL, 'lRbvhrGrWMURT7tNgh4gho9dIurWiqnQU2c6CGyAn4nBdiqoFwkyMEHLlK8v', '2026-04-04 03:27:37', '2026-04-04 03:28:11'),
(192, 'Awal Adiyaksa', 'awaladiyaksa055@gmail.com', NULL, '082149037878', 'student', '2026-04-04 10:46:53', '$2y$12$9PB.J/YkL2PlXsu2iqLIE.jWqf.N79VKydJDHAW3Iff0RrBtzjRRi', NULL, NULL, NULL, NULL, '2026-04-04 10:46:05', '2026-04-04 10:46:53'),
(194, 'Zahra Salsabila', 'zahrasalsabila2129@gmail.com', NULL, '082262535539', 'student', '2026-04-04 16:34:41', '$2y$12$gnbk/PYx7XbqaUl.V8fL0.g9u/IndImMLS3dzyf1MmbdFuAzUxFuK', NULL, NULL, NULL, NULL, '2026-04-04 16:33:54', '2026-04-04 16:34:41'),
(195, 'MUH. ARIL', 'rillaril418@gmail.com', NULL, '085821432100', 'student', '2026-04-04 22:04:38', '$2y$12$nhP.Q8OgLIMMBeryGXT.9OWLdgz4OujxKy1DFUGr.fJEnk2xY5Ode', NULL, NULL, NULL, 'ohWvr9SuNo7XKxIxfd6Qc9h3hVUqeVV5vPgvPkUVqLdO0mxfwwarmjQXvqgA', '2026-04-04 22:04:13', '2026-04-04 22:04:38'),
(196, 'NUR VITA', 'nur.vita690@sma.belajar.id', NULL, '082350643703', 'student', NULL, '$2y$12$MYAGNs1kbPltcgzFPFpSK.QKvxJMDOG9NfhD7mJIeQsdhxfauVVui', NULL, NULL, NULL, 'c8KKL3ygfKavPxtiS1JgjXEqbXVxUDorfcxd4cToR92j3JBRlWYe8sUJnqW6', '2026-04-05 02:56:39', '2026-04-05 02:56:39'),
(197, 'Aprilia Palma', 'apriliapalma05@gmail.com', NULL, '081324266619', 'student', '2026-04-06 23:05:34', '$2y$12$HtUwZcPa9yQJRkvlAm2k/OrzkGhzcv9ctB48CrmdyifsKoO8tePuS', NULL, NULL, NULL, 'w7LWAUAePy6joANDRxZhk3ikajPVqRowDtPX0zYpofcP1VoaI9IxH3lvFqoO', '2026-04-06 22:55:42', '2026-04-06 23:05:34'),
(198, 'Zdian Zarrah Widianto', 'nizolnupal@gmail.com', NULL, '+6283836730881', 'student', '2026-04-07 00:31:04', '$2y$12$G5vg486iqhwERjMyQdhgrugmeFmvwIi7nfi4vcJTdza1OKIfOn5qC', NULL, NULL, NULL, 'VrTJ3rF7amh4jaNOBvTl09eqTGMOrzIxUTmyTsHUY54YMj54QC5tHd6npjvN', '2026-04-07 00:30:22', '2026-04-07 00:31:04'),
(199, 'Sopiya Yeti', 'yetisopiya@gmail.com', NULL, '+6285750541109', 'student', NULL, '$2y$12$EkyuBAmhCRfuLq/fbFfXfOa59WtaTsqQflL5Li/FkaaTaQ/k8C55i', NULL, NULL, NULL, NULL, '2026-04-07 01:39:00', '2026-04-07 01:39:00'),
(200, 'ST KAMARIAH', 'sitikamariah928@gmail.com', NULL, '+6282149058909', 'student', '2026-04-07 03:46:20', '$2y$12$wLena5ZmHlV8lL4UTyljCeKX5vxaliuDTYbVp.K1cOiw1xYjg8tOW', NULL, NULL, NULL, NULL, '2026-04-07 03:38:47', '2026-04-07 03:46:20'),
(202, 'andika rafi ramadhani', 'andikarafi234@gmail.com', NULL, '083159013059', 'student', '2026-04-07 19:06:44', '$2y$12$5JDVj2ph9HpaRr7DxsX4nOTM55E27jB6h/av5Hgw2KMvR9jcjX/Ca', NULL, NULL, NULL, '0u7dHLF2yjoxFRbr3NM8oc8t18yANw1i3xB3mo6aMykSV8wgImGBAznkSU1C', '2026-04-07 19:03:47', '2026-04-07 19:06:44'),
(203, 'MOHAMMAD AL MALIK', 'azudinmantapp12@gmail.com', '260104017', '081919694504', 'student', '2026-04-07 22:02:02', '$2y$12$iY8.dPcgUi8//yQ.25pukeeV.JlVTRz.Ym9yxl61CZYIJxZmsKJwG', NULL, NULL, NULL, 'ny58YvargnN4XqoyAbFHavZjqcEV2FXk12bva1dxox9aj1ulfJ7bZRk157IA', '2026-04-07 21:58:50', '2026-04-28 18:53:40'),
(204, 'Hairul Rabani', 'hairulrabani015@gmail.com', '260104014', '082153409020', 'student', '2026-04-08 03:52:22', '$2y$12$ZQx98qTC4xTYgyRB.BI9veNjZPhZCnzlP95/tUKgBVBrd.IdJLCmO', NULL, NULL, NULL, 'PplTRQqgGzhYJyR8d4qKPpanLr0YpG7gmq517w76aAXmTHJEvhWuEELUEkXv', '2026-04-08 03:51:52', '2026-04-09 00:25:17'),
(205, 'FITRIANA DWI UTARI', 'fitrianadwiutari1122@gmail.com', NULL, '085249398268', 'student', '2026-04-08 05:45:43', '$2y$12$rRlhdwGA81VAiIf3f2zl6.lZ/Am.YD.NlkUrXVxjQ4jXBbynb7hnm', NULL, NULL, NULL, NULL, '2026-04-08 05:45:17', '2026-04-08 05:45:43'),
(206, 'andi saputra', 'arielelyanto@gmail.com', NULL, '081364080368', 'student', '2026-04-08 13:20:00', '$2y$12$iwXp/V2QacQWf2TfegPErunSl73uuCN8zy/d/6zY3YMLZQ7N5gCoO', NULL, NULL, NULL, NULL, '2026-04-08 13:19:31', '2026-04-08 13:20:00'),
(207, 'Rosmah Lia Putri', 'rosmahliaputri06@gmail.com', '260104015', '085752186058', 'student', '2026-04-08 18:19:35', '$2y$12$1LX3WN5XvEvWjWHeUGE5yOss9FO.Ne87DTb0zKqY8feN3boAfnJ5m', NULL, NULL, NULL, NULL, '2026-04-08 18:18:27', '2026-04-23 04:40:54'),
(208, 'Radithya yuwen fortino lim', 'yuwenraditya@gmail.com', NULL, '081348139197', 'student', '2026-04-09 09:14:04', '$2y$12$8MVPO0NsR2727yBu2W9.luW/H.qHDyEl/vSV7Ly9Kem7Yv0p1TDiy', NULL, NULL, NULL, NULL, '2026-04-09 09:13:22', '2026-04-09 09:14:04'),
(209, 'Firra cahyani meidiva putri', 'firracahyani3@gmail.com', NULL, '085828563962', 'student', '2026-04-10 06:04:24', '$2y$12$xaK7Aoca6JKKlsKI0Wfi.uyKds/1Vj6Ga/k44aY5HZvuPdaH2gqqm', NULL, NULL, NULL, NULL, '2026-04-10 06:03:15', '2026-04-10 06:04:24'),
(210, 'Ridho Achmad Zulfikar', 'ridhoachmad124@gmail.com', NULL, '081350303658', 'student', '2026-04-10 20:34:50', '$2y$12$w94mqA34OUdTJytzmBex9ekopYyM0FxgeZqDhro0myADmL.fEl2oq', NULL, NULL, NULL, NULL, '2026-04-10 20:34:04', '2026-04-10 20:34:50'),
(213, 'Nur Azizah', 'nurazizahsamarinda@gmail.com', '260201002', '085787500734', 'student', '2026-04-12 23:11:45', '$2y$12$HOFyRMotz9A1Qi9WVzfLFeaVZJVg5adLVqTHc3LWxRuEmsedG5X2e', NULL, NULL, NULL, NULL, '2026-04-12 23:11:45', '2026-04-12 23:34:50'),
(214, 'Saskia Junita Putri', 'saskiajunitaputri08@gmail.com', '260203003', '082185654314', 'student', '2026-04-12 23:48:29', '$2y$12$ZE4ss9TmwKuMeB2kjpKx/eedUS0FiR2EQ/II9g2yo/5MZZN7pwAP6', NULL, NULL, NULL, 'pRaGbhS5O1Qb42fqN12tzcTfURuff0AyujbyNG2tBP67mFTUfA3eOqydHtGA', '2026-04-12 23:48:29', '2026-04-12 23:55:44'),
(215, 'Aditya Maulana', 'mbappe020408@gmail.com', NULL, '085656748679', 'student', NULL, '$2y$12$Sao57DhnCsa.JOuJ4N6b0e79bWXtiKNwNaNgjFgTdK2F90HxdOkGy', NULL, NULL, NULL, NULL, '2026-04-12 23:53:20', '2026-04-12 23:53:20'),
(216, 'Adhitya Pratama', 'pratamaadhitya07@gmail.com', NULL, '085162886986', 'student', '2026-04-13 03:21:29', '$2y$12$ejb.gpwaMFkqB2Pw3CQ6Wers0c59ZFDy1anGjhVfi0VSmdVjPd6Ya', NULL, NULL, NULL, NULL, '2026-04-13 03:20:42', '2026-04-13 03:21:29'),
(217, 'Erika Gracia Novitania Arif', 'erikagracia1611@gmail.com', NULL, '085845267318', 'student', '2026-04-13 19:59:32', '$2y$12$YYyMnMG4D8WDPHVqTIHFyO1WCrP45a2H34Kpy7OnDu/5YFqXxvg3.', NULL, NULL, NULL, NULL, '2026-04-13 19:58:36', '2026-04-13 19:59:32'),
(220, 'Nafasya', 'nafasyah75@gmail.com', NULL, '+62 858-4543-6159', 'student', '2026-04-14 03:42:33', '$2y$12$OblDLoHbMtcAxVOWdsbeHOMpuFdGEHvjio73pyznMZNbHB3N.6iZ.', NULL, NULL, NULL, NULL, '2026-04-14 03:41:24', '2026-04-14 03:42:33'),
(221, 'Fadhil Karim', 'fadhilkarim2303@gmail.com', '260104018', '087826968546', 'student', '2026-04-14 05:26:15', '$2y$12$fPS7bMNwOifO6gRXyAp9/.9iDv/iEYIBd9/qorrqT9gnTOmbDsbzG', NULL, NULL, NULL, NULL, '2026-04-14 05:25:38', '2026-04-28 19:06:25'),
(222, 'AZISAH NUR SHAHADA', 'ayayam21207@gmail.com', '260201003', '082122651612', 'student', '2026-04-14 21:41:01', '$2y$12$ctgBs5OSzOhet1YfntNZVeRU4qpgS0rI1OW04MtSpT9We6TYRRD1.', NULL, NULL, NULL, NULL, '2026-04-14 21:41:01', '2026-04-15 20:04:34'),
(223, 'MOHAMMAD DHONI SETIAWAN', 'mazzdhonnn@gmail.com', NULL, '085888495530', 'student', '2026-04-15 18:08:11', '$2y$12$VWUrWF8XhhSjSFvBtPYV8eiLC/en21Ff39CQuHwj8QCk54Ou2Q4N6', NULL, NULL, NULL, NULL, '2026-04-15 18:07:44', '2026-04-15 18:08:11'),
(224, 'anuarsuhada', 'anuarsuhada27@gmail.com', NULL, '082287009943', 'student', '2026-04-16 17:23:59', '$2y$12$qf7Mo8x1ZpAs1fE0zF82D.Vqy7AEuVXbcjAGXu11fDQ5w206Pav9q', NULL, NULL, NULL, NULL, '2026-04-16 17:23:31', '2026-04-16 17:23:59'),
(225, 'Muhammad Raflei', 'rafleimuhammad041123@gmail.com', NULL, '082343881957', 'student', '2026-04-16 22:37:08', '$2y$12$jkrNtV5FvhRBLX8.lNjOaeIdiyFCNNpllBLQY4wvFNSTqchSBWOmC', NULL, NULL, NULL, NULL, '2026-04-16 22:35:19', '2026-04-16 22:37:08');
INSERT INTO `users` (`id`, `name`, `email`, `nim`, `phone`, `role`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(226, 'Muhammad Abdhis Salam', 'muhammadabdisalam197@gmail.com', '260202008', '082154863294', 'student', '2026-04-17 00:03:03', '$2y$12$XZWJmuc4gqmj6aT1/Rb6EeKHK8mwzpSpGJ5Ue1Jc2zHaRmIJ900vW', NULL, NULL, NULL, NULL, '2026-04-17 00:03:03', '2026-04-17 00:09:46'),
(227, 'Gita Indah Rosmalia', 'gitaaagitaaa577@gmail.com', NULL, '085828347023', 'student', '2026-04-17 01:13:07', '$2y$12$qY4pFzygHOkgaRFj59IcXueUfR179FAqBODYcJUvGyKCFYDssNhxK', NULL, NULL, NULL, NULL, '2026-04-17 01:13:07', '2026-04-17 01:13:07'),
(228, 'Fitriah', 'fitriahpiah80@gmail.com', NULL, '087869449677', 'student', '2026-04-17 02:00:21', '$2y$12$xMCErhGXD4dsocDjH4VycOOu2VdlBfsWe8Lhk6AGucvedx.8Gzx8K', NULL, NULL, NULL, NULL, '2026-04-17 02:00:21', '2026-04-17 02:00:21'),
(229, 'Muhammad Nabil Dwi Putra Manoppo', 'vavorita0510@gmail.com', '260105006', '085751302991', 'student', '2026-04-17 16:55:51', '$2y$12$N.TeIow2y3UH8as6gPFXWeiZ9yr12dmahBmASEz47Zg5vOaObbfPy', NULL, NULL, NULL, NULL, '2026-04-17 16:55:51', '2026-04-18 00:16:17'),
(230, 'Muhammad Nabil Dwi Putra Manoppo', 'vavorita0510@gmail.cin', NULL, '085751302991', 'student', NULL, '$2y$12$3m2NsNJz/0m6iHGqehntn.lgVpeoVzEQd0WHV0UMH/TaKFEcdGkaG', NULL, NULL, NULL, NULL, '2026-04-17 17:10:46', '2026-04-17 17:10:46'),
(231, 'Ratu Syahlaa Az Zahra Ahmad', 'syahlaazzz08@icloud.com', NULL, '082213432909', 'student', '2026-04-18 17:00:19', '$2y$12$zVrOnBZqNTRcPnK/Re7/cOaXg6d3UOdHk/x3Ey66N7wpzTGCV0Aky', NULL, NULL, NULL, 'zN3cIr90iqMZFh1mh0vTMfwQ1DK3ZY2w4LyOLTeFPTeydm7xcgB71XS6gofZ', '2026-04-18 16:59:26', '2026-04-18 17:00:19'),
(232, 'Rivai iyasa', 'rivaiiiyasa123@gmail.com', NULL, '089601087236', 'student', '2026-04-18 20:56:27', '$2y$12$5iC/7B97goILLC/yH9YsvuQ1CB14imPnR26HymLVHr80Jk2jaLm5e', NULL, NULL, NULL, NULL, '2026-04-18 20:56:05', '2026-04-18 20:56:27'),
(233, 'Aziz Nur Amin', 'azizsetya778@gmail.com', NULL, '085895874676', 'student', '2026-04-19 05:45:13', '$2y$12$/qIRO9DLLTWJe3p3uQLOlesgcgCtMUpLz.nC0ivPQJlMjOFacoiem', NULL, NULL, NULL, NULL, '2026-04-19 05:44:50', '2026-04-19 05:45:13'),
(234, 'Firdan Firdan', 'firdannn04@gmail.com', NULL, '085750655672', 'student', '2026-04-19 09:49:46', '$2y$12$Ewg3u0QZKuRQDls9syN2JO1NKmGTxOPi8HszqF2GnL62xzIASjuVy', NULL, NULL, NULL, NULL, '2026-04-19 09:47:53', '2026-04-19 09:49:46'),
(235, 'bunga permatasari', 'bungapermatasari1228@gmail.com', NULL, '085194169009', 'student', NULL, '$2y$12$NeTnSg1kTSMoHmy9fMv1UOelzz7zY3gE0xmfkpT/CY4x6M58PNkrC', NULL, NULL, NULL, NULL, '2026-04-19 15:46:54', '2026-04-19 15:46:54'),
(236, 'Sri Budiani maskur', 'sribudiani230@gmail.com', NULL, '087862036278', 'student', NULL, '$2y$12$djVN7aqT0eGjTQX8YCFjuOTo8glhdF0A5dxpAAVlHCxZVV8uswyxm', NULL, NULL, NULL, NULL, '2026-04-20 18:50:38', '2026-04-20 18:50:38'),
(238, 'SRI FRENSIDA', 'srifransida@gmail.com', NULL, '082256674419', 'student', NULL, '$2y$12$4acfm049ZU6DNm1TCY2ZY.m0viUBDDbQJindzZm8BeYBrzfW889WK', NULL, NULL, NULL, NULL, '2026-04-21 04:20:10', '2026-04-21 04:20:10'),
(239, 'rahmat haryadi', 'haryadirahmat82@gmail.com', NULL, '081250532327', 'student', '2026-04-21 04:49:24', '$2y$12$5s4jK7lqwPK/Y3mgwmRIAeLL7oeqVVoEE.DO9CM3o7X8dzW.pzR1C', NULL, NULL, NULL, 'aSRViZHTDWwpIo98z7m7gpUs1KxOEVOST3xvm6pf3oUhKT20SN4oTiSJFLkr', '2026-04-21 04:48:44', '2026-04-21 04:49:24'),
(240, 'Mohamad Rizki Arpiansyah', 'riskiarpiansyah5@gmail.com', NULL, '081350899960', 'student', '2026-04-21 16:33:31', '$2y$12$hA1RdJ8.8FM549cfdKmdjuraKrF6FPUJ27dZoLP3c2PLtETknIKWa', NULL, NULL, NULL, NULL, '2026-04-21 16:33:03', '2026-04-21 16:33:31'),
(241, 'Try Risky Aulia', 'tryaulia73@gmail.com', NULL, '085185518709', 'student', '2026-04-22 00:00:31', '$2y$12$CgCSWH794C8XDAYVmltUMOSkC0plzfVlJHmkTYLGtCWgbRjhc2H2K', NULL, NULL, NULL, NULL, '2026-04-22 00:00:31', '2026-04-22 00:14:32'),
(242, 'Annisa Khairani', 'khairania338@gmail.com', NULL, '08998341839', 'student', '2026-04-22 01:01:08', '$2y$12$OMCByC.CRk4uAM1GMb9cWexWuyHABlCGS3URit5GyIhlI4D801Yvu', NULL, NULL, NULL, NULL, '2026-04-22 01:01:08', '2026-04-22 01:01:08'),
(243, 'Keyla Sabrina', 'keylasabrina426@gmail.com', NULL, '082223835372', 'student', '2026-04-22 20:12:55', '$2y$12$R.dJ0hWfHI2DJFmmVqRjseWAOagrzFDTqesXkvR/0MWkOJTT1I9MO', NULL, NULL, NULL, NULL, '2026-04-22 20:12:31', '2026-04-22 20:12:55'),
(244, 'dian julfani', 'dianjulfani@gmail.com', NULL, '082187285016', 'student', '2026-04-22 21:12:29', '$2y$12$6tHAMyQDZw6rHByS2S7TrO3yld56EAamKbPsqQIZkiH42cLyLFLsa', NULL, NULL, NULL, NULL, '2026-04-22 21:11:45', '2026-04-22 21:12:29'),
(245, 'Mawar Ariyan Nur', 'mawarariyannur@gmail.com', NULL, '085551278091', 'student', '2026-04-22 21:53:55', '$2y$12$2AOOhtpdF6NBRrlpx0K5H.XJ4qR8Ju6XHJ8DlkLQ11.TzfonMp/V.', NULL, NULL, NULL, NULL, '2026-04-22 21:53:07', '2026-04-22 21:53:55'),
(246, 'Nabil Hisyaam Rajwa Hadi', 'nabilhisyaam07@gmail.com', NULL, '082131955777', 'student', '2026-04-22 22:37:27', '$2y$12$0cqHQGxPIrCipccznvgKYOcKMC/6.rwT4rwZpeDRI9kR1ti5OL19S', NULL, NULL, NULL, NULL, '2026-04-22 22:37:03', '2026-04-22 22:37:27'),
(247, 'Nur hidayah saqilah', 'qilahlilies@gmail.com', NULL, '083138474909', 'student', '2026-04-23 03:32:47', '$2y$12$JMwHXO1FVANi4yvUDqo8A.IT6he6bm0jfQYnpB/iG5oUXk2xL3klS', NULL, NULL, NULL, NULL, '2026-04-23 03:31:37', '2026-04-23 03:32:47'),
(248, '7878686686868787878798', 'danifn@gmail.com', NULL, '08115331979', 'student', NULL, '$2y$12$xPrEaN81PXfk/fR5AOsX6.z2DRl/VOtxLbG9TcVgjxr00OxGcivQ6', NULL, NULL, NULL, NULL, '2026-04-23 06:08:45', '2026-04-23 06:08:45'),
(249, '08989797979878', 'danifn@mail.ugm.ac.id', NULL, '08115331979', 'student', '2026-04-23 06:14:08', '$2y$12$H9Bp3UOvr2xRvNfNJPD.3urY/pDprl0mi9VHKjsFVre9pt77jLIO6', NULL, NULL, NULL, NULL, '2026-04-23 06:10:06', '2026-04-23 06:14:08'),
(250, 'Satria Labib Rifqy', 'olshope64@gmail.com', NULL, '085117278066', 'student', '2026-04-23 17:14:06', '$2y$12$rS9ne4pmyJ8WfP6Wt0ktU.nK6GWQI8k91lPMov5XAFnorGPNzTYuy', NULL, NULL, NULL, NULL, '2026-04-23 17:12:26', '2026-04-23 17:14:06'),
(251, 'MOCHAMMAD FARIZKI MAULANA', 'mochammadfarizkimaulana@gmail.com', NULL, '085222731666', 'student', '2026-04-23 23:53:55', '$2y$12$25N6cBT0gAN9YLmija9jUeikDRKsVGrGxNJFwu.mpdDKk1ZhYPCO.', NULL, NULL, NULL, 'WT2RiyLi8FME4Jt0SJwroL8KFqRYI6NZnCJ1eGbOw2wjvJJvc4ZQC1hhr8rY', '2026-04-23 23:53:23', '2026-04-23 23:53:55'),
(252, 'Evan Raditia Lesmana', 'elcndy25@gmail.com', NULL, '+62 895-3859-8685', 'student', '2026-04-23 23:56:40', '$2y$12$wlJ6OlhEOh5ZApI0c0654u.sFvr1wcEAysojFmUPy092eTxPnlfui', NULL, NULL, NULL, NULL, '2026-04-23 23:56:04', '2026-04-23 23:56:40'),
(256, 'Noval putra hardiansyah', 'novalputrahardiansyah@gmail.com', NULL, '082381148643', 'student', '2026-04-24 05:15:28', '$2y$12$68qDnm07H8fMYOvcQZAGLOStzmXWhxGn0XXRmCtTBoM0Khh87r6uu', NULL, NULL, NULL, NULL, '2026-04-24 05:14:57', '2026-04-24 05:15:28'),
(257, 'SHERLLY AMANDA PRATAMA', 'sherllyamandapratama@gmail.com', NULL, '081335044222', 'student', '2026-04-24 05:14:57', '$2y$12$QCGnFN1h6db4wvY7IucDSOR1js2Vd/jm1Jki70aY3s/xtXNolrvUG', NULL, NULL, NULL, NULL, '2026-04-24 05:14:57', '2026-04-24 05:14:57'),
(258, '𝙕𝘼𝙃𝙄𝙍𝘼 𝙈𝙐𝙎𝙁𝙄𝙆𝘼', 'zahiramusfika@gmail.com', NULL, '083812561422', 'student', '2026-04-24 05:46:17', '$2y$12$juN8xdW5ggAzzv1eSQBQ2ORwJrD3PCMZ.ZjXD/EFv815R56cY/LhK', NULL, NULL, NULL, NULL, '2026-04-24 05:46:17', '2026-04-24 05:46:17'),
(259, 'Syahrani Khoeruddin', 'syahranikhoeruddin61@gmail.com', NULL, '081255689569', 'student', '2026-04-24 06:10:32', '$2y$12$D3RBOL90PHn259vje2.vC.VbBG/H.5WcIWkG6nnEQJrvtv68FbXaq', NULL, NULL, NULL, NULL, '2026-04-24 06:10:32', '2026-04-24 06:10:32'),
(260, 'Aidil juzaili', 'aidilnibos00@gmail.com', NULL, '082217197865', 'student', '2026-04-25 00:22:23', '$2y$12$AyQKoJtnb.zIqeBZ0DwFoup.CDsxOgZ2egRh5Y8LOGZwLcUQhT2we', NULL, NULL, NULL, NULL, '2026-04-25 00:21:27', '2026-04-25 00:22:23'),
(261, 'Nurul Fathiyah', 'nfathiyah984@gmail.com', NULL, '+6285654724989', 'student', NULL, '$2y$12$mwan92L5Mm.VjmP3J8ziOeNP4a5TRD2QTiB6BUSslV0yk.gfOUIPS', NULL, NULL, NULL, NULL, '2026-04-25 00:56:13', '2026-04-25 00:56:13'),
(262, 'Muhammad Nabiil Ansori', 'nabiil45072@gmail.com', NULL, '085738861622', 'student', '2026-04-25 13:04:44', '$2y$12$yuI08of3HXozaCGJuCwieeepVvPm4uQPyDJnBn3VvImW/Z8XU6Vse', NULL, NULL, NULL, NULL, '2026-04-25 13:04:23', '2026-04-25 13:04:44'),
(263, 'Dewi Risma Ramayanti', 'dewirissma24@gmail.com', NULL, '082154222877', 'student', '2026-04-25 20:19:26', '$2y$12$FM8Ezt0F3h2GIqFc8xJc2.iPHvSeL4.yj5o4JImFNbP9KAsf.lMQG', NULL, NULL, NULL, NULL, '2026-04-25 20:17:02', '2026-04-25 20:19:26'),
(264, 'muhammad riski', 'riskytongky7@gmail.com', NULL, '087862707144', 'student', '2026-04-26 01:17:03', '$2y$12$UkkYU2WNdl/larK3M.OcieBQkgPRO2ETwx4Uew1oGwxKABXrjY4Jq', NULL, NULL, NULL, NULL, '2026-04-26 01:14:50', '2026-04-26 01:17:03'),
(265, 'SYAUKANI', 'syaukan2710@gmail.com', NULL, '082210593020', 'student', '2026-04-26 08:46:26', '$2y$12$emDnZLNjasTsdDfgRvr5MOLsqLtIrclKpzqxCr66Pfg4TnRqlAQ7a', NULL, NULL, NULL, NULL, '2026-04-26 08:46:26', '2026-04-26 08:46:26'),
(266, 'Nafisa Widya Rahma', 'nafisawr5@gmail.com', NULL, '081346303409', 'student', '2026-04-27 19:45:17', '$2y$12$JFTtUCf7g2OJ4QIsM.KV7eXyjq0orFQ3mY9AVbGWIVIooeavASdaK', NULL, NULL, NULL, NULL, '2026-04-27 19:44:04', '2026-04-27 19:45:17'),
(267, 'MUHAMMAD BAIHAQI AL FARISYI', 'baihaqifarisyi@gmail.com', '260202009', '088276517339', 'student', '2026-04-27 23:26:34', '$2y$12$w5TCprUUnXp2eBUE6MkRhO3yVFlk8othJBS8T2.MHXJbKnDJlyHui', NULL, NULL, NULL, NULL, '2026-04-27 23:26:34', '2026-04-27 23:33:45'),
(268, 'Rista may Wuandari', 'ristamaywuandari@gmail.com', NULL, '085137014672', 'student', '2026-04-27 23:37:50', '$2y$12$/7Y.uQBjzfNXnoIC3wa/H.nlqEw9K/h92X5kQ5c4J1Cin/XrEz6hq', NULL, NULL, NULL, NULL, '2026-04-27 23:37:25', '2026-04-27 23:37:50'),
(269, 'Yudha mey pratama', 'yudharamen1@gmail.com', NULL, '085792072085', 'student', '2026-04-27 23:47:33', '$2y$12$fVOU85aI3EKPXpYPvMTqR.NOL64Vo.J/K4CwLCiBpZAhG0fvbFfWW', NULL, NULL, NULL, NULL, '2026-04-27 23:47:04', '2026-04-27 23:47:33'),
(270, 'Fita', 'vitaslnrsvit@gmail.com', NULL, '081349654532', 'student', '2026-04-28 00:20:57', '$2y$12$E4clpN2CfjxCRs1AUCFuQOfhS1fCDfJs4YEZ6ACd8Sm9UOTXyslMK', NULL, NULL, NULL, NULL, '2026-04-28 00:20:57', '2026-04-28 00:20:57'),
(271, 'Tiara Qaisa Hikmah', 'qaisatiara477@gmail.com', NULL, '081549233826', 'student', '2026-04-28 01:46:21', '$2y$12$1s7WGeMJ8A0uFCiwoE4qNuA/50.N57ENHAAxnBTU6Oz/zKnszCbZ6', NULL, NULL, NULL, 'kOk3kB18NHEqVOmFfNUEKknLiu8LO2AVxuEBMBSOVffOririY8ROqxkYevc0', '2026-04-28 01:45:05', '2026-04-28 01:46:21'),
(272, 'DINA AULIA RAHMAH', 'dinaauliarahmah31@gmail.com', NULL, '082254347402', 'student', '2026-04-28 03:56:33', '$2y$12$47FMH.qke4vM8su0jjjVC.B8WjP7zSSP8pBhChYbMm8x6Q.yCrqgS', NULL, NULL, NULL, NULL, '2026-04-28 03:55:59', '2026-04-28 03:56:33'),
(273, 'Ahmad Fauzi', 'ahmadfauzi7gg@gmail.com', NULL, '085656706176', 'student', '2026-04-28 06:24:38', '$2y$12$mIQxS1xFN6IpzVENVQQFjuyIzkcTCFilSPDG.WjoPwGbfUmPf9JE6', NULL, NULL, NULL, 'RxiABX9BSNS8JMTLjFBHcSBofx23ESj4OqHQhCX3h0i0kW30RKwr8ywqK2Ls', '2026-04-28 06:23:44', '2026-04-28 06:24:38'),
(275, 'M rafi\'i Rifki', 'rifqkimrafi@gmail.com', NULL, '082254824357', 'student', '2026-04-28 14:44:03', '$2y$12$km3IelnPEgf077dgf7AmJe6OiuaIL4Fa9h6IBWNeqrPOCCgwXjihG', NULL, NULL, NULL, NULL, '2026-04-28 14:43:27', '2026-04-28 15:23:59'),
(276, 'Restu Azis Rofi\'i', 'restuazis093@gmail.com', NULL, '085824436280', 'student', '2026-04-29 18:28:49', '$2y$12$tERj5TRd5cv0izk9h8ATK.KdzNpQ7yrWYXrNMnRyQrKBsb89X3MKO', NULL, NULL, NULL, NULL, '2026-04-29 18:28:49', '2026-04-29 18:28:49'),
(277, 'Yusril', 'xyusriladitya077@gmail.com', NULL, '085180743768', 'student', '2026-04-29 23:28:39', '$2y$12$ziZusZhvZJx1O.Klf.bsZOHVZ0RgjYX7WlYQoV.UCA7qxNgQuDO0m', NULL, NULL, NULL, NULL, '2026-04-29 23:28:15', '2026-04-29 23:28:39'),
(278, 'SALSABILLA PUTERI', 'salsaputeri0@gmail.com', NULL, '089675680018', 'student', '2026-04-29 23:44:18', '$2y$12$C6wxfqyo1R13k453QeIHZ.KFi/iFkLlKHVsQNH/Zr9Cwk4tmySPre', NULL, NULL, NULL, NULL, '2026-04-29 23:44:18', '2026-04-29 23:44:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admission_letters`
--
ALTER TABLE `admission_letters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admission_letters_letter_number_unique` (`letter_number`),
  ADD UNIQUE KEY `admission_letters_verification_token_unique` (`verification_token`),
  ADD UNIQUE KEY `admission_letters_user_id_unique` (`user_id`),
  ADD KEY `admission_letters_created_by_foreign` (`created_by`),
  ADD KEY `admission_letters_user_id_sent_at_index` (`user_id`,`sent_at`);

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
-- AUTO_INCREMENT for table `admission_letters`
--
ALTER TABLE `admission_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_logs`
--
ALTER TABLE `chat_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `chat_training`
--
ALTER TABLE `chat_training`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_verifications`
--
ALTER TABLE `document_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `student_biodatas`
--
ALTER TABLE `student_biodatas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `student_parents`
--
ALTER TABLE `student_parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `student_special_needs`
--
ALTER TABLE `student_special_needs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_letters`
--
ALTER TABLE `admission_letters`
  ADD CONSTRAINT `admission_letters_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admission_letters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
