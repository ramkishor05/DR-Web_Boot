-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: drdo
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line` varchar(245) DEFAULT NULL,
  `address_city` varchar(145) DEFAULT NULL,
  `address_state` varchar(145) DEFAULT NULL,
  `address_pin` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'noida','noida','Uttar Pradesh',201301),(80,'abcd1','noida','Uttar Pradesh',201005),(81,'abcd1','noida','Uttar Pradesh',201005),(82,'abcd1','noida','Uttar Pradesh',201005),(83,'abcd1','noida','Uttar Pradesh',201005),(84,'abcd1','noida','Uttar Pradesh',201005),(85,'abcd1','noida','Jharkhand',201005),(86,'abcd123','noida','Andaman and Nicobar Islands',201005),(93,NULL,NULL,NULL,NULL),(94,NULL,NULL,NULL,NULL),(95,'Shamli','Shamli','Uttar Pradesh',247776),(96,'aaaa','ghaziabad','Uttar Pradesh',112233),(97,'sadasd','noida','Gujarat',201301),(98,'','','',NULL),(99,'','','',NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assignment` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_to` int(11) DEFAULT NULL,
  `assign_from` int(11) DEFAULT NULL,
  `timestamp` date DEFAULT NULL,
  `diary_id` int(11) DEFAULT NULL,
  `approval_status` varchar(1) DEFAULT NULL,
  `approver_comment` varchar(45) DEFAULT NULL,
  `column_active` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `ass2_idx` (`assign_to`),
  KEY `ass3_idx` (`assign_from`),
  KEY `ass3_idx1` (`diary_id`),
  CONSTRAINT `ass2` FOREIGN KEY (`assign_to`) REFERENCES `user_profile` (`profileid`),
  CONSTRAINT `ass3` FOREIGN KEY (`assign_from`) REFERENCES `user_profile` (`profileid`),
  CONSTRAINT `ass4` FOREIGN KEY (`diary_id`) REFERENCES `user_diary` (`diary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (3,82,81,'2018-11-25',30,NULL,NULL,'N'),(4,83,82,'2018-11-25',30,'Y','Approved by Dipak','N'),(5,1,83,'2018-11-25',30,'Y','Approved by Anup','N'),(6,NULL,1,'2018-11-25',30,'Y','I approve','N'),(7,82,81,'2018-11-25',32,NULL,NULL,'N'),(8,83,82,'2018-11-25',32,'Y','Approved by Dipak1','N'),(9,1,83,'2018-11-25',32,'Y','Approved by Anup1','N'),(10,NULL,1,'2018-11-25',32,'Y','admin app','Y');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(45) DEFAULT NULL,
  `description` varchar(145) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `content_path` varchar(45) DEFAULT NULL,
  `diary_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_detail`
--

DROP TABLE IF EXISTS `basic_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `basic_detail` (
  `basic_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(45) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `till_date` date DEFAULT NULL,
  `research_area` varchar(145) DEFAULT NULL,
  `interested_research_area` varchar(145) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `research_paper` varchar(145) DEFAULT NULL,
  `patent` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`basic_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_detail`
--

LOCK TABLES `basic_detail` WRITE;
/*!40000 ALTER TABLE `basic_detail` DISABLE KEYS */;
INSERT INTO `basic_detail` VALUES (3,'manager','2018-11-24','2018-11-24','tytytyt','bbb','mca','rrrr','2'),(4,'Group Head','2018-11-24','2018-11-24','wwww','eeee','rrrr','tttt','5'),(5,'manager','2018-11-25','2018-11-25','tytytyt','qqq','ccc','tttt','2');
/*!40000 ALTER TABLE `basic_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(145) NOT NULL,
  `dept_head` varchar(145) DEFAULT NULL,
  `dept_description` varchar(145) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `dept_div_fk_idx` (`division_id`),
  CONSTRAINT `dept_div_fk` FOREIGN KEY (`division_id`) REFERENCES `division` (`divsion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Dept1','Dipak','Dpetartment One',1),(2,'Dept2',NULL,'Department Two',1),(3,'Dept 2',NULL,'Department 2222',2),(4,'aman dept',NULL,'aman deptttttttt',2);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `division` (
  `divsion_id` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(45) DEFAULT NULL,
  `division_head` int(11) DEFAULT NULL,
  PRIMARY KEY (`divsion_id`),
  KEY `divfk1_idx` (`division_head`),
  CONSTRAINT `divfk1` FOREIGN KEY (`division_head`) REFERENCES `user_profile` (`profileid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Div1',NULL),(2,'Div2',NULL);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drdogroup`
--

DROP TABLE IF EXISTS `drdogroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drdogroup` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(145) DEFAULT NULL,
  `comment` varchar(145) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `dept_group_fk_idx` (`dept_id`),
  CONSTRAINT `dept_group_fk` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drdogroup`
--

LOCK TABLES `drdogroup` WRITE;
/*!40000 ALTER TABLE `drdogroup` DISABLE KEYS */;
INSERT INTO `drdogroup` VALUES (35,'A group','A group comment',NULL,1),(36,'B group','B group comment',NULL,1),(38,'Div2 GroupB','myyyyyyy groupppppppp',NULL,3),(39,'My group','this is my group',NULL,1);
/*!40000 ALTER TABLE `drdogroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `formation` (
  `formation_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`formation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
INSERT INTO `formation` VALUES (1,1,NULL,NULL,NULL),(2,81,1,1,35),(3,82,1,1,35),(4,83,1,1,NULL),(5,NULL,1,2,35),(6,NULL,1,1,36);
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_info`
--

DROP TABLE IF EXISTS `login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  CONSTRAINT `login_info_ibfk_1` FOREIGN KEY (`PROFILE_ID`) REFERENCES `user_profile` (`profileid`),
  CONSTRAINT `login_info_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_info`
--

LOCK TABLES `login_info` WRITE;
/*!40000 ALTER TABLE `login_info` DISABLE KEYS */;
INSERT INTO `login_info` VALUES (1,'admin@admin.com','$2a$10$Y448/iteU5Ozu3/x3SXuU.iSwSckjnjHN.wAm0GBl9ZkbhHvPbDLK',1,'Y','N','2018-11-23 19:31:22','admin@admin.com','2018-05-13 04:17:38','admin@admin.com','2018-06-07 19:49:10',1,'Y'),(322,'aman@gmail.com','$2a$10$OIuDLftBbazEw/wlLcR99.Q4EBvQlr/0rCe8pEykjJTOmsTk3cqge',4,'Y','N','2018-11-23 19:49:24','admin@admin.com','2018-11-23 19:39:35','admin@admin.com','2018-11-23 20:06:28',81,'Y'),(323,'dipak@group.com','$2a$10$mmGiTxX3Ke5obyU5anqul.eSKVBiXQZWjFp7cdtlxS7RNCzOm88FC',3,'Y','N','2018-11-24 09:15:54','admin@admin.com','2018-11-24 09:15:54','admin@admin.com','2018-11-24 09:15:54',82,'Y'),(324,'anup@gmail.com','$2a$10$/08IQIhkgvCXFDZKL2/9HOumeqDBFLyALkr2EQnHlxf5fb/VBtRl2',2,'Y','N','2018-11-25 06:09:56','admin@admin.com','2018-11-25 06:09:56','admin@admin.com','2018-11-25 06:09:56',83,'Y'),(325,'mili@gmail.com','$2a$10$v9weRAIwGPbT7aKfv2Q3LeAkU3dgfE0np3StAk8cY4SHI9js7igZC',4,'Y','N','2018-11-25 10:06:48','admin@admin.com','2018-11-25 10:06:48','admin@admin.com','2018-11-25 10:06:48',84,'Y'),(326,'shanu@gmail.com','$2a$10$ANQXWHyUv.otGvvgNzwpoeze5eUximrZZ8lPVJorasWdJyuRVAhXG',3,'Y','N','2018-11-26 17:36:12','admin@admin.com','2018-11-26 17:36:12','admin@admin.com','2018-11-26 17:36:12',85,'Y');
/*!40000 ALTER TABLE `login_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login_log` (
  `login_log_id` bigint(100) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `login_at` timestamp NULL DEFAULT NULL,
  `logout_at` timestamp NULL DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_log_id`),
  KEY `FK_login_log_user_profile` (`profile_id`),
  CONSTRAINT `FK_login_log_user_profile` FOREIGN KEY (`profile_id`) REFERENCES `user_profile` (`profileid`)
) ENGINE=InnoDB AUTO_INCREMENT=2535 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_log`
--

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
INSERT INTO `login_log` VALUES (2455,1,'2018-11-22 20:42:05',NULL,'CFA5BD98DE2D419130E9096651614679'),(2456,1,'2018-11-23 19:25:21','2018-11-23 19:31:20','38A4323F8FEE6A452A76E33BF867385D'),(2457,1,'2018-11-23 19:26:52',NULL,'38A4323F8FEE6A452A76E33BF867385D'),(2458,1,'2018-11-23 19:31:22','2018-11-23 19:48:26','74650EFE07E2039FB2457B08A5F248C5'),(2459,81,'2018-11-23 19:48:26',NULL,'94DB0CDBB1C5548F5847508688B33F96'),(2460,81,'2018-11-23 19:49:24',NULL,'94DB0CDBB1C5548F5847508688B33F96'),(2461,81,'2018-11-23 20:05:19',NULL,'79DFF06E7E16D332B2773C97D4D8C502'),(2462,81,'2018-11-23 20:16:49',NULL,'2E39636FF0D733BFCDA438C883CCA56B'),(2463,81,'2018-11-23 20:22:00',NULL,'CC0156C6BACB6CD6F7AE228E3A5875FC'),(2464,81,'2018-11-23 20:31:56',NULL,'371DC0E3F655A1BDD7E76EC129BAE46A'),(2465,81,'2018-11-23 23:15:50',NULL,'9CD24F0354B5596F07F6D9C5A547EE5D'),(2466,81,'2018-11-23 23:39:43',NULL,'91F51C5E559F923A30B23B59C8FCEAD8'),(2467,81,'2018-11-23 23:42:44',NULL,'6FEB4D0EDC9D05FEC993A3E4AAD51F16'),(2468,81,'2018-11-24 00:04:03',NULL,'47F24FB0AE178E43E980F899B5BC793A'),(2469,81,'2018-11-24 00:06:53',NULL,'7800092FE2FD1AED63CDA3FB5D257CB7'),(2470,81,'2018-11-24 00:09:51',NULL,'95A3B934F23C57404E846F75493497B5'),(2471,81,'2018-11-24 00:12:51',NULL,'6C05A00156F05EF6A976ED77F8A0AADA'),(2472,81,'2018-11-24 00:14:51',NULL,'D2A687FE42256C7E76B0022045D7F089'),(2473,81,'2018-11-24 00:18:21',NULL,'8DB9645B26138EE0BA91655F1DD43E61'),(2474,1,'2018-11-24 00:29:40','2018-11-24 00:30:34','4E986457F60B56F384A9DE8E0A46AB89'),(2475,81,'2018-11-24 00:30:34',NULL,'6FF2B13313431ACADBDDA826BAEA79C3'),(2476,81,'2018-11-24 00:30:42',NULL,'6FF2B13313431ACADBDDA826BAEA79C3'),(2477,81,'2018-11-24 08:35:39','2018-11-24 09:00:25','66D272DB92C27EE900E214372B04DC1A'),(2478,1,'2018-11-24 09:00:25','2018-11-24 09:17:21','FC8B45390E587A6F3192306F136AF5E1'),(2479,82,'2018-11-24 09:17:21',NULL,'F3710BB52EDBCBCA67A943357CAC692E'),(2480,82,'2018-11-24 09:18:44',NULL,'F3710BB52EDBCBCA67A943357CAC692E'),(2481,81,'2018-11-24 09:30:36',NULL,'E78ED317BFE4AEC89E296E0041FA4069'),(2482,81,'2018-11-24 09:42:50',NULL,'37C807841E21558FEA638122D35C26A7'),(2483,81,'2018-11-25 04:11:38',NULL,'856381950B52E0AACA5EFF8F97191C38'),(2484,81,'2018-11-25 04:12:35',NULL,'856381950B52E0AACA5EFF8F97191C38'),(2485,81,'2018-11-25 05:36:18','2018-11-25 05:38:23','10FA4551C6550D2E9DE0792810CAFFED'),(2486,81,'2018-11-25 05:37:53',NULL,'10FA4551C6550D2E9DE0792810CAFFED'),(2487,82,'2018-11-25 05:38:23',NULL,'8DFCFD7EE221C8866923634BFBB36C89'),(2488,82,'2018-11-25 05:44:39',NULL,'8A8DC64B909C0AD42A812ADF8314E168'),(2489,82,'2018-11-25 05:45:24',NULL,'8A8DC64B909C0AD42A812ADF8314E168'),(2490,82,'2018-11-25 05:53:18',NULL,'A9E1BAC18B8BB634397B8194C8BBD52A'),(2491,82,'2018-11-25 05:56:54','2018-11-25 05:59:53','7915A2EAAC2336958ABC26795EB04B08'),(2492,82,'2018-11-25 05:57:38',NULL,'7915A2EAAC2336958ABC26795EB04B08'),(2493,1,'2018-11-25 06:00:04',NULL,'5BD14EE30FF62D33C1F19EC692965D9B'),(2494,1,'2018-11-25 06:08:47','2018-11-25 06:11:02','40E70BB7120477030EAA3EC182DCA39A'),(2495,83,'2018-11-25 06:11:02','2018-11-25 06:13:13','CCD87360D622DCF81FB93200310CFC95'),(2496,83,'2018-11-25 06:12:05',NULL,'CCD87360D622DCF81FB93200310CFC95'),(2497,82,'2018-11-25 06:13:13',NULL,'7BA69AEDE32BBFD231E2B59DE2A4EDAB'),(2498,82,'2018-11-25 06:13:24',NULL,'7BA69AEDE32BBFD231E2B59DE2A4EDAB'),(2499,82,'2018-11-25 06:25:36',NULL,'E75E29ADC18C6D745A41B29BC907EA2E'),(2500,82,'2018-11-25 06:25:50',NULL,'E75E29ADC18C6D745A41B29BC907EA2E'),(2501,82,'2018-11-25 06:27:55',NULL,'E75E29ADC18C6D745A41B29BC907EA2E'),(2502,82,'2018-11-25 06:30:29',NULL,'E75E29ADC18C6D745A41B29BC907EA2E'),(2503,82,'2018-11-25 06:33:00',NULL,'E75E29ADC18C6D745A41B29BC907EA2E'),(2504,83,'2018-11-25 06:35:41',NULL,'BB966324819DC3F2ACC3BA32EDED5291'),(2505,83,'2018-11-25 06:36:51',NULL,'BB966324819DC3F2ACC3BA32EDED5291'),(2506,83,'2018-11-25 06:43:45',NULL,'FEDC74734DD33FC43A365E12B30DC5E9'),(2507,83,'2018-11-25 06:45:24',NULL,'B4BDFD8D6D5CF04B5BBDE046F1B818FF'),(2508,83,'2018-11-25 06:47:59',NULL,'13B32D67C0AF2CD6F79B108B3AFC14E8'),(2509,83,'2018-11-25 06:48:18',NULL,'13B32D67C0AF2CD6F79B108B3AFC14E8'),(2510,1,'2018-11-25 06:55:44',NULL,'17D5EA0B75DC4DF6EFF4248FE5E0FFE9'),(2511,1,'2018-11-25 06:56:40',NULL,'22E8A2F03B5C1B34B2145943DE74E83E'),(2512,1,'2018-11-25 06:58:38',NULL,'31FC13C1D137475D0E404657AD67A55F'),(2513,1,'2018-11-25 07:02:34',NULL,'BB6FCCBDE3B36B3484B55552291243AF'),(2514,81,'2018-11-25 07:25:29',NULL,'7171CD088D011434946421D80ADE8FFC'),(2515,81,'2018-11-25 07:26:05',NULL,'7171CD088D011434946421D80ADE8FFC'),(2516,81,'2018-11-25 07:28:53','2018-11-25 07:30:03','89A2FBE8EFF32517A1EE480F56FA45C3'),(2517,81,'2018-11-25 07:29:39',NULL,'89A2FBE8EFF32517A1EE480F56FA45C3'),(2518,82,'2018-11-25 07:30:04','2018-11-25 07:32:01','2ABE71082DBC4436AE839348BE6FD83A'),(2519,83,'2018-11-25 07:32:01','2018-11-25 07:32:28','C3F7F8F0E7DADC189D484E16C5E26ABF'),(2520,1,'2018-11-25 07:32:28','2018-11-25 07:34:30','74E5A1162DBDDD5B074D3CE4784ABC12'),(2521,1,'2018-11-25 09:46:02',NULL,'2C0E60C6DAF51D423FC56291598B971D'),(2522,1,'2018-11-25 10:05:35',NULL,'178B57FDCA7C2BBE7EB1AD73EC4E9B0D'),(2523,1,'2018-11-25 13:00:07',NULL,'D690028480C42561BD2B6C04FE772E89'),(2524,1,'2018-11-26 11:29:37',NULL,'03E477C274139B54E509B0A02DA2799E'),(2525,1,'2018-11-26 11:37:18',NULL,'A31FD52D3C7C4A84DA2E2480E8E8DCE6'),(2526,1,'2018-11-26 11:39:46',NULL,'6D83813A9D874946979B0B8F324796E8'),(2527,1,'2018-11-26 12:04:04',NULL,'7F4ABFDDAB24A7771B1FC0FB4F8CB325'),(2528,1,'2018-11-26 12:15:53',NULL,'4ECAD74FEE862D8BDA08C1D81E7CBF2C'),(2529,1,'2018-11-26 16:00:25',NULL,'1D26272A7C0252BFA788EF8DD6C9E1F3'),(2530,1,'2018-11-26 16:09:11',NULL,'6DED44BD194A226CC5B1B0BB46C6C957'),(2531,1,'2018-11-26 16:42:52',NULL,'14D2585216F9CCEBB998B6797F2E1DA5'),(2532,1,'2018-11-26 16:52:40',NULL,'0D0BBBC3D9970D5ADE47C4331BC83E9F'),(2533,1,'2018-11-26 17:15:35',NULL,'8C9D96CF25B6CDAFA31DCCA21C37880D'),(2534,81,'2018-11-26 17:58:16',NULL,'EBC8376453658E4D05D061BC13A59036');
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipent`
--

DROP TABLE IF EXISTS `recipent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recipent` (
  `recipent_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(145) DEFAULT NULL,
  `designation` varchar(145) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `recipent_for` int(11) DEFAULT NULL,
  `office_number` int(11) DEFAULT NULL,
  `ext` int(11) DEFAULT NULL,
  PRIMARY KEY (`recipent_id`),
  KEY `fk1_idx` (`address_id`),
  KEY `rec2_idx` (`recipent_for`),
  CONSTRAINT `rec1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `rec2` FOREIGN KEY (`recipent_for`) REFERENCES `user_diary` (`diary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipent`
--

LOCK TABLES `recipent` WRITE;
/*!40000 ALTER TABLE `recipent` DISABLE KEYS */;
INSERT INTO `recipent` VALUES (1,'aman','verma',NULL,24,6655,91),(2,'aman','dev',NULL,25,56756,54),(3,'aman','dev',NULL,25,56756,54),(4,'aman','dev',NULL,25,56756,54),(5,'aman','ddd',NULL,26,345,345345),(6,'sasda','xcvxc',NULL,27,678678,56),(7,'anup','rrrr',NULL,28,5566,65),(8,'dfsf','zxc',NULL,29,5675,54),(9,'qqqqq','wwwww',NULL,30,44455,66),(10,'add','sadsa',NULL,32,67868,56);
/*!40000 ALTER TABLE `recipent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_diary`
--

DROP TABLE IF EXISTS `user_diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_diary` (
  `diary_id` int(11) NOT NULL AUTO_INCREMENT,
  `diary_type` varchar(145) DEFAULT NULL,
  `diary_status` varchar(45) DEFAULT NULL,
  `file_number` int(11) DEFAULT NULL,
  `timestamp` date DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `approval_status` varchar(145) DEFAULT NULL,
  `approval_comment` varchar(145) DEFAULT NULL,
  `clouser_comment` varchar(145) DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `diary_no` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`diary_id`),
  KEY `fk1_idx` (`file_number`),
  KEY `fk2_idx` (`sender_id`),
  KEY `fk4_idx` (`attachment_id`),
  KEY `fk5_idx` (`approval_by`,`created_by`),
  KEY `fk6_idx` (`created_by`),
  CONSTRAINT `fk1` FOREIGN KEY (`file_number`) REFERENCES `user_file` (`user_file_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`sender_id`) REFERENCES `user_profile` (`profileid`),
  CONSTRAINT `fk4` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`),
  CONSTRAINT `fk5` FOREIGN KEY (`approval_by`) REFERENCES `user_profile` (`profileid`),
  CONSTRAINT `fk6` FOREIGN KEY (`created_by`) REFERENCES `user_profile` (`profileid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_diary`
--

LOCK TABLES `user_diary` WRITE;
/*!40000 ALTER TABLE `user_diary` DISABLE KEYS */;
INSERT INTO `user_diary` VALUES (1,'external',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1111/22/333'),(13,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'97981/2018/11/24'),(14,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'57999/2018/11/24'),(15,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'55660/2018/11/24'),(16,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'74812/2018/11/24'),(17,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'69073/2018/11/24'),(18,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'70617/2018/11/24'),(19,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'31195/2018/11/24'),(20,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'21050/2018/11/24'),(21,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'99928/2018/11/24'),(22,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'91540/2018/11/24'),(23,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'98855/2018/11/24'),(24,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'53629/2018/11/24'),(25,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'12062/2018/11/24'),(26,'external','open',NULL,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'90497/2018/11/24'),(27,'external','open',1,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'95698/2018/11/24'),(28,'external','open',2,'2018-11-24',81,NULL,NULL,NULL,NULL,NULL,81,'37396/2018/11/24'),(29,'external','open',3,'2018-11-25',81,NULL,NULL,NULL,NULL,NULL,81,'8431/2018/11/25'),(30,'external','open',4,'2018-11-25',81,NULL,NULL,NULL,NULL,NULL,81,'79205/2018/11/25'),(32,'external','open',6,'2018-11-25',81,NULL,NULL,NULL,NULL,NULL,81,'63052/2018/11/25'),(33,'external','open',NULL,'2018-11-26',81,NULL,NULL,NULL,NULL,NULL,81,'45396/2018/11/26');
/*!40000 ALTER TABLE `user_diary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_file`
--

DROP TABLE IF EXISTS `user_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_file` (
  `user_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_number` varchar(45) DEFAULT NULL,
  `file_description` varchar(145) DEFAULT NULL,
  `file_name` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`user_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_file`
--

LOCK TABLES `user_file` WRITE;
/*!40000 ALTER TABLE `user_file` DISABLE KEYS */;
INSERT INTO `user_file` VALUES (1,NULL,'bbbbbb','aaaa'),(2,'23098/2018/11','my diary description','my diary'),(3,'340894/2018/11','bbbbbb','aaaa'),(4,'55388/2018/11','jjjjjjj kkkk lll','yyyyyyyyy'),(6,'308177/2018/11','diary2 Desssssss','Diary2');
/*!40000 ALTER TABLE `user_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_profile` (
  `profileId` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) DEFAULT NULL,
  `profilePic` longblob,
  `userName` varchar(145) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `regnDate` date DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `createdByRole` varchar(45) DEFAULT NULL,
  `createdTs` date DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `extension` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `replaceBy` int(11) DEFAULT NULL,
  `expirationDate` date DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `prefix` varchar(5) DEFAULT NULL,
  `basic_detail` int(11) DEFAULT NULL,
  `formation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`profileId`),
  KEY `user_profile_addressId` (`address_id`),
  KEY `FK_user_profile_role_idx` (`role_id`),
  KEY `grp_fk_idx` (`groupId`),
  KEY `fk_basic_detail_idx` (`basic_detail`),
  KEY `dept_id_fk_idx` (`department_id`),
  KEY `for_fk_idx` (`formation_id`),
  CONSTRAINT `FK_user_profile_role` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`user_role_id`),
  CONSTRAINT `dept_id_fk` FOREIGN KEY (`department_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `fk_basic_detail` FOREIGN KEY (`basic_detail`) REFERENCES `basic_detail` (`basic_detail_id`),
  CONSTRAINT `for_fk` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`formation_id`),
  CONSTRAINT `formation_fk` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`formation_id`),
  CONSTRAINT `grp_fk` FOREIGN KEY (`groupId`) REFERENCES `drdogroup` (`group_id`),
  CONSTRAINT `user_profile_addressId` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,1,_binary 'ÿØÿà\0JFIF\0\0`\0`\0\0ÿÛ\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÛ\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÂ\0(à\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ë0õyA€C\0\0&\0CÀC\0†(\0Ä0L\0\0!‚!‚‹uâìsë+¯9tªúäSl­0ó»<ÍLTí¯xÊB{À£\"P�Ò•JTªnÄ¥”lRÅJ6,ÀC0CBI0JH€Á0‚lÁ1ˆd!‚cÁ\0\0‰€\0\0\0\00C0C˜u:Q¿‡¡f�2Ù¢™¦›¹z%½MžyMtÆxÝâ¨ÉÙ\"Ken°%fu’•\nVD\0i\nm!ˆ†€\0\0C’Elb\0\0À\0\0\0b`\0\0\00C\0\0\0‰€\0\0\0\nÁ\rÝ�Ñã[³Ú¸öä_^�L·fßÑv\nèO[uÙe1†ðHž³\\ã(‚’FHÑI\0	A´@•¦\"\0\0Á&\0\0\0 Ä\0\0„£	DÕ€À\0ˆ`&\0\0\0Á\rôÞk·Ï¦êi�>˜mÃ=ã­\ne�såY¨ºôfŽ—^=KŠ\'¬ˆ5—:Ü ,MÅZ’’@` \0ÑN2%‰\"Ä\0\0!‚\Z+`\0Ä0Lb\Z�\0\0\0\00\0\0\0`†\0\0\0Á0\0\0“;~·>º1êÉ�WEUôÆÚ©v_nK³ ÑNuM6ÃXH}0!€Ò hP†	‚c\"4\r2-‚L0LÒ	‹[\0\0\0\0­–ƒ~yª	ÇYL\0\0&\0\0Á0\0\0˜\0\0\0&ëqzX×w.Úøõóùws7,Fžœ³C;ÁWOTåä\Z@Qq\Ze‹\0B„À\0Ä0M10\0XÁ0€\0\0—êÁf:j…*WL–±;i’Î‹ ‘¬¡‚`\0\0\00L\0\0!‚	‚’%ïñW;Ëìïóºü®oÛM¾¯5ÖSl*ì‚ÓÏêÑ¼s–œÝ9-){%�aŽÜZÊ\ZÖA‚+€¡­rj\Ze!’ \0@0¬	\0b\0(\0\0\0\0\0\0\0\0À\0\0\0\0\Z`\0\0\0\0\0\0\'<ï“ëü+ðû}Ï¨bâÓ]½ql`ûqTÙ^²Qez�º©Y¡Sft²ÝNù€k-\04	€šb\0\Zbh\0Ë§¥æå[ê\\£ZÅ`L\0\0\0†`\0\0ÄÀ\0\0\0\0\0Ä9-sUÊó7(-áŠ@˜\"HC¢SËzÃ:ùÿ\0¦—‘òúþ�ÞøÏ³Åëå!7µg·Ýà’‰e°ÍÔ’È X4ìI‚’D�†4rÄºsYÖ’(½ÂjçE’ÍVŠé¶½ó¨\re€¶Z^ëq¾[Ó›x\0@\04Îoœ.@™È\04D�†`J\"ÜèsZ¡W:]œn{ô+)Ë~�O‰£¦=ùóÝšžíùÞþóÐ²/ŸI�JñkÆó}§“åÛ³8×çô×Øæmõøí\ZôùA0”R€ @\0˜&†€\Z%Q5d©¥œ‹ãPJ\rYaX­\"ÊîWæçŽ‘séÏtlt¬t1jzÆ3eZÍZ‰çv*Þt©’Öc¥Y,#>9²ŸÇÞ>˜|ÄÆþŸwÊºZÇÐ�;×Öu„¬‹¶áñ½o)�Ïe[|¾‹çª9¸§<«(ÂÝLý^d:cè÷ùoA×žøÁÊî¢Ø—�õüo¿1Ýãè¾|ù\\ú:5Qíñ@�—µC¹æÑK*vL¡mª\\ÎPÖ5‹\n#+\"£M\n”’!ªdAYXe’Ïf7{©ÍYe3–TÎ¥¦T’×R©�Ç9MEUà�ÞnnX¹Fj±KDÝ¶FU‰§w)×Ã3z˜´ÛÏyºtG7UôöG3¡�lµ].:·fÔ¯Öy+{rú$°ëéÏE´Y�K•ÕåÍxî×�êù½\n‹2Yô\n“öy\"Y²5¥º0Š]:ìšIÄ”l‚”ìW)cE7Tá(Ô¢¤uKV‚Òk®\\‘ÓONpBFàO<å¶\n+\"–¤´©–N¤ºøü/?�éÊŒéˆÎœ¨ÏR2×¥9:«ß5Ÿ™Ùò©è¥óÝÖgŒ»ÊewÊSTW¶�fÝ;\rùº:ñ®Tv¾“½×ð~·Ñæêš–àÕÎÎ¼‡G•“Ó:égÐgAìñÞ¢©ÎœR\'*ÚÙ¸‹-áïç­µN\Z¢®7(•aJFHŠ;èœÕ‘ŠSÖs}Lz#�Ñ£ÏU‹“Ñõ<•Ç«�ŸÇ^®^KÑnkpóÛ½?\'Lyu…s–7\\u\"ìÍUÂÚ®I­µ¦ÚkÍ)ÙÊ³?C&©§®‰cWaßžH’±ruñr�E›‹afúýfo7Ótîóo“^ú¹wñþsè^GÛËÑõ>mÚõüÿ\0kÄìyFøZsßæôÃ<#sëyÙ©¾nËçKSÚåóømïïñ—áìøœºk_SÍK/WÆÇ@zO9Ô=�›ÃÎ·f\\±ÌîúŸwG©—Žè‡�ïiÐ\\\'œ¼l<oZÎz÷g½O3eóÄÏ|¥]ÑcÄ.œ·Õd¬Îµ«i•=z(¤-Tm\'LéŠ«¿-”èGN+#L^£z¹æ‡–uDã»—NNœ}�g§ÎëÝË§ˆät¹þŸ</¯]Yî|—´òz:=O;£Ï×©ç:ø&¹Óp½8*ú\'Ýønß™ÖÛË^:J4ï¸ÙV˜¸N7å–y¥2‰ªË(¶FšôG�‘#)<Ñ]xt-•]*9¹ún¶çOKÎÍÌ³ô¶¢ý89·.W^]áÌhŸwLéŒ¨ê¯g8ÔÞYf.R5is¾¹jš�^Š™Ab\nú‚ú`’TFô§R¾¹KoC™¢4qûý>]<g[-zÏ_µÂ–7‰ô¼}ÏÓ|®YÛ„³vã{æ-O_ë¼½òw§RÕË­ôS7’ŽŒôó”uòöáWo§-te¯rîŸ;Ð±Uº2c�Vg…tãÎÛm¹!d×Vã¿‡Rüç\r_U±ËMwO¯4é™§«‰Ù~ZªªwF;‘²˜éÐçÙ”É¦Ž×h²ÏrÕª¯J0ÛfTiË§(VW[ªœwÖ0!«Î¤&‰8ÇRt•¢jò ‘)ÈY]Tã­é|½óz8Òæ—ÌêÕ‡¯+¼ÿ\0¢óÚËš–óW;¡æK¿ªÌëÆvøõÝÕó‹—N´ùõ/£ås1tÎþmttç^9æÖ­²ÏUÃèrÆ¬QrQM¯¬{(ÙÍž�uÅS¢�Ëu[\\·HKsW¨Øê~mQ.ÜÏ^¹Çô±õºòK§S?JŽ?¿ÅôL›¹~“®tQ£G‹~¦3ÏVéQ TÝ&~­ZÏ—®£ÙŠ�¥•iÁ©W*ÑT£Zg%‘)X)ZW\r|éW§òxcêäž¯Ÿ_iÃõ9tÇâý÷�éÍÆK·]-2ëª¼Öé`¾Î•wáª9µ�tÁRÅ,éÊO«›±3C]c‹ÒÉ²Ã6kÉÞ´æç±ä.Álw6FÜX»PŒ;ëÌu³×V+ÎK¤‘Mu9Õ›QÝ,öú:òGÍ«qv±êW<¥�ûiá}m}\r;õò¡ÓÁ’0^–s»~gnUvâôân’Q\Z1²»ž„è×4Û@Bu,W(ÏU¥r¥dõŽç½ùGS�omàý�…ÎµYzòÝ³™ÜòËq­=Òó)3VŒ1èësôk9ºeÑN/ ì÷¹\\ôœÛµçå»>†Õyµó9]\ZyÚªUJ;k¶J8ýÜúŠ»¨Â{9Ú³cOC—§7§=ãðý·s—Û—oŒæ=rã¬ÖSÔÍÅWNY¼Ž½qô_1“§Þ¼ô8ŸS3\"È²RÏËz��Ó�n<tYd ,‚fj´g¹Ý¯Ù­94å­ÙMÒÑe›óxðêòúcŠu»Ÿ~\\k]9¬Ök‰;�›y*kq†Ó]T¥¯Þøo¨Ü`ÓdpÅuó–\Z”J6d‚]T MÓ£N@ÒgIr¡e®Þt#­V\ZáL#u¼ë\rôQv×‘Û¢YdmÍUyº¬É*™Vžq”)vQEÛCVg�Þâþ§‘‰Jå	D¼w±òy(RçÖ§ƒ$�„ÈáÙU—ô9ý%�WÃ,±”\nØëVœUfõ¸›tjy×£�¬é¢ÌË+cjQ<öj;éèë6s~›‹3Á]ì¹s|¦üÿ\0è7*6*q”¶BQªÔ‘X3B´²·7PV‘Jµ™Ö…T;ˆ®­Q3ÎÉGBŒ¦”T\\×)¡;H‚°ÆªR”µIJÊÚq­3¾\0rÆØ¸—–õ>u|ì©³ŸhBÜñ21YºÑ¢)DM{qtók¦0×}Ersªsí¢Ëõ`²%ÀéaÔ­\"ÉË4Km£FòºœžµŸDŒ›¹J\\\\å@‰Ê3YDB‹®ÉAÅEŒ`*RVE²�Á&â$™b#²Å­Xâµd–§36‡i�¡ÏvÆ¨ÄÚ—«Î“ÈrÏ‘ÔçËãéÑO>¶cßÎ	U12r’„••Í,íð½\nºtW.8_’È]LÔèÎ—Ðò,:üÎ¡ÅÏ¿ñL­VL\n]NgFçèÖÑ6g*æHŠª”¶N™-ª(‘!Ù cIT„ÄÓÉ­4Dh`È°HBdm­«I¤âS)@�FIË,Ú\"xŒúsqîónÂS	GyvQ<¬ ,Ð–ÿ\0GçûÃŒè£M	B5Eå)ÌëÖwÙ’¸•P–€„mÆÉiÍn§Ó®Å½„66š©EJ6`E„#dQa(¢dA‰� a@††\r L›\"H\"0ˆ\0’(u«/U2ÇI•3Éóû\\¾>ˆfÕçÇVMb1²h‰5w¼ïe­‘UçB�¤e<é—.ìuË®ÌûÅÑV>¿\Z¦Éjv)%g¼îxß_q5#5R‰-’®D�‰EDšŠå¸Édš•`	…)\'CŒ¢!&…\0°M	H”N#,ÏeŽ 2Ä\n$Bc^G\'»ç¸w¦6Æn¼]¬óªnhzk+ZWS�Ð]`ó¨mÆ‹œm2bèóläQu=1/mâ~žÏCÁ{Ï4ž1´Ò²7Ujè&ß¢|Ïé·\"°!&¡\0­Ä‹�S§\0D¬m8CcHF\0“DœQ\'² ¨„’`ã×J-¿%„ë­Ù\'ÄT¢�©,ˆMHÏåýŽåÚ¨J®]´g¿óÏ¾˜õãÒ‡.Ìë¡xY~^‚|½˜×W<\',]Kœhï×ëºqù/­õ�ªy½ºäùd]™é	Â[’ŒëÒ>qôz¬h*Ú	Äj2 “IR¸’Ci\048´¤E¦EÊ$�2\'\ZƒP%*ÐÜBÀh$â\rÂD¼o°òØé›\r”pôhájÅ×–Êz¼þœñ]Z–·mBsô÷Þ;6¹×f7T,¤Ž-9lõÞ“ÊzŽ¼XD±×#çO¹Ïå×ŠúÜÍEUÕîGÝx_lž„Šh›©Eµ[b’)D\'JI‰™[lJnÈ©„	Õ	WjAÄ¶\nB“u€”¡P2Rq¹i±J1%:HÑæû|<o—Ìís±×™›E=1ì|Ï·ñ4\"+uí§ÓU4—–ôžvk™$ùô…7ÔQ‹f=gÙz7Û×=¤«&m\\.ÿ\0žçÑc¶æ¸•õ1våG®ò>¶Îó™%R›*”ÉIWò§VÆ¸–Æ\"XAÅä�ºÑ7N$F%‚6!\n$ÔPÔcªçSDi‘œYKDZ‘a$‰IIç”•K6î7G��d£Ko�eº·�UàýO”L×Öê>»ÉzË;ï�<:œYäk5ˆÎã›Ns>[ªÞ}ÎîŒvŸ\"GV\\Û\rÜ.Ž)®E´Ï-®ÉYÀõ<Ç^~ª$d�ÙdiYçWN€¾4Ä¶#�‰6©ˆ”Td±ÐêÕXX ì™QÂBS­DF,\"¬’¬®%ê¹’VWQ”\Z\'iP DœXÆÒ…z0s=Ìƒ‡\\Ú·Œ|ÏWÅÞyrêoÎ¼æîåZÏ.=¬ó¬¾–£U’åÖ¬úi³g.˜íŠ]¸WeÎÌó¶‰oxc�Sózgsv¼§^~¾|ƒ§.ÁÊ¿7kÅ¢jõQJ]$\r† Ü±†³…ï:4,ñ5*n°i\nLˆPI‘”U–¨Ì‹iIFDXçK‡©¥(™cqdÈ4H§“ÚásÝq•|:W£%¶u9�Fó)Sg=_<ÚªÅ8o5ä×‘sG`Ö*ú(â=±éÎõkÞ#N‹LR¶ÔÁ.�Mrï\'\ZåÏ\rï:­Â»yúpÅ*Öð©zVr¥/XæÆ:’åönáß]™ñ¯:2ÂåÚ²ÌÓn;l½ÁŽd¥ŒÚAJUS”@š¤’†Ä¶¤ÈIÄ‘J\"	¬‰%Ž ¶�¥ó÷óxt„d¹î±	ÐçmÅ¢cÍS…–jnýÈdêóŒäÌjµpe¸·S£SôræÇ§æ›—=b†º³§šÛsqÇ½vç›Óéã©À¯»V§ŸËê¡g—�¥ÌOÐhÔóô|úæÑÖ¥8÷ttKÍžÛeÄz¥ó7z~³‘Æ{Ì£)êA\\å„Ù“–N)[Œ¡‚¦BRÎ-•w‰\"\rÄÊå) LŠ£z–©¸™±ìÅçêBqÅIÄÓ–Èj)i(†›2KS~iÔq–ÚãhË¯Sºê—§”Èª±VâXuáç¬n/‡[ëUÙÑ³“Ðé›ì®6n9®[ç]f¢­6aÑEäbâ]n�•F¨[*Šc¢w)Tˆ+.³*­¯-–Xó²9/-U–Xê‰qH]*dH@ÔdEŒ‹¿-PÃ)ÄA\n°ÆªÄv�b *H\0 À›\r# ˆÄè\rM÷~`\Z‚	hÆ:R+AVï¸±�AÎ’\n{Â\n¡\0ª@f€TÀ%X\r\0H ªè‘�\nA¹dƒp`ˆ\n\"@?ÿÄ\0.\0\0\0\0! 1\"A#023@PB`4$ÿÚ\0\0ÿ\09€^ê&–§pA@\ZÃ	1Oe—=µ\\=´kcÃ…[Šrk,|ÖÇjá|m\\ºÜS›´Ø&§9d¹FÐ…,’˜‚ŠiÛ/hš@Øl<|&š7Éÿ\0ÁBËLŒ4d®ÖyÎç¡ÁOå|I6kÈîG�¼K$x^W‚^îÏû€a‹|½Üˆm5X+/ses�”ô#öžU)¡ÿ\0?•Ê>Qü/Ÿü“ùKm:š¤ ârW‘ò°äÉ€‰Á¬kò{£!ŠCo–²M¾]àþ1åx;ë�:vRpÉ8Z™�äÚs)0ñÊ�Ùñ¦ŠñsÈ’G°w±R5·ùïý–~Ñ:Ú\\žú?(ã~@^ÂÐ	*­E–]:†µeï<IÂ;GµÈíUÿ\0…`·1Ü1�L2k�ïcÂ”¹‰ÞXÒá@ŒÊc‘Ò;› =ÇÂ‚oÿ\0Å@ lJú2V\r!¥ÔL�/ÒØ‰WïqpRËjò¾vð«´qÿ\0„`å©Ã²yØ\")7…û\"ÀË´wÎþ?ðý´Áñ4y	#¢EÀòßcµ¾oü bÄQb\"¿¿§p.	ïkú†½Xµ,ôÂ§3‚ÃtGùÌìvÀ*X£ý¦» =>A6ªx\ZF¥�d‘µ7#—‹E¼�éR×æ¯ì²Y,•ík%—÷\ZhÄ0‘Ž²FI›Xch(j÷)Ã`š±ä59üTÑäÍ>§¦öðð�ÔcÄÂÙÂ´Jr½œ¾�¤ââ�Ù|~�ëý;^£	¯NõÕÁíF\Z\\ƒØUv;ú ,S[Hµÿ\0ŠÇók´éuŽˆ�Y,ôýlsEƒ\\µú|�’,•«Üq°r=‡óVÁ7kÝßà€±T‚vÖ¯ñ\0J-¥¬Ð2pè¤Òº68­>ªj|ò”aE±ý1µ*MÞ·ÉZ½�á¯ì¯w÷€¦×¯¬Që©\rTd‰Zæ‰\Zº�Ëf±bŠáj dÌý õõMwMHþ²-:i¿ª6µjÕ«ÚÐrµ€Æ\"ÛNgpb-ãÀXöWâµ4à\rF«3ÉFÔ[Án*C Lsíš‡´Á¬âä­^ö­jãëEŒ 0ý@k\\Å¨·Ã¥wRððU»Svz;�i­ìpLSš©:XØ~·L¾§N›#ø\'}/PžÝ³…x¢m\n!´:¬\\ÇäÎºK^Þž¯M$•/“ÉôÂ\Z¤«CÆÕµv×õš¾j¤Ä[ÒÅµ¬•ì7ÕkâÓ­O¨M7fJtñ(½V2™ª�èU*Nàkõ\0 ˆhM\0¨´Ñ¸LÈ\0�Nê6ÇÝ‘tJ¥¦ÕpÉV­]&ž-z¸¨ ™ÁòIj7ˆèõÄ\"7nU*AR(ï]�ª‘\n•*ßöDvÚ§kAÈ¹f²Þ·{Ã®õ7?jÜ¢€B‘ðÇ9ˆkõ\rQúŽ©Î~º\\œ^e!QyyM)¢Úç�§¾£,ŒlˆQHcvŽlÐØmEzˆ½;ec^î“\\LYã¨( È­òî;´*UµwR!W qHµVáZ¾Ã½*UØÄT²¶&kunÔº»J�¯žBÑŸ5~îœÜÓøöÓXq¹ä†µ’}×È2�pÐOhTœÓZ7}È¿TK%ê<ép{¦y˜E]6\ZÊÆö†ã¿?ÙÅ\rÊ;¯ò�µzèàZ‰ä�û�¼/(ð¨•ÓuÆÀbÌë^Ò†\r<…¥5Öû1P8«˜[¦Bv¦ËBÔé‚2 úk†+E&lZµ®5¥síý–É’“ô‹øûã¸n)¦›±îµjÿ\0¤lmÕzƒäGðaÊ!�ýŸ3Z‰ÛZä cód&»Ý�!®]L[ˆiŒ®›HøF ¨ÀPòÝ3#r-ÁK£pZIº*)ƒ•«ÛÔÿ\0Í#À�ÂákœÖK+ºpñQ·ø/{RjÃVžq+mç†¡#J½‡xD«ï™øF5ŽZ9m´ìHj³S«d*yß3»	m®woœ\\¶Øôà:]V ‡¶.cŒ,ƒÍ6\0žÊMEÔ¯$×Bù!sc¹Ã‘KAz˜´Ô¤€º+]§åº‰!~—[¬kÚí½IþÇÄú™¦8éLn7jÊ•îc¡Õ9}Iêµà¶m@b:ÅáÌ|¡­—]EÚÇ¦jý�Õ‡0jÝœ¶O¥œ\0ŸVr›R\\¯jÒj\\dÍª]Hb�TÒ�ì.I©cšþ4úÀô\r«Qëø\ZëÖ#¤9&.¤ÐC[m_TX%Õfl€¸4juÄîJÅ=´˜Ð¤u\nàÐ� ýÚìÎ¬œálQ—þÖƒ©<Zo¶@ü†HXÐ÷êcO’GŸ¥pLsôÓº@÷h-ŒFñ§›AÍ\"n³M’ÒðØävqþž¦üµq—6mc�]C�‚Â²MKf!²¸”Ã’ÅN8¸ZŒð|š³Ýd�ÒÙs�Mv\'9\nÏ˜Þ.-[³:†€ýb‹Pâ¤�¸¹¼º$ÀX´óñ4¤ž““#÷9œ±Ä54…ÔÅ^Hù•¥‡ S�:WK±Ý­ÈŽ™\n²qýO)£€B{†0¿Iï�=Tmi@q|¼7	h(!¥¸}ÑC“žK¾<3NÛŸFì¥ÊéÈö´u]d¸«k”Ñô¤Œ’Zê‡S!d­tÚ¹,ÿ\0Í—<›k\Z\"Þê*ìƒÎIÅ|¬\\Ï.·…–DŒZîU*´àBiRGi­-Ló#ÞTd“Õ-toÈ›È~�sqê âP²r¢ÿ\0 ðyG€HQ’Ed¸Uh¢Q;_ãaÁd)RòÝ›Âasb>àçrÏ\"2\\å<\rn”–­z‚:ªtoZ—dXV\',qn€e¨÷:!8)Ìx©Ür.Ôãr´jq‘ÅºiM-8¹&wÜ¨†oÚ\0AÇ)P`±!R°«ÚØ–FØ(âQ°†±†¿í¡¸(3œÔx·N<\\£–4´Œ]%)ßq‡9¨L˜^Q$.§ ‚ÝƒWêšS›Å#Â;¾ë’Sk,¶¾ràV¯=,8§¶‹m®k�hPÔ«_§v’]œÀøžÙ¥ö’�®­­zq÷ûbnBs (¹¸‚Ð€ÈÌËt°ûtà…«\"äx/gëaÈ‹v�œaqk¤pÊ×S\"œêLÉÉÑ’Ÿ‹D‡ˆä=1Ìq”]Î!ã–+qà~Ãõsé=â¢²sO(Øköæ‘8ð„ ‡i…»Ú‹—:œÕûi\0\\[¯’Žõ±ðnÑ<mV‡\nÐ@RÐ†�^¢/„¦ØQº1OÉú�ÝFšÍÇ¨$©=ø§H\\²+ÓÞs\r-‹GìnÐ5… Ó“Zæ=Á¡IÂ–Aor\"Ó¯mJÚ~–3Óc1NFÊâšyÈu÷!îNŒ!ÂƒÜ‹ÚÖ½þÆrÒüKM¢i2Yò{×P`¦y}^4]ío)øµC¥‘º7ÎP�¸;*Î6›û	\r‡\'¶Ô|î>ìæÑ>Ðx(ò©	£œPUÇ¥âu:“miÂg‹bŠBÀÇ“#¹”lóÃ…ªÛÒÈú‡Köà{úÎ�©@zŒà™\'²IíO%9ÅM)#2EÊéGnLp§H*ùœŒ¨”ÎOm�j“¼¹G‹Àq¢¥yÆ,œ±!:ÕÒÁÖÖ=9®E¥4Ñq²=ª›e…ÌMæ<…!9C,Øñ‡¶$è¤)Ñ¼™¼vpM!Î\"›áÏhNWÃŠÖìòðC=0á®—‘©��%­sd�BÑ”Pw:†¢5G`è\ZWÓ%ÈÂpvN/t‹ªWÔ\"÷Y4‹¸’bñhc�nBâœÿ\0t 5ä)	·{b‹[C‚¢Ó#	¡#³ŠÚçò›)$­6£�<Ù&ËÐf(Hé	“ÂééM ~ãµï^Y0	�·DÐÀÃ÷…–°®œkéã\' ÊúxÓôÁÈèì7@\Zf?uÔ‰\\¢¼+!ðïÕZbáb‚mS\ZQÊèŸ§ÿ\0ô õ\r>¬VžréúoÉº¦a«D¢8‰œŠj2—(§l�a´Ö·¦ÒŸ +©Èu§Z\'™ÀZ<�,Ÿm‘žd9¹Ž,a˜=”1#.A’\0D´¥Y¹„éžçéÎcÛb Bù)I!rþ4^¼#3‚úš.‘Ðþù\0œAž¡‡¦›&DÏ2J/sS‰+%Ô!TÒTmýÜyì´6wéi¿³G\0sã)žg«S³m©9ªÉ2@\\‹Z�ZÅá4 Ôáeï/Mf1®©X×c£óiò8«+Ê#h ¶œÂéÉPÀâ¤Š¤mÜÒÓÓsÐÑ9\r€:w€b�,$rúizwT�÷A¥GJã!Ó>2`’TÖÒ”ÐoêÖ—5à‚]KÊ¬d\'Û6ðTyôù! êZ´Ls‹œA/´äE )_¸�±X­o¶§†ÿ\0%yDpïÜ&ð›yv¼‹¯s¹mrå¢õ@4¯cÔ dò¤¦·˜˜Ö\'2„ÒfáË\"¶F&:\\›¨zë9Ò:G8Ñx.µj–úÑúqrèµJèØ™0y{ý²6G˜.ŒiìhLÆè*X„\0\nø{ðo2½£¹åÁœ&bœÖ—šµ/Þ¾™ÄLÓq‡&isF¦ÆÀKÚ©889Éúv¼èzEêuu~Î…½O§�;NŒ.R»Ds/�Ìn½Ö¬ãÊ° Šïåž#ù;Jÿ\0š÷b½ÄQ±—¦j_õ2u\"ŒÙL‘	)>bSžRŠ²‘ë¨b”ÅÍòÍ¦7iæaÎÖ},ÊO‘ËI¥lNuÑr0æ†‘�\rˆ[À,“ƒ”�îQFZK­QNBÐå=€ ÜåbƒJ�ˆ³)‘Æ=Q��æØš˜tì.CÁ\0‘)°£\0	Í%1 »PÏlZBdÆ6µ‘VQå\0$­yûîämt‚(+G”ÿ\0-LáFy—ÁWH¢U{_x³‡½¸ÈêYR«]wµ€ÑNq¨Vd¨\'b³¤ù.<šöÁÃˆûºhÜÈ›åøÛ¿ŽÎp‹k©fab•Í·†aÔ\r\rÔZ\Z˜Â:†\\’1à:0ðŒ‚›#VMVÚö”i\nTÔÜSéÛ5ô(\"›§a ÑÆNjºh.+•– xÃ%8tj3Ã@ü\ZÎg´ï#bUö»Áá7ÃPD‰ÚÑm¦FÖ­@kñ^<Y+•’!š/V›Eß!Å£OÎ¤rÒŠ¤ßÔ\nD\"*…BÕ.�¨*í­‡`\nŠ÷,œ�”×8\"÷Üšº¨;’rBGé2AÌÊwÁ©+�\'ùøùØïá9EË[Èð¤¢Bð‚kMÆç„Œ›Nö¢~ÛHOG„ßÚOØª°ÈË –6ÑŠFût¾ÝC|ÆÇ°ªT©R¥KJ•,Pj¤Z±A«J• 6+•Êås½«Y+\nÆ×µök¸�Å]·{W°ÙêAb%	Þ%å»ß9š†¾ŒôæHš¤´T|\'0£à´¿ÌXÙ#µ˜-V—¦!€ýHñùëúŸ*¶ÇŒ\nÄ ÕŽÔ©R¤/Q1CÜŽçp®ÓZŠ‹…(øzvÞU\'+CÃ|Ï@ºÚ¯nÓfú�Ôr´ÌÕÿ\0MR4=‘iÙ?ÇôÏáø(rš‡ÀTïõO\'—0€ŸkÆä¡ÊŽ\\ÔÎIàÝ´ù_Hh×”Ô?“WÁ;ÂW¦ÿ\0ôµ‡ùT©hŽÚT©·©ÿ\0�\nCl<€w\n÷\n?ä‹„óÂuYjùE9Ü2Ñ!?Ì°°i&ij%R	¦·Ðô°÷_uÿ\0ƒ—°y?‹Ô9Ó8làÛxÜ/›ÚÔ\'ß§ý¤$€ŸÊ,å£œh8\'YN>×� \0¾otSI‘?·`ñ¢ãPÝ‡evxÿ\0¸‚âJøT‚år¹VW+Sî€¯¥G�Æ×[Áü‘ÑkÈª%®ÄƒˆTÁjy+#n)Ç˜[m{ÉMv&»¡4ö~»Žëî¯ñéR{m§kãcÙ{Ãü±\'òhÑ>îIÅ8ðãiö�+3‰w6¼+V�ãfùÑ¸ºð«cÀùÚ¿¸vóø)Wdí©9°ÒåÈDQGÀìøƒ÷m§xËƒÉj¤øˆEœmÛÙò>”ü ÚÕ«V­Æ?·ÏfJÕ«V¸ßX*g&�ï{œÛjªî�Ë|Ø\r&ÙðÞµÌzu\0òŸçhãt²j=7QCaµ¢‚ôÒY¨çkYlU«Y,•ÿ\0~¶(§Ææ\rñŠ¥J¶µ´\'\"Öß–¼bâ, lu�ÈA;ÏÊ	éÛúÃÊõ]+tòVà#¶ŒÔÃÁÚµ�V\n‚¯ëúíéž–DŽÚÚÐ*Õ­mtÞm5íáSC^ÌS[’À¢\nk9 ¼ñ*ùò‚²²²Ödx•;o�\'HõØÏGqá§ÆrmoŠÅt×M`±UýKÚ÷¿Á|ºÚ­_\'zÞ‚¥ŠÅLËŒ\0T…EïSÆKa�åïc°wQd‹øq\r¨$ÅÙZiM,\\^Îá<­]mV¯Ò˜æ>aw¢8˜-z�2h›»Qé”÷óßjÖ[ZÉÃjÑCq½®w%d®ÐçkÛ•Ê¥ÊåYV‰NáÅ¼\nÃË5- ½S–Tœif‰EÜR…Ö‡›ß”|=z#(¢šÐÝ¤`tA=¸ ¾v}>¾›cÜJ½‡‹B»)\Zü6«WÛÂùÚöµñµ«EÊÕ•jöáq·Ä¼HM{Ä4HÐs«$µÈ‹Øíåh´ï˜5\r‰ÙÅ9z!ûV­^úÈúZÇ3ÚxA|méN½2 Â¥J‘ÞöðZµ•«®Þ*»©RæöºW{Ò¤à1ç³žÛZæŽ½�‹iNàœW£3=T£ßòytLsÞ…-§>gtƒY¨fµ|Šzô_Ó�«U�ïBt=ETNþ”~ÆÔ©p±X…ŠÇ°x®ê\n‚áW·kü«*Õ¬Ê²²ØrQ;QÛ”\r,–JÕ•‘Y åk…êÎîs˜‰ÉÅz,5¦zá`Z´ñ:i+ÝéþžÆJõR7Â;åèßÀ­^Ü­Sn\'hNÛúñ®W¹Y@«Û…j•ÂãðÒ¡½*UßÊµ’Y.¬— âmZž�«}hû¡¹	aqR\nr��OrãN�©©Z%kl¼\"«‚œ�çÒÚF›•Esµ§rˆ¤ÕäK•˜•éÎû`í{PT[óÝ{^Ü®wµ’½­^ö�ÉØ¾;J)RÅr¹^Ò«n¯ö·)X¤hGSSªpl\'Ëßb¨úuf³¨µ‡\'ùUJ¸qDðV“Û§µk%jÕ­`Æg/€T�É„QôÇ{8TR®ÓK…AP\\wßâås¸+$BÄ,Z±A»b©R¥]–¬¢\\²V²PAx\n†37ŸK¨õ)>ÑX•E:jnŸ4ÇQ<å¹ðñH¯úcé½R„‹4ƒ–KWNi7ÀOÙ[kÓ<‰V¬Ök%jÖJ×qÙÊ¢«²Õ¬‚µk%’Éd­_f6‹\nž€rÌà¬«)´O‚¬«ÜíIì	íÄ‡\\Tžå¦iËS+£ÎB\'\"!C°Y S¶;91òð�[+(‘`±?Æò¼|9h_‹ƒ¶¥‚Á`åNÚÖAdaf6ãkV¬®wå^Ô6åsµ+W½®û••šÈeÆÙ#Gn;yÚ–¡´úD\"Õ¤¦É¬Œ»fÕÅˆSHÖÐèQ‰µÑà¶‰^6u\'(?�9…*nÏ»åe[\0™j_\'‘°pœWÔR\Z…õê\Z†®½®¢ÍZ\'~U«;d²Y,•¬–Adk5ÔWÆÔ±W·;p¬m{QÚ×®˜­¯jTlB�›ÙÊ‡#LÆè ‚­�ŠåL²;S““¹ZäwJBÌ¹dP&Í£hmI¶œìfÒ\ra].\\µ’Íui6@ºË¬„¨HMYF­«&¬Âö•‚Áb¥APXµb\r©Rçj\\®W(.6!.!bb®Û\nÕ«EÁKûü\"¢ýž[Ó;„ÔcŒnF>KV+àØ\nd@,QŽ×FˆÓûDNÄâº6hŠAZq œ¯z·ÔYñc´ík5˜BJBU˜Y´!;PœÖ¤$µ˜AÖ¯{‚ÎáR;Uvò­_m,SÁ	õØÏ98°â¨*ÈVÕQ§�t©RÅ`¢g\"4bF%Ó!bPgb	úoo@£nœ•ôê8HÑÑòí206Û¦NÓâzK¦j¤Tê¤æ5 ÀRlnr�9«ŒEtB\0ÒåTånW½«ÚÕö‚Š<,­”;xY�Vö=;Ê´i6®NÂ¥ŠÅ4&¹Ë¨VMR~ÕØT<¸nB,D�‚Ý›!77Há¦!3\Zºlr0¾ñz|@ Ò‹yè†œ\\Ìf=2°]0°á±Ø)� Ù…œdFñ|QÐÜ–A\nVÔ\n¯Á[¹Rµ`•ör±Š§#aVEI)Û…Ab6³T¸A€¬i\0MbœyµapˆEiø�â¤#v»‹(j\\ºÎ)³HÕõCTü~¢ÓŸd=Ø‚ò„�ðï4€àujƒƒ£ˆ\0Ij‚µaXB—…J¹çq¿žÛZàž+�¯»•h•%Wef¨®U«\\íÊm¢;9VTX`T�¸G„û=…L\\ïáXDÚÊÃ˜òÖ‹\":.W)® få|ä+`ÞPáÍ\"¾)Ë&ˆÃ–E9Zås·*ÊåWµmB©RÊâ¥esÛd\"â�ãº•Êå^Á\0�Â¾Êµ6�<d\ná[Qp§=”úíiC•A{v¥J¸¤Êjq‰Te¾\\\\ZKI\\mç~W”O´…ñÊó¶oÈ‹Dm‰«@•’ÉX@„{>¤Z;ÿ\0ÿÄ\0&\0\0\0\0\0\0\0\0\0 0!1@AP\"2BÿÚ\0?ùéÑ�~¥-¢ïô”-ßéè´ù¿¢Fÿ\0OM›$NÍüéüÚ¾›^`‰0-}	™ð>oãû?ÒÅ˜ãv¤hHÀj?KK�TºˆKñQWMÈìí%\\x˜üPcºmy(êÉ¢®œÓär¼2I$�àÄÄõwtŒ¢ø�AI%4IÚCé£)r‰“ù?2¸ä’I$›$bRHÔ˜”«1!˜˜Ž‚-\nDI6©]¿%ÁÔóHÕ’1 ÄÇH#i»´“¤¤…h´\r+!{)e~¯$éCÕ!¡«I$’I6‚6z³#ØèeJ	ò&O‹M¤›¡ì™<	H©¼�éN“‰’~ÊQ0S\'_¥ùV£Ø‡Ã:M �Ò=p¡©eHvé\rdŠ<\rÏƒ¨¢¦P¡I>üpÀí“!=Rž%L£Ð™þ\\•õ%ZN˜‰=�Jr2J¸d|E×Š©\"\n¯‰C‚Q’PnI³|ìWðB1§Ž`§­>Œ�EãiÑ½bðùd|�tú‘á�GÃF,ÂH�ìÈÑ‹\"DA�äJÓjy‡y$LÊ™™™Ü;§u�ÖwNáÜ;‡pÍÄw�&t™ÒM$£Áýt§u¤•Y»¶d\'%_˜‘¥<Œv›;·?™³¸wŠÏ‰‹Gúç÷+=û¨ôA[»1hþÞ•™$“i»\'WòÇ’­iwc½>†¬þÚ}�jnÈ ‚�‘÷+=UÙ$™»¾Xø)vb h‚›»I\"½d’N�AñSu¢»11 ‚ŸVkÁ\ZÉ“2$’IøiÝ]ÚIÖ1111 ‚H´F“Ä¸ž”ÝïA‰‰‰Ê¸žŠïá‚7ÿÄ\0)\0\0\0\0\0\0\0! 01@AP\"2BaqÿÚ\0?øò/)‰þ¥¾ëÊý$ßbÅý<ñõØ�¿O<%†°—Ç³wÀ‘tBi�Ñ¼REüvŠ›]pEÓ´nÝ˜±1³pŸéd¬”63þ¢\Z¯ý……Š�q»áY}í&OJ‡Á\rJbä¯–n/+6o¼îðÑD§GY‹Xê£wd’G¦hNø~:(¢±Xl±á:7\rá\rˆ²ÍÅâÉÊ†Ê(¢=’ôM\Z|HOYe›»oÂ±E›/²ÍÌo\"ÄÈ¼1úbÅ<ØØ»[,O4QE2ÆËðPÐ�à‹HSD]”Ip4%Ïƒu‹¹¢±ÔFä9[ª‰Ö#;,rÍ	2Â[�­z%\"VË?WéŽTÉ¾!òDz†ö‡¨ÙèÞ)¤9Þ#::‚šcÖŠäß¡jØÿ\0!#s-ãh…ðØØÙ/B�±¬ùböEÙ9_rWjÅo¥Ö¾	p‘Ó#¤=,8—…Ëñ9Ó,jÏòTFŠ5}ŒH\\“¡böû7ÙCT[\Z^Æ°ä+$·…œ$}ØRFñÐˆøY©ì‹.Èçq©c�Š,ZbT%�NH¤�¢E¤¹~°øC?ðÜÅ+ö%ö);4ß<š’Ú‡!3qb“ô.;ï;S%£^‹£Oº°°Ù)E\"^Žçú±R8lZ±LÝÍ”›ÆÑF,~ŠKØÕ­ÂlØÍ¬ÚÈGŸ.¦�òi¬>ÏE£rD§|!ð?øOQÕ!E³m…*=ò8Y³~ÔijKì×ÖBoí“¥èæ­\Zsk“Wòáb°×ŽÄ1e¢Š%:Hé#¢tQÑ:\'HéøçñÎ�Ð:è3¢Î�Ð¡þ9ÐmQÐIØûßeŒ,QE�sÝEQEm6”V[�ÆìÐü«…šøn(Ø‡¢t_cÂñ!ûè—Ž¾uö</2ÍŸ±11>õØ¿A¨±�¥5”V+ô3(Šík+²O’.þM÷I‹Øò‹,ÜK–.Çò+²Ë,¾áúÃÊ(ÚÍŒq¬#ß’Ëì¾Ûî¢kd�\nB™hyŽ(¡á(ÚV,³q¸Ün/Å^\rL\"XG%–X¤o7›�Ä„EòYÇfÑAJ6›J(®Î<sËÊ$Ë,‹çG\ZÅ‹Y¸Þo7–n,R¼YeöQ]Õ™wºÌ}öO+’‹Åçq¹n7›Íæãq~FKÄ…‹$óâ±c†Å&nbîÿÄ\0;\0\0\0\0\0!1 A\"Qa02qP�‘¡#@BR`±Ábáð3rÑ$c‚ÿÚ\0\0?÷t˜@†ø.jaC:‘€=T\"lˆ¿ª¼¦˜WLl¢º¨Ù§¾©Äûúp!¥YwÂ6<»©RÍðl%wM„…eÓÁÆú0ƒºp%tQ+”ò©ÇxEÕ¥Ê¬®Ú%©Æ0­ú‚•ê¡³\'êº˜ìˆ©™^p54Ñ‘(t]qÒÂt¿¿¥YfÙÙJdÝE‚5lœ–tsf_ÔŒ†\\¶ÃÓ\0›GlÂïï’™ÈR¡†ªëšëÑ÷PfU]“N0øÑ.¡uE×GTƒ²drÝ;§ù¦#” ?À³ïÑ†êáH”ÃÛôTa” ÉÌ2<ÜÝJð©á?òžY#šT1ø\'«ëáOèXÃË\nT¹•\0v@:4Ÿ¢ÊÐ”Û…oþ…Œ;³h›\'z,Ðut,Nþ#6=AMºcKÙ2ï �Òaï‡1YE5›Ó˜Ý°(UÑpê¢ÚevÇ§éª©uP,ÖYM.6C4þ™z|âÈf2z¯\\\0áÒHîš®SÝzø\\¥¿FûZe®WnªîNÁ:ÍLŽ…ÍÙ5Aºwý/í?ÓüiDÕU×Ä9?\r4¡_“b*êŸt\"Ö+/Hßô»�–¾¨ÓÅ³mH°Tçå)œÊ\'?Úæ)¸¿Ý\'Ãé”È5—2ó\'ÓxV!I¸UXŸÙ\ZëâÄÉ\\Í‘ ¦àV<*j¨ù þ‡-%rÙ=Npò§²‹ ØsßÀªžªŒã)§¢ÊpÛ++ ¤\ræìŽc!SQøûëžºGÅ7µ¥G�šå®“è|¢d3YB&î�1LØÂËUÔc\Z-y¥“ñk¦�ùõ²¨C2âpÇWÆ}êÏš¾�AÈ:\r¢¼Ã¥Kí(4úJåâÒ è,ïÙ=FJíÝeÍRj	õFCÕÜ`ø82_U5õ^P\Zä¬ÙêfÙym» ð{ØÕQ`£ƒËO]Ï…Èj‹ýÂš–«à²ÔCöU\nf£tå:£/›×tA-½4¹Ë÷Oe²}Óêÿ\0ô/AeåùÝHEÃçü~õ5VX.”tðCì‡…ËNä,ÕOªÙ³•ü§²éÍ,éÑ+ûhî˜Æª•Y~èSÄß¢æˆhº¤U^V™O¦=ÜÞjú\'¬ü<ZèUf-ÝBöt|P\0Ä’Kª ”E�íÑ9ª6T§%Bè§0^uç^R¼«1oD+¦ª~i­Uö�–À.#ñAâUT°ùª�ú*o¾BŸºf¬°Fž-+¯€ÊŸË¹F«J‚ÈSn\Z®Ž�Ý9VÑû!weÝs\"³ \0û¬Ü@\r=EŠå\\Á»ª½¥C¨M›íåî„U¼S±B®zjŸDe» Ó ƒ¹GÚPÔTó·dÇÊÉ‡\\?ø…Æ2¯÷2p&¢¯„¨Ð×«¢zÎ“VÃS;z£Ù9�Uì¿ÓŒ½JreEÔ€‡³½]¹™fwOˆÙ´«3X\")ç¢Å=\"®*ì²UMB�ŸàƒÓHut	ŽŒŽî]”yºl�ãöOb áGGCñsyB¤å\0Ø²ro» *©òˆY)ŸDz…(LhrS®U*£Õ|Zœ@6WÀL�2®¡5XÊ	‘ £IÂ¾¥]90²ð`~e8Žè’�eÙfÅ‚§™‰2z/èÒHrVlÅ›‚&teyLOªîöLVZËÑe¦š®ƒË2ÏÃª¯hKNèûB\r;v*žg$¸qdÁ�wE©oŠËå$ú:kÒíè¾Ì¿¢b€tW€�\"aSSÍI‰>‰€tØ�J•uu—b¶¥K”År§Âêè“„¨Y�=Sê�ì¤«¨ÂWU©P¡Jºl-‹\'R�ÔùTã\nL	FZPcdMXº.=Ù›ÁU®ûôFª…äån˜ÇÓˆTîZSÓP\'Öp$êšê¦…n÷]S…ª€VqÁ27¹ô]÷ûO’Ð�ý®šžÌ½IÏ\r¨è¶Ê£E�{§ìªâ’�U‚_¾êš\\MM7ê©| Å3©Õ·¢tÊ1Íqª0•Êµº¨�1¡Æ¦m„é²Ìû&è6dCm‰ÄƒÑ\ZH3j�‘¤œÉ†­I¶Ü¬ÔžÖAŸºgu–³Ëv@o5O²$Y8ºo¢•KÇvt(¦§›³Ž‹Øæ\"¾ãm“üŽÈóÈ\r+ÿ\0S‡A7$Ø †ý\0Dq¨¥ÿ\0ùÿ\0Ò’ã\nxo&ècºªì&@Ãn‰°äA„´áè¦Âšœs!S¬¸^èàáN,„õ.ÊsÝ]EõÂœ{\'ð30¤²Ý¶]ÓSlNŠ©nqº<7Í¸nû+O€oWè�ˆöü=;ªA/MAé(÷€ª©…ìvUyÔÂê¬Vj¾J†¨|ÕLüÙl©ª�@ÌÂ¯òé‰\"žÿ\0ã\"fš:2\"¶b®ë‰‘Úç`Jw>Óòº‚¿gºaS�º§=<£`ªÊip,SÎdÄåUeN‰\nPþW4\nÏ€Þ!Ù#ˆÙ9ÖÚ	Nm‡t\0¨T/dk\r]RÕ\n�Æ\n¾0¬™2•Ù?�*|ðªÍ/KÙf4E®€¥Ì:ô]Ûò K5™\nOš›aWæ!J�$¨ß°FnÆÊ–­êØ²5UÄåª�á½Ð^Íš\0C0fNÜ¢ì�4˜F 89*¡EYé§ñÇ¢ ¦M¢m‡EÊªØvÂè¸¾‡LU§®ðÿ\0Èq”ì¡Bs„i¿ƒÙæøzhë‹’áW!òòƒ\n®…¡\ZÌVE¿„Â�¢w[vÝg­Ÿ£*ýqmÒaÓ9{Jm×/o2nj…2Éì÷ÞT\")·î€k`)xMGÅ²…MšžÈ4uƒ…Óa¹†\0l.Ë›º%IGAÙJ&…7N\nj�ág«ÙþTÅ¥B¶.‘áQŒi!»ª|¥íü¦á>g–)¿?ÓüdeÐò@×ÝŸ¢­·Åñó1TÕ˜8(—9ž¹ˆG ‘½(yYýSYÙSIh€©›)ò¡’ù˜\rÔ®K ]8B\nËºpÕJeUD§Ì¹ÔÈ¾†j¬¢“ÔTh\0WL\n`›\0ú«+++&Â\'M°Õ\ZÁ.<J|Ô•—�Á�ˆ+ìën\'åªµ,¹i~ˆ¹æ�²Ô`Áì¸”é‹.J*¬ˆòÊd\\HNH	†\råaÇè³�r…”ÝÙ:¾\r�*1\nðœa|¼Ôee(£Q!ú(]“…*é—tåa]ÑÂKx¬N³�ï„âQ8?Óaþ£šƒjº&-ÿ\0¢ ‹SqeQ¥ÅUr‘ý—Ne¾Ò›Ê\n\\Þ®«”C+)]Yt§¢åL¢CåÂšÍ‰²Q\0RˆR¡ÔPq²²ò©	“©²&•iYJe8±Àf² ÕÕ—,…e–¾#¢W8€˜+‡}=ñn¾ž\r“\\��LØä®£•î.©¬6b�eÊ{yW-³c2Œ¸ù/gÃ·â(OÈaT)Fd,µ[²ôG(%©r§µ\'”�ÏÁfã@è„\0ÊÊÊ³2z·VÁ±•el9FªSàé÷C\"¼¬¸\nŽL¬›	U8ºª¡d™EKÍ‹\'T¨¾\'[áê£Qåž«šUQ¥Ù9²Ý0ˆ4ô*ÕçCyUU’éÿ\0ŒXŸ‚ÐIOÓ¡Dí”D³ôU<J•Uoº4äå=—ûesÂ�÷Q}0Œ \'â(Q¢W.‹àÔˆOR¶ÔœŒl§D¢Êl­�ÕÔ¨Wð£ŽÂ¦è?Á–ì‹HÙ÷NÙIV”ï	Ÿ—S•ŠeW+–A¬êªB¢’6U\n¾\n•Pè�DÝ1’®¹L«®`¬­Œi¿…Ì%F¢àÅOƒWªh\nÅ4i…=.©}ö\nŠŸ{¦\'âœÛt×¥L®§	\'TÙ‘\nƒßHðl¬­âÝ_««é²tÌ®ž²åJ< î„x�«\0½Q²‹h‹§ßæ…LíT+ ûK¬Âi[æÝÙBï„hªq*AF0áú�zÖ�uïàB¤/L,‚§L•½:¯5VG)3ŒÝJ$á8Që€\0<ª�…pÇz¿P�6Q®Jjpã‡Etûh‰Cª“ªËÄ¨R\Zïþ|—ôlÊtõU[®4zèb‰¦ç¯ß£Ám6ðh+°RŸcÓDjì„>™ú«t\0ºoÃ�Ûëè¶f·@©Ëv�UK“cÓ\n=ß|1ë‹ð\n|!1~ÊDH!6øBô_Ê5(²ëQ@Œ¹·ê¦]o+_áeP¥™·Ý·…(tÅŽ>ŠS•Pž«\'ìë„g0QÕDïî÷\nW|.®®¯¢±Û½”Ù[Á	·WP¦ýQÍš£a6\\¯ÿ\0h¤Rl®TR»/¢«jIdmma{Ý]„\'ËàJ„PðŒa²¿É_ø²´�ßÞ÷}a:™ôQ>žP¦êUÑL§,÷ðçC~_}á2~gìž¼\0£\"÷•nêÚ%{J€#¶Þ¡Á×orY@ñ©+4:…Îäžý×Õª•·ÅfnS¾Ž“Æ¨M†ª<µk¥½ÛŸð¦x×l,¬¬�¬›¢)�Óˆa%4\"(Õç�L%TsÛªì¢q¸Y,ØpêØcUÕýÌÞ-I•—–êv,‰„)©VÀ«¾”`õOò¡ôÓI.SðZ—?�‚ªž‡\nþzáP_owtðm‰AvG5NR\n©Œ@8�¼\Zëøc\0+Bî†ª<+`Kýæúmªp²¶º½PNlPzŸúp§!ÒM©ÆšÇ}U��×nªt€öWWWWW^mWÑo½[Ho2Ÿ©•I»ì˜`Oå\n¦À‘dÔS˜Ìb*âá÷Ýe¥€U�m|O\\/£‡WÁ×eð¿Þí®/â[Hô]W)„j8qx»˜Ã™§gY( TÆå“	B¾(zñ\Zë=õØ;„ú�\nÞ%•µÝr�WÆ4ÛVôM€§úg	Ä¶�¢Ø¿]uy…º¾7÷=ñß©Æ¹ø«º¢žê¯LZ€Áƒ «âŠræÛOlE²º¾—ê52•º¿…¸YY[iº¾6>±•\nInˆœœ5aðYºÏ|c\nfp2Êþ´Ý]?E6ÓV‹«ýÆêÿ\0tÉ„U\në›]—”­ð…tKº#•sT¯…,.Yùv(�€^l/ƒa8Œ.¯‡™n®Qc¢p:vÆÚmáÙ[\\x6Ó·ƒu|#G2ÍM°�¼‰€ª¨Qøƒ\"L*…l{jê¼¸C+¨e+Õ9ºeÓ\rÕŽ«»Î»+x{x’4I\0©0£T(AÊˆQ)Ùô_Fë¦�Óàºó2å©ð’0Ù\\j�Q¢ÊÞ%”é¿…uuuuuDÊåVÆÊTUõÆVÊ^Q‡|`ªÚ­•åö_\\z`ÉÊ…ºœoŽÊUÕÔá|l¼¥[!_ïVVVVÂêø]yœã¶�ÃÈ¦Š¾jåG�²Ùl¯�Dî>jÈõÂé¹TW6Sû©¡2`K®ªÊ¥ÓU”bù”SóR¹i$.jH+˜+2²�3ã²ÊÊ<•}AÔ	ÂêøÃ)«ä¯ôQáî™Y]_.z«�ÖNø§©rÔËÍJbËðËôAéÌ 0S™— b¾˜YY>RBò—[:êO]BýT\ZJ23\'\'^ø_]ôÎ¹!_G™]ÕÂ`B�=•——áeºó\rvuc†ú,¶Å•ÕÕðÙ~4:y¥\nJ‚ˆ%ÑAD¼ÊÃæ¹l¹èÙ]Bê­¢Ú¯÷\'6ÂÚ,¬¬¼¿E6ÐÚ-�×›\\Ýo§Ì¼ËÌ>~ã%ðaf4á³.êØC¯2™PVÑdêÅÓ1Ï×ÂqºÛE´r°=ñßDaoÌ®¶Õm0šªUÎ>eæ\nßEý—öÔûèŒnÁ?µuä”Y×ýàë}lÊèÊ0uæù§+–p¶álŠ\r£ÿÄ\0*\0\0\0\0\0\0!1AQaq�‘ ¡±ÁÑð@Páñ0ÿÚ\0\0?!ÿ\0®Á«q‘ÀQ¯£1è¬üøèç�‹\"\n“¹Ûc€xÁû0miïÆ\'¨·Â\rRó.Æ!“EcU&Æ›|¬¤?ã\rt`8¾,žpˆÅÛ8Ñ˜a\"òro$nYîþGŽáZzß†É®™\"Ð’ªiñìI4îÎŠ¢Òñ¯{ÿ\0ºnô!©¸`UvgV‚„;û�´Od”ËáWc“v$Ì­Caª\'{‹¡Z›X\rž\Zô#X)‚ûŽ“·ÐÆs#Ú§ò„äkNÆU<4ÛÉ«ïfåËÀßF9ž1æV©MŸÙ§†§\r?gÿ\0ïÞ”êv){Ã:±ÔLé´\'š)pi”:É»ˆJ2Ûö*�Õàt®Àèÿ\0èç©Rã\'çòµFÈÔÎ^Æ¥×ö>¯ÀóÐ»oSièm…[ÜÚo�g žFÏÒI�²Oàxlj%�ûñ»ÈðRÞh–\r<	¨¯cý?öèH­�»Í8Ïat“¡vsÏGìµL|=Ž\Z&ØføîÌsZIZ…�XDMe´–ÈQÙf²\"Öc¤¶fk˜6>\0«Œº4°°k9ô\"{OÜnÏƒlÊýÝ7›I)³•öøñ<6ý(óŸ	mÿ\0ù©Êñ?ë’šwàEðbÁ6}A¾¸_Üãr…šQpéõú™±¼ÍG+\ZWTqÐÒÉJÍšôZÆk]‰–�™™|Wé©Ë&Òm‹œûF8puÇÁôùÔIÏC8å®Dœ�Ï†>&|%Eg�\roÇÁ”ê¶,1ïç?öÉPFGõ4!~é8%±³‘=}D#7ZÔÁ{pû*—(&«•fdª¶\'ip¹$ûZZÛ!�ƒ³rÈÅ\n½t;¥‰u±(Þ’^Ù�¬ïæÒzßž/dü‹¯¼§\r\'óa	ÿ\0*U™F«³\Z‰eÙa³œÍ¶V_ÉiocDïo#«Mt£6(»BjªœŸkØ‹.­p<µ3Ï¡½žç…­Ú5Ã45Ï\"¦XŸ\'cúìé¼˜­¬u¿cÖ„¼po_÷úú&ˆr½ÚfDîß³$	$èƒ2AD¿äø+íL$f¾r0Ù£xtÌ†hm&ÒbyFÐ��bl4ÈÇ®Ûý\ZÖŸ�\ngäµLÒ‰Êé�zÔ¸I¬w(F±I¥æøþF<cô6Û­×åãþÑn9bBRSD†ªB¿ôc2¶�µ{ÿ\00fÓæ��Nˆ¸ª•[£i4®!Ró\nÅ`ÜåÁÃ%m¦tÆÛgcQ³å<™¥¾W²bð`„²7}ú>5âxJäJÂGÄ99ô<uô_~ÆJp»ÿ\0´¶vœ™TÛÝŒ¶mA.99Ú)°ð:n]D¼**ÊXÒ—ìGY§ØÃ2¸b¼VþM¯)32]á~Š7Q4çÇä[ÂÚSzñß†ÜÂ½ùÄ÷âåäÙûÿ\0ÄŸô¶[/rËR¿ä|�—Fa>²-¯³>‰žG&³|Ùáøl˜Ê1˜ÿ\0F\nìöÕç�á[Î¿F–2Iáø‡?¡©=þŠäãÿ\0ÍŒ¾ü˜ÿ\0ž´Å6Æ‚Ë‘�¦æO¨X*Ì£3‰ÜôB¸„—ØÔßèNHÉŸÐ¼ûbjç?«?¦cÆ\"ŸðéølzO\r�þS\ZàÉÊåÛ‰OX6—v-•J2Ù/„žpÞ!ÑC*¼C�O-¬äqðQé?”3ÿ\0ÀÄîWŠÿ\0Ù³z ën*÷1ÿ\0;¢Š|�ßùl[\\[Y•åÂ6|�a\\:ÐšdÜÏ ƒ\rŽ4ÓŒMóðtžøðNa0óñÁ\r¥I‡¨öYåú%ž„ÇjÎ<?øYÖ�Ÿû¥³Ž¶ìom®ÎaKËèfp<Ö>¹ôhÈEOo&ûó(}…Ít\\�Þ;Ò5{C&œýG”ðÕeÌçÏÏèipü\'.³ëÍXf‹ÂTl¿ì�°tÃ_î6Ê×ÛÐ…†RáG1YÓ7Ùà×Ñ%Ë|ëöŠ£…6\Z>ÒÀ²ÄÔØÇ\'#òü5§3ßêO3ÃÅ^_‹+hC1�OúJ\rçÿ\0šðÒj=N”¿wàf7¦Cáb`|Q\0³�À§øÇ«	M1VúâºŸèW\'Ýü�Å3ü\"inÚ3�~:>ÅâoÂ[ÈòBA;B)ðQ`ªkÓEÁ?ô4ñE`ØÀö4Dv\'å+åÈ¥¼øÏŒ~Èfè+ýŒ!uzbÙÍ‹MÌÛÒÿ\05gÃû)ÚXl�jÂgô+à§>iGú½xþHï®²!ƒB\"!¥\r	ipo%Jx7âÿ\0TðÙoþD<S�¸•ÉaþIÊ°ÊH©d“ôN¤‹‘Óì1c+­lbUŠK#$ˆb]ÇéDBö8z	b\n.?¡˜Ÿ#AÑÚEçõðOø¥òÿ\0JlQúa±Š7è^ÿ\0R*„¬±I¢#ßèJ³¼[Àl5<X¢O5ÿ\0â˜û¸_I[H|òÜ˜1‘G²¶µµ�z¡„‹%�c¼›ÌêäOvç5l¤2WÈ–°^ê·‚[¥S\rö;ù”î<ß÷ƒ4âŠö4“ö2à‹¹ïÙMiFK”<Mùý¼ýùù5kð”%Ç‡ú\'²”¾)Kÿ\0à•4´f,66Ï›ˆ¿\r\rŠäH‚\Z2åÐ‹bþýªFBÌñJöJŠV_C·«]�Q¢ÖÅF—BñWóÁêÏÁÂFÆ÷Œ35&ëºúÔpa1½�+Ù«™â]9å~’k3_]Ï´k]é¶ô¿ÈÖÝpø\'Üé¿D‘7×±þåp_^n²™!CXò¯gÀÔÞ?Jòß|=ãÇyý*h$ oJHÀØy\"dÃrxìT�†.mþ¯%…Gýi—–é’³Ý®²=_‘	¶»À)[<75Mz\nÆ)O²/³Ê8ì^›\rP²ã²Å©^½ÏìbjÚÃ|ïöf£o±ÙTM¤9�œ¬53‡ýNÅ‹Ã‚Æý#e·œç�\\ôçú#ÁF¡ÏÀä¯ƒ`ËfÞ–wd<dÌF¯„Xå~â\n˜³ÂUŽ	Œ”Ë%#!R‰‡ñ–ÉÐšHËÉC�›„&“Ð²!–±±r „2ÞlÌ�/ýUåü™‘/	Dï“}†—½¨KŽ�¤ËónƒÊ­øAaÓ§Àù$›ÏÀšµëàÃ�×NE]!wïMQ�ÝfV{ï’šÉ;×÷Û·\"˜ÊÊžŠ&Ó¥±\Z�\nªzKò:1Ü5Bþ“).Sããb6ÕÌ¼cøþÒV¯ÏàOs,Uª�ÞÑLöüËQ�Ï�„ï‡á¼\ræÈkmáääieè‚½‰Ð.â·^/è	‰—ôy§ŒžÞ0ì~ç]4Rr.zðý�ÀÉä¢I¤T™–Cøc±Â¿ÈöO^Ø‰S9–DO¹IÝþ\Zd©cfçÙRëø2=lf�”Ô[dYÕÃì|S=‹Mý�V°Ö…ƒ»¯ÜJ¦ÜAâe´\'ã�¸oO÷&Úë\n6ÿ\0ú1G¥S•óÞ{4äÀ—¸’ÅMZZ×ð(W*\\žËF6�H’D§C¯g#àØÉ—ïÃ%ÃÀÄÊ_,&!màŸ#/±à˜™FÆËâ”¢~E…~‡ö}(&‘…Ç…<¬ˆFØŸih°&XÈ«RâŠ˜Î2›kƒ×Ž°ñ1`ýEÔ§m®I»ZOBf…°§J9qþàUÑ57²@K•:DÞ˜ŸàžxúÙý0F9¾‡šÕ¿ä}¸<rî³“Ý\r«†bšzØD—X~6\nú‚+¯ìsfxLÛ‘�rHkŸp†ºmG²ÀÍ!ƒR¾ø­5þŠ´Qàa¿*RøžhÀ®O¯ËE(ÆàHª×#eƒ¡!ò6R”¥(‡4QØîŽþXÙ­ÑYQE�ØÜ6SXd~ïÙÞ¶k:§‰þèz�^ìsÏ]õÉ�Y¿“=íˆ§šI5áÌUÀ�$·t%iT»o‘m%Ž»fï´NÀó?‹�ïö)èUŸìøWÑ_Ð.D‘†Ò«·\ræû‚Jm\rÙ^WÔùF”ðvrO!ë�ñv5í‘þ^¯MmSS¡1k1>ËêêÒipÄ(×­|²áMG/û¡¬µ>¾Øÿ\0à\'D–èmwúWˆ^Z$2ÃÊñAø7h\'Â	³áªðþü2àNé¬Œ7Kú©JÖ;˜èixYZý_Óqòf�p¸Cl¦t>bÑ­›Ï	çG&s8)¢[xÂ­‹æäFÊvî¾?vjzá6—û.RaË†Ïn&’,[‰¸ð&|upK¯’-o÷p9©^ÿ\0§B‘Öœxh®¿_M/Ï£.<\\_îGLÝÓ\\¯í[TùZ0ôšã&ÓŸÖii®v‡2ÓÄÖÎ\'öZ4XHªuþèK»idÄ¿ôMÔlÂ˜$¢\Z£`ËÃè!ßb|*<)_‘çÒBQ‚eV]‘)Wïölðrÿ\0Ñ•Y �-àÁGD\"O$f:lm‚ƒ§6GÅ‡EŒ‚,�;HL½=Ã1`2†êèzC‹z3§0Wt„ceM¥`êhôÒˆ‚Šð2äÇåc\"êwtBT4[‚äJËXÚ81\rãeUfAÉ¸j.ðEÀ«w\nÔ”uI\',±òènÖÕ—?\0¸Ua�½&´!^E>ûˆÞØØï©êqè|W\\…|{,öˆðæ\\ˆ¹ô›XRï?É\ZïÉZ±1ÚþKfÓÕê5It§B%cmA¬]\\þâÜfKø!]Õ‘\"n½q:ü“C¬NÈ”I*”Iev÷Ø÷7`]·ß‚Œ,\"’-~>Êƒß(¾3XåŒBÕ^®�ÙëÔÞUs”hÚj£lÆ¥fÚÌ¶á×Mgä†lcÃÐÕ¨×à¬17û±\"44\\ÏûKd\"´ÖÞ>†Üza´IeRWY0IÜ4@´K}\rDk±­*XöUlZ–Qdv.ÌðsÀœû\'ÁvqÆ6LÒ`Ú‡kÎÇƒKÂ~ã:r&,uÀq­lÑccTªL¸-	«¾Âõ°ÒJØÿ\0X*·Žo€6_Ì\\ÑœŠ@Ý\Zä{j&[e¸ ïL°0%B¢41ìãHÇÀhâ¥Èªù\nr‡à’¼Fäj¢TÄÖcì.¹ÈÊ¢MÞxô[g,ŽHÓ2iÊž‚RÊ¿GEÏ’»q‡0ï´8Ï ›‹½‰ÐÓù\nt÷Ð¥3K\Z[ÐrdgüžÇà÷¦ï×ödzÌ´¿Ú9=2½®/á–ËIrT!%‚èq3äíÖ(…3ó‘<à™Å«z¦5À¾©Á¶¿±¶]øÿ\0áL\"l¾G’écˆ¶´?P‹n¾ö\r¶·­{~°JWyøÖ_bíxA¥<�ƒ†’åíG»C4¤�ï÷2á\'£Œþ~8Rð¡˜vô<Ã!©p14¼úIÛkÐÙèž\ZFÅ’��&ÞCQ\Z·ÒØGpé¹C —›Ó-²ótiû?9¸þ\nA–ô eg�\";�#\0Ì~Å‚ù �SeÊ5ì‡ùžO\"ÒÇ—S\"@J¤`¥ŸÈ´Ðy¤h2À²6=æ¢Ã|!Ið\ZcB¹.’™ï²àÖ¸\nˆF˜í�€Í[0¶	‡�Ø«’¸NæìËPj™Åø2æ½e‹N´éGÙÎÐÈŽ\"î­ü‰”˜cõ¢•%Ù1È¢wb‚?\\A…‰QŸìQ¼ñƒ×Ó5Á6Ý±¾ËøRNä-Eùb£<Eµ‚©“Mä5³$ùbí5º~$Œ±Ê›\"6ÙýÎµFûÚGþ¸$äÛN2îÝoŸÈŸw¯ƒ\ZÁ“ŒÖ&†/Ë¢Ã•ý ±ž˜®÷4k\'k¤%\"Oú«×Ð¦›M¥ÊÉÄ1Ë‘Ñíö°«×ÀÇT-û8Ò2\\®Œ#%‰¤BhÅ‚»7Nn)ŽMÂùÀŒÃ\'5j°žTì–Àòç6ÕôcìÆváš\r±Äo —WBã|Lòä–ÎMzñ‘±È\"Ôö7£9¨ôO\nh‚•¯k±Âä‚]Í^Q“gÈžNR¥¥†ÛÞÂ+‰Ó+±ð\\›�îÃB4L´c¥õû‰´šEù¨ri½6–ØÚùìú½�˜nœ›Ž“Î…M·–Äª01‚å·ó±0£ÁÜlÿ\0bZ¡ìŒÛè[K»¾0Ô¬ÓôÌøÝå¨Ò·³çù0\nÊ¢ö)+„l}˜$´|Ð¬üÑ\rI³Úy~‹oz\ZÀK®ÁšŠð#(�«oÅ\'Q.	Åj¦×¿BB„ýÞ8#·”MøÇà,¦DmNÞnfßÙ+J.®¯±Ia:t�ÔF“ïþmöŸ<ÚVs•éþM‰’‡z ¨ÞbŸðöòN°{5žŠ¨Fh†ƒo¯÷ØìÚx~ÆáèÃ!\"¸Ë—È–¶»%\\�ŒiQÖu˜d-ìÄ�¡CÏ!\Zœô�g#’îD’.ô¿ˆ�Û:_bÁ9$T0ÆÆtŸŠ2VÝvL$ªDýãØÄ²Çá¥¢3HW8}34jðJ$06$BÒ¨Z&3 è‚\\0:·ÁÙ·’ØÃÖYsÃx\Zb\'¶P´¼©’Çc¶®Ä¦OmìáE_CËëàÍÀ‹.�1¦)‘Ñ™ÏÑ0%mªÎð¡ÊäxíópB¤ŸûÀìæ{‹É³—îFP§©kª†t•“¬ÇÒéRJ×«Ø¤êm-W’}-f–ºå·0v¯°ZÇÖDGÔ×»Ž_Ó`\Z©dê¾·ÉLÌï\nWüp\":§fýƒ´ôsÞKµ7ãž¸úd2�6û©\"&ñÙÔáï�–§\r´]b¬=\\•Q[É?\"ÅBÊï‡B!Zo�>F!„\Z“ôß²aŒ`“\rçy\Zs`qáfYuU”/-!BéˆEÐWW�H¢d%*Ú9†U�	†Bs6,‹ipÌî†™»X×£\' ù¥ñ•GT{y6y�‰ØÁC“mÀò±CØ×ƒm2ˆë®‰¦Šôc(l™àK¼˜8^�‰ò·ò4J¥FôƒYLÓ¿CI-þÅæ¤&ãd.L1ÆÈŽ³2:žþ„”MQ\ZJé.ãÈ„zÔ}¡Òfxg;¿ƒ˜eN#¬§Þš$Âw¿üWÝˆ¸½€÷¼Š1¡PCK²•W\"\'Šïß0O2eÎ?„G‹ß…4ÜãœŒ[pƒÃÎ –JÚ:„árþ²FÛÞ:øïFW„ÒûM’bð£ÂKe¨•À”»¯m?�ÄvÐî\\å>E¹¨Ä9•®•\'Å&iðco¸á‚&yg<äÏ`¾K[k÷S‰ð4Ø°ÉxÜÛãÔ�,ñ­y+ºv`¥ƒÄÉš£/%¤žŸgi¦Jb�™0©H£íìÒÉÌ5\Z)Ípþ\0Û\"4;ˆÝËJê�ñ‘S\ZnZ!ºi6)¨NÒ1çW�im²ì~´gC‘±±Ä‡û—¡c#TÒår4û\'[Ršú`\\É„io?Àþ_BNøº©zPlÉqDa“Yg�ƒ/ÎÖ8sß\"9ÙN¥K)³…‘MLVeÆÛçìñ~Ù&©ÖI¯Bìv‹“&vø¸\'ûûŒì}Ùû	/ìkXc²Ž\"ãIcG©º	¹èGLÏM‰�[W?Áò\"†sû�”™¤yY_ˆi\\,tÚ!W�£å¡«>v&»ôeµÏø2VKaD>§Ák?Éd·–fà·š¾tV—ØKUZ¬Ÿ„µ\ZÈìP¢CÚ“G0#\0cC±í4?ŒàÆ²èi¹36ª7²Šhcvrbhp	Ò¨£Jfs S°h�Äò�u:´‘*ƒbl¯¬a§ìbÑ		\"Àv%B¼GÑ°CÖlG¨Á%¤uÁV1•òÅ9l„»ß³NÆø6ìäžðÌà¶ ö×¿CçU0ßÂ^Ì›Bt¯ƒå�§É}tCªdä +¡.E¯—ÐÔ�Á‘žz{òEï/‚¶JÎÜÏß?°ä–$[{êËÙ9’¤üR»×äBd¢xœ~IN`üƒrÉLÞ®Ð™ÈnØ„À¢zøu7{÷ôF(Ì\\lÅ�œ¿ð)öã\"£>G¾Oõr7	RýÇzpŒ�¸ñÐÆ_ØóxÆ\rpýËx‰ðG°˜îÿ\0�+cä$K7�“I3š]DáãNž‡!àÔjnø‚Ü«›–ù~2x„´gŽÅÊ†Úr%TqŽkÜMª››”­ðÐÊÁß±2AáQŽíÁ�«\ZbFL\"o‘¹wÂ`¨öÑÜã‘‚-.×.éN2þ\n«+è£Ã�Ù3Ïô;À;äìÒTæ1dŸ�%Ûðgnd†?‘�‘^wŠO7a¶–VÑFí&¾ÂÃMo²MVyð*\"sß”~	¹ÆÂõù%|ÌVdEÒ5«o™J§’U@¶êu?qK)«èÿ\0HÄÔQðXÑÇ[‘&ÿ\0ðEZ¿ëîK—ð‡¤N‰t	fêLJQ¾�ìÊTøDZ9“3L{’±Fð:!…\"â{5W{ý¬0\r8.U—À£l>)€<ŽŠ\'I-¦»üý=%âìÓ¦!¥«\Z˜ ;F²Õ©�Š•\ZÔØÍ0Ë0„$Î1	lX›u˜Nµ2K—àO“‘²^Çf‡ö[Õ5D:µè%H¦‰D%�œ´.KøœPÑ¬Œ¶#ËhÅÓ2FÛ?aÎ°kèv¸\Zi¡Øjˆã`Ê×Ïö~Fèí\rë£O*‹C~„_Vx•Î³ˆp«xBÓ¡‰qÉdnÍ¥5r,óð1P¾i†óû�A1Ë‡Áîãýƒo>LgÞ0U�t—ç‘¥T—±0¶í¯òPÑÙ‚h¸¸jTÊo5*«Ç±øX­Taþ �2%ûXŒ¤p5«QÂÆû(�©˜áî{TQáQ=+bçö9â0ˆpºž˜Ü)3p°!ÊÐrX ØL’ÙÙF4YD‰G‘2632H`3L¨¬˜Ì‘d,¬Ñã„ÝÝ\r24„å¹ä!%•È´©‘!�}¡\Z)ª¡Z&Yf²ÆEºê&Ò9’z))ZÍU¡lËò%éEcƒšÈõQœ“(GŒQ¢­rdvNéÂ£ôn¡:³À×=áù5­Ž£-cN¦Å+a¼qÈÈb„ß†	cÎ�–Äµç,U‹Ò…fo�%d¥*eH,`®½îM|,VNŽÒ}dvr×îäµ�„¸¬b¼$øå¿²„A´<�Á\0[m–€Xì¸>ŒËÙÞ‰¥]œ=2Œ¯­©µÊ~æ4ÚSåŠëÊálL•òr-9sÀ»’4bê3�À–�9`)¬�Þ&Žt\nÄB\"ÌZ1hJ&0ê˜çÀ§#\ZLb“°Ž”V	02Š‰rT=ÆF´EÜ�Gˆ/…D1;#)(e(]÷á$÷x®Ùí~Iòh£Ê‘‘eŠÅÒƒ2ßPûÆÅó.L¶òaèåÁ†—èXy·£k�!n\\�\\NOÝ]	9ó&XBE¯zñWÐ’6¯rS8½³¤Ž¿ðÆN­K‡c¦±›ìÎŸ?$L+.v_WL²ù+®85÷Lâ#ËXy™Ÿ|Ðo8g:Ë¹7TÜ¾È´Ö\n™€[­¤ŒP4Å{Îß%;ûý™±¬¿n	¡”bªôv±àÖ–hm&åì-9³9üÉŽˆB$’u\rÛ�2,1ù±n¨—ÀÜƒRÈ27]¢¦šEê\\-$6=;’²É pÇ:JÇ´i?%„“îgk>W”p2¥§ÿ\0¦ÉÁì\'bEÅP¼²…Il|Ë6-#w´‹YÝÈFÔjç¿��‚½²cTÊR7Œ’¡g“‚Çxo•kò!në&¯2`l(¹_LÚ&žLåÌ¾2fîñÊnÓ›)Q¬ähÖSôÆK‚²Óž†\'Sÿ\0ÑÚq¶°g¾!%“„Ó÷¸m¶¢Ç·±V1¡iA¬xÃÑp„¶º\Ztz„t)0“öEÐ×b&ºtz!’ày·‘¥\"ìLlžÇDbb]„Ù±Ø‚AÙv‹�ÑÁ¾ÇuíãØÊ%4àý4Lù>T±)³*¾2aþF¢+æŒ‘WdV–vrr×M¶ŸeB¯÷ÿ\0‡7m�<Ñ±#Í¥“aEÍ/ŽŽC[¶¢ÑÁÚûÛÒÿ\0\"\rËÒäû’7…ÿ\0Ç†rÿ\0»+IQ»â`Ù¥Dý[,²š`·òdûÉ%‡ò*8hÎò}\04Gëcd’~Ðü™ÕŒèd¹£(ø%ž)Ÿ©ÁGF(ÒðŸ /ý\'�¯è\rÆâs²�8#ò\'/Ÿ\nó„WÐß”o¡Ôå-¨Å¢Â\n0™Kƒ’ÜþOÀz\n�¼x. »htöqèØËxafŒ²åí¤5³ÝM½Ìø\'-™Q¶?i,(ÿ\0aaW ý!¼ö#isÀÒö“†•ù²W¡©ïÿ\0‡þú¤©óý¾0Cof\ZÚ2Å\ZUxf!™T\\–¦ÓÚ¦�FÏAb™|2 “™ð4ðXäG:ÓðÆø­?c0ïˆ/\r!¡ø„\'™åBxƒD5â‚ðÒ1ÑP¸j÷ãFø-ÙA¤¦døØÙx‘{Œ©Ð”‰ãƒÊz*Ž­ï]n\nî˜pXŒÂVˆ7ÀIvÌ�÷±Ô÷:#)é’7—$ªZv‹™Û0±qÑjH…‡î¤%QhÁªÇZ]™&“S¢óC&¦¾g¯òa„IW9ï�ƒ]4ÞD³ð\'–bZ:5‡Ø¨YS-¿�ÈÚ­r*Ù¤¦ØØÞ~d4†–B¤ØÔ¤ÑC‡ükþ/Œã’#S’#¤ÏcÀÙLó	âx„Á…W&×è„!�¾Ll‡1¢½Ýc¾ó1¼�•(�³=ø¯ÂèpÑyu�#z�.‡£N¡³U5ihÛxtl­)Ðœ;Àñ{+Ö‚Yô´r16“BÂèzX>x©	nÂ|¦‚z\r·uô#¤Ùæ­±$k„ð‘×–ÒµûßÑER&�›Ôf�ÿ\0räè±0ùaæ�¶l‰¨Q‰‚2]¢/Œ�Fi‘Þ¼!~©âŸ­NUñI‚	¤ðö4%[CAÄj–Z.}™N«�‰M|�˜Ë±.ÅËÐV“­<hªs/×ÓMË†û+ã!_\r†`-26­¤5oCÕÁ�ì2ÐKOíQ¨étd^¹Mƒìž�p½â�™ÛfF\\þ^Šs�W·\rð[tß-“è³•\r7lÒg< Çªe4#“”ªUFQ2ùz	øCco¡ÒyDzý3ôC�;�Ì ”!!™Óù‚Õ×Ø±úô4Bø„ò›*¦˜®Y�á×þ–ÀÐÔ`9›¾ë%Y‰‰�b<9Ø°¥sžÅ“E»Ö4Õ#Xõ|1êiâãcc�m¾ÿ\0£¨]AÞÿ\0’òÃ£»”œÎâIz3–iBåˆòûW¯þ¿Ø„>x2§R,	tÅ.\\,|†à‡£òD\Z6ñ­–¢EïE¾?o~ˆ\\”¥EEñ�Ó|2ˆdf|¿Œîzö!­jc;ððÐ{xÔ__b½¡‹Rèªø÷hfR¹dár\\�[‚p½|�Ì\n˜ÈÖrÇëb1H¹ùr8›|ŠÆ‹b\'†8\\¿†2!0ÿ\0{À™2%Ì�’ÙŠŒ72M�ŒÓÊ”c¸VòSX¸°ØTï÷ÜÙ†!|!Ü\'À´Yò�&Zœ˜\\ð‡3‘Å¡äX>õáäg¡\'dDñÍ¶/Õ0OÑJÊËâ?™HÌý90`Ád]‹Àdí¨/�´Ÿ�‹$™ö…”¦/Obò‹ÈžDù0Z5£USyò\"É‡È›µöO\'…Çb’9�xË\\û0×½H©«c‘ÝEèØOƒOQ‘>†”â¿³Ù¤ÐéËŠ72YàÈB’ÛžÈçÃÁ•1¡Aøt§¿ÄªÖöºzexƒa¯žÈC^Wš2�žŽE/ŽÅh­›{\'²c~qìÁ)ö)Ù�‰Ë¯à,àã à¾\nI8#1Àríœ²Vz\Z-»XÑžnÊÉ_ßò]MOÙ¸þ�Fm›ll�a¶GMITIùÑòøšwe†”4Re§ð!ôãÀÐã\'yiôe�º+¦|ñ4\Zé‘šÇ$~*dCœyK±O,Kô­øMõúi|4B>ŸcebL^Ï�x?VkâÍèUÂ367±AZ�Š‰åvìg¦™ngì¸Ü4oCfÎž†§�œwS­zl¥sý�¬æ12%nø0š,¶Ù?‘\\YrÁÿ\0Òz\'ÙÇ�#±ž¿Y0Bxl²=´)‡†^ƒl±M±¢‚žžè}™žËãì^kEó“<”oÂñFT_ÒŸ‡ÐÄ\\¹7¡\ZB¡�1T¶g¿v|‹K£\'”4½˜90Unª&	¤�ü’[”z,¤9%lœ\nv¡aôD÷ÑbJN…K{ rþIo.Îì\'�8cƒq\ZÊ,¢ª¦®H‚Xr‡½Ê1a¿ÚD\"VªçOÂcÆNÄî‡ª0˜¤h ¸ŠãdÑ‹y*èÀÌx‡Ù=‰{2_,¥~/†….Gæäª\rmßKã{\ZIáàÏ}y9h�‚ˆõtªT„Ûèyyo�E\ZI—äŒ´ÙƒLl\Z“S&NÅ†šj	½\rb{ã_%›šà‰��Í ™Bã&¬Þ=7pd}n	/þ&8AïaF[JƒQ�ïO¬íd…æ\'öL&lœŽ–�y=ŽS¢Rû±=‰;Lü	ZÝàNž±uä““=™†[\ZG×èã#KÅòòD`©\r8e=Š\'Ÿ\ròIÉÁ“=ŠÌ±?bäÐŽhêôÄY2˜Ù‘×È™rq¿\rÏ‘/l�d¾Xõ“à[o4›¹U‘ÅZ[É7<‡Ëô:\nåƒ‰¤Ç’#<&éÍ­È�šx´�àÂ\\Ž¦-í±nlOg8i$Ûþ­ì¯áÚoèu®}—¢çMø˜.ž’ï¦§bÅp2ÇHìÀŠäBÐð-Ý‹NM£Gñ¡2â/\nÖÄò`úE|3×gÌiØ�1ñoí0¶Vü)â.¼Àø#,\Z[2C}îÅ)è.h¾\Z¶´¹tpÌð#=\nô}ÓÄ®Š& ©´á‘¸ù$¶ú¸eÔãF¾Žà3È¾àr´à­kÃÐŽØ˜‹$\Z0k]ö3Ÿ�t~Ž…7Å0™´èãc=(}Ô,r] ô÷ð\\ ñð3@ùF	H¸~>Œ$½ïÐ´3¡cœ†ëä_@4{¦EÊI	¦¸^ˆ(bÇØÄ�ÐÃ&|%GÈš)~Ã|{7£Bú5no%|ßö6(c�\nèî0¯†`¾Ç¶OÛ\"XK[äÔ“l›„ÏÑºÄ=eä]ÿ\0‚Â*»\ZÉÉ©zäJ²°™—À´á~XŽçpe6\'3¡ÄÝ~ð´~�Ï×Ï\"blÂ/Cà{l¶Ï˜­àÈ¡‰”m�C`„â{€HØíÙ^2�fUÃ3¤ƒS’ûFøLà/‚•\rO‰ÐŽÆ&W|q‘úà’|\ZÐÐðdÔø£&ˆ®p…È©š…sPÌ�V3+I¶8�\"{~¤áùñ=�qÃbŒUT˜õ‹úÌæï‹¾šÍ#­èþtZ-%Y¶/,™* £ý4„7P‰<élx¤±Ø‹Òò8X§Ä|ËDŒvAö ùšäOØ§A&}¥í—£A£ðŒtö›*ôaôz±¢ä€ÒlÄ>fžÄ²,lm3Ocà�“<±ÎŠúbì\ZL™2,0òT|EGÚGÚ(ØtÑkƒÐS‚º{%	à6Ž\nLlçU•¶Tegàyÿ\0‘z\røG¯Äö+À•‰ŒÚ3T‡û\r, ™�†·\"|!›¹‚žSÑ)SÒìÎÀƒ\nìmË3‘E�¢ÓI‰›pGäi7‡Ïö*KL}ÌCv6\\ìÀl6Ø˜¾jìE4óûr!ËÕ0�¡êøBÇaS+‘\nœá™z?hšš0ø!Àã�Ð¢{ðòd^^‚!CN�D9|?‚#G×•èQs°Ž¡h¢8D=£ia°ƒ4ä8\'š/$eìžÈÇ)¦4ènˆ™PÃô,tO�ÇÊLœô(cŽˆBNŸÉ‹oT|oNNÇZªÉˆeE¸—¸”…cÝEôeÆG	_Ò\ZØƒBe!@ÒpÊúck¡šµ“ÛS1yÙp1)§�ªÓìv=b’§Ø„½z#´T6�¯-Öu0óË›ô@�–=ŸCÖXñÈ…ôÍ×†f{/¿�#o²9d	¡Áø†×mh¦ðYÉ™éšá	Øª\\®Éèw‚?hWºFÇØù†«(žÃh>‡àQ/Ì\Z’¤x1%/iý¡n­éÒñ¬™…ñ€òËÙ›È+Ík“¤|Â.ŠôJ>a¥Â3šµÎ†œ+ñçÈÍ‘—EDÒÄøp?#äRZD5×“(M¥|\Z<C&ÌÜ-2XÌr;=G¡|•>„�q“ìà¢ceöŠ2¥‹èúèÈ¤Æ}\rÀ‰¢Ð†)¬ó²Bx>Ú%Ñ‚¿pÞŠ4Ë5”…³L1ìl¡ñ<ŒòÐë‚½¾2YVyQ�¸“nŒº­„Ã68Aez¼	ræmÄÐè•¬–euÛrUõ¿ƒÐ!ÚM?fÌu¢¤¸ˆCì^ŒŽc+²‰‘Ùˆ8pCx’	�^QŒ•Éèì�f/Sì$ƒ^�ú!e¦$+4›Bh¬TTdžîÐ£ÇØKÑgÅŽ€˜¾Šºdù2KÈä6a�{êŽTúl°�°ç-ÍèÙÊ5 -\n˜°ÖŠø;\nºýÌŸ0¯aÇ°‰…ÛLF¹ï§¢¦â4¡\n¡¥ôGlü	ÿ\0ñ\"Á¥	>ÖT¥Û˜Í\rPá›‘¬ÍìKuÇÑ8Iàs‘F¿¡?e§Š	öÇ˜ÀÕ}j‹·˜+gNDKÊ\\MÎFjëBn\"ÚŸ¸šÒoBlt¸Cß%o”Ë|�ÝÀô`}FRÈH¶|‚ZÛ>�C¼,Vä®g˜4ýtW(a‡Ñáxv‡‘\\Þ¿\"w‚àŽŒøc\\	í™áŸ!èJžQtº{œ3V[b{†OoÁ:¢ÇgðN™�jÖ]02x\'Œ‰Sõ$àHY¯Cµ´—¶IQ½9ºJÅêÒî–ÞŒG1g°�¶†ÏPdÞPúg°ãÂPÌ±¡^Ø¸â”J¤g‰}�Ì³HÌH¯ˆl.ï²«tÃùƒy©cBNš`”iœå	«ux5¶áèˆD“6‘ *hC–J`ÍØ¾Æóð\'ì»qáb¤Vx6y”ôlt…î/av�Dp\"è{¦y{2X0È³ŸÈXc.!òT=Iè}Dê¼pG0Ëh_4¤/“„T¸#¦(ÈèõÀïC£qþ\rÊ¾|1™õ¨b —[[C»ð:!†ŸŒ>Ì7©mMèÇa¨[š”«›‘6ÔgŠ.‰ØÜÈ.Ü³Hê1UlÄ¿“mm®p ¸e¸#PßQ³”ÙŠ­\Z5���—®t‡<�¬`þƒü4t‚ª‹²Åv…žÄtŽÕ%{6ÑÚÆ;z	œ³©‹³öÖ~c-¿c²\r&.ÈÂWmàõ‰Æ��èDöF3ôñÜ&z\"!ÿ\0VêÀŸ!ó)ÐÜ!_h¿Ú*íxÐH\' ¢x›6g²M‡¡_m’K6¡ü3gB”ú_�Ÿþ«‡ÙC\'Ð}ÿ\0º?øIl%ž•|É>„š71L/ÜÍæãF¡|Šj	B¶ˆ¶Â1ª~0D&�®P[¸iUçàEÅhŽJ.ùZòbÈ`LÞmjý�à¦TÍ¸¸:˜©òÈ¯ù#Z	}WAãUðJäO?ÀG1¯z)³lt{ñHÊþÆÃ\"¨’_Àë3ì&šÁ„³à¾>K4& Úö6î)\'›ø+{lûb•Ù¤Ì\"f*7öh¼ÇúCå.ð‡Ê\Z]„�„»É”J¾ÙÈýX?LCa¦;ô7•>bí>OÈ¢ö\'*ß¸˜ÿ\0hÇþÓ7º;©ñ~Â÷kàK\\\ná–ð)µ�¶xÂ¹ä¥–±r…¢¯ä§uúØÐ9Zq4%á/‘ú†k0ÞË¿¶†e5>.Ìb¯‘“è‰!°þPÅÿ\0�Óý!£­tY+è¥Qñ\r¬\'ô%=±uó²!!ìö.ëŽ†×ãƒFœ\\THšjKàZÀÓ¬>Ly\Z£lúbYÔ\"«LL2™‡‹wLÛ3ÀœÙ”g£&r¶Ž\n›ìxÑL�¾\n¿ü>QûK–Zfd~ßì\\á‚ÈZi\'ès¶@Ü’üŒ©eòž”3%ë÷Ÿ>$ùJ“ÞX¯ˆYd‘^èmÓ2\'ìC|‡?9Ê3þ¢|àCzA+ì¦Š“ì~à°HVb¾¥Á‰ Õ÷›ÒZ3\\ü!8íê,‘™‹&7rå23I¿gM}Ñ>ãuú\rˆü†‡Ý3Ø¢�Ô|sð:e…¢oC`õFšô+f-(oœ\ZÓˆ†È‰ìö„¬ÄšTÌ<p™+ÿ\0OhÌzŠi�‘AOdKla.E=ˆI4ò$à�èö…/ì)ØŽƒFòoš+/ðK~‡B„«£+BP*r=YCG-}‡_E[} úŸT}`=\r§ØhßŸÜh\"O�­l|/Á¡ÁîŸòA–OÓçñÿ\0QHE³‚pñ\'£7¡m«ìjö¾Å{d]	ÈÎ_Èm‰û\Zš¶5< ¬·öo&½³Sü\n•§~Ð´þ3#f«r} ß(¨±{!\Zµ\Zcio˜bauí˜ü½£,dý¢0ÞÆ\"ŸZZû´6Š|‘•[#D«ìÞÅIéw§àõþÂõý„‘à“íÅ/Ož±¤�èQ=’\rÌ$|4„îÑOB�ÐeÈŠÀú>‘ô&Ë|…öü	÷\nÙMÙ3²îÐ×TìD(Æ�SæÊO)?¢½\nÜ\Zk?¸�T[(™Ù›—ð4ý�eàØÎn~¼ŸÈÏ¯²tpõÇÙŽÙð–Œë\0Öv`øF|¯¡RR»íw�Bô_%ÈËF!Û*Ä—QŸêÃ(Ûúd~«ŽÐÔÖß0²hS»§¼7É¡1Žv¾	ŒìcääK\r¬´×ù1±úñ3—±\\	Â5tƒ²±þecv&˜d±�¤ÃÀìÀ«Çä7v…+M�Ñ•FþE—	�#T¶oŒ¹E½ù…!û?\"À+Û�4øgÁþO˜¾G•Ñ{\Z²K?&i£ì¹Ù‰–zLjv/©\\—Ð‹¤\"Ú™“!!ŽÌ:\r³C{ì²Ä~HÖgÍ1\"÷\"K-ù†E_´\Z†šeŸ)¿Ø-çÎŸ›ŽËO\'ccYeŽ7–m�òÐðáÞNôüå	¶¤1ã+ÝÎ$t©>ù\ZŠÏZ´Âç\"QÁ› Ñ1IÙ/´pñ<QÈþ²*hÒhóòŠ¢B$ÆÄu†ÝÈÏsÞà�3öh‘­‹5µ–š>ø‡¶¯d½Ÿ0ÀŠèsãìYÓ\Z}‰åìGÍ”$gµgÓ+0\'ê§ûŸÿÚ\0\0\0\0\0\0Ÿb³=9IÖßIÀöûœòãÏyÆ\Zî�›—B É\ZÈºãÌ1ùuU,R(Oî’Êã›œóÿ\0Ï?ûA7+ÅIQ¤±x—¤ól×þúÿ\0«c²8î¦{ü÷?þãw²Ê(Ø¶º\\§$©\"4öY‘†M£ãìÃv)…óœE\'E7œa•Š[Š°ƒ©ÐQ~ç¼Õ±4œE…œh×0Ïÿ\00ÏÏ1ßï8Ïí¿¯Á‡n–8ÃÄÈ�*’�¨ˆEÓBCÂ8€Cw¸…k6»ÔÀÜ‚Ž\0¢ŠB`žä*4óˆC²¨àqÕÔ²\r@Þâ0Ï¿×n±’2c3Ì1…ûÌ\0?þÿ\0\rðÎ{êƒ0Ç7O•ó$ö»§áü8ûý:Æ}1ò g]]æSawÞqBsywq–Ÿöít‡êæq”Xk 3´ñ=A(S�I2Ø=ûé/59qÙ“Ï“;¯õ4I\Z…®ö\n!­t¬åƒ�ìé9xi€zø…¯%×ìàð#³Ý]Æàë¾÷žáñ.*{ØÄ Ü¿@ü€�O,gÝlo;-@G\"ŸÚ©lÂ�3n9BÇ�Œ*ôÐvqVœ§?‹Z†Ì´Å^-_{Úû	t	â¶œMY(ã6ùðóY[ŠL>·u½ŽXSÅšr^Ë”2EOZæD!%Ûª<¢¥j‰Sµòg74¬²±¿äõ™\\¡<Cðð¸{Er“„š»“‚yÉC¨Ãî­Œ©XñåÁc‚kI!°/Ïpƒ†�È_»t¶\0s†S�UGƒÙŸòÔÄÿ\00D´t¥oŸx0ÐÄ­�mg´¹Šªt×yºÄ·ŽV¡Ôûrï\\°	ã‰s_@ö*%çÙá¸*¶k¶0Ý,?OÙì|Äâ*à�!Œ2?õû9X~ªPû¾!Û.vKž–Ê¥=OJó�ê>7\"åX¬û¬\rÝˆz„|º�dûm3a/‘ÿ\065ÚR®=gZ�®0U:ú•¾&nÜ¨·¢)_áÄkÉUµÿ\0l„Úˆ\"µ,žšV’sj‚†Dæ€@ì*ƒ¾@·vfºR¸nš•2|?àiÙ‚‡„14¤ÉíIèÏÐ­d�­yiò•ßßœ%†Ó‚žêr²u’×Â\rCÝ°À²¿^0ªÐ`V\n—&à0%ý?æÕ^‚#a�X€ù˜Ö$æöŽèõ`{w’Œ­c¾T`°\"™fkì®j3ì§ºA3€\ZvÖåß_Îÿ\0÷ò~É‘Bq†&wo-”…C«û#Çì\Zôtk‘v_€Hâ–F“ü¼¬Š1“Q�pINô¹ë7š¼¥Û`§|”Ámnÿ\0qšu–y%–\ny±£›‚á¦ÜÏ«]j\\†ƒ}~i52@AóiÅ(t+V¥{Šá‹è÷#ÊiðHTù*†àž·ðëŸŽfcâ¸ç*hÇ3�–A¡û\"¢”ÞGE0÷\'\n4®ÔGf.±Cw\Z¹w•µÃÉ t+²èè–\"EÛ2Möu™Ê¡\'ÿ\0 Ÿy;Ü‰åa\0µ’¯{Úœ—œ¾¿u¦œì¤ü¸‰ƒ”úþ]·JqŠDâ˜ýíÞü0BqèžŒ0A„‡ðžç@p( \0¡qðÝõïÿÄ\0 \0\0\0\0\0\0\0\0\0! 1AQ0@aqÿÚ\0?ü&!?4¨´Y©£FËâ½�!�±ÉùÂ„þ%²-1„¾‹CbÑ\"L2$Ä!B£¸VŠš!1±üú.SŒ!	ˆB„øBôP¢½	ÆÇN,\rÑkø¯ñõ\'Jfý�^È=¼kÜ¾Œ###&\ZÆèjôxÄ›ÒV‚n…à#þu¥&&ƒ\'Ñ	Î„é½ìi±§€ Åˆ”¡b„!1BŸÐ÷¨ªZdµ\n:Â5ØÙ²‚?É*\'â~éRÈ›ä‡0Eœ©Æi»¾Îc\\¨X¢ï4Á½±ò��™�–&S‚*�Q¨ø�ËN1$‘àù|- žÃS	âD …ÁÛ`Ý+À�3LFâVÙQRD\nöl†.†Èƒ‚¡\"%cJ	�H*¨Û¡ìB��2ƒÐj	2	˜Ý‚CMaP˜ž¢ŠÄ´!Y‡‰Z#85à¼¤¶Q†InŒèn‘`ØXl¦!iˆ„ ñ$Jù‚€\'±P‘\rŠ‰WHoPL¾	î!šq‰ˆýio!ßìU‚qà…Ã$5/ ÚÊDlƒÐÆÐ´tQÆ±ô&\"\ZðHØ7t\ZÜ[>ÂlÖBDØê„!\r›NŽ±±\\-)FD$±G!^Ä’£È$1¦+z´Í¤¶Ä„I6+à]èJPä\rãÑ™�ðìKîH„?BÞ†-å;`Š9†%–Ä\\=›ô$Ø€Þ�…AèCd3éš\nÀÓCð=Q#hLlbl¢cHC::†ü=5ÐÛM‹BH˜Cš	˜©¼5JðrÆ%*ÇÜ�$?°Å6�ãÒ�ë;x†‰ö4 ‚VB¯‚¯î‡ò:4%qi¡P/°’a\r¿\nÅVÆØoè[Ù]#cdF4ÑdFŠÐ•„Ù#-\ZøXáØÚ}aWcèkƒ.ðòÐÃ›ÀSjaA:J©Zc¯Ddl¶È­•†?\ruˆ¼…1è!\r±ö—ÂoFV�¯ebb±Û{Ø²†¶$Ð»6+ÞÆÔEü?àÿ\0’¾¼±WÃoôˆøGÁ|Šö�ñ-ÚÄIè£´sì¬ûÐ¥[˜ÎçœZ:qC™°[Cp€¾Å44eàÿ\0H$\'ctY~f±�.ËÁsIN§PÎÜÿ\0Z\'B=¡{.Ä}¸¢w‹$.›\ZÃâ¥(ßðQ¾+±t>„ñp°Ñ0Ùb˜yB„ËX„!G‰úî“‘ñ.°Ï„ÓåDÊ<Nœ\Z\'²0èb# �—êø—5‡Ïc)Dù·cUãw2pX,6hØL•e	&³)\rŒD&	œdÍ�Û=ËpÙ–dD‰<—ç%Š,N	˜‚ÀÏÁ²oCÙØ]dë6Š	PÙ„\'Ââ“ƒd „…Ù*1öt>ÇøxA#A-á¡&gã\n&a˜Bâ”¥™KìlÆ”v&:�¼ŽíªŒéDÂÅÙ‹/€èØÉ‰Âæ\"f¼<š4\"¸‚Ò	\'°Ë1HŒØµéÜXQÔe!~�fùL¦–Ð»ÄD	§Dh¬nŽ» bs·ÌÙŽm‚	Bb™ŠÊÊ-“2–X®zbMá¡§E¸„W‘¡gÓ3šY>+)GÙè„˜fˆBe/Å$C\Z�hœ?ÿÄ\0!\0\0\0\0\0\0\0!1 AQ0aq@�ÿÚ\0?þm¶ÿ\05Éçs®6-îì‘É/<…c¨�ßå¼í¿øÛv	³�ü‰³-½²ÏýØ™9\r{�ˆ>åü—ƒæM¶V7ûÂgsžÏ~XvÂ	Ýÿ\0É¶ÿ\0ád~¿R>Á�ÛžÛÊ,;ýÏSé-ƒÜ¬H°ÛoËžÛm²¬;Dí£Ûm¶Ûm¶Ûmå�ÿ\0g±Ê�6vþ›Æñ¿Ëm·ø‰ÆL>¥G\\�`�ùÒ{Ÿæ®H€ÿ\0áÒÍ½·äN6­,²ÿ\0…`iÃ,³á¿ÄêË\'Ë‰Ô9ÆÂ2„#ñMáÒúww‘>Æ˜ÁM%^6Ud?ÒÄýÉžI3—áég\0¾XÚ&mMë€Û³mâGœdÇu6™¢êÎq8M6Ú[(Am¶Øw„É$…–,p^ç,“»Þ×}Û9%öÏm…·êÈw\rQÜÈÈe«À‹¥£&]‹aVV#“€®’Lƒ%—\r�õƒµ“[§wé^Á¿\\WÛ\\0W–ßBöÂM³$°¼°°…¦å’|Gã8F…„è�ß²BÚu²5À¬ÖÁx]îYX{YÉ?&}µÒ}YU¨E ödäþ½]¼ÛS£Ü§ÖCYº�Y½²•»{ÝLäK:^á€ëÙúm	¹9¿qFÑpÁìðb/`eš²sØá- -P	¢À6À]†ÇâH~¶0�n…«Ô¦Æ»€Û!Úbô÷oØÉÃÓ6îØy°>N ÞÙøyKñ&z‹6C`�ÕìéØîaËë«Ijè‹ÖÁ$ì7ëÈ\rô#M\"ÞîäUÜ…&ên–\rl(È÷dw…‡½¿DƒÙÞÆ}@­Ém†c‘¸Ø7«#«?qlNº¼×ÞÂ/³€õ„Û@dâ€¦�»ñj¸C  ¯r¡1ï#q�ëAŽ’¾øøÀOÇ{ˆ²ìúoe<¦«l°v“‹.²ÖÞ¢BSË¯Þ >Âû²êØ}’â×ô]�\0eòêÄÉØÃêîÓPÎò�Âlí»/ÃêxÞÝ€cÙ�ä™.0w¯’žãõŸ¹/Õ t{€;&û”£=Œé÷ýÙ­_Q‚àÁñÖÕç¹à[)Á&&ë�l,HE‘ñ\'�›¬ôÌ,°´lûÄ3_U�Ûý 2?oûŸõ;ûŸõÕ¯Û¼À>K]Hü®Ý	ÐFJ;\ZjZJZYù\rëãÝ{!ÔôÇH,Àöž6Ë8Ë#ƒ8bM‹ù=Xw°¦ì›HX‰’|þ£�æX]cƒ=À:>ÆÛÁÎÛm¼á#ÒX´ñŸÚÎu“\rêO™Æ§Ð%¾Ûrœe‘ñ?žYgÁònŒÉËÀòv{³‚-¶Ûm‹bÛm¶Ûm¶ßäÛxXå²Òydàã8È8\\4·çœoÃx>q…„3\\@ÚZL¸Þð¸$äO+ü†q‡�YñË/Â»6SŽípr5d«q�—Ÿýàømïm¶ÿ\0¥êÈþ0zãl �†qßü¶ÞrpãK¨¶f�ÃrÐ±½Á‘§’ó1þx¢FÄµt¶ÿ\0íÜ6ó¿,ø¯ûñ–G\r—$LÄj¶Ñ¿_»õ,=ÂÛ_ŽæY$´·xÞw�‰‰xòÅ¤ãyõ	ÀyË,D\Z[ãjÂ6Ñ‰œÝ›ë4™™&7kÖI‘ÇÎ\rÍ˜Õ‹;Õÿ\0ÛCîû¶-xË§òÖÛm¶]pû—Õœ›=âR-}[µö]ðÂfÛ¤ëõgù©6Ke‡ØÌó³Ž¸aÇv<ùo	cx:“Á#öë‘gI!“´¨Y}¿Ä	ì3Ë~Äå‰)f³þ/ø™¶Ø¶¸fq¼e‰	pöjöð2õÁ°ŸpúYmß¬àoÚé÷tû‡;�G·qôx¿|\râÄnÖÖÞ1ø¾G’e¯òY×+;–›’¥}à†À�Ù9\Z{º\ZC9ÞepZCÃÿÄ\0(\0\0\0\0\0\0\0!1AQaq�‘¡±Áð Ñá0ñÿÚ\0\0??ð¯Ö¡úŸ§øT	R¿À•*ã_¡ú2­ŸRäåAH:\\³ËªaW©ÛŽ›}^>\"¾_Ì�<Œ¢ÄH¶6GSÄÏ$Ðay^Á14þ¼G�ÒãK+ñüÆ Ši(ÊSÍhý¡\r‡m”�ãÿ\0±q\"Ú…ñŸ¼ñ‘²oƒp+µjª¸Ð\nlâ¾H¯ä� ›8ðV)YåÈaV5^w¿ÌmÆÎÇK?=ow³’‡ïÿ\0`€³ß?ü%L Š6O´ëâS„¥{«¿�´¶T®¦j«ûâ *…]ú�Ã�I`Z¾x‡Tœèùý§:ÙD¯ðHŸ¢FTM•+ô¯Ò¿J•+õ©R¿\\•*T©R¥~µúøÔ©R¥~•+õ`.ëvZ3ÉŠ×Ò´›DØ E\nrº`¨u„)+Š¢óÞ-ì}åJ\nìRá\nK\Z_&q6ð-W3éÉ-t±[œÅôÃiûKìKäñ5Ù\0±×ëâú¸JÈð²ƒÿ\0²Ú¸HµûÀ  ºþeÇ\r	eˆŸÌ¢flt-ÿ\0J™Âòx‚\0Ußx”pXëyþù�uM}üA­ˆÎ„j¾kûq AU9znýàB¡jÖâ=;2X«±Mñ)é•)­�J•*WéÜ©R¥M‰úWè¥~¤©R¥J•*¥~•T©R¿CüjT¯ü™Þs×ðn‹éÈUÂÒNc°ªk¸CkžþÑÂÄ\\\nk÷€.•Ik�xP<KÈX ewÆŸ’PDºþ™�q}_¯5,PtØíkõ¨Úfà=ï;qÞ¬¶Û?bX;*öÜq\Z¨âqÅiÓÌªÕJ·Ïˆº1ª\\7«Ï“ñ\0æt.ÅC>Õ³4x×ýÇµß¨m‚u·9ï \0‚,()+‚€a±ÐßŽŽ\'…>�µÓÇS¢šW~ÓjÝ)ê‰€¬p¯ˆ¯.ÑcNl�¥5uDÑRé>Z•T¨ú.0ÿ\0\0ý*Wë_­J•*Tò©ßé_çR¿ðc’¨¨ÁDv/˜Ûµ¨.‚•;‘Ý)Ba]ˆ\0Ý´?>#åÁEÛÈË˜%Hgý„ÀUÊ~cDM\"üoÒ1B–�ä´�ò¶èSß[ –9‹�ºî\"*1*áÑþ¡¢´ˆþG�¤&‘°Þ¥#JPjžW|ÿ\0ò 40Þ¸¿Ðh‡ç‰•MØýoI¤5n×ÖTVBÆŸ>aB¬£=liê0ÈàÑùøêV[U\r\"‹¤…ÀRBç%ˆvzù—,v”Vù<lµ˜ëÏ¸ÕrÙ—‘+\n_ž>Ð½²£ú×ë¿Yó*Qw9”ÖÃ!FT©R¿Jý+ü+üêWé_¥J•þUÿ\0…~ŒA\0Á±]ÃôB©â¥$FQÁþ¢³ÌX5½µduA~Uhq~åí§8g7c•93WB «4–—§†²#ÊáåN½Ã6äo§Yÿ\0ÈŸÝPP8G–¸Îf-âAWÌ§>°Û(/Æ|Ä\'[]6·£±àå¦oõ–D£�ü1\0¦ÍÛÖ`Ô7m‹·Çÿ\0el,DoëmX»íáØÙrÂížj\nF�­^\"­zîZZ¦kÀÞeš f¼õ.¨`D´l¼n\\r;¡¡o«ZÚ¶ŒÇšù•bhýâI|_1\Z\r|UGCá¸A¢6h+WÖÄ—µ>?J•ú2¿Æ¥~¡ÿ\0�ÿ\0©þ5*T¯òbxó	²]Wò—\nw\Z•ªzÄqKFþ^æmèƒ�qOæ¸µŸGˆ‹Z+;†ì³}?ßæ>P¢Úß¸gú(>\næYìpeî\'Af©Öü¸K¹¹§K¨à\0ØâÊâ à»¥D»ŽªáÆõª¨ú{ê%+i1ªùŽÍTS�ìv*Ï½Ï]G°·¯n\"‡hÿ\0ñR…/z‹v¦õSpqp#H‰Ó(Ñ�äÚ\"ªõ¥ZL(§¯ÌäËÜ…ƒgï;Ó\"¯9læç�/™†µuÕù¨]ÐV]¹+yýÉ_äÆWþ$¯ñÐB%oùwþ5+ü«ü™V³ÕËèœÖ>RX V•ó.€Bñü\\ND*Ú‡‡»ŽD\n¥jfœ‘³‡…Ý<ÄóC£Ó«½ƒëv5>+¨Ï<š>ž~„ÓµRÍeŽz©7à³#å*îªÛ/\\„QV…*ÖÏõÿ\0#®¤Ý¼o|w.êuŽw^zãˆ\\48ÉgG\"ií„ÂŠÎy�yÀZjs]ÕTcZ�GÒS—vbvKŽÍ%­5ÓÅËÕ–«Ï^ÿ\0¿hœ¬è�…º|Ê¥E·�P@R».>guÄ°†Âã|Ä©nÎÜ \n	Ë»/¶Ì9–?®Âù•rËœ¿˜oí¹ŠÑEíà—uÝ~‡ë_à¿ZýH5.^å_ù×éR£(-S[ñ.nò)DB[•[kþ¢yCh|!…$ºýÐnXn�|{„µJ4EµN>`¡l/[\nÏ¤[EK¾>aŠ\0˜ZââÒ[àçh�*öšÐ;)ú­Š¢k\Z–\r0ÇŽú‡`6��ú÷hSoæsËÇúEiAx¶°ñh³7N¶%:iæ;à\Zò£d8Ü_˜¶T4g&ù(7ÑGâp… »¯0BÊl@««ñ(\0®Â�\"p7�Q\04ný›x>*~ùõWmËs\n:žà³Œy\"×)­Â¿¡*ùŒÔš«k14eµ[\\Ô\noãô¯Ñý•ÝÊýkô©_ûT©R¿Z•úÔ¯ñ¯ó`\\�~	KÂöùT…œóô–<�¥ø/¯>áe©FéNiN’^\\P­Þ¡_š²üÆ!ñ@¾_rö\ZÑVÔ—*ØòcÍA5–‚§ÓÏ<Á4­šVêŽO2©X‘…U™¯wIÀl7Ù¹¨KÂ^ìßú=\'š¡/Íõñ÷…Š\0Ùõ\Z¾â_²\0J)ÞÅ(k˜¨[À¦žXŽ‹Ñ»ÍŠ6dxªØ±®rãôøšúW_ý–A‚…¹ÏÌP[…ãöœ›ÈŽ¨ÇÖà¡­uuÉÆø”*Å­sÜ-wWÁSvw‰\0µÊrF»9_ø2¿F�Ò¥~•úT¯ñ¨���•�ƒ\nŽ#tÕ2„ºÀ\nƒ×¯éO˜-€COdU+ÃP%(–1© ×)ëŽ§+`<Éé¬�b]^˜Š\\ýA×RðÔÚ‹ïŒã¸çHø•{}Ü¾Tí\nÿ\0¬\0ø²UqùŒÐ/žØ·I¥@ÕûzÈé?B”r]ñ²”«Ýº¢Ñ\0T­ß¯æá\r{ÎsÇ15:_7°6h¿¤Jk˜4|…X¾âU]}áÊûCiDõN7Ì=š+>g»oâ!M\';¿®)}’¿Z•úÕÿ\0�‡r¥~‚ðÿ\0�þ5þ\'øT¯ñ¯ó`Aa…f`È×˜D8¶\\Ñ¡ëºœ�Jÿ\0cU5PƒÈ×ºbÙlOA§0ÓÌ/ÞRâ-ÂL±¡êXž=CßèY�ç¥/\n=ïèfÆweö%ŽC—Üà”óÔe5Ó�7‹�U¤UÆÎx†ú”Z¹y\"$°¼ìIÍJR‹à5YP�{‚ØÑž£zwóÈ«,¸áæ+Õ·Ì×Œ  YMÏÙJ`µÍJˆX²‘ÿ\0çëQCr�Õ�þhá%H¢åÚFå*¯R§øT¯ñ©_á_â�iN¦ƒHÚ\nýâ²¼Ô¡€ðvÍïZ0=ð›,7­���2Ø´-=Bâ\ZN‰cr�]ñ5Ëmñ±7jS3ŸQJhkæ3‚bç\\Å±l¬¨ÒÖ×‰Ú~”ePzˆKœuö•KÈ‘µQUµa(myõ¶Õo¹M\r4ð¢_Ç™ñ4;%}£à\npE×ø•¨{�%Uw§¿Ð\0\n¢¹»œF¨¡¾ÿ\0Gü{ÿ\0ü)[%”À!f:—Õñ*¥ …•ç_¢\\»þÊüD8G+‹Í�afžínŽÏ6%mu™´]Òÿ\0º€,d¬¬‚Î`üJô’Ú]�J\r-{¿íÃŒVÿ\0ÙHJ‚�.Å‹ÎÊñÐ9ˆBÑjT¢2wiYš}4Í$ÉWÀ½¾¥l7‰bÕ–mxœß?X\rJÞq8›N€àîPÎ™ñ,W¥õ–ÊÚD\0 ×udW~#A|ÛAÑÕ¡vC·ô ºîJßÒ¿T¥%�Ä©_­J‰Â\n^*rªj7Ò·ü¥J�+ô¯Ò¥J!úÔ¥J•S˜j%<Jk—%Ò~axM¦±—zE~×¨y£Aü¿0‹�R–ª™b¯âi\r@<ŽÃDéz`u;†z›T5£o}@[ZÒýÌM)1®5þù–„:ªk:üF´iÄ¼X)‰ÓÔÐ³V¸¸Uó:�¬î	[� g‰ƒ\\1+0*¿oÑQòÔ X/6R•[÷Š‚µ·“	êcú-|Lÿ\0®Zÿ\0\nÿ\0?ø\\¿ó©_ãS?Â¿Ì±²SX\"2%¾W³ë³ŽÂ»û.óµ,½—•EÕ”Ö{ŒW1|7î¢_Zl}E%^ÛÔëïâ.\"ã_ÌGåªõxd\"ùDcá¬(+brA¦¹ù„poKü_Þ^Kžmýr �7¿o£¼3IC´p½J\\\"6¯¯Ô­ÕÖW˜µ¹9Š`÷Áæ«4ª\"ª®½Ê\0<–·‰Çé²¸_©…o1ˆ°f…UÄ¯Ôÿ\0Ü?ÄýýÃÿ\0q\nFËÃ¡ö¿ˆåŽPï‰–yÒ‡Nøˆ4Î×ÞA;š6=ŒûKžÆ)u—��q�ðy?ÔêäŽËƒxrE�:8’!¡¢˜g´Hl[«m_¹Ñ*ÕoÒ7Ne�¢ýEóú%J\nî]Y÷‚8‘õ<!SŽDâÿ\0D½(®|Åh2�RØá8ýr�¼ÓÀVd©NQw ŠßS	!\n£$KýOòñ?ð?ð¯Ð€¼EÄ\r¥V@•Ô¯òU.ã\0R2è“G·úAÑÞ…™ÍõÄ·Ã¢ÙLSlJ½æ_ÛbB`ö·ó�¢œ¾Ÿ˜gKO©Èñ°j�ÃŸ~Þ)�›y–ÛšéUæÈ§®àUì^½Ah¥>îJ°¥Ú~±t©B¸•Ì·°ÿ\0„iG±\ZyuÕ”ò¿{ö ºËûÅHÐúb@RZr†!š=µÔHÏqc\nÈ7Ñå‚ñ\n%®\rVâ¨=ªŒ—\\©e&¼ÏxO¼)Ïðïü�Ò¥J�þù×ëR¥JzŠæfÐA’ÊÆUÊš—Ý€¸ÙW;•VùC÷ýu€˜|@^%˜înHMLPòúwûÊ$º]*äx~\'\Z¡Ô6¢«…yyŠ±~qaŸ/m¾cd(¨\rx{üCáŒÃ�<iûÃ-Tâö4èFVÜTÚ-…ƒ†óQ|óñ°çÄK-âî_˜â¼Ì=üÔL+-h¾bÞçÐ©Ê1z‡üÌ\Z|ñÏ˜¶5~S.O¡½}\">ÊÅc²9|ó|Äºˆ¨n‚º†á\ná\rtú”èä›ÇÞ¦¥7³“9–€¨Î,ÿ\0äê5úçéA5¨ˆ\0­$[•á)EõõC‘óðþ![!­¨óõØ»/u}Àñ¥Ô?#ÄÁ¹Çâå+™\\pí™0†X%ôÁVdˆb—ú£¿¤c¨qŠÿ\0\r�qŒh|3ÁVyº”®šÞPém­ÏÄYT²FÑ²üñœšø”§Þ)vòUÅ6»cú/ Ý¯R¯7›È‡cGÜùÉw	Â”Æ…Òú!kÄù–<Cwb·kí/k¸§_´9«¹•ÅÄŸ2–¥�èh�óÔ\nUÀW1>n_Ã:†U)¥W1ŒÛÄZE…x[*Œ\rÑ‚‘úÜbq²²”Áß¨Š˜lU¤Akˆ¥IúBÂSþ/ê„ ÃÙ`gp¤>X¼\Z4M˜Ç}aÏæ* Ñ©Œˆ~8{»Ê™$ZW5zú8‚w+ò¨’Èójýn)ŠÑ¿ßÚ--Ú_I#]V¾0úÀ\0ÆL²oô�¼Æ”G‹¾£á²ÛªŽŒt\'¥»¯gžxuP«	Ñ±¥�m/F›K`Ù¡:Þ¢´q�^´ÔËu/7ƒG¿æ`X4š_˜¶k¼UMãó[\0x8 ‰�Åk7~Ò›Z7À|þ�àŽ€®Œ¹tEMWUM�jõ¨ƒj;oO3ß1wV™o¯s…ø�yt½Ëp/n7cô—ºŠy–öÎ•²×-w.ãÇë¿«*  AÈ×˜…„ë‡-a±M§Ã)‰QÄ\"SeVw!o˜\nNeõpDrdÂZÎb1,ðgíeþv¾õRíiôE´¼~Èþ…~Š•õ*�–`5ÃSí\\ Û: ]Mpó\r<JÂ ÛØ4DU�£ñî(\0sÂƒüû€P\nk)_¿¤uP;[Ø�É…S.¨Nþb¢ÊpÜÈþíwg�™DÒîX—Ÿ0j„÷´ô¦¿1í|\"sáÔ\'c<§�zž©J‚< ­!ÜBI5 +iÃaÎHjå{KñpLæÙ‰çƒ7½ˆYä¹zŸðÙŠë½2<‘Ù-u‚,/Ô^*®]Nù~u%_˜rUÜÑ0wQ8>�Tù—‰ý—v€_Gè�x÷ä~””éJ�Ëáœß÷—â2Ìiºý5ßÔSHpKÝŒ °AE�J*â´9�/YŽ£œ!^f×q½£˜=¥L¨ŠÈöU%á®ŸnÞSn&½òý¡rÄò®±®»\\GÝšQŽ¹ž4�hœäÿ\0d>Åÿ\0ÐÅ«¾Ì÷•‘!DFŽx„A`¯Ò,íA÷�S´Žš–^PkÓ˜ÔRñ�ôðk¹.Â¢´V‚]�Žz­ÆÚ®ÁùpsÛñ{.¼fKZ�è·RF¼o5ÌzÔ¼çâ&€„ÚJx÷�š\nÉ¿Ö^–ÿ\0]ÁÊ›°ê]ùâ:â\r!ê½Dß2Ä‚ÊkIËèê\ZL³jÞ\0ªõ__ˆu½¤` �Ï\'Y°îxÆ\nÚ!�ã”Š×rlòé´3FŒy¨í1¢×øŽžGªƒƒæêBÔUZˆÙOÌPˆZÃžaŽÀ8ˆq„Pç#PGÌPâ#rµšGÓ÷�±‡FESok]ˆxˆ-ŠÆœƒ­0+%L�¼•çõ1\\Æ\n;ú‡ˆRÜ	1(­Åäd`_&D0c \"®‡Ž-T´\"ø?è~`½[t¯pZy¸…ÛŠñ¦õÀÒ	exŠxƒ�”VyRLµÂËËâÿ\0©ScM\0åR¨Œ¼7á`ÛÍsî]rp€-wñµâ#Š�4S¯_ò@ª(WHcq¡	ÃãÍyØ¡/â¹‡‡ÆœûƒH\0H¾¦‡¥ªÍ�ž+]»mßQg+ËQ•¶Ì±Kc�¡£FyùƒQ¾ãÃØ^z¿p#³+ÝÎ¦UkÏ¿ñ2Æ»Ë»ÔN	y®½Åe@â÷â´`ÕÙUq‘øI•­—¬	ÎÖ=¼½\n�¥)X7EÚêPŠëè\ny÷îžÛ–w®j¹ÓÔ\Z!�lp%P5ˆtÆ®\ru]ûMÀ™Y8J‡s’#lcæDêä(æ<â(\nlÝ4–ó\Zº&÷Q*)Y+h\\\0,+Ì1Ž”ez�o&Eñ\rd^�&ª´nÀ	~Jeæ­É×Jnª\nãNaçÂ1­�\Zî(Ôƒ!dµ0p…”Uà;eq^$çËå€l*ù�p¢ÇÜ¼xL>R‹î«R¬bû‹A\nøùz!Ã^áß5ÄÐojÇ¢ZÍMW¸È42í{v·ÿ\0 ˆX¨[­[ú>bÙ¶Û¡îß<™JÝb´¿p ÷”¹rà7{üù•´ °å—nW!ß‰aƒ\nÅíÙÏ±D¥…#TÖ…‡5â¤ôàÝý¿ˆè¨´˜/1�OO@ûcÀ»¸bŒ\0zñ:üXà\"­¡•>1ákí\Z“[Î’ðî0æ`/˜w0jÐ_e”~Ñçc¡Q\Z3Á½˜_:Œ(c.à7ÆB±°C+.Ï„Ckæ¡ÍnæÂ]:ã+kÜJƒäs‘P²Ã`Ìè£#­ˆ¥kŸˆ„\0\0ûFÅœêU*Õ•c˜´ìŒ†£šrçü…UF+.è?1†òQ´JûBî3È¦¢¥~gÖ”\Z2!4¿IrÛŠùeÇ™x�9eà›}ÀÒ‚»Š÷Äî\"B¢ÖA�sô[údÐ~‰Õ„ji\0q( 8|n¥ËW ‰aPÓ\\Ëºó\nR1mÞbvå“•x…ázÏ2“…ò\Z*þýWŸ´ó0g(î}‹ V%Ø÷ˆ>Ô�s£€ºï�óºoÐãœ‰É‹ph\0ñ¯›~#4X£q¼WÞ!Öèå¿Ú¯%Ä+©æ·ÇI\nÛ+WêóÏL~o­ó€‰SÁwÉ·Ä5°,ŽYÃÏ�˜MEƒc¯¡—V�ÅûCDãÚ×¦È8:X\rü(#âŠ²Ê?5áûE¢¢¶óf\'¸ê+± Z·8ëç™@´+¢|i×¦g«1ôû\"ãjº–¥ØÀµ+ÈntyŠ º\0QÐø„JôÍl£•@rø„A^7åÓ—W¬”Å†Íâë?<Ç­\n g#±Ò|wP9ÁJ3„CˆGjê7k~b½À»ñ	,FæKR‚Ö´qÇ\\ÜUUÜ×â„e£=°ÉyÏé¯\\Çà@@Q§‰Í-zžN#ª9–\rb,oÜb¦ùZ¹Hp¹}ä½æs©c7²Ø£PRTìöN C”áþqg3žG+öŠŸ-Ï_H#RóqºÜ=Mn#æ+óW±¶Ä�‘šáæ\0aJ ø+§ía\nlVS­¾,ÑÚø‰06S£�ª*&êV ÚwVÕvù‰ D£/‚ÁN<K¢÷ï–*s£Ýóñ+D\\Yâ¯<òsãb…%ù÷Wö”�¥	Ë‚º¯ÞrNn¿µá3í4ÔtÏ3‹ú÷–æÀ“…ÚÆø�e‰à\'5£Ú²ÜœæB�û£Îž9 R×y)êaíÍ\np«Zn#—X\r#DÀóî›�†X\r¼€¨(Û‡�€ è^§…={|@r:¤iÅJ[_OªP–½r§í7“Ðÿ\0d¦øl‰	QµDK…\"6Üò¯Ä\\ Ø\0‰Å?÷Ã[ ¦°V¡T %óK£e¥îÐøâ£ÅŒt]’¸0}�ä×\r¸¼lçð�6¬`šGÞ;Æ�º—{²š®}ËwøeìP\no¸$¸é³#ª”ÒKòDã©Dµ×¨\0˜€/_¹y`0`aù*ÁÊ¼B®V4Foâ¦XXTÊ�†¤5�©þ›�GK�+‡rÂñ,ø¸RXÜ¬¡î�Áýápç‰ù:ˆÐàz%º<ÆË™(hN‘Çâ%£<õiÚ;öñÁòËú\\Ç¸±æ·—ÌÒ�ƒRÈÙ¢OóQE®be<‹8/2¥§h»QÂ¯“<ìB¢a.’–ÀFÁ³›ê9·0hÑ¿xa\r§5bSô§ˆØ-�¾¹gJÂ³ß‰VÊ\Zi]¿&®£(²êÛ·ˆ®ó¸Ýp (á`KV<gß†XG‚k²În~csfx¶AÁˆ_Ìd;»ZµkÕd!¿ÎZ\0\nÚÍØÕ….S•rˆ-\'�þË)å)éh`Z×f\'4ÅÎ„€Ù:rUs• è$UöÖÖ–4XÊÍÒ®6Ò¨Ú¶p»ÄP7…Ý¸z‹WÆ¤ÐnÑV•©v�Å+­ïº�´…+—‰bY°°Ýà(T¡«Hðm‰¹bœ?ž´�G49£R ±F¢(°O|sÃ¼A²zD(­ýŽcBó¨\ZÂBûú1ÖžñCÒZ¡W\n\0/Ì´ÐW™Vƒó/ô|Æ6xCmÙÌ´èq:dÂ—­�i	‚ÎÌ\\$EPº‚îÂu—ÜlØ,ÛÌ)€ çÙÌ1)–ò“’¾¤T©(Íª#%C˜Hº”¶-‘6.BÚr¸•¬yjcõKMWÓz%q¼]iâ¸†ÖÆs€–w‰\0*-0†®+ºë˜“[A§ÀGŠ\ràêøíÊ£f\"V/*>k Ã v ÅËR‚\Z�Á®ãµQµu_3°oí�l8Õ}e%p¶õ×ÞY”œ¯_Ý%€HBËÓpþ\\’ˆT(¤íÔfx�\nù/­Ë”ÆaŽ\rµÞ<X\Z‹\Z2.�Jyx»x™£©‰jÁxøŽðK[r\n_GŸL!Å!Òô-p¡u. \náj—`t)©5ÚÜ`´i•zF\0!½ãæbÚ•ñÇ3Æ¯—”ÙCñ|�;jÀ´@iÓü$ÓyÝ\0!ßCþà]eêéU=ì4Ü\n¬Ö‡9¼úË˜²ŒZvë“éê\"0JùRìâ8»À¢]~ãö†/\n¨)<�û™šêµôS=�\"»¸·M5fÐ†ŠifÒ‰P†`l¨ä¯ƒ™GÃYI\\¤ÒíoÏ1óH-ò‹÷ÜZÚä\0¶ÆÏ¼Îæ�€�“œÆm ÒQÂÿ\0{†’­ô<þÇârX�GÚ\\;§3UÍTYë©`\\	jµótf³†ê¥žù:³PÆš×H=â�€ yªàþ±¹¶Š:–Û¯GŠœ(JY@½Sï|´+�CTmÿ\0ïñ)P†¼z…Z¥Úø|eË5kHŽ+¾þ‡®áúh\ZíÉö¯«[#Vœ»óê(\ZðU\n>«âÚža¯z+Ö»ç™yEòCB\Zê÷/ûô!Ë0|úbRðeöš‡ã`3I»0®¥ÀAg�&iO—Ãé,	œˆüÄ4²ý\'t\Z�pÙ·ÝÌŠ/ã\0ÜSØ^M\\0X­K×Ì¥\"�K%\n¦²çëÃˆ&Ó”\'Mu¨¼€ Ï2Õlå‰„ÝÁ!ø‰´Ò®øœ×;™pnF\Zíçæ\"¡\'¤<Àñî\Z£È5q.¡i¦ÞGˆA P¡®uÊ,»ÁmyuË�É²×zE—�«çÏwQmÁ­pZ\\ñŽ.8�õ!ÒQÕå™dFøœ!qÚìÓíCo\r õ–û€]@lS_Ìeö´•)‡+»Aæ)]é¶égœî3W\\´A�ÛP°~x=Ä:t§�Ä5°_+^.D#µ]óóÄ¼L°3…Vžo¯¸Æ¨+tßÂõö†Ð‚_Z¶è{àðßÌx³BŽ\Zãæ	x…»\\¼{ÞbFåo—Ì­†ý ÿ\0�Cc—µFžªøúAá•h�m!w•~~%Ñ–�“T®š7ˆ¨ÈµœË.Š¶µ�‰„âÜP1ÄI­ÕV-yðmFÝˆ-,MK4Ê¬bŠÌXh.\nËædv×w°¥ã7ë}h¥š_¬\nÚ¹¶6¥=YjW´Ûl*ƒ@ÞUx¸è­\Z¢ÒZŠ–Õ¾b4Â OE–Œñ¬(Ò9¼¯ˆ×ŠÍt0üá?Æ÷\0)Š¶çÃÆdª°¥xÜ…µbã‘ µÐÃæTÑ°/|¼±\r‹H¹_qY).ªTS}xë\"á/ññ=\Z”jìŽî.2Xì1M*¥´œð:}à\nÂÒÞàÆ+.c)ÅDC%åéø�BPs:†§JQlã™G‘« R÷^%Êàº¤.úKéâ»Œ›�”�”6mbÕ*u\0C±Ÿ1AæòS�íÍ|¾!WÓÎËGä›`UôØáäõ&lcÖâ\ZZè`´ lG¿æF½A.Š*ÈÅPsÚ-o˜›âÝØã\\Yêß¼ª‘a­èšø©l Ï––­~’Ô\Z¦ÄAgíîÙI€2À:)òWÖ½ôJQâÕ2tÐ-wÏÇGÀ®Ù¹oˆ”…¹\ZâUâhßüU}ÉC°Öå¶8·CåÜ;àj:ÁÍUîS‘»©bTºÒ�jXHB[T½mú”îŒ «±/�ë!¤Ž¢[vâë:‚\0�¾åzbÓÇAMþÃô�TI±IÂCxª�î ©e˜ÑøQ^¥éÅ×],Ó‹ºHÁ]¢�%ßÅoÄíP™ñ×¯ÛÇn‡`Õ×Çú†ëŠ 2\0g†ó²±mŽµ˜Ç•µcšg9äCˆ\'®»Ç%`w:Wƒ¥S†ÕœWu¢VÞ	@) *Lã–#DKCPYdÖêÏQ¹›8\"¢\'™\\\'Ù·;ùÎ}þ„plEÚ´]>¯1i[À.Ó«Zî«à[f™^ÒŒkLëï5gA®ºÃ—=²ÿ\0ÜV&»Å^9ê®M®à‰Qm<CŽ\0†Ô~þù€×%nõÖQô‹3¸½�Ê-M”Ì­üÌÀðßÄv�¹Î´+,ŽÞafõc«ê²·_‰kP!tžb4K5ÔoŒKŒ\ràù�a]n¢W—ŽG¸Êm±{£¢ÝÈ5í\'±ÚE8´Û”lNS6…¾ˆY»hñ°u+o—04sU\Z÷W(IO\\@4-±t,ç�òÃ#`©¨¤&,ò··u(MØÂ‘æ÷ä•WÍËA\nè©À�¥î ˜éT*Åô\"ZJV›ä:F%!¯\\î£)G1è¶ŸQè©Ge_ {îiR”+ƒ¯O‰œK¶k~žœ!r[}„çéŸXQ²šYmú°ÒªœˆBçwVwÖËÖÉHlÒ£4%h¾aëÚZöš¬¸0‚¶�½%è�sSÔl,�†¸£)ŽrQ\\ßó°ìâº{Œ`Ï0Póê×œ€\n=„€F\nð_ã˜µ\0[­[[Ù*K/T¿½{\"K~¬Cž/�þÇà¡tXv‚/¢¢‚U¥4ðœ·µuÑ\rð6ß\"æ&ÙÜ½r…+†…z·ñ3Q48/úˆaË(�°7€r©[„õÀ\r[CÈGèåÞ\r+Õ5Ù]¾Õ„)M¡^(³üüD=D<”³B\Zì6‘¦pw³Ë®hÆú@´çÌ\ZÑ¬·m¥p»°ÂšQ@�”»n‹ù%»C…`„JuMì@•3�¯Žßp\"ˆ, w\\¸Æé•£¨\0<·ª¥x–R{…jÇº+ÇNÄ¼m‰ ö¦§°zˆÄ–…Ë…¹pNÝWŒ>ÓªQBŒ­¦ùØøã{€U4Xäòž·é3¤¥œ^-W8�~a2¼%E¤ï_Ãl\"\0è]µoçÌ(uù�jó)Œû”Æ2Õm?Ì½‰ÆŒà‡eóøN t¹X¨’¸7,í½¢Ý—Uà¿œ¼Š‚™\"+A¶úñÿ\0ØäU¼¾£§‹•Ê]y†QC2ŸÈÙ\nØ\Z_-î;2AÓZ¥Azõ²š\n}³‰Á‹ñÌX\'Ì\ZsT¥ÞNâ¬^‘{WW\Z÷u!¹y©¬`¦´¶ƒˆkAEµ8½çnÆ3w»:±wÉ+on$»²aólÀïŽf¨û“Êll|ð‹a…óüý q¢Ý†ú~òæ\rK<tÿ\0ò .#qó×ûØ *oÇó-p²%–»b‹¨«wL<Aåµ/k\0ðÏ1W²ãj„…£OîÂ5Mà[]¡][°vBÅP*ÐÔ¾nP:Â#¼×�•x~ $µÍ`\ZëÌ X+ÀåUÏ9DiðEû|ñV ¥òÇäúÞF-/sˆÛRÇ]Žý`ŠECwyx;ë—x¶F¥K/¢¯B‘Wý´Ž+ÁV\0[m»gÌ³QÁ[Q9äÜúE9äÊ›N@4â†`¬\0¨!*ªÙV<itZ½Ð(Ô8P²©Úew»­wC›ÕÊÞyJÀÒÒ\n›U(ØÇŒÙCR�¬ù2ôë¥j\rà»²†éõ-3Â)Ò—Óñ\nT\Z&«¥·Ÿæ¢–DÖâÖ‡4 [GƒŽ\\<Ë¤vÇ�á¯ï‹TÙóÜ°º}¿xÀ‹±®M×óK…Çº�bÆ{ÿ\0r±�9x¹ffž¦PQÄ@X ‹r9Ø®$ùÿ\0rä`=Ê\"Ç$yÙÆ1£ÈN@ªzÝ¨w/Øøú]J„x»„#è°[<œœÂ\'v5­ˆ	u;‚Ezc†Uñ)»Ê’Ë”$Ú<Ê[¡²ê�Ô¹C·W“©ej,}>¡\"Q~ê0P ôiãð¢\"\\?ÝžG\'qMŽš8Ë�¬¡”^ËV�c)Ãñ-\n¥£jñ\0·‚\0/NgS‡R�fêÕ¬Bi�Ë;�Ðx.$«VT*W–(U¶TÕnúù”ÑN^âô¨ÙJuuQØá’”¼i_ï0�ZBx#–Ååmíòcq€ŠVÆj³;ús¿´Ó²ÖÔ®|\'Ú\0	h¬aYâwqiCÐà~Ì‰ãœý¢@PSOÑƒï„èWÏWûûœ2š(Rè:vu4‘T\0½€<JÆ7¤¢Í) È^[På™ëAÐZÉÔ\ZKÊ·\0\nMÚõo,�‘¸cÝ�çÕØ\ZbæÕÞ¾�¶\"Êçp ¤¢�÷·ù™,qý¹W¥içåþõòùGZ\\E¥õL;ã08å×Õº®SjÚ¦<0Ì/VuðÔahÚ¨�GUmÊÕ¾L¡�(\n/<E	N¦Ck­ÖØÝáƒÎfˆ¸Ú37*&ê†ŽŠ\n-/®ªè™LF€©è-Ê¥(„`Ê´Ò-/4üî±f—jò�qû@Nt‡;çëÑ…ÁzñŸˆHÐ g.¹Ì\nÔá�ëÏ=0Þ6Å©uË¼±!@Ðà·‚EÝºqÄU7T+)¾ï`\ZŠ›xðêîtˆëëÓýî7,•yWMûÈ\0[7Ë	-€™x7Îf¿‰CTÞK‚…««ïþ}àÁ|]B)báµòÆ¥â0’…^å:-%°³·S‰t\"Z×>à«tƒzUSMDC-·Äoh¢‚üEÒ�â…¬ÛßrÀ·µ[ò³3æ-±fŠÞ`WHÍ•\'´²Çé¡.$ïêU(îþ|DƒINjÌýÉwÍû«è™¥JB+ÃÉÀ´k..A–<Ñ	Å‹ŽF,X=»ÅKv\ZMu(º.jr1îXq§~c)Ò{ØÊõo‰Tóê:Ê´g©cB·âÈ5¯‰d@Ò—ÇýîYK¡u¼N‚XsÏ÷¹˜½�u«þßÄºcå?ë5Ñ�’øy^Û\\ˆV½–×^-å‰«ÐÑö{Ù¬â€ÿ\0}Á¾\n®cÖ¹fl*Ä]‘ûw}Ÿö[\rRÑ©ƒÂÔWºŠ»dzXTÄ®mI{•ÙzVÝøº†›Jhµe=¨ÞqlUñ5añ/,h³ç«‰ô«Z@÷Ç€ÍJi² pù}(ÝÑ�,æ+%!!Uþ`\0jÙü‚ü/HþäßÁyç?éuÇÔ½��Êòßž�ê4Ô\Z…:©ä0ó¥\0ËÃv?Ì8Ò©‚X¶ñ[´}÷\n\ZE”K±UVi^MÉ¤ô°•¦—¥^¼ÜÅù\ní\në¹	‰â1`6U=]ß9.¹Ù¡b¦‰gÌ\\Q¬¬ízeÝo�kóÎ‡ÛÀ¸xâ‚Á]|í[(«Y³\'Ns{w×ÄI—�TÛhái|l<<P+á®+Ýó.À¶g«8®s‡Ü}�±¥­l­\"ûlÖ\r\r}+÷„\0n«g6‚«_´K€Ú¬³ÜXM—V¦”>oìq-NUŒÇ‡1h	áqê¦‘5–ÜÐ_Ú\0Rj<WÞà1.ú�œì\',Á«¿$b @zù—â¹c€¥*ØêTh\\–û„\"Uì™è<)â^jTÓÆÇ†	B°Žüóõê2�Ž ~	�\ZZq’²\"»E?RÕx%7\ZÖvÅ–Hõ9šzA�yãíÂÏÃ)*ˆYyfòŽ¢8Š�Èz�X´(ç{ŽÍÓç¨J\n.€4û\'—WÊPz)`Þ Ð¥ªiP±¬…BqZû¸¶¶ßîÇU¸->>¾ÛƒUõ¢ŽËÁÀÔfX£å+·îÆž!ÐvøýÙAWW¿o¬\"¢mq6(¨ŠïUüþÐNwÅK gKŽ�ç6ì¯¡Ü%˜µé<s÷ƒ½RŽaJ7Ï/3A¼\0–ËAlæˆ5TÐ(€*ÀE»§í†±	UÔªA�\r×5ZØ*«€Úè<6™R©*À®öR¹]¨@P,rª­pþÑN“¡òz„€¯�ÅÈœP´ný¹úÂ$„ÐÌïžæpÏ“ùúÃû4i�Í×R¥Œí¶�³æò4à±ø†tK¤ÑÖ#Éã˜ C¤Š\'»ûKúNóVñ]?¸AmCjû&¤”iðoÛöŒ\"’ôÌŒÎ‚¦Z®þ�j¢žÅß,FP[.ýÊâ�¢Õ\ZÏZ¬Æõ•“Q*ép?fN!ûxŠäg~³fy¢U­÷²Ê²Ñ|ûeÛÇ¸©M<¸ŠÀW˜âÁKE«©{¢ÕEùï\"l‡†¬ä73…;”¼Aß¤\rßx‰\"üS;ÛÑ‚Ñú8r»¸®¥\"Üß÷¤gFC©cÅF4ÐºË0¥T6¼F·ºVlt¨ÂV¨¶�¼>2ýr{�>ãt\0ÊFö÷®¢¼³Uƒq@o²m)|%w4	@ƒg÷¸Z¨fK€?<@\rm\"âs(·ÌFÚÊ‚>©¡öeTÛb2kÄ£/eÁå-ÞÁõu›±žšµî£Üìµ¾ýá‰CšøÖ%êõúBÎÓÛ,èÐùmbÝqÄâ&/Ûæó{óRëJmBømý ”¨×=vg¾Š†Yý�Ò×ÁþðŽÐÌ¿ƒþâê�4±<°ÁH±ÒUÊ•qÝ-—�µG�€€·)­çË2Û®šÜþa\Z\nü§Ä*h\'•>ŠÎXÔª)RÚÙ–	°^ÓÏzË˜T¢«4•‡¼TY\nÂ�ÀsŠ¼|ê1k$^M-ƒxŽª·j_^”¥––Ò×˜Ôaj«ä®ÚüB‰àfø¾Wâ[BË2üñÆó)8X¯§l³	t–®wÄ»ÚT:-m‡\'ïï!Y@Œ\rœWÒ=`�\'*¸ÁìLÇŸë1 †¬¥§Æ©‘´×iãÛ/x�9;ïa³Qm[•ÃïŒÓ¡Ý¢�f˜òàòíçÌip¾ÍY@å‡‹xº‹J>G%Ìˆâ=\\õMò/%¢ÅÁO2úŒKØºýà#Zjx†ä½z(ï™\ZÏm.d.Gç,W{š\n}ñP×_¤9VU¦Ÿii3È×6œx?¬rê<Q+ì–º›0Á«íñ¸´ÀîÃŒôÞe4&…(\0?<ÞEýÐo`*£†kŠÌ®wiêVÐ½Í:áò–½7ïÌMn`U-½0Ê™‘ätÝþ MÛÖ¾°»$B_Ò\r@i£žÙPÌ+Ð|è�e}£\0�¡±zþù‹ŠÚ#¬ù´¿ø\02ÊO˜ïÇ…J4\r¡´Ú4¨Â,-¤ÂºÖp¡SÃ	XýÓ^œº–h_}ö\'˜…\0®\\J¦Y”¾`ˆ 1Ø­€-IÀK�wÜßø>g\ZTöÿ\0ØíÎÀe¿ä²ªt 0ßUûÁ)±i×Õÿ\0zˆ ‹ûÜM£†¢%)ÞcNJÞãA\\wñ´™Â_;!¬]rxzkö�=…vX5‡ç¶1jZÎj!N©jsm¢À-ÃÙˆAøn„Š7o+à‚aC´‘\r=;ÝpÀx€>Â.dM4-V5O7}}îÌœýÈñˆkfÍF´çˆ øG…Y|®¼Ge½®­r,¼kÎ�â7uÈ/P×P)½ö6SŸIr’Ej¾þ©UÎ?}£ï18Ibô_MþÐUÚXµ£Wãjâ1 Àq½×ï¨\Z·„×é-‘UkÐTµ\0ZË6sŸßÍ6qhƒOÃÔv¥bÙFn×ÚjŽõà?‰ÀF\nõ	´ö¬�0‡¡t—ËXBÚÛó¯Ïˆ‚8MžÇø iz;%Ñàœ=e§ò�án.ÂØVTá¨?¨åÒ\"5v³N“o”äÌå­;¹ÆÊÅz_ï#~Hz\'ƒl)¥+ÎqwRãAƒ¸,\n¢.Ù~ÌÔBªSL:†|ˆíñ(j/ÔmÑ€JH$Õ•R­–UÀ¸�ÜÉõ\"ŸKˆ‰ù¥\"�ªù\"çâJª±ˆÇ%ì@ÁÌRÊtG&ÑPùÿ\0�Ò;ÇÒ\"HÙ¬~ì4PºíÂ5ÂÙ\n}û\nÒ_ƒ#AÂÏA!Ê¯\"j5£�ŠJÙî\0ºV²¾e\r…ÓÅM£ÓWïÿ\0Dcð7,$clùêï.XãZGe%G€qzÅBÕ›8Eeäh£Ð¿÷e…¬õ�è|qY¯ïA§ÃEÔ¥ÈX.‹««ß¤Pi4±�nùòyŠ¢npY|_«;ˆÒU\\ÐVÉv×Üˆ`›EøJè€°¤¿/OÇï	š¬â Í2î¾sÞKˆßcò:x„ñC\\ºã_,he¢ŒÛýøˆ©Ä;Ä JÔmÑÍÛñëbSœ5«=7gÄÈ©žžzˆV’*Ú¯Ý‹dZ–‚|KÛ°,°¼¿É-ŠþZ©áÏ_Ò^�\0<E7mþ›U\nÀ­ÅãçãýAïaŸÂžâk@:$ë{ˆ­Üàzóé!’U?È1o˜š@Jî+VNá<Ä…tGÊ†RmL\ZÁM…Cšì—‰%ªÄ¤œ6=ÍÂÞ ê\\ÈÀY¦=\"Áí‚·Š°‹hÖdÛ;”!áYaaG\ZŠGc­q±„µë¯g¹pÜmë½Ê]Ó_C!U…{í„†üËt„¹^­··)BÝÛ~nåÇ¸tEÄå÷7Á{Ÿ2‘Aá`s\"«`„��ç;œÐ,ò×í/ÑâïÇ¨UÉC�ÜdaÀ\nÓº^>`,#Ð?Ü6W¶Wprº6ëÄ@[…š\Z±ë¸¤R¥Ó¯Ž£µ–8ï“ñ\0\Z¤D\r\Z\n~?Lý¢‹Eð[9ùê¸ùyåyJJ}À’Š7˜�9j\"®ôß‰Uy}Æ€ð\0Þ\"E<Ržyç`n¸\n�Ûäüs\r&€T*ìvQðDñ‚\Z÷¥+—.YÀÖ¨¢‹+yé2*­câQ¢†Tñ÷v&Ÿ¢ ë;Qúw	\\«¡[¸ñ.¨_c&wVaQ{^Øl“@·\\¬Bü{¿ž ±Jð\0¯ÄU‹’V„KñZñQ€-BïÏúŠ\r\rw«“™Tÿ\0ö<±\rS¨¿Š‚­Z¬ä?”åž[Jÿ\0�Ì¸l[ÇïûÂãv½ö?yh §5*:]÷+�€ˆ\Z›IËñü•ÌrzÙ‘Y±}ƒÞBìDYU�y\"g­‰(/˜˜i©ûÂàYâ-\náR­—íCÔ»vRˆ\r¥(&rõƒ#ž»>g—Ä¥Ê¶qRÃ‚Àôñ_™-@kxl´�ÔP^Ö\n_k¾¡ËSW ¸0\rÀ×_\'˜-iLÜÄvg‰Ê5Ê1«•³ÐMÉ™AÚ*Ð‹áæVóT2´iæ£€Sœ^±6\"¸¼¬h®Öd³À\r¦²*¨Wj×_ˆÊM«Wµœþ%kY�y.¹[Hàý¶v‘ ·½ƒ•Iß•µ#45~`Ê)+\0ãbƒ°AOÖ§\")\'qýÿ\0ßS�½‹-wÁU‡™¤ÇX€-[ÆÛnmÜ!-`b\07U~Î#¨ZSÐaÒSG\'1h•kžëËdA±iËèb�P‹�7Z{Ý—ªPðW�¬Ã]øÔØ˜¡Sgx¦Ùæ¡,ú@\0;[Fº�*\0]zNX\Z|Ä”T`à¿õ)ëBž^	xÇž|£’ÝÛæYì(°ýåpY]DÀ¤[ïVê‚%r@p6ŒBŽJ€VµÈ»T–aäßèl¢Ãâ¿IFÂ®½Êù‘L‹œ!Ì^a\Z)L°¥`i°�“UeÒ»lÂ¶‹—eTIÃ¸ƒ5%£¨my¸&È|F*íõŒ¯\'s›‡¶g‚Wg¾f¢ªÓÄ2Á¬gäõ‰™±‘]T\0šW>:Šª‡U±¤²ø˜õ+\'\\ÅF¢�.x“‘¼·Dh	ŽË)±~ø®¿2öï52Ñ`ä¨õâ¦�Ž¦šÍä\"š§¾j•NÑØ§ û¶ßRª›pïï.}=³bº”ê‡†L%\nÏÄ —*TÓ¯MñgÌ] +îtõ%2ÄiIC\\™ù¨cÙ\r�£ˆæßoæsâÛxØe…êB÷Ä¹ÃºSaæê‚t§•5Yz­ÊB«µ˜æâ#j«‚ÛCè]™°“„o\\_\r®û\'‹¶æýÄkÍ¼Vý?Ô8ÑW¾_Ì®W¡|Ä\Z°ûLÆ[¾–B-¡-éþäó^¡Ž¶ÅO|J(P¨[ã¿¤Å‹õÃ4¬ZÆÒ·¯~ —¬/›Ø…UÊô±†·9¾`WI’¢5º„\0¦ÔÒn¡¹N/#bÕEHûAùƒIKÉ(tKÞ%žÈ’#š‚;î5:3[ —H“ÙúFqr†,Slô0p v‰V¯ê%Ó`4²û®\"Ç>ÇË\nh\'©\\\"\ZÑ-MÔs¦YÄô”uä�*Q°—t\nCWÈ�@´íÚå‘ª¤U¹åË]z– ­üÁ”ó( PûDG±Þd)· Ð&J…zê]¡Ü’@MË¤^A,ån�¹)J•úìA»¹�ÞVåêW\rÐŠ	æ«žùõ	©Q°k¿²üéÄÁfT¸Ôax£€-ýåt7`9ý÷ïÐ‘\\„uÆ>(#ï§Í-vÝ®?…ÎÐ+µçî�Yµæ¸§\\(x–ÐGM\"‚x„,j�\0Õq=qþ ª(²ÛéûCeÊà<õ0RÎ\r±\nIG*÷ájß¼æ¼V|Gj5^I–µe¼sÔ°Æâïf1”\0&ÿ\00Ö)�G~ž¾N›%Þ¿‚\\¿È-ø…9# ‰±œÁÉ¾ICÔDEÊ\\P=J2Í¡a¯¨�ÆÑå>\'´ô/‡HÄ10€D;#:˜7ê�ØBQ–¥p)áŠcP½‘ 1|E†›ÔÈ6_@UÇHô­!(qŠwR—Õ—t¤¥¤K¯4šWÙŽÑoMºB–’i@~lç™{‰iK¡‰-““âH¨RëWÔ]üÀÀJy¸ÅÀzê9`öþÐ+jOƒŸÌë…²Ü\n#! Ü9Gþ�Nƒ—)â¼LêÒ’ê÷oÇæp\rUxÜ¾*ýKø\nÈbŠ§rîH6å_Ÿ¬v¨K¶kšßíÁ@D­ÑÖUqœÁ�(¢îÊÕ¸1¯nQZÛŠ¨¨o±Š\0+.š<µÂ[p)À\n¶�ràl.SÐKg#-¡ô<DwÏâåŠRó  9Úâ!^j¯É^Q”È“úüÅRô[*ÃÖïó Á»eä6eF;ûLˆ°«úÌ€«é8`‘¶«£±Ô1„ñ�†)¸zƒÈ4Îx%aB§¤hy”Z…\"v9Ïï�Ðâ\'\\@aê9âVÃÊRŠÃ|ÅuôËóëô\'Pu¤\r¥7Z}á…2˜‰\ZE=@v~‚vˆå\rÑóý#È`öZ”åQÜBo1q-²k—,:eµ£¦,ÕS23Œp^Ý–q«¿¡Ü¡šV‡Ÿ®¢lÞ‡˜À}b¨_]N¤QuÛë×`!Ä^¢‡Ç3· tEŽt»ëþÎ°ð�û_hC�Á]¬0z-žXû’fáýŸ– ¶¯dâÖßZ} ·’+àzêàA+µGÐ¼_«†°—Eøzó•”V€(ScµÜà‡W„\rZñ–××Ä½€/×*ôwÜmaT:Yˆš.—	¨€JwœºÆŠ\0T¸r°Þ`%¨ÐpËYa¶Ã(ð©fõÔJåP+\0\\hÆË7ÌG‚àÐùøq…\nhüÊÊ‡duYIêa]—\Z§ŒŠ{€ð‚ ¸à¨ìêYõ”éÔA‘pq�	uP[ˆ~&ÕÜ<þ‹u}DÙÒ›{‰æ/¦9–ó(î#W\Z”W2‹£êÔ}£rªÌg)v\0p÷øŽš	‰9	r˜8m™qéÓWÂ]X\r.½>Z®¢r5+ràÝG©‰]Šò8?CÊz\Zm8±ÿ\0Sy[.!š¾×Ô:N€ÓV</¸�Iå*‹»?î¯’;víÆ‘…Bíà1Z=9ÉêÖâ\0,œÝO­gþ¾¤ àØ<œüÊÊ*ˆ4o®~’Å`4ØU}þfYžôýR\nàPÝðÆŸîÍAaV~¾=qim{k>�(4ÉyÅpÝÿ\0P¨e›€Ú÷ýêR —iöÕ�Ê°fÓ×ÏŸÙgÈ³ ÓÇD\"6™ÊE%¾Õê?j%âSÏ{¸Ùöœ¤órê¡xßš˜2Žžc‡`U´º‚(-|ÀR<¾!äšséŠåç¢R®Xôõv= âYË6T¸ÏsIs<ì¯q�qL¥÷,ó<Ë³Jjß¿Œ€®b !Ùú9à‡1UŒµósqƒü³ƒÖþ•Z(ÙFž¹¯¹\0\r·z?m†ôŠs¤³ô!±»1Á:”®\\·\0Šª5Õÿ\0Ø¡XS®%UÂ\Z‡ÚTC)ÏyÉL©Á4=ô—…­—¶§¿íÀÛ8•J¾^aN,1ŒðcÄÜ9SuÏ¹BX}ñeiÃY¾ê¢*ƒª°¥Î¬¸ˆª0hötþó0vvY¤Ó5Ÿoq«±\ZÝsµ^ãèjŠ0|¼}¢Ç\r´ŽkÁÝû„é…‘E~x˜ðªÑiìå‚uOC…—õ¸ï¯™r(¨ÞµÇï)âòN�<08ÖhEJúWÚ�Ç˜}ê�”B«Z�«Ú˜mDVí••×ó,\05»ê00øe¯5(ð(¼lwÜS…‡%ÀßrÊk`(¯Ä¦ÑÁ3{%±ÄëvÕýL)v³Ç{ÿ\0È\nÙy›Ä_y3ÌkÉ*mÂ˜cé(;qƒqÃ9`Ó™‡3\r‚K\r8ˆè•qWRãÄKÔc³^`ùAS™ÔJÑÔNëŒ:¬7óâ25°ÐÀÖ‡¢r\Z¬ey¸]NPÆyQ\r „t©åJ£¹&d5ö%}Ê—ÓRP;ÇJ§6úñö\n­6xj\0t}7Çí-Sä]ç2àÑSÉÌ±l:x‰ G\0c£\r¯�p�|yîVµì86lý“êFîS•÷üGv%Íä¼÷ý&�àÜNá<ž¼m¹ý½#ºå-\\ó¥P?tYÌFs�°¿�tÎ2*u£ŠûqpºkõHn@:´%�q$wRéu�qåÞ/¯‚e˜³Åðkó9‚#vÊ­vËÓ™bÄòãŽ%ú–ÌØè¼¶Wô”ÃQq£Ô\"ê(m ‰ÒX{Š>h\n­¤\rØ£SºßÌ\'H�A-Ò Û¸<ÕCå=.âXÚUÝa(È \Zl«ŠÎ¥;—\r÷(TKr!âeá’†%0NaÅ’Çç¨µ,ð~�g]ÀXÄ¤œ‰Ôà[^.ŒUÂorÛˆ¼C¤<‚Sà#Yo„ñn$e†²ºø�M�†ˆaWJde—Kö\'¯Q:Ú¿øÀGÎGð<ÁƒáÄ¢×©‘ÆÝ<¬*rZ�‹ŽP—Éë%¡N;½”aãÌç\'ƒ²Ù_ß´ª\r±Û#ß>î\"¥ßÁ?í¦_Ÿïû–TUëñýóJÆËÊì\ZV?O¤> 46ZüÊ\nª”‘)ìîY_EÆ*wÏË¨¸<RÐÛþc—6žb�Š%èZ³XàöÇºÔ%Çš¦·ÝÏ\n�Ù+Úo¤Ê”#°>©‹‘]Q/»pW|E¾ež6PY°*nÕ¯+ŠEÂ	ÀªoÝ¿ih_¥J¸�r—<Á7eK\\}Ê£H¿´\nš�	£†ŠYyÄ·²+æ<c-ÉÃ\"qóÄJ¯ÇP_R£!UÄâ �ˆ5²¨«¶áAN¦Ë6¡Rêøo2ºEßzœ¸Å¦RR9n\0s:ê[OÞ-yæ4™Ì$ ¨¯v©Õe¡½-­wìŠïO�zIr ;_J¶òX+Åq9DÞ¦;¸ÈÓ¿1§§Dh-¹È‚¥\0>�_ßùØÒ‘YÐJø�XP }¢-v_MØï¨S\\æfÂ\rh}ÛýØ•m^‘iÁà‰Ì)mÄ·:Ùpè“ÖŠÐ[î\'�Ì1BopªÜMÞçðÇzÇR´ñÜ7KW·W»eˆ”å@²7m¤:-ù‰õN²,¢ÉÈZ0F�¢U¿’6¿îqÈK·˜©J&X—ã>±[±›9Šò“ëŸ¥—– ss½ÈÒU@¢Yr¶È¾ Y½±v3�9˜*¦\'ðñ,Û‹¬r,64^F\ZQk†F°šžÉÝ¦¥	Oõ–àX/(*½`ôd³°*‚ìeE ùþÔrŠÀãjrWfüsoÞœ}£lA±ççÇ1¥åöŠ»\'y<ó@w+¡wÌ7¨ ½†¬LIÁK�íŽÎ:Øü<B¶{÷¿^óÃ_ÍwîTÔOÉ\Z€$4œRìª~ŒBB”:k[÷âYë_>eÅ|cáî]ž%ÚÕ³�)¼ÇPä>û”4:ñå+�ˆU<Ä¥Vs4}à {eŠpgD�HµnT¶T_dÑ¼+:Kü0VmÂÂþ*Puu–ì«a²_0jôžhÑ[‡qJæ>¨~ƒÑ…’órÅ,al#²²__²\\tb&D]†pK·d Óe/ çˆ%LnuÌ3–£©|…Ø‘*�BÜ|^o�ƒ]¦¶šãÌjmÁ \\;ÃÒ°\'Â=³ˆR6m2‰fxƒ­s¢F€úM?™¢Ôöó_Þ%ø«­ôûËÍLN|c”ÙH¸—O¥ž�Þ@^ÅþÓya¬Øå²š×¸ Ö­E[\Z)Êã:¥ÂÅä0ªãúGyAúË€$/›ÜyÐßíø¨/H§PPjðP¯Ì]\0y:g|2Ï%YÇºŒÜ›°i……kârÄ�\nøõ(šŠ¦ù?ÇÞ•SÜ>à—!ën`´+W†—°•}K);;œÝzy–x¨¤‘}v§4oæb§>c^Òë[�UÇ¼T·ÙÖ0?xEÓÇ¸\n§:þüËcÅ½KÝPx$¥ãStÆ“8Æ¦GÆœÁEW©mlU+æx¸…ÎÇs/˜*ªâå)S¿P«Í�ÝjP@2W¶JvŽ7y(‘Z‡ÔLˆãÄó¡R�t®å@‘GŠ¹N©ù…ÕïFüŒ F-›êåNˆ|?¼¹ Cä<‘i”Æù/æ[JÀ<îÑûþ\"»`*po=}å8Ì\"Ò¸·‘¨Ì%ËAþß\'Þg¨Ñl¢/GeýÈ¢—}\"‰g—o¸±¨K�ˆÛ®?ê0ã\\\0â\"‘Qy«æÈè\\àBí¯RÊB�9d°æšoˆbÒ\n-…§Ú¿¼J/U ‡k*¨è®÷àåXWXV\"Ö9£Üê‹k¢\Z?[‹xDÛ†þþ ®<q9]RÃ*¨C“´î[§Ì*ØnTM?uˆÙñb|˜²ºJÅ+ÛF5”ÒÕû‚\ZôŽ:¸ÅÇ\nÞ»þ&ñaP7/‚CƒÄé–Vì¢²˜6ƒd˜üË+xšr‰uÌS´OYk€�È‡�‚¾eøs¥£Y(u@”Ü®{ñ)Ðyˆ¸Pt\0S\\—ö†�6î`4·‰\"¦^‡2Ìqî(ðíî/D!à«9’Ó’Õ“¢™Àµ…w†‰u]	êT¡¼ÖÝW>%ªIy(>ìÕÀrrããv°µ+Þ‘x;Š)ªÞ,…\ZµõV/©H›T°aÆ¬*¥…\rÑ0Šú#Ë\nÒ¬vWÊÅ5uÖV\"�æWŠÎ~â•¯MíÐ�-])\\r<Äàê…/<Ö{–�Èk.Ú^Ñ´fK×Ž)ñÄ4œLŠâ‡Tœ‚{éÞ ‘o‡W×†´¿	Áöˆr%J‡Rá¸òª‘©M$ñêB¨îúÆ-d\0)ßÔÀ0Éšø&`³Ÿu«žY	zŠµ£åTÑF±¹iáŠ¥c\rj\nºý%QŽA-�§•zb.’ #[:%•ú‰ð—Ènu*£aIÏ1\nj¢Ùc-Õ˜Àb%{†ÍÀm\'T{”˜QËÆÍMCÌF##\0å¯Ó•\\û”-T…j¢g,19Žž(XÚñ:Ær7æÈ�T¸9«&<ý�Ê#Ð_W~°^YNEq/°GýJŠéBôoÇ¹Ú4Õ­P~‘u‚ŽõoAòë_Ô{Yxø�¥Oh)ûK™äeÒªK.(a•Š²VüÁSäj$Ý«‘j¬Ýa:�¼.pw³R–Î-bßÏ3\rµ7ºýØ…‡ó\\ê d¿s™,²rÀóÎ»ö‹J¥ì‹M¡Yó“6F)N/È‘$iK¸„”�;Ž�»òGa[:(iAÉBÎ.™�ayòÀ­Œ¨ç>a¥J\0à%n°*¢=”UbÅW/=ÅX/ëgå6ˆ\'ŸPð¥x–\\Ísb\0ˆÛh5d¸Qs\0Em-ÙD3Tö@6\Z€Ë»ƒ{-x�·\rÃL–\0¬jTAê; _pD\nPMŠ®á‰[¨ëYÚ1\\ÉÙwpiu…ìEf¦àK,õâ\rº_�`–�xiù÷Ü(ŽfÔë-(K*_b)úA¶©ók¹¥¡€X[óÌr\n*”¬¶Y§&(¾kíöƒNnë¨\rèT;ðÛÔ`(¦=Êx™éÊ]\0\'Ž%K8mfÖÔƒ‡�cTL�TfuÌämŽŠè–˜Ó~¬B\\\Z·†\r\n£Wø�AenDºÎñ,\0uè¹}˜Ë—uÀß,-àoÕˆ‹Å¨žÿ\0i?ˆ\n@pÜ3ˆÕ2–çÞr›à¿:E|Ä`hÖ”>v\\8\\#¯Ú]±X½—Ì\0io¤b¸×›QnÏ‰U BAäü\\:ÂýaÓ‡¦ vó[ÖÅD[â2‡|¹9–ûKœ}ij£ê#gH[öÀ\'	4È&€X½A^&Êã­óñ¢ç¹UÙp£_Úca¾¥EƒR‡ÌR‰æ*å,.bIP¸TÀ±Ž+JT­ú”T4<=õˆ.Î²\"RÓš¹¬9‰E­û—yÊJÆX_ÔRM÷…TH†øÀ¾F#¤B†[ó)ÐÏP[_SzJ7Í|¿ˆð•Ô|ý ­ô)8ˆRÛýHçûœÄ–¯W\0å [o_îUÂZîƒWE‡ñ8ìTµJ}~�°·x—-´BŽR0Ú�@ðÌpQJ¡DF´³0n‹q‘Ø=Ñ¬Ü¨UJ•Å@PÚ¨O”èÚ‰GcÍuês‚àø�nwæ9}Ik¿ÛôüN�N\'·­fƒù‚ÅK‹Õ‡IüÀÕ`iauó�mI7a+\rAœýà^\Z¾Æ²ª¦&Z!RE\0Š2Ð-œñ�ó›çóœ¡»÷*e%´Åæk€÷ÂÕÞ«+ùŠ¾	)4„m(5oÂ VýàGîÈ¨ïC¾ÈÆÂÅx¯íCÕ)a}²XâA´¯b+\\ÌBø�\\…Ðž¥è•{!zöÊ¤u°	Oá)ÛÒ²h¬CÌ¹¼n4p9apíQ¼Ò±™IÄæìTø�ž‘õ�Þ!h4�8}ˆiÔ™åÃ\"/|,ÓX)NúþÒæÚîô�YZ2;YÜ*G:¢�÷B\Z;´lCÞšüÔD5¢{±çß˜E¸¦—¢ÞA+)Àsp¾0µøóÅ(f½ÊGi—åþ°•˜ôUpX«6ÑZÆ]‹.ŸXÉ@±‡XKçñ ®7Ñ,ç_17ëåýå·_YgY¼\nÙýaù) ,A¯±*P­mÒ2ÍYÉ*Ùlu„¿q�Q;~ø~Ð@î­=õ.r¯1Ò¡�ýkMüˆî\Zø‚\'ª�6r¿t¹åæ,P×Ã’àÑ¨£ÉRÓ’È•@CT™ÄAã™DââÚ›!G\nƒu#õ7(tË h­àäj,�)«2�¾)p^*\ZsLÑ Ÿ1.u·Ÿ\n#\n/~¥t¢\"]Ò±U³ÜJÅÈÊ¥Â1DPÙ¼5	7vöUÛ*’Î˜Z}X²‰W¨$µ_H6 üÎE¯™Y—íW›TÐ8;à¶;«*¾>\"¼œ±SÄÆ…¶ÖMpoP8W!oï|JåÕ»ð/Ôª\0BZ‘ç3ck¤¦f•ô±¤úL©kœF8ÊØ@”^7ußó	ävPÔ¦t*ÑUÿ\0#·åÚ\n¨ÇÐwÔ£Í½¯’ëø˜±“Š…8ÀÖ±8*JçÌ+ ¢ï”‚äèî.˜Nñâ8ªü‰jCÏ™YµÁó°¨â3\"[ƒ*•ÞRÊýˆ#´üL$O¬OoEoX)‘žCø‚œÚõP¾Ñ\"Äýcm‹P_O™[Âå:µ«l¼ó0d\n\'ÇL_Nb\'ÇÒ�GqsÚµßO*xúNQ\\EäŠâ>Äö&Ç1\Z“ë,¿YL.½Ê®,ÒØ\"öÅ×†*šF4hJS�A†€€m^.š_rõÄi8Îg­%{Ó©Á—ñ·‡ÁºGyl¿†˜Ñvoð÷pä–Ÿ´°yWÖ,Z­g>ò®éÂøÒ½$#OºêÏ‰E¯+Ñ¬aih>J%RâË5º\Z!”½Ž¨Ö_ˆY­�èôÇOx²(m_—eê´õÛP¡D<À6�P0xˆ¥:púÇÐ8x>wÕ�ÛØÚ]øAeG’sƒ½z—697Ü#¨°¾ßÞ¡0¿Áš<>`–‡zü‘Õiô”¬Pã¦Q×ÅÁt¿™}‘hKL€Ö\r•~\"#Ñ�ËÓâ Âú ´§ºœ`|�©B(ÔDP Bšî?ø©yÉpÁ¦	T\"¬~ÑWiQ3˜Þšò@¥nßˆ\0Á„(ââî°�‘Š½/¸Ý$GhÅ¥ÞQÔëë40Æ¥ÒzËŒÛH¥û£4¨BŠÑ=Rj‡É×ˆ1)~Nç�”ÝY®@Ãõ—5SÅ2|ÊÊ2„w™±e\r‚àÅUb$Ö’Ë·QÂ¹ÞEtªùŒ°îbÜõ±¾à]&Õ’«Z†‰))×\n<óAp¬æ¸¯¯R¾ŠÊK‹Fß-ÙáâQØFº•èœÒ_p³Áoˆ „ã!V¶ëNÖ?ˆ,e…l�[ØUõŠý\'}2¡ÚÆq\0/ÌUDW�¶ßÒRí^JÜ÷Ö†«v¡WºpØÊv\0RÌj<B›Y	3ïÆ®ÊV¡ávä|Âò£O)Ð`ãâíT¼Âì$QzñÆé‘Ò¸Í=ÀM²)ˆdû—ÂŽyƒÀóœ>IÍmËv}ÉÞÄ_žbÄù” ¯Ä‰c¨‚l¬ûÊ·_y§ÒX<Dá€v@,µê6ÝNÓr¯-@2±6ËùˆdÃ\\ž¢�z–{D•WôšRÏˆ­Z§\rÒ‰WÏêD®óÔ¨O[‰M—…*¥K¹Œ´õ|Ô4«\Z1aÎÅa°\'ÚýÂPO¤ÚS¯q{­~�¹ëxä.y�YÄ¶þÖo¤oƒ\\•\rh|“*)àƒ«6X6îà€•Za~¥•�¤5ùƒñM]Cla†{ oË¢\ZËúSœqØæ¹ì1*Ñª�)jƒºŽ\rÉ+è vwR×V·IÅ›­G†²!cÈvBŽÎ*µ‰%SÕqž§¼WŠ_‚Y‘SD:wmXoniø‹ÕBxc[AÛ8 +Èñp]§ˆ»Uà¼Ç¢�níWóõŒuÆÔz­<¢é”\\ëÓQÖ—U,zˆ¡M�Ã«ä‡Ø%»Éá\":0ú€šLÓªðÁ\Z*ƒÝsõ‡(~%#i}Kƒ·™îQäƒÔ,è78*êT°wÓÌGÞ2.£NàÇÇ¸Ûý²ÙGß*­H\n4�\0šˆÝñPp\0&8Ø±„©4§ˆ\rYf»ÙÌV´ý•-_ˆ×©> ·ùˆ9}\\ ¾³&w.Úo#]Xê\0ºÏQz¨ø~¨6@æbµW4ïÌµ\\Ý“lEâê\ráOLjÊ0bÔ3“õš¤·Ò\nìIr°ˆcIR¢Q&ƒu¢«Ý‘“Œã€hC™‹LTZ¥Gl1ÂÎŒµ¾\"D\0½Ž¼ôKò%4}ÖoÍA«˜AbŠ•ï\"\r�ð�ðX¶æÀÊ#åú}bmBƒFû¨Ôá¨R®\Z–QÈRÆ4åÜ[oA­ãÜCylU&šJaUÕs671ˆ7C—Gæ:µ.¬R4\0q‰DÚ«”s\n¹KOâ\\ã™q¢èç9_Ü‚ËÝw|Î_œÝ*í\"°]Î^3t�pÃ�{dÍXy]_T¨ìyê9¨§¶Ð€˜>ÙvqX8øƒ•ôGaty‰+[ïc„Z—¹oÌT­ŠJÙ†é|Ã¥[„-*•ó÷ü†p…ŒõÔ\0,á‚€oÒZ-J+WÞaÏÝpUÙ™Ó^í�ÀúEì5ábò‘ó’Åëh¿Ò$-kŠa™�Š‰1‰^É£ÀèY½é‡ >\"ºYðAS5Òéëâ?èˆò:hø‹þÄ5‡Æø¹Qb\nSøBÂ›šŸý¢Ñ”“{Áö#ª/�«úÄ&Ø�ÜÝ$·÷TUª>·(ëKá !åë&y×Ù@±k­(|Ü]\râIÚªßÄ)àAï\"ã8ãB\r,>e\">¯q‚�>^%Ý‘îÿ\0¥·BÉN}!Þƒb‰\0h°}ez\'d-*­‡æºqR 8÷fM•ÓÔnÜJŠ…´rÖœŒhÑkââQPçRÃÂøÂBµ3Êƒiþê¥hýF,U–ìËÁËe\Z$ê¹‰ô‚â…@xØ·„zatÐ%‰@<Ä÷R Ó\nö%&Å÷Pa„4×°G¥¯*šhûŠ#r\0Ó=°{ëÅæ%õò’ÊÂÛxya™GÒ	Uhùšø–\\Ä2_Ñ,Êb\Z†z…NÇÄ¾´ž.Ò¨À¿µ\0Ÿ^\"×nBŠ–2U¹ÌQA~ˆÛƒõŠ1ö™W^â+°;S`ï~ƒP¿(ñlt¢_¸MÂ—îÿ\0<a¿”¢®ŸlèÃ±€\rv‹²Ÿ«ª~°+_ˆšGˆ\"çZM@Üï0Žû.pH2ÌùP…«Õ¿^\"(ða,P-ÞoæTÍ¾ÔÙh:(L\\\0k%uñ�¾n‹&­ÞÂÐ`4Hö”¢)@âh×mµÙµy|Ãç	‚LlîT¾68‚ˆY¶ô®ëa0thXÂ«-T[óœóÌÝÚ¯žc×™nAº|Æ_ºvðNbR©v]Üº£U�ß¹KrÅõDà4Xÿ\0H‰¼M$NƒÀÌbÇ†¥¨þK0²¾?B?#»B•jýc–€®åG¶‹n�¢ jÎA,WÄ/­�pÌ>8³¦©ÇpA\r=¬ &SÌs]Éâ6¢úJE\r’1I˜ñWèƒ d/µôJ¥’…ú¨Yuo¹U)PZâ%]\0õ½_L«|A�6ñ	@YhXE^¢]ñ{%—J•M‘Œ½<Â÷O˜–¯\'…ÏÒ8wôK¢—¾¡nQ^Á§)ZäÀl¯±µ~ÂYÀù”Öä¨çƒíãž.)¬µaè?HÆ¶#JV}X+‚¼3ƒæ\ný,3]-l)ez-%·Ãô±.Ì»XcAÏ\n¸C¤˜”¿³º?™EQ_Kþ¡CË±:\\@ÔMÕ«—rCÖ‘…AÑ?$BÑô“Ó}�Ðìê6´÷�}U³þ 6ë\ZbÃà4,/^}Ç‹rØPó_Ç1¢â¾jç‘¡[-UÙQPØ²xÏ@‡žNgdö…4ñ`k*Õ/Iºlõ�j£UþÄ÷°G}Ç¡æÃé(\"tA²m”\0—T’˜]î­j“+ëÏâ44i}¿«.,n¬s)oÜ&ä]a;dïþ |ÃÃ\rwº  0…OŸ´]MÛ¿â$:\Z)j}¡dQb—4@ñdežÊƒY�…ˆ0·“ØÊ:,§!=ÎR|@ýb4yÈ*—LÃ@<Á5HüÌN¥Ø¼==OŒé¯¡.Ò�—´©ˆš1‰1]Já†áK	Tÿ\0¨º/æ/€ß56�Ÿ5,a_‰â[\0»WÑ9wo$Qa_¸ut.bŸM–83Ûø`–xkZ<ªýà¿†±3²ÈÕNü¤/ú÷“ÐÜ³ƒþb+b—å‡6p¼l\0áûÿ\0Èw\0?#ö…ÁîKƒ•Ðß¹)G›ø\"’ïÜ¹‚K¿x�#êÄ¿¬¡)úe=\Zr)KO©ÿ\0ä¼žÔ-x¾.âãG�&“Ý)œÔf×ˆDXZ•²ª¸€0?5\n|½1­ñNt©j…Z(J)®{œ;sÏUÞ¤–ÑûAïBP{Lî	Ö(GÜAÀ‹^	YËÅ]?M�PþŸÃ-–»›?Ôˆ¡M?“oËXûCn€AGóÄ¢v	ïÜY¥ŒqoÎccò@6‚ù~ð‘Guþ`…Jô\nŠÂ–€ÆÌ˜ÀôÑ\\GJž¨?ÞNŠz‰+Ì/ˆH‡Jß­­t�—øý à£|w\n„9–�µ±PÝ*ROP\n} ¤ÙIDé\\øŠ¯hNK³Ï±\njOÊŽ4ôqÚ~ÐM®Ø£:kî\0ìbj	vÿ\0r:;à~&1M·6\0 Jå8}ÆšZëx%9­ó+LM>Ï`ôÀ…XûbeUWcpJ=â6•ÜR…mCªk²‰Ý–Åì)íÖPÛ	jŠ¾#‚wæUvö‘kiÞŸ˜ÑÛ^àAðÎêþHÝû-ÀŽWÝ«ù�¢6¸Æ™ÝÃD±ò-‚êÑ¥‹{U^¥�å©�ÌSÒ+xˆ}	\ZßTøOï¨uUù”Î>òÄ»W¸¡�¬UkÚ¿W\0þ\'�°ØC�ËØ>µ¬€âUªôÑ>%©O7O¼þËÚ1ª0Äû‰N	ÆY½T2/xy}fd°å«è–îZï¥Í�`XŸ$°,,+ùâ.Ø2¦‡Ä Ôhèš]4?~^#Ú÷jý \nŠ1g?êCÂ‰‚‚–ÂwáŒylØ:uäg^¥‚¥uÚ \rñ+À÷Ä\n¬3eÀ07„Â|EîÎqÈã%W`üÆÓø	4OrõPÌèâ}ý•PNæ˜E˜ W‚Ä‰Áø�âS}Ecê$-²›ØÜ6‰¦…Öo03—20ÂýÎ«y`=\n*XWÖmbiwÉ>¬( Ýåàxü\"Ná�¡ò‡OÐ`¾Ô¬—ê�Ý+ÒˆírzÉmœ°ÄA¶dX§Ùe¿HZ)÷D«3“òKpÒÿ\0R¶‰È�ðÊtoa¿´! žx3 BŽØÄ®Ñ8ïírÇ/©*q.¥êWE_vbx§É”@¼­w\noÒR&ý’Wí¤øÒWÀü0¦Sp®ÿ\01/ÏÄ²(ªŸÛ!Il�?>‹#£V5ŽH†qþåBQàqöœ~\0¯§/¶R^àñ<üJrõÍOÉ‹Ó‚«´³LKú3ày_Ê(­S‰FZU^*\0�ÍÔRjýÃ± 2‹]cj°O¤Ÿ¢=JòÐ6‚ØÂÄPµaõ”ãŠðœ±0ú�^À² j(¢Õ\rÞVøŠÄ–ÙÚß¶h)•8­G”æ[aìY�GÈ–ã”+fŒ>î&ØŽsˆHE|2ñm]”„\0\'iLWqJ€t¾6+uã%{˜ëØr§°�¼„Id§«–D$ó8\ZŽa\ZDè3È#V žÜÎÝ:cQ7	žþJ¦°ù¬StöY©]Óé™©K²ïðËv½ã\nŠj/Á9s_9æÉê[¿r›üÔÙ�û‰Q÷òKþ²—•îà�—›”}½Ä‡Ò®�T$€zeŒZÿ\0ˆ¶¥kâu‹Uá�\ZH^Vëø‚Óúhû±_€ù~éKhìî)¥nŸÞ(üçð+…½ï=×š\'Úã`¹ò?I­(¥üB» löÁ�ny�48çÝûØßÉöÀË2žÿ\0·	¨ª¢XUÛŸIš¾¢ÃÅñûJ€)IZ¿9õšAëÄrŠG�¬XPÑ,,ôYûÀ$ÆËB›EÎx»þ\"ãZÝÅ¼@:•mAøóÕ.gÞbS«ø–wi²°ÖÍ½4ÜØU‚m}¢ƒt9ƒDg)}Û¾á“7xäBà<¡õAÝ¡ÿ\0pƒ\0[`‡æ.T\råßÒ9°¼ó»R½­G/$�½sô‰Éå½Ì\ZN³Ÿ¬WrëÅžb\Z\ná©D\r½K\rÒ¥ô%«¶æPÄÁymtA@¼{lhÇïmÚôG,µ.EÝöÌx«kéã¸V®À(÷únV	kë¨%Ý‰NT/MˆÿÙ','admin@admin.com','Test','','Admin','MALE','2018-10-28','2018-10-28','workmy2018@gmail.com','admin@admin.com',NULL,'ROLE_ADMIN','2018-10-28','8800803973','2345','9540165989','Officer',1,2,'2018-10-12',35,'MR',NULL,1),(81,95,NULL,'aman@gmail.com','aman','kumar','verma','MALE','2018-11-24','2018-11-24','amanverma94@gmail.com','aman@gmail.com',NULL,'ROLE_ADMIN','2018-11-24','9896767533','91','9896767533','test',4,5,'2018-11-24',NULL,'MR',3,2),(82,96,NULL,'dipak@group.com','Dipak','Kumar','Prasad','MALE','2018-11-24','2018-11-24','dipakpsd@gmail.com','admin@admin.com',1,'ROLE_ADMIN','2018-11-24','9865321456','88','9865321475','',3,NULL,NULL,NULL,'MR',4,3),(83,97,NULL,'anup@gmail.com','Anup','','Prasad','MALE','2018-11-25','2018-11-25','anupp.in@gmail.com','admin@admin.com',1,'ROLE_ADMIN','2018-11-25','9865321478','32','9865321458','',2,NULL,NULL,NULL,'MR',5,4),(84,98,NULL,'mili@gmail.com','Milind','kumar','hali','MALE',NULL,'2018-11-25','milind.hali@gmail.com','admin@admin.com',NULL,'ROLE_ADMIN','2018-11-25',NULL,'','','',4,NULL,NULL,NULL,'MR',NULL,5),(85,99,NULL,'shanu@gmail.com','Shanu','','Verma','MALE',NULL,'2018-11-26','shanu@sss.com','admin@admin.com',NULL,'ROLE_ADMIN','2018-11-26',NULL,'','','',3,NULL,NULL,NULL,'MR',NULL,6);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(145) DEFAULT NULL,
  `comment` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ROLE_ADMIN','Super Administrator'),(2,'ROLE_DEPTHEAD','Department Head'),(3,'ROLE_GROUPHEAD','Group Head'),(4,'ROLE_SCIENTIST','Scientist');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(145) DEFAULT NULL,
  `comment` varchar(145) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `FK_zone_department` (`department_id`),
  CONSTRAINT `FK_zone_department` FOREIGN KEY (`department_id`) REFERENCES `department_old` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'Super Admin','Super Admin',NULL);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26 23:56:53
