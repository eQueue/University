-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: lookiehackerton.cq8czcekfb2n.ap-northeast-2.rds.amazonaws.com    Database: toy2
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Quiz`
--

DROP TABLE IF EXISTS `Quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Quiz` (
  `quiz_id` int NOT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quiz`
--

LOCK TABLES `Quiz` WRITE;
/*!40000 ALTER TABLE `Quiz` DISABLE KEYS */;
INSERT INTO `Quiz` VALUES (1,'CC(Campus Couple)를 한 적이 있다.'),(2,'파인애플 피자를 좋아하는 것을 숨긴 적 있다.'),(3,'방에 들어갈 때 \'따라다라단~ 따라다라다단~\' 한 적이 있다.'),(4,'집에 혼자 들어가면서 \'거기 있는거 다 안다, 나와\' 한 적이 있다.'),(5,'발을 헛디뎌 놓고 아무렇지 않은 척 걸어간 적 있다.'),(6,'파란불이 깜빡일 때 멀리서부터 뛰어본 적이 있다.'),(7,'버스 정류장 벨 못 눌렀는데 아무렇지 않은 척 했다.'),(8,'샤워하고 나와서 자아도취 해봤다. //내가 제일 머시써 잘생겨써 !!!'),(9,'집에서 혼자 열정적으로 춤을 춘 적이 있다.'),(10,'집에서 혼자 감성에 빠져 눈물 흘린 적 있다.'),(11,'술 마시고 지하철 역/버스정류장 잘못내린 적 있다.'),(12,'술 마시고 전 애인한테 전화해봤다.'),(13,'술 마시고 모르는 사람이랑 친구한 적이 있다.'),(14,'술 마시고 지하철 종점 찍은 적이 있다.'),(15,'나는 1년동안 남친/여친이 없었다.'),(16,'부모님 속이고 남친/여친이랑 여행가본 적 있다.'),(17,'길에서 번호 따인 적이 있다.'),(18,'마음에 드는 이성의 번호를 딴 적이 있다.'),(19,'비밀 연애를 해본 적이 있다.'),(20,'엘레베이터에 혼자 있을 때 방구껴봤다.'),(21,'두고 온 물건 때문에 신발 안 벗고 집에 들어간 적이 있다.'),(22,'땅에 음식 떨어지고 3초 안에 주워서 먹어본 적 있다.'),(23,'탕수육 부먹이다.'),(24,'민트초코를 좋아한다.'),(25,'길가다 비둘기 똥 맞아봤다.'),(26,'나는 작은 강아지보다 큰 강아지가 좋다.'),(27,'나는 강아지보다 고양이가 좋다.'),(28,'나는 소주보다 맥주파다.'),(29,'게임에서 내 친구 번호를 판 적이 있다.'),(30,'게임에서 현피 각 잡아본 적 있다.');
/*!40000 ALTER TABLE `Quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Score`
--

DROP TABLE IF EXISTS `Score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Score` (
  `examiner` int NOT NULL COMMENT '출제자 id',
  `answerer` int NOT NULL COMMENT '응답자 id',
  `score` int DEFAULT NULL COMMENT '점수',
  PRIMARY KEY (`examiner`,`answerer`),
  KEY `answerer` (`answerer`),
  CONSTRAINT `Score_ibfk_1` FOREIGN KEY (`examiner`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Score_ibfk_2` FOREIGN KEY (`answerer`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Score`
--

LOCK TABLES `Score` WRITE;
/*!40000 ALTER TABLE `Score` DISABLE KEYS */;
INSERT INTO `Score` VALUES (1,1,0),(1,2,0);
/*!40000 ALTER TABLE `Score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `quiz_create` int DEFAULT '0' COMMENT '퀴즈 생성 여부',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'test','{bcrypt}$2a$10$mdjMXZaJW8rFmszGm6yIwOlY0ZES1wD67ca',0),(2,'test2','{bcrypt}$2a$10$mdjMXZaJW8rFmszGm6yIwOlY0ZES1wD67ca',0),(3,'test3','{bcrypt}$2a$10$1kvEglvy2Gausob0lTKMNuiak5WD70Cxj3VP3LzpORhSqA58/u3vy',0),(4,'test4','{bcrypt}$2a$10$BgFTRiur0r7/jRpzYlIYWOXv/X0j.sC85t1I.HBZJ563afwK293US',0),(5,NULL,'{bcrypt}$2a$10$7xryA1Eg.UeTSN55/JjPEuo0oYSiXrYdSS.rUgs29ENEc0DUr14rC',0),(6,NULL,'{bcrypt}$2a$10$MXOBAXuE3dbpEG6i.i/GluyksAYMNit7LpusuUTO54zrujhb4l/g.',0),(7,NULL,'{bcrypt}$2a$10$BbV8pw6m4PeckM322TO97eGp5XZf/Co5OrK6F4YDYZNEoJhEashsq',0),(8,'test1','{bcrypt}$2a$10$osq3eOb6/gRngmO/1FqxHeL/WzinFvuIoqDP2yAYg/XhlJQvMVrXi',0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Quiz`
--

DROP TABLE IF EXISTS `User_Quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `User_Quiz` (
  `quiz_id` int NOT NULL COMMENT '퀴즈 내용 연결',
  `user_id` int NOT NULL,
  `answer` int DEFAULT NULL COMMENT 'O/X',
  PRIMARY KEY (`quiz_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `User_Quiz_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `Quiz` (`quiz_id`),
  CONSTRAINT `User_Quiz_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Quiz`
--

LOCK TABLES `User_Quiz` WRITE;
/*!40000 ALTER TABLE `User_Quiz` DISABLE KEYS */;
INSERT INTO `User_Quiz` VALUES (1,1,0);
/*!40000 ALTER TABLE `User_Quiz` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-07 21:03:03
