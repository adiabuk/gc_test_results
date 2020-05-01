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
INSERT INTO `trades` VALUES ('2018-07-03 19:59:59','2018-07-05 03:59:59','LTCETH','4h','0.186040000000000','0.180830000000000','1.297777777777778','1.261433861296256','6.975799708545353','6.975799708545353','test','test','2.80'),('2018-07-14 07:59:59','2018-07-14 11:59:59','LTCETH','4h','0.176520000000000','0.175470000000000','1.289701351892995','1.282029776890232','7.306261907392901','7.306261907392901','test','test','0.59'),('2018-07-15 03:59:59','2018-07-15 07:59:59','LTCETH','4h','0.177350000000000','0.176580000000000','1.287996557447937','1.282404466389381','7.262455920202631','7.262455920202631','test','test','0.43'),('2018-07-18 03:59:59','2018-07-21 03:59:59','LTCETH','4h','0.181160000000000','0.177600000000000','1.286753870546036','1.261467693800927','7.102858636266481','7.102858636266481','test','test','1.96'),('2018-07-23 07:59:59','2018-07-26 07:59:59','LTCETH','4h','0.182330000000000','0.180880000000000','1.281134720158233','1.270946351024084','7.02646147182709','7.026461471827090','test','test','0.86'),('2018-08-01 03:59:59','2018-08-04 19:59:59','LTCETH','4h','0.184150000000000','0.179560000000000','1.278870638128422','1.246994362108821','6.9447224443574385','6.944722444357438','test','test','2.49'),('2018-08-12 15:59:59','2018-08-16 15:59:59','LTCETH','4h','0.186030000000000','0.192100000000000','1.271787021235178','1.313284345424274','6.836461975139374','6.836461975139374','test','test','0.52'),('2018-08-16 19:59:59','2018-08-16 23:59:59','LTCETH','4h','0.194250000000000','0.192570000000000','1.281008648832755','1.269929655113120','6.594639118830139','6.594639118830139','test','test','0.86'),('2018-08-17 15:59:59','2018-08-18 07:59:59','LTCETH','4h','0.197800000000000','0.190460000000000','1.278546650228391','1.231102098091503','6.463835440992878','6.463835440992878','test','test','3.71'),('2018-08-19 03:59:59','2018-08-19 11:59:59','LTCETH','4h','0.196720000000000','0.190330000000000','1.268003416420194','1.226815220858355','6.445727004982685','6.445727004982685','test','test','3.24'),('2018-08-20 15:59:59','2018-09-13 15:59:59','LTCETH','4h','0.195860000000000','0.267790000000000','1.258850484073119','1.721165991677425','6.427297478163579','6.427297478163579','test','test','0.18'),('2018-09-25 19:59:59','2018-09-29 11:59:59','LTCETH','4h','0.267250000000000','0.266050000000000','1.361587263540742','1.355473494724095','5.094807347205771','5.094807347205771','test','test','1.94'),('2018-10-12 03:59:59','2018-10-15 07:59:59','LTCETH','4h','0.268000000000000','0.261250000000000','1.360228648248154','1.325969158040411','5.075480030776694','5.075480030776694','test','test','2.51'),('2018-11-04 07:59:59','2018-11-04 19:59:59','LTCETH','4h','0.257430000000000','0.255040000000000','1.352615428201989','1.340057642111002','5.254303803760202','5.254303803760202','test','test','0.92'),('2018-11-04 23:59:59','2018-11-05 03:59:59','LTCETH','4h','0.257270000000000','0.256190000000000','1.349824809070658','1.344158346623438','5.246724488166745','5.246724488166745','test','test','0.41'),('2018-11-05 07:59:59','2018-11-05 11:59:59','LTCETH','4h','0.257530000000000','0.256240000000000','1.348565595193499','1.341810461353560','5.236537860418198','5.236537860418198','test','test','0.50'),('2018-11-06 03:59:59','2018-11-06 11:59:59','LTCETH','4h','0.258360000000000','0.255660000000000','1.347064454340178','1.332986911273455','5.213904839526934','5.213904839526934','test','test','1.04'),('2018-11-20 15:59:59','2018-11-20 19:59:59','LTCETH','4h','0.246030000000000','0.247730000000000','1.343936111436462','1.353222342340994','5.4624887673717115','5.462488767371712','test','test','0.0'),('2018-11-20 23:59:59','2018-11-30 15:59:59','LTCETH','4h','0.252840000000000','0.278350000000000','1.345999718304136','1.481802806478232','5.323523644613732','5.323523644613732','test','test','1.83'),('2018-12-01 15:59:59','2018-12-03 11:59:59','LTCETH','4h','0.291250000000000','0.283090000000000','1.376178182342824','1.337621567860704','4.72507530418137','4.725075304181370','test','test','2.80'),('2018-12-06 07:59:59','2018-12-07 15:59:59','LTCETH','4h','0.290060000000000','0.283480000000000','1.367610045791242','1.336585864238093','4.714921208685245','4.714921208685245','test','test','2.26'),('2018-12-16 03:59:59','2018-12-19 03:59:59','LTCETH','4h','0.301190000000000','0.293550000000000','1.360715783223875','1.326199801339249','4.517798675998125','4.517798675998125','test','test','2.53'),('2019-01-06 23:59:59','2019-01-11 23:59:59','LTCETH','4h','0.249510000000000','0.252610000000000','1.353045565027292','1.369856279033082','5.422810969609602','5.422810969609602','test','test','0.64'),('2019-01-13 07:59:59','2019-01-14 15:59:59','LTCETH','4h','0.263210000000000','0.251430000000000','1.356781279250801','1.296058345207359','5.154748221005285','5.154748221005285','test','test','4.47'),('2019-01-16 19:59:59','2019-01-17 07:59:59','LTCETH','4h','0.257580000000000','0.253740000000000','1.343287293907814','1.323261580697914','5.215029481744755','5.215029481744755','test','test','1.49'),('2019-01-17 23:59:59','2019-02-06 23:59:59','LTCETH','4h','0.258490000000000','0.314100000000000','1.338837135416725','1.626866587621932','5.179454274504719','5.179454274504719','test','test','0.97'),('2019-02-07 15:59:59','2019-02-11 19:59:59','LTCETH','4h','0.317360000000000','0.353590000000000','1.402843680351215','1.562993121172757','4.420354425104661','4.420354425104661','test','test','0.03'),('2019-02-17 03:59:59','2019-02-17 11:59:59','LTCETH','4h','0.353370000000000','0.342220000000000','1.438432444978225','1.393045112263203','4.070612799553512','4.070612799553512','test','test','3.15'),('2019-03-01 03:59:59','2019-03-11 11:59:59','LTCETH','4h','0.338200000000000','0.411520000000000','1.428346371041553','1.738004431138438','4.223377797284307','4.223377797284307','test','test','0.0'),('2019-03-12 19:59:59','2019-03-18 15:59:59','LTCETH','4h','0.423970000000000','0.429770000000000','1.497159273285305','1.517640731372091','3.5312858770321136','3.531285877032114','test','test','1.21'),('2019-03-20 15:59:59','2019-03-26 11:59:59','LTCETH','4h','0.434530000000000','0.436460000000000','1.501710708415702','1.508380677502398','3.4559425319671875','3.455942531967187','test','test','1.23'),('2019-03-27 11:59:59','2019-03-28 15:59:59','LTCETH','4h','0.440850000000000','0.438100000000000','1.503192923768301','1.493816082347494','3.4097605166571423','3.409760516657142','test','test','0.62'),('2019-03-28 23:59:59','2019-03-29 03:59:59','LTCETH','4h','0.439070000000000','0.437650000000000','1.501109181230344','1.496254431333182','3.4188379557481587','3.418837955748159','test','test','0.32'),('2019-04-02 15:59:59','2019-04-08 03:59:59','LTCETH','4h','0.454390000000000','0.501560000000000','1.500030347919864','1.655747752597299','3.301195774378537','3.301195774378537','test','test','0.11'),('2019-05-03 11:59:59','2019-05-06 03:59:59','LTCETH','4h','0.470640000000000','0.449870000000000','1.534634215625960','1.466908666036993','3.260739026912205','3.260739026912205','test','test','4.41'),('2019-05-12 07:59:59','2019-05-13 15:59:59','LTCETH','4h','0.458300000000000','0.449710000000000','1.519584093495079','1.491102253296251','3.315697345614398','3.315697345614398','test','test','1.87'),('2019-05-25 15:59:59','2019-05-30 07:59:59','LTCETH','4h','0.404270000000000','0.413760000000000','1.513254795673117','1.548777560189252','3.743178558075338','3.743178558075338','test','test','0.45');
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

-- Dump completed on 2020-04-30 22:52:59
