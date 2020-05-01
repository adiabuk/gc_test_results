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
INSERT INTO `trades` VALUES ('2019-01-01 19:59:59','2019-01-06 07:59:59','IOTABTC','4h','0.000095400000000','0.000093400000000','0.033333333333333','0.032634521313766','349.4060097833683','349.406009783368290','test','test','2.09'),('2019-01-06 11:59:59','2019-01-06 19:59:59','IOTABTC','4h','0.000094670000000','0.000093610000000','0.033178041773430','0.032806554245387','350.45993211608277','350.459932116082769','test','test','1.11'),('2019-01-06 23:59:59','2019-01-07 03:59:59','IOTABTC','4h','0.000092840000000','0.000092350000000','0.033095488989420','0.032920814392212','356.4787698127962','356.478769812796202','test','test','0.52'),('2019-01-19 11:59:59','2019-01-19 19:59:59','IOTABTC','4h','0.000085130000000','0.000084920000000','0.033056672412263','0.032975127701743','388.30814533375616','388.308145333756158','test','test','0.24'),('2019-01-21 15:59:59','2019-01-21 23:59:59','IOTABTC','4h','0.000085310000000','0.000085160000000','0.033038551365480','0.032980459902523','387.2764197102385','387.276419710238486','test','test','0.17'),('2019-02-08 11:59:59','2019-02-09 19:59:59','IOTABTC','4h','0.000075090000000','0.000075110000000','0.033025642151490','0.033034438433858','439.8141184111066','439.814118411106620','test','test','0.06'),('2019-02-09 23:59:59','2019-02-10 15:59:59','IOTABTC','4h','0.000075400000000','0.000075220000000','0.033027596880905','0.032948751158908','438.0317888714205','438.031788871420474','test','test','0.23'),('2019-02-10 19:59:59','2019-02-11 11:59:59','IOTABTC','4h','0.000075530000000','0.000074040000000','0.033010075609350','0.032358877242371','437.0458838785942','437.045883878594225','test','test','1.97'),('2019-02-12 19:59:59','2019-02-12 23:59:59','IOTABTC','4h','0.000075220000000','0.000075310000000','0.032865364861133','0.032904687951235','436.92322335991304','436.923223359913038','test','test','0.0'),('2019-02-13 03:59:59','2019-02-13 07:59:59','IOTABTC','4h','0.000075010000000','0.000075150000000','0.032874103325600','0.032935460137566','438.2629426156483','438.262942615648285','test','test','0.0'),('2019-02-13 11:59:59','2019-02-13 15:59:59','IOTABTC','4h','0.000074760000000','0.000074230000000','0.032887738172703','0.032654585400746','439.9108904855984','439.910890485598372','test','test','0.70'),('2019-02-15 11:59:59','2019-02-16 03:59:59','IOTABTC','4h','0.000075640000000','0.000074650000000','0.032835926445602','0.032406159560605','434.1079646430694','434.107964643069408','test','test','1.30'),('2019-02-16 07:59:59','2019-02-16 11:59:59','IOTABTC','4h','0.000074960000000','0.000075710000000','0.032740422693380','0.033068001629080','436.77191426601144','436.771914266011436','test','test','0.0'),('2019-02-16 15:59:59','2019-02-16 19:59:59','IOTABTC','4h','0.000074990000000','0.000075140000000','0.032813218012425','0.032878853199808','437.56791588778054','437.567915887780543','test','test','0.0'),('2019-02-16 23:59:59','2019-02-18 03:59:59','IOTABTC','4h','0.000075730000000','0.000074720000000','0.032827803609621','0.032389983965547','433.48479611278077','433.484796112780771','test','test','1.33'),('2019-02-18 07:59:59','2019-02-21 19:59:59','IOTABTC','4h','0.000075440000000','0.000076050000000','0.032730510355382','0.032995165860642','433.8614840321079','433.861484032107910','test','test','0.0'),('2019-02-22 03:59:59','2019-02-22 07:59:59','IOTABTC','4h','0.000076950000000','0.000076410000000','0.032789322689884','0.032559222179780','426.1120557489856','426.112055748985597','test','test','0.70'),('2019-02-22 11:59:59','2019-02-22 15:59:59','IOTABTC','4h','0.000076480000000','0.000077120000000','0.032738189243195','0.033012148985816','428.06209784511856','428.062097845118558','test','test','0.0'),('2019-02-22 19:59:59','2019-02-23 03:59:59','IOTABTC','4h','0.000077260000000','0.000076870000000','0.032799069185999','0.032633503084749','424.52846474241954','424.528464742419544','test','test','0.50'),('2019-02-23 19:59:59','2019-02-24 07:59:59','IOTABTC','4h','0.000077130000000','0.000076770000000','0.032762276719055','0.032609360608348','424.7669741871501','424.766974187150083','test','test','0.46'),('2019-02-24 11:59:59','2019-02-24 15:59:59','IOTABTC','4h','0.000077510000000','0.000074730000000','0.032728295361120','0.031554451197736','422.2461019367824','422.246101936782395','test','test','3.58'),('2019-03-01 07:59:59','2019-03-02 07:59:59','IOTABTC','4h','0.000076390000000','0.000075390000000','0.032467441102590','0.032042418964842','425.02213774826834','425.022137748268335','test','test','1.30'),('2019-03-02 11:59:59','2019-03-02 15:59:59','IOTABTC','4h','0.000075720000000','0.000075360000000','0.032372991738646','0.032219078941156','427.53554858222697','427.535548582226966','test','test','0.47'),('2019-03-02 23:59:59','2019-03-03 11:59:59','IOTABTC','4h','0.000076280000000','0.000075630000000','0.032338788894760','0.032063222392642','423.94846479758206','423.948464797582062','test','test','0.85'),('2019-03-13 03:59:59','2019-03-13 11:59:59','IOTABTC','4h','0.000073980000000','0.000072570000000','0.032277551894289','0.031662367409686','436.3010529100958','436.301052910095791','test','test','1.90'),('2019-03-13 15:59:59','2019-03-17 11:59:59','IOTABTC','4h','0.000073190000000','0.000074870000000','0.032140844231044','0.032878603737919','439.14256361584614','439.142563615846143','test','test','0.0'),('2019-03-17 15:59:59','2019-03-17 19:59:59','IOTABTC','4h','0.000074460000000','0.000074420000000','0.032304790788127','0.032287436616336','433.8542947639956','433.854294763995597','test','test','0.05'),('2019-03-17 23:59:59','2019-03-18 03:59:59','IOTABTC','4h','0.000074180000000','0.000074280000000','0.032300934305507','0.032344478298909','435.43993401869625','435.439934018696249','test','test','0.0'),('2019-03-19 11:59:59','2019-03-19 15:59:59','IOTABTC','4h','0.000074210000000','0.000073820000000','0.032310610748485','0.032140806972823','435.3942965703424','435.394296570342419','test','test','0.52'),('2019-03-20 15:59:59','2019-03-20 19:59:59','IOTABTC','4h','0.000075210000000','0.000073600000000','0.032272876576116','0.031582019891000','429.1035311277194','429.103531127719407','test','test','2.14'),('2019-03-21 19:59:59','2019-03-25 03:59:59','IOTABTC','4h','0.000076620000000','0.000076100000000','0.032119352868312','0.031901367179308','419.2032480855159','419.203248085515895','test','test','0.67'),('2019-03-25 07:59:59','2019-03-25 11:59:59','IOTABTC','4h','0.000075540000000','0.000075860000000','0.032070911604089','0.032206769318059','424.5553561568588','424.555356156858807','test','test','0.0'),('2019-03-28 15:59:59','2019-03-28 19:59:59','IOTABTC','4h','0.000075790000000','0.000075330000000','0.032101102207194','0.031906267703759','423.553268336107','423.553268336107010','test','test','0.60'),('2019-03-29 19:59:59','2019-03-29 23:59:59','IOTABTC','4h','0.000075710000000','0.000075180000000','0.032057805650875','0.031833388308450','423.4289479708712','423.428947970871207','test','test','0.70'),('2019-04-01 07:59:59','2019-04-02 07:59:59','IOTABTC','4h','0.000075500000000','0.000072360000000','0.032007935130336','0.030676744185843','423.9461606666989','423.946160666698916','test','test','4.15'),('2019-04-29 03:59:59','2019-04-30 07:59:59','IOTABTC','4h','0.000057930000000','0.000055850000000','0.031712114920448','0.030573478651942','547.4212829354124','547.421282935412364','test','test','3.59'),('2019-04-30 11:59:59','2019-05-01 11:59:59','IOTABTC','4h','0.000057300000000','0.000054380000000','0.031459084638558','0.029855934077570','549.0241647217839','549.024164721783904','test','test','5.09'),('2019-05-14 23:59:59','2019-05-22 23:59:59','IOTABTC','4h','0.000047020000000','0.000050180000000','0.031102828958339','0.033193108403434','661.4808370552671','661.480837055267102','test','test','0.0'),('2019-05-27 23:59:59','2019-05-28 03:59:59','IOTABTC','4h','0.000049500000000','0.000048990000000','0.031567335501693','0.031242096287433','637.7239495291537','637.723949529153742','test','test','1.03'),('2019-05-28 11:59:59','2019-05-28 15:59:59','IOTABTC','4h','0.000049340000000','0.000051670000000','0.031495060120746','0.032982362311288','638.3271204042651','638.327120404265088','test','test','0.0'),('2019-05-28 19:59:59','2019-06-03 23:59:59','IOTABTC','4h','0.000055040000000','0.000054800000000','0.031825571718645','0.031686797423360','578.2262303532824','578.226230353282403','test','test','0.43'),('2019-06-04 03:59:59','2019-06-04 07:59:59','IOTABTC','4h','0.000054710000000','0.000055000000000','0.031794732986359','0.031963266573748','581.1503013408719','581.150301340871920','test','test','0.0'),('2019-06-04 11:59:59','2019-06-04 19:59:59','IOTABTC','4h','0.000055180000000','0.000054620000000','0.031832184894668','0.031509132637672','576.8790303491803','576.879030349180312','test','test','1.01'),('2019-06-04 23:59:59','2019-06-05 03:59:59','IOTABTC','4h','0.000055200000000','0.000054670000000','0.031760395504224','0.031455449677825','575.3694837721778','575.369483772177773','test','test','0.96'),('2019-06-05 07:59:59','2019-06-05 19:59:59','IOTABTC','4h','0.000055440000000','0.000055090000000','0.031692629765024','0.031492550031659','571.6563810430094','571.656381043009446','test','test','1.51'),('2019-06-05 23:59:59','2019-06-06 11:59:59','IOTABTC','4h','0.000055150000000','0.000054830000000','0.031648167602054','0.031464533628660','573.8561668550217','573.856166855021684','test','test','0.68'),('2019-06-06 15:59:59','2019-06-06 19:59:59','IOTABTC','4h','0.000054700000000','0.000054090000000','0.031607360052411','0.031254883093874','577.8310795687628','577.831079568762789','test','test','1.11'),('2019-06-07 11:59:59','2019-06-07 15:59:59','IOTABTC','4h','0.000054640000000','0.000055770000000','0.031529031839403','0.032181078068878','577.0320614824874','577.032061482487393','test','test','0.0'),('2019-06-07 19:59:59','2019-06-08 03:59:59','IOTABTC','4h','0.000055770000000','0.000054580000000','0.031673931001509','0.030998084168233','567.9385153578745','567.938515357874508','test','test','2.13'),('2019-06-13 15:59:59','2019-06-13 19:59:59','IOTABTC','4h','0.000054240000000','0.000053710000000','0.031523742816336','0.031215712143536','581.1899486787651','581.189948678765063','test','test','0.97'),('2019-07-02 07:59:59','2019-07-02 11:59:59','IOTABTC','4h','0.000039340000000','0.000038510000000','0.031455291555714','0.030791644072459','799.5752810298422','799.575281029842245','test','test','2.10'),('2019-07-20 07:59:59','2019-07-20 19:59:59','IOTABTC','4h','0.000030740000000','0.000030190000000','0.031307814337213','0.030747655004569','1018.4715138976213','1018.471513897621321','test','test','1.78'),('2019-07-24 11:59:59','2019-07-25 07:59:59','IOTABTC','4h','0.000030740000000','0.000030250000000','0.031183334485514','0.030686267670358','1014.4220717473722','1014.422071747372229','test','test','1.59'),('2019-07-25 11:59:59','2019-07-26 23:59:59','IOTABTC','4h','0.000030340000000','0.000030520000000','0.031072875193257','0.031257223167377','1024.1554117751261','1024.155411775126140','test','test','0.0'),('2019-07-27 11:59:59','2019-07-27 15:59:59','IOTABTC','4h','0.000030410000000','0.000030250000000','0.031113841409728','0.030950138199417','1023.145064443553','1023.145064443552997','test','test','0.52'),('2019-07-27 19:59:59','2019-07-27 23:59:59','IOTABTC','4h','0.000030330000000','0.000030260000000','0.031077462918548','0.031005737814549','1024.6443428469574','1024.644342846957443','test','test','0.23'),('2019-07-28 03:59:59','2019-07-28 07:59:59','IOTABTC','4h','0.000030300000000','0.000030350000000','0.031061524006548','0.031112780646823','1025.1328054966482','1025.132805496648189','test','test','0.0'),('2019-07-28 11:59:59','2019-07-28 15:59:59','IOTABTC','4h','0.000030260000000','0.000030040000000','0.031072914371054','0.030847004220306','1026.8643215814275','1026.864321581427475','test','test','0.72'),('2019-08-18 15:59:59','2019-08-18 19:59:59','IOTABTC','4h','0.000024010000000','0.000024100000000','0.031022712115332','0.031138998832965','1292.074640372021','1292.074640372020895','test','test','0.0'),('2019-08-18 23:59:59','2019-08-19 07:59:59','IOTABTC','4h','0.000023930000000','0.000023610000000','0.031048553608140','0.030633361917601','1297.4740329352092','1297.474032935209152','test','test','1.33'),('2019-08-21 23:59:59','2019-08-28 19:59:59','IOTABTC','4h','0.000023680000000','0.000025130000000','0.030956288788020','0.032851838566003','1307.2757089535378','1307.275708953537787','test','test','0.0'),('2019-08-28 23:59:59','2019-08-29 03:59:59','IOTABTC','4h','0.000024940000000','0.000024750000000','0.031377522072016','0.031138479201379','1258.1203717728952','1258.120371772895169','test','test','0.76'),('2019-08-29 11:59:59','2019-09-01 19:59:59','IOTABTC','4h','0.000025470000000','0.000025230000000','0.031324401434097','0.031029236285130','1229.8547873614712','1229.854787361471153','test','test','0.94'),('2019-09-10 19:59:59','2019-09-10 23:59:59','IOTABTC','4h','0.000023890000000','0.000023610000000','0.031258809178771','0.030892443897479','1308.4474331842052','1308.447433184205238','test','test','1.17'),('2019-09-11 11:59:59','2019-09-11 15:59:59','IOTABTC','4h','0.000023690000000','0.000023590000000','0.031177394671817','0.031045788953489','1316.0571832763567','1316.057183276356682','test','test','0.42'),('2019-09-13 19:59:59','2019-09-13 23:59:59','IOTABTC','4h','0.000023660000000','0.000023370000000','0.031148148956633','0.030766366911095','1316.489812199192','1316.489812199192102','test','test','1.22'),('2019-09-14 15:59:59','2019-10-09 15:59:59','IOTABTC','4h','0.000023770000000','0.000032380000000','0.031063308502069','0.042315100096634','1306.828292051699','1306.828292051699009','test','test','0.21'),('2019-10-12 07:59:59','2019-10-12 15:59:59','IOTABTC','4h','0.000032690000000','0.000032360000000','0.033563706634194','0.033224886714057','1026.7270307187043','1026.727030718704327','test','test','1.00'),('2019-10-13 11:59:59','2019-10-18 11:59:59','IOTABTC','4h','0.000033630000000','0.000033840000000','0.033488413318608','0.033697529191249','995.7898697177652','995.789869717765214','test','test','0.98'),('2019-10-18 15:59:59','2019-10-20 19:59:59','IOTABTC','4h','0.000034040000000','0.000033020000000','0.033534883512529','0.032530019200461','985.1610902622992','985.161090262299240','test','test','2.99'),('2019-10-22 23:59:59','2019-10-23 11:59:59','IOTABTC','4h','0.000033580000000','0.000033190000000','0.033311580332069','0.032924697773120','992.0065614076566','992.006561407656591','test','test','1.16'),('2019-10-23 15:59:59','2019-10-23 19:59:59','IOTABTC','4h','0.000033480000000','0.000033960000000','0.033225606430080','0.033701959210440','992.4016257491174','992.401625749117443','test','test','0.0'),('2019-10-23 23:59:59','2019-10-25 11:59:59','IOTABTC','4h','0.000033930000000','0.000033720000000','0.033331462603494','0.033125167078981','982.3596405391622','982.359640539162228','test','test','0.61'),('2019-11-08 23:59:59','2019-11-09 03:59:59','IOTABTC','4h','0.000030180000000','0.000029830000000','0.033285619153602','0.032899603026903','1102.9032191385686','1102.903219138568602','test','test','1.15'),('2019-11-09 11:59:59','2019-11-10 15:59:59','IOTABTC','4h','0.000030040000000','0.000030050000000','0.033199837792113','0.033210889668875','1105.187676168886','1105.187676168885901','test','test','0.0'),('2019-11-14 07:59:59','2019-11-15 15:59:59','IOTABTC','4h','0.000030590000000','0.000030090000000','0.033202293764727','0.032659595272332','1085.396984790033','1085.396984790033002','test','test','1.63'),('2019-11-15 19:59:59','2019-11-17 11:59:59','IOTABTC','4h','0.000030220000000','0.000030170000000','0.033081694099750','0.033026959331220','1094.6953706072286','1094.695370607228597','test','test','0.36'),('2019-11-17 15:59:59','2019-11-18 03:59:59','IOTABTC','4h','0.000030250000000','0.000030330000000','0.033069530817855','0.033156987428282','1093.2076303423103','1093.207630342310267','test','test','0.26'),('2019-11-18 07:59:59','2019-11-18 19:59:59','IOTABTC','4h','0.000030520000000','0.000030260000000','0.033088965620172','0.032807080591953','1084.1731854577984','1084.173185457798354','test','test','1.37'),('2019-11-18 23:59:59','2019-11-19 07:59:59','IOTABTC','4h','0.000030480000000','0.000030070000000','0.033026324502790','0.032582072762431','1083.5408301440286','1083.540830144028632','test','test','1.34'),('2019-11-19 23:59:59','2019-11-20 07:59:59','IOTABTC','4h','0.000030200000000','0.000030150000000','0.032927601893821','0.032873085996646','1090.3179435040176','1090.317943504017649','test','test','0.16');
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

-- Dump completed on 2020-04-30 20:06:07
