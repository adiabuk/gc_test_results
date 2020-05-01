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
INSERT INTO `trades` VALUES ('2019-09-18 03:59:59','2019-09-21 19:59:59','OMGUSDT','4h','1.122000000000000','1.114400000000000','222.222222222222200','220.716973658150096','198.05902158843332','198.059021588433325','test','test','1.89'),('2019-10-07 03:59:59','2019-10-10 11:59:59','OMGUSDT','4h','0.878700000000000','0.892200000000000','221.887722541317316','225.296717937138141','252.51817746821135','252.518177468211348','test','test','0.68'),('2019-10-26 03:59:59','2019-10-30 15:59:59','OMGUSDT','4h','0.868000000000000','0.964000000000000','222.645277073721928','247.269639515055218','256.5037754305552','256.503775430555208','test','test','4.51'),('2019-11-02 15:59:59','2019-11-03 11:59:59','OMGUSDT','4h','0.984200000000000','0.944500000000000','228.117357616240469','218.915712526457156','231.77947329429026','231.779473294290256','test','test','4.03'),('2019-11-04 15:59:59','2019-11-07 07:59:59','OMGUSDT','4h','0.983700000000000','0.994000000000000','226.072547596288587','228.439679079710118','229.81859062345083','229.818590623450831','test','test','1.11'),('2019-11-14 03:59:59','2019-11-14 07:59:59','OMGUSDT','4h','0.988400000000000','0.965800000000000','226.598576814826743','221.417346709590930','229.25796925822212','229.257969258222118','test','test','2.28'),('2019-11-14 15:59:59','2019-11-15 15:59:59','OMGUSDT','4h','0.981500000000000','1.007000000000000','225.447192346996530','231.304455113016274','229.69657905959912','229.696579059599117','test','test','0.0'),('2019-11-15 19:59:59','2019-11-17 07:59:59','OMGUSDT','4h','1.018400000000000','0.991500000000000','226.748806295000918','220.759467244200152','222.65200932344945','222.652009323449448','test','test','2.64'),('2019-11-17 11:59:59','2019-11-18 07:59:59','OMGUSDT','4h','1.025900000000000','1.006600000000000','225.417842061489637','221.177112602685867','219.726914963924','219.726914963924003','test','test','1.88'),('2020-01-05 15:59:59','2020-01-08 19:59:59','OMGUSDT','4h','0.647300000000000','0.642800000000000','224.475457737311018','222.914914620027105','346.7873593964329','346.787359396432919','test','test','1.63'),('2020-01-11 03:59:59','2020-01-13 15:59:59','OMGUSDT','4h','0.663000000000000','0.660400000000000','224.128670377914631','223.249734415648277','338.0522931793584','338.052293179358401','test','test','0.39'),('2020-01-14 03:59:59','2020-01-19 19:59:59','OMGUSDT','4h','0.688500000000000','0.780600000000000','223.933351275188755','253.888705890213970','325.24815000027417','325.248150000274165','test','test','0.0'),('2020-01-21 23:59:59','2020-01-23 15:59:59','OMGUSDT','4h','0.838000000000000','0.776600000000000','230.590096745194359','213.694831900140741','275.1671798868668','275.167179886866791','test','test','7.32'),('2020-01-27 03:59:59','2020-02-08 07:59:59','OMGUSDT','4h','0.807400000000000','1.115900000000000','226.835593446293529','313.507355371214942','280.9457436788377','280.945743678837687','test','test','0.54'),('2020-02-08 11:59:59','2020-02-10 11:59:59','OMGUSDT','4h','1.138400000000000','1.078400000000000','246.095984985164961','233.125360337317176','216.17707746412944','216.177077464129439','test','test','5.27'),('2020-02-11 11:59:59','2020-02-11 23:59:59','OMGUSDT','4h','1.161100000000000','1.197900000000000','243.213623952309916','250.922056784490593','209.46828348317106','209.468283483171064','test','test','0.0'),('2020-02-12 03:59:59','2020-02-16 15:59:59','OMGUSDT','4h','1.233500000000000','1.176100000000000','244.926609026127863','233.529132448827681','198.5623097090619','198.562309709061907','test','test','4.65');
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

-- Dump completed on 2020-04-30 22:23:40
