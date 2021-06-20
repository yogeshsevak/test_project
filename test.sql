-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2021 at 10:12 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

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
-- Table structure for table `company_category`
--

CREATE TABLE `company_category` (
  `id` int(11) NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_category`
--

INSERT INTO `company_category` (`id`, `company_name`, `category`) VALUES
(1, 'Test Company A', 3030),
(2, 'Test Company B', 3020),
(3, 'Test Company C', 3010),
(5, 'Test Company D', 3040),
(6, 'Test Company E', 3031),
(7, 'Test Company F', 3021),
(8, 'Test Company G', 3050);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `part_number` varchar(250) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `part_number`, `name`, `description`, `qty`) VALUES
(1, '000102', 'AAAAA', 'AAAAA', 3),
(2, '000200', 'BBBBB', 'BBBBB', 4),
(3, '000220', 'CCCCC', 'CCCCC', 5),
(4, '000500', 'DDDD', 'DDDD', 6),
(5, '000610', 'EEEEE', 'EEEEE', 7),
(6, '000660', 'FFFFF', 'FFFFF', 8),
(7, '000700', 'GGGGG', 'GGGGG', 9),
(8, '000900', 'HHHHH', 'HHHHH', 10),
(9, '001000', 'IIIIIII', 'IIIIIII', 11),
(10, '001020', 'JJJJJJJ', 'JJJJJJJ', 12),
(11, '001040', 'KKKKK', 'KKKKK', 13),
(12, '001120', 'LLLLLL', 'LLLLLL', 14),
(13, '001130', 'MMMMM', 'MMMMM', 15),
(14, '001400', 'NNNNN', 'NNNNN', 16),
(15, '001410', 'OOOOO', 'OOOOO', 17),
(16, '001440', 'PPPPP', 'PPPPP', 18);

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `user_id`, `product_price`) VALUES
(1, 1, 1, 35.0004),
(2, 1, 2, 36),
(3, 1, 3, 38.9995),
(4, 2, 1, 32.0004),
(5, 2, 2, 36),
(6, 2, 3, 38.9995),
(7, 3, 1, 32.0004),
(8, 3, 2, 36),
(9, 3, 3, 38.9995),
(10, 4, 1, 32.0004),
(11, 4, 2, 36),
(12, 4, 3, 38.9995),
(13, 5, 1, 32.0004),
(14, 5, 2, 36),
(15, 5, 3, 38.9995),
(16, 6, 1, 32.0004),
(17, 6, 2, 36),
(18, 6, 3, 38.9995),
(19, 7, 1, 32.0004),
(20, 7, 2, 36),
(21, 7, 3, 38.9995),
(22, 8, 1, 32.0004),
(23, 8, 2, 36),
(24, 8, 3, 38.9995),
(25, 9, 1, 32.0004),
(26, 9, 2, 36),
(27, 9, 3, 38.9995),
(28, 10, 1, 46.0032),
(29, 10, 2, 48.9984),
(30, 10, 3, 52.0032),
(31, 11, 1, 32.0004),
(32, 11, 2, 36),
(33, 11, 3, 38.9995),
(34, 12, 1, 32.0004),
(35, 12, 2, 36),
(36, 12, 3, 38.9995),
(37, 13, 1, 32.0004),
(38, 13, 2, 36),
(39, 13, 3, 38.9995),
(40, 14, 1, 32.0004),
(41, 14, 2, 36),
(42, 14, 3, 38.9995),
(43, 15, 1, 32.0004),
(44, 15, 2, 36),
(45, 15, 3, 38.9995),
(46, 16, 1, 46.0032),
(47, 16, 2, 48.9984),
(48, 16, 3, 52.0032);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL,
  `company_name` int(10) NOT NULL,
  `address` text NOT NULL,
  `state` varchar(200) NOT NULL,
  `Zip` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `company_name`, `address`, `state`, `Zip`) VALUES
(1, 'Yogesh 1', 'Yogesh1@gmail.com', '2980813dd01b87b184c92674c3b89d7d', 1, 'Test 1', 'Test 1', 543216),
(2, 'Yogesh 2', 'Yogesh2@gmail.com', '71b7286742182b766da484eeb1f991b8', 2, 'Test 2', 'Test 2', 453445),
(3, 'Yogesh 3', 'Yogesh3@gmail.com', 'f52d28c384e8e94d767f5f93a9f5a950', 3, 'Test 3', 'Test 3', 543215);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company_category`
--
ALTER TABLE `company_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_name` (`company_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company_category`
--
ALTER TABLE `company_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_prices_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`company_name`) REFERENCES `company_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
