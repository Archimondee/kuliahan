-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2016 at 06:00 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_akhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_laundry`
--

CREATE TABLE `data_laundry` (
  `id` int(11) NOT NULL,
  `kodeLau` varchar(255) NOT NULL,
  `user_laundry` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `log` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_laundry`
--

INSERT INTO `data_laundry` (`id`, `kodeLau`, `user_laundry`, `status`, `total`, `log`) VALUES
(10, '7RY46CGIBS', 'Gilang', 'Lunas', '10000', '2016-06-12'),
(11, '8NLWFFP65Q', 'Aditya', 'Lunas', '35000', '2016-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `data_register`
--

CREATE TABLE `data_register` (
  `id` int(10) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pswd` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `akses` varchar(255) NOT NULL,
  `saldo` int(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `hp` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `log` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_register`
--

INSERT INTO `data_register` (`id`, `user`, `pswd`, `nama`, `akses`, `saldo`, `alamat`, `hp`, `email`, `log`) VALUES
(1, 'Gilang', 'aditya', 'Gilang Aditya', 'Anggota', 150000, 'Taman Puri Cendana 2 D1/27', 81310821647, 'kikchiemedia@gmail.com', '0000-00-00'),
(2, 'Admin', 'Admin', 'Admin', 'Admin', 99999999, 'Taman Puri Cendana 2', 8989898, 'Admin@laundry.com', '2016-06-12'),
(3, 'Aditya', 'aditya', 'Gilang Aditya', 'Anggota', 15020, 'Taman Puri Cendana 2 D1', 81310821647, 'kikchiemedia@gmail.com', '2016-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `data_saldo`
--

CREATE TABLE `data_saldo` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `penambah_saldo` varchar(255) NOT NULL,
  `penerima_saldo` varchar(255) NOT NULL,
  `jum_saldo` int(20) NOT NULL,
  `log` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_saldo`
--

INSERT INTO `data_saldo` (`id`, `user`, `penambah_saldo`, `penerima_saldo`, `jum_saldo`, `log`) VALUES
(1, 'Aditya', 'Admin', 'Gilang Aditya', 50000, '2016-06-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_laundry`
--
ALTER TABLE `data_laundry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_register`
--
ALTER TABLE `data_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_saldo`
--
ALTER TABLE `data_saldo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_laundry`
--
ALTER TABLE `data_laundry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `data_register`
--
ALTER TABLE `data_register`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `data_saldo`
--
ALTER TABLE `data_saldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
