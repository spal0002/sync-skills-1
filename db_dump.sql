-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 30, 2018 at 08:52 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sync_skills`
--

-- --------------------------------------------------------

--
-- Table structure for table `skill_category`
--

CREATE TABLE `skill_category` (
  `category_id` int(12) NOT NULL,
  `category_name` varchar(120) NOT NULL,
  `domain_id` int(12) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill_category`
--

INSERT INTO `skill_category` (`category_id`, `category_name`, `domain_id`, `status`, `modified_on`) VALUES
(1, 'Programming Languages', 5, 1, '2017-12-27 07:38:59'),
(2, 'Workflow', 3, 1, '2018-08-27 11:33:17'),
(3, 'Framework', 3, 1, '2017-07-04 06:15:21'),
(4, 'JMS', 4, 1, '2017-07-04 06:16:09'),
(5, 'Cache', 5, 1, '2017-07-04 06:17:47'),
(6, 'Database', 6, 1, '2017-07-04 06:18:33'),
(7, 'Virtualization', 3, 1, '2017-07-05 05:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `skill_domain`
--

CREATE TABLE `skill_domain` (
  `domain_id` int(12) NOT NULL,
  `domain_name` varchar(64) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill_domain`
--

INSERT INTO `skill_domain` (`domain_id`, `domain_name`, `status`, `modified_on`) VALUES
(1, 'Personal Cloud', 1, '2017-07-04 00:43:51'),
(2, 'Big Data & Analytics', 1, '2017-07-04 00:44:53'),
(3, 'Enterprise', 1, '2018-08-27 06:03:16'),
(4, 'Messaging', 1, '2017-07-04 00:46:09'),
(5, 'Cloud Automation (Activation)', 1, '2017-12-27 02:08:59'),
(6, 'Deal Space', 1, '2017-07-04 00:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `skill_type`
--

CREATE TABLE `skill_type` (
  `skill_id` int(12) NOT NULL,
  `skill_name` text NOT NULL,
  `category_id` int(12) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill_type`
--

INSERT INTO `skill_type` (`skill_id`, `skill_name`, `category_id`, `status`, `modified_on`) VALUES
(1, 'Java', 1, 1, '2017-07-04 06:13:51'),
(2, 'BPM', 2, 1, '2017-07-04 06:14:53'),
(3, 'Spring', 3, 1, '2017-07-04 06:15:21'),
(4, 'Rabbit MQ', 4, 1, '2017-07-04 06:16:09'),
(5, 'EhCache', 5, 1, '2017-07-04 06:17:47'),
(6, 'Oracle', 6, 1, '2017-07-04 06:18:33'),
(7, 'VMware', 7, 1, '2017-07-05 05:09:40'),
(8, 'acadc', 1, 1, '2017-12-27 07:38:59'),
(9, 'new', 2, 1, '2018-08-27 11:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `sync_employees`
--

CREATE TABLE `sync_employees` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `reporting_to` varchar(50) DEFAULT NULL,
  `tech_domain` varchar(120) DEFAULT NULL,
  `tech_category` varchar(120) DEFAULT NULL,
  `skill_set` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sync_employees`
--

INSERT INTO `sync_employees` (`id`, `emp_id`, `emp_name`, `email`, `designation`, `reporting_to`, `tech_domain`, `tech_category`, `skill_set`, `status`, `modified_date`) VALUES
(1, '1234', 'sree', 'sree.sp1r@gmail.comq', 'sr adfsd', 'sham0002', 'Personal Cloud, Big Data & Analytics', 'Programming Languages, Workflow', 'Java, acadc', 1, '2018-08-28 01:43:29'),
(4, '12345', 'sree', 'sree.sp12@gmail.com', 'sr adfsd', 'sham0002', 'Personal Cloud, Big Data & Analytics', 'Programming Languages, Workflow', 'Java, acadc', 1, '2018-08-28 01:43:29'),
(2, '1669', 'sree', 'srinivas.plvl@gmail.com', 'software Engineer', 'arar0001', 'Personal Cloud, Enterprise', 'Workflow, Programming Languages', 'BPM, new', 1, '2018-08-28 01:43:29'),
(5, '16691', 'sree', 'sree.spr@gmail.com11', 'software Engineer', 'arar0001', 'Personal Cloud, Enterprise', 'Workflow, Programming Languages', 'BPM, new', 1, '2018-08-28 01:43:29'),
(3, '232', 'fsdfsdf', 'sdfsd@afwqe.com', 'wfwq', 'sham0002', 'Personal Cloud', 'Workflow', 'BPM', 1, '2018-08-28 01:43:29'),
(6, '2321', 'fsdfsdf', 'sdfsd@afwqe.com11', 'wfwq', 'sham0002', 'Personal Cloud', 'Workflow', 'BPM', 1, '2018-08-28 01:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `sync_users`
--

CREATE TABLE `sync_users` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `login_type` varchar(24) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `modified_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sync_users`
--

INSERT INTO `sync_users` (`id`, `emp_id`, `emp_name`, `user_name`, `password`, `email`, `designation`, `login_type`, `status`, `modified_date`) VALUES
(2, ' sham0002', 'Shivaprasada A.M', ' sham0002', 'advadvd', 'sham0002@synchronoss.com', 'Asst. QA Manager, TESTING', '3', 1, '2017-07-05'),
(1, '1669', 'srinivas palivela', 'spal0002', '12121', 'spal0002@synchronoss.com', 'Software Enginner', '1', 1, '2017-07-04'),
(6, '1754', 'sree', 'spal0002', 'x2iLNK', 'sree.spr@gmail.com', 'Sr Software Engineer', '3', 0, '2018-08-27'),
(5, '4101', 'Vandana R Arbatti', 'vandanar', '11111', 'vandanar@synchronoss.com', 'Sr. Manager, ADMIN', '1', 1, '2017-07-05'),
(4, 'arar0001', 'Aravind R Rao', 'arar0001', 'advadvd', 'arar0001@synchronoss.com', 'Principal Software Engineer, DEVELOPMENT', '2', 1, '2017-07-05'),
(3, 'knai0001', 'Karthick Nair', 'knai0001', '33333', 'knai0001@synchronoss.com', 'Principal Software Engineer, DEVELOPMENT', '3', 1, '2017-07-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `skill_category`
--
ALTER TABLE `skill_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `skill_domain`
--
ALTER TABLE `skill_domain`
  ADD PRIMARY KEY (`domain_id`),
  ADD UNIQUE KEY `id` (`domain_id`);

--
-- Indexes for table `skill_type`
--
ALTER TABLE `skill_type`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `sync_employees`
--
ALTER TABLE `sync_employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `sync_users`
--
ALTER TABLE `sync_users`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `skill_category`
--
ALTER TABLE `skill_category`
  MODIFY `category_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `skill_domain`
--
ALTER TABLE `skill_domain`
  MODIFY `domain_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `skill_type`
--
ALTER TABLE `skill_type`
  MODIFY `skill_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sync_employees`
--
ALTER TABLE `sync_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sync_users`
--
ALTER TABLE `sync_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
