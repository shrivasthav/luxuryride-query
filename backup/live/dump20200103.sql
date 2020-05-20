CREATE DATABASE  IF NOT EXISTS `luxury_ride_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `luxury_ride_db`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 3.6.35.88    Database: luxury_ride_db
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `budget_master_tbl`
--

DROP TABLE IF EXISTS `budget_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget_master_tbl` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `budget` varchar(100) NOT NULL,
  `from` double(10,2) DEFAULT NULL,
  `to` double(10,2) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`budget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget_master_tbl`
--

LOCK TABLES `budget_master_tbl` WRITE;
/*!40000 ALTER TABLE `budget_master_tbl` DISABLE KEYS */;
INSERT INTO `budget_master_tbl` VALUES (1,'10L - 15L',1000000.00,1500000.00,'Y','2019-01-29 10:02:58','2019-01-29 10:02:58'),(2,'15L - 20L',1500000.00,2000000.00,'Y','2019-01-29 10:02:58','2019-01-29 10:02:58'),(3,'20L - 30L',2000000.00,3000000.00,'Y','2019-01-29 10:02:58','2019-01-29 10:02:58'),(4,'30L - 50L',3000000.00,5000000.00,'Y','2019-01-29 10:02:58','2019-01-29 10:02:58'),(5,'50L - 75L',5000000.00,7500000.00,'Y','2019-01-29 10:02:58','2019-01-29 10:02:58'),(6,'75L - 100L',7500000.00,10000000.00,'Y','2019-01-29 10:02:58','2019-01-29 10:02:58'),(7,'1C above',10000000.00,50000000.00,'Y','2019-01-29 10:02:58','2019-01-29 10:02:58');
/*!40000 ALTER TABLE `budget_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_model_master_tbl`
--

DROP TABLE IF EXISTS `car_model_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_model_master_tbl` (
  `car_id` int(20) NOT NULL AUTO_INCREMENT,
  `car_make` varchar(50) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_model_master_tbl`
--

LOCK TABLES `car_model_master_tbl` WRITE;
/*!40000 ALTER TABLE `car_model_master_tbl` DISABLE KEYS */;
INSERT INTO `car_model_master_tbl` VALUES (1,'AUDI','Y','2019-10-04 13:34:48'),(2,'BENTLEY','Y','2019-10-04 13:34:48'),(3,'BMW','Y','2019-10-04 13:34:49'),(4,'DC','Y','2019-10-04 13:34:50'),(5,'FIAT','Y','2019-10-04 13:34:50'),(6,'FORD','Y','2019-10-04 13:34:51'),(7,'HYUNDAI','Y','2019-10-04 13:34:51'),(8,'JAGUAR','Y','2019-10-04 13:34:52'),(9,'LAND ROVER','Y','2019-10-04 13:34:53'),(10,'MAHINDRA','Y','2019-10-04 13:34:53'),(11,'MARITI SUZUKI','Y','2019-10-04 13:34:54'),(12,'MERCEDES BENZ','Y','2019-10-04 13:34:54'),(13,'MINI','Y','2019-10-04 13:34:55'),(14,'MITSUBISHI','Y','2019-10-04 13:34:55'),(15,'NISSAN','Y','2019-10-07 04:31:40'),(16,'PORSCHE','Y','2019-11-25 11:29:18'),(17,'RENAULT','Y','2019-11-25 11:29:18'),(18,'SKODA','Y','2019-11-25 11:29:18'),(19,'TOYOTA','Y','2019-11-25 11:29:19'),(20,'VOLVO','Y','2019-11-25 11:29:19'),(21,'OTHER','N','2019-11-25 11:29:19');
/*!40000 ALTER TABLE `car_model_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_master_tbl`
--

DROP TABLE IF EXISTS `city_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_master_tbl` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(120) NOT NULL,
  `state_id` int(10) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_master_tbl`
--

LOCK TABLES `city_master_tbl` WRITE;
/*!40000 ALTER TABLE `city_master_tbl` DISABLE KEYS */;
INSERT INTO `city_master_tbl` VALUES (1,'NEW DELHI',NULL,'Y','2018-12-04 06:18:24','2019-12-05 05:22:23'),(2,'GURGAON',NULL,'Y','2019-01-25 10:27:58','2019-12-05 05:22:23'),(3,'JAIPUR',NULL,'Y','2019-01-25 10:27:58','2019-12-05 05:22:24'),(4,'JALINDER',NULL,'Y','2019-01-25 10:27:58','2019-12-05 05:22:24'),(5,'LUDHIANA',NULL,'Y','2019-01-25 10:27:58','2019-12-05 05:22:24'),(6,'KOTA ',NULL,'Y','2019-09-18 09:53:26','2019-12-05 05:22:24'),(7,'KUNDALI',NULL,'Y','2019-10-04 13:08:22','2019-12-05 05:22:24'),(8,'DELHI',NULL,'Y','2019-12-05 05:22:23','2019-12-05 05:22:23'),(9,'DWARKA',NULL,'Y','2019-12-05 05:22:23','2019-12-05 05:22:23'),(10,'INDORE',NULL,'Y','2019-12-05 05:22:23','2019-12-05 05:22:23'),(11,'MAHARASHTRA',NULL,'Y','2019-12-05 05:22:24','2019-12-05 05:22:24'),(12,'MUMBAI',NULL,'Y','2019-12-05 05:22:24','2019-12-05 05:22:24'),(13,'NOIDA',NULL,'Y','2019-12-05 05:22:24','2019-12-05 05:22:24'),(14,'PUNJAB',NULL,'Y','2019-12-05 05:22:24','2019-12-05 05:22:24'),(15,'REWARI',NULL,'Y','2019-12-05 05:22:24','2019-12-05 05:22:24'),(16,'SONIPAT',NULL,'Y','2019-12-05 05:22:24','2019-12-05 05:22:24'),(17,'CHANDIGARH',NULL,'Y','2019-12-09 13:58:47','2019-12-09 13:58:47'),(18,'DEHRADUN',NULL,'Y','2019-12-09 13:59:53','2019-12-09 13:59:53'),(19,'GOA',NULL,'Y','2019-12-09 14:00:44','2019-12-09 14:00:44'),(20,'GORAKHPUR',NULL,'Y','2019-12-09 14:01:09','2019-12-09 14:01:09'),(21,'GUJRAT',NULL,'Y','2019-12-09 14:01:42','2019-12-09 14:01:42'),(22,'HARIDWAR',NULL,'Y','2019-12-09 14:02:21','2019-12-09 14:02:21'),(23,'KARNAL',NULL,'Y','2019-12-09 14:02:58','2019-12-09 14:02:58'),(24,'KOLKATA',NULL,'Y','2019-12-09 14:03:23','2019-12-09 14:03:23'),(25,'MATHURA',NULL,'Y','2019-12-09 14:04:01','2019-12-09 14:04:01'),(26,'PUNE',NULL,'Y','2019-12-09 14:04:53','2019-12-09 14:04:53'),(27,'FARIDABAD',NULL,'Y','2019-12-11 11:26:23','2019-12-11 11:26:23'),(28,'HARIYANA',NULL,'Y','2020-01-01 08:59:43','2020-01-01 08:59:43');
/*!40000 ALTER TABLE `city_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_planning_master_tbl`
--

DROP TABLE IF EXISTS `customer_planning_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_planning_master_tbl` (
  `planning_id` int(10) NOT NULL AUTO_INCREMENT,
  `planning_name` varchar(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`planning_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_planning_master_tbl`
--

LOCK TABLES `customer_planning_master_tbl` WRITE;
/*!40000 ALTER TABLE `customer_planning_master_tbl` DISABLE KEYS */;
INSERT INTO `customer_planning_master_tbl` VALUES (1,'In A Month','Y','2019-11-18 13:24:32'),(2,'Within A Week','Y','2019-11-18 13:24:32'),(3,'Within Two Weeks','Y','2019-11-18 13:24:32'),(4,'May Be Later','Y','2019-11-18 13:24:32');
/*!40000 ALTER TABLE `customer_planning_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_status_tbl`
--

DROP TABLE IF EXISTS `customer_status_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_status_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_status_tbl`
--

LOCK TABLES `customer_status_tbl` WRITE;
/*!40000 ALTER TABLE `customer_status_tbl` DISABLE KEYS */;
INSERT INTO `customer_status_tbl` VALUES (1,'Just Visited','Y','2019-01-23 13:11:39','2019-01-30 07:27:32'),(2,'Followup','Y','2019-01-23 13:11:39','2019-01-23 13:11:39'),(3,'Enquired','Y','2019-01-29 09:45:46','2019-01-29 09:45:46'),(4,'Drop','Y','2019-01-29 09:45:46','2019-01-31 08:45:41');
/*!40000 ALTER TABLE `customer_status_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_status_update_tbl`
--

DROP TABLE IF EXISTS `customer_status_update_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_status_update_tbl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `customer_status` int(10) DEFAULT '1',
  `followup_date` varchar(50) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `added_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_status_update_tbl_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `sales_lead_master_tbl` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_status_update_tbl`
--

LOCK TABLES `customer_status_update_tbl` WRITE;
/*!40000 ALTER TABLE `customer_status_update_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_status_update_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_tbl`
--

DROP TABLE IF EXISTS `documents_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_tbl` (
  `document_id` int(12) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_tbl`
--

LOCK TABLES `documents_tbl` WRITE;
/*!40000 ALTER TABLE `documents_tbl` DISABLE KEYS */;
INSERT INTO `documents_tbl` VALUES (1,'Aadhar Card','Y','2018-11-29 09:27:06','2018-11-29 09:27:06'),(2,'Driving Licence','Y','2018-11-29 09:27:06','2018-11-29 09:27:06'),(3,'Pan Card','Y','2018-11-29 09:27:06','2018-11-29 09:27:06'),(4,'Bank Passbook','Y','2018-11-29 09:27:06','2018-11-29 09:27:06');
/*!40000 ALTER TABLE `documents_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dummy_puchase_lead_tbl`
--

DROP TABLE IF EXISTS `dummy_puchase_lead_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dummy_puchase_lead_tbl` (
  `lead_id` int(20) NOT NULL AUTO_INCREMENT,
  `lead_name` varchar(50) DEFAULT NULL,
  `phone_no` varchar(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `expected_price` varchar(10) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `colour` varchar(50) DEFAULT NULL,
  `km_drivern` int(50) DEFAULT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `no_of_ownwers` varchar(20) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `remarks` text,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dummy_puchase_lead_tbl`
--

LOCK TABLES `dummy_puchase_lead_tbl` WRITE;
/*!40000 ALTER TABLE `dummy_puchase_lead_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `dummy_puchase_lead_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_details_tbl`
--

DROP TABLE IF EXISTS `employee_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_details_tbl` (
  `emp_details_id` int(12) NOT NULL AUTO_INCREMENT,
  `employee_id` int(12) DEFAULT NULL,
  `date_of_join` varchar(25) DEFAULT NULL,
  `date_of_birth` varchar(25) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `Permanent_Address` varchar(200) DEFAULT NULL,
  `Permanent_Address_1` varchar(200) DEFAULT NULL,
  `Permanent_Address_2` varchar(200) DEFAULT NULL,
  `Permanent_location` varchar(50) DEFAULT NULL,
  `Permanent_city` varchar(50) DEFAULT NULL,
  `Permanent_state` varchar(50) DEFAULT NULL,
  `Permanent_pincode` varchar(20) DEFAULT NULL,
  `document_id` text,
  `document_proof` text,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_details_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_details_tbl_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_master_tbl` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_details_tbl`
--

LOCK TABLES `employee_details_tbl` WRITE;
/*!40000 ALTER TABLE `employee_details_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_device_details_tbl`
--

DROP TABLE IF EXISTS `employee_device_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_device_details_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `device_imei` varchar(200) NOT NULL,
  `device_model` varchar(200) DEFAULT NULL,
  `device_version` varchar(100) DEFAULT NULL,
  `notification_token` varchar(500) DEFAULT NULL,
  `notification_source` varchar(500) DEFAULT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `app_version` varchar(100) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `lattitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_device_details_tbl`
--

LOCK TABLES `employee_device_details_tbl` WRITE;
/*!40000 ALTER TABLE `employee_device_details_tbl` DISABLE KEYS */;
INSERT INTO `employee_device_details_tbl` VALUES (1,2,'8af12fa27e4150d4','vivo 1951','28','cnCZE8zZdG8:APA91bHTEGxWeQY_LXBrT3Oa9YSR-FUeekvDYW4XIU7TFswK5TBHYCfJ7bdwM-4Up8saBeG61-Q813-sP6nUdU4V31-XMVoZ45nCKwS7I65uWCElBH-rLoMDK-uidYC60SgXTjnnpbbc',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-11-28 07:07:48'),(2,1,'DF18C7BB-9A9A-4787-825A-2E2EB258F584','Not Available','12.4.3','fpmAKade5jk:APA91bFcEdB0nJBgorbqQm0Fe-saFgCvnKez_XuZ0l2pfUX8m_VgGeYpcexWzMuPiMhHyAjJOAwWgtxeeOGq5urmi34Tknl39cKs2usRCzv-W4aW8aeM-5U-XxMMII8B-1mY0G8QyZKb','FCM','IOS','1.0','192.168.1.30','N',NULL,NULL,'2019-12-02 10:14:54'),(3,1,'8af12fa27e4150d4','vivo 1951','28','d4SSS-VXIsI:APA91bHOLSvmLOaJvrNxV9maQdPO9YgMdpbOyVFAu3RVAzArP_NBBoDaTi490rUe5iJmjslHGpKOKnE08eU2mduYCWd8XFJbRO-Sh18_NAKLmZ4mqDo_TLyMB1mCdtWjr0KTB5jraG0t',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-02 11:23:02'),(4,2,'976f6af29c1884cd','GM1911','29','f0l62zAaVNU:APA91bF5_BoWkxHkcR3Nr54lL1junOJIAmyM7iKKJPdV2uYPjQKYJQj_mTlioQYyrGLfV9uPwtpLLsWqoqo2Hex70CMEkv6bM6UI6iOLdhyQ8wLIcuIe6kJ3nqlGV_u8l1G3QrSo2KbO',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-02 13:01:42'),(5,1,'DF18C7BB-9A9A-4787-825A-2E2EB258F584','Not Available','12.4.3','dcH58TV-kZs:APA91bGCmTXFTECHFFMcoF0UuZoUwyzsAulgAw44yuZedotj12d_1_buOJgS5Zo0QwgiQkIVX8rFI8XE8kfJrNxGFJah2p46MyOLttwy2kmk8K7LcmbT0DZAytiRYviiEN1bf8vvjuMW','FCM','IOS','1.0','192.168.1.30','N',NULL,NULL,'2019-12-10 04:59:51'),(6,2,'DF18C7BB-9A9A-4787-825A-2E2EB258F584','Not Available','12.4.3','fqMtRnlKVUA:APA91bHz8uZGOKixhdUzUqdWhHosAW5zY6P4-rAaoMdN7EYs9a39PzIO_GmwkB9-rG6akprCp1WDYbEB4VXy4UvxcfDfhekgYuUwuc6xJCiTIV6z2oAUy_I_q14GnCT2-0zMoaugHT_R','FCM','IOS','1.0','192.168.1.30','N',NULL,NULL,'2019-12-10 05:06:57'),(7,1,'b2a49ea2dcca339f','LLD-AL10','28','dcmGo05LZPo:APA91bGl2r8Yu3AIzHFETMfYBpZ2mQoy8-OBGPItu7gOKOl4uPOnkVzupxjelRvvPW4lm_MAvSEtqAuqunoZXAevxzEW84V5diy3Yiyob-leBhp6Gmxj_-3A48MC7RCl-bPHN8a8AZZR',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 05:40:58'),(8,1,'8af12fa27e4150d4','vivo 1951','28','cM0i_tL13rs:APA91bHE7hBPIFC5CWNQfu6GzlqKz0ayAbuXZ-4xc8Bjth9AgWE2uH6WI7ig9zsX4J4yAHqsZmAUq8X_90Fu3NTSoO4xVhxEIj8Q4bzUE-tZMTPWJjTs8fX0o3e-e6BtyA0zxwgtbLyu',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 05:44:13'),(9,1,'b2a49ea2dcca339f','LLD-AL10','28','dcmGo05LZPo:APA91bGl2r8Yu3AIzHFETMfYBpZ2mQoy8-OBGPItu7gOKOl4uPOnkVzupxjelRvvPW4lm_MAvSEtqAuqunoZXAevxzEW84V5diy3Yiyob-leBhp6Gmxj_-3A48MC7RCl-bPHN8a8AZZR',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 05:54:03'),(10,1,'8af12fa27e4150d4','vivo 1951','28','cBDRENWJEeg:APA91bFIWIeJFaFA8XqsgARoP03uR8pj3c1gszISpMWx37J1-cuvfYrrHdq9sL2PQzNEeUISrTSUa4Vt96GBS1KsJ11BDJ6WWbLsor9bm2t4f3umrDxG-BEkV9mI0jdcaJ7OzctxW9sP',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 06:41:14'),(11,1,'b2a49ea2dcca339f','LLD-AL10','28','d67PeyJzKT0:APA91bEN_A4h5ddfdrL0XLtNEUJ3eFEgp8jTdGggkCUIRxzwvN_SJP9gYIPZKYCqLVnBeMbdQRo4BiyO3FpS3VnM5y-7Qa5gFIizJ4GmmRLv-VQ71l5dkZearnhAjmiHdo6rgUzhHftW',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 06:43:27'),(12,1,'5afd8fe120781612','ONEPLUS A6000','28','cPO8mS7ZY9E:APA91bFgyJmBSjBhZj8B8KrjWVhz9uZQo7LAbYvP5QXOpf4K_gFwgvgSc-Aa7CoyhnXqK06Ut-I0UIf6j9zGzucvvhPskJwLE32VHSKrmwYHRJzVTLrHD7x_io5qmI7DUUlYR4ZMUMWV',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 07:14:18'),(13,1,'1cbe4d09645f1a0f','JSN-L42','28','dx01PKKJcI4:APA91bFKqZTbGPHGbon3LNlUHRXJ6PAqucT-fQqxlNkYu2BtaZxdnMEzLK0f9HgPU4MM8ycQAr99E0ftNgWzq3Hq9itKL_g2CVv95vo77eorrQDWGu4wU8hd3aQ0opv7FUAwSUiV4EGI',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 07:17:49'),(14,1,'c9c3f0c70ff80a64','ONEPLUS A6000','28','eIt01UsIXxk:APA91bHcLOR2J5b5q_dkhSMnMDpgcWIYe3xBRRAaIBY2H1kC7rRoqPnOvwIRyqPJLO0TJk-6PMBG0-hhKXJOCf_76doxoUQsAromPxqtPT70yM4WlPUc8wgzxmBTT2uy19Z9wMEwVC21',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 07:25:44'),(15,1,'b2a49ea2dcca339f','LLD-AL10','28','d67PeyJzKT0:APA91bEN_A4h5ddfdrL0XLtNEUJ3eFEgp8jTdGggkCUIRxzwvN_SJP9gYIPZKYCqLVnBeMbdQRo4BiyO3FpS3VnM5y-7Qa5gFIizJ4GmmRLv-VQ71l5dkZearnhAjmiHdo6rgUzhHftW',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-10 07:38:06'),(16,1,'DF18C7BB-9A9A-4787-825A-2E2EB258F584','Not Available','12.4.3','dibJx9xVuCE:APA91bHTdw9PB3OLwPVkXUDDnppeNQdHvYTGEug5UqCboYiLmxQjM7H-NpFojXEtABtLpv4-v1pjjoy22cznk7A1IB6J8bfmzOL7iV8AxGPFVAKBlCaDfL6DySN7en4GJqjnrjfTT9ys','FCM','IOS','1.0','192.168.1.30','N',NULL,NULL,'2019-12-10 09:13:46'),(17,1,'BF43DDEC-E0A8-4BDA-8DB0-4C9606F5DC42','Not Available','13.2.3','edRjKk4W2_Q:APA91bFVyi69b3NV08I5gF4LEoMgqneN-2QLmsKQWUtTbmvtTRgm0K3X_fsoOAtuT9KPajEcGdttSjInEN6PPqR-rBXOsVYMv_VeSr_oWjaNaPz_lZrfJFjrHZP8b3Ti9JcYkPufkmg_','FCM','IOS','1.0',NULL,'N',NULL,NULL,'2019-12-10 13:24:40'),(18,6,'f51469e792a91929','vivo 1951','28','eZY6ZiZ8VuI:APA91bHRBhv8lStLLAetM2TEmq1Rlf2TQ_Ylxqtmr9KUQ_PzhHOYIA9c0FlLL67VJMqIW8ncGmJ3hjYeBI8ZxfpPfHETPMjQp8UR2cEOMkKLwP1Qjx3ACz1cpORTofbOwwj78Aetwq31',NULL,'android','1.0',NULL,'Y',NULL,NULL,'2019-12-17 11:24:37'),(19,5,'32a3b6c321d08b14','ONEPLUS A6010','28','fXsrDyo8AwE:APA91bFwBYB1xlvJcuTQ1VC9TuogHR4bUFvUCN8B3c5essSUezjnYttuxrRVXjYLfObyMUEl08630OIgUQwRJxSYJ_nt4l8setoGS_tWitu9xwQSNEWmLZGRf8L3NI-gyeWdE1e8EVHk',NULL,'android','1.0',NULL,'Y',NULL,NULL,'2019-12-18 13:57:41'),(20,1,'0127F5F8-97F8-4BDA-9AE4-00F392759ABA','Not Available','12.4','c3mUte8myVM:APA91bETtDzcnGyKhBemup4ir3t-vJfYBqlDvkPob9fol6knrg16zkrz1BQteLns5mo2-UHi0_-jwFxo87aW2pPEQ4gfR9uPXCb8atFfqPBxc5oF869aWInSUbCPE3s0sjHwOtJRyImo','FCM','IOS','1.0','192.168.1.8','N',NULL,NULL,'2019-12-18 14:25:07'),(21,1,'8af12fa27e4150d4','vivo 1951','28','cCY1WrThpB8:APA91bHUrDbIRxYz14FPFc9SOz-Sll0EUJbQ9-wOBhq2FXUGEkPrwrEF3doDRmElkW05WKRyUgc6isuvKp2RsGpgvQ0zMvOqgkSHl10LAL1sW7m8IFa_uCKkBvS23ieeOYBY_ZQEYEpH',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-20 13:50:31'),(22,2,'8af12fa27e4150d4','vivo 1951','28','cCY1WrThpB8:APA91bHUrDbIRxYz14FPFc9SOz-Sll0EUJbQ9-wOBhq2FXUGEkPrwrEF3doDRmElkW05WKRyUgc6isuvKp2RsGpgvQ0zMvOqgkSHl10LAL1sW7m8IFa_uCKkBvS23ieeOYBY_ZQEYEpH',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-20 13:59:54'),(23,2,'976f6af29c1884cd','GM1911','29','d6Xp6leCqWM:APA91bG6-Z-Q83r7OFBAXHxjMsZpLm9Ildx6p6p7Oq_AZYbN5GgTfTq1lcahLb_f6Nuej3iX2PfMnNPUKd4kyz0fHqPlWCi2gmt5k752otCbatVOopwIy76EYhY5IkoUiLmTMtHe07cY',NULL,'android','1.0',NULL,'N',NULL,NULL,'2019-12-21 07:07:44'),(24,2,'8af12fa27e4150d4','vivo 1951','28','eNTbacLDfDw:APA91bG4Pq98lC9wASy6bki3sEQSKcVzzQ6cQm5rJltOOl29liAMrDdW1crY9qV_esomzG_OhVklliCotlTsr4kVw_-v9jK3nAJVjjUz1WufJVYoL0a8RzaUSmCNWMYyxmdyH1rdZJzr',NULL,'android','1.0',NULL,'Y',NULL,NULL,'2019-12-23 13:13:37'),(25,1,'0127F5F8-97F8-4BDA-9AE4-00F392759ABA','Simulator','12.4','fc-cdTq6C3s:APA91bESa3ORJvU0WLtUGXpOZaK-6HReLR54riD73o5nyVbcr8rhmbbrxYc-dpUQPem63OrNANzobT69bAlq_YUWjGVIzyGei-tEWI57DS0SnjH_JGb_RT--q8UotIm9LyZVSZOnWEyt','FCM','IOS','1.0','192.168.1.13','Y',NULL,NULL,'2019-12-27 06:50:04');
/*!40000 ALTER TABLE `employee_device_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_master_tbl`
--

DROP TABLE IF EXISTS `employee_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_master_tbl` (
  `employee_id` int(12) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `emp_password` varchar(20) DEFAULT 'luxuryride@123',
  `is_default_password` char(1) DEFAULT 'N',
  `employee_code` varchar(100) DEFAULT NULL,
  `employee_location` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `profile_image` text,
  `auth_key` varchar(200) DEFAULT NULL,
  `reauth_key` varchar(200) DEFAULT NULL,
  `auth_expiry_on` timestamp NULL DEFAULT NULL,
  `session_started_on` timestamp NULL DEFAULT NULL,
  `notification_token` varchar(1000) DEFAULT NULL,
  `notification_source` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `Phone_Number_UNIQUE` (`phone_number`),
  UNIQUE KEY `Email_Id_UNIQUE` (`email_id`),
  KEY `FKrole_idx` (`role_id`),
  CONSTRAINT `FKrole` FOREIGN KEY (`role_id`) REFERENCES `employee_roles_tbl` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_master_tbl`
--

LOCK TABLES `employee_master_tbl` WRITE;
/*!40000 ALTER TABLE `employee_master_tbl` DISABLE KEYS */;
INSERT INTO `employee_master_tbl` VALUES (1,'test evaluator',NULL,'test@gmail.com','9030755940','123456789','N','900315',1,3,'2019-11-25 10:57:43','2019-12-02 11:22:50','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'vishal',NULL,'vishal@luxuryride.in','9215015501','luxuryride@123','N',NULL,2,3,'2019-11-26 11:50:08','2019-11-27 11:02:04','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Poonam','Sharma','poonam@luxuryride.in','9599931171','lr@123','N','100001',1,7,'2019-11-27 11:01:47','2019-11-27 13:24:46','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Sumith Garg',NULL,'Sumithgarg@luxuryride.in','9053074502','luxuryride@123','N',NULL,2,3,'2019-12-16 05:11:12','2019-12-16 06:32:56','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Vikram pannu',NULL,'Vikrampannu@luxuryride.in','9992074501','luxuryride@123','N',NULL,2,3,'2019-12-16 05:11:13','2019-12-16 06:33:06','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Gurdeep',NULL,'Gurdeep@luxuryride.in','8929824501','luxuryride@123','N',NULL,2,3,'2019-12-16 09:47:44','2019-12-16 09:47:44','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_otp_request_tbl`
--

DROP TABLE IF EXISTS `employee_otp_request_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_otp_request_tbl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone_no` varchar(20) DEFAULT NULL,
  `otp_code` varchar(10) DEFAULT NULL,
  `otp_type` varchar(10) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `requested_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_verified` char(1) DEFAULT 'N',
  `verified_on` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_otp_request_tbl`
--

LOCK TABLES `employee_otp_request_tbl` WRITE;
/*!40000 ALTER TABLE `employee_otp_request_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_otp_request_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_role_assignment_tbl`
--

DROP TABLE IF EXISTS `employee_role_assignment_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_role_assignment_tbl` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `employee_id` int(25) DEFAULT NULL,
  `role_id` int(25) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `assigned_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_role_assignment_tbl_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_master_tbl` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_role_assignment_tbl`
--

LOCK TABLES `employee_role_assignment_tbl` WRITE;
/*!40000 ALTER TABLE `employee_role_assignment_tbl` DISABLE KEYS */;
INSERT INTO `employee_role_assignment_tbl` VALUES (1,1,3,'Y','2019-12-26 08:30:26'),(2,2,3,'Y','2019-12-26 08:30:26'),(3,3,7,'Y','2019-12-26 08:30:26'),(4,4,3,'Y','2019-12-26 08:30:26'),(5,5,3,'Y','2019-12-26 08:30:26'),(6,6,3,'Y','2019-12-26 08:30:26');
/*!40000 ALTER TABLE `employee_role_assignment_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_roles_tbl`
--

DROP TABLE IF EXISTS `employee_roles_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_roles_tbl` (
  `role_id` int(12) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_detail` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_roles_tbl`
--

LOCK TABLES `employee_roles_tbl` WRITE;
/*!40000 ALTER TABLE `employee_roles_tbl` DISABLE KEYS */;
INSERT INTO `employee_roles_tbl` VALUES (1,'Customer Support','Y','2018-11-28 13:43:28','2018-11-28 13:43:28',NULL),(2,'Lead Generator','Y','2018-11-28 13:43:28','2018-11-28 13:43:28',NULL),(3,'Evaluator','Y','2018-11-28 13:43:28','2018-11-28 13:43:28',NULL),(4,'Purchase Manager','Y','2018-11-28 13:43:28','2019-12-16 05:35:29',NULL),(5,'Sales Executive','Y','2018-11-28 13:43:28','2018-11-28 13:43:28',NULL),(6,'Showroom Manager','Y','2018-11-28 13:43:28','2018-11-28 13:43:28',NULL),(7,'Admin','Y','2018-11-28 13:43:28','2018-11-28 13:43:28',NULL),(8,'Super Admin','Y','2018-11-28 13:43:28','2018-11-28 13:43:28',NULL);
/*!40000 ALTER TABLE `employee_roles_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_showroom_assignment_tbl`
--

DROP TABLE IF EXISTS `employee_showroom_assignment_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_showroom_assignment_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `showroom_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FKemployee_idx` (`employee_id`),
  KEY `FKshowroom_id_idx` (`showroom_id`),
  CONSTRAINT `FKemployee` FOREIGN KEY (`employee_id`) REFERENCES `employee_master_tbl` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKshowroom_id` FOREIGN KEY (`showroom_id`) REFERENCES `showrooms_tbl` (`showroom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_showroom_assignment_tbl`
--

LOCK TABLES `employee_showroom_assignment_tbl` WRITE;
/*!40000 ALTER TABLE `employee_showroom_assignment_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_showroom_assignment_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquired_cars_tbl`
--

DROP TABLE IF EXISTS `enquired_cars_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquired_cars_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `budget` int(11) DEFAULT NULL,
  `planning_by` varchar(45) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquired_cars_tbl`
--

LOCK TABLES `enquired_cars_tbl` WRITE;
/*!40000 ALTER TABLE `enquired_cars_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquired_cars_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluated_vehicle_pricing_details_tbl`
--

DROP TABLE IF EXISTS `evaluated_vehicle_pricing_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluated_vehicle_pricing_details_tbl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(10) DEFAULT NULL,
  `cust_expt_price` int(15) DEFAULT NULL,
  `buying_price` int(15) DEFAULT NULL,
  `refurbish_amount` int(15) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `evaluated_vehicle_pricing_details_tbl_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_master_tbl` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluated_vehicle_pricing_details_tbl`
--

LOCK TABLES `evaluated_vehicle_pricing_details_tbl` WRITE;
/*!40000 ALTER TABLE `evaluated_vehicle_pricing_details_tbl` DISABLE KEYS */;
INSERT INTO `evaluated_vehicle_pricing_details_tbl` VALUES (1,10,2222,200000,50000,'Dhjihhh','Y','2019-12-11 08:30:59'),(2,117,3500000,2600000,0,'Customer last price is 34 lac. He is going USA in March that why he is selling car','Y','2019-12-17 18:22:57'),(3,118,3700000,3300000,0,'Customer asking is 40 lac , he has offer of 35 lac and he want 37 lac.','Y','2019-12-17 18:39:13'),(4,115,2200000,1600000,50000,'Good car. Only service and brake pad need to change','Y','2019-12-18 10:58:29'),(5,107,1500000,1400000,10000,'Good car','Y','2019-12-18 14:53:59');
/*!40000 ALTER TABLE `evaluated_vehicle_pricing_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluator_pincode_tabl`
--

DROP TABLE IF EXISTS `evaluator_pincode_tabl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluator_pincode_tabl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `evaluator_id` int(10) DEFAULT NULL,
  `pincode` int(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluator_pincode_tabl`
--

LOCK TABLES `evaluator_pincode_tabl` WRITE;
/*!40000 ALTER TABLE `evaluator_pincode_tabl` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluator_pincode_tabl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluator_vehicle_assignment_tbl`
--

DROP TABLE IF EXISTS `evaluator_vehicle_assignment_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluator_vehicle_assignment_tbl` (
  `assigned_id` int(12) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(10) DEFAULT NULL,
  `evaluator_id` int(12) NOT NULL,
  `location` varchar(25) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `is_confirmed` char(1) DEFAULT 'N',
  `confirmed_on` varchar(50) DEFAULT NULL,
  `is_rejected` char(1) DEFAULT 'N',
  `rejected_on` varchar(50) DEFAULT NULL,
  `assigned_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assigned_by` varchar(10) DEFAULT NULL,
  `is_rescheduled` char(1) DEFAULT 'N',
  `reschedule_time_date` varchar(50) DEFAULT NULL,
  `res_comments` varchar(200) DEFAULT NULL,
  `rej_comments` varchar(200) DEFAULT NULL,
  `is_reassigned` char(1) DEFAULT 'N',
  `reassigned_to` int(12) DEFAULT NULL,
  `re_assigned_on` varchar(50) DEFAULT NULL,
  `re_assign_comment` varchar(200) DEFAULT NULL,
  `is_submitted` char(1) DEFAULT 'N',
  `submitted_on` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`assigned_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluator_vehicle_assignment_tbl`
--

LOCK TABLES `evaluator_vehicle_assignment_tbl` WRITE;
/*!40000 ALTER TABLE `evaluator_vehicle_assignment_tbl` DISABLE KEYS */;
INSERT INTO `evaluator_vehicle_assignment_tbl` VALUES (1,1,2,'GURGAON','Y','Y','2019-11-30 12:30:46','Y','2019-12-10 18:49:17','2019-11-28 06:05:02',NULL,'N',NULL,NULL,'2015-16 AUDI A3 CAB 11000KMS @ 27 LAC\n\nOUR PRICE IS 22 LAC ','N',NULL,NULL,NULL,'N',NULL),(2,2,2,'jaipur','Y','Y','2019-11-28 12:30:23','N',NULL,'2019-11-28 06:48:20',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(3,3,2,'JAIPUR','Y','Y','2019-11-28 13:26:11','N',NULL,'2019-11-28 06:56:33',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(4,4,2,'jaipur','Y','Y','2019-11-28 12:32:39','N',NULL,'2019-11-28 07:11:08',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(5,5,1,'new delhi','N','N','2019-11-30 13:13:44','N',NULL,'2019-11-28 07:44:00',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(6,6,1,'DELHI','N','N','2019-11-30 15:48:22','N',NULL,'2019-11-28 10:19:16',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(7,7,2,'LUDHIANA','Y','Y','2019-12-05 11:30:16','N',NULL,'2019-11-28 10:24:39',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(8,8,2,'ludhiana','Y','Y','2019-12-04 01:00:00','N',NULL,'2019-11-28 10:28:23',NULL,'Y','2019-12-11 22:16:00','He is dealer of Ludhiana \n\nCall him again for cayenne 2017 20000kms \n2016 320d luxury line 27000kms @ 22 lac',NULL,'N',NULL,NULL,NULL,'N',NULL),(9,9,2,'rewari','Y','Y','2019-11-29 12:03:37','Y','2019-12-10 18:31:43','2019-11-28 10:33:57',NULL,'N',NULL,NULL,'Inspected car in rohtak. This is accident vehicle.','N',NULL,NULL,NULL,'N',NULL),(10,10,2,'GURGAON','Y','Y','2019-11-29 03:30:11','N',NULL,'2019-11-28 10:58:39',NULL,'Y','2019-12-11 23:00:00','2014 A4 2ND OWNER 52000KMS BLUE@ 13.50 LAC',NULL,'N',NULL,NULL,NULL,'Y','2019-12-11 14:01:38'),(11,11,1,'GURGAON','N','N','2019-11-29 16:47:51','N',NULL,'2019-11-28 11:18:09',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(12,12,2,'GURGAON','Y','Y','2019-11-30 12:03:21','N',NULL,'2019-11-29 09:01:42',NULL,'Y','2019-12-11 23:30:00','2015-16 Q5 TECHNOLOGY WHITE 40000KMS @ 25 LAC\n\nCALL HIM FOR MEETING',NULL,'N',NULL,NULL,NULL,'N',NULL),(13,13,2,NULL,'Y','Y','2019-11-30 14:34:42','Y','2019-12-10 19:29:28','2019-11-29 09:04:47',NULL,'Y','2019-12-11 22:00:00','Didn\'t pick call. Call again','2018-19 EVOQUE SE white hr 12000kms @ 45ac\n\nOur buying price is 33 lac, customer last price is 45ac.','N',NULL,NULL,NULL,'N',NULL),(14,15,2,'GURGAON','Y','Y','2019-11-30 03:15:28','Y','2019-12-10 18:40:11','2019-11-29 11:45:45',NULL,'N',NULL,NULL,'2017-18 A4 TECHNOLOGY BLUE 15000KMS \nCUSTOMER ASKING IS 32 LAC AND HE HAS A OFFER OF 27.50 LAC. \n\nOUR BUYER PRICE IS 22-23 LAC MAX','N',NULL,NULL,NULL,'N',NULL),(15,5,2,NULL,'N','N','2019-11-29 17:21:50','N',NULL,'2019-11-29 11:51:51',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(16,16,2,'DELHI','Y','Y','2019-12-28 12:01:04','N',NULL,'2019-11-30 11:49:12',NULL,'Y','2019-12-11 22:04:00','Call not pick call him again for meeting',NULL,'N',NULL,NULL,NULL,'N',NULL),(17,17,2,'GURGAON','Y','Y','2019-12-02 01:21:22','N',NULL,'2019-11-30 11:51:35',NULL,'Y','2019-12-11 22:01:00','2016 320d prestige white 32000kms @ 19 lac\nLocation is cyber city gurugram\n\nCall him for meeting',NULL,'N',NULL,NULL,NULL,'N',NULL),(18,18,2,'REWARI','Y','Y','2019-12-02 03:23:48','N',NULL,'2019-11-30 11:54:58',NULL,'Y','2019-12-10 20:00:00','Bzy ..call him again or he will call in one hour',NULL,'N',NULL,NULL,NULL,'N',NULL),(19,19,2,'NOIDA','Y','Y','2019-12-02 17:27:11','Y','2019-12-10 18:56:44','2019-11-30 11:57:22',NULL,'N',NULL,NULL,'He is dealer has detail of 2018 EVOQUE . But now his customer is not responding.','N',NULL,NULL,NULL,'N',NULL),(20,20,2,'LUDHIANA','Y','Y','2019-12-04 17:32:44','N',NULL,'2019-11-30 12:02:54',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(21,24,2,'DELHI','Y','Y','2019-12-04 12:00:40','N',NULL,'2019-12-03 10:30:54',NULL,'Y','2019-12-11 22:34:00','2018-19 VOLVO XC90 MOMENTUM white 4000kms UK reg. @ 70 lac customer asking\n\nCall him again for price discussion.',NULL,'N',NULL,NULL,NULL,'N',NULL),(22,25,2,'GURGAON','Y','Y','2019-12-04 02:13:36','Y','2019-12-10 19:30:47','2019-12-03 10:43:51',NULL,'N',NULL,NULL,'Already assigned ','N',NULL,NULL,NULL,'N',NULL),(23,26,2,'GURGAON','N','Y','2019-12-20 02:24:56','N',NULL,'2019-12-03 11:38:00',NULL,'Y','2019-12-11 22:32:00','Call not pick..call him again for meeting',NULL,'N',NULL,NULL,NULL,'N',NULL),(24,33,2,'SONIPAT','Y','Y','2019-12-07 11:00:11','N',NULL,'2019-12-04 11:21:31',NULL,'Y','2019-12-11 22:57:00','2018 520D BLUE 27000KMS @ 41 LAC\n\nCALL HIM AGAIN FOR LAST PRICE',NULL,'N',NULL,NULL,NULL,'N',NULL),(25,34,2,'PUNJAB','Y','Y','2019-12-07 03:55:01','N',NULL,'2019-12-04 11:25:36',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(26,37,2,'KOTA','Y','Y','2019-12-05 01:08:09','N',NULL,'2019-12-04 11:38:20',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(27,39,2,'delhi','Y','Y','2019-12-06 12:38:06','N',NULL,'2019-12-04 12:08:19',NULL,'Y','2019-12-11 22:49:00','Call for meeting',NULL,'N',NULL,NULL,NULL,'N',NULL),(28,40,2,'GURGAON','Y','Y','2019-12-05 12:52:00','Y','2019-12-10 19:42:39','2019-12-05 07:34:31',NULL,'N',NULL,NULL,'Sold car in bid','N',NULL,NULL,NULL,'N',NULL),(29,46,2,'DELHI','N','Y','2019-12-20 11:19:13','N',NULL,'2019-12-05 09:10:22',NULL,'Y','2019-12-11 22:46:00','2016 C200 SILVER 12000KMS DL REG. @ 24 LAC CUSTOMER HAS OFFER OF 23.60 LAC\n\nCALL HIM FOR MEETING',NULL,'N',NULL,NULL,NULL,'N',NULL),(30,47,2,'DELHI','N','Y','2019-12-20 02:16:03','N',NULL,'2019-12-05 12:18:05',NULL,'Y','2019-12-11 22:43:00','Call not pick . Call him again',NULL,'N',NULL,NULL,NULL,'N',NULL),(31,48,2,'DELHI','Y','Y','2019-12-06 12:01:15','Y','2019-12-09 22:11:08','2019-12-06 06:33:52',NULL,'N',NULL,NULL,'Our buying price is 22.50 lac and customer wants 25 lac','N',NULL,NULL,NULL,'N',NULL),(32,50,2,'DELHI','N','Y','2019-12-07 12:11:58','N',NULL,'2019-12-06 08:42:05',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(33,51,2,'GORAKHPUR','N','Y','2019-12-09 12:33:45','N',NULL,'2019-12-06 09:03:57',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(34,52,2,'MEERUT','N','Y','2019-12-21 01:11:00','N',NULL,'2019-12-06 09:06:52',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(35,59,2,'DELHI','Y','Y','2019-12-09 11:20:16','N',NULL,'2019-12-07 09:50:20',NULL,'Y','2019-12-11 22:18:00','Call him for price discussion of 2014 S350 WHITE 50000KMS @ 45 LAC AND 2 XJL ...HE IS DEALER',NULL,'N',NULL,NULL,NULL,'N',NULL),(36,58,2,'DELHI','Y','Y','2019-12-09 12:20:36','Y','2019-12-10 20:19:44','2019-12-07 09:50:43',NULL,'N',NULL,NULL,'He is dealer and I m in touch with him for s-class and xjl','N',NULL,NULL,NULL,'N',NULL),(37,60,2,'DELHI','Y','Y','2019-12-09 15:38:09','N',NULL,'2019-12-07 10:08:26',NULL,'Y','2019-12-12 23:11:00','2014 AUDI A6 40000KMS WHITE @ 19 LAC\n\nHE IS INTERESTED IN DIRECT END BUYER SELLING. CALL HIM FOR PARK AND SELL',NULL,'N',NULL,NULL,NULL,'N',NULL),(38,65,2,'GURGAON','Y','Y','2019-12-09 13:55:22','N',NULL,'2019-12-09 08:31:24',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(39,68,2,'CHANDIGARH','Y','Y','2019-12-10 12:07:19','N',NULL,'2019-12-09 12:37:39',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(40,69,2,'CHANDIGARH','Y','Y','2019-12-10 02:09:00','N',NULL,'2019-12-09 12:40:02',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(41,70,2,'CHANDIGARH','Y','Y','2019-12-10 03:12:02','N',NULL,'2019-12-09 12:42:16',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(42,71,2,'Chandigarh','Y','Y','2019-12-10 04:14:00','N',NULL,'2019-12-09 12:44:29',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(43,75,2,'DELHI','Y','Y','2019-12-11 12:23:31','Y','2019-12-10 18:02:00','2019-12-10 10:53:58',NULL,'N',NULL,NULL,'Car sold out','N',NULL,NULL,NULL,'N',NULL),(44,81,2,'faridabad','Y','Y','2019-12-12 01:54:15','N',NULL,'2019-12-11 12:24:23',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(45,91,2,'NOIDA','Y','Y','2019-12-13 12:14:09','N',NULL,'2019-12-12 11:44:28',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(46,92,2,'GURGAON','Y','Y','2019-12-13 04:16:49','N',NULL,'2019-12-12 11:47:15',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(47,98,2,'GURGAON','Y','Y','2019-12-14 01:16:00','N',NULL,'2019-12-13 12:47:01',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(48,101,2,'DELHI','N','Y','2019-12-16 12:28:02','N',NULL,'2019-12-13 12:58:18',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(49,102,2,'LUDHIANA','Y','Y','2019-12-23 01:32:50','N',NULL,'2019-12-13 13:03:03',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(50,103,2,'LUDHIANA','Y','Y','2019-12-23 02:35:20','N',NULL,'2019-12-13 13:05:32',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(51,105,2,'LUDHIANA','Y','Y','2019-12-23 04:42:06','N',NULL,'2019-12-13 13:12:31',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(52,107,2,'DELHI','Y','Y','2019-12-16 01:26:40','N',NULL,'2019-12-14 09:56:51',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'Y','2019-12-18 20:23:59'),(53,111,2,'LUDHIANA','Y','Y','2019-12-23 02:00:52','N',NULL,'2019-12-14 10:31:06',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(54,113,2,'DELHI','Y','Y','2019-12-16 03:28:00','Y','2019-12-17 12:26:06','2019-12-14 11:58:11',NULL,'N',NULL,NULL,'Visited car at rajouri garden. Almost complete car repainted. When I ask for test drive customer denied. And got angry at repainted thing.','N',NULL,NULL,NULL,'N',NULL),(55,115,2,'GURGAON','Y','Y','2019-12-16 15:32:26','N',NULL,'2019-12-16 10:04:45',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'Y','2019-12-18 18:31:10'),(56,116,2,'ALIGARH','Y','Y','2019-12-18 12:09:00','N',NULL,'2019-12-16 10:40:07',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(57,117,2,'NOIDA','Y','Y','2019-12-17 12:00:06','N',NULL,'2019-12-16 11:29:33',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'Y','2019-12-17 23:52:58'),(58,118,2,'DELHI','Y','Y','2019-12-17 03:01:45','N',NULL,'2019-12-16 11:32:39',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'Y','2019-12-19 12:02:38'),(59,123,2,'GURGAON','Y','Y','2019-12-18 01:41:47','N',NULL,'2019-12-16 13:11:59',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(60,127,6,'DELHI','N','N','2019-12-18 12:01:17','N',NULL,'2019-12-17 11:32:17',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(61,129,6,'DELHI','Y','Y','2019-12-20 12:08:00','N',NULL,'2019-12-17 12:39:06',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(62,131,6,'DELHI','N','Y','2019-12-18 01:12:53','N',NULL,'2019-12-17 12:43:18',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(63,132,6,'DELHI','N','Y','2019-12-18 03:15:00','N',NULL,'2019-12-17 12:45:36',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(64,133,4,'gf7ytre','N','Y','2019-12-20 22:34:00','N',NULL,'2019-12-17 17:05:00',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(65,133,5,'gf7ytre','N','Y','2019-12-20 22:34:00','N',NULL,'2019-12-17 19:08:47',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(66,133,1,'gf7ytre','N','Y','2019-12-20 22:34:00','N',NULL,'2019-12-17 19:09:08',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(67,127,2,'DELHI','Y','Y','2019-12-18 12:01:00','N',NULL,'2019-12-18 04:51:41',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(68,132,2,'DELHI','N','Y','2019-12-23 11:00:19','N',NULL,'2019-12-18 04:51:59',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(69,131,2,'DELHI','Y','Y','2019-12-18 01:12:00','N',NULL,'2019-12-18 04:52:11',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(70,134,6,'GURGAON','N','Y','2019-12-19 11:03:12','N',NULL,'2019-12-18 09:33:40',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(71,135,6,'gurgaon','N','Y','2019-12-19 01:05:48','N',NULL,'2019-12-18 09:36:18',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(72,136,6,'gurgaon','N','Y','2019-12-19 15:08:38','N',NULL,'2019-12-18 09:39:01',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(73,138,6,'delhi','Y','Y','2019-12-23 10:00:38','N',NULL,'2019-12-18 09:43:32',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(74,139,6,'GURGAON','N','Y','2019-12-19 04:54:15','N',NULL,'2019-12-18 12:24:30',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(75,140,6,'GURGAON','Y','Y','2019-12-23 12:23:06','N',NULL,'2019-12-18 12:53:32',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(76,136,2,'gurgaon','Y','Y','2019-12-20 03:08:00','N',NULL,'2019-12-18 13:01:11',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(77,135,2,'gurgaon','Y','Y','2019-12-19 01:05:00','N',NULL,'2019-12-18 13:01:42',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(78,134,2,'GURGAON','Y','Y','2019-12-19 11:03:00','N',NULL,'2019-12-18 13:02:01',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(79,139,2,'GURGAON','Y','Y','2019-12-19 04:54:00','N',NULL,'2019-12-18 13:02:17',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(80,141,2,'LUCKNOW','Y','Y','2019-12-25 11:41:36','N',NULL,'2019-12-18 13:11:53',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(81,143,6,'SONIPAT','Y','Y','2019-12-19 11:30:17','Y','2019-12-19 18:08:32','2019-12-19 06:03:00',NULL,'N',NULL,NULL,'All ready contacted by Sumit sir ','N',NULL,NULL,NULL,'N',NULL),(82,144,6,'KARNAL','N','Y','2019-12-19 11:33:04','N',NULL,'2019-12-19 06:05:27',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(83,132,6,'DELHI','Y','Y','2019-12-23 11:00:33','N',NULL,'2019-12-19 07:46:35',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(84,145,6,'LUCKNOW','Y','Y','2019-12-25 11:28:42','N',NULL,'2019-12-19 11:59:10',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(85,146,6,'KANPUR','Y','Y','2019-12-25 01:31:13','N',NULL,'2019-12-19 12:01:26',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(86,147,6,'KANPUR','Y','Y','2019-12-25 04:37:49','N',NULL,'2019-12-19 12:08:19',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(87,148,2,'GURGAON','Y','Y','2019-12-21 01:00:51','N',NULL,'2019-12-19 12:10:15',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(88,149,2,'GURGAON','N','Y','2019-12-20 12:41:52','N',NULL,'2019-12-19 12:12:14',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(89,26,6,'GURGAON','Y','Y','2019-12-20 02:24:00','N',NULL,'2019-12-19 13:00:36',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(90,47,6,'DELHI','Y','Y','2019-12-20 02:16:00','N',NULL,'2019-12-19 13:00:52',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(91,46,6,'DELHI','Y','Y','2019-12-20 11:19:00','N',NULL,'2019-12-19 13:01:09',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(92,149,6,'GURGAON','Y','Y','2019-12-20 12:41:00','N',NULL,'2019-12-19 13:01:25',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(93,144,2,'KARNAL','Y','Y','2019-12-19 11:33:00','N',NULL,'2019-12-20 08:41:21',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(94,153,2,'delhi','Y','Y','2019-12-21 11:36:02','N',NULL,'2019-12-20 11:06:16',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(95,154,2,'gurgaon','Y','Y','2019-12-21 02:38:40','N',NULL,'2019-12-20 11:08:53',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(96,50,6,'DEHRADUN','Y','Y','2019-12-21 11:10:00','N',NULL,'2019-12-20 11:40:40',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(97,101,6,'DEHRADHUN','Y','Y','2019-12-21 17:14:59','N',NULL,'2019-12-20 11:45:32',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(98,52,6,'MEERUT','Y','Y','2019-12-21 01:11:00','N',NULL,'2019-12-20 11:45:55',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(99,155,6,'LUDHIANA','Y','Y','2019-12-24 11:19:46','N',NULL,'2019-12-20 11:50:22',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(100,162,2,'ghaziabad','Y','Y','2019-12-23 12:43:33','N',NULL,'2019-12-20 12:13:45',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(101,150,2,'delhi','Y','Y','2019-12-21 01:46:06','N',NULL,'2019-12-20 12:16:13',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(102,51,6,'GORAKHPUR','Y','Y','2019-12-09 12:33:00','N',NULL,'2019-12-20 12:20:03',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(103,168,2,'Panchkula','Y','Y','2019-12-23 14:10:58','N',NULL,'2019-12-23 08:41:45',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(104,169,2,'GURGAON','Y','Y','2019-12-23 14:18:01','N',NULL,'2019-12-23 08:50:23',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(105,176,2,'LUDHIANA','Y','Y','2019-12-24 02:02:21','N',NULL,'2019-12-23 12:32:33',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(106,177,2,'GURGAON','Y','Y','2019-12-24 10:54:00','N',NULL,'2019-12-24 05:28:01',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(107,180,2,'NOIDA','Y','Y','2019-12-25 12:11:56','N',NULL,'2019-12-24 11:42:11',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(108,182,2,'NOIDA','Y','Y','2019-12-25 02:34:45','N',NULL,'2019-12-24 12:05:02',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(109,189,2,'CHANDIGARH','Y','Y','2019-12-28 11:29:39','N',NULL,'2019-12-25 11:59:48',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(110,192,2,'DEHRADUN','Y','Y','2019-12-28 12:14:39','N',NULL,'2019-12-26 10:45:15',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(111,196,2,'gurgaon','Y','Y','2019-12-27 12:01:21','N',NULL,'2019-12-27 06:39:57',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(112,197,2,'MEERUT','Y','Y','2019-12-28 12:14:01','N',NULL,'2019-12-27 06:44:17',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(113,200,2,'DELHI','Y','Y','2019-12-27 12:21:49','N',NULL,'2019-12-27 06:52:57',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(114,201,2,'GHAZIABAD','Y','Y','2019-12-28 02:04:45','N',NULL,'2019-12-27 10:35:10',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(115,173,2,'CHANDIGARH','Y','Y','2019-12-30 11:20:10','N',NULL,'2019-12-28 09:50:14',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(116,174,2,'LUDHIANA','Y','Y','2019-12-30 01:20:43','N',NULL,'2019-12-28 09:50:47',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(117,207,2,'PATIALA','Y','Y','2019-12-30 15:27:47','N',NULL,'2019-12-28 09:58:19',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(118,209,2,'LUDHIANA','Y','Y','2019-12-30 05:31:31','N',NULL,'2019-12-28 10:01:43',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(119,211,2,'GURGAON','Y','Y','2020-01-02 01:13:00','N',NULL,'2019-12-31 12:43:38',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL),(120,217,2,'paniapt','Y','Y','2020-01-03 12:00:25','N',NULL,'2020-01-02 10:10:48',NULL,'N',NULL,NULL,NULL,'N',NULL,NULL,NULL,'N',NULL);
/*!40000 ALTER TABLE `evaluator_vehicle_assignment_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expecting_cars_tbl`
--

DROP TABLE IF EXISTS `expecting_cars_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expecting_cars_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `make` int(10) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `car_type` varchar(10) DEFAULT NULL,
  `fuel_type` varchar(20) DEFAULT NULL,
  `manf_year` varchar(20) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expecting_cars_tbl`
--

LOCK TABLES `expecting_cars_tbl` WRITE;
/*!40000 ALTER TABLE `expecting_cars_tbl` DISABLE KEYS */;
INSERT INTO `expecting_cars_tbl` VALUES (1,1,3,12,NULL,'Petrol','11/2019',4,'Y','2019-11-26 05:12:57','2019-11-26 05:12:57'),(2,2,1,4,NULL,'Disel','8/2018',7,'Y','2019-11-26 12:59:40','2019-11-26 12:59:40');
/*!40000 ALTER TABLE `expecting_cars_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invester_budget_master_tbl`
--

DROP TABLE IF EXISTS `invester_budget_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invester_budget_master_tbl` (
  `budget_id` int(12) NOT NULL AUTO_INCREMENT,
  `budget` varchar(50) DEFAULT NULL,
  `amount` varchar(25) DEFAULT NULL,
  `car_visible_count` varchar(15) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`budget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invester_budget_master_tbl`
--

LOCK TABLES `invester_budget_master_tbl` WRITE;
/*!40000 ALTER TABLE `invester_budget_master_tbl` DISABLE KEYS */;
INSERT INTO `invester_budget_master_tbl` VALUES (1,'2500000','2500000','3','Y','2019-11-22 06:14:05'),(2,'5000000','5000000','5','Y','2019-11-22 06:14:05'),(3,'1 Crore','10000000','10','Y','2019-11-22 06:14:05'),(4,'2 Crore & Above','20000000000','15','Y','2019-11-22 06:14:06'),(5,'Above','2000000000','50','N','2019-11-22 06:14:06');
/*!40000 ALTER TABLE `invester_budget_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invester_car_brand_tbl`
--

DROP TABLE IF EXISTS `invester_car_brand_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invester_car_brand_tbl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `car_id` varchar(200) DEFAULT NULL,
  `invester_id` int(15) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invester_car_brand_tbl`
--

LOCK TABLES `invester_car_brand_tbl` WRITE;
/*!40000 ALTER TABLE `invester_car_brand_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `invester_car_brand_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invester_debit_amount_tbl`
--

DROP TABLE IF EXISTS `invester_debit_amount_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invester_debit_amount_tbl` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `invester_id` int(10) DEFAULT NULL,
  `vehicle_id` int(10) DEFAULT NULL,
  `budget_amount` varchar(25) DEFAULT NULL,
  `invesed_amount` varchar(25) DEFAULT NULL,
  `remain_amount` varchar(25) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `invester_id` (`invester_id`),
  CONSTRAINT `invester_debit_amount_tbl_ibfk_1` FOREIGN KEY (`invester_id`) REFERENCES `invester_master_tbl` (`invester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invester_debit_amount_tbl`
--

LOCK TABLES `invester_debit_amount_tbl` WRITE;
/*!40000 ALTER TABLE `invester_debit_amount_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `invester_debit_amount_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invester_device_details_tbl`
--

DROP TABLE IF EXISTS `invester_device_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invester_device_details_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invester_id` int(11) NOT NULL,
  `device_imei` varchar(200) NOT NULL,
  `device_model` varchar(200) DEFAULT NULL,
  `device_version` varchar(100) DEFAULT NULL,
  `notification_token` varchar(500) DEFAULT NULL,
  `notification_source` varchar(500) DEFAULT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `app_version` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) DEFAULT NULL,
  `reauth_key` varchar(100) DEFAULT NULL,
  `auth_expires_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invester_device_details_tbl`
--

LOCK TABLES `invester_device_details_tbl` WRITE;
/*!40000 ALTER TABLE `invester_device_details_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `invester_device_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invester_master_tbl`
--

DROP TABLE IF EXISTS `invester_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invester_master_tbl` (
  `invester_id` int(11) NOT NULL AUTO_INCREMENT,
  `invester_name` varchar(120) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL DEFAULT 'Investor@2019',
  `is_default_passowrd` char(1) DEFAULT 'N',
  `invester_share` double(10,2) DEFAULT '50.00',
  `is_active` char(1) DEFAULT 'Y',
  `registered_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `address_line1` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `budget_id` int(10) DEFAULT NULL,
  `alternate_phone_number` varchar(45) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `document_file_name` varchar(255) DEFAULT NULL,
  `agreement_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`invester_id`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  KEY `FKstate_idx` (`state`),
  CONSTRAINT `FKstate` FOREIGN KEY (`state`) REFERENCES `state_master_tbl` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invester_master_tbl`
--

LOCK TABLES `invester_master_tbl` WRITE;
/*!40000 ALTER TABLE `invester_master_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `invester_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invester_payments_tbl`
--

DROP TABLE IF EXISTS `invester_payments_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invester_payments_tbl` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `payment_id` int(12) DEFAULT NULL,
  `transaction_status` varchar(50) DEFAULT NULL,
  `paid_amount` double(12,2) DEFAULT NULL,
  `tax_amount` double(10,2) DEFAULT NULL,
  `payment_requested_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_completed_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` char(1) DEFAULT 'Y',
  `payment_status` varchar(50) DEFAULT NULL,
  `is_payment_done` char(1) DEFAULT 'N',
  `payment_response_obj` text,
  `razorpay_payment_id` varchar(150) DEFAULT NULL,
  `invester_id` int(12) DEFAULT NULL,
  `vehicle_id` int(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invester_id` (`invester_id`),
  CONSTRAINT `invester_payments_tbl_ibfk_1` FOREIGN KEY (`invester_id`) REFERENCES `invester_master_tbl` (`invester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invester_payments_tbl`
--

LOCK TABLES `invester_payments_tbl` WRITE;
/*!40000 ALTER TABLE `invester_payments_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `invester_payments_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invester_reject_vehicle_tbl`
--

DROP TABLE IF EXISTS `invester_reject_vehicle_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invester_reject_vehicle_tbl` (
  `reject_id` int(12) NOT NULL AUTO_INCREMENT,
  `invester_id` int(12) DEFAULT NULL,
  `vehicle_id` int(12) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `rejected_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invester_reject_vehicle_tbl`
--

LOCK TABLES `invester_reject_vehicle_tbl` WRITE;
/*!40000 ALTER TABLE `invester_reject_vehicle_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `invester_reject_vehicle_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invester_vehicle_interest_tbl`
--

DROP TABLE IF EXISTS `invester_vehicle_interest_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invester_vehicle_interest_tbl` (
  `interest_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `invester_id` int(11) NOT NULL,
  `is_interest` char(1) DEFAULT 'Y',
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `interested_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `penalty_date` varchar(50) DEFAULT NULL,
  `penalty_paid` char(1) DEFAULT 'N',
  `penalty_amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`interest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invester_vehicle_interest_tbl`
--

LOCK TABLES `invester_vehicle_interest_tbl` WRITE;
/*!40000 ALTER TABLE `invester_vehicle_interest_tbl` DISABLE KEYS */;
INSERT INTO `invester_vehicle_interest_tbl` VALUES (1,20,2,'Y','Y','2019-12-16 15:16:46','2019-12-18 20:46:46','N',NULL);
/*!40000 ALTER TABLE `invester_vehicle_interest_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER after_investor_interst_insert
 before insert
 ON invester_vehicle_interest_tbl FOR EACH ROW
 BEGIN
	SET NEW.penalty_date = DATE_ADD(now(), INTERVAL 2 DAY) ;
   
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notification_to_user_tbl`
--

DROP TABLE IF EXISTS `notification_to_user_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_to_user_tbl` (
  `notification_id` int(10) NOT NULL AUTO_INCREMENT,
  `to_user` int(10) DEFAULT NULL,
  `notification_title` varchar(100) DEFAULT NULL,
  `notification_content` text,
  `is_sent` char(1) DEFAULT 'N',
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sent_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notification_type` varchar(100) DEFAULT NULL,
  `is_view` char(1) DEFAULT 'N',
  `notification_category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_to_user_tbl`
--

LOCK TABLES `notification_to_user_tbl` WRITE;
/*!40000 ALTER TABLE `notification_to_user_tbl` DISABLE KEYS */;
INSERT INTO `notification_to_user_tbl` VALUES (1,2,'Reminder','Today You have 5 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-03 20:30:01','2019-12-03 20:30:01','Leads',NULL,'Assigned Leads'),(2,2,'Reminder','Today You have 2 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-04 20:30:01','2019-12-04 20:30:01','Leads',NULL,'Assigned Leads'),(3,2,'Reminder','Today You have 3 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-05 20:30:01','2019-12-05 20:30:01','Leads',NULL,'Assigned Leads'),(4,2,'Reminder','Today You have 3 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-06 20:30:01','2019-12-06 20:30:01','Leads',NULL,'Assigned Leads'),(5,2,'Reminder','Today You have 5 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-08 20:30:01','2019-12-08 20:30:01','Leads',NULL,'Assigned Leads'),(6,2,'Reminder','Today You have 4 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-09 20:30:01','2019-12-09 20:30:01','Leads',NULL,'Assigned Leads'),(7,2,'Reminder','Today You have 12 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-10 20:30:01','2019-12-10 20:30:01','Leads',NULL,'Assigned Leads'),(8,2,'Reminder','Today You have 2 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-11 20:30:01','2019-12-11 20:30:01','Leads',NULL,'Assigned Leads'),(9,2,'Reminder','Today You have 2 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-12 20:30:01','2019-12-12 20:30:01','Leads',NULL,'Assigned Leads'),(10,2,'Reminder','Today You have 1 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-13 20:30:01','2019-12-13 20:30:01','Leads',NULL,'Assigned Leads'),(11,2,'Reminder','Today You have 3 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-15 20:30:01','2019-12-15 20:30:01','Leads',NULL,'Assigned Leads'),(12,2,'Reminder','Today You have 2 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-16 20:30:00','2019-12-16 20:30:00','Leads',NULL,'Assigned Leads'),(13,6,'Customer Support','New lead hasbeen assigned to You, On 2019-12-18 12:01:17','Y','Y','2019-12-17 11:32:17','2019-12-17 11:32:17','Leads',NULL,'Purchase Lead Creation'),(14,2,'Reminder','Today You have 2 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-17 20:30:00','2019-12-17 20:30:00','Leads',NULL,'Assigned Leads'),(15,6,'Reminder','Today You have 3 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-17 20:30:01','2019-12-17 20:30:01','Leads',NULL,'Assigned Leads'),(16,2,'Reminder','Today You have 4 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-18 20:30:00','2019-12-18 20:30:00','Leads',NULL,'Assigned Leads'),(17,6,'Customer Support','New lead hasbeen assigned to You, On 2019-12-19 11:30:17','Y','Y','2019-12-19 06:03:01','2019-12-19 06:03:01','Leads',NULL,'Purchase Lead Creation'),(18,2,'Reminder','Today You have 1 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-19 20:30:01','2019-12-19 20:30:01','Leads',NULL,'Assigned Leads'),(19,6,'Reminder','Today You have 5 Leads to Evaluate.\nPlease Complete Evaluation by End Of The Day.','Y','Y','2019-12-19 20:30:01','2019-12-19 20:30:01','Leads',NULL,'Assigned Leads'),(20,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-23 12:43:33','Y','Y','2019-12-20 12:13:46','2019-12-20 12:13:46','Leads',NULL,'Purchase Lead Creation'),(21,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-21 01:46:06','Y','Y','2019-12-20 12:16:13','2019-12-20 12:16:13','Leads',NULL,'Purchase Lead Creation'),(22,6,'Customer Support','New lead hasbeen assigned to You, On 2019-12-09 12:33:00','Y','Y','2019-12-20 12:20:03','2019-12-20 12:20:03','Leads',NULL,'Purchase Lead Creation'),(23,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-23 14:10:58','Y','Y','2019-12-23 08:41:47','2019-12-23 08:41:47','Leads',NULL,'Purchase Lead Creation'),(24,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-23 14:18:01','Y','Y','2019-12-23 08:50:23','2019-12-23 08:50:23','Leads',NULL,'Purchase Lead Creation'),(25,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-24 02:02:21','Y','Y','2019-12-23 12:32:34','2019-12-23 12:32:34','Leads',NULL,'Purchase Lead Creation'),(26,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-24 10:54:00','Y','Y','2019-12-24 05:28:02','2019-12-24 05:28:02','Leads',NULL,'Purchase Lead Creation'),(27,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-25 12:11:56','Y','Y','2019-12-24 11:42:13','2019-12-24 11:42:13','Leads',NULL,'Purchase Lead Creation'),(28,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-25 02:34:45','Y','Y','2019-12-24 12:05:02','2019-12-24 12:05:02','Leads',NULL,'Purchase Lead Creation'),(29,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-28 11:29:39','Y','Y','2019-12-25 11:59:48','2019-12-25 11:59:48','Leads',NULL,'Purchase Lead Creation'),(30,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-28 12:14:39','Y','Y','2019-12-26 10:45:16','2019-12-26 10:45:16','Leads',NULL,'Purchase Lead Creation'),(31,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-27 12:01:21','Y','Y','2019-12-27 06:39:58','2019-12-27 06:39:58','Leads',NULL,'Purchase Lead Creation'),(32,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-28 12:14:01','Y','Y','2019-12-27 06:44:17','2019-12-27 06:44:17','Leads',NULL,'Purchase Lead Creation'),(33,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-27 12:21:49','Y','Y','2019-12-27 06:52:57','2019-12-27 06:52:57','Leads',NULL,'Purchase Lead Creation'),(34,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-28 02:04:45','Y','Y','2019-12-27 10:35:10','2019-12-27 10:35:10','Leads',NULL,'Purchase Lead Creation'),(35,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-30 11:20:10','Y','Y','2019-12-28 09:50:15','2019-12-28 09:50:15','Leads',NULL,'Purchase Lead Creation'),(36,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-30 01:20:43','Y','Y','2019-12-28 09:50:47','2019-12-28 09:50:47','Leads',NULL,'Purchase Lead Creation'),(37,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-30 15:27:47','Y','Y','2019-12-28 09:58:19','2019-12-28 09:58:19','Leads',NULL,'Purchase Lead Creation'),(38,2,'Customer Support','New lead hasbeen assigned to You, On 2019-12-30 05:31:31','Y','Y','2019-12-28 10:01:43','2019-12-28 10:01:43','Leads',NULL,'Purchase Lead Creation'),(39,2,'Customer Support','New lead hasbeen assigned to You, On 2020-01-02 01:13:26','Y','Y','2019-12-31 12:43:39','2019-12-31 12:43:39','Leads',NULL,'Purchase Lead Creation'),(40,2,'Customer Support','New lead hasbeen assigned to You, On 2020-01-03 12:00:25','Y','Y','2020-01-02 10:10:48','2020-01-02 10:10:48','Leads',NULL,'Purchase Lead Creation');
/*!40000 ALTER TABLE `notification_to_user_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_mode_master_tbl`
--

DROP TABLE IF EXISTS `payment_mode_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_mode_master_tbl` (
  `mode_id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_mode_master_tbl`
--

LOCK TABLES `payment_mode_master_tbl` WRITE;
/*!40000 ALTER TABLE `payment_mode_master_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_mode_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_lead_source_tbl`
--

DROP TABLE IF EXISTS `purchase_lead_source_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_lead_source_tbl` (
  `source_id` int(12) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(100) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` char(1) DEFAULT 'Y',
  `created_by` int(12) DEFAULT NULL,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_lead_source_tbl`
--

LOCK TABLES `purchase_lead_source_tbl` WRITE;
/*!40000 ALTER TABLE `purchase_lead_source_tbl` DISABLE KEYS */;
INSERT INTO `purchase_lead_source_tbl` VALUES (1,'CarWale/CarTrade','2019-01-24 09:24:30','Y',NULL,'2019-10-07 12:29:23'),(2,'CarDekho','2019-01-24 09:24:31','Y',NULL,'2019-10-07 12:29:21'),(3,'Data','2019-01-24 09:24:31','Y',NULL,'2019-10-10 12:20:38'),(4,'IVR','2019-01-24 09:24:32','Y',NULL,'2019-10-10 12:20:38'),(5,'cars24','2019-01-24 09:24:32','Y',NULL,'2019-10-10 12:20:38'),(6,'Social Media','2019-01-24 09:25:07','Y',NULL,'2019-10-07 12:29:25'),(7,'OLX','2019-10-10 12:20:38','Y',NULL,'2019-10-10 12:20:38'),(8,'Facebook','2019-10-10 12:20:38','Y',NULL,'2019-10-10 12:20:38'),(9,'Walkin','2019-10-10 12:20:38','Y',NULL,'2019-10-10 12:20:38'),(10,'Web','2019-10-10 12:20:38','Y',NULL,'2019-10-10 12:20:38'),(11,'Reference','2019-10-10 12:20:39','Y',NULL,'2019-10-10 12:20:39'),(12,'by evaluator','2019-10-14 12:39:15','Y',NULL,'2019-10-14 12:39:15'),(13,'Go Machanic','2019-12-17 13:01:33','Y',NULL,'2019-12-17 13:01:33');
/*!40000 ALTER TABLE `purchase_lead_source_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_lead_tbl`
--

DROP TABLE IF EXISTS `purchase_lead_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_lead_tbl` (
  `purchase_lead_id` int(12) NOT NULL AUTO_INCREMENT,
  `lead_name` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `address_line_1` varchar(100) DEFAULT NULL,
  `address_line_2` varchar(100) DEFAULT NULL,
  `location_area_city` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `district` varchar(25) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `lead_source` int(20) DEFAULT NULL,
  `reffered_by` varchar(50) DEFAULT NULL,
  `added_by` int(10) DEFAULT NULL,
  `vehicle_variant` varchar(50) DEFAULT NULL,
  `vehicle_type` varchar(10) DEFAULT NULL,
  `lead_id` varchar(20) DEFAULT NULL,
  `car_make` varchar(25) DEFAULT NULL,
  `car_model` varchar(50) DEFAULT NULL,
  `registration_no` varchar(50) DEFAULT NULL,
  `manufactured_year` varchar(50) DEFAULT NULL,
  `production_year` varchar(50) DEFAULT NULL,
  `reg_date` varchar(20) DEFAULT NULL,
  `colour` varchar(50) DEFAULT NULL,
  `fuel_type` varchar(20) DEFAULT NULL,
  `transmission` varchar(50) DEFAULT NULL,
  `no_of_owners` varchar(30) DEFAULT NULL,
  `odometer` varchar(20) DEFAULT NULL,
  `expected_price` varchar(20) DEFAULT NULL,
  `sale_lead_id` int(25) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `listed_date` varchar(50) DEFAULT NULL,
  `updated_date` varchar(50) DEFAULT NULL,
  `image` text,
  `migrated_from` varchar(1) DEFAULT NULL,
  `purchase_by` varchar(20) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase_lead_id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_lead_tbl`
--

LOCK TABLES `purchase_lead_tbl` WRITE;
/*!40000 ALTER TABLE `purchase_lead_tbl` DISABLE KEYS */;
INSERT INTO `purchase_lead_tbl` VALUES (1,'DHEERAJ','9873623762','dheeraj12@gmail.com','sushant lok',NULL,'2','13','gurgaon','122001',7,NULL,3,'57','1',NULL,'1','7','DL1CKJLK22','03/2015',NULL,NULL,'Silver','Diesel',NULL,'First Owner','11000','2900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 06:05:02','2019-12-09 14:05:17'),(2,'GAURAV','9166844700','a@gmail.com','Bapu Nagar, Bhilwara',NULL,'3','29','jaipur','122001',7,NULL,3,'67','2',NULL,'3','11','RJ140000','0/2014',NULL,NULL,'White','Diesel',NULL,'Second Owner','51000','1951000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 06:48:20','2019-12-09 14:05:18'),(3,'PARTH/GOVIND','9587500000','gaurav@gmail.com','JAIPUR',NULL,'3','29','JAIPUR','122001',7,NULL,3,NULL,'1',NULL,'20','76','RJ140000','03/2014',NULL,NULL,'Red','Diesel',NULL,'First Owner','91000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 06:56:33','2019-12-17 18:39:12'),(4,'LAKSHYA ','7877695693','lakshya12@gmail.com','TILAK NAGAR ',NULL,'3','29','jaipur','302001',7,NULL,3,'43','1',NULL,'1','5','rj140000','0/2015',NULL,NULL,'Gray','Diesel',NULL,'Second Owner','54000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 07:11:08','2019-12-09 14:05:18'),(5,'NAVEEN','9999959119','naveen12@gmail.com','N-10 N BLK JANGPURA',NULL,'1','10','delhi','110000',9,NULL,3,NULL,'1',NULL,'1','4','DL8CZ5272','0/2013',NULL,NULL,'Silver','Diesel',NULL,'Second Owner','70000','1600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 07:44:00','2019-12-17 18:39:12'),(6,'RAJAT','9999798098','rajatn23@gmail.com','DELHI',NULL,'8','10','DELHI','110000',2,NULL,3,'92','3',NULL,'3','12','DL0000','01/2015',NULL,NULL,'White','Diesel',NULL,'First Owner','20000','2800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 10:19:16','2019-12-09 14:05:16'),(7,'Jarnail Singh','9878304040','jarnail23@gmail.com','DUGRI DHANDRA ROAD',NULL,'5','28','LUDHIANA','141001',7,NULL,3,'115','2',NULL,'3','19','PB10HA5005','12/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','7500','31500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 10:24:39','2019-12-09 14:05:19'),(8,'DEVENDER SINGH','8837817230','devender23@gmail.com','88 E RISHI NAGAR ',NULL,'5','28','ludhiana','141002',7,NULL,3,NULL,'3',NULL,'16','62','pb10000','12/2017',NULL,NULL,'Black','Diesel',NULL,'First Owner','18000','8500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 10:28:23','2019-12-17 18:39:12'),(9,'MAYANK GANDHI','9991281000','mayankd56@gmail.com','PUMA STORE OPP BAJRANG BHAWAN ',NULL,'15','13','rewari','123401',7,NULL,3,'9','2',NULL,'1','3','DL9CAA7931','03/2015',NULL,NULL,'White','Diesel',NULL,'First Owner','48000','2400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 10:33:57','2019-12-09 14:05:20'),(10,'JOGINDER SINGH','9871767119','joginder2@gmail.com','H.NO-322P SEC-12',NULL,'2','13','GURGAON','122001',7,NULL,3,'7','2',NULL,'1','1','HR26CG7041','01/2014',NULL,NULL,'Blue','Diesel',NULL,'Second Owner','52300','13500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 10:58:39','2019-12-09 14:05:17'),(11,'KARAN','9871114867','karan12@gmail.com','Malibu Town,',NULL,'2','13','GURGAON','122001',7,NULL,3,'115','2',NULL,'3','19','HR260000','07/2017',NULL,NULL,'Blue','Diesel',NULL,'First Owner','26000','2600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-28 11:18:09','2019-12-09 14:05:17'),(12,'PUNEET VERMA','9810175038',NULL,'K-1-601 CENTRAL PARK 1 SEC-42 ',NULL,'2','13','GURGAON','122001',2,NULL,3,'34','3',NULL,'1','3','HR260000','03/2016',NULL,NULL,'White','Diesel',NULL,'First Owner','40000','2600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-29 09:01:41','2019-12-09 14:05:17'),(13,'RAO DEEPESH/JDSA PVT.LTD','9818860026',NULL,'SEC-30 STAR TOWER SECOND FLOOR',NULL,'2','13','GURGAON','122001',7,NULL,3,NULL,'3',NULL,'9','34','HR26DY0055','06/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','14000','45,00,000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-29 09:04:47','2019-12-17 18:39:12'),(14,'MOHIT/DEALER','9958084887',NULL,'NOIDA',NULL,'13','34','NOIDA','?20130',4,NULL,3,NULL,'3',NULL,'9','34','UP14000','02/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','29000','4000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-29 10:43:33','2019-12-17 18:39:12'),(15,'SUMIT LAL','9811484476',NULL,'H.NO-106 B HAMILTON CODE DLF P',NULL,'2','13','GURGAON','122001',7,NULL,3,'1','2',NULL,'1','1','HR26DL1667','11/2017',NULL,NULL,'Blue','Diesel',NULL,'First Owner','14500','3200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-29 11:45:44','2019-12-09 14:05:17'),(16,'Shakti Yadav','9910405477','NA','B3-403 sunny valley apartments',NULL,'9','10','DELHI','110001',2,NULL,2,'34','3',NULL,'1','3','HR51','12/2012',NULL,NULL,'White','Diesel','null','Second Owner','50000','2100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-30 11:49:12','2019-12-09 14:05:17'),(17,'Satendra Singh ','9940122470',NULL,'SEC-30 STAR TOWER UNIWARD CITY',NULL,'2','13','GURGAON','122001',2,NULL,3,'63','2',NULL,'3','11','HR26000','07/2016',NULL,NULL,'Blue','Diesel',NULL,'First Owner','32000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-30 11:51:35','2019-12-09 14:05:17'),(18,'DHEERAJ','8600007020',NULL,'REWARI',NULL,'15','13','REWARI','123401',4,NULL,3,NULL,'2',NULL,'8','28','HP120000','04/2017',NULL,NULL,'White','Diesel',NULL,'First Owner','8300','4600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-30 11:54:58','2019-12-17 18:39:12'),(19,'MOHIT/DEALER','9958084887',NULL,'NOIDA',NULL,'13','34','NOIDA','201301',4,NULL,3,NULL,'3',NULL,'9','34','UP1400000','06/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','29000','40000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-30 11:57:22','2019-12-17 18:39:13'),(20,'VISHAL BANSAL','9878600088',NULL,'AGAR NAGAR',NULL,'5','28','LUDHIANA',NULL,7,NULL,3,'100','3',NULL,'3','15','HR700000','08/2016',NULL,NULL,'White','Diesel',NULL,'Second Owner','75000','4000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-11-30 12:02:54','2019-12-09 14:05:19'),(21,'DINESH','9899991567',NULL,'PATEL NAGAR',NULL,'8','10','DELHI','110001',4,NULL,3,NULL,'2',NULL,'12','46','DL00000','02/2015',NULL,NULL,'White','Petrol',NULL,'Second Owner','25000','4000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 10:20:53','2019-12-17 18:39:13'),(22,'HARBINDER SINGH','8450962544',NULL,'C-301 ANDHARI KALA',NULL,'12','21','MUMBAI','400047',11,NULL,3,'79','2',NULL,'3','12','HR26DC6500','01/2016',NULL,NULL,'Blue','Diesel',NULL,'First Owner','45000','2800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 10:25:12','2019-12-09 14:05:19'),(23,'Yashodhan Gupta ','9644664455',NULL,'INDORE',NULL,'10','20','INDORE','452001',4,NULL,3,'50','3',NULL,'1','6','MP030000','09/2017',NULL,NULL,'White','Petrol',NULL,'First Owner','13000','5300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 10:28:15','2019-12-09 14:05:18'),(24,'PARVEEN GARG','9891520109',NULL,'H.NO-156 SHAKTI VIHAR  FIRST F',NULL,'8','10','DELHI','110001',7,NULL,3,'249','3',NULL,'20','73','UK073333','05/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','3500','7000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 10:30:54','2019-12-09 14:05:16'),(25,'PUNEET VERMA','9810175038',NULL,'K-1-601 CENTRAL PARK 1 SEC-42 ',NULL,'2','13','GURGAON','122001',2,NULL,3,'34','3',NULL,'1','3','HR26CT6473','03/2015',NULL,NULL,'White','Diesel',NULL,'First Owner','40000','2600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 10:43:51','2019-12-09 14:05:17'),(26,'Siddharthsid22','9717538902','NA','Billding no-14 cyber city ',NULL,'2','13','GURGAON','120001',7,NULL,6,'4','2',NULL,'1','1','HR260000','03/2015',NULL,NULL,'White','Petrol','null','First Owner','52000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 11:38:00','2019-12-09 14:05:17'),(27,'VARUN BANSAL','9876804900',NULL,'Tagore Nagar',NULL,'5','28','LUDHIANA','140412',2,NULL,3,'217','3',NULL,'12','49','PB100000','0/2016',NULL,NULL,'Black','Diesel',NULL,'First Owner','50000','3600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 11:46:51','2019-12-17 18:30:49'),(28,'ANUBHAV TALWAR','9910035440',NULL,'ASHOK VIHAR',NULL,'8','10','DELHI','110001',2,NULL,3,NULL,'2',NULL,'12','42','UP32KH8800','08/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','30000','2750000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 12:16:50','2019-12-17 18:39:13'),(29,'MAYANK ARORA','9812633333',NULL,'KUNDALI',NULL,'7','13','KUNDALI','131028',2,NULL,3,'79','2',NULL,'3','12',NULL,'04/2018',NULL,NULL,'Blue','Diesel',NULL,'First Owner','27000','4100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 12:29:06','2019-12-09 14:05:19'),(30,'DAVINDER','9810185403',NULL,'Pusa Road Area,',NULL,'8','10','DELHI','110001',7,NULL,3,'217','3',NULL,'12','49','MH43AT8284','0/0',NULL,NULL,'Black','Diesel',NULL,'First Owner','50000','3900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 12:32:05','2019-12-09 14:05:16'),(31,'SAURABH BHADANA','9911129011',NULL,'YUMNA VIHAR ',NULL,'8','10','DELHI','110001',2,NULL,3,'160','2',NULL,'12','42','DL2CAQ7585','08/2015',NULL,NULL,'Red','Diesel',NULL,'First Owner','22000','2300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-03 12:35:21','2019-12-09 14:05:16'),(32,'HARDEEP SINGH','9888021721',NULL,'JALINDER',NULL,'4','28','PUNJAB','364000',7,NULL,3,'33','3',NULL,'1','3','UK07BD5369','04/2014',NULL,NULL,'White','Diesel',NULL,'First Owner','67000','1800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-04 11:18:27','2019-12-09 14:05:18'),(33,'RAJU','9050666685',NULL,'H.NO-124 SEC-15 SONIPAT',NULL,'16','13','SONIPAT','131001',7,NULL,3,'79','2',NULL,'3','12','HR100000','02/2018',NULL,NULL,'Blue','Diesel',NULL,'First Owner','27300','4100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-04 11:21:31','2019-12-09 14:05:20'),(34,'ANMOL','8881890000',NULL,'Saraswati Vihar, Amritsar',NULL,'14','28','PUNJAB','131001',7,NULL,3,'18','2',NULL,'1','2','PB020000','03/2016',NULL,NULL,'Black','Diesel',NULL,'Second Owner','60000','2600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-04 11:25:36','2019-12-09 14:05:20'),(35,'S B','7827806112',NULL,'Kirti Nagar',NULL,'8','10','DELHI','110001',7,NULL,3,'76','2',NULL,'3','12','DL00000','10/2016',NULL,NULL,'Blue','Diesel',NULL,'First Owner','43000','32400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-04 11:27:48','2019-12-09 14:05:16'),(36,'AKASH','9503606003',NULL,'Civil Lines, Nagpur',NULL,'11','21','MAHARASHTRA',NULL,7,NULL,3,'75','2',NULL,'3','12','MH310000','07/2014',NULL,NULL,'White','Diesel',NULL,'Second Owner','55000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-04 11:31:10','2019-12-09 14:05:19'),(37,'VISHAL','9001257557',NULL,'SS DAIRY DADA BARI',NULL,'6','29','KOTA','323031',7,NULL,3,'4','2',NULL,'1','1','RJ280000','10/2015',NULL,NULL,'White','Petrol',NULL,'Second Owner','45000','1800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-04 11:38:20','2019-12-09 14:05:19'),(38,'K S DHILLON','9988883953',NULL,'Ganpati Enclave, Bathinda',NULL,'14','28','PUNJAB','131001',7,NULL,3,'2','2',NULL,'1','1','PB03A0008','06/2014',NULL,NULL,'White','Diesel',NULL,'First Owner','34000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-04 11:41:24','2019-12-09 14:05:20'),(39,'PAYAL MITTAL','9899526546',NULL,'ANAND VIHAR EDM MALL',NULL,'8','10','delhi','110001',2,NULL,3,'6','2',NULL,'1','1','dl00000','07/2013',NULL,NULL,'Black','Diesel',NULL,'First Owner','18800','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-04 12:08:19','2019-12-09 14:05:16'),(40,'ANURAG DIXIT','9899447716',NULL,' INFRASTRUCTURE LEASING & FINA',NULL,'2','13','GURGAON','122001',11,NULL,2,'18','2',NULL,'1','2','DL2CAP6714','05/2015',NULL,NULL,'Silver','Diesel',NULL,'First Owner','44000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-05 07:34:31','2019-12-17 18:42:23'),(41,'SUMAN DASS','9836621523',NULL,'Kolkata',NULL,'24','36','Kolkata','700001',4,NULL,3,'46','3',NULL,'1','6','DL2CAT2474','03/2014',NULL,NULL,'White','Diesel',NULL,'First Owner','112000','2000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-05 08:30:04','2019-12-09 14:05:19'),(42,'SHIVAN','8607200020',NULL,'MITTAL FARM HOUSE SEC-78 NAURA',NULL,'2','13','GURGAON','122001',2,NULL,3,NULL,'3',NULL,'9','34','HR5100000','06/2016',NULL,NULL,'Blue','Diesel',NULL,'First Owner','22000','3500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-05 08:32:16','2019-12-17 18:39:13'),(43,'SONU','9829583336',NULL,'Bani Park',NULL,'3','29','JAIPUR','302001',7,NULL,3,'174','2',NULL,'12','44','RJ1400000','04/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','29500','3170000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-05 08:36:38','2019-12-09 14:05:18'),(44,'Apar Agarwal ','8958725555',NULL,'G-K -2',NULL,'8','10','DELHI','110001',2,NULL,3,'167','3',NULL,'12','43','UP16BC1270','08/2015',NULL,NULL,'White','Diesel',NULL,'Second Owner','50000','1850000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-05 08:39:00','2019-12-09 14:05:16'),(45,'DEVEN SINGH','9716789096',NULL,'Mohmmadpur Jharsa',NULL,'2','13','GURGAON','122001',7,NULL,3,'75','2',NULL,'3','12','HR2600000','05/2017',NULL,NULL,'Blue','Diesel',NULL,'First Owner','11000','3500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-05 08:41:43','2019-12-09 14:05:18'),(46,'Arvinder Singh','9811800000','NA','NARIANA',NULL,'8','10','DELHI','110001',2,NULL,6,'173','2',NULL,'12','44','DL3C0000','06/2017',NULL,NULL,'Silver','Petrol','null','First Owner','14000','2450000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-05 09:10:22','2019-12-09 14:05:16'),(47,'Anil Chawla ','9910061626','NA','B-431 MEERA BAGH PACHIM VIHAR',NULL,'8','10','DELHI','110001',4,NULL,6,'172','2',NULL,'12','44','HR260000','12/0002',NULL,NULL,'Red','Diesel','null','First Owner','11500','2100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-05 12:18:05','2019-12-09 14:05:16'),(48,'AMAN CHAUHAN','9999295398',NULL,'C-2 Oppt bus stand jank puri',NULL,'8','10','delhi','110001',11,NULL,3,'21','2',NULL,'1','2','DL8CAL5974','05/2016',NULL,NULL,'White','Diesel',NULL,'Second Owner','16000','2700000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 06:33:52','2019-12-09 14:05:16'),(49,'SHIVAM','9810540390',NULL,'DLF PH-4',NULL,'2','13','GURGAON','122001',7,NULL,3,'33','3',NULL,'1','3','HR26CC9800','09/2013',NULL,NULL,'White','Diesel',NULL,'First Owner','55000','1900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 07:28:36','2019-12-09 14:05:18'),(50,'PRADEEP MALHAN','9899172700','NA','RACE COURCE',NULL,'18','34','DEHRADUN','248001',7,NULL,6,'21','2',NULL,'1','2','UK070000','07/2015',NULL,NULL,'Black','Diesel','null','Second Owner','56000','3000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 07:51:18','2019-12-09 14:05:16'),(51,'DR.VISHAL SRIVASTAV','9919588852','NA','STAR NEURO MATERNITY CENTER SA',NULL,'20','34','GORAKHPUR','273001',7,NULL,6,'null','2',NULL,'20','77','UP32KB9991','05/2018',NULL,NULL,'White','Diesel','null','First Owner','24000','6500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 09:03:57','2019-12-17 18:39:13'),(52,'ANOOP KUMAR','8755236339','NA','BIJNOR',NULL,'25','34','HARIDWAR','273001',7,NULL,6,'2','2',NULL,'1','1','UK080000','02/2016',NULL,NULL,'White','Diesel','null','Second Owner','75000','1800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 09:06:52','2019-12-09 14:05:18'),(53,'RAMIY SINGH','8511223000',NULL,'Naroda Nagar, Rajkot',NULL,'21','12','GUJRAT','382340',7,NULL,3,'75','2',NULL,'3','12','GJ0600000','06/2015',NULL,NULL,'Brown','Diesel',NULL,'First Owner','43000','2400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 10:50:55','2019-12-09 14:05:17'),(54,'SHAAN','9575757576',NULL,'Anoop Nagar',NULL,'10','20','INDORE','452001',7,NULL,3,'65','2',NULL,'3','11',NULL,'0/0',NULL,NULL,'White','Diesel',NULL,'First Owner','57000','1900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 10:53:34','2019-12-09 14:05:18'),(55,'khushwinder SINGH','8826379689',NULL,'GOLF COURSE ROAD',NULL,'2','13','GURGAON','122001',7,NULL,3,'199','2',NULL,'12','46','HP140000','06/2015',NULL,NULL,'Black','Diesel',NULL,'First Owner','29000','6000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 10:55:53','2019-12-09 14:05:18'),(56,'VINAY GOVIL','9899031131',NULL,'SEC-15  PART-2',NULL,'2','13','GURGAON','122001',7,NULL,3,NULL,'3',NULL,'12','50','HR260000','11/2015',NULL,NULL,'White','Diesel',NULL,'First Owner','47000','5100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 10:58:02','2019-12-17 18:39:13'),(57,'NAVEEN ','9990998893',NULL,'SEC-17/18',NULL,'2','13','GURGAON','122001',7,NULL,3,'145','2',NULL,'12','42','HR26CJ5005','02/2014',NULL,NULL,'White','Diesel',NULL,'Second Owner','58000','2050000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 11:00:10','2019-12-09 14:05:17'),(58,'Tanishq','9555555353',NULL,'MATHURA',NULL,'25','34','MATHURA','281001',4,NULL,3,'196','2',NULL,'12','46','HR260000','07/2014',NULL,NULL,'White','Diesel',NULL,'First Owner','51000','4500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 11:12:25','2019-12-09 14:05:19'),(59,'Tanishq','9555555353',NULL,'MATHURA',NULL,'25','34','MATHURA','281001',4,NULL,3,'129','2',NULL,'8','29','HR26DT0273','03/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','1800','7800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-06 11:14:18','2019-12-09 14:05:19'),(60,'Nishant Pundhir ','9871877485',NULL,'A-14 BRAHMA APARTMENTS PLOT NO',NULL,'8','10','DELHI','110075',2,NULL,3,'18','2',NULL,'1','2','DL2CAT1099','06/2014',NULL,NULL,'White','Diesel',NULL,NULL,'32300','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-07 10:08:26','2019-12-09 14:05:16'),(61,'SANYAM ARORA','9812039899',NULL,'Sadhr Bazar',NULL,'23','13','KARNAL','132001',7,NULL,3,'3','2',NULL,'1','1','UK07BN5000','09/2014',NULL,NULL,'Brown','Diesel',NULL,'First Owner','61000','1495000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-07 10:11:23','2019-12-09 14:05:19'),(62,'ROMY WALIA','9810921536',NULL,'VATIKA SEVEN LEMNS POWER TOWER',NULL,'2','13','GURGAON','122001',7,NULL,3,'175','2',NULL,'12','44','MH03CS1619','08/2017',NULL,NULL,'Blue','Diesel',NULL,'First Owner','12000','3200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-07 12:23:16','2019-12-09 14:05:18'),(63,'SHRIKANT','9421812400',NULL,'Bhosari Sector 4',NULL,'26','21','PUNE','111045',7,NULL,3,'175','2',NULL,'12','44','MH14EC6063','09/2014',NULL,NULL,'White','Diesel',NULL,'First Owner','50000','2400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-07 12:25:21','2019-12-09 14:05:20'),(64,'JAZZY DEALER','9711197888',NULL,'ASHOK VIHAR',NULL,'8','10','DELHI','110001',7,NULL,3,'161','2',NULL,'12','42','CH00000','09/2018',NULL,NULL,'Blue','Diesel',NULL,'First Owner','13510','4951000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-07 12:27:18','2019-12-09 14:05:16'),(65,'VISHAL','9215015501',NULL,'GURGAON',NULL,'2','13','GURGAON','122001',11,NULL,3,'226','3',NULL,'16','62','HR2600000','0/0',NULL,NULL,'Blue','Petrol',NULL,'First Owner','35000','5000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-09 08:31:24','2019-12-09 14:05:18'),(66,'HARI /DEALER','9643102641',NULL,'ASHOK VIHAR',NULL,'8','10','DELHI','110001',7,NULL,3,'154','2',NULL,'12','42','HR91 TEMP0000','03/2019',NULL,NULL,'Black','Diesel',NULL,'First Owner','6500','5700000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-09 10:32:23','2019-12-09 14:05:17'),(67,'SHAILESH DEALER','9822268152',NULL,NULL,NULL,'19','11',NULL,'403110',7,NULL,3,'161','2',NULL,'12','42','HR26CW0000','01/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','5118','4900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-09 10:38:17','2019-12-17 18:33:56'),(68,'NISHANT GOYAL','9878000180',NULL,'H.NO-3135 Sector 20D, Chandiga',NULL,'17','6','CHANDIGARH',NULL,7,NULL,3,'148','2',NULL,'12','42','CH01AX0000','08/2013',NULL,NULL,'Silver','Diesel',NULL,'Second Owner','10000','30000000',NULL,'Y',NULL,NULL,NULL,NULL,NULL,'2019-12-09 12:37:39','2019-12-09 13:59:21'),(69,'SANDEEP','9872705004',NULL,'Sector 52',NULL,'17','6','CHANDIGARH',NULL,7,NULL,2,'17','2',NULL,'1','1','CH01AZ9292','5/2014',NULL,NULL,'White','Diesel',NULL,'Second Owner','60000','1700000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-09 12:40:02','2019-12-17 18:42:23'),(70,'AMAN','9988311605',NULL,'NK SHARMA OFFICE CHANDIGARH AM',NULL,'17','6','CHANDIGARH',NULL,7,NULL,3,'21','2',NULL,'1','2','CH101(T)0973','11/2018',NULL,NULL,'White','Diesel',NULL,'First Owner','56000','3800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-09 12:42:16','2019-12-09 13:59:21'),(71,'ABHIMANYU GROVER','9041012100',NULL,'SEC-18 H.NO-1560',NULL,'17','6','Chandigarh',NULL,7,NULL,3,'63','2',NULL,'3','11','CHAX10000','02/2013',NULL,NULL,'White','Diesel',NULL,'First Owner','46000','2000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-09 12:44:29','2019-12-09 13:59:21'),(72,'ROHIT MOHANTY','7854999997',NULL,'ODISHA',NULL,'15','26',NULL,NULL,4,NULL,3,'249','3',NULL,'20','73','PY050088','0/0',NULL,NULL,'White','Diesel','Automatic','Third Owner','46000','3900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-10 07:19:31','2019-12-10 07:19:31'),(73,'ROHIT MOHANTY','7854999997',NULL,'ODISHA',NULL,'8','26',NULL,NULL,4,NULL,3,'133','2',NULL,'8','32','OD02BB1100','12/2018',NULL,NULL,'White','Diesel','Automatic','First Owner','17000','3000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-10 07:21:39','2019-12-17 18:30:16'),(74,'Punit Baniwal/DEALER ','8929010664',NULL,'C-4 RAJOURI GARDEN',NULL,'8','10',NULL,'110001',2,NULL,3,'119','2',NULL,'3','20','HR2600000','07/2017',NULL,NULL,'White','Diesel','Automatic','First Owner','15000','8400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-10 07:23:46','2019-12-10 07:23:46'),(75,'SANZEEV BHATIA','9810620431',NULL,'Connaught Place, BANGLA SHAIB ',NULL,'8','10',NULL,'110001',7,NULL,3,'32','3',NULL,'1','3','DL8CA00000','02/2015',NULL,NULL,'Gray','Diesel','Automatic','First Owner','53500','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-10 10:53:58','2019-12-10 10:53:58'),(76,'MODI /DEALER','9619720925',NULL,'CEEJAY HOUSE WORLI',NULL,'12',NULL,NULL,NULL,7,NULL,3,NULL,'3',NULL,'9','38','UNREGISTRED','0/2018',NULL,NULL,'Silver','Petrol','Automatic','Many','10919','44500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-10 10:57:32','2019-12-17 18:39:13'),(77,'SAHIL/DEALER/BHARTI ARITEL','9899944198',NULL,'KAROL BAGH',NULL,'8','10',NULL,'110001',7,NULL,3,NULL,'3',NULL,'9','38','CH0000','07/2017',NULL,NULL,'Blue','Diesel','Automatic','First Owner','50000','3250000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-10 11:01:43','2019-12-17 18:39:14'),(78,'KIRTAN MANCHADA DEALER','8285195067',NULL,'PATEL NAGAR',NULL,'8','10',NULL,'110001',7,NULL,3,NULL,'3',NULL,'12','50','DL0000','09/2019',NULL,NULL,'Blue','Diesel','Automatic',NULL,'5150','6825000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-10 11:04:03','2019-12-17 18:39:14'),(79,'SACHIN YADAV','9811072024',NULL,'Pitampura, Delhi,',NULL,'8',NULL,NULL,'110001',7,NULL,3,'32','3',NULL,'1','3','DL00000','07/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','65000','2650000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 08:45:37','2019-12-11 11:29:22'),(80,'PRAKASH SHARMA','8851743021',NULL,'H.NO-127 SEC-30 FARIDABAD',NULL,'27',NULL,NULL,NULL,2,NULL,3,'62','2',NULL,'3','11','HR26DC3739','01/2016',NULL,NULL,'Blue','Diesel','Automatic','Second Owner','30000','2500000',NULL,'N',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 09:23:12','2019-12-11 12:28:34'),(81,'PRAKASH SHARMA','8851743021',NULL,'H.NO-127 SEC-30 FARIDABAD',NULL,'27',NULL,NULL,NULL,2,NULL,3,'62','2',NULL,'3','11','HR26DC3739','0/0',NULL,NULL,'Blue','Diesel','Automatic','Second Owner','30000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 09:26:40','2019-12-11 11:29:22'),(82,'NIMISH MITTAL','8588808268',NULL,'PRITAM PURA DELHI',NULL,'8',NULL,NULL,'110001',2,NULL,3,'115','3',NULL,'3','19','HR100000','08/2016',NULL,NULL,'Blue','Diesel','Automatic','First Owner','70000','1900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 09:29:18','2019-12-11 11:29:22'),(83,'AAYUSH','9711339929',NULL,'PRITAM PURA DELHI',NULL,'8',NULL,NULL,NULL,2,NULL,3,'62','2',NULL,'3','11','DL7CT0000','06/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','35000','1900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 09:31:13','2019-12-11 11:29:22'),(84,'ANUJ','9717332298',NULL,'OKHLA DELHI',NULL,'8',NULL,NULL,NULL,2,NULL,3,NULL,'2',NULL,'8','28','DL6CM5628','0/0',NULL,NULL,'Black','Diesel','Automatic','First Owner','57000','2300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 09:32:45','2019-12-17 18:39:14'),(85,'PANKAJ SHARMA','9212079219',NULL,NULL,NULL,'8',NULL,NULL,NULL,2,NULL,3,NULL,'2',NULL,'1','4','DL3CCF0600','10/2011',NULL,NULL,'White','Petrol','Automatic','First Owner','50000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 09:34:32','2019-12-17 18:39:14'),(86,'VIPUL KAPILA','9873200004',NULL,'RIGAL GARDEN SEC-90 GURGAON',NULL,'2',NULL,NULL,NULL,2,NULL,3,'167','3',NULL,'12','43','UK07BL5151','03/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','54000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 09:36:58','2019-12-11 11:29:23'),(87,'SACHIN','9250092501',NULL,'NOIDA',NULL,'13',NULL,NULL,NULL,2,NULL,3,'62','2',NULL,'3','11','up160000','04/2015',NULL,NULL,'Black','Diesel','Automatic','First Owner','28000','3000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 11:40:22','2019-12-11 13:29:49'),(88,'SAKET','9837060222',NULL,'KARNAL',NULL,'23',NULL,NULL,NULL,4,NULL,3,'115','3',NULL,'3','19','hr00000','06/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','45000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 11:42:38','2019-12-11 13:29:49'),(89,'NARESH SHARMA/ROSHNI BULDTECH ','9971006281',NULL,'A-2/147 1ST FLOOR JANK PURI',NULL,'8',NULL,NULL,NULL,4,NULL,3,'20','2',NULL,'1','2','DL2CAT5747','11/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','37000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 11:45:08','2019-12-11 13:29:49'),(90,'RAJEEV VERMA','8860662993',NULL,'H.NO-5041,ATS PRISTINE SEC-150',NULL,'13',NULL,NULL,NULL,2,NULL,3,'36','3',NULL,'1','5','DL2CAT5262','08/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','40000','2090000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 11:47:20','2019-12-11 13:29:49'),(91,'vivek','7840006646',NULL,'delhi',NULL,'8','10',NULL,NULL,2,NULL,3,NULL,'2',NULL,'8','28','up160000','06/2017',NULL,NULL,'White','Diesel','Automatic','First Owner','20000','5500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-11 12:31:30','2019-12-17 18:39:14'),(92,'DARSHAN ARORA','9899775577',NULL,'SEC-43 SUSHANT LOK PH-1',NULL,'2','13',NULL,'122001',7,NULL,3,'55','8',NULL,'1','7','HR26CP0531','07/2015',NULL,NULL,'Blue','Diesel','Automatic','First Owner','50000','1450000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-12 11:47:15','2019-12-12 11:47:15'),(93,'SURESH GUPTA','9915984000',NULL,'Bade wala road Bharat Nagar',NULL,'5','28',NULL,NULL,7,NULL,3,NULL,'2',NULL,'12','46','UK070000','10/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','95000','700000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-12 11:49:44','2019-12-17 18:39:14'),(94,'MOHIT/DEALER','8872221786',NULL,'PH-2',NULL,'17','6',NULL,NULL,7,NULL,3,NULL,'3',NULL,'16','62','HR260000','11/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','54000','4500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-12 12:18:43','2019-12-17 18:39:14'),(95,'AKHIESH PANDEY','8527803281',NULL,'GURGAON',NULL,'2','13',NULL,NULL,2,NULL,3,'170','2',NULL,'12','44','HR260000','09/2017',NULL,NULL,'Blue','Petrol','Automatic','First Owner','11637','2850000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-12 12:20:53','2019-12-12 12:20:53'),(96,'ANAND PANDEY','8840838080',NULL,'GOMTI NAGAR',NULL,'8','34',NULL,NULL,7,NULL,3,'149','2',NULL,'12','42','UP320000','10/2018',NULL,NULL,'Blue','Diesel','Automatic','First Owner','1900','5800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-12 12:23:54','2019-12-17 18:30:17'),(97,'KRISHAN','9810923115',NULL,'OLD DLF',NULL,'2','13',NULL,NULL,7,NULL,3,'21','2',NULL,'1','2','HR260000','07/2015',NULL,NULL,'Gray','Diesel','Automatic','First Owner','55000','2550000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-12 12:25:44','2019-12-12 12:25:44'),(98,'TAUSIF','9756200222',NULL,'DLF City Phase 5 SEC-54',NULL,'2','13',NULL,'122001',7,NULL,2,'52','8',NULL,'1','7','HR26CJ7288','4/2014',NULL,NULL,'Silver','Diesel','Automatic','First Owner','47000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 12:47:01','2019-12-17 18:28:51'),(99,'SACHINT','9756200222',NULL,'MUMBAI',NULL,'12','20',NULL,NULL,7,NULL,3,'46','3',NULL,'1','6','UK070000','08/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','35000','3500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 12:48:58','2019-12-13 12:48:58'),(100,'NISHANT','8755833300',NULL,'Missar Wala Kala, Doiwala',NULL,'18','35',NULL,NULL,7,NULL,3,'219','9',NULL,'12','53','UK07BS2200','09/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','57500','1650000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 12:52:55','2019-12-13 12:52:55'),(101,'ARSHIT JAIN','9997370007','NA','H.NO-67/2 GALI NO-1 MADUBEN EN',NULL,'18','35',NULL,'NA',7,NULL,6,'145','2',NULL,'12','42','HR26CD6507','09/2013',NULL,NULL,'White','Diesel','Automatic','First Owner','48500','2400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 12:58:18','2019-12-13 12:58:18'),(102,'HARPREET','8283066638',NULL,'H.NO-12302 SANGEET CINEMA COMP',NULL,'5','28',NULL,NULL,7,NULL,3,NULL,'9',NULL,'12','85','PB100000','06/2014',NULL,NULL,'Black','Diesel','Automatic','First Owner','41000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 13:03:03','2019-12-17 18:39:15'),(103,'RUPESH GUPTA','9815224365',NULL,'LUDHIANA',NULL,'5','28',NULL,NULL,7,NULL,3,'75','2',NULL,'3','12','PB100000','08/2016',NULL,NULL,'White','Diesel','Automatic','Second Owner','16000','3000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 13:05:32','2019-12-13 13:05:32'),(104,'ARPIT GUPTA','9855515666',NULL,'CHEMA CHOWK',NULL,'5','28',NULL,NULL,7,NULL,3,'96','2',NULL,'3','14','PB100000','03/2016',NULL,NULL,'Black','Diesel','Automatic','First Owner','13500','3200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 13:09:57','2019-12-13 13:09:57'),(105,'HARINDER SINGH','9876108045',NULL,'MALL ROAD',NULL,'5','28',NULL,NULL,7,NULL,3,'217','3',NULL,'12','49','CH010000','09/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','38000','5000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 13:12:30','2019-12-13 13:12:30'),(106,'ABHINAV ','8881773196',NULL,'ahmedabad',NULL,'21','12',NULL,NULL,7,NULL,3,'219','9',NULL,'12','53','GJ01RS0343','11/2013',NULL,NULL,'White','Diesel','Automatic','Second Owner','34000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-13 13:15:41','2019-12-13 13:15:41'),(107,'HARSH','9990448443',NULL,'C-161 DEFENCE COLONY',NULL,'8','10',NULL,'110001',7,NULL,3,NULL,'1',NULL,'13','56','HR26CS4346','01/2014',NULL,NULL,'Gray','Diesel','Automatic','Second Owner','14800','1900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-14 09:56:51','2019-12-17 18:39:15'),(108,'CHETANYA SONI','9479611111',NULL,'Pacasiya, Indore',NULL,'10','20',NULL,NULL,7,NULL,3,'171','2',NULL,'12','44','MP09CS1233','08/2015',NULL,NULL,'White','Diesel','Automatic','Second Owner','43000','2300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-14 09:58:54','2019-12-14 09:58:54'),(109,'MASOOD CHHABRA','9818386676',NULL,'Hauz Khas',NULL,'8','10',NULL,'110001',7,NULL,3,'147','2',NULL,'12','42','DL8CA00000','07/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','34100','2050000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-14 10:00:52','2019-12-14 10:00:52'),(110,'EKANT','9855555076',NULL,'AIRPORT AREA',NULL,'17','6',NULL,NULL,7,NULL,3,NULL,'3',NULL,'9','38','CH010000','09/2016',NULL,NULL,'Blue','Diesel','Automatic','First Owner','70000','3100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-14 10:21:40','2019-12-17 18:39:15'),(111,'KULWINDER SINGH','9815836370',NULL,'Model Gram',NULL,'5','28',NULL,NULL,7,NULL,3,NULL,'3',NULL,'9','34','CH010000','07/2015',NULL,NULL,'Red','Diesel','Automatic','First Owner','22000','3350000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-14 10:31:06','2019-12-17 18:39:15'),(112,'SHUBHAM KUMAWAT','8385876891',NULL,'Govindpura, Jaipur',NULL,'3','29',NULL,NULL,7,NULL,3,'36','3',NULL,'1','5','RJ14ZC2361','08/2017',NULL,NULL,'Blue','Diesel','Automatic','First Owner','33500','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-14 11:54:04','2019-12-14 11:54:04'),(113,'KAPIL','9205810410',NULL,'PRITAM PURA',NULL,'1','10',NULL,NULL,7,NULL,3,'25','2',NULL,'1','2','HR51BB9054','11/2014',NULL,NULL,'Black','Diesel','Automatic','First Owner','25000','2300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-14 11:58:11','2019-12-14 11:58:11'),(114,'S P SINGH','9358412100',NULL,'MEERUT',NULL,'25','34',NULL,NULL,7,NULL,3,'48','3',NULL,'1','6','UP160000','11/2018',NULL,NULL,'White','Diesel','Automatic','First Owner','18000','5800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-14 12:18:23','2019-12-14 12:18:23'),(115,'BHASKAR CHOUDHARY','9332084086',NULL,' INFRASTRUCTURE LEASING & FINA',NULL,'2','13',NULL,'122001',11,NULL,3,'25','2',NULL,'1','2','DL2CAP6714','06/2016',NULL,NULL,'Silver','Diesel','Automatic','First Owner','44000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 10:04:45','2019-12-16 10:04:45'),(116,'NISHANT','8630634442',NULL,'ALIGARH',NULL,'8','34',NULL,NULL,2,NULL,2,'1','2',NULL,'1','1','UK070000','10/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','21000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 10:40:07','2019-12-17 18:34:35'),(117,'NAVDEEP BAIDWAN','9650600219',NULL,'A-8 SEC-107',NULL,'13','34',NULL,NULL,7,NULL,3,'1','2',NULL,'1','1','UP160000','09/2018',NULL,NULL,'Red','Diesel','Automatic','First Owner','11000','3500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 11:29:33','2019-12-16 11:29:33'),(118,'Rahul Dhawan','9810012845',NULL,'S-35 PANCHSHEEL PARK',NULL,'8','10',NULL,NULL,11,NULL,3,'75','2',NULL,'3','12','UP160000','08/2017',NULL,NULL,'White','Diesel','Automatic','First Owner','28000','4000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 11:32:39','2019-12-16 11:32:39'),(119,'NARENDER SINGH','8929010659',NULL,'C-5 RAJOURI GARDEN RING ROAD',NULL,'8','10',NULL,NULL,2,NULL,3,'120','2',NULL,'3','20','HR260000','11/2017',NULL,NULL,'White','Diesel','Automatic','First Owner','15000','7500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 11:36:53','2019-12-16 11:36:53'),(120,'DANISH','8808066664',NULL,'Arya Nagar, Kanpur,',NULL,'23','34',NULL,NULL,2,NULL,3,'62','2',NULL,'3','11','HR','09/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','15000','2200002',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 12:02:10','2019-12-17 18:30:49'),(121,'MANU GARG','9711309309',NULL,'Paschim Vihar,',NULL,'8','10',NULL,NULL,7,NULL,3,'25','2',NULL,'1','2','HR00000','05/2014',NULL,NULL,'Silver','Diesel','Automatic','First Owner','21000','1999999',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 12:04:23','2019-12-16 12:04:23'),(122,'AJAY SINGH','9721421177',NULL,'Aliganj',NULL,'8','34',NULL,NULL,7,NULL,3,'1','2',NULL,'1','1','up320000','08/2018',NULL,NULL,'White','Diesel','Automatic','First Owner','16500','3300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 12:45:43','2019-12-17 18:30:17'),(123,'SACHIN YADAV','9899190708',NULL,'SEC-51 OCUS QUANTAM MALL',NULL,'2','13',NULL,NULL,2,NULL,3,'46','3',NULL,'1','6','HR260000','09/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','50000','2800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 13:11:59','2019-12-16 13:11:59'),(124,'AJAY SINGH','9721421177',NULL,'Aliganj',NULL,'23','34',NULL,NULL,7,NULL,3,'1','2',NULL,'1','1','UP320000','09/2018',NULL,NULL,'White','Diesel','Automatic','First Owner','16500','3300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 13:15:26','2019-12-16 13:15:26'),(125,'DIMPLE BANSAL','9814114085',NULL,'CHANBDIGARH',NULL,'17','28',NULL,NULL,7,NULL,3,'171','2',NULL,'12','44','CH00000','08/2015',NULL,NULL,'White','Diesel','Automatic',NULL,'55000','3000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-16 13:17:37','2019-12-16 13:17:37'),(126,'MANISH MISHRA','8422999725',NULL,'EVERSHINE COSMIC OPP INFINITI ',NULL,'12','21',NULL,NULL,13,NULL,3,'16','2',NULL,'1','1','MH06BB8886','07/2013',NULL,NULL,'Black','Petrol','Automatic','First Owner','68000','1400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-17 11:26:03','2019-12-17 13:16:05'),(127,'SUMAN','6292206216','NA','A-47 MATHURA ROAD BLOCK -B',NULL,'8','10',NULL,'NA',6,NULL,2,'48','3',NULL,'1','6','WB20AG1370','07/2014',NULL,NULL,'Blue','Diesel','Automatic','Second Owner','49000','2250000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-17 11:32:17','2019-12-17 11:32:17'),(128,'MAHESH SHAH','9322270210',NULL,'DELHI',NULL,'8','10',NULL,NULL,4,NULL,3,'4','2',NULL,'1','1','MH04GJ5072','10/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','50000','2000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-17 11:53:23','2019-12-17 11:53:23'),(129,'Nakul Malhotra','8826288422',NULL,'GAGAN VIHAR',NULL,'8','10',NULL,NULL,13,NULL,6,NULL,'2',NULL,'1','1','DL7CK4749','7/2010',NULL,NULL,'White','Petrol','Automatic','First Owner','42000','1000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-17 12:39:06','2019-12-17 18:39:49'),(130,'RAJINDER SINGH','9811299566',NULL,'MAHARANI BAGH',NULL,'8','10',NULL,NULL,2,NULL,3,'149','2',NULL,'12','42','DL8CA0000','04/2011',NULL,NULL,'Silver','Diesel','Automatic','First Owner','80000','1100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-17 12:41:25','2019-12-17 12:41:25'),(131,'VARCHASV GARG','9910076877','NA','H.NO-2 SECOND FLOOR POCKET NO-',NULL,'8','10',NULL,'NA',2,NULL,2,'96','2',NULL,'3','14','NA','04/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','12500','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-17 12:43:18','2019-12-17 12:43:18'),(132,'Rajiv Goyal','9818833300','NA','NA',NULL,'8','10',NULL,'NA',13,NULL,6,'null','2',NULL,'1','4','DL1CU6940','08/2012',NULL,NULL,'Gray','Diesel','Automatic','Second Owner','50000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-17 12:45:36','2019-12-17 18:39:49'),(133,'Shrivasthav','8904061334','shrivasthav18151@gmail.com','Gayatri Tech park,EPIP Area wh',NULL,'1','1',NULL,'560066',9,NULL,4,'null','1',NULL,'6','83','dfghgh4555','01/2019',NULL,NULL,'Beige','Diesel','Manual','Second Owner','560066','563256536',NULL,'N',NULL,NULL,NULL,NULL,'Loan','2019-12-17 17:04:19','2019-12-18 04:35:22'),(134,'PADAM','9911796128','PADAM@GMAIL.COM','SEC-21',NULL,'2','13',NULL,'122001',2,NULL,2,'64','2',NULL,'3','11','UP84S0099','09/2016',NULL,NULL,'Black','Diesel','Automatic','First Owner','57000','2000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 09:33:40','2019-12-18 09:33:40'),(135,'DR.R B GUTA','9810287548','gupta@gmail.com','SEC-10A',NULL,'2','13',NULL,'122001',2,NULL,2,'36','3',NULL,'1','5','HR269616','05/2014',NULL,NULL,'White','Diesel','Automatic','Second Owner','50000','1600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 09:36:18','2019-12-18 09:36:18'),(136,'ABHISHEK MATHUR','9654999687','abhishek@gmail.com','WESTEN GREENS',NULL,'2','13',NULL,'122001',13,NULL,2,'48','3',NULL,'1','6','HR51AB1441','06/2011',NULL,NULL,'Silver','Diesel','Automatic','Second Owner','96000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 09:39:01','2019-12-18 09:39:01'),(137,'ANKIT /DELAER','9873267133','ankit@gmail.com','karol bhag',NULL,'8','10',NULL,'110001',2,NULL,3,'','3',NULL,'12','50','DL1CZ7450','10/2018',NULL,NULL,'Blue','Diesel','Automatic','First Owner','6000','7900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 09:40:52','2019-12-18 09:40:52'),(138,'Rahul AGGARWAL','9818210882','rahul@gmail.com','C-16 SECOND FLOOR HOUSING SOCI',NULL,'8','10',NULL,'110001',13,NULL,3,'2','2',NULL,'1','1','DL7CN3301','09/2012',NULL,NULL,'Black','Diesel','Automatic','First Owner','60000','1200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 09:43:32','2019-12-18 09:43:32'),(139,'NITIN RATHI','8527690714','NITIN@GMAIL.COM','CENTRAL SRORE SHRI BALAJI BUIL',NULL,'2','13',NULL,'122001',7,NULL,2,'21','2',NULL,'1','2','HR26CX0011','09/2016',NULL,NULL,'Blue','Diesel','Automatic','First Owner','49000','3000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 12:24:27','2019-12-18 12:24:27'),(140,'ABHAY ','9560028457','ABHAY@GMAIL.COM','H.NO-1863 SEC-4',NULL,'2','13',NULL,'122001',4,NULL,3,'175','2',NULL,'12','44','HR260000','10/2015',NULL,NULL,'Blue','Diesel','Automatic','First Owner','22000','3200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 12:53:32','2019-12-18 12:53:32'),(141,'ANKIT VERMA','7007246399',NULL,'LUCKNOW',NULL,'20','34',NULL,NULL,7,NULL,3,'3','2',NULL,'1','1','UP320000','09/2018',NULL,NULL,'White','Diesel','Automatic','First Owner','16500','3100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 13:11:53','2019-12-18 13:11:53'),(142,'MANAK','7851929334',NULL,'SOUTH EXESS',NULL,'8','10',NULL,NULL,4,NULL,3,'148','2',NULL,'12','42','DL0000','08/2014',NULL,NULL,'White','Diesel','Automatic','Second Owner','62000','1800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-18 13:15:19','2019-12-18 13:15:19'),(143,'RAJU','9050666685',NULL,'H.NO-124 SEC-15 SONIPAT',NULL,'16','13',NULL,NULL,7,NULL,3,'79','2',NULL,'3','12','HR100000','06/2018',NULL,NULL,'Blue','Diesel','Automatic','First Owner','27300','4100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 06:03:00','2019-12-19 06:03:00'),(144,'SANYAM ARORA','9812039899','NA','876 SEC-6',NULL,'23','13',NULL,'NA',7,NULL,2,'3','2',NULL,'1','1','UK07BN5000','05/2014',NULL,NULL,'Brown','Diesel','Automatic','First Owner','61000','1495000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 06:05:27','2019-12-19 06:05:27'),(145,'ANAND PANDEY','8840838080',NULL,'GOMTI NAGAR',NULL,'18','34',NULL,NULL,7,NULL,3,'161','2',NULL,'12','42','UP320000','10/2018',NULL,NULL,'Blue','Diesel','Automatic','First Owner','1900','5800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 11:59:10','2019-12-19 11:59:10'),(146,'DANISH','8808066664',NULL,NULL,NULL,'22','34',NULL,NULL,7,NULL,3,'62','2',NULL,'3','11','UP78DX0006','10/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','15000','1800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 12:01:26','2019-12-19 12:01:26'),(147,'REHMAN','9807467917',NULL,'89/194 SHOAN LAL COMPOUND BANS',NULL,'20','34',NULL,NULL,7,NULL,3,'147','2',NULL,'12','42','UP16AY0999','01/2015',NULL,NULL,'White','Diesel','Automatic','Second Owner','29000','2599999',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 12:08:19','2019-12-19 12:08:19'),(148,'ANIL WEADHWA','9899600402',NULL,'SEC-4 2058 OPP SWARN JYANTI',NULL,'2','13',NULL,'122001',11,NULL,3,'79','2',NULL,'3','12','HR26CP5476','08/2015',NULL,NULL,'Black','Diesel','Automatic','First Owner','26000','2600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 12:10:15','2019-12-19 12:10:15'),(149,'O P YADAV','9811233862','NA','SOUTH CITY -1',NULL,'2','13',NULL,'NA',13,NULL,6,'32','3',NULL,'1','3','HR260000','06/2011',NULL,NULL,'White','Diesel','Automatic','null','700000','1200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 12:12:14','2019-12-19 12:12:14'),(150,'Jagdish','7838948151',NULL,'KALANDI COLLEGE PATEL NAGAR',NULL,'8','10',NULL,NULL,13,NULL,3,'32','3',NULL,'1','3','CH0073','08/2012',NULL,NULL,'Black','Diesel','Automatic','Second Owner','45000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 12:14:25','2019-12-19 12:14:25'),(151,'YADAV','9451691835',NULL,'Kakadev, Kanpur,',NULL,'20','34',NULL,NULL,7,NULL,3,'62','2',NULL,'3','11','UP78 EF 0101','06/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','25000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 12:16:29','2019-12-19 12:16:29'),(152,'RISHI GUPTA','9815743535',NULL,'Civil Line',NULL,'5','28',NULL,NULL,7,NULL,3,'33','3',NULL,'1','3','pb10','06/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','60500','2599000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-19 12:34:45','2019-12-19 12:34:45'),(153,'ABHISHEK AGGARWAL','9999606901',NULL,'DIFFENCE COLONY I-16 BIRABAL R',NULL,'8','10',NULL,NULL,2,NULL,3,'167','3',NULL,'12','43','dl00000','05/2016',NULL,NULL,'Silver','Diesel','Automatic','Second Owner','16000','2600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 11:06:16','2019-12-20 11:06:16'),(154,'Madhur','9625050611',NULL,'GOLF COURES ROAD',NULL,'2','13',NULL,NULL,2,NULL,3,'108','3',NULL,'3','17','dl0000','06/2017',NULL,NULL,'Blue','Diesel','Automatic','First Owner','26500','3400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 11:08:53','2019-12-20 11:08:53'),(155,'DR.SIMRAN PAL SINGH','9542000009',NULL,'20-F Shaheed Bhagat Singh Naga',NULL,'5','28',NULL,NULL,7,NULL,3,'21','2',NULL,'1','2','CH01BQ','10/2017',NULL,NULL,'Black','Diesel','Automatic','First Owner','25000','3550000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 11:50:22','2019-12-20 11:50:22'),(156,'RAJA PRATAP/DEALER','7009740081',NULL,'Anupam Vihar',NULL,'4','28',NULL,NULL,7,NULL,3,'34','3',NULL,'1','3','UK07','07/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','67000','2150000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 11:52:45','2019-12-20 11:52:45'),(157,'CHITRANJAN TYAGI','9870427744',NULL,'Malibu Town,SOHNA ROAD',NULL,'2','13',NULL,NULL,7,NULL,3,'98','3',NULL,'3','15','CH01BF2943','07/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','29300','4500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 11:54:34','2019-12-20 11:54:34'),(158,'SIDDHANT SARA','8527201557',NULL,'Sector 15A, ',NULL,'17','28',NULL,NULL,7,NULL,3,'76','2',NULL,'3','12','CH01BH1115','06/2016',NULL,NULL,'Black','Diesel','Automatic','First Owner','40000','2800000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 11:56:41','2019-12-20 11:56:41'),(159,'ROHIT RANJAN','9643195196',NULL,'DEHRADUN',NULL,'18','34',NULL,NULL,13,NULL,3,'','2',NULL,'3','11','HR5AD8208','08/2009',NULL,NULL,'Gray','Petrol','Automatic','Second Owner','70000','600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 11:58:49','2019-12-20 11:58:49'),(160,'ANSHUMAN SHARMA','9958557488',NULL,'JANG PURA ',NULL,'8','10',NULL,NULL,13,NULL,3,'','2',NULL,'3','11','HR510000','08/2011',NULL,NULL,'Black','Petrol','Automatic','Second Owner','64000','1200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 12:01:06','2019-12-20 12:01:06'),(161,'Bharat MISHRA','8726666606',NULL,'delhi',NULL,'8','10',NULL,NULL,1,NULL,3,'228','3',NULL,'16','62','dl0000','07/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','400000','3500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 12:10:32','2019-12-20 12:10:32'),(162,'ATUL','9899528600',NULL,'R-9/228 SEC-9 RAJ NAGAR',NULL,'13','34',NULL,NULL,13,NULL,3,'96','2',NULL,'3','14','up140000','07/2014',NULL,NULL,'Black','Diesel','Automatic','First Owner','68000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-20 12:13:45','2019-12-20 12:13:45'),(163,'Kshitiz CHOUDHARY','8860362500',NULL,'74A-R BLOCK DILSHAD  GARDEN',NULL,'8','10',NULL,NULL,8,NULL,3,'46','3',NULL,'1','6','UP17K9000','06/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','45000','3700000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 05:57:49','2019-12-23 05:57:49'),(164,'GURMEET AHUJA','8800094778',NULL,'5 D-26 INT FARIDABAD',NULL,'27','13',NULL,NULL,4,NULL,3,'78','2',NULL,'3','12',NULL,'07/2010',NULL,NULL,'Silver','Diesel','Automatic','First Owner','100000','900000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 05:59:41','2019-12-23 05:59:41'),(165,'SANYAM','9215503949',NULL,'SEC-7 ',NULL,'23','13',NULL,NULL,7,NULL,3,'2','2',NULL,'1','1','HR05AM0051','02/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','53000','1600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 06:01:52','2019-12-23 06:01:52'),(166,'PRINCE','9086182727',NULL,'Sector 20D',NULL,'17','28',NULL,NULL,7,NULL,3,'2','2',NULL,'1','1','CH010000','09/2015',NULL,NULL,'Red','Diesel','Automatic','First Owner','21000','2400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 07:50:41','2019-12-23 07:50:41'),(167,'KulJEET gill','9878716892',NULL,'3361 RANJIT AVENUE',NULL,'5','28',NULL,NULL,7,NULL,3,'','2',NULL,'12','88','PB020000','06/2014',NULL,NULL,'Silver','Diesel','Automatic','Second Owner','28000','2099999',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 07:53:32','2019-12-23 07:53:32'),(168,'MOHIT','9872447711',NULL,'Sector 16',NULL,'17','28',NULL,NULL,7,NULL,3,'108','3',NULL,'3','17','CH01AX0608','04/2014',NULL,NULL,'White','Diesel','Automatic','Second Owner','67000','2185000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 08:41:45','2019-12-23 08:41:45'),(169,'Shyam Kalra ','9810015988',NULL,'LAGOON APPMENT',NULL,'2','13',NULL,NULL,13,NULL,3,'113','3',NULL,'3','19','HR26AK9091','08/2011',NULL,NULL,'Red','Diesel','Automatic','First Owner','53000','1300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 08:50:23','2019-12-23 08:50:23'),(170,'NARENDER KHURANA','9810076625',NULL,'GURGAON',NULL,'2','13',NULL,NULL,13,NULL,3,'113','3',NULL,'3','19','HR26BH1668','05/2012',NULL,NULL,'Blue','Diesel','Automatic','First Owner','54000','1000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 08:53:18','2019-12-23 08:53:18'),(171,'Sahej','9999995353',NULL,'8 rajendra park rajender nagar',NULL,'8','10',NULL,NULL,4,NULL,3,'75','2',NULL,'3','12',NULL,'07/2012',NULL,NULL,'White','Diesel','Automatic','First Owner','75000','1300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 12:10:45','2019-12-23 12:10:45'),(172,'SURAJ GOENKA','9711404090',NULL,'SEC-24',NULL,'2','13',NULL,NULL,7,NULL,3,'147','2',NULL,'12','42','HR260000','07/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','47500','3250000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 12:13:04','2019-12-23 12:13:04'),(173,'MOHIT NAGPAL','9728100640',NULL,'Industrial Area, Chandigarh',NULL,'17','28',NULL,NULL,7,NULL,3,'75','2',NULL,'3','12','CH010000','09/2019',NULL,NULL,'Blue','Diesel','Automatic','First Owner','100000','4500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 12:16:46','2019-12-23 12:16:46'),(174,'RAHUL BEDI','7888464490',NULL,'Gujrawali Basti SUNDER NAGAR',NULL,'5','28',NULL,NULL,7,NULL,3,'175','2',NULL,'12','44','PB02AA2424','04/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','13500','2350000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 12:18:36','2019-12-23 12:18:36'),(175,'PARVESH','8053867764',NULL,'Sector 1',NULL,'15','13',NULL,NULL,7,NULL,3,'36','3',NULL,'1','5','HR0200','08/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','64000','1600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 12:22:39','2019-12-23 12:22:39'),(176,'RISHI GUPTA','9815743535',NULL,'Civil Line COOLEGE ROAD',NULL,'5','28',NULL,NULL,7,NULL,3,'33','3',NULL,'1','3','PB10','09/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','60500','2599999',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-23 12:32:33','2019-12-23 12:32:33'),(177,'VISHAL SIR','9215015501',NULL,'JAGUAR SHOWROOM',NULL,'2','13',NULL,NULL,11,NULL,3,'139','3',NULL,'9','35','DL4CAY2323','05/2018',NULL,NULL,'Brown','Diesel','Automatic','First Owner','8000','5700000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-24 05:28:01','2019-12-24 05:28:01'),(178,'NASAR AHMAD SADIQ','8881232323',NULL,'H.NO-190 HAKEEM RANIS BUILDING',NULL,'26','34',NULL,NULL,11,NULL,3,'96','2',NULL,'3','14','UP38L1111','08/2018',NULL,NULL,'Black','Diesel','Automatic','First Owner','19000','4200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-24 06:18:39','2019-12-24 06:18:39'),(179,'VARUN JIT','9899398484',NULL,'shushant lok ph-2',NULL,'2','13',NULL,NULL,7,NULL,3,'209','3',NULL,'12','48','DL6CM6320','05/2013',NULL,NULL,'Gray','Diesel','Automatic','Second Owner','67572','2875000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-24 06:20:50','2019-12-24 06:20:50'),(180,'YASH','8800887926',NULL,'SEC-107 OPPT PATHE WAYS SCHOOL',NULL,'13','34',NULL,NULL,2,NULL,3,'140','3',NULL,'9','36','DL02','08/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','29000','3200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-24 11:42:11','2019-12-24 11:42:11'),(181,'JONY THUKRAL','8178884384',NULL,'GULSHAN VIVANTE SEC-137 NEAR B',NULL,'13','34',NULL,NULL,7,NULL,3,'67','2',NULL,'3','11','UP16','09/2016',NULL,NULL,'Black','Diesel','Automatic','First Owner','35000','3950000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-24 11:44:35','2019-12-24 11:44:35'),(182,'AJAY MITTAL','9911106555',NULL,'RAJNI KATHA CHOWK',NULL,'13','34',NULL,NULL,7,NULL,3,'62','2',NULL,'3','11','UP16BB000','06/2015',NULL,NULL,'Blue','Diesel','Automatic','First Owner','62700','1650000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-24 12:05:02','2019-12-24 12:05:02'),(183,'NITIN BAJAJ','8882221236',NULL,'DELHI',NULL,'8','10',NULL,NULL,7,NULL,3,'74','2',NULL,'3','12','DL0000','08/2017',NULL,NULL,'Blue','Petrol','Automatic','First Owner','11000','3950000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-24 12:07:10','2019-12-24 12:07:10'),(184,'DR.SANJAY','9999389930',NULL,'SEC-52',NULL,'13','34',NULL,NULL,7,NULL,3,'163','3',NULL,'12','43','UP16BS1087','07/2018',NULL,NULL,'Red','Diesel','Automatic','First Owner','13000','2999999',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-24 12:09:11','2019-12-24 12:09:11'),(185,'VINIT MIDHA/MANI MIDHA','9811084904',NULL,'Rajouri Garden',NULL,'8','10',NULL,NULL,7,NULL,3,'203','8',NULL,'12','47','DL0000','05/2019',NULL,NULL,'Red','Petrol','Automatic','First Owner','5200','3600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-25 11:42:59','2019-12-25 11:42:59'),(186,'PULKIT','9999998056',NULL,'DELHI',NULL,'8','10',NULL,NULL,1,NULL,3,'2','2',NULL,'1','1','HR26CU2231','06/2016',NULL,NULL,'Black','Diesel','Automatic','Second Owner','16000','2000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-25 11:47:15','2019-12-25 11:47:15'),(187,'NAVDEEP','9999900026',NULL,'CHATAR PUR',NULL,'8','10',NULL,NULL,7,NULL,3,'3','2',NULL,'1','1','UP16CC4552','07/2018',NULL,NULL,'Red','Diesel','Automatic','First Owner','12500','3200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-25 11:49:52','2019-12-25 11:49:52'),(188,'VISHAL','9991057356',NULL,'H.NO-55 KISHOR GARDEN PANIPAT',NULL,'23','13',NULL,NULL,7,NULL,3,'100','3',NULL,'3','15','UP320000','06/2016',NULL,NULL,'Brown','Diesel','Automatic','Second Owner','52000','4300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-25 11:57:07','2019-12-25 11:57:07'),(189,'SAHIL GARG','9888881379',NULL,'H.NO-380 SEC-7  Panchkula',NULL,'17','6',NULL,NULL,7,NULL,3,'145','2',NULL,'12','42','CH010000','09/2016',NULL,NULL,'Silver','Diesel','Automatic','First Owner','37500','3550000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-25 11:58:50','2019-12-25 11:58:50'),(190,'ZAKIA','9855080426',NULL,'Sector 61, Mohali',NULL,'14','28',NULL,NULL,7,NULL,3,'175','2',NULL,'12','44','PB02000','03/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','46000','1985000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-25 12:04:56','2019-12-25 12:04:56'),(191,'AHLUWALIA','7703895377',NULL,' DEHRADUN',NULL,'18','34',NULL,NULL,7,NULL,3,'36','3',NULL,'1','5','UK070000','09/2017',NULL,NULL,'White','Diesel','Automatic','First Owner','65000','2410000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-25 12:07:39','2019-12-25 12:07:39'),(192,'MOHIT THAKUR','9997555550',NULL,'19- RACE COURSE BANNU SCHOOL ',NULL,'18','34',NULL,NULL,7,NULL,3,'145','2',NULL,'12','42',NULL,'07/2013',NULL,NULL,'White','Diesel','Automatic','Second Owner','59000','2350000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-26 10:45:15','2019-12-26 10:45:15'),(193,'DEEPAK SAHNI','9818395964',NULL,'VIKAS PURI',NULL,'8','10',NULL,NULL,7,NULL,3,'145','2',NULL,'12','42','MH101BT6766','08/2015',NULL,NULL,'Black','Diesel','Automatic',NULL,'58000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-26 10:47:01','2019-12-26 10:47:01'),(194,'RAHUL VERMA','9873548376',NULL,'GURGAON',NULL,'2','13',NULL,NULL,2,NULL,3,'20','2',NULL,'1','2','DL1CS8177','06/2014',NULL,NULL,'Gray','Diesel','Automatic','First Owner','50000','1700000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-26 10:50:16','2019-12-26 10:50:16'),(195,'VIVEK','8874950444',NULL,'Gomti Nagar, Lucknow',NULL,'20','34',NULL,NULL,7,NULL,3,'38','3',NULL,'1','5','UP16CT9999','03/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','18000','2100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-26 12:18:39','2019-12-26 12:18:39'),(196,'PUNEET ','8800555222',NULL,'A-3/36 JANK PURI SANTMARK SCHO',NULL,'8','10',NULL,NULL,7,NULL,3,'101','3',NULL,'3','15','UK08AK8686','08/2016',NULL,NULL,'White','Diesel','Automatic','Second Owner','51000','4400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 06:39:57','2019-12-27 06:39:57'),(197,'DR.ROHIT','9639010444',NULL,'H.NO-1 SHARDHANAND BHAVAN SUBH',NULL,'25','34',NULL,NULL,2,NULL,3,'','3',NULL,'9','38','UK074BT3685','10/2016',NULL,NULL,'Blue','Diesel','Automatic','First Owner','29000','380000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 06:44:17','2019-12-27 06:44:17'),(198,'FAIZAN','7500000238',NULL,'DIXIT AMROHA Bhogapur, Bisalpu',NULL,'18','35',NULL,NULL,7,NULL,3,'39','3',NULL,'1','5','UP23S5555','09/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','55000','1750000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 06:46:30','2019-12-27 06:46:30'),(199,'RAJAN WADHWA','9811302090',NULL,'FARIDABAD',NULL,'27','13',NULL,NULL,7,NULL,3,'48','3',NULL,'1','6','HR510000','08/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','59000','2000000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 06:49:04','2019-12-27 06:49:04'),(200,'AMIT','8178072160',NULL,'RAJOURI GARDEN ',NULL,'8','10',NULL,NULL,7,NULL,3,'36','3',NULL,'1','5','DL1CQ8961','07/2014',NULL,NULL,'White','Diesel','Automatic','First Owner','73000','1632000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 06:51:15','2019-12-27 06:51:15'),(201,'ANKUR JAIN','9811584999',NULL,'K-F-51 KAVI NAGAR',NULL,'1','34',NULL,NULL,7,NULL,3,'12','2',NULL,'1','1','UP140000','09/2013',NULL,NULL,'White','Diesel','Automatic','First Owner','48000','1400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 10:35:10','2019-12-27 10:35:10'),(202,'VISHAL JAIN','9958994301',NULL,'SEC-78',NULL,'13','34',NULL,NULL,7,NULL,3,'18','2',NULL,'1','2','DL2CAT3680','05/2014',NULL,NULL,'Gray','Diesel','Automatic','First Owner','40000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 10:37:01','2019-12-27 10:37:01'),(203,'SUMIT WADHANI','9716383433',NULL,'SHADIPUR DEPO',NULL,'8','10',NULL,NULL,7,NULL,3,'15','2',NULL,'1','1','DL00000','09/2014',NULL,NULL,'White','Diesel','Automatic','Second Owner','41000','2200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 10:38:42','2019-12-27 10:38:42'),(204,'SUMIT WADHANI','9716383433',NULL,'DELHI',NULL,'8','10',NULL,NULL,7,NULL,3,'2','2',NULL,'1','1','HR26000','09/2013',NULL,NULL,'White','Diesel','Automatic','First Owner','65000','1400000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-27 10:40:06','2019-12-27 10:40:06'),(205,'ROHIT SHARMA','8696008806',NULL,'ROYAL CITY',NULL,'3','29',NULL,NULL,7,NULL,3,'63','2',NULL,'3','11','DD03AA0060','07/2013',NULL,NULL,'White','Diesel','Automatic','First Owner','66000','1620000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-28 09:52:49','2019-12-28 09:52:49'),(206,'SHRIKANT AGGARWAL','9805500405',NULL,'Nandan 364, Hoshiarpur',NULL,'14','28',NULL,NULL,7,NULL,3,'108','3',NULL,'3','17','HP73A2145','09/2014',NULL,NULL,'Black','Diesel','Automatic','First Owner','40000','2790000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-28 09:54:40','2019-12-28 09:54:40'),(207,'Maninderjit Singh','9888615374',NULL,'74 GOOD EARTH COLONY ',NULL,'5','28',NULL,NULL,7,NULL,3,'64','2',NULL,'3','11','PB11AT0074','08/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','59000','2150000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-28 09:58:19','2019-12-28 09:58:19'),(208,'NITIN DAWAR','9501153377',NULL,'267 -A RAJ GURU NAGAR',NULL,'5','28',NULL,NULL,7,NULL,3,'96','2',NULL,'3','14',NULL,'09/2016',NULL,NULL,'Black','Diesel','Automatic','First Owner','43000','2500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-28 09:59:54','2019-12-28 09:59:54'),(209,'SHAMSHER SINGH','9888422003',NULL,'ANSAL PLAZA',NULL,'5','28',NULL,NULL,7,NULL,3,'62','2',NULL,'3','11','PB10','03/2016',NULL,NULL,'White','Diesel','Automatic','First Owner','28000','2250000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-28 10:01:43','2019-12-28 10:01:43'),(210,'Yaduraj ','9810554362',NULL,'DELHI',NULL,'8','10',NULL,NULL,7,NULL,3,'','4',NULL,'3','82','DL01C0000','09/2013',NULL,NULL,'Red','Diesel','Automatic','First Owner','70000','13750000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-31 12:10:55','2019-12-31 12:10:55'),(211,'HIMANSHU','9999031334','NA','SEC-11',NULL,'2','13',NULL,'NA',13,NULL,2,'8','2',NULL,'1','1','UP16BS2643','09/2018',NULL,NULL,'Black','Diesel','Automatic','First Owner','10000','2700000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-31 12:17:41','2019-12-31 12:17:41'),(212,'DEEPAK CHAHUAN  ','9829054773',NULL,'C-Scheme',NULL,'3','29',NULL,NULL,7,NULL,3,'166','3',NULL,'12','43','RJ450000','09/2017',NULL,NULL,'Black','Diesel','Automatic','First Owner','40000','4500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-31 12:20:15','2019-12-31 12:20:15'),(213,'RAVI KANT','9024369174',NULL,'KHATIPURA CHOPRAH',NULL,'3','29',NULL,NULL,7,NULL,3,'171','2',NULL,'12','44','RJ140000','07/2015',NULL,NULL,'White','Diesel','Automatic','First Owner','59000','1750000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-31 12:22:22','2019-12-31 12:22:22'),(214,'LAKSHYA SHARMA','7877695693',NULL,'RAJA PARK',NULL,'3','29',NULL,NULL,7,NULL,3,'41','3',NULL,'1','5',NULL,'05/2015',NULL,NULL,'Gray','Diesel','Automatic','First Owner','55000','2600000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-31 12:23:45','2019-12-31 12:23:45'),(215,'SANDEEP KUMAR','8949392530',NULL,'Vaishali Nagar',NULL,'3','29',NULL,NULL,7,NULL,3,'209','3',NULL,'12','48',NULL,'05/2014',NULL,NULL,'White','Diesel','Automatic','Second Owner','54000','3200000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-31 12:25:10','2019-12-31 12:25:10'),(216,'BAL KRISHAN SONI','9799277111',NULL,'22 Godam Industrial Area,',NULL,'3','29',NULL,NULL,7,NULL,3,'163','3',NULL,'12','43','RJ14','08/2015',NULL,NULL,'White','Diesel','Automatic','Second Owner','90000','2100000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2019-12-31 12:27:02','2019-12-31 12:27:02'),(217,'SOURABH KHURANA','9896700222',NULL,'HUDA PANIPAT',NULL,'23','13',NULL,NULL,11,NULL,3,'2','2',NULL,'1','1','HR05AK9500','05/2013',NULL,NULL,'White','Diesel','Automatic','Second Owner','70000','1300000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2020-01-02 10:10:48','2020-01-02 10:10:48'),(218,'TANUJ GUPTA','9837075030',NULL,'167 THAPAR NAGAR',NULL,'25','34',NULL,NULL,9,NULL,3,'7','2',NULL,'1','1','UP15CD7308','10/2017',NULL,NULL,'Black','Diesel','Automatic','First Owner','20000','1500000',NULL,'Y',NULL,NULL,NULL,NULL,'By Cash','2020-01-02 10:34:09','2020-01-02 10:34:09');
/*!40000 ALTER TABLE `purchase_lead_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_vehicle_onboard_status_tbl`
--

DROP TABLE IF EXISTS `purchase_vehicle_onboard_status_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_vehicle_onboard_status_tbl` (
  `onboard_id` int(15) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`onboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_vehicle_onboard_status_tbl`
--

LOCK TABLES `purchase_vehicle_onboard_status_tbl` WRITE;
/*!40000 ALTER TABLE `purchase_vehicle_onboard_status_tbl` DISABLE KEYS */;
INSERT INTO `purchase_vehicle_onboard_status_tbl` VALUES (1,'Follow up','Y','2019-01-11 11:03:02'),(2,'Purchased','Y','2019-01-11 11:03:02'),(3,'Sold Out','Y','2019-01-11 11:03:02');
/*!40000 ALTER TABLE `purchase_vehicle_onboard_status_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased_vehicle_details_tbl`
--

DROP TABLE IF EXISTS `purchased_vehicle_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchased_vehicle_details_tbl` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(12) DEFAULT NULL,
  `showroom_id` int(10) DEFAULT NULL,
  `purchase_price` int(10) DEFAULT NULL,
  `selling_price` varchar(20) DEFAULT NULL,
  `refurbish_amount` varchar(15) DEFAULT NULL,
  `vehicle_visibulity` varchar(25) DEFAULT NULL,
  `on_boarded_by` int(15) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `owned_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `purchased_vehicle_details_tbl_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_master_tbl` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased_vehicle_details_tbl`
--

LOCK TABLES `purchased_vehicle_details_tbl` WRITE;
/*!40000 ALTER TABLE `purchased_vehicle_details_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchased_vehicle_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_code_tbl`
--

DROP TABLE IF EXISTS `referral_code_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_code_tbl` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `referral_code` varchar(20) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(12) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `discount_type` char(1) DEFAULT 'P',
  `discount` double(10,2) DEFAULT '0.00',
  `display_name` varchar(20) DEFAULT NULL,
  `eligible_criteria` varchar(30) DEFAULT NULL,
  `tool_tip` varchar(200) DEFAULT NULL,
  `no_of_times_can_use` int(3) DEFAULT '1',
  `min_amount` double(6,2) DEFAULT '199.00',
  `valid_from` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `referral_image` text,
  `elgible_for` char(1) NOT NULL DEFAULT 'I',
  `flat_amount` double(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_code_tbl`
--

LOCK TABLES `referral_code_tbl` WRITE;
/*!40000 ALTER TABLE `referral_code_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_code_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_interested_plan_tbl`
--

DROP TABLE IF EXISTS `sales_interested_plan_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_interested_plan_tbl` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `customer_id` int(15) DEFAULT NULL,
  `interested_to` varchar(50) DEFAULT NULL,
  `down_payment` varchar(50) DEFAULT NULL,
  `tenure` varchar(50) DEFAULT NULL,
  `expected_emi` varchar(50) DEFAULT NULL,
  `car_id` int(15) DEFAULT NULL,
  `model_id` int(15) DEFAULT NULL,
  `odometer` varchar(50) DEFAULT NULL,
  `no_of_owners` varchar(50) DEFAULT NULL,
  `manufactured_year` varchar(50) DEFAULT NULL,
  `fuel_type` varchar(50) DEFAULT NULL,
  `transmission` varchar(50) DEFAULT NULL,
  `hypothecation` varchar(25) DEFAULT NULL,
  `insurance_expiry` varchar(25) DEFAULT NULL,
  `ins_service_provider` varchar(25) DEFAULT NULL,
  `ins_idv` varchar(50) DEFAULT NULL,
  `ins_comprehensive` varchar(50) DEFAULT NULL,
  `ins_dep_cap` varchar(50) DEFAULT NULL,
  `ins_3rd_party` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_interested_plan_tbl`
--

LOCK TABLES `sales_interested_plan_tbl` WRITE;
/*!40000 ALTER TABLE `sales_interested_plan_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_interested_plan_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_lead_master_tbl`
--

DROP TABLE IF EXISTS `sales_lead_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_lead_master_tbl` (
  `customer_id` int(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `alternative_number` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `lead_source` varchar(20) DEFAULT NULL,
  `min_budget` varchar(15) DEFAULT NULL,
  `max_budget` varchar(15) DEFAULT NULL,
  `budget` int(10) DEFAULT NULL,
  `planning_by` varchar(30) DEFAULT NULL,
  `planning_to_by` varchar(50) DEFAULT NULL,
  `added_by` int(10) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_lead_master_tbl`
--

LOCK TABLES `sales_lead_master_tbl` WRITE;
/*!40000 ALTER TABLE `sales_lead_master_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_lead_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_lead_source_tbl`
--

DROP TABLE IF EXISTS `sales_lead_source_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_lead_source_tbl` (
  `lead_source_id` int(10) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lead_source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_lead_source_tbl`
--

LOCK TABLES `sales_lead_source_tbl` WRITE;
/*!40000 ALTER TABLE `sales_lead_source_tbl` DISABLE KEYS */;
INSERT INTO `sales_lead_source_tbl` VALUES (1,'Friends','Y','2019-11-18 13:22:59'),(2,'Newspaper','Y','2019-11-18 13:22:59'),(3,'Social Media','Y','2019-11-18 13:22:59'),(4,'Others','Y','2019-11-18 13:22:59');
/*!40000 ALTER TABLE `sales_lead_source_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showroom_vehicle_assignment_tbl`
--

DROP TABLE IF EXISTS `showroom_vehicle_assignment_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showroom_vehicle_assignment_tbl` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `showroom_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `vehicle_images` text,
  `vehicle_Video` text,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`assign_id`),
  KEY `FKshowroom_idx` (`showroom_id`),
  KEY `FKvehicle_idx` (`vehicle_id`),
  CONSTRAINT `FKshowroom` FOREIGN KEY (`showroom_id`) REFERENCES `showrooms_tbl` (`showroom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKvehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_master_tbl` (`vehicle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showroom_vehicle_assignment_tbl`
--

LOCK TABLES `showroom_vehicle_assignment_tbl` WRITE;
/*!40000 ALTER TABLE `showroom_vehicle_assignment_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `showroom_vehicle_assignment_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showrooms_tbl`
--

DROP TABLE IF EXISTS `showrooms_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showrooms_tbl` (
  `showroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `showroom_name` varchar(200) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `pincode` varchar(12) NOT NULL,
  `landmark` varchar(120) NOT NULL,
  `showroom_code` varchar(25) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`showroom_id`),
  KEY `FKcity_idx_idx` (`city_id`),
  CONSTRAINT `FKcity_idx` FOREIGN KEY (`city_id`) REFERENCES `city_master_tbl` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showrooms_tbl`
--

LOCK TABLES `showrooms_tbl` WRITE;
/*!40000 ALTER TABLE `showrooms_tbl` DISABLE KEYS */;
INSERT INTO `showrooms_tbl` VALUES (1,'Luxury Ride KARNAL',28,'118, Milestone, AH-1, Karnal, Haryana','132001','Star Tower, Sector 30','LRK','Y','2019-01-25 10:28:14','2020-01-01 12:24:18'),(2,'Luxury Ride DELHI',8,'A-84, Block KD, Phase 1, Ashok Vihar, Delhi','110052','Ashok Vihar','LRD','Y','2019-01-25 10:28:14','2020-01-01 12:24:18'),(3,'Luxury Ride CHANDIGARH',17,'118, Milestone, AH-1, Karnal','132001','AH-1, Karnal','LRC','Y','2019-01-25 10:28:14','2020-01-01 12:24:19'),(4,'Luxury Ride LUDHIANA',5,'Grand Trunk Rd, Opposite railway station, Industrial Area C, Dhandari Kalan, Ludhiana, Punjab','141014','Opp. Dhandari Railway Station Distt.','LRL','Y','2019-01-25 10:28:14','2020-01-01 12:24:19'),(5,'Luxury Ride DEHRADUN',18,'aharanpur Rd, Mohabbewala, Dehradun, Uttarakhand','248002','IDC Sector 16','LRDD','Y','2019-01-25 10:28:14','2020-01-01 12:24:19'),(6,'Luxury Ride JAIPUR',3,'B-24, Govind Marg, Gurunanakpura, Tilak Nagar, Jaipur, Rajasthan','302004','AH-1, Karnal','LRJ','Y','2020-01-01 09:04:28','2020-01-01 12:24:19');
/*!40000 ALTER TABLE `showrooms_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_master_tbl`
--

DROP TABLE IF EXISTS `state_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_master_tbl` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(120) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_master_tbl`
--

LOCK TABLES `state_master_tbl` WRITE;
/*!40000 ALTER TABLE `state_master_tbl` DISABLE KEYS */;
INSERT INTO `state_master_tbl` VALUES (1,'Andaman & Nicobar Islands','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(2,'Andhra Pradesh','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(3,'Arunachal Pradesh','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(4,'Assam','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(5,'Bihar','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(6,'Chandigarh','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(7,'Chhattisgarh','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(8,'Dadra & Nagar Haveli','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(9,'Daman & Diu','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(10,'Delhi','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(11,'Goa','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(12,'Gujarat','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(13,'Haryana','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(14,'Himachal Pradesh','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(15,'Jammu & Kashmir','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(16,'Jharkhand','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(17,'Karnataka','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(18,'Kerala','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(19,'Lakshadweep','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(20,'Madhya Pradesh','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(21,'Maharashtra','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(22,'Manipur','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(23,'Meghalaya','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(24,'Mizoram','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(25,'Nagaland','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(26,'Odisha','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(27,'Puducherry','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(28,'Punjab','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(29,'Rajasthan','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(30,'Sikkim','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(31,'Tamil Nadu','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(32,'Telangana','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(33,'Tripura','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(34,'Uttar Pradesh','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(35,'Uttarakhand','Y','2018-11-30 07:38:52','2018-11-30 07:38:52'),(36,'West Bengal','Y','2018-11-30 07:38:52','2018-11-30 07:38:52');
/*!40000 ALTER TABLE `state_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_details_master_tbl`
--

DROP TABLE IF EXISTS `sub_details_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_details_master_tbl` (
  `sub_details_id` int(20) NOT NULL AUTO_INCREMENT,
  `sub_details` varchar(25) DEFAULT NULL,
  `details_id` int(12) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_details_master_tbl`
--

LOCK TABLES `sub_details_master_tbl` WRITE;
/*!40000 ALTER TABLE `sub_details_master_tbl` DISABLE KEYS */;
INSERT INTO `sub_details_master_tbl` VALUES (1,'Roof',1,'Y','2019-10-10 13:22:16'),(2,'Radiator Support',1,'N','2019-10-10 13:22:16'),(3,'Headlight light',1,'Y','2019-10-10 13:22:16'),(4,'Door - LHS Front',1,'Y','2019-10-10 13:22:16'),(5,'Wind Shield  Front',1,'Y','2019-10-10 13:22:16'),(6,'Tail Light',1,'Y','2019-10-10 13:22:16'),(7,'Bonnet/Hood',1,'Y','2019-10-10 13:22:16'),(8,'Bumper - Front',1,'Y','2019-10-10 13:22:16'),(9,'ORVM LHS',1,'Y','2019-10-10 13:22:16'),(10,'Spare Tyre',1,'Y','2019-10-10 13:22:16'),(11,'Dickey Door/Boot Door',1,'Y','2019-10-10 13:22:16'),(12,'Quarter Panel LHS',1,'Y','2019-10-10 13:22:16'),(13,'Quarter Panel RHS',1,'Y','2019-10-10 13:22:16'),(14,'Fender RHS',1,'Y','2019-10-10 13:22:16'),(15,'Door - RHS Front',1,'Y','2019-10-10 13:22:16'),(16,'Door - LHS Rear',1,'Y','2019-10-10 13:22:16'),(17,'Door - RHS Rear',1,'Y','2019-10-10 13:22:16'),(18,'Bumper - Rear',1,'Y','2019-10-10 13:22:16'),(19,'Wind Shield  Rear',1,'Y','2019-10-10 13:22:16'),(20,'ORVM RHS',1,'Y','2019-10-10 13:22:16'),(21,'Tyre LHS Front',1,'Y','2019-10-10 13:22:16'),(22,'Fender LHS',1,'Y','2019-10-10 13:22:16'),(23,'Tyre LHS Rear',1,'Y','2019-10-10 13:22:16'),(24,'Tyre RHS Rear',1,'Y','2019-10-10 13:22:16'),(25,'Tyre RHS Front',1,'Y','2019-10-10 13:22:16'),(26,'Engine Sound',2,'Y','2019-10-10 13:22:16'),(27,'Exhaust Smoke',2,'Y','2019-10-10 13:22:16'),(28,'Engine Mounting',2,'Y','2019-10-10 13:22:16'),(29,'Clutch',2,'Y','2019-10-10 13:22:16'),(30,'Gear Shifting',2,'Y','2019-10-10 13:22:16'),(31,'Engine oil',2,'Y','2019-10-10 13:22:16'),(32,'Battery',2,'Y','2019-10-10 13:22:16'),(33,'Coolant',2,'Y','2019-10-10 13:22:16'),(34,'AC Cooling',3,'Y','2019-10-10 13:22:16'),(35,'Heater',3,'Y','2019-10-10 13:22:16'),(36,'Climate Control AC',3,'Y','2019-10-10 13:22:16'),(37,'Power Windows',4,'Y','2019-10-10 13:22:16'),(38,'Music System',4,'Y','2019-10-10 13:22:16'),(39,'Sun Roof',4,'Y','2019-10-10 13:22:16'),(40,'Reverse Camera',4,'Y','2019-10-10 13:22:16'),(41,'Seat',4,'Y','2019-10-10 13:22:16'),(42,'Steering',5,'Y','2019-10-10 13:22:16'),(43,'Suspension',5,'Y','2019-10-10 13:22:16'),(44,'Brake',5,'Y','2019-10-10 13:22:16'),(45,'Stepny & tools',1,'Y','2019-11-15 07:10:03'),(46,'Fuel cap',1,'Y','2019-11-15 07:10:04'),(47,'Head Rest',4,'Y','2019-11-15 07:11:05'),(48,'Buttons',4,'Y','2019-11-15 07:11:05'),(49,'Steering Condition',4,'Y','2019-11-15 07:11:05'),(50,'Roof Cloth',4,'Y','2019-11-15 07:11:05');
/*!40000 ALTER TABLE `sub_details_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_complete_status_tbl`
--

DROP TABLE IF EXISTS `vehicle_complete_status_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_complete_status_tbl` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(10) DEFAULT NULL,
  `purchased` char(1) DEFAULT 'N',
  `is_refurbished` char(1) DEFAULT 'N',
  `In_showroom` char(1) DEFAULT 'N',
  `token_recieve` char(1) DEFAULT 'N',
  `is_sold` char(1) DEFAULT 'N',
  `is_active` char(1) DEFAULT 'Y',
  `purchased_on` varchar(50) DEFAULT NULL,
  `refurbished_on` varchar(25) DEFAULT NULL,
  `showroom_on` varchar(50) DEFAULT NULL,
  `Negotiation_on` varchar(50) DEFAULT NULL,
  `sold_on` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_complete_status_tbl`
--

LOCK TABLES `vehicle_complete_status_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_complete_status_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_complete_status_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_condition_details_tbl`
--

DROP TABLE IF EXISTS `vehicle_condition_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_condition_details_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `sub_details_id` int(20) DEFAULT NULL,
  `status_id` int(12) DEFAULT NULL,
  `images` text,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `vehicle_condition_details_tbl_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_master_tbl` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_condition_details_tbl`
--

LOCK TABLES `vehicle_condition_details_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_condition_details_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_condition_details_tbl` VALUES (1,10,1,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(2,10,3,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(3,10,4,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(4,10,5,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(5,10,6,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(6,10,7,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(7,10,8,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(8,10,9,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(9,10,10,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(10,10,11,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(11,10,12,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(12,10,13,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(13,10,14,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(14,10,15,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(15,10,16,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(16,10,17,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(17,10,18,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(18,10,19,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(19,10,20,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(20,10,21,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(21,10,22,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(22,10,23,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(23,10,24,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(24,10,25,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(25,10,45,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(26,10,46,1,NULL,NULL,'Y','2019-12-11 08:24:23','2019-12-11 08:24:23'),(27,10,26,1,NULL,NULL,'Y','2019-12-11 08:24:35','2019-12-11 08:24:35'),(28,10,27,15,NULL,NULL,'Y','2019-12-11 08:24:35','2019-12-11 08:24:35'),(29,10,28,1,NULL,NULL,'Y','2019-12-11 08:24:35','2019-12-11 08:24:35'),(30,10,29,18,NULL,NULL,'Y','2019-12-11 08:24:35','2019-12-11 08:24:35'),(31,10,30,18,NULL,NULL,'Y','2019-12-11 08:24:35','2019-12-11 08:24:35'),(32,10,31,12,NULL,NULL,'Y','2019-12-11 08:24:35','2019-12-11 08:24:35'),(33,10,32,1,NULL,NULL,'Y','2019-12-11 08:24:35','2019-12-11 08:24:35'),(34,10,33,12,NULL,NULL,'Y','2019-12-11 08:24:35','2019-12-11 08:24:35'),(35,10,34,1,NULL,NULL,'Y','2019-12-11 08:24:42','2019-12-11 08:24:42'),(36,10,35,1,NULL,NULL,'Y','2019-12-11 08:24:42','2019-12-11 08:24:42'),(37,10,36,1,NULL,NULL,'Y','2019-12-11 08:24:42','2019-12-11 08:24:42'),(38,10,37,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(39,10,38,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(40,10,39,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(41,10,40,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(42,10,41,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(43,10,47,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(44,10,48,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(45,10,49,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(46,10,50,1,NULL,NULL,'Y','2019-12-11 08:26:24','2019-12-11 08:26:24'),(47,10,42,17,NULL,NULL,'Y','2019-12-11 08:31:16','2019-12-11 08:31:16'),(48,10,43,1,NULL,NULL,'Y','2019-12-11 08:31:16','2019-12-11 08:31:16'),(49,10,44,1,NULL,NULL,'Y','2019-12-11 08:31:16','2019-12-11 08:31:16'),(50,118,34,1,NULL,NULL,'Y','2019-12-17 13:07:27','2019-12-17 13:07:27'),(51,118,35,1,NULL,NULL,'Y','2019-12-17 13:07:27','2019-12-17 13:07:27'),(52,118,36,1,NULL,NULL,'Y','2019-12-17 13:07:27','2019-12-17 13:07:27'),(53,118,37,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(54,118,38,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(55,118,39,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(56,118,40,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(57,118,41,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(58,118,47,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(59,118,48,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(60,118,49,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(61,118,50,1,NULL,NULL,'Y','2019-12-17 13:07:41','2019-12-17 13:07:41'),(62,118,26,1,NULL,NULL,'Y','2019-12-17 13:07:57','2019-12-17 13:07:57'),(63,118,27,15,NULL,NULL,'Y','2019-12-17 13:07:57','2019-12-17 13:07:57'),(64,118,28,1,NULL,NULL,'Y','2019-12-17 13:07:57','2019-12-17 13:07:57'),(65,118,29,18,NULL,NULL,'Y','2019-12-17 13:07:57','2019-12-17 13:07:57'),(66,118,30,18,NULL,NULL,'Y','2019-12-17 13:07:57','2019-12-17 13:07:57'),(67,118,31,12,NULL,NULL,'Y','2019-12-17 13:07:57','2019-12-17 13:07:57'),(68,118,32,1,NULL,NULL,'Y','2019-12-17 13:07:57','2019-12-17 13:07:57'),(69,118,33,12,NULL,NULL,'Y','2019-12-17 13:07:57','2019-12-17 13:07:57'),(200,118,42,17,NULL,NULL,'Y','2019-12-17 13:11:31','2019-12-17 13:11:31'),(201,118,43,1,NULL,NULL,'Y','2019-12-17 13:11:31','2019-12-17 13:11:31'),(202,118,44,1,NULL,NULL,'Y','2019-12-17 13:11:31','2019-12-17 13:11:31'),(229,107,34,1,NULL,NULL,'Y','2019-12-17 13:21:27','2019-12-17 13:21:27'),(230,107,35,1,NULL,NULL,'Y','2019-12-17 13:21:27','2019-12-17 13:21:27'),(231,107,36,1,NULL,NULL,'Y','2019-12-17 13:21:27','2019-12-17 13:21:27'),(232,107,37,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(233,107,38,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(234,107,39,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(235,107,40,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(236,107,41,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(237,107,47,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(238,107,48,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(239,107,49,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(240,107,50,1,NULL,NULL,'Y','2019-12-17 13:21:46','2019-12-17 13:21:46'),(241,107,26,1,NULL,NULL,'Y','2019-12-17 13:21:56','2019-12-17 13:21:56'),(242,107,27,15,NULL,NULL,'Y','2019-12-17 13:21:56','2019-12-17 13:21:56'),(243,107,28,1,NULL,NULL,'Y','2019-12-17 13:21:56','2019-12-17 13:21:56'),(244,107,29,17,NULL,NULL,'Y','2019-12-17 13:21:56','2019-12-17 13:21:56'),(245,107,30,18,NULL,NULL,'Y','2019-12-17 13:21:56','2019-12-17 13:21:56'),(246,107,31,12,NULL,NULL,'Y','2019-12-17 13:21:56','2019-12-17 13:21:56'),(247,107,32,1,NULL,NULL,'Y','2019-12-17 13:21:56','2019-12-17 13:21:56'),(248,107,33,12,NULL,NULL,'Y','2019-12-17 13:21:56','2019-12-17 13:21:56'),(249,107,1,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(250,107,3,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(251,107,4,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(252,107,5,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(253,107,6,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(254,107,7,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(255,107,8,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(256,107,9,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(257,107,10,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(258,107,11,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(259,107,12,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(260,107,13,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(261,107,14,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(262,107,15,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(263,107,16,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(264,107,17,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(265,107,18,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(266,107,19,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(267,107,20,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(268,107,21,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(269,107,22,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(270,107,23,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(271,107,24,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(272,107,25,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(273,107,45,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(274,107,46,1,NULL,NULL,'Y','2019-12-17 13:22:17','2019-12-17 13:22:17'),(275,107,42,17,NULL,NULL,'Y','2019-12-17 13:22:40','2019-12-17 13:22:40'),(276,107,43,1,NULL,NULL,'Y','2019-12-17 13:22:40','2019-12-17 13:22:40'),(277,107,44,1,NULL,NULL,'Y','2019-12-17 13:22:40','2019-12-17 13:22:40'),(278,117,34,1,NULL,NULL,'Y','2019-12-17 18:16:24','2019-12-17 18:16:24'),(279,117,35,1,NULL,NULL,'Y','2019-12-17 18:16:24','2019-12-17 18:16:24'),(280,117,36,1,NULL,NULL,'Y','2019-12-17 18:16:24','2019-12-17 18:16:24'),(281,117,37,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(282,117,38,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(283,117,39,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(284,117,40,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(285,117,41,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(286,117,47,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(287,117,48,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(288,117,49,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(289,117,50,1,NULL,NULL,'Y','2019-12-17 18:16:42','2019-12-17 18:16:42'),(290,117,26,1,NULL,NULL,'Y','2019-12-17 18:17:11','2019-12-17 18:17:11'),(291,117,27,1,NULL,NULL,'Y','2019-12-17 18:17:11','2019-12-17 18:17:11'),(292,117,28,1,NULL,NULL,'Y','2019-12-17 18:17:11','2019-12-17 18:17:11'),(293,117,29,17,NULL,NULL,'Y','2019-12-17 18:17:11','2019-12-17 18:17:11'),(294,117,30,17,NULL,NULL,'Y','2019-12-17 18:17:11','2019-12-17 18:17:11'),(295,117,31,12,NULL,NULL,'Y','2019-12-17 18:17:11','2019-12-17 18:17:11'),(296,117,32,1,NULL,NULL,'Y','2019-12-17 18:17:11','2019-12-17 18:17:11'),(297,117,33,12,NULL,NULL,'Y','2019-12-17 18:17:11','2019-12-17 18:17:11'),(298,117,1,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(299,117,3,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(300,117,4,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(301,117,5,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(302,117,6,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(303,117,7,24,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(304,117,8,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(305,117,9,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(306,117,10,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(307,117,11,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(308,117,12,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(309,117,13,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(310,117,14,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(311,117,15,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(312,117,16,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(313,117,17,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(314,117,18,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(315,117,19,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(316,117,20,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(317,117,21,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(318,117,22,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(319,117,23,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(320,117,24,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(321,117,25,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(322,117,45,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(323,117,46,1,NULL,NULL,'Y','2019-12-17 18:17:53','2019-12-17 18:17:53'),(324,117,42,17,NULL,NULL,'Y','2019-12-17 18:18:05','2019-12-17 18:18:05'),(325,117,43,1,NULL,NULL,'Y','2019-12-17 18:18:05','2019-12-17 18:18:05'),(326,117,44,1,NULL,NULL,'Y','2019-12-17 18:18:05','2019-12-17 18:18:05'),(353,115,34,1,NULL,NULL,'Y','2019-12-18 10:54:39','2019-12-18 10:54:39'),(354,115,35,1,NULL,NULL,'Y','2019-12-18 10:54:39','2019-12-18 10:54:39'),(355,115,36,1,NULL,NULL,'Y','2019-12-18 10:54:39','2019-12-18 10:54:39'),(356,115,37,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(357,115,38,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(358,115,39,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(359,115,40,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(360,115,41,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(361,115,47,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(362,115,48,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(363,115,49,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(364,115,50,1,NULL,NULL,'Y','2019-12-18 10:54:49','2019-12-18 10:54:49'),(365,115,26,1,NULL,NULL,'Y','2019-12-18 10:55:28','2019-12-18 10:55:28'),(366,115,27,1,NULL,NULL,'Y','2019-12-18 10:55:28','2019-12-18 10:55:28'),(367,115,28,1,NULL,NULL,'Y','2019-12-18 10:55:28','2019-12-18 10:55:28'),(368,115,29,17,NULL,NULL,'Y','2019-12-18 10:55:28','2019-12-18 10:55:28'),(369,115,30,17,NULL,NULL,'Y','2019-12-18 10:55:28','2019-12-18 10:55:28'),(370,115,31,12,NULL,NULL,'Y','2019-12-18 10:55:28','2019-12-18 10:55:28'),(371,115,32,11,NULL,NULL,'Y','2019-12-18 10:55:28','2019-12-18 10:55:28'),(372,115,33,13,NULL,NULL,'Y','2019-12-18 10:55:28','2019-12-18 10:55:28'),(373,115,1,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(374,115,3,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(375,115,4,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(376,115,5,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(377,115,6,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(378,115,7,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(379,115,8,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(380,115,9,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(381,115,10,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(382,115,11,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(383,115,12,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(384,115,13,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(385,115,14,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(386,115,15,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(387,115,16,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(388,115,17,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(389,115,18,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(390,115,19,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(391,115,20,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(392,115,21,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(393,115,22,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(394,115,23,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(395,115,24,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(396,115,25,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(397,115,45,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(398,115,46,1,NULL,NULL,'Y','2019-12-18 10:56:59','2019-12-18 10:56:59'),(399,115,42,17,NULL,NULL,'Y','2019-12-18 10:57:19','2019-12-18 10:57:19'),(400,115,43,1,NULL,NULL,'Y','2019-12-18 10:57:19','2019-12-18 10:57:19'),(401,115,44,19,NULL,NULL,'Y','2019-12-18 10:57:19','2019-12-18 10:57:19'),(402,118,1,1,NULL,NULL,'Y','2019-12-19 08:06:51','2019-12-19 08:06:51'),(403,118,3,1,NULL,NULL,'Y','2019-12-19 08:06:51','2019-12-19 08:06:51'),(404,118,4,1,NULL,NULL,'Y','2019-12-19 08:06:51','2019-12-19 08:06:51'),(405,118,5,1,NULL,NULL,'Y','2019-12-19 08:06:51','2019-12-19 08:06:51'),(406,118,6,1,NULL,NULL,'Y','2019-12-19 08:06:51','2019-12-19 08:06:51'),(407,118,7,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(408,118,8,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(409,118,9,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(410,118,10,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(411,118,11,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(412,118,12,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(413,118,13,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(414,118,14,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(415,118,15,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(416,118,16,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(417,118,17,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(418,118,18,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(419,118,19,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(420,118,20,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(421,118,21,1,NULL,NULL,'Y','2019-12-19 08:06:52','2019-12-19 08:06:52'),(422,118,22,1,NULL,NULL,'Y','2019-12-19 08:06:53','2019-12-19 08:06:53'),(423,118,23,1,NULL,NULL,'Y','2019-12-19 08:06:53','2019-12-19 08:06:53'),(424,118,24,1,NULL,NULL,'Y','2019-12-19 08:06:53','2019-12-19 08:06:53'),(425,118,25,1,NULL,NULL,'Y','2019-12-19 08:06:53','2019-12-19 08:06:53'),(426,118,45,1,NULL,NULL,'Y','2019-12-19 08:06:53','2019-12-19 08:06:53'),(427,118,46,1,NULL,NULL,'Y','2019-12-19 08:06:53','2019-12-19 08:06:53');
/*!40000 ALTER TABLE `vehicle_condition_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_condition_images_lable_tbl`
--

DROP TABLE IF EXISTS `vehicle_condition_images_lable_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_condition_images_lable_tbl` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `lable_name` varchar(75) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_condition_images_lable_tbl`
--

LOCK TABLES `vehicle_condition_images_lable_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_condition_images_lable_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_condition_images_lable_tbl` VALUES (1,'Front View','Y','2019-12-02 13:47:07'),(2,'Rear View','Y','2019-12-02 13:47:07'),(3,'Right View','Y','2019-12-02 13:47:07'),(4,'Left View','Y','2019-12-02 13:47:07'),(5,'Digital Meter','Y','2019-12-02 13:47:07'),(6,'Dashboard','Y','2019-12-02 13:47:07'),(7,'Front Right Tyre','Y','2019-12-02 13:47:07'),(8,'Front Left tyre','Y','2019-12-02 13:47:08'),(9,'Back Right Tyre','Y','2019-12-02 13:47:08'),(10,'Back Left Tyre','Y','2019-12-02 13:47:08'),(11,'Interior Front','Y','2019-12-02 13:47:08'),(12,'Interior Back','Y','2019-12-02 13:47:08');
/*!40000 ALTER TABLE `vehicle_condition_images_lable_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_condition_images_tbl`
--

DROP TABLE IF EXISTS `vehicle_condition_images_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_condition_images_tbl` (
  `image_id` int(10) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(10) DEFAULT NULL,
  `vehicle_images` text,
  `front_view` text,
  `rear_view` text,
  `right_view` text,
  `left_view` text,
  `digital_meter` text,
  `dashboard` text,
  `front_right_tyre` text,
  `front_left_tyre` text,
  `back_right_tyre` text,
  `back_left_tyre` text,
  `interior_front` text,
  `interior_back` text,
  `comments` varchar(250) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_condition_images_tbl`
--

LOCK TABLES `vehicle_condition_images_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_condition_images_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_condition_images_tbl` VALUES (1,48,'[\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL8CAL5974_AUDI-A6_2019-12-09%3A22-06-58.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL8CAL5974_AUDI-A6_2019-12-09%3A22-07-22.jpg\"]','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL8CAL5974_AUDI-A6_2019-12-09%3A22-06-58.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL8CAL5974_AUDI-A6_2019-12-09%3A22-07-22.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','2019-12-09 16:37:22'),(2,10,'[\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-36-29.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-36-43.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-36-43.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-36-53.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-37-22.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-37-22.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-37-35.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-37-35.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-37-35.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-38-09.jpg\"]','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-36-29.jpg','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-38-09.jpg',NULL,'https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-36-29.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-36-43.jpg','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-37-22.jpg',NULL,NULL,NULL,NULL,'https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-36-53.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CG7041_AUDI-A4_2019-12-11:12-37-35.jpg\n','Good car, \n\n2014 A4 WITHOUT SUNROOF 53000KMS @ 12-12.50 LAC\n\n\nALMOST COMPLETE CAR REPAINT . BUT PAINT IS GOOD. TYRERS IS GOOD','Y','2019-12-11 07:14:00'),(3,59,'[\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26DT0273_JAGUAR-XJ_L_2019-12-11:13-45-42.jpg\"]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26DT0273_JAGUAR-XJ_L_2019-12-11:13-45-42.jpg','Yfgg','Y','2019-12-11 08:15:54'),(4,118,'[\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_BMW-5_SERIES_2019-12-17:18-42-23.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_BMW-5_SERIES_2019-12-17:18-42-35.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_BMW-5_SERIES_2019-12-17:18-42-44.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_BMW-5_SERIES_2019-12-17:18-43-20.jpg\"]','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_BMW-5_SERIES_2019-12-17:18-42-23.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_BMW-5_SERIES_2019-12-17:18-42-44.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_BMW-5_SERIES_2019-12-17:18-43-20.jpg','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_BMW-5_SERIES_2019-12-17:18-42-35.jpg\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Boot repainted','Y','2019-12-17 13:14:16'),(5,107,'[\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-52-50.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-02.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-10.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-22.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-33.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-42.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-54-20.jpg\"]','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-10.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-54-20.jpg','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-42.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-02.jpg\n',NULL,'https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/HR26CS4346_MINI-COOPER_2019-12-17:18-53-33.jpg\n',NULL,NULL,NULL,NULL,NULL,NULL,'Good car , 14800kms done','Y','2019-12-17 13:24:42'),(6,117,'[\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-48-29.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-48-38.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-48-45.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-48-57.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-49-05.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-49-15.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-49-26.jpg\"]','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-48-57.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-49-26.jpg','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-49-15.jpg','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-49-05.jpg\n',NULL,NULL,NULL,NULL,NULL,NULL,'https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-48-29.jpg','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP160000_AUDI-A4_2019-12-17:23-48-38.jpg\n','BONNET , left side fender and front left door REPAINTED.','Y','2019-12-17 18:20:20'),(7,115,'[\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-19-12.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-19-29.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-19-45.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-19-57.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-20-07.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-20-24.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-20-50.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-21-15.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-21-31.jpg\"]','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-19-29.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-19-57.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-19-45.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-19-12.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-20-24.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-20-50.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-20-07.jpg\n',NULL,NULL,NULL,'https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-21-15.jpg\n','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/DL2CAP6714_AUDI-A6_2019-12-18:16-21-31.jpg','RHS FENDER AND BONNET REPAINT','Y','2019-12-18 10:52:18'),(8,134,'[\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP84S0099_BMW-3_SERIES_2019-12-19:12-05-28.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP84S0099_BMW-3_SERIES_2019-12-19:12-05-28.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP84S0099_BMW-3_SERIES_2019-12-19:12-05-28.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP84S0099_BMW-3_SERIES_2019-12-19:12-05-28.jpg\",\"https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP84S0099_BMW-3_SERIES_2019-12-19:12-05-28.jpg\"]','https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP84S0099_BMW-3_SERIES_2019-12-19:12-05-28.jpg',NULL,NULL,NULL,'https://luxury-ride-test.s3.us-east-2.amazonaws.com/FinalImages/UP84S0099_BMW-3_SERIES_2019-12-19:12-05-28.jpg\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Complete car repainted. Non accident','Y','2019-12-19 06:48:58');
/*!40000 ALTER TABLE `vehicle_condition_images_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_condition_mapping_tbl`
--

DROP TABLE IF EXISTS `vehicle_condition_mapping_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_condition_mapping_tbl` (
  `mapping_id` int(20) NOT NULL AUTO_INCREMENT,
  `sub_details_id` int(20) DEFAULT NULL,
  `status_id` int(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mapping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_condition_mapping_tbl`
--

LOCK TABLES `vehicle_condition_mapping_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_condition_mapping_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_condition_mapping_tbl` VALUES (1,1,1,'Y','2019-10-11 05:25:48'),(2,1,24,'Y','2019-10-11 05:25:48'),(3,1,3,'N','2019-10-11 05:25:48'),(4,1,5,'N','2019-10-11 05:25:49'),(5,1,6,'N','2019-10-11 05:25:49'),(6,1,7,'N','2019-10-11 05:25:49'),(7,1,8,'N','2019-10-11 05:25:49'),(8,4,1,'Y','2019-10-11 05:25:49'),(9,4,24,'Y','2019-10-11 05:25:49'),(10,4,3,'N','2019-10-11 05:25:49'),(11,4,5,'N','2019-10-11 05:25:49'),(12,4,6,'N','2019-10-11 05:25:49'),(13,4,7,'N','2019-10-11 05:25:49'),(14,4,8,'N','2019-10-11 05:25:49'),(15,5,1,'Y','2019-10-11 05:25:49'),(16,5,24,'Y','2019-10-11 05:25:50'),(17,5,3,'N','2019-10-11 05:25:50'),(18,5,4,'N','2019-10-11 05:25:50'),(22,7,1,'Y','2019-10-11 05:25:50'),(23,7,24,'Y','2019-10-11 05:25:50'),(24,7,3,'N','2019-10-11 05:25:50'),(25,7,5,'N','2019-10-11 05:25:50'),(26,7,6,'N','2019-10-11 05:25:50'),(27,7,7,'N','2019-10-11 05:25:51'),(28,7,8,'N','2019-10-11 05:25:51'),(29,8,1,'Y','2019-10-11 05:25:51'),(30,8,24,'Y','2019-10-11 05:25:51'),(31,8,3,'N','2019-10-11 05:25:51'),(32,8,4,'N','2019-10-11 05:25:51'),(33,9,1,'Y','2019-10-11 05:25:51'),(34,9,24,'Y','2019-10-11 05:25:51'),(35,9,3,'N','2019-10-11 05:25:51'),(36,9,5,'N','2019-10-11 05:25:51'),(37,9,6,'N','2019-10-11 05:25:51'),(38,9,7,'N','2019-10-11 05:25:52'),(39,9,8,'N','2019-10-11 05:25:52'),(40,10,1,'Y','2019-10-11 05:25:52'),(41,10,24,'Y','2019-10-11 05:25:52'),(42,10,10,'N','2019-10-11 05:25:52'),(43,11,1,'Y','2019-10-11 05:25:52'),(44,11,24,'Y','2019-10-11 05:25:52'),(45,11,3,'N','2019-10-11 05:25:52'),(46,11,5,'N','2019-10-11 05:25:52'),(47,11,6,'N','2019-10-11 05:25:52'),(48,11,7,'N','2019-10-11 05:25:52'),(49,11,8,'N','2019-10-11 05:25:53'),(50,12,1,'Y','2019-10-11 05:25:53'),(51,12,24,'Y','2019-10-11 05:25:53'),(52,12,3,'N','2019-10-11 05:25:53'),(53,12,5,'N','2019-10-11 05:25:53'),(54,12,6,'N','2019-10-11 05:25:53'),(55,12,7,'N','2019-10-11 05:25:53'),(56,12,8,'N','2019-10-11 05:25:53'),(57,13,1,'Y','2019-10-11 05:25:53'),(58,13,24,'Y','2019-10-11 05:25:53'),(59,13,3,'N','2019-10-11 05:25:53'),(60,13,5,'N','2019-10-11 05:25:54'),(61,13,6,'N','2019-10-11 05:25:54'),(62,13,7,'N','2019-10-11 05:25:54'),(63,13,8,'N','2019-10-11 05:25:54'),(64,14,1,'Y','2019-10-11 05:25:54'),(65,14,24,'Y','2019-10-11 05:25:54'),(66,14,3,'N','2019-10-11 05:25:54'),(67,14,5,'N','2019-10-11 05:25:54'),(68,14,6,'N','2019-10-11 05:25:54'),(69,14,7,'N','2019-10-11 05:25:54'),(70,14,8,'N','2019-10-11 05:25:54'),(71,15,1,'Y','2019-10-11 06:00:51'),(72,15,24,'Y','2019-10-11 06:00:51'),(73,15,3,'N','2019-10-11 06:00:51'),(74,15,5,'N','2019-10-11 06:00:52'),(75,15,6,'N','2019-10-11 06:00:52'),(76,15,7,'N','2019-10-11 06:00:52'),(77,15,8,'N','2019-10-11 06:00:52'),(78,16,1,'Y','2019-10-11 06:00:52'),(79,16,24,'Y','2019-10-11 06:00:52'),(80,16,3,'N','2019-10-11 06:00:52'),(81,16,5,'N','2019-10-11 06:00:52'),(82,16,6,'N','2019-10-11 06:00:52'),(83,16,7,'N','2019-10-11 06:00:52'),(84,16,8,'N','2019-10-11 06:00:52'),(85,17,1,'Y','2019-10-11 06:00:53'),(86,17,24,'Y','2019-10-11 06:00:53'),(87,17,3,'N','2019-10-11 06:00:53'),(88,17,5,'N','2019-10-11 06:00:53'),(89,17,6,'N','2019-10-11 06:00:53'),(90,17,7,'N','2019-10-11 06:00:53'),(91,17,8,'N','2019-10-11 06:00:53'),(92,18,1,'Y','2019-10-11 06:00:53'),(93,18,24,'Y','2019-10-11 06:00:53'),(94,18,3,'N','2019-10-11 06:00:53'),(95,18,4,'N','2019-10-11 06:00:53'),(96,19,1,'Y','2019-10-11 06:00:54'),(97,19,24,'Y','2019-10-11 06:00:54'),(98,19,3,'N','2019-10-11 06:00:54'),(99,19,4,'N','2019-10-11 06:00:54'),(100,20,1,'Y','2019-10-11 06:00:54'),(101,20,24,'Y','2019-10-11 06:00:54'),(102,20,3,'N','2019-10-11 06:00:54'),(103,20,5,'N','2019-10-11 06:00:55'),(104,20,6,'N','2019-10-11 06:00:55'),(105,20,7,'N','2019-10-11 06:00:55'),(106,20,8,'N','2019-10-11 06:00:55'),(107,3,1,'Y','2019-10-11 06:00:55'),(108,3,24,'Y','2019-10-11 06:00:55'),(109,3,7,'N','2019-10-11 06:00:55'),(110,3,9,'N','2019-10-11 06:00:55'),(111,6,1,'Y','2019-10-11 06:00:55'),(112,6,24,'Y','2019-10-11 06:00:55'),(113,6,7,'N','2019-10-11 06:00:55'),(114,6,9,'N','2019-10-11 06:00:56'),(115,21,1,'Y','2019-10-11 06:00:56'),(116,21,24,'Y','2019-10-11 06:00:56'),(117,21,19,'N','2019-10-11 06:00:56'),(118,22,1,'Y','2019-10-11 06:00:56'),(119,22,24,'Y','2019-10-11 06:00:56'),(120,22,3,'N','2019-10-11 06:00:56'),(121,22,5,'N','2019-10-11 06:00:56'),(122,22,6,'N','2019-10-11 06:00:56'),(123,22,7,'N','2019-10-11 06:00:56'),(124,22,8,'N','2019-10-11 06:00:56'),(125,23,1,'Y','2019-10-11 06:00:57'),(126,23,24,'Y','2019-10-11 06:00:57'),(127,23,19,'N','2019-10-11 06:00:57'),(128,24,1,'Y','2019-10-11 06:00:57'),(129,24,24,'Y','2019-10-11 06:00:57'),(130,24,19,'N','2019-10-11 06:00:57'),(131,25,1,'Y','2019-10-11 06:00:57'),(132,25,24,'Y','2019-10-11 06:00:57'),(133,25,19,'N','2019-10-11 06:00:57'),(134,26,1,'Y','2019-10-11 06:00:57'),(135,26,14,'Y','2019-10-11 06:00:57'),(136,27,1,'Y','2019-10-11 06:00:58'),(137,27,15,'Y','2019-10-11 06:00:58'),(138,27,16,'Y','2019-10-11 06:00:58'),(139,28,1,'Y','2019-10-11 06:00:58'),(140,28,14,'Y','2019-10-11 06:00:58'),(141,29,17,'Y','2019-10-11 06:00:58'),(142,29,18,'Y','2019-10-11 06:00:58'),(143,30,17,'Y','2019-10-11 06:00:58'),(144,30,18,'Y','2019-10-11 06:00:58'),(145,31,12,'Y','2019-10-11 06:00:58'),(146,31,13,'Y','2019-10-11 06:00:58'),(147,32,1,'Y','2019-10-11 06:00:59'),(148,32,10,'Y','2019-10-11 06:00:59'),(149,32,11,'Y','2019-10-11 06:00:59'),(150,33,12,'Y','2019-10-11 06:00:59'),(151,33,13,'Y','2019-10-11 06:00:59'),(152,34,1,'Y','2019-10-11 06:00:59'),(153,34,11,'Y','2019-10-11 06:00:59'),(154,34,14,'Y','2019-10-11 06:00:59'),(155,35,1,'Y','2019-10-11 06:00:59'),(156,35,11,'Y','2019-10-11 06:00:59'),(157,35,14,'Y','2019-10-11 06:00:59'),(158,36,1,'Y','2019-10-11 06:01:00'),(159,36,11,'Y','2019-10-11 06:01:00'),(160,36,14,'Y','2019-10-11 06:01:00'),(161,37,1,'Y','2019-10-11 06:01:00'),(162,37,24,'Y','2019-10-11 06:01:00'),(163,37,14,'N','2019-10-11 06:01:00'),(164,38,1,'Y','2019-10-11 06:01:00'),(165,38,24,'Y','2019-10-11 06:01:00'),(166,38,14,'N','2019-10-11 06:01:00'),(167,39,1,'Y','2019-10-11 06:01:00'),(168,39,24,'Y','2019-10-11 06:01:00'),(169,39,14,'N','2019-10-11 06:01:01'),(170,39,22,'N','2019-10-11 06:01:01'),(171,39,23,'N','2019-10-11 06:01:01'),(172,40,1,'Y','2019-10-11 06:01:01'),(173,40,24,'Y','2019-10-11 06:01:01'),(174,40,11,'N','2019-10-11 06:01:01'),(175,41,1,'Y','2019-10-11 06:01:01'),(176,41,24,'Y','2019-10-11 06:01:01'),(177,42,14,'Y','2019-10-11 06:01:01'),(178,42,17,'Y','2019-10-11 06:01:01'),(179,42,18,'Y','2019-10-11 06:01:01'),(180,43,1,'Y','2019-10-11 06:01:02'),(181,43,14,'Y','2019-10-11 06:01:02'),(182,43,19,'Y','2019-10-11 06:01:02'),(183,43,20,'Y','2019-10-11 06:01:02'),(184,44,1,'Y','2019-10-11 06:01:02'),(185,44,14,'Y','2019-10-11 06:01:02'),(186,44,19,'Y','2019-10-11 06:01:02'),(187,45,1,'Y','2019-11-15 07:20:40'),(188,45,24,'Y','2019-11-15 07:20:40'),(189,46,1,'Y','2019-11-15 07:20:40'),(190,46,24,'Y','2019-11-15 07:20:40'),(191,47,1,'Y','2019-11-15 07:20:40'),(192,47,24,'Y','2019-11-15 07:20:40'),(193,48,1,'Y','2019-11-15 07:20:40'),(194,48,24,'Y','2019-11-15 07:20:40'),(195,49,1,'Y','2019-11-15 07:20:41'),(196,49,24,'Y','2019-11-15 07:20:41'),(197,50,1,'Y','2019-11-15 07:20:41'),(198,50,24,'Y','2019-11-15 07:20:41');
/*!40000 ALTER TABLE `vehicle_condition_mapping_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_condition_status_master_tbl`
--

DROP TABLE IF EXISTS `vehicle_condition_status_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_condition_status_master_tbl` (
  `status_id` int(20) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(25) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_condition_status_master_tbl`
--

LOCK TABLES `vehicle_condition_status_master_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_condition_status_master_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_condition_status_master_tbl` VALUES (1,'Good','Y','2019-09-20 05:46:44'),(2,'Scratched','Y','2019-09-20 05:46:45'),(3,'Dented','Y','2019-09-20 05:46:45'),(4,'Crack','Y','2019-09-20 05:46:46'),(5,'Repainted','Y','2019-09-20 05:46:46'),(6,'Rusted','Y','2019-09-20 05:46:47'),(7,'Replaced','Y','2019-09-20 05:46:48'),(8,'Repair','Y','2019-09-20 05:46:48'),(9,'Damaged','Y','2019-09-20 05:46:49'),(10,'Missing','Y','2019-09-20 05:46:49'),(11,'Not Working','Y','2019-09-20 05:46:50'),(12,'Max','Y','2019-09-20 05:46:51'),(13,'Min','Y','2019-09-20 05:46:51'),(14,'Noise','Y','2019-09-20 05:46:52'),(15,'Black','Y','2019-09-20 05:46:52'),(16,'White','Y','2019-09-20 05:46:53'),(17,'Soft','Y','2019-09-20 05:46:54'),(18,'Hard','Y','2019-09-20 05:46:54'),(19,'Weak','Y','2019-09-20 05:46:55'),(20,'Abnormal','Y','2019-09-20 05:46:55'),(21,'spot','Y','2019-10-07 06:05:12'),(22,'Cabriolet','Y','2019-10-07 06:35:30'),(23,'Without sunroof','Y','2019-10-07 06:36:26'),(24,'Not Good','Y','2019-11-15 07:16:04');
/*!40000 ALTER TABLE `vehicle_condition_status_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_details_master_tbl`
--

DROP TABLE IF EXISTS `vehicle_details_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_details_master_tbl` (
  `details_id` int(11) NOT NULL AUTO_INCREMENT,
  `details` varchar(200) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_details_master_tbl`
--

LOCK TABLES `vehicle_details_master_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_details_master_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_details_master_tbl` VALUES (1,'Exterior + Tyres','Y','2018-12-13 13:49:30','2018-12-13 13:49:30'),(2,'Engine + Trasmission','Y','2018-12-13 13:49:30','2018-12-13 13:49:30'),(3,'Air Conditioning','Y','2018-12-13 13:49:30','2018-12-13 13:49:30'),(4,'Electricals + Interiors','Y','2018-12-13 13:49:30','2018-12-13 13:49:30'),(5,'Steering + Suspension + Brakes','Y','2018-12-13 13:49:30','2019-09-23 05:40:34');
/*!40000 ALTER TABLE `vehicle_details_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_document_details_tbl`
--

DROP TABLE IF EXISTS `vehicle_document_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_document_details_tbl` (
  `document_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `manufacturing_year` varchar(50) DEFAULT NULL,
  `chasis_no` varchar(100) DEFAULT NULL,
  `engine_no` varchar(25) DEFAULT NULL,
  `insurance_expiry` date DEFAULT NULL,
  `insurance_image` text,
  `rc_availability` varchar(20) DEFAULT NULL,
  `rc_image` text,
  `inter_state` char(10) DEFAULT 'No',
  `inter_state_noc_issued` char(10) DEFAULT 'No',
  `inter_state_road_tax_paid` char(10) DEFAULT 'No',
  `under_hypothecation` char(10) DEFAULT 'No',
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`document_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_document_details_tbl`
--

LOCK TABLES `vehicle_document_details_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_document_details_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_document_details_tbl` VALUES (1,10,'10/2017','Gxhhggggg',NULL,'2019-12-11',NULL,'Not-Expired',NULL,NULL,NULL,NULL,'YES','Y','2019-12-11 08:26:08','2019-12-11 08:26:08'),(2,118,'06/2017','Wbajc3702hwa10024',NULL,'2020-08-30',NULL,'Not-Expired','https://luxury-ride-test.s3.us-east-2.amazonaws.com/VehicleDocumentDetails/UP160000_BMW-5_SERIES_2019-12-17:18-34-12.jpg',NULL,NULL,NULL,'YES','Y','2019-12-17 13:07:20','2019-12-17 13:07:20'),(3,107,'05/2014','Wmwxt32060t855608',NULL,'2020-09-25',NULL,'Not-Expired','https://luxury-ride-test.s3.us-east-2.amazonaws.com/VehicleDocumentDetails/HR26CS4346_MINI-COOPER_2019-12-17:18-51-17.jpg',NULL,NULL,NULL,'NO','Y','2019-12-17 13:21:22','2019-12-17 13:21:22'),(4,117,'09/2018','Wauzgjf46jy701094',NULL,'2020-02-07','https://luxury-ride-test.s3.us-east-2.amazonaws.com/VehicleDocumentDetails/UP160000_AUDI-A4_2019-12-17:23-44-07.jpg','Expired','https://luxury-ride-test.s3.us-east-2.amazonaws.com/VehicleDocumentDetails/UP160000_AUDI-A4_2019-12-17:23-44-53.jpg',NULL,NULL,NULL,'YES','Y','2019-12-17 18:16:17','2019-12-17 18:16:17'),(6,115,'01/2015','Wauzaf4g1fy001194',NULL,'2019-03-31','https://luxury-ride-test.s3.us-east-2.amazonaws.com/VehicleDocumentDetails/DL2CAP6714_AUDI-A6_2019-12-18:16-23-54.jpg','Not-Expired','https://luxury-ride-test.s3.us-east-2.amazonaws.com/VehicleDocumentDetails/DL2CAP6714_AUDI-A6_2019-12-18:16-24-11.jpg',NULL,NULL,NULL,'NO','Y','2019-12-18 10:54:29','2019-12-18 10:54:29'),(7,131,'10/2014','Wba3y37070d455852',NULL,'2020-10-26',NULL,'Not-Expired',NULL,NULL,NULL,NULL,'NO','Y','2019-12-19 10:04:15','2019-12-19 10:04:15'),(8,154,'01/2017','Wbawx970xhla04843',NULL,'2020-03-31','https://luxuryride-prod.s3.us-east-2.amazonaws.com/VehicleDocumentDetails/DL0000_BMW-X3_2019-12-21:13-02-47.jpg','Not-Expired',NULL,NULL,NULL,NULL,'YES','Y','2019-12-21 07:33:16','2019-12-21 07:33:16'),(9,2,'12/2019','sadfwer',NULL,'2019-12-17','https://luxuryride-prod.s3.us-east-2.amazonaws.com/VehicleDocumentDetails/RJ140000_BMW-3_SERIES_2019-12-23:17-16-17.jpg','Expired',NULL,NULL,NULL,NULL,'YES','Y','2019-12-23 11:46:59','2019-12-23 11:46:59');
/*!40000 ALTER TABLE `vehicle_document_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_full_details_tbl`
--

DROP TABLE IF EXISTS `vehicle_full_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_full_details_tbl` (
  `model_id` int(12) NOT NULL AUTO_INCREMENT,
  `car_id` int(20) DEFAULT NULL,
  `car_model` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `car_type` varchar(25) DEFAULT NULL,
  `car_varient` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_full_details_tbl`
--

LOCK TABLES `vehicle_full_details_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_full_details_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_full_details_tbl` VALUES (1,1,'A4','2019-11-25 12:30:16','Y','2',NULL),(2,1,'A6','2019-11-25 12:30:16','Y','2',NULL),(3,1,'Q5','2019-11-25 12:30:16','Y','3',NULL),(4,1,'A8','2019-11-25 12:30:16','Y','2',NULL),(5,1,'Q3','2019-11-25 12:30:16','Y','3',NULL),(6,1,'Q7','2019-11-25 12:30:16','Y','3',NULL),(7,1,'A3','2019-11-25 12:30:16','Y','8',NULL),(8,1,'A5','2019-11-25 12:30:16','Y','4',NULL),(9,1,'R8','2019-11-25 12:30:16','Y','4',NULL),(10,2,'Flying Spur','2019-11-25 12:30:16','Y','4',NULL),(11,3,'3 Series','2019-11-25 12:30:16','Y','2',NULL),(12,3,'5 Series','2019-11-25 12:30:16','Y','2',NULL),(13,3,'1 Series','2019-11-25 12:30:16','Y','9',NULL),(14,3,'3 Series GT','2019-11-25 12:30:16','Y','2',NULL),(15,3,'X5','2019-11-25 12:30:16','Y','3',NULL),(16,3,'6 Series','2019-11-25 12:30:16','Y','4',NULL),(17,3,'X3','2019-11-25 12:30:16','Y','3',NULL),(18,3,'Z4','2019-11-25 12:30:17','Y','10',NULL),(19,3,'X1','2019-11-25 12:30:17','Y','3',NULL),(20,3,'7 Series','2019-11-25 12:30:17','Y','2',NULL),(21,3,'M5','2019-11-25 12:30:17','Y','4',NULL),(22,3,'X6','2019-11-25 12:30:17','Y','4',NULL),(23,4,'Avanti','2019-11-25 12:30:17','Y','4',NULL),(24,6,'Endeavour','2019-11-25 12:30:17','Y','3',NULL),(25,6,'Mustang','2019-11-25 12:30:17','Y','4',NULL),(26,7,'Elantra','2019-11-25 12:30:17','Y','2',NULL),(27,7,'Verna','2019-11-25 12:30:17','Y','2',NULL),(28,8,'XF','2019-11-25 12:30:17','Y','2',NULL),(29,8,'XJ L','2019-11-25 12:30:17','Y','2',NULL),(30,8,'F PACE','2019-11-25 12:30:17','Y','3',NULL),(31,8,'XJ','2019-11-25 12:30:17','Y','4',NULL),(32,8,'XE','2019-11-25 12:30:17','Y','2',NULL),(33,9,'Range Rover Sport','2019-11-25 12:30:17','Y','3',NULL),(34,9,'Range Rover Evoque','2019-11-25 12:30:17','Y','3',NULL),(35,9,'Range Rover','2019-11-25 12:30:18','Y','3',NULL),(36,9,'Discovery Sport','2019-11-25 12:30:18','Y','3',NULL),(37,9,'Freelander 2','2019-11-25 12:30:18','Y','3',NULL),(38,9,'Discovery','2019-11-25 12:30:18','Y','3',NULL),(39,10,'Thar','2019-11-25 12:30:18','Y','3',NULL),(40,11,'Swift Dzire','2019-11-25 12:30:18','Y','2',NULL),(41,11,'Swift','2019-11-25 12:30:18','Y','2',NULL),(42,12,'E CLASS','2019-11-25 12:30:18','Y','2',NULL),(43,12,'GLA CLASS','2019-11-25 12:30:18','Y','3',NULL),(44,12,'C CLASS','2019-11-25 12:30:18','Y','2',NULL),(45,12,'GL','2019-11-25 12:30:18','Y','3',NULL),(46,12,'S CLASS','2019-11-25 12:30:18','Y','2',NULL),(47,12,'CLA CLASS','2019-11-25 12:30:18','Y','8',NULL),(48,12,'M CLASS','2019-11-25 12:30:18','Y','3',NULL),(49,12,'GLE','2019-11-25 12:30:18','Y','3',NULL),(50,12,'GLS','2019-11-25 12:30:19','Y','3',NULL),(51,12,'S450','2019-11-25 12:30:19','Y','4',NULL),(52,12,'GLC CLASS','2019-11-25 12:30:19','Y','3',NULL),(53,12,'B CLASS','2019-11-25 12:30:19','Y','9',NULL),(54,12,'GLE CLASS','2019-11-25 12:30:19','Y','3',NULL),(55,12,'A CLASS','2019-11-25 12:30:19','Y','2',NULL),(56,13,'Cooper','2019-11-25 12:30:19','Y','1',NULL),(57,13,'Countryman','2019-11-25 12:30:19','Y','3',NULL),(58,13,'Convertible','2019-11-25 12:30:19','Y','1',NULL),(59,14,'Pajero','2019-11-25 12:30:19','Y','3',NULL),(60,16,'Macan','2019-11-25 12:30:19','Y','3',NULL),(61,16,'Panamera','2019-11-25 12:30:19','Y','4',NULL),(62,16,'Cayenne S','2019-11-25 12:30:19','Y','3',NULL),(63,16,'911','2019-11-25 12:30:20','Y','12',NULL),(64,16,'Carrera','2019-11-25 12:30:20','Y','11',NULL),(65,16,'Boxster','2019-11-25 12:30:20','Y','4',NULL),(66,18,'Rapid','2019-11-25 12:30:20','Y','2',NULL),(67,19,'Fortuner','2019-11-25 12:30:20','Y','3',NULL),(68,19,'Corolla Altis','2019-11-25 12:30:20','Y','2',NULL),(69,19,'Camry','2019-11-25 12:30:20','Y','2',NULL),(70,20,'V90 Cross Country','2019-11-25 12:30:20','Y','3',NULL),(71,20,'S60 Cross Country','2019-11-25 12:30:20','Y','2',NULL),(72,20,'S60','2019-11-25 12:30:20','Y','2',NULL),(73,20,'XC90','2019-11-25 12:30:20','Y','3',NULL),(74,20,'XC60','2019-11-25 12:30:20','Y','3',NULL),(75,20,'S90','2019-11-25 12:30:20','Y','2',NULL),(76,20,'V40','2019-11-25 12:30:20','Y','9',NULL),(77,20,'V90','2019-11-25 12:30:20','Y','2',NULL),(78,3,'3 series 4-door','2019-11-28 09:07:21','Y','2',NULL),(79,3,'3 series 2-door','2019-11-28 09:07:21','Y','4',NULL),(80,3,'3 series 5-door','2019-11-28 09:07:21','Y','1',NULL),(81,3,'3 series 3-door','2019-11-28 09:07:21','Y','1',NULL),(82,3,'1 series','2019-11-28 09:07:21','Y','4',NULL),(83,6,'Mustang 3 door','2019-11-28 09:07:21','Y','1',NULL),(84,8,'XF','2019-11-28 09:07:21','Y','4',NULL),(85,12,'A CLASS','2019-11-28 09:07:21','Y','9',NULL),(86,1,'S5','2019-12-03 13:04:16','Y','2',NULL),(87,20,'V40 Cross Country','2019-12-03 13:10:04','Y','1',NULL),(88,12,'C43/CLA45 AMG','2019-12-03 13:19:12','Y','2',NULL),(89,3,'X6 35I M sport','2019-12-03 13:28:11','Y','3',NULL),(90,12,'GLC43/GLE43 AMG','2019-12-03 13:29:49','Y','3',NULL),(91,8,'EVOQUE','2019-12-03 13:31:07','Y','3',NULL),(92,8,'DISCOVERY & DISCOVERY SPORTS','2019-12-03 13:31:07','Y','3',NULL),(93,8,'VELAR','2019-12-03 13:31:07','Y','3',NULL),(94,8,'RR SPORT','2019-12-03 13:31:07','Y','3',NULL),(95,20,'XC40','2019-12-03 13:31:51','Y','3',NULL),(96,16,'MACAN TURBO','2019-12-03 13:32:44','Y','3',NULL),(97,20,'V40 Cross','2019-12-03 13:36:33','Y','9',NULL),(98,1,'TT','2019-12-03 13:37:13','Y','10',NULL),(99,1,'RS7','2019-12-03 13:39:55','Y','4',NULL),(100,3,'M5','2019-12-03 13:40:53','Y','4',NULL),(101,3,'M3','2019-12-03 13:40:53','Y','4',NULL),(102,3,'M6','2019-12-03 13:40:53','Y','12',NULL),(103,12,'SLK AMG','2019-12-03 13:43:19','Y','12',NULL),(104,12,'G63 AMG','2019-12-03 13:43:48','Y','13',NULL),(105,8,'F TYPE','2019-12-03 13:45:08','Y','12',NULL),(106,8,'RR VOGUE','2019-12-03 13:45:08','Y','13',NULL);
/*!40000 ALTER TABLE `vehicle_full_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_master_tbl`
--

DROP TABLE IF EXISTS `vehicle_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_master_tbl` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_lead_id` int(20) NOT NULL,
  `vehicle_no` varchar(25) DEFAULT NULL,
  `manufactured_year` varchar(20) DEFAULT NULL,
  `vehicle_type` varchar(25) DEFAULT NULL,
  `vehicle_varient` varchar(25) DEFAULT NULL,
  `car_make` varchar(50) DEFAULT NULL,
  `car_model` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `fuel_type` varchar(20) DEFAULT NULL,
  `registration_year` varchar(25) DEFAULT NULL,
  `pincode` varchar(15) DEFAULT NULL,
  `no_of_owners` varchar(20) DEFAULT NULL,
  `vehicle_condition` varchar(25) DEFAULT NULL,
  `expected_selling_price` varchar(10) DEFAULT NULL,
  `odometer` varchar(20) DEFAULT NULL,
  `transmission` varchar(25) DEFAULT NULL,
  `vehicle_video` text,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vehicle_id`),
  KEY `purchase_lead_id` (`purchase_lead_id`),
  CONSTRAINT `vehicle_master_tbl_ibfk_1` FOREIGN KEY (`purchase_lead_id`) REFERENCES `purchase_lead_tbl` (`purchase_lead_id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_master_tbl`
--

LOCK TABLES `vehicle_master_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_master_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_master_tbl` VALUES (1,1,'DL1CKJLK22','03/2015','1','57','1','7','2','Silver','Diesel',NULL,'122001','First Owner','Good','2900000','11000',NULL,NULL,'Y','2019-11-28 06:05:02','2019-12-09 14:17:27'),(2,2,'RJ140000','0/2014','2','67','3','11','3','White','Diesel',NULL,'122001','Second Owner','Good','1951000','51000',NULL,NULL,'Y','2019-11-28 06:48:20','2019-12-09 14:17:29'),(3,3,'RJ140000','03/2014','1',NULL,'20','76','3','Red','Diesel',NULL,'122001','First Owner','Good','1500000','91000',NULL,NULL,'Y','2019-11-28 06:56:33','2019-12-17 18:46:12'),(4,4,'rj140000','0/2015','1','43','1','5','3','Gray','Diesel',NULL,'302001','Second Owner','Good','2200000','54000',NULL,NULL,'Y','2019-11-28 07:11:08','2019-12-09 14:17:29'),(5,5,'DL8CZ5272','0/2013','1',NULL,'12','4','1','Silver','Diesel',NULL,'110000','Second Owner','Good','1600000','70000',NULL,NULL,'Y','2019-11-28 07:44:00','2019-12-17 18:46:12'),(6,6,'DL0000','01/2015','3','92','3','12','8','White','Diesel',NULL,'110000','First Owner','Good','2800000','20000',NULL,NULL,'Y','2019-11-28 10:19:16','2019-12-09 14:17:26'),(7,7,'PB10HA5005','12/2018','2','115','3','19','5','White','Diesel',NULL,'141001','First Owner','Good','31500000','7500',NULL,NULL,'Y','2019-11-28 10:24:39','2019-12-09 14:17:29'),(8,8,'pb10000','12/2017','3',NULL,'16','62','5','Black','Diesel','0','141002','First Owner','Good','8500000','18000',NULL,NULL,'Y','2019-11-28 10:28:23','2019-12-17 18:46:13'),(9,9,'DL9CAA7931','03/2015','2','9','1','3','15','White','Diesel',NULL,'123401','First Owner','Good','2400000','48000',NULL,NULL,'Y','2019-11-28 10:33:57','2019-12-09 14:17:30'),(10,10,'HR26CG7041','01/2014','2','7','1','1','2','Blue','Diesel',NULL,'122001','Second Owner','Good','13500000','52300',NULL,NULL,'Y','2019-11-28 10:58:39','2019-12-09 14:17:27'),(11,11,'HR260000','07/2017','2','115','3','19','2','Blue','Diesel',NULL,'122001','First Owner','Good','2600000','26000',NULL,NULL,'Y','2019-11-28 11:18:09','2019-12-09 14:17:27'),(12,12,'HR260000','03/2016','3','34','1','3','2','White','Diesel','0','122001','First Owner','Good','2600000','40000',NULL,NULL,'Y','2019-11-29 09:01:42','2019-12-09 14:17:28'),(13,13,'HR26DY0055','06/2018','3',NULL,'9','34','2','White','Diesel','2019','122001','First Owner','Good','4500000','14000',NULL,NULL,'Y','2019-11-29 09:04:47','2019-12-17 18:46:13'),(14,14,'UP14000','02/2018','3',NULL,'9','34','12','White','Diesel','2018','?20130','First Owner','Good','4000000','29000',NULL,NULL,'Y','2019-11-29 10:43:33','2019-12-17 18:46:13'),(15,15,'HR26DL1667','11/2017','2','1','1','1','2','Blue','Diesel','2018','122001','First Owner','Good','3200000','14500',NULL,NULL,'Y','2019-11-29 11:45:45','2019-12-09 14:17:28'),(16,16,'HR51','12/2012','3','34','1','3','9','White','Diesel','2013','110001','Second Owner','Good','2100000','50000',NULL,NULL,'Y','2019-11-30 11:49:12','2019-12-09 14:17:27'),(17,17,'HR26000','07/2016','2','63','3','11','2','Blue','Diesel','2016','122001','First Owner','Good','2200000','32000',NULL,NULL,'Y','2019-11-30 11:51:35','2019-12-09 14:17:28'),(18,18,'HP120000','04/2017','2',NULL,'8','28','15','White','Diesel','2018','123401','First Owner','Good','4600000','8300',NULL,NULL,'Y','2019-11-30 11:54:58','2019-12-17 18:46:13'),(19,19,'UP1400000','06/2018','3',NULL,'9','34','12','White','Diesel','2018','201301','First Owner','Good','40000000','29000',NULL,NULL,'Y','2019-11-30 11:57:22','2019-12-17 18:46:13'),(20,20,'HR700000','08/2016','3','100','3','15','5','White','Diesel','2016',NULL,'Second Owner','Good','4000000','75000',NULL,NULL,'Y','2019-11-30 12:02:54','2019-12-09 14:17:29'),(21,21,'DL00000','02/2015','2',NULL,'12','46','8','White','Petrol','2015','110001','Second Owner','Good','4000000','25000',NULL,NULL,'Y','2019-12-03 10:20:53','2019-12-17 18:46:13'),(22,22,'HR26DC6500','01/2016','2','79','3','12','12','Blue','Diesel','2017','400047','First Owner','Good','2800000','45000',NULL,NULL,'Y','2019-12-03 10:25:12','2019-12-09 14:17:30'),(23,23,'MP030000','09/2017','3','50','1','6','10','White','Petrol','2017','452001','First Owner','Good','5300000','13000',NULL,NULL,'Y','2019-12-03 10:28:15','2019-12-09 14:17:29'),(24,24,'UK073333','05/2018','3','249','20','73','8','White','Diesel','2018','110001','First Owner','Good','7000000','3500',NULL,NULL,'Y','2019-12-03 10:30:54','2019-12-09 14:17:26'),(25,25,'HR26CT6473','03/2015','3','34','1','3','2','White','Diesel','2016','122001','First Owner','Good','2600000','40000',NULL,NULL,'Y','2019-12-03 10:43:51','2019-12-09 14:17:28'),(26,26,'HR260000','03/2015','2','4','1','1','2','White','Petrol','2016','120001','First Owner','Good','2500000','52000',NULL,NULL,'Y','2019-12-03 11:38:00','2019-12-09 14:17:28'),(27,27,'PB100000','0/2016','3','217','12','49','5','Black','Diesel','2016','140412','First Owner','Good','3600000','50000',NULL,NULL,'Y','2019-12-03 11:46:51','2019-12-09 14:17:29'),(28,28,'UP32KH8800','08/2018','2',NULL,'12','42','8','White','Diesel','2019','110001','First Owner','Good','2750000','30000',NULL,NULL,'Y','2019-12-03 12:16:50','2019-12-17 18:46:13'),(29,29,NULL,'04/2018','2','79','3','12','7','Blue','Diesel','2019','131028','First Owner','Good','4100000','27000',NULL,NULL,'Y','2019-12-03 12:29:06','2019-12-09 14:17:29'),(30,30,'MH43AT8284','0/0','3','217','12','49','8','Black','Diesel','0','110001','First Owner','Good','3900000','50000',NULL,NULL,'Y','2019-12-03 12:32:05','2019-12-09 14:17:26'),(31,31,'DL2CAQ7585','08/2015','2','160','12','42','8','Red','Diesel','2016','110001','First Owner','Good','2300000','22000',NULL,NULL,'Y','2019-12-03 12:35:21','2019-12-09 14:17:26'),(32,32,'UK07BD5369','04/2014','3','33','1','3','4','White','Diesel','2014','364000','First Owner','Good','1800000','67000',NULL,NULL,'Y','2019-12-04 11:18:27','2019-12-09 14:17:29'),(33,33,'HR100000','02/2018','2','79','3','12','16','Blue','Diesel','2018','131001','First Owner','Good','4100000','27300',NULL,NULL,'Y','2019-12-04 11:21:31','2019-12-09 14:17:30'),(34,34,'PB020000','03/2016','2','18','1','2','14','Black','Diesel','2016','131001','Second Owner','Good','2600000','60000',NULL,NULL,'Y','2019-12-04 11:25:36','2019-12-09 14:17:30'),(35,35,'DL00000','10/2016','2','76','3','12','8','Blue','Diesel','2016','110001','First Owner','Average','32400000','43000',NULL,NULL,'Y','2019-12-04 11:27:48','2019-12-09 14:17:26'),(36,36,'MH310000','07/2014','2','75','3','12','11','White','Diesel','2014',NULL,'Second Owner','Good','2200000','55000',NULL,NULL,'Y','2019-12-04 11:31:10','2019-12-09 14:17:30'),(37,37,'RJ280000','10/2015','2','4','1','1','6','White','Petrol','2015','323031','Second Owner','Good','1800000','45000',NULL,NULL,'Y','2019-12-04 11:38:20','2019-12-09 14:17:29'),(38,38,'PB03A0008','06/2014','2','2','1','1','14','White','Diesel','2014','131001','First Owner','Good','2200000','34000',NULL,NULL,'Y','2019-12-04 11:41:24','2019-12-09 14:17:30'),(39,39,'dl00000','07/2013','2','6','1','1','8','Black','Diesel','2014','110001','First Owner','Good','1500000','18800',NULL,NULL,'Y','2019-12-04 12:08:19','2019-12-09 14:17:26'),(40,40,'DL2CAP6714','05/2015','2','18','1','2','2','Silver','Diesel','2015','122001','First Owner','Good','2200000','44000',NULL,NULL,'Y','2019-12-05 07:34:31','2019-12-09 14:17:28'),(41,41,'DL2CAT2474','03/2014','3','46','1','6','24','White','Diesel','2014','700001','First Owner','Good','2000000','112000',NULL,NULL,'Y','2019-12-05 08:30:04','2019-12-09 14:17:29'),(42,42,'HR5100000','06/2016','3',NULL,'9','34','2','Blue','Diesel','2016','122001','First Owner','Good','3500000','22000',NULL,NULL,'Y','2019-12-05 08:32:16','2019-12-17 18:46:13'),(43,43,'RJ1400000','04/2018','2','174','12','44','3','White','Diesel','2018','302001','First Owner','Good','3170000','29500',NULL,NULL,'Y','2019-12-05 08:36:38','2019-12-09 14:17:29'),(44,44,'UP16BC1270','08/2015','3','167','12','43','8','White','Diesel','2015','110001','Second Owner','Good','1850000','50000',NULL,NULL,'Y','2019-12-05 08:39:00','2019-12-09 14:17:26'),(45,45,'HR2600000','05/2017','2','75','3','12','2','Blue','Diesel','2017','122001','First Owner','Good','3500000','11000',NULL,NULL,'Y','2019-12-05 08:41:43','2019-12-09 14:17:28'),(46,46,'DL3C0000','06/2017','2','173','12','44','8','Silver','Petrol','2017','110001','First Owner','Good','2450000','14000',NULL,NULL,'Y','2019-12-05 09:10:22','2019-12-09 14:17:27'),(47,47,'HR260000','12/0002','2','172','12','44','8','Red','Diesel','0001','110001','First Owner','Good','2100000','11500',NULL,NULL,'Y','2019-12-05 12:18:05','2019-12-09 14:17:27'),(48,48,'DL8CAL5974','05/2016','2','21','1','2','8','White','Diesel','2016','110001','Second Owner','Good','2700000','16000',NULL,NULL,'Y','2019-12-06 06:33:52','2019-12-09 14:17:27'),(49,49,'HR26CC9800','09/2013','3','33','1','3','2','White','Diesel','2013','122001','First Owner','Good','1900000','55000',NULL,NULL,'Y','2019-12-06 07:28:36','2019-12-09 14:17:28'),(50,50,'UK070000','07/2015','2','21','1','2','18','Black','Diesel','2015','248001','Second Owner','Good','3000000','56000',NULL,NULL,'Y','2019-12-06 07:51:18','2019-12-09 14:17:26'),(51,51,'UP32KB9991','05/2018','2','null','20','77','20','White','Diesel','2018','273001','First Owner','Good','6500000','24000',NULL,NULL,'Y','2019-12-06 09:03:57','2019-12-17 18:46:14'),(52,52,'UK080000','02/2016','2','2','1','1','25','White','Diesel','2016','273001','Second Owner','Good','1800000','75000',NULL,NULL,'Y','2019-12-06 09:06:52','2019-12-09 14:17:28'),(53,53,'GJ0600000','06/2015','2','75','3','12','21','Brown','Diesel','2015','382340','First Owner','Good','2400000','43000',NULL,NULL,'Y','2019-12-06 10:50:55','2019-12-09 14:17:27'),(54,54,NULL,'0/0','2','65','3','11','10','White','Diesel','0','452001','First Owner','Good','1900000','57000',NULL,NULL,'Y','2019-12-06 10:53:34','2019-12-09 14:17:29'),(55,55,'HP140000','06/2015','2','199','12','46','2','Black','Diesel','2016','122001','First Owner','Good','6000000','29000',NULL,NULL,'Y','2019-12-06 10:55:53','2019-12-09 14:17:28'),(56,56,'HR260000','11/2015','3',NULL,'12','50','2','White','Diesel','2015','122001','First Owner','Good','5100000','47000',NULL,NULL,'Y','2019-12-06 10:58:02','2019-12-17 18:46:14'),(57,57,'HR26CJ5005','02/2014','2','145','12','42','2','White','Diesel','2014','122001','Second Owner','Good','2050000','58000',NULL,NULL,'Y','2019-12-06 11:00:10','2019-12-09 14:17:27'),(58,58,'HR260000','07/2014','2','196','12','46','25','White','Diesel','2014','281001','First Owner','Good','4500000','51000',NULL,NULL,'Y','2019-12-06 11:12:25','2019-12-09 14:17:30'),(59,59,'HR26DT0273','03/2018','2','129','8','29','25','White','Diesel','2018','281001','First Owner','Good','7800000','1800',NULL,NULL,'Y','2019-12-06 11:14:18','2019-12-09 14:17:30'),(60,60,'DL2CAT1099','06/2014','2','18','1','2','8','White','Diesel','2014','110075',NULL,'Good','2200000','32300',NULL,NULL,'Y','2019-12-07 10:08:26','2019-12-09 14:17:27'),(61,61,'UK07BN5000','09/2014','2','3','1','1','23','Brown','Diesel','2015','132001','First Owner','Good','1495000','61000',NULL,NULL,'Y','2019-12-07 10:11:23','2019-12-09 14:17:29'),(62,62,'MH03CS1619','08/2017','2','175','12','44','2','Blue','Diesel','2017','122001','First Owner','Good','3200000','12000',NULL,NULL,'Y','2019-12-07 12:23:16','2019-12-09 14:17:28'),(63,63,'MH14EC6063','09/2014','2','175','12','44','26','White','Diesel','2015','111045','First Owner','Good','2400000','50000',NULL,NULL,'Y','2019-12-07 12:25:21','2019-12-09 14:17:30'),(64,64,'CH00000','09/2018','2','161','12','42','8','Blue','Diesel','2018','110001','First Owner','Good','4951000','13510',NULL,NULL,'Y','2019-12-07 12:27:19','2019-12-09 14:17:27'),(65,65,'HR2600000','0/0','3','226','16','62','2','Blue','Petrol','0','122001','First Owner','Good','5000000','35000',NULL,NULL,'Y','2019-12-09 08:31:24','2019-12-09 14:17:28'),(66,66,'HR91 TEMP0000','03/2019','2','154','12','42','8','Black','Diesel','2019','110001','First Owner','Good','5700000','6500',NULL,NULL,'Y','2019-12-09 10:32:23','2019-12-09 14:17:27'),(67,67,'HR26CW0000','01/2018','2','161','12','42','19','White','Diesel','2018','403110','First Owner','Good','4900000','5118',NULL,NULL,'Y','2019-12-09 10:38:17','2019-12-09 14:17:27'),(68,68,'CH01AX0000','08/2013','2','148','12','42','17','Silver','Diesel','2014',NULL,'Second Owner','Good','30000000','10000',NULL,NULL,'Y','2019-12-09 12:37:39','2019-12-09 14:17:26'),(69,69,'CH01AZ9292','5/2014','2','17','1','1','17','White','Diesel','2015',NULL,'Second Owner','Good','1700000','60000',NULL,NULL,'Y','2019-12-09 12:40:02','2019-12-17 18:47:03'),(70,70,'CH101(T)0973','11/2018','2','21','1','2','17','White','Diesel','2018',NULL,'First Owner','Good','3800000','56000',NULL,NULL,'Y','2019-12-09 12:42:16','2019-12-09 14:17:26'),(71,71,'CHAX10000','02/2013','2','63','3','11','17','White','Diesel','2013',NULL,'First Owner','Good','2000000','46000',NULL,NULL,'Y','2019-12-09 12:44:29','2019-12-09 14:17:26'),(72,72,'PY050088','0/0','3','249','20','73','15','White','Diesel','0',NULL,'Third Owner','Good','3900000','46000',NULL,NULL,'Y','2019-12-10 07:19:32','2019-12-10 07:19:32'),(73,73,'OD02BB1100','12/2018','2','133','8','32','8','White','Diesel','2018',NULL,'First Owner','Good','3000000','17000',NULL,NULL,'Y','2019-12-10 07:21:39','2019-12-17 18:31:46'),(74,74,'HR2600000','07/2017','2','119','3','20','8','White','Diesel','2018','110001','First Owner','Good','8400000','15000',NULL,NULL,'Y','2019-12-10 07:23:46','2019-12-10 07:23:46'),(75,75,'DL8CA00000','02/2015','3','32','1','3','8','Gray','Diesel','2015','110001','First Owner','Good','2200000','53500',NULL,NULL,'Y','2019-12-10 10:53:58','2019-12-10 10:53:58'),(76,76,'UNREGISTRED','0/2018','3',NULL,'9','38','12','Silver','Petrol','2018',NULL,'Many','Good','44500000','10919',NULL,NULL,'Y','2019-12-10 10:57:32','2019-12-17 18:46:14'),(77,77,'CH0000','07/2017','3',NULL,'9','38','8','Blue','Diesel','2017','110001','First Owner','Good','3250000','50000',NULL,NULL,'Y','2019-12-10 11:01:43','2019-12-17 18:46:14'),(78,78,'DL0000','09/2019','3',NULL,'12','50','8','Blue','Diesel','2019','110001',NULL,'Good','6825000','5150',NULL,NULL,'Y','2019-12-10 11:04:03','2019-12-17 18:46:14'),(79,79,'DL00000','07/2016','3','32','1','3','8','White','Diesel','2016','110001','First Owner','Good','2650000','65000',NULL,NULL,'Y','2019-12-11 08:45:39','2019-12-11 11:31:03'),(80,80,'HR26DC3739','01/2016','2','62','3','11','27','Blue','Diesel','2017',NULL,'Second Owner','Good','2500000','30000',NULL,NULL,'N','2019-12-11 09:23:13','2019-12-11 12:28:56'),(81,81,'HR26DC3739','0/0','2','62','3','11','27','Blue','Diesel','0',NULL,'Second Owner','Good','2500000','30000',NULL,NULL,'Y','2019-12-11 09:26:40','2019-12-11 11:31:03'),(82,82,'HR100000','08/2016','3','115','3','19','8','Blue','Diesel','2016','110001','First Owner','Good','1900000','70000',NULL,NULL,'Y','2019-12-11 09:29:18','2019-12-11 11:31:03'),(83,83,'DL7CT0000','06/2014','2','62','3','11','8','White','Diesel','2014',NULL,'First Owner','Good','1900000','35000',NULL,NULL,'Y','2019-12-11 09:31:13','2019-12-11 11:31:03'),(84,84,'DL6CM5628','0/0','2',NULL,'8','28','8','Black','Diesel','0',NULL,'First Owner','Good','2300000','57000',NULL,NULL,'Y','2019-12-11 09:32:45','2019-12-17 18:46:14'),(85,85,'DL3CCF0600','10/2011','2',NULL,'1','4','8','White','Petrol','2011',NULL,'First Owner','Good','2200000','50000',NULL,NULL,'Y','2019-12-11 09:34:32','2019-12-17 18:46:14'),(86,86,'UK07BL5151','03/2015','3','167','12','43','2','White','Diesel','2015',NULL,'First Owner','Good','1500000','54000',NULL,NULL,'Y','2019-12-11 09:36:58','2019-12-11 11:31:03'),(87,87,'up160000','04/2015','2','62','3','11','13','Black','Diesel','2015',NULL,'First Owner','Good','3000000','28000',NULL,NULL,'Y','2019-12-11 11:40:25','2019-12-11 13:30:40'),(88,88,'hr00000','06/2016','3','115','3','19','23','White','Diesel','2016',NULL,'First Owner','Good','2500000','45000',NULL,NULL,'Y','2019-12-11 11:42:38','2019-12-11 13:30:40'),(89,89,'DL2CAT5747','11/2014','2','20','1','2','8','White','Diesel','2015',NULL,'First Owner','Good','2500000','37000',NULL,NULL,'Y','2019-12-11 11:45:08','2019-12-11 13:30:40'),(90,90,'DL2CAT5262','08/2015','3','36','1','5','13','White','Diesel','2015',NULL,'First Owner','Good','2090000','40000',NULL,NULL,'Y','2019-12-11 11:47:20','2019-12-11 13:30:41'),(91,91,'up160000','06/2017','2',NULL,'8','28','8','White','Diesel','2017',NULL,'First Owner','Good','5500000','20000',NULL,NULL,'Y','2019-12-11 12:31:30','2019-12-17 18:46:15'),(92,92,'HR26CP0531','07/2015','8','55','1','7','2','Blue','Diesel','2015','122001','First Owner','Good','1450000','50000',NULL,NULL,'Y','2019-12-12 11:47:15','2019-12-12 11:47:15'),(93,93,'UK070000','10/2014','2',NULL,'12','46','5','White','Diesel','2014',NULL,'First Owner','Good','700000','95000',NULL,NULL,'Y','2019-12-12 11:49:44','2019-12-17 18:46:15'),(94,94,'HR260000','11/2015','3',NULL,'16','62','17','White','Diesel','2015',NULL,'First Owner','Good','4500000','54000',NULL,NULL,'Y','2019-12-12 12:18:43','2019-12-17 18:46:15'),(95,95,'HR260000','09/2017','2','170','12','44','2','Blue','Petrol','2017',NULL,'First Owner','Good','2850000','11637',NULL,NULL,'Y','2019-12-12 12:20:53','2019-12-12 12:20:53'),(96,96,'UP320000','10/2018','2','149','12','42','8','Blue','Diesel','2018',NULL,'First Owner','Good','5800000','1900',NULL,NULL,'Y','2019-12-12 12:23:54','2019-12-17 18:31:46'),(97,97,'HR260000','07/2015','2','21','1','2','2','Gray','Diesel','2015',NULL,'First Owner','Good','2550000','55000',NULL,NULL,'Y','2019-12-12 12:25:44','2019-12-12 12:25:44'),(98,98,'HR26CJ7288','4/2014','8','52','1','7','2','Silver','Diesel','2014','122001','First Owner','Good','1500000','47000',NULL,NULL,'Y','2019-12-13 12:47:01','2019-12-13 12:47:01'),(99,99,'UK070000','08/2014','3','46','1','6','12','White','Diesel','2014',NULL,'First Owner','Good','3500000','35000',NULL,NULL,'Y','2019-12-13 12:48:58','2019-12-13 12:48:58'),(100,100,'UK07BS2200','09/2016','9','219','12','53','18','White','Diesel','2016',NULL,'First Owner','Good','1650000','57500',NULL,NULL,'Y','2019-12-13 12:52:55','2019-12-13 12:52:55'),(101,101,'HR26CD6507','09/2013','2','145','12','42','18','White','Diesel','2014','NA','First Owner','Good','2400000','48500',NULL,NULL,'Y','2019-12-13 12:58:18','2019-12-13 12:58:18'),(102,102,'PB100000','06/2014','9',NULL,'12','85','5','Black','Diesel','2014',NULL,'First Owner','Good','1500000','41000',NULL,NULL,'Y','2019-12-13 13:03:03','2019-12-17 18:46:15'),(103,103,'PB100000','08/2016','2','75','3','12','5','White','Diesel','2016',NULL,'Second Owner','Good','3000000','16000',NULL,NULL,'Y','2019-12-13 13:05:32','2019-12-13 13:05:32'),(104,104,'PB100000','03/2016','2','96','3','14','5','Black','Diesel','2017',NULL,'First Owner','Good','3200000','13500',NULL,NULL,'Y','2019-12-13 13:09:57','2019-12-13 13:09:57'),(105,105,'CH010000','09/2015','3','217','12','49','5','White','Diesel','2016',NULL,'First Owner','Good','5000000','38000',NULL,NULL,'Y','2019-12-13 13:12:30','2019-12-13 13:12:30'),(106,106,'GJ01RS0343','11/2013','9','219','12','53','21','White','Diesel','2014',NULL,'Second Owner','Good','1500000','34000',NULL,NULL,'Y','2019-12-13 13:15:41','2019-12-13 13:15:41'),(107,107,'HR26CS4346','01/2014','1',NULL,'13','56','8','Gray','Diesel','2015','110001','Second Owner','Good','1900000','14800',NULL,NULL,'Y','2019-12-14 09:56:51','2019-12-17 18:46:15'),(108,108,'MP09CS1233','08/2015','2','171','12','44','10','White','Diesel','2016',NULL,'Second Owner','Good','2300000','43000',NULL,NULL,'Y','2019-12-14 09:58:54','2019-12-14 09:58:54'),(109,109,'DL8CA00000','07/2014','2','147','12','42','8','White','Diesel','2014','110001','First Owner','Good','2050000','34100',NULL,NULL,'Y','2019-12-14 10:00:52','2019-12-14 10:00:52'),(110,110,'CH010000','09/2016','3',NULL,'9','38','17','Blue','Diesel','2016',NULL,'First Owner','Good','3100000','70000',NULL,NULL,'Y','2019-12-14 10:21:40','2019-12-17 18:46:15'),(111,111,'CH010000','07/2015','3',NULL,'9','34','5','Red','Diesel','2015',NULL,'First Owner','Good','3350000','22000',NULL,NULL,'Y','2019-12-14 10:31:06','2019-12-17 18:46:15'),(112,112,'RJ14ZC2361','08/2017','3','36','1','5','3','Blue','Diesel','2018',NULL,'First Owner','Good','2500000','33500',NULL,NULL,'Y','2019-12-14 11:54:04','2019-12-14 11:54:04'),(113,113,'HR51BB9054','11/2014','2','25','1','2','1','Black','Diesel','2014',NULL,'First Owner','Good','2300000','25000',NULL,NULL,'Y','2019-12-14 11:58:11','2019-12-14 11:58:11'),(114,114,'UP160000','11/2018','3','48','1','6','25','White','Diesel','2018',NULL,'First Owner','Good','5800000','18000',NULL,NULL,'Y','2019-12-14 12:18:23','2019-12-14 12:18:23'),(115,115,'DL2CAP6714','06/2016','2','25','1','2','2','Silver','Diesel','2015','122001','First Owner','Good','2200000','44000',NULL,NULL,'Y','2019-12-16 10:04:45','2019-12-16 10:04:45'),(116,116,'UK070000','10/2016','2','1','1','1','8','White','Diesel','2016',NULL,'First Owner','Good','2500000','21000',NULL,NULL,'Y','2019-12-16 10:40:07','2019-12-17 18:47:03'),(117,117,'UP160000','09/2018','2','1','1','1','13','Red','Diesel','2019',NULL,'First Owner','Good','3500000','11000',NULL,NULL,'Y','2019-12-16 11:29:33','2019-12-16 11:29:33'),(118,118,'UP160000','08/2017','2','75','3','12','8','White','Diesel','2017',NULL,'First Owner','Good','4000000','28000',NULL,NULL,'Y','2019-12-16 11:32:39','2019-12-16 11:32:39'),(119,119,'HR260000','11/2017','2','120','3','20','8','White','Diesel','2018',NULL,'First Owner','Good','7500000','15000',NULL,NULL,'Y','2019-12-16 11:36:53','2019-12-16 11:36:53'),(120,120,'HR','09/2015','2','62','3','11','23','White','Diesel','2015',NULL,'First Owner','Good','2200002','15000',NULL,NULL,'Y','2019-12-16 12:02:10','2019-12-16 12:02:10'),(121,121,'HR00000','05/2014','2','25','1','2','8','Silver','Diesel','2014',NULL,'First Owner','Good','1999999','21000',NULL,NULL,'Y','2019-12-16 12:04:23','2019-12-16 12:04:23'),(122,122,'up320000','08/2018','2','1','1','1','8','White','Diesel','2018',NULL,'First Owner','Good','3300000','16500',NULL,NULL,'Y','2019-12-16 12:45:43','2019-12-17 18:31:47'),(123,123,'HR260000','09/2014','3','46','1','6','2','White','Diesel','2014',NULL,'First Owner','Good','2800000','50000',NULL,NULL,'Y','2019-12-16 13:11:59','2019-12-16 13:11:59'),(124,124,'UP320000','09/2018','2','1','1','1','23','White','Diesel','2018',NULL,'First Owner','Good','3300000','16500',NULL,NULL,'Y','2019-12-16 13:15:26','2019-12-16 13:15:26'),(125,125,'CH00000','08/2015','2','171','12','44','17','White','Diesel','2015',NULL,NULL,'Good','3000000','55000',NULL,NULL,'Y','2019-12-16 13:17:37','2019-12-16 13:17:37'),(126,126,'MH06BB8886','07/2013','2','16','1','1','12','Black','Petrol','2013',NULL,'First Owner','Good','1400000','68000',NULL,NULL,'Y','2019-12-17 11:26:03','2019-12-17 11:26:03'),(127,127,'WB20AG1370','07/2014','3','48','1','6','8','Blue','Diesel','2014','NA','Second Owner','Good','2250000','49000',NULL,NULL,'Y','2019-12-17 11:32:17','2019-12-17 11:32:17'),(128,128,'MH04GJ5072','10/2014','2','4','1','1','8','White','Diesel','2014',NULL,'First Owner','Good','2000000','50000',NULL,NULL,'Y','2019-12-17 11:53:23','2019-12-17 11:53:23'),(129,129,'DL7CK4749','7/2010','2',NULL,'1','1','8','White','Petrol','2010',NULL,'First Owner','Good','1000000','42000',NULL,NULL,'Y','2019-12-17 12:39:06','2019-12-17 18:47:03'),(130,130,'DL8CA0000','04/2011','2','149','12','42','8','Silver','Diesel','2011',NULL,'First Owner','Good','1100000','80000',NULL,NULL,'Y','2019-12-17 12:41:25','2019-12-17 12:41:25'),(131,131,'NA','04/2014','2','96','3','14','8','White','Diesel','2014','NA','First Owner','Good','2500000','12500',NULL,NULL,'Y','2019-12-17 12:43:18','2019-12-17 12:43:18'),(132,132,'DL1CU6940','08/2012','2','null','1','4','8','Gray','Diesel','2012','NA','Second Owner','Good','1500000','50000',NULL,NULL,'Y','2019-12-17 12:45:36','2019-12-17 18:47:04'),(133,133,'dfghgh4555','01/2019','1','null','6','83','1','Beige','Diesel','2010','560066','Second Owner','Good','563256536','560066','Manual',NULL,'N','2019-12-17 17:04:21','2019-12-18 04:35:35'),(134,134,'UP84S0099','09/2016','2','64','3','11','2','Black','Diesel','2016','122001','First Owner','Good','2000000','57000','Automatic',NULL,'Y','2019-12-18 09:33:40','2019-12-18 09:33:40'),(135,135,'HR269616','05/2014','3','36','1','5','2','White','Diesel','2014','122001','Second Owner','Good','1600000','50000','Automatic',NULL,'Y','2019-12-18 09:36:18','2019-12-18 09:36:18'),(136,136,'HR51AB1441','06/2011','3','48','1','6','2','Silver','Diesel','2012','122001','Second Owner','Good','1500000','96000','Automatic',NULL,'Y','2019-12-18 09:39:01','2019-12-18 09:39:01'),(137,137,'DL1CZ7450','10/2018','3','','12','50','8','Blue','Diesel','2018','110001','First Owner','Good','7900000','6000','Automatic',NULL,'Y','2019-12-18 09:40:52','2019-12-18 09:40:52'),(138,138,'DL7CN3301','09/2012','2','2','1','1','8','Black','Diesel','2012','110001','First Owner','Good','1200000','60000','Automatic',NULL,'Y','2019-12-18 09:43:32','2019-12-18 09:43:32'),(139,139,'HR26CX0011','09/2016','2','21','1','2','2','Blue','Diesel','2016','122001','First Owner','Good','3000000','49000','Automatic',NULL,'Y','2019-12-18 12:24:30','2019-12-18 12:24:30'),(140,140,'HR260000','10/2015','2','175','12','44','2','Blue','Diesel','2016','122001','First Owner','Good','3200000','22000','Automatic',NULL,'Y','2019-12-18 12:53:32','2019-12-18 12:53:32'),(141,141,'UP320000','09/2018','2','3','1','1','20','White','Diesel','2018',NULL,'First Owner','Good','3100000','16500','Automatic',NULL,'Y','2019-12-18 13:11:53','2019-12-18 13:11:53'),(142,142,'DL0000','08/2014','2','148','12','42','8','White','Diesel','2014',NULL,'Second Owner','Good','1800000','62000','Automatic',NULL,'Y','2019-12-18 13:15:19','2019-12-18 13:15:19'),(143,143,'HR100000','06/2018','2','79','3','12','16','Blue','Diesel','2018',NULL,'First Owner','Good','4100000','27300','Automatic',NULL,'Y','2019-12-19 06:03:00','2019-12-19 06:03:00'),(144,144,'UK07BN5000','05/2014','2','3','1','1','23','Brown','Diesel','2014','NA','First Owner','Good','1495000','61000','Automatic',NULL,'Y','2019-12-19 06:05:27','2019-12-19 06:05:27'),(145,145,'UP320000','10/2018','2','161','12','42','18','Blue','Diesel','2018',NULL,'First Owner','Good','5800000','1900','Automatic',NULL,'Y','2019-12-19 11:59:10','2019-12-19 11:59:10'),(146,146,'UP78DX0006','10/2015','2','62','3','11','22','White','Diesel','2015',NULL,'First Owner','Good','1800000','15000','Automatic',NULL,'Y','2019-12-19 12:01:26','2019-12-19 12:01:26'),(147,147,'UP16AY0999','01/2015','2','147','12','42','20','White','Diesel','2015',NULL,'Second Owner','Good','2599999','29000','Automatic',NULL,'Y','2019-12-19 12:08:19','2019-12-19 12:08:19'),(148,148,'HR26CP5476','08/2015','2','79','3','12','2','Black','Diesel','2015','122001','First Owner','Good','2600000','26000','Automatic',NULL,'Y','2019-12-19 12:10:15','2019-12-19 12:10:15'),(149,149,'HR260000','06/2011','3','32','1','3','2','White','Diesel','2012','NA','null','Good','1200000','700000','Automatic',NULL,'Y','2019-12-19 12:12:14','2019-12-19 12:12:14'),(150,150,'CH0073','08/2012','3','32','1','3','8','Black','Diesel','2012',NULL,'Second Owner','Good','1500000','45000','Automatic',NULL,'Y','2019-12-19 12:14:25','2019-12-19 12:14:25'),(151,151,'UP78 EF 0101','06/2016','2','62','3','11','20','White','Diesel','2016',NULL,'First Owner','Good','2500000','25000','Automatic',NULL,'Y','2019-12-19 12:16:29','2019-12-19 12:16:29'),(152,152,'pb10','06/2016','3','33','1','3','5','White','Diesel','2016',NULL,'First Owner','Good','2599000','60500','Automatic',NULL,'Y','2019-12-19 12:34:45','2019-12-19 12:34:45'),(153,153,'dl00000','05/2016','3','167','12','43','8','Silver','Diesel','2016',NULL,'Second Owner','Good','2600000','16000','Automatic',NULL,'Y','2019-12-20 11:06:16','2019-12-20 11:06:16'),(154,154,'dl0000','06/2017','3','108','3','17','2','Blue','Diesel','2017',NULL,'First Owner','Good','3400000','26500','Automatic',NULL,'Y','2019-12-20 11:08:53','2019-12-20 11:08:53'),(155,155,'CH01BQ','10/2017','2','21','1','2','5','Black','Diesel','2017',NULL,'First Owner','Good','3550000','25000','Automatic',NULL,'Y','2019-12-20 11:50:22','2019-12-20 11:50:22'),(156,156,'UK07','07/2014','3','34','1','3','4','White','Diesel','2014',NULL,'First Owner','Good','2150000','67000','Automatic',NULL,'Y','2019-12-20 11:52:45','2019-12-20 11:52:45'),(157,157,'CH01BF2943','07/2015','3','98','3','15','2','White','Diesel','2016',NULL,'First Owner','Good','4500000','29300','Automatic',NULL,'Y','2019-12-20 11:54:34','2019-12-20 11:54:34'),(158,158,'CH01BH1115','06/2016','2','76','3','12','17','Black','Diesel','2016',NULL,'First Owner','Good','2800000','40000','Automatic',NULL,'Y','2019-12-20 11:56:41','2019-12-20 11:56:41'),(159,159,'HR5AD8208','08/2009','2','','3','11','18','Gray','Petrol','2009',NULL,'Second Owner','Good','600000','70000','Automatic',NULL,'Y','2019-12-20 11:58:49','2019-12-20 11:58:49'),(160,160,'HR510000','08/2011','2','','3','11','8','Black','Petrol','2011',NULL,'Second Owner','Good','1200000','64000','Automatic',NULL,'Y','2019-12-20 12:01:06','2019-12-20 12:01:06'),(161,161,'dl0000','07/2014','3','228','16','62','8','White','Diesel','2014',NULL,'First Owner','Good','3500000','400000','Automatic',NULL,'Y','2019-12-20 12:10:32','2019-12-20 12:10:32'),(162,162,'up140000','07/2014','2','96','3','14','13','Black','Diesel','2015',NULL,'First Owner','Good','2500000','68000','Automatic',NULL,'Y','2019-12-20 12:13:45','2019-12-20 12:13:45'),(163,163,'UP17K9000','06/2014','3','46','1','6','8','White','Diesel','2015',NULL,'First Owner','Good','3700000','45000','Automatic',NULL,'Y','2019-12-23 05:57:50','2019-12-23 05:57:50'),(164,164,NULL,'07/2010','2','78','3','12','27','Silver','Diesel','2010',NULL,'First Owner','Good','900000','100000','Automatic',NULL,'Y','2019-12-23 05:59:41','2019-12-23 05:59:41'),(165,165,'HR05AM0051','02/2014','2','2','1','1','23','White','Diesel','0',NULL,'First Owner','Good','1600000','53000','Automatic',NULL,'Y','2019-12-23 06:01:52','2019-12-23 06:01:52'),(166,166,'CH010000','09/2015','2','2','1','1','17','Red','Diesel','2014',NULL,'First Owner','Good','2400000','21000','Automatic',NULL,'Y','2019-12-23 07:50:41','2019-12-23 07:50:41'),(167,167,'PB020000','06/2014','2','','12','88','5','Silver','Diesel','2015',NULL,'Second Owner','Good','2099999','28000','Automatic',NULL,'Y','2019-12-23 07:53:32','2019-12-23 07:53:32'),(168,168,'CH01AX0608','04/2014','3','108','3','17','17','White','Diesel','2015',NULL,'Second Owner','Good','2185000','67000','Automatic',NULL,'Y','2019-12-23 08:41:45','2019-12-23 08:41:45'),(169,169,'HR26AK9091','08/2011','3','113','3','19','2','Red','Diesel','2011',NULL,'First Owner','Good','1300000','53000','Automatic',NULL,'Y','2019-12-23 08:50:23','2019-12-23 08:50:23'),(170,170,'HR26BH1668','05/2012','3','113','3','19','2','Blue','Diesel','2012',NULL,'First Owner','Good','1000000','54000','Automatic',NULL,'Y','2019-12-23 08:53:19','2019-12-23 08:53:19'),(171,171,NULL,'07/2012','2','75','3','12','8','White','Diesel','2012',NULL,'First Owner','Good','1300000','75000','Automatic',NULL,'Y','2019-12-23 12:10:45','2019-12-23 12:10:45'),(172,172,'HR260000','07/2016','2','147','12','42','2','White','Diesel','2017',NULL,'First Owner','Good','3250000','47500','Automatic',NULL,'Y','2019-12-23 12:13:04','2019-12-23 12:13:04'),(173,173,'CH010000','09/2019','2','75','3','12','17','Blue','Diesel','2019',NULL,'First Owner','Good','4500000','100000','Automatic',NULL,'Y','2019-12-23 12:16:46','2019-12-23 12:16:46'),(174,174,'PB02AA2424','04/2014','2','175','12','44','5','White','Diesel','2014',NULL,'First Owner','Good','2350000','13500','Automatic',NULL,'Y','2019-12-23 12:18:36','2019-12-23 12:18:36'),(175,175,'HR0200','08/2014','3','36','1','5','15','White','Diesel','2014',NULL,'First Owner','Good','1600000','64000','Automatic',NULL,'Y','2019-12-23 12:22:39','2019-12-23 12:22:39'),(176,176,'PB10','09/2016','3','33','1','3','5','White','Diesel','2016',NULL,'First Owner','Good','2599999','60500','Automatic',NULL,'Y','2019-12-23 12:32:33','2019-12-23 12:32:33'),(177,177,'DL4CAY2323','05/2018','3','139','9','35','2','Brown','Diesel','2018',NULL,'First Owner','Good','5700000','8000','Automatic',NULL,'Y','2019-12-24 05:28:01','2019-12-24 05:28:01'),(178,178,'UP38L1111','08/2018','2','96','3','14','26','Black','Diesel','2018',NULL,'First Owner','Good','4200000','19000','Automatic',NULL,'Y','2019-12-24 06:18:40','2019-12-24 06:18:40'),(179,179,'DL6CM6320','05/2013','3','209','12','48','2','Gray','Diesel','2014',NULL,'Second Owner','Good','2875000','67572','Automatic',NULL,'Y','2019-12-24 06:20:50','2019-12-24 06:20:50'),(180,180,'DL02','08/2015','3','140','9','36','13','White','Diesel','2016',NULL,'First Owner','Good','3200000','29000','Automatic',NULL,'Y','2019-12-24 11:42:11','2019-12-24 11:42:11'),(181,181,'UP16','09/2016','2','67','3','11','13','Black','Diesel','2016',NULL,'First Owner','Good','3950000','35000','Automatic',NULL,'Y','2019-12-24 11:44:35','2019-12-24 11:44:35'),(182,182,'UP16BB000','06/2015','2','62','3','11','13','Blue','Diesel','2015',NULL,'First Owner','Good','1650000','62700','Automatic',NULL,'Y','2019-12-24 12:05:02','2019-12-24 12:05:02'),(183,183,'DL0000','08/2017','2','74','3','12','8','Blue','Petrol','2017',NULL,'First Owner','Good','3950000','11000','Automatic',NULL,'Y','2019-12-24 12:07:10','2019-12-24 12:07:10'),(184,184,'UP16BS1087','07/2018','3','163','12','43','13','Red','Diesel','2018',NULL,'First Owner','Good','2999999','13000','Automatic',NULL,'Y','2019-12-24 12:09:11','2019-12-24 12:09:11'),(185,185,'DL0000','05/2019','8','203','12','47','8','Red','Petrol','2019',NULL,'First Owner','Good','3600000','5200','Automatic',NULL,'Y','2019-12-25 11:42:59','2019-12-25 11:42:59'),(186,186,'HR26CU2231','06/2016','2','2','1','1','8','Black','Diesel','2016',NULL,'Second Owner','Good','2000000','16000','Automatic',NULL,'Y','2019-12-25 11:47:15','2019-12-25 11:47:15'),(187,187,'UP16CC4552','07/2018','2','3','1','1','8','Red','Diesel','2019',NULL,'First Owner','Good','3200000','12500','Automatic',NULL,'Y','2019-12-25 11:49:52','2019-12-25 11:49:52'),(188,188,'UP320000','06/2016','3','100','3','15','23','Brown','Diesel','2016',NULL,'Second Owner','Good','4300000','52000','Automatic',NULL,'Y','2019-12-25 11:57:07','2019-12-25 11:57:07'),(189,189,'CH010000','09/2016','2','145','12','42','17','Silver','Diesel','2017',NULL,'First Owner','Good','3550000','37500','Automatic',NULL,'Y','2019-12-25 11:58:50','2019-12-25 11:58:50'),(190,190,'PB02000','03/2016','2','175','12','44','14','White','Diesel','2016',NULL,'First Owner','Good','1985000','46000','Automatic',NULL,'Y','2019-12-25 12:04:56','2019-12-25 12:04:56'),(191,191,'UK070000','09/2017','3','36','1','5','18','White','Diesel','2017',NULL,'First Owner','Good','2410000','65000','Automatic',NULL,'Y','2019-12-25 12:07:39','2019-12-25 12:07:39'),(192,192,NULL,'07/2013','2','145','12','42','18','White','Diesel','2014',NULL,'Second Owner','Good','2350000','59000','Automatic',NULL,'Y','2019-12-26 10:45:15','2019-12-26 10:45:15'),(193,193,'MH101BT6766','08/2015','2','145','12','42','8','Black','Diesel','2015',NULL,NULL,'Good','2500000','58000','Automatic',NULL,'Y','2019-12-26 10:47:01','2019-12-26 10:47:01'),(194,194,'DL1CS8177','06/2014','2','20','1','2','2','Gray','Diesel','2014',NULL,'First Owner','Good','1700000','50000','Automatic',NULL,'Y','2019-12-26 10:50:16','2019-12-26 10:50:16'),(195,195,'UP16CT9999','03/2014','3','38','1','5','20','White','Diesel','2014',NULL,'First Owner','Good','2100000','18000','Automatic',NULL,'Y','2019-12-26 12:18:39','2019-12-26 12:18:39'),(196,196,'UK08AK8686','08/2016','3','101','3','15','8','White','Diesel','2017',NULL,'Second Owner','Good','4400000','51000','Automatic',NULL,'Y','2019-12-27 06:39:57','2019-12-27 06:39:57'),(197,197,'UK074BT3685','10/2016','3','','9','38','25','Blue','Diesel','2016',NULL,'First Owner','Good','380000','29000','Automatic',NULL,'Y','2019-12-27 06:44:17','2019-12-27 06:44:17'),(198,198,'UP23S5555','09/2015','3','39','1','5','18','White','Diesel','2015',NULL,'First Owner','Good','1750000','55000','Automatic',NULL,'Y','2019-12-27 06:46:30','2019-12-27 06:46:30'),(199,199,'HR510000','08/2014','3','48','1','6','27','White','Diesel','2015',NULL,'First Owner','Good','2000000','59000','Automatic',NULL,'Y','2019-12-27 06:49:04','2019-12-27 06:49:04'),(200,200,'DL1CQ8961','07/2014','3','36','1','5','8','White','Diesel','2014',NULL,'First Owner','Good','1632000','73000','Automatic',NULL,'Y','2019-12-27 06:51:15','2019-12-27 06:51:15'),(201,201,'UP140000','09/2013','2','12','1','1','1','White','Diesel','2013',NULL,'First Owner','Good','1400000','48000','Automatic',NULL,'Y','2019-12-27 10:35:10','2019-12-27 10:35:10'),(202,202,'DL2CAT3680','05/2014','2','18','1','2','13','Gray','Diesel','2014',NULL,'First Owner','Good','2200000','40000','Automatic',NULL,'Y','2019-12-27 10:37:01','2019-12-27 10:37:01'),(203,203,'DL00000','09/2014','2','15','1','1','8','White','Diesel','2014',NULL,'Second Owner','Good','2200000','41000','Automatic',NULL,'Y','2019-12-27 10:38:42','2019-12-27 10:38:42'),(204,204,'HR26000','09/2013','2','2','1','1','8','White','Diesel','2014',NULL,'First Owner','Good','1400000','65000','Automatic',NULL,'Y','2019-12-27 10:40:06','2019-12-27 10:40:06'),(205,205,'DD03AA0060','07/2013','2','63','3','11','3','White','Diesel','2013',NULL,'First Owner','Good','1620000','66000','Automatic',NULL,'Y','2019-12-28 09:52:49','2019-12-28 09:52:49'),(206,206,'HP73A2145','09/2014','3','108','3','17','14','Black','Diesel','2014',NULL,'First Owner','Good','2790000','40000','Automatic',NULL,'Y','2019-12-28 09:54:40','2019-12-28 09:54:40'),(207,207,'PB11AT0074','08/2015','2','64','3','11','5','White','Diesel','2015',NULL,'First Owner','Good','2150000','59000','Automatic',NULL,'Y','2019-12-28 09:58:19','2019-12-28 09:58:19'),(208,208,NULL,'09/2016','2','96','3','14','5','Black','Diesel','2016',NULL,'First Owner','Good','2500000','43000','Automatic',NULL,'Y','2019-12-28 09:59:54','2019-12-28 09:59:54'),(209,209,'PB10','03/2016','2','62','3','11','5','White','Diesel','2016',NULL,'First Owner','Good','2250000','28000','Automatic',NULL,'Y','2019-12-28 10:01:43','2019-12-28 10:01:43'),(210,210,'DL01C0000','09/2013','4','','3','82','8','Red','Diesel','2013',NULL,'First Owner','Good','13750000','70000','Automatic',NULL,'Y','2019-12-31 12:10:55','2019-12-31 12:10:55'),(211,211,'UP16BS2643','09/2018','2','8','1','1','2','Black','Diesel','2018','NA','First Owner','Good','2700000','10000','Automatic',NULL,'Y','2019-12-31 12:17:41','2019-12-31 12:17:41'),(212,212,'RJ450000','09/2017','3','166','12','43','3','Black','Diesel','2017',NULL,'First Owner','Good','4500000','40000','Automatic',NULL,'Y','2019-12-31 12:20:15','2019-12-31 12:20:15'),(213,213,'RJ140000','07/2015','2','171','12','44','3','White','Diesel','2015',NULL,'First Owner','Good','1750000','59000','Automatic',NULL,'Y','2019-12-31 12:22:22','2019-12-31 12:22:22'),(214,214,NULL,'05/2015','3','41','1','5','3','Gray','Diesel','2015',NULL,'First Owner','Good','2600000','55000','Automatic',NULL,'Y','2019-12-31 12:23:45','2019-12-31 12:23:45'),(215,215,NULL,'05/2014','3','209','12','48','3','White','Diesel','2014',NULL,'Second Owner','Good','3200000','54000','Automatic',NULL,'Y','2019-12-31 12:25:10','2019-12-31 12:25:10'),(216,216,'RJ14','08/2015','3','163','12','43','3','White','Diesel','2014',NULL,'Second Owner','Good','2100000','90000','Automatic',NULL,'Y','2019-12-31 12:27:02','2019-12-31 12:27:02'),(217,217,'HR05AK9500','05/2013','2','2','1','1','23','White','Diesel','2014',NULL,'Second Owner','Good','1300000','70000','Automatic',NULL,'Y','2020-01-02 10:10:48','2020-01-02 10:10:48'),(218,218,'UP15CD7308','10/2017','2','7','1','1','25','Black','Diesel','2017',NULL,'First Owner','Good','1500000','20000','Automatic',NULL,'Y','2020-01-02 10:34:09','2020-01-02 10:34:09');
/*!40000 ALTER TABLE `vehicle_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_payment_transaction_tbl`
--

DROP TABLE IF EXISTS `vehicle_payment_transaction_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_payment_transaction_tbl` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `transaction_type` int(11) NOT NULL,
  `txn_id` varchar(200) DEFAULT NULL,
  `other_details` varchar(1000) DEFAULT NULL,
  `payment_mode` int(11) NOT NULL,
  `amount` double(12,2) NOT NULL,
  `bank_name` varchar(200) DEFAULT NULL,
  `payment_recipt` varchar(200) DEFAULT NULL,
  `reason` varchar(100) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `done_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FKtransaction_type_idx_idx` (`transaction_type`),
  KEY `FKpayment_mode_idx_idx` (`payment_mode`),
  CONSTRAINT `FKpayment_mode_idx` FOREIGN KEY (`payment_mode`) REFERENCES `payment_mode_master_tbl` (`mode_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKtransaction_type_idx` FOREIGN KEY (`transaction_type`) REFERENCES `purchase_vehicle_onboard_status_tbl` (`onboard_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_payment_transaction_tbl`
--

LOCK TABLES `vehicle_payment_transaction_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_payment_transaction_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_payment_transaction_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_rc_details_tbl`
--

DROP TABLE IF EXISTS `vehicle_rc_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_rc_details_tbl` (
  `rc_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_name` varchar(200) DEFAULT NULL,
  `s_w_d_of` varchar(200) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address_line_1` varchar(200) DEFAULT NULL,
  `address_line_2` varchar(200) DEFAULT NULL,
  `location` varchar(120) DEFAULT NULL,
  `district` varchar(120) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `temp_address_line_1` varchar(200) DEFAULT NULL,
  `temp_address_line_2` varchar(200) DEFAULT NULL,
  `temp_location` varchar(120) DEFAULT NULL,
  `temp_district` varchar(120) DEFAULT NULL,
  `temp_state` int(11) DEFAULT NULL,
  `temp_pincode` varchar(20) DEFAULT NULL,
  `driving_licence_no` varchar(100) DEFAULT NULL,
  `driving_licence_image` varchar(500) DEFAULT NULL,
  `pan_card_no` varchar(100) DEFAULT NULL,
  `pan_card_image` varchar(500) DEFAULT NULL,
  `aadhar_card_no` varchar(100) DEFAULT NULL,
  `aadhar_card_image` varchar(500) DEFAULT NULL,
  `passport_size_image` varchar(500) DEFAULT NULL,
  `vehicle_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rc_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_rc_details_tbl`
--

LOCK TABLES `vehicle_rc_details_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_rc_details_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_rc_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_sales_details_tbl`
--

DROP TABLE IF EXISTS `vehicle_sales_details_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_sales_details_tbl` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sold_by` int(10) DEFAULT NULL,
  `commited_payment_date` date DEFAULT NULL,
  `final_price` varchar(25) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `sold_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`),
  KEY `FKcustomer_id_idx` (`customer_id`),
  KEY `FKvehicle_id_idx` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_sales_details_tbl`
--

LOCK TABLES `vehicle_sales_details_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_sales_details_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sales_details_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_status_master_tbl`
--

DROP TABLE IF EXISTS `vehicle_status_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_status_master_tbl` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_status_master_tbl`
--

LOCK TABLES `vehicle_status_master_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_status_master_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_status_master_tbl` VALUES (1,'Lead Created','Y','2018-12-13 08:11:21','2018-12-13 08:11:21'),(2,'Evaluator Assigned','Y','2018-12-13 08:11:21','2018-12-13 08:11:21'),(3,'Vehicle Archived','Y','2018-12-13 08:11:21','2018-12-19 11:38:37'),(4,'Vehicle Evaluated','Y','2018-12-13 08:11:21','2018-12-13 08:11:21'),(5,'Vehicles Sent to Garage','Y','2018-12-13 08:11:21','2018-12-13 08:11:21'),(6,'On Sale','Y','2018-12-13 08:11:21','2018-12-13 08:11:21'),(7,'Vehicle Sold','Y','2018-12-13 08:11:21','2018-12-13 08:11:21');
/*!40000 ALTER TABLE `vehicle_status_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_status_tbl`
--

DROP TABLE IF EXISTS `vehicle_status_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_status_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_status_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_status_tbl`
--

LOCK TABLES `vehicle_status_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_status_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_status_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_sub_status_master_tbl`
--

DROP TABLE IF EXISTS `vehicle_sub_status_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_sub_status_master_tbl` (
  `sub_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_status` varchar(100) NOT NULL,
  `status_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_sub_status_master_tbl`
--

LOCK TABLES `vehicle_sub_status_master_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_sub_status_master_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_sub_status_master_tbl` VALUES (1,'Lead Created',1,'Y','2018-12-19 11:53:54','2018-12-19 11:53:54'),(2,'Evaluator Assigned',2,'Y','2018-12-19 11:53:54','2018-12-19 11:53:54'),(3,'Reassign',2,'Y','2018-12-19 11:51:23','2018-12-19 11:54:18'),(4,'Rescheduled',2,'Y','2018-12-19 11:51:23','2018-12-19 11:51:23'),(5,'Follow up',2,'Y','2018-12-19 11:51:23','2018-12-19 11:51:23'),(6,'Rejected',2,'Y','2018-12-19 11:51:23','2018-12-19 11:51:23'),(7,'Vehicle Evaluated',4,'Y','2018-12-20 19:14:47','2018-12-20 19:14:47'),(8,'Vehicle Archived',3,'Y','2019-01-31 20:45:56','2019-01-31 20:45:56'),(9,'Vehicles Sent to Garage',5,'Y','2019-01-31 20:45:56','2019-01-31 20:45:56'),(10,'On Sale',6,'Y','2019-01-31 20:45:56','2019-01-31 20:45:56'),(11,'Payment Pending',7,'Y','2019-01-31 20:45:56','2019-01-31 20:45:56'),(12,'Document Pending',7,'Y','2019-01-31 20:45:56','2019-01-31 20:45:56'),(13,'Payment and Document Pending',7,'Y','2019-01-31 20:45:56','2019-01-31 20:45:56'),(14,'Awaiting for RC book',7,'Y','2019-01-31 20:45:56','2019-01-31 20:45:56'),(15,'Completed',7,'Y','2019-01-31 20:45:56','2019-01-31 20:45:56');
/*!40000 ALTER TABLE `vehicle_sub_status_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type_master_tbl`
--

DROP TABLE IF EXISTS `vehicle_type_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type_master_tbl` (
  `car_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `car_type` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`car_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type_master_tbl`
--

LOCK TABLES `vehicle_type_master_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_type_master_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_type_master_tbl` VALUES (1,'HATCHBACK','Y','2019-11-24 10:40:14'),(2,'SEDAN','Y','2019-11-24 10:40:14'),(3,'SUV','Y','2019-11-24 10:40:14'),(4,'COUPE STYLE','Y','2019-11-28 07:51:44'),(8,'ENTRY LEVEL SEDAN','Y','2019-12-03 13:16:05'),(9,'PRIMIUM HATCHBACK','Y','2019-12-03 13:16:05'),(10,'COUP CUM SPORTS CAR','Y','2019-12-03 13:16:05'),(11,'CONVERTIBLE','Y','2019-12-03 13:16:06'),(12,'SPORTS CAR','Y','2019-12-03 13:16:06'),(13,'LUXURY SUV','Y','2019-12-03 13:16:06');
/*!40000 ALTER TABLE `vehicle_type_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_varient_master_tbl`
--

DROP TABLE IF EXISTS `vehicle_varient_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_varient_master_tbl` (
  `varient_id` int(10) NOT NULL AUTO_INCREMENT,
  `model_id` int(10) DEFAULT NULL,
  `varient_name` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`varient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_varient_master_tbl`
--

LOCK TABLES `vehicle_varient_master_tbl` WRITE;
/*!40000 ALTER TABLE `vehicle_varient_master_tbl` DISABLE KEYS */;
INSERT INTO `vehicle_varient_master_tbl` VALUES (1,1,'35 TDI Technology Pack','Y','2019-11-25 12:58:06'),(2,1,'PREMIUM PLUS','Y','2019-11-25 12:58:06'),(3,1,'TECHOLONGY','Y','2019-11-25 12:58:06'),(4,1,'Premium plus/Sunroof','Y','2019-11-25 12:58:06'),(5,1,'35 TDI Sport Sunroof/Premium','Y','2019-11-25 12:58:06'),(6,1,'PREMIUME PLUS','Y','2019-11-25 12:58:06'),(7,1,'2.0 TDI Premium','Y','2019-11-25 12:58:07'),(8,1,'35 Tdi Premium  Plus + Sunroof','Y','2019-11-25 12:58:07'),(9,1,'35 Tdi Premium + Sunroof','Y','2019-11-25 12:58:07'),(10,1,'PREMIUM WITHOUT SUNROOF','Y','2019-11-25 12:58:07'),(11,1,'PREM PLUS+SUNROOF','Y','2019-11-25 12:58:07'),(12,1,'2.0 TDI Premium Plus/Sline','Y','2019-11-25 12:58:07'),(13,1,'premium /Sunrof','Y','2019-11-25 12:58:07'),(14,1,'PREMIUM WITH SUNROOF','Y','2019-11-25 12:58:07'),(15,1,'2.0 TDI Premium Plus With Sunroof','Y','2019-11-25 12:58:07'),(16,1,'BUSSINESS EDITION','Y','2019-11-25 12:58:07'),(17,1,'Sline','Y','2019-11-25 12:58:07'),(18,2,'2.0 TDI Premium With Sunroof','Y','2019-11-25 12:58:07'),(19,2,'TECHNOLOGY','Y','2019-11-25 12:58:07'),(20,2,'2.0 TDI','Y','2019-11-25 12:58:07'),(21,2,'MATRIX','Y','2019-11-25 12:58:07'),(22,2,'2.0TDI Premium','Y','2019-11-25 12:58:07'),(23,2,'TFSI MATRIX','Y','2019-11-25 12:58:07'),(24,2,'2.0TDI Premium/ SUNROOF','Y','2019-11-25 12:58:07'),(25,2,'2.0 TDI Premium Plus','Y','2019-11-25 12:58:08'),(26,2,'2.0 TDI Premium  Plus  /Big  Screen /LED','Y','2019-11-25 12:58:08'),(27,2,'3.0 Premium With Sunroof','Y','2019-11-25 12:58:08'),(28,2,'2.8 Luxury interior','Y','2019-11-25 12:58:08'),(29,2,'Premium Plus With Bose Sunrround Sound System','Y','2019-11-25 12:58:08'),(30,2,'PREMIUM +','Y','2019-11-25 12:58:08'),(31,2,'PREM+PLUS','Y','2019-11-25 12:58:08'),(32,3,'PRIMIUM','Y','2019-11-25 12:58:08'),(33,3,'3.0 TDI Premium','Y','2019-11-25 12:58:08'),(34,3,'3.0 TDI QUATTRO','Y','2019-11-25 12:58:08'),(35,3,'30  TDI','Y','2019-11-25 12:58:08'),(36,5,'35 TDI QUATTRO  PREMIUM PLUS','Y','2019-11-25 12:58:08'),(37,5,'2.0 TDI Premium/Sunroof','Y','2019-11-25 12:58:08'),(38,5,'2.0 TDI Premium Plus/ sunroof','Y','2019-11-25 12:58:08'),(39,5,'Q3 2.0 TDI','Y','2019-11-25 12:58:08'),(40,5,'without sunroof menual','Y','2019-11-25 12:58:08'),(41,5,'QUATTRO TECHNOLOGY','Y','2019-11-25 12:58:08'),(42,5,'2.0 TDI Premium Plus/Sunroof','Y','2019-11-25 12:58:09'),(43,5,'Technology Pack','Y','2019-11-25 12:58:09'),(44,5,'SUNROOF','Y','2019-11-25 12:58:09'),(45,5,'29000','Y','2019-11-25 12:58:09'),(46,6,'3.0 TDI Premium Plus','Y','2019-11-25 12:58:09'),(47,6,'CORPORATE','Y','2019-11-25 12:58:09'),(48,6,'35 Premium Plus','Y','2019-11-25 12:58:09'),(49,6,'3.0 TDI Technology Pack','Y','2019-11-25 12:58:09'),(50,6,'NEW SHAPE','Y','2019-11-25 12:58:09'),(51,6,'45tdi(New Shape)','Y','2019-11-25 12:58:09'),(52,7,'CONVERTABLE','Y','2019-11-25 12:58:09'),(53,7,'35 TDI','Y','2019-11-25 12:58:09'),(54,7,'S LINE','Y','2019-11-25 12:58:09'),(55,7,'35 TDI Premium/Sunroof','Y','2019-11-25 12:58:09'),(56,7,'PREMIUM','Y','2019-11-25 12:58:09'),(57,7,'CABRIOLET','Y','2019-11-25 12:58:09'),(58,7,'Premium /Sunroof','Y','2019-11-25 12:58:09'),(59,7,'TECHNOLOGY PLUS','Y','2019-11-25 12:58:09'),(60,9,'50 TDI','Y','2019-11-25 12:58:10'),(61,11,'320d Highline','Y','2019-11-25 12:58:10'),(62,11,'320d Luxury','Y','2019-11-25 12:58:10'),(63,11,'320d','Y','2019-11-25 12:58:10'),(64,11,'PRESTIGE','Y','2019-11-25 12:58:10'),(65,11,'320d luxury line sunroof','Y','2019-11-25 12:58:10'),(66,11,'330d Convertible','Y','2019-11-25 12:58:10'),(67,11,'320d luxury line','Y','2019-11-25 12:58:10'),(68,11,'SPORTS','Y','2019-11-25 12:58:10'),(69,11,'320d Pure','Y','2019-11-25 12:58:10'),(70,11,'Highline','Y','2019-11-25 12:58:10'),(71,11,'BUSINESS EDITION','Y','2019-11-25 12:58:10'),(72,11,'LUXURY LINE','Y','2019-11-25 12:58:10'),(73,11,'320d Luxury Line With Sunroof','Y','2019-11-25 12:58:10'),(74,12,'530d','Y','2019-11-25 12:58:10'),(75,12,'520d','Y','2019-11-25 12:58:10'),(76,12,'525d','Y','2019-11-25 12:58:10'),(77,12,'530i Highline','Y','2019-11-25 12:58:11'),(78,12,'530 D M SPORT','Y','2019-11-25 12:58:11'),(79,12,'520d Luxury Line','Y','2019-11-25 12:58:11'),(80,12,'M Sports','Y','2019-11-25 12:58:11'),(81,12,'520 D With M5 Kit','Y','2019-11-25 12:58:11'),(82,12,'520i Luxury line','Y','2019-11-25 12:58:11'),(83,12,'520','Y','2019-11-25 12:58:11'),(84,12,'530d M Sport','Y','2019-11-25 12:58:11'),(85,12,'520 Highline','Y','2019-11-25 12:58:11'),(86,12,'520D Highline/Sunroof','Y','2019-11-25 12:58:11'),(87,12,'520 LUXURY','Y','2019-11-25 12:58:11'),(88,12,'530 d Highline sedan','Y','2019-11-25 12:58:11'),(89,12,'Luxury Line (TopModel)','Y','2019-11-25 12:58:11'),(90,12,'520d Luxury  Line','Y','2019-11-25 12:58:11'),(91,12,'530d luxury line','Y','2019-11-25 12:58:11'),(92,12,'520 Luxuri Line','Y','2019-11-25 12:58:11'),(93,13,'118 D 2015','Y','2019-11-25 12:58:11'),(94,13,'118 sport line','Y','2019-11-25 12:58:11'),(95,14,'Luxury Line  Topo model','Y','2019-11-25 12:58:12'),(96,14,'320 GT','Y','2019-11-25 12:58:12'),(97,14,'LUXURY','Y','2019-11-25 12:58:12'),(98,15,'DPE 5 seater top model','Y','2019-11-25 12:58:12'),(99,15,'30D DPE','Y','2019-11-25 12:58:12'),(100,15,'X DRIVE','Y','2019-11-25 12:58:12'),(101,15,'DPE 5 seater','Y','2019-11-25 12:58:12'),(102,15,'Xdrive 30d pure experience','Y','2019-11-25 12:58:12'),(103,16,'640d 3.0 6 Cylinder','Y','2019-11-25 12:58:12'),(104,16,'640d','Y','2019-11-25 12:58:12'),(105,16,'GT 630i','Y','2019-11-25 12:58:12'),(106,17,'X3 S LINE','Y','2019-11-25 12:58:12'),(107,17,'30 d With Sunroof','Y','2019-11-25 12:58:12'),(108,17,'xDrive 20d','Y','2019-11-25 12:58:12'),(109,17,'X LINE 20D','Y','2019-11-25 12:58:12'),(110,18,'Convertoble sDrive35i','Y','2019-11-25 12:58:12'),(111,18,'SDRIVE WITH  NAVIGATION','Y','2019-11-25 12:58:12'),(112,18,'Roadstar35i','Y','2019-11-25 12:58:13'),(113,19,'sDrive20d','Y','2019-11-25 12:58:13'),(114,19,'COARPORATE','Y','2019-11-25 12:58:13'),(115,19,'X1 DRIVE','Y','2019-11-25 12:58:13'),(116,19,'sDrive 18i','Y','2019-11-25 12:58:13'),(117,19,'XPEDITION','Y','2019-11-25 12:58:13'),(118,20,'730d Prestige Modal','Y','2019-11-25 12:58:13'),(119,20,'730Ld','Y','2019-11-25 12:58:13'),(120,20,'730d','Y','2019-11-25 12:58:13'),(121,20,'730 ld','Y','2019-11-25 12:58:13'),(122,20,'730 D','Y','2019-11-25 12:58:13'),(123,22,'xDrive 30d','Y','2019-11-25 12:58:13'),(124,24,'3.2 AT/Sunroof/top model','Y','2019-11-25 12:58:13'),(125,24,'3.2Titanium','Y','2019-11-25 12:58:13'),(126,25,'5.0 Ltr','Y','2019-11-25 12:58:13'),(127,26,'OPTIONAL','Y','2019-11-25 12:58:13'),(128,27,'SX O','Y','2019-11-25 12:58:13'),(129,29,'3.0 Diesel','Y','2019-11-25 12:58:13'),(130,30,'20d AWD','Y','2019-11-25 12:58:14'),(131,31,'XJ L 3.0 V6 PORTFOLIO','Y','2019-11-25 12:58:14'),(132,32,'Portfolio','Y','2019-11-25 12:58:14'),(133,32,'20D Prestige With Sunroof','Y','2019-11-25 12:58:14'),(134,32,'2.2 Ltr','Y','2019-11-25 12:58:14'),(135,32,'JAGUAR XF 2.2','Y','2019-11-25 12:58:14'),(136,32,'S 3.0 ltr','Y','2019-11-25 12:58:14'),(137,32,'XF 2.2 Ltr','Y','2019-11-25 12:58:14'),(138,32,'XF WITHOUT SUNROOF','Y','2019-11-25 12:58:14'),(139,35,'Sport SE','Y','2019-11-25 12:58:14'),(140,36,'SE','Y','2019-11-25 12:58:14'),(141,37,'HSE','Y','2019-11-25 12:58:14'),(142,37,'HSE Model(Top Model)','Y','2019-11-25 12:58:14'),(143,41,'LXI','Y','2019-11-25 12:58:14'),(144,42,'E350 CDI','Y','2019-11-25 12:58:14'),(145,42,'E250 CDI','Y','2019-11-25 12:58:14'),(146,42,'E229','Y','2019-11-25 12:58:14'),(147,42,'E250 CDI Avantgarde','Y','2019-11-25 12:58:14'),(148,42,'250 CDI','Y','2019-11-25 12:58:15'),(149,42,'220 CDI Elegance','Y','2019-11-25 12:58:15'),(150,42,'CDI Elegance','Y','2019-11-25 12:58:15'),(151,42,'E350 CDI EDITION','Y','2019-11-25 12:58:15'),(152,42,'E250','Y','2019-11-25 12:58:15'),(153,42,'E350','Y','2019-11-25 12:58:15'),(154,42,'E200','Y','2019-11-25 12:58:15'),(155,42,'350d','Y','2019-11-25 12:58:15'),(156,42,'E250 CDI  AVANTAGRADE','Y','2019-11-25 12:58:15'),(157,42,'E 250 Avantgarde/Panaromic Sunrrof','Y','2019-11-25 12:58:15'),(158,42,'250 AVANTGRADE','Y','2019-11-25 12:58:15'),(159,42,'350','Y','2019-11-25 12:58:15'),(160,42,'250','Y','2019-11-25 12:58:15'),(161,42,'E220','Y','2019-11-25 12:58:15'),(162,43,'200 CGI','Y','2019-11-25 12:58:15'),(163,43,'200d Sport','Y','2019-11-25 12:58:15'),(164,43,'200 CDI Sport / Top Model','Y','2019-11-25 12:58:16'),(165,43,'45 AMG','Y','2019-11-25 12:58:16'),(166,43,'AMG','Y','2019-11-25 12:58:16'),(167,43,'220D sports Top model','Y','2019-11-25 12:58:16'),(168,43,'progresive','Y','2019-11-25 12:58:16'),(169,43,'220 Sports','Y','2019-11-25 12:58:16'),(170,44,'C 220','Y','2019-11-25 12:58:16'),(171,44,'c220d','Y','2019-11-25 12:58:16'),(172,44,'220d','Y','2019-11-25 12:58:16'),(173,44,'200','Y','2019-11-25 12:58:16'),(174,44,'CDI with sunroof','Y','2019-11-25 12:58:16'),(175,44,'C220 CDI AVANTGRADE','Y','2019-11-25 12:58:16'),(176,44,'C220 CDI Avantigarde','Y','2019-11-25 12:58:16'),(177,44,'220','Y','2019-11-25 12:58:16'),(178,44,'AVANTGARDE','Y','2019-11-25 12:58:16'),(179,44,'C 200 Avantgarde','Y','2019-11-25 12:58:17'),(180,44,'C220 CDI','Y','2019-11-25 12:58:17'),(181,44,'c200','Y','2019-11-25 12:58:17'),(182,44,'AVANTGARD','Y','2019-11-25 12:58:17'),(183,44,'220 CDI','Y','2019-11-25 12:58:17'),(184,44,'220cdi','Y','2019-11-25 12:58:17'),(185,44,'250CDI','Y','2019-11-25 12:58:17'),(186,44,'220 CDI Corporate','Y','2019-11-25 12:58:17'),(187,44,'C220','Y','2019-11-25 12:58:17'),(188,44,'AVANTGRADE','Y','2019-11-25 12:58:17'),(189,44,'C250 Cdi','Y','2019-11-25 12:58:17'),(190,44,'CDI TOP MODEL','Y','2019-11-25 12:58:17'),(191,44,'C200 Avantgarde','Y','2019-11-25 12:58:17'),(192,44,'C250','Y','2019-11-25 12:58:17'),(193,44,'220 AVANTGRADE','Y','2019-11-25 12:58:17'),(194,44,'C220 Avantgrade','Y','2019-11-25 12:58:17'),(195,46,'300','Y','2019-11-25 12:58:17'),(196,46,'S 350d','Y','2019-11-25 12:58:18'),(197,46,'cdi 320','Y','2019-11-25 12:58:18'),(198,46,'320 CDI','Y','2019-11-25 12:58:18'),(199,46,'S350 CDI','Y','2019-11-25 12:58:18'),(200,47,'200d','Y','2019-11-25 12:58:18'),(201,47,'CLA200 CDI','Y','2019-11-25 12:58:18'),(202,47,'CLA 200','Y','2019-11-25 12:58:18'),(203,47,'200CDISport','Y','2019-11-25 12:58:18'),(204,47,'200cdi','Y','2019-11-25 12:58:18'),(205,47,'200 CDI','Y','2019-11-25 12:58:18'),(206,48,'ML 350','Y','2019-11-25 12:58:18'),(207,48,'ML 250','Y','2019-11-25 12:58:18'),(208,48,'350CDI ML','Y','2019-11-25 12:58:18'),(209,48,'ML350','Y','2019-11-25 12:58:18'),(210,48,'ML250','Y','2019-11-25 12:58:18'),(211,48,'ML250CDI','Y','2019-11-25 12:58:18'),(212,48,'Ml Class','Y','2019-11-25 12:58:18'),(213,48,'ML350CDI','Y','2019-11-25 12:58:18'),(214,48,'350CDI','Y','2019-11-25 12:58:19'),(215,48,'350 CDI/Sunroof','Y','2019-11-25 12:58:19'),(216,48,'350 CDI','Y','2019-11-25 12:58:19'),(217,49,'250d','Y','2019-11-25 12:58:19'),(218,51,'SLK 350 CONVERTEBLE','Y','2019-11-25 12:58:19'),(219,53,'180','Y','2019-11-25 12:58:19'),(220,53,'B180','Y','2019-11-25 12:58:19'),(221,56,'Countryman','Y','2019-11-25 12:58:19'),(222,56,'Convertoble','Y','2019-11-25 12:58:19'),(223,56,'2 Door Top Model','Y','2019-11-25 12:58:19'),(224,57,'PENAROMOC SUNROOF','Y','2019-11-25 12:58:19'),(225,59,'sport 4*2 AT','Y','2019-11-25 12:58:19'),(226,62,'Turbo','Y','2019-11-25 12:58:19'),(227,62,'Turbo 550 BHP','Y','2019-11-25 12:58:19'),(228,62,'V6','Y','2019-11-25 12:58:19'),(229,63,'Carrera','Y','2019-11-25 12:58:19'),(230,65,'Boxter Convertible','Y','2019-11-25 12:58:20'),(231,65,'Boxter','Y','2019-11-25 12:58:20'),(232,67,'4*4 Auto','Y','2019-11-25 12:58:20'),(233,67,'4/4 AT','Y','2019-11-25 12:58:20'),(234,67,'4*2','Y','2019-11-25 12:58:20'),(235,67,'4*2 AUTO','Y','2019-11-25 12:58:20'),(236,67,'4/2 at','Y','2019-11-25 12:58:20'),(237,67,'SIGMA 4','Y','2019-11-25 12:58:20'),(238,67,'4*4 MANNUAL','Y','2019-11-25 12:58:20'),(239,67,'4/2 Automatic','Y','2019-11-25 12:58:20'),(240,67,'4*2 M/T','Y','2019-11-25 12:58:20'),(241,67,'4*2  MT','Y','2019-11-25 12:58:20'),(242,68,'VL','Y','2019-11-25 12:58:20'),(243,69,'HYBRIDE','Y','2019-11-25 12:58:20'),(244,72,'D4','Y','2019-11-25 12:58:20'),(245,72,'Momentum','Y','2019-11-25 12:58:20'),(246,72,'Cross Country','Y','2019-11-25 12:58:20'),(247,72,'D5','Y','2019-11-25 12:58:21'),(248,73,'Momentum with inscription grill','Y','2019-11-25 12:58:21'),(249,73,'XC90','Y','2019-11-25 12:58:21'),(250,73,'INSCRIPTION','Y','2019-11-25 12:58:21'),(251,76,'R design','Y','2019-11-25 12:58:21'),(252,76,'D3','Y','2019-11-25 12:58:21'),(253,76,'V40 R-Design','Y','2019-11-25 12:58:21');
/*!40000 ALTER TABLE `vehicle_varient_master_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_session_tbl`
--

DROP TABLE IF EXISTS `web_session_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_session_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `auth_key` varchar(100) NOT NULL,
  `expired_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_session_tbl`
--

LOCK TABLES `web_session_tbl` WRITE;
/*!40000 ALTER TABLE `web_session_tbl` DISABLE KEYS */;
INSERT INTO `web_session_tbl` VALUES (1,3,'182422aa-1293-4e78-b5c4-777493c774c2','0f3c8c33-3f42-42e0-99a0-867caed0c93f','2019-11-28 12:45:44','Y','2019-11-27 12:45:44'),(2,3,'7d0589d5-8c18-2e14-9ece-bc160d34598d','48d2fb39-1c91-4935-9d87-209ae3dafc34','2019-11-28 12:46:02','Y','2019-11-27 12:46:02'),(3,3,'5b3b6ef0-586a-f608-cbcd-2d1d6db335a7','b72b8ad2-23d4-46d5-945d-a9f48b794810','2019-11-28 13:04:13','Y','2019-11-27 13:04:13'),(4,3,'b6f47cf6-bd2d-3eda-03bb-8d713cc33aa2','37300dcb-6c63-46a0-96c9-4a9e857f5e51','2019-11-28 13:14:30','Y','2019-11-27 13:14:30'),(5,3,'904c3591-5995-53f9-69f6-cb4d7b370c4d','a00071f4-5c95-401f-9c36-4a66256c53ee','2019-11-28 13:31:15','Y','2019-11-27 13:31:15'),(6,3,'69ded9c6-d6e1-848b-0a0c-7b27c61845a0','d56289ae-46db-4b3d-b3a4-ee556d707d93','2019-11-28 14:03:51','Y','2019-11-27 14:03:51'),(7,3,'b8f03eeb-032e-f90a-94a7-20508d971bba','82b20ec7-c3b7-434e-a555-4b2446433766','2019-11-28 14:03:58','Y','2019-11-27 14:03:58'),(8,3,'e8532592-8c36-66f7-a145-4abcec9485a7','41767155-597e-401e-af6e-da2f0505d3ba','2019-11-29 04:55:23','Y','2019-11-28 04:55:23'),(9,3,'9ed0bfb1-b7d0-8631-50ec-e2d3a1126d9f','7a07981f-bbf8-4fb9-9e79-f27a8245c628','2019-11-29 04:56:54','Y','2019-11-28 04:56:54'),(10,3,'bff27420-5ea0-4a54-e88c-df20c24eb328','328baea2-1281-4979-b4f7-23667ba84e8d','2019-11-29 05:19:34','Y','2019-11-28 05:19:34'),(11,3,'018848eb-9ace-b3f5-86cf-32aaec4fa5fe','f18914c1-df65-4704-bc9d-3836dcf7d252','2019-11-29 05:37:07','Y','2019-11-28 05:37:07'),(12,3,'cdbdc0b6-cad0-0d17-b050-85f4c4a9a3cb','17b3406d-b07f-4e76-bc09-6014592d39d3','2019-11-29 05:54:32','Y','2019-11-28 05:54:32'),(13,3,'e4d5f6e2-506d-5f33-8133-65b3c837493d','d2554aa7-65ec-4386-b901-963c6f7d2385','2019-11-30 05:02:09','Y','2019-11-29 05:02:09'),(14,3,'05c35c1a-526a-e83e-46a9-9d0f858893fd','67cd4f08-1171-46fe-9484-7ab7c3286aca','2019-11-30 06:04:19','Y','2019-11-29 06:04:19'),(15,3,'27b80815-90ea-6e34-0644-bf23b93e369e','7ef8b304-26c1-427f-91ba-047b949ef0a1','2019-11-30 11:47:21','Y','2019-11-29 11:47:21'),(16,3,'f5cc4720-a084-ee51-feb4-4919e3fab678','82f3e8ad-7d02-4f8c-8d85-8091f4e662fc','2019-11-30 11:47:21','Y','2019-11-29 11:47:21'),(17,3,'d33e794b-35b6-f046-348a-200923747522','be141dbf-0675-4e4a-a5f0-f44618adaf42','2019-12-01 11:27:51','Y','2019-11-30 11:27:51'),(18,3,'13f17e0f-5e02-6449-5d6a-f15b6cb44d4b','697931f9-6779-433d-b6d9-cfcab8dfb201','2019-12-01 16:08:07','Y','2019-11-30 16:08:07'),(19,3,'0fb37ef3-32ad-53f5-a832-0464a0a2a9b4','af7d0513-3bf4-4420-af50-ab5f4e669ebb','2019-12-02 10:34:19','Y','2019-12-01 10:34:19'),(20,3,'ae03a6e9-ce76-4e00-587f-90e3bb65d52a','af6edcd0-1bfa-49e1-936f-fa7ceee1976d','2019-12-03 05:33:39','Y','2019-12-02 05:33:39'),(21,3,'bb96a190-4c28-ed83-6725-5a1ae6849c8e','4ff1d46f-3d1b-479e-93cb-4b5edb10cd61','2019-12-04 08:00:26','Y','2019-12-03 08:00:26'),(22,3,'d5970039-d0da-e73a-0598-146e8e3bbef2','07e7878a-d3ee-4c40-b7a3-bb23e56938d7','2019-12-04 12:30:06','Y','2019-12-03 12:30:06'),(23,3,'f8d18e58-963b-d5c5-fa75-9939170f2739','bc0760f2-a5c7-4bab-8d89-87c2f3f2e4bf','2019-12-05 06:21:17','Y','2019-12-04 06:21:17'),(24,3,'21e25b76-2bec-b65e-8a57-d6ce1e60f0c3','83ee9605-d8c7-46ff-926f-e6cd9098af4b','2019-12-05 11:14:13','Y','2019-12-04 11:14:13'),(25,3,'555a5db9-8756-e716-e393-6418587b53aa','11e6f91b-b682-42f2-90b7-411b75e6aa5b','2019-12-06 07:22:20','Y','2019-12-05 07:22:20'),(26,3,'5a116b32-db8f-f649-4b5e-22db0373a97e','0a935de0-e260-474d-a90c-4e7eb4490776','2019-12-06 09:01:52','Y','2019-12-05 09:01:52'),(27,3,'cf9f9c7d-16d5-63dc-fac5-7a3d18b43f6a','d6d497ea-ff45-4908-80fe-f9f2b68ee229','2019-12-06 12:10:14','Y','2019-12-05 12:10:14'),(28,3,'d29feae3-7d45-86d7-692e-d8662e726057','b3c1c502-c2a9-4cb5-b6ee-cee6d30d9ee0','2019-12-07 05:12:27','Y','2019-12-06 05:12:27'),(29,3,'625a9bb8-5e95-1584-5a49-fdfc2a675a1c','b8f1be61-28a9-40b3-984d-3b5ce31f05f6','2019-12-07 06:20:34','Y','2019-12-06 06:20:34'),(30,3,'b3d76d80-1c80-34ad-ab14-4433589fcf7d','4a770254-085d-4e36-92b3-43d358d1c0bf','2019-12-07 08:34:17','Y','2019-12-06 08:34:17'),(31,3,'186f6a19-8af7-133b-d39c-3816d55823e6','2865b5cd-1da3-4ce7-8e6b-cfe358d72f47','2019-12-08 08:33:18','Y','2019-12-07 08:33:18'),(32,3,'022deedc-eab9-b504-e738-66d73e92dbe0','b205a386-67b8-4bfe-9a9d-c31feb973f6b','2019-12-10 05:00:02','Y','2019-12-09 05:00:02'),(33,3,'ada73ff5-ea64-609e-02d5-f9dbc14e2f28','ab2843ec-ca8e-4e77-a0eb-4ee9137b589f','2019-12-10 06:08:18','Y','2019-12-09 06:08:18'),(34,3,'7686b6d7-ef36-8993-8e1d-e4e2788c0c7a','9023fd3e-92f9-4dfe-88fa-495d7f3794dc','2019-12-10 13:08:52','Y','2019-12-09 13:08:52'),(35,3,'c278dacd-8d5d-67f4-9bef-e7a980a2df84','a3c8b7bd-ddac-40ab-8838-b69b336210c0','2019-12-10 13:31:27','Y','2019-12-09 13:31:27'),(36,3,'e64744a5-6d8e-0e47-cfe0-b6f88b07c7ab','7d23b22d-0caa-41cc-98e7-9053e1973940','2019-12-10 13:46:03','Y','2019-12-09 13:46:03'),(37,3,'de9ddbbb-d325-c1ea-3f84-1678ee068370','d656c9f3-9eed-44fc-9425-dac2b5648530','2019-12-11 05:06:35','Y','2019-12-10 05:06:35'),(38,3,'5e478815-facb-07f1-3c7b-bb35351f1922','7248a19c-7083-480b-ad9f-fba9147a9392','2019-12-11 06:49:05','Y','2019-12-10 06:49:05'),(39,3,'cc33ab2c-ab4e-ed2a-8322-ca7da90d2b3c','ddeb6354-d0c3-4ed2-92d6-f19ca7764e58','2019-12-12 05:20:14','Y','2019-12-11 05:20:14'),(40,3,'72ee9160-cec5-8f6a-bf1c-1749330981ac','dea37252-cb3f-4c6b-95f4-1daa775038b3','2019-12-12 06:55:20','Y','2019-12-11 06:55:20'),(41,3,'256ed68f-f4b8-58dd-28a9-1c97900f7645','ebed9f17-d3b5-4e34-827d-1af89b1c9e12','2019-12-12 08:20:14','Y','2019-12-11 08:20:14'),(42,3,'3d723096-c423-923d-cb31-973e23346c16','67666288-b4e2-4b85-949b-63bb967257ed','2019-12-12 08:35:21','Y','2019-12-11 08:35:21'),(43,3,'42ee4e8c-3e3e-5a44-8eb4-6a6bb965aa36','a6545a1f-cd42-449f-b2c4-f5228545c73a','2019-12-12 12:26:31','Y','2019-12-11 12:26:31'),(44,3,'f52c6ad5-73f1-875d-8f70-8a13735bd5b9','334b6907-5b90-4b46-ad84-da5ef7d23b24','2019-12-12 12:33:23','Y','2019-12-11 12:33:23'),(45,3,'d8b201b4-15d4-2003-e8c0-ad78982ee645','e769b6f3-04fc-4930-9f09-09663169cfa3','2019-12-12 13:16:40','Y','2019-12-11 13:16:40'),(46,3,'be15f5b7-f38d-036d-e4cf-c48101214409','2dfbb990-1a41-4873-8ef5-6ef7225ef060','2019-12-13 04:36:48','Y','2019-12-12 04:36:48'),(47,3,'42ce3e26-b455-812f-bc99-6b97895599fe','eb381793-3d8d-456c-8bfb-1fc3726fec17','2019-12-13 05:09:01','Y','2019-12-12 05:09:01'),(48,3,'63a01daa-cb73-c63a-3c60-6d9cfab8e689','75ff27cd-2c76-480e-8556-e041ffe17b3b','2019-12-14 12:44:45','Y','2019-12-13 12:44:45'),(49,3,'40533e41-6bd3-5237-879a-7e6598baf812','73146a47-3e90-4a38-b6cd-ecdeaa8938c4','2019-12-15 05:42:24','Y','2019-12-14 05:42:24'),(50,3,'d6940955-3baa-3922-3527-885e9d07ab3f','a50dc991-0296-43c7-bc78-10e588ecbe8f','2019-12-17 06:12:40','Y','2019-12-16 06:12:40'),(51,3,'6abc5a34-c94a-0c3f-c8f4-86166f23b488','9d1fdf99-23e1-4c5c-ae70-4c95cb96b4cf','2019-12-17 09:48:07','Y','2019-12-16 09:48:07'),(52,3,'1c13aed3-88cf-ca4f-283c-0f62eab2f676','b290dc7c-3711-441f-864d-969ff47e0acc','2019-12-17 13:12:10','Y','2019-12-16 13:12:10'),(53,3,'b371cf4d-bf76-9b00-d03a-c217642feb6b','e75bf28b-01ab-4149-838d-f2721a581c43','2019-12-18 05:03:15','Y','2019-12-17 05:03:15'),(54,3,'f336e9e0-febf-21cd-1f01-b86ad3a64e61','5d178ab4-8476-4fdd-8fdc-53ea9aece960','2019-12-18 13:02:01','Y','2019-12-17 13:02:01'),(55,3,'3c95473c-bf58-f37a-311c-e592ea01424a','b0ffade7-6b75-41e9-b698-82c404d03226','2019-12-18 13:13:27','Y','2019-12-17 13:13:27'),(56,3,'5c18c43b-2f01-f56c-fffa-a6e767a5c9a9','66b1e79c-c357-4df8-bebe-5368cfc7f1a0','2019-12-18 15:54:06','Y','2019-12-17 15:54:06'),(57,3,'afeb55a4-c443-b503-a1e5-e13898be0868','140ed17d-b468-4841-a0bb-6d3a7bf18440','2019-12-18 17:01:27','Y','2019-12-17 17:01:27'),(58,3,'647d5ac8-69b0-c05c-e2af-7769303747d7','91519750-e475-4e8f-919d-fbff09f8c7e8','2019-12-19 04:39:33','Y','2019-12-18 04:39:33'),(59,3,'e323e95c-6d9a-4f71-04e4-85e338f5350e','dab3cbf3-386f-439f-98cd-521b12d7daf5','2019-12-19 04:44:11','Y','2019-12-18 04:44:11'),(60,3,'405dd625-b31e-5005-8226-f0570e833d20','9a79e35b-5378-4bd5-8893-205842c9fe2d','2019-12-19 10:08:36','Y','2019-12-18 10:08:36'),(61,3,'bf5ff3ff-c528-ce73-8741-a04a97d9e470','eb055cd7-65e7-4366-83a7-05b2adb9008f','2019-12-20 05:59:59','Y','2019-12-19 05:59:59'),(62,3,'a66e5a33-422c-339c-b747-16b29e7536e2','0931a485-9c7e-47dd-959d-d61377a4c4a6','2019-12-20 07:23:49','Y','2019-12-19 07:23:49'),(63,3,'382b5214-32ce-4c95-6ceb-db9b8999e444','a76d259a-ce3f-4ecb-9c37-a1bde5f9f601','2019-12-20 09:27:27','Y','2019-12-19 09:27:27'),(64,3,'6e7a2952-c8df-faa3-6c88-3f32dbc4ecd8','7bf0f9c8-2c96-4ccc-ac6c-cd235a6ffe68','2019-12-20 13:24:49','Y','2019-12-19 13:24:49'),(65,3,'77285fee-6ee2-5de9-f3f1-3a504925d5e0','3c928ffc-b363-45fa-b9ca-710b5175aae4','2019-12-21 04:47:46','Y','2019-12-20 04:47:46'),(66,3,'5214bea4-de80-e501-e9da-aec4362fd707','b34cff6c-c141-49ab-b660-328030914411','2019-12-21 10:34:13','Y','2019-12-20 10:34:13'),(67,3,'1b412577-f43c-c368-5112-73c7a8c636c0','e63f554e-5f78-4690-9c91-5c1821f8dd36','2019-12-21 14:16:10','Y','2019-12-20 14:16:10'),(68,3,'c2be2a63-be35-b5f5-6e69-711164b0481b','f84fb916-3d0e-4c01-8332-d3480123bd5e','2019-12-22 05:51:53','Y','2019-12-21 05:51:53'),(69,3,'e408b1f7-2e78-e134-f7ec-1b5ab3fcc064','4401a4d1-c0d5-4150-ae7b-bdc0d2b53c60','2019-12-22 08:14:33','Y','2019-12-21 08:14:33'),(70,3,'b08113ee-0332-bf4a-4c34-cccd6fae1707','6b4dd359-79d5-4a42-a14a-6a52eb630581','2019-12-24 04:59:35','Y','2019-12-23 04:59:35'),(71,3,'bd8d9f4d-e938-7cc8-2c27-546b82e038a1','ca1d1a78-837e-4cfe-a69c-3cc2757cb41f','2019-12-24 05:06:12','Y','2019-12-23 05:06:12'),(72,3,'1aed4c8c-d26a-f7d9-04d2-7c00f446acf3','7bcb624f-ff39-4280-8b3c-19036f666b67','2019-12-24 05:20:17','Y','2019-12-23 05:20:17'),(73,3,'61949e12-acf7-ae86-340a-88ebef66ad07','39ba14c8-7aea-4833-91a5-b3f34dd22281','2019-12-24 05:23:00','Y','2019-12-23 05:23:00'),(74,3,'11af4403-e2a9-5ed7-6c97-b26be309f10d','7c6d3510-0b15-4f5a-b0b4-039ceb7c115b','2019-12-24 05:54:11','Y','2019-12-23 05:54:11'),(75,3,'7254a2eb-aa11-d986-9d3e-75487f143414','4da99b08-e5ed-466b-bafa-570f31f8cf39','2019-12-24 12:29:35','Y','2019-12-23 12:29:35'),(76,3,'25cd9218-cc91-8893-4b5b-72ec6334cf34','d30480be-eeea-465f-8930-dd15a093150a','2019-12-25 05:19:34','Y','2019-12-24 05:19:34'),(77,3,'32aacfe9-6a3d-2841-304b-bf08ca9d1376','dc3e0947-efa4-406d-82c1-5280d298bee2','2019-12-25 05:36:09','Y','2019-12-24 05:36:09'),(78,3,'195d948a-b894-dafa-f690-e45b4d146b70','97250b12-e8ad-48af-a566-e718189d7333','2019-12-26 05:16:55','Y','2019-12-25 05:16:55'),(79,3,'415620c7-e9a4-38c9-ced7-c2cf42effedf','b82b1dad-396d-463b-ab95-7f17fc4529ae','2019-12-27 04:33:43','Y','2019-12-26 04:33:43'),(80,3,'6c5f6111-c857-76d1-7282-deec14a0cae4','51739a1e-e2c5-4e2e-ae43-2da82dddf793','2019-12-27 05:24:39','Y','2019-12-26 05:24:39'),(81,3,'9f76473a-1fed-c704-5c00-56ef62c42305','ab4c0271-c399-4db4-8da6-a89835b2a464','2019-12-28 06:30:30','Y','2019-12-27 06:30:30'),(82,3,'8394a3b4-1db8-aa6b-1908-62f4bee26f6d','c310d0f7-2de6-4140-a760-618bd7b875ca','2019-12-28 12:45:46','Y','2019-12-27 12:45:46'),(83,3,'6d8b0f40-2f13-90bb-6c8d-b4eef341feaf','58f81ecf-ae1b-4574-8172-ec6f4239d48b','2019-12-29 09:45:50','Y','2019-12-28 09:45:50'),(84,3,'710abd77-11f1-b2f9-f9f3-17d9f97c1a2b','eec8d4ac-9c5d-46e2-8bf7-6a7f6def685f','2020-01-01 12:08:48','Y','2019-12-31 12:08:48'),(85,3,'57a23ce6-555d-78e1-6f03-835cfbdf7da0','8b4dd679-b64c-4e1e-83f9-15862e07b905','2020-01-01 12:42:42','Y','2019-12-31 12:42:42'),(86,3,'81f59640-fcf1-de53-8af3-bea985a8f278','89756d37-2de4-4281-8449-de5286b2ff03','2020-01-02 07:27:31','Y','2020-01-01 07:27:31'),(87,3,'026e6765-af5d-842f-d8bc-e3bf69b13c41','eb52d412-33d2-4e11-b38f-076e2171f3f2','2020-01-03 05:16:43','Y','2020-01-02 05:16:43'),(88,3,'ad154556-8634-b3cb-7aae-7eb5e0ea289e','04a549fe-b32e-4e95-8e23-81166b165b11','2020-01-03 07:00:32','Y','2020-01-02 07:00:32'),(89,3,'b1f976df-4eaa-f959-78b9-25e337ccb8ce','f0f37990-181c-4a77-a0d4-f31345befa18','2020-01-03 07:03:01','Y','2020-01-02 07:03:01'),(90,3,'3948696f-bd1c-c690-a614-019bca68dca8','f4fdd2de-7bd9-4835-a716-c3fd2b82ff6a','2020-01-03 07:08:04','Y','2020-01-02 07:08:04'),(91,3,'2dd3ed66-a42b-f9d8-c665-0cef19631a83','a110c214-7e5f-4e54-9d99-f70770f7d7b0','2020-01-03 09:57:23','Y','2020-01-02 09:57:23');
/*!40000 ALTER TABLE `web_session_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'luxury_ride_db'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `employee_vehicle_assignment_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+05:30' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`%`*/ /*!50106 EVENT `employee_vehicle_assignment_event` ON SCHEDULE EVERY 10 MINUTE STARTS '2019-10-15 00:00:00' ON COMPLETION NOT PRESERVE DISABLE DO CALL EmployeeVehicleAssignment */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `InActiveInvesterInterestsEvent` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+05:30' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`%`*/ /*!50106 EVENT `InActiveInvesterInterestsEvent` ON SCHEDULE EVERY 1 MINUTE STARTS '2019-01-11 23:02:15' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
  	CALL InActiveInterestsScheduler();
  END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'luxury_ride_db'
--
/*!50003 DROP FUNCTION IF EXISTS `CheckoutCalculationNew` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `CheckoutCalculationNew`(
purchase_amount_set double(10,2),
invester_id int(15),
date_set datetime 
) RETURNS varchar(500) CHARSET latin1
BEGIN
declare invester_ids varchar(200);
declare penalty_amount_set varchar(200);
declare package_amount_shown varchar(200);
declare penalty_amount varchar(200);
declare tax double;
declare final_package_mount double;
declare finalAmount varchar(200);

set penalty_amount_set=0;
set penalty_amount_set = ( select IFNULL(SUM(IF(iit.is_active='N' and iit.penalty_paid='N' , iit.penalty_amount, 0)),0) 
 from invester_vehicle_interest_tbl iit where iit.penalty_date<=date_set and  iit.invester_id=invester_id);

case
when penalty_amount_set >=0 then 
set penalty_amount =penalty_amount_set;
set package_amount_shown = purchase_amount_set;
/*set tax = (package_amount_shown * 0.18);*/
set final_package_mount = (package_amount_shown + penalty_amount);

RETURN json_object('purchase_price',package_amount_shown,'penalty',penalty_amount,'Total_price',final_package_mount);
 
end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UCFirst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `UCFirst`(val varchar(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
RETURN CONCAT(UCASE(LEFT(val, 1)), 
                             SUBSTRING(val, 2));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `uc_first` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `uc_first`(str VARCHAR(200)) RETURNS varchar(200) CHARSET latin1
BEGIN
    set str:= lcase(str);
    set str:= CONCAT(UCASE(LEFT(str, 1)),SUBSTRING(str, 2));
    set str:= REPLACE(str, ' a', ' A');
    set str:= REPLACE(str, ' b', ' B');
    set str:= REPLACE(str, ' c', ' C');
    set str:= REPLACE(str, ' d', ' D');
    set str:= REPLACE(str, ' e', ' E');
    set str:= REPLACE(str, ' f', ' F');
    set str:= REPLACE(str, ' g', ' G');
    set str:= REPLACE(str, ' h', ' H');
    set str:= REPLACE(str, ' i', ' I');
    set str:= REPLACE(str, ' j', ' J');
    set str:= REPLACE(str, ' k', ' K');
    set str:= REPLACE(str, ' l', ' L');
    set str:= REPLACE(str, ' m', ' M');
    set str:= REPLACE(str, ' n', ' N');
    set str:= REPLACE(str, ' o', ' O');
    set str:= REPLACE(str, ' p', ' P');
    set str:= REPLACE(str, ' q', ' Q');
    set str:= REPLACE(str, ' r', ' R');
    set str:= REPLACE(str, ' s', ' S');
    set str:= REPLACE(str, ' t', ' T');
    set str:= REPLACE(str, ' u', ' U');
    set str:= REPLACE(str, ' v', ' V');
    set str:= REPLACE(str, ' w', ' W');
    set str:= REPLACE(str, ' x', ' X');
    set str:= REPLACE(str, ' y', ' Y');
    set str:= REPLACE(str, ' z', ' Z');
    return  str;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EmployeeVehicleAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `EmployeeVehicleAssignment`()
BEGIN
  DECLARE done INT DEFAULT FALSE;
    DECLARE employee int(12);
    DECLARE vehicle int(12);
    Declare assign varchar(10);
    DECLARE cur1 CURSOR FOR select ept.evaluator_id,vmt.vehicle_id
                            from vehicle_master_tbl vmt inner join evaluator_pincode_tabl ept
                            on vmt.pincode=ept.pincode 
                            and vmt.is_active='Y' group by vmt.vehicle_id;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
      set assign='AUTO';
     OPEN cur1;
   read_loop: LOOP
     FETCH cur1 INTO employee,vehicle;
     IF done THEN
       LEAVE read_loop;
     END IF;
    if  vehicle not in(select vehicle_id from evaluator_vehicle_assignment_tbl where  is_active='Y') then
       INSERT INTO evaluator_vehicle_assignment_tbl (vehicle_id,evaluator_id,assigned_by)
       VALUES (vehicle,employee,assign);
 	else if vehicle  in (select vehicle_id from evaluator_vehicle_assignment_tbl  where is_active='Y' ) then
       update evaluator_vehicle_assignment_tbl set evaluator_id=employee where vehicle_id=vehicle and is_active='Y';
 	END IF;
     END IF;
END LOOP;
 
   CLOSE cur1;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInvesterFilterPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getInvesterFilterPrice`(in getmin int , in getmax int)
begin
 
 
if getmin is null and getmax is null then 
select vehicle_id from purchased_vehicle_details_tbl where is_active='Y';
else 
select vehicle_id  from purchased_vehicle_details_tbl 
where (purchase_price+refurbish_amount) between
getmin and getmax group by vehicle_id;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InActiveInterestsScheduler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `InActiveInterestsScheduler`()
BEGIN
DECLARE done INT DEFAULT FALSE;
	DECLARE getInterestId int(12);
    declare getpenaltyPrice int(100);
	DECLARE cur1 CURSOR FOR select ivi.interest_id,((purchase_price+refurbish_amount)*(0.1/100)) as price
    from invester_vehicle_interest_tbl ivi inner join purchased_vehicle_details_tbl pvt
    on pvt.vehicle_id=ivi.vehicle_id and pvt.is_active='Y'
	where ivi.penalty_date < now() and 
    ivi.vehicle_id not in (select vehicle_id from invester_payments_tbl where invester_id=ivi.invester_id and is_payment_done='Y');
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur1;
    read_loop: LOOP
      FETCH cur1 INTO getInterestId,getpenaltyPrice;
      IF done THEN
        LEAVE read_loop;
      END IF;      
	SET SQL_SAFE_UPDATES = 0;
      update invester_vehicle_interest_tbl set is_active='N',penalty_amount=getpenaltyPrice where interest_id=getInterestId and is_active = 'Y';
	END LOOP;
    CLOSE cur1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-03 10:32:20
