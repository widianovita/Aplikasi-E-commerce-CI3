-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 01 Jul 2021 pada 07.04
-- Versi Server: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE IF NOT EXISTS `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Sepatu ', 'Sepatu Merk All Star', 'Pakaian Pria', 250000, 15, 'sepatu.jpg'),
(2, 'kamera', 'Kamera Canon eso 700d', 'Elektronik', 2500000, 5, 'kamera.jpg'),
(3, 'Samsung Galaxy A50', 'Handphone Smartphone 4GB/64GB', 'Elektronik', 2950000, 13, 'hp.jpg'),
(4, 'Laptop Asus MD50P', 'PC/Notebook Ram 6GB AMD R7', 'Elektronik', 7999999, 5, 'laptop.jpg'),
(6, 'Coklat Box', 'Coklat manis', 'Makanan', 150000, 50, 'coklat_sekat.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_invoices`
--

CREATE TABLE IF NOT EXISTS `tb_invoices` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_invoices`
--

INSERT INTO `tb_invoices` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(4, 'Mutiara Nur Ningsih', 'Gunung Sindur', '2021-05-02 01:07:11', '2021-05-03 01:07:11'),
(5, 'Widia Novita', 'Ciledug', '2021-05-02 01:51:43', '2021-05-03 01:51:43'),
(6, '', '', '2021-05-02 20:28:46', '2021-05-03 20:28:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE IF NOT EXISTS `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 3, 1, 'Sepatu', 1, 300000, ''),
(2, 3, 2, 'kamera', 1, 2500000, ''),
(3, 3, 3, 'Samsung Galaxy A50', 1, 2950000, ''),
(4, 3, 4, 'Laptop Asus MD50P', 1, 7999999, ''),
(5, 4, 6, 'Coklat Box', 1, 150000, ''),
(6, 5, 1, 'Sepatu', 1, 300000, ''),
(7, 5, 2, 'kamera', 1, 2500000, ''),
(8, 5, 3, 'Samsung Galaxy A50', 1, 2950000, ''),
(9, 5, 4, 'Laptop Asus MD50P', 1, 7999999, ''),
(10, 6, 3, 'Samsung Galaxy A50', 2, 2950000, '');

--
-- Trigger `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan`
 FOR EACH ROW BEGIN
UPDATE tb_barang SET stok = stok-NEW.jumlah WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '123', 1),
(2, 'user', 'user', 'user123', 2),
(3, 'Adila', 'adila', '12345', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoices`
--
ALTER TABLE `tb_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_invoices`
--
ALTER TABLE `tb_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
