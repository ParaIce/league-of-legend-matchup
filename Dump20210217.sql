CREATE DATABASE  IF NOT EXISTS `league_of_legend_matchup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `league_of_legend_matchup`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: league_of_legend_matchup
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
-- Table structure for table `champion`
--

DROP TABLE IF EXISTS `champion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `IDonOPGG` int DEFAULT NULL,
  `EnglishName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  UNIQUE KEY `IDonOPGG_UNIQUE` (`IDonOPGG`),
  UNIQUE KEY `EnglishName_UNIQUE` (`EnglishName`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champion`
--

LOCK TABLES `champion` WRITE;
/*!40000 ALTER TABLE `champion` DISABLE KEYS */;
INSERT INTO `champion` VALUES (16,'黑暗之女',1,'Annie'),(17,'狂战士',2,'Olaf'),(18,'正义巨像',3,'Galio'),(19,'卡牌大师',4,'Twisted'),(20,'德邦总管',5,'Xin'),(21,'无畏战车',6,'Urgot'),(22,'诡术妖姬',7,'LeBlanc'),(23,'猩红收割者',8,'Vladimir'),(24,'远古恐惧',9,'Fiddlesticks'),(25,'正义天使',10,'Kayle'),(26,'无极剑圣',11,'Master'),(27,'牛头酋长',12,'Alistar'),(28,'符文法师',13,'Ryze'),(29,'亡灵战神',14,'Sion'),(30,'战争女神',15,'Sivir'),(31,'众星之子',16,'Soraka'),(32,'迅捷斥候',17,'Teemo'),(33,'麦林炮手',18,'Tristana'),(34,'祖安怒兽',19,'Warwick'),(35,'雪原双子',20,'Nunu'),(36,'赏金猎人',21,'Miss'),(37,'寒冰射手',22,'Ashe'),(38,'蛮族之王',23,'Tryndamere'),(39,'武器大师',24,'Jax'),(40,'堕落天使',25,'Morgana'),(41,'时光守护者',26,'Zilean'),(42,'炼金术士',27,'Singed'),(43,'痛苦之拥',28,'Evelynn'),(44,'瘟疫之源',29,'Twitch'),(45,'死亡颂唱者',30,'Karthus'),(46,'虚空恐惧',31,'Cho\'Gath'),(47,'殇之木乃伊',32,'Amumu'),(48,'披甲龙龟',33,'Rammus'),(49,'冰晶凤凰',34,'Anivia'),(50,'恶魔小丑',35,'Shaco'),(51,'祖安狂人',36,'Dr.'),(52,'琴瑟仙女',37,'Sona'),(53,'虚空行者',38,'Kassadin'),(54,'刀锋舞者',39,'Irelia'),(55,'风暴之怒',40,'Janna'),(56,'海洋之灾',41,'Gangplank'),(57,'英勇投弹手',42,'Corki'),(58,'天启者',43,'Karma'),(59,'瓦洛兰之盾',44,'Taric'),(60,'邪恶小法师',45,'Veigar'),(61,'巨魔之王',48,'Trundle'),(62,'诺克萨斯统领',50,'Swain'),(63,'皮城女警',51,'Caitlyn'),(64,'蒸汽机器人',53,'Blitzcrank'),(65,'熔岩巨兽',54,'Malphite'),(66,'不祥之刃',55,'Katarina'),(67,'永恒梦魇',56,'Nocturne'),(68,'扭曲树精',57,'Maokai'),(69,'荒漠屠夫',58,'Renekton'),(70,'德玛西亚皇子',59,'Jarvan'),(71,'蜘蛛女皇',60,'Elise'),(72,'发条魔灵',61,'Orianna'),(73,'齐天大圣',62,'Wukong'),(74,'复仇焰魂',63,'Brand'),(75,'盲僧',64,'Lee'),(76,'暗夜猎手',67,'Vayne'),(77,'机械公敌',68,'Rumble'),(78,'魔蛇之拥',69,'Cassiopeia'),(79,'水晶先锋',72,'Skarner'),(80,'大发明家',74,'Heimerdinger'),(81,'沙漠死神',75,'Nasus'),(82,'狂野女猎手',76,'Nidalee'),(83,'兽灵行者',77,'Udyr'),(84,'圣锤之毅',78,'Poppy'),(85,'酒桶',79,'Gragas'),(86,'不屈之枪',80,'Pantheon'),(87,'探险家',81,'Ezreal'),(88,'铁铠冥魂',82,'Mordekaiser'),(89,'牧魂人',83,'Yorick'),(90,'离群之刺',84,'Akali'),(91,'狂暴之心',85,'Kennen'),(92,'德玛西亚之力',86,'Garen'),(93,'曙光女神',89,'Leona'),(94,'虚空先知',90,'Malzahar'),(95,'刀锋之影',91,'Talon'),(96,'放逐之刃',92,'Riven'),(97,'深渊巨口',96,'Kog\'Maw'),(98,'暮光之眼',98,'Shen'),(99,'光辉女郎',99,'Lux'),(100,'远古巫灵',101,'Xerath'),(101,'龙血武姬',102,'Shyvana'),(102,'九尾妖狐',103,'Ahri'),(103,'法外狂徒',104,'Graves'),(104,'潮汐海灵',105,'Fizz'),(105,'不灭狂雷',106,'Volibear'),(106,'傲之追猎者',107,'Rengar'),(107,'惩戒之箭',110,'Varus'),(108,'深海泰坦',111,'Nautilus'),(109,'机械先驱',112,'Viktor'),(110,'北地之怒',113,'Sejuani'),(111,'无双剑姬',114,'Fiora'),(112,'爆破鬼才',115,'Ziggs'),(113,'仙灵女巫',117,'Lulu'),(114,'荣耀行刑官',119,'Draven'),(115,'战争之影',120,'Hecarim'),(116,'虚空掠夺者',121,'Kha\'Zix'),(117,'诺克萨斯之手',122,'Darius'),(118,'未来守护者',126,'Jayce'),(119,'冰霜女巫',127,'Lissandra'),(120,'皎月女神',131,'Diana'),(121,'德玛西亚之翼',133,'Quinn'),(122,'暗黑元首',134,'Syndra'),(123,'铸星龙王',136,'Aurelion'),(124,'影流之镰',141,'Kayn'),(125,'暮光星灵',142,'Zoe'),(126,'荆棘之兴',143,'Zyra'),(127,'虚空之女',145,'Kai\'Sa'),(128,'星籁歌姬',147,'Seraphine'),(129,'迷失之牙',150,'Gnar'),(130,'生化魔人',154,'Zac'),(131,'疾风剑豪',157,'Yasuo'),(132,'虚空之眼',161,'Vel\'Koz'),(133,'岩雀',163,'Taliyah'),(134,'青钢影',164,'Camille'),(135,'弗雷尔卓德之心',201,'Braum'),(136,'戏命师',202,'Jhin'),(137,'永猎双子',203,'Kindred'),(138,'暴走萝莉',222,'Jinx'),(139,'河流之王',223,'Tahm'),(140,'破败之王',234,'Viego'),(141,'涤魂圣枪',235,'Senna'),(142,'圣枪游侠',236,'Lucian'),(143,'影流之主',238,'Zed'),(144,'暴怒骑士',240,'Kled'),(145,'时间刺客',245,'Ekko'),(146,'元素女皇',246,'Qiyana'),(147,'皮城执法官',254,'Vi'),(148,'暗裔剑魔',266,'Aatrox'),(149,'唤潮鲛姬',267,'Nami'),(150,'沙漠皇帝',268,'Azir'),(151,'魔法猫咪',350,'Yuumi'),(152,'沙漠玫瑰',360,'Samira'),(153,'魂锁典狱长',412,'Thresh'),(154,'海兽祭司',420,'Illaoi'),(155,'虚空遁地兽',421,'Rek\'Sai'),(156,'翠神',427,'Ivern'),(157,'复仇之矛',429,'Kalista'),(158,'星界游神',432,'Bard'),(159,'幻翎',497,'Rakan'),(160,'逆羽',498,'Xayah'),(161,'山隐之焰',516,'Ornn'),(162,'解脱者',517,'Sylas'),(163,'万花通灵',518,'Neeko'),(164,'残月之肃',523,'Aphelios'),(165,'镕铁少女',526,'Rell'),(166,'血港鬼影',555,'Pyke'),(167,'封魔剑魂',777,'Yone'),(168,'腕豪',875,'Sett'),(169,'含羞蓓蕾',876,'Lillia');
/*!40000 ALTER TABLE `champion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `champion_matchup`
--

DROP TABLE IF EXISTS `champion_matchup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champion_matchup` (
  `ID` int NOT NULL,
  `ChampionID1` int NOT NULL,
  `ChampionID2` int NOT NULL,
  `RoleID` int NOT NULL,
  `WinRate` decimal(10,0) DEFAULT NULL,
  `KillRate` decimal(10,0) DEFAULT NULL,
  `KDA` varchar(45) DEFAULT NULL,
  `KP` decimal(10,0) DEFAULT NULL,
  `Damage` int DEFAULT NULL,
  `TowerDestroyTime` time DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_championmatchup_champion_idx` (`ChampionID1`),
  CONSTRAINT `fk_championmatchup_champion1` FOREIGN KEY (`ChampionID1`) REFERENCES `champion` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_championmatchup_champion2` FOREIGN KEY (`ID`) REFERENCES `champion` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_championmatchup_role` FOREIGN KEY (`ID`) REFERENCES `role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champion_matchup`
--

LOCK TABLES `champion_matchup` WRITE;
/*!40000 ALTER TABLE `champion_matchup` DISABLE KEYS */;
/*!40000 ALTER TABLE `champion_matchup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `champion_nickname`
--

DROP TABLE IF EXISTS `champion_nickname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champion_nickname` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ChampionID` int NOT NULL,
  `NickName` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `_idx` (`ChampionID`),
  CONSTRAINT `` FOREIGN KEY (`ChampionID`) REFERENCES `champion` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champion_nickname`
--

LOCK TABLES `champion_nickname` WRITE;
/*!40000 ALTER TABLE `champion_nickname` DISABLE KEYS */;
/*!40000 ALTER TABLE `champion_nickname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `champion_role`
--

DROP TABLE IF EXISTS `champion_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champion_role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ChampionID` int NOT NULL,
  `RoleID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `_idx` (`ChampionID`),
  KEY `fk_championrole_role_idx` (`RoleID`),
  CONSTRAINT `fk_championrole_champion` FOREIGN KEY (`ChampionID`) REFERENCES `champion` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_championrole_role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champion_role`
--

LOCK TABLES `champion_role` WRITE;
/*!40000 ALTER TABLE `champion_role` DISABLE KEYS */;
INSERT INTO `champion_role` VALUES (45,148,1),(46,102,3),(47,90,3),(48,90,1),(49,27,5),(50,49,3),(51,49,5),(52,16,3),(53,164,4),(54,37,4),(55,37,5),(56,150,3),(57,158,5),(58,64,5),(59,74,5),(60,135,5),(61,63,4),(62,134,1),(63,78,3),(64,46,1),(65,46,3),(66,57,3),(67,117,1),(68,120,3),(69,114,4),(70,145,2),(71,145,3),(72,71,2),(73,43,2),(74,87,4),(75,24,2),(76,111,1),(77,104,3),(78,18,3),(79,18,5),(80,56,1),(81,92,1),(82,92,3),(83,129,1),(84,85,1),(85,85,5),(86,85,2),(87,103,2),(88,115,2),(89,80,1),(90,154,1),(91,54,1),(92,54,3),(93,156,2),(94,55,5),(95,39,1),(96,39,2),(97,118,1),(98,118,3),(99,136,4),(100,138,4),(101,127,4),(102,157,4),(103,157,1),(104,58,5),(105,45,2),(106,53,3),(107,66,3),(108,25,1),(109,124,2),(110,91,1),(111,116,2),(112,137,2),(113,144,1),(114,144,3),(115,22,3),(116,93,5),(117,169,2),(118,119,3),(119,142,4),(120,142,3),(121,142,1),(122,113,5),(123,99,5),(124,99,3),(125,65,1),(126,65,3),(127,94,3),(128,68,5),(129,68,1),(130,88,1),(131,40,5),(132,149,5),(133,81,1),(134,108,5),(135,163,3),(136,163,5),(137,82,2),(138,67,2),(139,67,3),(140,67,1),(141,35,2),(142,35,3),(143,17,2),(144,72,3),(145,161,1),(146,86,3),(147,86,5),(148,86,1),(149,84,1),(150,84,2),(151,84,5),(152,166,5),(153,166,3),(154,146,3),(155,121,1),(156,159,5),(157,48,2),(158,155,2),(159,165,5),(160,69,1),(161,69,3),(162,106,1),(163,106,2),(164,96,1),(165,77,3),(166,77,1),(167,28,3),(168,28,1),(169,152,4),(170,110,2),(171,141,5),(172,141,4),(173,128,5),(174,128,3),(175,128,4),(176,168,1),(177,168,5),(178,168,3),(179,50,5),(180,50,2),(181,98,1),(182,98,5),(183,101,2),(184,42,1),(185,29,1),(186,30,4),(187,79,2),(188,52,5),(189,31,5),(190,62,5),(191,62,4),(192,162,3),(193,162,1),(194,122,3),(195,133,2),(196,95,3),(197,59,5),(198,32,1),(199,153,5),(200,33,4),(201,33,3),(202,38,1),(203,44,4),(204,83,2),(205,21,1),(206,107,4),(207,76,4),(208,76,1),(209,132,5),(210,147,2),(211,140,2),(212,140,1),(213,140,3),(214,109,3),(215,23,3),(216,23,1),(217,105,1),(218,34,2),(219,34,1),(220,73,1),(221,73,2),(222,160,4),(223,100,5),(224,100,3),(225,131,3),(226,131,1),(227,167,3),(228,167,1),(229,89,1),(230,151,5),(231,130,2),(232,130,1),(233,130,5),(234,143,3),(235,41,5),(236,125,3),(237,126,5);
/*!40000 ALTER TABLE `champion_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `champion_role_info`
--

DROP TABLE IF EXISTS `champion_role_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champion_role_info` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ChampionRoleID` int NOT NULL,
  `WinRate` decimal(10,0) DEFAULT NULL,
  `PickRate` decimal(10,0) DEFAULT NULL,
  `BanRate` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ChampionRoleID_UNIQUE` (`ChampionRoleID`),
  CONSTRAINT `fk_championroleinfo_championrole` FOREIGN KEY (`ChampionRoleID`) REFERENCES `champion_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champion_role_info`
--

LOCK TABLES `champion_role_info` WRITE;
/*!40000 ALTER TABLE `champion_role_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `champion_role_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Position` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Position_UNIQUE` (`Position`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (4,'Bottom'),(2,'Jungle'),(3,'Middle'),(5,'Support'),(1,'Top');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-17  3:20:08
