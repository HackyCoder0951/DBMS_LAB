-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 14, 2024 at 11:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vitc`
--

-- --------------------------------------------------------

--
-- Table structure for table `empdetails`
--

CREATE TABLE `empdetails` (
  `sr_no` int(12) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(150) NOT NULL,
  `emp_des` varchar(150) NOT NULL,
  `emp_mobile` int(15) NOT NULL,
  `emp_dept` varchar(100) NOT NULL,
  `emp_location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empdetails`
--

INSERT INTO `empdetails` (`sr_no`, `emp_id`, `emp_name`, `emp_des`, `emp_mobile`, `emp_dept`, `emp_location`) VALUES
(1, 2021, 'kishan lal', 'Sr. Dev', 1231231234, 'Devlopment', 'udaipur'),
(2, 2022, 'shiv kumar', 'Jr. Dev', 2123432242, 'Devlopment', 'bassi'),
(3, 2023, 'vishnu kumar', 'DevOps Er.', 2147483647, 'Devlopment', 'bhilwara'),
(4, 2024, 'prakash jat', 'Cloud Er.', 2147483647, 'Devlopment', 'jaipur'),
(5, 2025, 'satish kumar', 'Accountant', 2147483647, 'Finance', 'rajsamand'),
(6, 2026, 'gopal krishna', 'Sys Admin', 2147483647, 'Administration', 'kapasan');

-- --------------------------------------------------------

--
-- Table structure for table `empsalary`
--

CREATE TABLE `empsalary` (
  `sr_no` int(12) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_dept` varchar(150) NOT NULL,
  `emp_sal` varchar(150) NOT NULL,
  `emp_payscale` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empsalary`
--

INSERT INTO `empsalary` (`sr_no`, `emp_id`, `emp_dept`, `emp_sal`, `emp_payscale`) VALUES
(1, 2021, 'Devlopment', '75000', '6th'),
(2, 2022, 'Devlopment', '4000', '4th'),
(3, 2023, 'Devlopment', '85000', '6th'),
(4, 2024, 'Devlopment', '64500', '6th'),
(5, 2025, 'Finance', '46500', '5th'),
(6, 2026, 'Administration', '72500', '7th');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empdetails`
--
ALTER TABLE `empdetails`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `empsalary`
--
ALTER TABLE `empsalary`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `emp_id` (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empdetails`
--
ALTER TABLE `empdetails`
  MODIFY `sr_no` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `empsalary`
--
ALTER TABLE `empsalary`
  MODIFY `sr_no` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empsalary`
--
ALTER TABLE `empsalary`
  ADD CONSTRAINT `pk_empID` FOREIGN KEY (`emp_id`) REFERENCES `empdetails` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
