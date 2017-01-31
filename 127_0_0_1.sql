-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2017 at 02:49 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webstart`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `user_1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`c_id`, `comment`, `user_id`, `date`) VALUES
(9, 'this is my comment ', 182, '2016-12-22 23:20:24'),
(16, 'this is a new pots', 184, '2016-12-23 12:30:53'),
(17, 'this is a pots ', 1, '2017-01-27 14:27:42'),
(18, 'this is a new Post ', 147, '2017-01-27 14:30:17'),
(19, 'this is me', 147, '2017-01-27 14:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `commentsec`
--

CREATE TABLE IF NOT EXISTS `commentsec` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `Com` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`comm_id`),
  KEY `user_2` (`user_id`),
  KEY `post_1` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `commentsec`
--

INSERT INTO `commentsec` (`comm_id`, `post_id`, `user_id`, `date`, `Com`) VALUES
(14, 9, 182, '2016-12-22 23:24:02', 'this is an comment '),
(21, 16, 184, '2016-12-23 12:38:55', 'this is the second comment '),
(22, 9, 184, '2016-12-23 12:39:10', 'this is the a teeeeeeeeeest '),
(23, 16, 184, '2016-12-23 12:42:57', 'this is the new comment '),
(24, 17, 147, '2017-01-27 14:30:01', 'this is a comment '),
(25, 17, 147, '2017-01-27 14:31:40', 'this is another Comment ');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE IF NOT EXISTS `signup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0' COMMENT 'identify user id admin or not',
  `Blood` text NOT NULL,
  `birthDate` int(11) NOT NULL,
  `healthCondition` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=185 ;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `username`, `pass`, `email`, `phone`, `GroupID`, `Blood`, `birthDate`, `healthCondition`) VALUES
(1, 'ADMIN', 'ADMIN', 'ADMIN@gmail.com', 1098271750, 1, 'A+', 2292016, 'Good'),
(120, 'Mahmdeeen', 'Shorbagy-96', 'mohamedelshorbagy1885@gmail.com', 1098279863, 0, 'A+', 22558, 'Very Good Man you are the Greatest Here'),
(147, 'Ahmed Mahmoud', '1234567', 'tt.tt@tt.com', 1189632542, 0, 'T+', 22565, 'Great'),
(150, 'Sharboog', 'sharboog', 'mohamed@mohamed.net', 1098278965, 0, 'A ', 2252017, 'Good\r\n'),
(182, 'Mohamed Elshorbagy', 'shorbagy-96', 'mohamedelshorbgy96@g.com', 1098271746, 0, 'B+', 2, 'Good Enough'),
(184, 'Mahmoud', '123456', 'gg.gg@gg.com', 1096367895, 0, 'O+', 2658875, 'Great Enough for you ');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `user_1` FOREIGN KEY (`user_id`) REFERENCES `signup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commentsec`
--
ALTER TABLE `commentsec`
  ADD CONSTRAINT `post_1` FOREIGN KEY (`post_id`) REFERENCES `comments` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_2` FOREIGN KEY (`user_id`) REFERENCES `signup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
