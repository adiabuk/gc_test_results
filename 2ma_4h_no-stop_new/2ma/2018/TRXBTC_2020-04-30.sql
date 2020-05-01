-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: greencandle
-- ------------------------------------------------------
-- Server version	10.1.24-MariaDB-1~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `exchange_id` int(11) unsigned NOT NULL,
  `gbp` varchar(30) DEFAULT NULL,
  `btc` varchar(30) DEFAULT NULL,
  `usd` varchar(30) DEFAULT NULL,
  `count` varchar(30) DEFAULT NULL,
  `coin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exchange_id` (`exchange_id`),
  CONSTRAINT `balance_ibfk_2` FOREIGN KEY (`exchange_id`) REFERENCES `exchange` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coin`
--

DROP TABLE IF EXISTS `coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coin`
--

LOCK TABLES `coin` WRITE;
/*!40000 ALTER TABLE `coin` DISABLE KEYS */;
/*!40000 ALTER TABLE `coin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `daily_profit`
--

DROP TABLE IF EXISTS `daily_profit`;
/*!50001 DROP VIEW IF EXISTS `daily_profit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `daily_profit` (
  `date` tinyint NOT NULL,
  `interval` tinyint NOT NULL,
  `profit` tinyint NOT NULL,
  `perc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `exchange`
--

DROP TABLE IF EXISTS `exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange`
--

LOCK TABLES `exchange` WRITE;
/*!40000 ALTER TABLE `exchange` DISABLE KEYS */;
INSERT INTO `exchange` VALUES (3,'coinbase'),(4,'binance'),(5,'margin');
/*!40000 ALTER TABLE `exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `hour_balance`
--

DROP TABLE IF EXISTS `hour_balance`;
/*!50001 DROP VIEW IF EXISTS `hour_balance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `hour_balance` (
  `exchange_id` tinyint NOT NULL,
  `usd1` tinyint NOT NULL,
  `coin` tinyint NOT NULL,
  `ctime1` tinyint NOT NULL,
  `ctime2` tinyint NOT NULL,
  `usd2` tinyint NOT NULL,
  `USD_diff` tinyint NOT NULL,
  `GBP_diff` tinyint NOT NULL,
  `COUNT_diff` tinyint NOT NULL,
  `perc_change` tinyint NOT NULL,
  `BTC_diff` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `monthly_profit`
--

DROP TABLE IF EXISTS `monthly_profit`;
/*!50001 DROP VIEW IF EXISTS `monthly_profit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `monthly_profit` (
  `date` tinyint NOT NULL,
  `interval` tinyint NOT NULL,
  `profit` tinyint NOT NULL,
  `perc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `open_trades`
--

DROP TABLE IF EXISTS `open_trades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_trades` (
  `pair` varchar(30) DEFAULT NULL,
  `buy_price` varchar(30) DEFAULT NULL,
  `buy_time` varchar(30) DEFAULT NULL,
  `current_price` varchar(30) DEFAULT NULL,
  `perc` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_trades`
--

LOCK TABLES `open_trades` WRITE;
/*!40000 ALTER TABLE `open_trades` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_trades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `profit`
--

DROP TABLE IF EXISTS `profit`;
/*!50001 DROP VIEW IF EXISTS `profit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `profit` (
  `buy_time` tinyint NOT NULL,
  `interval` tinyint NOT NULL,
  `sell_time` tinyint NOT NULL,
  `pair` tinyint NOT NULL,
  `buy_price` tinyint NOT NULL,
  `sell_price` tinyint NOT NULL,
  `perc` tinyint NOT NULL,
  `base_profit` tinyint NOT NULL,
  `drawdown_perc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `profitable`
--

DROP TABLE IF EXISTS `profitable`;
/*!50001 DROP VIEW IF EXISTS `profitable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `profitable` (
  `pair` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `profit` tinyint NOT NULL,
  `loss` tinyint NOT NULL,
  `perc_profitable` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `symbols`
--

DROP TABLE IF EXISTS `symbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symbols` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `maximum_leverage` int(11) DEFAULT NULL,
  `maximum_amount` int(11) DEFAULT NULL,
  `overnight_charge_long_percent` float DEFAULT NULL,
  `overnight_charge_short_percent` float DEFAULT NULL,
  `decimals` int(11) DEFAULT NULL,
  `timezone` varchar(80) DEFAULT NULL,
  `timezone_offset` varchar(10) DEFAULT NULL,
  `open_day` varchar(80) DEFAULT NULL,
  `open_time` time DEFAULT NULL,
  `close_day` varchar(80) DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `daily_break_start` time DEFAULT NULL,
  `daily_break_stop` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbol` (`symbol`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symbols`
--

LOCK TABLES `symbols` WRITE;
/*!40000 ALTER TABLE `symbols` DISABLE KEYS */;
/*!40000 ALTER TABLE `symbols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trades`
--

DROP TABLE IF EXISTS `trades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trades` (
  `buy_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `sell_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pair` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` varchar(3) DEFAULT NULL,
  `buy_price` varchar(60) DEFAULT NULL,
  `sell_price` varchar(30) DEFAULT NULL,
  `base_in` varchar(30) DEFAULT NULL,
  `base_out` varchar(30) DEFAULT NULL,
  `quote_in` varchar(30) DEFAULT NULL,
  `quote_out` varchar(30) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `closed_by` varchar(10) DEFAULT NULL,
  `drawdown_perc` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trades`
--

LOCK TABLES `trades` WRITE;
/*!40000 ALTER TABLE `trades` DISABLE KEYS */;
INSERT INTO `trades` VALUES ('2018-04-17 15:59:59','2018-05-04 11:59:59','TRXBTC','4h','0.000005340000000','0.000008530000000','0.033333333333333','0.053245942571785','6242.197253433209','6242.197253433208971','test','test','1.12'),('2018-05-04 19:59:59','2018-05-06 03:59:59','TRXBTC','4h','0.000008870000000','0.000008660000000','0.037758357608545','0.036864416785795','4256.86106071532','4256.861060715319582','test','test','2.36'),('2018-05-06 15:59:59','2018-05-07 03:59:59','TRXBTC','4h','0.000008780000000','0.000008630000000','0.037559704092378','0.036918023498545','4277.870625555606','4277.870625555606239','test','test','1.70'),('2018-05-07 15:59:59','2018-05-09 07:59:59','TRXBTC','4h','0.000008700000000','0.000008750000000','0.037417108404860','0.037632149257761','4300.817058029859','4300.817058029859254','test','test','0.0'),('2018-05-09 11:59:59','2018-05-09 15:59:59','TRXBTC','4h','0.000008740000000','0.000008780000000','0.037464895261060','0.037636359312598','4286.601288450801','4286.601288450800894','test','test','0.0'),('2018-05-09 19:59:59','2018-05-09 23:59:59','TRXBTC','4h','0.000008680000000','0.000008610000000','0.037502998383624','0.037200554848272','4320.621933597235','4320.621933597234602','test','test','0.80'),('2018-05-13 15:59:59','2018-05-14 03:59:59','TRXBTC','4h','0.000008530000000','0.000008220000000','0.037435788709101','0.036075285250740','4388.720833423369','4388.720833423369186','test','test','3.63'),('2018-05-16 19:59:59','2018-05-17 15:59:59','TRXBTC','4h','0.000008410000000','0.000008300000000','0.037133454607243','0.036647761384080','4415.392937841061','4415.392937841061212','test','test','1.30'),('2018-05-18 19:59:59','2018-05-18 23:59:59','TRXBTC','4h','0.000008350000000','0.000008360000000','0.037025522779874','0.037069864723323','4434.194344895063','4434.194344895063296','test','test','0.0'),('2018-05-19 15:59:59','2018-05-19 19:59:59','TRXBTC','4h','0.000008340000000','0.000008320000000','0.037035376545085','0.036946562692459','4440.692631305116','4440.692631305116265','test','test','0.23'),('2018-05-19 23:59:59','2018-05-20 03:59:59','TRXBTC','4h','0.000008350000000','0.000008440000000','0.037015640133390','0.037414611104888','4433.010794417964','4433.010794417963552','test','test','0.0'),('2018-05-20 07:59:59','2018-05-23 19:59:59','TRXBTC','4h','0.000008570000000','0.000009190000000','0.037104300349278','0.039788625462061','4329.556633521405','4329.556633521405274','test','test','0.0'),('2018-05-23 23:59:59','2018-05-28 07:59:59','TRXBTC','4h','0.000009050000000','0.000008990000000','0.037700817041008','0.037450866872780','4165.836137127955','4165.836137127955226','test','test','0.66'),('2018-06-19 11:59:59','2018-06-20 03:59:59','TRXBTC','4h','0.000007130000000','0.000007010000000','0.037645272559180','0.037011691534341','5279.8418736577205','5279.841873657720498','test','test','1.68'),('2018-06-20 07:59:59','2018-06-22 07:59:59','TRXBTC','4h','0.000007300000000','0.000007000000000','0.037504476775882','0.035963196908380','5137.59955834','5137.599558339999930','test','test','4.10'),('2018-06-22 11:59:59','2018-06-22 15:59:59','TRXBTC','4h','0.000007110000000','0.000007000000000','0.037161970138659','0.036587031078849','5226.718725549836','5226.718725549835654','test','test','1.54'),('2018-06-23 03:59:59','2018-06-23 07:59:59','TRXBTC','4h','0.000007070000000','0.000007100000000','0.037034205903146','0.037191352462848','5238.218656739179','5238.218656739179096','test','test','0.0'),('2018-06-23 11:59:59','2018-06-24 03:59:59','TRXBTC','4h','0.000007140000000','0.000007000000000','0.037069127360858','0.036342281726331','5191.7545323329905','5191.754532332990493','test','test','1.96'),('2018-07-16 11:59:59','2018-07-16 15:59:59','TRXBTC','4h','0.000005510000000','0.000005470000000','0.036907606108740','0.036639674303958','6698.29511955362','6698.295119553619770','test','test','0.72'),('2018-07-16 19:59:59','2018-07-17 07:59:59','TRXBTC','4h','0.000005510000000','0.000005470000000','0.036848065707678','0.036580566138112','6687.489239142971','6687.489239142971201','test','test','0.72'),('2018-07-17 15:59:59','2018-07-17 19:59:59','TRXBTC','4h','0.000005490000000','0.000005450000000','0.036788621358885','0.036520580401808','6701.023926937219','6701.023926937218675','test','test','0.72'),('2018-07-29 19:59:59','2018-07-30 03:59:59','TRXBTC','4h','0.000004820000000','0.000004620000000','0.036729056701757','0.035205029452721','7620.136245177825','7620.136245177825003','test','test','4.14'),('2018-08-18 03:59:59','2018-08-18 07:59:59','TRXBTC','4h','0.000003550000000','0.000003390000000','0.036390383979749','0.034750253997563','10250.812388661721','10250.812388661721343','test','test','4.50'),('2018-08-25 23:59:59','2018-08-26 03:59:59','TRXBTC','4h','0.000003330000000','0.000003220000000','0.036025910650374','0.034835865553815','10818.591786899231','10818.591786899231010','test','test','3.30'),('2018-08-26 11:59:59','2018-08-30 11:59:59','TRXBTC','4h','0.000003320000000','0.000003440000000','0.035761456184472','0.037054038938128','10771.522947130254','10771.522947130253669','test','test','0.0'),('2018-08-30 15:59:59','2018-08-30 19:59:59','TRXBTC','4h','0.000003480000000','0.000003460000000','0.036048696796396','0.035841520378026','10358.820918504596','10358.820918504596193','test','test','0.57'),('2018-08-30 23:59:59','2018-09-02 11:59:59','TRXBTC','4h','0.000003570000000','0.000003480000000','0.036002657592314','0.035095027568978','10084.778037062684','10084.778037062684234','test','test','2.52'),('2018-09-19 07:59:59','2018-09-19 11:59:59','TRXBTC','4h','0.000003150000000','0.000003080000000','0.035800962031572','0.035005385097537','11365.38477192776','11365.384771927760085','test','test','2.22'),('2018-09-19 15:59:59','2018-09-19 19:59:59','TRXBTC','4h','0.000003090000000','0.000003080000000','0.035624167157342','0.035508878590490','11528.856685224091','11528.856685224091052','test','test','0.32'),('2018-09-20 03:59:59','2018-09-25 03:59:59','TRXBTC','4h','0.000003100000000','0.000003270000000','0.035598547475820','0.037550725885784','11483.402411554765','11483.402411554765422','test','test','0.0'),('2018-09-25 23:59:59','2018-09-26 03:59:59','TRXBTC','4h','0.000003310000000','0.000003190000000','0.036032364900256','0.034726055598736','10885.910845998858','10885.910845998858349','test','test','3.62'),('2018-09-26 11:59:59','2018-09-26 15:59:59','TRXBTC','4h','0.000003290000000','0.000003350000000','0.035742073944363','0.036393905080126','10863.852262724282','10863.852262724281900','test','test','0.0'),('2018-09-26 19:59:59','2018-09-26 23:59:59','TRXBTC','4h','0.000003270000000','0.000003240000000','0.035886925307866','0.035557687461005','10974.594895371798','10974.594895371797975','test','test','0.91'),('2018-09-27 15:59:59','2018-09-28 11:59:59','TRXBTC','4h','0.000003380000000','0.000003220000000','0.035813761341897','0.034118435361215','10595.78737925937','10595.787379259369118','test','test','4.73'),('2018-09-28 15:59:59','2018-09-28 19:59:59','TRXBTC','4h','0.000003300000000','0.000003330000000','0.035437022235078','0.035759176982670','10738.491586387407','10738.491586387406642','test','test','0.0'),('2018-09-28 23:59:59','2018-09-29 03:59:59','TRXBTC','4h','0.000003310000000','0.000003290000000','0.035508612178988','0.035294058631079','10727.677395464585','10727.677395464585061','test','test','0.60'),('2018-09-29 07:59:59','2018-10-01 07:59:59','TRXBTC','4h','0.000003310000000','0.000003330000000','0.035460933612786','0.035675199072682','10713.272994799327','10713.272994799326625','test','test','0.0'),('2018-10-01 11:59:59','2018-10-01 15:59:59','TRXBTC','4h','0.000003340000000','0.000003320000000','0.035508548159429','0.035295922122546','10631.301844140518','10631.301844140518369','test','test','0.59'),('2018-10-01 19:59:59','2018-10-03 03:59:59','TRXBTC','4h','0.000003350000000','0.000003310000000','0.035461297929011','0.035037879446277','10585.462068361458','10585.462068361457568','test','test','1.19'),('2018-10-03 07:59:59','2018-10-03 11:59:59','TRXBTC','4h','0.000003310000000','0.000003320000000','0.035367204932848','0.035474054494579','10684.956173065793','10684.956173065793337','test','test','0.0'),('2018-10-03 15:59:59','2018-10-03 19:59:59','TRXBTC','4h','0.000003320000000','0.000003310000000','0.035390949279899','0.035284350035080','10659.924481897322','10659.924481897322039','test','test','0.30'),('2018-10-03 23:59:59','2018-10-11 03:59:59','TRXBTC','4h','0.000003320000000','0.000003630000000','0.035367260558828','0.038669625249562','10652.789324948259','10652.789324948258582','test','test','0.0'),('2018-10-12 15:59:59','2018-10-12 23:59:59','TRXBTC','4h','0.000003670000000','0.000003620000000','0.036101119378991','0.035609278515517','9836.817269479927','9836.817269479926836','test','test','1.36'),('2018-10-13 03:59:59','2018-10-15 03:59:59','TRXBTC','4h','0.000003730000000','0.000003730000000','0.035991821409330','0.035991821409330','9649.281879177064','9649.281879177064184','test','test','0.26'),('2018-10-15 07:59:59','2018-10-16 23:59:59','TRXBTC','4h','0.000003710000000','0.000003690000000','0.035991821409330','0.035797795417905','9701.299571248099','9701.299571248098800','test','test','0.53'),('2018-10-17 03:59:59','2018-10-17 07:59:59','TRXBTC','4h','0.000003690000000','0.000003710000000','0.035948704522347','0.036143548449297','9742.196347519543','9742.196347519542542','test','test','0.0'),('2018-10-17 11:59:59','2018-10-17 15:59:59','TRXBTC','4h','0.000003680000000','0.000003690000000','0.035992003172780','0.036089807529228','9780.435644777295','9780.435644777295238','test','test','0.0'),('2018-10-17 23:59:59','2018-10-18 07:59:59','TRXBTC','4h','0.000003710000000','0.000003760000000','0.036013737474213','0.036499097817531','9707.206866364779','9707.206866364778762','test','test','0.0'),('2018-10-18 11:59:59','2018-10-18 19:59:59','TRXBTC','4h','0.000003800000000','0.000003720000000','0.036121595328284','0.035361140689794','9505.682981127367','9505.682981127367384','test','test','2.10'),('2018-10-18 23:59:59','2018-10-19 11:59:59','TRXBTC','4h','0.000003740000000','0.000003710000000','0.035952605408620','0.035664215525663','9612.996098561378','9612.996098561377948','test','test','0.80'),('2018-10-19 15:59:59','2018-10-21 23:59:59','TRXBTC','4h','0.000003700000000','0.000003730000000','0.035888518767962','0.036179506757972','9699.599667016877','9699.599667016876992','test','test','0.0'),('2018-11-02 23:59:59','2018-11-03 03:59:59','TRXBTC','4h','0.000003580000000','0.000003570000000','0.035953182765742','0.035852754880921','10042.78848205096','10042.788482050960738','test','test','0.27'),('2018-11-04 11:59:59','2018-11-08 03:59:59','TRXBTC','4h','0.000003620000000','0.000003610000000','0.035930865458004','0.035831608923590','9925.653441437693','9925.653441437692891','test','test','0.27'),('2018-11-08 11:59:59','2018-11-08 15:59:59','TRXBTC','4h','0.000003650000000','0.000003630000000','0.035908808450357','0.035712047856108','9838.029712426545','9838.029712426545302','test','test','0.54'),('2018-11-28 15:59:59','2019-01-01 03:59:59','TRXBTC','4h','0.000003470000000','0.000005050000000','0.035865083873857','0.052195583159360','10335.75904145738','10335.759041457380590','test','test','0.86'),('2019-01-01 07:59:59','2019-01-02 03:59:59','TRXBTC','4h','0.000005130000000','0.000005060000000','0.039494083715080','0.038955178089338','7698.651796311891','7698.651796311891303','test','test','1.36'),('2019-01-02 07:59:59','2019-01-03 07:59:59','TRXBTC','4h','0.000005070000000','0.000005110000000','0.039374326909360','0.039684972486554','7766.139429853956','7766.139429853956244','test','test','0.0'),('2019-01-03 11:59:59','2019-01-13 03:59:59','TRXBTC','4h','0.000005120000000','0.000006210000000','0.039443359259847','0.047840480664775','7703.781105438889','7703.781105438889426','test','test','0.0'),('2019-01-13 07:59:59','2019-01-13 11:59:59','TRXBTC','4h','0.000006290000000','0.000006270000000','0.041309386238720','0.041178036838915','6567.469990257551','6567.469990257551217','test','test','0.31'),('2019-01-14 03:59:59','2019-01-19 03:59:59','TRXBTC','4h','0.000006470000000','0.000006620000000','0.041280197483208','0.042237234519140','6380.246906214495','6380.246906214494629','test','test','0.0'),('2019-01-19 07:59:59','2019-01-19 19:59:59','TRXBTC','4h','0.000006650000000','0.000006600000000','0.041492872380082','0.041180895896021','6239.529681215272','6239.529681215271921','test','test','0.75'),('2019-01-19 23:59:59','2019-01-20 03:59:59','TRXBTC','4h','0.000006590000000','0.000006620000000','0.041423544272512','0.041612118829140','6285.818554250751','6285.818554250750822','test','test','0.0'),('2019-01-20 11:59:59','2019-01-20 15:59:59','TRXBTC','4h','0.000006600000000','0.000006590000000','0.041465449729541','0.041402623290557','6282.6438984152865','6282.643898415286458','test','test','0.15'),('2019-01-20 19:59:59','2019-01-28 15:59:59','TRXBTC','4h','0.000006680000000','0.000007590000000','0.041451488298656','0.047098322782455','6205.312619559215','6205.312619559214909','test','test','0.44'),('2019-01-28 19:59:59','2019-01-31 11:59:59','TRXBTC','4h','0.000007650000000','0.000007540000000','0.042706340406166','0.042092262308822','5582.528157668818','5582.528157668817585','test','test','1.43'),('2019-01-31 15:59:59','2019-01-31 19:59:59','TRXBTC','4h','0.000007530000000','0.000007490000000','0.042569878606757','0.042343743793441','5653.370332902612','5653.370332902612063','test','test','0.53'),('2019-02-01 23:59:59','2019-02-02 03:59:59','TRXBTC','4h','0.000007560000000','0.000007470000000','0.042519626426020','0.042013440397139','5624.289209790976','5624.289209790976201','test','test','1.19'),('2019-02-04 11:59:59','2019-02-05 23:59:59','TRXBTC','4h','0.000007880000000','0.000007550000000','0.042407140641824','0.040631207087027','5381.616832718782','5381.616832718781552','test','test','4.18'),('2019-02-06 07:59:59','2019-02-06 11:59:59','TRXBTC','4h','0.000007680000000','0.000007570000000','0.042012488740758','0.041410747365565','5470.376138119532','5470.376138119531788','test','test','1.43'),('2019-02-06 15:59:59','2019-02-06 19:59:59','TRXBTC','4h','0.000007560000000','0.000007520000000','0.041878768435160','0.041657187649789','5539.519634280365','5539.519634280364698','test','test','0.52'),('2019-02-07 03:59:59','2019-02-07 07:59:59','TRXBTC','4h','0.000007660000000','0.000007570000000','0.041829528260633','0.041338058607440','5460.773924364578','5460.773924364578306','test','test','1.17'),('2019-02-07 11:59:59','2019-02-07 15:59:59','TRXBTC','4h','0.000007580000000','0.000007550000000','0.041720312782145','0.041555192810712','5503.9990477764295','5503.999047776429506','test','test','0.39'),('2019-02-07 19:59:59','2019-02-07 23:59:59','TRXBTC','4h','0.000007590000000','0.000007560000000','0.041683619455160','0.041518862066009','5491.912971694364','5491.912971694364387','test','test','0.39'),('2019-02-08 11:59:59','2019-02-08 15:59:59','TRXBTC','4h','0.000007580000000','0.000007590000000','0.041647006702016','0.041701949982626','5494.3280609519215','5494.328060951921543','test','test','0.0'),('2019-03-23 11:59:59','2019-03-24 19:59:59','TRXBTC','4h','0.000005980000000','0.000005820000000','0.041659216319929','0.040544588458526','6966.424133767373','6966.424133767372950','test','test','2.67'),('2019-03-24 23:59:59','2019-03-25 03:59:59','TRXBTC','4h','0.000005820000000','0.000005730000000','0.041411521239617','0.040771136890551','7115.381656291601','7115.381656291600848','test','test','1.54'),('2019-03-27 15:59:59','2019-03-27 19:59:59','TRXBTC','4h','0.000005780000000','0.000005800000000','0.041269213606491','0.041412013653572','7140.002354064246','7140.002354064245992','test','test','0.0'),('2019-03-27 23:59:59','2019-03-28 03:59:59','TRXBTC','4h','0.000005770000000','0.000005710000000','0.041300946950287','0.040871474365015','7157.876421193607','7157.876421193606802','test','test','1.03'),('2019-03-28 23:59:59','2019-03-29 03:59:59','TRXBTC','4h','0.000005750000000','0.000005750000000','0.041205508598004','0.041205508598004','7166.175408348599','7166.175408348599376','test','test','0.0'),('2019-03-29 07:59:59','2019-03-29 11:59:59','TRXBTC','4h','0.000005800000000','0.000005590000000','0.041205508598004','0.039713585010835','7104.398034138697','7104.398034138696858','test','test','3.62'),('2019-04-01 15:59:59','2019-04-02 07:59:59','TRXBTC','4h','0.000005810000000','0.000005620000000','0.040873970023078','0.039537299746936','7035.106716536662','7035.106716536662134','test','test','3.27'),('2019-04-07 23:59:59','2019-04-08 03:59:59','TRXBTC','4h','0.000005590000000','0.000005390000000','0.040576932183935','0.039125163590592','7258.84296671473','7258.842966714730210','test','test','3.57'),('2019-04-08 15:59:59','2019-04-10 19:59:59','TRXBTC','4h','0.000005960000000','0.000005650000000','0.040254316940970','0.038160552133638','6754.080023652722','6754.080023652722048','test','test','5.20'),('2019-04-10 23:59:59','2019-04-11 03:59:59','TRXBTC','4h','0.000005650000000','0.000005280000000','0.039789035872674','0.037183382196056','7042.307234101632','7042.307234101632275','test','test','6.54');
/*!40000 ALTER TABLE `trades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `daily_profit`
--

/*!50001 DROP TABLE IF EXISTS `daily_profit`*/;
/*!50001 DROP VIEW IF EXISTS `daily_profit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `daily_profit` AS select left(`profit`.`sell_time`,10) AS `date`,`profit`.`interval` AS `interval`,sum(`profit`.`base_profit`) AS `profit`,sum(`profit`.`perc`) AS `perc` from `profit` where (`profit`.`perc` is not null) group by left(`profit`.`sell_time`,10) order by left(`profit`.`sell_time`,10),sum(`profit`.`base_profit`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hour_balance`
--

/*!50001 DROP TABLE IF EXISTS `hour_balance`*/;
/*!50001 DROP VIEW IF EXISTS `hour_balance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hour_balance` AS select `tt1`.`exchange_id` AS `exchange_id`,`tt1`.`usd` AS `usd1`,`tt1`.`coin` AS `coin`,`tt1`.`ctime` AS `ctime1`,`tt2`.`ctime` AS `ctime2`,`tt2`.`usd` AS `usd2`,(`tt1`.`usd` - `tt2`.`usd`) AS `USD_diff`,(`tt1`.`gbp` - `tt2`.`gbp`) AS `GBP_diff`,(`tt1`.`count` - `tt2`.`count`) AS `COUNT_diff`,(((`tt1`.`btc` - `tt2`.`btc`) / `tt1`.`btc`) * 100) AS `perc_change`,(`tt1`.`btc` - `tt2`.`btc`) AS `BTC_diff` from (`balance` `tt1` left join `balance` `tt2` on(((`tt1`.`coin` = `tt2`.`coin`) and (`tt1`.`exchange_id` = `tt2`.`exchange_id`)))) where ((`tt1`.`ctime` > (now() - interval 20 minute)) and (`tt2`.`ctime` < (now() - interval 45 minute)) and (`tt2`.`ctime` > (now() - interval 90 minute))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthly_profit`
--

/*!50001 DROP TABLE IF EXISTS `monthly_profit`*/;
/*!50001 DROP VIEW IF EXISTS `monthly_profit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_profit` AS select left(`profit`.`sell_time`,7) AS `date`,`profit`.`interval` AS `interval`,sum(`profit`.`base_profit`) AS `profit`,sum(`profit`.`perc`) AS `perc` from `profit` where (`profit`.`perc` is not null) group by left(`profit`.`sell_time`,7) order by left(`profit`.`sell_time`,7),sum(`profit`.`base_profit`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `profit`
--

/*!50001 DROP TABLE IF EXISTS `profit`*/;
/*!50001 DROP VIEW IF EXISTS `profit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `profit` AS select `trades`.`buy_time` AS `buy_time`,`trades`.`interval` AS `interval`,`trades`.`sell_time` AS `sell_time`,`trades`.`pair` AS `pair`,`trades`.`buy_price` AS `buy_price`,`trades`.`sell_price` AS `sell_price`,(((`trades`.`sell_price` - `trades`.`buy_price`) / `trades`.`buy_price`) * 100) AS `perc`,(`trades`.`base_out` - `trades`.`base_in`) AS `base_profit`,`trades`.`drawdown_perc` AS `drawdown_perc` from `trades` order by (((`trades`.`sell_price` - `trades`.`buy_price`) / `trades`.`buy_price`) * 100) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `profitable`
--

/*!50001 DROP TABLE IF EXISTS `profitable`*/;
/*!50001 DROP VIEW IF EXISTS `profitable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `profitable` AS select `profit`.`pair` AS `pair`,count(0) AS `total`,sum((case when (`profit`.`perc` > 0) then 1 else 0 end)) AS `profit`,sum((case when (`profit`.`perc` < 0) then 1 else 0 end)) AS `loss`,((sum((case when (`profit`.`perc` > 0) then 1 else 0 end)) / count(0)) * 100) AS `perc_profitable` from `profit` group by `profit`.`pair` order by ((sum((case when (`profit`.`perc` > 0) then 1 else 0 end)) / count(0)) * 100) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 19:10:39
