-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: module
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `workspaceId` int DEFAULT NULL,
  `billId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `token` (`token`),
  KEY `api_tokens_ibfk_1` (`workspaceId`),
  KEY `bill_id_idx` (`billId`),
  CONSTRAINT `api_tokens_ibfk_1` FOREIGN KEY (`workspaceId`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bill_id` FOREIGN KEY (`billId`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
INSERT INTO `api_tokens` VALUES (12,'production','6727b880-e826-435a-baf4-9a70c03a174c','2024-02-07 14:41:05','2024-02-07 14:41:05',106,NULL),(13,'development','41b45b1a-41f0-4a6f-9269-03b18723ce64','2024-02-07 14:41:11','2024-02-07 14:41:11',106,NULL);
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_quota`
--

DROP TABLE IF EXISTS `billing_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_quota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `limit` decimal(10,2) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `workspaceId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workspaceId` (`workspaceId`),
  CONSTRAINT `billing_quota_ibfk_1` FOREIGN KEY (`workspaceId`) REFERENCES `workspaces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_quota`
--

LOCK TABLES `billing_quota` WRITE;
/*!40000 ALTER TABLE `billing_quota` DISABLE KEYS */;
INSERT INTO `billing_quota` VALUES (6,31.00,'2024-02-07 06:44:31','2024-02-07 06:44:31',NULL),(7,1212.00,'2024-02-07 14:25:43','2024-02-07 14:25:43',NULL),(9,1312.00,'2024-02-07 14:45:06','2024-02-07 14:45:06',106);
/*!40000 ALTER TABLE `billing_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `workspace_title` varchar(255) NOT NULL,
  `api_token_name` varchar(255) NOT NULL,
  `usage_duration_in_ms` int NOT NULL,
  `usage_started_at` datetime NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_cost_per_ms` decimal(10,6) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `workspaceId` int DEFAULT NULL,
  `api_token_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workspaceId` (`workspaceId`),
  KEY `api_token_id_idx` (`api_token_id`),
  CONSTRAINT `api_token_id` FOREIGN KEY (`api_token_id`) REFERENCES `api_tokens` (`id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`workspaceId`) REFERENCES `workspaces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'demo1','My App','production',38,'2024-07-01 06:31:48','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(2,'demo1','My App','production',36,'2024-07-01 19:43:17','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(3,'demo1','My App','production',38,'2024-07-02 06:36:12','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(4,'demo1','My App','production',36,'2024-07-02 19:54:02','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(5,'demo1','My App','production',38,'2024-07-03 02:34:24','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(6,'demo1','My App','production',39,'2024-07-03 13:21:00','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(7,'demo1','My App','production',39,'2024-07-03 18:52:59','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(8,'demo1','My App','production',36,'2024-07-04 08:54:21','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(9,'demo1','My App','production',39,'2024-07-04 12:25:28','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(10,'demo1','My App','production',38,'2024-07-05 03:47:05','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(11,'demo1','My App','production',37,'2024-07-05 04:45:33','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(12,'demo1','My App','production',37,'2024-07-05 17:18:46','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(13,'demo1','My App','production',36,'2024-07-05 19:07:11','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(14,'demo1','My App','production',37,'2024-07-06 04:03:32','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(15,'demo1','My App','production',38,'2024-07-06 15:00:55','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(16,'demo1','My App','production',38,'2024-07-06 18:46:37','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(17,'demo1','My App','production',38,'2024-07-07 08:13:47','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(18,'demo1','My App','production',39,'2024-07-07 21:31:04','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(19,'demo1','My App','production',38,'2024-07-08 04:53:46','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(20,'demo1','My App','production',36,'2024-07-08 13:25:26','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(21,'demo1','My App','production',38,'2024-07-08 14:12:54','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(22,'demo1','My App','production',36,'2024-07-08 20:40:36','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(23,'demo1','My App','production',36,'2024-07-08 21:33:45','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(24,'demo1','My App','production',35,'2024-07-08 22:15:18','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(25,'demo1','My App','production',38,'2024-07-09 06:57:03','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(26,'demo1','My App','production',37,'2024-07-09 16:32:25','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(27,'demo1','My App','production',39,'2024-07-10 07:25:13','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(28,'demo1','My App','production',37,'2024-07-10 15:01:00','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(29,'demo1','My App','production',35,'2024-07-11 02:41:27','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(30,'demo1','My App','production',37,'2024-07-11 12:09:11','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(31,'demo1','My App','production',38,'2024-07-11 20:00:39','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(32,'demo1','My App','production',38,'2024-07-12 00:40:13','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(33,'demo1','My App','production',39,'2024-07-12 10:27:25','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(34,'demo1','My App','production',39,'2024-07-12 23:38:15','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(35,'demo1','My App','production',39,'2024-07-13 00:45:52','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(36,'demo1','My App','production',38,'2024-07-13 06:23:03','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(37,'demo1','My App','production',39,'2024-07-13 21:33:35','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(38,'demo1','My App','production',35,'2024-07-14 09:21:23','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(39,'demo1','My App','production',36,'2024-07-14 18:42:34','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(40,'demo1','My App','production',37,'2024-07-14 23:08:06','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(41,'demo1','My App','production',5,'2024-07-15 00:29:00','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(42,'demo1','My App','production',21,'2024-06-30 18:46:04','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(43,'demo1','My App','production',20,'2024-07-01 13:02:15','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(44,'demo1','My App','production',20,'2024-07-01 19:53:57','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(45,'demo1','My App','production',23,'2024-07-01 23:26:37','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(46,'demo1','My App','production',22,'2024-07-02 11:41:25','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(47,'demo1','My App','production',22,'2024-07-02 21:16:59','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(48,'demo1','My App','production',22,'2024-07-03 14:12:08','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(49,'demo1','My App','production',21,'2024-07-03 15:02:06','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(50,'demo1','My App','production',22,'2024-07-03 20:21:34','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(51,'demo1','My App','production',24,'2024-07-04 03:54:53','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(52,'demo1','My App','production',20,'2024-07-04 10:28:14','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(53,'demo1','My App','production',24,'2024-07-04 10:40:11','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(54,'demo1','My App','production',21,'2024-07-04 16:33:10','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(55,'demo1','My App','production',23,'2024-07-05 02:47:03','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(56,'demo1','My App','production',22,'2024-07-05 04:25:03','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(57,'demo1','My App','production',22,'2024-07-05 16:35:58','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(58,'demo1','My App','production',20,'2024-07-06 01:22:29','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(59,'demo1','My App','production',22,'2024-07-06 11:23:32','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(60,'demo1','My App','production',23,'2024-07-06 22:41:43','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(61,'demo1','My App','production',21,'2024-07-07 17:28:06','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(62,'demo1','My App','production',22,'2024-07-08 03:57:25','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(63,'demo1','My App','production',24,'2024-07-08 07:39:33','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(64,'demo1','My App','production',21,'2024-07-08 11:15:40','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(65,'demo1','My App','production',21,'2024-07-09 07:56:12','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(66,'demo1','My App','production',22,'2024-07-09 22:57:01','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(67,'demo1','My App','production',24,'2024-07-09 23:07:02','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(68,'demo1','My App','production',24,'2024-07-10 15:50:49','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(69,'demo1','My App','production',23,'2024-07-11 10:35:38','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(70,'demo1','My App','production',20,'2024-07-11 12:16:30','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(71,'demo1','My App','production',22,'2024-07-11 15:37:35','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(72,'demo1','My App','production',22,'2024-07-12 00:47:41','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(73,'demo1','My App','production',24,'2024-07-12 15:10:36','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(74,'demo1','My App','production',1,'2024-07-12 22:07:44','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(75,'demo1','My App','development',10,'2024-07-01 08:49:36','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(76,'demo1','My App','development',12,'2024-07-02 00:20:00','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(77,'demo1','My App','development',12,'2024-07-02 15:20:36','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(78,'demo1','My App','development',10,'2024-07-02 16:34:48','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(79,'demo1','My App','development',11,'2024-07-02 18:42:10','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(80,'demo1','My App','development',10,'2024-07-03 00:08:20','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(81,'demo1','My App','development',11,'2024-07-03 08:12:21','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(82,'demo1','My App','development',10,'2024-07-03 14:07:24','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(83,'demo1','My App','development',9,'2024-07-03 14:31:09','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(84,'demo1','My App','development',10,'2024-07-04 06:06:29','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(85,'demo1','My App','development',9,'2024-07-04 16:17:28','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(86,'demo1','My App','development',10,'2024-07-04 17:46:47','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(87,'demo1','My App','development',12,'2024-07-04 19:11:00','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(88,'demo1','My App','development',12,'2024-07-05 07:41:06','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(89,'demo1','My App','development',12,'2024-07-05 23:20:54','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(90,'demo1','My App','development',11,'2024-07-06 02:08:26','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(91,'demo1','My App','development',12,'2024-07-06 19:28:25','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(92,'demo1','My App','development',10,'2024-07-07 04:58:39','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(93,'demo1','My App','development',8,'2024-07-07 07:05:19','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(94,'demo1','My App','development',8,'2024-07-07 21:32:52','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(95,'demo1','My App','development',12,'2024-07-08 06:58:52','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(96,'demo1','My App','development',8,'2024-07-08 08:10:00','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(97,'demo1','My App','development',10,'2024-07-08 22:24:20','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(98,'demo1','My App','development',11,'2024-07-09 08:00:18','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(99,'demo1','My App','development',10,'2024-07-10 01:03:09','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(100,'demo1','My App','development',12,'2024-07-10 14:02:58','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(101,'demo1','My App','development',9,'2024-07-11 01:40:12','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(102,'demo1','My App','development',11,'2024-07-11 02:54:20','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(103,'demo1','My App','development',9,'2024-07-11 05:04:47','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(104,'demo1','My App','development',10,'2024-07-11 08:31:53','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(105,'demo1','My App','development',10,'2024-07-11 16:49:51','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(106,'demo1','My App','development',11,'2024-07-12 02:08:02','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(107,'demo1','My App','development',9,'2024-07-12 14:50:56','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(108,'demo1','My App','development',8,'2024-07-13 06:58:42','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(109,'demo1','My App','development',9,'2024-07-13 12:23:09','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(110,'demo1','My App','development',11,'2024-07-13 23:58:02','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(111,'demo1','My App','development',10,'2024-07-14 16:50:28','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(112,'demo1','My App','development',11,'2024-07-15 08:07:17','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(113,'demo1','My App','development',11,'2024-07-15 23:22:49','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(114,'demo1','My App','development',5,'2024-07-16 14:01:16','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(115,'demo1','My App','production',59,'2024-08-02 00:37:43','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(116,'demo1','My App','production',58,'2024-08-03 03:38:46','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(117,'demo1','My App','production',58,'2024-08-04 00:01:52','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(118,'demo1','My App','production',58,'2024-08-04 15:47:44','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(119,'demo1','My App','production',61,'2024-08-05 11:31:08','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(120,'demo1','My App','production',61,'2024-08-05 14:41:15','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(121,'demo1','My App','production',61,'2024-08-07 02:05:30','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(122,'demo1','My App','production',62,'2024-08-07 10:41:37','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(123,'demo1','My App','production',62,'2024-08-08 20:19:23','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(124,'demo1','My App','production',58,'2024-08-10 07:48:53','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(125,'demo1','My App','production',62,'2024-08-10 22:45:15','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(126,'demo1','My App','production',58,'2024-08-11 02:33:24','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(127,'demo1','My App','production',62,'2024-08-11 17:26:58','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(128,'demo1','My App','production',60,'2024-08-12 10:47:42','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(129,'demo1','My App','production',60,'2024-08-13 00:53:03','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(130,'demo1','My App','production',62,'2024-08-14 11:45:21','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(131,'demo1','My App','production',62,'2024-08-14 18:40:03','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(132,'demo1','My App','production',15,'2024-08-16 05:42:20','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(133,'demo1','My App','production',35,'2024-08-01 11:25:25','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(134,'demo1','My App','production',35,'2024-08-02 04:19:34','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(135,'demo1','My App','production',35,'2024-08-02 23:06:20','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(136,'demo1','My App','production',35,'2024-08-03 18:38:11','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(137,'demo1','My App','production',32,'2024-08-05 03:11:48','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(138,'demo1','My App','production',35,'2024-08-06 04:54:57','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(139,'demo1','My App','production',33,'2024-08-06 05:51:05','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(140,'demo1','My App','production',34,'2024-08-08 01:52:41','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(141,'demo1','My App','production',32,'2024-08-08 23:57:04','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(142,'demo1','My App','production',33,'2024-08-10 06:56:36','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(143,'demo1','My App','production',36,'2024-08-11 11:54:06','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(144,'demo1','My App','production',36,'2024-08-12 15:51:08','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(145,'demo1','My App','production',33,'2024-08-13 20:19:40','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(146,'demo1','My App','production',33,'2024-08-15 08:45:57','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(147,'demo1','My App','production',24,'2024-08-16 04:56:30','Service #2',0.005000,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(148,'demo1','My App','development',6,'2024-08-01 19:14:43','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(149,'demo1','My App','development',5,'2024-08-02 20:53:32','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(150,'demo1','My App','development',7,'2024-08-03 12:21:29','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(151,'demo1','My App','development',8,'2024-08-04 13:53:18','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(152,'demo1','My App','development',8,'2024-08-05 05:25:30','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(153,'demo1','My App','development',8,'2024-08-06 01:10:20','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(154,'demo1','My App','development',6,'2024-08-06 10:26:15','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(155,'demo1','My App','development',7,'2024-08-06 11:58:22','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(156,'demo1','My App','development',7,'2024-08-07 03:44:31','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(157,'demo1','My App','development',6,'2024-08-08 02:25:03','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(158,'demo1','My App','development',7,'2024-08-08 19:55:19','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(159,'demo1','My App','development',8,'2024-08-09 13:26:31','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(160,'demo1','My App','development',5,'2024-08-09 15:04:41','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(161,'demo1','My App','development',8,'2024-08-09 21:42:46','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(162,'demo1','My App','development',8,'2024-08-10 04:57:31','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(163,'demo1','My App','development',5,'2024-08-10 23:10:14','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(164,'demo1','My App','development',4,'2024-08-11 08:32:56','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(165,'demo1','My App','development',6,'2024-08-11 12:47:10','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(166,'demo1','My App','development',6,'2024-08-12 03:32:43','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(167,'demo1','My App','development',6,'2024-08-12 14:52:12','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(168,'demo1','My App','development',8,'2024-08-13 02:31:00','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(169,'demo1','My App','development',6,'2024-08-13 19:27:34','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(170,'demo1','My App','development',5,'2024-08-14 22:44:24','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(171,'demo1','My App','development',6,'2024-08-15 01:29:27','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL),(172,'demo1','My App','development',6,'2024-08-15 12:28:44','Service #1',0.001500,'2024-02-07 07:14:35','2024-02-07 07:14:35',NULL,NULL);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'demo1','skills2023d1','2024-02-02 03:32:08','2024-02-02 03:32:08'),(2,'demo2','skills2023d2','2024-02-02 03:32:08','2024-02-02 03:32:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspaces`
--

DROP TABLE IF EXISTS `workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspaces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `workspaces_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspaces`
--

LOCK TABLES `workspaces` WRITE;
/*!40000 ALTER TABLE `workspaces` DISABLE KEYS */;
INSERT INTO `workspaces` VALUES (106,'My App','Hello','2024-02-07 14:40:54','2024-02-07 14:47:26',NULL),(109,'wdwd','wdwdwd','2024-02-07 14:55:27','2024-02-07 14:55:27',NULL);
/*!40000 ALTER TABLE `workspaces` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07 21:20:39
