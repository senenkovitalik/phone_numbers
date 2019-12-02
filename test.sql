-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Гру 02 2019 р., 13:05
-- Версія сервера: 10.4.8-MariaDB
-- Версія PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `test`
--

-- --------------------------------------------------------

--
-- Структура таблиці `number`
--

CREATE TABLE `number` (
  `id` int(11) NOT NULL,
  `number` int(16) NOT NULL,
  `phone_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп даних таблиці `number`
--

INSERT INTO `number` (`id`, `number`, `phone_id`, `type`) VALUES
(1, 28445, 1, 3),
(2, 28432, 2, 3),
(3, 28770, 3, 3),
(5, 30000, NULL, 2),
(6, 30001, NULL, 2),
(7, 30002, NULL, 2),
(8, 30003, NULL, 2),
(9, 30004, NULL, 2),
(10, 30005, NULL, 2),
(11, 30006, NULL, 2),
(12, 30007, NULL, 2),
(13, 30008, NULL, 2),
(14, 30009, NULL, 2),
(15, 30010, NULL, 2),
(16, 30011, NULL, 2),
(17, 30012, NULL, 2),
(18, 30013, NULL, 2),
(19, 30014, NULL, 2),
(20, 30015, NULL, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `number_type`
--

CREATE TABLE `number_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `shortname` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `number_type`
--

INSERT INTO `number_type` (`id`, `name`, `shortname`) VALUES
(1, 'Захищена система обміну інформацією', 'ЗСОІ'),
(2, 'Мережа обміну службовою інформацією', 'МОСІ'),
(3, 'Єдина автоматизована телефонна мережа', 'Фарлеп');

-- --------------------------------------------------------

--
-- Структура таблиці `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `vendor` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `model` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `serial_number` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `subscriber_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `phone`
--

INSERT INTO `phone` (`id`, `vendor`, `model`, `serial_number`, `subscriber_id`) VALUES
(1, NULL, NULL, NULL, 1),
(2, NULL, NULL, NULL, 1),
(3, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `subscriber`
--

CREATE TABLE `subscriber` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп даних таблиці `subscriber`
--

INSERT INTO `subscriber` (`id`, `name`, `address`) VALUES
(1, 'Сененко Віталій Іванович', NULL),
(2, 'Загребельний Василь Петрович', NULL),
(3, 'Побережний Степан Васильович', NULL),
(4, 'Кісь Петро Іванович', NULL);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `number`
--
ALTER TABLE `number`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_id` (`phone_id`),
  ADD KEY `number_type_fk` (`type`);

--
-- Індекси таблиці `number_type`
--
ALTER TABLE `number_type`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriber_fk` (`subscriber_id`);

--
-- Індекси таблиці `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `number`
--
ALTER TABLE `number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблиці `number_type`
--
ALTER TABLE `number_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `number`
--
ALTER TABLE `number`
  ADD CONSTRAINT `number_ibfk_1` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `number_ibfk_2` FOREIGN KEY (`type`) REFERENCES `number_type` (`id`) ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`subscriber_id`) REFERENCES `subscriber` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
