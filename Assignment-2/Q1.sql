-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` varchar(3) NOT NULL,
  `user_id` int NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('A1',7,'773 Eden Drive Near, circle square Madrid Spain'),('A10',17,'A-285-7193 Ullamcorper Avenue  Amesbury, Army school, Vadodara Gujarat'),('A11',14,'666-4366 Lacinia Avenue Idaho Falls, Puddukuttai Vellore (TN)'),('A12',4,'773 Eden Drive Near Lake, Wu square, Hongkong'),('A13',10,'Aaron Hawkins 5587 Nunc. Avenue  Erie Rhode Island, London UK'),('A14',9,'516 Krishivan societ Krishivan societ Ghodasar Ahmedabad-360089 Gujarat'),('A15',18,'5543 Aliquet St. Fort Dodge GA, Times square Stretford UK'),('A16',2,'3235 Pretty View Lane Maninagar(East) Berlin'),('A17',6,'516 Krishivan societ Krishivan societ Ghodasar Chennai-785745 TN'),('A18',13,'347-7666 Iaculis St. Woodruff SC, Majuragate Surat, Gujarat'),('A19',16,'557-6308 Lacinia Road San Bernardino ND, old GEB, Hyderabad TL '),('A2',11,'Ap 696-3279 Viverra. Avenue Latrobe DE 38100, Opposite statue, Berlin'),('A20',12,'P.O. Box 132 1599 Curabitur Rd.  Bandera South Dakota, Vadodara Gujarat'),('A3',20,'6351 Fringilla Avenue Gardena Colorado, East of river, Alexendria UK'),('A4',8,'Kenture square, Vishwas Duplex Atladara(East) Dallas (US)'),('A5',3,'C-38 Myra Street Ghodasar, Kingston Britain'),('A6',1,'773 Eden Drive Montpeiler Montpeiler Ahmedabad-380050 Gujarat'),('A7',19,'5037 Diam Rd.  Daly City Bridge, New Mills, Ohio US'),('A9',15,'P.O. Box 147 2546 Sociosqu Rd. Bethlehem Utah, Madrid Spain');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `user_id` int NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `cart_product_id` (`product_id`),
  CONSTRAINT `cart_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'PR17',2),(1,'PR3',1),(2,'PR16',2),(3,'PR12',6),(6,'PR18',2),(6,'PR8',1),(7,'PR15',5),(11,'PR27',1),(12,'PR25',1),(16,'PR35',1),(19,'PR20',1),(19,'PR39',1),(22,'PR19',1),(22,'PR38',1),(23,'PR19',1),(23,'PR23',1),(24,'PR22',1),(24,'PR27',1),(28,'PR34',1),(29,'PR39',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(4) NOT NULL,
  `user_id` int NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_product_id` (`product_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('O1',15,'PR19',260,1,'2020-09-09 17:14:04'),('O10',22,'PR26',1000,1,'2020-06-26 01:55:30'),('O11',13,'PR27',20000,1,'2020-10-12 17:07:32'),('O12',26,'PR28',12000,1,'2019-01-18 01:53:53'),('O13',15,'PR29',18499,1,'2019-07-11 01:49:41'),('O14',24,'PR30',920,1,'2019-07-24 00:39:04'),('O15',28,'PR31',650,4,'2020-03-17 01:29:13'),('O16',25,'PR32',12890,1,'2020-09-11 22:44:44'),('O17',17,'PR33',1270,3,'2019-07-11 03:24:52'),('O18',17,'PR34',1400,1,'2019-11-07 17:20:47'),('O19',21,'PR44',550,2,'2019-06-03 22:30:44'),('O2',9,'PR37',700,1,'2020-12-17 18:03:33'),('O20',26,'PR45',5000,1,'2019-02-13 19:32:31'),('O3',12,'PR20',400,1,'2020-10-10 21:30:42'),('O4',8,'PR16',50000,1,'2020-10-09 16:01:50'),('O5',9,'PR17',8000,1,'2020-09-12 10:30:39'),('O6',1,'PR18',19999,1,'2020-10-03 11:37:32'),('O7',9,'PR19',260,1,'2020-10-03 14:11:10'),('O8',26,'PR24',1000,1,'2020-01-07 06:51:41'),('O9',12,'PR25',99,2,'2020-08-09 11:29:52');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` varchar(4) NOT NULL,
  `retailer_id` varchar(3) NOT NULL,
  `type` varchar(20) NOT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `date_launch` date DEFAULT NULL,
  `price` int NOT NULL,
  `date_added` date NOT NULL,
  `percent_discount` smallint DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `retailer_id_idx` (`retailer_id`),
  CONSTRAINT `retailer_id` FOREIGN KEY (`retailer_id`) REFERENCES `retailers` (`retailer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('PR1','R18','novels','mysterious','Deception point','Dan Brown','2009-08-03',1550,'2011-02-27',0),('PR10','R2','clothes','shirt','white shirt','first cry',NULL,200,'2012-02-16',0),('PR11','R1','electronics','tablet','kindle note8','amazon','2008-05-22',4500,'2009-04-01',0),('PR12','R6','novels','thriller','Digital Fortress','Dan Brown','2014-02-08',499,'2014-04-07',0),('PR13','R15','electronics','tablet','ipad pro max','apple','2009-01-03',23000,'2013-09-01',0),('PR14','R2','novels','mysterious','Untouchable','Mulk Raj Anand','2008-05-04',1500,'2011-02-03',0),('PR15','R11','electronics','laptop','lenovo omen','lenovo','2010-02-26',15999,'2012-01-04',0),('PR16','R3','electronics','tv','samsung uled tv','samsung','2010-06-17',50000,'2012-04-18',0),('PR17','R2','electronics','laptop','macbook pro','apple','2008-11-15',8000,'2011-12-20',0),('PR18','R2','electronics','mobile','samsung a50','samsung','2012-03-26',19999,'2013-08-15',0),('PR19','R3','novels','horror','CliffsNotes on Tolstoy\'s Anna Karenina','Marianne Sturman','2011-03-09',260,'2013-05-22',0),('PR2','R16','electronics','laptop','dell inspiron','dell','2011-04-23',19900,'2012-10-21',0),('PR20','R18','novels','fiction','Tolstoy: Anna Karenina','Anthony Thorlby','2007-04-11',400,'2007-04-13',0),('PR21','R6','novels','fiction','Across the black waters','Mulk Raj Anand','2008-07-09',2250,'2011-07-21',0),('PR22','R4','electronics','laptop','dell g3 gaming','dell','2009-08-29',18990,'2010-08-27',0),('PR23','R2','novels','romantic','A Flight of Pigeons','Ruskin Bond','2007-08-22',900,'2009-01-15',0),('PR24','R17','electronics','tv','micromax fullhd tv','micromax','2011-11-13',1000,'2013-02-09',0),('PR25','R4','novels','horror','New Hope for the Dead ','James Lee Burke','2008-08-12',99,'2010-11-15',0),('PR26','R19','clothes','denime','men\'s blue jeans','raymond',NULL,1000,'2014-02-07',0),('PR27','R5','electronics','laptop','acer gaming','acer','2010-06-29',20000,'2014-12-07',0),('PR28','R4','electronics','tablet','apple ipad 8','apple','2015-01-23',12000,'2015-08-25',0),('PR29','R11','electronics','mobile','iphone 9','apple','2009-08-14',18499,'2011-02-10',0),('PR3','R10','clothes','tshirt','mimi tshirt','Zudio',NULL,400,'2014-09-02',0),('PR30','R6','novels','romantic','The death of truth','Keay Davidson','2008-01-29',920,'2011-04-16',0),('PR31','R17','clothes','tshirt','orange tshirt','Zudio',NULL,650,'2014-03-11',0),('PR32','R11','electronics','laptop','asus tuf','asus','2009-02-10',12890,'2010-01-21',0),('PR33','R18','novels','mysterious','Wrinkles in Time','George Smoot','2012-01-18',1270,'2013-02-10',0),('PR34','R19','novels','mysterious','The Inferno','Dan Brown','2007-05-30',1400,'2011-11-27',0),('PR35','R13','novels','thriller','The Blue Umbrella','Ruskin Bond','2010-03-06',320,'2013-02-13',0),('PR36','R3','clothes','tshirt','Its afternoon relax','Zudio',NULL,300,'2012-05-22',0),('PR37','R5','clothes','jacket','cold jacket','first cry',NULL,700,'2010-09-29',0),('PR38','R5','novels','mysterious','The lost symbol','Dan Brown','2010-07-23',1800,'2011-05-26',0),('PR39','R14','electronics','mobile','micromax i20','micromax','2008-10-09',2000,'2011-08-28',0),('PR4','R17','electronics','mobile','samsung galaxy','samsung','2008-06-12',3770,'2010-10-23',0),('PR40','R3','electronics','mobile','xiaomi note9','xiaomi','2013-07-05',12500,'2013-08-04',0),('PR41','R4','novels','mysterious','Harry Potter Boxed Set','J.K. Rowling','2008-05-02',1600,'2009-03-01',0),('PR42','R19','clothes','denime','ladies denime','raymond',NULL,900,'2009-09-29',0),('PR43','R18','novels','thriller','A life at work','Thomas Moore','2008-05-02',1840,'2011-04-21',0),('PR44','R17','clothes','shirt','black shirt','raymond',NULL,550,'2011-05-21',0),('PR45','R1','electronics','tv','samsung led 10','samsung','2010-04-22',5000,'2015-08-07',0),('PR46','R11','electronics','laptop','hp pavillion','hp','2009-01-11',19000,'2013-03-10',0),('PR5','R2','novels','thriller','Fantastic Beats','J.K. Rowling','2007-12-02',200,'2008-12-05',0),('PR6','R16','electronics','mobile','samsung m30','samsung','2010-03-11',14999,'2010-05-15',0),('PR7','R3','electronics','tv','micromax curvetv','micromax','2010-05-07',22000,'2010-05-15',0),('PR8','R5','novels','fiction','Henry Miller on Writing','Henry Miller','2007-06-05',750,'2010-03-21',0),('PR9','R18','novels','horror','War and Piece','Amy Madelker','2012-07-06',920,'2012-11-07',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `purchase_id` varchar(4) NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` varchar(4) DEFAULT NULL,
  `purchase_price` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES ('PU1',28,'PR34',1400,1,'2019-10-03'),('PU10',7,'PR11',4500,1,'2020-05-19'),('PU11',8,'PR1',1550,1,'2019-09-20'),('PU12',23,'PR20',400,1,'2020-07-20'),('PU13',22,'PR45',5000,1,'2020-02-06'),('PU14',20,'PR18',19999,1,'2020-04-27'),('PU15',27,'PR42',900,2,'2020-02-27'),('PU16',13,'PR3',400,5,'2020-08-07'),('PU17',11,'PR16',50000,1,'2020-02-01'),('PU18',5,'PR20',400,6,'2020-07-01'),('PU19',10,'PR27',20000,1,'2020-01-18'),('PU2',14,'PR16',50000,1,'2020-08-18'),('PU20',7,'PR29',18499,2,'2019-09-15'),('PU3',4,'PR14',1500,1,'2019-12-29'),('PU4',14,'PR4',3770,1,'2019-09-29'),('PU5',7,'PR4',3770,2,'2020-03-03'),('PU6',25,'PR30',920,1,'2020-03-21'),('PU7',8,'PR9',920,1,'2019-12-16'),('PU8',15,'PR20',400,1,'2019-10-17'),('PU9',17,'PR27',20000,1,'2020-02-10');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailers`
--

DROP TABLE IF EXISTS `retailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retailers` (
  `retailer_id` varchar(3) NOT NULL,
  `retailer_name` varchar(40) NOT NULL,
  `retailer_city` varchar(20) NOT NULL,
  `retailer_emal` varchar(45) NOT NULL,
  PRIMARY KEY (`retailer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailers`
--

LOCK TABLES `retailers` WRITE;
/*!40000 ALTER TABLE `retailers` DISABLE KEYS */;
INSERT INTO `retailers` VALUES ('R1','VijayaSales','Ahmedabad','vijayaSales@email.com'),('R10','Fashion Store','Ahmedabad','fashion.store@email.com'),('R11','General electronics','Kochi','general.electronics@email.com'),('R12','Today wear','Hyderabad','today.wear@email.com'),('R13','Your study mate','Guwahati','your.study.mate@email.com'),('R14','Best store','Ahmedabad','best.store@email.com'),('R15','Manoranjan store','Sydney','manoranjan.store@email.com'),('R16','joy place','Sydney','joy.place@email.com'),('R17','Pramukh store','Delhi','pramukh.store@email.com'),('R18','Books are friends','Mumbai','booksare.friends@email.com'),('R19','Your own shop','Melborne','your.ownshop@email.com'),('R2','A-one Store','Mumbai','a1.store@email.com'),('R20','Maha electrnics','Melborne','maha.electrnics@email.com'),('R3','All in one store','Chennai','All.in1store@email.com'),('R4','Bharat suppliers','Delhi','bharat.suppliers@email.com'),('R5','India mart','Kolkata','indiamart@email.com'),('R6','Pustak Store','Ahmedabad','pustak.store@email.com'),('R7','Elite Electronics','Mumbai','elite.electronics@email.com'),('R8','PhoneWale','Hyderabad','phonewale@email.com'),('R9','Tech Latest','Bangalore','tech.latest@email.com');
/*!40000 ALTER TABLE `retailers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` varchar(5) NOT NULL,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `product_id` varchar(4) NOT NULL,
  `purchase_id` varchar(4) NOT NULL,
  `rating` int NOT NULL,
  `review` text,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`),
  KEY `purchase_id` (`purchase_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('RE1',14,'Raman','PR4','PU4',5,'Great the processing speed is fast. Good buy'),('RE10',8,'Chris','PR1','PU11',4,'Best fit'),('RE11',23,'Robertson','PR20','PU12',5,'Color combination is perfectly suited to urban world'),('RE12',7,'Manas','PR29','PU20',3,'Perfect size, and every gets impressed'),('RE13',25,'Sunil','PR30','PU6',4,'The camera is very good, even dark.'),('RE14',20,'Moore','PR18','PU14',5,'Good book. But don\'t gift to your parents.'),('RE15',28,'Ahmad','PR34','PU1',3,'Complete formal wear'),('RE16',5,'Wu','PR20','PU18',5,'amazing laptop for professionals'),('RE17',27,'JeJe','PR42','PU15',2,'hats off to whom, who tailored this'),('RE18',8,'Chris','PR9','PU7',3,'best wear for couples and singles as well'),('RE19',15,'Edu','PR20','PU8',1,'not able to insert USB in inside. Help'),('RE2',7,'Manas','PR11','PU10',2,'The samrt phone is not off expected quality. It hangs suddenly sometimes. '),('RE20',13,'Suresh','PR3','PU16',1,'Charger wire missing. Poor service'),('RE3',17,'Het','PR27','PU9',4,'Best buy for normal user, having abount less then 8 hours usuage.  It has one bug that it hangs suddenly sometimes. '),('RE4',11,'Xavier','PR16','PU17',3,'The view of the leaptop becomes blue when vied at a tilted angle. '),('RE5',4,'Edu','PR14','PU3',4,'The battery last very longer. Complete satisfaction the performanace. '),('RE6',14,'Raman','PR16','PU2',2,'Phone not up to the mark. Even if fell at heiht of 1 m  it gets damaged, Complete waste don’t buy'),('RE7',10,'David','PR27','PU19',5,'Good to spend night reading with'),('RE8',22,'Manoj','PR45','PU13',4,'Best books to be gifted to freiend'),('RE9',7,'Manas','PR4','PU5',1,'speed of processor is not as claimed. I am returing it company');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `sign_up` datetime(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ajay','Shah','Ahmedabad','3885318267','ajay.shah@email.com','Tnz,S799','2016-12-17 15:03:59.0'),(2,'Bernard','Wslq','Berlin','5930723887','bernard.wslq@email.com','Mnb03772','2019-08-27 23:45:03.0'),(3,'Gibson','Buar','Kingston','5509097232','gibson.buar@email.com','Iyp/3951','2019-06-11 05:42:05.0'),(4,'Edu','Zlxw','Hongkong','2781274373','edu.zlxw@email.com','Gzl+T400','2017-01-20 15:44:02.0'),(5,'Wu','Yagi','Tokyo','9559094703','wu.yagi@email.com','Unq&.230','2016-12-17 17:59:21.0'),(6,'Raman','Fxvf','Chennai','8458809020','raman.fxvf@email.com','Unq&.230','2016-12-17 17:59:21.0'),(7,'Manas','Nfmv','Madrid','2703738991','manas.nfmv@email.com','Zju(H950','2019-06-19 21:21:28.0'),(8,'Chris','Uttq','Dallas','6644901171','chris.uttq@email.com','Vuw2M476','2018-03-29 05:21:25.0'),(9,'Watson','Btkf','Ahmedabad','6123346438','watson.btkf@email.com','Lyx%M288','2020-10-25 22:28:52.0'),(10,'David','Ixkj','London','8001455646','david.ixkj@email.com','Oyw%Z213','2017-12-14 22:02:11.0'),(11,'Xavier','Mckf','Berlin','4466184883','xavier.mckf@email.com','Tqg\'O923','2018-12-23 21:38:03.0'),(12,'Deepak','Duds','Vadodara','8720665218','deepak.duds@email.com','Akw)8732','2018-12-17 05:41:13.0'),(13,'Suresh','Qnpa','Surat','7914589995','suresh.qnpa@email.com','Evs0=836','2017-03-07 22:12:32.0'),(14,'Raman','Yucb','Vellor','4736306686','raman.yucb@email.com','Nqg\'6405','2017-04-19 12:08:54.0'),(15,'Edu','Pqji','Madrid','9107543821','edu.pqji@email.com','Blw#@55','2020-03-18 01:45:14.0'),(16,'Munnedra','Mira','Hyderabad','8714390596','munnedra.mira@email.com','Faj$6330','2017-05-01 03:56:13.0'),(17,'Het','Whqw','Vadodara','8632054891','het.whqw@email.com','Aoq./686','2018-10-04 08:59:38.0'),(18,'Turner','Vtvt','Stretford','6631106253','turner.vtvt@email.com','Zvp)H232','2018-12-13 16:35:01.0'),(19,'Wallace','Rghl','New Mills','4927602042','wallace.rghl@email.com','Qqt2O268','2019-10-27 07:25:05.0'),(20,'Moore','Zqjw','Alexandria','7822111630','moore.zqjw@email.com','Kaj&O973','2018-10-12 09:36:19.0'),(21,'Mason','Ljqa','Madrid','9377824132','mason.ljqa@email.com','Anm-Y944','2018-06-20 15:30:49.0'),(22,'Manoj','Nwvu','Delhi','6275271752','manoj.nwvu@email.com','Uws1:701','2020-07-05 10:01:47.0'),(23,'Robertson','Wdlo','Madrid','6258517009','robertson.wdlo@email.com','Rdf/:492','2020-05-28 17:48:25.0'),(24,'Wright','Nsth','Anniston','5267155759','wright.nsth@email.com','Xdn&/72','2019-02-08 20:05:38.0'),(25,'Sunil','Rqly','Mumbai','2372458342','sunil.rqly@email.com','Nce#1951','2017-05-06 21:58:01.0'),(26,'Liston','Fpzw','Goa','9204897850','liston.fpzw@email.com','Nxr#F741','2018-12-15 06:07:11.0'),(27,'JeJe','Kixy','Shilong','7354431389','jeje.kixy@email.com','Nuk*@531','2020-05-21 10:05:21.0'),(28,'Ahmad','Osbw','Kochi','7922446781','ahmad.osbw@email.com','Jvm&7899','2017-06-03 20:50:18.0'),(29,'Farjan','Rrnr','Ahmedabad','8082412423','farjan.rrnr@email.com','Udi\'J636','2017-09-16 07:53:07.0'),(30,'Mukund','Iing','Vadodara','2888313215','mukund.iing@email.com','Jxq,V155','2019-08-08 07:45:29.0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `views` (
  `user_id` int NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `view_datetime` datetime(1) NOT NULL,
  PRIMARY KEY (`user_id`,`view_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,'PR4','2020-12-13 20:46:26.0'),(1,'PR4','2021-01-14 18:10:33.0'),(2,'PR3','2019-06-07 20:25:50.0'),(2,'PR32','2020-10-28 21:03:02.0'),(2,'PR1','2021-01-29 06:07:34.0'),(3,'PR7','2017-08-05 12:26:55.0'),(3,'PR10','2019-01-13 18:41:10.0'),(3,'PR30','2019-09-19 13:54:47.0'),(3,'PR24','2020-12-02 00:23:39.0'),(7,'PR4','2019-10-10 19:02:57.0'),(8,'PR4','2021-01-05 22:28:17.0'),(8,'PR1','2021-01-15 08:11:01.0'),(9,'PR4','2021-01-13 15:07:33.0'),(10,'PR17','2019-05-22 08:23:35.0'),(10,'PR24','2020-12-06 09:44:38.0'),(11,'PR72','2017-11-01 09:04:44.0'),(11,'PR34','2019-01-06 13:38:46.0'),(12,'PR52','2017-12-12 16:34:15.0'),(12,'PR77','2019-11-13 18:41:35.0'),(12,'PR1','2021-01-10 03:05:38.0'),(14,'PR59','2020-07-27 22:39:34.0'),(14,'PR1','2021-01-13 23:17:39.0'),(14,'PR4','2021-01-30 12:35:03.0'),(14,'PR1','2021-01-31 03:59:17.0'),(15,'PR37','2017-11-18 17:48:26.0'),(15,'PR63','2017-11-24 01:57:49.0'),(15,'PR50','2018-02-26 16:14:53.0'),(15,'PR11','2020-09-16 01:01:19.0'),(15,'PR24','2020-11-11 21:48:13.0'),(16,'PR54','2017-02-26 16:07:03.0'),(16,'PR66','2018-03-05 15:26:39.0'),(16,'PR46','2019-07-06 12:25:03.0'),(16,'PR65','2019-12-10 10:01:54.0'),(16,'PR4','2020-11-04 20:03:36.0'),(16,'PR1','2020-12-12 01:16:18.0'),(17,'PR4','2020-11-02 03:57:04.0'),(17,'PR1','2021-01-03 10:56:55.0'),(18,'PR57','2017-05-05 08:12:06.0'),(19,'PR15','2018-02-06 06:04:25.0'),(19,'PR18','2019-02-17 22:29:45.0'),(20,'PR45','2019-01-04 03:58:07.0'),(20,'PR1','2020-11-02 18:37:23.0'),(21,'PR38','2019-07-03 09:03:48.0'),(21,'PR24','2020-11-17 21:03:16.0'),(21,'PR1','2020-12-24 11:19:52.0'),(22,'PR6','2017-12-24 00:01:51.0'),(22,'PR71','2019-10-08 03:09:36.0'),(23,'PR42','2018-07-25 10:41:58.0'),(23,'PR21','2019-03-16 17:33:59.0'),(23,'PR4','2021-01-21 06:18:48.0'),(23,'PR24','2021-01-23 02:51:22.0'),(24,'PR64','2017-01-16 23:24:34.0'),(24,'PR9','2017-04-14 11:48:33.0'),(24,'PR26','2018-10-31 12:31:32.0'),(24,'PR4','2020-12-18 22:16:08.0'),(25,'PR12','2017-09-01 00:24:29.0'),(25,'PR67','2017-12-27 06:49:04.0'),(25,'PR24','2020-03-29 03:38:55.0'),(25,'PR24','2020-11-18 15:50:09.0'),(25,'PR1','2020-11-19 14:53:30.0'),(25,'PR4','2020-12-12 18:52:18.0'),(25,'PR24','2020-12-27 10:12:30.0'),(25,'PR24','2021-01-17 13:02:31.0'),(26,'PR48','2018-04-25 05:12:47.0'),(26,'PR25','2019-05-17 22:53:08.0'),(26,'PR24','2020-12-28 08:07:07.0'),(27,'PR68','2017-05-05 03:46:58.0'),(27,'PR76','2018-04-27 13:12:18.0'),(27,'PR61','2020-01-03 22:07:11.0'),(27,'PR79','2020-02-02 15:45:42.0'),(28,'PR31','2020-02-23 23:23:39.0'),(28,'PR1','2020-11-10 04:28:52.0'),(28,'PR24','2020-12-16 03:53:12.0'),(29,'PR40','2017-03-04 20:47:38.0'),(29,'PR4','2020-12-09 05:39:21.0'),(30,'PR70','2020-01-11 18:05:44.0'),(30,'PR24','2020-11-26 21:08:43.0'),(30,'PR1','2021-01-20 09:11:34.0');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 15:01:02
