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
-- Table structure for table `user_diary`
--

DROP TABLE IF EXISTS `user_diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_diary` (
  `diary_id` int(11) NOT NULL AUTO_INCREMENT,
  `diary_type` varchar(145) DEFAULT NULL,
  `diary_status` varchar(45) DEFAULT NULL,
  `file_number` int(11) DEFAULT NULL,
  `timestamp` date DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipenat_id` int(11) DEFAULT NULL,
  `diary_subject` varchar(145) DEFAULT NULL,
  `diary_description` varchar(145) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `approval_status` varchar(145) DEFAULT NULL,
  `approval_comment` varchar(145) DEFAULT NULL,
  `clouser_comment` varchar(145) DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`diary_id`),
  KEY `fk1_idx` (`file_number`),
  KEY `fk2_idx` (`sender_id`),
  KEY `fk3_idx` (`recipenat_id`),
  KEY `fk4_idx` (`attachment_id`),
  KEY `fk5_idx` (`approval_by`,`created_by`),
  KEY `fk6_idx` (`created_by`),
  CONSTRAINT `fk1` FOREIGN KEY (`file_number`) REFERENCES `user_file` (`user_file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2` FOREIGN KEY (`sender_id`) REFERENCES `user_profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3` FOREIGN KEY (`recipenat_id`) REFERENCES `recipent` (`recipent_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk4` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk5` FOREIGN KEY (`approval_by`) REFERENCES `user_profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk6` FOREIGN KEY (`created_by`) REFERENCES `user_profile` (`profileId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_diary`
--

LOCK TABLES `user_diary` WRITE;
/*!40000 ALTER TABLE `user_diary` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_diary` ENABLE KEYS */;
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
