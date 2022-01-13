-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 07, 2021 at 01:09 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_update_at` datetime NOT NULL,
  `category_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_created_at`, `category_update_at`, `category_status`) VALUES
(1, 'Elektronik', '2020-12-08 10:27:24', '0000-00-00 00:00:00', 1),
(2, 'Alat Rumah Tangga', '2020-12-08 10:27:24', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_updated_at` datetime NOT NULL,
  `product_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_image`, `product_created_at`, `product_updated_at`, `product_status`) VALUES
(1, 2, 'Kipas', 150000, '', '2020-12-08 10:17:25', '2020-12-23 07:39:49', 1),
(2, 1, 'Kursi', 50000, '', '2020-12-09 07:59:44', '0000-00-00 00:00:00', 1),
(3, 2, 'Kipas', 150000, '', '2020-12-09 08:06:54', '2020-12-09 09:47:10', 1),
(4, 1, 'Kursi', 50000, '', '2020-12-09 08:42:16', '0000-00-00 00:00:00', 1),
(5, 1, 'Kursi', 0, '', '2020-12-09 08:53:43', '0000-00-00 00:00:00', 1),
(6, 1, 'Kursi', 0, '', '2020-12-09 08:54:14', '0000-00-00 00:00:00', 1),
(7, 1, 'Kursi', 50000, '', '2020-12-09 08:54:28', '0000-00-00 00:00:00', 1),
(8, 1, 'Kursi', 0, '', '2020-12-09 08:59:36', '0000-00-00 00:00:00', 1),
(9, 1, 'Kursi', 50000, '', '2020-12-11 10:23:05', '0000-00-00 00:00:00', 1),
(10, 1, 'Kipas', 50000, '', '2020-12-16 04:25:08', '0000-00-00 00:00:00', 0),
(11, 1, 'Galon', 100000, '', '2020-12-16 04:39:08', '0000-00-00 00:00:00', 1),
(12, 1, 'Mouse', 5000, '', '2020-12-16 04:49:42', '0000-00-00 00:00:00', 1),
(13, 1, 'Kursi', 50000, '', '2020-12-16 04:52:50', '0000-00-00 00:00:00', 1),
(14, 1, 'Kulkas', 20000000, '2021-01-05T09-03-23.298Z1328151_1.jpg', '2021-01-05 09:03:23', '0000-00-00 00:00:00', 1),
(15, 1, 'buah', 5000, '2021-01-06T01-41-53.013ZAstronaut.jpeg', '2021-01-06 01:41:53', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `skill_name` varchar(150) NOT NULL,
  `skill_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skill_id`, `user_id`, `skill_name`, `skill_created_at`) VALUES
(1, 1, 'mewarnai', '2021-01-17 10:55:34'),
(2, 1, 'membaca', '2021-01-17 10:55:34'),
(4, 2, 'mengaji', '2021-01-17 10:56:32'),
(5, 2, 'menulis', '2021-01-17 10:56:32'),
(6, 2, 'membaca', '2021-01-17 10:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_keys` varchar(5) NOT NULL,
  `user_total_skill` int(11) NOT NULL,
  `user_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_keys`, `user_total_skill`, `user_created_at`, `user_updated_at`) VALUES
(1, 'Bagus Tri Harjanto', 'bagustri15@gmail.com', '$2b$10$b/FyTruLFJgsl3K01G2X8u0fq1OqIjwfJ/zfzqR5TIJm2sw1ZbuBO', '', 0, '2020-12-22 07:49:04', '0000-00-00 00:00:00'),
(2, 'Satria', 'satria@gmail.com', '123', '', 0, '2021-01-17 10:55:56', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
