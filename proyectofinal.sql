-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: proyectofinal
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Calificaciones`
--

DROP TABLE IF EXISTS `Calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calificaciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DNI_Cliente` varchar(20) NOT NULL,
  `Texto` text NOT NULL,
  `Nota_servicio` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DNI_Cliente` (`DNI_Cliente`),
  CONSTRAINT `Calificaciones_ibfk_1` FOREIGN KEY (`DNI_Cliente`) REFERENCES `Clientes` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calificaciones`
--

LOCK TABLES `Calificaciones` WRITE;
/*!40000 ALTER TABLE `Calificaciones` DISABLE KEYS */;
INSERT INTO `Calificaciones` VALUES (1,'12345678A','Servicio rápido y eficiente. Muy satisfecho.','5/5'),(2,'87654321B','El técnico solucionó el problema, pero tardó un poco.','4/5'),(3,'11223344C','Buen servicio técnico, pero el coste fue algo elevado.','3.5/5'),(4,'55667788D','Muy profesionales. Lo recomendaría sin dudar.','5/5'),(5,'99887766E','No quedé completamente satisfecho, esperaba más.','2.5/5');
/*!40000 ALTER TABLE `Calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `DNI` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Contraseña` varchar(200) NOT NULL,
  `Telefono` char(20) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Correo` varchar(200) NOT NULL,
  `ID_Equipo` int DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `ID_Equipo` (`ID_Equipo`),
  CONSTRAINT `Clientes_ibfk_1` FOREIGN KEY (`ID_Equipo`) REFERENCES `Equipos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES ('11223344C','Luis García','5efc2b017da4f7736d192a74dde5891369e0685d4d38f2a455b6fcdab282df9c','632112233','Calle Luna 78, Barcelona','luis.garcia@example.com',3),('1234566678L','Juan Pérez','1234segura','123456789','Calle Falsa 123','PAU@EXAMPLE.COM',1),('12345678A','Carlos Pérez','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f','612345678','Calle Mayor 12, Madrid','carlos.perez@example.com',1),('12345678L','Juan Pérez','1234segura','123456789','Calle Falsa 123','JUAN@EXAMPLE.COM',1),('55667788D','María Sánchez','89e01536ac207279409d4de1e5253e01f4a1769e696db0d6062ca9b8f56767c8','642445566','Paseo del Sol 90, Sevilla','maria.sanchez@example.com',4),('87654321B','Ana López','c6ba91b90d922e159893f46c387e5dc1b3dc5c101a5a4522f03b987177a24a91','622334455','Av. de la Paz 45, Valencia','ana.lopez@example.com',2),('99887766E','Pedro Fernández','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','652998877','Calle Rosa 3, Bilbao','pedro.fernandez@example.com',5);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Clientes_verificardatos` BEFORE INSERT ON `Clientes` FOR EACH ROW BEGIN
    IF NEW.Correo NOT LIKE '%_@_%._%' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El correo no está bien introducido';
    ELSE 
        SET NEW.Correo = UPPER(NEW.Correo);
    END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Equipos`
--

DROP TABLE IF EXISTS `Equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipos` (
  `ID` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Tipo` varchar(100) NOT NULL,
  `Fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipos`
--

LOCK TABLES `Equipos` WRITE;
/*!40000 ALTER TABLE `Equipos` DISABLE KEYS */;
INSERT INTO `Equipos` VALUES (1,'Laptop Dell XPS 13','Laptop','2023-01-15'),(2,'Impresora HP LaserJet Pro','Impresora','2022-11-20'),(3,'Router TP-Link AC2000','Router','2023-02-10'),(4,'Monitor LG UltraFine','Monitor','2023-03-05'),(5,'Teclado Mecánico Logitech','Periférico','2022-12-01');
/*!40000 ALTER TABLE `Equipos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `loggin_basededatos` AFTER INSERT ON `Equipos` FOR EACH ROW BEGIN
    INSERT INTO logs (tabla, accion, fecha)
    VALUES ('Equipos', 'INSERT', NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `loggin_basededatos1` AFTER UPDATE ON `Equipos` FOR EACH ROW BEGIN
    INSERT INTO logs (tabla, accion, fecha)
    VALUES ('Equipos', 'UPDATE', NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `loggin_basededatos2` AFTER DELETE ON `Equipos` FOR EACH ROW BEGIN
    INSERT INTO logs (tabla, accion, fecha)
    VALUES ('Equipos', 'DELETE', NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Servicios`
--

DROP TABLE IF EXISTS `Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servicios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Fecha_Final` date NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Coste` int NOT NULL,
  `Cliente_DNI` varchar(20) NOT NULL,
  `DNI_Tecnico` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Cliente_DNI` (`Cliente_DNI`),
  KEY `DNI_Tecnico` (`DNI_Tecnico`),
  CONSTRAINT `Servicios_ibfk_1` FOREIGN KEY (`Cliente_DNI`) REFERENCES `Clientes` (`DNI`),
  CONSTRAINT `Servicios_ibfk_2` FOREIGN KEY (`DNI_Tecnico`) REFERENCES `Tecnicos` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servicios`
--

LOCK TABLES `Servicios` WRITE;
/*!40000 ALTER TABLE `Servicios` DISABLE KEYS */;
INSERT INTO `Servicios` VALUES (1,'2023-01-25','2023-01-20',150,'12345678A','98765432Z'),(2,'2023-02-15','2023-02-10',100,'87654321B','87654321Y'),(3,'2023-03-05','2023-03-01',200,'11223344C','76543210X'),(4,'2023-03-20','2023-03-15',50,'55667788D','65432109W'),(5,'2023-04-01','2023-03-25',300,'99887766E','54321098V');
/*!40000 ALTER TABLE `Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tecnicos`
--

DROP TABLE IF EXISTS `Tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tecnicos` (
  `DNI` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tecnicos`
--

LOCK TABLES `Tecnicos` WRITE;
/*!40000 ALTER TABLE `Tecnicos` DISABLE KEYS */;
INSERT INTO `Tecnicos` VALUES ('54321098V','Diego López','641445566','Hardware en general'),('65432109W','Sara Ruiz','631334455','Periféricos'),('76543210X','Miguel Torres','621112233','Laptops y Monitores'),('87654321Y','Laura Gómez','611223344','Impresoras'),('98765432Z','Javier Martín','691234567','Redes');
/*!40000 ALTER TABLE `Tecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tabla` varchar(100) NOT NULL,
  `accion` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'Equipos','INSERT','2025-01-29 16:57:22'),(2,'Equipos','DELETE','2025-01-29 16:58:18'),(3,'Equipos','UPDATE','2025-01-29 16:59:10');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-30 23:36:41
