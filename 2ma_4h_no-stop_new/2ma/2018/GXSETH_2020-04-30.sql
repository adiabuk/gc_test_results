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
INSERT INTO `trades` VALUES ('2018-05-09 19:59:59','2018-05-10 19:59:59','GXSETH','4h','0.005591000000000','0.005514000000000','1.297777777777778','1.279904608597150','232.11908026789087','232.119080267890865','test','test','1.37'),('2018-05-12 11:59:59','2018-05-12 15:59:59','GXSETH','4h','0.005687000000000','0.005506000000000','1.293805962404305','1.252628033936716','227.50236722424913','227.502367224249127','test','test','3.18'),('2018-05-28 07:59:59','2018-06-02 07:59:59','GXSETH','4h','0.005186000000000','0.005830000000000','1.284655311633730','1.444184432476793','247.7160261538237','247.716026153823691','test','test','0.44'),('2018-06-02 11:59:59','2018-06-14 19:59:59','GXSETH','4h','0.005822000000000','0.006392000000000','1.320106227376632','1.449350567741572','226.74445678059644','226.744456780596437','test','test','1.45'),('2018-06-15 19:59:59','2018-06-16 03:59:59','GXSETH','4h','0.006567000000000','0.006555000000000','1.348827191902174','1.346362455142188','205.39472999880834','205.394729998808344','test','test','0.18'),('2018-06-16 07:59:59','2018-06-16 11:59:59','GXSETH','4h','0.006530000000000','0.006490000000000','1.348279472622178','1.340020486572425','206.47465124382504','206.474651243825036','test','test','0.61'),('2018-07-02 19:59:59','2018-07-02 23:59:59','GXSETH','4h','0.005767000000000','0.005730000000000','1.346444142388899','1.337805607055383','233.47392793287653','233.473927932876535','test','test','0.64'),('2018-07-03 03:59:59','2018-07-03 07:59:59','GXSETH','4h','0.005772000000000','0.005668000000000','1.344524467870340','1.320298801782586','232.93909699763336','232.939096997633357','test','test','1.80'),('2018-07-11 15:59:59','2018-07-13 03:59:59','GXSETH','4h','0.005619000000000','0.005722000000000','1.339140986517506','1.363688329747850','238.3237206829518','238.323720682951802','test','test','1.58'),('2018-07-13 07:59:59','2018-07-24 11:59:59','GXSETH','4h','0.005777000000000','0.006489000000000','1.344595951679805','1.510313853288948','232.74986181059452','232.749861810594524','test','test','1.35'),('2018-07-24 15:59:59','2018-07-24 19:59:59','GXSETH','4h','0.006585000000000','0.006409000000000','1.381422152037392','1.344500314716423','209.78316659641487','209.783166596414873','test','test','2.67'),('2018-08-17 19:59:59','2018-08-17 23:59:59','GXSETH','4h','0.005360000000000','0.005307000000000','1.373217299299399','1.359638844660804','256.1972573319774','256.197257331977426','test','test','0.98'),('2018-08-18 03:59:59','2018-08-18 07:59:59','GXSETH','4h','0.005322000000000','0.004998000000000','1.370199864935267','1.286782962222184','257.45957627494676','257.459576274946755','test','test','6.08'),('2018-08-19 07:59:59','2018-08-19 11:59:59','GXSETH','4h','0.005217000000000','0.005215000000000','1.351662775443470','1.351144599182997','259.0881302364329','259.088130236432903','test','test','0.03'),('2018-08-20 19:59:59','2018-08-20 23:59:59','GXSETH','4h','0.005211000000000','0.005258000000000','1.351547625163365','1.363737749589133','259.3643494844301','259.364349484430079','test','test','0.0'),('2018-08-25 15:59:59','2018-08-25 19:59:59','GXSETH','4h','0.005110000000000','0.005067000000000','1.354256541702425','1.342860645167552','265.02084964822404','265.020849648224043','test','test','0.84'),('2018-08-25 23:59:59','2018-08-26 03:59:59','GXSETH','4h','0.005079000000000','0.004892000000000','1.351724120250231','1.301955974850193','266.1398149734654','266.139814973465377','test','test','3.68'),('2018-08-26 15:59:59','2018-08-26 19:59:59','GXSETH','4h','0.005086000000000','0.005081000000000','1.340664532383556','1.339346537365483','263.59900361454106','263.599003614541061','test','test','0.09'),('2018-08-26 23:59:59','2018-08-27 03:59:59','GXSETH','4h','0.005127000000000','0.005046000000000','1.340371644601762','1.319195498080845','261.433907665645','261.433907665644995','test','test','1.57'),('2018-08-27 07:59:59','2018-08-27 11:59:59','GXSETH','4h','0.005018000000000','0.005020000000000','1.335665834263780','1.336198184137938','266.17493707927065','266.174937079270649','test','test','0.0'),('2018-08-27 15:59:59','2018-08-27 19:59:59','GXSETH','4h','0.005066000000000','0.005113000000000','1.335784134235815','1.348176920321303','263.67629969123874','263.676299691238739','test','test','0.0'),('2018-08-27 23:59:59','2018-08-28 03:59:59','GXSETH','4h','0.005019000000000','0.005055000000000','1.338538086699257','1.348139077159741','266.69417945791133','266.694179457911332','test','test','0.0'),('2018-08-28 07:59:59','2018-08-28 15:59:59','GXSETH','4h','0.005039000000000','0.005188000000000','1.340671640134920','1.380314441162922','266.05906730202827','266.059067302028268','test','test','0.0'),('2018-08-28 19:59:59','2018-08-29 19:59:59','GXSETH','4h','0.005200000000000','0.005082000000000','1.349481151474476','1.318858309960248','259.5156060527839','259.515606052783880','test','test','2.26'),('2018-08-29 23:59:59','2018-08-30 07:59:59','GXSETH','4h','0.005061000000000','0.005043000000000','1.342676075582426','1.337900701276857','265.2985725315996','265.298572531599575','test','test','0.35'),('2018-08-31 07:59:59','2018-09-01 15:59:59','GXSETH','4h','0.005141000000000','0.005081000000000','1.341614881292299','1.325957053461617','260.96379717803916','260.963797178039158','test','test','1.36'),('2018-09-01 19:59:59','2018-09-01 23:59:59','GXSETH','4h','0.005101000000000','0.005140000000000','1.338135363996592','1.348366157800918','262.3280462647701','262.328046264770080','test','test','0.0'),('2018-09-02 03:59:59','2018-09-02 07:59:59','GXSETH','4h','0.005076000000000','0.005102000000000','1.340408873730887','1.347274640223598','264.0679420273614','264.067942027361426','test','test','0.0'),('2018-09-02 11:59:59','2018-09-02 15:59:59','GXSETH','4h','0.005066000000000','0.005001000000000','1.341934599618156','1.324716725758073','264.89036707819895','264.890367078198949','test','test','1.28'),('2018-09-03 07:59:59','2018-09-03 11:59:59','GXSETH','4h','0.005080000000000','0.005141000000000','1.338108405427026','1.354176242578807','263.40716642264294','263.407166422642945','test','test','0.0'),('2018-09-03 15:59:59','2018-09-03 19:59:59','GXSETH','4h','0.005190000000000','0.005119000000000','1.341679035905200','1.323324659884146','258.5123383247013','258.512338324701318','test','test','1.36'),('2018-09-03 23:59:59','2018-09-05 11:59:59','GXSETH','4h','0.005097000000000','0.005129000000000','1.337600285678299','1.345998011623307','262.4289357814987','262.428935781498694','test','test','0.0'),('2018-09-05 15:59:59','2018-09-06 03:59:59','GXSETH','4h','0.005151000000000','0.005070000000000','1.339466446999412','1.318403200599305','260.0400790136695','260.040079013669526','test','test','1.57'),('2018-09-06 15:59:59','2018-09-06 19:59:59','GXSETH','4h','0.005129000000000','0.005149000000000','1.334785725577166','1.339990583153993','260.2428788413269','260.242878841326899','test','test','0.0'),('2018-09-06 23:59:59','2018-09-13 03:59:59','GXSETH','4h','0.005215000000000','0.005515000000000','1.335942360594238','1.412794270120273','256.1730317534494','256.173031753449379','test','test','0.32'),('2018-09-13 07:59:59','2018-09-13 11:59:59','GXSETH','4h','0.005403000000000','0.005397000000000','1.353020562711135','1.351518041264482','250.42024110885345','250.420241108853446','test','test','0.11'),('2018-09-20 11:59:59','2018-09-20 15:59:59','GXSETH','4h','0.005099000000000','0.005202000000000','1.352686669056323','1.380010992828200','265.2846968143407','265.284696814340691','test','test','0.0'),('2018-09-20 19:59:59','2018-09-20 23:59:59','GXSETH','4h','0.005202000000000','0.004895000000000','1.358758741005629','1.278570556943974','261.199296617768','261.199296617768027','test','test','5.90'),('2018-09-22 11:59:59','2018-09-22 15:59:59','GXSETH','4h','0.005267000000000','0.005022000000000','1.340939144547484','1.278563961252604','254.59258487706168','254.592584877061682','test','test','4.65'),('2018-09-22 19:59:59','2018-09-22 23:59:59','GXSETH','4h','0.005067000000000','0.005333000000000','1.327077992704177','1.396745003965142','261.9060573720499','261.906057372049872','test','test','0.0'),('2018-09-23 03:59:59','2018-09-23 11:59:59','GXSETH','4h','0.005206000000000','0.005187000000000','1.342559550762169','1.337659698387125','257.88696710760075','257.886967107600753','test','test','0.36'),('2018-09-23 15:59:59','2018-09-30 23:59:59','GXSETH','4h','0.005219000000000','0.005894000000000','1.341470694678826','1.514969970192949','257.0359637246266','257.035963724626583','test','test','0.21'),('2018-10-01 03:59:59','2018-10-01 11:59:59','GXSETH','4h','0.005902000000000','0.005825000000000','1.380026089237520','1.362021682448078','233.82346479795328','233.823464797953278','test','test','1.30'),('2018-10-01 15:59:59','2018-10-01 23:59:59','GXSETH','4h','0.005833000000000','0.005875000000000','1.376025109950977','1.385933056911022','235.90349904868467','235.903499048684665','test','test','0.0'),('2018-10-02 03:59:59','2018-10-02 07:59:59','GXSETH','4h','0.005822000000000','0.005802000000000','1.378226875942099','1.373492328103068','236.72739195158002','236.727391951580017','test','test','0.34'),('2018-10-02 23:59:59','2018-10-03 07:59:59','GXSETH','4h','0.005830000000000','0.005889000000000','1.377174754200092','1.391111857201431','236.22208476845486','236.222084768454863','test','test','0.49'),('2018-10-03 11:59:59','2018-10-03 15:59:59','GXSETH','4h','0.005809000000000','0.005761000000000','1.380271888200389','1.368866646225244','237.6092078155258','237.609207815525792','test','test','0.82'),('2018-10-03 23:59:59','2018-10-04 03:59:59','GXSETH','4h','0.005861000000000','0.005785000000000','1.377737389983690','1.359872172164417','235.06865551675318','235.068655516753182','test','test','1.29'),('2018-10-04 07:59:59','2018-10-06 15:59:59','GXSETH','4h','0.006218000000000','0.005972000000000','1.373767341579407','1.319417588277938','220.93395651003658','220.933956510036580','test','test','3.95'),('2018-10-06 19:59:59','2018-10-06 23:59:59','GXSETH','4h','0.005942000000000','0.006059000000000','1.361689618623526','1.388501750124528','229.1635171025792','229.163517102579192','test','test','0.0'),('2018-10-07 11:59:59','2018-10-18 03:59:59','GXSETH','4h','0.005971000000000','0.006814000000000','1.367647870068192','1.560735653432367','229.0483788424372','229.048378842437188','test','test','0.0'),('2018-10-19 05:59:59','2018-10-19 11:59:59','GXSETH','4h','0.006948000000000','0.006820000000000','1.410556266371343','1.384570198136522','203.01615808453406','203.016158084534055','test','test','1.84'),('2018-10-20 07:59:59','2018-10-20 11:59:59','GXSETH','4h','0.006948000000000','0.006934000000000','1.404781584541382','1.401950994129238','202.18502943888632','202.185029438886318','test','test','0.20'),('2018-10-20 15:59:59','2018-10-20 19:59:59','GXSETH','4h','0.006899000000000','0.006865000000000','1.404152564449795','1.397232548912573','203.52986874181693','203.529868741816927','test','test','0.49'),('2018-10-21 03:59:59','2018-10-21 07:59:59','GXSETH','4h','0.006906000000000','0.006869000000000','1.402614783219301','1.395100050091714','203.1008953401826','203.100895340182603','test','test','0.53'),('2018-10-21 11:59:59','2018-10-21 15:59:59','GXSETH','4h','0.006990000000000','0.006875000000000','1.400944842524282','1.377896393756000','200.4212936372363','200.421293637236289','test','test','1.64'),('2018-10-21 19:59:59','2018-10-21 23:59:59','GXSETH','4h','0.006956000000000','0.006887000000000','1.395822965020219','1.381977107546614','200.66460106673648','200.664601066736481','test','test','0.99'),('2018-10-23 11:59:59','2018-10-23 15:59:59','GXSETH','4h','0.007089000000000','0.007028000000000','1.392746107803862','1.380761693559817','196.46580727942762','196.465807279427622','test','test','0.86'),('2018-10-23 19:59:59','2018-10-24 03:59:59','GXSETH','4h','0.006941000000000','0.006883000000000','1.390082904638519','1.378467170815002','200.27127281926508','200.271272819265079','test','test','0.83'),('2018-10-25 15:59:59','2018-10-25 19:59:59','GXSETH','4h','0.006920000000000','0.006789000000000','1.387501630455515','1.361235342364522','200.5060159617797','200.506015961779696','test','test','1.89'),('2018-11-03 11:59:59','2018-11-04 11:59:59','GXSETH','4h','0.006745000000000','0.006720000000000','1.381664677546406','1.376543607577739','204.84279874668727','204.842798746687265','test','test','0.37'),('2018-11-16 03:59:59','2018-11-17 03:59:59','GXSETH','4h','0.006314000000000','0.006134000000000','1.380526661997813','1.341170501218654','218.64533766199128','218.645337661991277','test','test','2.85'),('2018-11-17 11:59:59','2018-11-17 15:59:59','GXSETH','4h','0.006270000000000','0.006315000000000','1.371780848491333','1.381626165585768','218.78482432078678','218.784824320786782','test','test','0.0'),('2018-11-17 19:59:59','2018-11-17 23:59:59','GXSETH','4h','0.006221000000000','0.006136000000000','1.373968696734541','1.355195615361380','220.85978086072032','220.859780860720321','test','test','1.36'),('2018-11-18 11:59:59','2018-11-18 15:59:59','GXSETH','4h','0.006230000000000','0.006201000000000','1.369796900873839','1.363420639216481','219.8710916330399','219.871091633039896','test','test','0.46'),('2018-11-19 07:59:59','2018-11-19 15:59:59','GXSETH','4h','0.006362000000000','0.006206000000000','1.368379953838870','1.334826468645713','215.0864435458771','215.086443545877103','test','test','2.45'),('2018-11-20 03:59:59','2018-11-20 07:59:59','GXSETH','4h','0.006286000000000','0.006252000000000','1.360923623795946','1.353562598786550','216.50073557046554','216.500735570465537','test','test','0.54'),('2018-11-20 11:59:59','2018-11-20 15:59:59','GXSETH','4h','0.006303000000000','0.006219000000000','1.359287840460525','1.341172628878947','215.6572807330676','215.657280733067608','test','test','1.33'),('2018-11-20 23:59:59','2018-11-24 23:59:59','GXSETH','4h','0.006270000000000','0.006313000000000','1.355262237886841','1.364556699805363','216.15027717493473','216.150277174934729','test','test','0.0'),('2018-11-25 03:59:59','2018-11-25 07:59:59','GXSETH','4h','0.006331000000000','0.006373000000000','1.357327673868735','1.366332216958687','214.39388309409804','214.393883094098044','test','test','0.0'),('2018-11-30 23:59:59','2018-12-04 07:59:59','GXSETH','4h','0.006356000000000','0.006197000000000','1.359328683444280','1.325324079815010','213.8654316306293','213.865431630629303','test','test','2.75'),('2019-01-10 07:59:59','2019-01-15 03:59:59','GXSETH','4h','0.003955000000000','0.004097000000000','1.351772104859998','1.400306021140685','341.788142821744','341.788142821743975','test','test','0.0'),('2019-01-15 07:59:59','2019-01-15 11:59:59','GXSETH','4h','0.004103000000000','0.004129000000000','1.362557419589039','1.371191709842345','332.08808666562004','332.088086665620040','test','test','0.0'),('2019-01-15 15:59:59','2019-01-31 15:59:59','GXSETH','4h','0.004171000000000','0.004999000000000','1.364476150756440','1.635343149755800','327.1340567625126','327.134056762512614','test','test','0.45'),('2019-01-31 19:59:59','2019-02-02 15:59:59','GXSETH','4h','0.005027000000000','0.004966000000000','1.424668817200742','1.407381210705965','283.40338516028294','283.403385160282937','test','test','1.21'),('2019-02-02 19:59:59','2019-02-03 03:59:59','GXSETH','4h','0.005023000000000','0.004963000000000','1.420827126868570','1.403855271879099','282.8642498245212','282.864249824521210','test','test','1.23'),('2019-02-03 07:59:59','2019-02-05 23:59:59','GXSETH','4h','0.004990000000000','0.005036000000000','1.417055603537577','1.430118641165378','283.9790788652458','283.979078865245810','test','test','0.0'),('2019-02-06 03:59:59','2019-02-06 23:59:59','GXSETH','4h','0.005146000000000','0.005050000000000','1.419958500788199','1.393468796925846','275.93441523284076','275.934415232840763','test','test','1.86'),('2019-02-07 03:59:59','2019-02-08 19:59:59','GXSETH','4h','0.005075000000000','0.004944000000000','1.414071899929898','1.377570733645993','278.634857129044','278.634857129044008','test','test','2.58'),('2019-02-17 03:59:59','2019-02-17 07:59:59','GXSETH','4h','0.004855000000000','0.004824000000000','1.405960529644586','1.396983232750872','289.5902223778756','289.590222377875591','test','test','0.63'),('2019-02-23 15:59:59','2019-02-23 19:59:59','GXSETH','4h','0.004564000000000','0.004330000000000','1.403965574779316','1.331983115423847','307.6173476729439','307.617347672943879','test','test','5.12'),('2019-02-24 23:59:59','2019-02-25 03:59:59','GXSETH','4h','0.004657000000000','0.004414000000000','1.387969472700323','1.315545899183858','298.03939718709967','298.039397187099667','test','test','5.21'),('2019-02-25 19:59:59','2019-03-05 15:59:59','GXSETH','4h','0.004508000000000','0.004911000000000','1.371875345252220','1.494516375451121','304.3201741908207','304.320174190820694','test','test','0.0'),('2019-03-05 19:59:59','2019-03-05 23:59:59','GXSETH','4h','0.004803000000000','0.004790000000000','1.399128907518642','1.395341966898666','291.3031246135003','291.303124613500302','test','test','0.27'),('2019-03-06 03:59:59','2019-03-06 07:59:59','GXSETH','4h','0.004811000000000','0.004763000000000','1.398287365158647','1.384336462326052','290.6438090123981','290.643809012398094','test','test','0.99'),('2019-03-06 19:59:59','2019-03-06 23:59:59','GXSETH','4h','0.004784000000000','0.004797000000000','1.395187164529182','1.398978433998011','291.63611298686914','291.636112986869136','test','test','0.0'),('2019-03-07 11:59:59','2019-03-25 15:59:59','GXSETH','4h','0.004940000000000','0.007357000000000','1.396029668855588','2.079066857038575','282.59709895862113','282.597098958621132','test','test','0.16'),('2019-03-27 15:59:59','2019-04-02 15:59:59','GXSETH','4h','0.007801000000000','0.008025000000000','1.547815710674030','1.592260104878745','198.4124741281925','198.412474128192514','test','test','2.38'),('2019-04-02 19:59:59','2019-04-02 23:59:59','GXSETH','4h','0.007904000000000','0.008023000000000','1.557692242719522','1.581144339997308','197.07644771249016','197.076447712490165','test','test','0.0'),('2019-04-03 03:59:59','2019-04-03 07:59:59','GXSETH','4h','0.007723000000000','0.007671000000000','1.562903819892363','1.552380577805816','202.37004012590486','202.370040125904865','test','test','0.67'),('2019-04-04 15:59:59','2019-04-04 19:59:59','GXSETH','4h','0.007913000000000','0.007749000000000','1.560565321650909','1.528221998922393','197.21538249095272','197.215382490952720','test','test','2.07'),('2019-04-04 23:59:59','2019-04-05 03:59:59','GXSETH','4h','0.007777000000000','0.007872000000000','1.553377916600127','1.572353215825665','199.73999184777253','199.739991847772529','test','test','0.0'),('2019-04-12 19:59:59','2019-04-18 19:59:59','GXSETH','4h','0.007573000000000','0.007586000000000','1.557594649761358','1.560268455445618','205.6773603276585','205.677360327658505','test','test','1.79'),('2019-04-21 19:59:59','2019-04-22 11:59:59','GXSETH','4h','0.007866000000000','0.007707000000000','1.558188828802304','1.526692258273501','198.09163854593243','198.091638545932426','test','test','2.02'),('2019-04-22 15:59:59','2019-04-23 15:59:59','GXSETH','4h','0.007728000000000','0.007612000000000','1.551189590907015','1.527905689180150','200.72329074883737','200.723290748837371','test','test','1.50');
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

-- Dump completed on 2020-04-30 17:16:16
