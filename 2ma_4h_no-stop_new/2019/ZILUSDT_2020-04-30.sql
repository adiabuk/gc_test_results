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
INSERT INTO `trades` VALUES ('2019-08-24 07:59:59','2019-08-25 15:59:59','ZILUSDT','4h','0.008070000000000','0.007940000000000','222.222222222222200','218.642434255817079','27536.830510808202','27536.830510808202234','test','test','1.61'),('2019-08-25 19:59:59','2019-08-25 23:59:59','ZILUSDT','4h','0.007980000000000','0.007860000000000','221.426713785243322','218.096988765916393','27747.708494391398','27747.708494391397835','test','test','1.50'),('2019-08-26 03:59:59','2019-08-27 07:59:59','ZILUSDT','4h','0.008030000000000','0.008030000000000','220.686774892059560','220.686774892059560','27482.786412460715','27482.786412460714928','test','test','0.0'),('2019-08-28 03:59:59','2019-08-28 07:59:59','ZILUSDT','4h','0.008060000000000','0.008010000000000','220.686774892059560','219.317750233920236','27380.493162786548','27380.493162786548055','test','test','0.62'),('2019-08-28 11:59:59','2019-08-28 15:59:59','ZILUSDT','4h','0.008010000000000','0.007970000000000','220.382547190250790','219.282010125630308','27513.42661551196','27513.426615511958516','test','test','0.49'),('2019-09-10 03:59:59','2019-09-10 07:59:59','ZILUSDT','4h','0.007040000000000','0.007010000000000','220.137983398112937','219.199895400677775','31269.599914504677','31269.599914504677145','test','test','0.42'),('2019-09-15 23:59:59','2019-09-16 03:59:59','ZILUSDT','4h','0.006890000000000','0.007000000000000','219.929519398682913','223.440730884002960','31920.104412000423','31920.104412000422599','test','test','0.0'),('2019-09-16 07:59:59','2019-09-17 03:59:59','ZILUSDT','4h','0.007000000000000','0.006910000000000','220.709788617642886','217.872091335416059','31529.969802520412','31529.969802520412486','test','test','1.28'),('2019-09-17 07:59:59','2019-09-17 11:59:59','ZILUSDT','4h','0.006880000000000','0.006930000000000','220.079189221592486','221.678601933958731','31988.25424732449','31988.254247324490279','test','test','0.0'),('2019-09-17 15:59:59','2019-09-19 03:59:59','ZILUSDT','4h','0.007130000000000','0.007040000000000','220.434614268784998','217.652129656696530','30916.49568987167','30916.495689871670038','test','test','1.26'),('2019-09-19 07:59:59','2019-09-20 07:59:59','ZILUSDT','4h','0.007060000000000','0.007050000000000','219.816284354987573','219.504929844569716','31135.45104178294','31135.451041782940592','test','test','0.56'),('2019-09-20 11:59:59','2019-09-20 15:59:59','ZILUSDT','4h','0.007070000000000','0.007060000000000','219.747094463783583','219.436278205701853','31081.625808173067','31081.625808173066616','test','test','0.14'),('2019-09-20 19:59:59','2019-09-20 23:59:59','ZILUSDT','4h','0.007060000000000','0.007100000000000','219.678024184209875','220.922658882137426','31115.867448188365','31115.867448188364506','test','test','0.0'),('2019-09-21 03:59:59','2019-09-21 07:59:59','ZILUSDT','4h','0.007140000000000','0.007050000000000','219.954609672638213','217.182072575924309','30805.967741265857','30805.967741265856603','test','test','1.26'),('2019-10-05 07:59:59','2019-10-05 11:59:59','ZILUSDT','4h','0.005430000000000','0.005360000000000','219.338490317812898','216.510922302666160','40393.828787810846','40393.828787810845824','test','test','1.28'),('2019-10-06 03:59:59','2019-10-06 11:59:59','ZILUSDT','4h','0.005600000000000','0.005500000000000','218.710141870002531','214.804603622323896','39055.382476786166','39055.382476786166080','test','test','1.96'),('2019-10-06 15:59:59','2019-10-10 11:59:59','ZILUSDT','4h','0.005520000000000','0.005820000000000','217.842244481629479','229.681496899109334','39464.17472493288','39464.174724932876416','test','test','0.0'),('2019-10-10 15:59:59','2019-10-11 07:59:59','ZILUSDT','4h','0.005840000000000','0.005530000000000','220.473189463291675','208.769989337671745','37752.258469741726','37752.258469741726003','test','test','5.30'),('2019-10-11 19:59:59','2019-10-12 11:59:59','ZILUSDT','4h','0.005870000000000','0.005710000000000','217.872478324265018','211.933875848646210','37116.265472617546','37116.265472617546038','test','test','2.72'),('2019-10-12 15:59:59','2019-10-13 15:59:59','ZILUSDT','4h','0.005840000000000','0.005730000000000','216.552788885238641','212.473883615139954','37080.957000897026','37080.957000897025864','test','test','1.88'),('2019-10-13 19:59:59','2019-10-13 23:59:59','ZILUSDT','4h','0.005740000000000','0.005710000000000','215.646365491883330','214.519293895235847','37569.05322158246','37569.053221582456899','test','test','0.52'),('2019-10-14 23:59:59','2019-10-15 03:59:59','ZILUSDT','4h','0.005730000000000','0.005670000000000','215.395905137072788','213.140450633019668','37590.9084008853','37590.908400885302399','test','test','1.04'),('2019-10-25 19:59:59','2019-10-25 23:59:59','ZILUSDT','4h','0.005300000000000','0.005240000000000','214.894693025061002','212.461922915343337','40546.16849529453','40546.168495294528839','test','test','1.13'),('2019-10-26 03:59:59','2019-10-26 07:59:59','ZILUSDT','4h','0.005240000000000','0.005270000000000','214.354077445123750','215.581295445763772','40907.26668800072','40907.266688000716385','test','test','0.0'),('2019-10-27 15:59:59','2019-10-31 11:59:59','ZILUSDT','4h','0.005720000000000','0.005460000000000','214.626792556377069','204.871029258359926','37522.16653083515','37522.166530835151207','test','test','4.54'),('2019-10-31 15:59:59','2019-11-08 15:59:59','ZILUSDT','4h','0.005530000000000','0.005860000000000','212.458845156817716','225.137221088418016','38419.321004849495','38419.321004849494784','test','test','0.0'),('2019-11-10 23:59:59','2019-11-11 03:59:59','ZILUSDT','4h','0.006050000000000','0.005970000000000','215.276262030506672','212.429633772252032','35582.853228182925','35582.853228182924795','test','test','1.32'),('2019-11-14 23:59:59','2019-11-18 15:59:59','ZILUSDT','4h','0.006070000000000','0.006290000000000','214.643677973116752','222.423185247265963','35361.39670067821','35361.396700678211346','test','test','1.48'),('2019-11-28 15:59:59','2019-11-28 23:59:59','ZILUSDT','4h','0.005380000000000','0.005240000000000','216.372457367372135','210.741947324355010','40217.9288786937','40217.928878693703155','test','test','2.60'),('2019-11-29 03:59:59','2019-11-29 07:59:59','ZILUSDT','4h','0.005330000000000','0.005350000000000','215.121232913368317','215.928442042499171','40360.4564565419','40360.456456541898660','test','test','0.0'),('2019-11-29 11:59:59','2019-11-29 15:59:59','ZILUSDT','4h','0.005340000000000','0.005450000000000','215.300612719841837','219.735644068003353','40318.46680146851','40318.466801468508493','test','test','0.0'),('2019-11-29 19:59:59','2019-11-30 11:59:59','ZILUSDT','4h','0.005430000000000','0.005300000000000','216.286175241655513','211.108053182463038','39831.708147634534','39831.708147634533816','test','test','2.39'),('2019-12-03 15:59:59','2019-12-05 03:59:59','ZILUSDT','4h','0.005340000000000','0.005280000000000','215.135481450723859','212.718228850153935','40287.543342832185','40287.543342832184862','test','test','1.12'),('2019-12-05 07:59:59','2019-12-05 19:59:59','ZILUSDT','4h','0.005440000000000','0.005570000000000','214.598314206152764','219.726582744167445','39448.219523189844','39448.219523189844040','test','test','1.47'),('2019-12-05 23:59:59','2019-12-10 03:59:59','ZILUSDT','4h','0.005730000000000','0.005730000000000','215.737929436822697','215.737929436822697','37650.5985055537','37650.598505553702125','test','test','0.69'),('2019-12-10 07:59:59','2019-12-10 11:59:59','ZILUSDT','4h','0.005860000000000','0.005840000000000','215.737929436822697','215.001622510417150','36815.34632027691','36815.346320276912593','test','test','0.34'),('2020-01-05 11:59:59','2020-01-05 15:59:59','ZILUSDT','4h','0.004640000000000','0.004650000000000','215.574305675399245','216.038905472113441','46459.979671422254','46459.979671422253887','test','test','0.0'),('2020-01-05 19:59:59','2020-01-05 23:59:59','ZILUSDT','4h','0.004660000000000','0.004630000000000','215.677550074669057','214.289067992643254','46282.73606752555','46282.736067525547696','test','test','0.64'),('2020-01-06 03:59:59','2020-01-08 19:59:59','ZILUSDT','4h','0.004720000000000','0.004620000000000','215.368998500885510','210.806095990273519','45629.02510611981','45629.025106119806878','test','test','2.11'),('2020-01-10 23:59:59','2020-01-11 03:59:59','ZILUSDT','4h','0.004690000000000','0.004620000000000','214.355020165193991','211.155691506012005','45704.69513117143','45704.695131171429239','test','test','1.49'),('2020-01-11 15:59:59','2020-01-11 19:59:59','ZILUSDT','4h','0.004690000000000','0.004690000000000','213.644058240931344','213.644058240931344','45553.104102544','45553.104102543999034','test','test','0.0'),('2020-01-12 03:59:59','2020-01-12 07:59:59','ZILUSDT','4h','0.004670000000000','0.004720000000000','213.644058240931344','215.931467858071954','45748.19234281185','45748.192342811853450','test','test','0.0'),('2020-01-12 11:59:59','2020-01-13 07:59:59','ZILUSDT','4h','0.004690000000000','0.004670000000000','214.152371489184787','213.239141760019834','45661.48645824836','45661.486458248356939','test','test','0.42'),('2020-01-13 11:59:59','2020-01-13 15:59:59','ZILUSDT','4h','0.004690000000000','0.004660000000000','213.949431549370388','212.580885078905339','45618.21568216853','45618.215682168527564','test','test','0.63'),('2020-01-14 03:59:59','2020-01-14 07:59:59','ZILUSDT','4h','0.004710000000000','0.004730000000000','213.645310111489238','214.552508880540159','45359.93845254549','45359.938452545487962','test','test','0.0'),('2020-01-14 11:59:59','2020-01-19 11:59:59','ZILUSDT','4h','0.004770000000000','0.004970000000000','213.846909837944992','222.813237294462567','44831.637282588046','44831.637282588046219','test','test','0.0'),('2020-01-19 15:59:59','2020-01-20 07:59:59','ZILUSDT','4h','0.005040000000000','0.005110000000000','215.839427050504469','218.837196870650359','42825.283144941364','42825.283144941364299','test','test','0.39'),('2020-01-20 11:59:59','2020-01-20 15:59:59','ZILUSDT','4h','0.005050000000000','0.005070000000000','216.505598121647978','217.363046035001048','42872.395667653065','42872.395667653065175','test','test','0.0'),('2020-01-20 19:59:59','2020-01-21 19:59:59','ZILUSDT','4h','0.005100000000000','0.005010000000000','216.696142102393111','212.872092535880256','42489.43962792021','42489.439627920211933','test','test','1.76'),('2020-01-21 23:59:59','2020-01-23 07:59:59','ZILUSDT','4h','0.005120000000000','0.005060000000000','215.846353309834711','213.316903856985078','42157.49088082709','42157.490880827092042','test','test','1.17'),('2020-01-26 15:59:59','2020-02-15 19:59:59','ZILUSDT','4h','0.005050000000000','0.008140000000000','215.284253431423650','347.012638204314555','42630.54523394528','42630.545233945282234','test','test','0.0'),('2020-02-15 23:59:59','2020-02-16 15:59:59','ZILUSDT','4h','0.008100000000000','0.007700000000000','244.557227825399423','232.480327685873561','30192.250348814745','30192.250348814744939','test','test','4.93');
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

-- Dump completed on 2020-04-30 19:25:39
