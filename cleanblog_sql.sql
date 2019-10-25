-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2019 at 07:59 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cleanblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `phone_number` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `msg`, `date`, `phone_number`) VALUES
(25, 'sdds', 'abhi912260@gmail.com', '1222gfs', '2019-10-24 09:42:30', 1234567890),
(26, 'sdds', 'rehansingh.4522@gmail.com', '1222gfs', '2019-10-24 09:42:40', 1234567890),
(27, 'sdds', 'rehansingh.4522@gmail.com', '1222gfs', '2019-10-24 09:44:01', 1234567890),
(28, 'sdds', 'rehansingh.4522@gmail.com', '1222gfs', '2019-10-24 09:44:28', 1234567890),
(29, 'sdds', 'rehansingh.4522@gmail.com', '1222gfs', '2019-10-24 09:44:31', 1234567890),
(30, 'sdds', 'rehansingh.4522@gmail.com', '1222gfs', '2019-10-24 09:44:47', 1234567890),
(31, 'jg', 'abhi912260@gmail.com', 'name, sender=email,\r\n                          recipients=params[\'mail-username\'],\r\n                          body =message + \'\\n\' + phone', '2019-10-24 09:47:25', 1234567890),
(32, 'jg', 'abhi912260@gmail.com', 'name, sender=email,\r\n                          recipients=params[\'mail-username\'],\r\n                          body =message + \'\\n\' + phone', '2019-10-24 09:49:29', 1234567890),
(33, 'jg', 'abhi912260@gmail.com', 'name, sender=email,\r\n                          recipients=params[\'mail-username\'],\r\n                          body =message + \'\\n\' + phone', '2019-10-24 09:57:35', 1234567890),
(34, 'sdds', 'rehansingh.4522@gmail.com', '1222gfs', '2019-10-24 10:01:31', 1234567890),
(35, 'dev', 'singhsubhamraj70@gmail.com', 'hii', '2019-10-24 11:13:27', 2147483647),
(36, 'jg', 'singhsubhamraj70@gmail.com', 'hh', '2019-10-24 11:15:27', 2147483647),
(37, 'dev', 'singhsubhamraj70@gmail.com', 'cuv', '2019-10-24 11:18:22', 2147483647),
(38, 'dev', 'singhsubhamraj70@gmail.com', 'cuv', '2019-10-24 11:19:40', 2147483647),
(39, 'dev', 'singhsubhamraj70@gmail.com', 'cuv', '2019-10-24 11:20:40', 2147483647),
(40, 'dev', 'singhsubhamraj70@gmail.com', 'cuv', '2019-10-24 11:21:01', 2147483647),
(41, 'dev', 'singhsubhamraj70@gmail.com', 'cuv', '2019-10-24 11:21:04', 2147483647),
(42, 'dev', 'singhsubhamraj70@gmail.com', 'cuv', '2019-10-24 11:23:18', 2147483647),
(43, 'dev', 'singhsubhamraj70@gmail.com', 'cuv', '2019-10-24 11:26:57', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sno` int(50) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `img_file` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sno`, `title`, `slug`, `content`, `date`, `img_file`) VALUES
(2, 'title of post2', 'b', 'pplying the .first() executes the query, instead of storing the Query object it will return only the first result.\r\n\r\n.all() returns all\r\n\r\nedit:\r\n\r\nor you could use user = User.query.get(user_id) assuming user_id is defined as PK\r\n\r\nIn your Login Function it should be\r\n\r\n  user = User.query.filter_by(username=username).first()\r\n    if user and check_password_hash(user.password, password) == Tru', '2019-10-22 00:00:00', ''),
(3, 'Ben and Jerry’s', 'b', 'gggjgj', '2019-10-25 16:14:19', 'kjjlk'),
(5, 'Utilities  Bootstrap includes dozens of utilities—classes with a single purpose to reduce the frequency of highly repetitive declarations. ', 'c', 'Borders\r\n\r\nUse border utilities to quickly style the border and border-radius of an element. Great for images, buttons, or any other element.\r\nBorder\r\n\r\nAdd classes to an element to remove all borders or some borders.', '2019-10-25 16:42:01', 's to an element to remove all bor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
