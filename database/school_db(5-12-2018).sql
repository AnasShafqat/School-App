-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2018 at 09:08 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `branch_code` varchar(32) NOT NULL,
  `branch_name` varchar(32) NOT NULL,
  `branch_location` varchar(50) NOT NULL,
  `branch_contact_no` varchar(32) NOT NULL,
  `branch_email` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `institute_id`, `branch_code`, `branch_name`, `branch_location`, `branch_contact_no`, `branch_email`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, '001', 'Dari Sanghi(RYK)', 'Dari Sanghi', '068-58-23456', 'tci@gmal.com', 'Active', '2018-12-04 07:12:13', '2018-12-04 07:12:13', 1, 1),
(2, 1, '002', 'Gulshan Iqbal(RYK)', 'Gulshan Iqbal', '068-58-75567', 'tciryk@gmail.com', 'Active', '2018-12-04 07:12:27', '2018-12-04 07:12:27', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_designation`
--

CREATE TABLE `emp_designation` (
  `emp_designation_id` int(11) NOT NULL,
  `emp_designation` varchar(100) NOT NULL,
  `emp_designation_type` enum('Permanent','Visitor') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_designation`
--

INSERT INTO `emp_designation` (`emp_designation_id`, `emp_designation`, `emp_designation_type`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Principal', 'Permanent', '2018-10-31 08:17:08', '2018-10-31 08:17:08', 1, 1),
(2, 'Vise Principal', 'Permanent', '2018-10-31 08:17:30', '2018-10-31 08:17:30', 1, 1),
(3, 'Coordinator', 'Permanent', '2018-10-31 08:23:02', '0000-00-00 00:00:00', 1, 0),
(4, 'Teacher', 'Permanent', '2018-10-31 08:23:21', '0000-00-00 00:00:00', 1, 0),
(5, 'Security Gaurd', 'Permanent', '2018-10-31 09:55:43', '2018-10-31 09:55:43', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_info`
--

CREATE TABLE `emp_info` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_father_name` varchar(50) NOT NULL,
  `emp_cnic` varchar(15) NOT NULL,
  `emp_contact_no` varchar(15) NOT NULL,
  `emp_address` varchar(200) NOT NULL,
  `emp_marital_status` enum('Single','Married') NOT NULL,
  `emp_gender` enum('Male','Female') NOT NULL,
  `emp_designation_id` int(11) NOT NULL,
  `emp_email` varchar(84) NOT NULL,
  `emp_qualification` varchar(50) NOT NULL,
  `emp_passing_year` int(11) NOT NULL,
  `emp_institute_name` varchar(50) NOT NULL,
  `emp_salary` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_info`
--

INSERT INTO `emp_info` (`emp_id`, `emp_name`, `emp_father_name`, `emp_cnic`, `emp_contact_no`, `emp_address`, `emp_marital_status`, `emp_gender`, `emp_designation_id`, `emp_email`, `emp_qualification`, `emp_passing_year`, `emp_institute_name`, `emp_salary`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Shoiab Nawaz', 'Haq Nawaz', '12345-6789876-5', '+12-345-6789876', 'Gulshan Usman', 'Single', 'Male', 4, 'shoaib@gmail.com', 'MCS', 2016, 'Islamia University, BWP', 20000, '2018-10-31 09:11:28', '2018-10-31 09:11:28', 1, 1),
(2, 'Nadia', 'iftikhar Ali', '23456-7890987-6', '+98-765-4323456', 'gfdsdfg', 'Single', 'Female', 4, 'ertyu8ijh', 'vcds', 2016, 'nbvcd', 12000, '2018-11-05 17:04:46', '0000-00-00 00:00:00', 1, 0),
(3, 'Faraz Ahmed', 'Naveed', '12345-6789876-5', '+23-456-7890987', 'dfghjkkjh', 'Single', 'Male', 1, 'ranafaraz@gmail.com', 'M.phil', 2018, 'XYZ', 10000, '2018-12-03 15:23:56', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fee_transaction_detail`
--

CREATE TABLE `fee_transaction_detail` (
  `fee_trans_detail_id` int(11) NOT NULL,
  `fee_trans_detail_head_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `fee_amount` double DEFAULT NULL,
  `fee_discount` varchar(100) DEFAULT NULL,
  `discounted_value` double DEFAULT NULL,
  `net_total` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_transaction_detail`
--

INSERT INTO `fee_transaction_detail` (`fee_trans_detail_id`, `fee_trans_detail_head_id`, `fee_type_id`, `fee_amount`, `fee_discount`, `discounted_value`, `net_total`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 665, '5%', 35, 0, '2018-12-03 15:29:11', '0000-00-00 00:00:00', 1, 0),
(2, 1, 3, 220, '80', 80, 0, '2018-12-03 15:29:11', '0000-00-00 00:00:00', 1, 0),
(3, 1, 5, 200, '0', 0, 0, '2018-12-03 15:29:11', '0000-00-00 00:00:00', 1, 0),
(4, 2, 2, 1350, '50', 50, 0, '2018-12-03 15:31:37', '0000-00-00 00:00:00', 1, 0),
(5, 2, 4, 190, '5%', 10, 0, '2018-12-03 15:31:37', '0000-00-00 00:00:00', 1, 0),
(6, 3, 1, 1200, '0', 0, 0, '2018-12-04 19:17:30', '0000-00-00 00:00:00', 1, 0),
(7, 3, 2, 1615, '5%', 85, 0, '2018-12-04 19:17:30', '0000-00-00 00:00:00', 1, 0),
(8, 3, 5, 150, '50', 50, 0, '2018-12-04 19:17:30', '0000-00-00 00:00:00', 1, 0),
(9, 4, 2, 1500, '100', 100, 0, '2018-12-04 19:20:21', '0000-00-00 00:00:00', 1, 0),
(10, 4, 3, 130, '70', 70, 0, '2018-12-04 19:20:21', '0000-00-00 00:00:00', 1, 0),
(11, 5, 2, 1160, '40', 40, 0, '2018-12-04 19:27:41', '0000-00-00 00:00:00', 1, 0),
(12, 5, 4, 80, '70', 70, 0, '2018-12-04 19:27:41', '0000-00-00 00:00:00', 1, 0),
(13, 5, 5, 138, '8%', 12, 0, '2018-12-04 19:27:41', '0000-00-00 00:00:00', 1, 0),
(14, 6, 2, 1209, '7%', 91, 0, '2018-12-04 19:29:36', '0000-00-00 00:00:00', 1, 0),
(15, 6, 4, 94, '6%', 6, 0, '2018-12-04 19:29:36', '0000-00-00 00:00:00', 1, 0),
(16, 7, 2, 1302, '7%', 98, 0, '2018-12-04 19:33:06', '0000-00-00 00:00:00', 1, 0),
(17, 7, 4, 273, '9%', 27, 0, '2018-12-04 19:33:06', '0000-00-00 00:00:00', 1, 0),
(18, 7, 6, 1840, '8%', 160, 0, '2018-12-04 19:33:06', '0000-00-00 00:00:00', 1, 0),
(19, 8, 2, 1330, '5%', 70, 0, '2018-12-05 05:59:38', '0000-00-00 00:00:00', 1, 0),
(20, 8, 4, 50, '0', 0, 0, '2018-12-05 05:59:38', '0000-00-00 00:00:00', 1, 0),
(21, 9, 2, 1620, '10%', 180, 0, '2018-12-05 06:01:28', '0000-00-00 00:00:00', 1, 0),
(22, 9, 4, 250, '50%', 250, 0, '2018-12-05 06:01:28', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fee_transaction_head`
--

CREATE TABLE `fee_transaction_head` (
  `fee_trans_id` int(11) NOT NULL,
  `std_class_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `total_amount` double NOT NULL,
  `total_discount` double NOT NULL,
  `paid_amount` double NOT NULL,
  `remaining` double NOT NULL,
  `status` enum('Paid','Unpaid') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_transaction_head`
--

INSERT INTO `fee_transaction_head` (`fee_trans_id`, `std_class_id`, `std_id`, `month`, `transaction_date`, `total_amount`, `total_discount`, `paid_amount`, `remaining`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 4, 9, 12, '2018-12-03 08:27:47', 1085, 115, 1085, 0, 'Paid', '2018-12-05 05:57:37', '0000-00-00 00:00:00', 1, 0),
(2, 4, 8, 12, '2018-12-03 08:30:44', 1540, 60, 0, 0, 'Paid', '2018-12-05 05:57:55', '0000-00-00 00:00:00', 1, 0),
(3, 3, 3, 12, '2018-12-05 12:16:30', 2965, 135, 0, 0, 'Paid', '2018-12-04 19:17:30', '0000-00-00 00:00:00', 1, 0),
(4, 3, 4, 12, '2018-12-05 12:18:58', 1630, 170, 0, 0, 'Paid', '2018-12-04 19:20:21', '0000-00-00 00:00:00', 1, 0),
(5, 3, 5, 12, '2018-12-05 12:26:33', 1378, 122, 0, 0, 'Paid', '2018-12-04 19:27:41', '0000-00-00 00:00:00', 1, 0),
(6, 3, 6, 12, '2018-12-05 12:28:35', 1303, 97, 0, 0, 'Paid', '2018-12-04 19:29:36', '0000-00-00 00:00:00', 1, 0),
(7, 3, 7, 12, '2018-12-05 12:31:25', 3415, 285, 0, 0, 'Paid', '2018-12-04 19:33:05', '0000-00-00 00:00:00', 1, 0),
(8, 1, 1, 11, '2018-11-01 10:55:26', 1380, 70, 0, 0, 'Paid', '2018-12-05 05:59:38', '0000-00-00 00:00:00', 1, 0),
(9, 1, 2, 11, '2018-11-01 11:00:27', 1870, 430, 0, 0, 'Paid', '2018-12-05 06:01:28', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fee_type`
--

CREATE TABLE `fee_type` (
  `fee_type_id` int(11) NOT NULL,
  `fee_type_name` varchar(64) NOT NULL,
  `fee_type_description` varchar(120) NOT NULL,
  `fee_amount` double DEFAULT NULL,
  `starting_date` datetime DEFAULT NULL,
  `ending_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_type`
--

INSERT INTO `fee_type` (`fee_type_id`, `fee_type_name`, `fee_type_description`, `fee_amount`, `starting_date`, `ending_date`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Admission Fee', 'Student have to pay admission fee only one time', 1000, '2015-01-01 11:30:48', '2016-01-01 11:30:48', '2018-11-03 06:36:22', '0000-00-00 00:00:00', 1, 0),
(2, 'Tuition Fee', 'Paid on monthly bases', NULL, NULL, NULL, '2018-11-03 06:48:34', '0000-00-00 00:00:00', 1, 0),
(3, 'Late Fee Fine', 'Pay fine after due date', 100, NULL, NULL, '2018-11-03 06:50:23', '2018-11-03 06:50:23', 1, 1),
(4, 'Absent Fine', 'pay fine when student is absent', 10, NULL, NULL, '2018-11-03 06:51:12', '0000-00-00 00:00:00', 1, 0),
(5, 'Library Fine', 'Pay fine in case of library rules voilation', 50, NULL, NULL, '2018-11-03 06:52:59', '0000-00-00 00:00:00', 1, 0),
(6, 'Transportation Fee', 'Pay when student take transportation service.', 500, '2015-03-01 11:50:03', '2016-01-01 11:55:03', '2018-11-03 06:54:41', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `institute`
--

CREATE TABLE `institute` (
  `institute_id` int(11) NOT NULL,
  `institute_name` varchar(65) NOT NULL,
  `institute_logo` varchar(200) NOT NULL,
  `institute_account_no` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute`
--

INSERT INTO `institute` (`institute_id`, `institute_name`, `institute_logo`, `institute_account_no`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, ' THE CANADIAN INSTITUTE (TCI)', '', '54637195377393', '2018-12-04 16:33:46', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1538846625),
('m130524_201442_init', 1538846629);

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `month_id` int(11) NOT NULL,
  `month_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'Fabruary'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `std_academic_info`
--

CREATE TABLE `std_academic_info` (
  `academic_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `previous_class` varchar(50) NOT NULL,
  `passing_year` varchar(32) NOT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `obtained_marks` int(11) DEFAULT NULL,
  `grades` enum('A+','A','B','C','D','E','F') DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `Institute` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_academic_info`
--

INSERT INTO `std_academic_info` (`academic_id`, `std_id`, `class_name_id`, `previous_class`, `passing_year`, `total_marks`, `obtained_marks`, `grades`, `percentage`, `Institute`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 3, 7, '3rd', '2017', 505, 500, 'A+', 98, 'DexDevs', '2018-10-10 14:10:59', '0000-00-00 00:00:00', 1, 0),
(2, 1, 9, '5th', '2017', 505, 400, 'A', 89, 'DexDevs', '2018-10-10 14:19:34', '0000-00-00 00:00:00', 1, 0),
(3, 2, 3, 'KG1', '2017', 300, 299, 'A+', 99, 'DexDevs', '2018-10-10 14:20:12', '0000-00-00 00:00:00', 1, 0),
(4, 9, 9, '5th', '2011', NULL, NULL, '', NULL, 'XYZ', '2018-11-03 06:06:34', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_class`
--

CREATE TABLE `std_class` (
  `class_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_class`
--

INSERT INTO `std_class` (`class_id`, `class_name_id`, `session_id`, `section_id`, `class_name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 2, 1, 'Play Group-2016-2017-Pink', '2018-12-03 15:17:28', '0000-00-00 00:00:00', 1, 0),
(2, 3, 2, 2, 'Prep-2016-2017-Green', '2018-12-03 15:17:49', '0000-00-00 00:00:00', 1, 0),
(3, 5, 2, 3, '2nd-2016-2017-Blue', '2018-12-03 15:18:09', '0000-00-00 00:00:00', 1, 0),
(4, 5, 2, 1, '2nd-2016-2017-Pink', '2018-12-03 15:18:34', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_class_name`
--

CREATE TABLE `std_class_name` (
  `class_name_id` int(11) NOT NULL,
  `class_name` varchar(32) NOT NULL,
  `class_name_description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_class_name`
--

INSERT INTO `std_class_name` (`class_name_id`, `class_name`, `class_name_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Play Group', 'Play Group', '2018-10-07 20:31:34', '0000-00-00 00:00:00', 1, 0),
(2, 'KG1', 'KG!', '2018-10-07 20:31:48', '0000-00-00 00:00:00', 1, 0),
(3, 'Prep', 'Prep', '2018-10-07 20:32:01', '0000-00-00 00:00:00', 1, 0),
(4, '1st', '1st', '2018-10-07 20:37:01', '0000-00-00 00:00:00', 1, 0),
(5, '2nd', '2nd', '2018-10-07 20:37:10', '0000-00-00 00:00:00', 1, 0),
(6, '3rd', '3rd', '2018-10-07 20:37:19', '0000-00-00 00:00:00', 1, 0),
(7, '4th', '4th', '2018-10-07 20:37:35', '0000-00-00 00:00:00', 1, 0),
(8, '5th', '5th', '2018-10-07 20:37:44', '0000-00-00 00:00:00', 1, 0),
(9, '6th', '6th', '2018-10-07 20:37:53', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_enrollment_detail`
--

CREATE TABLE `std_enrollment_detail` (
  `std_enroll_detail_id` int(11) NOT NULL,
  `std_enroll_detail_head_id` int(11) NOT NULL,
  `std_enroll_detail_std_id` int(11) NOT NULL,
  `std_enroll_detail_std_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_enrollment_detail`
--

INSERT INTO `std_enrollment_detail` (`std_enroll_detail_id`, `std_enroll_detail_head_id`, `std_enroll_detail_std_id`, `std_enroll_detail_std_name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 'Kinza', '2018-12-03 15:19:21', '0000-00-00 00:00:00', 1, 0),
(2, 1, 2, 'Nadia', '2018-12-03 15:19:21', '0000-00-00 00:00:00', 1, 0),
(3, 2, 3, 'Noman', '2018-12-03 15:20:43', '0000-00-00 00:00:00', 1, 0),
(4, 2, 4, 'Ali', '2018-12-03 15:20:43', '0000-00-00 00:00:00', 1, 0),
(5, 2, 5, 'Hamza', '2018-12-03 15:20:43', '0000-00-00 00:00:00', 1, 0),
(6, 2, 6, 'Qasim', '2018-12-03 15:20:43', '0000-00-00 00:00:00', 1, 0),
(7, 2, 7, 'Anas Shafqat', '2018-12-03 15:20:43', '0000-00-00 00:00:00', 1, 0),
(8, 3, 8, 'Zia Ali', '2018-12-03 15:21:14', '0000-00-00 00:00:00', 1, 0),
(9, 3, 9, 'Ali Naveed', '2018-12-03 15:21:14', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_enrollment_head`
--

CREATE TABLE `std_enrollment_head` (
  `std_enroll_head_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `std_enroll_head_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_enrollment_head`
--

INSERT INTO `std_enrollment_head` (`std_enroll_head_id`, `class_id`, `std_enroll_head_name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'Play Group-2016-2017-Pink', '2018-12-03 15:19:21', '0000-00-00 00:00:00', 1, 0),
(2, 3, '2nd-2016-2017-Blue', '2018-12-03 15:20:43', '0000-00-00 00:00:00', 1, 0),
(3, 4, '2nd-2016-2017-Pink', '2018-12-03 15:21:14', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_details`
--

CREATE TABLE `std_fee_details` (
  `fee_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `admission_fee` double NOT NULL,
  `addmission_fee_discount` double NOT NULL,
  `net_addmission_fee` double NOT NULL,
  `monthly_fee` double NOT NULL,
  `monthly_fee_discount` double NOT NULL,
  `net_monthly_fee` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_fee_details`
--

INSERT INTO `std_fee_details` (`fee_id`, `std_id`, `admission_fee`, `addmission_fee_discount`, `net_addmission_fee`, `monthly_fee`, `monthly_fee_discount`, `net_monthly_fee`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 8, 1000, 200, 800, 1500, 100, 1400, '2018-11-06 08:20:42', '0000-00-00 00:00:00', 1, 0),
(2, 9, 1000, 300, 700, 1500, 500, 1000, '2018-11-06 08:21:45', '0000-00-00 00:00:00', 1, 0),
(3, 1, 1000, 100, 900, 1500, 100, 1400, '2018-12-04 18:01:23', '0000-00-00 00:00:00', 0, 0),
(4, 2, 1000, 200, 800, 2000, 200, 1800, '2018-12-04 18:45:25', '0000-00-00 00:00:00', 0, 0),
(5, 3, 1500, 300, 1200, 2000, 300, 1700, '2018-12-04 18:47:45', '0000-00-00 00:00:00', 0, 0),
(6, 4, 1500, 400, 1100, 2000, 400, 1600, '2018-12-04 18:48:37', '0000-00-00 00:00:00', 0, 0),
(7, 5, 1200, 200, 1000, 1500, 300, 1200, '2018-12-04 18:50:06', '0000-00-00 00:00:00', 0, 0),
(8, 6, 1200, 100, 1100, 1500, 200, 1300, '2018-12-04 18:50:55', '0000-00-00 00:00:00', 0, 0),
(9, 7, 1000, 100, 900, 1600, 200, 1400, '2018-12-04 18:51:46', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_guardian_info`
--

CREATE TABLE `std_guardian_info` (
  `std_guardian_info_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `father_cnic` varchar(15) NOT NULL,
  `father_email` varchar(84) NOT NULL,
  `guardian_contact_no_1` varchar(15) NOT NULL,
  `guardian_contact_no_2` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_guardian_info`
--

INSERT INTO `std_guardian_info` (`std_guardian_info_id`, `std_id`, `father_name`, `father_cnic`, `father_email`, `guardian_contact_no_1`, `guardian_contact_no_2`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'G Mustafa', '12345-6789123-4', 'abu@gmail.com', '+12-345-6789123', '+12-345-6789123', '2018-10-10 14:32:56', '0000-00-00 00:00:00', 1, 0),
(2, 2, 'Iftkhar', '12345-6789123-4', 'abu@gmail.com', '+12-345-6789123', '+12-345-6789123', '2018-10-10 14:33:37', '0000-00-00 00:00:00', 1, 0),
(3, 3, 'dfghj', '12345-6787545-6', 'dfghjkjhg@.com', '+34-567-8823456', '+34-567-8987456', '2018-10-27 08:14:43', '0000-00-00 00:00:00', 1, 0),
(4, 9, 'Naveed Anjum', '12345-6789098-7', '', '+34-567-8909876', '', '2018-11-03 05:53:46', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_personal_info`
--

CREATE TABLE `std_personal_info` (
  `std_id` int(11) NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_father_name` varchar(50) NOT NULL,
  `std_contact_no` varchar(15) NOT NULL,
  `std_DOB` date NOT NULL,
  `std_gender` enum('Male','Female') NOT NULL,
  `std_permanent_address` varchar(255) NOT NULL,
  `std_temporary_address` varchar(255) NOT NULL,
  `std_email` varchar(84) NOT NULL,
  `std_photo` varchar(200) NOT NULL,
  `std_b_form` varchar(255) NOT NULL,
  `std_district` varchar(50) NOT NULL,
  `std_religion` varchar(50) NOT NULL,
  `std_nationality` varchar(50) NOT NULL,
  `std_tehseel` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_personal_info`
--

INSERT INTO `std_personal_info` (`std_id`, `std_name`, `std_father_name`, `std_contact_no`, `std_DOB`, `std_gender`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Kinza', 'Mustafa Ali', '+12-345-6789098', '0000-00-00', 'Female', 'RYK', 'RYK', 'kinza@gmail.com', '', '12345-1234567-1', 'RYK', 'Islam', 'Pakistani', 'RYK', '2018-11-07 07:34:30', '2018-11-07 07:34:30', 1, 1),
(2, 'Nadia', 'Iftikhar Ali', '+12-345-6789009', '2018-10-29', 'Female', 'RYK', 'RYK', 'nadia@gmail.com', '', '12345-6789123-4', 'RYK', 'RYK', 'Pakistan', 'Islam', '2018-11-05 16:48:57', '2018-11-05 16:48:57', 1, 1),
(3, 'Noman', 'Shahid', '+12-345-6789123', '2018-10-10', 'Male', 'RYK', 'RYK', 'nomi@gmail.com', '', '12345-6789123-4', 'RYK', 'Islam', 'Pakistani', 'RYK', '2018-11-05 16:52:56', '2018-11-05 16:52:56', 1, 1),
(4, 'Ali', '', '+56-234-6789098', '2018-10-27', 'Male', 'seuh', 'hggyu', 'hiuuhi', '', '23456-7890987-6', 'jbjbj', 'knk', 'jjj', 'jhjh', '2018-10-27 08:21:09', '0000-00-00 00:00:00', 1, 0),
(5, 'Hamza', '', '+35-678-9009876', '2018-10-27', 'Male', 'tghjk', 'lkokjo', '4567kpok', 'uploads/Hamza_photo.jpg', '23678-7654345-6', 'dfhjk', 'jojoj', 'jjoijho', 'hukhukhk', '2018-11-01 06:49:57', '2018-11-01 06:49:57', 1, 1),
(6, 'Qasim', '', '+38-909-8765445', '2018-10-27', 'Male', 'dtrjhhi iyhiuh ', 'huihuii uihui', 'hiuhuihuiu', '', '23678-8765434-5', 'vhg ghjhl ', 'u uiuigug ', 'gyugfu gyuguilui ', 'yuyugul gygyugul ', '2018-10-27 08:22:15', '0000-00-00 00:00:00', 1, 0),
(7, 'Anas Shafqat', '', '+92-331-7375027', '2018-10-27', 'Male', 'Gulshan Iqbal, Rahim Yar Khan', 'Gulshan Iqbal, Rahim Yar Khan', 'ihuih ', 'uploads/Anas Shafqat_photo.jpg', '23467-8987655-6', 'drtyu ', 'yhiopjh iuhui ', 'rtyuijhh ', 'tyguhjioog', '2018-11-01 06:48:42', '2018-11-01 06:48:42', 1, 1),
(8, 'Zia Ali', 'Ali Ahmed', '+12-345-6789098', '2009-06-09', 'Male', 'Gulshan Iqbal, Rahim Yar Khan', 'Gulshan Iqbal, Rahim Yar Khan', 'zia@gmail.com', 'uploads/Zia Ali_photo.jpg', '12345-6789876-5', 'Rahim Yar Khan', 'Islam', 'Pakistani', 'Rahim Yar Khan', '2018-11-05 16:42:39', '2018-11-05 16:42:39', 1, 1),
(9, 'Ali Naveed', 'Naveed Anjum', '+12-345-6789098', '2018-11-03', 'Male', 'mnhgbfdsfvbghgfd', '', 'sdfghjkllkjhgvc', 'uploads/Ali Naveed_photo.jpg', '23456-7890987-6', 'RYK', 'Islam', 'Pakistani', 'RKY', '2018-11-03 05:53:46', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_sections`
--

CREATE TABLE `std_sections` (
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `section_intake` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_sections`
--

INSERT INTO `std_sections` (`section_id`, `session_id`, `section_name`, `section_intake`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 2, 'Pink', 25, '2018-12-03 14:59:12', '0000-00-00 00:00:00', 1, 0),
(2, 2, 'Green', 30, '2018-12-03 14:59:37', '0000-00-00 00:00:00', 1, 0),
(3, 2, 'Blue', 25, '2018-12-03 15:00:00', '0000-00-00 00:00:00', 1, 0),
(4, 1, 'Pink', 25, '2018-12-03 15:00:26', '0000-00-00 00:00:00', 1, 0),
(5, 1, 'Green', 30, '2018-12-03 15:00:47', '0000-00-00 00:00:00', 1, 0),
(6, 1, 'Blue', 30, '2018-12-03 15:01:13', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_sessions`
--

CREATE TABLE `std_sessions` (
  `session_id` int(11) NOT NULL,
  `session_branch_id` int(11) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `session_start_date` date NOT NULL,
  `session_end_date` date NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_sessions`
--

INSERT INTO `std_sessions` (`session_id`, `session_branch_id`, `session_name`, `session_start_date`, `session_end_date`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, '2015-2016', '2015-01-01', '2016-01-01', 'Active', '2018-12-03 14:58:04', '2018-12-03 14:58:04', 1, 1),
(2, 2, '2016-2017', '2016-01-01', '2017-01-01', 'Active', '2018-12-03 14:58:33', '2018-12-03 14:58:33', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Maths', '2018-10-27 16:25:24', '0000-00-00 00:00:00', 0, 0),
(2, 'English-A', '2018-12-03 15:02:31', '0000-00-00 00:00:00', 0, 0),
(3, 'Urdu-A', '2018-12-03 15:02:48', '0000-00-00 00:00:00', 0, 0),
(4, 'Physics', '2018-10-27 16:26:14', '0000-00-00 00:00:00', 0, 0),
(5, 'Biology', '2018-11-05 17:32:33', '0000-00-00 00:00:00', 0, 0),
(6, 'Islamiyat', '2018-12-03 15:01:55', '0000-00-00 00:00:00', 0, 0),
(7, 'Computer', '2018-12-03 15:02:12', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_assign_detail`
--

CREATE TABLE `teacher_subject_assign_detail` (
  `teacher_subject_assign_detail_id` int(11) NOT NULL,
  `teacher_subject_assign_detail_head_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_subject_assign_detail`
--

INSERT INTO `teacher_subject_assign_detail` (`teacher_subject_assign_detail_id`, `teacher_subject_assign_detail_head_id`, `class_id`, `subject_id`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 2, 2, '2018-12-03 15:24:47', '0000-00-00 00:00:00', 1, 0),
(2, 1, 4, 2, '2018-12-03 15:24:47', '0000-00-00 00:00:00', 1, 0),
(3, 2, 1, 7, '2018-12-03 15:25:14', '0000-00-00 00:00:00', 1, 0),
(4, 2, 2, 7, '2018-12-03 15:25:14', '0000-00-00 00:00:00', 1, 0),
(5, 2, 3, 7, '2018-12-03 15:25:14', '0000-00-00 00:00:00', 1, 0),
(6, 2, 4, 7, '2018-12-03 15:25:15', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_assign_head`
--

CREATE TABLE `teacher_subject_assign_head` (
  `teacher_subject_assign_head_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `teacher_subject_assign_head_name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_subject_assign_head`
--

INSERT INTO `teacher_subject_assign_head` (`teacher_subject_assign_head_id`, `teacher_id`, `teacher_subject_assign_head_name`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'Shoiab Nawaz', '2018-12-03 15:24:47', '0000-00-00 00:00:00', 1, 0),
(2, 2, 'Nadia', '2018-12-03 15:25:14', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'sbuQbFqUQaaweB1Z-0Uj9pX4l1O3AMSu', '$2y$13$uKEhJ4s7pPEeZzYnZeEwYOyTYJCpQhSm.NKSgkeJcpWFBe0iqnu6a', NULL, 'admin@dexdevs.com', 10, 1538846711, 1538846711);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `institute_id` (`institute_id`);

--
-- Indexes for table `emp_designation`
--
ALTER TABLE `emp_designation`
  ADD PRIMARY KEY (`emp_designation_id`);

--
-- Indexes for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_designation_id` (`emp_designation_id`);

--
-- Indexes for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  ADD PRIMARY KEY (`fee_trans_detail_id`),
  ADD KEY `fee_trans_detail_head_id` (`fee_trans_detail_head_id`),
  ADD KEY `fee_type_id` (`fee_type_id`);

--
-- Indexes for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  ADD PRIMARY KEY (`fee_trans_id`),
  ADD KEY `std_class_id` (`std_class_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `month_id` (`month`);

--
-- Indexes for table `fee_type`
--
ALTER TABLE `fee_type`
  ADD PRIMARY KEY (`fee_type_id`);

--
-- Indexes for table `institute`
--
ALTER TABLE `institute`
  ADD PRIMARY KEY (`institute_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  ADD PRIMARY KEY (`academic_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `class_name_id` (`class_name_id`);

--
-- Indexes for table `std_class`
--
ALTER TABLE `std_class`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `std_class_name`
--
ALTER TABLE `std_class_name`
  ADD PRIMARY KEY (`class_name_id`);

--
-- Indexes for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  ADD PRIMARY KEY (`std_enroll_detail_id`),
  ADD KEY `std_enroll_detail_head_id` (`std_enroll_detail_head_id`),
  ADD KEY `std_enroll_detail_std_id` (`std_enroll_detail_std_id`);

--
-- Indexes for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  ADD PRIMARY KEY (`std_enroll_head_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  ADD PRIMARY KEY (`std_guardian_info_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  ADD PRIMARY KEY (`std_id`);

--
-- Indexes for table `std_sections`
--
ALTER TABLE `std_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `std_sessions`
--
ALTER TABLE `std_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `session_branch_id` (`session_branch_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  ADD PRIMARY KEY (`teacher_subject_assign_detail_id`),
  ADD KEY `teacher_subject_assign_detail_head_id` (`teacher_subject_assign_detail_head_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  ADD PRIMARY KEY (`teacher_subject_assign_head_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emp_designation`
--
ALTER TABLE `emp_designation`
  MODIFY `emp_designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emp_info`
--
ALTER TABLE `emp_info`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  MODIFY `fee_trans_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  MODIFY `fee_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fee_type`
--
ALTER TABLE `fee_type`
  MODIFY `fee_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `institute`
--
ALTER TABLE `institute`
  MODIFY `institute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  MODIFY `academic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `std_class`
--
ALTER TABLE `std_class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `std_class_name`
--
ALTER TABLE `std_class_name`
  MODIFY `class_name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  MODIFY `std_enroll_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  MODIFY `std_enroll_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  MODIFY `std_guardian_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `std_sections`
--
ALTER TABLE `std_sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `std_sessions`
--
ALTER TABLE `std_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  MODIFY `teacher_subject_assign_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  MODIFY `teacher_subject_assign_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`institute_id`);

--
-- Constraints for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD CONSTRAINT `emp_info_ibfk_1` FOREIGN KEY (`emp_designation_id`) REFERENCES `emp_designation` (`emp_designation_id`);

--
-- Constraints for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  ADD CONSTRAINT `fee_transaction_detail_ibfk_1` FOREIGN KEY (`fee_trans_detail_head_id`) REFERENCES `fee_transaction_head` (`fee_trans_id`),
  ADD CONSTRAINT `fee_transaction_detail_ibfk_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_type` (`fee_type_id`);

--
-- Constraints for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  ADD CONSTRAINT `fee_transaction_head_ibfk_2` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_3` FOREIGN KEY (`std_class_id`) REFERENCES `std_class` (`class_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_4` FOREIGN KEY (`month`) REFERENCES `month` (`month_id`);

--
-- Constraints for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  ADD CONSTRAINT `std_academic_info_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_academic_info_ibfk_2` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `std_class`
--
ALTER TABLE `std_class`
  ADD CONSTRAINT `std_class_ibfk_1` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_class_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_class_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`);

--
-- Constraints for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  ADD CONSTRAINT `std_enrollment_detail_ibfk_2` FOREIGN KEY (`std_enroll_detail_std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_enrollment_detail_ibfk_3` FOREIGN KEY (`std_enroll_detail_head_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`);

--
-- Constraints for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  ADD CONSTRAINT `std_enrollment_head_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_class` (`class_id`);

--
-- Constraints for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  ADD CONSTRAINT `std_fee_details_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  ADD CONSTRAINT `std_guardian_info_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_sections`
--
ALTER TABLE `std_sections`
  ADD CONSTRAINT `std_sections_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`);

--
-- Constraints for table `std_sessions`
--
ALTER TABLE `std_sessions`
  ADD CONSTRAINT `std_sessions_ibfk_1` FOREIGN KEY (`session_branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_4` FOREIGN KEY (`teacher_subject_assign_detail_head_id`) REFERENCES `teacher_subject_assign_head` (`teacher_subject_assign_head_id`),
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_5` FOREIGN KEY (`class_id`) REFERENCES `std_class` (`class_id`);

--
-- Constraints for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  ADD CONSTRAINT `teacher_subject_assign_head_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `emp_info` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
