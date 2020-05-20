-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 13.235.200.245    Database: luxury_ride_db
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
-- Table structure for table `city_master_tbl`
--

DROP TABLE IF EXISTS `city_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_master_tbl` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(120) NOT NULL,
  `state_id` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  KEY `FKstate_id_idx` (`state_id`),
  CONSTRAINT `FKstate_id` FOREIGN KEY (`state_id`) REFERENCES `state_master_tbl` (`state_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dummy_scrap_tbl`
--

DROP TABLE IF EXISTS `dummy_scrap_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dummy_scrap_tbl` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `image` text,
  `product_id` int(50) DEFAULT NULL,
  `source_id` int(20) DEFAULT NULL,
  `pincode` int(10) DEFAULT NULL,
  `customer_id` int(20) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `phone_no` int(15) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `register_no` varchar(50) DEFAULT NULL,
  `car_make` varchar(50) DEFAULT NULL,
  `car_model` varchar(50) DEFAULT NULL,
  `vehicle_variant` varchar(50) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_color` varchar(50) DEFAULT NULL,
  `production_year` varchar(50) DEFAULT NULL,
  `purchase_date` varchar(50) DEFAULT NULL,
  `vehicle_name` varchar(200) DEFAULT NULL,
  `expected_price` varchar(50) DEFAULT NULL,
  `km_driven` varchar(50) DEFAULT NULL,
  `fuel_type` varchar(50) DEFAULT NULL,
  `refurbished` varchar(10) DEFAULT NULL,
  `no_of_owners` int(10) DEFAULT NULL,
  `transmision` varchar(25) DEFAULT NULL,
  `manufacturing_year` varchar(50) DEFAULT NULL,
  `registered_date` varchar(50) DEFAULT NULL,
  `current_city` varchar(50) DEFAULT NULL,
  `listed_date` varchar(50) DEFAULT NULL,
  `updated_date` varchar(50) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2693 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `document_id` int(15) DEFAULT NULL,
  `document_proof` text,
  `is_active` char(1) DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_details_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_details_tbl_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_master_tbl` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `ip_address` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) DEFAULT NULL,
  `reauth_key` varchar(100) DEFAULT NULL,
  `auth_expires_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10793 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER after_sales_lead_insert
 before insert
 ON sales_lead_master_tbl FOR EACH ROW
 BEGIN
    case when  NEW.planning_by=1 THEN  SET NEW.planning_to_by = DATE_ADD(date(now()), INTERVAL 15 DAY) ;
   when  NEW.planning_by=2 THEN  SET NEW.planning_to_by = DATE_ADD(date(now()), INTERVAL 30 DAY) ;
      when   NEW.planning_by=3 THEN  SET NEW.planning_to_by = DATE_ADD(date(now()), INTERVAL 60 DAY) ;
      when    NEW.planning_by=4 THEN  SET NEW.planning_to_by = DATE_ADD(date(now()), INTERVAL 90 DAY) ;
 END case;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `images` text,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`showroom_id`),
  KEY `FKcity_idx_idx` (`city_id`),
  CONSTRAINT `FKcity_idx` FOREIGN KEY (`city_id`) REFERENCES `city_master_tbl` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `transaction_type_master_tbl`
--

DROP TABLE IF EXISTS `transaction_type_master_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_type_master_tbl` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3839 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `rc_availability` char(10) DEFAULT 'No',
  `rc_image` text,
  `inter_state` char(10) DEFAULT 'No',
  `inter_state_noc_issued` char(10) DEFAULT 'No',
  `inter_state_road_tax_paid` char(10) DEFAULT 'No',
  `under_hypothecation` char(10) DEFAULT 'No',
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`document_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `registration_year` varchar(15) DEFAULT NULL,
  `pincode` varchar(15) DEFAULT NULL,
  `no_of_owners` varchar(20) DEFAULT NULL,
  `vehicle_condition` varchar(25) DEFAULT NULL,
  `expected_selling_price` varchar(10) DEFAULT NULL,
  `odometer` varchar(20) DEFAULT NULL,
  `transmission` varchar(100) DEFAULT NULL,
  `vehicle_video` text,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vehicle_id`),
  KEY `purchase_lead_id` (`purchase_lead_id`),
  CONSTRAINT `vehicle_master_tbl_ibfk_1` FOREIGN KEY (`purchase_lead_id`) REFERENCES `purchase_lead_tbl` (`purchase_lead_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FKtransaction_type_idx` FOREIGN KEY (`transaction_type`) REFERENCES `transaction_type_master_tbl` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`%`*/ /*!50106 EVENT `InActiveInvesterInterestsEvent` ON SCHEDULE EVERY 1 MINUTE STARTS '2019-01-11 23:02:15' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
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
set final_package_mount = (package_amount_shown+ penalty_amount);

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

-- Dump completed on 2019-12-20 11:22:25
