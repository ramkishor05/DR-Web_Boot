-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: drdo
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `login_info`
--

DROP TABLE IF EXISTS `login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_info` (
  `LOGIN_ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(254) NOT NULL,
  `PASSWORD` varchar(60) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `LOCKED` char(1) DEFAULT NULL,
  `LAST_LOGIN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(254) DEFAULT NULL,
  `CREATED_TS` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UPD_BY` varchar(254) DEFAULT NULL,
  `UPD_TS` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PROFILE_ID` int(10) DEFAULT NULL,
  `ENABLED` char(1) DEFAULT NULL,
  PRIMARY KEY (`LOGIN_ID`),
  KEY `login_info_ibfk_1` (`PROFILE_ID`),
  KEY `login_info_role` (`ROLE_ID`),
  CONSTRAINT `login_info_ibfk_1` FOREIGN KEY (`PROFILE_ID`) REFERENCES `user_profile` (`profileId`),
  CONSTRAINT `login_info_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_info`
--

LOCK TABLES `login_info` WRITE;
/*!40000 ALTER TABLE `login_info` DISABLE KEYS */;
INSERT INTO `login_info` VALUES (1,'dipakkumarprasad2017@gmail.com','$2a$10$Y448/iteU5Ozu3/x3SXuU.iSwSckjnjHN.wAm0GBl9ZkbhHvPbDLK',1,'Y','N','2018-10-28 06:23:07','abhinavyash.kumar@gmail.com','2018-05-13 04:17:38','dipakkumarprasad2017@gmail.com','2018-06-07 19:49:10',1,'Y'),(309,'dipakpsd@gmail.com','$2a$10$YF2MySjEZ9BZqZ0wRVMX2.tvCQf1OG72OG8xLqnKq5BBc1Y0v2wui',1,'Y','N','2018-09-30 18:18:57','dipakkumarprasad2017@gmail.com','2018-09-30 18:18:57','dipakkumarprasad2017@gmail.com','2018-09-30 18:18:57',74,'Y'),(310,'sanjay@gmail.com','$2a$10$wQR3g0EM9nrKUflXrJ5rlu9g9G89A.FCgA2tlKP72qtxDZLNTkRb2',1,'Y','N','2018-10-02 09:39:59','dipakkumarprasad2017@gmail.com','2018-10-02 09:39:59','dipakkumarprasad2017@gmail.com','2018-10-02 09:39:59',75,'Y'),(311,'anup@abcd.com','$2a$10$TZjrzXElpEvoUM/Re2qSRuwMBg4AuzOQd..xYwqMiO0GKv5c5k60q',2,'Y','N','2018-10-28 06:16:30','dipakkumarprasad2017@gmail.com','2018-10-06 17:39:32','dipakkumarprasad2017@gmail.com','2018-10-06 17:39:32',76,'Y'),(312,'sanjay@gmail.com','$2a$10$15BRUXpv/1IpbEa6IlcInewiQpI4lKT7GO3cgGVwcHT.Bz72WUjdC',2,'Y','N','2018-10-12 18:02:41','dipakkumarprasad2017@gmail.com','2018-10-12 18:02:41','dipakkumarprasad2017@gmail.com','2018-10-12 18:02:41',77,'Y'),(313,'abinav@abcd.com','$2a$10$EFEgMr6cKP2dLEohrSQKPucDbV6l6DZCxgr3LB/s/AN4vj2AoERd2',3,'Y','N','2018-10-12 18:06:18','dipakkumarprasad2017@gmail.com','2018-10-12 18:06:18','dipakkumarprasad2017@gmail.com','2018-10-12 18:06:18',78,'Y'),(320,'elephantuncle@gmail.com','$2a$10$v/dgQIXVhMo3OxxXJEavQuOP03gOWFLVABj6US2wPAkD0t6E9dWVe',2,'Y','N','2018-10-27 20:28:07','dipakkumarprasad2017@gmail.com','2018-10-27 20:28:07','dipakkumarprasad2017@gmail.com','2018-10-27 20:28:07',79,'Y'),(321,'amit@abcd.com','$2a$10$hwWjsToksjJyuA3GWrLzMORiASXzPu0SNYqNwLFU6q8/tCKyiMZOu',2,'Y','N','2018-10-28 06:17:31','dipakkumarprasad2017@gmail.com','2018-10-28 06:17:31','dipakkumarprasad2017@gmail.com','2018-10-28 06:17:31',80,'Y');
/*!40000 ALTER TABLE `login_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-03  1:40:00
