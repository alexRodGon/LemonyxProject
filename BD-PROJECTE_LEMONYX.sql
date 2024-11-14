-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.11.3-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para projectelemonyx
CREATE DATABASE IF NOT EXISTS `projectelemonyx` /*!40100 DEFAULT CHARACTER SET utf16 COLLATE utf16_spanish_ci */;
USE `projectelemonyx`;

-- Volcando estructura para tabla projectelemonyx.actors
CREATE TABLE IF NOT EXISTS `actors` (
  `id_actor` int(11) NOT NULL AUTO_INCREMENT,
  `nom_actor` varchar(50) NOT NULL,
  `nacionalitat` varchar(30) NOT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.actors: ~0 rows (aproximadamente)
DELETE FROM `actors`;

-- Volcando estructura para tabla projectelemonyx.actuen
CREATE TABLE IF NOT EXISTS `actuen` (
  `id_actor` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `protagonista` tinyint(1) NOT NULL,
  KEY `id_actor` (`id_actor`),
  KEY `id_produccio` (`id_produccio`),
  CONSTRAINT `actuen_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id_actor`),
  CONSTRAINT `actuen_ibfk_2` FOREIGN KEY (`id_produccio`) REFERENCES `pelicules` (`id_produccio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.actuen: ~0 rows (aproximadamente)
DELETE FROM `actuen`;

-- Volcando estructura para tabla projectelemonyx.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `DNI` varchar(9) DEFAULT NULL,
  `edat_data_naixement` date NOT NULL,
  `adreça` varchar(50) DEFAULT NULL,
  `nacionalitat` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `num_tarjeta` varchar(16) DEFAULT NULL,
  `num_compte_banc` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.clients: ~3 rows (aproximadamente)
DELETE FROM `clients`;
INSERT INTO `clients` (`id_client`, `Nom`, `DNI`, `edat_data_naixement`, `adreça`, `nacionalitat`, `email`, `telefon`, `num_tarjeta`, `num_compte_banc`) VALUES
	(25, 'prova', '78100497H', '2001-11-08', NULL, NULL, 'ericamon@gmail.com', '3243245345', '7842478754244875', NULL),
	(26, 'alex ', '123456789', '2007-07-07', NULL, NULL, 'euovwehvieivo@gmail.com', '516616161 ', '262199449494 ', NULL),
	(27, 'rengoku', '12345658T', '2009-08-09', NULL, NULL, 'regnokuren@gamil.com', '1234567891', '1234567891', NULL);

-- Volcando estructura para tabla projectelemonyx.compte
CREATE TABLE IF NOT EXISTS `compte` (
  `id_compte` int(11) NOT NULL AUTO_INCREMENT,
  `usuari` varchar(50) NOT NULL,
  `contrassenya` varchar(50) NOT NULL,
  `data_alta` date NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_modalitat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_compte`),
  KEY `compte_ibfk_1` (`id_client`),
  KEY `compte_ibfk_2` (`id_modalitat`),
  CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compte_ibfk_2` FOREIGN KEY (`id_modalitat`) REFERENCES `modalitat` (`id_modalitat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.compte: ~3 rows (aproximadamente)
DELETE FROM `compte`;
INSERT INTO `compte` (`id_compte`, `usuari`, `contrassenya`, `data_alta`, `id_client`, `id_modalitat`) VALUES
	(7, 'prova', '1234', '2023-05-10', 25, 3),
	(8, 'eric', '1234 ', '2023-05-17', 26, 2),
	(9, 'rengoku', '1234', '2023-05-19', 27, 1);

-- Volcando estructura para tabla projectelemonyx.director
CREATE TABLE IF NOT EXISTS `director` (
  `id_director` int(11) NOT NULL AUTO_INCREMENT,
  `nom_director` varchar(50) NOT NULL,
  `nacionalitat` varchar(30) NOT NULL,
  PRIMARY KEY (`id_director`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.director: ~0 rows (aproximadamente)
DELETE FROM `director`;

-- Volcando estructura para tabla projectelemonyx.dirigeix_episodi
CREATE TABLE IF NOT EXISTS `dirigeix_episodi` (
  `id_director` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `id_episodi` int(11) NOT NULL,
  `protagonista` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_director`,`id_produccio`,`id_episodi`),
  KEY `id_produccio` (`id_produccio`,`id_episodi`),
  CONSTRAINT `dirigeix_episodi_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`),
  CONSTRAINT `dirigeix_episodi_ibfk_2` FOREIGN KEY (`id_produccio`, `id_episodi`) REFERENCES `episodi` (`id_produccio`, `id_episodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.dirigeix_episodi: ~0 rows (aproximadamente)
DELETE FROM `dirigeix_episodi`;

-- Volcando estructura para tabla projectelemonyx.dirigeix_pel·licula
CREATE TABLE IF NOT EXISTS `dirigeix_pel·licula` (
  `id_director` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  KEY `id_director` (`id_director`),
  KEY `id_produccio` (`id_produccio`),
  CONSTRAINT `dirigeix_pel·licula_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`),
  CONSTRAINT `dirigeix_pel·licula_ibfk_2` FOREIGN KEY (`id_produccio`) REFERENCES `pelicules` (`id_produccio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.dirigeix_pel·licula: ~0 rows (aproximadamente)
DELETE FROM `dirigeix_pel·licula`;

-- Volcando estructura para tabla projectelemonyx.episodi
CREATE TABLE IF NOT EXISTS `episodi` (
  `id_produccio` int(11) DEFAULT NULL,
  `id_episodi` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `durada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_episodi`),
  KEY `id_produccio` (`id_produccio`),
  CONSTRAINT `episodi_ibfk_1` FOREIGN KEY (`id_produccio`) REFERENCES `series` (`id_produccio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.episodi: ~0 rows (aproximadamente)
DELETE FROM `episodi`;

-- Volcando estructura para tabla projectelemonyx.factura
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `dates` date NOT NULL,
  `preu_cost` decimal(10,0) NOT NULL,
  `id_compte` int(11) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_compte` (`id_compte`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.factura: ~0 rows (aproximadamente)
DELETE FROM `factura`;

-- Volcando estructura para tabla projectelemonyx.genere
CREATE TABLE IF NOT EXISTS `genere` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nom` enum('Drama','Accio','Fantasia','Ciencia Ficcio','Aventura','Comedia','Thriller','Terror','Suspens','Animacio') NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.genere: ~25 rows (aproximadamente)
DELETE FROM `genere`;
INSERT INTO `genere` (`id_categoria`, `nom`) VALUES
	(1, 'Drama'),
	(2, 'Accio'),
	(3, 'Comedia'),
	(4, 'Accio'),
	(5, 'Aventura'),
	(6, 'Drama'),
	(7, 'Comedia'),
	(8, 'Drama'),
	(9, 'Thriller'),
	(10, 'Animacio'),
	(11, 'Drama'),
	(12, 'Accio'),
	(13, 'Suspens'),
	(14, 'Ciencia Ficcio'),
	(15, 'Thriller'),
	(16, 'Thriller'),
	(17, 'Accio'),
	(18, 'Fantasia'),
	(19, 'Suspens'),
	(20, 'Fantasia'),
	(21, 'Animacio'),
	(22, 'Drama'),
	(23, 'Suspens'),
	(24, 'Aventura'),
	(25, 'Animacio');

-- Volcando estructura para tabla projectelemonyx.ha_consumit
CREATE TABLE IF NOT EXISTS `ha_consumit` (
  `id_compte` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `num_visualitzacio` int(11) NOT NULL,
  `preferit` tinyint(1) NOT NULL,
  KEY `id_compte` (`id_compte`),
  KEY `id_produccio` (`id_produccio`),
  CONSTRAINT `ha_consumit_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`),
  CONSTRAINT `ha_consumit_ibfk_2` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.ha_consumit: ~0 rows (aproximadamente)
DELETE FROM `ha_consumit`;

-- Volcando estructura para tabla projectelemonyx.ha_consumit_episodi
CREATE TABLE IF NOT EXISTS `ha_consumit_episodi` (
  `id_compte` int(11) DEFAULT NULL,
  `id_produccio` int(11) DEFAULT NULL,
  `id_episodi` int(11) DEFAULT NULL,
  `num_visualitzacio` int(11) DEFAULT NULL,
  KEY `id_compte` (`id_compte`),
  KEY `id_produccio` (`id_produccio`,`id_episodi`),
  CONSTRAINT `ha_consumit_episodi_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`),
  CONSTRAINT `ha_consumit_episodi_ibfk_2` FOREIGN KEY (`id_produccio`, `id_episodi`) REFERENCES `episodi` (`id_produccio`, `id_episodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.ha_consumit_episodi: ~0 rows (aproximadamente)
DELETE FROM `ha_consumit_episodi`;

-- Volcando estructura para tabla projectelemonyx.modalitat
CREATE TABLE IF NOT EXISTS `modalitat` (
  `id_modalitat` int(11) NOT NULL AUTO_INCREMENT,
  `tipus` varchar(50) NOT NULL,
  PRIMARY KEY (`id_modalitat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.modalitat: ~3 rows (aproximadamente)
DELETE FROM `modalitat`;
INSERT INTO `modalitat` (`id_modalitat`, `tipus`) VALUES
	(1, 'Gratuita'),
	(2, 'Basica'),
	(3, 'Premium');

-- Volcando estructura para tabla projectelemonyx.participen
CREATE TABLE IF NOT EXISTS `participen` (
  `id_actor` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `id_episodi` int(11) NOT NULL,
  `protagonista` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_actor`,`id_produccio`,`id_episodi`),
  KEY `id_produccio` (`id_produccio`,`id_episodi`),
  CONSTRAINT `participen_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id_actor`),
  CONSTRAINT `participen_ibfk_2` FOREIGN KEY (`id_produccio`, `id_episodi`) REFERENCES `episodi` (`id_produccio`, `id_episodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.participen: ~0 rows (aproximadamente)
DELETE FROM `participen`;

-- Volcando estructura para tabla projectelemonyx.pelicules
CREATE TABLE IF NOT EXISTS `pelicules` (
  `id_produccio` int(11) NOT NULL,
  `durada` int(11) NOT NULL,
  PRIMARY KEY (`id_produccio`),
  CONSTRAINT `pelicules_ibfk_1` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.pelicules: ~20 rows (aproximadamente)
DELETE FROM `pelicules`;
INSERT INTO `pelicules` (`id_produccio`, `durada`) VALUES
	(1, 175),
	(2, 152),
	(3, 128),
	(4, 123),
	(5, 194),
	(6, 132),
	(7, 122),
	(8, 150),
	(9, 127),
	(10, 105),
	(11, 154),
	(12, 148),
	(13, 142),
	(14, 169),
	(15, 142),
	(16, 139),
	(17, 136),
	(18, 202),
	(19, 165),
	(20, 189);

-- Volcando estructura para tabla projectelemonyx.pertany
CREATE TABLE IF NOT EXISTS `pertany` (
  `id_produccio` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  KEY `id_produccio` (`id_produccio`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `pertany_ibfk_1` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`),
  CONSTRAINT `pertany_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `genere` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.pertany: ~0 rows (aproximadamente)
DELETE FROM `pertany`;

-- Volcando estructura para tabla projectelemonyx.pot_visualitzar
CREATE TABLE IF NOT EXISTS `pot_visualitzar` (
  `id_modalitat` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  KEY `id_modalitat` (`id_modalitat`),
  KEY `id_produccio` (`id_produccio`),
  CONSTRAINT `pot_visualitzar_ibfk_1` FOREIGN KEY (`id_modalitat`) REFERENCES `modalitat` (`id_modalitat`),
  CONSTRAINT `pot_visualitzar_ibfk_2` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.pot_visualitzar: ~0 rows (aproximadamente)
DELETE FROM `pot_visualitzar`;

-- Volcando estructura para tabla projectelemonyx.produccions
CREATE TABLE IF NOT EXISTS `produccions` (
  `id_produccio` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `nacionalitat` varchar(50) NOT NULL,
  `anys` int(11) NOT NULL,
  `preferit` tinyint(1) NOT NULL,
  `caratula` varchar(200) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produccio`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `produccions_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `genere` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.produccions: ~25 rows (aproximadamente)
DELETE FROM `produccions`;
INSERT INTO `produccions` (`id_produccio`, `nom`, `nacionalitat`, `anys`, `preferit`, `caratula`, `id_categoria`) VALUES
	(1, 'El Padrino', 'Estados Unidos', 1972, 1, '101', 1),
	(2, 'El Caballero de la Noche', 'Estados Unidos', 2008, 1, '102', 2),
	(3, 'La La Land', 'Estados Unidos', 2016, 0, '103', 3),
	(4, 'La forma del agua', 'Estados Unidos', 2017, 0, '104', 4),
	(5, 'Titanic', 'Estados Unidos', 1997, 1, '105', 5),
	(6, 'Parásitos', 'Corea del Sur', 2019, 1, '106', 6),
	(7, 'Amélie', 'Francia', 2001, 1, '107', 7),
	(8, 'El Pianista', 'Francia', 2002, 0, '108', 8),
	(9, 'Moulin Rouge', 'Australia', 2001, 0, '109', 9),
	(10, 'Coco', 'Estados Unidos', 2017, 1, '110', 10),
	(11, 'Pulp Fiction', 'Estados Unidos', 1994, 1, '111', 11),
	(12, 'Inception', 'Estados Unidos', 2010, 1, '112', 12),
	(13, 'Forrest Gump', 'Estados Unidos', 1994, 1, '113', 13),
	(14, 'Interstellar', 'Estados Unidos', 2014, 0, '114', 14),
	(15, 'The Shawshank Redemption', 'Estados Unidos', 1994, 1, '115', 15),
	(16, 'Fight Club', 'Estados Unidos', 1999, 1, '116', 16),
	(17, 'The Matrix', 'Estados Unidos', 1999, 1, '117', 17),
	(18, 'The Godfather: Part II', 'Estados Unidos', 1974, 1, '118', 18),
	(19, 'The Dark Knight Rises', 'Estados Unidos', 2012, 1, '119', 19),
	(20, 'The Green Mile', 'Estados Unidos', 1999, 1, '120', 20),
	(21, 'Kimetsu no Yaiba', 'Japon', 2023, 1, '121', 21),
	(22, 'Breaking Bad', 'Estados Unidos', 2008, 0, '122', 22),
	(23, 'Juego de Tronos', 'Estados Unidos', 2011, 0, '123', 23),
	(24, 'Vikings', 'Canada', 2013, 1, '124', 24),
	(25, 'Los Simpson', 'Estados Unidos', 1989, 1, '125', 25);

-- Volcando estructura para tabla projectelemonyx.series
CREATE TABLE IF NOT EXISTS `series` (
  `id_produccio` int(11) NOT NULL AUTO_INCREMENT,
  `total_ep` int(11) NOT NULL,
  PRIMARY KEY (`id_produccio`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projectelemonyx.series: ~5 rows (aproximadamente)
DELETE FROM `series`;
INSERT INTO `series` (`id_produccio`, `total_ep`) VALUES
	(21, 26),
	(22, 62),
	(23, 73),
	(24, 89),
	(25, 750);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
