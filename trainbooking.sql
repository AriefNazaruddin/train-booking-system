-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2024 at 03:23 PM
-- Server version: 10.5.26-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trainbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add coach', 7, 'add_coach'),
(26, 'Can change coach', 7, 'change_coach'),
(27, 'Can delete coach', 7, 'delete_coach'),
(28, 'Can view coach', 7, 'view_coach'),
(29, 'Can add booking', 8, 'add_booking'),
(30, 'Can change booking', 8, 'change_booking'),
(31, 'Can delete booking', 8, 'delete_booking'),
(32, 'Can view booking', 8, 'view_booking'),
(33, 'Can add train', 9, 'add_train'),
(34, 'Can change train', 9, 'change_train'),
(35, 'Can delete train', 9, 'delete_train'),
(36, 'Can view train', 9, 'view_train'),
(37, 'Can add seat', 10, 'add_seat'),
(38, 'Can change seat', 10, 'change_seat'),
(39, 'Can delete seat', 10, 'delete_seat'),
(40, 'Can view seat', 10, 'view_seat'),
(41, 'Can add booking seat', 11, 'add_bookingseat'),
(42, 'Can change booking seat', 11, 'change_bookingseat'),
(43, 'Can delete booking seat', 11, 'delete_bookingseat'),
(44, 'Can view booking seat', 11, 'view_bookingseat');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$N5v6P44B5nLgeTiYEhLoBD$e2aauPHvlA6uAsxQkYnmpIsg7O4qBhWWp3cHM3+yXg8=', NULL, 0, 'testuser2', '', '', 'test@test.com', 0, 1, '2024-11-08 03:02:07.036892'),
(2, 'pbkdf2_sha256$870000$rGvj4y16mCBweAQ6T8Yix1$S5VYsiyruQ9Nnx+B19lzwTcV6cmLJTQvYxzpVeqJJu4=', NULL, 0, 'testuser1', '', '', 'testuser1@testmail.com', 0, 1, '2024-11-10 11:37:30.287085');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_booking`
--

CREATE TABLE `booking_booking` (
  `id` bigint(20) NOT NULL,
  `booking_date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `train_id` bigint(20) NOT NULL,
  `total_amount` decimal(5,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_booking`
--

INSERT INTO `booking_booking` (`id`, `booking_date`, `user_id`, `train_id`, `total_amount`, `status`) VALUES
(22, '2024-11-10 13:33:16.841100', 1, 1, 30.00, 'paid'),
(23, '2024-11-10 13:40:03.827080', 2, 1, 60.00, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `booking_bookingseat`
--

CREATE TABLE `booking_bookingseat` (
  `id` bigint(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `booking_id` bigint(20) NOT NULL,
  `seat_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_bookingseat`
--

INSERT INTO `booking_bookingseat` (`id`, `status`, `booking_id`, `seat_id`) VALUES
(20, 'booked', 22, 42),
(21, 'booked', 23, 48),
(22, 'booked', 23, 52);

-- --------------------------------------------------------

--
-- Table structure for table `booking_coach`
--

CREATE TABLE `booking_coach` (
  `id` bigint(20) NOT NULL,
  `coach_number` varchar(5) NOT NULL,
  `train_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_coach`
--

INSERT INTO `booking_coach` (`id`, `coach_number`, `train_id`) VALUES
(1, 'C1', 1),
(2, 'C2', 1),
(3, 'C3', 1),
(4, 'C4', 1),
(5, 'C5', 1),
(6, 'C6', 1),
(7, 'C1', 2),
(8, 'C2', 2),
(9, 'C3', 2),
(10, 'C4', 2),
(11, 'C5', 2),
(12, 'C6', 2);

-- --------------------------------------------------------

--
-- Table structure for table `booking_seat`
--

CREATE TABLE `booking_seat` (
  `id` bigint(20) NOT NULL,
  `seat_number` varchar(5) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `coach_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_seat`
--

INSERT INTO `booking_seat` (`id`, `seat_number`, `is_available`, `coach_id`) VALUES
(41, '1A', 1, 1),
(42, '2A', 0, 1),
(43, '3A', 1, 1),
(44, '4A', 1, 1),
(45, '5A', 1, 1),
(46, '6A', 1, 1),
(47, '7A', 1, 1),
(48, '8A', 0, 1),
(49, '9A', 1, 1),
(50, '10A', 1, 1),
(51, '11A', 1, 1),
(52, '12A', 0, 1),
(53, '13A', 1, 1),
(54, '14A', 1, 1),
(55, '15A', 1, 1),
(56, '16A', 1, 1),
(57, '17A', 1, 1),
(58, '18A', 1, 1),
(59, '19A', 1, 1),
(60, '20A', 1, 1),
(61, '1B', 1, 2),
(62, '2B', 1, 2),
(63, '3B', 1, 2),
(64, '4B', 1, 2),
(65, '5B', 1, 2),
(66, '6B', 1, 2),
(67, '7B', 1, 2),
(68, '8B', 1, 2),
(69, '9B', 1, 2),
(70, '10B', 1, 2),
(71, '11B', 1, 2),
(72, '12B', 1, 2),
(73, '13B', 1, 2),
(74, '14B', 1, 2),
(75, '15B', 1, 2),
(76, '16B', 1, 2),
(77, '17B', 1, 2),
(78, '18B', 1, 2),
(79, '19B', 1, 2),
(80, '20B', 1, 2),
(81, '1C', 1, 3),
(82, '2C', 1, 3),
(83, '3C', 1, 3),
(84, '4C', 1, 3),
(85, '5C', 1, 3),
(86, '6C', 1, 3),
(87, '7C', 1, 3),
(88, '8C', 1, 3),
(89, '9C', 1, 3),
(90, '10C', 1, 3),
(91, '11C', 1, 3),
(92, '12C', 1, 3),
(93, '13C', 1, 3),
(94, '14C', 1, 3),
(95, '15C', 1, 3),
(96, '16C', 1, 3),
(97, '17C', 1, 3),
(98, '18C', 1, 3),
(99, '19C', 1, 3),
(100, '20C', 1, 3),
(101, '1D', 1, 4),
(102, '2D', 1, 4),
(103, '3D', 1, 4),
(104, '4D', 1, 4),
(105, '5D', 1, 4),
(106, '6D', 1, 4),
(107, '7D', 1, 4),
(108, '8D', 1, 4),
(109, '9D', 1, 4),
(110, '10D', 1, 4),
(111, '11D', 1, 4),
(112, '12D', 1, 4),
(113, '13D', 1, 4),
(114, '14D', 1, 4),
(115, '15D', 1, 4),
(116, '16D', 1, 4),
(117, '17D', 1, 4),
(118, '18D', 1, 4),
(119, '19D', 1, 4),
(120, '20D', 1, 4),
(121, '1E', 1, 5),
(122, '2E', 1, 5),
(123, '3E', 1, 5),
(124, '4E', 1, 5),
(125, '5E', 1, 5),
(126, '6E', 1, 5),
(127, '7E', 1, 5),
(128, '8E', 1, 5),
(129, '9E', 1, 5),
(130, '10E', 1, 5),
(131, '11E', 1, 5),
(132, '12E', 1, 5),
(133, '13E', 1, 5),
(134, '14E', 1, 5),
(135, '15E', 1, 5),
(136, '16E', 1, 5),
(137, '17E', 1, 5),
(138, '18E', 1, 5),
(139, '19E', 1, 5),
(140, '20E', 1, 5),
(141, '1F', 1, 6),
(142, '2F', 1, 6),
(143, '3F', 1, 6),
(144, '4F', 1, 6),
(145, '5F', 1, 6),
(146, '6F', 1, 6),
(147, '7F', 1, 6),
(148, '8F', 1, 6),
(149, '9F', 1, 6),
(150, '10F', 1, 6),
(151, '11F', 1, 6),
(152, '12F', 1, 6),
(153, '13F', 1, 6),
(154, '14F', 1, 6),
(155, '15F', 1, 6),
(156, '16F', 1, 6),
(157, '17F', 1, 6),
(158, '18F', 1, 6),
(159, '19F', 1, 6),
(160, '20F', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `booking_train`
--

CREATE TABLE `booking_train` (
  `id` bigint(20) NOT NULL,
  `train_number` varchar(10) NOT NULL,
  `departure_time` datetime(6) NOT NULL,
  `return_time` datetime(6) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `amount` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_train`
--

INSERT INTO `booking_train` (`id`, `train_number`, `departure_time`, `return_time`, `destination`, `amount`) VALUES
(1, 'MY1001', '2024-12-15 09:00:00.000000', '2024-12-22 15:00:00.000000', 'Kuala Lumpur', 30.00),
(2, 'MY1002', '2024-12-15 14:00:00.000000', '2024-12-22 20:00:00.000000', 'Penang', 30.00);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'booking', 'booking'),
(11, 'booking', 'bookingseat'),
(7, 'booking', 'coach'),
(10, 'booking', 'seat'),
(9, 'booking', 'train'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-08 02:55:39.779959'),
(2, 'auth', '0001_initial', '2024-11-08 02:55:39.923522'),
(3, 'admin', '0001_initial', '2024-11-08 02:55:39.957951'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-08 02:55:39.965473'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-08 02:55:39.971991'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-08 02:55:39.994781'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-08 02:55:40.017897'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-08 02:55:40.026413'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-08 02:55:40.031925'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-08 02:55:40.054445'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-08 02:55:40.055444'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-08 02:55:40.059957'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-08 02:55:40.071162'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-08 02:55:40.078223'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-08 02:55:40.085810'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-08 02:55:40.091907'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-08 02:55:40.097934'),
(18, 'sessions', '0001_initial', '2024-11-08 02:55:40.106459'),
(19, 'booking', '0001_initial', '2024-11-08 04:24:36.812046'),
(20, 'booking', '0002_rename_seat_id_booking_seat_and_more', '2024-11-08 06:42:43.711563'),
(21, 'booking', '0003_remove_train_total_amount_booking_total_amount', '2024-11-08 07:35:31.460321'),
(22, 'booking', '0004_train_destination', '2024-11-08 08:41:30.142105'),
(23, 'booking', '0005_rename_arrival_time_train_return_time', '2024-11-08 17:17:08.887104'),
(24, 'booking', '0006_train_amount_alter_booking_total_amount', '2024-11-09 15:57:44.114986'),
(25, 'booking', '0007_remove_booking_seat', '2024-11-10 06:49:27.088187'),
(26, 'booking', '0008_booking_status', '2024-11-10 06:57:21.325899'),
(27, 'booking', '0009_alter_booking_train_alter_booking_user_and_more', '2024-11-10 08:49:54.916616');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `booking_booking`
--
ALTER TABLE `booking_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_booking_train_id_80a98b87_fk_booking_train_id` (`train_id`),
  ADD KEY `booking_booking_user_id_e1eb6912_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `booking_bookingseat`
--
ALTER TABLE `booking_bookingseat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_bookingseat_booking_id_7842d588_fk_booking_booking_id` (`booking_id`),
  ADD KEY `booking_bookingseat_seat_id_fa6a74b9_fk_booking_seat_id` (`seat_id`);

--
-- Indexes for table `booking_coach`
--
ALTER TABLE `booking_coach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_coach_train_id_7bd7a24e_fk_booking_train_id` (`train_id`);

--
-- Indexes for table `booking_seat`
--
ALTER TABLE `booking_seat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_seat_coach_id_803955af_fk_booking_coach_id` (`coach_id`);

--
-- Indexes for table `booking_train`
--
ALTER TABLE `booking_train`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `train_number` (`train_number`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_booking`
--
ALTER TABLE `booking_booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `booking_bookingseat`
--
ALTER TABLE `booking_bookingseat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `booking_coach`
--
ALTER TABLE `booking_coach`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `booking_seat`
--
ALTER TABLE `booking_seat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `booking_train`
--
ALTER TABLE `booking_train`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `booking_booking`
--
ALTER TABLE `booking_booking`
  ADD CONSTRAINT `booking_booking_train_id_80a98b87_fk_booking_train_id` FOREIGN KEY (`train_id`) REFERENCES `booking_train` (`id`),
  ADD CONSTRAINT `booking_booking_user_id_e1eb6912_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `booking_bookingseat`
--
ALTER TABLE `booking_bookingseat`
  ADD CONSTRAINT `booking_bookingseat_booking_id_7842d588_fk_booking_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking_booking` (`id`),
  ADD CONSTRAINT `booking_bookingseat_seat_id_fa6a74b9_fk_booking_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `booking_seat` (`id`);

--
-- Constraints for table `booking_coach`
--
ALTER TABLE `booking_coach`
  ADD CONSTRAINT `booking_coach_train_id_7bd7a24e_fk_booking_train_id` FOREIGN KEY (`train_id`) REFERENCES `booking_train` (`id`);

--
-- Constraints for table `booking_seat`
--
ALTER TABLE `booking_seat`
  ADD CONSTRAINT `booking_seat_coach_id_803955af_fk_booking_coach_id` FOREIGN KEY (`coach_id`) REFERENCES `booking_coach` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
