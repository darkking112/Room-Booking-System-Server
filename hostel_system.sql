-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Sep 24, 2024 at 03:34 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `Admin_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Age` int(11) NOT NULL,
  `Phone_Number` text NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`Admin_ID`, `Name`, `Age`, `Phone_Number`, `Email`, `Password`, `User_ID`) VALUES
(1, 'Alassaf', 50, '123456789', 'admin@admin.com', 'Admin.1234', 4);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `Booking_ID` int(11) NOT NULL,
  `Guest_Name` text NOT NULL,
  `Guest_Phone_Number` text NOT NULL,
  `Booking_Type` text NOT NULL,
  `Booking_Date` text NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Room_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`Booking_ID`, `Guest_Name`, `Guest_Phone_Number`, `Booking_Type`, `Booking_Date`, `User_ID`, `Room_ID`) VALUES
(22, 'Ali', '0123456789', 'Self Booked', '2024/09/21', 1, 20),
(24, 'ali', '20', 'Counter Booked', '2024/09/22', 13, 2),
(25, 'ali', '20', 'Counter Booked', '2024/09/22', 13, 3),
(27, 'ali', '123456', 'Counter Booked', '2024/09/22', 13, 4),
(28, 'ali2', '123456', 'Counter Booked', '2024/09/22', 13, 16),
(29, 'test', '123456', 'Counter Booked', '2024/09/22', 13, 8),
(30, 'testing', '123456', 'Counter Booked', '2024/09/22', 13, 17),
(31, 'testing', '123456', 'Counter Booked', '2024/09/22', 13, 18),
(32, 'r', '123456', 'Counter Booked', '2024/09/22', 13, 19),
(33, 'tt', '123', 'Counter Booked', '2024/09/22', 13, 20),
(34, 'ali', '123456', 'Counter Booked', '2024/09/22', 6, 6),
(36, 'test', '12456', 'Counter Booked', '2024/09/22', 6, 15),
(38, 'Omar', '123456789', 'Self Booked', '2024/09/23', 15, 14),
(39, 'Ali', '0123456789', 'Self Booked', '2024/09/23', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `Employee_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Age` int(11) NOT NULL,
  `Phone_Number` text NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`Employee_ID`, `Name`, `Age`, `Phone_Number`, `Email`, `Password`, `User_ID`) VALUES
(2, 'testAdingemployee', 25, '123456789', 'employee@gmail.com', '123456', 6),
(9, 'testing', 20, '123456', 'testing@gmail.com', '132456', 13);

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `Guest_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Age` int(11) NOT NULL,
  `Phone_Number` text NOT NULL,
  `Gender` text NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`Guest_ID`, `Name`, `Age`, `Phone_Number`, `Gender`, `Email`, `Password`, `User_ID`) VALUES
(1, 'Ali', 20, '0123456789', 'M', 'test@gmail.com', '123456', 1),
(3, 'Omar', 20, '123456789', 'M', 'omar@gmail.com', '123456', 15);

-- --------------------------------------------------------

--
-- Stand-in structure for view `roombookingview`
-- (See below for the actual view)
--
CREATE TABLE `roombookingview` (
`Room_ID` int(11)
,`Room_Number` int(11)
,`Status` text
,`User_ID` int(11)
,`Booking_ID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `Room_ID` int(11) NOT NULL,
  `Room_Number` int(11) NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`Room_ID`, `Room_Number`, `Status`) VALUES
(1, 1, 'Available'),
(2, 2, 'Reserved'),
(3, 3, 'Reserved'),
(4, 4, 'Reserved'),
(5, 5, 'Available'),
(6, 6, 'Reserved'),
(7, 7, 'Reserved'),
(8, 8, 'Reserved'),
(9, 9, 'Available'),
(10, 10, 'Available'),
(11, 11, 'Available'),
(12, 12, 'Available'),
(13, 13, 'Available'),
(14, 14, 'Reserved'),
(15, 15, 'Reserved'),
(16, 16, 'Reserved'),
(17, 17, 'Reserved'),
(18, 18, 'Reserved'),
(19, 19, 'Reserved'),
(20, 20, 'Reserved');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL,
  `User_Type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `Email`, `Password`, `User_Type`) VALUES
(1, 'test@gmail.com', '123456', 'guest'),
(4, 'admin@admin.com', 'Admin.1234', 'admin'),
(6, 'employee@gmail.com', '123456', 'employee'),
(13, 'testing@gmail.com', '123456', 'employee'),
(15, 'omar@gmail.com', '123456', 'guest');

-- --------------------------------------------------------

--
-- Structure for view `roombookingview`
--
DROP TABLE IF EXISTS `roombookingview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `roombookingview`  AS SELECT `r`.`Room_ID` AS `Room_ID`, `r`.`Room_Number` AS `Room_Number`, `r`.`Status` AS `Status`, `b`.`User_ID` AS `User_ID`, `b`.`Booking_ID` AS `Booking_ID` FROM (`rooms` `r` join `bookings` `b` on(`r`.`Room_ID` = `b`.`Room_ID`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD KEY `Admin_User_ID_FK` (`User_ID`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `Bookings_User_ID_FK` (`User_ID`),
  ADD KEY `Rooms_ID_FK` (`Room_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `Employee_User_ID_FK` (`User_ID`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`Guest_ID`),
  ADD KEY `Guest_User_ID_FK` (`User_ID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`Room_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `Booking_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `Employee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `Guest_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `Room_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `Admin_User_ID_FK` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `Bookings_User_ID_FK` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `Rooms_ID_FK` FOREIGN KEY (`Room_ID`) REFERENCES `rooms` (`Room_ID`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `Employee_User_ID_FK` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

--
-- Constraints for table `guests`
--
ALTER TABLE `guests`
  ADD CONSTRAINT `Guest_User_ID_FK` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
