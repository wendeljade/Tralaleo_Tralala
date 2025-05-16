-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2025 at 06:36 AM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(36) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` bigint(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `special_requests` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `book_id`, `first_name`, `last_name`, `email`, `contact`, `address`, `city`, `country`, `special_requests`, `date`) VALUES
(4, '0772a87c46', 'Ako', 'Sayang', 'akosayang@yahoo.com', 9123456789, 'Karakalpakstan', 'Sovetakan', 'philippines', 'Dapat naay gold', '2025-05-15 23:52:34'),
(5, '33d7af3c71', 'Ako', 'Sayang', 'akosayang@yahoo.com', 9123456789, 'Karakalpakstan', 'Sovetakan', 'philippines', 'Dapat naay gold', '2025-05-15 23:53:34'),
(6, 'd4437b56a7', 'Ako', 'Sayang', 'akosayang@yahoo.com', 9123456789, 'Karakalpakstan', 'Sovetakan', 'philippines', 'Dapat naay gold', '2025-05-15 23:55:11'),
(7, '8fdd191b04', 'Ako', 'Sayang', 'akosayang@yahoo.com', 9123456789, 'Karakalpakstan', 'Sovetakan', 'philippines', 'Dapat naay gold', '2025-05-15 23:56:14'),
(8, '5718df3675', 'Ako', 'Sayang', 'akosayang@yahoo.com', 9123456789, 'Karakalpakstan', 'Sovetakan', 'philippines', 'Dapat naay gold', '2025-05-15 23:57:15'),
(9, 'cc6c81ebd9', 'Ako', 'Sayang', 'akosayang@yahoo.com', 9123456789, 'Karakalpakstan', 'Sovetakan', 'philippines', 'Dapat naay gold', '2025-05-16 00:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `occupied`
--

DROP TABLE IF EXISTS `occupied`;
CREATE TABLE IF NOT EXISTS `occupied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(36) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `occupied`
--

INSERT INTO `occupied` (`id`, `book_id`, `room_id`, `status`, `check_in`, `check_out`) VALUES
(2, 'cc6c81ebd9', 2, 1, '2025-05-16', '2025-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `number_of_beds` int(11) NOT NULL,
  `bed_capacity` int(11) NOT NULL,
  `bed_size` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `type`, `number_of_beds`, `bed_capacity`, `bed_size`, `price`, `description`, `image`) VALUES
(1, 'Room 5', '2 Pax Tariff', 1, 2, 22.00, 550.00, 'Walay laba ang habol', ''),
(2, 'Room 1', 'Single Executive', 1, 1, 100.00, 150.00, 'Gahi ang habol', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `occupied`
--
ALTER TABLE `occupied`
  ADD CONSTRAINT `occupied_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `occupied_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `bookings` (`book_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
