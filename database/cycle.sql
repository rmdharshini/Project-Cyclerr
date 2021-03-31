-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2021 at 09:51 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cycle`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `Name` text NOT NULL,
  `User_Id` int(5) NOT NULL,
  `Phonenumber` varchar(10) NOT NULL,
  `Emailid` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Active` int(11) NOT NULL DEFAULT 0,
  `Rides` int(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cycle_details`
--

CREATE TABLE `cycle_details` (
  `Cycle_Id` varchar(20) NOT NULL,
  `Station_Name` text NOT NULL,
  `No_Of_Rides` int(255) NOT NULL,
  `Status` int(5) NOT NULL DEFAULT 0,
  `Pin` varchar(5) NOT NULL DEFAULT 'abc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `overall`
--

CREATE TABLE `overall` (
  `User_Id` varchar(50) NOT NULL,
  `Cycle_Id` varchar(20) NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `Start_Time` time DEFAULT NULL,
  `Total_Duration` time NOT NULL,
  `Initial_Duration` time NOT NULL,
  `Ride_End_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Ride_Status` int(11) NOT NULL DEFAULT 1,
  `Ride_Cost` int(4) NOT NULL,
  `Extended_Cost` int(4) NOT NULL DEFAULT 0,
  `Destination` varchar(30) NOT NULL,
  `start_point` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `User_Id` varchar(50) NOT NULL,
  `Cycle_Id` varchar(20) NOT NULL,
  `Payment_Time` time NOT NULL,
  `Amount` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sign_up`
--

CREATE TABLE `sign_up` (
  `Email_Id` varchar(30) NOT NULL,
  `Random_Number` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `station_details`
--

CREATE TABLE `station_details` (
  `Station_Id` varchar(5) NOT NULL,
  `Station_Name` text NOT NULL,
  `City` text NOT NULL,
  `Avl_Cycles` int(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Pincode` int(6) NOT NULL,
  `Map` varchar(200) NOT NULL,
  `Embed_Map` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`User_Id`),
  ADD UNIQUE KEY `User_Id` (`User_Id`);

--
-- Indexes for table `cycle_details`
--
ALTER TABLE `cycle_details`
  ADD UNIQUE KEY `Cycle_Id` (`Cycle_Id`);

--
-- Indexes for table `station_details`
--
ALTER TABLE `station_details`
  ADD UNIQUE KEY `Station_Id` (`Station_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
