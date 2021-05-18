-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: salon
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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Patronymic` varchar(50) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `RegistrationDate` datetime NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) NOT NULL,
  `PhotoPath` varchar(100) DEFAULT NULL,
  `gender_Code` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_gender1_idx` (`gender_Code`),
  CONSTRAINT `fk_client_gender1` FOREIGN KEY (`gender_Code`) REFERENCES `gender` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientservice`
--

DROP TABLE IF EXISTS `clientservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientservice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `StartTime` datetime NOT NULL,
  `Comment` longtext,
  `service_id` int DEFAULT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clientService_service1_idx` (`service_id`),
  KEY `fk_clientService_client1_idx` (`client_id`),
  CONSTRAINT `fk_clientService_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_clientService_service1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientservice`
--

LOCK TABLES `clientservice` WRITE;
/*!40000 ALTER TABLE `clientservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `Code` char(1) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `StartDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Natura Siberica','2018-01-20'),(2,'Биопин ФАРМА','2016-08-13'),(3,'Milotto','2016-06-19'),(4,'Лаборатория натуральной косметики MIXIT','2018-06-12'),(5,'Малавит','2017-09-18'),(6,'ANDALOU','2015-11-11'),(7,'Agent Netty PRO','2016-03-17'),(8,'ЕвроТек','2017-10-21'),(9,'Blue Beautifly','2017-01-15'),(10,'MATSESTA','2018-04-21'),(11,'АЙРОН БАРБЕР','2018-04-16'),(12,'РУСХИМТЕХ','2017-07-03'),(13,'НИКОЛЬ','2017-02-27'),(14,'Аравия','2015-06-23'),(15,'Алтэя','2018-05-14'),(16,'SHELK Cosmetics','2017-01-19'),(17,'Русская косметика','2015-07-19'),(18,'MAGIC HERBS','2016-02-23'),(19,'Natura Botanica','2016-05-02'),(20,'Bel Savon','2015-04-20'),(21,'ИРИДА-НЕВА','2017-05-27'),(22,'Славяна','2015-03-09'),(23,'АЛВА','2016-08-18'),(24,'Альпика','2018-05-31'),(25,'Жерминаль','2017-04-04'),(26,'Арт-Визаж','2018-04-15'),(27,'Валери-Д','2018-06-28'),(28,'Мастерская Fitoland Organic','2017-07-10'),(29,'ДОМ ПРИРОДЫ','2015-11-25'),(30,'Флора','2016-01-18'),(31,'ЭКО ТАВРИДА','2016-06-27'),(32,'АлтайЯ','2015-07-04'),(33,'Weleda','2015-04-14'),(34,'ANTI AGE','2015-11-01'),(35,'Колорит','2017-12-22'),(36,'SATIVA','2017-01-13'),(37,'Фитокосметик','2016-03-01'),(38,'Клеона','2017-10-29'),(39,'Живая косметика Сибири','2015-03-05'),(40,'SLAVIC HAIR Company','2015-12-20'),(41,'Green era','2017-07-28'),(42,'SIBERINA','2015-10-01'),(43,'Green Mama','2016-11-11'),(44,'Altanya','2015-03-23'),(45,'Черный бриллиант','2016-01-07'),(46,'BIOSelect','2016-12-29'),(47,'АромаВятка','2016-10-01'),(48,'VIQQO — производитель инновационной уходовой косметики','2017-10-12'),(49,'DIONY','2017-12-03'),(50,'AMSARVEDA','2015-12-11');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tilte` varchar(100) NOT NULL,
  `Cost` decimal(19,4) NOT NULL,
  `Description` longtext,
  `MainImagePath` varchar(100) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `manufacturer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_manufacturer1_idx` (`manufacturer_id`),
  CONSTRAINT `fk_product_manufacturer1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Ирисовый освежающий увлажняющий крем',720.0000,'','image\\1953276-1.jpg',1,21),(2,'Сыворотка для кожи вокруг глаз с гиалуроновой кислотой',690.0000,'','image\\9631447-1.jpg',1,22),(3,'Тоник для лица дневной  Витаминный ',800.0000,'','image\\7293278-1.jpg',1,22),(4,'Массажный крем для лица с увлажняющим и тонизирующим эффектом',740.0000,'','image\\6556449-1.jpg',1,5),(5,'Маска-пленка отшелушивающая с лифтинг-эффектом',860.0000,'','image\\6556452-1.jpg',1,5),(6,'Специальный крем для клеточного восстановления',920.0000,'','image\\6556466-1.jpg',0,22),(7,'Увлажняющий крем',730.0000,'','image\\1781678-1.jpg',0,22),(8,'Восстанавливающая маска для лица',630.0000,'','image\\3432465-1.jpg',0,27),(9,'Крем SILK для чувствительной кожи лица натуральный',740.0000,'','image\\9939701-1.jpg',1,35),(10,'Подарочный набор Сияние',630.0000,'','image\\6964198-1.jpg',1,13),(11,'Пена для бритья Натуральная  Лимон и Корица ',470.0000,'','image\\7528034-1.jpg',1,13),(12,'Крем питательный тонизирующий ночной',950.0000,'','image\\3388879-1.jpg',1,35),(13,'Подарочный набор Супер Увлажнение',830.0000,'','image\\6964197-1.jpg',1,13),(14,'Подарочный набор Глубокое Очищение',860.0000,'','image\\6964196-1.jpg',1,13),(15,'Тоник ACTIVE для возрастной кожи лица натуральный',720.0000,'','image\\9939709-1.jpg',1,22),(16,'Эфирное масло мелиссы',380.0000,'','image\\7064333-1.jpg',1,31),(17,'Увлажняющая эмульсия для лица',910.0000,'','image\\6556463-1.jpg',1,22),(18,'Масло персиковое',280.0000,'','image\\6691688-1.jpg',1,5),(19,'Очищающая коллекция Ночной восстанавливающий крем для лица',570.0000,'','image\\3432453-1.jpg',1,13),(20,'Подарочный набор For HIM  Сильный мужчина ',900.0000,'','image\\7299377-1.jpg',1,13),(21,'Антивозрастная коллекция Освежающий тоник Цветочный',940.0000,'','image\\3432442-1.jpg',1,24),(22,'Розовый разглаживающий увлажняющий крем',890.0000,'','image\\1781679-1.jpg',1,13),(23,'Деликатный питательный крем',890.0000,'','image\\1781676-1.jpg',1,27),(24,'Масло сладкого миндаля',250.0000,'','image\\6691687-1.jpg',1,5),(25,'Эфирное масло жасмин',610.0000,'','image\\7064330-1.jpg',1,31),(26,'Натуральная пенка для умывания  с ароматом розового дерева ',750.0000,'','image\\6953177-1.jpg',0,28),(27,'Тоник для лица  для сухой и нормальной кожи',490.0000,'','image\\9631443-1.jpg',1,22),(28,'Эфирное масло лемонграсс',380.0000,'','image\\7064323-1.jpg',1,31),(29,'Ирисовый освежающий ночной крем',840.0000,'','image\\1781674-1.jpg',1,21),(30,'Деликатное очищающее молочко',680.0000,'','image\\1781675-1.jpg',1,27),(31,'Эфирное масло корицы',370.0000,'','image\\7064335-1.jpg',1,31),(32,'Очищающий гель для умывания',720.0000,'','image\\7847906-1.jpg',0,13),(33,'Солнцезащитный лосьон для лица и тела',830.0000,'','image\\6556469-1.jpg',1,22),(34,'Коллекция Кокосовая  Очищающая пенка для лица с экстрактами кактуса ',540.0000,'','image\\3472602-1.jpg',1,38),(35,'S.O.S. средство против локальных несовершенств кожи',870.0000,'','image\\7847905-1.jpg',1,1),(36,'Коллекция Сияние  Очищающая крем-пенка Лимон Мейера ',750.0000,'','image\\3472591-1.jpg',1,38),(37,'Подарочный набор Сияние и Красота',570.0000,'','image\\6964199-1.jpg',1,13),(38,'Маска-пленка для глубокого очищения пор',920.0000,'','image\\6556453-1.jpg',1,5),(39,'Ирисовый освежающий дневной крем',740.0000,'','image\\1781693-1.jpg',1,21),(40,'Деликатный увлажняющий крем',940.0000,'','image\\1781680-1.jpg',1,27),(41,'Ухаживающее масло  против сухости кожи ',410.0000,'','image\\6953160-1.jpg',1,22),(42,'Розовое растительное мыло',470.0000,'','image\\1781711-1.jpg',1,13),(43,'Гранатовый дневной крем-лифтинг',800.0000,'','image\\1781695-1.jpg',1,27),(44,'Тонизирующее очищающее средство 2 в 1',640.0000,'','image\\2008488-1.jpg',1,22),(45,'Сыворотка для лица с гиалуроновой кислотой  для сухой и чувствительной кожи ',590.0000,'','image\\9631448-1.jpg',0,22),(46,'Эфирное масло лимона',330.0000,'','image\\7064322-1.jpg',1,31),(47,'Эфирное масло розовое дерево',510.0000,'','image\\7064326-1.jpg',0,31),(48,'Мягкая пенка для умывания',680.0000,'','image\\5625224-1.jpg',0,28),(49,'Сыворотка для лица с гиалуроновой кислотой  для нормальной кожи ',560.0000,'','image\\9631445-1.jpg',1,22),(50,'Тоник для лица  для жирной и проблемной кожи',600.0000,'','image\\9631442-1.jpg',1,22),(51,'Пенка для умывания  для сухой и чувствительной кожи',440.0000,'','image\\9631439-1.jpg',1,13),(52,'Антивозрастной крем для лица с органическими ягодами годжи',990.0000,'','image\\6433981-1.jpg',0,24),(53,'Эфирное масло эвкалипт',410.0000,'','image\\7064320-1.jpg',1,31),(54,'Сыворотка PERFECT SERUM депигментирующая натуральная',710.0000,'','image\\9939719-1.jpg',1,22),(55,'Крем для лица с антиоксидантами органической клюквы',980.0000,'','image\\6433979-1.jpg',0,35),(56,'Пенка для лица для чувствительной кожи',630.0000,'','image\\3472601-1.jpg',1,13),(57,'Коллекция Кокосовая  Укрепляющая сыворотка с экстрактами кактуса',680.0000,'','image\\3472604-1.jpg',1,38),(58,'Крем-маска WOW EFFECT омолаживающая для лица натуральная',950.0000,'','image\\9939704-1.jpg',1,35),(59,'Подарочный набор For MEN',840.0000,'','image\\7299378-1.jpg',1,13),(60,'Очищающий гель для нормальной и сухой кожи лица',720.0000,'','image\\6556458-1.jpg',1,13),(61,'Лифтинг-сыворотка для лица',930.0000,'','image\\6556462-1.jpg',0,4),(62,'Тоник для ухода за сухой и нормальной кожей',990.0000,'','image\\6556459-1.jpg',1,22),(63,'Питательный крем для лица',800.0000,'','image\\6556464-1.jpg',0,13),(64,'Крем против морщин для глаз',570.0000,'','image\\5427580-1.jpg',0,35),(65,'Лифтинг-сыворотка для лица с гиалуроновой кислотой',610.0000,'','image\\9631446-1.jpg',1,4),(66,'Деликатное питательное масло для лица',930.0000,'','image\\2262226-1.jpg',1,27),(67,'Тонизирующая сыворотка для лица',780.0000,'','image\\6556461-1.jpg',1,22),(68,'Масло праймер для лица (основа под макияж)  Выравнивание',530.0000,'','image\\6953159-1.jpg',1,5),(69,'Сыворотка COUPEROSE укрепляющая сосуды натуральная',590.0000,'','image\\9939714-1.jpg',1,22),(70,'Органический тонер с экстрактом Розы',960.0000,'','image\\7889950-1.jpg',1,13),(71,'Пенка для умывания  для жирной и комбинированной кожи  для жирной и комбинированной кожи ',780.0000,'','image\\9631437-1.jpg',1,13),(72,'Маска для лица увлажняющая и тонизирующая',860.0000,'','image\\6556451-1.jpg',1,5),(73,'Эфирное масло чайного дерева',410.0000,'','image\\7064334-1.jpg',1,31),(74,'Очищающий гель для комбинированной и жирной кожи лица',980.0000,'','image\\6556457-1.jpg',1,13),(75,'Масло после бритья Натуральное  Лимон и Корица ',300.0000,'','image\\7528031-1.jpg',1,5),(76,'Ухаживающее масло для лица  восстанавливает кожу ',420.0000,'','image\\6953176-1.jpg',1,22),(77,'Подарочный набор Мягкое Очищение',850.0000,'','image\\6964195-1.jpg',1,13),(78,'Гранатовый ночной крем-лифтинг',560.0000,'','image\\1781696-1.jpg',1,27),(79,'Живительный тоник для лица',770.0000,'','image\\2008486-1.jpg',0,39),(80,'Универсальный питательный крем SKIN FOOD',640.0000,'','image\\2351755-1.jpg',1,22),(81,'Органическое 100% аргановое масло',760.0000,'','image\\6433982-1.jpg',1,13),(82,'Пенка для умывания  для нормальной кожи',400.0000,'','image\\9631438-1.jpg',1,13),(83,'Крем PERFECT выравнивающий тон лица натуральный',780.0000,'','image\\9939700-1.jpg',1,35),(84,'Чистящая пена-гель для лица',550.0000,'','image\\2697586-1.jpg',1,45),(85,'Пенка для умывания Натуральная  Лимон и корица',280.0000,'','image\\7528032-1.jpg',1,13),(86,'Масло для лица массажное  с эффектом Лифтинга',500.0000,'','image\\6953169-1.jpg',0,5),(87,'Увлажняющий 24-часовой крем против морщин',910.0000,'','image\\2697576-1.jpg',1,22),(88,'Подарочный набор Travel  в Командировку  мужской',880.0000,'','image\\7299376-1.jpg',1,13),(89,'Тоник для ухода за жирной и комбинированной кожей',800.0000,'','image\\6556460-1.jpg',1,22),(90,'Тонизирующий крем для лица',800.0000,'','image\\6556465-1.jpg',1,22),(91,'Восстанавливающий крем для лица с органическим шиповником',960.0000,'','image\\6433984-1.jpg',1,27),(92,'Эфирное масло перечной мяты',390.0000,'','image\\7064324-1.jpg',0,31),(93,'Тоник для лица  Успокаивающий  для всех типов кожи ',410.0000,'','image\\6953158-1.jpg',1,22),(94,'Эфирное масло бергамота',380.0000,'','image\\7064315-1.jpg',1,31),(95,'Гималайская грязевая маска восстанавливающая',640.0000,'','image\\6556455-1.jpg',1,27),(96,'Эфирное масло лаванды',570.0000,'','image\\7064314-1.jpg',1,31),(97,'Гималайская грязевая маска антиоксидантная',660.0000,'','image\\6556454-1.jpg',1,27),(98,'Гранатовая интенсивная сыворотка-лифтинг',720.0000,'','image\\1781670-1.jpg',1,27),(99,'Коллекция Кокосовая  Увлажняющий ночной крем с экстрактами кактуса',700.0000,'','image\\3472608-1.jpg',1,38),(100,'Тоник-пилинг для лица EXFOLIANT на основе фруктовых кислот натуральный',660.0000,'','image\\9939710-1.jpg',1,22);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productphoto`
--

DROP TABLE IF EXISTS `productphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productphoto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PhotoPath` varchar(100) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productPhoto_product1_idx` (`product_id`),
  CONSTRAINT `fk_productPhoto_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productphoto`
--

LOCK TABLES `productphoto` WRITE;
/*!40000 ALTER TABLE `productphoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `productphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsale`
--

DROP TABLE IF EXISTS `productsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SaleDate` datetime NOT NULL,
  `Quantity` int NOT NULL,
  `clientService_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productSale_clientService1_idx` (`clientService_id`),
  KEY `fk_productSale_product1_idx` (`product_id`),
  CONSTRAINT `fk_productSale_clientService1` FOREIGN KEY (`clientService_id`) REFERENCES `clientservice` (`id`),
  CONSTRAINT `fk_productSale_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsale`
--

LOCK TABLES `productsale` WRITE;
/*!40000 ALTER TABLE `productsale` DISABLE KEYS */;
INSERT INTO `productsale` VALUES (1,'2019-09-29 08:59:34',2,NULL,44),(2,'2019-12-15 19:02:56',1,NULL,21),(3,'2019-02-17 11:39:54',2,NULL,97),(4,'2019-04-01 08:42:31',3,NULL,36),(5,'2019-01-01 15:08:49',2,NULL,88),(6,'2019-05-25 08:08:27',3,NULL,42),(7,'2019-07-29 13:37:35',3,NULL,4),(8,'2019-03-27 12:18:33',2,NULL,43),(9,'2019-10-23 18:53:31',3,NULL,76),(10,'2019-03-03 08:32:34',3,NULL,87),(11,'2019-02-18 14:44:42',2,NULL,86),(12,'2019-10-03 19:54:58',1,NULL,96),(13,'2019-11-12 18:41:34',1,NULL,22),(14,'2019-02-12 17:09:02',1,NULL,80),(15,'2019-11-01 15:39:50',3,NULL,3),(16,'2019-06-10 11:07:03',2,NULL,90),(17,'2019-06-22 12:07:06',3,NULL,7),(18,'2019-07-16 11:31:38',2,NULL,14),(19,'2019-01-07 11:22:57',1,NULL,86),(20,'2019-07-14 10:29:21',2,NULL,58),(21,'2019-11-17 17:57:46',2,NULL,67),(22,'2019-08-25 18:00:11',3,NULL,32),(23,'2019-06-07 10:05:11',3,NULL,86),(24,'2019-02-08 16:40:39',3,NULL,76),(25,'2019-01-12 15:11:05',2,NULL,12),(26,'2019-05-16 10:42:57',1,NULL,98),(27,'2019-05-25 15:29:20',1,NULL,58),(28,'2019-12-26 19:39:58',3,NULL,95),(29,'2019-07-29 13:38:09',1,NULL,46),(30,'2019-12-31 16:42:58',2,NULL,28),(31,'2019-03-08 10:24:21',3,NULL,25),(32,'2019-08-12 09:17:22',2,NULL,45),(33,'2019-11-18 08:33:45',3,NULL,23),(34,'2019-08-06 13:21:49',2,NULL,85),(35,'2019-02-25 16:25:11',2,NULL,66),(36,'2019-05-28 09:56:47',1,NULL,35),(37,'2019-11-24 13:21:32',1,NULL,76),(38,'2019-10-03 11:04:12',2,NULL,96),(39,'2019-10-11 13:27:50',2,NULL,70),(40,'2019-11-23 16:12:05',1,NULL,33),(41,'2019-07-25 18:52:26',1,NULL,58),(42,'2019-08-21 10:39:22',2,NULL,12),(43,'2019-04-09 12:02:17',2,NULL,97),(44,'2019-10-10 11:39:43',3,NULL,57),(45,'2019-07-03 16:52:30',2,NULL,86),(46,'2019-03-25 09:35:21',2,NULL,78),(47,'2019-09-22 16:57:19',3,NULL,3),(48,'2019-03-03 18:35:05',1,NULL,69),(49,'2019-08-21 17:01:40',3,NULL,76),(50,'2019-03-11 17:02:02',3,NULL,94),(51,'2019-04-28 08:46:31',1,NULL,83),(52,'2019-12-27 16:58:35',2,NULL,76),(53,'2019-12-09 11:56:02',3,NULL,16),(54,'2019-10-02 17:30:21',1,NULL,89),(55,'2019-11-18 17:32:43',3,NULL,83),(56,'2019-01-28 17:01:30',2,NULL,30),(57,'2019-10-22 12:34:59',3,NULL,23),(58,'2019-09-06 12:57:51',2,NULL,32),(59,'2019-12-04 13:10:28',2,NULL,84),(60,'2019-04-10 13:43:06',2,NULL,19),(61,'2019-02-13 16:49:50',1,NULL,45),(62,'2019-08-12 09:33:21',1,NULL,92),(63,'2019-02-05 10:48:29',1,NULL,45),(64,'2019-11-02 16:32:41',1,NULL,78),(65,'2019-11-03 13:25:34',3,NULL,26),(66,'2019-02-25 18:04:08',1,NULL,15),(67,'2019-05-15 15:17:17',1,NULL,6),(68,'2019-02-03 08:37:25',3,NULL,57),(69,'2019-08-06 14:38:35',3,NULL,17),(70,'2019-01-09 10:46:52',1,NULL,92),(71,'2019-04-08 08:45:46',2,NULL,85),(72,'2019-06-10 15:57:53',2,NULL,13),(73,'2019-11-06 10:21:22',2,NULL,96),(74,'2019-05-16 16:19:03',3,NULL,3),(75,'2019-11-27 17:14:17',2,NULL,85),(76,'2019-12-23 09:03:04',3,NULL,38),(77,'2019-06-23 14:33:36',1,NULL,58),(78,'2019-06-19 15:28:05',2,NULL,10),(79,'2019-11-29 15:53:06',2,NULL,91),(80,'2019-12-26 08:06:58',1,NULL,72),(81,'2019-07-08 15:21:09',3,NULL,20),(82,'2019-06-10 19:54:41',2,NULL,53),(83,'2019-03-01 12:00:30',1,NULL,91),(84,'2019-01-11 12:11:42',3,NULL,29),(85,'2019-12-08 16:58:50',3,NULL,13),(86,'2019-08-18 17:09:56',3,NULL,19),(87,'2019-07-10 17:54:19',1,NULL,17),(88,'2019-09-08 11:52:21',2,NULL,3),(89,'2019-07-16 09:44:46',2,NULL,100),(90,'2019-07-18 14:32:52',3,NULL,26),(91,'2019-03-31 14:53:31',3,NULL,55),(92,'2019-07-25 16:30:45',1,NULL,61),(93,'2019-07-11 16:30:13',1,NULL,63),(94,'2019-07-16 13:09:03',2,NULL,38),(95,'2019-11-23 12:58:02',1,NULL,6),(96,'2019-08-08 18:37:15',2,NULL,43),(97,'2019-03-20 18:47:06',3,NULL,25),(98,'2019-01-29 19:09:18',3,NULL,100),(99,'2019-10-18 18:40:13',2,NULL,63),(100,'2019-07-05 16:03:31',3,NULL,61);
/*!40000 ALTER TABLE `productsale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Cost` decimal(19,4) NOT NULL,
  `DurationSecond` int NOT NULL,
  `Description` longtext,
  `Discount` double DEFAULT NULL,
  `MainImagePath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicephoto`
--

DROP TABLE IF EXISTS `servicephoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicephoto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PhotoPath` varchar(100) NOT NULL,
  `service_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_servicePhoto_service_idx` (`service_id`),
  CONSTRAINT `fk_servicePhoto_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicephoto`
--

LOCK TABLES `servicephoto` WRITE;
/*!40000 ALTER TABLE `servicephoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicephoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Login` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role1_idx` (`role_id`),
  CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-16 14:48:03
