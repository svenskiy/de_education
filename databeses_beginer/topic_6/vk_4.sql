-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `desc` varchar(245) DEFAULT NULL,
  `admin_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communities_users1_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'ea','Minima tenetur non numquam velit.',25),(2,'atque','',52),(3,'sit','',70),(4,'labore','Dignissimos reiciendis odit recusandae laborum sed.',9),(5,'laborum','Et quo velit sed.',78),(6,'nesciunt','',91),(7,'delectus','',74),(8,'distinctio','Cupiditate fuga aperiam harum voluptatibus dolorem.',56),(9,'qui','Suscipit quasi atque soluta.',73),(10,'est','',33);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `from_users_id` int unsigned NOT NULL,
  `to_users_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 - отклонен\n0 - запрос\n1 - принят',
  PRIMARY KEY (`from_users_id`,`to_users_id`),
  KEY `fk_friend_requests_users1_idx` (`from_users_id`),
  KEY `fk_friend_requests_users2_idx` (`to_users_id`),
  CONSTRAINT `fk_friend_requests_users1` FOREIGN KEY (`from_users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users2` FOREIGN KEY (`to_users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,13,-1),(1,96,1),(3,2,1),(5,70,0),(7,52,1),(10,72,1),(10,97,0),(11,63,0),(12,4,1),(12,45,0),(12,84,0),(13,11,1),(15,17,1),(15,72,0),(16,12,1),(17,92,1),(18,24,0),(18,94,1),(19,83,-1),(21,49,-1),(22,63,-1),(23,9,-1),(23,60,-1),(23,88,0),(24,72,-1),(25,93,1),(26,60,1),(27,42,-1),(29,31,1),(29,51,-1),(30,15,0),(31,74,0),(32,12,-1),(32,51,0),(34,21,-1),(34,60,-1),(35,42,0),(37,68,1),(37,69,-1),(39,9,1),(39,30,-1),(40,74,-1),(40,100,0),(41,31,-1),(41,71,0),(42,39,1),(42,74,-1),(44,28,-1),(45,42,-1),(45,74,0),(47,26,1),(48,73,0),(48,78,0),(50,93,-1),(52,17,0),(54,2,0),(54,40,-1),(56,11,1),(58,22,-1),(60,4,-1),(61,97,0),(62,57,0),(66,31,0),(66,50,1),(67,49,0),(69,23,-1),(70,10,1),(70,97,-1),(71,41,1),(71,91,0),(72,71,-1),(72,77,1),(73,28,0),(73,56,0),(73,57,1),(75,73,-1),(76,61,1),(76,76,1),(79,15,-1),(80,32,1),(80,80,1),(81,79,0),(82,19,0),(82,51,1),(83,21,1),(84,48,1),(84,64,0),(85,17,-1),(86,82,0),(87,34,-1),(90,8,-1),(90,57,1),(90,96,-1),(91,97,0),(92,15,1),(95,60,-1),(95,89,-1),(97,65,1),(98,42,1);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `users_id` int unsigned NOT NULL,
  `messages_id` int unsigned DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `posts_id` int unsigned DEFAULT NULL,
  UNIQUE KEY `index` (`users_id`,`messages_id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `i2` (`users_id`,`media_id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `i3` (`users_id`,`posts_id`),
  KEY `fk_likes_users1_idx` (`users_id`),
  KEY `fk_likes_messages1_idx` (`messages_id`),
  KEY `fk_likes_media1_idx` (`media_id`),
  KEY `fk_likes_posts1_idx` (`posts_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_likes_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_messages1` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `fk_likes_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_likes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (81,28,67,63),(92,38,5,13),(67,59,46,83),(38,66,86,69),(50,69,80,51),(82,11,19,28),(62,56,39,60),(66,90,66,47),(18,33,9,9),(70,14,21,36),(73,66,19,10),(32,4,78,81),(72,58,32,54),(69,50,82,30),(6,20,89,72),(9,55,18,26),(87,27,35,56),(40,55,91,13),(21,10,22,52),(13,100,33,85),(57,64,39,26),(14,20,56,19),(40,44,90,48),(98,8,74,85),(34,8,40,73),(63,31,86,83),(40,7,35,53),(6,67,38,63),(31,76,88,44),(96,43,63,35),(87,52,83,85),(59,57,69,93),(65,9,66,27),(39,51,10,79),(57,44,31,63),(11,69,26,41),(44,14,84,40),(57,46,74,44),(98,57,28,57),(13,97,49,77),(5,15,4,44),(65,13,23,22),(57,54,84,67),(22,10,7,66),(23,91,5,80),(37,79,23,34),(35,50,91,48),(47,40,24,52),(54,28,96,18),(40,18,39,96),(71,23,62,93),(32,69,58,55),(59,63,34,95),(41,56,29,76),(6,19,23,52),(59,47,4,12),(74,99,29,14),(16,68,9,87),(91,71,79,23),(40,37,77,98),(99,11,93,39),(67,21,15,73),(85,28,9,58),(26,38,72,42),(5,81,28,96),(52,7,18,91),(43,95,88,41),(1,95,44,40),(32,68,37,16),(96,46,74,21),(83,45,63,88),(26,91,83,77),(97,100,67,39),(94,55,80,99),(35,60,71,36),(54,14,75,86),(82,12,1,77),(57,75,98,39),(20,60,27,45),(50,9,22,46),(9,88,85,2),(43,65,1,78),(25,71,13,78),(85,88,63,66),(99,64,43,56),(39,40,95,58),(100,21,3,49),(29,24,95,37),(12,80,39,54),(44,40,32,69),(10,44,46,95),(32,9,61,30),(73,3,85,11),(43,80,69,42),(100,72,90,28),(96,85,65,7),(64,3,61,8),(42,92,76,52);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL,
  `media_types_id` int unsigned NOT NULL,
  `file` varchar(245) DEFAULT NULL COMMENT '/files/folder/img.png',
  `blob` blob,
  `size` bigint DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_types1_idx` (`media_types_id`),
  KEY `fk_media_users1_idx` (`users_id`),
  CONSTRAINT `fk_media_media_types1` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,4,3,'n3',NULL,989248,NULL,'2019-07-14 13:43:25','2007-11-13 22:23:21'),(2,59,2,'wqd',NULL,58127,NULL,'2003-10-05 06:52:35','0000-00-00 00:00:00'),(3,7,3,'dvb',NULL,58988370,NULL,'2002-03-31 16:32:44','0000-00-00 00:00:00'),(4,96,1,'js',NULL,33206648,NULL,'1994-07-20 19:10:35','0000-00-00 00:00:00'),(5,95,2,'musicxml',NULL,520,NULL,'2014-06-07 19:14:30','1987-10-30 10:06:54'),(6,86,2,'twd',NULL,3246,NULL,'2013-09-28 15:51:56','1998-06-14 04:32:43'),(7,64,1,'xsm',NULL,490598,NULL,'1986-01-17 11:04:08','1980-06-26 19:00:07'),(8,14,2,'xar',NULL,984582760,NULL,'1973-03-06 04:35:09','0000-00-00 00:00:00'),(9,52,3,'application',NULL,474668398,NULL,'2002-12-18 05:53:03','0000-00-00 00:00:00'),(10,93,1,'odft',NULL,0,NULL,'1998-04-29 20:14:17','0000-00-00 00:00:00'),(11,16,2,'yin',NULL,96934308,NULL,'1975-03-30 13:17:51','0000-00-00 00:00:00'),(12,89,2,'mmf',NULL,62933,NULL,'1973-11-07 05:53:12','0000-00-00 00:00:00'),(13,51,2,'7z',NULL,8262840,NULL,'1985-06-20 18:07:33','0000-00-00 00:00:00'),(14,78,2,'oti',NULL,8,NULL,'1970-05-22 18:52:58','2000-06-05 06:08:12'),(15,30,3,'mods',NULL,492,NULL,'1989-05-16 11:43:04','2010-01-14 11:20:38'),(16,79,2,'avi',NULL,43,NULL,'2017-10-25 17:47:51','0000-00-00 00:00:00'),(17,69,2,'rip',NULL,0,NULL,'1994-03-12 19:47:19','0000-00-00 00:00:00'),(18,77,3,'ott',NULL,257537,NULL,'1994-04-11 08:19:40','1990-04-09 03:23:28'),(19,5,3,'itp',NULL,89,NULL,'2011-01-05 16:54:55','1975-06-16 14:14:24'),(20,100,3,'xenc',NULL,901,NULL,'2019-08-06 21:59:09','1999-05-24 02:05:03'),(21,7,3,'mp4a',NULL,0,NULL,'2000-01-28 00:17:05','0000-00-00 00:00:00'),(22,53,3,'adp',NULL,388404,NULL,'2019-08-03 15:47:06','0000-00-00 00:00:00'),(23,6,2,'application',NULL,9207,NULL,'2007-03-01 17:22:02','1985-12-09 12:38:09'),(24,28,2,'src',NULL,1150,NULL,'1991-03-10 22:02:39','1981-01-04 08:38:55'),(25,45,1,'icc',NULL,87,NULL,'1981-10-26 23:35:43','2013-07-04 05:16:57'),(26,71,2,'dae',NULL,9,NULL,'2019-03-12 06:09:57','1993-09-10 03:04:09'),(27,85,2,'pfa',NULL,0,NULL,'1984-07-22 12:45:57','1972-07-06 16:01:37'),(28,22,2,'eml',NULL,394,NULL,'1992-02-16 20:30:59','1986-07-13 02:14:29'),(29,1,3,'iges',NULL,0,NULL,'1973-07-06 12:51:24','0000-00-00 00:00:00'),(30,82,1,'svd',NULL,86955108,NULL,'1989-09-09 03:47:57','1976-09-24 08:55:25'),(31,81,2,'tra',NULL,7006584,NULL,'1983-04-12 11:19:09','2011-03-03 06:58:39'),(32,64,2,'gtar',NULL,352778558,NULL,'1973-04-02 09:31:07','0000-00-00 00:00:00'),(33,98,2,'clp',NULL,52,NULL,'1995-12-01 15:21:49','0000-00-00 00:00:00'),(34,23,1,'oga',NULL,6784115,NULL,'1981-05-23 14:09:16','0000-00-00 00:00:00'),(35,13,1,'pptm',NULL,83544368,NULL,'2016-03-31 20:11:17','0000-00-00 00:00:00'),(36,2,1,'fdf',NULL,499597,NULL,'1999-03-11 08:17:05','0000-00-00 00:00:00'),(37,7,2,'fvt',NULL,322835721,NULL,'2012-08-20 23:49:22','0000-00-00 00:00:00'),(38,89,1,'iso',NULL,408917993,NULL,'1982-07-31 02:41:04','0000-00-00 00:00:00'),(39,20,1,'xvml',NULL,10,NULL,'1971-11-14 04:20:24','2008-06-25 04:27:19'),(40,70,2,'ppsm',NULL,2853,NULL,'2014-05-27 05:24:18','2011-02-27 16:22:15'),(41,38,2,'t3',NULL,33004591,NULL,'2018-04-13 03:45:53','0000-00-00 00:00:00'),(42,24,1,'mathml',NULL,0,NULL,'1984-12-06 01:11:00','1996-05-05 18:03:49'),(43,99,2,'movie',NULL,8579,NULL,'2011-06-30 12:41:29','0000-00-00 00:00:00'),(44,58,3,'der',NULL,46,NULL,'2012-02-02 09:47:35','1994-09-12 18:07:45'),(45,44,2,'uvvf',NULL,6,NULL,'2013-11-11 01:16:10','2019-09-15 03:34:06'),(46,29,1,'class',NULL,326,NULL,'1992-06-18 21:15:28','0000-00-00 00:00:00'),(47,100,3,'xul',NULL,4493,NULL,'1984-08-26 08:35:32','1991-11-20 10:19:26'),(48,72,3,'xop',NULL,81801864,NULL,'2013-01-03 23:06:21','0000-00-00 00:00:00'),(49,33,3,'scurl',NULL,4,NULL,'1994-03-30 02:32:47','0000-00-00 00:00:00'),(50,99,2,'spl',NULL,550401401,NULL,'2007-09-22 23:08:37','0000-00-00 00:00:00'),(51,17,1,'csh',NULL,0,NULL,'1986-03-13 12:01:02','1980-10-10 05:55:32'),(52,64,1,'mj2',NULL,906,NULL,'2019-09-17 10:13:27','1977-08-08 18:10:57'),(53,54,2,'g3',NULL,16909,NULL,'1981-07-24 02:07:07','0000-00-00 00:00:00'),(54,36,3,'ief',NULL,57935967,NULL,'2016-08-23 23:27:07','0000-00-00 00:00:00'),(55,70,1,'pgn',NULL,496518677,NULL,'2017-05-16 09:54:20','1986-04-16 15:28:20'),(56,37,1,'src',NULL,626,NULL,'1988-08-25 21:39:37','0000-00-00 00:00:00'),(57,44,2,'jar',NULL,0,NULL,'2015-07-15 04:37:57','2007-07-01 00:21:07'),(58,30,2,'obj',NULL,3180838,NULL,'1990-11-25 03:35:15','1997-07-17 05:49:42'),(59,5,3,'ksp',NULL,83259,NULL,'1999-07-11 03:09:13','0000-00-00 00:00:00'),(60,41,2,'123',NULL,862813792,NULL,'2016-09-15 07:42:49','1971-02-22 12:25:27'),(61,27,3,'jsonml',NULL,184339223,NULL,'1980-01-16 00:55:09','0000-00-00 00:00:00'),(62,72,1,'obd',NULL,43,NULL,'1970-03-06 21:43:43','0000-00-00 00:00:00'),(63,62,2,'ai',NULL,410,NULL,'2001-08-02 21:03:41','0000-00-00 00:00:00'),(64,22,3,'dae',NULL,79155442,NULL,'1992-11-18 17:02:45','0000-00-00 00:00:00'),(65,39,1,'mobi',NULL,82250,NULL,'2016-06-23 22:19:43','2020-04-25 11:36:29'),(66,40,2,'odm',NULL,9908964,NULL,'1979-05-27 17:14:53','2001-05-17 09:19:42'),(67,21,1,'htke',NULL,707,NULL,'1995-09-06 00:05:50','0000-00-00 00:00:00'),(68,79,3,'sfd-hdstx',NULL,7,NULL,'2008-08-30 02:09:54','1972-03-07 18:12:09'),(69,56,1,'dcurl',NULL,435,NULL,'2000-07-01 13:06:15','2013-12-03 09:43:24'),(70,47,1,'xpi',NULL,2,NULL,'1984-02-17 23:36:40','0000-00-00 00:00:00'),(71,19,3,'shar',NULL,7366,NULL,'1997-08-10 05:30:51','1997-10-16 01:34:28'),(72,32,2,'semd',NULL,110591,NULL,'2006-07-19 14:55:30','1995-10-10 15:06:39'),(73,43,2,'eot',NULL,2948,NULL,'1977-08-13 20:14:39','1985-10-23 02:42:50'),(74,5,2,'chat',NULL,0,NULL,'1972-05-01 02:12:56','0000-00-00 00:00:00'),(75,49,2,'gca',NULL,52890733,NULL,'1971-07-15 17:31:27','1995-06-13 02:23:57'),(76,95,3,'emma',NULL,676,NULL,'2016-11-15 20:03:53','0000-00-00 00:00:00'),(77,15,3,'csh',NULL,0,NULL,'1991-01-07 14:24:32','0000-00-00 00:00:00'),(78,100,3,'avi',NULL,13146,NULL,'2002-07-03 16:25:49','0000-00-00 00:00:00'),(79,11,1,'st',NULL,831165,NULL,'2007-07-29 02:42:24','0000-00-00 00:00:00'),(80,71,2,'ief',NULL,9446,NULL,'1995-12-29 18:10:20','2000-12-28 03:20:42'),(81,43,1,'dxf',NULL,64,NULL,'2003-08-05 22:37:07','0000-00-00 00:00:00'),(82,5,2,'h263',NULL,4889,NULL,'1983-10-18 15:10:22','0000-00-00 00:00:00'),(83,13,3,'jpm',NULL,7,NULL,'1972-03-01 23:01:41','2011-03-10 13:57:41'),(84,37,3,'igs',NULL,655018831,NULL,'2004-02-10 02:20:24','1982-04-26 17:28:11'),(85,97,3,'rip',NULL,957517090,NULL,'1988-01-06 10:24:14','2007-09-19 23:15:00'),(86,93,1,'m4v',NULL,0,NULL,'1976-02-01 15:29:13','0000-00-00 00:00:00'),(87,66,1,'dcurl',NULL,545879,NULL,'1988-12-20 08:26:23','0000-00-00 00:00:00'),(88,77,1,'qam',NULL,34721515,NULL,'1976-03-07 17:04:08','1980-06-27 13:30:38'),(89,85,3,'dae',NULL,1607,NULL,'1990-12-22 16:19:37','0000-00-00 00:00:00'),(90,56,1,'spot',NULL,6045,NULL,'1990-07-15 14:54:35','0000-00-00 00:00:00'),(91,27,2,'svc',NULL,79447,NULL,'1972-02-23 09:26:34','2015-01-09 19:51:16'),(92,8,2,'123',NULL,0,NULL,'2020-02-15 14:51:50','0000-00-00 00:00:00'),(93,17,1,'oti',NULL,609021,NULL,'2001-04-25 15:31:30','1970-09-05 03:38:23'),(94,18,1,'cryptonote',NULL,511559431,NULL,'2003-07-20 05:29:31','1994-01-30 16:51:03'),(95,29,3,'lasxml',NULL,6,NULL,'1996-08-12 21:00:40','1990-06-23 06:32:14'),(96,77,3,'xspf',NULL,789,NULL,'1980-11-06 06:27:42','1972-07-27 12:06:19'),(97,98,3,'arc',NULL,9103,NULL,'2019-10-23 18:49:42','1970-07-13 06:55:14'),(98,34,1,'wmd',NULL,6832725,NULL,'2000-04-09 08:43:43','2010-11-28 16:03:06'),(99,64,3,'mathml',NULL,0,NULL,'1996-12-11 20:18:15','1982-03-17 03:51:47'),(100,78,2,'rss',NULL,551991408,NULL,'1983-07-04 18:08:50','2019-12-28 09:33:22');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'audio'),(2,'img'),(3,'video');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_users_id` int unsigned NOT NULL,
  `to_users_id` int unsigned NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`from_users_id`),
  KEY `fk_messages_users2_idx` (`to_users_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`from_users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users2` FOREIGN KEY (`to_users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,85,42,'Eos commodi quos suscipit officia.','1993-12-03 09:58:23'),(2,87,82,'Doloremque enim repellendus in debitis est sint iure.','1989-11-27 11:34:47'),(3,90,6,'Accusamus qui minima porro minima quia adipisci.','1975-08-03 10:35:42'),(4,69,74,'Rerum voluptas qui totam modi.','2018-05-11 21:34:09'),(5,77,19,'Aut unde perspiciatis nesciunt quidem.','2000-09-15 13:46:09'),(6,1,52,'A sapiente accusantium voluptas quos.','2003-09-03 03:10:47'),(7,57,65,'Est non velit officia error et commodi quaerat.','2014-12-27 05:16:45'),(8,88,46,'Delectus suscipit maxime nesciunt excepturi corporis.','1975-05-20 17:29:19'),(9,83,60,'Facilis et cum odit eum iste.','1998-10-25 13:16:26'),(10,38,27,'Qui sequi reprehenderit debitis pariatur eos.','1985-01-17 13:47:04'),(11,62,87,'Eaque omnis a odit dolores dolores facere non.','1991-12-11 04:04:13'),(12,53,28,'Est consequatur aliquid quibusdam tempora alias ut.','1999-03-23 17:40:47'),(13,71,93,'Itaque et ipsum qui voluptatibus sit illum.','1996-02-09 01:47:46'),(14,8,73,'Rerum in dolores doloremque voluptate accusamus itaque molestias.','2011-12-26 08:37:19'),(15,30,94,'Possimus impedit doloremque ea aut sed ipsa.','1992-12-27 06:19:58'),(16,40,14,'Saepe sed recusandae facilis.','2017-06-26 02:18:00'),(17,35,27,'Eius dicta quia est eligendi incidunt.','1983-08-28 17:42:51'),(18,96,25,'Velit qui sequi molestias aut.','2008-09-10 00:24:51'),(19,32,65,'Et et deserunt possimus necessitatibus reiciendis non.','1973-12-06 14:12:49'),(20,99,9,'Doloribus distinctio nulla qui qui.','1987-01-20 09:20:43'),(21,83,100,'Sit modi dolores molestiae iste voluptatem.','1979-02-18 06:37:12'),(22,60,39,'Nemo architecto dolorum libero et aperiam.','1998-12-24 15:09:49'),(23,65,48,'Voluptatem a recusandae voluptate occaecati fuga ut cumque inventore.','1975-12-06 06:30:48'),(24,85,47,'Amet ipsam aspernatur cupiditate vero.','2010-12-07 19:22:42'),(25,7,23,'Ducimus perferendis itaque sapiente.','2011-05-29 17:48:17'),(26,73,69,'Impedit soluta occaecati deserunt maiores natus rerum dolor sit.','2008-09-18 16:41:16'),(27,9,26,'Nihil aut corrupti eos sequi rerum fuga.','1987-05-08 23:16:48'),(28,97,79,'Maiores delectus sit ea aut debitis dolore est soluta.','2005-10-10 00:24:19'),(29,18,4,'Voluptates voluptas vel molestiae id odio.','1996-12-09 21:26:16'),(30,52,48,'Est et modi dolore ut voluptatem adipisci vel.','1992-03-04 13:28:36'),(31,98,91,'Velit rerum dolorem voluptatem explicabo dolor.','2005-07-08 12:39:24'),(32,62,33,'Maiores fugit labore eius aliquid.','1973-09-04 20:16:51'),(33,17,57,'Fugit maxime porro asperiores tenetur.','1976-09-21 03:30:42'),(34,58,49,'Facere ea praesentium officiis in natus.','2019-06-30 21:15:37'),(35,22,56,'Occaecati enim ut libero necessitatibus.','1989-11-06 02:44:51'),(36,58,4,'Natus hic aliquam cum ipsam qui sit eos.','1984-11-04 05:18:06'),(37,55,18,'Quae sit voluptatem eum debitis ut.','2008-12-22 12:32:37'),(38,43,19,'Eligendi eos dolorum cum eligendi qui.','1994-07-08 17:17:40'),(39,65,28,'Inventore aut sint aspernatur atque maiores ea.','2001-10-25 01:18:06'),(40,66,72,'Et quo ut omnis in natus et possimus numquam.','1997-04-14 21:37:56'),(41,50,38,'Atque et quisquam quidem et nihil quas et.','1983-12-01 03:31:52'),(42,41,58,'Et nemo voluptatum sunt molestiae molestiae alias.','1993-05-10 18:26:24'),(43,64,37,'Quae soluta aut et.','2002-04-15 08:42:31'),(44,36,82,'Qui consequatur pariatur saepe expedita.','2007-08-14 02:50:46'),(45,41,88,'Alias ea et nihil rem dolor fuga exercitationem.','1999-05-28 21:29:16'),(46,29,38,'Quis eaque dolor non incidunt.','2018-08-12 06:12:44'),(47,79,90,'Neque corrupti autem distinctio.','1993-07-19 17:52:01'),(48,70,96,'Vel possimus repellat fuga perspiciatis occaecati.','2019-03-19 13:58:29'),(49,47,28,'Error assumenda qui cumque exercitationem.','1973-10-13 00:03:22'),(50,44,68,'Omnis aliquid rerum aut quae neque illum.','1998-08-09 03:29:08'),(51,83,2,'Nisi dolores fuga consectetur est.','2013-02-27 01:17:41'),(52,71,38,'Nisi provident quia explicabo dicta consectetur mollitia quo.','1979-03-12 21:42:05'),(53,20,14,'Eos qui earum modi dolor.','1988-06-15 11:04:56'),(54,57,85,'Quidem tempora quidem sapiente deserunt sunt.','2006-12-03 00:22:20'),(55,41,22,'Ullam maxime architecto voluptates aut consequatur a.','1994-08-26 01:16:30'),(56,56,91,'Inventore qui recusandae praesentium sequi facere labore cum.','1978-10-21 09:08:30'),(57,60,97,'Earum aliquam aliquam dicta voluptatem.','1998-09-02 18:28:38'),(58,48,23,'Totam sed similique porro distinctio ut voluptatem minima.','2019-01-24 09:01:45'),(59,33,84,'Necessitatibus nihil sapiente voluptatem mollitia sed mollitia.','1979-08-30 13:01:40'),(60,5,74,'Rerum distinctio iusto architecto consectetur et quia minus molestiae.','1986-10-19 03:09:40'),(61,71,33,'Explicabo aperiam expedita veritatis velit.','1975-01-08 22:12:06'),(62,11,49,'Blanditiis voluptatem culpa debitis aut molestiae porro.','2010-01-23 02:31:35'),(63,23,81,'Repellendus saepe et a quae mollitia maiores vitae sit.','1991-09-23 22:49:42'),(64,44,69,'Quam ut molestiae odit quae eveniet et.','1990-04-23 00:12:26'),(65,8,88,'Enim ea omnis eos veniam.','2005-11-25 15:28:34'),(66,36,91,'Neque odit nemo eum repudiandae sit vel doloremque quasi.','1976-02-22 03:17:25'),(67,90,7,'Ab rem cumque mollitia sit et cumque dignissimos debitis.','1998-01-14 09:52:01'),(68,28,9,'Molestias similique et rerum et hic quasi ea.','1994-03-01 07:17:11'),(69,21,85,'Aut enim quibusdam autem error nisi.','1980-11-03 09:50:04'),(70,93,62,'Velit exercitationem dolor id magnam.','2003-03-01 05:16:28'),(71,6,49,'Sed voluptatum dicta enim necessitatibus.','1981-09-01 17:35:10'),(72,52,66,'Repellat sint et harum id earum.','1988-01-10 10:07:56'),(73,45,99,'Ducimus qui totam maiores reprehenderit veritatis.','1995-05-04 20:16:54'),(74,89,78,'Sapiente veritatis ad pariatur ut.','2007-07-03 14:25:06'),(75,83,93,'Harum et iste alias qui nemo et.','1975-12-08 00:16:05'),(76,51,53,'Doloremque sit facere quis eum illo quam.','1996-03-01 07:59:59'),(77,25,61,'Praesentium qui sequi ut ut quia odio sint.','1974-06-24 11:01:02'),(78,2,47,'Neque dicta ea quis natus.','2014-04-20 01:49:11'),(79,42,45,'Odio deleniti recusandae blanditiis architecto deserunt voluptas laudantium.','1991-07-01 13:47:43'),(80,16,50,'Optio dolorem explicabo dolor qui illo enim dolores.','2005-03-22 09:55:01'),(81,33,51,'Occaecati ipsa magni rerum consequatur quo quo.','2005-03-24 06:47:37'),(82,40,22,'Est ipsa cum iusto nam.','2009-02-20 04:56:57'),(83,58,68,'Reprehenderit dolor enim nihil unde voluptatem ullam ab.','2006-07-11 11:04:51'),(84,30,78,'Dolorem dolores dolorem officia voluptas quis.','2018-12-11 18:20:49'),(85,52,22,'Et aspernatur est maxime et.','2019-08-19 07:15:11'),(86,39,58,'Nisi veritatis ab maxime aut.','1971-09-15 16:29:14'),(87,71,90,'Eos temporibus accusantium amet ut.','2020-08-15 11:28:14'),(88,23,15,'Deserunt deleniti quia facilis laboriosam.','2010-02-14 01:54:04'),(89,89,12,'Numquam rerum voluptatibus vero omnis deleniti reprehenderit consequuntur possimus.','1975-11-02 20:31:47'),(90,92,71,'Omnis molestiae accusantium sed nostrum eligendi quos.','1993-05-12 07:41:28'),(91,4,42,'Illum aperiam voluptatem voluptas accusantium dolor dolore et.','1986-07-15 04:32:06'),(92,24,29,'Itaque nisi animi commodi quia.','2018-01-20 15:04:51'),(93,3,25,'Dolorum quia id possimus enim modi consequuntur facere.','2005-09-30 09:41:50'),(94,76,45,'Et ratione sit consequatur veritatis tempore asperiores quis.','2000-01-19 23:00:15'),(95,70,91,'Quas et sint provident amet nulla recusandae.','1982-12-06 12:48:56'),(96,94,3,'Enim modi perspiciatis dolor facilis autem vero hic.','2003-06-11 22:00:51'),(97,42,34,'Qui optio minus cumque rerum velit veniam dicta.','2007-02-09 03:35:57'),(98,24,99,'Officiis voluptas ut ea doloribus quo quae molestiae sit.','2002-07-07 03:59:16'),(99,1,54,'Fugiat eos non porro enim perspiciatis ea.','1978-04-10 15:40:52'),(100,77,53,'Et et ullam minus est sequi officia et.','2010-02-16 05:45:09');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL,
  `communities_id` int unsigned DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `text` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_users1_idx` (`users_id`),
  KEY `fk_posts_communities1_idx` (`communities_id`),
  KEY `fk_posts_media1_idx` (`media_id`),
  CONSTRAINT `fk_posts_communities1` FOREIGN KEY (`communities_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_posts_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_posts_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,82,10,6,'Non vel omnis veniam voluptatibus rerum et ipsum.','1977-03-04 14:31:52','0000-00-00 00:00:00'),(2,46,8,67,'Doloremque sunt sit sit quae et.','2007-11-08 09:03:00','2006-11-30 01:55:37'),(3,8,10,47,'Ut sit dolor placeat quis odit.','2008-05-22 00:14:23','0000-00-00 00:00:00'),(4,86,9,60,'Et quo ullam quo.','1983-07-28 14:01:58','0000-00-00 00:00:00'),(5,53,3,65,'Voluptatibus sed illo iure est dignissimos.','1980-01-15 04:46:38','0000-00-00 00:00:00'),(6,79,9,8,'Sint corporis quo illum exercitationem ex.','1989-01-17 22:41:38','1980-05-04 08:26:30'),(7,18,10,17,'Et commodi cupiditate voluptatibus neque.','2002-07-11 19:27:48','1986-07-29 17:31:34'),(8,16,7,4,'Ducimus mollitia tempore quam ab.','2003-11-11 05:55:14','0000-00-00 00:00:00'),(9,38,2,98,'Molestiae facilis reiciendis quis.','1996-12-11 14:31:40','0000-00-00 00:00:00'),(10,79,5,13,'Ut inventore velit aut reiciendis aliquam repellat deleniti.','2011-01-14 12:32:32','1985-08-16 05:12:24'),(11,72,3,4,'Sit et nostrum consectetur excepturi et.','2015-03-08 20:55:21','2002-12-20 00:45:01'),(12,77,8,81,'Non sint repellat aspernatur mollitia.','1987-03-31 14:58:38','1972-04-10 07:09:53'),(13,44,8,73,'Possimus saepe corporis illum architecto maxime itaque tempore.','1971-04-09 17:25:21','0000-00-00 00:00:00'),(14,90,7,59,'Magni officia repellendus ad quo modi beatae et.','1973-06-02 06:51:22','1994-05-20 04:37:49'),(15,49,2,85,'Dolores et architecto laborum.','2007-11-30 12:47:05','1976-03-12 17:46:06'),(16,14,10,69,'Voluptas autem harum officia adipisci.','1985-07-12 23:03:50','0000-00-00 00:00:00'),(17,21,2,60,'Voluptates reiciendis cupiditate vel ut repellat quod quae.','2004-05-09 11:49:14','0000-00-00 00:00:00'),(18,38,3,26,'Est itaque ut quisquam ut.','1994-04-23 08:38:40','0000-00-00 00:00:00'),(19,41,7,41,'Est qui explicabo dolores et odit rerum aut rerum.','2017-11-24 09:47:23','2016-07-13 07:00:03'),(20,39,5,84,'Ut quia non sunt qui excepturi.','1974-04-29 06:53:48','0000-00-00 00:00:00'),(21,51,2,8,'Vel minus explicabo sunt rerum voluptatem amet molestias nisi.','2010-10-10 18:08:29','0000-00-00 00:00:00'),(22,54,10,79,'Repudiandae non ipsum aut nobis.','2018-11-26 06:40:12','0000-00-00 00:00:00'),(23,35,4,57,'Ullam voluptatum cum et placeat vel illo officiis.','2005-12-05 06:31:58','1972-12-11 22:10:59'),(24,7,3,21,'Atque ipsam molestiae quis velit est ut.','2005-01-26 22:42:37','1975-03-31 19:49:38'),(25,65,8,37,'Sit in quam et aut ipsam illum.','2007-03-21 16:11:40','1982-06-07 21:01:46'),(26,50,9,32,'Illum ut ut pariatur voluptates aut fuga molestiae voluptate.','1992-04-05 18:11:23','1975-12-24 06:56:30'),(27,18,1,44,'Odit expedita adipisci quae perferendis necessitatibus modi ex.','1992-11-08 14:30:17','1989-08-29 18:10:06'),(28,78,5,70,'Sequi velit sit fugit.','2001-09-18 22:27:42','0000-00-00 00:00:00'),(29,4,9,35,'Voluptas quia tempora odio consequuntur.','2006-07-17 06:40:41','2003-10-02 23:40:43'),(30,44,3,78,'Velit placeat velit aut enim sit aut id.','2001-05-24 09:30:19','1971-09-10 19:47:00'),(31,27,8,92,'Sunt aut delectus enim dolores.','2011-06-15 04:50:44','0000-00-00 00:00:00'),(32,35,3,84,'Nostrum labore assumenda unde modi provident culpa voluptatem.','1973-03-14 21:18:09','0000-00-00 00:00:00'),(33,14,7,19,'Dolores doloribus voluptatem aut sunt consectetur aut.','2000-02-18 01:07:47','2005-06-10 07:33:54'),(34,71,7,44,'Similique laboriosam fugit assumenda asperiores.','2004-08-21 13:44:00','2007-12-29 11:55:34'),(35,91,4,17,'Odit impedit voluptatem sint nemo et.','2005-06-29 06:30:26','0000-00-00 00:00:00'),(36,28,9,4,'Tenetur unde eaque eveniet autem molestias omnis ipsa autem.','1971-11-29 12:56:56','2007-04-20 14:24:28'),(37,59,1,12,'Qui ut consectetur delectus porro debitis quo aut.','1972-05-06 10:06:21','2013-04-14 07:20:14'),(38,2,8,58,'Pariatur quae magnam fugiat esse officiis unde molestiae.','1979-03-17 09:25:04','1986-03-13 02:07:14'),(39,72,9,44,'Enim accusantium unde veritatis.','1977-11-08 04:45:08','0000-00-00 00:00:00'),(40,6,3,69,'Optio ipsam nesciunt numquam et dolorum hic alias.','1996-05-22 04:23:19','2017-05-29 17:33:24'),(41,83,6,44,'Laboriosam nisi labore quisquam quo.','2010-02-16 23:29:19','0000-00-00 00:00:00'),(42,75,9,74,'Ad aperiam et minus corrupti minima.','1996-07-01 05:49:19','1985-05-31 13:33:49'),(43,59,1,37,'Omnis dolorem ad est ut impedit perspiciatis.','1996-05-08 11:41:58','1991-12-27 14:19:11'),(44,77,8,7,'Fuga laboriosam nihil facilis qui et aut.','2005-08-01 10:42:35','0000-00-00 00:00:00'),(45,21,7,41,'Exercitationem deleniti dolor voluptatem.','1982-11-19 11:36:33','2005-02-01 09:42:44'),(46,37,9,25,'Aperiam consequatur et nam aspernatur et ducimus repellat vero.','1978-08-19 15:58:42','1983-11-17 07:30:00'),(47,41,5,26,'Cupiditate veritatis et mollitia ipsa est id facere.','2003-12-14 12:06:44','0000-00-00 00:00:00'),(48,52,5,5,'Illo tempore sapiente sequi voluptates et.','2007-08-15 18:21:00','1997-11-17 02:31:43'),(49,9,3,87,'Velit nihil modi officiis et sit quaerat.','1973-02-04 04:14:33','1972-12-28 17:45:59'),(50,53,3,13,'Quia debitis accusantium aut eos minima sunt sed autem.','2005-05-21 05:36:20','1994-10-22 05:09:34'),(51,22,1,65,'Et occaecati eveniet vero voluptas quidem quisquam corporis et.','1992-09-26 03:57:41','1995-12-08 12:38:48'),(52,66,9,53,'Alias repudiandae dolorum maxime ut provident.','2018-10-07 08:18:21','0000-00-00 00:00:00'),(53,39,5,53,'Qui culpa nihil consequatur autem qui accusantium reiciendis.','1999-10-14 16:43:43','1990-08-13 07:50:29'),(54,75,2,24,'Dolore blanditiis porro natus magnam aliquid.','1985-05-02 18:20:51','1992-06-25 09:47:33'),(55,81,4,85,'Magni sit quis quis officia quod sequi.','2007-12-31 14:15:11','1998-03-13 15:56:45'),(56,22,8,74,'Recusandae a nesciunt architecto et sit quo veniam.','2010-02-03 11:25:42','1977-04-21 21:15:51'),(57,46,2,21,'Aut dolor sint commodi optio.','1998-11-01 02:33:40','1994-02-09 04:42:15'),(58,72,7,70,'Veritatis ipsum consectetur eveniet natus eaque inventore.','1972-05-15 18:12:45','0000-00-00 00:00:00'),(59,76,8,90,'Illo expedita mollitia quasi ad.','2005-01-17 16:23:31','1978-08-20 10:05:31'),(60,63,3,16,'Animi odio qui beatae delectus.','1997-01-28 11:28:33','1996-05-23 23:38:22'),(61,76,6,25,'Quis quia totam ut minus tenetur animi.','1977-09-07 10:20:25','1983-07-07 10:51:35'),(62,41,2,9,'Quaerat error porro accusamus nam animi.','1976-09-10 07:48:06','2019-01-25 02:56:06'),(63,93,6,50,'Voluptatem rem et quo provident vero praesentium.','1982-01-22 02:00:06','0000-00-00 00:00:00'),(64,45,3,69,'Voluptas est in quisquam.','1996-09-10 00:20:48','0000-00-00 00:00:00'),(65,69,2,9,'Illo rem enim ipsam neque.','1990-03-11 02:57:18','0000-00-00 00:00:00'),(66,53,4,85,'Eius in reiciendis et voluptate enim dolore.','1989-10-14 10:49:51','0000-00-00 00:00:00'),(67,27,8,1,'Natus aspernatur perferendis laborum molestiae.','2005-11-11 14:56:54','0000-00-00 00:00:00'),(68,47,5,69,'Qui ex voluptatibus quo odit quo optio et.','1980-05-10 17:58:37','1978-01-03 18:10:17'),(69,17,3,47,'Eum et ipsam et iste.','1988-11-02 03:19:06','2008-05-05 13:59:29'),(70,6,9,77,'Numquam neque tenetur ipsa repellendus sed ipsum.','2016-03-21 14:12:02','2003-04-06 06:01:39'),(71,22,7,28,'Aut provident et impedit sed maiores voluptates.','2001-10-10 18:39:17','0000-00-00 00:00:00'),(72,47,1,45,'Dicta voluptatem corporis libero impedit omnis.','1974-06-01 06:13:41','1986-11-19 09:07:04'),(73,55,10,100,'Illo dicta voluptas libero dolores animi numquam quam.','2010-07-26 01:34:23','0000-00-00 00:00:00'),(74,5,4,29,'Vitae consequatur assumenda libero nihil sed.','1977-12-31 07:31:03','1980-09-02 10:37:00'),(75,74,1,40,'Tenetur at nihil odit ut.','1990-03-20 03:38:19','0000-00-00 00:00:00'),(76,82,7,71,'Ut velit facere architecto rerum aut tempore.','1991-09-05 05:30:11','0000-00-00 00:00:00'),(77,66,9,48,'Non optio eos atque alias in inventore.','2010-03-01 07:39:08','1988-10-01 13:50:14'),(78,66,4,96,'Repellat est veritatis iure consequatur tenetur qui omnis enim.','2002-11-16 04:33:25','1977-01-21 12:43:19'),(79,35,5,20,'Illum illo ab sit ut fugit.','2014-09-17 15:05:04','1978-10-08 12:00:22'),(80,81,6,7,'Magni itaque distinctio fugit.','2015-04-27 23:26:03','0000-00-00 00:00:00'),(81,58,8,69,'Ullam nulla exercitationem cupiditate nisi eum tempora qui accusantium.','2009-03-14 03:47:11','1974-03-23 14:52:46'),(82,85,3,71,'Numquam omnis officiis repudiandae enim nemo quae.','2007-07-09 22:25:55','0000-00-00 00:00:00'),(83,30,8,65,'Maiores voluptatibus necessitatibus dolorem nostrum.','1986-03-25 02:37:40','0000-00-00 00:00:00'),(84,29,9,5,'Eveniet laudantium ipsam facilis quo et.','1989-09-06 23:38:26','2012-04-02 19:10:16'),(85,58,6,12,'Odio ad atque aut ullam quis.','1986-08-26 15:25:20','0000-00-00 00:00:00'),(86,97,4,72,'Ipsa sapiente aut ut ut rerum.','1997-02-04 09:42:35','0000-00-00 00:00:00'),(87,68,1,59,'Ut sunt illo distinctio nemo quod.','1982-12-31 01:51:02','0000-00-00 00:00:00'),(88,16,7,92,'Enim dolorum voluptate consequatur praesentium eligendi totam.','2020-09-05 15:53:02','1984-11-15 00:23:41'),(89,11,1,42,'Quo voluptatibus et consequatur.','1995-06-01 02:16:42','0000-00-00 00:00:00'),(90,31,9,97,'Nobis impedit ut nostrum ipsa aut eveniet numquam.','1991-08-07 13:40:44','0000-00-00 00:00:00'),(91,37,4,74,'Iure itaque repellat est sit in.','2017-12-15 09:14:09','0000-00-00 00:00:00'),(92,5,3,98,'Porro sunt velit nulla quidem ipsum non.','2014-09-03 12:41:54','2017-02-24 02:51:19'),(93,76,6,75,'Aut maiores ex eius ipsum eius autem deleniti.','1992-02-27 08:25:16','1977-06-28 23:51:31'),(94,40,9,57,'Et rem quod a hic.','1980-07-16 21:49:36','1973-04-01 20:54:34'),(95,45,4,12,'Deserunt nam consequuntur quia pariatur ducimus.','1990-09-09 18:06:54','2013-03-25 19:04:20'),(96,56,4,48,'Magnam nisi quis consequatur nesciunt magni ratione qui architecto.','1995-12-20 14:26:30','1987-09-10 05:28:08'),(97,28,1,49,'Iusto quos error illo repudiandae ea itaque distinctio.','1991-05-17 09:28:40','1991-10-26 22:48:27'),(98,86,2,16,'Est iste reiciendis omnis ducimus nulla dolore.','2018-03-12 17:53:50','0000-00-00 00:00:00'),(99,77,3,17,'Et quis quos aspernatur iste.','1995-10-25 23:41:54','2006-04-01 12:12:56'),(100,18,6,100,'Sequi tempore aliquid voluptatem molestiae recusandae consequatur.','1984-04-25 07:46:33','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `users_id` int unsigned NOT NULL,
  `gender` enum('f','m','x') NOT NULL,
  `birthday` date NOT NULL,
  `adress` varchar(245) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`),
  KEY `fk_profiles_users_idx` (`users_id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','2018-06-25','9377 Gusikowski Harbor\nEast Prestonfurt, WY 54111','1982-08-02 09:04:37'),(2,'f','1986-05-13','84313 Ashleigh Way Apt. 724\nPort Dena, MS 73252-9050','2012-09-24 17:06:03'),(3,'f','1970-03-17','67117 Schmitt Cove Apt. 831\nPort Osvaldo, ID 17501-3345','2002-01-24 03:59:49'),(4,'f','1993-09-09','8345 Klein Parkways Apt. 131\nLake Benedict, IA 67046','2003-08-16 04:25:29'),(5,'m','1996-03-07','35722 Jennie Meadow Apt. 141\nCaspermouth, SC 02967','2003-09-05 12:16:17'),(6,'f','2005-07-19','885 Braden Shoals Apt. 079\nNorth Joaquinland, NJ 76996-6129','2003-02-17 01:27:27'),(7,'m','1993-06-01','1815 Josianne Rapids Suite 764\nHeidenreichshire, VA 25564','1976-08-20 22:49:17'),(8,'f','1981-11-01','5725 Lubowitz Lights Apt. 500\nSeanbury, AL 15554','1970-11-29 21:21:40'),(9,'m','1974-11-03','35168 Reed Dale Apt. 523\nSouth Amayaview, NY 20814-0445','2001-02-02 08:58:06'),(10,'f','2011-04-16','460 Dare Terrace Suite 001\nWest Zackfort, WV 63799-5500','1982-08-29 01:08:28'),(11,'f','2012-02-02','1880 Viola Street Apt. 239\nReillyland, NY 95128','1970-01-12 03:13:01'),(12,'f','1994-01-16','261 Roy Shoal Suite 298\nMillerborough, UT 75986','2006-03-17 08:23:07'),(13,'f','1991-06-12','741 Marquardt Radial\nDariusland, CO 31603-9743','2000-07-12 02:54:21'),(14,'m','2018-10-26','276 Bertram Meadows\nWolffurt, HI 56357-9518','2001-01-11 23:25:58'),(15,'f','1983-05-04','9110 Stacey Walks\nNew Talon, PA 05504-5625','2010-11-08 13:46:35'),(16,'f','2000-03-05','689 Leffler Crescent\nHoppeville, OR 12023','1990-05-25 17:15:06'),(17,'m','1980-06-05','428 Morissette Walks\nWest Zula, TX 98753-3151','1992-12-28 15:01:03'),(18,'m','1989-01-22','52983 Ronny Coves\nGerholdhaven, WV 12171-6740','1974-03-05 05:14:08'),(19,'m','2008-12-27','90286 Mittie Harbor Suite 674\nKuhnland, MS 80625','1990-07-15 09:29:01'),(20,'m','1984-03-08','12385 Gunnar Course Apt. 200\nPansyfurt, KS 57740','2005-09-19 16:10:12'),(21,'f','1986-02-09','706 Wolf Mews\nPort Percivalville, FL 39690-9531','1989-04-25 23:48:15'),(22,'m','1994-04-05','92749 Borer Dam Suite 703\nNorth Eunice, FL 41795-6653','1989-02-06 06:35:47'),(23,'f','1977-09-15','12584 Casey Tunnel\nHodkiewiczfort, IN 97870','1971-11-18 11:09:15'),(24,'m','1984-04-10','3437 Dameon View\nNorth Josefa, IA 28103','1981-02-28 16:16:03'),(25,'m','2001-04-13','99983 Kirlin Neck\nWest Berryville, RI 69434','2009-12-03 04:26:08'),(26,'m','1984-12-09','03672 Reinger Divide Apt. 615\nIsobelside, KS 92900-5086','1994-03-29 10:22:17'),(27,'f','1994-05-16','2754 Coy Oval Apt. 161\nPort Elisafort, OK 91904-5320','2008-11-21 21:10:27'),(28,'f','1970-04-18','2180 Bulah Route Apt. 924\nBeahanland, DE 49418-3254','1990-10-27 08:42:28'),(29,'m','2006-04-12','9749 Nader Point Suite 555\nGleasonside, AZ 68104','2008-12-09 21:10:49'),(30,'f','1986-08-22','830 Jamarcus Expressway\nWindlerhaven, MO 80003','1989-11-03 15:29:38'),(31,'m','1996-03-09','19777 Johnson Drive Suite 996\nWaelchishire, OK 61833','1984-03-19 20:00:37'),(32,'m','1993-05-14','2604 Anderson Springs\nEdgarshire, MO 67099','1998-03-22 18:33:09'),(33,'f','1992-04-30','4204 Murphy Terrace\nOfeliatown, AR 83921','1982-04-29 11:02:42'),(34,'f','1998-03-18','17705 Xander Highway\nEast Ressie, VA 75777-5416','1988-11-08 18:59:00'),(35,'f','2019-02-18','664 Linda Cove Apt. 070\nEast Dedricfurt, WV 92125','2002-09-22 23:07:16'),(36,'m','2012-06-20','481 Klein Isle Apt. 361\nEast Zellafurt, AK 46309-1649','1982-06-08 02:42:49'),(37,'f','1978-03-18','4412 Ahmed Valleys Suite 562\nLake Marcelleburgh, OH 10990-8402','1982-01-20 17:24:59'),(38,'f','1978-08-12','84165 Ebert Street Apt. 023\nEast Jacintoport, MO 16018-3196','2011-08-28 01:00:42'),(39,'f','2006-09-21','9323 Kaitlin Garden Suite 682\nAbdulville, SC 43124','1973-10-01 19:59:05'),(40,'m','2009-03-06','98467 Nathanial Crest Suite 679\nNorth Laishachester, MI 19082','1984-02-13 21:53:29'),(41,'m','1993-10-23','3731 Schuster Viaduct Apt. 370\nEast Louie, NJ 71957','1977-02-17 00:16:56'),(42,'m','1989-02-14','2349 Reinger Camp\nEast Finn, MO 97968','2009-04-01 21:02:06'),(43,'m','1971-04-02','1508 Ondricka Via Apt. 691\nNew Leopoldton, SC 13303-1585','1971-11-17 06:01:04'),(44,'m','1991-10-26','848 Ledner Drive\nRodrickside, AK 59764-6462','1989-10-21 19:37:43'),(45,'f','1985-06-01','018 Angeline Lane\nPort Krystal, ME 50799','1997-01-18 05:26:03'),(46,'f','1999-05-29','34466 Mann Place Suite 026\nLucioville, ND 37401','2009-03-16 20:18:25'),(47,'f','1970-03-03','5124 Fahey Bypass Suite 816\nBradtkeview, VT 84231','1993-03-26 14:20:17'),(48,'f','1988-07-05','4966 Wilderman Shores Apt. 021\nWest Marty, NH 43155','1980-12-31 03:00:02'),(49,'f','1985-08-05','155 Konopelski Parkway Apt. 961\nPort Samchester, MS 92127-9483','1989-03-02 13:59:26'),(50,'f','1977-01-04','70185 Stephon Street Suite 187\nSallybury, ME 50792','1995-01-31 09:19:38'),(51,'f','1988-04-16','2684 Kiehn Cape\nPort Marquisbury, CO 55983','2018-02-23 21:23:34'),(52,'f','2015-03-07','77699 Shyann Land\nPort Gino, NC 77461-5146','2006-06-10 17:02:02'),(53,'m','1971-07-10','1462 Sanford Highway Suite 196\nMadisentown, DC 39931','2010-05-05 05:29:50'),(54,'m','1977-05-28','971 Jedediah Locks Apt. 643\nEast Trevor, MD 86684-0592','2002-12-02 08:12:41'),(55,'m','1984-01-26','7416 Hansen Ford\nLake Earnestburgh, MN 45881-3374','2002-09-07 22:28:48'),(56,'m','1997-11-20','855 Novella Glen\nNew Delaneyton, GA 92460-2822','1984-02-23 06:37:49'),(57,'f','2016-03-20','3092 Stacey Islands\nEast Jacktown, MO 67371','2009-04-09 01:23:34'),(58,'m','1976-10-11','0981 Price Street\nSouth Devan, AR 55568-4734','1996-01-27 03:49:01'),(59,'m','1992-08-11','1788 Abbott Rest Apt. 551\nEbertchester, LA 40069-4823','1995-12-06 11:22:17'),(60,'m','2008-09-28','517 Cummerata Lodge\nNew Ebony, NH 08026','1989-11-22 05:22:44'),(61,'f','2001-02-28','9033 Prince Hollow Suite 374\nPort Miaborough, WY 21541-0131','1977-12-30 02:03:36'),(62,'f','1984-08-28','9298 Weber Mountain Suite 781\nStefanland, AR 18898','1974-07-01 08:59:11'),(63,'m','2000-03-11','37163 Laron Stream\nRoweland, MT 48481-4955','1978-03-18 09:36:28'),(64,'m','1984-03-02','55903 Lessie Meadow\nZiemannport, OR 14384','2012-09-20 15:22:21'),(65,'m','1976-08-23','639 Laurine Shores\nVivianemouth, NY 23901','2014-06-01 07:03:44'),(66,'m','1985-04-16','6470 Ericka Bypass Apt. 241\nNorth Christop, AR 74447-0577','1981-12-10 06:33:08'),(67,'f','1988-03-15','0999 Lillian Stream\nNorth Clevefurt, MI 02926-4438','2004-04-21 08:07:10'),(68,'f','2010-10-28','83270 Marques River\nSouth Victorhaven, HI 99939-8374','1997-12-06 13:30:07'),(69,'m','1990-03-29','31619 Elinor Shore Apt. 412\nKautzerland, ME 74420','2005-01-24 02:18:49'),(70,'m','1978-03-03','468 Ed Points\nNorth Mireya, MT 69205-1693','1983-09-27 10:09:03'),(71,'m','1971-05-23','41278 Smith Parks\nWest Flossie, MD 77207','1999-09-25 15:20:38'),(72,'f','2018-05-13','22499 Altenwerth Cove Apt. 978\nNew Diego, ID 95957-9216','1970-09-07 01:19:37'),(73,'f','2003-05-13','95138 Zemlak Estate Apt. 573\nSouth Martinastad, CA 10035-4418','2017-12-15 14:14:50'),(74,'f','2007-12-15','11316 Nona Corners Suite 945\nSouth Favianberg, MI 65896','1979-05-01 06:38:56'),(75,'m','2003-06-25','595 Roma Prairie\nNew Lafayetteport, OK 20096-6096','1977-10-28 13:38:46'),(76,'f','2014-04-20','5051 Koss Knoll\nEast Rheaberg, KY 30059-3365','1978-06-10 20:00:20'),(77,'f','2011-01-08','7669 Jaycee Lakes\nSouth Kendra, HI 94756','1981-03-14 00:06:56'),(78,'f','2012-03-28','763 Sedrick Grove Suite 911\nChaddview, NJ 60090','1998-02-22 10:56:54'),(79,'m','1971-11-29','9881 Rippin Overpass\nMonroemouth, NC 91806','1971-09-14 15:30:10'),(80,'m','1982-08-04','731 Macey Plaza\nLake Trinity, IN 83341-0972','1981-10-11 19:25:05'),(81,'m','1995-10-31','38127 Ena Light Suite 723\nOsinskimouth, KY 72971','1979-04-16 06:28:12'),(82,'f','1983-12-05','417 Elmer Ridges\nJamesonhaven, WA 08562','2004-07-09 11:22:57'),(83,'f','1990-06-16','1144 Eugenia Expressway Suite 437\nWest Jeanne, RI 26958','2005-10-16 12:05:55'),(84,'m','1971-03-01','661 Reinger Isle\nKellifurt, CO 97029-3245','1973-04-01 05:54:13'),(85,'f','2017-09-12','315 Rebecca Extensions\nSouth Eino, MD 80819-1774','1986-08-10 00:32:16'),(86,'m','2009-06-22','4105 Pearl Village Apt. 856\nNorth Donnell, RI 85573','2014-12-08 10:03:23'),(87,'m','1978-03-18','50036 Gaylord Corner Apt. 492\nWest Mariane, MA 39406','1989-04-26 16:15:16'),(88,'m','1971-06-11','576 Weissnat Dale\nJoyshire, MT 38947-9700','1982-05-27 20:14:51'),(89,'m','2018-08-16','517 Bianka Drive\nCarrollland, MT 10505-7227','1996-02-25 01:19:59'),(90,'f','2017-10-09','70188 Leffler Tunnel Suite 979\nPort Flo, KS 87235','2008-11-07 06:44:40'),(91,'m','2015-11-29','639 Willis Expressway Suite 817\nNew Adahville, ID 07294-3028','2007-08-08 18:16:43'),(92,'f','2016-09-08','6508 Tara Ramp\nKeeblerland, CO 28795','1983-11-17 23:20:26'),(93,'m','1978-03-25','1215 Marks Stream Apt. 084\nRossburgh, HI 19482','2006-10-15 18:10:45'),(94,'f','2000-05-28','66788 Harber Hills\nSouth Reyview, CT 30362-9080','1972-10-07 22:11:57'),(95,'m','1983-09-25','6044 Bartell Drives\nHagenesstad, ME 79018','1977-03-15 09:58:31'),(96,'f','2007-07-18','120 Rhoda Estate Apt. 363\nCitlalliland, MT 23537','1988-04-12 02:14:17'),(97,'f','1992-06-30','86900 Muller Route Suite 202\nFeilshire, ND 61786','1978-08-10 19:09:24'),(98,'m','1997-01-27','536 Bauch Club Apt. 840\nSchadenberg, NM 26652','1983-01-20 09:39:42'),(99,'f','1970-12-27','91097 Jarred Extensions\nSouth Kenyattastad, SC 52066-9076','1991-07-01 13:43:33'),(100,'f','2018-09-25','48036 Rohan Mission Apt. 552\nWardchester, OK 33664-1301','2001-10-05 01:07:45');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(145) NOT NULL,
  `lastname` varchar(145) NOT NULL,
  `email` varchar(145) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `password_hash` char(65) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Presley','Crooks','oo\'conner@example.net',79270849534,'bf6c12ad765c64e46431e9a667f456417c9d814f'),(2,'Wilbert','Beer','kailee.brakus@example.net',79501730290,'210085ffce2b5236b6dedf30a9b8fbe1fe0d7748'),(3,'Petra','Spencer','wolf.rebecca@example.com',79353119097,'4a00b373fd2a9757f7744fabd1d177371f66ba06'),(4,'Johathan','Dach','bayer.myrtis@example.com',79138092126,'6b6421dde1cea0d6f66db09058c4a546954d2e28'),(5,'Cordie','Wuckert','kuhlman.coy@example.net',79094533653,'3c15108432e31f8fe9e3513c18689303cf6f2109'),(6,'Cleta','Schulist','walter.kattie@example.net',79226997477,'cb3a527a87b5f759afefac6507e198cb26b05b33'),(7,'Rita','Schinner','mpollich@example.net',79018818414,'75381fb9239fdc179da0e3dd5a42d589dfa6b5ea'),(8,'Alayna','Rohan','dora.mclaughlin@example.com',79645663226,'997cb1e4ce623c565b692ad8147d0ec58cbda5f8'),(9,'Austin','Crooks','bo\'keefe@example.com',79930428686,'d64d39409eaada7f9af32add9f59791de562eb1b'),(10,'Salvador','Gottlieb','muhammad78@example.net',79853736020,'45169a3245179eb08e48471e07682ab81424fa53'),(11,'Josie','Glover','robert97@example.com',79644408274,'cde9fb78df24f317c6cc5fe38582847064201c90'),(12,'Art','Schmitt','sipes.sunny@example.org',79264998282,'1b6e0d2d8eb74b64df54fc12c2ac5f9ba33f2645'),(13,'Gerard','Kshlerin','kerluke.odie@example.com',79348437166,'3b8a4430bb437312894aad67a8c1b2e770939c1f'),(14,'Fredy','Monahan','felicita73@example.com',79290752673,'321366f404926ac371f602c03a7b886f11ee0a4e'),(15,'Sincere','Grimes','vleffler@example.com',79497989760,'dfd5e80ccd28b7cc0a334d3235347052aaad04eb'),(16,'Richie','D\'Amore','tleannon@example.com',79553389487,'cea5306cb4d7f4af26d616a607e64cd7031ce2bc'),(17,'Mac','Steuber','kieran.grant@example.net',79098354960,'6fd748416e5f0ce2fd7d3e78e338e8a5ef9b8434'),(18,'Kendrick','Quitzon','ipfannerstill@example.net',79391356543,'2883cc58df26deb7ac9c1dc26a048d9fc85c74a8'),(19,'Tianna','Durgan','rbauch@example.org',79608706758,'619c2ae90b29a614259fba540620c50780ca7d2f'),(20,'Marianne','Schulist','gusikowski.leta@example.com',79289248838,'628667d553ec761e8069feae6181b592cff923d7'),(21,'Santos','Wuckert','goldner.marvin@example.org',79671912318,'06ecba3d5c902f5313082e79885aabc918a55a4d'),(22,'Dangelo','Kuphal','charity13@example.com',79807026275,'78cfa2e8c015223bf190d3192a0692525634a119'),(23,'Linnie','Kirlin','utoy@example.net',79802779913,'9be02891b8068f1fc8cf588737fedf7373ae0fd4'),(24,'Allie','Bins','smith.ahmed@example.net',79806115177,'f4a50aecb7b5ad845f65e1a433fd53eee559f6a5'),(25,'Gaston','Grimes','ajacobson@example.com',79024734363,'5eeaa83faed89d4efe13a85c5c6db7e805615d61'),(26,'Eloise','Gibson','dereck.bahringer@example.net',79902968927,'94e0cf8cfcf77a0a9619e306b1796a0d8928602a'),(27,'Ron','Hamill','zvonrueden@example.com',79557192888,'0567a176ff208d538844179bac1a34211ed3d656'),(28,'Arjun','Olson','glover.rebecca@example.net',79026307959,'37bd9c1f4a244deba8cf702821f3c1601654d001'),(29,'Jerome','Koss','kunde.watson@example.org',79995152160,'6a872f8d685067b9deecaad88610610679129c30'),(30,'Wilfrid','Senger','cruickshank.avis@example.com',79733221920,'7117ba7f69dd1350cc236e85fb50c4d72df1d8a3'),(31,'Lois','Pollich','pframi@example.org',79947610081,'30d74240848dce28e50ebf1a7abee4fd88581638'),(32,'Nicole','O\'Kon','travis.sauer@example.net',79452746618,'458d13e8d2d07afe6793f146449c53d66648a681'),(33,'Clovis','Langosh','alessandra.gutkowski@example.com',79005792927,'eceee13fe37da8083be4a14b587a2363f9b1f811'),(34,'Clementina','Barton','kstroman@example.org',79741201602,'e0b96def3d1fec5db3939586bd96020a667180cf'),(35,'Wilbert','Wilderman','fay.chasity@example.com',79941529700,'cc51e1f9beb2e17ac7c70c3dfa886b77625ad645'),(36,'Russ','Kuhn','rick.jacobson@example.net',79989050266,'94f2ce0bca98b2d77c1fbfba2075130fb87ce42c'),(37,'Delfina','Keebler','randy.kulas@example.net',79237110614,'05d59aeb4734f30ee573b9c09ecc46141049ef63'),(38,'Josephine','Rosenbaum','goodwin.myrl@example.org',79653594162,'18362995c2cb600ef2c48e117c060e0af675316c'),(39,'Keaton','Wisozk','donnelly.carley@example.org',79688355574,'1c58a2b7553e1cf6ecd3c36c9573bce6d01e729d'),(40,'Onie','Fadel','mueller.janice@example.com',79376795419,'bd4aad2c90c58bc375b1608d7dc141d3a21e7036'),(41,'Shea','Hegmann','edd.wintheiser@example.com',79318572483,'075a698b7919bf98462bbf6f62b7f31049dca5f0'),(42,'Oleta','Eichmann','demarco.flatley@example.org',79127740093,'8209f2d5f4b81ff79b34de98f84185512b74a82b'),(43,'Kade','Anderson','carol74@example.org',79081381758,'4a06e5083a1b6b785c57a4a068fb388e291e6307'),(44,'Anahi','Lueilwitz','zackery.johnston@example.com',79253926127,'e4ed9b886ce29b417e3635a4870125b5c5a7e998'),(45,'Trenton','Lesch','rdoyle@example.net',79638443829,'e1f077a2f4d71c146578697d22c52f188dc851ed'),(46,'Cole','Hoeger','steuber.samanta@example.org',79669789985,'b04aea95887bc5db2822d361ee5b1bb159bb64fe'),(47,'Amber','Nikolaus','irau@example.com',79781741972,'7ef583ebbc409371e2a63caa6ecbf5ad2012eeb4'),(48,'Angela','King','homenick.shana@example.org',79808868238,'e7a449a4a59157f6a2a2e25e511e4bc1511df3e8'),(49,'Richie','Douglas','sbashirian@example.org',79035560477,'0eb06d34b67d0b75ee74e2c25730aa9da5507172'),(50,'Gloria','Hegmann','msmitham@example.net',79540267767,'548aace9af925bc3c183ea9c40089b957ff3b177'),(51,'Jacinthe','Osinski','sauer.zelda@example.org',79410758336,'a1b2504bf100936f3e447ce26638cf19bce073db'),(52,'Brandt','Morar','shanie.crooks@example.com',79188415120,'4c9486c862877c22f15aa6803d6b34c1ab0b2539'),(53,'Armando','Ruecker','bessie.wisozk@example.com',79152356393,'6669912d4b038d3bb00e3cc0be66dfa475b5a3d9'),(54,'Preston','Moen','ucrist@example.com',79010396920,'d3cd70ba25d678f0f3c978579118786f7ffb1f51'),(55,'Aliza','Yundt','wisoky.kenny@example.net',79814950872,'24f909e6ecd56dea79a400c44291272dbeafb25c'),(56,'Elise','Kreiger','bartoletti.ottilie@example.org',79049244795,'fc9b160a34c508999061040052f6861bd9ca5a90'),(57,'Stan','Prosacco','etorp@example.com',79708410386,'db14d11db3c6931e54a270e3bcc978d94e65da54'),(58,'Dahlia','Bins','davis.weldon@example.org',79002495940,'0360ff675e446d9af918b4e0bee7298e800a97d1'),(59,'Furman','Grimes','lula18@example.net',79131600126,'cc1af4d979f4552abe8c8f3233624d442176e1c5'),(60,'Alexandra','Swaniawski','smurphy@example.com',79689524590,'0f0b7bdf0e7eb8a1d17f22df9cc13d72d8595df7'),(61,'Letitia','Schneider','laurie.steuber@example.net',79870745422,'6b2d5a55ee4b2823709a24402c6515a6040dc48c'),(62,'Kariane','Hansen','josie.little@example.org',79321430427,'bb116305c6a69964e0f19d2feb7f2292ffccf31f'),(63,'Bethel','Swaniawski','rashad.larkin@example.com',79889262245,'5cc0260264bd205cb846ba5160959f8b793143ba'),(64,'Brigitte','Rutherford','rfeest@example.net',79205863477,'599a9243f4556061aa15e7236e38bd706211cddd'),(65,'D\'angelo','McGlynn','jast.maurice@example.org',79032086134,'10c6ff73b9bffe2d97499d409d110097932c6e04'),(66,'Shane','Johnson','julia.berge@example.com',79603362067,'ce83974d77288a0f0d8f7e891b0546745952b176'),(67,'Jacky','Stokes','faustino.swaniawski@example.org',79872121816,'89d71e7086c29679639bcf2bd2ba7f27544407e9'),(68,'Melvin','Mertz','krajcik.maia@example.org',79885214004,'66637a053fc6af95af78ac9ef65e204b8d528a0d'),(69,'Nicolas','Klein','clemens.morar@example.net',79302133299,'f6563e33fac69345c1bf70a055eaaf6e87f64607'),(70,'Gina','Lubowitz','emmanuel.gibson@example.com',79384679848,'687690a1407c57488de19a86747607feb3412a84'),(71,'Antonietta','Monahan','kobe24@example.org',79428786844,'bb7387db02990e2d5f2e158a9993cd321e4c08c0'),(72,'Walton','Smith','arlo31@example.com',79894731391,'0e2fb0ab44373a0cba51ac6276df5d82e55f14c1'),(73,'Tania','Gottlieb','carroll.timothy@example.com',79652461096,'caaf696bcbcacebe32fb6ab2049e9461fcd42eda'),(74,'Talia','Langworth','qolson@example.org',79053046959,'b6e5950d969897280a1c486c1935e5ee2a760e0c'),(75,'Ramon','Sporer','dylan55@example.net',79663062841,'94b4acd31078f8306cf740665ac71e109edfe0d4'),(76,'Leonora','Mills','collier.alphonso@example.com',79541939986,'2a6aa293ff08f16d8058fd8a5e3cc50feb71a1aa'),(77,'Cecilia','Kuphal','jlarkin@example.org',79995201976,'be2d4e2c47613ca1d7cffe3c6783e045b9ff37d4'),(78,'Brendon','Lemke','bweber@example.org',79654605793,'352497031d60686ee678701d46f905e3a491a029'),(79,'Julien','Fritsch','blaze.gaylord@example.net',79518924863,'9dadff872ab28097726bd6a7a38c1f68654a8211'),(80,'Napoleon','Cronin','cabshire@example.com',79208280138,'c58bbcd59fa3ddcc4c078b6f1088db32037790d3'),(81,'Ofelia','McCullough','hchristiansen@example.net',79599040753,'522cab19d1c8bebbc9009ac9e51af3c0ab82f2c1'),(82,'Alexander','Bednar','fleffler@example.org',79233167784,'6a3406c44a6e947b5c6eaad9b1efc5a7e39d328a'),(83,'Hunter','Grant','bahringer.genoveva@example.net',79367192739,'22f536d5b3b0fa5d87cd782a66b8ad12030cb4ec'),(84,'Erwin','Hettinger','bobbie.pacocha@example.com',79606340034,'16462e94d3cb7000adc785abd5de68daf10cc277'),(85,'Rocio','Hayes','nelda20@example.net',79773721851,'8634e7bdb49c1b56f9eb2fa4d69fb19918117063'),(86,'Laury','Jones','howard.toy@example.com',79070859098,'75c86310bd83a3c7d2886479b5d6bd99b23d145d'),(87,'Audra','Sauer','ankunding.koby@example.com',79069155992,'621f2937289fc2e0b0c40e1ca25aed8f002fcbd2'),(88,'Brenda','Medhurst','dillon48@example.net',79246245418,'ebcb9eb3612457e0eb642ee4d0494b751e0958d6'),(89,'Anissa','Toy','sandra.rice@example.net',79507300190,'22f1ebb849da6ca26542ef3d70f354444be5749d'),(90,'Willis','Zulauf','pgerlach@example.net',79596438936,'bb9be807474dc12afbd950f20cd0221c2f6c1219'),(91,'Juanita','Pollich','johnston.trudie@example.com',79587562132,'51c639088353abad12c51bcc8efa45491b666953'),(92,'Treva','Dicki','gonzalo89@example.net',79227260202,'46351d015f18423a2bcf5d7b552c11530e359173'),(93,'Camylle','Kling','abby89@example.org',79811479686,'ac55b1c6fc2e4e9278d3277249d25b89c5fd48c7'),(94,'Devan','Marquardt','terry.london@example.org',79547636427,'009ef5fb9f023bb04f890a274c9b4fc2d69e80cc'),(95,'Bethany','Connelly','ruecker.ernie@example.com',79696096077,'2ff447913060bd560ce04e1133233538f878cb75'),(96,'Keara','Renner','jada81@example.net',79970701702,'2fdb1296e338601e0287940877204294d377f578'),(97,'Juwan','Champlin','cframi@example.net',79341592629,'a8188bda0e5b1a68f6dfa1340fb2b427daa9a6ff'),(98,'Estevan','Hamill','kyra.beatty@example.com',79164463036,'dfeabffce997d81f897ebca11ed1a9d63603320a'),(99,'Austin','Parisian','hagenes.viviane@example.net',79134394481,'e846d83c245b311c6de473be12a1ff844d19c61f'),(100,'Mckenna','Borer','stiedemann.katrina@example.com',79121273517,'d8f5faecedb4157e39b282f44c70198bd1fd1f00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `communities_id` int unsigned NOT NULL,
  `users_id` int unsigned NOT NULL,
  PRIMARY KEY (`communities_id`,`users_id`),
  KEY `fk_users_communities_communities1_idx` (`communities_id`),
  KEY `fk_users_communities_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_communities_communities1` FOREIGN KEY (`communities_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_users_communities_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,13),(1,19),(1,26),(1,69),(1,70),(1,92),(1,95),(1,97),(2,1),(2,19),(2,28),(2,32),(2,48),(2,51),(2,60),(2,62),(2,64),(2,68),(2,78),(2,79),(2,93),(2,95),(2,99),(3,18),(3,70),(3,83),(4,8),(4,18),(4,21),(4,22),(4,30),(4,36),(4,50),(4,58),(4,68),(4,84),(4,86),(4,89),(4,92),(4,98),(5,25),(5,45),(5,50),(5,71),(5,74),(5,85),(5,97),(5,100),(6,13),(6,18),(6,23),(6,31),(6,35),(6,48),(6,53),(6,63),(6,82),(7,6),(7,12),(7,30),(7,34),(7,44),(7,73),(7,86),(7,88),(7,94),(8,1),(8,12),(8,14),(8,19),(8,38),(8,46),(8,72),(8,86),(8,94),(9,4),(9,33),(9,35),(9,48),(9,57),(9,60),(9,67),(9,75),(9,83),(9,84),(10,16),(10,23),(10,31),(10,42),(10,58),(10,61),(10,70),(10,72),(10,95),(10,96),(10,97),(10,99);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-03 22:22:35
