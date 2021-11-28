-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2021 at 02:05 PM
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
-- Database: `resto odading`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id_Bill` int(99) NOT NULL,
  `Nama Customer` varchar(50) NOT NULL,
  `Cash` int(99) DEFAULT NULL,
  `No. Creditcard` int(99) DEFAULT NULL,
  `Waktu dan Tanggal` datetime NOT NULL,
  `Total Harga` int(99) NOT NULL,
  `Kembalian` int(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id_Bill`, `Nama Customer`, `Cash`, `No. Creditcard`, `Waktu dan Tanggal`, `Total Harga`, `Kembalian`) VALUES
(1, 'Asep', 30000, NULL, '2021-01-05 19:35:22', 30000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_Customer` int(99) NOT NULL,
  `Nama Customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_Customer`, `Nama Customer`) VALUES
(1, 'Asep');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_Menu` int(99) NOT NULL,
  `Nama Menu` varchar(50) NOT NULL,
  `Stock` int(99) DEFAULT NULL,
  `Bahan` varchar(50) DEFAULT NULL,
  `Harga` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_Menu`, `Nama Menu`, `Stock`, `Bahan`, `Harga`) VALUES
(1, 'Cakue', NULL, NULL, 15000),
(2, 'Odading', NULL, NULL, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_Payment` int(99) NOT NULL,
  `id_Bill` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id_Payment`, `id_Bill`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_Pegawai` int(99) NOT NULL,
  `Nama Pegawai` varchar(50) NOT NULL,
  `Gaji` int(99) NOT NULL,
  `Jabatan` varchar(20) NOT NULL,
  `Status Pegawai` varchar(50) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Tgl. Lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_Pegawai`, `Nama Pegawai`, `Gaji`, `Jabatan`, `Status Pegawai`, `Alamat`, `Tgl. Lahir`) VALUES
(1, 'Aldi Julyan Sugiyarto', 10000000, 'Pemilik', 'Tersedia', 'Permata Kopo 2 Blok D2/29', '2001-07-20'),
(2, 'Budi Binomo', 5000000, 'Juru Masak', 'Tersedia', 'Entah berantah', '2000-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_Pesanan` int(99) NOT NULL,
  `Nama Customer` varchar(50) NOT NULL,
  `No. Meja` int(99) NOT NULL,
  `id_Menu` int(99) NOT NULL,
  `Jumlah` int(99) NOT NULL,
  `Total Harga` int(99) NOT NULL,
  `Tgl. Pesanan` date NOT NULL,
  `Status Pesanan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_Pesanan`, `Nama Customer`, `No. Meja`, `id_Menu`, `Jumlah`, `Total Harga`, `Tgl. Pesanan`, `Status Pesanan`) VALUES
(1, 'Asep', 5, 1, 2, 30000, '2021-01-04', 'in progress');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_Bill`) USING BTREE;

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_Customer`) USING BTREE;

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_Menu`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_Payment`) USING BTREE;

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_Pegawai`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_Pesanan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id_Bill` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_Customer` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_Menu` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id_Payment` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_Pegawai` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_Pesanan` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment Bill` FOREIGN KEY (`id_Bill`) REFERENCES `bill` (`id_Bill`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
