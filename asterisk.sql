-- MySQL dump 10.16  Distrib 10.2.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: asterisk
-- ------------------------------------------------------
-- Server version	10.2.32-MariaDB-log

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
-- Table structure for table `audio_store_details`
--

DROP TABLE IF EXISTS `audio_store_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio_store_details` (
  `audio_filename` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `audio_format` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'unknown',
  `audio_filesize` bigint(20) unsigned DEFAULT 0,
  `audio_epoch` bigint(20) unsigned DEFAULT 0,
  `audio_length` int(10) unsigned DEFAULT 0,
  `wav_format_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `wav_asterisk_valid` enum('','GOOD','BAD','NA') COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `audio_filename` (`audio_filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_store_details`
--

LOCK TABLES `audio_store_details` WRITE;
/*!40000 ALTER TABLE `audio_store_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio_store_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_log`
--

DROP TABLE IF EXISTS `call_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_dialed` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `start_epoch` int(10) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `end_epoch` int(10) DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `length_in_min` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `caller_code` (`caller_code`),
  KEY `server_ip` (`server_ip`),
  KEY `channel` (`channel`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `time` (`start_time`,`end_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_log`
--

LOCK TABLES `call_log` WRITE;
/*!40000 ALTER TABLE `call_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_log_archive`
--

DROP TABLE IF EXISTS `call_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_log_archive` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_dialed` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `start_epoch` int(10) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `end_epoch` int(10) DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `length_in_min` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `caller_code` (`caller_code`),
  KEY `server_ip` (`server_ip`),
  KEY `channel` (`channel`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `time` (`start_time`,`end_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_log_archive`
--

LOCK TABLES `call_log_archive` WRITE;
/*!40000 ALTER TABLE `call_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callcard_accounts`
--

DROP TABLE IF EXISTS `callcard_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callcard_accounts` (
  `card_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pin` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('GENERATE','PRINT','SHIP','HOLD','ACTIVE','USED','EMPTY','CANCEL','VOID') COLLATE utf8_unicode_ci DEFAULT 'GENERATE',
  `balance_minutes` smallint(5) DEFAULT 3,
  `inbound_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`card_id`),
  KEY `pin` (`pin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callcard_accounts`
--

LOCK TABLES `callcard_accounts` WRITE;
/*!40000 ALTER TABLE `callcard_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `callcard_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callcard_accounts_details`
--

DROP TABLE IF EXISTS `callcard_accounts_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callcard_accounts_details` (
  `card_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `run` varchar(4) COLLATE utf8_unicode_ci DEFAULT '',
  `batch` varchar(5) COLLATE utf8_unicode_ci DEFAULT '',
  `pack` varchar(5) COLLATE utf8_unicode_ci DEFAULT '',
  `sequence` varchar(5) COLLATE utf8_unicode_ci DEFAULT '',
  `status` enum('GENERATE','PRINT','SHIP','HOLD','ACTIVE','USED','EMPTY','CANCEL','VOID') COLLATE utf8_unicode_ci DEFAULT 'GENERATE',
  `balance_minutes` smallint(5) DEFAULT 3,
  `initial_value` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0.00',
  `initial_minutes` smallint(5) DEFAULT 3,
  `note_purchase_order` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `note_printer` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `note_did` varchar(18) COLLATE utf8_unicode_ci DEFAULT '',
  `inbound_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `note_language` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'English',
  `note_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `note_comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `create_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `activate_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `used_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `void_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `activate_time` datetime DEFAULT NULL,
  `used_time` datetime DEFAULT NULL,
  `void_time` datetime DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callcard_accounts_details`
--

LOCK TABLES `callcard_accounts_details` WRITE;
/*!40000 ALTER TABLE `callcard_accounts_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `callcard_accounts_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callcard_log`
--

DROP TABLE IF EXISTS `callcard_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callcard_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance_minutes_start` smallint(5) DEFAULT 3,
  `call_time` datetime DEFAULT NULL,
  `agent_time` datetime DEFAULT NULL,
  `dispo_time` datetime DEFAULT NULL,
  `agent` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_dispo` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_talk_sec` mediumint(8) DEFAULT 0,
  `agent_talk_min` mediumint(8) DEFAULT 0,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inbound_did` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `card_id` (`card_id`),
  KEY `call_time` (`call_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callcard_log`
--

LOCK TABLES `callcard_log` WRITE;
/*!40000 ALTER TABLE `callcard_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `callcard_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cid_channels_recent`
--

DROP TABLE IF EXISTS `cid_channels_recent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cid_channels_recent` (
  `caller_id_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `connected_line_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `dest_channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `linkedid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `dest_uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cid_channels_recent`
--

LOCK TABLES `cid_channels_recent` WRITE;
/*!40000 ALTER TABLE `cid_channels_recent` DISABLE KEYS */;
/*!40000 ALTER TABLE `cid_channels_recent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cid_channels_recent_192168001180`
--

DROP TABLE IF EXISTS `cid_channels_recent_192168001180`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cid_channels_recent_192168001180` (
  `caller_id_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `connected_line_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `call_date` datetime DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `dest_channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `linkedid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `dest_uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cid_channels_recent_192168001180`
--

LOCK TABLES `cid_channels_recent_192168001180` WRITE;
/*!40000 ALTER TABLE `cid_channels_recent_192168001180` DISABLE KEYS */;
/*!40000 ALTER TABLE `cid_channels_recent_192168001180` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferences`
--

DROP TABLE IF EXISTS `conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conferences` (
  `conf_exten` int(7) unsigned NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `extenserver` (`conf_exten`,`server_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferences`
--

LOCK TABLES `conferences` WRITE;
/*!40000 ALTER TABLE `conferences` DISABLE KEYS */;
INSERT INTO `conferences` VALUES (8600001,'192.168.1.180',''),(8600002,'192.168.1.180',''),(8600003,'192.168.1.180',''),(8600004,'192.168.1.180',''),(8600005,'192.168.1.180',''),(8600006,'192.168.1.180',''),(8600007,'192.168.1.180',''),(8600008,'192.168.1.180',''),(8600009,'192.168.1.180',''),(8600010,'192.168.1.180',''),(8600011,'192.168.1.180',''),(8600012,'192.168.1.180',''),(8600013,'192.168.1.180',''),(8600014,'192.168.1.180',''),(8600015,'192.168.1.180',''),(8600016,'192.168.1.180',''),(8600017,'192.168.1.180',''),(8600018,'192.168.1.180',''),(8600019,'192.168.1.180',''),(8600020,'192.168.1.180',''),(8600021,'192.168.1.180',''),(8600022,'192.168.1.180',''),(8600023,'192.168.1.180',''),(8600024,'192.168.1.180',''),(8600025,'192.168.1.180',''),(8600026,'192.168.1.180',''),(8600027,'192.168.1.180',''),(8600028,'192.168.1.180',''),(8600029,'192.168.1.180',''),(8600030,'192.168.1.180',''),(8600031,'192.168.1.180',''),(8600032,'192.168.1.180',''),(8600033,'192.168.1.180',''),(8600034,'192.168.1.180',''),(8600035,'192.168.1.180',''),(8600036,'192.168.1.180',''),(8600037,'192.168.1.180',''),(8600038,'192.168.1.180',''),(8600039,'192.168.1.180',''),(8600040,'192.168.1.180',''),(8600041,'192.168.1.180',''),(8600042,'192.168.1.180',''),(8600043,'192.168.1.180',''),(8600044,'192.168.1.180',''),(8600045,'192.168.1.180',''),(8600046,'192.168.1.180',''),(8600047,'192.168.1.180',''),(8600048,'192.168.1.180',''),(8600049,'192.168.1.180','');
/*!40000 ALTER TABLE `conferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_information`
--

DROP TABLE IF EXISTS `contact_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_information` (
  `contact_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `office_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `cell_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `other_num1` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `other_num2` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `bu_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `department` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `group_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `job_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `location` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`contact_id`),
  KEY `ci_first_name` (`first_name`),
  KEY `ci_last_name` (`last_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_information`
--

LOCK TABLES `contact_information` WRITE;
/*!40000 ALTER TABLE `contact_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialable_inventory_snapshots`
--

DROP TABLE IF EXISTS `dialable_inventory_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialable_inventory_snapshots` (
  `snapshot_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `snapshot_time` datetime DEFAULT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `list_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_lastcalldate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_start_inv` mediumint(8) unsigned DEFAULT NULL,
  `dialable_count` mediumint(8) unsigned DEFAULT NULL,
  `dialable_count_nofilter` mediumint(8) unsigned DEFAULT NULL,
  `dialable_count_oneoff` mediumint(8) unsigned DEFAULT NULL,
  `dialable_count_inactive` mediumint(8) unsigned DEFAULT NULL,
  `average_call_count` decimal(3,1) DEFAULT NULL,
  `penetration` decimal(5,2) DEFAULT NULL,
  `shift_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_setting` enum('LOCAL','SERVER') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`snapshot_id`),
  UNIQUE KEY `snapshot_date_list_key` (`snapshot_time`,`list_id`,`time_setting`),
  KEY `snapshot_date_key` (`snapshot_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialable_inventory_snapshots`
--

LOCK TABLES `dialable_inventory_snapshots` WRITE;
/*!40000 ALTER TABLE `dialable_inventory_snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialable_inventory_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_alias`
--

DROP TABLE IF EXISTS `groups_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_alias` (
  `group_alias_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `group_alias_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_id_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_id_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`group_alias_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_alias`
--

LOCK TABLES `groups_alias` WRITE;
/*!40000 ALTER TABLE `groups_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_documentation`
--

DROP TABLE IF EXISTS `help_documentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_documentation` (
  `help_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `help_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`help_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_documentation`
--

LOCK TABLES `help_documentation` WRITE;
/*!40000 ALTER TABLE `help_documentation` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_documentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_attachments`
--

DROP TABLE IF EXISTS `inbound_email_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_row_id` int(10) unsigned DEFAULT NULL,
  `filename` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_encoding` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_extension` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_contents` longblob NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `attachments_email_id_key` (`email_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_attachments`
--

LOCK TABLES `inbound_email_attachments` WRITE;
/*!40000 ALTER TABLE `inbound_email_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_numbers`
--

DROP TABLE IF EXISTS `inbound_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_numbers` (
  `extension` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `full_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `inbound_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_numbers`
--

LOCK TABLES `inbound_numbers` WRITE;
/*!40000 ALTER TABLE `inbound_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_vm_message_groups`
--

DROP TABLE IF EXISTS `leave_vm_message_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_vm_message_groups` (
  `leave_vm_message_group_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `leave_vm_message_group_notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`leave_vm_message_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_vm_message_groups`
--

LOCK TABLES `leave_vm_message_groups` WRITE;
/*!40000 ALTER TABLE `leave_vm_message_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_vm_message_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_vm_message_groups_entries`
--

DROP TABLE IF EXISTS `leave_vm_message_groups_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_vm_message_groups_entries` (
  `leave_vm_message_group_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `audio_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `audio_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `rank` smallint(5) DEFAULT 0,
  `time_start` varchar(4) COLLATE utf8_unicode_ci DEFAULT '0000',
  `time_end` varchar(4) COLLATE utf8_unicode_ci DEFAULT '2400'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_vm_message_groups_entries`
--

LOCK TABLES `leave_vm_message_groups_entries` WRITE;
/*!40000 ALTER TABLE `leave_vm_message_groups_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_vm_message_groups_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_channels`
--

DROP TABLE IF EXISTS `live_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_channels` (
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_data` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_channels`
--

LOCK TABLES `live_channels` WRITE;
/*!40000 ALTER TABLE `live_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_inbound`
--

DROP TABLE IF EXISTS `live_inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_inbound` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `caller_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_ext` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `acknowledged` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `inbound_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_a` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_b` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_c` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_d` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_e` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_inbound`
--

LOCK TABLES `live_inbound` WRITE;
/*!40000 ALTER TABLE `live_inbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_inbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_inbound_log`
--

DROP TABLE IF EXISTS `live_inbound_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_inbound_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `caller_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_ext` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `acknowledged` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `inbound_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_a` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_b` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_c` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_d` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_e` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `uniqueid` (`uniqueid`),
  KEY `phone_ext` (`phone_ext`),
  KEY `start_time` (`start_time`),
  KEY `comment_a` (`comment_a`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_inbound_log`
--

LOCK TABLES `live_inbound_log` WRITE;
/*!40000 ALTER TABLE `live_inbound_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_inbound_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_sip_channels`
--

DROP TABLE IF EXISTS `live_sip_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_sip_channels` (
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_data` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_sip_channels`
--

LOCK TABLES `live_sip_channels` WRITE;
/*!40000 ALTER TABLE `live_sip_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_sip_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nanpa_prefix_exchanges_fast`
--

DROP TABLE IF EXISTS `nanpa_prefix_exchanges_fast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nanpa_prefix_exchanges_fast` (
  `ac_prefix` char(7) COLLATE utf8_unicode_ci DEFAULT '',
  `type` char(1) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `nanpaacprefix` (`ac_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nanpa_prefix_exchanges_fast`
--

LOCK TABLES `nanpa_prefix_exchanges_fast` WRITE;
/*!40000 ALTER TABLE `nanpa_prefix_exchanges_fast` DISABLE KEYS */;
/*!40000 ALTER TABLE `nanpa_prefix_exchanges_fast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nanpa_prefix_exchanges_master`
--

DROP TABLE IF EXISTS `nanpa_prefix_exchanges_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nanpa_prefix_exchanges_master` (
  `areacode` char(3) COLLATE utf8_unicode_ci DEFAULT '',
  `prefix` char(4) COLLATE utf8_unicode_ci DEFAULT '',
  `source` char(1) COLLATE utf8_unicode_ci DEFAULT '',
  `type` char(1) COLLATE utf8_unicode_ci DEFAULT '',
  `tier` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `new_areacode` char(3) COLLATE utf8_unicode_ci DEFAULT '',
  `tzcode` varchar(4) COLLATE utf8_unicode_ci DEFAULT '',
  `region` char(2) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nanpa_prefix_exchanges_master`
--

LOCK TABLES `nanpa_prefix_exchanges_master` WRITE;
/*!40000 ALTER TABLE `nanpa_prefix_exchanges_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `nanpa_prefix_exchanges_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nanpa_wired_to_wireless`
--

DROP TABLE IF EXISTS `nanpa_wired_to_wireless`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nanpa_wired_to_wireless` (
  `phone` char(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nanpa_wired_to_wireless`
--

LOCK TABLES `nanpa_wired_to_wireless` WRITE;
/*!40000 ALTER TABLE `nanpa_wired_to_wireless` DISABLE KEYS */;
/*!40000 ALTER TABLE `nanpa_wired_to_wireless` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nanpa_wireless_to_wired`
--

DROP TABLE IF EXISTS `nanpa_wireless_to_wired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nanpa_wireless_to_wired` (
  `phone` char(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nanpa_wireless_to_wired`
--

LOCK TABLES `nanpa_wireless_to_wired` WRITE;
/*!40000 ALTER TABLE `nanpa_wireless_to_wired` DISABLE KEYS */;
/*!40000 ALTER TABLE `nanpa_wireless_to_wired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park_log`
--

DROP TABLE IF EXISTS `park_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `park_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parked_time` datetime DEFAULT NULL,
  `grab_time` datetime DEFAULT NULL,
  `hangup_time` datetime DEFAULT NULL,
  `parked_sec` int(10) DEFAULT NULL,
  `talked_sec` int(10) DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT 0,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `parked_time` (`parked_time`),
  KEY `lead_id` (`lead_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `uniqueid_park` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park_log`
--

LOCK TABLES `park_log` WRITE;
/*!40000 ALTER TABLE `park_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `park_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park_log_archive`
--

DROP TABLE IF EXISTS `park_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `park_log_archive` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parked_time` datetime DEFAULT NULL,
  `grab_time` datetime DEFAULT NULL,
  `hangup_time` datetime DEFAULT NULL,
  `parked_sec` int(10) DEFAULT NULL,
  `talked_sec` int(10) DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT 0,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `uniqueidtime_park` (`uniqueid`,`parked_time`),
  KEY `parked_time` (`parked_time`),
  KEY `lead_id` (`lead_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `uniqueid_park` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park_log_archive`
--

LOCK TABLES `park_log_archive` WRITE;
/*!40000 ALTER TABLE `park_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `park_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parked_channels`
--

DROP TABLE IF EXISTS `parked_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parked_channels` (
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parked_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parked_time` datetime DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parked_channels`
--

LOCK TABLES `parked_channels` WRITE;
/*!40000 ALTER TABLE `parked_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `parked_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parked_channels_recent`
--

DROP TABLE IF EXISTS `parked_channels_recent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parked_channels_recent` (
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `park_end_time` datetime DEFAULT NULL,
  KEY `channel_group` (`channel_group`),
  KEY `park_end_time` (`park_end_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parked_channels_recent`
--

LOCK TABLES `parked_channels_recent` WRITE;
/*!40000 ALTER TABLE `parked_channels_recent` DISABLE KEYS */;
/*!40000 ALTER TABLE `parked_channels_recent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_favorites`
--

DROP TABLE IF EXISTS `phone_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_favorites` (
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extensions_list` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_favorites`
--

LOCK TABLES `phone_favorites` WRITE;
/*!40000 ALTER TABLE `phone_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones` (
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dialplan_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voicemail_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `computer_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  `messages` int(4) DEFAULT NULL,
  `old_messages` int(4) DEFAULT NULL,
  `protocol` enum('SIP','Zap','IAX2','EXTERNAL') COLLATE utf8_unicode_ci DEFAULT 'SIP',
  `local_gmt` varchar(6) COLLATE utf8_unicode_ci DEFAULT '-5.00',
  `ASTmgrUSERNAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'cron',
  `ASTmgrSECRET` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1234',
  `login_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_pass` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_campaign` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `park_on_extension` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8301',
  `conf_on_extension` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8302',
  `VICIDIAL_park_on_extension` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8301',
  `VICIDIAL_park_on_filename` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'park',
  `monitor_prefix` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8612',
  `recording_exten` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8309',
  `voicemail_exten` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8501',
  `voicemail_dump_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '85026666666666',
  `ext_context` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dtmf_send_extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'local/8500998@default',
  `call_out_number_group` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'Zap/g2/',
  `client_browser` varchar(100) COLLATE utf8_unicode_ci DEFAULT '/usr/bin/mozilla',
  `install_directory` varchar(100) COLLATE utf8_unicode_ci DEFAULT '/usr/local/perl_TK',
  `local_web_callerID_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'http://www.vicidial.org/test_callerid_output.php',
  `VICIDIAL_web_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'http://www.vicidial.org/test_VICIDIAL_output.php',
  `AGI_call_logging_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `user_switching_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `conferencing_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `admin_hangup_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_hijack_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_monitor_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `call_parking_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `updater_check_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `AFLogging_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `QUEUE_ACTION_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `CallerID_popup_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `voicemail_button_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `enable_fast_refresh` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `fast_refresh_rate` int(5) DEFAULT 1000,
  `enable_persistant_mysql` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `auto_dial_next_number` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `VDstop_rec_after_each_call` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `DBX_server` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DBX_database` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'asterisk',
  `DBX_user` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'cron',
  `DBX_pass` varchar(15) COLLATE utf8_unicode_ci DEFAULT '1234',
  `DBX_port` int(6) DEFAULT 3306,
  `DBY_server` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DBY_database` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'asterisk',
  `DBY_user` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'cron',
  `DBY_pass` varchar(15) COLLATE utf8_unicode_ci DEFAULT '1234',
  `DBY_port` int(6) DEFAULT 3306,
  `outbound_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_sipsak_messages` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `conf_override` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_context` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `phone_ring_timeout` smallint(3) DEFAULT 60,
  `conf_secret` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'test',
  `delete_vm_after_email` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `is_webphone` enum('Y','N','Y_API_LAUNCH') COLLATE utf8_unicode_ci DEFAULT 'N',
  `use_external_server_ip` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `codecs_list` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `codecs_with_template` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `webphone_dialpad` enum('Y','N','TOGGLE','TOGGLE_OFF') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `on_hook_agent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `webphone_auto_answer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `voicemail_timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'eastern',
  `voicemail_options` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `voicemail_greeting` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `voicemail_dump_exten_no_inst` varchar(20) COLLATE utf8_unicode_ci DEFAULT '85026666666667',
  `voicemail_instructions` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `on_login_report` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `unavail_dialplan_fwd_exten` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `unavail_dialplan_fwd_context` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `nva_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nva_search_method` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `nva_error_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `nva_new_list_id` bigint(14) unsigned DEFAULT 995,
  `nva_new_phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  `nva_new_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NVAINS',
  `webphone_dialbox` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `webphone_mute` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `webphone_volume` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `webphone_debug` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `outbound_alt_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `conf_qualify` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `webphone_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `mohsuggest` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `peer_status` enum('UNKNOWN','REGISTERED','UNREGISTERED','REACHABLE','LAGGED','UNREACHABLE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UNKNOWN',
  `ping_time` smallint(6) DEFAULT NULL,
  UNIQUE KEY `extenserver` (`extension`,`server_ip`),
  KEY `server_ip` (`server_ip`),
  KEY `voicemail_id` (`voicemail_id`),
  KEY `dialplan_number` (`dialplan_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones`
--

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
INSERT INTO `phones` VALUES ('gs102','102','102','10.10.10.16','10.10.9.16','192.168.1.180','gs102','test','ADMIN','Y','Grandstream BT 102','Test Admin Phone','TEST','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,NULL,'0',NULL,'',NULL,'default',60,'admin','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL),('callin','8300','8300','192.168.1.180','192.168.1.180','192.168.1.180','callin','test','ACTIVE','Y','Dial-in agent phone','Dial-in Agent Phone','TEST',NULL,0,0,'EXTERNAL','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,NULL,'0',NULL,'',NULL,'default',60,'admin','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL);
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones_alias`
--

DROP TABLE IF EXISTS `phones_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones_alias` (
  `alias_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `alias_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logins_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`alias_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones_alias`
--

LOCK TABLES `phones_alias` WRITE;
/*!40000 ALTER TABLE `phones_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `phones_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_control_checkpoint_log`
--

DROP TABLE IF EXISTS `quality_control_checkpoint_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_control_checkpoint_log` (
  `qc_checkpoint_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qc_log_id` int(10) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkpoint_row_id` int(10) unsigned DEFAULT NULL,
  `checkpoint_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkpoint_text_presets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkpoint_rank` tinyint(3) unsigned DEFAULT NULL,
  `checkpoint_points` tinyint(3) unsigned DEFAULT NULL,
  `instant_fail` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `instant_fail_value` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `checkpoint_points_earned` tinyint(5) unsigned DEFAULT NULL,
  `qc_agent` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkpoint_comment_agent` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`qc_checkpoint_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_control_checkpoint_log`
--

LOCK TABLES `quality_control_checkpoint_log` WRITE;
/*!40000 ALTER TABLE `quality_control_checkpoint_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_control_checkpoint_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_control_checkpoints`
--

DROP TABLE IF EXISTS `quality_control_checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_control_checkpoints` (
  `checkpoint_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkpoint_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkpoint_text_presets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkpoint_rank` int(3) unsigned DEFAULT NULL,
  `checkpoint_points` tinyint(3) unsigned DEFAULT NULL,
  `instant_fail` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `admin_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_ids` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingroups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_ids` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_user` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modify_user` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`checkpoint_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_control_checkpoints`
--

LOCK TABLES `quality_control_checkpoints` WRITE;
/*!40000 ALTER TABLE `quality_control_checkpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_control_checkpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_control_queue`
--

DROP TABLE IF EXISTS `quality_control_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_control_queue` (
  `qc_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qc_display_method` enum('CALL','LEAD') COLLATE utf8_unicode_ci DEFAULT 'CALL',
  `lead_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `agent_log_id` int(9) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `scorecard_source` enum('CAMPAIGN','INGROUP','LIST') COLLATE utf8_unicode_ci DEFAULT 'CAMPAIGN',
  `qc_web_form_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vicidial_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recording_id` int(10) unsigned DEFAULT NULL,
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_agent` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_claimed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  PRIMARY KEY (`qc_log_id`),
  UNIQUE KEY `quality_control_queue_agent_log_id_key` (`agent_log_id`),
  KEY `quality_control_queue_lead_id_key` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_control_queue`
--

LOCK TABLES `quality_control_queue` WRITE;
/*!40000 ALTER TABLE `quality_control_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_control_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_control_scorecards`
--

DROP TABLE IF EXISTS `quality_control_scorecards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality_control_scorecards` (
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `scorecard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `passing_score` smallint(5) unsigned DEFAULT 0,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`qc_scorecard_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_control_scorecards`
--

LOCK TABLES `quality_control_scorecards` WRITE;
/*!40000 ALTER TABLE `quality_control_scorecards` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_control_scorecards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_log`
--

DROP TABLE IF EXISTS `recording_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording_log` (
  `recording_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` mediumint(8) unsigned DEFAULT NULL,
  `length_in_min` double(8,2) DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vicidial_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`recording_id`),
  KEY `filename` (`filename`),
  KEY `lead_id` (`lead_id`),
  KEY `user` (`user`),
  KEY `vicidial_id` (`vicidial_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_log`
--

LOCK TABLES `recording_log` WRITE;
/*!40000 ALTER TABLE `recording_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_log_archive`
--

DROP TABLE IF EXISTS `recording_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording_log_archive` (
  `recording_id` int(10) unsigned NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` mediumint(8) unsigned DEFAULT NULL,
  `length_in_min` double(8,2) DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vicidial_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `recording_id` (`recording_id`),
  KEY `filename` (`filename`),
  KEY `lead_id` (`lead_id`),
  KEY `user` (`user`),
  KEY `vicidial_id` (`vicidial_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_log_archive`
--

LOCK TABLES `recording_log_archive` WRITE;
/*!40000 ALTER TABLE `recording_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_log_deletion_queue`
--

DROP TABLE IF EXISTS `recording_log_deletion_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recording_log_deletion_queue` (
  `recording_id` int(9) unsigned NOT NULL,
  `lead_id` int(10) unsigned DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_queued` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`recording_id`),
  KEY `date_deleted` (`date_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_log_deletion_queue`
--

LOCK TABLES `recording_log_deletion_queue` WRITE;
/*!40000 ALTER TABLE `recording_log_deletion_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording_log_deletion_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routing_initiated_recordings`
--

DROP TABLE IF EXISTS `routing_initiated_recordings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routing_initiated_recordings` (
  `recording_id` int(10) unsigned NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `launch_time` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `vicidial_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`recording_id`),
  KEY `lead_id` (`lead_id`),
  KEY `user` (`user`),
  KEY `processed` (`processed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routing_initiated_recordings`
--

LOCK TABLES `routing_initiated_recordings` WRITE;
/*!40000 ALTER TABLE `routing_initiated_recordings` DISABLE KEYS */;
/*!40000 ALTER TABLE `routing_initiated_recordings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_performance`
--

DROP TABLE IF EXISTS `server_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_performance` (
  `start_time` datetime NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sysload` int(6) NOT NULL,
  `freeram` smallint(5) unsigned NOT NULL,
  `usedram` smallint(5) unsigned NOT NULL,
  `processes` smallint(4) unsigned NOT NULL,
  `channels_total` smallint(4) unsigned NOT NULL,
  `trunks_total` smallint(4) unsigned NOT NULL,
  `clients_total` smallint(4) unsigned NOT NULL,
  `clients_zap` smallint(4) unsigned NOT NULL,
  `clients_iax` smallint(4) unsigned NOT NULL,
  `clients_local` smallint(4) unsigned NOT NULL,
  `clients_sip` smallint(4) unsigned NOT NULL,
  `live_recordings` smallint(4) unsigned NOT NULL,
  `cpu_user_percent` smallint(3) unsigned NOT NULL DEFAULT 0,
  `cpu_system_percent` smallint(3) unsigned NOT NULL DEFAULT 0,
  `cpu_idle_percent` smallint(3) unsigned NOT NULL DEFAULT 0,
  `disk_reads` mediumint(7) DEFAULT NULL,
  `disk_writes` mediumint(7) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_performance`
--

LOCK TABLES `server_performance` WRITE;
/*!40000 ALTER TABLE `server_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_updater`
--

DROP TABLE IF EXISTS `server_updater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_updater` (
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `db_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `serverip` (`server_ip`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_updater`
--

LOCK TABLES `server_updater` WRITE;
/*!40000 ALTER TABLE `server_updater` DISABLE KEYS */;
INSERT INTO `server_updater` VALUES ('192.168.1.180','2021-07-11 12:40:05','2021-07-11 07:10:05');
/*!40000 ALTER TABLE `server_updater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `server_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `server_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `asterisk_version` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1.4.21.2',
  `max_vicidial_trunks` smallint(4) DEFAULT 23,
  `telnet_host` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'localhost',
  `telnet_port` int(5) NOT NULL DEFAULT 5038,
  `ASTmgrUSERNAME` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cron',
  `ASTmgrSECRET` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1234',
  `ASTmgrUSERNAMEupdate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'updatecron',
  `ASTmgrUSERNAMElisten` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'listencron',
  `ASTmgrUSERNAMEsend` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sendcron',
  `local_gmt` varchar(6) COLLATE utf8_unicode_ci DEFAULT '-5.00',
  `voicemail_dump_exten` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '85026666666666',
  `answer_transfer_agent` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '8365',
  `ext_context` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `sys_perf_log` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `vd_server_logs` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agi_output` enum('NONE','STDERR','FILE','BOTH') COLLATE utf8_unicode_ci DEFAULT 'FILE',
  `vicidial_balance_active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `balance_trunks_offlimits` smallint(5) unsigned DEFAULT 0,
  `recording_web_link` enum('SERVER_IP','ALT_IP','EXTERNAL_IP') COLLATE utf8_unicode_ci DEFAULT 'SERVER_IP',
  `alt_server_ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `active_asterisk_server` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `generate_vicidial_conf` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `rebuild_conf_files` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `outbound_calls_per_second` smallint(3) unsigned DEFAULT 5,
  `sysload` int(6) NOT NULL DEFAULT 0,
  `channels_total` smallint(4) unsigned NOT NULL DEFAULT 0,
  `cpu_idle_percent` smallint(3) unsigned NOT NULL DEFAULT 0,
  `disk_usage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1',
  `sounds_update` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `vicidial_recording_limit` mediumint(8) DEFAULT 60,
  `carrier_logging_active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `vicidial_balance_rank` tinyint(3) unsigned DEFAULT 0,
  `rebuild_music_on_hold` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `active_agent_login_server` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `conf_secret` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'test',
  `external_server_ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_dialplan_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_twin_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `audio_store_purge` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `svn_revision` int(9) DEFAULT 0,
  `svn_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_uptime` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `auto_restart_asterisk` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `asterisk_temp_no_restart` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `voicemail_dump_exten_no_inst` varchar(20) COLLATE utf8_unicode_ci DEFAULT '85026666666667',
  `gather_asterisk_output` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `web_socket_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `conf_qualify` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `routing_prefix` varchar(10) COLLATE utf8_unicode_ci DEFAULT '13',
  `external_web_socket_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `server_id` (`server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES ('vicibox9','Server vicibox9','192.168.1.180','Y','13.29.2-vici',23,'localhost',5038,'cron','1234','updatecron','listencron','sendcron','-5.00','85026666666666','8365','default','N','Y','FILE','Y',0,'SERVER_IP','','Y','Y','N',5,40,0,95,'1 0|2 0|3 6|4 0|5 2|6 0|7 31|8 6|9 0|','N',60,'Y',0,'N','Y','admin','223.177.187.68',NULL,'','---ALL---',NULL,3478,'/usr/src/astguiclient/trunk\nPath: .\nWorking Copy Root Path: /usr/src/astguiclient/trunk\nURL: svn://svn.eflo.net/agc_2-X/trunk\nRelative URL: ^/agc_2-X/trunk\nRepository Root: svn://svn.eflo.net\nRepository UUID: 3d104415-ff17-0410-8863-d5cf3c621b8a\nRevision: 3478\nNode Kind: directory\nSchedule: normal\nLast Changed Author: mattf\nLast Changed Rev: 3478\nLast Changed Date: 2021-07-08 04:29:24 +0530 (Thu, 08 Jul 2021)\n\n\n','1:17','N','N','85026666666667','N','','Y','13','');
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `install_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_non_latin` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `webroot_writable` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `enable_queuemetrics_logging` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_dbname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_log_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'VIC',
  `queuemetrics_eq_prepend` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `vicidial_agent_disable` enum('NOT_ACTIVE','LIVE_AGENT','EXTERNAL','ALL') COLLATE utf8_unicode_ci DEFAULT 'ALL',
  `allow_sipsak_messages` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_home_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '../vicidial/welcome.php',
  `enable_agc_xfer_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `db_schema_version` int(8) unsigned DEFAULT 0,
  `auto_user_add_value` int(9) unsigned DEFAULT 101,
  `timeclock_end_of_day` varchar(4) COLLATE utf8_unicode_ci DEFAULT '0000',
  `timeclock_last_reset_date` date DEFAULT NULL,
  `vdc_header_date_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'MS_DASH_24HR  2008-06-24 23:59:59',
  `vdc_customer_date_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'AL_TEXT_AMPM  OCT 24, 2008 11:59:59 PM',
  `vdc_header_phone_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'US_PARN (000)000-0000',
  `vdc_agent_api_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `qc_last_pull_time` datetime DEFAULT NULL,
  `enable_vtiger_integration` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `vtiger_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtiger_dbname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtiger_login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtiger_pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtiger_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_features_active` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `outbound_autodial_active` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '1',
  `outbound_calls_per_second` smallint(3) unsigned DEFAULT 10,
  `enable_tts_integration` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agentonly_callback_campaign_lock` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `sounds_central_control_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `sounds_web_server` varchar(50) COLLATE utf8_unicode_ci DEFAULT '127.0.0.1',
  `sounds_web_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `active_voicemail_server` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `auto_dial_limit` varchar(5) COLLATE utf8_unicode_ci DEFAULT '4',
  `user_territories_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_custom_dialplan` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `db_schema_update_date` datetime DEFAULT NULL,
  `enable_second_webform` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `default_webphone` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `default_external_server_ip` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `webphone_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `static_agent_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `default_phone_code` varchar(8) COLLATE utf8_unicode_ci DEFAULT '1',
  `enable_agc_dispo_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_dialplan_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_loginout` enum('STANDARD','CALLBACK','NONE') COLLATE utf8_unicode_ci DEFAULT 'STANDARD',
  `callcard_enabled` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_callstatus` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `default_codecs` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_fields_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_web_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'vicidial',
  `label_title` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_first_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_middle_initial` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_last_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address1` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address2` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address3` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_city` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_state` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_province` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_postal_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_vendor_lead_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_gender` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_phone_number` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_phone_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_alt_phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_security_phrase` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_email` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_comments` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `slave_db_server` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `reports_use_slave_db` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `webphone_systemkey` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `first_login_trigger` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hosted_settings` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `default_phone_registration_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'test',
  `default_phone_login_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'test',
  `default_server_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'test',
  `admin_modify_refresh` smallint(5) unsigned DEFAULT 0,
  `nocache_admin` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `generate_cross_server_exten` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_addmember_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_dispo_pause` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `label_hide_field_logs` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `queuemetrics_pe_phone_append` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `test_campaign_calls` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agents_calls_reset` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `voicemail_timezones` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_voicemail_timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'eastern',
  `default_local_gmt` varchar(6) COLLATE utf8_unicode_ci DEFAULT '-5.00',
  `noanswer_log` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `alt_log_server_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `alt_log_dbname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `alt_log_login` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `alt_log_pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `tables_use_alt_log_db` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `did_agent_log` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `campaign_cid_areacodes_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `pllb_grouping_limit` smallint(5) DEFAULT 100,
  `did_ra_extensions_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `expanded_list_stats` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `contacts_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `svn_version` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `call_menu_qualify_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_list_counts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `allow_voicemail_greeting` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `audio_store_purge` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `svn_revision` int(9) DEFAULT 0,
  `queuemetrics_socket` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `queuemetrics_socket_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enhanced_disconnect_logging` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_emails` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `level_8_disable_add` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `pass_hash_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `pass_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `pass_cost` tinyint(2) unsigned DEFAULT 2,
  `disable_auto_dial` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_record_hold` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `country_code_list_stats` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `reload_timestamp` datetime DEFAULT NULL,
  `queuemetrics_pause_type` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `frozen_server_call_clear` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `callback_time_24hour` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `active_modules` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_chats` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_languages` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `language_method` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `meetme_enter_login_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `meetme_enter_leave3way_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `enable_did_entry_list_id` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_third_webform` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `chat_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_timeout` int(3) unsigned DEFAULT NULL,
  `agent_debug_logging` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `default_language` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default English',
  `agent_whisper_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_hide_realtime_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_reports_use_slave_db` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `usacan_phone_dialcode_fix` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `cache_carrier_stats_realtime` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `oldest_logs_date` datetime DEFAULT NULL,
  `log_recording_access` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `report_default_format` enum('TEXT','HTML') COLLATE utf8_unicode_ci DEFAULT 'TEXT',
  `alt_ivr_logging` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_row_click` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `admin_screen_colors` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `ofcom_uk_drop_calc` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_screen_colors` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `script_remove_js` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '1',
  `manual_auto_next` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_new_lead_limit` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_xfer_park_3way` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `rec_prompt_count` int(9) unsigned DEFAULT 0,
  `agent_soundboards` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `web_loader_phone_length` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_script` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'vicidial.php',
  `vdad_debug_logging` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_chat_screen_colors` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `enable_auto_reports` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_pause_code_limits` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_drop_lists` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_ip_lists` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `system_ip_blacklist` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_push_events` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_push_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hide_inactive_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_manage_active_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `expired_lists_inactive` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `did_system_filter` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `anyone_callback_inactive_lists` enum('default','NO_ADD_TO_HOPPER','KEEP_IN_HOPPER') COLLATE utf8_unicode_ci DEFAULT 'default',
  `enable_gdpr_download_deletion` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `source_id_display` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `help_modification_date` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_logout_link` enum('0','1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '1',
  `manual_dial_validation` enum('0','1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '0',
  `mute_recordings` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_admin_redirect` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `list_status_modification_confirmation` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `sip_event_logging` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `call_quota_lead_ranking` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_second_script` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_first_webform` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `recording_buttons` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'START_STOP',
  `opensips_cid_name` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `require_password_length` tinyint(3) unsigned DEFAULT 0,
  `user_account_emails` enum('DISABLED','SEND_NO_PASS','SEND_WITH_PASS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `outbound_cid_any` enum('DISABLED','API_ONLY') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `entries_per_page` smallint(5) unsigned DEFAULT 0,
  `browser_call_alerts` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_pausereason` enum('STANDARD','EVERY_NEW','EVERY_NEW_ADMINCALL','EVERY_NEW_ALLCALL') COLLATE utf8_unicode_ci DEFAULT 'STANDARD',
  `inbound_answer_config` enum('0','1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_international_dncs` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `web_loader_phone_strip` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manual_dial_phone_strip` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `daily_call_count_limit` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_shared_dial` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_search_method` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `phone_defaults_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `qc_claim_limit` tinyint(3) unsigned DEFAULT 3,
  `qc_expire_days` tinyint(3) unsigned DEFAULT 3,
  `two_factor_auth_hours` smallint(5) DEFAULT 0,
  `two_factor_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `agent_hidden_sound` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'click_quiet',
  `agent_hidden_sound_volume` tinyint(3) unsigned DEFAULT 25,
  `agent_hidden_sound_seconds` tinyint(3) unsigned DEFAULT 0,
  `agent_screen_timer` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'setTimeout',
  `label_lead_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_list_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_entry_date` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_gmt_offset_now` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_source_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_called_since_last_reset` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_status` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_user` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_date_of_birth` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_country_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_last_local_call_time` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_called_count` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_rank` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_owner` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_entry_list_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES ('2.14b0.5','2021-07-08','0','1','0',NULL,NULL,NULL,NULL,NULL,'VIC','NONE','ALL','0','../vicidial/welcome.php','0',1638,101,'0000','2021-07-11','MS_DASH_24HR  2008-06-24 23:59:59','AL_TEXT_AMPM  OCT 24, 2008 11:59:59 PM','US_PARN (000)000-0000','1','2021-07-08 18:33:35','0',NULL,NULL,NULL,NULL,NULL,'0','1',10,'0','1','1','192.168.1.180','k60jZbpOodnMUQWSLwenQajG771qNTua','192.168.1.180','4','0','1','2021-07-08 18:33:45','1','0','0','https://phone.viciphone.com/viciphone.php','','1','0',NULL,'STANDARD','0','1','','0','vicidial','','','','','','','','','','','','','','','','','','','','','','','N','','admin','test','admin',0,'1','0','0','','Y','0','0','1','newzealand=Pacific/Auckland\naustraliaeast=Australia/Sydney\naustraliacentral=Australia/Adelaide\naustraliawest=Australia/Perth\njapan=Asia/Tokyo\nphilippines=Asia/Manila\nchina=Asia/Shanghai\nmalaysia=Asia/Kuala_Lumpur\nthailand=Asia/Bangkok\nindia=Asia/Calcutta\npakistan=Asia/Karachi\nrussiaeast=Europe/Moscow\nkenya=Africa/Nairobi\neuropeaneast=Europe/Kiev\nsouthafrica=Africa/Johannesburg\neuropean=Europe/Copenhagen\nnigeria=Africa/Lagos\nuk=Europe/London\nbrazil=America/Sao_Paulo\nnewfoundland=Canada/Newfoundland\ncarribeaneast=America/Santo_Domingo\natlantic=Canada/Atlantic\nchile=America/Santiago\neastern=America/New_York\nperu=America/Lima\ncentral=America/Chicago\nmexicocity=America/Mexico_City\nmountain=America/Denver\narizona=America/Phoenix\nsaskatchewan=America/Saskatchewan\npacific=America/Los_Angeles\nalaska=America/Anchorage\nhawaii=Pacific/Honolulu\neastern24=America/New_York\ncentral24=America/Chicago\nmountain24=America/Denver\npacific24=America/Los_Angeles\nmilitary=Zulu\n','eastern','-5.00','N','','','','','','N','1',100,'0','1','0','','0','1','0',NULL,3478,'NONE',NULL,'0','0','0','0','7asfBStb2Gf49Dsj',2,'0','0','0','2021-07-08 18:33:45','0','0','0',NULL,'0','0','DISABLED','','','0','0',NULL,NULL,'0','default English','0','0','','0','0',NULL,'0','TEXT','0','1','default','0','default','1','0','0','0',0,'0','DISABLED','vicidial.php','0','default','0','0','0','0','','0',NULL,'0','0','0','0','default','0','0','0','1','0','0','0','0','0','0','0','1','START_STOP','0',0,'DISABLED','DISABLED',0,'0','STANDARD','0','0','DISABLED','DISABLED','0','0','0','---DISABLED---',3,3,0,'---DISABLED---','click_quiet',25,0,'setTimeout','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twoday_call_log`
--

DROP TABLE IF EXISTS `twoday_call_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twoday_call_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_dialed` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `start_epoch` int(10) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `end_epoch` int(10) DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `length_in_min` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `caller_code` (`caller_code`),
  KEY `server_ip` (`server_ip`),
  KEY `channel` (`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twoday_call_log`
--

LOCK TABLES `twoday_call_log` WRITE;
/*!40000 ALTER TABLE `twoday_call_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `twoday_call_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twoday_recording_log`
--

DROP TABLE IF EXISTS `twoday_recording_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twoday_recording_log` (
  `recording_id` int(10) unsigned NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` mediumint(8) unsigned DEFAULT NULL,
  `length_in_min` double(8,2) DEFAULT NULL,
  `filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vicidial_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`recording_id`),
  KEY `filename` (`filename`),
  KEY `lead_id` (`lead_id`),
  KEY `user` (`user`),
  KEY `vicidial_id` (`vicidial_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twoday_recording_log`
--

LOCK TABLES `twoday_recording_log` WRITE;
/*!40000 ALTER TABLE `twoday_recording_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `twoday_recording_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twoday_vicidial_agent_log`
--

DROP TABLE IF EXISTS `twoday_vicidial_agent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twoday_vicidial_agent_log` (
  `agent_log_id` int(9) unsigned NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `event_time` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pause_epoch` int(10) unsigned DEFAULT NULL,
  `pause_sec` smallint(5) unsigned DEFAULT 0,
  `wait_epoch` int(10) unsigned DEFAULT NULL,
  `wait_sec` smallint(5) unsigned DEFAULT 0,
  `talk_epoch` int(10) unsigned DEFAULT NULL,
  `talk_sec` smallint(5) unsigned DEFAULT 0,
  `dispo_epoch` int(10) unsigned DEFAULT NULL,
  `dispo_sec` smallint(5) unsigned DEFAULT 0,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dead_epoch` int(10) unsigned DEFAULT NULL,
  `dead_sec` smallint(5) unsigned DEFAULT 0,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`agent_log_id`),
  KEY `lead_id` (`lead_id`),
  KEY `user` (`user`),
  KEY `event_time` (`event_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twoday_vicidial_agent_log`
--

LOCK TABLES `twoday_vicidial_agent_log` WRITE;
/*!40000 ALTER TABLE `twoday_vicidial_agent_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `twoday_vicidial_agent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twoday_vicidial_closer_log`
--

DROP TABLE IF EXISTS `twoday_vicidial_closer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twoday_vicidial_closer_log` (
  `closecallid` int(9) unsigned NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `queue_seconds` decimal(7,2) DEFAULT 0.00,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xfercallid` int(9) unsigned DEFAULT NULL,
  `term_reason` enum('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','HOLDRECALLXFER','HOLDTIME','NOAGENT','NONE','MAXCALLS','ACFILTER') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `agent_only` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `queue_position` smallint(4) unsigned DEFAULT 1,
  `called_count` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`closecallid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `campaign_id` (`campaign_id`),
  KEY `uniqueid` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twoday_vicidial_closer_log`
--

LOCK TABLES `twoday_vicidial_closer_log` WRITE;
/*!40000 ALTER TABLE `twoday_vicidial_closer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `twoday_vicidial_closer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twoday_vicidial_log`
--

DROP TABLE IF EXISTS `twoday_vicidial_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twoday_vicidial_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term_reason` enum('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','NONE','SYSTEM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `alt_dial` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  PRIMARY KEY (`uniqueid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twoday_vicidial_log`
--

LOCK TABLES `twoday_vicidial_log` WRITE;
/*!40000 ALTER TABLE `twoday_vicidial_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `twoday_vicidial_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twoday_vicidial_xfer_log`
--

DROP TABLE IF EXISTS `twoday_vicidial_xfer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twoday_vicidial_xfer_log` (
  `xfercallid` int(9) unsigned NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closer` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`xfercallid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twoday_vicidial_xfer_log`
--

LOCK TABLES `twoday_vicidial_xfer_log` WRITE;
/*!40000 ALTER TABLE `twoday_vicidial_xfer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `twoday_vicidial_xfer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_call_log`
--

DROP TABLE IF EXISTS `user_call_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_call_log` (
  `user_call_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `call_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_dialed` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_alias_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preset_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_hungup` enum('BEFORE_CALL','DURING_CALL','') COLLATE utf8_unicode_ci DEFAULT '',
  `customer_hungup_seconds` smallint(5) unsigned DEFAULT 0,
  `xfer_hungup` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `xfer_hungup_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_call_log_id`),
  KEY `user` (`user`),
  KEY `call_date` (`call_date`),
  KEY `group_alias_id` (`group_alias_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_call_log`
--

LOCK TABLES `user_call_log` WRITE;
/*!40000 ALTER TABLE `user_call_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_call_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_call_log_archive`
--

DROP TABLE IF EXISTS `user_call_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_call_log_archive` (
  `user_call_log_id` int(9) unsigned NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `call_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_dialed` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_alias_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preset_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_hungup` enum('BEFORE_CALL','DURING_CALL','') COLLATE utf8_unicode_ci DEFAULT '',
  `customer_hungup_seconds` smallint(5) unsigned DEFAULT 0,
  `xfer_hungup` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `xfer_hungup_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_call_log_id`),
  KEY `user` (`user`),
  KEY `call_date` (`call_date`),
  KEY `group_alias_id` (`group_alias_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_call_log_archive`
--

LOCK TABLES `user_call_log_archive` WRITE;
/*!40000 ALTER TABLE `user_call_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_call_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicibox`
--

DROP TABLE IF EXISTS `vicibox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicibox` (
  `server_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(32) NOT NULL,
  `server_ip` varchar(32) NOT NULL,
  `server_type` enum('Database','Web','Telephony','Archive') NOT NULL DEFAULT 'Telephony',
  `field1` varchar(64) DEFAULT NULL,
  `field2` varchar(64) DEFAULT NULL,
  `field3` varchar(64) DEFAULT NULL,
  `field4` varchar(64) DEFAULT NULL,
  `field5` varchar(64) DEFAULT NULL,
  `field6` varchar(64) DEFAULT NULL,
  `field7` varchar(64) DEFAULT NULL,
  `field8` varchar(64) DEFAULT NULL,
  `field9` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`server_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicibox`
--

LOCK TABLES `vicibox` WRITE;
/*!40000 ALTER TABLE `vicibox` DISABLE KEYS */;
INSERT INTO `vicibox` VALUES (1,'vicibox9','127.0.0.1','Database','0','asterisk','3478','cron','1234','custom','custom1234','slave','slave1234'),(2,'vicibox9','192.168.1.180','Web','223.177.187.68','k60jZbpOodnMUQWSLwenQajG771qNTua',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'vicibox9','192.168.1.180','Telephony','223.177.187.68',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vicibox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_admin_log`
--

DROP TABLE IF EXISTS `vicidial_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_admin_log` (
  `admin_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `event_date` datetime NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `event_section` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `event_type` enum('ADD','COPY','LOAD','RESET','MODIFY','DELETE','SEARCH','LOGIN','LOGOUT','CLEAR','OVERRIDE','EXPORT','OTHER') COLLATE utf8_unicode_ci DEFAULT 'OTHER',
  `record_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `event_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_sql` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_notes` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`admin_log_id`),
  KEY `user` (`user`),
  KEY `event_section` (`event_section`),
  KEY `record_id` (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_admin_log`
--

LOCK TABLES `vicidial_admin_log` WRITE;
/*!40000 ALTER TABLE `vicidial_admin_log` DISABLE KEYS */;
INSERT INTO `vicidial_admin_log` VALUES (1,'2021-07-09 09:59:12','6666','192.168.1.2','USERS','MODIFY','6666','INITIAL SETTINGS UPDATE','UPDATE vicidial_users SET pass=\'admin\',pass_hash=\'\',force_change_password=\'N\',failed_login_count=0 where user=\'6666\' and active=\'Y\' and user_level > 6|UPDATE system_settings SET first_login_trigger=\'N\',default_phone_registration_password=\'admin\',default_phone_login_password=\'test\',default_server_password=\'admin\',default_local_gmt=\'-5.00\',default_voicemail_timezone=\'eastern\'|UPDATE phones SET conf_secret=\'admin\',pass=\'test\',local_gmt=\'-5.00\',voicemail_timezone=\'eastern\'|UPDATE servers SET conf_secret=\'admin\',rebuild_conf_files=\'Y\'|','','---ALL---'),(2,'2021-07-10 07:30:05','6666','192.168.1.2','USERS','MODIFY','6666','ADMIN MODIFY USER','UPDATE vicidial_users set pass=\'admin\',full_name=\'Admin\',user_level=\'9\',user_group=\'ADMIN\',phone_login=\'\',phone_pass=\'\',delete_users=\'1\',delete_user_groups=\'1\',delete_lists=\'1\',delete_campaigns=\'1\',delete_ingroups=\'1\',delete_remote_agents=\'1\',load_leads=\'1\',campaign_detail=\'1\',ast_admin_access=\'1\',ast_delete_phones=\'1\',delete_scripts=\'1\',modify_leads=\'5\',hotkeys_active=\'0\',change_agent_campaign=\'1\',agent_choose_ingroups=\'1\',closer_campaigns=\'\',scheduled_callbacks=\'1\',agentonly_callbacks=\'0\',agentcall_manual=\'0\',vicidial_recording=\'1\',vicidial_transfers=\'1\',delete_filters=\'1\',alter_agent_interface_options=\'1\',closer_default_blended=\'0\',delete_call_times=\'1\',modify_call_times=\'1\',modify_users=\'1\',modify_campaigns=\'1\',modify_lists=\'1\',modify_scripts=\'1\',modify_filters=\'1\',modify_ingroups=\'1\',modify_usergroups=\'1\',modify_remoteagents=\'1\',modify_servers=\'1\',view_reports=\'1\',vicidial_recording_override=\'DISABLED\',alter_custdata_override=\'NOT_ACTIVE\',qc_enabled=\'0\',qc_user_level=\'1\',qc_pass=\'0\',qc_finish=\'0\',qc_commit=\'0\',add_timeclock_log=\'1\',modify_timeclock_log=\'1\',delete_timeclock_log=\'1\',alter_custphone_override=\'NOT_ACTIVE\',vdc_agent_api_access=\'0\',modify_inbound_dids=\'1\',delete_inbound_dids=\'1\',active=\'Y\',download_lists=\'1\',agent_shift_enforcement_override=\'DISABLED\',manager_shift_enforcement_override=\'1\',export_reports=\'1\',delete_from_dnc=\'1\',email=\'\',user_code=\'\',territory=\'\',allow_alerts=\'0\',agent_choose_territories=\'0\',custom_one=\'\',custom_two=\'\',custom_three=\'\',custom_four=\'\',custom_five=\'\',voicemail_id=\'\',agent_call_log_view_override=\'DISABLED\',callcard_admin=\'1\',agent_choose_blended=\'1\',realtime_block_user_info=\'0\',custom_fields_modify=\'0\',force_change_password=\'N\',agent_lead_search_override=\'NOT_ACTIVE\',modify_shifts=\'1\',modify_phones=\'1\',modify_carriers=\'1\',modify_labels=\'1\',modify_statuses=\'1\',modify_voicemail=\'1\',modify_audiostore=\'1\',modify_moh=\'1\',modify_tts=\'1\',preset_contact_search=\'NOT_ACTIVE\',modify_contacts=\'1\',modify_same_user_level=\'1\',admin_hide_lead_data=\'0\',admin_hide_phone_data=\'0\',agentcall_email=\'0\',agentcall_chat=\'0\',modify_email_accounts=\'0\',failed_login_count=0,alter_admin_interface_options=\'1\',max_inbound_calls=\'0\',modify_custom_dialplans=\'1\',wrapup_seconds_override=\'-1\',modify_languages=\'0\',selected_language=\'default English\',user_choose_language=\'0\',ignore_group_on_search=\'0\',api_list_restrict=\'0\',api_allowed_functions=\' ALL_FUNCTIONS \',lead_filter_id=\'NONE\',admin_cf_show_hidden=\'0\',user_hide_realtime=\'0\',access_recordings=\'0\',modify_colors=\'1\',user_nickname=\'\',user_new_lead_limit=\'-1\',api_only_user=\'0\',modify_auto_reports=\'0\',modify_ip_lists=\'0\',ignore_ip_list=\'0\',ready_max_logout=\'-1\',export_gdpr_leads=\'0\',pause_code_approval=\'1\',max_hopper_calls=\'0\',max_hopper_calls_hour=\'0\',mute_recordings=\'DISABLED\',hide_call_log_info=\'DISABLED\',next_dial_my_callbacks=\'NOT_ACTIVE\',user_admin_redirect_url=\'\',max_inbound_filter_enabled=\'0\',max_inbound_filter_statuses=\'\',max_inbound_filter_ingroups=\'\',max_inbound_filter_min_sec=\'-1\',status_group_id=\'\',mobile_number=\'\',two_factor_override=\'\',manual_dial_filter=\'DISABLED\'  where user=\'6666\' |INSERT INTO vicidial_inbound_group_agents set group_rank=\'0\', group_weight=\'0\', group_id=\'AGENTDIRECT\', user=\'6666\', group_web_vars=\'\', group_grade=\'1\'|UPDATE vicidial_live_inbound_agents set group_weight=\'0\', group_grade=\'1\' where group_id=\'AGENTDIRECT\' and user=\'6666\'|INSERT INTO vicidial_inbound_group_agents set group_rank=\'0\', group_weight=\'0\', group_id=\'AGENTDIRECT_CHAT\', user=\'6666\', group_web_vars=\'\', group_grade=\'1\'|UPDATE vicidial_live_inbound_agents set group_weight=\'0\', group_grade=\'1\' where group_id=\'AGENTDIRECT_CHAT\' and user=\'6666\'||','','---ALL---'),(3,'2021-07-10 07:30:27','6666','192.168.1.2','USERS','MODIFY','6666','ADMIN MODIFY USER','UPDATE vicidial_users set pass=\'admin\',full_name=\'Admin\',user_level=\'9\',user_group=\'ADMIN\',phone_login=\'\',phone_pass=\'\',delete_users=\'1\',delete_user_groups=\'1\',delete_lists=\'1\',delete_campaigns=\'1\',delete_ingroups=\'1\',delete_remote_agents=\'1\',load_leads=\'1\',campaign_detail=\'1\',ast_admin_access=\'1\',ast_delete_phones=\'1\',delete_scripts=\'1\',modify_leads=\'5\',hotkeys_active=\'0\',change_agent_campaign=\'1\',agent_choose_ingroups=\'1\',closer_campaigns=\'\',scheduled_callbacks=\'1\',agentonly_callbacks=\'0\',agentcall_manual=\'0\',vicidial_recording=\'1\',vicidial_transfers=\'1\',delete_filters=\'1\',alter_agent_interface_options=\'1\',closer_default_blended=\'0\',delete_call_times=\'1\',modify_call_times=\'1\',modify_users=\'1\',modify_campaigns=\'1\',modify_lists=\'1\',modify_scripts=\'1\',modify_filters=\'1\',modify_ingroups=\'1\',modify_usergroups=\'1\',modify_remoteagents=\'1\',modify_servers=\'1\',view_reports=\'1\',vicidial_recording_override=\'DISABLED\',alter_custdata_override=\'NOT_ACTIVE\',qc_enabled=\'0\',qc_user_level=\'1\',qc_pass=\'0\',qc_finish=\'0\',qc_commit=\'0\',add_timeclock_log=\'1\',modify_timeclock_log=\'1\',delete_timeclock_log=\'1\',alter_custphone_override=\'NOT_ACTIVE\',vdc_agent_api_access=\'0\',modify_inbound_dids=\'1\',delete_inbound_dids=\'1\',active=\'Y\',download_lists=\'1\',agent_shift_enforcement_override=\'DISABLED\',manager_shift_enforcement_override=\'1\',export_reports=\'1\',delete_from_dnc=\'1\',email=\'\',user_code=\'\',territory=\'\',allow_alerts=\'0\',agent_choose_territories=\'0\',custom_one=\'\',custom_two=\'\',custom_three=\'\',custom_four=\'\',custom_five=\'\',voicemail_id=\'\',agent_call_log_view_override=\'DISABLED\',callcard_admin=\'1\',agent_choose_blended=\'1\',realtime_block_user_info=\'1\',custom_fields_modify=\'0\',force_change_password=\'N\',agent_lead_search_override=\'NOT_ACTIVE\',modify_shifts=\'1\',modify_phones=\'1\',modify_carriers=\'1\',modify_labels=\'1\',modify_statuses=\'1\',modify_voicemail=\'1\',modify_audiostore=\'1\',modify_moh=\'1\',modify_tts=\'1\',preset_contact_search=\'NOT_ACTIVE\',modify_contacts=\'1\',modify_same_user_level=\'1\',admin_hide_lead_data=\'1\',admin_hide_phone_data=\'0\',agentcall_email=\'0\',agentcall_chat=\'0\',modify_email_accounts=\'0\',failed_login_count=0,alter_admin_interface_options=\'1\',max_inbound_calls=\'0\',modify_custom_dialplans=\'1\',wrapup_seconds_override=\'-1\',modify_languages=\'0\',selected_language=\'default English\',user_choose_language=\'0\',ignore_group_on_search=\'1\',api_list_restrict=\'0\',api_allowed_functions=\' ALL_FUNCTIONS \',lead_filter_id=\'NONE\',admin_cf_show_hidden=\'0\',user_hide_realtime=\'0\',access_recordings=\'0\',modify_colors=\'1\',user_nickname=\'\',user_new_lead_limit=\'-1\',api_only_user=\'0\',modify_auto_reports=\'0\',modify_ip_lists=\'0\',ignore_ip_list=\'0\',ready_max_logout=\'-1\',export_gdpr_leads=\'0\',pause_code_approval=\'1\',max_hopper_calls=\'0\',max_hopper_calls_hour=\'0\',mute_recordings=\'DISABLED\',hide_call_log_info=\'DISABLED\',next_dial_my_callbacks=\'NOT_ACTIVE\',user_admin_redirect_url=\'\',max_inbound_filter_enabled=\'0\',max_inbound_filter_statuses=\'\',max_inbound_filter_ingroups=\'\',max_inbound_filter_min_sec=\'-1\',status_group_id=\'\',mobile_number=\'\',two_factor_override=\'\',manual_dial_filter=\'DISABLED\'  where user=\'6666\' |UPDATE vicidial_inbound_group_agents set group_rank=\'0\', group_weight=\'0\', group_web_vars=\'\', group_grade=\'1\' where group_id=\'AGENTDIRECT\' and user=\'6666\'|UPDATE vicidial_live_inbound_agents set group_weight=\'0\', group_grade=\'1\' where group_id=\'AGENTDIRECT\' and user=\'6666\'|UPDATE vicidial_inbound_group_agents set group_rank=\'0\', group_weight=\'0\', group_web_vars=\'\', group_grade=\'1\' where group_id=\'AGENTDIRECT_CHAT\' and user=\'6666\'|UPDATE vicidial_live_inbound_agents set group_weight=\'0\', group_grade=\'1\' where group_id=\'AGENTDIRECT_CHAT\' and user=\'6666\'||','','---ALL---'),(4,'2021-07-10 07:33:04','6666','192.168.1.2','CAMPAIGNS','ADD','test','ADMIN ADD CAMPAIGN','INSERT INTO vicidial_campaigns (campaign_id,campaign_name,campaign_description,active,dial_status_a,lead_order,park_ext,park_file_name,web_form_address,allow_closers,hopper_level,auto_dial_level,next_agent_call,local_call_time,voicemail_ext,campaign_script,get_call_launch,campaign_changedate,campaign_stats_refresh,list_order_mix,web_form_address_two,start_call_url,dispo_call_url,na_call_url,user_group,web_form_address_three,campaign_script_two,survey_first_audio_file,survey_ni_audio_file,survey_opt_in_audio_file,survey_third_audio_file,survey_fourth_audio_file) values(\'test\',\'testcamp\',\'test\',\'Y\',\'NEW\',\'DOWN\',\'\',\'default\',\'\',\'Y\',\'1\',\'1\',\'longest_wait_time\',\'24hours\',\'\',\'\',\'NONE\',\'2021-07-10 07:33:04\',\'Y\',\'DISABLED\',\'\',\'\',\'\',\'\',\'---ALL---\',\'\',\'\',\'US_pol_survey_hello\',\'US_thanks_no_contact\',\'US_pol_survey_transfer\',\'US_thanks_no_contact\',\'US_thanks_no_contact\')|INSERT INTO vicidial_campaign_stats (campaign_id) values(\'test\')|INSERT INTO vicidial_campaign_stats_debug (campaign_id) values(\'test\')|','','---ALL---'),(5,'2021-07-10 07:33:23','6666','192.168.1.2','CAMPAIGNS','MODIFY','test','ADMIN MODIFY CAMPAIGN DETAIL','UPDATE vicidial_campaigns set campaign_name=\'testcamp\',active=\'Y\',dial_status_a=\'\',dial_status_b=\'\',dial_status_c=\'\',dial_status_d=\'\',dial_status_e=\'\',lead_order=\'DOWN\',allow_closers=\'Y\',hopper_level=\'1\', auto_trim_hopper=\'Y\', use_auto_hopper=\'N\', auto_hopper_multi=\'1\', auto_dial_level=\'0\', next_agent_call=\'longest_wait_time\', local_call_time=\'24hours\', voicemail_ext=\'\', dial_timeout=\'60\', dial_prefix=\'91\', campaign_cid=\'0000000000\', campaign_vdad_exten=\'8368\', web_form_address=\'\', park_ext=\'\', park_file_name=\'default\', campaign_rec_exten=\'8309\', campaign_recording=\'ONDEMAND\', campaign_rec_filename=\'FULLDATE_CUSTPHONE\', campaign_script=\'\', get_call_launch=\'NONE\', am_message_exten=\'vm-goodbye\', amd_send_to_vmx=\'N\', xferconf_a_dtmf=\'\',xferconf_a_number=\'\',xferconf_b_dtmf=\'\',xferconf_b_number=\'\',lead_filter_id=\'NONE\',alt_number_dialing=\'N\',scheduled_callbacks=\'N\',drop_action=\'AUDIO\',drop_call_seconds=\'5\',safe_harbor_exten=\'8307\',wrapup_seconds=\'0\',wrapup_message=\'Wrapup Call\',closer_campaigns=closer_campaigns,use_internal_dnc=\'N\',allcalls_delay=\'0\',omit_phone_code=\'N\',dial_method=\'MANUAL\',available_only_ratio_tally=\'N\',adaptive_dropped_percentage=\'3\',adaptive_maximum_level=\'3.0\',adaptive_latest_server_time=\'2100\',adaptive_intensity=\'0\',adaptive_dl_diff_target=\'0\',concurrent_transfers=\'AUTO\',auto_alt_dial=\'NONE\',agent_pause_codes_active=\'N\',campaign_description=\'test\',campaign_changedate=\'2021-07-10 07:33:23\',campaign_stats_refresh=\'Y\',disable_alter_custdata=\'N\',no_hopper_leads_logins=\'N\',list_order_mix=\'DISABLED\',campaign_allow_inbound=\'N\',manual_dial_list_id=\'998\',default_xfer_group=\'---NONE---\',xfer_groups=\'\',queue_priority=\'50\',drop_inbound_group=\'---NONE---\',disable_alter_custphone=\'Y\',display_queue_count=\'Y\',manual_dial_filter=\'NONE\',agent_clipboard_copy=\'NONE\',agent_extended_alt_dial=\'N\',use_campaign_dnc=\'N\',three_way_call_cid=\'CAMPAIGN\',three_way_dial_prefix=\'\',web_form_target=\'vdcwebform\',vtiger_search_category=\'LEAD\',vtiger_create_call_record=\'Y\',vtiger_create_lead_record=\'Y\',vtiger_screen_login=\'Y\',cpd_amd_action=\'DISABLED\',agent_allow_group_alias=\'N\',default_group_alias=\'\',vtiger_search_dead=\'ASK\',vtiger_status_call=\'N\',drop_lockout_time=\'0\',quick_transfer_button=\'N\',prepopulate_transfer_preset=\'N\',drop_rate_group=\'DISABLED\',view_calls_in_queue=\'NONE\',view_calls_in_queue_launch=\'MANUAL\',grab_calls_in_queue=\'N\',call_requeue_button=\'N\',pause_after_each_call=\'N\',no_hopper_dialing=\'N\',agent_dial_owner_only=\'NONE\',agent_display_dialable_leads=\'N\',web_form_address_two=\'\',waitforsilence_options=\'\',agent_select_territories=\'N\',crm_popup_login=\'N\',crm_login_address=\'\',timer_action=\'NONE\',timer_action_message=\'\',timer_action_seconds=\'1\',start_call_url=\'\',dispo_call_url=\'\',xferconf_c_number=\'\',xferconf_d_number=\'\',xferconf_e_number=\'\',use_custom_cid=\'N\',scheduled_callbacks_alert=\'NONE\',queuemetrics_callstatus_override=\'DISABLED\',extension_appended_cidname=\'N\',scheduled_callbacks_count=\'ALL_ACTIVE\',manual_dial_override=\'NONE\',blind_monitor_warning=\'DISABLED\',blind_monitor_message=\'Someone is blind monitoring your session\',blind_monitor_filename=\'\',inbound_queue_no_dial=\'DISABLED\',timer_action_destination=\'\',enable_xfer_presets=\'DISABLED\',hide_xfer_number_to_dial=\'DISABLED\',manual_dial_prefix=\'91\',customer_3way_hangup_logging=\'ENABLED\',customer_3way_hangup_seconds=\'5\',customer_3way_hangup_action=\'NONE\',ivr_park_call=\'DISABLED\',ivr_park_call_agi=\'\',manual_preview_dial=\'PREVIEW_AND_SKIP\',realtime_agent_time_stats=\'CALLS_WAIT_CUST_ACW_PAUSE\',api_manual_dial=\'STANDARD\',manual_dial_call_time_check=\'DISABLED\',lead_order_randomize=\'N\',lead_order_secondary=\'LEAD_ASCEND\',per_call_notes=\'DISABLED\',my_callback_option=\'UNCHECKED\',agent_lead_search=\'DISABLED\',agent_lead_search_method=\'CAMPLISTS_ALL\',queuemetrics_phone_environment=\'\',auto_pause_precall=\'N\',auto_resume_precall=\'N\',auto_pause_precall_code=\'PRECAL\',manual_dial_cid=\'CAMPAIGN\',post_phone_time_diff_alert=\'DISABLED\',custom_3way_button_transfer=\'DISABLED\',available_only_tally_threshold=\'DISABLED\',available_only_tally_threshold_agents=\'0\',dial_level_threshold=\'DISABLED\',dial_level_threshold_agents=\'0\',safe_harbor_audio=\'buzz\',safe_harbor_menu_id=\'\',callback_days_limit=\'0\',dl_diff_target_method=\'ADAPT_CALC_ONLY\',disable_dispo_screen=\'DISPO_ENABLED\',disable_dispo_status=\'\',screen_labels=\'--SYSTEM-SETTINGS--\',status_display_fields=\'CALLID\',na_call_url=\'\',pllb_grouping=\'DISABLED\',pllb_grouping_limit=\'50\',call_count_limit=\'0\',call_count_target=\'3\',callback_hours_block=\'0\',callback_list_calltime=\'DISABLED\',user_group=\'---ALL---\',hopper_vlc_dup_check=\'N\',in_group_dial=\'DISABLED\',in_group_dial_select=\'CAMPAIGN_SELECTED\',safe_harbor_audio_field=\'DISABLED\',pause_after_next_call=\'DISABLED\',owner_populate=\'DISABLED\',use_other_campaign_dnc=\'\',allow_emails=\'N\',allow_chats=\'N\',amd_inbound_group=\'---NONE---\',amd_callmenu=\'---NONE---\',manual_dial_lead_id=\'N\',dead_max=\'0\',dispo_max=\'0\',pause_max=\'0\',dead_max_dispo=\'DCMX\',dispo_max_dispo=\'DISMX\',max_inbound_calls=\'0\',manual_dial_search_checkbox=\'SELECTED\',hide_call_log_info=\'N\',timer_alt_seconds=\'0\',wrapup_bypass=\'ENABLED\',wrapup_after_hotkey=\'DISABLED\',callback_active_limit=\'0\',callback_active_limit_override=\'N\',comments_all_tabs=\'DISABLED\',comments_dispo_screen=\'DISABLED\',comments_callback_screen=\'DISABLED\',qc_comment_history=\'CLICK\',show_previous_callback=\'ENABLED\',clear_script=\'DISABLED\',cpd_unknown_action=\'DISABLED\',manual_dial_search_filter=\'NONE\',web_form_address_three=\'\',manual_dial_override_field=\'ENABLED\',status_display_ingroup=\'ENABLED\',customer_gone_seconds=\'30\',agent_display_fields=\'\',am_message_wildcards=\'N\',manual_dial_timeout=\'\',routing_initiated_recordings=\'Y\',manual_dial_hopper_check=\'N\',callback_useronly_move_minutes=\'0\',ofcom_uk_drop_calc=\'N\',manual_auto_next=\'0\',manual_auto_show=\'N\',allow_required_fields=\'N\',dead_to_dispo=\'DISABLED\',agent_xfer_validation=\'N\',ready_max_logout=\'0\',callback_display_days=\'0\',three_way_record_stop=\'N\',hangup_xfer_record_start=\'N\',scheduled_callbacks_email_alert=\'N\',max_inbound_calls_outcome=\'DEFAULT\',manual_auto_next_options=\'DEFAULT\',agent_screen_time_display=\'DISABLED\',next_dial_my_callbacks=\'DISABLED\',inbound_no_agents_no_dial_container=\'\',inbound_no_agents_no_dial_threshold=\'0\',cid_group_id=\'---DISABLED---\',pause_max_dispo=\'PAUSMX\',script_top_dispo=\'N\',dead_trigger_seconds=\'0\',dead_trigger_action=\'DISABLED\',dead_trigger_repeat=\'NO\',dead_trigger_filename=\'\',dead_trigger_url=\'\',scheduled_callbacks_force_dial=\'N\',scheduled_callbacks_auto_reschedule=\'DISABLED\',scheduled_callbacks_timezones_container=\'DISABLED\',three_way_volume_buttons=\'ENABLED\',callback_dnc=\'DISABLED\',manual_dial_validation=\'N\',mute_recordings=\'N\',auto_active_list_new=\'DISABLED\',call_quota_lead_ranking=\'DISABLED\',sip_event_logging=\'DISABLED\',campaign_script_two=\'\',leave_vm_no_dispo=\'DISABLED\',leave_vm_message_group_id=\'---NONE---\',dial_timeout_lead_container=\'DISABLED\',amd_type=\'AMD\',vmm_daily_limit=\'0\',opensips_cid_name=\'\',amd_agent_route_options=\'DISABLED\',browser_alert_sound=\'---NONE---\',browser_alert_volume=\'50\',three_way_record_stop_exception=\'DISABLED\',pause_max_exceptions=\'\',daily_call_count_limit=\'0\',daily_limit_manual=\'DISABLED\',transfer_button_launch=\'NONE\',shared_dial_rank=\'99\',agent_search_method=\'\',clear_form=\'ACKNOWLEDGE\',leave_3way_start_recording=\'DISABLED\',leave_3way_start_recording_exception=\'DISABLED\',calls_waiting_vl_one=\'DISABLED\',calls_waiting_vl_two=\'DISABLED\',calls_inqueue_count_one=\'DISABLED\',calls_inqueue_count_two=\'DISABLED\',in_man_dial_next_ready_seconds=\'0\',in_man_dial_next_ready_seconds_override=\'DISABLED\',transfer_no_dispo=\'DISABLED\' where campaign_id=\'test\'|','','---ALL---'),(6,'2021-07-10 07:34:14','6666','192.168.1.2','USERS','ADD','admin','ADMIN ADD USER','INSERT INTO vicidial_users (user,pass,full_name,user_level,user_group,phone_login,phone_pass,pass_hash) values(\'admin\',\'admin\',\'admin\',\'9\',\'---ALL---\',\'\',\'\',\'\')|','user: admin','---ALL---'),(7,'2021-07-10 07:35:54','6666','192.168.1.2','USERS','MODIFY','admin','ADMIN MODIFY USER','UPDATE vicidial_users set pass=\'admin\',full_name=\'admin\',user_level=\'9\',user_group=\'---ALL---\',phone_login=\'\',phone_pass=\'\',delete_users=\'1\',delete_user_groups=\'1\',delete_lists=\'1\',delete_campaigns=\'1\',delete_ingroups=\'1\',delete_remote_agents=\'1\',load_leads=\'1\',campaign_detail=\'1\',ast_admin_access=\'1\',ast_delete_phones=\'1\',delete_scripts=\'1\',modify_leads=\'5\',hotkeys_active=\'0\',change_agent_campaign=\'1\',agent_choose_ingroups=\'1\',closer_campaigns=\'\',scheduled_callbacks=\'1\',agentonly_callbacks=\'0\',agentcall_manual=\'0\',vicidial_recording=\'1\',vicidial_transfers=\'1\',delete_filters=\'1\',alter_agent_interface_options=\'1\',closer_default_blended=\'0\',delete_call_times=\'1\',modify_call_times=\'1\',modify_users=\'1\',modify_campaigns=\'1\',modify_lists=\'1\',modify_scripts=\'1\',modify_filters=\'1\',modify_ingroups=\'1\',modify_usergroups=\'1\',modify_remoteagents=\'1\',modify_servers=\'1\',view_reports=\'1\',vicidial_recording_override=\'DISABLED\',alter_custdata_override=\'NOT_ACTIVE\',qc_enabled=\'0\',qc_user_level=\'1\',qc_pass=\'0\',qc_finish=\'0\',qc_commit=\'0\',add_timeclock_log=\'1\',modify_timeclock_log=\'1\',delete_timeclock_log=\'1\',alter_custphone_override=\'NOT_ACTIVE\',vdc_agent_api_access=\'0\',modify_inbound_dids=\'1\',delete_inbound_dids=\'1\',active=\'Y\',download_lists=\'1\',agent_shift_enforcement_override=\'DISABLED\',manager_shift_enforcement_override=\'1\',export_reports=\'1\',delete_from_dnc=\'1\',email=\'\',user_code=\'\',territory=\'\',allow_alerts=\'0\',agent_choose_territories=\'0\',custom_one=\'\',custom_two=\'\',custom_three=\'\',custom_four=\'\',custom_five=\'\',voicemail_id=\'\',agent_call_log_view_override=\'DISABLED\',callcard_admin=\'1\',agent_choose_blended=\'1\',realtime_block_user_info=\'0\',custom_fields_modify=\'0\',force_change_password=\'N\',agent_lead_search_override=\'NOT_ACTIVE\',modify_shifts=\'1\',modify_phones=\'1\',modify_carriers=\'1\',modify_labels=\'1\',modify_statuses=\'1\',modify_voicemail=\'1\',modify_audiostore=\'1\',modify_moh=\'1\',modify_tts=\'1\',preset_contact_search=\'NOT_ACTIVE\',modify_contacts=\'1\',modify_same_user_level=\'1\',admin_hide_lead_data=\'0\',admin_hide_phone_data=\'0\',agentcall_email=\'0\',agentcall_chat=\'0\',modify_email_accounts=\'0\',failed_login_count=0,alter_admin_interface_options=\'1\',max_inbound_calls=\'0\',modify_custom_dialplans=\'1\',wrapup_seconds_override=\'-1\',modify_languages=\'0\',selected_language=\'default English\',user_choose_language=\'0\',ignore_group_on_search=\'0\',api_list_restrict=\'0\',api_allowed_functions=\' ALL_FUNCTIONS \',lead_filter_id=\'NONE\',admin_cf_show_hidden=\'0\',user_hide_realtime=\'0\',access_recordings=\'0\',modify_colors=\'1\',user_nickname=\'\',user_new_lead_limit=\'-1\',api_only_user=\'0\',modify_auto_reports=\'0\',modify_ip_lists=\'0\',ignore_ip_list=\'0\',ready_max_logout=\'-1\',export_gdpr_leads=\'0\',pause_code_approval=\'1\',max_hopper_calls=\'0\',max_hopper_calls_hour=\'0\',mute_recordings=\'DISABLED\',hide_call_log_info=\'DISABLED\',next_dial_my_callbacks=\'NOT_ACTIVE\',user_admin_redirect_url=\'\',max_inbound_filter_enabled=\'0\',max_inbound_filter_statuses=\'\',max_inbound_filter_ingroups=\'\',max_inbound_filter_min_sec=\'-1\',status_group_id=\'\',mobile_number=\'\',two_factor_override=\'\',manual_dial_filter=\'DISABLED\'  where user=\'admin\' |INSERT INTO vicidial_campaign_agents set campaign_rank=\'\', campaign_weight=\'\', campaign_id=\'test\', user=\'admin\', group_web_vars=\'\',campaign_grade=\'\'|UPDATE vicidial_live_agents set campaign_weight=\'\',campaign_grade=\'\' where campaign_id=\'test\' and user=\'admin\'|INSERT INTO vicidial_inbound_group_agents set group_rank=\'\', group_weight=\'\', group_id=\'AGENTDIRECT\', user=\'admin\', group_web_vars=\'\', group_grade=\'\'|UPDATE vicidial_live_inbound_agents set group_weight=\'\', group_grade=\'\' where group_id=\'AGENTDIRECT\' and user=\'admin\'|INSERT INTO vicidial_inbound_group_agents set group_rank=\'\', group_weight=\'\', group_id=\'AGENTDIRECT_CHAT\', user=\'admin\', group_web_vars=\'\', group_grade=\'\'|UPDATE vicidial_live_inbound_agents set group_weight=\'\', group_grade=\'\' where group_id=\'AGENTDIRECT_CHAT\' and user=\'admin\'||','','---ALL---');
/*!40000 ALTER TABLE `vicidial_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_dial_campaigns`
--

DROP TABLE IF EXISTS `vicidial_agent_dial_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_dial_campaigns` (
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validate_time` datetime DEFAULT NULL,
  `dial_time` datetime DEFAULT NULL,
  UNIQUE KEY `vadc_key` (`campaign_id`,`user`),
  KEY `user` (`user`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_dial_campaigns`
--

LOCK TABLES `vicidial_agent_dial_campaigns` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_dial_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_dial_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_function_log`
--

DROP TABLE IF EXISTS `vicidial_agent_function_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_function_log` (
  `agent_function_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `agent_log_id` int(9) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `function` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_time` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `comments` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `stage` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`agent_function_log_id`),
  KEY `event_time` (`event_time`),
  KEY `caller_code` (`caller_code`),
  KEY `user` (`user`),
  KEY `lead_id` (`lead_id`),
  KEY `stage` (`stage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_function_log`
--

LOCK TABLES `vicidial_agent_function_log` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_function_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_function_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_function_log_archive`
--

DROP TABLE IF EXISTS `vicidial_agent_function_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_function_log_archive` (
  `agent_function_log_id` int(9) unsigned NOT NULL,
  `agent_log_id` int(9) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `function` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_time` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `comments` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `stage` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`agent_function_log_id`),
  KEY `event_time` (`event_time`),
  KEY `caller_code` (`caller_code`),
  KEY `user` (`user`),
  KEY `lead_id` (`lead_id`),
  KEY `stage` (`stage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_function_log_archive`
--

LOCK TABLES `vicidial_agent_function_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_function_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_function_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_log`
--

DROP TABLE IF EXISTS `vicidial_agent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_log` (
  `agent_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `event_time` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pause_epoch` int(10) unsigned DEFAULT NULL,
  `pause_sec` smallint(5) unsigned DEFAULT 0,
  `wait_epoch` int(10) unsigned DEFAULT NULL,
  `wait_sec` smallint(5) unsigned DEFAULT 0,
  `talk_epoch` int(10) unsigned DEFAULT NULL,
  `talk_sec` smallint(5) unsigned DEFAULT 0,
  `dispo_epoch` int(10) unsigned DEFAULT NULL,
  `dispo_sec` smallint(5) unsigned DEFAULT 0,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dead_epoch` int(10) unsigned DEFAULT NULL,
  `dead_sec` smallint(5) unsigned DEFAULT 0,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `pause_type` enum('UNDEFINED','SYSTEM','AGENT','API','ADMIN') COLLATE utf8_unicode_ci DEFAULT 'UNDEFINED',
  PRIMARY KEY (`agent_log_id`),
  KEY `lead_id` (`lead_id`),
  KEY `user` (`user`),
  KEY `event_time` (`event_time`),
  KEY `time_user` (`event_time`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_log`
--

LOCK TABLES `vicidial_agent_log` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_log_archive`
--

DROP TABLE IF EXISTS `vicidial_agent_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_log_archive` (
  `agent_log_id` int(9) unsigned NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `event_time` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pause_epoch` int(10) unsigned DEFAULT NULL,
  `pause_sec` smallint(5) unsigned DEFAULT 0,
  `wait_epoch` int(10) unsigned DEFAULT NULL,
  `wait_sec` smallint(5) unsigned DEFAULT 0,
  `talk_epoch` int(10) unsigned DEFAULT NULL,
  `talk_sec` smallint(5) unsigned DEFAULT 0,
  `dispo_epoch` int(10) unsigned DEFAULT NULL,
  `dispo_sec` smallint(5) unsigned DEFAULT 0,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dead_epoch` int(10) unsigned DEFAULT NULL,
  `dead_sec` smallint(5) unsigned DEFAULT 0,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `pause_type` enum('UNDEFINED','SYSTEM','AGENT','API','ADMIN') COLLATE utf8_unicode_ci DEFAULT 'UNDEFINED',
  PRIMARY KEY (`agent_log_id`),
  KEY `lead_id` (`lead_id`),
  KEY `user` (`user`),
  KEY `event_time` (`event_time`),
  KEY `time_user` (`event_time`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_log_archive`
--

LOCK TABLES `vicidial_agent_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_skip_log`
--

DROP TABLE IF EXISTS `vicidial_agent_skip_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_skip_log` (
  `user_skip_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `previous_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `previous_called_count` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`user_skip_log_id`),
  KEY `user` (`user`),
  KEY `event_date` (`event_date`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_skip_log`
--

LOCK TABLES `vicidial_agent_skip_log` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_skip_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_skip_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_sph`
--

DROP TABLE IF EXISTS `vicidial_agent_sph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_sph` (
  `campaign_group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `stat_date` date NOT NULL,
  `shift` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('FRONTER','CLOSER') COLLATE utf8_unicode_ci DEFAULT 'FRONTER',
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `calls` mediumint(8) unsigned DEFAULT 0,
  `sales` mediumint(8) unsigned DEFAULT 0,
  `login_sec` mediumint(8) unsigned DEFAULT 0,
  `login_hours` decimal(5,2) DEFAULT 0.00,
  `sph` decimal(6,2) DEFAULT 0.00,
  KEY `campaign_group_id` (`campaign_group_id`),
  KEY `stat_date` (`stat_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_sph`
--

LOCK TABLES `vicidial_agent_sph` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_sph` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_sph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_visibility_log`
--

DROP TABLE IF EXISTS `vicidial_agent_visibility_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_visibility_log` (
  `db_time` datetime NOT NULL,
  `event_start_epoch` int(10) unsigned DEFAULT NULL,
  `event_end_epoch` int(10) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `visibility` enum('VISIBLE','HIDDEN','LOGIN','NONE') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `agent_log_id` int(9) unsigned DEFAULT NULL,
  UNIQUE KEY `visibleuser` (`user`,`visibility`,`event_end_epoch`),
  KEY `db_time` (`db_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_visibility_log`
--

LOCK TABLES `vicidial_agent_visibility_log` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_visibility_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_visibility_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_visibility_log_archive`
--

DROP TABLE IF EXISTS `vicidial_agent_visibility_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_visibility_log_archive` (
  `db_time` datetime NOT NULL,
  `event_start_epoch` int(10) unsigned DEFAULT NULL,
  `event_end_epoch` int(10) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `visibility` enum('VISIBLE','HIDDEN','LOGIN','NONE') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `agent_log_id` int(9) unsigned DEFAULT NULL,
  UNIQUE KEY `visibleuser` (`user`,`visibility`,`event_end_epoch`),
  KEY `db_time` (`db_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_visibility_log_archive`
--

LOCK TABLES `vicidial_agent_visibility_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_visibility_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_visibility_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_agent_vmm_overrides`
--

DROP TABLE IF EXISTS `vicidial_agent_vmm_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_agent_vmm_overrides` (
  `call_date` datetime DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `vm_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `caller_code` (`caller_code`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_agent_vmm_overrides`
--

LOCK TABLES `vicidial_agent_vmm_overrides` WRITE;
/*!40000 ALTER TABLE `vicidial_agent_vmm_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_agent_vmm_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ajax_log`
--

DROP TABLE IF EXISTS `vicidial_ajax_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ajax_log` (
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `start_time` datetime NOT NULL,
  `db_time` datetime NOT NULL,
  `run_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `php_script` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(10) unsigned DEFAULT 0,
  `stage` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `session_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `last_sql` text COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ajax_dbtime_key` (`db_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ajax_log`
--

LOCK TABLES `vicidial_ajax_log` WRITE;
/*!40000 ALTER TABLE `vicidial_ajax_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_ajax_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_amd_log`
--

DROP TABLE IF EXISTS `vicidial_amd_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_amd_log` (
  `call_date` datetime DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `server_ip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `AMDSTATUS` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `AMDRESPONSE` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `AMDCAUSE` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `run_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `AMDSTATS` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_amd_log`
--

LOCK TABLES `vicidial_amd_log` WRITE;
/*!40000 ALTER TABLE `vicidial_amd_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_amd_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_amd_log_archive`
--

DROP TABLE IF EXISTS `vicidial_amd_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_amd_log_archive` (
  `call_date` datetime DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `server_ip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `AMDSTATUS` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `AMDRESPONSE` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `AMDCAUSE` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `run_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `AMDSTATS` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `amd_unq_key` (`uniqueid`,`call_date`,`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_amd_log_archive`
--

LOCK TABLES `vicidial_amd_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_amd_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_amd_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_amm_multi`
--

DROP TABLE IF EXISTS `vicidial_amm_multi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_amm_multi` (
  `amm_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `entry_type` enum('campaign','ingroup','list','') COLLATE utf8_unicode_ci DEFAULT '',
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `amm_field` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'vendor_lead_code',
  `amm_rank` smallint(5) DEFAULT 1,
  `amm_wildcard` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `amm_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `amm_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`amm_id`),
  KEY `vicidial_AMM_multi_campaign_id_key` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_amm_multi`
--

LOCK TABLES `vicidial_amm_multi` WRITE;
/*!40000 ALTER TABLE `vicidial_amm_multi` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_amm_multi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_api_log`
--

DROP TABLE IF EXISTS `vicidial_api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_api_log` (
  `api_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `api_date` datetime DEFAULT NULL,
  `api_script` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `function` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `agent_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `run_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `webserver` smallint(5) unsigned DEFAULT 0,
  `api_url` int(9) unsigned DEFAULT 0,
  PRIMARY KEY (`api_id`),
  KEY `api_date` (`api_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_api_log`
--

LOCK TABLES `vicidial_api_log` WRITE;
/*!40000 ALTER TABLE `vicidial_api_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_api_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_api_log_archive`
--

DROP TABLE IF EXISTS `vicidial_api_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_api_log_archive` (
  `api_id` int(9) unsigned NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `api_date` datetime DEFAULT NULL,
  `api_script` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `function` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `agent_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `run_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `webserver` smallint(5) unsigned DEFAULT 0,
  `api_url` int(9) unsigned DEFAULT 0,
  PRIMARY KEY (`api_id`),
  KEY `api_date` (`api_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_api_log_archive`
--

LOCK TABLES `vicidial_api_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_api_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_api_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_api_urls`
--

DROP TABLE IF EXISTS `vicidial_api_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_api_urls` (
  `api_id` int(9) unsigned NOT NULL,
  `api_date` datetime DEFAULT NULL,
  `remote_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_api_urls`
--

LOCK TABLES `vicidial_api_urls` WRITE;
/*!40000 ALTER TABLE `vicidial_api_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_api_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_api_urls_archive`
--

DROP TABLE IF EXISTS `vicidial_api_urls_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_api_urls_archive` (
  `api_id` int(9) unsigned NOT NULL,
  `api_date` datetime DEFAULT NULL,
  `remote_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_api_urls_archive`
--

LOCK TABLES `vicidial_api_urls_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_api_urls_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_api_urls_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_areacode_filters`
--

DROP TABLE IF EXISTS `vicidial_areacode_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_areacode_filters` (
  `group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `areacode` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_areacode_filters`
--

LOCK TABLES `vicidial_areacode_filters` WRITE;
/*!40000 ALTER TABLE `vicidial_areacode_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_areacode_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_asterisk_output`
--

DROP TABLE IF EXISTS `vicidial_asterisk_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_asterisk_output` (
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sip_peers` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `iax_peers` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `asterisk` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  UNIQUE KEY `server_ip` (`server_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_asterisk_output`
--

LOCK TABLES `vicidial_asterisk_output` WRITE;
/*!40000 ALTER TABLE `vicidial_asterisk_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_asterisk_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_auto_calls`
--

DROP TABLE IF EXISTS `vicidial_auto_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_auto_calls` (
  `auto_call_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('SENT','RINGING','LIVE','XFER','PAUSED','CLOSER','BUSY','DISCONNECT','IVR') COLLATE utf8_unicode_ci DEFAULT 'PAUSED',
  `lead_id` int(9) unsigned NOT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_time` datetime DEFAULT NULL,
  `call_type` enum('IN','OUT','OUTBALANCE') COLLATE utf8_unicode_ci DEFAULT 'OUT',
  `stage` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'START',
  `last_update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `alt_dial` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `queue_priority` tinyint(2) DEFAULT 0,
  `agent_only` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_grab` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `queue_position` smallint(4) unsigned DEFAULT 1,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_grab_extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`auto_call_id`),
  KEY `uniqueid` (`uniqueid`),
  KEY `callerid` (`callerid`),
  KEY `call_time` (`call_time`),
  KEY `last_update_time` (`last_update_time`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_auto_calls`
--

LOCK TABLES `vicidial_auto_calls` WRITE;
/*!40000 ALTER TABLE `vicidial_auto_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_auto_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_automated_reports`
--

DROP TABLE IF EXISTS `vicidial_automated_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_automated_reports` (
  `report_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `report_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `report_last_run` datetime DEFAULT NULL,
  `report_last_length` smallint(5) DEFAULT 0,
  `report_server` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'active_voicemail_server',
  `report_times` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `report_weekdays` varchar(7) COLLATE utf8_unicode_ci DEFAULT '',
  `report_monthdays` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `report_destination` enum('EMAIL','FTP') COLLATE utf8_unicode_ci DEFAULT 'EMAIL',
  `email_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `email_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `email_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ftp_server` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ftp_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ftp_pass` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ftp_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `report_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `run_now_trigger` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `active` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `report_id` (`report_id`),
  KEY `report_times` (`report_times`),
  KEY `run_now_trigger` (`run_now_trigger`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_automated_reports`
--

LOCK TABLES `vicidial_automated_reports` WRITE;
/*!40000 ALTER TABLE `vicidial_automated_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_automated_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_avatar_audio`
--

DROP TABLE IF EXISTS `vicidial_avatar_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_avatar_audio` (
  `avatar_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `audio_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `audio_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rank` smallint(5) DEFAULT 0,
  `h_ord` smallint(5) DEFAULT 1,
  `level` smallint(5) DEFAULT 1,
  `parent_audio_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `parent_rank` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `button_type` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'button',
  `font_size` varchar(3) COLLATE utf8_unicode_ci DEFAULT '2',
  KEY `avatar_id` (`avatar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_avatar_audio`
--

LOCK TABLES `vicidial_avatar_audio` WRITE;
/*!40000 ALTER TABLE `vicidial_avatar_audio` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_avatar_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_avatars`
--

DROP TABLE IF EXISTS `vicidial_avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_avatars` (
  `avatar_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `avatar_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_api_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `avatar_api_pass` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `audio_functions` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'PLAY-STOP-RESTART',
  `audio_display` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'FILE-NAME',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `soundboard_layout` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'default',
  `columns_limit` smallint(5) DEFAULT 5,
  PRIMARY KEY (`avatar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_avatars`
--

LOCK TABLES `vicidial_avatars` WRITE;
/*!40000 ALTER TABLE `vicidial_avatars` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_bench_agent_log`
--

DROP TABLE IF EXISTS `vicidial_bench_agent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_bench_agent_log` (
  `lead_id` int(9) unsigned DEFAULT NULL,
  `bench_date` datetime DEFAULT NULL,
  `absent_agent` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bench_agent` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `bench_date` (`bench_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_bench_agent_log`
--

LOCK TABLES `vicidial_bench_agent_log` WRITE;
/*!40000 ALTER TABLE `vicidial_bench_agent_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_bench_agent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_call_menu`
--

DROP TABLE IF EXISTS `vicidial_call_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_call_menu` (
  `menu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `menu_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_prompt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_timeout` smallint(2) unsigned DEFAULT 10,
  `menu_timeout_prompt` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `menu_invalid_prompt` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `menu_repeat` tinyint(1) unsigned DEFAULT 0,
  `menu_time_check` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `call_time_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `track_in_vdac` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `custom_dialplan_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'CALLMENU',
  `dtmf_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `dtmf_field` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `qualify_sql` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_dtmf_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `question` int(11) DEFAULT NULL,
  `answer_signal` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_call_menu`
--

LOCK TABLES `vicidial_call_menu` WRITE;
/*!40000 ALTER TABLE `vicidial_call_menu` DISABLE KEYS */;
INSERT INTO `vicidial_call_menu` VALUES ('defaultlog','logging of all outbound calls from agent phones','sip-silence',20,'NONE','NONE',0,'0','','0','exten => _X.,1,AGI(agi-NVA_recording.agi,BOTH------Y---Y---Y)\nexten => _X.,n,Goto(default,${EXTEN},1)','','0','NONE','---ALL---',NULL,'0',NULL,'Y'),('default---agent','agent phones restricted to only internal extensions','sip-silence',20,'NONE','NONE',0,'0','','0','include => vicidial-auto-internal\ninclude => vicidial-auto-phones\n','','0','NONE','---ALL---',NULL,'0',NULL,'Y'),('2FA_say_auth_code','2FA_say_auth_code','sip-silence|hello|your|access-code|is|cm_speak_var.agi,say_digits---access_code---DP',1,'NONE','NONE',1,'0','24hours','1','','CALLMENU','0','NONE','---ALL---','','0',0,'Y');
/*!40000 ALTER TABLE `vicidial_call_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_call_menu_options`
--

DROP TABLE IF EXISTS `vicidial_call_menu_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_call_menu_options` (
  `menu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `option_value` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `option_route` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_route_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_route_value_context` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `menuoption` (`menu_id`,`option_value`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_call_menu_options`
--

LOCK TABLES `vicidial_call_menu_options` WRITE;
/*!40000 ALTER TABLE `vicidial_call_menu_options` DISABLE KEYS */;
INSERT INTO `vicidial_call_menu_options` VALUES ('defaultlog','TIMEOUT','hangup','HANGUP','vm-goodbye',''),('default---agent','TIMEOUT','hangup','HANGUP','vm-goodbye',''),('2FA_say_auth_code','TIMEOUT','','HANGUP','','');
/*!40000 ALTER TABLE `vicidial_call_menu_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_call_notes`
--

DROP TABLE IF EXISTS `vicidial_call_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_call_notes` (
  `notesid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(9) unsigned NOT NULL,
  `vicidial_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `order_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `call_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`notesid`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_call_notes`
--

LOCK TABLES `vicidial_call_notes` WRITE;
/*!40000 ALTER TABLE `vicidial_call_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_call_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_call_notes_archive`
--

DROP TABLE IF EXISTS `vicidial_call_notes_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_call_notes_archive` (
  `notesid` int(9) unsigned NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `vicidial_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `order_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `call_notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`notesid`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_call_notes_archive`
--

LOCK TABLES `vicidial_call_notes_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_call_notes_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_call_notes_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_call_time_holidays`
--

DROP TABLE IF EXISTS `vicidial_call_time_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_call_time_holidays` (
  `holiday_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `holiday_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `holiday_comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `holiday_date` date DEFAULT NULL,
  `holiday_status` enum('ACTIVE','INACTIVE','EXPIRED') COLLATE utf8_unicode_ci DEFAULT 'INACTIVE',
  `ct_default_start` smallint(4) unsigned NOT NULL DEFAULT 900,
  `ct_default_stop` smallint(4) unsigned NOT NULL DEFAULT 2100,
  `default_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`holiday_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_call_time_holidays`
--

LOCK TABLES `vicidial_call_time_holidays` WRITE;
/*!40000 ALTER TABLE `vicidial_call_time_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_call_time_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_call_times`
--

DROP TABLE IF EXISTS `vicidial_call_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_call_times` (
  `call_time_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `call_time_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `call_time_comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ct_default_start` smallint(4) unsigned NOT NULL DEFAULT 900,
  `ct_default_stop` smallint(4) unsigned NOT NULL DEFAULT 2100,
  `ct_sunday_start` smallint(4) unsigned DEFAULT 0,
  `ct_sunday_stop` smallint(4) unsigned DEFAULT 0,
  `ct_monday_start` smallint(4) unsigned DEFAULT 0,
  `ct_monday_stop` smallint(4) unsigned DEFAULT 0,
  `ct_tuesday_start` smallint(4) unsigned DEFAULT 0,
  `ct_tuesday_stop` smallint(4) unsigned DEFAULT 0,
  `ct_wednesday_start` smallint(4) unsigned DEFAULT 0,
  `ct_wednesday_stop` smallint(4) unsigned DEFAULT 0,
  `ct_thursday_start` smallint(4) unsigned DEFAULT 0,
  `ct_thursday_stop` smallint(4) unsigned DEFAULT 0,
  `ct_friday_start` smallint(4) unsigned DEFAULT 0,
  `ct_friday_stop` smallint(4) unsigned DEFAULT 0,
  `ct_saturday_start` smallint(4) unsigned DEFAULT 0,
  `ct_saturday_stop` smallint(4) unsigned DEFAULT 0,
  `ct_state_call_times` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `sunday_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `monday_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tuesday_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `wednesday_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `thursday_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `friday_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `saturday_afterhours_filename_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `ct_holidays` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`call_time_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_call_times`
--

LOCK TABLES `vicidial_call_times` WRITE;
/*!40000 ALTER TABLE `vicidial_call_times` DISABLE KEYS */;
INSERT INTO `vicidial_call_times` VALUES ('24hours','default 24 hours calling','',0,2400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'','','','','','','','','---ALL---',NULL),('9am-9pm','default 9am to 9pm calling','',900,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'','','','','','','','','---ALL---',NULL),('9am-5pm','default 9am to 5pm calling','',900,1700,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'','','','','','','','','---ALL---',NULL),('12pm-5pm','default 12pm to 5pm calling','',1200,1700,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'','','','','','','','','---ALL---',NULL),('12pm-9pm','default 12pm to 9pm calling','',1200,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'','','','','','','','','---ALL---',NULL),('5pm-9pm','default 5pm to 9pm calling','',1700,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,'','','','','','','','','---ALL---',NULL);
/*!40000 ALTER TABLE `vicidial_call_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_callbacks`
--

DROP TABLE IF EXISTS `vicidial_callbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_callbacks` (
  `callback_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_time` datetime DEFAULT NULL,
  `callback_time` datetime DEFAULT NULL,
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient` enum('USERONLY','ANYONE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'CALLBK',
  `email_alert` datetime DEFAULT NULL,
  `email_result` enum('SENT','FAILED','NOT AVAILABLE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_timezone` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_timezone_diff` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_time` datetime DEFAULT NULL,
  PRIMARY KEY (`callback_id`),
  KEY `lead_id` (`lead_id`),
  KEY `status` (`status`),
  KEY `callback_time` (`callback_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_callbacks`
--

LOCK TABLES `vicidial_callbacks` WRITE;
/*!40000 ALTER TABLE `vicidial_callbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_callbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_callbacks_archive`
--

DROP TABLE IF EXISTS `vicidial_callbacks_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_callbacks_archive` (
  `callback_id` int(9) unsigned NOT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_time` datetime DEFAULT NULL,
  `callback_time` datetime DEFAULT NULL,
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient` enum('USERONLY','ANYONE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'CALLBK',
  `email_alert` datetime DEFAULT NULL,
  `email_result` enum('SENT','FAILED','NOT AVAILABLE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_timezone` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_timezone_diff` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_time` datetime DEFAULT NULL,
  PRIMARY KEY (`callback_id`),
  KEY `lead_id` (`lead_id`),
  KEY `status` (`status`),
  KEY `callback_time` (`callback_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_callbacks_archive`
--

LOCK TABLES `vicidial_callbacks_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_callbacks_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_callbacks_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_agents`
--

DROP TABLE IF EXISTS `vicidial_campaign_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_agents` (
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_rank` tinyint(1) DEFAULT 0,
  `campaign_weight` tinyint(1) DEFAULT 0,
  `calls_today` smallint(5) unsigned DEFAULT 0,
  `group_web_vars` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `campaign_grade` tinyint(2) unsigned DEFAULT 1,
  `hopper_calls_today` smallint(5) unsigned DEFAULT 0,
  `hopper_calls_hour` smallint(5) unsigned DEFAULT 0,
  UNIQUE KEY `vlca_user_campaign_id` (`user`,`campaign_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_agents`
--

LOCK TABLES `vicidial_campaign_agents` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_agents` DISABLE KEYS */;
INSERT INTO `vicidial_campaign_agents` VALUES ('admin','test',0,0,0,'',0,0,0);
/*!40000 ALTER TABLE `vicidial_campaign_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_cid_areacodes`
--

DROP TABLE IF EXISTS `vicidial_campaign_cid_areacodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_cid_areacodes` (
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `areacode` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `outbound_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N','') COLLATE utf8_unicode_ci DEFAULT '',
  `cid_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_count_today` mediumint(7) DEFAULT 0,
  UNIQUE KEY `campareacode` (`campaign_id`,`areacode`,`outbound_cid`),
  KEY `campaign_id` (`campaign_id`),
  KEY `areacode` (`areacode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_cid_areacodes`
--

LOCK TABLES `vicidial_campaign_cid_areacodes` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_cid_areacodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_campaign_cid_areacodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_dnc`
--

DROP TABLE IF EXISTS `vicidial_campaign_dnc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_dnc` (
  `phone_number` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `phonecamp` (`phone_number`,`campaign_id`),
  KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_dnc`
--

LOCK TABLES `vicidial_campaign_dnc` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_dnc` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_campaign_dnc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_hotkeys`
--

DROP TABLE IF EXISTS `vicidial_campaign_hotkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_hotkeys` (
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `hotkey` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `status_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selectable` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_hotkeys`
--

LOCK TABLES `vicidial_campaign_hotkeys` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_hotkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_campaign_hotkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_hour_counts`
--

DROP TABLE IF EXISTS `vicidial_campaign_hour_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_hour_counts` (
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_hour` datetime DEFAULT NULL,
  `next_hour` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `type` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'CALLS',
  `calls` mediumint(6) unsigned DEFAULT 0,
  `hr` tinyint(2) DEFAULT 0,
  UNIQUE KEY `vchc_camp_hour` (`campaign_id`,`date_hour`,`type`),
  KEY `campaign_id` (`campaign_id`),
  KEY `date_hour` (`date_hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_hour_counts`
--

LOCK TABLES `vicidial_campaign_hour_counts` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_hour_counts` DISABLE KEYS */;
INSERT INTO `vicidial_campaign_hour_counts` VALUES ('test','2021-07-10 13:00:00','2021-07-10 14:00:00','2021-07-10 13:04:07','CALLS',0,13),('test','2021-07-10 00:00:00','2021-07-10 01:00:00','2021-07-10 13:03:05','CALLS',0,0),('test','2021-07-10 01:00:00','2021-07-10 02:00:00','2021-07-10 13:03:05','CALLS',0,1),('test','2021-07-10 02:00:00','2021-07-10 03:00:00','2021-07-10 13:03:05','CALLS',0,2),('test','2021-07-10 03:00:00','2021-07-10 04:00:00','2021-07-10 13:03:05','CALLS',0,3),('test','2021-07-10 04:00:00','2021-07-10 05:00:00','2021-07-10 13:03:05','CALLS',0,4),('test','2021-07-10 05:00:00','2021-07-10 06:00:00','2021-07-10 13:03:05','CALLS',0,5),('test','2021-07-10 06:00:00','2021-07-10 07:00:00','2021-07-10 13:03:05','CALLS',0,6),('test','2021-07-10 07:00:00','2021-07-10 08:00:00','2021-07-10 13:03:05','CALLS',0,7),('test','2021-07-10 08:00:00','2021-07-10 09:00:00','2021-07-10 13:03:05','CALLS',0,8),('test','2021-07-10 09:00:00','2021-07-10 10:00:00','2021-07-10 13:03:05','CALLS',0,9),('test','2021-07-10 10:00:00','2021-07-10 11:00:00','2021-07-10 13:03:05','CALLS',0,10),('test','2021-07-10 11:00:00','2021-07-10 12:00:00','2021-07-10 13:03:05','CALLS',0,11),('test','2021-07-10 12:00:00','2021-07-10 13:00:00','2021-07-10 13:03:05','CALLS',0,12);
/*!40000 ALTER TABLE `vicidial_campaign_hour_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_hour_counts_archive`
--

DROP TABLE IF EXISTS `vicidial_campaign_hour_counts_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_hour_counts_archive` (
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_hour` datetime DEFAULT NULL,
  `next_hour` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `type` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'CALLS',
  `calls` mediumint(6) unsigned DEFAULT 0,
  `hr` tinyint(2) DEFAULT 0,
  UNIQUE KEY `vchc_camp_hour` (`campaign_id`,`date_hour`,`type`),
  KEY `campaign_id` (`campaign_id`),
  KEY `date_hour` (`date_hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_hour_counts_archive`
--

LOCK TABLES `vicidial_campaign_hour_counts_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_hour_counts_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_campaign_hour_counts_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_server_stats`
--

DROP TABLE IF EXISTS `vicidial_campaign_server_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_server_stats` (
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `local_trunk_shortage` smallint(5) unsigned DEFAULT 0,
  KEY `campaign_id` (`campaign_id`),
  KEY `server_ip` (`server_ip`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_server_stats`
--

LOCK TABLES `vicidial_campaign_server_stats` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_server_stats` DISABLE KEYS */;
INSERT INTO `vicidial_campaign_server_stats` VALUES ('','192.168.1.180','2021-07-11 07:10:04',0);
/*!40000 ALTER TABLE `vicidial_campaign_server_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_stats`
--

DROP TABLE IF EXISTS `vicidial_campaign_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_stats` (
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dialable_leads` int(9) unsigned DEFAULT 0,
  `calls_today` int(9) unsigned DEFAULT 0,
  `answers_today` int(9) unsigned DEFAULT 0,
  `drops_today` decimal(12,3) DEFAULT 0.000,
  `drops_today_pct` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `drops_answers_today_pct` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `calls_hour` int(9) unsigned DEFAULT 0,
  `answers_hour` int(9) unsigned DEFAULT 0,
  `drops_hour` int(9) unsigned DEFAULT 0,
  `drops_hour_pct` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `calls_halfhour` int(9) unsigned DEFAULT 0,
  `answers_halfhour` int(9) unsigned DEFAULT 0,
  `drops_halfhour` int(9) unsigned DEFAULT 0,
  `drops_halfhour_pct` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `calls_fivemin` int(9) unsigned DEFAULT 0,
  `answers_fivemin` int(9) unsigned DEFAULT 0,
  `drops_fivemin` int(9) unsigned DEFAULT 0,
  `drops_fivemin_pct` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `calls_onemin` int(9) unsigned DEFAULT 0,
  `answers_onemin` int(9) unsigned DEFAULT 0,
  `drops_onemin` int(9) unsigned DEFAULT 0,
  `drops_onemin_pct` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `differential_onemin` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `agents_average_onemin` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `balance_trunk_fill` smallint(5) unsigned DEFAULT 0,
  `status_category_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_category_count_1` int(9) unsigned DEFAULT 0,
  `status_category_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_category_count_2` int(9) unsigned DEFAULT 0,
  `status_category_3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_category_count_3` int(9) unsigned DEFAULT 0,
  `status_category_4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_category_count_4` int(9) unsigned DEFAULT 0,
  `hold_sec_stat_one` mediumint(8) unsigned DEFAULT 0,
  `hold_sec_stat_two` mediumint(8) unsigned DEFAULT 0,
  `agent_non_pause_sec` mediumint(8) unsigned DEFAULT 0,
  `hold_sec_answer_calls` mediumint(8) unsigned DEFAULT 0,
  `hold_sec_drop_calls` mediumint(8) unsigned DEFAULT 0,
  `hold_sec_queue_calls` mediumint(8) unsigned DEFAULT 0,
  `agent_calls_today` int(9) unsigned DEFAULT 0,
  `agent_wait_today` bigint(14) unsigned DEFAULT 0,
  `agent_custtalk_today` bigint(14) unsigned DEFAULT 0,
  `agent_acw_today` bigint(14) unsigned DEFAULT 0,
  `agent_pause_today` bigint(14) unsigned DEFAULT 0,
  `answering_machines_today` int(9) unsigned DEFAULT 0,
  `agenthandled_today` int(9) unsigned DEFAULT 0,
  `park_calls_today` mediumint(8) unsigned DEFAULT 0,
  `park_sec_today` bigint(14) unsigned DEFAULT 0,
  PRIMARY KEY (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_stats`
--

LOCK TABLES `vicidial_campaign_stats` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_stats` DISABLE KEYS */;
INSERT INTO `vicidial_campaign_stats` VALUES ('AGENTDIRECT','2021-07-08 13:05:09',0,0,0,0.000,'0','0',0,0,0,'0',0,0,0,'0',0,0,0,'0',0,0,0,'0','0','0',0,'',0,'',0,'',0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('AGENTDIRECT_CHAT','2021-07-08 13:05:09',0,0,0,0.000,'0','0',0,0,0,'0',0,0,0,'0',0,0,0,'0',0,0,0,'0','0','0',0,'',0,'',0,'',0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('test','2021-07-10 07:33:06',0,0,0,0.000,'0','0',0,0,0,'0',0,0,0,'0',0,0,0,'0',0,0,0,'0','0','0',0,'',0,'',0,'',0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `vicidial_campaign_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_stats_debug`
--

DROP TABLE IF EXISTS `vicidial_campaign_stats_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_stats_debug` (
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `entry_time` datetime DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `debug_output` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `adapt_output` text COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `campserver` (`campaign_id`,`server_ip`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_stats_debug`
--

LOCK TABLES `vicidial_campaign_stats_debug` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_stats_debug` DISABLE KEYS */;
INSERT INTO `vicidial_campaign_stats_debug` VALUES ('--ALL--','SHARED',NULL,'2021-07-08 13:05:08',NULL,NULL),('-SHARE-','192.168.1.180','2021-07-11 12:40:01','2021-07-11 07:10:04',NULL,''),('','192.168.1.180','2021-07-11 12:40:04','2021-07-11 07:10:04','0     : agents: 0 (READY: 0)    dial_level: 0     (||)   \n0     : Calls to place: 0 (0 - 0 [0 + 0|0|0|0]) 0   \n\nCAMPAIGN DIFFERENTIAL: 0   0   (0 - 0)\nLOCAL TRUNK SHORTAGE: 0|0  (0 - 23)\n',NULL),('AGENTDIRECT','INBOUND','2021-07-11 12:39:29','2021-07-11 07:09:29','     ANSWERED STATUSES: AGENTDIRECT|DROP,XDROP,CALLBK,CBHOLD,DEC,DNC,SALE,NI,NP,XFER,RQXFER,TIMEOT,AFTHRS,NANQUE,PDROP,IVRXFR,SVYCLM,MLINAT,MAXCAL,LRERR,QCFAIL|\n     DAILY STATS|0|0|0|0         IN-GROUP: AGENTDIRECT   CALLS: 0   ANSWER: 0   DROPS: 0\n               Stat1: 0   Stat2: 0   Hold: 0|0|0\n',NULL),('AGENTDIRECT_CHAT','INBOUND','2021-07-11 12:39:29','2021-07-11 07:09:29','     ANSWERED STATUSES: AGENTDIRECT_CHAT|DROP,XDROP,CALLBK,CBHOLD,DEC,DNC,SALE,NI,NP,XFER,RQXFER,TIMEOT,AFTHRS,NANQUE,PDROP,IVRXFR,SVYCLM,MLINAT,MAXCAL,LRERR,QCFAIL|\n     DAILY STATS|0|0|0|1         IN-GROUP: AGENTDIRECT_CHAT   CALLS: 0   ANSWER: 0   DROPS: 0\n               Stat1: 0   Stat2: 0   Hold: 0|0|0\n',NULL),('test','',NULL,'2021-07-10 07:33:04',NULL,NULL),('test','HOPPER','2021-07-11 12:40:01','2021-07-11 07:10:01','Starting hopper run for test campaign- GMT: 24hours   HOPPER LEVEL: 1   ORDER: DOWN|N|LEAD_ASCEND\n     Hopper Ready count: 0     Local Call Time: 24hours \n     campaign lists count ACTIVE: 0 | TOTAL: 0 \n     leads to call count:  0 \n     hopper too low (0|1) starting hopper dump \n     ERROR CANNOT ADD ANY LEADS TO HOPPER \n',NULL),('test','ADAPT',NULL,'2021-07-11 05:36:48',NULL,NULL),('test','SHARED',NULL,'2021-07-11 05:36:50',NULL,NULL);
/*!40000 ALTER TABLE `vicidial_campaign_stats_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_statuses`
--

DROP TABLE IF EXISTS `vicidial_campaign_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_statuses` (
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `status_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selectable` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `human_answered` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `category` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'UNDEFINED',
  `sale` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dnc` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `customer_contact` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `not_interested` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `unworkable` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callback` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `completed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `min_sec` int(5) unsigned DEFAULT 0,
  `max_sec` int(5) unsigned DEFAULT 0,
  `answering_machine` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  UNIQUE KEY `vicidial_campaign_statuses_key` (`status`,`campaign_id`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_statuses`
--

LOCK TABLES `vicidial_campaign_statuses` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_campaign_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaigns`
--

DROP TABLE IF EXISTS `vicidial_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaigns` (
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_a` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_b` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_c` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_d` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_e` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_order` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `park_ext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `park_file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default',
  `web_form_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_closers` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `hopper_level` int(8) unsigned DEFAULT 1,
  `auto_dial_level` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `next_agent_call` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'longest_wait_time',
  `local_call_time` varchar(10) COLLATE utf8_unicode_ci DEFAULT '9am-9pm',
  `voicemail_ext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_timeout` tinyint(3) unsigned DEFAULT 60,
  `dial_prefix` varchar(20) COLLATE utf8_unicode_ci DEFAULT '9',
  `campaign_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0000000000',
  `campaign_vdad_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8368',
  `campaign_rec_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8309',
  `campaign_recording` enum('NEVER','ONDEMAND','ALLCALLS','ALLFORCE') COLLATE utf8_unicode_ci DEFAULT 'ONDEMAND',
  `campaign_rec_filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'FULLDATE_CUSTPHONE',
  `campaign_script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `get_call_launch` enum('NONE','SCRIPT','SCRIPTTWO','WEBFORM','WEBFORMTWO','WEBFORMTHREE','FORM','PREVIEW_WEBFORM','PREVIEW_WEBFORMTWO','PREVIEW_WEBFORMTHREE','PREVIEW_SCRIPT','PREVIEW_SCRIPTTWO','PREVIEW_FORM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `am_message_exten` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'vm-goodbye',
  `amd_send_to_vmx` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `xferconf_a_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_a_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_b_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_b_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_number_dialing` enum('N','Y','SELECTED','SELECTED_TIMER_ALT','SELECTED_TIMER_ADDR3','UNSELECTED','UNSELECTED_TIMER_ALT','UNSELECTED_TIMER_ADDR3') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `lead_filter_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `drop_call_seconds` tinyint(3) DEFAULT 5,
  `drop_action` enum('HANGUP','MESSAGE','VOICEMAIL','IN_GROUP','AUDIO','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'AUDIO',
  `safe_harbor_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8307',
  `display_dialable_count` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `wrapup_seconds` smallint(3) unsigned DEFAULT 0,
  `wrapup_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Wrapup Call',
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_internal_dnc` enum('Y','N','AREACODE') COLLATE utf8_unicode_ci DEFAULT 'N',
  `allcalls_delay` smallint(3) unsigned DEFAULT 0,
  `omit_phone_code` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dial_method` enum('MANUAL','RATIO','ADAPT_HARD_LIMIT','ADAPT_TAPERED','ADAPT_AVERAGE','INBOUND_MAN','SHARED_RATIO','SHARED_ADAPT_HARD_LIMIT','SHARED_ADAPT_TAPERED','SHARED_ADAPT_AVERAGE') COLLATE utf8_unicode_ci DEFAULT 'MANUAL',
  `available_only_ratio_tally` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `adaptive_dropped_percentage` varchar(4) COLLATE utf8_unicode_ci DEFAULT '3',
  `adaptive_maximum_level` varchar(6) COLLATE utf8_unicode_ci DEFAULT '3.0',
  `adaptive_latest_server_time` varchar(4) COLLATE utf8_unicode_ci DEFAULT '2100',
  `adaptive_intensity` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `adaptive_dl_diff_target` smallint(3) DEFAULT 0,
  `concurrent_transfers` enum('AUTO','1','2','3','4','5','6','7','8','9','10','15','20','25','30','40','50','60','80','100','1000','10000') COLLATE utf8_unicode_ci DEFAULT 'AUTO',
  `auto_alt_dial` enum('NONE','ALT_ONLY','ADDR3_ONLY','ALT_AND_ADDR3','ALT_AND_EXTENDED','ALT_AND_ADDR3_AND_EXTENDED','EXTENDED_ONLY','MULTI_LEAD') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `auto_alt_dial_statuses` varchar(255) COLLATE utf8_unicode_ci DEFAULT ' B N NA DC -',
  `agent_pause_codes_active` enum('Y','N','FORCE') COLLATE utf8_unicode_ci DEFAULT 'N',
  `campaign_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_changedate` datetime DEFAULT NULL,
  `campaign_stats_refresh` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `campaign_logindate` datetime DEFAULT NULL,
  `dial_statuses` varchar(255) COLLATE utf8_unicode_ci DEFAULT ' NEW -',
  `disable_alter_custdata` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `no_hopper_leads_logins` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `list_order_mix` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `campaign_allow_inbound` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manual_dial_list_id` bigint(14) unsigned DEFAULT 998,
  `default_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `xfer_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `queue_priority` tinyint(2) DEFAULT 50,
  `drop_inbound_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `qc_enabled` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `qc_statuses` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_lists` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_shift_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '24HRMIDNIGHT',
  `qc_get_record_launch` enum('NONE','SCRIPT','WEBFORM','QCSCRIPT','QCWEBFORM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `qc_show_recording` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `qc_web_form_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_first_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_dtmf_digits` varchar(16) COLLATE utf8_unicode_ci DEFAULT '1238',
  `survey_ni_digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '8',
  `survey_opt_in_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_ni_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_method` enum('AGENT_XFER','VOICEMAIL','EXTENSION','HANGUP','CAMPREC_60_WAV','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'AGENT_XFER',
  `survey_no_response_action` enum('OPTIN','OPTOUT','DROP') COLLATE utf8_unicode_ci DEFAULT 'OPTIN',
  `survey_ni_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NI',
  `survey_response_digit_map` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1-DEMOCRAT|2-REPUBLICAN|3-INDEPENDANT|8-OPTOUT|X-NO RESPONSE|',
  `survey_xfer_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `survey_camp_record_dir` varchar(255) COLLATE utf8_unicode_ci DEFAULT '/home/survey',
  `disable_alter_custphone` enum('Y','N','HIDE') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `display_queue_count` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `manual_dial_filter` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `agent_clipboard_copy` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `agent_extended_alt_dial` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `use_campaign_dnc` enum('Y','N','AREACODE') COLLATE utf8_unicode_ci DEFAULT 'N',
  `three_way_call_cid` enum('CAMPAIGN','CUSTOMER','AGENT_PHONE','AGENT_CHOOSE','CUSTOM_CID') COLLATE utf8_unicode_ci DEFAULT 'CAMPAIGN',
  `three_way_dial_prefix` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `web_form_target` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'vdcwebform',
  `vtiger_search_category` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'LEAD',
  `vtiger_create_call_record` enum('Y','N','DISPO') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `vtiger_create_lead_record` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `vtiger_screen_login` enum('Y','N','NEW_WINDOW') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `cpd_amd_action` enum('DISABLED','DISPO','MESSAGE','CALLMENU','INGROUP') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_allow_group_alias` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `default_group_alias` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `vtiger_search_dead` enum('DISABLED','ASK','RESURRECT') COLLATE utf8_unicode_ci DEFAULT 'ASK',
  `vtiger_status_call` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `survey_third_digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_third_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_third_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NI',
  `survey_third_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `survey_fourth_digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_fourth_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_fourth_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NI',
  `survey_fourth_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `drop_lockout_time` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `quick_transfer_button` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'N',
  `prepopulate_transfer_preset` enum('N','PRESET_1','PRESET_2','PRESET_3','PRESET_4','PRESET_5') COLLATE utf8_unicode_ci DEFAULT 'N',
  `drop_rate_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `view_calls_in_queue` enum('NONE','ALL','1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `view_calls_in_queue_launch` enum('AUTO','MANUAL') COLLATE utf8_unicode_ci DEFAULT 'MANUAL',
  `grab_calls_in_queue` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `call_requeue_button` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `pause_after_each_call` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `no_hopper_dialing` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `agent_dial_owner_only` enum('NONE','USER','TERRITORY','USER_GROUP','USER_BLANK','TERRITORY_BLANK','USER_GROUP_BLANK') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `agent_display_dialable_leads` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `web_form_address_two` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `waitforsilence_options` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_select_territories` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `campaign_calldate` datetime DEFAULT NULL,
  `crm_popup_login` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `crm_login_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timer_action` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `timer_action_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `timer_action_seconds` mediumint(7) DEFAULT -1,
  `start_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dispo_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_c_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_d_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_e_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `use_custom_cid` enum('Y','N','AREACODE','USER_CUSTOM_1','USER_CUSTOM_2','USER_CUSTOM_3','USER_CUSTOM_4','USER_CUSTOM_5') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks_alert` enum('NONE','BLINK','RED','BLINK_RED','BLINK_DEFER','RED_DEFER','BLINK_RED_DEFER') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `queuemetrics_callstatus_override` enum('DISABLED','NO','YES') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `extension_appended_cidname` enum('Y','N','Y_USER','Y_WITH_CAMPAIGN','Y_USER_WITH_CAMPAIGN') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks_count` enum('LIVE','ALL_ACTIVE') COLLATE utf8_unicode_ci DEFAULT 'ALL_ACTIVE',
  `manual_dial_override` enum('NONE','ALLOW_ALL','DISABLE_ALL') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `blind_monitor_warning` enum('DISABLED','ALERT','NOTICE','AUDIO','ALERT_NOTICE','ALERT_AUDIO','NOTICE_AUDIO','ALL') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `blind_monitor_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Someone is blind monitoring your session',
  `blind_monitor_filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `inbound_queue_no_dial` enum('DISABLED','ENABLED','ALL_SERVERS','ENABLED_WITH_CHAT','ALL_SERVERS_WITH_CHAT') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `timer_action_destination` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `enable_xfer_presets` enum('DISABLED','ENABLED','CONTACTS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `hide_xfer_number_to_dial` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manual_dial_prefix` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_3way_hangup_logging` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `customer_3way_hangup_seconds` smallint(5) unsigned DEFAULT 5,
  `customer_3way_hangup_action` enum('NONE','DISPO') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `ivr_park_call` enum('DISABLED','ENABLED','ENABLED_PARK_ONLY','ENABLED_BUTTON_HIDDEN') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `ivr_park_call_agi` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_preview_dial` enum('DISABLED','PREVIEW_AND_SKIP','PREVIEW_ONLY') COLLATE utf8_unicode_ci DEFAULT 'PREVIEW_AND_SKIP',
  `realtime_agent_time_stats` enum('DISABLED','WAIT_CUST_ACW','WAIT_CUST_ACW_PAUSE','CALLS_WAIT_CUST_ACW_PAUSE') COLLATE utf8_unicode_ci DEFAULT 'CALLS_WAIT_CUST_ACW_PAUSE',
  `use_auto_hopper` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `auto_hopper_multi` varchar(6) COLLATE utf8_unicode_ci DEFAULT '1',
  `auto_hopper_level` mediumint(8) unsigned DEFAULT 0,
  `auto_trim_hopper` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `api_manual_dial` enum('STANDARD','QUEUE','QUEUE_AND_AUTOCALL') COLLATE utf8_unicode_ci DEFAULT 'STANDARD',
  `manual_dial_call_time_check` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `display_leads_count` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `lead_order_randomize` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `lead_order_secondary` enum('LEAD_ASCEND','LEAD_DESCEND','CALLTIME_ASCEND','CALLTIME_DESCEND','VENDOR_ASCEND','VENDOR_DESCEND') COLLATE utf8_unicode_ci DEFAULT 'LEAD_ASCEND',
  `per_call_notes` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `my_callback_option` enum('CHECKED','UNCHECKED') COLLATE utf8_unicode_ci DEFAULT 'UNCHECKED',
  `agent_lead_search` enum('ENABLED','LIVE_CALL_INBOUND','LIVE_CALL_INBOUND_AND_MANUAL','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_lead_search_method` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'CAMPLISTS_ALL',
  `queuemetrics_phone_environment` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `auto_pause_precall` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `auto_pause_precall_code` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'PRECAL',
  `auto_resume_precall` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manual_dial_cid` enum('CAMPAIGN','AGENT_PHONE','AGENT_PHONE_OVERRIDE') COLLATE utf8_unicode_ci DEFAULT 'CAMPAIGN',
  `post_phone_time_diff_alert` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `custom_3way_button_transfer` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `available_only_tally_threshold` enum('DISABLED','LOGGED-IN_AGENTS','NON-PAUSED_AGENTS','WAITING_AGENTS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `available_only_tally_threshold_agents` smallint(5) unsigned DEFAULT 0,
  `dial_level_threshold` enum('DISABLED','LOGGED-IN_AGENTS','NON-PAUSED_AGENTS','WAITING_AGENTS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `dial_level_threshold_agents` smallint(5) unsigned DEFAULT 0,
  `safe_harbor_audio` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'buzz',
  `safe_harbor_menu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_menu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `callback_days_limit` smallint(3) DEFAULT 0,
  `dl_diff_target_method` enum('ADAPT_CALC_ONLY','CALLS_PLACED') COLLATE utf8_unicode_ci DEFAULT 'ADAPT_CALC_ONLY',
  `disable_dispo_screen` enum('DISPO_ENABLED','DISPO_DISABLED','DISPO_SELECT_DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISPO_ENABLED',
  `disable_dispo_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `screen_labels` varchar(20) COLLATE utf8_unicode_ci DEFAULT '--SYSTEM-SETTINGS--',
  `status_display_fields` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'CALLID',
  `na_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_recording` enum('Y','N','Y_WITH_AMD') COLLATE utf8_unicode_ci DEFAULT 'N',
  `pllb_grouping` enum('DISABLED','ONE_SERVER_ONLY','CASCADING') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `pllb_grouping_limit` smallint(5) DEFAULT 50,
  `call_count_limit` smallint(5) unsigned DEFAULT 0,
  `call_count_target` smallint(5) unsigned DEFAULT 3,
  `callback_hours_block` tinyint(2) DEFAULT 0,
  `callback_list_calltime` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `hopper_vlc_dup_check` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `in_group_dial` enum('DISABLED','MANUAL_DIAL','NO_DIAL','BOTH') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `in_group_dial_select` enum('AGENT_SELECTED','CAMPAIGN_SELECTED','ALL_USER_GROUP') COLLATE utf8_unicode_ci DEFAULT 'CAMPAIGN_SELECTED',
  `safe_harbor_audio_field` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `pause_after_next_call` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `owner_populate` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `use_other_campaign_dnc` varchar(8) COLLATE utf8_unicode_ci DEFAULT '',
  `allow_emails` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `amd_inbound_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `amd_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_wait_sec` tinyint(3) DEFAULT 10,
  `manual_dial_lead_id` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dead_max` smallint(5) unsigned DEFAULT 0,
  `dead_max_dispo` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'DCMX',
  `dispo_max` smallint(5) unsigned DEFAULT 0,
  `dispo_max_dispo` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'DISMX',
  `pause_max` smallint(5) unsigned DEFAULT 0,
  `max_inbound_calls` smallint(5) unsigned DEFAULT 0,
  `manual_dial_search_checkbox` enum('SELECTED','SELECTED_RESET','UNSELECTED','UNSELECTED_RESET','SELECTED_LOCK','UNSELECTED_LOCK') COLLATE utf8_unicode_ci DEFAULT 'SELECTED',
  `hide_call_log_info` enum('Y','N','SHOW_1','SHOW_2','SHOW_3','SHOW_4','SHOW_5','SHOW_6','SHOW_7','SHOW_8','SHOW_9','SHOW_10') COLLATE utf8_unicode_ci DEFAULT 'N',
  `timer_alt_seconds` smallint(5) DEFAULT 0,
  `wrapup_bypass` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `wrapup_after_hotkey` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `callback_active_limit` smallint(5) unsigned DEFAULT 0,
  `callback_active_limit_override` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `allow_chats` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `comments_all_tabs` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `comments_dispo_screen` enum('DISABLED','ENABLED','REPLACE_CALL_NOTES') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `comments_callback_screen` enum('DISABLED','ENABLED','REPLACE_CB_NOTES') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `qc_comment_history` enum('CLICK','AUTO_OPEN','CLICK_ALLOW_MINIMIZE','AUTO_OPEN_ALLOW_MINIMIZE') COLLATE utf8_unicode_ci DEFAULT 'CLICK',
  `show_previous_callback` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `clear_script` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `cpd_unknown_action` enum('DISABLED','DISPO','MESSAGE','CALLMENU','INGROUP') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manual_dial_search_filter` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `web_form_address_three` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_dial_override_field` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `status_display_ingroup` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `customer_gone_seconds` smallint(5) unsigned DEFAULT 30,
  `agent_display_fields` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `am_message_wildcards` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manual_dial_timeout` varchar(3) COLLATE utf8_unicode_ci DEFAULT '',
  `routing_initiated_recordings` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `manual_dial_hopper_check` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `callback_useronly_move_minutes` mediumint(5) unsigned DEFAULT 0,
  `ofcom_uk_drop_calc` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manual_auto_next` smallint(5) unsigned DEFAULT 0,
  `manual_auto_show` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `allow_required_fields` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dead_to_dispo` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_xfer_validation` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `ready_max_logout` mediumint(7) DEFAULT 0,
  `callback_display_days` smallint(3) DEFAULT 0,
  `three_way_record_stop` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hangup_xfer_record_start` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks_email_alert` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `max_inbound_calls_outcome` enum('DEFAULT','ALLOW_AGENTDIRECT','ALLOW_MI_PAUSE','ALLOW_AGENTDIRECT_AND_MI_PAUSE') COLLATE utf8_unicode_ci DEFAULT 'DEFAULT',
  `manual_auto_next_options` enum('DEFAULT','PAUSE_NO_COUNT') COLLATE utf8_unicode_ci DEFAULT 'DEFAULT',
  `agent_screen_time_display` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `next_dial_my_callbacks` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `inbound_no_agents_no_dial_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `inbound_no_agents_no_dial_threshold` smallint(5) DEFAULT 0,
  `cid_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `pause_max_dispo` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'PAUSMX',
  `script_top_dispo` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dead_trigger_seconds` smallint(5) DEFAULT 0,
  `dead_trigger_action` enum('DISABLED','AUDIO','URL','AUDIO_AND_URL') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `dead_trigger_repeat` enum('NO','REPEAT_ALL','REPEAT_AUDIO','REPEAT_URL') COLLATE utf8_unicode_ci DEFAULT 'NO',
  `dead_trigger_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dead_trigger_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `scheduled_callbacks_force_dial` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks_auto_reschedule` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `scheduled_callbacks_timezones_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `three_way_volume_buttons` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `callback_dnc` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manual_dial_validation` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `mute_recordings` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `auto_active_list_new` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `call_quota_lead_ranking` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `call_quota_process_running` tinyint(3) DEFAULT 0,
  `call_quota_last_run_date` datetime DEFAULT NULL,
  `sip_event_logging` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `campaign_script_two` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `leave_vm_no_dispo` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `leave_vm_message_group_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `dial_timeout_lead_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `amd_type` enum('AMD','CPD','KHOMP') COLLATE utf8_unicode_ci DEFAULT 'AMD',
  `vmm_daily_limit` tinyint(3) unsigned DEFAULT 0,
  `opensips_cid_name` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `amd_agent_route_options` enum('ENABLED','DISABLED','PENDING') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `browser_alert_sound` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `browser_alert_volume` tinyint(3) unsigned DEFAULT 50,
  `three_way_record_stop_exception` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `pause_max_exceptions` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `hopper_drop_run_trigger` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `daily_call_count_limit` tinyint(3) unsigned DEFAULT 0,
  `daily_limit_manual` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `transfer_button_launch` varchar(12) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `shared_dial_rank` tinyint(3) DEFAULT 99,
  `agent_search_method` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_statuses_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `clear_form` enum('DISABLED','ENABLED','ACKNOWLEDGE') COLLATE utf8_unicode_ci DEFAULT 'ACKNOWLEDGE',
  `leave_3way_start_recording` enum('DISABLED','ALL_CALLS','ALL_BUT_EXCEPTIONS','ONLY_EXCEPTIONS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `leave_3way_start_recording_exception` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `calls_waiting_vl_one` varchar(25) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `calls_waiting_vl_two` varchar(25) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `calls_inqueue_count_one` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `calls_inqueue_count_two` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `in_man_dial_next_ready_seconds` smallint(5) unsigned DEFAULT 0,
  `in_man_dial_next_ready_seconds_override` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `transfer_no_dispo` enum('DISABLED','EXTERNAL_ONLY','LOCAL_ONLY','LEAVE3WAY_ONLY','LOCAL_AND_EXTERNAL','LOCAL_AND_LEAVE3WAY','LEAVE3WAY_AND_EXTERNAL','LOCAL_AND_EXTERNAL_AND_LEAVE3WAY') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  PRIMARY KEY (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaigns`
--

LOCK TABLES `vicidial_campaigns` WRITE;
/*!40000 ALTER TABLE `vicidial_campaigns` DISABLE KEYS */;
INSERT INTO `vicidial_campaigns` VALUES ('test','testcamp','Y','','','','','','DOWN','','default','','Y',1,'0','longest_wait_time','24hours','',60,'91','0000000000','8368','8309','ONDEMAND','FULLDATE_CUSTPHONE','','NONE','vm-goodbye','N','','','','','N','N','NONE',5,'AUDIO','8307','Y',0,'Wrapup Call',NULL,'N',0,'N','MANUAL','N','3','3.0','2100','0',0,'AUTO','NONE',' B N NA DC -','N','test','2021-07-10 07:33:23','N',NULL,' NEW -','N','N','DISABLED','N',998,'---NONE---','',50,'---NONE---','N',NULL,NULL,'24HRMIDNIGHT','NONE','Y',NULL,NULL,'US_pol_survey_hello','1238','8','US_pol_survey_transfer','US_thanks_no_contact','AGENT_XFER','OPTIN','NI','1-DEMOCRAT|2-REPUBLICAN|3-INDEPENDANT|8-OPTOUT|X-NO RESPONSE|','8300','/home/survey','Y','Y','NONE','NONE','N','N','CAMPAIGN','','vdcwebform','LEAD','Y','Y','Y','DISABLED','N','','ASK','N','','US_thanks_no_contact','NI','8300','','US_thanks_no_contact','NI','8300','0','N','N','DISABLED','NONE','MANUAL','N','N','N','N','NONE','N','','','N',NULL,'N','','NONE','',1,'','','','','','N','NONE','DISABLED','N','ALL_ACTIVE','NONE','DISABLED','Someone is blind monitoring your session','','DISABLED','','DISABLED','DISABLED','91','ENABLED',5,'NONE','DISABLED','','PREVIEW_AND_SKIP','CALLS_WAIT_CUST_ACW_PAUSE','N','1',0,'Y','STANDARD','DISABLED','N','N','LEAD_ASCEND','DISABLED','UNCHECKED','DISABLED','CAMPLISTS_ALL','','N','PRECAL','N','CAMPAIGN','DISABLED','DISABLED','DISABLED',0,'DISABLED',0,'buzz','','',0,'ADAPT_CALC_ONLY','DISPO_ENABLED','','--SYSTEM-SETTINGS--','CALLID','','N','DISABLED',50,0,3,0,'DISABLED','---ALL---','N','DISABLED','CAMPAIGN_SELECTED','DISABLED','DISABLED','DISABLED','','N','---NONE---','---NONE---',10,'N',0,'DCMX',0,'DISMX',0,0,'SELECTED','N',0,'ENABLED','DISABLED',0,'N','N','DISABLED','DISABLED','DISABLED','CLICK','ENABLED','DISABLED','DISABLED','NONE','','ENABLED','ENABLED',30,'','N','','Y','N',0,'N',0,'N','N','DISABLED','N',0,0,'N','N','N','DEFAULT','DEFAULT','DISABLED','DISABLED','',0,'---DISABLED---','PAUSMX','N',0,'DISABLED','NO','','','N','DISABLED','DISABLED','ENABLED','DISABLED','N','N','DISABLED','DISABLED',0,NULL,'DISABLED','','DISABLED','---NONE---','DISABLED','AMD',0,'','DISABLED','---NONE---',50,'DISABLED','','N',0,'DISABLED','NONE',99,'','','','ACKNOWLEDGE','DISABLED','DISABLED','DISABLED','DISABLED','DISABLED','DISABLED',0,'DISABLED','DISABLED');
/*!40000 ALTER TABLE `vicidial_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaigns_list_mix`
--

DROP TABLE IF EXISTS `vicidial_campaigns_list_mix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaigns_list_mix` (
  `vcl_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `vcl_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_mix_container` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `mix_method` enum('EVEN_MIX','IN_ORDER','RANDOM') COLLATE utf8_unicode_ci DEFAULT 'IN_ORDER',
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci DEFAULT 'INACTIVE',
  PRIMARY KEY (`vcl_id`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaigns_list_mix`
--

LOCK TABLES `vicidial_campaigns_list_mix` WRITE;
/*!40000 ALTER TABLE `vicidial_campaigns_list_mix` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_campaigns_list_mix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_carrier_hour_counts`
--

DROP TABLE IF EXISTS `vicidial_carrier_hour_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_carrier_hour_counts` (
  `date_hour` datetime DEFAULT NULL,
  `next_hour` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'ANSWERED',
  `calls` mediumint(6) unsigned DEFAULT 0,
  `hr` tinyint(2) DEFAULT 0,
  UNIQUE KEY `vclhc_hour` (`date_hour`,`type`),
  KEY `date_hour` (`date_hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_carrier_hour_counts`
--

LOCK TABLES `vicidial_carrier_hour_counts` WRITE;
/*!40000 ALTER TABLE `vicidial_carrier_hour_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_carrier_hour_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_carrier_hour_counts_archive`
--

DROP TABLE IF EXISTS `vicidial_carrier_hour_counts_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_carrier_hour_counts_archive` (
  `date_hour` datetime DEFAULT NULL,
  `next_hour` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'ANSWERED',
  `calls` mediumint(6) unsigned DEFAULT 0,
  `hr` tinyint(2) DEFAULT 0,
  UNIQUE KEY `vclhc_hour` (`date_hour`,`type`),
  KEY `date_hour` (`date_hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_carrier_hour_counts_archive`
--

LOCK TABLES `vicidial_carrier_hour_counts_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_carrier_hour_counts_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_carrier_hour_counts_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_carrier_log`
--

DROP TABLE IF EXISTS `vicidial_carrier_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_carrier_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `call_date` datetime DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `hangup_cause` tinyint(1) unsigned DEFAULT 0,
  `dialstatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_time` smallint(3) unsigned DEFAULT 0,
  `answered_time` smallint(4) unsigned DEFAULT 0,
  `sip_hangup_cause` smallint(4) unsigned DEFAULT 0,
  `sip_hangup_reason` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`uniqueid`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_carrier_log`
--

LOCK TABLES `vicidial_carrier_log` WRITE;
/*!40000 ALTER TABLE `vicidial_carrier_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_carrier_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_carrier_log_archive`
--

DROP TABLE IF EXISTS `vicidial_carrier_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_carrier_log_archive` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `call_date` datetime DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `hangup_cause` tinyint(1) unsigned DEFAULT 0,
  `dialstatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_time` smallint(3) unsigned DEFAULT 0,
  `answered_time` smallint(4) unsigned DEFAULT 0,
  `sip_hangup_cause` smallint(4) unsigned DEFAULT 0,
  `sip_hangup_reason` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`uniqueid`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_carrier_log_archive`
--

LOCK TABLES `vicidial_carrier_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_carrier_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_carrier_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ccc_log`
--

DROP TABLE IF EXISTS `vicidial_ccc_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ccc_log` (
  `call_date` datetime DEFAULT NULL,
  `remote_call_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `local_call_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `server_ip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `container_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `remote_lead_id` int(9) unsigned DEFAULT NULL,
  KEY `call_date` (`call_date`),
  KEY `local_call_id` (`local_call_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ccc_log`
--

LOCK TABLES `vicidial_ccc_log` WRITE;
/*!40000 ALTER TABLE `vicidial_ccc_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_ccc_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ccc_log_archive`
--

DROP TABLE IF EXISTS `vicidial_ccc_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ccc_log_archive` (
  `call_date` datetime DEFAULT NULL,
  `remote_call_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `local_call_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `server_ip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `container_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `remote_lead_id` int(9) unsigned DEFAULT NULL,
  UNIQUE KEY `ccc_unq_key` (`uniqueid`,`call_date`,`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `local_call_id` (`local_call_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ccc_log_archive`
--

LOCK TABLES `vicidial_ccc_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_ccc_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_ccc_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_chat_archive`
--

DROP TABLE IF EXISTS `vicidial_chat_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_chat_archive` (
  `chat_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `chat_start_time` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_creator` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `transferring_agent` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_direct` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_direct_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `vicidial_chat_archive_lead_id_key` (`lead_id`),
  KEY `vicidial_chat_archive_start_time_key` (`chat_start_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_chat_archive`
--

LOCK TABLES `vicidial_chat_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_chat_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_chat_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_chat_log`
--

DROP TABLE IF EXISTS `vicidial_chat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_chat_log` (
  `message_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `poster` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_member_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_level` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`message_row_id`),
  KEY `vicidial_chat_log_user_key` (`poster`),
  KEY `vicidial_chat_log_chat_id` (`chat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_chat_log`
--

LOCK TABLES `vicidial_chat_log` WRITE;
/*!40000 ALTER TABLE `vicidial_chat_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_chat_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_chat_log_archive`
--

DROP TABLE IF EXISTS `vicidial_chat_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_chat_log_archive` (
  `message_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `poster` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_member_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_level` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`message_row_id`),
  KEY `vicidial_chat_log_archive_user_key` (`poster`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_chat_log_archive`
--

LOCK TABLES `vicidial_chat_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_chat_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_chat_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_chat_participants`
--

DROP TABLE IF EXISTS `vicidial_chat_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_chat_participants` (
  `chat_participant_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` int(9) unsigned DEFAULT NULL,
  `chat_member` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_member_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ping_date` datetime DEFAULT NULL,
  `vd_agent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`chat_participant_id`),
  UNIQUE KEY `vicidial_chat_participants_key` (`chat_id`,`chat_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_chat_participants`
--

LOCK TABLES `vicidial_chat_participants` WRITE;
/*!40000 ALTER TABLE `vicidial_chat_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_chat_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_cid_groups`
--

DROP TABLE IF EXISTS `vicidial_cid_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_cid_groups` (
  `cid_group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cid_group_notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `cid_group_type` enum('AREACODE','STATE','NONE') COLLATE utf8_unicode_ci DEFAULT 'AREACODE',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `cid_auto_rotate_minutes` mediumint(7) unsigned DEFAULT 0,
  `cid_auto_rotate_minimum` mediumint(7) unsigned DEFAULT 0,
  `cid_auto_rotate_calls` mediumint(7) unsigned DEFAULT 0,
  `cid_last_auto_rotate` datetime DEFAULT NULL,
  `cid_auto_rotate_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`cid_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_cid_groups`
--

LOCK TABLES `vicidial_cid_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_cid_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_cid_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_closer_log`
--

DROP TABLE IF EXISTS `vicidial_closer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_closer_log` (
  `closecallid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `queue_seconds` decimal(7,2) DEFAULT 0.00,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xfercallid` int(9) unsigned DEFAULT NULL,
  `term_reason` enum('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','HOLDRECALLXFER','HOLDTIME','NOAGENT','NONE','MAXCALLS','ACFILTER','CLOSETIME') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `agent_only` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `queue_position` smallint(4) unsigned DEFAULT 1,
  `called_count` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`closecallid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `campaign_id` (`campaign_id`),
  KEY `uniqueid` (`uniqueid`),
  KEY `phone_number` (`phone_number`),
  KEY `date_user` (`call_date`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_closer_log`
--

LOCK TABLES `vicidial_closer_log` WRITE;
/*!40000 ALTER TABLE `vicidial_closer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_closer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_closer_log_archive`
--

DROP TABLE IF EXISTS `vicidial_closer_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_closer_log_archive` (
  `closecallid` int(9) unsigned NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `queue_seconds` decimal(7,2) DEFAULT 0.00,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xfercallid` int(9) unsigned DEFAULT NULL,
  `term_reason` enum('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','HOLDRECALLXFER','HOLDTIME','NOAGENT','NONE','MAXCALLS','ACFILTER','CLOSETIME') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `agent_only` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `queue_position` smallint(4) unsigned DEFAULT 1,
  `called_count` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`closecallid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `campaign_id` (`campaign_id`),
  KEY `uniqueid` (`uniqueid`),
  KEY `phone_number` (`phone_number`),
  KEY `date_user` (`call_date`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_closer_log_archive`
--

LOCK TABLES `vicidial_closer_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_closer_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_closer_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_comments`
--

DROP TABLE IF EXISTS `vicidial_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_comments` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `user_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `list_id` bigint(14) unsigned NOT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `hidden_user_id` int(11) DEFAULT NULL,
  `hidden_timestamp` datetime DEFAULT NULL,
  `unhidden_user_id` int(11) DEFAULT NULL,
  `unhidden_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_comments`
--

LOCK TABLES `vicidial_comments` WRITE;
/*!40000 ALTER TABLE `vicidial_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_conf_templates`
--

DROP TABLE IF EXISTS `vicidial_conf_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_conf_templates` (
  `template_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `template_contents` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  UNIQUE KEY `template_id` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_conf_templates`
--

LOCK TABLES `vicidial_conf_templates` WRITE;
/*!40000 ALTER TABLE `vicidial_conf_templates` DISABLE KEYS */;
INSERT INTO `vicidial_conf_templates` VALUES ('SIP_generic','SIP phone generic','type=friend\nhost=dynamic\ncanreinvite=no\ncontext=default','---ALL---'),('IAX_generic','IAX phone generic','type=friend\nhost=dynamic\nmaxauthreq=10\nauth=md5,plaintext,rsa\ncontext=default','---ALL---'),('webRTC','VICIphone','type=friend\r\nhost=dynamic\r\nencryption=yes\r\navpf=yes\r\nicesupport=yes\r\ndirectmedia=no\r\ntransport=wss\r\nforce_avp=yes\r\ndtlsenable=yes\r\ndtlsverify=no\r\ndtlscertfile=/etc/certbot/live/FQDN/cert.pem\r\ndtlsprivatekey=/etc/certbot/live/FQDN/privkey.pem\r\ndtlssetup=actpass','---ALL---');
/*!40000 ALTER TABLE `vicidial_conf_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_conferences`
--

DROP TABLE IF EXISTS `vicidial_conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_conferences` (
  `conf_exten` int(7) unsigned NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leave_3way` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `leave_3way_datetime` datetime DEFAULT NULL,
  UNIQUE KEY `vextenserver` (`conf_exten`,`server_ip`),
  UNIQUE KEY `serverconf` (`server_ip`,`conf_exten`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_conferences`
--

LOCK TABLES `vicidial_conferences` WRITE;
/*!40000 ALTER TABLE `vicidial_conferences` DISABLE KEYS */;
INSERT INTO `vicidial_conferences` VALUES (8600051,'192.168.1.180','','0',NULL),(8600052,'192.168.1.180','','0',NULL),(8600053,'192.168.1.180','','0',NULL),(8600054,'192.168.1.180','','0',NULL),(8600055,'192.168.1.180','','0',NULL),(8600056,'192.168.1.180','','0',NULL),(8600057,'192.168.1.180','','0',NULL),(8600058,'192.168.1.180','','0',NULL),(8600059,'192.168.1.180','','0',NULL),(8600060,'192.168.1.180','','0',NULL),(8600061,'192.168.1.180','','0',NULL),(8600062,'192.168.1.180','','0',NULL),(8600063,'192.168.1.180','','0',NULL),(8600064,'192.168.1.180','','0',NULL),(8600065,'192.168.1.180','','0',NULL),(8600066,'192.168.1.180','','0',NULL),(8600067,'192.168.1.180','','0',NULL),(8600068,'192.168.1.180','','0',NULL),(8600069,'192.168.1.180','','0',NULL),(8600070,'192.168.1.180','','0',NULL),(8600071,'192.168.1.180','','0',NULL),(8600072,'192.168.1.180','','0',NULL),(8600073,'192.168.1.180','','0',NULL),(8600074,'192.168.1.180','','0',NULL),(8600075,'192.168.1.180','','0',NULL),(8600076,'192.168.1.180','','0',NULL),(8600077,'192.168.1.180','','0',NULL),(8600078,'192.168.1.180','','0',NULL),(8600079,'192.168.1.180','','0',NULL),(8600080,'192.168.1.180','','0',NULL),(8600081,'192.168.1.180','','0',NULL),(8600082,'192.168.1.180','','0',NULL),(8600083,'192.168.1.180','','0',NULL),(8600084,'192.168.1.180','','0',NULL),(8600085,'192.168.1.180','','0',NULL),(8600086,'192.168.1.180','','0',NULL),(8600087,'192.168.1.180','','0',NULL),(8600088,'192.168.1.180','','0',NULL),(8600089,'192.168.1.180','','0',NULL),(8600090,'192.168.1.180','','0',NULL),(8600091,'192.168.1.180','','0',NULL),(8600092,'192.168.1.180','','0',NULL),(8600093,'192.168.1.180','','0',NULL),(8600094,'192.168.1.180','','0',NULL),(8600095,'192.168.1.180','','0',NULL),(8600096,'192.168.1.180','','0',NULL),(8600097,'192.168.1.180','','0',NULL),(8600098,'192.168.1.180','','0',NULL),(8600099,'192.168.1.180','','0',NULL),(8600100,'192.168.1.180','','0',NULL),(8600101,'192.168.1.180','','0',NULL),(8600102,'192.168.1.180','','0',NULL),(8600103,'192.168.1.180','','0',NULL),(8600104,'192.168.1.180','','0',NULL),(8600105,'192.168.1.180','','0',NULL),(8600106,'192.168.1.180','','0',NULL),(8600107,'192.168.1.180','','0',NULL),(8600108,'192.168.1.180','','0',NULL),(8600109,'192.168.1.180','','0',NULL),(8600110,'192.168.1.180','','0',NULL),(8600111,'192.168.1.180','','0',NULL),(8600112,'192.168.1.180','','0',NULL),(8600113,'192.168.1.180','','0',NULL),(8600114,'192.168.1.180','','0',NULL),(8600115,'192.168.1.180','','0',NULL),(8600116,'192.168.1.180','','0',NULL),(8600117,'192.168.1.180','','0',NULL),(8600118,'192.168.1.180','','0',NULL),(8600119,'192.168.1.180','','0',NULL),(8600120,'192.168.1.180','','0',NULL),(8600121,'192.168.1.180','','0',NULL),(8600122,'192.168.1.180','','0',NULL),(8600123,'192.168.1.180','','0',NULL),(8600124,'192.168.1.180','','0',NULL),(8600125,'192.168.1.180','','0',NULL),(8600126,'192.168.1.180','','0',NULL),(8600127,'192.168.1.180','','0',NULL),(8600128,'192.168.1.180','','0',NULL),(8600129,'192.168.1.180','','0',NULL),(8600130,'192.168.1.180','','0',NULL),(8600131,'192.168.1.180','','0',NULL),(8600132,'192.168.1.180','','0',NULL),(8600133,'192.168.1.180','','0',NULL),(8600134,'192.168.1.180','','0',NULL),(8600135,'192.168.1.180','','0',NULL),(8600136,'192.168.1.180','','0',NULL),(8600137,'192.168.1.180','','0',NULL),(8600138,'192.168.1.180','','0',NULL),(8600139,'192.168.1.180','','0',NULL),(8600140,'192.168.1.180','','0',NULL),(8600141,'192.168.1.180','','0',NULL),(8600142,'192.168.1.180','','0',NULL),(8600143,'192.168.1.180','','0',NULL),(8600144,'192.168.1.180','','0',NULL),(8600145,'192.168.1.180','','0',NULL),(8600146,'192.168.1.180','','0',NULL),(8600147,'192.168.1.180','','0',NULL),(8600148,'192.168.1.180','','0',NULL),(8600149,'192.168.1.180','','0',NULL),(8600150,'192.168.1.180','','0',NULL),(8600151,'192.168.1.180','','0',NULL),(8600152,'192.168.1.180','','0',NULL),(8600153,'192.168.1.180','','0',NULL),(8600154,'192.168.1.180','','0',NULL),(8600155,'192.168.1.180','','0',NULL),(8600156,'192.168.1.180','','0',NULL),(8600157,'192.168.1.180','','0',NULL),(8600158,'192.168.1.180','','0',NULL),(8600159,'192.168.1.180','','0',NULL),(8600160,'192.168.1.180','','0',NULL),(8600161,'192.168.1.180','','0',NULL),(8600162,'192.168.1.180','','0',NULL),(8600163,'192.168.1.180','','0',NULL),(8600164,'192.168.1.180','','0',NULL),(8600165,'192.168.1.180','','0',NULL),(8600166,'192.168.1.180','','0',NULL),(8600167,'192.168.1.180','','0',NULL),(8600168,'192.168.1.180','','0',NULL),(8600169,'192.168.1.180','','0',NULL),(8600170,'192.168.1.180','','0',NULL),(8600171,'192.168.1.180','','0',NULL),(8600172,'192.168.1.180','','0',NULL),(8600173,'192.168.1.180','','0',NULL),(8600174,'192.168.1.180','','0',NULL),(8600175,'192.168.1.180','','0',NULL),(8600176,'192.168.1.180','','0',NULL),(8600177,'192.168.1.180','','0',NULL),(8600178,'192.168.1.180','','0',NULL),(8600179,'192.168.1.180','','0',NULL),(8600180,'192.168.1.180','','0',NULL),(8600181,'192.168.1.180','','0',NULL),(8600182,'192.168.1.180','','0',NULL),(8600183,'192.168.1.180','','0',NULL),(8600184,'192.168.1.180','','0',NULL),(8600185,'192.168.1.180','','0',NULL),(8600186,'192.168.1.180','','0',NULL),(8600187,'192.168.1.180','','0',NULL),(8600188,'192.168.1.180','','0',NULL),(8600189,'192.168.1.180','','0',NULL),(8600190,'192.168.1.180','','0',NULL),(8600191,'192.168.1.180','','0',NULL),(8600192,'192.168.1.180','','0',NULL),(8600193,'192.168.1.180','','0',NULL),(8600194,'192.168.1.180','','0',NULL),(8600195,'192.168.1.180','','0',NULL),(8600196,'192.168.1.180','','0',NULL),(8600197,'192.168.1.180','','0',NULL),(8600198,'192.168.1.180','','0',NULL),(8600199,'192.168.1.180','','0',NULL),(8600200,'192.168.1.180','','0',NULL),(8600201,'192.168.1.180','','0',NULL),(8600202,'192.168.1.180','','0',NULL),(8600203,'192.168.1.180','','0',NULL),(8600204,'192.168.1.180','','0',NULL),(8600205,'192.168.1.180','','0',NULL),(8600206,'192.168.1.180','','0',NULL),(8600207,'192.168.1.180','','0',NULL),(8600208,'192.168.1.180','','0',NULL),(8600209,'192.168.1.180','','0',NULL),(8600210,'192.168.1.180','','0',NULL),(8600211,'192.168.1.180','','0',NULL),(8600212,'192.168.1.180','','0',NULL),(8600213,'192.168.1.180','','0',NULL),(8600214,'192.168.1.180','','0',NULL),(8600215,'192.168.1.180','','0',NULL),(8600216,'192.168.1.180','','0',NULL),(8600217,'192.168.1.180','','0',NULL),(8600218,'192.168.1.180','','0',NULL),(8600219,'192.168.1.180','','0',NULL),(8600220,'192.168.1.180','','0',NULL),(8600221,'192.168.1.180','','0',NULL),(8600222,'192.168.1.180','','0',NULL),(8600223,'192.168.1.180','','0',NULL),(8600224,'192.168.1.180','','0',NULL),(8600225,'192.168.1.180','','0',NULL),(8600226,'192.168.1.180','','0',NULL),(8600227,'192.168.1.180','','0',NULL),(8600228,'192.168.1.180','','0',NULL),(8600229,'192.168.1.180','','0',NULL),(8600230,'192.168.1.180','','0',NULL),(8600231,'192.168.1.180','','0',NULL),(8600232,'192.168.1.180','','0',NULL),(8600233,'192.168.1.180','','0',NULL),(8600234,'192.168.1.180','','0',NULL),(8600235,'192.168.1.180','','0',NULL),(8600236,'192.168.1.180','','0',NULL),(8600237,'192.168.1.180','','0',NULL),(8600238,'192.168.1.180','','0',NULL),(8600239,'192.168.1.180','','0',NULL),(8600240,'192.168.1.180','','0',NULL),(8600241,'192.168.1.180','','0',NULL),(8600242,'192.168.1.180','','0',NULL),(8600243,'192.168.1.180','','0',NULL),(8600244,'192.168.1.180','','0',NULL),(8600245,'192.168.1.180','','0',NULL),(8600246,'192.168.1.180','','0',NULL),(8600247,'192.168.1.180','','0',NULL),(8600248,'192.168.1.180','','0',NULL),(8600249,'192.168.1.180','','0',NULL),(8600250,'192.168.1.180','','0',NULL),(8600251,'192.168.1.180','','0',NULL),(8600252,'192.168.1.180','','0',NULL),(8600253,'192.168.1.180','','0',NULL),(8600254,'192.168.1.180','','0',NULL),(8600255,'192.168.1.180','','0',NULL),(8600256,'192.168.1.180','','0',NULL),(8600257,'192.168.1.180','','0',NULL),(8600258,'192.168.1.180','','0',NULL),(8600259,'192.168.1.180','','0',NULL),(8600260,'192.168.1.180','','0',NULL),(8600261,'192.168.1.180','','0',NULL),(8600262,'192.168.1.180','','0',NULL),(8600263,'192.168.1.180','','0',NULL),(8600264,'192.168.1.180','','0',NULL),(8600265,'192.168.1.180','','0',NULL),(8600266,'192.168.1.180','','0',NULL),(8600267,'192.168.1.180','','0',NULL),(8600268,'192.168.1.180','','0',NULL),(8600269,'192.168.1.180','','0',NULL),(8600270,'192.168.1.180','','0',NULL),(8600271,'192.168.1.180','','0',NULL),(8600272,'192.168.1.180','','0',NULL),(8600273,'192.168.1.180','','0',NULL),(8600274,'192.168.1.180','','0',NULL),(8600275,'192.168.1.180','','0',NULL),(8600276,'192.168.1.180','','0',NULL),(8600277,'192.168.1.180','','0',NULL),(8600278,'192.168.1.180','','0',NULL),(8600279,'192.168.1.180','','0',NULL),(8600280,'192.168.1.180','','0',NULL),(8600281,'192.168.1.180','','0',NULL),(8600282,'192.168.1.180','','0',NULL),(8600283,'192.168.1.180','','0',NULL),(8600284,'192.168.1.180','','0',NULL),(8600285,'192.168.1.180','','0',NULL),(8600286,'192.168.1.180','','0',NULL),(8600287,'192.168.1.180','','0',NULL),(8600288,'192.168.1.180','','0',NULL),(8600289,'192.168.1.180','','0',NULL),(8600290,'192.168.1.180','','0',NULL),(8600291,'192.168.1.180','','0',NULL),(8600292,'192.168.1.180','','0',NULL),(8600293,'192.168.1.180','','0',NULL),(8600294,'192.168.1.180','','0',NULL),(8600295,'192.168.1.180','','0',NULL),(8600296,'192.168.1.180','','0',NULL),(8600297,'192.168.1.180','','0',NULL),(8600298,'192.168.1.180','','0',NULL),(8600299,'192.168.1.180','','0',NULL);
/*!40000 ALTER TABLE `vicidial_conferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_configuration`
--

DROP TABLE IF EXISTS `vicidial_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_configuration`
--

LOCK TABLES `vicidial_configuration` WRITE;
/*!40000 ALTER TABLE `vicidial_configuration` DISABLE KEYS */;
INSERT INTO `vicidial_configuration` VALUES (1,'qc_database_version','1766');
/*!40000 ALTER TABLE `vicidial_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_country_dnc_queue`
--

DROP TABLE IF EXISTS `vicidial_country_dnc_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_country_dnc_queue` (
  `dnc_file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(250) DEFAULT NULL,
  `country_code` varchar(3) DEFAULT NULL,
  `file_layout` varchar(30) DEFAULT NULL,
  `file_status` enum('UPLOADING','READY','PENDING','INVALID LAYOUT','PROCESSING','FINISHED','CANCELLED') DEFAULT NULL,
  `file_action` enum('PURGE','APPEND') DEFAULT NULL,
  `date_uploaded` datetime DEFAULT NULL,
  `total_records` int(10) unsigned DEFAULT NULL,
  `records_processed` int(10) unsigned DEFAULT NULL,
  `records_inserted` int(10) unsigned DEFAULT NULL,
  `date_processed` datetime DEFAULT NULL,
  PRIMARY KEY (`dnc_file_id`),
  KEY `vicidial_country_dnc_queue_filename_key` (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_country_dnc_queue`
--

LOCK TABLES `vicidial_country_dnc_queue` WRITE;
/*!40000 ALTER TABLE `vicidial_country_dnc_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_country_dnc_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_country_iso_tld`
--

DROP TABLE IF EXISTS `vicidial_country_iso_tld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_country_iso_tld` (
  `country_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT '',
  `iso2` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `iso3` varchar(3) COLLATE utf8_unicode_ci DEFAULT '',
  `num3` varchar(4) COLLATE utf8_unicode_ci DEFAULT '',
  `tld` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `iso3` (`iso3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_country_iso_tld`
--

LOCK TABLES `vicidial_country_iso_tld` WRITE;
/*!40000 ALTER TABLE `vicidial_country_iso_tld` DISABLE KEYS */;
INSERT INTO `vicidial_country_iso_tld` VALUES ('Afghanistan','AF','AFG','004','af'),('Aland Islands','AX','ALA','248','ax'),('Albania','AL','ALB','008','al'),('Algeria','DZ','DZA','012','dz'),('American Samoa','AS','ASM','016','as'),('Andorra','AD','AND','020','ad'),('Angola','AO','AGO','024','ao'),('Anguilla','AI','AIA','660','ai'),('Antarctica','AQ','ATA','010','aq'),('Antigua and Barbuda','AG','ATG','028','ag'),('Argentina','AR','ARG','032','ar'),('Armenia','AM','ARM','051','am'),('Aruba','AW','ABW','533','aw'),('Australia','AU','AUS','036','au'),('Austria','AT','AUT','040','at'),('Azerbaijan','AZ','AZE','031','az'),('Bahamas','BS','BHS','044','bs'),('Bahrain','BH','BHR','048','bh'),('Bangladesh','BD','BGD','050','bd'),('Barbados','BB','BRB','052','bb'),('Belarus','BY','BLR','112','by'),('Belgium','BE','BEL','056','be'),('Belize','BZ','BLZ','084','bz'),('Benin','BJ','BEN','204','bj'),('Bermuda','BM','BMU','060','bm'),('Bhutan','BT','BTN','064','bt'),('Bolivia (Plurinational State of)','BO','BOL','068','bo'),('Bonaire, Sint Eustatius and Saba','BQ','BES','535','bq'),('Bosnia and Herzegovina','BA','BIH','070','ba'),('Botswana','BW','BWA','072','bw'),('Bouvet Island','BV','BVT','074','bv'),('Brazil','BR','BRA','076','br'),('British Indian Ocean Territory','IO','IOT','086','io'),('Brunei Darussalam','BN','BRN','096','bn'),('Bulgaria','BG','BGR','100','bg'),('Burkina Faso','BF','BFA','854','bf'),('Burundi','BI','BDI','108','bi'),('Cambodia','KH','KHM','116','kh'),('Cameroon','CM','CMR','120','cm'),('Canada','CA','CAN','124','ca'),('Cabo Verde','CV','CPV','132','cv'),('Cayman Islands','KY','CYM','136','ky'),('Central African Republic','CF','CAF','140','cf'),('Chad','TD','TCD','148','td'),('Chile','CL','CHL','152','cl'),('China','CN','CHN','156','cn'),('Christmas Island','CX','CXR','162','cx'),('Cocos (Keeling) Islands','CC','CCK','166','cc'),('Colombia','CO','COL','170','co'),('Comoros','KM','COM','174','km'),('Congo','CG','COG','178','cg'),('Congo (Democratic Republic of the)','CD','COD','180','cd'),('Cook Islands','CK','COK','184','ck'),('Costa Rica','CR','CRI','188','cr'),('CÃ´te d\'Ivoire','CI','CIV','384','ci'),('Croatia','HR','HRV','191','hr'),('Cuba','CU','CUB','192','cu'),('CuraÃ§ao','CW','CUW','531','cw'),('Cyprus','CY','CYP','196','cy'),('Czech Republic','CZ','CZE','203','cz'),('Denmark','DK','DNK','208','dk'),('Djibouti','DJ','DJI','262','dj'),('Dominica','DM','DMA','212','dm'),('Dominican Republic','DO','DOM','214','do'),('Ecuador','EC','ECU','218','ec'),('Egypt','EG','EGY','818','eg'),('El Salvador','SV','SLV','222','sv'),('Equatorial Guinea','GQ','GNQ','226','gq'),('Eritrea','ER','ERI','232','er'),('Estonia','EE','EST','233','ee'),('Ethiopia','ET','ETH','231','et'),('Falkland Islands (Malvinas)','FK','FLK','238','fk'),('Faroe Islands','FO','FRO','234','fo'),('Fiji','FJ','FJI','242','fj'),('Finland','FI','FIN','246','fi'),('France','FR','FRA','250','fr'),('French Guiana','GF','GUF','254','gf'),('French Polynesia','PF','PYF','258','pf'),('French Southern Territories','TF','ATF','260','tf'),('Gabon','GA','GAB','266','ga'),('Gambia','GM','GMB','270','gm'),('Georgia','GE','GEO','268','ge'),('Germany','DE','DEU','276','de'),('Ghana','GH','GHA','288','gh'),('Gibraltar','GI','GIB','292','gi'),('Greece','GR','GRC','300','gr'),('Greenland','GL','GRL','304','gl'),('Grenada','GD','GRD','308','gd'),('Guadeloupe','GP','GLP','312','gp'),('Guam','GU','GUM','316','gu'),('Guatemala','GT','GTM','320','gt'),('Guernsey','GG','GGY','831','gg'),('Guinea','GN','GIN','324','gn'),('Guinea-Bissau','GW','GNB','624','gw'),('Guyana','GY','GUY','328','gy'),('Haiti','HT','HTI','332','ht'),('Heard Island and McDonald Islands','HM','HMD','334','hm'),('Vatican City','VA','VAT','336','va'),('Honduras','HN','HND','340','hn'),('Hong Kong','HK','HKG','344','hk'),('Hungary','HU','HUN','348','hu'),('Iceland','IS','ISL','352','is'),('India','IN','IND','356','in'),('Indonesia','ID','IDN','360','id'),('Iran (Islamic Republic of)','IR','IRN','364','ir'),('Iraq','IQ','IRQ','368','iq'),('Ireland','IE','IRL','372','ie'),('Isle of Man','IM','IMN','833','im'),('Israel','IL','ISR','376','il'),('Italy','IT','ITA','380','it'),('Jamaica','JM','JAM','388','jm'),('Japan','JP','JPN','392','jp'),('Jersey','JE','JEY','832','je'),('Jordan','JO','JOR','400','jo'),('Kazakhstan','KZ','KAZ','398','kz'),('Kenya','KE','KEN','404','ke'),('Kiribati','KI','KIR','296','ki'),('Korea (Democratic People\'s Republic of)','KP','PRK','408','kp'),('Korea (Republic of)','KR','KOR','410','kr'),('Kosovo','XK','XKX','?','?'),('Kuwait','KW','KWT','414','kw'),('Kyrgyzstan','KG','KGZ','417','kg'),('Lao People\'s Democratic Republic','LA','LAO','418','la'),('Latvia','LV','LVA','428','lv'),('Lebanon','LB','LBN','422','lb'),('Lesotho','LS','LSO','426','ls'),('Liberia','LR','LBR','430','lr'),('Libya','LY','LBY','434','ly'),('Liechtenstein','LI','LIE','438','li'),('Lithuania','LT','LTU','440','lt'),('Luxembourg','LU','LUX','442','lu'),('Macao','MO','MAC','446','mo'),('Macedonia (the former Yugoslav Republic of)','MK','MKD','807','mk'),('Madagascar','MG','MDG','450','mg'),('Malawi','MW','MWI','454','mw'),('Malaysia','MY','MYS','458','my'),('Maldives','MV','MDV','462','mv'),('Mali','ML','MLI','466','ml'),('Malta','MT','MLT','470','mt'),('Marshall Islands','MH','MHL','584','mh'),('Martinique','MQ','MTQ','474','mq'),('Mauritania','MR','MRT','478','mr'),('Mauritius','MU','MUS','480','mu'),('Mayotte','YT','MYT','175','yt'),('Mexico','MX','MEX','484','mx'),('Micronesia (Federated States of)','FM','FSM','583','fm'),('Moldova (Republic of)','MD','MDA','498','md'),('Monaco','MC','MCO','492','mc'),('Mongolia','MN','MNG','496','mn'),('Montenegro','ME','MNE','499','me'),('Montserrat','MS','MSR','500','ms'),('Morocco','MA','MAR','504','ma'),('Mozambique','MZ','MOZ','508','mz'),('Myanmar','MM','MMR','104','mm'),('Namibia','NA','NAM','516','na'),('Nauru','NR','NRU','520','nr'),('Nepal','NP','NPL','524','np'),('Netherlands','NL','NLD','528','nl'),('New Caledonia','NC','NCL','540','nc'),('New Zealand','NZ','NZL','554','nz'),('Nicaragua','NI','NIC','558','ni'),('Niger','NE','NER','562','ne'),('Nigeria','NG','NGA','566','ng'),('Niue','NU','NIU','570','nu'),('Norfolk Island','NF','NFK','574','nf'),('Northern Mariana Islands','MP','MNP','580','mp'),('Norway','NO','NOR','578','no'),('Oman','OM','OMN','512','om'),('Pakistan','PK','PAK','586','pk'),('Palau','PW','PLW','585','pw'),('Palestine','PS','PSE','275','ps'),('Panama','PA','PAN','591','pa'),('Papua New Guinea','PG','PNG','598','pg'),('Paraguay','PY','PRY','600','py'),('Peru','PE','PER','604','pe'),('Philippines','PH','PHL','608','ph'),('Pitcairn','PN','PCN','612','pn'),('Poland','PL','POL','616','pl'),('Portugal','PT','PRT','620','pt'),('Puerto Rico','PR','PRI','630','pr'),('Qatar','QA','QAT','634','qa'),('RÃ©union','RE','REU','638','re'),('Romania','RO','ROU','642','ro'),('Russian Federation','RU','RUS','643','ru'),('Rwanda','RW','RWA','646','rw'),('Saint BarthÃ©lemy','BL','BLM','652','gp'),('Saint Helena, Ascension and Tristan da Cunha','SH','SHN','654','sh'),('Saint Kitts and Nevis','KN','KNA','659','kn'),('Saint Lucia','LC','LCA','662','lc'),('Saint Martin (French part)','MF','MAF','663','gp'),('Saint Pierre and Miquelon','PM','SPM','666','pm'),('Saint Vincent and the Grenadines','VC','VCT','670','vc'),('Samoa','WS','WSM','882','ws'),('San Marino','SM','SMR','674','sm'),('Sao Tome and Principe','ST','STP','678','st'),('Saudi Arabia','SA','SAU','682','sa'),('Senegal','SN','SEN','686','sn'),('Serbia','RS','SRB','688','rs'),('Seychelles','SC','SYC','690','sc'),('Sierra Leone','SL','SLE','694','sl'),('Singapore','SG','SGP','702','sg'),('Sint Maarten (Dutch part)','SX','SXM','534','sx'),('Slovakia','SK','SVK','703','sk'),('Slovenia','SI','SVN','705','si'),('Solomon Islands','SB','SLB','090','sb'),('Somalia','SO','SOM','706','so'),('South Africa','ZA','ZAF','710','za'),('South Georgia and the South Sandwich Islands','GS','SGS','239','gs'),('South Sudan','SS','SSD','728','ss'),('Spain','ES','ESP','724','es'),('Sri Lanka','LK','LKA','144','lk'),('Sudan','SD','SDN','729','sd'),('Suriname','SR','SUR','740','sr'),('Svalbard and Jan Mayen','SJ','SJM','744','sj'),('Swaziland','SZ','SWZ','748','sz'),('Sweden','SE','SWE','752','se'),('Switzerland','CH','CHE','756','ch'),('Syrian Arab Republic','SY','SYR','760','sy'),('Taiwan, Province of China','TW','TWN','158','tw'),('Tajikistan','TJ','TJK','762','tj'),('Tanzania, United Republic of','TZ','TZA','834','tz'),('Thailand','TH','THA','764','th'),('Timor-Leste','TL','TLS','626','tl'),('Togo','TG','TGO','768','tg'),('Tokelau','TK','TKL','772','tk'),('Tonga','TO','TON','776','to'),('Trinidad and Tobago','TT','TTO','780','tt'),('Tunisia','TN','TUN','788','tn'),('Turkey','TR','TUR','792','tr'),('Turkmenistan','TM','TKM','795','tm'),('Turks and Caicos Islands','TC','TCA','796','tc'),('Tuvalu','TV','TUV','798','tv'),('Uganda','UG','UGA','800','ug'),('Ukraine','UA','UKR','804','ua'),('United Arab Emirates','AE','ARE','784','ae'),('United Kingdom of Great Britain and Northern Ireland','GB','GBR','826','uk'),('United States of America','US','USA','840','us'),('United States Minor Outlying Islands','UM','UMI','581','us'),('Uruguay','UY','URY','858','uy'),('Uzbekistan','UZ','UZB','860','uz'),('Vanuatu','VU','VUT','548','vu'),('Venezuela (Bolivarian Republic of)','VE','VEN','862','ve'),('Viet Nam','VN','VNM','704','vn'),('Virgin Islands (British)','VG','VGB','092','vg'),('Virgin Islands (U.S.)','VI','VIR','850','vi'),('Wallis and Futuna','WF','WLF','876','wf'),('Western Sahara','EH','ESH','732','eh'),('Yemen','YE','YEM','887','ye'),('Zambia','ZM','ZMB','894','zm'),('Zimbabwe','ZW','ZWE','716','zw');
/*!40000 ALTER TABLE `vicidial_country_iso_tld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_cpd_log`
--

DROP TABLE IF EXISTS `vicidial_cpd_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_cpd_log` (
  `cpd_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `result` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('NEW','PROCESSED') COLLATE utf8_unicode_ci DEFAULT 'NEW',
  `cpd_seconds` decimal(7,2) DEFAULT 0.00,
  PRIMARY KEY (`cpd_id`),
  KEY `uniqueid` (`uniqueid`),
  KEY `callerid` (`callerid`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_cpd_log`
--

LOCK TABLES `vicidial_cpd_log` WRITE;
/*!40000 ALTER TABLE `vicidial_cpd_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_cpd_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_custom_cid`
--

DROP TABLE IF EXISTS `vicidial_custom_cid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_custom_cid` (
  `cid` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `areacode` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` smallint(5) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT '--ALL--',
  KEY `state` (`state`),
  KEY `areacode` (`areacode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_custom_cid`
--

LOCK TABLES `vicidial_custom_cid` WRITE;
/*!40000 ALTER TABLE `vicidial_custom_cid` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_custom_cid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_custom_leadloader_templates`
--

DROP TABLE IF EXISTS `vicidial_custom_leadloader_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_custom_leadloader_templates` (
  `template_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `template_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `standard_variables` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_table` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_variables` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_statuses` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_custom_leadloader_templates`
--

LOCK TABLES `vicidial_custom_leadloader_templates` WRITE;
/*!40000 ALTER TABLE `vicidial_custom_leadloader_templates` DISABLE KEYS */;
INSERT INTO `vicidial_custom_leadloader_templates` VALUES ('SAMPLE_TEMPLATE','Sample template','',999,'phone_number,9|first_name,0|last_name,1|address1,3|address2,4|address3,5|city,6|state,7|postal_code,8|','custom_999','appointment_date,2|appointment_notes,9|nearest_city,2|','');
/*!40000 ALTER TABLE `vicidial_custom_leadloader_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_custom_reports`
--

DROP TABLE IF EXISTS `vicidial_custom_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_custom_reports` (
  `custom_report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path_name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_variables` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_modify` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`custom_report_id`),
  UNIQUE KEY `custom_report_name_key` (`report_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_custom_reports`
--

LOCK TABLES `vicidial_custom_reports` WRITE;
/*!40000 ALTER TABLE `vicidial_custom_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_custom_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_daily_max_stats`
--

DROP TABLE IF EXISTS `vicidial_daily_max_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_daily_max_stats` (
  `stats_date` date NOT NULL,
  `stats_flag` enum('OPEN','CLOSED','CLOSING') COLLATE utf8_unicode_ci DEFAULT 'CLOSED',
  `stats_type` enum('TOTAL','INGROUP','CAMPAIGN','') COLLATE utf8_unicode_ci DEFAULT '',
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `closed_time` datetime DEFAULT NULL,
  `max_channels` mediumint(8) unsigned DEFAULT 0,
  `max_calls` mediumint(8) unsigned DEFAULT 0,
  `max_inbound` mediumint(8) unsigned DEFAULT 0,
  `max_outbound` mediumint(8) unsigned DEFAULT 0,
  `max_agents` mediumint(8) unsigned DEFAULT 0,
  `max_remote_agents` mediumint(8) unsigned DEFAULT 0,
  `total_calls` int(9) unsigned DEFAULT 0,
  KEY `stats_date` (`stats_date`),
  KEY `stats_flag` (`stats_flag`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_daily_max_stats`
--

LOCK TABLES `vicidial_daily_max_stats` WRITE;
/*!40000 ALTER TABLE `vicidial_daily_max_stats` DISABLE KEYS */;
INSERT INTO `vicidial_daily_max_stats` VALUES ('2021-07-08','OPEN','INGROUP','AGENTDIRECT','2021-07-08 13:05:09',NULL,0,0,0,0,0,0,0),('2021-07-08','OPEN','INGROUP','AGENTDIRECT_CHAT','2021-07-08 13:05:09',NULL,0,0,0,0,0,0,0),('2021-07-08','OPEN','TOTAL','','2021-07-08 13:05:09',NULL,0,0,0,0,0,0,0),('2021-07-10','OPEN','CAMPAIGN','test','2021-07-10 07:33:06',NULL,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `vicidial_daily_max_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_daily_ra_stats`
--

DROP TABLE IF EXISTS `vicidial_daily_ra_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_daily_ra_stats` (
  `stats_date` date NOT NULL,
  `stats_flag` enum('OPEN','CLOSED','CLOSING') COLLATE utf8_unicode_ci DEFAULT 'CLOSED',
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `closed_time` datetime DEFAULT NULL,
  `max_calls` mediumint(8) unsigned DEFAULT 0,
  `total_calls` int(9) unsigned DEFAULT 0,
  KEY `stats_date` (`stats_date`),
  KEY `stats_flag` (`stats_flag`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_daily_ra_stats`
--

LOCK TABLES `vicidial_daily_ra_stats` WRITE;
/*!40000 ALTER TABLE `vicidial_daily_ra_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_daily_ra_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_dial_log`
--

DROP TABLE IF EXISTS `vicidial_dial_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_dial_log` (
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned DEFAULT 0,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `context` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `timeout` mediumint(7) unsigned DEFAULT 0,
  `outbound_cid` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `sip_hangup_cause` smallint(4) unsigned DEFAULT 0,
  `sip_hangup_reason` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `caller_code` (`caller_code`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_dial_log`
--

LOCK TABLES `vicidial_dial_log` WRITE;
/*!40000 ALTER TABLE `vicidial_dial_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_dial_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_dial_log_archive`
--

DROP TABLE IF EXISTS `vicidial_dial_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_dial_log_archive` (
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned DEFAULT 0,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `context` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `timeout` mediumint(7) unsigned DEFAULT 0,
  `outbound_cid` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `sip_hangup_cause` smallint(4) unsigned DEFAULT 0,
  `sip_hangup_reason` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `vddla` (`caller_code`,`call_date`),
  KEY `caller_code` (`caller_code`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_dial_log_archive`
--

LOCK TABLES `vicidial_dial_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_dial_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_dial_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_did_agent_log`
--

DROP TABLE IF EXISTS `vicidial_did_agent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_did_agent_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `caller_id_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_id_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `did_id` varchar(9) COLLATE utf8_unicode_ci DEFAULT '',
  `did_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `did_route` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'VDCL',
  KEY `uniqueid` (`uniqueid`),
  KEY `caller_id_number` (`caller_id_number`),
  KEY `extension` (`extension`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_did_agent_log`
--

LOCK TABLES `vicidial_did_agent_log` WRITE;
/*!40000 ALTER TABLE `vicidial_did_agent_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_did_agent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_did_agent_log_archive`
--

DROP TABLE IF EXISTS `vicidial_did_agent_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_did_agent_log_archive` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `caller_id_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_id_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `did_id` varchar(9) COLLATE utf8_unicode_ci DEFAULT '',
  `did_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `did_route` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'VDCL',
  UNIQUE KEY `vdala` (`uniqueid`,`call_date`,`did_route`),
  KEY `uniqueid` (`uniqueid`),
  KEY `caller_id_number` (`caller_id_number`),
  KEY `extension` (`extension`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_did_agent_log_archive`
--

LOCK TABLES `vicidial_did_agent_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_did_agent_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_did_agent_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_did_log`
--

DROP TABLE IF EXISTS `vicidial_did_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_did_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `caller_id_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_id_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `did_id` varchar(9) COLLATE utf8_unicode_ci DEFAULT '',
  `did_route` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `uniqueid` (`uniqueid`),
  KEY `caller_id_number` (`caller_id_number`),
  KEY `extension` (`extension`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_did_log`
--

LOCK TABLES `vicidial_did_log` WRITE;
/*!40000 ALTER TABLE `vicidial_did_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_did_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_did_log_archive`
--

DROP TABLE IF EXISTS `vicidial_did_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_did_log_archive` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `caller_id_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_id_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `did_id` varchar(9) COLLATE utf8_unicode_ci DEFAULT '',
  `did_route` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `vdidla_key` (`uniqueid`,`call_date`,`server_ip`),
  KEY `uniqueid` (`uniqueid`),
  KEY `caller_id_number` (`caller_id_number`),
  KEY `extension` (`extension`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_did_log_archive`
--

LOCK TABLES `vicidial_did_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_did_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_did_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_did_ra_extensions`
--

DROP TABLE IF EXISTS `vicidial_did_ra_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_did_ra_extensions` (
  `did_id` int(9) unsigned NOT NULL,
  `user_start` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N','') COLLATE utf8_unicode_ci DEFAULT '',
  `call_count_today` mediumint(7) DEFAULT 0,
  UNIQUE KEY `didraexten` (`did_id`,`user_start`,`extension`),
  KEY `did_id` (`did_id`),
  KEY `user_start` (`user_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_did_ra_extensions`
--

LOCK TABLES `vicidial_did_ra_extensions` WRITE;
/*!40000 ALTER TABLE `vicidial_did_ra_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_did_ra_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_dnc`
--

DROP TABLE IF EXISTS `vicidial_dnc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_dnc` (
  `phone_number` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_dnc`
--

LOCK TABLES `vicidial_dnc` WRITE;
/*!40000 ALTER TABLE `vicidial_dnc` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_dnc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_dnc_log`
--

DROP TABLE IF EXISTS `vicidial_dnc_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_dnc_log` (
  `phone_number` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `action` enum('add','delete') COLLATE utf8_unicode_ci DEFAULT 'add',
  `action_date` datetime NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_dnc_log`
--

LOCK TABLES `vicidial_dnc_log` WRITE;
/*!40000 ALTER TABLE `vicidial_dnc_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_dnc_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_dnccom_filter_log`
--

DROP TABLE IF EXISTS `vicidial_dnccom_filter_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_dnccom_filter_log` (
  `filter_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `filter_date` datetime DEFAULT NULL,
  `new_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dnccom_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`filter_log_id`),
  KEY `lead_id` (`lead_id`),
  KEY `filter_date` (`filter_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_dnccom_filter_log`
--

LOCK TABLES `vicidial_dnccom_filter_log` WRITE;
/*!40000 ALTER TABLE `vicidial_dnccom_filter_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_dnccom_filter_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_dnccom_scrub_log`
--

DROP TABLE IF EXISTS `vicidial_dnccom_scrub_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_dnccom_scrub_log` (
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scrub_date` datetime NOT NULL,
  `flag_invalid` enum('','0','1') COLLATE utf8_unicode_ci DEFAULT '',
  `flag_dnc` enum('','0','1') COLLATE utf8_unicode_ci DEFAULT '',
  `flag_projdnc` enum('','0','1') COLLATE utf8_unicode_ci DEFAULT '',
  `flag_litigator` enum('','0','1') COLLATE utf8_unicode_ci DEFAULT '',
  `full_response` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `phone_number` (`phone_number`),
  KEY `scrub_date` (`scrub_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_dnccom_scrub_log`
--

LOCK TABLES `vicidial_dnccom_scrub_log` WRITE;
/*!40000 ALTER TABLE `vicidial_dnccom_scrub_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_dnccom_scrub_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_drop_lists`
--

DROP TABLE IF EXISTS `vicidial_drop_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_drop_lists` (
  `dl_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `dl_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `dl_server` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'active_voicemail_server',
  `dl_times` varchar(120) COLLATE utf8_unicode_ci DEFAULT '',
  `dl_weekdays` varchar(7) COLLATE utf8_unicode_ci DEFAULT '',
  `dl_monthdays` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `drop_statuses` varchar(255) COLLATE utf8_unicode_ci DEFAULT ' DROP -',
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `duplicate_check` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `run_now_trigger` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `active` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dl_minutes` mediumint(6) unsigned DEFAULT 0,
  UNIQUE KEY `dl_id` (`dl_id`),
  KEY `dl_times` (`dl_times`),
  KEY `run_now_trigger` (`run_now_trigger`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_drop_lists`
--

LOCK TABLES `vicidial_drop_lists` WRITE;
/*!40000 ALTER TABLE `vicidial_drop_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_drop_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_drop_log`
--

DROP TABLE IF EXISTS `vicidial_drop_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_drop_log` (
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `drop_date` datetime NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `drop_processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  KEY `drop_date` (`drop_date`),
  KEY `drop_processed` (`drop_processed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_drop_log`
--

LOCK TABLES `vicidial_drop_log` WRITE;
/*!40000 ALTER TABLE `vicidial_drop_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_drop_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_drop_log_archive`
--

DROP TABLE IF EXISTS `vicidial_drop_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_drop_log_archive` (
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `drop_date` datetime NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `drop_processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  UNIQUE KEY `vicidial_drop_log_archive_key` (`drop_date`,`uniqueid`),
  KEY `drop_processed` (`drop_processed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_drop_log_archive`
--

LOCK TABLES `vicidial_drop_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_drop_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_drop_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_drop_rate_groups`
--

DROP TABLE IF EXISTS `vicidial_drop_rate_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_drop_rate_groups` (
  `group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `calls_today` int(9) unsigned DEFAULT 0,
  `answers_today` int(9) unsigned DEFAULT 0,
  `drops_today` double(12,3) DEFAULT 0.000,
  `drops_today_pct` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `drops_answers_today_pct` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `answering_machines_today` int(9) unsigned DEFAULT 0,
  `agenthandled_today` int(9) unsigned DEFAULT 0,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_drop_rate_groups`
--

LOCK TABLES `vicidial_drop_rate_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_drop_rate_groups` DISABLE KEYS */;
INSERT INTO `vicidial_drop_rate_groups` VALUES ('101','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('102','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('103','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('104','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('105','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('106','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('107','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('108','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('109','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0),('110','2021-07-08 13:03:35',0,0,0.000,'0','0',0,0);
/*!40000 ALTER TABLE `vicidial_drop_rate_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_dtmf_log`
--

DROP TABLE IF EXISTS `vicidial_dtmf_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_dtmf_log` (
  `dtmf_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dtmf_time` datetime DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `direction` enum('Received','Sent') COLLATE utf8_unicode_ci DEFAULT 'Received',
  `state` enum('BEGIN','END') COLLATE utf8_unicode_ci DEFAULT 'BEGIN',
  PRIMARY KEY (`dtmf_id`),
  KEY `vicidial_dtmf_uniqueid_key` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_dtmf_log`
--

LOCK TABLES `vicidial_dtmf_log` WRITE;
/*!40000 ALTER TABLE `vicidial_dtmf_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_dtmf_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_email_accounts`
--

DROP TABLE IF EXISTS `vicidial_email_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_email_accounts` (
  `email_account_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email_account_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_account_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `protocol` enum('POP3','IMAP','SMTP') COLLATE utf8_unicode_ci DEFAULT 'IMAP',
  `email_replyto_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_account_server` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_account_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_account_pass` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pop3_auth_mode` enum('BEST','PASS','APOP','CRAM-MD5') COLLATE utf8_unicode_ci DEFAULT 'BEST',
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `email_frequency_check_mins` tinyint(3) unsigned DEFAULT 5,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_list_id` bigint(14) unsigned DEFAULT NULL,
  `call_handle_method` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'CID',
  `agent_search_method` enum('LO','LB','SO') COLLATE utf8_unicode_ci DEFAULT 'LB',
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `email_account_type` enum('INBOUND','OUTBOUND') COLLATE utf8_unicode_ci DEFAULT 'INBOUND',
  PRIMARY KEY (`email_account_id`),
  KEY `email_accounts_group_key` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_email_accounts`
--

LOCK TABLES `vicidial_email_accounts` WRITE;
/*!40000 ALTER TABLE `vicidial_email_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_email_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_email_list`
--

DROP TABLE IF EXISTS `vicidial_email_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_email_list` (
  `email_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `email_date` datetime DEFAULT NULL,
  `protocol` enum('POP3','IMAP','NONE') COLLATE utf8_unicode_ci DEFAULT 'IMAP',
  `email_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_transfer_encoding` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `x_mailer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender_ip` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8 DEFAULT NULL,
  `email_account_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` enum('INBOUND','OUTBOUND') COLLATE utf8_unicode_ci DEFAULT 'INBOUND',
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xfercallid` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`email_row_id`),
  KEY `email_list_account_key` (`email_account_id`),
  KEY `email_list_user_key` (`user`),
  KEY `vicidial_email_lead_id_key` (`lead_id`),
  KEY `vicidial_email_group_key` (`group_id`),
  KEY `vicidial_email_xfer_key` (`xfercallid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_email_list`
--

LOCK TABLES `vicidial_email_list` WRITE;
/*!40000 ALTER TABLE `vicidial_email_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_email_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_email_log`
--

DROP TABLE IF EXISTS `vicidial_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_email_log` (
  `email_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_row_id` int(10) unsigned DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `email_date` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8 DEFAULT NULL,
  `campaign_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`email_log_id`),
  KEY `vicidial_email_log_lead_id_key` (`lead_id`),
  KEY `vicidial_email_log_email_row_id_key` (`email_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_email_log`
--

LOCK TABLES `vicidial_email_log` WRITE;
/*!40000 ALTER TABLE `vicidial_email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_extension_groups`
--

DROP TABLE IF EXISTS `vicidial_extension_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_extension_groups` (
  `extension_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `extension_group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT '8300',
  `rank` mediumint(7) DEFAULT 0,
  `campaign_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_count_today` mediumint(7) DEFAULT 0,
  `last_call_time` datetime DEFAULT NULL,
  `last_callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`extension_id`),
  KEY `extension_group_id` (`extension_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_extension_groups`
--

LOCK TABLES `vicidial_extension_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_extension_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_extension_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_filter_phone_groups`
--

DROP TABLE IF EXISTS `vicidial_filter_phone_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_filter_phone_groups` (
  `filter_phone_group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `filter_phone_group_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `filter_phone_group_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  KEY `filter_phone_group_id` (`filter_phone_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_filter_phone_groups`
--

LOCK TABLES `vicidial_filter_phone_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_filter_phone_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_filter_phone_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_filter_phone_numbers`
--

DROP TABLE IF EXISTS `vicidial_filter_phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_filter_phone_numbers` (
  `phone_number` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `filter_phone_group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `phonefilter` (`phone_number`,`filter_phone_group_id`),
  KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_filter_phone_numbers`
--

LOCK TABLES `vicidial_filter_phone_numbers` WRITE;
/*!40000 ALTER TABLE `vicidial_filter_phone_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_filter_phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_grab_call_log`
--

DROP TABLE IF EXISTS `vicidial_grab_call_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_grab_call_log` (
  `auto_call_id` int(9) unsigned NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `call_time` datetime DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `queue_priority` tinyint(2) DEFAULT 0,
  `call_type` enum('IN','OUT','OUTBALANCE') COLLATE utf8_unicode_ci DEFAULT 'OUT',
  KEY `auto_call_id` (`auto_call_id`),
  KEY `event_date` (`event_date`),
  KEY `user` (`user`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_grab_call_log`
--

LOCK TABLES `vicidial_grab_call_log` WRITE;
/*!40000 ALTER TABLE `vicidial_grab_call_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_grab_call_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_hopper`
--

DROP TABLE IF EXISTS `vicidial_hopper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_hopper` (
  `hopper_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(9) unsigned NOT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('READY','QUEUE','INCALL','DONE','HOLD','DNC') COLLATE utf8_unicode_ci DEFAULT 'READY',
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_id` bigint(14) unsigned NOT NULL,
  `gmt_offset_now` decimal(4,2) DEFAULT 0.00,
  `state` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `alt_dial` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `priority` tinyint(2) DEFAULT 0,
  `source` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `vendor_lead_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`hopper_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_hopper`
--

LOCK TABLES `vicidial_hopper` WRITE;
/*!40000 ALTER TABLE `vicidial_hopper` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_hopper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_html_cache_stats`
--

DROP TABLE IF EXISTS `vicidial_html_cache_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_html_cache_stats` (
  `stats_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `stats_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `stats_date` datetime NOT NULL,
  `stats_count` int(9) unsigned DEFAULT 0,
  `stats_html` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `vicidial_html_cache_stats_key` (`stats_type`,`stats_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_html_cache_stats`
--

LOCK TABLES `vicidial_html_cache_stats` WRITE;
/*!40000 ALTER TABLE `vicidial_html_cache_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_html_cache_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_inbound_callback_queue`
--

DROP TABLE IF EXISTS `vicidial_inbound_callback_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_inbound_callback_queue` (
  `icbq_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `icbq_date` datetime DEFAULT NULL,
  `icbq_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icbq_phone_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icbq_phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icbq_nextday_choice` enum('Y','N','U') COLLATE utf8_unicode_ci DEFAULT 'U',
  `lead_id` int(9) unsigned NOT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `queue_priority` tinyint(2) DEFAULT 0,
  `call_date` datetime DEFAULT NULL,
  `gmt_offset_now` decimal(4,2) DEFAULT 0.00,
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`icbq_id`),
  KEY `icbq_status` (`icbq_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_inbound_callback_queue`
--

LOCK TABLES `vicidial_inbound_callback_queue` WRITE;
/*!40000 ALTER TABLE `vicidial_inbound_callback_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_inbound_callback_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_inbound_callback_queue_archive`
--

DROP TABLE IF EXISTS `vicidial_inbound_callback_queue_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_inbound_callback_queue_archive` (
  `icbq_id` int(9) unsigned NOT NULL,
  `icbq_date` datetime DEFAULT NULL,
  `icbq_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icbq_phone_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icbq_phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icbq_nextday_choice` enum('Y','N','U') COLLATE utf8_unicode_ci DEFAULT 'U',
  `lead_id` int(9) unsigned NOT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `queue_priority` tinyint(2) DEFAULT 0,
  `call_date` datetime DEFAULT NULL,
  `gmt_offset_now` decimal(4,2) DEFAULT 0.00,
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`icbq_id`),
  KEY `icbq_status` (`icbq_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_inbound_callback_queue_archive`
--

LOCK TABLES `vicidial_inbound_callback_queue_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_inbound_callback_queue_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_inbound_callback_queue_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_inbound_dids`
--

DROP TABLE IF EXISTS `vicidial_inbound_dids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_inbound_dids` (
  `did_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `did_pattern` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `did_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `did_active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `did_route` enum('EXTEN','VOICEMAIL','AGENT','PHONE','IN_GROUP','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'EXTEN',
  `extension` varchar(50) COLLATE utf8_unicode_ci DEFAULT '9998811112',
  `exten_context` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'default',
  `voicemail_ext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_unavailable_action` enum('IN_GROUP','EXTEN','VOICEMAIL','PHONE','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'VOICEMAIL',
  `user_route_settings_ingroup` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'AGENTDIRECT',
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_handle_method` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'CID',
  `agent_search_method` enum('LO','LB','SO') COLLATE utf8_unicode_ci DEFAULT 'LB',
  `list_id` bigint(14) unsigned DEFAULT 999,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  `menu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `record_call` enum('Y','N','Y_QUEUESTOP') COLLATE utf8_unicode_ci DEFAULT 'N',
  `filter_inbound_number` enum('DISABLED','GROUP','URL','DNC_INTERNAL','DNC_CAMPAIGN','GROUP_AREACODE') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `filter_phone_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `filter_url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT '',
  `filter_action` enum('EXTEN','VOICEMAIL','AGENT','PHONE','IN_GROUP','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'EXTEN',
  `filter_extension` varchar(50) COLLATE utf8_unicode_ci DEFAULT '9998811112',
  `filter_exten_context` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'default',
  `filter_voicemail_ext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter_user_unavailable_action` enum('IN_GROUP','EXTEN','VOICEMAIL','PHONE','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'VOICEMAIL',
  `filter_user_route_settings_ingroup` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'AGENTDIRECT',
  `filter_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter_call_handle_method` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'CID',
  `filter_agent_search_method` enum('LO','LB','SO') COLLATE utf8_unicode_ci DEFAULT 'LB',
  `filter_list_id` bigint(14) unsigned DEFAULT 999,
  `filter_campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter_phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  `filter_menu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `filter_clean_cid_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_one` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_two` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_three` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_four` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_five` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `filter_dnc_campaign` varchar(8) COLLATE utf8_unicode_ci DEFAULT '',
  `filter_url_did_redirect` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `no_agent_ingroup_redirect` enum('DISABLED','Y','NO_PAUSED','READY_ONLY') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `no_agent_ingroup_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `no_agent_ingroup_extension` varchar(50) COLLATE utf8_unicode_ci DEFAULT '9998811112',
  `pre_filter_phone_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `pre_filter_extension` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `entry_list_id` bigint(14) unsigned DEFAULT 0,
  `filter_entry_list_id` bigint(14) unsigned DEFAULT 0,
  `max_queue_ingroup_calls` smallint(5) DEFAULT 0,
  `max_queue_ingroup_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `max_queue_ingroup_extension` varchar(50) COLLATE utf8_unicode_ci DEFAULT '9998811112',
  `did_carrier_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `inbound_route_answer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`did_id`),
  UNIQUE KEY `did_pattern` (`did_pattern`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_inbound_dids`
--

LOCK TABLES `vicidial_inbound_dids` WRITE;
/*!40000 ALTER TABLE `vicidial_inbound_dids` DISABLE KEYS */;
INSERT INTO `vicidial_inbound_dids` VALUES (1,'default','Default DID','Y','EXTEN','9998811112','default',NULL,NULL,NULL,NULL,'VOICEMAIL','AGENTDIRECT',NULL,'CID','LB',999,NULL,'1','','N','DISABLED','','','EXTEN','9998811112','default',NULL,NULL,NULL,NULL,'VOICEMAIL','AGENTDIRECT',NULL,'CID','LB',999,NULL,'1','','','','','','','','---ALL---','','N','DISABLED','','9998811112','','',0,0,0,'','9998811112','','Y');
/*!40000 ALTER TABLE `vicidial_inbound_dids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_inbound_group_agents`
--

DROP TABLE IF EXISTS `vicidial_inbound_group_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_inbound_group_agents` (
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_rank` tinyint(1) DEFAULT 0,
  `group_weight` tinyint(1) DEFAULT 0,
  `calls_today` smallint(5) unsigned DEFAULT 0,
  `group_web_vars` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `group_grade` tinyint(2) unsigned DEFAULT 1,
  `group_type` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'C',
  `calls_today_filtered` smallint(5) unsigned DEFAULT 0,
  UNIQUE KEY `viga_user_group_id` (`user`,`group_id`),
  KEY `group_id` (`group_id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_inbound_group_agents`
--

LOCK TABLES `vicidial_inbound_group_agents` WRITE;
/*!40000 ALTER TABLE `vicidial_inbound_group_agents` DISABLE KEYS */;
INSERT INTO `vicidial_inbound_group_agents` VALUES ('6666','AGENTDIRECT',0,0,0,'',1,'C',0),('6666','AGENTDIRECT_CHAT',0,0,0,'',1,'C',0),('admin','AGENTDIRECT',0,0,0,'',0,'C',0),('admin','AGENTDIRECT_CHAT',0,0,0,'',0,'C',0);
/*!40000 ALTER TABLE `vicidial_inbound_group_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_inbound_groups`
--

DROP TABLE IF EXISTS `vicidial_inbound_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_inbound_groups` (
  `group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_color` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_form_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `voicemail_ext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_agent_call` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'longest_wait_time',
  `fronter_display` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ingroup_script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `get_call_launch` enum('NONE','SCRIPT','SCRIPTTWO','WEBFORM','WEBFORMTWO','WEBFORMTHREE','FORM','EMAIL') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `xferconf_a_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_a_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_b_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_b_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drop_call_seconds` smallint(4) unsigned DEFAULT 360,
  `drop_action` enum('HANGUP','MESSAGE','VOICEMAIL','IN_GROUP','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'MESSAGE',
  `drop_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8307',
  `call_time_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '24hours',
  `after_hours_action` enum('HANGUP','MESSAGE','EXTENSION','VOICEMAIL','IN_GROUP','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'MESSAGE',
  `after_hours_message_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'vm-goodbye',
  `after_hours_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `after_hours_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `welcome_message_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `moh_context` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'default',
  `onhold_prompt_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'generic_hold',
  `prompt_interval` smallint(5) unsigned DEFAULT 60,
  `agent_alert_exten` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'ding',
  `agent_alert_delay` int(6) DEFAULT 1000,
  `default_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `queue_priority` tinyint(2) DEFAULT 0,
  `drop_inbound_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `ingroup_recording_override` enum('DISABLED','NEVER','ONDEMAND','ALLCALLS','ALLFORCE') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `ingroup_rec_filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `afterhours_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `qc_enabled` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `qc_statuses` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_shift_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '24HRMIDNIGHT',
  `qc_get_record_launch` enum('NONE','SCRIPT','WEBFORM','QCSCRIPT','QCWEBFORM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `qc_show_recording` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `qc_web_form_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `play_place_in_line` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `play_estimate_hold_time` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hold_time_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `hold_time_option_seconds` smallint(5) DEFAULT 360,
  `hold_time_option_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `hold_time_option_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `hold_time_option_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `hold_time_option_callback_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'vm-hangup',
  `hold_time_option_callback_list_id` bigint(14) unsigned DEFAULT 999,
  `hold_recall_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `no_delay_call_route` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `play_welcome_message` enum('ALWAYS','NEVER','IF_WAIT_ONLY','YES_UNLESS_NODELAY') COLLATE utf8_unicode_ci DEFAULT 'ALWAYS',
  `answer_sec_pct_rt_stat_one` smallint(5) unsigned DEFAULT 20,
  `answer_sec_pct_rt_stat_two` smallint(5) unsigned DEFAULT 30,
  `default_group_alias` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `no_agent_no_queue` enum('N','Y','NO_PAUSED','NO_READY') COLLATE utf8_unicode_ci DEFAULT 'N',
  `no_agent_action` enum('CALLMENU','INGROUP','DID','MESSAGE','EXTENSION','VOICEMAIL','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'MESSAGE',
  `no_agent_action_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'nbdy-avail-to-take-call|vm-goodbye',
  `web_form_address_two` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timer_action` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `timer_action_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `timer_action_seconds` mediumint(7) DEFAULT -1,
  `start_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dispo_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_c_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_d_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_e_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `ignore_list_script_override` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `extension_appended_cidname` enum('Y','N','Y_USER','Y_WITH_CAMPAIGN','Y_USER_WITH_CAMPAIGN') COLLATE utf8_unicode_ci DEFAULT 'N',
  `uniqueid_status_display` enum('DISABLED','ENABLED','ENABLED_PREFIX','ENABLED_PRESERVE') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `uniqueid_status_prefix` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `hold_time_option_minimum` smallint(5) DEFAULT 0,
  `hold_time_option_press_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'to-be-called-back|digits/1',
  `hold_time_option_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `hold_time_option_no_block` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hold_time_option_prompt_seconds` smallint(5) DEFAULT 10,
  `onhold_prompt_no_block` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `onhold_prompt_seconds` smallint(5) DEFAULT 9,
  `hold_time_second_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `hold_time_third_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `wait_hold_option_priority` enum('WAIT','HOLD','BOTH') COLLATE utf8_unicode_ci DEFAULT 'WAIT',
  `wait_time_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `wait_time_second_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `wait_time_third_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `wait_time_option_seconds` smallint(5) DEFAULT 120,
  `wait_time_option_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `wait_time_option_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `wait_time_option_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `wait_time_option_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `wait_time_option_callback_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'vm-hangup',
  `wait_time_option_callback_list_id` bigint(14) unsigned DEFAULT 999,
  `wait_time_option_press_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'to-be-called-back|digits/1',
  `wait_time_option_no_block` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `wait_time_option_prompt_seconds` smallint(5) DEFAULT 10,
  `timer_action_destination` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `calculate_estimated_hold_seconds` smallint(5) unsigned DEFAULT 0,
  `add_lead_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `eht_minimum_prompt_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `eht_minimum_prompt_no_block` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `eht_minimum_prompt_seconds` smallint(5) DEFAULT 10,
  `on_hook_ring_time` smallint(5) DEFAULT 15,
  `na_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_hook_cid` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'GENERIC',
  `group_calldate` datetime DEFAULT NULL,
  `action_xfer_cid` varchar(18) COLLATE utf8_unicode_ci DEFAULT 'CUSTOMER',
  `drop_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `after_hours_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `max_calls_method` enum('TOTAL','IN_QUEUE','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `max_calls_count` smallint(5) DEFAULT 0,
  `max_calls_action` enum('DROP','AFTERHOURS','NO_AGENT_NO_QUEUE','AREACODE_FILTER') COLLATE utf8_unicode_ci DEFAULT 'NO_AGENT_NO_QUEUE',
  `dial_ingroup_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `group_handling` enum('PHONE','EMAIL','CHAT') COLLATE utf8_unicode_ci DEFAULT 'PHONE',
  `web_form_address_three` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `populate_lead_ingroup` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `drop_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `after_hours_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `nanq_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `wait_time_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hold_time_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `status_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `routing_initiated_recordings` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `on_hook_cid_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_chat_screen_colors` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `customer_chat_survey_link` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_chat_survey_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `populate_lead_province` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `areacode_filter` enum('DISABLED','ALLOW_ONLY','DROP_ONLY') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `areacode_filter_seconds` smallint(5) DEFAULT 10,
  `areacode_filter_action` enum('CALLMENU','INGROUP','DID','MESSAGE','EXTENSION','VOICEMAIL','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'MESSAGE',
  `areacode_filter_action_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'nbdy-avail-to-take-call|vm-goodbye',
  `populate_state_areacode` enum('DISABLED','NEW_LEAD_ONLY','OVERWRITE_ALWAYS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `inbound_survey` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `inbound_survey_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inbound_survey_accept_digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `inbound_survey_question_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inbound_survey_callmenu` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `icbq_expiration_hours` smallint(5) DEFAULT 96,
  `closing_time_action` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `closing_time_now_trigger` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `closing_time_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `closing_time_end_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `closing_time_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `closing_time_option_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `closing_time_option_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `closing_time_option_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `closing_time_option_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `closing_time_option_callback_list_id` bigint(14) unsigned DEFAULT 999,
  `add_lead_timezone` enum('SERVER','PHONE_CODE_AREACODE') COLLATE utf8_unicode_ci DEFAULT 'SERVER',
  `icbq_call_time_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '24hours',
  `icbq_dial_filter` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `populate_lead_source` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `populate_lead_vendor` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'INBOUND_NUMBER',
  `park_file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `waiting_call_url_on` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `waiting_call_url_off` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `waiting_call_count` smallint(5) unsigned DEFAULT 0,
  `enter_ingroup_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_confirm_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NO',
  `cid_cb_invalid_filter_phone_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `cid_cb_valid_length` varchar(30) COLLATE utf8_unicode_ci DEFAULT '10',
  `cid_cb_valid_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_confirmed_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_enter_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_you_entered_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_press_to_confirm_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_invalid_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_reenter_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_error_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_in_line_caller_number_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_in_line_you_next_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingroup_script_two` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `browser_alert_sound` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `browser_alert_volume` tinyint(3) unsigned DEFAULT 50,
  `answer_signal` enum('START','ROUTE','NONE') COLLATE utf8_unicode_ci DEFAULT 'START',
  `no_agent_delay` smallint(5) DEFAULT 0,
  `agent_search_method` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_statuses_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `populate_lead_comments` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'CALLERID_NAME',
  `drop_call_seconds_override` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_inbound_groups`
--

LOCK TABLES `vicidial_inbound_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_inbound_groups` DISABLE KEYS */;
INSERT INTO `vicidial_inbound_groups` VALUES ('AGENTDIRECT','Single Agent Direct Queue','white','Y',NULL,NULL,'longest_wait_time','Y',NULL,'NONE',NULL,NULL,NULL,NULL,360,'MESSAGE','8307','24hours','MESSAGE','vm-goodbye','8300',NULL,'---NONE---','default','generic_hold',60,'ding',1000,'---NONE---',99,'---NONE---','DISABLED','NONE','---NONE---','N',NULL,'24HRMIDNIGHT','NONE','Y',NULL,NULL,'N','N','NONE',360,'8300','','---NONE---','vm-hangup',999,'---NONE---','N','ALWAYS',20,30,'','N','MESSAGE','nbdy-avail-to-take-call|vm-goodbye',NULL,'NONE','',-1,NULL,NULL,'','','','N','N','DISABLED','',0,'to-be-called-back|digits/1','','N',10,'N',9,'NONE','NONE','WAIT','NONE','NONE','NONE',120,'8300','','---NONE---','','vm-hangup',999,'to-be-called-back|digits/1','N',10,'',0,NULL,'','N',10,15,NULL,'GENERIC',NULL,'CUSTOMER','','','---ALL---','DISABLED',0,'NO_AGENT_NO_QUEUE','','PHONE',NULL,'ENABLED','N','N','N','N','N','','Y','','default',NULL,NULL,'DISABLED','DISABLED',10,'MESSAGE','nbdy-avail-to-take-call|vm-goodbye','DISABLED','DISABLED',NULL,'',NULL,NULL,96,'DISABLED','N',NULL,NULL,'N','8300','','','---NONE---',999,'SERVER','24hours','NONE','DISABLED','INBOUND_NUMBER','',NULL,NULL,0,NULL,'NO','','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','---NONE---',50,'START',0,'','','','CALLERID_NAME','DISABLED'),('AGENTDIRECT_CHAT','Agent Direct Queue for Chats','#FFFFFF','Y','','','longest_wait_time','Y','','NONE',NULL,NULL,NULL,NULL,360,'MESSAGE','8307','24hours','MESSAGE','vm-goodbye','8300',NULL,'---NONE---','default','generic_hold',60,'ding',1000,'---NONE---',99,'---NONE---','DISABLED','NONE','---NONE---','N',NULL,'24HRMIDNIGHT','NONE','Y',NULL,NULL,'N','N','NONE',360,'8300','','---NONE---','vm-hangup',0,'---NONE---','N','ALWAYS',20,30,'','N','MESSAGE','nbdy-avail-to-take-call|vm-goodbye','','NONE','',-1,'','','','','','N','N','DISABLED','',0,'to-be-called-back|digits/1','','N',10,'N',10,'NONE','NONE','WAIT','NONE','NONE','NONE',120,'8300','','---NONE---','','vm-hangup',999,'to-be-called-back|digits/1','N',10,'',0,'','','N',10,15,'','GENERIC',NULL,'CUSTOMER','','','---ALL---','DISABLED',0,'DROP','','CHAT','','ENABLED','N','N','N','N','N','','N','','default',NULL,NULL,'DISABLED','DISABLED',10,'MESSAGE','nbdy-avail-to-take-call|vm-goodbye','DISABLED','DISABLED',NULL,'',NULL,NULL,96,'DISABLED','N',NULL,NULL,'N','8300','','','---NONE---',999,'SERVER','24hours','NONE','DISABLED','INBOUND_NUMBER','',NULL,NULL,0,NULL,'NO','','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','---NONE---',50,'START',0,'','','','CALLERID_NAME','DISABLED');
/*!40000 ALTER TABLE `vicidial_inbound_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_inbound_survey_log`
--

DROP TABLE IF EXISTS `vicidial_inbound_survey_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_inbound_survey_log` (
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `call_date` datetime DEFAULT NULL,
  `participate` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `played` enum('N','R','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dtmf_response` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `next_call_menu` text COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`),
  KEY `uniqueid` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_inbound_survey_log`
--

LOCK TABLES `vicidial_inbound_survey_log` WRITE;
/*!40000 ALTER TABLE `vicidial_inbound_survey_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_inbound_survey_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_inbound_survey_log_archive`
--

DROP TABLE IF EXISTS `vicidial_inbound_survey_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_inbound_survey_log_archive` (
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `call_date` datetime DEFAULT NULL,
  `participate` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `played` enum('N','R','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dtmf_response` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `next_call_menu` text COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `visla_key` (`uniqueid`,`call_date`,`campaign_id`,`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`),
  KEY `uniqueid` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_inbound_survey_log_archive`
--

LOCK TABLES `vicidial_inbound_survey_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_inbound_survey_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_inbound_survey_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ingroup_hour_counts`
--

DROP TABLE IF EXISTS `vicidial_ingroup_hour_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ingroup_hour_counts` (
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_hour` datetime DEFAULT NULL,
  `next_hour` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `type` varchar(22) COLLATE utf8_unicode_ci DEFAULT 'CALLS',
  `calls` int(9) unsigned DEFAULT 0,
  `hr` tinyint(2) DEFAULT 0,
  UNIQUE KEY `vihc_ingr_hour` (`group_id`,`date_hour`,`type`),
  KEY `group_id` (`group_id`),
  KEY `date_hour` (`date_hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ingroup_hour_counts`
--

LOCK TABLES `vicidial_ingroup_hour_counts` WRITE;
/*!40000 ALTER TABLE `vicidial_ingroup_hour_counts` DISABLE KEYS */;
INSERT INTO `vicidial_ingroup_hour_counts` VALUES ('AGENTDIRECT','2021-07-08 18:00:00','2021-07-08 19:00:00','2021-07-08 18:52:19','CALLS',0,18),('AGENTDIRECT','2021-07-08 00:00:00','2021-07-08 01:00:00','2021-07-08 18:35:09','CALLS',0,0),('AGENTDIRECT','2021-07-08 01:00:00','2021-07-08 02:00:00','2021-07-08 18:35:09','CALLS',0,1),('AGENTDIRECT','2021-07-08 02:00:00','2021-07-08 03:00:00','2021-07-08 18:35:09','CALLS',0,2),('AGENTDIRECT','2021-07-08 03:00:00','2021-07-08 04:00:00','2021-07-08 18:35:09','CALLS',0,3),('AGENTDIRECT','2021-07-08 04:00:00','2021-07-08 05:00:00','2021-07-08 18:35:09','CALLS',0,4),('AGENTDIRECT','2021-07-08 05:00:00','2021-07-08 06:00:00','2021-07-08 18:35:09','CALLS',0,5),('AGENTDIRECT','2021-07-08 06:00:00','2021-07-08 07:00:00','2021-07-08 18:35:09','CALLS',0,6),('AGENTDIRECT','2021-07-08 07:00:00','2021-07-08 08:00:00','2021-07-08 18:35:09','CALLS',0,7),('AGENTDIRECT','2021-07-08 08:00:00','2021-07-08 09:00:00','2021-07-08 18:35:09','CALLS',0,8),('AGENTDIRECT','2021-07-08 09:00:00','2021-07-08 10:00:00','2021-07-08 18:35:09','CALLS',0,9),('AGENTDIRECT','2021-07-08 10:00:00','2021-07-08 11:00:00','2021-07-08 18:35:09','CALLS',0,10),('AGENTDIRECT','2021-07-08 11:00:00','2021-07-08 12:00:00','2021-07-08 18:35:09','CALLS',0,11),('AGENTDIRECT','2021-07-08 12:00:00','2021-07-08 13:00:00','2021-07-08 18:35:09','CALLS',0,12),('AGENTDIRECT','2021-07-08 13:00:00','2021-07-08 14:00:00','2021-07-08 18:35:09','CALLS',0,13),('AGENTDIRECT','2021-07-08 14:00:00','2021-07-08 15:00:00','2021-07-08 18:35:09','CALLS',0,14),('AGENTDIRECT','2021-07-08 15:00:00','2021-07-08 16:00:00','2021-07-08 18:35:09','CALLS',0,15),('AGENTDIRECT','2021-07-08 16:00:00','2021-07-08 17:00:00','2021-07-08 18:35:09','CALLS',0,16),('AGENTDIRECT','2021-07-08 17:00:00','2021-07-08 18:00:00','2021-07-08 18:35:09','CALLS',0,17),('AGENTDIRECT_CHAT','2021-07-08 18:00:00','2021-07-08 19:00:00','2021-07-08 18:52:19','CALLS',0,18),('AGENTDIRECT_CHAT','2021-07-08 00:00:00','2021-07-08 01:00:00','2021-07-08 18:35:09','CALLS',0,0),('AGENTDIRECT_CHAT','2021-07-08 01:00:00','2021-07-08 02:00:00','2021-07-08 18:35:09','CALLS',0,1),('AGENTDIRECT_CHAT','2021-07-08 02:00:00','2021-07-08 03:00:00','2021-07-08 18:35:09','CALLS',0,2),('AGENTDIRECT_CHAT','2021-07-08 03:00:00','2021-07-08 04:00:00','2021-07-08 18:35:09','CALLS',0,3),('AGENTDIRECT_CHAT','2021-07-08 04:00:00','2021-07-08 05:00:00','2021-07-08 18:35:09','CALLS',0,4),('AGENTDIRECT_CHAT','2021-07-08 05:00:00','2021-07-08 06:00:00','2021-07-08 18:35:09','CALLS',0,5),('AGENTDIRECT_CHAT','2021-07-08 06:00:00','2021-07-08 07:00:00','2021-07-08 18:35:09','CALLS',0,6),('AGENTDIRECT_CHAT','2021-07-08 07:00:00','2021-07-08 08:00:00','2021-07-08 18:35:09','CALLS',0,7),('AGENTDIRECT_CHAT','2021-07-08 08:00:00','2021-07-08 09:00:00','2021-07-08 18:35:09','CALLS',0,8),('AGENTDIRECT_CHAT','2021-07-08 09:00:00','2021-07-08 10:00:00','2021-07-08 18:35:09','CALLS',0,9),('AGENTDIRECT_CHAT','2021-07-08 10:00:00','2021-07-08 11:00:00','2021-07-08 18:35:09','CALLS',0,10),('AGENTDIRECT_CHAT','2021-07-08 11:00:00','2021-07-08 12:00:00','2021-07-08 18:35:09','CALLS',0,11),('AGENTDIRECT_CHAT','2021-07-08 12:00:00','2021-07-08 13:00:00','2021-07-08 18:35:09','CALLS',0,12),('AGENTDIRECT_CHAT','2021-07-08 13:00:00','2021-07-08 14:00:00','2021-07-08 18:35:09','CALLS',0,13),('AGENTDIRECT_CHAT','2021-07-08 14:00:00','2021-07-08 15:00:00','2021-07-08 18:35:09','CALLS',0,14),('AGENTDIRECT_CHAT','2021-07-08 15:00:00','2021-07-08 16:00:00','2021-07-08 18:35:09','CALLS',0,15),('AGENTDIRECT_CHAT','2021-07-08 16:00:00','2021-07-08 17:00:00','2021-07-08 18:35:09','CALLS',0,16),('AGENTDIRECT_CHAT','2021-07-08 17:00:00','2021-07-08 18:00:00','2021-07-08 18:35:09','CALLS',0,17),('AGENTDIRECT','2021-07-09 15:00:00','2021-07-09 16:00:00','2021-07-09 16:00:25','CALLS',0,15),('AGENTDIRECT','2021-07-09 00:00:00','2021-07-09 01:00:00','2021-07-09 15:00:19','CALLS',0,0),('AGENTDIRECT','2021-07-09 01:00:00','2021-07-09 02:00:00','2021-07-09 15:00:19','CALLS',0,1),('AGENTDIRECT','2021-07-09 02:00:00','2021-07-09 03:00:00','2021-07-09 15:00:19','CALLS',0,2),('AGENTDIRECT','2021-07-09 03:00:00','2021-07-09 04:00:00','2021-07-09 15:00:19','CALLS',0,3),('AGENTDIRECT','2021-07-09 04:00:00','2021-07-09 05:00:00','2021-07-09 15:00:19','CALLS',0,4),('AGENTDIRECT','2021-07-09 05:00:00','2021-07-09 06:00:00','2021-07-09 15:00:19','CALLS',0,5),('AGENTDIRECT','2021-07-09 06:00:00','2021-07-09 07:00:00','2021-07-09 15:00:19','CALLS',0,6),('AGENTDIRECT','2021-07-09 07:00:00','2021-07-09 08:00:00','2021-07-09 15:00:19','CALLS',0,7),('AGENTDIRECT','2021-07-09 08:00:00','2021-07-09 09:00:00','2021-07-09 15:00:19','CALLS',0,8),('AGENTDIRECT','2021-07-09 09:00:00','2021-07-09 10:00:00','2021-07-09 15:00:19','CALLS',0,9),('AGENTDIRECT','2021-07-09 10:00:00','2021-07-09 11:00:00','2021-07-09 15:00:19','CALLS',0,10),('AGENTDIRECT','2021-07-09 11:00:00','2021-07-09 12:00:00','2021-07-09 15:00:19','CALLS',0,11),('AGENTDIRECT','2021-07-09 12:00:00','2021-07-09 13:00:00','2021-07-09 15:00:19','CALLS',0,12),('AGENTDIRECT','2021-07-09 13:00:00','2021-07-09 14:00:00','2021-07-09 15:00:19','CALLS',0,13),('AGENTDIRECT','2021-07-09 14:00:00','2021-07-09 15:00:00','2021-07-09 15:00:19','CALLS',0,14),('AGENTDIRECT_CHAT','2021-07-09 15:00:00','2021-07-09 16:00:00','2021-07-09 16:00:25','CALLS',0,15),('AGENTDIRECT_CHAT','2021-07-09 00:00:00','2021-07-09 01:00:00','2021-07-09 15:00:19','CALLS',0,0),('AGENTDIRECT_CHAT','2021-07-09 01:00:00','2021-07-09 02:00:00','2021-07-09 15:00:19','CALLS',0,1),('AGENTDIRECT_CHAT','2021-07-09 02:00:00','2021-07-09 03:00:00','2021-07-09 15:00:19','CALLS',0,2),('AGENTDIRECT_CHAT','2021-07-09 03:00:00','2021-07-09 04:00:00','2021-07-09 15:00:19','CALLS',0,3),('AGENTDIRECT_CHAT','2021-07-09 04:00:00','2021-07-09 05:00:00','2021-07-09 15:00:19','CALLS',0,4),('AGENTDIRECT_CHAT','2021-07-09 05:00:00','2021-07-09 06:00:00','2021-07-09 15:00:19','CALLS',0,5),('AGENTDIRECT_CHAT','2021-07-09 06:00:00','2021-07-09 07:00:00','2021-07-09 15:00:19','CALLS',0,6),('AGENTDIRECT_CHAT','2021-07-09 07:00:00','2021-07-09 08:00:00','2021-07-09 15:00:19','CALLS',0,7),('AGENTDIRECT_CHAT','2021-07-09 08:00:00','2021-07-09 09:00:00','2021-07-09 15:00:19','CALLS',0,8),('AGENTDIRECT_CHAT','2021-07-09 09:00:00','2021-07-09 10:00:00','2021-07-09 15:00:19','CALLS',0,9),('AGENTDIRECT_CHAT','2021-07-09 10:00:00','2021-07-09 11:00:00','2021-07-09 15:00:19','CALLS',0,10),('AGENTDIRECT_CHAT','2021-07-09 11:00:00','2021-07-09 12:00:00','2021-07-09 15:00:19','CALLS',0,11),('AGENTDIRECT_CHAT','2021-07-09 12:00:00','2021-07-09 13:00:00','2021-07-09 15:00:19','CALLS',0,12),('AGENTDIRECT_CHAT','2021-07-09 13:00:00','2021-07-09 14:00:00','2021-07-09 15:00:19','CALLS',0,13),('AGENTDIRECT_CHAT','2021-07-09 14:00:00','2021-07-09 15:00:00','2021-07-09 15:00:19','CALLS',0,14),('AGENTDIRECT','2021-07-09 16:00:00','2021-07-09 17:00:00','2021-07-09 17:00:56','CALLS',0,16),('AGENTDIRECT_CHAT','2021-07-09 16:00:00','2021-07-09 17:00:00','2021-07-09 17:00:56','CALLS',0,16),('AGENTDIRECT','2021-07-09 17:00:00','2021-07-09 18:00:00','2021-07-09 18:00:22','CALLS',0,17),('AGENTDIRECT_CHAT','2021-07-09 17:00:00','2021-07-09 18:00:00','2021-07-09 18:00:22','CALLS',0,17),('AGENTDIRECT','2021-07-09 18:00:00','2021-07-09 19:00:00','2021-07-09 18:27:04','CALLS',0,18),('AGENTDIRECT_CHAT','2021-07-09 18:00:00','2021-07-09 19:00:00','2021-07-09 18:27:04','CALLS',0,18),('AGENTDIRECT','2021-07-10 10:00:00','2021-07-10 11:00:00','2021-07-10 11:00:17','CALLS',0,10),('AGENTDIRECT','2021-07-10 00:00:00','2021-07-10 01:00:00','2021-07-10 10:24:55','CALLS',0,0),('AGENTDIRECT','2021-07-10 01:00:00','2021-07-10 02:00:00','2021-07-10 10:24:55','CALLS',0,1),('AGENTDIRECT','2021-07-10 02:00:00','2021-07-10 03:00:00','2021-07-10 10:24:55','CALLS',0,2),('AGENTDIRECT','2021-07-10 03:00:00','2021-07-10 04:00:00','2021-07-10 10:24:55','CALLS',0,3),('AGENTDIRECT','2021-07-10 04:00:00','2021-07-10 05:00:00','2021-07-10 10:24:55','CALLS',0,4),('AGENTDIRECT','2021-07-10 05:00:00','2021-07-10 06:00:00','2021-07-10 10:24:55','CALLS',0,5),('AGENTDIRECT','2021-07-10 06:00:00','2021-07-10 07:00:00','2021-07-10 10:24:55','CALLS',0,6),('AGENTDIRECT','2021-07-10 07:00:00','2021-07-10 08:00:00','2021-07-10 10:24:55','CALLS',0,7),('AGENTDIRECT','2021-07-10 08:00:00','2021-07-10 09:00:00','2021-07-10 10:24:55','CALLS',0,8),('AGENTDIRECT','2021-07-10 09:00:00','2021-07-10 10:00:00','2021-07-10 10:24:55','CALLS',0,9),('AGENTDIRECT_CHAT','2021-07-10 10:00:00','2021-07-10 11:00:00','2021-07-10 11:00:17','CALLS',0,10),('AGENTDIRECT_CHAT','2021-07-10 00:00:00','2021-07-10 01:00:00','2021-07-10 10:24:55','CALLS',0,0),('AGENTDIRECT_CHAT','2021-07-10 01:00:00','2021-07-10 02:00:00','2021-07-10 10:24:55','CALLS',0,1),('AGENTDIRECT_CHAT','2021-07-10 02:00:00','2021-07-10 03:00:00','2021-07-10 10:24:55','CALLS',0,2),('AGENTDIRECT_CHAT','2021-07-10 03:00:00','2021-07-10 04:00:00','2021-07-10 10:24:55','CALLS',0,3),('AGENTDIRECT_CHAT','2021-07-10 04:00:00','2021-07-10 05:00:00','2021-07-10 10:24:55','CALLS',0,4),('AGENTDIRECT_CHAT','2021-07-10 05:00:00','2021-07-10 06:00:00','2021-07-10 10:24:55','CALLS',0,5),('AGENTDIRECT_CHAT','2021-07-10 06:00:00','2021-07-10 07:00:00','2021-07-10 10:24:55','CALLS',0,6),('AGENTDIRECT_CHAT','2021-07-10 07:00:00','2021-07-10 08:00:00','2021-07-10 10:24:55','CALLS',0,7),('AGENTDIRECT_CHAT','2021-07-10 08:00:00','2021-07-10 09:00:00','2021-07-10 10:24:55','CALLS',0,8),('AGENTDIRECT_CHAT','2021-07-10 09:00:00','2021-07-10 10:00:00','2021-07-10 10:24:55','CALLS',0,9),('AGENTDIRECT','2021-07-10 11:00:00','2021-07-10 12:00:00','2021-07-10 12:00:31','CALLS',0,11),('AGENTDIRECT_CHAT','2021-07-10 11:00:00','2021-07-10 12:00:00','2021-07-10 12:00:31','CALLS',0,11),('AGENTDIRECT','2021-07-10 12:00:00','2021-07-10 13:00:00','2021-07-10 13:00:44','CALLS',0,12),('AGENTDIRECT_CHAT','2021-07-10 12:00:00','2021-07-10 13:00:00','2021-07-10 13:00:44','CALLS',0,12),('AGENTDIRECT','2021-07-10 13:00:00','2021-07-10 14:00:00','2021-07-10 14:00:36','CALLS',0,13),('AGENTDIRECT_CHAT','2021-07-10 13:00:00','2021-07-10 14:00:00','2021-07-10 14:00:36','CALLS',0,13),('AGENTDIRECT','2021-07-10 14:00:00','2021-07-10 15:00:00','2021-07-10 15:00:50','CALLS',0,14),('AGENTDIRECT_CHAT','2021-07-10 14:00:00','2021-07-10 15:00:00','2021-07-10 15:00:50','CALLS',0,14),('AGENTDIRECT','2021-07-10 15:00:00','2021-07-10 16:00:00','2021-07-10 16:00:02','CALLS',0,15),('AGENTDIRECT_CHAT','2021-07-10 15:00:00','2021-07-10 16:00:00','2021-07-10 16:00:02','CALLS',0,15),('AGENTDIRECT','2021-07-10 16:00:00','2021-07-10 17:00:00','2021-07-10 17:00:37','CALLS',0,16),('AGENTDIRECT_CHAT','2021-07-10 16:00:00','2021-07-10 17:00:00','2021-07-10 17:00:37','CALLS',0,16),('AGENTDIRECT','2021-07-10 17:00:00','2021-07-10 18:00:00','2021-07-10 18:00:09','CALLS',0,17),('AGENTDIRECT_CHAT','2021-07-10 17:00:00','2021-07-10 18:00:00','2021-07-10 18:00:09','CALLS',0,17),('AGENTDIRECT','2021-07-10 18:00:00','2021-07-10 19:00:00','2021-07-10 18:20:26','CALLS',0,18),('AGENTDIRECT_CHAT','2021-07-10 18:00:00','2021-07-10 19:00:00','2021-07-10 18:20:26','CALLS',0,18),('AGENTDIRECT','2021-07-11 11:00:00','2021-07-11 12:00:00','2021-07-11 12:00:07','CALLS',0,11),('AGENTDIRECT','2021-07-11 00:00:00','2021-07-11 01:00:00','2021-07-11 11:06:53','CALLS',0,0),('AGENTDIRECT','2021-07-11 01:00:00','2021-07-11 02:00:00','2021-07-11 11:06:53','CALLS',0,1),('AGENTDIRECT','2021-07-11 02:00:00','2021-07-11 03:00:00','2021-07-11 11:06:53','CALLS',0,2),('AGENTDIRECT','2021-07-11 03:00:00','2021-07-11 04:00:00','2021-07-11 11:06:53','CALLS',0,3),('AGENTDIRECT','2021-07-11 04:00:00','2021-07-11 05:00:00','2021-07-11 11:06:53','CALLS',0,4),('AGENTDIRECT','2021-07-11 05:00:00','2021-07-11 06:00:00','2021-07-11 11:06:53','CALLS',0,5),('AGENTDIRECT','2021-07-11 06:00:00','2021-07-11 07:00:00','2021-07-11 11:06:53','CALLS',0,6),('AGENTDIRECT','2021-07-11 07:00:00','2021-07-11 08:00:00','2021-07-11 11:06:53','CALLS',0,7),('AGENTDIRECT','2021-07-11 08:00:00','2021-07-11 09:00:00','2021-07-11 11:06:53','CALLS',0,8),('AGENTDIRECT','2021-07-11 09:00:00','2021-07-11 10:00:00','2021-07-11 11:06:53','CALLS',0,9),('AGENTDIRECT','2021-07-11 10:00:00','2021-07-11 11:00:00','2021-07-11 11:06:54','CALLS',0,10),('AGENTDIRECT_CHAT','2021-07-11 11:00:00','2021-07-11 12:00:00','2021-07-11 12:00:07','CALLS',0,11),('AGENTDIRECT_CHAT','2021-07-11 00:00:00','2021-07-11 01:00:00','2021-07-11 11:06:54','CALLS',0,0),('AGENTDIRECT_CHAT','2021-07-11 01:00:00','2021-07-11 02:00:00','2021-07-11 11:06:54','CALLS',0,1),('AGENTDIRECT_CHAT','2021-07-11 02:00:00','2021-07-11 03:00:00','2021-07-11 11:06:54','CALLS',0,2),('AGENTDIRECT_CHAT','2021-07-11 03:00:00','2021-07-11 04:00:00','2021-07-11 11:06:54','CALLS',0,3),('AGENTDIRECT_CHAT','2021-07-11 04:00:00','2021-07-11 05:00:00','2021-07-11 11:06:54','CALLS',0,4),('AGENTDIRECT_CHAT','2021-07-11 05:00:00','2021-07-11 06:00:00','2021-07-11 11:06:54','CALLS',0,5),('AGENTDIRECT_CHAT','2021-07-11 06:00:00','2021-07-11 07:00:00','2021-07-11 11:06:54','CALLS',0,6),('AGENTDIRECT_CHAT','2021-07-11 07:00:00','2021-07-11 08:00:00','2021-07-11 11:06:54','CALLS',0,7),('AGENTDIRECT_CHAT','2021-07-11 08:00:00','2021-07-11 09:00:00','2021-07-11 11:06:54','CALLS',0,8),('AGENTDIRECT_CHAT','2021-07-11 09:00:00','2021-07-11 10:00:00','2021-07-11 11:06:54','CALLS',0,9),('AGENTDIRECT_CHAT','2021-07-11 10:00:00','2021-07-11 11:00:00','2021-07-11 11:06:54','CALLS',0,10),('AGENTDIRECT','2021-07-11 12:00:00','2021-07-11 13:00:00','2021-07-11 12:39:29','CALLS',0,12),('AGENTDIRECT_CHAT','2021-07-11 12:00:00','2021-07-11 13:00:00','2021-07-11 12:39:29','CALLS',0,12);
/*!40000 ALTER TABLE `vicidial_ingroup_hour_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ingroup_hour_counts_archive`
--

DROP TABLE IF EXISTS `vicidial_ingroup_hour_counts_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ingroup_hour_counts_archive` (
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_hour` datetime DEFAULT NULL,
  `next_hour` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `type` varchar(22) COLLATE utf8_unicode_ci DEFAULT 'CALLS',
  `calls` int(9) unsigned DEFAULT 0,
  `hr` tinyint(2) DEFAULT 0,
  UNIQUE KEY `vihc_ingr_hour` (`group_id`,`date_hour`,`type`),
  KEY `group_id` (`group_id`),
  KEY `date_hour` (`date_hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ingroup_hour_counts_archive`
--

LOCK TABLES `vicidial_ingroup_hour_counts_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_ingroup_hour_counts_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_ingroup_hour_counts_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ip_list_entries`
--

DROP TABLE IF EXISTS `vicidial_ip_list_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ip_list_entries` (
  `ip_list_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  KEY `ip_list_id` (`ip_list_id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ip_list_entries`
--

LOCK TABLES `vicidial_ip_list_entries` WRITE;
/*!40000 ALTER TABLE `vicidial_ip_list_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_ip_list_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ip_lists`
--

DROP TABLE IF EXISTS `vicidial_ip_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ip_lists` (
  `ip_list_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ip_list_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  UNIQUE KEY `ip_list_id` (`ip_list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ip_lists`
--

LOCK TABLES `vicidial_ip_lists` WRITE;
/*!40000 ALTER TABLE `vicidial_ip_lists` DISABLE KEYS */;
INSERT INTO `vicidial_ip_lists` VALUES ('ViciWhite','White List for ViciBox firewall ACL','N','---ALL---'),('ViciBlack','Black List for ViciBox firewall ACL','N','---ALL---');
/*!40000 ALTER TABLE `vicidial_ip_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ivr`
--

DROP TABLE IF EXISTS `vicidial_ivr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ivr` (
  `ivr_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `entry_time` datetime DEFAULT NULL,
  `length_in_sec` smallint(5) unsigned DEFAULT 0,
  `inbound_number` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recording_id` int(9) unsigned DEFAULT NULL,
  `recording_filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_audio_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_1` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_2` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_3` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_4` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_5` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_5` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_6` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_6` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_7` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_7` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_8` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_8` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_9` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_9` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_10` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_10` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_11` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_11` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_12` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_12` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_13` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_13` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_14` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_14` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_15` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_15` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_16` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_16` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_17` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_17` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_18` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_18` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_19` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_19` tinyint(1) unsigned DEFAULT 0,
  `prompt_audio_20` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prompt_response_20` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`ivr_id`),
  KEY `phone_number` (`phone_number`),
  KEY `entry_time` (`entry_time`)
) ENGINE=MyISAM AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ivr`
--

LOCK TABLES `vicidial_ivr` WRITE;
/*!40000 ALTER TABLE `vicidial_ivr` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_ivr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_ivr_response`
--

DROP TABLE IF EXISTS `vicidial_ivr_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_ivr_response` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `btn` varchar(10) DEFAULT NULL,
  `lead_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `question` int(11) DEFAULT NULL,
  `response` varchar(10) DEFAULT NULL,
  `uniqueid` varchar(50) DEFAULT NULL,
  `campaign` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_created` (`question`,`uniqueid`,`campaign`,`created`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1599 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_ivr_response`
--

LOCK TABLES `vicidial_ivr_response` WRITE;
/*!40000 ALTER TABLE `vicidial_ivr_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_ivr_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_language_phrases`
--

DROP TABLE IF EXISTS `vicidial_language_phrases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_language_phrases` (
  `phrase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `english_text` varchar(10000) COLLATE utf8_unicode_ci DEFAULT '',
  `translated_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`phrase_id`),
  KEY `language_id` (`language_id`),
  KEY `english_text` (`english_text`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_language_phrases`
--

LOCK TABLES `vicidial_language_phrases` WRITE;
/*!40000 ALTER TABLE `vicidial_language_phrases` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_language_phrases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_languages`
--

DROP TABLE IF EXISTS `vicidial_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_languages` (
  `language_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `language_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `language_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  UNIQUE KEY `language_id` (`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_languages`
--

LOCK TABLES `vicidial_languages` WRITE;
/*!40000 ALTER TABLE `vicidial_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lead_call_daily_counts`
--

DROP TABLE IF EXISTS `vicidial_lead_call_daily_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lead_call_daily_counts` (
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT 0,
  `called_count_total` tinyint(3) unsigned DEFAULT 0,
  `called_count_auto` tinyint(3) unsigned DEFAULT 0,
  `called_count_manual` tinyint(3) unsigned DEFAULT 0,
  `modify_date` datetime DEFAULT NULL,
  UNIQUE KEY `vlcdc_lead` (`lead_id`),
  KEY `list_id` (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lead_call_daily_counts`
--

LOCK TABLES `vicidial_lead_call_daily_counts` WRITE;
/*!40000 ALTER TABLE `vicidial_lead_call_daily_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lead_call_daily_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lead_call_quota_counts`
--

DROP TABLE IF EXISTS `vicidial_lead_call_quota_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lead_call_quota_counts` (
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT 0,
  `first_call_date` datetime DEFAULT NULL,
  `last_call_date` datetime DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_count` smallint(5) unsigned DEFAULT 0,
  `session_one_calls` tinyint(3) DEFAULT 0,
  `session_two_calls` tinyint(3) DEFAULT 0,
  `session_three_calls` tinyint(3) DEFAULT 0,
  `session_four_calls` tinyint(3) DEFAULT 0,
  `session_five_calls` tinyint(3) DEFAULT 0,
  `session_six_calls` tinyint(3) DEFAULT 0,
  `day_one_calls` tinyint(3) DEFAULT 0,
  `day_two_calls` tinyint(3) DEFAULT 0,
  `day_three_calls` tinyint(3) DEFAULT 0,
  `day_four_calls` tinyint(3) DEFAULT 0,
  `day_five_calls` tinyint(3) DEFAULT 0,
  `day_six_calls` tinyint(3) DEFAULT 0,
  `day_seven_calls` tinyint(3) DEFAULT 0,
  `session_one_today_calls` tinyint(3) DEFAULT 0,
  `session_two_today_calls` tinyint(3) DEFAULT 0,
  `session_three_today_calls` tinyint(3) DEFAULT 0,
  `session_four_today_calls` tinyint(3) DEFAULT 0,
  `session_five_today_calls` tinyint(3) DEFAULT 0,
  `session_six_today_calls` tinyint(3) DEFAULT 0,
  `rank` smallint(5) NOT NULL DEFAULT 0,
  `modify_date` datetime DEFAULT NULL,
  UNIQUE KEY `vlcqc_lead_list` (`lead_id`,`list_id`),
  KEY `last_call_date` (`last_call_date`),
  KEY `list_id` (`list_id`),
  KEY `modify_date` (`modify_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lead_call_quota_counts`
--

LOCK TABLES `vicidial_lead_call_quota_counts` WRITE;
/*!40000 ALTER TABLE `vicidial_lead_call_quota_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lead_call_quota_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lead_call_quota_counts_archive`
--

DROP TABLE IF EXISTS `vicidial_lead_call_quota_counts_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lead_call_quota_counts_archive` (
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT 0,
  `first_call_date` datetime DEFAULT NULL,
  `last_call_date` datetime DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_count` smallint(5) unsigned DEFAULT 0,
  `session_one_calls` tinyint(3) DEFAULT 0,
  `session_two_calls` tinyint(3) DEFAULT 0,
  `session_three_calls` tinyint(3) DEFAULT 0,
  `session_four_calls` tinyint(3) DEFAULT 0,
  `session_five_calls` tinyint(3) DEFAULT 0,
  `session_six_calls` tinyint(3) DEFAULT 0,
  `day_one_calls` tinyint(3) DEFAULT 0,
  `day_two_calls` tinyint(3) DEFAULT 0,
  `day_three_calls` tinyint(3) DEFAULT 0,
  `day_four_calls` tinyint(3) DEFAULT 0,
  `day_five_calls` tinyint(3) DEFAULT 0,
  `day_six_calls` tinyint(3) DEFAULT 0,
  `day_seven_calls` tinyint(3) DEFAULT 0,
  `session_one_today_calls` tinyint(3) DEFAULT 0,
  `session_two_today_calls` tinyint(3) DEFAULT 0,
  `session_three_today_calls` tinyint(3) DEFAULT 0,
  `session_four_today_calls` tinyint(3) DEFAULT 0,
  `session_five_today_calls` tinyint(3) DEFAULT 0,
  `session_six_today_calls` tinyint(3) DEFAULT 0,
  `rank` smallint(5) NOT NULL DEFAULT 0,
  `modify_date` datetime DEFAULT NULL,
  UNIQUE KEY `vlcqc_lead_date` (`lead_id`,`first_call_date`),
  KEY `first_call_date` (`first_call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lead_call_quota_counts_archive`
--

LOCK TABLES `vicidial_lead_call_quota_counts_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_lead_call_quota_counts_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lead_call_quota_counts_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lead_filters`
--

DROP TABLE IF EXISTS `vicidial_lead_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lead_filters` (
  `lead_filter_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lead_filter_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lead_filter_comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_filter_sql` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`lead_filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lead_filters`
--

LOCK TABLES `vicidial_lead_filters` WRITE;
/*!40000 ALTER TABLE `vicidial_lead_filters` DISABLE KEYS */;
INSERT INTO `vicidial_lead_filters` VALUES ('DROP72HOUR','UK 72 hour Drop No Call','Prevents dropped calls from being called within 72 hours of the last attempt','( ( (status=\'DROP\') and (last_local_call_time < CONCAT(DATE_ADD(CURDATE(), INTERVAL -3 DAY),\' \',CURTIME()) ) ) or (status != \'DROP\') )','---ALL---');
/*!40000 ALTER TABLE `vicidial_lead_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lead_messages`
--

DROP TABLE IF EXISTS `vicidial_lead_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lead_messages` (
  `lead_id` int(9) unsigned NOT NULL,
  `call_date` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `played` tinyint(3) DEFAULT 0,
  `message_entry` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lead_messages`
--

LOCK TABLES `vicidial_lead_messages` WRITE;
/*!40000 ALTER TABLE `vicidial_lead_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lead_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lead_recycle`
--

DROP TABLE IF EXISTS `vicidial_lead_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lead_recycle` (
  `recycle_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `attempt_delay` smallint(5) unsigned DEFAULT 1800,
  `attempt_maximum` tinyint(3) unsigned DEFAULT 2,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`recycle_id`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lead_recycle`
--

LOCK TABLES `vicidial_lead_recycle` WRITE;
/*!40000 ALTER TABLE `vicidial_lead_recycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lead_recycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lead_search_log`
--

DROP TABLE IF EXISTS `vicidial_lead_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lead_search_log` (
  `search_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `event_date` datetime NOT NULL,
  `source` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `search_query` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `results` int(9) unsigned DEFAULT 0,
  `seconds` mediumint(7) unsigned DEFAULT 0,
  PRIMARY KEY (`search_log_id`),
  KEY `user` (`user`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lead_search_log`
--

LOCK TABLES `vicidial_lead_search_log` WRITE;
/*!40000 ALTER TABLE `vicidial_lead_search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lead_search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lead_search_log_archive`
--

DROP TABLE IF EXISTS `vicidial_lead_search_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lead_search_log_archive` (
  `search_log_id` int(9) unsigned NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `event_date` datetime NOT NULL,
  `source` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `search_query` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `results` int(9) unsigned DEFAULT 0,
  `seconds` mediumint(7) unsigned DEFAULT 0,
  PRIMARY KEY (`search_log_id`),
  KEY `user` (`user`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lead_search_log_archive`
--

LOCK TABLES `vicidial_lead_search_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_lead_search_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lead_search_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_list`
--

DROP TABLE IF EXISTS `vicidial_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_list` (
  `lead_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date` datetime DEFAULT NULL,
  `modify_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_lead_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_id` bigint(14) unsigned NOT NULL DEFAULT 0,
  `gmt_offset_now` decimal(4,2) DEFAULT 0.00,
  `called_since_last_reset` enum('Y','N','Y1','Y2','Y3','Y4','Y5','Y6','Y7','Y8','Y9','Y10') COLLATE utf8_unicode_ci DEFAULT 'N',
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_initial` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('M','F','U') COLLATE utf8_unicode_ci DEFAULT 'U',
  `date_of_birth` date DEFAULT NULL,
  `alt_phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `security_phrase` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `called_count` smallint(5) unsigned DEFAULT 0,
  `last_local_call_time` datetime DEFAULT NULL,
  `rank` smallint(5) NOT NULL DEFAULT 0,
  `owner` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `entry_list_id` bigint(14) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`lead_id`),
  KEY `phone_number` (`phone_number`),
  KEY `list_id` (`list_id`),
  KEY `called_since_last_reset` (`called_since_last_reset`),
  KEY `status` (`status`),
  KEY `gmt_offset_now` (`gmt_offset_now`),
  KEY `postal_code` (`postal_code`),
  KEY `last_local_call_time` (`last_local_call_time`),
  KEY `rank` (`rank`),
  KEY `owner` (`owner`),
  KEY `phone_list` (`phone_number`,`list_id`),
  KEY `list_phone` (`list_id`,`phone_number`),
  KEY `list_status` (`list_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_list`
--

LOCK TABLES `vicidial_list` WRITE;
/*!40000 ALTER TABLE `vicidial_list` DISABLE KEYS */;
INSERT INTO `vicidial_list` VALUES (1,NULL,'2021-07-08 13:03:45','NEW',NULL,NULL,NULL,101,0.00,'N','1','7275551212',NULL,'Matt',NULL,'lead01','1234 Fake St.',NULL,NULL,'Clearwater','FL',NULL,'33760','USA','M',NULL,NULL,'test@test.com',NULL,NULL,0,NULL,0,'',0),(2,NULL,'2021-07-08 13:03:45','NEW',NULL,NULL,NULL,101,0.00,'N','1','7275551212',NULL,'Matt',NULL,'lead02','1234 Fake St.',NULL,NULL,'Clearwater','FL',NULL,'33760','USA','M',NULL,NULL,'test@test.com',NULL,NULL,0,NULL,0,'',0),(3,NULL,'2021-07-08 13:03:45','NEW',NULL,NULL,NULL,101,0.00,'N','1','7275551212',NULL,'Matt',NULL,'lead03','1234 Fake St.',NULL,NULL,'Clearwater','FL',NULL,'33760','USA','M',NULL,NULL,'test@test.com',NULL,NULL,0,NULL,0,'',0),(4,NULL,'2021-07-08 13:03:45','NEW',NULL,NULL,NULL,101,0.00,'N','1','7275551212',NULL,'Matt',NULL,'lead04','1234 Fake St.',NULL,NULL,'Clearwater','FL',NULL,'33760','USA','M',NULL,NULL,'test@test.com',NULL,NULL,0,NULL,0,'',0),(5,NULL,'2021-07-08 13:03:45','NEW',NULL,NULL,NULL,101,0.00,'N','1','7275551212',NULL,'Matt',NULL,'lead05','1234 Fake St.',NULL,NULL,'Clearwater','FL',NULL,'33760','USA','M',NULL,NULL,'test@test.com',NULL,NULL,0,NULL,0,'',0),(6,NULL,'2021-07-08 13:03:45','NEW',NULL,NULL,NULL,101,0.00,'N','1','7275551212',NULL,'Matt',NULL,'lead06','1234 Fake St.',NULL,NULL,'Clearwater','FL',NULL,'33760','USA','M',NULL,NULL,'test@test.com',NULL,NULL,0,NULL,0,'',0),(7,NULL,'2021-07-08 13:03:45','NEW',NULL,NULL,NULL,101,0.00,'N','1','7275551212',NULL,'Matt',NULL,'lead07','1234 Fake St.',NULL,NULL,'Clearwater','FL',NULL,'33760','USA','M',NULL,NULL,'test@test.com',NULL,NULL,0,NULL,0,'',0);
/*!40000 ALTER TABLE `vicidial_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_list_alt_phones`
--

DROP TABLE IF EXISTS `vicidial_list_alt_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_list_alt_phones` (
  `alt_phone_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(9) unsigned NOT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_phone_note` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_phone_count` smallint(5) unsigned DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`alt_phone_id`),
  KEY `lead_id` (`lead_id`),
  KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_list_alt_phones`
--

LOCK TABLES `vicidial_list_alt_phones` WRITE;
/*!40000 ALTER TABLE `vicidial_list_alt_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_list_alt_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_list_pins`
--

DROP TABLE IF EXISTS `vicidial_list_pins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_list_pins` (
  `pins_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `entry_time` datetime DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digits` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pins_id`),
  KEY `lead_id` (`lead_id`),
  KEY `phone_number` (`phone_number`),
  KEY `entry_time` (`entry_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_list_pins`
--

LOCK TABLES `vicidial_list_pins` WRITE;
/*!40000 ALTER TABLE `vicidial_list_pins` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_list_pins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_list_update_log`
--

DROP TABLE IF EXISTS `vicidial_list_update_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_list_update_log` (
  `event_date` datetime DEFAULT NULL,
  `lead_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `result` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_rows` smallint(3) unsigned DEFAULT 0,
  `list_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_list_update_log`
--

LOCK TABLES `vicidial_list_update_log` WRITE;
/*!40000 ALTER TABLE `vicidial_list_update_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_list_update_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lists`
--

DROP TABLE IF EXISTS `vicidial_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lists` (
  `list_id` bigint(14) unsigned NOT NULL,
  `list_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_changedate` datetime DEFAULT NULL,
  `list_lastcalldate` datetime DEFAULT NULL,
  `reset_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_script_override` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `campaign_cid_override` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `am_message_exten_override` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `drop_inbound_group_override` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_a_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_b_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_c_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_d_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_e_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `web_form_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_form_address_two` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_zone_setting` enum('COUNTRY_AND_AREA_CODE','POSTAL_CODE','NANPA_PREFIX','OWNER_TIME_ZONE_CODE') COLLATE utf8_unicode_ci DEFAULT 'COUNTRY_AND_AREA_CODE',
  `inventory_report` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `expiration_date` date DEFAULT '2099-12-31',
  `na_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `local_call_time` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'campaign',
  `web_form_address_three` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `user_new_lead_limit` smallint(5) DEFAULT -1,
  `inbound_list_script_override` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `daily_reset_limit` smallint(5) DEFAULT -1,
  `resets_today` smallint(5) unsigned DEFAULT 0,
  `auto_active_list_rank` smallint(5) DEFAULT 0,
  `cache_count` int(9) unsigned DEFAULT 0,
  `cache_count_new` int(9) unsigned DEFAULT 0,
  `cache_count_dialable_new` int(9) unsigned DEFAULT 0,
  `cache_date` datetime DEFAULT NULL,
  `inbound_drop_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inbound_after_hours_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_statuses_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_web_form_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lists`
--

LOCK TABLES `vicidial_lists` WRITE;
/*!40000 ALTER TABLE `vicidial_lists` DISABLE KEYS */;
INSERT INTO `vicidial_lists` VALUES (999,'Default inbound list','TESTCAMP','N',NULL,NULL,NULL,'','','','','','','','','','',NULL,NULL,'COUNTRY_AND_AREA_CODE','Y','2099-12-31',NULL,'campaign',NULL,'',-1,NULL,'---NONE---',-1,0,0,0,0,0,NULL,NULL,NULL,'','',''),(998,'Default Manual list','TESTCAMP','N',NULL,NULL,NULL,'','','','','','','','','','',NULL,NULL,'COUNTRY_AND_AREA_CODE','Y','2099-12-31',NULL,'campaign',NULL,'',-1,NULL,'---NONE---',-1,0,0,0,0,0,NULL,NULL,NULL,'','','');
/*!40000 ALTER TABLE `vicidial_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lists_custom`
--

DROP TABLE IF EXISTS `vicidial_lists_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lists_custom` (
  `list_id` bigint(14) unsigned NOT NULL,
  `audit_comments` tinyint(1) DEFAULT NULL COMMENT 'visible',
  `audit_comments_enabled` tinyint(1) DEFAULT NULL COMMENT 'invisible',
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lists_custom`
--

LOCK TABLES `vicidial_lists_custom` WRITE;
/*!40000 ALTER TABLE `vicidial_lists_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lists_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_lists_fields`
--

DROP TABLE IF EXISTS `vicidial_lists_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_lists_fields` (
  `field_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` bigint(14) unsigned NOT NULL DEFAULT 0,
  `field_label` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_name` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_rank` smallint(5) DEFAULT NULL,
  `field_help` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` enum('TEXT','AREA','SELECT','MULTI','RADIO','CHECKBOX','DATE','TIME','DISPLAY','SCRIPT','HIDDEN','READONLY','HIDEBLOB','SWITCH','SOURCESELECT','BUTTON') COLLATE utf8_unicode_ci DEFAULT 'TEXT',
  `field_options` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_size` smallint(5) DEFAULT NULL,
  `field_max` smallint(5) DEFAULT NULL,
  `field_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_cost` smallint(5) DEFAULT NULL,
  `field_required` enum('Y','N','INBOUND_ONLY') COLLATE utf8_unicode_ci DEFAULT 'N',
  `name_position` enum('LEFT','TOP') COLLATE utf8_unicode_ci DEFAULT 'LEFT',
  `multi_position` enum('HORIZONTAL','VERTICAL') COLLATE utf8_unicode_ci DEFAULT 'HORIZONTAL',
  `field_order` smallint(5) DEFAULT 1,
  `field_encrypt` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `field_show_hide` enum('DISABLED','X_OUT_ALL','LAST_1','LAST_2','LAST_3','LAST_4','FIRST_1_LAST_4') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `field_duplicate` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `listfield` (`list_id`,`field_label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_lists_fields`
--

LOCK TABLES `vicidial_lists_fields` WRITE;
/*!40000 ALTER TABLE `vicidial_lists_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_lists_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_live_agents`
--

DROP TABLE IF EXISTS `vicidial_live_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_live_agents` (
  `live_agent_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `conf_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('READY','QUEUE','INCALL','PAUSED','CLOSER','MQUEUE') COLLATE utf8_unicode_ci DEFAULT 'PAUSED',
  `lead_id` int(9) unsigned NOT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `random_id` int(8) unsigned DEFAULT NULL,
  `last_call_time` datetime DEFAULT NULL,
  `last_update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_call_finish` datetime DEFAULT NULL,
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_level` tinyint(3) unsigned DEFAULT 0,
  `comments` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_weight` tinyint(1) DEFAULT 0,
  `calls_today` smallint(5) unsigned DEFAULT 0,
  `external_hangup` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `external_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `external_pause` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `external_dial` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `external_ingroups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_blended` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `external_igb_set_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `external_update_fields` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `external_update_fields_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `external_timer_action` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `external_timer_action_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `external_timer_action_seconds` mediumint(7) DEFAULT -1,
  `agent_log_id` int(9) unsigned DEFAULT 0,
  `last_state_change` datetime DEFAULT NULL,
  `agent_territories` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `outbound_autodial` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manager_ingroup_set` enum('Y','N','SET') COLLATE utf8_unicode_ci DEFAULT 'N',
  `ra_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ra_extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `external_dtmf` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `external_transferconf` varchar(120) COLLATE utf8_unicode_ci DEFAULT '',
  `external_park` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `external_timer_action_destination` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `on_hook_agent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `on_hook_ring_time` smallint(5) DEFAULT 15,
  `ring_callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `last_inbound_call_time` datetime DEFAULT NULL,
  `last_inbound_call_finish` datetime DEFAULT NULL,
  `campaign_grade` tinyint(2) unsigned DEFAULT 1,
  `external_recording` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `external_pause_code` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `pause_code` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `preview_lead_id` int(9) unsigned DEFAULT 0,
  `external_lead_id` int(9) unsigned DEFAULT 0,
  `last_inbound_call_time_filtered` datetime DEFAULT NULL,
  `last_inbound_call_finish_filtered` datetime DEFAULT NULL,
  `dial_campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`live_agent_id`),
  KEY `random_id` (`random_id`),
  KEY `last_call_time` (`last_call_time`),
  KEY `last_update_time` (`last_update_time`),
  KEY `last_call_finish` (`last_call_finish`),
  KEY `vlali` (`lead_id`),
  KEY `vlaus` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_live_agents`
--

LOCK TABLES `vicidial_live_agents` WRITE;
/*!40000 ALTER TABLE `vicidial_live_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_live_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_live_chats`
--

DROP TABLE IF EXISTS `vicidial_live_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_live_chats` (
  `chat_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `chat_start_time` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_creator` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `transferring_agent` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_direct` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_direct_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `vicidial_live_chats_lead_id_key` (`lead_id`),
  KEY `vicidial_live_chats_start_time_key` (`chat_start_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_live_chats`
--

LOCK TABLES `vicidial_live_chats` WRITE;
/*!40000 ALTER TABLE `vicidial_live_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_live_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_live_inbound_agents`
--

DROP TABLE IF EXISTS `vicidial_live_inbound_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_live_inbound_agents` (
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_weight` tinyint(1) DEFAULT 0,
  `calls_today` smallint(5) unsigned DEFAULT 0,
  `last_call_time` datetime DEFAULT NULL,
  `last_call_finish` datetime DEFAULT NULL,
  `group_grade` tinyint(2) unsigned DEFAULT 1,
  `calls_today_filtered` smallint(5) unsigned DEFAULT 0,
  `last_call_time_filtered` datetime DEFAULT NULL,
  `last_call_finish_filtered` datetime DEFAULT NULL,
  UNIQUE KEY `vlia_user_group_id` (`user`,`group_id`),
  KEY `group_id` (`group_id`),
  KEY `group_weight` (`group_weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_live_inbound_agents`
--

LOCK TABLES `vicidial_live_inbound_agents` WRITE;
/*!40000 ALTER TABLE `vicidial_live_inbound_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_live_inbound_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_log`
--

DROP TABLE IF EXISTS `vicidial_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term_reason` enum('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','NONE','SYSTEM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `alt_dial` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `called_count` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`uniqueid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_log`
--

LOCK TABLES `vicidial_log` WRITE;
/*!40000 ALTER TABLE `vicidial_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_log_archive`
--

DROP TABLE IF EXISTS `vicidial_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_log_archive` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term_reason` enum('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','NONE','SYSTEM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `alt_dial` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `called_count` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`uniqueid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_log_archive`
--

LOCK TABLES `vicidial_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_log_extended`
--

DROP TABLE IF EXISTS `vicidial_log_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_log_extended` (
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `custom_call_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_url_processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dispo_url_processed` enum('N','Y','U','XY','XU') COLLATE utf8_unicode_ci DEFAULT 'N',
  `multi_alt_processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  `noanswer_processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`uniqueid`),
  KEY `call_date` (`call_date`),
  KEY `vle_lead_id` (`lead_id`),
  KEY `vlecc` (`caller_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_log_extended`
--

LOCK TABLES `vicidial_log_extended` WRITE;
/*!40000 ALTER TABLE `vicidial_log_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_log_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_log_extended_archive`
--

DROP TABLE IF EXISTS `vicidial_log_extended_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_log_extended_archive` (
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `custom_call_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_url_processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dispo_url_processed` enum('N','Y','U','XY','XU') COLLATE utf8_unicode_ci DEFAULT 'N',
  `multi_alt_processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  `noanswer_processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`uniqueid`),
  UNIQUE KEY `vlea` (`uniqueid`,`call_date`,`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `vle_lead_id` (`lead_id`),
  KEY `vlecc` (`caller_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_log_extended_archive`
--

LOCK TABLES `vicidial_log_extended_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_log_extended_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_log_extended_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_log_extended_sip`
--

DROP TABLE IF EXISTS `vicidial_log_extended_sip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_log_extended_sip` (
  `call_date` datetime(6) DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `invite_to_ring` decimal(10,6) DEFAULT 0.000000,
  `ring_to_final` decimal(10,6) DEFAULT 0.000000,
  `invite_to_final` decimal(10,6) DEFAULT 0.000000,
  `last_event_code` smallint(3) DEFAULT 0,
  KEY `call_date` (`call_date`),
  KEY `caller_code` (`caller_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_log_extended_sip`
--

LOCK TABLES `vicidial_log_extended_sip` WRITE;
/*!40000 ALTER TABLE `vicidial_log_extended_sip` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_log_extended_sip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_log_extended_sip_archive`
--

DROP TABLE IF EXISTS `vicidial_log_extended_sip_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_log_extended_sip_archive` (
  `call_date` datetime(6) DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `invite_to_ring` decimal(10,6) DEFAULT 0.000000,
  `ring_to_final` decimal(10,6) DEFAULT 0.000000,
  `invite_to_final` decimal(10,6) DEFAULT 0.000000,
  `last_event_code` smallint(3) DEFAULT 0,
  UNIQUE KEY `vlesa` (`caller_code`,`call_date`),
  KEY `call_date` (`call_date`),
  KEY `caller_code` (`caller_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_log_extended_sip_archive`
--

LOCK TABLES `vicidial_log_extended_sip_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_log_extended_sip_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_log_extended_sip_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_log_noanswer`
--

DROP TABLE IF EXISTS `vicidial_log_noanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_log_noanswer` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term_reason` enum('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','NONE','SYSTEM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `alt_dial` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_log_noanswer`
--

LOCK TABLES `vicidial_log_noanswer` WRITE;
/*!40000 ALTER TABLE `vicidial_log_noanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_log_noanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_log_noanswer_archive`
--

DROP TABLE IF EXISTS `vicidial_log_noanswer_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_log_noanswer_archive` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `start_epoch` int(10) unsigned DEFAULT NULL,
  `end_epoch` int(10) unsigned DEFAULT NULL,
  `length_in_sec` int(10) DEFAULT NULL,
  `status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term_reason` enum('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','NONE','SYSTEM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `alt_dial` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uniqueid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_log_noanswer_archive`
--

LOCK TABLES `vicidial_log_noanswer_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_log_noanswer_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_log_noanswer_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_manager`
--

DROP TABLE IF EXISTS `vicidial_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_manager` (
  `man_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `status` enum('NEW','QUEUE','SENT','UPDATED','DEAD') COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_b` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_c` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_d` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_e` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_f` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_g` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_h` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_i` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_j` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmd_line_k` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`man_id`),
  KEY `callerid` (`callerid`),
  KEY `uniqueid` (`uniqueid`),
  KEY `serverstat` (`server_ip`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_manager`
--

LOCK TABLES `vicidial_manager` WRITE;
/*!40000 ALTER TABLE `vicidial_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_manager_chat_log`
--

DROP TABLE IF EXISTS `vicidial_manager_chat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_manager_chat_log` (
  `manager_chat_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manager_chat_id` int(10) unsigned DEFAULT NULL,
  `manager_chat_subid` tinyint(3) unsigned DEFAULT NULL,
  `manager` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_date` datetime DEFAULT NULL,
  `message_viewed_date` datetime DEFAULT NULL,
  `message_posted_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audio_alerted` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`manager_chat_message_id`),
  KEY `manager_chat_id_key` (`manager_chat_id`),
  KEY `manager_chat_subid_key` (`manager_chat_subid`),
  KEY `manager_chat_manager_key` (`manager`),
  KEY `manager_chat_user_key` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_manager_chat_log`
--

LOCK TABLES `vicidial_manager_chat_log` WRITE;
/*!40000 ALTER TABLE `vicidial_manager_chat_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_manager_chat_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_manager_chat_log_archive`
--

DROP TABLE IF EXISTS `vicidial_manager_chat_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_manager_chat_log_archive` (
  `manager_chat_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manager_chat_id` int(10) unsigned DEFAULT NULL,
  `manager_chat_subid` tinyint(3) unsigned DEFAULT NULL,
  `manager` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_date` datetime DEFAULT NULL,
  `message_viewed_date` datetime DEFAULT NULL,
  `message_posted_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audio_alerted` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`manager_chat_message_id`),
  KEY `manager_chat_id_archive_key` (`manager_chat_id`),
  KEY `manager_chat_subid_archive_key` (`manager_chat_subid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_manager_chat_log_archive`
--

LOCK TABLES `vicidial_manager_chat_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_manager_chat_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_manager_chat_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_manager_chats`
--

DROP TABLE IF EXISTS `vicidial_manager_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_manager_chats` (
  `manager_chat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `internal_chat_type` enum('AGENT','MANAGER') COLLATE utf8_unicode_ci DEFAULT 'MANAGER',
  `chat_start_date` datetime DEFAULT NULL,
  `manager` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_agents` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_user_groups` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_campaigns` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_replies` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`manager_chat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_manager_chats`
--

LOCK TABLES `vicidial_manager_chats` WRITE;
/*!40000 ALTER TABLE `vicidial_manager_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_manager_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_manager_chats_archive`
--

DROP TABLE IF EXISTS `vicidial_manager_chats_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_manager_chats_archive` (
  `manager_chat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `internal_chat_type` enum('AGENT','MANAGER') COLLATE utf8_unicode_ci DEFAULT 'MANAGER',
  `chat_start_date` datetime DEFAULT NULL,
  `manager` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_agents` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_user_groups` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_campaigns` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_replies` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`manager_chat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_manager_chats_archive`
--

LOCK TABLES `vicidial_manager_chats_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_manager_chats_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_manager_chats_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_manual_dial_queue`
--

DROP TABLE IF EXISTS `vicidial_manual_dial_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_manual_dial_queue` (
  `mdq_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `entry_time` datetime DEFAULT NULL,
  `status` enum('READY','QUEUE') COLLATE utf8_unicode_ci DEFAULT 'READY',
  `external_dial` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`mdq_id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_manual_dial_queue`
--

LOCK TABLES `vicidial_manual_dial_queue` WRITE;
/*!40000 ALTER TABLE `vicidial_manual_dial_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_manual_dial_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_monitor_calls`
--

DROP TABLE IF EXISTS `vicidial_monitor_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_monitor_calls` (
  `monitor_call_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor_time` datetime DEFAULT NULL,
  `user_phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'USER',
  `api_log` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `barge_listen` enum('LISTEN','BARGE') COLLATE utf8_unicode_ci DEFAULT 'LISTEN',
  `prepop_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `campaigns_limit` varchar(1000) COLLATE utf8_unicode_ci DEFAULT '',
  `users_list` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`monitor_call_id`),
  KEY `callerid` (`callerid`),
  KEY `monitor_time` (`monitor_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_monitor_calls`
--

LOCK TABLES `vicidial_monitor_calls` WRITE;
/*!40000 ALTER TABLE `vicidial_monitor_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_monitor_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_monitor_log`
--

DROP TABLE IF EXISTS `vicidial_monitor_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_monitor_log` (
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor_time` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `user` (`user`),
  KEY `campaign_id` (`campaign_id`),
  KEY `monitor_time` (`monitor_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_monitor_log`
--

LOCK TABLES `vicidial_monitor_log` WRITE;
/*!40000 ALTER TABLE `vicidial_monitor_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_monitor_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_music_on_hold`
--

DROP TABLE IF EXISTS `vicidial_music_on_hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_music_on_hold` (
  `moh_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `moh_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `random` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `remove` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`moh_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_music_on_hold`
--

LOCK TABLES `vicidial_music_on_hold` WRITE;
/*!40000 ALTER TABLE `vicidial_music_on_hold` DISABLE KEYS */;
INSERT INTO `vicidial_music_on_hold` VALUES ('default','Default Music On Hold','Y','N','N','---ALL---');
/*!40000 ALTER TABLE `vicidial_music_on_hold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_music_on_hold_files`
--

DROP TABLE IF EXISTS `vicidial_music_on_hold_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_music_on_hold_files` (
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `moh_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rank` smallint(5) DEFAULT NULL,
  UNIQUE KEY `mohfile` (`filename`,`moh_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_music_on_hold_files`
--

LOCK TABLES `vicidial_music_on_hold_files` WRITE;
/*!40000 ALTER TABLE `vicidial_music_on_hold_files` DISABLE KEYS */;
INSERT INTO `vicidial_music_on_hold_files` VALUES ('conf','default',1);
/*!40000 ALTER TABLE `vicidial_music_on_hold_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_nanpa_filter_log`
--

DROP TABLE IF EXISTS `vicidial_nanpa_filter_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_nanpa_filter_log` (
  `output_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'BEGIN',
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `list_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `leads_count` bigint(14) DEFAULT 0,
  `filter_count` bigint(14) DEFAULT 0,
  `status_line` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `script_output` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`output_code`),
  KEY `start_time` (`start_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_nanpa_filter_log`
--

LOCK TABLES `vicidial_nanpa_filter_log` WRITE;
/*!40000 ALTER TABLE `vicidial_nanpa_filter_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_nanpa_filter_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_nanpa_prefix_codes`
--

DROP TABLE IF EXISTS `vicidial_nanpa_prefix_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_nanpa_prefix_codes` (
  `areacode` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GMT_offset` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DST` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `state` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `postal_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `lata_type` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `areaprefix` (`areacode`,`prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_nanpa_prefix_codes`
--

LOCK TABLES `vicidial_nanpa_prefix_codes` WRITE;
/*!40000 ALTER TABLE `vicidial_nanpa_prefix_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_nanpa_prefix_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_outbound_ivr_log`
--

DROP TABLE IF EXISTS `vicidial_outbound_ivr_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_outbound_ivr_log` (
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `event_date` datetime DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `menu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `menu_action` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `campserver` (`event_date`,`lead_id`,`menu_id`),
  KEY `event_date` (`event_date`),
  KEY `lead_id` (`lead_id`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_outbound_ivr_log`
--

LOCK TABLES `vicidial_outbound_ivr_log` WRITE;
/*!40000 ALTER TABLE `vicidial_outbound_ivr_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_outbound_ivr_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_outbound_ivr_log_archive`
--

DROP TABLE IF EXISTS `vicidial_outbound_ivr_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_outbound_ivr_log_archive` (
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `event_date` datetime DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `menu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `menu_action` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `campserver` (`event_date`,`lead_id`,`menu_id`),
  KEY `event_date` (`event_date`),
  KEY `lead_id` (`lead_id`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_outbound_ivr_log_archive`
--

LOCK TABLES `vicidial_outbound_ivr_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_outbound_ivr_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_outbound_ivr_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_override_ids`
--

DROP TABLE IF EXISTS `vicidial_override_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_override_ids` (
  `id_table` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `value` int(9) DEFAULT 0,
  PRIMARY KEY (`id_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_override_ids`
--

LOCK TABLES `vicidial_override_ids` WRITE;
/*!40000 ALTER TABLE `vicidial_override_ids` DISABLE KEYS */;
INSERT INTO `vicidial_override_ids` VALUES ('vicidial_users','0',1000),('vicidial_campaigns','0',20000),('vicidial_inbound_groups','0',30000),('vicidial_lists','0',40000),('vicidial_call_menu','0',50000),('vicidial_user_groups','0',60000),('vicidial_lead_filters','0',70000),('vicidial_scripts','0',80000),('phones','0',100);
/*!40000 ALTER TABLE `vicidial_override_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_pause_codes`
--

DROP TABLE IF EXISTS `vicidial_pause_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_pause_codes` (
  `pause_code` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `pause_code_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billable` enum('NO','YES','HALF') COLLATE utf8_unicode_ci DEFAULT 'NO',
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_limit` smallint(5) unsigned DEFAULT 65000,
  `require_mgr_approval` enum('NO','YES') COLLATE utf8_unicode_ci DEFAULT 'NO',
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_pause_codes`
--

LOCK TABLES `vicidial_pause_codes` WRITE;
/*!40000 ALTER TABLE `vicidial_pause_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_pause_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_peer_event_log`
--

DROP TABLE IF EXISTS `vicidial_peer_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_peer_event_log` (
  `peer_event_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `event_type` enum('UNKNOWN','REGISTERED','UNREGISTERED','REACHABLE','LAGGED','UNREACHABLE','RTPDISCONNECT','CRITICALTIMEOUT') COLLATE utf8_unicode_ci DEFAULT 'UNKNOWN',
  `event_date` datetime(6) NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `host_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `port` smallint(6) DEFAULT NULL,
  `channel_type` enum('IAX2','SIP') COLLATE utf8_unicode_ci DEFAULT NULL,
  `peer` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`peer_event_id`),
  KEY `event_date` (`event_date`),
  KEY `peer` (`peer`),
  KEY `channel` (`channel`)
) ENGINE=MyISAM AUTO_INCREMENT=630338 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_peer_event_log`
--

LOCK TABLES `vicidial_peer_event_log` WRITE;
/*!40000 ALTER TABLE `vicidial_peer_event_log` DISABLE KEYS */;
INSERT INTO `vicidial_peer_event_log` VALUES (630320,'UNREGISTERED','2021-07-09 15:30:58.668885','','192.168.1.180','',NULL,'IAX2','IAX2/ASTloop','|'),(630321,'REGISTERED','2021-07-09 15:30:59.707174','','192.168.1.180','',NULL,'IAX2','IAX2/ASTloop','|'),(630322,'REGISTERED','2021-07-09 17:59:21.208013','','192.168.1.180','',NULL,'IAX2','IAX2/ASTblind','|'),(630323,'REGISTERED','2021-07-09 17:59:21.450341','','192.168.1.180','',NULL,'IAX2','IAX2/ASTloop','|'),(630324,'REGISTERED','2021-07-09 17:59:21.451730','','192.168.1.180','',NULL,'IAX2','IAX2/ASTplay','|'),(630325,'LAGGED','2021-07-09 18:00:26.708147','','192.168.1.180','',NULL,'IAX2','IAX2/ASTloop','|'),(630326,'REACHABLE','2021-07-09 18:00:36.708408','','192.168.1.180','',NULL,'IAX2','IAX2/ASTloop','|'),(630327,'UNREGISTERED','2021-07-10 10:24:39.245154','','192.168.1.180','',NULL,'IAX2','IAX2/ASTblind','|'),(630328,'UNREGISTERED','2021-07-10 10:24:40.085929','','192.168.1.180','',NULL,'IAX2','IAX2/ASTloop','|'),(630329,'UNREGISTERED','2021-07-10 10:24:40.088471','','192.168.1.180','',NULL,'IAX2','IAX2/ASTplay','|'),(630330,'REGISTERED','2021-07-10 10:24:42.662679','','192.168.1.180','',NULL,'IAX2','IAX2/ASTloop','|'),(630331,'REGISTERED','2021-07-10 10:24:42.856667','','192.168.1.180','',NULL,'IAX2','IAX2/ASTblind','|'),(630332,'REGISTERED','2021-07-10 10:24:42.858395','','192.168.1.180','',NULL,'IAX2','IAX2/ASTplay','|'),(630333,'REGISTERED','2021-07-11 11:07:13.704587','','192.168.1.180','',NULL,'IAX2','IAX2/ASTblind','|'),(630334,'REGISTERED','2021-07-11 11:07:14.111989','','192.168.1.180','',NULL,'IAX2','IAX2/ASTplay','|'),(630335,'REGISTERED','2021-07-11 11:07:15.664985','','192.168.1.180','',NULL,'IAX2','IAX2/ASTloop','|'),(630336,'LAGGED','2021-07-11 11:24:50.715467','','192.168.1.180','',NULL,'IAX2','IAX2/ASTplay','|'),(630337,'REACHABLE','2021-07-11 11:25:00.714937','','192.168.1.180','',NULL,'IAX2','IAX2/ASTplay','|');
/*!40000 ALTER TABLE `vicidial_peer_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_peer_event_log_archive`
--

DROP TABLE IF EXISTS `vicidial_peer_event_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_peer_event_log_archive` (
  `peer_event_id` int(9) unsigned NOT NULL,
  `event_type` enum('UNKNOWN','REGISTERED','UNREGISTERED','REACHABLE','LAGGED','UNREACHABLE','RTPDISCONNECT','CRITICALTIMEOUT') COLLATE utf8_unicode_ci DEFAULT 'UNKNOWN',
  `event_date` datetime(6) NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `host_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `port` smallint(6) DEFAULT NULL,
  `channel_type` enum('IAX2','SIP') COLLATE utf8_unicode_ci DEFAULT NULL,
  `peer` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`peer_event_id`),
  KEY `event_date` (`event_date`),
  KEY `peer` (`peer`),
  KEY `channel` (`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_peer_event_log_archive`
--

LOCK TABLES `vicidial_peer_event_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_peer_event_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_peer_event_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_phone_codes`
--

DROP TABLE IF EXISTS `vicidial_phone_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_phone_codes` (
  `country_code` smallint(5) unsigned DEFAULT NULL,
  `country` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `areacode` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GMT_offset` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DST` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `DST_range` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geographic_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tz_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT '',
  `php_tz` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `country_area_code` (`country_code`,`areacode`),
  KEY `country_state` (`country_code`,`state`),
  KEY `country_code` (`country_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_phone_codes`
--

LOCK TABLES `vicidial_phone_codes` WRITE;
/*!40000 ALTER TABLE `vicidial_phone_codes` DISABLE KEYS */;
INSERT INTO `vicidial_phone_codes` VALUES (1,'USA','201','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','202','DC','-5','Y','SSM-FSN','District of Columbia','EST','America/New_York'),(1,'USA','203','CT','-5','Y','SSM-FSN','Connecticut','EST','America/New_York'),(1,'CAN','204','MB','-6','Y','SSM-FSN','Manitoba','CST','America/Winnipeg'),(1,'USA','205','AL','-6','Y','SSM-FSN','Alabama','CST','America/Chicago'),(1,'USA','206','WA','-8','Y','SSM-FSN','Washington','PST','America/Los_Angeles'),(1,'USA','207','ME','-5','Y','SSM-FSN','Maine','EST','America/New_York'),(1,'USA','208','ID','-7','Y','SSM-FSN','Idaho','MST','America/Denver'),(1,'USA','209','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','210','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','212','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','213','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','214','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','215','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','216','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','217','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','218','MN','-6','Y','SSM-FSN','Minnesota','CST','America/Chicago'),(1,'USA','219','IN','-6','Y','SSM-FSN','Indiana','CST','America/Chicago'),(1,'USA','220','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','223','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','224','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','225','LA','-6','Y','SSM-FSN','Louisiana','CST','America/Chicago'),(1,'CAN','226','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','227','MD','-5','Y','SSM-FSN','Maryland','EST','America/New_York'),(1,'USA','228','MS','-6','Y','SSM-FSN','Mississippi','CST','America/Chicago'),(1,'USA','229','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','231','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','234','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'CAN','236','BC','-8','Y','SSM-FSN','British Columbia','PST','America/Vancouver'),(1,'USA','239','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','240','MD','-5','Y','SSM-FSN','Maryland','EST','America/New_York'),(1,'BHS','242','','-5','Y','FSA-LSO','Bahamas','EST','America/Nassau'),(1,'BRB','246','','-4','N','','Barbados','AST','America/Barbados'),(1,'USA','248','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'CAN','249','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'CAN','250','BC','-8','Y','SSM-FSN','British Columbia','PST','America/Vancouver'),(1,'USA','251','AL','-6','Y','SSM-FSN','Alabama','CST','America/Chicago'),(1,'USA','252','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'USA','253','WA','-8','Y','SSM-FSN','Washington','PST','America/Los_Angeles'),(1,'USA','254','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','256','AL','-6','Y','SSM-FSN','Alabama','CST','America/Chicago'),(1,'USA','260','IN','-5','Y','SSM-FSN','Indiana','EST','America/New_York'),(1,'USA','262','WI','-6','Y','SSM-FSN','Wisconsin','CST','America/Chicago'),(1,'AIA','264','','-4','N','','Anguilla','AST','America/Anguilla'),(1,'USA','267','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'ATG','268','','-4','N','','Antigua and Barbuda','AST','America/Antigua'),(1,'USA','269','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','270','KY','-6','Y','SSM-FSN','Kentucky','CST','America/Chicago'),(1,'USA','272','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','274','WI','-6','Y','SSM-FSN','Wisconsin','CST','America/Chicago'),(1,'USA','276','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'USA','278','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','279','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','280','MD','-5','Y','SSM-FSN','Maryland','EST','America/New_York'),(1,'USA','281','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','282','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','283','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'VGB','284','','-4','N','','British Virgin Islands','AST','America/Puerto_Rico'),(1,'CAN','289','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'ABW','297','','-4','N','','Aruba','AST','America/Aruba'),(1,'USA','301','MD','-5','Y','SSM-FSN','Maryland','EST','America/New_York'),(1,'USA','302','DE','-5','Y','SSM-FSN','Delaware','EST','America/New_York'),(1,'USA','303','CO','-7','Y','SSM-FSN','Colorado','MST','America/Denver'),(1,'USA','304','WV','-5','Y','SSM-FSN','West Virginia','EST','America/New_York'),(1,'USA','305','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'CAN','306','SK','-6','N','','Saskatchewan','CST','America/Regina'),(1,'USA','307','WY','-7','Y','SSM-FSN','Wyoming','MST','America/Denver'),(1,'USA','308','NE','-6','Y','SSM-FSN','Nebraska','CST','America/Chicago'),(1,'USA','309','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','310','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','312','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','313','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','314','MO','-6','Y','SSM-FSN','Missouri','CST','America/Chicago'),(1,'USA','315','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','316','KS','-6','Y','SSM-FSN','Kansas','CST','America/Chicago'),(1,'USA','317','IN','-5','Y','SSM-FSN','Indiana','EST','America/New_York'),(1,'USA','318','LA','-6','Y','SSM-FSN','Louisiana','CST','America/Chicago'),(1,'USA','319','IA','-6','Y','SSM-FSN','Iowa','CST','America/Chicago'),(1,'USA','320','MN','-6','Y','SSM-FSN','Minnesota','CST','America/Chicago'),(1,'USA','321','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','323','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','325','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','326','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','327','AR','-6','Y','SSM-FSN','Arkansas','CST','America/Chicago'),(1,'USA','330','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','331','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','332','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','334','AL','-6','Y','SSM-FSN','Alabama','CST','America/Chicago'),(1,'USA','336','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'USA','337','LA','-6','Y','SSM-FSN','Louisiana','CST','America/Chicago'),(1,'USA','339','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'VIR','340','','-4','N','','Virgin Islands','AST','America/Puerto_Rico'),(1,'USA','341','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'CAN','343','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'CYM','345','','-5','Y','FSA-LSO','Cayman Islands','EST','America/Cayman'),(1,'USA','346','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','347','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','351','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'USA','352','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'CAN','354','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'USA','358','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','360','WA','-8','Y','SSM-FSN','Washington','PST','America/Los_Angeles'),(1,'USA','361','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','364','KY','-6','Y','SSM-FSN','Kentucky','CST','America/Chicago'),(1,'CAN','365','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'CAN','367','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'CAN','368','AB','-7','Y','SSM-FSN','Alberta','MST','America/Edmonton'),(1,'USA','369','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','380','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','385','UT','-7','Y','SSM-FSN','Utah','MST','America/Denver'),(1,'USA','386','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','401','RI','-5','Y','SSM-FSN','Rhode Island','EST','America/New_York'),(1,'USA','402','NE','-6','Y','SSM-FSN','Nebraska','CST','America/Chicago'),(1,'CAN','403','AB','-7','Y','SSM-FSN','Alberta','MST','America/Edmonton'),(1,'USA','404','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','405','OK','-6','Y','SSM-FSN','Oklahoma','CST','America/Chicago'),(1,'USA','406','MT','-7','Y','SSM-FSN','Montana','MST','America/Denver'),(1,'USA','407','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','408','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','409','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','410','MD','-5','Y','SSM-FSN','Maryland','EST','America/New_York'),(1,'USA','412','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','413','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'USA','414','WI','-6','Y','SSM-FSN','Wisconsin','CST','America/Chicago'),(1,'USA','415','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'CAN','416','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','417','MO','-6','Y','SSM-FSN','Missouri','CST','America/Chicago'),(1,'CAN','418','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'USA','419','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','423','TN','-5','Y','SSM-FSN','Tennessee','EST','America/New_York'),(1,'USA','424','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','425','WA','-8','Y','SSM-FSN','Washington','PST','America/Los_Angeles'),(1,'CAN','428','NB','-4','Y','SSM-FSN','New Brunswick','AST','America/Moncton'),(1,'USA','430','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'CAN','431','MB','-6','Y','SSM-FSN','Manitoba','CST','America/Winnipeg'),(1,'USA','432','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','434','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'USA','435','UT','-7','Y','SSM-FSN','Utah','MST','America/Denver'),(1,'CAN','437','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'CAN','438','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'USA','440','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'BMU','441','','-4','Y','FSA-LSO','Bermuda','AST','Atlantic/Bermuda'),(1,'USA','442','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','443','MD','-5','Y','SSM-FSN','Maryland','EST','America/New_York'),(1,'USA','445','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','447','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','448','FL','-6','Y','SSM-FSN','Florida','CST','America/Chicago'),(1,'CAN','450','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'USA','458','OR','-8','Y','SSM-FSN','Oregon','PST','America/Los_Angeles'),(1,'USA','463','IN','-5','Y','SSM-FSN','Indiana','EST','America/New_York'),(1,'USA','464','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','469','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','470','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'GRD','473','','-4','N','','Grenada','AST','America/Grenada'),(1,'CAN','474','SK','-6','N','','Saskatchewan','CST','America/Regina'),(1,'USA','475','CT','-5','Y','SSM-FSN','Connecticut','EST','America/New_York'),(1,'USA','478','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','479','AR','-6','Y','SSM-FSN','Arkansas','CST','America/Chicago'),(1,'USA','480','AZ','-7','N','','Arizona','MST','America/Phoenix'),(1,'USA','484','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','501','AR','-6','Y','SSM-FSN','Arkansas','CST','America/Chicago'),(1,'USA','502','KY','-5','Y','SSM-FSN','Kentucky','EST','America/New_York'),(1,'USA','503','OR','-8','Y','SSM-FSN','Oregon','PST','America/Los_Angeles'),(1,'USA','504','LA','-6','Y','SSM-FSN','Louisiana','CST','America/Chicago'),(1,'USA','505','NM','-7','Y','SSM-FSN','New Mexico','MST','America/Denver'),(1,'CAN','506','NB','-4','Y','SSM-FSN','New Brunswick','AST','America/Moncton'),(1,'USA','507','MN','-6','Y','SSM-FSN','Minnesota','CST','America/Chicago'),(1,'USA','508','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'USA','509','WA','-8','Y','SSM-FSN','Washington','PST','America/Los_Angeles'),(1,'USA','510','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','512','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','513','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'CAN','514','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'USA','515','IA','-6','Y','SSM-FSN','Iowa','CST','America/Chicago'),(1,'USA','516','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','517','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','518','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'CAN','519','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','520','AZ','-7','N','','Arizona','MST','America/Phoenix'),(1,'USA','530','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','531','NE','-6','Y','SSM-FSN','Nebraska','CST','America/Chicago'),(1,'USA','534','WI','-6','Y','SSM-FSN','Wisconsin','CST','America/Chicago'),(1,'USA','539','OK','-6','Y','SSM-FSN','Oklahoma','CST','America/Chicago'),(1,'USA','540','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'USA','541','OR','-8','Y','SSM-FSN','Oregon','PST','America/Los_Angeles'),(1,'USA','546','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'CAN','548','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','551','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','557','MO','-6','Y','SSM-FSN','Missouri','CST','America/Chicago'),(1,'USA','559','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','561','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','562','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','563','IA','-6','Y','SSM-FSN','Iowa','CST','America/Chicago'),(1,'USA','564','WA','-8','Y','SSM-FSN','Washington','PST','America/Los_Angeles'),(1,'USA','567','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','570','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','571','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'USA','572','OK','-6','Y','SSM-FSN','Oklahoma','CST','America/Chicago'),(1,'USA','573','MO','-6','Y','SSM-FSN','Missouri','CST','America/Chicago'),(1,'USA','574','IN','-5','Y','SSM-FSN','Indiana','EST','America/New_York'),(1,'USA','575','NM','-7','Y','SSM-FSN','New Mexico','MST','America/Denver'),(1,'CAN','579','QU','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'USA','580','OK','-6','Y','SSM-FSN','Oklahoma','CST','America/Chicago'),(1,'CAN','581','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'USA','582','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','585','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','586','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'CAN','587','AB','-7','Y','SSM-FSN','Alberta','MST','America/Edmonton'),(1,'GLP','590','','-4','N','','Guadeloupe','AST','America/Guadeloupe'),(1,'MTQ','596','','-4','N','','Martinique','AST','America/Martinique'),(1,'CUW','599','','-4','N','','Antilles','AST','America/Curacao'),(1,'USA','601','MS','-6','Y','SSM-FSN','Mississippi','CST','America/Chicago'),(1,'USA','602','AZ','-7','N','','Arizona','MST','America/Phoenix'),(1,'USA','603','NH','-5','Y','SSM-FSN','New Hampshire','EST','America/New_York'),(1,'CAN','604','BC','-8','Y','SSM-FSN','British Columbia','PST','America/Vancouver'),(1,'USA','605','SD','-6','Y','SSM-FSN','South Dakota','CST','America/Chicago'),(1,'USA','606','KY','-5','Y','SSM-FSN','Kentucky','EST','America/New_York'),(1,'USA','607','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','608','WI','-6','Y','SSM-FSN','Wisconsin','CST','America/Chicago'),(1,'USA','609','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','610','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','612','MN','-6','Y','SSM-FSN','Minnesota','CST','America/Chicago'),(1,'CAN','613','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','614','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','615','TN','-6','Y','SSM-FSN','Tennessee','CST','America/Chicago'),(1,'USA','616','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','617','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'USA','618','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','619','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','620','KS','-6','Y','SSM-FSN','Kansas','CST','America/Chicago'),(1,'USA','623','AZ','-7','N','','Arizona','MST','America/Phoenix'),(1,'USA','626','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','627','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','628','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','629','TN','-6','Y','SSM-FSN','Tennessee','CST','America/Chicago'),(1,'USA','630','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','631','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','636','MO','-6','Y','SSM-FSN','Missouri','CST','America/Chicago'),(1,'CAN','639','SK','-6','N','','Saskatchewan','CST','America/Regina'),(1,'USA','640','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','641','IA','-6','Y','SSM-FSN','Iowa','CST','America/Chicago'),(1,'USA','646','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'CAN','647','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'TCA','649','','-5','Y','FSA-LSO','Turks Islands','EST','America/New_York'),(1,'USA','650','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','651','MN','-6','Y','SSM-FSN','Minnesota','CST','America/Chicago'),(1,'USA','656','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','657','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'JAM','658','','-5','N','','Jamaica','EST','America/Jamaica'),(1,'USA','659','AL','-6','Y','SSM-FSN','Alabama','CST','America/Chicago'),(1,'USA','660','MO','-6','Y','SSM-FSN','Missouri','CST','America/Chicago'),(1,'USA','661','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','662','MS','-6','Y','SSM-FSN','Mississippi','CST','America/Chicago'),(1,'MSR','664','','-4','N','','Montserrat','AST','America/Montserrat'),(1,'USA','667','MD','-5','Y','SSM-FSN','Maryland','EST','America/New_York'),(1,'USA','669','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'MNP','670','MP','+10','N','','Mariana Islands','ChST','Pacific/Saipan'),(1,'GUM','671','GU','+10','N','','Guam','GST','Pacific/Guam'),(1,'CAN','672','BC','-8','Y','SSM-FSN','British Columbia','PST','America/Vancouver'),(1,'USA','678','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','679','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','680','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','681','WV','-5','Y','SSM-FSN','West Virginia','EST','America/New_York'),(1,'USA','682','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'ASM','684','','-11','N','','American Samoa','SST','Pacific/Pago_Pago'),(1,'USA','689','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','701','ND','-6','Y','SSM-FSN','North Dakota','CST','America/Chicago'),(1,'USA','702','NV','-8','Y','SSM-FSN','Nevada','PST','America/Los_Angeles'),(1,'USA','703','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'USA','704','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'CAN','705','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','706','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','707','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','708','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'CAN','709','NF','-3.5','Y','SSM-FSN','Newfoundland','NST','America/St_Johns'),(1,'USA','712','IA','-6','Y','SSM-FSN','Iowa','CST','America/Chicago'),(1,'USA','713','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','714','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','715','WI','-6','Y','SSM-FSN','Wisconsin','CST','America/Chicago'),(1,'USA','716','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','717','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','718','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','719','CO','-7','Y','SSM-FSN','Colorado','MST','America/Denver'),(1,'USA','720','CO','-7','Y','SSM-FSN','Colorado','MST','America/Denver'),(1,'NLD','721','','-4','N','','St. Maarten','AST','America/St_Barthelemy'),(1,'USA','724','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','725','NV','-8','Y','SSM-FSN','Nevada','PST','America/Los_Angeles'),(1,'USA','726','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','727','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','730','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','731','TN','-6','Y','SSM-FSN','Tennessee','CST','America/Chicago'),(1,'USA','732','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','734','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','737','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','740','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'CAN','742','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','743','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'USA','747','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','752','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','754','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','757','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'LCA','758','','-4','N','','St. Lucia','AST','America/St_Lucia'),(1,'USA','760','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','762','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','763','MN','-6','Y','SSM-FSN','Minnesota','CST','America/Chicago'),(1,'USA','764','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','765','IN','-5','Y','SSM-FSN','Indiana','EST','America/New_York'),(1,'DMA','767','','-4','N','','Dominica','AST','America/Dominica'),(1,'USA','769','MS','-6','Y','SSM-FSN','Mississippi','CST','America/Chicago'),(1,'USA','770','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','771','DC','-5','Y','SSM-FSN','District of Columbia','EST','America/New_York'),(1,'USA','772','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','773','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','774','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'USA','775','NV','-8','Y','SSM-FSN','Nevada','PST','America/Los_Angeles'),(1,'CAN','778','BC','-8','Y','SSM-FSN','British Columbia','PST','America/Vancouver'),(1,'USA','779','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'CAN','780','AB','-7','Y','SSM-FSN','Alberta','MST','America/Edmonton'),(1,'USA','781','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'CAN','782','NS','-4','Y','SSM-FSN','Nova Scotia','AST','America/Moncton'),(1,'VCT','784','','-4','N','','St. Vincent','AST','America/St_Vincent'),(1,'USA','785','KS','-6','Y','SSM-FSN','Kansas','CST','America/Chicago'),(1,'USA','786','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'PRI','787','PR','-4','N','','Puerto Rico','AST','America/Puerto_Rico'),(1,'USA','801','UT','-7','Y','SSM-FSN','Utah','MST','America/Denver'),(1,'USA','802','VT','-5','Y','SSM-FSN','Vermont','EST','America/New_York'),(1,'USA','803','SC','-5','Y','SSM-FSN','South Carolina','EST','America/New_York'),(1,'USA','804','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'USA','805','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','806','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'CAN','807','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','808','HI','-10','N','','Hawaii','HST','Pacific/Honolulu'),(1,'DOM','809','','-4','N','','Dominican Republic','AST','America/Santo_Domingo'),(1,'USA','810','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','812','IN','-5','Y','SSM-FSN','Indiana','EST','America/New_York'),(1,'USA','813','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','814','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','815','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','816','MO','-6','Y','SSM-FSN','Missouri','CST','America/Chicago'),(1,'USA','817','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','818','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'CAN','819','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'USA','820','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'CAN','825','AB','-7','Y','SSM-FSN','Alberta','MST','America/Edmonton'),(1,'USA','826','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'USA','828','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'DOM','829','','-4','N','','Dominican Republic','AST','America/Santo_Domingo'),(1,'USA','830','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','831','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','832','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','835','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'USA','838','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','839','SC','-5','Y','SSM-FSN','South Carolina','EST','America/New_York'),(1,'USA','840','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','843','SC','-5','Y','SSM-FSN','South Carolina','EST','America/New_York'),(1,'USA','845','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','847','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'USA','848','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'DOM','849','','-4','N','','Dominican Republic','AST','America/Santo_Domingo'),(1,'USA','850','FL','-6','Y','SSM-FSN','Florida','CST','America/Chicago'),(1,'USA','854','SC','-5','Y','SSM-FSN','South Carolina','EST','America/New_York'),(1,'USA','856','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','857','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'USA','858','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','859','KY','-5','Y','SSM-FSN','Kentucky','EST','America/New_York'),(1,'USA','860','CT','-5','Y','SSM-FSN','Connecticut','EST','America/New_York'),(1,'USA','862','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','863','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','864','SC','-5','Y','SSM-FSN','South Carolina','EST','America/New_York'),(1,'USA','865','TN','-5','Y','SSM-FSN','Tennessee','EST','America/New_York'),(1,'CAN','867','YT','-7','N','','Yukon','MST','America/Whitehorse'),(1,'TTO','868','','-4','N','','Trinidad and Tobago','AST','America/Grand_Turk'),(1,'KNA','869','','-4','N','','St. Kitts and Nevis','AST','America/St_Kitts'),(1,'USA','870','AR','-6','Y','SSM-FSN','Arkansas','CST','America/Chicago'),(1,'USA','872','IL','-6','Y','SSM-FSN','Illinois','CST','America/Chicago'),(1,'CAN','873','QC','-5','Y','SSM-FSN','Quebec','EST','America/Toronto'),(1,'JAM','876','','-5','N','','Jamaica','EST','America/Jamaica'),(1,'USA','878','PA','-5','Y','SSM-FSN','Pennsylvania','EST','America/New_York'),(1,'CAN','879','NF','-3.5','Y','SSM-FSN','Newfoundland','NST','America/St_Johns'),(1,'USA','901','TN','-6','Y','SSM-FSN','Tennessee','CST','America/Chicago'),(1,'CAN','902','NS','-4','Y','SSM-FSN','Nova Scotia','AST','America/Moncton'),(1,'USA','903','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','904','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'CAN','905','ON','-5','Y','SSM-FSN','Ontario','EST','America/Toronto'),(1,'USA','906','MI','-6','Y','SSM-FSN','Michigan','CST','America/Chicago'),(1,'USA','907','AK','-9','Y','SSM-FSN','Alaska','AKST','America/Anchorage'),(1,'USA','908','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','909','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','910','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'USA','912','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','913','KS','-6','Y','SSM-FSN','Kansas','CST','America/Chicago'),(1,'USA','914','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','915','TX','-7','Y','SSM-FSN','Texas','MST','America/Denver'),(1,'USA','916','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','917','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','918','OK','-6','Y','SSM-FSN','Oklahoma','CST','America/Chicago'),(1,'USA','919','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'USA','920','WI','-6','Y','SSM-FSN','Wisconsin','CST','America/Chicago'),(1,'USA','925','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','927','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','928','AZ','-7','N','','Arizona','MST','America/Phoenix'),(1,'USA','929','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','930','IN','-5','Y','SSM-FSN','Indiana','EST','America/New_York'),(1,'USA','931','TN','-6','Y','SSM-FSN','Tennessee','CST','America/Chicago'),(1,'USA','934','NY','-5','Y','SSM-FSN','New York','EST','America/New_York'),(1,'USA','935','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','936','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','937','OH','-5','Y','SSM-FSN','Ohio','EST','America/New_York'),(1,'USA','938','AL','-6','Y','SSM-FSN','Alabama','CST','America/Chicago'),(1,'USA','939','PR','-4','N','','Puerto Rico','AST','America/Puerto_Rico'),(1,'USA','940','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','941','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','943','GA','-5','Y','SSM-FSN','Georgia','EST','America/New_York'),(1,'USA','945','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','947','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(1,'USA','948','VA','-5','Y','SSM-FSN','Virginia','EST','America/New_York'),(1,'USA','949','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','951','CA','-8','Y','SSM-FSN','California','PST','America/Los_Angeles'),(1,'USA','952','MN','-6','Y','SSM-FSN','Minnesota','CST','America/Chicago'),(1,'USA','954','FL','-5','Y','SSM-FSN','Florida','EST','America/New_York'),(1,'USA','956','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','957','NM','-7','Y','SSM-FSN','New Mexico','MST','America/Denver'),(1,'USA','959','CT','-5','Y','SSM-FSN','Connecticut','EST','America/New_York'),(1,'USA','970','CO','-7','Y','SSM-FSN','Colorado','MST','America/Denver'),(1,'USA','971','OR','-8','Y','SSM-FSN','Oregon','PST','America/Los_Angeles'),(1,'USA','972','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','973','NJ','-5','Y','SSM-FSN','New Jersey','EST','America/New_York'),(1,'USA','975','MO','-6','Y','SSM-FSN','Missouri','CST','America/Chicago'),(1,'USA','978','MA','-5','Y','SSM-FSN','Massachusetts','EST','America/New_York'),(1,'USA','979','TX','-6','Y','SSM-FSN','Texas','CST','America/Chicago'),(1,'USA','980','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'USA','984','NC','-5','Y','SSM-FSN','North Carolina','EST','America/New_York'),(1,'USA','985','LA','-6','Y','SSM-FSN','Louisiana','CST','America/Chicago'),(1,'USA','986','ID','-7','Y','SSM-FSN','Idaho','MST','America/Denver'),(1,'USA','989','MI','-5','Y','SSM-FSN','Michigan','EST','America/New_York'),(7,'RUS','*','','+3','Y','LSM-LSO','Russia','MSK','Europe/Moscow'),(7,'KAZ','*','','+6','N','','Kazakhstan','ALMT','Asia/Almaty'),(7,'TJK','*','','+5','N','','Tajikistan','TJT','Asia/Dushanbe'),(7,'TKM','*','','+5','N','','Turkmenistan','TMT','Asia/Ashgabat'),(7,'KGZ','*','','+6','N','','Kyrgyzstan','KGT','Asia/Bishkek'),(20,'EGY','*','','+2','Y','LTA-LTS','Egypt','EET','Africa/Cairo'),(27,'ZAF','*','','+2','N','','South Africa','SAST','Africa/Johannesburg'),(30,'GRC','*','','+2','Y','LSM-LSO','Greece','EET','Europe/Athens'),(31,'NLD','*','','+1','Y','LSM-LSO','Netherlands Holland','CET','Europe/Amsterdam'),(32,'BEL','*','','+1','Y','LSM-LSO','Belgium','CET','Europe/Brussels'),(33,'FRA','*','','+1','Y','LSM-LSO','France','CET','Europe/Paris'),(34,'ESP','*','','+1','Y','LSM-LSO','Spain','CET','Europe/Madrid'),(36,'HUN','*','','+1','Y','LSM-LSO','Hungary','CET','Europe/Budapest'),(39,'ITA','*','','+1','Y','LSM-LSO','Italy','CET','Europe/Rome'),(39,'VAT','*','','+1','Y','LSM-LSO','Vatican City','CET','Europe/Vatican'),(40,'ROU','*','','+2','Y','LSM-LSO','Romania','EET','Europe/Bucharest'),(41,'CHE','*','','+1','Y','LSM-LSO','Switzerland','CET','Europe/Zurich'),(42,'CZE','*','','+1','Y','LSM-LSO','Czech Republic','CET','Europe/Prague'),(43,'AUT','*','','+1','Y','LSM-LSO','Austria','CET','Europe/Vienna'),(44,'GBR','*','','0','Y','LSM-LSO','Great Britain United Kingdom','GMT','Europe/London'),(45,'DNK','*','','+1','Y','LSM-LSO','Denmark','CET','Europe/Copenhagen'),(46,'SWE','*','','+1','Y','LSM-LSO','Sweden','CET','Europe/Stockholm'),(47,'NOR','*','','+1','Y','LSM-LSO','Norway','CET','Europe/Oslo'),(48,'POL','*','','+1','Y','LSM-LSO','Poland','CET','Europe/Warsaw'),(49,'DEU','*','','+1','Y','LSM-LSO','Germany','CET','Europe/Berlin'),(51,'PER','*','','-5','N','','Peru','PET','America/Lima'),(52,'MEX','221','','-6','Y','FSA-LSO','Puebla, Pue.','CST','America/Mexico_City'),(52,'MEX','222','','-6','Y','FSA-LSO','Puebla, Pue.','CST','America/Mexico_City'),(52,'MEX','223','','-6','Y','FSA-LSO','Magdalena Tetela Morelos, La','CST','America/Mexico_City'),(52,'MEX','224','','-6','Y','FSA-LSO','Almolonga Todos Santos jp','CST','America/Mexico_City'),(52,'MEX','225','','-6','Y','FSA-LSO','Palmilla, Laakr','CST','America/Mexico_City'),(52,'MEX','226','','-6','Y','FSA-LSO','Altotongar','CST','America/Mexico_City'),(52,'MEX','227','','-6','Y','FSA-LSO','Huejotzingoq','CST','America/Mexico_City'),(52,'MEX','228','','-6','Y','FSA-LSO','Jalapa, Ver.bze','CST','America/Mexico_City'),(52,'MEX','229','','-6','Y','FSA-LSO','Veracruz, Ver.','CST','America/Mexico_City'),(52,'MEX','231','','-6','Y','FSA-LSO','Aire Libre La Mina re','CST','America/Mexico_City'),(52,'MEX','232','','-6','Y','FSA-LSO','Arroyo Del Potrero','CST','America/Mexico_City'),(52,'MEX','233','','-6','Y','FSA-LSO','Ayotoxco De Guerrerok','CST','America/Mexico_City'),(52,'MEX','235','','-6','Y','FSA-LSO','Arroyo Hondomxz','CST','America/Mexico_City'),(52,'MEX','236','','-6','Y','FSA-LSO','Ajalpanuxh','CST','America/Mexico_City'),(52,'MEX','237','','-6','Y','FSA-LSO','San Antonio Texcalapr','CST','America/Mexico_City'),(52,'MEX','238','','-6','Y','FSA-LSO','Tehuacan','CST','America/Mexico_City'),(52,'MEX','241','','-6','Y','FSA-LSO','Apizaco, Tlax.vae','CST','America/Mexico_City'),(52,'MEX','243','','-6','Y','FSA-LSO','Ahuatlanrv','CST','America/Mexico_City'),(52,'MEX','244','','-6','Y','FSA-LSO','Atlixco, Pue.u','CST','America/Mexico_City'),(52,'MEX','245','','-6','Y','FSA-LSO','Atzitzintlam','CST','America/Mexico_City'),(52,'MEX','246','','-6','Y','FSA-LSO','Tlaxcala, Tlax.','CST','America/Mexico_City'),(52,'MEX','247','','-6','Y','FSA-LSO','Huamantlaia','CST','America/Mexico_City'),(52,'MEX','248','','-6','Y','FSA-LSO','San Martin Texmelucan','CST','America/Mexico_City'),(52,'MEX','249','','-6','Y','FSA-LSO','Acatzingo De Hidalgo','CST','America/Mexico_City'),(52,'MEX','271','','-6','Y','FSA-LSO','Cordoba','CST','America/Mexico_City'),(52,'MEX','272','','-6','Y','FSA-LSO','Orizaba, Ver.rb','CST','America/Mexico_City'),(52,'MEX','273','','-6','Y','FSA-LSO','Boca Del Monte','CST','America/Mexico_City'),(52,'MEX','274','','-6','Y','FSA-LSO','Acatlan De Perez Figueroaz','CST','America/Mexico_City'),(52,'MEX','275','','-6','Y','FSA-LSO','Acaxtlahuacan De Albino Zertucheci','CST','America/Mexico_City'),(52,'MEX','276','','-6','Y','FSA-LSO','Atlzayancanxj','CST','America/Mexico_City'),(52,'MEX','278','','-6','Y','FSA-LSO','Capilla, Las','CST','America/Mexico_City'),(52,'MEX','279','','-6','Y','FSA-LSO','Acatlanir','CST','America/Mexico_City'),(52,'MEX','281','','-6','Y','FSA-LSO','Loma Bonitanyn','CST','America/Mexico_City'),(52,'MEX','282','','-6','Y','FSA-LSO','Altos, Losrq','CST','America/Mexico_City'),(52,'MEX','283','','-6','Y','FSA-LSO','Abasolo Del Valle','CST','America/Mexico_City'),(52,'MEX','284','','-6','Y','FSA-LSO','Angel R. Cabadagyt','CST','America/Mexico_City'),(52,'MEX','285','','-6','Y','FSA-LSO','Cocuite, Elnjr','CST','America/Mexico_City'),(52,'MEX','287','','-6','Y','FSA-LSO','Benemerito Juarez Palo Gacho yhy','CST','America/Mexico_City'),(52,'MEX','288','','-6','Y','FSA-LSO','Aculag','CST','America/Mexico_City'),(52,'MEX','294','','-6','Y','FSA-LSO','Catemacosbw','CST','America/Mexico_City'),(52,'MEX','296','','-6','Y','FSA-LSO','Antigua, La','CST','America/Mexico_City'),(52,'MEX','297','','-6','Y','FSA-LSO','Alvarado','CST','America/Mexico_City'),(52,'MEX','311','NAY','-7','Y','FSA-LSO','Tepic, Nay.big','MST','America/Chihuahua'),(52,'MEX','312','','-6','Y','FSA-LSO','Colima, Col.n','CST','America/Mexico_City'),(52,'MEX','313','','-6','Y','FSA-LSO','Augusto Gomez Villanueva Coalatilla','CST','America/Mexico_City'),(52,'MEX','314','','-6','Y','FSA-LSO','Manzanillo, Col.jbq','CST','America/Mexico_City'),(52,'MEX','315','','-6','Y','FSA-LSO','Barra De Navidadbe','CST','America/Mexico_City'),(52,'MEX','316','','-6','Y','FSA-LSO','Ayutlagj','CST','America/Mexico_City'),(52,'MEX','317','','-6','Y','FSA-LSO','Ahuacapanmrk','CST','America/Mexico_City'),(52,'MEX','318','COL','-6','Y','FSA-LSO','QUESERIA','CST','America/Mexico_City'),(52,'MEX','319','NAY','-7','Y','FSA-LSO','Boquita, Lamya','MST','America/Chihuahua'),(52,'MEX','321','','-6','Y','FSA-LSO','Ayuquilaej','CST','America/Mexico_City'),(52,'MEX','322','NAY','-7','Y','FSA-LSO','Puerto Vallarta, Jal.b','MST','America/Chihuahua'),(52,'MEX','323','NAY','-7','Y','FSA-LSO','Amapartd','MST','America/Chihuahua'),(52,'MEX','324','NAY','-7','Y','FSA-LSO','Ahuacatlanbm','MST','America/Chihuahua'),(52,'MEX','325','NAY','-7','Y','FSA-LSO','Acaponetaeyw','MST','America/Chihuahua'),(52,'MEX','326','','-6','Y','FSA-LSO','Atemajac De Brizuela','CST','America/Mexico_City'),(52,'MEX','327','NAY','-7','Y','FSA-LSO','Amado Nervo El Conde','MST','America/Chihuahua'),(52,'MEX','328','','-6','Y','FSA-LSO','Capulin, El','CST','America/Mexico_City'),(52,'MEX','329','NAY','-7','Y','FSA-LSO','Buceriasq','MST','America/Chihuahua'),(52,'MEX','330','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','331','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','332','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','333','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','334','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','335','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','336','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','337','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','338','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','339','','-6','Y','FSA-LSO','Guadalajara, Jal. y Zonas Conurbadastbh','CST','America/Mexico_City'),(52,'MEX','341','','-6','Y','FSA-LSO','Ciudad Guzman','CST','America/Mexico_City'),(52,'MEX','342','','-6','Y','FSA-LSO','Sayulaq','CST','America/Mexico_City'),(52,'MEX','343','','-6','Y','FSA-LSO','Ejutla','CST','America/Mexico_City'),(52,'MEX','344','','-6','Y','FSA-LSO','Huisquilcoq','CST','America/Mexico_City'),(52,'MEX','345','','-6','Y','FSA-LSO','Ayotlankbe','CST','America/Mexico_City'),(52,'MEX','346','','-6','Y','FSA-LSO','Apulco','CST','America/Mexico_City'),(52,'MEX','347','','-6','Y','FSA-LSO','Mirandillasw','CST','America/Mexico_City'),(52,'MEX','348','','-6','Y','FSA-LSO','Allende','CST','America/Mexico_City'),(52,'MEX','349','','-6','Y','FSA-LSO','Atengo','CST','America/Mexico_City'),(52,'MEX','351','','-6','Y','FSA-LSO','Zamora, Mich.','CST','America/Mexico_City'),(52,'MEX','352','','-6','Y','FSA-LSO','La Piedad, Mich.bt','CST','America/Mexico_City'),(52,'MEX','353','','-6','Y','FSA-LSO','Sahuayo, Mich.','CST','America/Mexico_City'),(52,'MEX','354','','-6','Y','FSA-LSO','Atapanw','CST','America/Mexico_City'),(52,'MEX','355','','-6','Y','FSA-LSO','Carapanipw','CST','America/Mexico_City'),(52,'MEX','356','','-6','Y','FSA-LSO','Charcos, Losa','CST','America/Mexico_City'),(52,'MEX','357','','-6','Y','FSA-LSO','Arado, Locx','CST','America/Mexico_City'),(52,'MEX','358','','-6','Y','FSA-LSO','Garita, Lapb','CST','America/Mexico_City'),(52,'MEX','359','','-6','Y','FSA-LSO','Guandarok','CST','America/Mexico_City'),(52,'MEX','371','','-6','Y','FSA-LSO','Atenquiquex','CST','America/Mexico_City'),(52,'MEX','372','','-6','Y','FSA-LSO','Amacueca','CST','America/Mexico_City'),(52,'MEX','373','','-6','Y','FSA-LSO','Caqada De Las Floresf','CST','America/Mexico_City'),(52,'MEX','374','','-6','Y','FSA-LSO','Amatitanmte','CST','America/Mexico_City'),(52,'MEX','375','','-6','Y','FSA-LSO','Amecak','CST','America/Mexico_City'),(52,'MEX','376','','-6','Y','FSA-LSO','Ajijiccc','CST','America/Mexico_City'),(52,'MEX','377','','-6','Y','FSA-LSO','Coculav','CST','America/Mexico_City'),(52,'MEX','378','','-6','Y','FSA-LSO','Tepatitlan, Jal.a','CST','America/Mexico_City'),(52,'MEX','379','MICH','-6','Y','FSA-LSO','NUMARAN','CST','America/Mexico_City'),(52,'MEX','381','','-6','Y','FSA-LSO','Cojumatlan De Reguleshuj','CST','America/Mexico_City'),(52,'MEX','382','','-6','Y','FSA-LSO','Mazamitla','CST','America/Mexico_City'),(52,'MEX','383','','-6','Y','FSA-LSO','Chavindaiq','CST','America/Mexico_City'),(52,'MEX','384','','-6','Y','FSA-LSO','Ahuisculco','CST','America/Mexico_City'),(52,'MEX','385','','-6','Y','FSA-LSO','Buenavista','CST','America/Mexico_City'),(52,'MEX','386','','-6','Y','FSA-LSO','Ahualulco De Mercadoryd','CST','America/Mexico_City'),(52,'MEX','387','','-6','Y','FSA-LSO','Acatlan De Juarezgr','CST','America/Mexico_City'),(52,'MEX','388','','-6','Y','FSA-LSO','Atenguillo','CST','America/Mexico_City'),(52,'MEX','389','NAY','-7','Y','FSA-LSO','Milpas Viejasze','MST','America/Chihuahua'),(52,'MEX','391','','-6','Y','FSA-LSO','Atotonilco El Altoak','CST','America/Mexico_City'),(52,'MEX','392','','-6','Y','FSA-LSO','Ocotlan','CST','America/Mexico_City'),(52,'MEX','393','','-6','Y','FSA-LSO','Barca, Lamu','CST','America/Mexico_City'),(52,'MEX','394','','-6','Y','FSA-LSO','Barrio, Elmz','CST','America/Mexico_City'),(52,'MEX','395','','-6','Y','FSA-LSO','San Diego De Alejandriae','CST','America/Mexico_City'),(52,'MEX','411','','-6','Y','FSA-LSO','Calera, La El Canario','CST','America/Mexico_City'),(52,'MEX','412','','-6','Y','FSA-LSO','Comonfortk','CST','America/Mexico_City'),(52,'MEX','413','','-6','Y','FSA-LSO','Apaseo El Alto','CST','America/Mexico_City'),(52,'MEX','414','','-6','Y','FSA-LSO','Fuente, Laepi','CST','America/Mexico_City'),(52,'MEX','415','','-6','Y','FSA-LSO','San Miguel de Allende, Gto.y','CST','America/Mexico_City'),(52,'MEX','417','','-6','Y','FSA-LSO','Acambarowyq','CST','America/Mexico_City'),(52,'MEX','418','','-6','Y','FSA-LSO','Adjuntas Del Rio  Las Adjuntas aqe','CST','America/Mexico_City'),(52,'MEX','419','','-6','Y','FSA-LSO','Ajuchitlandec','CST','America/Mexico_City'),(52,'MEX','421','','-6','Y','FSA-LSO','Coroneor','CST','America/Mexico_City'),(52,'MEX','422','','-6','Y','FSA-LSO','Ario De Rosales','CST','America/Mexico_City'),(52,'MEX','423','','-6','Y','FSA-LSO','Ahuirany','CST','America/Mexico_City'),(52,'MEX','424','','-6','Y','FSA-LSO','Bonifacio Moreno  El Aguaje','CST','America/Mexico_City'),(52,'MEX','425','','-6','Y','FSA-LSO','Antunez  Morelos','CST','America/Mexico_City'),(52,'MEX','426','','-6','Y','FSA-LSO','Aguilillaisx','CST','America/Mexico_City'),(52,'MEX','427','','-6','Y','FSA-LSO','Polotitlan','CST','America/Mexico_City'),(52,'MEX','428','','-6','Y','FSA-LSO','Carreton, Elnxf','CST','America/Mexico_City'),(52,'MEX','429','','-6','Y','FSA-LSO','Abasoloazi','CST','America/Mexico_City'),(52,'MEX','431','','-6','Y','FSA-LSO','Caqadas De Obregonc','CST','America/Mexico_City'),(52,'MEX','432','','-6','Y','FSA-LSO','Calzada De La Merced, Lawxm','CST','America/Mexico_City'),(52,'MEX','433','','-6','Y','FSA-LSO','Benito Juarezrun','CST','America/Mexico_City'),(52,'MEX','434','','-6','Y','FSA-LSO','Acuitzio Del Canje','CST','America/Mexico_City'),(52,'MEX','435','','-6','Y','FSA-LSO','Angao  Angao De Los Herrera','CST','America/Mexico_City'),(52,'MEX','436','','-6','Y','FSA-LSO','Cantabriaz','CST','America/Mexico_City'),(52,'MEX','437','','-6','Y','FSA-LSO','Atolinga','CST','America/Mexico_City'),(52,'MEX','438','','-6','Y','FSA-LSO','Barranca, Layq','CST','America/Mexico_City'),(52,'MEX','441','','-6','Y','FSA-LSO','Agua Zarcac','CST','America/Mexico_City'),(52,'MEX','442','','-6','Y','FSA-LSO','Queretaro','CST','America/Mexico_City'),(52,'MEX','443','','-6','Y','FSA-LSO','Morelia, Mich.q','CST','America/Mexico_City'),(52,'MEX','444','','-6','Y','FSA-LSO','San Luis Potosi','CST','America/Mexico_City'),(52,'MEX','445','','-6','Y','FSA-LSO','Moroleon','CST','America/Mexico_City'),(52,'MEX','447','','-6','Y','FSA-LSO','Apeopwp','CST','America/Mexico_City'),(52,'MEX','448','','-6','Y','FSA-LSO','Amealcoz','CST','America/Mexico_City'),(52,'MEX','449','','-6','Y','FSA-LSO','Aguascalientes, Ags.n','CST','America/Mexico_City'),(52,'MEX','451','','-6','Y','FSA-LSO','Araron','CST','America/Mexico_City'),(52,'MEX','452','','-6','Y','FSA-LSO','Uruapan, Mich.d','CST','America/Mexico_City'),(52,'MEX','453','','-6','Y','FSA-LSO','Apatzingan De La Constitucione','CST','America/Mexico_City'),(52,'MEX','454','','-6','Y','FSA-LSO','Agua Caliente  Ojo De Agua','CST','America/Mexico_City'),(52,'MEX','455','','-6','Y','FSA-LSO','Alvaro Obregonjrb','CST','America/Mexico_City'),(52,'MEX','456','','-6','Y','FSA-LSO','Cerro Colorado','CST','America/Mexico_City'),(52,'MEX','457','','-6','Y','FSA-LSO','Chalchihuites','CST','America/Mexico_City'),(52,'MEX','458','','-6','Y','FSA-LSO','Barril, El','CST','America/Mexico_City'),(52,'MEX','459','','-6','Y','FSA-LSO','Caracuaro De Morelos','CST','America/Mexico_City'),(52,'MEX','461','','-6','Y','FSA-LSO','Celaya, Gto.xad','CST','America/Mexico_City'),(52,'MEX','462','','-6','Y','FSA-LSO','Irapuato, Gto.hhm','CST','America/Mexico_City'),(52,'MEX','463','','-6','Y','FSA-LSO','Huanuscoub','CST','America/Mexico_City'),(52,'MEX','464','','-6','Y','FSA-LSO','Salamanca, Gto.ur','CST','America/Mexico_City'),(52,'MEX','465','','-6','Y','FSA-LSO','Carbonerasz','CST','America/Mexico_City'),(52,'MEX','466','','-6','Y','FSA-LSO','Cupareoyu','CST','America/Mexico_City'),(52,'MEX','467','','-6','Y','FSA-LSO','Apozold','CST','America/Mexico_City'),(52,'MEX','468','','-6','Y','FSA-LSO','Covadongathp','CST','America/Mexico_City'),(52,'MEX','469','','-6','Y','FSA-LSO','Atarjea, Lawmc','CST','America/Mexico_City'),(52,'MEX','471','','-6','Y','FSA-LSO','Acuitzeramow','CST','America/Mexico_City'),(52,'MEX','472','','-6','Y','FSA-LSO','Aguas Buenast','CST','America/Mexico_City'),(52,'MEX','473','','-6','Y','FSA-LSO','Guanajuato, Gto.u','CST','America/Mexico_City'),(52,'MEX','474','','-6','Y','FSA-LSO','Lagos de Moreno, Jal.n','CST','America/Mexico_City'),(52,'MEX','475','','-6','Y','FSA-LSO','Bajio De San Josegs','CST','America/Mexico_City'),(52,'MEX','476','','-6','Y','FSA-LSO','Caqada De Negrosmzx','CST','America/Mexico_City'),(52,'MEX','477','','-6','Y','FSA-LSO','Leon','CST','America/Mexico_City'),(52,'MEX','478','','-6','Y','FSA-LSO','General Enrique Estrada','CST','America/Mexico_City'),(52,'MEX','479','','-6','Y','FSA-LSO','Leon','CST','America/Mexico_City'),(52,'MEX','481','','-6','Y','FSA-LSO','Ciudad Valles, S.L.P.jn','CST','America/Mexico_City'),(52,'MEX','482','','-6','Y','FSA-LSO','Agua Buenar','CST','America/Mexico_City'),(52,'MEX','483','','-6','Y','FSA-LSO','Chalchocoyoqi','CST','America/Mexico_City'),(52,'MEX','485','','-6','Y','FSA-LSO','Bledosejg','CST','America/Mexico_City'),(52,'MEX','486','','-6','Y','FSA-LSO','Armadillo De Los Infanteh','CST','America/Mexico_City'),(52,'MEX','487','','-6','Y','FSA-LSO','Arroyo Secomw','CST','America/Mexico_City'),(52,'MEX','488','','-6','Y','FSA-LSO','Cedral','CST','America/Mexico_City'),(52,'MEX','489','','-6','Y','FSA-LSO','Ahuacatlanchi','CST','America/Mexico_City'),(52,'MEX','492','','-6','Y','FSA-LSO','Zacatecas, Zac.yk','CST','America/Mexico_City'),(52,'MEX','493','','-6','Y','FSA-LSO','Fresnillo, Zac.','CST','America/Mexico_City'),(52,'MEX','494','','-6','Y','FSA-LSO','Cargadero, Elcr','CST','America/Mexico_City'),(52,'MEX','495','','-6','Y','FSA-LSO','Calvillo','CST','America/Mexico_City'),(52,'MEX','496','','-6','Y','FSA-LSO','Amarillas De Esparza  Amarillas p','CST','America/Mexico_City'),(52,'MEX','498','','-6','Y','FSA-LSO','Boquilla De Arriba','CST','America/Mexico_City'),(52,'MEX','499','','-6','Y','FSA-LSO','Atitanacdp','CST','America/Mexico_City'),(52,'MEX','550','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','551','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','552','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','553','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','554','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','555','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','556','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','557','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','558','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','559','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','560','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','561','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','562','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','563','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','564','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','565','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','566','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','567','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','568','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','569','','-6','Y','FSA-LSO','Ciudad de Mexico, D.F.','CST','America/Mexico_City'),(52,'MEX','586','MEX','-6','Y','FSA-LSO','TLALMANALCO','CST','America/Mexico_City'),(52,'MEX','587','MEX','-6','Y','FSA-LSO','AMECAMECA','CST','America/Mexico_City'),(52,'MEX','588','','-6','Y','FSA-LSO','Arana, Los','CST','America/Mexico_City'),(52,'MEX','589','MEX','-6','Y','FSA-LSO','JUCHITEPEC','CST','America/Mexico_City'),(52,'MEX','591','','-6','Y','FSA-LSO','Praderas Del Potrero','CST','America/Mexico_City'),(52,'MEX','592','','-6','Y','FSA-LSO','Jaltepec','CST','America/Mexico_City'),(52,'MEX','593','','-6','Y','FSA-LSO','Coyotepec','CST','America/Mexico_City'),(52,'MEX','594','','-6','Y','FSA-LSO','San Marcos Nepantla, Mex.khq','CST','America/Mexico_City'),(52,'MEX','595','','-6','Y','FSA-LSO','Texcoco, Mex.edd','CST','America/Mexico_City'),(52,'MEX','596','','-6','Y','FSA-LSO','Reyes Acozac, Losr','CST','America/Mexico_City'),(52,'MEX','597','','-6','Y','FSA-LSO','Amecameca De Juarezkp','CST','America/Mexico_City'),(52,'MEX','599','','-6','Y','FSA-LSO','Apaxco De Ocampoun','CST','America/Mexico_City'),(52,'MEX','612','BCS','-7','Y','FSA-LSO','La Paz, B.C.S.fj','MST','America/Chihuahua'),(52,'MEX','613','BCS','-7','Y','FSA-LSO','Ciudad Constituciona','MST','America/Chihuahua'),(52,'MEX','614','CHIH','-7','Y','FSA-LSO','Chihuahua, Chih.ns','MST','America/Chihuahua'),(52,'MEX','615','BCS','-7','Y','FSA-LSO','Bahia Asuncionnu','MST','America/Chihuahua'),(52,'MEX','616','BC','-8','Y','FSA-LSO','Camalun','PST','America/Tijuana'),(52,'MEX','618','','-6','Y','FSA-LSO','Durango, Dgo.tkn','CST','America/Mexico_City'),(52,'MEX','621','CHIH','-7','Y','FSA-LSO','Julimese','MST','America/Chihuahua'),(52,'MEX','622','SON','-7','N','','Guaymas, Son.yw','MST','America/Hermosillo'),(52,'MEX','623','SON','-7','N','','Aconchi','MST','America/Hermosillo'),(52,'MEX','624','BCS','-7','Y','FSA-LSO','San Jose del Cabo','MST','America/Chihuahua'),(52,'MEX','625','CHIH','-7','Y','FSA-LSO','Ciudad Cuauhtemoc','MST','America/Chihuahua'),(52,'MEX','626','CHIH','-7','Y','FSA-LSO','Manuel Benavidesu','MST','America/Chihuahua'),(52,'MEX','627','CHIH','-7','Y','FSA-LSO','Parral, Chih.','MST','America/Chihuahua'),(52,'MEX','628','CHIH','-7','Y','FSA-LSO','Mariano Matamorosgjt','MST','America/Chihuahua'),(52,'MEX','629','CHIH','-7','Y','FSA-LSO','Ceballoskp','MST','America/Chihuahua'),(52,'MEX','631','SON','-7','N','','Nogales, Son.','MST','America/Hermosillo'),(52,'MEX','632','SON','-7','N','','Imurisb','MST','America/Hermosillo'),(52,'MEX','633','SON','-7','N','','Agua Prietag','MST','America/Hermosillo'),(52,'MEX','634','SON','-7','N','','Abanico, Elt','MST','America/Hermosillo'),(52,'MEX','635','CHIH','-7','Y','FSA-LSO','Areponapuchim','MST','America/Chihuahua'),(52,'MEX','636','CHIH','-7','Y','FSA-LSO','Ascensionb','MST','America/Chihuahua'),(52,'MEX','637','SON','-7','N','','Altar','MST','America/Hermosillo'),(52,'MEX','638','SON','-7','N','','Choya, Latp','MST','America/Hermosillo'),(52,'MEX','639','CHIH','-7','Y','FSA-LSO','Ciudad Delicias, Chih.mfj','MST','America/Chihuahua'),(52,'MEX','641','SON','-7','N','','Benjamin Hillnde','MST','America/Hermosillo'),(52,'MEX','642','SON','-7','N','','Navojoa, Son.ir','MST','America/Hermosillo'),(52,'MEX','643','SON','-7','N','','Agua Blancawmi','MST','America/Hermosillo'),(52,'MEX','644','SON','-7','N','','Ciudad Obregon','MST','America/Hermosillo'),(52,'MEX','645','SON','-7','N','','Bacoachimcj','MST','America/Hermosillo'),(52,'MEX','646','BC','-8','Y','FSA-LSO','Ensenada, B.C.tt','PST','America/Tijuana'),(52,'MEX','647','SON','-7','N','','Alamosk','MST','America/Hermosillo'),(52,'MEX','648','CHIH','-7','Y','FSA-LSO','Boquilla De Babisas  La Boquilla De Conchos','MST','America/Chihuahua'),(52,'MEX','649','CHIH','-7','Y','FSA-LSO','Baborigame','MST','America/Chihuahua'),(52,'MEX','651','SON','-7','N','','Sonoitakhk','MST','America/Hermosillo'),(52,'MEX','652','CHIH','-7','Y','FSA-LSO','Largo, El','MST','America/Chihuahua'),(52,'MEX','653','SON','-7','N','','San Luis Rio Colorado','MST','America/Hermosillo'),(52,'MEX','656','CHIH','-7','Y','FSA-LSO','Ciudad Juarez','MST','America/Chihuahua'),(52,'MEX','658','BC','-8','Y','FSA-LSO','Ciudad Morelos  Cuervos t','PST','America/Tijuana'),(52,'MEX','659','CHIH','-7','Y','FSA-LSO','Abraham Gonzalez','MST','America/Chihuahua'),(52,'MEX','661','BC','-8','Y','FSA-LSO','Playas De Rosarito','PST','America/Tijuana'),(52,'MEX','662','SON','-7','N','','Hermosillo, Son.vkv','MST','America/Hermosillo'),(52,'MEX','663','BC','-8','Y','FSA-LSO','Tijuana, B.C.j','PST','America/Tijuana'),(52,'MEX','664','BC','-8','Y','FSA-LSO','Tijuana, B.C.j','PST','America/Tijuana'),(52,'MEX','665','BC','-8','Y','FSA-LSO','Tecatese','PST','America/Tijuana'),(52,'MEX','666','BC','-8','Y','FSA-LSO','Tijuana, B.C.j','PST','America/Tijuana'),(52,'MEX','667','SIN','-7','Y','FSA-LSO','Culiacan','MST','America/Chihuahua'),(52,'MEX','668','SIN','-7','Y','FSA-LSO','Los Mochis, Sin.qx','MST','America/Chihuahua'),(52,'MEX','669','SIN','-7','Y','FSA-LSO','Mazatlan','MST','America/Chihuahua'),(52,'MEX','671','','-6','Y','FSA-LSO','Cuencame De Ceniceros  Cuencame ah','CST','America/Mexico_City'),(52,'MEX','672','SIN','-7','Y','FSA-LSO','Altatajm','MST','America/Chihuahua'),(52,'MEX','673','SIN','-7','Y','FSA-LSO','Benito Juareznv','MST','America/Chihuahua'),(52,'MEX','674','','-6','Y','FSA-LSO','Canelas','CST','America/Mexico_City'),(52,'MEX','675','','-6','Y','FSA-LSO','Cieneguilla','CST','America/Mexico_City'),(52,'MEX','676','','-6','Y','FSA-LSO','Antonio Amaro  Saucillo hmj','CST','America/Mexico_City'),(52,'MEX','677','','-6','Y','FSA-LSO','Abasolomvd','CST','America/Mexico_City'),(52,'MEX','686','BC','-8','Y','FSA-LSO','Mexicali, B.C.','PST','America/Tijuana'),(52,'MEX','687','SIN','-7','Y','FSA-LSO','Adolfo Ruiz Cortinesqj','MST','America/Chihuahua'),(52,'MEX','694','SIN','-7','Y','FSA-LSO','Agua Caliente De Garate  Agua Caliente k','MST','America/Chihuahua'),(52,'MEX','695','SIN','-7','Y','FSA-LSO','Concha, La  La Concepcion w','MST','America/Chihuahua'),(52,'MEX','696','SIN','-7','Y','FSA-LSO','Bolillo, Elg','MST','America/Chihuahua'),(52,'MEX','697','SIN','-7','Y','FSA-LSO','Angosturay','MST','America/Chihuahua'),(52,'MEX','698','SIN','-7','Y','FSA-LSO','Adolfo Lopez Mateos  Jahuara Segundo wfp','MST','America/Chihuahua'),(52,'MEX','711','','-6','Y','FSA-LSO','Oro De Hidalgo, Elh','CST','America/Mexico_City'),(52,'MEX','712','','-6','Y','FSA-LSO','Atlacomulco De Fabelahwk','CST','America/Mexico_City'),(52,'MEX','713','','-6','Y','FSA-LSO','San Nicolas Tlazalah','CST','America/Mexico_City'),(52,'MEX','714','','-6','Y','FSA-LSO','Chalma','CST','America/Mexico_City'),(52,'MEX','715','','-6','Y','FSA-LSO','Heroica Zitacuaro','CST','America/Mexico_City'),(52,'MEX','716','','-6','Y','FSA-LSO','Almoloya De Alquisiraswn','CST','America/Mexico_City'),(52,'MEX','717','','-6','Y','FSA-LSO','Atlatlahucaffe','CST','America/Mexico_City'),(52,'MEX','718','','-6','Y','FSA-LSO','Acambay','CST','America/Mexico_City'),(52,'MEX','719','','-6','Y','FSA-LSO','Emiliano Zapata  Colonia Emiliano Zapata zv','CST','America/Mexico_City'),(52,'MEX','721','','-6','Y','FSA-LSO','Ixtapan De La Salar','CST','America/Mexico_City'),(52,'MEX','722','','-6','Y','FSA-LSO','Toluca, Mex.vg','CST','America/Mexico_City'),(52,'MEX','723','','-6','Y','FSA-LSO','Chiltepec  Chiltepec De Hidalgo q','CST','America/Mexico_City'),(52,'MEX','724','','-6','Y','FSA-LSO','Almoloya De Las Granadasy','CST','America/Mexico_City'),(52,'MEX','725','','-6','Y','FSA-LSO','Cieneguillas De Guadalupeur','CST','America/Mexico_City'),(52,'MEX','726','','-6','Y','FSA-LSO','Amanalco De Becerra','CST','America/Mexico_City'),(52,'MEX','727','','-6','Y','FSA-LSO','Atenango Del Riobwn','CST','America/Mexico_City'),(52,'MEX','728','','-6','Y','FSA-LSO','Lerma, Mex.puy','CST','America/Mexico_City'),(52,'MEX','729','','-6','Y','FSA-LSO','Toluca, Mex.vg','CST','America/Mexico_City'),(52,'MEX','731','','-6','Y','FSA-LSO','Amayucaj','CST','America/Mexico_City'),(52,'MEX','732','','-6','Y','FSA-LSO','Ajuchitlan Del Progresowq','CST','America/Mexico_City'),(52,'MEX','733','','-6','Y','FSA-LSO','Mayanalan','CST','America/Mexico_City'),(52,'MEX','734','','-6','Y','FSA-LSO','Zacatepec, Mor.j','CST','America/Mexico_City'),(52,'MEX','735','','-6','Y','FSA-LSO','Cuautla, Mor.aum','CST','America/Mexico_City'),(52,'MEX','736','','-6','Y','FSA-LSO','Acapetlahuayazu','CST','America/Mexico_City'),(52,'MEX','737','','-6','Y','FSA-LSO','Coatetelcodbf','CST','America/Mexico_City'),(52,'MEX','738','','-6','Y','FSA-LSO','Alfajayucan','CST','America/Mexico_City'),(52,'MEX','739','','-6','Y','FSA-LSO','Amatlan De Quetzalcoatl','CST','America/Mexico_City'),(52,'MEX','741','','-6','Y','FSA-LSO','Acatepecvc','CST','America/Mexico_City'),(52,'MEX','742','','-6','Y','FSA-LSO','Atoyac De Alvarezr','CST','America/Mexico_City'),(52,'MEX','743','','-6','Y','FSA-LSO','Acayucasj','CST','America/Mexico_City'),(52,'MEX','744','','-6','Y','FSA-LSO','Acapulco, Gro.g','CST','America/Mexico_City'),(52,'MEX','745','','-6','Y','FSA-LSO','Ayutla De Los Libresj','CST','America/Mexico_City'),(52,'MEX','746','','-6','Y','FSA-LSO','Benito Juarezgha','CST','America/Mexico_City'),(52,'MEX','747','','-6','Y','FSA-LSO','Chilpancingo, Gro.tp','CST','America/Mexico_City'),(52,'MEX','748','','-6','Y','FSA-LSO','Almoloyag','CST','America/Mexico_City'),(52,'MEX','749','','-6','Y','FSA-LSO','Calpulalpanp','CST','America/Mexico_City'),(52,'MEX','751','','-6','Y','FSA-LSO','Ahuehuetzingoae','CST','America/Mexico_City'),(52,'MEX','752','MOR','-6','Y','FSA-LSO','ATLATLAHUCAN','CST','America/Mexico_City'),(52,'MEX','753','','-6','Y','FSA-LSO','Ciudad Lazaro Cardenas','CST','America/Mexico_City'),(52,'MEX','754','','-6','Y','FSA-LSO','Apangoyy','CST','America/Mexico_City'),(52,'MEX','755','','-6','Y','FSA-LSO','Zihuatanejo, Gro.','CST','America/Mexico_City'),(52,'MEX','756','','-6','Y','FSA-LSO','Ahuacuotzingou','CST','America/Mexico_City'),(52,'MEX','757','','-6','Y','FSA-LSO','Alcozauca De Guerreroswf','CST','America/Mexico_City'),(52,'MEX','758','','-6','Y','FSA-LSO','Mesas, Lasuu','CST','America/Mexico_City'),(52,'MEX','759','','-6','Y','FSA-LSO','Alberto, Elgi','CST','America/Mexico_City'),(52,'MEX','761','','-6','Y','FSA-LSO','Bellavista Del Riokke','CST','America/Mexico_City'),(52,'MEX','762','','-6','Y','FSA-LSO','Acamixtla','CST','America/Mexico_City'),(52,'MEX','763','','-6','Y','FSA-LSO','Chapantongoqbn','CST','America/Mexico_City'),(52,'MEX','764','','-6','Y','FSA-LSO','Nuevo Necaxaaze','CST','America/Mexico_City'),(52,'MEX','765','','-6','Y','FSA-LSO','Alamosc','CST','America/Mexico_City'),(52,'MEX','766','','-6','Y','FSA-LSO','Gutierrez Zamora','CST','America/Mexico_City'),(52,'MEX','767','','-6','Y','FSA-LSO','Amuco De La Reformangv','CST','America/Mexico_City'),(52,'MEX','768','','-6','Y','FSA-LSO','Amatlanctj','CST','America/Mexico_City'),(52,'MEX','769','','-6','Y','FSA-LSO','Axochiapan','CST','America/Mexico_City'),(52,'MEX','771','','-6','Y','FSA-LSO','Pachuca, Hgo.p','CST','America/Mexico_City'),(52,'MEX','772','','-6','Y','FSA-LSO','Actopan','CST','America/Mexico_City'),(52,'MEX','773','','-6','Y','FSA-LSO','Tepeji del Rio, Hgo.','CST','America/Mexico_City'),(52,'MEX','774','','-6','Y','FSA-LSO','Agua Blanca Iturbide','CST','America/Mexico_City'),(52,'MEX','775','','-6','Y','FSA-LSO','Singuilucan, Hgo.m','CST','America/Mexico_City'),(52,'MEX','776','','-6','Y','FSA-LSO','Acaxochitlanr','CST','America/Mexico_City'),(52,'MEX','777','','-6','Y','FSA-LSO','Cuernavaca, Mor.uq','CST','America/Mexico_City'),(52,'MEX','778','','-6','Y','FSA-LSO','Ajacuba','CST','America/Mexico_City'),(52,'MEX','779','','-6','Y','FSA-LSO','Plazas, Laswu','CST','America/Mexico_City'),(52,'MEX','781','','-6','Y','FSA-LSO','Bajos Del Ejidovzi','CST','America/Mexico_City'),(52,'MEX','782','','-6','Y','FSA-LSO','Poza Rica, Ver.','CST','America/Mexico_City'),(52,'MEX','783','','-6','Y','FSA-LSO','Tuxpan, Ver.','CST','America/Mexico_City'),(52,'MEX','784','','-6','Y','FSA-LSO','Adolfo Ruiz Cortinesvha','CST','America/Mexico_City'),(52,'MEX','785','','-6','Y','FSA-LSO','Cerro Azulsc','CST','America/Mexico_City'),(52,'MEX','786','','-6','Y','FSA-LSO','Agostitlanzrp','CST','America/Mexico_City'),(52,'MEX','789','','-6','Y','FSA-LSO','Atlapexcouk','CST','America/Mexico_City'),(52,'MEX','791','','-6','Y','FSA-LSO','Cides, Losfyu','CST','America/Mexico_City'),(52,'MEX','797','','-6','Y','FSA-LSO','Ahuacatlan','CST','America/Mexico_City'),(52,'MEX','810','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','811','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','812','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','813','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','814','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','815','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','816','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','817','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','818','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','819','','-6','Y','FSA-LSO','Monterrey, N.L. y Zonas Conurbadas','CST','America/Mexico_City'),(52,'MEX','821','','-6','Y','FSA-LSO','Guadalupe  Hacienda De Guadalupe, La ywx','CST','America/Mexico_City'),(52,'MEX','823','','-6','Y','FSA-LSO','Chinaen','CST','America/Mexico_City'),(52,'MEX','824','','-6','Y','FSA-LSO','Ciudad Sabinas Hidalgohp','CST','America/Mexico_City'),(52,'MEX','825','','-6','Y','FSA-LSO','Cienega De Florespqs','CST','America/Mexico_City'),(52,'MEX','826','','-6','Y','FSA-LSO','Aramberri','CST','America/Mexico_City'),(52,'MEX','827','MON','-6','Y','FSA-LSO','SANTIAGO, EL CERCADO','CST','America/Mexico_City'),(52,'MEX','828','','-6','Y','FSA-LSO','Barranquito, Elq','CST','America/Mexico_City'),(52,'MEX','829','','-6','Y','FSA-LSO','Bustamantes','CST','America/Mexico_City'),(52,'MEX','831','','-6','Y','FSA-LSO','Ciudad Mante, Tamps.q','CST','America/Mexico_City'),(52,'MEX','832','','-6','Y','FSA-LSO','Adolfo Lopez Mateos  Chamal Nuevo','CST','America/Mexico_City'),(52,'MEX','833','','-6','Y','FSA-LSO','Tampico, Tamps.n','CST','America/Mexico_City'),(52,'MEX','834','','-6','Y','FSA-LSO','Ciudad Victoria, Tamps.','CST','America/Mexico_City'),(52,'MEX','835','','-6','Y','FSA-LSO','Abasology','CST','America/Mexico_City'),(52,'MEX','836','','-6','Y','FSA-LSO','Aldamah','CST','America/Mexico_City'),(52,'MEX','841','','-6','Y','FSA-LSO','Burgosaue','CST','America/Mexico_City'),(52,'MEX','842','','-6','Y','FSA-LSO','Concepcion Del Oror','CST','America/Mexico_City'),(52,'MEX','844','','-6','Y','FSA-LSO','Saltillo, Coah.p','CST','America/Mexico_City'),(52,'MEX','845','','-6','Y','FSA-LSO','Ebanopf','CST','America/Mexico_City'),(52,'MEX','846','','-6','Y','FSA-LSO','Chijol 17ry','CST','America/Mexico_City'),(52,'MEX','861','','-6','Y','FSA-LSO','Sabinas, Coah.j','CST','America/Mexico_City'),(52,'MEX','862','','-6','Y','FSA-LSO','Allendeby','CST','America/Mexico_City'),(52,'MEX','864','','-6','Y','FSA-LSO','Ciudad Melchor Muzquiztzc','CST','America/Mexico_City'),(52,'MEX','866','','-6','Y','FSA-LSO','Monclova, Coah.','CST','America/Mexico_City'),(52,'MEX','867','','-6','Y','FSA-LSO','Nuevo Laredo, Tamps.ef','CST','America/Mexico_City'),(52,'MEX','868','','-6','Y','FSA-LSO','Matamoros, Tamps.yjv','CST','America/Mexico_City'),(52,'MEX','869','','-6','Y','FSA-LSO','Cuatrocienegas De Carranzaabw','CST','America/Mexico_City'),(52,'MEX','871','','-6','Y','FSA-LSO','Torreon','CST','America/Mexico_City'),(52,'MEX','872','','-6','Y','FSA-LSO','Bermejillo','CST','America/Mexico_City'),(52,'MEX','873','','-6','Y','FSA-LSO','Anahuacrvg','CST','America/Mexico_City'),(52,'MEX','877','','-6','Y','FSA-LSO','Ciudad Acuqaepb','CST','America/Mexico_City'),(52,'MEX','878','','-6','Y','FSA-LSO','Jimenez','CST','America/Mexico_City'),(52,'MEX','891','','-6','Y','FSA-LSO','Ciudad Camargo','CST','America/Mexico_City'),(52,'MEX','892','','-6','Y','FSA-LSO','Agualeguasmg','CST','America/Mexico_City'),(52,'MEX','894','','-6','Y','FSA-LSO','Anahuacsr','CST','America/Mexico_City'),(52,'MEX','897','','-6','Y','FSA-LSO','Arcabuzsmf','CST','America/Mexico_City'),(52,'MEX','899','','-6','Y','FSA-LSO','Reynosa, Tamps.','CST','America/Mexico_City'),(52,'MEX','913','','-6','Y','FSA-LSO','Cuauhtemocg','CST','America/Mexico_City'),(52,'MEX','914','','-6','Y','FSA-LSO','Ayapaqi','CST','America/Mexico_City'),(52,'MEX','916','','-6','Y','FSA-LSO','Catazajatkr','CST','America/Mexico_City'),(52,'MEX','917','','-6','Y','FSA-LSO','Chontalpa  Estacion Chontalpa s','CST','America/Mexico_City'),(52,'MEX','918','','-6','Y','FSA-LSO','Acacoyagua','CST','America/Mexico_City'),(52,'MEX','919','','-6','Y','FSA-LSO','Altamirano','CST','America/Mexico_City'),(52,'MEX','921','','-6','Y','FSA-LSO','Coatzacoalcos, Ver.wer','CST','America/Mexico_City'),(52,'MEX','922','','-6','Y','FSA-LSO','Chinameca, Ver.ewa','CST','America/Mexico_City'),(52,'MEX','923','','-6','Y','FSA-LSO','Agua Dulcen','CST','America/Mexico_City'),(52,'MEX','924','','-6','Y','FSA-LSO','24 De Febrerow','CST','America/Mexico_City'),(52,'MEX','932','','-6','Y','FSA-LSO','Ixtacomitanrid','CST','America/Mexico_City'),(52,'MEX','933','','-6','Y','FSA-LSO','Carlos Greene 1 Ra. Secciongep','CST','America/Mexico_City'),(52,'MEX','934','','-6','Y','FSA-LSO','Arena De Hidalgoe','CST','America/Mexico_City'),(52,'MEX','936','','-6','Y','FSA-LSO','Benito Juarez  San Carlos cfp','CST','America/Mexico_City'),(52,'MEX','937','','-6','Y','FSA-LSO','Cardenas','CST','America/Mexico_City'),(52,'MEX','938','','-6','Y','FSA-LSO','Ciudad del Carmen, Camp.','CST','America/Mexico_City'),(52,'MEX','951','','-6','Y','FSA-LSO','Oaxaca, Oax.p','CST','America/Mexico_City'),(52,'MEX','953','','-6','Y','FSA-LSO','Acatlan De Osoriotsb','CST','America/Mexico_City'),(52,'MEX','954','','-6','Y','FSA-LSO','Bajos De Chilad','CST','America/Mexico_City'),(52,'MEX','958','','-6','Y','FSA-LSO','Candelaria Loxichab','CST','America/Mexico_City'),(52,'MEX','961','','-6','Y','FSA-LSO','Tuxtla Gutierrez','CST','America/Mexico_City'),(52,'MEX','962','','-6','Y','FSA-LSO','Tapachula, Chis.uid','CST','America/Mexico_City'),(52,'MEX','963','','-6','Y','FSA-LSO','Chicomuselopj','CST','America/Mexico_City'),(52,'MEX','964','','-6','Y','FSA-LSO','Buenos Airesuwv','CST','America/Mexico_City'),(52,'MEX','965','','-6','Y','FSA-LSO','Cristobal Obregonhd','CST','America/Mexico_City'),(52,'MEX','966','','-6','Y','FSA-LSO','Arriagaeiy','CST','America/Mexico_City'),(52,'MEX','967','','-6','Y','FSA-LSO','Candelaria, Laq','CST','America/Mexico_City'),(52,'MEX','968','','-6','Y','FSA-LSO','Cintalapa De Figueroack','CST','America/Mexico_City'),(52,'MEX','969','','-6','Y','FSA-LSO','Campestre Flamboyanesref','CST','America/Mexico_City'),(52,'MEX','971','','-6','Y','FSA-LSO','Ixtepec, Oax.f','CST','America/Mexico_City'),(52,'MEX','972','','-6','Y','FSA-LSO','Barrio De La Soledad, El','CST','America/Mexico_City'),(52,'MEX','981','','-6','Y','FSA-LSO','Campeche, Camp.g','CST','America/Mexico_City'),(52,'MEX','982','','-6','Y','FSA-LSO','Candelaria','CST','America/Mexico_City'),(52,'MEX','983','','-6','Y','FSA-LSO','Chetumal, Q.Rooqzh','CST','America/Mexico_City'),(52,'MEX','984','','-6','Y','FSA-LSO','Akumalb','CST','America/Mexico_City'),(52,'MEX','985','','-6','Y','FSA-LSO','Chemaxj','CST','America/Mexico_City'),(52,'MEX','986','','-6','Y','FSA-LSO','Colonia Yucatane','CST','America/Mexico_City'),(52,'MEX','987','','-6','Y','FSA-LSO','Cozumelxmg','CST','America/Mexico_City'),(52,'MEX','988','','-6','Y','FSA-LSO','Acanceh','CST','America/Mexico_City'),(52,'MEX','991','','-6','Y','FSA-LSO','Bacaic','CST','America/Mexico_City'),(52,'MEX','992','','-6','Y','FSA-LSO','Benito Juarezwvz','CST','America/Mexico_City'),(52,'MEX','993','','-6','Y','FSA-LSO','Villahermosa, Tab.d','CST','America/Mexico_City'),(52,'MEX','994','','-6','Y','FSA-LSO','Cabeza De Torog','CST','America/Mexico_City'),(52,'MEX','995','','-6','Y','FSA-LSO','Camaron, El','CST','America/Mexico_City'),(52,'MEX','996','','-6','Y','FSA-LSO','Becalcu','CST','America/Mexico_City'),(52,'MEX','997','','-6','Y','FSA-LSO','Akilm','CST','America/Mexico_City'),(52,'MEX','998','','-6','Y','FSA-LSO','Cancun','CST','America/Mexico_City'),(52,'MEX','999','','-6','Y','FSA-LSO','Merida','CST','America/Mexico_City'),(53,'CUB','*','','-5','N','','Cuba','EST','America/Havana'),(54,'ARG','*','','-3','N','','Argentina','ART','America/Argentina/Buenos_Aires'),(55,'BRA','*','','-3','Y','TSO-LSF','Brazil','BRT','America/Sao_Paulo'),(56,'CHL','*','','-4','Y','SSO-SSM','Chile','CLT','America/Santiago'),(57,'COL','*','','-5','N','','Columbia','COT','America/Bogota'),(58,'VEN','*','','-4','N','','Venezuela','VET','America/Caracas'),(60,'MYS','*','','+8','N','','Malaysia','MYT','Asia/Kuala_Lumpur'),(61,'AUS','2','NS','+10','Y','FSO-FSA','New South Wales & Capitol','AEST','Australia/Sydney'),(61,'AUS','3','VI','+10','Y','FSO-FSA','Victoria','AEST','Australia/Sydney'),(61,'AUS','5','','+10','Y','FSO-FSA','Prefix 5 nonexistant','AEST','Australia/Sydney'),(61,'AUS','7','QL','+10','N','','Queensland','AEST','Australia/Brisbane'),(61,'AUS','36','TA','+10','Y','FSO-FSA','Tasmania','AEST','Australia/Sydney'),(61,'AUS','80','SA','+9.5','Y','FSO-FSA','Southern Australia','ACST','Australia/Adelaide'),(61,'AUS','81','SA','+9.5','Y','FSO-FSA','Southern Australia','ACST','Australia/Adelaide'),(61,'AUS','82','WA','+8','N','','Western Australia','AWST','Australia/Perth'),(61,'AUS','83','SA','+9.5','Y','FSO-FSA','Southern Australia','ACST','Australia/Adelaide'),(61,'AUS','84','WA','+8','N','','Western Australia','AWST','Australia/Perth'),(61,'AUS','85','SA','+9.5','Y','FSO-FSA','Southern Australia','ACST','Australia/Adelaide'),(61,'AUS','86','WA','+8','N','','Western Australia','AWST','Australia/Perth'),(61,'AUS','88','SA','+9.5','Y','FSO-FSA','Southern Australia','ACST','Australia/Adelaide'),(61,'AUS','89','WA','+8','N','','Western Australia','AWST','Australia/Perth'),(61,'AUS','889','NT','+9.5','N','','Northern Territory','ACST','Australia/Darwin'),(61,'AUS','4S','WA','+8','N','','Mobile numbers Western Australia','AWST','Australia/Perth'),(61,'AUS','4S','NT','+9.5','N','','Mobile numbers Northern Territory','ACST','Australia/Darwin'),(61,'AUS','4S','SA','+9.5','Y','FSO-FSA','Mobile numbers South Australia','ACST','Australia/Adelaide'),(61,'AUS','4S','TA','+10','Y','FSO-FSA','Mobile numbers Tasmania','AEST','Australia/Sydney'),(61,'AUS','4S','AC','+10','Y','FSO-FSA','Mobile numbers Capitol','AEST','Australia/Sydney'),(61,'AUS','4S','NS','+10','Y','FSO-FSA','Mobile numbers New South Wales','AEST','Australia/Sydney'),(61,'AUS','4S','','+10','Y','FSO-FSA','Mobile numbers No State Given','AEST','Australia/Sydney'),(61,'AUS','4S','QL','+10','N','','Mobile numbers Queensland','AEST','Australia/Brisbane'),(61,'AUS','4S','VI','+10','Y','FSO-FSA','Mobile numbers Victoria','AEST','Australia/Sydney'),(62,'IDN','*','','+7','N','','Indonesia','WIB','Asia/Jakarta'),(63,'PHL','*','','+8','N','','Philippines','PHT','Asia/Manila'),(64,'NZL','*','','+12','Y','FSO-TSM','New Zealand','NZST','Pacific/Auckland'),(65,'SGP','*','','+8','N','','Singapore','SGT','Asia/Singapore'),(66,'THA','*','','+7','N','','Thailand','ICT','Asia/Bangkok'),(81,'JPN','*','','+9','N','','Japan','JST','Asia/Tokyo'),(82,'KOR','*','','+9','N','','Korea  South','KST','Asia/Seoul'),(84,'VNM','*','','+7','N','','Vietnam','ICT','Asia/Ho_Chi_Minh'),(86,'CHN','*','','+8','N','','China','CST','Asia/Shanghai'),(90,'TUR','*','','+2','Y','LSM-LSO','Turkey','EET','Europe/Istanbul'),(91,'IND','*','','+5.5','N','','India','IST','Asia/Kolkata'),(92,'PAK','*','','+5','N','','Pakistan','PKT','Asia/Karachi'),(93,'AFG','*','','+4.5','N','','Afghanistan','AFT','Asia/Kabul'),(94,'LKA','*','','+5.5','N','','Sri Lanka','IST','Asia/Colombo'),(95,'MMR','*','','+6.5','N','','Myanmar Burma','MMT','Asia/Yangon'),(98,'IRN','*','','+3.5','N','','Iran','IRST','Asia/Tehran'),(211,'SSD','*','','+3','N','','South Sudan','EAT','Africa/Juba'),(212,'MAR','*','','0','N','','Morocco','WET','Africa/Casablanca'),(213,'DZA','*','','+1','N','','Algeria','CET','Africa/Algiers'),(216,'TUN','*','','+1','N','','Tunisia','CET','Africa/Tunis'),(218,'LBY','*','','+1','N','','Libya','CET','Africa/Tripoli'),(220,'GMB','*','','0','N','','Gambia','GMT','Africa/Banjul'),(221,'SEN','*','','0','N','','Senegal','GMT','Africa/Dakar'),(222,'MRT','*','','0','N','','Mauritania','GMT','Africa/Nouakchott'),(223,'MLI','*','','0','N','','Mali','GMT','Europe/Malta'),(224,'GIN','*','','0','N','','Guinea','GMT','Africa/Conakry'),(225,'CIV','*','','0','N','','Cote d Ivorie Ivory Coast','GMT','Africa/Abidjan'),(226,'BFA','*','','0','N','','Bukina Faso','GMT','Africa/Ouagadougou'),(227,'NER','*','','+1','N','','Niger Republic','WAT','Africa/Niamey'),(228,'TGO','*','','0','N','','Togo','GMT','Africa/Lome'),(229,'BEN','*','','+1','N','','Benin','WAT','Africa/Porto-Novo'),(230,'MUS','*','','+4','N','','Mauritius','MUT','Indian/Mauritius'),(231,'LBR','*','','0','N','','Liberia','GMT','Africa/Monrovia'),(232,'SLE','*','','0','N','','Sierra Leone','GMT','Africa/Freetown'),(233,'GHA','*','','0','N','','Ghana','GMT','Africa/Accra'),(234,'NGA','*','','+1','N','','Nigeria','WAT','Africa/Lagos'),(235,'TCD','*','','+1','N','','Chad','WAT','Africa/Ndjamena'),(236,'CAF','*','','+1','N','','Central African Republic','WAT','Africa/Bangui'),(237,'CMR','*','','+1','N','','Cameroon','WAT','Africa/Douala'),(238,'CPV','*','','-1','N','','Cape Verde Islands','CVT','Atlantic/Cape_Verde'),(239,'STP','*','','0','N','','Sao Tome and Principe','GMT','Africa/Sao_Tome'),(240,'GNQ','*','','+1','N','','Equatorial Guinea','WAT','Africa/Malabo'),(241,'GAB','*','','+1','N','','Gabon','WAT','Africa/Libreville'),(242,'COG','*','','+1','N','','Congo','WAT','Africa/Brazzaville'),(243,'COD','*','','+1','N','','Zaire Congo','WAT','Africa/Kinshasa'),(244,'AGO','*','','+1','N','','Angola','WAT','Africa/Luanda'),(245,'GNB','*','','0','N','','Guinea - Bissau','GMT','Africa/Bissau'),(246,'IOT','*','','+6','N','','British Indian Ocean Territory','BST','Indian/Chagos'),(247,'ASC','*','','0','N','','Ascension Island','GMT','Atlantic/St_Helena'),(248,'SYC','*','','+4','N','','Seychelles','SCT','Indian/Mahe'),(249,'SDN','*','','+3','N','','Sudan','EAT','Africa/Khartoum'),(250,'RWA','*','','+2','N','','Rwanda','CAT','Africa/Kigali'),(251,'ETH','*','','+3','N','','Ethiopia','EAT','Africa/Addis_Ababa'),(252,'SOM','*','','+3','N','','Somalia','EAT','Africa/Mogadishu'),(253,'DJI','*','','+3','N','','Djibouti','EAT','Africa/Djibouti'),(254,'KEN','*','','+3','N','','Kenya','EAT','Africa/Nairobi'),(255,'TZA','*','','+3','N','','Tanzania','EAT','Africa/Dar_es_Salaam'),(256,'UGA','*','','+3','N','','Uganda','EAT','Africa/Kampala'),(257,'BDI','*','','+2','N','','Burundi','CAT','Africa/Bujumbura'),(258,'MOZ','*','','+2','N','','Mozambique','CAT','Africa/Maputo'),(260,'ZMB','*','','+2','N','','Zambia','CAT','Africa/Lusaka'),(261,'MDG','*','','+3','N','','Madagascar','EAT','Indian/Antananarivo'),(262,'MYT','*','','+3','N','','Reunion and Mayotte','EAT','Indian/Mayotte'),(263,'ZWE','*','','+2','N','','Zimbabwe','CAT','Africa/Harare'),(264,'NAM','*','','+2','Y','FSS-FSA','Namibia','CAT','Africa/Windhoek'),(265,'MWI','*','','+2','N','','Malawi','CAT','Africa/Blantyre'),(266,'LSO','*','','+2','N','','Lesotho','CAT','Africa/Maseru'),(267,'BWA','*','','+2','N','','Botswana','CAT','Africa/Gaborone'),(268,'SWZ','*','','+2','N','','Swaziland','CAT','Africa/Mbabane'),(269,'COM','*','','+3','N','','Comoros','EAT','Indian/Comoro'),(290,'SHN','*','','0','N','','St Helena','GMT','Atlantic/St_Helena'),(291,'ERI','*','','+3','N','','Eritrea','EAT','Africa/Asmara'),(297,'ABW','*','','-4','N','','Aruba','AST','America/Aruba'),(298,'FRO','*','','0','N','','Faroe Islands','GMT','Atlantic/Faroe'),(299,'GRL','*','','-1','Y','LSM-LSO','Greenland','EGT','America/Thule'),(349,'ESP','*','','+1','Y','LSM-LSO','Spain','CET','Europe/Madrid'),(350,'GIB','*','','+1','Y','LSM-LSO','Gibraltar','CET','Europe/Gibraltar'),(351,'PRT','*','','0','Y','LSM-LSO','Portugal','WET','Europe/Lisbon'),(352,'LUX','*','','+1','Y','LSM-LSO','Luxembourg','CET','Europe/Luxembourg'),(353,'IRL','*','','0','Y','LSM-LSO','Ireland','IST','Europe/Dublin'),(354,'ISL','*','','0','N','','Iceland','GMT','Atlantic/Reykjavik'),(355,'ALB','*','','+1','Y','LSM-LSO','Albania','CET','Europe/Tirane'),(356,'MLT','*','','+1','Y','LSM-LSO','Malta','CET','Europe/Malta'),(357,'CYP','*','','+2','Y','LSM-LSO','Cyprus','EET','Asia/Nicosia'),(358,'FIN','*','','+2','Y','LSM-LSO','Finland','EET','Europe/Helsinki'),(359,'BGR','*','','+2','Y','LSM-LSO','Bulgaria','EET','Europe/Sofia'),(370,'LTU','*','','+2','Y','LSM-LSO','Lithuania','EET','Europe/Vilnius'),(371,'LVA','*','','+2','Y','LSM-LSO','Latvia','EET','Europe/Riga'),(372,'EST','*','','+2','Y','LSM-LSO','Estonia','EET','Europe/Tallinn'),(373,'MDA','*','','+2','Y','LSM-LSO','Moldovia','EET','Europe/Chisinau'),(374,'ARM','*','','+4','Y','LSM-LSO','Armenia','AMT','Asia/Yerevan'),(375,'BLR','*','','+2','Y','LSM-LSO','Belarus','EET','Europe/Minsk'),(376,'AND','*','','+1','Y','LSM-LSO','Andorra','CET','Europe/Andorra'),(377,'MCO','*','','+1','Y','LSM-LSO','Monaco','CET','Europe/Monaco'),(378,'SMR','*','','+1','Y','LSM-LSO','San Marino','CET','Europe/San_Marino'),(379,'VAT','*','','+1','Y','LSM-LSO','Vatican City State','CET','Europe/Vatican'),(380,'UKR','*','','+2','Y','LSM-LSO','Ukraine','EET','Europe/Kiev'),(381,'SRB','*','','+1','Y','LSM-LSO','Serbia','CET','Europe/Belgrade'),(382,'MNE','*','','+1','Y','LSM-LSO','Montenegro','CET','Europe/Podgorica'),(383,'XKX','*','','+1','Y','LSM-LSO','Kosovo','CET','Europe/Belgrade'),(385,'HRV','*','','+1','Y','LSM-LSO','Croatia','CET','Europe/Zagreb'),(386,'SVN','*','','+1','Y','LSM-LSO','Slovenia','CET','Europe/Ljubljana'),(387,'BIH','*','','+1','Y','LSM-LSO','Bosnia Hercegovina','CET','Europe/Sarajevo'),(389,'MKD','*','','+1','Y','LSM-LSO','Macedonia','CET','Europe/Skopje'),(420,'CZE','*','','+1','Y','LSM-LSO','Czech Republic','CET','Europe/Prague'),(421,'SVK','*','','+1','Y','LSM-LSO','Slovakia','CET','Europe/Bratislava'),(423,'LIE','*','','+1','Y','LSM-LSO','Lichtenstein','CET','Europe/Vaduz'),(500,'FLK','*','','-4','Y','FSS-TSA','Falkland Islands','FKT','Atlantic/Stanley'),(501,'BLZ','*','','-6','N','','Belize','CST','America/Belize'),(502,'GTM','*','','-6','N','','Guatemala','CST','America/Guatemala'),(503,'SLV','*','','-6','N','','El Salvador','CST','America/El_Salvador'),(504,'HND','*','','-6','N','','Honduras','CST','America/Tegucigalpa'),(505,'NIC','*','','-6','N','','Nicaragua','CST','America/Managua'),(506,'CRI','*','','-6','N','','Costa Rica','CST','America/Costa_Rica'),(507,'PAN','*','','-5','N','','Panama','EST','America/Panama'),(508,'SPM','*','','-3','Y','SSM-FSN','Saint Pierre and Miquelon','PMST','America/Miquelon'),(509,'HTI','*','','-5','N','','Haiti','EST','America/Port-au-Prince'),(590,'GLP','*','','-4','N','','Guadeloupe','AST','America/Guadeloupe'),(591,'BOL','*','','-4','N','','Bolivia','BOT','America/La_Paz'),(592,'GUY','*','','-4','N','','Guyana','AST','America/Guyana'),(593,'ECU','*','','-5','N','','Ecuador','ECT','America/Guayaquil'),(594,'GUF','*','','-3','N','','French Guiana','GFT','America/Cayenne'),(595,'PRY','*','','-4','Y','SSO-SSM','Paraguay','PYT','America/Asuncion'),(596,'MTQ','*','','-4','N','','Martinique','AST','America/Martinique'),(597,'SUR','*','','-3','N','','Suriname','SRT','America/Paramaribo'),(598,'URY','*','','-3','Y','FSO-SSM','Uruguay','UYT','America/Montevideo'),(599,'CUW','*','','-4','N','','Netherlands Antilles','AST','America/Curacao'),(649,'PCN','*','','-8','N','','Pitcain Island','PST','Pacific/Pitcairn'),(670,'TLS','*','','+9','N','','Timor-Leste','TLT','Asia/Dili'),(671,'GUM','*','','+10','N','','Guam','GST','Pacific/Guam'),(672,'ATA','*','','+8','N','','Antarctic Aus Territory','CAST','Antarctica/Davis'),(672,'CCK','*','','+6.5','N','','Cocos Island','CCT','Indian/Cocos'),(672,'CXR','*','','+7','N','','Christmas Island','CXT','Indian/Christmas'),(673,'BRN','*','','+8','N','','Brunei Darussalam','BNT','Asia/Brunei'),(674,'NRU','*','','-12','N','','Nauru','NRT','Pacific/Nauru'),(675,'PNG','*','','+10','N','','Papua New Guinea','PGT','Pacific/Port_Moresby'),(676,'TON','*','','+13','N','','Tonga','TST','Pacific/Tongatapu'),(677,'SLB','*','','-11','N','','Solomon Islands','SBT','Pacific/Guadalcanal'),(678,'VUT','*','','-11','N','','Vanuatu','VUT','Pacific/Efate'),(679,'FJI','*','','+12','N','','Fiji','FJT','Pacific/Fiji'),(680,'PLW','*','','+9','N','','Palau','PWT','Pacific/Palau'),(681,'WLF','*','','+12','N','','Wallis and Futuna','WFT','Pacific/Wallis'),(682,'COK','*','','+10.5','N','','Cook Islands','CKT','Pacific/Rarotonga'),(683,'NIU','*','','-11','N','','Niue Island','NUT','Pacific/Niue'),(684,'ASM','*','','-11','N','','Samoa USA','SST','Pacific/Pago_Pago'),(685,'WSM','*','','-11','N','','Samoa Western','WST','Pacific/Apia'),(686,'KIR','*','','+12','N','','Kiribati','GILT','Pacific/Kiritimati'),(687,'NCL','*','','+11','N','','New Caledonia','NCT','Pacific/Noumea'),(688,'TUV','*','','-12','N','','Tuvalu','TVT','Pacific/Funafuti'),(689,'PYF','*','','+9','N','','French Polynesia','GAMT','Pacific/Tahiti'),(690,'TKL','*','','-10','N','','Tokelau','TKT','Pacific/Fakaofo'),(691,'FSM','*','','+11','N','','Micronesia','PONT','Pacific/Pohnpei'),(692,'MHL','*','','+12','N','','Marshall Islands','MHT','Pacific/Majuro'),(850,'PRK','*','','+9','N','','Korea North','KST','Asia/Pyongyang'),(852,'HKG','*','','+8','N','','Hong Kong','HKT','Asia/Hong_Kong'),(853,'MAC','*','','+8','N','','Macao','CST','Asia/Macau'),(855,'KHM','*','','+7','N','','Cambodia','ICT','Asia/Phnom_Penh'),(856,'LAO','*','','+7','N','','Laos','ICT','Asia/Vientiane'),(870,'PCN','*','','-8','N','','Pitcain Island','PST','Pacific/Pitcairn'),(880,'BGD','*','','+6','N','','Bangladesh','BST','Asia/Dhaka'),(886,'TWN','*','','+8','N','','Taiwan','CST','Asia/Taipei'),(960,'MDV','*','','+5','N','','Maldives','MVT','Indian/Maldives'),(961,'LBN','*','','+2','Y','LSM-LSO','Lebanon','EET','Asia/Beirut'),(962,'JOR','*','','+2','Y','LSM-LSO','Jordan','EET','Asia/Amman'),(963,'SYR','*','','+2','Y','LSM-LSO','Syria','EET','Asia/Damascus'),(964,'IRQ','*','','+3','Y','FDA-FDO','Iraq','AST','Asia/Baghdad'),(965,'KWT','*','','+3','N','','Kuwait','AST','Asia/Kuwait'),(966,'SAU','*','','+3','N','','Saudi Arabia','AST','Asia/Riyadh'),(967,'YEM','*','','+3','N','','Yemen','AST','Asia/Aden'),(968,'OMN','*','','+4','N','','Oman','GST','Asia/Muscat'),(970,'PSE','*','','+2','Y','LFM-TSS','Palestine','IST','Asia/Jerusalem'),(971,'ARE','*','','+4','N','','United Arab Emirates','GST','Asia/Dubai'),(972,'ISR','*','','+2','Y','LFM-TSS','Israel','IST','Asia/Jerusalem'),(973,'BHR','*','','+3','N','','Bahrain','AST','Asia/Bahrain'),(974,'QAT','*','','+3','N','','Qatar','AST','Asia/Qatar'),(975,'BTN','*','','+6','N','','Bhutan','BTT','Asia/Thimphu'),(976,'MNG','*','','+8','N','','Mongolia','ULAT','Asia/Ulaanbaatar'),(977,'NPL','*','','+5.75','N','','Nepal','NPT','Asia/Kathmandu'),(992,'TJK','*','','+5','N','','Tajikistan','TJT','Asia/Dushanbe'),(993,'TKM','*','','+5','N','','Turkmenistan','TMT','Asia/Ashgabat'),(994,'AZE','*','','+1','Y','LSM-LSO','Azerbaijan','AZT','Asia/Baku'),(995,'GEO','*','','+4','N','','Georgia','GET','Asia/Tbilisi'),(996,'KGZ','*','','+5','N','','Kyrgyz Republic','UZT','Asia/Bishkek'),(998,'UZB','*','','+5','N','','Uzbekistan','UZT','Asia/Tashkent');
/*!40000 ALTER TABLE `vicidial_phone_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_postal_codes`
--

DROP TABLE IF EXISTS `vicidial_postal_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_postal_codes` (
  `postal_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GMT_offset` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DST` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `DST_range` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` smallint(5) unsigned DEFAULT NULL,
  KEY `country_postal_code` (`country_code`,`postal_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_postal_codes`
--

LOCK TABLES `vicidial_postal_codes` WRITE;
/*!40000 ALTER TABLE `vicidial_postal_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_postal_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_process_log`
--

DROP TABLE IF EXISTS `vicidial_process_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_process_log` (
  `serial_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `run_time` datetime DEFAULT NULL,
  `run_sec` int(11) DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `script` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_lines` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `serial_id` (`serial_id`),
  KEY `run_time` (`run_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_process_log`
--

LOCK TABLES `vicidial_process_log` WRITE;
/*!40000 ALTER TABLE `vicidial_process_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_process_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_process_trigger_log`
--

DROP TABLE IF EXISTS `vicidial_process_trigger_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_process_trigger_log` (
  `trigger_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `trigger_time` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trigger_lines` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trigger_results` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `trigger_id` (`trigger_id`),
  KEY `trigger_time` (`trigger_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_process_trigger_log`
--

LOCK TABLES `vicidial_process_trigger_log` WRITE;
/*!40000 ALTER TABLE `vicidial_process_trigger_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_process_trigger_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_process_triggers`
--

DROP TABLE IF EXISTS `vicidial_process_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_process_triggers` (
  `trigger_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `trigger_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `trigger_time` datetime DEFAULT NULL,
  `trigger_run` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trigger_lines` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`trigger_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_process_triggers`
--

LOCK TABLES `vicidial_process_triggers` WRITE;
/*!40000 ALTER TABLE `vicidial_process_triggers` DISABLE KEYS */;
INSERT INTO `vicidial_process_triggers` VALUES ('LOAD_LEADS','Load Leads','10.10.10.15','2009-01-01 00:00:00','0',NULL,'/usr/share/astguiclient/VICIDIAL_IN_new_leads_file.pl');
/*!40000 ALTER TABLE `vicidial_process_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_qc_agent_log`
--

DROP TABLE IF EXISTS `vicidial_qc_agent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_qc_agent_log` (
  `qc_agent_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `qc_user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `qc_user_group` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `qc_user_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `lead_user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `web_server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `view_datetime` datetime NOT NULL,
  `save_datetime` datetime DEFAULT NULL,
  `view_epoch` int(10) unsigned NOT NULL,
  `save_epoch` int(10) unsigned DEFAULT NULL,
  `elapsed_seconds` smallint(5) unsigned DEFAULT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned NOT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `old_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`qc_agent_log_id`),
  KEY `view_epoch` (`view_epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_qc_agent_log`
--

LOCK TABLES `vicidial_qc_agent_log` WRITE;
/*!40000 ALTER TABLE `vicidial_qc_agent_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_qc_agent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_qc_codes`
--

DROP TABLE IF EXISTS `vicidial_qc_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_qc_codes` (
  `code` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `code_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_result_type` enum('PASS','FAIL','CANCEL','COMMIT') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_qc_codes`
--

LOCK TABLES `vicidial_qc_codes` WRITE;
/*!40000 ALTER TABLE `vicidial_qc_codes` DISABLE KEYS */;
INSERT INTO `vicidial_qc_codes` VALUES ('QCPASS','PASS','PASS'),('QCFAIL','FAIL','FAIL'),('QCCANCEL','CANCEL','CANCEL');
/*!40000 ALTER TABLE `vicidial_qc_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_recent_ascb_calls`
--

DROP TABLE IF EXISTS `vicidial_recent_ascb_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_recent_ascb_calls` (
  `call_date` datetime DEFAULT NULL,
  `callback_date` datetime DEFAULT NULL,
  `callback_id` int(9) unsigned DEFAULT 0,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `server_ip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `orig_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'CALLBK',
  `reschedule` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `rescheduled` enum('U','P','Y','N') COLLATE utf8_unicode_ci DEFAULT 'U',
  UNIQUE KEY `caller_code` (`caller_code`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_recent_ascb_calls`
--

LOCK TABLES `vicidial_recent_ascb_calls` WRITE;
/*!40000 ALTER TABLE `vicidial_recent_ascb_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_recent_ascb_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_recent_ascb_calls_archive`
--

DROP TABLE IF EXISTS `vicidial_recent_ascb_calls_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_recent_ascb_calls_archive` (
  `call_date` datetime DEFAULT NULL,
  `callback_date` datetime DEFAULT NULL,
  `callback_id` int(9) unsigned DEFAULT 0,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT NULL,
  `server_ip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `orig_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'CALLBK',
  `reschedule` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `rescheduled` enum('U','P','Y','N') COLLATE utf8_unicode_ci DEFAULT 'U',
  UNIQUE KEY `caller_code` (`caller_code`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_recent_ascb_calls_archive`
--

LOCK TABLES `vicidial_recent_ascb_calls_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_recent_ascb_calls_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_recent_ascb_calls_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_recording_access_log`
--

DROP TABLE IF EXISTS `vicidial_recording_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_recording_access_log` (
  `recording_access_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recording_id` int(10) unsigned DEFAULT NULL,
  `lead_id` int(10) unsigned DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_datetime` datetime DEFAULT NULL,
  `access_result` enum('ACCESSED','INVALID USER','INVALID PERMISSIONS','NO RECORDING','RECORDING UNAVAILABLE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`recording_access_log_id`),
  KEY `recording_id` (`recording_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1599 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_recording_access_log`
--

LOCK TABLES `vicidial_recording_access_log` WRITE;
/*!40000 ALTER TABLE `vicidial_recording_access_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_recording_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_remote_agent_log`
--

DROP TABLE IF EXISTS `vicidial_remote_agent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_remote_agent_log` (
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ra_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_time` datetime DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `lead_id` int(9) unsigned DEFAULT 0,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT '',
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `processed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `call_time` (`call_time`),
  KEY `ra_user` (`ra_user`),
  KEY `extension` (`extension`),
  KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_remote_agent_log`
--

LOCK TABLES `vicidial_remote_agent_log` WRITE;
/*!40000 ALTER TABLE `vicidial_remote_agent_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_remote_agent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_remote_agents`
--

DROP TABLE IF EXISTS `vicidial_remote_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_remote_agents` (
  `remote_agent_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user_start` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_lines` tinyint(3) unsigned DEFAULT 1,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `conf_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci DEFAULT 'INACTIVE',
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `extension_group_order` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `on_hook_agent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `on_hook_ring_time` smallint(5) DEFAULT 15,
  PRIMARY KEY (`remote_agent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_remote_agents`
--

LOCK TABLES `vicidial_remote_agents` WRITE;
/*!40000 ALTER TABLE `vicidial_remote_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_remote_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_report_log`
--

DROP TABLE IF EXISTS `vicidial_report_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_report_log` (
  `report_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `event_date` datetime NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `report_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `browser` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `run_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `webserver` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`report_log_id`),
  KEY `user` (`user`),
  KEY `report_name` (`report_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_report_log`
--

LOCK TABLES `vicidial_report_log` WRITE;
/*!40000 ALTER TABLE `vicidial_report_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_report_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_rt_monitor_log`
--

DROP TABLE IF EXISTS `vicidial_rt_monitor_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_rt_monitor_log` (
  `manager_user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `manager_server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `manager_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `manager_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_session` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor_start_time` datetime DEFAULT NULL,
  `monitor_end_time` datetime DEFAULT NULL,
  `monitor_sec` int(9) unsigned DEFAULT 0,
  `monitor_type` enum('LISTEN','BARGE','HIJACK','WHISPER') COLLATE utf8_unicode_ci DEFAULT 'LISTEN',
  UNIQUE KEY `caller_code` (`caller_code`),
  KEY `manager_user` (`manager_user`),
  KEY `agent_user` (`agent_user`),
  KEY `monitor_start_time` (`monitor_start_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_rt_monitor_log`
--

LOCK TABLES `vicidial_rt_monitor_log` WRITE;
/*!40000 ALTER TABLE `vicidial_rt_monitor_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_rt_monitor_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_rt_monitor_log_archive`
--

DROP TABLE IF EXISTS `vicidial_rt_monitor_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_rt_monitor_log_archive` (
  `manager_user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `manager_server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `manager_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `manager_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_session` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monitor_start_time` datetime DEFAULT NULL,
  `monitor_end_time` datetime DEFAULT NULL,
  `monitor_sec` int(9) unsigned DEFAULT 0,
  `monitor_type` enum('LISTEN','BARGE','HIJACK','WHISPER') COLLATE utf8_unicode_ci DEFAULT 'LISTEN',
  UNIQUE KEY `caller_code` (`caller_code`),
  KEY `manager_user` (`manager_user`),
  KEY `agent_user` (`agent_user`),
  KEY `monitor_start_time` (`monitor_start_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_rt_monitor_log_archive`
--

LOCK TABLES `vicidial_rt_monitor_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_rt_monitor_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_rt_monitor_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_screen_colors`
--

DROP TABLE IF EXISTS `vicidial_screen_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_screen_colors` (
  `colors_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `colors_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `menu_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT '015B91',
  `frame_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'D9E6FE',
  `std_row1_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT '9BB9FB',
  `std_row2_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'B9CBFD',
  `std_row3_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT '8EBCFD',
  `std_row4_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'B6D3FC',
  `std_row5_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'A3C3D6',
  `alt_row1_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'BDFFBD',
  `alt_row2_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT '99FF99',
  `alt_row3_background` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'CCFFCC',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `web_logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default_new',
  `button_color` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'EFEFEF',
  PRIMARY KEY (`colors_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_screen_colors`
--

LOCK TABLES `vicidial_screen_colors` WRITE;
/*!40000 ALTER TABLE `vicidial_screen_colors` DISABLE KEYS */;
INSERT INTO `vicidial_screen_colors` VALUES ('red_rust','dark red rust','Y','804435','E7D0C2','C68C71','D9B39F','D9B49F','C68C72','C68C73','BDFFBD','99FF99','CCFFCC','---ALL---','default_new','EFEFEF'),('pale_green','pale green','Y','738035','E0E7C2','B6C572','C4CF8B','B6C572','C4CF8B','C4CF8B','BDFFBD','99FF99','CCFFCC','---ALL---','default_new','EFEFEF'),('alt_green','alternate green','Y','333333','D6E3B2','AEC866','BCD180','BCD180','AEC866','AEC866','BDFFBD','99FF99','CCFFCC','---ALL---','default_new','EFEFEF'),('default_blue_test','default blue test','Y','015B91','D9E6FE','9BB9FB','B9CBFD','8EBCFD','B6D3FC','A3C3D6','BDFFBD','99FF99','CCFFCC','---ALL---','default_new','EFEFEF'),('basic_orange','basic orange','Y','804d00','ffebcc','ffcc80','ffd699','ffcc80','ffd699','ffcc80','BDFFBD','99FF99','CCFFCC','---ALL---','default_new','EFEFEF'),('basic_purple','basic purple','Y','660066','ffccff','ff99ff','ffb3ff','ff99ff','ffb3ff','ff99ff','BDFFBD','99FF99','CCFFCC','---ALL---','SAMPLE.png','EFEFEF'),('basic_yellow','basic yellow','Y','666600','ffffcc','ffff66','ffff99','ffff66','ffff99','ffff66','BDFFBD','99FF99','CCFFCC','---ALL---','default_new','EFEFEF'),('basic_red','basic red','Y','800000','ffe6e6','ff9999','ffb3b3','ff9999','ffb3b3','ff9999','BDFFBD','99FF99','CCFFCC','---ALL---','default_new','EFEFEF'),('default_grey_agent','default grey agent','Y','FFFFFF','cccccc','E6E6E6','E6E6E6','E6E6E6','E6E6E6','E6E6E6','E6E6E6','E6E6E6','E6E6E6','---ALL---','DEFAULTAGENT.png','EFEFEF');
/*!40000 ALTER TABLE `vicidial_screen_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_screen_labels`
--

DROP TABLE IF EXISTS `vicidial_screen_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_screen_labels` (
  `label_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `label_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `label_hide_field_logs` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `label_title` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_first_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_middle_initial` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_last_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address1` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address2` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address3` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_city` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_state` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_province` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_postal_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_vendor_lead_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_gender` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_phone_number` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_phone_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_alt_phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_security_phrase` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_email` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_comments` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `label_lead_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_list_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_entry_date` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_gmt_offset_now` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_source_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_called_since_last_reset` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_status` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_user` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_date_of_birth` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_country_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_last_local_call_time` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_called_count` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_rank` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_owner` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_entry_list_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_screen_labels`
--

LOCK TABLES `vicidial_screen_labels` WRITE;
/*!40000 ALTER TABLE `vicidial_screen_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_screen_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_scripts`
--

DROP TABLE IF EXISTS `vicidial_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_scripts` (
  `script_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `script_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script_comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `script_color` varchar(7) COLLATE utf8_unicode_ci DEFAULT 'white',
  PRIMARY KEY (`script_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_scripts`
--

LOCK TABLES `vicidial_scripts` WRITE;
/*!40000 ALTER TABLE `vicidial_scripts` DISABLE KEYS */;
INSERT INTO `vicidial_scripts` VALUES ('CALLNOTES','Call Notes and Appointment Setting','','<iframe src=\"../agc/vdc_script_notes.php?lead_id=--A--lead_id--B--&vendor_id=--A--vendor_lead_code--B--&list_id=--A--list_id--B--&gmt_offset_now=--A--gmt_offset_now--B--&phone_code=--A--phone_code--B--&phone_number=--A--phone_number--B--&title=--A--title--B--&first_name=--A--first_name--B--&middle_initial=--A--middle_initial--B--&last_name=--A--last_name--B--&address1=--A--address1--B--&address2=--A--address2--B--&address3=--A--address3--B--&city=--A--city--B--&state=--A--state--B--&province=--A--province--B--&postal_code=--A--postal_code--B--&country_code=--A--country_code--B--&gender=--A--gender--B--&date_of_birth=--A--date_of_birth--B--&alt_phone=--A--alt_phone--B--&email=--A--email--B--&security_phrase=--A--security_phrase--B--&comments=--A--comments--B--&user=--A--user--B--&pass=--A--pass--B--&campaign=--A--campaign--B--&phone_login=--A--phone_login--B--&fronter=--A--fronter--B--&closer=--A--user--B--&group=--A--group--B--&channel_group=--A--group--B--&SQLdate=--A--SQLdate--B--&epoch=--A--epoch--B--&uniqueid=--A--uniqueid--B--&rank=--A--rank--B--&owner=--A--owner--B--&customer_zap_channel=--A--customer_zap_channel--B--&server_ip=--A--server_ip--B--&SIPexten=--A--SIPexten--B--&session_id=--A--session_id--B--\" style=\"background-color:transparent;\" scrolling=\"auto\" frameborder=\"0\" allowtransparency=\"true\" id=\"popupFrame\" name=\"popupFrame\"  width=\"--A--script_width--B--\" height=\"--A--script_height--B--\" STYLE=\"z-index:17\"> </iframe>','Y','---ALL---','white');
/*!40000 ALTER TABLE `vicidial_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_security_event_log`
--

DROP TABLE IF EXISTS `vicidial_security_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_security_event_log` (
  `event_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `event_time` datetime(3) NOT NULL,
  `severity` enum('Informational','Error') COLLATE utf8_unicode_ci NOT NULL,
  `service` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `event_version` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `local_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `local_port` smallint(6) NOT NULL,
  `remote_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `remote_port` smallint(6) NOT NULL,
  `module` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_time` datetime(3) DEFAULT NULL,
  `optional_one` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optional_two` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optional_three` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `server_ip` (`server_ip`),
  KEY `event` (`event`),
  KEY `event_time` (`event_time`),
  KEY `remote_address` (`remote_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_security_event_log`
--

LOCK TABLES `vicidial_security_event_log` WRITE;
/*!40000 ALTER TABLE `vicidial_security_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_security_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_server_carriers`
--

DROP TABLE IF EXISTS `vicidial_server_carriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_server_carriers` (
  `carrier_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `carrier_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `registration_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `account_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `protocol` enum('SIP','Zap','IAX2','EXTERNAL') COLLATE utf8_unicode_ci DEFAULT 'SIP',
  `globals_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dialplan_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `carrier_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  UNIQUE KEY `carrier_id` (`carrier_id`),
  KEY `server_ip` (`server_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_server_carriers`
--

LOCK TABLES `vicidial_server_carriers` WRITE;
/*!40000 ALTER TABLE `vicidial_server_carriers` DISABLE KEYS */;
INSERT INTO `vicidial_server_carriers` VALUES ('PARAXIP','TEST ParaXip CPD example','','--NONE--','[paraxip]\ndisallow=all\nallow=ulaw\ntype=peer\nusername=paraxip\nfromuser=paraxip\nsecret=test\nfromdomain=10.10.10.16\nhost=10.10.10.15\ninsecure=port,invite\noutboundproxy=10.0.0.7','SIP','TESTSIPTRUNKP = SIP/paraxip','exten => _5591999NXXXXXX,1,AGI(agi://127.0.0.1:4577/call_log)\nexten => _5591999NXXXXXX,2,Dial(${TESTSIPTRUNKP}/${EXTEN:4},,To)\nexten => _5591999NXXXXXX,3,Hangup','10.10.10.15','N',NULL,'---ALL---'),('SIPEXAMPLE','TEST SIP carrier example','register => testcarrier:test@10.10.10.15:5060','--NONE--','[testcarrier]\ndisallow=all\nallow=ulaw\ntype=friend\nusername=testcarrier\nsecret=test\nhost=dynamic\ndtmfmode=rfc2833\ncontext=trunkinbound\n','SIP','TESTSIPTRUNK = SIP/testcarrier','exten => _91999NXXXXXX,1,AGI(agi://127.0.0.1:4577/call_log)\nexten => _91999NXXXXXX,2,Dial(${TESTSIPTRUNK}/${EXTEN:2},,To)\nexten => _91999NXXXXXX,3,Hangup\n','10.10.10.15','N',NULL,'---ALL---'),('IAXEXAMPLE','TEST IAX carrier example','register => testcarrier:test@10.10.10.15:4569','--NONE--','[testcarrier]\ndisallow=all\nallow=ulaw\ntype=friend\naccountcode=testcarrier\nsecret=test\nhost=dynamic\ncontext=trunkinbound\n','IAX2','TESTIAXTRUNK = IAX2/testcarrier','exten => _71999NXXXXXX,1,AGI(agi://127.0.0.1:4577/call_log)\nexten => _71999NXXXXXX,2,Dial(${TESTIAXTRUNK}/${EXTEN:2},,To)\nexten => _71999NXXXXXX,3,Hangup\n','10.10.10.15','N',NULL,'---ALL---');
/*!40000 ALTER TABLE `vicidial_server_carriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_server_trunks`
--

DROP TABLE IF EXISTS `vicidial_server_trunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_server_trunks` (
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dedicated_trunks` smallint(5) unsigned DEFAULT 0,
  `trunk_restriction` enum('MAXIMUM_LIMIT','OVERFLOW_ALLOWED') COLLATE utf8_unicode_ci DEFAULT 'OVERFLOW_ALLOWED',
  KEY `campaign_id` (`campaign_id`),
  KEY `server_ip` (`server_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_server_trunks`
--

LOCK TABLES `vicidial_server_trunks` WRITE;
/*!40000 ALTER TABLE `vicidial_server_trunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_server_trunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_session_data`
--

DROP TABLE IF EXISTS `vicidial_session_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_session_data` (
  `session_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `conf_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `login_time` datetime NOT NULL,
  `webphone_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_login_call` text COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `session_name` (`session_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_session_data`
--

LOCK TABLES `vicidial_session_data` WRITE;
/*!40000 ALTER TABLE `vicidial_session_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_session_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sessions_recent`
--

DROP TABLE IF EXISTS `vicidial_sessions_recent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sessions_recent` (
  `lead_id` int(9) unsigned DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `call_date` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conf_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_type` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sessions_recent`
--

LOCK TABLES `vicidial_sessions_recent` WRITE;
/*!40000 ALTER TABLE `vicidial_sessions_recent` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sessions_recent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sessions_recent_archive`
--

DROP TABLE IF EXISTS `vicidial_sessions_recent_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sessions_recent_archive` (
  `lead_id` int(9) unsigned DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `call_date` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conf_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_type` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sessions_recent_archive`
--

LOCK TABLES `vicidial_sessions_recent_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_sessions_recent_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sessions_recent_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_settings_containers`
--

DROP TABLE IF EXISTS `vicidial_settings_containers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_settings_containers` (
  `container_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `container_notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `container_type` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'OTHER',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `container_entry` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`container_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_settings_containers`
--

LOCK TABLES `vicidial_settings_containers` WRITE;
/*!40000 ALTER TABLE `vicidial_settings_containers` DISABLE KEYS */;
INSERT INTO `vicidial_settings_containers` VALUES ('AGENT_CALLBACK_EMAIL ','Scheduled callback email alert settings','OTHER','---ALL---','; sending email address\r\nemail_from => vicidial@local.server\r\n\r\n; subject of the email\r\nemail_subject => Scheduled callback alert for --A--agent_name--B--\r\n\r\nemail_body_begin => \r\nThis is a reminder that you have a scheduled callback right now for the following lead:\r\n\r\nName: --A--first_name--B-- --A--last_name--B--\r\nPhone: --A--phone_number--B--\r\nAlt. phone: --A--alt_phone--B--\r\nEmail: --A--email--B--\r\nCB Comments: --A--callback_comments--B--\r\nLead Comments: --A--comments--B--\r\n\r\nPlease don\'t respond to this, fool.\r\n\r\nemail_body_end'),('TIMEZONES_USA','USA Timezone List','TIMEZONE_LIST','---ALL---','USA,AST,N,Atlantic Time Zone\nUSA,EST,Y,Eastern Time Zone\nUSA,CST,Y,Central Time Zone\nUSA,MST,Y,Mountain Time Zone\nUSA,MST,N,Arizona Time Zone\nUSA,PST,Y,Pacific Time Zone\nUSA,AKST,Y,Alaska Time Zone\nUSA,HST,N,Hawaii Time Zone\n'),('TIMEZONES_CANADA','Canadian Timezone List','TIMEZONE_LIST','---ALL---','CAN,NST,Y,Newfoundland Time Zone\nCAN,AST,Y,Atlantic Time Zone\nCAN,EST,Y,Eastern Time Zone\nCAN,CST,Y,Central Time Zone\nCAN,CST,N,Saskatchewan Time Zone\nCAN,MST,Y,Mountain Time Zone\nCAN,MST,N,Yukon Time Zone\nCAN,PST,Y,Pacific Time Zone\n'),('TIMEZONES_AUSTRALIA','Australian Timezone List','TIMEZONE_LIST','---ALL---','AUS,AEST,Y,Eastern Australia Time Zone\nAUS,AEST,N,Queensland Time Zone\nAUS,ACST,Y,Central Australia Time Zone\nAUS,ACST,N,Northern Territory Time Zone\nAUS,AWST,N,Western Australia Time Zone\n'),('PHONE_DEFAULTS','Default phone settings for preloading','PHONE_DEFAULTS','---ALL---','# Below are all phone settings recognized under the PHONE_DEFAULTS \r\n# container type and the type of data each accepts.  Any setting that\r\n# uses a default value in the database has said value pre-set below\r\n\r\n# 10 char max\r\nvoicemail_id => \r\n \r\n# 15 char max\r\nserver_ip => \r\n\r\n# 100 char max\r\npass => \r\n\r\n# 10 char max\r\nstatus => \r\n\r\n# Y/N only\r\nactive => Y\r\n\r\n# 50 char max\r\nphone_type => \r\n\r\n# \'SIP\',\'Zap\',\'IAX2\' or \'EXTERNAL\'\r\nprotocol => SIP\r\n\r\n# positive or negatier 2-decimal floating point number\r\nlocal_gmt => -5.00\r\n\r\n# 20 char max\r\nvoicemail_dump_exten => 85026666666666\r\n\r\n# 20 char max\r\noutbound_cid => \r\n\r\n# 100 char max\r\nemail => \r\n\r\n# 15 char max\r\ntemplate_id => \r\n\r\n# text, conf_override can span multiple lines, see below\r\nconf_override => \r\n# type=friend\r\n# host=dynamic\r\n# canreinvite=no\r\n# context=default1\r\n\r\n# 50 char max\r\nphone_context => default\r\n\r\n# Unsigned - max value 65536\r\nphone_ring_timeout => 60\r\n\r\n# 20 char max\r\nconf_secret => test\r\n\r\n# Y/N only\r\ndelete_vm_after_email => N\r\n\r\n# Options - Y, N, or Y_API_LAUNCH\r\nis_webphone => N\r\n\r\n# Y/N only\r\nuse_external_server_ip => N\r\n\r\n# 100 char max\r\ncodecs_list => \r\n\r\n# 0/1 only\r\ncodecs_with_template => 0\r\n\r\n# Options - Y, N, TOGGLE, or TOGGLE_OFF\r\nwebphone_dialpad => Y\r\n\r\n# Y/N only\r\non_hook_agent => N\r\n\r\n# Y/N only\r\nwebphone_auto_answer => Y\r\n\r\n# 30 char max\r\nvoicemail_timezone => eastern\r\n\r\n# 255 char max\r\nvoicemail_options => \r\n\r\n# 20 char max\r\nuser_group => ---ALL---\r\n\r\n# 100 char max\r\nvoicemail_greeting => \r\n\r\n# 20 char max\r\nvoicemail_dump_exten_no_inst => 85026666666667\r\n\r\n# Y/N only\r\nvoicemail_instructions => Y\r\n\r\n# Y/N only\r\non_login_report => N\r\n\r\n# 40 char max\r\nunavail_dialplan_fwd_exten => \r\n\r\n# 100 char max\r\nunavail_dialplan_fwd_context => \r\n\r\n# text\r\nnva_call_url => \r\n\r\n# 40 char max\r\nnva_search_method => \r\n\r\n# 255 char max\r\nnva_error_filename => \r\n\r\n# Integer, any size\r\nnva_new_list_id => 995\r\n\r\n# 10 char max\r\nnva_new_phone_code => 1\r\n\r\n# 6 char max\r\nnva_new_status => NVAINS\r\n\r\n# Y/N only\r\nwebphone_dialbox => Y\r\n\r\n# Y/N only\r\nwebphone_mute => Y\r\n\r\n# Y/N only\r\nwebphone_volume => Y\r\n\r\n# Y/N only\r\nwebphone_debug => N\r\n\r\n# 20 char max\r\noutbound_alt_cid => \r\n\r\n# Y/N only\r\nconf_qualify => Y\r\n\r\n# 255 char max\r\nwebphone_layout => \r\n'),('QC_STATUS_TEMPLATE','Sample QC Status Template','QC_TEMPLATE','---ALL---','# These types of containers are simply used for creating a list of \r\n# QC-enabled statuses to apply to campaigns, lists, and ingroups.\r\n# Simply put all the statuses that this template should allow in\r\n# a comma-delimited string, as below:\r\n\r\nSALE,DNC,NI'),('INTERNATIONAL_DNC_IMPORT','Process DNC lists of various countries from FTP site','PERL_CLI','---ALL---','# This setting container is used for the international DNC system. \r\n# The below two settings are mandatory for importing suppression lists\r\n# and tell the import process where to look for new files and where to\r\n# move them when handled.  These settings cannot have the same value. \r\n--file-dir=/root/ftp\r\n--file-destination=/root/ftp/DONE\r\n\r\n# Uncomment below and set the status to whatever custom disposition you \r\n# would like already-loaded leads to be set to when they dedupe against\r\n# a country\'s DNC list (default is \"DNCI\")\r\n# --dnc-status-override=BMNR\r\n\r\n# The below settings are optional for when files are stored on a remote\r\n# server.  It is strongly recommended these settings are not used and\r\n# that the processing scripts and files are stored locally on the same\r\n# server. \r\n# --ftp-host=localhost\r\n# --ftp-user=user\r\n# --ftp-pwd=pwd\r\n# --ftp-port=21\r\n# --ftp-passive=1\r\n'),('DNC_IMPORT_FORMATS','Import formats for DNC files','OTHER','---ALL---','# This setting container is used for storing file formats used when \r\n# loading DNC suppression lists into the dialer. \r\n#\r\n# import template => (delimited|fixed),delimiter,phone1(,phone2,phone3)\r\n#\r\n# For delimited files, the phone1 value should be the index value of\r\n# the field where the phone appears.  The first array index is 0 and\r\n# indexes continue through the natural numbers.\r\n\r\n# In delimited files, acceptable values for the \"delimiter\" field are:\r\n# - \"tab\", \"pipe\", \"comma\", \"quote-comma\"\r\nBASIC_DELIMITED_FORMAT => delimited,pipe,0\r\n\r\n# If the phone number is split into multiple fields (ex: area code in\r\n# one field, rest of the number in another), simply list additional \r\n# indices of the phone number fields separated by commas in the order \r\n# in which the data should be combined to make the complete phone \r\n# number \r\nDELIMITED_WITH_AC_AND_EXCHANGE_SPLIT => delimited,tab,0,1\r\n\r\n# For fixed-length files, the phone field values should be of the type:\r\n# - \"starting_position|length\"\r\nBASIC_FIXED_FORMAT => fixed,,0|10\r\n\r\n# (delimited|fixed) is not used for CSV/Excel files, so all that needs \r\n# providing for those is the index field value(s) of the phone number\r\nBASIC_CSV_OR_EXCEL_FORMAT => ,,0'),('DNC_CURRENT_BLOCKED_LISTS','Lists currently blocked due to pending DNC scrub','READ_ONLY','---ALL---','');
/*!40000 ALTER TABLE `vicidial_settings_containers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_shared_drops`
--

DROP TABLE IF EXISTS `vicidial_shared_drops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_shared_drops` (
  `callerid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('SENT','RINGING','LIVE','XFER','PAUSED','CLOSER','BUSY','DISCONNECT','IVR') COLLATE utf8_unicode_ci DEFAULT 'PAUSED',
  `lead_id` int(9) unsigned NOT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_time` datetime DEFAULT NULL,
  `call_type` enum('IN','OUT','OUTBALANCE') COLLATE utf8_unicode_ci DEFAULT 'OUT',
  `stage` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'START',
  `last_update_time` datetime DEFAULT NULL,
  `alt_dial` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `drop_time` datetime DEFAULT NULL,
  KEY `callerid` (`callerid`),
  KEY `call_time` (`call_time`),
  KEY `drop_time` (`drop_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_shared_drops`
--

LOCK TABLES `vicidial_shared_drops` WRITE;
/*!40000 ALTER TABLE `vicidial_shared_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_shared_drops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_shared_log`
--

DROP TABLE IF EXISTS `vicidial_shared_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_shared_log` (
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `log_time` datetime DEFAULT NULL,
  `total_agents` smallint(5) DEFAULT 0,
  `total_calls` smallint(5) DEFAULT 0,
  `debug_output` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `adapt_output` text COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `campaign_id` (`campaign_id`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_shared_log`
--

LOCK TABLES `vicidial_shared_log` WRITE;
/*!40000 ALTER TABLE `vicidial_shared_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_shared_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_shifts`
--

DROP TABLE IF EXISTS `vicidial_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_shifts` (
  `shift_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `shift_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shift_start_time` varchar(4) COLLATE utf8_unicode_ci DEFAULT '0900',
  `shift_length` varchar(5) COLLATE utf8_unicode_ci DEFAULT '16:00',
  `shift_weekdays` varchar(7) COLLATE utf8_unicode_ci DEFAULT '0123456',
  `report_option` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `report_rank` smallint(5) DEFAULT 1,
  KEY `shift_id` (`shift_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_shifts`
--

LOCK TABLES `vicidial_shifts` WRITE;
/*!40000 ALTER TABLE `vicidial_shifts` DISABLE KEYS */;
INSERT INTO `vicidial_shifts` VALUES ('24HRMIDNIGHT','24 hours 7 days a week','0000','24:00','0123456','N','---ALL---',1);
/*!40000 ALTER TABLE `vicidial_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_action_log`
--

DROP TABLE IF EXISTS `vicidial_sip_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_action_log` (
  `call_date` datetime(6) DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `call_date` (`call_date`),
  KEY `caller_code` (`caller_code`),
  KEY `result` (`result`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_action_log`
--

LOCK TABLES `vicidial_sip_action_log` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_action_log_archive`
--

DROP TABLE IF EXISTS `vicidial_sip_action_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_action_log_archive` (
  `call_date` datetime(6) DEFAULT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `vlesa` (`caller_code`,`call_date`),
  KEY `call_date` (`call_date`),
  KEY `caller_code` (`caller_code`),
  KEY `result` (`result`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_action_log_archive`
--

LOCK TABLES `vicidial_sip_action_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_action_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_action_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_archive_details`
--

DROP TABLE IF EXISTS `vicidial_sip_event_archive_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_archive_details` (
  `wday` tinyint(1) unsigned NOT NULL,
  `start_event_date` datetime(6) DEFAULT NULL,
  `end_event_date` datetime(6) DEFAULT NULL,
  `record_count` int(9) unsigned DEFAULT 0,
  PRIMARY KEY (`wday`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_archive_details`
--

LOCK TABLES `vicidial_sip_event_archive_details` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_archive_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_archive_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_log`
--

DROP TABLE IF EXISTS `vicidial_sip_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_log` (
  `sip_event_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sip_call_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `sip_event` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sip_event_id`),
  KEY `caller_code` (`caller_code`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_log`
--

LOCK TABLES `vicidial_sip_event_log` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_log_0`
--

DROP TABLE IF EXISTS `vicidial_sip_event_log_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_log_0` (
  `sip_event_id` int(9) unsigned NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sip_call_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `sip_event` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sip_event_id`),
  KEY `caller_code` (`caller_code`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_log_0`
--

LOCK TABLES `vicidial_sip_event_log_0` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_log_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_log_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_log_1`
--

DROP TABLE IF EXISTS `vicidial_sip_event_log_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_log_1` (
  `sip_event_id` int(9) unsigned NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sip_call_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `sip_event` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sip_event_id`),
  KEY `caller_code` (`caller_code`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_log_1`
--

LOCK TABLES `vicidial_sip_event_log_1` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_log_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_log_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_log_2`
--

DROP TABLE IF EXISTS `vicidial_sip_event_log_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_log_2` (
  `sip_event_id` int(9) unsigned NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sip_call_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `sip_event` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sip_event_id`),
  KEY `caller_code` (`caller_code`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_log_2`
--

LOCK TABLES `vicidial_sip_event_log_2` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_log_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_log_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_log_3`
--

DROP TABLE IF EXISTS `vicidial_sip_event_log_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_log_3` (
  `sip_event_id` int(9) unsigned NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sip_call_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `sip_event` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sip_event_id`),
  KEY `caller_code` (`caller_code`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_log_3`
--

LOCK TABLES `vicidial_sip_event_log_3` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_log_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_log_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_log_4`
--

DROP TABLE IF EXISTS `vicidial_sip_event_log_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_log_4` (
  `sip_event_id` int(9) unsigned NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sip_call_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `sip_event` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sip_event_id`),
  KEY `caller_code` (`caller_code`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_log_4`
--

LOCK TABLES `vicidial_sip_event_log_4` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_log_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_log_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_log_5`
--

DROP TABLE IF EXISTS `vicidial_sip_event_log_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_log_5` (
  `sip_event_id` int(9) unsigned NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sip_call_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `sip_event` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sip_event_id`),
  KEY `caller_code` (`caller_code`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_log_5`
--

LOCK TABLES `vicidial_sip_event_log_5` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_log_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_log_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_log_6`
--

DROP TABLE IF EXISTS `vicidial_sip_event_log_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_log_6` (
  `sip_event_id` int(9) unsigned NOT NULL,
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sip_call_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `sip_event` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sip_event_id`),
  KEY `caller_code` (`caller_code`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_log_6`
--

LOCK TABLES `vicidial_sip_event_log_6` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_log_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_log_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_sip_event_recent`
--

DROP TABLE IF EXISTS `vicidial_sip_event_recent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_sip_event_recent` (
  `caller_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invite_date` datetime(6) DEFAULT NULL,
  `first_100_date` datetime(6) DEFAULT NULL,
  `first_180_date` datetime(6) DEFAULT NULL,
  `first_183_date` datetime(6) DEFAULT NULL,
  `last_100_date` datetime(6) DEFAULT NULL,
  `last_180_date` datetime(6) DEFAULT NULL,
  `last_183_date` datetime(6) DEFAULT NULL,
  `200_date` datetime(6) DEFAULT NULL,
  `error_date` datetime(6) DEFAULT NULL,
  `processed` enum('N','Y','U') COLLATE utf8_unicode_ci DEFAULT 'N',
  KEY `caller_code` (`caller_code`),
  KEY `invite_date` (`invite_date`),
  KEY `processed` (`processed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_sip_event_recent`
--

LOCK TABLES `vicidial_sip_event_recent` WRITE;
/*!40000 ALTER TABLE `vicidial_sip_event_recent` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_sip_event_recent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_state_call_times`
--

DROP TABLE IF EXISTS `vicidial_state_call_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_state_call_times` (
  `state_call_time_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `state_call_time_state` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `state_call_time_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state_call_time_comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `sct_default_start` smallint(4) unsigned NOT NULL DEFAULT 900,
  `sct_default_stop` smallint(4) unsigned NOT NULL DEFAULT 2100,
  `sct_sunday_start` smallint(4) unsigned DEFAULT 0,
  `sct_sunday_stop` smallint(4) unsigned DEFAULT 0,
  `sct_monday_start` smallint(4) unsigned DEFAULT 0,
  `sct_monday_stop` smallint(4) unsigned DEFAULT 0,
  `sct_tuesday_start` smallint(4) unsigned DEFAULT 0,
  `sct_tuesday_stop` smallint(4) unsigned DEFAULT 0,
  `sct_wednesday_start` smallint(4) unsigned DEFAULT 0,
  `sct_wednesday_stop` smallint(4) unsigned DEFAULT 0,
  `sct_thursday_start` smallint(4) unsigned DEFAULT 0,
  `sct_thursday_stop` smallint(4) unsigned DEFAULT 0,
  `sct_friday_start` smallint(4) unsigned DEFAULT 0,
  `sct_friday_stop` smallint(4) unsigned DEFAULT 0,
  `sct_saturday_start` smallint(4) unsigned DEFAULT 0,
  `sct_saturday_stop` smallint(4) unsigned DEFAULT 0,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `ct_holidays` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`state_call_time_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_state_call_times`
--

LOCK TABLES `vicidial_state_call_times` WRITE;
/*!40000 ALTER TABLE `vicidial_state_call_times` DISABLE KEYS */;
INSERT INTO `vicidial_state_call_times` VALUES ('alabama','AL','Alabama 8am-8pm and Sunday','',800,2000,2400,2400,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('illinois','IL','Illinois 8am','',800,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('indiana','IN','Indiana 8pm restriction','',900,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('kentucky','KY','Kentucky 10am restriction','',1000,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('louisiana','LA','Louisiana 8am-8pm and Sunday','',800,2000,2400,2400,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('massachuse','MA','Massachusetts 8am-8pm','',800,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('mississipp','MS','Mississippi 8am-8pm and Sunday','',800,2000,2400,2400,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('nebraska','NE','Nebraska 8am','',800,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('nevada','NV','Nevada 8pm restriction','',900,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('pennsylvan','PA','Pennsylvania sunday restrictn','',900,2100,1330,2100,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('rhodeislan','RI','Rhode Island restrictions','',900,1800,2400,2400,0,0,0,0,0,0,0,0,0,0,1000,1700,'---ALL---',NULL),('sdakota','SD','South Dakota sunday restrict','',900,2100,2400,2400,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('tennessee','TN','Tennessee 8am','',800,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('texas','TX','Texas sunday restriction','',900,2100,1200,2100,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('utah','UT','Utah 8pm restriction','',900,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('washington','WA','Washington 8am','',800,2100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL),('wyoming','WY','Wyoming 8am-8pm','',800,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'---ALL---',NULL);
/*!40000 ALTER TABLE `vicidial_state_call_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_stations`
--

DROP TABLE IF EXISTS `vicidial_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_stations` (
  `agent_station` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `phone_channel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `computer_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DB_server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DB_user` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DB_pass` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DB_port` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`agent_station`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_stations`
--

LOCK TABLES `vicidial_stations` WRITE;
/*!40000 ALTER TABLE `vicidial_stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_status_categories`
--

DROP TABLE IF EXISTS `vicidial_status_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_status_categories` (
  `vsc_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `vsc_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vsc_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tovdad_display` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `sale_category` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dead_lead_category` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`vsc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_status_categories`
--

LOCK TABLES `vicidial_status_categories` WRITE;
/*!40000 ALTER TABLE `vicidial_status_categories` DISABLE KEYS */;
INSERT INTO `vicidial_status_categories` VALUES ('UNDEFINED','Default Category',NULL,'N','N','N');
/*!40000 ALTER TABLE `vicidial_status_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_status_groups`
--

DROP TABLE IF EXISTS `vicidial_status_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_status_groups` (
  `status_group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_group_notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`status_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_status_groups`
--

LOCK TABLES `vicidial_status_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_status_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_status_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_statuses`
--

DROP TABLE IF EXISTS `vicidial_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_statuses` (
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `status_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selectable` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `human_answered` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `category` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'UNDEFINED',
  `sale` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dnc` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `customer_contact` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `not_interested` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `unworkable` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callback` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `completed` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `min_sec` int(5) unsigned DEFAULT 0,
  `max_sec` int(5) unsigned DEFAULT 0,
  `answering_machine` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_statuses`
--

LOCK TABLES `vicidial_statuses` WRITE;
/*!40000 ALTER TABLE `vicidial_statuses` DISABLE KEYS */;
INSERT INTO `vicidial_statuses` VALUES ('NEW','New Lead','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('QUEUE','Lead To Be Called','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('INCALL','Lead Being Called','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('DROP','Agent Not Available','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('XDROP','Agent Not Available IN','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('NA','No Answer AutoDial','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('CALLBK','Call Back','Y','Y','UNDEFINED','N','N','Y','N','N','Y','N',0,0,'N'),('CBHOLD','Call Back Hold','N','Y','UNDEFINED','N','N','Y','N','N','Y','N',0,0,'N'),('A','Answering Machine','Y','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'Y'),('AA','Answering Machine Auto','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('AM','Answering Machine SentToMesg','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'Y'),('AL','Answering Machine Msg Played','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'Y'),('AFAX','Fax Machine Auto','N','N','UNDEFINED','N','N','N','N','Y','N','N',0,0,'N'),('AB','Busy Auto','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('B','Busy','Y','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('DC','Disconnected Number','Y','N','UNDEFINED','N','N','N','N','Y','N','N',0,0,'N'),('ADC','Disconnected Number Auto','N','N','UNDEFINED','N','N','N','N','Y','N','N',0,0,'N'),('DEC','Declined Sale','Y','Y','UNDEFINED','N','N','Y','N','N','N','N',0,0,'N'),('DNC','DO NOT CALL','Y','Y','UNDEFINED','N','Y','N','N','N','N','Y',0,0,'N'),('DNCL','DO NOT CALL Hopper Sys Match','N','N','UNDEFINED','N','Y','N','N','N','N','Y',0,0,'N'),('DNCC','DO NOT CALL Hopper Camp Match','N','N','UNDEFINED','N','Y','N','N','N','N','Y',0,0,'N'),('SALE','Sale Made','Y','Y','UNDEFINED','Y','N','N','N','N','N','Y',0,0,'N'),('N','No Answer','Y','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('NI','Not Interested','Y','Y','UNDEFINED','N','N','Y','Y','N','N','N',0,0,'N'),('NP','No Pitch No Price','Y','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('PU','Call Picked Up','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('PM','Played Message','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('XFER','Call Transferred','Y','Y','UNDEFINED','N','N','Y','N','N','N','N',0,0,'N'),('ERI','Agent Error','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('SVYEXT','Survey sent to Extension','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('SVYVM','Survey sent to Voicemail','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('SVYHU','Survey Hungup','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('SVYREC','Survey sent to Record','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('QVMAIL','Queue Abandon Voicemail Left','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('RQXFER','Re-Queue','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('TIMEOT','Inbound Queue Timeout Drop','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('AFTHRS','Inbound After Hours Drop','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('NANQUE','Inbound No Agent No Queue Drop','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('PDROP','Outbound Pre-Routing Drop','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('IVRXFR','Outbound drop to Call Menu','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('SVYCLM','Survey sent to Call Menu','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('MLINAT','Multi-Lead auto-alt set inactv','N','Y','UNDEFINED','N','N','N','N','N','N','Y',0,0,'N'),('MAXCAL','Inbound Max Calls Drop','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('LRERR','Outbound Local Channel Res Err','N','Y','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('QCFAIL','QC_FAIL_CALLBK','N','Y','QC','N','N','Y','N','N','Y','N',0,0,'N'),('ADCT','Disconnected Number Temporary','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('LSMERG','Agent lead search old lead mrg','N','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N'),('DAIR','Dead Air','Y','N','UNDEFINED','N','N','N','N','N','N','N',0,0,'N');
/*!40000 ALTER TABLE `vicidial_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_territories`
--

DROP TABLE IF EXISTS `vicidial_territories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_territories` (
  `territory_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `territory` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `territory_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`territory_id`),
  UNIQUE KEY `uniqueterritory` (`territory`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_territories`
--

LOCK TABLES `vicidial_territories` WRITE;
/*!40000 ALTER TABLE `vicidial_territories` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_territories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_tiltx_shaken_log`
--

DROP TABLE IF EXISTS `vicidial_tiltx_shaken_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_tiltx_shaken_log` (
  `db_time` datetime NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `url_log_id` int(9) unsigned NOT NULL,
  `caller_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(19) COLLATE utf8_unicode_ci DEFAULT '',
  `CIDnumber` varchar(19) COLLATE utf8_unicode_ci DEFAULT '',
  `CallerIDToUse` varchar(19) COLLATE utf8_unicode_ci DEFAULT '',
  `IsDNC` tinyint(1) DEFAULT 0,
  `IsDisconnected` tinyint(1) DEFAULT 0,
  `TILTXID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Identity` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `db_time` (`db_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_tiltx_shaken_log`
--

LOCK TABLES `vicidial_tiltx_shaken_log` WRITE;
/*!40000 ALTER TABLE `vicidial_tiltx_shaken_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_tiltx_shaken_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_timeclock_audit_log`
--

DROP TABLE IF EXISTS `vicidial_timeclock_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_timeclock_audit_log` (
  `timeclock_id` int(9) unsigned NOT NULL,
  `event_epoch` int(10) unsigned NOT NULL,
  `event_date` datetime NOT NULL,
  `login_sec` int(10) unsigned DEFAULT NULL,
  `event` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shift_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_datestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tcid_link` int(9) unsigned DEFAULT NULL,
  KEY `timeclock_id` (`timeclock_id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_timeclock_audit_log`
--

LOCK TABLES `vicidial_timeclock_audit_log` WRITE;
/*!40000 ALTER TABLE `vicidial_timeclock_audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_timeclock_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_timeclock_log`
--

DROP TABLE IF EXISTS `vicidial_timeclock_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_timeclock_log` (
  `timeclock_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `event_epoch` int(10) unsigned NOT NULL,
  `event_date` datetime NOT NULL,
  `login_sec` int(10) unsigned DEFAULT NULL,
  `event` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shift_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_datestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tcid_link` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`timeclock_id`),
  KEY `user` (`user`),
  KEY `event_epoch` (`event_epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_timeclock_log`
--

LOCK TABLES `vicidial_timeclock_log` WRITE;
/*!40000 ALTER TABLE `vicidial_timeclock_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_timeclock_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_timeclock_status`
--

DROP TABLE IF EXISTS `vicidial_timeclock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_timeclock_status` (
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `event_epoch` int(10) unsigned DEFAULT NULL,
  `event_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shift_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user` (`user`),
  KEY `user_2` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_timeclock_status`
--

LOCK TABLES `vicidial_timeclock_status` WRITE;
/*!40000 ALTER TABLE `vicidial_timeclock_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_timeclock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_tts_prompts`
--

DROP TABLE IF EXISTS `vicidial_tts_prompts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_tts_prompts` (
  `tts_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tts_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `tts_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tts_voice` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'Allison-8kHz',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  PRIMARY KEY (`tts_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_tts_prompts`
--

LOCK TABLES `vicidial_tts_prompts` WRITE;
/*!40000 ALTER TABLE `vicidial_tts_prompts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_tts_prompts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_two_factor_auth`
--

DROP TABLE IF EXISTS `vicidial_two_factor_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_two_factor_auth` (
  `auth_date` datetime DEFAULT NULL,
  `auth_exp_date` datetime DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `auth_stage` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `auth_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `auth_code_exp_date` datetime DEFAULT NULL,
  `auth_method` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'EMAIL',
  `auth_attempts` smallint(5) DEFAULT 0,
  KEY `user` (`user`),
  KEY `auth_date` (`auth_date`),
  KEY `auth_exp_date` (`auth_exp_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_two_factor_auth`
--

LOCK TABLES `vicidial_two_factor_auth` WRITE;
/*!40000 ALTER TABLE `vicidial_two_factor_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_two_factor_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_url_log`
--

DROP TABLE IF EXISTS `vicidial_url_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_url_log` (
  `url_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url_date` datetime DEFAULT NULL,
  `url_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `response_sec` smallint(5) unsigned DEFAULT 0,
  `url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_response` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`url_log_id`),
  KEY `uniqueid` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_url_log`
--

LOCK TABLES `vicidial_url_log` WRITE;
/*!40000 ALTER TABLE `vicidial_url_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_url_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_url_multi`
--

DROP TABLE IF EXISTS `vicidial_url_multi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_url_multi` (
  `url_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `entry_type` enum('campaign','ingroup','list','') COLLATE utf8_unicode_ci DEFAULT '',
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `url_type` enum('dispo','start','addlead','noagent','') COLLATE utf8_unicode_ci DEFAULT '',
  `url_rank` smallint(5) DEFAULT 1,
  `url_statuses` varchar(1000) COLLATE utf8_unicode_ci DEFAULT '',
  `url_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `url_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_lists` varchar(1000) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`url_id`),
  KEY `vicidial_url_multi_campaign_id_key` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_url_multi`
--

LOCK TABLES `vicidial_url_multi` WRITE;
/*!40000 ALTER TABLE `vicidial_url_multi` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_url_multi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_urls`
--

DROP TABLE IF EXISTS `vicidial_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_urls` (
  `url_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`url_id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_urls`
--

LOCK TABLES `vicidial_urls` WRITE;
/*!40000 ALTER TABLE `vicidial_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_user_closer_log`
--

DROP TABLE IF EXISTS `vicidial_user_closer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_user_closer_log` (
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `blended` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_change` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  KEY `user` (`user`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_user_closer_log`
--

LOCK TABLES `vicidial_user_closer_log` WRITE;
/*!40000 ALTER TABLE `vicidial_user_closer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_user_closer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_user_groups`
--

DROP TABLE IF EXISTS `vicidial_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_user_groups` (
  `user_group` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_allowed_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_allowed_inbound_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_shifts` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `forced_timeclock_login` enum('Y','N','ADMIN_EXEMPT') COLLATE utf8_unicode_ci DEFAULT 'N',
  `shift_enforcement` enum('OFF','START','ALL','ADMIN_EXEMPT') COLLATE utf8_unicode_ci DEFAULT 'OFF',
  `agent_status_viewable_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_status_view_time` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `agent_call_log_view` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `agent_xfer_consultative` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_dial_override` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_vm_transfer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_blind_transfer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_dial_with_customer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_park_customer_dial` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_fullscreen` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `allowed_reports` varchar(2000) COLLATE utf8_unicode_ci DEFAULT 'ALL REPORTS',
  `webphone_url_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `webphone_systemkey_override` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `webphone_dialpad_override` enum('DISABLED','Y','N','TOGGLE','TOGGLE_OFF') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `admin_viewable_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_viewable_call_times` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_custom_reports` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_allowed_chat_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_xfer_park_3way` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `admin_ip_list` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_ip_list` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `api_ip_list` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `webphone_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_user_groups`
--

LOCK TABLES `vicidial_user_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_user_groups` DISABLE KEYS */;
INSERT INTO `vicidial_user_groups` VALUES ('ADMIN','VICIDIAL ADMINISTRATORS',' -ALL-CAMPAIGNS- - -',NULL,NULL,NULL,'N','OFF',' --ALL-GROUPS-- ','N','N','Y','Y','Y','Y','Y','Y','N','ALL REPORTS','','','DISABLED',' ---ALL--- ',' ---ALL--- ','',' --ALL-GROUPS-- ','Y','','','','');
/*!40000 ALTER TABLE `vicidial_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_user_list_new_lead`
--

DROP TABLE IF EXISTS `vicidial_user_list_new_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_user_list_new_lead` (
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT 999,
  `user_override` smallint(5) DEFAULT -1,
  `new_count` mediumint(8) unsigned DEFAULT 0,
  UNIQUE KEY `userlistnew` (`user`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_user_list_new_lead`
--

LOCK TABLES `vicidial_user_list_new_lead` WRITE;
/*!40000 ALTER TABLE `vicidial_user_list_new_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_user_list_new_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_user_log`
--

DROP TABLE IF EXISTS `vicidial_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_user_log` (
  `user_log_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `event_epoch` int(10) unsigned DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `computer_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_login` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `server_phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `phone_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `webserver` smallint(5) unsigned DEFAULT 0,
  `login_url` int(9) unsigned DEFAULT 0,
  `browser_width` smallint(5) unsigned DEFAULT 0,
  `browser_height` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`user_log_id`),
  KEY `user` (`user`),
  KEY `event_date` (`event_date`),
  KEY `phone_ip` (`phone_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_user_log`
--

LOCK TABLES `vicidial_user_log` WRITE;
/*!40000 ALTER TABLE `vicidial_user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_user_territories`
--

DROP TABLE IF EXISTS `vicidial_user_territories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_user_territories` (
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `territory` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `level` enum('TOP_AGENT','STANDARD_AGENT','BOTTOM_AGENT') COLLATE utf8_unicode_ci DEFAULT 'STANDARD_AGENT',
  UNIQUE KEY `userterritory` (`user`,`territory`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_user_territories`
--

LOCK TABLES `vicidial_user_territories` WRITE;
/*!40000 ALTER TABLE `vicidial_user_territories` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_user_territories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_user_territory_log`
--

DROP TABLE IF EXISTS `vicidial_user_territory_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_user_territory_log` (
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `agent_territories` text COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `user` (`user`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_user_territory_log`
--

LOCK TABLES `vicidial_user_territory_log` WRITE;
/*!40000 ALTER TABLE `vicidial_user_territory_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_user_territory_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_users`
--

DROP TABLE IF EXISTS `vicidial_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_users` (
  `user_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_level` tinyint(3) unsigned DEFAULT 1,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_login` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_pass` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_users` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_user_groups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_campaigns` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_ingroups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_remote_agents` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `load_leads` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `campaign_detail` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `ast_admin_access` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `ast_delete_phones` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_scripts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_leads` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `hotkeys_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `change_agent_campaign` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_choose_ingroups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `scheduled_callbacks` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `agentonly_callbacks` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agentcall_manual` enum('0','1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT '0',
  `vicidial_recording` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `vicidial_transfers` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `delete_filters` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `alter_agent_interface_options` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `closer_default_blended` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_call_times` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_call_times` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_users` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_campaigns` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_scripts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_filters` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_ingroups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_usergroups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_remoteagents` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_servers` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `view_reports` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `vicidial_recording_override` enum('DISABLED','NEVER','ONDEMAND','ALLCALLS','ALLFORCE') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `alter_custdata_override` enum('NOT_ACTIVE','ALLOW_ALTER') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `qc_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `qc_user_level` int(2) DEFAULT 1,
  `qc_pass` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `qc_finish` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `qc_commit` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `add_timeclock_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_timeclock_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_timeclock_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `alter_custphone_override` enum('NOT_ACTIVE','ALLOW_ALTER') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `vdc_agent_api_access` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_inbound_dids` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_inbound_dids` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `alert_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `download_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_shift_enforcement_override` enum('DISABLED','OFF','START','ALL') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manager_shift_enforcement_override` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `shift_override_flag` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `export_reports` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_from_dnc` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `user_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `territory` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `allow_alerts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_choose_territories` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `custom_one` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_two` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_three` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_four` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_five` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `voicemail_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_call_log_view_override` enum('DISABLED','Y','N') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `callcard_admin` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_choose_blended` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `realtime_block_user_info` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_fields_modify` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `force_change_password` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `agent_lead_search_override` enum('NOT_ACTIVE','ENABLED','LIVE_CALL_INBOUND','LIVE_CALL_INBOUND_AND_MANUAL','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `modify_shifts` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_phones` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_carriers` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_labels` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_statuses` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_voicemail` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_audiostore` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_moh` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_tts` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `preset_contact_search` enum('NOT_ACTIVE','ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `modify_contacts` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_same_user_level` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `admin_hide_lead_data` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_hide_phone_data` enum('0','1','2_DIGITS','3_DIGITS','4_DIGITS') COLLATE utf8_unicode_ci DEFAULT '0',
  `agentcall_email` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_email_accounts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `failed_login_count` tinyint(3) unsigned DEFAULT 0,
  `last_login_date` datetime DEFAULT '2001-01-01 00:00:01',
  `last_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `pass_hash` varchar(500) COLLATE utf8_unicode_ci DEFAULT '',
  `alter_admin_interface_options` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `max_inbound_calls` smallint(5) unsigned DEFAULT 0,
  `modify_custom_dialplans` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `wrapup_seconds_override` smallint(4) DEFAULT -1,
  `modify_languages` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `selected_language` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default English',
  `user_choose_language` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `ignore_group_on_search` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `api_list_restrict` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `api_allowed_functions` varchar(1000) COLLATE utf8_unicode_ci DEFAULT ' ALL_FUNCTIONS ',
  `lead_filter_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `admin_cf_show_hidden` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agentcall_chat` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_hide_realtime` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `access_recordings` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_colors` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `user_new_lead_limit` smallint(5) DEFAULT -1,
  `api_only_user` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_auto_reports` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_ip_lists` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `ignore_ip_list` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `ready_max_logout` mediumint(7) DEFAULT -1,
  `export_gdpr_leads` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `pause_code_approval` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `max_hopper_calls` smallint(5) unsigned DEFAULT 0,
  `max_hopper_calls_hour` smallint(5) unsigned DEFAULT 0,
  `mute_recordings` enum('DISABLED','Y','N') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `hide_call_log_info` enum('DISABLED','Y','N','SHOW_1','SHOW_2','SHOW_3','SHOW_4','SHOW_5','SHOW_6','SHOW_7','SHOW_8','SHOW_9','SHOW_10') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `next_dial_my_callbacks` enum('NOT_ACTIVE','DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `user_admin_redirect_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_inbound_filter_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `max_inbound_filter_statuses` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_inbound_filter_ingroups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_inbound_filter_min_sec` smallint(5) DEFAULT -1,
  `status_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `two_factor_override` enum('NOT_ACTIVE','ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `manual_dial_filter` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_users`
--

LOCK TABLES `vicidial_users` WRITE;
/*!40000 ALTER TABLE `vicidial_users` DISABLE KEYS */;
INSERT INTO `vicidial_users` VALUES (1,'6666','admin','Admin',9,'ADMIN','','','1','1','1','1','1','1','1','1','1','1','1','5','0','1','1','','1','0','0','1','1','1','1','0','1','1','1','1','1','1','1','1','1','1','1','1','DISABLED','NOT_ACTIVE','0',1,'0','0','0','1','1','1','NOT_ACTIVE','0','1','1','Y','0','1','DISABLED','1','0','1','1','','','','0','0','','','','','','','DISABLED','1','1','1','0','N','NOT_ACTIVE','1','1','1','1','1','1','1','1','1','NOT_ACTIVE','1','1','1','0','0','0',0,'2021-07-10 13:06:35','192.168.1.2','','1',0,'1',-1,'0','default English','0','1','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','1','',-1,'0','0','0','0',-1,'0','1',0,0,'DISABLED','DISABLED','NOT_ACTIVE','','0','','',-1,'','','','DISABLED'),(2,'VDAD','donotedit','Outbound Auto Dial',1,'ADMIN',NULL,NULL,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','1',NULL,'1','0','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','N','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','1','0','0','0','0',0,'2001-01-01 00:00:01','','','1',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED'),(3,'VDCL','donotedit','Inbound No Agent',1,'ADMIN',NULL,NULL,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','1',NULL,'1','0','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','N','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','1','0','0','0','0',0,'2001-01-01 00:00:01','','','1',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED'),(4,'admin','admin','admin',9,'---ALL---','','','1','1','1','1','1','1','1','1','1','1','1','5','0','1','1','','1','0','0','1','1','1','1','0','1','1','1','1','1','1','1','1','1','1','1','1','DISABLED','NOT_ACTIVE','0',1,'0','0','0','1','1','1','NOT_ACTIVE','0','1','1','Y','0','1','DISABLED','1','0','1','1','','','','0','0','','','','','','','DISABLED','1','1','0','0','N','NOT_ACTIVE','1','1','1','1','1','1','1','1','1','NOT_ACTIVE','1','1','0','0','0','0',0,'2001-01-01 00:00:01','','','1',0,'1',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','1','',-1,'0','0','0','0',-1,'0','1',0,0,'DISABLED','DISABLED','NOT_ACTIVE','','0','','',-1,'','','','DISABLED');
/*!40000 ALTER TABLE `vicidial_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_vdad_log`
--

DROP TABLE IF EXISTS `vicidial_vdad_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_vdad_log` (
  `caller_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `epoch_micro` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `db_time` datetime NOT NULL,
  `run_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `vdad_script` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `lead_id` int(10) unsigned DEFAULT 0,
  `stage` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `step` smallint(5) unsigned DEFAULT 0,
  KEY `caller_code` (`caller_code`),
  KEY `vdad_dbtime_key` (`db_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_vdad_log`
--

LOCK TABLES `vicidial_vdad_log` WRITE;
/*!40000 ALTER TABLE `vicidial_vdad_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_vdad_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_vmm_counts`
--

DROP TABLE IF EXISTS `vicidial_vmm_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_vmm_counts` (
  `call_date` date DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `vmm_count` smallint(5) unsigned DEFAULT 0,
  `vmm_played` smallint(5) unsigned DEFAULT 0,
  UNIQUE KEY `vvmmcount` (`lead_id`,`call_date`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_vmm_counts`
--

LOCK TABLES `vicidial_vmm_counts` WRITE;
/*!40000 ALTER TABLE `vicidial_vmm_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_vmm_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_vmm_counts_archive`
--

DROP TABLE IF EXISTS `vicidial_vmm_counts_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_vmm_counts_archive` (
  `call_date` date DEFAULT NULL,
  `lead_id` int(9) unsigned DEFAULT NULL,
  `vmm_count` smallint(5) unsigned DEFAULT 0,
  `vmm_played` smallint(5) unsigned DEFAULT 0,
  UNIQUE KEY `vvmmcount` (`lead_id`,`call_date`),
  KEY `call_date` (`call_date`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_vmm_counts_archive`
--

LOCK TABLES `vicidial_vmm_counts_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_vmm_counts_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_vmm_counts_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_voicemail`
--

DROP TABLE IF EXISTS `vicidial_voicemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_voicemail` (
  `voicemail_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `pass` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `messages` int(4) DEFAULT 0,
  `old_messages` int(4) DEFAULT 0,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_vm_after_email` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `voicemail_timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'eastern',
  `voicemail_options` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `voicemail_greeting` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `on_login_report` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`voicemail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_voicemail`
--

LOCK TABLES `vicidial_voicemail` WRITE;
/*!40000 ALTER TABLE `vicidial_voicemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_voicemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_webservers`
--

DROP TABLE IF EXISTS `vicidial_webservers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_webservers` (
  `webserver_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `webserver` varchar(125) COLLATE utf8_unicode_ci DEFAULT '',
  `hostname` varchar(125) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`webserver_id`),
  UNIQUE KEY `vdweb` (`webserver`,`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_webservers`
--

LOCK TABLES `vicidial_webservers` WRITE;
/*!40000 ALTER TABLE `vicidial_webservers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_webservers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_xfer_log`
--

DROP TABLE IF EXISTS `vicidial_xfer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_xfer_log` (
  `xfercallid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closer` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `front_uniqueid` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `close_uniqueid` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`xfercallid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `date_user` (`call_date`,`user`),
  KEY `date_closer` (`call_date`,`closer`),
  KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_xfer_log`
--

LOCK TABLES `vicidial_xfer_log` WRITE;
/*!40000 ALTER TABLE `vicidial_xfer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_xfer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_xfer_log_archive`
--

DROP TABLE IF EXISTS `vicidial_xfer_log_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_xfer_log_archive` (
  `xfercallid` int(9) unsigned NOT NULL,
  `lead_id` int(9) unsigned NOT NULL,
  `list_id` bigint(14) unsigned DEFAULT NULL,
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `call_date` datetime DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closer` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `front_uniqueid` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `close_uniqueid` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`xfercallid`),
  KEY `lead_id` (`lead_id`),
  KEY `call_date` (`call_date`),
  KEY `date_user` (`call_date`,`user`),
  KEY `date_closer` (`call_date`,`closer`),
  KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_xfer_log_archive`
--

LOCK TABLES `vicidial_xfer_log_archive` WRITE;
/*!40000 ALTER TABLE `vicidial_xfer_log_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_xfer_log_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_xfer_presets`
--

DROP TABLE IF EXISTS `vicidial_xfer_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_xfer_presets` (
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `preset_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `preset_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `preset_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `preset_hide_number` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  KEY `preset_name` (`preset_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_xfer_presets`
--

LOCK TABLES `vicidial_xfer_presets` WRITE;
/*!40000 ALTER TABLE `vicidial_xfer_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_xfer_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_xfer_stats`
--

DROP TABLE IF EXISTS `vicidial_xfer_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_xfer_stats` (
  `campaign_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `preset_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `xfer_count` smallint(5) unsigned DEFAULT 0,
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_xfer_stats`
--

LOCK TABLES `vicidial_xfer_stats` WRITE;
/*!40000 ALTER TABLE `vicidial_xfer_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_xfer_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vtiger_rank_data`
--

DROP TABLE IF EXISTS `vtiger_rank_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vtiger_rank_data` (
  `account` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `seqacct` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_attempt_days` smallint(5) unsigned NOT NULL,
  `orders` smallint(5) NOT NULL,
  `net_sales` smallint(5) NOT NULL,
  `net_sales_ly` smallint(5) NOT NULL,
  `percent_variance` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `imu` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `aov` smallint(5) NOT NULL,
  `returns` smallint(5) NOT NULL,
  `rank` smallint(5) NOT NULL,
  PRIMARY KEY (`account`),
  UNIQUE KEY `seqacct` (`seqacct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vtiger_rank_data`
--

LOCK TABLES `vtiger_rank_data` WRITE;
/*!40000 ALTER TABLE `vtiger_rank_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `vtiger_rank_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vtiger_rank_parameters`
--

DROP TABLE IF EXISTS `vtiger_rank_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vtiger_rank_parameters` (
  `parameter_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `parameter` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lower_range` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `upper_range` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `points` smallint(5) NOT NULL,
  PRIMARY KEY (`parameter_id`),
  KEY `parameter` (`parameter`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vtiger_rank_parameters`
--

LOCK TABLES `vtiger_rank_parameters` WRITE;
/*!40000 ALTER TABLE `vtiger_rank_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `vtiger_rank_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vtiger_vicidial_roles`
--

DROP TABLE IF EXISTS `vtiger_vicidial_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vtiger_vicidial_roles` (
  `user_level` tinyint(2) DEFAULT NULL,
  `vtiger_role` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vtiger_vicidial_roles`
--

LOCK TABLES `vtiger_vicidial_roles` WRITE;
/*!40000 ALTER TABLE `vtiger_vicidial_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vtiger_vicidial_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_client_sessions`
--

DROP TABLE IF EXISTS `web_client_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_client_sessions` (
  `extension` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `program` enum('agc','vicidial','monitor','other') COLLATE utf8_unicode_ci DEFAULT 'agc',
  `start_time` datetime NOT NULL,
  `session_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `session_name` (`session_name`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_client_sessions`
--

LOCK TABLES `web_client_sessions` WRITE;
/*!40000 ALTER TABLE `web_client_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_client_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_phrases`
--

DROP TABLE IF EXISTS `www_phrases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_phrases` (
  `phrase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phrase_text` varchar(10000) COLLATE utf8_unicode_ci DEFAULT '',
  `php_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `php_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `source` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `insert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`phrase_id`),
  KEY `phrase_text` (`phrase_text`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_phrases`
--

LOCK TABLES `www_phrases` WRITE;
/*!40000 ALTER TABLE `www_phrases` DISABLE KEYS */;
/*!40000 ALTER TABLE `www_phrases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-11 12:40:06