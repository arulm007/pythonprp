-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 04:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `currency_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` int(11) NOT NULL,
  `base_currency` varchar(10) DEFAULT NULL,
  `target_currency` varchar(10) DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exchange_rates`
--

INSERT INTO `exchange_rates` (`id`, `base_currency`, `target_currency`, `exchange_rate`, `last_updated`) VALUES
(1, 'USD', 'INR', 82.5, '2025-03-17 15:38:38'),
(2, 'USD', 'EUR', 0.92, '2025-03-17 15:35:59'),
(3, 'USD', 'GBP', 0.78, '2025-03-17 15:35:59'),
(4, 'USD', 'JPY', 149.2, '2025-03-17 15:35:59'),
(5, 'USD', 'AUD', 1.55, '2025-03-17 15:35:59'),
(6, 'USD', 'CAD', 1.34, '2025-03-17 15:35:59'),
(7, 'USD', 'CNY', 7.15, '2025-03-17 15:35:59'),
(8, 'USD', 'SGD', 1.35, '2025-03-17 15:35:59'),
(9, 'EUR', 'INR', 90.3, '2025-03-17 15:35:59'),
(10, 'EUR', 'USD', 1.09, '2025-03-17 15:35:59'),
(11, 'EUR', 'GBP', 0.85, '2025-03-17 15:35:59'),
(12, 'EUR', 'JPY', 160.4, '2025-03-17 15:35:59'),
(13, 'EUR', 'AUD', 1.68, '2025-03-17 15:35:59'),
(14, 'EUR', 'CAD', 1.45, '2025-03-17 15:35:59'),
(15, 'GBP', 'INR', 105.2, '2025-03-17 15:35:59'),
(16, 'GBP', 'USD', 1.28, '2025-03-17 15:35:59'),
(17, 'GBP', 'EUR', 1.18, '2025-03-17 15:35:59'),
(18, 'GBP', 'JPY', 185.75, '2025-03-17 15:35:59'),
(19, 'GBP', 'AUD', 1.95, '2025-03-17 15:35:59'),
(20, 'INR', 'USD', 0.012, '2025-03-17 15:35:59'),
(21, 'INR', 'EUR', 0.011, '2025-03-17 15:35:59'),
(22, 'INR', 'GBP', 0.0095, '2025-03-17 15:35:59'),
(23, 'INR', 'JPY', 1.8, '2025-03-17 15:35:59'),
(24, 'INR', 'AUD', 0.018, '2025-03-17 15:35:59'),
(25, 'INR', 'CAD', 0.016, '2025-03-17 15:35:59'),
(26, 'JPY', 'USD', 0.0067, '2025-03-17 15:35:59'),
(27, 'JPY', 'EUR', 0.0062, '2025-03-17 15:35:59'),
(28, 'JPY', 'GBP', 0.0054, '2025-03-17 15:35:59'),
(29, 'JPY', 'INR', 0.56, '2025-03-17 15:35:59'),
(30, 'JPY', 'AUD', 0.0093, '2025-03-17 15:35:59'),
(31, 'AUD', 'USD', 0.65, '2025-03-17 15:35:59'),
(32, 'AUD', 'EUR', 0.6, '2025-03-17 15:35:59'),
(33, 'AUD', 'GBP', 0.51, '2025-03-17 15:35:59'),
(34, 'AUD', 'INR', 55.3, '2025-03-17 15:35:59'),
(35, 'AUD', 'JPY', 107.5, '2025-03-17 15:35:59'),
(36, 'CAD', 'USD', 0.75, '2025-03-17 15:35:59'),
(37, 'CAD', 'EUR', 0.69, '2025-03-17 15:35:59'),
(38, 'CAD', 'GBP', 0.59, '2025-03-17 15:35:59'),
(39, 'CAD', 'INR', 61.4, '2025-03-17 15:35:59'),
(40, 'SGD', 'USD', 0.74, '2025-03-17 15:35:59'),
(41, 'SGD', 'INR', 60.25, '2025-03-17 15:35:59'),
(42, 'SGD', 'EUR', 0.68, '2025-03-17 15:35:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
