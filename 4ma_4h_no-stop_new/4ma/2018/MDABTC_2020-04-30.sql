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
INSERT INTO `trades` VALUES ('2018-03-25 11:59:59','2018-03-26 15:59:59','MDABTC','4h','0.000103120000000','0.000103440000000','0.033333333333333','0.033436772692009','323.2479958624256','323.247995862425626','test','test','0.0'),('2018-03-26 19:59:59','2018-03-26 23:59:59','MDABTC','4h','0.000103770000000','0.000104650000000','0.033356319857484','0.033639191221795','321.44473217195286','321.444732171952865','test','test','0.0'),('2018-03-27 15:59:59','2018-03-29 03:59:59','MDABTC','4h','0.000108700000000','0.000105310000000','0.033419180160664','0.032376944459241','307.44415971171827','307.444159711718271','test','test','3.23'),('2018-04-10 15:59:59','2018-04-11 03:59:59','MDABTC','4h','0.000103750000000','0.000103640000000','0.033187572227014','0.033152385403448','319.88021423628163','319.880214236281631','test','test','0.64'),('2018-04-11 07:59:59','2018-04-15 07:59:59','MDABTC','4h','0.000103900000000','0.000108320000000','0.033179752932888','0.034591249640909','319.3431466110533','319.343146611053328','test','test','0.0'),('2018-04-15 11:59:59','2018-04-21 11:59:59','MDABTC','4h','0.000116920000000','0.000121730000000','0.033493418868004','0.034871312682194','286.46441043452114','286.464410434521142','test','test','2.49'),('2018-04-22 23:59:59','2018-04-24 15:59:59','MDABTC','4h','0.000133020000000','0.000129270000000','0.033799617493380','0.032846764045777','254.0942526941796','254.094252694179602','test','test','2.81'),('2018-04-24 19:59:59','2018-04-25 03:59:59','MDABTC','4h','0.000138060000000','0.000124340000000','0.033587872282801','0.030250007530374','243.28460294655457','243.284602946554571','test','test','9.93'),('2018-04-29 03:59:59','2018-04-29 11:59:59','MDABTC','4h','0.000129510000000','0.000125210000000','0.032846124560040','0.031755565254904','253.61844305489745','253.618443054897455','test','test','3.32'),('2018-04-29 15:59:59','2018-04-29 19:59:59','MDABTC','4h','0.000128850000000','0.000127010000000','0.032603778047787','0.032138190530457','253.03669420091057','253.036694200910574','test','test','1.42'),('2018-04-29 23:59:59','2018-05-01 15:59:59','MDABTC','4h','0.000128970000000','0.000134470000000','0.032500314155047','0.033886308788316','251.99902423080812','251.999024230808118','test','test','0.0'),('2018-05-01 23:59:59','2018-05-02 19:59:59','MDABTC','4h','0.000134000000000','0.000136300000000','0.032808312962440','0.033371440722243','244.83815643612263','244.838156436122631','test','test','0.0'),('2018-05-02 23:59:59','2018-05-03 07:59:59','MDABTC','4h','0.000137810000000','0.000134490000000','0.032933452464619','0.032140048051423','238.97723289034815','238.977232890348148','test','test','2.40'),('2018-05-03 15:59:59','2018-05-03 19:59:59','MDABTC','4h','0.000134170000000','0.000130170000000','0.032757140372798','0.031780554239600','244.14653329952714','244.146533299527135','test','test','2.98'),('2018-06-03 03:59:59','2018-06-04 11:59:59','MDABTC','4h','0.000100660000000','0.000099810000000','0.032540121232087','0.032265343733108','323.2676458582047','323.267645858204673','test','test','0.84'),('2018-06-04 15:59:59','2018-06-04 19:59:59','MDABTC','4h','0.000099980000000','0.000099380000000','0.032479059565647','0.032284146225585','324.855566769825','324.855566769824975','test','test','0.60'),('2018-06-06 11:59:59','2018-06-07 23:59:59','MDABTC','4h','0.000101740000000','0.000100390000000','0.032435745490078','0.032005351776577','318.81015814898535','318.810158148985352','test','test','1.32'),('2018-06-08 03:59:59','2018-06-08 07:59:59','MDABTC','4h','0.000102310000000','0.000099990000000','0.032340102442633','0.031606752450776','316.09913442120126','316.099134421201256','test','test','2.26'),('2018-07-01 03:59:59','2018-07-07 07:59:59','MDABTC','4h','0.000080100000000','0.000084120000000','0.032177135777776','0.033792018247522','401.71205715076155','401.712057150761552','test','test','2.82'),('2018-07-08 15:59:59','2018-07-09 03:59:59','MDABTC','4h','0.000085400000000','0.000083320000000','0.032535998548831','0.031743552682536','380.98358956476187','380.983589564761871','test','test','2.43'),('2018-07-09 19:59:59','2018-07-09 23:59:59','MDABTC','4h','0.000085600000000','0.000081580000000','0.032359899467432','0.030840193908331','378.0362087316796','378.036208731679608','test','test','4.69'),('2018-07-17 23:59:59','2018-07-18 07:59:59','MDABTC','4h','0.000079580000000','0.000079160000000','0.032022187120965','0.031853183368882','402.3898859131049','402.389885913104877','test','test','0.52'),('2018-07-23 23:59:59','2018-07-26 11:59:59','MDABTC','4h','0.000081000000000','0.000080690000000','0.031984630731613','0.031862220416467','394.8719843409025','394.871984340902486','test','test','0.38'),('2018-08-19 15:59:59','2018-09-05 11:59:59','MDABTC','4h','0.000072800000000','0.000105600000000','0.031957428439358','0.046355830263684','438.9756653758028','438.975665375802805','test','test','8.46'),('2018-10-07 19:59:59','2018-10-16 07:59:59','MDABTC','4h','0.000091120000000','0.000281480000000','0.035157073289209','0.108604181183566','385.83267437674124','385.832674376741238','test','test','0.44'),('2018-10-19 15:59:59','2018-10-20 11:59:59','MDABTC','4h','0.000300630000000','0.000282390000000','0.051478652821288','0.048355309750203','171.23591398492496','171.235913984924963','test','test','6.06'),('2018-10-20 15:59:59','2018-10-21 15:59:59','MDABTC','4h','0.000307690000000','0.000287800000000','0.050784576583269','0.047501709969985','165.05111177896293','165.051111778962934','test','test','6.46'),('2018-11-26 11:59:59','2018-11-29 15:59:59','MDABTC','4h','0.000196060000000','0.000232940000000','0.050055050669206','0.059470690109583','255.30475706011424','255.304757060114241','test','test','0.0'),('2018-11-30 03:59:59','2018-11-30 15:59:59','MDABTC','4h','0.000293680000000','0.000232000000000','0.052147414989290','0.041195179370455','177.56542832092677','177.565428320926770','test','test','21.0'),('2018-12-12 15:59:59','2018-12-20 15:59:59','MDABTC','4h','0.000219330000000','0.000251150000000','0.049713584851771','0.056925941893595','226.6611263929735','226.661126392973500','test','test','4.05'),('2019-01-19 11:59:59','2019-01-19 23:59:59','MDABTC','4h','0.000201540000000','0.000199400000000','0.051316330861065','0.050771441766877','254.62107205053638','254.621072050536384','test','test','1.06'),('2019-01-23 19:59:59','2019-01-24 07:59:59','MDABTC','4h','0.000200400000000','0.000197500000000','0.051195244395690','0.050454395050643','255.4652913956587','255.465291395658710','test','test','1.44'),('2019-01-24 11:59:59','2019-01-24 15:59:59','MDABTC','4h','0.000197840000000','0.000200030000000','0.051030611207902','0.051595497169008','257.9387950257874','257.938795025787385','test','test','0.0'),('2019-01-24 23:59:59','2019-01-25 03:59:59','MDABTC','4h','0.000200060000000','0.000198150000000','0.051156141421481','0.050667746789296','255.70399590863184','255.703995908631839','test','test','0.95'),('2019-01-25 19:59:59','2019-01-25 23:59:59','MDABTC','4h','0.000201260000000','0.000197130000000','0.051047609280995','0.050000075611461','253.6401136887376','253.640113688737614','test','test','2.05'),('2019-01-26 03:59:59','2019-01-26 07:59:59','MDABTC','4h','0.000200950000000','0.000205880000000','0.050814824021099','0.052061487780363','252.8729734814575','252.872973481457507','test','test','0.0'),('2019-01-26 11:59:59','2019-01-27 03:59:59','MDABTC','4h','0.000207550000000','0.000198260000000','0.051091860412046','0.048804973477679','246.16651607827723','246.166516078277226','test','test','4.47'),('2019-01-27 07:59:59','2019-01-28 11:59:59','MDABTC','4h','0.000207390000000','0.000203510000000','0.050583663315520','0.049637308073395','243.90599023829714','243.905990238297136','test','test','1.87'),('2019-02-01 03:59:59','2019-02-04 19:59:59','MDABTC','4h','0.000208820000000','0.000210920000000','0.050373362150604','0.050879942269923','241.2286282473124','241.228628247312400','test','test','1.22'),('2019-02-21 11:59:59','2019-02-21 15:59:59','MDABTC','4h','0.000200720000000','0.000200540000000','0.050485935510452','0.050440661156168','251.52419046658255','251.524190466582553','test','test','0.08'),('2019-02-23 03:59:59','2019-02-24 19:59:59','MDABTC','4h','0.000207080000000','0.000207280000000','0.050475874542834','0.050524624663119','243.75060142376753','243.750601423767534','test','test','0.0'),('2019-02-24 23:59:59','2019-02-28 23:59:59','MDABTC','4h','0.000217700000000','0.000239420000000','0.050486707902897','0.055523783215947','231.9095447997111','231.909544799711114','test','test','0.0'),('2019-03-09 19:59:59','2019-03-12 19:59:59','MDABTC','4h','0.000240210000000','0.000253770000000','0.051606057972464','0.054519251203831','214.83725895035084','214.837258950350844','test','test','1.38'),('2019-03-12 23:59:59','2019-03-14 23:59:59','MDABTC','4h','0.000281530000000','0.000284800000000','0.052253434246101','0.052860363276701','185.60520813448258','185.605208134482581','test','test','6.68');
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

-- Dump completed on 2020-04-30 22:08:12
