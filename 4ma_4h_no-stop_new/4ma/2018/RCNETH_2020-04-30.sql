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
INSERT INTO `trades` VALUES ('2018-06-02 15:59:59','2018-06-03 03:59:59','RCNETH','4h','0.000155970000000','0.000153310000000','1.297777777777778','1.275644746496833','8320.688451482834','8320.688451482834353','test','test','1.70'),('2018-07-02 15:59:59','2018-07-06 11:59:59','RCNETH','4h','0.000111240000000','0.000105120000000','1.292859326382012','1.221731143377176','11622.252124973142','11622.252124973141690','test','test','5.50'),('2018-07-18 15:59:59','2018-07-19 19:59:59','RCNETH','4h','0.000110070000000','0.000100850000000','1.277053063492049','1.170080870838313','11602.190092596064','11602.190092596063550','test','test','8.37'),('2018-07-29 03:59:59','2018-07-31 11:59:59','RCNETH','4h','0.000106840000000','0.000100490000000','1.253281465124552','1.178793096502866','11730.451751446573','11730.451751446573326','test','test','8.91'),('2018-08-26 07:59:59','2018-08-29 07:59:59','RCNETH','4h','0.000076470000000','0.000075000000000','1.236728494319733','1.212954584464234','16172.727792856447','16172.727792856447195','test','test','1.92'),('2018-08-31 23:59:59','2018-09-02 15:59:59','RCNETH','4h','0.000077910000000','0.000074620000000','1.231445403240733','1.179443665637575','15805.999271476483','15805.999271476483045','test','test','4.22'),('2018-09-02 23:59:59','2018-09-04 07:59:59','RCNETH','4h','0.000077000000000','0.000078240000000','1.219889461551142','1.239534434698199','15842.720279884963','15842.720279884963020','test','test','1.41'),('2018-09-04 15:59:59','2018-09-13 15:59:59','RCNETH','4h','0.000079160000000','0.000098510000000','1.224255011139377','1.523513910400961','15465.57618922912','15465.576189229119336','test','test','2.13'),('2018-09-16 07:59:59','2018-09-21 07:59:59','RCNETH','4h','0.000114750000000','0.000127510000000','1.290756988753062','1.434286916217019','11248.426917238015','11248.426917238015449','test','test','6.30'),('2018-09-26 03:59:59','2018-09-27 15:59:59','RCNETH','4h','0.000123790000000','0.000121940000000','1.322652528189497','1.302885930102813','10684.647614423597','10684.647614423596679','test','test','1.49'),('2018-09-29 03:59:59','2018-09-29 11:59:59','RCNETH','4h','0.000129040000000','0.000122360000000','1.318259950836901','1.250017727715462','10215.901664886089','10215.901664886088838','test','test','5.17'),('2018-09-29 15:59:59','2018-09-29 19:59:59','RCNETH','4h','0.000122850000000','0.000119120000000','1.303095012365470','1.263530141416156','10607.204007858934','10607.204007858934347','test','test','3.03'),('2018-10-04 15:59:59','2018-10-07 15:59:59','RCNETH','4h','0.000126610000000','0.000129620000000','1.294302818821178','1.325073306813056','10222.753485673942','10222.753485673942123','test','test','0.0'),('2018-10-09 15:59:59','2018-10-11 07:59:59','RCNETH','4h','0.000131130000000','0.000131220000000','1.301140705041595','1.302033732292825','9922.525013662742','9922.525013662741912','test','test','0.61'),('2018-10-11 11:59:59','2018-10-11 23:59:59','RCNETH','4h','0.000136410000000','0.000129400000000','1.301339155541869','1.234464384774707','9539.910237826174','9539.910237826174125','test','test','5.13'),('2018-10-13 15:59:59','2018-10-15 07:59:59','RCNETH','4h','0.000136200000000','0.000125000000000','1.286478095371388','1.180688413519996','9445.507308159971','9445.507308159971217','test','test','8.22'),('2018-10-17 15:59:59','2018-10-18 19:59:59','RCNETH','4h','0.000136290000000','0.000134880000000','1.262969277182190','1.249903119130778','9266.778759866385','9266.778759866385371','test','test','1.03'),('2018-10-18 23:59:59','2018-10-25 11:59:59','RCNETH','4h','0.000138370000000','0.000147110000000','1.260065686504098','1.339656451121037','9106.494807430066','9106.494807430066430','test','test','1.85'),('2018-10-27 23:59:59','2018-10-30 11:59:59','RCNETH','4h','0.000168550000000','0.000156740000000','1.277752523085640','1.188222666677207','7580.8515163787615','7580.851516378761517','test','test','7.00'),('2018-10-30 23:59:59','2018-11-03 19:59:59','RCNETH','4h','0.000169880000000','0.000163940000000','1.257856999439322','1.213874949894528','7404.385445251484','7404.385445251484271','test','test','6.43'),('2018-11-08 11:59:59','2018-11-09 11:59:59','RCNETH','4h','0.000165020000000','0.000163530000000','1.248083210651590','1.236814007016450','7563.223916201612','7563.223916201612155','test','test','0.90'),('2018-11-09 19:59:59','2018-11-10 07:59:59','RCNETH','4h','0.000166690000000','0.000162000000000','1.245578943177114','1.210533258112019','7472.427519209998','7472.427519209997627','test','test','2.81'),('2018-11-28 11:59:59','2018-11-30 15:59:59','RCNETH','4h','0.000139380000000','0.000133820000000','1.237791013162649','1.188414359172232','8880.693163744072','8880.693163744072081','test','test','5.58'),('2018-12-01 15:59:59','2018-12-06 03:59:59','RCNETH','4h','0.000152100000000','0.000145390000000','1.226818423387001','1.172696453492676','8065.86734639711','8065.867346397109941','test','test','4.84'),('2019-01-12 03:59:59','2019-01-14 15:59:59','RCNETH','4h','0.000086100000000','0.000084480000000','1.214791318966040','1.191934618191069','14109.074552451097','14109.074552451096679','test','test','1.88'),('2019-01-14 19:59:59','2019-01-22 19:59:59','RCNETH','4h','0.000085540000000','0.000104760000000','1.209712052127157','1.481522499191501','14142.062802515278','14142.062802515278236','test','test','0.0'),('2019-01-29 03:59:59','2019-01-31 03:59:59','RCNETH','4h','0.000104870000000','0.000103180000000','1.270114373697011','1.249646238944003','12111.322339057988','12111.322339057987847','test','test','1.93'),('2019-02-08 07:59:59','2019-02-08 11:59:59','RCNETH','4h','0.000101090000000','0.000097830000000','1.265565899307454','1.224753308232745','12519.199716168305','12519.199716168304803','test','test','3.22'),('2019-02-22 07:59:59','2019-02-24 11:59:59','RCNETH','4h','0.000118400000000','0.000102000000000','1.256496434624185','1.082454698747186','10612.300968109674','10612.300968109673704','test','test','13.8'),('2019-02-24 23:59:59','2019-03-03 19:59:59','RCNETH','4h','0.000111500000000','0.000147810000000','1.217820493318186','1.614404010021176','10922.156890746059','10922.156890746058707','test','test','2.34'),('2019-03-04 19:59:59','2019-03-06 03:59:59','RCNETH','4h','0.000161530000000','0.000152410000000','1.305950163696628','1.232216086479311','8084.876887863727','8084.876887863726552','test','test','5.99'),('2019-03-08 11:59:59','2019-03-11 07:59:59','RCNETH','4h','0.000172190000000','0.000163420000000','1.289564813203891','1.223884556442185','7489.196894151174','7489.196894151174092','test','test','5.09'),('2019-03-12 19:59:59','2019-03-13 03:59:59','RCNETH','4h','0.000179150000000','0.000169370000000','1.274969200590178','1.205367197900968','7116.769191125752','7116.769191125751604','test','test','5.45'),('2019-03-13 11:59:59','2019-03-13 15:59:59','RCNETH','4h','0.000170680000000','0.000168850000000','1.259502088881465','1.245997935948180','7379.3185427786775','7379.318542778677511','test','test','1.07'),('2019-03-14 23:59:59','2019-03-16 19:59:59','RCNETH','4h','0.000179620000000','0.000172420000000','1.256501166007401','1.206134790351832','6995.329952162351','6995.329952162351219','test','test','4.00'),('2019-03-17 11:59:59','2019-03-17 15:59:59','RCNETH','4h','0.000175350000000','0.000172920000000','1.245308638083942','1.228051153107928','7101.845669141383','7101.845669141383041','test','test','1.38'),('2019-03-17 23:59:59','2019-03-20 19:59:59','RCNETH','4h','0.000174540000000','0.000176620000000','1.241473641422605','1.256268331316950','7112.831679973676','7112.831679973675818','test','test','0.30'),('2019-03-27 23:59:59','2019-04-02 07:59:59','RCNETH','4h','0.000179210000000','0.000208630000000','1.244761350288015','1.449107530330833','6945.825290374507','6945.825290374506949','test','test','0.0'),('2019-04-14 03:59:59','2019-04-14 23:59:59','RCNETH','4h','0.000191200000000','0.000184500000000','1.290171612519753','1.244961624005724','6747.759479705819','6747.759479705819103','test','test','3.50'),('2019-04-15 07:59:59','2019-04-15 23:59:59','RCNETH','4h','0.000185420000000','0.000185460000000','1.280124948405524','1.280401105227529','6903.920550132261','6903.920550132261269','test','test','0.06'),('2019-04-16 03:59:59','2019-04-17 23:59:59','RCNETH','4h','0.000187160000000','0.000187050000000','1.280186316588192','1.279433909584427','6840.063670593033','6840.063670593032839','test','test','0.30'),('2019-04-20 11:59:59','2019-04-20 23:59:59','RCNETH','4h','0.000193870000000','0.000185540000000','1.280019115031800','1.225020614860474','6602.461004961055','6602.461004961054641','test','test','4.29'),('2019-04-21 03:59:59','2019-04-21 11:59:59','RCNETH','4h','0.000187820000000','0.000182640000000','1.267797226104838','1.232831888913788','6750.06509479735','6750.065094797349957','test','test','2.75');
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

-- Dump completed on 2020-04-30 23:18:27
