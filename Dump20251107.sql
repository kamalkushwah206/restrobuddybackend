CREATE DATABASE  IF NOT EXISTS `restrobuddy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `restrobuddy`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: restrobuddy
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `restaurantid` int(11) DEFAULT NULL,
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(45) DEFAULT NULL,
  `icon` text,
  `createdat` text,
  `updatedat` text,
  PRIMARY KEY (`categoryid`),
  KEY `rd_cat_rid_idx` (`restaurantid`),
  CONSTRAINT `rd_cat_rid` FOREIGN KEY (`restaurantid`) REFERENCES `restaurant` (`restaurantid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (19,2,'Sweets','6b93fd46-7922-4619-b537-9422f2e3a197.avif','Sun May 18 2025 20:44:26 GMT+0530 (India Standard Time)','Sun May 18 2025 20:44:26 GMT+0530 (India Standard Time)'),(19,4,'South Indian','2640d215-27b2-4305-923a-2c02b9d15d2d.webp','Sun May 18 2025 20:46:49 GMT+0530 (India Standard Time)','Sun May 18 2025 20:46:49 GMT+0530 (India Standard Time)'),(19,5,'Italian','dbc85745-ca16-4162-bd94-93f696f23a98.jpg','2025-05-18T15:27:28.858Z','2025-05-18T15:27:28.858Z'),(19,6,'Fast Food','0cb43fbc-fffa-4fbb-8505-fbe7d18d03e4.png','2025-05-18T15:51:58.290Z','2025-05-18T15:51:58.290Z');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `stateid` int(11) DEFAULT NULL,
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cityid`),
  KEY `res_city_st_idx` (`stateid`),
  CONSTRAINT `res_city_st` FOREIGN KEY (`stateid`) REFERENCES `states` (`stateid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,100,'Gwalior'),(1,101,'Indore'),(1,102,'Bhopal'),(2,103,'Lucknow'),(2,104,'Agra'),(2,105,'Jhansi'),(3,106,'Ahmedabad'),(3,107,'Surat'),(3,108,'Jamnagar');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fooditem`
--

DROP TABLE IF EXISTS `fooditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fooditem` (
  `restaurantid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategoryid` int(11) DEFAULT NULL,
  `foodid` int(11) NOT NULL AUTO_INCREMENT,
  `foodname` varchar(45) DEFAULT NULL,
  `foodtype` varchar(45) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `offerprice` decimal(10,2) DEFAULT NULL,
  `ingredients` text,
  `status` varchar(45) DEFAULT NULL,
  `icon` text,
  `createdat` text,
  `updatedat` text,
  `quantitytype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`foodid`),
  KEY `food_resid_idx` (`restaurantid`),
  KEY `food_cat_idx` (`categoryid`),
  KEY `food_scat_idx` (`subcategoryid`),
  CONSTRAINT `food_cat` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`),
  CONSTRAINT `food_resid` FOREIGN KEY (`restaurantid`) REFERENCES `restaurant` (`restaurantid`),
  CONSTRAINT `food_scat` FOREIGN KEY (`subcategoryid`) REFERENCES `subcategory` (`subcategoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooditem`
--

LOCK TABLES `fooditem` WRITE;
/*!40000 ALTER TABLE `fooditem` DISABLE KEYS */;
INSERT INTO `fooditem` VALUES (19,2,3,6,'Besan Ladoo','veg',450.00,100.00,'Besan, Sugar, Desi Ghee','available','9cd52f4d-5198-4ee3-899d-f35fe13aa836.jpg','2025-06-15T18:30:39.244Z','2025-06-15T18:30:39.244Z','250g,500g,1kg'),(19,2,3,7,'Atta Ladoo','veg',500.00,0.00,'Atta, Sugar, Ghee, Dry-Fruit','available','f20daca8-dd57-4ede-b8eb-27b65a8d2d02.jpg','2025-06-15T18:30:59.109Z','2025-06-15T18:30:59.109Z','250g,500g,1kg'),(19,2,3,8,'Coconut Ladoo','veg',400.00,50.00,'Coconut, Sugar','available','19f582d4-1bb5-4613-bf77-7b18dc5e92be.png','2025-06-15T18:31:08.036Z','2025-06-15T18:31:08.036Z','250g,500g,1kg'),(19,2,3,9,'Bundi Ladoo','veg',450.00,50.00,'Besan, Sugar, Desi Ghee','available','bebec32b-e7ab-4194-9160-f37046f0836c.jpg','2025-06-15T18:31:45.980Z','2025-06-15T18:31:45.980Z','250g,500g,1kg'),(19,2,5,10,'Khoya Barfi','veg',500.00,60.00,'Khoya, Sugar','available','ffd9bad3-0676-4f32-8248-f4964a301f84.png','2025-06-15T18:31:54.110Z','2025-06-15T18:31:54.110Z','250g,500g,1kg'),(19,2,5,11,'kaju katli','veg',1000.00,0.00,'cashew nuts, sugar and cardamom powder','available','94653127-1b75-4965-9ec3-b72643c9861b.jpg','2025-06-15T18:36:31.780Z','2025-06-15T18:36:31.780Z','250g,500g,1kg'),(19,2,6,12,'Kala Jamun','veg',450.00,30.00,'Khoya, Sugar, Ghee','available','d5e197f9-ec2c-40a0-aff0-402304c1296f.webp','2025-06-15T18:37:50.861Z','2025-06-15T18:37:50.861Z','250g,500g,1kg'),(19,2,6,13,'Small Jamun','veg',450.00,0.00,'Khoya, Sugar, Ghee','available','f83fc892-efad-41f9-b0fb-06241e74d517.png','2025-06-15T18:38:04.981Z','2025-06-15T18:38:04.981Z','250g,500g,1kg'),(19,2,6,14,'Gulab Jamun','veg',500.00,50.00,'Khoya, Sugar','available','fe13d69f-745a-4b21-b7c7-a56e5f9d44be.jpg','2025-06-15T18:38:25.191Z','2025-06-15T18:38:25.191Z','Half,Full'),(19,4,2,15,'Plan Dosa','veg',150.00,20.00,'Rice, Curd','available','e003982e-35da-4512-bbac-f63916bbfd39.jpg','2025-06-15T18:32:47.765Z','2025-06-15T18:32:47.765Z','Fixed'),(19,4,2,16,'Masala','veg',250.00,20.00,'Rice, potato , Urad & Chana dal ','available','8ffc73d7-b81b-4d6b-b384-51d1b2abcbeb.jpg','2025-06-15T18:32:57.461Z','2025-06-15T18:32:57.461Z','Fixed'),(19,4,2,17,'Rava Dosa','veg',150.00,0.00,'Rava, Potato','available','856b160e-2cf4-4c63-b3be-323193c2c87e.png','2025-06-15T18:33:40.348Z','2025-06-15T18:33:40.348Z','Fixed'),(19,4,8,18,'Sambar Vada','veg',200.00,30.00,'Rice, mixed vegetables','available','ad18ac94-7d06-448f-adb3-7e1579391903.jpg','2025-06-15T18:33:49.812Z','2025-06-15T18:33:49.812Z','Half,Full'),(19,4,9,19,'Vegetable Uttapam','veg',200.00,0.00,'Ravs, vegetables','available','acaf51d2-69fb-4268-89f0-361a6b752aab.jpg','2025-06-15T18:33:58.270Z','2025-06-15T18:33:58.270Z','Half,Full'),(19,4,9,20,'Chess Uttapam','veg',250.00,20.00,'Rava, Chess','available','f99c06f0-72a8-49a0-84b0-a80932d5046b.avif','2025-06-15T18:34:14.910Z','2025-06-15T18:34:14.910Z','Half,Full'),(19,5,4,21,' Margherita Pizza','veg',350.00,30.00,'Bubbly Crust, Crushed San Marzano Tomato Sauce, Fresh Mozzarella & basil','available','db7f3d5c-95af-4b6e-9d1c-797732e2bdd6.png','2025-06-15T18:38:47.956Z','2025-06-15T18:38:47.956Z','Fixed'),(19,5,4,22,'Paneer Barbeque Pizza','veg',400.00,0.00,'Indian spices and marinated paneer, this is a top choice among vegetarians','available','43287dab-f802-4b65-b534-b9ca81542200.jpg','2025-06-15T18:39:01.732Z','2025-06-15T18:39:01.732Z','Fixed'),(19,5,10,23,'Mix Sauce Pasta','veg',320.00,20.00,'Chees, Cream, Mixed Vegetable','available','633aaff8-6d4c-43c7-b9ee-ffe94e274833.webp','2025-06-15T18:39:10.380Z','2025-06-15T18:39:10.380Z','Half,Full');
/*!40000 ALTER TABLE `fooditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `restaurant` (
  `restaurantid` int(11) NOT NULL AUTO_INCREMENT,
  `restaurantname` varchar(45) DEFAULT NULL,
  `ownername` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `mobilenumber` varchar(45) DEFAULT NULL,
  `emailid` varchar(45) DEFAULT NULL,
  `url` text,
  `fssai` varchar(45) DEFAULT NULL,
  `gstno` varchar(45) DEFAULT NULL,
  `gsttype` varchar(45) DEFAULT NULL,
  `filefssai` text,
  `fileshopact` text,
  `filelogo` text,
  `address` varchar(45) DEFAULT NULL,
  `stateid` varchar(45) DEFAULT NULL,
  `cityid` varchar(45) DEFAULT NULL,
  `latlong` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `createdat` varchar(100) DEFAULT NULL,
  `updatedat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`restaurantid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (8,'Bikaner Wala','Mr K Agrawal','9827016348','7000350758','bikanervala@gmail.com','https://bikanervala.com','154578','154784654875249','18','29541af9-c8a9-4178-a610-8fc6a6a2a30d.jpg','f47c5b55-4615-48d2-876a-8f5616ccf6e9.webp','537b9d15-74b1-4076-aac5-ff5cea50680e.avif','Padav ','1','100','26/78','12345',0,'2025-05-06T04:57:42.554Z','2025-05-06T04:57:42.554Z'),(11,'Mc Donald\'s','Christopher John','9827016348','9301123085','mcdonald@gmail.com','https://www.mcdonalds.com','864578','102045681005789','18','2dbfa9d6-a3f9-4515-b824-0154c2df7aff.png','8e260ab7-9d95-4e5c-ae72-1ffd1ecbfe73.webp','e99c1e30-e7ba-444b-a36f-a3b9d1438d5c.png','Dindayal City mall','1','100','26/78','12345',0,'Tue May 06 2025 10:48:23 GMT+0530 (India Standard Time)','Tue May 06 2025 10:48:23 GMT+0530 (India Standard Time)'),(12,'Subway','Roark Capital','8982254897','8982214083','subway@gmail.com','https://www.subway.com','456878','400578984512354','28','d19b9f52-293e-4c94-a7d0-c1c981096f18.png','598e4d33-05ee-45fc-aaf3-0902092f7880.webp','3cf7efb7-c19a-4c4e-b5e7-96389bf61c22.webp','City Center','1','100','28/29','12345',0,'Tue May 06 2025 11:12:52 GMT+0530 (India Standard Time)','Tue May 06 2025 11:12:52 GMT+0530 (India Standard Time)'),(13,'Burger King','Ramesh Goyal','7000350758','8657446793','burgerking@gmail.com','https://www.bugerking.com','897547','100254879584012','28','bc07de5e-7922-49d5-8cc3-5f577afb8028.png','c2fee9a7-f120-4e4f-adbc-3d4b0da5dc47.webp','e7e1d122-66bd-4e75-915c-0d6261a6f549.webp','DB City Mall','1','100','26/78','12345',0,'Tue May 06 2025 11:16:53 GMT+0530 (India Standard Time)','Tue May 06 2025 11:16:53 GMT+0530 (India Standard Time)'),(14,'KFC','Yum! Brands','9827016348','9889746512','kfcindia@gmail.com','https://www.kfc.com','457895','456985751203251','28','dc0630af-25eb-40b1-98f3-b45d4b1bedbc.png','a920f685-e2fb-45af-ae16-cd09493c1737.webp','45a26225-c4a6-49e2-98be-7c38a84ae10b.webp','DB City Mall','1','100','26/28','12345',0,'Tue May 06 2025 11:23:26 GMT+0530 (India Standard Time)','Tue May 06 2025 11:23:26 GMT+0530 (India Standard Time)'),(15,'Haldiram\'s','Shiv Kishan Agarwal and Manohar Lal Agarwal','7000350765','9889746512','haldiram@gmail.com','https://www.haldirams.com','562415','100025789542157','28','553289aa-1d53-4068-9286-9eb0833b5a74.png','6088bf91-0087-4386-b3e2-abbd2a23b91b.webp','42905bdc-5f13-456e-9e7c-5a6cedc9dd56.webp','Shinde Ki Chavani','1','100','27/26','12345',0,'Tue May 06 2025 11:29:14 GMT+0530 (India Standard Time)','Tue May 06 2025 11:29:14 GMT+0530 (India Standard Time)'),(16,'Hira Sweets','Paras Sharma','7000350758','8999452360','hirasweets@gmail.com','https://www.hirasweets.com','789845','145658102500356','28','6e3b81e9-5501-4f4d-b2f6-ba2838a800de.png','ee117ccf-2b86-4ec8-acba-c6b48e501cab.webp','53a99e68-28cb-4749-bce2-887f5a380810.avif','City Center','1','100','28/30','12345',0,'Tue May 06 2025 11:35:39 GMT+0530 (India Standard Time)','Tue May 06 2025 11:35:39 GMT+0530 (India Standard Time)'),(17,'kwality ','Kainaz','6264234567','7000350758','kainaz@gmail.com','https://www.theobroma.com','Fssai:888784','870000549512354','18','8af1be5e-00ca-41d8-8daa-b38f047cb39a.png','11bf3df5-d675-4cb1-902c-2a92f0b8cd57.webp','00835c8c-f70d-4ea5-98cb-a9837b10bce2.jfif','City Center','1','100','26/27','12345',0,'2025-05-06T19:34:13.744Z','2025-05-06T19:34:13.744Z'),(18,'EatFit','Ankit Nagori','9908984561','8878984562','eatfit@gmail.com','https://www.eatfit.com','895874','100255453612547','18','89e2e701-298e-48ef-b348-6c621dc82304.png','81efaa8c-05c7-4bb9-baae-45895b27de6c.webp','6d94475c-f24e-4684-8cfe-7a9a6ce1659c.jpg','DB Mall','1','100','26/27','12345',0,'Tue May 06 2025 11:45:21 GMT+0530 (India Standard Time)','Tue May 06 2025 11:45:21 GMT+0530 (India Standard Time)'),(19,'Param Food Complex','Mukul Agrawal','9876563444','7400737711','param@gmail.com','https://www.paramfood.com','564545','166685479845325','28','bd5f4067-9582-44ab-a1a0-53058bf4c7d6.png','e4f60b6f-8e0e-4112-8e58-9ea99faaa203.webp','6e6e3119-a60d-4bc8-a8ab-8e6de190b3ca.avif',' Moti Mahal Road Padav','1','100','26/27','12345',0,'2025-05-18T03:13:56.407Z','2025-05-18T03:13:56.407Z'),(20,'Box 8','Amit Raj and Anshul Gupta','7000553456','9978665440','amit@gmail.com','https://www.box8.com','789845','100545876941254','28','6efd13b1-e219-4866-bccd-ac399ac60dc3.png','d4abb884-ddb9-4f1f-aa74-907bf118aeea.webp','46b011e4-410b-40be-8878-e0649ee47a93.jpg','City Center','1','100','26/28','12345',0,'2025-05-06T10:49:44.784Z','2025-05-06T10:49:44.784Z'),(21,'Bikkgane Biryani','Raymond Andrews and Aparna Andrews','9878996754','7000350758','bikkganebiryani@gmail.com','https://www.bikkganebiryani.com','Fssai:789854','125499586312458','28','67e5766d-92c3-40db-ae67-219fc8b59c8b.png','c72c0086-28b9-43c9-a2d2-8c6a1d345cd4.webp','711ff146-5609-41a1-a389-4d6743733a34.avif','Patel Nagar','1','100','26/27','12345',0,'Tue May 06 2025 12:22:01 GMT+0530 (India Standard Time)','Tue May 06 2025 12:22:01 GMT+0530 (India Standard Time)'),(22,'House Of Briyani','Mikhai Shahani','8876453422','9926784535','mikhai@gmail.com','https://www.hob.com','789845','256848792545621','28','4050e0a0-955b-4e75-b227-dba3151ee008.png','8e03d5b6-cd16-4706-907d-8abeec69c7f7.webp','d80a0038-c6a4-4caa-8b38-5169c9ffa081.jpg','Phoolbhag','1','100','26/27','12345',0,'2025-05-06T10:54:26.319Z','2025-05-06T10:54:26.319Z'),(23,'Naturals','Raghunandan Sriniwas Kamath','8878984562','7000350758','naturals@gmail.com','https://www.naturals.com','789854','125499586312458','28','4f27d8d3-05e0-48e7-8c09-43ebcb02f557.png','ac981ef3-7dba-4c89-b46c-f034c7308a27.webp','a898ca18-91d8-4715-a251-826038dcf75f.jpg','City Center','1','100','26/27','12345',0,'Tue May 06 2025 14:48:32 GMT+0530 (India Standard Time)','Tue May 06 2025 14:48:32 GMT+0530 (India Standard Time)'),(24,'Rolls king','Harshit Kumar','7000350758','9996459978','rollsking@gmail.com','https://www.rollsking.com','Fssai:752154','100005245621548','28','5cd17815-31eb-4c80-a8d9-896bca63f76d.png','7e99352c-79a2-45ea-8655-c57edf71b72e.webp','c1ac0224-da2a-403f-9ede-e48ee5b43440.jpg','Morar','1','100','26/27','12345',0,'Tue May 06 2025 14:54:15 GMT+0530 (India Standard Time)','Tue May 06 2025 14:54:15 GMT+0530 (India Standard Time)'),(25,'Starbucks','Brian Niccol','9878996754','7000350758','starbucks@gmail.com','https://www.starbucks','789854','125499586312458','28','2157e26a-2f4f-4f34-a38b-cf0cb593464e.png','1f99b1b6-1a56-4018-965f-efcfe17be2f7.webp','63a9bc78-b655-437d-ab80-e6f9309916b6.jpg','City Center','1','100','26/27','12345',0,'Tue May 06 2025 14:58:22 GMT+0530 (India Standard Time)','Tue May 06 2025 14:58:22 GMT+0530 (India Standard Time)');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantpictures`
--

DROP TABLE IF EXISTS `restaurantpictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `restaurantpictures` (
  `restaurantid` int(11) DEFAULT NULL,
  `pictureid` int(11) NOT NULL AUTO_INCREMENT,
  `picturetype` varchar(45) DEFAULT NULL,
  `pictures` text,
  PRIMARY KEY (`pictureid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantpictures`
--

LOCK TABLES `restaurantpictures` WRITE;
/*!40000 ALTER TABLE `restaurantpictures` DISABLE KEYS */;
INSERT INTO `restaurantpictures` VALUES (19,2,'Ambience','f3ca45bb-6d9d-49a2-a7a6-094f21ebd7f2.avif,2f4847e4-f040-404f-86be-29c25c5f4904.avif,184fde75-1dc4-44fa-83f0-c6c37e19e86b.avif,6b1a9e52-50a9-466c-b59f-d584e954a15a.avif'),(19,3,'Food','fab3e778-7d52-4d4b-ac75-cb6b471ab329.avif,e293272d-5382-47a7-9f73-be6380d2e66f.avif,65fb9ee6-b732-4453-a229-00bebee39d57.avif,6b1a9e52-50a9-466c-b59f-d584e954a15a.avif'),(19,4,'Menu','c9048344-a9ee-4d25-b624-d4e71608b038.avif,49c9eb67-ab74-4657-8da8-020739268939.avif'),(13,5,'Menu','c61e4207-0238-46f4-99aa-f8ac966b5064.avif'),(13,6,'Ambience','a5ba1fe4-8586-4b48-b284-9dadbff1b2db.webp,92b3a948-abb2-40a0-a882-0085836b2965.jpeg,608c46d1-610f-4cb0-9aa8-be26d4a2a03e.jpg'),(13,7,'Food','45ce94d9-548d-45f5-8c9a-a52ce6cf907b.avif,2c38a1c1-1752-42be-a336-fc2c7e18e9d7.avif,b127ba24-9a8f-440d-afb1-f59d391b2b6d.avif,4c2adcc9-c751-4639-a2b9-e6d4499e49df.jpg,6aae5b0f-1182-44bc-9b98-ad28459f8e38.jpg,8201ba3d-3cc2-40ec-bfc5-bda98b56f5da.avif'),(17,8,'Food','c55b6974-40af-4518-9312-8f8e2190c622.avif,5bd5b042-1a04-4596-a5f7-9387c109ccce.avif,ac5dcf31-2655-4904-aa90-2f433a7bcdbc.avif,7423fbca-af66-4164-b460-7580076b4e95.avif,dfd6e57b-aa0d-406d-a060-7f1d5074f92a.avif'),(17,9,'Ambience','8f2e0555-a8ff-4cb6-a0cd-72dde82adad4.avif,57b8113e-5e20-4494-97c4-41977c63077b.avif,d8dff772-c582-40d1-b033-8edc21db2c69.avif'),(17,10,'Menu','21fc799c-3e57-4bc5-aa19-784cf173994d.avif');
/*!40000 ALTER TABLE `restaurantpictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `states` (
  `stateid` int(11) NOT NULL,
  `statename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Madhya Pradesh'),(2,'Uttar Pradesh'),(3,'Gujrat');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subcategory` (
  `restaurantid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `subcategoryname` text,
  `icon` text,
  `createdat` text,
  `updatedat` text,
  PRIMARY KEY (`subcategoryid`),
  KEY `rb_sc_rid_idx` (`restaurantid`),
  KEY `rb_sc_cid_idx` (`categoryid`),
  CONSTRAINT `rb_sc_cid` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE,
  CONSTRAINT `rb_sc_rid` FOREIGN KEY (`restaurantid`) REFERENCES `restaurant` (`restaurantid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (19,4,2,'Dosa','b6ffde40-1a2e-43b7-b7b0-bb121ebf6590.webp','Sun May 18 2025 21:57:44 GMT+0530 (India Standard Time)','Sun May 18 2025 21:57:44 GMT+0530 (India Standard Time)'),(19,2,3,'Ladoo  ','67565da7-105c-40b8-9a6c-ebabb6834cec.webp','2025-05-20T13:48:18.106Z','2025-05-20T13:48:18.106Z'),(19,5,4,'Pizza','8b49093b-e0b5-4d38-8eff-9cf696ab2c9d.jpg','Sun May 18 2025 22:01:17 GMT+0530 (India Standard Time)','Sun May 18 2025 22:01:17 GMT+0530 (India Standard Time)'),(19,2,5,'Barfi','82413b69-715b-46eb-b6d6-9d8d6624312c.jpg','Mon May 19 2025 06:12:49 GMT+0530 (India Standard Time)','Mon May 19 2025 06:12:49 GMT+0530 (India Standard Time)'),(19,2,6,'Gulab Jamun','e90b171c-0553-4d69-be53-200d39b5c237.jpg','Mon May 19 2025 06:13:58 GMT+0530 (India Standard Time)','Mon May 19 2025 06:13:58 GMT+0530 (India Standard Time)'),(19,4,7,'Idli ','cdfe402b-2ef3-4b28-990e-c08ee36083b6.jpg','Mon May 19 2025 06:22:12 GMT+0530 (India Standard Time)','Mon May 19 2025 06:22:12 GMT+0530 (India Standard Time)'),(19,4,8,'Sambar Vada','c5197a74-d68d-4641-8ee1-a48d317c5eb5.jpg','Mon May 19 2025 06:23:11 GMT+0530 (India Standard Time)','Mon May 19 2025 06:23:11 GMT+0530 (India Standard Time)'),(19,4,9,'Uttapam','7bfa1314-7127-413b-80ec-4bdd98ed83f8.jpg','Mon May 19 2025 06:23:32 GMT+0530 (India Standard Time)','Mon May 19 2025 06:23:32 GMT+0530 (India Standard Time)'),(19,5,10,'Pasta','aae82e31-621e-4594-ad58-c082088e9147.png','Mon May 19 2025 06:41:13 GMT+0530 (India Standard Time)','Mon May 19 2025 06:41:13 GMT+0530 (India Standard Time)'),(19,6,11,'Burger','ae3c5b69-7a56-474b-a570-5f5cbc685204.avif','Mon May 19 2025 06:42:35 GMT+0530 (India Standard Time)','Mon May 19 2025 06:42:35 GMT+0530 (India Standard Time)'),(19,6,12,'Sandwich','8102f8af-4da6-442a-978b-129bd58d2c88.webp','Mon May 19 2025 06:44:20 GMT+0530 (India Standard Time)','Mon May 19 2025 06:44:20 GMT+0530 (India Standard Time)');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timing`
--

DROP TABLE IF EXISTS `timing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `timing` (
  `restaurantid` int(11) DEFAULT NULL,
  `timingid` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  `opentime` varchar(45) DEFAULT NULL,
  `closetime` varchar(45) DEFAULT NULL,
  `createdat` text,
  `updatedat` text,
  PRIMARY KEY (`timingid`),
  KEY `timing_res_idx` (`restaurantid`),
  CONSTRAINT `timing_res` FOREIGN KEY (`restaurantid`) REFERENCES `restaurant` (`restaurantid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timing`
--

LOCK TABLES `timing` WRITE;
/*!40000 ALTER TABLE `timing` DISABLE KEYS */;
INSERT INTO `timing` VALUES (19,1,'Open','11am','10pm','1/11/11','1/11/11'),(13,2,'Open','11 am','10 pm','11/11/11','11/11/11'),(17,3,'Open','11 am','10 pm','11/11/11','11/11/11'),(24,4,'1','2025-05-17T22:30:00.000Z','2025-05-17T20:40:00.000Z','2025-05-18T03:20:07.524Z','2025-05-18T04:20:37.779Z');
/*!40000 ALTER TABLE `timing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-07 21:55:33
