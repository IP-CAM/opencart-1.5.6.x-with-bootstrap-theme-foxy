-- --------------------------------------------------------
-- Сервер:                       127.0.0.1
-- Версія сервера:               5.5.32 - MySQL Community Server (GPL)
-- ОС сервера:                   Win32
-- HeidiSQL Версія:              8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for таблиця nsk_digital.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `template` text NOT NULL,
  `template_responsive` text NOT NULL,
  `template_wrapper` text NOT NULL,
  `template_wrapper_responsive` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Opencart menu manager by Teil(Yurii Krevnyi)';

-- Dumping data for table nsk_digital.menu: ~4 rows (приблизно)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `code`, `name`, `template`, `template_responsive`, `template_wrapper`, `template_wrapper_responsive`) VALUES
	(6, 'top_header_menu', 'О нас (header)', '&lt;li&gt;\r\n	&lt;a href=\'{{href}}\' target=\'{{target}}\' title=\'{{title}}\'&gt;{{name}}&lt;/a&gt;\r\n&lt;/li&gt;', '&lt;li&gt;\r\n	&lt;a href=\'{{href}}\' target=\'{{target}}\' title=\'{{title}}\'&gt;{{name}}&lt;/a&gt;\r\n&lt;/li&gt;', '&lt;ul class=\'noList menu-about\'&gt;{{content}}&lt;/ul&gt;', '&lt;ul&gt;{{content}}&lt;/ul&gt;'),
	(7, 'top_header_contacts', 'Контакты (header)', '&lt;span title=\'{{title}}\' class=\'{{self_class}}\'&gt;{{name}}&lt;/span&gt;', '', '&lt;div class=\'contacts\'&gt;{{content}}&lt;/div&gt;', ''),
	(8, 'main_menu', 'Верхнее меню', '&lt;li class=\'{{self_class}} has-children-{{num_children}}\'&gt;\r\n	&lt;a href=\'{{href}}\' target=\'{{target}}\' title=\'{{title}}\'&gt;\r\n		&lt;div class=\'image\'&gt;{{image}}&lt;/div&gt;\r\n		&lt;span class=\'title\'&gt;{{name}}&lt;/span&gt;\r\n		&lt;span class=\'price\'&gt;{{params}}&lt;/span&gt;\r\n	&lt;/a&gt;\r\n&lt;/li&gt;', '&lt;li&gt;\r\n	&lt;a href=\'{{href}}\' target=\'{{target}}\' title=\'{{title}}\'&gt;{{name}}&lt;/a&gt;\r\n&lt;/li&gt;', '&lt;ul class=\'noList\'&gt;{{content}}&lt;/ul&gt;', '&lt;ul&gt;{{content}}&lt;/ul&gt;'),
	(9, 'footer_about', 'О нас (footer)', '&lt;li&gt;\r\n	&lt;a href=\'{{href}}\' target=\'{{target}}\' title=\'{{title}}\'&gt;{{name}}&lt;/a&gt;\r\n&lt;/li&gt;', '', '&lt;ul class=\'noList\'&gt;{{content}}&lt;/ul&gt;', '');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Dumping structure for таблиця nsk_digital.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `href` text NOT NULL,
  `image` text NOT NULL,
  `params` text NOT NULL,
  `view_type` varchar(100) NOT NULL,
  `self_class` text NOT NULL,
  `parent` int(11) NOT NULL,
  `target` tinyint(1) NOT NULL,
  `sort_order` int(10) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  CONSTRAINT `FK__menu` FOREIGN KEY (`code`) REFERENCES `menu` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COMMENT='Menu manager by Teil(Yurii Krevnyi)\r\nChildren of menu table';

-- Dumping data for table nsk_digital.menu_items: ~44 rows (приблизно)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `code`, `href`, `image`, `params`, `view_type`, `self_class`, `parent`, `target`, `sort_order`, `type`, `created`) VALUES
	(188, 'top_header_menu', '/', '0', '/', 'link', '/', 0, 0, 1, 0, '2013-11-09 13:38:22'),
	(189, 'top_header_menu', '/', '0', '/', 'link', '/', 0, 0, 2, 0, '2013-11-09 13:38:22'),
	(190, 'top_header_menu', '/', '0', '/', 'link', '/', 0, 0, 3, 0, '2013-11-09 13:38:22'),
	(191, 'top_header_menu', '/', '0', '/', 'link', '/', 0, 0, 5, 0, '2013-11-09 13:50:05'),
	(192, 'top_header_menu', '', '', '', '', '', 0, 0, 0, 0, '2013-11-09 13:37:45'),
	(193, 'top_header_menu', '/', '0', '/', 'link', '/', 0, 0, 6, 0, '2013-11-09 13:38:22'),
	(194, 'top_header_contacts', '', '0', '', 'heading', '', 0, 0, 1, 0, '2013-11-09 13:46:29'),
	(195, 'top_header_contacts', '', '0', '', 'link', '', 0, 0, 2, 0, '2013-11-09 13:46:29'),
	(196, 'top_header_contacts', '', '0', '', 'heading', '', 0, 0, 3, 0, '2013-11-09 13:46:29'),
	(198, 'top_header_contacts', '', '0', '', 'link', '', 0, 0, 5, 0, '2013-11-09 13:46:29'),
	(199, 'top_header_contacts', '', '0', '', 'heading', '', 0, 0, 6, 0, '2013-11-09 13:46:29'),
	(200, 'top_header_contacts', '', '0', '', 'link', '', 0, 0, 7, 0, '2013-11-09 13:46:29'),
	(202, 'main_menu', '', '0', '', 'link', 'hot', 0, 0, 1, 0, '2013-11-09 13:54:47'),
	(203, 'main_menu', '', '0', '', 'link', 'hot', 0, 0, 2, 0, '2013-11-09 13:54:47'),
	(204, 'main_menu', '/', '0', '', 'link', '', 0, 0, 3, 0, '2013-11-09 13:54:47'),
	(205, 'main_menu', '/', '0', '', 'link', '', 0, 0, 4, 0, '2013-11-09 13:54:47'),
	(206, 'main_menu', '/', '0', '', 'heading', '', 205, 0, 5, 0, '2013-11-09 13:54:47'),
	(207, 'main_menu', '', '0', '', 'link', '', 206, 0, 6, 0, '2013-11-09 13:54:47'),
	(208, 'main_menu', '/', '0', '', 'link', '', 206, 0, 7, 0, '2013-11-09 13:54:47'),
	(209, 'main_menu', '', '0', '', 'link', '', 0, 0, 27, 0, '2013-11-09 14:28:08'),
	(210, 'main_menu', '', '0', '', 'heading', '', 205, 0, 9, 0, '2013-11-09 14:00:57'),
	(211, 'main_menu', '', '0', '', 'heading', '', 205, 0, 13, 0, '2013-11-09 14:05:18'),
	(212, 'main_menu', '', '0', '', 'link', '', 210, 0, 10, 0, '2013-11-09 14:00:57'),
	(213, 'main_menu', '', '0', '', 'link', '', 210, 0, 11, 0, '2013-11-09 14:00:57'),
	(214, 'main_menu', '', '0', '', 'link', '', 210, 0, 12, 0, '2013-11-09 14:00:57'),
	(215, 'main_menu', '', '0', '', 'link', '', 206, 0, 8, 0, '2013-11-09 14:00:57'),
	(216, 'main_menu', '', '0', '', 'link', '', 220, 0, 18, 0, '2013-11-09 14:05:18'),
	(217, 'main_menu', '', '0', '', 'heading', '', 205, 0, 15, 0, '2013-11-09 14:05:18'),
	(218, 'main_menu', '', '0', '', 'link', '', 217, 0, 16, 0, '2013-11-09 14:05:18'),
	(219, 'main_menu', '', '0', '', 'link', '', 211, 0, 14, 0, '2013-11-09 14:05:18'),
	(220, 'main_menu', '', '0', '', 'heading', '', 205, 0, 17, 0, '2013-11-09 14:05:18'),
	(221, 'main_menu', '', '0', '', 'heading', '', 205, 0, 19, 0, '2013-11-09 14:05:34'),
	(222, 'main_menu', '', '0', '', 'heading', '', 205, 0, 21, 0, '2013-11-09 14:05:39'),
	(223, 'main_menu', '', '0', '', 'link', '', 221, 0, 20, 0, '2013-11-09 14:05:18'),
	(224, 'main_menu', '', '0', '', 'link', '', 222, 0, 22, 0, '2013-11-09 14:05:18'),
	(225, 'main_menu', '/', 'data/product-menu-image.jpg', '30955 руб.', 'banner', '', 205, 0, 23, 0, '2013-11-09 14:32:31'),
	(226, 'main_menu', '', 'data/product-menu-image.jpg', '23480 руб.', 'banner', '', 205, 0, 24, 0, '2013-11-09 14:28:08'),
	(227, 'main_menu', '', 'data/product-menu-image.jpg', '23480 руб.', 'banner', '', 205, 0, 25, 0, '2013-11-09 14:31:03'),
	(228, 'main_menu', '', 'data/product-menu-image.jpg', '23480 руб.', 'banner', '', 205, 0, 26, 0, '2013-11-09 14:28:08'),
	(229, 'footer_about', '', '0', '', 'link', '', 0, 0, 1, 0, '2013-11-09 14:47:14'),
	(230, 'footer_about', '', '0', '', 'link', '', 0, 0, 2, 0, '2013-11-09 14:47:14'),
	(231, 'footer_about', '', '0', '', 'link', '', 0, 0, 3, 0, '2013-11-09 14:47:14'),
	(232, 'footer_about', '', '0', '', 'link', '', 0, 0, 4, 0, '2013-11-09 14:47:14'),
	(233, 'footer_about', '', '0', '', 'link', '', 0, 0, 5, 0, '2013-11-09 14:47:14');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;


-- Dumping structure for таблиця nsk_digital.menu_items_lang
CREATE TABLE IF NOT EXISTS `menu_items_lang` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_item_id` int(10) NOT NULL,
  `language_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_item_id` (`menu_item_id`),
  CONSTRAINT `FK_menu_items_lang_menu_items` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;

-- Dumping data for table nsk_digital.menu_items_lang: ~88 rows (приблизно)
DELETE FROM `menu_items_lang`;
/*!40000 ALTER TABLE `menu_items_lang` DISABLE KEYS */;
INSERT INTO `menu_items_lang` (`id`, `menu_item_id`, `language_id`, `name`, `title`) VALUES
	(113, 188, 1, 'О нас', 'О нас'),
	(114, 188, 2, 'О нас', 'О нас'),
	(115, 189, 1, 'Как купить', 'Как купить'),
	(116, 189, 2, 'Как купить', 'Как купить'),
	(117, 190, 1, 'Оплата', 'Оплата'),
	(118, 190, 2, 'Оплата', 'Оплата'),
	(119, 191, 1, 'Контакты', 'Контакты'),
	(120, 191, 2, 'Контакты', 'Контакты'),
	(121, 191, 1, 'Контакты', 'Контакты'),
	(122, 191, 2, 'Контакты', 'Контакты'),
	(123, 193, 1, 'Пресс-центр', 'Пресс-центр'),
	(124, 193, 2, 'Пресс-центр', 'Пресс-центр'),
	(125, 194, 1, 'Контакт-центр', 'Контакт-центр'),
	(126, 194, 2, 'Контакт-центр', 'Контакт-центр'),
	(127, 195, 1, 'с 9:00 до 21:00', 'с 9:00 до 21:00'),
	(128, 195, 2, 'с 9:00 до 21:00', 'с 9:00 до 21:00'),
	(129, 196, 1, '+7 (383) 299-66-55', '+7 (383) 299-66-55'),
	(130, 196, 2, '+7 (383) 299-66-55', '+7 (383) 299-66-55'),
	(133, 198, 1, 'Новосибирск', 'Новосибирск'),
	(134, 198, 2, 'Новосибирск', 'Новосибирск'),
	(135, 199, 1, '8-800-333-11-23', '8-800-333-11-23'),
	(136, 199, 2, '8-800-333-11-23', '8-800-333-11-23'),
	(137, 200, 1, 'Звонок по России бесплатный', 'Звонок по России бесплатный'),
	(138, 200, 2, 'Звонок по России бесплатный', 'Звонок по России бесплатный'),
	(141, 202, 1, 'Новинки', 'Новинки'),
	(142, 202, 2, 'Новинки', 'Новинки'),
	(143, 203, 1, 'Скидки', 'Скидки'),
	(144, 203, 2, 'Скидки', 'Скидки'),
	(145, 204, 1, 'Мобильные телефоны', 'Мобильные телефоны'),
	(146, 204, 2, 'Мобильные телефоны', 'Мобильные телефоны'),
	(147, 205, 1, 'Мобильные телефоны', 'Мобильные телефоны'),
	(148, 205, 2, 'Мобильные телефоны', 'Мобильные телефоны'),
	(149, 206, 1, 'Подкатегория1', 'Подкатегория1'),
	(150, 206, 2, 'Подкатегория1', 'Подкатегория1'),
	(151, 207, 1, 'demo1', 'demo1'),
	(152, 207, 2, 'demo1', 'demo1'),
	(153, 208, 1, 'demo1', 'demo1'),
	(154, 208, 2, 'demo1', 'demo1'),
	(155, 209, 1, 'Мобильные телефоны', 'Мобильные телефоны'),
	(156, 209, 2, 'Мобильные телефоны', 'Мобильные телефоны'),
	(157, 210, 1, 'Подкатегория2', 'Подкатегория2'),
	(158, 210, 2, 'Подкатегория2', 'Подкатегория2'),
	(159, 211, 1, 'Подкатегория3', 'Подкатегория3'),
	(160, 211, 2, 'Подкатегория3', 'Подкатегория3'),
	(161, 212, 1, 'demo1', 'demo1'),
	(162, 212, 2, 'demo1', 'demo1'),
	(163, 213, 1, 'demo1', 'demo1'),
	(164, 213, 2, 'demo1', 'demo1'),
	(165, 214, 1, 'demo1', 'demo1'),
	(166, 214, 2, 'demo1', 'demo1'),
	(167, 215, 1, 'demo1', 'demo1'),
	(168, 215, 2, 'demo1', 'demo1'),
	(169, 216, 1, 'demo1', 'demo1'),
	(170, 216, 2, 'demo1', 'demo1'),
	(171, 217, 1, 'Подкатегория4', 'Подкатегория4'),
	(172, 217, 2, 'Подкатегория4', 'Подкатегория4'),
	(173, 218, 1, 'demo1', 'demo1'),
	(174, 218, 2, 'demo1', 'demo1'),
	(175, 219, 1, 'demo1', 'demo1'),
	(176, 219, 2, 'demo1', 'demo1'),
	(177, 220, 1, 'Подкатегория5', 'Подкатегория5'),
	(178, 220, 2, 'Подкатегория5', 'Подкатегория5'),
	(179, 221, 1, 'Подкатегория6', 'Подкатегория6'),
	(180, 221, 2, 'Подкатегория6', 'Подкатегория6'),
	(181, 222, 1, 'Подкатегория7', 'Подкатегория7'),
	(182, 222, 2, 'Подкатегория7', 'Подкатегория7'),
	(183, 223, 1, 'demo1', 'demo1'),
	(184, 223, 2, 'demo1', 'demo1'),
	(185, 224, 1, 'demo1', 'demo1'),
	(186, 224, 2, 'demo1', 'demo1'),
	(187, 225, 1, 'Apple iPhone 5 64GB', 'Apple iPhone 5 64GB'),
	(188, 225, 2, 'Apple iPhone 5 64GB', 'Apple iPhone 5 64GB'),
	(189, 226, 1, 'Apple iPhone 5 64GB', 'Apple iPhone 5 64GB'),
	(190, 226, 2, 'Apple iPhone 5 64GB', 'Apple iPhone 5 64GB'),
	(191, 227, 1, 'Apple iPhone 4S 64GB', 'Apple iPhone 4S 64GB'),
	(192, 227, 2, 'Apple iPhone 4S 64GB', 'Apple iPhone 4S 64GB'),
	(193, 228, 1, 'Apple iPhone 4S 64GB', 'Apple iPhone 4S 64GB'),
	(194, 228, 2, 'Apple iPhone 4S 64GB', 'Apple iPhone 4S 64GB'),
	(195, 229, 1, 'demo', 'demo'),
	(196, 229, 2, 'demo', 'demo'),
	(197, 230, 1, 'demo', 'demo'),
	(198, 230, 2, 'demo', 'demo'),
	(199, 231, 1, 'demo', 'demo'),
	(200, 231, 2, 'demo', 'demo'),
	(201, 232, 1, 'demo', 'demo'),
	(202, 232, 2, 'demo', 'demo'),
	(203, 233, 1, 'demo', 'demo'),
	(204, 233, 2, 'demo', 'demo');
/*!40000 ALTER TABLE `menu_items_lang` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
