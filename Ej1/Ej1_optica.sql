/*

  Ej1: Optica.
  CREACION DE BBDD OPTICA, TABLAS E INTRODUCCION DE DATOS
  AL FINAL SE ENCUENTRAN LAS SENTENCIAS DE SELECCION

*/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `ciudad_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `pais_id` int(11) NOT NULL,
  PRIMARY KEY (`ciudad_id`),
  KEY `pais_id` (`pais_id`),
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Bangkok',1),(2,'Barcelona',2),(3,'Granada',2),(4,'Berlin',3);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `ciudad_id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `recomendado_por` int(11) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `email` (`email`),
  KEY `ciudad_id` (`ciudad_id`),
  KEY `pais_id` (`pais_id`),
  KEY `recomendado_por` (`recomendado_por`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`ciudad_id`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`),
  CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`recomendado_por`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'C1','Calle1','08088',1,1,'075-8484-848','e@1.com',NULL,'2021-03-24 12:41:26'),(2,'C2','Calle2','08444',1,1,'075-8484-848','e@2.com',1,'2021-03-24 12:44:59');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `detalle_venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `gafa_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  PRIMARY KEY (`detalle_venta_id`),
  KEY `gafa_id` (`gafa_id`),
  KEY `venta_id` (`venta_id`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`gafa_id`) REFERENCES `gafas` (`gafa_id`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`venta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1),(2,2,2),(3,3,3),(4,3,4);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `empleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `ciudad_id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  PRIMARY KEY (`empleado_id`),
  UNIQUE KEY `nif` (`nif`),
  KEY `ciudad_id` (`ciudad_id`),
  KEY `pais_id` (`pais_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`ciudad_id`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'E1','878892234F','Calle1','080484',3,2,'7894583902'),(2,'E2','780332234T','Calle2','78001',4,3,'683929384'),(3,'E3','789949485U','Calle2','12005',4,3,'666898194');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gafas` (
  `gafa_id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `modelo` varchar(25) NOT NULL,
  `graduacion_derecha` double(4,2) DEFAULT NULL,
  `graduacion_izquierda` double(4,2) DEFAULT NULL,
  `montura` enum('Pasta','Metalica','Flotante') DEFAULT NULL,
  `color_montura` enum('Rojo','Dorado','Negro','Azul','Amarillo','Blanco') DEFAULT NULL,
  `color_derecho` enum('Plata','Polarizado','Ahumado') DEFAULT NULL,
  `color_izquierdo` enum('Plata','Polarizado','Ahumado') DEFAULT NULL,
  `precio` double(6,2) DEFAULT NULL,
  `stock` int(5) DEFAULT NULL,
  PRIMARY KEY (`gafa_id`),
  KEY `marca_id` (`marca`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `gafas_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,'Gafis',1,'mod1',0.50,0.75,'Metalica','Blanco','Plata','Plata',28.50,47),(2,'Nos vemos',2,'mod2',0.50,0.25,'Pasta','Rojo','Ahumado','Ahumado',74.30,89),(3,'Ojito',1,'mod3',0.15,0.15,'Flotante','Negro','Plata','Plata',18.72,105),(4,'Ojito',1,'mod4',1.15,1.00,'Metalica','Rojo','Ahumado','Ahumado',52.33,71);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `pais_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Tailandia'),(2,'España'),(3,'Alemania');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `ciudad_id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `fax` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  UNIQUE KEY `nif` (`nif`),
  KEY `ciudad_id` (`ciudad_id`),
  KEY `pais_id` (`pais_id`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`ciudad_id`),
  CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'P1','B487483932','Calle1','08000',2,2,'934848831',NULL),(2,'P2','AV7483931','Calle2','DA-4854-C',4,3,'934848831',NULL),(3,'P3','B3333333','Calle3','47808BC',1,1,'0056084752','0056074754');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `empleado_id` (`empleado_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2021-02-02',1,2),(2,'2020-10-15',2,1),(3,'2020-01-05',2,1),(4,'2020-06-28',2,2);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


/***************************\
 * SENTENCIAS DE SELECCION *
/***************************\

==> Facturas de cliente en tiempo determinado <==

SELECT c.nombre, v.venta_id, v.fecha_venta 
FROM ventas v 
JOIN clientes c USING(cliente_id) 
WHERE v.cliente_id = 1 AND v.fecha_venta < '2021-01-01';

==> Seleccionar modelos vendidos durante un año por un empleado <==

SELECT g.modelo, v.fecha_venta, e.nombre 
FROM gafas g, detalle_venta dv, ventas v 
JOIN empleados e USING(empleado_id) 
WHERE g.gafa_id = dv.gafa_id 
AND v.venta_id=dv.venta_id 
AND v.empleado_id = 1 
AND v.fecha_venta > '2021-01-01' 
GROUP BY v.fecha_venta;

==> Listado de los proveedores que han suministrado gafas que se han vendido <==

SELECT g.modelo, p.nombre as proveedor, dv.detalle_venta_id, v.fecha_venta 
FROM gafas g, proveedores p, detalle_venta dv, ventas v 
WHERE g.gafa_id = dv.gafa_id and g.proveedor_id = p.proveedor_id 
GROUP BY dv.detalle_venta_id;

*/


