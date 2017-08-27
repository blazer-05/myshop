-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 03 2017 г., 11:30
-- Версия сервера: 5.5.41-log
-- Версия PHP: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `myshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add Категория', 7, 'add_category'),
(20, 'Can change Категория', 7, 'change_category'),
(21, 'Can delete Категория', 7, 'delete_category'),
(22, 'Can add product', 8, 'add_product'),
(23, 'Can change product', 8, 'change_product'),
(24, 'Can delete product', 8, 'delete_product');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$Gpc75W5R2FaN$PNoVVePhYDs6Kbyp/Wcv5yiy8NRIoTKEbNkuCsh7stA=', '2017-06-26 06:31:56', 1, 'admin', '', '', 'admin@mail.ru', 1, 1, '2017-06-26 05:28:07');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-06-26 06:53:31', '1', 'Одежда', 1, '[{"added": {}}]', 7, 1),
(2, '2017-06-26 06:53:36', '1', 'Черная куртка', 1, '[{"added": {}}]', 8, 1),
(3, '2017-06-26 10:32:25', '1', 'Черная куртка', 2, '[{"changed": {"fields": ["image"]}}]', 8, 1),
(4, '2017-06-26 10:34:40', '2', 'Куртки', 1, '[{"added": {}}]', 7, 1),
(5, '2017-06-26 10:34:54', '1', 'Черная куртка', 2, '[{"changed": {"fields": ["category"]}}]', 8, 1),
(6, '2017-06-26 10:35:18', '1', 'Одежда', 3, '', 7, 1),
(7, '2017-06-26 11:07:56', '1', 'Черная куртка', 2, '[{"changed": {"fields": ["description"]}}]', 8, 1),
(8, '2017-06-26 11:21:55', '2', 'Кожаная куртка на подстежке 48р.', 1, '[{"added": {}}]', 8, 1),
(9, '2017-06-26 11:32:17', '3', 'Плащ,Кожаная куртка,черно-бурая лиса', 1, '[{"added": {}}]', 8, 1),
(10, '2017-06-26 11:34:39', '4', 'Куртка кожаная женская', 1, '[{"added": {}}]', 8, 1),
(11, '2017-06-26 11:35:05', '1', 'Черная куртка', 2, '[{"changed": {"fields": ["available"]}}]', 8, 1),
(12, '2017-06-26 11:35:24', '1', 'Черная куртка', 2, '[{"changed": {"fields": ["available"]}}]', 8, 1),
(13, '2017-06-26 11:51:19', '3', 'Лопаты', 1, '[{"added": {}}]', 7, 1),
(14, '2017-06-26 11:54:17', '5', 'PPTV KING7', 1, '[{"added": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'shop', 'category'),
(8, 'shop', 'product');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-06-26 05:24:56'),
(2, 'auth', '0001_initial', '2017-06-26 05:24:58'),
(3, 'admin', '0001_initial', '2017-06-26 05:24:59'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-06-26 05:24:59'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-06-26 05:24:59'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-06-26 05:24:59'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-06-26 05:24:59'),
(8, 'auth', '0004_alter_user_username_opts', '2017-06-26 05:24:59'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-06-26 05:25:00'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-06-26 05:25:00'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-06-26 05:25:00'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-06-26 05:25:00'),
(13, 'sessions', '0001_initial', '2017-06-26 05:25:00'),
(14, 'shop', '0001_initial', '2017-06-26 06:29:46');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9tv9irrvn1zhtig76u5dncw3yh47pl7o', 'ODc2ZWUzZjE1NDhmNDQ0MzA2NGY3Yjk0NzVjNWRkZTFmNTRlODc2Mjp7ImNhcnQiOnt9LCJfYXV0aF91c2VyX2hhc2giOiI5OGM5NGQ4YzczMDI4YjQ2ODg3MWMwZWZiYmFhMTg2MzI1YzY4N2VlIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2017-07-17 07:53:22'),
('f3rc2c6jlov66umiv2cc2e2kyheenepn', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 07:54:10'),
('gkfbxkzm6oo4mm36z5flbak9jl2fn2l5', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 05:53:24'),
('pf8d1mmqi1bpffz8pb0pg3k1himbg1jn', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 08:24:42'),
('so5b3yv14lf4o7azafdfogfnkyeva349', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 05:59:59'),
('thrmu4qq914jav93fvo1x64itsfzffdl', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 07:11:12'),
('w3l3nxtdjir8zw6nmmqjunas6nzmild4', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 07:50:08');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category`
--

CREATE TABLE IF NOT EXISTS `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_category_name_11b68823` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `shop_category`
--

INSERT INTO `shop_category` (`id`, `name`, `slug`) VALUES
(2, 'Куртки', 'kurtki'),
(3, 'Лопаты', 'lopaty');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product`
--

CREATE TABLE IF NOT EXISTS `shop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_id_slug_68aad32e_idx` (`id`,`slug`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  KEY `shop_product_name_b8d5e94c` (`name`),
  KEY `shop_product_slug_30bd2d5d` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `shop_product`
--

INSERT INTO `shop_product` (`id`, `name`, `slug`, `image`, `description`, `price`, `stock`, `available`, `created`, `updated`, `category_id`) VALUES
(1, 'Черная куртка', 'chernaya-kurtka', 'products/17/06/26/t-yv01-gray-2.jpg', 'Кожаная куртка французской фирмы Azzaro. Сделана из овечьей кожи высшей категории. В отличном состоянии. Размер 50-52.', '3000.00', 15, 1, '2017-06-26 06:53:36', '2017-06-26 11:35:24', 2),
(2, 'Кожаная куртка на подстежке 48р.', 'kozhanaya-kurtka-na-podstezhke-48r', 'products/17/06/26/kozhanaya-kurtka-na-podstezhke.jpg', 'Женская кожаная куртка на подстежке в отличном состоянии 48р.', '3000.00', 1, 1, '2017-06-26 11:21:55', '2017-06-26 11:21:55', 2),
(3, 'Плащ,Кожаная куртка,черно-бурая лиса', 'plashkozhanaya-kurtkacherno-buraya-lisa', 'products/17/06/26/plaschkozhanaya-kurtkacherno-buraya-lisa-lugansk.jpg', 'Куртка кожаная 2 в 1.Отстегивается низ.Размер 48-50.Воротник ,рукава черно-бурая лиса. Подкладка на молнии.', '4000.00', 2, 1, '2017-06-26 11:32:17', '2017-06-26 11:32:17', 2),
(4, 'Куртка кожаная женская', 'kurtka-kozhanaya-zhenskaya', 'products/17/06/26/kurtka-kozhanaya-zhenskaya-lugansk_rev002.jpg', 'Кожаная куртка с капюшоном и дополнительной подстежкой(при необходимости отстегивается). Размер 48-50. Состояние хорошее', '3200.00', 1, 1, '2017-06-26 11:34:39', '2017-06-26 11:34:39', 2),
(5, 'PPTV KING7', 'pptv-king7', 'products/17/06/26/pptv_king_7s_1.jpg', 'PPTV – один из сильных конкурентов LeTV на китайском рынке платформ для стримминга видео. И как только LeTV вышла на рынок смартфонов, аналогичные планы появились у PPTV. На днях компания провела пресс-конференцию в Пекине, в рамках которой показала свои первые смартфоны – King 7 и King 7S. Оба смартфона получили 6" Quad HD-экраны, однако у King 7S панель может демонстрировать 3D-контент, для просмотра которого не нужны очки. Используется технология RSPT-MC 3D, направляющая картинку с одних рядов пикселей в один глаз, а с других – в другой. При этом наилучший эффект 3D создаётся при расстоянии от экрана до глаз 32 см. Дисплей является единственным отличием смартфонов (точнее, есть ещё одно: King 7S на 0,3 мм толще из-за конструкции дисплея), однако именно он определяет разницу цен. PPTV King 7 стоит 2199 юаней (23,5 тысячи рублей), а King 7S – 2699 юаней (29 тысяч рублей).', '7500.00', 1, 1, '2017-06-26 11:54:17', '2017-06-26 11:54:17', 3);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_product`
--
ALTER TABLE `shop_product`
  ADD CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
