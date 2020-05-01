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
INSERT INTO `trades` VALUES ('2018-05-30 03:59:59','2018-06-03 15:59:59','ADAETH','4h','0.000362570000000','0.000371000000000','1.297777777777778','1.327951997009007','3579.3854366819587','3579.385436681958709','test','test','0.0'),('2018-07-01 19:59:59','2018-07-05 15:59:59','ADAETH','4h','0.000310920000000','0.000317210000000','1.304483159829162','1.330873225039909','4195.558857034484','4195.558857034484390','test','test','0.0'),('2018-07-14 15:59:59','2018-07-21 03:59:59','ADAETH','4h','0.000314100000000','0.000353990000000','1.310347618764883','1.476758846120920','4171.7530046637485','4171.753004663748470','test','test','0.23'),('2018-07-22 15:59:59','2018-07-24 03:59:59','ADAETH','4h','0.000375120000000','0.000360500000000','1.347327891510669','1.294816871639998','3591.725025353672','3591.725025353672208','test','test','3.89'),('2018-08-10 07:59:59','2018-08-10 11:59:59','ADAETH','4h','0.000334600000000','0.000325700000000','1.335658775983854','1.300131689593369','3991.8074596050624','3991.807459605062377','test','test','2.65'),('2018-08-10 15:59:59','2018-08-14 03:59:59','ADAETH','4h','0.000331260000000','0.000347180000000','1.327763867897079','1.391574774064203','4008.2227491912067','4008.222749191206731','test','test','0.0'),('2018-08-20 11:59:59','2018-08-20 15:59:59','ADAETH','4h','0.000339750000000','0.000338110000000','1.341944069267551','1.335466399588084','3949.798585040622','3949.798585040622129','test','test','0.48'),('2018-08-20 23:59:59','2018-08-21 03:59:59','ADAETH','4h','0.000338920000000','0.000334250000000','1.340504587116559','1.322033690085300','3955.224203695736','3955.224203695735923','test','test','1.37'),('2018-08-26 19:59:59','2018-09-02 11:59:59','ADAETH','4h','0.000339450000000','0.000354700000000','1.336399943331834','1.396438532625723','3936.956675009086','3936.956675009086212','test','test','0.0'),('2018-09-04 03:59:59','2018-09-05 15:59:59','ADAETH','4h','0.000362570000000','0.000362790000000','1.349741852063810','1.350560847588685','3722.7069312513718','3722.706931251371770','test','test','0.0'),('2018-09-05 19:59:59','2018-09-10 11:59:59','ADAETH','4h','0.000368320000000','0.000380880000000','1.349923851069337','1.395957309935081','3665.0843045974625','3665.084304597462506','test','test','0.34'),('2018-09-20 23:59:59','2018-09-22 03:59:59','ADAETH','4h','0.000361150000000','0.000342910000000','1.360153508595058','1.291458506527291','3766.173358978425','3766.173358978424858','test','test','5.05'),('2018-09-22 07:59:59','2018-09-22 11:59:59','ADAETH','4h','0.000346750000000','0.000344910000000','1.344887952579999','1.337751416652826','3878.55213433309','3878.552134333090180','test','test','0.53'),('2018-09-23 07:59:59','2018-09-25 03:59:59','ADAETH','4h','0.000371300000000','0.000358860000000','1.343302055707294','1.298296190980661','3617.834785099095','3617.834785099094915','test','test','3.73'),('2018-09-25 07:59:59','2018-09-29 11:59:59','ADAETH','4h','0.000361900000000','0.000367380000000','1.333300752434709','1.353489998423496','3684.168976056117','3684.168976056117117','test','test','0.52'),('2018-10-07 23:59:59','2018-10-11 07:59:59','ADAETH','4h','0.000374290000000','0.000376290000000','1.337787251543328','1.344935651188220','3574.1998224460394','3574.199822446039434','test','test','0.16'),('2018-10-12 11:59:59','2018-10-12 23:59:59','ADAETH','4h','0.000378510000000','0.000372630000000','1.339375784797749','1.318569122847970','3538.547950642648','3538.547950642648175','test','test','1.55'),('2018-10-18 23:59:59','2018-10-19 11:59:59','ADAETH','4h','0.000371990000000','0.000369790000000','1.334752082142242','1.326858174830989','3588.1396869330956','3588.139686933095618','test','test','0.59'),('2018-10-19 15:59:59','2018-10-21 23:59:59','ADAETH','4h','0.000371810000000','0.000372580000000','1.332997880517519','1.335758452766782','3585.158765276671','3585.158765276671147','test','test','0.0'),('2018-11-04 11:59:59','2018-11-04 19:59:59','ADAETH','4h','0.000369170000000','0.000360080000000','1.333611341017355','1.300774092351841','3612.4585990664336','3612.458599066433635','test','test','2.46'),('2018-11-04 23:59:59','2018-11-05 03:59:59','ADAETH','4h','0.000364880000000','0.000361190000000','1.326314174647241','1.312901273681312','3634.9325110919785','3634.932511091978540','test','test','1.01'),('2018-11-05 07:59:59','2018-11-05 11:59:59','ADAETH','4h','0.000361960000000','0.000366150000000','1.323333529988146','1.338652259932478','3656.0214664276327','3656.021466427632731','test','test','0.0'),('2018-11-05 15:59:59','2018-11-07 03:59:59','ADAETH','4h','0.000369940000000','0.000366460000000','1.326737692197997','1.314257162466556','3586.359118229976','3586.359118229976048','test','test','1.28'),('2018-11-29 23:59:59','2018-11-30 11:59:59','ADAETH','4h','0.000354540000000','0.000338890000000','1.323964241146566','1.265522202522028','3734.3155670631413','3734.315567063141316','test','test','4.41'),('2018-12-01 19:59:59','2018-12-04 07:59:59','ADAETH','4h','0.000353230000000','0.000352940000000','1.310977121452224','1.309900816027370','3711.3980167376053','3711.398016737605303','test','test','0.91'),('2018-12-16 19:59:59','2018-12-17 15:59:59','ADAETH','4h','0.000339310000000','0.000350000000000','1.310737942468923','1.352032889876877','3862.9511139339347','3862.951113933934721','test','test','0.0'),('2018-12-18 03:59:59','2018-12-19 23:59:59','ADAETH','4h','0.000350240000000','0.000341060000000','1.319914597448469','1.285318845950705','3768.6003810200687','3768.600381020068653','test','test','2.62'),('2018-12-20 03:59:59','2018-12-20 07:59:59','ADAETH','4h','0.000343920000000','0.000341490000000','1.312226652671188','1.302954988429530','3815.4996879250634','3815.499687925063427','test','test','0.70'),('2018-12-21 03:59:59','2018-12-23 03:59:59','ADAETH','4h','0.000357610000000','0.000341110000000','1.310166282839708','1.249715669974142','3663.6735070040218','3663.673507004021758','test','test','4.61'),('2019-01-07 19:59:59','2019-01-14 15:59:59','ADAETH','4h','0.000318900000000','0.000334790000000','1.296732813314027','1.361345809248677','4066.267837297043','4066.267837297043116','test','test','0.29'),('2019-01-15 23:59:59','2019-01-20 15:59:59','ADAETH','4h','0.000352520000000','0.000363170000000','1.311091256855060','1.350700702802826','3719.1968026071154','3719.196802607115387','test','test','0.0'),('2019-01-21 03:59:59','2019-01-25 11:59:59','ADAETH','4h','0.000367100000000','0.000365110000000','1.319893355954564','1.312738390609019','3595.4599726356955','3595.459972635695522','test','test','0.59'),('2019-01-26 07:59:59','2019-01-26 19:59:59','ADAETH','4h','0.000370580000000','0.000366590000000','1.318303363655554','1.304109315350233','3557.405590305882','3557.405590305882015','test','test','1.07'),('2019-03-02 07:59:59','2019-03-03 03:59:59','ADAETH','4h','0.000319190000000','0.000317160000000','1.315149130698816','1.306784981648662','4120.270468056066','4120.270468056066420','test','test','0.63'),('2019-03-03 15:59:59','2019-03-04 07:59:59','ADAETH','4h','0.000319330000000','0.000318480000000','1.313290430909893','1.309794683982660','4112.64344380388','4112.643443803879563','test','test','0.26'),('2019-03-04 11:59:59','2019-03-05 03:59:59','ADAETH','4h','0.000320580000000','0.000318400000000','1.312513598259397','1.303588276516913','4094.1842855430673','4094.184285543067290','test','test','0.68'),('2019-03-09 15:59:59','2019-03-18 11:59:59','ADAETH','4h','0.000335920000000','0.000359840000000','1.310530193427734','1.403849680885436','3901.3163652885614','3901.316365288561428','test','test','1.63'),('2019-03-18 19:59:59','2019-03-19 11:59:59','ADAETH','4h','0.000361830000000','0.000360420000000','1.331267857307223','1.326080095986152','3679.263348277431','3679.263348277430850','test','test','0.51'),('2019-03-19 15:59:59','2019-04-01 11:59:59','ADAETH','4h','0.000369270000000','0.000490290000000','1.330115021458096','1.766030530155956','3602.0121359928935','3602.012135992893491','test','test','0.0'),('2019-04-01 19:59:59','2019-04-06 11:59:59','ADAETH','4h','0.000507870000000','0.000541550000000','1.426985134502065','1.521617342212758','2809.7448845217573','2809.744884521757285','test','test','1.25'),('2019-04-06 15:59:59','2019-04-06 19:59:59','ADAETH','4h','0.000549540000000','0.000541140000000','1.448014513993330','1.425880871460405','2634.957444395913','2634.957444395913171','test','test','1.52');
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

-- Dump completed on 2020-04-30 22:25:42
