-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 09:57 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceadvlara`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Phone Starp', 'lorem-ipsum-is', '/storage/photos/1/Banner/Banner.png', '<h2><font color=\"#636363\"><b>Promo Harga Spesial dengan Diskon 10%</b></font></h2>', 'active', '2020-08-14 01:47:38', '2025-06-24 02:07:11'),
(2, 'Bracelet Beads', 'lorem-ipsum', '/storage/photos/1/Banner/copy-IMG-20240215-WA0043.jpg', '<p>Get Up to 35% OFF</p>', 'active', '2020-08-14 01:50:23', '2025-06-24 02:07:48'),
(4, 'Necklace Beads', 'banner', '/storage/photos/1/Banner/copy-WhatsApp Image 2025-06-24 at 15.09.21 (1).jpeg', '<span style=\"color: rgb(15, 15, 15); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve;\">Online Offers: Yours to Discover!</span><br>', 'active', '2020-08-17 20:46:59', '2025-06-24 02:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(8, 'One Shine Beads', 'one-shine-beads', 'active', '2025-06-22 10:26:05', '2025-06-22 10:26:05');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(14, 25, NULL, 42, 9000.00, 'new', 1, 9000.00, '2025-06-23 22:10:35', '2025-06-23 22:10:35'),
(15, 25, NULL, 1, 9000.00, 'new', 1, 10000.00, '2025-06-24 01:43:15', '2025-06-24 01:43:15'),
(16, 26, 14, 2, 10000.00, 'new', 1, 10000.00, '2025-07-01 01:47:50', '2025-07-01 01:48:42'),
(17, 26, NULL, 2, 10000.00, 'new', 1, 10000.00, '2025-07-01 04:58:20', '2025-07-01 04:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Phone Starp', 'phone-strap', NULL, '/storage/photos/1/img/Banner.png', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2025-06-24 01:56:12'),
(2, 'Ring Beads', 'ring-beads', NULL, '/storage/photos/1/Untitled.png', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2025-06-24 13:03:22'),
(3, 'Necklace Beads', 'necklace-beads', NULL, '/storage/photos/1/Neck.png', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2025-06-24 13:08:12'),
(14, 'Bracelet Beads', 'bracelet-beads', NULL, '/storage/photos/1/img/Logo Asli.png', 1, NULL, NULL, 'active', '2025-06-22 04:36:19', '2025-07-30 23:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LKPL690', 'fixed', '30.00', 'inactive', NULL, '2023-11-27 18:40:23'),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL),
(6, 'OSB10', 'percent', '10.00', 'active', '2023-11-27 18:39:49', '2025-06-10 03:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(4, 'com', 'gelang', 'customer@mail.com', NULL, '01387956185', 'pengen pesen gelangnya', '2025-07-30 23:50:01', '2025-06-22 08:13:54', '2025-07-30 23:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('04a9b33a-7b70-42ae-9ea7-45918ed200c3', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 12:58:24', '2023-11-27 12:58:24'),
('18365bcb-3478-43f4-8f86-d3b84bf06557', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-26 16:48:51', '2023-11-26 16:48:51'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('2689e352-a41a-4d13-989c-0e48aa2cf15c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-relaxed-fit\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:37:49', '2023-11-27 13:37:49'),
('32eafa9c-f8e7-4228-b59a-edb6da181c93', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-casual-pants-high-waist-business-casual-ankle-pants\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:31:22', '2023-11-27 13:31:22'),
('343a65d3-a824-4580-b29f-710d3897a2d0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}', '2025-07-01 01:51:10', '2025-07-01 01:48:42', '2025-07-01 01:51:10'),
('3a65729c-5dce-422c-82bb-67fe66b553b4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 15:20:07', '2023-11-27 15:20:07'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('3e4d63ef-ddb5-47b3-99b1-bbb711df8174', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/kittenn\",\"fas\":\"fa-star\"}', NULL, '2025-06-22 04:01:09', '2025-06-22 04:01:09'),
('3ef12213-1e36-42be-935d-19ce6505dade', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-29 15:19:31', '2023-11-29 15:19:31'),
('40bff82e-3992-4cc5-8662-0eb3d88a814c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-22 16:57:58', '2023-11-22 16:57:58'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('4e3cf8f7-bb81-4d22-98b2-70ef6aeafb2d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 16:54:13', '2023-11-27 16:54:13'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('572a5a95-970f-4a70-9ae1-ee3b77875b9b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-iconic-trench-coat\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 21:54:20', '2023-11-28 21:54:20'),
('57ce035a-35fe-4d76-a320-5f5e6a54ce1e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-28 22:28:29', '2023-11-28 22:28:29'),
('5a395f39-3458-4f28-9d4e-a9cfd65a3d4a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/kittenn\",\"fas\":\"fa-star\"}', NULL, '2025-06-15 10:14:56', '2025-06-15 10:14:56'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('67574a9e-d626-42d6-8f05-ebbf214bef20', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-v-neck-floral-summer-tops\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:25:44', '2023-11-27 13:25:44'),
('67fe672c-7384-4ded-b609-d2261671f7ec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-classic-zip-front-polar-fleece-jacket\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:17:47', '2023-11-27 13:17:47'),
('6cec98cf-bf3e-4e7b-b9a1-0ff9ce8f0a5e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-28 15:01:35', '2023-11-28 15:01:35'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('8a76c3b0-1f7d-4767-97f7-0da561f0948d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-carnaby-evo-tri1-sma-trainers\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 21:50:28', '2023-11-28 21:50:28'),
('9b1ab868-89d3-4a72-8b9b-5667c4b3fc71', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-retro-slim-fit-straight-jean\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 14:50:44', '2023-11-28 14:50:44'),
('9f7dd99f-85f0-4525-91f2-9c30a6f3db7f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-28 22:04:35', '2023-11-28 22:04:35'),
('a28df48a-1719-4a95-8062-4f52199637d9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/gelang\",\"fas\":\"fa-star\"}', NULL, '2025-07-01 04:05:57', '2025-07-01 04:05:57'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('ac00a3f2-683b-455a-965f-80774e4f6367', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-casual-pants-high-waist-business-casual-ankle-pants\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:19:45', '2023-11-27 13:19:45'),
('b08b5a74-76b9-4ed2-a753-c41472ef004b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 17:55:16', '2023-11-27 17:55:16'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('ba9ac0a5-a8c3-4fb3-92bc-08d0fafbff6a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2023-11-27 16:48:05', '2023-11-27 16:48:05'),
('bab62443-188c-4d8c-92f0-a7b7eb0a0d57', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', '2025-06-10 10:48:16', '2025-06-10 10:46:25', '2025-06-10 10:48:16'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('d5563456-50ce-4793-807b-ad521a004a83', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}', NULL, '2025-06-15 10:14:10', '2025-06-15 10:14:10'),
('d8e1f84b-a9f2-4c12-bfde-156c4045003c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-iconic-trench-coat\",\"fas\":\"fa-star\"}', NULL, '2023-11-28 21:49:05', '2023-11-28 21:49:05'),
('dfefca63-1751-47f0-88d7-72e25c9404d0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-v-neck-floral-summer-tops\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:32:59', '2023-11-27 13:32:59'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e16827cb-89d7-473b-86d2-119070479970', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-classic-zip-front-polar-fleece-jacket\",\"fas\":\"fa-star\"}', NULL, '2023-11-26 16:39:34', '2023-11-26 16:39:34'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('e5faa63a-6cd0-4d4c-8ce3-4fa26b44d1de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-v-neck-floral-summer-tops\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:22:49', '2023-11-27 13:22:49'),
('e9f89140-4ad2-4fbb-a8b6-2a7285609671', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-relaxed-fit\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 12:55:31', '2023-11-27 12:55:31'),
('f90ca287-1221-417f-9210-249f3e70533a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-iconic-trench-coat\",\"fas\":\"fa-star\"}', NULL, '2023-11-29 15:20:32', '2023-11-29 15:20:32'),
('ffd9fb5c-c436-4ac0-96ce-35e8f3e51877', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-casual-pants-high-waist-business-casual-ankle-pants\",\"fas\":\"fa-star\"}', NULL, '2023-11-27 13:28:06', '2023-11-27 13:28:06'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal','cardpay') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(14, 'ORD-YBBZDBUGQB', 2, 10000.00, 1, NULL, 30000.00, 1, 'cardpay', 'paid', 'delivered', 'Yoga', 'Subhi Salam', 'yoga@gmail.com', '01387956185', 'ID', '40614', 'Bandung', 'Cibiru', '2025-07-01 01:48:40', '2025-07-01 01:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Gelang', 'gelang', '<p>Gelang manik-manik&nbsp;</p>', '<p>Gelang dari One Shine Beads hadir dengan desain modern dan ringan, cocok untuk melengkapi gaya kasual maupun formal.</p>', '<p>Gelang handmade One Shine Beads dibuat dengan bahan berkualitas tinggi dan desain elegan, cocok untuk melengkapi penampilan sehari-hari maupun acara spesial.</p>', '/storage/photos/1/blog/4356e5a361b2d2b6de1da55306bea926.jpg', 'Enjoy', 6, NULL, 1, 'active', '2025-06-24 12:45:41', '2025-06-24 12:45:41');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(6, 'Gelang', 'gelang', 'active', '2025-06-24 01:48:51', '2025-06-24 01:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, NULL, NULL, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, 2, NULL, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, NULL, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, NULL, NULL, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, 2, NULL, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, 2, NULL, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(25, 'Gelang', 'gelang', '<p><span style=\"color: rgb(17, 17, 17); font-family: Roboto, sans-serif; font-size: 20px;\">Gelang manik-manik adalah&nbsp;</span><span style=\"font-weight: 700; background-color: rgba(16, 110, 190, 0.18); color: rgb(17, 17, 17); font-family: Roboto, sans-serif; font-size: 20px;\">jenis gelang yang terbuat dari tali atau kawat yang dijalin dengan manik-manik berbagai ukuran</span><span style=\"color: rgb(17, 17, 17); font-family: Roboto, sans-serif; font-size: 20px;\">. Manik-manik yang dipakai bisa berasal dari berbagai bahan, antara lain bahan sintetis, batu alam, kaca, logam, hingga kayu. Gelang manik-manik banyak dijual di toko aksesori.</span></p>', '<p><span style=\"color: rgb(17, 17, 17); font-family: Roboto, sans-serif; font-size: 20px;\">Gelang manik-manik adalah&nbsp;</span><span style=\"font-weight: 700; background-color: rgba(16, 110, 190, 0.18); color: rgb(17, 17, 17); font-family: Roboto, sans-serif; font-size: 20px;\">jenis gelang yang terbuat dari tali atau kawat yang dijalin dengan manik-manik berbagai ukuran</span><span style=\"color: rgb(17, 17, 17); font-family: Roboto, sans-serif; font-size: 20px;\">. Manik-manik yang dipakai bisa berasal dari berbagai bahan, antara lain bahan sintetis, batu alam, kaca, logam, hingga kayu. Gelang manik-manik banyak dijual di toko aksesori.</span></p>', '/storage/photos/1/Produk/91007ad27a763b9dc271cd93160300e1.jpg', 10, 'S,M,L,XL,2XL', 'new', 'active', 10000.00, 10.00, 1, 14, NULL, 8, '2025-06-23 22:10:06', '2025-06-23 22:10:06'),
(26, 'Gelang Elizabeth', 'gelang-elizabeth', '<p>Gelang elizabeth X</p>', '<p>sfgusalgfusgfaku</p><p>Size :</p><p>Small : 5-7 cm</p><p>Medium : 7-10 cm</p><p>Large :10-13 cm</p><p>Extra Large : 15-18 cm</p><p>Double Extra Large : 18-25cm</p>', '/storage/photos/1/Produk/IMG-20231220-WA0085.jpg', 8, 'S,M,L,XL,2XL', 'new', 'active', 10000.00, 0.00, 1, 14, NULL, 8, '2025-06-24 01:41:06', '2025-07-01 01:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(23, 2, 25, 5, 'Good', 'active', '2025-07-01 04:05:57', '2025-07-01 04:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'One Shine Beads adalah usaha yang bergerak di bidang pembuatan dan penjualan aksesoris berbahan dasar manik-manik (beads) secara handmade. Produk yang dihasilkan meliputi gelang, kalung, cincin, dan anting dengan desain yang unik dan personal. One Shine Beads mengedepankan kualitas, estetika, serta layanan kustomisasi sesuai permintaan pelanggan.', 'Temukan koleksi aksesoris handmade yang dirancang dengan penuh cinta dan detail di One Shine Beads. Kami menghadirkan berbagai pilihan gelang, kalung, cincin, dan anting dari manik-manik berkualitas tinggi yang siap mempercantik hari-harimu. Tampil lebih bersinar dengan One Shine Beads — karena setiap wanita pantas mendapatkan sentuhan keindahan yang istimewa.', '/storage/photos/1/img/Logo.png', '/storage/photos/1/img/Logo Asli.png', 'Jl. Beringin Raya No.55, RT.005/RW.020, wetanan, Kec. Rancaekek, Kabupaten Bandung, Jawa Barat 40394', '+62 895-1245-8177', 'oneshinebeads@gmail.com', NULL, '2025-06-22 02:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'JNE', '20000.00', 'active', '2020-08-14 04:22:17', '2025-06-24 01:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'OSB', 'admin@mail.com', NULL, '$2y$10$pt21N8BKujudW0SbuyKEPOrNaOi5PEuZFtJN/vfaYxS0geYzdQwYq', '/storage/photos/1/admin-icn.png', 'admin', NULL, NULL, 'active', 'Z5yXwy4Y7PvazlxbnL8SB9u0nrmNklJCwkAwdvTXJhNgjAXr7NQsfV7lhCtt', NULL, '2025-06-14 06:43:09'),
(2, 'CUZ CUZ', 'customer@mail.com', NULL, '$2y$10$EgmE.h4YYI70N4zGtNt4gOe7leIu5SfGgoQlkDpHUIHRttxbuCQ8u', NULL, 'user', NULL, NULL, 'active', NULL, NULL, '2025-06-22 09:11:51'),
(42, 'Agus', 'agus65@mail.com', NULL, '$2y$10$gxJE1YbDn0ZXhUWlN1sB7OHAfLO2Q5YGFGn8V1QHjn8lAIWqGKaZ.', NULL, 'user', NULL, NULL, 'active', NULL, '2025-06-23 21:54:42', '2025-06-23 21:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
