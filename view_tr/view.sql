-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2021 at 08:16 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `view`
--

-- --------------------------------------------------------

--
-- Table structure for table `present_add`
--

CREATE TABLE `present_add` (
  `id` int(11) NOT NULL,
  `road_area` varchar(150) NOT NULL,
  `district` varchar(150) NOT NULL,
  `stinfo_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `present_add`
--

INSERT INTO `present_add` (`id`, `road_area`, `district`, `stinfo_id`) VALUES
(1, 'Nakhal para', 'Noakhali', 1001);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_detalis_view`
-- (See below for the actual view)
--
CREATE TABLE `student_detalis_view` (
`id` int(11)
,`name` varchar(50)
,`mobile` varchar(50)
,`gender` enum('male','female')
,`road_area` varchar(150)
,`district` varchar(150)
);

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `gender` enum('male','female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`id`, `name`, `email`, `mobile`, `gender`) VALUES
(1001, 'Alim', 'alim@gmail.com', '018565266', 'male');

--
-- Triggers `student_info`
--
DELIMITER $$
CREATE TRIGGER `after_delete_student_tigger` AFTER DELETE ON `student_info` FOR EACH ROW DELETE FROM present_add WHERE stinfo_id= OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `student_detalis_view`
--
DROP TABLE IF EXISTS `student_detalis_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_detalis_view`  AS SELECT `student_info`.`id` AS `id`, `student_info`.`name` AS `name`, `student_info`.`mobile` AS `mobile`, `student_info`.`gender` AS `gender`, `present_add`.`road_area` AS `road_area`, `present_add`.`district` AS `district` FROM (`student_info` join `present_add`) WHERE `student_info`.`id` = `present_add`.`stinfo_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `present_add`
--
ALTER TABLE `present_add`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `present_add`
--
ALTER TABLE `present_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
