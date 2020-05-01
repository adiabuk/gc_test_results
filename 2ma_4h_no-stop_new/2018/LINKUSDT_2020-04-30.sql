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
INSERT INTO `trades` VALUES ('2019-07-03 03:59:59','2019-07-09 03:59:59','LINKUSDT','4h','3.735100000000000','3.235300000000000','222.222222222222200','192.486293688403379','59.495655329769534','59.495655329769534','test','test','13.3'),('2019-07-09 07:59:59','2019-07-09 11:59:59','LINKUSDT','4h','3.246900000000000','3.132800000000000','215.614238103595795','208.037292534708456','66.40618377640081','66.406183776400809','test','test','3.51'),('2019-07-12 19:59:59','2019-07-12 23:59:59','LINKUSDT','4h','3.288700000000000','3.166000000000000','213.930472421620863','205.948817370648470','65.05016341460787','65.050163414607866','test','test','3.73'),('2019-07-13 03:59:59','2019-07-13 11:59:59','LINKUSDT','4h','3.213900000000000','3.087900000000000','212.156771299182537','203.839227759029740','66.0122503186728','66.012250318672798','test','test','3.92'),('2019-07-13 15:59:59','2019-07-13 19:59:59','LINKUSDT','4h','3.173900000000000','3.228900000000000','210.308428290259712','213.952829045155653','66.26183190719925','66.261831907199252','test','test','0.0'),('2019-07-13 23:59:59','2019-07-14 03:59:59','LINKUSDT','4h','3.165200000000000','3.139400000000000','211.118295124681026','209.397439566038059','66.6998278543792','66.699827854379194','test','test','0.81'),('2019-07-14 07:59:59','2019-07-14 11:59:59','LINKUSDT','4h','3.149900000000000','2.964700000000000','210.735882778315926','198.345557532897288','66.9024041329299','66.902404132929902','test','test','5.87'),('2019-08-02 19:59:59','2019-08-02 23:59:59','LINKUSDT','4h','2.360500000000000','2.427100000000000','207.982477168222886','213.850569936451478','88.10950102445366','88.109501024453664','test','test','0.0'),('2019-08-03 03:59:59','2019-08-06 11:59:59','LINKUSDT','4h','2.523800000000000','2.400000000000000','209.286497783384789','199.020364006705535','82.92515166946065','82.925151669460647','test','test','4.90'),('2019-08-06 15:59:59','2019-08-06 19:59:59','LINKUSDT','4h','2.386100000000000','2.428000000000000','207.005134721900504','210.640152175002896','86.75459315280186','86.754593152801860','test','test','0.0'),('2019-08-06 23:59:59','2019-08-07 11:59:59','LINKUSDT','4h','2.478500000000000','2.400000000000000','207.812916378145502','201.230986204377331','83.84624425182389','83.846244251823890','test','test','3.16'),('2019-08-07 15:59:59','2019-08-07 19:59:59','LINKUSDT','4h','2.397600000000000','2.370000000000000','206.350265228419204','203.974861774838786','86.06534252102902','86.065342521029024','test','test','1.15'),('2019-08-11 03:59:59','2019-08-11 07:59:59','LINKUSDT','4h','2.374800000000000','2.362500000000000','205.822397794290254','204.756364657659873','86.66936070165498','86.669360701654981','test','test','0.51'),('2019-08-11 11:59:59','2019-08-11 15:59:59','LINKUSDT','4h','2.344000000000000','2.363200000000000','205.585501541705725','207.269478346142904','87.70712523110313','87.707125231103134','test','test','0.0'),('2019-08-11 19:59:59','2019-08-12 19:59:59','LINKUSDT','4h','2.433200000000000','2.359600000000000','205.959718609358447','199.729801097584328','84.64561836649617','84.645618366496166','test','test','3.02'),('2019-08-12 23:59:59','2019-08-13 03:59:59','LINKUSDT','4h','2.390000000000000','2.356000000000000','204.575292495630833','201.665016368077914','85.59635669273256','85.596356692732556','test','test','1.42'),('2019-08-13 19:59:59','2019-08-14 19:59:59','LINKUSDT','4h','2.438900000000000','2.285000000000000','203.928564467285725','191.060219692380969','83.61497579535272','83.614975795352720','test','test','6.31'),('2019-08-15 23:59:59','2019-08-16 03:59:59','LINKUSDT','4h','2.423200000000000','2.369400000000000','201.068932295084693','196.604790434125846','82.9766145159643','82.976614515964300','test','test','2.22'),('2019-08-17 15:59:59','2019-08-17 19:59:59','LINKUSDT','4h','2.398100000000000','2.356000000000000','200.076900770427187','196.564437769536880','83.43142519929411','83.431425199294111','test','test','1.75'),('2019-08-17 23:59:59','2019-08-20 11:59:59','LINKUSDT','4h','2.403600000000000','2.411900000000000','199.296353436895998','199.984554357817217','82.91577360496589','82.915773604965892','test','test','0.53'),('2019-09-18 07:59:59','2019-09-18 15:59:59','LINKUSDT','4h','1.741500000000000','1.779300000000000','199.449286974878504','203.778418785185949','114.5272965689799','114.527296568979907','test','test','2.40'),('2019-09-18 19:59:59','2019-09-24 19:59:59','LINKUSDT','4h','1.736000000000000','1.610200000000000','200.411316266057923','185.888422495165031','115.44430660487208','115.444306604872082','test','test','7.24'),('2019-09-30 19:59:59','2019-10-15 19:59:59','LINKUSDT','4h','1.741000000000000','2.433200000000000','197.184006539192836','275.581921143689840','113.25905028098381','113.259050280983814','test','test','0.0'),('2019-10-17 15:59:59','2019-10-17 23:59:59','LINKUSDT','4h','2.450000000000000','2.412400000000000','214.605765340192164','211.312223798644709','87.5941899347723','87.594189934772302','test','test','1.53'),('2019-10-18 03:59:59','2019-10-18 07:59:59','LINKUSDT','4h','2.475600000000000','2.380600000000000','213.873867219848279','205.666556916937623','86.39274003063834','86.392740030638336','test','test','3.83'),('2019-10-18 11:59:59','2019-10-18 15:59:59','LINKUSDT','4h','2.418100000000000','2.380200000000000','212.050020485868146','208.726462412829648','87.69282514613464','87.692825146134638','test','test','1.56'),('2019-10-20 19:59:59','2019-10-23 15:59:59','LINKUSDT','4h','2.434800000000000','2.503500000000000','211.311452025192921','217.273788461093460','86.78801216740304','86.788012167403039','test','test','0.0'),('2019-10-23 19:59:59','2019-10-29 19:59:59','LINKUSDT','4h','2.601600000000000','2.672800000000000','212.636415677615247','218.455800977525399','81.73293960547942','81.732939605479416','test','test','0.0'),('2019-10-29 23:59:59','2019-10-30 03:59:59','LINKUSDT','4h','2.662000000000000','2.622500000000000','213.929612410928627','210.755224848858120','80.36424207773427','80.364242077734275','test','test','1.48'),('2019-10-31 19:59:59','2019-11-03 11:59:59','LINKUSDT','4h','2.719200000000000','2.659900000000000','213.224192952690714','208.574224343506216','78.41431044156029','78.414310441560289','test','test','2.36'),('2019-11-03 15:59:59','2019-11-03 19:59:59','LINKUSDT','4h','2.670000000000000','2.641000000000000','212.190866595094150','209.886171789379659','79.47223467981054','79.472234679810541','test','test','1.08'),('2019-11-03 23:59:59','2019-11-04 03:59:59','LINKUSDT','4h','2.660500000000000','2.640400000000000','211.678712193824282','210.079485689371808','79.56350768420383','79.563507684203827','test','test','0.75'),('2019-11-04 11:59:59','2019-11-05 03:59:59','LINKUSDT','4h','2.669900000000000','2.660600000000000','211.323328526168211','210.587230936260937','79.15027848465044','79.150278484650443','test','test','0.34'),('2019-11-05 11:59:59','2019-11-06 03:59:59','LINKUSDT','4h','2.667500000000000','2.657700000000000','211.159751283966557','210.383981626016094','79.16016917861914','79.160169178619142','test','test','0.36'),('2019-11-06 07:59:59','2019-11-06 11:59:59','LINKUSDT','4h','2.679800000000000','2.663500000000000','210.987358026644273','209.704018249110732','78.73250168917242','78.732501689172423','test','test','0.60'),('2019-11-06 15:59:59','2019-11-06 19:59:59','LINKUSDT','4h','2.677500000000000','2.699200000000000','210.702171409414603','212.409822994693485','78.69362144142468','78.693621441424682','test','test','0.0'),('2019-11-06 23:59:59','2019-11-07 07:59:59','LINKUSDT','4h','2.744800000000000','2.682400000000000','211.081649539476558','206.282941097599775','76.90237887623016','76.902378876230159','test','test','2.40'),('2019-11-07 11:59:59','2019-11-07 15:59:59','LINKUSDT','4h','2.670000000000000','2.679800000000000','210.015269885726156','210.786112449351691','78.65740445158283','78.657404451582835','test','test','0.0'),('2019-11-07 19:59:59','2019-11-07 23:59:59','LINKUSDT','4h','2.687100000000000','2.675700000000000','210.186568233198500','209.294853418767133','78.22059775713538','78.220597757135380','test','test','0.42'),('2019-11-08 03:59:59','2019-11-08 11:59:59','LINKUSDT','4h','2.716300000000000','2.677800000000000','209.988409385547101','207.012098314846668','77.30678105715388','77.306781057153884','test','test','1.41'),('2019-11-08 23:59:59','2019-11-11 07:59:59','LINKUSDT','4h','2.710000000000000','2.729600000000000','209.327006925391430','210.840958709796467','77.24243797984924','77.242437979849242','test','test','0.0'),('2019-11-11 11:59:59','2019-11-11 15:59:59','LINKUSDT','4h','2.704300000000000','2.719000000000000','209.663440655259222','210.803126554616625','77.52965301751256','77.529653017512558','test','test','0.0'),('2019-11-11 19:59:59','2019-11-15 15:59:59','LINKUSDT','4h','2.737800000000000','2.929900000000000','209.916704188449756','224.645683249959433','76.67349849822841','76.673498498228412','test','test','0.09'),('2019-11-15 19:59:59','2019-11-18 11:59:59','LINKUSDT','4h','2.939900000000000','2.866600000000000','213.189810646563018','207.874387291893441','72.51600756711555','72.516007567115551','test','test','2.49'),('2019-12-10 03:59:59','2019-12-11 23:59:59','LINKUSDT','4h','2.171400000000000','2.178600000000000','212.008605456636445','212.711590608744615','97.6368266816968','97.636826681696803','test','test','0.93'),('2019-12-27 15:59:59','2019-12-27 19:59:59','LINKUSDT','4h','1.925800000000000','1.889000000000000','212.164824379327143','208.110579111303849','110.16970837019792','110.169708370197924','test','test','1.91'),('2019-12-29 23:59:59','2019-12-30 03:59:59','LINKUSDT','4h','1.897600000000000','1.874300000000000','211.263880986433065','208.669841975585740','111.33214638829736','111.332146388297360','test','test','1.22'),('2019-12-30 07:59:59','2019-12-30 11:59:59','LINKUSDT','4h','1.890400000000000','1.873700000000000','210.687427872911456','208.826192131545810','111.451241997943','111.451241997943001','test','test','0.88'),('2020-01-06 11:59:59','2020-01-23 07:59:59','LINKUSDT','4h','1.896400000000000','2.529300000000000','210.273819930385770','280.450101639909690','110.8805209504249','110.880520950424895','test','test','0.99'),('2020-01-24 15:59:59','2020-01-24 19:59:59','LINKUSDT','4h','2.519200000000000','2.519900000000000','225.868549199168825','225.931310387021881','89.65883979007971','89.658839790079710','test','test','0.0'),('2020-01-24 23:59:59','2020-01-25 03:59:59','LINKUSDT','4h','2.502400000000000','2.439800000000000','225.882496129802831','220.231823072847220','90.26634276286877','90.266342762868774','test','test','2.50'),('2020-01-26 15:59:59','2020-02-04 07:59:59','LINKUSDT','4h','2.507300000000000','2.741100000000000','224.626791006034949','245.572726369657545','89.58911618315916','89.589116183159163','test','test','0.0'),('2020-02-04 11:59:59','2020-02-04 15:59:59','LINKUSDT','4h','2.710700000000000','2.737300000000000','229.281443309062183','231.531373729994414','84.5838504109869','84.583850410986898','test','test','0.0'),('2020-02-04 19:59:59','2020-02-04 23:59:59','LINKUSDT','4h','2.712200000000000','2.739500000000000','229.781427847047127','232.094322537786866','84.72141724321477','84.721417243214773','test','test','0.0'),('2020-02-05 03:59:59','2020-02-16 15:59:59','LINKUSDT','4h','2.752000000000000','4.496100000000000','230.295404444989316','376.246790670463895','83.68292312681298','83.682923126812980','test','test',NULL);
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

-- Dump completed on 2020-04-30 20:14:56
