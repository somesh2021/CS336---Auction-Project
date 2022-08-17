CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts` (
  `email` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`,`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES ('abc@gmail.com','John Doe','jd123','jd#123'),('abc@gmail.com','Tim C','tc237','tc#123');
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`username`,`name`),
  CONSTRAINT `alerts_ibfk_3` FOREIGN KEY (`username`) REFERENCES `Accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES ('jd123','Hollister Jeans'),('jd123','Nike Shoes');
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apparel`
--

DROP TABLE IF EXISTS `apparel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apparel` (
  `apid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `availability` enum('Yes','No') DEFAULT NULL,
  `color` varchar(15) NOT NULL,
  `type` enum('Shirt','Pant','Shoe') DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`apid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apparel`
--

LOCK TABLES `apparel` WRITE;
/*!40000 ALTER TABLE `apparel` DISABLE KEYS */;
INSERT INTO `apparel` VALUES (1,'Hollister T-Shirt','No','black','Shirt',65),(4,'Nike Shirt','No','White','Shirt',55),(5,'Hollister Jeans','No','Black','Pant',NULL),(9,'Nike Shoes','No','Black','Shoe',NULL),(10,'Levis T-Shirt','No','Black','Shirt',35),(11,'Adidas Shoe','No','Black','Shoe',63),(12,'Puma Shoes','Yes','Red','Shoe',40),(13,'Nike Shoes','Yes','Black','Shoe',NULL);
/*!40000 ALTER TABLE `apparel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions`
--

DROP TABLE IF EXISTS `auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions` (
  `aucid` int NOT NULL AUTO_INCREMENT,
  `apid` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `initial_price` float DEFAULT NULL,
  `minprice` float DEFAULT NULL,
  `increment` float DEFAULT NULL,
  `closing` datetime DEFAULT NULL,
  PRIMARY KEY (`aucid`,`apid`,`username`),
  KEY `apid` (`apid`),
  KEY `username` (`username`),
  CONSTRAINT `auctions_ibfk_1` FOREIGN KEY (`apid`) REFERENCES `Apparel` (`apid`),
  CONSTRAINT `auctions_ibfk_2` FOREIGN KEY (`username`) REFERENCES `Accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions`
--

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;
INSERT INTO `auctions` VALUES (3,1,'jd123',20,25,0.5,'2022-04-26 18:35:00'),(6,1,'jd123',45,50,0.5,'2022-05-05 11:00:00'),(7,1,'jd123',45,57,0.5,'2022-05-08 12:19:00'),(8,4,'jd123',40,50,1,'2022-05-08 12:30:00'),(9,5,'jd123',30,45,1,'2022-04-30 12:00:00'),(13,9,'tc237',30,40,1,'2022-04-16 21:00:00'),(14,10,'jd123',20,30,1,'2022-05-08 18:45:00'),(15,11,'tc237',45,55,1,'2022-05-08 18:53:00'),(16,12,'jd123',35,45,1,'2022-06-01 13:00:00');
/*!40000 ALTER TABLE `auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `bid_id` int NOT NULL AUTO_INCREMENT,
  `aucid` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `amount` float DEFAULT NULL,
  `upperlim` float DEFAULT NULL,
  `bidtype` enum('Manual','Automatic') DEFAULT NULL,
  PRIMARY KEY (`bid_id`,`aucid`,`username`),
  UNIQUE KEY `aucid` (`aucid`,`username`),
  UNIQUE KEY `aucid_2` (`aucid`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`aucid`) REFERENCES `auctions` (`aucid`) ON DELETE CASCADE,
  CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`username`) REFERENCES `Accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (3,6,'tc237',65,NULL,'Manual'),(8,7,'tc237',75,NULL,'Manual'),(10,8,'tc237',55,NULL,'Manual'),(13,14,'tc237',35,NULL,'Manual'),(18,16,'tc237',40,NULL,'Manual');
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerRep`
--

DROP TABLE IF EXISTS `CustomerRep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerRep` (
  `email` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerRep`
--

LOCK TABLES `CustomerRep` WRITE;
/*!40000 ALTER TABLE `CustomerRep` DISABLE KEYS */;
INSERT INTO `CustomerRep` VALUES ('ac@yahoo.com','Alex','cr1','cr#123'),('adf@gmail.com','John Tim','cr2','cr#123');
/*!40000 ALTER TABLE `CustomerRep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pants`
--

DROP TABLE IF EXISTS `Pants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pants` (
  `apid` int NOT NULL,
  `waist` int NOT NULL,
  `length` int NOT NULL,
  PRIMARY KEY (`apid`),
  CONSTRAINT `pants_ibfk_1` FOREIGN KEY (`apid`) REFERENCES `Apparel` (`apid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pants`
--

LOCK TABLES `Pants` WRITE;
/*!40000 ALTER TABLE `Pants` DISABLE KEYS */;
INSERT INTO `Pants` VALUES (5,32,30);
/*!40000 ALTER TABLE `Pants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `qid` int NOT NULL AUTO_INCREMENT,
  `question` varchar(300) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `username` (`username`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `Accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'How to change username?','jd123'),(2,'How to create an auction?','jd123'),(3,'How to change password?','jd123'),(4,'How to place a bid on an auction?','jd123');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replies` (
  `qid` int NOT NULL,
  `reply` varchar(300) DEFAULT NULL,
  `cruser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `cruser` (`cruser`),
  CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `questions` (`qid`),
  CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`cruser`) REFERENCES `CustomerRep` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` VALUES (1,'You cannot change username.','cr1'),(4,'You go to buyer portal and see active auctions/bids.','cr1');
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shirts`
--

DROP TABLE IF EXISTS `Shirts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shirts` (
  `apid` int NOT NULL,
  `size` enum('S','M','L','XL') NOT NULL,
  PRIMARY KEY (`apid`),
  CONSTRAINT `shirts_ibfk_1` FOREIGN KEY (`apid`) REFERENCES `Apparel` (`apid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shirts`
--

LOCK TABLES `Shirts` WRITE;
/*!40000 ALTER TABLE `Shirts` DISABLE KEYS */;
INSERT INTO `Shirts` VALUES (1,'S'),(4,'M'),(10,'M');
/*!40000 ALTER TABLE `Shirts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shoes`
--

DROP TABLE IF EXISTS `Shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shoes` (
  `apid` int NOT NULL,
  `size` int NOT NULL,
  PRIMARY KEY (`apid`),
  CONSTRAINT `shoes_ibfk_1` FOREIGN KEY (`apid`) REFERENCES `Apparel` (`apid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shoes`
--

LOCK TABLES `Shoes` WRITE;
/*!40000 ALTER TABLE `Shoes` DISABLE KEYS */;
INSERT INTO `Shoes` VALUES (9,9),(11,8),(12,10),(13,10);
/*!40000 ALTER TABLE `Shoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winners`
--

DROP TABLE IF EXISTS `winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winners` (
  `aucid` int NOT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `buyer` varchar(50) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `apid` int DEFAULT NULL,
  PRIMARY KEY (`aucid`),
  KEY `apid` (`apid`),
  KEY `seller` (`seller`),
  KEY `buyer` (`buyer`),
  CONSTRAINT `winners_ibfk_4` FOREIGN KEY (`apid`) REFERENCES `Apparel` (`apid`),
  CONSTRAINT `winners_ibfk_5` FOREIGN KEY (`aucid`) REFERENCES `auctions` (`aucid`) ON DELETE CASCADE,
  CONSTRAINT `winners_ibfk_6` FOREIGN KEY (`seller`) REFERENCES `Accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `winners_ibfk_7` FOREIGN KEY (`buyer`) REFERENCES `Accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winners`
--

LOCK TABLES `winners` WRITE;
/*!40000 ALTER TABLE `winners` DISABLE KEYS */;
INSERT INTO `winners` VALUES (6,'jd123','tc237',65,1),(8,'jd123','tc237',55,4),(14,'jd123','tc237',35,10),(15,'tc237','jd123',63,11);
/*!40000 ALTER TABLE `winners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-08 19:39:43
