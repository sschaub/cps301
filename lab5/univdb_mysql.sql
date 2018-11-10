CREATE DATABASE  IF NOT EXISTS `univ` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `univ`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: dbo
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `ClubNo` varchar(12) NOT NULL,
  `CName` varchar(100) DEFAULT NULL,
  `CPurpose` varchar(20) DEFAULT NULL,
  `CBudget` decimal(19,4) DEFAULT '0.0000',
  `CActual` decimal(19,4) DEFAULT '0.0000',
  PRIMARY KEY (`ClubNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('C1','DELTA','SOCIAL',1000.0000,1200.0000),('C2','BITS','ACADEMIC',500.0000,350.0000),('C3','HELPS','SERVICE',300.0000,330.0000),('C4','SIGMA','SOCIAL',150.0000,150.0000),('C5','Writer\'s Club','ACADEMIC',500.0000,800.0000);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `CourseNo` varchar(12) NOT NULL,
  `CrsDesc` varchar(100) DEFAULT NULL,
  `CrsUnits` smallint(6) DEFAULT '4',
  PRIMARY KEY (`CourseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CPS301',NULL,NULL),('FIN300','FUNDAMENTALS OF FINANCE',3),('FIN450','PRINCIPLES OF INVESTMENTS',3),('FIN480','CORPORATE FINANCE',3),('IS320','FUNDAMENTALS OF BUSINESS PROGRAMMING',3),('IS460','SYSTEMS ANALYSIS',4),('IS470','BUSINESS DATA COMMUNICATIONS',4),('IS480','FUNDAMENTALS OF DATABASE MANAGEMENT',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `OfferNo` smallint(6) NOT NULL DEFAULT '0',
  `StdNo` varchar(18) NOT NULL,
  `EnrGrade` decimal(8,4) DEFAULT '0.0000',
  PRIMARY KEY (`OfferNo`,`StdNo`),
  KEY `Enrollment_FK00` (`StdNo`),
  CONSTRAINT `Enrollment_FK00` FOREIGN KEY (`StdNo`) REFERENCES `student` (`StdNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Enrollment_FK01` FOREIGN KEY (`OfferNo`) REFERENCES `offering` (`OfferNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1234,'123456789',3.3000),(1234,'234567890',3.5000),(1234,'345678901',3.2000),(1234,'456789012',3.1000),(1234,'567890123',3.8000),(1234,'678901234',3.4000),(4321,'123456789',3.5000),(4321,'124567890',3.2000),(4321,'789012345',3.5000),(4321,'876543210',3.1000),(4321,'890123456',3.4000),(4321,'901234567',3.1000),(5555,'123456789',3.2000),(5555,'124567890',2.7000),(5678,'123456789',3.2000),(5678,'234567890',2.8000),(5678,'345678901',3.3000),(5678,'456789012',3.4000),(5678,'567890123',2.6000),(5679,'123456789',2.0000),(5679,'124567890',3.7000),(5679,'678901234',3.3000),(5679,'789012345',3.8000),(5679,'890123456',2.9000),(5679,'901234567',3.1000),(6666,'234567890',3.1000),(6666,'567890123',3.6000),(7777,'876543210',3.4000),(7777,'890123456',3.7000),(7777,'901234567',3.4000),(9876,'124567890',3.5000),(9876,'234567890',3.2000),(9876,'345678901',3.2000),(9876,'456789012',3.4000),(9876,'567890123',2.6000),(9876,'678901234',3.3000),(9876,'901234567',4.0000);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `FacNo` varchar(18) NOT NULL,
  `FacFirstName` varchar(60) DEFAULT NULL,
  `FacLastName` varchar(100) DEFAULT NULL,
  `FacCity` varchar(100) DEFAULT 'SEATTLE',
  `FacState` varchar(4) DEFAULT 'WA',
  `FacDept` varchar(12) DEFAULT 'MS',
  `FacRank` varchar(12) DEFAULT NULL,
  `FacSalary` float(24,0) DEFAULT '0',
  `FacSupervisor` varchar(18) DEFAULT NULL,
  `FacHireDate` datetime DEFAULT NULL,
  `FacZipCode` varchar(18) DEFAULT NULL,
  `Suffix` char(20) DEFAULT NULL,
  PRIMARY KEY (`FacNo`),
  KEY `Faculty_FK00` (`FacSupervisor`),
  CONSTRAINT `Faculty_FK00` FOREIGN KEY (`FacSupervisor`) REFERENCES `faculty` (`FacNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('098765432','LEONARD','VINCE','SEATTLE','WB','FIN','ASST',35000,'654321098','2012-04-10 00:00:00','981119921','III'),('543210987','VICTORIA','EMMANUEL','BOTHELL','WA','MS','PROF',120000,NULL,'1996-04-15 00:00:00','980112242','Jr'),('654321098','LEONARD','FIBON','SEATTLE','WA','MS','ASSC',70000,'543210987','1994-05-01 00:00:00','981210094',NULL),('765432109','NICKI','MACON','BELLEVUE','WA','FIN','PROF',65000,NULL,'1997-04-11 00:00:00','980159945',NULL),('876543210','CRIS','COLANY','SEATTLE','WA','MS','ASST',40000,'654321098','1999-03-01 00:00:00','981141332',NULL),('987654321','JULIA','MILLS','SEATTLE','WA','FIN','ASSC',75000,'765432109','2000-03-15 00:00:00','981149954','Esq');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offering`
--

DROP TABLE IF EXISTS `offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offering` (
  `OfferNo` smallint(6) NOT NULL DEFAULT '0',
  `CourseNo` varchar(12) NOT NULL,
  `OffTerm` varchar(12) DEFAULT NULL,
  `OffYear` smallint(6) DEFAULT '0',
  `OffLocation` varchar(40) DEFAULT NULL,
  `OffTime` datetime DEFAULT NULL,
  `FacNo` varchar(18) DEFAULT NULL,
  `OffDays` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`OfferNo`),
  KEY `Offering_FK00` (`FacNo`),
  CONSTRAINT `Offering_FK00` FOREIGN KEY (`FacNo`) REFERENCES `faculty` (`FacNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offering`
--

LOCK TABLES `offering` WRITE;
/*!40000 ALTER TABLE `offering` DISABLE KEYS */;
INSERT INTO `offering` VALUES (1111,'IS320','SUMMER',2006,'BLM302','1899-12-30 10:30:00',NULL,'MW'),(1234,'IS320','FALL',2005,'BLM302','1899-12-30 10:30:00','098765432','MW'),(2222,'IS460','SUMMER',2005,'BLM412','1899-12-30 13:30:00',NULL,'TTH'),(3333,'IS320','SPRING',2006,'BLM214','1899-12-30 08:30:00','098765432','MW'),(4321,'IS320','FALL',2005,'BLM214','1899-12-30 15:30:00','098765432','TTH'),(4444,'IS320','WINTER',2006,'BLM302','1899-12-30 15:30:00','543210987','TTH'),(5555,'FIN300','WINTER',2006,'BLM207','1899-12-30 08:30:00','765432109','MW'),(5678,'IS480','WINTER',2006,'BLM302','1899-12-30 10:30:00','987654321','MW'),(5679,'IS480','SPRING',2006,'BLM412','1899-12-30 15:30:00','876543210','TTH'),(6666,'FIN450','WINTER',2006,'BLM212','1899-12-30 10:30:00','987654321','TTH'),(7777,'FIN480','SPRING',2006,'BLM305','1899-12-30 13:30:00','765432109','MW'),(8888,'IS320','SUMMER',2006,'BLM405','1899-12-30 13:30:00','654321098','MW'),(9876,'IS460','SPRING',2006,'BLM307','1899-12-30 13:30:00','654321098','TTH');
/*!40000 ALTER TABLE `offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stdclub`
--

DROP TABLE IF EXISTS `stdclub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stdclub` (
  `StdNo` varchar(12) NOT NULL,
  `ClubNo` varchar(12) NOT NULL,
  PRIMARY KEY (`StdNo`,`ClubNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stdclub`
--

LOCK TABLES `stdclub` WRITE;
/*!40000 ALTER TABLE `stdclub` DISABLE KEYS */;
INSERT INTO `stdclub` VALUES ('S1','C1'),('S1','C2'),('S1','C3'),('S1','C4'),('S2','C1'),('S2','C4'),('S3','C3');
/*!40000 ALTER TABLE `stdclub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `StdNo` varchar(18) NOT NULL,
  `StdFirstName` varchar(60) DEFAULT NULL,
  `StdLastName` varchar(100) DEFAULT NULL,
  `StdCity` varchar(100) DEFAULT 'SEATTLE',
  `StdState` varchar(4) DEFAULT 'WA',
  `StdMajor` varchar(20) DEFAULT NULL,
  `StdClass` varchar(12) DEFAULT 'FR',
  `StdGPA` float(24,0) DEFAULT '0',
  `StdZip` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`StdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('123456789','HOMER','WELLS','SEATTLE','WA','IS','SR',3,'981211111'),('124567890','BOBBY','NORBERT','BOTHELL','WA','FIN','JR',3,'980112121'),('234567890','CANDY','KENDALL','TACOMA','WA','ACCT','JR',3,'990423321'),('345678901','WALLY','KENDALL','SEATTLE','WA','IS','SR',3,'981231141'),('456789012','JOE','ESTRADA','SEATTLE','WA','FIN','SR',3,'981212333'),('567890123','MARIAH','DODGE','SEATTLE','WA','IS','JR',4,'981140021'),('678901234','TESS','DODGE','REDMOND','WA','ACCT','SO',3,'981162344'),('789012345','ROBERTO','MORALES','SEATTLE','WA','FIN','JR',2,'981212212'),('876543210','CRISTOPHER','COLAN','SEATTLE','WA','IS','SR',4,'981141332'),('890123456','LUKE','BRAZZI','SEATTLE','WA','IS','SR',2,'981160021'),('901234567','WILLIAM','PILGRIM','BOTHELL','WA','IS','SO',4,'981131885');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-06 19:52:54
