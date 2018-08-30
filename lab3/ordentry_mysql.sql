-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: orderdb
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustNo` char(8) NOT NULL,
  `CustFirstName` varchar(20) NOT NULL,
  `CustLastName` varchar(30) NOT NULL,
  `CustStreet` varchar(50) DEFAULT NULL,
  `CustCity` varchar(30) DEFAULT NULL,
  `CustState` char(2) DEFAULT NULL,
  `CustZip` char(10) DEFAULT NULL,
  `CustBal` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`CustNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C0954327','Sheri','Gordon','336 Hill St.','Littleton','CO','80129-5543',230.00),('C1010398','Jim','Glussman','1432 E. Ravenna','Denver','CO','80111-0033',200.00),('C2388597','Beth','Taylor','2396 Rafter Rd','Seattle','WA','98103-1121',500.00),('C3340959','Betty','Wise','4334 153rd NW','Seattle','WA','98178-3311',200.00),('C3499503','Bob','Mann','1190 Lorraine Cir.','Monroe','WA','98013-1095',0.00),('C8543321','Ron','Thompson','789 122nd St.','Renton','WA','98666-1289',85.00),('C8574932','Wally','Jones','411 Webber Ave.','Seattle','WA','98105-1093',1500.00),('C8654390','Candy','Kendall','456 Pine St.','Seattle','WA','98105-3345',50.00),('C9128574','Jerry','Wyatt','16212 123rd Ct.','Denver','CO','80222-0022',100.00),('C9403348','Mike','Boren','642 Crest Ave.','Englewood','CO','80113-5431',0.00),('C9432910','Larry','Styles','9825 S. Crest Lane','Bellevue','WA','98104-2211',250.00),('C9543029','Sharon','Johnson','1223 Meyer Way','Fife','WA','98222-1123',856.00),('C9549302','Todd','Hayes','1400 NW 88th','Lynnwood','WA','98036-2244',0.00),('C9857432','Homer','Wells','123 Main St.','Seattle','WA','98105-4322',500.00),('C9865874','Mary','Hill','206 McCaffrey','Littleton','CO','80129-5543',150.00),('C9943201','Harry','Sanders','1280 S. Hill Rd.','Fife','WA','98222-2258',1000.00);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EmpNo` char(8) NOT NULL,
  `EmpFirstName` varchar(20) NOT NULL,
  `EmpLastName` varchar(30) NOT NULL,
  `EmpPhone` char(15) DEFAULT NULL,
  `EmpEMail` varchar(50) NOT NULL,
  `SupEmpNo` char(8) DEFAULT NULL,
  `EmpCommRate` decimal(3,3) DEFAULT NULL,
  PRIMARY KEY (`EmpNo`),
  UNIQUE KEY `UniqueEMail` (`EmpEMail`),
  KEY `FKSupEmpNo` (`SupEmpNo`),
  CONSTRAINT `FKSupEmpNo` FOREIGN KEY (`SupEmpNo`) REFERENCES `employee` (`EmpNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E1329594','Landi','Santos','(303) 789-1234','LSantos@bigco.com','E8843211',0.020),('E8544399','Joe','Jenkins','(303) 221-9875','JJenkins@bigco.com','E8843211',0.020),('E8843211','Amy','Tang','(303) 556-4321','ATang@bigco.com','E9884325',0.040),('E9345771','Colin','White','(303) 221-4453','CWhite@bigco.com','E9884325',0.040),('E9884325','Thomas','Johnson','(303) 556-9987','TJohnson@bigco.com',NULL,0.050),('E9954302','Mary','Hill','(303) 556-9871','MHill@bigco.com','E8843211',0.020),('E9973110','Theresa','Beck','(720) 320-2234','TBeck@bigco.com','E9884325',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertbl`
--

DROP TABLE IF EXISTS `ordertbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordertbl` (
  `OrdNo` char(8) NOT NULL,
  `OrdDate` date NOT NULL,
  `CustNo` char(8) NOT NULL,
  `EmpNo` char(8) DEFAULT NULL,
  `OrdName` varchar(50) DEFAULT NULL,
  `OrdStreet` varchar(50) DEFAULT NULL,
  `OrdCity` varchar(30) DEFAULT NULL,
  `OrdState` char(2) DEFAULT NULL,
  `OrdZip` char(10) DEFAULT NULL,
  PRIMARY KEY (`OrdNo`),
  KEY `FK_Cust` (`CustNo`),
  KEY `FK_Emp` (`EmpNo`),
  CONSTRAINT `FK_Cust` FOREIGN KEY (`CustNo`) REFERENCES `customer` (`CustNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Emp` FOREIGN KEY (`EmpNo`) REFERENCES `employee` (`EmpNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertbl`
--

LOCK TABLES `ordertbl` WRITE;
/*!40000 ALTER TABLE `ordertbl` DISABLE KEYS */;
INSERT INTO `ordertbl` VALUES ('O1116324','2015-01-23','C0954327','E8544399','Sheri Gordon','336 Hill St.','Littleton','CO','80129-5543'),('O1231231','2015-01-23','C9432910','E9954302','Larry Styles','9825 S. Crest Lane','Bellevue','WA','98104-2211'),('O1241518','2015-02-10','C9549302',NULL,'Todd Hayes','1400 NW 88th','Lynnwood','WA','98036-2244'),('O1455122','2015-01-09','C8574932','E9345771','Wally Jones','411 Webber Ave.','Seattle','WA','98105-1093'),('O1579999','2015-01-05','C9543029','E8544399','Tom Johnson','1632 Ocean Dr.','Des Moines','WA','98222-1123'),('O1615141','2015-01-23','C8654390','E8544399','Candy Kendall','456 Pine St.','Seattle','WA','98105-3345'),('O1656777','2015-02-11','C8543321',NULL,'Ron Thompson','789 122nd St.','Renton','WA','98666-1289'),('O2233457','2015-01-12','C2388597','E9884325','Beth Taylor','2396 Rafter Rd','Seattle','WA','98103-1121'),('O2334661','2015-01-14','C0954327','E1329594','Mrs. Ruth Gordon','233 S. 166th','Seattle','WA','98011'),('O3252629','2015-01-23','C9403348','E9954302','Mike Boren','642 Crest Ave.','Englewood','CO','80113-5431'),('O3331222','2015-01-13','C1010398',NULL,'Jim Glussman','1432 E. Ravenna','Denver','CO','80111-0033'),('O3377543','2015-01-15','C9128574','E8843211','Jerry Wyatt','16212 123rd Ct.','Denver','CO','80222-0022'),('O4714645','2015-01-11','C2388597','E1329594','Beth Taylor','2396 Rafter Rd','Seattle','WA','98103-1121'),('O5511365','2015-01-22','C3340959','E9884325','Betty White','4334 153rd NW','Seattle','WA','98178-3311'),('O6565656','2015-01-20','C9865874','E8843211','Mr. Jack Sibley','166 E. 344th','Renton','WA','98006-5543'),('O7847172','2015-01-23','C9943201',NULL,'Harry Sanders','1280 S. Hill Rd.','Fife','WA','98222-2258'),('O7959898','2015-02-19','C8543321','E8544399','Ron Thompson','789 122nd St.','Renton','WA','98666-1289'),('O7989497','2015-01-16','C3499503','E9345771','Bob Mann','1190 Lorraine Cir.','Monroe','WA','98013-1095'),('O8979495','2015-01-23','C9865874',NULL,'HelenSibley','206 McCaffrey','Renton','WA','98006-5543'),('O9919699','2015-02-11','C9857432','E9954302','Homer Wells','123 Main St.','Seattle','WA','98105-4322');
/*!40000 ALTER TABLE `ordertbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordline`
--

DROP TABLE IF EXISTS `ordline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordline` (
  `OrdNo` char(8) NOT NULL,
  `ProdNo` char(8) NOT NULL,
  `Qty` int(11) DEFAULT '1',
  PRIMARY KEY (`OrdNo`,`ProdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordline`
--

LOCK TABLES `ordline` WRITE;
/*!40000 ALTER TABLE `ordline` DISABLE KEYS */;
INSERT INTO `ordline` VALUES ('O1116324','P1445671',1),('O1231231','P0036566',1),('O1231231','P1445671',1),('O1241518','P0036577',1),('O1455122','P4200344',1),('O1579999','P1556678',1),('O1579999','P6677900',1),('O1579999','P9995676',1),('O1615141','P0036566',1),('O1615141','P1445671',1),('O1615141','P4200344',1),('O1656777','P1445671',1),('O1656777','P1556678',1),('O2233457','P0036577',1),('O2233457','P1445671',1),('O2334661','P0036566',1),('O2334661','P1412138',1),('O2334661','P1556678',1),('O3252629','P4200344',1),('O3252629','P9995676',1),('O3331222','P1412138',1),('O3331222','P1556678',1),('O3331222','P3455443',1),('O3377543','P1445671',1),('O3377543','P9995676',1),('O4714645','P0036566',1),('O4714645','P9995676',1),('O5511365','P1412138',1),('O5511365','P1445671',1),('O5511365','P1556678',1),('O5511365','P3455443',1),('O5511365','P6677900',1),('O6565656','P0036566',10),('O7847172','P1556678',1),('O7847172','P6677900',1),('O7959898','P1412138',5),('O7959898','P1556678',5),('O7959898','P3455443',5),('O7959898','P6677900',5),('O7989497','P1114590',2),('O7989497','P1412138',2),('O7989497','P1445671',3),('O8979495','P1114590',1),('O8979495','P1412138',1),('O8979495','P1445671',1),('O9919699','P0036577',1),('O9919699','P1114590',1),('O9919699','P4200344',1);
/*!40000 ALTER TABLE `ordline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProdNo` char(8) NOT NULL,
  `ProdName` varchar(50) NOT NULL,
  `ProdMfg` varchar(20) NOT NULL,
  `ProdQOH` int(11) DEFAULT NULL,
  `ProdPrice` decimal(12,2) DEFAULT NULL,
  `ProdNextShipDate` date DEFAULT NULL,
  PRIMARY KEY (`ProdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('P0036566','17 inch Color Monitor','ColorMeg, Inc.',12,169.00,'2015-02-20'),('P0036577','19 inch Color Monitor','ColorMeg, Inc.',10,319.00,'2015-02-20'),('P1114590','R3000 Color Laser Printer','Connex',5,699.00,'2015-01-22'),('P1412138','10 Foot Printer Cable','Ethlite',100,12.00,NULL),('P1445671','8-Outlet Surge Protector','Intersafe',33,14.99,NULL),('P1556678','CVP Ink Jet Color Printer','Connex',8,99.00,'2015-01-22'),('P3455443','Color Ink Jet Cartridge','Connex',24,38.00,'2015-01-22'),('P4200344','36-Bit Color Scanner','UV Components',16,199.99,'2015-01-29'),('P6677900','Black Ink Jet Cartridge','Connex',44,25.69,NULL),('P9995676','Battery Back-up System','Cybercx',12,89.00,'2015-02-01');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-06 22:17:55
