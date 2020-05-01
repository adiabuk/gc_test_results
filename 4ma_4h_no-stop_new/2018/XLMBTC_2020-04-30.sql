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
INSERT INTO `trades` VALUES ('2018-05-31 23:59:59','2018-06-01 19:59:59','XLMBTC','4h','0.000039460000000','0.000038080000000','0.033333333333333','0.032167595877682','844.7372867038351','844.737286703835139','test','test','3.49'),('2018-06-01 23:59:59','2018-06-04 15:59:59','XLMBTC','4h','0.000038380000000','0.000038500000000','0.033074280565411','0.033177691552067','861.7582221316021','861.758222131602110','test','test','0.0'),('2018-06-07 07:59:59','2018-06-07 15:59:59','XLMBTC','4h','0.000038980000000','0.000038440000000','0.033097260784668','0.032638755889242','849.0831396784959','849.083139678495854','test','test','1.38'),('2018-06-07 19:59:59','2018-06-07 23:59:59','XLMBTC','4h','0.000038900000000','0.000038040000000','0.032995370807906','0.032265910167937','848.210046475744','848.210046475743979','test','test','2.21'),('2018-07-04 11:59:59','2018-07-05 11:59:59','XLMBTC','4h','0.000031770000000','0.000031940000000','0.032833268443469','0.033008957950406','1033.4676878649318','1033.467687864931804','test','test','0.0'),('2018-07-14 15:59:59','2018-07-20 19:59:59','XLMBTC','4h','0.000032630000000','0.000036800000000','0.032872310556122','0.037073276998630','1007.4260053975347','1007.426005397534709','test','test','0.0'),('2018-07-22 03:59:59','2018-07-23 07:59:59','XLMBTC','4h','0.000040400000000','0.000038580000000','0.033805858654457','0.032282921457647','836.778679565759','836.778679565759035','test','test','5.22'),('2018-07-25 23:59:59','2018-07-26 23:59:59','XLMBTC','4h','0.000040800000000','0.000038850000000','0.033467428166277','0.031867881967153','820.2801021146241','820.280102114624128','test','test','4.77'),('2018-07-27 11:59:59','2018-07-27 15:59:59','XLMBTC','4h','0.000038710000000','0.000038490000000','0.033111973455360','0.032923788641095','855.3855193841442','855.385519384144231','test','test','0.56'),('2018-07-27 19:59:59','2018-07-28 19:59:59','XLMBTC','4h','0.000038840000000','0.000038220000000','0.033070154607746','0.032542258215964','851.4457931963382','851.445793196338172','test','test','1.59'),('2018-08-12 23:59:59','2018-08-13 23:59:59','XLMBTC','4h','0.000035400000000','0.000035480000000','0.032952844298461','0.033027314003090','930.8713078661266','930.871307866126585','test','test','0.0'),('2018-08-14 03:59:59','2018-08-14 07:59:59','XLMBTC','4h','0.000035810000000','0.000035260000000','0.032969393121712','0.032463021543467','920.6755968084832','920.675596808483192','test','test','1.53'),('2018-08-15 03:59:59','2018-08-15 11:59:59','XLMBTC','4h','0.000036040000000','0.000034650000000','0.032856866104324','0.031589634032043','911.6777498425083','911.677749842508319','test','test','3.85'),('2018-08-17 23:59:59','2018-08-18 07:59:59','XLMBTC','4h','0.000036310000000','0.000034980000000','0.032575258977150','0.031382058909962','897.1429076604363','897.142907660436322','test','test','3.66'),('2018-08-18 11:59:59','2018-08-18 15:59:59','XLMBTC','4h','0.000035420000000','0.000035140000000','0.032310103406664','0.032054687569457','912.1994185958276','912.199418595827638','test','test','0.79'),('2018-08-19 03:59:59','2018-08-19 07:59:59','XLMBTC','4h','0.000035010000000','0.000035020000000','0.032253344331729','0.032262556940793','921.2609063618775','921.260906361877460','test','test','0.0'),('2018-08-19 11:59:59','2018-08-19 19:59:59','XLMBTC','4h','0.000035430000000','0.000035280000000','0.032255391578188','0.032118831918670','910.3977301210274','910.397730121027394','test','test','0.42'),('2018-08-20 03:59:59','2018-08-20 07:59:59','XLMBTC','4h','0.000035340000000','0.000035080000000','0.032225044987184','0.031987962030289','911.857526519072','911.857526519072053','test','test','0.73'),('2018-09-08 11:59:59','2018-09-08 19:59:59','XLMBTC','4h','0.000032060000000','0.000031450000000','0.032172359885652','0.031560222033804','1003.5046751606917','1003.504675160691704','test','test','1.90'),('2018-09-13 15:59:59','2018-09-14 11:59:59','XLMBTC','4h','0.000032030000000','0.000031120000000','0.032036329251908','0.031126149432388','1000.1976038684913','1000.197603868491342','test','test','2.84'),('2018-09-14 19:59:59','2018-09-14 23:59:59','XLMBTC','4h','0.000031180000000','0.000030900000000','0.031834067069792','0.031548193471988','1020.9771350157861','1020.977135015786075','test','test','0.89'),('2018-09-16 11:59:59','2018-09-17 23:59:59','XLMBTC','4h','0.000031780000000','0.000031300000000','0.031770539603614','0.031290682491917','999.7023160356689','999.702316035668900','test','test','1.51'),('2018-09-18 11:59:59','2018-09-25 07:59:59','XLMBTC','4h','0.000032350000000','0.000036350000000','0.031663904689903','0.035579070648469','978.7914896415182','978.791489641518183','test','test','0.71'),('2018-09-26 11:59:59','2018-09-26 23:59:59','XLMBTC','4h','0.000039600000000','0.000037650000000','0.032533941569584','0.030931891416536','821.5641810501121','821.564181050112097','test','test','4.92'),('2018-09-27 15:59:59','2018-09-28 11:59:59','XLMBTC','4h','0.000038930000000','0.000037890000000','0.032177930424463','0.031318309370226','826.558705996986','826.558705996985964','test','test','2.67'),('2018-09-29 19:59:59','2018-10-02 15:59:59','XLMBTC','4h','0.000038940000000','0.000038660000000','0.031986903523521','0.031756900108354','821.4407684520057','821.440768452005727','test','test','0.92'),('2018-10-18 03:59:59','2018-10-18 19:59:59','XLMBTC','4h','0.000037350000000','0.000036470000000','0.031935791653484','0.031183355330725','855.0412758630252','855.041275863025248','test','test','2.40'),('2018-10-18 23:59:59','2018-10-22 11:59:59','XLMBTC','4h','0.000036970000000','0.000037510000000','0.031768583581760','0.032232609417144','859.3071025631532','859.307102563153194','test','test','1.37'),('2018-11-03 15:59:59','2018-11-08 07:59:59','XLMBTC','4h','0.000037880000000','0.000038750000000','0.031871700434067','0.032603706225451','841.3859671084299','841.385967108429895','test','test','2.05'),('2018-11-08 15:59:59','2018-11-13 15:59:59','XLMBTC','4h','0.000040170000000','0.000041490000000','0.032034368387708','0.033087028738014','797.4699623527063','797.469962352706261','test','test','0.72'),('2018-11-15 23:59:59','2018-11-20 11:59:59','XLMBTC','4h','0.000042680000000','0.000044250000000','0.032268292909998','0.033455294312732','756.0518488753149','756.051848875314931','test','test','1.17'),('2018-11-20 15:59:59','2018-11-20 19:59:59','XLMBTC','4h','0.000044590000000','0.000043770000000','0.032532070999495','0.031933813582595','729.5822157321123','729.582215732112331','test','test','1.83'),('2018-12-24 23:59:59','2018-12-25 07:59:59','XLMBTC','4h','0.000032600000000','0.000031780000000','0.032399124906850','0.031584177593242','993.8381873267007','993.838187326700677','test','test','3.61'),('2018-12-25 19:59:59','2018-12-26 07:59:59','XLMBTC','4h','0.000031480000000','0.000031530000000','0.032218025503826','0.032269197717142','1023.4442663223141','1023.444266322314093','test','test','0.0'),('2019-01-08 15:59:59','2019-01-10 07:59:59','XLMBTC','4h','0.000030690000000','0.000030400000000','0.032229397106786','0.031924850832398','1050.1595668551827','1050.159566855182675','test','test','0.97'),('2019-02-19 15:59:59','2019-02-24 15:59:59','XLMBTC','4h','0.000023140000000','0.000021910000000','0.032161720156922','0.030452173234147','1389.8755469715454','1389.875546971545418','test','test','5.31'),('2019-03-04 15:59:59','2019-03-04 19:59:59','XLMBTC','4h','0.000022050000000','0.000021950000000','0.031781820840749','0.031637685598841','1441.3524190816024','1441.352419081602420','test','test','0.45'),('2019-03-08 19:59:59','2019-03-16 03:59:59','XLMBTC','4h','0.000022840000000','0.000027080000000','0.031749790786992','0.037643797483001','1390.0959188700522','1390.095918870052174','test','test','2.27'),('2019-03-17 23:59:59','2019-03-18 11:59:59','XLMBTC','4h','0.000027360000000','0.000026910000000','0.033059570052772','0.032515827124272','1208.3176188878574','1208.317618887857407','test','test','1.64'),('2019-03-18 15:59:59','2019-03-20 15:59:59','XLMBTC','4h','0.000027570000000','0.000027320000000','0.032938738290883','0.032640055498982','1194.731167605473','1194.731167605473047','test','test','0.90'),('2019-04-01 23:59:59','2019-04-02 07:59:59','XLMBTC','4h','0.000026590000000','0.000024900000000','0.032872364337127','0.030783071530442','1236.2679329494965','1236.267932949496526','test','test','6.35'),('2019-05-16 07:59:59','2019-05-20 03:59:59','XLMBTC','4h','0.000018500000000','0.000017190000000','0.032408077046753','0.030113234834253','1751.7879484731175','1751.787948473117467','test','test','8.64');
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

-- Dump completed on 2020-04-30 22:50:25
