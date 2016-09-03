-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2016 at 07:46 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kereta`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_pembeli`
--

CREATE TABLE `daftar_pembeli` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `ktp` int(100) NOT NULL,
  `kode_tiket` varchar(255) NOT NULL,
  `nama_kereta` varchar(255) NOT NULL,
  `gerbong` varchar(255) NOT NULL,
  `kursi` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `log` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `daftar_pembeli`
--

INSERT INTO `daftar_pembeli` (`id`, `nama`, `ktp`, `kode_tiket`, `nama_kereta`, `gerbong`, `kursi`, `status`, `log`) VALUES
(1, 'Gilang', 1234567890, 'asdasd', 'Kereta Argolawu', 'A', '1', 'Lunas', '2016-05-28'),
(2, 'Aditya', 1234567890, 'asldas', 'Kereta Argolawu', 'A', '2', 'Lunas', '2016-05-31'),
(3, 'Rahman', 1234567890, 'asdasd', 'Kereta Matamata', 'A', '1', 'Lunas', '2016-05-30'),
(4, 'Gilang', 1234567890, 'asdasd', 'Kereta Argolawu', 'A', '3', 'Lunas', '2016-05-30'),
(5, 'anjir', 1234567890, 'asdfas', 'Kereta Matamata', 'A', '2', 'Lunas', '2016-06-02'),
(6, 'faking', 1234567890, 'asdfas', 'Kereta Matamata', 'A', '2', 'Lunas', '2016-06-01'),
(7, 'ulala', 1234567890, 'tyuiop', 'Kereta Argolawu', 'A', '5', 'Lunas', '2016-06-02'),
(8, 'Gembul', 1234567890, 'asdfas', 'Kereta Argolawu', 'A', '10', 'Lunas', '2016-06-09'),
(9, 'Gembul', 1234567890, 'aserty', 'Kereta Argolawu', 'A', '1', 'Lunas', '2016-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` int(11) NOT NULL,
  `kode_kereta` varchar(255) NOT NULL,
  `kode_tiket` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `ktp` varchar(255) NOT NULL,
  `no_bangku` varchar(255) NOT NULL,
  `no_gerbong` varchar(255) NOT NULL,
  `log` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stok_tiket`
--

CREATE TABLE `stok_tiket` (
  `id` int(11) NOT NULL,
  `kode_kereta` varchar(255) NOT NULL,
  `nama_kereta` varchar(255) NOT NULL,
  `stock_tiket` int(10) NOT NULL,
  `harga_tiket` int(100) NOT NULL,
  `log` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok_tiket`
--

INSERT INTO `stok_tiket` (`id`, `kode_kereta`, `nama_kereta`, `stock_tiket`, `harga_tiket`, `log`) VALUES
(1, 'P88C8I', 'Kereta Argolawu', 296, 450000, '2016-06-03'),
(2, 'asdaksjd', 'Kereta Matamata', 300, 400000, '2016-06-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_pembeli`
--
ALTER TABLE `daftar_pembeli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok_tiket`
--
ALTER TABLE `stok_tiket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_pembeli`
--
ALTER TABLE `daftar_pembeli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stok_tiket`
--
ALTER TABLE `stok_tiket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
