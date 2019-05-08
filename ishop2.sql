-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 08 2019 г., 15:02
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ishop2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group`
--

CREATE TABLE `attribute_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_group`
--

INSERT INTO `attribute_group` (`id`, `title`) VALUES
(1, 'Механизм'),
(2, 'Стекло'),
(3, 'Ремешок'),
(4, 'Корпус'),
(5, 'Индикация');

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_product`
--

CREATE TABLE `attribute_product` (
  `attr_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_product`
--

INSERT INTO `attribute_product` (`attr_id`, `product_id`) VALUES
(1, 1),
(1, 63),
(1, 64),
(2, 4),
(2, 5),
(2, 11),
(2, 15),
(2, 16),
(2, 17),
(2, 20),
(2, 21),
(2, 22),
(3, 12),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(4, 2),
(4, 3),
(4, 27),
(4, 28),
(5, 1),
(5, 4),
(5, 5),
(5, 12),
(5, 13),
(5, 63),
(5, 64),
(6, 2),
(6, 29),
(6, 30),
(6, 31),
(6, 32),
(6, 33),
(7, 3),
(7, 6),
(8, 1),
(9, 2),
(9, 14),
(10, 4),
(10, 5),
(10, 13),
(10, 63),
(10, 64),
(11, 7),
(11, 8),
(11, 9),
(11, 10),
(12, 1),
(14, 3),
(16, 1),
(16, 4),
(16, 5),
(19, 63),
(19, 64);

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `attr_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `value`, `attr_group_id`) VALUES
(1, 'Механика с автоподзаводом', 1),
(2, 'Механика с ручным заводом', 1),
(3, 'Кварцевый от батарейки', 1),
(4, 'Кварцевый от солнечного аккумулятора', 1),
(5, 'Сапфировое', 2),
(6, 'Минеральное', 2),
(7, 'Полимерное', 2),
(8, 'Стальной', 3),
(9, 'Кожаный', 3),
(10, 'Каучуковый', 3),
(11, 'Полимерный', 3),
(12, 'Нержавеющая сталь', 4),
(13, 'Титановый сплав', 4),
(14, 'Латунь', 4),
(15, 'Полимер', 4),
(16, 'Керамика', 4),
(17, 'Алюминий', 4),
(18, 'Аналоговые', 5),
(19, 'Цифровые', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `brand`
--

CREATE TABLE `brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'brand_no_image.jpg',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brand`
--

INSERT INTO `brand` (`id`, `title`, `alias`, `img`, `description`) VALUES
(1, 'Casio', 'casio', 'abt-1.jpg', 'In sit amet sapien eros Integer dolore magna aliqua'),
(2, 'Citizen', 'citizen', 'abt-2.jpg', 'In sit amet sapien eros Integer dolore magna aliqua'),
(3, 'Royal London', 'royal-london', 'abt-3.jpg', 'In sit amet sapien eros Integer dolore magna aliqua'),
(4, 'Seiko', 'seiko', 'seiko.png', NULL),
(5, 'Diesel', 'diesel', 'diesel.png', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `alias`, `parent_id`, `keywords`, `description`) VALUES
(1, 'Men', 'men', 0, 'Men', 'Men'),
(2, 'Women', 'women', 0, 'Women', 'Women'),
(3, 'Kids', 'kids', 0, 'Kids', 'Kids'),
(4, 'Электронные', 'elektronnye', 1, 'Электронные', 'Электронные'),
(5, 'Механические', 'mehanicheskie', 1, 'mehanicheskie', 'mehanicheskie'),
(6, 'Casio', 'casio', 4, 'Casio', 'Casio'),
(7, 'Citizen', 'citizen', 4, 'Citizen', 'Citizen'),
(8, 'Royal London', 'royal-london', 5, 'Royal London', 'Royal London'),
(9, 'Seiko', 'seiko', 5, 'Seiko', 'Seiko'),
(10, 'Epos', 'epos', 5, 'Epos', 'Epos'),
(11, 'Электронные', 'elektronnye-11', 2, 'Электронные', 'Электронные'),
(12, 'Механические', 'mehanicheskie-12', 2, 'Механические', 'Механические'),
(13, 'Adriatica', 'adriatica', 11, 'Adriatica', 'Adriatica'),
(14, 'Anne Klein', 'anne-klein', 12, 'Anne Klein', 'Anne Klein'),
(16, 'asdfasdf', 'asdfasdf', 0, 'asdfasd', 'asdfasdf'),
(17, 'asfasdf', 'asfasdf', 0, 'asdfdasf', 'asdfadf'),
(18, 'asdf', 'asdf', 0, 'asdf', 'adsf'),
(19, 'asdf', 'asdf-19', 0, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(10) NOT NULL,
  `symbol_right` varchar(10) NOT NULL,
  `value` float(15,2) NOT NULL,
  `base` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `title`, `code`, `symbol_left`, `symbol_right`, `value`, `base`) VALUES
(1, 'гривна', 'UAH', '', 'грн.', 25.80, '0'),
(2, 'доллар', 'USD', '$', '', 1.00, '1'),
(3, 'Евро', 'EUR', '€', '', 0.88, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `product_id`, `img`) VALUES
(1, 2, 's-1.jpg'),
(2, 2, 's-2.jpg'),
(3, 2, 's-3.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `modification`
--

CREATE TABLE `modification` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `modification`
--

INSERT INTO `modification` (`id`, `product_id`, `title`, `price`) VALUES
(1, 1, 'Silver', 300),
(2, 1, 'Black', 300),
(3, 1, 'Dark Black', 305),
(4, 1, 'Red', 310),
(5, 2, 'Silver', 80),
(6, 2, 'Red', 70);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `date`, `update_at`, `currency`, `note`) VALUES
(1, 1, '0', '2019-05-02 06:24:14', NULL, 'USD', '');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `qty`, `title`, `price`) VALUES
(1, 1, 38, 1, 'sad', 111),
(2, 1, 50, 1, 'sdfsdf', 111);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `content` text,
  `price` float NOT NULL DEFAULT '0',
  `old_price` float NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no_image.jpg',
  `hit` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `alias`, `content`, `price`, `old_price`, `status`, `keywords`, `description`, `img`, `hit`) VALUES
(1, 6, 'Casio MRP-700-1AVEF', 'casio-mrp-700-1avef', NULL, 300, 0, 2, NULL, NULL, 'p-1.png', 1),
(2, 6, 'Casio MQ-24-7BUL', 'casio-mq-24-7bul', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>\n\n                                            <p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>', 70, 80, 2, NULL, NULL, 'p-2.png', 2),
(3, 6, 'Casio GA-1000-1AER', 'casio-ga-1000-1aer', NULL, 400, 0, 2, NULL, NULL, 'p-3.png', 2),
(4, 7, 'Citizen JP1010-00E', 'citizen-jp1010-00e', NULL, 400, 0, 2, NULL, NULL, 'p-4.png', 2),
(5, 7, 'Citizen BJ2111-08E', 'citizen-bj2111-08e', NULL, 500, 0, 2, NULL, NULL, 'p-5.png', 2),
(6, 7, 'Citizen AT0696-59E', 'citizen-at0696-59e', NULL, 350, 355, 2, NULL, NULL, 'p-6.png', 2),
(7, 6, 'Q&Q Q956J302Y', 'q-and-q-q956j302y', NULL, 20, 0, 2, NULL, NULL, 'p-7.png', 2),
(8, 6, 'Royal London 41040-01', 'royal-london-41040-01', NULL, 90, 0, 2, NULL, NULL, 'p-8.png', 2),
(9, 6, 'Royal London 20034-02', 'royal-london-20034-02', NULL, 110, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(10, 6, 'Royal London 41156-02', 'royal-london-41156-02', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>\n\n                                            <p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>', 100, 0, 2, NULL, NULL, 'no_image.jpg', 2),
(11, 3, 'Тестовый товар', 'testovyy-tovar', 'контент...', 10, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(12, 7, 'Часы 1', 'chasy-1', NULL, 100, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(13, 7, 'Часы 2', 'chasy-2', NULL, 105, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(14, 7, 'Часы 3', 'chasy-3', NULL, 110, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(15, 7, 'Часы 4', 'chasy-4', NULL, 115, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(16, 7, 'Часы 5', 'chasy-5', NULL, 115, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(17, 7, 'Часы 6', 'chasy-6', NULL, 120, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(20, 7, 'Часы 7', 'chasy-7', NULL, 120, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(21, 7, 'Часы 8', 'chasy-8', NULL, 120, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(22, 7, 'Часы 9', 'chasy-9', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(23, 7, 'Часы 10', 'chasy-10', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(24, 7, 'Часы 11', 'chasy-11', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(25, 7, 'Часы 12', 'chasy-12', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(26, 7, 'Часы 13', 'chasy-13', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(27, 7, 'Часы 14', 'chasy-14', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(28, 7, 'Часы 15', 'chasy-15', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(29, 7, 'Часы 16', 'chasy-16', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(30, 7, 'Часы 17', 'chasy-17', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(31, 7, 'Часы 18', 'chasy-18', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(32, 7, 'Часы 19', 'chasy-19', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(33, 7, 'Часы 20', 'chasy-20', NULL, 125, 0, 2, NULL, NULL, 'no_image.jpg', 1),
(34, 1, 'css ,hnml', 'asDASD', '<p>sad</p>\r\n', 111, 11, 1, 'asd', 'asd', 'no_image.jpg', 1),
(38, 8, 'sad', 'ASDAdADafs', '', 111, 1, 1, 'sdf', 'sdf', 'no_image.jpg', 1),
(43, 8, 'sad', 'aDadadasd', '', 111, 1, 1, 'sdf', 'sdf', 'no_image.jpg', 1),
(44, 1, 'sad', 'wadasdaSD', '', 111, 1, 1, 'sdf', 'sdf', 'no_image.jpg', 1),
(47, 1, 'sdfsdf', '', '', 111, 1, 1, 'xz', '11', 'no_image.jpg', 1),
(49, 1, 'sdfsdf', '', '', 111, 1, 1, 'xz', '11', 'no_image.jpg', 1),
(50, 1, 'sdfsdf', 'sdfsdf', '', 111, 1, 1, 'xz', '11', 'no_image.jpg', 1),
(51, 1, 'sad', 'sad', '', 111, 1, 1, 'sdf', 'sdf', 'no_image.jpg', 1),
(52, 1, 'sdfsdf', 'sdfsdf-52', '<p>adfsa</p>\r\n', 111, 1, 1, 'asd', '11', 'no_image.jpg', 1),
(53, 3, 'sdf', 'sdf', '<p>asd</p>\r\n', 1, 2, 1, 'sdf', 's', 'no_image.jpg', 0),
(54, 1, 'css ,hnml', 'css-hnml', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(55, 1, 'css ,hnml', 'css-hnml-55', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(56, 1, 'css ,hnml', 'css-hnml-56', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(57, 1, 'css ,hnml', 'css-hnml-57', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(58, 1, 'css ,hnml', 'css-hnml-58', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(59, 1, 'css ,hnml', 'css-hnml-59', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(60, 1, 'css ,hnml', 'css-hnml-60', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(61, 1, 'css ,hnml', 'css-hnml-61', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(62, 1, 'css ,hnml', 'css-hnml-62', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(63, 1, 'css ,hnml', 'css-hnml-63', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(64, 1, 'css ,hnml', 'css-hnml-64', '<p>sdafafd</p>\r\n', 111, 1, 1, 'asd', 'asd', 'no_image.jpg', 0),
(65, 1, 'werewr', 'werewr', '', 11, 11, 1, 'werewr', 'wqerwer', 'no_image.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `related_product`
--

CREATE TABLE `related_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `related_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `related_product`
--

INSERT INTO `related_product` (`product_id`, `related_id`) VALUES
(1, 2),
(1, 5),
(2, 5),
(2, 10),
(5, 1),
(5, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `name`, `address`, `role`) VALUES
(1, 'Artem', '$2y$10$jQVD.zHKuwlfsZkLKD/tY.nyaDB7Hm5JjLcsBXM/fuS.uZXbI31KO', 'admin@admin.com', 'Артем', '123321', 'admin'),
(2, 'admin', '$2y$10$58..OZJ/oZxSjKbeR5EhpOA7oRB0.t0bcqNZtm8.G5glPfpo0DnNa', 'artemgiant@gmail.com', 'dfg', '1', 'admin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`attr_id`,`product_id`);

--
-- Индексы таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD KEY `attr_group_id` (`attr_group_id`);

--
-- Индексы таблицы `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modification`
--
ALTER TABLE `modification`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `related_product`
--
ALTER TABLE `related_product`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `modification`
--
ALTER TABLE `modification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
