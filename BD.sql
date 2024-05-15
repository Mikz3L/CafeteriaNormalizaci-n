-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.17 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para cafeteriamiguelledezma
CREATE DATABASE IF NOT EXISTS `cafeteriamiguelledezma` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cafeteriamiguelledezma`;

-- Volcando estructura para tabla cafeteriamiguelledezma.cafeteria
CREATE TABLE IF NOT EXISTS `cafeteria` (
  `ID_cafeteria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Ubicacion` varchar(100) DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`ID_cafeteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cafeteriamiguelledezma.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `ID_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ID_cafeteria` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`),
  KEY `ID_cafeteria` (`ID_cafeteria`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ID_cafeteria`) REFERENCES `cafeteria` (`ID_cafeteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cafeteriamiguelledezma.detalles_pedido
CREATE TABLE IF NOT EXISTS `detalles_pedido` (
  `ID_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `ID_pedido` int(11) DEFAULT NULL,
  `ID_producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_detalle`),
  KEY `ID_pedido` (`ID_pedido`),
  KEY `ID_producto` (`ID_producto`),
  CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`ID_pedido`) REFERENCES `pedidos` (`ID_pedido`),
  CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`ID_producto`) REFERENCES `productos` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cafeteriamiguelledezma.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `ID_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `ID_cliente` int(11) DEFAULT NULL,
  `Fecha_pedido` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `ID_cafeteria` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_pedido`),
  KEY `ID_cliente` (`ID_cliente`),
  KEY `ID_cafeteria` (`ID_cafeteria`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `clientes` (`ID_cliente`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`ID_cafeteria`) REFERENCES `cafeteria` (`ID_cafeteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cafeteriamiguelledezma.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `ID_producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_producto` varchar(100) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `ID_cafeteria` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_producto`),
  KEY `ID_cafeteria` (`ID_cafeteria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_cafeteria`) REFERENCES `cafeteria` (`ID_cafeteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cafeteriamiguelledezma.sucursales
CREATE TABLE IF NOT EXISTS `sucursales` (
  `ID_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `ID_cafeteria` int(11) DEFAULT NULL,
  `Ubicacion` varchar(100) DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`ID_sucursal`),
  KEY `ID_cafeteria` (`ID_cafeteria`),
  CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`ID_cafeteria`) REFERENCES `cafeteria` (`ID_cafeteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
