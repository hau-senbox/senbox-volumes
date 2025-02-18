/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sen_master_db
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB-ubu2404

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
-- Table structure for table `s_app_key`
--

DROP TABLE IF EXISTS `s_app_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_app_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_app_key`
--

LOCK TABLES `s_app_key` WRITE;
/*!40000 ALTER TABLE `s_app_key` DISABLE KEYS */;
INSERT INTO `s_app_key` VALUES
(1,'8c30f8d5-f430-4079-bc7f-cfea3d61704d','2023-09-04 11:41:16.008','2023-09-04 11:41:16.008');
/*!40000 ALTER TABLE `s_app_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_code_counting`
--

DROP TABLE IF EXISTS `s_code_counting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_code_counting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT current_timestamp(3),
  `updated_at` datetime(3) DEFAULT current_timestamp(3),
  `deleted_at` datetime(3) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `current_value` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`token`),
  KEY `idx_s_code_counting_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_code_counting`
--

LOCK TABLES `s_code_counting` WRITE;
/*!40000 ALTER TABLE `s_code_counting` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_code_counting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_company`
--

DROP TABLE IF EXISTS `s_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_s_company_address` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_company`
--

LOCK TABLES `s_company` WRITE;
/*!40000 ALTER TABLE `s_company` DISABLE KEYS */;
INSERT INTO `s_company` VALUES
(1,'SENBOX','No. 8, Street 56, Tan Phong Ward, District 7, HCMC','SENBOX, VN, HCMC, D7','2024-11-28 03:17:45.006','2024-11-28 03:17:45.006');
/*!40000 ALTER TABLE `s_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_device`
--

DROP TABLE IF EXISTS `s_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_device` (
  `id` varchar(36) NOT NULL,
  `device_name` varchar(255) NOT NULL DEFAULT '',
  `input_mode` varchar(32) NOT NULL DEFAULT '1',
  `screen_button_type` varchar(16) NOT NULL DEFAULT 'scan',
  `status` varchar(32) NOT NULL DEFAULT '1',
  `deactivate_message` varchar(255) NOT NULL DEFAULT '',
  `button_url` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `app_version` varchar(255) NOT NULL DEFAULT '',
  `row_no` bigint(20) NOT NULL DEFAULT 0,
  `device_component_values_id` bigint(20) DEFAULT 1,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `fk_s_device_device_component_values` (`device_component_values_id`),
  CONSTRAINT `fk_s_device_device_component_values` FOREIGN KEY (`device_component_values_id`) REFERENCES `s_device_component_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_device`
--

LOCK TABLES `s_device` WRITE;
/*!40000 ALTER TABLE `s_device` DISABLE KEYS */;
INSERT INTO `s_device` VALUES
('5fb2394c02fb3939','Alihan (11)','back_office','scan','mode t','Message Alihan 1','','','',13,1,'2024-12-25 09:24:26.080','2025-02-14 02:28:10.343');
/*!40000 ALTER TABLE `s_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_device_component_values`
--

DROP TABLE IF EXISTS `s_device_component_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_device_component_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `setting` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}' CHECK (json_valid(`setting`)),
  PRIMARY KEY (`id`),
  KEY `fk_s_device_component_values_company` (`company_id`),
  CONSTRAINT `fk_s_device_component_values_company` FOREIGN KEY (`company_id`) REFERENCES `s_company` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_device_component_values`
--

LOCK TABLES `s_device_component_values` WRITE;
/*!40000 ALTER TABLE `s_device_component_values` DISABLE KEYS */;
INSERT INTO `s_device_component_values` VALUES
(1,1,'2024-11-13 02:42:03.590','2024-12-14 09:24:40.938','{\"component_attributes\":[{\"name\":\"Value 1: Top button\",\"value\":\"value-1-top-button\"},{\"name\":\"Value 2: Connection label\",\"value\":\"value-2-connection-label\"},{\"name\":\"Value 3: Logo\",\"value\":\"value-3-logo\"},{\"name\":\"Value 1: Student\",\"value\":\"value-1\"},{\"name\":\"Value 2: Company\",\"value\":\"value-2\"},{\"name\":\"Value 3: Teacher\",\"value\":\"value-3\"},{\"name\":\"Avatar\",\"value\":\"avatar\"},{\"name\":\"Screen button\",\"value\":\"screen-button\"},{\"name\":\"Message box\",\"value\":\"message-box\"},{\"name\":\"Date\",\"value\":\"date\"},{\"name\":\"Time\",\"value\":\"time\"},{\"name\":\"Success button\",\"value\":\"success-button\"},{\"name\":\"Chat button\",\"value\":\"chat-button\"},{\"name\":\"Message button\",\"value\":\"message-button\"},{\"name\":\"Off\",\"value\":\"off\"}],\"component_settings\":[{\"component_name\":\"Top button\",\"component_type\":\"button\",\"component_position\":\"top-button\",\"component_position_root\":\"top-button\",\"component_condition\":null},{\"component_name\":\"Connection label\",\"component_type\":\"text\",\"component_position\":\"connection-label\",\"component_position_root\":\"connection-label\",\"component_condition\":null},{\"component_name\":\"Logo\",\"component_type\":\"picture\",\"component_position\":\"logo\",\"component_position_root\":\"logo\",\"component_condition\":null},{\"component_name\":\"Value 1: Student\",\"component_type\":\"text\",\"component_position\":\"value-1\",\"component_position_root\":\"value-1\",\"component_condition\":null},{\"component_name\":\"Value 2: Company\",\"component_type\":\"text\",\"component_position\":\"value-2\",\"component_position_root\":\"value-2\",\"component_condition\":null},{\"component_name\":\"Value 3: Teacher\",\"component_type\":\"text\",\"component_position\":\"value-3\",\"component_position_root\":\"value-3\",\"component_condition\":null},{\"component_name\":\"Avatar\",\"component_type\":\"picture\",\"component_position\":\"avatar\",\"component_position_root\":\"avatar\",\"component_condition\":[{\"condition_name\":\"Student Avatar\",\"condition_value\":\"\",\"delay_display\":null,\"priority\":1},{\"condition_name\":\"Image from URL\",\"condition_value\":\"https://myimage.com\",\"delay_display\":5,\"priority\":2},{\"condition_name\":\"Teacher Avatar\",\"condition_value\":\"\",\"delay_display\":null,\"priority\":3},{\"condition_name\":\"Company Logo\",\"condition_value\":\"\",\"delay_display\":5,\"priority\":4}]},{\"component_name\":\"Screen button\",\"component_type\":\"button\",\"component_position\":\"screen-button\",\"component_position_root\":\"screen-button\",\"component_condition\":null},{\"component_name\":\"Message box\",\"component_type\":\"text\",\"component_position\":\"message-box\",\"component_position_root\":\"message-box\",\"component_condition\":null},{\"component_name\":\"Date text\",\"component_type\":\"text\",\"component_position\":\"date\",\"component_position_root\":\"date\",\"component_condition\":null},{\"component_name\":\"Time text\",\"component_type\":\"text\",\"component_position\":\"time\",\"component_position_root\":\"time\",\"component_condition\":null},{\"component_name\":\"Success button\",\"component_type\":\"button\",\"component_position\":\"success-button\",\"component_position_root\":\"success-button\",\"component_condition\":null},{\"component_name\":\"Chat button\",\"component_type\":\"button\",\"component_position\":\"chat-button\",\"component_position_root\":\"chat-button\",\"component_condition\":null},{\"component_name\":\"Message Button\",\"component_type\":\"button\",\"component_position\":\"message-button\",\"component_position_root\":\"message-button\",\"component_condition\":null}]}');
/*!40000 ALTER TABLE `s_device_component_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_device_form_dataset`
--

DROP TABLE IF EXISTS `s_device_form_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_device_form_dataset` (
  `id` varchar(255) NOT NULL,
  `device_id` varchar(36) NOT NULL,
  `set` mediumtext NOT NULL,
  `question_date` mediumtext DEFAULT '',
  `question_time` mediumtext DEFAULT '',
  `question_date_time` mediumtext DEFAULT '',
  `question_duration_forward` mediumtext DEFAULT '',
  `question_duration_backward` mediumtext DEFAULT '',
  `question_scale` mediumtext DEFAULT '',
  `question_qr_code` mediumtext DEFAULT '',
  `question_selection` mediumtext DEFAULT '',
  `question_text` mediumtext DEFAULT '',
  `question_count` mediumtext DEFAULT '',
  `question_number` mediumtext DEFAULT '',
  `question_photo` mediumtext DEFAULT '',
  `question_multiple_choice` mediumtext DEFAULT '',
  `question_button_count` mediumtext DEFAULT '',
  `question_single_choice` mediumtext DEFAULT '',
  `question_button_list` mediumtext DEFAULT '',
  `question_message_box` mediumtext DEFAULT '',
  `question_show_pic` mediumtext DEFAULT '',
  `question_button` mediumtext DEFAULT '',
  `question_play_video` mediumtext DEFAULT '',
  `question_qr_code_front` mediumtext DEFAULT '',
  `question_choice_toggle` mediumtext DEFAULT '',
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `question_signature` mediumtext DEFAULT '',
  `question_web` mediumtext DEFAULT '',
  `question_draggable_list` mediumtext DEFAULT '',
  `question_send_message` mediumtext DEFAULT '',
  `question_web_user` mediumtext DEFAULT '',
  PRIMARY KEY (`id`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_device_form_dataset`
--

LOCK TABLES `s_device_form_dataset` WRITE;
/*!40000 ALTER TABLE `s_device_form_dataset` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_device_form_dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_form`
--

DROP TABLE IF EXISTS `s_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_form` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `note` varchar(255) NOT NULL,
  `name` varchar(1000) NOT NULL DEFAULT '',
  `spreadsheet_url` varchar(255) NOT NULL,
  `spreadsheet_id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `sheet_name` varchar(255) NOT NULL DEFAULT 'Questions',
  `type` varchar(32) NOT NULL DEFAULT 'general',
  `sync_strategy` varchar(32) NOT NULL DEFAULT 'on_submit',
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_s_form_note` (`note`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_form`
--

LOCK TABLES `s_form` WRITE;
/*!40000 ALTER TABLE `s_form` DISABLE KEYS */;
INSERT INTO `s_form` VALUES
(1,'SENBOX.ORG/TestlocalAPI','[SHOW]Hau fake','https://docs.google.com/spreadsheets/d/1MByfyrrTgmff4rj3SW0OeDZQHJN1ex0eZeAt8KfpG88/edit?gid=1987360762#gid=1987360762','1MByfyrrTgmff4rj3SW0OeDZQHJN1ex0eZeAt8KfpG88','',1,'Questions','general','on_submit','2024-12-19 08:33:36.394','2024-12-19 08:33:36.394'),
(2,'SENBOX.ORG/Transition-Form','[SHOW]📲 Transition - Form ','https://docs.google.com/spreadsheets/d/1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc/edit?gid=1987360762#gid=1987360762','1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc','',1,'Questions','general','on_submit','2024-12-19 08:33:37.616','2024-12-19 08:33:37.616'),
(3,'SENBOX.ORG/{Search}:SearchLocTest','[SHOW]','https://docs.google.com/spreadsheets/d/1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0/edit?gid=1987360762#gid=1987360762','1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0','',1,'Questions','general','on_submit','2024-12-19 08:33:39.032','2024-12-19 08:33:39.032'),
(37,'SENBOX.ORG/Menu','[SHOW]Menu','https://docs.google.com/spreadsheets/d/17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E/edit?gid=1987360762#gid=1987360762','17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E','',1,'Questions','general','on_submit','2024-12-21 07:30:42.650','2024-12-21 07:30:42.650'),
(38,'SENBOX.ORG/Search Test','[SHOW]🔎 Search Test','https://docs.google.com/spreadsheets/d/1UnXYV55ZVXlIg96U5ZM-OfqSMkLOwfycKZ7osN0xrKo/edit?gid=1987360762#gid=1987360762','1UnXYV55ZVXlIg96U5ZM-OfqSMkLOwfycKZ7osN0xrKo','',1,'Questions','general','on_submit','2024-12-21 07:30:44.102','2024-12-21 07:30:44.102'),
(39,'SENBOX.ORG/Trung-Test','[SHOW]1','https://docs.google.com/spreadsheets/d/1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs/edit?gid=1987360762#gid=1987360762','1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs','',1,'Questions','general','on_submit','2024-12-21 07:30:45.971','2024-12-21 07:30:45.971'),
(40,'SENBOX.ORG/TestForm','[SHOW]1','https://docs.google.com/spreadsheets/d/1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI/edit#gid=1987360762','1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI','',1,'Questions','general','on_submit','2024-12-21 07:30:47.217','2024-12-21 07:30:47.217'),
(51,'SENBOX.ORG/[SIGNUP]:Menu','[SHOW]Sign Up Menu','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up Menu','general','on_submit','2024-12-24 08:38:33.504','2024-12-24 08:38:33.504'),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:Configuration','[SHOW]1','https://docs.google.com/spreadsheets/d/14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk/edit?gid=1987360762#gid=1987360762','14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk','',1,'Configuration','general','on_submit','2024-12-25 04:48:23.182','2024-12-25 04:48:23.182'),
(82,'SENBOX.ORG/Test-Form','[SHOW]📲 Test - Form ','https://docs.google.com/spreadsheets/d/1wfwntxV19ipMgjmyX_P-SAQuUnHrNaH6_Rsqmw9fS5Y/edit?gid=1987360762#gid=1987360762','1wfwntxV19ipMgjmyX_P-SAQuUnHrNaH6_Rsqmw9fS5Y','',1,'Questions','general','on_submit','2024-12-31 08:46:43.296','2024-12-31 08:46:43.296'),
(83,'SENBOX.ORG/Test-Form-Response','[SHOW]📲 Test - Form - Response','https://docs.google.com/spreadsheets/d/1dOuEGJWvbn5v4M32uP4s4YpXez8CK9qIz9hDNWYILkg/edit?gid=1987360762#gid=1987360762','1dOuEGJWvbn5v4M32uP4s4YpXez8CK9qIz9hDNWYILkg','',1,'Questions','general','on_submit','2024-12-31 08:46:44.433','2024-12-31 08:46:44.433'),
(119,'SENBOX.ORG/[SIGNUP]:Sign Up 0','[SHOW]Sign Up','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 0','general','on_submit','2025-01-03 03:21:29.177','2025-01-03 03:21:29.177'),
(120,'SENBOX.ORG/[SIGNUP]:Sign Up 1','[SHOW]Parent Sign up','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 1','general','on_submit','2025-01-03 03:21:29.800','2025-01-03 03:21:29.800'),
(121,'SENBOX.ORG/[SIGNUP]:Sign Up 2','[SHOW]Student Sign up','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 2','general','on_submit','2025-01-03 03:21:30.408','2025-01-03 03:21:30.408'),
(122,'SENBOX.ORG/[SIGNUP]:Sign Up 3','[SHOW]Teacher SIGN UP','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 3','general','on_submit','2025-01-03 03:21:30.953','2025-01-03 03:21:30.953'),
(123,'SENBOX.ORG/[SIGNUP]:Sign Up 4','[SHOW]School/ Center SIGN UP','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 4','general','on_submit','2025-01-03 03:21:31.630','2025-01-03 03:21:31.630'),
(124,'SENBOX.ORG/[SIGNUP]:Sign Up 5','[SHOW]Teacher Job Interview','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 5','general','on_submit','2025-01-03 03:21:32.246','2025-01-03 03:21:32.246'),
(125,'SENBOX.ORG/[SIGNUP]:Sign Up 6','[SHOW]Teacher\'s concern','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 6','general','on_submit','2025-01-03 03:21:32.856','2025-01-03 03:21:32.856'),
(126,'SENBOX.ORG/[SIGNUP]:Sign Up 7','[SHOW]Self- Evaluation','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 7','general','on_submit','2025-01-03 03:21:33.460','2025-01-03 03:21:33.460'),
(127,'SENBOX.ORG/[SIGNUP]:Sign Up 8','[SHOW]X.  Client Relationship','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 8','general','on_submit','2025-01-03 03:21:34.088','2025-01-03 03:21:34.088'),
(128,'SENBOX.ORG/[SIGNUP]:Sign Up 9','[SHOW]Play - Preference\nChơi - Sở thích','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 9','general','on_submit','2025-01-03 03:21:34.694','2025-01-03 03:21:34.694'),
(129,'SENBOX.ORG/[SIGNUP]:Sign Up 10','[SHOW]WORK-SBT Bài học','https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=547891697#gid=547891697','1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ','',1,'Sign Up 10','general','on_submit','2025-01-03 03:21:35.307','2025-01-03 03:21:35.307'),
(139,'SENBOX.ORG/SBT-[SBFS-0915]','[SHOW]BEHAVIOUR','https://docs.google.com/spreadsheets/d/1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA/edit#gid=1450593836','1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA','',1,'Questions','general','on_submit','2025-01-03 04:35:50.336','2025-01-03 04:35:50.336'),
(141,'SENBOX.ORG/User-Information','[SHOW]📲 User Information','https://docs.google.com/spreadsheets/d/1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8/edit?gid=1987360762#gid=1987360762','1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8','',1,'Questions','general','on_submit','2025-01-06 04:45:21.602','2025-01-06 04:45:21.602'),
(144,'SENBOX.ORG/Language-Buttons-Signup','[SHOW]Sign up Languages [SB APP]','https://docs.google.com/spreadsheets/d/152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg/edit?gid=1987360762#gid=1987360762','152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg','',1,'Languages','general','on_submit','2025-01-10 04:08:59.286','2025-01-10 04:08:59.286');
/*!40000 ALTER TABLE `s_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_form_question`
--

DROP TABLE IF EXISTS `s_form_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_form_question` (
  `form_id` bigint(20) unsigned NOT NULL,
  `question_id` varchar(255) NOT NULL,
  `created_at` varchar(191) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `updated_at` varchar(191) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `order` bigint(20) NOT NULL DEFAULT 0,
  `answer_required` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`form_id`,`question_id`),
  KEY `fk_s_form_question_question` (`question_id`),
  CONSTRAINT `fk_s_form_question_form` FOREIGN KEY (`form_id`) REFERENCES `s_form` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_form_question_question` FOREIGN KEY (`question_id`) REFERENCES `s_question` (`question_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_form_question`
--

LOCK TABLES `s_form_question` WRITE;
/*!40000 ALTER TABLE `s_form_question` DISABLE KEYS */;
INSERT INTO `s_form_question` VALUES
(1,'SENBOX.ORG/TESTLOCALAPI_1MByfyrrTgmff4rj3SW0OeDZQHJN1ex0eZeAt8KfpG88_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(1,'SENBOX.ORG/TESTLOCALAPI_1MByfyrrTgmff4rj3SW0OeDZQHJN1ex0eZeAt8KfpG88_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,1),
(2,'SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,1),
(3,'SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(3,'SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,1),
(3,'SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,1),
(3,'SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,1),
(3,'SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,1),
(3,'SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',990,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_19','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',20,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_21','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',22,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',23,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_23','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',24,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_24','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',25,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_25','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',26,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_26','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',27,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_27','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',28,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_28','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',29,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_29','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',30,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_30','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',31,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_32','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',33,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_34','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',35,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_35','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',36,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_46','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',47,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_47','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',48,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_48','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',49,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_49','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',50,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_50','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',51,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_51','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',52,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_52','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',53,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_53','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',54,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_54','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',55,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_55','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',56,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_57','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',58,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_58','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',59,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(37,'SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(38,'SENBOX.ORG/SEARCH TEST_1UnXYV55ZVXlIg96U5ZM-OfqSMkLOwfycKZ7osN0xrKo_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(38,'SENBOX.ORG/SEARCH TEST_1UnXYV55ZVXlIg96U5ZM-OfqSMkLOwfycKZ7osN0xrKo_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(38,'SENBOX.ORG/SEARCH TEST_1UnXYV55ZVXlIg96U5ZM-OfqSMkLOwfycKZ7osN0xrKo_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_10','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,1),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(39,'SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_20','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',21,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',23,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_25','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',26,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_31','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',32,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_33','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',34,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_35','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',36,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_37','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',38,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_44','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',45,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_45','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',46,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_47','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',48,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_48','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',49,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_49','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',50,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_50','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',51,0),
(40,'SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(51,'SENBOX.ORG/[SIGNUP]:MENU_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(51,'SENBOX.ORG/[SIGNUP]:MENU_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(66,'SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(82,'SENBOX.ORG/TEST-FORM_1wfwntxV19ipMgjmyX_P-SAQuUnHrNaH6_Rsqmw9fS5Y_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(82,'SENBOX.ORG/TEST-FORM_1wfwntxV19ipMgjmyX_P-SAQuUnHrNaH6_Rsqmw9fS5Y_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(83,'SENBOX.ORG/TEST-FORM-RESPONSE_1dOuEGJWvbn5v4M32uP4s4YpXez8CK9qIz9hDNWYILkg_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(83,'SENBOX.ORG/TEST-FORM-RESPONSE_1dOuEGJWvbn5v4M32uP4s4YpXez8CK9qIz9hDNWYILkg_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(119,'SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,1),
(119,'SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,1),
(119,'SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,1),
(119,'SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,1),
(119,'SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,1),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',20,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',21,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',22,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',23,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',24,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',25,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',26,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',27,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',28,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',29,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',30,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',31,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',32,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',33,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',34,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',35,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',36,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',37,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',38,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',39,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',40,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',41,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',42,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',44,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',45,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',47,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',48,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',49,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',50,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',51,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',52,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',54,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',55,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',56,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',57,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',58,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',59,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',60,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',61,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',62,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',63,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',64,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_63','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',65,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_64','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',66,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_65','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',67,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',68,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',69,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',70,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',71,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_70','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',72,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_71','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',73,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_72','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',74,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',75,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_74','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',76,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_75','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',77,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_76','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',78,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_77','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',79,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_78','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',80,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_79','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',81,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_80','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',82,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_81','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',83,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_82','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',84,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_83','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',85,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_84','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',86,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_85','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',87,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_86','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',88,0),
(120,'SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',20,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',21,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',22,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',23,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',24,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',25,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',26,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',27,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',28,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',29,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',30,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',32,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',33,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',34,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',35,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',36,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',37,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',38,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',39,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',40,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',41,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',42,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',44,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',45,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',46,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',47,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',48,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',49,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',50,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',51,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',52,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',53,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',54,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',55,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',56,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',57,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',58,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',59,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',60,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',61,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',62,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',63,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',64,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_63','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',65,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_64','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',66,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_65','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',67,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',68,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',69,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',70,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',71,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_70','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',72,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_71','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',73,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_72','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',74,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',75,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(121,'SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',20,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',21,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',22,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',24,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',25,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',26,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',28,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',29,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',30,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',32,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',34,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',35,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',36,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',37,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',38,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',39,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',40,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',41,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',42,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',44,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',45,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',46,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',47,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(122,'SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',20,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',22,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',23,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',24,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',25,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',26,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',27,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',28,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',29,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',30,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',31,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',32,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',33,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',34,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',35,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',37,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',38,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',39,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',40,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',41,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',42,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',44,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',45,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',46,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',47,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',48,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',49,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',50,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',53,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',54,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',55,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(123,'SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',38,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',39,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',40,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',41,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',44,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',45,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',46,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',47,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',49,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',50,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',51,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',52,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',53,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',55,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',56,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',57,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',58,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',59,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',60,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',61,0),
(124,'SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',62,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',20,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',21,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',22,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',23,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',24,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',25,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',26,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',27,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',28,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',29,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',30,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',31,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',32,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',33,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',34,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',35,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',36,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',37,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',38,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',39,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',40,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',41,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',42,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',44,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',45,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',46,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',47,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',48,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',52,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',53,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',54,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',55,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',56,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',57,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',61,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',62,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',63,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',64,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',68,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',69,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',70,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',71,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',75,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_74','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',76,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_75','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',77,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_79','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',81,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_80','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',82,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_81','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',83,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_82','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',84,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_83','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',85,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_84','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',86,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_85','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',87,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_86','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',88,0),
(125,'SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',21,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',22,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(126,'SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',20,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',21,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',22,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',23,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',24,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',25,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',26,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',27,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',28,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',29,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',30,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',31,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',32,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',33,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',34,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',35,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',36,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',37,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',38,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',39,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',40,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',41,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',42,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',43,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',44,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',45,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',46,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',47,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',48,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',49,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',50,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',51,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',52,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',53,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',54,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',55,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',56,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',57,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',58,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',59,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',60,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',61,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',62,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',63,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',64,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_63','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',65,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_64','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',66,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_65','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',67,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',68,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',69,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',70,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',71,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_70','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',72,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_71','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',73,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_72','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',74,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',75,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_74','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',76,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_75','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',77,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_76','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',78,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_77','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',79,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_78','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',80,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_79','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',81,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_80','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',82,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_81','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',83,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_82','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',84,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_83','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',85,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_84','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',86,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_85','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',87,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_86','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',88,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_87','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',89,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_88','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',90,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_89','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',91,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(127,'SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_90','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',92,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',23,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',29,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',34,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(128,'SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',12,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',14,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',16,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',17,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',18,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',19,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',20,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',24,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',30,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(129,'SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',11,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_11','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',13,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_13','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',15,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,0),
(139,'SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_8','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',10,0),
(141,'SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_1','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',3,1),
(141,'SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(141,'SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(141,'SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,1),
(141,'SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,1),
(141,'SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_6','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',8,1),
(141,'SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_7','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',9,1),
(144,'SENBOX.ORG/LANGUAGE-BUTTONS-SIGNUP_152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg_2','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',4,0),
(144,'SENBOX.ORG/LANGUAGE-BUTTONS-SIGNUP_152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg_3','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',5,0),
(144,'SENBOX.ORG/LANGUAGE-BUTTONS-SIGNUP_152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg_4','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',6,0),
(144,'SENBOX.ORG/LANGUAGE-BUTTONS-SIGNUP_152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg_5','CURRENT_TIMESTAMP','CURRENT_TIMESTAMP',7,0);
/*!40000 ALTER TABLE `s_form_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_mobile_device`
--

DROP TABLE IF EXISTS `s_mobile_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_mobile_device` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `device_id` varchar(36) NOT NULL,
  `type` varchar(16) NOT NULL,
  `fcm_token` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_s_mobile_device_device_id` (`device_id`),
  KEY `idx_s_mobile_device_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_mobile_device`
--

LOCK TABLES `s_mobile_device` WRITE;
/*!40000 ALTER TABLE `s_mobile_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_mobile_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_question`
--

DROP TABLE IF EXISTS `s_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_question` (
  `question_id` varchar(255) NOT NULL,
  `question_name` varchar(1000) NOT NULL DEFAULT '',
  `question_type` varchar(255) NOT NULL DEFAULT '1',
  `question` varchar(1000) NOT NULL DEFAULT '',
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}' CHECK (json_valid(`attributes`)),
  `status` bigint(20) NOT NULL DEFAULT 0,
  `set` varchar(255) NOT NULL DEFAULT '',
  `enable_on_mobile` varchar(16) NOT NULL DEFAULT 'enabled',
  `question_unique_id` longtext DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_question`
--

LOCK TABLES `s_question` WRITE;
/*!40000 ALTER TABLE `s_question` DISABLE KEYS */;
INSERT INTO `s_question` VALUES
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_11','Sign Up 9','preset_sign_up_button_9','Sign Up 9','{\"button_configurations\":[{\"color\":\"#86DEFF\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 9\"}]}',1,'#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 9','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_12','Sign Up 10','preset_sign_up_button_10','Sign Up 10','{\"button_configurations\":[{\"color\":\"#86DEFF\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 10\"}]}',1,'#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 10','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_2','🧒🏻 Add Child - Vietnamese 🇻🇳','preset_sign_up_button_1','🧒🏻 Add Child - Vietnamese 🇻🇳','{\"button_configurations\":[{\"color\":\"#CCC666\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 1\"}]}',1,'#CCC666;SENBOX.ORG/[SIGNUP]:Sign Up 1','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_3','Mr Huy Sign up form 2','preset_sign_up_button_2','Mr Huy Sign up form 2','{\"button_configurations\":[{\"color\":\"#A4D873\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 2\"}]}',1,'#A4D873;SENBOX.ORG/[SIGNUP]:Sign Up 2','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_4','Sign Up 3','preset_sign_up_button_3','Sign Up 3','{\"button_configurations\":[{\"color\":\"#86DEFF\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 3\"}]}',1,'#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 3','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_5','Sign Up 4','preset_sign_up_button_4','Sign Up 4','{\"button_configurations\":[{\"color\":\"#86DEFF\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 4\"}]}',1,'#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 4','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_6','Sign Up 5','preset_sign_up_button_5','Sign Up 5','{\"button_configurations\":[{\"color\":\"#86DEFF\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 5\"}]}',1,'#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 5','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_7','Sign Up 6','preset_sign_up_button_6','Sign Up 6','{\"button_configurations\":[{\"color\":\"#86DEFF\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 6\"}]}',1,'#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 6','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_8','Sign Up 7','preset_sign_up_button_7','Sign Up 7','{\"button_configurations\":[{\"color\":\"#86DEFF\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 7\"}]}',1,'#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 7','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP-BUTTON]:CONFIGURATION_14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk_9','Sign Up 8','preset_sign_up_button_8','Sign Up 8','{\"button_configurations\":[{\"color\":\"#86DEFF\",\"qr_code\":\"SENBOX.ORG/[SIGNUP]:Sign Up 8\"}]}',1,'#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 8','enabled',NULL,'2025-01-03 03:21:52.815','2025-01-03 03:21:52.815'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1fg261pnv4VZl3r8BdPutAHGJu2BXh2TouBsqbKmznlo_10','Password','preset_password','Password','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-20 08:47:54.959','2024-12-20 08:47:54.959'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1fg261pnv4VZl3r8BdPutAHGJu2BXh2TouBsqbKmznlo_11','What is your role?','preset_role','What is your role?','{\"options\":[{\"name\":\"Parent\"},{\"name\":\"Teacher\"},{\"name\":\"Docter\"},{\"name\":\"Nanny\"}]}',1,'Parent;Teacher;Docter;Nanny','enabled',NULL,'2024-12-20 08:47:54.959','2024-12-20 08:47:54.959'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1fg261pnv4VZl3r8BdPutAHGJu2BXh2TouBsqbKmznlo_12','I accept the user conditions','preset_condition_accept','I accept the user conditions','{\"options\":[{\"name\":\"Yes\"},{\"name\":\"No\"}]}',1,'Yes;No','enabled',NULL,'2024-12-20 08:47:54.959','2024-12-20 08:47:54.959'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1fg261pnv4VZl3r8BdPutAHGJu2BXh2TouBsqbKmznlo_8','Username','preset_value3','Username','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-20 08:47:54.959','2024-12-20 08:47:54.959'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1fg261pnv4VZl3r8BdPutAHGJu2BXh2TouBsqbKmznlo_9','Date of birth','preset_dob','Date of birth','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-20 08:47:54.959','2024-12-20 08:47:54.959'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','INTRODUCTION','button','INTRODUCTION','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/vbn-vbdnvdhn-jhchjfvdhnhcvjhmejm\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','6. Học sinh sẽ được quan sát trước khi được thiết lập Kế hoạch can thiệp cá nhân (IEP)','selection','6. Học sinh sẽ được quan sát trước khi được thiết lập Kế hoạch can thiệp cá nhân (IEP)','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','7. Phụ huynh nhận ra sự khác biệt của con khi nào?','text','7. Phụ huynh nhận ra sự khác biệt của con khi nào?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','8. Điều gì đang khiến phụ huynh lo lắng?','text','8. Điều gì đang khiến phụ huynh lo lắng?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','9. Phụ huynh đã từng được đào tạo về giáo dục đặc biệt chưa?','selection','9. Phụ huynh đã từng được đào tạo về giáo dục đặc biệt chưa?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','10. Phụ huynh giúp con như thế nào khi ở nhà?','text','10. Phụ huynh giúp con như thế nào khi ở nhà?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','11. Phụ huynh có thử tìm đến các dịch vụ hỗ trợ nào?','text','11. Phụ huynh có thử tìm đến các dịch vụ hỗ trợ nào?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','12. Mong muốn của phụ huynh (Quý vị sẽ có cơ hội thảo luận lại với nhà trường sau thời gian Quan sát)','text','12. Mong muốn của phụ huynh (Quý vị sẽ có cơ hội thảo luận lại với nhà trường sau thời gian Quan sát)','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','13. Phụ huynh đặt mục tiêu gì cho con?','text','13. Phụ huynh đặt mục tiêu gì cho con?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','📑 Các hồ sơ quan trọng về học sinh','section','📑 Các hồ sơ quan trọng về học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','14. Bản sao giấy khai sinh ','selection','14. Bản sao giấy khai sinh ','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','15. Bản sao hộ chiếu','selection','15. Bản sao hộ chiếu','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','16. Bản sao chẩn đoán của Bác sĩ (Nếu có)','selection','16. Bản sao chẩn đoán của Bác sĩ (Nếu có)','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','','text','','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','📝 Thông tin học sinh (Tất cả thông tin được ghi nhận là hoàn toàn bảo mật)','section','📝 Thông tin học sinh (Tất cả thông tin được ghi nhận là hoàn toàn bảo mật)','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','17. Họ tên của con là gì?','text','17. Họ tên của con là gì?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','18. Tên gọi khác của trẻ (Nếu có)','text','18. Tên gọi khác của trẻ (Nếu có)','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','19. Phụ huynh mong muốn giáo viên/ chuyên viên can thiệp sử dụng tên nào cho trẻ tại trường? (Tên này sẽ được sử dụng trong báo cáo và sử dụng trong quá trình can thiệp)\n* Khuyến khích sử dụng tên ngoài xã hội để tránh sự bối rối cho đứa trẻ sau này','text','19. Phụ huynh mong muốn giáo viên/ chuyên viên can thiệp sử dụng tên nào cho trẻ tại trường? (Tên này sẽ được sử dụng trong báo cáo và sử dụng trong quá trình can thiệp)\n* Khuyến khích sử dụng tên ngoài xã hội để tránh sự bối rối cho đứa trẻ sau này','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','20. Ngày, tháng, năm sinh của con','date','20. Ngày, tháng, năm sinh của con','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','21. Trẻ hiện đang sống cùng ai? (Ghi rõ địa chỉ nếu khác với địa chỉ của người nhập thông tin)','text','21. Trẻ hiện đang sống cùng ai? (Ghi rõ địa chỉ nếu khác với địa chỉ của người nhập thông tin)','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','22. Ai là người chăm sóc chính cho trẻ tại nhà và đưa đón đi học?','text','22. Ai là người chăm sóc chính cho trẻ tại nhà và đưa đón đi học?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','🧑‍🧑‍🧒 👩🏻🧑🏻 Thông tin của phụ huynh','section','🧑‍🧑‍🧒 👩🏻🧑🏻 Thông tin của phụ huynh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','23. Trẻ có anh chị em không?','selection','23. Trẻ có anh chị em không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','🏥 👨‍⚕️ Chẩn đoán / Dịch tễ học về học sinh','section','🏥 👨‍⚕️ Chẩn đoán / Dịch tễ học về học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','24. Trẻ có được đăng ký khám ở bệnh viện/ phòng khám nào chưa?','selection','24. Trẻ có được đăng ký khám ở bệnh viện/ phòng khám nào chưa?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','25. Tên của bệnh viện/ phòng khám','text','25. Tên của bệnh viện/ phòng khám','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','26. Trẻ đã được chẩn đoán chưa?','selection','26. Trẻ đã được chẩn đoán chưa?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','27. Chẩn đoán chính thức của bác sĩ / Chuyên gia về tình trạng của học sinh','text','27. Chẩn đoán chính thức của bác sĩ / Chuyên gia về tình trạng của học sinh','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','28. Tên của bác sĩ chẩn đoán','text','28. Tên của bác sĩ chẩn đoán','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','29. Số ca','text','29. Số ca','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','30. Thuốc / Thực phẩm chức năng','text','30. Thuốc / Thực phẩm chức năng','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','31. Tình trạng thể chất - Y tế hiện có','text','31. Tình trạng thể chất - Y tế hiện có','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','1. Họ và tên phụ huynh','text','1. Họ và tên phụ huynh','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','32. Tên và liều lượng của bất kì loại thuốc đang sử dụng','text','32. Tên và liều lượng của bất kì loại thuốc đang sử dụng','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','33. Ngày bắt đầu sử dụng ','date','33. Ngày bắt đầu sử dụng ','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','34. Ngày kết thúc sử dụng','date','34. Ngày kết thúc sử dụng','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','🏫 Lịch sử Học tập / Can thiệp','section','🏫 Lịch sử Học tập / Can thiệp','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','36. Tên trường học trước đây (ở tỉnh/ thành phố nào?)','text','36. Tên trường học trước đây (ở tỉnh/ thành phố nào?)','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','37. Phụ huynh có báo cáo/ tài liệu của trẻ tại các trường/trung tâm mà con đã theo học không?','selection','37. Phụ huynh có báo cáo/ tài liệu của trẻ tại các trường/trung tâm mà con đã theo học không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','38. Ngôn ngữ học tập','selection','38. Ngôn ngữ học tập','{\"options\":[{\"name\":\"Tiếng Việt / Vietnamese\"},{\"name\":\"Tiếng Anh/ English\"},{\"name\":\"Song ngữ/ Billingual\"},{\"name\":\"Tam ngữ/ Trilingual\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','39. Trẻ có thể nói được bao nhiêu từ trong bất kì ngôn ngữ nào?','text','39. Trẻ có thể nói được bao nhiêu từ trong bất kì ngôn ngữ nào?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','40. Trẻ có bất kì hành vi bất thường nào không?','selection','40. Trẻ có bất kì hành vi bất thường nào không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','2. Mối liên hệ với trẻ','text','2. Mối liên hệ với trẻ','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','41. Hành vi bất thường của trẻ là gì?','text','41. Hành vi bất thường của trẻ là gì?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','42. Trẻ có hành vi tự làm đau bản thân không? Hành vi đó là gì?','text','42. Trẻ có hành vi tự làm đau bản thân không? Hành vi đó là gì?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','43. Trẻ có hành vi làm đau người khác không? Hành vi đó là gì?','text','43. Trẻ có hành vi làm đau người khác không? Hành vi đó là gì?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','44. Trẻ khóc bao nhiêu lần một ngày?','text','44. Trẻ khóc bao nhiêu lần một ngày?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','45. Trẻ khóc trong bao lâu mỗi lần?','text','45. Trẻ khóc trong bao lâu mỗi lần?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','46. Trẻ khóc vì lý do cụ thể gì?','text','46. Trẻ khóc vì lý do cụ thể gì?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','🤧 🍽️ Thức ăn và Dị ứng','section','🤧 🍽️ Thức ăn và Dị ứng','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','','text','','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','47. Trẻ có đặc biệt không ăn món ăn nào không?','selection','47. Trẻ có đặc biệt không ăn món ăn nào không?','{\"options\":[{\"name\":\"Tiếng Việt / Vietnamese\"},{\"name\":\"Tiếng Anh/ English\"},{\"name\":\"Song ngữ/ Billingual\"},{\"name\":\"Tam ngữ/ Trilingual\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','3. Số điện thoại','selection','3. Số điện thoại','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','48. Trẻ ăn chay?','text','48. Trẻ ăn chay?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','49. Trẻ không được phép ăn những món ăn nào?','selection','49. Trẻ không được phép ăn những món ăn nào?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','❤️ Xu hướng cá nhân','text','❤️ Xu hướng cá nhân','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_63','50. Trẻ thích đồ chơi hay đồ vật nào?','selection','50. Trẻ thích đồ chơi hay đồ vật nào?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_64','51. Trẻ sợ điều gì?','text','51. Trẻ sợ điều gì?','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_65','📃 🧑🏻👩🏻 Đơn chấp thuận chia sẻ thông tin','section','📃 🧑🏻👩🏻 Đơn chấp thuận chia sẻ thông tin','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','Bằng văn bản này, tôi chấp thuận và đồng ý rằng SENBOX được phép chia sẻ những thông tin về con tôi với người khác:','message_box','Bằng văn bản này, tôi chấp thuận và đồng ý rằng SENBOX được phép chia sẻ những thông tin về con tôi với người khác:','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','52. Tên','text','52. Tên','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','53. Mối quan hệ với trẻ','text','53. Mối quan hệ với trẻ','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','54. Số điện thoại','text','54. Số điện thoại','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','4. Email','text','4. Email','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_70','55. Đưa đón đến trường','selection','55. Đưa đón đến trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_71','56. Liên lạc khẩn cấp','text','56. Liên lạc khẩn cấp','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_72','57. Gửi báo cáo','selection','57. Gửi báo cáo','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','58. Truy cập cổng thông tin Phụ huynh','selection','58. Truy cập cổng thông tin Phụ huynh','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_74','📋 Mẫu đơn chấp thuận và xác nhận của Phụ huynh','section','📋 Mẫu đơn chấp thuận và xác nhận của Phụ huynh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_75','Vui lòng chọn nếu phụ huynh chấp nhận cho nhà trường/ trung tâm thực hiện những điều khoản sau đây:','message_box','Vui lòng chọn nếu phụ huynh chấp nhận cho nhà trường/ trung tâm thực hiện những điều khoản sau đây:','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_76','59. Video / Hình ảnh sử dụng cho mạng xã hội','selection','59. Video / Hình ảnh sử dụng cho mạng xã hội','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_77','60. Hình ảnh sử dụng cho ấn phẩm của trường','selection','60. Hình ảnh sử dụng cho ấn phẩm của trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_78','61. Bơi / Chơi nước tại trường học','selection','61. Bơi / Chơi nước tại trường học','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_79','62. Di chuyển ra ngoài khuôn viên trường','selection','62. Di chuyển ra ngoài khuôn viên trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','5. Địa chỉ','text','5. Địa chỉ','{}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_80','63. Tắm rửa tại trường','selection','63. Tắm rửa tại trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_81','64. Cắt tóc','selection','64. Cắt tóc','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_82','65. Cắt móng tay, móng chân','selection','65. Cắt móng tay, móng chân','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_83','66. Sử dụng kem chống nắng','selection','66. Sử dụng kem chống nắng','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_84','67. Sử dụng kem chống muỗi','selection','67. Sử dụng kem chống muỗi','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_85','68. Thắt tóc, cột tóc ','selection','68. Thắt tóc, cột tóc ','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_86','69. Mặc quần áo của trường','selection','69. Mặc quần áo của trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:DEFAULT_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','💡Nhận thức của phụ huynh về tình trạng của trẻ','section','💡Nhận thức của phụ huynh về tình trạng của trẻ','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-02 08:44:06.435','2025-01-02 08:44:06.435'),
('SENBOX.ORG/[SIGNUP]:MENU_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','Sign up parent','button','Sign up parent','{\"value\": \"SENBOX.ORG/[SIGNUP]:Parent\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.499','2024-12-24 08:38:33.499'),
('SENBOX.ORG/[SIGNUP]:MENU_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','Sign up Staff','button','Sign up Staff','{\"value\": \"SENBOX.ORG/[SIGNUP]:Staff\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.499','2024-12-24 08:38:33.499'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','Username','preset_value3','Username','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:34.952','2025-01-13 02:11:34.952'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','Date of birth','preset_dob','Date of birth','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:34.952','2025-01-13 02:11:34.952'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','Password','preset_password','Password','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:34.952','2025-01-13 02:11:34.952'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','What is your role?','preset_role','What is your role?','{\"options\":[{\"name\":\"Parent\"},{\"name\":\"Teacher\"},{\"name\":\"Doctor\"},{\"name\":\"Nanny\"}]}',1,'Parent;Teacher;Doctor;Nanny','enabled',NULL,'2025-01-13 02:11:34.952','2025-01-13 02:11:34.952'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 0_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','I accept the user conditions','preset_condition_accept','I accept the user conditions','{\"options\":[{\"name\":\"Yes\"},{\"name\":\"No\"}]}',1,'Yes;No','enabled',NULL,'2025-01-13 02:11:34.952','2025-01-13 02:11:34.952'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','INTRODUCTION','button','INTRODUCTION','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/vbn-vbdnvdhn-jhchjfvdhnhcvjhmejm\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','6. Học sinh sẽ được quan sát trước khi được thiết lập Kế hoạch can thiệp cá nhân (IEP)','selection','6. Học sinh sẽ được quan sát trước khi được thiết lập Kế hoạch can thiệp cá nhân (IEP)','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','7. Phụ huynh nhận ra sự khác biệt của con khi nào?','text','7. Phụ huynh nhận ra sự khác biệt của con khi nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','8. Điều gì đang khiến phụ huynh lo lắng?','text','8. Điều gì đang khiến phụ huynh lo lắng?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','9. Phụ huynh đã từng được đào tạo về giáo dục đặc biệt chưa?','selection','9. Phụ huynh đã từng được đào tạo về giáo dục đặc biệt chưa?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','10. Phụ huynh giúp con như thế nào khi ở nhà?','text','10. Phụ huynh giúp con như thế nào khi ở nhà?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','11. Phụ huynh có thử tìm đến các dịch vụ hỗ trợ nào?','text','11. Phụ huynh có thử tìm đến các dịch vụ hỗ trợ nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','12. Mong muốn của phụ huynh (Quý vị sẽ có cơ hội thảo luận lại với nhà trường sau thời gian Quan sát)','text','12. Mong muốn của phụ huynh (Quý vị sẽ có cơ hội thảo luận lại với nhà trường sau thời gian Quan sát)','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','13. Phụ huynh đặt mục tiêu gì cho con?','text','13. Phụ huynh đặt mục tiêu gì cho con?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','📑 Các hồ sơ quan trọng về học sinh','section','📑 Các hồ sơ quan trọng về học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','14. Bản sao giấy khai sinh ','selection','14. Bản sao giấy khai sinh ','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','15. Bản sao hộ chiếu','selection','15. Bản sao hộ chiếu','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','16. Bản sao chẩn đoán của Bác sĩ (Nếu có)','selection','16. Bản sao chẩn đoán của Bác sĩ (Nếu có)','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','📝 Thông tin học sinh (Tất cả thông tin được ghi nhận là hoàn toàn bảo mật)','section','📝 Thông tin học sinh (Tất cả thông tin được ghi nhận là hoàn toàn bảo mật)','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','17. Họ tên của con là gì?','text','17. Họ tên của con là gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','18. Tên gọi khác của trẻ (Nếu có)','text','18. Tên gọi khác của trẻ (Nếu có)','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','19. Phụ huynh mong muốn giáo viên/ chuyên viên can thiệp sử dụng tên nào cho trẻ tại trường? (Tên này sẽ được sử dụng trong báo cáo và sử dụng trong quá trình can thiệp)\n* Khuyến khích sử dụng tên ngoài xã hội để tránh sự bối rối cho đứa trẻ sau này','text','19. Phụ huynh mong muốn giáo viên/ chuyên viên can thiệp sử dụng tên nào cho trẻ tại trường? (Tên này sẽ được sử dụng trong báo cáo và sử dụng trong quá trình can thiệp)\n* Khuyến khích sử dụng tên ngoài xã hội để tránh sự bối rối cho đứa trẻ sau này','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','20. Ngày, tháng, năm sinh của con','date','20. Ngày, tháng, năm sinh của con','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','21. Trẻ hiện đang sống cùng ai? (Ghi rõ địa chỉ nếu khác với địa chỉ của người nhập thông tin)','text','21. Trẻ hiện đang sống cùng ai? (Ghi rõ địa chỉ nếu khác với địa chỉ của người nhập thông tin)','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','22. Ai là người chăm sóc chính cho trẻ tại nhà và đưa đón đi học?','text','22. Ai là người chăm sóc chính cho trẻ tại nhà và đưa đón đi học?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','🧑‍🧑‍🧒 👩🏻🧑🏻 Thông tin của phụ huynh','section','🧑‍🧑‍🧒 👩🏻🧑🏻 Thông tin của phụ huynh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','23. Trẻ có anh chị em không?','selection','23. Trẻ có anh chị em không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','🏥 👨‍⚕️ Chẩn đoán / Dịch tễ học về học sinh','section','🏥 👨‍⚕️ Chẩn đoán / Dịch tễ học về học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','24. Trẻ có được đăng ký khám ở bệnh viện/ phòng khám nào chưa?','selection','24. Trẻ có được đăng ký khám ở bệnh viện/ phòng khám nào chưa?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','25. Tên của bệnh viện/ phòng khám','text','25. Tên của bệnh viện/ phòng khám','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','26. Trẻ đã được chẩn đoán chưa?','selection','26. Trẻ đã được chẩn đoán chưa?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','27. Chẩn đoán chính thức của bác sĩ / Chuyên gia về tình trạng của học sinh','text','27. Chẩn đoán chính thức của bác sĩ / Chuyên gia về tình trạng của học sinh','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','28. Tên của bác sĩ chẩn đoán','text','28. Tên của bác sĩ chẩn đoán','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','29. Số ca','text','29. Số ca','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','30. Thuốc / Thực phẩm chức năng','text','30. Thuốc / Thực phẩm chức năng','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','31. Tình trạng thể chất - Y tế hiện có','text','31. Tình trạng thể chất - Y tế hiện có','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','1. Họ và tên phụ huynh','text','1. Họ và tên phụ huynh','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','32. Tên và liều lượng của bất kì loại thuốc đang sử dụng','text','32. Tên và liều lượng của bất kì loại thuốc đang sử dụng','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','33. Ngày bắt đầu sử dụng ','date','33. Ngày bắt đầu sử dụng ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','34. Ngày kết thúc sử dụng','date','34. Ngày kết thúc sử dụng','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','🏫 Lịch sử Học tập / Can thiệp','section','🏫 Lịch sử Học tập / Can thiệp','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','36. Tên trường học trước đây (ở tỉnh/ thành phố nào?)','text','36. Tên trường học trước đây (ở tỉnh/ thành phố nào?)','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','37. Phụ huynh có báo cáo/ tài liệu của trẻ tại các trường/trung tâm mà con đã theo học không?','selection','37. Phụ huynh có báo cáo/ tài liệu của trẻ tại các trường/trung tâm mà con đã theo học không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','38. Ngôn ngữ học tập','selection','38. Ngôn ngữ học tập','{\"options\":[{\"name\":\"Tiếng Việt / Vietnamese\"},{\"name\":\"Tiếng Anh/ English\"},{\"name\":\"Song ngữ/ Billingual\"},{\"name\":\"Tam ngữ/ Trilingual\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','39. Trẻ có thể nói được bao nhiêu từ trong bất kì ngôn ngữ nào?','text','39. Trẻ có thể nói được bao nhiêu từ trong bất kì ngôn ngữ nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','40. Trẻ có bất kì hành vi bất thường nào không?','selection','40. Trẻ có bất kì hành vi bất thường nào không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','2. Mối liên hệ với trẻ','text','2. Mối liên hệ với trẻ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','41. Hành vi bất thường của trẻ là gì?','text','41. Hành vi bất thường của trẻ là gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','42. Trẻ có hành vi tự làm đau bản thân không? Hành vi đó là gì?','text','42. Trẻ có hành vi tự làm đau bản thân không? Hành vi đó là gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','43. Trẻ có hành vi làm đau người khác không? Hành vi đó là gì?','text','43. Trẻ có hành vi làm đau người khác không? Hành vi đó là gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','44. Trẻ khóc bao nhiêu lần một ngày?','text','44. Trẻ khóc bao nhiêu lần một ngày?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','45. Trẻ khóc trong bao lâu mỗi lần?','text','45. Trẻ khóc trong bao lâu mỗi lần?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','46. Trẻ khóc vì lý do cụ thể gì?','text','46. Trẻ khóc vì lý do cụ thể gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','🤧 🍽️ Thức ăn và Dị ứng','section','🤧 🍽️ Thức ăn và Dị ứng','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','47. Trẻ có đặc biệt không ăn món ăn nào không?','selection','47. Trẻ có đặc biệt không ăn món ăn nào không?','{\"options\":[{\"name\":\"Tiếng Việt / Vietnamese\"},{\"name\":\"Tiếng Anh/ English\"},{\"name\":\"Song ngữ/ Billingual\"},{\"name\":\"Tam ngữ/ Trilingual\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','3. Số điện thoại','selection','3. Số điện thoại','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','48. Trẻ ăn chay?','text','48. Trẻ ăn chay?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','49. Trẻ không được phép ăn những món ăn nào?','selection','49. Trẻ không được phép ăn những món ăn nào?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','❤️ Xu hướng cá nhân','text','❤️ Xu hướng cá nhân','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_63','50. Trẻ thích đồ chơi hay đồ vật nào?','selection','50. Trẻ thích đồ chơi hay đồ vật nào?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_64','51. Trẻ sợ điều gì?','text','51. Trẻ sợ điều gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_65','📃 🧑🏻👩🏻 Đơn chấp thuận chia sẻ thông tin','section','📃 🧑🏻👩🏻 Đơn chấp thuận chia sẻ thông tin','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','Bằng văn bản này, tôi chấp thuận và đồng ý rằng SENBOX được phép chia sẻ những thông tin về con tôi với người khác:','message_box','Bằng văn bản này, tôi chấp thuận và đồng ý rằng SENBOX được phép chia sẻ những thông tin về con tôi với người khác:','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','52. Tên','text','52. Tên','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','53. Mối quan hệ với trẻ','text','53. Mối quan hệ với trẻ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','54. Số điện thoại','text','54. Số điện thoại','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','4. Email','text','4. Email','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_70','55. Đưa đón đến trường','selection','55. Đưa đón đến trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_71','56. Liên lạc khẩn cấp','text','56. Liên lạc khẩn cấp','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_72','57. Gửi báo cáo','selection','57. Gửi báo cáo','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','58. Truy cập cổng thông tin Phụ huynh','selection','58. Truy cập cổng thông tin Phụ huynh','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_74','📋 Mẫu đơn chấp thuận và xác nhận của Phụ huynh','section','📋 Mẫu đơn chấp thuận và xác nhận của Phụ huynh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_75','Vui lòng chọn nếu phụ huynh chấp nhận cho nhà trường/ trung tâm thực hiện những điều khoản sau đây:','message_box','Vui lòng chọn nếu phụ huynh chấp nhận cho nhà trường/ trung tâm thực hiện những điều khoản sau đây:','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_76','59. Video / Hình ảnh sử dụng cho mạng xã hội','selection','59. Video / Hình ảnh sử dụng cho mạng xã hội','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_77','60. Hình ảnh sử dụng cho ấn phẩm của trường','selection','60. Hình ảnh sử dụng cho ấn phẩm của trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_78','61. Bơi / Chơi nước tại trường học','selection','61. Bơi / Chơi nước tại trường học','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_79','62. Di chuyển ra ngoài khuôn viên trường','selection','62. Di chuyển ra ngoài khuôn viên trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','5. Địa chỉ','text','5. Địa chỉ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_80','63. Tắm rửa tại trường','selection','63. Tắm rửa tại trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_81','64. Cắt tóc','selection','64. Cắt tóc','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_82','65. Cắt móng tay, móng chân','selection','65. Cắt móng tay, móng chân','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_83','66. Sử dụng kem chống nắng','selection','66. Sử dụng kem chống nắng','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_84','67. Sử dụng kem chống muỗi','selection','67. Sử dụng kem chống muỗi','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_85','68. Thắt tóc, cột tóc ','selection','68. Thắt tóc, cột tóc ','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_86','69. Mặc quần áo của trường','selection','69. Mặc quần áo của trường','{\"options\":[{\"name\":\"Agree/ Đồng ý\"},{\"name\":\"Do not agree/ Không đồng ý\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 1_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','💡Nhận thức của phụ huynh về tình trạng của trẻ','section','💡Nhận thức của phụ huynh về tình trạng của trẻ','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.481','2025-01-13 02:11:35.481'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','SBT 01','text','SBT 01','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','Thời gian học SBT 01 (Phút)','duration_forward','Thời gian học SBT 01 (Phút)','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','Quét mã QR của SBT 01','qr_code','Quét mã QR của SBT 01','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','SBT 02','text','SBT 02','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','Thời gian học SBT 02 (Phút)','duration_forward','Thời gian học SBT 02 (Phút)','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','Quét mã QR của SBT 02','qr_code','Quét mã QR của SBT 02','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','SBT 03','text','SBT 03','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','Thời gian học SBT 03 (Phút)','duration_forward','Thời gian học SBT 03 (Phút)','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','Quét mã QR của SBT 03','qr_code','Quét mã QR của SBT 03','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','ℹ️ Introduction','button','ℹ️ Introduction','{\"value\": \"#86DEFF;\"}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','Mô tả tên nếu không có Mã','text','Mô tả tên nếu không có Mã','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','Mức độ hỗ trợ','button_count','Mức độ hỗ trợ','{\"value\": \"EN.D (Nguy hiểm - Dừng hoạt động);Ex.p (Trải nghiệm);HOH (Cầm tay);PP (Hỗ trợ một phần cánh tay);GP (Nhắc bằng cử chỉ);VP (Nhắc bằng lời);VISP (Nhắc bằng hình ảnh trực quan);COM (Mệnh lệnh - nói với học sinh thực hiện nhiệm vụ);CLU (Gợi ý - đặt câu hỏi);I (Independently - Tự lập)\"}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','Thời gian học (phút)','duration_forward','Thời gian học (phút)','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','Ở vị trí nào? (ghi tên địa điểm thực hiện bài học)','text','Ở vị trí nào? (ghi tên địa điểm thực hiện bài học)','{}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 10_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','Chọn khu vực học','selection','Chọn khu vực học','{\"options\":[{\"name\":\"Work Station 1 (Bàn học 1)\"},{\"name\":\"Work Station 2 (Bàn học 2)\"},{\"name\":\"Work Station 3 (Bàn học 3) \"},{\"name\":\"Work Station 4 (Bàn học 4)\"},{\"name\":\"Work Station 5 (Bàn học 5)\"},{\"name\":\"Work Station 6 (Bàn học 6)\"},{\"name\":\"Station 7\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:40.363','2025-01-13 02:11:40.363'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','GIỚI THIỆU','button','GIỚI THIỆU','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/vbn-vbdnvdhn-jhchjfvdhnhcvjhmejm\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','8. Địa chỉ','text','8. Địa chỉ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','9. Cấp lớp','text','9. Cấp lớp','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','🧑‍🧑‍🧒 Thông tin về người giám hộ','section','🧑‍🧑‍🧒 Thông tin về người giám hộ','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','10. Tên cha','text','10. Tên cha','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','11. Quốc tịch','text','11. Quốc tịch','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','12. Số điện thoại','text','12. Số điện thoại','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','13. Email','text','13. Email','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','👶 Thông tin cá nhân của học sinh','section','👶 Thông tin cá nhân của học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','14. Tên mẹ','text','14. Tên mẹ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','15. Quốc tịch','text','15. Quốc tịch','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','16. Số điện thoại','text','16. Số điện thoại','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','17. Email','text','17. Email','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','18. Tên người bảo hộ ngoài cha mẹ hoặc liên hệ khẩn cấp','text','18. Tên người bảo hộ ngoài cha mẹ hoặc liên hệ khẩn cấp','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','19. Số điện thoại','text','19. Số điện thoại','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','20. Mối quan hệ với học sinh','section','20. Mối quan hệ với học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','1. Tên Học sinh','text','1. Tên Học sinh','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','😷 Dịch tễ học của học sinh','section','😷 Dịch tễ học của học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','21. Học sinh có bất kỳ bệnh lý cơ thể nào không? ','text','21. Học sinh có bất kỳ bệnh lý cơ thể nào không? ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','22. Học sinh có gặp vấn đề gì về khuyết tật thể chất không?','text','22. Học sinh có gặp vấn đề gì về khuyết tật thể chất không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','23. Học sinh bị dị ứng với thứ gì?','text','23. Học sinh bị dị ứng với thứ gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','24. Chẩn đoán (về tâm lý thần kinh) là gì?','text','24. Chẩn đoán (về tâm lý thần kinh) là gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','25. Tên Bác sĩ','text','25. Tên Bác sĩ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','26. Bệnh Viện/ Trung tâm Y khoa (thuộc tỉnh, thành phố nào)','text','26. Bệnh Viện/ Trung tâm Y khoa (thuộc tỉnh, thành phố nào)','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','27. Trẻ có nhận được báo cáo y tế sau chẩn đoán có chữ ký của bác sĩ không?','selection','27. Trẻ có nhận được báo cáo y tế sau chẩn đoán có chữ ký của bác sĩ không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','28. Trẻ có đang sử dụng thuốc gì không?','text','28. Trẻ có đang sử dụng thuốc gì không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','29. Trẻ có đang sử dụng thực phẩm chức năng nào không?','text','29. Trẻ có đang sử dụng thực phẩm chức năng nào không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','2. Tên gọi ở nhà','text','2. Tên gọi ở nhà','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','🗒️ Thông tin cần lưu ý về học sinh','section','🗒️ Thông tin cần lưu ý về học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','30. Ai là người chăm sóc chính cho trẻ trong gia đình?','text','30. Ai là người chăm sóc chính cho trẻ trong gia đình?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','31. Ai là người giáo dục trẻ trong gia đình?','text','31. Ai là người giáo dục trẻ trong gia đình?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','32. Học sinh có được can thiệp trước đây chưa? ','text','32. Học sinh có được can thiệp trước đây chưa? ','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','33. Thông tin về trường học trước đây','text','33. Thông tin về trường học trước đây','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','3. Ngày sinh','date','3. Ngày sinh','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','34. Học sinh thích điều gì?','text','34. Học sinh thích điều gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','35. Học sinh không thích điều gì?','text','35. Học sinh không thích điều gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','36. Học sinh sợ điều gì?','text','36. Học sinh sợ điều gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','37. Điều gì có thể là động lực cho học sinh?','text','37. Điều gì có thể là động lực cho học sinh?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','38. Học sinh có thói quen gì?','text','38. Học sinh có thói quen gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','4. Giới tính','text','4. Giới tính','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','39. Học sinh có hành vi gì?','text','39. Học sinh có hành vi gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','40. Yếu tố kích hoạt (Hành vi) [Điều gì làm cho học sinh có hành vi hoặc thể hiện các sự khó chịu?]','text','40. Yếu tố kích hoạt (Hành vi) [Điều gì làm cho học sinh có hành vi hoặc thể hiện các sự khó chịu?]','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_63','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_64','41. Giao tiếp (Học sinh giao tiếp như thế nào?)','text','41. Giao tiếp (Học sinh giao tiếp như thế nào?)','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_65','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','42. Học sinh nói được bao nhiêu ngôn ngữ','selection','42. Học sinh nói được bao nhiêu ngôn ngữ','{\"options\":[{\"name\":\"Tiếng Việt / Vietnamese\"},{\"name\":\"Tiếng Anh/ English\"},{\"name\":\"Song ngữ/ Billingual\"},{\"name\":\"Tam ngữ/ Trilingual\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','43. Học sinh ăn - uống như thế nào?','text','43. Học sinh ăn - uống như thế nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','5. Quốc tịch','text','5. Quốc tịch','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_70','44. Vệ sinh của học sinh như thế nào?','text','44. Vệ sinh của học sinh như thế nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_71','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_72','45. Quan trọng (Các thông tin cần lưu ý)','text','45. Quan trọng (Các thông tin cần lưu ý)','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','6. Dân tộc','selection','6. Dân tộc','{\"options\":[{\"name\":\"Dân tộc Kinh (Việt) / Kinh (Vietnamese) ethnic group\"},{\"name\":\"Ethnic minorities of Vietnam/ Dân tộc thiểu số Việt Nam\"},{\"name\":\"Foreigner/ Người ngoại quốc\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 2_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','7. Ngôn ngữ sử dụng ở nhà','text','7. Ngôn ngữ sử dụng ở nhà','{}',1,'','enabled',NULL,'2025-01-13 02:11:35.996','2025-01-13 02:11:35.996'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','INTRODUCTION','button','INTRODUCTION','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/vbn-vbdnvdhn-jhchjfvdhnhcvjhmejm\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','7. Số điện thoại','text','7. Số điện thoại','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','8. Giáo viên có CV không?','selection','8. Giáo viên có CV không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','9. Giấy khám sức khoẻ','selection','9. Giấy khám sức khoẻ','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13',' 🚨 ☎️ Liên lạc khẩn cấp','section',' 🚨 ☎️ Liên lạc khẩn cấp','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','10. Tên','text','10. Tên','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','11. Số điện thoại','text','11. Số điện thoại','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','12. Mối quan hệ','text','12. Mối quan hệ','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','👩‍🎓 Các loại bằng cấp, chứng chỉ','section','👩‍🎓 Các loại bằng cấp, chứng chỉ','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','13. Tên bằng cấp / chứng chỉ phát triển chuyên môn 1','text','13. Tên bằng cấp / chứng chỉ phát triển chuyên môn 1','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','14. Năm hoàn thành ','text','14. Năm hoàn thành ','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','16. Tên bằng cấp / chứng chỉ phát triển chuyên môn 2','text','16. Tên bằng cấp / chứng chỉ phát triển chuyên môn 2','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','17. Năm hoàn thành ','text','17. Năm hoàn thành ','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','19. Tên bằng cấp / chứng chỉ phát triển chuyên môn 3','text','19. Tên bằng cấp / chứng chỉ phát triển chuyên môn 3','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','20. Năm hoàn thành ','text','20. Năm hoàn thành ','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','👩🏻‍🏫 Thông tin giáo viên','section','👩🏻‍🏫 Thông tin giáo viên','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','👩🏻‍🏫 Mô tả kinh nghiệm làm việc của bạn ','section','👩🏻‍🏫 Mô tả kinh nghiệm làm việc của bạn ','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','22. Vị trí','text','22. Vị trí','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','23. Số năm kinh nghiệm','text','23. Số năm kinh nghiệm','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','24. Bạn tự tin với các kỹ năng nào?','text','24. Bạn tự tin với các kỹ năng nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','25. Giáo viên đang làm việc/ cộng tác với các trường nào?','text','25. Giáo viên đang làm việc/ cộng tác với các trường nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','26. Giáo viên đang dạy các cấp lớp nào?','text','26. Giáo viên đang dạy các cấp lớp nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','27. Bạn có biết cách sử dụng các ứng dụng trong công nghệ thông tin như Zoom, Google meet, Zalo,... không?','text','27. Bạn có biết cách sử dụng các ứng dụng trong công nghệ thông tin như Zoom, Google meet, Zalo,... không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','1. Tên giáo viên','text','1. Tên giáo viên','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','🍎 Các nguyện vọng','section','🍎 Các nguyện vọng','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','28. Bạn có nguyện vọng học thêm các kiến thức cụ thể gì?','text','28. Bạn có nguyện vọng học thêm các kiến thức cụ thể gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','29. Bạn có mong muốn phát triển thêm kỹ năng cụ thể nào?','text','29. Bạn có mong muốn phát triển thêm kỹ năng cụ thể nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','30. Trong bao lâu?','text','30. Trong bao lâu?','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','2. Giới tính','text','2. Giới tính','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','3. CCCD/ ID','text','3. CCCD/ ID','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','4. Ngày sinh','text','4. Ngày sinh','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','5. Email','text','5. Email','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 3_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','6. Địa chỉ','text','6. Địa chỉ','{}',1,'','enabled',NULL,'2025-01-13 02:11:36.592','2025-01-13 02:11:36.592'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','🏫 Thông tin về Cơ sở Giáo dục','section','🏫 Thông tin về Cơ sở Giáo dục','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','9. Dịch vụ bạn đang cung cấp là gì?','text','9. Dịch vụ bạn đang cung cấp là gì?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','10. Số lượng nhân viên','text','10. Số lượng nhân viên','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','11. Trường/ Trung tâm của bạn là tư nhân hay công lập?','selection','11. Trường/ Trung tâm của bạn là tư nhân hay công lập?','{\"options\":[{\"name\":\"Private School/ Center - Trường Tư\"},{\"name\":\"State school / Trường công lập\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','12. Trường học/ trung tâm của bạn có thuộc về bất kỳ tổ chức nào không?','text','12. Trường học/ trung tâm của bạn có thuộc về bất kỳ tổ chức nào không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','13. Bạn có bất kỳ học sinh có nhu cầu đặc biệt nào trong trường/ trung tâm của mình không?','text','13. Bạn có bất kỳ học sinh có nhu cầu đặc biệt nào trong trường/ trung tâm của mình không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','14. Bạn có hệ thống hỗ trợ về giáo dục đặc biệt nào khác ngoài Senbox Framework không?','text','14. Bạn có hệ thống hỗ trợ về giáo dục đặc biệt nào khác ngoài Senbox Framework không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','15. Nếu có, hệ thống này là do trung tâm/ trường bạn tự xây dựng hay cộng tác với bên nào khác?','text','15. Nếu có, hệ thống này là do trung tâm/ trường bạn tự xây dựng hay cộng tác với bên nào khác?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','1. Tên Trường/ Trung tâm','text','1. Tên Trường/ Trung tâm','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','📓 Nền tảng kiến thức về Giáo dục đặc biệt','section','📓 Nền tảng kiến thức về Giáo dục đặc biệt','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','16. Bạn/ Nhân viên của bạn có từng tham gia khoá đào tạo nào trước đó về giáo dục đặc biệt không? ','selection','16. Bạn/ Nhân viên của bạn có từng tham gia khoá đào tạo nào trước đó về giáo dục đặc biệt không? ','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','17. Tên khoá học 1','text','17. Tên khoá học 1','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','18. Tên của tổ chức đào tạo','text','18. Tên của tổ chức đào tạo','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','19. Thời lượng và năm hoàn thành','text','19. Thời lượng và năm hoàn thành','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','20. Tên khoá học 2','text','20. Tên khoá học 2','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','21. Tên của tổ chức đào tạo','text','21. Tên của tổ chức đào tạo','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','22. Thời lượng và năm hoàn thành','text','22. Thời lượng và năm hoàn thành','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','23. Khoá học khác ','text','23. Khoá học khác ','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','2. Địa chỉ','text','2. Địa chỉ','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','24. Bạn có biết/ nghe về EBP (Bằng chứng dựa trên thực hành) không? ','selection','24. Bạn có biết/ nghe về EBP (Bằng chứng dựa trên thực hành) không? ','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','25. Mức độ hiểu biết về EBP của bạn/ nhân viên của bạn như thế nào?','selection','25. Mức độ hiểu biết về EBP của bạn/ nhân viên của bạn như thế nào?','{\"options\":[{\"name\":\"Heard about the name only/ Chỉ nghe về tên\"},{\"name\":\"Knowing the definitions/ Biết về các khái niệm\"},{\"name\":\"Have been applying to the intervention/ Đang ứng dụng vào can thiệp \"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','🤝 Thông tin về Sự cộng tác','section','🤝 Thông tin về Sự cộng tác','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','26. Nếu có sự hợp tác đa ngành trong hỗ trợ giáo dục đặc biệt cho trường/trung tâm của bạn, thì phạm vi tài chính của bạn sẽ là bao nhiêu?','text','26. Nếu có sự hợp tác đa ngành trong hỗ trợ giáo dục đặc biệt cho trường/trung tâm của bạn, thì phạm vi tài chính của bạn sẽ là bao nhiêu?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','27. Với mức chi phí này, bạn mong muốn hoàn thiện toàn bộ hệ thống hay đây là mức giá khởi đầu cho việc thiết lập? ','text','27. Với mức chi phí này, bạn mong muốn hoàn thiện toàn bộ hệ thống hay đây là mức giá khởi đầu cho việc thiết lập? ','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','28. Mục tiêu bạn hướng tới là gì khi hợp tác với chúng tôi?','text','28. Mục tiêu bạn hướng tới là gì khi hợp tác với chúng tôi?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','3. Số điện thoại','text','3. Số điện thoại','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','29.  Bạn mong muốn đạt được mục tiêu trong nhanh nhất là bao lâu?','text','29.  Bạn mong muốn đạt được mục tiêu trong nhanh nhất là bao lâu?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','30.  Bạn cho rằng trình độ của trung tâm/ trường học của bạn đang ở mức nào theo tiêu chuẩn quốc tế?','selection','30.  Bạn cho rằng trình độ của trung tâm/ trường học của bạn đang ở mức nào theo tiêu chuẩn quốc tế?','{\"options\":[{\"name\":\"Under 30% / Dưới 30%\"},{\"name\":\"Approximately 50%/ Xấp xỉ 50%\"},{\"name\":\"Around 70% / Khoảng 70%\"},{\"name\":\"80% - 90%\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','31. Ngoài SBF (Khung chương trình Senbox), bạn có đang cộng tác với bất kỳ tổ chức nào về lĩnh vực giáo dục đặc biệt không? ','text','31. Ngoài SBF (Khung chương trình Senbox), bạn có đang cộng tác với bất kỳ tổ chức nào về lĩnh vực giáo dục đặc biệt không? ','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','32. Ngoài SBF (Khung chương trình Senbox), bạn đang ký hợp đồng với tổ chức nào khác về dịch vụ hỗ trợ giáo dục đặc biệt ? ','text','32. Ngoài SBF (Khung chương trình Senbox), bạn đang ký hợp đồng với tổ chức nào khác về dịch vụ hỗ trợ giáo dục đặc biệt ? ','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','33. Bạn có dự định xây dựng hệ thống của riêng mình về mảng giáo dục đặc biệt trong tương lai không?','text','33. Bạn có dự định xây dựng hệ thống của riêng mình về mảng giáo dục đặc biệt trong tương lai không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','34. Về mức phí phải trả khi có sự hợp tác giữa hai bên, bạn muốn thanh toán như thế nào?','selection','34. Về mức phí phải trả khi có sự hợp tác giữa hai bên, bạn muốn thanh toán như thế nào?','{\"options\":[{\"name\":\"Pay per student who received the service/ Trả phí theo từng học sinh nhận được dịch vụ\"},{\"name\":\"Pay the fixed amount every month/ Trả phí cố định theo tháng\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','Phản hồi từ đội ngũ SB','message_box','Phản hồi từ đội ngũ SB','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','4. Email','text','4. Email','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','Locations','button','Locations','{\"value\": \"#86DEFF;SENBOX.ORG/[MEMORY-FORM]: Teachers\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','Teachers','button','Teachers','{\"value\": \"#86DEFF;SENBOX.ORG/[MEMORY-FORM]: Locations\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','Sen-co','button','Sen-co','{\"value\": \"#86DEFF;SENBOX.ORG/[MEMORY-FORM]: Sen-co\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','5. Tên Hiệu trưởng/ Giám đốc','text','5. Tên Hiệu trưởng/ Giám đốc','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','6. Vị trí của bạn là gì? ','selection','6. Vị trí của bạn là gì? ','{\"options\":[{\"name\":\"CEO / Giám đốc\"},{\"name\":\"Head Master/ Hiệu trường\"},{\"name\":\"Deputy/ Hiệu phó\"},{\"name\":\"Teacher/ Giáo viên\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 4_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','8. Số lượng học sinh','text','8. Số lượng học sinh','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.202','2025-01-13 02:11:37.202'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','INTRODUCTION','button','INTRODUCTION','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/vbn-vbdnvdhn-jhchjfvdhnhcvjhmejm\"}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','Name of interviewer','text','Name of interviewer','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','What time is it right now? ','text','What time is it right now? ','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','How did you hear about SENBOX?','selection','How did you hear about SENBOX?','{\"options\":[{\"name\":\"Social Media (Facebook,...)\"},{\"name\":\"Search Engine (Google,...)\"},{\"name\":\"Referral\"},{\"name\":\"Word of mouth\"},{\"name\":\"Other\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','-> ENG or VN -> Can you understand the questions?','selection','-> ENG or VN -> Can you understand the questions?','{\"options\":[{\"name\":\"Yes, I will continue in English\"},{\"name\":\"Không, hỏi tôi bằng tiếng Việt/ Not sure, ask me in Vietnamese\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','Have you answered all the questions in English?','selection','Have you answered all the questions in English?','{\"options\":[{\"name\":\"Yes, I\'m ok in English (You have completed the interview test -\\u003e Go to submit)\"},{\"name\":\"Không, tôi chưa trả lời hết các câu hỏi. Tôi muốn trả lời bằng tiếng Việt bây giờ (No, I did not answer all of the questions yet. I want to answer in Vietnamese now)\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','Writing (VN)\nWrite a paragraph following the instructions and questions below.\nMô tả công việc gần đây / Explain your last position\nBạn đã hỗ trợ đồng nghiệp như thế nào? / How did you help the others?\nTrách nhiệm trước đây của bạn là gì? / What were your responsibilities?\nBạn mong muốn phát triển thêm những kỹ năng gì? / What skills would you like to develop more?\nBạn có thể bắt đầu làm việc sớm nhất là khi nào? / How soon can you start working?\nBạn nghĩ mình sẽ làm việc tại SENBOX trong bao lâu? / How long do you think you will be at SENBOX?','text','Writing (VN)\nWrite a paragraph following the instructions and questions below.\nMô tả công việc gần đây / Explain your last position\nBạn đã hỗ trợ đồng nghiệp như thế nào? / How did you help the others?\nTrách nhiệm trước đây của bạn là gì? / What were your responsibilities?\nBạn mong muốn phát triển thêm những kỹ năng gì? / What skills would you like to develop more?\nBạn có thể bắt đầu làm việc sớm nhất là khi nào? / How soon can you start working?\nBạn nghĩ mình sẽ làm việc tại SENBOX trong bao lâu? / How long do you think you will be at SENBOX?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','Write your full name','text','Write your full name','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','Kể tên 5 hành vi thường gặp của học sinh / Name 5 common behaviours of students :','text','Kể tên 5 hành vi thường gặp của học sinh / Name 5 common behaviours of students :','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','Kể tên 5 hoạt động mà học sinh thường làm trong lớp học. / Name 5 activities that students usually do in class :','text','Kể tên 5 hoạt động mà học sinh thường làm trong lớp học. / Name 5 activities that students usually do in class :','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','I.E.P là viết tắt của từ gì? / What does I.E.P stand for?','text','I.E.P là viết tắt của từ gì? / What does I.E.P stand for?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','Thực hành dựa trên bằng chừng (Evidence Based Practices) là gì? / What is Evidence Based Practices?','text','Thực hành dựa trên bằng chừng (Evidence Based Practices) là gì? / What is Evidence Based Practices?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','Can thiệp toàn diện là gì? Theo bạn can thiệp toàn diện có cần thiết không ? / What is Full-time intervention? and is it necessary in your opinion?','text','Can thiệp toàn diện là gì? Theo bạn can thiệp toàn diện có cần thiết không ? / What is Full-time intervention? and is it necessary in your opinion?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','1. Có học sinh đang đi vào trường, tôi thấy giáo viên đang ngồi nhưng không chú ý. / As student comes into the classroom, and you see a teacher sitting with a tablet but not paying attention. ','selection','1. Có học sinh đang đi vào trường, tôi thấy giáo viên đang ngồi nhưng không chú ý. / As student comes into the classroom, and you see a teacher sitting with a tablet but not paying attention. ','{\"options\":[{\"name\":\"A: Tôi sẽ đến và giúp trẻ đó. / I’ll go and help the child.\"},{\"name\":\"B:  Tôi sẽ gọi ai đó đến giúp. / I’ll call someone for help.\"},{\"name\":\"C: Tôi sẽ làm ngơ trẻ đó. / I’ll ignore the child.\"},{\"name\":\"A\\u0026B. Tôi sẽ đến giúp đứa trẻ và gọi ai đó giúp đỡ / I\'ll go to help the child and call someone for help\"},{\"name\":\"B\\u0026C. Tôi sẽ gọi ai đó đến giúp và làm ngơ đưa trẻ /  I\'ll call someone for help and ignore the child\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','2. Học sinh không chịu lắng nghe tôi. / The student is not listening to me.','selection','2. Học sinh không chịu lắng nghe tôi. / The student is not listening to me.','{\"options\":[{\"name\":\"A: Tôi sẽ nói lại lần nữa. / I’ll speak again.\"},{\"name\":\"B: Tôi sẽ sử dụng hình ảnh trực quan (visual). / I’ll use visual.\"},{\"name\":\"C:  Tôi sẽ hét lên với trẻ. / I’ll yell at him.\"},{\"name\":\"A\\u0026B. Tôi sẽ nói lại lần nữa và sử dụng hình ảnh /  I\'ll speak again and use the visual\"},{\"name\":\"A\\u0026C. Tôi sẽ nói lại và lớn tiếng với học sinh/ I\'ll speak again and yell at him\"},{\"name\":\"B\\u0026C. Tôi sẽ sử dụng hình ảnh và lớn tiếng với học sinh/ I\'ll use the visual and yell at him\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','3. Khi một học sinh lười biếng: / A student is lazy:','selection','3. Khi một học sinh lười biếng: / A student is lazy:','{\"options\":[{\"name\":\"A: Tôi sẽ đưa đồ chơi cho học sinh. / I’ll give him a toy.\"},{\"name\":\"B: Tôi sẽ thay đổi nhiệm vụ khác cho học sinh. / I’ll change the task for him.\"},{\"name\":\"C:  Tôi sẽ báo người giám sát. / I’ll inform my supervisor.\"},{\"name\":\"A\\u0026B. Tôi sẽ đưa đồ chơi cho học sinh và thay đổi nhiệm vụ cho học sinh/ I\'ll give him a toy and change the task for him\"},{\"name\":\"A\\u0026C. Tôi sẽ đưa đồ chơi cho học sinh và báo cho người dám sát/ I\'ll give him a toy and inform my supervisor\"},{\"name\":\"B\\u0026C. Tôi sẽ thay đổi nhiệm vụ cho học sinh và báo cho giám sát / I\'ll change the task for him and inform my supervisor\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','What is your Date of Birth','text','What is your Date of Birth','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','4. Một người bạn hỏi tôi vài điều thú vị trong công việc của tôi. / A friend asks me for some interesting things from work.','selection','4. Một người bạn hỏi tôi vài điều thú vị trong công việc của tôi. / A friend asks me for some interesting things from work.','{\"options\":[{\"name\":\"A: Tôi sẽ cho bạn đó biết vài ý chung chung. / I’ll give him a general idea.\"},{\"name\":\"B: Tôi sẽ hỏi ý kiến cho phép chia sẻ thông tin. / I’ll ask for permission and quote sources.\"},{\"name\":\"C: Tôi sẽ chụp vài tấm hình và giải thích chi tiết cho bạn tôi. / I’ll take some pictures and explain them with detail.\"},{\"name\":\"A\\u0026B. Tôi sẽ hỏi ý kiến cho phép chia sẻ thông tin và cho bạn đó biết vài ý chung chung/ I\'ll ask for permission and quote sources, then give him the general idea\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','5. Tôi nghĩ học sinh cần một chiến lược mới. / I think a student needs a new strategy.','selection','5. Tôi nghĩ học sinh cần một chiến lược mới. / I think a student needs a new strategy.','{\"options\":[{\"name\":\"A: Tôi sẽ tìm trên google những chiến lược mới. / I’ll google new strategies.\"},{\"name\":\"B: Tôi sẽ nghĩ ra chiến lược mới. / I’ll think of a new strategy.\"},{\"name\":\"C: Tôi sẽ hỏi người giám sát trước. / I’ll ask supervisor for his input first.\"},{\"name\":\"A\\u0026B. Tôi sẽ tìm trên google và nghĩ ra chiến lược mới / I\'ll google and think of a new strategy\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','Tại sao bạn chọn SENBOX? / Why did choose SENBOX?','text','Tại sao bạn chọn SENBOX? / Why did choose SENBOX?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','Tại sao bạn muốn làm việc trong ngành Giáo dục đặc biệt? / Why would you like to work in Special Education?','text','Tại sao bạn muốn làm việc trong ngành Giáo dục đặc biệt? / Why would you like to work in Special Education?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','Bạn mong chờ/hy vọng gì trong công việc này? / What do you expect / hope from this job?','text','Bạn mong chờ/hy vọng gì trong công việc này? / What do you expect / hope from this job?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','Bạn muốn làm gì trong 5 năm tới? / What would you like to be doing in 5 years ?','text','Bạn muốn làm gì trong 5 năm tới? / What would you like to be doing in 5 years ?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','Bạn muốn cải thiện điều gì cho bản thân? / What type of personal development would you like to do?','text','Bạn muốn cải thiện điều gì cho bản thân? / What type of personal development would you like to do?','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','Bạn thường làm gì khi rảnh rỗi? (What do you do in your free time ?)','text','Bạn thường làm gì khi rảnh rỗi? (What do you do in your free time ?)','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','Viết những gì bạn quan sát được về bức hình này dựa trên kiến thưc về Giáo dục đặc biệt / Write an observation for the given picture, with your professional opinion','text','Viết những gì bạn quan sát được về bức hình này dựa trên kiến thưc về Giáo dục đặc biệt / Write an observation for the given picture, with your professional opinion','{}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 5_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','Bạn biết đến Senbox qua đâu? / How did you know about Senbox?','selection','Bạn biết đến Senbox qua đâu? / How did you know about Senbox?','{\"options\":[{\"name\":\"Mạng xã hội (Facebook,...)\"},{\"name\":\"Công cụ tìm kiếm (Google,...)\"},{\"name\":\"Được giới thiệu\"},{\"name\":\"Truyền miệng\"},{\"name\":\"Khác\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:37.644','2025-01-13 02:11:37.644'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','INTRODUCTION','button','INTRODUCTION','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/vbn-vbdnvdhn-jhchjfvdhnhcvjhmejm\"}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','🏃🏻 Hành vi','section','🏃🏻 Hành vi','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','7. Sự tham gia thấp (Trì hoãn tham gia hoạt động)','text','7. Sự tham gia thấp (Trì hoãn tham gia hoạt động)','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','8. Hành vi tự làm hại bản thân (cắn, đánh vào đầu/ cơ thể, Cào, đập đầu vào tường/ xuống nền nhà)','text','8. Hành vi tự làm hại bản thân (cắn, đánh vào đầu/ cơ thể, Cào, đập đầu vào tường/ xuống nền nhà)','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','9. Tấn công người khác (Cắn, đánh, cào, chụp, đá, nhéo)','text','9. Tấn công người khác (Cắn, đánh, cào, chụp, đá, nhéo)','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','10. Khóc','text','10. Khóc','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','11. Cơn giận dữ','text','11. Cơn giận dữ','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','🧑‍💻Thông tin chung ','text','🧑‍💻Thông tin chung ','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','1. Tên giáo viên','text','1. Tên giáo viên','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','2. Tên Học sinh','text','2. Tên Học sinh','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','3. Tuổi học sinh','section','3. Tuổi học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','🧻 Kỹ năng sống','text','🧻 Kỹ năng sống','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','40. Ăn','text','40. Ăn','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','41. Uống nước','text','41. Uống nước','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','42. Vệ sinh: N1, N2, Đánh răng, Rửa tay, thay đồ','text','42. Vệ sinh: N1, N2, Đánh răng, Rửa tay, thay đồ','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','43. Cởi giày và mang giày','text','43. Cởi giày và mang giày','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','44. Dọn dẹp','text','44. Dọn dẹp','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','🇻🇳 🏴󠁧󠁢󠁥󠁮󠁧󠁿 Ngôn ngữ và Giao tiếp','text','🇻🇳 🏴󠁧󠁢󠁥󠁮󠁧󠁿 Ngôn ngữ và Giao tiếp','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','📚 Học thuật','text','📚 Học thuật','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','45. Chậm nói','text','45. Chậm nói','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','46. Nói ngọng','text','46. Nói ngọng','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','47. Ngôn ngữ không chức năng','text','47. Ngôn ngữ không chức năng','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','👯 Tương tác xã hội','text','👯 Tương tác xã hội','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','48. Giao tiếp mắt kém','text','48. Giao tiếp mắt kém','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','49. Chờ đến lượt','text','49. Chờ đến lượt','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','50. Chơi với bạn','text','50. Chơi với bạn','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','4. Cấp độ bài học SBT có phù hợp với học sinh không?','text','4. Cấp độ bài học SBT có phù hợp với học sinh không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','⛹🏼‍♂️Cơ thể và chuyển động','text','⛹🏼‍♂️Cơ thể và chuyển động','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_74','51. Vận động thô','text','51. Vận động thô','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_75','52. Vận động tinh','text','52. Vận động tinh','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_79','🙇‍♀️ Suy nghĩ, Tập trung, Làm theo hướng dẫn','text','🙇‍♀️ Suy nghĩ, Tập trung, Làm theo hướng dẫn','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','5. Học sinh có cần được hỗ trợ thêm không? Và hỗ trợ như thế nào?','text','5. Học sinh có cần được hỗ trợ thêm không? Và hỗ trợ như thế nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_80','53. Học sinh giải quyết vấn đề như thế nào?','text','53. Học sinh giải quyết vấn đề như thế nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_81','54. Học sinh có nhận ra giáo viên của mình không?','text','54. Học sinh có nhận ra giáo viên của mình không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_82','55. Học sinh có chú ý hoặc phản hồi khi có ai đó gọi tên của mình không?','text','55. Học sinh có chú ý hoặc phản hồi khi có ai đó gọi tên của mình không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_83','56. Học sinh có phân biệt được người lạ và người quen không?','text','56. Học sinh có phân biệt được người lạ và người quen không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_84','57. Học sinh có nhờ/ yêu cầu sự giúp đỡ khi cần không?','text','57. Học sinh có nhờ/ yêu cầu sự giúp đỡ khi cần không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_85','58. Thời gian tập trung của học sinh là bao lâu?','text','58. Thời gian tập trung của học sinh là bao lâu?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_86','59. Học sinh có làm theo được thông báo hoặc hướng dẫn của giáo viên không? Thể hiện như thế nào?','text','59. Học sinh có làm theo được thông báo hoặc hướng dẫn của giáo viên không? Thể hiện như thế nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 6_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','6. Học sinh có gặp khó khăn gì về các kỹ năng học thuật: Vẽ, viết, đọc, Toán (Số), nhận biết hình dạng và màu sắc không?','text','6. Học sinh có gặp khó khăn gì về các kỹ năng học thuật: Vẽ, viết, đọc, Toán (Số), nhận biết hình dạng và màu sắc không?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.128','2025-01-13 02:11:38.128'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','','button','','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/vbn-vbdnvdhn-jhchjfvdhnhcvjhmejm\"}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','15. Biết về các EBP nào?','text','15. Biết về các EBP nào?','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','Tên Giáo viên','text','Tên Giáo viên','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','16. Có áp dụng EBP vào can thiệp không?','selection','16. Có áp dụng EBP vào can thiệp không?','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','👭 Kỹ năng làm việc nhóm','section','👭 Kỹ năng làm việc nhóm','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','1. Sẵn sàng hỗ trợ trong khả năng khi người đồng nghiệp cần giúp đỡ? ','text','1. Sẵn sàng hỗ trợ trong khả năng khi người đồng nghiệp cần giúp đỡ? ','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','2. Yêu cầu sự giúp đỡ khi bạn không gảii quyết được hành vi của học sinh hoặc khi bạn cảm thấy căng thẳng','text','2. Yêu cầu sự giúp đỡ khi bạn không gảii quyết được hành vi của học sinh hoặc khi bạn cảm thấy căng thẳng','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','3. Giao tiếp để có được nhũng thứ bạn cần khi can thiệp hành vi cho học sinh','photo','3. Giao tiếp để có được nhũng thứ bạn cần khi can thiệp hành vi cho học sinh','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','4. Phản hồi lại những thiếu vấn đề mà bạn nhận thấy cho bản Quản lý','text','4. Phản hồi lại những thiếu vấn đề mà bạn nhận thấy cho bản Quản lý','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','5. Báo cáo về học sinh của mình cho cố vẫn chuyên môn hàng ngày','text','5. Báo cáo về học sinh của mình cho cố vẫn chuyên môn hàng ngày','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 7_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','6. Khả năng trình bày về một ca với đầy đủ chi tiết và thông tin','text','6. Khả năng trình bày về một ca với đầy đủ chi tiết và thông tin','{}',1,'','enabled',NULL,'2025-01-13 02:11:38.632','2025-01-13 02:11:38.632'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','INTRODUCTION','button','INTRODUCTION','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/vbn-vbdnvdhn-jhchjfvdhnhcvjhmejm\"}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','Bạn nhận thấy học sinh của mình có khó khăn gì?/ What difficulties do you find your students have? ','text','Bạn nhận thấy học sinh của mình có khó khăn gì?/ What difficulties do you find your students have? ','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','Has the student been diagnosed?','text','Has the student been diagnosed?','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','Teacher\'s concern?','text','Teacher\'s concern?','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','Have you made the IEP for your student?','text','Have you made the IEP for your student?','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','','number','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_18','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_19','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_20','','number','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_22','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_23','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_24','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_25','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_26','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_28','','date','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_29','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_30','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_31','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_33','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_34','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_35','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_36','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_37','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_38','','selection','','{\"options\":[{\"name\":\"Not yet / Chưa\"},{\"name\":\"Đã kiểm tra tại bệnh viện trong khoảng 1 giờ/ Yes, at the hospital for approximately one hour.\"},{\"name\":\"Đã kiểm tra với chuyên gia trong 1 ngày hoặc hơn / Yes, by the expert for one day or more.\"},{\"name\":\"Đã tham vấn chuyên gia tâm lý học với một bài thẩm định đầy đủ (3-5 ngày kiểm tra)/Have consulted with a psychologist with a comprehensive assessment (3-5 days of testing).\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_39','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_4','Tên giáo viên / Teacher\'s name','text','Tên giáo viên / Teacher\'s name','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_40','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_41','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_42','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_43','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_44','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_45','','date','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_46','','date','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_47','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_48','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_49','','selection','','{\"options\":[{\"name\":\"Tiếng Việt / Vietnamese\"},{\"name\":\"Tiếng Anh/ English\"},{\"name\":\"Song ngữ/ Billingual\"},{\"name\":\"Tam ngữ/ Trilingual\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','Giới tính của giáo viên/ Teacher\'s gender','text','Giới tính của giáo viên/ Teacher\'s gender','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_50','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_51','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_52','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_53','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_54','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_55','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_56','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_57','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_58','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_59','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','Thông tin liên hệ (Email và số điện thoại)/ Your contact (Email and phone number)','text','Thông tin liên hệ (Email và số điện thoại)/ Your contact (Email and phone number)','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_60','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_61','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_62','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_63','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"},{\"name\":\"UNDETERMINED/ KHÔNG XÁC ĐỊNH\"},{\"name\":\"NOT YET/ CHƯA THẤY\"},{\"name\":\"DO NOT KNOW / KHÔNG BIẾT\"},{\"name\":\"NOT ENOUGH / KHÔNG ĐỦ\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_64','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_65','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_66','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_67','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_68','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_69','','message_box','','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','Học sinh của bạn bao nhiêu tuổi?/ How old is your student?','text','Học sinh của bạn bao nhiêu tuổi?/ How old is your student?','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_70','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_71','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_72','','number','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_73','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_74','','number','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_75','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_76','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_77','','text','','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_78','','message_box','','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_79','','message_box','','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','Giới tính của học sinh/ Student\'s gender','text','Giới tính của học sinh/ Student\'s gender','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_80','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_81','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_82','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_83','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_84','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_85','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_86','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_87','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_88','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_89','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','Bạn đã dạy học sinh này bao lâu rồi?/ How long have you been teaching the student?','text','Bạn đã dạy học sinh này bao lâu rồi?/ How long have you been teaching the student?','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 8_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_90','','selection','','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.053','2025-01-13 02:11:39.053'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_1','ℹ️ Introduction','button','ℹ️ Introduction','{\"value\": \"#86DEFF;\"}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','Thời gian chơi đồ chơi 1 (phút)','duration_forward','Thời gian chơi đồ chơi 1 (phút)','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','Quét mã QR đồ chơi','qr_code','Quét mã QR đồ chơi','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','Đồ chơi 02','text','Đồ chơi 02','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_13','Thời gian chơi đồ chơi 2 (phút)','duration_forward','Thời gian chơi đồ chơi 2 (phút)','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','Quét mã QR đồ chơi','qr_code','Quét mã QR đồ chơi','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','Đồ chơi 03','text','Đồ chơi 03','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','Thời gian chơi đồ chơi 3 (phút)','duration_forward','Thời gian chơi đồ chơi 3 (phút)','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_17','Quét mã QR đồ chơi','qr_code','Quét mã QR đồ chơi','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','Thời gian chơi (phút)','duration_forward','Thời gian chơi (phút)','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_21','Mô tả tên nếu không có Mã ','text','Mô tả tên nếu không có Mã ','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_27','Mức độ hỗ trợ','button_count','Mức độ hỗ trợ','{\"value\": \"EN.D (Nguy hiểm - Dừng hoạt động);Ex.p (Trải nghiệm);HOH (Cầm tay);PP (Hỗ trợ một phần cánh tay);GP (Nhắc bằng cử chỉ);VP (Nhắc bằng lời);VISP (Nhắc bằng hình ảnh trực quan);COM (Mệnh lệnh - nói với học sinh thực hiện nhiệm vụ);CLU (Gợi ý - đặt câu hỏi);I (Independently - Tự lập)\"}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_32','Hành vi','form_section','Hành vi','{\"value\": \"SENBOX.ORG/SBT-[SBFS-0915]\"}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','Ở vị trí nào?','selection','Ở vị trí nào?','{\"options\":[{\"name\":\"Classroom G\"},{\"name\":\"Classroom 1.1\"},{\"name\":\"Classroom 1.1 ABA Room\"},{\"name\":\"Classroom 1.2\"},{\"name\":\"Classroom 1.3\"},{\"name\":\"Classroom 1.4\"},{\"name\":\"Classroom 1.5\"},{\"name\":\"Classroom 2.0 Indoor Play\"},{\"name\":\"Classroom 2.1 Sand\"},{\"name\":\"Classroom 2.1 Physio\"},{\"name\":\"Classroom 2.2\"},{\"name\":\"Classroom 2.3\"},{\"name\":\"Classroom 2.4\"},{\"name\":\"Classroom 2.5 (Art Room)\"},{\"name\":\"Classroom 2.6\"},{\"name\":\"Classroom 2.7\"},{\"name\":\"Classroom 3.0 (Art Studio)\"},{\"name\":\"Classroom 3.1\"},{\"name\":\"Classroom 3.2\"},{\"name\":\"Classroom 3.3\"},{\"name\":\"Classroom 3.4\"},{\"name\":\"Classroom 3.5\"},{\"name\":\"Classroom 3.6\"},{\"name\":\"Lifeskill Kitchen\"},{\"name\":\"Food - Kitchen\"},{\"name\":\"Kitchen Toilet\"},{\"name\":\"Swing Area\"},{\"name\":\"Library First Floor (Building 1)\"},{\"name\":\"Library 2.6 (Building 2)\"},{\"name\":\"Sensory Room\"},{\"name\":\"Sensory Dome\"},{\"name\":\"Pool\"},{\"name\":\"Basket Ball area\"},{\"name\":\"Playground Basement\"},{\"name\":\"Front Gate\"},{\"name\":\"Water Play Area\"},{\"name\":\"Green Area\"}]}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:SIGN UP 9_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','Đồ chơi 01','text','Đồ chơi 01','{}',1,'','enabled',NULL,'2025-01-13 02:11:39.651','2025-01-13 02:11:39.651'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_10','Term and Policy','button','Term and Policy','{\"value\": \"https://sites.google.com/senbox.org/senboxtac/senbox-terms-conditions\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_11','Here by I agreed to all the term and policy','signature','Here by I agreed to all the term and policy','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_12','Survey','section','Survey','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_14','D.O.B','date','D.O.B','{}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_15','Age','number','Age','{}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_16','Gender','choice_toggle','Gender','{\"options\":[{\"name\":\"BOY\"},{\"name\":\" GIRL\"}]}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_2','Wellcome to SENBOX app - test','message_box','Wellcome to SENBOX app - test','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_3','Sign up - test','section','Sign up - test','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_5','SENBOX','preset_value1','SENBOX','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_6','Your name','preset_value3','Your name','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_7','School name','preset_value2','School name','{\"value\": \"\"}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_8','Email','text','Email','{}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/[SIGNUP]:STAFF_1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ_9','Phone number','text','Phone number','{}',1,'','enabled',NULL,'2024-12-24 08:38:33.040','2024-12-24 08:38:33.040'),
('SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_1','Infor','button','Infor','{\"value\": \"#86DEFF;null\"}',1,'','enabled',NULL,'2025-01-03 04:35:51.874','2025-01-03 04:35:51.874'),
('SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_2','Name','text','Name','{}',1,'','enabled',NULL,'2025-01-03 04:35:51.874','2025-01-03 04:35:51.874'),
('SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_3','Item Name','selection','Item Name','{\"options\":[{\"name\":\"item a\"},{\"name\":\"item b\"},{\"name\":\"item c\"},{\"name\":\"item d\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:51.874','2025-01-03 04:35:51.874'),
('SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_4','Location','selection','Location','{\"options\":[{\"name\":\"Shelf 1\"},{\"name\":\"Shelf 2\"},{\"name\":\"Shelf 3\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:51.874','2025-01-03 04:35:51.874'),
('SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_5','???','text','???','{}',1,'','enabled',NULL,'2025-01-03 04:35:51.874','2025-01-03 04:35:51.874'),
('SENBOX.ORG/{SEARCH}:SEARCHLOCTEST_1sQonIyW16A2e10lkB8gZ4YRjFbw_fj0_TcC_gfBIPf0_6','Section','section','Section','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-03 04:35:51.874','2025-01-03 04:35:51.874'),
('SENBOX.ORG/LANGUAGE-BUTTONS-SIGNUP_152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg_2','ℹ️ Introduction','button','ℹ️ Introduction','{\"value\": \";\"}',1,'','enabled',NULL,'2025-01-11 02:54:26.073','2025-01-11 02:54:26.073'),
('SENBOX.ORG/LANGUAGE-BUTTONS-SIGNUP_152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg_3','English','button','English','{\"value\": \"#86DEFF;SENBOX.ORG/[SIGNUP]:Sign Up 0\"}',1,'','enabled',NULL,'2025-01-11 02:54:26.073','2025-01-11 02:54:26.073'),
('SENBOX.ORG/LANGUAGE-BUTTONS-SIGNUP_152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg_4','Vietnamese','button','Vietnamese','{\"value\": \";\"}',1,'','enabled',NULL,'2025-01-11 02:54:26.073','2025-01-11 02:54:26.073'),
('SENBOX.ORG/LANGUAGE-BUTTONS-SIGNUP_152d2ZEG8BPu-JFnINOehvr2ARrcOMTbNnr_uzCIa8Zg_5','German','button','German','{\"value\": \";\"}',1,'','enabled',NULL,'2025-01-11 02:54:26.073','2025-01-11 02:54:26.073'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_','📲 Software Updates (NEW)','button','📲 Software Updates (NEW)','{\"value\": \"#86DEFF;SENBOX.ORG/Menu/Button List - Top Left Menu - School\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_1','Emergency','section','Emergency','{\"value\": \"https://static.vecteezy.com/system/resources/thumbnails/024/553/853/small_2x/colorful-eagle-head-logo-pop-art-style-eagle-face-sticker-pastel-cute-colors-ai-generated-png.png\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_11','🧑‍💻📰 Wiki:SEN by SENBOX 🛜','button','🧑‍💻📰 Wiki:SEN by SENBOX 🛜','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/start-here\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_12','📱How to use the SENBOX App','button','📱How to use the SENBOX App','{\"value\": \"#86DEFF;http://STAFF.SENBOX.ORG/app\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_13','💬 Send Feedback to manager','button','💬 Send Feedback to manager','{\"value\": \"#86DEFF;SENBOX.ORG/Feedback for manager\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_14','📰 News - 👨‍👩‍👦 Parents & 👨‍👩‍👦 Teachers','button','📰 News - 👨‍👩‍👦 Parents & 👨‍👩‍👦 Teachers','{\"value\": \"#86DEFF;https://www.senbox.vn/newspt\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_15','📌 Roster & Time table','button','📌 Roster & Time table','{\"value\": \"#86DEFF;https://sites.google.com/d/1uJagZA6OWgBDz52YhnNxvJogSRonC1ym/p/1py7hM6h9NnQEqA61A_tQClumCsh4YpLT/edit\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_16','📆 SENBOX Calendar','button','📆 SENBOX Calendar','{\"value\": \"#86DEFF;https://drive.google.com/file/d/13fB8vGA90Vo1uuTS4YFVbgScIRwQ-sgf/view?usp=sharing\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_17','✅ TODO','button','✅ TODO','{\"value\": \"#000000;SENBOX.ORG/[TODO]:GENERAL\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_18','⚙️ SETTINGS','button','⚙️ SETTINGS','{\"value\": \"#86DEFF;SENBOX.ORG/[SETTINGS]\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_19','💰 Parent fund donation','button','💰 Parent fund donation','{\"value\": \"#86DEFF;[SHOW]:https://docs.google.com/spreadsheets/d/e/2PACX-1vSl8YZsB_WQ0RuGg_bOxCQnHfiex4KguRgKXZO-eapoy-tHhG23VAJRJagE9EjwlkdmYWkPPaXIpGSq/pubhtml?gid=1598208274&single=true\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_2','🆘 Emergency 🆘  Send Email 🆘','button','🆘 Emergency 🆘  Send Email 🆘','{\"value\": \"#EE220C;SENBOX.ORG/[SEND-EMAIL]:From Device;https://static.vecteezy.com/system/resources/thumbnails/024/553/853/small_2x/colorful-eagle-head-logo-pop-art-style-eagle-face-sticker-pastel-cute-colors-ai-generated-png.png\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_21','✅ Task Availability Status','button','✅ Task Availability Status','{\"value\": \"#CCC666;https://www.senbox.vn/tas\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_22','👀 I saw','button','👀 I saw','{\"value\": \"#86DEFF;SENBOX.ORG/TeacherKPI-MyWish\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_23','📍 Location Quality Check','button','📍 Location Quality Check','{\"value\": \"#86DEFF;SENBOX.ORG/QualityCheck\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_24','↔️ Landscape mode','button','↔️ Landscape mode','{\"value\": \"#CCC666;SENBOX.ORG/[Side-view]\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_25','📋 New Roster','button','📋 New Roster','{\"value\": \"#86DEFF;https://www.senbox.vn/rosterview\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_26','🤳 Scan SBT-📍 Location- 🤸‍♀️ Skills','button','🤳 Scan SBT-📍 Location- 🤸‍♀️ Skills','{\"value\": \"#86DEFF;SENBOX.ORG/SBTSkill\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_27','🍽 Lunch duty','button','🍽 Lunch duty','{\"value\": \"#86DEFF;https://docs.google.com/spreadsheets/d/e/2PACX-1vT9gZUx7aw1vqG_cqzB4tciIlQgrnKBj9Nh6_rIXpK4qhxPtQzPCxsMqf_Z2Hudf10Z3PomIAcqOsXp/pubhtml?gid=315123415&single=true\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_28','🌗 Today Login','button','🌗 Today Login','{\"value\": \"#86DEFF;https://docs.google.com/spreadsheets/d/e/2PACX-1vQVBtnLnQyk9eOgRULuzCdAU8RPKuGyMcy0Dg_3iNw4hSfE67zlL29lXF4e7lWmxC5R31FiiS--nRM6/pubhtml?gid=2053197104&single=true\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_29','💁‍♂️👍 Staff Food Quality','button','💁‍♂️👍 Staff Food Quality','{\"value\": \"#A4D873;SENBOX.ORG/Staff_Food_Form\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_3','SECTION','section','SECTION','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_30','🖇️ Ordering Class Room Items','button','🖇️ Ordering Class Room Items','{\"value\": \"#86DEFF;SENBOX.ORG/ORDERING FORM\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_32','TEst Graph','web','TEst Graph','{\"value\": \"aHR0cHM6Ly9zZW5ib3gtZnJvbnRlbmQudmVyY2VsLmFwcC9wdWJsaWMtcGFnZXMvY2hhcnQ/Y2hhcnRUeXBlPWxpbmU7NTAw\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_34','searchtest','button','searchtest','{\"value\": \"#16B100;SENBOX.ORG/Search Test\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_35','Search Inventory Item','button','Search Inventory Item','{\"value\": \"#16B100;SENBOX.ORG/{Search}:SearchLocTest\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_4','🖥  Scaner test','button','🖥  Scaner test','{\"value\": \"#FFA400;SENBOX.ORG/[SCANNER];https://img.freepik.com/free-vector/bird-colorful-gradient-design-vector_343694-2506.jpg\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_42','🧑‍🏫 ----- Menu: Mr Mueller -----🧑‍🏫','section','🧑‍🏫 ----- Menu: Mr Mueller -----🧑‍🏫','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_46','MODE W TEST','button','MODE W TEST','{\"value\": \"#CCC666;SENBOX.ORG/[MODE_W]:[SHOW]https://senbox-frontend.vercel.app/public-pages/question-form\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_47','✅ SENBOX Atendance app','button','✅ SENBOX Atendance app','{\"value\": \"#A4D873;https://www.appsheet.com/start/09ca2407-3fac-40a1-be36-3a94e679e6fe\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_48','📃 Test form','button','📃 Test form','{\"value\": \"#86DEFF;SENBOX.ORG/TestForm\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_49','📲 Test Notification','button','📲 Test Notification','{\"value\": \"#FFA400;SENBOX.ORG/[SEND-NOTIFICATION][TOP-BUTTON-7ddd9e15007ee7f6;][Message-Today is Monday]\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_5','🚑  Accident and Injury Report (Tr&St)','button','🚑  Accident and Injury Report (Tr&St)','{\"value\": \"#f86c6c;SENBOX.ORG/SBT-[SBFS-2159];https://img.freepik.com/free-vector/colorful-letter-gradient-logo-design_474888-2309.jpg\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_50','📔 Photo album test','button','📔 Photo album test','{\"value\": \"#A4D873;SENBOX.ORG/[BROWSE_PHOTOS]:AHBscLy6ShwGxisFO4k0G_iK33nC7jcRI_A7HiXU5A3O9eLDozz9pcJyP7qMBPdoAaMyiU__aDh4\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_51','📥 Update sign up form test','button','📥 Update sign up form test','{\"value\": \"#CC5AF6;SENBOX.ORG/[SIGN-UP][UPDATE]\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_52','📱✅ Mueller mobile Todo','button','📱✅ Mueller mobile Todo','{\"value\": \"#000000;SENBOX.ORG/[TODO-MOBILE]:MUELLER TODO\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_53','📱✅  Huy mobile Todo','button','📱✅  Huy mobile Todo','{\"value\": \"#000000;SENBOX.ORG/[TODO-MOBILE]:HUY\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_54','📔 Photo album test (apptest email)','button','📔 Photo album test (apptest email)','{\"value\": \"#CCC666;SENBOX.ORG/[BROWSE_PHOTOS]:AKH64584HoUYDJP_IH1iQjMeYt2dYaCu65Nsj0Yax2ifXoWbMHQCajOjHFDmwxnzPYlIOgYyRJpS\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_55','📈 Alcot graph','button','📈 Alcot graph','{\"value\": \"#86DEFF;SENBOX.ORG/ST Alcot\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_57','----- Menu: Mr Trung Cao -----','section','----- Menu: Mr Trung Cao -----','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_58','Search Results','button','Search Results','{\"value\": \"#EE220C;SENBOX.ORG/Trung-Test\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_6','😤  Student BEHAVIOUR','button','😤  Student BEHAVIOUR','{\"value\": \"#f86c6c;SENBOX.ORG/SBT-[SBFS-0915];https://img.freepik.com/premium-vector/free-vector-beautiful-flying-hummingbird-design-element-banners-posters-leaflets-brochur_1009653-1.jpg\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_7','📱----- General -----📱','section','📱----- General -----📱','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_8','⏰ Count/Timer','button','⏰ Count/Timer','{\"value\": \"#000000;SENBOX.ORG/Timer\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/MENU_17wrGEajw-0Cr06umA9alA4SwT41vuem1_53kfRADf4E_9','🎥 Take Pic/Vid','button','🎥 Take Pic/Vid','{\"value\": \"#86DEFF;SENBOX.ORG/PictureTaking\"}',1,'','enabled',NULL,'2025-01-14 06:44:21.156','2025-01-14 06:44:21.156'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_1','Instruction','button','Instruction','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/bcncnbvcnbxb5214251425-bccv\"}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_11','Consequense strip used','qr_code','Consequense strip used','{}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_13','Notes / Comments','text','Notes / Comments','{}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_2','NOTE','message_box','NOTE','{\"value\": \"START AND STOP TIMER WITH BEHAVIOUR\"}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_3','How long does the behavior last? (Hành vi được diễn ra trong bao lâu?)','duration_forward','How long does the behavior last? (Hành vi được diễn ra trong bao lâu?)','{}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_4','How many time does behavior have? (Hành vi diễn ra bao nhiên lần?)','button_count_user','How many time does behavior have? (Hành vi diễn ra bao nhiên lần?)','{\"value\": \"St-Behaviour\"}',1,'St-Behaviour','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_5','What are the reason of students\' behavior? (Lý do xảy ra hành vi của học sinh là gì?)','selection','What are the reason of students\' behavior? (Lý do xảy ra hành vi của học sinh là gì?)','{\"options\":[{\"name\":\"Boring\"},{\"name\":\"Hungry\"},{\"name\":\"Food demnad\"},{\"name\":\"Tired\"},{\"name\":\"Attention\"},{\"name\":\"Change the routine\"},{\"name\":\"Dislike food\"},{\"name\":\"Noise\"},{\"name\":\"Correct task\"},{\"name\":\"Waiting\"},{\"name\":\"New activity\"},{\"name\":\"Change teacher\"},{\"name\":\"Change room\"},{\"name\":\"Change position\"},{\"name\":\"Difficult task\"},{\"name\":\"Change the amount of task\"},{\"name\":\"Cognitive flexible\"},{\"name\":\"Refuse\"},{\"name\":\"Come to school\"},{\"name\":\"Demand to go home\"},{\"name\":\"Not known yet\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_6','What was the activity before? (Hoạt động trước đó là gì?)','selection','What was the activity before? (Hoạt động trước đó là gì?)','{\"options\":[{\"name\":\"Play\"},{\"name\":\"Lifeskill\"},{\"name\":\"Sensory play\"},{\"name\":\"Music\"},{\"name\":\"Art\"},{\"name\":\"Work\"},{\"name\":\"Toilet\"},{\"name\":\"Drink\"},{\"name\":\"PE\"},{\"name\":\"Come to school\"},{\"name\":\"Go home\"},{\"name\":\"Go for walk\"},{\"name\":\"Sleep\"},{\"name\":\"Lunch\"},{\"name\":\"Snack\"},{\"name\":\"Change the routine\"},{\"name\":\"Go to downstairs\"},{\"name\":\"Go to upstairs\"},{\"name\":\"Change teacher\"},{\"name\":\"Change classroom\"},{\"name\":\"Change position\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_7','What is the next activity? (Hoạt động tiếp theo là gì?)','selection','What is the next activity? (Hoạt động tiếp theo là gì?)','{\"options\":[{\"name\":\"Play\"},{\"name\":\"Lifeskill\"},{\"name\":\"Sensory play\"},{\"name\":\"Music\"},{\"name\":\"Art\"},{\"name\":\"Work\"},{\"name\":\"Toilet\"},{\"name\":\"Drink\"},{\"name\":\"PE\"},{\"name\":\"Come to school\"},{\"name\":\"Go home\"},{\"name\":\"Go for walk\"},{\"name\":\"Sleep\"},{\"name\":\"Lunch\"},{\"name\":\"Snack\"},{\"name\":\"Change the routine\"},{\"name\":\"Go to downstairs\"},{\"name\":\"Go to upstairs\"},{\"name\":\"Change teacher\"},{\"name\":\"Change classroom\"},{\"name\":\"Change position\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SBT-[SBFS-0915]_1VlK9zrXK7FZa2IJnyrvvm0GV_12-MDLpULMTFy3n1WA_8','Who was there? (Ai đã ở đây?)','multiple_choice','Who was there? (Ai đã ở đây?)','{\"options\":[{\"name\":\"Teacher Mueller\"},{\"name\":\"Ms Vinh\"},{\"name\":\"Ms Vy\"},{\"name\":\"Ms Như\"},{\"name\":\"Parent (mom/dad/granparent)\"},{\"name\":\"Previous teacher\"},{\"name\":\"Current teacher\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:50.329','2025-01-03 04:35:50.329'),
('SENBOX.ORG/SEARCH TEST_1UnXYV55ZVXlIg96U5ZM-OfqSMkLOwfycKZ7osN0xrKo_2','ℹ️ Introduction','button','ℹ️ Introduction','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/gbvgbtstrgg-dytyuyt7uyt67r45te54e6\"}',1,'','enabled',NULL,'2025-01-03 04:35:42.040','2025-01-03 04:35:42.040'),
('SENBOX.ORG/SEARCH TEST_1UnXYV55ZVXlIg96U5ZM-OfqSMkLOwfycKZ7osN0xrKo_3','','text','','{}',1,'','enabled',NULL,'2025-01-03 04:35:42.040','2025-01-03 04:35:42.040'),
('SENBOX.ORG/SEARCH TEST_1UnXYV55ZVXlIg96U5ZM-OfqSMkLOwfycKZ7osN0xrKo_4','sgh','selection','sgh','{\"options\":[{\"name\":\"a\"},{\"name\":\"b\"},{\"name\":\"c\"},{\"name\":\"f\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:42.040','2025-01-03 04:35:42.040'),
('SENBOX.ORG/TEST-FORM_1wfwntxV19ipMgjmyX_P-SAQuUnHrNaH6_Rsqmw9fS5Y_1','Please enter any text_1','text_value_example_1','Please enter any text_1','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-14 06:44:22.608','2025-01-14 06:44:22.608'),
('SENBOX.ORG/TEST-FORM_1wfwntxV19ipMgjmyX_P-SAQuUnHrNaH6_Rsqmw9fS5Y_2','Please enter any text_2','text_value_example_2','Please enter any text_2','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-14 06:44:22.608','2025-01-14 06:44:22.608'),
('SENBOX.ORG/TEST-FORM-RESPONSE_1dOuEGJWvbn5v4M32uP4s4YpXez8CK9qIz9hDNWYILkg_1','Message Text Response','message_text_response_1','Message Text Response','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-03 04:35:46.399','2025-01-03 04:35:46.399'),
('SENBOX.ORG/TEST-FORM-RESPONSE_1dOuEGJWvbn5v4M32uP4s4YpXez8CK9qIz9hDNWYILkg_2','Message Text Response 2','message_text_response_2','Message Text Response 2','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-03 04:35:46.399','2025-01-03 04:35:46.399'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_11','COUNT','count','COUNT','{}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_12','NUMBER','number','NUMBER','{}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_13','TEXT','text','TEXT','{}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_14','QR_CODE','qr_code','QR_CODE','{}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_15','PHOTO','photo','PHOTO','{\"value\": \"1cbb3CYU0BUrCf-vt1jVRKAkWlqGt2S0i\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_16','BUTTON_COUNT','button_count','BUTTON_COUNT','{\"value\": \"1.5;1;0.6;0.2\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_17','CHOICE_TOGGLE','choice_toggle','CHOICE_TOGGLE','{\"options\":[{\"name\":\"YES / CÓ\"},{\"name\":\"NO / KHÔNG\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_18','SELECTION','selection','SELECTION','{\"options\":[{\"name\":\"low enagement\"},{\"name\":\"recognise visual\"},{\"name\":\"counting\"},{\"name\":\"focusing\"},{\"name\":\"follow instruction\"},{\"name\":\"holding pen\"},{\"name\":\"waiting\"},{\"name\":\"happy / excited\"},{\"name\":\"hyperactive\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_2','ℹ️ Introduction','button','ℹ️ Introduction','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/gbvgbtstrgg-dytyuyt7uyt67r45te54e6\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_20','SINGLE_CHOICE','single_choice','SINGLE_CHOICE','{\"options\":[{\"name\":\"1.5\"},{\"name\":\"1\"},{\"name\":\"0.6\"},{\"name\":\"0.2\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_22','MULTIPLE_CHOICE','multiple_choice','MULTIPLE_CHOICE','{\"options\":[{\"name\":\"Play\"},{\"name\":\"Lifeskill\"},{\"name\":\"Sensory play\"},{\"name\":\"Music\"},{\"name\":\"Art\"},{\"name\":\"Work\"},{\"name\":\"Toilet\"},{\"name\":\"Drink\"},{\"name\":\"PE\"},{\"name\":\"Come to school\"},{\"name\":\"Go home\"},{\"name\":\"Go for walk\"},{\"name\":\"Sleep\"},{\"name\":\"Lunch\"},{\"name\":\"Snack\"},{\"name\":\"Change the routine\"},{\"name\":\"Go to downstairs\"},{\"name\":\"Go to upstairs\"},{\"name\":\"Change teacher\"},{\"name\":\"Change classroom\"},{\"name\":\"Change position\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_25','CHOICE_TOGGLE','choice_toggle','CHOICE_TOGGLE','{\"options\":[{\"name\":\"Imediately\"},{\"name\":\"Delay about 1 - 5 minutes\"},{\"name\":\"Not reply\"},{\"name\":\"Grab hand\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_3','TIME','time','TIME','{}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_31','SHOW_PIC','show_pic','SHOW_PIC','{\"value\": \"https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_33','PLAY_VIDEO','play_video','PLAY_VIDEO','{\"value\": \"https://drive.google.com/open?id=1UhGEdhOaS4VCiGz2ZrEzcOjA0DhL2avK&usp=drive_fs\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_35','MESSAGE_BOX','message_box','MESSAGE_BOX','{\"value\": \"go to eat\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_37','SECTION','section','SECTION','{\"value\": \"go to top\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_4','DATETIME','datetime','DATETIME','{}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_42','SIGNATURE','signature','SIGNATURE','{\"value\": \"NAME\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_44','QR_CODE_FRONT','qr_code_front','QR_CODE_FRONT','{}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_45','DRAGGABLE_LIST','draggable_list','DRAGGABLE_LIST','{\"options\":[{\"name\":\"SET 2(level extra)\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_47','randomizer name','randomizer','randomizer name','{\"value\": \"dj,nvf\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_48','Code generator','code_counting','Code generator','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_49','Document question','document','Document question','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_5','DURATION_FORWARD','duration_forward','DURATION_FORWARD','{}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_50','Qrcode generator question','qrcode_generator','Qrcode generator question','{\"value\": \"\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTFORM_1J8gIEjehIDXVEGDGsSsrie7PTyXJkVSUiOepiQnb0DI_6','DURATION_BACKWARD','duration_backward','DURATION_BACKWARD','{\"value\": \"30\"}',1,'','enabled',NULL,'2025-01-03 04:35:47.882','2025-01-03 04:35:47.882'),
('SENBOX.ORG/TESTLOCALAPI_1MByfyrrTgmff4rj3SW0OeDZQHJN1ex0eZeAt8KfpG88_15','PHOTO','photo','PHOTO','{\"value\": \"1cbb3CYU0BUrCf-vt1jVRKAkWlqGt2S0i\"}',1,'','enabled',NULL,'2025-01-03 04:35:37.703','2025-01-03 04:35:37.703'),
('SENBOX.ORG/TESTLOCALAPI_1MByfyrrTgmff4rj3SW0OeDZQHJN1ex0eZeAt8KfpG88_2','ℹ️ Introduction','button','ℹ️ Introduction','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/gbvgbtstrgg-dytyuyt7uyt67r45te54e6\"}',1,'','enabled',NULL,'2025-01-03 04:35:37.703','2025-01-03 04:35:37.703'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_11','Separator Color','choice_toggle','Separator Color','{\"options\":[{\"name\":\"⚪️ White\"},{\"name\":\"⚫️ Black\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_12','Thickness Of Separator','scale','Thickness Of Separator','{\"number\" : 100, \"steps\": 100}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_13','Turn On/ Off Finished Line','choice_toggle','Turn On/ Off Finished Line','{\"options\":[{\"name\":\"✅ On\"},{\"name\":\"Off 🛑\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_2','ℹ️ Introduction','button','ℹ️ Introduction','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/gbvgbtstrgg-dytyuyt7uyt67r45te54e6\"}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_3','Duration Minutes','scale','Duration Minutes','{\"number\" : 60, \"steps\": 60}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_4','Duration Seconds','scale','Duration Seconds','{\"number\" : 60, \"steps\": 60}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_5','Start By Topic Color','selection','Start By Topic Color','{\"options\":[{\"name\":\"🔴 Work\"},{\"name\":\"🔵 Play\"},{\"name\":\"🟡 Care\"},{\"name\":\"🟢 Food\"},{\"name\":\"🟣 Life Skill\"},{\"name\":\"🌐 Choice\"},{\"name\":\"🟩 Cooking\"},{\"name\":\"⚫️ Black\"},{\"name\":\"⚪️ White\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_6','Transition To Topic Color ','selection','Transition To Topic Color ','{\"options\":[{\"name\":\"🔴 Work\"},{\"name\":\"🔵 Play\"},{\"name\":\"🟡 Care\"},{\"name\":\"🟢 Food\"},{\"name\":\"🟣 Life Skill\"},{\"name\":\"🌐 Choice\"},{\"name\":\"🟩 Cooking\"},{\"name\":\"⚫️ Black\"},{\"name\":\"⚪️ White\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_7','Opacity Of Time Text','scale','Opacity Of Time Text','{\"number\" : 100, \"steps\": 100}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_8','Sound On/ Off','choice_toggle','Sound On/ Off','{\"options\":[{\"name\":\"✅ On\"},{\"name\":\"Off 🛑\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRANSITION-FORM_1foP1u5enRzSquB3NbHJOJHy4Zbq1R_b0qSZgFC576Tc_9','Show Countdown/ Minutes','choice_toggle','Show Countdown/ Minutes','{\"options\":[{\"name\":\"🔢 Countdown\"},{\"name\":\"⏲ Minutes\"}]}',1,'','enabled',NULL,'2025-01-03 04:35:38.975','2025-01-03 04:35:38.975'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_10','Images','single_choice','Images','{\"options\":[{\"name\":\"https://loremflickr.com/200/200?random=1\"},{\"name\":\"https://loremflickr.com/200/200?random=2\"},{\"name\":\"https://loremflickr.com/200/200?random=3\"},{\"name\":\"https://loremflickr.com/200/200?random=4\"},{\"name\":\"https://loremflickr.com/200/200?random=5\"},{\"name\":\"https://loremflickr.com/200/200?random=6\"},{\"name\":\"https://loremflickr.com/200/200?random=7\"},{\"name\":\"https://loremflickr.com/200/200?random=8\"},{\"name\":\"https://loremflickr.com/200/200?random=9\"},{\"name\":\"https://loremflickr.com/200/200?random=10\"}]}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_11','Choosen Date Time','message_box','Choosen Date Time','{\"value\": \"2000;2025\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_12','Two Wheels Selection','message_box','Two Wheels Selection','{\"value\": \"[Title:Fruit;Values:Banana;Apple;Mango;Orange;Watermelon;Tomato;Potato];[Title:Shape;Values:Retangle;Circle;Square]\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_13','Single Wheels Selection','message_box','Single Wheels Selection','{\"value\": \"[Title:Color;Values:Red;Blue;Yellow;Grey;White;LightBlue;Green]\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_14','Water Cup Components','message_box','Water Cup Components','{\"value\": \"WaterCup\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_15','Record Audio Component','message_box','Record Audio Component','{\"value\": \"Record Audio\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_2','ℹ️ Introduction','button','ℹ️ Introduction','{\"value\": \"#86DEFF;https://sites.google.com/senbox.org/doc-jhtvrskdhnksnk/gbvgbtstrgg-dytyuyt7uyt67r45te54e6\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_3','Results Table View','message_box','Results Table View','{\"value\": \"[Lamborghini Urus;A flagship supercar featuring a 6.5-liter V12 engine, producing 740 CV (544 kW) at 8,400 rpm, with a top speed of 350 km/h (217 mph) and acceleration from 0-100 km/h in 2.9 seconds;https://1cars.org/wp-content/uploads/2019/02/Lamborghini-Urus-12.jpg];[Lamborghini Aventador;The world\'s first Super Sport Utility Vehicle (SUV), combining the performance of a super sports car with the functionality of an SUV. It is powered by a 4.0-liter twin-turbo V8 engine, delivering exceptional performance and versatility;https://images.hdqwalls.com/wallpapers/lamborghini-aventador-lp-750-sv-ca.jpg];[Lamborghini Huracan;A super sports car equipped with a 5.2-liter V10 engine, offering 640 CV (470 kW) at 8,000 rpm, a top speed exceeding 325 km/h (202 mph), and acceleration from 0-100 km/h in 2.9 seconds;https://www.hdcarwallpapers.com/walls/vf_engineering_lamborghini_huracan_performante_2020_4k-HD.jpg];\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_4','Wheels Duration Time','duration_backward','Wheels Duration Time','{\"value\": \"3456\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_5','Colors','single_choice','Colors','{\"options\":[{\"name\":\"#ECECEC\"},{\"name\":\"#EE220C\"},{\"name\":\"#FFA400\"},{\"name\":\"#CCC666\"},{\"name\":\"#000000\"},{\"name\":\"#16B100\"},{\"name\":\"#A4D873\"},{\"name\":\"#86DEFF\"},{\"name\":\"#007BFF\"}]}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_6','Edit Range Sliders','message_box','Edit Range Sliders','{\"value\": \"0;150\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_7','Draggable List','draggable_list','Draggable List','{\"options\":[{\"name\":\"SET BOOKS\"}]}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_8','Product 1','message_box','Product 1','{\"value\": \"productId:1;productName:Bendu AB6807 Super Lightweight Men\'s Sportswear Set;productBrand:Bendu;productDescription:The Bendu AB6807 men\'s sportswear set includes a short-sleeved polo shirt and shorts, made of premium-quality material that is soft, cool, lightweight, sweat-absorbent, and breathable;productImage:https://product.hstatic.net/200000690725/product/fstp001-14_53597537845_o_144f28f5861f42ed8b547ae46daef63e_master.jpg;productPrice:28;productMaxium:5;\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/TRUNG-TEST_1BWU4MqiXGiu7NJTK_evAjcOf6ov4vpBF8fsZO9efyvs_9','View Range Sliders','message_box','View Range Sliders','{\"value\": \"0;120\"}',1,'','enabled',NULL,'2025-01-14 06:49:32.589','2025-01-14 06:49:32.589'),
('SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_1','User name','user_information_value_1','User name','{}',1,'','enabled',NULL,'2025-01-10 04:07:12.730','2025-01-10 04:07:12.730'),
('SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_2','Full name','user_information_value_2','Full name','{}',1,'','enabled',NULL,'2025-01-10 04:07:12.730','2025-01-10 04:07:12.730'),
('SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_3','Phone number','user_information_value_3','Phone number','{}',1,'','enabled',NULL,'2025-01-10 04:07:12.730','2025-01-10 04:07:12.730'),
('SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_4','Email','user_information_value_4','Email','{}',1,'','enabled',NULL,'2025-01-10 04:07:12.730','2025-01-10 04:07:12.730'),
('SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_5','Day of Birth','user_information_value_5','Day of Birth','{}',1,'','enabled',NULL,'2025-01-10 04:07:12.730','2025-01-10 04:07:12.730'),
('SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_6','School','user_information_value_6','School','{}',1,'','enabled',NULL,'2025-01-10 04:07:12.730','2025-01-10 04:07:12.730'),
('SENBOX.ORG/USER-INFORMATION_1TfGVBfcyKT6y-YEx8wz-zuJ7OYL-53EM7LSQfUvtmb8_7','Devices','user_information_value_7','Devices','{}',1,'','enabled',NULL,'2025-01-10 04:07:12.730','2025-01-10 04:07:12.730');
/*!40000 ALTER TABLE `s_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_redirect_url`
--

DROP TABLE IF EXISTS `s_redirect_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_redirect_url` (
  `redirect_url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qr_code` varchar(255) NOT NULL,
  `target_url` varchar(255) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `hint` varchar(255) DEFAULT '',
  `hash_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`redirect_url_id`),
  UNIQUE KEY `qr_code` (`qr_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_redirect_url`
--

LOCK TABLES `s_redirect_url` WRITE;
/*!40000 ALTER TABLE `s_redirect_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_redirect_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role`
--

DROP TABLE IF EXISTS `s_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role`
--

LOCK TABLES `s_role` WRITE;
/*!40000 ALTER TABLE `s_role` DISABLE KEYS */;
INSERT INTO `s_role` VALUES
(1,'Student','Student','2024-12-06 02:08:58.688','2024-12-06 02:08:58.688'),
(2,'Guardian','Guardian','2024-12-06 02:08:58.695','2024-12-06 02:08:58.695'),
(3,'Teacher','Teacher','2024-12-06 02:08:58.701','2024-12-06 02:08:58.701'),
(4,'Staff','Staff','2024-12-06 02:08:58.709','2024-12-06 02:08:58.709'),
(5,'Admin','Administrator','2024-12-06 02:08:58.713','2024-12-06 02:08:58.713'),
(6,'Doctor','Doctor','2024-12-19 09:03:41.179','2024-12-19 09:03:41.179'),
(7,'Nanny','Nanny','2024-12-19 09:03:41.183','2024-12-19 09:03:41.183'),
(8,'Parent','Parent','2024-12-20 09:09:20.755','2024-12-20 09:09:20.755');
/*!40000 ALTER TABLE `s_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role_claim`
--

DROP TABLE IF EXISTS `s_role_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_role_claim` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `claim_name` varchar(255) NOT NULL,
  `claim_value` varchar(255) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `fk_s_role_claims` (`role_id`),
  CONSTRAINT `fk_s_role_claims` FOREIGN KEY (`role_id`) REFERENCES `s_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role_claim`
--

LOCK TABLES `s_role_claim` WRITE;
/*!40000 ALTER TABLE `s_role_claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_role_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role_policy`
--

DROP TABLE IF EXISTS `s_role_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_role_policy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `policy_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role_policy`
--

LOCK TABLES `s_role_policy` WRITE;
/*!40000 ALTER TABLE `s_role_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_role_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role_policy_claims`
--

DROP TABLE IF EXISTS `s_role_policy_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_role_policy_claims` (
  `policy_id` bigint(20) NOT NULL,
  `claim_id` bigint(20) NOT NULL,
  PRIMARY KEY (`policy_id`,`claim_id`),
  KEY `fk_s_role_policy_claims_role_claim` (`claim_id`),
  CONSTRAINT `fk_s_role_policy_claims_policy` FOREIGN KEY (`policy_id`) REFERENCES `s_role_policy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_role_policy_claims_role_claim` FOREIGN KEY (`claim_id`) REFERENCES `s_role_claim` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role_policy_claims`
--

LOCK TABLES `s_role_policy_claims` WRITE;
/*!40000 ALTER TABLE `s_role_policy_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_role_policy_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role_policy_roles`
--

DROP TABLE IF EXISTS `s_role_policy_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_role_policy_roles` (
  `policy_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`policy_id`,`role_id`),
  KEY `fk_s_role_policy_roles_role` (`role_id`),
  CONSTRAINT `fk_s_role_policy_roles_role` FOREIGN KEY (`role_id`) REFERENCES `s_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_role_policy_roles_role_policy` FOREIGN KEY (`policy_id`) REFERENCES `s_role_policy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role_policy_roles`
--

LOCK TABLES `s_role_policy_roles` WRITE;
/*!40000 ALTER TABLE `s_role_policy_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_role_policy_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_setting`
--

DROP TABLE IF EXISTS `s_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}' CHECK (json_valid(`settings`)),
  `type` bigint(20) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `setting_name` text NOT NULL DEFAULT '',
  `integer_value` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_setting`
--

LOCK TABLES `s_setting` WRITE;
/*!40000 ALTER TABLE `s_setting` DISABLE KEYS */;
INSERT INTO `s_setting` VALUES
(7,'{\"spreadsheet_id\":\"1HP8rksRyiGydunn2d5SPlQhxsIvT9sQ9X_GGxB0n7eM\"}',7,'2023-04-05 08:33:21.741','2024-10-05 15:46:16.221','EMAIL HISTORY',0),
(8,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/1tTO3GrVAFqEEqay6EbAqTvMYkSZjTA3dhW2UnJrYJ54/edit?gid=1558888165#gid=1558888165\",\"auto\":true,\"interval\":0}',6,'2023-04-09 21:37:08.885','2024-10-21 05:49:40.229','✅ TODO [UPLOADER]',0),
(9,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/1kHN4mF7nPxvP8wthOl9G45HMZRQ-9KEpD2yySrU2AeY/edit?gid=1537384824#gid=1537384824\",\"auto\":false,\"interval\":0}',5,'2023-04-09 21:42:35.311','2025-02-11 04:21:24.266','📲 DEVICE [II] -> [UPLOADER]',0),
(10,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/1g2g0G1TJnQESBXvJYiuQPny81GQBK27R_jkICSLD17I/edit?usp=drive_link\",\"auto\":false,\"interval\":10080}',2,'2023-04-09 21:46:58.783','2024-11-21 13:49:28.721','FORM 1  [UPLOADER] - IN USE',0),
(11,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/15J0DJo4Bpsc_E2-9e_cD6B4xuNktAaiU-sNqHlPDP0M/edit?gid=628850626#gid=628850626\",\"auto\":false,\"interval\":0}',3,'2023-04-09 21:50:26.769','2024-10-18 13:49:09.424','🔗 URL FORWARDER 🔗  REDIRECT  🔗 [UPLOADER] 🔗 ',0),
(12,'{\"folder_id\":\"1tppt5VbzlcPqpRPFE55y5blA1tc0UWSW\"}',1,'2023-04-09 22:21:04.067','2024-10-05 15:45:02.430','OUTPUT',0),
(13,'{\"spreadsheet_id\":\"1N0x_tzt1IWE4hPDU8mSQBaA7vkGcZI_LVSfnrXI6Guc\"}',8,'2023-04-09 22:44:57.955','2024-10-05 15:45:01.569','🚪 OUTPUT TEMPLATE VALUE12',0),
(14,'{\"spreadsheet_id\":\"1sng4-hUjgeu54wxj_XlRNGRt7_qeZDA5WFniHgKVZoA\"}',4,'2023-04-09 23:13:11.559','2024-10-05 15:44:59.875','SUMMARY',0),
(15,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/1GuhHrsysU5l5gozmI1MYpXKOxVb-KWbuBltbNnp0BhM/edit?gid=1470872227#gid=1470872227\",\"auto\":false,\"interval\":1440}',10,'2023-07-15 09:11:36.630','2024-10-18 13:49:02.488','FORM ⍰ 2 [UPLOADER]',0),
(16,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/1Mn4cTOJw-krQ63WtlE8TScV6arz1eg5P0J-z-TOvePE/edit?gid=269156543#gid=269156543\",\"auto\":true,\"interval\":60}',11,'2023-07-15 09:11:38.986','2024-10-18 13:49:03.643','FORM ⍰ 3  [UPLOADER]',0),
(17,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/16x8QQK-r8f0Hbe-9sQvI73y_ToHbqMCLBB4bUC-eXoU/edit?gid=1470872227#gid=1470872227\",\"auto\":false,\"interval\":0}',12,'2023-07-15 09:11:42.079','2025-01-14 13:49:30.530','FORM ⍰ 4 [UPLOADER]',0),
(18,'{\"spreadsheet_id\":\"11xDtKyCq2-ve5nWYShZkc-aNELmUPTtoTKuq4xp5Yw0\"}',9,'2023-07-15 09:11:57.427','2024-10-05 15:45:00.434','🚪OUTPUT TEMPLATE FOR TEACHER (VALUE32)',0),
(19,'{\"name\":\"SENBOX.org\",\"value\":\"https://www.senbox.org/\"}',13,'2024-01-28 23:54:23.542','2024-10-05 15:47:09.900','SIGN UP - [BUTTON 1]',0),
(20,'{\"name\":\"Read Terms\",\"value\":\"https://sites.google.com/senbox.org/senboxtac/senbox-terms-conditions\"}',14,'2024-01-28 23:54:26.712','2024-10-05 15:47:08.896','SIGN UP - [BUTTON 2]',0),
(21,'{\"name\":\"SIGN UP\",\"value\":\"Sign Form\"}',15,'2024-01-28 23:54:28.990','2024-10-05 15:47:08.021','SIGN UP - [BUTTON 3]',0),
(22,'{\"name\":\"[X]\",\"value\":\"QR CODE\"}',16,'2024-01-28 23:54:31.204','2024-10-05 15:47:07.256','SIGN UP - [BUTTON 4]',0),
(23,'{\"form_id\":119,\"spreadsheet_id\":\"https://docs.google.com/spreadsheets/d/1UIgoJVfTCJp-Z2jKCsocoY2wfDXJYUZnEFoh1JXi1gQ/edit?gid=296588123#gid=296588123\"}',17,'2024-01-28 23:54:34.762','2025-01-02 15:44:06.491','REGISTRATION FORM - SIGN UP FORM',0),
(24,'{\"spreadsheet_id\":\"https://docs.google.com/spreadsheets/d/1DZywd94mmH7Uzlz-8gzcnz9RqbwYzs0G55NO_fSavoY/edit?gid=2020263750#gid=2020263750\"}',18,'2024-01-28 23:54:38.535','2024-10-05 15:45:35.771','REGISTRATION SUBMISSION',0),
(25,'{\"form_id\":0,\"spreadsheet_id\":\"HOME SCHOOLING{HBECSVNS}\"}',19,'2024-01-28 23:54:41.361','2024-10-05 15:47:34.865','📝 REGISTRATION PRESET [VALUE 2]',0),
(26,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/1irX6VEurKwpjfxc3_wl72NzXGo3w1OVuxXCmnLRBElg/edit?gid=0#gid=0\",\"spreadsheet_id\":\"1irX6VEurKwpjfxc3_wl72NzXGo3w1OVuxXCmnLRBElg\"}',20,'2024-06-09 22:55:02.141','2024-10-05 15:46:14.265','DISTRIBUTOR',0),
(27,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/1LKd3LZUy5Fl4RMLY5-57iDxunn8LY899QBH5OZ-gwdI/edit?gid=8360095#gid=8360095\",\"spreadsheet_id\":\"1LKd3LZUy5Fl4RMLY5-57iDxunn8LY899QBH5OZ-gwdI\"}',21,'2024-07-27 15:16:03.035','2024-10-05 15:46:15.051','COUNTING DATA - HISTORY',0),
(28,'{}',22,'2024-07-28 00:07:07.481','2024-10-21 18:30:48.889','LOGO REFRESH INTERVAL',5),
(29,'{\"spreadsheet_url\":\"https://docs.google.com/spreadsheets/d/1WXcqPw0EYmxjcdyinOaTjDKSiL-WYAUmz4usOlkarmA/edit?gid=0#gid=0\",\"auto\":false,\"interval\":0}',23,'2024-09-15 15:16:02.491','2025-01-13 09:11:33.094','IMPORT SIGN UP FORMS',0),
(30,'{\"form_id\":0,\"spreadsheet_id\":\"SENBOX USER\"}',24,'2024-01-28 23:54:41.361','2024-12-19 16:19:14.862','📝 REGISTRATION PRESET [VALUE 1]',0),
(31,'{\"name\":\"SIGN IN\",\"value\":\"Sign In\"}',25,'2024-12-19 05:35:57.574','2024-12-19 05:35:57.574','SIGN IN - [BUTTON 5]',0),
(32,'{\"form_id\":66,\"spreadsheet_id\":\"https://docs.google.com/spreadsheets/d/14RgIjx1coC3RcGCa9zl0IA4Ju9b5qN2kxnM9llsnNVk/edit?gid=1987360762#gid=1987360762\"}',26,'2024-12-25 04:26:40.545','2025-01-03 10:21:52.835','SIGN UP BUTTON CONFIGURATION',0);
/*!40000 ALTER TABLE `s_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_submission`
--

DROP TABLE IF EXISTS `s_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_submission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned DEFAULT NULL,
  `device_id` varchar(36) DEFAULT NULL,
  `submission_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}' CHECK (json_valid(`submission_data`)),
  `opened_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `fk_s_submission_form` (`form_id`),
  KEY `fk_s_submission_device` (`device_id`),
  CONSTRAINT `fk_s_submission_device` FOREIGN KEY (`device_id`) REFERENCES `s_device` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_submission_form` FOREIGN KEY (`form_id`) REFERENCES `s_form` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_submission`
--

LOCK TABLES `s_submission` WRITE;
/*!40000 ALTER TABLE `s_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_to_do`
--

DROP TABLE IF EXISTS `s_to_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_to_do` (
  `id` varchar(255) NOT NULL,
  `spreadsheet_id` varchar(255) NOT NULL,
  `sheet_name` varchar(255) NOT NULL DEFAULT 'Tasks',
  `tasks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`tasks`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL,
  `history_spreadsheet_id` varchar(255) NOT NULL,
  `history_sheet_name` varchar(255) NOT NULL DEFAULT 'Answers',
  `start_row` bigint(20) NOT NULL DEFAULT 13,
  `type` varchar(32) DEFAULT 'assign',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_to_do`
--

LOCK TABLES `s_to_do` WRITE;
/*!40000 ALTER TABLE `s_to_do` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_to_do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user`
--

DROP TABLE IF EXISTS `s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user` (
  `user_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `birthday` datetime(3) DEFAULT current_timestamp(3),
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `job` varchar(255) NOT NULL DEFAULT '',
  `country_code` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `role` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user`
--

LOCK TABLES `s_user` WRITE;
/*!40000 ALTER TABLE `s_user` DISABLE KEYS */;
INSERT INTO `s_user` VALUES
('663688d9-639c-4691-bc3b-612fcb3b6b48','admin','SEN Admin','2023-02-01 12:25:51.419','','admin@senbox.vn','','','','$2a$10$SSd9ZqPsfQx9bhP04NIopO.pK0XnihlvK6G/3d1KC7W57uAVW5ueK',28,'2023-02-01 12:25:51.419','2023-02-01 12:25:51.419'),
('a1ed784d-b47f-4b8e-ad97-224e418cabd4','superadmin','Mueller Senbox','2024-10-31 07:33:32.617','','mueller@senbox.org','','','','$2a$10$2U18uJcYAp0aZjPVMB4Ej.eyZrmlQm/JD0n658h/hFitkGeNDumK6',28,'2024-10-31 07:33:32.617','2024-10-31 07:33:32.617'),
('F9046EC9-5703-42F0-97D8-750138D52E4C','techbot','Bot','2023-02-01 12:25:51.419','','techbot@senbox.vn','','','','$2a$10$eOi1evDf3d8qJJxAscC6CeJcAGo20tgqgxWANXGwee9IWufQVpewe',28,'2023-02-01 12:25:51.419','2023-02-01 12:25:51.419');
/*!40000 ALTER TABLE `s_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_config`
--

DROP TABLE IF EXISTS `s_user_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `top_button_config` varchar(255) NOT NULL DEFAULT '',
  `student_output_sheet_id` varchar(255) NOT NULL,
  `teacher_output_sheet_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_config`
--

LOCK TABLES `s_user_config` WRITE;
/*!40000 ALTER TABLE `s_user_config` DISABLE KEYS */;
INSERT INTO `s_user_config` VALUES
(7,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.165','2025-02-11 04:15:48.165'),
(8,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.190','2025-02-11 04:15:48.190'),
(9,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.214','2025-02-11 04:15:48.214'),
(10,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.237','2025-02-11 04:15:48.237'),
(11,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.265','2025-02-11 04:15:48.265'),
(12,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.285','2025-02-11 04:15:48.285'),
(13,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.306','2025-02-11 04:15:48.306'),
(14,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.327','2025-02-11 04:15:48.327'),
(15,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.353','2025-02-11 04:15:48.353'),
(16,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.378','2025-02-11 04:15:48.378'),
(17,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.399','2025-02-11 04:15:48.399'),
(18,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.419','2025-02-11 04:15:48.419'),
(19,'https://docs.google.com/spreadsheets/d/14kJ_w9i0wSBmY8NXkRlV1uu0vlVWyPAHAAAE5CEfA0Y/edit?gid=1194226249#gid=1194226249','','','2025-02-11 04:15:48.446','2025-02-11 04:15:48.446');
/*!40000 ALTER TABLE `s_user_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_devices`
--

DROP TABLE IF EXISTS `s_user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_devices` (
  `user_id` char(36) NOT NULL,
  `device_id` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`device_id`),
  KEY `fk_s_user_devices_device` (`device_id`),
  CONSTRAINT `fk_s_user_devices_device` FOREIGN KEY (`device_id`) REFERENCES `s_device` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_user_devices_user` FOREIGN KEY (`user_id`) REFERENCES `s_user_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_devices`
--

LOCK TABLES `s_user_devices` WRITE;
/*!40000 ALTER TABLE `s_user_devices` DISABLE KEYS */;
INSERT INTO `s_user_devices` VALUES
('03fcd98e-e9b7-11ef-80ca-0242c0000205','5fb2394c02fb3939'),
('1da60699-cca0-11ef-b72d-9457a5ea5b47','5fb2394c02fb3939'),
('2e0fc222-ea77-11ef-91f5-0242c0000205','5fb2394c02fb3939'),
('4a951042-d232-11ef-81b1-9457a5ea5b47','5fb2394c02fb3939'),
('52e46361-cc9f-11ef-826a-9457a5ea5b47','5fb2394c02fb3939'),
('539ebe0f-ea7b-11ef-91f5-0242c0000205','5fb2394c02fb3939'),
('570e0e22-d22f-11ef-81b1-9457a5ea5b47','5fb2394c02fb3939'),
('58d4e72b-e9b5-11ef-80ca-0242c0000205','5fb2394c02fb3939'),
('5b682645-c267-11ef-9c79-9457a5ea5b47','5fb2394c02fb3939'),
('6281d0a8-d23e-11ef-81b1-9457a5ea5b47','5fb2394c02fb3939'),
('71c61ba5-e920-11ef-80ca-0242c0000205','5fb2394c02fb3939'),
('76a111ec-cca0-11ef-b72d-9457a5ea5b47','5fb2394c02fb3939'),
('839dacc3-e833-11ef-80ca-0242c0000205','5fb2394c02fb3939'),
('8986f3aa-d559-11ef-93c3-9457a5ea5b47','5fb2394c02fb3939'),
('94e5179c-d558-11ef-93c3-9457a5ea5b47','5fb2394c02fb3939'),
('9f0ebef4-c26f-11ef-9c79-9457a5ea5b47','5fb2394c02fb3939'),
('a45bfd7e-cc9d-11ef-9d77-9457a5ea5b47','5fb2394c02fb3939'),
('b77d7343-e9b5-11ef-80ca-0242c0000205','5fb2394c02fb3939'),
('b8b474a7-d154-11ef-a4f3-9457a5ea5b47','5fb2394c02fb3939'),
('cff60a10-e832-11ef-80ca-0242c0000205','5fb2394c02fb3939'),
('d43baaf8-d272-11ef-81b1-9457a5ea5b47','5fb2394c02fb3939');
/*!40000 ALTER TABLE `s_user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_entity`
--

DROP TABLE IF EXISTS `s_user_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_entity` (
  `id` char(36) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `birthday` datetime(3) DEFAULT current_timestamp(3),
  `password` varchar(255) NOT NULL DEFAULT '',
  `user_config_id` bigint(20) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `fk_s_user_entity_user_config` (`user_config_id`),
  KEY `fk_s_user_entity_company` (`company_id`),
  CONSTRAINT `fk_s_user_entity_company` FOREIGN KEY (`company_id`) REFERENCES `s_company` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_user_entity_user_config` FOREIGN KEY (`user_config_id`) REFERENCES `s_user_config` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_entity`
--

LOCK TABLES `s_user_entity` WRITE;
/*!40000 ALTER TABLE `s_user_entity` DISABLE KEYS */;
INSERT INTO `s_user_entity` VALUES
('03fcd98e-e9b7-11ef-80ca-0242c0000205','yyyyyy','SENBOX USER','','','2000-02-23 00:00:00.000','$2a$10$3O/WdbKcgkrChEDuiG2CSeLPCaK5UCgyZxPJvXU2BzowV2vVFzV56',NULL,1,'2025-02-13 03:02:52.826','2025-02-13 03:02:52.826'),
('1da60699-cca0-11ef-b72d-9457a5ea5b47','thanh','SENBOX USER','','','2000-01-07 07:00:00.000','$2a$10$F1vW0WszwAI1HYNiwwEufuj1vxMc9.kQfiYVc7wPUW2eoiChzXM/a',7,1,'2025-01-07 02:35:53.774','2025-02-11 04:15:48.170'),
('2e0fc222-ea77-11ef-91f5-0242c0000205','gggg','SENBOX USERTG','1111111111','','1978-02-16 00:00:00.000','$2a$10$CvGuacytf6z2OEiKTIkz1.qNinTMHwESIw08zcnOyLczro8hDg2zq',NULL,1,'2025-02-14 01:58:26.828','2025-02-14 01:59:15.482'),
('4a951042-d232-11ef-81b1-9457a5ea5b47','trungcao','SENBOX USER','','','2000-01-20 07:00:00.000','$2a$10$3uEqW6bzzo6ALOPl7c1if.dgahC/1bn7nY6HlESqatYK/8u.Wg3AO',8,1,'2025-01-14 04:44:51.508','2025-02-11 04:15:48.194'),
('52e46361-cc9f-11ef-826a-9457a5ea5b47','hau','SENBOX USER','','','2000-01-07 07:00:00.000','$2a$10$iATP/QRjWj5.6JcV.x4/2OmKpfc2q3xkKpK7VICEuZndRjo92E6Xa',9,1,'2025-01-07 02:30:13.584','2025-02-11 04:15:48.216'),
('539ebe0f-ea7b-11ef-91f5-0242c0000205','frfff','SENBOX USER','','','1996-02-14 00:00:00.000','$2a$10$MawdhFLthpektIjT6kTRGu8cA1znuWW1N22sXXlBP33Z0NAm6PQim',NULL,1,'2025-02-14 02:28:07.796','2025-02-14 02:28:07.796'),
('570e0e22-d22f-11ef-81b1-9457a5ea5b47','huy test','SENBOX USER','','','2000-01-14 07:00:00.000','$2a$10$KM9zMzF.uUpTWEvazr/hCevKer/olTzYl4GDyPG41gGaXu13ypmVm',10,1,'2025-01-14 04:23:43.945','2025-02-11 04:15:48.242'),
('58d4e72b-e9b5-11ef-80ca-0242c0000205','ygy123#','SENBOX USER','0396071116','','1900-02-15 00:00:00.000','$2a$10$7nxcW6qMyC.18ZJ0xSedaeYcyQw7jsK9QzsNsj4L/hBbDucaeKKL6',NULL,1,'2025-02-13 02:50:56.178','2025-02-13 02:52:00.695'),
('5b682645-c267-11ef-9c79-9457a5ea5b47','loc','SENBOX USER','0912356789','stnktu','2000-12-25 07:00:00.000','$2a$10$m0kAPJMUtx0c2Q/CczaMOuODQ.Sn0ardpctEfbOKfd64k9em1KV6y',11,1,'2024-12-25 02:24:24.453','2025-02-12 07:00:19.567'),
('6281d0a8-d23e-11ef-81b1-9457a5ea5b47','trungproo','SENBOX USER','','','2000-01-18 07:00:00.000','$2a$10$ipjoM1Dy30wgBxtrNoYlZelWej2gFfAL3Bn2V7lBKeeGQ5Vxgmmvi',12,1,'2025-01-14 06:11:25.610','2025-02-11 04:15:48.288'),
('71c61ba5-e920-11ef-80ca-0242c0000205','trungprooo123','SENBOX USER','','','1900-02-12 00:00:00.000','$2a$10$c2TZEUgNu7.IgCOTNAsZ8OG.mKuKVdNWlm9IVWianQVFClmqqPwTa',NULL,1,'2025-02-12 09:05:03.017','2025-02-12 09:05:03.017'),
('76a111ec-cca0-11ef-b72d-9457a5ea5b47','wrhrw','SENBOX USER','','','2000-01-07 07:00:00.000','$2a$10$QtrsM1BKovh.QRvO/3NxVuiuqnOPBvwbKkJuVzysfRwbQZsHC22mq',13,1,'2025-01-07 02:38:23.063','2025-02-11 04:15:48.311'),
('839dacc3-e833-11ef-80ca-0242c0000205','huy senbox','SENBOX USER','','','2000-02-15 00:00:00.000','$2a$10$c7dzrrhyG6xfrrpKU/6tOuNwg5LsVmnHJoTUYQWsTnrlLgTTOpThK',NULL,1,'2025-02-11 04:49:02.229','2025-02-11 04:49:02.229'),
('8986f3aa-d559-11ef-93c3-9457a5ea5b47','trungcaooooo','SENBOX USER 2223','0937185733','','2000-01-18 07:00:00.000','$2a$10$TpgRvWSGTpJh7plEq6iE2uSxxMubQ0NkQWIg9m09QR44ivoUDo4yS',14,1,'2025-01-18 05:03:20.925','2025-02-14 03:08:41.999'),
('94e5179c-d558-11ef-93c3-9457a5ea5b47','trungcaovipproo','SENBOX USER','','','2000-01-18 07:00:00.000','$2a$10$EZ0Zcvwlt6LJzl8RvV7ju.O0oMqVV/NdUNn3s8vF.CeN7giFtAc2e',15,1,'2025-01-18 04:56:30.600','2025-02-11 04:15:48.356'),
('9f0ebef4-c26f-11ef-9c79-9457a5ea5b47','trung','SENBOX USER','','','2000-12-25 07:00:00.000','$2a$10$711WauH0VBg5kQNKtMcQ0.7s5HtFCsFUfVyOIuVwanGJd/32QSds.',16,1,'2024-12-25 03:23:33.946','2025-02-11 04:15:48.381'),
('a45bfd7e-cc9d-11ef-9d77-9457a5ea5b47','locds','SENBOX USER','','','2000-01-07 07:00:00.000','$2a$10$sJLdlQgeTQx0JahoxMvM6OqjLJ.1mIPOdEymUqrrQnIOYzG3XPY8G',17,1,'2025-01-07 02:18:11.347','2025-02-11 04:15:48.402'),
('b77d7343-e9b5-11ef-80ca-0242c0000205','yygqw','SENBOX USER','','','1901-02-15 00:00:00.000','$2a$10$Zy71g0w3XpXDxcQXG3XtV.Bkj.gMge5dCyyzMqVbz45Een8UoPYzW',NULL,1,'2025-02-13 02:53:35.012','2025-02-13 02:53:35.012'),
('b8b474a7-d154-11ef-a4f3-9457a5ea5b47','msnhu','SENBOX USER','','','2000-01-13 07:00:00.000','$2a$10$3F6nUBH93g6nJz/jQPWXee6PBxgaj1YUqiZPiRRNvSKBJlqz8kOUa',18,1,'2025-01-13 02:18:47.987','2025-02-11 04:15:48.424'),
('cff60a10-e832-11ef-80ca-0242c0000205','mrtrung','SENBOX USER','','','2000-02-11 00:00:00.000','$2a$10$QaZac9NYNTo8/aljAd4H8OJNvrnooevVN6/A2/rul.58zzm1uFU8G',NULL,1,'2025-02-11 04:44:00.810','2025-02-11 04:44:00.810'),
('d43baaf8-d272-11ef-81b1-9457a5ea5b47','trung cao','SENBOX USER','','','2000-01-18 07:00:00.000','$2a$10$YhceP5sMZh8KzQpw1XDA7.zqcWw3uajs8bNCWtRYHqhSU5SbNfNdW',19,1,'2025-01-14 12:26:50.236','2025-02-11 04:15:48.449');
/*!40000 ALTER TABLE `s_user_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_guardians`
--

DROP TABLE IF EXISTS `s_user_guardians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_guardians` (
  `user_id` char(36) NOT NULL,
  `guardian_id` char(36) NOT NULL,
  PRIMARY KEY (`user_id`,`guardian_id`),
  KEY `fk_s_user_guardians_guardian` (`guardian_id`),
  CONSTRAINT `fk_s_user_guardians_guardian` FOREIGN KEY (`guardian_id`) REFERENCES `s_user_entity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_user_guardians_user` FOREIGN KEY (`user_id`) REFERENCES `s_user_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_guardians`
--

LOCK TABLES `s_user_guardians` WRITE;
/*!40000 ALTER TABLE `s_user_guardians` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_guardians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_policies`
--

DROP TABLE IF EXISTS `s_user_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_policies` (
  `user_id` char(36) NOT NULL,
  `policy_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`policy_id`),
  KEY `fk_s_user_policies_role_policy` (`policy_id`),
  CONSTRAINT `fk_s_user_policies_role_policy` FOREIGN KEY (`policy_id`) REFERENCES `s_role_policy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_user_policies_user` FOREIGN KEY (`user_id`) REFERENCES `s_user_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_policies`
--

LOCK TABLES `s_user_policies` WRITE;
/*!40000 ALTER TABLE `s_user_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_roles`
--

DROP TABLE IF EXISTS `s_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_roles` (
  `user_id` char(36) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_s_user_roles_role` (`role_id`),
  CONSTRAINT `fk_s_user_roles_role` FOREIGN KEY (`role_id`) REFERENCES `s_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_s_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `s_user_entity` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_roles`
--

LOCK TABLES `s_user_roles` WRITE;
/*!40000 ALTER TABLE `s_user_roles` DISABLE KEYS */;
INSERT INTO `s_user_roles` VALUES
('03fcd98e-e9b7-11ef-80ca-0242c0000205',3),
('1da60699-cca0-11ef-b72d-9457a5ea5b47',3),
('2e0fc222-ea77-11ef-91f5-0242c0000205',3),
('4a951042-d232-11ef-81b1-9457a5ea5b47',3),
('52e46361-cc9f-11ef-826a-9457a5ea5b47',3),
('539ebe0f-ea7b-11ef-91f5-0242c0000205',3),
('58d4e72b-e9b5-11ef-80ca-0242c0000205',3),
('5b682645-c267-11ef-9c79-9457a5ea5b47',3),
('6281d0a8-d23e-11ef-81b1-9457a5ea5b47',3),
('71c61ba5-e920-11ef-80ca-0242c0000205',3),
('76a111ec-cca0-11ef-b72d-9457a5ea5b47',3),
('839dacc3-e833-11ef-80ca-0242c0000205',3),
('8986f3aa-d559-11ef-93c3-9457a5ea5b47',3),
('94e5179c-d558-11ef-93c3-9457a5ea5b47',3),
('9f0ebef4-c26f-11ef-9c79-9457a5ea5b47',3),
('a45bfd7e-cc9d-11ef-9d77-9457a5ea5b47',3),
('b77d7343-e9b5-11ef-80ca-0242c0000205',3),
('b8b474a7-d154-11ef-a4f3-9457a5ea5b47',3),
('cff60a10-e832-11ef-80ca-0242c0000205',3),
('d43baaf8-d272-11ef-81b1-9457a5ea5b47',3),
('03fcd98e-e9b7-11ef-80ca-0242c0000205',6),
('1da60699-cca0-11ef-b72d-9457a5ea5b47',6),
('2e0fc222-ea77-11ef-91f5-0242c0000205',6),
('4a951042-d232-11ef-81b1-9457a5ea5b47',6),
('58d4e72b-e9b5-11ef-80ca-0242c0000205',6),
('6281d0a8-d23e-11ef-81b1-9457a5ea5b47',6),
('71c61ba5-e920-11ef-80ca-0242c0000205',6),
('76a111ec-cca0-11ef-b72d-9457a5ea5b47',6),
('8986f3aa-d559-11ef-93c3-9457a5ea5b47',6),
('94e5179c-d558-11ef-93c3-9457a5ea5b47',6),
('b77d7343-e9b5-11ef-80ca-0242c0000205',6),
('cff60a10-e832-11ef-80ca-0242c0000205',6),
('d43baaf8-d272-11ef-81b1-9457a5ea5b47',6),
('03fcd98e-e9b7-11ef-80ca-0242c0000205',7),
('1da60699-cca0-11ef-b72d-9457a5ea5b47',7),
('2e0fc222-ea77-11ef-91f5-0242c0000205',7),
('4a951042-d232-11ef-81b1-9457a5ea5b47',7),
('58d4e72b-e9b5-11ef-80ca-0242c0000205',7),
('6281d0a8-d23e-11ef-81b1-9457a5ea5b47',7),
('71c61ba5-e920-11ef-80ca-0242c0000205',7),
('76a111ec-cca0-11ef-b72d-9457a5ea5b47',7),
('8986f3aa-d559-11ef-93c3-9457a5ea5b47',7),
('94e5179c-d558-11ef-93c3-9457a5ea5b47',7),
('b77d7343-e9b5-11ef-80ca-0242c0000205',7),
('cff60a10-e832-11ef-80ca-0242c0000205',7),
('d43baaf8-d272-11ef-81b1-9457a5ea5b47',7),
('03fcd98e-e9b7-11ef-80ca-0242c0000205',8),
('1da60699-cca0-11ef-b72d-9457a5ea5b47',8),
('2e0fc222-ea77-11ef-91f5-0242c0000205',8),
('4a951042-d232-11ef-81b1-9457a5ea5b47',8),
('52e46361-cc9f-11ef-826a-9457a5ea5b47',8),
('539ebe0f-ea7b-11ef-91f5-0242c0000205',8),
('570e0e22-d22f-11ef-81b1-9457a5ea5b47',8),
('58d4e72b-e9b5-11ef-80ca-0242c0000205',8),
('5b682645-c267-11ef-9c79-9457a5ea5b47',8),
('6281d0a8-d23e-11ef-81b1-9457a5ea5b47',8),
('71c61ba5-e920-11ef-80ca-0242c0000205',8),
('76a111ec-cca0-11ef-b72d-9457a5ea5b47',8),
('8986f3aa-d559-11ef-93c3-9457a5ea5b47',8),
('94e5179c-d558-11ef-93c3-9457a5ea5b47',8),
('9f0ebef4-c26f-11ef-9c79-9457a5ea5b47',8),
('a45bfd7e-cc9d-11ef-9d77-9457a5ea5b47',8),
('b77d7343-e9b5-11ef-80ca-0242c0000205',8),
('b8b474a7-d154-11ef-a4f3-9457a5ea5b47',8),
('cff60a10-e832-11ef-80ca-0242c0000205',8),
('d43baaf8-d272-11ef-81b1-9457a5ea5b47',8);
/*!40000 ALTER TABLE `s_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sen_master_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-14 11:50:43
