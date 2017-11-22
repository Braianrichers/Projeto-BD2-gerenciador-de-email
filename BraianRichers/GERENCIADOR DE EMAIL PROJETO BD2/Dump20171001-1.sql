CREATE DATABASE  IF NOT EXISTS `projetobd2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `projetobd2`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: projetobd2
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.26-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `id_destinatario` varchar(45) NOT NULL,
  `id_remetente` varchar(45) NOT NULL,
  `id_favorito` enum('S','N') DEFAULT NULL,
  `assunto` varchar(45) NOT NULL,
  `texto` text,
  `anexos` blob,
  `data_email` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (12,'marco123@gmail.com','braian21@gmail.com','S','Trabalho','trabalho pronto',NULL,'2017-10-02 02:30:09'),(13,'marco553@gmail.com','braian30@gmail.com','S','Dever de Casa','Prontinho',NULL,'2017-10-02 02:30:11');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Alterar_Email 
AFTER INSERT ON email
FOR EACH ROW 
BEGIN  INSERT INTO EMAIL(id_email, id_destinatario, id_remetente, id_favorito, assunto, texto) VALUES ('18', 'rogeriopereira@gmail.com', 'rodrigojk@hotmail.com', 'N', 'Tarefa', 'Ate dia 17');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada` (
  `id_entrada` int(11) NOT NULL AUTO_INCREMENT,
  `lido` enum('S','N') DEFAULT 'N',
  `id_email` int(11) DEFAULT NULL,
  `id_remetente` varchar(45) NOT NULL,
  `id_data_email` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_assunto` varchar(40) NOT NULL,
  `fk_email_entrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entrada`),
  KEY `fk_email_entrada_idx` (`fk_email_entrada`),
  CONSTRAINT `fk_email_entrada` FOREIGN KEY (`fk_email_entrada`) REFERENCES `email` (`id_email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (22,'N',20,'braian30@gmail.com','2017-10-02 02:30:14','Dever de Casa',NULL),(33,'N',31,'lucasf22@gmail.com','2017-10-02 02:30:15','trabalho',NULL);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enviados`
--

DROP TABLE IF EXISTS `enviados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enviados` (
  `id_enviado` int(11) NOT NULL,
  `id_destinatario` varchar(45) NOT NULL,
  `data_enviado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `texto` text,
  `assunto` varchar(50) NOT NULL,
  `fk_email_enviado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_enviado`),
  KEY `fk_email_enviado_idx` (`fk_email_enviado`),
  CONSTRAINT `fk_email_enviado` FOREIGN KEY (`fk_email_enviado`) REFERENCES `enviar_email` (`id_enviar_email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enviados`
--

LOCK TABLES `enviados` WRITE;
/*!40000 ALTER TABLE `enviados` DISABLE KEYS */;
INSERT INTO `enviados` VALUES (13,'marco123@gmail.com','2017-10-02 02:30:16','Trabalho Feito','Trabalho',NULL),(14,'marco553@gmail.com','2017-10-02 02:30:16','Prontinho','Dever de Casa',NULL),(15,'rogerio22k@gmail.com','2017-10-02 02:30:04','Ve ai','Trabalho',NULL);
/*!40000 ALTER TABLE `enviados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `enviar`
--

DROP TABLE IF EXISTS `enviar`;
/*!50001 DROP VIEW IF EXISTS `enviar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `enviar` AS SELECT 
 1 AS `id_email`,
 1 AS `id_enviar_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `enviar_email`
--

DROP TABLE IF EXISTS `enviar_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enviar_email` (
  `id_enviar_email` int(11) NOT NULL AUTO_INCREMENT,
  `destinatario_email` varchar(45) NOT NULL,
  `remetente_email` varchar(45) NOT NULL,
  `assunto_email` varchar(50) NOT NULL,
  `texto_email` text,
  `anexo_email` blob,
  `data_envio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_enviar_email` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_enviar_email`),
  KEY `fk_enviar_email_idx` (`fk_enviar_email`),
  CONSTRAINT `fk_enviar_email` FOREIGN KEY (`fk_enviar_email`) REFERENCES `email` (`id_email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enviar_email`
--

LOCK TABLES `enviar_email` WRITE;
/*!40000 ALTER TABLE `enviar_email` DISABLE KEYS */;
INSERT INTO `enviar_email` VALUES (15,'braian21@gmail.com','marco123@gmail.com','Trabalho','Trabalho Pronto',NULL,'2017-10-02 02:30:18',NULL),(16,'braian21@gmail.com','marco553@gmail.com','Dever de Casa','Prontinho',NULL,'2017-10-02 02:30:19',NULL),(17,'lucasf22@gmail.com','rogerio22k@gmail.com','Trabalho','Ve ai',NULL,'2017-10-02 02:30:19',NULL);
/*!40000 ALTER TABLE `enviar_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lixeira`
--

DROP TABLE IF EXISTS `lixeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lixeira` (
  `id_lixeira` int(11) NOT NULL,
  `data_delete` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_entrada_lixeira` int(11) DEFAULT NULL,
  `fk_enviados_lixeira` int(11) DEFAULT NULL,
  `fk_rascunho_lixeira` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lixeira`),
  KEY `fk_entrada_lixeira` (`fk_entrada_lixeira`),
  KEY `fk_enviados_lixeira` (`fk_enviados_lixeira`),
  KEY `fk_rascunho_lixeira` (`fk_rascunho_lixeira`),
  CONSTRAINT `fk_entrada_lixeira` FOREIGN KEY (`fk_entrada_lixeira`) REFERENCES `entrada` (`id_entrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enviados_lixeira` FOREIGN KEY (`fk_enviados_lixeira`) REFERENCES `enviados` (`id_enviado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rascunho_lixeira` FOREIGN KEY (`fk_rascunho_lixeira`) REFERENCES `rascunho` (`id_rascunho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lixeira`
--

LOCK TABLES `lixeira` WRITE;
/*!40000 ALTER TABLE `lixeira` DISABLE KEYS */;
INSERT INTO `lixeira` VALUES (23,'2017-10-02 02:30:23',NULL,NULL,NULL),(24,'2017-10-02 02:30:26',NULL,NULL,NULL);
/*!40000 ALTER TABLE `lixeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `oquepara`
--

DROP TABLE IF EXISTS `oquepara`;
/*!50001 DROP VIEW IF EXISTS `oquepara`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oquepara` AS SELECT 
 1 AS `id_assunto`,
 1 AS `assunto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `paraquem`
--

DROP TABLE IF EXISTS `paraquem`;
/*!50001 DROP VIEW IF EXISTS `paraquem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `paraquem` AS SELECT 
 1 AS `id_remetente`,
 1 AS `remetente_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rascunho`
--

DROP TABLE IF EXISTS `rascunho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rascunho` (
  `id_rascunho` int(11) NOT NULL AUTO_INCREMENT,
  `id_destinatario` varchar(45) NOT NULL,
  `data_rascunho` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assunto` varchar(45) NOT NULL,
  `texto` text,
  `fk_enviar_rascunho` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rascunho`),
  KEY `fk_enviar_rascunho_idx` (`fk_enviar_rascunho`),
  CONSTRAINT `fk_enviar_rascunho` FOREIGN KEY (`fk_enviar_rascunho`) REFERENCES `enviar_email` (`id_enviar_email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rascunho`
--

LOCK TABLES `rascunho` WRITE;
/*!40000 ALTER TABLE `rascunho` DISABLE KEYS */;
INSERT INTO `rascunho` VALUES (23,'braiant44@gmail.com','2017-10-02 02:30:27','Trabalho','Trabalho Pronto',NULL),(24,'braian21@gmail.com','2017-10-02 02:30:28','Trabalho','Prontinho',NULL),(25,'lucasf22@gmail.com','2017-10-02 02:30:29','Trabalho','Ve ai',NULL);
/*!40000 ALTER TABLE `rascunho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'projetobd2'
--

--
-- Dumping routines for database 'projetobd2'
--
/*!50003 DROP PROCEDURE IF EXISTS `Assunto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Assunto`(varEmail smallint)
Select concat(' O titulo do email é',assunto) As Assunto
From email
where assunto = varEmail ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Texto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Texto`(textoEmail smallint)
Select concat(' O texto do seu email é',texto) As Texto
From rascunho
where texto = TextoEmail ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ver_Email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver_Email`(varEmail smallint)
Select concat(' O id do email é',id_email) As Email
From email
where id_email = varEmail ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `enviar`
--

/*!50001 DROP VIEW IF EXISTS `enviar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `enviar` AS select `email`.`id_email` AS `id_email`,`enviar_email`.`id_enviar_email` AS `id_enviar_email` from (`email` join `enviar_email` on((`email`.`id_email` = `enviar_email`.`id_enviar_email`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oquepara`
--

/*!50001 DROP VIEW IF EXISTS `oquepara`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `oquepara` AS select `entrada`.`id_remetente` AS `id_assunto`,`enviados`.`assunto` AS `assunto` from (`entrada` join `enviados` on((`entrada`.`id_assunto` = `enviados`.`assunto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `paraquem`
--

/*!50001 DROP VIEW IF EXISTS `paraquem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `paraquem` AS select `email`.`id_remetente` AS `id_remetente`,`enviar_email`.`remetente_email` AS `remetente_email` from (`email` join `enviar_email` on((`email`.`id_remetente` = `enviar_email`.`remetente_email`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-01 23:38:42
