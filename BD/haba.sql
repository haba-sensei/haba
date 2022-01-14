-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla haba.communes
CREATE TABLE IF NOT EXISTS `communes` (
  `id_com` int(11) NOT NULL AUTO_INCREMENT,
  `id_reg` int(11) NOT NULL,
  `description` varchar(90) NOT NULL,
  `status` enum('A','I','trash') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_com`,`id_reg`),
  KEY `fk_communes_region_idx` (`id_reg`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla haba.communes: 9 rows
/*!40000 ALTER TABLE `communes` DISABLE KEYS */;
INSERT INTO `communes` (`id_com`, `id_reg`, `description`, `status`) VALUES
	(1, 1, 'San Isidro', 'A'),
	(2, 1, 'Miraflores', 'I'),
	(3, 1, 'Villa el salvador', 'trash'),
	(4, 2, 'Chisquilla', 'A'),
	(5, 2, 'Churuja', 'I'),
	(6, 2, 'Florida', 'trash'),
	(7, 3, 'Quequeña', 'A'),
	(8, 3, 'Pocsi', 'I'),
	(9, 3, 'Sachaca', 'trash');
/*!40000 ALTER TABLE `communes` ENABLE KEYS */;

-- Volcando estructura para tabla haba.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `dni` varchar(45) NOT NULL COMMENT 'Documento de Identidad',
  `id_reg` int(11) NOT NULL,
  `id_com` int(11) NOT NULL,
  `email` varchar(120) NOT NULL COMMENT 'Correo Electrónico',
  `name` varchar(45) NOT NULL COMMENT 'Nombre',
  `last_name` varchar(45) NOT NULL COMMENT 'Apellido',
  `address` varchar(255) DEFAULT NULL COMMENT 'Dirección',
  `date_reg` datetime NOT NULL COMMENT 'Fecha y hora del registro',
  `status` enum('A','I','trash') NOT NULL DEFAULT 'A' COMMENT 'estado del registro:\nA\r\n: Activo\nI : Desactivo\ntrash : Registro eliminado',
  PRIMARY KEY (`dni`,`id_reg`,`id_com`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_customers_communes1_idx` (`id_com`,`id_reg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla haba.customers: 3 rows
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`dni`, `id_reg`, `id_com`, `email`, `name`, `last_name`, `address`, `date_reg`, `status`) VALUES
	('123456782312', 1, 2, '3@gmail.com', 'jorge', 'acosta', NULL, '2022-01-13 10:44:25', 'trash');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Volcando estructura para tabla haba.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_datetime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `formatted` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `remote_addr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_level_index` (`level`),
  KEY `logs_channel_index` (`channel`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla haba.logs: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `message`, `context`, `level`, `level_name`, `channel`, `record_datetime`, `extra`, `formatted`, `remote_addr`, `user_agent`, `created_at`) VALUES
	(11, 'Acciones de borrado', '{"entrada":"1@gmail.com","status":"200"}', '100', 'DEBUG', 'local', '2022-01-14 02:03:48', '[]', '[2022-01-14 02:03:48] local.DEBUG: Acciones de borrado {"entrada":"1@gmail.com","status":"200"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:03:48'),
	(12, 'Acciones de consulta', '{"salida":"Cliente eliminado o inactivo , ","value":"1@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 02:09:11', '[]', '[2022-01-14 02:09:11] local.DEBUG: Acciones de consulta {"salida":"Cliente eliminado o inactivo , ","value":"1@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:09:11'),
	(13, 'Acciones de consulta', '{"entrada":"1@gmail.com","status":"200"}', '100', 'DEBUG', 'local', '2022-01-14 02:09:32', '[]', '[2022-01-14 02:09:32] local.DEBUG: Acciones de consulta {"entrada":"1@gmail.com","status":"200"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:09:32'),
	(14, 'Acciones de consulta', '{"entrada":"1@gmail.com","status":"200"}', '100', 'DEBUG', 'local', '2022-01-14 02:10:11', '[]', '[2022-01-14 02:10:11] local.DEBUG: Acciones de consulta {"entrada":"1@gmail.com","status":"200"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:10:11'),
	(15, 'Acciones de consulta', '{"entrada":"1@gmail.com","status":"200"}', '100', 'DEBUG', 'local', '2022-01-14 02:10:16', '[]', '[2022-01-14 02:10:16] local.DEBUG: Acciones de consulta {"entrada":"1@gmail.com","status":"200"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:10:16'),
	(16, 'Acciones de consulta', '{"salida":"Cliente eliminado o inactivo , ","value":"1@gmail2.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 02:10:37', '[]', '[2022-01-14 02:10:37] local.DEBUG: Acciones de consulta {"salida":"Cliente eliminado o inactivo , ","value":"1@gmail2.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:10:37'),
	(17, 'Acciones de registro', '{"salida":"The dni has already been taken. , The selected id reg is invalid. , The email has already been taken. , ","value":"87654321 - 2@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 02:11:06', '[]', '[2022-01-14 02:11:06] local.DEBUG: Acciones de registro {"salida":"The dni has already been taken. , The selected id reg is invalid. , The email has already been taken. , ","value":"87654321 - 2@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:11:06'),
	(18, 'Acciones de registro', '{"salida":"The email has already been taken. , ","value":"876543212 - 2@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 02:11:35', '[]', '[2022-01-14 02:11:35] local.DEBUG: Acciones de registro {"salida":"The email has already been taken. , ","value":"876543212 - 2@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:11:35'),
	(19, 'Acciones de registro', '{"salida":"The email has already been taken. , ","value":"8765432121 - 2@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 02:11:39', '[]', '[2022-01-14 02:11:39] local.DEBUG: Acciones de registro {"salida":"The email has already been taken. , ","value":"8765432121 - 2@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:11:39'),
	(20, 'Acciones de registro', '{"salida":"The dni has already been taken. , The email has already been taken. , ","value":"12345678 - 2@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 02:11:48', '[]', '[2022-01-14 02:11:48] local.DEBUG: Acciones de registro {"salida":"The dni has already been taken. , The email has already been taken. , ","value":"12345678 - 2@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:11:48'),
	(21, 'Acciones de registro', '{"salida":"The email has already been taken. , ","value":"123456782 - 2@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 02:11:52', '[]', '[2022-01-14 02:11:52] local.DEBUG: Acciones de registro {"salida":"The email has already been taken. , ","value":"123456782 - 2@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:11:52'),
	(22, 'Acciones de registro', '{"entrada":{"dni":"123456782312","id_reg":"1","id_com":"2","email":"3@gmail.com","name":"jorge","last_name":"acosta","address":null,"date_reg":"2022-01-13 10:44:25","status":"A"},"status":"200"}', '100', 'DEBUG', 'local', '2022-01-14 02:12:13', '[]', '[2022-01-14 02:12:13] local.DEBUG: Acciones de registro {"entrada":{"dni":"123456782312","id_reg":"1","id_com":"2","email":"3@gmail.com","name":"jorge","last_name":"acosta","address":null,"date_reg":"2022-01-13 10:44:25","status":"A"},"status":"200"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 02:12:13'),
	(23, 'Acciones de registro', '{"salida":"The dni has already been taken. , The email has already been taken. , ","value":"123456782312 - 3@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 03:39:27', '[]', '[2022-01-14 03:39:27] local.DEBUG: Acciones de registro {"salida":"The dni has already been taken. , The email has already been taken. , ","value":"123456782312 - 3@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:39:27'),
	(24, 'Acciones de registro', '{"entrada":{"dni":"123456782312","id_reg":"1","id_com":"2","email":"3@gmail.com","name":"jorge","last_name":"acosta","address":null,"date_reg":"2022-01-13 10:44:25","status":"A"},"status":"200"}', '100', 'DEBUG', 'local', '2022-01-14 03:41:12', '[]', '[2022-01-14 03:41:12] local.DEBUG: Acciones de registro {"entrada":{"dni":"123456782312","id_reg":"1","id_com":"2","email":"3@gmail.com","name":"jorge","last_name":"acosta","address":null,"date_reg":"2022-01-13 10:44:25","status":"A"},"status":"200"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:41:12'),
	(25, 'Acciones de registro', '{"salida":"The dni has already been taken. , The selected id reg is invalid. , The email has already been taken. , ","value":"123456782312 - 3@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 03:41:21', '[]', '[2022-01-14 03:41:21] local.DEBUG: Acciones de registro {"salida":"The dni has already been taken. , The selected id reg is invalid. , The email has already been taken. , ","value":"123456782312 - 3@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:41:21'),
	(26, 'Acciones de registro', '{"salida":"The selected id reg is invalid. , The email has already been taken. , ","value":"355212151 - 3@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 03:41:40', '[]', '[2022-01-14 03:41:40] local.DEBUG: Acciones de registro {"salida":"The selected id reg is invalid. , The email has already been taken. , ","value":"355212151 - 3@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:41:40'),
	(27, 'Acciones de registro', '{"salida":"The selected id reg is invalid. , ","value":"355212151 - 32@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 03:41:46', '[]', '[2022-01-14 03:41:46] local.DEBUG: Acciones de registro {"salida":"The selected id reg is invalid. , ","value":"355212151 - 32@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:41:46'),
	(28, 'Acciones de consulta', '{"salida":"Cliente eliminado o inactivo , ","value":"1@gmail2.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 03:52:11', '[]', '[2022-01-14 03:52:11] local.DEBUG: Acciones de consulta {"salida":"Cliente eliminado o inactivo , ","value":"1@gmail2.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:52:11'),
	(29, 'Acciones de consulta', '{"salida":"Cliente eliminado o inactivo , ","value":"1@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 03:52:16', '[]', '[2022-01-14 03:52:16] local.DEBUG: Acciones de consulta {"salida":"Cliente eliminado o inactivo , ","value":"1@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:52:16'),
	(30, 'Acciones de consulta', '{"entrada":"3@gmail.com","status":"200"}', '100', 'DEBUG', 'local', '2022-01-14 03:52:21', '[]', '[2022-01-14 03:52:21] local.DEBUG: Acciones de consulta {"entrada":"3@gmail.com","status":"200"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:52:21'),
	(31, 'Acciones de consulta', '{"salida":"Cliente eliminado o inactivo , ","value":"3@gmail.com2","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 03:55:42', '[]', '[2022-01-14 03:55:42] local.DEBUG: Acciones de consulta {"salida":"Cliente eliminado o inactivo , ","value":"3@gmail.com2","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:55:42'),
	(32, 'Acciones de borrado', '{"salida":"Registro no existe , ","value":"3@gmail.com2","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 03:59:03', '[]', '[2022-01-14 03:59:03] local.DEBUG: Acciones de borrado {"salida":"Registro no existe , ","value":"3@gmail.com2","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 03:59:03'),
	(33, 'Acciones de borrado', '{"entrada":"3@gmail.com","status":"200"}', '100', 'DEBUG', 'local', '2022-01-14 04:03:14', '[]', '[2022-01-14 04:03:14] local.DEBUG: Acciones de borrado {"entrada":"3@gmail.com","status":"200"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 04:03:14'),
	(34, 'Acciones de borrado', '{"salida":"Registro no existe , ","value":"4@gmail.com","status":"422"}', '100', 'DEBUG', 'local', '2022-01-14 04:04:40', '[]', '[2022-01-14 04:04:40] local.DEBUG: Acciones de borrado {"salida":"Registro no existe , ","value":"4@gmail.com","status":"422"} []\n', '192.168.1.10', 'Thunder Client (https://www.thunderclient.io)', '2022-01-14 04:04:40');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Volcando estructura para tabla haba.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla haba.migrations: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2022_01_14_013709_create_logs_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla haba.regions
CREATE TABLE IF NOT EXISTS `regions` (
  `id_reg` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(90) NOT NULL,
  `status` enum('A','I','trash') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_reg`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla haba.regions: 3 rows
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` (`id_reg`, `description`, `status`) VALUES
	(1, 'Lima', 'A'),
	(2, 'Amazonas', 'I'),
	(3, 'Arequipa', 'trash');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
