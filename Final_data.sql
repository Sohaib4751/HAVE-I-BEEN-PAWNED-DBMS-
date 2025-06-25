-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: db_project
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `admin_deletions`
--

DROP TABLE IF EXISTS `admin_deletions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_deletions` (
  `deletion_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `deleted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`deletion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_deletions`
--

LOCK TABLES `admin_deletions` WRITE;
/*!40000 ALTER TABLE `admin_deletions` DISABLE KEYS */;
INSERT INTO `admin_deletions` VALUES (1,'testadmin@gmail.com','2024-11-22 01:59:37'),(2,'sudais@gmail.com','2024-11-22 02:01:49');
/*!40000 ALTER TABLE `admin_deletions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(12) DEFAULT NULL,
  `username` varchar(12) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'k224724@nu.edu.pk','admin','hadi','Admin'),(2,'k224751@nu.edu.pk','admin','sobi','Admin'),(3,'k224744@nu.edu.pk','admin','zehra','Admin');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breach_data_sources`
--

DROP TABLE IF EXISTS `breach_data_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breach_data_sources` (
  `source_id` int NOT NULL AUTO_INCREMENT,
  `source_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breach_data_sources`
--

LOCK TABLES `breach_data_sources` WRITE;
/*!40000 ALTER TABLE `breach_data_sources` DISABLE KEYS */;
INSERT INTO `breach_data_sources` VALUES (1,'Have I Been Pwned?','Popular site tracking data breaches.'),(2,'Cyber Security Breaches Survey','UK government survey on breaches.'),(3,'Verizon Data Breach Report','Annual report on data breaches by Verizon.'),(4,'Dark Web Market','Marketplace for stolen data.'),(5,'Data Breach Index','Gemaltos breach tracking site.'),(6,'InfoSecurity Magazine','Cybersecurity news and breach updates.'),(7,'BreachForum','Forum where hackers share breached data.'),(8,'Reddit Leak Community','Community tracking data leaks on Reddit.'),(9,'ThreatPost','Latest reports on cybersecurity threats.'),(10,'Security Magazine','Magazine with breach reports and industry news.'),(11,'ZDNet Security','Technology site with breach updates.'),(12,'TechCrunch Security','Technology blog tracking breaches.'),(13,'WeLeakInfo','Aggregator for data leaks.'),(14,'Threat Intelligence Group','Collects intelligence on data breaches.'),(15,'RiskBased Security','Database for cyber risk data.'),(16,'Data Viper','US-based breach data aggregator.'),(17,'Privacy Rights Clearinghouse','Tracks data privacy breaches.'),(18,'CyberCrime Tracker','Tracks cybercrime breaches globally.'),(19,'Internet Crime Complaint Center','US government reporting database.'),(20,'Security Affairs','Security news and breach reports.');
/*!40000 ALTER TABLE `breach_data_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breach_types`
--

DROP TABLE IF EXISTS `breach_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breach_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breach_types`
--

LOCK TABLES `breach_types` WRITE;
/*!40000 ALTER TABLE `breach_types` DISABLE KEYS */;
INSERT INTO `breach_types` VALUES (1,'Phishing Attack','An attempt to acquire sensitive information by masquerading as a trustworthy entity.'),(2,'Malware Injection','The use of malicious software to compromise systems.'),(3,'Ransomware','Attacks where data is held hostage for payment.'),(4,'Insider Threat','Compromise caused by a trusted internal actor.'),(5,'Credential Stuffing','Using stolen credentials to gain unauthorized access.'),(6,'Social Engineering','Manipulation techniques to trick users into revealing information.'),(7,'SQL Injection','An injection attack where malicious SQL code is inserted.'),(8,'Zero-Day Exploit','Attacks that exploit unknown vulnerabilities.'),(9,'DDoS Attack','Distributed Denial of Service to overwhelm servers.'),(10,'Man-in-the-Middle','Eavesdropping attack where data is intercepted.'),(11,'Spyware','Software that spies on user data.'),(12,'Password Spraying','Brute-force attack with commonly used passwords.'),(13,'Watering Hole','Infecting websites often visited by targets.'),(14,'Supply Chain Attack','Compromise of third-party providers.'),(15,'Data Exfiltration','Stealing data from a secure system.'),(16,'Account Takeover','Hijacking user accounts.'),(17,'Drive-By Download','Malware downloaded unknowingly by users.'),(18,'DNS Spoofing','Redirecting traffic to malicious sites.'),(19,'Network Sniffing','Capturing network data packets.'),(20,'Privilege Escalation','Gaining higher access rights than authorized.');
/*!40000 ALTER TABLE `breach_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breaches`
--

DROP TABLE IF EXISTS `breaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breaches` (
  `breach_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  PRIMARY KEY (`breach_id`),
  KEY `fk_type_id` (`type_id`),
  KEY `fk_source_id` (`source_id`),
  CONSTRAINT `fk_source_id` FOREIGN KEY (`source_id`) REFERENCES `breach_data_sources` (`source_id`),
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `breach_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breaches`
--

LOCK TABLES `breaches` WRITE;
/*!40000 ALTER TABLE `breaches` DISABLE KEYS */;
INSERT INTO `breaches` VALUES (1,'Yahoo Data Breach','2013-08-01','3 billion accounts breached',1,1),(2,'LinkedIn Breach','2012-06-05','6.5 million passwords leaked',2,2),(3,'Adobe Breach','2013-10-03','153 million accounts breached',3,3),(4,'Equifax Breach','2017-09-07','145.5 million US records exposed',4,4),(5,'Marriott Breach','2018-11-30','500 million guest records stolen',5,5),(6,'Facebook Breach','2019-04-17','540 million records exposed',6,6),(7,'Twitter Breach','2020-07-15','High-profile accounts hacked',7,7),(8,'Capital One Breach','2019-07-19','100 million US records breached',8,8),(9,'Dropbox Breach','2012-07-31','68 million user credentials stolen',9,9),(10,'MyFitnessPal Breach','2018-03-29','150 million accounts leaked',10,10),(11,'Adult Friend Finder Breach','2016-11-13','412 million accounts breached',11,11),(12,'Zynga Breach','2019-09-27','218 million accounts breached',12,12),(13,'Home Depot Breach','2014-09-18','56 million payment cards affected',13,13),(14,'Target Breach','2013-12-19','40 million credit cards stolen',14,14),(15,'Ashley Madison Breach','2015-07-15','32 million users\' data exposed',15,15),(16,'Experian Breach','2020-09-03','24 million South African accounts',16,16),(17,'Desjardins Group Breach','2019-06-20','2.7 million affected in Canada',17,17),(18,'eBay Breach','2014-05-21','145 million users affected',18,18),(19,'Sony PlayStation Network Breach','2011-04-20','77 million accounts compromised',19,19),(20,'Anthem Breach','2015-02-04','78.8 million accounts affected',20,20);
/*!40000 ALTER TABLE `breaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compromised_account`
--

DROP TABLE IF EXISTS `compromised_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compromised_account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `breach_id` int DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `fk_breach_id` (`breach_id`),
  CONSTRAINT `fk_breach_id` FOREIGN KEY (`breach_id`) REFERENCES `breaches` (`breach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromised_account`
--

LOCK TABLES `compromised_account` WRITE;
/*!40000 ALTER TABLE `compromised_account` DISABLE KEYS */;
INSERT INTO `compromised_account` VALUES (1,'k224751@nu.edu.pk','000000005AD76BD555C1D6D771DE417A4B87E4B4',1),(2,'k224724@nu.edu.pk','00000000A8DAE4228F821FB418F59826079BF368',2),(3,'john.doe@example.com','00000000DD7F2A1C68A35673713783CA390C9E93',3),(4,'jane.smith@email.com','00000001E225B908BAC31C56DB04D892E47536E0',4),(5,'michael.brown@gmail.com','00000006BAB7FC3113AA73DE3589630FC08218E7',5),(6,'emily.jones@yahoo.com','00000008C4037D3E893F8E1FA7BAD32B9F60948C',6),(7,'david.wilson@outlook.com','00000008CD1806EB7B9B46A8F87690B2AC16F617',7),(8,'sarah.taylor@live.com','0000000A0E3B9F25FF41DE4B5AC238C2D545C7A8',8),(9,'robert.miller@icloud.com','0000000A1D4B746FAA3FD526FF6D5BC8052FDB38',9),(10,'jessica.davis@aol.com','0000000CAEF405439D57847A8657218C618160B2',10),(11,'william.thompson@msn.com','0000000FC1C08E6454BED24F463EA2129E254D43',11),(12,'ashley.johnson@gmail.com','00000010F4B38525354491E099EB1796278544B1',12),(13,'daniel.martinez@hotmail.com','0000001225719E346D78D6F493E79FD6EF307A35',13),(14,'matthew.rodriguez@ymail.com','0000001306E7C20BE7E0B28B0E8D87EFC634479B',14),(15,'susan.lewis@rocketmail.com','000000152C0E9B6DAFEB1D101A541D801095E22B',15),(16,'patricia.walker@gmail.com','00000016C6C075173C163757BCEA8139D4CC69CF',16),(17,'james.hall@inbox.com','00000019F1F7FD8582874110766ED94E470D5172',17),(18,'charles.allen@live.com','0000001AA402F38B12D440FB7DB16FFED5BED338',18),(19,'linda.young@outlook.com','0000001C5111E4CE5FCCE9C259739925AAA5C819',19),(20,'steven.king@webmail.com','0000001C5F765AA063E4F8470451F85F7DB4ED3A',20);
/*!40000 ALTER TABLE `compromised_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`),
  CONSTRAINT `countries_chk_1` CHECK ((length(`country_name`) > 0))
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (319,'Albania'),(280,'Algeria'),(330,'Angola'),(246,'Argentina'),(232,'Australia'),(297,'Azerbaijan'),(304,'Bahrain'),(274,'Bangladesh'),(292,'Belarus'),(262,'Belgium'),(290,'Bolivia'),(322,'Bosnia and Herzegovina'),(328,'Botswana'),(236,'Brazil'),(315,'Bulgaria'),(229,'Canada'),(269,'Chile'),(235,'China'),(255,'Colombia'),(335,'Comoros'),(283,'Costa Rica'),(316,'Croatia'),(285,'Cuba'),(308,'Cyprus'),(271,'Czech Republic'),(267,'Denmark'),(282,'Ecuador'),(247,'Egypt'),(288,'El Salvador'),(310,'Estonia'),(332,'Eswatini'),(266,'Finland'),(237,'France'),(339,'French Guiana'),(298,'Georgia'),(230,'Germany'),(264,'Greece'),(287,'Guatemala'),(286,'Honduras'),(273,'Hungary'),(233,'India'),(249,'Indonesia'),(258,'Iraq'),(277,'Ireland'),(259,'Israel'),(241,'Italy'),(234,'Japan'),(302,'Jordan'),(293,'Kazakhstan'),(279,'Kenya'),(320,'Kosovo'),(306,'Kuwait'),(295,'Kyrgyzstan'),(311,'Latvia'),(303,'Lebanon'),(331,'Lesotho'),(312,'Lithuania'),(336,'Madagascar'),(323,'Malawi'),(253,'Malaysia'),(309,'Malta'),(333,'Mauritius'),(338,'Mayotte'),(239,'Mexico'),(299,'Mongolia'),(321,'Montenegro'),(278,'Morocco'),(329,'Mozambique'),(327,'Namibia'),(300,'Nepal'),(260,'Netherlands'),(275,'New Zealand'),(248,'Nigeria'),(318,'North Macedonia'),(265,'Norway'),(307,'Oman'),(250,'Pakistan'),(284,'Panama'),(289,'Paraguay'),(270,'Peru'),(254,'Philippines'),(256,'Poland'),(268,'Portugal'),(305,'Qatar'),(337,'Reunion'),(272,'Romania'),(238,'Russia'),(244,'Saudi Arabia'),(317,'Serbia'),(334,'Seychelles'),(276,'Singapore'),(313,'Slovakia'),(314,'Slovenia'),(245,'South Africa'),(240,'South Korea'),(242,'Spain'),(301,'Sri Lanka'),(261,'Sweden'),(263,'Switzerland'),(324,'Tanzania'),(252,'Thailand'),(281,'Tunisia'),(243,'Turkey'),(296,'Turkmenistan'),(231,'UK'),(257,'Ukraine'),(291,'Uruguay'),(228,'USA'),(294,'Uzbekistan'),(251,'Vietnam'),(325,'Zambia'),(326,'Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_cards` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `card_number` varchar(255) NOT NULL,
  `expiry_date` varchar(5) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `chk_expiry_date` CHECK ((regexp_like(`expiry_date`,_utf8mb4'^[0-9]{2}/[0-9]{2}$') and (cast(substr(`expiry_date`,1,2) as unsigned) between 1 and 12) and (cast(substr(`expiry_date`,4,2) as unsigned) between 0 and 99)))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
INSERT INTO `credit_cards` VALUES (1,1,'1234567890123456','01/25','USA'),(2,2,'2345678901234567','02/26','Canada'),(3,3,'3456789012345678','03/27','Germany'),(4,4,'4567890123456789','04/28','UK'),(5,5,'5678901234567890','05/29','Australia'),(6,6,'6789012345678901','06/30','India'),(7,7,'7890123456789012','07/31','Japan'),(8,8,'8901234567890123','08/32','China'),(9,9,'9012345678901234','09/33','Brazil'),(10,10,'0123456789012345','10/34','France'),(11,11,'1234567890123456','11/35','Italy'),(12,12,'2345678901234567','12/36','Spain'),(13,13,'3456789012345678','01/37','Russia'),(14,14,'4567890123456789','02/38','Mexico'),(15,15,'5678901234567890','03/39','South Korea'),(16,16,'6789012345678901','04/40','South Africa'),(17,17,'7890123456789012','05/41','Sweden'),(18,18,'8901234567890123','06/42','Netherlands'),(19,19,'9012345678901234','07/43','Turkey'),(20,20,'0123456789012345','08/44','Norway'),(21,26,'1234567891234','11/24','Pakistan');
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_plans`
--

DROP TABLE IF EXISTS `subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `features` text,
  `duration` int NOT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `idx_plan_name` (`plan_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_plans`
--

LOCK TABLES `subscription_plans` WRITE;
/*!40000 ALTER TABLE `subscription_plans` DISABLE KEYS */;
INSERT INTO `subscription_plans` VALUES (4,'Regular',19.99,'Access to basic features; Email support',30),(5,'Premium',39.99,'Access to all features; Priority support; Custom reports; 24/7 support',30),(6,'Enterprise',69.99,'Access for up to 10 users; Dedicated support; Custom integrations',30);
/*!40000 ALTER TABLE `subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `next_renewal_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_user_id_idx` (`user_id`),
  CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (135,1,'Premium Plan','2024-11-01','2024-12-01'),(136,2,'Basic Plan','2024-10-15','2024-11-15'),(137,3,'Premium Plan','2024-11-10','2024-12-10'),(138,4,'Basic Plan','2024-11-01','2024-12-01'),(139,5,'Premium Plan','2024-11-05','2024-12-05'),(140,6,'Basic Plan','2024-11-12','2024-12-12'),(141,7,'Premium Plan','2024-10-20','2024-11-20'),(142,8,'Basic Plan','2024-10-25','2024-11-25'),(143,9,'Premium Plan','2024-11-15','2024-12-15'),(144,10,'Basic Plan','2024-10-18','2024-11-18'),(145,11,'Basic Plan','2024-11-01','2024-12-01'),(146,12,'Premium Plan','2024-11-08','2024-12-08'),(147,13,'Basic Plan','2024-10-29','2024-11-29'),(148,14,'Basic Plan','2024-11-03','2024-12-03'),(149,15,'Premium Plan','2024-11-06','2024-12-06'),(150,16,'Basic Plan','2024-10-17','2024-11-17'),(151,17,'Premium Plan','2024-11-02','2024-12-02'),(152,18,'Basic Plan','2024-11-09','2024-12-09'),(153,19,'Premium Plan','2024-10-27','2024-11-27'),(154,20,'Basic Plan','2024-11-07','2024-12-07'),(155,21,'Premium Plan','2024-11-04','2024-12-04'),(156,23,'Premium Plan','2024-11-13','2024-12-13'),(157,24,'Basic Plan','2024-11-14','2024-12-14'),(158,25,'Basic Plan','2024-10-22','2024-11-22'),(159,26,'Premium Plan','2024-11-11','2024-12-11'),(160,28,'Basic Plan','2024-10-30','2024-10-24');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logs`
--

DROP TABLE IF EXISTS `user_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `action_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logs`
--

LOCK TABLES `user_logs` WRITE;
/*!40000 ALTER TABLE `user_logs` DISABLE KEYS */;
INSERT INTO `user_logs` VALUES (1,28,'User Registered','2024-11-17 02:58:52');
/*!40000 ALTER TABLE `user_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_category` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_category` (`user_category`),
  CONSTRAINT `fk_user_category` FOREIGN KEY (`user_category`) REFERENCES `subscription_plans` (`plan_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alice.smith1985@gmail.com','alice_smith','P@ssw0rd123','premium'),(2,'bob.johnson23@yahoo.com','bob_johnson','S3cureP@ss!','regular'),(3,'charlie.brown1980@hotmail.com','charlie.brown','Ch@ng3Me!','premium'),(4,'david.wilson1979@outlook.com','david_wilson','D@vidPass99','regular'),(5,'emily.davis1990@gmail.com','emily_davis','Em!lySecure1','premium'),(6,'frank.miller1983@yahoo.com','frank_miller','FunkyPassword$','regular'),(7,'grace.thompson88@gmail.com','grace_thompson','Gr@ce4You','premium'),(8,'henry.moore1975@hotmail.com','henry_moore','H3nryPass!','regular'),(9,'isabella.johnson1992@outlook.com','isabella.j','1S@be!ll@','premium'),(10,'jackson.lee87@gmail.com','jackson_lee','J@cksonL33','regular'),(11,'karen.taylor1995@yahoo.com','karen_taylor','K@r3nSafe!','regular'),(12,'luke.harris88@hotmail.com','luke_harris','Luk3Password$','premium'),(13,'mia.scott1991@gmail.com','mia_scott','Mia_2024!','regular'),(14,'noah.white1988@outlook.com','noah_white','N0ahSecure!','regular'),(15,'olivia.james77@gmail.com','olivia_james','0liviaPass$','premium'),(16,'peter.brown1984@yahoo.com','peter_brown','Peter!S@fe4U','regular'),(17,'quinn.johnson92@hotmail.com','quinn_johnson','Q!nn@2024','premium'),(18,'rose.martinez1989@gmail.com','rose_martinez','R0sePass123','regular'),(19,'sophia.davis2000@outlook.com','sophia_davis','S0phiaR0ck$','premium'),(20,'tyler.moore85@yahoo.com','tyler_moore','T!ler2024','regular'),(21,'victoria.lee1993@gmail.com','victoria_lee','V!ctoriaSafe','premium'),(23,'imrankhan@gmail.com','immu','L0v3Pt1','premium'),(24,'asimmunir@gmail.com','asim','i@mGroot','regular'),(25,'testregular@gmail.com','testregular','p@ss123','regular'),(26,'testprem@gmail.com','testprem','p@ss1234','premium'),(28,'shahrukh@gmail.com','shahrukh khan','srk!23456','regular');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24  3:07:11
