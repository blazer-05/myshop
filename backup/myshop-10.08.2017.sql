-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 10 2017 г., 13:54
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

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
(24, 'Can delete product', 8, 'delete_product'),
(25, 'Can add Заказ', 9, 'add_order'),
(26, 'Can change Заказ', 9, 'change_order'),
(27, 'Can delete Заказ', 9, 'delete_order'),
(28, 'Can add order item', 10, 'add_orderitem'),
(29, 'Can change order item', 10, 'change_orderitem'),
(30, 'Can delete order item', 10, 'delete_orderitem'),
(31, 'Can add PayPal IPN', 11, 'add_paypalipn'),
(32, 'Can change PayPal IPN', 11, 'change_paypalipn'),
(33, 'Can delete PayPal IPN', 11, 'delete_paypalipn');

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
(1, 'pbkdf2_sha256$36000$Gpc75W5R2FaN$PNoVVePhYDs6Kbyp/Wcv5yiy8NRIoTKEbNkuCsh7stA=', '2017-08-09 11:40:41', 1, 'admin', '', '', 'admin@mail.ru', 1, 1, '2017-06-26 05:28:07');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

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
(14, '2017-06-26 11:54:17', '5', 'PPTV KING7', 1, '[{"added": {}}]', 8, 1),
(15, '2017-07-03 09:54:31', '1', 'Заказ: 1', 1, '[{"added": {}}, {"added": {"object": "1", "name": "order item"}}]', 9, 1),
(16, '2017-07-03 09:54:52', '1', 'Заказ: 1', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(17, '2017-07-03 09:55:20', '1', 'Заказ: 1', 2, '[{"deleted": {"object": "None", "name": "order item"}}]', 9, 1),
(18, '2017-07-03 09:55:28', '1', 'Заказ: 1', 3, '', 9, 1),
(19, '2017-07-03 10:44:31', '1', 'Заказ: 1', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(20, '2017-07-03 10:44:41', '1', 'Заказ: 1', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(21, '2017-07-04 13:08:15', '4', 'Телефоны', 1, '[{"added": {}}]', 7, 1),
(22, '2017-07-04 13:08:34', '5', 'PPTV KING7', 2, '[{"changed": {"fields": ["category"]}}]', 8, 1),
(23, '2017-07-04 13:09:03', '3', 'Лопаты', 3, '', 7, 1),
(24, '2017-07-05 05:28:26', '3', 'Заказ: 3', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(25, '2017-07-05 05:28:49', '3', 'Заказ: 3', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(26, '2017-07-07 05:43:55', '11', 'Заказ: 11', 3, '', 9, 1),
(27, '2017-07-07 05:43:55', '10', 'Заказ: 10', 3, '', 9, 1),
(28, '2017-07-07 05:43:55', '9', 'Заказ: 9', 3, '', 9, 1),
(29, '2017-07-07 05:43:55', '8', 'Заказ: 8', 3, '', 9, 1),
(30, '2017-07-07 05:43:55', '7', 'Заказ: 7', 3, '', 9, 1),
(31, '2017-07-07 05:43:55', '6', 'Заказ: 6', 3, '', 9, 1),
(32, '2017-07-07 05:43:55', '5', 'Заказ: 5', 3, '', 9, 1),
(33, '2017-07-07 05:43:55', '4', 'Заказ: 4', 3, '', 9, 1),
(34, '2017-07-07 05:43:55', '3', 'Заказ: 3', 3, '', 9, 1),
(35, '2017-07-07 05:43:55', '2', 'Заказ: 2', 3, '', 9, 1),
(36, '2017-07-07 05:43:55', '1', 'Заказ: 1', 3, '', 9, 1),
(37, '2017-07-07 07:14:18', '13', 'Заказ: 13', 3, '', 9, 1),
(38, '2017-07-07 07:14:18', '12', 'Заказ: 12', 3, '', 9, 1),
(39, '2017-07-07 08:29:36', '15', 'Заказ: 15', 3, '', 9, 1),
(40, '2017-07-07 08:29:36', '14', 'Заказ: 14', 3, '', 9, 1),
(41, '2017-07-07 08:56:52', '1', 'Заказ: 1', 3, '', 9, 1),
(42, '2017-07-07 08:58:12', '2', 'Заказ: 2', 3, '', 9, 1),
(43, '2017-07-07 09:25:48', '3', 'Заказ: 3', 3, '', 9, 1),
(44, '2017-07-07 09:28:54', '1', 'Заказ: 1', 3, '', 9, 1),
(45, '2017-07-07 09:30:13', '2', 'Заказ: 2', 3, '', 9, 1),
(46, '2017-07-07 09:39:10', '3', 'Заказ: 3', 3, '', 9, 1),
(47, '2017-07-07 09:40:01', '4', 'Заказ: 4', 3, '', 9, 1),
(48, '2017-07-07 09:41:26', '5', 'Заказ: 5', 3, '', 9, 1),
(49, '2017-07-08 11:58:16', '1', 'Заказ: 1', 3, '', 9, 1),
(50, '2017-07-10 05:33:05', '2', 'Заказ: 2', 3, '', 9, 1),
(51, '2017-07-10 05:37:56', '4', 'Заказ: 4', 3, '', 9, 1),
(52, '2017-07-10 05:37:56', '3', 'Заказ: 3', 3, '', 9, 1),
(53, '2017-07-10 07:50:21', '5', 'Заказ: 5', 3, '', 9, 1),
(54, '2017-07-10 08:09:18', '1', 'Заказ: 1', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(55, '2017-07-10 08:09:42', '1', 'Заказ: 1', 3, '', 9, 1),
(56, '2017-07-10 08:17:47', '3', 'Заказ: 3', 3, '', 9, 1),
(57, '2017-07-10 08:17:47', '2', 'Заказ: 2', 3, '', 9, 1),
(58, '2017-07-10 08:20:23', '1', 'Заказ: 1', 3, '', 9, 1),
(59, '2017-07-10 09:24:48', '2', 'Заказ: 2', 3, '', 9, 1),
(60, '2017-07-10 09:24:48', '1', 'Заказ: 1', 3, '', 9, 1),
(61, '2017-07-10 09:30:17', '3', 'Заказ: 3', 3, '', 9, 1),
(62, '2017-07-10 10:08:47', '1', 'Заказ: 1', 3, '', 9, 1),
(63, '2017-07-10 11:13:08', '2', 'Заказ: 2', 3, '', 9, 1),
(64, '2017-07-10 13:47:08', '5', 'PPTV KING7', 2, '[{"changed": {"fields": ["available"]}}]', 8, 1),
(65, '2017-07-10 13:47:36', '5', 'PPTV KING7', 2, '[{"changed": {"fields": ["available"]}}]', 8, 1),
(66, '2017-07-10 14:20:08', '4', 'Заказ: 4', 3, '', 9, 1),
(67, '2017-07-10 14:20:08', '3', 'Заказ: 3', 3, '', 9, 1),
(68, '2017-07-12 06:08:09', '5', 'Заказ: 5', 3, '', 9, 1),
(69, '2017-07-12 10:11:10', '1', 'Заказ: 1', 3, '', 9, 1),
(70, '2017-07-12 11:29:21', '1', 'Заказ: 1', 3, '', 9, 1),
(71, '2017-07-12 14:14:17', '2', 'Заказ: 2', 3, '', 9, 1),
(72, '2017-07-13 06:14:34', '2', 'Заказ: 2', 3, '', 9, 1),
(73, '2017-07-13 06:14:34', '1', 'Заказ: 1', 3, '', 9, 1),
(74, '2017-07-13 06:31:11', '3', 'Заказ: 3', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(75, '2017-07-14 16:48:37', '4', 'Заказ: 4', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(76, '2017-07-22 09:09:13', '6', 'Заказ: 6', 3, '', 9, 1),
(77, '2017-07-22 09:09:13', '5', 'Заказ: 5', 3, '', 9, 1),
(78, '2017-07-22 09:09:13', '4', 'Заказ: 4', 3, '', 9, 1),
(79, '2017-07-22 09:09:13', '3', 'Заказ: 3', 3, '', 9, 1),
(80, '2017-07-22 09:10:50', '7', 'Заказ: 7', 3, '', 9, 1),
(81, '2017-07-22 09:15:13', '1', 'Заказ: 1', 3, '', 9, 1),
(82, '2017-07-22 09:40:20', '3', 'Заказ: 3', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(83, '2017-07-22 09:40:27', '2', 'Заказ: 2', 2, '[{"changed": {"fields": ["paid"]}}]', 9, 1),
(84, '2017-07-22 09:41:13', '3', 'Заказ: 3', 3, '', 9, 1),
(85, '2017-07-22 09:41:13', '2', 'Заказ: 2', 3, '', 9, 1),
(86, '2017-07-22 09:45:30', '1', 'Заказ: 1', 3, '', 9, 1),
(87, '2017-07-22 09:48:35', '1', 'Заказ: 1', 3, '', 9, 1),
(88, '2017-08-09 12:22:51', '6', 'Модный телефон', 1, '[{"added": {}}]', 8, 1),
(89, '2017-08-10 10:04:19', '2', 'Куртки', 2, '[{"changed": {"fields": ["description"]}}]', 7, 1),
(90, '2017-08-10 10:04:37', '4', 'Телефоны', 2, '[{"changed": {"fields": ["description"]}}]', 7, 1),
(91, '2017-08-10 10:25:43', '4', 'Телефоны', 2, '[{"changed": {"fields": ["description"]}}]', 7, 1),
(92, '2017-08-10 10:41:43', '5', 'PPTV KING7', 2, '[{"changed": {"fields": ["desc_category"]}}]', 8, 1),
(93, '2017-08-10 10:50:23', '2', 'Кожаная куртка на подстежке 48р.', 2, '[{"changed": {"fields": ["desc_category"]}}]', 8, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'ipn', 'paypalipn'),
(9, 'orders', 'order'),
(10, 'orders', 'orderitem'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

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
(14, 'shop', '0001_initial', '2017-06-26 06:29:46'),
(15, 'shop', '0002_auto_20170703_1132', '2017-07-03 08:32:59'),
(16, 'orders', '0001_initial', '2017-07-03 08:32:59'),
(17, 'ipn', '0001_initial', '2017-07-05 07:45:56'),
(18, 'ipn', '0002_paypalipn_mp_id', '2017-07-05 07:45:57'),
(19, 'ipn', '0003_auto_20141117_1647', '2017-07-05 07:45:57'),
(20, 'ipn', '0004_auto_20150612_1826', '2017-07-05 07:46:02'),
(21, 'ipn', '0005_auto_20151217_0948', '2017-07-05 07:46:02'),
(22, 'ipn', '0006_auto_20160108_1112', '2017-07-05 07:46:03'),
(23, 'ipn', '0007_auto_20160219_1135', '2017-07-05 07:46:03'),
(24, 'shop', '0003_category_description', '2017-08-10 10:03:15'),
(25, 'shop', '0004_product_desc_category', '2017-08-10 10:40:14');

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
('05biueev83z89v3yqj9xbsb1wkw0pway', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-20 22:41:21'),
('0q7dcymgn3nepbtuy90z6zidn8uil1xh', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 07:49:08'),
('0qd3jdbtlrizaabyyes898eyatl69tjj', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-08 20:28:14'),
('13f2clvgx4c8bi471prc4f2m44d0ewon', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-17 01:27:05'),
('16dvjn90lmowc6ht7y6xttiafaah7yta', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 12:49:23'),
('1fnvifms9gjyt4qg6qqwdf6025ii36ha', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-22 00:46:27'),
('1fr6zpxdzgkpgwjg6vcy1oycpok9vnra', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 05:06:49'),
('1ftcz5x61yk5bhiliyc3g5xpzje8zzq1', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-22 00:46:29'),
('1x7ozza9l9uok3l6labeth7wn3pzosfm', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-15 19:55:08'),
('1y5pl9fvpkb5it1himj4odys41uf14i5', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-17 04:08:30'),
('23drtb88gvoc33ywjyvjrbbbb3aeqw16', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-21 07:31:19'),
('24exqdway3ewnbk0o6lurxsqr5xhplt5', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-10 20:38:17'),
('285gkmlmon9uhibljsbsdch5gm12eowq', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-03 04:59:01'),
('2d9h9bat5jfur4nea0fmjc04l4q7ujbz', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:43'),
('2k8smusqyu1saf3vam96n907yelki91b', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 04:35:41'),
('2yk4vzjc8f727oj19u7hw4oabf1vr2xq', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 21:14:07'),
('2ym898z7sj56crdcnhzw3c8mbourilzq', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 07:06:48'),
('2yrsg88b7f1l3b9equ0nb383j6jsrm0q', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 16:52:06'),
('307sguvo8x0naqkyaj8n5mo9t84vs0p8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-18 07:01:18'),
('324tcc1t7odwhix2khcuvfxb0x7dd0uh', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:22'),
('375xk1jqkq58rwpp1gj7slcoxj1l9prr', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-05 22:21:20'),
('3bjlsrts5kabivkq0gwe8v533srqc17w', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-17 04:08:32'),
('3denqrcd18m0xwp9o51bcoos3rjmwtds', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 05:06:48'),
('3mwk1bjj0zpkpwriwk2g8i07zlo4agmh', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 04:55:05'),
('3qcgwjczlnl4mf4p6kszryyen4aesq2b', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 00:05:21'),
('3zn3o6u6y23xcwrjwfg1ghi97waa7qw9', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 21:26:33'),
('44qi99hc0lzqpodq2tcdubgk47vf0lh1', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 07:31:53'),
('479ae5n7ym8c8x7ptayz1j6iygnep30c', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-17 04:08:21'),
('47sxez3vkespjndlmyb9bd2qxf8k9pq2', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 05:14:18'),
('47w1ip1gy4i9jonj6l4fovsi2bd2fs8v', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 07:19:51'),
('4bagge8j1rl3g5avwj8l3vgw3xbqor8c', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:43'),
('4c6inq6mudw2cvzb3cp0s8g30oyg3gj8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-05 12:03:21'),
('4cvt3pi9gjzw1caxssh9366ukfubxtn8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-03 05:54:53'),
('4ddut7t5xsuuozd046q0zyna77h8v0rt', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 04:15:56'),
('4h7ve07a8rpx464xcd7u3w9ii1v16vuu', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 04:35:32'),
('4psohsrkhbulx9ol9oqql1w619pkb7yf', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 04:34:12'),
('4tl90ygewgd7b4zssmxsjw4cx3vgmpim', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-20 02:24:59'),
('540p14i1af6vdwvrk3ftsxczg1mepqn5', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-22 00:46:25'),
('5dt8utsemelhf0g07gj673c6dwbzqpuz', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 16:46:12'),
('5f5v4o7mgbnex1l1qm8abwn5nhqdzpuk', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:43'),
('5z4rcfe3kfinj7fof6d5yewefhvryoi6', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-01 19:10:42'),
('63hohg3cg6oewxyn8v8l4ng8ls5epf7q', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 07:49:09'),
('6774cl439ag9e8zyzlxk5do3x0mqa0sj', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 00:23:56'),
('6nqrc9hejzyoignl632m0s8trleiip3k', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 11:12:04'),
('6o32k2epexd7wi8ym8fctih1tuy8tpal', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 05:06:48'),
('6o7h2taohjwbmbgdzoghl1rukxb4v64n', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-19 09:03:05'),
('6sod08ii0cwq5k11bkbr0fcfegzbqkyd', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:22'),
('777w3afxuk6qd7jornobj6d07go9g75a', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 06:35:14'),
('7fgzioowo20ur0h9uak34malpy92iz51', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-01 10:08:26'),
('7junpiu3rtv7fd8dc86yuenk7uwu8nqc', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-08 14:03:01'),
('7li4rhgf9pyvkea125lyzk8ljepb4h1w', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-10 20:38:17'),
('80pknykl8dbu8werjitrsa244ss6x9ka', 'NjYxZTFhZmYwYWVlNTA0ZjUxYmIxNzBjZGE1MTI5NjY4OTI5NDE3ZDp7Im9yZGVyX2lkIjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijk4Yzk0ZDhjNzMwMjhiNDY4ODcxYzBlZmJiYWExODYzMjVjNjg3ZWUiLCJfYXV0aF91c2VyX2lkIjoiMSIsImNhcnQiOnt9fQ==', '2017-07-24 09:28:26'),
('82xe7fcq1nnum5f6c2nq5hbc5s1z71p4', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 04:30:56'),
('8buahktjrerxbnhw1klv9hkfmttc25yq', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-16 01:56:05'),
('8e3im3morcj5wyxw189h7xqfmsp8op8e', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 11:05:09'),
('8k91l7gnd370mfrp0xacdk34clb9j598', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-18 09:37:08'),
('8wtr53wxczx1btmgvxtbatxreaji6htu', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-19 16:50:46'),
('8wwjpapesauaroa9t1m3mcwc20h6dj0v', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-19 06:03:32'),
('93hrgjdzsuz04552ieks29jeynwjlmlm', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 11:05:43'),
('94uuwugvjjxvq9ieiiuat7o94jo4ksf7', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-15 16:20:17'),
('97r1iuxy9aqar2rj4ya906b7q5gofbvd', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 13:12:53'),
('97z9l4qobnpem0f2njxud6sowi1lxdwa', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-01 16:00:59'),
('993lieup8qv7yamx5filexhchn6ad4q0', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:50:12'),
('9gx2m6qpiygpvo93xe57z65yh0j26dca', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-08 13:49:42'),
('9icxf9hkklhkmorqas9o30781c1ypmdu', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-12 09:41:14'),
('9idpmx9m18up0y7i33ii2k0ytzx6luf9', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 08:21:25'),
('9kg8dvkxjz0lh1z74mvorh9a21c4rxau', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 08:26:28'),
('9louaxr4wc60m1d2978vda2fkgd9u014', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 10:58:59'),
('abllmnw47yrgu9km8v6fv04ven6txcyo', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 18:58:37'),
('aez42zee08ny6h9xoxzadddrbu99bfxs', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-19 06:22:01'),
('b5wwtcmelz3vwmk5h0eer3i5z3djgzou', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 07:20:02'),
('bbf8tiqs1rzhffddrs39wqb2mfjmxi1a', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-06 09:46:12'),
('c26pwxh1pg6859tyt8k5vmkbuf1gy4g0', 'MjkxYjVmMDlkMDM5ZTUyMjFmZjBmMmRjNjI5N2MwZmMwNzdmM2I2NDp7Im9yZGVyX2lkIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6Ijk4Yzk0ZDhjNzMwMjhiNDY4ODcxYzBlZmJiYWExODYzMjVjNjg3ZWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNhcnQiOnsiMyI6eyJwcmljZSI6IjQwMDAuMDAiLCJxdWFudGl0eSI6M319fQ==', '2017-08-15 15:09:31'),
('c27dmxzr1ln6dchgw99gpfbi1pv4yo5a', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-10 07:14:37'),
('cifbff6tuce7s3hvcr5r4nlkm8ny53hs', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 02:53:32'),
('cmub0egtrom9wr17922zm6t5tw9y51wn', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-01 03:54:37'),
('con7b2caod6xvq2ci3lagb0q3p79m2ww', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-17 04:08:30'),
('cseazyznzxqjnikpujqfp3bjzd0wpkm6', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 21:57:40'),
('dew50wqzud28rzecz9t9cztqvjx2yd11', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-03 05:58:30'),
('dr6c4q858ts1qtcqc6kkcicyl34ys07j', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 23:47:36'),
('ebwtyowvi7g90awv7lcotzd6t7g8a0g3', 'YmQwMzZhMDIyYmZiNzk4ZmE5Y2EzZDliOWU5ZjAzZjRjMzQ0NTNjNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOThjOTRkOGM3MzAyOGI0Njg4NzFjMGVmYmJhYTE4NjMyNWM2ODdlZSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiY2FydCI6e319', '2017-07-26 18:36:27'),
('ekkbo98t2dq4vy1itgx3wo41zjmj92ge', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-01 10:49:21'),
('epwapoivc9nw7nxqlb5a36daoa1lc0et', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 05:14:24'),
('eucq0os2yu2rg2ipxs5g8e8ghrfbya66', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 00:33:19'),
('f34r4br3c9nmrcn7vcl8beck1fwucnfz', 'YWQ2ODQ3NTE0YTNkNmVjNmMwODczNGNhNWM3MmNlZmI1ZTU5YzhkNjp7ImNhcnQiOnsiMiI6eyJwcmljZSI6IjMwMDAuMDAiLCJxdWFudGl0eSI6MX19LCJfYXV0aF91c2VyX2hhc2giOiI5OGM5NGQ4YzczMDI4YjQ2ODg3MWMwZWZiYmFhMTg2MzI1YzY4N2VlIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2017-08-24 07:12:05'),
('f3rc2c6jlov66umiv2cc2e2kyheenepn', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 07:54:10'),
('f6idrh9zs34yl72s96lppj18nsm4dhpg', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 10:40:43'),
('f6we18p99posfrmrsgz7ph899ko4jwec', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 10:53:09'),
('f994et2gx79eybtd1qbzlzsy8de3fnzk', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-24 03:53:35'),
('fb6w1op7j9nneoph7nfxpe4bgz84z571', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 03:57:29'),
('fhx2flngfc2t7ih519otfl1zpqjs67et', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:21'),
('fsy4p060e0xtzqhb26xlhhegk2r6306x', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 17:50:20'),
('fxwiryojw8e75z9tnfpvx7g4uzyfp1n4', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 07:31:56'),
('fyr36ahabh6bk4tyqxqabod2lw6ox2qn', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 13:31:55'),
('g2h2z7jm531x5hymxejg4do9xagtpz4w', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 06:35:10'),
('gkfbxkzm6oo4mm36z5flbak9jl2fn2l5', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 05:53:24'),
('gq6lbtnyp30pe1bifx4g85amk5u570ee', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 06:27:53'),
('gv0h68eywtm2zdp73eqa6cfg0oaedxo6', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 06:35:11'),
('gyzuvgmabw11abhwvofo02mn6y4qz1dn', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-24 10:54:31'),
('h72c6tk8w2zoihq3qnl14q5dv6h7s520', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 08:52:29'),
('hm63cgp4edtdd8vuod4aur14cybb77e8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 05:06:48'),
('hno322lk734j6bqymlkgczjw2xf4dmis', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-24 09:45:37'),
('ho4vw6qb5dwqdf9f6bgqnywrhy72pyzr', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-19 06:55:24'),
('hoctbjw0rhkshbqvsgzfwzzaux6twd0w', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-18 16:44:09'),
('hola2eg0nhrb9ikedh6y16jqreq5oaou', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:43'),
('hpcgur7y524dw9e35mik30618xr6hu37', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 17:41:26'),
('hzx3luegb4oaqrmdqfuoa2xqwlljpkww', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-27 07:19:18'),
('i3spdpnia79ktezg79bnk9lnusxjujnt', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 20:54:58'),
('iabx7nvn7usvu82yczu4gxlkn5e4fv20', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-15 16:40:29'),
('iedd5a657095fh4cl0td40nohawbrytl', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-22 16:43:58'),
('ioi7s25vsok5tjnwb6d4aobmo2hn4tt3', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-23 20:40:33'),
('iurxgyldzs1jvwzysphmvvsglbnxs6e3', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-27 04:55:58'),
('ivh8d3241eyhj8vexmoh3gxcm53wzl82', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 06:45:36'),
('j10qoelor95dnlvzwi15cekx35noxvbs', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:46'),
('j98c4y62p78e86lf94jjkb2s7l71qpra', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-27 05:11:12'),
('jaimo655qlomf2q1ijel0kkqj8ianso1', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-03 16:04:33'),
('jazshwk4rfmq7h1t1gvtgd950ev9eawk', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:20'),
('jeo7cn6i90rhea3i15i2f8td8ovobj88', 'ZDNjZGY3MThjMzQyODIxYWIzOTk3ODJkODg1YTBlMGUzOWYzNWJmZDp7ImNhcnQiOnsiNSI6eyJwcmljZSI6Ijc1MDAuMDAiLCJxdWFudGl0eSI6MX19fQ==', '2017-08-23 15:23:40'),
('jrtncvqxbhgmkbaon95s3884tbos3zk8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-03 05:31:50'),
('jtpx9hr3kgaqgdw53fimmgkc3vkbbs0f', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-05 22:57:08'),
('jut5ga01kexl0lgpqn0squui9klsx227', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 04:30:52'),
('jxw6vah4vzr44tqu75bte9bimamtexzo', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-24 03:51:50'),
('k763lfmgagie7mw0upzm2edzan1q89j9', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-15 16:34:51'),
('kg522jfwpgnrb99nddnkcjj1u9ugd1wb', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-05 05:38:43'),
('kgarlpbmzo5r9f7mwkyqf7l9qo2uclj8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 04:34:13'),
('ktp5eb1xtqchsanxftyerhmlt09fzzi0', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 13:31:56'),
('ku2i8f433foi6zv08saoufb8bjxfw88s', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 07:49:08'),
('l07r07on4tsb2hujtkz8h5808sis7el3', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 02:49:34'),
('l4ip6m6sp4qnhdv895yx7piolg4q24z7', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 13:10:09'),
('la0gxpyzksudcmn1d8k9y823mc7mgcb9', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-10 20:38:17'),
('lly0zjw0b5kawidmq31gdv9jtvlvoyyi', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 07:09:52'),
('lw82ng0oweygh2kka4hhpu0wsi1ui97v', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 00:21:22'),
('m3d07a6xt7whdpvjbghkdtvjbgkbo6j4', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-18 19:08:30'),
('m7wchndyzaeb6f9oechi0su4lzx4l0tj', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:22'),
('mwm852rmf1437pk13sh5ud806kxvnjbp', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 10:53:10'),
('mxj774lb83k4bfyenp4p75f49hwa0rj8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 04:35:35'),
('mynez89bii04ye9cv9uk8wrwi9q7ujhv', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 07:30:30'),
('n4tijhxcuierx8typy2pitaftb1jhn01', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:43'),
('nbee5mhgnsf13c2elx9q946if5cwd2w3', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 04:22:17'),
('ndinbn62rsp6xr6p4yh9n4cb3a2eo8x2', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 15:08:25'),
('ndmib7natbdli27suife5l8h3nd7iz1o', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:22'),
('neez2eksahm8gu7ub7xvpnc8h32lfcm6', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 11:24:40'),
('nen0x2372vw3fg94bce7r4qz0ymfksor', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-17 04:08:17'),
('ngruu3fjcx48b0dhi5m9ufdhtg2goupg', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-31 18:52:03'),
('nnw0ht25ywrhzow71j15z8v43d1m6j9p', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-21 06:54:23'),
('o0obwikhy70gnh505qy8x6nof6ln0gcq', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 10:53:08'),
('o6e57teftfxf7pl73qr0o2atods1vhqf', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:52'),
('odcdhpebhclxzp2nh15izx1wrvusa7ys', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-23 21:40:17'),
('oeih70jgtsziuoe7k4e937la0wyilnrr', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:43'),
('orpb62q8zfw4kluq51tctlhbwo0q3o7i', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 13:49:09'),
('ov2heht4gpvrotjy3g8qxa1k7n3b7bg1', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-22 10:14:14'),
('ovhqh2nm510s8t1djkbghfny744cwpkd', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 11:46:57'),
('oxchrpvilb8rilqw23cu856dwlgjlpm4', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:21'),
('p144jjhxfbeqsx42sgajn2tnuh0gruwp', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 04:30:59'),
('p20vbfzmkh79wlh817ohceog27l4si2m', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 10:03:39'),
('p2k3xcxgbjl96cl2eic50gziupja7s6h', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:51:11'),
('p65k1du1f3chv0j9m8raxmal2tgolg46', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-27 07:19:10'),
('p6wrvv2yohqs91nfrxlp511zzuqzkfrk', 'ZTA1MWE1ZGE3MmE0OTQ5YTQwYzRjZTQzYTgyOGIzYjc5OGIxZGFiYTp7Im9yZGVyX2lkIjo0LCJjYXJ0Ijp7fSwiX2F1dGhfdXNlcl9oYXNoIjoiOThjOTRkOGM3MzAyOGI0Njg4NzFjMGVmYmJhYTE4NjMyNWM2ODdlZSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-07-30 14:51:55'),
('p7dgb895kr84l501h7jkerki6gs78tsm', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-10 10:43:52'),
('pcc3ksbstm054i4wgsmb9d6u5vsyc5na', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-26 12:21:20'),
('pf8d1mmqi1bpffz8pb0pg3k1himbg1jn', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 08:24:42'),
('pgqe7sk8kvkjwwotsnufkv0l6r9ar2zg', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 10:04:41'),
('piairh1g0f3wozdlh8jjokcrsdwg5d0w', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-05 01:27:37'),
('pl269joh6l0pfny5jszj7o58nalm91qf', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 23:01:50'),
('pnr8kxapn3b4huujvhlf597l4dtfa0uh', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 07:19:53'),
('pq05r0eoemmppejz3acocuj57zbn8qtp', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 06:23:56'),
('pr32ebpurhs7k1oip6hm1rw434wt817x', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-26 06:44:48'),
('puxy9qug4zugrf7rdqgw4wq6797z09fa', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 02:24:30'),
('q84ksy629fugptmqpmjgg5opy5n9qa1g', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:22'),
('qhm412xa9522qfdbe328pb1oezu64rvl', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-15 16:14:05'),
('qjnrnn7gozui7vfb6nxbprpobrrbf389', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-17 04:08:19'),
('qkdpjh77s1ttg1kw6zsw14yx0fmm9p50', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 07:08:56'),
('qm3ovgss6xxoklbsa3hoflsfvjrz57oo', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-10 20:38:17'),
('qmqttljf2g7hyisz8ka2r15udfoia9at', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 12:15:44'),
('qpexv8q9v5w866btt13e7bcxdh0diyrr', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 05:14:24'),
('r264r61so6iwwywycmt3jaul6e9khhl6', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-03 13:38:14'),
('r2804najl4b1ggfocexiop0nt0wzl6q9', 'ODc2ZWUzZjE1NDhmNDQ0MzA2NGY3Yjk0NzVjNWRkZTFmNTRlODc2Mjp7ImNhcnQiOnt9LCJfYXV0aF91c2VyX2hhc2giOiI5OGM5NGQ4YzczMDI4YjQ2ODg3MWMwZWZiYmFhMTg2MzI1YzY4N2VlIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2017-07-24 09:24:47'),
('r4gdv9hrlqjir7av13ijj3mmzb8xk20y', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-05 09:32:39'),
('rcowoac5qbytbz20yjwntt6hpehh235v', 'ZDNjZGY3MThjMzQyODIxYWIzOTk3ODJkODg1YTBlMGUzOWYzNWJmZDp7ImNhcnQiOnsiNSI6eyJwcmljZSI6Ijc1MDAuMDAiLCJxdWFudGl0eSI6MX19fQ==', '2017-08-24 07:10:32'),
('rgmw88qy5u1z8nw900wk18q1k8v5lnso', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 05:31:57'),
('rlkikgb5iq7sclfvbgb0m87ea4pb934h', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 10:26:10'),
('rqkzbew0cen6oy225xuyxv4bpnhoqstg', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 06:45:36'),
('rru6j2sqjvu0ypksaby6ulpni3pm7dkm', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 07:31:57'),
('rst74dsitz77gjuvist4uhoq6s162zqn', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 23:20:20'),
('rwh95ie8u3qcohnvp6ipvz9jzc44pill', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-01 12:41:55'),
('s958xlgkctd0ef2jwyfbw5ra439g4fmc', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-24 02:55:14'),
('si5csl6dxqxrha2v44njjc8nfkoma3sy', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 04:35:41'),
('st36vh77ytxspnzx9zskkhru63y5amtu', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-12 09:32:54'),
('thrmu4qq914jav93fvo1x64itsfzffdl', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 07:11:12'),
('tjkbin8h95qybjsw7tnv8fwo5cv5ncjr', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-15 16:23:32'),
('tt3etnq3g4htth2g1u4z67bx6s090aox', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 05:06:48'),
('tv554znq2tud57zcn9g7dgv2nd61njow', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-18 02:14:31'),
('tvtnb1utg7xkjciksxq653s0grwt11h7', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-10 20:38:18'),
('txe50zahjteffs1eg08wfm0jymey76an', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:20'),
('u0cna71ghf4z01hyvw16yxp98nk1u0o4', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 03:58:15'),
('u6urf1fljicjt5l7jzhi9cabed67haw8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 23:06:56'),
('uaq2t0yq0yrupwsmke56y9lprvvtzvqd', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 08:52:05'),
('uns3uc05c4lhfbji4bu3gr53gs0rzmjh', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-26 03:31:37'),
('urfmjngz3ywphe8zq6wo0ormhgkuymf4', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-05 22:52:32'),
('uykkqnv7vnj3dfy01mao85bx1ktibtkk', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 07:49:09'),
('v1pcudj3ugqdg77ufc83gi5sp4qqweta', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-20 02:25:12'),
('vj382myvd7tq5dgjj5zlbfyxc0b32x6u', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-24 18:21:29'),
('vjqjo4cxuocsd0f0z6u66g2j8hlztue6', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 07:19:55'),
('vtcxt6mi2r11sbo7r8u8kuxf63h1cvby', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 02:30:10'),
('vvlo95dkcviar7j5rtogbotloj6oqkgv', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-31 23:32:58'),
('vygsz0c314jsoie6845h9lxyd4gwbszv', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 06:45:33'),
('vz8itvzhu3jta9udteh8w7jxi95jzd57', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 23:16:48'),
('wckn0rro88i4xs2nbdvch0k8izmiqi81', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-26 08:22:18'),
('wczlle07rd0dbq02e12cvsd65nhzfkvk', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-19 14:49:43'),
('we0tb7wl1p9t1u55okqhn8s1p5i5jr51', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 16:52:06'),
('wubmz35e7iztrba3b22t71wb1jd6y821', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-02 20:39:39'),
('wxsrb0cpsymtupcxrwzmngy0422myq80', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-11 07:12:22'),
('wxusoinj3jycqbbvm4ytu74awwqnqjrg', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 14:37:55'),
('x11qmboqva929bczzadqddtgf6i5b3cw', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 10:53:08'),
('x3m93m09ey63f78d11i31fty67qu4tyv', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 05:14:22'),
('x7n6lrq8bvqmpla651363hmsaua8r9tz', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-04 04:35:31'),
('xeevxvry18grneucbyfkxqeqhxlb36wl', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-15 16:26:24'),
('xhy1ktaec96a4ma5dd0vxkxsymf4y6xo', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-26 23:19:41'),
('xilmv1qov0gi6rvcif7942pwixn6r0n7', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-17 13:50:38'),
('xpl64imu3nxz6k1rpd4sz3h71582i7hh', 'ZDNjZGY3MThjMzQyODIxYWIzOTk3ODJkODg1YTBlMGUzOWYzNWJmZDp7ImNhcnQiOnsiNSI6eyJwcmljZSI6Ijc1MDAuMDAiLCJxdWFudGl0eSI6MX19fQ==', '2017-08-15 15:56:04'),
('xqa4czo0hcxobu2n5xctzg84285tu2lg', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-17 04:08:22'),
('xu6ny8lcerwbzihihpexdnj4q8eiw5aj', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-09 05:14:24'),
('y2747wc6hgx61feacfg0p8wf55mxkasy', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-01 18:07:33'),
('y2tmnx1a1cfi3gqfgl84ra8aob2rb7gl', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 00:17:08'),
('y7zcczgcnqnyy056gsn1jmuutxw6po61', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-23 06:45:32'),
('yb16isowdy37kdrx3pgct0dd7q9qdejw', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 02:04:07'),
('yhtrys72qp00hp1s53mxm6oq3vi6ljed', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-20 23:11:53'),
('yszkmot81vm1ftkjzpvtalbn20432s6g', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 05:02:59'),
('z342h8lljr9ncqo8vg6gjhtk4quf22dq', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-31 19:21:48'),
('z6gh50njap4kn56xnsqrw97h22f57v3u', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-05 05:34:25'),
('z7q3za8dqquzfzi3ck1iwekfm15gylp7', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 10:53:08'),
('zdap6ckarfe5lgo6ft7y6op4t82huz7t', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-25 06:35:08'),
('zddqhf0stmld53ygm294eji1c207h3nm', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 00:03:14'),
('ze733lt0mir1ownn767c0s1shcsgcjpa', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-18 07:01:00'),
('zeimxvgtdxi5diy35ud235zre76eo6ru', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-24 04:58:40'),
('zh5cat1aho377w8kczb7cfamt28amia8', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-22 21:49:11'),
('zp9uzz8h1zht9sedj46x9nia6jhl35ri', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-07-21 07:31:57'),
('zpknl7021yugczgojhnl5mvy6rfp50gw', 'Mjg4Y2M1NmRkNmY1NzQzOTU5MzVkMWY3MzdhMGQ0ZjhlYWYwZTVkOTp7ImNhcnQiOnt9fQ==', '2017-08-15 16:31:28');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_order`
--

CREATE TABLE IF NOT EXISTS `orders_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `addres` varchar(200) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `city` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `update` datetime NOT NULL,
  `paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `orders_orderitem`
--

CREATE TABLE IF NOT EXISTS `orders_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  KEY `orders_orderitem_product_id_afe4254a_fk_shop_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `paypal_ipn`
--

CREATE TABLE IF NOT EXISTS `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime DEFAULT NULL,
  `subscr_date` datetime DEFAULT NULL,
  `subscr_effective` datetime DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category`
--

CREATE TABLE IF NOT EXISTS `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_category_name_11b68823` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `shop_category`
--

INSERT INTO `shop_category` (`id`, `name`, `slug`, `description`) VALUES
(2, 'Куртки', 'kurtki', 'Самые модные куртки 2017 года!'),
(4, 'Телефоны', 'telefony', 'Турецкая полиция задержала выходца из России Рената Бакиева — предполагаемого боевика террористической группировки ИГИЛ, которого подозревают в подготовке атаки на американский военный самолет, сообщает газета Sabah.\r\n\r\nПо данным издания, полиция обнаружила переписку Бакиева в Telegram с другим членом ИГИЛ*. Речь шла о покупке беспилотника, с помощью которого он собирался атаковать самолет ВВС США на авиабазе Инджирлик на юге Турции. Как сообщили источники издания, задержанный проводил разведку в этом районе на арендованном велосипеде.\r\n\r\nВ российском посольстве в Анкаре РИА Новости сообщили, что уточняют данные о задержании Бакиева.\r\n\r\nСообщается, что ранее Бакиева уже задерживали в Турции при попытке перейти границу с Сирией, после чего депортировали из страны, но ему снова удалось вернуться.\r\n\r\nИсточник: http://rusvesna.su/news/1502359398');

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
  `desc_category` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_id_slug_68aad32e_idx` (`id`,`slug`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  KEY `shop_product_name_b8d5e94c` (`name`),
  KEY `shop_product_slug_30bd2d5d` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `shop_product`
--

INSERT INTO `shop_product` (`id`, `name`, `slug`, `image`, `description`, `price`, `stock`, `available`, `created`, `updated`, `category_id`, `desc_category`) VALUES
(1, 'Черная куртка', 'chernaya-kurtka', 'products/17/06/26/t-yv01-gray-2.jpg', 'Кожаная куртка французской фирмы Azzaro. Сделана из овечьей кожи высшей категории. В отличном состоянии. Размер 50-52.', '3000.00', 15, 1, '2017-06-26 06:53:36', '2017-06-26 11:35:24', 2, ''),
(2, 'Кожаная куртка на подстежке 48р.', 'kozhanaya-kurtka-na-podstezhke-48r', 'products/17/06/26/kozhanaya-kurtka-na-podstezhke.jpg', 'Женская кожаная куртка на подстежке в отличном состоянии 48р.', '3000.00', 1, 1, '2017-06-26 11:21:55', '2017-08-10 10:50:23', 2, 'qwerty'),
(3, 'Плащ,Кожаная куртка,черно-бурая лиса', 'plashkozhanaya-kurtkacherno-buraya-lisa', 'products/17/06/26/plaschkozhanaya-kurtkacherno-buraya-lisa-lugansk.jpg', 'Куртка кожаная 2 в 1.Отстегивается низ.Размер 48-50.Воротник ,рукава черно-бурая лиса. Подкладка на молнии.', '4000.00', 2, 1, '2017-06-26 11:32:17', '2017-06-26 11:32:17', 2, ''),
(4, 'Куртка кожаная женская', 'kurtka-kozhanaya-zhenskaya', 'products/17/06/26/kurtka-kozhanaya-zhenskaya-lugansk_rev002.jpg', 'Кожаная куртка с капюшоном и дополнительной подстежкой(при необходимости отстегивается). Размер 48-50. Состояние хорошее', '3200.00', 1, 1, '2017-06-26 11:34:39', '2017-06-26 11:34:39', 2, ''),
(5, 'PPTV KING7', 'pptv-king7', 'products/17/06/26/pptv_king_7s_1.jpg', 'PPTV – один из сильных конкурентов LeTV на китайском рынке платформ для стримминга видео. И как только LeTV вышла на рынок смартфонов, аналогичные планы появились у PPTV. На днях компания провела пресс-конференцию в Пекине, в рамках которой показала свои первые смартфоны – King 7 и King 7S. Оба смартфона получили 6" Quad HD-экраны, однако у King 7S панель может демонстрировать 3D-контент, для просмотра которого не нужны очки. Используется технология RSPT-MC 3D, направляющая картинку с одних рядов пикселей в один глаз, а с других – в другой. При этом наилучший эффект 3D создаётся при расстоянии от экрана до глаз 32 см. Дисплей является единственным отличием смартфонов (точнее, есть ещё одно: King 7S на 0,3 мм толще из-за конструкции дисплея), однако именно он определяет разницу цен. PPTV King 7 стоит 2199 юаней (23,5 тысячи рублей), а King 7S – 2699 юаней (29 тысяч рублей).', '7500.00', 1, 1, '2017-06-26 11:54:17', '2017-08-10 10:41:43', 4, 'Если нужно, то здесь будет описание для страницы с товарами!'),
(6, 'Модный телефон', 'modnyj-telefon', '', 'Самый модный телефон', '150.00', 5, 1, '2017-08-09 12:22:51', '2017-08-09 12:22:51', 4, '');

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
-- Ограничения внешнего ключа таблицы `orders_orderitem`
--
ALTER TABLE `orders_orderitem`
  ADD CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  ADD CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Ограничения внешнего ключа таблицы `shop_product`
--
ALTER TABLE `shop_product`
  ADD CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
