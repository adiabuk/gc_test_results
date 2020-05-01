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
INSERT INTO `trades` VALUES ('2018-04-28 19:59:59','2018-04-29 03:59:59','RCNETH','4h','0.000226270000000','0.000220400000000','1.297777777777778','1.264110232121900','5735.527368974136','5735.527368974136152','test','test','2.59'),('2018-04-29 19:59:59','2018-04-30 11:59:59','RCNETH','4h','0.000224530000000','0.000221040000000','1.290296100965360','1.270240280396309','5746.653458180913','5746.653458180912821','test','test','1.55'),('2018-04-30 15:59:59','2018-04-30 19:59:59','RCNETH','4h','0.000223590000000','0.000230180000000','1.285839251950016','1.323737550936333','5750.879967574649','5750.879967574648617','test','test','0.0'),('2018-04-30 23:59:59','2018-05-01 03:59:59','RCNETH','4h','0.000228750000000','0.000218550000000','1.294261096169197','1.236549781717062','5657.972005111245','5657.972005111245380','test','test','4.45'),('2018-05-02 11:59:59','2018-05-02 15:59:59','RCNETH','4h','0.000223560000000','0.000221310000000','1.281436359624279','1.268539455843841','5731.957235750038','5731.957235750038308','test','test','1.00'),('2018-06-01 19:59:59','2018-06-02 11:59:59','RCNETH','4h','0.000161440000000','0.000155120000000','1.278570381006403','1.228517328429839','7919.786800089218','7919.786800089217650','test','test','3.91'),('2018-06-02 15:59:59','2018-06-02 19:59:59','RCNETH','4h','0.000155970000000','0.000153930000000','1.267447480433834','1.250869979247163','8126.226071897375','8126.226071897374823','test','test','1.30'),('2018-06-02 23:59:59','2018-06-03 03:59:59','RCNETH','4h','0.000155200000000','0.000153310000000','1.263763591281240','1.248373686722467','8142.80664485335','8142.806644853350008','test','test','1.21'),('2018-07-01 15:59:59','2018-07-01 23:59:59','RCNETH','4h','0.000103950000000','0.000100310000000','1.260343612490401','1.216210368147303','12124.517676675337','12124.517676675337498','test','test','3.50'),('2018-07-02 07:59:59','2018-07-02 11:59:59','RCNETH','4h','0.000102520000000','0.000106650000000','1.250536224858602','1.300913854673916','12197.973320899357','12197.973320899356622','test','test','0.0'),('2018-07-02 15:59:59','2018-07-03 23:59:59','RCNETH','4h','0.000111240000000','0.000105570000000','1.261731253706450','1.197419709221412','11342.424071435182','11342.424071435181759','test','test','5.09'),('2018-07-04 00:22:26','2018-07-06 11:59:59','RCNETH','4h','0.000105610000000','0.000105120000000','1.247439799376441','1.241652037784788','11811.758350311913','11811.758350311913091','test','test','0.46'),('2018-07-06 15:59:59','2018-07-07 11:59:59','RCNETH','4h','0.000107360000000','0.000106120000000','1.246153630133852','1.231760648563752','11607.24320169385','11607.243201693849187','test','test','1.15'),('2018-07-07 15:59:59','2018-07-07 19:59:59','RCNETH','4h','0.000106300000000','0.000105530000000','1.242955189784940','1.233951657365990','11692.899245389845','11692.899245389844509','test','test','0.72'),('2018-07-08 19:59:59','2018-07-09 03:59:59','RCNETH','4h','0.000108490000000','0.000109000000000','1.240954404802952','1.246788000032462','11438.422018646435','11438.422018646435390','test','test','1.95'),('2018-07-09 07:59:59','2018-07-09 11:59:59','RCNETH','4h','0.000106490000000','0.000104410000000','1.242250759298398','1.217986682114243','11665.421723151452','11665.421723151452170','test','test','1.95'),('2018-07-09 15:59:59','2018-07-09 23:59:59','RCNETH','4h','0.000110200000000','0.000105170000000','1.236858742146364','1.180403211538413','11223.76354034813','11223.763540348130846','test','test','4.56'),('2018-07-17 23:59:59','2018-07-19 19:59:59','RCNETH','4h','0.000100180000000','0.000100850000000','1.224313068677930','1.232501227552098','12221.132648012877','12221.132648012877326','test','test','0.0'),('2018-07-19 23:59:59','2018-07-20 03:59:59','RCNETH','4h','0.000100480000000','0.000098120000000','1.226132659538856','1.197334161564018','12202.753379168555','12202.753379168554602','test','test','2.34'),('2018-07-23 15:59:59','2018-07-23 23:59:59','RCNETH','4h','0.000104300000000','0.000097110000000','1.219732993322226','1.135649769717367','11694.467817087498','11694.467817087497679','test','test','6.89'),('2018-07-26 03:59:59','2018-07-26 07:59:59','RCNETH','4h','0.000097510000000','0.000094080000000','1.201047832521146','1.158799918814372','12317.176007805825','12317.176007805825066','test','test','3.51'),('2018-07-27 19:59:59','2018-07-27 23:59:59','RCNETH','4h','0.000097720000000','0.000094640000000','1.191659407252974','1.154099941694857','12194.6316747132','12194.631674713200482','test','test','3.15'),('2018-07-28 03:59:59','2018-07-28 23:59:59','RCNETH','4h','0.000098130000000','0.000096360000000','1.183312859351170','1.161969093315793','12058.62487874422','12058.624878744220041','test','test','1.80'),('2018-07-29 03:59:59','2018-07-31 11:59:59','RCNETH','4h','0.000106840000000','0.000100490000000','1.178569800232198','1.108521894658682','11031.16623204977','11031.166232049770770','test','test','8.91'),('2018-07-31 15:59:59','2018-07-31 19:59:59','RCNETH','4h','0.000097390000000','0.000098000000000','1.163003598993638','1.170288044987951','11941.714744775012','11941.714744775012150','test','test','0.0'),('2018-08-20 07:59:59','2018-08-20 11:59:59','RCNETH','4h','0.000072970000000','0.000071670000000','1.164622364770153','1.143873987708330','15960.29004755588','15960.290047555879937','test','test','1.78'),('2018-08-20 15:59:59','2018-08-20 23:59:59','RCNETH','4h','0.000074110000000','0.000069070000000','1.160011614311970','1.081122685204801','15652.565299041557','15652.565299041556500','test','test','6.80'),('2018-08-25 15:59:59','2018-08-29 19:59:59','RCNETH','4h','0.000072010000000','0.000072950000000','1.142480741177043','1.157394390624431','15865.58451849803','15865.584518498029865','test','test','1.95'),('2018-08-31 07:59:59','2018-09-02 15:59:59','RCNETH','4h','0.000074850000000','0.000074620000000','1.145794885498685','1.142274072891274','15307.880901786039','15307.880901786038521','test','test','0.30'),('2018-09-02 19:59:59','2018-09-02 23:59:59','RCNETH','4h','0.000074770000000','0.000077000000000','1.145012482697038','1.179162246458097','15313.795408546715','15313.795408546715407','test','test','0.0'),('2018-09-03 03:59:59','2018-09-14 03:59:59','RCNETH','4h','0.000077040000000','0.000093960000000','1.152601319088384','1.405742730290038','14961.076312154522','14961.076312154522384','test','test','1.46'),('2018-09-14 07:59:59','2018-09-14 19:59:59','RCNETH','4h','0.000097550000000','0.000092600000000','1.208854966022085','1.147513786300821','12392.157519447312','12392.157519447311643','test','test','5.07'),('2018-09-14 23:59:59','2018-09-21 23:59:59','RCNETH','4h','0.000097570000000','0.000114300000000','1.195223592750693','1.400164565454588','12249.90870913901','12249.908709139010170','test','test','0.18'),('2018-09-22 07:59:59','2018-09-24 11:59:59','RCNETH','4h','0.000117050000000','0.000116170000000','1.240766031129337','1.231437760241735','10600.307826820475','10600.307826820475384','test','test','0.75'),('2018-09-24 15:59:59','2018-09-24 19:59:59','RCNETH','4h','0.000119170000000','0.000117380000000','1.238693082043203','1.220087219688103','10394.33651122936','10394.336511229359530','test','test','1.50'),('2018-09-24 23:59:59','2018-09-25 03:59:59','RCNETH','4h','0.000118930000000','0.000124200000000','1.234558445964292','1.289263928266754','10380.546926463396','10380.546926463395721','test','test','0.0'),('2018-09-25 07:59:59','2018-09-27 19:59:59','RCNETH','4h','0.000121980000000','0.000120140000000','1.246715219809283','1.227909218789041','10220.652728392224','10220.652728392224162','test','test','1.50'),('2018-09-27 23:59:59','2018-09-28 03:59:59','RCNETH','4h','0.000123630000000','0.000119500000000','1.242536108471452','1.201027784213690','10050.441708901171','10050.441708901171296','test','test','3.34'),('2018-09-28 15:59:59','2018-09-28 19:59:59','RCNETH','4h','0.000121450000000','0.000129160000000','1.233312036414171','1.311606279318685','10154.895318354644','10154.895318354643678','test','test','0.0'),('2018-09-28 23:59:59','2018-09-29 11:59:59','RCNETH','4h','0.000128750000000','0.000122360000000','1.250710757059619','1.188636646476233','9714.258307259175','9714.258307259175126','test','test','4.96'),('2018-09-29 15:59:59','2018-09-29 19:59:59','RCNETH','4h','0.000122850000000','0.000119120000000','1.236916510263311','1.199360966239850','10068.510462053811','10068.510462053811352','test','test','3.03'),('2018-09-29 23:59:59','2018-09-30 07:59:59','RCNETH','4h','0.000122410000000','0.000124100000000','1.228570833813653','1.245532558420671','10036.523436105326','10036.523436105326255','test','test','0.0'),('2018-09-30 11:59:59','2018-09-30 15:59:59','RCNETH','4h','0.000120960000000','0.000122380000000','1.232340105948546','1.246807061557400','10187.996907643403','10187.996907643402665','test','test','0.0'),('2018-10-02 23:59:59','2018-10-03 03:59:59','RCNETH','4h','0.000121840000000','0.000118580000000','1.235554984972736','1.202495979301273','10140.799285725014','10140.799285725013760','test','test','2.67'),('2018-10-03 19:59:59','2018-10-04 03:59:59','RCNETH','4h','0.000125950000000','0.000120330000000','1.228208539267966','1.173404791823059','9751.556484858802','9751.556484858801923','test','test','4.46'),('2018-10-04 11:59:59','2018-10-08 03:59:59','RCNETH','4h','0.000124780000000','0.000127600000000','1.216029928724653','1.243511932242873','9745.391318517819','9745.391318517818945','test','test','0.0'),('2018-10-08 07:59:59','2018-10-08 11:59:59','RCNETH','4h','0.000128210000000','0.000127910000000','1.222137040617591','1.219277348610842','9532.306689163022','9532.306689163022384','test','test','0.23'),('2018-10-08 15:59:59','2018-10-08 19:59:59','RCNETH','4h','0.000129160000000','0.000126200000000','1.221501553504980','1.193508021464296','9457.27433806891','9457.274338068909856','test','test','2.29'),('2018-10-08 23:59:59','2018-10-09 03:59:59','RCNETH','4h','0.000127240000000','0.000130150000000','1.215280768607051','1.243074442268215','9551.090605211022','9551.090605211022194','test','test','0.0'),('2018-10-09 07:59:59','2018-10-11 07:59:59','RCNETH','4h','0.000131420000000','0.000131220000000','1.221457140531754','1.219598280174835','9294.301784597119','9294.301784597118967','test','test','1.30'),('2018-10-11 11:59:59','2018-10-11 23:59:59','RCNETH','4h','0.000136410000000','0.000129400000000','1.221044060452438','1.158295589931424','8951.279674895082','8951.279674895082280','test','test','5.13'),('2018-10-12 07:59:59','2018-10-15 07:59:59','RCNETH','4h','0.000135700000000','0.000125000000000','1.207099955892213','1.111919635125473','8895.35708100378','8895.357081003779967','test','test','7.88'),('2018-10-17 07:59:59','2018-10-18 19:59:59','RCNETH','4h','0.000132870000000','0.000134880000000','1.185948773499604','1.203889294570833','8925.632373745797','8925.632373745796940','test','test','0.0'),('2018-10-18 23:59:59','2018-10-26 11:59:59','RCNETH','4h','0.000138370000000','0.000143670000000','1.189935555959877','1.235513777009146','8599.664348918675','8599.664348918675387','test','test','1.85'),('2018-10-26 15:59:59','2018-10-26 19:59:59','RCNETH','4h','0.000144110000000','0.000143440000000','1.200064049526381','1.194484680203068','8327.416900467568','8327.416900467567757','test','test','0.46'),('2018-10-27 23:59:59','2018-11-04 07:59:59','RCNETH','4h','0.000168550000000','0.000159660000000','1.198824189676756','1.135593415151533','7112.573062454798','7112.573062454797764','test','test','7.00'),('2018-11-06 03:59:59','2018-11-06 07:59:59','RCNETH','4h','0.000163210000000','0.000157120000000','1.184772906448929','1.140564420447618','7259.193103663554','7259.193103663554211','test','test','3.73'),('2018-11-06 11:59:59','2018-11-06 19:59:59','RCNETH','4h','0.000171790000000','0.000158200000000','1.174948798448638','1.082000698030005','6839.4481544248065','6839.448154424806489','test','test','7.91'),('2018-11-07 03:59:59','2018-11-07 07:59:59','RCNETH','4h','0.000162030000000','0.000159910000000','1.154293665022275','1.139190890413578','7123.950287121364','7123.950287121364454','test','test','1.30'),('2018-11-07 15:59:59','2018-11-07 19:59:59','RCNETH','4h','0.000160310000000','0.000159170000000','1.150937492887009','1.142752920858495','7179.449147819903','7179.449147819903374','test','test','0.71'),('2018-11-07 23:59:59','2018-11-09 15:59:59','RCNETH','4h','0.000158970000000','0.000163470000000','1.149118699102894','1.181647063863308','7228.525502314237','7228.525502314237201','test','test','0.0'),('2018-11-09 19:59:59','2018-11-10 11:59:59','RCNETH','4h','0.000166690000000','0.000158650000000','1.156347224605209','1.100572842903692','6937.112151929982','6937.112151929982247','test','test','4.82'),('2018-11-27 11:59:59','2018-11-27 19:59:59','RCNETH','4h','0.000128720000000','0.000128040000000','1.143952917560427','1.137909661004017','8887.141994720534','8887.141994720534058','test','test','0.52'),('2018-11-28 03:59:59','2018-11-30 15:59:59','RCNETH','4h','0.000134010000000','0.000133820000000','1.142609971659003','1.140989973937824','8526.303795679447','8526.303795679446921','test','test','2.33'),('2018-11-30 19:59:59','2018-11-30 23:59:59','RCNETH','4h','0.000132900000000','0.000132460000000','1.142249972165407','1.138468256681940','8594.807916970709','8594.807916970708902','test','test','0.33'),('2018-12-01 03:59:59','2018-12-06 15:59:59','RCNETH','4h','0.000133930000000','0.000141200000000','1.141409590946859','1.203367686416012','8522.434039773458','8522.434039773457698','test','test','0.0'),('2019-01-11 11:59:59','2019-01-11 15:59:59','RCNETH','4h','0.000085540000000','0.000084960000000','1.155178056606671','1.147345425406860','13504.536551399005','13504.536551399005475','test','test','0.67'),('2019-01-11 19:59:59','2019-01-12 11:59:59','RCNETH','4h','0.000085810000000','0.000085150000000','1.153437471895602','1.144565909939524','13441.7605395129','13441.760539512899413','test','test','1.13'),('2019-01-12 15:59:59','2019-01-12 23:59:59','RCNETH','4h','0.000084670000000','0.000084920000000','1.151466013683140','1.154865877902117','13599.456875908112','13599.456875908112124','test','test','0.0'),('2019-01-13 03:59:59','2019-01-14 15:59:59','RCNETH','4h','0.000085670000000','0.000084480000000','1.152221539065135','1.136216594142904','13449.53354809309','13449.533548093089848','test','test','1.38'),('2019-01-14 19:59:59','2019-01-24 03:59:59','RCNETH','4h','0.000085540000000','0.000100820000000','1.148664884637973','1.353850756011228','13428.394723380554','13428.394723380553842','test','test','0.0'),('2019-01-24 07:59:59','2019-01-25 15:59:59','RCNETH','4h','0.000100800000000','0.000101730000000','1.194261744943140','1.205280231280413','11847.834771261312','11847.834771261312198','test','test','0.43'),('2019-01-25 19:59:59','2019-01-27 11:59:59','RCNETH','4h','0.000101730000000','0.000100320000000','1.196710297462534','1.180123631587943','11763.59281885908','11763.592818859080580','test','test','1.38'),('2019-01-27 23:59:59','2019-01-28 03:59:59','RCNETH','4h','0.000102840000000','0.000101210000000','1.193024371712625','1.174115097831921','11600.781521904173','11600.781521904173132','test','test','1.58'),('2019-01-28 11:59:59','2019-01-28 15:59:59','RCNETH','4h','0.000103250000000','0.000102500000000','1.188822310850246','1.180186797696370','11514.017538501177','11514.017538501177114','test','test','0.72'),('2019-01-28 19:59:59','2019-01-31 07:59:59','RCNETH','4h','0.000103060000000','0.000102540000000','1.186903307927163','1.180914663252972','11516.624373444238','11516.624373444237790','test','test','0.50'),('2019-02-05 15:59:59','2019-02-05 19:59:59','RCNETH','4h','0.000100230000000','0.000098020000000','1.185572497999565','1.159431470157811','11828.519385409209','11828.519385409208553','test','test','2.20'),('2019-02-06 03:59:59','2019-02-06 11:59:59','RCNETH','4h','0.000099390000000','0.000099670000000','1.179763380701397','1.183086992197487','11870.041057464508','11870.041057464508413','test','test','0.0'),('2019-02-06 15:59:59','2019-02-07 03:59:59','RCNETH','4h','0.000101660000000','0.000100000000000','1.180501961033862','1.161225615811393','11612.256158113927','11612.256158113927086','test','test','1.63'),('2019-02-07 07:59:59','2019-02-07 11:59:59','RCNETH','4h','0.000099080000000','0.000099390000000','1.176218328762202','1.179898462814647','11871.400169178463','11871.400169178463329','test','test','0.0'),('2019-02-07 19:59:59','2019-02-08 03:59:59','RCNETH','4h','0.000102610000000','0.000099030000000','1.177036136329412','1.135970067056834','11470.969070552697','11470.969070552697303','test','test','3.48'),('2019-02-08 07:59:59','2019-02-08 11:59:59','RCNETH','4h','0.000101090000000','0.000097830000000','1.167910343157728','1.130246996449901','11553.173836756636','11553.173836756635865','test','test','3.22'),('2019-02-21 23:59:59','2019-03-13 03:59:59','RCNETH','4h','0.000108920000000','0.000169370000000','1.159540710555989','1.803079417433602','10645.801602607315','10645.801602607314635','test','test','6.39'),('2019-03-13 07:59:59','2019-03-20 19:59:59','RCNETH','4h','0.000168940000000','0.000176620000000','1.302549312084347','1.361763108206093','7710.129703352358','7710.129703352357865','test','test','0.22'),('2019-03-20 23:59:59','2019-03-21 15:59:59','RCNETH','4h','0.000175890000000','0.000167850000000','1.315707933444735','1.255566414399333','7480.288438482775','7480.288438482774836','test','test','4.57'),('2019-03-24 15:59:59','2019-03-25 07:59:59','RCNETH','4h','0.000175890000000','0.000170290000000','1.302343151434646','1.260879045186229','7404.304687217272','7404.304687217271749','test','test','3.18'),('2019-03-25 19:59:59','2019-03-25 23:59:59','RCNETH','4h','0.000173410000000','0.000169610000000','1.293128905601664','1.264792074730974','7457.060755444693','7457.060755444693314','test','test','2.19'),('2019-03-27 11:59:59','2019-04-02 07:59:59','RCNETH','4h','0.000177820000000','0.000208630000000','1.286831832074844','1.509794877549065','7236.710336716029','7236.710336716028905','test','test','1.08'),('2019-04-02 11:59:59','2019-04-02 15:59:59','RCNETH','4h','0.000204830000000','0.000197020000000','1.336379175513560','1.285424132986777','6524.333230061808','6524.333230061807626','test','test','3.81'),('2019-04-02 19:59:59','2019-04-02 23:59:59','RCNETH','4h','0.000198070000000','0.000198050000000','1.325055832729831','1.324922036008194','6689.836081838897','6689.836081838897371','test','test','0.01'),('2019-04-04 23:59:59','2019-04-05 03:59:59','RCNETH','4h','0.000196350000000','0.000195170000000','1.325026100125022','1.317063121779478','6748.2867335117','6748.286733511699822','test','test','0.60'),('2019-04-13 07:59:59','2019-04-14 23:59:59','RCNETH','4h','0.000187440000000','0.000184500000000','1.323256549381568','1.302501244989860','7059.62734411848','7059.627344118480323','test','test','1.56'),('2019-04-15 07:59:59','2019-04-17 23:59:59','RCNETH','4h','0.000185420000000','0.000187050000000','1.318644259516744','1.330236267622732','7111.661414716558','7111.661414716558284','test','test','0.06'),('2019-04-19 19:59:59','2019-04-20 03:59:59','RCNETH','4h','0.000188180000000','0.000185700000000','1.321220261318075','1.303808069543876','7021.045070241655','7021.045070241654685','test','test','1.31'),('2019-04-20 11:59:59','2019-04-20 23:59:59','RCNETH','4h','0.000193870000000','0.000185540000000','1.317350885368253','1.260748353387454','6795.02184643448','6795.021846434479812','test','test','4.29'),('2019-04-21 03:59:59','2019-04-21 11:59:59','RCNETH','4h','0.000187820000000','0.000182640000000','1.304772544928075','1.268787443326928','6946.930811032239','6946.930811032239035','test','test','2.75');
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

-- Dump completed on 2020-04-30 17:30:49
