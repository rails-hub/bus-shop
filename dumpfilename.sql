-- MySQL dump 10.13  Distrib 5.1.53, for apple-darwin10.3.0 (i386)
--
-- Host: localhost    Database: buscms
-- ------------------------------------------------------
-- Server version	5.1.53

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
-- Table structure for table `add_created_at_column_to_dealers`
--

DROP TABLE IF EXISTS `add_created_at_column_to_dealers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_created_at_column_to_dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_created_at_column_to_dealers`
--

LOCK TABLES `add_created_at_column_to_dealers` WRITE;
/*!40000 ALTER TABLE `add_created_at_column_to_dealers` DISABLE KEYS */;
/*!40000 ALTER TABLE `add_created_at_column_to_dealers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `encrypted_password` varchar(128) NOT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'narang.jasdeep@gmail.com','$2a$10$tTzNzoO8FXvHrXUhCenQG.K.PER6cDmlxgBsq1O3LSlxVOjVMODla',NULL,NULL,NULL,75,'2012-03-13 20:00:54','2012-03-01 17:40:47','127.0.0.1','192.168.240.116','2011-11-30 15:44:03','2012-03-13 20:00:54'),(2,'admin@liquidchrome.net','$2a$10$AsTGtKuYGC24aTVGHTlblObkGmR1EbIAr7CGFitC0jpaiWzQZRVt2',NULL,NULL,NULL,4,'2012-02-13 05:48:52','2012-02-11 19:53:08','173.34.209.126','99.238.22.162','2011-12-20 15:18:11','2012-02-13 05:48:52'),(3,'manpreet@vibe-online.com','$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa',NULL,NULL,NULL,13,'2012-04-10 02:03:00','2012-04-10 01:00:25','127.0.0.1','127.0.0.1','2011-12-20 15:18:11','2012-04-10 02:03:00');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_makes`
--

DROP TABLE IF EXISTS `body_makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body_makes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_makes`
--

LOCK TABLES `body_makes` WRITE;
/*!40000 ALTER TABLE `body_makes` DISABLE KEYS */;
INSERT INTO `body_makes` VALUES (1,'Ford','2011-12-02 18:08:46','2011-12-02 18:08:46'),(2,'Trafalgar','2011-12-02 18:08:52','2011-12-02 18:08:52'),(3,'Dharminder','2011-12-02 18:08:58','2011-12-02 18:08:58'),(4,'Tata','2011-12-02 18:09:04','2011-12-02 18:09:04'),(5,'Cleanstar','2011-12-02 18:09:14','2011-12-02 18:09:14');
/*!40000 ALTER TABLE `body_makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_types`
--

DROP TABLE IF EXISTS `bus_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_types`
--

LOCK TABLES `bus_types` WRITE;
/*!40000 ALTER TABLE `bus_types` DISABLE KEYS */;
INSERT INTO `bus_types` VALUES (1,'Shuttle','2011-12-02 16:50:38','2011-12-02 16:50:38','shuttle'),(2,'Paratransit','2011-12-02 16:50:46','2011-12-02 16:50:46','paratransit'),(3,'Limo','2011-12-02 16:50:51','2011-12-02 16:50:51','limo'),(4,'School','2011-12-02 16:50:57','2011-12-02 16:50:57','school'),(6,'City Transit','2011-12-02 16:51:10','2011-12-02 16:51:10','city-transit'),(7,'Trolley','2011-12-02 16:51:16','2011-12-02 16:51:16','trolley'),(9,'Van','2011-12-02 16:51:51','2011-12-02 16:51:51','van');
/*!40000 ALTER TABLE `bus_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(255) DEFAULT NULL,
  `bus_type_id` int(11) DEFAULT NULL,
  `chasis_model` varchar(255) DEFAULT NULL,
  `body_model` varchar(255) DEFAULT NULL,
  `engine` varchar(255) DEFAULT NULL,
  `mileage` varchar(255) DEFAULT NULL,
  `vin` varchar(255) DEFAULT NULL,
  `fuel_type` varchar(255) DEFAULT NULL,
  `passengers` int(11) DEFAULT NULL,
  `vehicle_length` varchar(255) DEFAULT NULL,
  `exterior_color` varchar(255) DEFAULT NULL,
  `interior_color` varchar(255) DEFAULT NULL,
  `luggage` varchar(45) DEFAULT NULL,
  `wheelchair_lifts` varchar(45) DEFAULT NULL,
  `warranty` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `chasis_make_id` int(11) DEFAULT NULL,
  `transmission` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `body_make_id` int(11) DEFAULT NULL,
  `live` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sold` tinyint(1) DEFAULT NULL,
  `sold_price` varchar(255) DEFAULT NULL,
  `status_image` varchar(255) DEFAULT NULL,
  `sold_date` datetime DEFAULT NULL,
  `vehicle_description` varchar(255) DEFAULT NULL,
  `wholesale_price` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `sale_price` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `posted_price` varchar(255) DEFAULT NULL,
  `entertainment` varchar(255) DEFAULT NULL,
  `lavatory` varchar(255) DEFAULT NULL,
  `raised_roof` varchar(255) DEFAULT NULL,
  `wheelchair_capacity` varchar(255) DEFAULT NULL,
  `brakes` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_status_change_by` varchar(255) DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses`
--

LOCK TABLES `buses` WRITE;
/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` VALUES (79,'SDFSDAG7',6,'Chasis Model','Body Model','Engine','7697869','SDAFGSAD','Diesel',65,'65','Red','Black','Yes','Yes','No','2011-12-06 16:42:28','2012-02-14 23:10:59','2011',2,'Manual','USA',5,'yes','yes','new',0,'','greenCircle.png','2011-12-21 19:47:07','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis risus ligula, eu rutrum nisi. Praesent et neque et lacus porta fringilla sit amet vitae urna. Sed eget lorem sed ligula pretium gravida. Nam in odio urna. Sed porta dui non est congue grav','250000','250000','250000','300000','price',NULL,NULL,NULL,'','Air','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','manpreet@vibe-online.com',2),(80,'DS7F687SD',2,'Chasis Model','Body Model','Engine','67768777','7DS6F87','Gas',65,'65','Red','Black','Yes','Yes','No','2011-12-06 16:50:24','2012-02-14 23:18:40','2011',5,'Manual','Canada',3,'yes','yes','sale',0,'','redCircle.png','2011-12-06 16:50:24','Description','250000','250000','250000','240000','price',NULL,NULL,NULL,'1','Air','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','manpreet@vibe-online.com',2),(81,'6DS5F76',1,'Chasis Model','Body Model','Detroit Diesel Series 60 (500HP)','7687698','6567DSF','Gas',11,'65','Red','Black','Yes','Yes','No','2011-12-06 16:52:27','2012-02-14 22:50:03','2011',3,'Manual','Canada',2,'yes','no','new',0,'','greenCircle.png','2011-12-15 21:21:36','Vehicle','250000','250000','250000','250000','price','Yes',NULL,NULL,'','Air','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','manpreet@vibe-online.com',2),(83,'DSF587S',4,'Chasis Model','Body Model','Detroit Diesel Series 60 (500HP)','450000','7SD568F7','Diesel',54,'54','Black','Red','Yes','Yes','No','2011-12-06 18:18:39','2011-12-21 15:32:32','2011',2,'Automatic','Canada',3,'yes','no','new',0,'','greenCircle.png',NULL,'Description','250000','250000','250000','456000','price',NULL,NULL,NULL,'','Air','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(96,'DS6F87',3,'Chasis model','Body Model','sdf','769876','DS76F87','Diesel',54,'67','Black','Red','Yes','No','No','2011-12-06 18:27:03','2012-02-14 22:42:15','2011',2,'Automatic','Canada',4,'yes','yes','pending',0,'','grayCircle.png','2011-12-15 21:23:11','Description','250000','250000','250000','330000','price',NULL,'No',NULL,'','Air','manpreet@vibe-online.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','manpreet@vibe-online.com',2),(105,'7DSF687SD6',1,'Chasis Model','Skyliner X87GB','Big Engine','450000','87DS6F87SD','Diesel',54,'54','Yello','Red','Yes','No','No','2011-12-06 18:28:30','2011-12-15 17:21:43','2011',3,'Automatic','Canada',4,'yes','no','new',0,'','greenCircle.png',NULL,'Description','250000','250000','250000','330000','price',NULL,NULL,NULL,NULL,NULL,'narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(106,'786SDFA88',3,'Chasis Model','Super Large','Big Engine','769876','342SDFDSF','Diesel',87,'87','Red','Blue','No','No','Yes','2011-12-06 18:29:33','2011-12-20 22:24:25','2011',3,'Automatic','Canada',3,'yes','no','new',0,'','greenCircle.png',NULL,'Describe the vehicle here.','250000','250000','250000','250000','price',NULL,'Yes',NULL,'','Air','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(108,'DS87F698',4,'Marathon 1046 45ft XLVII','Super Large','Detroit Diesel Series 60 (500HP)','450000','8769F8','Diesel',65,'45','Black','Red','No','No','Yes','2011-12-06 18:33:38','2011-12-21 15:31:15','2011',4,'Automatic','Canada',5,'yes','yes','standard',0,'','blackCircle.png',NULL,'','250000','250000','250000','400000','price',NULL,NULL,NULL,'','Hydraulic','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(109,'7D6SF87',1,'Chasis Model','Body Model','Detroit Diesel Series 60 (500HP)','769876','UD6F877DA','Gas',35,'40','Red','Black','No','No','No','2011-12-06 18:37:26','2011-12-20 15:16:29','2011',1,'Automatic','Canada',3,'yes','yes','standard',0,'','blackCircle.png',NULL,'Describe','250000','250000','250000','175000','price',NULL,NULL,NULL,NULL,NULL,'narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(259,'7SF6788',1,'Chasis Damping','Modelicious Style','Powerful','47000','7SDF6','Diesel',30,'69','Black','Red','Yes','No','No','2011-12-16 21:53:33','2011-12-20 17:27:03','1995',1,'Automatic','Canada',3,'yes','no','new',0,'','greenCircle.png','2011-12-16 21:53:33','Descrtiption','110000','78990','122000','125000','cost',NULL,NULL,NULL,'','Air','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(264,'MF78D78',2,'Le Chasis round','GOSHEN COACH PACER II BUS ','GOSHEN COACH','40000','BDB22693','Diesel',23,'20','White','Black','Yes','Yes','Yes','2011-12-20 16:29:53','2011-12-20 16:35:11','2007',4,'Automatic','Canada',4,'yes','yes','new',0,'','greenCircle.png',NULL,'Paratransit Bus','','','','30000','price','Yes','Yes','No','3','Air','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(265,'UQ15Q0SQ',9,'S2 Model','S2 Body','S2 Engine','340000','ADDED_BY_VISITOR',NULL,23,'65','Red',NULL,NULL,NULL,NULL,'2012-01-30 22:29:53','2012-01-30 22:29:53','2000',5,NULL,'Canada',3,'no','no','new',NULL,NULL,'greenCircle.png',NULL,'Description of Bus.',NULL,NULL,'340000',NULL,'sale_price',NULL,NULL,NULL,NULL,NULL,'narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(266,'JQ9ZWFKI',2,'Volvo B9L Chasis','Skyliner X87GB','Detroit Diesel Series 60 (500HP)','4000','JQ9ZWFKI_BY_VISITOR',NULL,35,'45','Black',NULL,NULL,NULL,NULL,'2012-02-14 02:52:34','2012-02-14 02:52:34','1995',2,NULL,'Canada',3,'no','no','new',NULL,NULL,'greenCircle.png',NULL,'Description Sample',NULL,NULL,'250000',NULL,'sale_price',NULL,NULL,NULL,NULL,NULL,'narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(267,'AWI74WXC',9,'Marathon 1046 45ft XLVII','Modelicious Style','Detroit Diesel Series 60 (500HP)','450000','AWI74WXC_BY_VISITOR','Gas',67,'54','Black','Blue',NULL,NULL,NULL,'2012-02-14 02:56:01','2012-02-16 01:08:55','1989',6,'Manual','Canada',3,'no','no','new',0,'','greenCircle.png',NULL,'Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description ','','','','','price',NULL,NULL,NULL,'','Air','narang.jasdeep@gmail.com','narang.jasdeep@gmail.com','2012-02-14 22:07:21','narang.jasdeep@gmail.com',2),(273,'SD8F798D',1,'S2 Chasis','Body Model','Detroit Diesel Series 60 (500HP)','120000','8D9F7S8','Diesel',65,'56','Red','Red','Yes','No','Yes','2012-02-14 23:21:30','2012-02-28 22:13:30','1982',1,'Automatic','USA',2,'no','yes','pending',0,'','grayCircle.png',NULL,'','250000','230000','122000','300000','price','Yes','Yes','No','2','Hydraulic','manpreet@vibe-online.com','narang.jasdeep@gmail.com','2012-02-28 22:13:30','narang.jasdeep@gmail.com',2),(275,'0DS87F98D1',6,'Marathon 1046 45ft XLVII','Super Large','Detroit Diesel Series 60 (500HP)','120000','DS8F798SD','Gas',65,'45','red','yellow','Yes','No','Yes','2012-02-15 22:01:37','2012-02-15 22:28:31','1986',3,'Automatic','Canada',1,'no','yes','pending',1,'450000','grayCircle.png','2012-02-15 22:28:31','Description','110000','250000','250000','440000','cost','No','Yes','No','2','Air','manpreet@vibe-online.com','manpreet@vibe-online.com','2012-02-15 22:01:37','manpreet@vibe-online.com',40),(277,'09D87F98',4,'S2 Chasis','Super Large','Detroit Diesel Series 60 (500HP)','120000','90DS08F9','Gas',65,'45','Red','Black','Yes','No','Yes','2012-02-15 22:46:03','2012-02-15 22:46:51','1985',2,'Automatic','Canada',3,'yes','yes','attention',0,'','blueCircle.png',NULL,'Description.','250000','250000','76999','131311','cost','No','Yes','No','2','Air','manpreet@vibe-online.com','manpreet@vibe-online.com','2012-02-15 22:46:03','manpreet@vibe-online.com',42),(278,'90D8F09',6,'Volvo B9L Chasis','Body Model','Detroit Diesel Series 60 (500HP)','450000','90DS8F9','Diesel',41,'12','Red','Red','Yes','No','Yes','2012-02-15 22:48:40','2012-02-15 22:48:40','1986',1,'Automatic','USA',4,'yes','yes','new',0,'','greenCircle.png',NULL,'Desciption./','250000','250000','250000','131311','cost','Yes','Yes','No','2','Air','manpreet@vibe-online.com','manpreet@vibe-online.com','2012-02-15 22:48:40','manpreet@vibe-online.com',43),(281,'5IW8FM2P',6,'S2 Chasis','Body Model','Detroit Diesel Series 60 (500HP)','120000','5IW8FM2P_BY_VISITOR',NULL,65,'25','Red','Black',NULL,NULL,NULL,'2012-02-16 00:39:04','2012-02-16 00:39:04','1983',3,NULL,'Canada',3,'no','no','new',NULL,NULL,'greenCircle.png',NULL,'Description',NULL,NULL,'250000',NULL,'sale_price',NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,46),(282,'WV7WS2ZJ',3,'S2 Chasis','Super Large','Detroit Diesel Series 60 (500HP)','120000','WV7WS2ZJ_BY_VISITOR','Gas',65,'25','Red','Black',NULL,NULL,NULL,'2012-02-16 00:59:18','2012-02-16 01:00:30','1984',4,'Manual','Canada',3,'no','no','standard',0,'','blackCircle.png',NULL,'Description','','','250000','','sale_price',NULL,NULL,NULL,'2','Air',NULL,'narang.jasdeep@gmail.com','2012-02-16 01:00:30','narang.jasdeep@gmail.com',47),(283,'NBD9Z0SO',3,'S2 Chasis','Super Large','Detroit Diesel Series 60 (500HP)','120000','NBD9Z0SO_BY_VISITOR','Gas',65,'25','Red','Black',NULL,NULL,NULL,'2012-02-16 01:09:44','2012-02-16 02:13:22','1984',4,'Manual','Canada',3,'no','no','new',0,'','greenCircle.png',NULL,'Description','','','13131','','sale_price',NULL,NULL,NULL,'2','Air','Visitor','Visitor',NULL,'narang.jasdeep@gmail.com',48);
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chasis_make`
--

DROP TABLE IF EXISTS `chasis_make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chasis_make` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chasis_make`
--

LOCK TABLES `chasis_make` WRITE;
/*!40000 ALTER TABLE `chasis_make` DISABLE KEYS */;
/*!40000 ALTER TABLE `chasis_make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chasis_makes`
--

DROP TABLE IF EXISTS `chasis_makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chasis_makes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chasis_makes`
--

LOCK TABLES `chasis_makes` WRITE;
/*!40000 ALTER TABLE `chasis_makes` DISABLE KEYS */;
INSERT INTO `chasis_makes` VALUES (1,'Prevost','2011-12-02 17:26:02','2011-12-02 17:26:02'),(2,'Volvo B9L','2011-12-02 17:26:47','2011-12-02 17:26:47'),(3,'Volvo B9TL','2011-12-02 17:26:50','2011-12-02 17:26:50'),(4,'Volvo B7R','2011-12-02 17:27:02','2011-12-02 17:27:02'),(5,'S2 Chasis','2011-12-02 17:27:35','2011-12-02 17:27:35'),(6,'XB-P Chasis','2011-12-02 17:27:52','2011-12-02 17:27:52');
/*!40000 ALTER TABLE `chasis_makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (7,'Manpreet','manpreetrules@gmail.com','6479942787','asd'),(9,'jasdeep','narang.jasdeep@gmail.com','6479942787','asd'),(11,'Jasdeep','tech@vibe-online.com','6479811313','Comments from the person who will contact.'),(12,'Johnny Molina','johnny@liquidchrome.net','6479811313','Comments here.');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealers`
--

DROP TABLE IF EXISTS `dealers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `encrypted_password` varchar(128) NOT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_dealers_on_email` (`email`),
  UNIQUE KEY `index_dealers_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealers`
--

LOCK TABLES `dealers` WRITE;
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
INSERT INTO `dealers` VALUES (4,'tech@vibe-online.com','$2a$10$CFcP3FMTaT97sUbO7YvqJ.SElBsUE5MbCXdAuR5vK3J6wReV4pcJ.','yxJspjCN9MjzS15eJt1Z','2012-02-29 21:44:36',NULL,10,'2012-02-29 22:54:24','2012-02-29 21:33:08','127.0.0.1','127.0.0.1','2012-02-16 03:15:17','2012-02-29 22:54:24','Jasdeep','Narang',NULL,'2012-02-16 03:15:35','2012-02-16 03:15:17','vibe_logo.png','6479811313','Vibe Online Ltd.','4 Boake Street','Toronto','ON','Canada','M3J0B6');
/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (16,78,'Slk6753-City-Bus.jpg','2011-12-09 16:16:36','2011-12-09 16:16:36'),(17,79,'bus-new-number80021.jpg','2011-12-09 16:16:53','2011-12-09 16:16:53'),(18,80,'MTC_white_line_bus.jpg','2011-12-09 16:17:06','2011-12-09 16:17:06'),(20,96,'prevost-conversion-bus-picture.jpg','2011-12-09 16:40:53','2011-12-09 16:40:53'),(22,109,'Slk6753-City-Bus.jpg','2011-12-09 17:12:45','2011-12-09 17:12:45'),(23,108,'tata-cng-hybrid-bus-2.jpg','2011-12-09 17:13:15','2011-12-09 17:13:15'),(25,79,'Charter-Bus-Service-4.jpg','2011-12-09 22:06:01','2011-12-09 22:06:01'),(26,79,'Charter-Bus-Service-4.jpg','2011-12-09 22:09:33','2011-12-09 22:09:33'),(27,79,'greyhound-bus-2.jpg','2011-12-09 22:09:33','2011-12-09 22:09:33'),(28,79,'11-Meter-VIP-China-Tourist-Bus-6110.jpg','2011-12-09 22:09:35','2011-12-09 22:09:35'),(29,79,'bus-new-number80021.jpg','2011-12-09 22:09:35','2011-12-09 22:09:35'),(30,79,'6000medium.jpg','2011-12-09 22:09:36','2011-12-09 22:09:36'),(31,79,'bus-usa.jpg','2011-12-09 22:09:37','2011-12-09 22:09:37'),(32,79,'MTC_white_line_bus.jpg','2011-12-09 22:09:37','2011-12-09 22:09:37'),(33,79,'prevost-conversion-bus-picture.jpg','2011-12-09 22:09:38','2011-12-09 22:09:38'),(37,105,'bus-usa.jpg','2011-12-15 17:15:52','2011-12-15 17:15:52'),(39,83,'Daewoo-Bus-GDW6123-.jpg','2011-12-15 17:16:53','2011-12-15 17:16:53'),(40,83,'NewYorkCitypublicbus.jpg','2011-12-15 17:16:54','2011-12-15 17:16:54'),(41,81,'4095522380_c838cde701.jpg','2011-12-15 17:20:25','2011-12-15 17:20:25'),(43,81,'11-Meter-VIP-China-Tourist-Bus-6110.jpg','2011-12-15 17:20:26','2011-12-15 17:20:26'),(44,106,'NewYorkCitypublicbus.jpg','2011-12-15 17:22:29','2011-12-15 17:22:29'),(45,106,'bus-usa.jpg','2011-12-15 17:22:29','2011-12-15 17:22:29'),(46,259,'Bus_Driver-37952.jpg','2011-12-16 21:53:28','2011-12-16 21:53:33'),(47,259,'MTC_white_line_bus.jpg','2011-12-16 21:53:28','2011-12-16 21:53:33'),(48,259,'TOYOTA_FCHV_Bus.jpg','2011-12-16 21:53:29','2011-12-16 21:53:33'),(49,260,'prevost-conversion-bus-picture.jpg','2011-12-16 21:58:40','2011-12-16 21:58:40'),(50,260,'greyhound-bus-2.jpg','2011-12-16 21:58:40','2011-12-16 21:58:40'),(51,260,'Slk6753-City-Bus.jpg','2011-12-16 21:58:40','2011-12-16 21:58:40'),(52,107,'4095522380_c838cde701.jpg','2011-12-20 16:00:05','2011-12-20 16:00:05'),(53,107,'bus-new-number80021.jpg','2011-12-20 16:00:05','2011-12-20 16:00:05'),(54,264,'Photo_Open_Door_Bus.jpg','2011-12-20 16:29:48','2011-12-20 16:29:53'),(55,264,'raised-front-door-24-para-van.jpg','2011-12-20 16:29:49','2011-12-20 16:29:53'),(59,78,'4095522380_c838cde701.jpg','2012-01-16 20:37:31','2012-01-16 20:37:31'),(60,265,'greyhound-bus-2.jpg','2012-01-30 22:29:53','2012-01-30 22:29:53'),(66,266,'raised-front-door-24-para-van.jpg','2012-02-14 02:52:34','2012-02-14 02:52:34'),(67,267,'raised-front-door-24-para-van.jpg','2012-02-14 02:56:01','2012-02-14 02:56:01'),(68,268,'MTC_white_line_bus.jpg','2012-02-14 02:56:57','2012-02-14 02:56:57'),(73,273,'6000medium.jpg','2012-02-14 23:21:27','2012-02-14 23:21:30'),(74,274,'Charter-Bus-Service-4.jpg','2012-02-14 23:31:46','2012-02-14 23:31:49'),(75,275,'Daewoo-Bus-GDW6123-.jpg','2012-02-15 22:01:34','2012-02-15 22:01:37'),(76,275,'6000medium.jpg','2012-02-15 22:01:34','2012-02-15 22:01:37'),(77,276,'11-Meter-VIP-China-Tourist-Bus-6110.jpg','2012-02-15 22:21:22','2012-02-15 22:21:24'),(78,277,'6000medium.jpg','2012-02-15 22:46:00','2012-02-15 22:46:03'),(79,277,'Bus_Driver-37952.jpg','2012-02-15 22:46:00','2012-02-15 22:46:03'),(80,278,'Charter-Bus-Service-4.jpg','2012-02-15 22:48:37','2012-02-15 22:48:40'),(81,278,'greyhound-bus-2.jpg','2012-02-15 22:48:37','2012-02-15 22:48:40'),(82,281,'4095522380_c838cde701.jpg','2012-02-16 00:39:04','2012-02-16 00:39:04'),(83,282,'MTC_white_line_bus.jpg','2012-02-16 00:59:18','2012-02-16 00:59:18'),(84,283,'MTC_white_line_bus.jpg','2012-02-16 01:09:44','2012-02-16 01:09:44');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (1,'Jasdeep','Narang','narang.jasdeep@gmail.com','6479811313','tedet',79,'2012-04-10 01:01:24','2012-04-10 01:01:24'),(2,'Manpreet ','Narang','manpreet.singh@vibe-online.com','6479942787','Hello Testing\r\n',80,'2012-04-10 02:02:17','2012-04-10 02:02:17');
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_charts`
--

DROP TABLE IF EXISTS `main_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_charts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dates` date DEFAULT NULL,
  `pageviews` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_charts`
--

LOCK TABLES `main_charts` WRITE;
/*!40000 ALTER TABLE `main_charts` DISABLE KEYS */;
INSERT INTO `main_charts` VALUES (1,'2012-01-18',30,NULL,NULL),(2,'2012-01-19',170,NULL,NULL),(3,'2012-01-20',192,NULL,NULL),(4,'2012-01-24',170,'2012-01-25 19:38:21','2012-01-25 19:38:21'),(6,'2012-01-21',50,'2012-01-25 19:42:40','2012-01-25 19:42:40'),(7,'2012-01-22',20,'2012-01-25 19:42:55','2012-01-25 19:42:55'),(8,'2012-01-23',218,'2012-01-25 19:43:07','2012-01-25 19:43:07'),(9,'2011-12-27',25,'2012-01-25 19:43:31','2012-01-25 19:43:31'),(10,'2011-12-28',20,'2012-01-25 19:43:48','2012-01-25 19:43:48'),(11,'2011-12-29',75,'2012-01-25 19:44:01','2012-01-25 19:44:01'),(12,'2012-01-03',36,'2012-01-25 19:48:04','2012-01-25 19:48:04'),(13,'2012-01-01',4,'2012-01-25 19:48:26','2012-01-25 19:48:26'),(14,'2012-01-02',34,'2012-01-25 19:48:42','2012-01-25 19:48:42'),(15,'2012-01-06',28,'2012-01-25 19:50:10','2012-01-25 19:50:10'),(16,'2012-01-07',24,'2012-01-25 19:50:55','2012-01-25 19:50:55'),(17,'2012-01-08',24,'2012-01-25 19:51:16','2012-01-25 19:51:16'),(18,'2012-01-09',80,'2012-01-25 19:51:34','2012-01-25 19:51:34'),(19,'2012-01-10',126,'2012-01-25 19:51:47','2012-01-25 19:51:47'),(20,'2012-01-11',161,'2012-01-25 19:52:04','2012-01-25 19:52:04'),(21,'2012-01-12',86,'2012-01-25 19:52:17','2012-01-25 19:52:17'),(22,'2012-01-13',50,'2012-01-25 19:52:31','2012-01-25 19:52:31'),(23,'2012-01-14',44,'2012-01-25 19:52:42','2012-01-25 19:52:42'),(24,'2012-01-15',2,'2012-01-25 19:52:54','2012-01-25 19:52:54'),(25,'2012-01-16',188,'2012-01-25 19:53:14','2012-01-25 19:53:14'),(26,'2012-01-17',125,'2012-01-25 19:53:30','2012-01-25 19:53:30'),(27,'2012-01-05',70,'2012-01-25 19:55:52','2012-01-25 19:55:52'),(28,'2012-01-04',50,'2012-01-25 19:56:06','2012-01-25 19:56:06'),(29,'2011-12-30',182,NULL,NULL),(30,'2011-12-31',398,NULL,NULL),(31,'2011-12-26',287,NULL,NULL),(32,'2011-12-25',343,NULL,NULL);
/*!40000 ALTER TABLE `main_charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manage_views`
--

DROP TABLE IF EXISTS `manage_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manage_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` tinyint(1) DEFAULT NULL,
  `bus_type` tinyint(1) DEFAULT NULL,
  `chasis_model` tinyint(1) DEFAULT NULL,
  `body_model` tinyint(1) DEFAULT NULL,
  `engine` tinyint(1) DEFAULT NULL,
  `mileage` tinyint(1) DEFAULT NULL,
  `vin` tinyint(1) DEFAULT NULL,
  `fuel_type` tinyint(1) DEFAULT NULL,
  `passengers` tinyint(1) DEFAULT NULL,
  `vehicle_length` tinyint(1) DEFAULT NULL,
  `exterior_color` tinyint(1) DEFAULT NULL,
  `interior_color` tinyint(1) DEFAULT NULL,
  `luggage` tinyint(1) DEFAULT NULL,
  `wheelchair_lifts` tinyint(1) DEFAULT NULL,
  `warranty` tinyint(1) DEFAULT NULL,
  `created_at` tinyint(1) DEFAULT NULL,
  `updated_at` tinyint(1) DEFAULT NULL,
  `year` tinyint(1) DEFAULT NULL,
  `chasis_make` tinyint(1) DEFAULT NULL,
  `transmission` tinyint(1) DEFAULT NULL,
  `location` tinyint(1) DEFAULT NULL,
  `body_make` tinyint(1) DEFAULT NULL,
  `live` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `sold` tinyint(1) DEFAULT NULL,
  `sold_price` tinyint(1) DEFAULT NULL,
  `sold_date` tinyint(1) DEFAULT NULL,
  `wholesale_price` tinyint(1) DEFAULT NULL,
  `cost` tinyint(1) DEFAULT NULL,
  `sale_price` tinyint(1) DEFAULT NULL,
  `price` tinyint(1) DEFAULT NULL,
  `posted_price` tinyint(1) DEFAULT NULL,
  `entertainment` tinyint(1) DEFAULT NULL,
  `raised_roof` tinyint(1) DEFAULT NULL,
  `wheelchair_capacity` tinyint(1) DEFAULT NULL,
  `brakes` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage_views`
--

LOCK TABLES `manage_views` WRITE;
/*!40000 ALTER TABLE `manage_views` DISABLE KEYS */;
INSERT INTO `manage_views` VALUES (1,1,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `manage_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`),
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20111130152703'),('20111130202600'),('20111130221106'),('20111201215514'),('20111202163616'),('20111202170132'),('20111202170345'),('20111202171255'),('20111202172231'),('20111202173603'),('20111202180457'),('20111202180546'),('20111202180958'),('20111205143750'),('20111205162436'),('20111205163034'),('20111205184033'),('20111205200036'),('20111205214325'),('20111206213851'),('20111219165325'),('20111219180236'),('20120116213230'),('20120123200044'),('20120123203822'),('20120124155432'),('20120124212835'),('20120124222745'),('20120125164541'),('20120125191428'),('20120130180400'),('20120130181301'),('20120213214222'),('20120214211927'),('20120214212758'),('20120215151446'),('20120216020113'),('20120228230831'),('20120410011148');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (2,'Jasdeep Narang','6479811313','tech@vibe-online.com','Comments Comments Comments Comments Comments Comments Comments Comments ','M5V1X6','2012-01-30 22:22:40','2012-02-16 02:10:56','4 Boake Street','ON','Toronto',NULL,'Canada'),(40,'Manpreet Singha','6479811313','manpreet@vibe-online.com','','M3J0B6','2012-02-15 22:01:37','2012-02-15 22:02:48','4 Boake Street','','',NULL,''),(41,'Martha Cardenas','','','','','2012-02-15 22:21:24','2012-02-15 22:21:24','','','',NULL,''),(42,'Robin McLeod','6479811313','narang.jasdeep@gmail.com','','','2012-02-15 22:46:03','2012-02-15 22:46:03','','','',NULL,''),(43,'Someone Selling the bus','6479811313','','','','2012-02-15 22:48:40','2012-02-15 22:49:13','','','',NULL,''),(44,'','','','','','2012-02-15 23:26:24','2012-02-15 23:26:24',NULL,NULL,NULL,NULL,NULL),(45,'','','','','','2012-02-15 23:27:12','2012-02-15 23:27:12',NULL,NULL,NULL,NULL,NULL),(46,'Jim Adams','6479811313','support@vibe-online.com','','','2012-02-16 00:39:04','2012-02-16 00:39:04',NULL,NULL,NULL,NULL,NULL),(47,'Jim Adams','6479811313','','','','2012-02-16 00:59:18','2012-02-16 01:00:12','','','',NULL,''),(48,'Jim Adams','6479811313','support@vibe-online.com','Description','M3J0B6','2012-02-16 01:09:44','2012-02-16 02:13:22','372 richmond','ON','Toronto',NULL,'Canada');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `setting_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'2012-01-25 17:10:40','2012-01-25 17:11:33','contact_success_message','Thanks for contacting us! We\'ll get in touch shortly!'),(2,'2012-01-25 20:06:09','2012-01-25 20:06:09','stock_contact_email','tech@vibe-online.com'),(3,'2012-01-30 20:14:55','2012-02-14 01:56:37','ga_username','narang.jasdeep@gmail.com'),(4,'2012-01-30 20:15:20','2012-02-14 01:56:57','ga_password','tauxik123'),(5,'2012-01-30 20:15:56','2012-02-14 01:32:11','ga_profile_id','UA-28898726-1');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `pageviews` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` varchar(255) DEFAULT NULL,
  `visits` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,'79',1,'2012-02-13','2012-02-14 01:57:32','2012-02-14 01:57:32'),(2,'79',4,'2012-02-09','2012-02-14 02:00:05','2012-02-14 02:00:05'),(3,'80',2,'2012-02-09','2012-02-14 02:00:06','2012-02-14 02:00:06'),(4,'105',1,'2012-02-09','2012-02-14 02:00:07','2012-02-14 02:00:07'),(5,'260',1,'2012-02-09','2012-02-14 02:00:10','2012-02-14 02:00:10'),(6,'79',7,'2012-02-08','2012-02-14 02:00:22','2012-02-14 02:00:22'),(7,'81',1,'2012-02-08','2012-02-14 02:00:22','2012-02-14 02:00:22'),(8,'79',2,'2012-02-07','2012-02-14 02:00:37','2012-02-14 02:00:37'),(9,'79',3,'2012-02-06','2012-02-14 02:00:51','2012-02-14 02:00:51'),(10,'79',3,'2012-02-03','2012-02-14 02:01:43','2012-02-14 02:01:43'),(11,'80',3,'2012-02-03','2012-02-14 02:01:43','2012-02-14 02:01:43'),(12,'83',1,'2012-02-03','2012-02-14 02:01:44','2012-02-14 02:01:44'),(13,'96',3,'2012-02-03','2012-02-14 02:01:44','2012-02-14 02:01:44'),(14,'106',2,'2012-02-03','2012-02-14 02:01:44','2012-02-14 02:01:44'),(15,'213',2,'2012-02-03','2012-02-14 02:01:46','2012-02-14 02:01:46'),(16,'259',2,'2012-02-03','2012-02-14 02:01:46','2012-02-14 02:01:46'),(17,'260',3,'2012-02-03','2012-02-14 02:01:46','2012-02-14 02:01:46'),(18,'264',2,'2012-02-03','2012-02-14 02:01:47','2012-02-14 02:01:47'),(19,'79',1,'2012-02-13','2012-02-14 02:01:51','2012-02-14 02:01:51'),(20,'273',4,'2012-02-15','2012-02-16 01:38:58','2012-02-16 01:38:58');
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `encrypted_password` varchar(128) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (20,'narang.jasdeep@gmail.com','$2a$10$8VGPt/MbBcSWmFDHnWXuD./r08KYhh1zJyw.hfMktfS2JU4cyq4yW',NULL,'2012-01-18 20:06:45','2012-01-18 20:06:30',NULL,NULL,1,'2012-01-18 20:06:45','2012-01-18 20:06:45','67.55.24.241','67.55.24.241','2012-01-18 20:06:30','2012-02-14 22:37:52','Jasdeep','Narang'),(21,'manpreet@vibe-online.com','$2a$10$.X.CkGKth6bm87NAGSIdhezJUTr1DGhFUAcftHO9fqXK9kHiv.cTC',NULL,'2012-01-23 18:55:54','2012-01-23 18:55:45',NULL,NULL,5,'2012-02-15 23:24:02','2012-02-14 22:40:00','127.0.0.1','127.0.0.1','2012-01-23 18:55:45','2012-02-15 23:24:02','Manpreet','Narang');
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

-- Dump completed on 2012-04-09 23:56:41
