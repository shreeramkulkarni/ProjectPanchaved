-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: panchaved_data
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminID` bigint(20) DEFAULT NULL,
  `adminName` varchar(25) DEFAULT NULL,
  `adminAddress` varchar(250) DEFAULT NULL,
  `adminDOB` date DEFAULT NULL,
  `adminAadhar` bigint(20) DEFAULT NULL,
  KEY `fk_name_admin` (`adminID`),
  CONSTRAINT `fk_name_admin` FOREIGN KEY (`adminID`) REFERENCES `employee` (`employeePhone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (789461237,'adminname','a','1997-01-01',123456789123),(9876543219,'adminnamename','a','1997-01-01',123456789123);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctorID` bigint(20) DEFAULT NULL,
  `doctorName` varchar(45) DEFAULT NULL,
  `doctorDOB` date DEFAULT NULL,
  `doctorQualification` varchar(45) DEFAULT NULL,
  `doctorAddress` varchar(45) DEFAULT NULL,
  `doctorCity` varchar(45) DEFAULT NULL,
  KEY `fk_name` (`doctorID`),
  CONSTRAINT `fk_name` FOREIGN KEY (`doctorID`) REFERENCES `employee` (`employeePhone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (9552951410,'Shreeram','1998-03-26','BE','4th Floor, Kashinath Patil Nagar, Balajinagar','PUNE'),(9049425095,'Nilesh Sanjay Suryawanshi','1998-10-08','','Katraj','PUNE'),(9503293405,'Dattaraj','1998-10-08','MD','jaj','jsiau');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int(11) DEFAULT NULL,
  `employeePhone` bigint(20) NOT NULL,
  PRIMARY KEY (`employeePhone`),
  UNIQUE KEY `employeeID` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,9552951410),(2,9049425095),(3,789461237),(4,9876543219),(5,9503293405);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `userID` bigint(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `securityQuestion` varchar(50) DEFAULT NULL,
  `securityAnswer` varchar(50) DEFAULT NULL,
  `handlerType` varchar(25) DEFAULT NULL,
  UNIQUE KEY `userID` (`userID`),
  CONSTRAINT `fk_name_login` FOREIGN KEY (`userID`) REFERENCES `employee` (`employeePhone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (789461237,'admin123','Pet Name','DOG','admin'),(9503293405,'123','Milk','MILK','Doctor');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `patientName` varchar(45) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `phoneNo` bigint(15) DEFAULT NULL,
  `bloodGroup` varchar(5) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `casetaking` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`patientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'abhay','m',79998,'b+','1998-03-15','dsn','kjn','nk','ETC',NULL),(2,'sajs','Male',79598,'B+','1998-03-15','dsn','kjn','asa','sa',NULL),(3,'rana','Male',445464,'A+','1998-03-15','sa','s','Maharashtra','d',NULL),(4,'prada','Female',546,'O+','1998-03-15','jh','hj','Maharashtra','gf',NULL),(5,'vaibhav','Male',788789,'B+','1998-03-15','sjk','kjddd','rewq','h',NULL),(6,'sakj','Female',7878454512,'A+','1998-03-15','sa','sa','Maharashtra','da',NULL),(7,'sakj','Female',7878454512,'A+','1998-03-15','4th Floor, Kashinath Patil Nagar, Balajinagar','sa','MAHARASHTRA','da',NULL),(8,'Shreeram','Male',9552951410,'B+','1998-03-26','Kalpana Apartment, Prabhat Road, Nal Stop, Erandwane','Pune','Maharashtra','came here to get well',NULL),(9,'sakj','Female',7878454512,'A+','1998-03-15','sa','sa','sa','da',NULL),(10,'sakj','Female',7878454512,'A+','1998-03-15','Vimannagar','sa','sa','da',NULL),(11,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(12,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(15,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(16,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(17,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(18,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(19,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(20,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(21,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(22,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(23,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(24,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(25,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(26,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(27,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(28,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(29,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(30,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(31,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(32,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(33,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(34,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(35,'sakj','f',7878454512,'a+','1998-03-15','sa','sa','sa','da',NULL),(200,'dsf','Male',6878784613,'O-','2016-11-27','sdjkf','jkdsb','qjk','skdjb',''),(355,'ww','Male',9996634123,'100','2015-05-02','k','lk','kl','d',''),(361,'','Male',9552951410,'O+','2019-11-27','pune','pune ','Maharashtra','came here to get well',''),(371,'lomu','Male',4545787845,'AB-','1996-10-04','a','j','maam','d',''),(381,'dsj','Female',4556789817,'100','1982-10-08','sadgsjag','hdsjh','jhsaj','',''),(477,'Hemya','Male',9563142780,'O-','1982-01-05','skg','jkdsg','dukgk','sdkh',''),(546,'ajsdghbkjsgf','Male',9325461788,'O-','2019-11-06','asf','hulk','qaerw','tyh',''),(988,'','Male',9426876135,'O-','2006-11-07','','','','','');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-30 14:43:16
