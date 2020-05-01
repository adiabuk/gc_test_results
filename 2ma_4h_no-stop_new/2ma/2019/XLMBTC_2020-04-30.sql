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
INSERT INTO `trades` VALUES ('2019-01-07 11:59:59','2019-01-08 03:59:59','XLMBTC','4h','0.000030480000000','0.000030050000000','0.033333333333333','0.032863079615048','1093.6132983377079','1093.613298337707874','test','test','1.41'),('2019-01-08 07:59:59','2019-01-08 11:59:59','XLMBTC','4h','0.000030310000000','0.000030530000000','0.033228832507048','0.033470018358303','1096.2993238880824','1096.299323888082426','test','test','0.0'),('2019-01-08 15:59:59','2019-01-09 19:59:59','XLMBTC','4h','0.000030690000000','0.000030460000000','0.033282429362882','0.033033000925167','1084.471468324608','1084.471468324607940','test','test','0.97'),('2019-01-09 23:59:59','2019-01-10 07:59:59','XLMBTC','4h','0.000030870000000','0.000030400000000','0.033227000821168','0.032721115159168','1076.3524723410358','1076.352472341035764','test','test','1.52'),('2019-01-13 03:59:59','2019-01-13 19:59:59','XLMBTC','4h','0.000030740000000','0.000029270000000','0.033114581785168','0.031531028264537','1077.2472929462517','1077.247292946251719','test','test','4.78'),('2019-01-17 15:59:59','2019-01-17 19:59:59','XLMBTC','4h','0.000029880000000','0.000029570000000','0.032762681002805','0.032422773669777','1096.475267831504','1096.475267831503970','test','test','1.03'),('2019-02-19 11:59:59','2019-02-20 03:59:59','XLMBTC','4h','0.000022370000000','0.000022480000000','0.032687146039910','0.032847878541671','1461.204561462236','1461.204561462235915','test','test','0.0'),('2019-02-20 07:59:59','2019-02-24 15:59:59','XLMBTC','4h','0.000022410000000','0.000021910000000','0.032722864373635','0.031992769229199','1460.1902888725963','1460.190288872596284','test','test','2.23'),('2019-02-25 19:59:59','2019-02-25 23:59:59','XLMBTC','4h','0.000022620000000','0.000022470000000','0.032560621008205','0.032344701770750','1439.4615830329205','1439.461583032920544','test','test','0.66'),('2019-02-26 03:59:59','2019-02-26 07:59:59','XLMBTC','4h','0.000022290000000','0.000022160000000','0.032512638955437','0.032323018360363','1458.6199621102242','1458.619962110224151','test','test','0.58'),('2019-03-01 19:59:59','2019-03-01 23:59:59','XLMBTC','4h','0.000022290000000','0.000022170000000','0.032470501045420','0.032295693502780','1456.7295220018145','1456.729522001814530','test','test','0.53'),('2019-03-03 15:59:59','2019-03-04 07:59:59','XLMBTC','4h','0.000022850000000','0.000022260000000','0.032431654924834','0.031594251143405','1419.3284430999465','1419.328443099946526','test','test','2.58'),('2019-03-05 23:59:59','2019-03-06 03:59:59','XLMBTC','4h','0.000022210000000','0.000021920000000','0.032245565195627','0.031824528999916','1451.8489507261293','1451.848950726129260','test','test','1.30'),('2019-03-08 07:59:59','2019-03-21 15:59:59','XLMBTC','4h','0.000022390000000','0.000026230000000','0.032152001596580','0.037666235010196','1435.9982847959109','1435.998284795910877','test','test','0.31'),('2019-03-22 15:59:59','2019-03-23 11:59:59','XLMBTC','4h','0.000027200000000','0.000026620000000','0.033377386799606','0.032665663110497','1227.1098088090523','1227.109808809052311','test','test','2.13'),('2019-03-23 15:59:59','2019-03-23 19:59:59','XLMBTC','4h','0.000026680000000','0.000026850000000','0.033219225979804','0.033430892712059','1245.0984250301433','1245.098425030143289','test','test','0.0'),('2019-03-23 23:59:59','2019-03-24 03:59:59','XLMBTC','4h','0.000026640000000','0.000026490000000','0.033266263031416','0.033078952991825','1248.733597275392','1248.733597275391958','test','test','0.56'),('2019-03-27 11:59:59','2019-03-27 15:59:59','XLMBTC','4h','0.000026370000000','0.000026410000000','0.033224638578174','0.033275036209692','1259.9407879474404','1259.940787947440413','test','test','0.0'),('2019-03-27 19:59:59','2019-03-28 07:59:59','XLMBTC','4h','0.000026520000000','0.000026340000000','0.033235838051845','0.033010255440633','1253.2367289534186','1253.236728953418606','test','test','0.67'),('2019-03-28 23:59:59','2019-03-29 03:59:59','XLMBTC','4h','0.000026440000000','0.000026380000000','0.033185708582686','0.033110400620698','1255.1326997990336','1255.132699799033617','test','test','0.22'),('2019-03-31 23:59:59','2019-04-01 03:59:59','XLMBTC','4h','0.000026380000000','0.000026650000000','0.033168973480022','0.033508458803737','1257.3530507969083','1257.353050796908292','test','test','0.0'),('2019-04-01 07:59:59','2019-04-02 07:59:59','XLMBTC','4h','0.000026510000000','0.000024900000000','0.033244414663070','0.031225421543208','1254.0329937031395','1254.032993703139482','test','test','6.07'),('2019-04-07 23:59:59','2019-04-08 03:59:59','XLMBTC','4h','0.000025560000000','0.000025130000000','0.032795749525323','0.032244021344733','1283.0887920705443','1283.088792070544287','test','test','1.68'),('2019-05-15 19:59:59','2019-05-15 23:59:59','XLMBTC','4h','0.000015500000000','0.000017320000000','0.032673143262970','0.036509602665461','2107.9447266432117','2107.944726643211652','test','test','0.0'),('2019-05-16 03:59:59','2019-05-22 11:59:59','XLMBTC','4h','0.000018420000000','0.000016550000000','0.033525689796857','0.030122158856568','1820.070021544879','1820.070021544878955','test','test','10.1'),('2019-05-30 07:59:59','2019-05-30 11:59:59','XLMBTC','4h','0.000016190000000','0.000016280000000','0.032769349587904','0.032951513977213','2024.0487700990461','2024.048770099046124','test','test','0.0'),('2019-05-30 15:59:59','2019-05-30 19:59:59','XLMBTC','4h','0.000015960000000','0.000015600000000','0.032809830563306','0.032069759197216','2055.7537946933303','2055.753794693330292','test','test','2.25'),('2019-06-03 03:59:59','2019-06-03 07:59:59','XLMBTC','4h','0.000015980000000','0.000015770000000','0.032645370259730','0.032216363516642','2042.889252799124','2042.889252799124051','test','test','1.31'),('2019-06-05 03:59:59','2019-06-05 07:59:59','XLMBTC','4h','0.000015830000000','0.000015860000000','0.032550035427933','0.032611722165952','2056.2246006274586','2056.224600627458585','test','test','0.0'),('2019-06-05 11:59:59','2019-06-05 15:59:59','XLMBTC','4h','0.000015830000000','0.000015680000000','0.032563743591937','0.032255180007680','2057.09056171427','2057.090561714269825','test','test','0.94'),('2019-06-06 19:59:59','2019-06-06 23:59:59','XLMBTC','4h','0.000015860000000','0.000016030000000','0.032495173906546','0.032843482832404','2048.8760344606835','2048.876034460683513','test','test','0.0'),('2019-06-07 03:59:59','2019-06-08 15:59:59','XLMBTC','4h','0.000016120000000','0.000015840000000','0.032572575890070','0.032006799137637','2020.6312586892332','2020.631258689233164','test','test','1.73'),('2019-07-18 11:59:59','2019-07-18 15:59:59','XLMBTC','4h','0.000009100000000','0.000008440000000','0.032446847722863','0.030093559866040','3565.5876618530892','3565.587661853089230','test','test','7.25'),('2019-07-19 07:59:59','2019-07-19 11:59:59','XLMBTC','4h','0.000008550000000','0.000008520000000','0.031923894865791','0.031811881199595','3733.7888731919684','3733.788873191968378','test','test','0.35'),('2019-07-19 15:59:59','2019-07-21 15:59:59','XLMBTC','4h','0.000008530000000','0.000008610000000','0.031899002939970','0.032198172955820','3739.6251981207497','3739.625198120749701','test','test','0.0'),('2019-07-21 19:59:59','2019-07-21 23:59:59','XLMBTC','4h','0.000008600000000','0.000008620000000','0.031965485165714','0.032039823503309','3716.9168797342368','3716.916879734236772','test','test','0.0'),('2019-07-22 03:59:59','2019-07-22 11:59:59','XLMBTC','4h','0.000008580000000','0.000008540000000','0.031982004796291','0.031832904540830','3727.506386514116','3727.506386514116002','test','test','0.46'),('2019-07-24 15:59:59','2019-07-25 07:59:59','XLMBTC','4h','0.000008720000000','0.000008560000000','0.031948871406189','0.031362653582222','3663.861399792278','3663.861399792278007','test','test','1.83'),('2019-07-25 11:59:59','2019-07-25 15:59:59','XLMBTC','4h','0.000008570000000','0.000008560000000','0.031818600778640','0.031781472889750','3712.78888898955','3712.788888989549832','test','test','0.11'),('2019-07-25 19:59:59','2019-07-30 07:59:59','XLMBTC','4h','0.000008700000000','0.000008740000000','0.031810350136665','0.031956604620052','3656.3620846741246','3656.362084674124617','test','test','0.45'),('2019-07-30 11:59:59','2019-07-30 15:59:59','XLMBTC','4h','0.000008780000000','0.000008670000000','0.031842851132973','0.031443908806706','3626.7484206119707','3626.748420611970687','test','test','1.25'),('2019-07-30 19:59:59','2019-07-30 23:59:59','XLMBTC','4h','0.000008710000000','0.000008710000000','0.031754197282692','0.031754197282692','3645.7172540403626','3645.717254040362604','test','test','0.0'),('2019-08-14 11:59:59','2019-08-14 15:59:59','XLMBTC','4h','0.000007000000000','0.000007010000000','0.031754197282692','0.031799560421667','4536.313897527365','4536.313897527365043','test','test','0.0'),('2019-08-18 23:59:59','2019-08-19 03:59:59','XLMBTC','4h','0.000006860000000','0.000006820000000','0.031764277980242','0.031579063531378','4630.361221609555','4630.361221609555287','test','test','0.58'),('2019-08-22 19:59:59','2019-08-23 03:59:59','XLMBTC','4h','0.000006780000000','0.000006700000000','0.031723119213827','0.031348805122808','4678.926137732645','4678.926137732644747','test','test','1.17'),('2019-08-24 11:59:59','2019-08-26 03:59:59','XLMBTC','4h','0.000006790000000','0.000006790000000','0.031639938304712','0.031639938304712','4659.784728234461','4659.784728234460999','test','test','0.0'),('2019-08-26 07:59:59','2019-08-26 11:59:59','XLMBTC','4h','0.000006770000000','0.000006760000000','0.031639938304712','0.031593202797615','4673.55070970635','4673.550709706350062','test','test','0.14'),('2019-09-17 15:59:59','2019-09-23 03:59:59','XLMBTC','4h','0.000006060000000','0.000006570000000','0.031629552636468','0.034291445680131','5219.398124829739','5219.398124829738663','test','test','0.0'),('2019-09-23 07:59:59','2019-09-23 11:59:59','XLMBTC','4h','0.000006690000000','0.000006830000000','0.032221084423949','0.032895367207111','4816.305594013286','4816.305594013286282','test','test','0.0'),('2019-09-23 15:59:59','2019-09-23 19:59:59','XLMBTC','4h','0.000006850000000','0.000006610000000','0.032370925042429','0.031236761245322','4725.682487945887','4725.682487945887260','test','test','3.50'),('2019-09-25 23:59:59','2019-10-01 19:59:59','XLMBTC','4h','0.000006800000000','0.000007070000000','0.032118888643072','0.033394197456841','4723.365976922385','4723.365976922385016','test','test','0.0'),('2019-10-01 23:59:59','2019-10-02 03:59:59','XLMBTC','4h','0.000007060000000','0.000007030000000','0.032402290601688','0.032264603814429','4589.559575309851','4589.559575309851425','test','test','0.42'),('2019-10-02 07:59:59','2019-10-09 15:59:59','XLMBTC','4h','0.000007050000000','0.000007360000000','0.032371693537852','0.033795129707602','4591.729579837194','4591.729579837194251','test','test','0.0'),('2019-10-09 19:59:59','2019-10-10 03:59:59','XLMBTC','4h','0.000007340000000','0.000007300000000','0.032688012686686','0.032509876377767','4453.407722981683','4453.407722981683037','test','test','0.54'),('2019-10-12 03:59:59','2019-10-12 07:59:59','XLMBTC','4h','0.000007320000000','0.000007350000000','0.032648426840259','0.032782231868293','4460.167601128293','4460.167601128293427','test','test','0.0'),('2019-10-12 11:59:59','2019-10-12 15:59:59','XLMBTC','4h','0.000007340000000','0.000007270000000','0.032678161290933','0.032366516700965','4452.065570971843','4452.065570971843044','test','test','0.95'),('2019-10-12 19:59:59','2019-10-12 23:59:59','XLMBTC','4h','0.000007330000000','0.000007320000000','0.032608906937607','0.032564420025005','4448.691260246536','4448.691260246536331','test','test','0.13'),('2019-10-13 03:59:59','2019-10-20 19:59:59','XLMBTC','4h','0.000007370000000','0.000007690000000','0.032599020957029','0.034014446561676','4423.205014522237','4423.205014522237434','test','test','0.0'),('2019-10-20 23:59:59','2019-10-21 03:59:59','XLMBTC','4h','0.000007680000000','0.000007660000000','0.032913559980284','0.032827847584502','4285.61978909945','4285.619789099449918','test','test','0.26'),('2019-10-21 11:59:59','2019-10-21 15:59:59','XLMBTC','4h','0.000007720000000','0.000007680000000','0.032894512781221','0.032724074891163','4260.947251453511','4260.947251453510944','test','test','0.51'),('2019-10-21 19:59:59','2019-10-23 15:59:59','XLMBTC','4h','0.000007750000000','0.000007830000000','0.032856637694542','0.033195802986873','4239.566154134393','4239.566154134393400','test','test','0.38'),('2019-10-23 19:59:59','2019-10-25 15:59:59','XLMBTC','4h','0.000007870000000','0.000007590000000','0.032932007759504','0.031760348017107','4184.499079987802','4184.499079987802361','test','test','3.55'),('2019-11-01 03:59:59','2019-11-04 23:59:59','XLMBTC','4h','0.000007610000000','0.000008450000000','0.032671638927860','0.036277969637374','4293.250844659687','4293.250844659686663','test','test','2.23'),('2019-11-05 03:59:59','2019-11-08 15:59:59','XLMBTC','4h','0.000008860000000','0.000008000000000','0.033473045752197','0.030223969076476','3777.9961345594434','3777.996134559443362','test','test','9.81'),('2019-11-08 19:59:59','2019-11-15 11:59:59','XLMBTC','4h','0.000008070000000','0.000008470000000','0.032751028713148','0.034374375861259','4058.3678702785073','4058.367870278507326','test','test','0.0'),('2019-11-15 15:59:59','2019-11-16 15:59:59','XLMBTC','4h','0.000008480000000','0.000008420000000','0.033111772523839','0.032877491114472','3904.6901561130762','3904.690156113076227','test','test','0.70'),('2019-11-16 19:59:59','2019-11-16 23:59:59','XLMBTC','4h','0.000008410000000','0.000008390000000','0.033059709988424','0.032981089988452','3930.9999986235434','3930.999998623543433','test','test','0.23'),('2019-11-17 03:59:59','2019-11-17 19:59:59','XLMBTC','4h','0.000008470000000','0.000008420000000','0.033042238877319','0.032847184338492','3901.090776542988','3901.090776542987896','test','test','0.59'),('2019-11-17 23:59:59','2019-11-18 03:59:59','XLMBTC','4h','0.000008420000000','0.000008350000000','0.032998893424246','0.032724555830458','3919.1084826896013','3919.108482689601260','test','test','0.83'),('2019-11-23 07:59:59','2019-11-23 11:59:59','XLMBTC','4h','0.000008230000000','0.000008360000000','0.032937929514516','0.033458212726774','4002.178555834237','4002.178555834237159','test','test','0.0'),('2019-11-23 15:59:59','2019-11-24 15:59:59','XLMBTC','4h','0.000008340000000','0.000008080000000','0.033053548006129','0.032023101665410','3963.2551566101515','3963.255156610151516','test','test','3.11'),('2019-11-25 07:59:59','2019-11-25 15:59:59','XLMBTC','4h','0.000008330000000','0.000008140000000','0.032824559930413','0.032075860484221','3940.523401010004','3940.523401010003909','test','test','2.28');
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

-- Dump completed on 2020-04-30 20:57:45
