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
INSERT INTO `trades` VALUES ('2018-02-09 11:59:59','2018-02-13 03:59:59','BCCBTC','4h','0.158400000000000','0.142099000000000','0.033333333333333','0.029902988215488','0.21043771043771042','0.210437710437710','test','test','10.2'),('2018-02-13 07:59:59','2018-02-13 11:59:59','BCCBTC','4h','0.141696000000000','0.142706000000000','0.032571034418257','0.032803198662572','0.22986558843056032','0.229865588430560','test','test','0.0'),('2018-02-13 15:59:59','2018-02-13 19:59:59','BCCBTC','4h','0.143819000000000','0.143545000000000','0.032622626472549','0.032560474742573','0.226831131300794','0.226831131300794','test','test','0.19'),('2018-02-13 23:59:59','2018-02-14 07:59:59','BCCBTC','4h','0.143412000000000','0.142850000000000','0.032608814976999','0.032481028222633','0.2273785664867561','0.227378566486756','test','test','0.39'),('2018-02-14 11:59:59','2018-02-14 15:59:59','BCCBTC','4h','0.142381000000000','0.147018000000000','0.032580417920473','0.033641482233108','0.22882560117201653','0.228825601172017','test','test','0.0'),('2018-02-14 19:59:59','2018-02-15 03:59:59','BCCBTC','4h','0.143100000000000','0.138895000000000','0.032816209989947','0.031851904168789','0.2293236197760121','0.229323619776012','test','test','2.93'),('2018-02-16 03:59:59','2018-02-16 23:59:59','BCCBTC','4h','0.151163000000000','0.150449000000000','0.032601919807468','0.032447928614236','0.21567394010086977','0.215673940100870','test','test','3.21'),('2018-02-17 03:59:59','2018-02-17 11:59:59','BCCBTC','4h','0.147486000000000','0.141662000000000','0.032567699542305','0.031281650140095','0.2208189220828086','0.220818922082809','test','test','3.94'),('2018-03-11 07:59:59','2018-03-12 11:59:59','BCCBTC','4h','0.115006000000000','0.114508000000000','0.032281910786258','0.032142123370197','0.2806976226132414','0.280697622613241','test','test','0.43'),('2018-03-13 03:59:59','2018-03-13 07:59:59','BCCBTC','4h','0.115586000000000','0.114360000000000','0.032250846916023','0.031908767959064','0.27902035641014195','0.279020356410142','test','test','1.06'),('2018-03-13 15:59:59','2018-03-14 03:59:59','BCCBTC','4h','0.116887000000000','0.113967000000000','0.032174829370032','0.031371057335841','0.2752643952709179','0.275264395270918','test','test','2.49'),('2018-03-14 11:59:59','2018-03-14 15:59:59','BCCBTC','4h','0.116661000000000','0.115360000000000','0.031996213362434','0.031639392543270','0.2742665789118367','0.274266578911837','test','test','1.11'),('2018-03-14 19:59:59','2018-03-14 23:59:59','BCCBTC','4h','0.115755000000000','0.115179000000000','0.031916919847064','0.031758100393633','0.27572821776220463','0.275728217762205','test','test','0.49'),('2018-03-16 15:59:59','2018-03-16 23:59:59','BCCBTC','4h','0.117816000000000','0.117788000000000','0.031881626635190','0.031874049688546','0.27060523727838703','0.270605237278387','test','test','0.02'),('2018-03-17 03:59:59','2018-03-18 11:59:59','BCCBTC','4h','0.118145000000000','0.117082000000000','0.031879942869270','0.031593105683862','0.26983742747699485','0.269837427476995','test','test','0.89'),('2018-03-18 15:59:59','2018-03-18 19:59:59','BCCBTC','4h','0.115216000000000','0.115339000000000','0.031816201272512','0.031850166978287','0.276143949386476','0.276143949386476','test','test','0.0'),('2018-03-20 03:59:59','2018-03-20 07:59:59','BCCBTC','4h','0.117147000000000','0.115268000000000','0.031823749207129','0.031313306560197','0.2716565444025787','0.271656544402579','test','test','1.60'),('2018-03-20 15:59:59','2018-03-21 11:59:59','BCCBTC','4h','0.119299000000000','0.116300000000000','0.031710317507811','0.030913167136006','0.2658053923990198','0.265805392399020','test','test','2.52'),('2018-03-21 15:59:59','2018-03-21 19:59:59','BCCBTC','4h','0.116130000000000','0.115859000000000','0.031533172980743','0.031459587431119','0.27153339344478505','0.271533393444785','test','test','0.23'),('2018-03-22 03:59:59','2018-03-22 07:59:59','BCCBTC','4h','0.116577000000000','0.116581000000000','0.031516820636382','0.031517902044229','0.2703519616766772','0.270351961676677','test','test','0.0'),('2018-03-22 11:59:59','2018-03-22 15:59:59','BCCBTC','4h','0.115700000000000','0.116523000000000','0.031517060949237','0.031741248859014','0.272403292560388','0.272403292560388','test','test','0.0'),('2018-03-23 11:59:59','2018-03-23 15:59:59','BCCBTC','4h','0.116654000000000','0.116618000000000','0.031566880484743','0.031557138789667','0.2706026410131062','0.270602641013106','test','test','0.03'),('2018-03-23 19:59:59','2018-03-23 23:59:59','BCCBTC','4h','0.116301000000000','0.115364000000000','0.031564715663615','0.031310408834123','0.2714053676547483','0.271405367654748','test','test','0.80'),('2018-04-12 03:59:59','2018-04-12 07:59:59','BCCBTC','4h','0.097410000000000','0.096690000000000','0.031508203034839','0.031275312097717','0.3234596348920941','0.323459634892094','test','test','0.73'),('2018-04-16 23:59:59','2018-04-17 03:59:59','BCCBTC','4h','0.095286000000000','0.094668000000000','0.031456449493256','0.031252431213689','0.3301266659662093','0.330126665966209','test','test','0.64'),('2018-04-17 07:59:59','2018-05-01 03:59:59','BCCBTC','4h','0.095811000000000','0.142845000000000','0.031411112097797','0.046830951640311','0.3278445282670767','0.327844528267077','test','test','0.0'),('2018-05-01 07:59:59','2018-05-11 07:59:59','BCCBTC','4h','0.145038000000000','0.160909000000000','0.034837743107244','0.038649915233549','0.24019734902056322','0.240197349020563','test','test','1.19'),('2018-05-12 11:59:59','2018-05-14 03:59:59','BCCBTC','4h','0.169999000000000','0.162574000000000','0.035684892468646','0.034126293144064','0.20991236694713236','0.209912366947132','test','test','4.36'),('2018-05-14 19:59:59','2018-05-14 23:59:59','BCCBTC','4h','0.166330000000000','0.162857000000000','0.035338537063183','0.034600662120476','0.21246039237168812','0.212460392371688','test','test','2.08'),('2018-06-02 15:59:59','2018-06-10 03:59:59','BCCBTC','4h','0.140000000000000','0.141645000000000','0.035174564853692','0.035587865990723','0.25124689181208887','0.251246891812089','test','test','0.0'),('2018-07-03 03:59:59','2018-07-03 11:59:59','BCCBTC','4h','0.121932000000000','0.118976000000000','0.035266409550810','0.034411445254053','0.28923014098686517','0.289230140986865','test','test','2.42'),('2018-07-15 11:59:59','2018-07-18 19:59:59','BCCBTC','4h','0.114254000000000','0.114405000000000','0.035076417484864','0.035122775065695','0.30700384655998425','0.307003846559984','test','test','0.58'),('2018-08-05 23:59:59','2018-08-06 03:59:59','BCCBTC','4h','0.100893000000000','0.100361000000000','0.035086719169494','0.034901709955791','0.3477616798934867','0.347761679893487','test','test','0.52'),('2018-08-07 07:59:59','2018-08-07 11:59:59','BCCBTC','4h','0.100692000000000','0.100183000000000','0.035045606010893','0.034868449797296','0.34804757091817506','0.348047570918175','test','test','0.50'),('2018-08-17 23:59:59','2018-08-18 07:59:59','BCCBTC','4h','0.091687000000000','0.088232000000000','0.035006237963427','0.033687113636493','0.3818015418044749','0.381801541804475','test','test','3.76'),('2018-08-18 11:59:59','2018-08-18 15:59:59','BCCBTC','4h','0.089731000000000','0.087010000000000','0.034713099224108','0.033660460303459','0.38685737620341043','0.386857376203410','test','test','3.03'),('2018-08-19 15:59:59','2018-08-19 19:59:59','BCCBTC','4h','0.088949000000000','0.088500000000000','0.034479179463964','0.034305134206802','0.38762863510510515','0.387628635105105','test','test','0.50'),('2018-09-01 15:59:59','2018-09-05 11:59:59','BCCBTC','4h','0.085559000000000','0.080572000000000','0.034440502740150','0.032433060072925','0.40253512476945996','0.402535124769460','test','test','5.82'),('2018-09-21 07:59:59','2018-09-22 11:59:59','BCCBTC','4h','0.072141000000000','0.071084000000000','0.033994404369656','0.033496323037006','0.47122169597948155','0.471221695979482','test','test','1.46'),('2018-09-22 15:59:59','2018-09-24 07:59:59','BCCBTC','4h','0.071459000000000','0.071059000000000','0.033883719629067','0.033694051597726','0.47417007835355784','0.474170078353558','test','test','0.55'),('2018-09-24 11:59:59','2018-09-24 15:59:59','BCCBTC','4h','0.071013000000000','0.070682000000000','0.033841571177658','0.033683831608004','0.4765545910982182','0.476554591098218','test','test','0.46'),('2018-09-26 15:59:59','2018-10-04 19:59:59','BCCBTC','4h','0.080390000000000','0.078600000000000','0.033806517939957','0.033053766763038','0.420531383753662','0.420531383753662','test','test','2.22'),('2018-10-06 03:59:59','2018-10-06 11:59:59','BCCBTC','4h','0.078589000000000','0.077842000000000','0.033639239900642','0.033319493979384','0.4280400552321769','0.428040055232177','test','test','0.95'),('2018-10-07 23:59:59','2018-10-09 11:59:59','BCCBTC','4h','0.078806000000000','0.078645000000000','0.033568185251473','0.033499605729286','0.4259597651381001','0.425959765138100','test','test','0.20'),('2018-11-02 15:59:59','2018-11-09 23:59:59','BCCBTC','4h','0.071251000000000','0.085150000000000','0.033552945357654','0.040098150162162','0.47091192204535764','0.470911922045358','test','test','0.0'),('2018-11-10 03:59:59','2018-11-11 15:59:59','BCCBTC','4h','0.085210000000000','0.082623000000000','0.035007435314211','0.033944599553645','0.4108371706866696','0.410837170686670','test','test','3.03'),('2018-11-13 11:59:59','2018-11-13 15:59:59','BCCBTC','4h','0.085258000000000','0.082209000000000','0.034771249589641','0.033527758773544','0.4078356235149884','0.407835623514988','test','test','3.57');
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

-- Dump completed on 2020-04-30 17:00:59
