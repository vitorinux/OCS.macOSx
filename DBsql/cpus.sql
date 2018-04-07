-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 04, 2018 at 12:54 AM
-- Server version: 10.0.34-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbreport`
--

-- --------------------------------------------------------

--
-- Table structure for table `cpus`
--

CREATE TABLE `cpus` (
  `IDSRA` varchar(50) NOT NULL DEFAULT 'SRA' COMMENT 'Asociado con codigo de barras',
  `MANUFACTURER` varchar(25) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL,
  `CPUID` varchar(50) NOT NULL,
  `SPEED` varchar(10) NOT NULL,
  `CORES` int(2) NOT NULL,
  `L2CACHESIZE` varchar(10) NOT NULL,
  `CPUARCH` varchar(15) NOT NULL,
  `DATA_WIDTH` int(2) NOT NULL,
  `LOGICAL_CPUS` int(2) NOT NULL,
  `VOLTAGE` varchar(10) DEFAULT NULL,
  `BUS_SPEED` varchar(15) NOT NULL,
  `MODEL_ID` varchar(25) NOT NULL,
  `MODEL_NAME` varchar(25) NOT NULL,
  `ROOM` varchar(25) NOT NULL,
  `SERIAL` varchar(25) NOT NULL,
  `SMC` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cpus`
--
ALTER TABLE `cpus`
  ADD PRIMARY KEY (`SERIAL`),
  ADD UNIQUE KEY `IDSRA` (`IDSRA`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
