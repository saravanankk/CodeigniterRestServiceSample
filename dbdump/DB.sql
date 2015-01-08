-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4804
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for blood_bank
CREATE DATABASE IF NOT EXISTS `blood_bank` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blood_bank`;


-- Dumping structure for table blood_bank.tbl_bloodgroup
CREATE TABLE IF NOT EXISTS `tbl_bloodgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table blood_bank.tbl_bloodgroup: ~16 rows (approximately)
DELETE FROM `tbl_bloodgroup`;
/*!40000 ALTER TABLE `tbl_bloodgroup` DISABLE KEYS */;
INSERT INTO `tbl_bloodgroup` (`id`, `name`, `timestamp`) VALUES
	(1, 'A+', '2014-06-29 19:50:14'),
	(2, 'A-', '2014-06-29 19:50:23'),
	(3, 'B+', '2014-06-29 19:50:31'),
	(4, 'B-', '2014-06-29 19:50:39'),
	(5, 'AB+', '2014-06-29 19:50:46'),
	(6, 'AB-', '2014-06-29 19:50:54'),
	(7, 'O+', '2014-06-29 19:51:00'),
	(8, 'O-', '2014-06-29 19:51:07'),
	(9, 'A1+', '2014-06-29 19:51:13'),
	(10, 'A1-', '2014-06-29 19:51:21'),
	(11, 'A2+', '2014-06-29 19:51:28'),
	(12, 'A2-', '2014-06-29 19:51:38'),
	(13, 'A1B+', '2014-06-29 19:51:45'),
	(14, 'A1B-', '2014-06-29 19:51:52'),
	(15, 'A2B+', '2014-06-29 19:51:58'),
	(16, 'A2B-', '2014-06-29 19:52:07');
/*!40000 ALTER TABLE `tbl_bloodgroup` ENABLE KEYS */;


-- Dumping structure for table blood_bank.tbl_blood_donation_events
CREATE TABLE IF NOT EXISTS `tbl_blood_donation_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `address` text NOT NULL,
  `conducted_by` text,
  `sponsor_by` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table blood_bank.tbl_blood_donation_events: ~2 rows (approximately)
DELETE FROM `tbl_blood_donation_events`;
/*!40000 ALTER TABLE `tbl_blood_donation_events` DISABLE KEYS */;
INSERT INTO `tbl_blood_donation_events` (`id`, `name`, `date_from`, `date_to`, `address`, `conducted_by`, `sponsor_by`, `timestamp`) VALUES
	(1, 'rotary_club_event', '2015-01-07 23:28:27', '2015-01-09 23:28:33', 'nagercoil', 'Rotary', 'All', '2015-01-07 23:29:02'),
	(2, 'event1', '2015-01-07 13:33:07', '2015-01-07 23:33:13', 'kanyakumari', 'Govt', 'Goverment', '2015-01-07 23:33:50'),
	(3, 'event2', '2015-01-08 09:44:42', '2015-01-18 09:44:46', 'madurai', 'district govt', 'sponsor', '2015-01-08 09:45:17');
/*!40000 ALTER TABLE `tbl_blood_donation_events` ENABLE KEYS */;


-- Dumping structure for table blood_bank.tbl_blood_request
CREATE TABLE IF NOT EXISTS `tbl_blood_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(100) DEFAULT NULL,
  `patient_bloodgroup_id` int(11) NOT NULL,
  `patient_age` float DEFAULT NULL,
  `blood_require_date` datetime NOT NULL,
  `unit_needed` float NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `landline_numaber` varchar(20) DEFAULT NULL,
  `hospital_name` varchar(200) DEFAULT NULL,
  `hospital_address` text,
  `patinet_address` text,
  `purpose` text,
  `state` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `pinocde` int(11) DEFAULT NULL,
  `unique_code` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `state` (`state`),
  KEY `district` (`district`),
  CONSTRAINT `tbl_blood_request_ibfk_1` FOREIGN KEY (`state`) REFERENCES `tbl_states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_blood_request_ibfk_2` FOREIGN KEY (`district`) REFERENCES `tbl_district` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table blood_bank.tbl_blood_request: ~0 rows (approximately)
DELETE FROM `tbl_blood_request`;
/*!40000 ALTER TABLE `tbl_blood_request` DISABLE KEYS */;
INSERT INTO `tbl_blood_request` (`id`, `patient_name`, `patient_bloodgroup_id`, `patient_age`, `blood_require_date`, `unit_needed`, `contact_number`, `landline_numaber`, `hospital_name`, `hospital_address`, `patinet_address`, `purpose`, `state`, `district`, `area`, `pinocde`, `unique_code`, `timestamp`) VALUES
	(1, 'patient1', 2, 35, '2015-01-08 09:45:45', 2, '6346475734', NULL, 'hospital1', 'address', 'adress', NULL, 24, 2, 1, 45236, '', '2015-01-08 09:46:29'),
	(2, 'patinet2', 3, 39, '2015-01-08 09:47:05', 1, '4542352366', NULL, 'hospital2', 'address', 'address', NULL, 34, 1, 2, 54243, '', '2015-01-08 09:47:36');
/*!40000 ALTER TABLE `tbl_blood_request` ENABLE KEYS */;


-- Dumping structure for table blood_bank.tbl_district
CREATE TABLE IF NOT EXISTS `tbl_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `tbl_district_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `tbl_states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table blood_bank.tbl_district: ~31 rows (approximately)
DELETE FROM `tbl_district`;
/*!40000 ALTER TABLE `tbl_district` DISABLE KEYS */;
INSERT INTO `tbl_district` (`id`, `state_id`, `name`, `timestamp`) VALUES
	(1, 30, 'Ariyalur\r', '2014-07-09 20:33:14'),
	(2, 30, 'Chennai\r', '2014-07-09 20:33:14'),
	(3, 30, 'Coimbatore\r', '2014-07-09 20:33:14'),
	(4, 30, 'Cuddalore\r', '2014-07-09 20:33:14'),
	(5, 30, 'Dharmapuri\r', '2014-07-09 20:33:14'),
	(6, 30, 'Dindigul\r', '2014-07-09 20:33:14'),
	(7, 30, 'Erode\r', '2014-07-09 20:33:14'),
	(8, 30, 'Kanchipuram\r', '2014-07-09 20:33:14'),
	(9, 30, 'Kanyakumari\r', '2014-07-09 20:33:14'),
	(10, 30, 'Karur\r', '2014-07-09 20:33:14'),
	(11, 30, 'Krishnagiri\r', '2014-07-09 20:33:14'),
	(12, 30, 'Madurai\r', '2014-07-09 20:33:14'),
	(13, 30, 'Nagapattinam\r', '2014-07-09 20:33:14'),
	(14, 30, 'Namakkal\r', '2014-07-09 20:33:14'),
	(15, 30, 'Nilgiris\r', '2014-07-09 20:33:14'),
	(16, 30, 'Perambalur\r', '2014-07-09 20:33:14'),
	(17, 30, 'Pudukkottai\r', '2014-07-09 20:33:14'),
	(18, 30, 'Ramanathapuram\r', '2014-07-09 20:33:14'),
	(19, 30, 'Salem\r', '2014-07-09 20:33:14'),
	(20, 30, 'Sivaganga\r', '2014-07-09 20:33:14'),
	(21, 30, 'Thanjavur\r', '2014-07-09 20:33:14'),
	(22, 30, 'Theni\r', '2014-07-09 20:33:14'),
	(23, 30, 'Tiruchirappalli\r', '2014-07-09 20:33:14'),
	(24, 30, 'Tirunelveli\r', '2014-07-09 20:33:14'),
	(25, 30, 'Tiruvallur\r', '2014-07-09 20:33:14'),
	(26, 30, 'Tiruvannamalai\r', '2014-07-09 20:33:14'),
	(27, 30, 'Tiruvarur\r', '2014-07-09 20:33:14'),
	(28, 30, 'Tuticorin\r', '2014-07-09 20:33:14'),
	(29, 30, 'Vellore\r', '2014-07-09 20:33:14'),
	(30, 30, 'Villupuram\r', '2014-07-09 20:33:14'),
	(31, 30, 'Virudhunagar\r', '2014-07-09 20:33:14');
/*!40000 ALTER TABLE `tbl_district` ENABLE KEYS */;


-- Dumping structure for table blood_bank.tbl_donor
CREATE TABLE IF NOT EXISTS `tbl_donor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `blood_group_id` int(11) NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'M',
  `weight` float DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `land_line_no` varchar(30) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `pincode` int(11) NOT NULL,
  `geo_location` float DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `address` text,
  `password` varchar(10) DEFAULT NULL,
  `avilable_to_donate` tinyint(1) DEFAULT NULL,
  `last_donated_date` timestamp NULL DEFAULT NULL,
  `photo_org_path` varchar(500) DEFAULT NULL,
  `photo_thumb_path` varchar(500) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `state` (`state`),
  KEY `district` (`district`),
  KEY `blood_group_id` (`blood_group_id`),
  CONSTRAINT `tbl_donor_ibfk_1` FOREIGN KEY (`state`) REFERENCES `tbl_states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_donor_ibfk_2` FOREIGN KEY (`district`) REFERENCES `tbl_district` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_donor_ibfk_3` FOREIGN KEY (`blood_group_id`) REFERENCES `tbl_bloodgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table blood_bank.tbl_donor: ~0 rows (approximately)
DELETE FROM `tbl_donor`;
/*!40000 ALTER TABLE `tbl_donor` DISABLE KEYS */;
INSERT INTO `tbl_donor` (`id`, `name`, `blood_group_id`, `gender`, `weight`, `date_of_birth`, `mobile_no`, `land_line_no`, `state`, `district`, `area`, `pincode`, `geo_location`, `email`, `address`, `password`, `avilable_to_donate`, `last_donated_date`, `photo_org_path`, `photo_thumb_path`, `verified`, `timestamp`) VALUES
	(15, 'donor1', 2, 'M', 60, '1988-06-29', 9065747844, '', 30, 9, 0, 629001, 0, 'test@gmail.com', 'test', 'test', 0, '0000-00-00 00:00:00', NULL, NULL, 0, '2015-01-08 09:47:55'),
	(16, 'donor2', 3, 'M', 59, '2015-01-08', 4542352346, NULL, 24, 5, 1, 34523, NULL, 'em@gmail.com', 'address', 'test', 1, '2015-01-08 09:48:52', NULL, NULL, 1, '2015-01-08 09:48:56'),
	(17, 'donor3', 5, 'F', 55, '2015-01-08', 44352353, NULL, 1, 3, 4, 362346, NULL, 'give@gmail.com', 'address', 'heb', 1, '2015-01-08 09:50:27', NULL, NULL, 0, '2015-01-08 09:50:32');
/*!40000 ALTER TABLE `tbl_donor` ENABLE KEYS */;


-- Dumping structure for table blood_bank.tbl_donor_mobile_verification_code
CREATE TABLE IF NOT EXISTS `tbl_donor_mobile_verification_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `donor_id` bigint(20) NOT NULL,
  `verification_code` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `donor_id` (`donor_id`),
  CONSTRAINT `tbl_donor_mobile_verification_code_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `tbl_donor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table blood_bank.tbl_donor_mobile_verification_code: ~0 rows (approximately)
DELETE FROM `tbl_donor_mobile_verification_code`;
/*!40000 ALTER TABLE `tbl_donor_mobile_verification_code` DISABLE KEYS */;
INSERT INTO `tbl_donor_mobile_verification_code` (`id`, `donor_id`, `verification_code`, `timestamp`) VALUES
	(6, 15, '89633', '2015-01-07 23:15:51');
/*!40000 ALTER TABLE `tbl_donor_mobile_verification_code` ENABLE KEYS */;


-- Dumping structure for table blood_bank.tbl_postal_area
CREATE TABLE IF NOT EXISTS `tbl_postal_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `area` varchar(500) NOT NULL,
  `pincode` bigint(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `tbl_postal_area_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `tbl_district` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=latin1;

-- Dumping data for table blood_bank.tbl_postal_area: ~267 rows (approximately)
DELETE FROM `tbl_postal_area`;
/*!40000 ALTER TABLE `tbl_postal_area` DISABLE KEYS */;
INSERT INTO `tbl_postal_area` (`id`, `district_id`, `area`, `pincode`, `timestamp`) VALUES
	(1, 9, 'Aloor ', 629801, '2014-07-09 23:00:09'),
	(2, 9, 'Attur ', 629177, '2014-07-09 23:00:09'),
	(3, 9, 'Azhakamparai ', 629252, '2014-07-09 23:00:09'),
	(4, 9, 'Azhakappapuram ', 629401, '2014-07-09 23:00:09'),
	(5, 9, 'Azhakiapandipuram ', 629851, '2014-07-09 23:00:09'),
	(6, 9, 'Kaliakkavilai ', 629153, '2014-07-09 23:00:09'),
	(7, 9, 'Kanniyakumari ', 629702, '2014-07-09 23:00:09'),
	(8, 9, 'Karankad ', 629809, '2014-07-09 23:00:09'),
	(9, 9, 'Kattathurai ', 629158, '2014-07-09 23:00:09'),
	(10, 9, 'Kodimunai ', 629251, '2014-07-09 23:00:09'),
	(11, 9, 'Kozhiporvilai ', 629167, '2014-07-09 23:00:09'),
	(12, 9, 'Kumarapuram ', 629301, '2014-07-09 23:00:09'),
	(13, 9, 'Kurumpanai ', 629251, '2014-07-09 23:00:09'),
	(14, 9, 'Manalikarai ', 629164, '2014-07-09 23:00:09'),
	(15, 9, 'Marungoor ', 629402, '2014-07-09 23:00:09'),
	(16, 9, 'Maruthencode ', 629163, '2014-07-09 23:00:09'),
	(17, 9, 'Nagercoil Collectorate ', 629001, '2014-07-09 23:00:09'),
	(18, 9, 'Nattalam ', 629165, '2014-07-09 23:00:09'),
	(19, 9, 'Netta ', 629101, '2014-07-09 23:00:09'),
	(20, 9, 'Padanthalumoodu ', 629163, '2014-07-09 23:00:09'),
	(21, 9, 'Palkulam ', 629851, '2014-07-09 23:00:09'),
	(22, 9, 'Potraiyadi ', 629703, '2014-07-09 23:00:09'),
	(23, 9, 'Rajakkamangalam ', 629502, '2014-07-09 23:00:09'),
	(24, 9, 'Sahayanagar ', 629159, '2014-07-09 23:00:09'),
	(25, 9, 'Thengapattanam ', 629173, '2014-07-09 23:00:09'),
	(26, 9, 'Thiruvarambu ', 629161, '2014-07-09 23:00:09'),
	(27, 9, 'Thovalai ', 629302, '2014-07-09 23:00:09'),
	(28, 9, 'Vadiveeswaram ', 629001, '2014-07-09 23:00:09'),
	(29, 9, 'Vetturnimadam ', 629003, '2014-07-09 23:00:09'),
	(30, 9, 'Viricode ', 629165, '2014-07-09 23:00:09'),
	(31, 9, 'Vizhunthaiyambalam ', 629173, '2014-07-09 23:00:09'),
	(32, 9, 'Anducode ', 629168, '2014-07-09 23:00:09'),
	(33, 9, 'Aralvaymoli ', 629301, '2014-07-09 23:00:09'),
	(34, 9, 'Bethelpuram ', 629803, '2014-07-09 23:00:09'),
	(35, 9, 'Chittardam Colony ', 629161, '2014-07-09 23:00:09'),
	(36, 9, 'Derisanamcope ', 629851, '2014-07-09 23:00:09'),
	(37, 9, 'Elavuvilai ', 629171, '2014-07-09 23:00:09'),
	(38, 9, 'Kadiyapattanam ', 629252, '2014-07-09 23:00:09'),
	(39, 9, 'Kallankuzhi ', 629166, '2014-07-09 23:00:09'),
	(40, 9, 'Kappiyarai ', 629156, '2014-07-09 23:00:09'),
	(41, 9, 'Kovalam ', 629702, '2014-07-09 23:00:09'),
	(42, 9, 'Kuzhithurai ', 629163, '2014-07-09 23:00:09'),
	(43, 9, 'Kuzhithurai West ', 629163, '2014-07-09 23:00:09'),
	(44, 9, 'Lekshmipuram ', 629802, '2014-07-09 23:00:09'),
	(45, 9, 'Marthandam North ', 629165, '2014-07-09 23:00:09'),
	(46, 9, 'Mullanginavilai ', 629157, '2014-07-09 23:00:09'),
	(47, 9, 'Nagercoil Bazaar ', 629001, '2014-07-09 23:00:09'),
	(48, 9, 'Nagercoil ', 629001, '2014-07-09 23:00:09'),
	(49, 9, 'Palapalam ', 629159, '2014-07-09 23:00:09'),
	(50, 9, 'Pallam ', 629601, '2014-07-09 23:00:09'),
	(51, 9, 'Palliyadi ', 629169, '2014-07-09 23:00:09'),
	(52, 9, 'Pottetty ', 629157, '2014-07-09 23:00:09'),
	(53, 9, 'Puliyurkurichi ', 629175, '2014-07-09 23:00:09'),
	(54, 9, 'Terur ', 629704, '2014-07-09 23:00:09'),
	(55, 9, 'Thazhakudy ', 629901, '2014-07-09 23:00:09'),
	(56, 9, 'Therku Thamaraikulam ', 629701, '2014-07-09 23:00:09'),
	(57, 9, 'Vadasery ', 629001, '2014-07-09 23:00:09'),
	(58, 9, 'Alampara ', 629170, '2014-07-09 23:00:09'),
	(59, 9, 'Ammandivilai ', 629204, '2014-07-09 23:00:09'),
	(60, 9, 'Anandanadarkudy ', 629201, '2014-07-09 23:00:09'),
	(61, 9, 'Aruvikkarai ', 629177, '2014-07-09 23:00:09'),
	(62, 9, 'Catherin Booth Hospital ', 629001, '2014-07-09 23:00:09'),
	(63, 9, 'Chunkankadai ', 629003, '2014-07-09 23:00:09'),
	(64, 9, 'Edalakudy ', 629002, '2014-07-09 23:00:09'),
	(65, 9, 'Enayamputhenthurai ', 629193, '2014-07-09 23:00:09'),
	(66, 9, 'Ilanchirai ', 629152, '2014-07-09 23:00:09'),
	(67, 9, 'Kappukadu ', 629162, '2014-07-09 23:00:09'),
	(68, 9, 'Karinkal ', 629157, '2014-07-09 23:00:09'),
	(69, 9, 'Kattimancode ', 629801, '2014-07-09 23:00:09'),
	(70, 9, 'Keeriparai ', 629401, '2014-07-09 23:00:09'),
	(71, 9, 'Kesavanputhenthurai ', 629501, '2014-07-09 23:00:09'),
	(72, 9, 'Kulasekharam ', 629161, '2014-07-09 23:00:09'),
	(73, 9, 'Kumarapuramthoppur ', 629402, '2014-07-09 23:00:09'),
	(74, 9, 'Mahadanapuram ', 629702, '2014-07-09 23:00:09'),
	(75, 9, 'Manakarai ', 629180, '2014-07-09 23:00:09'),
	(76, 9, 'Mangalakunnu ', 629178, '2014-07-09 23:00:09'),
	(77, 9, 'Mangavilai ', 629501, '2014-07-09 23:00:09'),
	(78, 9, 'Manivilai ', 629170, '2014-07-09 23:00:09'),
	(79, 9, 'Marthandam Bridge ', 629165, '2014-07-09 23:00:09'),
	(80, 9, 'Mathiasnagar ', 629852, '2014-07-09 23:00:09'),
	(81, 9, 'Mekkode ', 629804, '2014-07-09 23:00:09'),
	(82, 9, 'Methukummal ', 629172, '2014-07-09 23:00:09'),
	(83, 9, 'Munchirai ', 629171, '2014-07-09 23:00:09'),
	(84, 9, 'Nesamony Nagar ', 629001, '2014-07-09 23:00:09'),
	(85, 9, 'Pacode ', 629168, '2014-07-09 23:00:09'),
	(86, 9, 'Padmanabhapuram Fort ', 629175, '2014-07-09 23:00:09'),
	(87, 9, 'Pathukani ', 629101, '2014-07-09 23:00:09'),
	(88, 9, 'S.T.Mankad ', 629172, '2014-07-09 23:00:09'),
	(89, 9, 'Saral Agasteeswaram ', 629203, '2014-07-09 23:00:09'),
	(90, 9, 'Thiruvithancode ', 629174, '2014-07-09 23:00:09'),
	(91, 9, 'Thuckalay ', 629175, '2014-07-09 23:00:09'),
	(92, 9, 'Unnamalakada ', 629179, '2014-07-09 23:00:09'),
	(93, 9, 'Vaniyakudi ', 629251, '2014-07-09 23:00:09'),
	(94, 9, 'Vazhukkamparai ', 629704, '2014-07-09 23:00:09'),
	(95, 9, 'Vencode ', 629171, '2014-07-09 23:00:09'),
	(96, 9, 'Vendalicode ', 629161, '2014-07-09 23:00:09'),
	(97, 9, 'Verkilambi ', 629166, '2014-07-09 23:00:09'),
	(98, 9, 'Adaikkakuzhi ', 629153, '2014-07-09 23:00:09'),
	(99, 9, 'Asaripallam ', 629201, '2014-07-09 23:00:09'),
	(100, 9, 'Chathancode ', 629153, '2014-07-09 23:00:09'),
	(101, 9, 'Chitharal ', 629151, '2014-07-09 23:00:09'),
	(102, 9, 'Devakulam ', 629704, '2014-07-09 23:00:09'),
	(103, 9, 'Eravipudurkadai ', 629158, '2014-07-09 23:00:09'),
	(104, 9, 'Friday Market ', 629203, '2014-07-09 23:00:09'),
	(105, 9, 'Kallukoottam ', 629802, '2014-07-09 23:00:09'),
	(106, 9, 'Kalpadi ', 629204, '2014-07-09 23:00:09'),
	(107, 9, 'Kandanvilai ', 629810, '2014-07-09 23:00:09'),
	(108, 9, 'Kanjikuzhi ', 629169, '2014-07-09 23:00:09'),
	(109, 9, 'Kirathur ', 629160, '2014-07-09 23:00:09'),
	(110, 9, 'Kulasekharapuram ', 629403, '2014-07-09 23:00:09'),
	(111, 9, 'Madavalayam ', 629302, '2014-07-09 23:00:09'),
	(112, 9, 'Manavalakurichi ', 629252, '2014-07-09 23:00:09'),
	(113, 9, 'Maramalai ', 629851, '2014-07-09 23:00:09'),
	(114, 9, 'Marthandamthurai ', 629160, '2014-07-09 23:00:09'),
	(115, 9, 'Maruthemparai ', 629101, '2014-07-09 23:00:09'),
	(116, 9, 'Maruthurkurichi ', 629158, '2014-07-09 23:00:09'),
	(117, 9, 'Meppalai ', 629152, '2014-07-09 23:00:09'),
	(118, 9, 'Mukkampala ', 629164, '2014-07-09 23:00:09'),
	(119, 9, 'Mulankuzhi ', 629162, '2014-07-09 23:00:09'),
	(120, 9, 'Nallur-marthandam ', 629165, '2014-07-09 23:00:09'),
	(121, 9, 'Painkulam ', 629173, '2014-07-09 23:00:09'),
	(122, 9, 'Palukal ', 629170, '2014-07-09 23:00:09'),
	(123, 9, 'Pozhikkarai ', 629501, '2014-07-09 23:00:09'),
	(124, 9, 'Puthalam ', 629602, '2014-07-09 23:00:09'),
	(125, 9, 'Ramanthurai ', 629193, '2014-07-09 23:00:09'),
	(126, 9, 'Ramapuram ', 629302, '2014-07-09 23:00:09'),
	(127, 9, 'Ratnapuram ', 629851, '2014-07-09 23:00:09'),
	(128, 9, 'Santhapuram ', 629201, '2014-07-09 23:00:09'),
	(129, 9, 'Sooriacode ', 629153, '2014-07-09 23:00:09'),
	(130, 9, 'Thadikarankonam ', 629851, '2014-07-09 23:00:09'),
	(131, 9, 'Theruvukadai ', 629157, '2014-07-09 23:00:09'),
	(132, 9, 'Thickurichy ', 629168, '2014-07-09 23:00:09'),
	(133, 9, 'Thirupathisaram ', 629901, '2014-07-09 23:00:09'),
	(134, 9, 'Tholayavattai ', 629157, '2014-07-09 23:00:09'),
	(135, 9, 'Udayamarthandam ', 629178, '2014-07-09 23:00:09'),
	(136, 9, 'Variyoor ', 629401, '2014-07-09 23:00:09'),
	(137, 9, 'Vivekanandapuram ', 629702, '2014-07-09 23:00:09'),
	(138, 9, 'Alagiamandapam ', 629167, '2014-07-09 23:00:09'),
	(139, 9, 'Arumanallur ', 629851, '2014-07-09 23:00:09'),
	(140, 9, 'Bhoothapandy ', 629852, '2014-07-09 23:00:09'),
	(141, 9, 'Chenbagaramanputhur ', 629301, '2014-07-09 23:00:09'),
	(142, 9, 'Chenkody ', 629177, '2014-07-09 23:00:09'),
	(143, 9, 'Colachel ', 629251, '2014-07-09 23:00:09'),
	(144, 9, 'Eathamozhi ', 629501, '2014-07-09 23:00:09'),
	(145, 9, 'Gnaramvilai ', 629165, '2014-07-09 23:00:09'),
	(146, 9, 'Irenipuram ', 629162, '2014-07-09 23:00:09'),
	(147, 9, 'Isanthimangalam ', 629852, '2014-07-09 23:00:09'),
	(148, 9, 'Kannumamoodu ', 629170, '2014-07-09 23:00:09'),
	(149, 9, 'Kottar ', 629002, '2014-07-09 23:00:09'),
	(150, 9, 'Krishnancoil ', 629001, '2014-07-09 23:00:09'),
	(151, 9, 'Kumaracoil ', 629180, '2014-07-09 23:00:09'),
	(152, 9, 'Kumarapuram ', 629164, '2014-07-09 23:00:09'),
	(153, 9, 'Kurunthencode ', 629802, '2014-07-09 23:00:09'),
	(154, 9, 'Kuzhicode ', 629167, '2014-07-09 23:00:09'),
	(155, 9, 'Madathattuvilai ', 629180, '2014-07-09 23:00:09'),
	(156, 9, 'Maniankuzhi ', 629161, '2014-07-09 23:00:09'),
	(157, 9, 'Manjalumoodu ', 629151, '2014-07-09 23:00:09'),
	(158, 9, 'Maravankudiyiruppu ', 629002, '2014-07-09 23:00:09'),
	(159, 9, 'Melakrishnanputhur ', 629601, '2014-07-09 23:00:09'),
	(160, 9, 'Mondaikad ', 629252, '2014-07-09 23:00:09'),
	(161, 9, 'Moovattumugham ', 629177, '2014-07-09 23:00:09'),
	(162, 9, 'Nagercoil Town ', 629001, '2014-07-09 23:00:09'),
	(163, 9, 'North Soorankudy ', 629501, '2014-07-09 23:00:09'),
	(164, 9, 'Parvathipuram ', 629003, '2014-07-09 23:00:09'),
	(165, 9, 'Pottakulam ', 629401, '2014-07-09 23:00:09'),
	(166, 9, 'Puthenthurai ', 629501, '2014-07-09 23:00:09'),
	(167, 9, 'Thamaraikulam ', 629704, '2014-07-09 23:00:09'),
	(168, 9, 'Tiruparappu ', 629161, '2014-07-09 23:00:09'),
	(169, 9, 'Vallavilai ', 629160, '2014-07-09 23:00:09'),
	(170, 9, 'Vellachiparai ', 629152, '2014-07-09 23:00:09'),
	(171, 9, 'Alancode ', 629802, '2014-07-09 23:00:09'),
	(172, 9, 'Andirapuram ', 629851, '2014-07-09 23:00:09'),
	(173, 9, 'Arumanai ', 629151, '2014-07-09 23:00:09'),
	(174, 9, 'Asiramam ', 629704, '2014-07-09 23:00:09'),
	(175, 9, 'Azhikkal ', 629202, '2014-07-09 23:00:09'),
	(176, 9, 'Cherupallur ', 629161, '2014-07-09 23:00:09'),
	(177, 9, 'Colachel Port ', 629251, '2014-07-09 23:00:09'),
	(178, 9, 'Erachakulam ', 629901, '2014-07-09 23:00:09'),
	(179, 9, 'Erumbukadu ', 629004, '2014-07-09 23:00:09'),
	(180, 9, 'Kaniyakulam ', 629003, '2014-07-09 23:00:09'),
	(181, 9, 'Kanjampuram ', 629154, '2014-07-09 23:00:09'),
	(182, 9, 'Kanjiracode ', 629155, '2014-07-09 23:00:09'),
	(183, 9, 'Kannanore ', 629158, '2014-07-09 23:00:09'),
	(184, 9, 'Kannattuvilai ', 629802, '2014-07-09 23:00:09'),
	(185, 9, 'Keralapuram ', 629174, '2014-07-09 23:00:09'),
	(186, 9, 'Konamkadu ', 629803, '2014-07-09 23:00:09'),
	(187, 9, 'Madichel ', 629163, '2014-07-09 23:00:09'),
	(188, 9, 'Malamary ', 629152, '2014-07-09 23:00:09'),
	(189, 9, 'Meenachel ', 629153, '2014-07-09 23:00:09'),
	(190, 9, 'Mekkamandapam ', 629166, '2014-07-09 23:00:09'),
	(191, 9, 'Melamanakudy ', 629602, '2014-07-09 23:00:09'),
	(192, 9, 'Mulagumoodu ', 629167, '2014-07-09 23:00:09'),
	(193, 9, 'Muttom ', 629202, '2014-07-09 23:00:09'),
	(194, 9, 'Nagercoil Industrial Estate ', 629004, '2014-07-09 23:00:09'),
	(195, 9, 'Nagercoil West ', 629001, '2014-07-09 23:00:09'),
	(196, 9, 'Nallur ', 629704, '2014-07-09 23:00:09'),
	(197, 9, 'Nithiravilai ', 629154, '2014-07-09 23:00:09'),
	(198, 9, 'Peruvilai ', 629003, '2014-07-09 23:00:09'),
	(199, 9, 'Putheri ', 629001, '2014-07-09 23:00:09'),
	(200, 9, 'Rajakkamangalamthurai ', 629501, '2014-07-09 23:00:09'),
	(201, 9, 'Thickanamcode ', 629804, '2014-07-09 23:00:09'),
	(202, 9, 'Thuthur ', 629176, '2014-07-09 23:00:09'),
	(203, 9, 'Vanniyur ', 629163, '2014-07-09 23:00:09'),
	(204, 9, 'Veeyannur ', 629177, '2014-07-09 23:00:09'),
	(205, 9, 'Villukuri ', 629180, '2014-07-09 23:00:09'),
	(206, 9, 'Chemparuthivilai ', 629166, '2014-07-09 23:00:09'),
	(207, 9, 'Chemponvilai ', 629804, '2014-07-09 23:00:09'),
	(208, 9, 'Enayam ', 629193, '2014-07-09 23:00:09'),
	(209, 9, 'Eraviputhur ', 629402, '2014-07-09 23:00:09'),
	(210, 9, 'Ganapathipuram ', 629502, '2014-07-09 23:00:09'),
	(211, 9, 'Idaikkode ', 629152, '2014-07-09 23:00:09'),
	(212, 9, 'Irulappapuram ', 629002, '2014-07-09 23:00:09'),
	(213, 9, 'James Town ', 629401, '2014-07-09 23:00:09'),
	(214, 9, 'Karod ', 629151, '2014-07-09 23:00:09'),
	(215, 9, 'Keezhkulam ', 629193, '2014-07-09 23:00:09'),
	(216, 9, 'Killiyoor ', 629171, '2014-07-09 23:00:09'),
	(217, 9, 'Kollangodu ', 629160, '2014-07-09 23:00:09'),
	(218, 9, 'Kottaram ', 629703, '2014-07-09 23:00:09'),
	(219, 9, 'Kulapuram ', 629153, '2014-07-09 23:00:09'),
	(220, 9, 'Leepuram ', 629702, '2014-07-09 23:00:09'),
	(221, 9, 'Mancode ', 629152, '2014-07-09 23:00:09'),
	(222, 9, 'Marthandam ', 629165, '2014-07-09 23:00:09'),
	(223, 9, 'Mettukadai ', 629175, '2014-07-09 23:00:09'),
	(224, 9, 'Neyyoor ', 629802, '2014-07-09 23:00:09'),
	(225, 9, 'Neyyoor West ', 629803, '2014-07-09 23:00:09'),
	(226, 9, 'Palavilai ', 629160, '2014-07-09 23:00:09'),
	(227, 9, 'Parakkai ', 629601, '2014-07-09 23:00:09'),
	(228, 9, 'Pazhavilai ', 629501, '2014-07-09 23:00:09'),
	(229, 9, 'Pechchipparai ', 629161, '2014-07-09 23:00:09'),
	(230, 9, 'Peyankuzhi ', 629809, '2014-07-09 23:00:09'),
	(231, 9, 'Ponmanai ', 629161, '2014-07-09 23:00:09'),
	(232, 9, 'Pudukadai ', 629171, '2014-07-09 23:00:09'),
	(233, 9, 'Suchindrum ', 629704, '2014-07-09 23:00:09'),
	(234, 9, 'Thengamputhur ', 629602, '2014-07-09 23:00:09'),
	(235, 9, 'Tittivilai ', 629852, '2014-07-09 23:00:09'),
	(236, 9, 'Velimalai ', 629164, '2014-07-09 23:00:09'),
	(237, 9, 'Vellamadam ', 629302, '2014-07-09 23:00:09'),
	(238, 9, 'Vembanur ', 629801, '2014-07-09 23:00:09'),
	(239, 9, 'Agasteeswaram ', 629701, '2014-07-09 23:00:09'),
	(240, 9, 'Alanchi ', 629159, '2014-07-09 23:00:09'),
	(241, 9, 'Alancholai ', 629101, '2014-07-09 23:00:09'),
	(242, 9, 'Anjugramam ', 629401, '2014-07-09 23:00:09'),
	(243, 9, 'Arukani ', 629101, '2014-07-09 23:00:09'),
	(244, 9, 'Cheruvallur ', 629152, '2014-07-09 23:00:09'),
	(245, 9, 'Fathima Nagar ', 629160, '2014-07-09 23:00:09'),
	(246, 9, 'Kadukkarai ', 629401, '2014-07-09 23:00:09'),
	(247, 9, 'Kaliyal ', 629101, '2014-07-09 23:00:09'),
	(248, 9, 'Kodayarkilthangal ', 629102, '2014-07-09 23:00:09'),
	(249, 9, 'Malayadi ', 629153, '2014-07-09 23:00:09'),
	(250, 9, 'Manalodai ', 629161, '2014-07-09 23:00:09'),
	(251, 9, 'Mangarai ', 629157, '2014-07-09 23:00:09'),
	(252, 9, 'Mayiladi ', 629403, '2014-07-09 23:00:09'),
	(253, 9, 'Monikettipottal ', 629501, '2014-07-09 23:00:09'),
	(254, 9, 'Mulachel ', 629175, '2014-07-09 23:00:09'),
	(255, 9, 'Oluganacheri ', 629001, '2014-07-09 23:00:09'),
	(256, 9, 'Poothurai ', 629176, '2014-07-09 23:00:09'),
	(257, 9, 'Ramavarmanchirai ', 629152, '2014-07-09 23:00:09'),
	(258, 9, 'Ritapuram ', 629159, '2014-07-09 23:00:09'),
	(259, 9, 'Santhaiyadi ', 629703, '2014-07-09 23:00:09'),
	(260, 9, 'Sasthankcoilvilai ', 629704, '2014-07-09 23:00:09'),
	(261, 9, 'South Soorankudy ', 629501, '2014-07-09 23:00:09'),
	(262, 9, 'Thalakulam ', 629802, '2014-07-09 23:00:09'),
	(263, 9, 'Therekalpudur ', 629901, '2014-07-09 23:00:09'),
	(264, 9, 'Thiruthuvapuram ', 629163, '2014-07-09 23:00:09'),
	(265, 9, 'Thumbode ', 629161, '2014-07-09 23:00:09'),
	(266, 9, 'Tiruvattar ', 629177, '2014-07-09 23:00:09'),
	(267, 9, 'Urambu ', 629160, '2014-07-09 23:00:09');
/*!40000 ALTER TABLE `tbl_postal_area` ENABLE KEYS */;


-- Dumping structure for table blood_bank.tbl_states
CREATE TABLE IF NOT EXISTS `tbl_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table blood_bank.tbl_states: ~35 rows (approximately)
DELETE FROM `tbl_states`;
/*!40000 ALTER TABLE `tbl_states` DISABLE KEYS */;
INSERT INTO `tbl_states` (`id`, `name`, `timestamp`) VALUES
	(1, 'ANDHRA PRADESH\r', '2014-07-09 20:22:36'),
	(2, 'PONDICHERRY\r', '2014-07-09 20:22:36'),
	(3, 'ASSAM\r', '2014-07-09 20:22:36'),
	(4, 'BIHAR\r', '2014-07-09 20:22:36'),
	(5, 'CHATTISGARH\r', '2014-07-09 20:22:36'),
	(6, 'DELHI\r', '2014-07-09 20:22:36'),
	(7, 'GUJARAT\r', '2014-07-09 20:22:36'),
	(8, 'DAMAN & DIU\r', '2014-07-09 20:22:36'),
	(9, 'DADRA & NAGAR HAVELI\r', '2014-07-09 20:22:36'),
	(10, 'HARYANA\r', '2014-07-09 20:22:36'),
	(11, 'HIMACHAL PRADESH\r', '2014-07-09 20:22:36'),
	(12, 'JAMMU & KASHMIR\r', '2014-07-09 20:22:36'),
	(13, 'JHARKHAND\r', '2014-07-09 20:22:36'),
	(14, 'KARNATAKA\r', '2014-07-09 20:22:36'),
	(15, 'KERALA\r', '2014-07-09 20:22:36'),
	(16, 'LAKSHADWEEP\r', '2014-07-09 20:22:36'),
	(17, 'MADHYA PRADESH\r', '2014-07-09 20:22:36'),
	(18, 'MAHARASHTRA\r', '2014-07-09 20:22:36'),
	(19, 'GOA\r', '2014-07-09 20:22:36'),
	(20, 'MANIPUR\r', '2014-07-09 20:22:36'),
	(21, 'MIZORAM\r', '2014-07-09 20:22:36'),
	(22, 'NAGALAND\r', '2014-07-09 20:22:36'),
	(23, 'TRIPURA\r', '2014-07-09 20:22:36'),
	(24, 'ARUNACHAL PRADESH\r', '2014-07-09 20:22:36'),
	(25, 'MEGHALAYA\r', '2014-07-09 20:22:36'),
	(26, 'ODISHA\r', '2014-07-09 20:22:36'),
	(27, 'PUNJAB\r', '2014-07-09 20:22:36'),
	(28, 'CHANDIGARH\r', '2014-07-09 20:22:36'),
	(29, 'RAJASTHAN\r', '2014-07-09 20:22:36'),
	(30, 'TAMIL NADU\r', '2014-07-09 20:22:36'),
	(31, 'UTTAR PRADESH\r', '2014-07-09 20:22:36'),
	(32, 'UTTARAKHAND\r', '2014-07-09 20:22:36'),
	(33, 'WEST BENGAL\r', '2014-07-09 20:22:36'),
	(34, 'ANDAMAN & NICOBAR ISLANDS\r', '2014-07-09 20:22:36'),
	(35, 'SIKKIM\r', '2014-07-09 20:22:36');
/*!40000 ALTER TABLE `tbl_states` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
