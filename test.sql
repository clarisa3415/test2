-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2024 at 10:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `ID` int(11) NOT NULL,
  `Course` varchar(30) NOT NULL,
  `CourseCode` varchar(10) NOT NULL,
  `Credits` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`ID`, `Course`, `CourseCode`, `Credits`) VALUES
(1, 'FOOD SERVICE', 'FS235', '4'),
(2, 'MANAGEMENT', 'MGT134', '3'),
(3, 'INFORMATION', 'IML160', '3');

-- --------------------------------------------------------

--
-- Table structure for table `enrolment`
--

CREATE TABLE `enrolment` (
  `ID` int(11) NOT NULL,
  `StudentID` int(12) NOT NULL,
  `CourseCode` varchar(10) NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `InsID` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrolment`
--

INSERT INTO `enrolment` (`ID`, `StudentID`, `CourseCode`, `Date`, `InsID`) VALUES
(1, 17598, 'FS235', '2024-06-11', '23675'),
(2, 17564, 'FS235', '2024-06-11', '23675'),
(3, 17532, 'MGT134', '2024-06-11', '23187'),
(4, 17573, 'IML160', '2024-06-11', '23591'),
(5, 17529, 'MGT134', '2024-06-11', '23187');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` int(11) NOT NULL,
  `InsNames` varchar(255) NOT NULL,
  `InsID` varchar(12) NOT NULL,
  `InsEmail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID`, `InsNames`, `InsID`, `InsEmail`) VALUES
(1, 'Puan Aminah', '23675', 'aminah675@hbu.edu.my'),
(2, 'Encik Zaki', '23187', 'zaki187@hbu.edu.my'),
(3, 'Cik Laila', '23591', 'laila591@hbu.edu.my');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `ID` int(11) NOT NULL,
  `StudentID` int(12) NOT NULL,
  `Names` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`ID`, `StudentID`, `Names`, `Email`) VALUES
(1, 17598, 'Abdul Budin', 'abudin598@hbo.edu.my'),
(2, 17564, 'Puteri Asuna', 'putasuna564@hbo.edu.my'),
(3, 17532, 'Falisha', 'falisha532@hbo.edu.my'),
(4, 17573, 'Hazwan', 'hazwan573@hbo.edu.my'),
(5, 17529, 'Mimi', 'mimi529@hbo.edu.my');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CourseCode` (`CourseCode`),
  ADD UNIQUE KEY `CourseCode_3` (`CourseCode`),
  ADD UNIQUE KEY `CourseCode_4` (`CourseCode`),
  ADD KEY `CourseCode_2` (`CourseCode`),
  ADD KEY `CourseCode_5` (`CourseCode`);

--
-- Indexes for table `enrolment`
--
ALTER TABLE `enrolment`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `StudentID` (`StudentID`),
  ADD UNIQUE KEY `StudentID_2` (`StudentID`),
  ADD KEY `InsID` (`InsID`),
  ADD KEY `CourseCode` (`CourseCode`),
  ADD KEY `CourseCode_2` (`CourseCode`),
  ADD KEY `CourseCode_3` (`CourseCode`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `InsID` (`InsID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `StudentID` (`StudentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Course`
--
ALTER TABLE `Course`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enrolment`
--
ALTER TABLE `enrolment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrolment`
--
ALTER TABLE `enrolment`
  ADD CONSTRAINT `enrolment_ibfk_1` FOREIGN KEY (`CourseCode`) REFERENCES `Course` (`CourseCode`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`InsID`) REFERENCES `enrolment` (`InsID`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `enrolment` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
