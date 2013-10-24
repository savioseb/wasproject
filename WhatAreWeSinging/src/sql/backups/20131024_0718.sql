-- MySQL dump 10.13  Distrib 5.6.14, for osx10.7 (x86_64)
--
-- Host: localhost    Database: wasdb
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `NonuniqueWordTable`
--

DROP TABLE IF EXISTS `NonuniqueWordTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NonuniqueWordTable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NonuniqueWordTable`
--

LOCK TABLES `NonuniqueWordTable` WRITE;
/*!40000 ALTER TABLE `NonuniqueWordTable` DISABLE KEYS */;
INSERT INTO `NonuniqueWordTable` VALUES (1,'there'),(2,'other'),(3,'name'),(4,'found'),(5,'through'),(6,'whom'),(7,'your'),(8,'cast'),(9,'darkest'),(10,'night'),(11,'that'),(12,'have'),(13,'song'),(14,'remains'),(15,'when'),(16,'every'),(17,'shall'),(18,'sing'),(19,'like'),(20,'never'),(21,'before'),(22,'comes'),(23,'whatever'),(24,'pass'),(25,'lies'),(26,'singing'),(27,'will'),(28,'keep'),(29,'thousand'),(30,'find'),(31,'failing'),(32,'draws'),(33,'near'),(34,'come'),(35,'still'),(36,'years'),(37,'then'),(38,'lift'),(39,'with'),(40,'thou'),(41,'heav‚äôn'),(42,'along'),(43,'rising'),(44,'things'),(45,'their'),(46,'once'),(47,'would'),(48,'first'),(49,'upon'),(50,'god‚äôs'),(51,'know'),(52,'yours'),(53,'could'),(54,'from'),(55,'only'),(56,'everything'),(57,'you‚äôre'),(58,'this'),(59,'thee'),(60,'unto'),(61,'must'),(62,'they'),(64,'twas'),(65,'thus'),(66,'i‚äôve'),(67,'been'),(68,'were'),(69,'‚äúforgive'),(70,'‚äúnor'),(71,'‚äúfather'),(72,'days'),(73,'raise');
/*!40000 ALTER TABLE `NonuniqueWordTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SongTable`
--

DROP TABLE IF EXISTS `SongTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SongTable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alternateName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SongTable`
--

LOCK TABLES `SongTable` WRITE;
/*!40000 ALTER TABLE `SongTable` DISABLE KEYS */;
INSERT INTO `SongTable` VALUES (1,'No Other Name','There is No Other Name'),(2,'10,000 Reasons','Ten Thousand Reasons, Bless The Lord O My Soul'),(3,'All Creatures of our God and King',NULL),(4,'All I have is Chirst','I once was lost'),(5,'All To Us','Precious Cornerstone, Sure Foundation'),(6,'All To You','ALL TO YOU THE KING OF KINGS'),(7,'Always','My Foes Are Many'),(8,'Amazing Grace','My Chains are Gone'),(9,'Amazing Love','You Are My King'),(10,'Arise My Soul Arise',NULL),(11,'Awesome Is The Lord Most High','Great are You Lord, Mighty in Strength'),(12,'Beautiful One','Wonderful so Wonderful, My Soul Must Sing');
/*!40000 ALTER TABLE `SongTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SongWordMapTable`
--

DROP TABLE IF EXISTS `SongWordMapTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SongWordMapTable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `songId` int(10) unsigned NOT NULL,
  `wordId` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `songId` (`songId`),
  KEY `wordId` (`wordId`),
  CONSTRAINT `songwordmaptable_ibfk_1` FOREIGN KEY (`songId`) REFERENCES `SongTable` (`id`),
  CONSTRAINT `songwordmaptable_ibfk_2` FOREIGN KEY (`wordId`) REFERENCES `WordTable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1734 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SongWordMapTable`
--

LOCK TABLES `SongWordMapTable` WRITE;
/*!40000 ALTER TABLE `SongWordMapTable` DISABLE KEYS */;
INSERT INTO `SongWordMapTable` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,3),(6,1,6,1),(7,1,7,1),(8,1,8,1),(9,1,9,1),(10,1,10,1),(11,1,11,1),(12,1,12,1),(13,1,13,1),(14,1,14,1),(15,1,15,1),(16,1,16,1),(17,1,17,1),(18,1,18,1),(19,1,19,1),(20,1,20,1),(21,1,21,1),(22,1,22,1),(23,1,23,1),(24,1,24,1),(25,1,25,1),(26,1,26,1),(27,1,27,1),(28,1,28,1),(29,1,29,6),(30,1,30,1),(31,1,31,1),(32,1,32,2),(35,2,5,1),(38,2,33,1),(39,2,34,2),(42,2,35,1),(45,2,36,2),(47,2,17,4),(48,2,18,1),(49,2,37,4),(51,2,38,1),(55,2,39,1),(58,2,40,1),(59,2,41,1),(65,2,42,4),(66,2,43,1),(68,2,44,1),(69,2,45,1),(71,2,46,1),(72,2,47,1),(74,2,16,1),(75,2,48,1),(81,2,49,1),(82,2,50,1),(92,3,51,1),(93,3,52,1),(94,3,53,1),(98,3,54,1),(103,3,55,1),(104,3,37,1),(111,3,56,1),(112,3,57,1),(115,3,40,1),(117,3,58,1),(120,3,59,19),(121,3,60,1),(123,3,61,2),(125,3,62,2),(126,3,63,1),(130,3,64,1),(133,3,65,1),(134,3,66,1),(135,3,67,1),(139,3,46,1),(140,3,69,1),(145,3,70,1),(147,3,71,1),(153,3,72,1),(154,3,73,1),(155,3,50,13),(156,3,74,1),(157,3,15,1),(159,4,75,1),(161,4,5,1),(167,4,76,1),(168,4,77,1),(169,4,78,1),(173,4,79,1),(179,4,23,1),(181,4,80,1),(183,4,29,1),(186,4,81,1),(187,4,82,1),(189,4,83,1),(190,4,84,1),(191,4,85,1),(198,4,86,3),(200,4,87,1),(204,4,88,1),(205,4,89,1),(207,4,90,1),(208,4,91,1),(211,4,92,1),(214,4,93,1),(216,4,94,1),(217,4,33,1),(221,4,95,1),(222,4,96,1),(223,4,97,1),(226,4,98,1),(227,4,99,1),(230,4,100,1),(236,4,30,1),(239,4,32,1),(240,4,101,2),(242,4,102,1),(243,4,103,1),(245,4,104,1),(247,4,105,1),(249,4,106,1),(250,4,65,1),(254,4,107,1),(256,4,16,1),(259,4,108,1),(263,4,109,1),(271,5,110,1),(274,5,111,1),(283,5,112,1),(284,5,113,1),(288,5,37,1),(293,5,114,1),(296,5,29,4),(298,5,115,1),(300,5,81,1),(301,5,116,2),(307,5,42,1),(314,5,117,1),(319,5,15,1),(327,5,92,1),(330,5,118,1),(334,5,33,1),(335,5,119,1),(340,5,120,1),(345,5,121,1),(356,5,30,1),(358,5,122,1),(359,5,123,1),(361,5,32,1),(366,5,124,1),(372,5,125,2),(373,5,126,1),(375,5,127,1),(379,5,128,1),(382,5,129,1),(383,5,130,1),(386,5,131,1),(388,5,132,1),(398,6,133,1),(400,6,6,1),(403,6,134,1),(405,6,34,1),(408,6,135,1),(411,6,76,1),(412,6,136,2),(416,6,137,1),(421,6,138,1),(423,6,17,1),(427,6,139,1),(433,6,140,1),(445,6,141,1),(447,6,142,1),(448,6,42,1),(449,6,143,1),(450,6,144,1),(452,6,64,3),(455,6,145,1),(461,6,146,1),(464,6,15,1),(467,6,147,1),(476,6,148,1),(477,6,118,2),(479,6,149,1),(498,6,150,1),(517,6,151,1),(527,6,66,1),(528,6,152,1),(530,6,153,1),(531,6,154,1),(532,6,155,1),(542,6,156,2),(543,6,157,1),(551,6,158,1),(552,6,50,2),(554,6,159,1),(558,7,160,2),(560,7,5,3),(562,7,161,1),(564,7,162,5),(579,7,163,1),(583,7,164,1),(586,7,17,1),(588,7,165,3),(593,7,166,1),(603,7,167,1),(610,7,168,1),(622,7,169,1),(624,7,170,1),(635,7,171,1),(649,7,172,5),(652,7,173,1),(654,7,174,1),(667,7,175,1),(679,7,176,1),(683,7,177,1),(708,7,178,1),(716,7,16,1),(721,7,132,1),(732,8,179,1),(735,8,5,1),(736,8,6,1),(739,8,180,1),(742,8,9,1),(752,8,79,1),(754,8,181,1),(760,8,23,7),(763,8,182,1),(766,8,183,1),(768,8,184,1),(770,8,185,1),(774,8,86,1),(780,8,186,1),(782,8,187,1),(785,8,188,2),(791,8,172,1),(793,8,189,1),(794,8,190,1),(795,8,191,1),(801,8,192,1),(802,8,193,1),(806,8,38,1),(809,8,194,1),(811,8,195,1),(814,8,32,1),(823,8,128,1),(824,8,130,1),(836,8,196,1),(837,8,197,1),(845,8,36,1),(850,8,166,1),(854,8,198,1),(855,8,28,1),(860,8,199,1),(862,8,200,1),(875,8,201,1),(878,8,202,1),(882,8,203,1),(884,8,91,1),(891,8,33,1),(903,8,204,1),(907,8,205,1),(913,8,103,1),(930,8,206,1),(934,8,207,1),(938,8,208,1),(958,9,209,2),(990,9,210,1),(994,9,188,2),(1027,9,211,1),(1052,9,212,1),(1061,9,18,1),(1063,9,26,1),(1068,9,29,2),(1084,9,64,5),(1093,9,171,1),(1098,9,72,1),(1099,9,213,1),(1103,9,214,1),(1105,9,33,2),(1108,9,10,1),(1137,9,215,2),(1139,9,216,1),(1149,9,217,1),(1158,10,218,1),(1173,10,219,1),(1175,10,220,1),(1177,10,221,4),(1181,10,17,3),(1183,10,222,5),(1189,10,23,1),(1190,10,223,1),(1192,10,224,1),(1195,10,225,1),(1196,10,226,1),(1208,10,227,1),(1220,10,228,1),(1223,10,229,1),(1225,10,230,2),(1227,10,231,1),(1228,10,232,1),(1231,10,172,1),(1232,10,233,1),(1233,10,149,16),(1234,10,234,2),(1237,10,235,1),(1243,10,236,1),(1258,10,237,1),(1265,10,238,1),(1267,10,239,1),(1271,10,240,1),(1272,10,128,1),(1273,10,241,1),(1275,10,242,1),(1279,10,243,2),(1282,10,27,3),(1290,10,244,2),(1294,10,245,2),(1295,10,246,1),(1299,10,247,1),(1300,10,248,1),(1303,10,249,1),(1309,10,250,2),(1316,10,28,2),(1325,10,251,2),(1344,10,252,2),(1347,10,91,1),(1349,10,253,2),(1350,10,72,2),(1353,10,254,2),(1355,10,255,2),(1356,10,256,1),(1359,10,94,2),(1360,10,33,1),(1362,10,257,1),(1366,10,258,1),(1367,10,259,1),(1370,10,260,1),(1371,10,261,1),(1380,10,122,1),(1384,10,262,1),(1389,10,62,1),(1396,10,65,3),(1401,10,178,1),(1406,10,263,1),(1411,10,264,1),(1416,10,265,1),(1418,10,266,1),(1419,10,267,1),(1425,11,5,4),(1447,11,268,1),(1482,11,269,1),(1492,11,92,1),(1498,11,118,1),(1503,11,189,1),(1509,11,96,1),(1539,11,240,1),(1544,11,16,1),(1545,11,131,1),(1551,11,49,1),(1552,11,270,1),(1553,11,50,2),(1554,11,158,3),(1567,11,271,3),(1571,11,272,1),(1594,11,273,1),(1600,11,274,3),(1613,11,275,1),(1628,11,276,1),(1635,11,277,1),(1649,11,121,1),(1660,11,262,1),(1662,11,278,1),(1664,11,101,2),(1689,11,279,1),(1699,11,280,1),(1700,12,281,1),(1701,12,282,1),(1702,12,283,1),(1703,12,284,1),(1704,12,161,1),(1705,12,215,1),(1706,12,33,3),(1707,12,110,1),(1708,12,285,1),(1709,12,286,1),(1710,12,287,1),(1711,12,130,1),(1712,12,288,1),(1713,12,289,3),(1714,12,36,3),(1715,12,290,6),(1716,12,131,1),(1717,12,291,1),(1718,12,292,1),(1719,12,17,7),(1720,12,156,1),(1721,12,293,1),(1722,12,294,2),(1723,12,295,1),(1724,12,296,1),(1725,12,297,1),(1726,12,298,1),(1727,12,299,1),(1728,12,80,1),(1729,12,270,1),(1730,12,300,1),(1731,12,148,1),(1732,12,301,1),(1733,12,81,1);
/*!40000 ALTER TABLE `SongWordMapTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WordTable`
--

DROP TABLE IF EXISTS `WordTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WordTable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WordTable`
--

LOCK TABLES `WordTable` WRITE;
/*!40000 ALTER TABLE `WordTable` DISABLE KEYS */;
INSERT INTO `WordTable` VALUES (1,'sorrow'),(2,'slain'),(3,'save'),(4,'crucified'),(5,'lord'),(6,'saviour'),(7,'delight'),(8,'cure'),(9,'endures'),(10,'died'),(11,'sinners'),(12,'knee'),(13,'victory'),(14,'tongue'),(15,'heaven'),(16,'strength'),(17,'soul'),(18,'again'),(19,'lamb'),(20,'worthy'),(21,'confess'),(22,'tears'),(23,'grace'),(24,'broken'),(25,'abounds'),(26,'rose'),(27,'throne'),(28,'fears'),(29,'jesus'),(30,'christ'),(31,'redeemed'),(32,'hope'),(33,'love'),(34,'time'),(35,'slow'),(36,'heart'),(37,'worship'),(38,'unending'),(39,'forevermore'),(40,'bless'),(41,'anger'),(42,'holy'),(43,'reasons'),(44,'kind'),(45,'dawning'),(46,'evening'),(47,'goodness'),(48,'rich'),(49,'great'),(50,'praise'),(51,'humbleness'),(52,'three'),(53,'sail'),(54,'wind'),(55,'rushing'),(56,'softer'),(57,'strong'),(58,'rejoice'),(59,'alleluia'),(60,'golden'),(61,'moon'),(62,'voice'),(63,'creatures'),(64,'king'),(65,'father'),(66,'creator'),(67,'lights'),(69,'clouds'),(70,'silver'),(71,'burning'),(72,'spirit'),(73,'beam'),(74,'gleam'),(75,'knew'),(76,'place'),(77,'choose'),(78,'alone'),(79,'promised'),(80,'displayed'),(81,'cross'),(82,'might'),(83,'beheld'),(84,'bore'),(85,'thought'),(86,'life'),(87,'helpless'),(88,'wrath'),(89,'hell'),(90,'reserved'),(91,'ransomed'),(92,'forever'),(93,'bound'),(94,'race'),(95,'rebel'),(96,'follow'),(97,'live'),(98,'grave'),(99,'cost'),(100,'refuse'),(101,'hallelujah'),(102,'boast'),(103,'lost'),(104,'commands'),(105,'state'),(106,'suffered'),(107,'indifferent'),(108,'loved'),(109,'looked'),(110,'over'),(111,'burns'),(112,'church'),(113,'waiting'),(114,'cornerstone'),(115,'saving'),(116,'face'),(117,'foundation'),(118,'world'),(119,'sent'),(120,'sure'),(121,'faithful'),(122,'lives'),(123,'passing'),(124,'measure'),(125,'believe'),(126,'righteousness'),(127,'flame'),(128,'precious'),(129,'passion'),(130,'mercy'),(131,'glory'),(132,'promise'),(133,'praised'),(134,'beyond'),(135,'lifted'),(136,'exalt'),(137,'serve'),(138,'compare'),(139,'exalted'),(140,'holiness'),(141,'eternity'),(142,'self'),(143,'kings'),(144,'space'),(145,'sustained'),(146,'hail'),(147,'living'),(148,'earth'),(149,'arise'),(150,'picture'),(151,'highest'),(152,'awesomeness'),(153,'author'),(154,'perfection'),(155,'rule'),(156,'majesty'),(157,'reign'),(158,'high'),(159,'eternal'),(160,'storm'),(161,'eyes'),(162,'help'),(163,'chaos'),(164,'hold'),(165,'always'),(166,'many'),(167,'delay'),(168,'ground'),(169,'trouble'),(170,'surrounding'),(171,'true'),(172,'fear'),(173,'abounding'),(174,'refuge'),(175,'foes'),(176,'against'),(177,'rest'),(178,'rise'),(179,'appear'),(180,'free'),(181,'wretch'),(182,'dangers'),(183,'toils'),(184,'brought'),(185,'snares'),(186,'safe'),(187,'hour'),(188,'amazing'),(189,'lead'),(190,'good'),(191,'long'),(192,'saved'),(193,'gone'),(194,'sweet'),(195,'sound'),(196,'reigns'),(197,'relieved'),(198,'secures'),(199,'shield'),(200,'home'),(201,'believed'),(202,'portion'),(203,'already'),(204,'flood'),(205,'word'),(206,'chains'),(207,'taught'),(208,'blind'),(209,'honor'),(210,'forgiven'),(211,'well'),(212,'accepted'),(213,'within'),(214,'alive'),(215,'because'),(216,'forsaken'),(217,'condemned'),(218,'received'),(219,'pardoning'),(220,'turn'),(221,'forgive'),(222,'blood'),(223,'sprinkles'),(224,'intercede'),(225,'owns'),(226,'born'),(227,'written'),(228,'cannot'),(229,'presence'),(230,'stands'),(231,'strongly'),(232,'calvary'),(233,'behalf'),(234,'nigh'),(235,'dear'),(236,'tells'),(237,'abba'),(238,'appears'),(239,'child'),(240,'hands'),(241,'above'),(242,'five'),(243,'surety'),(244,'shake'),(245,'draw'),(246,'sacrifice'),(247,'pour'),(248,'reconciled'),(249,'hears'),(250,'guilty'),(251,'plead'),(252,'confidence'),(253,'bleeding'),(254,'atoned'),(255,'answers'),(256,'redeeming'),(257,'hear'),(258,'longer'),(259,'pray'),(260,'sinner'),(261,'wounds'),(262,'ever'),(263,'effectual'),(264,'anointed'),(265,'away'),(266,'bears'),(267,'prayers'),(268,'answer'),(269,'trust'),(270,'mighty'),(271,'awesome'),(272,'nations'),(273,'creation'),(274,'most'),(275,'want'),(276,'send'),(277,'together'),(278,'call'),(279,'offer'),(280,'shout'),(281,'glorious'),(282,'captured'),(283,'spoken'),(284,'beauty'),(285,'heard'),(286,'fills'),(287,'fully'),(288,'opened'),(289,'wonderful'),(290,'beautiful'),(291,'awakes'),(292,'unfailing'),(293,'seen'),(294,'powerful'),(295,'skies'),(296,'works'),(297,'marvelous'),(298,'wonders'),(299,'anew'),(300,'nothing'),(301,'adore');
/*!40000 ALTER TABLE `WordTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-24 19:18:18
