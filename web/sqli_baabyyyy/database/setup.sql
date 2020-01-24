-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database:
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Current Database: `sqli_baby_omega`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sqli_baby_omega` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sqli_baby_omega`;

--
-- Table structure for table `secrets`
--

DROP TABLE IF EXISTS `assrar_dawla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assrar_dawla` (
  `sid` varchar(50) DEFAULT NULL,
  `sir_dawla` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assrar_dawla`
--

LOCK TABLES `assrar_dawla` WRITE;
/*!40000 ALTER TABLE `assrar_dawla` DISABLE KEYS */;
INSERT INTO `assrar_dawla` VALUES ('fl4g_ta3_dawla','shellmates{B4byyyyy_Sqli__1s_always_a_good_idea_1337}');
/*!40000 ALTER TABLE `assrar_dawla` ENABLE KEYS */;
UNLOCK TABLES;


