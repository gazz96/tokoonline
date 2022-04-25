-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Apr 2022 pada 11.39
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoonline`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'keripik', 'Keripik'),
(2, 'kue-kering', 'Kue Kering'),
(3, 'air-mineral', 'Air Mineral');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(55) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(5, 5, '2021-12-16', '520211216102323', 60000, 'arif', 'jl', 9787112, 'delivered'),
(7, 5, '2021-12-23', '520211223141338', 15135000, 'udin', 'solo', 81273, 'delivered'),
(8, 4, '2022-01-05', '420220105111315', 170000, 'Mas A', 'Jl Terus', 129381, 'waiting'),
(9, 5, '2022-01-05', '520220105151841', 53000, 'fitri', 'klaten', 192312, 'delivered'),
(10, 5, '2022-01-09', '520220109132542', 16000, 'Amel', 'Jl Terus Gak Jadian', 812783123, 'delivered'),
(11, 5, '2022-01-11', '520220111205113', 175000, 'Arif Arifudin', 'Jalan Apa Hayoo No.11, Klaten', 811223344, 'waiting'),
(12, 5, '2022-01-13', '520220113080133', 53000, 'ewew', 'Jl. Lurus', 12314, 'waiting'),
(13, 6, '2022-03-22', '620220322133915', 15992000, 'udin', 'jl lurus', 6786789, 'delivered'),
(14, 5, '2022-03-22', '520220322140159', 90000, 'setyo', 'jl. terus', 7818731, 'waiting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 1, 'Amir', '2147483647', 36000000, '-', '520200318210456-20200319173859.jpg'),
(2, 2, 'Dio Brando', '344312321', 500000, 'Mantap kang', '520200319181238-20200319181447.jpg'),
(3, 4, 'arif', '219093021', 30000, '-', '520211215220013-20211215220208.png'),
(4, 5, 'arif', '810820', 1000, '-', '520211216102323-20211216102414.png'),
(5, 6, 'Udin', '912983', 45000, '-', '520211223072216-20211223072301.png'),
(6, 7, 'udin', '912312', 15000000, '-', '520211223141338-20211223141447.png'),
(7, 9, 'fitri', '819201', 56000, 'Mantap Kafir', '520220105151841-20220105152024.png'),
(8, 10, 'Amel', '88776655', 16000, 'Dikirim sesuai alamat', '520220109132542-20220109132836.jpg'),
(9, 13, 'udin', '2147483647', 15000000, '-', '620220322133915-20220322134043.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 6, 30000000),
(2, 1, 3, 2, 6000000),
(3, 2, 2, 1, 500000),
(4, 3, 3, 1, 3000000),
(5, 4, 2, 2, 30000),
(6, 5, 2, 1, 15000),
(7, 5, 3, 1, 45000),
(8, 6, 3, 1, 45000),
(9, 7, 2, 1000, 15000000),
(10, 7, 3, 3, 135000),
(11, 8, 4, 10, 80000),
(12, 8, 3, 2, 90000),
(13, 9, 4, 1, 8000),
(14, 9, 3, 1, 45000),
(15, 10, 4, 2, 16000),
(16, 11, 4, 5, 40000),
(17, 11, 3, 3, 135000),
(18, 12, 4, 1, 8000),
(19, 12, 3, 1, 45000),
(20, 13, 4, 1999, 15992000),
(21, 14, 3, 2, 90000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(2, 3, 'air-mineral-hexa-fit', 'Air Mineral Hexa Fit ', 'Isi 19L', 15000, 1, 'air-mineral-hexa-fit-20220109184455.jpg'),
(3, 1, 'keripik-stick-bawang', 'Keripik Stick Bawang ', 'Renyah, Gurih Isi 2kg', 45000, 1, 'keripik-stick-bawang-20220109184646.jpg'),
(4, 2, 'roma-malkist-kelapa', 'Roma Malkist Kelapa', 'Roma Malkist Kelapa Kopyor', 8000, 1, 'roma-malkist-kelapa-20220111174650.jpeg'),
(5, 1, 'rambak-renyah', 'Rambak Renyah', '1 Tali Isi 4', 25000, 1, 'rambak-renyah-20220109184708.jpg'),
(6, 2, 'roma-kelapa', 'Roma Kelapa', 'Roti roma kelapa ', 9000, 1, 'roma-kelapa-20220111174716.jpg'),
(7, 1, 'telur-gabus-keju', 'Telur Gabus Keju', 'Isi 2 kg', 45000, 1, 'telur-gabus-keju-20220109184907.jpg'),
(8, 3, 'aqua-air-mineral', 'Aqua Air Mineral', 'Kemasan 1 Dus', 50000, 1, 'aqua-air-mineral-20220109185058.jpeg'),
(9, 3, 'le-mineral', 'Le Mineral', 'Kemasan 1 Dus', 48000, 1, 'le-mineral-20220109185149.jpeg'),
(10, 1, 'keripik-tongkol', 'Keripik Tongkol', 'Isi 2kg', 42000, 1, 'keripik-tongkol-20220109185302.jpg'),
(11, 1, 'keripik-sukun', 'Keripik Sukun', 'Renyah Gurih', 4000, 1, 'keripik-sukun-20220109185358.jpg'),
(12, 1, 'keripik-talas-pedas', 'Keripik Talas Pedas', 'Renyah, Isi 2kg', 48000, 1, 'keripik-talas-pedas-20220110211454.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(4, 'Admin', 'admin@admin.com', '$2y$10$mLyToNOtVeLG.ziTUFPpCOOGD1P8cXZJj6ufU7J74TB63qVs2JjqK', 'admin', 1, 'admin-20200315212825.png'),
(5, 'Member', 'member@member.com', '$2y$10$ghbQkKwENFZnOxWAwtgSaeDV2gcI63ZorQEQkSxqlaUlrFUMNnLpy', 'member', 1, 'member-20200315232137.png'),
(6, 'udin', 'udin@gmail.com', '$2y$10$MO/c5epwdznFwHxAy50U3eMfZ97GqG26WHSnimdFzYNq5H.qn2r3O', 'member', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_orders` (`id_orders`);

--
-- Indeks untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_orders` (`id_orders`),
  ADD KEY `id_product` (`id_product`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD CONSTRAINT `orders_confirm_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `order_detail` (`id`);

--
-- Ketidakleluasaan untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
