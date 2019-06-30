-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.16-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bdsga
DROP DATABASE IF EXISTS `bdsga`;
CREATE DATABASE IF NOT EXISTS `bdsga` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdsga`;

-- Volcando estructura para tabla bdsga.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `id_almacen` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.almacen: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` (`id_almacen`, `descripcion`, `direccion`) VALUES
	(1, 'Almacen Central', 'Av. lima 451');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.clase
CREATE TABLE IF NOT EXISTS `clase` (
  `id_clase` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_clase_padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.clase: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` (`id_clase`, `descripcion`, `id_clase_padre`) VALUES
	(1, 'Monturas', NULL),
	(2, 'Lunas', NULL),
	(3, 'Lentes para hombre', NULL),
	(4, 'Lentes para mujer', NULL),
	(5, 'Lentes para niños', NULL),
	(6, 'Lentes de contacto', NULL);
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.movimiento_producto
CREATE TABLE IF NOT EXISTS `movimiento_producto` (
  `id_mov_prod` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_reg` datetime DEFAULT NULL,
  `serie` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero` varchar(6) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_tipo_mov` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `documento_ref` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_almacen` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mov_prod`),
  KEY `movimiento_producto_fk` (`id_producto`),
  KEY `movimiento_producto_fk_1` (`id_almacen`),
  KEY `movimiento_producto_fk_2` (`id_tipo_mov`),
  KEY `movimiento_producto_fk_3` (`id_proveedor`),
  CONSTRAINT `movimiento_producto_fk` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `movimiento_producto_fk_1` FOREIGN KEY (`id_almacen`) REFERENCES `almacen` (`id_almacen`),
  CONSTRAINT `movimiento_producto_fk_2` FOREIGN KEY (`id_tipo_mov`) REFERENCES `tipo_movimiento` (`id_tipo_mov`),
  CONSTRAINT `movimiento_producto_fk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.movimiento_producto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_producto` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.opcion
CREATE TABLE IF NOT EXISTS `opcion` (
  `id_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `url` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.opcion: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` (`id_opcion`, `descripcion`, `url`, `orden`) VALUES
	(1, 'Proveedor', 'url1', 1),
	(2, 'Producto', 'url2', 2),
	(3, 'Almacen', NULL, 3),
	(4, 'Parte De Entrada', NULL, 4),
	(5, 'Guia De Remisión', NULL, 5);
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.perfil
CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.perfil: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`id_perfil`, `descripcion`) VALUES
	(1, 'Administrador');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.perfil_opcion
CREATE TABLE IF NOT EXISTS `perfil_opcion` (
  `id_perfil_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) DEFAULT NULL,
  `id_opcion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_perfil_opcion`),
  KEY `perfil_opcion_fk_1` (`id_perfil`),
  KEY `perfil_opcion_fk_2` (`id_opcion`),
  CONSTRAINT `perfil_opcion_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`),
  CONSTRAINT `perfil_opcion_fk_2` FOREIGN KEY (`id_opcion`) REFERENCES `opcion` (`id_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.perfil_opcion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `perfil_opcion` DISABLE KEYS */;
INSERT INTO `perfil_opcion` (`id_perfil_opcion`, `id_perfil`, `id_opcion`) VALUES
	(1, 1, 1),
	(2, 1, 2);
/*!40000 ALTER TABLE `perfil_opcion` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tamanio` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `forma` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `material` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_clase` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `producto_fk` (`id_clase`),
  CONSTRAINT `producto_fk` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.producto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id_producto`, `descripcion`, `tamanio`, `color`, `forma`, `material`, `id_clase`) VALUES
	(26, 'ARNETTE', '14 CM', 'YELOOW', 'CUADRADO', 'ACETATO', 3),
	(27, 'OAKLEY', '', '', 'RECTANGULAR', 'NYLON PROPIONATO', 3),
	(28, 'ARMANI EXCHANGE', '', '', 'RECTANGULAR', 'NYLON PROPIONATO', 3),
	(29, 'POLO RL', '', '', 'RECTANGULAR', 'NYLON PROPIONATO', 4),
	(30, 'PRADA', '', '', 'CIRCULAR', 'ACERO', 4),
	(31, 'RAY BAN', '', '', 'CUADRADO', 'NYLON', 5);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `razon_social` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.proveedor: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` (`id_proveedor`, `ruc`, `razon_social`, `telefono`, `direccion`) VALUES
	(1, '10123123128', 'Resinas del Perú', '999888777', 'Jr La curva 882 4to piso Lince'),
	(2, '10656463637', 'Plasticos la colonia', '999777555', 'Jr los pinos 123'),
	(3, '1045554647', 'Importaciones la vela', '987564321', 'Jr nogales 12345'),
	(4, '1045554654', 'Importadora general del norte', '999564321', 'Jr cipreses 231'),
	(5, '1045554687', 'Importaciones el olivar', '987564321', 'Jr la cumbre 635'),
	(6, '1045554632', 'Importaciones lider', '955564111', 'Jr jorge chavez 876'),
	(7, '1045554690', 'Importaciones espectrum', '944564345', 'Jr polonia 876'),
	(8, '1045554632', 'Importadora lentes y lentas', '912564452', 'Jr san martion de porres 654'),
	(9, '1045554621', 'Importadora la solucion', '954564987', 'Jr canova 2312'),
	(10, '1045554611', 'Importadora el risco', '912564789', 'Jr frans hals 333');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.tipo_movimiento
CREATE TABLE IF NOT EXISTS `tipo_movimiento` (
  `id_tipo_mov` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_mov`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.tipo_movimiento: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_movimiento` DISABLE KEYS */;
INSERT INTO `tipo_movimiento` (`id_tipo_mov`, `descripcion`) VALUES
	(1, 'Entrada'),
	(2, 'Salida');
/*!40000 ALTER TABLE `tipo_movimiento` ENABLE KEYS */;

-- Volcando estructura para tabla bdsga.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `usuario_fk` (`id_perfil`),
  CONSTRAINT `usuario_fk` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla bdsga.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`, `usuario`, `clave`, `estado`, `id_perfil`) VALUES
	(1, 'RMAQUERA', '123456', b'1', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
