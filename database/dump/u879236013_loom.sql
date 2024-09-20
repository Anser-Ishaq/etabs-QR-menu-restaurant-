-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 01, 2024 at 03:18 PM
-- Server version: 10.11.8-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u879236013_loom`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` varchar(191) NOT NULL,
  `lng` varchar(191) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `apartment` varchar(191) DEFAULT NULL,
  `intercom` varchar(191) DEFAULT NULL,
  `floor` varchar(191) DEFAULT NULL,
  `entry` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `img` varchar(191) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0 - Vendor, 1 - Blog',
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_storage`
--

CREATE TABLE `cart_storage` (
  `id` varchar(191) NOT NULL,
  `cart_data` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `receipt_number` varchar(191) NOT NULL,
  `kds_finished` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_index` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `order_index`, `active`, `deleted_at`) VALUES
(1, 'Salads', 1, '2024-06-08 15:56:53', '2024-06-08 16:09:32', 0, 1, '2024-06-08 16:09:32'),
(2, 'Pizza', 1, '2024-06-08 15:56:53', '2024-06-08 16:09:32', 0, 1, '2024-06-08 16:09:32'),
(3, 'Fresh Pasta and Risotto', 1, '2024-06-08 15:56:57', '2024-06-08 16:09:32', 0, 1, '2024-06-08 16:09:32'),
(4, 'Lasagna', 1, '2024-06-08 15:56:57', '2024-06-08 16:09:32', 0, 1, '2024-06-08 16:09:32'),
(5, 'Burgers', 2, '2024-06-08 15:56:58', '2024-06-08 16:09:36', 0, 1, '2024-06-08 16:09:36'),
(6, 'Garnish', 2, '2024-06-08 15:56:58', '2024-06-08 16:09:36', 0, 1, '2024-06-08 16:09:36'),
(7, 'Salads', 2, '2024-06-08 15:56:58', '2024-06-08 16:09:36', 0, 1, '2024-06-08 16:09:36'),
(8, 'Starters', 2, '2024-06-08 15:56:58', '2024-06-08 16:09:36', 0, 1, '2024-06-08 16:09:36'),
(9, 'Drinks', 2, '2024-06-08 15:56:58', '2024-06-08 16:09:36', 0, 1, '2024-06-08 16:09:36'),
(10, 'Burrito', 3, '2024-06-08 15:56:59', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(11, 'Quesadilla', 3, '2024-06-08 15:56:59', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(12, 'Taco', 3, '2024-06-08 15:56:59', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(13, 'Burrito In A Bowl', 3, '2024-06-08 15:56:59', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(14, 'Salads', 4, '2024-06-08 15:57:00', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(15, 'Pizza', 4, '2024-06-08 15:57:00', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(16, 'Burrito', 4, '2024-06-08 15:57:07', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(17, 'Drinks', 4, '2024-06-08 15:57:07', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(18, 'Salads', 5, '2024-06-08 15:57:08', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(19, 'Lasagna', 5, '2024-06-08 15:57:08', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(20, 'Pizza', 5, '2024-06-08 15:57:08', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(21, 'Fresh Pasta and Risotto', 5, '2024-06-08 15:57:13', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(22, 'Burrito', 6, '2024-06-08 15:57:14', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(23, 'Burrito In A Bowl', 6, '2024-06-08 15:57:14', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(24, 'Quesadilla', 6, '2024-06-08 15:57:14', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(25, 'Taco', 6, '2024-06-08 15:57:14', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(26, 'Drinks', 7, '2024-06-08 15:57:15', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(27, 'Burgers', 7, '2024-06-08 15:57:15', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(28, 'Salads', 7, '2024-06-08 15:57:15', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(29, 'Starters', 7, '2024-06-08 15:57:15', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(30, 'Garnish', 7, '2024-06-08 15:57:15', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(31, 'Drinks', 8, '2024-06-08 15:57:16', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(32, 'Pizza', 8, '2024-06-08 15:57:16', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(33, 'Burrito', 8, '2024-06-08 15:57:21', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(34, 'Salads', 8, '2024-06-08 15:57:22', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(35, 'Lasagna', 9, '2024-06-08 15:57:23', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(36, 'Pizza', 9, '2024-06-08 15:57:23', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(37, 'Salads', 9, '2024-06-08 15:57:27', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(38, 'Fresh Pasta and Risotto', 9, '2024-06-08 15:57:28', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(39, 'Taco', 10, '2024-06-08 15:57:29', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(40, 'Burrito', 10, '2024-06-08 15:57:29', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(41, 'Quesadilla', 10, '2024-06-08 15:57:29', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(42, 'Burrito In A Bowl', 10, '2024-06-08 15:57:29', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(43, 'Salads', 11, '2024-06-08 15:57:30', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(44, 'Starters', 11, '2024-06-08 15:57:30', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(45, 'Burgers', 11, '2024-06-08 15:57:30', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(46, 'Drinks', 11, '2024-06-08 15:57:30', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(47, 'Garnish', 11, '2024-06-08 15:57:30', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(48, 'Drinks', 12, '2024-06-08 15:57:31', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(49, 'Salads', 12, '2024-06-08 15:57:31', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(50, 'Burrito', 12, '2024-06-08 15:57:32', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(51, 'Pizza', 12, '2024-06-08 15:57:32', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(52, 'Pizza', 13, '2024-06-08 15:57:40', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(53, 'Salads', 13, '2024-06-08 15:57:45', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(54, 'Fresh Pasta and Risotto', 13, '2024-06-08 15:57:45', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(55, 'Lasagna', 13, '2024-06-08 15:57:45', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(56, 'Burrito In A Bowl', 14, '2024-06-08 15:57:46', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(57, 'Quesadilla', 14, '2024-06-08 15:57:46', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(58, 'Taco', 14, '2024-06-08 15:57:46', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(59, 'Burrito', 14, '2024-06-08 15:57:46', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(60, 'Starters', 15, '2024-06-08 15:57:47', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(61, 'Burgers', 15, '2024-06-08 15:57:47', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(62, 'Garnish', 15, '2024-06-08 15:57:47', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(63, 'Salads', 15, '2024-06-08 15:57:48', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(64, 'Drinks', 15, '2024-06-08 15:57:48', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(65, 'Pizza', 16, '2024-06-08 15:57:49', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(66, 'Drinks', 16, '2024-06-08 15:57:55', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(67, 'Salads', 16, '2024-06-08 15:57:55', '2024-06-08 16:09:41', 0, 1, '2024-06-08 16:09:41'),
(68, 'Burrito', 16, '2024-06-08 15:57:55', '2024-06-08 16:09:42', 0, 1, '2024-06-08 16:09:42'),
(69, 'Burgers', 17, '2024-06-08 16:50:12', '2024-06-08 16:50:12', 1, 1, NULL),
(70, 'Food', 18, '2024-06-19 12:08:02', '2024-06-19 12:08:02', 1, 1, NULL),
(71, 'Rice', 18, '2024-06-19 12:10:30', '2024-06-19 12:10:30', 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `alias` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `header_title` varchar(191) NOT NULL,
  `header_subtitle` varchar(191) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `name`, `alias`, `image`, `header_title`, `header_subtitle`, `deleted_at`) VALUES
(1, '2024-06-08 15:56:51', '2024-06-08 15:56:51', 'Bronx', 'bx', 'https://foodtiger.mobidonia.com/uploads/settings/177686e2-8597-46e0-bf70-daa8d5ff0085_large.jpg', 'Food Delivery from<br /><strong>Bronx</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(2, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Brooklyn', 'br', 'https://foodtiger.mobidonia.com/uploads/settings/6d001b6c-2ba1-499e-9f57-09b7dc46ace3_large.jpg', 'Food Delivery from<br /><strong>Brooklyn</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(3, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Queens', 'qe', 'https://foodtiger.mobidonia.com/uploads/settings/492b78df-1756-4c30-910a-d3923b66aa97_large.jpg', 'Food Delivery from<br /><strong>Queens</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(4, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Manhattn', 'mh', 'https://foodtiger.mobidonia.com/uploads/settings/01f41f56-1acf-44f0-8e8d-fedceb5267cf_large.jpg', 'Food Delivery from<br /><strong>Manhattn</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(5, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Richmond', 'ri', 'https://foodtiger.mobidonia.com/uploads/settings/fe6c500b-3410-41ff-9734-94c58351ba60_large.jpg', 'Food Delivery from<br /><strong>Richmond</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(6, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Buffalo', 'bf', 'https://foodtiger.mobidonia.com/uploads/settings/0c3c8fb0-c252-4758-9699-6851b15796ef_large.jpg', 'Food Delivery from<br /><strong>Buffalo</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(7, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Rochester', 'rh', 'https://foodtiger.mobidonia.com/uploads/settings/c7f21267-7149-4311-9fd9-4a08904f67a3_large.jpg', 'Food Delivery from<br /><strong>Rochester</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(8, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Yonkers', 'yo', 'https://foodtiger.mobidonia.com/uploads/settings/8c65269a-3bbc-4899-be13-75d1bc35e9cd_large.jpg', 'Food Delivery from<br /><strong>Yonkers</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(9, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Syracuse', 'sy', 'https://foodtiger.mobidonia.com/uploads/settings/1e5fcde5-5dc0-4c29-8f49-314658836fb8_large.jpg', 'Food Delivery from<br /><strong>Syracuse</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(10, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Albany', 'al', 'https://foodtiger.mobidonia.com/uploads/settings/b521e77f-1d3e-4695-b871-bac8262c85dc_large.jpg', 'Food Delivery from<br /><strong>Albany</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(11, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'New Rochelle', 'nr', 'https://foodtiger.mobidonia.com/uploads/settings/8b3ebb83-2e2e-43dd-8747-4f9c6f451199_large.jpg', 'Food Delivery from<br /><strong>New Rochelle</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(12, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Mount Vernon', 'mv', 'https://foodtiger.mobidonia.com/uploads/settings/daecfb93-677f-43a9-9e7e-4cf109194399_large.jpg', 'Food Delivery from<br /><strong>Mount Vernon</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(13, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Schenectady', 'sc', 'https://foodtiger.mobidonia.com/uploads/settings/177686e2-8597-46e0-bf70-daa8d5ff0085_large.jpg', 'Food Delivery from<br /><strong>Schenectady</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(14, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Utica', 'ut', 'https://foodtiger.mobidonia.com/uploads/settings/507847c5-1896-4ecf-bfe8-9c5f198ce41e_large.jpg', 'Food Delivery from<br /><strong>Utica</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(15, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'White Plains', 'wp', 'https://foodtiger.mobidonia.com/uploads/settings/a8e96a74-dc3a-403c-8fd0-b4528838e98c_large.jpg', 'Food Delivery from<br /><strong>White Plains</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(16, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 'Niagara Falls', 'nf', 'https://foodtiger.mobidonia.com/uploads/settings/99d5b4c3-0bb4-428a-96cf-0e510bc3ab57_large.jpg', 'Food Delivery from<br /><strong>Niagara Falls</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `subdomain` varchar(191) DEFAULT NULL,
  `logo` varchar(191) NOT NULL DEFAULT '',
  `cover` varchar(191) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lat` varchar(191) NOT NULL,
  `lng` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `minimum` varchar(191) NOT NULL DEFAULT '0',
  `description` varchar(500) NOT NULL DEFAULT '',
  `fee` double(8,2) NOT NULL DEFAULT 0.00,
  `static_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `radius` varchar(800) NOT NULL DEFAULT '',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `city_id` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `can_pickup` int(11) NOT NULL DEFAULT 1,
  `can_deliver` int(11) NOT NULL DEFAULT 1,
  `self_deliver` int(11) NOT NULL DEFAULT 0,
  `free_deliver` int(11) NOT NULL DEFAULT 0,
  `whatsapp_phone` varchar(191) DEFAULT NULL,
  `fb_username` varchar(191) DEFAULT NULL,
  `do_covertion` int(11) NOT NULL DEFAULT 1,
  `currency` varchar(191) NOT NULL,
  `payment_info` varchar(191) NOT NULL,
  `mollie_payment_key` varchar(191) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `can_dinein` int(11) NOT NULL DEFAULT 1,
  `audio` varchar(191) DEFAULT NULL,
  `enable_audio` tinyint(1) NOT NULL DEFAULT 1,
  `google_review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `created_at`, `updated_at`, `name`, `subdomain`, `logo`, `cover`, `active`, `user_id`, `lat`, `lng`, `address`, `phone`, `minimum`, `description`, `fee`, `static_fee`, `radius`, `is_featured`, `city_id`, `views`, `can_pickup`, `can_deliver`, `self_deliver`, `free_deliver`, `whatsapp_phone`, `fb_username`, `do_covertion`, `currency`, `payment_info`, `mollie_payment_key`, `deleted_at`, `can_dinein`, `audio`, `enable_audio`, `google_review`) VALUES
(1, '2024-06-08 15:56:52', '2024-06-08 16:09:32', 'Leuka Pizza', 'leukapizza', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', '', 1, 2, '40.654509', '-73.948990', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'italian, pasta, pizza', 0.00, 0.00, '[{\"lat\": 40.61811135844185, \"lng\": -74.04154967363282}, {\"lat\": 40.593088644275994, \"lng\": -74.00447081621094}, {\"lat\": 40.57483700944677, \"lng\": -74.01271056230469}, {\"lat\": 40.57222922648421, \"lng\": -73.94816588457032}, {\"lat\": 40.58318123192112, \"lng\": -73.87812804277344}, {\"lat\": 40.620196161732025, \"lng\": -73.89117430742188}, {\"lat\": 40.64520872605633, \"lng\": -73.85340880449219}, {\"lat\": 40.71862893820799, \"lng\": -73.96327208574219}, {\"lat\": 40.680627151592745, \"lng\": -74.01957701738282}, {\"lat\": 40.66552453494284, \"lng\": -74.00447081621094}]', 0, 2, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:32', 1, NULL, 1, NULL),
(2, '2024-06-08 15:56:57', '2024-06-08 16:09:36', 'Oasis Burgers', 'oasisburgers', 'https://foodtiger.mobidonia.com/uploads/restorants/c8d27bcc-54da-4c18-b8e6-f1414c71612c', '', 1, 2, '40.588894', '-73.939175', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'burgers, drinks, best chicken', 0.00, 0.00, '[{\"lat\": 40.61811135844185, \"lng\": -74.04154967363282}, {\"lat\": 40.593088644275994, \"lng\": -74.00447081621094}, {\"lat\": 40.57483700944677, \"lng\": -74.01271056230469}, {\"lat\": 40.57222922648421, \"lng\": -73.94816588457032}, {\"lat\": 40.58318123192112, \"lng\": -73.87812804277344}, {\"lat\": 40.620196161732025, \"lng\": -73.89117430742188}, {\"lat\": 40.64520872605633, \"lng\": -73.85340880449219}, {\"lat\": 40.71862893820799, \"lng\": -73.96327208574219}, {\"lat\": 40.680627151592745, \"lng\": -74.01957701738282}, {\"lat\": 40.66552453494284, \"lng\": -74.00447081621094}]', 0, 2, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:36', 1, NULL, 1, NULL),
(3, '2024-06-08 15:56:58', '2024-06-08 16:09:41', 'Brooklyn Taco', 'brooklyntaco', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', '', 1, 2, '40.607402', '-73.987272', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'yummy taco, wraps, fast food', 0.00, 0.00, '[{\"lat\": 40.61811135844185, \"lng\": -74.04154967363282}, {\"lat\": 40.593088644275994, \"lng\": -74.00447081621094}, {\"lat\": 40.57483700944677, \"lng\": -74.01271056230469}, {\"lat\": 40.57222922648421, \"lng\": -73.94816588457032}, {\"lat\": 40.58318123192112, \"lng\": -73.87812804277344}, {\"lat\": 40.620196161732025, \"lng\": -73.89117430742188}, {\"lat\": 40.64520872605633, \"lng\": -73.85340880449219}, {\"lat\": 40.71862893820799, \"lng\": -73.96327208574219}, {\"lat\": 40.680627151592745, \"lng\": -74.01957701738282}, {\"lat\": 40.66552453494284, \"lng\": -74.00447081621094}]', 0, 2, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(4, '2024-06-08 15:56:59', '2024-06-08 16:09:41', 'The Brooklyn tree', 'thebrooklyntree', 'https://foodtiger.mobidonia.com/uploads/restorants/6fa5233f-00f3-4f52-950c-5a1705583dfc', '', 1, 2, '40.621997', '-73.938831', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'drinks, lunch, bbq', 0.00, 0.00, '[{\"lat\": 40.61811135844185, \"lng\": -74.04154967363282}, {\"lat\": 40.593088644275994, \"lng\": -74.00447081621094}, {\"lat\": 40.57483700944677, \"lng\": -74.01271056230469}, {\"lat\": 40.57222922648421, \"lng\": -73.94816588457032}, {\"lat\": 40.58318123192112, \"lng\": -73.87812804277344}, {\"lat\": 40.620196161732025, \"lng\": -73.89117430742188}, {\"lat\": 40.64520872605633, \"lng\": -73.85340880449219}, {\"lat\": 40.71862893820799, \"lng\": -73.96327208574219}, {\"lat\": 40.680627151592745, \"lng\": -74.01957701738282}, {\"lat\": 40.66552453494284, \"lng\": -74.00447081621094}]', 0, 2, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(5, '2024-06-08 15:57:07', '2024-06-08 16:09:41', 'Awang Italian Restorant', 'awangitalianrestorant', 'https://foodtiger.mobidonia.com/uploads/restorants/4a2067cb-f39c-4b26-83ef-9097512d3328', '', 1, 2, '40.716729', '-73.793035', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'italian, pasta, pizza', 0.00, 0.00, '[{\"lat\": 40.72538611607021, \"lng\": -73.96387365315225}, {\"lat\": 40.65093145404635, \"lng\": -73.85195043537881}, {\"lat\": 40.62175171970407, \"lng\": -73.76680639241006}, {\"lat\": 40.64051158441822, \"lng\": -73.71462133381631}, {\"lat\": 40.670724724281335, \"lng\": -73.67891576741006}, {\"lat\": 40.76388243617103, \"lng\": -73.74758031819131}, {\"lat\": 40.79351981360113, \"lng\": -73.84851720783975}, {\"lat\": 40.78728146460242, \"lng\": -73.91100194905069}]', 0, 3, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(6, '2024-06-08 15:57:13', '2024-06-08 16:09:41', 'Wendy Taco', 'wendytaco', 'https://foodtiger.mobidonia.com/uploads/restorants/6f9e8892-4a28-4c99-ab24-57179a1424b9', '', 1, 2, '40.751418', '-73.809531', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'yummy taco, wraps, fast food', 0.00, 0.00, '[{\"lat\": 40.72538611607021, \"lng\": -73.96387365315225}, {\"lat\": 40.65093145404635, \"lng\": -73.85195043537881}, {\"lat\": 40.62175171970407, \"lng\": -73.76680639241006}, {\"lat\": 40.64051158441822, \"lng\": -73.71462133381631}, {\"lat\": 40.670724724281335, \"lng\": -73.67891576741006}, {\"lat\": 40.76388243617103, \"lng\": -73.74758031819131}, {\"lat\": 40.79351981360113, \"lng\": -73.84851720783975}, {\"lat\": 40.78728146460242, \"lng\": -73.91100194905069}]', 0, 3, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(7, '2024-06-08 15:57:14', '2024-06-08 16:09:41', 'Burger 2Go', 'burger2go', 'https://foodtiger.mobidonia.com/uploads/restorants/80a49037-07e9-4e28-b23e-66fd641c1c77', '', 1, 2, '40.753759', '-73.799224', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'burgers, drinks, best chicken', 0.00, 0.00, '[{\"lat\": 40.72538611607021, \"lng\": -73.96387365315225}, {\"lat\": 40.65093145404635, \"lng\": -73.85195043537881}, {\"lat\": 40.62175171970407, \"lng\": -73.76680639241006}, {\"lat\": 40.64051158441822, \"lng\": -73.71462133381631}, {\"lat\": 40.670724724281335, \"lng\": -73.67891576741006}, {\"lat\": 40.76388243617103, \"lng\": -73.74758031819131}, {\"lat\": 40.79351981360113, \"lng\": -73.84851720783975}, {\"lat\": 40.78728146460242, \"lng\": -73.91100194905069}]', 0, 3, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(8, '2024-06-08 15:57:15', '2024-06-08 16:09:41', 'Titan Foods', 'titanfoods', 'https://foodtiger.mobidonia.com/uploads/restorants/56e90ea7-5321-4cfd-8b2c-918ccd3c3f77', '', 1, 2, '40.749078', '-73.812623', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'drinks, lunch, bbq', 0.00, 0.00, '[{\"lat\": 40.72538611607021, \"lng\": -73.96387365315225}, {\"lat\": 40.65093145404635, \"lng\": -73.85195043537881}, {\"lat\": 40.62175171970407, \"lng\": -73.76680639241006}, {\"lat\": 40.64051158441822, \"lng\": -73.71462133381631}, {\"lat\": 40.670724724281335, \"lng\": -73.67891576741006}, {\"lat\": 40.76388243617103, \"lng\": -73.74758031819131}, {\"lat\": 40.79351981360113, \"lng\": -73.84851720783975}, {\"lat\": 40.78728146460242, \"lng\": -73.91100194905069}]', 0, 3, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(9, '2024-06-08 15:57:22', '2024-06-08 16:09:41', 'Pizza Manhattn', 'pizzamanhattn', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', '', 1, 2, '40.726358', '-73.996879', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'italian, international, pasta', 0.00, 0.00, '[{\"lat\": 40.70279189834177, \"lng\": -74.01818193403926}, {\"lat\": 40.711640621663136, \"lng\": -73.97972978560176}, {\"lat\": 40.798503799354734, \"lng\": -73.91381181685176}, {\"lat\": 40.83487975446948, \"lng\": -73.94745744673457}, {\"lat\": 40.750665070026194, \"lng\": -74.01200212446895}]', 0, 4, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(10, '2024-06-08 15:57:28', '2024-06-08 16:09:41', 'il Buco', 'ilbuco', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', '', 1, 2, '40.724883', '-74.001985', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'tacos, wraps, Quesadilla', 0.00, 0.00, '[{\"lat\": 40.70279189834177, \"lng\": -74.01818193403926}, {\"lat\": 40.711640621663136, \"lng\": -73.97972978560176}, {\"lat\": 40.798503799354734, \"lng\": -73.91381181685176}, {\"lat\": 40.83487975446948, \"lng\": -73.94745744673457}, {\"lat\": 40.750665070026194, \"lng\": -74.01200212446895}]', 0, 4, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(11, '2024-06-08 15:57:29', '2024-06-08 16:09:41', 'Vandal Burgers', 'vandalburgers', 'https://foodtiger.mobidonia.com/uploads/restorants/5757558a-94d7-4ba9-b39c-2e258701f051', '', 1, 2, '40.724102', '-73.999064', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'drinks, beef burgers', 0.00, 0.00, '[{\"lat\": 40.70279189834177, \"lng\": -74.01818193403926}, {\"lat\": 40.711640621663136, \"lng\": -73.97972978560176}, {\"lat\": 40.798503799354734, \"lng\": -73.91381181685176}, {\"lat\": 40.83487975446948, \"lng\": -73.94745744673457}, {\"lat\": 40.750665070026194, \"lng\": -74.01200212446895}]', 0, 4, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(12, '2024-06-08 15:57:30', '2024-06-08 16:09:41', 'Malibu Diner', 'malibudiner', 'https://foodtiger.mobidonia.com/uploads/restorants/a2b5b612-9fec-4e28-bb7d-88a06d97bda6', '', 1, 2, '40.717857', '-74.004561', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'drinks, lunch, bbq', 0.00, 0.00, '[{\"lat\": 40.70279189834177, \"lng\": -74.01818193403926}, {\"lat\": 40.711640621663136, \"lng\": -73.97972978560176}, {\"lat\": 40.798503799354734, \"lng\": -73.91381181685176}, {\"lat\": 40.83487975446948, \"lng\": -73.94745744673457}, {\"lat\": 40.750665070026194, \"lng\": -74.01200212446895}]', 0, 4, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(13, '2024-06-08 15:57:39', '2024-06-08 16:09:41', 'Pizza Relham', 'pizzarelham', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', '', 1, 2, '40.842930', '-73.866629', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'italian, international, pasta', 0.00, 0.00, '[{\"lat\": 40.79717207195068, \"lng\": -73.91185629950473}, {\"lat\": 40.83822431229653, \"lng\": -73.94893515692661}, {\"lat\": 40.90572332325597, \"lng\": -73.9097963629813}, {\"lat\": 40.89793848793209, \"lng\": -73.83426535712192}, {\"lat\": 40.886519072020896, \"lng\": -73.78139365302036}, {\"lat\": 40.81900047658591, \"lng\": -73.79169333563755}]', 0, 1, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(14, '2024-06-08 15:57:45', '2024-06-08 16:09:41', 'NorWood Burito', 'norwoodburito', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', '', 1, 2, '40.850218', '-73.887522', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'tacos, wraps, Quesadilla', 0.00, 0.00, '[{\"lat\": 40.79717207195068, \"lng\": -73.91185629950473}, {\"lat\": 40.83822431229653, \"lng\": -73.94893515692661}, {\"lat\": 40.90572332325597, \"lng\": -73.9097963629813}, {\"lat\": 40.89793848793209, \"lng\": -73.83426535712192}, {\"lat\": 40.886519072020896, \"lng\": -73.78139365302036}, {\"lat\": 40.81900047658591, \"lng\": -73.79169333563755}]', 0, 1, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(15, '2024-06-08 15:57:46', '2024-06-08 16:09:41', 'Morris Park Burger', 'morrisparkburger', 'https://foodtiger.mobidonia.com/uploads/restorants/5757558a-94d7-4ba9-b39c-2e258701f051', '', 1, 2, '40.842427', '-73.866908', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'drinks, beef burgers', 0.00, 0.00, '[{\"lat\": 40.79717207195068, \"lng\": -73.91185629950473}, {\"lat\": 40.83822431229653, \"lng\": -73.94893515692661}, {\"lat\": 40.90572332325597, \"lng\": -73.9097963629813}, {\"lat\": 40.89793848793209, \"lng\": -73.83426535712192}, {\"lat\": 40.886519072020896, \"lng\": -73.78139365302036}, {\"lat\": 40.81900047658591, \"lng\": -73.79169333563755}]', 0, 1, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:41', 1, NULL, 1, NULL),
(16, '2024-06-08 15:57:48', '2024-06-08 16:09:42', 'Bronx VanNest Restorant', 'bronxvannestrestorant', 'https://foodtiger.mobidonia.com/uploads/restorants/a2b5b612-9fec-4e28-bb7d-88a06d97bda6', '', 1, 2, '40.832557', '-73.889583', '6 Yukon Drive Raeford, NC 28376', '(530) 625-9694', '10', 'drinks, lunch, bbq', 0.00, 0.00, '[{\"lat\": 40.79717207195068, \"lng\": -73.91185629950473}, {\"lat\": 40.83822431229653, \"lng\": -73.94893515692661}, {\"lat\": 40.90572332325597, \"lng\": -73.9097963629813}, {\"lat\": 40.89793848793209, \"lng\": -73.83426535712192}, {\"lat\": 40.886519072020896, \"lng\": -73.78139365302036}, {\"lat\": 40.81900047658591, \"lng\": -73.79169333563755}]', 0, 1, 0, 1, 1, 0, 0, '+38971605048', NULL, 1, '', 'We accept Cash On Deliver and direct payments. DEMO PAYMENT', 'test_W7vgVS4bUTVarzBm39wjUk7SRV3Aek', '2024-06-08 16:09:42', 1, NULL, 1, NULL),
(17, '2024-06-08 16:33:22', '2024-08-28 17:46:25', 'McDonald', 'mcdonald', '', '', 1, 35, '51.8881976', '4.582124', '127 Stewart street, Rosebank', '+31620875913', '', 'Cybinix Test', 0.85, 15.00, '{}', 0, NULL, 288, 1, 0, 0, 0, '+31620875913', NULL, 0, 'ZAR', '', '', NULL, 0, 'audios/Y5XShs8ZmboGHBi3hNXLalujiMG228yNJvkuurIi.mp3', 1, 'https://search.google.com/local/writereview?placeid=ChIJN1t_tDeuEmsRUsoyG83frY4'),
(18, '2024-06-19 11:52:58', '2024-06-19 14:12:27', 'Kashif Khan', 'kashifkhan', '', '', 1, 36, '24.920064', '67.0466048', '', '+923203822544', '0', '', 0.00, 0.00, '{}', 0, NULL, 5, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(19, '2024-06-26 22:09:12', '2024-06-26 22:09:12', 'dineAt', 'dineat', '', '', 1, 37, '0', '0', '', '+923305063900', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(20, '2024-06-26 22:55:01', '2024-06-26 22:55:01', 'DiveInn', 'diveinn', '', '', 1, 38, '0', '0', '', '+31612345678', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(21, '2024-06-27 00:22:50', '2024-06-27 00:22:50', 'qwerty', 'qwerty', '', '', 1, 39, '0', '0', '', '+311231312313', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(22, '2024-06-27 00:32:36', '2024-06-27 00:32:37', 'poipoi', 'poipoi', '', '', 1, 40, '0', '0', '', '+31321686812486', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(23, '2024-06-27 00:58:33', '2024-06-27 00:58:33', 'asdasdas', 'asdasdas', '', '', 1, 41, '0', '0', '', '+3112123123123', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(24, '2024-06-27 01:00:49', '2024-06-27 01:00:49', 'abcabcabc', 'abcabcabc', '', '', 1, 42, '0', '0', '', '+31132212312', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(25, '2024-06-27 01:10:29', '2024-06-27 15:29:47', 'qazqaz', 'qazqaz', '', '', 1, 43, '0', '0', '', '+3112312312231', '0', '', 0.00, 0.00, '{}', 0, NULL, 1, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(26, '2024-06-29 21:33:25', '2024-06-29 21:33:25', 'Anser Ishaq', 'anserishaq', '', '', 1, 45, '0', '0', '', '03058589867', '0', 'sfdsf', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(27, '2024-06-29 21:40:07', '2024-06-29 21:40:07', 'dfdfsdf', 'dfdfsdf', '', '', 1, 46, '0', '0', '', '03058589867', '0', 'ghj', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(28, '2024-06-29 21:45:10', '2024-06-29 21:45:29', 'qweqwe', 'qweqwe', '', '', 1, 47, '0', '0', '', '03058589867', '0', 'asdfasfd', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-06-29 21:45:29', 1, NULL, 1, NULL),
(29, '2024-06-29 21:48:50', '2024-06-29 21:48:50', 'tret', 'tret', '', '', 1, 48, '0', '0', '', '+313058589867', '0', 'asdfasfdasfd', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(30, '2024-06-30 03:56:09', '2024-06-30 03:56:09', 'fffffffffff', 'fffffffffff', '', '', 1, 49, '0', '0', '', '+312342423423', '0', 'sfdsf', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(31, '2024-06-30 03:59:21', '2024-06-30 03:59:21', 'jinx', 'jinx', '', '', 1, 50, '0', '0', '', '+311231231231', '0', 'asdasd', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(32, '2024-06-30 04:01:32', '2024-06-30 04:01:32', 'bomb', 'bomb', '', '', 1, 51, '0', '0', '', '+311231123123123', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(33, '2024-06-30 19:48:47', '2024-08-23 13:37:47', 'usa', 'usa', '', '', 1, 52, '0', '0', '', '+31123123123123', '0', 'asdasd asd sas asd', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, NULL, 1, NULL),
(34, '2024-07-20 13:45:26', '2024-08-23 13:28:42', 'KmAs Resturant', 'kmasresturant', '', '', 1, 54, '0', '0', '', '+19744464978', '0', 'Reprehenderit expedi', 0.00, 0.00, '{}', 0, NULL, 1, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-08-23 13:28:42', 1, NULL, 1, NULL),
(35, '2024-08-23 13:43:07', '2024-08-27 18:23:15', 'Lani Daniel', 'lanidaniel', '', '', 1, 60, '0', '0', '', '+19632414367', '0', 'Est enim quisquam iu', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-08-27 18:23:15', 1, NULL, 1, NULL),
(36, '2024-08-25 12:13:05', '2024-08-27 18:23:09', 'Jade Craft', 'jadecraft', '', '', 1, 61, '0', '0', '', '+13417665048', '0', 'Est placeat volupt', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-08-27 18:23:09', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL,
  `key` varchar(191) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `value`, `key`, `model_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, '0', 'disable_callwaiter', 'App\\Restorant', 17, '2024-06-08 16:33:22', '2024-06-08 16:33:22'),
(2, '0', 'disable_ordering', 'App\\Restorant', 17, '2024-06-08 16:33:22', '2024-06-08 16:33:22'),
(3, '1', 'disable_continues_ordering', 'App\\Restorant', 17, '2024-06-08 16:33:22', '2024-06-09 08:39:37'),
(4, '[\"themeswitcher\"]', 'plugins', 'App\\Plans', 2, '2024-06-08 16:40:36', '2024-06-08 16:40:36'),
(5, '[\"sendstatus\",\"themeswitcher\"]', 'plugins', 'App\\Plans', 3, '2024-06-08 16:41:07', '2024-06-08 16:41:07'),
(6, '10', 'time_to_prepare_order_in_minutes', 'App\\Restorant', 17, '2024-06-08 16:48:25', '2024-06-08 16:48:25'),
(7, '30', 'delivery_interval_in_minutes', 'App\\Restorant', 17, '2024-06-08 16:48:25', '2024-06-08 16:48:25'),
(8, 'b13016de-3a68-4293-a1ac-2fb7007a9508', 'resto_wide_logo', 'App\\Restorant', 17, '2024-06-08 16:49:03', '2024-06-08 16:49:03'),
(9, '51bc6726-46a0-44fa-9eea-faf769166dee', 'resto_wide_logo_dark', 'App\\Restorant', 17, '2024-06-08 16:49:03', '2024-06-08 16:49:03'),
(10, NULL, 'SendStatusTemplate1', 'App\\Restorant', 17, '2024-06-08 16:58:00', '2024-06-08 16:58:00'),
(11, NULL, 'SendStatusTemplate2', 'App\\Restorant', 17, '2024-06-08 16:58:02', '2024-06-08 16:58:02'),
(12, NULL, 'SendStatusTemplate3', 'App\\Restorant', 17, '2024-06-08 16:58:02', '2024-06-08 16:58:02'),
(13, NULL, 'SendStatusTemplate4', 'App\\Restorant', 17, '2024-06-08 16:58:02', '2024-06-08 16:58:02'),
(14, NULL, 'SendStatusTemplate5', 'App\\Restorant', 17, '2024-06-08 16:58:02', '2024-06-08 16:58:02'),
(15, 'glow', 'menu_template', 'App\\Restorant', 17, '2024-06-08 16:58:02', '2024-07-20 13:56:57'),
(16, 'false', 'stripe_enable', 'App\\Restorant', 17, '2024-06-08 16:58:02', '2024-06-08 16:58:02'),
(17, NULL, 'stripe_key', 'App\\Restorant', 17, '2024-06-08 16:58:02', '2024-06-08 16:58:02'),
(18, NULL, 'stripe_secret', 'App\\Restorant', 17, '2024-06-08 16:58:02', '2024-06-08 16:58:02'),
(19, '0', 'disable_callwaiter', 'App\\Restorant', 18, '2024-06-19 11:52:59', '2024-06-19 11:52:59'),
(20, '0', 'disable_ordering', 'App\\Restorant', 18, '2024-06-19 11:52:59', '2024-06-19 11:52:59'),
(21, '0', 'disable_callwaiter', 'App\\Restorant', 19, '2024-06-26 22:09:12', '2024-06-26 22:09:12'),
(22, '0', 'disable_ordering', 'App\\Restorant', 19, '2024-06-26 22:09:12', '2024-06-26 22:09:12'),
(23, '0', 'disable_continues_ordering', 'App\\Restorant', 19, '2024-06-26 22:09:12', '2024-06-26 22:09:12'),
(24, '0', 'disable_callwaiter', 'App\\Restorant', 20, '2024-06-26 22:55:01', '2024-06-26 22:55:01'),
(25, '0', 'disable_ordering', 'App\\Restorant', 20, '2024-06-26 22:55:01', '2024-06-26 22:55:01'),
(26, '0', 'disable_callwaiter', 'App\\Restorant', 21, '2024-06-27 00:22:50', '2024-06-27 00:22:50'),
(27, '0', 'disable_ordering', 'App\\Restorant', 21, '2024-06-27 00:22:50', '2024-06-27 00:22:50'),
(28, '0', 'disable_callwaiter', 'App\\Restorant', 22, '2024-06-27 00:32:36', '2024-06-27 00:32:36'),
(29, '0', 'disable_ordering', 'App\\Restorant', 22, '2024-06-27 00:32:37', '2024-06-27 00:32:37'),
(30, '0', 'disable_callwaiter', 'App\\Restorant', 23, '2024-06-27 00:58:33', '2024-06-27 00:58:33'),
(31, '0', 'disable_ordering', 'App\\Restorant', 23, '2024-06-27 00:58:33', '2024-06-27 00:58:33'),
(32, '0', 'disable_callwaiter', 'App\\Restorant', 24, '2024-06-27 01:00:49', '2024-06-27 01:00:49'),
(33, '0', 'disable_ordering', 'App\\Restorant', 24, '2024-06-27 01:00:49', '2024-06-27 01:00:49'),
(34, '0', 'disable_callwaiter', 'App\\Restorant', 25, '2024-06-27 01:10:29', '2024-06-27 01:10:29'),
(35, '0', 'disable_ordering', 'App\\Restorant', 25, '2024-06-27 01:10:29', '2024-06-27 01:10:29'),
(36, '0', 'disable_callwaiter', 'App\\Restorant', 26, '2024-06-29 21:33:25', '2024-06-29 21:33:25'),
(37, '0', 'disable_ordering', 'App\\Restorant', 26, '2024-06-29 21:33:25', '2024-06-29 21:33:25'),
(38, '0', 'disable_continues_ordering', 'App\\Restorant', 26, '2024-06-29 21:33:25', '2024-06-29 21:33:25'),
(39, '0', 'disable_callwaiter', 'App\\Restorant', 27, '2024-06-29 21:40:07', '2024-06-29 21:40:07'),
(40, '0', 'disable_ordering', 'App\\Restorant', 27, '2024-06-29 21:40:07', '2024-06-29 21:40:07'),
(41, '0', 'disable_continues_ordering', 'App\\Restorant', 27, '2024-06-29 21:40:07', '2024-06-29 21:40:07'),
(42, '0', 'disable_callwaiter', 'App\\Restorant', 28, '2024-06-29 21:45:10', '2024-06-29 21:45:10'),
(43, '0', 'disable_ordering', 'App\\Restorant', 28, '2024-06-29 21:45:10', '2024-06-29 21:45:10'),
(44, '0', 'disable_continues_ordering', 'App\\Restorant', 28, '2024-06-29 21:45:10', '2024-06-29 21:45:10'),
(45, '0', 'disable_callwaiter', 'App\\Restorant', 29, '2024-06-29 21:48:50', '2024-06-29 21:48:50'),
(46, '0', 'disable_ordering', 'App\\Restorant', 29, '2024-06-29 21:48:50', '2024-06-29 21:48:50'),
(47, '0', 'disable_continues_ordering', 'App\\Restorant', 29, '2024-06-29 21:48:50', '2024-06-29 21:48:50'),
(48, '0', 'disable_callwaiter', 'App\\Restorant', 30, '2024-06-30 03:56:09', '2024-06-30 03:56:09'),
(49, '0', 'disable_ordering', 'App\\Restorant', 30, '2024-06-30 03:56:09', '2024-06-30 03:56:09'),
(50, '0', 'disable_continues_ordering', 'App\\Restorant', 30, '2024-06-30 03:56:09', '2024-06-30 03:56:09'),
(51, '0', 'disable_callwaiter', 'App\\Restorant', 31, '2024-06-30 03:59:21', '2024-06-30 03:59:21'),
(52, '0', 'disable_ordering', 'App\\Restorant', 31, '2024-06-30 03:59:21', '2024-06-30 03:59:21'),
(53, '0', 'disable_continues_ordering', 'App\\Restorant', 31, '2024-06-30 03:59:21', '2024-06-30 03:59:21'),
(54, '0', 'disable_callwaiter', 'App\\Restorant', 32, '2024-06-30 04:01:32', '2024-06-30 04:01:32'),
(55, '0', 'disable_ordering', 'App\\Restorant', 32, '2024-06-30 04:01:32', '2024-06-30 04:01:32'),
(56, '0', 'disable_continues_ordering', 'App\\Restorant', 32, '2024-06-30 04:01:32', '2024-06-30 04:01:32'),
(57, '0', 'disable_callwaiter', 'App\\Restorant', 33, '2024-06-30 19:48:47', '2024-06-30 19:48:47'),
(58, '0', 'disable_ordering', 'App\\Restorant', 33, '2024-06-30 19:48:47', '2024-06-30 19:48:47'),
(59, '0', 'disable_continues_ordering', 'App\\Restorant', 33, '2024-06-30 19:48:47', '2024-06-30 19:48:47'),
(60, NULL, 'plugins', 'App\\Plans', 1, '2024-07-07 19:46:41', '2024-07-07 19:46:41'),
(61, '[\"paypal\",\"sendstatus\",\"stripelinks\",\"themeswitcher\"]', 'plugins', 'App\\Plans', 4, '2024-07-20 13:29:55', '2024-07-20 13:29:55'),
(62, '0', 'disable_callwaiter', 'App\\Restorant', 34, '2024-07-20 13:45:26', '2024-07-20 13:45:26'),
(63, '0', 'disable_ordering', 'App\\Restorant', 34, '2024-07-20 13:45:26', '2024-07-20 13:45:26'),
(64, '0', 'disable_continues_ordering', 'App\\Restorant', 34, '2024-07-20 13:45:26', '2024-07-20 13:45:26'),
(65, '0', 'disable_callwaiter', 'App\\Restorant', 35, '2024-08-23 13:43:07', '2024-08-23 13:43:07'),
(66, '0', 'disable_ordering', 'App\\Restorant', 35, '2024-08-23 13:43:07', '2024-08-23 13:43:07'),
(67, '0', 'disable_continues_ordering', 'App\\Restorant', 35, '2024-08-23 13:43:07', '2024-08-23 13:43:07'),
(68, '0', 'disable_callwaiter', 'App\\Restorant', 36, '2024-08-25 12:13:05', '2024-08-25 12:13:05'),
(69, '0', 'disable_ordering', 'App\\Restorant', 36, '2024-08-25 12:13:05', '2024-08-25 12:13:05'),
(70, '0', 'disable_continues_ordering', 'App\\Restorant', 36, '2024-08-25 12:13:05', '2024-08-25 12:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(8) NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '0 - Fixed, 1 - Percentage',
  `price` double(8,2) NOT NULL,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL,
  `limit_to_num_uses` int(11) NOT NULL,
  `used_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `amount` double(8,2) NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expenses_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expenses_vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `reference`, `description`, `amount`, `restaurant_id`, `expenses_category_id`, `expenses_vendor_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2024-04-16', 'EXP0', '', 33.00, 1, 1, 1, '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL),
(2, '2024-05-13', 'EXP1', '', 14.00, 1, 2, 1, '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL),
(3, '2024-05-12', 'EXP2', '', 26.00, 1, 1, 3, '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL),
(4, '2024-05-29', 'EXP3', '', 46.00, 1, 1, 1, '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL),
(5, '2024-04-14', 'EXP4', '', 38.00, 1, 2, 2, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(6, '2024-04-28', 'EXP5', '', 29.00, 1, 1, 2, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(7, '2024-06-05', 'EXP6', '', 16.00, 1, 1, 2, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(8, '2024-04-20', 'EXP7', '', 21.00, 1, 2, 3, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(9, '2024-05-02', 'EXP8', '', 25.00, 1, 2, 3, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(10, '2024-05-27', 'EXP9', '', 14.00, 1, 1, 2, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(11, '2024-05-15', 'EXP10', '', 43.00, 1, 2, 2, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(12, '2024-06-08', 'EXP11', '', 39.00, 1, 1, 3, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(13, '2024-04-16', 'EXP12', '', 14.00, 1, 1, 2, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(14, '2024-06-03', 'EXP13', '', 32.00, 1, 1, 3, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(15, '2024-05-19', 'EXP14', '', 45.00, 1, 2, 1, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(16, '2024-05-07', 'EXP15', '', 48.00, 1, 2, 1, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(17, '2024-06-07', 'EXP16', '', 17.00, 1, 1, 3, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(18, '2024-04-22', 'EXP17', '', 50.00, 1, 1, 1, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(19, '2024-04-19', 'EXP18', '', 38.00, 1, 1, 3, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL),
(20, '2024-06-08', 'EXP19', '', 43.00, 1, 2, 3, '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses_category`
--

CREATE TABLE `expenses_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses_category`
--

INSERT INTO `expenses_category` (`id`, `name`, `code`, `restaurant_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Suppliers', 'C1', 1, NULL, NULL, NULL),
(2, 'Utilities', 'C2', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses_vendor`
--

CREATE TABLE `expenses_vendor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses_vendor`
--

INSERT INTO `expenses_vendor` (`id`, `name`, `code`, `restaurant_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Supplier 1', 'S1', 1, NULL, NULL, NULL),
(2, 'Supplier 2', 'S2', 1, NULL, NULL, NULL),
(3, 'Supplier 3', 'S3', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `extra_for_all_variants` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `item_id`, `price`, `name`, `created_at`, `updated_at`, `deleted_at`, `extra_for_all_variants`) VALUES
(1, 1, 1.20, 'Extra cheese', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(2, 1, 0.30, 'Extra olives', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(3, 1, 1.50, 'Tuna', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(4, 2, 1.20, 'Extra cheese', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(5, 2, 0.30, 'Extra olives', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(6, 2, 1.50, 'Tuna', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(7, 3, 1.20, 'Extra cheese', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(8, 3, 0.30, 'Extra olives', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(9, 3, 1.50, 'Tuna', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(10, 4, 1.20, 'Extra cheese', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(11, 4, 0.30, 'Extra olives', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(12, 4, 1.50, 'Tuna', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(13, 5, 1.20, 'Extra cheese', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(14, 5, 0.30, 'Extra olives', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(15, 5, 1.50, 'Tuna', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(16, 6, 1.20, 'Extra cheese', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(17, 6, 0.30, 'Extra olives', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(18, 6, 1.50, 'Tuna', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(19, 7, 1.00, 'Olive', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(20, 7, 0.50, 'Mushroom', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(21, 7, 2.00, 'Peperoni', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(22, 7, 1.00, 'Peperoni', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(23, 8, 1.00, 'Olive', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(24, 8, 0.50, 'Mushroom', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 1),
(25, 8, 2.00, 'Peperoni', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(26, 8, 1.00, 'Peperoni', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(27, 9, 1.00, 'Olive', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 1),
(28, 9, 0.50, 'Mushroom', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 1),
(29, 9, 2.00, 'Peperoni', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(30, 9, 1.00, 'Peperoni', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(31, 10, 1.00, 'Olive', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 1),
(32, 10, 0.50, 'Mushroom', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 1),
(33, 10, 2.00, 'Peperoni', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(34, 10, 1.00, 'Peperoni', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(35, 11, 1.00, 'Olive', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 1),
(36, 11, 0.50, 'Mushroom', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 1),
(37, 11, 2.00, 'Peperoni', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(38, 11, 1.00, 'Peperoni', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(39, 12, 1.00, 'Olive', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 1),
(40, 12, 0.50, 'Mushroom', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 1),
(41, 12, 2.00, 'Peperoni', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(42, 12, 1.00, 'Peperoni', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(43, 13, 1.00, 'Olive', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 1),
(44, 13, 0.50, 'Mushroom', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 1),
(45, 13, 2.00, 'Peperoni', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(46, 13, 1.00, 'Peperoni', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(47, 14, 1.00, 'Olive', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 1),
(48, 14, 0.50, 'Mushroom', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 1),
(49, 14, 2.00, 'Peperoni', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(50, 14, 1.00, 'Peperoni', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(51, 15, 1.00, 'Olive', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 1),
(52, 15, 0.50, 'Mushroom', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 1),
(53, 15, 2.00, 'Peperoni', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(54, 15, 1.00, 'Peperoni', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(55, 16, 1.00, 'Olive', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 1),
(56, 16, 0.50, 'Mushroom', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 1),
(57, 16, 2.00, 'Peperoni', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(58, 16, 1.00, 'Peperoni', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(59, 17, 1.00, 'Olive', '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 1),
(60, 17, 0.50, 'Mushroom', '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 1),
(61, 17, 2.00, 'Peperoni', '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(62, 17, 1.00, 'Peperoni', '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(63, 61, 1.20, 'Extra cheese', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(64, 61, 0.30, 'Extra olives', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(65, 61, 1.50, 'Tuna', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(66, 62, 1.20, 'Extra cheese', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(67, 62, 0.30, 'Extra olives', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(68, 62, 1.50, 'Tuna', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(69, 63, 1.20, 'Extra cheese', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(70, 63, 0.30, 'Extra olives', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(71, 63, 1.50, 'Tuna', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(72, 64, 1.20, 'Extra cheese', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(73, 64, 0.30, 'Extra olives', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(74, 64, 1.50, 'Tuna', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(75, 65, 1.20, 'Extra cheese', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(76, 65, 0.30, 'Extra olives', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(77, 65, 1.50, 'Tuna', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(78, 66, 1.20, 'Extra cheese', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(79, 66, 0.30, 'Extra olives', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(80, 66, 1.50, 'Tuna', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(81, 67, 1.00, 'Olive', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(82, 67, 0.50, 'Mushroom', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 1),
(83, 67, 2.00, 'Peperoni', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 0),
(84, 67, 1.00, 'Peperoni', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL, 0),
(85, 68, 1.00, 'Olive', '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 1),
(86, 68, 0.50, 'Mushroom', '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 1),
(87, 68, 2.00, 'Peperoni', '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(88, 68, 1.00, 'Peperoni', '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(89, 69, 1.00, 'Olive', '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 1),
(90, 69, 0.50, 'Mushroom', '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 1),
(91, 69, 2.00, 'Peperoni', '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(92, 69, 1.00, 'Peperoni', '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(93, 70, 1.00, 'Olive', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 1),
(94, 70, 0.50, 'Mushroom', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 1),
(95, 70, 2.00, 'Peperoni', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(96, 70, 1.00, 'Peperoni', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(97, 71, 1.00, 'Olive', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 1),
(98, 71, 0.50, 'Mushroom', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 1),
(99, 71, 2.00, 'Peperoni', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(100, 71, 1.00, 'Peperoni', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(101, 72, 1.00, 'Olive', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 1),
(102, 72, 0.50, 'Mushroom', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 1),
(103, 72, 2.00, 'Peperoni', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(104, 72, 1.00, 'Peperoni', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(105, 73, 1.00, 'Olive', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 1),
(106, 73, 0.50, 'Mushroom', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 1),
(107, 73, 2.00, 'Peperoni', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(108, 73, 1.00, 'Peperoni', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(109, 74, 1.00, 'Olive', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 1),
(110, 74, 0.50, 'Mushroom', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 1),
(111, 74, 2.00, 'Peperoni', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(112, 74, 1.00, 'Peperoni', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(113, 75, 1.00, 'Olive', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 1),
(114, 75, 0.50, 'Mushroom', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 1),
(115, 75, 2.00, 'Peperoni', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(116, 75, 1.00, 'Peperoni', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(117, 76, 1.00, 'Olive', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 1),
(118, 76, 0.50, 'Mushroom', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 1),
(119, 76, 2.00, 'Peperoni', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(120, 76, 1.00, 'Peperoni', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(121, 77, 1.00, 'Olive', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 1),
(122, 77, 0.50, 'Mushroom', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 1),
(123, 77, 2.00, 'Peperoni', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(124, 77, 1.00, 'Peperoni', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(125, 86, 1.20, 'Extra cheese', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(126, 86, 0.30, 'Extra olives', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(127, 86, 1.50, 'Tuna', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(128, 87, 1.20, 'Extra cheese', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(129, 87, 0.30, 'Extra olives', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(130, 87, 1.50, 'Tuna', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(131, 88, 1.20, 'Extra cheese', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(132, 88, 0.30, 'Extra olives', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(133, 88, 1.50, 'Tuna', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(134, 89, 1.20, 'Extra cheese', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(135, 89, 0.30, 'Extra olives', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(136, 89, 1.50, 'Tuna', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(137, 90, 1.20, 'Extra cheese', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(138, 90, 0.30, 'Extra olives', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(139, 90, 1.50, 'Tuna', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(140, 91, 1.20, 'Extra cheese', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(141, 91, 0.30, 'Extra olives', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(142, 91, 1.50, 'Tuna', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(143, 95, 1.00, 'Olive', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(144, 95, 0.50, 'Mushroom', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(145, 95, 2.00, 'Peperoni', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(146, 95, 1.00, 'Peperoni', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(147, 96, 1.00, 'Olive', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(148, 96, 0.50, 'Mushroom', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 1),
(149, 96, 2.00, 'Peperoni', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(150, 96, 1.00, 'Peperoni', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(151, 97, 1.00, 'Olive', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 1),
(152, 97, 0.50, 'Mushroom', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 1),
(153, 97, 2.00, 'Peperoni', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(154, 97, 1.00, 'Peperoni', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(155, 98, 1.00, 'Olive', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 1),
(156, 98, 0.50, 'Mushroom', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 1),
(157, 98, 2.00, 'Peperoni', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(158, 98, 1.00, 'Peperoni', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(159, 99, 1.00, 'Olive', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 1),
(160, 99, 0.50, 'Mushroom', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 1),
(161, 99, 2.00, 'Peperoni', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(162, 99, 1.00, 'Peperoni', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(163, 100, 1.00, 'Olive', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 1),
(164, 100, 0.50, 'Mushroom', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 1),
(165, 100, 2.00, 'Peperoni', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(166, 100, 1.00, 'Peperoni', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(167, 101, 1.00, 'Olive', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 1),
(168, 101, 0.50, 'Mushroom', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 1),
(169, 101, 2.00, 'Peperoni', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(170, 101, 1.00, 'Peperoni', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(171, 102, 1.00, 'Olive', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 1),
(172, 102, 0.50, 'Mushroom', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 1),
(173, 102, 2.00, 'Peperoni', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(174, 102, 1.00, 'Peperoni', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(175, 103, 1.00, 'Olive', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 1),
(176, 103, 0.50, 'Mushroom', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 1),
(177, 103, 2.00, 'Peperoni', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(178, 103, 1.00, 'Peperoni', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(179, 104, 1.00, 'Olive', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 1),
(180, 104, 0.50, 'Mushroom', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 1),
(181, 104, 2.00, 'Peperoni', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(182, 104, 1.00, 'Peperoni', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(183, 105, 1.00, 'Olive', '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 1),
(184, 105, 0.50, 'Mushroom', '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 1),
(185, 105, 2.00, 'Peperoni', '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(186, 105, 1.00, 'Peperoni', '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(187, 150, 1.00, 'Olive', '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL, 1),
(188, 150, 0.50, 'Mushroom', '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL, 1),
(189, 150, 2.00, 'Peperoni', '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL, 0),
(190, 150, 1.00, 'Peperoni', '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL, 0),
(191, 151, 1.00, 'Olive', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 1),
(192, 151, 0.50, 'Mushroom', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 1),
(193, 151, 2.00, 'Peperoni', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(194, 151, 1.00, 'Peperoni', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(195, 152, 1.00, 'Olive', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 1),
(196, 152, 0.50, 'Mushroom', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 1),
(197, 152, 2.00, 'Peperoni', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(198, 152, 1.00, 'Peperoni', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(199, 153, 1.00, 'Olive', '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 1),
(200, 153, 0.50, 'Mushroom', '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 1),
(201, 153, 2.00, 'Peperoni', '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(202, 153, 1.00, 'Peperoni', '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(203, 154, 1.00, 'Olive', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 1),
(204, 154, 0.50, 'Mushroom', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 1),
(205, 154, 2.00, 'Peperoni', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(206, 154, 1.00, 'Peperoni', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(207, 155, 1.00, 'Olive', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 1),
(208, 155, 0.50, 'Mushroom', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 1),
(209, 155, 2.00, 'Peperoni', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(210, 155, 1.00, 'Peperoni', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(211, 156, 1.00, 'Olive', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 1),
(212, 156, 0.50, 'Mushroom', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 1),
(213, 156, 2.00, 'Peperoni', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(214, 156, 1.00, 'Peperoni', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(215, 157, 1.00, 'Olive', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 1),
(216, 157, 0.50, 'Mushroom', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 1),
(217, 157, 2.00, 'Peperoni', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(218, 157, 1.00, 'Peperoni', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(219, 158, 1.00, 'Olive', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 1),
(220, 158, 0.50, 'Mushroom', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 1),
(221, 158, 2.00, 'Peperoni', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(222, 158, 1.00, 'Peperoni', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(223, 159, 1.00, 'Olive', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 1),
(224, 159, 0.50, 'Mushroom', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 1),
(225, 159, 2.00, 'Peperoni', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(226, 159, 1.00, 'Peperoni', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(227, 160, 1.00, 'Olive', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 1),
(228, 160, 0.50, 'Mushroom', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 1),
(229, 160, 2.00, 'Peperoni', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(230, 160, 1.00, 'Peperoni', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(231, 165, 1.20, 'Extra cheese', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(232, 165, 0.30, 'Extra olives', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(233, 165, 1.50, 'Tuna', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(234, 166, 1.20, 'Extra cheese', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(235, 166, 0.30, 'Extra olives', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(236, 166, 1.50, 'Tuna', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(237, 167, 1.20, 'Extra cheese', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(238, 167, 0.30, 'Extra olives', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(239, 167, 1.50, 'Tuna', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(240, 168, 1.20, 'Extra cheese', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(241, 168, 0.30, 'Extra olives', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(242, 168, 1.50, 'Tuna', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(243, 169, 1.20, 'Extra cheese', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(244, 169, 0.30, 'Extra olives', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(245, 169, 1.50, 'Tuna', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(246, 170, 1.20, 'Extra cheese', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(247, 170, 0.30, 'Extra olives', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(248, 170, 1.50, 'Tuna', '2024-06-08 15:57:22', '2024-06-08 15:57:22', NULL, 1),
(249, 174, 1.00, 'Olive', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 1),
(250, 174, 0.50, 'Mushroom', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 1),
(251, 174, 2.00, 'Peperoni', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(252, 174, 1.00, 'Peperoni', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(253, 175, 1.00, 'Olive', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 1),
(254, 175, 0.50, 'Mushroom', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 1),
(255, 175, 2.00, 'Peperoni', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(256, 175, 1.00, 'Peperoni', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(257, 176, 1.00, 'Olive', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 1),
(258, 176, 0.50, 'Mushroom', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 1),
(259, 176, 2.00, 'Peperoni', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(260, 176, 1.00, 'Peperoni', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(261, 177, 1.00, 'Olive', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 1),
(262, 177, 0.50, 'Mushroom', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 1),
(263, 177, 2.00, 'Peperoni', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(264, 177, 1.00, 'Peperoni', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(265, 178, 1.00, 'Olive', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 1),
(266, 178, 0.50, 'Mushroom', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 1),
(267, 178, 2.00, 'Peperoni', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(268, 178, 1.00, 'Peperoni', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(269, 179, 1.00, 'Olive', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 1),
(270, 179, 0.50, 'Mushroom', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 1),
(271, 179, 2.00, 'Peperoni', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(272, 179, 1.00, 'Peperoni', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(273, 180, 1.00, 'Olive', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 1),
(274, 180, 0.50, 'Mushroom', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 1),
(275, 180, 2.00, 'Peperoni', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(276, 180, 1.00, 'Peperoni', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(277, 181, 1.00, 'Olive', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 1),
(278, 181, 0.50, 'Mushroom', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 1),
(279, 181, 2.00, 'Peperoni', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(280, 181, 1.00, 'Peperoni', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(281, 182, 1.00, 'Olive', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 1),
(282, 182, 0.50, 'Mushroom', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 1),
(283, 182, 2.00, 'Peperoni', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(284, 182, 1.00, 'Peperoni', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(285, 183, 1.00, 'Olive', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 1),
(286, 183, 0.50, 'Mushroom', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 1),
(287, 183, 2.00, 'Peperoni', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(288, 183, 1.00, 'Peperoni', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(289, 184, 1.00, 'Olive', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(290, 184, 0.50, 'Mushroom', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(291, 184, 2.00, 'Peperoni', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(292, 184, 1.00, 'Peperoni', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(293, 185, 1.20, 'Extra cheese', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(294, 185, 0.30, 'Extra olives', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(295, 185, 1.50, 'Tuna', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(296, 186, 1.20, 'Extra cheese', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(297, 186, 0.30, 'Extra olives', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(298, 186, 1.50, 'Tuna', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(299, 187, 1.20, 'Extra cheese', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(300, 187, 0.30, 'Extra olives', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(301, 187, 1.50, 'Tuna', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(302, 188, 1.20, 'Extra cheese', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(303, 188, 0.30, 'Extra olives', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(304, 188, 1.50, 'Tuna', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(305, 189, 1.20, 'Extra cheese', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(306, 189, 0.30, 'Extra olives', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(307, 189, 1.50, 'Tuna', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 1),
(308, 190, 1.20, 'Extra cheese', '2024-06-08 15:57:28', '2024-06-08 15:57:28', NULL, 1),
(309, 190, 0.30, 'Extra olives', '2024-06-08 15:57:28', '2024-06-08 15:57:28', NULL, 1),
(310, 190, 1.50, 'Tuna', '2024-06-08 15:57:28', '2024-06-08 15:57:28', NULL, 1),
(311, 235, 1.20, 'Extra cheese', '2024-06-08 15:57:31', '2024-06-08 15:57:31', NULL, 1),
(312, 235, 0.30, 'Extra olives', '2024-06-08 15:57:31', '2024-06-08 15:57:31', NULL, 1),
(313, 235, 1.50, 'Tuna', '2024-06-08 15:57:31', '2024-06-08 15:57:31', NULL, 1),
(314, 236, 1.20, 'Extra cheese', '2024-06-08 15:57:31', '2024-06-08 15:57:31', NULL, 1),
(315, 236, 0.30, 'Extra olives', '2024-06-08 15:57:31', '2024-06-08 15:57:31', NULL, 1),
(316, 236, 1.50, 'Tuna', '2024-06-08 15:57:31', '2024-06-08 15:57:31', NULL, 1),
(317, 237, 1.20, 'Extra cheese', '2024-06-08 15:57:31', '2024-06-08 15:57:31', NULL, 1),
(318, 237, 0.30, 'Extra olives', '2024-06-08 15:57:31', '2024-06-08 15:57:31', NULL, 1),
(319, 237, 1.50, 'Tuna', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(320, 238, 1.20, 'Extra cheese', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(321, 238, 0.30, 'Extra olives', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(322, 238, 1.50, 'Tuna', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(323, 239, 1.20, 'Extra cheese', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(324, 239, 0.30, 'Extra olives', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(325, 239, 1.50, 'Tuna', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(326, 240, 1.20, 'Extra cheese', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(327, 240, 0.30, 'Extra olives', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(328, 240, 1.50, 'Tuna', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(329, 245, 1.00, 'Olive', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(330, 245, 0.50, 'Mushroom', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 1),
(331, 245, 2.00, 'Peperoni', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(332, 245, 1.00, 'Peperoni', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(333, 246, 1.00, 'Olive', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 1),
(334, 246, 0.50, 'Mushroom', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 1),
(335, 246, 2.00, 'Peperoni', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(336, 246, 1.00, 'Peperoni', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(337, 247, 1.00, 'Olive', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 1),
(338, 247, 0.50, 'Mushroom', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 1),
(339, 247, 2.00, 'Peperoni', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(340, 247, 1.00, 'Peperoni', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(341, 248, 1.00, 'Olive', '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 1),
(342, 248, 0.50, 'Mushroom', '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 1),
(343, 248, 2.00, 'Peperoni', '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(344, 248, 1.00, 'Peperoni', '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(345, 249, 1.00, 'Olive', '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 1),
(346, 249, 0.50, 'Mushroom', '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 1),
(347, 249, 2.00, 'Peperoni', '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(348, 249, 1.00, 'Peperoni', '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(349, 250, 1.00, 'Olive', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 1),
(350, 250, 0.50, 'Mushroom', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 1),
(351, 250, 2.00, 'Peperoni', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(352, 250, 1.00, 'Peperoni', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(353, 251, 1.00, 'Olive', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 1),
(354, 251, 0.50, 'Mushroom', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 1),
(355, 251, 2.00, 'Peperoni', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(356, 251, 1.00, 'Peperoni', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(357, 252, 1.00, 'Olive', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 1),
(358, 252, 0.50, 'Mushroom', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 1),
(359, 252, 2.00, 'Peperoni', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(360, 252, 1.00, 'Peperoni', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(361, 253, 1.00, 'Olive', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 1),
(362, 253, 0.50, 'Mushroom', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 1),
(363, 253, 2.00, 'Peperoni', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(364, 253, 1.00, 'Peperoni', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(365, 254, 1.00, 'Olive', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 1),
(366, 254, 0.50, 'Mushroom', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 1),
(367, 254, 2.00, 'Peperoni', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(368, 254, 1.00, 'Peperoni', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(369, 255, 1.00, 'Olive', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 1),
(370, 255, 0.50, 'Mushroom', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 1),
(371, 255, 2.00, 'Peperoni', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(372, 255, 1.00, 'Peperoni', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(373, 256, 1.00, 'Olive', '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL, 1),
(374, 256, 0.50, 'Mushroom', '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL, 1),
(375, 256, 2.00, 'Peperoni', '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL, 0),
(376, 256, 1.00, 'Peperoni', '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL, 0),
(377, 257, 1.00, 'Olive', '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 1),
(378, 257, 0.50, 'Mushroom', '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 1),
(379, 257, 2.00, 'Peperoni', '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(380, 257, 1.00, 'Peperoni', '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(381, 258, 1.00, 'Olive', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 1),
(382, 258, 0.50, 'Mushroom', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 1),
(383, 258, 2.00, 'Peperoni', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(384, 258, 1.00, 'Peperoni', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(385, 259, 1.00, 'Olive', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 1),
(386, 259, 0.50, 'Mushroom', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 1),
(387, 259, 2.00, 'Peperoni', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(388, 259, 1.00, 'Peperoni', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(389, 260, 1.00, 'Olive', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 1),
(390, 260, 0.50, 'Mushroom', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 1),
(391, 260, 2.00, 'Peperoni', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(392, 260, 1.00, 'Peperoni', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(393, 261, 1.00, 'Olive', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 1),
(394, 261, 0.50, 'Mushroom', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 1),
(395, 261, 2.00, 'Peperoni', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(396, 261, 1.00, 'Peperoni', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(397, 262, 1.00, 'Olive', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 1),
(398, 262, 0.50, 'Mushroom', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 1),
(399, 262, 2.00, 'Peperoni', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(400, 262, 1.00, 'Peperoni', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(401, 263, 1.00, 'Olive', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 1),
(402, 263, 0.50, 'Mushroom', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 1),
(403, 263, 2.00, 'Peperoni', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(404, 263, 1.00, 'Peperoni', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(405, 264, 1.00, 'Olive', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 1),
(406, 264, 0.50, 'Mushroom', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 1),
(407, 264, 2.00, 'Peperoni', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(408, 264, 1.00, 'Peperoni', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(409, 265, 1.00, 'Olive', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 1),
(410, 265, 0.50, 'Mushroom', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 1),
(411, 265, 2.00, 'Peperoni', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(412, 265, 1.00, 'Peperoni', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(413, 266, 1.00, 'Olive', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(414, 266, 0.50, 'Mushroom', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(415, 266, 2.00, 'Peperoni', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(416, 266, 1.00, 'Peperoni', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(417, 267, 1.20, 'Extra cheese', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(418, 267, 0.30, 'Extra olives', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(419, 267, 1.50, 'Tuna', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(420, 268, 1.20, 'Extra cheese', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(421, 268, 0.30, 'Extra olives', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(422, 268, 1.50, 'Tuna', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(423, 269, 1.20, 'Extra cheese', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(424, 269, 0.30, 'Extra olives', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(425, 269, 1.50, 'Tuna', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(426, 270, 1.20, 'Extra cheese', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(427, 270, 0.30, 'Extra olives', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(428, 270, 1.50, 'Tuna', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(429, 271, 1.20, 'Extra cheese', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(430, 271, 0.30, 'Extra olives', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(431, 271, 1.50, 'Tuna', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(432, 272, 1.20, 'Extra cheese', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(433, 272, 0.30, 'Extra olives', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(434, 272, 1.50, 'Tuna', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 1),
(435, 316, 1.00, 'Olive', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 1),
(436, 316, 0.50, 'Mushroom', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 1),
(437, 316, 2.00, 'Peperoni', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(438, 316, 1.00, 'Peperoni', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(439, 317, 1.00, 'Olive', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 1),
(440, 317, 0.50, 'Mushroom', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 1),
(441, 317, 2.00, 'Peperoni', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(442, 317, 1.00, 'Peperoni', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(443, 318, 1.00, 'Olive', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 1),
(444, 318, 0.50, 'Mushroom', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 1),
(445, 318, 2.00, 'Peperoni', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(446, 318, 1.00, 'Peperoni', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(447, 319, 1.00, 'Olive', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 1),
(448, 319, 0.50, 'Mushroom', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 1),
(449, 319, 2.00, 'Peperoni', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(450, 319, 1.00, 'Peperoni', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(451, 320, 1.00, 'Olive', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 1),
(452, 320, 0.50, 'Mushroom', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 1),
(453, 320, 2.00, 'Peperoni', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(454, 320, 1.00, 'Peperoni', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(455, 321, 1.00, 'Olive', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 1),
(456, 321, 0.50, 'Mushroom', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 1),
(457, 321, 2.00, 'Peperoni', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(458, 321, 1.00, 'Peperoni', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(459, 322, 1.00, 'Olive', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 1),
(460, 322, 0.50, 'Mushroom', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 1),
(461, 322, 2.00, 'Peperoni', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(462, 322, 1.00, 'Peperoni', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(463, 323, 1.00, 'Olive', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 1),
(464, 323, 0.50, 'Mushroom', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 1),
(465, 323, 2.00, 'Peperoni', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(466, 323, 1.00, 'Peperoni', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(467, 324, 1.00, 'Olive', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 1),
(468, 324, 0.50, 'Mushroom', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 1),
(469, 324, 2.00, 'Peperoni', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(470, 324, 1.00, 'Peperoni', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(471, 325, 1.00, 'Olive', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 1),
(472, 325, 0.50, 'Mushroom', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 1),
(473, 325, 2.00, 'Peperoni', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(474, 325, 1.00, 'Peperoni', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(475, 326, 1.00, 'Olive', '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 1),
(476, 326, 0.50, 'Mushroom', '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 1),
(477, 326, 2.00, 'Peperoni', '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(478, 326, 1.00, 'Peperoni', '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(479, 331, 1.20, 'Extra cheese', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(480, 331, 0.30, 'Extra olives', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(481, 331, 1.50, 'Tuna', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(482, 332, 1.20, 'Extra cheese', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(483, 332, 0.30, 'Extra olives', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(484, 332, 1.50, 'Tuna', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(485, 333, 1.20, 'Extra cheese', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(486, 333, 0.30, 'Extra olives', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(487, 333, 1.50, 'Tuna', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(488, 334, 1.20, 'Extra cheese', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(489, 334, 0.30, 'Extra olives', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(490, 334, 1.50, 'Tuna', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(491, 335, 1.20, 'Extra cheese', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(492, 335, 0.30, 'Extra olives', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(493, 335, 1.50, 'Tuna', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(494, 336, 1.20, 'Extra cheese', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(495, 336, 0.30, 'Extra olives', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(496, 336, 1.50, 'Tuna', '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 1),
(497, 341, 100.00, 'Cheese', '2024-07-06 17:15:36', '2024-08-02 06:58:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `fields`, `created_at`, `updated_at`) VALUES
(2, 'Individual', NULL, '2024-08-25 12:04:54', '2024-08-25 12:07:22'),
(3, 'Group 1', NULL, '2024-08-25 12:08:46', '2024-08-25 12:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `0_from` varchar(191) DEFAULT NULL,
  `0_to` varchar(191) DEFAULT NULL,
  `1_from` varchar(191) DEFAULT NULL,
  `1_to` varchar(191) DEFAULT NULL,
  `2_from` varchar(191) DEFAULT NULL,
  `2_to` varchar(191) DEFAULT NULL,
  `3_from` varchar(191) DEFAULT NULL,
  `3_to` varchar(191) DEFAULT NULL,
  `4_from` varchar(191) DEFAULT NULL,
  `4_to` varchar(191) DEFAULT NULL,
  `5_from` varchar(191) DEFAULT NULL,
  `5_to` varchar(191) DEFAULT NULL,
  `6_from` varchar(191) DEFAULT NULL,
  `6_to` varchar(191) DEFAULT NULL,
  `restorant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`id`, `created_at`, `updated_at`, `0_from`, `0_to`, `1_from`, `1_to`, `2_from`, `2_to`, `3_from`, `3_to`, `4_from`, `4_to`, `5_from`, `5_to`, `6_from`, `6_to`, `restorant_id`) VALUES
(1, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 1),
(2, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 2),
(3, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 3),
(4, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 4),
(5, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 5),
(6, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 6),
(7, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 7),
(8, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 8),
(9, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 9),
(10, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 10),
(11, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 11),
(12, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 12),
(13, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 13),
(14, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 14),
(15, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 15),
(16, NULL, NULL, '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', '00:01', '23:58', 16),
(17, '2024-06-08 16:33:22', '2024-06-08 16:54:03', '09:00', '00:01', '00:01', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 17),
(18, '2024-06-19 11:52:59', '2024-06-19 11:52:59', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 18),
(19, '2024-06-26 22:09:12', '2024-06-26 22:09:12', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 19),
(20, '2024-06-26 22:55:01', '2024-06-26 22:55:01', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 20),
(21, '2024-06-27 00:22:50', '2024-06-27 00:22:50', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 21),
(22, '2024-06-27 00:32:36', '2024-06-27 00:32:36', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 22),
(23, '2024-06-27 00:58:33', '2024-06-27 00:58:33', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 23),
(24, '2024-06-27 01:00:49', '2024-06-27 01:00:49', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 24),
(25, '2024-06-27 01:10:29', '2024-06-27 01:10:29', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 25),
(26, '2024-06-29 21:33:25', '2024-06-29 21:33:25', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 26),
(27, '2024-06-29 21:40:07', '2024-06-29 21:40:07', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 27),
(28, '2024-06-29 21:45:10', '2024-06-29 21:45:10', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 28),
(29, '2024-06-29 21:48:50', '2024-06-29 21:48:50', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 29),
(30, '2024-06-30 03:56:09', '2024-06-30 03:56:09', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 30),
(31, '2024-06-30 03:59:21', '2024-06-30 03:59:21', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 31),
(32, '2024-06-30 04:01:32', '2024-06-30 04:01:32', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 32),
(33, '2024-06-30 19:48:47', '2024-06-30 19:48:47', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 33),
(34, '2024-07-20 13:45:26', '2024-07-20 13:45:26', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 34),
(35, '2024-08-23 13:43:07', '2024-08-23 13:43:07', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 35),
(36, '2024-08-25 12:13:05', '2024-08-25 12:13:05', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 36);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `image` varchar(191) NOT NULL,
  `price` double(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `has_variants` int(11) NOT NULL DEFAULT 0,
  `vat` double(8,2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `enable_system_variants` int(11) NOT NULL DEFAULT 0,
  `discounted_price` double(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 1,
  `qty_management` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `price`, `category_id`, `created_at`, `updated_at`, `available`, `has_variants`, `vat`, `deleted_at`, `enable_system_variants`, `discounted_price`, `qty`, `qty_management`) VALUES
(1, 'Caprese Salad (350gr)', 'peeled tomatoes, mozzarella salad, Genovese pesto', 'https://foodtiger.mobidonia.com/uploads/restorants/bd5292e7-e898-479d-8921-4c47a776ba82', 9.99, 1, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(2, 'Caesar Salad (400g)', 'iceberg, bacon, chicken breast, parmesan, Caesar sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/25ed56dc-45cc-473f-ad00-d4b449acc71a', 10.99, 1, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(3, 'Salad Napoli (350g)', 'iceberg, arugula, cherry tomatoes, mozzarella salad, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/93641a19-dba6-4010-a852-0e88da83a01f', 9.99, 1, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(4, 'Green tuna salad (400g)', 'lettuce, cucumbers, tuna, olive, corn, lemon, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/d3379607-df34-4ed0-8f87-8bb6f73ed16d', 9.99, 1, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(5, 'Green salad (350g)', 'lettuce, cucumbers, radishes, onions, egg, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/2e7eb9a6-5307-4ec7-8cf8-86490d4c2363', 7.99, 1, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(6, 'Greek Salad (500g)', 'tomatoes, cucumbers, green pepper, red onion, olive, feta cheese, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f5a8b88d-9b94-44fc-9555-2f0fe043d624', 9.99, 1, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(7, 'Mozzarella Pizza', 'tomato sauce, mozzarella sabelli, cherry tomatoes, olives, pesto sauce, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8', 10.99, 2, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(8, 'Prosciutto crust pizza', 'tomato sauce, mozzarella sabelli, prosciutto, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9b9886cb-5d4b-4bfe-a02a-dc3b94dae706', 14.99, 2, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(9, 'Pepperoni Pizza', 'tomato sauce, mozzarella Sabelli, Calabro salad (spicy), extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/4b26647d-52b8-43c5-8b62-708c99252c24', 14.99, 2, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(10, 'Carriola Pizza', 'tomato sauce, mozzarella sabelli, bacon, red onion, olives, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/e1e5559a-ca6d-4a34-80c6-b72c31d97d96', 14.99, 2, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(11, 'Perugia Pizza', 'tomato sauce, mozzarella sabelli, chicken fillet, red onion, fresh peppers, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/a8e8c22a-84cd-48d0-971a-2c98e695e387', 14.99, 2, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(12, 'Pizza Napoli', 'tomato sauce, mozzarella sabelli, ham, cherry tomatoes, emmental, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/5c8fa7eb-bc11-42e1-a1a5-ffb0b3d7a6b7', 14.99, 2, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(13, 'Margarita Pizza', 'tomato sauce, mozzarella Sabelli, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', 10.49, 2, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(14, 'Combo Pizza 50/50 (70cm)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cb7372d0-73a8-4551-bc31-22035d9551c4', 39.99, 2, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(15, 'Capricciosa Pizza', 'tomato sauce, mozzarella sabelli, ham, fresh mushrooms, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', 14.99, 2, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(16, 'Quattro Formaggi Pizza', 'cream (animal), mozzarella Sabelli, blue cheese, emmental, parmesan, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0054144d-131c-4807-a209-cee855415182', 14.99, 2, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(17, 'Marco Polo Pizza', 'tomato sauce, Sabelli mozzarella, chicken fillet, smoked cheese, corn, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f77218a9-676e-434e-ac5b-4ae3dc5795b3', 14.99, 2, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(18, 'Spaghetti Carbonara (450g)', 'fresh pasta, cream (animal), onion, pancakes (smoked bacon), egg, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/b65d5389-4742-4a78-9d94-f31110984db6', 11.99, 3, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(19, 'Spaghetti Formaggi (450g)', 'fresh pasta, cream (animal), blue cheese, emmental, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/4a2067cb-f39c-4b26-83ef-9097512d3328', 11.99, 3, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(20, 'Tagliatelle with mushrooms (400g)', 'fresh pasta, cream (animal), mushrooms, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/0bae6238-dda6-4630-b300-5125fde865d4', 11.99, 3, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(21, 'Chicken risotto (450g)', 'Arborio rice, chicken breast, onion, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/033c32c1-cdae-495e-910f-66b5fa239297', 11.99, 3, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(22, 'Risotto with mushrooms (450g)', 'Arborio rice, mushrooms, garlic, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/08d82944-f947-48f4-a197-a3199bb3b6e7', 11.99, 3, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(23, 'Tagliatelle with Bolognese Sauce (400g)', 'fresh pasta, bolognese sauce, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/cc695ba9-8af3-47a4-8e41-dc1706cbf2c3', 11.99, 3, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(24, 'Lasagna Classic (450g)', 'Bolognese sauce, mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/94d44523-ec90-4069-bd11-eb9588207c31', 11.99, 4, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(25, 'Napoli Lasagna (450g)', 'chicken fillet, cream (animal), corn, blue cheese, mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/4c367950-992c-4711-ab56-42bed10de86c', 11.99, 4, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(26, 'Lasagna Formagio (450g)', 'smoked cheese, blue cheese, emmental, cream (animal), mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/8bafc3ec-82e7-46f8-964a-77a13e4ddf96', 11.99, 4, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(27, 'Wild Wild West', 'freshly baked brioche bread, 100% freshly ground beef Limousine, crispy bacon, melted cheddar, brewed in Skapto beer onion rings, homemade BBQ sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/c8d27bcc-54da-4c18-b8e6-f1414c71612c', 8.99, 5, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(28, 'Skapto Bulleit Bourbon', 'juicy 100% minced beef, crispy bacon, melted cheddar, homemade Bulleit bourbon sauce, homemade marinated red onion, pickles, iceberg', 'https://foodtiger.mobidonia.com/uploads/restorants/4c2d9b73-685a-4252-84a3-6ba354f3a59c', 10.99, 5, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(29, 'Back to Basics', 'juicy 100% minced beef, melted cheddar, pickles, iceberg, homemade Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/643dd56b-684a-47f9-b72f-0fec59c16cb0', 7.99, 5, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(30, 'Cheesus', 'juicy 100% minced beef, crispy bacon, melted cheddar, fresh red onion, pickles, tomato, iceberg, lots of Hellman\'s mustard and ketchup', 'https://foodtiger.mobidonia.com/uploads/restorants/1084e812-7aa7-471c-9ae2-96dd5f561935', 9.99, 5, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(31, 'Skaptoburger', 'juicy 100% freshly ground veal, crispy bacon, melted cheddar, fresh red onion, iceberg, tomato, homemade spicy Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/7998ea89-e4b6-4021-ad47-6a1aa442e093', 9.99, 5, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(32, 'El Pollo Loco', 'Breaded until golden chicken fillet, crispy bacon, pickles, tomato, iceberg, mayonnaise and Hellman\'s mustard, barbecue sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/5757558a-94d7-4ba9-b39c-2e258701f051', 10.99, 5, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(33, 'SA7OSH1', 'juicy 100% minced beef, breaded to golden yellow, crispy bacon, melted cheddar, fresh red onion, arugula, homemade Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/5bf2bb33-1b3b-4911-a7f0-618d17719ba2', 12.99, 5, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(34, 'Homemade french fries with ranch sauce (150g)', 'French fries, homemade ranch dressing, cheddar cheese, fully ', 'https://foodtiger.mobidonia.com/uploads/restorants/aa05caca-d1c1-4b27-8615-78e8686b95e3', 2.98, 6, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(35, 'Homemade french fries with cheddar and jalapenos (190g)', 'Olive oil, cheddar, green mix', 'https://foodtiger.mobidonia.com/uploads/restorants/b3ee655e-29d2-4c35-86df-89b8200c9142', 3.97, 6, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(36, 'Homemade french fries (100g)', '100g', 'https://foodtiger.mobidonia.com/uploads/restorants/86289e4c-360c-4e5c-aa02-8d2ba791d954', 1.99, 6, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(37, 'Mexellente (350g)', 'iceberg, red pepper, tomato, sweet corn, red beans, fresh red onions, parsley, lime juice, sweet chili sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/58d57b7a-8873-4559-94af-cf50501a1bfa', 6.99, 7, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(38, 'Homemade Potatoes with Cheddar and Jalapenos (300g)', 'Cheddar cheese, butter, russet potatoes, rings, all purpose flour', 'https://foodtiger.mobidonia.com/uploads/restorants/b130e310-c024-49fa-99c2-1f0182b810f6', 6.99, 8, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(39, 'Homemade Potatoes with Ranch Sauce (300g)', 'Sour cream, ranch dressing, bacon, potatoes, cheddar cheese', 'https://foodtiger.mobidonia.com/uploads/restorants/dd0c87c9-d862-45a6-a933-7060d68c749c', 5.99, 8, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(40, 'Cheddar Sticks (250g)', 'String cheese, bread crumbs, smoked paprika, egg', 'https://foodtiger.mobidonia.com/uploads/restorants/3dfb1358-a853-4d7c-93f1-36eaf06ee2d7', 7.99, 8, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(41, 'Schweppes Tonic (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/5f3c11e2-8cf0-4512-b982-0b57e8b8eb07', 2.49, 9, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(42, 'Sprite (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/d592d42c-9818-481d-99b1-b8dc54dbe731', 2.49, 9, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(43, 'Orange Fanta (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/ca815d62-cdf8-4799-98c4-0e8f557b2659', 2.49, 9, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(44, 'Coca Cola (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/6dfb661a-cc55-4c27-b223-504b047c7e1a', 2.49, 9, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(45, 'Burrito with chicken', 'chicken on a plate, tortilla cake, rice, peppers on a plate, onion on a plate, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad ', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', 6.99, 10, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(46, 'Burrito Veggie', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cc167252-968b-4cf4-9964-86c6a5feba45', 5.99, 10, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(47, 'Burrito with beef roast', 'veal or minced meat (specify), tortilla bread, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce, or hot spit at will ', 'https://foodtiger.mobidonia.com/uploads/restorants/c0895e35-f4f9-4113-96d7-ecae6d27ed2b', 8.49, 10, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(48, 'Burrito with pork', 'pork roast, tortilla bread, rice, plate peppers, plate onion, red beans, mushrooms, spicy corn, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad, if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', 6.99, 10, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(49, 'Quesadilla with chicken', 'Cassadia with chicken - large chicken on a plate, 2 pieces of tortillas, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, cheese, olives, cream sauce, mayonnaise sauce or hot salad on desire ', 'https://foodtiger.mobidonia.com/uploads/restorants/807afb68-bba2-4a7f-be98-54586047d45b', 6.69, 11, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(50, 'Quesadilla with veal', 'beef roast or minced meat, 2 pieces of tortilla tortilla, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, cheese, olives, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/ffb24714-946d-43a8-a732-501cd742bd8c', 7.69, 11, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(51, 'Vegetarian Quesadilla', '2pcs tortillas, plate peppers, plate onions, mushrooms, beans, corn with spices, tomatoes, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/005c9ff4-61ae-4fa4-a204-3a14db63856f', 6.19, 11, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(52, 'Quesadilla with Pork', 'pork roast, 2 tortilla tortillas, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, yellow cheese, olives, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/3d0b6a8c-9b56-46d9-bf3c-f69d2e3b30f8', 6.69, 11, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(53, 'Chicken Taco (250g)', 'tortilla tortilla 16cm, chicken on a plate, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/fcbc8d58-2e69-4b91-8dfe-b8ff8920023c', 3.49, 12, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(54, 'Taco with beef roasted meat (250g)', 'tortilla tortilla 16cm, veal minced meat, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/6681a3c8-17df-42db-a09a-aed0a327e226', 3.99, 12, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(55, 'Pork Taco (250g)', '16cm tortilla cake, pork roast, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/2a0560e8-b93a-405d-9f44-86fcde00069d', 3.49, 12, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(56, 'Tacos Veggie (250g)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/6f9e8892-4a28-4c99-ab24-57179a1424b9', 2.99, 12, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(57, 'Burrito Vegetarian in a Bowl (450g)', 'rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/eb8cb594-0317-4f1c-8840-cd70bd6d34c3', 6.99, 13, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(58, 'Burrito with chicken in a bowl(450g)', 'chicken, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/e9c18f00-8e49-40e0-b723-da78c7e8ce6c', 7.99, 13, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(59, 'Burrito with beef in a bowl (450g)', 'veal, rice, plate peppers, onion, red beans, spiced corn, tomatoes, iceberg, yellow cheese, cream sauce or mayonnaise sauce, hot salts if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/277179e4-104b-477b-8c7b-9b8b55b9161d', 8.99, 13, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(60, 'Burrito with pork in a bowl (450g)', 'pork, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/2a65093d-b681-4257-916b-77eccaf2c5e6', 7.99, 13, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(61, 'Caprese Salad (350gr)', 'peeled tomatoes, mozzarella salad, Genovese pesto', 'https://foodtiger.mobidonia.com/uploads/restorants/bd5292e7-e898-479d-8921-4c47a776ba82', 9.99, 14, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(62, 'Caesar Salad (400g)', 'iceberg, bacon, chicken breast, parmesan, Caesar sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/25ed56dc-45cc-473f-ad00-d4b449acc71a', 10.99, 14, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(63, 'Salad Napoli (350g)', 'iceberg, arugula, cherry tomatoes, mozzarella salad, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/93641a19-dba6-4010-a852-0e88da83a01f', 9.99, 14, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(64, 'Green tuna salad (400g)', 'lettuce, cucumbers, tuna, olive, corn, lemon, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/d3379607-df34-4ed0-8f87-8bb6f73ed16d', 9.99, 14, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(65, 'Green salad (350g)', 'lettuce, cucumbers, radishes, onions, egg, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/2e7eb9a6-5307-4ec7-8cf8-86490d4c2363', 7.99, 14, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(66, 'Greek Salad (500g)', 'tomatoes, cucumbers, green pepper, red onion, olive, feta cheese, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f5a8b88d-9b94-44fc-9555-2f0fe043d624', 9.99, 14, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(67, 'Mozzarella Pizza', 'tomato sauce, mozzarella sabelli, cherry tomatoes, olives, pesto sauce, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8', 10.99, 15, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(68, 'Prosciutto crust pizza', 'tomato sauce, mozzarella sabelli, prosciutto, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9b9886cb-5d4b-4bfe-a02a-dc3b94dae706', 14.99, 15, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(69, 'Pepperoni Pizza', 'tomato sauce, mozzarella Sabelli, Calabro salad (spicy), extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/4b26647d-52b8-43c5-8b62-708c99252c24', 14.99, 15, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(70, 'Carriola Pizza', 'tomato sauce, mozzarella sabelli, bacon, red onion, olives, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/e1e5559a-ca6d-4a34-80c6-b72c31d97d96', 14.99, 15, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(71, 'Perugia Pizza', 'tomato sauce, mozzarella sabelli, chicken fillet, red onion, fresh peppers, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/a8e8c22a-84cd-48d0-971a-2c98e695e387', 14.99, 15, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(72, 'Pizza Napoli', 'tomato sauce, mozzarella sabelli, ham, cherry tomatoes, emmental, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/5c8fa7eb-bc11-42e1-a1a5-ffb0b3d7a6b7', 14.99, 15, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(73, 'Margarita Pizza', 'tomato sauce, mozzarella Sabelli, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', 10.49, 15, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(74, 'Combo Pizza 50/50 (70cm)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cb7372d0-73a8-4551-bc31-22035d9551c4', 39.99, 15, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(75, 'Capricciosa Pizza', 'tomato sauce, mozzarella sabelli, ham, fresh mushrooms, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', 14.99, 15, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(76, 'Quattro Formaggi Pizza', 'cream (animal), mozzarella Sabelli, blue cheese, emmental, parmesan, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0054144d-131c-4807-a209-cee855415182', 14.99, 15, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(77, 'Marco Polo Pizza', 'tomato sauce, Sabelli mozzarella, chicken fillet, smoked cheese, corn, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f77218a9-676e-434e-ac5b-4ae3dc5795b3', 14.99, 15, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(78, 'Burrito with chicken', 'chicken on a plate, tortilla cake, rice, peppers on a plate, onion on a plate, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad ', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', 6.99, 16, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(79, 'Burrito Veggie', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cc167252-968b-4cf4-9964-86c6a5feba45', 5.99, 16, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(80, 'Burrito with beef roast', 'veal or minced meat (specify), tortilla bread, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce, or hot spit at will ', 'https://foodtiger.mobidonia.com/uploads/restorants/c0895e35-f4f9-4113-96d7-ecae6d27ed2b', 8.49, 16, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(81, 'Burrito with pork', 'pork roast, tortilla bread, rice, plate peppers, plate onion, red beans, mushrooms, spicy corn, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad, if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', 6.99, 16, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(82, 'Schweppes Tonic (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/5f3c11e2-8cf0-4512-b982-0b57e8b8eb07', 2.49, 17, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(83, 'Sprite (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/d592d42c-9818-481d-99b1-b8dc54dbe731', 2.49, 17, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(84, 'Orange Fanta (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/ca815d62-cdf8-4799-98c4-0e8f557b2659', 2.49, 17, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(85, 'Coca Cola (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/6dfb661a-cc55-4c27-b223-504b047c7e1a', 2.49, 17, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(86, 'Caprese Salad (350gr)', 'peeled tomatoes, mozzarella salad, Genovese pesto', 'https://foodtiger.mobidonia.com/uploads/restorants/bd5292e7-e898-479d-8921-4c47a776ba82', 9.99, 18, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(87, 'Caesar Salad (400g)', 'iceberg, bacon, chicken breast, parmesan, Caesar sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/25ed56dc-45cc-473f-ad00-d4b449acc71a', 10.99, 18, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(88, 'Salad Napoli (350g)', 'iceberg, arugula, cherry tomatoes, mozzarella salad, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/93641a19-dba6-4010-a852-0e88da83a01f', 9.99, 18, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(89, 'Green tuna salad (400g)', 'lettuce, cucumbers, tuna, olive, corn, lemon, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/d3379607-df34-4ed0-8f87-8bb6f73ed16d', 9.99, 18, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(90, 'Green salad (350g)', 'lettuce, cucumbers, radishes, onions, egg, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/2e7eb9a6-5307-4ec7-8cf8-86490d4c2363', 7.99, 18, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(91, 'Greek Salad (500g)', 'tomatoes, cucumbers, green pepper, red onion, olive, feta cheese, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f5a8b88d-9b94-44fc-9555-2f0fe043d624', 9.99, 18, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(92, 'Lasagna Classic (450g)', 'Bolognese sauce, mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/94d44523-ec90-4069-bd11-eb9588207c31', 11.99, 19, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(93, 'Napoli Lasagna (450g)', 'chicken fillet, cream (animal), corn, blue cheese, mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/4c367950-992c-4711-ab56-42bed10de86c', 11.99, 19, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(94, 'Lasagna Formagio (450g)', 'smoked cheese, blue cheese, emmental, cream (animal), mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/8bafc3ec-82e7-46f8-964a-77a13e4ddf96', 11.99, 19, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(95, 'Mozzarella Pizza', 'tomato sauce, mozzarella sabelli, cherry tomatoes, olives, pesto sauce, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8', 10.99, 20, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(96, 'Prosciutto crust pizza', 'tomato sauce, mozzarella sabelli, prosciutto, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9b9886cb-5d4b-4bfe-a02a-dc3b94dae706', 14.99, 20, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(97, 'Pepperoni Pizza', 'tomato sauce, mozzarella Sabelli, Calabro salad (spicy), extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/4b26647d-52b8-43c5-8b62-708c99252c24', 14.99, 20, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(98, 'Carriola Pizza', 'tomato sauce, mozzarella sabelli, bacon, red onion, olives, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/e1e5559a-ca6d-4a34-80c6-b72c31d97d96', 14.99, 20, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(99, 'Perugia Pizza', 'tomato sauce, mozzarella sabelli, chicken fillet, red onion, fresh peppers, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/a8e8c22a-84cd-48d0-971a-2c98e695e387', 14.99, 20, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(100, 'Pizza Napoli', 'tomato sauce, mozzarella sabelli, ham, cherry tomatoes, emmental, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/5c8fa7eb-bc11-42e1-a1a5-ffb0b3d7a6b7', 14.99, 20, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(101, 'Margarita Pizza', 'tomato sauce, mozzarella Sabelli, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', 10.49, 20, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(102, 'Combo Pizza 50/50 (70cm)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cb7372d0-73a8-4551-bc31-22035d9551c4', 39.99, 20, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(103, 'Capricciosa Pizza', 'tomato sauce, mozzarella sabelli, ham, fresh mushrooms, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', 14.99, 20, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(104, 'Quattro Formaggi Pizza', 'cream (animal), mozzarella Sabelli, blue cheese, emmental, parmesan, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0054144d-131c-4807-a209-cee855415182', 14.99, 20, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(105, 'Marco Polo Pizza', 'tomato sauce, Sabelli mozzarella, chicken fillet, smoked cheese, corn, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f77218a9-676e-434e-ac5b-4ae3dc5795b3', 14.99, 20, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(106, 'Spaghetti Carbonara (450g)', 'fresh pasta, cream (animal), onion, pancakes (smoked bacon), egg, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/b65d5389-4742-4a78-9d94-f31110984db6', 11.99, 21, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(107, 'Spaghetti Formaggi (450g)', 'fresh pasta, cream (animal), blue cheese, emmental, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/4a2067cb-f39c-4b26-83ef-9097512d3328', 11.99, 21, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(108, 'Tagliatelle with mushrooms (400g)', 'fresh pasta, cream (animal), mushrooms, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/0bae6238-dda6-4630-b300-5125fde865d4', 11.99, 21, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(109, 'Chicken risotto (450g)', 'Arborio rice, chicken breast, onion, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/033c32c1-cdae-495e-910f-66b5fa239297', 11.99, 21, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(110, 'Risotto with mushrooms (450g)', 'Arborio rice, mushrooms, garlic, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/08d82944-f947-48f4-a197-a3199bb3b6e7', 11.99, 21, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(111, 'Tagliatelle with Bolognese Sauce (400g)', 'fresh pasta, bolognese sauce, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/cc695ba9-8af3-47a4-8e41-dc1706cbf2c3', 11.99, 21, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(112, 'Burrito with chicken', 'chicken on a plate, tortilla cake, rice, peppers on a plate, onion on a plate, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad ', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', 6.99, 22, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(113, 'Burrito Veggie', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cc167252-968b-4cf4-9964-86c6a5feba45', 5.99, 22, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(114, 'Burrito with beef roast', 'veal or minced meat (specify), tortilla bread, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce, or hot spit at will ', 'https://foodtiger.mobidonia.com/uploads/restorants/c0895e35-f4f9-4113-96d7-ecae6d27ed2b', 8.49, 22, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(115, 'Burrito with pork', 'pork roast, tortilla bread, rice, plate peppers, plate onion, red beans, mushrooms, spicy corn, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad, if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', 6.99, 22, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(116, 'Burrito Vegetarian in a Bowl (450g)', 'rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/eb8cb594-0317-4f1c-8840-cd70bd6d34c3', 6.99, 23, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(117, 'Burrito with chicken in a bowl(450g)', 'chicken, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/e9c18f00-8e49-40e0-b723-da78c7e8ce6c', 7.99, 23, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(118, 'Burrito with beef in a bowl (450g)', 'veal, rice, plate peppers, onion, red beans, spiced corn, tomatoes, iceberg, yellow cheese, cream sauce or mayonnaise sauce, hot salts if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/277179e4-104b-477b-8c7b-9b8b55b9161d', 8.99, 23, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(119, 'Burrito with pork in a bowl (450g)', 'pork, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/2a65093d-b681-4257-916b-77eccaf2c5e6', 7.99, 23, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(120, 'Quesadilla with chicken', 'Cassadia with chicken - large chicken on a plate, 2 pieces of tortillas, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, cheese, olives, cream sauce, mayonnaise sauce or hot salad on desire ', 'https://foodtiger.mobidonia.com/uploads/restorants/807afb68-bba2-4a7f-be98-54586047d45b', 6.69, 24, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(121, 'Quesadilla with veal', 'beef roast or minced meat, 2 pieces of tortilla tortilla, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, cheese, olives, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/ffb24714-946d-43a8-a732-501cd742bd8c', 7.69, 24, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(122, 'Vegetarian Quesadilla', '2pcs tortillas, plate peppers, plate onions, mushrooms, beans, corn with spices, tomatoes, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/005c9ff4-61ae-4fa4-a204-3a14db63856f', 6.19, 24, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(123, 'Quesadilla with Pork', 'pork roast, 2 tortilla tortillas, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, yellow cheese, olives, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/3d0b6a8c-9b56-46d9-bf3c-f69d2e3b30f8', 6.69, 24, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(124, 'Chicken Taco (250g)', 'tortilla tortilla 16cm, chicken on a plate, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/fcbc8d58-2e69-4b91-8dfe-b8ff8920023c', 3.49, 25, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(125, 'Taco with beef roasted meat (250g)', 'tortilla tortilla 16cm, veal minced meat, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/6681a3c8-17df-42db-a09a-aed0a327e226', 3.99, 25, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(126, 'Pork Taco (250g)', '16cm tortilla cake, pork roast, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/2a0560e8-b93a-405d-9f44-86fcde00069d', 3.49, 25, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(127, 'Tacos Veggie (250g)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/6f9e8892-4a28-4c99-ab24-57179a1424b9', 2.99, 25, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(128, 'Schweppes Tonic (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/5f3c11e2-8cf0-4512-b982-0b57e8b8eb07', 2.49, 26, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(129, 'Sprite (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/d592d42c-9818-481d-99b1-b8dc54dbe731', 2.49, 26, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(130, 'Orange Fanta (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/ca815d62-cdf8-4799-98c4-0e8f557b2659', 2.49, 26, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(131, 'Coca Cola (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/6dfb661a-cc55-4c27-b223-504b047c7e1a', 2.49, 26, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(132, 'Wild Wild West', 'freshly baked brioche bread, 100% freshly ground beef Limousine, crispy bacon, melted cheddar, brewed in Skapto beer onion rings, homemade BBQ sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/c8d27bcc-54da-4c18-b8e6-f1414c71612c', 8.99, 27, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(133, 'Skapto Bulleit Bourbon', 'juicy 100% minced beef, crispy bacon, melted cheddar, homemade Bulleit bourbon sauce, homemade marinated red onion, pickles, iceberg', 'https://foodtiger.mobidonia.com/uploads/restorants/4c2d9b73-685a-4252-84a3-6ba354f3a59c', 10.99, 27, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(134, 'Back to Basics', 'juicy 100% minced beef, melted cheddar, pickles, iceberg, homemade Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/643dd56b-684a-47f9-b72f-0fec59c16cb0', 7.99, 27, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(135, 'Cheesus', 'juicy 100% minced beef, crispy bacon, melted cheddar, fresh red onion, pickles, tomato, iceberg, lots of Hellman\'s mustard and ketchup', 'https://foodtiger.mobidonia.com/uploads/restorants/1084e812-7aa7-471c-9ae2-96dd5f561935', 9.99, 27, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(136, 'Skaptoburger', 'juicy 100% freshly ground veal, crispy bacon, melted cheddar, fresh red onion, iceberg, tomato, homemade spicy Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/7998ea89-e4b6-4021-ad47-6a1aa442e093', 9.99, 27, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(137, 'El Pollo Loco', 'Breaded until golden chicken fillet, crispy bacon, pickles, tomato, iceberg, mayonnaise and Hellman\'s mustard, barbecue sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/5757558a-94d7-4ba9-b39c-2e258701f051', 10.99, 27, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(138, 'SA7OSH1', 'juicy 100% minced beef, breaded to golden yellow, crispy bacon, melted cheddar, fresh red onion, arugula, homemade Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/5bf2bb33-1b3b-4911-a7f0-618d17719ba2', 12.99, 27, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(139, 'Mexellente (350g)', 'iceberg, red pepper, tomato, sweet corn, red beans, fresh red onions, parsley, lime juice, sweet chili sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/58d57b7a-8873-4559-94af-cf50501a1bfa', 6.99, 28, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(140, 'Homemade Potatoes with Cheddar and Jalapenos (300g)', 'Cheddar cheese, butter, russet potatoes, rings, all purpose flour', 'https://foodtiger.mobidonia.com/uploads/restorants/b130e310-c024-49fa-99c2-1f0182b810f6', 6.99, 29, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(141, 'Homemade Potatoes with Ranch Sauce (300g)', 'Sour cream, ranch dressing, bacon, potatoes, cheddar cheese', 'https://foodtiger.mobidonia.com/uploads/restorants/dd0c87c9-d862-45a6-a933-7060d68c749c', 5.99, 29, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(142, 'Cheddar Sticks (250g)', 'String cheese, bread crumbs, smoked paprika, egg', 'https://foodtiger.mobidonia.com/uploads/restorants/3dfb1358-a853-4d7c-93f1-36eaf06ee2d7', 7.99, 29, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(143, 'Homemade french fries with ranch sauce (150g)', 'French fries, homemade ranch dressing, cheddar cheese, fully ', 'https://foodtiger.mobidonia.com/uploads/restorants/aa05caca-d1c1-4b27-8615-78e8686b95e3', 2.98, 30, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(144, 'Homemade french fries with cheddar and jalapenos (190g)', 'Olive oil, cheddar, green mix', 'https://foodtiger.mobidonia.com/uploads/restorants/b3ee655e-29d2-4c35-86df-89b8200c9142', 3.97, 30, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(145, 'Homemade french fries (100g)', '100g', 'https://foodtiger.mobidonia.com/uploads/restorants/86289e4c-360c-4e5c-aa02-8d2ba791d954', 1.99, 30, '2024-06-08 15:57:15', '2024-06-08 15:57:15', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(146, 'Schweppes Tonic (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/5f3c11e2-8cf0-4512-b982-0b57e8b8eb07', 2.49, 31, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(147, 'Sprite (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/d592d42c-9818-481d-99b1-b8dc54dbe731', 2.49, 31, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(148, 'Orange Fanta (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/ca815d62-cdf8-4799-98c4-0e8f557b2659', 2.49, 31, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(149, 'Coca Cola (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/6dfb661a-cc55-4c27-b223-504b047c7e1a', 2.49, 31, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(150, 'Mozzarella Pizza', 'tomato sauce, mozzarella sabelli, cherry tomatoes, olives, pesto sauce, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8', 10.99, 32, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(151, 'Prosciutto crust pizza', 'tomato sauce, mozzarella sabelli, prosciutto, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9b9886cb-5d4b-4bfe-a02a-dc3b94dae706', 14.99, 32, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(152, 'Pepperoni Pizza', 'tomato sauce, mozzarella Sabelli, Calabro salad (spicy), extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/4b26647d-52b8-43c5-8b62-708c99252c24', 14.99, 32, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(153, 'Carriola Pizza', 'tomato sauce, mozzarella sabelli, bacon, red onion, olives, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/e1e5559a-ca6d-4a34-80c6-b72c31d97d96', 14.99, 32, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(154, 'Perugia Pizza', 'tomato sauce, mozzarella sabelli, chicken fillet, red onion, fresh peppers, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/a8e8c22a-84cd-48d0-971a-2c98e695e387', 14.99, 32, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(155, 'Pizza Napoli', 'tomato sauce, mozzarella sabelli, ham, cherry tomatoes, emmental, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/5c8fa7eb-bc11-42e1-a1a5-ffb0b3d7a6b7', 14.99, 32, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(156, 'Margarita Pizza', 'tomato sauce, mozzarella Sabelli, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', 10.49, 32, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(157, 'Combo Pizza 50/50 (70cm)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cb7372d0-73a8-4551-bc31-22035d9551c4', 39.99, 32, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(158, 'Capricciosa Pizza', 'tomato sauce, mozzarella sabelli, ham, fresh mushrooms, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', 14.99, 32, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(159, 'Quattro Formaggi Pizza', 'cream (animal), mozzarella Sabelli, blue cheese, emmental, parmesan, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0054144d-131c-4807-a209-cee855415182', 14.99, 32, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(160, 'Marco Polo Pizza', 'tomato sauce, Sabelli mozzarella, chicken fillet, smoked cheese, corn, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f77218a9-676e-434e-ac5b-4ae3dc5795b3', 14.99, 32, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(161, 'Burrito with chicken', 'chicken on a plate, tortilla cake, rice, peppers on a plate, onion on a plate, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad ', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', 6.99, 33, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(162, 'Burrito Veggie', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cc167252-968b-4cf4-9964-86c6a5feba45', 5.99, 33, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(163, 'Burrito with beef roast', 'veal or minced meat (specify), tortilla bread, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce, or hot spit at will ', 'https://foodtiger.mobidonia.com/uploads/restorants/c0895e35-f4f9-4113-96d7-ecae6d27ed2b', 8.49, 33, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(164, 'Burrito with pork', 'pork roast, tortilla bread, rice, plate peppers, plate onion, red beans, mushrooms, spicy corn, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad, if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', 6.99, 33, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, 0, 21.00, NULL, 0, 0.00, 1, 0);
INSERT INTO `items` (`id`, `name`, `description`, `image`, `price`, `category_id`, `created_at`, `updated_at`, `available`, `has_variants`, `vat`, `deleted_at`, `enable_system_variants`, `discounted_price`, `qty`, `qty_management`) VALUES
(165, 'Caprese Salad (350gr)', 'peeled tomatoes, mozzarella salad, Genovese pesto', 'https://foodtiger.mobidonia.com/uploads/restorants/bd5292e7-e898-479d-8921-4c47a776ba82', 9.99, 34, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(166, 'Caesar Salad (400g)', 'iceberg, bacon, chicken breast, parmesan, Caesar sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/25ed56dc-45cc-473f-ad00-d4b449acc71a', 10.99, 34, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(167, 'Salad Napoli (350g)', 'iceberg, arugula, cherry tomatoes, mozzarella salad, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/93641a19-dba6-4010-a852-0e88da83a01f', 9.99, 34, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(168, 'Green tuna salad (400g)', 'lettuce, cucumbers, tuna, olive, corn, lemon, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/d3379607-df34-4ed0-8f87-8bb6f73ed16d', 9.99, 34, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(169, 'Green salad (350g)', 'lettuce, cucumbers, radishes, onions, egg, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/2e7eb9a6-5307-4ec7-8cf8-86490d4c2363', 7.99, 34, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(170, 'Greek Salad (500g)', 'tomatoes, cucumbers, green pepper, red onion, olive, feta cheese, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f5a8b88d-9b94-44fc-9555-2f0fe043d624', 9.99, 34, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(171, 'Lasagna Classic (450g)', 'Bolognese sauce, mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/94d44523-ec90-4069-bd11-eb9588207c31', 11.99, 35, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(172, 'Napoli Lasagna (450g)', 'chicken fillet, cream (animal), corn, blue cheese, mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/4c367950-992c-4711-ab56-42bed10de86c', 11.99, 35, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(173, 'Lasagna Formagio (450g)', 'smoked cheese, blue cheese, emmental, cream (animal), mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/8bafc3ec-82e7-46f8-964a-77a13e4ddf96', 11.99, 35, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(174, 'Mozzarella Pizza', 'tomato sauce, mozzarella sabelli, cherry tomatoes, olives, pesto sauce, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8', 10.99, 36, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(175, 'Prosciutto crust pizza', 'tomato sauce, mozzarella sabelli, prosciutto, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9b9886cb-5d4b-4bfe-a02a-dc3b94dae706', 14.99, 36, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(176, 'Pepperoni Pizza', 'tomato sauce, mozzarella Sabelli, Calabro salad (spicy), extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/4b26647d-52b8-43c5-8b62-708c99252c24', 14.99, 36, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(177, 'Carriola Pizza', 'tomato sauce, mozzarella sabelli, bacon, red onion, olives, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/e1e5559a-ca6d-4a34-80c6-b72c31d97d96', 14.99, 36, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(178, 'Perugia Pizza', 'tomato sauce, mozzarella sabelli, chicken fillet, red onion, fresh peppers, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/a8e8c22a-84cd-48d0-971a-2c98e695e387', 14.99, 36, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(179, 'Pizza Napoli', 'tomato sauce, mozzarella sabelli, ham, cherry tomatoes, emmental, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/5c8fa7eb-bc11-42e1-a1a5-ffb0b3d7a6b7', 14.99, 36, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(180, 'Margarita Pizza', 'tomato sauce, mozzarella Sabelli, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', 10.49, 36, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(181, 'Combo Pizza 50/50 (70cm)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cb7372d0-73a8-4551-bc31-22035d9551c4', 39.99, 36, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(182, 'Capricciosa Pizza', 'tomato sauce, mozzarella sabelli, ham, fresh mushrooms, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', 14.99, 36, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(183, 'Quattro Formaggi Pizza', 'cream (animal), mozzarella Sabelli, blue cheese, emmental, parmesan, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0054144d-131c-4807-a209-cee855415182', 14.99, 36, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(184, 'Marco Polo Pizza', 'tomato sauce, Sabelli mozzarella, chicken fillet, smoked cheese, corn, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f77218a9-676e-434e-ac5b-4ae3dc5795b3', 14.99, 36, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(185, 'Caprese Salad (350gr)', 'peeled tomatoes, mozzarella salad, Genovese pesto', 'https://foodtiger.mobidonia.com/uploads/restorants/bd5292e7-e898-479d-8921-4c47a776ba82', 9.99, 37, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(186, 'Caesar Salad (400g)', 'iceberg, bacon, chicken breast, parmesan, Caesar sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/25ed56dc-45cc-473f-ad00-d4b449acc71a', 10.99, 37, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(187, 'Salad Napoli (350g)', 'iceberg, arugula, cherry tomatoes, mozzarella salad, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/93641a19-dba6-4010-a852-0e88da83a01f', 9.99, 37, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(188, 'Green tuna salad (400g)', 'lettuce, cucumbers, tuna, olive, corn, lemon, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/d3379607-df34-4ed0-8f87-8bb6f73ed16d', 9.99, 37, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(189, 'Green salad (350g)', 'lettuce, cucumbers, radishes, onions, egg, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/2e7eb9a6-5307-4ec7-8cf8-86490d4c2363', 7.99, 37, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(190, 'Greek Salad (500g)', 'tomatoes, cucumbers, green pepper, red onion, olive, feta cheese, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f5a8b88d-9b94-44fc-9555-2f0fe043d624', 9.99, 37, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(191, 'Spaghetti Carbonara (450g)', 'fresh pasta, cream (animal), onion, pancakes (smoked bacon), egg, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/b65d5389-4742-4a78-9d94-f31110984db6', 11.99, 38, '2024-06-08 15:57:28', '2024-06-08 15:57:28', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(192, 'Spaghetti Formaggi (450g)', 'fresh pasta, cream (animal), blue cheese, emmental, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/4a2067cb-f39c-4b26-83ef-9097512d3328', 11.99, 38, '2024-06-08 15:57:28', '2024-06-08 15:57:28', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(193, 'Tagliatelle with mushrooms (400g)', 'fresh pasta, cream (animal), mushrooms, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/0bae6238-dda6-4630-b300-5125fde865d4', 11.99, 38, '2024-06-08 15:57:28', '2024-06-08 15:57:28', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(194, 'Chicken risotto (450g)', 'Arborio rice, chicken breast, onion, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/033c32c1-cdae-495e-910f-66b5fa239297', 11.99, 38, '2024-06-08 15:57:28', '2024-06-08 15:57:28', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(195, 'Risotto with mushrooms (450g)', 'Arborio rice, mushrooms, garlic, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/08d82944-f947-48f4-a197-a3199bb3b6e7', 11.99, 38, '2024-06-08 15:57:28', '2024-06-08 15:57:28', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(196, 'Tagliatelle with Bolognese Sauce (400g)', 'fresh pasta, bolognese sauce, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/cc695ba9-8af3-47a4-8e41-dc1706cbf2c3', 11.99, 38, '2024-06-08 15:57:28', '2024-06-08 15:57:28', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(197, 'Chicken Taco (250g)', 'tortilla tortilla 16cm, chicken on a plate, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/fcbc8d58-2e69-4b91-8dfe-b8ff8920023c', 3.49, 39, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(198, 'Taco with beef roasted meat (250g)', 'tortilla tortilla 16cm, veal minced meat, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/6681a3c8-17df-42db-a09a-aed0a327e226', 3.99, 39, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(199, 'Pork Taco (250g)', '16cm tortilla cake, pork roast, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/2a0560e8-b93a-405d-9f44-86fcde00069d', 3.49, 39, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(200, 'Tacos Veggie (250g)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/6f9e8892-4a28-4c99-ab24-57179a1424b9', 2.99, 39, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(201, 'Burrito with chicken', 'chicken on a plate, tortilla cake, rice, peppers on a plate, onion on a plate, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad ', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', 6.99, 40, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(202, 'Burrito Veggie', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cc167252-968b-4cf4-9964-86c6a5feba45', 5.99, 40, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(203, 'Burrito with beef roast', 'veal or minced meat (specify), tortilla bread, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce, or hot spit at will ', 'https://foodtiger.mobidonia.com/uploads/restorants/c0895e35-f4f9-4113-96d7-ecae6d27ed2b', 8.49, 40, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(204, 'Burrito with pork', 'pork roast, tortilla bread, rice, plate peppers, plate onion, red beans, mushrooms, spicy corn, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad, if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', 6.99, 40, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(205, 'Quesadilla with chicken', 'Cassadia with chicken - large chicken on a plate, 2 pieces of tortillas, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, cheese, olives, cream sauce, mayonnaise sauce or hot salad on desire ', 'https://foodtiger.mobidonia.com/uploads/restorants/807afb68-bba2-4a7f-be98-54586047d45b', 6.69, 41, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(206, 'Quesadilla with veal', 'beef roast or minced meat, 2 pieces of tortilla tortilla, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, cheese, olives, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/ffb24714-946d-43a8-a732-501cd742bd8c', 7.69, 41, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(207, 'Vegetarian Quesadilla', '2pcs tortillas, plate peppers, plate onions, mushrooms, beans, corn with spices, tomatoes, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/005c9ff4-61ae-4fa4-a204-3a14db63856f', 6.19, 41, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(208, 'Quesadilla with Pork', 'pork roast, 2 tortilla tortillas, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, yellow cheese, olives, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/3d0b6a8c-9b56-46d9-bf3c-f69d2e3b30f8', 6.69, 41, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(209, 'Burrito Vegetarian in a Bowl (450g)', 'rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/eb8cb594-0317-4f1c-8840-cd70bd6d34c3', 6.99, 42, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(210, 'Burrito with chicken in a bowl(450g)', 'chicken, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/e9c18f00-8e49-40e0-b723-da78c7e8ce6c', 7.99, 42, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(211, 'Burrito with beef in a bowl (450g)', 'veal, rice, plate peppers, onion, red beans, spiced corn, tomatoes, iceberg, yellow cheese, cream sauce or mayonnaise sauce, hot salts if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/277179e4-104b-477b-8c7b-9b8b55b9161d', 8.99, 42, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(212, 'Burrito with pork in a bowl (450g)', 'pork, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/2a65093d-b681-4257-916b-77eccaf2c5e6', 7.99, 42, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(213, 'Mexellente (350g)', 'iceberg, red pepper, tomato, sweet corn, red beans, fresh red onions, parsley, lime juice, sweet chili sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/58d57b7a-8873-4559-94af-cf50501a1bfa', 6.99, 43, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(214, 'Homemade Potatoes with Cheddar and Jalapenos (300g)', 'Cheddar cheese, butter, russet potatoes, rings, all purpose flour', 'https://foodtiger.mobidonia.com/uploads/restorants/b130e310-c024-49fa-99c2-1f0182b810f6', 6.99, 44, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(215, 'Homemade Potatoes with Ranch Sauce (300g)', 'Sour cream, ranch dressing, bacon, potatoes, cheddar cheese', 'https://foodtiger.mobidonia.com/uploads/restorants/dd0c87c9-d862-45a6-a933-7060d68c749c', 5.99, 44, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(216, 'Cheddar Sticks (250g)', 'String cheese, bread crumbs, smoked paprika, egg', 'https://foodtiger.mobidonia.com/uploads/restorants/3dfb1358-a853-4d7c-93f1-36eaf06ee2d7', 7.99, 44, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(217, 'Wild Wild West', 'freshly baked brioche bread, 100% freshly ground beef Limousine, crispy bacon, melted cheddar, brewed in Skapto beer onion rings, homemade BBQ sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/c8d27bcc-54da-4c18-b8e6-f1414c71612c', 8.99, 45, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(218, 'Skapto Bulleit Bourbon', 'juicy 100% minced beef, crispy bacon, melted cheddar, homemade Bulleit bourbon sauce, homemade marinated red onion, pickles, iceberg', 'https://foodtiger.mobidonia.com/uploads/restorants/4c2d9b73-685a-4252-84a3-6ba354f3a59c', 10.99, 45, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(219, 'Back to Basics', 'juicy 100% minced beef, melted cheddar, pickles, iceberg, homemade Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/643dd56b-684a-47f9-b72f-0fec59c16cb0', 7.99, 45, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(220, 'Cheesus', 'juicy 100% minced beef, crispy bacon, melted cheddar, fresh red onion, pickles, tomato, iceberg, lots of Hellman\'s mustard and ketchup', 'https://foodtiger.mobidonia.com/uploads/restorants/1084e812-7aa7-471c-9ae2-96dd5f561935', 9.99, 45, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(221, 'Skaptoburger', 'juicy 100% freshly ground veal, crispy bacon, melted cheddar, fresh red onion, iceberg, tomato, homemade spicy Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/7998ea89-e4b6-4021-ad47-6a1aa442e093', 9.99, 45, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(222, 'El Pollo Loco', 'Breaded until golden chicken fillet, crispy bacon, pickles, tomato, iceberg, mayonnaise and Hellman\'s mustard, barbecue sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/5757558a-94d7-4ba9-b39c-2e258701f051', 10.99, 45, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(223, 'SA7OSH1', 'juicy 100% minced beef, breaded to golden yellow, crispy bacon, melted cheddar, fresh red onion, arugula, homemade Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/5bf2bb33-1b3b-4911-a7f0-618d17719ba2', 12.99, 45, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(224, 'Schweppes Tonic (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/5f3c11e2-8cf0-4512-b982-0b57e8b8eb07', 2.49, 46, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(225, 'Sprite (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/d592d42c-9818-481d-99b1-b8dc54dbe731', 2.49, 46, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(226, 'Orange Fanta (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/ca815d62-cdf8-4799-98c4-0e8f557b2659', 2.49, 46, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(227, 'Coca Cola (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/6dfb661a-cc55-4c27-b223-504b047c7e1a', 2.49, 46, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(228, 'Homemade french fries with ranch sauce (150g)', 'French fries, homemade ranch dressing, cheddar cheese, fully ', 'https://foodtiger.mobidonia.com/uploads/restorants/aa05caca-d1c1-4b27-8615-78e8686b95e3', 2.98, 47, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(229, 'Homemade french fries with cheddar and jalapenos (190g)', 'Olive oil, cheddar, green mix', 'https://foodtiger.mobidonia.com/uploads/restorants/b3ee655e-29d2-4c35-86df-89b8200c9142', 3.97, 47, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(230, 'Homemade french fries (100g)', '100g', 'https://foodtiger.mobidonia.com/uploads/restorants/86289e4c-360c-4e5c-aa02-8d2ba791d954', 1.99, 47, '2024-06-08 15:57:30', '2024-06-08 15:57:30', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(231, 'Schweppes Tonic (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/5f3c11e2-8cf0-4512-b982-0b57e8b8eb07', 2.49, 48, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(232, 'Sprite (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/d592d42c-9818-481d-99b1-b8dc54dbe731', 2.49, 48, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(233, 'Orange Fanta (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/ca815d62-cdf8-4799-98c4-0e8f557b2659', 2.49, 48, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(234, 'Coca Cola (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/6dfb661a-cc55-4c27-b223-504b047c7e1a', 2.49, 48, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(235, 'Caprese Salad (350gr)', 'peeled tomatoes, mozzarella salad, Genovese pesto', 'https://foodtiger.mobidonia.com/uploads/restorants/bd5292e7-e898-479d-8921-4c47a776ba82', 9.99, 49, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(236, 'Caesar Salad (400g)', 'iceberg, bacon, chicken breast, parmesan, Caesar sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/25ed56dc-45cc-473f-ad00-d4b449acc71a', 10.99, 49, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(237, 'Salad Napoli (350g)', 'iceberg, arugula, cherry tomatoes, mozzarella salad, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/93641a19-dba6-4010-a852-0e88da83a01f', 9.99, 49, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(238, 'Green tuna salad (400g)', 'lettuce, cucumbers, tuna, olive, corn, lemon, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/d3379607-df34-4ed0-8f87-8bb6f73ed16d', 9.99, 49, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(239, 'Green salad (350g)', 'lettuce, cucumbers, radishes, onions, egg, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/2e7eb9a6-5307-4ec7-8cf8-86490d4c2363', 7.99, 49, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(240, 'Greek Salad (500g)', 'tomatoes, cucumbers, green pepper, red onion, olive, feta cheese, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f5a8b88d-9b94-44fc-9555-2f0fe043d624', 9.99, 49, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(241, 'Burrito with chicken', 'chicken on a plate, tortilla cake, rice, peppers on a plate, onion on a plate, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad ', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', 6.99, 50, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(242, 'Burrito Veggie', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cc167252-968b-4cf4-9964-86c6a5feba45', 5.99, 50, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(243, 'Burrito with beef roast', 'veal or minced meat (specify), tortilla bread, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce, or hot spit at will ', 'https://foodtiger.mobidonia.com/uploads/restorants/c0895e35-f4f9-4113-96d7-ecae6d27ed2b', 8.49, 50, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(244, 'Burrito with pork', 'pork roast, tortilla bread, rice, plate peppers, plate onion, red beans, mushrooms, spicy corn, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad, if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', 6.99, 50, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(245, 'Mozzarella Pizza', 'tomato sauce, mozzarella sabelli, cherry tomatoes, olives, pesto sauce, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8', 10.99, 51, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(246, 'Prosciutto crust pizza', 'tomato sauce, mozzarella sabelli, prosciutto, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9b9886cb-5d4b-4bfe-a02a-dc3b94dae706', 14.99, 51, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(247, 'Pepperoni Pizza', 'tomato sauce, mozzarella Sabelli, Calabro salad (spicy), extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/4b26647d-52b8-43c5-8b62-708c99252c24', 14.99, 51, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(248, 'Carriola Pizza', 'tomato sauce, mozzarella sabelli, bacon, red onion, olives, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/e1e5559a-ca6d-4a34-80c6-b72c31d97d96', 14.99, 51, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(249, 'Perugia Pizza', 'tomato sauce, mozzarella sabelli, chicken fillet, red onion, fresh peppers, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/a8e8c22a-84cd-48d0-971a-2c98e695e387', 14.99, 51, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(250, 'Pizza Napoli', 'tomato sauce, mozzarella sabelli, ham, cherry tomatoes, emmental, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/5c8fa7eb-bc11-42e1-a1a5-ffb0b3d7a6b7', 14.99, 51, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(251, 'Margarita Pizza', 'tomato sauce, mozzarella Sabelli, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', 10.49, 51, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(252, 'Combo Pizza 50/50 (70cm)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cb7372d0-73a8-4551-bc31-22035d9551c4', 39.99, 51, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(253, 'Capricciosa Pizza', 'tomato sauce, mozzarella sabelli, ham, fresh mushrooms, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', 14.99, 51, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(254, 'Quattro Formaggi Pizza', 'cream (animal), mozzarella Sabelli, blue cheese, emmental, parmesan, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0054144d-131c-4807-a209-cee855415182', 14.99, 51, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(255, 'Marco Polo Pizza', 'tomato sauce, Sabelli mozzarella, chicken fillet, smoked cheese, corn, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f77218a9-676e-434e-ac5b-4ae3dc5795b3', 14.99, 51, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(256, 'Mozzarella Pizza', 'tomato sauce, mozzarella sabelli, cherry tomatoes, olives, pesto sauce, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8', 10.99, 52, '2024-06-08 15:57:40', '2024-06-08 15:57:40', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(257, 'Prosciutto crust pizza', 'tomato sauce, mozzarella sabelli, prosciutto, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9b9886cb-5d4b-4bfe-a02a-dc3b94dae706', 14.99, 52, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(258, 'Pepperoni Pizza', 'tomato sauce, mozzarella Sabelli, Calabro salad (spicy), extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/4b26647d-52b8-43c5-8b62-708c99252c24', 14.99, 52, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(259, 'Carriola Pizza', 'tomato sauce, mozzarella sabelli, bacon, red onion, olives, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/e1e5559a-ca6d-4a34-80c6-b72c31d97d96', 14.99, 52, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(260, 'Perugia Pizza', 'tomato sauce, mozzarella sabelli, chicken fillet, red onion, fresh peppers, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/a8e8c22a-84cd-48d0-971a-2c98e695e387', 14.99, 52, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(261, 'Pizza Napoli', 'tomato sauce, mozzarella sabelli, ham, cherry tomatoes, emmental, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/5c8fa7eb-bc11-42e1-a1a5-ffb0b3d7a6b7', 14.99, 52, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(262, 'Margarita Pizza', 'tomato sauce, mozzarella Sabelli, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', 10.49, 52, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(263, 'Combo Pizza 50/50 (70cm)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cb7372d0-73a8-4551-bc31-22035d9551c4', 39.99, 52, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(264, 'Capricciosa Pizza', 'tomato sauce, mozzarella sabelli, ham, fresh mushrooms, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', 14.99, 52, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(265, 'Quattro Formaggi Pizza', 'cream (animal), mozzarella Sabelli, blue cheese, emmental, parmesan, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0054144d-131c-4807-a209-cee855415182', 14.99, 52, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(266, 'Marco Polo Pizza', 'tomato sauce, Sabelli mozzarella, chicken fillet, smoked cheese, corn, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f77218a9-676e-434e-ac5b-4ae3dc5795b3', 14.99, 52, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(267, 'Caprese Salad (350gr)', 'peeled tomatoes, mozzarella salad, Genovese pesto', 'https://foodtiger.mobidonia.com/uploads/restorants/bd5292e7-e898-479d-8921-4c47a776ba82', 9.99, 53, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(268, 'Caesar Salad (400g)', 'iceberg, bacon, chicken breast, parmesan, Caesar sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/25ed56dc-45cc-473f-ad00-d4b449acc71a', 10.99, 53, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(269, 'Salad Napoli (350g)', 'iceberg, arugula, cherry tomatoes, mozzarella salad, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/93641a19-dba6-4010-a852-0e88da83a01f', 9.99, 53, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(270, 'Green tuna salad (400g)', 'lettuce, cucumbers, tuna, olive, corn, lemon, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/d3379607-df34-4ed0-8f87-8bb6f73ed16d', 9.99, 53, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(271, 'Green salad (350g)', 'lettuce, cucumbers, radishes, onions, egg, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/2e7eb9a6-5307-4ec7-8cf8-86490d4c2363', 7.99, 53, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(272, 'Greek Salad (500g)', 'tomatoes, cucumbers, green pepper, red onion, olive, feta cheese, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f5a8b88d-9b94-44fc-9555-2f0fe043d624', 9.99, 53, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(273, 'Spaghetti Carbonara (450g)', 'fresh pasta, cream (animal), onion, pancakes (smoked bacon), egg, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/b65d5389-4742-4a78-9d94-f31110984db6', 11.99, 54, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(274, 'Spaghetti Formaggi (450g)', 'fresh pasta, cream (animal), blue cheese, emmental, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/4a2067cb-f39c-4b26-83ef-9097512d3328', 11.99, 54, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(275, 'Tagliatelle with mushrooms (400g)', 'fresh pasta, cream (animal), mushrooms, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/0bae6238-dda6-4630-b300-5125fde865d4', 11.99, 54, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(276, 'Chicken risotto (450g)', 'Arborio rice, chicken breast, onion, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/033c32c1-cdae-495e-910f-66b5fa239297', 11.99, 54, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(277, 'Risotto with mushrooms (450g)', 'Arborio rice, mushrooms, garlic, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/08d82944-f947-48f4-a197-a3199bb3b6e7', 11.99, 54, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(278, 'Tagliatelle with Bolognese Sauce (400g)', 'fresh pasta, bolognese sauce, parmesan', 'https://foodtiger.mobidonia.com/uploads/restorants/cc695ba9-8af3-47a4-8e41-dc1706cbf2c3', 11.99, 54, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(279, 'Lasagna Classic (450g)', 'Bolognese sauce, mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/94d44523-ec90-4069-bd11-eb9588207c31', 11.99, 55, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(280, 'Napoli Lasagna (450g)', 'chicken fillet, cream (animal), corn, blue cheese, mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/4c367950-992c-4711-ab56-42bed10de86c', 11.99, 55, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(281, 'Lasagna Formagio (450g)', 'smoked cheese, blue cheese, emmental, cream (animal), mozzarella Sabelli', 'https://foodtiger.mobidonia.com/uploads/restorants/8bafc3ec-82e7-46f8-964a-77a13e4ddf96', 11.99, 55, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(282, 'Burrito Vegetarian in a Bowl (450g)', 'rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/eb8cb594-0317-4f1c-8840-cd70bd6d34c3', 6.99, 56, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(283, 'Burrito with chicken in a bowl(450g)', 'chicken, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/e9c18f00-8e49-40e0-b723-da78c7e8ce6c', 7.99, 56, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(284, 'Burrito with beef in a bowl (450g)', 'veal, rice, plate peppers, onion, red beans, spiced corn, tomatoes, iceberg, yellow cheese, cream sauce or mayonnaise sauce, hot salts if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/277179e4-104b-477b-8c7b-9b8b55b9161d', 8.99, 56, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(285, 'Burrito with pork in a bowl (450g)', 'pork, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/2a65093d-b681-4257-916b-77eccaf2c5e6', 7.99, 56, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(286, 'Quesadilla with chicken', 'Cassadia with chicken - large chicken on a plate, 2 pieces of tortillas, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, cheese, olives, cream sauce, mayonnaise sauce or hot salad on desire ', 'https://foodtiger.mobidonia.com/uploads/restorants/807afb68-bba2-4a7f-be98-54586047d45b', 6.69, 57, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(287, 'Quesadilla with veal', 'beef roast or minced meat, 2 pieces of tortilla tortilla, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, cheese, olives, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/ffb24714-946d-43a8-a732-501cd742bd8c', 7.69, 57, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(288, 'Vegetarian Quesadilla', '2pcs tortillas, plate peppers, plate onions, mushrooms, beans, corn with spices, tomatoes, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/005c9ff4-61ae-4fa4-a204-3a14db63856f', 6.19, 57, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(289, 'Quesadilla with Pork', 'pork roast, 2 tortilla tortillas, plate peppers, mushrooms, beans, corn with spices, tomatoes, iceberg, yellow cheese, olives, cream sauce, mayonnaise sauce or hot salad', 'https://foodtiger.mobidonia.com/uploads/restorants/3d0b6a8c-9b56-46d9-bf3c-f69d2e3b30f8', 6.69, 57, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(290, 'Chicken Taco (250g)', 'tortilla tortilla 16cm, chicken on a plate, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/fcbc8d58-2e69-4b91-8dfe-b8ff8920023c', 3.49, 58, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(291, 'Taco with beef roasted meat (250g)', 'tortilla tortilla 16cm, veal minced meat, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/6681a3c8-17df-42db-a09a-aed0a327e226', 3.99, 58, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(292, 'Pork Taco (250g)', '16cm tortilla cake, pork roast, tomatoes, corn, olives, yellow cheese, iceberg, cream or mayonnaise sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/2a0560e8-b93a-405d-9f44-86fcde00069d', 3.49, 58, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(293, 'Tacos Veggie (250g)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/6f9e8892-4a28-4c99-ab24-57179a1424b9', 2.99, 58, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(294, 'Burrito with chicken', 'chicken on a plate, tortilla cake, rice, peppers on a plate, onion on a plate, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad ', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', 6.99, 59, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(295, 'Burrito Veggie', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cc167252-968b-4cf4-9964-86c6a5feba45', 5.99, 59, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(296, 'Burrito with beef roast', 'veal or minced meat (specify), tortilla bread, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce, or hot spit at will ', 'https://foodtiger.mobidonia.com/uploads/restorants/c0895e35-f4f9-4113-96d7-ecae6d27ed2b', 8.49, 59, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(297, 'Burrito with pork', 'pork roast, tortilla bread, rice, plate peppers, plate onion, red beans, mushrooms, spicy corn, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad, if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', 6.99, 59, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(298, 'Homemade Potatoes with Cheddar and Jalapenos (300g)', 'Cheddar cheese, butter, russet potatoes, rings, all purpose flour', 'https://foodtiger.mobidonia.com/uploads/restorants/b130e310-c024-49fa-99c2-1f0182b810f6', 6.99, 60, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(299, 'Homemade Potatoes with Ranch Sauce (300g)', 'Sour cream, ranch dressing, bacon, potatoes, cheddar cheese', 'https://foodtiger.mobidonia.com/uploads/restorants/dd0c87c9-d862-45a6-a933-7060d68c749c', 5.99, 60, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(300, 'Cheddar Sticks (250g)', 'String cheese, bread crumbs, smoked paprika, egg', 'https://foodtiger.mobidonia.com/uploads/restorants/3dfb1358-a853-4d7c-93f1-36eaf06ee2d7', 7.99, 60, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(301, 'Wild Wild West', 'freshly baked brioche bread, 100% freshly ground beef Limousine, crispy bacon, melted cheddar, brewed in Skapto beer onion rings, homemade BBQ sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/c8d27bcc-54da-4c18-b8e6-f1414c71612c', 8.99, 61, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(302, 'Skapto Bulleit Bourbon', 'juicy 100% minced beef, crispy bacon, melted cheddar, homemade Bulleit bourbon sauce, homemade marinated red onion, pickles, iceberg', 'https://foodtiger.mobidonia.com/uploads/restorants/4c2d9b73-685a-4252-84a3-6ba354f3a59c', 10.99, 61, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(303, 'Back to Basics', 'juicy 100% minced beef, melted cheddar, pickles, iceberg, homemade Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/643dd56b-684a-47f9-b72f-0fec59c16cb0', 7.99, 61, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(304, 'Cheesus', 'juicy 100% minced beef, crispy bacon, melted cheddar, fresh red onion, pickles, tomato, iceberg, lots of Hellman\'s mustard and ketchup', 'https://foodtiger.mobidonia.com/uploads/restorants/1084e812-7aa7-471c-9ae2-96dd5f561935', 9.99, 61, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(305, 'Skaptoburger', 'juicy 100% freshly ground veal, crispy bacon, melted cheddar, fresh red onion, iceberg, tomato, homemade spicy Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/7998ea89-e4b6-4021-ad47-6a1aa442e093', 9.99, 61, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(306, 'El Pollo Loco', 'Breaded until golden chicken fillet, crispy bacon, pickles, tomato, iceberg, mayonnaise and Hellman\'s mustard, barbecue sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/5757558a-94d7-4ba9-b39c-2e258701f051', 10.99, 61, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(307, 'SA7OSH1', 'juicy 100% minced beef, breaded to golden yellow, crispy bacon, melted cheddar, fresh red onion, arugula, homemade Skapto sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/5bf2bb33-1b3b-4911-a7f0-618d17719ba2', 12.99, 61, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(308, 'Homemade french fries with ranch sauce (150g)', 'French fries, homemade ranch dressing, cheddar cheese, fully ', 'https://foodtiger.mobidonia.com/uploads/restorants/aa05caca-d1c1-4b27-8615-78e8686b95e3', 2.98, 62, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(309, 'Homemade french fries with cheddar and jalapenos (190g)', 'Olive oil, cheddar, green mix', 'https://foodtiger.mobidonia.com/uploads/restorants/b3ee655e-29d2-4c35-86df-89b8200c9142', 3.97, 62, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(310, 'Homemade french fries (100g)', '100g', 'https://foodtiger.mobidonia.com/uploads/restorants/86289e4c-360c-4e5c-aa02-8d2ba791d954', 1.99, 62, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(311, 'Mexellente (350g)', 'iceberg, red pepper, tomato, sweet corn, red beans, fresh red onions, parsley, lime juice, sweet chili sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/58d57b7a-8873-4559-94af-cf50501a1bfa', 6.99, 63, '2024-06-08 15:57:48', '2024-06-08 15:57:48', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(312, 'Schweppes Tonic (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/5f3c11e2-8cf0-4512-b982-0b57e8b8eb07', 2.49, 64, '2024-06-08 15:57:48', '2024-06-08 15:57:48', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(313, 'Sprite (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/d592d42c-9818-481d-99b1-b8dc54dbe731', 2.49, 64, '2024-06-08 15:57:48', '2024-06-08 15:57:48', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(314, 'Orange Fanta (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/ca815d62-cdf8-4799-98c4-0e8f557b2659', 2.49, 64, '2024-06-08 15:57:48', '2024-06-08 15:57:48', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(315, 'Coca Cola (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/6dfb661a-cc55-4c27-b223-504b047c7e1a', 2.49, 64, '2024-06-08 15:57:48', '2024-06-08 15:57:48', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(316, 'Mozzarella Pizza', 'tomato sauce, mozzarella sabelli, cherry tomatoes, olives, pesto sauce, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f71ae2d7-f24f-4e1b-9bdd-7ab7143ce3c8', 10.99, 65, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(317, 'Prosciutto crust pizza', 'tomato sauce, mozzarella sabelli, prosciutto, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9b9886cb-5d4b-4bfe-a02a-dc3b94dae706', 14.99, 65, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(318, 'Pepperoni Pizza', 'tomato sauce, mozzarella Sabelli, Calabro salad (spicy), extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/4b26647d-52b8-43c5-8b62-708c99252c24', 14.99, 65, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(319, 'Carriola Pizza', 'tomato sauce, mozzarella sabelli, bacon, red onion, olives, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/e1e5559a-ca6d-4a34-80c6-b72c31d97d96', 14.99, 65, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(320, 'Perugia Pizza', 'tomato sauce, mozzarella sabelli, chicken fillet, red onion, fresh peppers, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/a8e8c22a-84cd-48d0-971a-2c98e695e387', 14.99, 65, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(321, 'Pizza Napoli', 'tomato sauce, mozzarella sabelli, ham, cherry tomatoes, emmental, arugula, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/5c8fa7eb-bc11-42e1-a1a5-ffb0b3d7a6b7', 14.99, 65, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(322, 'Margarita Pizza', 'tomato sauce, mozzarella Sabelli, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/9d180742-9fb3-4b46-8563-8c24c9004fd3', 10.49, 65, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(323, 'Combo Pizza 50/50 (70cm)', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cb7372d0-73a8-4551-bc31-22035d9551c4', 39.99, 65, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(324, 'Capricciosa Pizza', 'tomato sauce, mozzarella sabelli, ham, fresh mushrooms, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0102bebe-b6c4-46b0-9195-ee06bca71a37', 14.99, 65, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(325, 'Quattro Formaggi Pizza', 'cream (animal), mozzarella Sabelli, blue cheese, emmental, parmesan, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/0054144d-131c-4807-a209-cee855415182', 14.99, 65, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(326, 'Marco Polo Pizza', 'tomato sauce, Sabelli mozzarella, chicken fillet, smoked cheese, corn, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f77218a9-676e-434e-ac5b-4ae3dc5795b3', 14.99, 65, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1, 1, 21.00, NULL, 0, 0.00, 1, 0),
(327, 'Schweppes Tonic (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/5f3c11e2-8cf0-4512-b982-0b57e8b8eb07', 2.49, 66, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0);
INSERT INTO `items` (`id`, `name`, `description`, `image`, `price`, `category_id`, `created_at`, `updated_at`, `available`, `has_variants`, `vat`, `deleted_at`, `enable_system_variants`, `discounted_price`, `qty`, `qty_management`) VALUES
(328, 'Sprite (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/d592d42c-9818-481d-99b1-b8dc54dbe731', 2.49, 66, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(329, 'Orange Fanta (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/ca815d62-cdf8-4799-98c4-0e8f557b2659', 2.49, 66, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(330, 'Coca Cola (330ml)', '(330ml.)', 'https://foodtiger.mobidonia.com/uploads/restorants/6dfb661a-cc55-4c27-b223-504b047c7e1a', 2.49, 66, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(331, 'Caprese Salad (350gr)', 'peeled tomatoes, mozzarella salad, Genovese pesto', 'https://foodtiger.mobidonia.com/uploads/restorants/bd5292e7-e898-479d-8921-4c47a776ba82', 9.99, 67, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(332, 'Caesar Salad (400g)', 'iceberg, bacon, chicken breast, parmesan, Caesar sauce', 'https://foodtiger.mobidonia.com/uploads/restorants/25ed56dc-45cc-473f-ad00-d4b449acc71a', 10.99, 67, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(333, 'Salad Napoli (350g)', 'iceberg, arugula, cherry tomatoes, mozzarella salad, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/93641a19-dba6-4010-a852-0e88da83a01f', 9.99, 67, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(334, 'Green tuna salad (400g)', 'lettuce, cucumbers, tuna, olive, corn, lemon, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/d3379607-df34-4ed0-8f87-8bb6f73ed16d', 9.99, 67, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(335, 'Green salad (350g)', 'lettuce, cucumbers, radishes, onions, egg, salad dressing: (Extra Virgin olive oil, Modena balsamic vinegar, honey and mustard)', 'https://foodtiger.mobidonia.com/uploads/restorants/2e7eb9a6-5307-4ec7-8cf8-86490d4c2363', 7.99, 67, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(336, 'Greek Salad (500g)', 'tomatoes, cucumbers, green pepper, red onion, olive, feta cheese, extra virgin olive oil', 'https://foodtiger.mobidonia.com/uploads/restorants/f5a8b88d-9b94-44fc-9555-2f0fe043d624', 9.99, 67, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(337, 'Burrito with chicken', 'chicken on a plate, tortilla cake, rice, peppers on a plate, onion on a plate, red beans, mushrooms, corn with spices, tomatoes, olives, iceberg, yellow cheese, cream sauce, mayonnaise sauce or hot salad ', 'https://foodtiger.mobidonia.com/uploads/restorants/3e571ad8-e161-4245-91d9-88b47d6d6770', 6.99, 68, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(338, 'Burrito Veggie', '', 'https://foodtiger.mobidonia.com/uploads/restorants/cc167252-968b-4cf4-9964-86c6a5feba45', 5.99, 68, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(339, 'Burrito with beef roast', 'veal or minced meat (specify), tortilla bread, rice, plate peppers, onion, red beans, mushrooms, corn with spices, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce, or hot spit at will ', 'https://foodtiger.mobidonia.com/uploads/restorants/c0895e35-f4f9-4113-96d7-ecae6d27ed2b', 8.49, 68, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(340, 'Burrito with pork', 'pork roast, tortilla bread, rice, plate peppers, plate onion, red beans, mushrooms, spicy corn, tomatoes, iceberg, olives, yellow cheese, cream sauce, mayonnaise sauce or hot salad, if desired', 'https://foodtiger.mobidonia.com/uploads/restorants/4384df9b-9656-49d1-bfc1-9b5e85e1193a', 6.99, 68, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1, 0, 21.00, NULL, 0, 0.00, 1, 0),
(341, 'ZInger Burger', 'Zinger Burger', '9d7abe3a-b084-49c2-9fa5-932125614137', 5000.00, 69, '2024-06-08 16:53:27', '2024-08-30 18:27:11', 1, 1, 10.00, NULL, 1, 0.00, -94, 0),
(342, 'Salad', 'this is the salad', 'ab154552-b32b-4c29-acc8-86151d133d95', 200.00, 70, '2024-06-19 12:10:02', '2024-06-19 12:10:02', 1, 0, 0.00, NULL, 0, 0.00, 1, 0),
(343, 'Biryani', 'This is the Biryani', 'a5ea7a2f-9076-40dc-be35-d60c9c2d923e', 2000.00, 71, '2024-06-19 12:11:51', '2024-06-19 12:11:51', 1, 0, 0.00, NULL, 0, 0.00, 1, 0),
(344, 'www', 'asdzd', '8fd76f03-eb45-4bdb-9bb6-5ac0fcbd0ed3', 12000.00, 69, '2024-07-03 00:12:42', '2024-08-30 18:27:11', 1, 0, 0.00, NULL, 0, 0.00, -35, 0),
(345, 'sadads', 'asdasda', '219d270e-343e-40e4-8fe5-830f994b94fb', 1600.00, 69, '2024-07-03 00:13:08', '2024-08-30 18:27:11', 1, 1, 0.00, NULL, 0, 0.00, -14, 0),
(346, 'sadf', 'sadfsfd', 'ea613af2-8dea-4ef8-a22e-8c6d1c686039', 1000.00, 69, '2024-07-03 16:53:28', '2024-08-29 23:55:27', 1, 0, 10.00, NULL, 0, 0.00, -17, 0),
(347, 'adsf', 'sadfxcv', '', 9.00, 69, '2024-07-03 16:55:05', '2024-07-07 23:33:06', 1, 0, 0.00, '2024-07-07 23:33:06', 0, 0.00, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_has_allergens`
--

CREATE TABLE `item_has_allergens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `allergen_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `language` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localmenus`
--

CREATE TABLE `localmenus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(3) NOT NULL,
  `languageName` varchar(191) NOT NULL,
  `default` int(11) NOT NULL DEFAULT 0 COMMENT '0 - No, 1 - Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_29_200844_create_languages_table', 1),
(4, '2018_08_29_205156_create_translations_table', 1),
(5, '2019_05_03_000001_create_customer_columns', 1),
(6, '2019_05_03_000002_create_subscriptions_table', 1),
(7, '2019_05_03_000003_create_subscription_items_table', 1),
(8, '2020_02_06_010033_create_permission_tables', 1),
(9, '2020_02_06_022212_create_restorants_table', 1),
(10, '2020_02_09_015116_create_status_table', 1),
(11, '2020_02_09_152551_create_categories_table', 1),
(12, '2020_02_09_152656_create_items_table', 1),
(13, '2020_02_11_052117_create_address_table', 1),
(14, '2020_02_11_054259_create_orders_table', 1),
(15, '2020_02_20_094727_create_settings_table', 1),
(16, '2020_03_25_134914_create_pages_table', 1),
(17, '2020_04_03_143518_update_settings_table', 1),
(18, '2020_04_10_202027_create_payments_table', 1),
(19, '2020_04_11_165819_update_table_orders', 1),
(20, '2020_04_22_105556_update_items_table', 1),
(21, '2020_04_23_212320_update_restorants_table', 1),
(22, '2020_04_23_212502_update_orders_table', 1),
(23, '2020_04_28_112519_update_address_table', 1),
(24, '2020_05_07_122727_create_hours_table', 1),
(25, '2020_05_09_012646_update_orders_add_delivery_table', 1),
(26, '2020_05_09_024507_add_options_to_settings_table', 1),
(27, '2020_05_20_232204_create_notifications_table', 1),
(28, '2020_06_03_134258_change_radius_to_delivery_area_restorants_table', 1),
(29, '2020_06_26_131803_create_sms_verifications_table', 1),
(30, '2020_07_12_182829_create_extras_table', 1),
(31, '2020_07_14_155509_create_plan_table', 1),
(32, '2020_07_23_183000_update_restorants_with_featured', 1),
(33, '2020_07_28_131511_update_users_sms_verification', 1),
(34, '2020_07_30_102916_change_json_to_string', 1),
(35, '2020_08_01_014851_create_variants', 1),
(36, '2020_08_14_003718_create_ratings_table', 1),
(37, '2020_08_18_035731_update_table_plans', 1),
(38, '2020_08_18_053012_update_user_add_plan', 1),
(39, '2020_09_02_131604_update_orders_time_to_prepare', 1),
(40, '2020_09_09_080747_create_cities_table', 1),
(41, '2020_09_28_131250_update_item_softdelete', 1),
(42, '2020_10_24_150254_create_tables_table', 1),
(43, '2020_10_25_021321_create_visits_table', 1),
(44, '2020_10_26_004421_update_orders_client_nullable', 1),
(45, '2020_10_26_104351_update_restorant_table', 1),
(46, '2020_10_26_190049_update_plan', 1),
(47, '2020_10_27_180123_create_stripe_payment', 1),
(48, '2020_11_01_190615_update_user_table', 1),
(49, '2020_11_05_081140_create_paths_table', 1),
(50, '2020_11_14_111220_create_phone_in_orders', 1),
(51, '2020_11_17_211252_update_logo_in_settings', 1),
(52, '2020_11_25_182453_create_paypal_payment', 1),
(53, '2020_11_25_225536_update_user_for_paypal_subsc', 1),
(54, '2020_11_27_102829_update_restaurants_for_delivery_pickup', 1),
(55, '2020_11_27_165901_create_coupons_table', 1),
(56, '2020_12_02_192213_update_for_whatsapp_order', 1),
(57, '2020_12_02_195333_update_for_mollie_payment', 1),
(58, '2020_12_07_142304_create_banners_table', 1),
(59, '2020_12_10_155335_wp_address', 1),
(60, '2020_12_14_195627_update_for_paystack_sub', 1),
(61, '2020_12_15_130511_update_paystack_verification', 1),
(62, '2020_12_27_155822_create_restaurant_multilanguage', 1),
(63, '2020_12_27_162902_update_restaurant_with_currency', 1),
(64, '2021_01_16_093708_update_restorant_with_pay_link', 1),
(65, '2021_01_22_142723_create_crud_for_whatsapp_landing', 1),
(66, '2021_02_16_065037_create_configs_table', 2),
(67, '2021_02_18_140330_allow_null_on_config_value', 2),
(68, '2021_02_22_135519_update_settinga_table', 2),
(69, '2021_02_26_113854_order_fee_update', 2),
(70, '2021_03_23_135952_update_config_table', 2),
(71, '2021_04_17_002457_update_restables', 2),
(72, '2021_04_17_231310_update_restablesagain', 2),
(73, '2021_04_22_184249_update_user_with_staff', 2),
(74, '2021_04_26_190410_create_cart_storage_table', 2),
(75, '2021_05_19_032734_update_order_with_employee_id', 2),
(76, '2021_05_19_124342_create_simple_delivery_areas', 2),
(77, '2021_05_28_070715_create_expenses', 2),
(78, '2021_07_01_084847_make_restaurant_soft_delete', 2),
(79, '2021_07_16_170627_make_user_soft_delete', 2),
(80, '2021_07_16_172430_make_user_email_not_unique', 2),
(81, '2021_07_21_153807_rename_to_company', 2),
(82, '2021_08_04_073843_add_md_to_orders', 2),
(83, '2021_09_03_131601_update_with_default_variants', 2),
(84, '2021_09_04_091444_cat_sd', 2),
(85, '2021_10_09_162446_update_order_with_coupons', 2),
(86, '2021_11_06_104921_create_item_has_allergens', 2),
(87, '2022_01_26_085729_update_item_desc_to_text', 2),
(88, '2022_02_26_234212_update_users_with_expotoken', 2),
(89, '2022_04_06_224707_update_items_with_discount_price', 2),
(90, '2022_04_14_082828_update_companies_with_can_dinein', 2),
(91, '2022_04_14_091003_update_delivery_areas_with_phone', 2),
(92, '2022_05_19_071840_compatible_with_stripe', 2),
(93, '2022_07_23_081211_kds', 2),
(94, '2022_08_03_170522_user_has_categories', 2),
(95, '2022_12_23_100529_update_orders_with_id_per_vendor', 2),
(96, '2022_12_27_012420_update_posts_description_table', 2),
(97, '2023_01_23_175344_large_numbers', 2),
(98, '2023_05_22_203323_update_order__table_with_tips', 2),
(99, '2023_05_23_212332_update_items_with_stock', 2),
(100, '2023_05_26_162559_vendor_has_categories', 2),
(101, '2023_06_05_182042_change_restaurant_id_in_columns', 2),
(102, '2023_06_13_093308_change_items_qtymng', 2),
(103, '2024_02_22_233754_rename_restorant_id_to_company_id_in_categories', 2),
(104, '2025_07_21_162114_make_pure_saas', 2),
(105, '2024_07_03_173622_add_waiter_name_to_tables_table', 3),
(106, '2024_07_06_121453_create_pdfs_table', 4),
(107, '2024_07_07_193635_add_columns_to_plan_table', 5),
(108, '2024_07_07_210647_add_audio_to_users_table', 6),
(109, '2024_07_07_212244_add_audio_to_restoareas_table', 7),
(110, '2024_07_07_215324_add_audio_to_companies_table', 8),
(111, '2024_07_08_013039_add_enable_audio_to_companies_table', 9),
(119, '2024_07_29_173751_create_transactions_table', 10),
(120, '2024_08_25_114451_create_groups_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(2, 'App\\User', 35),
(2, 'App\\User', 36),
(2, 'App\\User', 37),
(2, 'App\\User', 38),
(2, 'App\\User', 39),
(2, 'App\\User', 40),
(2, 'App\\User', 41),
(2, 'App\\User', 42),
(2, 'App\\User', 43),
(2, 'App\\User', 45),
(2, 'App\\User', 46),
(2, 'App\\User', 47),
(2, 'App\\User', 48),
(2, 'App\\User', 49),
(2, 'App\\User', 50),
(2, 'App\\User', 51),
(2, 'App\\User', 52),
(2, 'App\\User', 54),
(2, 'App\\User', 60),
(2, 'App\\User', 61),
(5, 'App\\User', 3),
(5, 'App\\User', 4),
(5, 'App\\User', 5),
(5, 'App\\User', 6),
(5, 'App\\User', 7),
(5, 'App\\User', 8),
(5, 'App\\User', 9),
(5, 'App\\User', 10),
(5, 'App\\User', 11),
(5, 'App\\User', 12),
(5, 'App\\User', 13),
(5, 'App\\User', 14),
(5, 'App\\User', 15),
(5, 'App\\User', 16),
(5, 'App\\User', 17),
(5, 'App\\User', 18),
(5, 'App\\User', 19),
(5, 'App\\User', 20),
(5, 'App\\User', 21),
(5, 'App\\User', 22),
(5, 'App\\User', 23),
(5, 'App\\User', 24),
(5, 'App\\User', 25),
(5, 'App\\User', 26),
(5, 'App\\User', 27),
(5, 'App\\User', 28),
(5, 'App\\User', 29),
(5, 'App\\User', 30),
(5, 'App\\User', 31),
(5, 'App\\User', 32),
(5, 'App\\User', 33),
(5, 'App\\User', 34);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00115e9e-f403-4929-9948-58c5f181f6c5', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-06-09 08:40:21', '2024-06-09 08:40:21'),
('01369a80-bd2a-447b-a4b1-222c3c2c8552', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 22:28:56', '2024-07-07 22:28:56'),
('025641d3-cf48-480b-be05-32a27db4b7e3', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 01:46:12', '2024-07-08 01:46:12'),
('032be4fa-8144-42af-9aee-78d5c91b096f', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 04:27:32', '2024-07-08 04:27:32'),
('03d89d4c-d931-4b57-ba54-192b556fd823', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-08 10:45:10', '2024-07-08 10:45:10'),
('0a55906f-91a4-4952-a893-93e90a6eb8a2', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-07 15:03:58', '2024-07-07 15:03:58'),
('176f63cb-bbab-4c80-88bf-85507c5bb4b6', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-08 00:56:52', '2024-07-08 00:56:52'),
('178304fc-3e69-4ec1-8c20-f2bbf165e40f', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-07 23:58:11', '2024-07-07 23:58:11'),
('1bf28a61-81d2-4582-a103-06e1de49be9c', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 02:46:51', '2024-07-08 02:46:51'),
('1c68f71b-19e0-45f8-94c2-4832b832bdbd', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - admin1\"}', NULL, '2024-07-08 00:54:08', '2024-07-08 00:54:08'),
('203239ad-2aa9-4036-8e7b-ace6872e1ac3', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-08 00:55:45', '2024-07-08 00:55:45'),
('21a58f85-45f0-4dae-9cfc-89e2fce4acc1', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 01:04:08', '2024-07-08 01:04:08'),
('23aae1e4-04b9-490a-9cc8-96526a4638eb', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-07 20:43:23', '2024-07-07 20:43:23'),
('26a7f032-5871-4746-bbdf-5670c6b2766e', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 10:47:43', '2024-07-08 10:47:43'),
('27769e95-61e7-49fd-9629-38a3a1d8bf2f', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-08 00:32:03', '2024-07-08 00:32:03'),
('2c5a68a3-044a-4356-a32f-253fd6564e3c', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-07 20:52:39', '2024-07-07 20:52:39'),
('30ed0a2c-b85a-4c9d-bcbf-ab5f0f5eeb4f', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 10:47:03', '2024-07-08 10:47:03'),
('35eb3ff3-635e-449f-a532-6e20ca0cd919', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:54:11', '2024-07-08 03:54:11'),
('36dd7f0f-53c5-4b58-bc10-b346289780cd', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 00:42:17', '2024-07-08 00:42:17'),
('379857be-9bba-4ea2-ac16-43c42206e3dd', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-07 20:51:13', '2024-07-07 20:51:13'),
('38303e25-29ba-40bf-8aee-5b828650bd18', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-09 06:58:29', '2024-07-09 06:58:29'),
('3b761b53-168d-4e83-9162-3acc19597c05', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-08 00:45:00', '2024-07-08 00:45:00'),
('43eac735-982d-4619-9364-70b748869adb', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-06-08 16:54:27', '2024-06-08 16:54:27'),
('4b9e392e-7fa2-478d-9e9e-06a10d3ece56', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:28:10', '2024-07-08 03:28:10'),
('4bbec5cd-74b7-40d9-83ab-f2ea19c6507e', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:17:53', '2024-07-08 03:17:53'),
('4da11163-649f-4ffd-9509-ec6b7053a84d', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-07 11:59:09', '2024-07-07 11:59:09'),
('4e48cbfc-80fe-4c37-99b5-8c435514946a', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-07 20:43:01', '2024-07-07 20:43:01'),
('4f024153-d1e6-4b9d-b51b-f00a38f26eec', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:08:34', '2024-07-08 03:08:34'),
('53c2beea-2d49-487c-8e71-97f98f5f934e', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - admin1\"}', NULL, '2024-07-08 01:03:06', '2024-07-08 01:03:06'),
('547d594b-6e62-4e7b-99b7-665031e1849a', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 02:08:46', '2024-07-08 02:08:46'),
('5783cc3b-004d-4463-a2f8-b265b4897d76', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-08 01:00:06', '2024-07-08 01:00:06'),
('58527991-ff3c-4720-83d5-6395227f732f', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-09 06:47:13', '2024-07-09 06:47:13'),
('5a1f2c79-0b66-4723-bb0c-015f0dacb13d', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-08 00:05:18', '2024-07-08 00:05:18'),
('5a6dea6a-cfdc-48da-a45b-1196a5e8a9a3', 'App\\Notifications\\OrderNotification', 'App\\User', 1, '{\"title\":\"Your order is ready.\",\"body\":\"Your order is ready for pickup. We are expecting you.\"}', NULL, '2024-06-09 08:41:52', '2024-06-09 08:41:52'),
('5ddcaefd-535f-47f2-80cb-5e9f41614ded', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - 1\"}', NULL, '2024-07-07 13:56:06', '2024-07-07 13:56:06'),
('5f07ca2e-0209-4bd2-bb4a-5f1b723da9b4', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 09:03:19', '2024-07-08 09:03:19'),
('5f8d3bd5-846b-48ec-9e5c-2e9b7b9b5141', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-07 14:58:50', '2024-07-07 14:58:50'),
('605327e3-a28a-4a1e-a01d-46c9635efcb5', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 02:30:46', '2024-07-08 02:30:46'),
('622aae4d-c114-4b34-b621-9b8078a82284', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-07 20:34:03', '2024-07-07 20:34:03'),
('63c473c1-4f58-435c-ad68-cc2bca3c19a7', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-07 20:55:15', '2024-07-07 20:55:15'),
('6f798468-1477-4a08-80d3-5df697fc5c58', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 23:58:42', '2024-07-07 23:58:42'),
('70ea0933-47fc-4700-80bc-8833f51c666e', 'App\\Notifications\\OrderNotification', 'App\\User', 1, '{\"title\":\"Your order has been accepted\",\"body\":\"order#604 We are now working on it!\"}', NULL, '2024-06-09 08:40:58', '2024-06-09 08:40:58'),
('74a83a07-6e0f-4661-b7e4-908c918c2786', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 10:49:44', '2024-07-08 10:49:44'),
('76fca8b8-6ed4-4312-86a1-262f1f6adbb7', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 20:16:32', '2024-07-07 20:16:32'),
('7c503e35-5975-4a25-b5e5-98acc5fc3070', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-26 13:48:51', '2024-07-26 13:48:51'),
('7de37176-6dcc-4b26-be93-eb83e1daa73d', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 02:43:03', '2024-07-08 02:43:03'),
('8491f1e6-2379-4cc3-8c47-f21270036fec', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - 1\"}', NULL, '2024-07-07 14:31:16', '2024-07-07 14:31:16'),
('863f87e1-d5a7-48de-92e5-a7bfe1020237', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 20:33:22', '2024-07-07 20:33:22'),
('86f74efe-4bed-47c4-9cf1-e43375dd21b0', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 20:19:02', '2024-07-07 20:19:02'),
('887291cc-76d9-499c-bb0f-e6f42f8faf62', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-07 14:47:27', '2024-07-07 14:47:27'),
('8d1e6f29-7d33-4189-9779-56f5e92adde2', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:57:26', '2024-07-08 03:57:26'),
('91048dd5-5ef7-4873-be81-7fe436b4bc50', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-07 22:22:53', '2024-07-07 22:22:53'),
('964630fe-c4f1-4dc0-9eab-4767eefa45d7', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:48:00', '2024-07-08 03:48:00'),
('966e7e94-0d78-4ca0-95ce-364a80fdc51b', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 04:01:34', '2024-07-08 04:01:34'),
('96f23cfb-e300-4359-b96d-c151118898ea', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-07 20:49:25', '2024-07-07 20:49:25'),
('9730b0ff-41f4-4d17-b63e-523d68420dee', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 22:15:58', '2024-07-07 22:15:58'),
('97d3b885-654f-47cf-a1ed-65618dd34303', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 09:23:41', '2024-07-08 09:23:41'),
('98b04f22-d044-48bb-b64e-8444326d0302', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-07 12:22:11', '2024-07-07 12:22:11'),
('9afdaa26-fd06-434b-8ffc-607390cdf309', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"Your order has been accepted\",\"body\":\"order#609 We are now working on it!\"}', NULL, '2024-07-07 19:04:35', '2024-07-07 19:04:35'),
('9e598693-1692-4f9f-9aff-411813c1923e', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-07 20:40:33', '2024-07-07 20:40:33'),
('9ee44324-c130-460b-9df7-c2969b8a9b76', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - admin1\"}', NULL, '2024-07-08 01:48:23', '2024-07-08 01:48:23'),
('a0450bea-b6c5-43a5-9831-2911603a4948', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 22:03:36', '2024-07-07 22:03:36'),
('a98112fe-624a-4858-8752-90b45d896574', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-08 02:09:57', '2024-07-08 02:09:57'),
('ababc22c-16ad-4739-9c1c-eb9edfd2b95b', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 00:38:50', '2024-07-08 00:38:50'),
('b0dc3d3c-e73d-4645-92e4-730488d38a14', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-08 01:40:26', '2024-07-08 01:40:26'),
('b0ecd6c5-143f-44bd-9587-529bdd59d268', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-06 21:19:02', '2024-07-06 21:19:02'),
('b2582e27-fa89-452a-9042-2a5816a07639', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 22:10:49', '2024-07-07 22:10:49'),
('b9394282-2028-4dd6-b0ec-160fecbd1e8b', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 02:53:13', '2024-07-08 02:53:13'),
('bed40837-ae1f-4fb7-ad40-72f9f1dedbc7', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:38:41', '2024-07-08 03:38:41'),
('c284c38e-d490-4af4-855e-dbe690763899', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 04:05:55', '2024-07-08 04:05:55'),
('c434adfa-357c-4cf0-b58d-3737ca92c0f4', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 23:55:32', '2024-07-07 23:55:32'),
('c9de29fc-8e93-4cf6-a9f4-3edab729c249', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-07 14:55:47', '2024-07-07 14:55:47'),
('ce1d3862-5d9e-4a87-aa44-e8090587ba47', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 04:34:15', '2024-07-08 04:34:15'),
('cfb6ecaa-28ad-484b-a7ea-d46b89e3ffba', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-07 21:01:22', '2024-07-07 21:01:22'),
('d605360a-8e4a-4e7c-8a7e-1e7d803bd44a', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:05:25', '2024-07-08 03:05:25'),
('d709a62c-17c1-4535-8236-cd0f727f350a', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 03:31:48', '2024-07-08 03:31:48'),
('d79a00a3-02ee-46df-bc76-eecd127af747', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-08 02:11:33', '2024-07-08 02:11:33'),
('d95a6186-7727-41b3-9da5-2002f5774f09', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 22:24:52', '2024-07-07 22:24:52'),
('dad06033-a7f0-4fd1-bf0d-d3e4e6c6d651', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-07 22:04:26', '2024-07-07 22:04:26'),
('dad1888b-2a86-4a3b-bc8f-c3ac6f4d34a1', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-06-09 08:01:42', '2024-06-09 08:01:42'),
('e389ca0f-91ad-495c-8685-40b2b9fb616b', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-07 20:56:45', '2024-07-07 20:56:45'),
('e3ecad12-99a0-495e-8c83-2683de088a84', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-06-08 16:56:14', '2024-06-08 16:56:14'),
('e5ca02fc-216d-4edd-b6d6-893df4f60583', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 01:44:48', '2024-07-08 01:44:48'),
('e6dbaa54-b2c5-4806-9083-8242a9efeebf', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-07 22:06:24', '2024-07-07 22:06:24'),
('ecb786c6-a7ee-4103-81ba-4fbcc0530071', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 20:54:08', '2024-07-07 20:54:08'),
('ee49c954-4409-40d6-b17b-e973d1d4661f', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 20\"}', NULL, '2024-07-07 20:42:03', '2024-07-07 20:42:03'),
('f0a0538b-ac06-45df-b57c-b870ef460efc', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 12\"}', NULL, '2024-07-07 20:49:59', '2024-07-07 20:49:59'),
('f739c41e-b874-4e44-91c4-0617c434f374', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"Rotterdam - Table 15\"}', NULL, '2024-07-08 00:53:01', '2024-07-08 00:53:01'),
('ffb84efe-22a1-4e22-9218-6b95987d6df2', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-07-08 04:21:07', '2024-07-08 04:21:07');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `options` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `item_id`, `name`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL),
(2, 7, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL),
(3, 8, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL),
(4, 8, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL),
(5, 9, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL),
(6, 9, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL),
(7, 10, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL),
(8, 10, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL),
(9, 11, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL),
(10, 11, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL),
(11, 12, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL),
(12, 12, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL),
(13, 13, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL),
(14, 13, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL),
(15, 14, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL),
(16, 14, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL),
(17, 15, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL),
(18, 15, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL),
(19, 16, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL),
(20, 16, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL),
(21, 17, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL),
(22, 17, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL),
(23, 67, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:00', '2024-06-08 15:57:00', NULL),
(24, 67, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL),
(25, 68, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL),
(26, 68, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL),
(27, 69, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL),
(28, 69, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL),
(29, 70, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL),
(30, 70, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL),
(31, 71, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL),
(32, 71, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL),
(33, 72, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL),
(34, 72, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL),
(35, 73, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL),
(36, 73, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL),
(37, 74, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL),
(38, 74, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL),
(39, 75, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL),
(40, 75, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL),
(41, 76, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL),
(42, 76, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL),
(43, 77, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL),
(44, 77, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL),
(45, 95, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL),
(46, 95, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL),
(47, 96, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL),
(48, 96, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL),
(49, 97, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL),
(50, 97, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL),
(51, 98, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL),
(52, 98, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL),
(53, 99, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL),
(54, 99, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL),
(55, 100, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL),
(56, 100, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL),
(57, 101, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL),
(58, 101, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL),
(59, 102, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL),
(60, 102, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL),
(61, 103, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL),
(62, 103, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL),
(63, 104, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL),
(64, 104, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL),
(65, 105, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL),
(66, 105, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL),
(67, 150, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL),
(68, 150, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL),
(69, 151, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL),
(70, 151, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL),
(71, 152, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL),
(72, 152, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL),
(73, 153, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL),
(74, 153, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL),
(75, 154, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL),
(76, 154, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL),
(77, 155, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL),
(78, 155, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL),
(79, 156, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL),
(80, 156, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL),
(81, 157, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL),
(82, 157, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL),
(83, 158, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL),
(84, 158, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL),
(85, 159, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL),
(86, 159, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL),
(87, 160, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL),
(88, 160, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL),
(89, 174, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL),
(90, 174, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL),
(91, 175, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL),
(92, 175, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL),
(93, 176, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL),
(94, 176, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL),
(95, 177, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL),
(96, 177, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL),
(97, 178, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL),
(98, 178, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL),
(99, 179, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL),
(100, 179, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL),
(101, 180, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL),
(102, 180, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL),
(103, 181, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL),
(104, 181, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL),
(105, 182, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL),
(106, 182, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL),
(107, 183, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL),
(108, 183, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL),
(109, 184, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL),
(110, 184, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL),
(111, 245, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL),
(112, 245, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL),
(113, 246, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL),
(114, 246, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL),
(115, 247, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL),
(116, 247, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL),
(117, 248, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL),
(118, 248, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL),
(119, 249, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL),
(120, 249, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL),
(121, 250, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL),
(122, 250, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL),
(123, 251, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL),
(124, 251, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL),
(125, 252, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL),
(126, 252, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL),
(127, 253, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL),
(128, 253, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL),
(129, 254, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL),
(130, 254, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL),
(131, 255, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL),
(132, 255, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL),
(133, 256, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL),
(134, 256, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL),
(135, 257, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL),
(136, 257, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL),
(137, 258, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL),
(138, 258, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL),
(139, 259, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL),
(140, 259, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL),
(141, 260, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL),
(142, 260, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL),
(143, 261, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL),
(144, 261, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL),
(145, 262, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL),
(146, 262, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL),
(147, 263, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL),
(148, 263, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL),
(149, 264, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL),
(150, 264, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL),
(151, 265, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL),
(152, 265, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL),
(153, 266, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL),
(154, 266, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL),
(155, 316, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL),
(156, 316, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL),
(157, 317, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL),
(158, 317, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL),
(159, 318, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL),
(160, 318, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL),
(161, 319, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL),
(162, 319, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL),
(163, 320, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL),
(164, 320, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL),
(165, 321, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL),
(166, 321, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL),
(167, 322, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL),
(168, 322, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL),
(169, 323, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL),
(170, 323, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL),
(171, 324, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL),
(172, 324, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL),
(173, 325, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL),
(174, 325, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL),
(175, 326, 'Size', 'Small,Medium,Large,Family', '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL),
(176, 326, 'Crust', 'Hand-Tosset,Thin Crust,Double Decker', '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL),
(177, 341, 'Size', 'Small,Medium,Large', '2024-06-09 08:36:19', '2024-06-09 08:36:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restorant_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_price` double(8,2) NOT NULL,
  `order_price` double(8,2) NOT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `comment` varchar(500) NOT NULL,
  `lat` varchar(191) DEFAULT NULL,
  `lng` varchar(191) DEFAULT NULL,
  `srtipe_payment_id` varchar(191) DEFAULT NULL,
  `fee` double(8,2) NOT NULL DEFAULT 0.00,
  `fee_value` double NOT NULL DEFAULT 0,
  `static_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_method` int(11) NOT NULL DEFAULT 1 COMMENT '1- Delivery, 2- Pickup',
  `delivery_pickup_interval` varchar(191) NOT NULL DEFAULT '',
  `vatvalue` double(8,2) DEFAULT 0.00,
  `payment_processor_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `time_to_prepare` int(11) DEFAULT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `whatsapp_address` varchar(191) DEFAULT NULL,
  `payment_link` varchar(191) NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `md` varchar(191) NOT NULL DEFAULT '',
  `coupon` varchar(191) DEFAULT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `kds_finished` int(11) NOT NULL DEFAULT 0,
  `id_per_vendor` varchar(191) DEFAULT '',
  `tip` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`, `payment_link`, `employee_id`, `deleted_at`, `md`, `coupon`, `discount`, `kds_finished`, `id_per_vendor`, `tip`) VALUES
(1, '2023-07-04 19:29:18', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 50.00, NULL, 'paid', 'Quibusdam eos rerum eum quod ut quae soluta. Et assumenda commodi in et quia. Aliquam omnis fugit eum facere sit pariatur. Sit ea consequatur quos corrupti repudiandae exercitationem accusamus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000002', 0.00),
(2, '2023-07-01 06:39:40', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 67.00, NULL, 'paid', 'Ab minus nemo aspernatur delectus consequatur molestias animi. Necessitatibus cupiditate officia voluptatem expedita. Nobis consectetur dolores qui voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000003', 0.00),
(3, '2023-10-19 21:33:02', '2024-06-08 16:09:36', NULL, NULL, 3, NULL, 0.00, 89.00, NULL, 'paid', 'Ut a omnis dolores expedita corporis. Assumenda tempora alias natus debitis commodi. Id sit voluptatum labore laborum laborum vel ut sed. Nemo provident laborum ipsa sunt id provident error adipisci.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 32, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000002', 0.00),
(4, '2023-11-23 23:03:20', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 82.00, NULL, 'paid', 'Qui aperiam et nostrum consequatur non. Est vitae fuga reiciendis sit sapiente quia illo nihil. Temporibus magnam laborum iste tempore.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000004', 0.00),
(5, '2024-04-25 03:29:17', '2024-06-08 16:09:27', NULL, NULL, 1, NULL, 0.00, 90.00, NULL, 'paid', 'Ex in exercitationem et culpa dolores. Et saepe provident iure ea. Sed harum sit eos consequatur. Ipsa autem veniam ex.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:27', '', NULL, 0.00, 0, '000002', 0.00),
(6, '2024-03-17 15:25:55', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 65.00, NULL, 'paid', 'Nesciunt nesciunt perspiciatis nemo voluptatibus ea blanditiis aut. Magnam et et alias sit tempore error. Est sunt qui corrupti dolorem. Rem rem vitae ex.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000003', 0.00),
(7, '2023-08-13 10:45:56', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 61.00, NULL, 'paid', 'Sint quos omnis vero. Animi vel ipsa eligendi consequuntur quasi quis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000004', 0.00),
(8, '2023-12-22 17:48:16', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 39.00, NULL, 'paid', 'Neque dignissimos ex et eligendi ut. Quasi iure voluptate ut omnis perspiciatis adipisci est. Maxime vel optio quia sit magnam libero.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000005', 0.00),
(9, '2024-01-10 22:37:06', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 85.00, NULL, 'paid', 'Nemo et aspernatur omnis. Aut tempora iste cumque qui nulla odit debitis. Alias voluptatem nemo sit nobis blanditiis ipsum quam. Voluptatibus ut et aut alias rerum voluptas possimus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000005', 0.00),
(10, '2023-09-23 17:18:28', '2024-06-08 16:09:36', NULL, NULL, 3, NULL, 0.00, 80.00, NULL, 'paid', 'Voluptas vitae similique beatae laborum ea voluptas at. Ipsam itaque voluptas soluta ad itaque est maiores. Fugit ut occaecati aut maxime. Ut asperiores eveniet ratione sint ea velit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000003', 0.00),
(11, '2024-03-03 16:55:08', '2024-06-08 16:09:36', NULL, NULL, 3, NULL, 0.00, 37.00, NULL, 'paid', 'Excepturi sint itaque occaecati blanditiis. Provident veniam minima at sed eum corrupti provident. Molestias nihil rerum sed sint alias sint.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000004', 0.00),
(12, '2023-10-30 06:07:48', '2024-06-08 16:09:36', NULL, NULL, 3, NULL, 0.00, 79.00, NULL, 'paid', 'Fugiat dicta doloremque numquam architecto error maxime. Animi qui ad nihil neque. Voluptatum consectetur fugit et voluptatem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000005', 0.00),
(13, '2024-03-31 22:08:04', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 86.00, NULL, 'paid', 'Velit cupiditate minima numquam ut error velit. Ut voluptatem quasi tenetur cupiditate.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000006', 0.00),
(14, '2024-01-18 22:06:31', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 98.00, NULL, 'paid', 'Expedita sunt aut modi et quia soluta. Numquam mollitia aut aut. Sint rerum non et fugit ut ut laborum. Consectetur quidem omnis non laborum voluptates eos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000006', 0.00),
(15, '2023-08-18 00:19:47', '2024-06-08 16:09:36', NULL, NULL, 3, NULL, 0.00, 52.00, NULL, 'paid', 'Dolorem ratione qui enim sunt doloremque. Qui deserunt dolores officia. Error voluptatem aut dolorem sunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000006', 0.00),
(16, '2023-06-10 21:46:19', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 46.00, NULL, 'paid', 'Veniam sed quia possimus quasi autem. Perspiciatis itaque doloribus nemo quia. Distinctio dignissimos quo maiores aut. Aliquid vel eaque facilis temporibus accusamus pariatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000007', 0.00),
(17, '2023-11-18 05:04:58', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 74.00, NULL, 'paid', 'Ut in ipsum temporibus voluptas doloribus eos. Explicabo commodi qui provident aut autem. Beatae aut voluptate sed iure.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000007', 0.00),
(18, '2024-05-15 05:52:59', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 55.00, NULL, 'paid', 'Tempora culpa dolorem voluptatem architecto autem dolores. Quis maiores ab expedita praesentium dolorem deserunt. Aut autem quis aut et. Aliquid dolore et autem deserunt vel minus error.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000008', 0.00),
(19, '2024-05-10 22:32:01', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 82.00, NULL, 'paid', 'Commodi accusantium esse corrupti et necessitatibus eos. Nulla sit occaecati natus id rem vitae. Et qui numquam excepturi minima consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000008', 0.00),
(20, '2023-06-29 19:30:16', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 90.00, NULL, 'paid', 'Aliquid maxime minus in necessitatibus. Cupiditate magni quaerat sed rem fuga perferendis. Corrupti dolorum a incidunt aut libero. Animi temporibus quo ipsam exercitationem quis delectus et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000009', 0.00),
(21, '2023-08-29 04:51:18', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 78.00, NULL, 'paid', 'A ea aperiam repellendus repellat ducimus. Ut praesentium hic sit quia deserunt rem. Dolores et laboriosam et aperiam expedita amet voluptatem qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000007', 0.00),
(22, '2024-03-22 17:54:57', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 62.00, NULL, 'paid', 'Nesciunt architecto minima et eum eum. Pariatur nisi dignissimos explicabo consequatur corrupti. Dolore voluptate modi aliquid sed vel non quo dicta.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000009', 0.00),
(23, '2024-01-09 10:16:21', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 46.00, NULL, 'paid', 'Ab et et est autem et qui. Eos dolor deserunt tenetur. Id blanditiis consequuntur eveniet beatae quae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000010', 0.00),
(24, '2024-04-28 05:10:09', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 97.00, NULL, 'paid', 'Qui nobis laborum velit. Voluptas necessitatibus blanditiis eligendi voluptas aut omnis. Sed recusandae recusandae at voluptatibus magnam velit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000008', 0.00),
(25, '2024-03-24 22:19:45', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 71.00, NULL, 'paid', 'Animi dicta perspiciatis deleniti nesciunt dolores voluptas quos. Culpa rem in porro aut doloribus non.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000011', 0.00),
(26, '2024-03-28 12:10:59', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 98.00, NULL, 'paid', 'Ipsam est consequatur quia optio distinctio. Et quo provident dolores labore. Vel ipsa et nostrum magnam amet. Blanditiis quis voluptatibus laborum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000009', 0.00),
(27, '2023-08-07 20:39:27', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 44.00, NULL, 'paid', 'Quis consequatur qui aut id adipisci cupiditate. Quibusdam nam id earum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000012', 0.00),
(28, '2024-02-28 04:22:27', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 58.00, NULL, 'paid', 'Quo ab tempora autem odio ea. Nam quas incidunt tempora. Omnis provident quisquam qui nesciunt nesciunt aperiam id. Et porro nihil quis numquam amet laborum est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000010', 0.00),
(29, '2023-08-10 08:42:00', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 72.00, NULL, 'paid', 'Nisi et illum illum porro alias sed culpa. Neque sint et modi dolor nihil quo. Voluptates suscipit nisi autem velit eligendi quae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000011', 0.00),
(30, '2023-09-28 11:54:55', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 42.00, NULL, 'paid', 'Non mollitia et ipsum corporis. Aut qui consequuntur adipisci quia. Veritatis explicabo iusto maxime sit sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000010', 0.00),
(31, '2024-02-13 04:52:08', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 84.00, NULL, 'paid', 'Dicta autem iste consequuntur praesentium occaecati quo. Sint pariatur voluptates cumque eum nulla maiores dolore iste.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000012', 0.00),
(32, '2024-01-13 00:14:03', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 43.00, NULL, 'paid', 'Est placeat veniam hic neque necessitatibus et. Quasi doloremque neque blanditiis sapiente nihil sint. Consequatur quam officiis est sit dolorem iusto nulla.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000013', 0.00),
(33, '2024-04-07 00:19:04', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 39.00, NULL, 'paid', 'Voluptates culpa occaecati officiis qui debitis et. Nobis dolores provident nulla eos voluptas ut. Maxime ut nobis porro similique vitae. Molestias sit accusantium itaque impedit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000011', 0.00),
(34, '2023-11-09 21:41:31', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 68.00, NULL, 'paid', 'Est ipsa id eos. Consectetur nobis magni rerum sapiente corrupti. Reiciendis sed nulla ipsum provident et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000013', 0.00),
(35, '2024-03-10 23:37:17', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 66.00, NULL, 'paid', 'Eius deleniti deleniti beatae natus voluptates cumque. Molestias repellendus beatae sapiente veniam. Voluptas voluptatem esse ut. Sint odit fugiat sed delectus culpa corrupti.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000014', 0.00),
(36, '2023-11-10 10:11:33', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 49.00, NULL, 'paid', 'Et molestiae quod non. Repellat voluptas dolorem esse est. Numquam sit eaque facilis consequatur beatae est laudantium debitis. Aperiam magni harum et optio et similique et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000015', 0.00),
(37, '2023-10-24 20:44:19', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 43.00, NULL, 'paid', 'Asperiores nulla et id. Iste harum nam et modi. Dolor ratione sint enim modi temporibus. Corrupti iste ut quasi beatae quo aliquid eligendi. Maiores adipisci totam quam commodi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000012', 0.00),
(38, '2024-05-23 08:07:08', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 92.00, NULL, 'paid', 'Dicta optio fugit ut sint numquam dignissimos quia error. Facere dolores ut minima non fuga beatae reprehenderit. Deserunt blanditiis nostrum in.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000014', 0.00),
(39, '2023-10-02 06:40:44', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 34.00, NULL, 'paid', 'Autem ab nisi mollitia qui laboriosam. Atque voluptatem vel est. Quia aut non sed nobis adipisci quo non vero. Incidunt labore quis corporis corrupti ut iste in error.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000013', 0.00),
(40, '2024-03-19 17:49:19', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 88.00, NULL, 'paid', 'Ut nostrum iste sapiente optio doloribus architecto. Perspiciatis temporibus nulla natus non culpa ratione. Facere iste corrupti maxime expedita cumque. Repellendus rerum sed laboriosam id.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000015', 0.00),
(41, '2023-10-15 02:30:51', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 79.00, NULL, 'paid', 'Odio optio adipisci similique quia totam animi dignissimos. Consequuntur fuga harum aliquid neque quis delectus repellendus velit. Nihil est corporis quam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000014', 0.00),
(42, '2024-05-26 02:22:53', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 98.00, NULL, 'paid', 'Illo officia exercitationem provident molestiae. Rerum eum dolorem omnis. Libero magni repellat dolorem aut perspiciatis ex. Ut sint ad quidem consectetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 32, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000015', 0.00),
(43, '2023-09-01 04:09:35', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 76.00, NULL, 'paid', 'Quia aspernatur et dolores in minus vero optio. Asperiores optio repellat molestiae et adipisci et. Rem non dolor a odio vel dolorem. Ea vero ut alias rerum architecto magni.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000016', 0.00),
(44, '2023-12-25 13:57:59', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 37.00, NULL, 'paid', 'Soluta aut quis aliquid sunt aspernatur ea dolor rerum. Tempora temporibus omnis voluptatem praesentium veniam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000017', 0.00),
(45, '2023-09-04 21:49:22', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 37.00, NULL, 'paid', 'Nobis perferendis consequuntur praesentium quis a. Incidunt doloribus esse est quis. Velit est est ipsum ad doloribus est facilis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000016', 0.00),
(46, '2023-09-15 14:11:46', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 58.00, NULL, 'paid', 'Quos eos qui cum et in. Hic consequatur numquam soluta numquam modi molestiae possimus et. Autem quia nam ut omnis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000018', 0.00),
(47, '2024-04-02 17:05:28', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 66.00, NULL, 'paid', 'Qui sed omnis fugiat enim ut dolores. Ut et exercitationem dolor tenetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000017', 0.00),
(48, '2024-01-19 20:09:53', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 63.00, NULL, 'paid', 'Ex expedita recusandae suscipit est tempora magnam. Quo est nesciunt explicabo animi velit sit. Unde eum tempore non pariatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000016', 0.00),
(49, '2024-02-11 15:10:10', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 100.00, NULL, 'paid', 'Quaerat enim assumenda quibusdam odit non. Quod autem rerum quia eius voluptas autem quaerat. Est laborum ducimus sit autem ullam nostrum. Et dolore similique sed.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000017', 0.00),
(50, '2023-06-16 04:03:07', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 43.00, NULL, 'paid', 'At molestiae odio voluptatem non et esse qui iure. Corporis impedit voluptates repellat. Amet quo mollitia libero non atque impedit beatae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000018', 0.00),
(51, '2023-07-25 17:10:19', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 79.00, NULL, 'paid', 'Pariatur natus quae est iure. Ex reprehenderit facere recusandae in est. Doloremque nesciunt voluptatibus iste reiciendis qui et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000018', 0.00),
(52, '2024-05-26 16:38:11', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 43.00, NULL, 'paid', 'Cum suscipit porro non similique enim. Totam in voluptatem quis quibusdam quis dolorem omnis. Occaecati dolorem sequi adipisci officia. Saepe aut quia repellat culpa nostrum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000019', 0.00),
(53, '2023-08-08 09:34:49', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 31.00, NULL, 'paid', 'Facere aut architecto saepe. Quis deserunt sit soluta sapiente.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000019', 0.00),
(54, '2023-07-26 03:05:07', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 86.00, NULL, 'paid', 'Itaque est vitae non necessitatibus quos distinctio. Quia aliquam officia adipisci quia laudantium veritatis. Qui illum aut illo at.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000019', 0.00),
(55, '2023-10-05 23:13:08', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 79.00, NULL, 'paid', 'Eum quam voluptatibus illum id nostrum. Occaecati qui libero a aperiam non quas. Necessitatibus at voluptas quisquam ea.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000020', 0.00),
(56, '2023-09-21 05:53:29', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 74.00, NULL, 'paid', 'Minima ratione quia quibusdam suscipit minima. Autem et omnis ut praesentium. Error aut et accusantium velit quia aut ab.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000020', 0.00),
(57, '2023-06-17 14:30:44', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 31.00, NULL, 'paid', 'Vero exercitationem dolor repudiandae. Voluptas minus sed occaecati ut rerum ipsa non provident. Voluptatem sed veritatis et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000021', 0.00),
(58, '2023-10-02 23:03:52', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 49.00, NULL, 'paid', 'At aut impedit laudantium est tempore quas. Excepturi pariatur dignissimos reprehenderit magni. Veritatis qui debitis sit et vero.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000021', 0.00),
(59, '2024-03-20 16:18:56', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 42.00, NULL, 'paid', 'Sunt doloribus non asperiores autem ullam voluptatem adipisci. Et earum et nobis quas eum neque et harum. Aut eaque officia et corrupti.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000022', 0.00),
(60, '2023-07-01 05:01:23', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 35.00, NULL, 'paid', 'Voluptate sed expedita veritatis harum. Quasi ipsa molestiae necessitatibus quam aperiam. Animi eligendi id nesciunt quis et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000020', 0.00),
(61, '2023-09-06 07:00:27', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 42.00, NULL, 'paid', 'Recusandae unde sint est cumque tempore. Quibusdam dolor nostrum facilis expedita aspernatur iure quibusdam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000023', 0.00),
(62, '2023-07-10 05:14:29', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 99.00, NULL, 'paid', 'Praesentium rerum voluptatum dolore culpa ut sit officia magnam. Molestiae non voluptatibus velit. Aperiam ut tempora doloribus fugit nihil odit porro. Quia ea fuga nihil non est vel error.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000021', 0.00),
(63, '2023-06-19 23:58:18', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 84.00, NULL, 'paid', 'Officia id et repudiandae ut dolores. Distinctio sed occaecati id tempora inventore labore id. Consequatur quia architecto aut perferendis quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000022', 0.00),
(64, '2023-11-21 03:29:04', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 71.00, NULL, 'paid', 'Quibusdam magnam sequi aliquid dolorum est. Optio est illo reiciendis est corporis. Earum sunt est ipsa ut quia nesciunt qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000024', 0.00),
(65, '2023-08-15 08:06:34', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 60.00, NULL, 'paid', 'Voluptatem animi itaque dolor. Delectus aliquid molestiae aspernatur velit nihil error laboriosam. Nihil molestiae dolore incidunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000022', 0.00),
(66, '2024-03-09 04:54:01', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 83.00, NULL, 'paid', 'Facilis ad eveniet quis vitae. Explicabo fugiat aut sint quis hic aperiam. Ratione consequuntur delectus qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000023', 0.00),
(67, '2023-07-16 03:52:43', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 59.00, NULL, 'paid', 'Qui eius delectus nihil. Optio numquam quasi omnis qui et distinctio architecto dolor. Sit cumque facere maiores ea. Sed doloribus quo nostrum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000024', 0.00),
(68, '2023-10-02 21:23:23', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 47.00, NULL, 'paid', 'Doloribus et vel maiores. Deserunt libero cumque optio omnis voluptatum. Labore quo dolorem dicta qui labore iusto possimus et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 42, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000025', 0.00),
(69, '2023-06-29 03:53:38', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 87.00, NULL, 'paid', 'Rem architecto consequatur qui rerum qui magnam ut consequuntur. Dolor rem omnis voluptatem fugiat. Aut omnis necessitatibus rerum molestiae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000026', 0.00),
(70, '2023-06-13 05:49:32', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 33.00, NULL, 'paid', 'At ut cumque dolores error dolorum minus dignissimos aut. Nulla ipsum totam dolorem dolores. Similique itaque omnis expedita qui quia. Sit ut nemo nostrum qui accusamus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000023', 0.00),
(71, '2023-06-19 17:47:19', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 74.00, NULL, 'paid', 'Porro ut cum quia rerum unde architecto temporibus. Hic aut rerum laborum consequuntur nemo aut vel. Non illo commodi et labore consequatur voluptatem minima. Facere et quia perferendis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000025', 0.00),
(72, '2024-03-06 14:07:41', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 92.00, NULL, 'paid', 'Magnam eaque sit velit in accusamus quam autem. Aut perferendis expedita similique qui laboriosam exercitationem ut. Aut explicabo iste assumenda aperiam optio et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000026', 0.00),
(73, '2023-09-02 03:45:50', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 66.00, NULL, 'paid', 'Deserunt molestias et esse. Temporibus quod minima minima dolores a cumque animi. Qui amet voluptas repellat iure. Sed eveniet ut ducimus voluptates.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000027', 0.00),
(74, '2024-01-28 16:20:42', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 33.00, NULL, 'paid', 'Perspiciatis dolores natus tempora quia id. Quia rerum deserunt sit ut laboriosam incidunt qui fugiat.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000028', 0.00),
(75, '2024-02-03 00:23:14', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 92.00, NULL, 'paid', 'Voluptates iusto excepturi maiores ea reprehenderit. Unde quam nostrum voluptatem officia eos nihil. Deserunt voluptate excepturi placeat mollitia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000029', 0.00),
(76, '2024-03-22 10:32:14', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 58.00, NULL, 'paid', 'Repellat sit tempore similique voluptas repudiandae. Quia possimus distinctio hic corrupti et dignissimos. Necessitatibus atque modi et harum quia sunt sit pariatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000024', 0.00),
(77, '2024-04-27 17:19:33', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 72.00, NULL, 'paid', 'Laborum praesentium aut incidunt. Magni id suscipit quia modi hic sed molestias. Provident quia velit aliquid.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000027', 0.00),
(78, '2023-10-12 06:36:06', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 81.00, NULL, 'paid', 'Cumque repudiandae eligendi et eos. Aliquid quaerat quam itaque iste quas cupiditate et. Error ut ut impedit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000025', 0.00),
(79, '2023-12-26 19:16:39', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 76.00, NULL, 'paid', 'Similique doloremque sit officiis est soluta soluta eum. Nemo hic quae modi et doloribus sed. Qui eveniet illum ab voluptatem. Fugiat debitis cum eum eos sequi fuga.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000026', 0.00),
(80, '2023-08-28 09:29:31', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 73.00, NULL, 'paid', 'Magnam veniam ad est modi velit hic. Amet nihil dolores asperiores molestiae facilis. Maxime et sequi quisquam. Nulla cumque qui qui cupiditate omnis consequatur minima eius.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000030', 0.00),
(81, '2023-08-23 16:10:23', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 83.00, NULL, 'paid', 'Alias et enim nihil voluptatem voluptas dolores. Ex et sit cupiditate nihil exercitationem. Rem vel dolores rerum eos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000028', 0.00),
(82, '2023-09-19 14:37:10', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 37.00, NULL, 'paid', 'Ducimus qui dolore vero qui impedit ratione. Adipisci atque deserunt possimus illo molestiae laudantium quisquam. Sit saepe laboriosam molestiae est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000027', 0.00),
(83, '2023-08-11 05:47:55', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 69.00, NULL, 'paid', 'Maiores nisi accusantium aut dolores. Est fugit distinctio est perspiciatis ipsum laboriosam. Ut laudantium sit sunt maxime. Soluta voluptatum delectus non officiis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000031', 0.00),
(84, '2023-10-25 06:40:16', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 90.00, NULL, 'paid', 'Voluptatem recusandae quia accusamus iste ipsum sit odio minima. Perspiciatis mollitia qui dicta accusantium facere et deserunt. Aliquid distinctio alias facere qui at blanditiis non ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000028', 0.00),
(85, '2024-02-01 04:46:51', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 65.00, NULL, 'paid', 'Natus ullam amet fugit velit. Reiciendis molestias eos exercitationem nemo laudantium quia. Nesciunt molestias culpa incidunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000032', 0.00),
(86, '2024-01-02 20:25:52', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 89.00, NULL, 'paid', 'Est error accusantium maiores eum quasi perferendis libero corrupti. Possimus eveniet eum quia voluptatem maiores. Assumenda saepe facere quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000033', 0.00),
(87, '2024-01-31 07:35:28', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 100.00, NULL, 'paid', 'Ea maiores commodi fugiat repudiandae. Nobis sunt doloribus ipsum. Quia autem exercitationem iste eos. Nostrum at provident ullam ut cum tenetur quasi officiis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000029', 0.00),
(88, '2023-09-03 19:50:37', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 75.00, NULL, 'paid', 'Eveniet quae suscipit perferendis dicta enim asperiores repudiandae. Quisquam et vero qui. Qui velit dolorem quia modi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000030', 0.00),
(89, '2024-03-04 16:41:08', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 91.00, NULL, 'paid', 'Debitis quia consequuntur dolores architecto enim hic vero delectus. Sapiente et eum quasi harum quibusdam et qui. Consequatur dolores aliquid et dolor. Cum at est nostrum in nam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000034', 0.00),
(90, '2024-05-15 13:37:17', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 64.00, NULL, 'paid', 'Qui dolor voluptas eos dolores quae. Rerum earum ea minima iste. Placeat soluta accusamus debitis voluptas. Cumque qui animi quis consectetur a eaque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000031', 0.00),
(91, '2023-11-14 14:49:17', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 77.00, NULL, 'paid', 'Laboriosam quis dolores adipisci consequuntur. Molestias eligendi occaecati minus dignissimos. Veritatis velit necessitatibus non et voluptatibus. Id dolor qui qui qui nihil.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000035', 0.00),
(92, '2023-10-26 13:12:46', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 71.00, NULL, 'paid', 'Eum iste dolores sunt recusandae quo eos. Facilis consequatur quaerat quas ut ut ad. Nobis quia dolores ipsa.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000029', 0.00),
(93, '2024-02-13 21:45:41', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 75.00, NULL, 'paid', 'Suscipit quia sit optio exercitationem eum qui voluptas quas. Fugiat libero et quis quia quis. Tenetur eveniet aut sint nostrum provident aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000032', 0.00),
(94, '2024-05-30 19:57:50', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 58.00, NULL, 'paid', 'At quasi eum provident tenetur beatae. Voluptatem excepturi illum et omnis. A accusantium ut sit rerum quod. Dolorem dignissimos vel officia voluptatem fuga tempora ea.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000036', 0.00),
(95, '2023-06-24 21:15:24', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 52.00, NULL, 'paid', 'Ipsam inventore perferendis voluptas ad ut consequuntur velit. Numquam culpa iste qui est beatae aut laborum. Quisquam quia aut placeat quia ad nesciunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000037', 0.00),
(96, '2023-11-15 13:48:23', '2024-06-08 16:09:37', NULL, NULL, 3, NULL, 0.00, 97.00, NULL, 'paid', 'Eius quia et minus dolorem ea. Autem culpa sit ratione expedita provident. Mollitia sit iste deleniti eaque consectetur quisquam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:37', '', NULL, 0.00, 0, '000038', 0.00),
(97, '2023-11-01 08:05:38', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 53.00, NULL, 'paid', 'Nisi dolores ut aperiam qui sint eaque. Iste odio nostrum dignissimos sunt doloribus. Assumenda repellendus voluptatum rem et officiis. Et soluta sint hic libero cumque voluptatem blanditiis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000033', 0.00),
(98, '2023-07-13 00:47:08', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Ut dolores eum architecto expedita. Dolorum ipsam voluptates qui doloremque dignissimos distinctio qui. Reiciendis aut sed dolorum adipisci id quos sapiente. Quam at aut quaerat.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000030', 0.00),
(99, '2024-01-06 13:41:06', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 64.00, NULL, 'paid', 'Minima eos ab et eum vitae qui temporibus. Incidunt voluptate laborum occaecati iure.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000031', 0.00),
(100, '2024-04-19 04:09:04', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 89.00, NULL, 'paid', 'Qui eveniet eos sit ullam eos aut optio. Vel suscipit quam at quaerat fuga perferendis quo unde. Eos eum sed eum et ullam in. Esse omnis explicabo numquam voluptatum veniam fuga atque iusto.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000032', 0.00),
(101, '2023-11-24 01:04:50', '2024-06-08 16:09:28', NULL, NULL, 1, NULL, 0.00, 42.00, NULL, 'paid', 'Ut ad temporibus ut sit est est dignissimos. Commodi sit facilis ut est culpa dolorem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:28', '', NULL, 0.00, 0, '000034', 0.00),
(102, '2023-06-27 05:07:47', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 74.00, NULL, 'paid', 'Neque cumque earum error illo repellendus. Mollitia laborum magni minima eos voluptatem. Aut corrupti provident porro aut. Repellat omnis laudantium ab omnis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000035', 0.00),
(103, '2023-08-21 01:38:31', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 73.00, NULL, 'paid', 'Sint dolores possimus dolorem consequuntur deserunt non corporis. Dignissimos consequatur adipisci aut voluptatem non aut esse. Qui illum itaque perferendis maiores omnis temporibus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000039', 0.00),
(104, '2024-03-05 10:36:46', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 88.00, NULL, 'paid', 'Est maxime labore at eligendi est. Eum exercitationem dolores et qui est vel. Officia odit eaque amet officiis minima illum hic. Aut veniam quam amet facere perspiciatis voluptatem ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000033', 0.00),
(105, '2023-11-08 15:16:18', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 37.00, NULL, 'paid', 'Est doloribus quia saepe exercitationem. Corrupti vel id sed voluptatem in et libero. Consequatur corrupti laborum qui enim.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000036', 0.00),
(106, '2023-10-02 17:53:13', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 52.00, NULL, 'paid', 'Sint et dicta molestiae quis itaque quidem quam. Molestiae exercitationem quasi quam. Pariatur dolorem consequatur doloribus a hic vitae. Est ut animi quae officia voluptatem et facilis nam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000040', 0.00),
(107, '2023-10-14 18:57:33', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 39.00, NULL, 'paid', 'Vel id ut sunt itaque nisi voluptas. Voluptatem reprehenderit ad at placeat aut nam quis. Sint excepturi minima perferendis. Veniam ad animi et. Amet eveniet modi vel eligendi saepe illum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000041', 0.00),
(108, '2023-06-24 01:43:48', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 48.00, NULL, 'paid', 'Mollitia et magnam nesciunt eum voluptatem vel quidem. Qui alias soluta perspiciatis delectus alias est dolore. Quo accusantium qui eos. Eligendi consequatur quasi rerum consectetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000037', 0.00),
(109, '2023-11-21 04:29:17', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 86.00, NULL, 'paid', 'Rerum labore sit omnis ea laborum veritatis et. Nesciunt similique voluptates itaque fugiat omnis sed est. Et placeat non dolores. Ipsum sequi maxime asperiores aliquam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000038', 0.00),
(110, '2023-09-01 16:58:08', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 75.00, NULL, 'paid', 'Repellat non necessitatibus facere quis nihil fuga et. Provident ratione reiciendis doloribus vel necessitatibus. Eaque illo perspiciatis a velit et ut deserunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000034', 0.00),
(111, '2023-10-29 17:09:26', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 34.00, NULL, 'paid', 'Placeat rerum modi aut quibusdam. Ipsa quisquam earum est molestias.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000042', 0.00),
(112, '2024-02-28 02:58:00', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 87.00, NULL, 'paid', 'Necessitatibus temporibus corporis odio sint in ex rerum. Aut quo ducimus iste placeat et aut. Laudantium in soluta eius tempora veniam soluta. Earum dolores libero et delectus expedita corrupti.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000039', 0.00),
(113, '2023-09-24 06:55:49', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 41.00, NULL, 'paid', 'Et necessitatibus ea ex id. Nostrum eius dolores aut aspernatur qui. Et nobis quia enim accusamus fugiat.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000040', 0.00),
(114, '2024-02-17 03:43:18', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 62.00, NULL, 'paid', 'Quia sit quam ut est qui. Et odit deleniti illo enim cupiditate. Laborum aut quisquam ex nisi nisi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000041', 0.00),
(115, '2024-03-19 16:48:47', '2024-06-08 16:09:32', NULL, NULL, 2, NULL, 0.00, 84.00, NULL, 'paid', 'Enim voluptatum amet ab id et et qui necessitatibus. Nam voluptatem totam et sed. Tenetur quibusdam eveniet quibusdam ipsam accusantium vel.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000035', 0.00),
(116, '2023-07-21 18:58:33', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 43.00, NULL, 'paid', 'Quia earum recusandae vel ad sapiente officiis voluptatem. Velit nulla voluptatum et et autem voluptatem placeat sed. Eveniet vero repellat voluptas error sint. Ut dolorum molestiae sint quo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000042', 0.00),
(117, '2023-10-13 09:16:34', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 100.00, NULL, 'paid', 'Eos ipsam laborum et. Qui corrupti tempore aperiam eius. Quo architecto dolorem eius quia aspernatur fuga optio.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000043', 0.00),
(118, '2023-09-17 14:29:05', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 46.00, NULL, 'paid', 'Ut laborum suscipit officia ut. Placeat et distinctio sunt. Iure rerum explicabo et fuga iusto voluptatem ex.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000043', 0.00),
(119, '2024-01-27 22:38:46', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 91.00, NULL, 'paid', 'Aut ea ut voluptatem animi aut dolorum. Aut quia esse autem a. Non sequi a ut sint. Nesciunt et consequatur quidem eaque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000044', 0.00),
(120, '2023-12-15 14:40:55', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 49.00, NULL, 'paid', 'Vero aut laudantium voluptatem at aut omnis esse rerum. Eos aut quia sed rerum suscipit. Cupiditate magni ullam molestiae quia et. A qui sint voluptate excepturi doloremque facilis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000036', 0.00),
(121, '2024-02-17 05:55:36', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 38.00, NULL, 'paid', 'Sit dignissimos omnis dolor laudantium voluptatem. Consequatur nemo magnam voluptatum eius. Voluptatem eveniet neque in delectus ut aut pariatur iure. Voluptas et atque eum fugiat.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000045', 0.00),
(122, '2024-05-16 14:09:35', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 30.00, NULL, 'paid', 'Eos rem sit architecto et. Unde ratione doloribus voluptatem quae. Rerum in est praesentium rem et quia. Nesciunt vero quis cum facilis eos accusantium eligendi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000044', 0.00),
(123, '2023-12-28 02:47:44', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 67.00, NULL, 'paid', 'Vitae quia ut nesciunt molestiae enim architecto enim. Sit quis ullam dolores eos distinctio nihil blanditiis. Ipsum non voluptatem voluptatem voluptatem. Rerum fuga ipsa amet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000045', 0.00),
(124, '2024-04-10 07:55:18', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 49.00, NULL, 'paid', 'At non ipsa tenetur eveniet id quo. Rerum ut odio maxime expedita. Aperiam blanditiis est quas dolorem aperiam delectus. Quis quia molestias quam sequi ipsam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000037', 0.00),
(125, '2024-02-06 13:03:36', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 42.00, NULL, 'paid', 'Qui cumque quia dolorem nihil mollitia dolorem quis quod. Recusandae nulla doloribus sequi minus. Vel sint ut deserunt aspernatur. Asperiores exercitationem molestiae impedit dicta voluptatem rerum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000046', 0.00),
(126, '2023-09-01 13:28:53', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 88.00, NULL, 'paid', 'Veritatis quis quia aut ratione vel autem nesciunt. Corrupti sint dolorem harum illum facilis voluptatibus exercitationem. Quia omnis voluptas tenetur nemo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000046', 0.00),
(127, '2023-10-08 07:05:00', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 48.00, NULL, 'paid', 'Voluptatem aut quis magnam mollitia ullam voluptas. Sint minima architecto adipisci reprehenderit minima et et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000047', 0.00);
INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`, `payment_link`, `employee_id`, `deleted_at`, `md`, `coupon`, `discount`, `kds_finished`, `id_per_vendor`, `tip`) VALUES
(128, '2023-09-16 20:58:56', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 62.00, NULL, 'paid', 'Nisi quia aspernatur velit. Eius facilis inventore dolorem laborum earum suscipit neque eius. Nulla quae doloremque dolor aperiam laboriosam et voluptatem vero.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000047', 0.00),
(129, '2023-07-02 08:26:47', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 47.00, NULL, 'paid', 'Officia nulla velit pariatur sunt sed. Nam officia sit at possimus dolore modi quia. Illo rerum minima porro sint dignissimos molestiae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000048', 0.00),
(130, '2024-05-06 14:39:57', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 36.00, NULL, 'paid', 'Eaque eum veritatis culpa. Iusto qui molestiae quo a. Numquam unde ut rem dolores quasi sit. Sed voluptas quo accusamus ducimus iusto quas quos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000049', 0.00),
(131, '2023-09-21 09:04:57', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 48.00, NULL, 'paid', 'Maxime quibusdam enim quis architecto dolores. Velit occaecati doloribus a quia quia vel corporis labore. Et aspernatur ratione est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000038', 0.00),
(132, '2024-05-19 05:26:25', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 65.00, NULL, 'paid', 'Nihil voluptas qui dolorem et ipsam. Sed ea veritatis excepturi aliquam unde. Sint eveniet accusantium sint aut et qui. Esse qui aliquam officiis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000039', 0.00),
(133, '2024-05-16 17:57:57', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 47.00, NULL, 'paid', 'Minus expedita aliquid aut in. Quae architecto rerum ipsum earum. Explicabo et aperiam odit quia asperiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000050', 0.00),
(134, '2023-10-18 03:00:31', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 38.00, NULL, 'paid', 'Doloremque vitae ut maxime et quasi fugiat provident eaque. Sed iure voluptas asperiores qui et error quia. Explicabo consequatur enim id sunt. Quos et modi voluptatem cumque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000048', 0.00),
(135, '2023-12-14 03:48:04', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 48.00, NULL, 'paid', 'Nostrum deleniti expedita illum sit. Sunt deleniti est debitis totam. Voluptatem iste placeat odio est et. Quo nihil et dolore quae repellendus. Sint qui accusantium dignissimos ut quo velit officia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000049', 0.00),
(136, '2023-12-26 21:16:16', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 47.00, NULL, 'paid', 'Cupiditate occaecati assumenda quisquam praesentium. Nihil vero placeat nesciunt doloremque voluptatem sunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000050', 0.00),
(137, '2023-09-09 07:04:04', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 61.00, NULL, 'paid', 'Harum fugit sunt et sapiente. Quam eos autem consequuntur porro eos. Sed sed modi voluptate sunt fugiat et velit. Dolor soluta hic commodi debitis beatae perspiciatis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000040', 0.00),
(138, '2023-09-03 00:25:14', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 83.00, NULL, 'paid', 'Voluptate incidunt asperiores eum sapiente. Sed nesciunt aut perferendis ab aut officia. Odio nam dolore voluptatem atque id. Non eveniet perspiciatis repellendus quidem mollitia a aspernatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000041', 0.00),
(139, '2023-12-09 20:16:08', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 31.00, NULL, 'paid', 'Distinctio et et unde id magnam. Repellat accusantium aspernatur beatae. Dolores maxime optio eum rerum et sed. Et aperiam rem sapiente est. Et incidunt qui repellat sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000051', 0.00),
(140, '2024-03-02 23:09:57', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 41.00, NULL, 'paid', 'A ipsa doloribus quisquam voluptates optio nam. Provident possimus quae quia. Temporibus est dolorem quae commodi quia in qui. Tempora dolorem ab tenetur dolores harum in ut. Dolor nihil qui aut sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000051', 0.00),
(141, '2023-06-18 19:43:15', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 60.00, NULL, 'paid', 'Sunt suscipit fuga atque cumque. Explicabo sint voluptatem nihil repudiandae est. Aperiam doloribus et quis vel voluptatem iure.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000052', 0.00),
(142, '2024-01-18 12:18:00', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 80.00, NULL, 'paid', 'Reiciendis enim eos voluptatum mollitia a quos. Molestias eos nam aut porro ipsam. Sed voluptatem doloribus iusto molestias ab et maxime.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000053', 0.00),
(143, '2024-02-22 07:18:22', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 47.00, NULL, 'paid', 'Perferendis corrupti consequatur vel eum. Necessitatibus laudantium non iste beatae porro possimus. Necessitatibus occaecati nisi adipisci sunt officia non veritatis recusandae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000042', 0.00),
(144, '2023-12-07 17:54:21', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 68.00, NULL, 'paid', 'Repellendus neque ullam iste. Non et aliquid quia praesentium qui fuga consectetur consequatur. Quod animi quos numquam repellendus. Laboriosam consequuntur molestiae maiores consequatur neque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000054', 0.00),
(145, '2023-08-11 09:18:18', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 90.00, NULL, 'paid', 'Molestiae provident consequatur sapiente placeat perferendis voluptatem. Repudiandae voluptas debitis quis ut laboriosam non. Doloribus nihil accusantium qui quibusdam reprehenderit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000055', 0.00),
(146, '2024-05-24 23:24:50', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 51.00, NULL, 'paid', 'Et beatae unde eum ad corporis saepe. Aut nesciunt at quod asperiores veniam similique qui autem. Nam architecto sit ut unde velit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000043', 0.00),
(147, '2024-05-08 12:13:03', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 41.00, NULL, 'paid', 'Et totam maiores consectetur nemo sunt ut ea aspernatur. Quia odit et possimus quidem sapiente. Velit hic cumque aut deleniti. Temporibus sapiente est veritatis id beatae provident porro vel.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000044', 0.00),
(148, '2024-01-14 04:05:30', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 87.00, NULL, 'paid', 'Accusantium quo saepe et ut. Adipisci id laboriosam ullam non ea. Saepe eligendi reprehenderit blanditiis deleniti. Sint repudiandae quis qui quas aliquam fugit rerum sed.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000052', 0.00),
(149, '2024-03-24 13:57:14', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 80.00, NULL, 'paid', 'Totam aut itaque non. Voluptates pariatur sunt aut eum dolores molestiae voluptas. Nihil accusamus in doloribus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000053', 0.00),
(150, '2023-09-23 05:04:01', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 75.00, NULL, 'paid', 'Perferendis et odit id voluptas impedit ut excepturi asperiores. Enim doloremque harum quis aut quo. Distinctio exercitationem commodi totam nobis ut saepe et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000056', 0.00),
(151, '2024-04-17 21:44:50', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 87.00, NULL, 'paid', 'Aspernatur sunt nemo et quisquam occaecati. Qui nulla est consequatur voluptatem non. Ratione quia enim et fugiat aut ut. Aliquid pariatur suscipit perferendis repellat doloribus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000054', 0.00),
(152, '2024-02-21 13:19:59', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 49.00, NULL, 'paid', 'Voluptas tenetur modi mollitia praesentium nihil. Nulla ad officia sapiente aut sunt ex. Fuga sequi et pariatur impedit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000057', 0.00),
(153, '2024-03-13 22:31:42', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 94.00, NULL, 'paid', 'Recusandae explicabo et odit deserunt fugit quo. Ad iusto quod odit sed quae aut. Omnis deleniti at et nisi eaque in dolorem. Recusandae qui odit est laborum porro.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000045', 0.00),
(154, '2024-05-08 09:37:10', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 76.00, NULL, 'paid', 'Dolores sed ut maxime voluptas dolores doloremque vel voluptatem. Ipsa dolorum tenetur cupiditate laboriosam voluptatem vitae veniam temporibus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000058', 0.00),
(155, '2023-07-15 22:59:53', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 93.00, NULL, 'paid', 'Accusantium corrupti vel veniam. Aut sed ratione magni perferendis. Id aut labore ullam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 34, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000055', 0.00),
(156, '2024-01-22 17:20:54', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 31.00, NULL, 'paid', 'Quis animi sed natus officia. Doloribus nesciunt ea aspernatur voluptas qui. Aut officiis assumenda fuga minima veritatis quia aut. Ea quia non commodi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000046', 0.00),
(157, '2023-11-21 10:55:43', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 99.00, NULL, 'paid', 'Non totam odio fugiat. Adipisci suscipit maxime vitae exercitationem neque nulla itaque sequi. Laboriosam dolorum dolorem maiores vel. Quas eveniet laboriosam iste aut odio voluptatibus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000059', 0.00),
(158, '2023-09-10 14:17:14', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 36.00, NULL, 'paid', 'Vel quia repellendus eos. Consequatur molestiae ut repellendus similique sunt harum. Accusantium sed dolores nesciunt est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000060', 0.00),
(159, '2024-03-24 09:51:09', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 93.00, NULL, 'paid', 'Quia ut sunt odio. Sint cupiditate nihil velit maiores nihil inventore harum. Quo est dolore ut quo nisi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000056', 0.00),
(160, '2023-08-25 02:30:03', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 58.00, NULL, 'paid', 'Voluptas voluptas quis numquam sunt veritatis laborum. Dolor laboriosam dolor ipsam quam labore molestiae nemo. Eos cumque eveniet nesciunt deleniti laudantium sint doloremque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000047', 0.00),
(161, '2023-11-26 13:41:36', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 64.00, NULL, 'paid', 'Maxime eaque ipsa quod. Aut nihil architecto odit rerum animi nihil. Quis repellat vitae quasi odio.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000048', 0.00),
(162, '2024-04-11 09:02:54', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 84.00, NULL, 'paid', 'Esse non corrupti rerum dolorem ex. Praesentium eos eligendi mollitia dolorem illum nesciunt molestias.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000057', 0.00),
(163, '2023-12-27 08:17:59', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 99.00, NULL, 'paid', 'Doloribus accusantium sit quia recusandae aperiam rerum corporis. Reiciendis velit velit labore enim. Esse et quos minima saepe cumque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000061', 0.00),
(164, '2024-02-16 11:25:52', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 92.00, NULL, 'paid', 'Natus incidunt aperiam incidunt quod consequatur. Assumenda provident et non voluptates labore earum assumenda. Laudantium pariatur possimus eligendi eaque voluptatem soluta.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000062', 0.00),
(165, '2024-03-03 15:59:32', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 82.00, NULL, 'paid', 'Et dolor qui perferendis. Optio aut modi voluptates possimus. Eum qui fuga laborum quis amet quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000063', 0.00),
(166, '2024-04-14 15:06:08', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 42.00, NULL, 'paid', 'Et quisquam laudantium et at. Est voluptas eos eum voluptatibus officia tempora sunt. Eum inventore est facilis nemo corrupti. Iste dolore doloribus et expedita minus maiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000058', 0.00),
(167, '2023-11-29 04:08:07', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 79.00, NULL, 'paid', 'Optio non ipsa omnis nam beatae ex. Ut possimus quos aut sapiente ad repellendus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000064', 0.00),
(168, '2023-07-18 13:58:26', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 59.00, NULL, 'paid', 'Velit in fugit ipsum architecto blanditiis numquam non. Id accusantium voluptate distinctio. Explicabo aut quia voluptatem. Sunt qui eaque rerum praesentium magnam sunt dolore ea.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000059', 0.00),
(169, '2023-09-02 17:44:14', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 54.00, NULL, 'paid', 'Repellat ratione nisi consequatur delectus voluptas ut necessitatibus. Iure dolores eum est aut similique iusto deleniti. Sunt et nihil nihil odit ex culpa ex.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000060', 0.00),
(170, '2023-07-26 13:44:34', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 73.00, NULL, 'paid', 'Voluptatem explicabo est porro fugit. Consequuntur voluptatibus facere dolores. Quod numquam sed est ut libero molestias.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 32, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000061', 0.00),
(171, '2023-10-20 04:37:17', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 66.00, NULL, 'paid', 'Tempora quo distinctio reiciendis molestias et. Autem modi omnis vel et. Et sed alias aperiam et omnis totam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000065', 0.00),
(172, '2024-04-14 02:18:43', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 69.00, NULL, 'paid', 'Corrupti molestias et labore harum voluptatem illo in itaque. Repellat nihil assumenda voluptas. Animi omnis et ut molestias necessitatibus velit quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000066', 0.00),
(173, '2023-09-30 15:56:09', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 34.00, NULL, 'paid', 'Et voluptatibus mollitia rem quasi quas molestiae. Delectus molestias laudantium enim qui repellat deserunt error. Quo quas sed quae necessitatibus sapiente.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000067', 0.00),
(174, '2024-06-07 22:18:15', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 80.00, NULL, 'paid', 'Repellendus quos corporis rerum numquam commodi. Perspiciatis eligendi est est. Sapiente sequi culpa eos et. In omnis reprehenderit voluptatem deserunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000049', 0.00),
(175, '2023-06-19 00:16:11', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 58.00, NULL, 'paid', 'Aut perferendis aut nemo. Molestias eum quia et dolores repellendus. Velit porro aut rem voluptatibus ea culpa architecto.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000068', 0.00),
(176, '2024-05-05 17:40:17', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 53.00, NULL, 'paid', 'Nostrum hic consequatur doloribus voluptatem aliquam consequatur. Minus ut occaecati sequi laudantium cum quis. Cupiditate tempore quidem quia voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000062', 0.00),
(177, '2024-05-14 11:31:07', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 40.00, NULL, 'paid', 'Tempore rerum quis dolorem unde odit deleniti. Qui nobis atque perspiciatis eos sunt dicta. Sunt officiis quo unde consequuntur. Fugit vero aliquam nulla officiis quas molestias.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000050', 0.00),
(178, '2024-05-02 08:33:53', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 37.00, NULL, 'paid', 'Consequatur doloribus explicabo accusamus voluptatem pariatur. Velit explicabo aut nam eaque quasi distinctio. Iusto qui saepe pariatur eaque necessitatibus vel et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000063', 0.00),
(179, '2023-10-04 16:05:17', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 31.00, NULL, 'paid', 'Sapiente mollitia maxime asperiores ut. Nulla animi voluptatibus aspernatur harum. Aut eligendi amet enim reiciendis officia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000064', 0.00),
(180, '2023-06-19 03:25:21', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 81.00, NULL, 'paid', 'Excepturi praesentium tenetur quis architecto. Nemo magnam ipsum omnis voluptatem quia dignissimos. Laboriosam voluptas ut tempora quia culpa.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000051', 0.00),
(181, '2024-04-17 03:40:20', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Libero illo hic quo voluptas pariatur dolorem qui. Dicta et quaerat aut. Nemo officiis nulla reprehenderit qui quasi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000052', 0.00),
(182, '2023-06-13 03:38:34', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 74.00, NULL, 'paid', 'Qui deleniti in ex quasi corrupti. Et aut recusandae est eius blanditiis. Occaecati quod impedit laborum. Est optio laborum sit veniam magni aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000069', 0.00),
(183, '2024-01-27 10:05:04', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 90.00, NULL, 'paid', 'Corrupti tempore est non ut voluptates qui enim. Ipsum est beatae perferendis aliquam amet. Voluptas dolore quibusdam commodi. Et sed a et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000053', 0.00),
(184, '2024-05-14 18:47:20', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 64.00, NULL, 'paid', 'Odio ex sint aut recusandae ut sunt iure. Qui quia illo modi possimus nulla quod ipsam. Repellat tempore optio sed minima.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000065', 0.00),
(185, '2023-10-30 22:45:44', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 88.00, NULL, 'paid', 'Mollitia corporis qui sit amet illo ut. Adipisci dolores nobis animi ea quia. Recusandae excepturi dolorum et. Aliquam alias aliquam perspiciatis eveniet quia quasi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000054', 0.00),
(186, '2024-01-01 05:32:45', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 59.00, NULL, 'paid', 'Temporibus repellat sed aut omnis. Aut libero temporibus incidunt debitis rerum. Omnis et illum nihil eligendi iste aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000066', 0.00),
(187, '2024-04-16 16:03:35', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 74.00, NULL, 'paid', 'Voluptatem rem illo ut aut nulla iure et. Velit atque amet dolores laudantium voluptas quam aut illum. Aut et quia odio eos nihil. Enim sint ex hic quod et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000055', 0.00),
(188, '2024-01-16 16:45:59', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 69.00, NULL, 'paid', 'Voluptas nemo impedit dolorem tempore est rerum. Id numquam pariatur non. Molestias enim mollitia beatae et similique repudiandae qui quia. Doloribus ad corporis enim aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000056', 0.00),
(189, '2023-12-15 01:09:39', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 98.00, NULL, 'paid', 'Voluptas distinctio nulla saepe praesentium sed debitis. Nobis eos in tempora aut. Et corrupti ea ad. Facilis eos rerum officia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000070', 0.00),
(190, '2024-05-15 20:58:44', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 40.00, NULL, 'paid', 'Quo repellendus dolore sequi molestias reprehenderit enim qui. Eligendi nam et dolore necessitatibus saepe eum. Ut repudiandae ratione cum et est totam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000067', 0.00),
(191, '2024-03-11 08:37:58', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 67.00, NULL, 'paid', 'Libero qui qui quo veniam. Iusto quos alias corporis ut facilis dignissimos tempora voluptatem. Quidem sint aut omnis dolores fuga distinctio. Harum eaque eos expedita in at.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000071', 0.00),
(192, '2023-12-23 06:20:19', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 33.00, NULL, 'paid', 'Quaerat eum quaerat odio labore. Error eos quam iste illo. Architecto repellendus omnis officia vitae. Et asperiores ex nemo aut aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000072', 0.00),
(193, '2024-01-13 04:33:57', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 43.00, NULL, 'paid', 'Autem fugit aut quo dolorum est occaecati accusantium iure. Doloribus qui provident dolorum itaque. Officiis neque reiciendis vel porro.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000068', 0.00),
(194, '2023-11-14 07:44:26', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 71.00, NULL, 'paid', 'Sapiente temporibus est eum quod optio. Voluptate ducimus doloribus perferendis vitae amet aliquid debitis voluptas. Suscipit inventore eum pariatur eaque dolores harum. Saepe ut ipsa et voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000057', 0.00),
(195, '2023-09-27 04:22:42', '2024-06-08 16:09:38', NULL, NULL, 3, NULL, 0.00, 88.00, NULL, 'paid', 'A ut voluptates sapiente necessitatibus sed perferendis quam. Consequatur corporis sint hic omnis. Praesentium dignissimos inventore consequuntur ea ratione aspernatur dolorem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:38', '', NULL, 0.00, 0, '000069', 0.00),
(196, '2023-08-07 21:18:06', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 49.00, NULL, 'paid', 'Atque reiciendis ea illum autem consequuntur velit. Adipisci necessitatibus aliquam velit. Voluptatem inventore in voluptas autem. Similique sed odio et accusantium dolorem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 20, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000058', 0.00),
(197, '2024-01-28 10:17:03', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 52.00, NULL, 'paid', 'Earum impedit sit sed facere. Expedita aspernatur rem impedit praesentium sit. Consequuntur voluptatem rerum recusandae non.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000070', 0.00),
(198, '2023-10-21 01:13:09', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 39.00, NULL, 'paid', 'Beatae architecto tenetur aliquid aspernatur iusto. Saepe dolorem laborum libero quo hic eligendi. Nulla quis rerum qui. Soluta debitis excepturi voluptas quidem consectetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000073', 0.00),
(199, '2024-03-19 03:40:19', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 67.00, NULL, 'paid', 'Minus saepe eum explicabo sit suscipit. Et quod repellendus velit ipsa voluptatem voluptatem. Nisi et soluta voluptas ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000059', 0.00),
(200, '2023-12-09 08:41:27', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Quod omnis ipsa quis ut quis. Amet quia sit pariatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000060', 0.00),
(201, '2023-10-01 01:35:51', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 78.00, NULL, 'paid', 'Non voluptatem sapiente suscipit quis totam. Unde modi suscipit velit porro non adipisci quod. Laudantium minima mollitia officia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000074', 0.00),
(202, '2024-04-24 20:03:59', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 34.00, NULL, 'paid', 'Officia aut est qui beatae qui. Repudiandae consequatur ex atque voluptas quo quibusdam asperiores consequuntur. Quo necessitatibus quia error sunt. Consequatur animi sit fuga.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000061', 0.00),
(203, '2024-01-17 21:07:11', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 50.00, NULL, 'paid', 'Ullam adipisci aut delectus error. Veniam omnis non praesentium delectus ipsa esse. Facilis eaque qui amet vel omnis. Omnis fugit voluptatem in quia optio.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 34, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000071', 0.00),
(204, '2024-06-06 17:28:50', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 45.00, NULL, 'paid', 'Cupiditate id eum tempora vel deleniti. Dolorum rerum laudantium adipisci culpa sunt vel. Similique laborum velit ab non et optio.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000062', 0.00),
(205, '2023-10-18 05:36:58', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 91.00, NULL, 'paid', 'Qui est a id earum animi veritatis rerum laudantium. Aut non iure sed beatae. Natus vel reprehenderit porro exercitationem fuga id. Repellendus quia quae enim consectetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000072', 0.00),
(206, '2024-03-06 04:47:26', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 66.00, NULL, 'paid', 'Doloremque molestiae ipsum tenetur delectus rem quas. Autem exercitationem aliquam at voluptatem fugit. Sapiente dolores possimus minus sint sit est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000073', 0.00),
(207, '2024-02-12 16:00:04', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 91.00, NULL, 'paid', 'Soluta ipsam earum officia aut rerum quis. Enim odio saepe aperiam saepe corrupti. Odit nihil laudantium occaecati non dolor sapiente dolorem. Sequi quo officiis non odit eos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000063', 0.00),
(208, '2024-05-28 05:25:15', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 91.00, NULL, 'paid', 'Nostrum eaque ut placeat fuga. Aut in ab necessitatibus odio cum eveniet. Praesentium qui exercitationem perferendis voluptate dignissimos ipsum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000064', 0.00),
(209, '2023-08-13 18:11:58', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 86.00, NULL, 'paid', 'Et ex et fugiat et. Voluptatem et consectetur et ipsa. Nihil voluptatem est et a nostrum reiciendis aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000074', 0.00),
(210, '2024-03-03 01:59:32', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 47.00, NULL, 'paid', 'Est aut dolorum temporibus accusantium voluptas. Deserunt et aut quo amet dignissimos. Perferendis neque voluptatibus nam. Voluptatem sit ipsum eveniet cum commodi asperiores tempora.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000065', 0.00),
(211, '2023-07-27 13:16:43', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 98.00, NULL, 'paid', 'Quo excepturi iusto facilis explicabo velit. Tenetur qui eos sit qui. Vel voluptate et et quia ut impedit. Natus numquam facilis sapiente. Voluptatem ut exercitationem vero aperiam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000066', 0.00),
(212, '2023-08-01 20:04:38', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 81.00, NULL, 'paid', 'Dignissimos nobis quaerat omnis vero. Ut tempora hic ut culpa tempore voluptas. Exercitationem ut et voluptatem doloremque qui est praesentium. Inventore dicta quam soluta debitis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000067', 0.00),
(213, '2024-06-02 08:25:00', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 52.00, NULL, 'paid', 'Mollitia expedita reiciendis dolor animi qui. Distinctio et facere ad et iure aut quos. Ut impedit aliquam consequatur nobis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000075', 0.00),
(214, '2024-04-20 23:27:54', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 94.00, NULL, 'paid', 'Dolores tempore ea voluptas. Doloribus delectus recusandae placeat. Iure necessitatibus est fugit beatae quo ratione qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000068', 0.00),
(215, '2023-09-25 07:06:13', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 42.00, NULL, 'paid', 'Adipisci dolorem voluptatum nisi soluta ea. Sint rerum minus non sit. Et in maiores ipsa voluptatum quas qui accusantium.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000069', 0.00),
(216, '2023-07-30 07:38:40', '2024-06-08 16:09:29', NULL, NULL, 1, NULL, 0.00, 68.00, NULL, 'paid', 'Assumenda perferendis repudiandae similique ducimus. Nobis voluptatibus eius laudantium dicta voluptatem distinctio aut. Dolores ea delectus aliquid perspiciatis non perspiciatis voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:29', '', NULL, 0.00, 0, '000076', 0.00),
(217, '2024-02-08 19:25:24', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 93.00, NULL, 'paid', 'Sit maxime impedit cupiditate autem aut tempore. Odit eligendi et facilis. Ad nobis consequatur officia quam nemo dolores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000075', 0.00),
(218, '2024-03-18 02:00:50', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 99.00, NULL, 'paid', 'Ducimus nihil aut tempore minima quia eveniet incidunt. Tempore accusantium voluptas nobis. Exercitationem unde et ab beatae ipsam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000070', 0.00),
(219, '2023-12-04 00:09:32', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 55.00, NULL, 'paid', 'Et reprehenderit tempora magnam occaecati labore hic. Molestias eaque soluta animi et corrupti enim molestiae. Est et atque est eligendi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000076', 0.00),
(220, '2023-11-06 12:47:37', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 52.00, NULL, 'paid', 'Quaerat suscipit odio aut et commodi ut fugit qui. Eaque fuga assumenda voluptatem aperiam. Sed quaerat tempora ex dignissimos est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000077', 0.00),
(221, '2023-10-26 07:22:36', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 50.00, NULL, 'paid', 'Enim ut modi et molestiae accusamus ea. Facere quo maxime expedita.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000071', 0.00),
(222, '2023-07-31 09:05:51', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 60.00, NULL, 'paid', 'Et neque suscipit possimus ipsa accusamus architecto iste. Facilis cum doloremque numquam nulla. Sed eveniet molestias rerum dignissimos officia temporibus provident.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000077', 0.00),
(223, '2024-04-22 11:22:01', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 97.00, NULL, 'paid', 'Debitis doloremque blanditiis quia est soluta adipisci cumque. Quia magnam id tempore autem ducimus. Dignissimos eum pariatur tempore fugit alias et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000078', 0.00),
(224, '2024-05-21 07:20:26', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 86.00, NULL, 'paid', 'Non in non quis voluptates dicta perspiciatis nisi. Aliquam saepe sit sunt et ex perferendis dolores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000072', 0.00),
(225, '2024-05-04 18:42:53', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 94.00, NULL, 'paid', 'Eveniet est enim libero iusto. Vitae minus earum sit quia aut voluptate. Soluta iusto voluptas reiciendis ullam modi eius. Minus voluptatem molestiae cupiditate enim ullam et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000079', 0.00),
(226, '2023-09-09 07:53:52', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 100.00, NULL, 'paid', 'Voluptatem reiciendis harum enim veritatis. Ex omnis reiciendis nihil. Voluptas quas et magnam similique est. Ea ex voluptas voluptatem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 42, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000078', 0.00),
(227, '2024-02-09 21:13:13', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 32.00, NULL, 'paid', 'Rerum asperiores quam aut dolorem et explicabo et quisquam. Voluptatem sed aut provident sit perferendis. Tempora aut amet ea saepe. Praesentium sed laboriosam nobis nostrum ducimus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000079', 0.00),
(228, '2023-06-13 11:24:51', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 34.00, NULL, 'paid', 'Amet iste cumque laborum consequatur pariatur distinctio. Harum sunt dolorum expedita quia. Cupiditate laboriosam velit alias. Numquam quis incidunt autem cumque reiciendis accusamus id.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000080', 0.00),
(229, '2024-03-02 15:50:10', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 54.00, NULL, 'paid', 'Velit eaque ipsam molestias rem sed consectetur. Placeat rem nemo nihil ea dolorem. Veritatis autem et aspernatur sint amet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000073', 0.00),
(230, '2023-09-25 19:18:20', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 39.00, NULL, 'paid', 'Distinctio molestiae quis nihil fugiat totam eaque ducimus. Nihil magni voluptatem expedita quaerat nulla. Minima magni iste dicta eveniet similique. Sit et soluta nihil sequi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000074', 0.00),
(231, '2023-11-15 08:38:19', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 88.00, NULL, 'paid', 'Sequi fuga aut dolorem blanditiis corrupti. Voluptatem est dicta unde non rerum nihil et. Molestiae molestiae odit dolorem quos libero ex ad.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000081', 0.00),
(232, '2024-04-20 01:04:16', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 62.00, NULL, 'paid', 'Fuga dignissimos ut velit quam. Dignissimos enim facilis amet pariatur non ipsa. Ut voluptatibus cum consequatur voluptas excepturi. Et consequatur eos aut est voluptatem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000075', 0.00),
(233, '2024-03-07 19:07:21', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 70.00, NULL, 'paid', 'Debitis ut repellendus amet. Qui nesciunt nobis repellendus et nihil. Non tempora nulla reprehenderit et sit eveniet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000076', 0.00),
(234, '2024-05-08 06:53:30', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 51.00, NULL, 'paid', 'Et nihil fuga omnis. Ut alias saepe enim aut sed sequi. Delectus omnis ab sed facere debitis fuga.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000080', 0.00),
(235, '2024-04-26 14:21:40', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 54.00, NULL, 'paid', 'Et magni voluptatem occaecati sint blanditiis voluptatum. Modi modi eum excepturi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000082', 0.00),
(236, '2024-06-08 11:02:36', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 32.00, NULL, 'paid', 'Labore eum porro et numquam. Exercitationem ut id eum. Officiis ipsum aliquid cum ipsum. Minima mollitia ut iusto ut quod blanditiis dolorem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 34, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000081', 0.00),
(237, '2024-03-30 06:46:34', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 31.00, NULL, 'paid', 'Excepturi sunt consequatur impedit cumque recusandae ea. Totam nisi qui eaque ut et dolore dolores. Sit facere voluptas ipsum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000083', 0.00),
(238, '2023-12-02 18:36:02', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 55.00, NULL, 'paid', 'Sapiente quam ea minima sed neque eos sed. Quibusdam impedit nam nam maxime ipsum itaque enim.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000084', 0.00),
(239, '2023-09-10 05:08:22', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 72.00, NULL, 'paid', 'Non quibusdam quos laudantium voluptas id repudiandae. Id eligendi et officia quo dolorem itaque ipsum. In modi iusto et fugiat quam modi. Est quos est quis voluptatem corporis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000082', 0.00),
(240, '2024-04-13 14:05:12', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 69.00, NULL, 'paid', 'Et labore occaecati consequatur ipsum perferendis rerum. Autem aperiam sequi occaecati aut. Quisquam laudantium labore officia adipisci error repudiandae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 40, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000083', 0.00),
(241, '2023-08-19 00:31:43', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 43.00, NULL, 'paid', 'Tempora nemo quis quia possimus. Et pariatur itaque vel. Placeat molestias consequuntur aut. Optio qui est totam eaque quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000077', 0.00),
(242, '2023-11-04 21:57:07', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 81.00, NULL, 'paid', 'Beatae aut odio ipsa consequuntur maxime iste ipsam. Cupiditate et architecto hic. Fugit at nulla et omnis necessitatibus numquam. Ut molestiae enim animi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000085', 0.00),
(243, '2023-10-23 03:09:34', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 49.00, NULL, 'paid', 'Ut impedit officiis nisi vel dolor. Molestiae amet sit enim impedit eius dolorum. Dolorem esse ut aut minima excepturi. Error tempore quasi atque fugit voluptatem qui veritatis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000086', 0.00),
(244, '2023-12-14 11:01:27', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 85.00, NULL, 'paid', 'Labore harum nisi ea consequatur. Qui esse et distinctio officiis ullam sit. Voluptatem voluptatem facere eligendi ut molestias velit. Enim voluptas soluta alias.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000087', 0.00),
(245, '2024-04-10 21:21:50', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 75.00, NULL, 'paid', 'Iusto error et aut aliquid et. Rerum velit et pariatur in dolores. Placeat facere qui deserunt minima perspiciatis nihil enim quas. Sequi corporis voluptate similique.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 32, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000084', 0.00),
(246, '2024-03-28 16:39:48', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 33.00, NULL, 'paid', 'Hic iusto aperiam quibusdam id. Quasi similique qui voluptatem ducimus excepturi nisi ut. Facere et qui nostrum commodi quas nihil aliquid deleniti. Labore provident velit perspiciatis vero.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000085', 0.00),
(247, '2023-09-18 18:14:51', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 79.00, NULL, 'paid', 'Corrupti blanditiis tempora quo alias. Quia enim qui modi magnam. Quis numquam occaecati temporibus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000078', 0.00),
(248, '2023-12-09 16:33:10', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 98.00, NULL, 'paid', 'Animi saepe odio ullam a. Quo soluta rerum libero voluptatem voluptas cum. Ut inventore ullam quam consequatur minima.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000088', 0.00),
(249, '2023-07-11 04:05:27', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 75.00, NULL, 'paid', 'Facere laudantium amet veniam aperiam. Ullam fuga laudantium et sequi et aut. Sit consequatur temporibus voluptatem et autem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000086', 0.00),
(250, '2024-05-26 10:49:27', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 64.00, NULL, 'paid', 'Autem voluptatem nemo est ex. Deleniti doloribus quia est est fuga. Deserunt nisi unde provident. Omnis nisi facere omnis sapiente sit et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000087', 0.00),
(251, '2023-06-23 01:37:03', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 82.00, NULL, 'paid', 'Nihil qui autem natus aspernatur. Et facilis quo vero voluptates sunt quaerat officiis. Incidunt voluptatum deleniti sapiente quod saepe porro delectus. Molestias dolores quis quidem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000089', 0.00),
(252, '2024-01-01 17:49:37', '2024-06-08 16:09:33', NULL, NULL, 2, NULL, 0.00, 39.00, NULL, 'paid', 'Dolores totam id quia qui commodi aliquid voluptatem. Nulla nostrum fugit eius ut error dolores sed. Corrupti et commodi est temporibus pariatur. Impedit fugit et labore voluptatibus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:33', '', NULL, 0.00, 0, '000079', 0.00),
(253, '2023-06-26 09:12:59', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 84.00, NULL, 'paid', 'Corrupti dolores error suscipit et est omnis. Impedit quia fugiat sequi esse illo. Repudiandae quae et quia. Consectetur maiores quae ut autem sed a ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000088', 0.00);
INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`, `payment_link`, `employee_id`, `deleted_at`, `md`, `coupon`, `discount`, `kds_finished`, `id_per_vendor`, `tip`) VALUES
(254, '2024-04-11 03:10:38', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 92.00, NULL, 'paid', 'Laudantium eligendi aspernatur et minima sapiente praesentium. Cum dolor repellendus expedita est. A a beatae quia eum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000080', 0.00),
(255, '2024-02-22 16:48:25', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 55.00, NULL, 'paid', 'Eos autem temporibus corrupti vel. Modi et officia autem id repellendus totam. Dolorum non ducimus quidem consequuntur est voluptates.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000081', 0.00),
(256, '2024-02-04 17:43:39', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 92.00, NULL, 'paid', 'Quidem labore et labore quidem. Eveniet dignissimos dolorem sint voluptatum consequatur alias dolorem. Voluptas assumenda est officia consequuntur eaque. Consequatur et temporibus ut amet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000090', 0.00),
(257, '2023-09-18 11:03:52', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 38.00, NULL, 'paid', 'Consectetur omnis laboriosam nihil fugiat soluta est. Voluptatum laboriosam ea debitis sint veniam dicta. Corrupti doloribus ad sed et dolorum laboriosam eligendi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000091', 0.00),
(258, '2023-08-24 07:56:49', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 51.00, NULL, 'paid', 'Quisquam et voluptates et ad dolorem et. Ipsa aut voluptates explicabo consectetur. A occaecati a omnis voluptates dolores deserunt et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000082', 0.00),
(259, '2023-06-14 22:05:46', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 88.00, NULL, 'paid', 'Qui facere rerum eaque sit. Quas vitae ipsam quia esse et ullam praesentium. Odio qui et illo delectus eligendi non.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000089', 0.00),
(260, '2023-08-13 07:01:35', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 57.00, NULL, 'paid', 'Repellat voluptatem reiciendis sit rerum dolorem quam fugiat quasi. Sapiente maiores ratione et vitae optio quos aut ratione. Et corporis cumque placeat.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000092', 0.00),
(261, '2023-10-14 01:48:54', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 87.00, NULL, 'paid', 'Dolor dolore nobis provident. Quasi consequatur odit quas quaerat ipsa quia voluptatem. Accusamus et quam et sint dolores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 40, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000090', 0.00),
(262, '2024-04-04 11:53:39', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 38.00, NULL, 'paid', 'Dolores quis qui inventore. Omnis voluptates non enim et modi sequi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000083', 0.00),
(263, '2023-07-19 13:07:30', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 88.00, NULL, 'paid', 'Aperiam officiis neque est suscipit. Sequi ea quibusdam voluptates aut minima iusto voluptatem. Dicta placeat ullam voluptatem quam. Quisquam dolore voluptas et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000091', 0.00),
(264, '2023-11-18 06:23:56', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 86.00, NULL, 'paid', 'Laborum vel ea consequuntur ea. Non nobis sit neque et ducimus alias recusandae. Est omnis molestiae facilis et voluptates provident.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000093', 0.00),
(265, '2024-05-14 01:17:23', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 34.00, NULL, 'paid', 'In voluptate sed qui nam. Autem odit velit quis natus. Id reprehenderit saepe tempora qui. Mollitia iusto molestiae dicta quis quia harum fugit. Fugiat deleniti expedita omnis voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000094', 0.00),
(266, '2023-11-24 23:13:53', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 70.00, NULL, 'paid', 'Hic consequatur odio quia delectus accusantium numquam cum. Est error dicta ut eos sit a. Sed ratione et minus aut totam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 40, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000092', 0.00),
(267, '2023-10-05 09:52:31', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 87.00, NULL, 'paid', 'Et molestiae laudantium voluptas porro. Consequuntur vero molestiae dolores corrupti in. Adipisci amet quis enim quisquam cumque qui ut sed.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000084', 0.00),
(268, '2023-12-19 17:01:30', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 60.00, NULL, 'paid', 'Eaque possimus sunt velit rerum magni rerum. Repudiandae omnis omnis occaecati sed. Sunt voluptatum quo assumenda minima adipisci id.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000085', 0.00),
(269, '2023-08-25 09:31:28', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 52.00, NULL, 'paid', 'Sunt quae deleniti minima atque sit consectetur. Voluptatum iste eos omnis sit et delectus. Corporis doloremque voluptas consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000095', 0.00),
(270, '2024-03-09 15:01:33', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 92.00, NULL, 'paid', 'Cupiditate cumque sint enim inventore illo distinctio omnis. Repellat tempore voluptatem quos ut aut sint. Incidunt qui reiciendis aliquid labore voluptas quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000086', 0.00),
(271, '2023-06-24 01:55:35', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 36.00, NULL, 'paid', 'Neque corporis et officia autem id soluta velit eos. Voluptatem velit officiis in esse. Reiciendis voluptatibus minus assumenda natus culpa minima soluta. Non iure quas ut repellendus perferendis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000093', 0.00),
(272, '2024-03-24 16:06:10', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 89.00, NULL, 'paid', 'Voluptate sapiente voluptatum laudantium asperiores. Perferendis molestias placeat esse sed adipisci qui iure. Deleniti reprehenderit consequuntur expedita atque velit sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000094', 0.00),
(273, '2023-06-15 20:44:58', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 67.00, NULL, 'paid', 'Iste quas modi cupiditate deserunt dolorem. A quos quia illo ratione accusantium enim id. Doloremque error consequatur non sapiente consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000096', 0.00),
(274, '2023-12-08 21:32:17', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 37.00, NULL, 'paid', 'Ipsa qui doloremque distinctio quaerat. Quis tenetur repellat numquam voluptatem iste adipisci. Quo eum et magni similique.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000087', 0.00),
(275, '2024-01-11 11:36:35', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 63.00, NULL, 'paid', 'Vitae reprehenderit ea ut impedit. Molestiae quis omnis atque quia delectus aut nam. Nihil reiciendis nemo aliquam facere qui. Amet ea officia illum eius asperiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000095', 0.00),
(276, '2024-05-31 02:17:42', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 55.00, NULL, 'paid', 'Adipisci in illum nam neque. Consequatur repellendus accusantium eaque sint dolorem et. Optio debitis animi quia accusantium est. Aut vel vero dolorem eum beatae quisquam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000097', 0.00),
(277, '2023-08-02 13:59:45', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 92.00, NULL, 'paid', 'Sapiente quisquam cum vitae harum ut. Facere odit magni voluptatem laborum voluptatum ipsa. Dolorum quo rerum distinctio dolor soluta.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000096', 0.00),
(278, '2024-04-08 12:24:31', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 91.00, NULL, 'paid', 'In quod magni voluptatibus officiis omnis minima. Numquam illo minima et laborum. A vel ea similique animi pariatur reprehenderit officiis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000088', 0.00),
(279, '2023-06-14 10:35:25', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 43.00, NULL, 'paid', 'Aliquam perspiciatis quo quod ea. Aut molestiae omnis omnis aut sed non quo. Aut cumque doloribus libero itaque qui libero doloremque similique.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000098', 0.00),
(280, '2023-11-05 07:15:33', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 49.00, NULL, 'paid', 'Consequatur voluptas dolor et rerum nihil vero dicta. Nemo velit fugit repudiandae sed quasi nihil. Excepturi asperiores voluptatem distinctio neque consequatur. Est ut eos dolore.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000099', 0.00),
(281, '2023-08-24 20:18:42', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 66.00, NULL, 'paid', 'Quam ratione esse eveniet hic culpa consequatur. Et ex veritatis velit fugiat. Vel sit voluptatem quas quia provident. Quae omnis voluptatem similique id blanditiis voluptatem ea libero.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000097', 0.00),
(282, '2023-07-14 12:44:00', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 44.00, NULL, 'paid', 'Aliquam et voluptates dolorem. Ut dolores omnis quidem aspernatur saepe consequuntur. Fuga iure qui voluptatem dolorum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000100', 0.00),
(283, '2023-10-11 04:22:09', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 57.00, NULL, 'paid', 'Vel ut et sapiente est minima iure rerum suscipit. Iusto natus cupiditate est error non aut. Sed provident quos modi perferendis. Distinctio reiciendis praesentium aliquid occaecati et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 32, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000098', 0.00),
(284, '2024-05-02 17:29:49', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 98.00, NULL, 'paid', 'Porro commodi aut pariatur porro laborum. At ipsum eaque placeat suscipit nisi sit maiores. Numquam hic labore fugiat ipsam hic. Voluptatem nemo est corrupti natus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000099', 0.00),
(285, '2023-12-20 21:01:49', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 54.00, NULL, 'paid', 'Optio quos voluptatem sequi nam rerum debitis. Non quasi voluptatibus occaecati veniam non est sed. Maxime qui facere deleniti modi esse. Et atque doloremque voluptatem dolor cumque eveniet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000089', 0.00),
(286, '2023-10-31 03:00:42', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 93.00, NULL, 'paid', 'Ipsam eaque quis ipsum provident accusamus porro voluptatibus libero. Id quis laborum modi recusandae. Consequatur velit alias sint nulla. Amet sit ipsum sit est totam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 20, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000090', 0.00),
(287, '2023-06-25 03:00:55', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 42.00, NULL, 'paid', 'Ab ex nam sunt et cum recusandae. Et ab ut dicta. Nam suscipit in aut corporis libero maiores dolorem. At incidunt repellendus veniam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000091', 0.00),
(288, '2023-06-12 04:56:12', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 70.00, NULL, 'paid', 'Sit dolorem iure cupiditate aut sunt praesentium eos ab. Sed fugiat voluptatem ut et rerum voluptates itaque. In ut occaecati ipsum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 40, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000100', 0.00),
(289, '2023-12-04 11:06:01', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 96.00, NULL, 'paid', 'Animi quaerat officia similique. Ea dolores minus maiores officiis. Quia inventore repellendus non molestiae totam vitae. Deleniti ipsum magni eius earum rerum maiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000092', 0.00),
(290, '2024-03-16 10:47:27', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Id sapiente deserunt tempore eos sit enim. Exercitationem nam omnis dolorem praesentium consequatur hic. Voluptatibus cupiditate voluptate reiciendis esse dolor.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000093', 0.00),
(291, '2023-08-09 23:29:13', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 94.00, NULL, 'paid', 'Totam amet aspernatur laborum praesentium vel. Sed voluptas et iste ut. Quod nihil vero possimus expedita repellendus ullam nemo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000094', 0.00),
(292, '2023-10-23 16:02:41', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 91.00, NULL, 'paid', 'Quae eum inventore et voluptate iusto sequi assumenda. Vel qui amet deleniti perspiciatis illo qui dolor ipsa.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000101', 0.00),
(293, '2024-01-30 23:29:01', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 65.00, NULL, 'paid', 'Quia non eos et quas omnis. Et aut ea odio ut provident. Magnam sint officia dolorem et ut. Iste doloribus praesentium error numquam facere nesciunt asperiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000101', 0.00),
(294, '2023-11-27 14:55:00', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 79.00, NULL, 'paid', 'Est rerum consequatur placeat beatae aspernatur sit. Et tempora molestias velit laborum laboriosam. Sunt quo unde asperiores enim aut porro.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000102', 0.00),
(295, '2023-08-07 20:14:32', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 41.00, NULL, 'paid', 'Aut officiis tenetur veniam dolores libero. Velit ipsam quis veritatis. Facere omnis est non error sed sed qui. Qui est dolore voluptate ut eveniet quas quod.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000103', 0.00),
(296, '2023-06-14 19:17:20', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 82.00, NULL, 'paid', 'Ad odio est consequatur odit. Eum dicta similique sed corporis ullam. Recusandae voluptas asperiores id doloremque omnis dignissimos impedit officiis. Nisi sint voluptatem veniam tempora.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000095', 0.00),
(297, '2023-06-20 16:30:56', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 77.00, NULL, 'paid', 'Dolores delectus quas et esse deserunt. Molestias debitis corrupti corporis voluptatibus voluptas voluptas magni. Quaerat aut fugit quo quos est. Ab est ut sit suscipit quas voluptates repudiandae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000096', 0.00),
(298, '2023-11-02 14:03:33', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 89.00, NULL, 'paid', 'Autem dolore adipisci sequi iste facere nam. Eligendi ea non exercitationem. Reiciendis enim dolores qui voluptas possimus. Odit est delectus consequuntur accusantium porro repellat.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000104', 0.00),
(299, '2023-11-12 20:03:44', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 89.00, NULL, 'paid', 'Unde dignissimos molestiae nemo. Occaecati sunt voluptatem aut qui. A est porro repudiandae ut beatae et omnis. Aut ex quis est et minus qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000097', 0.00),
(300, '2023-09-29 01:02:25', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 43.00, NULL, 'paid', 'Sit ad id velit dolorem voluptas. Molestiae assumenda nostrum illo temporibus sunt. Cupiditate nostrum fugiat itaque possimus ut. Pariatur quidem in praesentium natus autem est nihil.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000102', 0.00),
(301, '2023-10-01 10:09:18', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 37.00, NULL, 'paid', 'Sequi sint dolores quod accusamus repellendus eaque ut. Quidem qui dolorem beatae ipsam ut. Eum recusandae beatae iusto et quia quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000103', 0.00),
(302, '2024-01-12 10:13:57', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 53.00, NULL, 'paid', 'Quasi reprehenderit quod odio aut voluptatem. Ea libero sed consequatur minima reiciendis harum ea. Et est commodi aut et quam. Qui eveniet earum quia accusamus nisi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000104', 0.00),
(303, '2023-06-08 20:32:04', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 70.00, NULL, 'paid', 'Dolorum ipsum debitis id eum ducimus aut. Minus eius ducimus velit quasi porro non error. Aut laudantium minima temporibus velit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000105', 0.00),
(304, '2023-08-02 20:42:45', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 93.00, NULL, 'paid', 'Delectus beatae corrupti dolores temporibus quaerat. Velit quaerat atque vitae recusandae eligendi ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 42, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000105', 0.00),
(305, '2023-07-20 05:37:07', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 51.00, NULL, 'paid', 'Aut aliquid libero totam est. Eaque omnis non occaecati quia qui optio. Ullam ut voluptate in aut ut quae hic. Accusamus deleniti reprehenderit consequatur consequatur blanditiis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000106', 0.00),
(306, '2023-08-25 15:51:46', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 69.00, NULL, 'paid', 'Numquam sed in sed dicta. Exercitationem accusantium sit voluptates doloribus officia quidem. Sequi in quis magnam rem laboriosam. Sequi sequi nulla commodi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000098', 0.00),
(307, '2023-08-15 02:18:02', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 57.00, NULL, 'paid', 'Dolores a sapiente omnis accusantium porro. Sed eligendi inventore eos deleniti ut quibusdam. Consequatur praesentium quo animi ullam perferendis veniam qui. Fuga ad molestias vero architecto ut aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000099', 0.00),
(308, '2023-11-15 22:43:44', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 33.00, NULL, 'paid', 'Quibusdam quam quibusdam est eveniet tenetur aperiam totam officiis. Temporibus reiciendis deleniti illum quasi nihil est. Rerum rem excepturi voluptatem omnis eum iure quos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000107', 0.00),
(309, '2023-07-06 07:30:31', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 56.00, NULL, 'paid', 'Modi ex sit quam minus dicta ad. Corrupti itaque esse voluptates quidem impedit consequuntur assumenda. Alias nostrum accusantium adipisci tempore.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000100', 0.00),
(310, '2024-01-13 13:32:21', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 62.00, NULL, 'paid', 'Consectetur enim saepe nobis nobis fugit fugit ab. Quisquam rerum itaque enim ut. In quod impedit aliquid doloremque perferendis optio velit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000108', 0.00),
(311, '2023-10-31 06:23:43', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 61.00, NULL, 'paid', 'Magnam voluptatibus praesentium ut voluptatem aut ullam quis magni. Numquam sapiente sed aut pariatur quis modi. Perferendis sint voluptas et quo a sit voluptates.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000106', 0.00),
(312, '2024-01-18 15:18:37', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 46.00, NULL, 'paid', 'Quia animi non exercitationem. Alias aliquam molestiae sit repudiandae. Architecto tempora minus accusantium eius delectus eos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000107', 0.00),
(313, '2024-02-28 18:33:05', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 99.00, NULL, 'paid', 'Earum maxime voluptatem non officiis quasi minima. Iste nihil quisquam et eum voluptatibus in. Atque et vero soluta cumque voluptas quam. Et consectetur nihil corrupti placeat modi quibusdam veniam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 42, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000108', 0.00),
(314, '2023-12-25 15:54:00', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 53.00, NULL, 'paid', 'Ea est ducimus explicabo non pariatur. Corrupti ducimus cum autem et voluptas hic perferendis consequatur. Sit et necessitatibus inventore quia molestiae esse ab vitae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000109', 0.00),
(315, '2023-11-03 20:19:31', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 53.00, NULL, 'paid', 'Nihil aut explicabo repellendus voluptatem et et asperiores. Nostrum ad optio natus aspernatur exercitationem et. Quidem eum id fugiat. Doloremque hic cum iste earum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000110', 0.00),
(316, '2024-03-03 03:45:15', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 68.00, NULL, 'paid', 'Quia et laborum voluptatem et saepe. Eveniet repudiandae consequatur sed similique. Voluptatum temporibus qui aliquam velit dolore.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000111', 0.00),
(317, '2024-03-11 00:50:01', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 79.00, NULL, 'paid', 'Nihil quia dolore eum et mollitia quia corrupti. Quia praesentium ad enim iusto nihil dolor et. Velit et cupiditate ad voluptatem. Nisi excepturi voluptates placeat sequi quo in laborum incidunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000112', 0.00),
(318, '2024-05-05 23:30:14', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 93.00, NULL, 'paid', 'Corrupti vel omnis ratione voluptatem aperiam iusto nam. Nihil aut iusto ut quas. Est ea sapiente ipsa ut. Aspernatur aliquam accusantium voluptate nemo consectetur commodi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000101', 0.00),
(319, '2023-09-01 04:57:50', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 93.00, NULL, 'paid', 'Accusamus numquam nostrum omnis laudantium eius aut unde est. Quia voluptas deleniti est incidunt. Rerum placeat sunt iste in. Rerum est vero voluptas rerum aut et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000113', 0.00),
(320, '2023-11-07 03:12:12', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 81.00, NULL, 'paid', 'Eum deleniti non quia repudiandae deserunt suscipit. Blanditiis sit voluptas vel. Qui iusto debitis id dolor non.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000109', 0.00),
(321, '2023-12-22 13:33:47', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Autem ut necessitatibus blanditiis ut debitis natus. Nobis in vel officia sit et dolore. Occaecati consectetur officiis at. Voluptatem voluptas qui sed et dolor maiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000102', 0.00),
(322, '2023-12-29 11:12:36', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 68.00, NULL, 'paid', 'Officiis saepe quo harum autem. Iusto dolor voluptatum praesentium magnam temporibus et. Veniam optio sapiente rem consequatur. Debitis recusandae debitis eveniet sint quos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000103', 0.00),
(323, '2023-10-30 20:36:32', '2024-06-08 16:09:30', NULL, NULL, 1, NULL, 0.00, 36.00, NULL, 'paid', 'Quos molestiae repellendus deleniti facere dolores autem numquam. Enim in omnis ipsam facilis tempora rerum et. Voluptates magnam alias est commodi reiciendis. Harum qui ullam et ea vel est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:30', '', NULL, 0.00, 0, '000114', 0.00),
(324, '2023-08-21 07:19:16', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 51.00, NULL, 'paid', 'Eaque qui ipsum et nisi vel distinctio quam. Nemo magnam ab ducimus similique perferendis. Modi consequuntur dolore sed nesciunt aspernatur commodi. Saepe rerum illo quia tempore pariatur commodi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000110', 0.00),
(325, '2024-02-03 23:46:34', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 30.00, NULL, 'paid', 'Consequatur hic ea ducimus nesciunt dolorem. Sequi voluptatem consequatur nisi ducimus qui nemo saepe nostrum. Tempora qui quas impedit eligendi. Mollitia nobis qui nemo veritatis deleniti et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000111', 0.00),
(326, '2024-01-04 08:31:40', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 75.00, NULL, 'paid', 'Odit sit quo molestiae earum. Ab ullam vel ut et esse.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000115', 0.00),
(327, '2024-06-07 14:28:10', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 94.00, NULL, 'paid', 'Autem et corporis tempora voluptatem et. Architecto fugit animi quidem fugit alias eum. Minima voluptatem qui consequatur. Fugiat enim sit quis sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000116', 0.00),
(328, '2023-07-07 02:45:13', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 65.00, NULL, 'paid', 'Quia perferendis id et qui nihil aut quisquam quis. Consequatur corporis eos omnis ut sint illo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000104', 0.00),
(329, '2024-03-15 20:19:27', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 38.00, NULL, 'paid', 'Ipsa nemo possimus rerum. Est laudantium qui asperiores culpa inventore quia natus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000117', 0.00),
(330, '2024-04-25 13:01:28', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 31.00, NULL, 'paid', 'Odio quod possimus expedita. Voluptatum itaque ut omnis ratione aut. Voluptatibus eius facere asperiores corporis nihil repellat. Beatae commodi veniam odit officiis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000105', 0.00),
(331, '2023-10-27 14:50:18', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 67.00, NULL, 'paid', 'Quidem placeat porro laudantium qui. Sint harum molestias expedita esse est tenetur. Labore quasi ut ipsum rerum et qui quo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000118', 0.00),
(332, '2023-07-26 18:47:59', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 95.00, NULL, 'paid', 'Molestiae optio sed reiciendis quae provident et aliquid autem. Ullam nihil natus ab id expedita. Impedit harum aperiam molestiae saepe. Quia iste nulla eius nemo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000119', 0.00),
(333, '2023-07-07 08:23:13', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 69.00, NULL, 'paid', 'Quibusdam officia qui eum hic. Temporibus magnam et quae facere aut et laboriosam. Vel ipsum iusto vitae officia voluptatum molestiae ut. Qui harum nostrum aut sit incidunt voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000106', 0.00),
(334, '2024-05-03 16:42:45', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 88.00, NULL, 'paid', 'Qui cumque dolorem doloribus est. Nihil neque alias aliquid ut optio omnis nam voluptatem. Dolor necessitatibus illum dolorum error rerum amet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000120', 0.00),
(335, '2024-01-03 15:33:21', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 83.00, NULL, 'paid', 'Atque accusantium sapiente optio quo. Cumque quis velit sequi nihil. Iusto molestiae aut modi deserunt est quod minima. Consequatur reprehenderit consectetur omnis sunt non earum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000107', 0.00),
(336, '2024-01-30 05:58:46', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 75.00, NULL, 'paid', 'Nisi architecto perferendis dolorem et officiis nostrum illum. Dicta est incidunt expedita quod omnis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000112', 0.00),
(337, '2024-03-13 04:24:26', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 36.00, NULL, 'paid', 'Eum ea et quisquam quam animi aperiam. Molestias repellendus sit ipsum modi voluptas velit. Vel earum nobis non animi. Nihil hic qui sed expedita enim ea.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000113', 0.00),
(338, '2024-03-25 07:24:47', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 38.00, NULL, 'paid', 'Quaerat maiores sunt et odio nihil illo. Doloribus dicta eos porro fugiat natus ut a voluptatem. Et voluptates quia totam eius. Culpa est est sint aut voluptatem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 40, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000114', 0.00),
(339, '2023-06-19 08:58:36', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 88.00, NULL, 'paid', 'Ex reprehenderit rerum vitae pariatur. Quia ut cupiditate est ipsa corporis. Natus veniam optio autem qui placeat cupiditate rerum. Similique tempora omnis maiores quisquam ducimus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000108', 0.00),
(340, '2024-03-23 06:18:50', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 76.00, NULL, 'paid', 'Et nostrum eveniet autem cumque consequuntur culpa. Occaecati aut quis sequi molestias et saepe. Enim voluptas inventore accusamus consequuntur temporibus tenetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000121', 0.00),
(341, '2023-06-14 08:22:23', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 41.00, NULL, 'paid', 'Iure dolores dolorum itaque. Aut qui saepe unde hic nostrum odit. Voluptatibus omnis inventore est quibusdam a voluptatibus. Iure inventore nihil ex nulla enim cum molestiae suscipit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000109', 0.00),
(342, '2024-06-04 05:03:45', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 38.00, NULL, 'paid', 'Illum ad quia consequatur velit. Odio voluptatum accusamus consequatur. Beatae numquam quia autem esse. Minima et quaerat molestiae officiis debitis qui animi autem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000110', 0.00),
(343, '2023-11-11 07:20:45', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 50.00, NULL, 'paid', 'Esse voluptatibus quibusdam in recusandae consequatur corporis nulla. Fugiat labore voluptatum corporis aspernatur magni ut ut. Officiis odit dicta quaerat et et omnis. Dolor a nostrum maiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000115', 0.00),
(344, '2023-07-30 09:58:40', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 34.00, NULL, 'paid', 'Eum quis in est quis. Dolor at et illum cumque fugiat. Odit dolorem aut qui quam magnam aut et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000122', 0.00),
(345, '2023-11-15 16:28:31', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 64.00, NULL, 'paid', 'Consectetur voluptatem ducimus dolor deserunt eos. Repudiandae quae ex dolores rerum maxime quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 40, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000116', 0.00),
(346, '2024-05-30 18:52:13', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 66.00, NULL, 'paid', 'Enim voluptatum tempora voluptas dolor. Recusandae sint voluptatem non expedita sed quibusdam saepe. Est doloribus eum laborum beatae numquam. Laboriosam et dolorum officia beatae expedita.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000117', 0.00),
(347, '2023-08-23 05:38:59', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 64.00, NULL, 'paid', 'Quis est tempora provident ab. Iste debitis aliquid facere hic dolores voluptas. Maxime sint eaque voluptatem. Et rerum qui perferendis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000111', 0.00),
(348, '2024-02-08 12:10:57', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 100.00, NULL, 'paid', 'Ad dolor odio eaque repellendus accusantium. Non quis sed quia aut maxime sit laudantium. Placeat maxime sint sequi rerum. Doloribus excepturi nostrum ex dolore.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000112', 0.00),
(349, '2024-01-31 11:44:10', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 99.00, NULL, 'paid', 'Aut quis quae sit excepturi ab. Sit molestias odit unde quia esse pariatur veritatis. Laudantium molestiae in enim error placeat culpa.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000113', 0.00),
(350, '2023-08-10 21:43:53', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 80.00, NULL, 'paid', 'Rerum ad ea qui aperiam aut. Totam minima et qui alias. Earum est consequuntur animi explicabo. Dolor dolorum sunt recusandae rerum rerum dolore.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000114', 0.00),
(351, '2023-06-11 00:01:22', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 51.00, NULL, 'paid', 'Qui adipisci ratione aspernatur et. Sunt ipsam sint est harum quia repellendus veritatis et. Aspernatur et et blanditiis non qui velit. Molestiae unde excepturi qui accusamus eum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000118', 0.00),
(352, '2023-09-19 04:11:39', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 88.00, NULL, 'paid', 'Qui ut molestias sequi facere voluptas est doloribus in. Voluptatem rerum possimus sit possimus. Et et non illum odio quod eos nihil. Totam aliquid qui consectetur pariatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 34, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000119', 0.00),
(353, '2024-02-24 18:39:15', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 73.00, NULL, 'paid', 'Nam excepturi et sapiente mollitia non autem voluptatem. Laboriosam eos itaque at quaerat. Optio est eum exercitationem assumenda.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000123', 0.00),
(354, '2023-07-18 10:11:04', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 50.00, NULL, 'paid', 'Eos ut praesentium voluptatibus cupiditate. Illo non aliquam delectus omnis est sunt. Necessitatibus sed praesentium praesentium eos qui voluptatem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000124', 0.00),
(355, '2023-09-07 12:34:15', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 50.00, NULL, 'paid', 'Praesentium voluptatem ullam aut eius blanditiis sed. Dolorem ab voluptatem cum autem. Est voluptatem labore recusandae assumenda dignissimos. Maxime ipsum recusandae dolor sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000120', 0.00),
(356, '2023-10-06 10:49:55', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 58.00, NULL, 'paid', 'Facilis voluptatem repellendus libero ut. Quibusdam rerum enim quia illum et officiis. Debitis ipsam blanditiis ut et accusantium fugit nulla.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000121', 0.00),
(357, '2024-05-07 12:23:34', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 52.00, NULL, 'paid', 'Aut repellat non quo officia perferendis adipisci. Ipsam facilis accusamus hic et distinctio quisquam. Quos iusto sunt ad rerum animi est corrupti.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000115', 0.00),
(358, '2023-10-20 00:49:53', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 35.00, NULL, 'paid', 'Ut quo adipisci voluptas quod consequatur. Similique sit quaerat nisi quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000125', 0.00),
(359, '2024-05-10 11:25:27', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 98.00, NULL, 'paid', 'Necessitatibus qui maxime incidunt dolorem laboriosam. Nobis doloribus omnis eos nisi maiores ut. Sapiente sint maxime aliquid laudantium magnam ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000126', 0.00),
(360, '2023-09-27 09:13:12', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 36.00, NULL, 'paid', 'Qui autem itaque nam aliquid. Id porro odio non eum esse distinctio ad. Odio possimus incidunt repellendus exercitationem cum. In ut amet in et qui vitae magnam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000116', 0.00),
(361, '2023-07-21 18:47:02', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 67.00, NULL, 'paid', 'Vero dolor delectus sunt eum autem porro ducimus. Rem optio quasi dolor est vel. Labore quibusdam perspiciatis et et blanditiis eaque. Dignissimos provident laboriosam eos natus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000117', 0.00),
(362, '2024-05-09 05:53:17', '2024-06-08 16:09:39', NULL, NULL, 3, NULL, 0.00, 57.00, NULL, 'paid', 'Quam ducimus aliquid deserunt voluptatem. Occaecati provident vero dolor ipsa. Rerum hic tempore aperiam modi quia ut officia. Aut qui sint iure sunt quos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:39', '', NULL, 0.00, 0, '000122', 0.00),
(363, '2023-10-14 00:52:16', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 83.00, NULL, 'paid', 'Magnam corporis dolores laboriosam dolores ea non corrupti. Aut in iure consequatur excepturi porro rem maiores. Velit excepturi corrupti occaecati voluptas numquam et voluptatum consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000118', 0.00),
(364, '2024-04-29 14:45:26', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 31.00, NULL, 'paid', 'Quidem ut voluptatem sit totam enim. Consequuntur cupiditate enim illum blanditiis sed autem possimus repellendus. A ullam rerum voluptatum qui minima dolorum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000127', 0.00),
(365, '2023-11-09 23:03:31', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 54.00, NULL, 'paid', 'Ut corporis fuga tempore nulla. Dolores eum dicta eos. Consequatur praesentium doloremque aut dolore sint porro sequi enim. Rerum perspiciatis ad iusto est consectetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000119', 0.00),
(366, '2023-10-08 02:13:03', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 50.00, NULL, 'paid', 'Aut asperiores temporibus cupiditate quis ab consectetur et. Asperiores dolor eos quam ea asperiores. Similique cumque autem itaque debitis eum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000123', 0.00),
(367, '2024-02-04 00:49:53', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 94.00, NULL, 'paid', 'Beatae veniam impedit labore odit maxime necessitatibus fuga. Sit iusto aut sunt atque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000124', 0.00),
(368, '2023-06-10 15:09:10', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 91.00, NULL, 'paid', 'Amet dolorem quas ipsum at dignissimos tenetur non. Itaque voluptatem veritatis eligendi amet facilis. Placeat et expedita vero quo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000120', 0.00),
(369, '2023-08-27 04:46:54', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 90.00, NULL, 'paid', 'Eius quis quibusdam sit at facilis inventore ducimus doloremque. Est necessitatibus libero eaque ea saepe voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000128', 0.00),
(370, '2024-03-15 14:00:31', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 85.00, NULL, 'paid', 'Deserunt non et qui sit est eligendi architecto. Tempora vel expedita omnis officiis exercitationem sit. Provident quisquam sit illo quia perspiciatis sint.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000129', 0.00),
(371, '2023-07-02 04:09:44', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 52.00, NULL, 'paid', 'Inventore veniam nesciunt velit id est vel nostrum. Omnis est fugiat sequi voluptatem ut perferendis sunt. Ab harum et eveniet magnam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000121', 0.00),
(372, '2024-03-03 17:17:21', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 91.00, NULL, 'paid', 'Voluptatem exercitationem ut omnis ut. Fugit qui autem voluptatem ducimus ullam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000122', 0.00),
(373, '2024-06-05 16:10:05', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 47.00, NULL, 'paid', 'Ipsum velit aliquid eum sint occaecati voluptatem. Nam quidem delectus sint eum soluta praesentium. Voluptatum fugit sint necessitatibus. Repellendus eaque et autem ratione eligendi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000123', 0.00),
(374, '2023-10-03 20:50:23', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 97.00, NULL, 'paid', 'Quod in ut commodi. Pariatur autem odit quibusdam. Cumque molestiae distinctio aut consequatur aut rerum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000125', 0.00),
(375, '2024-02-28 15:04:21', '2024-06-08 16:09:34', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Nesciunt in vitae ducimus voluptatem et minima voluptatibus. Excepturi sed autem dicta. Qui dolor tempore consequuntur exercitationem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:34', '', NULL, 0.00, 0, '000124', 0.00),
(376, '2023-10-13 21:11:07', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 51.00, NULL, 'paid', 'Et laudantium eos velit. Voluptate error aspernatur nihil porro ea. Ratione occaecati consequatur dolores nobis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000130', 0.00),
(377, '2024-05-14 09:38:41', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 97.00, NULL, 'paid', 'Provident fuga dolores qui eos et. Nesciunt velit facere quod eum harum et. Laborum quo ab possimus in.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000125', 0.00),
(378, '2024-04-11 20:56:25', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 49.00, NULL, 'paid', 'Rerum accusamus voluptatem facilis nihil enim. Velit qui maxime vitae et. Eius natus magnam unde officia voluptate maiores sequi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000126', 0.00);
INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`, `payment_link`, `employee_id`, `deleted_at`, `md`, `coupon`, `discount`, `kds_finished`, `id_per_vendor`, `tip`) VALUES
(379, '2023-11-02 15:55:49', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 31.00, NULL, 'paid', 'Tempore commodi fugiat incidunt et sequi sunt temporibus. Tempora ut aut neque laborum molestiae dignissimos et. Eos nobis ut temporibus voluptates sunt qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 34, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000127', 0.00),
(380, '2023-11-12 16:41:24', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 31.00, NULL, 'paid', 'Consequatur id omnis odit ea reprehenderit qui nisi. Dolore quia molestiae eveniet laudantium sit. Mollitia exercitationem aut iste repellendus saepe dignissimos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000128', 0.00),
(381, '2023-12-24 08:35:57', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 97.00, NULL, 'paid', 'Perferendis odio minima pariatur modi iure. Sunt impedit eligendi aperiam quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000129', 0.00),
(382, '2024-02-11 03:51:14', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 73.00, NULL, 'paid', 'Aut atque quia iusto sit quia quaerat. Occaecati et ipsum impedit perferendis et. Error assumenda et enim id facilis sint. Quis quia debitis sint ut consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000131', 0.00),
(383, '2023-07-23 06:54:32', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 97.00, NULL, 'paid', 'Libero commodi ut dolorum est. Vel est consequatur suscipit vero ducimus. Aut iusto explicabo id libero et tempore sunt quaerat.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000130', 0.00),
(384, '2024-01-02 18:04:08', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 51.00, NULL, 'paid', 'Delectus autem dolorem consequuntur. Illo odio qui veritatis omnis. Rerum iure ullam aut sapiente iure. Et officia impedit voluptas praesentium qui sunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000126', 0.00),
(385, '2024-04-02 06:28:14', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 78.00, NULL, 'paid', 'Temporibus id sed aut non. Ea eum quae aut non qui. Aut placeat ad maxime est iste nihil atque. Architecto quis reiciendis veritatis totam eum voluptatem id.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000132', 0.00),
(386, '2024-04-23 10:13:29', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 54.00, NULL, 'paid', 'Nihil minus eveniet voluptatem ut totam quia et corrupti. Hic est sit autem. Deleniti autem quae dolores ut sed. Alias dolores et nobis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 42, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000131', 0.00),
(387, '2023-07-14 17:24:10', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 37.00, NULL, 'paid', 'Cupiditate aliquid odio sunt quam modi quo aut vero. Culpa dolor cumque est odio dolorem error. Porro dolores quis quae aliquid fugiat. Sint et dicta quisquam nostrum laborum ipsam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000133', 0.00),
(388, '2023-06-30 15:13:52', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 95.00, NULL, 'paid', 'Autem provident nostrum earum incidunt qui quibusdam corporis ipsum. Ut et et aspernatur debitis. Praesentium debitis debitis id voluptatem sed.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000127', 0.00),
(389, '2024-02-01 06:00:23', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 51.00, NULL, 'paid', 'Laborum quis molestiae minus nesciunt. Velit ut eius quisquam nihil sed maiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000134', 0.00),
(390, '2024-04-26 05:57:48', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 81.00, NULL, 'paid', 'Ullam vel ea enim veritatis nemo. Id ut qui ex et ipsum officia doloremque. Et aliquid hic esse consequatur voluptatem praesentium. Aliquam labore ut quibusdam aperiam enim.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000132', 0.00),
(391, '2023-12-29 18:55:16', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 94.00, NULL, 'paid', 'Fuga illum voluptatem eos ex explicabo. Pariatur et ab ea error. Rem sit voluptates nulla et nostrum eum iusto velit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000133', 0.00),
(392, '2024-03-06 02:45:31', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 96.00, NULL, 'paid', 'Consequatur est aut culpa possimus earum aut. Nisi porro ea aliquid exercitationem iure reiciendis. Atque voluptate saepe eos est reprehenderit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000135', 0.00),
(393, '2023-08-31 06:32:16', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 64.00, NULL, 'paid', 'Qui omnis eum id consequuntur praesentium mollitia. Similique velit minus distinctio labore ad et consequatur omnis. Fuga laudantium aut ullam asperiores ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000134', 0.00),
(394, '2024-06-02 15:36:46', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 81.00, NULL, 'paid', 'Illo animi rerum magni modi iste. Quia ea a ratione ducimus vel quia. Quibusdam non reiciendis tenetur velit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000128', 0.00),
(395, '2023-12-27 05:17:46', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 30.00, NULL, 'paid', 'Ea neque amet minima error. Eaque consequatur ex voluptas voluptatem fuga. Dolores mollitia dolores iure fugit voluptas quia ullam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000135', 0.00),
(396, '2024-03-14 06:07:48', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 77.00, NULL, 'paid', 'Sequi est molestias et accusantium qui commodi quasi aut. Atque at voluptatibus rerum dolore animi. Totam reiciendis delectus dignissimos sit quo. Voluptatibus ab sequi ipsum eaque totam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000136', 0.00),
(397, '2023-07-11 02:02:49', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 85.00, NULL, 'paid', 'Dolor ut et natus quam atque voluptas illum. Consequatur voluptatem perferendis ad voluptate eum dolores eum. Repellendus in ut sit vitae. Delectus consequatur recusandae dolores iusto impedit nisi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000136', 0.00),
(398, '2023-08-02 09:33:24', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 55.00, NULL, 'paid', 'Quae eos debitis quo et ipsam reprehenderit. Qui ullam quisquam eligendi sit. Sint facere qui nulla quia nulla. Necessitatibus alias exercitationem rerum eos magni omnis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000137', 0.00),
(399, '2024-01-10 15:04:25', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 96.00, NULL, 'paid', 'Quam dolores atque nulla nihil et. Tempore sunt quis voluptas sunt esse. Est est vel ut voluptatum ducimus nam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000137', 0.00),
(400, '2023-08-21 14:52:21', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 75.00, NULL, 'paid', 'Ut inventore sed est rerum eum. Nostrum hic consequatur praesentium. Perferendis sit ipsa veritatis reiciendis. Deleniti molestiae cupiditate velit corrupti quae sed sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000138', 0.00),
(401, '2023-12-26 12:27:12', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 79.00, NULL, 'paid', 'Explicabo voluptates sed nihil sed vel maiores et. Voluptas dolorem deserunt tenetur expedita. Illo explicabo dolorem nihil.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000139', 0.00),
(402, '2024-01-01 00:01:06', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 61.00, NULL, 'paid', 'Cupiditate sit hic vel rerum aut. Earum id tempora animi. Perspiciatis voluptatem voluptas esse debitis pariatur. Odio ex mollitia et et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000140', 0.00),
(403, '2024-01-11 23:11:03', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 80.00, NULL, 'paid', 'Quo voluptatem est qui qui necessitatibus labore totam. Sunt dolores autem ut. Sint explicabo porro a. Autem dolorem magnam quasi dolorem commodi sint modi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000129', 0.00),
(404, '2024-04-09 18:41:31', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 59.00, NULL, 'paid', 'Et enim in iste. Ipsum voluptatem nostrum tempora non et molestiae et porro. Quis ab est est dolorum natus et non. Animi quibusdam omnis quod voluptatem maiores recusandae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000138', 0.00),
(405, '2023-10-24 10:57:15', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 84.00, NULL, 'paid', 'Quos reiciendis cupiditate quia accusantium voluptatibus. Dignissimos vero et adipisci itaque consequuntur est. Aut voluptatum qui commodi quo minima.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000139', 0.00),
(406, '2024-03-21 15:15:36', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 44.00, NULL, 'paid', 'Sit sit vero incidunt voluptatem maxime eum quaerat. Et modi recusandae exercitationem veritatis rem. Velit alias voluptatibus sed modi. Sequi delectus quos tempora sint quidem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000141', 0.00),
(407, '2024-02-18 09:58:44', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 54.00, NULL, 'paid', 'Est ut laudantium voluptatem tempora. Autem tempora possimus est eum laborum est doloribus. Iure ipsa et quam et accusantium perspiciatis fugiat.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000140', 0.00),
(408, '2024-01-24 17:34:37', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 47.00, NULL, 'paid', 'Similique deleniti eveniet dolore sunt omnis soluta. Atque inventore qui repudiandae eveniet tempore eius. Molestias aliquid illum aut assumenda omnis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000130', 0.00),
(409, '2023-09-30 06:56:51', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 58.00, NULL, 'paid', 'Eligendi nulla dolorem ratione ratione sunt et. Aliquam animi aut incidunt. Inventore explicabo explicabo illo quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000131', 0.00),
(410, '2024-05-13 07:48:39', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 65.00, NULL, 'paid', 'Libero quo aut reprehenderit vero molestias rerum aliquam. Natus molestias impedit laudantium nobis eum enim. Et dolorum inventore doloremque in qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000132', 0.00),
(411, '2023-12-16 20:05:06', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 57.00, NULL, 'paid', 'Consequatur perferendis ut porro ut nobis quia. Aliquam nam aut quo assumenda totam id rerum aperiam. Ut nam sint et deleniti.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000133', 0.00),
(412, '2023-11-12 17:12:18', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 87.00, NULL, 'paid', 'Architecto cumque aliquam libero totam. Eos in odit et molestiae nostrum omnis. Tempore ad adipisci velit vel beatae nam molestiae consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000141', 0.00),
(413, '2024-05-23 01:02:40', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 80.00, NULL, 'paid', 'Sit et exercitationem eligendi id recusandae est. Nihil qui distinctio dolores inventore accusamus molestiae. Consequuntur sed totam autem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000142', 0.00),
(414, '2023-08-01 06:32:11', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 30.00, NULL, 'paid', 'Ratione atque qui in animi occaecati. Quia quod dolorem ut qui voluptatum deleniti. Voluptas beatae fugit quae. Molestiae non ut quam optio et ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000143', 0.00),
(415, '2024-01-03 04:45:02', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 35.00, NULL, 'paid', 'Ab delectus tempora totam quis accusantium ducimus fuga et. Ut commodi aliquam repudiandae dolor blanditiis non sed. Eum harum itaque nemo eum. Consequatur quisquam occaecati maiores voluptatem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000142', 0.00),
(416, '2024-01-24 07:42:04', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 65.00, NULL, 'paid', 'Consequatur incidunt veritatis sed aut. Rerum voluptas consequatur voluptates. Expedita placeat a voluptas eligendi in cum est veritatis. Reprehenderit eius enim cupiditate accusamus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000143', 0.00),
(417, '2023-06-22 04:22:14', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 44.00, NULL, 'paid', 'Eveniet quis consequatur est omnis aliquam numquam. Rerum nemo voluptatibus ullam quia aut illum quidem aliquid. Adipisci autem beatae ex. Neque error dolorem magni sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000144', 0.00),
(418, '2023-07-09 20:43:54', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 74.00, NULL, 'paid', 'Qui explicabo dolorum et numquam. Sed ea amet consectetur voluptas. Ipsam nulla repudiandae deleniti. Illum id et quia quisquam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 42, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000144', 0.00),
(419, '2024-03-23 14:14:44', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 57.00, NULL, 'paid', 'Asperiores minima omnis quia suscipit magnam. Commodi rerum exercitationem nihil incidunt temporibus. Exercitationem vitae aut non facilis soluta dolores velit. Repellat et totam delectus tenetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000134', 0.00),
(420, '2024-04-05 14:58:43', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 48.00, NULL, 'paid', 'Saepe aut est deleniti. Quisquam sed repellendus saepe. Eveniet ad nam perferendis perspiciatis molestiae. Commodi voluptas omnis molestiae enim.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000145', 0.00),
(421, '2023-06-27 19:49:29', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 41.00, NULL, 'paid', 'Ex consequuntur fugiat autem repudiandae. Iusto dolores incidunt voluptas molestiae. Aliquid occaecati et pariatur fuga. Et quibusdam repudiandae vel nesciunt quo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 20, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000135', 0.00),
(422, '2024-01-11 15:57:54', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 40.00, NULL, 'paid', 'Nulla fugiat accusantium nemo. Veritatis animi ipsum culpa voluptatum. Et eligendi aut ullam ut et rerum. Asperiores dolorem consequatur consequatur ex.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000146', 0.00),
(423, '2023-12-19 19:31:47', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 35.00, NULL, 'paid', 'Eaque dicta nulla quo eos. Fuga aperiam illum molestiae hic incidunt. Explicabo laboriosam consectetur illo similique aut enim ut. Laudantium voluptatem ullam sit rem id.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000136', 0.00),
(424, '2023-08-11 16:15:11', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 98.00, NULL, 'paid', 'Eum quisquam eum quas sapiente ipsa et. Unde atque dolor eum nulla. Incidunt quod minus molestiae molestiae nam. Sit corrupti repudiandae voluptate omnis ut quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000147', 0.00),
(425, '2023-09-01 05:47:21', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 45.00, NULL, 'paid', 'Ipsum molestiae nesciunt officia voluptas omnis. Est quam repudiandae consequuntur corporis aut. Veritatis rerum quaerat sit incidunt harum qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000137', 0.00),
(426, '2023-06-23 16:20:26', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 74.00, NULL, 'paid', 'Ducimus nulla et atque consequatur. Rerum omnis dolorem odit dolores corporis nihil aspernatur. Rerum iure iusto itaque dolor voluptas dolorum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000145', 0.00),
(427, '2023-12-08 17:55:53', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 74.00, NULL, 'paid', 'Voluptate sunt est vel inventore. Beatae nemo et tempora nihil perspiciatis porro. Voluptatem eaque corrupti doloribus ducimus. Est est atque quis expedita dolor assumenda iste.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000146', 0.00),
(428, '2023-10-29 20:56:18', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 49.00, NULL, 'paid', 'Cumque placeat et facilis voluptatem beatae ab et. Dolor sunt sunt at modi. Ut sunt autem quia voluptas. Quo aut alias eaque itaque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000138', 0.00),
(429, '2023-12-04 17:57:13', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 77.00, NULL, 'paid', 'Rerum earum aut voluptatem ea. Molestiae quis deleniti voluptatem similique fugiat. Laborum sed saepe sit. Et voluptatem beatae excepturi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000147', 0.00),
(430, '2023-07-25 02:51:54', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 65.00, NULL, 'paid', 'Nisi ut incidunt amet eius. Quo aspernatur provident provident laboriosam nisi. Est quaerat quaerat nesciunt ut aperiam similique. Atque illo libero quia et mollitia eos corrupti.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000148', 0.00),
(431, '2024-01-31 08:33:56', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 96.00, NULL, 'paid', 'Quas fuga dolores amet quo. Natus quae animi tempora. Ad ut numquam ut ut sunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000139', 0.00),
(432, '2024-05-25 01:14:01', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 67.00, NULL, 'paid', 'Fugit ut quaerat eum. Ut fuga dicta neque modi cupiditate qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000149', 0.00),
(433, '2023-12-22 19:20:21', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 62.00, NULL, 'paid', 'Est aut ut nulla aut fugit ut et. Qui quia sunt iure itaque. Et dolorem itaque at consequatur sunt nihil molestiae. Molestias est repudiandae possimus et adipisci magnam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000150', 0.00),
(434, '2024-01-07 04:22:17', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 47.00, NULL, 'paid', 'Doloribus consequuntur velit assumenda eum. Vel mollitia omnis qui est unde maxime vel. Quam qui laborum ut magnam beatae non. Cum enim a blanditiis magni velit. Qui vero soluta pariatur cupiditate.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000151', 0.00),
(435, '2023-12-20 11:13:02', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 99.00, NULL, 'paid', 'Rem dolorem libero eum amet. Consequatur rem necessitatibus saepe mollitia omnis facilis aut. Consequatur soluta est cumque vitae. Libero eveniet blanditiis magnam laborum iste aperiam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000152', 0.00),
(436, '2024-03-17 04:00:43', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 61.00, NULL, 'paid', 'Id et ut enim pariatur ipsa qui occaecati. Ex sit facilis reprehenderit rerum fugit non. Rerum et commodi delectus voluptatum perspiciatis velit modi voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000153', 0.00),
(437, '2024-05-28 09:23:15', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 73.00, NULL, 'paid', 'Ipsam et ad et et ut numquam quia. Qui et quia id eos. Exercitationem magni libero ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000154', 0.00),
(438, '2023-10-09 05:08:46', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 64.00, NULL, 'paid', 'Id explicabo mollitia voluptates at iusto aliquid. Est facere nostrum autem et ullam. Fugiat consectetur eum quae in rerum architecto praesentium. Molestiae ea et cupiditate hic ea veritatis sunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000148', 0.00),
(439, '2023-09-05 17:59:52', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 37.00, NULL, 'paid', 'Unde incidunt necessitatibus quo eligendi voluptatum sapiente. Et harum corrupti sed recusandae eligendi aut velit. Deserunt harum totam in non.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000149', 0.00),
(440, '2023-06-14 18:11:05', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 39.00, NULL, 'paid', 'Nulla nam hic nihil ad. Voluptas quia ipsam minima nulla rerum. Esse saepe vero magnam ullam est dolore quo. Et et consequatur tempore omnis dignissimos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000150', 0.00),
(441, '2023-07-20 22:10:55', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 32.00, NULL, 'paid', 'Vero deleniti voluptatem enim dolores. Ut aut nulla quo voluptatum. Sed vero sit aut. Et blanditiis vitae sed autem quisquam beatae adipisci.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000155', 0.00),
(442, '2024-04-25 16:14:04', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 90.00, NULL, 'paid', 'Vel iusto modi ut ad dolor autem. At culpa eaque repellendus aliquid voluptates enim. Iure facilis voluptas voluptas natus culpa ad nam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 34, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000151', 0.00),
(443, '2023-11-13 18:45:06', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 86.00, NULL, 'paid', 'Natus est quia eum tempora saepe eum. Dolorum rerum quas quos at sint qui est. Laudantium laboriosam ducimus dignissimos explicabo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000152', 0.00),
(444, '2024-05-19 12:47:45', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 62.00, NULL, 'paid', 'Sunt ipsa velit aut hic. Aliquam neque sunt dolor iste cumque. Enim cum minima consectetur perferendis nesciunt ducimus. Autem officia aut quis aut eos asperiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000140', 0.00),
(445, '2023-12-19 10:58:42', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 62.00, NULL, 'paid', 'Odio nulla perferendis incidunt et nihil porro non. Id ipsum harum sed quaerat ab. Qui ut totam perferendis vitae eos nesciunt labore eos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000153', 0.00),
(446, '2023-12-31 23:57:00', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 33.00, NULL, 'paid', 'Delectus voluptatem et quia ea consectetur eos voluptates. Nobis ipsa explicabo quis laudantium consectetur dolores officiis. Id mollitia exercitationem nisi exercitationem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000141', 0.00),
(447, '2023-06-26 16:27:08', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 61.00, NULL, 'paid', 'Dolor sed et ipsum. Voluptas occaecati non asperiores dignissimos id. Tenetur dolores voluptas excepturi reprehenderit. Autem quasi omnis id pariatur cum saepe.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000156', 0.00),
(448, '2024-01-25 07:02:02', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 90.00, NULL, 'paid', 'Veniam temporibus eos commodi in repellendus. Nemo ut magnam debitis voluptas reiciendis laboriosam ipsa. Voluptatem quasi soluta voluptatem assumenda repellat possimus nesciunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000142', 0.00),
(449, '2024-01-08 23:21:21', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 36.00, NULL, 'paid', 'Ea corrupti omnis aut assumenda a vel. Molestias voluptates necessitatibus qui dignissimos. Porro voluptatem dolorem ut sed hic.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000154', 0.00),
(450, '2024-03-30 11:26:40', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 97.00, NULL, 'paid', 'Aperiam fuga quia quaerat dolores quam numquam voluptas aliquid. Illum ipsam architecto deleniti recusandae dolorum. Tempora similique optio impedit facere. Rem iusto veniam cupiditate molestiae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000155', 0.00),
(451, '2024-01-30 03:43:13', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 79.00, NULL, 'paid', 'Sed excepturi hic et ab voluptatibus. Et vero eligendi rem ut. Reiciendis tenetur atque molestias explicabo labore.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000156', 0.00),
(452, '2023-06-14 11:07:15', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 74.00, NULL, 'paid', 'Repudiandae atque quis pariatur molestias dolorem. Dolor deleniti quia in est sequi saepe in occaecati. Incidunt natus ut modi et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 34, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000157', 0.00),
(453, '2023-06-28 05:10:23', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 37.00, NULL, 'paid', 'Nobis illum et voluptas dolorum ullam hic. Ut molestiae voluptas eveniet debitis nulla consequatur eos. Dolores omnis enim voluptate ut occaecati aut eveniet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000143', 0.00),
(454, '2024-05-16 08:00:14', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 85.00, NULL, 'paid', 'Vitae quo qui dolorum qui nemo dolores illo. Officiis quas et illo deleniti ex. Sint odio quis in atque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000144', 0.00),
(455, '2024-05-30 04:11:24', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 85.00, NULL, 'paid', 'Rerum quis labore ipsum earum qui ea cumque. Est omnis aut velit quos. Velit praesentium asperiores ex sequi ut veritatis. Consequatur architecto sit voluptates eveniet sed et ratione.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000157', 0.00),
(456, '2023-08-30 17:50:32', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 49.00, NULL, 'paid', 'Quis veritatis corporis repudiandae temporibus temporibus. Quas ipsa ex est qui dignissimos. Harum tempore quasi ullam fugit voluptas aut nesciunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 20, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000145', 0.00),
(457, '2024-02-01 18:57:19', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 88.00, NULL, 'paid', 'Libero veniam at explicabo. Tenetur modi aut blanditiis occaecati. Vitae dicta aut magni facilis deserunt sed tempora.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000158', 0.00),
(458, '2024-01-04 23:16:34', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 74.00, NULL, 'paid', 'Ex est nemo nulla asperiores. Voluptatem ut deleniti velit et sit odio id. Culpa dolor sit aut sunt sequi consequatur aut. Facere qui ex voluptatibus et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000159', 0.00),
(459, '2023-11-10 19:34:25', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 34.00, NULL, 'paid', 'Dicta rem inventore nihil. Sequi sequi qui quia doloremque. Molestiae deserunt aut voluptatem hic.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000160', 0.00),
(460, '2023-06-17 14:17:35', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 47.00, NULL, 'paid', 'Voluptate fugiat ut sunt architecto. Qui sit magnam fugit fuga ipsam cupiditate. Tempora culpa quia doloribus ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000146', 0.00),
(461, '2023-10-08 09:29:28', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 47.00, NULL, 'paid', 'Id enim facilis natus et culpa mollitia est. Fugit nostrum veniam necessitatibus est provident. Veritatis nihil doloribus aut impedit excepturi. Nisi nostrum in labore dignissimos sed minima.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000158', 0.00),
(462, '2024-01-29 14:30:43', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 56.00, NULL, 'paid', 'Asperiores nam itaque consequatur sit vero itaque et veritatis. Laborum error porro qui et praesentium. Ipsa ut aut est nulla. Necessitatibus id eos sunt. Sit ex est in minima est aspernatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000147', 0.00),
(463, '2023-09-13 03:31:42', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 72.00, NULL, 'paid', 'Et veritatis commodi veritatis placeat. Et iure iste voluptatibus hic expedita aut consequatur. Qui aliquid qui corporis saepe.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000159', 0.00),
(464, '2024-03-23 22:03:55', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 83.00, NULL, 'paid', 'Expedita dolor error in et aspernatur inventore animi accusantium. Autem voluptas corporis id pariatur quos dolor et. Ut voluptatibus et nemo quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 20, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000148', 0.00),
(465, '2023-08-25 04:13:10', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 47.00, NULL, 'paid', 'Sint expedita error et maiores voluptas. Neque mollitia sit excepturi eligendi. Dolores expedita perferendis deleniti ullam aperiam dolorem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000149', 0.00),
(466, '2023-08-08 19:31:36', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 93.00, NULL, 'paid', 'Totam accusantium aut sed nisi magnam voluptas. Alias quis voluptatem qui corporis. Voluptas aut illo similique vitae cumque est accusantium.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000161', 0.00),
(467, '2023-10-17 06:06:13', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 45.00, NULL, 'paid', 'Numquam molestiae accusamus voluptatum est molestiae. Quis modi eaque facilis vitae. Molestias et quis beatae distinctio dolorem itaque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000162', 0.00),
(468, '2023-12-01 01:48:59', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 93.00, NULL, 'paid', 'Sed accusantium ut et culpa occaecati corrupti. Sunt doloribus vitae distinctio animi accusantium dolor. Dolor libero quam voluptas assumenda. Error consequuntur provident quisquam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000150', 0.00),
(469, '2023-06-19 09:08:12', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 34.00, NULL, 'paid', 'Ducimus et similique doloribus veniam pariatur nihil officia. Nobis et consequatur deserunt voluptas libero. Praesentium sunt voluptates voluptatum rerum sit. Rerum dolor ut quis porro magnam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000163', 0.00),
(470, '2024-02-03 04:47:29', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 97.00, NULL, 'paid', 'At velit iste reprehenderit eos officiis non. Et expedita et eos sed voluptatem saepe tempore. Saepe qui libero pariatur voluptatem enim.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 40, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000160', 0.00),
(471, '2024-03-30 07:08:27', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 65.00, NULL, 'paid', 'Omnis sed incidunt nisi veritatis. Numquam aut quis sapiente perferendis. Maxime exercitationem quia enim et sunt non quasi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000164', 0.00),
(472, '2023-06-12 04:12:56', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 70.00, NULL, 'paid', 'In pariatur vel vel aut eius aliquam. Unde autem facere omnis ea totam inventore qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 45, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000161', 0.00),
(473, '2024-06-03 04:16:01', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 93.00, NULL, 'paid', 'Culpa enim quia fuga odio placeat natus. Ea eligendi laborum qui dolorum earum animi. Odit et sunt repellat. Tempora et aliquam asperiores hic corrupti molestiae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000165', 0.00),
(474, '2024-05-21 23:51:22', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 61.00, NULL, 'paid', 'In hic voluptatem aut eligendi. Dolores reiciendis similique quia voluptatem et. Exercitationem esse et officia mollitia beatae omnis ducimus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 19, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000151', 0.00),
(475, '2023-09-07 01:12:57', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 80.00, NULL, 'paid', 'Debitis earum sit suscipit est consectetur inventore. Temporibus corrupti itaque consequatur eos vel eius voluptas. Nostrum sequi et repudiandae itaque aut recusandae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000152', 0.00),
(476, '2024-05-20 05:21:23', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 95.00, NULL, 'paid', 'Porro est temporibus officia unde et consequuntur omnis. Ab et autem sit. Ratione nam sit voluptate sint fuga.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000166', 0.00),
(477, '2024-03-10 03:29:13', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 84.00, NULL, 'paid', 'Minima voluptas quam quia et molestiae quisquam. Quis corrupti odio dicta. Velit ea in molestiae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000167', 0.00),
(478, '2023-11-06 00:44:02', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 72.00, NULL, 'paid', 'Quos odit optio velit rerum. Cumque voluptatem aperiam id laudantium tempora. Beatae quidem in labore aliquid saepe distinctio. Qui et omnis et optio laboriosam eos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000168', 0.00),
(479, '2024-02-22 20:44:19', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 30.00, NULL, 'paid', 'Eos quos modi cum est. Non vel incidunt eaque porro aspernatur sint. Accusamus aliquid et ut id at fugit. Ipsa suscipit numquam nihil quidem debitis dolorum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 32, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000162', 0.00),
(480, '2023-08-27 01:42:30', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 63.00, NULL, 'paid', 'Dolor tempore error ducimus nihil quos vel. Rerum ut ut explicabo ducimus. Quam quo magnam repellendus accusamus maiores. Porro sunt fugiat harum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000153', 0.00),
(481, '2023-06-14 23:00:14', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 66.00, NULL, 'paid', 'A magnam ut exercitationem. Veniam cum minus dolorem a. Quia consequatur a est inventore soluta. Voluptatum sapiente veritatis accusantium aliquid corporis eum maxime.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 31, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000163', 0.00),
(482, '2023-08-06 13:20:57', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 43.00, NULL, 'paid', 'Repellendus dolores dolor est repellat sit. Qui odit assumenda non voluptate aut est praesentium. Voluptatem id omnis qui ipsum aut. Cum neque ratione quia optio hic eos laudantium ab.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000154', 0.00),
(483, '2023-08-16 21:18:44', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 100.00, NULL, 'paid', 'Vel dolorem ea distinctio. Repellendus ex atque explicabo et nostrum similique quia. Architecto maxime dolore iusto aut. Ipsum corporis ullam sint sit. Voluptas nobis rem amet eveniet et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000155', 0.00),
(484, '2024-04-23 18:37:00', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 41.00, NULL, 'paid', 'Tenetur non nulla nostrum aliquid. Quod occaecati voluptas voluptate voluptas. Doloremque voluptatem debitis quas nobis sunt sequi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 42, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000164', 0.00),
(485, '2024-04-20 04:13:34', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 79.00, NULL, 'paid', 'Cumque quis sunt hic reiciendis. Accusantium fuga illo impedit. Voluptas aut similique voluptatem enim eos suscipit officiis. Est at recusandae quis repellendus autem dolorem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000156', 0.00),
(486, '2023-06-27 07:21:38', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 83.00, NULL, 'paid', 'Quae illo sint consectetur est quisquam et. Repellendus pariatur facilis sunt quas sunt voluptatem. Quibusdam quibusdam rerum laboriosam autem sunt. Adipisci placeat atque nihil qui commodi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000165', 0.00),
(487, '2024-02-02 21:42:20', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 88.00, NULL, 'paid', 'Odit quia quo id atque praesentium. Numquam quis ipsam dolores quis omnis quo non. Et ducimus maxime aut ex eos minus quos sit. Ratione modi iste nulla libero praesentium sunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000166', 0.00),
(488, '2024-05-31 09:39:47', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 55.00, NULL, 'paid', 'Aut numquam quod perferendis doloremque sint. Exercitationem voluptates amet molestiae velit sunt non vel. Dolores accusamus temporibus consequatur temporibus harum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 20, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000157', 0.00),
(489, '2023-06-26 12:21:09', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 30.00, NULL, 'paid', 'Blanditiis deleniti laborum quidem quia. At saepe aut quos eveniet magnam placeat. Inventore est perferendis quia at nam et. Sapiente consequuntur et omnis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000169', 0.00),
(490, '2024-04-12 19:52:23', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 73.00, NULL, 'paid', 'Ullam quia quia ut necessitatibus laboriosam et. Reprehenderit voluptatem omnis ut nihil atque. Iure necessitatibus eligendi incidunt ipsam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000170', 0.00),
(491, '2024-03-29 19:03:00', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 43.00, NULL, 'paid', 'Et ut incidunt beatae. Maiores aspernatur cupiditate debitis doloribus repudiandae alias. Natus dolorem consequatur repellendus dolor ea quae iure.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000167', 0.00),
(492, '2024-04-24 21:10:13', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 49.00, NULL, 'paid', 'Quia et magnam maiores molestiae. Minus voluptatem deleniti consequatur quas eveniet. Officiis ut nemo reiciendis laudantium deleniti officiis ipsum iste.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000171', 0.00),
(493, '2023-09-28 20:39:08', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 32.00, NULL, 'paid', 'Sint nemo sed sunt dolores quam ducimus. Voluptatem accusantium culpa libero. Esse nisi illo et aut corporis velit velit quia. Ex aut ex deserunt in nihil harum. Maxime animi ut tempora aut animi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 20, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000158', 0.00),
(494, '2023-08-26 10:27:51', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 88.00, NULL, 'paid', 'Totam optio qui aut magni. Deleniti laborum consequuntur doloribus. Aliquid tenetur commodi inventore.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000159', 0.00),
(495, '2023-10-26 23:55:29', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 65.00, NULL, 'paid', 'Ut sit autem veniam amet voluptatem. Minus laboriosam sit quam harum assumenda enim dolor. Perferendis quis ipsa accusamus deleniti asperiores sequi quo aspernatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 24, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000160', 0.00),
(496, '2023-06-29 22:40:25', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 65.00, NULL, 'paid', 'Fugit quia saepe voluptates et consectetur enim. Soluta soluta repellat inventore ea facere qui in. Fuga quos enim minima sint et eos.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000168', 0.00),
(497, '2023-06-25 03:21:44', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 85.00, NULL, 'paid', 'Ipsam nihil aut ut omnis qui. Et iste provident praesentium et et. Necessitatibus alias voluptas id.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000172', 0.00),
(498, '2023-10-13 11:44:45', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 80.00, NULL, 'paid', 'Libero fugit aut laudantium vel perferendis voluptatem dolorum. Qui voluptatibus soluta qui. Repellendus ut distinctio inventore in fugit. Dolorem exercitationem sint itaque dolores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000161', 0.00),
(499, '2024-02-22 02:07:08', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 52.00, NULL, 'paid', 'Eos corrupti rerum et voluptate qui consequuntur ut. Ullam rem voluptates et at. Exercitationem praesentium nesciunt eaque accusamus. Veniam sint aperiam voluptatum eveniet sit qui quidem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000173', 0.00),
(500, '2023-08-05 08:52:46', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 44.00, NULL, 'paid', 'Et qui eum in dolorum. Consequatur eveniet qui necessitatibus quae atque odit distinctio. Aut consectetur et sed cupiditate.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000174', 0.00),
(501, '2024-06-08 05:47:38', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 75.00, NULL, 'paid', 'Et maxime et velit. Ut ex neque possimus possimus eius ut quos. Ex rerum rem unde delectus in. Aspernatur atque eius error sit assumenda exercitationem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000169', 0.00),
(502, '2024-06-08 08:06:19', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 72.00, NULL, 'paid', 'Voluptatem voluptates saepe non. Et esse nihil vero quae qui id. Libero est est ratione atque. Omnis qui omnis et dolores. Dolor officia sit alias. Consectetur quos omnis molestiae non.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000175', 0.00),
(503, '2024-06-07 19:53:00', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 62.00, NULL, 'paid', 'Alias qui commodi alias vero vero. Qui libero magnam tempore. Rerum autem aut nobis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000162', 0.00);
INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`, `payment_link`, `employee_id`, `deleted_at`, `md`, `coupon`, `discount`, `kds_finished`, `id_per_vendor`, `tip`) VALUES
(504, '2024-06-08 12:11:07', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 86.00, NULL, 'paid', 'Aliquam fugit sit autem pariatur. Incidunt eos dolorem et expedita. Est quis voluptas doloremque tempore. Quod voluptatem atque facilis voluptas. Eos nesciunt eaque cupiditate sit qui non.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000170', 0.00),
(505, '2024-06-08 04:23:37', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 89.00, NULL, 'paid', 'Molestias dolores est dolores. Aut dolores error reprehenderit doloribus. Quia explicabo voluptatem ratione ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000171', 0.00),
(506, '2024-06-07 18:35:06', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 72.00, NULL, 'paid', 'Nihil nihil sed eum est ut. Ducimus quae atque dolores qui voluptate sit. Odit non occaecati sint et modi qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000176', 0.00),
(507, '2024-06-07 21:38:36', '2024-06-08 16:09:35', NULL, NULL, 2, NULL, 0.00, 56.00, NULL, 'paid', 'Omnis rerum enim et ipsum. Necessitatibus porro voluptas officia est. Quod consequatur neque tempora voluptas libero vero illum. Maiores qui vel saepe et. Fugiat quis dolor inventore ratione quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:35', '', NULL, 0.00, 0, '000163', 0.00),
(508, '2024-06-07 21:29:38', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 66.00, NULL, 'paid', 'Cumque repellat ducimus qui odit magni labore ut est. Maiores dolores quia et pariatur beatae exercitationem. Excepturi distinctio autem repellat. Numquam asperiores alias eius est commodi nemo aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000164', 0.00),
(509, '2024-06-08 12:48:33', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 70.00, NULL, 'paid', 'Possimus at eos accusamus et dolores. Ducimus perferendis quis laboriosam. Nihil incidunt deserunt omnis quibusdam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000165', 0.00),
(510, '2024-06-07 19:01:40', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 89.00, NULL, 'paid', 'Qui ipsum ad excepturi atque veniam sapiente maxime. Neque ut adipisci quia quas repudiandae pariatur. Possimus sapiente minus temporibus et vero.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000172', 0.00),
(511, '2024-06-07 16:39:50', '2024-06-08 16:09:31', NULL, NULL, 1, NULL, 0.00, 55.00, NULL, 'paid', 'Ipsum soluta modi aut totam. Culpa dolorem quod aperiam est id unde. Ut blanditiis aut dolores et. Illo quam officia rerum minima ad sequi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, '2024-06-08 16:09:31', '', NULL, 0.00, 0, '000177', 0.00),
(512, '2024-06-07 18:01:24', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 42.00, NULL, 'paid', 'Eligendi velit sed qui quis ut molestiae. Cupiditate consectetur nihil cum et consequatur incidunt incidunt. Ipsam in voluptate nisi eveniet et tenetur voluptas sit. Odit amet est rerum impedit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000173', 0.00),
(513, '2024-06-07 20:39:50', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 95.00, NULL, 'paid', 'Mollitia ea possimus consequatur aliquam quibusdam. Labore omnis culpa voluptatem commodi enim est. Aut et ipsam atque ut voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000178', 0.00),
(514, '2024-06-08 04:47:27', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 73.00, NULL, 'paid', 'Eligendi dolorem inventore facilis ipsa. Unde voluptatem quo sequi iusto magnam aut aut. Molestias iusto repellat provident ut non quo eum exercitationem. Quia sunt laborum dolor quod quibusdam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000166', 0.00),
(515, '2024-06-08 06:49:11', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 39.00, NULL, 'paid', 'Aliquid ab delectus atque enim vel. Atque numquam quas deserunt dolor ad. Iure eveniet molestias nobis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000174', 0.00),
(516, '2024-06-08 03:48:45', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 64.00, NULL, 'paid', 'Eos nobis numquam quasi id repellendus placeat necessitatibus. Voluptate et facilis error in harum odio. Quod qui id accusamus aut vero repellat. Repellendus expedita velit enim ut perferendis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000167', 0.00),
(517, '2024-06-07 20:52:16', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 72.00, NULL, 'paid', 'Et sapiente id alias quos aut reiciendis. Iste aliquid beatae quae ipsa. Voluptas expedita sint minus assumenda iusto maxime aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000175', 0.00),
(518, '2024-06-07 18:36:12', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 33.00, NULL, 'paid', 'A qui rerum itaque est. Dolorem facere esse nostrum. Voluptatum voluptatem pariatur temporibus sequi magnam sequi. Aut maxime delectus sed.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000168', 0.00),
(519, '2024-06-08 03:29:58', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 88.00, NULL, 'paid', 'Commodi vel eius qui laborum. Mollitia est illum ab veniam est. Expedita maxime aut placeat facilis sint libero.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000179', 0.00),
(520, '2024-06-08 02:57:47', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 89.00, NULL, 'paid', 'Natus quae quibusdam ex aut. Vitae voluptas ea inventore amet eum. Velit sed non omnis aperiam molestias quia. Et molestiae voluptas corrupti ut. Soluta deserunt quia cumque quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000180', 0.00),
(521, '2024-06-08 15:50:33', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 75.00, NULL, 'paid', 'Necessitatibus unde perferendis veritatis delectus repudiandae incidunt. Eum et ipsum et assumenda perspiciatis. Doloribus odit quis reiciendis debitis qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000181', 0.00),
(522, '2024-06-08 07:41:23', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 53.00, NULL, 'paid', 'Beatae dolore eius et voluptates est quia. Inventore ut minus aut nulla omnis aliquam. Ut perspiciatis accusamus vitae. Quo sit dolorem corporis occaecati odit quo.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 40, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000176', 0.00),
(523, '2024-06-07 19:34:52', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 42.00, NULL, 'paid', 'Deleniti ut ex ipsum et quis et est. Soluta deserunt ducimus cupiditate voluptatum ea quia sequi. Ullam commodi officiis dolor quidem quia magni.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000182', 0.00),
(524, '2024-06-08 10:30:19', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 86.00, NULL, 'paid', 'Veniam atque aut tenetur dicta provident necessitatibus ad. Non totam delectus et eveniet. Deleniti qui commodi aperiam vitae. Vel voluptatem cupiditate voluptatum nam atque sapiente tenetur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000177', 0.00),
(525, '2024-06-07 22:47:57', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 74.00, NULL, 'paid', 'Voluptatem eum sunt labore tempore sint. Odio laborum dolores non hic omnis. Officia corporis enim ad eveniet quaerat unde.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000178', 0.00),
(526, '2024-06-08 05:52:42', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 55.00, NULL, 'paid', 'Ut ea qui cum et nihil non sunt. Nesciunt veniam laudantium impedit et similique nobis quia occaecati. Repellendus quaerat accusantium beatae aut vero magnam architecto.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000183', 0.00),
(527, '2024-06-07 20:03:12', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 57.00, NULL, 'paid', 'Ut illo sit molestiae quia. Iure molestias cumque et ipsa tenetur est rerum. Facilis sit nostrum voluptatum quaerat debitis numquam aut. Quibusdam asperiores similique et aut est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 44, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000179', 0.00),
(528, '2024-06-07 21:07:32', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 80.00, NULL, 'paid', 'Ut exercitationem labore ut pariatur. Amet quia aut modi repellat molestias. Qui ad omnis quia cumque et. Neque iste porro et voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000169', 0.00),
(529, '2024-06-08 06:27:25', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 42.00, NULL, 'paid', 'Voluptates culpa laudantium culpa et. Dolor aspernatur quae alias nesciunt quis molestias quae. Voluptatem eos voluptatum necessitatibus modi illo. Ex odit illo praesentium numquam enim iste.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000180', 0.00),
(530, '2024-06-08 03:00:13', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 48.00, NULL, 'paid', 'Nihil sit ipsum id cupiditate blanditiis. Veniam quis omnis repellat iste architecto ut. Tempore delectus voluptas earum eius vitae. Odio asperiores sequi sit rem qui exercitationem sunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000170', 0.00),
(531, '2024-06-08 04:44:33', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Ut laborum ut ratione qui. Fugit repellendus et excepturi aliquid mollitia. Aut non occaecati facere in ullam id laborum. Quos recusandae in ut cum similique et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 21, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000171', 0.00),
(532, '2024-06-08 07:16:17', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 81.00, NULL, 'paid', 'Nihil voluptatem labore rerum ut velit. Non sint architecto sunt laborum doloremque dolorum quaerat. Vero porro iste et dicta fuga.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000184', 0.00),
(533, '2024-06-07 16:26:31', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 76.00, NULL, 'paid', 'Omnis veritatis est veniam qui. Nesciunt temporibus et et. Animi nihil et quo voluptatem dolore. Sunt distinctio eaque minima laudantium quo ea doloribus enim.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000185', 0.00),
(534, '2024-06-08 15:17:53', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 86.00, NULL, 'paid', 'Aut et est est dolores nostrum atque eum. Dolorem quas officia ut rem earum. Soluta eveniet nulla odio quaerat porro.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000172', 0.00),
(535, '2024-06-08 03:20:04', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 60.00, NULL, 'paid', 'Tenetur voluptates neque totam et est quaerat. Nulla voluptatibus velit molestiae aperiam. Voluptatem molestiae fuga perspiciatis tempora est.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000186', 0.00),
(536, '2024-06-08 13:56:55', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 69.00, NULL, 'paid', 'Eos non est ullam sit et voluptatibus sint. Et cupiditate placeat et quibusdam sint. Vitae qui omnis sunt nesciunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000173', 0.00),
(537, '2024-06-07 17:35:07', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 83.00, NULL, 'paid', 'Quae dolor quasi deleniti dolores sit vel. Asperiores ullam quia qui deleniti voluptas in. Ipsa cupiditate quos ullam eligendi laborum. Eos nisi et reprehenderit minus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000174', 0.00),
(538, '2024-06-08 01:14:49', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 47.00, NULL, 'paid', 'Libero saepe sapiente modi. Laudantium atque sit reiciendis unde nulla in. Amet ut corrupti esse deserunt. Ipsum rerum consequatur voluptatem ea veritatis explicabo itaque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000187', 0.00),
(539, '2024-06-07 21:27:03', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 45.00, NULL, 'paid', 'Veritatis hic doloremque suscipit molestiae omnis amet tempore ipsum. Dolorum natus corporis tenetur rem. Veniam reprehenderit rerum quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 39, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000181', 0.00),
(540, '2024-06-08 12:17:56', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 31.00, NULL, 'paid', 'Dicta ut assumenda et mollitia voluptas qui. Distinctio sit sed quo ipsam et. Deserunt mollitia accusamus nisi quia. Recusandae in possimus pariatur cumque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000175', 0.00),
(541, '2024-06-07 20:24:06', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 99.00, NULL, 'paid', 'Et earum nesciunt aut ipsa dolores corrupti. Quisquam et repellendus ullam velit voluptas excepturi quibusdam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 15, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000188', 0.00),
(542, '2024-06-08 09:42:04', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 36.00, NULL, 'paid', 'Officia eum vero eaque ut repellat voluptatem unde aut. Est voluptas quia sed fugiat quaerat quam distinctio. Et quisquam eum reprehenderit doloremque.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000182', 0.00),
(543, '2024-06-07 20:10:19', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 58.00, NULL, 'paid', 'Cupiditate et est ad animi reprehenderit voluptatem. Maiores dolores et est vel porro sed. Deleniti qui odio et qui a.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000189', 0.00),
(544, '2024-06-08 12:33:26', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 34.00, NULL, 'paid', 'Est beatae ut doloremque quia. Culpa perferendis id enim voluptas aut quasi. Nam eaque beatae modi iusto atque odit at qui. Et repellat perferendis perspiciatis incidunt ratione.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000190', 0.00),
(545, '2024-06-08 04:58:19', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 69.00, NULL, 'paid', 'Occaecati eum porro itaque. Et itaque sed voluptatibus iste. Consequuntur quos temporibus repudiandae aliquid cumque sit quam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000176', 0.00),
(546, '2024-06-08 02:11:41', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Autem numquam omnis fugit dolor veritatis. Quas earum placeat blanditiis ut atque consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000177', 0.00),
(547, '2024-06-07 16:49:58', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 49.00, NULL, 'paid', 'Qui eos illo alias vel doloribus delectus. Qui nostrum facilis a voluptas quo nihil exercitationem assumenda.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000183', 0.00),
(548, '2024-06-07 23:19:10', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 64.00, NULL, 'paid', 'Aut modi laudantium fugiat beatae iure. Cupiditate itaque dicta dolore ratione ut repellat hic necessitatibus. Quia recusandae ut itaque sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000191', 0.00),
(549, '2024-06-08 15:26:22', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 51.00, NULL, 'paid', 'Tenetur pariatur repellendus cupiditate quisquam ipsa sunt qui ipsum. Est veritatis nobis dignissimos unde totam est totam. Id inventore labore voluptatem voluptatem aut suscipit eveniet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000178', 0.00),
(550, '2024-06-07 21:37:16', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 65.00, NULL, 'paid', 'Eius rerum reiciendis sed ab. Dolore rerum voluptas facilis occaecati autem at. Sapiente officiis saepe modi similique quos ut voluptas ipsam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000192', 0.00),
(551, '2024-06-07 19:23:27', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 51.00, NULL, 'paid', 'Quam suscipit explicabo qui eligendi. Quia ducimus rem minus assumenda. Minus blanditiis voluptatibus earum rem recusandae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000193', 0.00),
(552, '2024-06-08 01:59:18', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 70.00, NULL, 'paid', 'At dolorem delectus accusamus quia deserunt placeat sit. Animi ut quis sequi consectetur pariatur libero cum. Et aspernatur ab ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 42, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000184', 0.00),
(553, '2024-06-08 11:58:01', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 48.00, NULL, 'paid', 'Autem repellat numquam aut facilis neque. Ipsam quod consequuntur eaque quos eaque. Aliquam magni qui nisi cum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000194', 0.00),
(554, '2024-06-08 05:21:36', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 43.00, NULL, 'paid', 'Quibusdam ut illum dolore velit. Eos deleniti ex eius dolorem fugiat. Sint dolores sed sunt nisi aut soluta. Aliquam sit dicta nemo est quidem id amet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000185', 0.00),
(555, '2024-06-07 21:33:58', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 44.00, NULL, 'paid', 'Ipsam repudiandae laboriosam vel minima. Et qui ipsa voluptatem atque eligendi. Et et tempore dolores a amet aliquid sint. Non quaerat repudiandae voluptas nihil quod architecto nihil aperiam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000195', 0.00),
(556, '2024-06-07 17:25:16', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 97.00, NULL, 'paid', 'Nemo dolorem est aliquam eos harum. Nihil natus voluptatem occaecati consequatur voluptatem omnis corporis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000196', 0.00),
(557, '2024-06-08 11:18:33', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 55.00, NULL, 'paid', 'Reiciendis dolorem laudantium culpa quis in vel odio. Voluptatem aut error sit asperiores eveniet. Autem ipsa laborum odit in porro dolores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 30, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000179', 0.00),
(558, '2024-06-07 18:03:34', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 66.00, NULL, 'paid', 'Id reprehenderit quia modi dolores. Illum ullam iusto qui cumque. Nulla itaque sunt tempora ut necessitatibus. Et asperiores dolor fugiat qui.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000180', 0.00),
(559, '2024-06-08 07:09:07', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 39.00, NULL, 'paid', 'Fugit facere quis voluptas libero. Et explicabo error veritatis. Quia et corporis harum aperiam qui molestias. Omnis occaecati cum neque et vel totam.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000197', 0.00),
(560, '2024-06-08 06:00:31', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 45.00, NULL, 'paid', 'Maxime consequatur placeat eum ullam sit quia. Omnis facilis culpa nemo officia voluptas rem. Veritatis animi qui deserunt velit esse et odio. Itaque fuga odit impedit eum mollitia soluta voluptatem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 33, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000186', 0.00),
(561, '2024-06-08 10:40:18', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 71.00, NULL, 'paid', 'Autem sed eum perspiciatis eos vel quis quia. Saepe eaque nihil quia. Id saepe consequatur reiciendis et nihil cum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000181', 0.00),
(562, '2024-06-08 03:52:48', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 90.00, NULL, 'paid', 'Harum et soluta optio amet nam inventore. Dignissimos voluptas tempora id quia. Esse qui laudantium ad voluptatibus voluptatibus occaecati.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 2, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000198', 0.00),
(563, '2024-06-08 10:19:06', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 79.00, NULL, 'paid', 'Ad unde beatae ipsam labore facilis velit ex. Et expedita quod laboriosam aperiam. Sit tempora sint aut maxime sunt. Dolor qui aut sit voluptatibus ut dolorum ex.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000182', 0.00),
(564, '2024-06-07 16:35:02', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 97.00, NULL, 'paid', 'Iusto dicta minima nisi. Consequatur corporis dolores incidunt. At non repellat occaecati temporibus et et. Corporis reiciendis neque totam nihil.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 23, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000183', 0.00),
(565, '2024-06-08 03:20:02', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 54.00, NULL, 'paid', 'Doloribus qui qui dolore fugit sed dolore. Rerum veritatis quos voluptatem suscipit rerum earum. Consectetur autem cumque cum excepturi tempore. Dolorum cupiditate quia excepturi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000184', 0.00),
(566, '2024-06-08 14:08:57', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 71.00, NULL, 'paid', 'Doloribus et aperiam et saepe sed. Eveniet nostrum dolor vel magni omnis a nulla. Enim nisi repellat soluta laborum. Ut neque et ut consequuntur et.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000185', 0.00),
(567, '2024-06-07 16:11:28', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 94.00, NULL, 'paid', 'Voluptatibus qui facilis voluptas. Neque qui hic enim aut hic. In velit maxime ut quod. Omnis quibusdam vitae tempore placeat facilis ratione quia.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000199', 0.00),
(568, '2024-06-08 12:03:47', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 84.00, NULL, 'paid', 'Nobis enim omnis sequi est nesciunt. Ea corporis odio quasi commodi. Possimus et eum quia et occaecati.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000186', 0.00),
(569, '2024-06-08 08:06:08', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 36.00, NULL, 'paid', 'Eaque enim molestias qui sunt excepturi modi aut facere. Dolore quia autem minima officiis. Consequatur molestiae ut tenetur ratione debitis occaecati. Accusantium sed libero vel.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000187', 0.00),
(570, '2024-06-08 00:13:39', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 80.00, NULL, 'paid', 'Impedit odit labore enim voluptatem. Accusantium ut dignissimos libero dicta nisi. Illum dolores et accusamus rerum et perferendis ex vel. Ut sint natus officia repellendus et architecto rem.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000187', 0.00),
(571, '2024-06-08 14:29:42', '2024-06-08 16:09:40', NULL, NULL, 3, NULL, 0.00, 38.00, NULL, 'paid', 'Qui qui esse delectus perferendis rerum. Rem excepturi optio explicabo ipsa quibusdam maxime aliquam. Dolor voluptatem dolore enim libero modi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 35, NULL, NULL, '', NULL, '2024-06-08 16:09:40', '', NULL, 0.00, 0, '000188', 0.00),
(572, '2024-06-08 09:37:24', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 57.00, NULL, 'paid', 'Repellendus voluptates porro ab debitis vero. Maiores sapiente dolorem aut assumenda voluptatem sint. Praesentium dolores ut molestias nemo temporibus ab quia. Ratione ut delectus tenetur nisi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000200', 0.00),
(573, '2024-06-08 02:50:43', '2024-06-08 16:09:41', NULL, NULL, 3, NULL, 0.00, 32.00, NULL, 'paid', 'Velit veritatis nemo at similique. A facere deleniti vel harum enim. Sed provident aut nisi nihil nemo. Numquam ex dolorem rerum iusto.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:41', '', NULL, 0.00, 0, '000189', 0.00),
(574, '2024-06-07 21:34:52', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 57.00, NULL, 'paid', 'Ipsum asperiores dolor dolor animi voluptatem totam excepturi. Earum explicabo eum eveniet velit qui non. Aut dolores nam itaque qui veritatis dolores. Cum ad doloremque aliquid consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000201', 0.00),
(575, '2024-06-07 16:43:10', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 80.00, NULL, 'paid', 'Sint quos ratione eos sed veritatis quae doloremque excepturi. At qui molestiae asperiores error ut. Sed soluta doloremque optio. Voluptate odio commodi esse ut ut consequatur.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 18, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000188', 0.00),
(576, '2024-06-07 23:01:44', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 30.00, NULL, 'paid', 'Libero molestiae quo sunt voluptas sint et eligendi laborum. Eum quod minus explicabo rerum. Aut autem nemo tempore necessitatibus doloremque cumque. Quasi aliquam numquam nostrum aliquid aut error.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 27, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000189', 0.00),
(577, '2024-06-08 15:10:17', '2024-06-08 16:09:41', NULL, NULL, 3, NULL, 0.00, 95.00, NULL, 'paid', 'Tempora voluptatibus unde assumenda quis. Nihil deleniti quia similique natus. Fugiat assumenda magnam qui impedit adipisci.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 37, NULL, NULL, '', NULL, '2024-06-08 16:09:41', '', NULL, 0.00, 0, '000190', 0.00),
(578, '2024-06-08 12:41:19', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 33.00, NULL, 'paid', 'Aut repudiandae dicta quia a facilis in impedit. Ut repudiandae necessitatibus illo pariatur consequatur et. Ipsam modi harum et et sunt.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000202', 0.00),
(579, '2024-06-07 18:35:48', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 85.00, NULL, 'paid', 'Nostrum facere ut est nemo esse pariatur enim nihil. Non qui officia ullam qui unde. Vel autem soluta maxime odit ut. Nesciunt accusamus non expedita.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000190', 0.00),
(580, '2024-06-08 11:18:09', '2024-06-08 16:09:41', NULL, NULL, 3, NULL, 0.00, 69.00, NULL, 'paid', 'Eum et minima magni earum est repudiandae. Dolor aut pariatur id animi ab sit. Quod tempora culpa necessitatibus excepturi et laborum voluptatem molestiae.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 43, NULL, NULL, '', NULL, '2024-06-08 16:09:41', '', NULL, 0.00, 0, '000191', 0.00),
(581, '2024-06-07 22:39:52', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 59.00, NULL, 'paid', 'Provident sunt quia debitis odio autem. Rerum quia minus impedit praesentium eveniet ad. Ullam nihil quibusdam excepturi doloremque. Modi quam libero accusamus quia corrupti.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 17, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000191', 0.00),
(582, '2024-06-08 13:05:10', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 70.00, NULL, 'paid', 'Beatae rerum repudiandae vel non voluptatem nihil. Ut debitis sed et. Et nobis tempore voluptatum iste soluta quis libero.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 28, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000192', 0.00),
(583, '2024-06-08 11:51:04', '2024-06-08 16:09:41', NULL, NULL, 3, NULL, 0.00, 41.00, NULL, 'paid', 'Voluptatem dolores ipsam non quisquam. Ut ut ut voluptatem possimus. Suscipit quidem ipsa ea nam est vitae. Sed hic exercitationem ipsa est deserunt maiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 36, NULL, NULL, '', NULL, '2024-06-08 16:09:41', '', NULL, 0.00, 0, '000192', 0.00),
(584, '2024-06-08 09:31:22', '2024-06-08 16:09:41', NULL, NULL, 3, NULL, 0.00, 71.00, NULL, 'paid', 'Consequatur aliquam nesciunt velit praesentium. Ut placeat omnis vel aut. Quasi quia dolores et beatae molestias ab ut necessitatibus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 41, NULL, NULL, '', NULL, '2024-06-08 16:09:41', '', NULL, 0.00, 0, '000193', 0.00),
(585, '2024-06-07 17:32:59', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 38.00, NULL, 'paid', 'Qui in labore reprehenderit nemo quo libero explicabo. Fuga nihil consequuntur id. Necessitatibus unde ea modi.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 26, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000193', 0.00),
(586, '2024-06-08 04:56:21', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 68.00, NULL, 'paid', 'Fuga sequi id aspernatur. Placeat quia sunt at asperiores.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 16, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000194', 0.00),
(587, '2024-06-08 07:46:56', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 45.00, NULL, 'paid', 'Ducimus dolorum eum voluptates. Maiores illum est eligendi quo id. Sed consectetur quis culpa est quae rerum rerum.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 9, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000203', 0.00),
(588, '2024-06-07 18:45:29', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 67.00, NULL, 'paid', 'Vel eos ullam ea adipisci. Architecto molestiae sit modi et blanditiis mollitia qui. Rerum occaecati voluptates harum non. Velit vitae est exercitationem sed est eos similique accusamus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 14, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000204', 0.00),
(589, '2024-06-08 13:16:40', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 83.00, NULL, 'paid', 'Ut id similique ipsum est harum et. Et dolores voluptatibus optio pariatur quia omnis repellendus. Sint temporibus doloremque rerum ut nulla ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000205', 0.00),
(590, '2024-06-08 13:58:55', '2024-06-08 16:09:41', NULL, NULL, 3, NULL, 0.00, 92.00, NULL, 'paid', 'Quos enim voluptas omnis aperiam nemo similique doloremque. Voluptatem corrupti est autem hic. Voluptatibus ut nihil modi alias odio vitae aut itaque. Quia sit nemo ipsa vel.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:41', '', NULL, 0.00, 0, '000194', 0.00),
(591, '2024-06-08 10:44:46', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 35.00, NULL, 'paid', 'Sit deleniti voluptas non totam omnis. Provident consequuntur est nulla dolorum voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 29, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000195', 0.00),
(592, '2024-06-08 05:45:18', '2024-06-08 16:09:41', NULL, NULL, 3, NULL, 0.00, 75.00, NULL, 'paid', 'Distinctio blanditiis quia et voluptates quis. Excepturi et sit labore vero. Ipsa dolores asperiores eos tempora quis sit.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:41', '', NULL, 0.00, 0, '000195', 0.00),
(593, '2024-06-08 07:31:50', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 68.00, NULL, 'paid', 'Officiis eaque quidem quae placeat nostrum cumque. Animi id eos inventore. Voluptatem quis expedita saepe dolores at voluptas.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 12, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000206', 0.00),
(594, '2024-06-08 02:26:35', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 39.00, NULL, 'paid', 'Iste consectetur in odit recusandae fugit. Et consequuntur accusamus qui. Corporis accusamus a quam tempora et commodi. Ad voluptatibus exercitationem molestias.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000207', 0.00),
(595, '2024-06-07 17:54:32', '2024-06-08 16:09:41', NULL, NULL, 3, NULL, 0.00, 97.00, NULL, 'paid', 'Est laudantium ipsam saepe nihil. Et possimus ipsa natus ipsam iste odio qui blanditiis. Vel qui similique sit aliquam asperiores et quia veritatis. Est molestiae dolorum dolor cum non.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 38, NULL, NULL, '', NULL, '2024-06-08 16:09:41', '', NULL, 0.00, 0, '000196', 0.00),
(596, '2024-06-07 18:24:08', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 99.00, NULL, 'paid', 'Velit et accusantium sint nihil. Amet sit voluptatibus excepturi nisi autem sint necessitatibus.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 13, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000208', 0.00),
(597, '2024-06-07 20:57:13', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 79.00, NULL, 'paid', 'Et sunt ipsum est et eius. Est dolores repudiandae laborum sint maxime natus quo. Autem harum quidem perspiciatis aut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 10, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000209', 0.00),
(598, '2024-06-07 19:33:09', '2024-06-08 16:09:32', NULL, NULL, 1, NULL, 0.00, 95.00, NULL, 'paid', 'Aut voluptate vero optio vero. Qui nobis sed non quo repudiandae ut. Totam quasi corporis eum odio dolorum. Aut et incidunt maiores est aut eaque omnis.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 11, NULL, NULL, '', NULL, '2024-06-08 16:09:32', '', NULL, 0.00, 0, '000210', 0.00),
(599, '2024-06-08 12:12:52', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 82.00, NULL, 'paid', 'Sint fuga laudantium aut eum iste. Laboriosam illo dicta voluptatem et veniam totam. Consequuntur omnis accusantium quia reprehenderit et ut.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 25, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000196', 0.00),
(600, '2024-06-08 14:48:43', '2024-06-08 16:09:36', NULL, NULL, 2, NULL, 0.00, 44.00, NULL, 'paid', 'Ad aliquid ex asperiores esse sequi nulla. Vel officiis omnis dolor odio eveniet.', NULL, NULL, NULL, 0.00, 0, 0.00, 1, '', 0.00, 0.00, NULL, 22, NULL, NULL, '', NULL, '2024-06-08 16:09:36', '', NULL, 0.00, 0, '000197', 0.00),
(601, '2024-06-08 16:54:27', '2024-08-28 16:58:42', NULL, NULL, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, 10, 241, NULL, NULL, '', NULL, NULL, 'b2f627fff19fda463cb386442eac2b3d', NULL, 0.00, 0, '000002', 0.00),
(602, '2024-06-08 16:56:14', '2024-08-28 16:58:42', NULL, NULL, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, 15, 241, NULL, NULL, '', NULL, NULL, 'c3992e9a68c5ae12bd18488bc579b30d', NULL, 0.00, 0, '000003', 0.00),
(603, '2024-06-09 08:01:42', '2024-08-28 16:58:42', NULL, NULL, 17, NULL, 0.00, 10.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, 15, 1, NULL, NULL, '', NULL, NULL, 'd86ea612dec96096c5e0fcc8dd42ab6d', NULL, 0.00, 0, '000004', 0.00),
(604, '2024-06-09 08:40:20', '2024-08-28 16:58:42', NULL, 1, 17, NULL, 0.00, 15.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, 15, 1, NULL, NULL, '', NULL, NULL, '9cf81d8026a9018052c429cc4e56739b', NULL, 0.00, 0, '000005', 0.00),
(605, '2024-07-06 20:52:10', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 0.00, 'cod', 'paid', '', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, NULL, NULL, NULL, '', NULL, NULL, 'c361bc7b2c033a83d663b8d9fb4be56e', NULL, 0.00, 0, '000006', 0.00),
(606, '2024-07-06 21:18:57', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 6.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '44c4c17332cace2124a1a836d9fc4b6f', NULL, 0.00, 0, '000007', 0.00),
(607, '2024-07-07 11:59:07', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, NULL, 'dc82d632c9fcecb0778afbc7924494a6', NULL, 0.00, 0, '000008', 0.00),
(608, '2024-07-07 12:22:10', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, NULL, '996a7fa078cc36c46d02f9af3bef918b', NULL, 0.00, 0, '000009', 0.00),
(609, '2024-07-07 14:47:26', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, 20, 8, NULL, NULL, '', NULL, NULL, 'd7a728a67d909e714c0774e22cb806f2', NULL, 0.00, 0, '000010', 0.00),
(610, '2024-07-07 14:55:46', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '00ac8ed3b4327bdd4ebbebcb2ba10a00', NULL, 0.00, 0, '000011', 0.00),
(611, '2024-07-07 14:58:49', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '8ebda540cbcc4d7336496819a46a1b68', NULL, 0.00, 0, '000012', 0.00),
(612, '2024-07-07 15:03:57', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, 'f76a89f0cb91bc419542ce9fa43902dc', NULL, 0.00, 0, '000013', 0.00),
(613, '2024-07-08 02:30:45', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 8, NULL, NULL, '', NULL, NULL, 'f29c21d4897f78948b91f03172341b7b', NULL, 0.00, 0, '000014', 0.00),
(614, '2024-07-08 02:43:02', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '851ddf5058cf22df63d3344ad89919cf', NULL, 0.00, 0, '000015', 0.00),
(615, '2024-07-08 02:46:50', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '58d4d1e7b1e97b258c9ed0b37e02d087', NULL, 0.00, 0, '000016', 0.00),
(616, '2024-07-08 02:53:12', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 10.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '7750ca3559e5b8e1f44210283368fc16', NULL, 0.00, 0, '000017', 0.00),
(617, '2024-07-08 03:05:24', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 15.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '5d44ee6f2c3f71b73125876103c8f6c4', NULL, 0.00, 0, '000018', 0.00),
(618, '2024-07-08 03:08:33', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, 'eb6fdc36b281b7d5eabf33396c2683a2', NULL, 0.00, 0, '000019', 0.00),
(619, '2024-07-08 03:17:52', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, 'cdc0d6e63aa8e41c89689f54970bb35f', NULL, 0.00, 0, '000020', 0.00),
(620, '2024-07-08 03:28:08', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, 'b73dfe25b4b8714c029b37a6ad3006fa', NULL, 0.00, 0, '000021', 0.00),
(621, '2024-07-08 03:31:47', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '85fc37b18c57097425b52fc7afbb6969', NULL, 0.00, 0, '000022', 0.00),
(622, '2024-07-08 03:38:40', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '3871bd64012152bfb53fdf04b401193f', NULL, 0.00, 0, '000023', 0.00),
(623, '2024-07-08 03:47:59', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, 'a733fa9b25f33689e2adbe72199f0e62', NULL, 0.00, 0, '000024', 0.00),
(624, '2024-07-08 03:54:10', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '48ab2f9b45957ab574cf005eb8a76760', NULL, 0.00, 0, '000025', 40.50),
(625, '2024-07-08 03:57:25', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '233509073ed3432027d48b1a83f5fbd2', NULL, 0.00, 0, '000026', 0.00),
(626, '2024-07-08 04:01:33', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, NULL, '45645a27c4f1adc8a7a835976064a86d', NULL, 0.00, 0, '000027', 0.00),
(627, '2024-07-08 04:05:54', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, NULL, '185c29dc24325934ee377cfda20e414c', NULL, 0.00, 0, '000028', 0.00),
(628, '2024-07-08 04:21:05', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 11.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 5, NULL, NULL, '', NULL, NULL, '42e77b63637ab381e8be5f8318cc28a2', NULL, 0.00, 0, '000029', 0.00),
(629, '2024-07-08 04:27:31', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '051e4e127b92f5d98d3c79b195f2b291', NULL, 0.00, 0, '000030', 0.00),
(630, '2024-07-08 04:34:14', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '9cc138f8dc04cbf16240daa92d8d50e2', NULL, 0.00, 0, '000031', 100.00),
(631, '2024-07-08 09:03:17', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, 'b7bb35b9c6ca2aee2df08cf09d7016c2', NULL, 0.00, 0, '000032', 0.00),
(632, '2024-07-08 09:23:40', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 30.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, 'abd815286ba1007abfbb8415b83ae2cf', NULL, 0.00, 0, '000033', 0.00),
(633, '2024-07-09 06:47:10', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, '26dd0dbc6e3f4c8043749885523d6a25', NULL, 0.00, 0, '000034', 0.00),
(634, '2024-07-09 06:58:27', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 5.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '6766aa2750c19aad2fa1b32f36ed4aee', NULL, 0.00, 0, '000035', 0.00),
(635, '2024-07-26 13:48:51', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 20.00, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '6a10bbd480e4c5573d8f3af73ae0454b', NULL, 0.00, 0, '000036', 0.00),
(643, '2024-07-28 07:58:37', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 2284.00, NULL, 'paid', '', NULL, NULL, 'cs_test_a185AMD6qPCwIiBIjVSB4Ffe0LNNlM3D8a6ZOqxRckYHQ1ALFlefknbzVv', 0.00, 0, 0.00, 3, '', 0.00, 0.00, 115, 3, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000037', 1010.80),
(646, '2024-08-02 06:37:30', '2024-08-28 16:58:42', NULL, 58, 17, NULL, 0.00, 940.00, NULL, 'paid', '', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000038', 2014.00),
(647, '2024-08-02 07:39:54', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 6000.00, NULL, 'paid', '', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000039', 640.00),
(648, '2024-08-02 07:44:30', '2024-08-28 16:58:42', NULL, 35, 17, NULL, 0.00, 1600.00, NULL, 'paid', '', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000040', 0.00),
(649, '2024-08-18 10:27:58', '2024-08-28 16:58:42', NULL, 59, 17, NULL, 0.00, 56200.00, NULL, 'paid', '', NULL, NULL, NULL, 0.00, 0, 0.00, 3, '', 0.00, 0.00, NULL, 6, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000041', 5660.00),
(652, '2024-08-24 10:25:42', '2024-08-28 16:58:42', NULL, 1, 17, NULL, 0.00, 30000.00, NULL, 'paid', '', NULL, NULL, NULL, 0.85, 254.8725, 15.00, 3, '', 3000.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000042', 0.00),
(653, '2024-08-25 12:51:19', '2024-08-28 16:58:42', NULL, 1, 17, NULL, 0.00, 17000.00, 'visa', 'paid', 'new', NULL, NULL, NULL, 0.83, 140.9755, 15.00, 3, '', 500.00, 0.00, NULL, 6, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000043', 100.00),
(654, '2024-08-27 03:37:55', '2024-08-28 16:58:42', NULL, 1, 17, NULL, 0.00, 25200.00, NULL, 'paid', 'new', NULL, NULL, NULL, 0.83, 217.46, 0.00, 3, '', 1000.00, 0.00, NULL, 6, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000044', 0.00),
(655, '2024-08-27 12:30:56', '2024-08-28 16:58:42', NULL, 1, 17, NULL, 0.00, 27000.00, 'visa', 'paid', 'new', NULL, NULL, NULL, 0.85, 242.25, 0.00, 3, '', 1500.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000045', 3369.55);
INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`, `payment_link`, `employee_id`, `deleted_at`, `md`, `coupon`, `discount`, `kds_finished`, `id_per_vendor`, `tip`) VALUES
(657, '2024-08-28 18:14:58', '2024-08-28 20:44:25', NULL, 35, 17, NULL, 0.00, 17000.00, 'apple_pay', 'paid', 'new', NULL, NULL, NULL, 0.85, 148.75, 0.00, 3, '', 500.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000046', 1000.00),
(658, '2024-08-28 21:24:15', '2024-08-28 22:01:48', NULL, 62, 17, NULL, 0.00, 5000.00, 'apple_pay', 'paid', 'new', NULL, NULL, NULL, 0.85, 46.75, 0.00, 3, '', 500.00, 0.00, NULL, 7, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000047', 550.00),
(659, '2024-08-28 22:13:09', '2024-08-28 22:15:06', NULL, 63, 17, NULL, 0.00, 24000.00, 'apple_pay', 'paid', 'new', NULL, NULL, NULL, 0.85, 204, 0.00, 3, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000048', 3600.00),
(660, '2024-08-29 12:39:26', '2024-08-29 12:59:19', NULL, 64, 17, NULL, 0.00, 17000.00, 'apple_pay', 'paid', 'new', NULL, NULL, NULL, 0.85, 148.75, 0.00, 3, '', 500.00, 0.00, NULL, 7, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000049', 750.00),
(661, '2024-08-29 13:02:49', '2024-08-29 13:02:49', NULL, 64, 17, NULL, 0.00, 13600.00, NULL, 'unpaid', '', NULL, NULL, NULL, 0.85, 115.6, 0.00, 3, '', 0.00, 0.00, NULL, 7, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000050', 0.00),
(662, '2024-08-29 17:20:48', '2024-08-29 17:20:48', NULL, 65, 17, NULL, 0.00, 5000.00, NULL, 'unpaid', '', NULL, NULL, NULL, 0.85, 46.75, 0.00, 3, '', 500.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000051', 0.00),
(663, '2024-08-29 17:21:30', '2024-08-29 17:21:30', NULL, 65, 17, NULL, 0.00, 24000.00, NULL, 'unpaid', '', NULL, NULL, NULL, 0.85, 204, 0.00, 3, '', 0.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000052', 0.00),
(664, '2024-08-29 17:22:58', '2024-08-29 17:22:58', NULL, 35, 17, NULL, 0.00, 5000.00, NULL, 'unpaid', '', NULL, NULL, NULL, 0.85, 46.75, 0.00, 3, '', 500.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000053', 0.00),
(665, '2024-08-29 17:25:15', '2024-08-29 17:25:15', NULL, 66, 17, NULL, 0.00, 19600.00, NULL, 'unpaid', '', NULL, NULL, NULL, 0.85, 171.7, 0.00, 3, '', 600.00, 0.00, NULL, 1, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000054', 0.00),
(666, '2024-08-29 23:55:27', '2024-08-29 23:59:12', NULL, 67, 17, NULL, 0.00, 19600.00, 'apple_pay', 'paid', 'new', NULL, NULL, NULL, 0.85, 171.7, 0.00, 3, '', 600.00, 0.00, NULL, 8, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000055', 1910.00),
(667, '2024-08-30 00:01:35', '2024-08-30 01:44:56', NULL, 67, 17, NULL, 0.00, 18600.00, 'apple_pay', 'paid', 'new', NULL, NULL, NULL, 0.85, 162.35, 0.00, 3, '', 500.00, 0.00, NULL, 3, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000056', 2040.00),
(668, '2024-08-30 18:27:11', '2024-08-30 18:27:11', NULL, 68, 17, NULL, 0.00, 23600.00, NULL, 'unpaid', '', NULL, NULL, NULL, 0.85, 209.1, 0.00, 3, '', 1000.00, 0.00, NULL, 4, NULL, NULL, '', NULL, NULL, '', NULL, 0.00, 0, '000057', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_has_items`
--

CREATE TABLE `order_has_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `extras` varchar(800) DEFAULT '',
  `vat` double(8,2) DEFAULT 0.00,
  `vatvalue` double(8,2) DEFAULT 0.00,
  `variant_price` double(8,2) DEFAULT NULL,
  `variant_name` varchar(191) NOT NULL DEFAULT '',
  `kds_finished` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_has_items`
--

INSERT INTO `order_has_items` (`id`, `created_at`, `updated_at`, `order_id`, `item_id`, `qty`, `extras`, `vat`, `vatvalue`, `variant_price`, `variant_name`, `kds_finished`) VALUES
(1, NULL, NULL, 601, 341, 1, '[]', 0.00, 0.00, 5.00, '', 0),
(2, NULL, NULL, 602, 341, 1, '[]', 0.00, 0.00, 5.00, '', 0),
(3, NULL, NULL, 603, 341, 2, '[]', 0.00, 0.00, 5.00, '', 0),
(4, NULL, NULL, 604, 341, 1, '[]', 0.00, 0.00, 15.00, 'large', 0),
(5, NULL, NULL, 606, 341, 1, '[\"Cheese + \\u20ac1.00\"]', 0.00, 0.00, 6.00, 'small', 0),
(6, NULL, NULL, 607, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(7, NULL, NULL, 608, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(8, NULL, NULL, 609, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(9, NULL, NULL, 610, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(10, NULL, NULL, 611, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(11, NULL, NULL, 612, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(12, NULL, NULL, 613, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(13, NULL, NULL, 614, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(14, NULL, NULL, 615, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(15, NULL, NULL, 616, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(16, NULL, NULL, 616, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(17, NULL, NULL, 617, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(18, NULL, NULL, 617, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(19, NULL, NULL, 617, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(20, NULL, NULL, 618, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(21, NULL, NULL, 619, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(22, NULL, NULL, 620, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(23, NULL, NULL, 621, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(24, NULL, NULL, 622, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(25, NULL, NULL, 623, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(26, NULL, NULL, 624, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(27, NULL, NULL, 625, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(28, NULL, NULL, 626, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(29, NULL, NULL, 627, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(30, NULL, NULL, 628, 341, 1, '[\"Cheese + \\u20ac0.01\"]', 0.00, 0.00, 6.00, 'small', 0),
(31, NULL, NULL, 628, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(32, NULL, NULL, 629, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(33, NULL, NULL, 630, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(34, NULL, NULL, 631, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(35, NULL, '2024-07-08 09:36:25', 632, 341, 5, '[]', 0.00, NULL, 5.00, 'small', 0),
(36, NULL, NULL, 632, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(37, NULL, NULL, 633, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(38, NULL, NULL, 634, 341, 1, '[]', 0.00, 0.00, 5.00, 'small', 0),
(39, NULL, NULL, 635, 341, 2, '[]', 0.00, 0.00, 10.00, 'medium', 0),
(46, NULL, NULL, 643, 344, 2, '[]', 0.00, 0.00, 12.00, '', 0),
(47, NULL, NULL, 643, 345, 6, '[]', 0.00, 0.00, 160.00, '', 0),
(48, NULL, NULL, 643, 341, 8, '[]', 0.00, 0.00, 50.00, '', 0),
(49, NULL, NULL, 643, 346, 9, '[]', 0.00, 0.00, 100.00, '', 0),
(54, NULL, NULL, 646, 341, 2, '[]', 0.00, 0.00, 50.00, '', 0),
(55, NULL, NULL, 646, 344, 7, '[]', 0.00, 0.00, 120.00, '', 0),
(56, NULL, NULL, 647, 341, 1, '[]', 0.00, 0.00, 5000.00, '', 0),
(57, NULL, NULL, 647, 346, 1, '[]', 0.00, 0.00, 1000.00, '', 0),
(58, NULL, NULL, 648, 345, 1, '[]', 0.00, 0.00, 1600.00, '', 0),
(59, NULL, NULL, 649, 341, 3, '[]', 0.00, 0.00, 5000.00, '', 0),
(60, NULL, NULL, 649, 344, 3, '[]', 0.00, 0.00, 12000.00, '', 0),
(61, NULL, NULL, 649, 345, 2, '[]', 0.00, 0.00, 1600.00, '', 0),
(62, NULL, NULL, 649, 346, 2, '[]', 0.00, 0.00, 1000.00, '', 0),
(67, NULL, NULL, 652, 346, 5, '[]', 10.00, 500.00, 1000.00, '', 0),
(68, NULL, NULL, 652, 341, 5, '[]', 10.00, 2500.00, 5000.00, '', 0),
(69, NULL, NULL, 653, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(70, NULL, NULL, 653, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(71, NULL, NULL, 654, 341, 2, '[]', 10.00, 1000.00, 5000.00, '', 0),
(72, NULL, NULL, 654, 345, 2, '[]', 0.00, 0.00, 1600.00, '', 0),
(73, NULL, NULL, 654, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(74, NULL, NULL, 655, 341, 3, '[]', 10.00, 1500.00, 5000.00, '', 0),
(75, NULL, NULL, 655, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(78, NULL, NULL, 657, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(79, NULL, NULL, 657, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(80, NULL, NULL, 658, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(81, NULL, NULL, 659, 344, 2, '[]', 0.00, 0.00, 12000.00, '', 0),
(82, NULL, NULL, 660, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(83, NULL, NULL, 660, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(84, NULL, NULL, 661, 345, 1, '[]', 0.00, 0.00, 1600.00, '', 0),
(85, NULL, NULL, 661, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(86, NULL, NULL, 662, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(87, NULL, NULL, 663, 344, 2, '[]', 0.00, 0.00, 12000.00, '', 0),
(88, NULL, NULL, 664, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(89, NULL, NULL, 665, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(90, NULL, NULL, 665, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(91, NULL, NULL, 665, 345, 1, '[]', 0.00, 0.00, 1600.00, '', 0),
(92, NULL, NULL, 665, 346, 1, '[]', 10.00, 100.00, 1000.00, '', 0),
(93, NULL, NULL, 666, 346, 1, '[]', 10.00, 100.00, 1000.00, '', 0),
(94, NULL, NULL, 666, 345, 1, '[]', 0.00, 0.00, 1600.00, '', 0),
(95, NULL, NULL, 666, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(96, NULL, NULL, 666, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(97, NULL, NULL, 667, 341, 1, '[]', 10.00, 500.00, 5000.00, '', 0),
(98, NULL, NULL, 667, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(99, NULL, NULL, 667, 345, 1, '[]', 0.00, 0.00, 1600.00, '', 0),
(100, NULL, NULL, 668, 341, 2, '[]', 10.00, 1000.00, 5000.00, '', 0),
(101, NULL, NULL, 668, 344, 1, '[]', 0.00, 0.00, 12000.00, '', 0),
(102, NULL, NULL, 668, 345, 1, '[]', 0.00, 0.00, 1600.00, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_has_status`
--

CREATE TABLE `order_has_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_has_status`
--

INSERT INTO `order_has_status` (`id`, `created_at`, `updated_at`, `order_id`, `status_id`, `user_id`, `comment`) VALUES
(21, '2024-07-06 21:18:57', NULL, 606, 1, 35, 'Local order'),
(22, '2024-07-07 11:59:08', NULL, 607, 1, 35, 'Local order'),
(23, '2024-07-07 12:22:11', NULL, 608, 1, 35, 'Local order'),
(24, '2024-07-07 14:47:26', NULL, 609, 1, 35, 'Local order'),
(25, '2024-07-07 14:55:46', NULL, 610, 1, 35, 'Local order'),
(26, '2024-07-07 14:58:50', NULL, 611, 1, 35, 'Local order'),
(27, '2024-07-07 15:03:58', NULL, 612, 1, 35, 'Local order'),
(28, '2024-07-07 19:06:04', NULL, 609, 3, 35, ''),
(29, '2024-07-07 19:13:11', NULL, 609, 5, 35, ''),
(30, '2024-07-08 02:30:45', NULL, 613, 1, 35, 'Local order'),
(31, '2024-07-08 02:43:03', NULL, 614, 1, 35, 'Local order'),
(32, '2024-07-08 02:46:51', NULL, 615, 1, 35, 'Local order'),
(33, '2024-07-08 02:53:13', NULL, 616, 1, 35, 'Local order'),
(34, '2024-07-08 03:05:24', NULL, 617, 1, 35, 'Local order'),
(35, '2024-07-08 03:08:33', NULL, 618, 1, 35, 'Local order'),
(36, '2024-07-08 03:17:52', NULL, 619, 1, 35, 'Local order'),
(37, '2024-07-08 03:28:09', NULL, 620, 1, 35, 'Local order'),
(38, '2024-07-08 03:31:47', NULL, 621, 1, 35, 'Local order'),
(39, '2024-07-08 03:38:40', NULL, 622, 1, 35, 'Local order'),
(40, '2024-07-08 03:47:59', NULL, 623, 1, 35, 'Local order'),
(41, '2024-07-08 03:54:10', NULL, 624, 1, 35, 'Local order'),
(42, '2024-07-08 03:57:25', NULL, 625, 1, 35, 'Local order'),
(43, '2024-07-08 04:01:33', NULL, 626, 1, 35, 'Local order'),
(44, '2024-07-08 04:05:54', NULL, 627, 1, 35, 'Local order'),
(45, '2024-07-08 04:21:06', NULL, 628, 1, 35, 'Local order'),
(46, '2024-07-08 04:27:31', NULL, 629, 1, 35, 'Local order'),
(47, '2024-07-08 04:34:14', NULL, 630, 1, 35, 'Local order'),
(48, '2024-07-08 09:03:18', NULL, 631, 1, 35, 'Local order'),
(49, '2024-07-08 09:23:40', NULL, 632, 1, 35, 'Local order'),
(50, '2024-07-09 06:47:10', NULL, 633, 1, 35, 'Local order'),
(51, '2024-07-09 06:58:28', NULL, 634, 1, 35, 'Local order'),
(52, '2024-07-26 13:48:51', NULL, 635, 1, 35, 'Local order'),
(54, '2024-07-27 15:57:15', NULL, 635, 9, 35, ''),
(55, '2024-07-27 15:57:24', NULL, 634, 9, 35, ''),
(56, '2024-07-28 10:34:02', NULL, 643, 3, 35, '');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `showAsLink` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `created_at`, `updated_at`, `title`, `content`, `showAsLink`) VALUES
(1, '2024-06-08 15:56:51', '2024-07-20 13:27:36', 'Terms and conditions', '<p>Your terms and conditions goes here updated</p>', 1),
(2, '2024-06-08 15:56:51', '2024-06-08 15:56:51', 'Privacy Policy', 'Your privacy policy content goes here', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('owner@example.com', '$2y$12$0eEcSdWo6YlJoz8b6v.pO.l9nCvi/RFP/WXPhcC/ALlNk8uVoPQKa', '2024-07-02 20:50:12');

-- --------------------------------------------------------

--
-- Table structure for table `paths`
--

CREATE TABLE `paths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` varchar(191) DEFAULT NULL,
  `lng` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `provider` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pdfs`
--

CREATE TABLE `pdfs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pdfs`
--

INSERT INTO `pdfs` (`id`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 'pdfs/qwS6CwxNdD.pdf', '2024-07-06 12:28:29', '2024-07-19 12:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage restorants', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(2, 'manage drivers', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(3, 'manage orders', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(4, 'edit settings', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(5, 'view orders', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(6, 'edit restorant', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(7, 'edit orders', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(8, 'access backedn', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `limit_items` int(11) NOT NULL DEFAULT 0 COMMENT '0 is unlimited',
  `limit_orders` int(11) NOT NULL DEFAULT 0 COMMENT '0 is unlimited',
  `price` double(8,2) NOT NULL,
  `period` int(11) NOT NULL DEFAULT 1 COMMENT '1 - monthly, 2-anually',
  `paddle_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `description` varchar(555) NOT NULL DEFAULT '',
  `features` varchar(555) NOT NULL DEFAULT '',
  `limit_views` int(11) NOT NULL DEFAULT 0 COMMENT '0 is unlimited',
  `enable_ordering` int(11) NOT NULL DEFAULT 1,
  `stripe_id` varchar(191) NOT NULL,
  `paypal_id` varchar(191) DEFAULT NULL,
  `mollie_id` varchar(191) DEFAULT NULL,
  `paystack_id` varchar(191) DEFAULT NULL,
  `processing_fee` varchar(191) DEFAULT NULL,
  `monthly_fee` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `name`, `limit_items`, `limit_orders`, `price`, `period`, `paddle_id`, `created_at`, `updated_at`, `deleted_at`, `description`, `features`, `limit_views`, `enable_ordering`, `stripe_id`, `paypal_id`, `mollie_id`, `paystack_id`, `processing_fee`, `monthly_fee`) VALUES
(1, 'Free', 30, 0, 0.00, 1, '', '2024-06-08 15:57:56', '2024-06-08 15:57:56', NULL, 'If you run a small restaurant or bar, or just need the basics, this plan is great.', 'Full access to QR tool, Menu creation tool (50 menu item limit) , 500 transaction limit, Community support', 0, 2, '', NULL, NULL, NULL, '2', '30'),
(2, 'Starter', 10, 300, 14.99, 1, '', '2024-06-08 15:57:56', '2024-06-09 08:50:12', NULL, 'For bigger restaurants and bars. Offer a full menu. Limitless plan', 'Full access to QR tool, Menu creation tool (250 menu item list), Unlimited items in the menu, 300 orders per month, Dedicated Support, Call waiter functionality', 0, 1, '', NULL, NULL, NULL, '3', '60'),
(3, 'Pro', 30, 0, 24.99, 1, '', '2024-06-08 15:57:56', '2024-06-09 08:50:21', NULL, 'Accept orders directly from your customer mobile phone', 'Manage order, Full access to QR tool, Access to the menu creation tool, Unlimited menu items, Dedicated Support , Menu creation tool , In-app ordering , Call waiter functionality, Order from Menu option', 0, 1, '', NULL, NULL, NULL, '400', '90'),
(4, 'Testing Plan updating', 17, 73, 969.00, 1, '', '2024-07-20 13:29:55', '2024-07-20 13:30:32', NULL, 'Plan description Est minima expedita', 'Features list (separate features with comma) Mollit doloremque qu', 0, 1, '', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post_type` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `link_name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `rateable_type` varchar(191) NOT NULL,
  `rateable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restoareas`
--

CREATE TABLE `restoareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `audio` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restoareas`
--

INSERT INTO `restoareas` (`id`, `name`, `restaurant_id`, `created_at`, `updated_at`, `deleted_at`, `audio`) VALUES
(1, 'Inside', 1, NULL, NULL, NULL, NULL),
(2, 'Terrasse', 1, NULL, NULL, NULL, NULL),
(3, 'Inside', 2, NULL, NULL, NULL, NULL),
(4, 'Terrasse', 2, NULL, NULL, NULL, NULL),
(5, 'Inside', 3, NULL, NULL, NULL, NULL),
(6, 'Terrasse', 3, NULL, NULL, NULL, NULL),
(7, 'Inside', 4, NULL, NULL, NULL, NULL),
(8, 'Terrasse', 4, NULL, NULL, NULL, NULL),
(9, 'Inside', 5, NULL, NULL, NULL, NULL),
(10, 'Terrasse', 5, NULL, NULL, NULL, NULL),
(11, 'Inside', 6, NULL, NULL, NULL, NULL),
(12, 'Terrasse', 6, NULL, NULL, NULL, NULL),
(13, 'Inside', 7, NULL, NULL, NULL, NULL),
(14, 'Terrasse', 7, NULL, NULL, NULL, NULL),
(15, 'Inside', 8, NULL, NULL, NULL, NULL),
(16, 'Terrasse', 8, NULL, NULL, NULL, NULL),
(17, 'Inside', 9, NULL, NULL, NULL, NULL),
(18, 'Terrasse', 9, NULL, NULL, NULL, NULL),
(19, 'Inside', 10, NULL, NULL, NULL, NULL),
(20, 'Terrasse', 10, NULL, NULL, NULL, NULL),
(21, 'Inside', 11, NULL, NULL, NULL, NULL),
(22, 'Terrasse', 11, NULL, NULL, NULL, NULL),
(23, 'Inside', 12, NULL, NULL, NULL, NULL),
(24, 'Terrasse', 12, NULL, NULL, NULL, NULL),
(25, 'Inside', 13, NULL, NULL, NULL, NULL),
(26, 'Terrasse', 13, NULL, NULL, NULL, NULL),
(27, 'Inside', 14, NULL, NULL, NULL, NULL),
(28, 'Terrasse', 14, NULL, NULL, NULL, NULL),
(29, 'Inside', 15, NULL, NULL, NULL, NULL),
(30, 'Terrasse', 15, NULL, NULL, NULL, NULL),
(31, 'Inside', 16, NULL, NULL, NULL, NULL),
(32, 'Terrasse', 16, NULL, NULL, NULL, NULL),
(33, 'Rotterdam', 17, '2024-06-08 16:49:41', '2024-06-08 16:49:41', NULL, NULL),
(34, 'Loom', 25, '2024-06-27 15:27:23', '2024-06-27 15:27:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(2, 'owner', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(3, 'driver', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(4, 'client', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51'),
(5, 'staff', 'web', '2024-06-08 15:56:51', '2024-06-08 15:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site_name` varchar(191) NOT NULL,
  `site_logo` varchar(191) NOT NULL,
  `search` varchar(191) NOT NULL,
  `restorant_details_image` varchar(191) NOT NULL DEFAULT '',
  `restorant_details_cover_image` varchar(191) NOT NULL DEFAULT '',
  `description` varchar(191) NOT NULL,
  `header_title` varchar(191) NOT NULL,
  `header_subtitle` varchar(191) NOT NULL,
  `currency` varchar(191) NOT NULL DEFAULT 'USD',
  `facebook` varchar(191) NOT NULL DEFAULT '',
  `instagram` varchar(191) NOT NULL DEFAULT '',
  `playstore` varchar(191) NOT NULL DEFAULT '',
  `appstore` varchar(191) NOT NULL DEFAULT '',
  `maps_api_key` varchar(191) DEFAULT '',
  `delivery` double(8,2) NOT NULL DEFAULT 0.00,
  `typeform` varchar(191) NOT NULL DEFAULT '',
  `mobile_info_title` varchar(191) NOT NULL DEFAULT '',
  `mobile_info_subtitle` varchar(191) NOT NULL DEFAULT '',
  `order_options` varchar(191) NOT NULL DEFAULT '{}',
  `site_logo_dark` varchar(191) DEFAULT NULL,
  `order_fields` text DEFAULT NULL,
  `service_fee` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `site_name`, `site_logo`, `search`, `restorant_details_image`, `restorant_details_cover_image`, `description`, `header_title`, `header_subtitle`, `currency`, `facebook`, `instagram`, `playstore`, `appstore`, `maps_api_key`, `delivery`, `typeform`, `mobile_info_title`, `mobile_info_subtitle`, `order_options`, `site_logo_dark`, `order_fields`, `service_fee`) VALUES
(1, '2024-06-08 15:56:51', '2024-08-28 17:42:24', 'etabs', '795fc9c0-6e1e-4de4-9fd0-5daa4aa23ed4', '/default/cover.jpg', '98375b02-b2c7-42da-ae0f-9a18a5ab4227', '/default/cover.jpg', 'Food Delivery from best restaurants', '', '', 'USD', '', '', '', '', 'AIzaSyCZhq0g1x1ttXPa1QB3ylcDQPTAzp_KUgA', 0.00, '', '', '', '{}', 'dd110ad0-931f-45d6-84f6-0dba3d5adb9d', NULL, 250);

-- --------------------------------------------------------

--
-- Table structure for table `simple_delivery_areas`
--

CREATE TABLE `simple_delivery_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_delivery_areas`
--

INSERT INTO `simple_delivery_areas` (`id`, `name`, `cost`, `restaurant_id`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'Nearby', 10.00, 1, NULL, NULL, ''),
(2, 'Faraway', 15.00, 1, NULL, NULL, ''),
(3, 'Nearby', 10.00, 2, NULL, NULL, ''),
(4, 'Faraway', 15.00, 2, NULL, NULL, ''),
(5, 'Nearby', 10.00, 3, NULL, NULL, ''),
(6, 'Faraway', 15.00, 3, NULL, NULL, ''),
(7, 'Nearby', 10.00, 4, NULL, NULL, ''),
(8, 'Faraway', 15.00, 4, NULL, NULL, ''),
(9, 'Nearby', 10.00, 5, NULL, NULL, ''),
(10, 'Faraway', 15.00, 5, NULL, NULL, ''),
(11, 'Nearby', 10.00, 6, NULL, NULL, ''),
(12, 'Faraway', 15.00, 6, NULL, NULL, ''),
(13, 'Nearby', 10.00, 7, NULL, NULL, ''),
(14, 'Faraway', 15.00, 7, NULL, NULL, ''),
(15, 'Nearby', 10.00, 8, NULL, NULL, ''),
(16, 'Faraway', 15.00, 8, NULL, NULL, ''),
(17, 'Nearby', 10.00, 9, NULL, NULL, ''),
(18, 'Faraway', 15.00, 9, NULL, NULL, ''),
(19, 'Nearby', 10.00, 10, NULL, NULL, ''),
(20, 'Faraway', 15.00, 10, NULL, NULL, ''),
(21, 'Nearby', 10.00, 11, NULL, NULL, ''),
(22, 'Faraway', 15.00, 11, NULL, NULL, ''),
(23, 'Nearby', 10.00, 12, NULL, NULL, ''),
(24, 'Faraway', 15.00, 12, NULL, NULL, ''),
(25, 'Nearby', 10.00, 13, NULL, NULL, ''),
(26, 'Faraway', 15.00, 13, NULL, NULL, ''),
(27, 'Nearby', 10.00, 14, NULL, NULL, ''),
(28, 'Faraway', 15.00, 14, NULL, NULL, ''),
(29, 'Nearby', 10.00, 15, NULL, NULL, ''),
(30, 'Faraway', 15.00, 15, NULL, NULL, ''),
(31, 'Nearby', 10.00, 16, NULL, NULL, ''),
(32, 'Faraway', 15.00, 16, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sms_verifications`
--

CREATE TABLE `sms_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `alias` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `alias`) VALUES
(1, 'Just created', 'just_created'),
(2, 'Accepted by admin', 'accepted_by_admin'),
(3, 'Accepted by restaurant', 'accepted_by_restaurant'),
(4, 'Assigned to driver', 'assigned_to_driver'),
(5, 'Prepared', 'prepared'),
(6, 'Picked up', 'picked_up'),
(7, 'Delivered', 'delivered'),
(8, 'Rejected by admin', 'rejected_by_admin'),
(9, 'Rejected by restaurant', 'rejected_by_restaurant'),
(10, 'Updated', 'updated'),
(11, 'Closed', 'closed'),
(12, 'Rejected by driver', 'rejected_by_driver'),
(13, 'Accepted by driver', 'accepted_by_driver');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `stripe_status` varchar(191) NOT NULL,
  `stripe_plan` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_price` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `stripe_plan` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_product` varchar(191) NOT NULL,
  `stripe_price` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `size` int(11) NOT NULL DEFAULT 4,
  `restoarea_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `x` double(8,2) DEFAULT NULL,
  `y` double(8,2) DEFAULT NULL,
  `w` double(8,2) DEFAULT NULL,
  `h` double(8,2) DEFAULT NULL,
  `rounded` varchar(191) DEFAULT 'no',
  `waiter_name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `size`, `restoarea_id`, `restaurant_id`, `created_at`, `updated_at`, `deleted_at`, `x`, `y`, `w`, `h`, `rounded`, `waiter_name`) VALUES
(1, '12', 4, 33, 17, '2024-06-09 07:42:42', '2024-06-09 07:42:42', NULL, NULL, NULL, NULL, NULL, 'no', 'abcd'),
(2, '1', 4, 34, 25, '2024-06-27 15:28:22', '2024-06-27 15:28:22', NULL, NULL, NULL, NULL, NULL, 'no', 'abcd'),
(3, '15', 6, 33, 17, '2024-07-03 01:17:35', '2024-07-03 01:17:35', NULL, NULL, NULL, NULL, NULL, 'no', 'abcd'),
(4, '20', 5, 33, 17, '2024-07-03 14:34:09', '2024-07-03 14:34:09', NULL, NULL, NULL, NULL, NULL, 'no', 'abcd'),
(5, '5', 12, 33, 17, '2024-07-03 17:46:42', '2024-08-29 11:23:29', NULL, NULL, NULL, NULL, NULL, 'no', 'lee'),
(6, '6', 8, 33, 17, '2024-07-03 17:53:10', '2024-08-25 17:52:04', NULL, NULL, NULL, NULL, NULL, 'no', 'waiter name'),
(7, '7', 6, 33, 17, '2024-07-03 18:08:30', '2024-08-26 08:40:19', NULL, NULL, NULL, NULL, NULL, 'no', 'dsfgdsfg'),
(8, '1', 3, 33, 17, '2024-07-07 11:58:01', '2024-07-07 11:58:01', NULL, NULL, NULL, NULL, NULL, 'no', 'John'),
(9, '22', 4, 33, 17, '2024-07-08 09:16:49', '2024-07-08 09:16:49', NULL, NULL, NULL, NULL, NULL, 'no', 'abcd');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `tip` double(8,2) DEFAULT NULL,
  `service` double(8,2) DEFAULT NULL,
  `brand` varchar(191) DEFAULT NULL,
  `last4` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `session_id` text DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_name`, `amount`, `currency`, `tax`, `tip`, `service`, `brand`, `last4`, `payment_method`, `session_id`, `is_paid`, `user_id`, `order_id`, `created_at`, `updated_at`) VALUES
(2, 'Aamir', 56200.00, 'ZAR', NULL, 5660.00, 400.00, NULL, NULL, NULL, 'cs_test_a1yhKCRPxEdPJJrI5SDYN3nZ6F9koOsoyAoVohfyUrVo1H8EmMqjXDBmxU', 0, 59, 649, '2024-08-19 10:19:23', '2024-08-19 10:19:23'),
(3, 'Aamir', 5000.00, 'ZAR', NULL, 500.00, 400.00, NULL, NULL, NULL, 'cs_test_a1YpKQxet9OEcJ9cVz2vPgUEWlMOCct8k09i71YEZdim66kutpQlMulovC', 0, 59, 649, '2024-08-19 14:38:59', '2024-08-19 14:38:59'),
(4, 'Aamir', 5000.00, 'ZAR', NULL, 500.00, 400.00, NULL, NULL, NULL, 'cs_test_a1TxRuoFnhZ13SScI9BVEWqvnEY1Lk6jNF7gSte6gi3mekFDMgZrpUki27', 0, 59, 649, '2024-08-19 14:41:02', '2024-08-19 14:41:02'),
(5, 'Cybinix Admin', 30000.00, 'ZAR', NULL, 4991.09, 273.90, NULL, NULL, NULL, 'cs_test_a1I2q6Wj5IAkJc1CKPw17SG7vBGHEBRdPYx2IwkyTDw6YvYtpfQUZCbQu6', 0, 1, 652, '2024-08-24 17:00:01', '2024-08-24 17:00:01'),
(6, 'Cybinix Admin', 8822.62, 'ZAR', NULL, 100.00, 145.25, NULL, '4242', 'visa', 'cs_test_a1pX9gRX10q88kdmbuiyrxfG8ZFZOipuhVesNMo8u0xasfgtOPzaAJxBcd', 1, 1, 653, '2024-08-26 13:14:02', '2024-08-26 13:14:31'),
(8, 'Cybinix Admin', 14250.00, 'ZAR', 0.00, 1425.00, 121.00, NULL, '4242', 'visa', 'cs_test_a1xVZRBzqyLWrFepwwdFV6FMpvKCXl8IPz2Xp7IxkP9USC2Pzjve2OD269', 1, 1, 655, '2024-08-27 13:25:51', '2024-08-27 13:26:21'),
(9, 'SHAH JAHAN', 17500.00, 'ZAR', 0.00, 1750.00, 148.75, NULL, NULL, NULL, 'cs_test_a1pH3Oy8UI1Xyz6Zui8O91zwVZUExhQLuXAzbuLQ7z68tkQcn8W4CQXmCw', 0, 35, 657, '2024-08-28 18:30:37', '2024-08-28 18:30:37'),
(10, 'SHAH JAHAN', 5500.00, 'ZAR', 0.00, 550.00, 46.75, NULL, NULL, NULL, 'cs_test_a1ITYcHHJ7GkisxHuRbqhISALNfkKmp6i0SnzZYJ4ghbpGbeqVM3Uuqxfk', 0, 35, 657, '2024-08-28 18:55:45', '2024-08-28 18:55:45'),
(11, 'SHAH JAHAN', 17500.00, 'ZAR', 0.00, 1750.00, 148.75, NULL, NULL, NULL, 'cs_test_a1HthzpbPP67Co08cQNhPNVBGJFatG0f4JagHsAzoY0ATWepprh4cCUDDL', 0, 35, 657, '2024-08-28 18:59:13', '2024-08-28 18:59:13'),
(12, 'SHAH JAHAN', 10000.00, 'ZAR', 0.00, 1000.00, 85.00, NULL, '1739', 'apple_pay', 'cs_test_a1kFpQM1vDjqaSmc9Is9dZDneMbuFw952YpSBD39yz7x1mAABUVOSIic6V', 1, 35, 657, '2024-08-28 20:44:00', '2024-08-28 20:44:25'),
(13, 'Test', 5500.00, 'ZAR', 0.00, 550.00, 46.75, NULL, '5161', 'apple_pay', 'cs_test_a1MxDaMMVdnqAvy1cSyCf35DgFJlGk3xC1vNfrdA7OjlvntDVMjauK32MJ', 1, 62, 658, '2024-08-28 22:01:23', '2024-08-28 22:01:48'),
(14, 'Test', 24000.00, 'ZAR', 0.00, 3600.00, 204.00, NULL, '5161', 'apple_pay', 'cs_test_a1nI6CxyoQoH5jZXYIIoKqPsQkqAeSuBkf70zeIuwupFtbN4IjAmbt3EPh', 1, 63, 659, '2024-08-28 22:14:44', '2024-08-28 22:15:06'),
(15, 'Test', 5000.00, 'ZAR', 0.00, 750.00, 42.50, NULL, '5161', 'apple_pay', 'cs_test_a1aJHV8MIbdvZ980y8AtQwK1lTrfBvmF5IJ83DyVw8RmSHkhR283T30zaY', 1, 64, 660, '2024-08-29 12:58:44', '2024-08-29 12:59:19'),
(16, 'Blayne', 16700.00, 'ZAR', 0.00, 2505.00, 141.95, NULL, NULL, NULL, 'cs_test_a1SaCdjvymjqorLIhHDYvjWdeBS4qduzMILOfro219DIswDmvhxNamfso1', 0, 67, 666, '2024-08-29 23:58:04', '2024-08-29 23:58:04'),
(17, 'Blayne', 19100.00, 'ZAR', 0.00, 1910.00, 162.35, NULL, '1739', 'apple_pay', 'cs_test_a12eOQLQacLEJsgf7HeXZzaMbLEXO1Pw2uLNIyLqaqcWxYjwq18LbyHkfI', 1, 67, 666, '2024-08-29 23:58:53', '2024-08-29 23:59:12'),
(18, 'Blayne', 9800.00, 'ZAR', 0.00, 980.00, 83.30, NULL, NULL, NULL, 'cs_test_a1KioRxxnvg0gqVx7xaWjFQACPhjMCzTOTndc2d6K6V1BLZ2hYMnmjDb9Y', 0, 67, 667, '2024-08-30 00:02:01', '2024-08-30 00:02:01'),
(19, 'Blayne', 9800.00, 'ZAR', 0.00, 980.00, 83.30, NULL, NULL, NULL, 'cs_test_a1Lo4oBF8T83SZxfhjFhau7KRmGhn5BvmoYItBur9I7RLd7WK1d8dX9Vgt', 0, 67, 667, '2024-08-30 00:02:39', '2024-08-30 00:02:39'),
(20, 'Blayne', 8500.00, 'ZAR', 0.00, 850.00, 72.25, NULL, NULL, NULL, 'cs_test_a1IXREk23Fv8ZxsSZDGiVQkC2mvlOvC7OvuJyDrgbiMWXpG25nbA7yllLC', 0, 67, 667, '2024-08-30 01:43:54', '2024-08-30 01:43:54'),
(21, 'Blayne', 13600.00, 'ZAR', 0.00, 2040.00, 115.60, NULL, '1739', 'apple_pay', 'cs_test_a1zhjYxrXrbmSnFizC1jQVEQq0D3Q9vQvQYI3FPh3bTJQrah4NC51CqrnD', 1, 67, 667, '2024-08-30 01:44:36', '2024-08-30 01:44:56');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`id`, `quantity`, `order_item_id`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 0, 79, 10, '2024-08-28 18:55:45', '2024-08-28 18:55:45'),
(2, 1, 78, 10, '2024-08-28 18:55:45', '2024-08-28 18:55:45'),
(3, 1, 95, 17, '2024-08-29 23:58:53', '2024-08-29 23:58:53'),
(4, 1, 94, 17, '2024-08-29 23:58:53', '2024-08-29 23:58:53'),
(5, 1, 96, 17, '2024-08-29 23:58:53', '2024-08-29 23:58:53'),
(6, 1, 99, 21, '2024-08-30 01:44:36', '2024-08-30 01:44:36'),
(7, 1, 98, 21, '2024-08-30 01:44:36', '2024-08-30 01:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) DEFAULT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `google_id` char(191) DEFAULT NULL,
  `fb_id` char(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `stripe_id` varchar(191) DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(191) DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plan_status` varchar(191) NOT NULL DEFAULT '',
  `cancel_url` varchar(555) NOT NULL DEFAULT '',
  `update_url` varchar(555) NOT NULL DEFAULT '',
  `checkout_id` varchar(555) NOT NULL DEFAULT '',
  `subscription_plan_id` varchar(555) NOT NULL DEFAULT '',
  `stripe_account` varchar(191) NOT NULL DEFAULT '',
  `birth_date` varchar(191) NOT NULL DEFAULT '',
  `lat` varchar(191) DEFAULT NULL,
  `lng` varchar(191) DEFAULT NULL,
  `working` int(11) NOT NULL DEFAULT 1,
  `onorder` int(11) DEFAULT NULL,
  `numorders` int(11) NOT NULL DEFAULT 0,
  `rejectedorders` int(11) NOT NULL,
  `paypal_subscribtion_id` varchar(191) DEFAULT NULL,
  `mollie_customer_id` varchar(191) DEFAULT NULL,
  `mollie_mandate_id` varchar(191) DEFAULT NULL,
  `tax_percentage` decimal(6,4) NOT NULL DEFAULT 0.0000,
  `extra_billing_information` text DEFAULT NULL,
  `mollie_subscribtion_id` varchar(191) DEFAULT NULL,
  `paystack_subscribtion_id` varchar(191) DEFAULT NULL,
  `paystack_trans_id` varchar(191) DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `expotoken` text DEFAULT NULL,
  `pm_type` varchar(191) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `restaurant_group` varchar(255) DEFAULT NULL,
  `audio` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `google_id`, `fb_id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `phone`, `remember_token`, `created_at`, `updated_at`, `active`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `verification_code`, `phone_verified_at`, `plan_id`, `plan_status`, `cancel_url`, `update_url`, `checkout_id`, `subscription_plan_id`, `stripe_account`, `birth_date`, `lat`, `lng`, `working`, `onorder`, `numorders`, `rejectedorders`, `paypal_subscribtion_id`, `mollie_customer_id`, `mollie_mandate_id`, `tax_percentage`, `extra_billing_information`, `mollie_subscribtion_id`, `paystack_subscribtion_id`, `paystack_trans_id`, `restaurant_id`, `deleted_at`, `expotoken`, `pm_type`, `pm_last_four`, `otp`, `restaurant_group`, `audio`) VALUES
(1, NULL, NULL, 'Cybinix Admin', 'cybinix@gmail.com', '2024-06-08 15:56:51', '$2y$12$b1w4g/XtDd8mAsqkyQkKn.Vr1WqeRQa9JwEBbDVbOvGIXCGvgmAwS', 'TAKRAL0Yaeror86Ess9GL1udMGsTmUtLHza6oOsUCpDtfhKysAnkajyIZSPOWJ7qNV82gko8Q5JniCdm', '+31620875913', 'PR8vgfaxolGeIaets00guG3img47lwZtlFTif3zIBYMw5Xf13jdFnyRyBuBV', '2024-06-08 15:56:51', '2024-08-23 12:18:23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '519272', NULL, NULL),
(2, NULL, NULL, 'Demo Owner', 'owner@example.com', '2024-06-08 15:56:52', '$2y$12$7dyxDJqlF0uWf7Gt7E121.2crBfHHm.Ws1oEULYtZJ0QphJprqTKy', 'nusmrRaQoVUIfXgQgSz6QsWmHExxQSh8mK5goSlNzdWTvMAdm5YtTUQHrgN4xGUcEp4WKEoq7mJClCzh', '', NULL, '2024-06-08 15:56:52', '2024-07-02 20:39:14', 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 'Demo Staff 1', 'staff@example.com', '2024-06-08 15:56:52', '$2y$12$af2Dz1sgbm25MPkLoNqY2uPB81CQWQzFyvS4EF4aD9KkegehweaO.', 'zkDvQZgij0ol83hbZg9asWWjUYILZf6U0X46wan1kcI8E3XCsUBd3mO69RLQkhuybNMceX07dXHLc6UU', '', NULL, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, 'Demo Staff 2', 'staff2_1@example.com', '2024-06-08 15:56:52', '$2y$12$nZnXBButh6OtfkiBYTYQOur32DdoKR3mBnWRvADxQiDTfb0L5IJPG', 'EPJKFIIr2B3jeBXSow0v6DOJYpOhRRzUV4oxuYmLxKNc2ow3w8cJvrSipLBjgMbR13YAJZafQnlJNKmI', '', NULL, '2024-06-08 15:56:52', '2024-06-08 15:56:52', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, 'Demo Staff 1', 'staff1_2@example.com', '2024-06-08 15:56:58', '$2y$12$FVAI6nCPB4zcnPDWSLvzRe3iI21sfZ39npBNjMB3OJWAyITRmpW86', 'nAo5fYhjoEgqFegL9CDx5Grae0ZSdopk4GEwIoISydDqA82ELS6T6iq9dv1SVZGwXYuFtLIQyf8rwThH', '', NULL, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 'Demo Staff 2', 'staff2_2@example.com', '2024-06-08 15:56:58', '$2y$12$TvmOcC.a6fZi0NZuEgYIwuoXWOLoazzoRw2FjLHW8qwAkm5FRgsF6', '31mhEkxtueqFAINMACHkAppTdWajUaaiKXi0X0ZsHvyjjesD32r4Q5ytY0sRx7qTkG586Pn0j3J2oVdU', '', NULL, '2024-06-08 15:56:58', '2024-06-08 15:56:58', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 'Demo Staff 1', 'staff1_3@example.com', '2024-06-08 15:56:59', '$2y$12$ATNqqd4RQYn7Pk2jKBqsHuo.TJGhw8A4ulOO.z8bpxCSpbG9Ruc7y', 'L75Z3JNtnx4vaQM7aWSjm0dz7Jm30nWecYiVKkiR6cFF1e18yHDIYpvsfApf8ospPTNntKNeC5FFEL6k', '', NULL, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 'Demo Staff 2', 'staff2_3@example.com', '2024-06-08 15:56:59', '$2y$12$0T..CXlHk8FWqxqDYH/e8ucB11.1EOInluw7bJpkAT0pC2/yH7.tW', 'TC99upRjwdJVXjUyy1qIXGByFUEKHHuxEuQgRwwRYdPeRS9x0vfrj4gIQBSZZk0DjQRCJvrnRqYsk7JO', '', NULL, '2024-06-08 15:56:59', '2024-06-08 15:56:59', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, 'Demo Staff 1', 'staff1_4@example.com', '2024-06-08 15:57:00', '$2y$12$5SX/BOZb45RpubUFG5QwieZ2XMTIUd1nFv1YDd5otwK/r5uesSWoW', 'pIlPEGTf8sH9AtYidp99c3ysxZYg4QdOuxkDdV5yXgyvYwtqejKp9pT22MpvEIb3Pk4IVlTITalZALHr', '', NULL, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'Demo Staff 2', 'staff2_4@example.com', '2024-06-08 15:57:00', '$2y$12$PdLFU05xmoPOwyn.mNY8leUl46.zjj4FMdAvwZ4GKv5pLaTKOH.4a', 'PcnZDk3W3Ca5FUcqpphAh1pXZXDZoI4iVKPplud5g8iMqb4I4ov8mvyx7BcoUyQuCHB8cnwCcvLWJPwj', '', NULL, '2024-06-08 15:57:00', '2024-06-08 15:57:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, NULL, 'Demo Staff 1', 'staff1_5@example.com', '2024-06-08 15:57:07', '$2y$12$OYgvbChCKdGy1..vzhaljOYtCYSAowEaLi9TDgjOKvKm5VBIe0dDW', 'pyzHllRmavYEaaeA96HzNOjtuFJRsvBCTcYixvOMUKVYZWyMZw6m505YWhQsplqYTYsuXgLk1lmKOLlH', '', NULL, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'Demo Staff 2', 'staff2_5@example.com', '2024-06-08 15:57:07', '$2y$12$0y2GqYN4GwpOcg5.rRYj8.8eG5JDIzMcnIvqySXaTl6GG4hzfhYS6', '5XbcvTGZ6s6Mfgwy5quvrGF5hKTFP6GKDZyw5y4mN7LXU1U0mLHZH1PXnwTIUa1rgWf0Nf8goItwOBoz', '', NULL, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, 'Demo Staff 1', 'staff1_6@example.com', '2024-06-08 15:57:13', '$2y$12$IUcE349xZylCWm/c0bj.r.yISxCKEvNA10MulVAmw0MWtYGhKDrsu', '75sdOfQJSEM94EXodQhNbZwgLRghKeSHdrIjGft0f3QTJpZTGxtTSW3aFCOVLpcQhtCr3ZnHbHiyg5aL', '', NULL, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, 'Demo Staff 2', 'staff2_6@example.com', '2024-06-08 15:57:13', '$2y$12$gMJPbl0x74isnFXSrTxG8..4hdaoAFEAYpe7grDiqaVsU3npYFz2q', 'OZjtSmWSPCcOlBC5km6euqMbt63UqLc9nrd3yn2cUzRSl5Vchz9oiytc4OcEdNlZkXUADc6tzRXYmVd6', '', NULL, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, 'Demo Staff 1', 'staff1_7@example.com', '2024-06-08 15:57:14', '$2y$12$5v50Poiq9PbAOilCSt1coenCvweo4z4UHa9xsNy3oikWbFQ3Fv15.', 'NzDxTsJjW06CqiAaqjwenDFClq5juFrO2oZ29wDX2uGvvxkxbi2U3Hi14ciYzLGv8MOBukXgGvMzu5Sc', '', NULL, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, 'Demo Staff 2', 'staff2_7@example.com', '2024-06-08 15:57:14', '$2y$12$mVh20GZgBvFGSjfYy1kPwewYpLxsJ4DC8dN97K4HVRWBb191pDd2K', '1e4aMtnt04xqityBguTu2hHPeYOWseMXaoikmWxfUOcMM9bu3GsdbMjHNyiPK4achg0afPKyC63jrMBT', '', NULL, '2024-06-08 15:57:14', '2024-06-08 15:57:14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, NULL, NULL, 'Demo Staff 1', 'staff1_8@example.com', '2024-06-08 15:57:16', '$2y$12$cydw.qpyAOxcWyKD6t181OY3VNB0cuOYjhzHk6oM9r.ZQTN8rFvwG', 'QYICLsGvbO65hSYXHZHKwmbIIxNjOpAU8L3CHIEPdzCLFR4xDSvkov6zCs3hfALWiXuJAhjzQwZCRDxI', '', NULL, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, NULL, NULL, 'Demo Staff 2', 'staff2_8@example.com', '2024-06-08 15:57:16', '$2y$12$0UTia34lMF6E/fi6HlOfI.E46VzJhh4RziGLWxBGKSRpET.KTvTea', 'lWXue9glYoofrWzDD78LhSGk0k4U6VCbzrj9BWI3RdkFgIyRp5eSVveiGVU5JEcEBy4q7clKWgDuHgkx', '', NULL, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, 'Demo Staff 1', 'staff1_9@example.com', '2024-06-08 15:57:22', '$2y$12$TRmgUpRKgo2be7Mza.xBMufo6.ZVn1kw.FaeS07zh6k0bC2mBuWJW', 'Woax8SXRIVJ2D9BVKLNJ0RmlqUvusq9QJrfEQO5wxHM0NHvcjMSFulBlPrt2SVuRKLfBt2WKpJpd35d6', '', NULL, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, 'Demo Staff 2', 'staff2_9@example.com', '2024-06-08 15:57:22', '$2y$12$4AjSf/Z6uXQi0UXGzdehh.tK1uQTtRGk3R1WN7nC4x63RZQchKpJi', 'GqaYmpiwiiy3q9MPYJIXVDNcKY8KvNReXByL7ZeBhg5mgtCob3pGwdqOAEgr5TMy1D3CFgxyHjjdfbOM', '', NULL, '2024-06-08 15:57:22', '2024-06-08 15:57:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, 'Demo Staff 1', 'staff1_10@example.com', '2024-06-08 15:57:28', '$2y$12$ZjUNWJmwh/ZFfx5mIp/0uuTmLyOlGxAKM0vBAkcSIwlkGaU1EDlVa', 'E4W6PtieqxrL6H7tsVcmX7cuUgADBmN3g4ekZ9M5vuIAhH0XPI1DWjI0wzyfFKbpA4PIHxty4HSxDdrB', '', NULL, '2024-06-08 15:57:28', '2024-06-08 15:57:28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, 'Demo Staff 2', 'staff2_10@example.com', '2024-06-08 15:57:28', '$2y$12$.f1xclhUI7LSakMP55s4ZeXEeuUfjmdoNQOxkGNWHfbTDJgcN5LRm', 'rUXyio4nfrFPOZGQJTO2SYgptCkOPbIb8zREPgFfmWAlulhJjth6u00civU7iR7wtPwwPKWM6EWgcOaP', '', NULL, '2024-06-08 15:57:28', '2024-06-08 15:57:28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, 'Demo Staff 1', 'staff1_11@example.com', '2024-06-08 15:57:29', '$2y$12$aAXza/NCNGxVjHzWeM5GQujJyCCOzxcN3Rqr5wHtZteko0wDF6YVK', 'Gf82KuathwctyRyqs3oRFNXCdeUVFBFrKf8fnXcKgn4uameB36q9Pp0oPCGaxproadePKbVhORK6ss9G', '', NULL, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, NULL, 'Demo Staff 2', 'staff2_11@example.com', '2024-06-08 15:57:29', '$2y$12$PRyYSDWZIUdoxP8LxG7lgeZC/gGsLIDDAsJGRGFFB17zmQOphp6w2', 'COKBSxrZThdWDTLWdeVq3WfLApujwUkiBcn6qnZcjwDH6oOYK4WCwFEwc51AGv9gBpoAVUPUCoIMB5Xx', '', NULL, '2024-06-08 15:57:29', '2024-06-08 15:57:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, NULL, 'Demo Staff 1', 'staff1_12@example.com', '2024-06-08 15:57:31', '$2y$12$r5Wq5svr/hmvMrO86Ni.C.Y10gK.Gwj8YEPnnJST/8jn585EruhJ6', 'AV1JTZStRQnlTjJIqH34AASWvju9bTmHy2sszsq1b9CQ2m3UDpmx7xBs7UbCTNcaYB5Kuk6AWvyrCBis', '', NULL, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, NULL, 'Demo Staff 2', 'staff2_12@example.com', '2024-06-08 15:57:31', '$2y$12$q8wW1kfwHDSsgsMM36QBluVCoMSg5rfJ/n8lmqzdUTb3Q3dNKsooO', 'dQUqLOx9uYfe9krdUra32Rz1UsuBy5PlOkJCWfmHqnRW93B8fEHL8CZEEfjw0S3dGyOSAE1i45ewDJr1', '', NULL, '2024-06-08 15:57:31', '2024-06-08 15:57:31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, NULL, 'Demo Staff 1', 'staff1_13@example.com', '2024-06-08 15:57:39', '$2y$12$ge3/JTlA50CuOLSICN4/3.SdjLnAeKCsLYtlfVSu1B4EnnmZJgw/a', 'Cw4EAPHEMRjHQksyAEktYMtG9b6c69zEkcDqcYtfG7gNoR62bqM0DduVcPts9BEV4oNQN7ZiWu52beeG', '', NULL, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, NULL, 'Demo Staff 2', 'staff2_13@example.com', '2024-06-08 15:57:39', '$2y$12$ow1ZlLhPzIBsT2/Qb1cGeueclnjxu/oM39Qc2WYAmnpwZHbxjpK1q', 'izAdOsDmLZYQjZv5jrZw41aBY43O4TRxzoQJyIv3b9kxSjMb4K45hOuxtODurDE2l0a71gsfF8Betfpe', '', NULL, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, NULL, NULL, 'Demo Staff 1', 'staff1_14@example.com', '2024-06-08 15:57:46', '$2y$12$0EUE5JafyYiUmzVEI1ouSu.b2eZ2qk3INMB55DXfpjuwSjR1zrZK2', 'AKf4n38h5fQ6X7aEOsRpkJiC4rjkEX2aHAPdCihVyBTN2qDOXetJDlfZW6zneVf4e5ZYgxeSnXoAUfPM', '', NULL, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, NULL, 'Demo Staff 2', 'staff2_14@example.com', '2024-06-08 15:57:46', '$2y$12$wXCGOJRmzBTf0xkW9yuRUeFO7K4Wm/ATjgAcHof.EEaD4B2Keaut2', '6F0RF1s7jV4w1EQ8Zif6MEQ0PY9lSjCH6vaKAAdlZfGxr7rN1ohfASFDPcl3WT8sUzDM92kfOivBDYAg', '', NULL, '2024-06-08 15:57:46', '2024-06-08 15:57:46', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, NULL, 'Demo Staff 1', 'staff1_15@example.com', '2024-06-08 15:57:47', '$2y$12$IBT8cQGxkqDQjNM1JkMpzeREaLMXSBBlNCR19kuI8tq67LC0ocFVC', '1jlVEfHQsIvT95xu8sAZur9HfhKHH4Jyd4imDLJivnsywyLJFmA5qxWyVDX2U8rmQOhcFswGxcOyG2R5', '', NULL, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, NULL, NULL, 'Demo Staff 2', 'staff2_15@example.com', '2024-06-08 15:57:47', '$2y$12$jfb8mj43wFkYGvBjZdsOXOzVYewjgipbF8I6XP6VlJ86chl1txDqG', 'QW105sUPBmyPSteqRUa7jaQjk1k56v8t0yiu7IuAl1ljn0S1NM1RF9OFC2PWzBkQfbENtWst63Ohf7Er', '', NULL, '2024-06-08 15:57:47', '2024-06-08 15:57:47', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, NULL, NULL, 'Demo Staff 1', 'staff1_16@example.com', '2024-06-08 15:57:48', '$2y$12$PSaMUh6ZeFXOklFlJvBwaOJ1O7aRSJe6Xk4eAdA5hRRemZl3uRW8K', 'jzcT63xdcEyyfYOVACg5wpif0B6EDXgU2HMcfEiuMHBIDD6UHY3eWmUtF8mo948s010sKTQHpWfqBzLg', '', NULL, '2024-06-08 15:57:48', '2024-06-08 15:57:48', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, NULL, NULL, 'Demo Staff 2', 'staff2_16@example.com', '2024-06-08 15:57:48', '$2y$12$5npH5H017ApkloFMwTy/t.CMHHUyW9FzP56J0IQ7WAhNum4xoGfGK', 'jTlIItCU568ll7G82fJSBoqEN05tNUtn4D19QXrXcFwL9yz9wbMszuLyhtKdRou7X0T26ASwk0b2JWmU', '', NULL, '2024-06-08 15:57:48', '2024-06-08 15:57:48', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, NULL, NULL, 'SHAH JAHAN', 'anser@gmail.com', NULL, '$2y$12$tanOnNK6bPb3bmUQR.NVPuSUnuJh97lXMjkVRlZFSB.XaqQ94pAne', 'L8fPTIoH0hv6VqPr5vu1U1fI5gjlQjApC5UFTH2BzmDzKmHqsf4zVHnuF7AvNITaK4oGDf4gSEQTJdoP', '+31620875913', '6xl9IeYwQVQtPRBLmuucqFET1GOkAKeUhWNpbi2E1TtrSQqWcJAtRltYMhts', '2024-06-08 16:33:22', '2024-06-08 16:47:38', 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'set_by_admin', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(36, NULL, NULL, 'Kashif Khan', 'ka45962@gmail.com', NULL, '$2y$12$IZ6bohb9Miht6.791EHWN.zF2SFFICB4R7G0kKSPDyiZzTIhPGkKm', '5BUqsSGesCzsu9aA832A12XvRncQSeR0gy90blJEH44PtzMPIOrxrw2opY0hgsbE7g5B7ILbvCXs5bsF', '+923203822544', 'KV3bvKm16bR0P9lT4uKSNYVuvMc2IvE1EMIh7qyEb7a8Bn4UzG24lSg8Ckm0', '2024-06-19 11:52:58', '2024-06-19 12:07:53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(37, NULL, NULL, 'anser', 'dineat@gmail.com', NULL, '$2y$12$5S.cerJDCbbQe2.mJzx7reXt9pg57J./x0EzxBiK95fm1QVJyPBo2', 'zIsKTie1s7rueka4FjXxEAgQtUOOkuKuUAjkaJzLitdqzgasRlYUt5CUWfIx4yXsACvFHISwYN3WduCI', '+923305063900', NULL, '2024-06-26 22:09:11', '2024-06-26 22:09:11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(38, NULL, NULL, 'DiveInn', 'divein@gmail.com', NULL, '$2y$12$0rojBai7VdmjWZdKKzyh1.Pt/8Gu4t6HXovqm9cMd75y75Lg/f3zS', 'FUas0jg9LZlpCA53uUkDDQT9pTKhWuRC5b6ISxWITEqlHnJRypcOsZURKBUFjAnndU4Zg8A4bl129nvx', '+31612345678', NULL, '2024-06-26 22:55:00', '2024-06-26 22:55:01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(39, NULL, NULL, 'qwerty', 'qwerty@gmail.com', NULL, '$2y$12$s9F4T3RcGDU8mhRoJYVHnecwUxIkCTuaJK6TlyaIhVUFfU2TaytL.', 'lJ0GrNZbKAflvNGGLY0Y2mKtFLgRwMpElBCd5evQooDxPL4MnSLFkkOE5gpYkItHvV6T5hWUYVy4Dlsn', '+311231312313', NULL, '2024-06-27 00:22:49', '2024-06-27 00:22:51', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'group_1', NULL),
(40, NULL, NULL, 'poipoi', 'poipoi@gmail.com', NULL, '$2y$12$oj8cHqjMJgMkTkcGp5LinO8WWgCx6py5JQdmwl6OJET7Qtn5GWdcm', 'dltvSJh7goUs026UtgpxhKfY2bOsCofVLhmFY41uZipptVI5o7MekxR1MUIZcQywsOeYkUMTBo384X9Y', '+31321686812486', NULL, '2024-06-27 00:32:36', '2024-06-27 00:32:37', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(41, NULL, NULL, 'asdasd', 'testing00690@gmail.com', NULL, '$2y$12$.SSDer9lY47QUWDHrJoom.e8ZoR7WjcNUTXkOs3yQ3/hQ0qkLZX4y', '3VulsFpyueMgvl6UCsNugwNGLZ58bSJ4F9DyXPqPtobsHaaJ1HkjUdrM4ebx576MpykjTTPe0KPAxLmM', '+3112123123123', NULL, '2024-06-27 00:58:33', '2024-06-27 00:58:34', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(42, NULL, NULL, 'abcabcabc', 'abcabcabc@gmail.com', NULL, '$2y$12$QVTL5rFuiHWcyIk0i5TbtOFcuJqgqjtSP6/1s5lJrT5q.DACInuy.', 'BYGhqQzJjKLvPOasgXVrP0IgbugEB5kf3jc5qJtd5YLuzOWnRtayuqy1fpuVc5F7KVRNHfC3SKpM7fb0', '+31132212312', NULL, '2024-06-27 01:00:48', '2024-06-27 01:00:49', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(43, NULL, NULL, 'qazqaz', 'qazqaz@gmail.com', NULL, '$2y$12$amseUvGUykkWRPbffiwA.uTU9KVBkD8VzCVyscCnM.9k5TPMtktqS', '0ZgGExgHARBd94ngkauSqDEvaAT5GGpJQiP5atnGZcHPxauCCzvgVfyMd8LpwKmcHqnDgElEjDoVXKYE', '+3112312312231', NULL, '2024-06-27 01:10:29', '2024-06-27 15:26:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'set_by_admin', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(44, NULL, NULL, 'crystal', 'abcdef@gmail.com', '2024-06-27 01:27:33', '$2y$12$YcE8MaBKHWFDfHJaqFF7VuARCUd7Lyn1iSqmwthwFPfYPh1kiVsP.', 'Vi8CmkDknHbtTum6hJ4acz7pNby9qFqU0GIPbWBtcpERaSeuUWdItfE5qHHjTtGLsJRG062RUC9bFEdj', '', NULL, '2024-06-27 01:27:33', '2024-06-27 01:27:33', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(45, NULL, NULL, 'Anser Ishaq', 'anserishaq472@gmail.com', NULL, '$2y$12$p3i3y2GaVEnwhKYh9FTH..hl9TXixKRfqe1sd.PUYGYKMMFPKgLLK', 'aXvlK7DkPpoqLKDZSkfh15k0z3aTCIzrd8L2BG34OpwQz0LH3uzZcTvtT0igmcRfUdEAY0g6Mwfz8vbV', '03058589867', NULL, '2024-06-29 21:33:24', '2024-06-29 21:33:24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'group_4', NULL),
(46, NULL, NULL, 'dsfsdfsd', 'dfs@gmail.com', NULL, '$2y$12$FNZ12zWMHRwNBW3YqWg8n.B9kXazmI3Tqx7l5MDw1t3SmJ3zINQDW', 'aNNgQY3TkIVg8FgcOZANG30YgEWKPUAydkn7uvPmzvvfIq5q14dqqEES8kKc7MnoHr8FToxymReLajJ7', '03058589867', NULL, '2024-06-29 21:40:07', '2024-06-29 21:40:07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'group_3', NULL),
(47, NULL, NULL, 'qweqwe', 'qee@gmail.com', NULL, '$2y$12$U5c2iw/sImdkjvU0sc41T.d5r9jkMczmQIJAzzWgHd903rEqRRBuS', 'uiu6Z9FtZzlnl7rVFoy0wHfd4DY80ARlSH3DlTquo12bTotu4ANpOwvwjckCCiUafwquqoYhrxD5kzXp', '03058589867', NULL, '2024-06-29 21:45:10', '2024-06-29 21:45:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-06-29 21:45:29', NULL, NULL, NULL, NULL, 'group_1', NULL),
(48, NULL, NULL, 'rtrt', 'rtrt@gmail.com', NULL, '$2y$12$rBWDMu2AvLXLUH1uf/yX2.qBuWEn6C08dVJdBlZHZAgWre1/149wC', 'l8LUP4Khjl8sdytHs45YbbqfgzWibUA9dAQAR4uA6cF1xBxcQNetxoq10pM9zSlmsVeP2poGlD9EYK4i', '+313058589867', NULL, '2024-06-29 21:48:50', '2024-06-29 21:48:50', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'group_2', NULL),
(49, NULL, NULL, 'fffffffffff', 'fffffffffff@gms.vom', NULL, '$2y$12$5153ZtIEZHiNNGlGA241xOXoMnozBfhVzTofGJYR8OMpIEPspI59q', 'tfoQbRpRtcvlzvS4P8EKdaQMDUTMlBScyUE8qNStU4imgbz6skFuYGspR7tUhcaTHH5I1Ap2qVDMR523', '+312342423423', NULL, '2024-06-30 03:56:09', '2024-06-30 03:56:09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'group_3', NULL),
(50, NULL, NULL, 'jinx', 'jinx@gma.com', NULL, '$2y$12$.GnQfbieYBX98LNsutjcIedX8.uTLBkk.xvJJK5kPpogv/bRisMza', 'lFgMF4hAzoteEbEUlDZCziOAV4FT6gqK39pD3O215XXTBjlx6uGXT2svGQnjXlcTNV76xXvrEHgQbk46', '+311231231231', NULL, '2024-06-30 03:59:20', '2024-06-30 03:59:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(51, NULL, NULL, 'bomb', 'bomb@x.cx', NULL, '$2y$12$sv2JJqCdFud/2FIJ8Tsw0uELfrMcfoZnZYK4FWsIpn8O0ro2wOUui', 'uozMy7Jed8AeXvsSv692Ym8I3ti28vB9Qk5zivzBbpuTzrpVHdiyDUGF9cgjKCAs1cvNzjrPziGHrDkT', '+311231123123123', NULL, '2024-06-30 04:01:32', '2024-06-30 04:01:32', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Individual', NULL),
(52, NULL, NULL, 'usa', 'usa@gmai.com', NULL, '$2y$12$sMh.0pGxL8xk3qXvQ49D/OJ15TBeEyCkwQ/nSA0KwZt9MCRj9rQMW', 'j85P9N0gySfu8M3qipcEfNLBwsbEb18Ek82V5VuayPB3iWTfECc79dWHAMkP89rh2EKFIW5vgeHUH0DA', '+31123123123123', NULL, '2024-06-30 19:48:47', '2024-06-30 19:48:47', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'group_3', NULL),
(53, NULL, NULL, 'crystal', 'abcdef@gmail.com', '2024-07-02 20:39:13', '$2y$12$Dt12INDGBf6pKVoRGPgBGu3qxUzuJ.vWGBIP7muUt0DZ4L6kGbFHe', 'zcH9EFV59Hf9QYSqh7126PZUFnRHs1wjRYU9iXNvNjVetkexGrKbKb1AXsSNJmc8fhT4MHzque4PM5Dt', '', NULL, '2024-07-02 20:39:13', '2024-07-02 20:39:13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, NULL, NULL, 'KmAs', 'kmas@mailinator.com', NULL, '$2y$12$8npgoIo/9uN2Xno9W0akquGPP8vDAg82d.1Jxy46QjZJg1CyjqE3S', 'qfCvnXgfkyxIttocd8mHIvzlsmJ5XXbaZEo5PZ3Z30gewWc9guUSGPPhnUONceK6hawCS1jNMv0HDlcY', '+19744464978', NULL, '2024-07-20 13:45:26', '2024-08-23 13:28:42', 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'set_by_admin', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-08-23 13:28:42', NULL, NULL, NULL, NULL, 'group_1', NULL),
(55, NULL, NULL, 'KmAs Hoshi', '', NULL, NULL, '', NULL, NULL, '2024-07-28 07:52:45', '2024-07-28 07:52:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, NULL, NULL, 'Aamir', 'Jkt18b9CDeexample.com', NULL, 'eyJpdiI6IjZQSDNiTGpwWmNsUVdFeVI3MkdiSmc9PSIsInZhbHVlIjoiYmE2WG9Sd1hINjFMOHc2WW9iOHNWV2dVdnFkcFpXdVdjUVZtT29BeUxBUT0iLCJtYWMiOiJhZDc5NjNiOTY2ODJkNGNmNTdhYWM2Nzk5ZGU1MjViMTQ5MWQxOWE2NzdjODZlZTY', 'hXpMJ9SSqgE5KnyNWQB4t3cn5QkTLLzCiTwcTATqM6SUWRwdMQVBSVDFedM5lZFMVqbVDJWZ9UlkSHF6', NULL, NULL, '2024-08-02 06:02:40', '2024-08-02 06:02:40', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, NULL, NULL, 'Aamir', 'OePpo74iTCexample.com', NULL, 'eyJpdiI6InUxMG9Xazlwb0E1eUk2dktHSVRUQWc9PSIsInZhbHVlIjoiSEdiZlFZdHRPUm53S3lEVTJvVTgyVFcwckttSmQvMFkxMjlHYkNrU0ZXUT0iLCJtYWMiOiIxZDk1MTdiOTFlNDhmN2I4NDA3NGQ5MTA5M2NhNGNhODMwOWE5ZTI1ZTJjYjg5NjN', 'iFz0fiXp5CmOnhMJenwKm1pmQWsjpG7lFVOMbQQreTwsoozgqgZ1djzLasUHRIqkm7DJC3ezIjL9IJhi', NULL, NULL, '2024-08-02 06:27:53', '2024-08-02 06:27:53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, NULL, NULL, 'Aamir', 'myemail@gmail.com', NULL, 'eyJpdiI6IlBHU1dnNFd0RHNDeWVLRXFFWmVsbkE9PSIsInZhbHVlIjoiMFFyREo3anRGdk9obnFnR1JuWTBraTVRb01VaXNrOCtySkJkT1BJV1dKUT0iLCJtYWMiOiI5MjgyZGI5OTkxODgwMGFjNzc4ZGM4ZjFkYzE4NGM5MDUyMDY2YzlkMzUyN2ZhM2Q', 'SbjaxEshUzo8Zi9XMC4SKEmZ2j3fnsxqoEJrJv072XTFzhBrby7xxgHj5C3J8BLWD9OURnlLZFJax8eJ', NULL, NULL, '2024-08-02 06:37:30', '2024-08-02 06:40:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, NULL, NULL, 'Aamir', 'LKChyxpA7Aexample.com', NULL, 'eyJpdiI6IjhZU2IwcERZenRKdWVUb0xYOHVIcEE9PSIsInZhbHVlIjoiZEFqc3lKdzllM3RKbzVBN0F4a0hEcUpKaFBUZ055U1BwVnpSZENwRjhjQT0iLCJtYWMiOiIwN2M1M2ExZmZmMTg0ZmVjNjZiZTg1NDc4Y2U2NmQ0MTQyZDRhOWQyZjlkMDBiNjM', 'kAeDYnaPoaAy6aFpAM2MxS2yMlESl7IUIKkogt5BSUEyYU6HkP33lr4ATquUBGn8Z2axxIlEL3TLOOho', NULL, NULL, '2024-08-18 10:27:58', '2024-08-18 10:27:58', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, NULL, NULL, 'Hedley Rogers', 'catobemel@mailinator.com', NULL, '$2y$12$bqCNQvxD6ob977MV8uSXxO/vekLm1IER6js3j4.fBbQajjS/K4bay', 'SL4Kuz9xKboW4HsWwJzJBy0KpD1zaUdAIPvbP4XGtiKlipBCvN8iJMI3FGixnc4qOM3ooA1epdLfKROo', '+19632414367', NULL, '2024-08-23 13:43:07', '2024-08-27 18:23:15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-08-27 18:23:15', NULL, NULL, NULL, NULL, 'group_2', NULL),
(61, NULL, NULL, 'Phillip Mercer', 'gezeza@mailinator.com', NULL, '$2y$12$296T6gSZf/LbvI8fe0rE2.UTB/01Pqd2gJxnTRUbiQr7MuXy3grp6', 'lNCPbx6n4E7LDyIO61bjLQRpk4IkiQvdg2z23hQNfxD1dadgtdlgsGSLo0vigwSAQqzOVTR8RL9uJ4fB', '+13417665048', NULL, '2024-08-25 12:13:05', '2024-08-27 18:23:09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-08-27 18:23:09', NULL, NULL, NULL, NULL, 'Individual', NULL),
(62, NULL, NULL, 'Test', 'rentgroprop@gmail.com', NULL, 'eyJpdiI6IlpDQUdXeGR0YUVFU1NkZEpXK2hjUUE9PSIsInZhbHVlIjoiMXVtRVVPdkM5ejczd3Z6bmtoK0NOTVFjZ3M3WFJBTWdHVHpMNGoxTlBmST0iLCJtYWMiOiI3Y2I1ZWEzNjljNjJkM2JkNWI1OWJiNzA0ZDVkNjFiYTVmZWYwNjZiZjI4YTg4N2E', 'Qm21XE1cKMPvOdGyS9NC3aESyGdM7bknruliNeHJ6OBSPLLUfPFws8qH9s53IYyOcEcIwWMNtCfd7ADs', NULL, NULL, '2024-08-28 21:24:15', '2024-08-28 22:02:56', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, NULL, NULL, 'Test', 'WXBXGrg8Ynexample.com', NULL, 'eyJpdiI6Ik05RnVLUDVTR3J6ZEFJOGRzbHM0QWc9PSIsInZhbHVlIjoiTGNHdWZlTm16MHlac3J4YkVHai9UQ3h1S1pBaFVDaHZCOFloZnBNOGRjRT0iLCJtYWMiOiJjYTJmNDgwMWI4NzkzNjk4Nzg4OTkzZGNmMWNhYzA5NTY2Mzc1YjFmNmRiZDBmNTE', 'Kg3obHPZ37UenzhuBhFoFdFnWqFkGGrSMkdZ4YyqKazHeTXzu603ekYNWS1tWGTzCR7uyBCF4oMPOXAc', NULL, NULL, '2024-08-28 22:13:09', '2024-08-28 22:13:09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, NULL, NULL, 'Test', 'rentgroprop@gmail.com', NULL, 'eyJpdiI6ImRKSGU3QU1la1grNGErL1lESGJxRGc9PSIsInZhbHVlIjoiSjJqb2NZZ3FwUzBJcGlVYWV4R2NEcjRNeEdFaDZJc2g2ZkNtL1k2SDNvZz0iLCJtYWMiOiI1MzhjOTQyODBiNjRmODNkNDAzNzE4ODFhNGE1NDA5NzQzMmE2ZjU0NDg3MTA2YjN', '40JOnnl5juvSSY3d3QNSsIAyHFhz0UBNZ9o1b2RgKaZFHpYEDfpe1XtNJqQqLE9zCBdTIst1DYYM8Lzx', NULL, NULL, '2024-08-29 12:39:26', '2024-08-29 13:00:06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, NULL, NULL, 'Anser', 'QHMUF4rvokexample.com', NULL, 'eyJpdiI6ImFueTlXc0xZUCtTOG1SdkhiYzlQM2c9PSIsInZhbHVlIjoiVHY1c25QU2l3dlY3V1RTNHZvblc5VDdXcEVsdVlBbkx2OXYrNnFub3lBTT0iLCJtYWMiOiI5YmFjYWQ3OGUzM2EyNjhiNGRjNTQ2NzM2ZjhhYTA0ZGQ2ZmFmYzQzYTUwYWFiM2Y', 'rtHJEmlFVMfJkfMr4G2zpeRQvVXZQxyajsejI0UDofROpXXZ1AQZEyodYMY03nIWfu7B5rlNrtisrVqa', NULL, NULL, '2024-08-29 17:20:48', '2024-08-29 17:20:48', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, NULL, NULL, 'Ahsan', '3urDK57cCmexample.com', NULL, 'eyJpdiI6ImttUkdLTk5ycU44aENFaTJYamNnOWc9PSIsInZhbHVlIjoiTkxGZmpZVlBJK2dJNkN1VDJkV0JqMVdMR2xnSkxiQ3VYRk54QllucWF3MD0iLCJtYWMiOiI5ODY2Y2E4MzE0MTVkNDQ5YWJhMDNlZWY3ZWY0MjUyNmI4M2I2NWM4MDNhZWViNzI', 'pgddQrMZYeMKgv6N1EyoyiUbzD9EIeDfKwbdQ3hwDCsiChTuZVGf0YJrpVPGojLCqe4jP9zRuwqjjuib', NULL, NULL, '2024-08-29 17:25:15', '2024-08-29 17:25:15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, NULL, NULL, 'Blayne', 'ui4BJWbDraexample.com', NULL, 'eyJpdiI6IlNCK3NHcHNpQ2pvTFRlT29zaDJxY3c9PSIsInZhbHVlIjoiTjJLOG9laXZqWWtBcFh5TEh0aWtDeHNuMmFiQU0vTWVObmc3Q0VyMitnMD0iLCJtYWMiOiJlMTJkZTQ1NDY3N2UxNDgzMjY0NjEzM2JiNWYzZGVmYzhkZGFiZDE5OGFlMGVlZWF', 'BSduu3haDL1zloHaUz9L1jeej3bOTWWkUFmYabFhPMwxOBGPHZu13viXxMKqUrVlAE14JQwegYECuQPt', NULL, NULL, '2024-08-29 23:55:27', '2024-08-29 23:55:27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, NULL, NULL, 'Arnold Nkosi', 'H4eFMpbS5Texample.com', NULL, 'eyJpdiI6Ik1qOERSYUV5eExCZ3Btai9ORUJsOGc9PSIsInZhbHVlIjoid2N0c3VlTFhld1dHWDAwYVkzc3BLMnBMRzhnUkwvZXgvcGZFQkE1bFIydz0iLCJtYWMiOiI3NzFhMTIzMTA1ZmU0OThkYWI2NjllZDM5M2ZjYzIwNzNhMmIwZjBhMmQ5NTE5ZGZ', '6Zm2CbSw6WlyXVbHgiVRFXCKQYfX3TRm0FIsgiR9m2m0hl2yQQ11SxcbwM4nH9b5BO1QtNAF3LA8bJ9f', NULL, NULL, '2024-08-30 18:27:11', '2024-08-30 18:27:11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_categories`
--

CREATE TABLE `user_has_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `options` varchar(500) NOT NULL,
  `image` varchar(191) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `enable_qty` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_system` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `price`, `options`, `image`, `qty`, `enable_qty`, `order`, `item_id`, `created_at`, `updated_at`, `deleted_at`, `is_system`) VALUES
(1, 10.99, '{\"1\":\"small\",\"2\":\"hand-tosset\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(2, 11.99, '{\"1\":\"small\",\"2\":\"thin-crust\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(3, 12.99, '{\"1\":\"small\",\"2\":\"double-decker\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(4, 13.99, '{\"1\":\"medium\",\"2\":\"hand-tosset\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(5, 14.99, '{\"1\":\"medium\",\"2\":\"thin-crust\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(6, 15.99, '{\"1\":\"medium\",\"2\":\"double-decker\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(7, 16.99, '{\"1\":\"large\",\"2\":\"hand-tosset\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(8, 17.99, '{\"1\":\"large\",\"2\":\"thin-crust\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(9, 18.99, '{\"1\":\"large\",\"2\":\"double-decker\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(10, 19.99, '{\"1\":\"family\",\"2\":\"hand-tosset\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(11, 20.99, '{\"1\":\"family\",\"2\":\"thin-crust\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(12, 21.99, '{\"1\":\"family\",\"2\":\"double-decker\"}', '', 0, 0, 0, 7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(13, 14.99, '{\"3\":\"small\",\"4\":\"hand-tosset\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(14, 15.99, '{\"3\":\"small\",\"4\":\"thin-crust\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(15, 16.99, '{\"3\":\"small\",\"4\":\"double-decker\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(16, 17.99, '{\"3\":\"medium\",\"4\":\"hand-tosset\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:53', '2024-06-08 15:56:53', NULL, 0),
(17, 18.99, '{\"3\":\"medium\",\"4\":\"thin-crust\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(18, 19.99, '{\"3\":\"medium\",\"4\":\"double-decker\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(19, 20.99, '{\"3\":\"large\",\"4\":\"hand-tosset\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(20, 21.99, '{\"3\":\"large\",\"4\":\"thin-crust\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(21, 22.99, '{\"3\":\"large\",\"4\":\"double-decker\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(22, 23.99, '{\"3\":\"family\",\"4\":\"hand-tosset\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(23, 24.99, '{\"3\":\"family\",\"4\":\"thin-crust\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(24, 25.99, '{\"3\":\"family\",\"4\":\"double-decker\"}', '', 0, 0, 0, 8, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(25, 14.99, '{\"5\":\"small\",\"6\":\"hand-tosset\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(26, 15.99, '{\"5\":\"small\",\"6\":\"thin-crust\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(27, 16.99, '{\"5\":\"small\",\"6\":\"double-decker\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(28, 17.99, '{\"5\":\"medium\",\"6\":\"hand-tosset\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(29, 18.99, '{\"5\":\"medium\",\"6\":\"thin-crust\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(30, 19.99, '{\"5\":\"medium\",\"6\":\"double-decker\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(31, 20.99, '{\"5\":\"large\",\"6\":\"hand-tosset\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(32, 21.99, '{\"5\":\"large\",\"6\":\"thin-crust\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(33, 22.99, '{\"5\":\"large\",\"6\":\"double-decker\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(34, 23.99, '{\"5\":\"family\",\"6\":\"hand-tosset\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(35, 24.99, '{\"5\":\"family\",\"6\":\"thin-crust\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(36, 25.99, '{\"5\":\"family\",\"6\":\"double-decker\"}', '', 0, 0, 0, 9, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(37, 14.99, '{\"7\":\"small\",\"8\":\"hand-tosset\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(38, 15.99, '{\"7\":\"small\",\"8\":\"thin-crust\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(39, 16.99, '{\"7\":\"small\",\"8\":\"double-decker\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(40, 17.99, '{\"7\":\"medium\",\"8\":\"hand-tosset\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(41, 18.99, '{\"7\":\"medium\",\"8\":\"thin-crust\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(42, 19.99, '{\"7\":\"medium\",\"8\":\"double-decker\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(43, 20.99, '{\"7\":\"large\",\"8\":\"hand-tosset\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(44, 21.99, '{\"7\":\"large\",\"8\":\"thin-crust\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(45, 22.99, '{\"7\":\"large\",\"8\":\"double-decker\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(46, 23.99, '{\"7\":\"family\",\"8\":\"hand-tosset\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(47, 24.99, '{\"7\":\"family\",\"8\":\"thin-crust\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:54', '2024-06-08 15:56:54', NULL, 0),
(48, 25.99, '{\"7\":\"family\",\"8\":\"double-decker\"}', '', 0, 0, 0, 10, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(49, 14.99, '{\"9\":\"small\",\"10\":\"hand-tosset\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(50, 15.99, '{\"9\":\"small\",\"10\":\"thin-crust\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(51, 16.99, '{\"9\":\"small\",\"10\":\"double-decker\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(52, 17.99, '{\"9\":\"medium\",\"10\":\"hand-tosset\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(53, 18.99, '{\"9\":\"medium\",\"10\":\"thin-crust\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(54, 19.99, '{\"9\":\"medium\",\"10\":\"double-decker\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(55, 20.99, '{\"9\":\"large\",\"10\":\"hand-tosset\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(56, 21.99, '{\"9\":\"large\",\"10\":\"thin-crust\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(57, 22.99, '{\"9\":\"large\",\"10\":\"double-decker\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(58, 23.99, '{\"9\":\"family\",\"10\":\"hand-tosset\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(59, 24.99, '{\"9\":\"family\",\"10\":\"thin-crust\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(60, 25.99, '{\"9\":\"family\",\"10\":\"double-decker\"}', '', 0, 0, 0, 11, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(61, 14.99, '{\"11\":\"small\",\"12\":\"hand-tosset\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(62, 15.99, '{\"11\":\"small\",\"12\":\"thin-crust\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(63, 16.99, '{\"11\":\"small\",\"12\":\"double-decker\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(64, 17.99, '{\"11\":\"medium\",\"12\":\"hand-tosset\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(65, 18.99, '{\"11\":\"medium\",\"12\":\"thin-crust\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(66, 19.99, '{\"11\":\"medium\",\"12\":\"double-decker\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(67, 20.99, '{\"11\":\"large\",\"12\":\"hand-tosset\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(68, 21.99, '{\"11\":\"large\",\"12\":\"thin-crust\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(69, 22.99, '{\"11\":\"large\",\"12\":\"double-decker\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(70, 23.99, '{\"11\":\"family\",\"12\":\"hand-tosset\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(71, 24.99, '{\"11\":\"family\",\"12\":\"thin-crust\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(72, 25.99, '{\"11\":\"family\",\"12\":\"double-decker\"}', '', 0, 0, 0, 12, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(73, 10.49, '{\"13\":\"small\",\"14\":\"hand-tosset\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:55', '2024-06-08 15:56:55', NULL, 0),
(74, 11.49, '{\"13\":\"small\",\"14\":\"thin-crust\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(75, 12.49, '{\"13\":\"small\",\"14\":\"double-decker\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(76, 13.49, '{\"13\":\"medium\",\"14\":\"hand-tosset\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(77, 14.49, '{\"13\":\"medium\",\"14\":\"thin-crust\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(78, 15.49, '{\"13\":\"medium\",\"14\":\"double-decker\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(79, 16.49, '{\"13\":\"large\",\"14\":\"hand-tosset\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(80, 17.49, '{\"13\":\"large\",\"14\":\"thin-crust\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(81, 18.49, '{\"13\":\"large\",\"14\":\"double-decker\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(82, 19.49, '{\"13\":\"family\",\"14\":\"hand-tosset\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(83, 20.49, '{\"13\":\"family\",\"14\":\"thin-crust\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(84, 21.49, '{\"13\":\"family\",\"14\":\"double-decker\"}', '', 0, 0, 0, 13, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(85, 39.99, '{\"15\":\"small\",\"16\":\"hand-tosset\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(86, 40.99, '{\"15\":\"small\",\"16\":\"thin-crust\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(87, 41.99, '{\"15\":\"small\",\"16\":\"double-decker\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(88, 42.99, '{\"15\":\"medium\",\"16\":\"hand-tosset\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(89, 43.99, '{\"15\":\"medium\",\"16\":\"thin-crust\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(90, 44.99, '{\"15\":\"medium\",\"16\":\"double-decker\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(91, 45.99, '{\"15\":\"large\",\"16\":\"hand-tosset\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(92, 46.99, '{\"15\":\"large\",\"16\":\"thin-crust\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(93, 47.99, '{\"15\":\"large\",\"16\":\"double-decker\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(94, 48.99, '{\"15\":\"family\",\"16\":\"hand-tosset\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(95, 49.99, '{\"15\":\"family\",\"16\":\"thin-crust\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(96, 50.99, '{\"15\":\"family\",\"16\":\"double-decker\"}', '', 0, 0, 0, 14, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(97, 14.99, '{\"17\":\"small\",\"18\":\"hand-tosset\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(98, 15.99, '{\"17\":\"small\",\"18\":\"thin-crust\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(99, 16.99, '{\"17\":\"small\",\"18\":\"double-decker\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(100, 17.99, '{\"17\":\"medium\",\"18\":\"hand-tosset\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(101, 18.99, '{\"17\":\"medium\",\"18\":\"thin-crust\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(102, 19.99, '{\"17\":\"medium\",\"18\":\"double-decker\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(103, 20.99, '{\"17\":\"large\",\"18\":\"hand-tosset\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(104, 21.99, '{\"17\":\"large\",\"18\":\"thin-crust\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(105, 22.99, '{\"17\":\"large\",\"18\":\"double-decker\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(106, 23.99, '{\"17\":\"family\",\"18\":\"hand-tosset\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(107, 24.99, '{\"17\":\"family\",\"18\":\"thin-crust\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(108, 25.99, '{\"17\":\"family\",\"18\":\"double-decker\"}', '', 0, 0, 0, 15, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(109, 14.99, '{\"19\":\"small\",\"20\":\"hand-tosset\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:56', '2024-06-08 15:56:56', NULL, 0),
(110, 15.99, '{\"19\":\"small\",\"20\":\"thin-crust\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(111, 16.99, '{\"19\":\"small\",\"20\":\"double-decker\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(112, 17.99, '{\"19\":\"medium\",\"20\":\"hand-tosset\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(113, 18.99, '{\"19\":\"medium\",\"20\":\"thin-crust\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(114, 19.99, '{\"19\":\"medium\",\"20\":\"double-decker\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(115, 20.99, '{\"19\":\"large\",\"20\":\"hand-tosset\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(116, 21.99, '{\"19\":\"large\",\"20\":\"thin-crust\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(117, 22.99, '{\"19\":\"large\",\"20\":\"double-decker\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(118, 23.99, '{\"19\":\"family\",\"20\":\"hand-tosset\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(119, 24.99, '{\"19\":\"family\",\"20\":\"thin-crust\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(120, 25.99, '{\"19\":\"family\",\"20\":\"double-decker\"}', '', 0, 0, 0, 16, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(121, 14.99, '{\"21\":\"small\",\"22\":\"hand-tosset\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(122, 15.99, '{\"21\":\"small\",\"22\":\"thin-crust\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(123, 16.99, '{\"21\":\"small\",\"22\":\"double-decker\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(124, 17.99, '{\"21\":\"medium\",\"22\":\"hand-tosset\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(125, 18.99, '{\"21\":\"medium\",\"22\":\"thin-crust\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(126, 19.99, '{\"21\":\"medium\",\"22\":\"double-decker\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(127, 20.99, '{\"21\":\"large\",\"22\":\"hand-tosset\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(128, 21.99, '{\"21\":\"large\",\"22\":\"thin-crust\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(129, 22.99, '{\"21\":\"large\",\"22\":\"double-decker\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(130, 23.99, '{\"21\":\"family\",\"22\":\"hand-tosset\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(131, 24.99, '{\"21\":\"family\",\"22\":\"thin-crust\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(132, 25.99, '{\"21\":\"family\",\"22\":\"double-decker\"}', '', 0, 0, 0, 17, '2024-06-08 15:56:57', '2024-06-08 15:56:57', NULL, 0),
(133, 10.99, '{\"23\":\"small\",\"24\":\"hand-tosset\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(134, 11.99, '{\"23\":\"small\",\"24\":\"thin-crust\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(135, 12.99, '{\"23\":\"small\",\"24\":\"double-decker\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(136, 13.99, '{\"23\":\"medium\",\"24\":\"hand-tosset\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(137, 14.99, '{\"23\":\"medium\",\"24\":\"thin-crust\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(138, 15.99, '{\"23\":\"medium\",\"24\":\"double-decker\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(139, 16.99, '{\"23\":\"large\",\"24\":\"hand-tosset\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(140, 17.99, '{\"23\":\"large\",\"24\":\"thin-crust\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(141, 18.99, '{\"23\":\"large\",\"24\":\"double-decker\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(142, 19.99, '{\"23\":\"family\",\"24\":\"hand-tosset\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(143, 20.99, '{\"23\":\"family\",\"24\":\"thin-crust\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(144, 21.99, '{\"23\":\"family\",\"24\":\"double-decker\"}', '', 0, 0, 0, 67, '2024-06-08 15:57:01', '2024-06-08 15:57:01', NULL, 0),
(145, 14.99, '{\"25\":\"small\",\"26\":\"hand-tosset\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(146, 15.99, '{\"25\":\"small\",\"26\":\"thin-crust\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(147, 16.99, '{\"25\":\"small\",\"26\":\"double-decker\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(148, 17.99, '{\"25\":\"medium\",\"26\":\"hand-tosset\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(149, 18.99, '{\"25\":\"medium\",\"26\":\"thin-crust\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(150, 19.99, '{\"25\":\"medium\",\"26\":\"double-decker\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(151, 20.99, '{\"25\":\"large\",\"26\":\"hand-tosset\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(152, 21.99, '{\"25\":\"large\",\"26\":\"thin-crust\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(153, 22.99, '{\"25\":\"large\",\"26\":\"double-decker\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(154, 23.99, '{\"25\":\"family\",\"26\":\"hand-tosset\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(155, 24.99, '{\"25\":\"family\",\"26\":\"thin-crust\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:02', '2024-06-08 15:57:02', NULL, 0),
(156, 25.99, '{\"25\":\"family\",\"26\":\"double-decker\"}', '', 0, 0, 0, 68, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(157, 14.99, '{\"27\":\"small\",\"28\":\"hand-tosset\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(158, 15.99, '{\"27\":\"small\",\"28\":\"thin-crust\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(159, 16.99, '{\"27\":\"small\",\"28\":\"double-decker\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(160, 17.99, '{\"27\":\"medium\",\"28\":\"hand-tosset\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(161, 18.99, '{\"27\":\"medium\",\"28\":\"thin-crust\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(162, 19.99, '{\"27\":\"medium\",\"28\":\"double-decker\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(163, 20.99, '{\"27\":\"large\",\"28\":\"hand-tosset\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(164, 21.99, '{\"27\":\"large\",\"28\":\"thin-crust\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(165, 22.99, '{\"27\":\"large\",\"28\":\"double-decker\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(166, 23.99, '{\"27\":\"family\",\"28\":\"hand-tosset\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:03', '2024-06-08 15:57:03', NULL, 0),
(167, 24.99, '{\"27\":\"family\",\"28\":\"thin-crust\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(168, 25.99, '{\"27\":\"family\",\"28\":\"double-decker\"}', '', 0, 0, 0, 69, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(169, 14.99, '{\"29\":\"small\",\"30\":\"hand-tosset\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(170, 15.99, '{\"29\":\"small\",\"30\":\"thin-crust\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(171, 16.99, '{\"29\":\"small\",\"30\":\"double-decker\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(172, 17.99, '{\"29\":\"medium\",\"30\":\"hand-tosset\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(173, 18.99, '{\"29\":\"medium\",\"30\":\"thin-crust\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(174, 19.99, '{\"29\":\"medium\",\"30\":\"double-decker\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(175, 20.99, '{\"29\":\"large\",\"30\":\"hand-tosset\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(176, 21.99, '{\"29\":\"large\",\"30\":\"thin-crust\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(177, 22.99, '{\"29\":\"large\",\"30\":\"double-decker\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(178, 23.99, '{\"29\":\"family\",\"30\":\"hand-tosset\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(179, 24.99, '{\"29\":\"family\",\"30\":\"thin-crust\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(180, 25.99, '{\"29\":\"family\",\"30\":\"double-decker\"}', '', 0, 0, 0, 70, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(181, 14.99, '{\"31\":\"small\",\"32\":\"hand-tosset\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(182, 15.99, '{\"31\":\"small\",\"32\":\"thin-crust\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(183, 16.99, '{\"31\":\"small\",\"32\":\"double-decker\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(184, 17.99, '{\"31\":\"medium\",\"32\":\"hand-tosset\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(185, 18.99, '{\"31\":\"medium\",\"32\":\"thin-crust\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(186, 19.99, '{\"31\":\"medium\",\"32\":\"double-decker\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(187, 20.99, '{\"31\":\"large\",\"32\":\"hand-tosset\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(188, 21.99, '{\"31\":\"large\",\"32\":\"thin-crust\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(189, 22.99, '{\"31\":\"large\",\"32\":\"double-decker\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(190, 23.99, '{\"31\":\"family\",\"32\":\"hand-tosset\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(191, 24.99, '{\"31\":\"family\",\"32\":\"thin-crust\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(192, 25.99, '{\"31\":\"family\",\"32\":\"double-decker\"}', '', 0, 0, 0, 71, '2024-06-08 15:57:04', '2024-06-08 15:57:04', NULL, 0),
(193, 14.99, '{\"33\":\"small\",\"34\":\"hand-tosset\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(194, 15.99, '{\"33\":\"small\",\"34\":\"thin-crust\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(195, 16.99, '{\"33\":\"small\",\"34\":\"double-decker\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(196, 17.99, '{\"33\":\"medium\",\"34\":\"hand-tosset\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(197, 18.99, '{\"33\":\"medium\",\"34\":\"thin-crust\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(198, 19.99, '{\"33\":\"medium\",\"34\":\"double-decker\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(199, 20.99, '{\"33\":\"large\",\"34\":\"hand-tosset\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(200, 21.99, '{\"33\":\"large\",\"34\":\"thin-crust\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(201, 22.99, '{\"33\":\"large\",\"34\":\"double-decker\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(202, 23.99, '{\"33\":\"family\",\"34\":\"hand-tosset\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(203, 24.99, '{\"33\":\"family\",\"34\":\"thin-crust\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(204, 25.99, '{\"33\":\"family\",\"34\":\"double-decker\"}', '', 0, 0, 0, 72, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(205, 10.49, '{\"35\":\"small\",\"36\":\"hand-tosset\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(206, 11.49, '{\"35\":\"small\",\"36\":\"thin-crust\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(207, 12.49, '{\"35\":\"small\",\"36\":\"double-decker\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(208, 13.49, '{\"35\":\"medium\",\"36\":\"hand-tosset\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(209, 14.49, '{\"35\":\"medium\",\"36\":\"thin-crust\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(210, 15.49, '{\"35\":\"medium\",\"36\":\"double-decker\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(211, 16.49, '{\"35\":\"large\",\"36\":\"hand-tosset\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(212, 17.49, '{\"35\":\"large\",\"36\":\"thin-crust\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(213, 18.49, '{\"35\":\"large\",\"36\":\"double-decker\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(214, 19.49, '{\"35\":\"family\",\"36\":\"hand-tosset\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(215, 20.49, '{\"35\":\"family\",\"36\":\"thin-crust\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(216, 21.49, '{\"35\":\"family\",\"36\":\"double-decker\"}', '', 0, 0, 0, 73, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(217, 39.99, '{\"37\":\"small\",\"38\":\"hand-tosset\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(218, 40.99, '{\"37\":\"small\",\"38\":\"thin-crust\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(219, 41.99, '{\"37\":\"small\",\"38\":\"double-decker\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(220, 42.99, '{\"37\":\"medium\",\"38\":\"hand-tosset\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(221, 43.99, '{\"37\":\"medium\",\"38\":\"thin-crust\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(222, 44.99, '{\"37\":\"medium\",\"38\":\"double-decker\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(223, 45.99, '{\"37\":\"large\",\"38\":\"hand-tosset\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:05', '2024-06-08 15:57:05', NULL, 0),
(224, 46.99, '{\"37\":\"large\",\"38\":\"thin-crust\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(225, 47.99, '{\"37\":\"large\",\"38\":\"double-decker\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(226, 48.99, '{\"37\":\"family\",\"38\":\"hand-tosset\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(227, 49.99, '{\"37\":\"family\",\"38\":\"thin-crust\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(228, 50.99, '{\"37\":\"family\",\"38\":\"double-decker\"}', '', 0, 0, 0, 74, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(229, 14.99, '{\"39\":\"small\",\"40\":\"hand-tosset\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(230, 15.99, '{\"39\":\"small\",\"40\":\"thin-crust\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(231, 16.99, '{\"39\":\"small\",\"40\":\"double-decker\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(232, 17.99, '{\"39\":\"medium\",\"40\":\"hand-tosset\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(233, 18.99, '{\"39\":\"medium\",\"40\":\"thin-crust\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(234, 19.99, '{\"39\":\"medium\",\"40\":\"double-decker\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(235, 20.99, '{\"39\":\"large\",\"40\":\"hand-tosset\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(236, 21.99, '{\"39\":\"large\",\"40\":\"thin-crust\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(237, 22.99, '{\"39\":\"large\",\"40\":\"double-decker\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(238, 23.99, '{\"39\":\"family\",\"40\":\"hand-tosset\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(239, 24.99, '{\"39\":\"family\",\"40\":\"thin-crust\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(240, 25.99, '{\"39\":\"family\",\"40\":\"double-decker\"}', '', 0, 0, 0, 75, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(241, 14.99, '{\"41\":\"small\",\"42\":\"hand-tosset\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(242, 15.99, '{\"41\":\"small\",\"42\":\"thin-crust\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(243, 16.99, '{\"41\":\"small\",\"42\":\"double-decker\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(244, 17.99, '{\"41\":\"medium\",\"42\":\"hand-tosset\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(245, 18.99, '{\"41\":\"medium\",\"42\":\"thin-crust\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(246, 19.99, '{\"41\":\"medium\",\"42\":\"double-decker\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(247, 20.99, '{\"41\":\"large\",\"42\":\"hand-tosset\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(248, 21.99, '{\"41\":\"large\",\"42\":\"thin-crust\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(249, 22.99, '{\"41\":\"large\",\"42\":\"double-decker\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(250, 23.99, '{\"41\":\"family\",\"42\":\"hand-tosset\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(251, 24.99, '{\"41\":\"family\",\"42\":\"thin-crust\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(252, 25.99, '{\"41\":\"family\",\"42\":\"double-decker\"}', '', 0, 0, 0, 76, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(253, 14.99, '{\"43\":\"small\",\"44\":\"hand-tosset\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:06', '2024-06-08 15:57:06', NULL, 0),
(254, 15.99, '{\"43\":\"small\",\"44\":\"thin-crust\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(255, 16.99, '{\"43\":\"small\",\"44\":\"double-decker\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(256, 17.99, '{\"43\":\"medium\",\"44\":\"hand-tosset\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(257, 18.99, '{\"43\":\"medium\",\"44\":\"thin-crust\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(258, 19.99, '{\"43\":\"medium\",\"44\":\"double-decker\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(259, 20.99, '{\"43\":\"large\",\"44\":\"hand-tosset\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(260, 21.99, '{\"43\":\"large\",\"44\":\"thin-crust\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(261, 22.99, '{\"43\":\"large\",\"44\":\"double-decker\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(262, 23.99, '{\"43\":\"family\",\"44\":\"hand-tosset\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(263, 24.99, '{\"43\":\"family\",\"44\":\"thin-crust\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(264, 25.99, '{\"43\":\"family\",\"44\":\"double-decker\"}', '', 0, 0, 0, 77, '2024-06-08 15:57:07', '2024-06-08 15:57:07', NULL, 0),
(265, 10.99, '{\"45\":\"small\",\"46\":\"hand-tosset\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(266, 11.99, '{\"45\":\"small\",\"46\":\"thin-crust\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(267, 12.99, '{\"45\":\"small\",\"46\":\"double-decker\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(268, 13.99, '{\"45\":\"medium\",\"46\":\"hand-tosset\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(269, 14.99, '{\"45\":\"medium\",\"46\":\"thin-crust\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(270, 15.99, '{\"45\":\"medium\",\"46\":\"double-decker\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(271, 16.99, '{\"45\":\"large\",\"46\":\"hand-tosset\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(272, 17.99, '{\"45\":\"large\",\"46\":\"thin-crust\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(273, 18.99, '{\"45\":\"large\",\"46\":\"double-decker\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(274, 19.99, '{\"45\":\"family\",\"46\":\"hand-tosset\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(275, 20.99, '{\"45\":\"family\",\"46\":\"thin-crust\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(276, 21.99, '{\"45\":\"family\",\"46\":\"double-decker\"}', '', 0, 0, 0, 95, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(277, 14.99, '{\"47\":\"small\",\"48\":\"hand-tosset\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(278, 15.99, '{\"47\":\"small\",\"48\":\"thin-crust\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(279, 16.99, '{\"47\":\"small\",\"48\":\"double-decker\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:08', '2024-06-08 15:57:08', NULL, 0),
(280, 17.99, '{\"47\":\"medium\",\"48\":\"hand-tosset\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(281, 18.99, '{\"47\":\"medium\",\"48\":\"thin-crust\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(282, 19.99, '{\"47\":\"medium\",\"48\":\"double-decker\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(283, 20.99, '{\"47\":\"large\",\"48\":\"hand-tosset\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(284, 21.99, '{\"47\":\"large\",\"48\":\"thin-crust\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(285, 22.99, '{\"47\":\"large\",\"48\":\"double-decker\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(286, 23.99, '{\"47\":\"family\",\"48\":\"hand-tosset\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(287, 24.99, '{\"47\":\"family\",\"48\":\"thin-crust\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(288, 25.99, '{\"47\":\"family\",\"48\":\"double-decker\"}', '', 0, 0, 0, 96, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(289, 14.99, '{\"49\":\"small\",\"50\":\"hand-tosset\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(290, 15.99, '{\"49\":\"small\",\"50\":\"thin-crust\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(291, 16.99, '{\"49\":\"small\",\"50\":\"double-decker\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(292, 17.99, '{\"49\":\"medium\",\"50\":\"hand-tosset\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(293, 18.99, '{\"49\":\"medium\",\"50\":\"thin-crust\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(294, 19.99, '{\"49\":\"medium\",\"50\":\"double-decker\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(295, 20.99, '{\"49\":\"large\",\"50\":\"hand-tosset\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(296, 21.99, '{\"49\":\"large\",\"50\":\"thin-crust\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(297, 22.99, '{\"49\":\"large\",\"50\":\"double-decker\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(298, 23.99, '{\"49\":\"family\",\"50\":\"hand-tosset\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(299, 24.99, '{\"49\":\"family\",\"50\":\"thin-crust\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(300, 25.99, '{\"49\":\"family\",\"50\":\"double-decker\"}', '', 0, 0, 0, 97, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(301, 14.99, '{\"51\":\"small\",\"52\":\"hand-tosset\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(302, 15.99, '{\"51\":\"small\",\"52\":\"thin-crust\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(303, 16.99, '{\"51\":\"small\",\"52\":\"double-decker\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(304, 17.99, '{\"51\":\"medium\",\"52\":\"hand-tosset\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(305, 18.99, '{\"51\":\"medium\",\"52\":\"thin-crust\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(306, 19.99, '{\"51\":\"medium\",\"52\":\"double-decker\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(307, 20.99, '{\"51\":\"large\",\"52\":\"hand-tosset\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(308, 21.99, '{\"51\":\"large\",\"52\":\"thin-crust\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(309, 22.99, '{\"51\":\"large\",\"52\":\"double-decker\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:09', '2024-06-08 15:57:09', NULL, 0),
(310, 23.99, '{\"51\":\"family\",\"52\":\"hand-tosset\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(311, 24.99, '{\"51\":\"family\",\"52\":\"thin-crust\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(312, 25.99, '{\"51\":\"family\",\"52\":\"double-decker\"}', '', 0, 0, 0, 98, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(313, 14.99, '{\"53\":\"small\",\"54\":\"hand-tosset\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(314, 15.99, '{\"53\":\"small\",\"54\":\"thin-crust\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(315, 16.99, '{\"53\":\"small\",\"54\":\"double-decker\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(316, 17.99, '{\"53\":\"medium\",\"54\":\"hand-tosset\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(317, 18.99, '{\"53\":\"medium\",\"54\":\"thin-crust\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(318, 19.99, '{\"53\":\"medium\",\"54\":\"double-decker\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(319, 20.99, '{\"53\":\"large\",\"54\":\"hand-tosset\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(320, 21.99, '{\"53\":\"large\",\"54\":\"thin-crust\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(321, 22.99, '{\"53\":\"large\",\"54\":\"double-decker\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(322, 23.99, '{\"53\":\"family\",\"54\":\"hand-tosset\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(323, 24.99, '{\"53\":\"family\",\"54\":\"thin-crust\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(324, 25.99, '{\"53\":\"family\",\"54\":\"double-decker\"}', '', 0, 0, 0, 99, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(325, 14.99, '{\"55\":\"small\",\"56\":\"hand-tosset\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(326, 15.99, '{\"55\":\"small\",\"56\":\"thin-crust\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(327, 16.99, '{\"55\":\"small\",\"56\":\"double-decker\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(328, 17.99, '{\"55\":\"medium\",\"56\":\"hand-tosset\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(329, 18.99, '{\"55\":\"medium\",\"56\":\"thin-crust\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(330, 19.99, '{\"55\":\"medium\",\"56\":\"double-decker\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(331, 20.99, '{\"55\":\"large\",\"56\":\"hand-tosset\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(332, 21.99, '{\"55\":\"large\",\"56\":\"thin-crust\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(333, 22.99, '{\"55\":\"large\",\"56\":\"double-decker\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(334, 23.99, '{\"55\":\"family\",\"56\":\"hand-tosset\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:10', '2024-06-08 15:57:10', NULL, 0),
(335, 24.99, '{\"55\":\"family\",\"56\":\"thin-crust\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(336, 25.99, '{\"55\":\"family\",\"56\":\"double-decker\"}', '', 0, 0, 0, 100, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(337, 10.49, '{\"57\":\"small\",\"58\":\"hand-tosset\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(338, 11.49, '{\"57\":\"small\",\"58\":\"thin-crust\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(339, 12.49, '{\"57\":\"small\",\"58\":\"double-decker\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(340, 13.49, '{\"57\":\"medium\",\"58\":\"hand-tosset\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(341, 14.49, '{\"57\":\"medium\",\"58\":\"thin-crust\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(342, 15.49, '{\"57\":\"medium\",\"58\":\"double-decker\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(343, 16.49, '{\"57\":\"large\",\"58\":\"hand-tosset\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(344, 17.49, '{\"57\":\"large\",\"58\":\"thin-crust\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(345, 18.49, '{\"57\":\"large\",\"58\":\"double-decker\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(346, 19.49, '{\"57\":\"family\",\"58\":\"hand-tosset\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(347, 20.49, '{\"57\":\"family\",\"58\":\"thin-crust\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(348, 21.49, '{\"57\":\"family\",\"58\":\"double-decker\"}', '', 0, 0, 0, 101, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(349, 39.99, '{\"59\":\"small\",\"60\":\"hand-tosset\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(350, 40.99, '{\"59\":\"small\",\"60\":\"thin-crust\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(351, 41.99, '{\"59\":\"small\",\"60\":\"double-decker\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:11', '2024-06-08 15:57:11', NULL, 0),
(352, 42.99, '{\"59\":\"medium\",\"60\":\"hand-tosset\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(353, 43.99, '{\"59\":\"medium\",\"60\":\"thin-crust\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(354, 44.99, '{\"59\":\"medium\",\"60\":\"double-decker\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(355, 45.99, '{\"59\":\"large\",\"60\":\"hand-tosset\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(356, 46.99, '{\"59\":\"large\",\"60\":\"thin-crust\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(357, 47.99, '{\"59\":\"large\",\"60\":\"double-decker\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(358, 48.99, '{\"59\":\"family\",\"60\":\"hand-tosset\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(359, 49.99, '{\"59\":\"family\",\"60\":\"thin-crust\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(360, 50.99, '{\"59\":\"family\",\"60\":\"double-decker\"}', '', 0, 0, 0, 102, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(361, 14.99, '{\"61\":\"small\",\"62\":\"hand-tosset\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(362, 15.99, '{\"61\":\"small\",\"62\":\"thin-crust\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(363, 16.99, '{\"61\":\"small\",\"62\":\"double-decker\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(364, 17.99, '{\"61\":\"medium\",\"62\":\"hand-tosset\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(365, 18.99, '{\"61\":\"medium\",\"62\":\"thin-crust\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(366, 19.99, '{\"61\":\"medium\",\"62\":\"double-decker\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(367, 20.99, '{\"61\":\"large\",\"62\":\"hand-tosset\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(368, 21.99, '{\"61\":\"large\",\"62\":\"thin-crust\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(369, 22.99, '{\"61\":\"large\",\"62\":\"double-decker\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(370, 23.99, '{\"61\":\"family\",\"62\":\"hand-tosset\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(371, 24.99, '{\"61\":\"family\",\"62\":\"thin-crust\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(372, 25.99, '{\"61\":\"family\",\"62\":\"double-decker\"}', '', 0, 0, 0, 103, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(373, 14.99, '{\"63\":\"small\",\"64\":\"hand-tosset\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(374, 15.99, '{\"63\":\"small\",\"64\":\"thin-crust\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(375, 16.99, '{\"63\":\"small\",\"64\":\"double-decker\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(376, 17.99, '{\"63\":\"medium\",\"64\":\"hand-tosset\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(377, 18.99, '{\"63\":\"medium\",\"64\":\"thin-crust\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(378, 19.99, '{\"63\":\"medium\",\"64\":\"double-decker\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(379, 20.99, '{\"63\":\"large\",\"64\":\"hand-tosset\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(380, 21.99, '{\"63\":\"large\",\"64\":\"thin-crust\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:12', '2024-06-08 15:57:12', NULL, 0),
(381, 22.99, '{\"63\":\"large\",\"64\":\"double-decker\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(382, 23.99, '{\"63\":\"family\",\"64\":\"hand-tosset\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(383, 24.99, '{\"63\":\"family\",\"64\":\"thin-crust\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(384, 25.99, '{\"63\":\"family\",\"64\":\"double-decker\"}', '', 0, 0, 0, 104, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(385, 14.99, '{\"65\":\"small\",\"66\":\"hand-tosset\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0);
INSERT INTO `variants` (`id`, `price`, `options`, `image`, `qty`, `enable_qty`, `order`, `item_id`, `created_at`, `updated_at`, `deleted_at`, `is_system`) VALUES
(386, 15.99, '{\"65\":\"small\",\"66\":\"thin-crust\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(387, 16.99, '{\"65\":\"small\",\"66\":\"double-decker\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(388, 17.99, '{\"65\":\"medium\",\"66\":\"hand-tosset\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(389, 18.99, '{\"65\":\"medium\",\"66\":\"thin-crust\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(390, 19.99, '{\"65\":\"medium\",\"66\":\"double-decker\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(391, 20.99, '{\"65\":\"large\",\"66\":\"hand-tosset\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(392, 21.99, '{\"65\":\"large\",\"66\":\"thin-crust\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(393, 22.99, '{\"65\":\"large\",\"66\":\"double-decker\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(394, 23.99, '{\"65\":\"family\",\"66\":\"hand-tosset\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(395, 24.99, '{\"65\":\"family\",\"66\":\"thin-crust\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(396, 25.99, '{\"65\":\"family\",\"66\":\"double-decker\"}', '', 0, 0, 0, 105, '2024-06-08 15:57:13', '2024-06-08 15:57:13', NULL, 0),
(397, 10.99, '{\"67\":\"small\",\"68\":\"hand-tosset\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL, 0),
(398, 11.99, '{\"67\":\"small\",\"68\":\"thin-crust\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL, 0),
(399, 12.99, '{\"67\":\"small\",\"68\":\"double-decker\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:16', '2024-06-08 15:57:16', NULL, 0),
(400, 13.99, '{\"67\":\"medium\",\"68\":\"hand-tosset\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(401, 14.99, '{\"67\":\"medium\",\"68\":\"thin-crust\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(402, 15.99, '{\"67\":\"medium\",\"68\":\"double-decker\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(403, 16.99, '{\"67\":\"large\",\"68\":\"hand-tosset\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(404, 17.99, '{\"67\":\"large\",\"68\":\"thin-crust\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(405, 18.99, '{\"67\":\"large\",\"68\":\"double-decker\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(406, 19.99, '{\"67\":\"family\",\"68\":\"hand-tosset\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(407, 20.99, '{\"67\":\"family\",\"68\":\"thin-crust\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(408, 21.99, '{\"67\":\"family\",\"68\":\"double-decker\"}', '', 0, 0, 0, 150, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(409, 14.99, '{\"69\":\"small\",\"70\":\"hand-tosset\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(410, 15.99, '{\"69\":\"small\",\"70\":\"thin-crust\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(411, 16.99, '{\"69\":\"small\",\"70\":\"double-decker\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(412, 17.99, '{\"69\":\"medium\",\"70\":\"hand-tosset\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(413, 18.99, '{\"69\":\"medium\",\"70\":\"thin-crust\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(414, 19.99, '{\"69\":\"medium\",\"70\":\"double-decker\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(415, 20.99, '{\"69\":\"large\",\"70\":\"hand-tosset\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(416, 21.99, '{\"69\":\"large\",\"70\":\"thin-crust\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(417, 22.99, '{\"69\":\"large\",\"70\":\"double-decker\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(418, 23.99, '{\"69\":\"family\",\"70\":\"hand-tosset\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(419, 24.99, '{\"69\":\"family\",\"70\":\"thin-crust\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(420, 25.99, '{\"69\":\"family\",\"70\":\"double-decker\"}', '', 0, 0, 0, 151, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(421, 14.99, '{\"71\":\"small\",\"72\":\"hand-tosset\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(422, 15.99, '{\"71\":\"small\",\"72\":\"thin-crust\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(423, 16.99, '{\"71\":\"small\",\"72\":\"double-decker\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(424, 17.99, '{\"71\":\"medium\",\"72\":\"hand-tosset\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(425, 18.99, '{\"71\":\"medium\",\"72\":\"thin-crust\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(426, 19.99, '{\"71\":\"medium\",\"72\":\"double-decker\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(427, 20.99, '{\"71\":\"large\",\"72\":\"hand-tosset\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:17', '2024-06-08 15:57:17', NULL, 0),
(428, 21.99, '{\"71\":\"large\",\"72\":\"thin-crust\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(429, 22.99, '{\"71\":\"large\",\"72\":\"double-decker\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(430, 23.99, '{\"71\":\"family\",\"72\":\"hand-tosset\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(431, 24.99, '{\"71\":\"family\",\"72\":\"thin-crust\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(432, 25.99, '{\"71\":\"family\",\"72\":\"double-decker\"}', '', 0, 0, 0, 152, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(433, 14.99, '{\"73\":\"small\",\"74\":\"hand-tosset\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(434, 15.99, '{\"73\":\"small\",\"74\":\"thin-crust\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(435, 16.99, '{\"73\":\"small\",\"74\":\"double-decker\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(436, 17.99, '{\"73\":\"medium\",\"74\":\"hand-tosset\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(437, 18.99, '{\"73\":\"medium\",\"74\":\"thin-crust\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(438, 19.99, '{\"73\":\"medium\",\"74\":\"double-decker\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(439, 20.99, '{\"73\":\"large\",\"74\":\"hand-tosset\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(440, 21.99, '{\"73\":\"large\",\"74\":\"thin-crust\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(441, 22.99, '{\"73\":\"large\",\"74\":\"double-decker\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(442, 23.99, '{\"73\":\"family\",\"74\":\"hand-tosset\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(443, 24.99, '{\"73\":\"family\",\"74\":\"thin-crust\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:18', '2024-06-08 15:57:18', NULL, 0),
(444, 25.99, '{\"73\":\"family\",\"74\":\"double-decker\"}', '', 0, 0, 0, 153, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(445, 14.99, '{\"75\":\"small\",\"76\":\"hand-tosset\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(446, 15.99, '{\"75\":\"small\",\"76\":\"thin-crust\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(447, 16.99, '{\"75\":\"small\",\"76\":\"double-decker\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(448, 17.99, '{\"75\":\"medium\",\"76\":\"hand-tosset\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(449, 18.99, '{\"75\":\"medium\",\"76\":\"thin-crust\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(450, 19.99, '{\"75\":\"medium\",\"76\":\"double-decker\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(451, 20.99, '{\"75\":\"large\",\"76\":\"hand-tosset\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(452, 21.99, '{\"75\":\"large\",\"76\":\"thin-crust\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(453, 22.99, '{\"75\":\"large\",\"76\":\"double-decker\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(454, 23.99, '{\"75\":\"family\",\"76\":\"hand-tosset\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(455, 24.99, '{\"75\":\"family\",\"76\":\"thin-crust\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(456, 25.99, '{\"75\":\"family\",\"76\":\"double-decker\"}', '', 0, 0, 0, 154, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(457, 14.99, '{\"77\":\"small\",\"78\":\"hand-tosset\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(458, 15.99, '{\"77\":\"small\",\"78\":\"thin-crust\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(459, 16.99, '{\"77\":\"small\",\"78\":\"double-decker\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(460, 17.99, '{\"77\":\"medium\",\"78\":\"hand-tosset\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(461, 18.99, '{\"77\":\"medium\",\"78\":\"thin-crust\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(462, 19.99, '{\"77\":\"medium\",\"78\":\"double-decker\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(463, 20.99, '{\"77\":\"large\",\"78\":\"hand-tosset\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(464, 21.99, '{\"77\":\"large\",\"78\":\"thin-crust\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(465, 22.99, '{\"77\":\"large\",\"78\":\"double-decker\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(466, 23.99, '{\"77\":\"family\",\"78\":\"hand-tosset\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(467, 24.99, '{\"77\":\"family\",\"78\":\"thin-crust\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(468, 25.99, '{\"77\":\"family\",\"78\":\"double-decker\"}', '', 0, 0, 0, 155, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(469, 10.49, '{\"79\":\"small\",\"80\":\"hand-tosset\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(470, 11.49, '{\"79\":\"small\",\"80\":\"thin-crust\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(471, 12.49, '{\"79\":\"small\",\"80\":\"double-decker\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(472, 13.49, '{\"79\":\"medium\",\"80\":\"hand-tosset\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(473, 14.49, '{\"79\":\"medium\",\"80\":\"thin-crust\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(474, 15.49, '{\"79\":\"medium\",\"80\":\"double-decker\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:19', '2024-06-08 15:57:19', NULL, 0),
(475, 16.49, '{\"79\":\"large\",\"80\":\"hand-tosset\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(476, 17.49, '{\"79\":\"large\",\"80\":\"thin-crust\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(477, 18.49, '{\"79\":\"large\",\"80\":\"double-decker\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(478, 19.49, '{\"79\":\"family\",\"80\":\"hand-tosset\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(479, 20.49, '{\"79\":\"family\",\"80\":\"thin-crust\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(480, 21.49, '{\"79\":\"family\",\"80\":\"double-decker\"}', '', 0, 0, 0, 156, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(481, 39.99, '{\"81\":\"small\",\"82\":\"hand-tosset\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(482, 40.99, '{\"81\":\"small\",\"82\":\"thin-crust\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(483, 41.99, '{\"81\":\"small\",\"82\":\"double-decker\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(484, 42.99, '{\"81\":\"medium\",\"82\":\"hand-tosset\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(485, 43.99, '{\"81\":\"medium\",\"82\":\"thin-crust\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(486, 44.99, '{\"81\":\"medium\",\"82\":\"double-decker\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(487, 45.99, '{\"81\":\"large\",\"82\":\"hand-tosset\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(488, 46.99, '{\"81\":\"large\",\"82\":\"thin-crust\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(489, 47.99, '{\"81\":\"large\",\"82\":\"double-decker\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(490, 48.99, '{\"81\":\"family\",\"82\":\"hand-tosset\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(491, 49.99, '{\"81\":\"family\",\"82\":\"thin-crust\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(492, 50.99, '{\"81\":\"family\",\"82\":\"double-decker\"}', '', 0, 0, 0, 157, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(493, 14.99, '{\"83\":\"small\",\"84\":\"hand-tosset\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(494, 15.99, '{\"83\":\"small\",\"84\":\"thin-crust\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(495, 16.99, '{\"83\":\"small\",\"84\":\"double-decker\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(496, 17.99, '{\"83\":\"medium\",\"84\":\"hand-tosset\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(497, 18.99, '{\"83\":\"medium\",\"84\":\"thin-crust\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(498, 19.99, '{\"83\":\"medium\",\"84\":\"double-decker\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:20', '2024-06-08 15:57:20', NULL, 0),
(499, 20.99, '{\"83\":\"large\",\"84\":\"hand-tosset\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(500, 21.99, '{\"83\":\"large\",\"84\":\"thin-crust\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(501, 22.99, '{\"83\":\"large\",\"84\":\"double-decker\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(502, 23.99, '{\"83\":\"family\",\"84\":\"hand-tosset\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(503, 24.99, '{\"83\":\"family\",\"84\":\"thin-crust\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(504, 25.99, '{\"83\":\"family\",\"84\":\"double-decker\"}', '', 0, 0, 0, 158, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(505, 14.99, '{\"85\":\"small\",\"86\":\"hand-tosset\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(506, 15.99, '{\"85\":\"small\",\"86\":\"thin-crust\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(507, 16.99, '{\"85\":\"small\",\"86\":\"double-decker\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(508, 17.99, '{\"85\":\"medium\",\"86\":\"hand-tosset\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(509, 18.99, '{\"85\":\"medium\",\"86\":\"thin-crust\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(510, 19.99, '{\"85\":\"medium\",\"86\":\"double-decker\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(511, 20.99, '{\"85\":\"large\",\"86\":\"hand-tosset\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(512, 21.99, '{\"85\":\"large\",\"86\":\"thin-crust\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(513, 22.99, '{\"85\":\"large\",\"86\":\"double-decker\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(514, 23.99, '{\"85\":\"family\",\"86\":\"hand-tosset\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(515, 24.99, '{\"85\":\"family\",\"86\":\"thin-crust\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(516, 25.99, '{\"85\":\"family\",\"86\":\"double-decker\"}', '', 0, 0, 0, 159, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(517, 14.99, '{\"87\":\"small\",\"88\":\"hand-tosset\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(518, 15.99, '{\"87\":\"small\",\"88\":\"thin-crust\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(519, 16.99, '{\"87\":\"small\",\"88\":\"double-decker\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(520, 17.99, '{\"87\":\"medium\",\"88\":\"hand-tosset\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(521, 18.99, '{\"87\":\"medium\",\"88\":\"thin-crust\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(522, 19.99, '{\"87\":\"medium\",\"88\":\"double-decker\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(523, 20.99, '{\"87\":\"large\",\"88\":\"hand-tosset\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(524, 21.99, '{\"87\":\"large\",\"88\":\"thin-crust\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(525, 22.99, '{\"87\":\"large\",\"88\":\"double-decker\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(526, 23.99, '{\"87\":\"family\",\"88\":\"hand-tosset\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(527, 24.99, '{\"87\":\"family\",\"88\":\"thin-crust\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(528, 25.99, '{\"87\":\"family\",\"88\":\"double-decker\"}', '', 0, 0, 0, 160, '2024-06-08 15:57:21', '2024-06-08 15:57:21', NULL, 0),
(529, 10.99, '{\"89\":\"small\",\"90\":\"hand-tosset\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(530, 11.99, '{\"89\":\"small\",\"90\":\"thin-crust\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(531, 12.99, '{\"89\":\"small\",\"90\":\"double-decker\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(532, 13.99, '{\"89\":\"medium\",\"90\":\"hand-tosset\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(533, 14.99, '{\"89\":\"medium\",\"90\":\"thin-crust\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(534, 15.99, '{\"89\":\"medium\",\"90\":\"double-decker\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(535, 16.99, '{\"89\":\"large\",\"90\":\"hand-tosset\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(536, 17.99, '{\"89\":\"large\",\"90\":\"thin-crust\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(537, 18.99, '{\"89\":\"large\",\"90\":\"double-decker\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(538, 19.99, '{\"89\":\"family\",\"90\":\"hand-tosset\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(539, 20.99, '{\"89\":\"family\",\"90\":\"thin-crust\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(540, 21.99, '{\"89\":\"family\",\"90\":\"double-decker\"}', '', 0, 0, 0, 174, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(541, 14.99, '{\"91\":\"small\",\"92\":\"hand-tosset\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(542, 15.99, '{\"91\":\"small\",\"92\":\"thin-crust\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(543, 16.99, '{\"91\":\"small\",\"92\":\"double-decker\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(544, 17.99, '{\"91\":\"medium\",\"92\":\"hand-tosset\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(545, 18.99, '{\"91\":\"medium\",\"92\":\"thin-crust\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(546, 19.99, '{\"91\":\"medium\",\"92\":\"double-decker\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(547, 20.99, '{\"91\":\"large\",\"92\":\"hand-tosset\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(548, 21.99, '{\"91\":\"large\",\"92\":\"thin-crust\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(549, 22.99, '{\"91\":\"large\",\"92\":\"double-decker\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(550, 23.99, '{\"91\":\"family\",\"92\":\"hand-tosset\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(551, 24.99, '{\"91\":\"family\",\"92\":\"thin-crust\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(552, 25.99, '{\"91\":\"family\",\"92\":\"double-decker\"}', '', 0, 0, 0, 175, '2024-06-08 15:57:23', '2024-06-08 15:57:23', NULL, 0),
(553, 14.99, '{\"93\":\"small\",\"94\":\"hand-tosset\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(554, 15.99, '{\"93\":\"small\",\"94\":\"thin-crust\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(555, 16.99, '{\"93\":\"small\",\"94\":\"double-decker\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(556, 17.99, '{\"93\":\"medium\",\"94\":\"hand-tosset\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(557, 18.99, '{\"93\":\"medium\",\"94\":\"thin-crust\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(558, 19.99, '{\"93\":\"medium\",\"94\":\"double-decker\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(559, 20.99, '{\"93\":\"large\",\"94\":\"hand-tosset\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(560, 21.99, '{\"93\":\"large\",\"94\":\"thin-crust\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(561, 22.99, '{\"93\":\"large\",\"94\":\"double-decker\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(562, 23.99, '{\"93\":\"family\",\"94\":\"hand-tosset\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(563, 24.99, '{\"93\":\"family\",\"94\":\"thin-crust\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(564, 25.99, '{\"93\":\"family\",\"94\":\"double-decker\"}', '', 0, 0, 0, 176, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(565, 14.99, '{\"95\":\"small\",\"96\":\"hand-tosset\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(566, 15.99, '{\"95\":\"small\",\"96\":\"thin-crust\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(567, 16.99, '{\"95\":\"small\",\"96\":\"double-decker\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(568, 17.99, '{\"95\":\"medium\",\"96\":\"hand-tosset\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(569, 18.99, '{\"95\":\"medium\",\"96\":\"thin-crust\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(570, 19.99, '{\"95\":\"medium\",\"96\":\"double-decker\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:24', '2024-06-08 15:57:24', NULL, 0),
(571, 20.99, '{\"95\":\"large\",\"96\":\"hand-tosset\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(572, 21.99, '{\"95\":\"large\",\"96\":\"thin-crust\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(573, 22.99, '{\"95\":\"large\",\"96\":\"double-decker\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(574, 23.99, '{\"95\":\"family\",\"96\":\"hand-tosset\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(575, 24.99, '{\"95\":\"family\",\"96\":\"thin-crust\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(576, 25.99, '{\"95\":\"family\",\"96\":\"double-decker\"}', '', 0, 0, 0, 177, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(577, 14.99, '{\"97\":\"small\",\"98\":\"hand-tosset\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(578, 15.99, '{\"97\":\"small\",\"98\":\"thin-crust\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(579, 16.99, '{\"97\":\"small\",\"98\":\"double-decker\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(580, 17.99, '{\"97\":\"medium\",\"98\":\"hand-tosset\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(581, 18.99, '{\"97\":\"medium\",\"98\":\"thin-crust\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(582, 19.99, '{\"97\":\"medium\",\"98\":\"double-decker\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(583, 20.99, '{\"97\":\"large\",\"98\":\"hand-tosset\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(584, 21.99, '{\"97\":\"large\",\"98\":\"thin-crust\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(585, 22.99, '{\"97\":\"large\",\"98\":\"double-decker\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(586, 23.99, '{\"97\":\"family\",\"98\":\"hand-tosset\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(587, 24.99, '{\"97\":\"family\",\"98\":\"thin-crust\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(588, 25.99, '{\"97\":\"family\",\"98\":\"double-decker\"}', '', 0, 0, 0, 178, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(589, 14.99, '{\"99\":\"small\",\"100\":\"hand-tosset\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(590, 15.99, '{\"99\":\"small\",\"100\":\"thin-crust\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(591, 16.99, '{\"99\":\"small\",\"100\":\"double-decker\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(592, 17.99, '{\"99\":\"medium\",\"100\":\"hand-tosset\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(593, 18.99, '{\"99\":\"medium\",\"100\":\"thin-crust\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(594, 19.99, '{\"99\":\"medium\",\"100\":\"double-decker\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(595, 20.99, '{\"99\":\"large\",\"100\":\"hand-tosset\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(596, 21.99, '{\"99\":\"large\",\"100\":\"thin-crust\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(597, 22.99, '{\"99\":\"large\",\"100\":\"double-decker\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(598, 23.99, '{\"99\":\"family\",\"100\":\"hand-tosset\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(599, 24.99, '{\"99\":\"family\",\"100\":\"thin-crust\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(600, 25.99, '{\"99\":\"family\",\"100\":\"double-decker\"}', '', 0, 0, 0, 179, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(601, 10.49, '{\"101\":\"small\",\"102\":\"hand-tosset\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(602, 11.49, '{\"101\":\"small\",\"102\":\"thin-crust\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(603, 12.49, '{\"101\":\"small\",\"102\":\"double-decker\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(604, 13.49, '{\"101\":\"medium\",\"102\":\"hand-tosset\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:25', '2024-06-08 15:57:25', NULL, 0),
(605, 14.49, '{\"101\":\"medium\",\"102\":\"thin-crust\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(606, 15.49, '{\"101\":\"medium\",\"102\":\"double-decker\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(607, 16.49, '{\"101\":\"large\",\"102\":\"hand-tosset\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(608, 17.49, '{\"101\":\"large\",\"102\":\"thin-crust\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(609, 18.49, '{\"101\":\"large\",\"102\":\"double-decker\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(610, 19.49, '{\"101\":\"family\",\"102\":\"hand-tosset\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(611, 20.49, '{\"101\":\"family\",\"102\":\"thin-crust\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(612, 21.49, '{\"101\":\"family\",\"102\":\"double-decker\"}', '', 0, 0, 0, 180, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(613, 39.99, '{\"103\":\"small\",\"104\":\"hand-tosset\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(614, 40.99, '{\"103\":\"small\",\"104\":\"thin-crust\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(615, 41.99, '{\"103\":\"small\",\"104\":\"double-decker\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(616, 42.99, '{\"103\":\"medium\",\"104\":\"hand-tosset\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(617, 43.99, '{\"103\":\"medium\",\"104\":\"thin-crust\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(618, 44.99, '{\"103\":\"medium\",\"104\":\"double-decker\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(619, 45.99, '{\"103\":\"large\",\"104\":\"hand-tosset\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(620, 46.99, '{\"103\":\"large\",\"104\":\"thin-crust\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(621, 47.99, '{\"103\":\"large\",\"104\":\"double-decker\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(622, 48.99, '{\"103\":\"family\",\"104\":\"hand-tosset\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(623, 49.99, '{\"103\":\"family\",\"104\":\"thin-crust\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(624, 50.99, '{\"103\":\"family\",\"104\":\"double-decker\"}', '', 0, 0, 0, 181, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(625, 14.99, '{\"105\":\"small\",\"106\":\"hand-tosset\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(626, 15.99, '{\"105\":\"small\",\"106\":\"thin-crust\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(627, 16.99, '{\"105\":\"small\",\"106\":\"double-decker\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(628, 17.99, '{\"105\":\"medium\",\"106\":\"hand-tosset\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(629, 18.99, '{\"105\":\"medium\",\"106\":\"thin-crust\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(630, 19.99, '{\"105\":\"medium\",\"106\":\"double-decker\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(631, 20.99, '{\"105\":\"large\",\"106\":\"hand-tosset\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(632, 21.99, '{\"105\":\"large\",\"106\":\"thin-crust\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(633, 22.99, '{\"105\":\"large\",\"106\":\"double-decker\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(634, 23.99, '{\"105\":\"family\",\"106\":\"hand-tosset\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(635, 24.99, '{\"105\":\"family\",\"106\":\"thin-crust\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(636, 25.99, '{\"105\":\"family\",\"106\":\"double-decker\"}', '', 0, 0, 0, 182, '2024-06-08 15:57:26', '2024-06-08 15:57:26', NULL, 0),
(637, 14.99, '{\"107\":\"small\",\"108\":\"hand-tosset\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(638, 15.99, '{\"107\":\"small\",\"108\":\"thin-crust\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(639, 16.99, '{\"107\":\"small\",\"108\":\"double-decker\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(640, 17.99, '{\"107\":\"medium\",\"108\":\"hand-tosset\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(641, 18.99, '{\"107\":\"medium\",\"108\":\"thin-crust\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(642, 19.99, '{\"107\":\"medium\",\"108\":\"double-decker\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(643, 20.99, '{\"107\":\"large\",\"108\":\"hand-tosset\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(644, 21.99, '{\"107\":\"large\",\"108\":\"thin-crust\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(645, 22.99, '{\"107\":\"large\",\"108\":\"double-decker\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(646, 23.99, '{\"107\":\"family\",\"108\":\"hand-tosset\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(647, 24.99, '{\"107\":\"family\",\"108\":\"thin-crust\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(648, 25.99, '{\"107\":\"family\",\"108\":\"double-decker\"}', '', 0, 0, 0, 183, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(649, 14.99, '{\"109\":\"small\",\"110\":\"hand-tosset\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(650, 15.99, '{\"109\":\"small\",\"110\":\"thin-crust\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(651, 16.99, '{\"109\":\"small\",\"110\":\"double-decker\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(652, 17.99, '{\"109\":\"medium\",\"110\":\"hand-tosset\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(653, 18.99, '{\"109\":\"medium\",\"110\":\"thin-crust\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(654, 19.99, '{\"109\":\"medium\",\"110\":\"double-decker\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(655, 20.99, '{\"109\":\"large\",\"110\":\"hand-tosset\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(656, 21.99, '{\"109\":\"large\",\"110\":\"thin-crust\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(657, 22.99, '{\"109\":\"large\",\"110\":\"double-decker\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(658, 23.99, '{\"109\":\"family\",\"110\":\"hand-tosset\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(659, 24.99, '{\"109\":\"family\",\"110\":\"thin-crust\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(660, 25.99, '{\"109\":\"family\",\"110\":\"double-decker\"}', '', 0, 0, 0, 184, '2024-06-08 15:57:27', '2024-06-08 15:57:27', NULL, 0),
(661, 10.99, '{\"111\":\"small\",\"112\":\"hand-tosset\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(662, 11.99, '{\"111\":\"small\",\"112\":\"thin-crust\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(663, 12.99, '{\"111\":\"small\",\"112\":\"double-decker\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(664, 13.99, '{\"111\":\"medium\",\"112\":\"hand-tosset\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(665, 14.99, '{\"111\":\"medium\",\"112\":\"thin-crust\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(666, 15.99, '{\"111\":\"medium\",\"112\":\"double-decker\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(667, 16.99, '{\"111\":\"large\",\"112\":\"hand-tosset\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(668, 17.99, '{\"111\":\"large\",\"112\":\"thin-crust\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(669, 18.99, '{\"111\":\"large\",\"112\":\"double-decker\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:32', '2024-06-08 15:57:32', NULL, 0),
(670, 19.99, '{\"111\":\"family\",\"112\":\"hand-tosset\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(671, 20.99, '{\"111\":\"family\",\"112\":\"thin-crust\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(672, 21.99, '{\"111\":\"family\",\"112\":\"double-decker\"}', '', 0, 0, 0, 245, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(673, 14.99, '{\"113\":\"small\",\"114\":\"hand-tosset\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(674, 15.99, '{\"113\":\"small\",\"114\":\"thin-crust\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(675, 16.99, '{\"113\":\"small\",\"114\":\"double-decker\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(676, 17.99, '{\"113\":\"medium\",\"114\":\"hand-tosset\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(677, 18.99, '{\"113\":\"medium\",\"114\":\"thin-crust\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(678, 19.99, '{\"113\":\"medium\",\"114\":\"double-decker\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(679, 20.99, '{\"113\":\"large\",\"114\":\"hand-tosset\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(680, 21.99, '{\"113\":\"large\",\"114\":\"thin-crust\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(681, 22.99, '{\"113\":\"large\",\"114\":\"double-decker\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(682, 23.99, '{\"113\":\"family\",\"114\":\"hand-tosset\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(683, 24.99, '{\"113\":\"family\",\"114\":\"thin-crust\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(684, 25.99, '{\"113\":\"family\",\"114\":\"double-decker\"}', '', 0, 0, 0, 246, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(685, 14.99, '{\"115\":\"small\",\"116\":\"hand-tosset\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(686, 15.99, '{\"115\":\"small\",\"116\":\"thin-crust\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(687, 16.99, '{\"115\":\"small\",\"116\":\"double-decker\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(688, 17.99, '{\"115\":\"medium\",\"116\":\"hand-tosset\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(689, 18.99, '{\"115\":\"medium\",\"116\":\"thin-crust\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(690, 19.99, '{\"115\":\"medium\",\"116\":\"double-decker\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(691, 20.99, '{\"115\":\"large\",\"116\":\"hand-tosset\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:33', '2024-06-08 15:57:33', NULL, 0),
(692, 21.99, '{\"115\":\"large\",\"116\":\"thin-crust\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(693, 22.99, '{\"115\":\"large\",\"116\":\"double-decker\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(694, 23.99, '{\"115\":\"family\",\"116\":\"hand-tosset\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(695, 24.99, '{\"115\":\"family\",\"116\":\"thin-crust\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(696, 25.99, '{\"115\":\"family\",\"116\":\"double-decker\"}', '', 0, 0, 0, 247, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(697, 14.99, '{\"117\":\"small\",\"118\":\"hand-tosset\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(698, 15.99, '{\"117\":\"small\",\"118\":\"thin-crust\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(699, 16.99, '{\"117\":\"small\",\"118\":\"double-decker\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(700, 17.99, '{\"117\":\"medium\",\"118\":\"hand-tosset\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:34', '2024-06-08 15:57:34', NULL, 0),
(701, 18.99, '{\"117\":\"medium\",\"118\":\"thin-crust\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(702, 19.99, '{\"117\":\"medium\",\"118\":\"double-decker\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(703, 20.99, '{\"117\":\"large\",\"118\":\"hand-tosset\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(704, 21.99, '{\"117\":\"large\",\"118\":\"thin-crust\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(705, 22.99, '{\"117\":\"large\",\"118\":\"double-decker\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(706, 23.99, '{\"117\":\"family\",\"118\":\"hand-tosset\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(707, 24.99, '{\"117\":\"family\",\"118\":\"thin-crust\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(708, 25.99, '{\"117\":\"family\",\"118\":\"double-decker\"}', '', 0, 0, 0, 248, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(709, 14.99, '{\"119\":\"small\",\"120\":\"hand-tosset\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(710, 15.99, '{\"119\":\"small\",\"120\":\"thin-crust\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(711, 16.99, '{\"119\":\"small\",\"120\":\"double-decker\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(712, 17.99, '{\"119\":\"medium\",\"120\":\"hand-tosset\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(713, 18.99, '{\"119\":\"medium\",\"120\":\"thin-crust\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(714, 19.99, '{\"119\":\"medium\",\"120\":\"double-decker\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(715, 20.99, '{\"119\":\"large\",\"120\":\"hand-tosset\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(716, 21.99, '{\"119\":\"large\",\"120\":\"thin-crust\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(717, 22.99, '{\"119\":\"large\",\"120\":\"double-decker\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:35', '2024-06-08 15:57:35', NULL, 0),
(718, 23.99, '{\"119\":\"family\",\"120\":\"hand-tosset\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(719, 24.99, '{\"119\":\"family\",\"120\":\"thin-crust\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(720, 25.99, '{\"119\":\"family\",\"120\":\"double-decker\"}', '', 0, 0, 0, 249, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(721, 14.99, '{\"121\":\"small\",\"122\":\"hand-tosset\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(722, 15.99, '{\"121\":\"small\",\"122\":\"thin-crust\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(723, 16.99, '{\"121\":\"small\",\"122\":\"double-decker\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(724, 17.99, '{\"121\":\"medium\",\"122\":\"hand-tosset\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(725, 18.99, '{\"121\":\"medium\",\"122\":\"thin-crust\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(726, 19.99, '{\"121\":\"medium\",\"122\":\"double-decker\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(727, 20.99, '{\"121\":\"large\",\"122\":\"hand-tosset\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(728, 21.99, '{\"121\":\"large\",\"122\":\"thin-crust\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(729, 22.99, '{\"121\":\"large\",\"122\":\"double-decker\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(730, 23.99, '{\"121\":\"family\",\"122\":\"hand-tosset\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(731, 24.99, '{\"121\":\"family\",\"122\":\"thin-crust\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(732, 25.99, '{\"121\":\"family\",\"122\":\"double-decker\"}', '', 0, 0, 0, 250, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(733, 10.49, '{\"123\":\"small\",\"124\":\"hand-tosset\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(734, 11.49, '{\"123\":\"small\",\"124\":\"thin-crust\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(735, 12.49, '{\"123\":\"small\",\"124\":\"double-decker\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(736, 13.49, '{\"123\":\"medium\",\"124\":\"hand-tosset\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(737, 14.49, '{\"123\":\"medium\",\"124\":\"thin-crust\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(738, 15.49, '{\"123\":\"medium\",\"124\":\"double-decker\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(739, 16.49, '{\"123\":\"large\",\"124\":\"hand-tosset\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(740, 17.49, '{\"123\":\"large\",\"124\":\"thin-crust\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(741, 18.49, '{\"123\":\"large\",\"124\":\"double-decker\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(742, 19.49, '{\"123\":\"family\",\"124\":\"hand-tosset\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(743, 20.49, '{\"123\":\"family\",\"124\":\"thin-crust\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(744, 21.49, '{\"123\":\"family\",\"124\":\"double-decker\"}', '', 0, 0, 0, 251, '2024-06-08 15:57:36', '2024-06-08 15:57:36', NULL, 0),
(745, 39.99, '{\"125\":\"small\",\"126\":\"hand-tosset\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(746, 40.99, '{\"125\":\"small\",\"126\":\"thin-crust\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(747, 41.99, '{\"125\":\"small\",\"126\":\"double-decker\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(748, 42.99, '{\"125\":\"medium\",\"126\":\"hand-tosset\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(749, 43.99, '{\"125\":\"medium\",\"126\":\"thin-crust\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(750, 44.99, '{\"125\":\"medium\",\"126\":\"double-decker\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(751, 45.99, '{\"125\":\"large\",\"126\":\"hand-tosset\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(752, 46.99, '{\"125\":\"large\",\"126\":\"thin-crust\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(753, 47.99, '{\"125\":\"large\",\"126\":\"double-decker\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(754, 48.99, '{\"125\":\"family\",\"126\":\"hand-tosset\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(755, 49.99, '{\"125\":\"family\",\"126\":\"thin-crust\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(756, 50.99, '{\"125\":\"family\",\"126\":\"double-decker\"}', '', 0, 0, 0, 252, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(757, 14.99, '{\"127\":\"small\",\"128\":\"hand-tosset\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(758, 15.99, '{\"127\":\"small\",\"128\":\"thin-crust\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(759, 16.99, '{\"127\":\"small\",\"128\":\"double-decker\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(760, 17.99, '{\"127\":\"medium\",\"128\":\"hand-tosset\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(761, 18.99, '{\"127\":\"medium\",\"128\":\"thin-crust\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(762, 19.99, '{\"127\":\"medium\",\"128\":\"double-decker\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(763, 20.99, '{\"127\":\"large\",\"128\":\"hand-tosset\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0);
INSERT INTO `variants` (`id`, `price`, `options`, `image`, `qty`, `enable_qty`, `order`, `item_id`, `created_at`, `updated_at`, `deleted_at`, `is_system`) VALUES
(764, 21.99, '{\"127\":\"large\",\"128\":\"thin-crust\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:37', '2024-06-08 15:57:37', NULL, 0),
(765, 22.99, '{\"127\":\"large\",\"128\":\"double-decker\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(766, 23.99, '{\"127\":\"family\",\"128\":\"hand-tosset\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(767, 24.99, '{\"127\":\"family\",\"128\":\"thin-crust\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(768, 25.99, '{\"127\":\"family\",\"128\":\"double-decker\"}', '', 0, 0, 0, 253, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(769, 14.99, '{\"129\":\"small\",\"130\":\"hand-tosset\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(770, 15.99, '{\"129\":\"small\",\"130\":\"thin-crust\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(771, 16.99, '{\"129\":\"small\",\"130\":\"double-decker\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(772, 17.99, '{\"129\":\"medium\",\"130\":\"hand-tosset\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(773, 18.99, '{\"129\":\"medium\",\"130\":\"thin-crust\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(774, 19.99, '{\"129\":\"medium\",\"130\":\"double-decker\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(775, 20.99, '{\"129\":\"large\",\"130\":\"hand-tosset\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(776, 21.99, '{\"129\":\"large\",\"130\":\"thin-crust\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(777, 22.99, '{\"129\":\"large\",\"130\":\"double-decker\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(778, 23.99, '{\"129\":\"family\",\"130\":\"hand-tosset\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(779, 24.99, '{\"129\":\"family\",\"130\":\"thin-crust\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(780, 25.99, '{\"129\":\"family\",\"130\":\"double-decker\"}', '', 0, 0, 0, 254, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(781, 14.99, '{\"131\":\"small\",\"132\":\"hand-tosset\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(782, 15.99, '{\"131\":\"small\",\"132\":\"thin-crust\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(783, 16.99, '{\"131\":\"small\",\"132\":\"double-decker\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(784, 17.99, '{\"131\":\"medium\",\"132\":\"hand-tosset\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:38', '2024-06-08 15:57:38', NULL, 0),
(785, 18.99, '{\"131\":\"medium\",\"132\":\"thin-crust\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:39', '2024-06-08 15:57:39', NULL, 0),
(786, 19.99, '{\"131\":\"medium\",\"132\":\"double-decker\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:39', '2024-06-08 15:57:39', NULL, 0),
(787, 20.99, '{\"131\":\"large\",\"132\":\"hand-tosset\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:39', '2024-06-08 15:57:39', NULL, 0),
(788, 21.99, '{\"131\":\"large\",\"132\":\"thin-crust\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:39', '2024-06-08 15:57:39', NULL, 0),
(789, 22.99, '{\"131\":\"large\",\"132\":\"double-decker\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:39', '2024-06-08 15:57:39', NULL, 0),
(790, 23.99, '{\"131\":\"family\",\"132\":\"hand-tosset\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:39', '2024-06-08 15:57:39', NULL, 0),
(791, 24.99, '{\"131\":\"family\",\"132\":\"thin-crust\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:39', '2024-06-08 15:57:39', NULL, 0),
(792, 25.99, '{\"131\":\"family\",\"132\":\"double-decker\"}', '', 0, 0, 0, 255, '2024-06-08 15:57:39', '2024-06-08 15:57:39', NULL, 0),
(793, 10.99, '{\"133\":\"small\",\"134\":\"hand-tosset\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL, 0),
(794, 11.99, '{\"133\":\"small\",\"134\":\"thin-crust\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL, 0),
(795, 12.99, '{\"133\":\"small\",\"134\":\"double-decker\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL, 0),
(796, 13.99, '{\"133\":\"medium\",\"134\":\"hand-tosset\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:40', '2024-06-08 15:57:40', NULL, 0),
(797, 14.99, '{\"133\":\"medium\",\"134\":\"thin-crust\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(798, 15.99, '{\"133\":\"medium\",\"134\":\"double-decker\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(799, 16.99, '{\"133\":\"large\",\"134\":\"hand-tosset\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(800, 17.99, '{\"133\":\"large\",\"134\":\"thin-crust\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(801, 18.99, '{\"133\":\"large\",\"134\":\"double-decker\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(802, 19.99, '{\"133\":\"family\",\"134\":\"hand-tosset\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(803, 20.99, '{\"133\":\"family\",\"134\":\"thin-crust\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(804, 21.99, '{\"133\":\"family\",\"134\":\"double-decker\"}', '', 0, 0, 0, 256, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(805, 14.99, '{\"135\":\"small\",\"136\":\"hand-tosset\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(806, 15.99, '{\"135\":\"small\",\"136\":\"thin-crust\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(807, 16.99, '{\"135\":\"small\",\"136\":\"double-decker\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(808, 17.99, '{\"135\":\"medium\",\"136\":\"hand-tosset\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(809, 18.99, '{\"135\":\"medium\",\"136\":\"thin-crust\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(810, 19.99, '{\"135\":\"medium\",\"136\":\"double-decker\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(811, 20.99, '{\"135\":\"large\",\"136\":\"hand-tosset\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(812, 21.99, '{\"135\":\"large\",\"136\":\"thin-crust\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(813, 22.99, '{\"135\":\"large\",\"136\":\"double-decker\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(814, 23.99, '{\"135\":\"family\",\"136\":\"hand-tosset\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:41', '2024-06-08 15:57:41', NULL, 0),
(815, 24.99, '{\"135\":\"family\",\"136\":\"thin-crust\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(816, 25.99, '{\"135\":\"family\",\"136\":\"double-decker\"}', '', 0, 0, 0, 257, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(817, 14.99, '{\"137\":\"small\",\"138\":\"hand-tosset\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(818, 15.99, '{\"137\":\"small\",\"138\":\"thin-crust\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(819, 16.99, '{\"137\":\"small\",\"138\":\"double-decker\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(820, 17.99, '{\"137\":\"medium\",\"138\":\"hand-tosset\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(821, 18.99, '{\"137\":\"medium\",\"138\":\"thin-crust\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(822, 19.99, '{\"137\":\"medium\",\"138\":\"double-decker\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(823, 20.99, '{\"137\":\"large\",\"138\":\"hand-tosset\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(824, 21.99, '{\"137\":\"large\",\"138\":\"thin-crust\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(825, 22.99, '{\"137\":\"large\",\"138\":\"double-decker\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(826, 23.99, '{\"137\":\"family\",\"138\":\"hand-tosset\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(827, 24.99, '{\"137\":\"family\",\"138\":\"thin-crust\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(828, 25.99, '{\"137\":\"family\",\"138\":\"double-decker\"}', '', 0, 0, 0, 258, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(829, 14.99, '{\"139\":\"small\",\"140\":\"hand-tosset\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(830, 15.99, '{\"139\":\"small\",\"140\":\"thin-crust\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(831, 16.99, '{\"139\":\"small\",\"140\":\"double-decker\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(832, 17.99, '{\"139\":\"medium\",\"140\":\"hand-tosset\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(833, 18.99, '{\"139\":\"medium\",\"140\":\"thin-crust\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(834, 19.99, '{\"139\":\"medium\",\"140\":\"double-decker\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(835, 20.99, '{\"139\":\"large\",\"140\":\"hand-tosset\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(836, 21.99, '{\"139\":\"large\",\"140\":\"thin-crust\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(837, 22.99, '{\"139\":\"large\",\"140\":\"double-decker\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(838, 23.99, '{\"139\":\"family\",\"140\":\"hand-tosset\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(839, 24.99, '{\"139\":\"family\",\"140\":\"thin-crust\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(840, 25.99, '{\"139\":\"family\",\"140\":\"double-decker\"}', '', 0, 0, 0, 259, '2024-06-08 15:57:42', '2024-06-08 15:57:42', NULL, 0),
(841, 14.99, '{\"141\":\"small\",\"142\":\"hand-tosset\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(842, 15.99, '{\"141\":\"small\",\"142\":\"thin-crust\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(843, 16.99, '{\"141\":\"small\",\"142\":\"double-decker\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(844, 17.99, '{\"141\":\"medium\",\"142\":\"hand-tosset\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(845, 18.99, '{\"141\":\"medium\",\"142\":\"thin-crust\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(846, 19.99, '{\"141\":\"medium\",\"142\":\"double-decker\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(847, 20.99, '{\"141\":\"large\",\"142\":\"hand-tosset\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(848, 21.99, '{\"141\":\"large\",\"142\":\"thin-crust\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(849, 22.99, '{\"141\":\"large\",\"142\":\"double-decker\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(850, 23.99, '{\"141\":\"family\",\"142\":\"hand-tosset\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(851, 24.99, '{\"141\":\"family\",\"142\":\"thin-crust\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(852, 25.99, '{\"141\":\"family\",\"142\":\"double-decker\"}', '', 0, 0, 0, 260, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(853, 14.99, '{\"143\":\"small\",\"144\":\"hand-tosset\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(854, 15.99, '{\"143\":\"small\",\"144\":\"thin-crust\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(855, 16.99, '{\"143\":\"small\",\"144\":\"double-decker\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(856, 17.99, '{\"143\":\"medium\",\"144\":\"hand-tosset\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(857, 18.99, '{\"143\":\"medium\",\"144\":\"thin-crust\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(858, 19.99, '{\"143\":\"medium\",\"144\":\"double-decker\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(859, 20.99, '{\"143\":\"large\",\"144\":\"hand-tosset\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(860, 21.99, '{\"143\":\"large\",\"144\":\"thin-crust\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(861, 22.99, '{\"143\":\"large\",\"144\":\"double-decker\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(862, 23.99, '{\"143\":\"family\",\"144\":\"hand-tosset\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(863, 24.99, '{\"143\":\"family\",\"144\":\"thin-crust\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(864, 25.99, '{\"143\":\"family\",\"144\":\"double-decker\"}', '', 0, 0, 0, 261, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(865, 10.49, '{\"145\":\"small\",\"146\":\"hand-tosset\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(866, 11.49, '{\"145\":\"small\",\"146\":\"thin-crust\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(867, 12.49, '{\"145\":\"small\",\"146\":\"double-decker\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(868, 13.49, '{\"145\":\"medium\",\"146\":\"hand-tosset\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(869, 14.49, '{\"145\":\"medium\",\"146\":\"thin-crust\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(870, 15.49, '{\"145\":\"medium\",\"146\":\"double-decker\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(871, 16.49, '{\"145\":\"large\",\"146\":\"hand-tosset\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(872, 17.49, '{\"145\":\"large\",\"146\":\"thin-crust\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(873, 18.49, '{\"145\":\"large\",\"146\":\"double-decker\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(874, 19.49, '{\"145\":\"family\",\"146\":\"hand-tosset\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(875, 20.49, '{\"145\":\"family\",\"146\":\"thin-crust\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(876, 21.49, '{\"145\":\"family\",\"146\":\"double-decker\"}', '', 0, 0, 0, 262, '2024-06-08 15:57:43', '2024-06-08 15:57:43', NULL, 0),
(877, 39.99, '{\"147\":\"small\",\"148\":\"hand-tosset\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(878, 40.99, '{\"147\":\"small\",\"148\":\"thin-crust\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(879, 41.99, '{\"147\":\"small\",\"148\":\"double-decker\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(880, 42.99, '{\"147\":\"medium\",\"148\":\"hand-tosset\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(881, 43.99, '{\"147\":\"medium\",\"148\":\"thin-crust\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(882, 44.99, '{\"147\":\"medium\",\"148\":\"double-decker\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(883, 45.99, '{\"147\":\"large\",\"148\":\"hand-tosset\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(884, 46.99, '{\"147\":\"large\",\"148\":\"thin-crust\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(885, 47.99, '{\"147\":\"large\",\"148\":\"double-decker\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(886, 48.99, '{\"147\":\"family\",\"148\":\"hand-tosset\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(887, 49.99, '{\"147\":\"family\",\"148\":\"thin-crust\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(888, 50.99, '{\"147\":\"family\",\"148\":\"double-decker\"}', '', 0, 0, 0, 263, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(889, 14.99, '{\"149\":\"small\",\"150\":\"hand-tosset\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(890, 15.99, '{\"149\":\"small\",\"150\":\"thin-crust\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(891, 16.99, '{\"149\":\"small\",\"150\":\"double-decker\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(892, 17.99, '{\"149\":\"medium\",\"150\":\"hand-tosset\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(893, 18.99, '{\"149\":\"medium\",\"150\":\"thin-crust\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(894, 19.99, '{\"149\":\"medium\",\"150\":\"double-decker\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(895, 20.99, '{\"149\":\"large\",\"150\":\"hand-tosset\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(896, 21.99, '{\"149\":\"large\",\"150\":\"thin-crust\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(897, 22.99, '{\"149\":\"large\",\"150\":\"double-decker\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(898, 23.99, '{\"149\":\"family\",\"150\":\"hand-tosset\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(899, 24.99, '{\"149\":\"family\",\"150\":\"thin-crust\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(900, 25.99, '{\"149\":\"family\",\"150\":\"double-decker\"}', '', 0, 0, 0, 264, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(901, 14.99, '{\"151\":\"small\",\"152\":\"hand-tosset\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(902, 15.99, '{\"151\":\"small\",\"152\":\"thin-crust\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(903, 16.99, '{\"151\":\"small\",\"152\":\"double-decker\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(904, 17.99, '{\"151\":\"medium\",\"152\":\"hand-tosset\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(905, 18.99, '{\"151\":\"medium\",\"152\":\"thin-crust\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(906, 19.99, '{\"151\":\"medium\",\"152\":\"double-decker\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(907, 20.99, '{\"151\":\"large\",\"152\":\"hand-tosset\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(908, 21.99, '{\"151\":\"large\",\"152\":\"thin-crust\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(909, 22.99, '{\"151\":\"large\",\"152\":\"double-decker\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(910, 23.99, '{\"151\":\"family\",\"152\":\"hand-tosset\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:44', '2024-06-08 15:57:44', NULL, 0),
(911, 24.99, '{\"151\":\"family\",\"152\":\"thin-crust\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(912, 25.99, '{\"151\":\"family\",\"152\":\"double-decker\"}', '', 0, 0, 0, 265, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(913, 14.99, '{\"153\":\"small\",\"154\":\"hand-tosset\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(914, 15.99, '{\"153\":\"small\",\"154\":\"thin-crust\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(915, 16.99, '{\"153\":\"small\",\"154\":\"double-decker\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(916, 17.99, '{\"153\":\"medium\",\"154\":\"hand-tosset\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(917, 18.99, '{\"153\":\"medium\",\"154\":\"thin-crust\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(918, 19.99, '{\"153\":\"medium\",\"154\":\"double-decker\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(919, 20.99, '{\"153\":\"large\",\"154\":\"hand-tosset\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(920, 21.99, '{\"153\":\"large\",\"154\":\"thin-crust\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(921, 22.99, '{\"153\":\"large\",\"154\":\"double-decker\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(922, 23.99, '{\"153\":\"family\",\"154\":\"hand-tosset\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(923, 24.99, '{\"153\":\"family\",\"154\":\"thin-crust\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(924, 25.99, '{\"153\":\"family\",\"154\":\"double-decker\"}', '', 0, 0, 0, 266, '2024-06-08 15:57:45', '2024-06-08 15:57:45', NULL, 0),
(925, 10.99, '{\"155\":\"small\",\"156\":\"hand-tosset\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(926, 11.99, '{\"155\":\"small\",\"156\":\"thin-crust\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(927, 12.99, '{\"155\":\"small\",\"156\":\"double-decker\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(928, 13.99, '{\"155\":\"medium\",\"156\":\"hand-tosset\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(929, 14.99, '{\"155\":\"medium\",\"156\":\"thin-crust\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(930, 15.99, '{\"155\":\"medium\",\"156\":\"double-decker\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(931, 16.99, '{\"155\":\"large\",\"156\":\"hand-tosset\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(932, 17.99, '{\"155\":\"large\",\"156\":\"thin-crust\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(933, 18.99, '{\"155\":\"large\",\"156\":\"double-decker\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(934, 19.99, '{\"155\":\"family\",\"156\":\"hand-tosset\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(935, 20.99, '{\"155\":\"family\",\"156\":\"thin-crust\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(936, 21.99, '{\"155\":\"family\",\"156\":\"double-decker\"}', '', 0, 0, 0, 316, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(937, 14.99, '{\"157\":\"small\",\"158\":\"hand-tosset\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(938, 15.99, '{\"157\":\"small\",\"158\":\"thin-crust\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(939, 16.99, '{\"157\":\"small\",\"158\":\"double-decker\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(940, 17.99, '{\"157\":\"medium\",\"158\":\"hand-tosset\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(941, 18.99, '{\"157\":\"medium\",\"158\":\"thin-crust\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:49', '2024-06-08 15:57:49', NULL, 0),
(942, 19.99, '{\"157\":\"medium\",\"158\":\"double-decker\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(943, 20.99, '{\"157\":\"large\",\"158\":\"hand-tosset\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(944, 21.99, '{\"157\":\"large\",\"158\":\"thin-crust\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(945, 22.99, '{\"157\":\"large\",\"158\":\"double-decker\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(946, 23.99, '{\"157\":\"family\",\"158\":\"hand-tosset\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(947, 24.99, '{\"157\":\"family\",\"158\":\"thin-crust\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(948, 25.99, '{\"157\":\"family\",\"158\":\"double-decker\"}', '', 0, 0, 0, 317, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(949, 14.99, '{\"159\":\"small\",\"160\":\"hand-tosset\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(950, 15.99, '{\"159\":\"small\",\"160\":\"thin-crust\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(951, 16.99, '{\"159\":\"small\",\"160\":\"double-decker\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(952, 17.99, '{\"159\":\"medium\",\"160\":\"hand-tosset\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(953, 18.99, '{\"159\":\"medium\",\"160\":\"thin-crust\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(954, 19.99, '{\"159\":\"medium\",\"160\":\"double-decker\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(955, 20.99, '{\"159\":\"large\",\"160\":\"hand-tosset\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(956, 21.99, '{\"159\":\"large\",\"160\":\"thin-crust\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(957, 22.99, '{\"159\":\"large\",\"160\":\"double-decker\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(958, 23.99, '{\"159\":\"family\",\"160\":\"hand-tosset\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(959, 24.99, '{\"159\":\"family\",\"160\":\"thin-crust\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(960, 25.99, '{\"159\":\"family\",\"160\":\"double-decker\"}', '', 0, 0, 0, 318, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(961, 14.99, '{\"161\":\"small\",\"162\":\"hand-tosset\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(962, 15.99, '{\"161\":\"small\",\"162\":\"thin-crust\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(963, 16.99, '{\"161\":\"small\",\"162\":\"double-decker\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(964, 17.99, '{\"161\":\"medium\",\"162\":\"hand-tosset\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:50', '2024-06-08 15:57:50', NULL, 0),
(965, 18.99, '{\"161\":\"medium\",\"162\":\"thin-crust\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(966, 19.99, '{\"161\":\"medium\",\"162\":\"double-decker\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(967, 20.99, '{\"161\":\"large\",\"162\":\"hand-tosset\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(968, 21.99, '{\"161\":\"large\",\"162\":\"thin-crust\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(969, 22.99, '{\"161\":\"large\",\"162\":\"double-decker\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(970, 23.99, '{\"161\":\"family\",\"162\":\"hand-tosset\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(971, 24.99, '{\"161\":\"family\",\"162\":\"thin-crust\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(972, 25.99, '{\"161\":\"family\",\"162\":\"double-decker\"}', '', 0, 0, 0, 319, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(973, 14.99, '{\"163\":\"small\",\"164\":\"hand-tosset\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(974, 15.99, '{\"163\":\"small\",\"164\":\"thin-crust\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(975, 16.99, '{\"163\":\"small\",\"164\":\"double-decker\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(976, 17.99, '{\"163\":\"medium\",\"164\":\"hand-tosset\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(977, 18.99, '{\"163\":\"medium\",\"164\":\"thin-crust\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(978, 19.99, '{\"163\":\"medium\",\"164\":\"double-decker\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(979, 20.99, '{\"163\":\"large\",\"164\":\"hand-tosset\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(980, 21.99, '{\"163\":\"large\",\"164\":\"thin-crust\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(981, 22.99, '{\"163\":\"large\",\"164\":\"double-decker\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(982, 23.99, '{\"163\":\"family\",\"164\":\"hand-tosset\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(983, 24.99, '{\"163\":\"family\",\"164\":\"thin-crust\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(984, 25.99, '{\"163\":\"family\",\"164\":\"double-decker\"}', '', 0, 0, 0, 320, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(985, 14.99, '{\"165\":\"small\",\"166\":\"hand-tosset\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(986, 15.99, '{\"165\":\"small\",\"166\":\"thin-crust\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(987, 16.99, '{\"165\":\"small\",\"166\":\"double-decker\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(988, 17.99, '{\"165\":\"medium\",\"166\":\"hand-tosset\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(989, 18.99, '{\"165\":\"medium\",\"166\":\"thin-crust\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(990, 19.99, '{\"165\":\"medium\",\"166\":\"double-decker\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(991, 20.99, '{\"165\":\"large\",\"166\":\"hand-tosset\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(992, 21.99, '{\"165\":\"large\",\"166\":\"thin-crust\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(993, 22.99, '{\"165\":\"large\",\"166\":\"double-decker\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(994, 23.99, '{\"165\":\"family\",\"166\":\"hand-tosset\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:51', '2024-06-08 15:57:51', NULL, 0),
(995, 24.99, '{\"165\":\"family\",\"166\":\"thin-crust\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(996, 25.99, '{\"165\":\"family\",\"166\":\"double-decker\"}', '', 0, 0, 0, 321, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(997, 10.49, '{\"167\":\"small\",\"168\":\"hand-tosset\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(998, 11.49, '{\"167\":\"small\",\"168\":\"thin-crust\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(999, 12.49, '{\"167\":\"small\",\"168\":\"double-decker\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1000, 13.49, '{\"167\":\"medium\",\"168\":\"hand-tosset\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1001, 14.49, '{\"167\":\"medium\",\"168\":\"thin-crust\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1002, 15.49, '{\"167\":\"medium\",\"168\":\"double-decker\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1003, 16.49, '{\"167\":\"large\",\"168\":\"hand-tosset\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1004, 17.49, '{\"167\":\"large\",\"168\":\"thin-crust\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1005, 18.49, '{\"167\":\"large\",\"168\":\"double-decker\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1006, 19.49, '{\"167\":\"family\",\"168\":\"hand-tosset\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1007, 20.49, '{\"167\":\"family\",\"168\":\"thin-crust\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1008, 21.49, '{\"167\":\"family\",\"168\":\"double-decker\"}', '', 0, 0, 0, 322, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1009, 39.99, '{\"169\":\"small\",\"170\":\"hand-tosset\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1010, 40.99, '{\"169\":\"small\",\"170\":\"thin-crust\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1011, 41.99, '{\"169\":\"small\",\"170\":\"double-decker\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1012, 42.99, '{\"169\":\"medium\",\"170\":\"hand-tosset\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1013, 43.99, '{\"169\":\"medium\",\"170\":\"thin-crust\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1014, 44.99, '{\"169\":\"medium\",\"170\":\"double-decker\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1015, 45.99, '{\"169\":\"large\",\"170\":\"hand-tosset\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1016, 46.99, '{\"169\":\"large\",\"170\":\"thin-crust\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1017, 47.99, '{\"169\":\"large\",\"170\":\"double-decker\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1018, 48.99, '{\"169\":\"family\",\"170\":\"hand-tosset\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1019, 49.99, '{\"169\":\"family\",\"170\":\"thin-crust\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:52', '2024-06-08 15:57:52', NULL, 0),
(1020, 50.99, '{\"169\":\"family\",\"170\":\"double-decker\"}', '', 0, 0, 0, 323, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1021, 14.99, '{\"171\":\"small\",\"172\":\"hand-tosset\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1022, 15.99, '{\"171\":\"small\",\"172\":\"thin-crust\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1023, 16.99, '{\"171\":\"small\",\"172\":\"double-decker\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1024, 17.99, '{\"171\":\"medium\",\"172\":\"hand-tosset\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1025, 18.99, '{\"171\":\"medium\",\"172\":\"thin-crust\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1026, 19.99, '{\"171\":\"medium\",\"172\":\"double-decker\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1027, 20.99, '{\"171\":\"large\",\"172\":\"hand-tosset\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1028, 21.99, '{\"171\":\"large\",\"172\":\"thin-crust\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1029, 22.99, '{\"171\":\"large\",\"172\":\"double-decker\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1030, 23.99, '{\"171\":\"family\",\"172\":\"hand-tosset\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1031, 24.99, '{\"171\":\"family\",\"172\":\"thin-crust\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1032, 25.99, '{\"171\":\"family\",\"172\":\"double-decker\"}', '', 0, 0, 0, 324, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1033, 14.99, '{\"173\":\"small\",\"174\":\"hand-tosset\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:53', '2024-06-08 15:57:53', NULL, 0),
(1034, 15.99, '{\"173\":\"small\",\"174\":\"thin-crust\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1035, 16.99, '{\"173\":\"small\",\"174\":\"double-decker\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1036, 17.99, '{\"173\":\"medium\",\"174\":\"hand-tosset\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1037, 18.99, '{\"173\":\"medium\",\"174\":\"thin-crust\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1038, 19.99, '{\"173\":\"medium\",\"174\":\"double-decker\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1039, 20.99, '{\"173\":\"large\",\"174\":\"hand-tosset\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1040, 21.99, '{\"173\":\"large\",\"174\":\"thin-crust\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1041, 22.99, '{\"173\":\"large\",\"174\":\"double-decker\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1042, 23.99, '{\"173\":\"family\",\"174\":\"hand-tosset\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1043, 24.99, '{\"173\":\"family\",\"174\":\"thin-crust\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1044, 25.99, '{\"173\":\"family\",\"174\":\"double-decker\"}', '', 0, 0, 0, 325, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1045, 14.99, '{\"175\":\"small\",\"176\":\"hand-tosset\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1046, 15.99, '{\"175\":\"small\",\"176\":\"thin-crust\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1047, 16.99, '{\"175\":\"small\",\"176\":\"double-decker\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1048, 17.99, '{\"175\":\"medium\",\"176\":\"hand-tosset\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1049, 18.99, '{\"175\":\"medium\",\"176\":\"thin-crust\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1050, 19.99, '{\"175\":\"medium\",\"176\":\"double-decker\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1051, 20.99, '{\"175\":\"large\",\"176\":\"hand-tosset\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1052, 21.99, '{\"175\":\"large\",\"176\":\"thin-crust\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1053, 22.99, '{\"175\":\"large\",\"176\":\"double-decker\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:54', '2024-06-08 15:57:54', NULL, 0),
(1054, 23.99, '{\"175\":\"family\",\"176\":\"hand-tosset\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 0),
(1055, 24.99, '{\"175\":\"family\",\"176\":\"thin-crust\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 0),
(1056, 25.99, '{\"175\":\"family\",\"176\":\"double-decker\"}', '', 0, 0, 0, 326, '2024-06-08 15:57:55', '2024-06-08 15:57:55', NULL, 0),
(1060, 500.00, '{\"177\":\"small\"}', '', -34, 0, 0, 341, '2024-06-09 08:37:22', '2024-08-02 06:58:41', NULL, 0),
(1063, 1000.00, '{\"177\":\"medium\"}', '', -2, 0, 0, 341, '2024-06-09 08:37:29', '2024-08-02 06:58:57', NULL, 0),
(1065, 1500.00, '{\"177\":\"large\"}', '', -1, 0, 0, 341, '2024-06-09 08:37:35', '2024-08-02 06:59:15', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `variants_has_extras`
--

CREATE TABLE `variants_has_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `extra_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants_has_extras`
--

INSERT INTO `variants_has_extras` (`id`, `created_at`, `updated_at`, `variant_id`, `extra_id`) VALUES
(1, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 1, 21),
(2, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 2, 21),
(3, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 3, 21),
(4, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 4, 21),
(5, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 5, 21),
(6, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 6, 21),
(7, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 7, 22),
(8, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 8, 22),
(9, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 9, 22),
(10, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 10, 22),
(11, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 11, 22),
(12, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 12, 22),
(13, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 13, 25),
(14, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 14, 25),
(15, '2024-06-08 15:56:53', '2024-06-08 15:56:53', 15, 25),
(16, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 16, 25),
(17, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 17, 25),
(18, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 18, 25),
(19, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 19, 26),
(20, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 20, 26),
(21, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 21, 26),
(22, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 22, 26),
(23, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 23, 26),
(24, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 24, 26),
(25, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 25, 29),
(26, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 26, 29),
(27, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 27, 29),
(28, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 28, 29),
(29, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 29, 29),
(30, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 30, 29),
(31, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 31, 30),
(32, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 32, 30),
(33, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 33, 30),
(34, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 34, 30),
(35, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 35, 30),
(36, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 36, 30),
(37, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 37, 33),
(38, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 38, 33),
(39, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 39, 33),
(40, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 40, 33),
(41, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 41, 33),
(42, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 42, 33),
(43, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 43, 34),
(44, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 44, 34),
(45, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 45, 34),
(46, '2024-06-08 15:56:54', '2024-06-08 15:56:54', 46, 34),
(47, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 47, 34),
(48, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 48, 34),
(49, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 49, 37),
(50, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 50, 37),
(51, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 51, 37),
(52, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 52, 37),
(53, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 53, 37),
(54, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 54, 37),
(55, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 55, 38),
(56, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 56, 38),
(57, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 57, 38),
(58, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 58, 38),
(59, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 59, 38),
(60, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 60, 38),
(61, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 61, 41),
(62, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 62, 41),
(63, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 63, 41),
(64, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 64, 41),
(65, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 65, 41),
(66, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 66, 41),
(67, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 67, 42),
(68, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 68, 42),
(69, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 69, 42),
(70, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 70, 42),
(71, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 71, 42),
(72, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 72, 42),
(73, '2024-06-08 15:56:55', '2024-06-08 15:56:55', 73, 45),
(74, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 74, 45),
(75, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 75, 45),
(76, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 76, 45),
(77, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 77, 45),
(78, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 78, 45),
(79, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 79, 46),
(80, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 80, 46),
(81, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 81, 46),
(82, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 82, 46),
(83, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 83, 46),
(84, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 84, 46),
(85, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 85, 49),
(86, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 86, 49),
(87, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 87, 49),
(88, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 88, 49),
(89, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 89, 49),
(90, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 90, 49),
(91, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 91, 50),
(92, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 92, 50),
(93, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 93, 50),
(94, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 94, 50),
(95, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 95, 50),
(96, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 96, 50),
(97, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 97, 53),
(98, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 98, 53),
(99, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 99, 53),
(100, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 100, 53),
(101, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 101, 53),
(102, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 102, 53),
(103, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 103, 54),
(104, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 104, 54),
(105, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 105, 54),
(106, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 106, 54),
(107, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 107, 54),
(108, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 108, 54),
(109, '2024-06-08 15:56:56', '2024-06-08 15:56:56', 109, 57),
(110, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 110, 57),
(111, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 111, 57),
(112, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 112, 57),
(113, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 113, 57),
(114, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 114, 57),
(115, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 115, 58),
(116, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 116, 58),
(117, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 117, 58),
(118, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 118, 58),
(119, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 119, 58),
(120, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 120, 58),
(121, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 121, 61),
(122, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 122, 61),
(123, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 123, 61),
(124, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 124, 61),
(125, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 125, 61),
(126, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 126, 61),
(127, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 127, 62),
(128, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 128, 62),
(129, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 129, 62),
(130, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 130, 62),
(131, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 131, 62),
(132, '2024-06-08 15:56:57', '2024-06-08 15:56:57', 132, 62),
(133, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 133, 83),
(134, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 134, 83),
(135, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 135, 83),
(136, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 136, 83),
(137, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 137, 83),
(138, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 138, 83),
(139, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 139, 84),
(140, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 140, 84),
(141, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 141, 84),
(142, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 142, 84),
(143, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 143, 84),
(144, '2024-06-08 15:57:01', '2024-06-08 15:57:01', 144, 84),
(145, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 145, 87),
(146, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 146, 87),
(147, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 147, 87),
(148, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 148, 87),
(149, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 149, 87),
(150, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 150, 87),
(151, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 151, 88),
(152, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 152, 88),
(153, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 153, 88),
(154, '2024-06-08 15:57:02', '2024-06-08 15:57:02', 154, 88),
(155, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 155, 88),
(156, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 156, 88),
(157, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 157, 91),
(158, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 158, 91),
(159, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 159, 91),
(160, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 160, 91),
(161, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 161, 91),
(162, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 162, 91),
(163, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 163, 92),
(164, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 164, 92),
(165, '2024-06-08 15:57:03', '2024-06-08 15:57:03', 165, 92),
(166, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 166, 92),
(167, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 167, 92),
(168, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 168, 92),
(169, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 169, 95),
(170, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 170, 95),
(171, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 171, 95),
(172, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 172, 95),
(173, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 173, 95),
(174, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 174, 95),
(175, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 175, 96),
(176, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 176, 96),
(177, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 177, 96),
(178, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 178, 96),
(179, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 179, 96),
(180, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 180, 96),
(181, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 181, 99),
(182, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 182, 99),
(183, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 183, 99),
(184, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 184, 99),
(185, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 185, 99),
(186, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 186, 99),
(187, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 187, 100),
(188, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 188, 100),
(189, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 189, 100),
(190, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 190, 100),
(191, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 191, 100),
(192, '2024-06-08 15:57:04', '2024-06-08 15:57:04', 192, 100),
(193, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 193, 103),
(194, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 194, 103),
(195, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 195, 103),
(196, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 196, 103),
(197, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 197, 103),
(198, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 198, 103),
(199, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 199, 104),
(200, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 200, 104),
(201, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 201, 104),
(202, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 202, 104),
(203, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 203, 104),
(204, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 204, 104),
(205, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 205, 107),
(206, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 206, 107),
(207, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 207, 107),
(208, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 208, 107),
(209, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 209, 107),
(210, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 210, 107),
(211, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 211, 108),
(212, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 212, 108),
(213, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 213, 108),
(214, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 214, 108),
(215, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 215, 108),
(216, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 216, 108),
(217, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 217, 111),
(218, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 218, 111),
(219, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 219, 111),
(220, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 220, 111),
(221, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 221, 111),
(222, '2024-06-08 15:57:05', '2024-06-08 15:57:05', 222, 111),
(223, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 223, 112),
(224, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 224, 112),
(225, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 225, 112),
(226, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 226, 112),
(227, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 227, 112),
(228, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 228, 112),
(229, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 229, 115),
(230, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 230, 115),
(231, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 231, 115),
(232, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 232, 115),
(233, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 233, 115),
(234, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 234, 115),
(235, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 235, 116),
(236, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 236, 116),
(237, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 237, 116),
(238, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 238, 116),
(239, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 239, 116),
(240, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 240, 116),
(241, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 241, 119),
(242, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 242, 119),
(243, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 243, 119),
(244, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 244, 119),
(245, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 245, 119),
(246, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 246, 119),
(247, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 247, 120),
(248, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 248, 120),
(249, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 249, 120),
(250, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 250, 120),
(251, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 251, 120),
(252, '2024-06-08 15:57:06', '2024-06-08 15:57:06', 252, 120),
(253, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 253, 123),
(254, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 254, 123),
(255, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 255, 123),
(256, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 256, 123),
(257, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 257, 123),
(258, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 258, 123),
(259, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 259, 124),
(260, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 260, 124),
(261, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 261, 124),
(262, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 262, 124),
(263, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 263, 124),
(264, '2024-06-08 15:57:07', '2024-06-08 15:57:07', 264, 124),
(265, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 265, 145),
(266, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 266, 145),
(267, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 267, 145),
(268, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 268, 145),
(269, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 269, 145),
(270, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 270, 145),
(271, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 271, 146),
(272, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 272, 146),
(273, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 273, 146),
(274, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 274, 146),
(275, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 275, 146),
(276, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 276, 146),
(277, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 277, 149),
(278, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 278, 149),
(279, '2024-06-08 15:57:08', '2024-06-08 15:57:08', 279, 149),
(280, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 280, 149),
(281, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 281, 149),
(282, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 282, 149),
(283, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 283, 150),
(284, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 284, 150),
(285, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 285, 150),
(286, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 286, 150),
(287, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 287, 150),
(288, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 288, 150),
(289, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 289, 153),
(290, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 290, 153),
(291, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 291, 153),
(292, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 292, 153),
(293, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 293, 153),
(294, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 294, 153),
(295, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 295, 154),
(296, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 296, 154),
(297, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 297, 154),
(298, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 298, 154),
(299, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 299, 154),
(300, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 300, 154),
(301, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 301, 157),
(302, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 302, 157),
(303, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 303, 157),
(304, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 304, 157),
(305, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 305, 157),
(306, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 306, 157),
(307, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 307, 158),
(308, '2024-06-08 15:57:09', '2024-06-08 15:57:09', 308, 158),
(309, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 309, 158),
(310, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 310, 158),
(311, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 311, 158),
(312, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 312, 158),
(313, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 313, 161),
(314, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 314, 161),
(315, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 315, 161),
(316, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 316, 161),
(317, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 317, 161),
(318, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 318, 161),
(319, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 319, 162),
(320, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 320, 162),
(321, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 321, 162),
(322, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 322, 162),
(323, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 323, 162),
(324, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 324, 162),
(325, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 325, 165),
(326, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 326, 165),
(327, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 327, 165),
(328, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 328, 165),
(329, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 329, 165),
(330, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 330, 165),
(331, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 331, 166),
(332, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 332, 166),
(333, '2024-06-08 15:57:10', '2024-06-08 15:57:10', 333, 166),
(334, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 334, 166),
(335, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 335, 166),
(336, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 336, 166),
(337, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 337, 169),
(338, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 338, 169),
(339, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 339, 169),
(340, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 340, 169),
(341, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 341, 169),
(342, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 342, 169),
(343, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 343, 170),
(344, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 344, 170),
(345, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 345, 170),
(346, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 346, 170),
(347, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 347, 170),
(348, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 348, 170),
(349, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 349, 173),
(350, '2024-06-08 15:57:11', '2024-06-08 15:57:11', 350, 173),
(351, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 351, 173),
(352, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 352, 173),
(353, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 353, 173),
(354, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 354, 173),
(355, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 355, 174),
(356, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 356, 174),
(357, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 357, 174),
(358, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 358, 174),
(359, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 359, 174),
(360, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 360, 174),
(361, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 361, 177),
(362, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 362, 177),
(363, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 363, 177),
(364, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 364, 177),
(365, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 365, 177),
(366, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 366, 177),
(367, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 367, 178),
(368, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 368, 178),
(369, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 369, 178),
(370, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 370, 178),
(371, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 371, 178),
(372, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 372, 178),
(373, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 373, 181),
(374, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 374, 181),
(375, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 375, 181),
(376, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 376, 181),
(377, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 377, 181),
(378, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 378, 181),
(379, '2024-06-08 15:57:12', '2024-06-08 15:57:12', 379, 182),
(380, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 380, 182),
(381, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 381, 182),
(382, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 382, 182),
(383, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 383, 182),
(384, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 384, 182),
(385, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 385, 185),
(386, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 386, 185),
(387, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 387, 185),
(388, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 388, 185),
(389, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 389, 185),
(390, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 390, 185),
(391, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 391, 186),
(392, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 392, 186),
(393, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 393, 186),
(394, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 394, 186),
(395, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 395, 186),
(396, '2024-06-08 15:57:13', '2024-06-08 15:57:13', 396, 186),
(397, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 397, 189),
(398, '2024-06-08 15:57:16', '2024-06-08 15:57:16', 398, 189),
(399, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 399, 189),
(400, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 400, 189),
(401, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 401, 189),
(402, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 402, 189),
(403, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 403, 190),
(404, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 404, 190),
(405, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 405, 190),
(406, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 406, 190),
(407, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 407, 190),
(408, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 408, 190),
(409, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 409, 193),
(410, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 410, 193),
(411, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 411, 193),
(412, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 412, 193),
(413, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 413, 193),
(414, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 414, 193),
(415, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 415, 194),
(416, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 416, 194),
(417, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 417, 194),
(418, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 418, 194),
(419, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 419, 194),
(420, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 420, 194),
(421, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 421, 197),
(422, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 422, 197),
(423, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 423, 197),
(424, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 424, 197),
(425, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 425, 197),
(426, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 426, 197),
(427, '2024-06-08 15:57:17', '2024-06-08 15:57:17', 427, 198),
(428, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 428, 198),
(429, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 429, 198),
(430, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 430, 198),
(431, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 431, 198),
(432, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 432, 198),
(433, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 433, 201),
(434, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 434, 201),
(435, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 435, 201),
(436, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 436, 201),
(437, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 437, 201),
(438, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 438, 201),
(439, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 439, 202),
(440, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 440, 202),
(441, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 441, 202),
(442, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 442, 202),
(443, '2024-06-08 15:57:18', '2024-06-08 15:57:18', 443, 202),
(444, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 444, 202),
(445, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 445, 205),
(446, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 446, 205),
(447, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 447, 205),
(448, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 448, 205),
(449, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 449, 205),
(450, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 450, 205),
(451, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 451, 206),
(452, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 452, 206),
(453, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 453, 206),
(454, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 454, 206),
(455, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 455, 206),
(456, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 456, 206),
(457, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 457, 209),
(458, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 458, 209),
(459, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 459, 209),
(460, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 460, 209),
(461, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 461, 209),
(462, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 462, 209),
(463, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 463, 210),
(464, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 464, 210),
(465, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 465, 210),
(466, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 466, 210),
(467, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 467, 210),
(468, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 468, 210),
(469, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 469, 213),
(470, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 470, 213),
(471, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 471, 213),
(472, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 472, 213),
(473, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 473, 213),
(474, '2024-06-08 15:57:19', '2024-06-08 15:57:19', 474, 213),
(475, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 475, 214),
(476, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 476, 214),
(477, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 477, 214),
(478, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 478, 214),
(479, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 479, 214),
(480, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 480, 214),
(481, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 481, 217),
(482, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 482, 217),
(483, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 483, 217),
(484, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 484, 217),
(485, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 485, 217),
(486, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 486, 217),
(487, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 487, 218),
(488, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 488, 218),
(489, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 489, 218),
(490, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 490, 218),
(491, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 491, 218),
(492, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 492, 218),
(493, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 493, 221),
(494, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 494, 221),
(495, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 495, 221),
(496, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 496, 221),
(497, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 497, 221),
(498, '2024-06-08 15:57:20', '2024-06-08 15:57:20', 498, 221),
(499, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 499, 222),
(500, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 500, 222),
(501, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 501, 222),
(502, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 502, 222),
(503, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 503, 222),
(504, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 504, 222),
(505, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 505, 225),
(506, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 506, 225),
(507, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 507, 225),
(508, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 508, 225),
(509, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 509, 225),
(510, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 510, 225),
(511, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 511, 226),
(512, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 512, 226),
(513, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 513, 226),
(514, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 514, 226),
(515, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 515, 226),
(516, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 516, 226),
(517, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 517, 229),
(518, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 518, 229),
(519, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 519, 229),
(520, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 520, 229),
(521, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 521, 229),
(522, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 522, 229),
(523, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 523, 230),
(524, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 524, 230),
(525, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 525, 230),
(526, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 526, 230),
(527, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 527, 230),
(528, '2024-06-08 15:57:21', '2024-06-08 15:57:21', 528, 230),
(529, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 529, 251),
(530, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 530, 251),
(531, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 531, 251),
(532, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 532, 251),
(533, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 533, 251),
(534, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 534, 251),
(535, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 535, 252),
(536, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 536, 252),
(537, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 537, 252),
(538, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 538, 252),
(539, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 539, 252),
(540, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 540, 252),
(541, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 541, 255),
(542, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 542, 255),
(543, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 543, 255),
(544, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 544, 255),
(545, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 545, 255),
(546, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 546, 255),
(547, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 547, 256),
(548, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 548, 256),
(549, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 549, 256),
(550, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 550, 256),
(551, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 551, 256),
(552, '2024-06-08 15:57:23', '2024-06-08 15:57:23', 552, 256),
(553, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 553, 259),
(554, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 554, 259),
(555, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 555, 259),
(556, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 556, 259),
(557, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 557, 259),
(558, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 558, 259),
(559, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 559, 260),
(560, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 560, 260),
(561, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 561, 260),
(562, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 562, 260),
(563, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 563, 260),
(564, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 564, 260),
(565, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 565, 263),
(566, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 566, 263),
(567, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 567, 263),
(568, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 568, 263),
(569, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 569, 263),
(570, '2024-06-08 15:57:24', '2024-06-08 15:57:24', 570, 263),
(571, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 571, 264),
(572, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 572, 264),
(573, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 573, 264),
(574, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 574, 264),
(575, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 575, 264),
(576, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 576, 264),
(577, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 577, 267),
(578, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 578, 267),
(579, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 579, 267),
(580, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 580, 267),
(581, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 581, 267),
(582, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 582, 267),
(583, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 583, 268),
(584, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 584, 268),
(585, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 585, 268),
(586, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 586, 268),
(587, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 587, 268),
(588, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 588, 268),
(589, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 589, 271),
(590, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 590, 271),
(591, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 591, 271),
(592, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 592, 271),
(593, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 593, 271),
(594, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 594, 271),
(595, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 595, 272),
(596, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 596, 272),
(597, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 597, 272),
(598, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 598, 272),
(599, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 599, 272),
(600, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 600, 272),
(601, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 601, 275),
(602, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 602, 275),
(603, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 603, 275),
(604, '2024-06-08 15:57:25', '2024-06-08 15:57:25', 604, 275),
(605, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 605, 275),
(606, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 606, 275),
(607, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 607, 276),
(608, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 608, 276),
(609, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 609, 276),
(610, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 610, 276),
(611, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 611, 276),
(612, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 612, 276),
(613, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 613, 279),
(614, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 614, 279),
(615, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 615, 279),
(616, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 616, 279),
(617, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 617, 279),
(618, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 618, 279),
(619, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 619, 280),
(620, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 620, 280),
(621, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 621, 280),
(622, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 622, 280),
(623, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 623, 280),
(624, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 624, 280),
(625, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 625, 283),
(626, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 626, 283),
(627, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 627, 283),
(628, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 628, 283),
(629, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 629, 283),
(630, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 630, 283),
(631, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 631, 284),
(632, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 632, 284),
(633, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 633, 284),
(634, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 634, 284),
(635, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 635, 284),
(636, '2024-06-08 15:57:26', '2024-06-08 15:57:26', 636, 284),
(637, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 637, 287),
(638, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 638, 287),
(639, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 639, 287),
(640, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 640, 287),
(641, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 641, 287),
(642, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 642, 287),
(643, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 643, 288),
(644, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 644, 288),
(645, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 645, 288),
(646, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 646, 288),
(647, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 647, 288),
(648, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 648, 288),
(649, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 649, 291),
(650, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 650, 291),
(651, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 651, 291),
(652, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 652, 291),
(653, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 653, 291),
(654, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 654, 291),
(655, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 655, 292),
(656, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 656, 292),
(657, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 657, 292),
(658, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 658, 292),
(659, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 659, 292),
(660, '2024-06-08 15:57:27', '2024-06-08 15:57:27', 660, 292),
(661, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 661, 331),
(662, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 662, 331),
(663, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 663, 331),
(664, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 664, 331),
(665, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 665, 331),
(666, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 666, 331),
(667, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 667, 332),
(668, '2024-06-08 15:57:32', '2024-06-08 15:57:32', 668, 332),
(669, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 669, 332),
(670, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 670, 332),
(671, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 671, 332),
(672, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 672, 332),
(673, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 673, 335),
(674, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 674, 335),
(675, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 675, 335),
(676, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 676, 335),
(677, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 677, 335),
(678, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 678, 335),
(679, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 679, 336),
(680, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 680, 336),
(681, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 681, 336),
(682, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 682, 336),
(683, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 683, 336),
(684, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 684, 336),
(685, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 685, 339),
(686, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 686, 339),
(687, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 687, 339),
(688, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 688, 339),
(689, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 689, 339),
(690, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 690, 339),
(691, '2024-06-08 15:57:33', '2024-06-08 15:57:33', 691, 340),
(692, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 692, 340),
(693, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 693, 340),
(694, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 694, 340),
(695, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 695, 340),
(696, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 696, 340),
(697, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 697, 343),
(698, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 698, 343),
(699, '2024-06-08 15:57:34', '2024-06-08 15:57:34', 699, 343),
(700, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 700, 343),
(701, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 701, 343),
(702, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 702, 343),
(703, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 703, 344),
(704, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 704, 344),
(705, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 705, 344),
(706, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 706, 344),
(707, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 707, 344),
(708, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 708, 344),
(709, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 709, 347),
(710, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 710, 347),
(711, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 711, 347),
(712, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 712, 347),
(713, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 713, 347),
(714, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 714, 347),
(715, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 715, 348),
(716, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 716, 348),
(717, '2024-06-08 15:57:35', '2024-06-08 15:57:35', 717, 348),
(718, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 718, 348),
(719, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 719, 348),
(720, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 720, 348),
(721, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 721, 351),
(722, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 722, 351),
(723, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 723, 351),
(724, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 724, 351),
(725, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 725, 351),
(726, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 726, 351),
(727, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 727, 352),
(728, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 728, 352),
(729, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 729, 352),
(730, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 730, 352),
(731, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 731, 352),
(732, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 732, 352),
(733, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 733, 355),
(734, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 734, 355),
(735, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 735, 355),
(736, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 736, 355),
(737, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 737, 355),
(738, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 738, 355),
(739, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 739, 356),
(740, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 740, 356),
(741, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 741, 356),
(742, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 742, 356),
(743, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 743, 356),
(744, '2024-06-08 15:57:36', '2024-06-08 15:57:36', 744, 356),
(745, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 745, 359),
(746, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 746, 359),
(747, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 747, 359),
(748, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 748, 359),
(749, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 749, 359),
(750, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 750, 359),
(751, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 751, 360),
(752, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 752, 360),
(753, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 753, 360),
(754, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 754, 360),
(755, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 755, 360),
(756, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 756, 360),
(757, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 757, 363),
(758, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 758, 363),
(759, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 759, 363),
(760, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 760, 363),
(761, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 761, 363),
(762, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 762, 363),
(763, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 763, 364),
(764, '2024-06-08 15:57:37', '2024-06-08 15:57:37', 764, 364),
(765, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 765, 364),
(766, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 766, 364),
(767, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 767, 364),
(768, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 768, 364),
(769, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 769, 367),
(770, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 770, 367),
(771, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 771, 367),
(772, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 772, 367),
(773, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 773, 367),
(774, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 774, 367),
(775, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 775, 368),
(776, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 776, 368),
(777, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 777, 368),
(778, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 778, 368),
(779, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 779, 368),
(780, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 780, 368),
(781, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 781, 371),
(782, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 782, 371),
(783, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 783, 371),
(784, '2024-06-08 15:57:38', '2024-06-08 15:57:38', 784, 371),
(785, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 785, 371),
(786, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 786, 371),
(787, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 787, 372),
(788, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 788, 372),
(789, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 789, 372),
(790, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 790, 372),
(791, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 791, 372),
(792, '2024-06-08 15:57:39', '2024-06-08 15:57:39', 792, 372),
(793, '2024-06-08 15:57:40', '2024-06-08 15:57:40', 793, 375),
(794, '2024-06-08 15:57:40', '2024-06-08 15:57:40', 794, 375),
(795, '2024-06-08 15:57:40', '2024-06-08 15:57:40', 795, 375),
(796, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 796, 375),
(797, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 797, 375),
(798, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 798, 375),
(799, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 799, 376),
(800, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 800, 376),
(801, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 801, 376),
(802, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 802, 376),
(803, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 803, 376),
(804, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 804, 376),
(805, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 805, 379),
(806, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 806, 379),
(807, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 807, 379),
(808, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 808, 379),
(809, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 809, 379),
(810, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 810, 379),
(811, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 811, 380),
(812, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 812, 380),
(813, '2024-06-08 15:57:41', '2024-06-08 15:57:41', 813, 380),
(814, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 814, 380),
(815, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 815, 380),
(816, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 816, 380),
(817, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 817, 383),
(818, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 818, 383),
(819, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 819, 383),
(820, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 820, 383),
(821, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 821, 383),
(822, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 822, 383),
(823, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 823, 384),
(824, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 824, 384);
INSERT INTO `variants_has_extras` (`id`, `created_at`, `updated_at`, `variant_id`, `extra_id`) VALUES
(825, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 825, 384),
(826, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 826, 384),
(827, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 827, 384),
(828, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 828, 384),
(829, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 829, 387),
(830, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 830, 387),
(831, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 831, 387),
(832, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 832, 387),
(833, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 833, 387),
(834, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 834, 387),
(835, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 835, 388),
(836, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 836, 388),
(837, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 837, 388),
(838, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 838, 388),
(839, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 839, 388),
(840, '2024-06-08 15:57:42', '2024-06-08 15:57:42', 840, 388),
(841, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 841, 391),
(842, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 842, 391),
(843, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 843, 391),
(844, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 844, 391),
(845, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 845, 391),
(846, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 846, 391),
(847, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 847, 392),
(848, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 848, 392),
(849, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 849, 392),
(850, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 850, 392),
(851, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 851, 392),
(852, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 852, 392),
(853, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 853, 395),
(854, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 854, 395),
(855, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 855, 395),
(856, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 856, 395),
(857, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 857, 395),
(858, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 858, 395),
(859, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 859, 396),
(860, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 860, 396),
(861, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 861, 396),
(862, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 862, 396),
(863, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 863, 396),
(864, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 864, 396),
(865, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 865, 399),
(866, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 866, 399),
(867, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 867, 399),
(868, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 868, 399),
(869, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 869, 399),
(870, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 870, 399),
(871, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 871, 400),
(872, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 872, 400),
(873, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 873, 400),
(874, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 874, 400),
(875, '2024-06-08 15:57:43', '2024-06-08 15:57:43', 875, 400),
(876, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 876, 400),
(877, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 877, 403),
(878, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 878, 403),
(879, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 879, 403),
(880, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 880, 403),
(881, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 881, 403),
(882, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 882, 403),
(883, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 883, 404),
(884, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 884, 404),
(885, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 885, 404),
(886, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 886, 404),
(887, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 887, 404),
(888, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 888, 404),
(889, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 889, 407),
(890, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 890, 407),
(891, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 891, 407),
(892, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 892, 407),
(893, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 893, 407),
(894, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 894, 407),
(895, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 895, 408),
(896, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 896, 408),
(897, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 897, 408),
(898, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 898, 408),
(899, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 899, 408),
(900, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 900, 408),
(901, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 901, 411),
(902, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 902, 411),
(903, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 903, 411),
(904, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 904, 411),
(905, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 905, 411),
(906, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 906, 411),
(907, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 907, 412),
(908, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 908, 412),
(909, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 909, 412),
(910, '2024-06-08 15:57:44', '2024-06-08 15:57:44', 910, 412),
(911, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 911, 412),
(912, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 912, 412),
(913, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 913, 415),
(914, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 914, 415),
(915, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 915, 415),
(916, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 916, 415),
(917, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 917, 415),
(918, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 918, 415),
(919, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 919, 416),
(920, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 920, 416),
(921, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 921, 416),
(922, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 922, 416),
(923, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 923, 416),
(924, '2024-06-08 15:57:45', '2024-06-08 15:57:45', 924, 416),
(925, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 925, 437),
(926, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 926, 437),
(927, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 927, 437),
(928, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 928, 437),
(929, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 929, 437),
(930, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 930, 437),
(931, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 931, 438),
(932, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 932, 438),
(933, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 933, 438),
(934, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 934, 438),
(935, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 935, 438),
(936, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 936, 438),
(937, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 937, 441),
(938, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 938, 441),
(939, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 939, 441),
(940, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 940, 441),
(941, '2024-06-08 15:57:49', '2024-06-08 15:57:49', 941, 441),
(942, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 942, 441),
(943, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 943, 442),
(944, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 944, 442),
(945, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 945, 442),
(946, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 946, 442),
(947, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 947, 442),
(948, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 948, 442),
(949, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 949, 445),
(950, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 950, 445),
(951, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 951, 445),
(952, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 952, 445),
(953, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 953, 445),
(954, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 954, 445),
(955, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 955, 446),
(956, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 956, 446),
(957, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 957, 446),
(958, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 958, 446),
(959, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 959, 446),
(960, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 960, 446),
(961, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 961, 449),
(962, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 962, 449),
(963, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 963, 449),
(964, '2024-06-08 15:57:50', '2024-06-08 15:57:50', 964, 449),
(965, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 965, 449),
(966, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 966, 449),
(967, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 967, 450),
(968, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 968, 450),
(969, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 969, 450),
(970, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 970, 450),
(971, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 971, 450),
(972, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 972, 450),
(973, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 973, 453),
(974, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 974, 453),
(975, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 975, 453),
(976, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 976, 453),
(977, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 977, 453),
(978, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 978, 453),
(979, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 979, 454),
(980, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 980, 454),
(981, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 981, 454),
(982, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 982, 454),
(983, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 983, 454),
(984, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 984, 454),
(985, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 985, 457),
(986, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 986, 457),
(987, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 987, 457),
(988, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 988, 457),
(989, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 989, 457),
(990, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 990, 457),
(991, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 991, 458),
(992, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 992, 458),
(993, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 993, 458),
(994, '2024-06-08 15:57:51', '2024-06-08 15:57:51', 994, 458),
(995, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 995, 458),
(996, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 996, 458),
(997, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 997, 461),
(998, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 998, 461),
(999, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 999, 461),
(1000, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1000, 461),
(1001, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1001, 461),
(1002, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1002, 461),
(1003, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1003, 462),
(1004, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1004, 462),
(1005, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1005, 462),
(1006, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1006, 462),
(1007, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1007, 462),
(1008, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1008, 462),
(1009, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1009, 465),
(1010, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1010, 465),
(1011, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1011, 465),
(1012, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1012, 465),
(1013, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1013, 465),
(1014, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1014, 465),
(1015, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1015, 466),
(1016, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1016, 466),
(1017, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1017, 466),
(1018, '2024-06-08 15:57:52', '2024-06-08 15:57:52', 1018, 466),
(1019, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1019, 466),
(1020, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1020, 466),
(1021, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1021, 469),
(1022, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1022, 469),
(1023, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1023, 469),
(1024, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1024, 469),
(1025, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1025, 469),
(1026, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1026, 469),
(1027, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1027, 470),
(1028, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1028, 470),
(1029, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1029, 470),
(1030, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1030, 470),
(1031, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1031, 470),
(1032, '2024-06-08 15:57:53', '2024-06-08 15:57:53', 1032, 470),
(1033, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1033, 473),
(1034, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1034, 473),
(1035, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1035, 473),
(1036, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1036, 473),
(1037, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1037, 473),
(1038, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1038, 473),
(1039, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1039, 474),
(1040, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1040, 474),
(1041, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1041, 474),
(1042, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1042, 474),
(1043, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1043, 474),
(1044, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1044, 474),
(1045, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1045, 477),
(1046, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1046, 477),
(1047, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1047, 477),
(1048, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1048, 477),
(1049, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1049, 477),
(1050, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1050, 477),
(1051, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1051, 478),
(1052, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1052, 478),
(1053, '2024-06-08 15:57:54', '2024-06-08 15:57:54', 1053, 478),
(1054, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1054, 478),
(1055, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1055, 478),
(1056, '2024-06-08 15:57:55', '2024-06-08 15:57:55', 1056, 478);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_has_categories`
--

CREATE TABLE `vendor_has_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `by` int(11) NOT NULL DEFAULT 1 COMMENT '1 - Owner, 0 - Client Himself',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_user_id_foreign` (`user_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_vendor_id_foreign` (`vendor_id`),
  ADD KEY `banners_page_id_foreign` (`page_id`);

--
-- Indexes for table `cart_storage`
--
ALTER TABLE `cart_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_storage_id_index` (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_restorant_id_foreign` (`company_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_alias_unique` (`alias`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restorants_name_unique` (`name`),
  ADD UNIQUE KEY `restorants_subdomain_unique` (`subdomain`),
  ADD KEY `restorants_user_id_foreign` (`user_id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_restaurant_id_foreign` (`company_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `expenses_expenses_category_id_foreign` (`expenses_category_id`),
  ADD KEY `expenses_expenses_vendor_id_foreign` (`expenses_vendor_id`);

--
-- Indexes for table `expenses_category`
--
ALTER TABLE `expenses_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `expenses_vendor`
--
ALTER TABLE `expenses_vendor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_vendor_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_item_id_foreign` (`item_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hours_restorant_id_foreign` (`restorant_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `item_has_allergens`
--
ALTER TABLE `item_has_allergens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `localmenus`
--
ALTER TABLE `localmenus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localmenus_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_item_id_foreign` (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_client_id_foreign` (`client_id`),
  ADD KEY `orders_restorant_id_foreign` (`restorant_id`),
  ADD KEY `orders_driver_id_foreign` (`driver_id`),
  ADD KEY `orders_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `order_has_items`
--
ALTER TABLE `order_has_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_has_items_order_id_foreign` (`order_id`),
  ADD KEY `order_has_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `order_has_status`
--
ALTER TABLE `order_has_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_has_status_order_id_foreign` (`order_id`),
  ADD KEY `order_has_status_status_id_foreign` (`status_id`),
  ADD KEY `order_has_status_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paths`
--
ALTER TABLE `paths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `pdfs`
--
ALTER TABLE `pdfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_rateable_type_rateable_id_index` (`rateable_type`,`rateable_id`),
  ADD KEY `ratings_rateable_id_index` (`rateable_id`),
  ADD KEY `ratings_rateable_type_index` (`rateable_type`),
  ADD KEY `ratings_user_id_foreign` (`user_id`),
  ADD KEY `ratings_order_id_foreign` (`order_id`);

--
-- Indexes for table `restoareas`
--
ALTER TABLE `restoareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restoareas_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simple_delivery_areas`
--
ALTER TABLE `simple_delivery_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simple_delivery_areas_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_verifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_name_unique` (`name`),
  ADD UNIQUE KEY `status_alias_unique` (`alias`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables_restoarea_id_foreign` (`restoarea_id`),
  ADD KEY `tables_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_items_order_item_id_foreign` (`order_item_id`),
  ADD KEY `transaction_items_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`),
  ADD UNIQUE KEY `users_verification_code_unique` (`verification_code`),
  ADD KEY `users_stripe_id_index` (`stripe_id`),
  ADD KEY `users_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `user_has_categories`
--
ALTER TABLE `user_has_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_item_id_foreign` (`item_id`);

--
-- Indexes for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_has_extras_variant_id_foreign` (`variant_id`),
  ADD KEY `variants_has_extras_extra_id_foreign` (`extra_id`);

--
-- Indexes for table `vendor_has_categories`
--
ALTER TABLE `vendor_has_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_restaurant_id_foreign` (`restaurant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `expenses_category`
--
ALTER TABLE `expenses_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses_vendor`
--
ALTER TABLE `expenses_vendor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `item_has_allergens`
--
ALTER TABLE `item_has_allergens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localmenus`
--
ALTER TABLE `localmenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=669;

--
-- AUTO_INCREMENT for table `order_has_items`
--
ALTER TABLE `order_has_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `order_has_status`
--
ALTER TABLE `order_has_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paths`
--
ALTER TABLE `paths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pdfs`
--
ALTER TABLE `pdfs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restoareas`
--
ALTER TABLE `restoareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `simple_delivery_areas`
--
ALTER TABLE `simple_delivery_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `user_has_categories`
--
ALTER TABLE `user_has_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1066;

--
-- AUTO_INCREMENT for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1057;

--
-- AUTO_INCREMENT for table `vendor_has_categories`
--
ALTER TABLE `vendor_has_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`),
  ADD CONSTRAINT `banners_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_restorant_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `restorants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_restaurant_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_expenses_category_id_foreign` FOREIGN KEY (`expenses_category_id`) REFERENCES `expenses_category` (`id`),
  ADD CONSTRAINT `expenses_expenses_vendor_id_foreign` FOREIGN KEY (`expenses_vendor_id`) REFERENCES `expenses_vendor` (`id`),
  ADD CONSTRAINT `expenses_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `expenses_category`
--
ALTER TABLE `expenses_category`
  ADD CONSTRAINT `expenses_category_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `expenses_vendor`
--
ALTER TABLE `expenses_vendor`
  ADD CONSTRAINT `expenses_vendor_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `extras`
--
ALTER TABLE `extras`
  ADD CONSTRAINT `extras_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `hours`
--
ALTER TABLE `hours`
  ADD CONSTRAINT `hours_restorant_id_foreign` FOREIGN KEY (`restorant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `localmenus`
--
ALTER TABLE `localmenus`
  ADD CONSTRAINT `localmenus_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_restorant_id_foreign` FOREIGN KEY (`restorant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `order_has_items`
--
ALTER TABLE `order_has_items`
  ADD CONSTRAINT `order_has_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_has_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_has_status`
--
ALTER TABLE `order_has_status`
  ADD CONSTRAINT `order_has_status_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_has_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `order_has_status_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `restoareas`
--
ALTER TABLE `restoareas`
  ADD CONSTRAINT `restoareas_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `simple_delivery_areas`
--
ALTER TABLE `simple_delivery_areas`
  ADD CONSTRAINT `simple_delivery_areas_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  ADD CONSTRAINT `sms_verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `tables_restoarea_id_foreign` FOREIGN KEY (`restoarea_id`) REFERENCES `restoareas` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_has_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_items_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  ADD CONSTRAINT `variants_has_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`),
  ADD CONSTRAINT `variants_has_extras_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
