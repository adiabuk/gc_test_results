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
INSERT INTO `trades` VALUES ('2018-05-14 15:59:59','2018-05-15 15:59:59','TNTBTC','4h','0.000013190000000','0.000012940000000','0.033333333333333','0.032701541571898','2527.1670457417235','2527.167045741723541','test','test','1.89'),('2018-05-15 19:59:59','2018-05-15 23:59:59','TNTBTC','4h','0.000012640000000','0.000012480000000','0.033192935164126','0.032772771427871','2626.0233515922123','2626.023351592212293','test','test','1.26'),('2018-06-02 11:59:59','2018-06-04 03:59:59','TNTBTC','4h','0.000010440000000','0.000010380000000','0.033099565444958','0.032909338057343','3170.4564602449977','3170.456460244997743','test','test','0.57'),('2018-06-23 15:59:59','2018-06-24 03:59:59','TNTBTC','4h','0.000009220000000','0.000007960000000','0.033057292692154','0.028539701716870','3585.389662923475','3585.389662923475043','test','test','13.6'),('2018-07-02 15:59:59','2018-07-03 23:59:59','TNTBTC','4h','0.000007440000000','0.000007140000000','0.032053383586536','0.030760908441918','4308.25048206126','4308.250482061260300','test','test','4.03'),('2018-07-04 00:22:27','2018-07-04 11:59:59','TNTBTC','4h','0.000007170000000','0.000007370000000','0.031766166887732','0.032652252435507','4430.427738874726','4430.427738874725947','test','test','0.0'),('2018-07-04 15:59:59','2018-07-06 07:59:59','TNTBTC','4h','0.000007650000000','0.000006880000000','0.031963074787237','0.028745876409960','4178.179710749978','4178.179710749977858','test','test','10.0'),('2018-07-08 15:59:59','2018-07-08 23:59:59','TNTBTC','4h','0.000007370000000','0.000007290000000','0.031248141814509','0.030908948958992','4239.910693963246','4239.910693963245649','test','test','1.08'),('2018-08-27 23:59:59','2018-08-28 03:59:59','TNTBTC','4h','0.000002940000000','0.000002930000000','0.031172765624394','0.031066735809345','10602.981504895995','10602.981504895995386','test','test','0.34'),('2018-08-28 07:59:59','2018-09-02 11:59:59','TNTBTC','4h','0.000002950000000','0.000003110000000','0.031149203443272','0.032838651765619','10559.05201466855','10559.052014668550328','test','test','0.0'),('2018-09-02 15:59:59','2018-09-03 07:59:59','TNTBTC','4h','0.000003300000000','0.000003120000000','0.031524636403794','0.029805110781769','9552.920122361751','9552.920122361751055','test','test','5.45'),('2018-09-15 19:59:59','2018-09-25 03:59:59','TNTBTC','4h','0.000002780000000','0.000003930000000','0.031142519598899','0.044025216555278','11202.345179460193','11202.345179460193322','test','test','0.0'),('2018-09-25 07:59:59','2018-09-25 11:59:59','TNTBTC','4h','0.000003760000000','0.000003840000000','0.034005341144761','0.034728859041458','9043.973708713122','9043.973708713121596','test','test','0.0'),('2018-09-25 15:59:59','2018-09-26 03:59:59','TNTBTC','4h','0.000003910000000','0.000003760000000','0.034166122899583','0.032855402072233','8738.138848998184','8738.138848998183676','test','test','3.83'),('2018-09-26 07:59:59','2018-09-29 07:59:59','TNTBTC','4h','0.000003950000000','0.000003960000000','0.033874851604616','0.033960610722602','8575.911798637018','8575.911798637018364','test','test','1.26'),('2018-09-29 11:59:59','2018-10-08 03:59:59','TNTBTC','4h','0.000004030000000','0.000004370000000','0.033893909186391','0.036753444949015','8410.399301833966','8410.399301833966092','test','test','0.0'),('2018-10-08 07:59:59','2018-10-09 15:59:59','TNTBTC','4h','0.000004350000000','0.000004390000000','0.034529361578085','0.034846872948918','7937.784270824165','7937.784270824165105','test','test','0.0'),('2018-10-09 19:59:59','2018-10-10 03:59:59','TNTBTC','4h','0.000004380000000','0.000004290000000','0.034599919660492','0.033888962407194','7899.525036642111','7899.525036642111445','test','test','2.05'),('2018-10-10 11:59:59','2018-10-11 03:59:59','TNTBTC','4h','0.000004540000000','0.000004360000000','0.034441929159760','0.033076390118184','7586.328008757612','7586.328008757612224','test','test','3.96'),('2018-10-13 19:59:59','2018-10-14 03:59:59','TNTBTC','4h','0.000004430000000','0.000004320000000','0.034138476039409','0.033290793790123','7706.202266232356','7706.202266232356124','test','test','2.48'),('2018-10-14 07:59:59','2018-10-14 23:59:59','TNTBTC','4h','0.000004360000000','0.000004290000000','0.033950102206235','0.033405031757970','7786.720689503365','7786.720689503365065','test','test','1.60'),('2018-10-15 03:59:59','2018-10-15 07:59:59','TNTBTC','4h','0.000004350000000','0.000004300000000','0.033828975439954','0.033440136641794','7776.775963207716','7776.775963207715904','test','test','1.14'),('2018-10-15 11:59:59','2018-10-15 19:59:59','TNTBTC','4h','0.000004380000000','0.000004270000000','0.033742566818140','0.032895150756497','7703.782378570828','7703.782378570827859','test','test','2.51'),('2018-10-15 23:59:59','2018-10-16 03:59:59','TNTBTC','4h','0.000004410000000','0.000004350000000','0.033554252137775','0.033097731700526','7608.673954144017','7608.673954144017443','test','test','1.36'),('2018-10-16 07:59:59','2018-10-27 15:59:59','TNTBTC','4h','0.000004550000000','0.000005140000000','0.033452803151720','0.037790639164800','7352.264428949404','7352.264428949403737','test','test','0.0'),('2018-10-27 19:59:59','2018-10-27 23:59:59','TNTBTC','4h','0.000005140000000','0.000005230000000','0.034416766710182','0.035019394921061','6695.869009763036','6695.869009763036047','test','test','0.0'),('2018-10-28 03:59:59','2018-10-29 15:59:59','TNTBTC','4h','0.000005250000000','0.000005210000000','0.034550684090377','0.034287440783022','6581.082683881397','6581.082683881397315','test','test','0.95'),('2018-10-29 19:59:59','2018-10-30 11:59:59','TNTBTC','4h','0.000005160000000','0.000005160000000','0.034492185577632','0.034492185577632','6684.532088688331','6684.532088688330987','test','test','0.0'),('2018-10-30 15:59:59','2018-10-31 15:59:59','TNTBTC','4h','0.000005800000000','0.000005370000000','0.034492185577632','0.031935006302049','5946.928547867548','5946.928547867548332','test','test','7.75'),('2018-10-31 19:59:59','2018-11-04 07:59:59','TNTBTC','4h','0.000005440000000','0.000005380000000','0.033923923516391','0.033549762595254','6236.015352277778','6236.015352277778220','test','test','1.28'),('2018-11-08 19:59:59','2018-11-12 11:59:59','TNTBTC','4h','0.000005460000000','0.000005320000000','0.033840776645027','0.032973064423360','6197.9444404811975','6197.944440481197489','test','test','3.84'),('2018-11-12 15:59:59','2018-11-12 19:59:59','TNTBTC','4h','0.000005400000000','0.000005250000000','0.033647951706879','0.032713286381688','6231.102167940577','6231.102167940576692','test','test','2.77'),('2018-11-28 19:59:59','2018-11-28 23:59:59','TNTBTC','4h','0.000003820000000','0.000003880000000','0.033440248301281','0.033965487803395','8753.991701906052','8753.991701906052185','test','test','0.0'),('2018-11-29 07:59:59','2018-11-29 15:59:59','TNTBTC','4h','0.000003850000000','0.000003870000000','0.033556968190640','0.033731290103319','8716.09563393241','8716.095633932409328','test','test','0.0'),('2018-11-29 19:59:59','2018-11-30 07:59:59','TNTBTC','4h','0.000003940000000','0.000003990000000','0.033595706393457','0.034022047845151','8526.82903387242','8526.829033872420041','test','test','2.28'),('2018-11-30 11:59:59','2018-12-03 03:59:59','TNTBTC','4h','0.000003990000000','0.000003950000000','0.033690448938278','0.033352700076741','8443.721538415597','8443.721538415597024','test','test','1.00'),('2018-12-03 07:59:59','2018-12-03 15:59:59','TNTBTC','4h','0.000003990000000','0.000003870000000','0.033615393635714','0.032604404353437','8424.91068564272','8424.910685642720637','test','test','3.00'),('2018-12-04 15:59:59','2018-12-04 23:59:59','TNTBTC','4h','0.000004060000000','0.000003970000000','0.033390729350764','0.032650540769097','8224.317574079803','8224.317574079803308','test','test','2.21'),('2018-12-05 07:59:59','2018-12-05 19:59:59','TNTBTC','4h','0.000003980000000','0.000003960000000','0.033226242999282','0.033059276954059','8348.302261126242','8348.302261126242229','test','test','0.50'),('2018-12-12 19:59:59','2018-12-15 03:59:59','TNTBTC','4h','0.000003840000000','0.000003560000000','0.033189139433677','0.030769098016638','8643.005060853473','8643.005060853472969','test','test','7.29'),('2018-12-15 07:59:59','2018-12-15 11:59:59','TNTBTC','4h','0.000003740000000','0.000003690000000','0.032651352452113','0.032214837044999','8730.308142276233','8730.308142276233411','test','test','1.33'),('2018-12-15 15:59:59','2018-12-16 03:59:59','TNTBTC','4h','0.000003810000000','0.000003740000000','0.032554349028310','0.031956237628840','8544.448563860893','8544.448563860893046','test','test','1.83'),('2018-12-16 07:59:59','2018-12-16 11:59:59','TNTBTC','4h','0.000003740000000','0.000003710000000','0.032421435383983','0.032161370394272','8668.832990369876','8668.832990369875915','test','test','0.80'),('2018-12-17 07:59:59','2018-12-17 15:59:59','TNTBTC','4h','0.000003750000000','0.000003860000000','0.032363643164048','0.033312976696860','8630.304843746015','8630.304843746014740','test','test','0.0'),('2018-12-17 19:59:59','2018-12-17 23:59:59','TNTBTC','4h','0.000003720000000','0.000003640000000','0.032574606171339','0.031874077006364','8756.614562187935','8756.614562187935007','test','test','2.15'),('2018-12-24 15:59:59','2018-12-24 23:59:59','TNTBTC','4h','0.000003570000000','0.000003570000000','0.032418933023567','0.032418933023567','9080.933620046748','9080.933620046747819','test','test','0.0'),('2019-01-05 23:59:59','2019-01-06 03:59:59','TNTBTC','4h','0.000003170000000','0.000003140000000','0.032418933023567','0.032112129241010','10226.792751913845','10226.792751913844768','test','test','0.94'),('2019-01-06 11:59:59','2019-01-07 23:59:59','TNTBTC','4h','0.000003240000000','0.000003180000000','0.032350754405221','0.031751666360680','9984.800742352129','9984.800742352128509','test','test','1.85'),('2019-01-08 15:59:59','2019-01-08 19:59:59','TNTBTC','4h','0.000003220000000','0.000003150000000','0.032217623728656','0.031517240604120','10005.473207657213','10005.473207657212697','test','test','2.17'),('2019-01-09 07:59:59','2019-01-10 07:59:59','TNTBTC','4h','0.000003220000000','0.000003160000000','0.032061983034315','0.031464554779017','9957.137588296551','9957.137588296551257','test','test','1.86'),('2019-01-12 15:59:59','2019-01-13 19:59:59','TNTBTC','4h','0.000003280000000','0.000003140000000','0.031929221199804','0.030566388587617','9734.518658476898','9734.518658476898054','test','test','4.26'),('2019-01-14 03:59:59','2019-01-14 07:59:59','TNTBTC','4h','0.000003230000000','0.000003200000000','0.031626369508207','0.031332626138162','9791.445668175578','9791.445668175578248','test','test','0.92'),('2019-01-14 15:59:59','2019-01-20 15:59:59','TNTBTC','4h','0.000003260000000','0.000004210000000','0.031561093203753','0.040758344290736','9681.316933666463','9681.316933666463228','test','test','0.0'),('2019-01-20 19:59:59','2019-01-23 23:59:59','TNTBTC','4h','0.000004270000000','0.000004390000000','0.033604926778638','0.034549327531199','7870.006271343743','7870.006271343742810','test','test','0.0'),('2019-01-24 03:59:59','2019-01-27 03:59:59','TNTBTC','4h','0.000004350000000','0.000004320000000','0.033814793612540','0.033581588139350','7773.5157729977545','7773.515772997754539','test','test','0.68'),('2019-02-01 15:59:59','2019-02-01 19:59:59','TNTBTC','4h','0.000004230000000','0.000004150000000','0.033762970174054','0.033124427002913','7981.789639256161','7981.789639256160626','test','test','1.89'),('2019-02-09 19:59:59','2019-02-09 23:59:59','TNTBTC','4h','0.000004060000000','0.000004000000000','0.033621071691578','0.033124208563131','8281.052140782705','8281.052140782705465','test','test','1.47'),('2019-02-10 03:59:59','2019-02-10 07:59:59','TNTBTC','4h','0.000004140000000','0.000004130000000','0.033510657663034','0.033429714045490','8094.361754356039','8094.361754356038546','test','test','0.24'),('2019-02-10 11:59:59','2019-02-11 19:59:59','TNTBTC','4h','0.000004150000000','0.000004050000000','0.033492670192469','0.032685617898675','8070.522937944259','8070.522937944258956','test','test','2.65'),('2019-02-11 23:59:59','2019-02-12 03:59:59','TNTBTC','4h','0.000004040000000','0.000003990000000','0.033313325238292','0.032901031609105','8245.8725837357','8245.872583735699664','test','test','1.23'),('2019-02-18 15:59:59','2019-02-18 19:59:59','TNTBTC','4h','0.000004020000000','0.000003910000000','0.033221704431806','0.032312652818000','8264.1055800513','8264.105580051300421','test','test','2.73'),('2019-02-18 23:59:59','2019-02-19 03:59:59','TNTBTC','4h','0.000003950000000','0.000003900000000','0.033019692962072','0.032601722165084','8359.415939764951','8359.415939764950963','test','test','1.26'),('2019-02-19 19:59:59','2019-02-20 07:59:59','TNTBTC','4h','0.000003960000000','0.000003900000000','0.032926810562741','0.032427919493609','8314.851152207297','8314.851152207296764','test','test','1.51'),('2019-02-20 11:59:59','2019-02-20 15:59:59','TNTBTC','4h','0.000003930000000','0.000003940000000','0.032815945880712','0.032899447015269','8350.113455651797','8350.113455651797267','test','test','0.0'),('2019-02-20 19:59:59','2019-02-21 11:59:59','TNTBTC','4h','0.000003930000000','0.000003930000000','0.032834501688391','0.032834501688391','8354.83503521397','8354.835035213969604','test','test','0.0'),('2019-02-21 15:59:59','2019-02-21 23:59:59','TNTBTC','4h','0.000003960000000','0.000004020000000','0.032834501688391','0.033331994138215','8291.54083040174','8291.540830401740095','test','test','0.25'),('2019-02-22 03:59:59','2019-02-24 07:59:59','TNTBTC','4h','0.000004010000000','0.000004040000000','0.032945055566130','0.033191527303532','8215.724580082184','8215.724580082183820','test','test','0.0'),('2019-02-25 11:59:59','2019-02-25 15:59:59','TNTBTC','4h','0.000004130000000','0.000004040000000','0.032999827063330','0.032280702502628','7990.272896690073','7990.272896690073139','test','test','2.17'),('2019-02-26 07:59:59','2019-02-27 15:59:59','TNTBTC','4h','0.000004050000000','0.000004000000000','0.032840021605396','0.032434589239897','8108.647309974375','8108.647309974375275','test','test','1.23'),('2019-02-27 19:59:59','2019-02-27 23:59:59','TNTBTC','4h','0.000004040000000','0.000004050000000','0.032749925524174','0.032830989696264','8106.417208954015','8106.417208954015223','test','test','0.0'),('2019-02-28 03:59:59','2019-02-28 07:59:59','TNTBTC','4h','0.000004040000000','0.000004000000000','0.032767939784639','0.032443504737266','8110.876184316502','8110.876184316502076','test','test','0.99'),('2019-02-28 23:59:59','2019-03-01 03:59:59','TNTBTC','4h','0.000004040000000','0.000004110000000','0.032695843107445','0.033262355240495','8093.03047213977','8093.030472139769699','test','test','0.0'),('2019-03-01 07:59:59','2019-03-01 15:59:59','TNTBTC','4h','0.000004090000000','0.000004020000000','0.032821734692567','0.032259993512010','8024.874007962565','8024.874007962564974','test','test','1.71'),('2019-03-02 03:59:59','2019-03-02 07:59:59','TNTBTC','4h','0.000004100000000','0.000004020000000','0.032696903319110','0.032058914961664','7974.854468075557','7974.854468075556724','test','test','1.95'),('2019-03-04 03:59:59','2019-03-04 07:59:59','TNTBTC','4h','0.000004060000000','0.000004040000000','0.032555128128566','0.032394758039263','8018.504465164094','8018.504465164093745','test','test','0.49'),('2019-03-04 11:59:59','2019-03-04 15:59:59','TNTBTC','4h','0.000004040000000','0.000004190000000','0.032519490330943','0.033726897150161','8049.378794787954','8049.378794787953666','test','test','0.0'),('2019-03-04 19:59:59','2019-03-05 19:59:59','TNTBTC','4h','0.000004130000000','0.000004210000000','0.032787802957436','0.033422917784699','7938.935340783589','7938.935340783588799','test','test','0.0'),('2019-03-05 23:59:59','2019-03-06 11:59:59','TNTBTC','4h','0.000004170000000','0.000004120000000','0.032928939585717','0.032534108175816','7896.628198013643','7896.628198013642759','test','test','1.67'),('2019-03-06 15:59:59','2019-03-07 03:59:59','TNTBTC','4h','0.000004150000000','0.000004100000000','0.032841199272406','0.032445522172738','7913.541993350735','7913.541993350734629','test','test','1.20'),('2019-03-07 07:59:59','2019-03-07 11:59:59','TNTBTC','4h','0.000004100000000','0.000004100000000','0.032753271028035','0.032753271028035','7988.602689764607','7988.602689764607021','test','test','0.0'),('2019-03-07 15:59:59','2019-03-11 15:59:59','TNTBTC','4h','0.000004090000000','0.000004270000000','0.032753271028035','0.034194735278658','8008.134725680902','8008.134725680902193','test','test','0.0'),('2019-03-11 19:59:59','2019-03-12 01:59:59','TNTBTC','4h','0.000004280000000','0.000004270000000','0.033073596417062','0.032996321659078','7727.475798379024','7727.475798379024127','test','test','0.23'),('2019-03-12 11:59:59','2019-03-21 15:59:59','TNTBTC','4h','0.000004610000000','0.000004570000000','0.033056424248621','0.032769600610889','7170.59094330181','7170.590943301809602','test','test','0.86'),('2019-03-25 23:59:59','2019-03-26 03:59:59','TNTBTC','4h','0.000004660000000','0.000004740000000','0.032992685662459','0.033559083699583','7079.975464046925','7079.975464046924571','test','test','0.0'),('2019-03-26 07:59:59','2019-03-26 11:59:59','TNTBTC','4h','0.000004670000000','0.000004600000000','0.033118551892931','0.032622128202887','7091.767000627552','7091.767000627552079','test','test','1.49'),('2019-03-26 15:59:59','2019-04-02 07:59:59','TNTBTC','4h','0.000004820000000','0.000004880000000','0.033008235517365','0.033419126415921','6848.181642606916','6848.181642606916284','test','test','0.20'),('2019-04-20 15:59:59','2019-04-20 19:59:59','TNTBTC','4h','0.000004070000000','0.000004030000000','0.033099544605933','0.032774241956243','8132.566242244062','8132.566242244061868','test','test','0.98');
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

-- Dump completed on 2020-04-30 17:34:13
