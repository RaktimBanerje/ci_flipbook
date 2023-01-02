-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2023 at 11:49 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flipbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_activity_log`
--

CREATE TABLE `ci_activity_log` (
  `id` int(11) NOT NULL,
  `activity_id` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_activity_log`
--

INSERT INTO `ci_activity_log` (`id`, `activity_id`, `user_id`, `admin_id`, `created_at`) VALUES
(9, 2, 0, 31, '2021-09-24 22:40:46'),
(10, 9, 0, 31, '2021-09-25 01:29:27'),
(11, 5, 0, 31, '2021-09-25 03:06:28'),
(12, 7, 0, 33, '2021-10-23 06:46:00'),
(13, 7, 0, 33, '2021-10-23 06:47:36'),
(14, 7, 0, 33, '2021-10-23 07:04:35'),
(15, 7, 0, 33, '2021-10-23 07:15:07'),
(16, 7, 0, 33, '2021-10-25 10:34:39'),
(17, 9, 0, 31, '2021-11-16 05:08:27'),
(18, 7, 0, 31, '2022-03-16 09:31:55'),
(19, 7, 0, 31, '2022-12-09 09:00:51'),
(20, 7, 0, 31, '2022-12-13 23:09:56'),
(21, 7, 0, 31, '2022-12-15 20:17:45'),
(22, 7, 0, 31, '2022-12-15 20:18:32'),
(23, 7, 0, 31, '2022-12-15 20:20:55'),
(24, 7, 0, 31, '2022-12-15 20:21:45'),
(25, 7, 0, 31, '2022-12-26 07:55:49'),
(26, 7, 0, 31, '2022-12-26 07:58:08'),
(27, 7, 0, 31, '2022-12-26 08:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `ci_activity_status`
--

CREATE TABLE `ci_activity_status` (
  `id` int(11) NOT NULL,
  `description` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_activity_status`
--

INSERT INTO `ci_activity_status` (`id`, `description`) VALUES
(1, 'User Created'),
(2, 'User Edited'),
(3, 'User Deleted'),
(4, 'Admin Created'),
(5, 'Admin Edited'),
(6, 'Admin Deleted'),
(7, 'Flipbook Created'),
(8, 'Flipbook Edited'),
(9, 'Flipbook Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `ci_admin`
--

CREATE TABLE `ci_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_role_id` int(11) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `image` varchar(300) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_verify` tinyint(4) NOT NULL DEFAULT 1,
  `is_admin` tinyint(4) NOT NULL DEFAULT 1,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_supper` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(255) NOT NULL,
  `password_reset_code` varchar(255) NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_admin`
--

INSERT INTO `ci_admin` (`admin_id`, `admin_role_id`, `username`, `firstname`, `lastname`, `email`, `mobile_no`, `image`, `password`, `last_login`, `is_verify`, `is_admin`, `is_active`, `is_supper`, `token`, `password_reset_code`, `last_ip`, `created_at`, `updated_at`) VALUES
(25, 2, 'admin', 'Admin', 'User', 'admin@gmail.com', '544354353', '', '$2y$10$Jr4I/o.COvNPso/QHGGmnOAD7ekO3UgKfs/W.t9IPbqKPK/ofJsWW', '2021-09-16 06:01:58', 1, 1, 1, 0, '', '', '', '2021-09-19 00:00:00', '2021-09-19 00:00:00'),
(31, 1, 'superadmin', 'Super', 'Admin', 'superadmin@gmail.com', '123456', '', '$2y$10$Jr4I/o.COvNPso/QHGGmnOAD7ekO3UgKfs/W.t9IPbqKPK/ofJsWW', '0000-00-00 00:00:00', 1, 1, 1, 1, '', '', '', '2021-09-16 06:01:58', '2021-09-16 06:01:58'),
(32, 5, 'rahulkmr538', 'Rahul Shakya', '', 'rahulkmr538@gmail.com', '', '', '$2y$10$Ui6xGp3nOSnQJoteLYaJ5ulUxIRGhORw1qwe4yURgmsOik0QTA9F6', '0000-00-00 00:00:00', 1, 1, 1, 0, '43fa7f58b7eac7ac872209342e62e8f1', '', '', '2021-10-23 06:10:03', '2021-10-23 06:10:03'),
(33, 5, 'mail.rahulshakya', 'Rahul Shakya', '', 'mail.rahulshakya@gmail.com', '9792477961', '', '$2y$10$FAji/piUQZ0rvpevwQzpRubS2zVT3G9Sk/6QGliakpouuvSSKAWYm', '0000-00-00 00:00:00', 1, 1, 1, 0, '9b698eb3105bd82528f23d0c92dedfc0', '', '', '2021-10-23 06:10:16', '2021-10-23 06:10:16'),
(34, 2, 'jkumar', 'Jay', 'Kay', 'jkumar@gmail.com', '', '', '$2y$10$Jr4I/o.COvNPso/QHGGmnOAD7ekO3UgKfs/W.t9IPbqKPK/ofJsWW', '0000-00-00 00:00:00', 0, 1, 1, 0, '7bcdf75ad237b8e02e301f4091fb6bc8', '', '', '2022-02-13 00:00:00', '2022-02-13 00:00:00'),
(35, 5, 'pratul.exeter', 'Pratul', '', 'pratul.exeter@gmail.com', '1234567890', '', '$2y$10$h3vFxt/.5Ah.6.x6IjQGz.5jiWrLYvfFX6PMtgXcPGcWiXXOPy1Za', '0000-00-00 00:00:00', 1, 1, 1, 0, '0e65972dce68dad4d52d063967f0a705', '', '', '2022-02-14 00:00:00', '2022-02-14 00:00:00'),
(36, 5, 'softjeetu', 'Jitendar', '', 'softjeetu@gmail.com', '99999999999', '', '$2y$10$0g94dmg7ZZ8S/63u13u3beXQ9/iYUosedjlzJDcwVlaLbaC.ei3mS', '0000-00-00 00:00:00', 1, 1, 1, 0, 'ef4e3b775c934dada217712d76f3d51f', '', '', '2022-03-15 00:00:00', '2022-03-15 00:00:00'),
(37, 5, 'raktimbanerjee9', 'Raktim Banerjee', '', 'raktimbanerjee9@gmail.com', '+919836739907', '', '$2y$10$tvTchTONDh6YAjErGYWsF.zPN04ZgUXft6OlkVyln1K8BzGXrrh9y', '0000-00-00 00:00:00', 1, 1, 1, 0, '8c6744c9d42ec2cb9e8885b54ff744d0', '', '', '2022-12-13 00:00:00', '2022-12-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ci_admin_roles`
--

CREATE TABLE `ci_admin_roles` (
  `admin_role_id` int(11) NOT NULL,
  `admin_role_title` varchar(30) CHARACTER SET utf8 NOT NULL,
  `admin_role_status` int(11) NOT NULL,
  `admin_role_created_by` int(1) NOT NULL,
  `admin_role_created_on` datetime NOT NULL,
  `admin_role_modified_by` int(11) NOT NULL,
  `admin_role_modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_admin_roles`
--

INSERT INTO `ci_admin_roles` (`admin_role_id`, `admin_role_title`, `admin_role_status`, `admin_role_created_by`, `admin_role_created_on`, `admin_role_modified_by`, `admin_role_modified_on`) VALUES
(1, 'Super Admin', 1, 0, '2021-09-16 06:01:58', 0, '2021-09-17 12:53:16'),
(2, 'Admin', 1, 0, '2021-09-16 06:01:58', 0, '2021-09-17 12:53:16'),
(3, 'Accountant', 1, 0, '2021-09-16 06:01:58', 0, '2021-09-17 12:53:16'),
(4, 'Operator', 1, 0, '2021-09-16 06:01:58', 0, '2021-09-17 12:53:16'),
(5, 'User', 1, 0, '2021-10-23 06:43:01', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ci_email_templates`
--

CREATE TABLE `ci_email_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `last_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_email_templates`
--

INSERT INTO `ci_email_templates` (`id`, `name`, `slug`, `subject`, `body`, `last_update`) VALUES
(1, 'Email Verification', 'email-verification', 'Activate Your Account', '<p></p>\n\n<p>Hi  <b>{FULLNAME}</b>,<br><br></p><p>Welcome to Flipbook!<br>Active your account with the link above and start your Career.</p><p>To verify your email, please click the link below:<br> {VERIFICATION_LINK}</p><p>\n\n</p><div><b>Regards,</b></div><div><b>Team</b></div>\n\n<p></p>', '2021-09-24 23:10:56'),
(2, 'Forget Password', 'forget-password', 'Recover your password', '<p>\n\n</p><p>Hi  <b>{FULLNAME}</b>,<br><br></p><p>Welcome to Flipbook!<br></p><p>We have received a request to reset your password. If you did not initiate this request, you can simply ignore this message and no action will be taken.</p><p><br>To reset your password, please click the link below:<br> {RESET_LINK}</p>\n\n<p></p>', '2021-09-24 23:11:04'),
(3, 'General Notification', '', 'Notifications', '<p>\n\nFlipbook\n\n</p>', '2022-03-15 01:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `ci_email_template_variables`
--

CREATE TABLE `ci_email_template_variables` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `variable_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_email_template_variables`
--

INSERT INTO `ci_email_template_variables` (`id`, `template_id`, `variable_name`) VALUES
(1, 1, '{FULLNAME}'),
(2, 1, '{VERIFICATION_LINK}'),
(3, 2, '{RESET_LINK}'),
(4, 2, '{FULLNAME}');

-- --------------------------------------------------------

--
-- Table structure for table `ci_general_settings`
--

CREATE TABLE `ci_general_settings` (
  `id` int(11) NOT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `application_name` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `default_language` int(11) NOT NULL,
  `copyright` tinytext DEFAULT NULL,
  `email_from` varchar(100) NOT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_port` int(11) DEFAULT NULL,
  `smtp_user` varchar(50) DEFAULT NULL,
  `smtp_pass` varchar(50) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `google_link` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `recaptcha_secret_key` varchar(255) DEFAULT NULL,
  `recaptcha_site_key` varchar(255) DEFAULT NULL,
  `recaptcha_lang` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_general_settings`
--

INSERT INTO `ci_general_settings` (`id`, `favicon`, `logo`, `application_name`, `timezone`, `currency`, `default_language`, `copyright`, `email_from`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `facebook_link`, `twitter_link`, `google_link`, `youtube_link`, `linkedin_link`, `instagram_link`, `recaptcha_secret_key`, `recaptcha_site_key`, `recaptcha_lang`, `created_date`, `updated_date`) VALUES
(1, 'assets/img/dc48701e5a6a300744b873b63f772101.png', 'assets/img/dc48701e5a6a300744b873b63f772101.png', 'Flipbook', 'America/Adak', 'USD', 2, 'Copyright © 2021 Flipbook All rights reserved.', 'admin@flippmypdf.ml', 'smtp.hostinger.com', 465, 'admin@flippmypdf.ml', 'Flip1234@', 'https://facebook.com', 'https://twitter.com', 'https://google.com', 'https://youtube.com', 'https://linkedin.com', 'https://instagram.com', '', '', 'en', '2022-03-16 00:00:00', '2022-03-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ci_language`
--

CREATE TABLE `ci_language` (
  `id` int(11) NOT NULL,
  `name` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(15) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_language`
--

INSERT INTO `ci_language` (`id`, `name`, `short_name`, `status`, `created_at`) VALUES
(2, 'English', 'en', 1, '2021-09-16 01:13:17'),
(3, 'French', 'fr', 1, '2021-09-16 01:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `ci_users`
--

CREATE TABLE `ci_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 1,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_verify` tinyint(4) NOT NULL DEFAULT 0,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(255) NOT NULL,
  `password_reset_code` varchar(255) NOT NULL,
  `last_ip` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_users`
--

INSERT INTO `ci_users` (`id`, `username`, `firstname`, `lastname`, `email`, `mobile_no`, `password`, `address`, `role`, `is_active`, `is_verify`, `is_admin`, `token`, `password_reset_code`, `last_ip`, `created_at`, `updated_at`) VALUES
(3, 'admin', 'admin', 'admin', 'admin@admin.com', '12345', '751cb3f4aa17c36186f4856c8982bf27', '27 new jersey - Level 58 - CA 444 \r\nUnited State ', 1, 1, 1, 1, '', '', '', '2021-09-16 10:09:44', '2021-09-16 10:09:44'),
(32, 'user', 'user', 'user', 'user@user.com', '44897866462', '6edf26f6e0badff12fca32b16db38bf2', '', 1, 1, 1, 0, '352fe25daf686bdb4edca223c921acea', '', '', '2021-09-16 10:09:44', '2021-09-16 10:09:44'),
(33, 'john123', 'john', 'smith', 'johnsmith@gmail.com', '445889654656', '$2y$10$CcBiQrcW597s5muOP2blhOev48gzBv2VvAVp83NsXbLo7cZM7tjGm', 'USA', 7, 1, 0, 0, '', '', '', '2021-09-16 10:09:44', '2021-09-16 10:09:44'),
(38, 'john', 'smith', 'johan', 'johnsmith@gmail.com', '123456', '$2y$10$5wXvKkhMTEatZ7aUHE/RU.lQbeXdURME8Br9Noxn802epBPoFz7wu', 'asdfdasfdsfds', 1, 1, 0, 0, '', '', '', '2021-09-16 10:09:44', '2021-09-16 10:09:44'),
(39, 'techesprit as', 'zain', 'khan', 'zain@gmail.com', '03004596000', '$2y$10$FfZdqnuI60F9vKV6RDmU7.ttg9BBEv6BP7/KxyCxfTPpKwg0uXLmG', '111asdfasd', 1, 1, 0, 0, '', '', '', '2021-09-16 10:09:44', '2021-09-16 10:09:44'),
(40, 'techesprit', 'zain', 'khan', 'zain@gmail.com', '03004596000', '$2y$10$UbljVrMhHmqRYhJBumzmVOfXYmaOeZRMAEkBn0uF68Nj3VL4ACiHC', '111asdfasd', 1, 1, 0, 0, '', '', '', '2021-09-16 10:09:44', '2021-09-16 10:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `email_list`
--

CREATE TABLE `email_list` (
  `id` int(11) NOT NULL,
  `flipbook_id` int(11) DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_list`
--

INSERT INTO `email_list` (`id`, `flipbook_id`, `email`) VALUES
(1, 10, NULL),
(2, 10, 'raktimbanerjee9@gmail.com'),
(3, 7, 'raktimbanerjee9@gmail.com'),
(4, 10, 'krishnabanerjee@gmail.com'),
(5, 7, 'krishnabanerjee@gmail.com'),
(6, 7, 'krishnabanerjee@gmail.com'),
(7, 7, 'raktimbanerjee9@gmail.com'),
(8, 7, 'cm.partha@gmail.com'),
(9, 7, 'cm.partha@gmail.com'),
(10, 3, 'cm.partha@gmail.com'),
(11, 7, 'raktimbanerjee9@gmail.com'),
(12, 3, 'raktimbanerjee9@gmail.com'),
(13, 7, 'raktimbanerjee9@gmail.com'),
(14, 7, 'raktimbanerjee9@gmail.com'),
(15, 7, 'raktimbanerjee9@gmail.com'),
(16, 7, 'raktimbanerjee9@gmail.com'),
(17, 7, 'raktimbanerjee9@gmail.com'),
(18, 7, 'raktimbanerjee9@gmail.com'),
(19, 7, 'raktimbanerjee9@gmail.com'),
(20, 7, 'raktimbanerjee9@gmail.com'),
(21, 7, 'raktimbanerjee9@gmail.com'),
(22, 7, 'raktimbanerjee9@gmail.com'),
(23, 10, 'cm.partha@gmail.com'),
(24, 17, 'cm.partha@gmail.com'),
(25, 17, 'cm.partha@gmail.com'),
(26, 17, 'cm.partha@gmail.com'),
(27, 17, 'cm.partha@gmail.com'),
(28, 17, 'cm.partha@gmail.com'),
(29, 17, 'cm.partha@gmail.com'),
(30, 17, 'cm.partha@gmail.com'),
(31, 17, 'cm.partha@gmail.com'),
(32, 17, 'cm.partha@gmail.com'),
(33, 17, 'cm.partha@gmail.com'),
(34, 17, 'cm.partha@gmail.com'),
(35, 17, 'cm.partha@gmail.com'),
(36, 17, 'cm.partha@gmail.com'),
(37, 17, 'cm.partha@gmail.com'),
(38, 17, 'cm.partha@gmail.com'),
(39, 7, 'cm.partha@gmail.com'),
(40, 2, 'krishnabanerjee@gmail.com'),
(41, 3, 'raktimbanerjee9@gmail.com'),
(42, 3, 'raktimbanerjee9@gmail.com'),
(43, 3, 'raktimbanerjee9@gmail.com'),
(44, 3, 'raktimbanerjee9@gmail.com'),
(45, 3, 'raktimbanerjee9@gmail.com'),
(46, 3, 'raktimbanerjee9@gmail.com'),
(47, 3, 'raktimbanerjee9@gmail.com'),
(48, 3, 'raktimbanerjee9@gmail.com'),
(49, 3, 'raktimbanerjee9@gmail.com'),
(50, 3, 'raktimbanerjee9@gmail.com'),
(51, 3, 'raktimbanerjee9@gmail.com'),
(52, 3, 'raktimbanerjee9@gmail.com'),
(53, 3, 'raktimbanerjee9@gmail.com'),
(54, 3, 'raktimbanerjee9@gmail.com'),
(55, 3, 'raktimbanerjee9@gmail.com'),
(56, 17, 'raktimbanerjee9@gmail.com'),
(57, 17, 'raktimbanerjee9@gmail.com'),
(58, 3, 'raktimbanerjee9@gmail.com'),
(59, 3, 'raktimbanerjee9@gmail.com'),
(60, 3, 'raktimbanerjee9@gmail.com'),
(61, 3, 'raktimbanerjee9@gmail.com'),
(62, 3, 'raktimbanerjee9@gmail.com'),
(63, 3, 'raktimbanerjee9@gmail.com'),
(64, 3, 'raktimbanerjee9@gmail.com'),
(65, 3, 'raktimbanerjee9@gmail.com'),
(66, 3, 'raktimbanerjee9@gmail.com'),
(67, 3, 'raktimbanerjee9@gmail.com'),
(68, 3, 'raktimbanerjee9@gmail.com'),
(69, 3, 'raktimbanerjee9@gmail.com'),
(70, 3, 'raktimbanerjee9@gmail.com'),
(71, 3, 'raktimbanerjee9@gmail.com'),
(72, 3, 'raktimbanerjee9@gmail.com'),
(73, 3, 'raktimbanerjee9@gmail.com'),
(74, 3, 'raktimbanerjee9@gmail.com'),
(75, 3, 'raktimbanerjee9@gmail.com'),
(76, 3, 'raktimbanerjee9@gmail.com'),
(77, 3, 'raktimbanerjee9@gmail.com'),
(78, 3, 'raktimbanerjee9@gmail.com'),
(79, 3, 'raktimbanerjee9@gmail.com'),
(80, 3, 'raktimbanerjee9@gmail.com'),
(81, 3, 'raktimbanerjee9@gmail.com'),
(82, 3, 'raktimbanerjee9@gmail.com'),
(83, 3, 'raktimbanerjee9@gmail.com'),
(84, 3, 'raktimbanerjee9@gmail.com'),
(85, 3, 'raktimbanerjee9@gmail.com'),
(86, 3, 'raktimbanerjee9@gmail.com'),
(87, 3, 'raktimbanerjee9@gmail.com'),
(88, 3, 'raktimbanerjee9@gmail.com'),
(89, 3, 'raktimbanerjee9@gmail.com'),
(90, 3, 'raktimbanerjee9@gmail.com'),
(91, 3, 'raktimbanerjee9@gmail.com'),
(92, 3, 'raktimbanerjee9@gmail.com'),
(93, 3, 'cm.partha@gmail.com'),
(94, 3, 'cm.partha@gmail.com'),
(95, 3, 'cm.partha@gmail.com'),
(96, 3, 'cm.partha@gmail.com'),
(97, 3, 'cm.partha@gmail.com'),
(98, 3, 'cm.partha@gmail.com'),
(99, 3, 'cm.partha@gmail.com'),
(100, NULL, NULL),
(101, NULL, NULL),
(102, 3, 'cm.partha@gmail.com'),
(103, 3, 'cm.partha@gmail.com'),
(104, 3, 'cm.partha@gmail.com'),
(105, 3, 'cm.partha@gmail.com'),
(106, 3, 'cm.partha@gmail.com'),
(107, 3, 'cm.partha@gmail.com'),
(108, 3, 'cm.partha@gmail.com'),
(109, 3, 'krishnabanerjee@gmail.com'),
(110, 3, 'krishnabanerjee@gmail.com'),
(111, 3, 'krishnabanerjee@gmail.com'),
(112, 3, 'krishnabanerjee@gmail.com'),
(113, 3, 'krishnabanerjee@gmail.com'),
(114, 3, 'krishnabanerjee@gmail.com'),
(115, 3, 'krishnabanerjee@gmail.com'),
(116, 3, 'krishnabanerjee@gmail.com'),
(117, 3, 'krishnabanerjee@gmail.com'),
(118, NULL, NULL),
(119, 3, 'krishnabanerjee@gmail.com'),
(120, 3, 'krishnabanerjee@gmail.com'),
(121, 3, 'raktimbanerjee9@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `flipbooks`
--

CREATE TABLE `flipbooks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `cover_image` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `file_type` varchar(100) DEFAULT NULL,
  `slug` text NOT NULL,
  `password` text DEFAULT NULL,
  `share_content` tinyint(1) NOT NULL DEFAULT 1,
  `disable_right_click` tinyint(1) NOT NULL DEFAULT 0,
  `collect_email` tinyint(1) DEFAULT 0,
  `logo` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flipbooks`
--

INSERT INTO `flipbooks` (`id`, `user_id`, `title`, `description`, `cover_image`, `status`, `file_type`, `slug`, `password`, `share_content`, `disable_right_click`, `collect_email`, `logo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Image Example', 'With ebooks made via FlippingBook, you can collect any kind of lead data right from the page of your publication and analyze lead activity via built-in stats. Leads don’t have to download your ebook to read it so it’s a one-stop shop. Easy to share and SEO-friendly, your interactive ebook basically promotes itself.', 'uploads/por1.jpg', 1, NULL, 'image-example', NULL, 1, 1, 1, NULL, '2021-09-25 13:43:33', '2022-12-26 14:14:51'),
(2, 1, 'PDF Example One', 'With ebooks made via FlippingBook, you can collect any kind of lead data right from the page of your publication and analyze lead activity via built-in stats. Leads don’t have to download your ebook to read it so it’s a one-stop shop. Easy to share and SEO-friendly, your interactive ebook basically promotes itself.', 'uploads/por2.jpg', 1, NULL, 'pdf-example-one', NULL, 1, 0, 1, NULL, '2021-09-25 13:43:33', '2022-12-26 14:14:54'),
(3, 1, 'PDF Example Two', 'With ebooks made via FlippingBook, you can collect any kind of lead data right from the page of your publication and analyze lead activity via built-in stats. Leads don’t have to download your ebook to read it so it’s a one-stop shop. Easy to share and SEO-friendly, your interactive ebook basically promotes itself.', 'uploads/por5.jpg', 1, NULL, 'pdf-example-two', NULL, 1, 1, 1, NULL, '2021-09-25 13:43:33', '2022-12-26 14:14:57'),
(7, 33, 'Rahul Test Book', 'dfsdfsd dsfjdsf sdfhsd fhsdjf sdf\r\nsdfs dfhlsd\r\nsdf sdfl', 'uploads/por5.jpg', 1, 'pdf', 'rahul-test-book', '123', 1, 0, 1, NULL, '2021-10-23 07:10:07', '2022-12-26 19:39:50'),
(8, 31, 'My Test', 'test', 'uploads/books/', 1, 'pdf', 'my-test', NULL, 1, 0, 1, NULL, '2022-03-16 00:00:00', '2022-12-26 14:15:01'),
(9, 31, 'Dummy Book 1', 'My Dummy Book 1', 'uploads/books/', 1, 'pdf', 'dummy-book-1', NULL, 1, 0, 1, NULL, '2022-12-09 00:00:00', '2022-12-26 14:15:03'),
(10, 31, 'Dummy Book', 'Fakebook.', 'uploads/books/', 1, 'pdf', 'dummy-book', NULL, 1, 0, 1, NULL, '2022-12-13 00:00:00', '2022-12-26 14:15:05'),
(15, 31, 'asd', 'saf', 'uploads/books/', 1, 'pdf', 'asd', '', 0, 0, 1, NULL, '2022-12-26 00:00:00', '2022-12-26 00:00:00'),
(16, 31, 'Error animi sit du', 'Quisquam laudafghntium', 'uploads/books/fgfgCover_1672077488__.jpg', 1, 'pdf', 'fgfg', '', 1, 1, 0, NULL, '2022-12-26 00:00:00', '2022-12-26 00:00:00'),
(17, 31, 'fsfasf', 'asfsaf', 'uploads/books/fsfasfCover_1672077788__.png', 1, 'pdf', 'fsfasf', '', 1, 1, 1, '1672077788.jpg', '2022-12-26 00:00:00', '2022-12-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `flipbook_access_log`
--

CREATE TABLE `flipbook_access_log` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `ip_address` varchar(256) DEFAULT NULL,
  `brawser_info` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `browserVersion` text DEFAULT NULL,
  `full_user_agent_string` text DEFAULT NULL,
  `platform` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flipbook_access_log`
--

INSERT INTO `flipbook_access_log` (`id`, `book_id`, `ip_address`, `brawser_info`, `user_id`, `browserVersion`, `full_user_agent_string`, `platform`, `created_at`) VALUES
(1, 1, '106.223.179.36', 'Chrome', 31, '94.0.4606.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'Windows 10', '2021-10-06 02:58:41'),
(2, 1, '106.223.179.36', 'Chrome', 31, '94.0.4606.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'Windows 10', '2021-10-06 02:58:55'),
(3, 1, '103.163.200.207', 'Chrome', 0, '93.0.4577.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52', 'Windows 10', '2021-10-06 05:18:44'),
(4, 1, '103.163.200.207', 'Chrome', 0, '93.0.4577.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52', 'Windows 10', '2021-10-06 05:19:24'),
(5, 1, '132.154.30.200', 'Chrome', 0, '94.0.4606.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'Windows 10', '2021-10-06 15:43:38'),
(6, 6, '103.164.210.161', 'Chrome', 33, '94.0.4606.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36 Edg/94.0.992.50', 'Windows 10', '2021-10-23 16:43:46'),
(7, 6, '139.167.223.127', 'Chrome', 33, '94.0.4606.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'Windows 10', '2021-10-23 16:44:11'),
(8, 3, '139.167.223.127', 'Chrome', 33, '94.0.4606.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'Windows 10', '2021-10-23 16:44:52'),
(9, 6, '139.167.223.127', 'Chrome', 33, '94.0.4606.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'Windows 10', '2021-10-23 16:52:39'),
(10, 7, '139.167.223.127', 'Chrome', 33, '94.0.4606.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'Windows 10', '2021-10-23 16:54:39'),
(11, 7, '139.167.223.127', 'Chrome', 33, '94.0.4606.81', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'Windows 10', '2021-10-23 16:55:17'),
(12, 7, '103.97.211.74', 'Chrome', 0, '95.0.4638.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 'Windows 10', '2021-11-16 14:44:37'),
(13, 1, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:36:06'),
(14, 1, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:36:30'),
(15, 1, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:36:33'),
(16, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:36:41'),
(17, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:40'),
(18, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:41'),
(19, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:41'),
(20, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:41'),
(21, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:41'),
(22, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:41'),
(23, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:41'),
(24, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(25, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(26, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(27, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(28, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(29, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(30, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(31, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(32, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(33, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:37:42'),
(34, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:44:47'),
(35, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:08'),
(36, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(37, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(38, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(39, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(40, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(41, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(42, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(43, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(44, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(45, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(46, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:09'),
(47, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:10'),
(48, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:10'),
(49, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:10'),
(50, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:45:10'),
(51, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(52, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(53, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(54, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(55, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(56, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(57, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(58, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(59, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(60, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(61, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(62, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(63, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(64, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(65, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(66, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(67, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:18'),
(68, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(69, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(70, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(71, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(72, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(73, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(74, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(75, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(76, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(77, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(78, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(79, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(80, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(81, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(82, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(83, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(84, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:19'),
(85, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(86, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(87, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(88, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(89, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(90, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(91, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(92, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(93, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(94, 2, '103.164.210.130', 'Chrome', 0, '97.0.4692.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'Windows 10', '2022-01-23 08:51:20'),
(95, 2, '103.164.210.130', '', 0, '', 'WhatsApp/2.22.2.73 A', 'Unknown Platform', '2022-01-23 08:52:47'),
(96, 2, '157.40.237.167', 'Chrome', 0, '71.0.3578.141', 'Mozilla/5.0 (Linux; U; Android 9; en-gb; Redmi 7A Build/PKQ1.190319.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/11.1.9-g', 'Android', '2022-01-23 12:34:05'),
(97, 1, '103.164.210.163', 'Chrome', 0, '98.0.4758.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.87 Safari/537.36', 'Windows 10', '2022-02-14 03:53:11'),
(98, 3, '164.100.6.242', 'Chrome', 0, '98.0.4758.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'Windows 10', '2022-02-14 10:03:55'),
(99, 7, '164.100.6.242', 'Chrome', 0, '98.0.4758.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'Windows 10', '2022-02-14 10:13:15'),
(100, 1, '164.100.6.242', 'Chrome', 0, '98.0.4758.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'Windows 10', '2022-02-14 10:13:17'),
(101, 1, '2409:4060:2e9e:ce38:3d9c:b39:82e1:1c0a', 'Chrome', 0, '98.0.4758.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'Windows 10', '2022-02-14 11:06:50'),
(102, 2, '103.163.201.203', 'Chrome', 25, '99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-15 09:47:29'),
(103, 2, '2a01:4f9:6a:14d2::2', 'Chrome', 0, '91.0.4472.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'Windows 10', '2022-06-15 22:11:17'),
(104, 1, '2a01:4f9:6a:14d2::2', 'Chrome', 0, '91.0.4472.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'Windows 10', '2022-08-17 17:32:45'),
(105, 7, '2a01:4f9:6a:14d4::2', 'Chrome', 0, '91.0.4472.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'Windows 10', '2022-08-31 03:35:39'),
(106, 3, '2a01:4f9:6a:14d1::2', 'Chrome', 0, '91.0.4472.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'Windows 10', '2022-09-16 00:02:00'),
(107, 8, '2a01:4f9:6a:14d4::2', 'Chrome', 0, '91.0.4472.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54', 'Windows 10', '2022-09-19 04:07:49'),
(108, 1, '2405:201:8009:6189:2963:bd24:dfc:3004', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-11-26 18:29:19'),
(109, 7, '2405:201:8009:6189:2963:bd24:dfc:3004', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-11-26 18:30:26'),
(110, 1, '2405:201:8009:6189:2963:bd24:dfc:3004', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-11-26 18:30:44'),
(111, 7, '2405:201:8009:6189:9004:9b41:b29f:59b1', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-11-26 18:33:26'),
(112, 2, '2405:201:8009:6189:5155:60c4:6fd4:6176', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-11-29 18:28:00'),
(113, 2, '2409:4072:6c85:6639:c6ea:6f1f:77e:2e3c', 'Chrome', 0, '91.0.4472.114', 'Mozilla/5.0 (Linux; Android 12; V2022) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Mobile Safari/537.36', 'Android', '2022-11-29 18:46:00'),
(114, 2, '5.255.253.179', '', 0, '', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 'Unknown Platform', '2022-11-29 18:46:30'),
(115, 2, '2409:4072:6c85:6639:c6ea:6f1f:77e:2e3c', 'Chrome', 0, '91.0.4472.114', 'Mozilla/5.0 (Linux; Android 12; V2022) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Mobile Safari/537.36', 'Android', '2022-11-29 18:46:31'),
(116, 2, '2405:204:312b:c9fc:cae0:54ab:a44a:8e02', 'Chrome', 0, '105.0.0.0', 'Mozilla/5.0 (Linux; Android 10; POCO X2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Mobile Safari/537.36', 'Android', '2022-11-29 18:54:05'),
(117, 2, '98.159.226.52', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-11-30 00:50:09'),
(118, 1, '2409:4060:2d9c:56ac:4a91:e025:cefe:eee5', 'Chrome', 0, '104.0.0.0', 'Mozilla/5.0 (Linux; Android 10; Redmi 7A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Mobile Safari/537.36', 'Android', '2022-11-30 01:50:53'),
(119, 2, '117.215.244.87', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Linux; Android 10; ASUS_I001DE) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'Android', '2022-11-30 03:40:32'),
(120, 1, '149.56.150.51', 'Chrome', 0, '60.0.3112.90', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36 React.org', 'Windows 8.1', '2022-11-30 06:04:07'),
(121, 2, '149.56.150.51', 'Chrome', 0, '60.0.3112.90', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36 React.org', 'Windows 8.1', '2022-11-30 06:04:09'),
(122, 3, '149.56.150.51', 'Chrome', 0, '60.0.3112.90', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36 React.org', 'Windows 8.1', '2022-11-30 06:04:10'),
(123, 7, '149.56.150.51', 'Chrome', 0, '60.0.3112.90', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36 React.org', 'Windows 8.1', '2022-11-30 06:04:11'),
(124, 8, '149.56.150.51', 'Chrome', 0, '60.0.3112.90', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36 React.org', 'Windows 8.1', '2022-11-30 06:04:13'),
(125, 2, '45.126.3.252', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-11-30 06:55:47'),
(126, 2, '63.117.14.7', 'Chrome', 0, '106.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Windows 10', '2022-11-30 06:55:49'),
(127, 2, '103.113.216.42', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 7', '2022-12-03 09:36:48'),
(128, 2, '61.0.202.139', 'Chrome', 0, '100.0.4896.79', 'Mozilla/5.0 (Linux; Android 10; M2006C3LII) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.79 Mobile Safari/537.36', 'Android', '2022-12-03 09:40:18'),
(129, 2, '188.43.136.45', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 09:54:12'),
(130, 1, '188.43.136.45', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 09:55:19'),
(131, 2, '123.201.66.196', 'Chrome', 0, '108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 12:16:53'),
(132, 1, '123.201.66.196', 'Chrome', 0, '108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 12:22:47'),
(133, 2, '123.201.66.196', 'Chrome', 0, '108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 12:23:11'),
(134, 2, '123.201.66.196', 'Chrome', 0, '108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 12:23:35'),
(135, 2, '193.233.39.134', 'Chrome', 0, '61.0.3163.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'Windows 10', '2022-12-03 12:58:12'),
(136, 3, '103.105.178.253', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 15:33:25'),
(137, 2, '103.105.178.253', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 15:34:08'),
(138, 2, '5.255.253.179', '', 0, '', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', 'Unknown Platform', '2022-12-03 15:37:08'),
(139, 2, '2402:e280:2239:158:44a1:5a80:eea0:ae85', 'Chrome', 0, '108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2022-12-03 19:03:25'),
(140, 2, '149.154.161.231', '', 0, '', 'TelegramBot (like TwitterBot)', 'Unknown Platform', '2022-12-03 21:51:47'),
(141, 2, '197.210.227.164', 'Chrome', 0, '92.0.4515.159', 'Mozilla/5.0 (Linux; Android 9; TECNO BB4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36', 'Android', '2022-12-03 21:51:53'),
(142, 2, '183.87.57.53', 'Safari', 0, '605.1.15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Safari/605.1.15', 'Mac OS X', '2022-12-04 05:20:15'),
(143, 2, '197.121.95.119', 'Chrome', 0, '108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2022-12-04 11:27:16'),
(144, 2, '103.242.197.216', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-12-06 06:28:02'),
(145, 2, '182.79.251.82', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-12-06 06:28:06'),
(146, 2, '103.242.197.45', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-12-06 14:40:12'),
(147, 2, '103.242.197.45', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Windows 10', '2022-12-06 14:55:29'),
(148, 2, '2409:4060:203:86d0::c42:e8b0', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Linux; Android 10; M2006C3MII) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'Android', '2022-12-09 16:49:47'),
(149, 2, '2402:3a80:198b:bb86:4b16:41cd:f8d:7c8c', 'Chrome', 0, '98.0.4758.102', 'Mozilla/5.0 (Linux; Android 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36', 'Android', '2022-12-13 08:26:54'),
(150, 2, '2402:3a80:198b:bb86:4b16:41cd:f8d:7c8c', 'Chrome', 0, '98.0.4758.102', 'Mozilla/5.0 (Linux; Android 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36', 'Android', '2022-12-13 08:28:30'),
(151, 2, '116.193.139.37', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Linux; Android 12; V2036) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'Android', '2022-12-13 08:45:08'),
(152, 2, '2409:4060:2d82:c620:f836:3fba:62fc:f810', 'Chrome', 0, '107.0.0.0', 'Mozilla/5.0 (Linux; Android 12; V2036) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36', 'Android', '2022-12-13 08:45:48'),
(153, 1, '2402:3a80:198b:bb86:4b16:41cd:f8d:7c8c', 'Chrome', 0, '98.0.4758.102', 'Mozilla/5.0 (Linux; Android 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36', 'Android', '2022-12-13 08:56:29'),
(154, 2, '2402:3a80:198b:bb86:4b16:41cd:f8d:7c8c', 'Chrome', 0, '98.0.4758.102', 'Mozilla/5.0 (Linux; Android 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36', 'Android', '2022-12-13 08:56:44'),
(155, 2, '103.75.161.106', 'Opera', 0, '93.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0', 'Windows 10', '2022-12-13 10:05:02'),
(156, 1, '103.75.161.106', 'Opera', 0, '93.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0', 'Windows 10', '2022-12-13 10:06:15'),
(157, 2, '103.75.161.106', 'Opera', 0, '93.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0', 'Windows 10', '2022-12-13 10:06:29'),
(158, 2, '103.75.161.106', 'Opera', 0, '93.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0', 'Windows 10', '2022-12-13 10:09:57'),
(159, 2, '2409:4060:2e89:f150:d56b:93c6:e4e5:bc51', 'Chrome', 0, '108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2022-12-13 10:45:26'),
(160, 1, '::1', 'Chrome', 31, '108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2022-12-14 09:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `flipbook_files`
--

CREATE TABLE `flipbook_files` (
  `id` int(11) NOT NULL,
  `flipbook_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(225) NOT NULL,
  `thumbs` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flipbook_files`
--

INSERT INTO `flipbook_files` (`id`, `flipbook_id`, `title`, `file`, `thumbs`, `created_at`, `updated_at`) VALUES
(81, 1, 'Context', 'uploads/0fe0382a27bbc4336939a4dd4b3acee2.jpg', 'service.png', '2019-11-26 21:07:49', '2021-09-25 15:37:50'),
(84, 1, 'Acknowledge', 'uploads/0fe0382a27bbc4336939a4dd4b3acee2.jpg', 'avatar_02', '2019-11-26 21:07:49', '2021-09-25 15:37:31'),
(85, 1, 'Index', 'uploads/0fe0382a27bbc4336939a4dd4b3acee2.jpg', 'service.png', '2019-11-26 21:07:49', '2021-09-25 15:37:40'),
(86, 1, 'Main Page', 'uploads/0fe0382a27bbc4336939a4dd4b3acee2.jpg', 'avatar_02', '2019-11-26 21:07:49', '2021-09-25 15:37:43'),
(87, 2, 'Main Page', 'uploads/example.pdf', 'NULL', '2019-11-26 21:07:49', '2021-09-25 15:37:43'),
(88, 3, 'Main Page', 'uploads/book2.pdf', 'NULL', '2019-11-26 21:07:49', '2021-09-25 15:55:42'),
(90, 6, 'test test sdhs kjsdk s', 'uploads/books/test-test-sdhs-kjsdk-s_1635005075__file.png', '', '2021-10-23 07:04:35', '2021-10-23 09:04:35'),
(91, 6, 'test test sdhs kjsdk s', 'uploads/books/test-test-sdhs-kjsdk-s_1635005075__file.png', '', '2021-10-23 07:04:35', '2021-10-23 09:04:35'),
(92, 6, 'test test sdhs kjsdk s', 'uploads/books/test-test-sdhs-kjsdk-s_1635005075__file.png', '', '2021-10-23 07:04:35', '2021-10-23 09:04:35'),
(93, 7, 'Rahul Test Book', 'uploads/books/rahul-test-book_1635005707__file.pdf', '', '2021-10-23 07:15:07', '2021-10-23 09:15:07'),
(94, 8, 'My Test', 'uploads/books/my-test_1647455515__file.pdf', '', '2022-03-16 09:31:55', '2022-03-16 18:31:55'),
(95, 9, 'Dummy Book 1', 'uploads/books/dummy-book-1_1670612451__file.pdf', '', '2022-12-09 09:00:51', '2022-12-09 19:00:51'),
(96, 10, 'Dummy Book', 'uploads/books/dummy-book_1671008996__file.pdf', '', '2022-12-13 23:09:56', '2022-12-14 14:39:56'),
(97, 11, 'sadas', 'uploads/books/sadas_1671171465__file.pdf', '', '2022-12-15 20:17:45', '2022-12-16 11:47:45'),
(98, 12, 'asdsad', 'uploads/books/asdsad_1671171512__file.pdf', '', '2022-12-15 20:18:32', '2022-12-16 11:48:32'),
(99, 13, 'sds', 'uploads/books/sds_1671171655__file.pdf', '', '2022-12-15 20:20:55', '2022-12-16 11:50:55'),
(100, 14, 'asdsa', 'uploads/books/asdsa_1671171705__file.pdf', '', '2022-12-15 20:21:45', '2022-12-16 11:51:45'),
(101, 15, 'asd', 'uploads/books/asd_1672077349__file.pdf', '', '2022-12-26 07:55:49', '2022-12-26 23:25:49'),
(102, 16, 'Error animi sit du', 'uploads/books/fgfg_1672077488__file.pdf', '', '2022-12-26 07:58:08', '2022-12-26 23:28:08'),
(103, 17, 'fsfasf', 'uploads/books/fsfasf_1672077788__file.pdf', '', '2022-12-26 08:03:08', '2022-12-26 23:33:08');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `controller_name` varchar(255) NOT NULL,
  `fa_icon` varchar(100) NOT NULL,
  `operation` text NOT NULL,
  `sort_order` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `module_name`, `controller_name`, `fa_icon`, `operation`, `sort_order`) VALUES
(1, 'users', 'admin', 'fa-pie-chart', 'view|add|edit|delete|change_status|access', 3),
(2, 'role_and_permissions', 'admin_roles', 'fa-book', 'view|add|edit|delete|change_status|access', 4),
(7, 'backup_and_export', 'export', 'fa-database', 'access', 12),
(8, 'settings', 'general_settings', 'fa-cogs', 'view|add|edit|access', 13),
(9, 'dashboard', 'dashboard', 'fa-dashboard', 'view|index_1|access', 1),
(25, 'profile', 'profile', 'fa-user', 'access', 2),
(26, 'activity_log', 'activity', 'fa-flag-o', 'access', 11),
(27, 'flipbook', 'flipbook', 'fa-book', 'view|add|edit|access', 5);

-- --------------------------------------------------------

--
-- Table structure for table `module_access`
--

CREATE TABLE `module_access` (
  `id` int(11) NOT NULL,
  `admin_role_id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_access`
--

INSERT INTO `module_access` (`id`, `admin_role_id`, `module`, `operation`) VALUES
(1, 1, 'users', 'view'),
(2, 1, 'users', 'add'),
(3, 1, 'users', 'edit'),
(5, 1, 'users', 'access'),
(6, 1, 'users', 'change_status'),
(7, 1, 'export', 'access'),
(8, 1, 'general_settings', 'view'),
(9, 1, 'general_settings', 'add'),
(10, 1, 'general_settings', 'edit'),
(11, 1, 'general_settings', 'access'),
(27, 2, 'dashboard', 'access'),
(28, 2, 'profile', 'access'),
(29, 2, 'dashboard', 'view'),
(36, 2, 'calendar', 'access'),
(43, 2, 'users', 'view'),
(44, 2, 'users', 'add'),
(45, 2, 'users', 'edit'),
(46, 2, 'users', 'change_status'),
(47, 2, 'users', 'access'),
(51, 2, 'location', 'access'),
(52, 2, 'activity', 'access'),
(53, 2, 'Flipbook', 'access'),
(54, 5, 'dashboard', 'view'),
(55, 5, 'dashboard', 'index_1'),
(56, 5, 'dashboard', 'access'),
(57, 5, 'profile', 'access'),
(58, 5, 'flipbook', 'view'),
(59, 5, 'flipbook', 'add'),
(60, 5, 'flipbook', 'edit'),
(61, 5, 'flipbook', 'access'),
(62, 2, 'flipbook', 'view'),
(63, 2, 'flipbook', 'add'),
(64, 2, 'flipbook', 'edit'),
(65, 2, 'flipbook', 'access'),
(66, 1, 'flipbook', 'view'),
(67, 1, 'flipbook', 'add'),
(68, 1, 'flipbook', 'edit'),
(69, 1, 'flipbook', 'access');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `flipbook_id` int(11) NOT NULL,
  `content_type` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `page` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `flipbook_id`, `content_type`, `content`, `page`) VALUES
(8, 3, 'media', 'https://www.youtube.com/embed/KDP0dCZ6M68', 2),
(9, 3, 'note', 'Sticky Notes', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sub_module`
--

CREATE TABLE `sub_module` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_module`
--

INSERT INTO `sub_module` (`id`, `parent`, `name`, `link`, `sort_order`) VALUES
(2, 2, 'module_setting', 'module', 1),
(3, 2, 'role_and_permissions', '', 2),
(6, 1, 'users_list', '', 1),
(26, 9, 'dashboard', '', 1),
(36, 10, 'file_upload', 'file_upload', 5),
(47, 17, 'general', 'general', 1),
(59, 22, 'profile', 'profile', 2),
(60, 22, 'login', 'login', 3),
(61, 22, 'register', 'register', 4),
(62, 8, 'email_templates', 'email_templates', 2),
(63, 23, 'error_404', 'error404', 1),
(64, 23, 'error_500', 'error500', 2),
(65, 23, 'blank_page', 'blank', 3),
(66, 23, 'starter_page', 'starter', 4),
(67, 8, 'general_settings', '', 1),
(69, 25, 'view_profile', '', 1),
(70, 25, 'change_password', 'change_pwd', 2),
(71, 10, 'multiple_files_upload', 'multi_file_upload', 6),
(74, 27, 'manage_flipbooks', 'list', 1);

-- --------------------------------------------------------

--
-- Table structure for table `unique_visitor`
--

CREATE TABLE `unique_visitor` (
  `id` int(11) NOT NULL,
  `flipbook_id` int(11) DEFAULT NULL,
  `ip_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unique_visitor`
--

INSERT INTO `unique_visitor` (`id`, `flipbook_id`, `ip_address`) VALUES
(1, 3, '::1'),
(2, 3, '::1'),
(3, 3, '::1'),
(4, 3, '::1'),
(5, 3, '::1'),
(6, 3, '::1'),
(7, 3, '::1'),
(8, 3, '::1'),
(9, 3, '::1'),
(10, 3, '::1'),
(11, 3, '::1'),
(12, 3, '::1'),
(13, 3, '::1'),
(14, NULL, '::1'),
(15, NULL, '::1'),
(16, 3, '::1'),
(17, 3, '::1'),
(18, 3, '::1'),
(19, 3, '::1'),
(20, 3, '::1'),
(21, 3, '::1'),
(22, 3, '::1'),
(23, 3, '::1'),
(24, 3, '::1'),
(25, 3, '::1'),
(26, 3, '::1'),
(27, 3, '::1'),
(28, 3, '::1'),
(29, 3, '::1'),
(30, 3, '::1'),
(31, 3, '::1'),
(32, NULL, '::1'),
(33, 3, '::1'),
(34, 3, '::1'),
(35, 3, '::1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_activity_log`
--
ALTER TABLE `ci_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_activity_status`
--
ALTER TABLE `ci_activity_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_admin`
--
ALTER TABLE `ci_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `ci_admin_roles`
--
ALTER TABLE `ci_admin_roles`
  ADD PRIMARY KEY (`admin_role_id`);

--
-- Indexes for table `ci_email_templates`
--
ALTER TABLE `ci_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_email_template_variables`
--
ALTER TABLE `ci_email_template_variables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_general_settings`
--
ALTER TABLE `ci_general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_language`
--
ALTER TABLE `ci_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_users`
--
ALTER TABLE `ci_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_list`
--
ALTER TABLE `email_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flipbooks`
--
ALTER TABLE `flipbooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `flipbook_access_log`
--
ALTER TABLE `flipbook_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flipbook_files`
--
ALTER TABLE `flipbook_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `module_access`
--
ALTER TABLE `module_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `RoleId` (`admin_role_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_module`
--
ALTER TABLE `sub_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Parent Module ID` (`parent`);

--
-- Indexes for table `unique_visitor`
--
ALTER TABLE `unique_visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ci_activity_log`
--
ALTER TABLE `ci_activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ci_activity_status`
--
ALTER TABLE `ci_activity_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ci_admin`
--
ALTER TABLE `ci_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `ci_admin_roles`
--
ALTER TABLE `ci_admin_roles`
  MODIFY `admin_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ci_email_templates`
--
ALTER TABLE `ci_email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ci_email_template_variables`
--
ALTER TABLE `ci_email_template_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ci_general_settings`
--
ALTER TABLE `ci_general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ci_language`
--
ALTER TABLE `ci_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ci_users`
--
ALTER TABLE `ci_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `email_list`
--
ALTER TABLE `email_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `flipbooks`
--
ALTER TABLE `flipbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `flipbook_access_log`
--
ALTER TABLE `flipbook_access_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `flipbook_files`
--
ALTER TABLE `flipbook_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `module_access`
--
ALTER TABLE `module_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sub_module`
--
ALTER TABLE `sub_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `unique_visitor`
--
ALTER TABLE `unique_visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
