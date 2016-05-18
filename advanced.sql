-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 17 May 2016, 21:46:56
-- Sunucu sürümü: 10.1.13-MariaDB
-- PHP Sürümü: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `advanced`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_turkish_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_turkish_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1463001327),
('author', '2', 1463001327),
('author', '6', 1463001659),
('author', '7', 1463058516),
('author', '8', 1463427222);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_turkish_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_turkish_ci,
  `rule_name` varchar(64) COLLATE utf8_turkish_ci DEFAULT NULL,
  `data` text COLLATE utf8_turkish_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1463001327, 1463001327),
('author', 1, NULL, NULL, NULL, 1463001327, 1463001327),
('KendiYorum', 2, 'Kendi Yorumumu Güncelle', 'isAuthor', NULL, 1463001343, 1463001343),
('YorumGuncelle', 2, 'Yorum Güncellenek için', NULL, NULL, 1463001327, 1463001327),
('YorumOlustur', 2, 'Yorum Oluşturmak için', NULL, NULL, 1463001324, 1463001324),
('YorumSil', 2, 'Yorum Sil', NULL, NULL, 1463001327, 1463001327);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_turkish_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'author'),
('admin', 'YorumGuncelle'),
('admin', 'YorumSil'),
('author', 'KendiYorum'),
('author', 'YorumOlustur'),
('KendiYorum', 'YorumGuncelle');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_turkish_ci NOT NULL,
  `data` text COLLATE utf8_turkish_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isAuthor', 'O:22:"common\\rbac\\AuthorRule":3:{s:4:"name";s:8:"isAuthor";s:9:"createdAt";i:1463001340;s:9:"updatedAt";i:1463001340;}', 1463001340, 1463001340);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `icerik`
--

CREATE TABLE `icerik` (
  `id` int(8) NOT NULL,
  `baslik` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `govde` text COLLATE utf8_turkish_ci NOT NULL,
  `tip` int(8) DEFAULT NULL,
  `yazar` int(8) NOT NULL,
  `tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `icerik`
--

INSERT INTO `icerik` (`id`, `baslik`, `govde`, `tip`, `yazar`, `tarih`) VALUES
(1, 'cengiz', 'han', NULL, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_turkish_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1462456806),
('m130524_201442_init', 1462456814),
('m140506_102106_rbac_init', 1462991550);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'cengiz', 'f6q3jAfk2PfiL51oa54xGoLS2epmxg8X', '$2y$13$43JPh.AH.9lIB6SybM5MLeaTvCtjk/lxLXMdP6Vxei.cxlGbv1IQ2', NULL, 'cengihitos@hotmail.com', 10, 1462456954, 1462456954),
(2, 'andak', 'wnhCDDYe9mgcgR3UPqqu0t-seAr5sKgu', '$2y$13$.BGAk37u0Nlo39DboIxB8unnivDuH.9uwPOKWPU6eC0nttJoKk8a6', NULL, 'andak@gmail.com', 10, 1462993483, 1462993483),
(5, 'deneme2', 'K6YctFFCz9OLeIWMbWVlRMVWEvn5BE48', '$2y$13$59.Bx3QPCvsprFm2ieVGGu7FSQIkY3uwaQv73cbk/aa5hWPM1wrnS', NULL, 'deneme2@gmail.com', 10, 1462994129, 1462994129),
(6, 'deneme3', 'XNCLC0OEgJJSzogFQg6rxdPM5Cu9HYsn', '$2y$13$/Dp5EquNloFMaU3bPMWan.Lurw5HC1ishWwm6N8uBLknj59BtoqgG', NULL, 'deneme3@gmail.com', 10, 1463001659, 1463001659),
(7, 'aaaa', '4Rqhe8JE-ZQXOLIndUT5OGSMFVIYpKHo', '$2y$13$.K.zFzqDquQTkkM8NlZyUOt9xdSxkL2973Nnjo9IOj/4sOAsKKoB2', NULL, 'aaa@gmail.com', 10, 1463058516, 1463058516),
(8, 'enes75ytl', '_vnjz0M450GRS2Q8nOzUcDSmJgus7yE-', '$2y$13$STAdqOwVgYa7VahHnXU36.EpcNmfBjrhi.HUEjr9IT1D.CH1G3Xze', NULL, 'enes75tl@gmail.com', 10, 1463427221, 1463427221);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorum`
--

CREATE TABLE `yorum` (
  `id` int(8) NOT NULL,
  `title` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `body` text COLLATE utf8_turkish_ci NOT NULL,
  `author` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yorum`
--

INSERT INTO `yorum` (`id`, `title`, `body`, `author`) VALUES
(6, 'asd', 'asdasdsa', 1),
(7, 'cengiz', 'han', 1),
(8, 'sdf', 'sdfsdf', 1),
(11, 'denes', 'merhaba', 6),
(12, 'merhaba', 'televole', 6),
(13, 'merhaba', 'acın', 7),
(15, 'pazar günü', 'pazar günü gelmicem ', 8);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Tablo için indeksler `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Tablo için indeksler `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Tablo için indeksler `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Tablo için indeksler `icerik`
--
ALTER TABLE `icerik`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Tablo için indeksler `yorum`
--
ALTER TABLE `yorum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `icerik`
--
ALTER TABLE `icerik`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Tablo için AUTO_INCREMENT değeri `yorum`
--
ALTER TABLE `yorum`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `yorum`
--
ALTER TABLE `yorum`
  ADD CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
