-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cmv
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CAT_CMV_TIPO_CUENTA`
--

DROP TABLE IF EXISTS `CAT_CMV_TIPO_CUENTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAT_CMV_TIPO_CUENTA` (
  `id_cuenta` int NOT NULL,
  `nombre_cuenta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_CMV_TIPO_CUENTA`
--

LOCK TABLES `CAT_CMV_TIPO_CUENTA` WRITE;
/*!40000 ALTER TABLE `CAT_CMV_TIPO_CUENTA` DISABLE KEYS */;
INSERT INTO `CAT_CMV_TIPO_CUENTA` VALUES (1,'Ahorro'),(2,'Credito'),(3,'Prestamo');
/*!40000 ALTER TABLE `CAT_CMV_TIPO_CUENTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_CMV_CLIENTE`
--

DROP TABLE IF EXISTS `TBL_CMV_CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_CMV_CLIENTE` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido_paterno` varchar(45) DEFAULT NULL,
  `apellido_materno` varchar(45) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `curp` varchar(45) DEFAULT NULL,
  `fecha_alta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_CMV_CLIENTE`
--

LOCK TABLES `TBL_CMV_CLIENTE` WRITE;
/*!40000 ALTER TABLE `TBL_CMV_CLIENTE` DISABLE KEYS */;
INSERT INTO `TBL_CMV_CLIENTE` VALUES (3,'Omar','Gutierrez','Hernandez','345','ABCDE000300FGHIJK07','2022/03/03'),(5,'Maria','Gutierrez','Jimenes','345','345','2022/03/03'),(6,'Esmeralda','Gutierrez','Jimenes','xext990101n14','SABC560626MDFLRN09','2022/03/03'),(7,'Oliva','Gomez','Jimenes','345','234',NULL),(8,'Ramon','Gomez','Hernandez','xext990101n14','234','2022/03/03'),(9,'Daniel','Gomez','Hernandez','345','234','2022/03/03'),(10,'Sandra','Perez','Hernandez','345','234',NULL),(11,'Ana','Perez','Hernandez','xext990101n14','ABCDE000300FGHIJK07','2022/03/03'),(12,'Ricardo','Perez','Gomez','345','234','2022/03/03'),(13,'Raymundo','Gutierrez','Gomez','xext990101n14','234ABCDE000300FGHIJK07','2022/03/03'),(14,'Patricia','Gutierrez','Gomez','345','234','2022/03/03'),(15,'Paola','Gutierrez','Gomez','345','234',NULL);
/*!40000 ALTER TABLE `TBL_CMV_CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_CMV_CLIENTE_CUENTA`
--

DROP TABLE IF EXISTS `TBL_CMV_CLIENTE_CUENTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_CMV_CLIENTE_CUENTA` (
  `id_cliente_cuenta` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  `saldo_actual` float DEFAULT NULL,
  `fecha_contratacion` datetime DEFAULT NULL,
  `fecha_ultimo_movimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente_cuenta`),
  KEY `fk_TBL_CMV_CLIENTE_CUENTA_1_idx` (`id_cuenta`),
  KEY `fk_TBL_CMV_CLIENTE_CUENTA_2_idx` (`id_cliente`),
  CONSTRAINT `fk_TBL_CMV_CLIENTE_CUENTA_1` FOREIGN KEY (`id_cuenta`) REFERENCES `CAT_CMV_TIPO_CUENTA` (`id_cuenta`),
  CONSTRAINT `fk_TBL_CMV_CLIENTE_CUENTA_2` FOREIGN KEY (`id_cliente`) REFERENCES `TBL_CMV_CLIENTE` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_CMV_CLIENTE_CUENTA`
--

LOCK TABLES `TBL_CMV_CLIENTE_CUENTA` WRITE;
/*!40000 ALTER TABLE `TBL_CMV_CLIENTE_CUENTA` DISABLE KEYS */;
INSERT INTO `TBL_CMV_CLIENTE_CUENTA` VALUES (3,3,1,15,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(5,5,1,25,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(6,6,1,30,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(7,7,1,35,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(8,8,1,40,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(9,9,1,45,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(10,10,1,50,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(11,11,1,55,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(12,12,1,60,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(13,13,1,65,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(14,14,1,70,'2022-03-03 00:00:00','2022-03-07 00:00:00'),(15,15,1,75,'2022-03-03 00:00:00','2022-03-07 00:00:00');
/*!40000 ALTER TABLE `TBL_CMV_CLIENTE_CUENTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cmv'
--

--
-- Dumping routines for database 'cmv'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `delete_user`(in id int)
BEGIN
	delete from cmv.TBL_CMV_CLIENTE_CUENTA as cliente where cliente.id_cliente = id; 
	delete from cmv.TBL_CMV_CLIENTE as cliente where cliente.id_cliente = id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_account_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_account_details`(in id int)
BEGIN
select cliente_cuenta.id_cliente_cuenta, cliente.id_cliente, cuenta.id_cuenta, 
cliente.nombre, cliente.apellido_paterno, cliente.apellido_materno, cliente.rfc, cliente.curp, cliente.fecha_alta,
cuenta.nombre_cuenta, cliente_cuenta.fecha_contratacion, cliente_cuenta.saldo_actual, cliente_cuenta.fecha_ultimo_movimiento
	from cmv.TBL_CMV_CLIENTE_CUENTA as cliente_cuenta
		inner join cmv.TBL_CMV_CLIENTE as cliente on cliente_cuenta.id_cliente = cliente.id_cliente
		inner join cmv.CAT_CMV_TIPO_CUENTA as cuenta on cliente_cuenta.id_cuenta = cuenta.id_cuenta
    where cliente.id_cliente = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_active_clients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_active_clients`()
BEGIN
	select * from cmv.TBL_CMV_CLIENTE where fecha_alta is not null; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_inactive_clients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_inactive_clients`()
BEGIN
	select * from cmv.TBL_CMV_CLIENTE where fecha_alta is null; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_selected_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `get_selected_user`(in id int)
BEGIN
	select * from cmv.TBL_CMV_CLIENTE where id_cliente = id limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `update_user`(
	in id int, 
	in name varchar(45), 
	in p_last_name varchar(45), 
    in m_last_name varchar(45), 
    in i_rfc varchar(45), 
    in i_curp varchar(45) )
BEGIN
	update cmv.TBL_CMV_CLIENTE as cliente
		set cliente.nombre = name, cliente.apellido_paterno= p_last_name, cliente.apellido_materno= m_last_name, 
        cliente.rfc=i_rfc, cliente.curp=i_curp
		where cliente.id_cliente = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-28 14:20:11
