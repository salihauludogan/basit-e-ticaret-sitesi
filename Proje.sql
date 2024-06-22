-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:8889
-- Üretim Zamanı: 19 Nis 2023, 14:55:24
-- Sunucu sürümü: 5.7.39
-- PHP Sürümü: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `Proje`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Canta`
--

CREATE TABLE `Canta` (
  `canta_id` int(100) NOT NULL,
  `cantaFiyat` double NOT NULL,
  `cantaStok` int(11) NOT NULL,
  `cantaOzellik` varchar(200) NOT NULL,
  `cantaResim` blob NOT NULL,
  `canta_adi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `GirisYap`
--

CREATE TABLE `GirisYap` (
  `giris_ID` int(255) NOT NULL,
  `musteri_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `KayitOl`
--

CREATE TABLE `KayitOl` (
  `kayit_ID` int(100) NOT NULL,
  `musteri_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Musteri`
--

CREATE TABLE `Musteri` (
  `giris_ID` int(11) NOT NULL,
  `kayit_ID` int(11) NOT NULL,
  `musteriAd` varchar(30) NOT NULL,
  `musteriSoyad` varchar(30) NOT NULL,
  `musteriAdres` varchar(90) NOT NULL,
  `musteriCep` bigint(11) NOT NULL,
  `musteriMail` varchar(50) NOT NULL,
  `musteriTC` bigint(11) NOT NULL,
  `musteriSifre` varchar(300) NOT NULL,
  `musteri_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Siparis`
--

CREATE TABLE `Siparis` (
  `siparis_ID` int(255) NOT NULL,
  `siparis_tarih` date NOT NULL,
  `toplamTutar` decimal(10,0) NOT NULL,
  `musteri_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `Canta`
--
ALTER TABLE `Canta`
  ADD PRIMARY KEY (`canta_id`);

--
-- Tablo için indeksler `GirisYap`
--
ALTER TABLE `GirisYap`
  ADD PRIMARY KEY (`giris_ID`),
  ADD KEY `musteri_id` (`musteri_id`),
  ADD KEY `musteri_id_2` (`musteri_id`),
  ADD KEY `musteri_id_3` (`musteri_id`);

--
-- Tablo için indeksler `KayitOl`
--
ALTER TABLE `KayitOl`
  ADD PRIMARY KEY (`kayit_ID`),
  ADD KEY `musteri_ID` (`musteri_ID`),
  ADD KEY `musteri_ID_2` (`musteri_ID`);

--
-- Tablo için indeksler `Musteri`
--
ALTER TABLE `Musteri`
  ADD PRIMARY KEY (`musteri_ID`),
  ADD KEY `giris_ID` (`giris_ID`),
  ADD KEY `kayit_ID` (`kayit_ID`);

--
-- Tablo için indeksler `Siparis`
--
ALTER TABLE `Siparis`
  ADD PRIMARY KEY (`siparis_ID`),
  ADD KEY `musteri_ID` (`musteri_ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `Canta`
--
ALTER TABLE `Canta`
  MODIFY `canta_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `GirisYap`
--
ALTER TABLE `GirisYap`
  MODIFY `giris_ID` int(255) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `KayitOl`
--
ALTER TABLE `KayitOl`
  MODIFY `kayit_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Musteri`
--
ALTER TABLE `Musteri`
  MODIFY `musteri_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Siparis`
--
ALTER TABLE `Siparis`
  MODIFY `siparis_ID` int(255) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `GirisYap`
--
ALTER TABLE `GirisYap`
  ADD CONSTRAINT `girisyap_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `Musteri` (`musteri_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `KayitOl`
--
ALTER TABLE `KayitOl`
  ADD CONSTRAINT `kayitol_ibfk_1` FOREIGN KEY (`musteri_ID`) REFERENCES `Musteri` (`musteri_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `Musteri`
--
ALTER TABLE `Musteri`
  ADD CONSTRAINT `musteri_ibfk_1` FOREIGN KEY (`kayit_ID`) REFERENCES `KayitOl` (`kayit_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `musteri_ibfk_2` FOREIGN KEY (`giris_ID`) REFERENCES `GirisYap` (`giris_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `Siparis`
--
ALTER TABLE `Siparis`
  ADD CONSTRAINT `siparis_ibfk_1` FOREIGN KEY (`musteri_ID`) REFERENCES `Musteri` (`musteri_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
