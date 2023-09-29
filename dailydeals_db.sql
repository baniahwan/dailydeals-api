-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Sep 2023 pada 09.14
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dailydeals_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(1000) NOT NULL,
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `nama`, `deskripsi`, `harga`, `gambar`, `kategori`) VALUES
(1, 'CHEESE BURGER', 'A mouthwatering beef patty grilled to perfection, adorned with melty cheese, served on a soft, toasted bun with fresh lettuce, tomato, and our special sauce.', 65000, 'https://i.imgur.com/VRyyQoK.jpg', 'burger'),
(2, 'BURGER BACON', 'A juicy, flame-grilled patty topped with crispy bacon strips, lettuce, tomato, and our signature sauce, all served on a warm, toasted bun.', 75000, 'https://i.imgur.com/wFjr6Vz.jpg', 'burger'),
(3, 'CHICKEN BURGER', 'Enjoy our Chicken Burger, featuring a tender and perfectly seasoned chicken patty, topped with fresh lettuce, ripe tomatoes.', 55000, 'https://i.imgur.com/Om2fs7Y.jpg', 'burger'),
(4, 'EGG SALAD SANDWICH', 'A delightful combination of farm-fresh eggs mixed with a secret blend of spices and creamy mayo, served between two slices of freshly baked bread.', 60000, 'https://i.imgur.com/jiv0oZt.jpg', 'sandwich'),
(5, 'CHICKEN SANDWICH', 'A perfectly seasoned and crispy chicken fillet, paired with fresh lettuce and creamy mayo, all nestled between soft, golden buns.', 70000, 'https://i.imgur.com/Qqonu9k.jpg', 'sandwich'),
(6, 'CLUB SANDWICH', 'Layers of tender roasted turkey, crispy bacon, fresh lettuce, juicy tomatoes, and creamy mayo, all stacked between slices of toasted bread.', 55000, 'https://i.imgur.com/kJjjY8O.jpg', 'sandwich'),
(7, 'MILKSHAKE OREO', 'A luscious blend of velvety vanilla ice cream and crushed Oreo cookies, all crowned with whipped cream and a final sprinkle of cookie crumbs.', 20000, 'https://i.imgur.com/pZoD2bB.jpg', 'dessertAndDrink'),
(8, 'ICE CREAM VANILLA', 'A spoonful of pure creaminess and smoothness, expertly made with the finest Madagascar vanilla beans and enhanced with strawberry fruit.', 30000, 'https://i.imgur.com/c8LpKyj.jpg', 'dessertAndDrink'),
(9, 'DOUGHNUT', 'Satisfy your sweet cravings with our delectable Doughnut – a freshly fried, pillowy pastry ring, delicately glazed to perfection.', 10000, 'https://i.imgur.com/n9kQwk1.jpg', 'dessertAndDrink'),
(10, 'FRENCH FRIES', 'Enjoy the crispy perfection of our French Fries – golden, hand-cut potatoes, lightly seasoned and cooked to a satisfying crunch.', 15000, 'https://i.imgur.com/y8Yhm6S.jpg', 'sides'),
(11, 'MAC & CHEESE', 'Delight in the comfort of our Mac \'n\' Cheese – a creamy, cheesy masterpiece with perfectly cooked pasta that\'s a hug in every bite.', 30000, 'https://i.imgur.com/qru09vI.jpg', 'sides'),
(12, 'COLESLAW', 'A medley of crisp cabbage and carrots, expertly tossed in a creamy dressing for a simple, cool, and crisp side dish that complements any meal.', 5000, 'https://i.imgur.com/A0iN9ur.jpg', 'sides');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'Bani Ahwan', 'baniahwan@example.com', '123456789'),
(2, 'Andi', 'andi@example.com', '123456789'),
(3, 'budi', 'budi@example.com', 'budi123');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
