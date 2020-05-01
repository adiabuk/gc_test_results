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
INSERT INTO `trades` VALUES ('2018-03-18 07:59:59','2018-03-18 15:59:59','IOTABTC','4h','0.000148070000000','0.000151180000000','0.033333333333333','0.034033452646271','225.1187501406992','225.118750140699206','test','test','0.0'),('2018-03-18 19:59:59','2018-03-19 03:59:59','IOTABTC','4h','0.000155520000000','0.000144990000000','0.033488915402875','0.031221436755805','215.33510418515374','215.335104185153739','test','test','6.77'),('2018-03-19 07:59:59','2018-03-22 11:59:59','IOTABTC','4h','0.000146980000000','0.000149090000000','0.032985031259082','0.033458554295935','224.41850087822678','224.418500878226780','test','test','0.0'),('2018-03-22 15:59:59','2018-03-22 19:59:59','IOTABTC','4h','0.000152700000000','0.000152010000000','0.033090258600605','0.032940734838756','216.70110412969657','216.701104129696574','test','test','0.45'),('2018-03-22 23:59:59','2018-03-23 07:59:59','IOTABTC','4h','0.000152230000000','0.000149050000000','0.033057031097972','0.032366488111100','217.15188266420256','217.151882664202560','test','test','2.08'),('2018-03-23 11:59:59','2018-03-23 15:59:59','IOTABTC','4h','0.000152740000000','0.000151500000000','0.032903577100889','0.032636453651857','215.42213631588902','215.422136315889020','test','test','0.81'),('2018-03-23 23:59:59','2018-03-25 11:59:59','IOTABTC','4h','0.000151200000000','0.000151820000000','0.032844216334437','0.032978894999300','217.22365300553795','217.223653005537955','test','test','0.0'),('2018-03-25 15:59:59','2018-03-26 11:59:59','IOTABTC','4h','0.000152960000000','0.000150820000000','0.032874144926629','0.032414216382284','214.91988053497067','214.919880534970673','test','test','1.39'),('2018-03-28 07:59:59','2018-03-28 11:59:59','IOTABTC','4h','0.000152420000000','0.000153230000000','0.032771938583441','0.032946097291305','215.01075044903115','215.010750449031150','test','test','0.0'),('2018-03-28 19:59:59','2018-03-28 23:59:59','IOTABTC','4h','0.000152390000000','0.000149130000000','0.032810640518522','0.032108739553299','215.30704454703215','215.307044547032149','test','test','2.13'),('2018-03-29 23:59:59','2018-03-31 19:59:59','IOTABTC','4h','0.000153490000000','0.000154090000000','0.032654662526250','0.032782311216821','212.74781761841453','212.747817618414530','test','test','0.0'),('2018-03-31 23:59:59','2018-04-01 11:59:59','IOTABTC','4h','0.000154470000000','0.000154560000000','0.032683028901933','0.032702071257090','211.58172397185785','211.581723971857855','test','test','0.0'),('2018-04-09 03:59:59','2018-04-09 11:59:59','IOTABTC','4h','0.000148010000000','0.000146590000000','0.032687260536412','0.032373660712335','220.84494653342495','220.844946533424945','test','test','0.95'),('2018-04-10 15:59:59','2018-04-10 23:59:59','IOTABTC','4h','0.000148000000000','0.000147490000000','0.032617571686617','0.032505173297697','220.38899788254957','220.388997882549575','test','test','0.34'),('2018-04-11 03:59:59','2018-04-25 03:59:59','IOTABTC','4h','0.000150850000000','0.000198590000000','0.032592594266857','0.042907280712331','216.05962391022425','216.059623910224246','test','test','0.69'),('2018-04-25 07:59:59','2018-04-25 11:59:59','IOTABTC','4h','0.000211880000000','0.000205360000000','0.034884746810296','0.033811268666049','164.64388715450252','164.643887154502522','test','test','3.07'),('2018-04-26 11:59:59','2018-04-27 23:59:59','IOTABTC','4h','0.000212220000000','0.000211480000000','0.034646196111574','0.034525386644405','163.2560367146096','163.256036714609593','test','test','0.34'),('2018-04-28 03:59:59','2018-04-29 11:59:59','IOTABTC','4h','0.000218200000000','0.000212100000000','0.034619349563315','0.033651530899996','158.65879726542013','158.658797265420134','test','test','2.79'),('2018-04-29 15:59:59','2018-04-30 03:59:59','IOTABTC','4h','0.000216630000000','0.000211990000000','0.034404278749244','0.033667373180318','158.81585537203426','158.815855372034264','test','test','2.14'),('2018-04-30 11:59:59','2018-04-30 15:59:59','IOTABTC','4h','0.000213450000000','0.000211920000000','0.034240521956149','0.033995087434749','160.41471986952033','160.414719869520326','test','test','0.71'),('2018-04-30 19:59:59','2018-04-30 23:59:59','IOTABTC','4h','0.000213530000000','0.000211410000000','0.034185980951394','0.033846570659552','160.09919426494432','160.099194264944316','test','test','0.99'),('2018-05-01 23:59:59','2018-05-07 03:59:59','IOTABTC','4h','0.000216090000000','0.000232870000000','0.034110556442095','0.036759337677221','157.85347050810006','157.853470508100060','test','test','0.0'),('2018-05-07 07:59:59','2018-05-07 11:59:59','IOTABTC','4h','0.000231160000000','0.000230360000000','0.034699174494346','0.034579087370296','150.10890506292418','150.108905062924180','test','test','0.34'),('2018-05-07 15:59:59','2018-05-10 23:59:59','IOTABTC','4h','0.000231550000000','0.000236200000000','0.034672488466779','0.035368783311826','149.74082689172485','149.740826891724851','test','test','0.0'),('2018-05-15 11:59:59','2018-05-15 15:59:59','IOTABTC','4h','0.000234900000000','0.000231260000000','0.034827220654567','0.034287539585250','148.2640300322142','148.264030032214208','test','test','1.54'),('2018-05-15 23:59:59','2018-05-16 03:59:59','IOTABTC','4h','0.000234560000000','0.000228130000000','0.034707291528052','0.033755859551051','147.96764805615715','147.967648056157145','test','test','2.74'),('2018-05-29 19:59:59','2018-06-04 07:59:59','IOTABTC','4h','0.000217120000000','0.000229150000000','0.034495862199830','0.036407179546293','158.87924741999717','158.879247419997171','test','test','4.41'),('2018-06-04 11:59:59','2018-06-05 03:59:59','IOTABTC','4h','0.000229650000000','0.000225610000000','0.034920599387933','0.034306276629269','152.0600887782829','152.060088778282903','test','test','1.75'),('2018-06-05 11:59:59','2018-06-05 23:59:59','IOTABTC','4h','0.000229600000000','0.000228690000000','0.034784083219341','0.034646219474874','151.4986202932956','151.498620293295602','test','test','1.00'),('2018-06-06 03:59:59','2018-06-06 11:59:59','IOTABTC','4h','0.000230300000000','0.000226480000000','0.034753446831681','0.034176989311503','150.90510999427414','150.905109994274142','test','test','1.65'),('2018-06-09 03:59:59','2018-06-09 07:59:59','IOTABTC','4h','0.000225900000000','0.000225250000000','0.034625345160531','0.034525714906638','153.27731368096798','153.277313680967978','test','test','0.28'),('2018-07-01 23:59:59','2018-07-02 07:59:59','IOTABTC','4h','0.000167900000000','0.000165910000000','0.034603205104110','0.034193077777385','206.09413403281718','206.094134032817180','test','test','1.18'),('2018-07-02 11:59:59','2018-07-05 19:59:59','IOTABTC','4h','0.000168110000000','0.000174070000000','0.034512065698171','0.035735621177090','205.29454344281194','205.294543442811943','test','test','0.0'),('2018-07-05 23:59:59','2018-07-06 07:59:59','IOTABTC','4h','0.000176420000000','0.000169730000000','0.034783966915709','0.033464928605619','197.16566668013076','197.165666680130755','test','test','3.79'),('2018-07-16 11:59:59','2018-07-17 07:59:59','IOTABTC','4h','0.000162310000000','0.000160530000000','0.034490847291244','0.034112597595117','212.49982928497454','212.499829284974538','test','test','1.09'),('2018-07-17 11:59:59','2018-07-17 15:59:59','IOTABTC','4h','0.000158630000000','0.000159990000000','0.034406791803216','0.034701775329991','216.89965204069853','216.899652040698527','test','test','0.0'),('2018-08-03 23:59:59','2018-08-04 03:59:59','IOTABTC','4h','0.000129550000000','0.000123370000000','0.034472343698055','0.032827889170429','266.09296563531365','266.092965635313647','test','test','4.77'),('2018-08-05 07:59:59','2018-08-06 19:59:59','IOTABTC','4h','0.000130990000000','0.000124810000000','0.034106909358582','0.032497773547940','260.37796288710933','260.377962887109334','test','test','4.71'),('2018-08-26 23:59:59','2018-09-03 11:59:59','IOTABTC','4h','0.000085530000000','0.000095620000000','0.033749323622884','0.037730741550569','394.5904784623433','394.590478462343299','test','test','0.0'),('2018-09-03 15:59:59','2018-09-03 19:59:59','IOTABTC','4h','0.000096610000000','0.000096200000000','0.034634083162370','0.034487100716489','358.49377044167045','358.493770441670449','test','test','0.42'),('2018-09-03 23:59:59','2018-09-04 03:59:59','IOTABTC','4h','0.000096040000000','0.000096650000000','0.034601420396618','0.034821192017213','360.2813452375932','360.281345237593200','test','test','0.0'),('2018-09-04 07:59:59','2018-09-04 23:59:59','IOTABTC','4h','0.000097410000000','0.000095660000000','0.034650258534528','0.034027756199702','355.7156199007129','355.715619900712909','test','test','1.79'),('2018-09-05 03:59:59','2018-09-05 07:59:59','IOTABTC','4h','0.000095670000000','0.000096010000000','0.034511924682345','0.034634576029601','360.7392566357781','360.739256635778077','test','test','0.0'),('2018-09-10 03:59:59','2018-09-10 07:59:59','IOTABTC','4h','0.000093110000000','0.000092130000000','0.034539180537291','0.034175649263244','370.9502796401103','370.950279640110296','test','test','1.05'),('2018-09-14 03:59:59','2018-09-14 11:59:59','IOTABTC','4h','0.000091590000000','0.000089040000000','0.034458395809725','0.033499023505818','376.2244329045165','376.224432904516505','test','test','2.78'),('2018-09-14 19:59:59','2018-09-14 23:59:59','IOTABTC','4h','0.000090750000000','0.000087830000000','0.034245201964412','0.033143317779992','377.357597403989','377.357597403989018','test','test','3.21'),('2018-09-21 19:59:59','2018-09-22 11:59:59','IOTABTC','4h','0.000089740000000','0.000088000000000','0.034000338812319','0.033341094444886','378.8760732373375','378.876073237337494','test','test','1.93'),('2018-09-22 15:59:59','2018-09-24 07:59:59','IOTABTC','4h','0.000088840000000','0.000084350000000','0.033853840064000','0.032142856927042','381.06528662764777','381.065286627647765','test','test','5.05'),('2018-09-25 23:59:59','2018-09-26 03:59:59','IOTABTC','4h','0.000088490000000','0.000085300000000','0.033473621589121','0.032266921929619','378.27575532964937','378.275755329649371','test','test','3.60'),('2018-09-27 19:59:59','2018-09-27 23:59:59','IOTABTC','4h','0.000088470000000','0.000087550000000','0.033205466109231','0.032860162290756','375.3302374729437','375.330237472943679','test','test','1.03'),('2018-10-05 23:59:59','2018-10-06 15:59:59','IOTABTC','4h','0.000086740000000','0.000085860000000','0.033128731927348','0.032792632272102','381.9314264162785','381.931426416278498','test','test','1.01'),('2018-10-06 19:59:59','2018-10-06 23:59:59','IOTABTC','4h','0.000085920000000','0.000085840000000','0.033054043115071','0.033023266538614','384.70720571544587','384.707205715445866','test','test','0.09'),('2018-10-07 03:59:59','2018-10-07 07:59:59','IOTABTC','4h','0.000086230000000','0.000085610000000','0.033047203875858','0.032809592065548','383.2448553387272','383.244855338727177','test','test','0.71'),('2018-10-07 15:59:59','2018-10-10 07:59:59','IOTABTC','4h','0.000086200000000','0.000087690000000','0.032994401251345','0.033564722108242','382.7656757696649','382.765675769664881','test','test','0.08'),('2018-10-10 11:59:59','2018-10-11 03:59:59','IOTABTC','4h','0.000088030000000','0.000084100000000','0.033121139219544','0.031642483339358','376.2483155690611','376.248315569061106','test','test','4.46'),('2018-11-02 11:59:59','2018-11-03 07:59:59','IOTABTC','4h','0.000075350000000','0.000074500000000','0.032792549023948','0.032422626440400','435.20303946844797','435.203039468447969','test','test','1.12'),('2018-11-03 11:59:59','2018-11-03 19:59:59','IOTABTC','4h','0.000074970000000','0.000074620000000','0.032710344005381','0.032557634649614','436.312445049771','436.312445049770986','test','test','0.46'),('2018-11-03 23:59:59','2018-11-04 03:59:59','IOTABTC','4h','0.000074980000000','0.000074510000000','0.032676408592989','0.032471581811998','435.8016616829644','435.801661682964379','test','test','0.62'),('2018-11-04 07:59:59','2018-11-04 11:59:59','IOTABTC','4h','0.000074940000000','0.000075190000000','0.032630891530546','0.032739748254360','435.4268952568218','435.426895256821808','test','test','0.0'),('2018-11-04 15:59:59','2018-11-08 07:59:59','IOTABTC','4h','0.000075850000000','0.000076000000000','0.032655081913616','0.032719660190307','430.5218446093079','430.521844609307891','test','test','0.0'),('2018-11-08 11:59:59','2018-11-08 15:59:59','IOTABTC','4h','0.000076400000000','0.000075710000000','0.032669432641770','0.032374381483094','427.6103748922717','427.610374892271693','test','test','0.90'),('2018-11-10 15:59:59','2018-11-10 19:59:59','IOTABTC','4h','0.000076490000000','0.000076390000000','0.032603865717619','0.032561240713412','426.2500420658822','426.250042065882212','test','test','0.13'),('2018-11-10 23:59:59','2018-11-11 03:59:59','IOTABTC','4h','0.000075540000000','0.000075300000000','0.032594393494462','0.032490837041739','431.4852196778161','431.485219677816076','test','test','0.31'),('2018-11-12 07:59:59','2018-11-14 11:59:59','IOTABTC','4h','0.000076300000000','0.000076150000000','0.032571380949413','0.032507348090404','426.88572672886846','426.885726728868462','test','test','0.19'),('2018-11-23 23:59:59','2018-11-24 19:59:59','IOTABTC','4h','0.000072690000000','0.000071900000000','0.032557151425188','0.032203318028216','447.8903759139971','447.890375913997104','test','test','1.08'),('2018-12-02 03:59:59','2018-12-02 07:59:59','IOTABTC','4h','0.000071490000000','0.000071250000000','0.032478521781417','0.032369487717526','454.3085995442285','454.308599544228514','test','test','0.33'),('2018-12-15 15:59:59','2019-01-06 07:59:59','IOTABTC','4h','0.000067190000000','0.000093400000000','0.032454291989441','0.045114315698970','483.02265202323434','483.022652023234343','test','test','0.0'),('2019-01-06 11:59:59','2019-01-06 19:59:59','IOTABTC','4h','0.000094670000000','0.000093610000000','0.035267630591559','0.034872746378746','372.5322762391325','372.532276239132500','test','test','1.11'),('2019-01-06 23:59:59','2019-01-07 03:59:59','IOTABTC','4h','0.000092840000000','0.000092350000000','0.035179878544267','0.034994202752726','378.93018681890237','378.930186818902371','test','test','0.52'),('2019-01-19 11:59:59','2019-01-19 19:59:59','IOTABTC','4h','0.000085130000000','0.000084920000000','0.035138617257258','0.035051936773010','412.76421070430854','412.764210704308539','test','test','0.24'),('2019-01-21 15:59:59','2019-01-21 23:59:59','IOTABTC','4h','0.000085310000000','0.000085160000000','0.035119354927425','0.035057604801542','411.6675058894021','411.667505889402094','test','test','0.17'),('2019-02-08 11:59:59','2019-02-09 19:59:59','IOTABTC','4h','0.000075090000000','0.000075110000000','0.035105632677229','0.035114982958938','467.5140854604964','467.514085460496403','test','test','0.06'),('2019-02-09 23:59:59','2019-02-10 15:59:59','IOTABTC','4h','0.000075400000000','0.000075220000000','0.035107710517608','0.035023899007089','465.6195028860537','465.619502886053681','test','test','0.23'),('2019-02-10 19:59:59','2019-02-11 11:59:59','IOTABTC','4h','0.000075530000000','0.000074040000000','0.035089085737493','0.034396874195737','464.5715045345309','464.571504534530902','test','test','1.97'),('2019-02-12 19:59:59','2019-02-12 23:59:59','IOTABTC','4h','0.000075220000000','0.000075310000000','0.034935260950436','0.034977060651121','464.44111872422536','464.441118724225362','test','test','0.0'),('2019-02-13 03:59:59','2019-02-13 07:59:59','IOTABTC','4h','0.000075010000000','0.000075150000000','0.034944549772811','0.035009770902903','465.86521494215003','465.865214942150033','test','test','0.0'),('2019-02-13 11:59:59','2019-02-13 15:59:59','IOTABTC','4h','0.000074760000000','0.000074230000000','0.034959043357276','0.034711206372533','467.6169523445099','467.616952344509912','test','test','0.70'),('2019-02-15 11:59:59','2019-02-16 03:59:59','IOTABTC','4h','0.000075640000000','0.000074650000000','0.034903968471777','0.034447134405317','461.448551980131','461.448551980131015','test','test','1.30'),('2019-02-16 07:59:59','2019-02-16 11:59:59','IOTABTC','4h','0.000074960000000','0.000075710000000','0.034802449790342','0.035150660000357','464.2802800205651','464.280280020565101','test','test','0.0'),('2019-02-16 15:59:59','2019-02-16 19:59:59','IOTABTC','4h','0.000074990000000','0.000075140000000','0.034879829837012','0.034949598799214','465.1264146821117','465.126414682111715','test','test','0.0'),('2019-02-16 23:59:59','2019-02-18 03:59:59','IOTABTC','4h','0.000075730000000','0.000074720000000','0.034895334050834','0.034429940053853','460.7861356243791','460.786135624379085','test','test','1.33'),('2019-02-18 07:59:59','2019-02-21 19:59:59','IOTABTC','4h','0.000075440000000','0.000076050000000','0.034791913162616','0.035073236956746','461.186547754722','461.186547754722028','test','test','0.0'),('2019-02-22 03:59:59','2019-02-22 07:59:59','IOTABTC','4h','0.000076950000000','0.000076410000000','0.034854429561312','0.034609837073162','452.9490521288081','452.949052128808091','test','test','0.70'),('2019-02-22 11:59:59','2019-02-22 15:59:59','IOTABTC','4h','0.000076480000000','0.000077120000000','0.034800075675056','0.035091289697441','455.0219099771996','455.021909977199584','test','test','0.0'),('2019-02-22 19:59:59','2019-02-23 03:59:59','IOTABTC','4h','0.000077260000000','0.000076870000000','0.034864789902253','0.034688796269560','451.2657248544253','451.265724854425287','test','test','0.50'),('2019-02-23 19:59:59','2019-02-24 07:59:59','IOTABTC','4h','0.000077130000000','0.000076770000000','0.034825680206099','0.034663133273982','451.5192558809658','451.519255880965773','test','test','0.46'),('2019-02-24 11:59:59','2019-02-24 15:59:59','IOTABTC','4h','0.000077510000000','0.000074730000000','0.034789558665628','0.033541784532091','448.83961638018906','448.839616380189057','test','test','3.58'),('2019-03-01 07:59:59','2019-03-02 07:59:59','IOTABTC','4h','0.000076390000000','0.000075390000000','0.034512275524842','0.034060485034924','451.7904899180841','451.790489918084120','test','test','1.30'),('2019-03-02 11:59:59','2019-03-02 15:59:59','IOTABTC','4h','0.000075720000000','0.000075360000000','0.034411877638194','0.034248271246887','454.4621980744059','454.462198074405876','test','test','0.47'),('2019-03-02 23:59:59','2019-03-03 11:59:59','IOTABTC','4h','0.000076280000000','0.000075630000000','0.034375520662348','0.034082598685021','450.64919588814905','450.649195888149052','test','test','0.85'),('2019-03-13 03:59:59','2019-03-13 11:59:59','IOTABTC','4h','0.000073980000000','0.000072570000000','0.034310426889609','0.033656497423343','463.7797633091197','463.779763309119687','test','test','1.90'),('2019-03-13 15:59:59','2019-03-17 11:59:59','IOTABTC','4h','0.000073190000000','0.000074870000000','0.034165109230438','0.034949333625945','466.80023542066476','466.800235420664762','test','test','0.0'),('2019-03-17 15:59:59','2019-03-17 19:59:59','IOTABTC','4h','0.000074460000000','0.000074420000000','0.034339381318329','0.034320934162101','461.17890569874965','461.178905698749645','test','test','0.05');
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

-- Dump completed on 2020-04-30 17:18:46
