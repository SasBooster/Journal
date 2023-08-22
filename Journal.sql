-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 192.168.1.7    Database: Journal
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
-- Table structure for table `Grades`
--

DROP TABLE IF EXISTS `Grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grades` (
  `Grade_ID` int NOT NULL AUTO_INCREMENT,
  `Grade` varchar(1) DEFAULT NULL,
  `Grade_date` date NOT NULL,
  `Grades_FK_person` int NOT NULL,
  `Grades_FK_subject` int NOT NULL,
  PRIMARY KEY (`Grade_ID`),
  KEY `Grades_FK_person` (`Grades_FK_person`),
  KEY `Grades_FK_subject` (`Grades_FK_subject`),
  CONSTRAINT `Grades_ibfk_1` FOREIGN KEY (`Grades_FK_person`) REFERENCES `People` (`Person_ID`),
  CONSTRAINT `Grades_ibfk_2` FOREIGN KEY (`Grades_FK_subject`) REFERENCES `subjects` (`Subject_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grades`
--

LOCK TABLES `Grades` WRITE;
/*!40000 ALTER TABLE `Grades` DISABLE KEYS */;
INSERT INTO `Grades` VALUES (7,'5','2022-07-19',6,9),(8,'Н','2022-07-19',7,9),(9,'4','2022-07-19',8,9),(10,'4','2022-07-20',6,9),(11,NULL,'2022-07-20',7,9),(12,'','2022-07-20',8,9),(13,'4','2022-07-19',6,5),(14,'Н','2022-07-19',7,5),(15,NULL,'2022-07-19',8,5),(16,NULL,'2022-07-19',12,5),(17,NULL,'2022-07-19',13,5),(18,NULL,'2022-07-19',14,5),(19,NULL,'2022-07-19',9,5),(20,NULL,'2022-07-19',10,5),(21,NULL,'2022-07-19',11,5),(22,NULL,'2022-07-22',6,9),(23,'','2022-07-22',7,9),(24,'2','2022-07-22',8,9),(25,NULL,'2022-07-22',6,5),(26,'Н','2022-07-22',7,5),(27,NULL,'2022-07-22',8,5),(28,NULL,'2022-07-22',9,5),(29,NULL,'2022-07-22',10,5),(30,NULL,'2022-07-22',11,5),(31,NULL,'2022-07-22',12,9),(32,NULL,'2022-07-22',13,9),(33,NULL,'2022-07-22',14,9),(34,NULL,'2022-07-22',12,5),(35,NULL,'2022-07-22',13,5),(36,'3','2022-07-22',14,5),(37,NULL,'2022-07-22',9,9),(38,NULL,'2022-07-22',10,9),(39,NULL,'2022-07-22',11,9),(40,'','2021-10-12',6,9),(41,NULL,'2021-10-12',7,9),(42,NULL,'2021-10-12',8,9),(43,NULL,'2021-10-13',6,5),(44,'Н','2021-10-13',7,5),(45,NULL,'2021-10-13',8,5),(46,NULL,'2021-10-13',6,9),(47,'5','2021-10-13',7,9),(48,'3','2021-10-13',8,9),(49,'5','2023-02-19',6,5),(50,'Н','2023-02-19',7,5),(51,NULL,'2023-02-19',8,5),(52,NULL,'2023-02-19',9,3),(53,NULL,'2023-02-19',10,3),(54,NULL,'2023-02-19',11,3),(55,'3','2023-02-21',6,5),(56,'Н','2023-02-21',7,5),(57,'5','2023-02-21',8,5),(58,NULL,'2023-02-27',12,5),(59,NULL,'2023-02-27',13,5),(60,'4','2023-02-27',14,5),(61,NULL,'2023-03-27',6,9),(62,NULL,'2023-03-27',7,9),(63,NULL,'2023-03-27',8,9),(64,'3','2023-03-27',6,5),(65,NULL,'2023-03-27',7,5),(66,NULL,'2023-03-27',8,5),(67,NULL,'2023-04-04',6,5),(68,'5','2023-04-04',7,5),(69,'3','2023-04-04',8,5),(70,NULL,'2023-04-04',6,9),(71,'5','2023-04-04',7,9),(72,NULL,'2023-04-04',8,9),(73,'2','2023-04-10',6,5),(74,NULL,'2023-04-10',7,5),(75,NULL,'2023-04-10',8,5),(76,'4','2023-04-10',12,5),(77,NULL,'2023-04-10',13,5),(78,'Н','2023-04-10',14,5);
/*!40000 ALTER TABLE `Grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_Access`
--

DROP TABLE IF EXISTS `Group_Access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group_Access` (
  `GroupAcs_ID` int NOT NULL AUTO_INCREMENT,
  `FK_person_G` int NOT NULL,
  `Access_FK_group` int NOT NULL,
  PRIMARY KEY (`GroupAcs_ID`),
  KEY `FK_person_G` (`FK_person_G`),
  KEY `Access_FK_group` (`Access_FK_group`),
  CONSTRAINT `Group_Access_ibfk_1` FOREIGN KEY (`FK_person_G`) REFERENCES `People` (`Person_ID`),
  CONSTRAINT `Group_Access_ibfk_2` FOREIGN KEY (`Access_FK_group`) REFERENCES `groups` (`Group_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_Access`
--

LOCK TABLES `Group_Access` WRITE;
/*!40000 ALTER TABLE `Group_Access` DISABLE KEYS */;
INSERT INTO `Group_Access` VALUES (3,6,1),(4,7,1),(5,8,1),(6,9,9),(7,10,9),(8,11,9),(9,12,2),(10,13,2),(11,14,2),(12,3,9),(15,4,3),(16,4,4),(17,4,9),(18,4,10),(19,5,2),(20,5,3),(21,5,4),(22,5,7),(23,5,8),(27,3,1),(28,3,2);
/*!40000 ALTER TABLE `Group_Access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `People` (
  `Person_ID` int NOT NULL AUTO_INCREMENT,
  `first_Name` varchar(20) NOT NULL,
  `Last_name` varchar(20) NOT NULL,
  `Father_name` varchar(20) NOT NULL,
  `Login` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Role` varchar(30) NOT NULL,
  PRIMARY KEY (`Person_ID`),
  UNIQUE KEY `Password` (`Password`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
INSERT INTO `People` VALUES (1,'Лидия','Егорова','Святославовна','LSEgorova','LSE01','Педорг'),(2,'Юрий','Журавлев','Михайлович','UMJuravlev','UMJ01','Педорг'),(3,'Никита','Калинин','Павлович','NPKalinin','NPK02','Преподаватель'),(4,'Али','Попов','Маркович','AMPopov','AMP02','Преподаватель'),(5,'Елизавета','Малышева','Антоновна','EAMalisheva','EMA02','Преподаватель'),(6,'Мария','Масленникова','Артёмовна','MAMaslenikova','MAM03','Студент'),(7,'Софья','Ежова','Артёмовна','SAEjova','SAE03','Студент'),(8,'Тимур','Лебедев','Александрович','TALebedev','TAL03','Студент'),(9,'Владимир','Афанасьев','Даниилович','VDAfanasyev','VDA03','Студент'),(10,'Иван','Петров','Тимофеевич','ITPetrov','ITP03','Студент'),(11,'Всеволод','Матвеев','Андреевич','VAMatveev','VAM03','Студент'),(12,'Даниил','Соколов','Савельевич','DSsokolov','DSS03','Студент'),(13,'Диана','Курочкина','Данииловна','DDKurochkina','DDK03','Студент'),(14,'Елизавета','Дьяконова','Львовна','ELDyakovna','ELD03','Студент');
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subject_Access`
--

DROP TABLE IF EXISTS `Subject_Access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subject_Access` (
  `SubjectAcs_ID` int NOT NULL AUTO_INCREMENT,
  `FK_person_S` int NOT NULL,
  `Access_FK_subject` int NOT NULL,
  PRIMARY KEY (`SubjectAcs_ID`),
  KEY `FK_person_S` (`FK_person_S`),
  KEY `Access_FK_subject` (`Access_FK_subject`),
  CONSTRAINT `Subject_Access_ibfk_1` FOREIGN KEY (`FK_person_S`) REFERENCES `People` (`Person_ID`),
  CONSTRAINT `Subject_Access_ibfk_2` FOREIGN KEY (`Access_FK_subject`) REFERENCES `subjects` (`Subject_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subject_Access`
--

LOCK TABLES `Subject_Access` WRITE;
/*!40000 ALTER TABLE `Subject_Access` DISABLE KEYS */;
INSERT INTO `Subject_Access` VALUES (1,3,5),(2,3,9),(4,3,1),(6,4,3),(7,4,4),(8,4,6),(9,4,7),(10,5,2),(11,5,7);
/*!40000 ALTER TABLE `Subject_Access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `Group_ID` int NOT NULL AUTO_INCREMENT,
  `Group_name` varchar(10) NOT NULL,
  PRIMARY KEY (`Group_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Т50-1-18'),(2,'П50-1-18'),(3,'П50-2-18'),(4,'П50-3-18'),(5,'ИС50-1-18'),(6,'ИС50-2-18'),(7,'ВД50-1-18'),(8,'ВД50-2-18'),(9,'БД50-1-18'),(10,'БД50-2-18');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `Subject_ID` int NOT NULL AUTO_INCREMENT,
  `Subject_name` varchar(100) NOT NULL,
  PRIMARY KEY (`Subject_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Технология разработки и обеспечения программных систем'),(2,'Английский язык в профессиональной деятельности'),(3,'Разработка мобильных приложений'),(4,'Обеспечение и функционирование сети'),(5,'Численные методы'),(6,'Технологии разработки и защиты баз данных'),(7,'Стандартизация, сертификация и техническое документоведение'),(8,'Проектирование и разработка веб-приложени'),(9,'Поддержка и тестирование программных модулей');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Journal'
--
/*!50003 DROP PROCEDURE IF EXISTS `datesList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pivomaster`@`%` PROCEDURE `datesList`(in p_subj varchar(100), in p_grp varchar(10))
begin
	SELECT Grade_date FROM `Grades` JOIN `subjects` ON Grades_FK_subject = Subject_ID
	WHERE Subject_name = p_subj
    AND `Grades_FK_person` = (SELECT Person_ID FROM `People`
	JOIN `Group_Access` ON Person_ID = FK_Person_G
	JOIN `groups` ON Group_ID = Access_FK_group
	JOIN `Grades` ON Grades_FK_person = Person_ID where Group_name = p_grp);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GroupsList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pivomaster`@`%` PROCEDURE `GroupsList`(in p_login2 varchar(20), in p_pass2 varchar(20))
begin
	SELECT Group_name FROM `groups` JOIN Group_Access ON Group_ID = Access_FK_group
	JOIN `People` ON Person_ID = FK_person_G WHERE login = p_login2 and `Password` = p_pass2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pivomaster`@`%` PROCEDURE `login`(in log varchar(20), in pas varchar(20))
BEGIN
	select `Role` from People where `login` = log and `Password` = pas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SubjectsList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`pivomaster`@`%` PROCEDURE `SubjectsList`(in p_login1 varchar(20), in p_pass1 varchar(20))
begin
	SELECT Subject_name FROM `subjects` JOIN Subject_Access ON Subject_ID = Access_FK_subject
	JOIN `People` ON Person_ID = FK_person_S WHERE login = p_login1 and `Password` = p_pass1;
end ;;
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

-- Dump completed on 2023-04-11 14:56:39
