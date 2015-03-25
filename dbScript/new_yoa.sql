-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2015 at 07:49 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `new_yoa`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_audit`
--

CREATE TABLE IF NOT EXISTS `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_bugs`
--

CREATE TABLE IF NOT EXISTS `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cases`
--

CREATE TABLE IF NOT EXISTS `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_contacts`
--

CREATE TABLE IF NOT EXISTS `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cstm`
--

CREATE TABLE IF NOT EXISTS `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_opportunities`
--

CREATE TABLE IF NOT EXISTS `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE IF NOT EXISTS `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_actions`
--

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('10210c8b-2923-31ec-fc24-550dc483aac5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOP_Case_Events', 'module', 90, 0),
('11057ee3-f033-b72a-af30-550dc22d7075', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Cases', 'module', 90, 0),
('116b9bab-5be1-51e2-bfa2-550dc3386bd3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Contacts', 'module', 89, 0),
('1181c001-da31-06af-b641-550dc3bb3021', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'ProspectLists', 'module', 90, 0),
('11e165f1-8e22-eabc-cae2-550dc29cbfae', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Bugs', 'module', 90, 0),
('126ee357-bc65-5269-a7f8-550dc34aa664', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Quotes', 'module', 90, 0),
('12c2611f-43c7-d550-f54c-550dc34a376e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Invoices', 'module', 90, 0),
('12f10324-55df-6fff-e57d-550eb3ab3376', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'delete', 'yo_County', 'module', 90, 0),
('13436036-d0d6-5763-5872-550dc283cd98', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Users', 'module', 90, 0),
('158c2e47-ba70-6dd1-a54f-550dc3c61fcc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Calls', 'module', 89, 0),
('1682f67a-0082-7784-588e-550dc4a8e884', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'FP_events', 'module', 90, 0),
('17873e52-4c11-e525-3cac-550dc43ab87f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOP_Case_Updates', 'module', 89, 0),
('18f3228f-b1f8-900f-1a1b-550dc3b2fa93', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Product_Categories', 'module', 90, 0),
('19a290e3-a6bb-71e1-a4b1-551023e27203', '2015-03-23 14:31:06', '2015-03-23 14:31:06', '1', '1', 'import', 'yo_Marketing', 'module', 90, 0),
('1a87c008-b724-db7e-025e-550dc3061381', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Products', 'module', 90, 0),
('1a9c89e4-2f35-b0cd-0ec7-550dc268c98c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Users', 'module', 90, 0),
('1b362719-21c9-3215-e60e-550dc3788390', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'EmailTemplates', 'module', 90, 0),
('1b3d906d-08b5-b677-fbb0-550dc24c102c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Leads', 'module', 90, 0),
('1bf2d355-5da4-e9ed-1e42-550dc37ca172', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Campaigns', 'module', 89, 0),
('1c121df7-8e64-4536-c95f-550dc35d57cc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Campaigns', 'module', 90, 0),
('1cf5074d-2918-678d-e382-550dc4d1404f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AM_ProjectHolidays', 'module', 90, 0),
('1d55114f-e2d3-a1cb-df3f-550ef3983597', '2015-03-22 16:52:15', '2015-03-22 16:52:15', '1', '1', 'edit', 'yo_AmortizationSchedule', 'module', 90, 0),
('1d91c05a-d2b5-1f1d-2ccf-550dc3071784', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Campaigns', 'module', 90, 0),
('1e1c17d5-a5b6-6d35-19fd-550dc3e52f3f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'EmailMarketing', 'module', 90, 0),
('1ec9c918-e424-0334-9e33-550dc3ba2da0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Tasks', 'module', 90, 0),
('1f221c51-9bd4-8c60-28cc-550dc354739f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Meetings', 'module', 90, 0),
('21354c5c-3daa-efa6-2357-550dc4a23872', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'jjwg_Maps', 'module', 90, 0),
('2196eecd-3a12-1a41-6517-550dc25713aa', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'ProjectTask', 'module', 89, 0),
('21a5444a-eb3c-13f7-ff7b-550ed22d6062', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'export', 'yo_InvestingEntity', 'module', 90, 0),
('21be4d84-0f06-8e08-e0a2-550dc3eb5cf6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Tasks', 'module', 90, 0),
('2228a178-d00b-30a3-44ad-550dc379b30c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'EAPM', 'module', 90, 0),
('224b03a1-fe69-2b7e-d7d5-550dc3c29bb8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Contacts', 'module', 90, 0),
('22ac3272-9e4b-90fa-3106-550dc4d79735', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'jjwg_Areas', 'module', 90, 0),
('2337cae4-c7d4-4713-dcd3-550dc35241be', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Documents', 'module', 89, 0),
('2534ab7a-4fac-67b1-f971-550dc49caf9f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AM_ProjectTemplates', 'module', 90, 0),
('265d37ce-a046-7143-f498-550dc3283967', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOR_Reports', 'module', 90, 0),
('265f046f-60de-ec72-431d-551023678cdb', '2015-03-23 14:31:06', '2015-03-23 14:31:06', '1', '1', 'delete', 'yo_Marketing', 'module', 90, 0),
('26653913-051b-ae0f-764e-550dc2a3fd44', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Bugs', 'module', 90, 0),
('2745d1bd-71fd-8423-b234-550dc490e9f2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AM_ProjectTemplates', 'module', 90, 0),
('280579d3-08e4-6011-7ff5-550dc3ba421f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Contracts', 'module', 90, 0),
('28959a47-bbdb-4277-a37d-550dc3cfb0be', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Contacts', 'module', 90, 0),
('2a272ad6-e714-873a-58bd-550eb3623c7d', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'access', 'yo_Subdivisions', 'module', 89, 0),
('2b21a4e1-23c7-f669-2e16-550dc3ec9728', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'EmailMarketing', 'module', 90, 0),
('2c579a99-8a5a-89c9-de80-550dc450eaa6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOP_Case_Updates', 'module', 90, 0),
('2cfc4012-364d-a953-16a5-550dc3c8e9fc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Notes', 'module', 90, 0),
('2d2bbf36-4799-42d6-6092-550dc3e6907a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Quotes', 'module', 90, 0),
('2e6de4e5-c3ac-d0c7-10e8-550dc30012ea', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Prospects', 'module', 90, 0),
('2e82451d-021b-6f69-609c-550dc479fb1d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOD_IndexEvent', 'module', 90, 0),
('2ebe1739-4d7c-d84e-5e6a-550dc30d3cb6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Contracts', 'module', 90, 0),
('2ecd2778-50de-44d2-39e4-550dc27a233a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Users', 'module', 90, 0),
('2edf8f87-286a-43b0-4e81-550dc38f5c88', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'ProspectLists', 'module', 90, 0),
('2f52a235-7357-86c2-a27f-550dc3fe3de8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Products', 'module', 90, 0),
('2f54b66e-6979-a348-1f2b-550dc3f20dac', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Invoices', 'module', 90, 0),
('32402163-dceb-b087-25c5-550ed2b3c292', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'list', 'yo_Sales', 'module', 90, 0),
('33000b5a-930a-91ca-5a20-550dc30e227b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOW_WorkFlow', 'module', 90, 0),
('3311e3a2-3224-11e5-b1ae-550ef33b1bd7', '2015-03-22 16:52:15', '2015-03-22 16:52:15', '1', '1', 'delete', 'yo_AmortizationSchedule', 'module', 90, 0),
('336d81cc-e64a-fd6e-c5f4-5510239b4bb3', '2015-03-23 14:31:06', '2015-03-23 14:31:06', '1', '1', 'export', 'yo_Marketing', 'module', 90, 0),
('33aaacd3-9dc3-1e78-097b-550dc363db19', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'ProspectLists', 'module', 90, 0),
('344ab1ff-2c7f-8637-6455-550dc30b7af9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Accounts', 'module', 90, 0),
('34990376-d884-b80a-5081-550dc2ba5ac2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'ProjectTask', 'module', 90, 0),
('352007a7-1e25-e3ba-85ee-550dc3ef939e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'ProspectLists', 'module', 90, 0),
('3526c58f-ef84-25df-ffed-550dc2dbe425', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'ProjectTask', 'module', 90, 0),
('3561daf9-6537-e952-af6e-550dc40fc6f7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'jjwg_Markers', 'module', 90, 0),
('35740e58-3fe6-aa94-c2c5-550dc4131efc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOD_Index', 'module', 90, 0),
('3576dc77-411c-9292-ece0-550dc323db2b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Calls_Reschedule', 'module', 90, 0),
('358d4196-5a28-4619-2ace-550dc4049eb9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AM_ProjectHolidays', 'module', 90, 0),
('36ac9793-2e6e-c663-cebb-550dc39a414c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Notes', 'module', 90, 0),
('372a0119-4152-a6e9-f162-550dc3031809', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOW_Processed', 'module', 90, 0),
('3763f7ca-bc56-accb-abe9-550dc30ecfa6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'EmailTemplates', 'module', 90, 0),
('38034bf1-167b-6573-c871-550ed2a7009c', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'massupdate', 'yo_InvestingEntity', 'module', 90, 0),
('382731a9-2b94-385c-38c5-550dc324ce95', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Meetings', 'module', 90, 0),
('383239b5-d7a4-598d-bdcd-550dc47cca42', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOP_Case_Events', 'module', 90, 0),
('389e3b3a-3cd7-c790-0638-55102316bff2', '2015-03-23 14:31:06', '2015-03-23 14:31:06', '1', '1', 'access', 'yo_Marketing', 'module', 89, 0),
('38d6cf4c-2b2b-a2da-addb-550dc46ee11f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOD_IndexEvent', 'module', 90, 0),
('394de84a-5389-246c-8ffd-550dc43e9c59', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOR_Scheduled_Reports', 'module', 90, 0),
('39570fc1-fa48-f48c-c783-550eb32418c4', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'import', 'yo_County', 'module', 90, 0),
('3a2da711-c9df-ea98-5471-550dc4b63c67', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOD_IndexEvent', 'module', 90, 0),
('3a81ff80-5b82-d67d-bb1e-550dc43e0d23', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOP_Case_Events', 'module', 90, 0),
('3adae18c-b44d-738b-ceb1-550dc3ed1b03', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOW_Processed', 'module', 90, 0),
('3adf30d8-2dd5-515d-0196-550dc28580a2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Users', 'module', 90, 0),
('3b437c42-c682-7ec0-8ba9-550dc494afc7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AM_TaskTemplates', 'module', 90, 0),
('3b60e4d4-032a-9bfb-5a99-550dc4c9f5c5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AM_TaskTemplates', 'module', 90, 0),
('3b80c703-2f08-1fee-e552-550dc4d389a4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOD_IndexEvent', 'module', 90, 0),
('3bf7a6be-ad46-5690-4556-550dc4bfd54e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'FP_events', 'module', 90, 0),
('3e38d884-b145-0275-c19f-550dc367c432', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Accounts', 'module', 90, 0),
('3eb01e07-fc7c-8518-edbd-550dc30701d4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOW_Processed', 'module', 90, 0),
('3eba138e-05ea-a595-b078-550dc488c2a3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'FP_Event_Locations', 'module', 90, 0),
('3ec7905c-2e94-7f51-a923-550dc3e89bde', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOW_WorkFlow', 'module', 89, 0),
('3ecadaa1-1f9b-3f78-2d1f-550eb31cd2da', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'view', 'yo_Subdivisions', 'module', 90, 0),
('3fc81a78-1416-aa15-c166-550dc456902a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'FP_Event_Locations', 'module', 90, 0),
('3fd12936-e635-5aa7-5940-550dc496666e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOR_Scheduled_Reports', 'module', 89, 0),
('409efde2-9297-accb-1b07-550dc4a8602d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'SecurityGroups', 'module', 90, 0),
('40f4f2a3-c092-76db-6630-550dc3ac42dd', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Tasks', 'module', 89, 0),
('41f72780-950f-cd4b-f9ef-550dc3ec1878', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Opportunities', 'module', 90, 0),
('426c4902-e266-9212-3c26-550dc2e03a57', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Bugs', 'module', 90, 0),
('429b01f5-96f8-22a7-dcbe-550dc310f20c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Tasks', 'module', 90, 0),
('42a3abff-7091-7ade-9734-550dc2869ef5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Cases', 'module', 90, 0),
('42db9755-8d78-7af8-5295-550dc39677e1', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'EAPM', 'module', 90, 0),
('430bfb7d-7274-7445-4ffa-550dc3c9945d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Calls', 'module', 90, 0),
('4347d0ea-991b-a8e5-cca3-550dc4193647', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'jjwg_Markers', 'module', 89, 0),
('43c812b5-b2a4-0d4e-1d7a-550dc331bd65', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Prospects', 'module', 90, 0),
('44ad6c09-1817-08aa-cbb2-550dc37b53c9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_PDF_Templates', 'module', 89, 0),
('44c9b7b0-680f-90f9-f0e2-550ed29e75c7', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'edit', 'yo_Sales', 'module', 90, 0),
('459d0c6f-6663-d426-d0d4-550dc3d483ab', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOW_WorkFlow', 'module', 90, 0),
('45a4f43f-0dcd-ae6c-576f-550dc4597c4d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOD_IndexEvent', 'module', 90, 0),
('463cc62e-5a8b-60ed-cd75-550dc3977071', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Meetings', 'module', 90, 0),
('463f6ef7-94ab-d78f-7e27-550dc3e2d7f3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOW_WorkFlow', 'module', 90, 0),
('46545fad-61cf-db86-5260-550dc3ef67cd', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Campaigns', 'module', 90, 0),
('46b8f69f-c68c-04e3-a108-550dc390289f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Tasks', 'module', 90, 0),
('46f1b850-7037-193b-dd00-550dc3cf96d4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Emails', 'module', 90, 0),
('472afaad-4f3c-8b77-d843-550dc376be25', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Contracts', 'module', 90, 0),
('476037f7-6256-bce6-0324-550dc39713f9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Campaigns', 'module', 90, 0),
('4772b313-b975-01fe-d7cd-550dc32440df', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Documents', 'module', 90, 0),
('478ddced-9da6-a579-d6a6-550dc4a93c27', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'FP_events', 'module', 90, 0),
('4821c703-3bda-3987-bb0e-550ef319a334', '2015-03-22 16:52:15', '2015-03-22 16:52:15', '1', '1', 'import', 'yo_AmortizationSchedule', 'module', 90, 0),
('486822e5-4e7c-f4c9-acec-550dc376b8c7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Emails', 'module', 90, 0),
('4903732e-17c2-7530-5f4c-550dc3e2b633', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Contacts', 'module', 90, 0),
('496c7c06-dbff-82a1-7903-550dc377bd96', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'EAPM', 'module', 90, 0),
('49870670-68a6-7398-2022-550dc30ef687', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Campaigns', 'module', 90, 0),
('4a36288e-841d-9771-118a-551023455fb9', '2015-03-23 14:31:06', '2015-03-23 14:31:06', '1', '1', 'massupdate', 'yo_Marketing', 'module', 90, 0),
('4ac85569-bcbc-9fb6-7eb2-550dc302a192', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Documents', 'module', 90, 0),
('4b1f9b57-2ce1-e45b-b7d6-550dc3a8bd4c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_PDF_Templates', 'module', 90, 0),
('4bd8158e-8e0a-f6f2-cf31-550dc41cba9d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'jjwg_Address_Cache', 'module', 89, 0),
('4c049117-171f-89db-779c-550dc397251e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOR_Reports', 'module', 90, 0),
('4c262314-ef92-f95d-f07e-550dc3aa578b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Prospects', 'module', 89, 0),
('4d1cad69-f4a8-cbf3-852f-550dc4882517', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOP_Case_Events', 'module', 90, 0),
('4ed2f2ec-299f-8c22-033e-550eb302299d', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'export', 'yo_County', 'module', 90, 0),
('50680108-b74b-5567-62f6-550dc38bea0f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Opportunities', 'module', 90, 0),
('507017f2-a440-cb89-acaf-550dc3d484d6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Quotes', 'module', 90, 0),
('50b2bb77-a863-4a5e-c6d0-550dc4f854d8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AM_ProjectTemplates', 'module', 90, 0),
('5176999e-8364-7495-d17b-550dc2a00af2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Cases', 'module', 89, 0),
('51850a32-4292-2ea5-4f09-550dc3262274', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_PDF_Templates', 'module', 90, 0),
('5294e291-3e85-d6eb-6c27-550dc39bbbff', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Opportunities', 'module', 90, 0),
('53192335-ef16-97ab-167c-550dc3f41cc3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'ProspectLists', 'module', 90, 0),
('531ec79c-363c-074e-90bb-550ed25dbed5', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'access', 'yo_InvestingEntity', 'module', 89, 0),
('53453594-ab6e-b7ba-c9ba-550dc4a6b349', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'SecurityGroups', 'module', 90, 0),
('53719719-007e-2efc-1c64-550dc3441bac', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Calls', 'module', 90, 0),
('538905e7-d9f6-5c40-f11f-550dc40627f6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'SecurityGroups', 'module', 90, 0),
('55f22e8c-5230-f7cb-16e0-550dc4f92eac', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AM_TaskTemplates', 'module', 90, 0),
('566c5515-79d2-d43d-0d91-550dc375e8f0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'EmailMarketing', 'module', 90, 0),
('56a20275-010e-911f-adbe-550dc4b597f9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'jjwg_Areas', 'module', 90, 0),
('571bd682-c5d8-4206-ce42-550dc3fb272f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'EAPM', 'module', 89, 0),
('576aabc3-f6c3-f748-07d4-550dc4492e40', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOD_IndexEvent', 'module', 90, 0),
('5807b14c-98cb-3f5c-4e1b-550eb3082680', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'list', 'yo_Subdivisions', 'module', 90, 0),
('587b0304-1e12-5608-b8ff-550dc41f4a4c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOD_Index', 'module', 90, 0),
('587c1472-b533-388b-817a-550ed2172a82', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'delete', 'yo_Sales', 'module', 90, 0),
('58bbd7c6-a278-dc57-f918-550dc414b394', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'jjwg_Maps', 'module', 90, 0),
('58eaf1b9-0b13-9738-91a4-550dc20c061c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Bugs', 'module', 90, 0),
('5995b51d-221e-501b-28a2-550dc3cecf0b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'EmailTemplates', 'module', 90, 0),
('59e07bc5-5f05-a7d2-1a1e-550dc376fb2a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Emails', 'module', 90, 0),
('5b8cb3d8-cf3b-15e7-885c-550dc3ce1955', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Calls_Reschedule', 'module', 90, 0),
('5cd0cd60-fbe3-ec4f-75d9-550dc4542f95', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AM_ProjectHolidays', 'module', 90, 0),
('5d03b754-bdd1-30dd-e466-550dc30288f8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Calls_Reschedule', 'module', 90, 0),
('5d20ae0f-0cff-a781-b7af-550dc38381f2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Campaigns', 'module', 90, 0),
('5d7c6f3c-0b54-9f7b-3e43-550dc424752c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOP_Case_Updates', 'module', 90, 0),
('5dfec1eb-5ac7-7aba-ae0e-550dc3517385', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Invoices', 'module', 90, 0),
('5e799088-b9c9-443e-0ab3-550dc39d2b51', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOW_Processed', 'module', 90, 0),
('5ec1b84b-f48a-e176-1f41-550dc46794f4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'SecurityGroups', 'module', 90, 0),
('5f0b409b-adfe-0483-4f00-550dc3970405', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Contracts', 'module', 89, 0),
('5fffc10b-53b3-4677-f3a8-550dc24bcef3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Users', 'module', 89, 0),
('60c5c1da-e5f3-a470-026a-550ef3bdc90c', '2015-03-22 16:52:15', '2015-03-22 16:52:15', '1', '1', 'export', 'yo_AmortizationSchedule', 'module', 90, 0),
('61bc93a0-ff46-8342-325f-550dc3b4b825', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Meetings', 'module', 89, 0),
('61f6f58d-b735-0140-8f67-550dc44d6a84', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'jjwg_Address_Cache', 'module', 90, 0),
('630dc734-97cf-4348-f3c6-550dc2ff9ff8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Project', 'module', 90, 0),
('63dd05a8-828a-25d6-8a44-550dc35339e7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Emails', 'module', 90, 0),
('649e6178-7774-c2e2-25cf-550dc31343ad', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOR_Reports', 'module', 90, 0),
('64dca2c3-0746-e41c-7493-550dc3a22472', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Product_Categories', 'module', 90, 0),
('659b6c38-852e-b60d-0cc6-550dc26ae037', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Project', 'module', 90, 0),
('66184eba-8555-3ff3-615b-550eb3a5e1b5', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'massupdate', 'yo_County', 'module', 90, 0),
('66cb67b2-b354-5d72-41ae-550dc47ac130', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AM_TaskTemplates', 'module', 90, 0),
('66d69e23-c4c6-8a8c-c667-550dc41fa335', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOD_Index', 'module', 90, 0),
('6768dfdb-8e34-c4c9-61e5-550dc3ddb303', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOW_Processed', 'module', 89, 0),
('684dc017-436e-5370-2a44-550dc469c815', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AM_ProjectTemplates', 'module', 90, 0),
('68618761-7a1d-b8dc-4d54-550dc374d3e7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Quotes', 'module', 89, 0),
('6981b8b1-2038-a3e7-7e07-550dc3df8860', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Accounts', 'module', 90, 0),
('698c09ec-ddd5-2384-e99e-550dc4a2afea', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOD_IndexEvent', 'module', 90, 0),
('69d470e6-7ad2-6e06-f211-550dc3a2b4d6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOW_WorkFlow', 'module', 90, 0),
('69f8a569-d291-a5ae-ebe6-550dc2795d01', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Project', 'module', 90, 0),
('6a50a5bb-e184-06f7-fbd5-550ed25af6f0', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'import', 'yo_Sales', 'module', 90, 0),
('6b8ec8a9-9953-2a08-09ec-550dc25aeb5b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Leads', 'module', 90, 0),
('6be65d40-ce93-9a9a-9074-550dc3fef05f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_PDF_Templates', 'module', 90, 0),
('6c11edf2-8f9e-e0c8-0d59-550dc4819f9e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOP_Case_Events', 'module', 89, 0),
('6ccc8427-7d13-2a09-9ef9-550eb343a99e', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'edit', 'yo_Subdivisions', 'module', 90, 0),
('6cd862ad-a3c0-009c-f4cc-550dc3f9a7d9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'ProspectLists', 'module', 89, 0),
('6d180cc2-2f4f-8eff-fd83-550ef347eb90', '2015-03-22 16:52:15', '2015-03-22 16:52:15', '1', '1', 'list', 'yo_AmortizationSchedule', 'module', 90, 0),
('6d1f570c-1cfb-e86b-1849-550dc44a0f4c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'jjwg_Areas', 'module', 89, 0),
('6da26537-5d00-9bc4-50b4-550dc4980725', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOR_Scheduled_Reports', 'module', 90, 0),
('6ddc5199-5179-f95d-f538-550dc3569d42', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Documents', 'module', 90, 0),
('6e4f4395-556d-a0a0-c6ca-550dc459d10a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'FP_Event_Locations', 'module', 90, 0),
('6e592be3-d5eb-188c-f711-550dc4d47ba8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'FP_Event_Locations', 'module', 89, 0),
('6e7db3f1-37a2-cdb8-7f0a-550dc2670764', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Cases', 'module', 90, 0),
('6f48d5da-c9ee-0cfc-1d90-550dc38808f9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Product_Categories', 'module', 90, 0),
('6fd6ab1c-233d-771d-6fff-550dc3bbf7de', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Contacts', 'module', 90, 0),
('708bfb92-b9ec-33f4-e631-550dc485f18d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'FP_events', 'module', 90, 0),
('70adeb70-7c48-4f18-adaa-550eb3c417b0', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'access', 'yo_County', 'module', 89, 0),
('7102df70-e3d5-6cda-8955-550dc306efd3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'EmailMarketing', 'module', 89, 0),
('724768ec-1168-78f7-18a0-550dc40e5de8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOR_Scheduled_Reports', 'module', 90, 0),
('7297b8b9-597a-506b-4a3c-550dc2986370', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Leads', 'module', 90, 0),
('7346a698-9211-c514-1029-550dc407a8ef', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'jjwg_Markers', 'module', 90, 0),
('745b985c-b4d8-3ab7-02f6-550dc32ee210', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Invoices', 'module', 90, 0),
('75ca775b-468f-da7f-235d-550ef30722bb', '2015-03-22 16:52:15', '2015-03-22 16:52:15', '1', '1', 'massupdate', 'yo_AmortizationSchedule', 'module', 90, 0),
('760aafb2-54e7-368e-ae0a-550dc21943e5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Cases', 'module', 90, 0),
('760c1409-8808-e5ae-ea26-550dc4900f2e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'jjwg_Address_Cache', 'module', 90, 0),
('772f1b7d-3e03-32ea-bce5-550dc3f9088f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Products', 'module', 90, 0),
('77652b73-2d12-c2f5-e9b3-550dc435fce8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOP_Case_Events', 'module', 90, 0),
('77d790f8-4289-44b6-9e76-550dc373508b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Notes', 'module', 90, 0),
('77f40760-ee69-1a99-df7b-550dc38cb6d6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Tasks', 'module', 90, 0),
('79ba1e16-1da6-5811-9c2c-550dc367a5be', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'EmailTemplates', 'module', 90, 0),
('7a870623-564c-d573-7bd6-550dc4104064', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AM_TaskTemplates', 'module', 90, 0),
('7b291f8c-5e32-e21a-a736-550dc4fadfa3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'FP_events', 'module', 90, 0),
('7c355fa5-9bdb-452f-19ee-550dc4b3c1c2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'jjwg_Address_Cache', 'module', 90, 0),
('7c974872-f64d-2958-2145-550dc3669bbb', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Notes', 'module', 90, 0),
('7d6e536a-0594-f924-94f0-550dc48cb0d7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'jjwg_Maps', 'module', 90, 0),
('7d86423c-24e0-f74b-c7ab-550dc4f4fb0f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AM_ProjectHolidays', 'module', 90, 0),
('7e0d9409-ad38-c441-8e38-550dc4859798', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOP_Case_Updates', 'module', 90, 0),
('7e29ae1d-4c6e-a127-32d6-550dc3509951', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Accounts', 'module', 90, 0),
('7f2b130b-4330-0a2d-ddb1-550dc3a4d2ac', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Tasks', 'module', 90, 0),
('80cb393b-3424-46aa-aaac-550dc309cfa5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOW_WorkFlow', 'module', 90, 0),
('81bb4730-c997-f188-f332-550dc4cf7df5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AM_ProjectTemplates', 'module', 90, 0),
('820baed1-e21e-a8e5-2a82-550dc31ffd18', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Prospects', 'module', 90, 0),
('84019500-cc97-6886-8dff-550dc354e8c2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Quotes', 'module', 90, 0),
('847273dc-cc65-1512-f9bc-550dc3c7f14a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'ProspectLists', 'module', 90, 0),
('848d7a37-4eae-d24f-1974-550dc3bbfd96', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'EmailTemplates', 'module', 90, 0),
('861d1b40-9902-f8fa-8b0c-550dc40a12a8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'jjwg_Markers', 'module', 90, 0),
('86915d84-30cd-ecd8-d7b0-550ed2adcaf8', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'export', 'yo_Sales', 'module', 90, 0),
('87c208c3-ab7c-0ace-d3d8-550dc2b27cdf', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Bugs', 'module', 89, 0),
('87c7399f-447a-8f4f-685d-550dc3e0313d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Calls', 'module', 90, 0),
('88adb0ef-0690-61d1-668c-550dc3d733b4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Invoices', 'module', 90, 0),
('89a9bee2-61fa-8106-d280-550dc48651a8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOD_IndexEvent', 'module', 89, 0),
('89cd2732-532e-3a8d-ce36-550eb3544702', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'delete', 'yo_Subdivisions', 'module', 90, 0),
('8aaf0b65-4f54-7642-bc63-550dc455ce8d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'FP_Event_Locations', 'module', 90, 0),
('8b430d96-7d7c-e8db-852c-550dc3b7dcd7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Calls_Reschedule', 'module', 90, 0),
('8b8607f7-127e-e2eb-d0d9-550dc38aca01', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Notes', 'module', 90, 0),
('8bb55e98-6fda-a60a-00b1-550dc32eba15', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Calls_Reschedule', 'module', 90, 0),
('8bba50a9-a5df-216a-ee5b-550dc3028296', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Products', 'module', 90, 0),
('8c150375-72f6-ae63-c858-550dc4896c21', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AM_TaskTemplates', 'module', 89, 0),
('8c86ff2c-5fc3-848a-7748-550dc3f712d3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'EmailMarketing', 'module', 90, 0),
('8d79641f-46b6-8c2d-caa1-550dc3e1cbff', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Contacts', 'module', 90, 0),
('8e05cc7e-063b-feb0-179a-550dc3d80c58', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'EmailMarketing', 'module', 90, 0),
('8e3bdebf-dc2f-4a5d-3a03-550dc2a621a7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Cases', 'module', 90, 0),
('8f6ea167-246c-eca9-8ef0-550dc4e5f155', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'jjwg_Maps', 'module', 90, 0),
('903d00e6-aa0f-a5bd-ed7a-550ef325e546', '2015-03-22 16:52:15', '2015-03-22 16:52:15', '1', '1', 'access', 'yo_AmortizationSchedule', 'module', 89, 0),
('90579949-7aac-5933-78a7-550dc3598025', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Calls', 'module', 90, 0),
('924d5829-4a43-1421-8b27-550dc36f5ca8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Meetings', 'module', 90, 0),
('93d62256-7dc0-2ecf-1e9e-550dc37945ce', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Accounts', 'module', 89, 0),
('93df11e9-4e9e-3df4-e738-550dc4fb9ebf', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'SecurityGroups', 'module', 90, 0),
('93e45699-7c20-29e0-0622-550dc21f5928', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'ProjectTask', 'module', 90, 0),
('959704d2-6f1b-7147-a0fe-550ed2248a5c', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'view', 'yo_Sales', 'module', 90, 0),
('95d2b1b5-faa2-1f6b-5b2e-550dc3631acb', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Opportunities', 'module', 90, 0),
('9613acf9-ee33-b38b-66bc-550ed24f0333', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'view', 'yo_InvestingEntity', 'module', 90, 0),
('96975dc1-7911-b089-fbba-550dc4d0871c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AM_TaskTemplates', 'module', 90, 0),
('9763830c-3650-acb2-5592-550dc3bbc4da', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Products', 'module', 90, 0),
('98080d69-63d1-e2c0-d5a9-550dc4bd81f7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOR_Scheduled_Reports', 'module', 90, 0),
('98262805-826f-b926-b62b-550dc4596f16', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'jjwg_Address_Cache', 'module', 90, 0),
('98baae8d-188a-7196-089e-550ed2bc3925', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'massupdate', 'yo_Sales', 'module', 90, 0),
('98dc7b73-c3b0-8ae6-f681-550dc45d7df0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AM_ProjectTemplates', 'module', 90, 0),
('9912c199-1967-b75a-229b-550dc3c9e0b1', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'EAPM', 'module', 90, 0),
('9948cf08-cbac-2acc-e256-550dc3360d9e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOW_Processed', 'module', 90, 0),
('99d427cd-aec6-9e62-18e4-550dc3a11f01', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Contracts', 'module', 90, 0),
('99f36a85-860c-8d50-3131-550dc31f4e46', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'EAPM', 'module', 90, 0),
('9a58b7e0-bdd4-6e84-52db-550dc3fdb887', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Prospects', 'module', 90, 0),
('9a5ea7a2-6cba-4e22-1b75-550dc4233de9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'jjwg_Address_Cache', 'module', 90, 0),
('9b18342b-c9ef-e403-60fe-550dc33457ae', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Documents', 'module', 90, 0),
('9b94a0cf-fc35-c6ff-21d8-550dc4328648', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOD_Index', 'module', 90, 0),
('9bdde347-40db-0fe3-3830-550dc43e102b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOD_Index', 'module', 90, 0),
('9bfd3584-0e76-5c24-d179-550dc2b83f7f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Bugs', 'module', 90, 0),
('9dbf9725-b317-a993-25ba-550dc4cd0a23', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'jjwg_Areas', 'module', 90, 0),
('9ecb38e6-5b88-6b1f-cb72-550dc4193681', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'jjwg_Areas', 'module', 90, 0),
('9edfd83c-8e98-983e-7ac8-550dc427a21c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'FP_Event_Locations', 'module', 90, 0),
('9fa2a87f-634d-bed4-9b71-550dc378e582', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Emails', 'module', 89, 0),
('a00de497-6844-fe60-345f-550dc38a144c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Emails', 'module', 90, 0),
('a043d0c1-a428-0d92-62cb-550dc45a3839', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'SecurityGroups', 'module', 90, 0),
('a09d908b-ab3f-5388-808d-550eb3d32d5d', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'import', 'yo_Subdivisions', 'module', 90, 0),
('a191f273-5f56-d73d-6ef5-550dc4d8ff1b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AM_ProjectHolidays', 'module', 90, 0),
('a3c95f87-a776-bd32-715c-550dc4896377', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'FP_events', 'module', 90, 0),
('a3e5b437-7d28-f53b-a144-550dc4733859', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'jjwg_Address_Cache', 'module', 90, 0),
('a463be51-b543-0640-ad23-550dc49ebbd6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'jjwg_Markers', 'module', 90, 0),
('a5b0d14e-cbe0-1d92-2c6f-550dc325d694', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Prospects', 'module', 90, 0),
('a704941c-cb1f-e4ed-3003-550dc3747331', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_PDF_Templates', 'module', 90, 0),
('a7055476-e539-16f9-3c39-550dc304e595', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOR_Reports', 'module', 90, 0),
('a7210f59-9990-3a99-07af-550dc3ab1b11', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_PDF_Templates', 'module', 90, 0),
('a7c5f512-93e4-1e4f-4c2e-550dc3c40596', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Opportunities', 'module', 90, 0),
('a7f7b602-9eea-da47-ae99-550ed23bece6', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'list', 'yo_InvestingEntity', 'module', 90, 0),
('a8d210be-3660-2564-1cbc-550dc368d677', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOR_Reports', 'module', 89, 0),
('a952947a-ec79-80ab-6c76-550dc3c32d44', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOW_WorkFlow', 'module', 90, 0),
('aa67a818-f138-07f1-a4d3-550dc4cf5675', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'jjwg_Maps', 'module', 90, 0),
('aa8c99b8-ea47-e34a-170b-550dc4db4e92', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOP_Case_Events', 'module', 90, 0),
('ab3b4f90-7343-3d40-07e1-55102321b2b9', '2015-03-23 14:31:06', '2015-03-23 14:31:06', '1', '1', 'view', 'yo_Marketing', 'module', 90, 0),
('ac29da29-4599-2628-9ea8-550dc4ec9c84', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOP_Case_Updates', 'module', 90, 0),
('acb67560-e8e5-f3e5-f548-550dc2e2c86f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Users', 'module', 90, 0),
('acb94d13-9fe7-d1c0-d7ee-550dc35d37ec', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Opportunities', 'module', 90, 0),
('aed17319-9edb-dc77-e847-550dc3be31b4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOR_Reports', 'module', 90, 0),
('af478c17-69de-08e1-b52e-550dc2bb7da0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Users', 'module', 90, 0),
('afc0d55b-62e1-694a-23b3-550dc3e88c80', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'EmailTemplates', 'module', 90, 0),
('b047b61a-d019-c078-efbb-550dc3e3f4d3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Contacts', 'module', 90, 0),
('b06ec33e-4ba2-2da6-a9aa-550eb3d0ccee', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'view', 'yo_County', 'module', 90, 0),
('b0d6981a-1852-2426-dfd7-550dc3527889', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Documents', 'module', 90, 0),
('b1724698-4a22-8fc1-a84a-550dc45360d9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AM_ProjectHolidays', 'module', 90, 0),
('b1dc3674-079f-7f0c-c905-550dc4fea6e0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'FP_events', 'module', 89, 0),
('b3aa66fe-417b-59a5-3e84-550dc2b42aff', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Project', 'module', 89, 0),
('b3e0edf2-ee52-a12e-91ee-550eb3d13962', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'export', 'yo_Subdivisions', 'module', 90, 0),
('b40f08d9-c3e3-f643-2c16-550dc352b29b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Invoices', 'module', 89, 0),
('b4d462a3-7fe7-c37e-ce3f-550dc4a8d626', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'jjwg_Address_Cache', 'module', 90, 0),
('b5547dad-93a9-08c3-70fb-550dc25a0069', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'ProjectTask', 'module', 90, 0),
('b5f11169-ae7d-c130-006d-550dc29d5509', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Leads', 'module', 90, 0),
('b5ffea63-a9cd-8386-3c27-550dc3e74c26', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Quotes', 'module', 90, 0),
('b66d0526-e65c-4b03-94bf-550dc4a348cd', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'jjwg_Areas', 'module', 90, 0),
('b735bce3-6ed5-efcd-a8b5-550dc349c598', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOW_Processed', 'module', 90, 0),
('b88a6548-1992-573f-27f7-550dc2a9de7e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Leads', 'module', 89, 0),
('b9c99dbb-41cb-66b5-3236-550dc3a13be6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Product_Categories', 'module', 90, 0),
('b9f9202b-f2f5-bb72-b4ab-550dc3790c58', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Contracts', 'module', 90, 0),
('ba46eeea-db7d-842a-ad61-550dc4a92ccb', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOP_Case_Updates', 'module', 90, 0),
('bb0c232e-8b40-e5f8-9370-550dc3823f39', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Meetings', 'module', 90, 0),
('bb1431af-5e23-a9fa-8910-550dc3bb49f0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Product_Categories', 'module', 90, 0),
('bc070b73-0323-7656-edbd-550ed2259535', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'import', 'yo_InvestingEntity', 'module', 90, 0),
('bdf14402-f231-e887-5e71-550dc3187cb6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Accounts', 'module', 90, 0),
('be7c4b5e-4d35-c51f-94d8-550dc3fbfabc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Campaigns', 'module', 90, 0),
('be9fed4e-f46a-7ca3-4aa6-550dc32e0871', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Invoices', 'module', 90, 0),
('bec9b3b7-335a-2754-bc41-550dc43354dc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AM_ProjectTemplates', 'module', 90, 0),
('bf8e2e47-0f1e-a3ed-b047-550dc3e1f43f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Product_Categories', 'module', 90, 0),
('c1de0bb1-9df6-0255-b7b0-550dc4e549fa', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'FP_Event_Locations', 'module', 90, 0),
('c26f7c60-cd4e-16df-6cd3-550dc38d0565', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Accounts', 'module', 90, 0),
('c27a56fc-19ae-399d-f0ed-550dc4828715', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'jjwg_Maps', 'module', 90, 0),
('c30409aa-87a3-9fb9-dbce-550dc3f33d8c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOR_Reports', 'module', 90, 0),
('c4170a7b-66bf-3d9d-52a7-550dc4af93a0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOD_Index', 'module', 89, 0),
('c518f402-64fe-b0eb-3aef-550dc3ae8bbe', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'ProspectLists', 'module', 90, 0),
('c55e1d21-0a89-4e3a-2bfe-550dc2570420', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Project', 'module', 90, 0),
('c5c100d3-4ca6-8620-a484-550dc264f6a6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Leads', 'module', 90, 0),
('c6378619-24e2-8613-e74e-550dc4aa5351', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'jjwg_Markers', 'module', 90, 0),
('c63dc1de-fabf-92e6-f987-550eb3fda3c1', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'list', 'yo_County', 'module', 90, 0),
('c66956d4-1e79-15d3-e26d-550dc4242cb6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AM_TaskTemplates', 'module', 90, 0),
('c674383a-5344-60bc-4478-550dc30cee93', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Meetings', 'module', 90, 0),
('c6993049-82a6-a794-82a3-550eb395520d', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'massupdate', 'yo_Subdivisions', 'module', 90, 0),
('c6e35c68-5b69-8918-2b78-550dc37aebf7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Notes', 'module', 90, 0),
('c6f63f71-f0b5-e3fc-09ff-550dc3c7dfc9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Calls_Reschedule', 'module', 90, 0),
('c70527cc-5a4a-c5a1-b16a-550ed24fd38e', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'edit', 'yo_InvestingEntity', 'module', 90, 0),
('c7083a48-1ba1-22e6-aaeb-550dc2dc6016', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Leads', 'module', 90, 0),
('c79238d4-7087-edff-0fa4-550dc4c09449', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'SecurityGroups', 'module', 89, 0),
('c7f10b57-1c8c-8062-1c67-550dc291a134', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Users', 'module', 90, 0),
('c8000cd9-53ba-a533-c826-550dc4ff07d9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOR_Scheduled_Reports', 'module', 90, 0),
('c8e0bef4-fbec-7c5f-064f-550dc35da310', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Tasks', 'module', 90, 0),
('c932e71a-7415-72b3-5d13-550dc3a34441', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'EmailMarketing', 'module', 90, 0),
('c9a307ae-6b46-2c6e-bdf0-550dc3a7506b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Prospects', 'module', 90, 0),
('ca735291-2045-e3ce-efcd-550dc4576897', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOD_Index', 'module', 90, 0),
('cb1119df-9492-0738-c5ac-550dc361c7c2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Notes', 'module', 89, 0),
('cb8b6110-b2bf-3439-06f1-550dc305ba55', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOW_WorkFlow', 'module', 90, 0),
('cc34e422-fcc1-78b4-bc25-550dc4cb551f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOR_Scheduled_Reports', 'module', 90, 0),
('cc3b45e0-5472-a6fa-3a9c-550dc35e9f49', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'EAPM', 'module', 90, 0),
('cc7d4326-2adc-8aa7-94bb-550dc421bef0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOD_Index', 'module', 90, 0),
('cc9400ac-c937-185b-8a82-5510237dc023', '2015-03-23 14:31:06', '2015-03-23 14:31:06', '1', '1', 'list', 'yo_Marketing', 'module', 90, 0),
('ce1a0405-3a59-b45a-5261-550dc4ca2e10', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'FP_Event_Locations', 'module', 90, 0),
('ce3223d9-de20-09df-e5d1-550dc396f40f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Calls', 'module', 90, 0),
('cf1d0212-d2aa-9e7a-1165-550dc33ddf29', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'EmailTemplates', 'module', 90, 0),
('d169fbf7-3837-0256-4cc2-550dc31a0c73', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Quotes', 'module', 90, 0),
('d1702085-41b0-2c17-238c-550dc3c91945', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Products', 'module', 90, 0),
('d239f2cf-5718-0097-54b2-550dc4464e7e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'jjwg_Areas', 'module', 90, 0),
('d2a5deae-6129-7f0d-d05a-550dc3100f6c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Contacts', 'module', 90, 0),
('d3cc6ec1-27b6-fb6d-ed43-550dc3685927', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Invoices', 'module', 90, 0),
('d469ac24-4685-5401-38ea-550dc44ad0b0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'jjwg_Markers', 'module', 90, 0),
('d4c04595-2e77-8e3a-b647-550dc4d47763', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOP_Case_Events', 'module', 90, 0),
('d4c6c2b8-cbc5-22dc-cbea-550dc43aaae4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AM_ProjectHolidays', 'module', 89, 0),
('d5acbe86-e171-4086-1d49-550dc42251b1', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOR_Scheduled_Reports', 'module', 90, 0);
INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('d5cfff28-ebc5-33da-776d-550dc3efe09d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'EmailTemplates', 'module', 89, 0),
('d6071bc3-7a61-e554-ed80-550dc3d0578d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOR_Reports', 'module', 90, 0),
('d6ff67a1-c2cc-ca93-e74e-550dc3900b9d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'EmailMarketing', 'module', 90, 0),
('d7560082-03e9-1e41-962d-550dc4b72701', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'jjwg_Markers', 'module', 90, 0),
('d7fe3517-5b7e-7a10-797a-550dc2c62421', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Cases', 'module', 90, 0),
('d8505e22-d29c-1b1c-eea6-550dc4e6146b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'FP_events', 'module', 90, 0),
('d8aa7290-7e8e-72a6-9449-550dc26a2150', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'ProjectTask', 'module', 90, 0),
('da7a162a-2211-c761-0aac-550dc47dfe40', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOP_Case_Updates', 'module', 90, 0),
('dafec564-d904-bf94-03c7-550dc4b684d1', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'jjwg_Maps', 'module', 89, 0),
('db7dc2e2-4468-9a86-4dd2-550eb361528c', '2015-03-22 12:19:13', '2015-03-22 12:19:13', '1', '1', 'edit', 'yo_County', 'module', 90, 0),
('dc2d03a0-e024-c19a-581d-550dc39dc11d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_PDF_Templates', 'module', 90, 0),
('dc85b658-ef7d-2618-c976-550dc348c0a0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Calls_Reschedule', 'module', 89, 0),
('de27edd6-1512-351d-5616-550dc38755be', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Contracts', 'module', 90, 0),
('de75a099-ff3a-ae16-1c61-550dc34be0f2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Notes', 'module', 90, 0),
('de7e014b-259e-d555-4b08-550dc30165d2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Documents', 'module', 90, 0),
('de8520a1-5a69-431f-57a6-550dc262fed7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Bugs', 'module', 90, 0),
('dea91d1e-6216-1972-6eda-550dc421cf11', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'jjwg_Maps', 'module', 90, 0),
('df2bd5e9-d76c-7a02-00b0-550dc48ab77e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'SecurityGroups', 'module', 90, 0),
('df9bf845-e7d3-5cd9-731b-550dc255c880', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Project', 'module', 90, 0),
('dff37231-70cf-38a9-8a3d-550dc2c722d7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Project', 'module', 90, 0),
('e05d07fa-7dae-9718-a343-550dc3068e5c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'EAPM', 'module', 90, 0),
('e14314e4-f228-bc40-babc-550dc33411b8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Calls_Reschedule', 'module', 90, 0),
('e15adca7-7020-2df1-5624-550dc4562b6d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AM_ProjectHolidays', 'module', 90, 0),
('e1b13442-33bc-4a56-a3ba-550dc3fba6e6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'ProjectTask', 'module', 90, 0),
('e1b94263-6915-00de-4644-550dc39e2044', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Emails', 'module', 90, 0),
('e2496d2b-d24a-357b-6ab8-550dc484cf00', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AM_ProjectTemplates', 'module', 89, 0),
('e2521c6d-d5f2-e215-89e2-5510237f3817', '2015-03-23 14:31:06', '2015-03-23 14:31:06', '1', '1', 'edit', 'yo_Marketing', 'module', 90, 0),
('e323e3c2-20d5-f938-518f-550dc345756f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Opportunities', 'module', 89, 0),
('e342653a-91e8-0982-b2b7-550dc31c863b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOW_Processed', 'module', 90, 0),
('e384ac45-3e29-04af-9943-550dc2f34d09', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Cases', 'module', 90, 0),
('e4f454ee-d2cd-61dd-6fbb-550dc320de27', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Products', 'module', 90, 0),
('e53d5482-2d09-2f3a-96e0-550dc3ba89da', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Emails', 'module', 90, 0),
('e62db129-06ce-7747-46c7-550ef3a0f151', '2015-03-22 16:52:15', '2015-03-22 16:52:15', '1', '1', 'view', 'yo_AmortizationSchedule', 'module', 90, 0),
('e7425c48-c433-8d8d-0cae-550ed200598d', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'delete', 'yo_InvestingEntity', 'module', 90, 0),
('e7a90aed-99de-c34b-ffd8-550dc3c7f41d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Product_Categories', 'module', 90, 0),
('e7cea3ab-336f-bc95-be02-550dc3b62569', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Contracts', 'module', 90, 0),
('e88add10-c69a-ddb6-6789-550ed2acffd1', '2015-03-22 14:31:57', '2015-03-22 14:31:57', '1', '1', 'access', 'yo_Sales', 'module', 89, 0),
('e941c05a-b828-4bbf-374a-550dc3a701d8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Documents', 'module', 90, 0),
('e9b3229f-fdf8-1557-b209-550dc328791d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Products', 'module', 89, 0),
('e9c49d38-ec0c-2b4d-43c3-550dc345a7c4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Product_Categories', 'module', 89, 0),
('ea3cc61a-15ea-0db6-105e-550dc2741f84', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Project', 'module', 90, 0),
('eb948ac8-b04d-7ff3-b9a7-550dc35dc5ea', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Calls', 'module', 90, 0),
('ecf7610f-08b3-00e1-a968-550dc32aa169', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Quotes', 'module', 90, 0),
('ed3dd3d9-b4b4-2ce3-6220-550dc3dc77fc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Calls', 'module', 90, 0),
('ef99d8ed-cfa5-32f0-3339-550dc3e29f0b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Prospects', 'module', 90, 0),
('efbc8c6a-bf38-3eca-c245-550dc4e96238', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'jjwg_Areas', 'module', 90, 0),
('f002db09-26d2-6c49-99b0-550dc3b7f775', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Accounts', 'module', 90, 0),
('f0857057-0d2b-ddb8-1844-550dc4ba5114', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOP_Case_Updates', 'module', 90, 0),
('f09ee746-8579-c161-f13b-550dc21fa6ce', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'ProjectTask', 'module', 90, 0),
('f146fa04-ed01-d04f-172b-550dc363956a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_PDF_Templates', 'module', 90, 0),
('f2883776-a952-c3d3-d765-550dc34ffb1e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Meetings', 'module', 90, 0),
('f3c41804-2621-c296-fb23-550dc2d01b50', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Leads', 'module', 90, 0),
('f3e018c5-de07-342c-f5fa-550dc325211d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Opportunities', 'module', 90, 0),
('f9870343-3740-f4c5-f0c8-550dc2a47638', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Bugs', 'module', 90, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles`
--

CREATE TABLE IF NOT EXISTS `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_actions`
--

CREATE TABLE IF NOT EXISTS `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_users`
--

CREATE TABLE IF NOT EXISTS `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projectholidays`
--

CREATE TABLE IF NOT EXISTS `am_projectholidays` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `resourse_users` varchar(100) DEFAULT 'Contacts',
  `resource_id` varchar(36) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projectholidays_audit`
--

CREATE TABLE IF NOT EXISTS `am_projectholidays_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_projectholidays_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projectholidays_project_c`
--

CREATE TABLE IF NOT EXISTS `am_projectholidays_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projectholidays_projectproject_ida` varchar(36) DEFAULT NULL,
  `am_projectholidays_projectam_projectholidays_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projectholidays_project_ida1` (`am_projectholidays_projectproject_ida`),
  KEY `am_projectholidays_project_alt` (`am_projectholidays_projectam_projectholidays_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `priority` varchar(100) DEFAULT 'High',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_audit`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_projecttemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_project_1_c`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `priority` varchar(100) DEFAULT 'High',
  `percent_complete` varchar(255) DEFAULT NULL,
  `predecessors` int(255) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT '0',
  `relationship_type` varchar(100) DEFAULT 'FS',
  `task_number` int(255) DEFAULT NULL,
  `order_number` int(255) DEFAULT NULL,
  `estimated_effort` int(255) DEFAULT NULL,
  `utilization` varchar(100) DEFAULT '0',
  `duration` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates_am_projecttemplates_c`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates_audit`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_tasktemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_index`
--

CREATE TABLE IF NOT EXISTS `aod_index` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `last_optimised` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aod_index`
--

INSERT INTO `aod_index` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `last_optimised`, `location`) VALUES
('1', 'Index', '2015-03-21 19:30:25', '2015-03-21 19:30:25', '1', '1', NULL, 0, NULL, NULL, 'modules/AOD_Index/Index/Index');

-- --------------------------------------------------------

--
-- Table structure for table `aod_indexevent`
--

CREATE TABLE IF NOT EXISTS `aod_indexevent` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `success` tinyint(1) DEFAULT '0',
  `record_id` char(36) DEFAULT NULL,
  `record_module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record_module` (`record_module`),
  KEY `idx_record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_indexevent_audit`
--

CREATE TABLE IF NOT EXISTS `aod_indexevent_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aod_indexevent_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_index_audit`
--

CREATE TABLE IF NOT EXISTS `aod_index_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aod_index_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_events`
--

CREATE TABLE IF NOT EXISTS `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_events_audit`
--

CREATE TABLE IF NOT EXISTS `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_updates`
--

CREATE TABLE IF NOT EXISTS `aop_case_updates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_updates_audit`
--

CREATE TABLE IF NOT EXISTS `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_updates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_charts`
--

CREATE TABLE IF NOT EXISTS `aor_charts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `x_field` int(11) DEFAULT NULL,
  `y_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_conditions`
--

CREATE TABLE IF NOT EXISTS `aor_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parameter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_conditions_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_fields`
--

CREATE TABLE IF NOT EXISTS `aor_fields` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `field_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `field_function` varchar(100) DEFAULT NULL,
  `sort_by` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `group_by` tinyint(1) DEFAULT NULL,
  `group_order` varchar(100) DEFAULT NULL,
  `group_display` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_fields_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_reports`
--

CREATE TABLE IF NOT EXISTS `aor_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `report_module` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_reports_audit`
--

CREATE TABLE IF NOT EXISTS `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aor_reports_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_scheduled_reports`
--

CREATE TABLE IF NOT EXISTS `aor_scheduled_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `schedule` varchar(100) DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email_recipients` longtext,
  `aor_report_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts`
--

CREATE TABLE IF NOT EXISTS `aos_contracts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `total_contract_value_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT 'Type',
  `contract_account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_aos_products_1_c`
--

CREATE TABLE IF NOT EXISTS `aos_contracts_aos_products_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_aos_products_1aos_contracts_ida` varchar(36) DEFAULT NULL,
  `aos_contracts_aos_products_1aos_products_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_aos_products_1_ida1` (`aos_contracts_aos_products_1aos_contracts_ida`),
  KEY `aos_contracts_aos_products_1_alt` (`aos_contracts_aos_products_1aos_products_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_audit`
--

CREATE TABLE IF NOT EXISTS `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_contracts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_documents`
--

CREATE TABLE IF NOT EXISTS `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_invoices`
--

CREATE TABLE IF NOT EXISTS `aos_invoices` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `quote_number` int(11) DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `template_ddown_c` text,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_invoices_audit`
--

CREATE TABLE IF NOT EXISTS `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_invoices_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_line_item_groups`
--

CREATE TABLE IF NOT EXISTS `aos_line_item_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_line_item_groups_audit`
--

CREATE TABLE IF NOT EXISTS `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_line_item_groups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_pdf_templates`
--

CREATE TABLE IF NOT EXISTS `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `type` varchar(100) DEFAULT NULL,
  `pdfheader` text,
  `pdffooter` text,
  `margin_left` int(255) DEFAULT '15',
  `margin_right` int(255) DEFAULT '15',
  `margin_top` int(255) DEFAULT '16',
  `margin_bottom` int(255) DEFAULT '16',
  `margin_header` int(255) DEFAULT '9',
  `margin_footer` int(255) DEFAULT '9',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_pdf_templates_audit`
--

CREATE TABLE IF NOT EXISTS `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_pdf_templates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products`
--

CREATE TABLE IF NOT EXISTS `aos_products` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `maincode` varchar(100) DEFAULT 'XXXX',
  `part_number` varchar(25) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `cost_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `price_usdollar` decimal(26,6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `aos_product_category_id` char(36) DEFAULT NULL,
  `access_id` varchar(255) DEFAULT NULL,
  `property_taxes` decimal(26,6) DEFAULT NULL,
  `camping` varchar(255) DEFAULT NULL,
  `delinquent_taxes` decimal(26,6) DEFAULT NULL,
  `delinquent_taxes_confirmed` varchar(255) DEFAULT NULL,
  `disclosure_statement` varchar(1024) DEFAULT NULL,
  `elevation` varchar(255) DEFAULT NULL,
  `final_visit_count` varchar(255) DEFAULT NULL,
  `gis_map` varchar(255) DEFAULT NULL,
  `gmap` varchar(255) DEFAULT NULL,
  `gross_offer` decimal(26,6) DEFAULT NULL,
  `road_access` varchar(100) DEFAULT NULL,
  `manufactured_homes` varchar(100) DEFAULT NULL,
  `legal_access` varchar(100) DEFAULT NULL,
  `property_use_2` varchar(100) DEFAULT NULL,
  `property_use_5` text,
  `property_category_3` varchar(100) DEFAULT NULL,
  `time_to_build` varchar(100) DEFAULT NULL,
  `power` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `legal_description` text,
  `poa_fee` varchar(255) DEFAULT 'N/A',
  `property_use_6` text,
  `property_category_2` varchar(100) DEFAULT NULL,
  `property_address` varchar(255) DEFAULT NULL,
  `restrictions` varchar(100) DEFAULT NULL,
  `sewer` varchar(100) DEFAULT NULL,
  `survey` varchar(255) DEFAULT NULL,
  `search_location` varchar(100) DEFAULT NULL,
  `situs_state` varchar(100) DEFAULT NULL,
  `state_region` varchar(100) DEFAULT NULL,
  `township_range_section` varchar(255) DEFAULT NULL,
  `water` varchar(100) DEFAULT NULL,
  `zoning` text,
  `property_address_city` varchar(100) DEFAULT NULL,
  `property_address_state` varchar(100) DEFAULT NULL,
  `property_address_postalcode` varchar(20) DEFAULT NULL,
  `property_address_country` varchar(100) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `property_use_4` text,
  `property_use_3` varchar(100) DEFAULT NULL,
  `property_use_1` varchar(100) DEFAULT NULL,
  `property_category` varchar(100) DEFAULT NULL,
  `phase` varchar(100) DEFAULT 'Acquisitions',
  `paid_for` tinyint(1) DEFAULT '0',
  `net_offer` decimal(26,6) DEFAULT NULL,
  `needs_offer` date DEFAULT NULL,
  `make_offer` tinyint(1) DEFAULT '1',
  `lot_sq_ft` varchar(255) DEFAULT NULL,
  `lot_acres` varchar(255) DEFAULT NULL,
  `loction_longitude` varchar(25) DEFAULT NULL,
  `location_latitude` varchar(25) DEFAULT NULL,
  `hoa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aos_products`
--

INSERT INTO `aos_products` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `maincode`, `part_number`, `category`, `type`, `cost`, `cost_usdollar`, `currency_id`, `price`, `price_usdollar`, `url`, `contact_id`, `product_image`, `aos_product_category_id`, `access_id`, `property_taxes`, `camping`, `delinquent_taxes`, `delinquent_taxes_confirmed`, `disclosure_statement`, `elevation`, `final_visit_count`, `gis_map`, `gmap`, `gross_offer`, `road_access`, `manufactured_homes`, `legal_access`, `property_use_2`, `property_use_5`, `property_category_3`, `time_to_build`, `power`, `status`, `legal_description`, `poa_fee`, `property_use_6`, `property_category_2`, `property_address`, `restrictions`, `sewer`, `survey`, `search_location`, `situs_state`, `state_region`, `township_range_section`, `water`, `zoning`, `property_address_city`, `property_address_state`, `property_address_postalcode`, `property_address_country`, `rank`, `property_use_4`, `property_use_3`, `property_use_1`, `property_category`, `phase`, `paid_for`, `net_offer`, `needs_offer`, `make_offer`, `lot_sq_ft`, `lot_acres`, `loction_longitude`, `location_latitude`, `hoa`) VALUES
('d9daa91c-d36a-57c3-84c8-5512f851a4fe', '123123123', '2015-03-25 18:02:40', '2015-03-25 18:02:40', '1', '1', '', 0, NULL, 'XXXX', NULL, NULL, 'Good', '0.000000', '0.000000', '-99', '23423432.000000', '23423432.000000', '', '', NULL, NULL, NULL, '0.000000', '', '0.000000', '', 'http://', '', NULL, 'http://', '', '0.000000', '', '', '', '', '', '', '', '', NULL, 'frferfrefrefe', 'N/A', '', '', '', '', '', 'http://', '', 'Arizona', '', '', '', '', '', NULL, '', NULL, '', '', NULL, '', '', 'Marketing', 0, '0.000000', NULL, 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_accounts_1_c`
--

CREATE TABLE IF NOT EXISTS `aos_products_accounts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_products_accounts_1aos_products_ida` varchar(36) DEFAULT NULL,
  `aos_products_accounts_1accounts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_products_accounts_1_alt` (`aos_products_accounts_1aos_products_ida`,`aos_products_accounts_1accounts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_audit`
--

CREATE TABLE IF NOT EXISTS `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_calls_1_c`
--

CREATE TABLE IF NOT EXISTS `aos_products_calls_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_products_calls_1aos_products_ida` varchar(36) DEFAULT NULL,
  `aos_products_calls_1calls_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_products_calls_1_ida1` (`aos_products_calls_1aos_products_ida`),
  KEY `aos_products_calls_1_alt` (`aos_products_calls_1calls_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_documents_1_c`
--

CREATE TABLE IF NOT EXISTS `aos_products_documents_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_products_documents_1aos_products_ida` varchar(36) DEFAULT NULL,
  `aos_products_documents_1documents_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_products_documents_1_alt` (`aos_products_documents_1aos_products_ida`,`aos_products_documents_1documents_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_meetings_1_c`
--

CREATE TABLE IF NOT EXISTS `aos_products_meetings_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_products_meetings_1aos_products_ida` varchar(36) DEFAULT NULL,
  `aos_products_meetings_1meetings_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_products_meetings_1_ida1` (`aos_products_meetings_1aos_products_ida`),
  KEY `aos_products_meetings_1_alt` (`aos_products_meetings_1meetings_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_notes_1_c`
--

CREATE TABLE IF NOT EXISTS `aos_products_notes_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_products_notes_1aos_products_ida` varchar(36) DEFAULT NULL,
  `aos_products_notes_1notes_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_products_notes_1_ida1` (`aos_products_notes_1aos_products_ida`),
  KEY `aos_products_notes_1_alt` (`aos_products_notes_1notes_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_quotes`
--

CREATE TABLE IF NOT EXISTS `aos_products_quotes` (
  `id` char(36) NOT NULL,
  `name` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `item_description` text,
  `number` int(11) DEFAULT NULL,
  `product_qty` decimal(18,4) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_cost_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_list_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `product_unit_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `vat_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `product_total_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) DEFAULT '5.0',
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_quotes_audit`
--

CREATE TABLE IF NOT EXISTS `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_tasks_1_c`
--

CREATE TABLE IF NOT EXISTS `aos_products_tasks_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_products_tasks_1aos_products_ida` varchar(36) DEFAULT NULL,
  `aos_products_tasks_1tasks_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_products_tasks_1_ida1` (`aos_products_tasks_1aos_products_ida`),
  KEY `aos_products_tasks_1_alt` (`aos_products_tasks_1tasks_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_yo_marketing_1_c`
--

CREATE TABLE IF NOT EXISTS `aos_products_yo_marketing_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_products_yo_marketing_1aos_products_ida` varchar(36) DEFAULT NULL,
  `aos_products_yo_marketing_1yo_marketing_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_products_yo_marketing_1_ida1` (`aos_products_yo_marketing_1aos_products_ida`),
  KEY `aos_products_yo_marketing_1_alt` (`aos_products_yo_marketing_1yo_marketing_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_product_categories`
--

CREATE TABLE IF NOT EXISTS `aos_product_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '0',
  `parent_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_product_categories_audit`
--

CREATE TABLE IF NOT EXISTS `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_product_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes`
--

CREATE TABLE IF NOT EXISTS `aos_quotes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `approval_issue` text,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int(11) NOT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `template_ddown_c` text,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `stage` varchar(100) DEFAULT 'Draft',
  `term` varchar(100) DEFAULT NULL,
  `terms_c` text,
  `approval_status` varchar(100) DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_audit`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_project_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_actions`
--

CREATE TABLE IF NOT EXISTS `aow_actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `action_order` int(255) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `parameters` longtext,
  PRIMARY KEY (`id`),
  KEY `aow_action_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_conditions`
--

CREATE TABLE IF NOT EXISTS `aow_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_processed`
--

CREATE TABLE IF NOT EXISTS `aow_processed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  KEY `aow_processed_index_status` (`status`),
  KEY `aow_processed_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_processed_aow_actions`
--

CREATE TABLE IF NOT EXISTS `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_workflow`
--

CREATE TABLE IF NOT EXISTS `aow_workflow` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `flow_module` varchar(100) DEFAULT NULL,
  `flow_run_on` varchar(100) DEFAULT '0',
  `status` varchar(100) DEFAULT 'Active',
  `run_when` varchar(100) DEFAULT 'Create',
  `multiple_runs` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aow_workflow_index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_workflow_audit`
--

CREATE TABLE IF NOT EXISTS `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aow_workflow_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_audit`
--

CREATE TABLE IF NOT EXISTS `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE IF NOT EXISTS `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_contacts`
--

CREATE TABLE IF NOT EXISTS `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_leads`
--

CREATE TABLE IF NOT EXISTS `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_reschedule`
--

CREATE TABLE IF NOT EXISTS `calls_reschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_reschedule_audit`
--

CREATE TABLE IF NOT EXISTS `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_calls_reschedule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_users`
--

CREATE TABLE IF NOT EXISTS `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_audit`
--

CREATE TABLE IF NOT EXISTS `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_log`
--

CREATE TABLE IF NOT EXISTS `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_trkrs`
--

CREATE TABLE IF NOT EXISTS `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE IF NOT EXISTS `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Open',
  `contact_created_by_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cases_audit`
--

CREATE TABLE IF NOT EXISTS `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_bugs`
--

CREATE TABLE IF NOT EXISTS `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_cstm`
--

CREATE TABLE IF NOT EXISTS `cases_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('notify', 'fromaddress', 'do_not_reply@example.com'),
('notify', 'fromname', 'SuiteCRM'),
('notify', 'send_by_default', '1'),
('notify', 'on', '1'),
('notify', 'send_from_assigning_user', '0'),
('info', 'sugar_version', '6.5.20'),
('MySettings', 'tab', 'YTozODp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6MTA6IkFPU19RdW90ZXMiO3M6MTA6IkFPU19RdW90ZXMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6MTI6IkFPU19JbnZvaWNlcyI7czoxMjoiQU9TX0ludm9pY2VzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjU6IkNhc2VzIjtzOjU6IkNhc2VzIjtzOjk6IlByb3NwZWN0cyI7czo5OiJQcm9zcGVjdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6NzoiUHJvamVjdCI7czo3OiJQcm9qZWN0IjtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtzOjk6IkZQX2V2ZW50cyI7czo5OiJGUF9ldmVudHMiO3M6MTg6IkZQX0V2ZW50X0xvY2F0aW9ucyI7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6MTI6IkFPU19Qcm9kdWN0cyI7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7czoxNzoiQU9TX1BERl9UZW1wbGF0ZXMiO3M6MTc6IkFPU19QREZfVGVtcGxhdGVzIjtzOjk6Impqd2dfTWFwcyI7czo5OiJqandnX01hcHMiO3M6MTI6Impqd2dfTWFya2VycyI7czoxMjoiamp3Z19NYXJrZXJzIjtzOjEwOiJqandnX0FyZWFzIjtzOjEwOiJqandnX0FyZWFzIjtzOjE4OiJqandnX0FkZHJlc3NfQ2FjaGUiO3M6MTg6Impqd2dfQWRkcmVzc19DYWNoZSI7czoxMToiQU9SX1JlcG9ydHMiO3M6MTE6IkFPUl9SZXBvcnRzIjtzOjEyOiJBT1dfV29ya0Zsb3ciO3M6MTI6IkFPV19Xb3JrRmxvdyI7czo5OiJ5b19Db3VudHkiO3M6OToieW9fQ291bnR5IjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO3M6MTU6InlvX1N1YmRpdmlzaW9ucyI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjE4OiJ5b19JbnZlc3RpbmdFbnRpdHkiO3M6ODoieW9fU2FsZXMiO3M6ODoieW9fU2FsZXMiO3M6MjM6InlvX0Ftb3J0aXphdGlvblNjaGVkdWxlIjtzOjIzOiJ5b19BbW9ydGl6YXRpb25TY2hlZHVsZSI7czoxMjoieW9fTWFya2V0aW5nIjtzOjEyOiJ5b19NYXJrZXRpbmciO30='),
('portal', 'on', '0'),
('tracker', 'Tracker', '1'),
('system', 'skypeout_on', '1'),
('sugarfeed', 'enabled', '1'),
('sugarfeed', 'module_UserFeed', '1'),
('sugarfeed', 'module_Cases', '1'),
('sugarfeed', 'module_Contacts', '1'),
('sugarfeed', 'module_Leads', '1'),
('sugarfeed', 'module_Opportunities', '1'),
('Update', 'CheckUpdates', 'manual'),
('system', 'name', 'SuiteCRM'),
('system', 'adminwizard', '1'),
('notify', 'allow_default_outbound', '0'),
('MySettings', 'disable_useredit', 'no'),
('MySettings', 'hide_subpanels', 'YTowOnt9');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `joomla_account_id` varchar(255) DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT NULL,
  `portal_user_type` varchar(100) DEFAULT 'Single',
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_audit`
--

CREATE TABLE IF NOT EXISTS `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_bugs`
--

CREATE TABLE IF NOT EXISTS `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cases`
--

CREATE TABLE IF NOT EXISTS `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cstm`
--

CREATE TABLE IF NOT EXISTS `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_users`
--

CREATE TABLE IF NOT EXISTS `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cron_remove_documents`
--

CREATE TABLE IF NOT EXISTS `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_accounts`
--

CREATE TABLE IF NOT EXISTS `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_bugs`
--

CREATE TABLE IF NOT EXISTS `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_cases`
--

CREATE TABLE IF NOT EXISTS `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_contacts`
--

CREATE TABLE IF NOT EXISTS `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_opportunities`
--

CREATE TABLE IF NOT EXISTS `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_revisions`
--

CREATE TABLE IF NOT EXISTS `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eapm`
--

CREATE TABLE IF NOT EXISTS `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emailman`
--

CREATE TABLE IF NOT EXISTS `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_beans`
--

CREATE TABLE IF NOT EXISTS `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_email_addr_rel`
--

CREATE TABLE IF NOT EXISTS `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_text`
--

CREATE TABLE IF NOT EXISTS `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE IF NOT EXISTS `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `email_address`, `email_address_caps`, `invalid_email`, `opt_out`, `date_created`, `date_modified`, `deleted`) VALUES
('b44791ce-c931-fd52-73b1-550dc7ea98cb', 'test@mailinator.com', 'TEST@MAILINATOR.COM', 0, 0, '2015-03-21 19:31:46', '2015-03-21 19:31:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_addr_bean_rel`
--

CREATE TABLE IF NOT EXISTS `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addr_bean_rel`
--

INSERT INTO `email_addr_bean_rel` (`id`, `email_address_id`, `bean_id`, `bean_module`, `primary_address`, `reply_to_address`, `date_created`, `date_modified`, `deleted`) VALUES
('b3c4e2e2-bdc6-3cf0-bf2e-550dc747f675', 'b44791ce-c931-fd52-73b1-550dc7ea98cb', '1', 'Users', 1, 0, '2015-03-21 19:31:46', '2015-03-21 19:31:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_cache`
--

CREATE TABLE IF NOT EXISTS `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing`
--

CREATE TABLE IF NOT EXISTS `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing_prospect_lists`
--

CREATE TABLE IF NOT EXISTS `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `published`, `name`, `description`, `subject`, `body`, `body_html`, `deleted`, `assigned_user_id`, `text_only`, `type`) VALUES
('21196694-2997-b018-fef3-550dc525c8fb', '2013-05-24 14:31:45', '2015-03-21 19:13:07', '1', '1', 'off', 'Event Invite Template', 'Default event invite template.', 'You have been invited to $fp_events_name', 'Dear $contact_name,\r\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\r\n$fp_events_description\r\nYours Sincerely,\r\n', '\r\n<p>Dear $contact_name,</p>\r\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\r\n<p>$fp_events_description</p>\r\n<p>If you would like to accept this invititation please click accept.</p>\r\n<p>┬á$fp_events_link or $fp_events_link_declined</p>\r\n<p>Yours Sincerely,</p>\r\n', 0, NULL, NULL, 'email'),
('2d8a1e9a-3046-e519-04b5-550dc47edce4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Contact Case Update', 'Template to send to a contact when their case is updated.', '$acase_name update [CASE:$acase_case_number]', 'Hi $user_first_name $user_last_name,\r\n\r\n					   You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description', '<p>Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>┬á</p>\r\n					    <p>You''ve had an update to your case┬á$acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\r\n					    <p style="padding-left:30px;">$aop_case_updates_description</p>', 0, NULL, NULL, NULL),
('46ebc1a3-2b0a-c55e-570c-550dc5b758ab', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'User Case Update', 'Email template to send to a Sugar user when their case is updated.', '$acase_name (# $acase_case_number) update', 'Hi $user_first_name $user_last_name,\r\n\r\n					   You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description\r\n                        You may review this Case at:\r\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;', '<p>Hi $user_first_name $user_last_name,</p>\r\n					   <p>┬á</p>\r\n					   <p>You''ve had an update to your case┬á$acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					   <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\r\n					   <p style="padding-left:30px;">$aop_case_updates_description</p>\r\n					   <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>\r\n					   ', 0, NULL, NULL, NULL),
('4cca32f6-6a3e-ba4d-e997-550dc46c84cf', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Case Closure', 'Template for informing a contact that their case has been closed.', '$acase_name [CASE:$acase_case_number] closed', 'Hi $contact_first_name $contact_last_name,\r\n\r\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\r\n					   Status:				$acase_status\r\n					   Reference:			$acase_case_number\r\n					   Resolution:			$acase_resolution', '<p>┬áHi $contact_first_name $contact_last_name,</p>\r\n					    <p>Your case┬á$acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\r\n					    <table border="0"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Resolution</td><td>$acase_resolution</td></tr></tbody></table>', 0, NULL, NULL, NULL),
('5cc424ab-2b4b-f510-6da0-550dc4ef9aa6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user''s account password.', 'Reset your account password', '\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid', '<div><table width="550"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL),
('6bd5211e-82f0-84a1-e90a-550dc4e11518', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width="550"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL),
('7b219fdf-7fc6-be7b-09d9-550dc4cfb237', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Joomla Account Creation', 'Template used when informing a contact that they''ve been given an account on the joomla portal.', 'Support Portal Account Created', 'Hi $contact_name,\r\n					   An account has been created for you at $portal_address.\r\n					   You may login using this email address and the password $joomla_pass', '<p>Hi $contact_name,</p>\r\n					    <p>An account has been created for you at <a href="$portal_address">$portal_address</a>.</p>\r\n					    <p>You may login using this email address and the password $joomla_pass</p>', 0, NULL, NULL, NULL),
('d29c326e-2ce9-cd4f-6919-550dc4e97a6c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Case Creation', 'Template to send to a contact when a case is received from them.', '$acase_name [CASE:$acase_case_number]', 'Hi $contact_first_name $contact_last_name,\r\n\r\n					   We''ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\r\n					   Status:		$acase_status\r\n					   Reference:	$acase_case_number\r\n					   Description:	$acase_description', '<p>┬áHi $contact_first_name $contact_last_name,</p>\r\n					    <p>We''ve received your case┬á$acase_name (# $acase_case_number) on $acase_date_entered</p>\r\n					    <table border="0"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Description</td><td>$acase_description</td></tr></tbody></table>', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fields_meta_data`
--

CREATE TABLE IF NOT EXISTS `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields_meta_data`
--

INSERT INTO `fields_meta_data` (`id`, `name`, `vname`, `comments`, `help`, `custom_module`, `type`, `len`, `required`, `default_value`, `date_modified`, `deleted`, `audited`, `massupdate`, `duplicate_merge`, `reportable`, `importable`, `ext1`, `ext2`, `ext3`, `ext4`) VALUES
('Accountsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Accounts', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Accountsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Accounts', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Accountsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Accounts', 'float', 10, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Accountsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Accounts', 'float', 11, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Casesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Cases', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Casesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Cases', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Casesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Cases', 'float', 10, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Casesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Cases', 'float', 11, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Contactsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Contacts', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Contactsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Contacts', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Contactsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Contacts', 'float', 10, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Contactsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Contacts', 'float', 11, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Leads', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Leadsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Leads', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Leadsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Leads', 'float', 10, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Leads', 'float', 11, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Meetingsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Meetings', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Meetingsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Meetings', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Meetingsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Meetings', 'float', 10, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Meetingsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Meetings', 'float', 11, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Opportunitiesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Opportunities', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Opportunitiesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Opportunities', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Opportunitiesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Opportunities', 'float', 10, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Opportunitiesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Opportunities', 'float', 11, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Projectjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Project', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Projectjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Project', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Projectjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Project', 'float', 10, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Projectjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Project', 'float', 11, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Prospectsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Prospects', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Prospectsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Prospects', 'varchar', 255, 0, NULL, '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Prospectsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Prospects', 'float', 10, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Prospectsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Prospects', 'float', 11, 0, '0.00000000', '2015-03-21 19:13:07', 0, 0, 0, 0, 1, 'true', '8', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_rel`
--

CREATE TABLE IF NOT EXISTS `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_subscriptions`
--

CREATE TABLE IF NOT EXISTS `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events`
--

CREATE TABLE IF NOT EXISTS `fp_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `invite_templates` varchar(100) DEFAULT NULL,
  `accept_redirect` varchar(255) DEFAULT NULL,
  `decline_redirect` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_audit`
--

CREATE TABLE IF NOT EXISTS `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_contacts_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_leads_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_prospects_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations_audit`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_event_locations_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `import_maps`
--

CREATE TABLE IF NOT EXISTS `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email`
--

CREATE TABLE IF NOT EXISTS `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_autoreply`
--

CREATE TABLE IF NOT EXISTS `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_cache_ts`
--

CREATE TABLE IF NOT EXISTS `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_address_cache`
--

CREATE TABLE IF NOT EXISTS `jjwg_address_cache` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `lat` float(26,8) DEFAULT NULL,
  `lng` float(26,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_address_cache_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_address_cache_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_areas`
--

CREATE TABLE IF NOT EXISTS `jjwg_areas` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `coordinates` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_areas_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_areas_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `distance` float(26,4) DEFAULT NULL,
  `unit_type` varchar(100) DEFAULT 'mi',
  `module_type` varchar(100) DEFAULT 'Accounts',
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_maps_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_markers`
--

CREATE TABLE IF NOT EXISTS `jjwg_markers` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `jjwg_maps_lat` float(26,8) DEFAULT '0.00000000',
  `jjwg_maps_lng` float(26,8) DEFAULT '0.00000000',
  `marker_image` varchar(100) DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_markers_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_markers_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_queue`
--

CREATE TABLE IF NOT EXISTS `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_aos_products_1_c`
--

CREATE TABLE IF NOT EXISTS `leads_aos_products_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `leads_aos_products_1leads_ida` varchar(36) DEFAULT NULL,
  `leads_aos_products_1aos_products_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_aos_products_1_ida1` (`leads_aos_products_1leads_ida`),
  KEY `leads_aos_products_1_alt` (`leads_aos_products_1aos_products_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_audit`
--

CREATE TABLE IF NOT EXISTS `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_cstm`
--

CREATE TABLE IF NOT EXISTS `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linked_documents`
--

CREATE TABLE IF NOT EXISTS `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE IF NOT EXISTS `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_contacts`
--

CREATE TABLE IF NOT EXISTS `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_cstm`
--

CREATE TABLE IF NOT EXISTS `meetings_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_leads`
--

CREATE TABLE IF NOT EXISTS `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_users`
--

CREATE TABLE IF NOT EXISTS `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

CREATE TABLE IF NOT EXISTS `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_audit`
--

CREATE TABLE IF NOT EXISTS `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_contacts`
--

CREATE TABLE IF NOT EXISTS `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_cstm`
--

CREATE TABLE IF NOT EXISTS `opportunities_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email`
--

CREATE TABLE IF NOT EXISTS `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oe_user_id_idx` (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbound_email`
--

INSERT INTO `outbound_email` (`id`, `name`, `type`, `user_id`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`) VALUES
('60624bd7-4072-268f-2dbc-550dc66d1125', 'system', 'system', '1', 'SMTP', 'other', '', 25, '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_accounts`
--

CREATE TABLE IF NOT EXISTS `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_bugs`
--

CREATE TABLE IF NOT EXISTS `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_cases`
--

CREATE TABLE IF NOT EXISTS `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_contacts`
--

CREATE TABLE IF NOT EXISTS `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_opportunities`
--

CREATE TABLE IF NOT EXISTS `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_products`
--

CREATE TABLE IF NOT EXISTS `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_contacts_1_c`
--

CREATE TABLE IF NOT EXISTS `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_cstm`
--

CREATE TABLE IF NOT EXISTS `project_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task`
--

CREATE TABLE IF NOT EXISTS `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relationship_type` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task_audit`
--

CREATE TABLE IF NOT EXISTS `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_users_1_c`
--

CREATE TABLE IF NOT EXISTS `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospects`
--

CREATE TABLE IF NOT EXISTS `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prospects_cstm`
--

CREATE TABLE IF NOT EXISTS `prospects_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists`
--

CREATE TABLE IF NOT EXISTS `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists_prospects`
--

CREATE TABLE IF NOT EXISTS `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_list_campaigns`
--

CREATE TABLE IF NOT EXISTS `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE IF NOT EXISTS `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('122a238e-bd56-e494-f3e7-5512fae7dc60', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', 0, 0),
('12d65584-a0b9-381b-02af-5512fa286131', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('13a213e7-94c8-e6a0-3fd8-5512fa929361', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('14460955-d4e2-0fe6-d903-5512faf55420', 'aor_charts_modified_user', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1487bf30-0775-e275-e76d-5512fad0e33c', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('148992ce-8422-8ff4-7826-5512face132e', 'am_tasktemplates_created_by', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1502b908-c505-3b72-7744-5512fa48a802', 'fp_events_prospects_1', 'FP_events', 'fp_events', 'id', 'Prospects', 'prospects', 'id', 'fp_events_prospects_1_c', 'fp_events_prospects_1fp_events_ida', 'fp_events_prospects_1prospects_idb', 'many-to-many', NULL, NULL, 0, 0),
('15035b98-ca1e-6a11-216b-5512fae7a705', 'yo_subdivisions_aos_products', 'yo_Subdivisions', 'yo_subdivisions', 'id', 'AOS_Products', 'aos_products', 'id', 'yo_subdivisions_aos_products_c', 'yo_subdivisions_aos_productsyo_subdivisions_ida', 'yo_subdivisions_aos_productsaos_products_idb', 'many-to-many', NULL, NULL, 0, 0),
('16717573-a460-5a93-7ffd-5512fa466234', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('16870ef9-a1fa-031e-cc34-5512fa638ff1', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('173d1ab8-f853-4b88-4781-5512fafd7379', 'aow_workflow_created_by', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('175c0447-499e-937b-ad6b-5512fa94de77', 'aos_pdf_templates_created_by', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('17dffb14-2f08-4de2-8415-5512fa3a5ff6', 'securitygroups_project', 'SecurityGroups', 'securitygroups', 'id', 'Project', 'project', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Project', 0, 0),
('190ac0c3-7ee8-97af-a7b1-5512fa2cb517', 'contact_notes_parent', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('195b1c70-fba9-8f67-ee8b-5512fa4e4c48', 'jjwg_markers_assigned_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1a875d7d-0acf-89bc-8146-5512fa028cd5', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1cc27107-d304-542b-b77a-5512fa88c4e8', 'am_tasktemplates_assigned_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1ccc8bb3-8211-c2d5-6874-5512fac0e570', 'am_projectholidays_project', 'Project', 'project', 'id', 'AM_ProjectHolidays', 'am_projectholidays', 'id', 'am_projectholidays_project_c', 'am_projectholidays_projectproject_ida', 'am_projectholidays_projectam_projectholidays_idb', 'many-to-many', NULL, NULL, 0, 0),
('1cefd059-a40c-182c-9ee4-5512fa3e479e', 'yo_sales_modified_user', 'Users', 'users', 'id', 'yo_Sales', 'yo_sales', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1d63912a-58cc-29d9-1778-5512fa642b57', 'yo_subdivisions_campaigns', 'yo_Subdivisions', 'yo_subdivisions', 'id', 'Campaigns', 'campaigns', 'id', 'yo_subdivisions_campaigns_c', 'yo_subdivisions_campaignsyo_subdivisions_ida', 'yo_subdivisions_campaignscampaigns_idb', 'many-to-many', NULL, NULL, 0, 0),
('1df10bdf-5765-1651-12d6-5512fa1929a4', 'securitygroups_assigned_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e4f6138-755b-e8d6-0b53-5512fa1c73ce', 'fp_event_locations_fp_events_1', 'FP_Event_Locations', 'fp_event_locations', 'id', 'FP_events', 'fp_events', 'id', 'fp_event_locations_fp_events_1_c', 'fp_event_locations_fp_events_1fp_event_locations_ida', 'fp_event_locations_fp_events_1fp_events_idb', 'many-to-many', NULL, NULL, 0, 0),
('1e9d00b1-3657-2e7f-b0c5-5512faba2fbd', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('1f22f6ad-3574-f607-e5cd-5512fa55b1b8', 'aor_charts_created_by', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f399bc7-10b5-45f9-ff61-5512fa135ec7', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f7b01a1-1392-6297-bad1-5512fa63fea4', 'aow_workflow_assigned_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f9808c9-2f73-7fba-6902-5512fa8eb98d', 'securitygroups_notes', 'SecurityGroups', 'securitygroups', 'id', 'Notes', 'notes', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Notes', 0, 0),
('1fdad2b4-9a38-ced3-979f-5512fa0eb53f', 'securitygroups_project_task', 'SecurityGroups', 'securitygroups', 'id', 'ProjectTask', 'project_task', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProjectTask', 0, 0),
('20c12187-ea7f-dfd9-48ea-5512fa374a20', 'yo_amortizationschedule_assigned_user', 'Users', 'users', 'id', 'yo_AmortizationSchedule', 'yo_amortizationschedule', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('21e79d06-fc72-c734-d9eb-5512fa5dde76', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('225a83a1-ac5a-2977-d4ba-5512faefc77f', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('2261b440-5648-0d26-0eba-5512faad2938', 'aod_indexevent_modified_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('229f939c-2b39-cf3d-f9d3-5512faaf5eba', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', 0, 0),
('23b5fc9a-444c-3009-40dc-5512fa0ab1f7', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Leads', 0, 0),
('23d7c267-53fa-d5f8-a80c-5512fabb5034', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('24d0aea3-bd48-550f-9839-5512fa01f11f', 'aor_charts_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Charts', 'aor_charts', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2586d773-0495-fb60-c1ab-5512fa0bd19c', 'aop_case_updates_modified_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('26146ca2-e60c-10b2-15dd-5512fab5488f', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Contacts', 0, 0),
('275a650b-792b-e441-2784-5512fa7adf25', 'aow_workflow_aow_conditions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Conditions', 'aow_conditions', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('27923bdb-5401-9809-00b7-5512fad9a6a2', 'jjwg_maps_jjwg_areas', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Areas', 'jjwg_areas', 'id', 'jjwg_maps_jjwg_areas_c', 'jjwg_maps_5304wg_maps_ida', 'jjwg_maps_41f2g_areas_idb', 'many-to-many', NULL, NULL, 0, 0),
('283f04fb-e8c3-3526-450a-5512fa87e702', 'yo_sales_created_by', 'Users', 'users', 'id', 'yo_Sales', 'yo_sales', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('29639706-8504-1062-d3f8-5512fa44757d', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('296c3e04-319d-5c1c-2371-5512faa54002', 'am_projecttemplates_project_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Project', 'project', 'id', 'am_projecttemplates_project_1_c', 'am_projecttemplates_project_1am_projecttemplates_ida', 'am_projecttemplates_project_1project_idb', 'many-to-many', NULL, NULL, 0, 0),
('2a2cd23b-3f62-68ee-55e6-5512fa89b100', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2ada68de-b33b-93cf-e3fa-5512fac6c936', 'securitygroups_prospect_lists', 'SecurityGroups', 'securitygroups', 'id', 'ProspectLists', 'prospect_lists', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProspectLists', 0, 0),
('2cb62c00-fb76-3ac0-b392-5512fae01a66', 'aod_indexevent_created_by', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2dc84e0b-349b-2e00-e726-5512fa50e6f2', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('2de37d89-5c2e-24c4-8140-5512faaca1b9', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2f820288-18a2-903e-de70-5512fa0a9ead', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('2fbc28a6-4f71-6f02-56f0-5512fa135df4', 'aos_product_categories_modified_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2fc8b68f-2160-e55e-4c82-5512fac5e311', 'aow_workflow_aow_actions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Actions', 'aow_actions', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3047d210-6373-feee-dc7e-5512fa475991', 'yo_sales_assigned_user', 'Users', 'users', 'id', 'yo_Sales', 'yo_sales', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('30926b79-64c1-ebec-3995-5512fa81bfe4', 'securitygroups_prospects', 'SecurityGroups', 'securitygroups', 'id', 'Prospects', 'prospects', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Prospects', 0, 0),
('30e44378-c99a-691d-e60a-5512fadbb567', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('310e8de8-cf64-0514-1a3a-5512facfeb50', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('32150a4b-97cb-51b8-abd4-5512fa72b2a7', 'jjwg_maps_jjwg_markers', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Markers', 'jjwg_markers', 'id', 'jjwg_maps_jjwg_markers_c', 'jjwg_maps_b229wg_maps_ida', 'jjwg_maps_2e31markers_idb', 'many-to-many', NULL, NULL, 0, 0),
('324a8546-6f69-150c-bed9-5512fa65f2b1', 'aop_case_updates_created_by', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('32ac8753-3a0a-d9f1-4e66-5512faa4800a', 'aod_indexevent_assigned_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('32c60b61-cf2f-e873-4d8a-5512fab383f5', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('348f004f-b534-0e9e-2f88-5512fa8c4494', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('34d3d7db-52cd-06b7-9afc-5512fa9fcdce', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3515dc6b-6f68-3ac4-5edb-5512fae1cedf', 'aos_line_item_groups_modified_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('36bed500-cbe2-e2c5-1025-5512fa871994', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('378bb98f-c0a0-1733-97d1-5512fa956cdf', 'am_tasktemplates_am_projecttemplates', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'id', 'am_tasktemplates_am_projecttemplates_c', 'am_tasktemplates_am_projecttemplatesam_projecttemplates_ida', 'am_tasktemplates_am_projecttemplatesam_tasktemplates_idb', 'many-to-many', NULL, NULL, 0, 0),
('379fa001-170f-1c96-b7fa-5512fad43ef4', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('37a4ab21-2652-1015-8fb0-5512fab0d98c', 'aop_case_updates_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('37bf5454-23eb-7e21-2c14-5512fa5edda6', 'aow_workflow_aow_processed', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Processed', 'aow_processed', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('38b43ffd-ca59-2373-4407-5512fa6bb971', 'securitygroups_tasks', 'SecurityGroups', 'securitygroups', 'id', 'Tasks', 'tasks', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Tasks', 0, 0),
('39b9b23b-deb2-2d9d-bf80-5512fa3a4305', 'contact_aos_quotes', 'Contacts', 'contacts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('39d336a8-4b59-9395-ab45-5512fa1a4c4c', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('3a9ae824-ad5c-efc0-2786-5512fa2f9d32', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('3ac54e7d-a238-7f56-1efa-5512faebb48b', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('3c84af30-8042-2baf-a3e5-5512fafba78b', 'leads_aos_products_1', 'Leads', 'leads', 'id', 'AOS_Products', 'aos_products', 'id', 'leads_aos_products_1_c', 'leads_aos_products_1leads_ida', 'leads_aos_products_1aos_products_idb', 'many-to-many', NULL, NULL, 0, 0),
('3cdb7782-3e44-dc26-e5c4-5512fa54e225', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3d71c187-e42f-b2d6-2e57-5512faa3c197', 'aos_product_categories_created_by', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3eb676d8-ba3e-a6dc-21e0-5512fab98fe7', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('3f0400d2-445d-b0a7-5f47-5512faa5e7ad', 'cases_aop_case_updates', 'Cases', 'cases', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'case_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3f2552de-1af4-972d-6b8c-5512fa4592b5', 'aos_line_item_groups_created_by', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3f47552c-545b-8162-03ad-5512faf2f186', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('402424c7-7d61-a974-013f-5512fa330e26', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('409e04be-9b80-1089-12e1-5512fa78d41b', 'am_projectholidays_modified_user', 'Users', 'users', 'id', 'AM_ProjectHolidays', 'am_projectholidays', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('41487819-e3c3-e60d-42ed-5512faaf6bc9', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4179780c-eee2-2205-33ca-5512fae15e4d', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('4211bd1a-9564-234a-d1f6-5512faca6067', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('43c11eb3-31ca-a410-f1e4-5512fa57d317', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('449a201b-6dab-71f3-3352-5512faa7337a', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('45331e7e-1dc2-bbc2-79fa-5512fa530754', 'aos_line_item_groups_assigned_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('45c49e4e-3f12-82a7-1256-5512fa660048', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4629f80d-4a93-02c2-b0b8-5512fa1473b1', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('4666fb33-2c3d-c932-7baf-5512fa73c874', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('468c0856-5575-044c-1f80-5512fa21b4c4', 'yo_amortizationschedule_created_by', 'Users', 'users', 'id', 'yo_AmortizationSchedule', 'yo_amortizationschedule', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('46cd6397-0f81-c568-4ae3-5512fa6fe0e0', 'securitygroups_users', 'SecurityGroups', 'securitygroups', 'id', 'Users', 'users', 'id', 'securitygroups_users', 'securitygroup_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('482a322a-3a58-cd7a-50c2-5512fa456e8d', 'contact_aos_invoices', 'Contacts', 'contacts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('49035a0e-6209-d9b5-6d2f-5512faf3d6ee', 'project_contacts_1', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'project_contacts_1_c', 'project_contacts_1project_ida', 'project_contacts_1contacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('49702c54-9ca5-f11d-9eca-5512fabc91b4', 'aop_case_updates_notes', 'AOP_Case_Updates', 'aop_case_updates', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOP_Case_Updates', 0, 0),
('49a68ae5-c976-4bb8-75b0-5512fae006c1', 'am_projectholidays_created_by', 'Users', 'users', 'id', 'AM_ProjectHolidays', 'am_projectholidays', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('49b60ff3-0463-d15f-4075-5512fa37122f', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4a7059d4-5303-7bac-8d7a-5512fa9b07dc', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4aa7e96f-88bc-d291-5bf5-5512fa5008f1', 'groups_aos_product_quotes', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'group_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4af09e4d-49a1-e5da-d38f-5512fa772cce', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Calls', 0, 0),
('4b106ad1-5a72-9aed-411e-5512fa0915f1', 'yo_county_modified_user', 'Users', 'users', 'id', 'yo_County', 'yo_county', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4bb6b1ab-7e52-8e5c-d44c-5512fa0fcd96', 'aor_conditions_modified_user', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4c21115f-121e-a359-3cca-5512fa919a31', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('4cb24ce3-f38e-2929-d688-5512faaec87a', 'jjwg_areas_modified_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4d68330d-da04-65fc-81d8-5512faf42c89', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('4e8db244-ead8-f839-615a-5512facc6ca1', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('4eb5c3de-2417-8abd-d9a1-5512fab4eae4', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4fca206e-be7f-e5c8-4f60-5512fa7a2382', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5030c41c-16aa-b59c-d8ee-5512fa498b86', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('50bfcf72-c1c3-a8f3-238e-5512fa5e0038', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('524854a8-ef97-7beb-a072-5512fabbe102', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('534e3d96-e905-4f01-a588-5512fa3ecc2d', 'am_projectholidays_assigned_user', 'Users', 'users', 'id', 'AM_ProjectHolidays', 'am_projectholidays', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('53abf97e-4844-b5ba-7773-5512fa43e122', 'calls_reschedule', 'Calls', 'calls', 'id', 'Calls_Reschedule', 'calls_reschedule', 'call_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('53c203a9-0204-7130-8551-5512fa02427a', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('54309057-6003-587a-9261-5512fa15c7d4', 'yo_amortizationschedule_yo_sales', 'yo_Sales', 'yo_sales', 'id', 'yo_AmortizationSchedule', 'yo_amortizationschedule', 'id', 'yo_amortizationschedule_yo_sales_c', 'yo_amortizationschedule_yo_salesyo_sales_ida', 'yo_amortizationschedule_yo_salesyo_amortizationschedule_idb', 'many-to-many', NULL, NULL, 0, 0),
('5489e443-ecfc-001d-85c0-5512fa9e88bb', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('54bf3d96-c1ac-811f-398e-5512fab28b71', 'aos_product_categories_assigned_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('54cdb8fa-ed25-b204-b10c-5512fa9cee38', 'yo_county_created_by', 'Users', 'users', 'id', 'yo_County', 'yo_county', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('54e63100-3b6a-5c24-0f62-5512fa2bc0eb', 'contact_aos_contracts', 'Contacts', 'contacts', 'id', 'AOS_Contracts', 'aos_contracts', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('55689891-8295-fb18-9e74-5512fa2a5910', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('55ea0849-331d-defc-7704-5512fa2dc6f4', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('567878ab-3945-cd82-50f2-5512faa22a6b', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('56b20610-cd9e-0360-26d7-5512facdef21', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('57727879-bc5c-481a-24df-5512fab98400', 'aor_conditions_created_by', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('57b64c03-e22c-69a0-a790-5512faa657e5', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('57dbade7-8f07-29dc-43a4-5512faed906f', 'project_users_1', 'Project', 'project', 'id', 'Users', 'users', 'id', 'project_users_1_c', 'project_users_1project_ida', 'project_users_1users_idb', 'many-to-many', NULL, NULL, 0, 0),
('582533ec-752d-d5af-d8ae-5512fa1906c8', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5868939c-192b-77f3-59ec-5512fa826652', 'jjwg_areas_created_by', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('59fbbb30-a50a-a3b2-b532-5512fa97c6e7', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('5a7a2cb4-403b-46d9-57b3-5512fa5b0edd', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5cab745d-9dee-82f5-cb0a-5512fa8d7b1b', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5d2f1098-0787-e064-cded-5512fa98fad3', 'yo_marketing_modified_user', 'Users', 'users', 'id', 'yo_Marketing', 'yo_marketing', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5d534c49-6b88-3523-11e3-5512fa55c317', 'yo_county_aos_products', 'yo_County', 'yo_county', 'id', 'AOS_Products', 'aos_products', 'id', 'yo_county_aos_products_c', 'yo_county_aos_productsyo_county_ida', 'yo_county_aos_productsaos_products_idb', 'many-to-many', NULL, NULL, 0, 0),
('5d875af2-9fe4-b189-a0c1-5512fa609e7d', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5dab32b6-64b7-5aa8-0ad2-5512fabd2423', 'aow_processed_modified_user', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5db5239c-f67d-0b56-b83c-5512fa7f68bb', 'jjwg_areas_assigned_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5f4fd45d-a225-77c7-a4a6-5512fae0f9f1', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('5f75da21-8191-24e4-bc2c-5512fabafbb2', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5fddd279-46f3-e62c-309c-5512fad2e05e', 'yo_county_assigned_user', 'Users', 'users', 'id', 'yo_County', 'yo_county', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('60d2a77b-3604-5337-1a8c-5512fa2c223b', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'schedulersjobs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('60d74cf9-4f66-68b6-e714-5512fa9cbf34', 'contacts_aop_case_updates', 'Contacts', 'contacts', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('614c3813-668d-02dd-8199-5512fae2513a', 'sub_product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'parent_category_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6219ce1f-6b78-89b6-8d05-5512fa4287e5', 'securitygroups_acl_roles', 'SecurityGroups', 'securitygroups', 'id', 'ACLRoles', 'acl_roles', 'id', 'securitygroups_acl_roles', 'securitygroup_id', 'role_id', 'many-to-many', NULL, NULL, 0, 0),
('638f0ffa-16e5-15c9-66bd-5512fa30b987', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('64355c8d-a034-0919-555d-5512fa3703ff', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('64579e11-3110-b622-38a0-5512fafac354', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('6457c6ca-eb7b-1b5f-637e-5512faefe8f2', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6555703b-8635-3778-249d-5512faa98b94', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', 0, 0),
('65b6a0c0-d293-3fbf-bbf3-5512fa364633', 'aos_contracts_aos_products_1', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Products', 'aos_products', 'id', 'aos_contracts_aos_products_1_c', 'aos_contracts_aos_products_1aos_contracts_ida', 'aos_contracts_aos_products_1aos_products_idb', 'many-to-many', NULL, NULL, 0, 0),
('67139ab9-8df8-a194-25c3-5512fa97e650', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6795cc92-9e0f-59ee-c242-5512fa2a59dc', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67d79edb-beb3-0ecb-a79d-5512fa925d5c', 'yo_marketing_created_by', 'Users', 'users', 'id', 'yo_Marketing', 'yo_marketing', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('68571f84-c466-924e-7bf0-5512faa86ed5', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('69cdd901-1c49-fa0c-07d4-5512faeb4f0e', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6a0adf10-063e-b88b-77dd-5512fa74ebab', 'yo_county_campaigns', 'yo_County', 'yo_county', 'id', 'Campaigns', 'campaigns', 'id', 'yo_county_campaigns_c', 'yo_county_campaignsyo_county_ida', 'yo_county_campaignscampaigns_idb', 'many-to-many', NULL, NULL, 0, 0),
('6b5775e9-5385-e019-0407-5512fa578243', 'aow_processed_created_by', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6bbd907a-ca21-0c23-2223-5512fa93a09f', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6d06cf88-8826-269b-4751-5512fad2d96a', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6d83b7b0-d473-8623-de38-5512fa0efdf8', 'aos_contracts_documents', 'AOS_Contracts', 'aos_contracts', 'id', 'Documents', 'documents', 'id', 'aos_contracts_documents', 'aos_contracts_id', 'documents_id', 'many-to-many', NULL, NULL, 0, 0),
('6ff017dc-d3bd-2bfc-8f86-5512fa92ed2c', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('708c2045-0222-6c46-98a2-5512fad9829d', 'aor_reports_modified_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('714ee819-0305-f6c4-15ce-5512fac64673', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('7163511e-e64b-8a8b-fc67-5512fa418b8e', 'securitygroups_accounts', 'SecurityGroups', 'securitygroups', 'id', 'Accounts', 'accounts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Accounts', 0, 0),
('7205982e-e212-6426-b426-5512fab48b3b', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('720a3e89-5429-8811-bf72-5512fa74f94f', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('72b6a5a4-4083-93e9-edf8-5512fa02ae4c', 'aos_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7301646d-d378-0b25-28af-5512faf2952e', 'yo_marketing_assigned_user', 'Users', 'users', 'id', 'yo_Marketing', 'yo_marketing', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('735106fc-2ee8-1987-8afd-5512fa3eadf4', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', 0, 0),
('746d0621-17a0-ba3a-9ba8-5512faa99da1', 'aos_products_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('759092dc-a054-40f6-a825-5512fa2fbabd', 'yo_county_contacts', 'yo_County', 'yo_county', 'id', 'Contacts', 'contacts', 'id', 'yo_county_contacts_c', 'yo_county_contactsyo_county_ida', 'yo_county_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('75c10a94-15eb-7395-d7fb-5512fa64308a', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', 0, 0),
('75cf333a-a935-3568-6088-5512fa1c21cc', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('76c336cf-8b32-9bc4-4c1f-5512fa04d4c0', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('77c04db1-4ada-3bc9-09a2-5512fab5929e', 'aos_products_accounts_1', 'AOS_Products', 'aos_products', 'id', 'Accounts', 'accounts', 'id', 'aos_products_accounts_1_c', 'aos_products_accounts_1aos_products_ida', 'aos_products_accounts_1accounts_idb', 'many-to-many', NULL, NULL, 0, 0),
('77e1d2ae-78c2-99b2-0d8c-5512fa33b931', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7904cb1c-872a-7d4b-1377-5512fa10227e', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('79fe6580-01c7-1a36-161d-5512faeb0e1a', 'aod_index_modified_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7ba7d80b-737b-1616-caa8-5512faae755c', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('7c3cedc6-40b0-7c8a-d65c-5512fa4dbe2c', 'aor_reports_created_by', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7ce257ef-69d3-fe85-a2dd-5512fac0b77f', 'securitygroups_bugs', 'SecurityGroups', 'securitygroups', 'id', 'Bugs', 'bugs', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Bugs', 0, 0),
('7cec4d19-9805-8d2c-c1af-5512fa6bca65', 'aos_quotes_created_by', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7d0f6f4b-a4d4-1688-655f-5512fa73af2d', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('7d466161-bf5d-8110-ac75-5512fabeb844', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('7e37142d-8798-9a7b-dd84-5512fac4490e', 'aor_scheduled_reports_modified_user', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7fc2cdcd-3548-bf26-4214-5512fa8e1175', 'opportunity_aos_quotes', 'Opportunities', 'opportunities', 'id', 'AOS_Quotes', 'aos_quotes', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7fe507ba-3e2b-b322-3e51-5512fad54a9a', 'yo_county_leads', 'yo_County', 'yo_county', 'id', 'Leads', 'leads', 'id', 'yo_county_leads_c', 'yo_county_leadsyo_county_ida', 'yo_county_leadsleads_idb', 'many-to-many', NULL, NULL, 0, 0),
('80dc4248-a7a2-e051-408f-5512fa3bd6cf', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('81657952-3a9f-0ead-59a2-5512fa0bb695', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8271d634-337d-61b2-70c2-5512fa7a9482', 'jjwg_address_cache_modified_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('82cfa872-a70a-972f-3fb7-5512fab8612e', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('82d05b19-d375-3da1-9985-5512faa5f82a', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('8390725c-7bd7-926e-daa3-5512faeef691', 'aos_products_calls_1', 'AOS_Products', 'aos_products', 'id', 'Calls', 'calls', 'id', 'aos_products_calls_1_c', 'aos_products_calls_1aos_products_ida', 'aos_products_calls_1calls_idb', 'many-to-many', NULL, NULL, 0, 0),
('83cae3d6-c405-4beb-e44f-5512fa441bd9', 'aor_reports_assigned_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('83edbcfd-9eb6-b194-b8ca-5512fa56ade5', 'jjwg_maps_modified_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('84397def-d346-6bb0-2b93-5512fad064ff', 'aos_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('84f5c4f7-b10f-3416-78a7-5512fa9c2d3f', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('853fd303-c277-8845-4c5d-5512fa703aaf', 'securitygroups_calls', 'SecurityGroups', 'securitygroups', 'id', 'Calls', 'calls', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Calls', 0, 0),
('854d4fbf-a710-5754-e221-5512faac2ea4', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('8645755e-4333-75ba-600a-5512fab397a6', 'aor_scheduled_reports_created_by', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('88846298-ea67-8c11-a59d-5512faa01cb0', 'yo_subdivisions_modified_user', 'Users', 'users', 'id', 'yo_Subdivisions', 'yo_subdivisions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('88ec8d2b-989b-6647-da7d-5512fa25c9eb', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8a63c4bd-9d34-3956-36aa-5512faf575de', 'opportunity_aos_contracts', 'Opportunities', 'opportunities', 'id', 'AOS_Contracts', 'aos_contracts', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8a753b33-ce38-d0dc-ea29-5512fac7d66b', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8a8df982-8883-0956-a07e-5512fad10bea', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('8ab228bb-0bcb-df97-900b-5512fa4cfd9f', 'fp_events_modified_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8b200a28-a639-702b-2717-5512facad237', 'fp_events_fp_event_locations_1', 'FP_events', 'fp_events', 'id', 'FP_Event_Locations', 'fp_event_locations', 'id', 'fp_events_fp_event_locations_1_c', 'fp_events_fp_event_locations_1fp_events_ida', 'fp_events_fp_event_locations_1fp_event_locations_idb', 'many-to-many', NULL, NULL, 0, 0),
('8bd60d30-9036-c74d-5fec-5512fae78ef7', 'aor_reports_aor_fields', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Fields', 'aor_fields', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8c400fe3-0438-7258-dfd6-5512fab6d648', 'yo_sales_yo_investingentity', 'yo_InvestingEntity', 'yo_investingentity', 'id', 'yo_Sales', 'yo_sales', 'id', 'yo_sales_yo_investingentity_c', 'yo_sales_yo_investingentityyo_investingentity_ida', 'yo_sales_yo_investingentityyo_sales_idb', 'many-to-many', NULL, NULL, 0, 0),
('8c9f6d1f-6314-2a05-7faa-5512fab61a48', 'aos_quotes_aos_product_quotes', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8d5a9ca3-97aa-79ee-5f84-5512fa589b5e', 'aos_products_documents_1', 'AOS_Products', 'aos_products', 'id', 'Documents', 'documents', 'id', 'aos_products_documents_1_c', 'aos_products_documents_1aos_products_ida', 'aos_products_documents_1documents_idb', 'many-to-many', NULL, NULL, 0, 0),
('8d65448b-ec0d-d2a0-eaf8-5512fa6bb93f', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('8d6aa595-0797-8734-d425-5512faf9d438', 'yo_investingentity_aos_products', 'yo_InvestingEntity', 'yo_investingentity', 'id', 'AOS_Products', 'aos_products', 'id', 'yo_investingentity_aos_products_c', 'yo_investingentity_aos_productsyo_investingentity_ida', 'yo_investingentity_aos_productsaos_products_idb', 'many-to-many', NULL, NULL, 0, 0),
('8f40e813-9d12-7f7d-112e-5512faf9ad7b', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8f8e3287-1c19-9868-0b9a-5512fa5bd2a4', 'jjwg_address_cache_created_by', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9001ce80-3e99-6a93-83d0-5512faba7cf0', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('914f76f9-acbb-5318-48c2-5512fa51fd39', 'yo_subdivisions_created_by', 'Users', 'users', 'id', 'yo_Subdivisions', 'yo_subdivisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('91a6a8bb-82c7-3b82-365b-5512faa4a6a1', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('928ace15-2248-263d-154b-5512fa42dffa', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('93124231-a43a-537d-4463-5512fa90e04c', 'securitygroups_campaigns', 'SecurityGroups', 'securitygroups', 'id', 'Campaigns', 'campaigns', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Campaigns', 0, 0),
('93204ae0-b414-54cb-f07b-5512fa4d3045', 'aos_products_modified_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('94f2f600-36cb-b8b0-8c60-5512facb1885', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('9531ed11-87b7-a569-9721-5512fa51daae', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('958161da-c162-13ac-3cca-5512fad37aff', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('958209cd-f4aa-09b5-0709-5512fa09b511', 'fp_events_leads_1', 'FP_events', 'fp_events', 'id', 'Leads', 'leads', 'id', 'fp_events_leads_1_c', 'fp_events_leads_1fp_events_ida', 'fp_events_leads_1leads_idb', 'many-to-many', NULL, NULL, 0, 0),
('95ca9f7c-5506-c6cd-9167-5512fa866142', 'aos_products_meetings_1', 'AOS_Products', 'aos_products', 'id', 'Meetings', 'meetings', 'id', 'aos_products_meetings_1_c', 'aos_products_meetings_1aos_products_ida', 'aos_products_meetings_1meetings_idb', 'many-to-many', NULL, NULL, 0, 0),
('95e9aac9-b67f-9b50-be0b-5512fac6eb8a', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('96a10931-bb16-5854-29db-5512faa1e238', 'yo_subdivisions_assigned_user', 'Users', 'users', 'id', 'yo_Subdivisions', 'yo_subdivisions', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('96e23298-5822-3e00-bb06-5512fa81a01f', 'aos_invoices_modified_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('97a74939-a16a-917e-fb48-5512faaf8409', 'fp_events_created_by', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('97d5778b-d432-3652-67db-5512fa110550', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('97ed41d4-d007-5cc6-a49e-5512fac737d8', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('98710bdc-6d7e-82de-8948-5512fad9b695', 'aow_workflow_modified_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('98758996-6411-6d3a-f3d3-5512fa00f26e', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Accounts', 0, 0),
('9895ef5b-54a5-1db7-0c49-5512fa5796cb', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('98e48a34-096f-85d7-ef62-5512fa406336', 'yo_investingentity_campaigns', 'yo_InvestingEntity', 'yo_investingentity', 'id', 'Campaigns', 'campaigns', 'id', 'yo_investingentity_campaigns_c', 'yo_investingentity_campaignsyo_investingentity_ida', 'yo_investingentity_campaignscampaigns_idb', 'many-to-many', NULL, NULL, 0, 0),
('9916c408-70b0-9809-be37-5512fa5080da', 'aos_quotes_aos_line_item_groups', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('997251aa-cb33-dda4-d05a-5512faf077d5', 'jjwg_address_cache_assigned_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9982325c-be1c-f303-f699-5512fa16a4a4', 'aor_reports_aor_conditions', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Conditions', 'aor_conditions', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9a7e1de5-d61e-3e11-37c4-5512fa1bfda1', 'aod_index_created_by', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9b77c96a-cc95-d712-0f4a-5512fa930b8e', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);
INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('9d297fc3-8acf-3f86-e8de-5512fab1ca43', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9d558900-7822-bba9-6f6f-5512fa164b20', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('9d9640f6-6838-6952-977c-5512fa05782c', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('9da5a770-8d73-edca-0d52-5512fa2cf1ee', 'calls_reschedule_modified_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9f12588c-3183-f0de-de2e-5512fa678767', 'fp_events_assigned_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9f157b8b-22bc-3ca9-66fc-5512faa66f39', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('9fcc530c-3f3b-46f9-8fbd-5512fadf8e4c', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a11f0d5d-96ff-cd9e-baf8-5512fae32f68', 'aos_pdf_templates_assigned_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a1317db4-5a10-f968-ffec-5512fa687db7', 'aos_invoices_created_by', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a1474b31-82df-b00f-bf66-5512fa59c01e', 'securitygroups_cases', 'SecurityGroups', 'securitygroups', 'id', 'Cases', 'cases', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Cases', 0, 0),
('a1d8056c-55c0-0b64-6533-5512fa03b6bb', 'aos_products_notes_1', 'AOS_Products', 'aos_products', 'id', 'Notes', 'notes', 'id', 'aos_products_notes_1_c', 'aos_products_notes_1aos_products_ida', 'aos_products_notes_1notes_idb', 'many-to-many', NULL, NULL, 0, 0),
('a2308c19-5589-b5e1-d423-5512faf12651', 'aos_products_created_by', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a2ac12e8-c845-3202-b5e4-5512faa54e99', 'aod_index_assigned_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a30da9d9-d07e-1d2b-ea66-5512fa4a63e9', 'yo_investingentity_leads', 'yo_InvestingEntity', 'yo_investingentity', 'id', 'Leads', 'leads', 'id', 'yo_investingentity_leads_c', 'yo_investingentity_leadsyo_investingentity_ida', 'yo_investingentity_leadsleads_idb', 'many-to-many', NULL, NULL, 0, 0),
('a350bcef-067d-22b2-113d-5512fa4ae0a1', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a4bdeeee-d704-d672-0311-5512fae360e5', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a4fdf8b2-8b92-41f3-bfd9-5512fa810eea', 'account_aos_quotes', 'Accounts', 'accounts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a54bc73b-8488-ad02-b509-5512fa97c87f', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('a68ba860-e24e-7166-2009-5512fad45dd4', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a6e642c4-97d9-8062-b1a1-5512faa70987', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a7ac6be1-5bf8-b39b-3c83-5512fa181f0a', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('a7ec45a4-d1d7-b46c-dda6-5512fa06a9d8', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a80ca994-5d6b-e470-3b5f-5512fabb8696', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('a835059e-2b57-0a91-69a2-5512fa1b344d', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a8611143-6e5d-4c85-539a-5512faf4629c', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a8de04bb-18e3-b3a7-5e8d-5512fa7b80f4', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('a9a179af-6255-c876-cba2-5512fa38edc4', 'aos_invoices_assigned_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a9bf9a15-0f7f-bd34-289f-5512fa03978f', 'calls_reschedule_created_by', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('aa69e8ef-9ee5-ffb4-7752-5512fa3e48cc', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('abb017a4-40b9-f332-a780-5512fa8a9bdb', 'aos_products_assigned_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ac7d0e0f-f571-7d1e-765c-5512fa33095c', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('acbc0847-3f04-631c-12cf-5512fa00f359', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('ad390641-5730-c272-f8ee-5512fa79d993', 'am_tasktemplates_modified_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ad6a2391-aff5-efb6-bbe4-5512faaff55f', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ae1f5210-0310-423d-d072-5512fa010268', 'account_aos_invoices', 'Accounts', 'accounts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ae355b69-dfd4-6559-d61b-5512fa12ba0c', 'securitygroups_contacts', 'SecurityGroups', 'securitygroups', 'id', 'Contacts', 'contacts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Contacts', 0, 0),
('ae86210c-69d6-5080-3b49-5512facd5948', 'aos_products_tasks_1', 'AOS_Products', 'aos_products', 'id', 'Tasks', 'tasks', 'id', 'aos_products_tasks_1_c', 'aos_products_tasks_1aos_products_ida', 'aos_products_tasks_1tasks_idb', 'many-to-many', NULL, NULL, 0, 0),
('af1ab5c7-e66b-e267-c125-5512fa924820', 'yo_marketing_aos_products', 'AOS_Products', 'aos_products', 'id', 'yo_Marketing', 'yo_marketing', 'id', 'yo_marketing_aos_products_c', 'yo_marketing_aos_productsaos_products_ida', 'yo_marketing_aos_productsyo_marketing_idb', 'many-to-many', NULL, NULL, 0, 0),
('afd77209-ef01-44e7-090a-5512fabf0cc0', 'aos_invoices_aos_product_quotes', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b01bc8e3-c38e-feea-7038-5512fa0c73d8', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b05dbd6c-7664-65e1-9ccd-5512fa0a182e', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('b06ee660-40bf-22cb-a3c5-5512fa470df1', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', NULL, NULL, 0, 0),
('b102f264-6bdc-8d39-1092-5512fab21b1a', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b158f67c-0ded-362c-268a-5512facd9f46', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('b1799407-54b2-f0f5-602f-5512fa90d587', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('b2035f51-f6c7-c5c7-6bc5-5512fa1384aa', 'jjwg_maps_created_by', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b2056e5e-9241-e4fe-bd15-5512fa3ea196', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b283f70b-c15c-7e83-c305-5512fa6b5946', 'calls_reschedule_assigned_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b2e90bb8-a0a5-0bc6-7ea1-5512faed309e', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('b2ff78c1-1ac6-c3cd-0dc0-5512fad9b468', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b3a3dc64-3a52-cbba-f2d8-5512fad41c22', 'aos_contracts_modified_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b5778fc7-8cd0-870b-88c9-5512faf4c6f6', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('b5c9e80c-879c-c025-8ea3-5512fa676b77', 'product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Products', 'aos_products', 'aos_product_category_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b686d8f7-9f35-ecc8-a890-5512faa1ad17', 'aow_conditions_modified_user', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b8133047-2949-72ab-beeb-5512fa47363f', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', 0, 0),
('b8994f01-3e91-3239-146a-5512fac99f8a', 'account_aos_contracts', 'Accounts', 'accounts', 'id', 'AOS_Contracts', 'aos_contracts', 'contract_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b8d30861-e55c-65b8-f238-5512fa462870', 'aos_products_yo_marketing_1', 'AOS_Products', 'aos_products', 'id', 'yo_Marketing', 'yo_marketing', 'id', 'aos_products_yo_marketing_1_c', 'aos_products_yo_marketing_1aos_products_ida', 'aos_products_yo_marketing_1yo_marketing_idb', 'many-to-many', NULL, NULL, 0, 0),
('b8d375de-2be0-f8fd-a146-5512fa09254a', 'jjwg_maps_assigned_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b90019ff-401f-f00f-eb88-5512fa7ae789', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('bafd096d-1966-db1f-7ab4-5512fa25f4f3', 'securitygroups_documents', 'SecurityGroups', 'securitygroups', 'id', 'Documents', 'documents', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Documents', 0, 0),
('bb579765-059f-3879-1654-5512fa507f4c', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('bb5d13b4-7bb2-78f3-8b66-5512fa858140', 'aos_invoices_aos_line_item_groups', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bb5d1ed7-4df9-f4a8-2e03-5512fa7408c7', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bb6423ab-a0de-5e18-e8d3-5512faed1ddb', 'yo_marketing_tasks', 'yo_Marketing', 'yo_marketing', 'id', 'Tasks', 'tasks', 'id', 'yo_marketing_tasks_c', 'yo_marketing_tasksyo_marketing_ida', 'yo_marketing_taskstasks_idb', 'many-to-many', NULL, NULL, 0, 0),
('bb9fca7d-c2f4-1e55-87d7-5512fa7e48b9', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bc115612-c126-ede8-12e7-5512fa07d045', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('bc4a447f-5c30-ab76-2bf6-5512fa7c448c', 'aor_scheduled_reports_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bc8cfddd-bc24-b978-4236-5512fa7934e7', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', NULL, NULL, 0, 0),
('bc99aaee-d442-8fcd-b0da-5512fad2cdb3', 'aos_contracts_created_by', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd2757ca-cfa6-64f7-a400-5512faf56c78', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bf9f6c9b-5356-87a8-e6a3-5512faf60541', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('bfeaecaf-e306-ee50-a2d5-5512fadfbc27', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('c068f86d-1dc3-b537-7a53-5512fa03da73', 'am_projecttemplates_modified_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c1c34b2e-cd75-e312-8ea4-5512fa4df0d7', 'yo_investingentity_modified_user', 'Users', 'users', 'id', 'yo_InvestingEntity', 'yo_investingentity', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c21c5bd4-5c4d-7a2a-3acb-5512fac11e55', 'aos_contracts_assigned_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c22c56f5-028a-321b-1f2a-5512faf3562f', 'aow_conditions_created_by', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c3aa6502-a5ad-f45c-9571-5512fa11f563', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('c49aa498-ba34-562a-394d-5512fac22045', 'aos_quotes_aos_contracts', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'aos_quotes_os_contracts_c', 'aos_quotese81e_quotes_ida', 'aos_quotes4dc0ntracts_idb', 'many-to-many', NULL, NULL, 0, 0),
('c51201bd-3d8b-5ad7-b31a-5512fa26fe86', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c53a7ee8-c6c6-7995-2edc-5512fa65a11e', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c59835af-0943-2a15-52af-5512fab20b47', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c5b76677-6090-b79d-a496-5512fa1f3999', 'fp_event_locations_modified_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c6dfd21b-5b0f-cb14-4a76-5512fa3b3a83', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('c6e12105-60b7-3dbc-2edd-5512fa666b5a', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c71df500-ec54-f681-39a4-5512fa9c1702', 'yo_marketing_yo_investingentity', 'yo_InvestingEntity', 'yo_investingentity', 'id', 'yo_Marketing', 'yo_marketing', 'id', 'yo_marketing_yo_investingentity_c', 'yo_marketing_yo_investingentityyo_investingentity_ida', 'yo_marketing_yo_investingentityyo_marketing_idb', 'many-to-many', NULL, NULL, 0, 0),
('c733b354-8bc1-dd9b-d8a2-5512fae875fc', 'securitygroups_emails', 'SecurityGroups', 'securitygroups', 'id', 'Emails', 'emails', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Emails', 0, 0),
('c770cbad-7427-8916-93af-5512fa097861', 'aow_actions_modified_user', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c7969dd9-f80a-c9f9-8a59-5512fa60624e', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('c7b315ce-6ed4-f5f8-2403-5512fa7fd020', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('c821edaf-599f-6830-ebc6-5512fa9028f6', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('c9641e56-4ded-f041-f381-5512faec3158', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', 0, 0),
('ca1f96fd-7bd8-307f-0033-5512fa55605c', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('ca391eab-d520-366a-688c-5512fa571bf3', 'aos_contracts_aos_products_quotes', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ca4009e9-12bc-1d58-f941-5512fa9ac737', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cb3bb356-bb22-f8f3-81e2-5512fafa3c54', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cb8898cc-a66b-00af-da4f-5512faeb7ece', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cbb1d3d9-383f-7f91-129b-5512fa391d04', 'aop_case_events_modified_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cc444833-faba-3368-f683-5512fa9eba46', 'am_projecttemplates_created_by', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ce92ad06-0a94-33dd-3500-5512fad327c3', 'aos_quotes_aos_invoices', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Invoices', 'aos_invoices', 'id', 'aos_quotes_aos_invoices_c', 'aos_quotes77d9_quotes_ida', 'aos_quotes6b83nvoices_idb', 'many-to-many', NULL, NULL, 0, 0),
('cf823db3-3071-0749-6358-5512fa9f8176', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d0d6d2d6-7851-17c0-9f20-5512fa7351e3', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d0f6c92b-4ff3-6530-f4d3-5512fac42144', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d10aad84-71ff-50be-6cc8-5512fa5997e8', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('d1312cc7-e636-b10e-c31d-5512fa1badf2', 'securitygroups_emailtemplates', 'SecurityGroups', 'securitygroups', 'id', 'EmailTemplates', 'email_templates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'EmailTemplates', 0, 0),
('d1385f08-d067-d51e-2406-5512fa3d4e94', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d153eade-26bc-5bfd-649d-5512fad12d9e', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', NULL, NULL, 0, 0),
('d1d55552-ce00-c1a3-9fbe-5512fa7faf32', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('d2b54c05-c1ef-559a-5f47-5512faf089e2', 'fp_event_locations_created_by', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d3114c8c-3446-ebd2-4ff3-5512fa1dd391', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('d3ef5221-cbd6-b3ac-938e-5512fa6c0d55', 'yo_sales_accounts', 'Accounts', 'accounts', 'id', 'yo_Sales', 'yo_sales', 'id', 'yo_sales_accounts_c', 'yo_sales_accountsaccounts_ida', 'yo_sales_accountsyo_sales_idb', 'many-to-many', NULL, NULL, 0, 0),
('d4b17fba-f629-8842-9d9a-5512fac3e380', 'aos_contracts_aos_line_item_groups', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d4ec408f-ada9-05da-a1e5-5512fa9fca3b', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d5969c00-f747-fddc-f09b-5512fa925258', 'aow_actions_created_by', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d59febfb-0505-1c51-bc01-5512fa6b9bdb', 'am_projecttemplates_assigned_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d662dff5-2c79-3441-7f1f-5512fa6e685e', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d6b3826b-54ad-8777-d320-5512faacc905', 'aos_quotes_project', 'AOS_Quotes', 'aos_quotes', 'id', 'Project', 'project', 'id', 'aos_quotes_project_c', 'aos_quotes1112_quotes_ida', 'aos_quotes7207project_idb', 'many-to-many', NULL, NULL, 0, 0),
('d7c18455-b969-926b-12c6-5512fa8f4350', 'fp_event_locations_assigned_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d8d97e59-a7e6-b869-44ca-5512fad43675', 'yo_investingentity_created_by', 'Users', 'users', 'id', 'yo_InvestingEntity', 'yo_investingentity', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d8e26123-91f5-801c-1a5b-5512fa8d9030', 'aop_case_events_created_by', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d95fe171-9a92-f274-c559-5512fade9afe', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('d96f39f4-8d77-8d19-c0d3-5512fa3e11a8', 'securitygroups_modified_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d97ccba7-d2fd-892e-cd39-5512fab2759d', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Prospects', 0, 0),
('da54d3da-dff9-fc3c-cc2b-5512fa65e3c3', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('db5900bd-8726-7ae6-02b7-5512fae404bd', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('dbaa4bea-8e08-0bde-d900-5512fa8cea13', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', 0, 0),
('dbcf8d35-48ca-09c3-5df5-5512faf8fa92', 'cases_created_contact', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'contact_created_by_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dc4bf443-6d94-7647-1192-5512fa02b719', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('dd50ac4d-7c29-8aa4-ba10-5512fa5ae3b5', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dde610f9-4903-46e0-4c60-5512faa7e64b', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', 0, 0),
('de4c40dc-e527-e1d7-8b1d-5512fa8dd8fa', 'securitygroups_leads', 'SecurityGroups', 'securitygroups', 'id', 'Leads', 'leads', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Leads', 0, 0),
('df5843ed-3d0a-49ed-049d-5512fa52ce45', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('e06ebcb8-c9ce-e620-3e06-5512faf1f36c', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e06f85ed-8f6f-621b-c903-5512fae7c298', 'optimistic_locking', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
('e11300f9-f081-6a77-a00d-5512fa1196b1', 'aor_fields_modified_user', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e15133c0-ae33-5570-3c53-5512fac11619', 'yo_sales_aos_products', 'yo_Sales', 'yo_sales', 'id', 'AOS_Products', 'aos_products', 'id', 'yo_sales_aos_products_c', 'yo_sales_aos_productsyo_sales_ida', 'yo_sales_aos_productsaos_products_idb', 'many-to-many', NULL, NULL, 0, 0),
('e23e3035-ae07-a712-c4cf-5512fa43c1d6', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e28de9fe-3f31-c6e7-f912-5512fa16ba3a', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e2d278fb-ede4-1a58-2108-5512fa183860', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', 0, 0),
('e303d4f0-7424-081a-9bf1-5512fa45a6a1', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('e30d8aca-2521-f379-52be-5512fa1ed1f3', 'aow_processed_aow_actions', 'AOW_Processed', 'aow_processed', 'id', 'AOW_Actions', 'aow_actions', 'id', 'aow_processed_aow_actions', 'aow_processed_id', 'aow_action_id', 'many-to-many', NULL, NULL, 0, 0),
('e32b8031-9985-65cb-fb74-5512fad73b5f', 'aop_case_events_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e3b22f27-4ce4-113b-143b-5512faca944c', 'yo_investingentity_assigned_user', 'Users', 'users', 'id', 'yo_InvestingEntity', 'yo_investingentity', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e3b80502-545e-e073-e89f-5512faaf96c0', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('e3e127b1-ae5b-5e85-ebdf-5512fa1023d1', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e48ac910-0f0b-fd86-81de-5512fa4d5b78', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('e63747f9-a615-2b17-0ccd-5512fac0fd94', 'aos_products_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e6aeb625-0fd6-4dad-3cca-5512fa7010c5', 'jjwg_markers_modified_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e6fe038f-cdf3-01fd-2cc4-5512fa9119e1', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e7dd8bac-45c2-4700-f1a4-5512fa59b65a', 'aos_pdf_templates_modified_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e8300246-af67-108a-f9fb-5512fa2c3087', 'securitygroups_opportunities', 'SecurityGroups', 'securitygroups', 'id', 'Opportunities', 'opportunities', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Opportunities', 0, 0),
('e891bb9a-e358-c816-f876-5512fac20b08', 'yo_sales_tasks', 'yo_Sales', 'yo_sales', 'id', 'Tasks', 'tasks', 'id', 'yo_sales_tasks_c', 'yo_sales_tasksyo_sales_ida', 'yo_sales_taskstasks_idb', 'many-to-many', NULL, NULL, 0, 0),
('e8e5398a-c693-6725-7586-5512fae8b48d', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e92678a1-a042-0367-cb98-5512fa96d499', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('ea6f0e4c-fd1e-f6a7-37f7-5512fa7a324a', 'unified_search', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
('ea979d7b-b90b-1993-f02d-5512fa453e21', 'yo_amortizationschedule_modified_user', 'Users', 'users', 'id', 'yo_AmortizationSchedule', 'yo_amortizationschedule', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eaca2659-a601-0c06-6cf2-5512fa887e56', 'aor_fields_created_by', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eb4ee144-56b6-3f11-0974-5512fa2ac38b', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('eb86fe20-cebc-d1af-796c-5512fa982b40', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec09c190-000b-41a3-f4ad-5512fa3f3065', 'cases_aop_case_events', 'Cases', 'cases', 'id', 'AOP_Case_Events', 'aop_case_events', 'case_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec413714-53e5-6aad-0123-5512fabdda4b', 'fp_events_contacts', 'FP_events', 'fp_events', 'id', 'Contacts', 'contacts', 'id', 'fp_events_contacts_c', 'fp_events_contactsfp_events_ida', 'fp_events_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('ec58332a-876c-12f0-d9aa-5512fad50ad8', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ece23dc2-26ad-f0b9-99f4-5512faa14641', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ecf844c4-c5d8-4bcf-ff17-5512fac6d86e', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', 0, 0),
('ed4f448a-2931-d3d2-2d9c-5512faa9f3e9', 'securitygroups_meetings', 'SecurityGroups', 'securitygroups', 'id', 'Meetings', 'meetings', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Meetings', 0, 0),
('ef4d6eb8-9a29-d456-0f02-5512fad44275', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f0547674-82c1-18eb-a5bd-5512fa3824c0', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f0652233-ec83-caa9-4c3b-5512fa200d2f', 'securitygroups_created_by', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f13cd0b5-c99e-dbb8-23c6-5512faedcb59', 'jjwg_markers_created_by', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f1c1361a-8b15-9200-fdd5-5512fa5affc5', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('f2269b14-60b2-8b42-10e5-5512fab7fb97', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', 0, 0),
('f3190b2f-9804-33e8-297a-5512fabe0194', 'aos_product_quotes_aos_products', 'AOS_Products', 'aos_products', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'product_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3be6584-bebc-ab98-be7b-5512fa04308c', 'aos_products_quotes_created_by', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `releases`
--

CREATE TABLE IF NOT EXISTS `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_modules`
--

CREATE TABLE IF NOT EXISTS `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE IF NOT EXISTS `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedulers`
--

CREATE TABLE IF NOT EXISTS `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedulers`
--

INSERT INTO `schedulers` (`id`, `deleted`, `date_entered`, `date_modified`, `created_by`, `modified_user_id`, `name`, `job`, `date_time_start`, `date_time_end`, `job_interval`, `time_from`, `time_to`, `last_run`, `status`, `catch_up`) VALUES
('3036d4d1-cac1-efd2-d12e-550dc58fe584', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run Scheduled Reports', 'function::aorRunScheduledReports', '2005-01-01 11:15:00', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 1),
('4d0ab373-75df-9c74-7c36-550dc4d5f527', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Prune SugarFeed Tables', 'function::trimSugarFeeds', '2005-01-01 12:30:01', '2020-12-31 23:59:59', '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('4e9d77ad-5bdc-a84c-984a-550dc4b789c5', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Removal of documents from filesystem', 'function::removeDocumentsFromFS', '2012-01-01 15:00:01', '2030-12-31 23:59:59', '0::3::1::*::*', NULL, NULL, NULL, 'Active', 0),
('584408b3-1b93-a757-0929-550dc47c90b3', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2005-01-01 16:15:01', '2020-12-31 23:59:59', '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('64796408-60b0-dc84-3c40-550dc40af99b', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2012-01-01 19:00:01', '2030-12-31 23:59:59', '0::5::*::*::*', NULL, NULL, NULL, 'Active', 0),
('65ec5fe4-34b0-1677-36eb-550dc437ba52', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2005-01-01 10:30:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('6b9352b1-299b-c7dc-dcfa-550dc4b19d10', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxes', '2005-01-01 17:45:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Inactive', 0),
('6bb4a770-26ba-3a77-96b8-550dc4b1d0cf', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2008-01-01 11:45:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('6e9cfa0f-b773-4022-d71c-550dc4a66547', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2005-01-01 06:15:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('706c7cc1-9577-213e-771b-550dc4e73f96', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2005-01-01 18:00:01', '2020-12-31 23:59:59', '0::4::1::*::*', NULL, NULL, NULL, 'Inactive', 0),
('a26eef8d-ab0e-1b7e-4ae0-550dc5091bcf', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Perform Lucene Index', 'function::aodIndexUnindexed', '2005-01-01 11:15:00', NULL, '0::0::*::*::*', NULL, NULL, NULL, 'Active', 1),
('bb4f54c9-fd2f-9619-d01f-550dc5954f9b', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'AOP Check Inbound Mailboxes', 'function::pollMonitoredInboxesAOP', '2005-01-01 11:15:00', '2020-12-31 00:00:00', '*/1::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('d7743263-5b4b-14b3-dbc7-550dc47401cb', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run AOW WorkFlow', 'function::processAOW_Workflow', '2005-01-01 19:45:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('d8f4c323-4a52-777b-5b38-550dc5935d5d', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Optimise AOD Index', 'function::aodOptimiseIndex', '2005-01-01 11:15:00', NULL, '0::*/3::*::*::*', NULL, NULL, NULL, 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups`
--

CREATE TABLE IF NOT EXISTS `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_acl_roles`
--

CREATE TABLE IF NOT EXISTS `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_audit`
--

CREATE TABLE IF NOT EXISTS `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_default`
--

CREATE TABLE IF NOT EXISTS `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_records`
--

CREATE TABLE IF NOT EXISTS `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_users`
--

CREATE TABLE IF NOT EXISTS `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `securitygroups_users_idxa` (`securitygroup_id`),
  KEY `securitygroups_users_idxb` (`user_id`),
  KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sugarfeed`
--

CREATE TABLE IF NOT EXISTS `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`id`, `monitor_id`, `user_id`, `module_name`, `item_id`, `item_summary`, `date_modified`, `action`, `session_id`, `visible`, `deleted`) VALUES
(3, '9219687b-bccb-2b6c-3059-550ebd343db7', '1', 'yo_Subdivisions', '9530ee91-8999-2a2e-7641-550ebbf28d79', 'test', '2015-03-22 13:04:50', 'detailview', 'g49k1noctkieadkl4b4dfakce7', 1, 0),
(4, 'bd7b0091-37cc-443d-c9b0-550ec00900ea', '1', 'yo_County', 'a8f527e4-2919-4331-11a1-550ec0f844b1', 'qweqweqwe', '2015-03-22 13:13:59', 'detailview', 'g49k1noctkieadkl4b4dfakce7', 1, 0),
(12, '2ff69790-9b38-aa91-0a7c-550f05154aa2', '1', 'yo_Sales', 'c7b3da21-95f0-1701-5adf-550f05387255', '--', '2015-03-22 18:11:09', 'detailview', 'g49k1noctkieadkl4b4dfakce7', 1, 0),
(16, '5c8f1088-df02-4fdd-77be-55105b903a66', '1', 'yo_Sales', '292c792a-8762-2415-1a8f-550ef86b2e5a', '--', '2015-03-23 18:27:51', 'detailview', 'rmtij0nbruuirjk020hkg8cqh1', 1, 0),
(18, '37da7fe0-1eeb-5fdb-53b6-5512d42bbc17', '1', 'Users', '1', 'Administrator', '2015-03-25 15:31:18', 'editview', 'q8i84c3eokj8skhr3kiv080540', 1, 0),
(30, '6fcb9547-11ec-ca22-9bde-551302516d79', '1', 'AOS_Products', 'd9daa91c-d36a-57c3-84c8-5512f851a4fe', '123123123', '2015-03-25 18:44:20', 'detailview', 'q8i84c3eokj8skhr3kiv080540', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_history`
--

CREATE TABLE IF NOT EXISTS `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upgrade_history`
--

INSERT INTO `upgrade_history` (`id`, `filename`, `md5sum`, `type`, `status`, `version`, `name`, `description`, `id_name`, `manifest`, `date_entered`, `enabled`) VALUES
('c2f306df-29dd-a3ef-07b4-550ef31ba144', 'upload/upgrades/module/amortization2015_03_22_175217.zip', '49eeaabb11fc4ac37591e52fce91d4de', 'module', 'installed', '1427043135', 'amortization', '', 'amortization', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoieW8iO3M6NjoiYXV0aG9yIjtzOjEwOiJCcmlza2xvZ2l4IjtzOjExOiJkZXNjcmlwdGlvbiI7czowOiIiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6MTI6ImFtb3J0aXphdGlvbiI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMTUtMDMtMjIgMTY6NTI6MTUiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNDI3MDQzMTM1O3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6OTp7czoyOiJpZCI7czoxMjoiYW1vcnRpemF0aW9uIjtzOjU6ImJlYW5zIjthOjE6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjIzOiJ5b19BbW9ydGl6YXRpb25TY2hlZHVsZSI7czo1OiJjbGFzcyI7czoyMzoieW9fQW1vcnRpemF0aW9uU2NoZWR1bGUiO3M6NDoicGF0aCI7czo1OToibW9kdWxlcy95b19BbW9ydGl6YXRpb25TY2hlZHVsZS95b19BbW9ydGl6YXRpb25TY2hlZHVsZS5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo5NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL3lvX2Ftb3J0aXphdGlvbnNjaGVkdWxlX3lvX3NhbGVzX3lvX1NhbGVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoieW9fU2FsZXMiO319czoxMzoicmVsYXRpb25zaGlwcyI7YToxOntpOjA7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3lvX2Ftb3J0aXphdGlvbnNjaGVkdWxlX3lvX3NhbGVzTWV0YURhdGEucGhwIjt9fXM6OToiaW1hZ2VfZGlyIjtzOjE2OiI8YmFzZXBhdGg+L2ljb25zIjtzOjQ6ImNvcHkiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjU1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL3lvX0Ftb3J0aXphdGlvblNjaGVkdWxlIjtzOjI6InRvIjtzOjMxOiJtb2R1bGVzL3lvX0Ftb3J0aXphdGlvblNjaGVkdWxlIjt9fXM6ODoibGFuZ3VhZ2UiO2E6Nzp7aTowO2E6Mzp7czo0OiJmcm9tIjtzOjc0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX0Ftb3J0aXphdGlvblNjaGVkdWxlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjM6InlvX0Ftb3J0aXphdGlvblNjaGVkdWxlIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxO2E6Mzp7czo0OiJmcm9tIjtzOjc0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX0Ftb3J0aXphdGlvblNjaGVkdWxlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjM6InlvX0Ftb3J0aXphdGlvblNjaGVkdWxlIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyO2E6Mzp7czo0OiJmcm9tIjtzOjc0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX0Ftb3J0aXphdGlvblNjaGVkdWxlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjM6InlvX0Ftb3J0aXphdGlvblNjaGVkdWxlIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX1NhbGVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoieW9fU2FsZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjQ7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fU2FsZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJ5b19TYWxlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6NTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo2O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fXM6NzoidmFyZGVmcyI7YToyOntpOjA7YToyOntzOjQ6ImZyb20iO3M6MTA2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fYW1vcnRpemF0aW9uc2NoZWR1bGVfeW9fc2FsZXNfeW9fQW1vcnRpemF0aW9uU2NoZWR1bGUucGhwIjtzOjk6InRvX21vZHVsZSI7czoyMzoieW9fQW1vcnRpemF0aW9uU2NoZWR1bGUiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6OTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19hbW9ydGl6YXRpb25zY2hlZHVsZV95b19zYWxlc195b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjt9fXM6MTI6ImxheW91dGZpZWxkcyI7YToxOntpOjA7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YTowOnt9fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=', '2015-03-22 16:52:15', 1),
('d5342b76-789e-e6af-1d57-550ed239f0f8', 'upload/upgrades/module/investing_entity2015_03_22_153204.zip', '2b19abbddea537550fda90befcdc3e85', 'module', 'installed', '1427034717', 'investing_entity', '', 'investing_entity', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoieW8iO3M6NjoiYXV0aG9yIjtzOjEwOiJCcmlza2xvZ2l4IjtzOjExOiJkZXNjcmlwdGlvbiI7czowOiIiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6MTY6ImludmVzdGluZ19lbnRpdHkiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjE5OiIyMDE1LTAzLTIyIDE0OjMxOjU3IjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjc6InZlcnNpb24iO2k6MTQyNzAzNDcxNztzOjEzOiJyZW1vdmVfdGFibGVzIjtzOjY6InByb21wdCI7fXM6MTE6Imluc3RhbGxkZWZzIjthOjk6e3M6MjoiaWQiO3M6MTY6ImludmVzdGluZ19lbnRpdHkiO3M6NToiYmVhbnMiO2E6Mjp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6MTg6InlvX0ludmVzdGluZ0VudGl0eSI7czo1OiJjbGFzcyI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjQ6InBhdGgiO3M6NDk6Im1vZHVsZXMveW9fSW52ZXN0aW5nRW50aXR5L3lvX0ludmVzdGluZ0VudGl0eS5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjU6ImNsYXNzIjtzOjg6InlvX1NhbGVzIjtzOjQ6InBhdGgiO3M6Mjk6Im1vZHVsZXMveW9fU2FsZXMveW9fU2FsZXMucGhwIjtzOjM6InRhYiI7YjoxO319czoxMDoibGF5b3V0ZGVmcyI7YTo3OntpOjA7YToyOntzOjQ6ImZyb20iO3M6MTAzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9faW52ZXN0aW5nZW50aXR5X2Fvc19wcm9kdWN0c195b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5Ijt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9faW52ZXN0aW5nZW50aXR5X2xlYWRzX3lvX0ludmVzdGluZ0VudGl0eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJ5b19JbnZlc3RpbmdFbnRpdHkiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6MTAwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9faW52ZXN0aW5nZW50aXR5X2NhbXBhaWduc195b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5Ijt9aTozO2E6Mjp7czo0OiJmcm9tIjtzOjk5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fc2FsZXNfeW9faW52ZXN0aW5nZW50aXR5X3lvX0ludmVzdGluZ0VudGl0eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJ5b19JbnZlc3RpbmdFbnRpdHkiO31pOjQ7YToyOntzOjQ6ImZyb20iO3M6Nzk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy95b19zYWxlc19hY2NvdW50c19BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fc2FsZXNfdGFza3NfVGFza3MucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJUYXNrcyI7fWk6NjthOjI6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL3lvX3NhbGVzX3Rhc2tzX3lvX1NhbGVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoieW9fU2FsZXMiO319czoxMzoicmVsYXRpb25zaGlwcyI7YTo3OntpOjA7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3lvX2ludmVzdGluZ2VudGl0eV9hb3NfcHJvZHVjdHNNZXRhRGF0YS5waHAiO31pOjE7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3lvX2ludmVzdGluZ2VudGl0eV9sZWFkc01ldGFEYXRhLnBocCI7fWk6MjthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMveW9faW52ZXN0aW5nZW50aXR5X2NhbXBhaWduc01ldGFEYXRhLnBocCI7fWk6MzthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMveW9fc2FsZXNfeW9faW52ZXN0aW5nZW50aXR5TWV0YURhdGEucGhwIjt9aTo0O2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6ODE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy95b19zYWxlc19hY2NvdW50c01ldGFEYXRhLnBocCI7fWk6NTthOjE6e3M6OToibWV0YV9kYXRhIjtzOjc4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMveW9fc2FsZXNfdGFza3NNZXRhRGF0YS5waHAiO31pOjY7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3lvX3NhbGVzX2Fvc19wcm9kdWN0c01ldGFEYXRhLnBocCI7fX1zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjI6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo1MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy95b19JbnZlc3RpbmdFbnRpdHkiO3M6MjoidG8iO3M6MjY6Im1vZHVsZXMveW9fSW52ZXN0aW5nRW50aXR5Ijt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjQwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL3lvX1NhbGVzIjtzOjI6InRvIjtzOjE2OiJtb2R1bGVzL3lvX1NhbGVzIjt9fXM6ODoibGFuZ3VhZ2UiO2E6NDM6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BT1NfUHJvZHVjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiQU9TX1Byb2R1Y3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxO2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FPU19Qcm9kdWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjI7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQU9TX1Byb2R1Y3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IkFPU19Qcm9kdWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MzthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo0O2E6Mzp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX0ludmVzdGluZ0VudGl0eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJ5b19JbnZlc3RpbmdFbnRpdHkiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjU7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fSW52ZXN0aW5nRW50aXR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6InlvX0ludmVzdGluZ0VudGl0eSI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6NjthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9MZWFkcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo3O2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjg7YTozOntzOjQ6ImZyb20iO3M6NTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvTGVhZHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6OTthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxMDthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToxMTthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxMjthOjM6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9DYW1wYWlnbnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEzO2E6Mzp7czo0OiJmcm9tIjtzOjYwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NhbXBhaWducy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkNhbXBhaWducyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6MTQ7YTozOntzOjQ6ImZyb20iO3M6NjA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQ2FtcGFpZ25zLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiQ2FtcGFpZ25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNTthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxNjthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToxNzthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxODthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxOTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyMDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToyMTthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyMjthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyMzthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToyNDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyNTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyNjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToyNzthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyODthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyOTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BY2NvdW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozMDthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9UYXNrcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTozMTthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9UYXNrcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTozMjthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9UYXNrcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozMzthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTozNDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTozNTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozNjthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BT1NfUHJvZHVjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiQU9TX1Byb2R1Y3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTozNzthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BT1NfUHJvZHVjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiQU9TX1Byb2R1Y3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTozODthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BT1NfUHJvZHVjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiQU9TX1Byb2R1Y3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozOTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo0MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTo0MTthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo0MjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX1zOjc6InZhcmRlZnMiO2E6MTQ6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo5NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX2ludmVzdGluZ2VudGl0eV9hb3NfcHJvZHVjdHNfQU9TX1Byb2R1Y3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IkFPU19Qcm9kdWN0cyI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czoxMDA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19pbnZlc3RpbmdlbnRpdHlfYW9zX3Byb2R1Y3RzX3lvX0ludmVzdGluZ0VudGl0eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJ5b19JbnZlc3RpbmdFbnRpdHkiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6ODA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19pbnZlc3RpbmdlbnRpdHlfbGVhZHNfTGVhZHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czo5MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX2ludmVzdGluZ2VudGl0eV9sZWFkc195b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5Ijt9aTo0O2E6Mjp7czo0OiJmcm9tIjtzOjg4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9faW52ZXN0aW5nZW50aXR5X2NhbXBhaWduc19DYW1wYWlnbnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO31pOjU7YToyOntzOjQ6ImZyb20iO3M6OTc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19pbnZlc3RpbmdlbnRpdHlfY2FtcGFpZ25zX3lvX0ludmVzdGluZ0VudGl0eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE4OiJ5b19JbnZlc3RpbmdFbnRpdHkiO31pOjY7YToyOntzOjQ6ImZyb20iO3M6ODY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19zYWxlc195b19pbnZlc3RpbmdlbnRpdHlfeW9fU2FsZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJ5b19TYWxlcyI7fWk6NzthOjI6e3M6NDoiZnJvbSI7czo5NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX3NhbGVzX3lvX2ludmVzdGluZ2VudGl0eV95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5Ijt9aTo4O2E6Mjp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fc2FsZXNfYWNjb3VudHNfeW9fU2FsZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJ5b19TYWxlcyI7fWk6OTthOjI6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX3NhbGVzX2FjY291bnRzX0FjY291bnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO31pOjEwO2E6Mjp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fc2FsZXNfdGFza3NfVGFza3MucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJUYXNrcyI7fWk6MTE7YToyOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19zYWxlc190YXNrc195b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjt9aToxMjthOjI6e3M6NDoiZnJvbSI7czo4NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX3NhbGVzX2Fvc19wcm9kdWN0c19BT1NfUHJvZHVjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiQU9TX1Byb2R1Y3RzIjt9aToxMzthOjI6e3M6NDoiZnJvbSI7czo4MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX3NhbGVzX2Fvc19wcm9kdWN0c195b19TYWxlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6InlvX1NhbGVzIjt9fXM6MTI6ImxheW91dGZpZWxkcyI7YTo2OntpOjA7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YToxOntzOjEyOiJBT1NfUHJvZHVjdHMiO3M6MzY6InlvX2ludmVzdGluZ2VudGl0eV9hb3NfcHJvZHVjdHNfbmFtZSI7fX1pOjE7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YToxOntzOjU6IkxlYWRzIjtzOjI5OiJ5b19pbnZlc3RpbmdlbnRpdHlfbGVhZHNfbmFtZSI7fX1pOjI7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YToxOntzOjk6IkNhbXBhaWducyI7czozMzoieW9faW52ZXN0aW5nZW50aXR5X2NhbXBhaWduc19uYW1lIjt9fWk6MzthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjA6e319aTo0O2E6MTp7czoxNzoiYWRkaXRpb25hbF9maWVsZHMiO2E6MDp7fX1pOjU7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YToxOntzOjEyOiJBT1NfUHJvZHVjdHMiO3M6MjY6InlvX3NhbGVzX2Fvc19wcm9kdWN0c19uYW1lIjt9fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=', '2015-03-22 14:31:57', 1),
('d5410c76-25bf-7d80-56e9-550eb382ca1b', 'upload/upgrades/module/county_subdivisions2015_03_22_131918.zip', '3e8e8a336cc4aa2d1ee6a0464b000a09', 'module', 'installed', '1427026754', 'county_subdivisions', '', 'county_subdivisions', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoieW8iO3M6NjoiYXV0aG9yIjtzOjEwOiJicmlza2xvZ2l4IjtzOjExOiJkZXNjcmlwdGlvbiI7czowOiIiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6MTk6ImNvdW50eV9zdWJkaXZpc2lvbnMiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjE5OiIyMDE1LTAzLTIyIDEyOjE5OjEzIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjc6InZlcnNpb24iO2k6MTQyNzAyNjc1NDtzOjEzOiJyZW1vdmVfdGFibGVzIjtzOjY6InByb21wdCI7fXM6MTE6Imluc3RhbGxkZWZzIjthOjk6e3M6MjoiaWQiO3M6MTk6ImNvdW50eV9zdWJkaXZpc2lvbnMiO3M6NToiYmVhbnMiO2E6Mjp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6OToieW9fQ291bnR5IjtzOjU6ImNsYXNzIjtzOjk6InlvX0NvdW50eSI7czo0OiJwYXRoIjtzOjMxOiJtb2R1bGVzL3lvX0NvdW50eS95b19Db3VudHkucGhwIjtzOjM6InRhYiI7YjoxO31pOjE7YTo0OntzOjY6Im1vZHVsZSI7czoxNToieW9fU3ViZGl2aXNpb25zIjtzOjU6ImNsYXNzIjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO3M6NDoicGF0aCI7czo0MzoibW9kdWxlcy95b19TdWJkaXZpc2lvbnMveW9fU3ViZGl2aXNpb25zLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6Njp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjgxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fY291bnR5X2NvbnRhY3RzX3lvX0NvdW50eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6InlvX0NvdW50eSI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czo4MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL3lvX2NvdW50eV9jYW1wYWlnbnNfeW9fQ291bnR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToieW9fQ291bnR5Ijt9aToyO2E6Mjp7czo0OiJmcm9tIjtzOjc4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fY291bnR5X2xlYWRzX3lvX0NvdW50eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6InlvX0NvdW50eSI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czo4NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL3lvX2NvdW50eV9hb3NfcHJvZHVjdHNfeW9fQ291bnR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToieW9fQ291bnR5Ijt9aTo0O2E6Mjp7czo0OiJmcm9tIjtzOjk0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fc3ViZGl2aXNpb25zX2NhbXBhaWduc195b19TdWJkaXZpc2lvbnMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNToieW9fU3ViZGl2aXNpb25zIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjk3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fc3ViZGl2aXNpb25zX2Fvc19wcm9kdWN0c195b19TdWJkaXZpc2lvbnMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNToieW9fU3ViZGl2aXNpb25zIjt9fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6Njp7aTowO2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6ODI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy95b19jb3VudHlfY29udGFjdHNNZXRhRGF0YS5waHAiO31pOjE7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3lvX2NvdW50eV9jYW1wYWlnbnNNZXRhRGF0YS5waHAiO31pOjI7YToxOntzOjk6Im1ldGFfZGF0YSI7czo3OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3lvX2NvdW50eV9sZWFkc01ldGFEYXRhLnBocCI7fWk6MzthOjE6e3M6OToibWV0YV9kYXRhIjtzOjg2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMveW9fY291bnR5X2Fvc19wcm9kdWN0c01ldGFEYXRhLnBocCI7fWk6NDthOjE6e3M6OToibWV0YV9kYXRhIjtzOjg5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMveW9fc3ViZGl2aXNpb25zX2NhbXBhaWduc01ldGFEYXRhLnBocCI7fWk6NTthOjE6e3M6OToibWV0YV9kYXRhIjtzOjkyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMveW9fc3ViZGl2aXNpb25zX2Fvc19wcm9kdWN0c01ldGFEYXRhLnBocCI7fX1zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjI6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo0MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy95b19Db3VudHkiO3M6MjoidG8iO3M6MTc6Im1vZHVsZXMveW9fQ291bnR5Ijt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjQ3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL3lvX1N1YmRpdmlzaW9ucyI7czoyOiJ0byI7czoyMzoibW9kdWxlcy95b19TdWJkaXZpc2lvbnMiO319czo4OiJsYW5ndWFnZSI7YTozNzp7aTowO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQ29udGFjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6MjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Db250YWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTozO2E6Mzp7czo0OiJmcm9tIjtzOjYwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX0NvdW50eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6InlvX0NvdW50eSI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6NDthOjM6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19Db3VudHkucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJ5b19Db3VudHkiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjU7YTozOntzOjQ6ImZyb20iO3M6NjA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fQ291bnR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToieW9fQ291bnR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo2O2E6Mzp7czo0OiJmcm9tIjtzOjYwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NhbXBhaWducy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkNhbXBhaWducyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6NzthOjM6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9DYW1wYWlnbnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjg7YTozOntzOjQ6ImZyb20iO3M6NjA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQ2FtcGFpZ25zLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiQ2FtcGFpZ25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aTo5O2E6Mzp7czo0OiJmcm9tIjtzOjYwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX0NvdW50eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6InlvX0NvdW50eSI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTA7YTozOntzOjQ6ImZyb20iO3M6NjA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fQ291bnR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToieW9fQ291bnR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToxMTthOjM6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19Db3VudHkucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJ5b19Db3VudHkiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjEyO2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEzO2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjE0O2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0xlYWRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE1O2E6Mzp7czo0OiJmcm9tIjtzOjYwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX0NvdW50eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6InlvX0NvdW50eSI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTY7YTozOntzOjQ6ImZyb20iO3M6NjA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fQ291bnR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToieW9fQ291bnR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToxNzthOjM6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19Db3VudHkucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJ5b19Db3VudHkiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE4O2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FPU19Qcm9kdWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE5O2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FPU19Qcm9kdWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjIwO2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FPU19Qcm9kdWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjIxO2E6Mzp7czo0OiJmcm9tIjtzOjYwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX0NvdW50eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6InlvX0NvdW50eSI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MjI7YTozOntzOjQ6ImZyb20iO3M6NjA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fQ291bnR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToieW9fQ291bnR5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyMzthOjM6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19Db3VudHkucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJ5b19Db3VudHkiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjI0O2E6Mzp7czo0OiJmcm9tIjtzOjYwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0NhbXBhaWducy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkNhbXBhaWducyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MjU7YTozOntzOjQ6ImZyb20iO3M6NjA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQ2FtcGFpZ25zLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiQ2FtcGFpZ25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyNjthOjM6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9DYW1wYWlnbnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjI3O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX1N1YmRpdmlzaW9ucy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjI4O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX1N1YmRpdmlzaW9ucy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjI5O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX1N1YmRpdmlzaW9ucy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjMwO2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FPU19Qcm9kdWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjMxO2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FPU19Qcm9kdWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjMyO2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FPU19Qcm9kdWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjMzO2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX1N1YmRpdmlzaW9ucy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjM0O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX1N1YmRpdmlzaW9ucy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjM1O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX1N1YmRpdmlzaW9ucy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjM2O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fXM6NzoidmFyZGVmcyI7YToxMjp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjc3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fY291bnR5X2NvbnRhY3RzX0NvbnRhY3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6Nzg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19jb3VudHlfY29udGFjdHNfeW9fQ291bnR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToieW9fQ291bnR5Ijt9aToyO2E6Mjp7czo0OiJmcm9tIjtzOjc5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fY291bnR5X2NhbXBhaWduc19DYW1wYWlnbnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO31pOjM7YToyOntzOjQ6ImZyb20iO3M6Nzk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19jb3VudHlfY2FtcGFpZ25zX3lvX0NvdW50eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6InlvX0NvdW50eSI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX2NvdW50eV9sZWFkc19MZWFkcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fY291bnR5X2xlYWRzX3lvX0NvdW50eS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6InlvX0NvdW50eSI7fWk6NjthOjI6e3M6NDoiZnJvbSI7czo4NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX2NvdW50eV9hb3NfcHJvZHVjdHNfQU9TX1Byb2R1Y3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IkFPU19Qcm9kdWN0cyI7fWk6NzthOjI6e3M6NDoiZnJvbSI7czo4MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX2NvdW50eV9hb3NfcHJvZHVjdHNfeW9fQ291bnR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToieW9fQ291bnR5Ijt9aTo4O2E6Mjp7czo0OiJmcm9tIjtzOjg1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fc3ViZGl2aXNpb25zX2NhbXBhaWduc19DYW1wYWlnbnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO31pOjk7YToyOntzOjQ6ImZyb20iO3M6OTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19zdWJkaXZpc2lvbnNfY2FtcGFpZ25zX3lvX1N1YmRpdmlzaW9ucy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE1OiJ5b19TdWJkaXZpc2lvbnMiO31pOjEwO2E6Mjp7czo0OiJmcm9tIjtzOjkxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fc3ViZGl2aXNpb25zX2Fvc19wcm9kdWN0c19BT1NfUHJvZHVjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiQU9TX1Byb2R1Y3RzIjt9aToxMTthOjI6e3M6NDoiZnJvbSI7czo5NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX3N1YmRpdmlzaW9uc19hb3NfcHJvZHVjdHNfeW9fU3ViZGl2aXNpb25zLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTU6InlvX1N1YmRpdmlzaW9ucyI7fX1zOjEyOiJsYXlvdXRmaWVsZHMiO2E6Njp7aTowO2E6MTp7czoxNzoiYWRkaXRpb25hbF9maWVsZHMiO2E6MTp7czo4OiJDb250YWN0cyI7czoyMzoieW9fY291bnR5X2NvbnRhY3RzX25hbWUiO319aToxO2E6MTp7czoxNzoiYWRkaXRpb25hbF9maWVsZHMiO2E6MTp7czo5OiJDYW1wYWlnbnMiO3M6MjQ6InlvX2NvdW50eV9jYW1wYWlnbnNfbmFtZSI7fX1pOjI7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YToxOntzOjU6IkxlYWRzIjtzOjIwOiJ5b19jb3VudHlfbGVhZHNfbmFtZSI7fX1pOjM7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YToxOntzOjEyOiJBT1NfUHJvZHVjdHMiO3M6Mjc6InlvX2NvdW50eV9hb3NfcHJvZHVjdHNfbmFtZSI7fX1pOjQ7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YToxOntzOjk6IkNhbXBhaWducyI7czozMDoieW9fc3ViZGl2aXNpb25zX2NhbXBhaWduc19uYW1lIjt9fWk6NTthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjE6e3M6MTI6IkFPU19Qcm9kdWN0cyI7czozMzoieW9fc3ViZGl2aXNpb25zX2Fvc19wcm9kdWN0c19uYW1lIjt9fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=', '2015-03-22 12:19:13', 1),
('d7b201af-9d30-d682-0de5-5510246e7c7f', 'upload/upgrades/module/marketing2015_03_23_153112.zip', 'e15c080f33f0fd77a20fb26f5862d4d9', 'module', 'installed', '1427121067', 'marketing', '', 'marketing', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoieW8iO3M6NjoiYXV0aG9yIjtzOjEwOiJCcmlza2xvZ2l4IjtzOjExOiJkZXNjcmlwdGlvbiI7czowOiIiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6OToibWFya2V0aW5nIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNS0wMy0yMyAxNDozMTowNiI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjE0MjcxMjEwNjc7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo5OntzOjI6ImlkIjtzOjk6Im1hcmtldGluZyI7czo1OiJiZWFucyI7YToxOntpOjA7YTo0OntzOjY6Im1vZHVsZSI7czoxMjoieW9fTWFya2V0aW5nIjtzOjU6ImNsYXNzIjtzOjEyOiJ5b19NYXJrZXRpbmciO3M6NDoicGF0aCI7czozNzoibW9kdWxlcy95b19NYXJrZXRpbmcveW9fTWFya2V0aW5nLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6Mzp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjkxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fbWFya2V0aW5nX2Fvc19wcm9kdWN0c19BT1NfUHJvZHVjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiQU9TX1Byb2R1Y3RzIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjg0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fbWFya2V0aW5nX3Rhc2tzX3lvX01hcmtldGluZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJ5b19NYXJrZXRpbmciO31pOjI7YToyOntzOjQ6ImZyb20iO3M6MTAzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMveW9fbWFya2V0aW5nX3lvX2ludmVzdGluZ2VudGl0eV95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5Ijt9fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6Mzp7aTowO2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6ODk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy95b19tYXJrZXRpbmdfYW9zX3Byb2R1Y3RzTWV0YURhdGEucGhwIjt9aToxO2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6ODI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy95b19tYXJrZXRpbmdfdGFza3NNZXRhRGF0YS5waHAiO31pOjI7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3lvX21hcmtldGluZ195b19pbnZlc3RpbmdlbnRpdHlNZXRhRGF0YS5waHAiO319czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6NDoiY29weSI7YToxOntpOjA7YToyOntzOjQ6ImZyb20iO3M6NDQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMveW9fTWFya2V0aW5nIjtzOjI6InRvIjtzOjIwOiJtb2R1bGVzL3lvX01hcmtldGluZyI7fX1zOjg6Imxhbmd1YWdlIjthOjE5OntpOjA7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fTWFya2V0aW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6InlvX01hcmtldGluZyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS95b19NYXJrZXRpbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoieW9fTWFya2V0aW5nIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyO2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL3lvX01hcmtldGluZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJ5b19NYXJrZXRpbmciO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjM7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvQU9TX1Byb2R1Y3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IkFPU19Qcm9kdWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6NDthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9BT1NfUHJvZHVjdHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiQU9TX1Byb2R1Y3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTo1O2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL0FPU19Qcm9kdWN0cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjY7YTozOntzOjQ6ImZyb20iO3M6NTY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvVGFza3MucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJUYXNrcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6NzthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9UYXNrcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTo4O2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1Rhc2tzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVGFza3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjk7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fTWFya2V0aW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6InlvX01hcmtldGluZyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTA7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fTWFya2V0aW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6InlvX01hcmtldGluZyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6MTE7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fTWFya2V0aW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6InlvX01hcmtldGluZyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTI7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fTWFya2V0aW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6InlvX01hcmtldGluZyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTM7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fTWFya2V0aW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6InlvX01hcmtldGluZyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6MTQ7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fTWFya2V0aW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6InlvX01hcmtldGluZyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTU7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fSW52ZXN0aW5nRW50aXR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6InlvX0ludmVzdGluZ0VudGl0eSI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTY7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fSW52ZXN0aW5nRW50aXR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6InlvX0ludmVzdGluZ0VudGl0eSI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6MTc7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UveW9fSW52ZXN0aW5nRW50aXR5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTg6InlvX0ludmVzdGluZ0VudGl0eSI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTg7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2VuX3VzLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO319czo3OiJ2YXJkZWZzIjthOjY6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo4ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX21hcmtldGluZ19hb3NfcHJvZHVjdHNfeW9fTWFya2V0aW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6InlvX01hcmtldGluZyI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czo4ODoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX21hcmtldGluZ19hb3NfcHJvZHVjdHNfQU9TX1Byb2R1Y3RzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IkFPU19Qcm9kdWN0cyI7fWk6MjthOjI6e3M6NDoiZnJvbSI7czo3NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3lvX21hcmtldGluZ190YXNrc19UYXNrcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjt9aTozO2E6Mjp7czo0OiJmcm9tIjtzOjgxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fbWFya2V0aW5nX3Rhc2tzX3lvX01hcmtldGluZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJ5b19NYXJrZXRpbmciO31pOjQ7YToyOntzOjQ6ImZyb20iO3M6OTQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy95b19tYXJrZXRpbmdfeW9faW52ZXN0aW5nZW50aXR5X3lvX01hcmtldGluZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJ5b19NYXJrZXRpbmciO31pOjU7YToyOntzOjQ6ImZyb20iO3M6MTAwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMveW9fbWFya2V0aW5nX3lvX2ludmVzdGluZ2VudGl0eV95b19JbnZlc3RpbmdFbnRpdHkucGhwIjtzOjk6InRvX21vZHVsZSI7czoxODoieW9fSW52ZXN0aW5nRW50aXR5Ijt9fXM6MTI6ImxheW91dGZpZWxkcyI7YTozOntpOjA7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YTowOnt9fWk6MTthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjE6e3M6NToiVGFza3MiO3M6MjM6InlvX21hcmtldGluZ190YXNrc19uYW1lIjt9fWk6MjthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjA6e319fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==', '2015-03-23 14:31:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `photo`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`) VALUES
('1', 'admin', '$1$mt0.191.$cIVLk4INxowhGE.nMUn1R.', 0, NULL, NULL, 1, NULL, 'Administrator', 1, 0, 1, NULL, '2015-03-21 19:13:07', '2015-03-21 19:31:46', '1', '', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_feeds`
--

CREATE TABLE IF NOT EXISTS `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_last_import`
--

CREATE TABLE IF NOT EXISTS `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_password_link`
--

CREATE TABLE IF NOT EXISTS `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_signatures`
--

CREATE TABLE IF NOT EXISTS `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE IF NOT EXISTS `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('1f38a854-6def-ed4b-56c3-550eb42e5705', 'yo_County2_YO_COUNTY', 0, '2015-03-22 12:26:11', '2015-03-22 12:26:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('21ed60ac-0afb-05bf-5e0b-550eb59d75a6', 'yo_Subdivisions2_YO_SUBDIVISIONS', 0, '2015-03-22 12:27:01', '2015-03-22 12:27:01', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('298be884-e405-6251-a207-550dc79a5166', 'Home', 0, '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjc6e3M6MzY6IjM1Y2I1ODlhLTRiNzEtMTYzZi00MWJkLTU1MGRjNzBlN2MxZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxMzoiaUZyYW1lRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NDoiSG9tZSI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTM6Im1vZHVsZXMvSG9tZS9EYXNobGV0cy9pRnJhbWVEYXNobGV0L2lGcmFtZURhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6Mzp7czoxMDoidGl0bGVMYWJlbCI7czoxNzoiRGlzY292ZXIgU3VpdGVDUk0iO3M6MzoidXJsIjtzOjIzOiJodHRwOi8vd3d3LnN1aXRlY3JtLmNvbSI7czo2OiJoZWlnaHQiO2k6MzE1O319czozNjoiMzVlZGFlZjgtOTgzMC03Mzc4LTgyNzMtNTUwZGM3MzViMWE5IjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjE2OiJTdWdhckZlZWREYXNobGV0IjtzOjY6Im1vZHVsZSI7czo5OiJTdWdhckZlZWQiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjE7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjcxOiJjdXN0b20vbW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImFhZDExODc5LWNlYzYtYmZlYy1lZGE2LTU1MGRjNzdiZTllMyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjE4ZTZjMWEwLWY0Y2QtYzA5ZC00NTQwLTU1MGRjN2ZmZjE3OSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImIwOWY0ZWYzLWQ4MzEtZWVlNi05Zjk4LTU1MGRjNzVjMTEyOSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMWU5OTM3MTAtYThkZS1hYWFkLWRkMGItNTUwZGM3YjQxY2M4IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNmFmZTc1YWQtN2FhOC04MGY3LTZhODktNTUwZGM3N2I5NjU4IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjY6e2k6MDtzOjM2OiIzNWNiNTg5YS00YjcxLTE2M2YtNDFiZC01NTBkYzcwZTdjMWUiO2k6MTtzOjM2OiJhYWQxMTg3OS1jZWM2LWJmZWMtZWRhNi01NTBkYzc3YmU5ZTMiO2k6MjtzOjM2OiIxOGU2YzFhMC1mNGNkLWMwOWQtNDU0MC01NTBkYzdmZmYxNzkiO2k6MztzOjM2OiJiMDlmNGVmMy1kODMxLWVlZTYtOWY5OC01NTBkYzc1YzExMjkiO2k6NDtzOjM2OiIxZTk5MzcxMC1hOGRlLWFhYWQtZGQwYi01NTBkYzdiNDFjYzgiO2k6NTtzOjM2OiI2YWZlNzVhZC03YWE4LTgwZjctNmE4OS01NTBkYzc3Yjk2NTgiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjM1ZWRhZWY4LTk4MzAtNzM3OC04MjczLTU1MGRjNzM1YjFhOSI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),
('2bb1fdd3-0b54-a54b-bc4f-550dcd7b83cf', 'Accounts2_ACCOUNT', 0, '2015-03-21 19:58:03', '2015-03-21 19:58:03', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('3182015d-b1a6-18c7-7618-550ea8759e2d', 'AOS_Products2_AOS_PRODUCTS', 0, '2015-03-22 11:32:55', '2015-03-22 11:32:55', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('31c6ced0-72f0-3954-3426-550efe1d467a', 'yo_AmortizationSchedule2_YO_AMORTIZATIONSCHEDULE', 0, '2015-03-22 17:40:41', '2015-03-22 17:40:41', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('3674cd59-8cfa-372e-3ec0-550ef43f692a', 'yo_Sales2_YO_SALES', 0, '2015-03-22 16:56:29', '2015-03-22 16:56:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('45df31e3-e044-4d8c-77b0-550eb5d3deda', 'ACLRoles2_ACLROLE', 0, '2015-03-22 12:28:07', '2015-03-22 12:28:07', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('4f84536e-76cd-6dbe-2276-550dc743a592', 'Home2_SUGARFEED', 0, '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('5e6a1463-5083-e1e5-d918-550dc79eaab9', 'Home2_ACCOUNT', 0, '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('6bbc166b-6eb8-ece2-8b1a-550dc759fc35', 'Home2_MEETING', 0, '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('7cdc6c80-c5e0-5b0c-40d5-5510254ba79b', 'yo_InvestingEntity2_YO_INVESTINGENTITY', 0, '2015-03-23 14:39:17', '2015-03-23 14:39:17', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('8b28fea7-9444-296b-17ad-551025300591', 'yo_Marketing2_YO_MARKETING', 0, '2015-03-23 14:38:22', '2015-03-23 14:38:22', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('9f7949bc-1dbd-ccf4-41c2-550dc46a7de1', 'global', 0, '2015-03-21 19:13:07', '2015-03-21 19:31:46', '1', 'YToyNzp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6IjllY2U3NjgxLWYxYzEtZDI4OC04ZTM2LTU1MGRjNDY5MDM1ZCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVIiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6ODoidGltZXpvbmUiO3M6MTI6IkV1cm9wZS9QYXJpcyI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoxMzoic3VicGFuZWxfdGFicyI7czowOiIiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOi0xO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjt9'),
('c8fc0289-21f9-a907-6709-550dc7d6a930', 'ETag', 0, '2015-03-21 19:31:46', '2015-03-23 14:31:06', '1', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6NTt9'),
('cb5c5ae9-2234-9c4f-0c4d-550dc7955fd7', 'Home2_LEAD', 0, '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d3c96d64-1dc7-7457-2211-550eb442b96e', 'AOS_Quotes2_AOS_QUOTES', 0, '2015-03-22 12:22:51', '2015-03-22 12:22:51', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d8e71dc6-e053-fbb1-1318-550dc7bcae83', 'Home2_CALL', 0, '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('e5185ca5-4295-89b9-8396-550dc7a4b7ee', 'Home2_OPPORTUNITY', 0, '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `vcals`
--

CREATE TABLE IF NOT EXISTS `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_version` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_version` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `deleted`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `file_version`, `db_version`) VALUES
('33ffbb37-0a91-5aaf-26ae-5512fa04b895', 0, '2015-03-25 18:13:54', '2015-03-25 18:13:54', '1', '1', 'Rebuild Relationships', '4.0.0', '4.0.0'),
('4f7fc268-4358-21a1-133b-550dc4958803', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'htaccess', '3.5.1', '3.5.1'),
('76f4dd1a-0fd5-105a-d8df-550dc475bb18', 0, '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Chart Data Cache', '3.5.1', '3.5.1'),
('811d9a02-00ca-0ead-ffad-5512fab44e3d', 0, '2015-03-25 18:13:54', '2015-03-25 18:13:54', '1', '1', 'Rebuild Extensions', '4.0.0', '4.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `yo_amortizationschedule`
--

CREATE TABLE IF NOT EXISTS `yo_amortizationschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bbalance` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `ebalance` decimal(26,6) DEFAULT NULL,
  `interest` decimal(26,6) DEFAULT NULL,
  `paydate` date DEFAULT NULL,
  `pay_num` int(255) DEFAULT NULL,
  `payment` decimal(26,6) DEFAULT NULL,
  `principal` decimal(26,6) DEFAULT NULL,
  `tax_amnt` decimal(26,6) DEFAULT NULL,
  `received` tinyint(1) DEFAULT '0',
  `cinterest` decimal(26,6) DEFAULT NULL,
  `cprincipal` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yo_amortizationschedule`
--

INSERT INTO `yo_amortizationschedule` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `bbalance`, `currency_id`, `ebalance`, `interest`, `paydate`, `pay_num`, `payment`, `principal`, `tax_amnt`, `received`, `cinterest`, `cprincipal`) VALUES
('101d9002-0916-47c3-6779-55105b5b0e49', '361', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26507.984117', NULL, '26596.344064', '88.359947', NULL, 361, NULL, '-88.359947', '0.166667', 0, '18596.344064', '-18596.344064'),
('10bf42eb-62f6-20b1-d59b-55105bc85dae', '150', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13135.024199', NULL, '13178.807613', '43.783414', NULL, 150, NULL, '-43.783414', '0.166667', 0, '5178.807613', '-5178.807613'),
('112c156b-6792-72c0-686d-55105b38c4e8', '137', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12578.902355', NULL, '12620.832029', '41.929675', NULL, 137, NULL, '-41.929675', '0.166667', 0, '4620.832029', '-4620.832029'),
('1142056e-c868-5fe9-f946-55105b8123d5', '454', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36123.024278', NULL, '36243.434359', '120.410081', NULL, 454, NULL, '-120.410081', '0.166667', 0, '28243.434359', '-28243.434359'),
('115fa89e-6a74-cfa9-7bb6-55105ba16d66', '310', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22370.176831', NULL, '22444.744087', '74.567256', NULL, 310, NULL, '-74.567256', '0.166667', 0, '14444.744087', '-14444.744087'),
('1184c2a9-b735-6371-1be9-55105b3a6dcd', '347', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25301.328741', NULL, '25385.666503', '84.337762', NULL, 347, NULL, '-84.337762', '0.166667', 0, '17385.666503', '-17385.666503'),
('11d86689-cb85-4641-cc51-55105b356a1c', '602', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '59112.557895', NULL, '59309.599755', '197.041860', NULL, 602, NULL, '-197.041860', '0.166667', 0, '51309.599755', '-51309.599755'),
('13ac9e6b-32c2-78f0-ce4c-55105b4b3c15', '192', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15105.357004', NULL, '15155.708194', '50.351190', NULL, 192, NULL, '-50.351190', '0.166667', 0, '7155.708194', '-7155.708194'),
('14999acb-f82b-6a14-785e-55105b6ebad8', '483', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '39782.867960', NULL, '39915.477520', '132.609560', NULL, 483, NULL, '-132.609560', '0.166667', 0, '31915.477520', '-31915.477520'),
('14f0b618-8ec0-4584-3650-55105be21f66', '83', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10509.927948', NULL, '10544.961041', '35.033093', NULL, 83, NULL, '-35.033093', '0.166667', 0, '2544.961041', '-2544.961041'),
('15042457-42d7-a344-e2d9-55105bc69646', '561', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '51573.294681', NULL, '51745.205664', '171.910982', NULL, 561, NULL, '-171.910982', '0.166667', 0, '43745.205664', '-43745.205664'),
('15daa780-9963-9e00-f311-55105b14f515', '487', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '40315.964289', NULL, '40450.350837', '134.386548', NULL, 487, NULL, '-134.386548', '0.166667', 0, '32450.350837', '-32450.350837'),
('15defec2-6fb3-e4be-5e9d-55105bd8248d', '515', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '44253.109905', NULL, '44400.620271', '147.510366', NULL, 515, NULL, '-147.510366', '0.166667', 0, '36400.620271', '-36400.620271'),
('16678e72-1c47-65a1-587d-55105b4d7cbc', '142', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12789.953050', NULL, '12832.586227', '42.633177', NULL, 142, NULL, '-42.633177', '0.166667', 0, '4832.586227', '-4832.586227'),
('167612de-e008-d485-ca22-55105bf8a0b5', '88', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10686.265082', NULL, '10721.885966', '35.620884', NULL, 88, NULL, '-35.620884', '0.166667', 0, '2721.885966', '-2721.885966'),
('1729acbe-abce-ae06-1e20-55105befd86c', '388', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29000.013849', NULL, '29096.680562', '96.666713', NULL, 388, NULL, '-96.666713', '0.166667', 0, '21096.680562', '-21096.680562'),
('17543368-b0a6-9bb1-04ff-55105b0bb8af', '416', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31832.075029', NULL, '31938.181945', '106.106917', NULL, 416, NULL, '-106.106917', '0.166667', 0, '23938.181945', '-23938.181945'),
('1765c51e-db37-bd5c-b828-55105b5f138c', '438', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34249.974226', NULL, '34364.140807', '114.166581', NULL, 438, NULL, '-114.166581', '0.166667', 0, '26364.140807', '-26364.140807'),
('181c5eb6-136f-ac91-43ae-55105bb1d3e5', '215', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16306.904735', NULL, '16361.261084', '54.356349', NULL, 215, NULL, '-54.356349', '0.166667', 0, '8361.261084', '-8361.261084'),
('188419c0-1232-4d05-cb82-55105bf0db9c', '588', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '56421.727635', NULL, '56609.800061', '188.072425', NULL, 588, NULL, '-188.072425', '0.166667', 0, '48609.800061', '-48609.800061'),
('1886d19a-1351-edc5-e4c1-55105b057690', '375', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27772.186558', NULL, '27864.760513', '92.573955', NULL, 375, NULL, '-92.573955', '0.166667', 0, '19864.760513', '-19864.760513'),
('18d52757-3c3c-84bf-d95c-55105b6a6c22', '288', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20790.939655', NULL, '20860.242787', '69.303132', NULL, 288, NULL, '-69.303132', '0.166667', 0, '12860.242787', '-12860.242787'),
('1a16462d-cd97-8762-e2f2-55105b07da9f', '34', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8928.591134', NULL, '8958.353105', '29.761970', NULL, 34, NULL, '-29.761970', '0.166667', 0, '958.353105', '-958.353105'),
('1a863f11-f45f-50f9-f9b8-55105b9485d9', '616', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '61931.717573', NULL, '62138.156632', '206.439059', NULL, 616, NULL, '-206.439059', '0.166667', 0, '54138.156632', '-54138.156632'),
('1ad96f9f-0c7b-c313-c310-55105b0af007', '343', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24966.770316', NULL, '25049.992884', '83.222568', NULL, 343, NULL, '-83.222568', '0.166667', 0, '17049.992884', '-17049.992884'),
('1b5620bd-3609-d01e-7e1e-55105b2913fc', '366', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26952.739018', NULL, '27042.581481', '89.842463', NULL, 366, NULL, '-89.842463', '0.166667', 0, '19042.581481', '-19042.581481'),
('1bd42b93-b7ce-8021-4b2c-55105befaac5', '266', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19323.189753', NULL, '19387.600385', '64.410633', NULL, 266, NULL, '-64.410633', '0.166667', 0, '11387.600385', '-11387.600385'),
('1c1d7e6b-4205-b9b4-e348-55105b7c8864', '464', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '37345.348086', NULL, '37469.832580', '124.484494', NULL, 464, NULL, '-124.484494', '0.166667', 0, '29469.832580', '-29469.832580'),
('1c2758a9-fc70-2e3f-456d-55105b7ccd36', '296', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21351.876306', NULL, '21423.049227', '71.172921', NULL, 296, NULL, '-71.172921', '0.166667', 0, '13423.049227', '-13423.049227'),
('1c67b92c-915c-d451-0e9e-55105b4ab427', '500', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '42098.360542', NULL, '42238.688410', '140.327868', NULL, 500, NULL, '-140.327868', '0.166667', 0, '34238.688410', '-34238.688410'),
('1c747608-3d23-e585-57ba-55105bf59ed0', '584', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '55675.665463', NULL, '55861.251015', '185.585552', NULL, 584, NULL, '-185.585552', '0.166667', 0, '47861.251015', '-47861.251015'),
('1c9d05b5-c114-e29a-11ef-55105b5e3922', '421', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32366.158319', NULL, '32474.045513', '107.887194', NULL, 421, NULL, '-107.887194', '0.166667', 0, '24474.045513', '-24474.045513'),
('1d070070-ff26-1310-fdff-55105b6fd3a3', '147', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13004.544785', NULL, '13047.893268', '43.348483', NULL, 147, NULL, '-43.348483', '0.166667', 0, '5047.893268', '-5047.893268'),
('1d8f0827-4474-2673-7839-55105b05f8b4', '178', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14417.754350', NULL, '14465.813531', '48.059181', NULL, 178, NULL, '-48.059181', '0.166667', 0, '6465.813531', '-6465.813531'),
('1da90a2e-8621-49bf-82f0-55105b34d752', '491', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '40856.204188', NULL, '40992.391536', '136.187347', NULL, 491, NULL, '-136.187347', '0.166667', 0, '32992.391536', '-32992.391536'),
('1e060420-4b7a-8b7d-0a9f-55105b5e5d53', '407', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30892.836214', NULL, '30995.812335', '102.976121', NULL, 407, NULL, '-102.976121', '0.166667', 0, '22995.812335', '-22995.812335'),
('1e262370-f2be-76af-97d4-55105b4afd86', '183', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14659.657577', NULL, '14708.523102', '48.865525', NULL, 183, NULL, '-48.865525', '0.166667', 0, '6708.523102', '-6708.523102'),
('1e8b0cdd-6dd7-c87a-9160-55105b935549', '257', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18753.038740', NULL, '18815.548869', '62.510129', NULL, 257, NULL, '-62.510129', '0.166667', 0, '10815.548869', '-10815.548869'),
('1ea19385-f65f-c6f4-5bd9-55105b9f7859', '446', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '35174.033753', NULL, '35291.280532', '117.246779', NULL, 446, NULL, '-117.246779', '0.166667', 0, '27291.280532', '-27291.280532'),
('1ecc0cdc-7292-676c-9dbf-55105b62533c', '16', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8409.469506', NULL, '8437.501071', '28.031565', NULL, 16, NULL, '-28.031565', '0.166667', 0, '437.501071', '-437.501071'),
('1f1cd742-9081-6417-1ca5-55105b59630c', '593', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '57368.379775', NULL, '57559.607708', '191.227933', NULL, 593, NULL, '-191.227933', '0.166667', 0, '49559.607708', '-49559.607708'),
('1f308864-439e-118a-8e4d-55105be2316c', '206', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15825.752380', NULL, '15878.504888', '52.752508', NULL, 206, NULL, '-52.752508', '0.166667', 0, '7878.504888', '-7878.504888'),
('1fb864c3-3c1e-b587-6936-55105bc26a72', '538', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '47773.200413', NULL, '47932.444414', '159.244001', NULL, 538, NULL, '-159.244001', '0.166667', 0, '39932.444414', '-39932.444414'),
('20bc957c-9b49-4fe5-b8a3-55105b65a25f', '39', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9078.396365', NULL, '9108.657686', '30.261321', NULL, 39, NULL, '-30.261321', '0.166667', 0, '1108.657686', '-1108.657686'),
('20e90913-1eaf-5d61-2d83-55105b0161ec', '102', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11195.907850', NULL, '11233.227543', '37.319693', NULL, 102, NULL, '-37.319693', '0.166667', 0, '3233.227543', '-3233.227543'),
('20f79c8d-dc78-0384-407a-55105bd0cc50', '393', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29486.580396', NULL, '29584.868997', '98.288601', NULL, 393, NULL, '-98.288601', '0.166667', 0, '21584.868997', '-21584.868997'),
('213a1fce-8f84-465a-22dd-55105b1f2f4c', '243', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17899.391970', NULL, '17959.056610', '59.664640', NULL, 243, NULL, '-59.664640', '0.166667', 0, '9959.056610', '-9959.056610'),
('215fd16a-7785-2436-f302-55105b4243c4', '315', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22745.506986', NULL, '22821.325343', '75.818357', NULL, 315, NULL, '-75.818357', '0.166667', 0, '14821.325343', '-14821.325343'),
('21b0592d-c200-9b16-3638-55105bd6026d', '426', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32909.202538', NULL, '33018.899880', '109.697342', NULL, 426, NULL, '-109.697342', '0.166667', 0, '25018.899880', '-25018.899880'),
('221077e0-fddb-cc27-d624-55105b7c1697', '292', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21069.541329', NULL, '21139.773133', '70.231804', NULL, 292, NULL, '-70.231804', '0.166667', 0, '13139.773133', '-13139.773133'),
('225f3de7-c5c6-a12e-28e5-55105bce92cd', '279', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20177.481139', NULL, '20244.739409', '67.258270', NULL, 279, NULL, '-67.258270', '0.166667', 0, '12244.739409', '-12244.739409'),
('22b1bb02-a196-2fb6-53fc-55105b61b252', '575', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '54032.896465', NULL, '54213.006120', '180.109655', NULL, 575, NULL, '-180.109655', '0.166667', 0, '46213.006120', '-46213.006120'),
('231756bc-3587-be59-b001-55105bccc233', '552', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '50051.570443', NULL, '50218.409011', '166.838568', NULL, 552, NULL, '-166.838568', '0.166667', 0, '42218.409011', '-42218.409011'),
('23ab00a5-b186-6f0a-caf7-55105b5432f8', '469', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '37971.933892', NULL, '38098.507005', '126.573113', NULL, 469, NULL, '-126.573113', '0.166667', 0, '30098.507005', '-30098.507005'),
('24c93bf0-2fd5-df53-4033-55105b331b26', '412', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31411.160816', NULL, '31515.864686', '104.703869', NULL, 412, NULL, '-104.703869', '0.166667', 0, '23515.864686', '-23515.864686'),
('24cca4cc-0580-5950-a714-55105b5316d2', '607', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '60104.357186', NULL, '60304.705043', '200.347857', NULL, 607, NULL, '-200.347857', '0.166667', 0, '52304.705043', '-52304.705043'),
('24fdc61b-4e4c-25a9-d6f8-55105bfb4fd3', '380', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28238.152435', NULL, '28332.279610', '94.127175', NULL, 380, NULL, '-94.127175', '0.166667', 0, '20332.279610', '-20332.279610'),
('25158722-b85d-3da0-31cd-55105b31e3ed', '621', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '62970.817144', NULL, '63180.719868', '209.902724', NULL, 621, NULL, '-209.902724', '0.166667', 0, '55180.719868', '-55180.719868'),
('2594aaf8-e932-f1a6-0ec0-55105b6f1407', '11', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8270.702430', NULL, '8298.271439', '27.569008', NULL, 11, NULL, '-27.569008', '0.166667', 0, '298.271439', '-298.271439'),
('25d27c6b-c1a7-b1b4-a7ae-55105b293cab', '188', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14905.619493', NULL, '14955.304891', '49.685398', NULL, 188, NULL, '-49.685398', '0.166667', 0, '6955.304891', '-6955.304891'),
('25d30024-4105-4535-7fba-55105bcaadab', '450', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '35645.371021', NULL, '35764.188924', '118.817903', NULL, 450, NULL, '-118.817903', '0.166667', 0, '27764.188924', '-27764.188924'),
('26419000-9915-214a-aabc-55105b00b726', '6', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8134.225190', NULL, '8161.339274', '27.114084', NULL, 6, NULL, '-27.114084', '0.166667', 0, '161.339274', '-161.339274'),
('269af186-0fc5-9a39-46fc-55105bc86c33', '320', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23127.134486', NULL, '23204.224934', '77.090448', NULL, 320, NULL, '-77.090448', '0.166667', 0, '15204.224934', '-15204.224934'),
('2755bcf5-090f-d538-0771-55105bc3763d', '197', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15358.796931', NULL, '15409.992921', '51.195990', NULL, 197, NULL, '-51.195990', '0.166667', 0, '7409.992921', '-7409.992921'),
('27950abd-a7f2-7136-e36a-55105b554852', '370', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27313.909717', NULL, '27404.956083', '91.046366', NULL, 370, NULL, '-91.046366', '0.166667', 0, '19404.956083', '-19404.956083'),
('28100f95-c7b1-0d29-67d0-55105b8cfa1a', '172', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14132.733725', NULL, '14179.842837', '47.109112', NULL, 172, NULL, '-47.109112', '0.166667', 0, '6179.842837', '-6179.842837'),
('282f801e-9ee5-6a4a-b569-55105b1795ce', '128', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12207.748627', NULL, '12248.441122', '40.692495', NULL, 128, NULL, '-40.692495', '0.166667', 0, '4248.441122', '-4248.441122'),
('28be85ec-b250-a9e6-372a-55105bbf3412', '159', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13534.370004', NULL, '13579.484571', '45.114567', NULL, 159, NULL, '-45.114567', '0.166667', 0, '5579.484571', '-5579.484571'),
('28beda36-5d09-dd99-6c1b-55105be2399e', '164', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13761.451678', NULL, '13807.323183', '45.871506', NULL, 164, NULL, '-45.871506', '0.166667', 0, '5807.323183', '-5807.323183'),
('28cb6e3b-0d4c-e146-410f-55105be3db98', '248', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18199.710631', NULL, '18260.376333', '60.665702', NULL, 248, NULL, '-60.665702', '0.166667', 0, '10260.376333', '-10260.376333'),
('28f00a38-b772-94c1-1825-55105bf497e7', '97', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11011.160954', NULL, '11047.864824', '36.703870', NULL, 97, NULL, '-36.703870', '0.166667', 0, '3047.864824', '-3047.864824'),
('29069c41-815a-d625-77d0-55105bbc8fde', '566', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '52438.599092', NULL, '52613.394422', '174.795330', NULL, 566, NULL, '-174.795330', '0.166667', 0, '44613.394422', '-44613.394422'),
('29550509-f00b-74db-63d1-55105bbcff38', '524', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '45598.542813', NULL, '45750.537955', '151.995143', NULL, 524, NULL, '-151.995143', '0.166667', 0, '37750.537955', '-37750.537955'),
('29d780e8-5482-4c3f-7c8d-55105b474655', '21', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8550.564837', NULL, '8579.066719', '28.501883', NULL, 21, NULL, '-28.501883', '0.166667', 0, '579.066719', '-579.066719'),
('2a7702a6-8e4e-ea68-b1f7-55105b33304e', '63', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9833.201103', NULL, '9865.978440', '32.777337', NULL, 63, NULL, '-32.777337', '0.166667', 0, '1865.978440', '-1865.978440'),
('2ab114ed-bc70-f10e-4a40-55105b114534', '352', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25725.838198', NULL, '25811.590992', '85.752794', NULL, 352, NULL, '-85.752794', '0.166667', 0, '17811.590992', '-17811.590992'),
('2acee7b8-8ddc-12d7-3c86-55105bfab011', '508', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '43234.168437', NULL, '43378.282332', '144.113895', NULL, 508, NULL, '-144.113895', '0.166667', 0, '35378.282332', '-35378.282332'),
('2b00a472-86d5-6743-1d1a-55105b213eec', '598', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '58330.914986', NULL, '58525.351369', '194.436383', NULL, 598, NULL, '-194.436383', '0.166667', 0, '50525.351369', '-50525.351369'),
('2b060740-ce5d-3fd1-3554-55105b86dee8', '324', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23437.041517', NULL, '23515.164989', '78.123472', NULL, 324, NULL, '-78.123472', '0.166667', 0, '15515.164989', '-15515.164989'),
('2b35ece6-479c-10c8-ada9-55105bba6b51', '520', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '44995.595166', NULL, '45145.580483', '149.985317', NULL, 520, NULL, '-149.985317', '0.166667', 0, '37145.580483', '-37145.580483'),
('2b3c7bb0-7208-8b4d-5a73-55105bd99d9f', '220', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16580.504409', NULL, '16635.772757', '55.268348', NULL, 220, NULL, '-55.268348', '0.166667', 0, '8635.772757', '-8635.772757'),
('2b608cf1-3165-5a3d-3a43-55105bef95ee', '271', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19647.397105', NULL, '19712.888429', '65.491324', NULL, 271, NULL, '-65.491324', '0.166667', 0, '11712.888429', '-11712.888429'),
('2b8d0021-1ad5-0126-cc20-55105b913015', '210', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16037.819809', NULL, '16091.279208', '53.459399', NULL, 210, NULL, '-53.459399', '0.166667', 0, '8091.279208', '-8091.279208'),
('2bd32710-29f9-9b7e-5f72-55105bff6167', '118', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11808.185560', NULL, '11847.546179', '39.360619', NULL, 118, NULL, '-39.360619', '0.166667', 0, '3847.546179', '-3847.546179'),
('2bef1fcd-8312-4cbb-71b5-55105b6f5c60', '275', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19910.675140', NULL, '19977.044057', '66.368917', NULL, 275, NULL, '-66.368917', '0.166667', 0, '11977.044057', '-11977.044057'),
('2bfa0056-0336-4a13-d59f-55105b914bbf', '529', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '46363.601948', NULL, '46518.147287', '154.545340', NULL, 529, NULL, '-154.545340', '0.166667', 0, '38518.147287', '-38518.147287'),
('2ccebcb9-1701-b8cd-c836-55105bfbeede', '173', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14179.842837', NULL, '14227.108980', '47.266143', NULL, 173, NULL, '-47.266143', '0.166667', 0, '6227.108980', '-6227.108980'),
('2d5548d5-0d1a-8309-ebfb-55105b19ff76', '234', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17371.251606', NULL, '17429.155778', '57.904172', NULL, 234, NULL, '-57.904172', '0.166667', 0, '9429.155778', '-9429.155778'),
('2e0efaf9-1ac8-0dd7-f71e-55105bf16b83', '113', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11613.335293', NULL, '11652.046411', '38.711118', NULL, 113, NULL, '-38.711118', '0.166667', 0, '3652.046411', '-3652.046411'),
('2e48e69f-2332-cf9b-e457-55105b07ab25', '496', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '41541.695660', NULL, '41680.167979', '138.472319', NULL, 496, NULL, '-138.472319', '0.166667', 0, '33680.167979', '-33680.167979'),
('2ef40397-3953-407a-e2c4-55105b68e270', '123', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12006.305054', NULL, '12046.326071', '40.021017', NULL, 123, NULL, '-40.021017', '0.166667', 0, '4046.326071', '-4046.326071'),
('30212a3a-c360-5eaf-5306-55105b7322e8', '580', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '54939.468440', NULL, '55122.600001', '183.131561', NULL, 580, NULL, '-183.131561', '0.166667', 0, '47122.600001', '-47122.600001'),
('3085705e-ba32-4893-e8e0-55105bce0be6', '431', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33461.358034', NULL, '33572.895894', '111.537860', NULL, 431, NULL, '-111.537860', '0.166667', 0, '25572.895894', '-25572.895894'),
('308bf788-10c9-b703-d119-55105bd5a973', '103', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11233.227543', NULL, '11270.671635', '37.444092', NULL, 103, NULL, '-37.444092', '0.166667', 0, '3270.671635', '-3270.671635'),
('30a4fc31-6233-bb35-72b2-55105b15366b', '30', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8810.528743', NULL, '8839.897172', '29.368429', NULL, 30, NULL, '-29.368429', '0.166667', 0, '839.897172', '-839.897172'),
('310f02db-1cee-62aa-8419-55105b597225', '68', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9998.184014', NULL, '10031.511294', '33.327280', NULL, 68, NULL, '-33.327280', '0.166667', 0, '2031.511294', '-2031.511294'),
('316c5e74-d203-3e0d-730e-55105b60acc3', '108', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11421.700306', NULL, '11459.772640', '38.072334', NULL, 108, NULL, '-38.072334', '0.166667', 0, '3459.772640', '-3459.772640'),
('3185042c-c300-53f4-9298-55105bfb3dbc', '44', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9230.715049', NULL, '9261.484100', '30.769050', NULL, 44, NULL, '-30.769050', '0.166667', 0, '1261.484100', '-1261.484100'),
('318cc589-4482-5ef8-b225-55105bbea760', '398', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29981.310628', NULL, '30081.248330', '99.937702', NULL, 398, NULL, '-99.937702', '0.166667', 0, '22081.248330', '-22081.248330'),
('322326b0-3f41-b884-c988-55105b5cf67a', '229', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17084.603585', NULL, '17141.552264', '56.948679', NULL, 229, NULL, '-56.948679', '0.166667', 0, '9141.552264', '-9141.552264'),
('33309b66-9a22-a75f-00f4-55105ba00403', '339', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24636.635745', NULL, '24718.757864', '82.122119', NULL, 339, NULL, '-82.122119', '0.166667', 0, '16718.757864', '-16718.757864'),
('340679d7-897a-27a0-6b03-55105bc23485', '69', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10031.511294', NULL, '10064.949665', '33.438371', NULL, 69, NULL, '-33.438371', '0.166667', 0, '2064.949665', '-2064.949665'),
('34127fc6-9b71-cd88-82a4-55105b7e7446', '211', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16091.279208', NULL, '16144.916805', '53.637597', NULL, 211, NULL, '-53.637597', '0.166667', 0, '8144.916805', '-8144.916805'),
('35e365f5-2abd-a7cd-ecd2-55105bbba209', '357', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26157.470139', NULL, '26244.661706', '87.191567', NULL, 357, NULL, '-87.191567', '0.166667', 0, '18244.661706', '-18244.661706'),
('369d373e-5772-2782-4439-55105b1ba8d8', '156', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13399.923608', NULL, '13444.590020', '44.666412', NULL, 156, NULL, '-44.666412', '0.166667', 0, '5444.590020', '-5444.590020'),
('36afea83-7065-8bfa-09a4-55105bf951ee', '325', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23515.164989', NULL, '23593.548872', '78.383883', NULL, 325, NULL, '-78.383883', '0.166667', 0, '15593.548872', '-15593.548872'),
('36dbbac3-ff71-69ff-2b6e-55105b5f1e10', '492', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '40992.391536', NULL, '41129.032841', '136.641305', NULL, 492, NULL, '-136.641305', '0.166667', 0, '33129.032841', '-33129.032841'),
('36eb27d0-5dfd-a9d8-64cd-55105b5eeecc', '239', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17662.709050', NULL, '17721.584747', '58.875697', NULL, 239, NULL, '-58.875697', '0.166667', 0, '9721.584747', '-9721.584747'),
('370349da-1370-40e8-8f03-55105bfbeea2', '64', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9865.978440', NULL, '9898.865035', '32.886595', NULL, 64, NULL, '-32.886595', '0.166667', 0, '1898.865035', '-1898.865035'),
('3778db22-679c-364b-7a0f-55105b19bcfd', '455', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36243.434359', NULL, '36364.245806', '120.811448', NULL, 455, NULL, '-120.811448', '0.166667', 0, '28364.245806', '-28364.245806'),
('37a30cdb-963c-dce3-b575-55105b7a1c44', '301', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21710.121264', NULL, '21782.488334', '72.367071', NULL, 301, NULL, '-72.367071', '0.166667', 0, '13782.488334', '-13782.488334'),
('37af9e67-e94c-3165-3e75-55105b0bb766', '330', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23909.705926', NULL, '23989.404945', '79.699020', NULL, 330, NULL, '-79.699020', '0.166667', 0, '15989.404945', '-15989.404945'),
('37fb9bd6-49b5-ed87-2b47-55105be32e96', '98', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11047.864824', NULL, '11084.691040', '36.826216', NULL, 98, NULL, '-36.826216', '0.166667', 0, '3084.691040', '-3084.691040'),
('382254d2-f332-fb47-2c43-55105b1c5aaa', '543', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '48574.746276', NULL, '48736.662097', '161.915821', NULL, 543, NULL, '-161.915821', '0.166667', 0, '40736.662097', '-40736.662097'),
('38233a95-faee-019f-de54-55105be9f5c6', '253', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18505.068084', NULL, '18566.751644', '61.683560', NULL, 253, NULL, '-61.683560', '0.166667', 0, '10566.751644', '-10566.751644'),
('38283864-717d-e3d0-001f-55105b03d8c7', '93', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10865.560828', NULL, '10901.779364', '36.218536', NULL, 93, NULL, '-36.218536', '0.166667', 0, '2901.779364', '-2901.779364'),
('38739e8c-8004-b217-001a-55105bc3293a', '49', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9385.589360', NULL, '9416.874658', '31.285298', NULL, 49, NULL, '-31.285298', '0.166667', 0, '1416.874658', '-1416.874658'),
('38d43dae-e531-1dfb-41ec-55105b2a4d8d', '202', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15616.489111', NULL, '15668.544074', '52.054964', NULL, 202, NULL, '-52.054964', '0.166667', 0, '7668.544074', '-7668.544074'),
('391800cb-c3f8-e77b-2f4f-55105b63a98b', '59', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9703.177091', NULL, '9735.521015', '32.343924', NULL, 59, NULL, '-32.343924', '0.166667', 0, '1735.521015', '-1735.521015'),
('39959668-3687-d9a6-d830-55105b47d6f2', '306', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22074.376908', NULL, '22147.958164', '73.581256', NULL, 306, NULL, '-73.581256', '0.166667', 0, '14147.958164', '-14147.958164'),
('39c80dba-4f99-52da-25c0-55105b1a2adc', '335', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24310.866529', NULL, '24391.902750', '81.036222', NULL, 335, NULL, '-81.036222', '0.166667', 0, '16391.902750', '-16391.902750'),
('3a027f96-453c-83a0-08fd-55105b55d5e3', '504', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '42662.484815', NULL, '42804.693098', '142.208283', NULL, 504, NULL, '-142.208283', '0.166667', 0, '34804.693098', '-34804.693098'),
('3a348be1-06a5-7e28-c9fc-55105b24eea1', '474', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '38609.032648', NULL, '38737.729423', '128.696775', NULL, 474, NULL, '-128.696775', '0.166667', 0, '30737.729423', '-30737.729423'),
('3a781ce5-230e-3b7b-05fb-55105b9c30b8', '460', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36851.532092', NULL, '36974.370532', '122.838440', NULL, 460, NULL, '-122.838440', '0.166667', 0, '28974.370532', '-28974.370532'),
('3a924b75-63b0-4d7a-abff-55105b5a6b37', '557', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '50891.343137', NULL, '51060.980948', '169.637810', NULL, 557, NULL, '-169.637810', '0.166667', 0, '43060.980948', '-43060.980948'),
('3b1590f9-3532-2ebf-4e59-55105b767659', '74', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10199.821483', NULL, '10233.820888', '33.999405', NULL, 74, NULL, '-33.999405', '0.166667', 0, '2233.820888', '-2233.820888'),
('3c2be8e8-1c66-cfb6-c719-55105b70c026', '612', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '61112.797032', NULL, '61316.506355', '203.709323', NULL, 612, NULL, '-203.709323', '0.166667', 0, '53316.506355', '-53316.506355'),
('3c5c0257-59d6-86ba-dcce-55105be8dbb5', '479', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '39256.820741', NULL, '39387.676810', '130.856069', NULL, 479, NULL, '-130.856069', '0.166667', 0, '31387.676810', '-31387.676810'),
('3ce42c5b-c981-c316-4e67-55105bd76825', '133', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12412.572049', NULL, '12453.947289', '41.375240', NULL, 133, NULL, '-41.375240', '0.166667', 0, '4453.947289', '-4453.947289'),
('3d8b9940-d10c-cf5b-a4fa-55105b9d3834', '169', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13992.343361', NULL, '14038.984506', '46.641145', NULL, 169, NULL, '-46.641145', '0.166667', 0, '6038.984506', '-6038.984506'),
('3d96b918-ec78-7525-046e-55105bb51adf', '443', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34824.625389', NULL, '34940.707473', '116.082085', NULL, 443, NULL, '-116.082085', '0.166667', 0, '26940.707473', '-26940.707473'),
('3e09565f-5841-15a4-7d05-55105b219b6f', '284', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20516.021919', NULL, '20584.408659', '68.386740', NULL, 284, NULL, '-68.386740', '0.166667', 0, '12584.408659', '-12584.408659'),
('3e410654-de5b-a6f3-d74a-55105b441e42', '512', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '43813.512704', NULL, '43959.557747', '146.045042', NULL, 512, NULL, '-146.045042', '0.166667', 0, '35959.557747', '-35959.557747'),
('3e43f607-c905-ccd6-0aae-55105be22780', '151', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13178.807613', NULL, '13222.736972', '43.929359', NULL, 151, NULL, '-43.929359', '0.166667', 0, '5222.736972', '-5222.736972'),
('3ec6a459-090f-0c1f-44c3-55105b3a3140', '385', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28711.936358', NULL, '28807.642812', '95.706455', NULL, 385, NULL, '-95.706455', '0.166667', 0, '20807.642812', '-20807.642812'),
('3ed4ba1b-28fb-e183-e3e4-55105b0e6ffb', '262', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19067.680014', NULL, '19131.238947', '63.558933', NULL, 262, NULL, '-63.558933', '0.166667', 0, '11131.238947', '-11131.238947'),
('3f4afa64-2e22-acf6-4952-55105b308a88', '403', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30484.341518', NULL, '30585.955990', '101.614472', NULL, 403, NULL, '-101.614472', '0.166667', 0, '22585.955990', '-22585.955990'),
('3f67439c-485a-0b72-a698-55105b49b07b', '225', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16858.694578', NULL, '16914.890227', '56.195649', NULL, 225, NULL, '-56.195649', '0.166667', 0, '8914.890227', '-8914.890227'),
('3fd1ac3f-cc5c-ecef-987f-55105b148b4c', '371', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27404.956083', NULL, '27496.305936', '91.349854', NULL, 371, NULL, '-91.349854', '0.166667', 0, '19496.305936', '-19496.305936'),
('40c4ba1f-169b-1618-2391-55105be88eec', '548', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '49389.740596', NULL, '49554.373064', '164.632469', NULL, 548, NULL, '-164.632469', '0.166667', 0, '41554.373064', '-41554.373064'),
('4105e9eb-fca0-c51a-3bec-55105b692146', '534', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '47141.497358', NULL, '47298.635683', '157.138325', NULL, 534, NULL, '-157.138325', '0.166667', 0, '39298.635683', '-39298.635683'),
('419f74ea-f524-d67b-ce9b-55105b656d99', '54', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9543.062174', NULL, '9574.872382', '31.810207', NULL, 54, NULL, '-31.810207', '0.166667', 0, '1574.872382', '-1574.872382'),
('41e61c60-e053-4db2-e70c-55105bbd7e55', '79', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10370.955605', NULL, '10405.525457', '34.569852', NULL, 79, NULL, '-34.569852', '0.166667', 0, '2405.525457', '-2405.525457'),
('42be02fd-597e-bce1-1bd1-55105bfd9f44', '252', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18443.589452', NULL, '18505.068084', '61.478632', NULL, 252, NULL, '-61.478632', '0.166667', 0, '10505.068084', '-10505.068084'),
('439423e0-8e58-2ef5-25c4-55105b4b0b1e', '138', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12620.832029', NULL, '12662.901470', '42.069440', NULL, 138, NULL, '-42.069440', '0.166667', 0, '4662.901470', '-4662.901470'),
('4397f409-8c18-9b8d-4aec-55105beca1d6', '434', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33797.088232', NULL, '33909.745193', '112.656961', NULL, 434, NULL, '-112.656961', '0.166667', 0, '25909.745193', '-25909.745193'),
('43d00fdb-b78a-e9ee-bbfe-55105b93953f', '143', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12832.586227', NULL, '12875.361514', '42.775287', NULL, 143, NULL, '-42.775287', '0.166667', 0, '4875.361514', '-4875.361514'),
('44213a73-5cae-eb7a-cc2e-55105b75547e', '348', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25385.666503', NULL, '25470.285391', '84.618888', NULL, 348, NULL, '-84.618888', '0.166667', 0, '17470.285391', '-17470.285391'),
('442b5833-1542-0d41-0d56-55105b6a83d5', '311', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22444.744087', NULL, '22519.559901', '74.815814', NULL, 311, NULL, '-74.815814', '0.166667', 0, '14519.559901', '-14519.559901'),
('448b9389-6ce7-12bd-2181-55105beddd58', '571', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '53318.421708', NULL, '53496.149781', '177.728072', NULL, 571, NULL, '-177.728072', '0.166667', 0, '45496.149781', '-45496.149781'),
('44baebc6-c40d-d43a-9ad3-55105bdb7481', '525', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '45750.537955', NULL, '45903.039749', '152.501793', NULL, 525, NULL, '-152.501793', '0.166667', 0, '37903.039749', '-37903.039749'),
('4517e2a8-fa70-e280-1ee6-55105ba7552d', '484', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '39915.477520', NULL, '40048.529111', '133.051592', NULL, 484, NULL, '-133.051592', '0.166667', 0, '32048.529111', '-32048.529111'),
('452c2cb5-40c1-06de-0111-55105b5004de', '84', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10544.961041', NULL, '10580.110911', '35.149870', NULL, 84, NULL, '-35.149870', '0.166667', 0, '2580.110911', '-2580.110911'),
('4696db6b-4cb3-3437-728a-55105b86f636', '603', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '59309.599755', NULL, '59507.298421', '197.698666', NULL, 603, NULL, '-197.698666', '0.166667', 0, '51507.298421', '-51507.298421'),
('4756839a-d4e4-493a-0453-55105bb58e35', '389', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29096.680562', NULL, '29193.669497', '96.988935', NULL, 389, NULL, '-96.988935', '0.166667', 0, '21193.669497', '-21193.669497'),
('4765c11d-e382-2bb0-47ba-55105b497bf0', '516', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '44400.620271', NULL, '44548.622339', '148.002068', NULL, 516, NULL, '-148.002068', '0.166667', 0, '36548.622339', '-36548.622339'),
('47b4e5c4-e5c1-8921-6473-55105b31a3a6', '362', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26596.344064', NULL, '26684.998544', '88.654480', NULL, 362, NULL, '-88.654480', '0.166667', 0, '18684.998544', '-18684.998544'),
('47d2e153-4b04-825a-7f23-55105bc7e21c', '439', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34364.140807', NULL, '34478.687943', '114.547136', NULL, 439, NULL, '-114.547136', '0.166667', 0, '26478.687943', '-26478.687943'),
('493f5507-052d-c22e-6146-55105bd85494', '562', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '51745.205664', NULL, '51917.689682', '172.484019', NULL, 562, NULL, '-172.484019', '0.166667', 0, '43917.689682', '-43917.689682'),
('4996eaef-2df4-ae60-72a9-55105ba40eac', '589', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '56609.800061', NULL, '56798.499394', '188.699334', NULL, 589, NULL, '-188.699334', '0.166667', 0, '48798.499394', '-48798.499394'),
('4a2071b3-aff8-1913-5f0d-55105b3d74a5', '89', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10721.885966', NULL, '10757.625586', '35.739620', NULL, 89, NULL, '-35.739620', '0.166667', 0, '2757.625586', '-2757.625586'),
('4af64927-207b-12f6-1df7-55105bcbf3e9', '267', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19387.600385', NULL, '19452.225720', '64.625335', NULL, 267, NULL, '-64.625335', '0.166667', 0, '11452.225720', '-11452.225720'),
('4ba68d76-359b-7a27-2b2b-55105be2317f', '617', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '62138.156632', NULL, '62345.283821', '207.127189', NULL, 617, NULL, '-207.127189', '0.166667', 0, '54345.283821', '-54345.283821'),
('4bb952d8-3e7f-674d-a7dd-55105b204b4b', '376', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27864.760513', NULL, '27957.643048', '92.882535', NULL, 376, NULL, '-92.882535', '0.166667', 0, '19957.643048', '-19957.643048'),
('4bf8cff0-f512-e30e-fe09-55105b1178a6', '297', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21423.049227', NULL, '21494.459392', '71.410164', NULL, 297, NULL, '-71.410164', '0.166667', 0, '13494.459392', '-13494.459392'),
('4c35e71b-0f99-db48-4e0e-55105b8f8438', '179', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14465.813531', NULL, '14514.032909', '48.219378', NULL, 179, NULL, '-48.219378', '0.166667', 0, '6514.032909', '-6514.032909'),
('4c377fb8-4d76-1f63-806d-55105ba63132', '465', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '37469.832580', NULL, '37594.732022', '124.899442', NULL, 465, NULL, '-124.899442', '0.166667', 0, '29594.732022', '-29594.732022'),
('4c64996d-c6e7-c9fb-5d8d-55105b52ac5f', '35', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8958.353105', NULL, '8988.214282', '29.861177', NULL, 35, NULL, '-29.861177', '0.166667', 0, '988.214282', '-988.214282'),
('4caa0412-a4a3-6253-71c6-55105bb07308', '305', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22001.040107', NULL, '22074.376908', '73.336800', NULL, 305, NULL, '-73.336800', '0.166667', 0, '14074.376908', '-14074.376908'),
('4cf4065d-66bc-4e99-9c96-55105bdbbd70', '422', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32474.045513', NULL, '32582.292332', '108.246818', NULL, 422, NULL, '-108.246818', '0.166667', 0, '24582.292332', '-24582.292332'),
('4dc1138b-9873-945a-1f14-55105bec0286', '488', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '40450.350837', NULL, '40585.185340', '134.834503', NULL, 488, NULL, '-134.834503', '0.166667', 0, '32585.185340', '-32585.185340'),
('4e6bc131-3d7b-2d85-bff8-55105b5960ac', '216', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16361.261084', NULL, '16415.798621', '54.537537', NULL, 216, NULL, '-54.537537', '0.166667', 0, '8415.798621', '-8415.798621'),
('4ee53a39-b9b9-56ff-8b81-55105b10e80c', '417', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31938.181945', NULL, '32044.642552', '106.460606', NULL, 417, NULL, '-106.460606', '0.166667', 0, '24044.642552', '-24044.642552'),
('4ef77f4a-3671-468a-63f2-55105b0f8007', '258', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18815.548869', NULL, '18878.267365', '62.718496', NULL, 258, NULL, '-62.718496', '0.166667', 0, '10878.267365', '-10878.267365'),
('4feea304-77cd-9b2f-01ad-55105b8af4b6', '539', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '47932.444414', NULL, '48092.219229', '159.774815', NULL, 539, NULL, '-159.774815', '0.166667', 0, '40092.219229', '-40092.219229'),
('500fff54-00af-40fd-c4e8-55105b543b94', '244', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17959.056610', NULL, '18018.920132', '59.863522', NULL, 244, NULL, '-59.863522', '0.166667', 0, '10018.920132', '-10018.920132'),
('50cf881f-ffc2-2f82-45f1-55105b16c825', '193', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15155.708194', NULL, '15206.227221', '50.519027', NULL, 193, NULL, '-50.519027', '0.166667', 0, '7206.227221', '-7206.227221'),
('50e5a3cc-400d-41ac-4534-55105be95983', '367', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27042.581481', NULL, '27132.723420', '90.141938', NULL, 367, NULL, '-90.141938', '0.166667', 0, '19132.723420', '-19132.723420'),
('52347175-04cb-a651-3f51-55105b3e1b8e', '408', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30995.812335', NULL, '31099.131710', '103.319374', NULL, 408, NULL, '-103.319374', '0.166667', 0, '23099.131710', '-23099.131710'),
('523b4c1c-dac4-b990-39f6-55105bf71311', '17', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8437.501071', NULL, '8465.626075', '28.125004', NULL, 17, NULL, '-28.125004', '0.166667', 0, '465.626075', '-465.626075'),
('528caba2-acd0-d89b-1f21-55105b7ba233', '26', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8694.027486', NULL, '8723.007577', '28.980092', NULL, 26, NULL, '-28.980092', '0.166667', 0, '723.007577', '-723.007577'),
('528d061a-4b8e-a99a-769b-55105b90091f', '427', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33018.899880', NULL, '33128.962880', '110.063000', NULL, 427, NULL, '-110.063000', '0.166667', 0, '25128.962880', '-25128.962880'),
('529d91ef-13a8-ac92-5c89-55105b48e57f', '40', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9108.657686', NULL, '9139.019878', '30.362192', NULL, 40, NULL, '-30.362192', '0.166667', 0, '1139.019878', '-1139.019878'),
('52bfb359-59c5-d5a9-8b82-55105b3cc34f', '470', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '38098.507005', NULL, '38225.502028', '126.995023', NULL, 470, NULL, '-126.995023', '0.166667', 0, '30225.502028', '-30225.502028'),
('53302530-4848-c642-699a-55105b009936', '12', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8298.271439', NULL, '8325.932343', '27.660905', NULL, 12, NULL, '-27.660905', '0.166667', 0, '325.932343', '-325.932343'),
('534bd389-3c94-a827-136b-55105b884ab2', '344', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25049.992884', NULL, '25133.492860', '83.499976', NULL, 344, NULL, '-83.499976', '0.166667', 0, '17133.492860', '-17133.492860'),
('5375085a-a522-dff1-e632-55105b2c6eb5', '189', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14955.304891', NULL, '15005.155907', '49.851016', NULL, 189, NULL, '-49.851016', '0.166667', 0, '7005.155907', '-7005.155907'),
('538945b2-4134-3e5b-1afd-55105bd8e8e0', '316', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22821.325343', NULL, '22897.396427', '76.071084', NULL, 316, NULL, '-76.071084', '0.166667', 0, '14897.396427', '-14897.396427'),
('53bd078e-2bc8-afda-74ed-55105bc45781', '622', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '63180.719868', NULL, '63391.322268', '210.602400', NULL, 622, NULL, '-210.602400', '0.166667', 0, '55391.322268', '-55391.322268'),
('53db1048-49fe-8a68-dfe8-55105bf2ca0e', '447', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '35291.280532', NULL, '35408.918134', '117.637602', NULL, 447, NULL, '-117.637602', '0.166667', 0, '27408.918134', '-27408.918134'),
('544cbad4-490c-2d59-2a01-55105b50f88d', '394', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29584.868997', NULL, '29683.485227', '98.616230', NULL, 394, NULL, '-98.616230', '0.166667', 0, '21683.485227', '-21683.485227'),
('54d7f9e0-8fb6-c755-d793-55105b13e3cc', '413', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31515.864686', NULL, '31620.917568', '105.052882', NULL, 413, NULL, '-105.052882', '0.166667', 0, '23620.917568', '-23620.917568'),
('552500aa-d8b8-4767-66f8-55105be7fb34', '576', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '54213.006120', NULL, '54393.716140', '180.710020', NULL, 576, NULL, '-180.710020', '0.166667', 0, '46393.716140', '-46393.716140'),
('562ddee8-8c6d-f38a-d3d2-55105bc36470', '22', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8579.066719', NULL, '8607.663609', '28.596889', NULL, 22, NULL, '-28.596889', '0.166667', 0, '607.663609', '-607.663609'),
('569f93f3-f714-619c-e062-55105b6bad85', '381', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28332.279610', NULL, '28426.720542', '94.440932', NULL, 381, NULL, '-94.440932', '0.166667', 0, '20426.720542', '-20426.720542'),
('56b9f0fa-2996-1458-7ad3-55105bd46983', '7', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8161.339274', NULL, '8188.543738', '27.204464', NULL, 7, NULL, '-27.204464', '0.166667', 0, '188.543738', '-188.543738'),
('57e65b04-e2c3-0170-a5d1-55105b183fb4', '160', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13579.484571', NULL, '13624.749520', '45.264949', NULL, 160, NULL, '-45.264949', '0.166667', 0, '5624.749520', '-5624.749520'),
('5902bccd-c6bc-e543-770d-55105b5f8bb6', '174', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14227.108980', NULL, '14274.532676', '47.423697', NULL, 174, NULL, '-47.423697', '0.166667', 0, '6274.532676', '-6274.532676'),
('5904b5c9-11f1-f001-18d0-55105b3c5425', '207', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15878.504888', NULL, '15931.433238', '52.928350', NULL, 207, NULL, '-52.928350', '0.166667', 0, '7931.433238', '-7931.433238'),
('59057d06-31d6-41b6-4761-55105bb3d37a', '119', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11847.546179', NULL, '11887.037999', '39.491821', NULL, 119, NULL, '-39.491821', '0.166667', 0, '3887.037999', '-3887.037999');
INSERT INTO `yo_amortizationschedule` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `bbalance`, `currency_id`, `ebalance`, `interest`, `paydate`, `pay_num`, `payment`, `principal`, `tax_amnt`, `received`, `cinterest`, `cprincipal`) VALUES
('594f4f11-0302-5980-deca-55105b97c5d0', '594', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '57559.607708', NULL, '57751.473067', '191.865359', NULL, 594, NULL, '-191.865359', '0.166667', 0, '49751.473067', '-49751.473067'),
('59bd2d9f-b63f-8d7d-6d48-55105b10a83f', '567', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '52613.394422', NULL, '52788.772403', '175.377981', NULL, 567, NULL, '-175.377981', '0.166667', 0, '44788.772403', '-44788.772403'),
('59ec3f23-4676-6973-b7a1-55105b32643c', '198', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15409.992921', NULL, '15461.359564', '51.366643', NULL, 198, NULL, '-51.366643', '0.166667', 0, '7461.359564', '-7461.359564'),
('5acec37e-5030-d2d9-3c66-55105bce23ad', '353', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25811.590992', NULL, '25897.629629', '86.038637', NULL, 353, NULL, '-86.038637', '0.166667', 0, '17897.629629', '-17897.629629'),
('5bd45439-3511-48ff-316b-55105b26f7b3', '249', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18260.376333', NULL, '18321.244254', '60.867921', NULL, 249, NULL, '-60.867921', '0.166667', 0, '10321.244254', '-10321.244254'),
('5c34036d-a96b-458e-10c7-55105bfe91fd', '104', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11270.671635', NULL, '11308.240541', '37.568905', NULL, 104, NULL, '-37.568905', '0.166667', 0, '3308.240541', '-3308.240541'),
('5c5fb905-e5fb-f0a6-b042-55105b330de2', '2', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8026.666667', NULL, '8053.422222', '26.755556', NULL, 2, NULL, '-26.755556', '0.166667', 0, '53.422222', '-53.422222'),
('5c9b2543-5789-f63c-7fb4-55105bf4e755', '114', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11652.046411', NULL, '11690.886565', '38.840155', NULL, 114, NULL, '-38.840155', '0.166667', 0, '3690.886565', '-3690.886565'),
('5cc615e1-3f7d-1782-eed9-55105b63d831', '184', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14708.523102', NULL, '14757.551513', '49.028410', NULL, 184, NULL, '-49.028410', '0.166667', 0, '6757.551513', '-6757.551513'),
('5d0f9cad-aa81-4f64-5855-55105b1ca855', '553', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '50218.409011', NULL, '50385.803707', '167.394697', NULL, 553, NULL, '-167.394697', '0.166667', 0, '42385.803707', '-42385.803707'),
('5d6d7eb5-4629-abd7-cbf8-55105b84e0a6', '280', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20244.739409', NULL, '20312.221874', '67.482465', NULL, 280, NULL, '-67.482465', '0.166667', 0, '12312.221874', '-12312.221874'),
('5e24058d-cebf-c308-0da4-55105bb45d60', '109', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11459.772640', NULL, '11497.971883', '38.199242', NULL, 109, NULL, '-38.199242', '0.166667', 0, '3497.971883', '-3497.971883'),
('5ecd390e-845a-c1d2-4844-55105bd7b057', '235', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17429.155778', NULL, '17487.252964', '58.097186', NULL, 235, NULL, '-58.097186', '0.166667', 0, '9487.252964', '-9487.252964'),
('5f569347-1780-184e-ae8d-55105bfbd0a1', '321', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23204.224934', NULL, '23281.572351', '77.347416', NULL, 321, NULL, '-77.347416', '0.166667', 0, '15281.572351', '-15281.572351'),
('5f589da6-c94e-10f7-43e1-55105b108000', '124', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12046.326071', NULL, '12086.480491', '40.154420', NULL, 124, NULL, '-40.154420', '0.166667', 0, '4086.480491', '-4086.480491'),
('5fab6c0b-e5e2-1ebb-3fc3-55105b8956d9', '165', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13807.323183', NULL, '13853.347594', '46.024411', NULL, 165, NULL, '-46.024411', '0.166667', 0, '5853.347594', '-5853.347594'),
('608cf2fd-541f-45ff-4871-55105bceb980', '221', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16635.772757', NULL, '16691.225333', '55.452576', NULL, 221, NULL, '-55.452576', '0.166667', 0, '8691.225333', '-8691.225333'),
('60b0d52e-d3df-4967-e13b-55105bec98b0', '608', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '60304.705043', NULL, '60505.720726', '201.015683', NULL, 608, NULL, '-201.015683', '0.166667', 0, '52505.720726', '-52505.720726'),
('614ec7e7-2686-4da7-5850-55105bae4a2c', '599', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '58525.351369', NULL, '58720.435873', '195.084505', NULL, 599, NULL, '-195.084505', '0.166667', 0, '50720.435873', '-50720.435873'),
('6197d0da-c864-ab6a-213b-55105b6965c3', '212', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16144.916805', NULL, '16198.733195', '53.816389', NULL, 212, NULL, '-53.816389', '0.166667', 0, '8198.733195', '-8198.733195'),
('61a7e519-d59b-7d6f-4fe3-55105b89c9e4', '497', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '41680.167979', NULL, '41819.101872', '138.933893', NULL, 497, NULL, '-138.933893', '0.166667', 0, '33819.101872', '-33819.101872'),
('61b970f6-9476-c3c6-2737-55105ba1e141', '230', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17141.552264', NULL, '17198.690772', '57.138508', NULL, 230, NULL, '-57.138508', '0.166667', 0, '9198.690772', '-9198.690772'),
('62d0b193-c1ff-17aa-c5e3-55105bc86792', '509', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '43378.282332', NULL, '43522.876606', '144.594274', NULL, 509, NULL, '-144.594274', '0.166667', 0, '35522.876606', '-35522.876606'),
('6396978e-fa52-83ed-0ef6-55105bfe14de', '70', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10064.949665', NULL, '10098.499497', '33.549832', NULL, 70, NULL, '-33.549832', '0.166667', 0, '2098.499497', '-2098.499497'),
('64249f7c-25e1-dc20-97f6-55105bba7fc0', '45', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9261.484100', NULL, '9292.355713', '30.871614', NULL, 45, NULL, '-30.871614', '0.166667', 0, '1292.355713', '-1292.355713'),
('64330c70-45d1-7ea0-048a-55105bffa6ee', '334', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24230.099530', NULL, '24310.866529', '80.766998', NULL, 334, NULL, '-80.766998', '0.166667', 0, '16310.866529', '-16310.866529'),
('643aad93-70ea-aa7b-1189-55105b323ca4', '358', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26244.661706', NULL, '26332.143911', '87.482206', NULL, 358, NULL, '-87.482206', '0.166667', 0, '18332.143911', '-18332.143911'),
('644954d0-f12c-54e1-1398-55105b5b80aa', '530', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '46518.147287', NULL, '46673.207778', '155.060491', NULL, 530, NULL, '-155.060491', '0.166667', 0, '38673.207778', '-38673.207778'),
('649a026d-5d98-5bb1-ee88-55105b8e4c2d', '329', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23830.271687', NULL, '23909.705926', '79.434239', NULL, 329, NULL, '-79.434239', '0.166667', 0, '15909.705926', '-15909.705926'),
('650cd24e-e6e5-81f9-4f9d-55105bc00dba', '399', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30081.248330', NULL, '30181.519158', '100.270828', NULL, 399, NULL, '-100.270828', '0.166667', 0, '22181.519158', '-22181.519158'),
('6580959c-c313-7aa9-3b0e-55105b0b1658', '521', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '45145.580483', NULL, '45296.065751', '150.485268', NULL, 521, NULL, '-150.485268', '0.166667', 0, '37296.065751', '-37296.065751'),
('65efdbc4-de23-e3e7-bdf7-55105b2d6cd2', '544', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '48736.662097', NULL, '48899.117637', '162.455540', NULL, 544, NULL, '-162.455540', '0.166667', 0, '40899.117637', '-40899.117637'),
('66375f4f-0c7c-eca7-34b9-55105b5c13c1', '60', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9735.521015', NULL, '9767.972752', '32.451737', NULL, 60, NULL, '-32.451737', '0.166667', 0, '1767.972752', '-1767.972752'),
('6657ee8a-1d7d-7697-3852-55105b7eed49', '276', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19977.044057', NULL, '20043.634204', '66.590147', NULL, 276, NULL, '-66.590147', '0.166667', 0, '12043.634204', '-12043.634204'),
('669aaf64-94ba-7e00-fe4b-55105b907760', '65', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9898.865035', NULL, '9931.861252', '32.996217', NULL, 65, NULL, '-32.996217', '0.166667', 0, '1931.861252', '-1931.861252'),
('67177bc4-3109-dc3f-d1f4-55105bf0eeab', '451', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '35764.188924', NULL, '35883.402887', '119.213963', NULL, 451, NULL, '-119.213963', '0.166667', 0, '27883.402887', '-27883.402887'),
('67322880-c4b6-7064-b066-55105b45b51f', '302', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21782.488334', NULL, '21855.096629', '72.608294', NULL, 302, NULL, '-72.608294', '0.166667', 0, '13855.096629', '-13855.096629'),
('673fe862-12af-6cb1-46e2-55105b158254', '340', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24718.757864', NULL, '24801.153723', '82.395860', NULL, 340, NULL, '-82.395860', '0.166667', 0, '16801.153723', '-16801.153723'),
('67470048-ab64-1e66-285c-55105b5b052e', '283', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20447.862378', NULL, '20516.021919', '68.159541', NULL, 283, NULL, '-68.159541', '0.166667', 0, '12516.021919', '-12516.021919'),
('675f9d61-55d2-efbe-f5bf-55105be58549', '581', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '55122.600001', NULL, '55306.342001', '183.742000', NULL, 581, NULL, '-183.742000', '0.166667', 0, '47306.342001', '-47306.342001'),
('67a5c158-6a0b-bd4a-712d-55105bece924', '456', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36364.245806', NULL, '36485.459959', '121.214153', NULL, 456, NULL, '-121.214153', '0.166667', 0, '28485.459959', '-28485.459959'),
('696713c6-d092-13e4-c44e-55105bcfc93f', '99', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11084.691040', NULL, '11121.640010', '36.948970', NULL, 99, NULL, '-36.948970', '0.166667', 0, '3121.640010', '-3121.640010'),
('697c3bda-4f2f-206a-361f-55105ba5cd05', '293', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21139.773133', NULL, '21210.239043', '70.465910', NULL, 293, NULL, '-70.465910', '0.166667', 0, '13210.239043', '-13210.239043'),
('69d801c3-2d39-73d1-0135-55105baedae4', '331', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23989.404945', NULL, '24069.369628', '79.964683', NULL, 331, NULL, '-79.964683', '0.166667', 0, '16069.369628', '-16069.369628'),
('6a0265af-579e-855a-1de7-55105bba91ce', '50', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9416.874658', NULL, '9448.264240', '31.389582', NULL, 50, NULL, '-31.389582', '0.166667', 0, '1448.264240', '-1448.264240'),
('6a3cfddf-5c97-741f-85e7-55105b0ef6d2', '475', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '38737.729423', NULL, '38866.855188', '129.125765', NULL, 475, NULL, '-129.125765', '0.166667', 0, '30866.855188', '-30866.855188'),
('6a67a4a4-9ee4-38cf-b316-55105b47d274', '613', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '61316.506355', NULL, '61520.894710', '204.388355', NULL, 613, NULL, '-204.388355', '0.166667', 0, '53520.894710', '-53520.894710'),
('6af9f832-b0ee-50f2-3054-55105b0b1286', '94', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10901.779364', NULL, '10938.118628', '36.339265', NULL, 94, NULL, '-36.339265', '0.166667', 0, '2938.118628', '-2938.118628'),
('6b0084e6-08fc-eae1-e310-55105b583598', '480', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '39387.676810', NULL, '39518.969066', '131.292256', NULL, 480, NULL, '-131.292256', '0.166667', 0, '31518.969066', '-31518.969066'),
('6b79a787-e841-b664-9330-55105ba83620', '461', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36974.370532', NULL, '37097.618434', '123.247902', NULL, 461, NULL, '-123.247902', '0.166667', 0, '29097.618434', '-29097.618434'),
('6b7ad6ab-56a3-9df3-d784-55105be4dc09', '307', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22147.958164', NULL, '22221.784691', '73.826527', NULL, 307, NULL, '-73.826527', '0.166667', 0, '14221.784691', '-14221.784691'),
('6b82ed4b-f332-ccd1-f5be-55105b50d31a', '326', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23593.548872', NULL, '23672.194035', '78.645163', NULL, 326, NULL, '-78.645163', '0.166667', 0, '15672.194035', '-15672.194035'),
('6bc668db-4a15-40fe-f0de-55105b0efaf8', '336', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24391.902750', NULL, '24473.209093', '81.306343', NULL, 336, NULL, '-81.306343', '0.166667', 0, '16473.209093', '-16473.209093'),
('6c79e911-7a28-86fa-30f1-55105bb05503', '75', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10233.820888', NULL, '10267.933624', '34.112736', NULL, 75, NULL, '-34.112736', '0.166667', 0, '2267.933624', '-2267.933624'),
('6c7c83a7-f981-cd84-94ce-55105b73d56e', '263', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19131.238947', NULL, '19195.009743', '63.770796', NULL, 263, NULL, '-63.770796', '0.166667', 0, '11195.009743', '-11195.009743'),
('6c93edc4-4178-36d4-1092-55105bea1d5d', '157', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13444.590020', NULL, '13489.405320', '44.815300', NULL, 157, NULL, '-44.815300', '0.166667', 0, '5489.405320', '-5489.405320'),
('6d3e09a1-38cd-c07d-39c8-55105be90ee4', '611', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '60909.764484', NULL, '61112.797032', '203.032548', NULL, 611, NULL, '-203.032548', '0.166667', 0, '53112.797032', '-53112.797032'),
('6dce2701-aa04-9ad8-7f78-55105bf45134', '134', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12453.947289', NULL, '12495.460447', '41.513158', NULL, 134, NULL, '-41.513158', '0.166667', 0, '4495.460447', '-4495.460447'),
('6e29fcfe-3a9c-efd6-577a-55105b2e5521', '31', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8839.897172', NULL, '8869.363496', '29.466324', NULL, 31, NULL, '-29.466324', '0.166667', 0, '869.363496', '-869.363496'),
('6ee98bcb-f418-fb4a-631c-55105b81dc39', '129', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12248.441122', NULL, '12289.269259', '40.828137', NULL, 129, NULL, '-40.828137', '0.166667', 0, '4289.269259', '-4289.269259'),
('6f61357c-9e29-c146-2850-55105b337e2f', '152', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13222.736972', NULL, '13266.812762', '44.075790', NULL, 152, NULL, '-44.075790', '0.166667', 0, '5266.812762', '-5266.812762'),
('6f75051c-9e99-6dfd-0ea3-55105b1c8bec', '240', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17721.584747', NULL, '17780.656696', '59.071949', NULL, 240, NULL, '-59.071949', '0.166667', 0, '9780.656696', '-9780.656696'),
('70310716-1c0a-4dec-7ea8-55105b393113', '404', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30585.955990', NULL, '30687.909177', '101.953187', NULL, 404, NULL, '-101.953187', '0.166667', 0, '22687.909177', '-22687.909177'),
('705f41f9-3cd7-1e8f-9fa5-55105bcee364', '501', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '42238.688410', NULL, '42379.484038', '140.795628', NULL, 501, NULL, '-140.795628', '0.166667', 0, '34379.484038', '-34379.484038'),
('70981cba-f24a-7ef1-10f1-55105b15e156', '80', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10405.525457', NULL, '10440.210542', '34.685085', NULL, 80, NULL, '-34.685085', '0.166667', 0, '2440.210542', '-2440.210542'),
('70fb7b76-e581-8ed4-d0ff-55105bcd277e', '444', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34940.707473', NULL, '35057.176498', '116.469025', NULL, 444, NULL, '-116.469025', '0.166667', 0, '27057.176498', '-27057.176498'),
('71cd0a9c-8449-91fb-5305-55105b5988f3', '55', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9574.872382', NULL, '9606.788623', '31.916241', NULL, 55, NULL, '-31.916241', '0.166667', 0, '1606.788623', '-1606.788623'),
('71cee03e-6d90-7e09-cd6f-55105b1d82b4', '372', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27496.305936', NULL, '27587.960289', '91.654353', NULL, 372, NULL, '-91.654353', '0.166667', 0, '19587.960289', '-19587.960289'),
('727ade12-eb02-aa65-41b7-55105b1c3253', '139', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12662.901470', NULL, '12705.111141', '42.209672', NULL, 139, NULL, '-42.209672', '0.166667', 0, '4705.111141', '-4705.111141'),
('72b40030-930e-589f-bc10-55105bdbc324', '473', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '38480.763436', NULL, '38609.032648', '128.269211', NULL, 473, NULL, '-128.269211', '0.166667', 0, '30609.032648', '-30609.032648'),
('7325bfc0-16b9-6c25-d369-55105ba451cf', '549', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '49554.373064', NULL, '49719.554308', '165.181244', NULL, 549, NULL, '-165.181244', '0.166667', 0, '41719.554308', '-41719.554308'),
('73b179b9-e331-8291-97ce-55105bfaf5b6', '285', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20584.408659', NULL, '20653.023354', '68.614696', NULL, 285, NULL, '-68.614696', '0.166667', 0, '12653.023354', '-12653.023354'),
('749f5483-4267-7a53-5d3d-55105be5cd02', '144', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12875.361514', NULL, '12918.279386', '42.917872', NULL, 144, NULL, '-42.917872', '0.166667', 0, '4918.279386', '-4918.279386'),
('759259b0-712b-ddaf-1071-55105b1c5517', '505', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '42804.693098', NULL, '42947.375408', '142.682310', NULL, 505, NULL, '-142.682310', '0.166667', 0, '34947.375408', '-34947.375408'),
('75d8d6a7-e076-8eec-5bac-55105bde8407', '493', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '41129.032841', NULL, '41266.129617', '137.096776', NULL, 493, NULL, '-137.096776', '0.166667', 0, '33266.129617', '-33266.129617'),
('763d3cd0-50b7-5273-5ea9-55105b1e1ca0', '386', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28807.642812', NULL, '28903.668288', '96.025476', NULL, 386, NULL, '-96.025476', '0.166667', 0, '20903.668288', '-20903.668288'),
('76f4e9ff-dd2f-3b21-036f-55105b1159f5', '558', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '51060.980948', NULL, '51231.184218', '170.203270', NULL, 558, NULL, '-170.203270', '0.166667', 0, '43231.184218', '-43231.184218'),
('77bbd908-69fa-4baf-0f4c-55105b0c3298', '85', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10580.110911', NULL, '10615.377947', '35.267036', NULL, 85, NULL, '-35.267036', '0.166667', 0, '2615.377947', '-2615.377947'),
('77cc0268-a4f7-777d-acfb-55105b2255d7', '533', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '46984.881088', NULL, '47141.497358', '156.616270', NULL, 533, NULL, '-156.616270', '0.166667', 0, '39141.497358', '-39141.497358'),
('782012e8-65c4-f6bf-8ca4-55105b4bc0ce', '254', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18566.751644', NULL, '18628.640816', '61.889172', NULL, 254, NULL, '-61.889172', '0.166667', 0, '10628.640816', '-10628.640816'),
('7875e1fd-5ba5-4f82-702e-55105bb729e7', '585', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '55861.251015', NULL, '56047.455185', '186.204170', NULL, 585, NULL, '-186.204170', '0.166667', 0, '48047.455185', '-48047.455185'),
('789e2411-5c49-99db-2e77-55105be80a4f', '435', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33909.745193', NULL, '34022.777677', '113.032484', NULL, 435, NULL, '-113.032484', '0.166667', 0, '26022.777677', '-26022.777677'),
('78edb622-24e4-cc7b-a008-55105bef88d2', '513', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '43959.557747', NULL, '44106.089606', '146.531859', NULL, 513, NULL, '-146.531859', '0.166667', 0, '36106.089606', '-36106.089606'),
('78fd773b-77ee-b45b-e7fd-55105b11812b', '363', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26684.998544', NULL, '26773.948539', '88.949995', NULL, 363, NULL, '-88.949995', '0.166667', 0, '18773.948539', '-18773.948539'),
('794447c5-9de9-0f24-e4dd-55105b4b6884', '563', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '51917.689682', NULL, '52090.748648', '173.058966', NULL, 563, NULL, '-173.058966', '0.166667', 0, '44090.748648', '-44090.748648'),
('7953cb21-cfe7-be91-0573-55105b23d7e3', '272', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19712.888429', NULL, '19778.598057', '65.709628', NULL, 272, NULL, '-65.709628', '0.166667', 0, '11778.598057', '-11778.598057'),
('79b8965e-e5bd-a726-2740-55105be67fc7', '203', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15668.544074', NULL, '15720.772555', '52.228480', NULL, 203, NULL, '-52.228480', '0.166667', 0, '7720.772555', '-7720.772555'),
('79d0f875-a506-5f1d-a7f7-55105bae04cb', '485', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '40048.529111', NULL, '40182.024209', '133.495097', NULL, 485, NULL, '-133.495097', '0.166667', 0, '32182.024209', '-32182.024209'),
('79d92736-e2f7-5683-27b1-55105b231b4d', '604', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '59507.298421', NULL, '59705.656082', '198.357661', NULL, 604, NULL, '-198.357661', '0.166667', 0, '51705.656082', '-51705.656082'),
('7a072c34-8392-dd73-4139-55105b62ec4d', '432', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33572.895894', NULL, '33684.805547', '111.909653', NULL, 432, NULL, '-111.909653', '0.166667', 0, '25684.805547', '-25684.805547'),
('7a18a364-017b-4560-1634-55105ba26a92', '289', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20860.242787', NULL, '20929.776929', '69.534143', NULL, 289, NULL, '-69.534143', '0.166667', 0, '12929.776929', '-12929.776929'),
('7a5bb40b-9622-13d2-c2e9-55105b852477', '390', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29193.669497', NULL, '29290.981729', '97.312232', NULL, 390, NULL, '-97.312232', '0.166667', 0, '21290.981729', '-21290.981729'),
('7a89eab7-cadb-0def-e07f-55105b8a1009', '312', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22519.559901', NULL, '22594.625101', '75.065200', NULL, 312, NULL, '-75.065200', '0.166667', 0, '14594.625101', '-14594.625101'),
('7be60681-de68-3ac1-4528-55105b900be6', '556', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '50722.268908', NULL, '50891.343137', '169.074230', NULL, 556, NULL, '-169.074230', '0.166667', 0, '42891.343137', '-42891.343137'),
('7bfc7c53-de84-528d-e68b-55105b61a5b7', '590', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '56798.499394', NULL, '56987.827726', '189.328331', NULL, 590, NULL, '-189.328331', '0.166667', 0, '48987.827726', '-48987.827726'),
('7d1d3152-ca1d-a631-4574-55105bce4efb', '349', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25470.285391', NULL, '25555.186343', '84.900951', NULL, 349, NULL, '-84.900951', '0.166667', 0, '17555.186343', '-17555.186343'),
('7d49aa53-ebc7-8868-9d4d-55105bcf1094', '466', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '37594.732022', NULL, '37720.047795', '125.315773', NULL, 466, NULL, '-125.315773', '0.166667', 0, '29720.047795', '-29720.047795'),
('7d662ef9-9a3e-c497-bc4b-55105b46308e', '517', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '44548.622339', NULL, '44697.117746', '148.495408', NULL, 517, NULL, '-148.495408', '0.166667', 0, '36697.117746', '-36697.117746'),
('7db3a678-f193-2de9-f247-55105b5c9cc2', '423', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32582.292332', NULL, '32690.899973', '108.607641', NULL, 423, NULL, '-108.607641', '0.166667', 0, '24690.899973', '-24690.899973'),
('7e180b04-6a31-c8d1-c894-55105b102558', '535', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '47298.635683', NULL, '47456.297802', '157.662119', NULL, 535, NULL, '-157.662119', '0.166667', 0, '39456.297802', '-39456.297802'),
('7e4998bd-6dba-6cca-479e-55105b3dffd4', '180', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14514.032909', NULL, '14562.413019', '48.380110', NULL, 180, NULL, '-48.380110', '0.166667', 0, '6562.413019', '-6562.413019'),
('7e6a8ad0-fa62-3cc6-7034-55105be7df14', '489', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '40585.185340', NULL, '40720.469291', '135.283951', NULL, 489, NULL, '-135.283951', '0.166667', 0, '32720.469291', '-32720.469291'),
('7e6f9cf0-cc8a-f88d-cef3-55105b5e9744', '90', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10757.625586', NULL, '10793.484338', '35.858752', NULL, 90, NULL, '-35.858752', '0.166667', 0, '2793.484338', '-2793.484338'),
('7ecb8f44-767e-126b-717d-55105bca5e54', '618', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '62345.283821', NULL, '62553.101433', '207.817613', NULL, 618, NULL, '-207.817613', '0.166667', 0, '54553.101433', '-54553.101433'),
('7edfc9ea-b42c-98ab-60d5-55105bb175d5', '377', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27957.643048', NULL, '28050.835191', '93.192143', NULL, 377, NULL, '-93.192143', '0.166667', 0, '20050.835191', '-20050.835191'),
('7f52a631-b4f8-5070-108e-55105bb14724', '18', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8465.626075', NULL, '8493.844828', '28.218754', NULL, 18, NULL, '-28.218754', '0.166667', 0, '493.844828', '-493.844828'),
('7fb607a4-877f-e607-78ee-55105b0fabd6', '92', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10829.462619', NULL, '10865.560828', '36.098209', NULL, 92, NULL, '-36.098209', '0.166667', 0, '2865.560828', '-2865.560828'),
('80be3e8d-c124-e14a-83b3-55105b01941c', '194', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15206.227221', NULL, '15256.914645', '50.687424', NULL, 194, NULL, '-50.687424', '0.166667', 0, '7256.914645', '-7256.914645'),
('80ff9938-5c7a-552c-23bb-55105b38d7b5', '418', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32044.642552', NULL, '32151.458027', '106.815475', NULL, 418, NULL, '-106.815475', '0.166667', 0, '24151.458027', '-24151.458027'),
('818a3967-b6ca-05af-7eed-55105be6fb3e', '268', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19452.225720', NULL, '19517.066472', '64.840752', NULL, 268, NULL, '-64.840752', '0.166667', 0, '11517.066472', '-11517.066472'),
('81ccddf4-bb8d-bcc3-c4df-55105b714a42', '623', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '63391.322268', NULL, '63602.626675', '211.304408', NULL, 623, NULL, '-211.304408', '0.166667', 0, '55602.626675', '-55602.626675'),
('81d169d3-42e5-aa61-57a9-55105ba396f2', '36', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8988.214282', NULL, '9018.174996', '29.960714', NULL, 36, NULL, '-29.960714', '0.166667', 0, '1018.174996', '-1018.174996'),
('8229c18f-a0d2-fa04-3e9b-55105b56bef3', '13', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8325.932343', NULL, '8353.685451', '27.753108', NULL, 13, NULL, '-27.753108', '0.166667', 0, '353.685451', '-353.685451'),
('8242ad69-e4e7-832f-da2b-55105bf74f9c', '245', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18018.920132', NULL, '18078.983199', '60.063067', NULL, 245, NULL, '-60.063067', '0.166667', 0, '10078.983199', '-10078.983199'),
('82470e65-6269-0616-aed3-55105beaab8d', '540', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '48092.219229', NULL, '48252.526626', '160.307397', NULL, 540, NULL, '-160.307397', '0.166667', 0, '40252.526626', '-40252.526626'),
('82f9e00f-46c6-6f3b-6517-55105b2db86c', '27', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8723.007577', NULL, '8752.084269', '29.076692', NULL, 27, NULL, '-29.076692', '0.166667', 0, '752.084269', '-752.084269'),
('836139ba-4e2a-98eb-d923-55105b849ed2', '41', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9139.019878', NULL, '9169.483278', '30.463400', NULL, 41, NULL, '-30.463400', '0.166667', 0, '1169.483278', '-1169.483278'),
('83e308fc-efc9-21d2-fbb5-55105b51e8d7', '298', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21494.459392', NULL, '21566.107590', '71.648198', NULL, 298, NULL, '-71.648198', '0.166667', 0, '13566.107590', '-13566.107590'),
('850a7229-a3fa-b948-87f2-55105b2fd1ca', '409', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31099.131710', NULL, '31202.795482', '103.663772', NULL, 409, NULL, '-103.663772', '0.166667', 0, '23202.795482', '-23202.795482'),
('853a8783-9c41-a1ae-d932-55105b1b1108', '217', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16415.798621', NULL, '16470.517950', '54.719329', NULL, 217, NULL, '-54.719329', '0.166667', 0, '8470.517950', '-8470.517950'),
('86a0f61f-470d-bb7e-12dd-55105b38e046', '577', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '54393.716140', NULL, '54575.028527', '181.312387', NULL, 577, NULL, '-181.312387', '0.166667', 0, '46575.028527', '-46575.028527'),
('86bc1ba0-5d38-c6c8-391c-55105ba40585', '428', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33128.962880', NULL, '33239.392756', '110.429876', NULL, 428, NULL, '-110.429876', '0.166667', 0, '25239.392756', '-25239.392756'),
('86f769c6-397c-908f-fed1-55105ba05e22', '226', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16914.890227', NULL, '16971.273194', '56.382967', NULL, 226, NULL, '-56.382967', '0.166667', 0, '8971.273194', '-8971.273194'),
('871df734-0ec9-a904-03a9-55105b6e414c', '175', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14274.532676', NULL, '14322.114452', '47.581776', NULL, 175, NULL, '-47.581776', '0.166667', 0, '6322.114452', '-6322.114452'),
('874f0cfe-b977-2d1d-7b2b-55105b4e5e7a', '402', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30383.064636', NULL, '30484.341518', '101.276882', NULL, 402, NULL, '-101.276882', '0.166667', 0, '22484.341518', '-22484.341518'),
('876a9574-f00d-ec35-2acc-55105bc6e3e1', '8', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8188.543738', NULL, '8215.838884', '27.295146', NULL, 8, NULL, '-27.295146', '0.166667', 0, '215.838884', '-215.838884'),
('876fb2fe-3b34-235d-405d-55105b94d027', '23', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8607.663609', NULL, '8636.355821', '28.692212', NULL, 23, NULL, '-28.692212', '0.166667', 0, '636.355821', '-636.355821'),
('87fe61dc-3bab-9964-48a7-55105b1ceba6', '161', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13624.749520', NULL, '13670.165351', '45.415832', NULL, 161, NULL, '-45.415832', '0.166667', 0, '5670.165351', '-5670.165351'),
('88294314-6dfb-9b61-d9ca-55105b10cba5', '120', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11887.037999', NULL, '11926.661459', '39.623460', NULL, 120, NULL, '-39.623460', '0.166667', 0, '3926.661459', '-3926.661459'),
('8849eac3-f079-121f-e635-55105bebf520', '572', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '53496.149781', NULL, '53674.470280', '178.320499', NULL, 572, NULL, '-178.320499', '0.166667', 0, '45674.470280', '-45674.470280'),
('8854d3df-35c4-4690-747f-55105b1e2a18', '526', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '45903.039749', NULL, '46056.049881', '153.010132', NULL, 526, NULL, '-153.010132', '0.166667', 0, '38056.049881', '-38056.049881'),
('88555e11-7350-49ac-27f3-55105ba00acb', '395', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29683.485227', NULL, '29782.430178', '98.944951', NULL, 395, NULL, '-98.944951', '0.166667', 0, '21782.430178', '-21782.430178'),
('88760ee3-4259-3cdf-5460-55105bd618e7', '459', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36729.101753', NULL, '36851.532092', '122.430339', NULL, 459, NULL, '-122.430339', '0.166667', 0, '28851.532092', '-28851.532092'),
('89200030-9422-09cf-1ea8-55105b15cdd7', '208', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15931.433238', NULL, '15984.538015', '53.104777', NULL, 208, NULL, '-53.104777', '0.166667', 0, '7984.538015', '-7984.538015'),
('8969edcb-4ed6-3277-dd63-55105b55878b', '568', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '52788.772403', NULL, '52964.734978', '175.962575', NULL, 568, NULL, '-175.962575', '0.166667', 0, '44964.734978', '-44964.734978'),
('89ac5126-e6dd-91cf-6593-55105b218537', '105', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11308.240541', NULL, '11345.934676', '37.694135', NULL, 105, NULL, '-37.694135', '0.166667', 0, '3345.934676', '-3345.934676'),
('89c1382d-abdd-9b74-82f6-55105bbd5a44', '317', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22897.396427', NULL, '22973.721082', '76.324655', NULL, 317, NULL, '-76.324655', '0.166667', 0, '14973.721082', '-14973.721082'),
('8ae0efe6-c28d-a783-18df-55105bc32f8d', '115', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11690.886565', NULL, '11729.856187', '38.969622', NULL, 115, NULL, '-38.969622', '0.166667', 0, '3729.856187', '-3729.856187'),
('8b358558-5bf6-3c7d-b252-55105bfcdd3c', '125', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12086.480491', NULL, '12126.768760', '40.288268', NULL, 125, NULL, '-40.288268', '0.166667', 0, '4126.768760', '-4126.768760'),
('8ba79214-f14b-b710-c719-55105bd669f3', '354', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25897.629629', NULL, '25983.955061', '86.325432', NULL, 354, NULL, '-86.325432', '0.166667', 0, '17983.955061', '-17983.955061'),
('8bcc313c-5d12-b654-d738-55105b6c64ea', '259', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18878.267365', NULL, '18941.194923', '62.927558', NULL, 259, NULL, '-62.927558', '0.166667', 0, '10941.194923', '-10941.194923'),
('8c1f4634-4309-5d6e-a68a-55105b2a9a7e', '595', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '57751.473067', NULL, '57943.977977', '192.504910', NULL, 595, NULL, '-192.504910', '0.166667', 0, '49943.977977', '-49943.977977'),
('8c2590d0-0d3d-67ce-beb0-55105b778398', '414', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31620.917568', NULL, '31726.320627', '105.403059', NULL, 414, NULL, '-105.403059', '0.166667', 0, '23726.320627', '-23726.320627'),
('8c825d75-82b3-f29f-c355-55105bbdc27e', '3', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8053.422222', NULL, '8080.266963', '26.844741', NULL, 3, NULL, '-26.844741', '0.166667', 0, '80.266963', '-80.266963'),
('8d73e131-6950-6a11-d33d-55105b2b94b2', '368', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27132.723420', NULL, '27223.165831', '90.442411', NULL, 368, NULL, '-90.442411', '0.166667', 0, '19223.165831', '-19223.165831'),
('8dd6e1e3-6ec4-5bf1-6161-55105b25c31e', '448', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '35408.918134', NULL, '35526.947861', '118.029727', NULL, 448, NULL, '-118.029727', '0.166667', 0, '27526.947861', '-27526.947861'),
('8e1273b5-eabc-2e60-4560-55105bf2f29f', '345', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25133.492860', NULL, '25217.271170', '83.778310', NULL, 345, NULL, '-83.778310', '0.166667', 0, '17217.271170', '-17217.271170'),
('8ed30385-7812-7671-9e71-55105bfc52fd', '155', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13355.405589', NULL, '13399.923608', '44.518019', NULL, 155, NULL, '-44.518019', '0.166667', 0, '5399.923608', '-5399.923608'),
('8ef4dcdf-6de1-7f0a-fd64-55105bccd16f', '382', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28426.720542', NULL, '28521.476277', '94.755735', NULL, 382, NULL, '-94.755735', '0.166667', 0, '20521.476277', '-20521.476277'),
('8f614c75-f7ac-43b2-2a35-55105b57267d', '170', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14038.984506', NULL, '14085.781121', '46.796615', NULL, 170, NULL, '-46.796615', '0.166667', 0, '6085.781121', '-6085.781121'),
('8fb1632b-80eb-f01a-10ba-55105bd57573', '185', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14757.551513', NULL, '14806.743351', '49.191838', NULL, 185, NULL, '-49.191838', '0.166667', 0, '6806.743351', '-6806.743351'),
('8fc8f4b3-6aee-1551-ab7a-55105b34f22d', '231', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17198.690772', NULL, '17256.019741', '57.328969', NULL, 231, NULL, '-57.328969', '0.166667', 0, '9256.019741', '-9256.019741'),
('9027d284-a8b2-8bed-1e50-55105baae8c7', '110', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11497.971883', NULL, '11536.298456', '38.326573', NULL, 110, NULL, '-38.326573', '0.166667', 0, '3536.298456', '-3536.298456'),
('905012c4-b2ba-37c0-9ae8-55105bdc881b', '250', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18321.244254', NULL, '18382.315069', '61.070814', NULL, 250, NULL, '-61.070814', '0.166667', 0, '10382.315069', '-10382.315069'),
('90a43389-e6a1-9761-026a-55105badd084', '148', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13047.893268', NULL, '13091.386245', '43.492978', NULL, 148, NULL, '-43.492978', '0.166667', 0, '5091.386245', '-5091.386245'),
('914a72b6-44c0-07b5-6eea-55105b320d5d', '554', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '50385.803707', NULL, '50553.756386', '167.952679', NULL, 554, NULL, '-167.952679', '0.166667', 0, '42553.756386', '-42553.756386'),
('916ce3c2-e3c2-e401-4365-55105bbdf7c9', '236', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17487.252964', NULL, '17545.543807', '58.290843', NULL, 236, NULL, '-58.290843', '0.166667', 0, '9545.543807', '-9545.543807'),
('92938569-8647-a701-3e41-55105bfa3e46', '400', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30181.519158', NULL, '30282.124222', '100.605064', NULL, 400, NULL, '-100.605064', '0.166667', 0, '22282.124222', '-22282.124222'),
('92d155dc-446d-3b0d-e812-55105b653d72', '440', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34478.687943', NULL, '34593.616902', '114.928960', NULL, 440, NULL, '-114.928960', '0.166667', 0, '26593.616902', '-26593.616902'),
('93b0412b-637f-0ae9-94a9-55105bfb7fa6', '199', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15461.359564', NULL, '15512.897429', '51.537865', NULL, 199, NULL, '-51.537865', '0.166667', 0, '7512.897429', '-7512.897429'),
('94035b6b-c587-d4ce-0f95-55105b85e314', '281', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20312.221874', NULL, '20379.929280', '67.707406', NULL, 281, NULL, '-67.707406', '0.166667', 0, '12379.929280', '-12379.929280'),
('9548386e-6fa1-b443-3bcd-55105bb30d10', '322', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23281.572351', NULL, '23359.177592', '77.605241', NULL, 322, NULL, '-77.605241', '0.166667', 0, '15359.177592', '-15359.177592'),
('959ef926-46b9-44c7-c26e-55105b205f78', '609', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '60505.720726', NULL, '60707.406462', '201.685736', NULL, 609, NULL, '-201.685736', '0.166667', 0, '52707.406462', '-52707.406462'),
('95df7435-7479-d61b-739a-55105bce9da0', '600', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '58720.435873', NULL, '58916.170660', '195.734786', NULL, 600, NULL, '-195.734786', '0.166667', 0, '50916.170660', '-50916.170660'),
('95fd89a5-6c95-b408-8634-55105b747efa', '61', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9767.972752', NULL, '9800.532661', '32.559909', NULL, 61, NULL, '-32.559909', '0.166667', 0, '1800.532661', '-1800.532661'),
('96d003f6-60ed-fc02-9089-55105b2ecbd7', '545', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '48899.117637', NULL, '49062.114696', '162.997059', NULL, 545, NULL, '-162.997059', '0.166667', 0, '41062.114696', '-41062.114696'),
('96da2d6a-e463-88d8-f265-55105b7a046d', '66', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9931.861252', NULL, '9964.967456', '33.106204', NULL, 66, NULL, '-33.106204', '0.166667', 0, '1964.967456', '-1964.967456'),
('96e1a629-47e3-571f-837d-55105b086869', '452', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '35883.402887', NULL, '36003.014230', '119.611343', NULL, 452, NULL, '-119.611343', '0.166667', 0, '28003.014230', '-28003.014230'),
('973c56a8-75d6-4392-d403-55105b63012e', '303', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21855.096629', NULL, '21927.946951', '72.850322', NULL, 303, NULL, '-72.850322', '0.166667', 0, '13927.946951', '-13927.946951'),
('97423c4f-f063-2515-2427-55105be4228c', '213', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16198.733195', NULL, '16252.728972', '53.995777', NULL, 213, NULL, '-53.995777', '0.166667', 0, '8252.728972', '-8252.728972'),
('98710298-f0b4-ec1f-d6b2-55105bcd49c1', '51', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9448.264240', NULL, '9479.758454', '31.494214', NULL, 51, NULL, '-31.494214', '0.166667', 0, '1479.758454', '-1479.758454'),
('990a0122-49b3-72ed-e0d9-55105b3a9b18', '570', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '53141.284095', NULL, '53318.421708', '177.137614', NULL, 570, NULL, '-177.137614', '0.166667', 0, '45318.421708', '-45318.421708'),
('992a6e60-6f74-fd79-40f7-55105bcb07e6', '327', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23672.194035', NULL, '23751.101349', '78.907313', NULL, 327, NULL, '-78.907313', '0.166667', 0, '15751.101349', '-15751.101349'),
('9982a971-246a-ec41-cc58-55105b028333', '531', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '46673.207778', NULL, '46828.785138', '155.577359', NULL, 531, NULL, '-155.577359', '0.166667', 0, '38828.785138', '-38828.785138'),
('999e5f39-b84a-9072-314f-55105b2ee50e', '166', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13853.347594', NULL, '13899.525419', '46.177825', NULL, 166, NULL, '-46.177825', '0.166667', 0, '5899.525419', '-5899.525419'),
('99e14ee7-be69-6994-c5a0-55105bd2480f', '457', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36485.459959', NULL, '36607.078159', '121.618200', NULL, 457, NULL, '-121.618200', '0.166667', 0, '28607.078159', '-28607.078159'),
('9a34c355-119e-3b11-e238-55105b679e95', '522', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '45296.065751', NULL, '45447.052637', '150.986886', NULL, 522, NULL, '-150.986886', '0.166667', 0, '37447.052637', '-37447.052637'),
('9a52978b-053e-3a93-9667-55105b268561', '100', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11121.640010', NULL, '11158.712143', '37.072133', NULL, 100, NULL, '-37.072133', '0.166667', 0, '3158.712143', '-3158.712143'),
('9b10ff46-105f-1285-6079-55105bccf0ce', '471', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '38225.502028', NULL, '38352.920368', '127.418340', NULL, 471, NULL, '-127.418340', '0.166667', 0, '30352.920368', '-30352.920368'),
('9b11955e-e083-e784-d633-55105b204797', '498', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '41819.101872', NULL, '41958.498879', '139.397006', NULL, 498, NULL, '-139.397006', '0.166667', 0, '33958.498879', '-33958.498879'),
('9b748fff-a078-79ea-47c2-55105b460895', '46', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9292.355713', NULL, '9323.330232', '30.974519', NULL, 46, NULL, '-30.974519', '0.166667', 0, '1323.330232', '-1323.330232'),
('9cfd17b3-67a4-92fc-8c85-55105b63e5d0', '332', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24069.369628', NULL, '24149.600861', '80.231232', NULL, 332, NULL, '-80.231232', '0.166667', 0, '16149.600861', '-16149.600861'),
('9d9ea206-67cd-65b2-c336-55105bc90c2e', '308', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22221.784691', NULL, '22295.857307', '74.072616', NULL, 308, NULL, '-74.072616', '0.166667', 0, '14295.857307', '-14295.857307'),
('9def98d7-8d8b-e825-0170-55105bf781bb', '359', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26332.143911', NULL, '26419.917724', '87.773813', NULL, 359, NULL, '-87.773813', '0.166667', 0, '18419.917724', '-18419.917724'),
('9e60915a-7d86-c5a2-152f-55105b016500', '158', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13489.405320', NULL, '13534.370004', '44.964684', NULL, 158, NULL, '-44.964684', '0.166667', 0, '5534.370004', '-5534.370004'),
('9edc3e78-a6ea-a614-4f16-55105b0801be', '476', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '38866.855188', NULL, '38996.411372', '129.556184', NULL, 476, NULL, '-129.556184', '0.166667', 0, '30996.411372', '-30996.411372'),
('9fc4ab82-eae2-29ef-7ea7-55105b3ebe31', '95', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10938.118628', NULL, '10974.579024', '36.460395', NULL, 95, NULL, '-36.460395', '0.166667', 0, '2974.579024', '-2974.579024'),
('9fdfd923-7d27-1ffb-a83a-55105b5029d9', '341', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24801.153723', NULL, '24883.824236', '82.670512', NULL, 341, NULL, '-82.670512', '0.166667', 0, '16883.824236', '-16883.824236'),
('a014b20c-125c-cd1b-5431-55105b995a43', '277', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20043.634204', NULL, '20110.446318', '66.812114', NULL, 277, NULL, '-66.812114', '0.166667', 0, '12110.446318', '-12110.446318'),
('a0209629-c9e6-e125-544a-55105bfb30ea', '153', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13266.812762', NULL, '13311.035471', '44.222709', NULL, 153, NULL, '-44.222709', '0.166667', 0, '5311.035471', '-5311.035471'),
('a05e4441-6c00-4a99-7a8b-55105b8d8b5b', '222', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16691.225333', NULL, '16746.862751', '55.637418', NULL, 222, NULL, '-55.637418', '0.166667', 0, '8746.862751', '-8746.862751'),
('a066c239-348a-f3b6-5020-55105bfd155a', '130', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12289.269259', NULL, '12330.233490', '40.964231', NULL, 130, NULL, '-40.964231', '0.166667', 0, '4330.233490', '-4330.233490'),
('a090575a-7d9f-25fe-bd2c-55105b446ef8', '56', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9606.788623', NULL, '9638.811252', '32.022629', NULL, 56, NULL, '-32.022629', '0.166667', 0, '1638.811252', '-1638.811252'),
('a0cda52b-4ecb-6ff1-667c-55105b36028f', '71', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10098.499497', NULL, '10132.161162', '33.661665', NULL, 71, NULL, '-33.661665', '0.166667', 0, '2132.161162', '-2132.161162'),
('a0f61e3e-275c-9564-1837-55105b8bd65d', '135', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12495.460447', NULL, '12537.111982', '41.651535', NULL, 135, NULL, '-41.651535', '0.166667', 0, '4537.111982', '-4537.111982'),
('a11503d5-3bf7-ed29-4ee8-55105b6ae87b', '58', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9670.940622', NULL, '9703.177091', '32.236469', NULL, 58, NULL, '-32.236469', '0.166667', 0, '1703.177091', '-1703.177091'),
('a148e7f0-fd8c-cbda-3545-55105b354f57', '81', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10440.210542', NULL, '10475.011244', '34.800702', NULL, 81, NULL, '-34.800702', '0.166667', 0, '2475.011244', '-2475.011244'),
('a217030e-c57f-5ec8-e748-55105b39aa78', '384', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28616.547865', NULL, '28711.936358', '95.388493', NULL, 384, NULL, '-95.388493', '0.166667', 0, '20711.936358', '-20711.936358'),
('a27dfb7d-b538-11c6-a10f-55105b2792a4', '582', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '55306.342001', NULL, '55490.696475', '184.354473', NULL, 582, NULL, '-184.354473', '0.166667', 0, '47490.696475', '-47490.696475'),
('a2ac7643-d14e-cbe7-9fde-55105bd84895', '76', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10267.933624', NULL, '10302.160069', '34.226445', NULL, 76, NULL, '-34.226445', '0.166667', 0, '2302.160069', '-2302.160069');
INSERT INTO `yo_amortizationschedule` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `bbalance`, `currency_id`, `ebalance`, `interest`, `paydate`, `pay_num`, `payment`, `principal`, `tax_amnt`, `received`, `cinterest`, `cprincipal`) VALUES
('a2ef7da1-8e35-6480-b29b-55105bb898e2', '145', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12918.279386', NULL, '12961.340317', '43.060931', NULL, 145, NULL, '-43.060931', '0.166667', 0, '4961.340317', '-4961.340317'),
('a31e0b46-644b-2ea2-af7d-55105b565b4b', '190', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15005.155907', NULL, '15055.173094', '50.017186', NULL, 190, NULL, '-50.017186', '0.166667', 0, '7055.173094', '-7055.173094'),
('a386b8ef-165f-a84a-8891-55105b169327', '264', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19195.009743', NULL, '19258.993109', '63.983366', NULL, 264, NULL, '-63.983366', '0.166667', 0, '11258.993109', '-11258.993109'),
('a39239e3-3594-ff14-a10f-55105b94efda', '337', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24473.209093', NULL, '24554.786456', '81.577364', NULL, 337, NULL, '-81.577364', '0.166667', 0, '16554.786456', '-16554.786456'),
('a40002aa-fe02-9351-bb32-55105b5a6fb8', '238', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17604.028953', NULL, '17662.709050', '58.680097', NULL, 238, NULL, '-58.680097', '0.166667', 0, '9662.709050', '-9662.709050'),
('a4d1f125-5eda-af74-6190-55105b0c9a92', '481', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '39518.969066', NULL, '39650.698963', '131.729897', NULL, 481, NULL, '-131.729897', '0.166667', 0, '31650.698963', '-31650.698963'),
('a549c109-938a-763c-13d7-55105b79168f', '614', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '61520.894710', NULL, '61725.964359', '205.069649', NULL, 614, NULL, '-205.069649', '0.166667', 0, '53725.964359', '-53725.964359'),
('a575dd57-1ad2-c3f2-ca00-55105b3ba9de', '294', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21210.239043', NULL, '21280.939840', '70.700797', NULL, 294, NULL, '-70.700797', '0.166667', 0, '13280.939840', '-13280.939840'),
('a5c1b7ce-63ca-1c55-41f2-55105b36ed1f', '405', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30687.909177', NULL, '30790.202207', '102.293031', NULL, 405, NULL, '-102.293031', '0.166667', 0, '22790.202207', '-22790.202207'),
('a68f3b2c-a711-783f-d2c3-55105bbc66f0', '462', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '37097.618434', NULL, '37221.277162', '123.658728', NULL, 462, NULL, '-123.658728', '0.166667', 0, '29221.277162', '-29221.277162'),
('a7400eb5-c0b7-2f0f-ef3e-55105b30ef90', '168', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13945.857171', NULL, '13992.343361', '46.486191', NULL, 168, NULL, '-46.486191', '0.166667', 0, '5992.343361', '-5992.343361'),
('a77d6c3f-4901-0fe4-3fee-55105b3436c4', '373', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27587.960289', NULL, '27679.920157', '91.959868', NULL, 373, NULL, '-91.959868', '0.166667', 0, '19679.920157', '-19679.920157'),
('a77ee805-025d-23ed-2bfb-55105babec18', '286', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20653.023354', NULL, '20721.866765', '68.843411', NULL, 286, NULL, '-68.843411', '0.166667', 0, '12721.866765', '-12721.866765'),
('a817e588-1e6f-cb65-91a7-55105b2211a7', '550', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '49719.554308', NULL, '49885.286155', '165.731848', NULL, 550, NULL, '-165.731848', '0.166667', 0, '41885.286155', '-41885.286155'),
('a87b0a80-b956-bcbd-f989-55105b61006a', '86', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10615.377947', NULL, '10650.762541', '35.384593', NULL, 86, NULL, '-35.384593', '0.166667', 0, '2650.762541', '-2650.762541'),
('a895024b-21e7-0527-349f-55105b0b3548', '48', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9354.408000', NULL, '9385.589360', '31.181360', NULL, 48, NULL, '-31.181360', '0.166667', 0, '1385.589360', '-1385.589360'),
('a8a98cff-38a7-01b5-6c91-55105b2bb809', '564', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '52090.748648', NULL, '52264.384477', '173.635829', NULL, 564, NULL, '-173.635829', '0.166667', 0, '44264.384477', '-44264.384477'),
('a8b5efc8-fec9-5d19-7845-55105bbec61e', '559', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '51231.184218', NULL, '51401.954832', '170.770614', NULL, 559, NULL, '-170.770614', '0.166667', 0, '43401.954832', '-43401.954832'),
('a93e5cee-16d9-3803-99b7-55105b55fabd', '433', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33684.805547', NULL, '33797.088232', '112.282685', NULL, 433, NULL, '-112.282685', '0.166667', 0, '25797.088232', '-25797.088232'),
('a94f2143-2538-a08b-38cc-55105b77778d', '364', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26773.948539', NULL, '26863.195034', '89.246495', NULL, 364, NULL, '-89.246495', '0.166667', 0, '18863.195034', '-18863.195034'),
('a9c037f0-cd52-4129-a738-55105bcb82fa', '140', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12705.111141', NULL, '12747.461512', '42.350370', NULL, 140, NULL, '-42.350370', '0.166667', 0, '4747.461512', '-4747.461512'),
('a9ee3e73-ad0b-bfeb-b296-55105b1f8747', '586', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '56047.455185', NULL, '56234.280035', '186.824851', NULL, 586, NULL, '-186.824851', '0.166667', 0, '48234.280035', '-48234.280035'),
('aa6d4991-34c8-46e2-8dff-55105b65125b', '241', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17780.656696', NULL, '17839.925551', '59.268856', NULL, 241, NULL, '-59.268856', '0.166667', 0, '9839.925551', '-9839.925551'),
('aa700687-4936-42f3-08db-55105b5b2cdf', '542', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '48413.368382', NULL, '48574.746276', '161.377895', NULL, 542, NULL, '-161.377895', '0.166667', 0, '40574.746276', '-40574.746276'),
('aa97719d-1e75-68fe-af19-55105b443252', '290', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20929.776929', NULL, '20999.542852', '69.765923', NULL, 290, NULL, '-69.765923', '0.166667', 0, '12999.542852', '-12999.542852'),
('aafc69c8-9128-0821-d5d6-55105b630812', '273', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19778.598057', NULL, '19844.526717', '65.928660', NULL, 273, NULL, '-65.928660', '0.166667', 0, '11844.526717', '-11844.526717'),
('ab5e6a1d-a7cb-9246-d38f-55105b5859b7', '204', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15720.772555', NULL, '15773.175130', '52.402575', NULL, 204, NULL, '-52.402575', '0.166667', 0, '7773.175130', '-7773.175130'),
('ac5145fb-d816-1588-a997-55105bdd7267', '467', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '37720.047795', NULL, '37845.781288', '125.733493', NULL, 467, NULL, '-125.733493', '0.166667', 0, '29845.781288', '-29845.781288'),
('acd0d1aa-f169-3061-f259-55105baacb9a', '436', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34022.777677', NULL, '34136.186936', '113.409259', NULL, 436, NULL, '-113.409259', '0.166667', 0, '26136.186936', '-26136.186936'),
('ad05a1ab-fde5-0db6-7f38-55105be2f141', '591', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '56987.827726', NULL, '57177.787151', '189.959426', NULL, 591, NULL, '-189.959426', '0.166667', 0, '49177.787151', '-49177.787151'),
('ad2b76e1-6594-9898-e239-55105b967fc8', '419', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32151.458027', NULL, '32258.629554', '107.171527', NULL, 419, NULL, '-107.171527', '0.166667', 0, '24258.629554', '-24258.629554'),
('ad4a29d4-df7c-687d-959a-55105ba857c6', '605', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '59705.656082', NULL, '59904.674936', '199.018854', NULL, 605, NULL, '-199.018854', '0.166667', 0, '51904.674936', '-51904.674936'),
('ad8f6ece-d559-8dc8-db62-55105bd84c20', '536', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '47456.297802', NULL, '47614.485461', '158.187659', NULL, 536, NULL, '-158.187659', '0.166667', 0, '39614.485461', '-39614.485461'),
('ad8f9feb-faff-e623-0e59-55105bcf7493', '313', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22594.625101', NULL, '22669.940518', '75.315417', NULL, 313, NULL, '-75.315417', '0.166667', 0, '14669.940518', '-14669.940518'),
('ae018173-45e6-0ebc-3853-55105be71f02', '494', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '41266.129617', NULL, '41403.683382', '137.553765', NULL, 494, NULL, '-137.553765', '0.166667', 0, '33403.683382', '-33403.683382'),
('af2a7935-55c0-922b-58d7-55105b645436', '32', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8869.363496', NULL, '8898.928041', '29.564545', NULL, 32, NULL, '-29.564545', '0.166667', 0, '898.928041', '-898.928041'),
('af5b04a9-2921-cb58-bddb-55105b1cbbf4', '391', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29290.981729', NULL, '29388.618335', '97.636606', NULL, 391, NULL, '-97.636606', '0.166667', 0, '21388.618335', '-21388.618335'),
('b07be5c8-56f9-3901-97d8-55105b67ad52', '28', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8752.084269', NULL, '8781.257883', '29.173614', NULL, 28, NULL, '-29.173614', '0.166667', 0, '781.257883', '-781.257883'),
('b09900d5-cd1f-280c-73d9-55105bbcf665', '37', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9018.174996', NULL, '9048.235579', '30.060583', NULL, 37, NULL, '-30.060583', '0.166667', 0, '1048.235579', '-1048.235579'),
('b0dbee87-1ab0-2de4-5c35-55105b3a9cc8', '510', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '43522.876606', NULL, '43667.952862', '145.076255', NULL, 510, NULL, '-145.076255', '0.166667', 0, '35667.952862', '-35667.952862'),
('b124d5fa-5c4e-7cfb-c69f-55105bb8b7c5', '19', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8493.844828', NULL, '8522.157645', '28.312816', NULL, 19, NULL, '-28.312816', '0.166667', 0, '522.157645', '-522.157645'),
('b1e33ac0-d282-9a20-de5a-55105bc26aaf', '619', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '62553.101433', NULL, '62761.611772', '208.510338', NULL, 619, NULL, '-208.510338', '0.166667', 0, '54761.611772', '-54761.611772'),
('b22c6462-2b6b-7a89-e1a3-55105ba3b391', '195', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15256.914645', NULL, '15307.771028', '50.856382', NULL, 195, NULL, '-50.856382', '0.166667', 0, '7307.771028', '-7307.771028'),
('b241f1f2-bfb8-9d9f-2c47-55105b31c8f6', '624', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '63602.626675', NULL, '63814.635431', '212.008756', NULL, 624, NULL, '-212.008756', '0.166667', 0, '55814.635431', '-55814.635431'),
('b24e47d7-594a-a644-d0ec-55105b0763e7', '518', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '44697.117746', NULL, '44846.108139', '148.990392', NULL, 518, NULL, '-148.990392', '0.166667', 0, '36846.108139', '-36846.108139'),
('b28f15c8-1b90-fafe-294c-55105ba934d1', '378', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28050.835191', NULL, '28144.337975', '93.502784', NULL, 378, NULL, '-93.502784', '0.166667', 0, '20144.337975', '-20144.337975'),
('b29a127c-7863-5f98-31b0-55105b7fda08', '176', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14322.114452', NULL, '14369.854834', '47.740382', NULL, 176, NULL, '-47.740382', '0.166667', 0, '6369.854834', '-6369.854834'),
('b2adb8dd-4536-8388-f4d3-55105b2f57dc', '246', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18078.983199', NULL, '18139.246476', '60.263277', NULL, 246, NULL, '-60.263277', '0.166667', 0, '10139.246476', '-10139.246476'),
('b2b502aa-b14b-21e7-f2ac-55105b0e742f', '506', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '42947.375408', NULL, '43090.533326', '143.157918', NULL, 506, NULL, '-143.157918', '0.166667', 0, '35090.533326', '-35090.533326'),
('b2e4e8fa-eff5-9733-2b57-55105ba99601', '424', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32690.899973', NULL, '32799.869639', '108.969667', NULL, 424, NULL, '-108.969667', '0.166667', 0, '24799.869639', '-24799.869639'),
('b315d9ae-2ffd-05cc-878d-55105b99fe72', '181', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14562.413019', NULL, '14610.954396', '48.541377', NULL, 181, NULL, '-48.541377', '0.166667', 0, '6610.954396', '-6610.954396'),
('b31db4d3-4f1a-4c59-241a-55105b0798f4', '227', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16971.273194', NULL, '17027.844105', '56.570911', NULL, 227, NULL, '-56.570911', '0.166667', 0, '9027.844105', '-9027.844105'),
('b36d04fe-89e6-f72f-7f76-55105bc7dd5b', '478', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '39126.399410', NULL, '39256.820741', '130.421331', NULL, 478, NULL, '-130.421331', '0.166667', 0, '31256.820741', '-31256.820741'),
('b3dd386e-c31c-3e6f-3a8e-55105b7373dd', '14', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8353.685451', NULL, '8381.531069', '27.845618', NULL, 14, NULL, '-27.845618', '0.166667', 0, '381.531069', '-381.531069'),
('b411caa7-43b6-452b-d7e8-55105b3dd9c3', '502', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '42379.484038', NULL, '42520.748985', '141.264947', NULL, 502, NULL, '-141.264947', '0.166667', 0, '34520.748985', '-34520.748985'),
('b4160370-b934-cba2-ae27-55105bb737df', '255', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18628.640816', NULL, '18690.736285', '62.095469', NULL, 255, NULL, '-62.095469', '0.166667', 0, '10690.736285', '-10690.736285'),
('b48562ca-e707-11c4-e4ae-55105bc81d7d', '541', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '48252.526626', NULL, '48413.368382', '160.841755', NULL, 541, NULL, '-160.841755', '0.166667', 0, '40413.368382', '-40413.368382'),
('b4d39cc4-a8de-d744-8eb3-55105be947ad', '350', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25555.186343', NULL, '25640.370297', '85.183954', NULL, 350, NULL, '-85.183954', '0.166667', 0, '17640.370297', '-17640.370297'),
('b552f96b-f33a-46d2-bf4b-55105b28af53', '162', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13670.165351', NULL, '13715.732569', '45.567218', NULL, 162, NULL, '-45.567218', '0.166667', 0, '5715.732569', '-5715.732569'),
('b5825d8b-479a-2ff8-de3b-55105b27b9e1', '1', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8000.000000', NULL, '8026.666667', '26.666667', NULL, 1, NULL, '-26.666667', '0.166667', 0, '26.666667', '-26.666667'),
('b5fcc5f6-3e87-fb53-bcb4-55105b88eda6', '429', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33239.392756', NULL, '33350.190732', '110.797976', NULL, 429, NULL, '-110.797976', '0.166667', 0, '25350.190732', '-25350.190732'),
('b6fb1e95-9bc6-4737-5da8-55105ba0f7c8', '410', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31202.795482', NULL, '31306.804800', '104.009318', NULL, 410, NULL, '-104.009318', '0.166667', 0, '23306.804800', '-23306.804800'),
('b6fc6eb1-d0c7-7661-600f-55105b4349ed', '42', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9169.483278', NULL, '9200.048222', '30.564944', NULL, 42, NULL, '-30.564944', '0.166667', 0, '1200.048222', '-1200.048222'),
('b70c44e3-2592-b845-99cc-55105b641c7d', '573', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '53674.470280', NULL, '53853.385181', '178.914901', NULL, 573, NULL, '-178.914901', '0.166667', 0, '45853.385181', '-45853.385181'),
('b7c0f280-8c93-22b5-f407-55105b70e9a6', '9', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8215.838884', NULL, '8243.225014', '27.386130', NULL, 9, NULL, '-27.386130', '0.166667', 0, '243.225014', '-243.225014'),
('b8fcae2d-d187-1cdc-53e2-55105b2b042c', '269', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19517.066472', NULL, '19582.123361', '65.056888', NULL, 269, NULL, '-65.056888', '0.166667', 0, '11582.123361', '-11582.123361'),
('b955a32e-8e18-9605-1094-55105b7644af', '4', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8080.266963', NULL, '8107.201186', '26.934223', NULL, 4, NULL, '-26.934223', '0.166667', 0, '107.201186', '-107.201186'),
('b9a9f3e4-f060-2b04-e9ff-55105bd6ef79', '578', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '54575.028527', NULL, '54756.945289', '181.916762', NULL, 578, NULL, '-181.916762', '0.166667', 0, '46756.945289', '-46756.945289'),
('b9c0e531-f891-3c94-d682-55105bb8af4e', '121', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11926.661459', NULL, '11966.416998', '39.755538', NULL, 121, NULL, '-39.755538', '0.166667', 0, '3966.416998', '-3966.416998'),
('ba6e8f0e-365a-9a8d-99e4-55105b786937', '299', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21566.107590', NULL, '21637.994615', '71.887025', NULL, 299, NULL, '-71.887025', '0.166667', 0, '13637.994615', '-13637.994615'),
('ba8eab06-e433-19de-9a05-55105b48e8ee', '116', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11729.856187', NULL, '11768.955708', '39.099521', NULL, 116, NULL, '-39.099521', '0.166667', 0, '3768.955708', '-3768.955708'),
('bb272be8-0824-5edd-6348-55105b542552', '318', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22973.721082', NULL, '23050.300152', '76.579070', NULL, 318, NULL, '-76.579070', '0.166667', 0, '15050.300152', '-15050.300152'),
('bc63560c-4c2f-48c0-8f8f-55105b06f9e5', '596', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '57943.977977', NULL, '58137.124570', '193.146593', NULL, 596, NULL, '-193.146593', '0.166667', 0, '50137.124570', '-50137.124570'),
('bcc5c060-7305-20a9-fdad-55105bf8d80c', '218', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16470.517950', NULL, '16525.419677', '54.901727', NULL, 218, NULL, '-54.901727', '0.166667', 0, '8525.419677', '-8525.419677'),
('bd1ff3c4-9090-c5cd-b734-55105be91024', '186', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14806.743351', NULL, '14856.099162', '49.355811', NULL, 186, NULL, '-49.355811', '0.166667', 0, '6856.099162', '-6856.099162'),
('bd7b9f0d-ff06-c156-fad1-55105b3c2fe9', '514', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '44106.089606', NULL, '44253.109905', '147.020299', NULL, 514, NULL, '-147.020299', '0.166667', 0, '36253.109905', '-36253.109905'),
('bd85aa6b-f841-71d8-47b6-55105bd5bf28', '106', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11345.934676', NULL, '11383.754458', '37.819782', NULL, 106, NULL, '-37.819782', '0.166667', 0, '3383.754458', '-3383.754458'),
('bd874020-1287-ff44-117d-55105b624536', '396', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29782.430178', NULL, '29881.704945', '99.274767', NULL, 396, NULL, '-99.274767', '0.166667', 0, '21881.704945', '-21881.704945'),
('bdf326f7-6dc5-5d7a-2226-55105b70583e', '111', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11536.298456', NULL, '11574.752784', '38.454328', NULL, 111, NULL, '-38.454328', '0.166667', 0, '3574.752784', '-3574.752784'),
('be4f260f-d61d-e008-a6d4-55105b1d279d', '355', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25983.955061', NULL, '26070.568244', '86.613184', NULL, 355, NULL, '-86.613184', '0.166667', 0, '18070.568244', '-18070.568244'),
('bf08eedb-77ae-0a24-3f67-55105bbda077', '527', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '46056.049881', NULL, '46209.570047', '153.520166', NULL, 527, NULL, '-153.520166', '0.166667', 0, '38209.570047', '-38209.570047'),
('bf4f12eb-88ea-7485-3298-55105be0c17d', '415', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31726.320627', NULL, '31832.075029', '105.754402', NULL, 415, NULL, '-105.754402', '0.166667', 0, '23832.075029', '-23832.075029'),
('c0381e3a-f232-adaa-9b6f-55105b1dc3b8', '126', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12126.768760', NULL, '12167.191322', '40.422563', NULL, 126, NULL, '-40.422563', '0.166667', 0, '4167.191322', '-4167.191322'),
('c098f246-9de5-4eec-ae67-55105b69a6a6', '369', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27223.165831', NULL, '27313.909717', '90.743886', NULL, 369, NULL, '-90.743886', '0.166667', 0, '19313.909717', '-19313.909717'),
('c0a0da5e-7d1c-3f5c-cd02-55105b0768bf', '200', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15512.897429', NULL, '15564.607087', '51.709658', NULL, 200, NULL, '-51.709658', '0.166667', 0, '7564.607087', '-7564.607087'),
('c0a30351-bcbb-ff69-0746-55105bfd7de3', '232', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17256.019741', NULL, '17313.539807', '57.520066', NULL, 232, NULL, '-57.520066', '0.166667', 0, '9313.539807', '-9313.539807'),
('c21c1156-1154-7a07-682b-55105b7597e1', '171', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14085.781121', NULL, '14132.733725', '46.952604', NULL, 171, NULL, '-46.952604', '0.166667', 0, '6132.733725', '-6132.733725'),
('c2374783-8872-0dc0-c0af-55105b58626e', '569', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '52964.734978', NULL, '53141.284095', '176.549117', NULL, 569, NULL, '-176.549117', '0.166667', 0, '45141.284095', '-45141.284095'),
('c24d4bda-26f7-98c8-1b3a-55105b73e5ff', '24', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8636.355821', NULL, '8665.143673', '28.787853', NULL, 24, NULL, '-28.787853', '0.166667', 0, '665.143673', '-665.143673'),
('c2c94b59-b36a-cccb-d60a-55105b607731', '490', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '40720.469291', NULL, '40856.204188', '135.734898', NULL, 490, NULL, '-135.734898', '0.166667', 0, '32856.204188', '-32856.204188'),
('c306f8f6-028b-442a-0e4a-55105b2b6111', '237', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17545.543807', NULL, '17604.028953', '58.485146', NULL, 237, NULL, '-58.485146', '0.166667', 0, '9604.028953', '-9604.028953'),
('c37aee55-923e-cc7b-f41e-55105bf470a1', '260', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18941.194923', NULL, '19004.332239', '63.137316', NULL, 260, NULL, '-63.137316', '0.166667', 0, '11004.332239', '-11004.332239'),
('c4bdb044-5c84-adc9-eb4b-55105b3a0ad7', '251', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18382.315069', NULL, '18443.589452', '61.274384', NULL, 251, NULL, '-61.274384', '0.166667', 0, '10443.589452', '-10443.589452'),
('c53a3f20-4f35-7e60-2dd2-55105b20417a', '449', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '35526.947861', NULL, '35645.371021', '118.423160', NULL, 449, NULL, '-118.423160', '0.166667', 0, '27645.371021', '-27645.371021'),
('c59da975-781d-38a8-28c1-55105b8df026', '91', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10793.484338', NULL, '10829.462619', '35.978281', NULL, 91, NULL, '-35.978281', '0.166667', 0, '2829.462619', '-2829.462619'),
('c5ad248b-754d-c3f8-0f83-55105b434866', '62', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9800.532661', NULL, '9833.201103', '32.668442', NULL, 62, NULL, '-32.668442', '0.166667', 0, '1833.201103', '-1833.201103'),
('c5d8b7f0-d53f-69ee-222d-55105bc3b525', '67', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9964.967456', NULL, '9998.184014', '33.216558', NULL, 67, NULL, '-33.216558', '0.166667', 0, '1998.184014', '-1998.184014'),
('c61a297e-2861-6b06-ace5-55105b5423d3', '523', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '45447.052637', NULL, '45598.542813', '151.490175', NULL, 523, NULL, '-151.490175', '0.166667', 0, '37598.542813', '-37598.542813'),
('c66013bd-271c-658e-42e3-55105b28b716', '323', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23359.177592', NULL, '23437.041517', '77.863925', NULL, 323, NULL, '-77.863925', '0.166667', 0, '15437.041517', '-15437.041517'),
('c6a40edd-d1fa-6a41-bd1e-55105b46f5e5', '555', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '50553.756386', NULL, '50722.268908', '168.512521', NULL, 555, NULL, '-168.512521', '0.166667', 0, '42722.268908', '-42722.268908'),
('c6c45fe2-0c6c-4bc3-0a85-55105b830b99', '304', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21927.946951', NULL, '22001.040107', '73.093157', NULL, 304, NULL, '-73.093157', '0.166667', 0, '14001.040107', '-14001.040107'),
('c7e4cf48-15e1-c3c7-1514-55105b0ec208', '453', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36003.014230', NULL, '36123.024278', '120.010047', NULL, 453, NULL, '-120.010047', '0.166667', 0, '28123.024278', '-28123.024278'),
('c8609d66-1045-8c14-931a-55105bb4c215', '101', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11158.712143', NULL, '11195.907850', '37.195707', NULL, 101, NULL, '-37.195707', '0.166667', 0, '3195.907850', '-3195.907850'),
('c8717cde-1ce2-9600-12ec-55105bfc0489', '209', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15984.538015', NULL, '16037.819809', '53.281793', NULL, 209, NULL, '-53.281793', '0.166667', 0, '8037.819809', '-8037.819809'),
('c8e10c00-dcf7-64ca-c0e7-55105bbbe4e4', '73', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10165.935033', NULL, '10199.821483', '33.886450', NULL, 73, NULL, '-33.886450', '0.166667', 0, '2199.821483', '-2199.821483'),
('c916ac49-81b0-ed2c-309d-55105bc2ee57', '328', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23751.101349', NULL, '23830.271687', '79.170338', NULL, 328, NULL, '-79.170338', '0.166667', 0, '15830.271687', '-15830.271687'),
('c9260d5f-6a19-2eef-8a19-55105beb346e', '442', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34708.928959', NULL, '34824.625389', '115.696430', NULL, 442, NULL, '-115.696430', '0.166667', 0, '26824.625389', '-26824.625389'),
('c949bc7a-d2d8-0e94-81f3-55105bdbcce6', '610', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '60707.406462', NULL, '60909.764484', '202.358022', NULL, 610, NULL, '-202.358022', '0.166667', 0, '52909.764484', '-52909.764484'),
('c9c7d52e-32c9-64bc-d5ad-55105b6751ab', '532', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '46828.785138', NULL, '46984.881088', '156.095950', NULL, 532, NULL, '-156.095950', '0.166667', 0, '38984.881088', '-38984.881088'),
('ca1178e2-b6ca-5a43-9c90-55105b3e4bb8', '96', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10974.579024', NULL, '11011.160954', '36.581930', NULL, 96, NULL, '-36.581930', '0.166667', 0, '3011.160954', '-3011.160954'),
('ca4106dd-7630-1e4e-dd17-55105b0e43ad', '472', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '38352.920368', NULL, '38480.763436', '127.843068', NULL, 472, NULL, '-127.843068', '0.166667', 0, '30480.763436', '-30480.763436'),
('ca79966e-f44e-b3d9-3904-55105b6794eb', '52', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9479.758454', NULL, '9511.357649', '31.599195', NULL, 52, NULL, '-31.599195', '0.166667', 0, '1511.357649', '-1511.357649'),
('ca8847ec-a3f6-e1b4-aabb-55105b30d657', '441', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34593.616902', NULL, '34708.928959', '115.312056', NULL, 441, NULL, '-115.312056', '0.166667', 0, '26708.928959', '-26708.928959'),
('cab2a6c7-2ca6-55c2-3800-55105bac2134', '383', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28521.476277', NULL, '28616.547865', '95.071588', NULL, 383, NULL, '-95.071588', '0.166667', 0, '20616.547865', '-20616.547865'),
('cabc82cb-5ccd-5b8b-bf0b-55105b21002e', '214', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16252.728972', NULL, '16306.904735', '54.175763', NULL, 214, NULL, '-54.175763', '0.166667', 0, '8306.904735', '-8306.904735'),
('cad9cfbf-29fb-823f-c240-55105b5616a6', '401', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30282.124222', NULL, '30383.064636', '100.940414', NULL, 401, NULL, '-100.940414', '0.166667', 0, '22383.064636', '-22383.064636'),
('cb86d1ab-f70e-9854-829d-55105b9e2bf6', '346', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25217.271170', NULL, '25301.328741', '84.057571', NULL, 346, NULL, '-84.057571', '0.166667', 0, '17301.328741', '-17301.328741'),
('cba1d47f-98c7-d208-0531-55105b469b6a', '333', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24149.600861', NULL, '24230.099530', '80.498670', NULL, 333, NULL, '-80.498670', '0.166667', 0, '16230.099530', '-16230.099530'),
('cc031081-5a35-3213-e2dd-55105b0434b0', '458', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '36607.078159', NULL, '36729.101753', '122.023594', NULL, 458, NULL, '-122.023594', '0.166667', 0, '28729.101753', '-28729.101753'),
('cc4a8cdd-d090-0977-ee53-55105b1979c3', '282', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20379.929280', NULL, '20447.862378', '67.933098', NULL, 282, NULL, '-67.933098', '0.166667', 0, '12447.862378', '-12447.862378'),
('ccf2db6b-f8d6-eefe-de0d-55105bb39e26', '47', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9323.330232', NULL, '9354.408000', '31.077767', NULL, 47, NULL, '-31.077767', '0.166667', 0, '1354.408000', '-1354.408000'),
('ce761dda-66c8-5263-e06f-55105b547e8b', '360', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26419.917724', NULL, '26507.984117', '88.066392', NULL, 360, NULL, '-88.066392', '0.166667', 0, '18507.984117', '-18507.984117'),
('ce96f079-1039-8a9a-74ef-55105bac05b6', '154', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13311.035471', NULL, '13355.405589', '44.370118', NULL, 154, NULL, '-44.370118', '0.166667', 0, '5355.405589', '-5355.405589'),
('cec4275a-b5ad-7470-4bdf-55105b6be326', '477', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '38996.411372', NULL, '39126.399410', '129.988038', NULL, 477, NULL, '-129.988038', '0.166667', 0, '31126.399410', '-31126.399410'),
('ced7075e-3aac-ba6f-dd0a-55105b89cf6c', '132', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12371.334268', NULL, '12412.572049', '41.237781', NULL, 132, NULL, '-41.237781', '0.166667', 0, '4412.572049', '-4412.572049'),
('cf12029b-9e45-19ed-a918-55105bacdc9f', '72', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10132.161162', NULL, '10165.935033', '33.773871', NULL, 72, NULL, '-33.773871', '0.166667', 0, '2165.935033', '-2165.935033'),
('cf198d2a-62af-8ba5-b55f-55105b5736af', '601', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '58916.170660', NULL, '59112.557895', '196.387236', NULL, 601, NULL, '-196.387236', '0.166667', 0, '51112.557895', '-51112.557895'),
('cfd652fe-fdde-7fb0-be6a-55105b099f61', '131', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12330.233490', NULL, '12371.334268', '41.100778', NULL, 131, NULL, '-41.100778', '0.166667', 0, '4371.334268', '-4371.334268'),
('d0848883-1545-acbb-4120-55105be079a4', '191', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15055.173094', NULL, '15105.357004', '50.183910', NULL, 191, NULL, '-50.183910', '0.166667', 0, '7105.357004', '-7105.357004'),
('d111ef8a-ed66-23c0-3dc0-55105bd27b75', '309', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22295.857307', NULL, '22370.176831', '74.319524', NULL, 309, NULL, '-74.319524', '0.166667', 0, '14370.176831', '-14370.176831'),
('d1557d8a-8bc3-a5e1-bb14-55105bf4c972', '57', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9638.811252', NULL, '9670.940622', '32.129371', NULL, 57, NULL, '-32.129371', '0.166667', 0, '1670.940622', '-1670.940622'),
('d21f1fdd-b4aa-4a84-ce9c-55105b888fe0', '167', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13899.525419', NULL, '13945.857171', '46.331751', NULL, 167, NULL, '-46.331751', '0.166667', 0, '5945.857171', '-5945.857171'),
('d244a3b5-01a0-a461-4ca6-55105bac690b', '223', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16746.862751', NULL, '16802.685626', '55.822876', NULL, 223, NULL, '-55.822876', '0.166667', 0, '8802.685626', '-8802.685626'),
('d27f21ac-0b0a-5202-4e88-55105b83c526', '149', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13091.386245', NULL, '13135.024199', '43.637954', NULL, 149, NULL, '-43.637954', '0.166667', 0, '5135.024199', '-5135.024199'),
('d28c04ce-7225-2b55-ce29-55105b72945f', '224', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16802.685626', NULL, '16858.694578', '56.008952', NULL, 224, NULL, '-56.008952', '0.166667', 0, '8858.694578', '-8858.694578'),
('d37a2e7c-14f1-9f4c-5872-55105b0fdd29', '82', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10475.011244', NULL, '10509.927948', '34.916704', NULL, 82, NULL, '-34.916704', '0.166667', 0, '2509.927948', '-2509.927948'),
('d4203916-6422-72ac-39cf-55105b30c53f', '486', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '40182.024209', NULL, '40315.964289', '133.940081', NULL, 486, NULL, '-133.940081', '0.166667', 0, '32315.964289', '-32315.964289'),
('d420af96-30e9-bd77-eb14-55105bdb071e', '77', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10302.160069', NULL, '10336.500603', '34.340534', NULL, 77, NULL, '-34.340534', '0.166667', 0, '2336.500603', '-2336.500603'),
('d4f73eaa-5de1-2010-8865-55105b915524', '146', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12961.340317', NULL, '13004.544785', '43.204468', NULL, 146, NULL, '-43.204468', '0.166667', 0, '5004.544785', '-5004.544785'),
('d5edffde-10c1-54d6-e057-55105b7428fb', '87', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10650.762541', NULL, '10686.265082', '35.502542', NULL, 87, NULL, '-35.502542', '0.166667', 0, '2686.265082', '-2686.265082'),
('d6617c76-8d6f-4d2a-0fa7-55105b26c6c7', '546', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '49062.114696', NULL, '49225.655079', '163.540382', NULL, 546, NULL, '-163.540382', '0.166667', 0, '41225.655079', '-41225.655079'),
('d66cbba5-c602-52e1-25f3-55105bf1818d', '387', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28903.668288', NULL, '29000.013849', '96.345561', NULL, 387, NULL, '-96.345561', '0.166667', 0, '21000.013849', '-21000.013849'),
('d68bacd0-bcaa-5637-637c-55105b2d68ce', '406', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '30790.202207', NULL, '30892.836214', '102.634007', NULL, 406, NULL, '-102.634007', '0.166667', 0, '22892.836214', '-22892.836214'),
('d70c0af2-eb74-8c46-ad04-55105bdf0850', '136', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12537.111982', NULL, '12578.902355', '41.790373', NULL, 136, NULL, '-41.790373', '0.166667', 0, '4578.902355', '-4578.902355'),
('d8ba0fde-f489-9cc2-a9ac-55105bf0d06e', '78', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '10336.500603', NULL, '10370.955605', '34.455002', NULL, 78, NULL, '-34.455002', '0.166667', 0, '2370.955605', '-2370.955605'),
('d90661a9-4105-3973-9708-55105ba3a82b', '560', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '51401.954832', NULL, '51573.294681', '171.339849', NULL, 560, NULL, '-171.339849', '0.166667', 0, '43573.294681', '-43573.294681'),
('d90cf99e-199c-fdd2-4d88-55105bb8df04', '615', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '61725.964359', NULL, '61931.717573', '205.753215', NULL, 615, NULL, '-205.753215', '0.166667', 0, '53931.717573', '-53931.717573'),
('d92d4adb-5dbc-cd8a-49fe-55105b157617', '482', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '39650.698963', NULL, '39782.867960', '132.168997', NULL, 482, NULL, '-132.168997', '0.166667', 0, '31782.867960', '-31782.867960'),
('d93481ac-dc3d-a76e-da70-55105bc1d8d1', '551', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '49885.286155', NULL, '50051.570443', '166.284287', NULL, 551, NULL, '-166.284287', '0.166667', 0, '42051.570443', '-42051.570443'),
('d9a983ed-0230-01b2-bc48-55105b3a4eff', '287', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20721.866765', NULL, '20790.939655', '69.072889', NULL, 287, NULL, '-69.072889', '0.166667', 0, '12790.939655', '-12790.939655'),
('d9dd712c-ef83-9a47-cf85-55105ba2365e', '499', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '41958.498879', NULL, '42098.360542', '139.861663', NULL, 499, NULL, '-139.861663', '0.166667', 0, '34098.360542', '-34098.360542'),
('da8154b4-1d2a-0583-eccb-55105b919788', '374', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '27679.920157', NULL, '27772.186558', '92.266401', NULL, 374, NULL, '-92.266401', '0.166667', 0, '19772.186558', '-19772.186558'),
('da9da628-01b4-cd4e-8ec3-55105b82c8c0', '342', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24883.824236', NULL, '24966.770316', '82.946081', NULL, 342, NULL, '-82.946081', '0.166667', 0, '16966.770316', '-16966.770316'),
('dc056e54-20d9-a2cd-29f2-55105bf09d3e', '587', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '56234.280035', NULL, '56421.727635', '187.447600', NULL, 587, NULL, '-187.447600', '0.166667', 0, '48421.727635', '-48421.727635'),
('dc0ca874-d47a-2ce9-44e9-55105ba952de', '141', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12747.461512', NULL, '12789.953050', '42.491538', NULL, 141, NULL, '-42.491538', '0.166667', 0, '4789.953050', '-4789.953050'),
('dc80846a-3190-659a-3596-55105bc4f5af', '338', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '24554.786456', NULL, '24636.635745', '81.849288', NULL, 338, NULL, '-81.849288', '0.166667', 0, '16636.635745', '-16636.635745'),
('dca70fb7-4105-2700-f60c-55105bf1cb8c', '53', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9511.357649', NULL, '9543.062174', '31.704525', NULL, 53, NULL, '-31.704525', '0.166667', 0, '1543.062174', '-1543.062174'),
('dcdfde3d-95b2-e929-4983-55105bfe120e', '437', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '34136.186936', NULL, '34249.974226', '113.787290', NULL, 437, NULL, '-113.787290', '0.166667', 0, '26249.974226', '-26249.974226'),
('dd530234-fd9c-4975-faf9-55105bd1da9c', '547', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '49225.655079', NULL, '49389.740596', '164.085517', NULL, 547, NULL, '-164.085517', '0.166667', 0, '41389.740596', '-41389.740596'),
('dd561804-c10a-49b8-c1a3-55105b922c5b', '365', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26863.195034', NULL, '26952.739018', '89.543983', NULL, 365, NULL, '-89.543983', '0.166667', 0, '18952.739018', '-18952.739018'),
('dd719994-a187-84c5-6034-55105b511583', '242', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17839.925551', NULL, '17899.391970', '59.466419', NULL, 242, NULL, '-59.466419', '0.166667', 0, '9899.391970', '-9899.391970'),
('dd98db54-6397-859f-2573-55105bfbdf73', '606', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '59904.674936', NULL, '60104.357186', '199.682250', NULL, 606, NULL, '-199.682250', '0.166667', 0, '52104.357186', '-52104.357186'),
('ddb6a0d1-ea68-e2ec-0df9-55105bf953fd', '583', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '55490.696475', NULL, '55675.665463', '184.968988', NULL, 583, NULL, '-184.968988', '0.166667', 0, '47675.665463', '-47675.665463'),
('de0d9740-f630-423f-6ad6-55105b5c8749', '278', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20110.446318', NULL, '20177.481139', '67.034821', NULL, 278, NULL, '-67.034821', '0.166667', 0, '12177.481139', '-12177.481139'),
('de19cdef-937e-6260-22d4-55105b9d78b6', '33', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8898.928041', NULL, '8928.591134', '29.663093', NULL, 33, NULL, '-29.663093', '0.166667', 0, '928.591134', '-928.591134'),
('de9cd489-f9a0-6bb4-548b-55105b9290f4', '468', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '37845.781288', NULL, '37971.933892', '126.152604', NULL, 468, NULL, '-126.152604', '0.166667', 0, '29971.933892', '-29971.933892'),
('deb144aa-3a08-86a3-b8d8-55105bcd09bb', '463', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '37221.277162', NULL, '37345.348086', '124.070924', NULL, 463, NULL, '-124.070924', '0.166667', 0, '29345.348086', '-29345.348086'),
('def8078d-0f1d-73c3-03c8-55105b4d6e48', '291', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '20999.542852', NULL, '21069.541329', '69.998476', NULL, 291, NULL, '-69.998476', '0.166667', 0, '13069.541329', '-13069.541329'),
('df551fd6-548f-b857-693e-55105b0f7346', '38', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9048.235579', NULL, '9078.396365', '30.160785', NULL, 38, NULL, '-30.160785', '0.166667', 0, '1078.396365', '-1078.396365'),
('df60d201-4f73-96fc-fb89-55105b884efe', '314', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '22669.940518', NULL, '22745.506986', '75.566468', NULL, 314, NULL, '-75.566468', '0.166667', 0, '14745.506986', '-14745.506986'),
('dfda730b-bb5c-1e5c-9335-55105b37e160', '537', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '47614.485461', NULL, '47773.200413', '158.714952', NULL, 537, NULL, '-158.714952', '0.166667', 0, '39773.200413', '-39773.200413'),
('e022f266-ed63-6f79-87ed-55105b345b40', '177', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14369.854834', NULL, '14417.754350', '47.899516', NULL, 177, NULL, '-47.899516', '0.166667', 0, '6417.754350', '-6417.754350'),
('e04d6c23-8bd4-fb0e-2e27-55105b7bbcd3', '592', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '57177.787151', NULL, '57368.379775', '190.592624', NULL, 592, NULL, '-190.592624', '0.166667', 0, '49368.379775', '-49368.379775'),
('e09196ab-35ca-6073-a436-55105bb591db', '15', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8381.531069', NULL, '8409.469506', '27.938437', NULL, 15, NULL, '-27.938437', '0.166667', 0, '409.469506', '-409.469506'),
('e0937c68-d447-9976-b4d6-55105bfad176', '265', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19258.993109', NULL, '19323.189753', '64.196644', NULL, 265, NULL, '-64.196644', '0.166667', 0, '11323.189753', '-11323.189753'),
('e0dc544e-36ad-553b-9fe6-55105b5c0964', '295', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21280.939840', NULL, '21351.876306', '70.936466', NULL, 295, NULL, '-70.936466', '0.166667', 0, '13351.876306', '-13351.876306'),
('e1701ace-ea5c-1f20-9ae9-55105b43cd06', '392', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29388.618335', NULL, '29486.580396', '97.962061', NULL, 392, NULL, '-97.962061', '0.166667', 0, '21486.580396', '-21486.580396'),
('e172f452-388a-bc69-8156-55105b9993d5', '379', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '28144.337975', NULL, '28238.152435', '93.814460', NULL, 379, NULL, '-93.814460', '0.166667', 0, '20238.152435', '-20238.152435'),
('e17e6d48-fbca-46c8-81af-55105b79413a', '420', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32258.629554', NULL, '32366.158319', '107.528765', NULL, 420, NULL, '-107.528765', '0.166667', 0, '24366.158319', '-24366.158319'),
('e1825f8e-be15-20b4-fb0d-55105b611307', '445', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '35057.176498', NULL, '35174.033753', '116.857255', NULL, 445, NULL, '-116.857255', '0.166667', 0, '27174.033753', '-27174.033753'),
('e2661812-0a0d-c287-d21f-55105bc05b21', '495', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '41403.683382', NULL, '41541.695660', '138.012278', NULL, 495, NULL, '-138.012278', '0.166667', 0, '33541.695660', '-33541.695660'),
('e2dd9513-d88a-b120-975d-55105b29f7ae', '256', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18690.736285', NULL, '18753.038740', '62.302454', NULL, 256, NULL, '-62.302454', '0.166667', 0, '10753.038740', '-10753.038740'),
('e2e53f7c-862f-c95e-cfdd-55105b954762', '20', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8522.157645', NULL, '8550.564837', '28.407192', NULL, 20, NULL, '-28.407192', '0.166667', 0, '550.564837', '-550.564837'),
('e43a60a2-a6f3-1d78-84a7-55105b63e75d', '182', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14610.954396', NULL, '14659.657577', '48.703181', NULL, 182, NULL, '-48.703181', '0.166667', 0, '6659.657577', '-6659.657577'),
('e4ffccef-0cb4-e268-dab5-55105b008064', '205', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15773.175130', NULL, '15825.752380', '52.577250', NULL, 205, NULL, '-52.577250', '0.166667', 0, '7825.752380', '-7825.752380'),
('e539ef6c-1d33-6687-5ce5-55105b804919', '430', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '33350.190732', NULL, '33461.358034', '111.167302', NULL, 430, NULL, '-111.167302', '0.166667', 0, '25461.358034', '-25461.358034'),
('e592b61a-5258-30c5-ed25-55105be2f76b', '519', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '44846.108139', NULL, '44995.595166', '149.487027', NULL, 519, NULL, '-149.487027', '0.166667', 0, '36995.595166', '-36995.595166'),
('e5deadcd-979d-dc95-4bca-55105bd454bc', '196', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15307.771028', NULL, '15358.796931', '51.025903', NULL, 196, NULL, '-51.025903', '0.166667', 0, '7358.796931', '-7358.796931'),
('e66423d1-b293-9add-ee8f-55105bb9758a', '425', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '32799.869639', NULL, '32909.202538', '109.332899', NULL, 425, NULL, '-109.332899', '0.166667', 0, '24909.202538', '-24909.202538'),
('e6949503-7aa9-2a95-786a-55105b3efdfb', '163', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '13715.732569', NULL, '13761.451678', '45.719109', NULL, 163, NULL, '-45.719109', '0.166667', 0, '5761.451678', '-5761.451678'),
('e6bc38ce-caef-36b8-f5ea-55105b3df32f', '625', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '63814.635431', NULL, '64027.350882', '212.715451', NULL, 625, NULL, '-212.715451', '0.166667', 0, '56027.350882', '-56027.350882'),
('e6f4b88b-2149-18f5-eff4-55105b33cf65', '507', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '43090.533326', NULL, '43234.168437', '143.635111', NULL, 507, NULL, '-143.635111', '0.166667', 0, '35234.168437', '-35234.168437'),
('e7aee533-6ed3-abe3-405d-55105bf5b41e', '574', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '53853.385181', NULL, '54032.896465', '179.511284', NULL, 574, NULL, '-179.511284', '0.166667', 0, '46032.896465', '-46032.896465'),
('e7c06a32-7726-7597-07af-55105b80c979', '411', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '31306.804800', NULL, '31411.160816', '104.356016', NULL, 411, NULL, '-104.356016', '0.166667', 0, '23411.160816', '-23411.160816'),
('e7fc4755-f895-1295-dea3-55105ba7dc75', '29', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8781.257883', NULL, '8810.528743', '29.270860', NULL, 29, NULL, '-29.270860', '0.166667', 0, '810.528743', '-810.528743'),
('e85ce019-6f09-ed8f-c3ac-55105b05ee61', '5', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8107.201186', NULL, '8134.225190', '27.024004', NULL, 5, NULL, '-27.024004', '0.166667', 0, '134.225190', '-134.225190'),
('e883dcbc-f9d1-da3f-ebc8-55105b254c8c', '247', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '18139.246476', NULL, '18199.710631', '60.464155', NULL, 247, NULL, '-60.464155', '0.166667', 0, '10199.710631', '-10199.710631'),
('e8be945b-916a-282a-293d-55105bf542fc', '274', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19844.526717', NULL, '19910.675140', '66.148422', NULL, 274, NULL, '-66.148422', '0.166667', 0, '11910.675140', '-11910.675140'),
('e8d02b77-dbb2-00a4-e3b4-55105bda0364', '503', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '42520.748985', NULL, '42662.484815', '141.735830', NULL, 503, NULL, '-141.735830', '0.166667', 0, '34662.484815', '-34662.484815'),
('e8f8de9c-23dd-8690-ef25-55105b0f5bee', '10', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8243.225014', NULL, '8270.702430', '27.477417', NULL, 10, NULL, '-27.477417', '0.166667', 0, '270.702430', '-270.702430');
INSERT INTO `yo_amortizationschedule` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `bbalance`, `currency_id`, `ebalance`, `interest`, `paydate`, `pay_num`, `payment`, `principal`, `tax_amnt`, `received`, `cinterest`, `cprincipal`) VALUES
('e9a9dfaf-0877-30f6-1914-55105b47b8cb', '620', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '62761.611772', NULL, '62970.817144', '209.205373', NULL, 620, NULL, '-209.205373', '0.166667', 0, '54970.817144', '-54970.817144'),
('e9b10e9d-4d9c-cb2b-1fe1-55105bde1f35', '565', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '52264.384477', NULL, '52438.599092', '174.214615', NULL, 565, NULL, '-174.214615', '0.166667', 0, '44438.599092', '-44438.599092'),
('eaadad87-3be2-ccef-d036-55105b840f40', '351', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '25640.370297', NULL, '25725.838198', '85.467901', NULL, 351, NULL, '-85.467901', '0.166667', 0, '17725.838198', '-17725.838198'),
('ebbe3815-b77b-19e8-8fba-55105b0db82d', '187', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '14856.099162', NULL, '14905.619493', '49.520331', NULL, 187, NULL, '-49.520331', '0.166667', 0, '6905.619493', '-6905.619493'),
('ebd105d7-cdb8-170c-3b71-55105bb3d339', '219', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '16525.419677', NULL, '16580.504409', '55.084732', NULL, 219, NULL, '-55.084732', '0.166667', 0, '8580.504409', '-8580.504409'),
('eddb5d44-57ee-a841-cae2-55105b5be26c', '127', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '12167.191322', NULL, '12207.748627', '40.557304', NULL, 127, NULL, '-40.557304', '0.166667', 0, '4207.748627', '-4207.748627'),
('ee5d4ab3-7176-b0d8-2ead-55105b593c88', '107', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11383.754458', NULL, '11421.700306', '37.945848', NULL, 107, NULL, '-37.945848', '0.166667', 0, '3421.700306', '-3421.700306'),
('eeea2760-03fc-23e4-3a28-55105bb47caa', '597', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '58137.124570', NULL, '58330.914986', '193.790415', NULL, 597, NULL, '-193.790415', '0.166667', 0, '50330.914986', '-50330.914986'),
('ef40985e-ef0e-c3ac-57c4-55105bf20a59', '112', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11574.752784', NULL, '11613.335293', '38.582509', NULL, 112, NULL, '-38.582509', '0.166667', 0, '3613.335293', '-3613.335293'),
('ef912a7f-8cbb-44cd-dd31-55105bd0ea01', '319', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '23050.300152', NULL, '23127.134486', '76.834334', NULL, 319, NULL, '-76.834334', '0.166667', 0, '15127.134486', '-15127.134486'),
('ef91a000-47f0-9d20-2613-55105bec1576', '43', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '9200.048222', NULL, '9230.715049', '30.666827', NULL, 43, NULL, '-30.666827', '0.166667', 0, '1230.715049', '-1230.715049'),
('efba6490-3d25-4b5a-e2f0-55105bb450ed', '228', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17027.844105', NULL, '17084.603585', '56.759480', NULL, 228, NULL, '-56.759480', '0.166667', 0, '9084.603585', '-9084.603585'),
('efc2e9bd-f261-406f-307c-55105bdf9865', '579', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '54756.945289', NULL, '54939.468440', '182.523151', NULL, 579, NULL, '-182.523151', '0.166667', 0, '46939.468440', '-46939.468440'),
('f006f8b4-a3e2-8f53-09a7-55105bc37f2a', '117', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11768.955708', NULL, '11808.185560', '39.229852', NULL, 117, NULL, '-39.229852', '0.166667', 0, '3808.185560', '-3808.185560'),
('f09e14a7-1ef3-ae0a-acef-55105b6eb0fb', '300', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '21637.994615', NULL, '21710.121264', '72.126649', NULL, 300, NULL, '-72.126649', '0.166667', 0, '13710.121264', '-13710.121264'),
('f0fce822-6643-72b2-78f3-55105b02a73d', '122', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '11966.416998', NULL, '12006.305054', '39.888057', NULL, 122, NULL, '-39.888057', '0.166667', 0, '4006.305054', '-4006.305054'),
('f16db1ff-68c8-51e9-b37c-55105b547ee9', '270', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19582.123361', NULL, '19647.397105', '65.273745', NULL, 270, NULL, '-65.273745', '0.166667', 0, '11647.397105', '-11647.397105'),
('f19d80d3-951e-084a-429b-55105b0cb4c4', '261', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '19004.332239', NULL, '19067.680014', '63.347774', NULL, 261, NULL, '-63.347774', '0.166667', 0, '11067.680014', '-11067.680014'),
('f19fe2e2-2b61-b393-8ecf-55105b825aaf', '511', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '43667.952862', NULL, '43813.512704', '145.559843', NULL, 511, NULL, '-145.559843', '0.166667', 0, '35813.512704', '-35813.512704'),
('f1d9b5c3-fceb-f001-7f68-55105b34871d', '397', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '29881.704945', NULL, '29981.310628', '99.605683', NULL, 397, NULL, '-99.605683', '0.166667', 0, '21981.310628', '-21981.310628'),
('f1f252ba-0764-b27f-e49a-55105b31e78c', '356', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '26070.568244', NULL, '26157.470139', '86.901894', NULL, 356, NULL, '-86.901894', '0.166667', 0, '18157.470139', '-18157.470139'),
('f2043ebe-0572-312a-be40-55105b8e714c', '528', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '46209.570047', NULL, '46363.601948', '154.031900', NULL, 528, NULL, '-154.031900', '0.166667', 0, '38363.601948', '-38363.601948'),
('f2442242-18ac-e2f4-5fcc-55105bc6d9b1', '233', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '17313.539807', NULL, '17371.251606', '57.711799', NULL, 233, NULL, '-57.711799', '0.166667', 0, '9371.251606', '-9371.251606'),
('f37bc0f3-014f-bfd2-927a-55105b24f66a', '25', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '8665.143673', NULL, '8694.027486', '28.883812', NULL, 25, NULL, '-28.883812', '0.166667', 0, '694.027486', '-694.027486'),
('f4030684-15af-2b96-10bc-55105b315db8', '201', '2015-03-23 18:27:57', '2015-03-23 18:27:57', '1', '1', NULL, 0, NULL, '15564.607087', NULL, '15616.489111', '51.882024', NULL, 201, NULL, '-51.882024', '0.166667', 0, '7616.489111', '-7616.489111');

-- --------------------------------------------------------

--
-- Table structure for table `yo_amortizationschedule_audit`
--

CREATE TABLE IF NOT EXISTS `yo_amortizationschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_yo_amortizationschedule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_amortizationschedule_yo_sales_c`
--

CREATE TABLE IF NOT EXISTS `yo_amortizationschedule_yo_sales_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_amortizationschedule_yo_salesyo_sales_ida` varchar(36) DEFAULT NULL,
  `yo_amortizationschedule_yo_salesyo_amortizationschedule_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_amortizationschedule_yo_sales_ida1` (`yo_amortizationschedule_yo_salesyo_sales_ida`),
  KEY `yo_amortizationschedule_yo_sales_alt` (`yo_amortizationschedule_yo_salesyo_amortizationschedule_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yo_amortizationschedule_yo_sales_c`
--

INSERT INTO `yo_amortizationschedule_yo_sales_c` (`id`, `date_modified`, `deleted`, `yo_amortizationschedule_yo_salesyo_sales_ida`, `yo_amortizationschedule_yo_salesyo_amortizationschedule_idb`) VALUES
('11c4a61d-6518-fcc6-746c-55105b9db8bd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '10bf42eb-62f6-20b1-d59b-55105bc85dae'),
('11cc563a-d805-926f-ad21-55105ba5281f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '101d9002-0916-47c3-6779-55105b5b0e49'),
('1230a65d-08be-1a05-2911-55105b8d507a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '112c156b-6792-72c0-686d-55105b38c4e8'),
('126edda2-c7e1-90ca-c8af-55105bf61793', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '115fa89e-6a74-cfa9-7bb6-55105ba16d66'),
('127fd419-8366-18f7-9ab8-55105b18cc1c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1184c2a9-b735-6371-1be9-55105b3a6dcd'),
('12d2074f-d98a-e133-7a37-55105b9bebc1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '28100f95-c7b1-0d29-67d0-55105b8cfa1a'),
('130301fe-1b93-e9f3-1b5c-55105b21e355', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '11d86689-cb85-4641-cc51-55105b356a1c'),
('1587e192-f94b-149a-5a37-55105bc291f4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '14999acb-f82b-6a14-785e-55105b6ebad8'),
('1597ce65-7d6c-79f8-d50b-55105b39b01d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '13ac9e6b-32c2-78f0-ce4c-55105b4b3c15'),
('1603a0ae-200f-0a1e-ecaf-55105b268be5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '15042457-42d7-a344-e2d9-55105bc69646'),
('1638ad00-a2fc-b6e9-51f2-55105ba4c438', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '14f0b618-8ec0-4584-3650-55105be21f66'),
('17214b2b-87ff-248d-a0b7-55105bf463b3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '15defec2-6fb3-e4be-5e9d-55105bd8248d'),
('17335ded-8535-de7d-eb02-55105b0c0327', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '15daa780-9963-9e00-f311-55105b14f515'),
('176b37ff-5cce-f355-acdd-55105b8d42f1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '16678e72-1c47-65a1-587d-55105b4d7cbc'),
('17784a25-6547-2698-8067-55105bfa872d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '167612de-e008-d485-ca22-55105bf8a0b5'),
('183b50d4-56ab-ac77-d85f-55105b6684ce', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '17543368-b0a6-9bb1-04ff-55105b0bb8af'),
('183c8d50-30d4-76bc-f1f8-55105baeef3f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1765c51e-db37-bd5c-b828-55105b5f138c'),
('18459239-34d1-eb51-92e3-55105beb3a52', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1729acbe-abce-ae06-1e20-55105befd86c'),
('195a36a7-c72f-2652-7678-55105b8e11b1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '181c5eb6-136f-ac91-43ae-55105bb1d3e5'),
('1998e85b-b194-589c-0d25-55105b1c0019', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1886d19a-1351-edc5-e4c1-55105b057690'),
('19a92d42-d962-3876-9f5a-55105bf0833c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '188419c0-1232-4d05-cb82-55105bf0db9c'),
('19d789aa-5a6e-6b4e-a40e-55105bad25d9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '18d52757-3c3c-84bf-d95c-55105b6a6c22'),
('1b0f8afe-c161-c8e2-4ad4-55105b5d0a00', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1a16462d-cd97-8762-e2f2-55105b07da9f'),
('1b5f5827-890f-ffa2-6cec-55105b5b87fb', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1a863f11-f45f-50f9-f9b8-55105b9485d9'),
('1bfeaad2-a4be-cdc7-f6c4-55105bb16f1f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1ad96f9f-0c7b-c313-c310-55105b0af007'),
('1c606c41-ee2e-d3b3-2a80-55105b956a75', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1b5620bd-3609-d01e-7e1e-55105b2913fc'),
('1d05168d-e282-fc84-c933-55105b6789f3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1c1d7e6b-4205-b9b4-e348-55105b7c8864'),
('1d6f12a2-0509-841a-8bfc-55105b87bb3e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1c2758a9-fc70-2e3f-456d-55105b7ccd36'),
('1d8823ae-9afc-bfb4-9144-55105b77246f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1bd42b93-b7ce-8021-4b2c-55105befaac5'),
('1d8d0f4a-aed4-1800-c678-55105b312cf5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1c9d05b5-c114-e29a-11ef-55105b5e3922'),
('1dacdf5f-6db0-0522-485c-55105b12e4be', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1c67b92c-915c-d451-0e9e-55105b4ab427'),
('1dafcb23-201d-afa8-3b6c-55105b3e0691', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1c747608-3d23-e585-57ba-55105bf59ed0'),
('1e0a0c5f-2c86-e7e0-d816-55105b5ba115', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1d070070-ff26-1310-fdff-55105b6fd3a3'),
('1e9d0958-15bc-2025-812d-55105b39682b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f4030684-15af-2b96-10bc-55105b315db8'),
('1f04e8df-e3b0-ebf8-dc58-55105b409cb1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1e060420-4b7a-8b7d-0a9f-55105b5e5d53'),
('1f1e0256-5a55-0c97-3f66-55105b3663d5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a40002aa-fe02-9351-bb32-55105b5a6fb8'),
('1f50eea5-8df3-1752-02e7-55105be8d2a6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1e262370-f2be-76af-97d4-55105b4afd86'),
('1f8c034a-5cc9-c3a8-8291-55105b8325ee', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1d8f0827-4474-2673-7839-55105b05f8b4'),
('1fa2c32c-910d-772b-8fd1-55105bcb61ac', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1e8b0cdd-6dd7-c87a-9160-55105b935549'),
('1fae1904-1646-ebfd-8b73-55105b0dc353', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1ea19385-f65f-c6f4-5bd9-55105b9f7859'),
('20014385-df96-a28e-9f57-55105ba86b04', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1ecc0cdc-7292-676c-9dbf-55105b62533c'),
('2031e834-7780-7a0f-a4b6-55105b9fe5c9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1f308864-439e-118a-8e4d-55105be2316c'),
('206c0a40-d826-7bdd-7dcf-55105bf46b2e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1f1cd742-9081-6417-1ca5-55105b59630c'),
('20fcc073-8be5-8c0b-f20a-55105bc155cc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1fb864c3-3c1e-b587-6936-55105bc26a72'),
('21c031f1-9d52-1f59-3921-55105ba04ea3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '20bc957c-9b49-4fe5-b8a3-55105b65a25f'),
('2207b77f-3c6c-ffdd-c581-55105b03f515', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '20f79c8d-dc78-0384-407a-55105bd0cc50'),
('22974a8d-3db9-79b1-e9a1-55105b2ce06d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '21b0592d-c200-9b16-3638-55105bd6026d'),
('231118bc-fdc8-87d1-b422-55105b9b31cd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '213a1fce-8f84-465a-22dd-55105b1f2f4c'),
('23450440-5af7-1985-eee1-55105b3100cf', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '215fd16a-7785-2436-f302-55105b4243c4'),
('238012d0-2f06-580e-275c-55105b4e31b7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '225f3de7-c5c6-a12e-28e5-55105bce92cd'),
('23ba5912-ed5b-726f-b628-55105bdf8819', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '221077e0-fddb-cc27-d624-55105b7c1697'),
('23c17ab6-310f-c59c-72b2-55105bea73e5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '22b1bb02-a196-2fb6-53fc-55105b61b252'),
('246c7059-f85b-8aac-8be4-55105bb26291', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '231756bc-3587-be59-b001-55105bccc233'),
('248a7f60-c784-4e97-f240-55105b82c450', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '23ab00a5-b186-6f0a-caf7-55105b5432f8'),
('25c9668b-3bbe-cfec-fdd8-55105b51e526', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '24c93bf0-2fd5-df53-4033-55105b331b26'),
('25f9b575-577c-a3ea-cfaf-55105b8a470e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '25158722-b85d-3da0-31cd-55105b31e3ed'),
('261a8ffc-840e-b2b7-fb91-55105b28dde3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '24fdc61b-4e4c-25a9-d6f8-55105bfb4fd3'),
('26412811-33ea-e44b-9842-55105b8bc513', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '24cca4cc-0580-5950-a714-55105b5316d2'),
('267b0df7-dcb6-17a7-7878-55105b7c8f65', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'aa700687-4936-42f3-08db-55105b5b2cdf'),
('26d7247f-ccbe-4c76-ff4f-55105b369540', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '25d27c6b-c1a7-b1b4-a7ae-55105b293cab'),
('26db6068-f105-2a6e-6860-55105b14c402', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2594aaf8-e932-f1a6-0ec0-55105b6f1407'),
('27270f61-533a-a3b2-5289-55105b23fc93', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1142056e-c868-5fe9-f946-55105b8123d5'),
('27511649-9a36-4c22-ca9c-55105b162937', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '26419000-9915-214a-aabc-55105b00b726'),
('27a5e4d6-e666-1589-7601-55105b32dc6b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '269af186-0fc5-9a39-46fc-55105bc86c33'),
('287a4170-cca6-5c16-50fc-55105b5e9514', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2755bcf5-090f-d538-0771-55105bc3763d'),
('29b930b7-e6d5-9042-3a1f-55105bf708d5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '28be85ec-b250-a9e6-372a-55105bbf3412'),
('29d860c9-2eaf-e0a2-f0d4-55105b3a8be0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '28cb6e3b-0d4c-e146-410f-55105be3db98'),
('29eba855-5274-c0bb-8897-55105b4fe85c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '29069c41-815a-d625-77d0-55105bbc8fde'),
('29fa2065-8a67-1d77-aea5-55105b0a4d35', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '282f801e-9ee5-6a4a-b569-55105b1795ce'),
('2aa85e99-dc6f-17ae-8afc-55105b4629e8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '28beda36-5d09-dd99-6c1b-55105be2399e'),
('2add27e7-7b23-92f2-4baf-55105b14d890', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '29d780e8-5482-4c3f-7c8d-55105b474655'),
('2bc6a5e8-8505-2b4d-018a-55105b7e0069', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2ab114ed-bc70-f10e-4a40-55105b114534'),
('2bdd431f-d079-9967-6d91-55105b9af96f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2b00a472-86d5-6743-1d1a-55105b213eec'),
('2bf403f6-7f72-d610-8a1a-55105b29901c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '1da90a2e-8621-49bf-82f0-55105b34d752'),
('2c408f88-320b-9871-f5f0-55105be2db41', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2acee7b8-8ddc-12d7-3c86-55105bfab011'),
('2c6c2b35-a0e9-9df7-0f60-55105ba9db9c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2b35ece6-479c-10c8-ada9-55105bba6b51'),
('2cd291ca-dc5e-d923-f0dc-55105b97597c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2bd32710-29f9-9b7e-5f72-55105bff6167'),
('2cefcfaf-d7a5-f806-0a89-55105bfd2548', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2bef1fcd-8312-4cbb-71b5-55105b6f5c60'),
('2d27e18e-2888-be0b-e3ae-55105b15a081', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2b608cf1-3165-5a3d-3a43-55105bef95ee'),
('2d29df2b-a315-faac-1ec7-55105b1074e7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2b3c7bb0-7208-8b4d-5a73-55105bd99d9f'),
('2d43b302-b0c8-9826-11e5-55105b11ea2e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2bfa0056-0336-4a13-d59f-55105b914bbf'),
('2dc82e50-f70a-8a93-4904-55105bd3d0bc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2ccebcb9-1701-b8cd-c836-55105bfbeede'),
('2e66178f-fb61-a041-42ca-55105b954adb', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2d5548d5-0d1a-8309-ebfb-55105b19ff76'),
('2f3f1053-7729-665e-127e-55105b289066', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2e48e69f-2332-cf9b-e457-55105b07ab25'),
('2fd81739-52ab-4d60-4824-55105ba29af3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2e0efaf9-1ac8-0dd7-f71e-55105bf16b83'),
('308d3ea9-d1a0-30fa-a4eb-55105ba6a742', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2ef40397-3953-407a-e2c4-55105b68e270'),
('3193e8d6-390b-e834-cb38-55105b9b9bc3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '308bf788-10c9-b703-d119-55105bd5a973'),
('3198348f-a5cc-c1b2-e109-55105b301571', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3085705e-ba32-4893-e8e0-55105bce0be6'),
('320b041a-8e10-1df9-3d80-55105bb71ce8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '20e90913-1eaf-5d61-2d83-55105b0161ec'),
('32184f1b-2b43-5f85-3118-55105bb27fcc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '30212a3a-c360-5eaf-5306-55105b7322e8'),
('3232e174-821b-0b6d-321c-55105bc4438c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '30a4fc31-6233-bb35-72b2-55105b15366b'),
('328d1b71-251c-0cac-5e8a-55105b621d54', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3185042c-c300-53f4-9298-55105bfb3dbc'),
('32977599-94ff-1583-3e52-55105bf8942a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '318cc589-4482-5ef8-b225-55105bbea760'),
('32a56640-10f2-2d8e-f921-55105bb7326d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '316c5e74-d203-3e0d-730e-55105b60acc3'),
('33ea8502-6f7d-2a10-a792-55105ba88765', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '322326b0-3f41-b884-c988-55105b5cf67a'),
('3441bf76-6f3e-2917-f589-55105be4c35a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '33309b66-9a22-a75f-00f4-55105ba00403'),
('3527130b-7d9b-17a8-b7b9-55105bf83017', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '340679d7-897a-27a0-6b03-55105bc23485'),
('352dc9e2-61c8-bbfe-2522-55105b18e885', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '34127fc6-9b71-cd88-82a4-55105b7e7446'),
('36eeb4e2-5faf-45fd-a1d1-55105b129d08', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '35e365f5-2abd-a7cd-ecd2-55105bbba209'),
('379fddf1-cf73-3297-a026-55105bfbedbe', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '369d373e-5772-2782-4439-55105b1ba8d8'),
('37bf416a-5e1c-fbe5-fd4a-55105be967e5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '36afea83-7065-8bfa-09a4-55105bf951ee'),
('37d7875c-f372-a801-de8f-55105ba09138', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '36dbbac3-ff71-69ff-2b6e-55105b5f1e10'),
('38076630-8de4-71fb-3ae2-55105ba84b62', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '370349da-1370-40e8-8f03-55105bfbeea2'),
('382808d8-29f4-6626-e384-55105b89e3b9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '25d30024-4105-4535-7fba-55105bcaadab'),
('385e0111-2cf4-69ec-6a8a-55105b39a73f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '29550509-f00b-74db-63d1-55105bbcff38'),
('38631b2a-1eb0-6163-8f80-55105b848d76', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3778db22-679c-364b-7a0f-55105b19bcfd'),
('388f0516-5984-2d67-2bae-55105b9548a2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '27950abd-a7f2-7136-e36a-55105b554852'),
('38968764-3c5f-9fe6-c252-55105bc6f086', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '36eb27d0-5dfd-a9d8-64cd-55105b5eeecc'),
('38baac9a-6725-7006-3502-55105b9bb341', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '37af9e67-e94c-3165-3e75-55105b0bb766'),
('38bf5d35-fac8-afa7-6ed7-55105bb5bea4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '37a30cdb-963c-dce3-b575-55105b7a1c44'),
('3907e859-f426-b87b-9979-55105bf942c3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '382254d2-f332-fb47-2c43-55105b1c5aaa'),
('390c0477-8de3-b3d6-1041-55105bf0143e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '28f00a38-b772-94c1-1825-55105bf497e7'),
('392cc03f-9966-7114-8301-55105bf9d5cd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '38283864-717d-e3d0-001f-55105b03d8c7'),
('39337dea-bb38-2be8-e87b-55105b785634', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '38233a95-faee-019f-de54-55105be9f5c6'),
('3974d9fd-ce19-7cfb-e491-55105bc8fe1e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '38739e8c-8004-b217-001a-55105bc3293a'),
('3a0c02f0-c73b-bcb6-4adc-55105b9e0727', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2a7702a6-8e4e-ea68-b1f7-55105b33304e'),
('3a2d04e6-6e7a-caf9-c26b-55105bc27735', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '391800cb-c3f8-e77b-2f4f-55105b63a98b'),
('3aae7d5f-d6db-3112-1ec0-55105bf1c231', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '37fb9bd6-49b5-ed87-2b47-55105be32e96'),
('3ab2abf2-ca46-2cc5-2344-55105bf8d41c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '38d43dae-e531-1dfb-41ec-55105b2a4d8d'),
('3abc064d-4f76-3028-5758-55105b7cd9d0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2b060740-ce5d-3fd1-3554-55105b86dee8'),
('3ac71a19-059b-641c-2185-55105b069e27', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '39959668-3687-d9a6-d830-55105b47d6f2'),
('3b4faa91-3921-adcd-f2b5-55105b78973e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3a348be1-06a5-7e28-c9fc-55105b24eea1'),
('3b598961-3e8e-f423-23fa-55105b8201bf', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3a781ce5-230e-3b7b-05fb-55105b9c30b8'),
('3b74d04c-672d-8fd0-03e5-55105be2da82', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '39c80dba-4f99-52da-25c0-55105b1a2adc'),
('3bbd059a-e418-d5bb-8e00-55105b13c506', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '2b8d0021-1ad5-0126-cc20-55105b913015'),
('3bddb816-761e-b71d-434f-55105bba02b2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3a027f96-453c-83a0-08fd-55105b55d5e3'),
('3c132798-d492-2847-ada5-55105b4e4db4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3b1590f9-3532-2ebf-4e59-55105b767659'),
('3c331f8d-846d-d611-2dba-55105b1a46a3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3a924b75-63b0-4d7a-abff-55105b5a6b37'),
('3d1c138c-14f3-7ddd-a598-55105bc02590', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3c2be8e8-1c66-cfb6-c719-55105b70c026'),
('3d328791-df8a-7f8c-3267-55105bc12e6c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3c5c0257-59d6-86ba-dcce-55105be8dbb5'),
('3e41ca30-643d-df4a-048b-55105b72ad60', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3ce42c5b-c981-c316-4e67-55105bd76825'),
('3e756708-36b1-10c3-e2dd-55105bd0af84', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3d96b918-ec78-7525-046e-55105bb51adf'),
('3f3d1ba7-63ae-44f9-926e-55105bcf70e3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3e410654-de5b-a6f3-d74a-55105b441e42'),
('3f49642b-fd21-e07a-580d-55105b2ab376', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3e43f607-c905-ccd6-0aae-55105be22780'),
('3f6a9051-b785-f4bc-430e-55105ba846d3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3d8b9940-d10c-cf5b-a4fa-55105b9d3834'),
('3fb6bb59-4bf0-82cc-7ee2-55105b0bf021', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3e09565f-5841-15a4-7d05-55105b219b6f'),
('3fc8e768-8424-499f-6b05-55105b3635cb', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3ec6a459-090f-0c1f-44c3-55105b3a3140'),
('3fff9c13-7902-ce4d-7f2c-55105b8b90d6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3ed4ba1b-28fb-e183-e3e4-55105b0e6ffb'),
('405b63c1-aee4-ddad-089d-55105b99d173', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3f4afa64-2e22-acf6-4952-55105b308a88'),
('40d30739-5d00-43d5-2df9-55105b668336', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '310f02db-1cee-62aa-8419-55105b597225'),
('40f54da4-2cbe-3983-c531-55105b1ca5f2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3f67439c-485a-0b72-a698-55105b49b07b'),
('419935d4-84a8-e3c7-487d-55105baec306', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '3fd1ac3f-cc5c-ecef-987f-55105b148b4c'),
('41a368ad-2c0c-77d4-1f45-55105b5c278e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '40c4ba1f-169b-1618-2391-55105be88eec'),
('4253fdb4-6905-e5ac-3b71-55105b539a95', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4105e9eb-fca0-c51a-3bec-55105b692146'),
('42a7124d-1578-1274-4835-55105b08e184', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '419f74ea-f524-d67b-ce9b-55105b656d99'),
('42ef4932-50dd-8876-35a1-55105bb7ef71', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '41e61c60-e053-4db2-e70c-55105bbd7e55'),
('44947089-54c2-f16d-cf54-55105b4c8a43', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '439423e0-8e58-2ef5-25c4-55105b4b0b1e'),
('44c40bf7-450c-490e-96d4-55105bd064b9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '43d00fdb-b78a-e9ee-bbfe-55105b93953f'),
('44dca3e6-0666-ef83-da87-55105bb48ac5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4397f409-8c18-9b8d-4aec-55105beca1d6'),
('4520de81-5f34-4683-2cb0-55105bf6e1a9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '44213a73-5cae-eb7a-cc2e-55105b75547e'),
('452fb9c4-1638-c0f9-fc62-55105bb3e076', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '442b5833-1542-0d41-0d56-55105b6a83d5'),
('45dcbdaf-6d66-7f01-0c16-55105b7b2d27', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '448b9389-6ce7-12bd-2181-55105beddd58'),
('45f81ad3-3d14-2581-7d17-55105bdb28cc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4517e2a8-fa70-e280-1ee6-55105ba7552d'),
('4607e25f-36a9-ed3f-bf94-55105b589bc9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '44baebc6-c40d-d43a-9ad3-55105bdb7481'),
('46337bdc-ade5-4109-4ee2-55105b5dac2e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '452c2cb5-40c1-06de-0111-55105b5004de'),
('47bc78df-6a75-67fa-ccd8-55105b8ef6f4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4696db6b-4cb3-3437-728a-55105b86f636'),
('486771c0-15f8-f307-cef2-55105b246f8d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4756839a-d4e4-493a-0453-55105bb58e35'),
('48ab1cc0-dbf0-cda2-7c7a-55105b629ffc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '47b4e5c4-e5c1-8921-6473-55105b31a3a6'),
('48dfa0ee-e4d6-52cd-4450-55105b46beaf', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4765c11d-e382-2bb0-47ba-55105b497bf0'),
('4914addf-c565-93e1-8656-55105baf7335', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '47d2e153-4b04-825a-7f23-55105bc7e21c'),
('4acc9799-306d-7d3f-69d2-55105bbd2fb3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4996eaef-2df4-ae60-72a9-55105ba40eac'),
('4ad717c7-b31c-6633-79fe-55105bac93dd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '493f5507-052d-c22e-6146-55105bd85494'),
('4b27e5c0-f3d3-d422-965c-55105b1d9c0f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4a2071b3-aff8-1913-5f0d-55105b3d74a5'),
('4c0af2e7-af35-d8b4-bad5-55105b056a9a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4af64927-207b-12f6-1df7-55105bcbf3e9'),
('4c8d88bb-a7b3-659e-e39f-55105b858527', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4ba68d76-359b-7a27-2b2b-55105be2317f'),
('4cc73162-82b4-3759-6838-55105b7d380f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4bb952d8-3e7f-674d-a7dd-55105b204b4b'),
('4d00ee1f-cff1-ccaf-1390-55105bb8374b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4bf8cff0-f512-e30e-fe09-55105b1178a6'),
('4d699d07-49db-1567-6028-55105bfea492', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4c64996d-c6e7-c9fb-5d8d-55105b52ac5f'),
('4dc51524-5a97-5cab-8904-55105be44ccd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4c377fb8-4d76-1f63-806d-55105ba63132'),
('4dd51c5c-b565-3b20-bebb-55105bd6de36', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4cf4065d-66bc-4e99-9c96-55105bdbbd70'),
('4def9018-2f48-cbd0-69f8-55105b5420f6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4c35e71b-0f99-db48-4e0e-55105b8f8438'),
('4eb110e8-33be-8ce5-2e9c-55105b162454', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4dc1138b-9873-945a-1f14-55105bec0286'),
('4f6e5470-569f-c1f3-7dea-55105b123f4c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4e6bc131-3d7b-2d85-bff8-55105b5960ac'),
('4ffe21ea-617b-2d60-8544-55105bfe03c0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4ef77f4a-3671-468a-63f2-55105b0f8007'),
('5046f5bd-bd4a-c50c-15ae-55105b9757e4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4ee53a39-b9b9-56ff-8b81-55105b10e80c'),
('50c6502b-95fd-caed-6f48-55105b1befb4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4feea304-77cd-9b2f-01ad-55105b8af4b6'),
('510cf82d-7f45-6e44-829e-55105b276d44', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '500fff54-00af-40fd-c4e8-55105b543b94'),
('52172f75-8d2a-b75b-f78c-55105b96a25e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '50e5a3cc-400d-41ac-4534-55105be95983'),
('52710992-9ad4-4a6a-1692-55105b4ec6a2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '42be02fd-597e-bce1-1bd1-55105bfd9f44'),
('52975617-7f70-fe80-04af-55105b2303f2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '50cf881f-ffc2-2f82-45f1-55105b16c825'),
('535d8539-4796-dae6-355a-55105b605595', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '52347175-04cb-a651-3f51-55105b3e1b8e'),
('5374d7fb-affe-e020-3d9c-55105b959b73', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '528d061a-4b8e-a99a-769b-55105b90091f'),
('537aad1c-5857-c6b5-b66a-55105b61be4f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '523b4c1c-dac4-b990-39f6-55105bf71311'),
('53a8202a-eece-6346-04f8-55105b3d4153', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '52bfb359-59c5-d5a9-8b82-55105b3cc34f'),
('53b51151-7729-ad99-e56c-55105bb9f89f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '528caba2-acd0-d89b-1f21-55105b7ba233'),
('53dda1d6-72dc-9f66-7d5d-55105ba4a152', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '529d91ef-13a8-ac92-5c89-55105b48e57f'),
('5464c783-9279-bc51-d8a6-55105bea01b3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '53302530-4848-c642-699a-55105b009936'),
('5474799a-05f1-a078-a262-55105b8de3d6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5375085a-a522-dff1-e632-55105b2c6eb5'),
('549132a4-45a1-e575-4cfd-55105b644dbf', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '538945b2-4134-3e5b-1afd-55105bd8e8e0'),
('54ae4782-7120-accf-d9d9-55105b02ca35', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '53bd078e-2bc8-afda-74ed-55105bc45781'),
('54e34b2e-f27c-2e3a-a39e-55105bc1bc38', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '53db1048-49fe-8a68-dfe8-55105bf2ca0e'),
('552f399a-60a1-df22-8d90-55105b3baee7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '534bd389-3c94-a827-136b-55105b884ab2'),
('55ad32c1-737c-f9f3-3f40-55105be49150', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '544cbad4-490c-2d59-2a01-55105b50f88d'),
('56232408-ed58-95cb-37a4-55105b57d2c7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '552500aa-d8b8-4767-66f8-55105be7fb34'),
('56c7058b-8b7c-859e-9e4c-55105b097508', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '54d7f9e0-8fb6-c755-d793-55105b13e3cc'),
('57000b04-26d7-405c-cf70-55105bde7d25', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f37bc0f3-014f-bfd2-927a-55105b24f66a'),
('572880b1-cfbc-2a8e-dd70-55105b1c2281', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '562ddee8-8c6d-f38a-d3d2-55105bc36470'),
('57abeb09-3218-1e14-797f-55105b1a32dc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '569f93f3-f714-619c-e062-55105b6bad85'),
('58b410c6-2699-78e0-e677-55105b532ff6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '56b9f0fa-2996-1458-7ad3-55105bd46983'),
('599d4b96-08d1-80a2-f21a-55105b9ff2ee', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '57e65b04-e2c3-0170-a5d1-55105b183fb4'),
('5a0b9115-9930-4b20-91c3-55105b0e2d98', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5904b5c9-11f1-f001-18d0-55105b3c5425'),
('5a198f8c-106e-e505-471e-55105b1d7a28', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '59057d06-31d6-41b6-4761-55105bb3d37a'),
('5a209c77-ba42-0c5c-9b74-55105b1b3822', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5902bccd-c6bc-e543-770d-55105b5f8bb6'),
('5a4434e6-3d94-e2ab-ca64-55105b4a95ca', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '594f4f11-0302-5980-deca-55105b97c5d0'),
('5a945e12-2c6b-b4f7-370d-55105b9f6c89', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '59bd2d9f-b63f-8d7d-6d48-55105b10a83f'),
('5ba78c27-6be8-bda6-425e-55105baabf2c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '59ec3f23-4676-6973-b7a1-55105b32643c'),
('5bd2e353-eab7-5773-ac10-55105b0e4737', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5acec37e-5030-d2d9-3c66-55105bce23ad'),
('5cc8c8ac-6fcc-2ea5-8d51-55105b80e209', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5bd45439-3511-48ff-316b-55105b26f7b3'),
('5d38d81e-10dc-8faf-3f73-55105bd5b33b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5c34036d-a96b-458e-10c7-55105bfe91fd'),
('5d62a43f-04fe-9c61-d11b-55105b7ae8f9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5c5fb905-e5fb-f0a6-b042-55105b330de2'),
('5daa062c-6c37-b087-6046-55105b85f63f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5c9b2543-5789-f63c-7fb4-55105bf4e755'),
('5e170c8c-925b-ca1d-9b6c-55105b73cffa', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5d0f9cad-aa81-4f64-5855-55105b1ca855'),
('5e7f66c1-790b-a396-891a-55105b5e119a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5cc615e1-3f7d-1782-eed9-55105b63d831'),
('5eaf25b7-c759-97d9-0536-55105b256b64', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5d6d7eb5-4629-abd7-cbf8-55105b84e0a6'),
('5f28d263-aa9a-9b99-bcda-55105b7bc39a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5e24058d-cebf-c308-0da4-55105bb45d60'),
('5fe4a246-2659-fc37-ea08-55105bb93df2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5ecd390e-845a-c1d2-4844-55105bd7b057'),
('6056b1fb-d6bd-95f2-2718-55105bfcdc00', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5f569347-1780-184e-ae8d-55105bfbd0a1'),
('6058deec-4518-d32f-0b6d-55105b817427', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5f589da6-c94e-10f7-43e1-55105b108000'),
('60b0fee7-abc5-66d3-98f5-55105bc26245', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '5fab6c0b-e5e2-1ebb-3fc3-55105b8956d9'),
('62201d17-e910-a20b-0503-55105b3f22da', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '60b0d52e-d3df-4967-e13b-55105bec98b0'),
('627752b3-454a-4be6-40af-55105b0f292b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '608cf2fd-541f-45ff-4871-55105bceb980'),
('62a481d1-64ac-ee12-0024-55105b86eabd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6197d0da-c864-ab6a-213b-55105b6965c3'),
('62ce35e1-dd54-10eb-1322-55105b3be653', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '61b970f6-9476-c3c6-2737-55105ba1e141'),
('62fae72c-5c40-412a-4232-55105b94f3f4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '61a7e519-d59b-7d6f-4fe3-55105b89c9e4'),
('63532453-10a5-ecf2-2abd-55105b6ddce2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '614ec7e7-2686-4da7-5850-55105bae4a2c'),
('63fc1171-f712-b4aa-f9f0-55105b6122de', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '62d0b193-c1ff-17aa-c5e3-55105bc86792'),
('64903ba8-10f4-0ea5-f1b4-55105be0a716', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6396978e-fa52-83ed-0ef6-55105bfe14de'),
('65370e00-29ba-332c-34d8-55105b087e01', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '4caa0412-a4a3-6253-71c6-55105bb07308'),
('65505e2d-4beb-6569-98aa-55105b5d8672', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '643aad93-70ea-aa7b-1189-55105b323ca4'),
('65532c14-0a26-8043-6dfe-55105bf64500', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '64249f7c-25e1-dc20-97f6-55105bba7fc0'),
('65ccdd2d-1f35-34bd-4eb1-55105b1f81b2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '644954d0-f12c-54e1-1398-55105b5b80aa'),
('66242172-d959-59a3-88a9-55105b6839b7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '650cd24e-e6e5-81f9-4f9d-55105bc00dba'),
('66e7ed52-f21b-4867-fe96-55105bb0dc50', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '65efdbc4-de23-e3e7-bdf7-55105b2d6cd2'),
('674682da-e21d-7baa-8f9c-55105b0e8c76', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '66375f4f-0c7c-eca7-34b9-55105b5c13c1'),
('676f85d4-fbe0-734a-a937-55105bb5d1c8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6580959c-c313-7aa9-3b0e-55105b0b1658'),
('67b6cebf-9969-8be5-a52a-55105bd6122c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '669aaf64-94ba-7e00-fe4b-55105b907760'),
('67f99bd2-994b-2105-de6e-55105b762a0d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '67177bc4-3109-dc3f-d1f4-55105bf0eeab'),
('6837a399-cf6c-cf16-a17c-55105b03ce43', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '67322880-c4b6-7064-b066-55105b45b51f'),
('683c309f-411e-d992-85cf-55105b5d4417', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '675f9d61-55d2-efbe-f5bf-55105be58549'),
('689839d4-82d5-5253-29ff-55105b4ed839', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '67a5c158-6a0b-bd4a-712d-55105bece924'),
('68ace0b6-eced-99e3-33bf-55105b52e88e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6657ee8a-1d7d-7697-3852-55105b7eed49'),
('6907b325-ecc5-9dfe-1368-55105b30a7a4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '673fe862-12af-6cb1-46e2-55105b158254'),
('6ac4929d-2343-a921-9c62-55105b108abc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '696713c6-d092-13e4-c44e-55105bcfc93f'),
('6ae1c8a5-53e5-dede-4751-55105b20b69d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '697c3bda-4f2f-206a-361f-55105ba5cd05'),
('6aff1d8f-550b-d8f2-3faf-55105bd14188', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '69d801c3-2d39-73d1-0135-55105baedae4'),
('6b0c937d-c5ce-e7e6-1a1c-55105bfca036', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6a0265af-579e-855a-1de7-55105bba91ce'),
('6b2b7985-a341-fbed-ded1-55105bb4f79d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6a3cfddf-5c97-741f-85e7-55105b0ef6d2'),
('6b3e3497-ea24-6a50-0113-55105bec7e78', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6a67a4a4-9ee4-38cf-b316-55105b47d274'),
('6bf1184b-c458-de4e-bf4a-55105b79c651', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6b0084e6-08fc-eae1-e310-55105b583598'),
('6c03717d-b46c-99be-f292-55105bbd5adb', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6af9f832-b0ee-50f2-3054-55105b0b1286'),
('6c610b1c-fe31-a21a-18a3-55105b92aa23', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6b79a787-e841-b664-9330-55105ba83620'),
('6c8e0432-0781-bec6-99e2-55105bfb734d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6b82ed4b-f332-ccd1-f5be-55105b50d31a'),
('6cd46b9f-5b01-b4a8-67bf-55105bd0dbc3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6bc668db-4a15-40fe-f0de-55105b0efaf8'),
('6d2fd6a5-ada8-bd0d-145c-55105b277bd4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6b7ad6ab-56a3-9df3-d784-55105be4dc09'),
('6d7dcb33-1d66-5c29-2149-55105bedf21a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6c79e911-7a28-86fa-30f1-55105bb05503'),
('6d88fe97-d5cf-0980-90fa-55105b2d5d5c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6c7c83a7-f981-cd84-94ce-55105b73d56e'),
('6e09f429-b739-271f-4bad-55105be527dd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6c93edc4-4178-36d4-1092-55105bea1d5d'),
('6ece45c6-b472-82c3-6177-55105b98509b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6dce2701-aa04-9ad8-7f78-55105bf45134'),
('6fe38e56-9562-4b71-f268-55105b1d7269', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6ee98bcb-f418-fb4a-631c-55105b81dc39'),
('704fbc2b-7fda-12f1-7939-55105bf5891e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6e29fcfe-3a9c-efd6-577a-55105b2e5521'),
('706526d0-2460-fbb6-c9d2-55105bbe5c90', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6f61357c-9e29-c146-2850-55105b337e2f'),
('7196fa8b-3cba-b9d9-c637-55105b1154bf', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6f75051c-9e99-6dfd-0ea3-55105b1c8bec'),
('719a9769-c25d-b6c7-00ca-55105b3c83b8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '70981cba-f24a-7ef1-10f1-55105b15e156'),
('71a8402c-1cdf-e92b-2234-55105ba1df44', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '70310716-1c0a-4dec-7ea8-55105b393113'),
('720e3af4-1c74-6ff0-28ed-55105ba93f05', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '70fb7b76-e581-8ed4-d0ff-55105bcd277e'),
('722da5c3-628c-8b75-0914-55105beb38a7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '705f41f9-3cd7-1e8f-9fa5-55105bcee364'),
('72ceeb67-6597-529f-8baa-55105b3cf772', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '71cee03e-6d90-7e09-cd6f-55105b1d82b4'),
('730b5433-7356-e4c3-1ec1-55105bad1172', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '71cd0a9c-8449-91fb-5305-55105b5988f3'),
('743d650a-1143-7eea-29ec-55105b6a0db4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7325bfc0-16b9-6c25-d369-55105ba451cf'),
('745ff632-88e9-2d79-13a0-55105beff0c2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '727ade12-eb02-aa65-41b7-55105b1c3253'),
('74dba0a5-18ce-9743-7ab4-55105b1f47d8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '73b179b9-e331-8291-97ce-55105bfaf5b6'),
('75a1ee14-dcc6-ea5b-3617-55105bc1cc3f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '749f5483-4267-7a53-5d3d-55105be5cd02'),
('76e654b3-b5e5-607a-a4c8-55105b8060d7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '759259b0-712b-ddaf-1071-55105b1c5517'),
('7737fb3a-ff5b-483f-c833-55105b3e2d2a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '75d8d6a7-e076-8eec-5bac-55105bde8407'),
('77993ea0-80be-ce39-cdd1-55105b696732', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '763d3cd0-50b7-5273-5ea9-55105b1e1ca0'),
('785550b9-a9d3-9d35-6dc4-55105b88502d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '76f4e9ff-dd2f-3b21-036f-55105b1159f5'),
('78cf1771-9539-9af6-7bc4-55105bc9bded', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '77bbd908-69fa-4baf-0f4c-55105b0c3298'),
('79603912-6bdf-e17b-6f36-55105b6261ea', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7875e1fd-5ba5-4f82-702e-55105bb729e7'),
('798a4589-7efc-733f-f5c6-55105b1edd7b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '789e2411-5c49-99db-2e77-55105be80a4f'),
('79d5a5f7-9699-873d-7da8-55105b52d6bf', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '78edb622-24e4-cc7b-a008-55105bef88d2'),
('7a173b9d-437d-5971-5f59-55105b8d6c77', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '794447c5-9de9-0f24-e4dd-55105b4b6884'),
('7a3ef0de-2638-c4aa-43b4-55105b39e1c8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '782012e8-65c4-f6bf-8ca4-55105b4bc0ce'),
('7a798e03-44f3-0ff4-2581-55105b687d11', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7953cb21-cfe7-be91-0573-55105b23d7e3'),
('7a81078e-ad5a-7ccf-1d0e-55105b05eb6b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '67470048-ab64-1e66-285c-55105b5b052e'),
('7ab38298-386d-33b5-63aa-55105ba319a3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '79d0f875-a506-5f1d-a7f7-55105bae04cb'),
('7ac3b11c-557a-ce9f-c10b-55105b82f7e3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '78fd773b-77ee-b45b-e7fd-55105b11812b'),
('7aea89f3-29f7-2832-5d33-55105b4a1a57', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '79d92736-e2f7-5683-27b1-55105b231b4d'),
('7b1a5fdd-8eb3-c5cd-6c21-55105be77b72', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7a072c34-8392-dd73-4139-55105b62ec4d'),
('7b332308-b330-8d3b-a6b6-55105b40285f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7a18a364-017b-4560-1634-55105ba26a92'),
('7b6790ac-16ed-6430-d850-55105b439325', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7a5bb40b-9622-13d2-c2e9-55105b852477'),
('7b781b02-83d1-9aed-1f01-55105b070f1b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '79b8965e-e5bd-a726-2740-55105be67fc7'),
('7c2b8bbd-f5f0-7af0-ddf8-55105ba40e33', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7a89eab7-cadb-0def-e07f-55105b8a1009'),
('7cdb5929-c06c-89e4-82aa-55105b561161', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7bfc7c53-de84-528d-e68b-55105b61a5b7'),
('7e0a0835-755a-0cf1-d850-55105b27a699', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '649a026d-5d98-5bb1-ee88-55105b8e4c2d'),
('7e20a1fd-f274-478f-cf0d-55105b9ef6d1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7d49aa53-ebc7-8868-9d4d-55105bcf1094'),
('7e9b8f21-ab7c-2d15-9508-55105b607ec0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7db3a678-f193-2de9-f247-55105b5c9cc2'),
('7edb1136-06e2-aa44-eb10-55105be3195b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7d1d3152-ca1d-a631-4574-55105bce4efb'),
('7ee502aa-9483-44b8-624d-55105bb1e45f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7d662ef9-9a3e-c497-bc4b-55105b46308e'),
('7f46c736-660d-d72e-cafe-55105bf30309', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7e4998bd-6dba-6cca-479e-55105b3dffd4'),
('7f492023-61a4-d586-4384-55105bc483fe', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7e180b04-6a31-c8d1-c894-55105b102558'),
('7f4fca2e-c318-d125-1f8e-55105b37a75d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7e6a8ad0-fa62-3cc6-7034-55105be7df14'),
('7f78c1b9-56c6-79c5-2d0b-55105b683e5a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7e6f9cf0-cc8a-f88d-cef3-55105b5e9744'),
('7f7a03ab-3853-919f-c1da-55105bb68426', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '64330c70-45d1-7ea0-048a-55105bffa6ee'),
('7fbdc19e-0508-a4c9-1853-55105b9c861c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7ecb8f44-767e-126b-717d-55105bca5e54'),
('8003c0dd-32ea-2af9-2002-55105b3d8960', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7edfc9ea-b42c-98ab-60d5-55105bb175d5'),
('806c728d-cf9f-c165-a715-55105b476698', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7f52a631-b4f8-5070-108e-55105bb14724'),
('80d60f63-a418-8774-1100-55105b50f793', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '72b40030-930e-589f-bc10-55105bdbc324'),
('81d58cf1-294f-eb09-03aa-55105b01ac2b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '80be3e8d-c124-e14a-83b3-55105b01941c'),
('826e391b-37e1-2e37-7244-55105b4e5fff', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '80ff9938-5c7a-552c-23bb-55105b38d7b5'),
('82854810-9674-67ab-895f-55105b34dfd4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '818a3967-b6ca-05af-7eed-55105be6fb3e'),
('82b937f0-a025-a951-f354-55105b0ac96b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '81ccddf4-bb8d-bcc3-c4df-55105b714a42'),
('82cc036b-d4da-b284-aa6f-55105bfa05b5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '81d169d3-42e5-aa61-57a9-55105ba396f2'),
('8321d000-f003-0afd-837b-55105becbaa3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '82470e65-6269-0616-aed3-55105beaab8d'),
('8329f9c7-069c-293f-874a-55105b79cf1f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8229c18f-a0d2-fa04-3e9b-55105b56bef3'),
('833f50a8-aa70-13bc-2410-55105b0a497a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8242ad69-e4e7-832f-da2b-55105bf74f9c'),
('83f1e849-42c1-be40-11b4-55105b39f36a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '82f9e00f-46c6-6f3b-6517-55105b2db86c'),
('8498a655-7021-169a-e028-55105bfadb01', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '836139ba-4e2a-98eb-d923-55105b849ed2'),
('84f22b97-d51b-7eb2-50ec-55105bfe6e1f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '83e308fc-efc9-21d2-fbb5-55105b51e8d7'),
('8609b026-c05a-bff7-90f0-55105b19a435', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '850a7229-a3fa-b948-87f2-55105b2fd1ca'),
('86f1425e-49f8-cc90-80a2-55105bd19285', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '853a8783-9c41-a1ae-d932-55105b1b1108'),
('872a0432-04de-8362-8a97-55105bd06ae1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '6d3e09a1-38cd-c07d-39c8-55105be90ee4'),
('877d6894-3bd3-4116-bc74-55105befd251', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '86a0f61f-470d-bb7e-12dd-55105b38e046'),
('87fa0f4e-8226-87e9-5fe9-55105be7e857', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '86f769c6-397c-908f-fed1-55105ba05e22'),
('883e1160-ab25-8258-87e0-55105b9723ed', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '86bc1ba0-5d38-c6c8-391c-55105ba40585'),
('886af102-619b-fa95-7f14-55105b0d1e8f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '871df734-0ec9-a904-03a9-55105b6e414c'),
('886ec9f0-4fc1-023a-b370-55105b67f135', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '876a9574-f00d-ec35-2acc-55105bc6e3e1'),
('88789073-426d-ab55-92f3-55105bc53ee8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '876fb2fe-3b34-235d-405d-55105b94d027'),
('88f7a4a7-8ade-0ff2-5627-55105bd176d3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '87fe61dc-3bab-9964-48a7-55105b1ceba6'),
('8966960c-a1d7-094b-ea52-55105b9f8feb', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '88555e11-7350-49ac-27f3-55105ba00acb'),
('8973759d-08fc-1e04-3bf5-55105b247be6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8849eac3-f079-121f-e635-55105bebf520'),
('89d72077-4bd0-a878-c629-55105b5f66f0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '88294314-6dfb-9b61-d9ca-55105b10cba5'),
('8a512967-f20b-1dce-331c-55105b5586e7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8969edcb-4ed6-3277-dd63-55105b55878b'),
('8ab103fd-b5ea-7786-8f3c-55105b83a468', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '89ac5126-e6dd-91cf-6593-55105b218537'),
('8ab633e8-5450-5541-968b-55105bf921a7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8854d3df-35c4-4690-747f-55105b1e2a18'),
('8ad6537c-d256-d380-0637-55105b5d57e1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '89200030-9422-09cf-1ea8-55105b15cdd7'),
('8b6d3f3e-1ae6-828e-fa40-55105b54309f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '89c1382d-abdd-9b74-82f6-55105bbd5a44'),
('8be0a465-06a3-6ec0-7af8-55105b11ff02', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8ae0efe6-c28d-a783-18df-55105bc32f8d'),
('8c4c2585-6fd2-3323-07b8-55105bf97cc9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8b358558-5bf6-3c7d-b252-55105bfcdd3c'),
('8cd360ad-2dab-a5c7-6644-55105bf15758', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8ba79214-f14b-b710-c719-55105bd669f3'),
('8cfed8a2-4661-4ca7-a9da-55105ba6b70c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8c1f4634-4309-5d6e-a68a-55105b2a9a7e'),
('8d0b3e74-2300-f1f3-c172-55105b26d245', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8c2590d0-0d3d-67ce-beb0-55105b778398');
INSERT INTO `yo_amortizationschedule_yo_sales_c` (`id`, `date_modified`, `deleted`, `yo_amortizationschedule_yo_salesyo_sales_ida`, `yo_amortizationschedule_yo_salesyo_amortizationschedule_idb`) VALUES
('8d858545-4f0e-0c93-519a-55105b9a0ff5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8c825d75-82b3-f29f-c355-55105bbdc27e'),
('8ddd011b-78db-8004-f88d-55105b82ac29', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '77cc0268-a4f7-777d-acfb-55105b2255d7'),
('8e73d2c4-9aca-b680-6ff6-55105baf1f75', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8d73e131-6950-6a11-d33d-55105b2b94b2'),
('8eb9525e-1d54-6b43-632c-55105b56e60c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8bcc313c-5d12-b654-d738-55105b6c64ea'),
('8ed1b8b1-4f9f-0f3f-0cf7-55105b9763d7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8dd6e1e3-6ec4-5bf1-6161-55105b25c31e'),
('8f2fb2b8-7f9c-89b8-0ad5-55105b74889d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8e1273b5-eabc-2e60-4560-55105bf2f29f'),
('8ff333fb-1636-e6f6-3199-55105bc15162', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8ef4dcdf-6de1-7f0a-fd64-55105bccd16f'),
('90bb96ea-11da-a117-9055-55105ba018c3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8fb1632b-80eb-f01a-10ba-55105bd57573'),
('90c6ecf2-e90a-b126-5486-55105b0fc72a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8fc8f4b3-6aee-1551-ab7a-55105b34f22d'),
('912ebfbd-b4ac-8cfc-3fd8-55105b48c805', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9027d284-a8b2-8bed-1e50-55105baae8c7'),
('91460570-4365-4da6-158e-55105bf370b1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '905012c4-b2ba-37c0-9ae8-55105bdc881b'),
('91a383a6-6567-9068-2dc5-55105b182cfe', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '90a43389-e6a1-9761-026a-55105badd084'),
('91c74b9a-43c7-357c-d6e8-55105be86c3e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8f614c75-f7ac-43b2-2a35-55105b57267d'),
('92850f30-4d90-43c3-7e9d-55105bea7d28', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '916ce3c2-e3c2-e401-4365-55105bbdf7c9'),
('92ffc8be-b0c0-a570-1eb5-55105b6a95ac', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '914a72b6-44c0-07b5-6eea-55105b320d5d'),
('930a0e17-71bf-c5c2-225f-55105bd359f2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7fb607a4-877f-e607-78ee-55105b0fabd6'),
('939a59ed-eedf-f3fc-be88-55105bd856b9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '92938569-8647-a701-3e41-55105bfa3e46'),
('93c01c21-6445-0bf5-112b-55105b1a6373', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '92d155dc-446d-3b0d-e812-55105b653d72'),
('94b84e81-7dbe-f00a-e9c2-55105bb1ef1d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '93b0412b-637f-0ae9-94a9-55105bfb7fa6'),
('96295af5-0163-af21-2193-55105bd1c080', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '94035b6b-c587-d4ce-0f95-55105b85e314'),
('96756c97-f323-c6c6-6746-55105be1567f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9548386e-6fa1-b443-3bcd-55105bb30d10'),
('96eb69b6-0455-6a42-6790-55105b40d310', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '959ef926-46b9-44c7-c26e-55105b205f78'),
('970420e4-f77e-1a10-2c26-55105b90438d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '95df7435-7479-d61b-739a-55105bce9da0'),
('9736c5eb-beed-98ab-398e-55105bbdcf52', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '95fd89a5-6c95-b408-8634-55105b747efa'),
('9825b3cb-3a85-0f1b-12de-55105b5626a9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '96da2d6a-e463-88d8-f265-55105b7a046d'),
('9845194e-c6ba-818d-8b87-55105b0d56ac', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '96e1a629-47e3-571f-837d-55105b086869'),
('984b1605-cac3-7b13-9843-55105b4505e6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '973c56a8-75d6-4392-d403-55105b63012e'),
('984f6e81-2916-cc65-0d29-55105bdea4f4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '97423c4f-f063-2515-2427-55105be4228c'),
('985c0f3d-38dc-6177-795a-55105b97ef5f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '7be60681-de68-3ac1-4528-55105b900be6'),
('986e046b-1013-5aba-3104-55105b855810', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '96d003f6-60ed-fc02-9089-55105b2ecbd7'),
('996981bd-6afd-8cd6-4415-55105b4fbe12', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '98710298-f0b4-ec1f-d6b2-55105bcd49c1'),
('9a97d748-6507-f10c-9fe7-55105b1cee01', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '999e5f39-b84a-9072-314f-55105b2ee50e'),
('9acb1043-a0be-4867-d1c1-55105b18ed33', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9982a971-246a-ec41-cc58-55105b028333'),
('9ae20d85-b63b-69ad-7c7f-55105b6c5086', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '992a6e60-6f74-fd79-40f7-55105bcb07e6'),
('9aefab8b-3434-5043-47d9-55105b014248', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '99e14ee7-be69-6994-c5a0-55105bd2480f'),
('9b4d16b1-ca19-738d-f95d-55105b393092', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9a52978b-053e-3a93-9667-55105b268561'),
('9ba7ab41-c110-189b-b164-55105b657b2f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9a34c355-119e-3b11-e238-55105b679e95'),
('9bf3016e-d06b-2e1c-845c-55105b5cca73', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '874f0cfe-b977-2d1d-7b2b-55105b4e5e7a'),
('9bf845a8-c34e-6180-57c6-55105b088a6c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9b10ff46-105f-1285-6079-55105bccf0ce'),
('9cb682a3-4e7d-c336-4584-55105be67e22', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9b748fff-a078-79ea-47c2-55105b460895'),
('9d250518-d809-086e-7915-55105b8f6908', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9b11955e-e083-e784-d633-55105b204797'),
('9dfc7de7-ac01-536f-7ca6-55105b81062f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9cfd17b3-67a4-92fc-8c85-55105b63e5d0'),
('9ea50cd9-2618-0962-65b3-55105b63fc0f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9d9ea206-67cd-65b2-c336-55105bc90c2e'),
('9f479613-b664-1c05-1142-55105b0f2b66', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9def98d7-8d8b-e825-0170-55105bf781bb'),
('9f5fcbd2-fdf7-9eb7-545b-55105bbf24bc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9e60915a-7d86-c5a2-152f-55105b016500'),
('9f690bbd-757c-a8fe-2b8d-55105be3cf07', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '8ed30385-7812-7671-9e71-55105bfc52fd'),
('a0458f1a-1260-dc7c-241f-55105b87454f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9edc3e78-a6ea-a614-4f16-55105b0801be'),
('a0d207ca-2f81-e7e7-2ec1-55105be3c9c2', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9fc4ab82-eae2-29ef-7ea7-55105b3ebe31'),
('a1257731-1643-e564-9737-55105ba96de3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a0209629-c9e6-e125-544a-55105bfb30ea'),
('a14da86c-f532-44aa-bc19-55105b283ab4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a05e4441-6c00-4a99-7a8b-55105b8d8b5b'),
('a16b88e3-fd4a-579a-749c-55105b287344', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a066c239-348a-f3b6-5020-55105bfd155a'),
('a19670fc-cc08-a23a-7a10-55105b9a2185', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a090575a-7d9f-25fe-bd2c-55105b446ef8'),
('a1c60568-9d93-4e11-8e40-55105b1e9d4b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '88760ee3-4259-3cdf-5460-55105bd618e7'),
('a1cf0ed3-2720-21a3-a2e2-55105ba9d893', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a0cda52b-4ecb-6ff1-667c-55105b36028f'),
('a1e1585a-c785-233b-e9b5-55105b992417', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '9fdfd923-7d27-1ffb-a83a-55105b5029d9'),
('a20d5192-d631-2374-dba6-55105b41babf', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a014b20c-125c-cd1b-5431-55105b995a43'),
('a26b21a4-b9f8-7998-bbc6-55105b7c7c28', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a148e7f0-fd8c-cbda-3545-55105b354f57'),
('a2c3d977-c4e2-188f-664a-55105b90d894', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a0f61e3e-275c-9564-1837-55105b8bd65d'),
('a359ad73-8688-b0c3-5a7d-55105b8599e5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a27dfb7d-b538-11c6-a10f-55105b2792a4'),
('a3b01bcb-360c-fc36-8a76-55105bddf35b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a2ac7643-d14e-cbe7-9fde-55105bd84895'),
('a3e720d9-9384-e9c2-b8d9-55105b21773d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a2ef7da1-8e35-6480-b29b-55105bb898e2'),
('a44e9683-985f-a77c-566a-55105b0e0a2b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a31e0b46-644b-2ea2-af7d-55105b565b4b'),
('a496d6bc-58f5-a7dc-178e-55105be3590c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a386b8ef-165f-a84a-8891-55105b169327'),
('a5bbe3a5-f59f-d031-ecd6-55105b9135c7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a4d1f125-5eda-af74-6190-55105b0c9a92'),
('a5c3dbb0-2b9d-7f58-e9e2-55105b3d10ff', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a39239e3-3594-ff14-a10f-55105b94efda'),
('a6a98748-856e-a86f-d614-55105b060dbd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a549c109-938a-763c-13d7-55105b79168f'),
('a6dec08e-b200-aabb-d729-55105b1c89b1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a5c1b7ce-63ca-1c55-41f2-55105b36ed1f'),
('a6df3bf7-c98d-8e5e-8a6d-55105b39106e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a575dd57-1ad2-c3f2-ca00-55105b3ba9de'),
('a7da4080-2bb1-4fbf-ba35-55105bf4fbdc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a68f3b2c-a711-783f-d2c3-55105bbc66f0'),
('a87cdedc-cebb-a4b3-043e-55105b74206a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a77ee805-025d-23ed-2bfb-55105babec18'),
('a8f75b31-107e-356b-63d9-55105b2dea60', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a817e588-1e6f-cb65-91a7-55105b2211a7'),
('a9c80d1b-9772-d0c3-21f0-55105b03119d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a8b5efc8-fec9-5d19-7845-55105bbec61e'),
('aa1a96c6-7b63-dbb3-139a-55105b81d800', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a93e5cee-16d9-3803-99b7-55105b55fabd'),
('aa3da978-0953-1c7e-1204-55105b0d9245', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a87b0a80-b956-bcbd-f989-55105b61006a'),
('aa5caebb-9c8f-2106-f047-55105bacc2ea', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a94f2143-2538-a08b-38cc-55105b77778d'),
('aa717303-df26-b3c4-6a82-55105bf9e908', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a8a98cff-38a7-01b5-6c91-55105b2bb809'),
('aab5e5b2-8eb4-203b-56c4-55105b30cfef', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a77d6c3f-4901-0fe4-3fee-55105b3436c4'),
('aacde74e-2ed2-144d-eec3-55105bfe1f4e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a9c037f0-cd52-4129-a738-55105bcb82fa'),
('ab306c1e-9cca-c55a-ff13-55105b0ccd65', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a9ee3e73-ad0b-bfeb-b296-55105b1f8747'),
('aba22a5e-c92c-3397-e666-55105b16e2c4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'aa97719d-1e75-68fe-af19-55105b443252'),
('abb32cc5-9c52-38ed-c9a8-55105ba81bee', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'aa6d4991-34c8-46e2-8dff-55105b65125b'),
('ac8da80b-a391-b00d-7213-55105b95928d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ab5e6a1d-a7cb-9246-d38f-55105b5859b7'),
('acb27229-14ed-2425-edb7-55105bb15b51', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'aafc69c8-9128-0821-d5d6-55105b630812'),
('ada555f1-4914-16d3-2b54-55105bd24b1a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ac5145fb-d816-1588-a997-55105bdd7267'),
('adb5f579-092f-3e84-4c11-55105bb14b5a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'acd0d1aa-f169-3061-f259-55105baacb9a'),
('ae146b98-9b85-0ed9-2999-55105bde68dc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ad2b76e1-6594-9898-e239-55105b967fc8'),
('ae3c1491-d711-cf30-860b-55105bb5c1e9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ad4a29d4-df7c-687d-959a-55105ba857c6'),
('ae620e5b-4ad8-c88c-e635-55105b0bcc94', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', '990a0122-49b3-72ed-e0d9-55105b3a9b18'),
('ae926449-e3c4-6a38-23ed-55105b382d0d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ad05a1ab-fde5-0db6-7f38-55105be2f141'),
('af08c667-94ff-b488-9324-55105b6b3b97', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ad8f6ece-d559-8dc8-db62-55105bd84c20'),
('af0d2d09-80b3-54e7-70b1-55105b38ecc5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ae018173-45e6-0ebc-3853-55105be71f02'),
('af600348-0161-1e9a-d0b5-55105b625875', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ad8f9feb-faff-e623-0e59-55105bcf7493'),
('b06720f6-cc05-4405-7d14-55105b7936e6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'af5b04a9-2921-cb58-bddb-55105b1cbbf4'),
('b0c5dc78-42ff-28f9-7924-55105b514a7b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'af2a7935-55c0-922b-58d7-55105b645436'),
('b0dd0582-7b36-8dbb-f73c-55105bc7ebdf', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a11503d5-3bf7-ed29-4ee8-55105b6ae87b'),
('b17ed6b0-d294-bb60-d9e2-55105b62945d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b07be5c8-56f9-3901-97d8-55105b67ad52'),
('b2396c3f-fcd7-b121-1f68-55105b95dcc0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b09900d5-cd1f-280c-73d9-55105bbcf665'),
('b2984391-51df-f519-84f1-55105b63a278', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b124d5fa-5c4e-7cfb-c69f-55105bb8b7c5'),
('b2df006e-b689-ed9c-114e-55105b5cd5d4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a217030e-c57f-5ec8-e748-55105b39aa78'),
('b32e897e-eaa7-1fed-fa72-55105b146e48', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b0dbee87-1ab0-2de4-5c35-55105b3a9cc8'),
('b35d00d6-6cdb-a4bd-2600-55105b3fd684', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b241f1f2-bfb8-9d9f-2c47-55105b31c8f6'),
('b360e2a8-f760-1541-80db-55105b4c0584', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b1e33ac0-d282-9a20-de5a-55105bc26aaf'),
('b38f85fd-4aa5-287e-6893-55105b7f8399', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b28f15c8-1b90-fafe-294c-55105ba934d1'),
('b39873f6-99ea-9cf8-4ca6-55105bde98d4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b24e47d7-594a-a644-d0ec-55105b0763e7'),
('b39e1c82-6f27-0d4a-9eb6-55105bf6ebd9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b29a127c-7863-5f98-31b0-55105b7fda08'),
('b3a02524-9ebe-4b6f-6bc6-55105b28e76c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b2b502aa-b14b-21e7-f2ac-55105b0e742f'),
('b3d8f1cc-ede5-d47b-66c1-55105b4d2861', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b2e4e8fa-eff5-9733-2b57-55105ba99601'),
('b4233d2b-ae61-e3f2-f54d-55105b2cc42d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b31db4d3-4f1a-4c59-241a-55105b0798f4'),
('b42a0e4f-f1dc-736f-7766-55105b5618fa', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b22c6462-2b6b-7a89-e1a3-55105ba3b391'),
('b45837b4-30e0-4b4a-0db7-55105b6a3dd8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b315d9ae-2ffd-05cc-878d-55105b99fe72'),
('b4946525-a7b1-297f-dc21-55105b1b9079', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b2adb8dd-4536-8388-f4d3-55105b2f57dc'),
('b4e9df6a-5eba-4ede-3c5c-55105b81daec', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b3dd386e-c31c-3e6f-3a8e-55105b7373dd'),
('b50e397b-c8ae-89c7-587e-55105bd80e4b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b4160370-b934-cba2-ae27-55105bb737df'),
('b62b2ce2-a150-ee3d-06f6-55105b49d86c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b48562ca-e707-11c4-e4ae-55105bc81d7d'),
('b63e6ce3-bb16-b0f0-c87b-55105b4ff101', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b411caa7-43b6-452b-d7e8-55105b3dd9c3'),
('b657d9ad-857c-ad0c-dac2-55105b528932', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b552f96b-f33a-46d2-bf4b-55105b28af53'),
('b6a5a032-ca37-89f0-f9a9-55105bfa151e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b4d39cc4-a8de-d744-8eb3-55105be947ad'),
('b6e40cf4-4515-f2d9-7117-55105bdc47b4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b5fcc5f6-3e87-fb53-bcb4-55105b88eda6'),
('b7720014-a0ad-661b-f610-55105be82d1b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a7400eb5-c0b7-2f0f-ef3e-55105b30ef90'),
('b7da37b2-1c39-fc66-7d11-55105bc2131a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b6fb1e95-9bc6-4737-5da8-55105ba0f7c8'),
('b7fdf401-996c-d965-d2b7-55105b4b31b6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b6fc6eb1-d0c7-7661-600f-55105b4349ed'),
('b80331b6-dbc8-2017-fc0d-55105b037c34', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b70c44e3-2592-b845-99cc-55105b641c7d'),
('b9a11a2b-0630-c3e1-3baa-55105bd46618', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b7c0f280-8c93-22b5-f407-55105b70e9a6'),
('ba4d7e20-14d1-7e78-9fb2-55105b7d01a6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b955a32e-8e18-9605-1094-55105b7644af'),
('ba750f2c-90bf-4e50-8dde-55105b323a09', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'a895024b-21e7-0527-349f-55105b0b3548'),
('babe7508-a69c-d2f9-a5bb-55105b83c38c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b9a9f3e4-f060-2b04-e9ff-55105bd6ef79'),
('bae05d8a-c5fd-3607-8ecf-55105bfdabf4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b8fcae2d-d187-1cdc-53e2-55105b2b042c'),
('baf4a851-4b42-3ef3-9bbe-55105bde3aba', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b9c0e531-f891-3c94-d682-55105bb8af4e'),
('bb68e38b-e38c-ae6d-a884-55105b38c08b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ba6e8f0e-365a-9a8d-99e4-55105b786937'),
('bc01dbe4-bb1c-a9bf-17e8-55105b1562e0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ba8eab06-e433-19de-9a05-55105b48e8ee'),
('bc2f73de-5723-81fa-b892-55105bd21f84', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bb272be8-0824-5edd-6348-55105b542552'),
('bd418083-9c5a-8bd4-db67-55105bbefced', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bc63560c-4c2f-48c0-8f8f-55105b06f9e5'),
('bdfd2bd4-2d8d-558f-1df2-55105b4b2104', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bcc5c060-7305-20a9-fdad-55105bf8d80c'),
('be845305-c7d4-00a2-7dda-55105ba02797', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bd1ff3c4-9090-c5cd-b734-55105be91024'),
('be90fe46-3f8b-609b-3ab9-55105b1356a7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bd85aa6b-f841-71d8-47b6-55105bd5bf28'),
('bea9dbac-e1e0-a0d9-53e7-55105bc9ed9a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bd874020-1287-ff44-117d-55105b624536'),
('bec2c59d-262e-8533-053f-55105b2be0e6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bd7b9f0d-ff06-c156-fad1-55105b3c2fe9'),
('bef74c5f-d8b3-4394-f9a1-55105b3134e7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bdf326f7-6dc5-5d7a-2226-55105b70583e'),
('bf7b210c-cc52-e9c0-ffbe-55105b5df6ae', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'be4f260f-d61d-e008-a6d4-55105b1d279d'),
('bf95d468-79a4-aca7-ebb9-55105b6d932c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b5825d8b-479a-2ff8-de3b-55105b27b9e1'),
('bff14eb5-dc78-ccc5-8e15-55105b279e3b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bf08eedb-77ae-0a24-3f67-55105bbda077'),
('c064aefc-cb2d-3965-194e-55105b2faef0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'bf4f12eb-88ea-7485-3298-55105be0c17d'),
('c134f54a-89ce-ad65-5502-55105b0c184e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c0381e3a-f232-adaa-9b6f-55105b1dc3b8'),
('c1ae00ed-931b-86ce-7474-55105b8368be', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c098f246-9de5-4eec-ae67-55105b69a6a6'),
('c1b1f718-956a-6815-8025-55105be2f1a8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c0a0da5e-7d1c-3f5c-cd02-55105b0768bf'),
('c1b2e9a7-c07f-2cd4-faa2-55105bfeaa75', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c0a30351-bcbb-ff69-0746-55105bfd7de3'),
('c317d67b-c1fb-2cbf-abc9-55105b6f250c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c21c1156-1154-7a07-682b-55105b7597e1'),
('c36c782a-2b0f-e278-ea1c-55105b31871f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c24d4bda-26f7-98c8-1b3a-55105b73e5ff'),
('c389bc0a-bf05-2ce1-dbc6-55105bc95e9c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c2374783-8872-0dc0-c0af-55105b58626e'),
('c3cff25e-c75d-ffb2-d8fe-55105b4ee437', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c2c94b59-b36a-cccb-d60a-55105b607731'),
('c4140803-6d12-e8aa-8b0d-55105bcf5390', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c306f8f6-028b-442a-0e4a-55105b2b6111'),
('c481547b-ef88-ee61-4722-55105b5b2507', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c37aee55-923e-cc7b-f41e-55105bf470a1'),
('c5bc8e03-b586-59e1-6db4-55105b51c4e0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c4bdb044-5c84-adc9-eb4b-55105b3a0ad7'),
('c617a8d8-c4e0-9d9c-9077-55105b5cbadb', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c53a3f20-4f35-7e60-2dd2-55105b20417a'),
('c6b16619-aea1-ab3e-0a3f-55105bf7747a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c5ad248b-754d-c3f8-0f83-55105b434866'),
('c6d1a078-c341-81ab-f471-55105bebae65', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c5d8b7f0-d53f-69ee-222d-55105bc3b525'),
('c6ecc61b-f29f-285e-ba13-55105bb921a6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c59da975-781d-38a8-28c1-55105b8df026'),
('c72395a4-974a-8b27-797a-55105bd9f999', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c61a297e-2861-6b06-ace5-55105b5423d3'),
('c78ac5e2-f6d4-6448-7400-55105b983524', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c6a40edd-d1fa-6a41-bd1e-55105b46f5e5'),
('c7d04d58-2871-5022-42cd-55105b8fec4c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c6c45fe2-0c6c-4bc3-0a85-55105b830b99'),
('c7ee9df1-f0ee-e2ae-80bf-55105bcaebce', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c66013bd-271c-658e-42e3-55105b28b716'),
('c93d4baf-db6d-5fa8-672d-55105ba25327', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c7e4cf48-15e1-c3c7-1514-55105b0ec208'),
('c97c3500-9c96-3f39-d250-55105ba68665', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c8717cde-1ce2-9600-12ec-55105bfc0489'),
('c9eddb16-5862-7642-ccea-55105b291e4a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c8609d66-1045-8c14-931a-55105bb4c215'),
('ca1a684c-8624-64ed-5fb5-55105bd9acd7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c916ac49-81b0-ed2c-309d-55105bc2ee57'),
('ca3353d5-0572-3429-8591-55105b4d94ea', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c949bc7a-d2d8-0e94-81f3-55105bdbcce6'),
('caa9ce1c-1dc3-0e70-87dc-55105be09be3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c9c7d52e-32c9-64bc-d5ad-55105b6751ab'),
('cb181725-112e-5aac-6538-55105bfb348b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ca1178e2-b6ca-5a43-9c90-55105b3e4bb8'),
('cb6ccc5b-d392-1b4c-28cf-55105b8bbc49', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ca8847ec-a3f6-e1b4-aabb-55105b30d657'),
('cb8dd144-b2c5-631a-4c93-55105bc72811', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ca79966e-f44e-b3d9-3904-55105b6794eb'),
('cbc9be98-8f97-3f20-ec79-55105b002637', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cabc82cb-5ccd-5b8b-bf0b-55105b21002e'),
('cbd5944b-da15-e0ae-b178-55105b455939', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cab2a6c7-2ca6-55c2-3800-55105bac2134'),
('cbea1849-4aec-7d55-0c4c-55105bdeaf12', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ca4106dd-7630-1e4e-dd17-55105b0e43ad'),
('cc1e2aa5-656a-171c-7c56-55105b8d0f4c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cad9cfbf-29fb-823f-c240-55105b5616a6'),
('ccb3e89c-0bd8-381b-494d-55105b9b4ebd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cba1d47f-98c7-d208-0531-55105b469b6a'),
('cce2a7b5-b5e9-985d-7edc-55105b4d34e8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cc031081-5a35-3213-e2dd-55105b0434b0'),
('ce042cb2-d507-a8c7-857e-55105b212683', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ccf2db6b-f8d6-eefe-de0d-55105bb39e26'),
('ce3df550-726f-4d12-dfdc-55105bc67ae8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cc4a8cdd-d090-0977-ee53-55105b1979c3'),
('ce57ac32-b89a-c7ed-ed5d-55105b45ac95', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cb86d1ab-f70e-9854-829d-55105b9e2bf6'),
('cf7aab23-30f0-ff2c-8a85-55105b427def', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ce761dda-66c8-5263-e06f-55105b547e8b'),
('cfab59ea-53cd-b4f9-ab84-55105b225883', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cec4275a-b5ad-7470-4bdf-55105b6be326'),
('cfab5aef-dc58-222d-2179-55105b96696e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ce96f079-1039-8a9a-74ef-55105bac05b6'),
('d00ebace-7bf4-4552-ea32-55105b126764', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cf12029b-9e45-19ed-a918-55105bacdc9f'),
('d041e084-47b3-771c-b5d1-55105b95feb7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cf198d2a-62af-8ba5-b55f-55105b5736af'),
('d05c0f80-c5ce-10c7-17f2-55105b4ff6c8', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'b36d04fe-89e6-f72f-7f76-55105bc7dd5b'),
('d0db997a-f4d3-12bd-a3d1-55105ba7082d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'cfd652fe-fdde-7fb0-be6a-55105b099f61'),
('d18c49d5-5d16-ee40-6495-55105b346d1d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd0848883-1545-acbb-4120-55105be079a4'),
('d24490d1-476d-f466-8a16-55105bf6112c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd111ef8a-ed66-23c0-3dc0-55105bd27b75'),
('d2699308-0252-e656-5947-55105b600d12', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd1557d8a-8bc3-a5e1-bb14-55105bf4c972'),
('d3178b77-8aa9-e357-2238-55105b10ebc0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd21f1fdd-b4aa-4a84-ce9c-55105b888fe0'),
('d38c92b5-ec79-a4ff-c8f0-55105b6b920b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd27f21ac-0b0a-5202-4e88-55105b83c526'),
('d3da433c-5cef-2fb3-482a-55105bc9a0af', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd244a3b5-01a0-a461-4ca6-55105bac690b'),
('d52324b5-a2a1-5666-462b-55105b306885', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd420af96-30e9-bd77-eb14-55105bdb071e'),
('d588fc6f-d7d6-af5c-2466-55105b41ed85', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd37a2e7c-14f1-9f4c-5872-55105b0fdd29'),
('d6266ca4-c62a-947e-09d2-55105b5f0a18', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd4f73eaa-5de1-2010-8865-55105b915524'),
('d63cb5b7-5fc9-6226-8082-55105be1ef69', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd4203916-6422-72ac-39cf-55105b30c53f'),
('d7487c9a-aaee-294a-e58d-55105bf29661', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd5edffde-10c1-54d6-e057-55105b7428fb'),
('d76bb0a0-9cc4-18e8-3fad-55105b9194d9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd6617c76-8d6f-4d2a-0fa7-55105b26c6c7'),
('d7c64af0-a58d-9547-3e21-55105be9bea3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd68bacd0-bcaa-5637-637c-55105b2d68ce'),
('d7d1fb58-cec7-8e74-3c0c-55105b2e3748', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd66cbba5-c602-52e1-25f3-55105bf1818d'),
('d80c9e8a-72c3-55cd-a722-55105b4ed74e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd70c0af2-eb74-8c46-ad04-55105bdf0850'),
('d8340f37-eeeb-3d75-b293-55105b5c52c7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c9260d5f-6a19-2eef-8a19-55105beb346e'),
('d9430384-d237-1f69-8060-55105b6e03dd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'c8e10c00-dcf7-64ca-c0e7-55105bbbe4e4'),
('d9d86642-2a8d-f5c9-247c-55105b74564b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd90661a9-4105-3973-9708-55105ba3a82b'),
('d9ea0cfb-350e-8b67-8a94-55105b236280', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd90cf99e-199c-fdd2-4d88-55105bb8df04'),
('da247e49-d5ec-cb21-3f23-55105ba028ce', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd93481ac-dc3d-a76e-da70-55105bc1d8d1'),
('da3b4b2f-3f13-72bf-6302-55105bc9d773', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd92d4adb-5dbc-cd8a-49fe-55105b157617'),
('daae4b1d-a206-a5cb-7333-55105b64b490', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd9a983ed-0230-01b2-bc48-55105b3a4eff'),
('db1cb647-dc1f-7038-e2db-55105b7ad38d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd9dd712c-ef83-9a47-cf85-55105ba2365e'),
('db9675f4-f476-1882-06cd-55105b2db4db', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'da8154b4-1d2a-0583-eccb-55105b919788'),
('dbcb099b-aba4-4621-edbd-55105bd5a822', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'da9da628-01b4-cd4e-8ec3-55105b82c8c0'),
('dd2887b2-f8cc-cd8c-aa31-55105b124861', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dc0ca874-d47a-2ce9-44e9-55105ba952de'),
('dd374535-b6db-3725-4ec9-55105b31a178', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dc056e54-20d9-a2cd-29f2-55105bf09d3e'),
('de2e5cca-4886-ef6a-a02e-55105be3d712', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dcdfde3d-95b2-e929-4983-55105bfe120e'),
('de639611-daab-2b29-9175-55105b743b9e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dd561804-c10a-49b8-c1a3-55105b922c5b'),
('de74a5fe-761b-1b7c-5c1f-55105bfeecec', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dd719994-a187-84c5-6034-55105b511583'),
('de7edff1-4730-7139-6b6f-55105ba98c51', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dc80846a-3190-659a-3596-55105bc4f5af'),
('de9a74b6-030f-1e57-f33c-55105bcdb159', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dd98db54-6397-859f-2573-55105bfbdf73'),
('deb5d0b1-7347-2f5f-ad06-55105bf2facc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ddb6a0d1-ea68-e2ec-0df9-55105bf953fd'),
('df253d76-f02c-2b48-a040-55105b83bbff', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'de19cdef-937e-6260-22d4-55105b9d78b6'),
('df7ed87f-d118-5990-dfae-55105b29e297', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'de9cd489-f9a0-6bb4-548b-55105b9290f4'),
('dfc2ba6e-b649-0537-1666-55105be9f48d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'deb144aa-3a08-86a3-b8d8-55105bcd09bb'),
('e001583b-95b7-9592-8460-55105b85c037', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'de0d9740-f630-423f-6ad6-55105b5c8749'),
('e01d15e3-39d9-9078-9729-55105b01663a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'def8078d-0f1d-73c3-03c8-55105b4d6e48'),
('e04fe733-6dc5-025d-dc40-55105bd4f6c0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'df551fd6-548f-b857-693e-55105b0f7346'),
('e05f0c00-cacf-6678-9758-55105b6f78fc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'df60d201-4f73-96fc-fb89-55105b884efe'),
('e0c01fc5-1dc0-9b92-a7a2-55105b30bf5c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dfda730b-bb5c-1e5c-9335-55105b37e160'),
('e1a5e5d6-5580-6c24-58d7-55105b6203af', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e0937c68-d447-9976-b4d6-55105bfad176'),
('e1b022bf-4512-f53d-13b7-55105b68698b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e022f266-ed63-6f79-87ed-55105b345b40'),
('e1cd3d69-d0c9-5605-cb19-55105ba445da', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e09196ab-35ca-6073-a436-55105bb591db'),
('e1d7059d-0726-7a7a-6f08-55105bcf8799', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e0dc544e-36ad-553b-9fe6-55105b5c0964'),
('e2177c92-56e5-2aca-7ed3-55105b252afb', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e04d6c23-8bd4-fb0e-2e27-55105b7bbcd3'),
('e276ae71-339d-f7d3-cfda-55105b23724d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e17e6d48-fbca-46c8-81af-55105b79413a'),
('e2774f17-090e-c6d3-853a-55105bfd5a06', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e172f452-388a-bc69-8156-55105b9993d5'),
('e27f617e-39cc-9c2c-e082-55105be6c7b6', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e1701ace-ea5c-1f20-9ae9-55105b43cd06'),
('e2a7a631-d22a-1f52-6fac-55105bb2b517', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e1825f8e-be15-20b4-fb0d-55105b611307'),
('e3554b05-58e2-6156-9ed7-55105b917d1f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e2661812-0a0d-c287-d21f-55105bc05b21'),
('e3dd00d6-09c6-663f-cc52-55105b07ca2b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd28c04ce-7225-2b55-ce29-55105b72945f'),
('e408b34e-8653-5d8d-24ab-55105bacbca0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e2dd9513-d88a-b120-975d-55105b29f7ae'),
('e41bece8-55af-a9d3-b382-55105b5d0fe1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e2e53f7c-862f-c95e-cfdd-55105b954762'),
('e49400e7-14c4-83c3-9703-55105bb3dab7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ced7075e-3aac-ba6f-dd0a-55105b89cf6c'),
('e5308bde-b01c-4f7f-91ac-55105bdb8d73', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e43a60a2-a6f3-1d78-84a7-55105b63e75d'),
('e63e120d-7000-3d14-196c-55105b159463', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e4ffccef-0cb4-e268-dab5-55105b008064'),
('e699250e-7dc5-3b62-0e6c-55105b7720b4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e539ef6c-1d33-6687-5ce5-55105b804919'),
('e6d88c79-ac23-f0bd-998e-55105b5fb523', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e5deadcd-979d-dc95-4bca-55105bd454bc'),
('e6ed9869-8ce0-8b4e-cdfe-55105b9b8444', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e592b61a-5258-30c5-ed25-55105be2f76b'),
('e7434027-f60d-8b45-372a-55105bc9c004', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e66423d1-b293-9add-ee8f-55105bb9758a'),
('e79e9c9a-83c8-a83d-9ec6-55105b583d53', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e6949503-7aa9-2a95-786a-55105b3efdfb'),
('e7c15781-2bf4-f582-b2e1-55105bd6611a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e6bc38ce-caef-36b8-f5ea-55105b3df32f'),
('e8988847-aaf5-fcdb-27e2-55105bebb08d', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e7aee533-6ed3-abe3-405d-55105bf5b41e'),
('e8998e36-f84d-94ba-9881-55105b91925b', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e6f4b88b-2149-18f5-eff4-55105b33cf65'),
('e89e5e6e-1c47-ea81-aa88-55105b0e1169', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e7c06a32-7726-7597-07af-55105b80c979'),
('e9547a64-e2e3-2990-d072-55105be16866', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e85ce019-6f09-ed8f-c3ac-55105b05ee61'),
('e986a997-8928-f76b-ef49-55105b8422ad', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e883dcbc-f9d1-da3f-ebc8-55105b254c8c'),
('e9ae1729-2f6c-f85e-dbf7-55105b15f9e7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e8d02b77-dbb2-00a4-e3b4-55105bda0364'),
('e9fc6305-079a-c25c-7d71-55105bdc7783', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e8f8de9c-23dd-8690-ef25-55105b0f5bee'),
('ea1f061d-cb07-510f-bb82-55105b26785a', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e7fc4755-f895-1295-dea3-55105ba7dc75'),
('eacbf72b-6120-7ae1-e5d0-55105b05016c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e9a9dfaf-0877-30f6-1914-55105b47b8cb'),
('eb01d88c-1ed5-ea2a-38d1-55105bddfad9', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e9b10e9d-4d9c-cb2b-1fe1-55105bde1f35'),
('eb2e52f6-4cff-b057-084a-55105b4bd00f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'e8be945b-916a-282a-293d-55105bf542fc'),
('ebbc6af2-e802-681e-d7a0-55105bcc718f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'eaadad87-3be2-ccef-d036-55105b840f40'),
('ec2d01bf-7e2f-2bf9-f1a3-55105b796c0f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dca70fb7-4105-2700-f60c-55105bf1cb8c'),
('ec8a0261-a389-bcf6-ac77-55105b666718', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'd8ba0fde-f489-9cc2-a9ac-55105bf0d06e'),
('ecde9227-457e-9b99-7237-55105b3996a0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ebd105d7-cdb8-170c-3b71-55105bb3d339'),
('ecf40011-7022-d054-79bc-55105b1ee2f5', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ebbe3815-b77b-19e8-8fba-55105b0db82d'),
('ee030205-e51f-acf3-ac79-55105b60a96f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'dd530234-fd9c-4975-faf9-55105bd1da9c'),
('eeef4ccd-1fdd-af7d-abd1-55105b1393c1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'eddb5d44-57ee-a841-cae2-55105b5be26c'),
('ef81290f-033a-e16c-12b6-55105b75a0e4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ee5d4ab3-7176-b0d8-2ead-55105b593c88'),
('f064e3a8-1302-1bbb-7d60-55105bdb264c', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ef40985e-ef0e-c3ac-57c4-55105bf20a59'),
('f09c1adc-18d7-0eb2-7ffc-55105b177e36', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'efc2e9bd-f261-406f-307c-55105bdf9865'),
('f09fd8f9-02b5-c91c-2a34-55105bbef7ce', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ef912a7f-8cbb-44cd-dd31-55105bd0ea01'),
('f0a14cec-199e-b94e-b639-55105b22d0bd', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'ef91a000-47f0-9d20-2613-55105bec1576'),
('f0a8daf8-0709-9230-a84c-55105b034992', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'eeea2760-03fc-23e4-3a28-55105bb47caa'),
('f1c28976-a18f-72ab-cf1a-55105b2448d7', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f09e14a7-1ef3-ae0a-acef-55105b6eb0fb'),
('f1e9d4da-4277-0088-d719-55105baf1c9f', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f006f8b4-a3e2-8f53-09a7-55105bc37f2a'),
('f2546279-97a6-d0d0-d3ab-55105ba01463', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'efba6490-3d25-4b5a-e2f0-55105bb450ed'),
('f272b025-cb1c-f502-153f-55105b97bf3e', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f0fce822-6643-72b2-78f3-55105b02a73d'),
('f28cf3c4-0bb3-648a-018c-55105b283df4', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f16db1ff-68c8-51e9-b37c-55105b547ee9'),
('f2a77f57-f582-b016-d8f1-55105b8e5416', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f19d80d3-951e-084a-429b-55105b0cb4c4'),
('f2e02910-b939-11de-4169-55105b7f76c3', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f1d9b5c3-fceb-f001-7f68-55105b34871d'),
('f2ea5f67-baca-f905-ecdc-55105b9b5ae0', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f2043ebe-0572-312a-be40-55105b8e714c'),
('f2fa74e7-1ed2-0c0a-7706-55105be611dc', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f1f252ba-0764-b27f-e49a-55105b31e78c'),
('f35d33ab-2414-9ae4-5e75-55105b9403d1', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f2442242-18ac-e2f4-5fcc-55105bc6d9b1'),
('f3a58519-ecb1-64e6-c7c0-55105b531098', '2015-03-23 18:27:57', 0, '292c792a-8762-2415-1a8f-550ef86b2e5a', 'f19fe2e2-2b61-b393-8ecf-55105b825aaf');

-- --------------------------------------------------------

--
-- Table structure for table `yo_county`
--

CREATE TABLE IF NOT EXISTS `yo_county` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `assessors_address` varchar(255) DEFAULT NULL,
  `assessors_address_city` varchar(255) DEFAULT NULL,
  `assessors_address_country` varchar(255) DEFAULT NULL,
  `assessors_address_postalcode` varchar(255) DEFAULT NULL,
  `assessors_address_state_c` varchar(255) DEFAULT NULL,
  `assessors_hours` varchar(255) DEFAULT NULL,
  `assessors_office_phone` varchar(255) DEFAULT NULL,
  `assessors_office_url` varchar(255) DEFAULT NULL,
  `community_development_phone` varchar(255) DEFAULT NULL,
  `community_development_url` varchar(255) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `gis_phone` varchar(255) DEFAULT NULL,
  `gismap` varchar(255) DEFAULT NULL,
  `recorders_address` varchar(255) DEFAULT NULL,
  `recorders_address_city` varchar(255) DEFAULT NULL,
  `recorders_address_country` varchar(255) DEFAULT NULL,
  `recorders_address_postalcode` varchar(255) DEFAULT NULL,
  `recorders_address_state` varchar(255) DEFAULT NULL,
  `recorders_hours` varchar(255) DEFAULT NULL,
  `recorders_phone` varchar(255) DEFAULT NULL,
  `recorders_url` varchar(255) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `treasurer_hours` varchar(255) DEFAULT NULL,
  `treasurer_phone` varchar(255) DEFAULT NULL,
  `treasurer_website` varchar(255) DEFAULT NULL,
  `treasurer_address` varchar(255) DEFAULT NULL,
  `treasurer_address_city` varchar(255) DEFAULT NULL,
  `treasurer_address_country` varchar(255) DEFAULT NULL,
  `treasurer_address_postalcode` varchar(255) DEFAULT NULL,
  `treasurer_address_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yo_county`
--

INSERT INTO `yo_county` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `assessors_address`, `assessors_address_city`, `assessors_address_country`, `assessors_address_postalcode`, `assessors_address_state_c`, `assessors_hours`, `assessors_office_phone`, `assessors_office_url`, `community_development_phone`, `community_development_url`, `county`, `gis_phone`, `gismap`, `recorders_address`, `recorders_address_city`, `recorders_address_country`, `recorders_address_postalcode`, `recorders_address_state`, `recorders_hours`, `recorders_phone`, `recorders_url`, `state`, `treasurer_hours`, `treasurer_phone`, `treasurer_website`, `treasurer_address`, `treasurer_address_city`, `treasurer_address_country`, `treasurer_address_postalcode`, `treasurer_address_state`) VALUES
('a8f527e4-2919-4331-11a1-550ec0f844b1', 'qweqweqwe', '2015-03-22 13:13:58', '2015-03-22 13:13:58', '1', '1', NULL, 0, NULL, '', '', NULL, '', '', '', '', 'http://', '', 'http://', NULL, '', 'http://gis.co.apache.az.us/mapserver2014/mapviewerajax/?WEBLAYOUT=Library://Steve/Web+layouts/ApacheCounty.WebLayout&LOCALE=en&USERNAME=Anonymous', '', '', NULL, '', '', '', '', 'http://', 'Arizona', '', '', 'http://', '', '', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `yo_county_aos_products_c`
--

CREATE TABLE IF NOT EXISTS `yo_county_aos_products_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_county_aos_productsyo_county_ida` varchar(36) DEFAULT NULL,
  `yo_county_aos_productsaos_products_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_county_aos_products_ida1` (`yo_county_aos_productsyo_county_ida`),
  KEY `yo_county_aos_products_alt` (`yo_county_aos_productsaos_products_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_county_audit`
--

CREATE TABLE IF NOT EXISTS `yo_county_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_yo_county_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_county_campaigns_c`
--

CREATE TABLE IF NOT EXISTS `yo_county_campaigns_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_county_campaignsyo_county_ida` varchar(36) DEFAULT NULL,
  `yo_county_campaignscampaigns_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_county_campaigns_ida1` (`yo_county_campaignsyo_county_ida`),
  KEY `yo_county_campaigns_alt` (`yo_county_campaignscampaigns_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_county_contacts_c`
--

CREATE TABLE IF NOT EXISTS `yo_county_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_county_contactsyo_county_ida` varchar(36) DEFAULT NULL,
  `yo_county_contactscontacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_county_contacts_ida1` (`yo_county_contactsyo_county_ida`),
  KEY `yo_county_contacts_alt` (`yo_county_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_county_leads_c`
--

CREATE TABLE IF NOT EXISTS `yo_county_leads_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_county_leadsyo_county_ida` varchar(36) DEFAULT NULL,
  `yo_county_leadsleads_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_county_leads_ida1` (`yo_county_leadsyo_county_ida`),
  KEY `yo_county_leads_alt` (`yo_county_leadsleads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_investingentity`
--

CREATE TABLE IF NOT EXISTS `yo_investingentity` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(255) DEFAULT NULL,
  `address_country` varchar(255) DEFAULT NULL,
  `address_postalcode` varchar(255) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_investingentity_aos_products_c`
--

CREATE TABLE IF NOT EXISTS `yo_investingentity_aos_products_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_investingentity_aos_productsyo_investingentity_ida` varchar(36) DEFAULT NULL,
  `yo_investingentity_aos_productsaos_products_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_investingentity_aos_products_ida1` (`yo_investingentity_aos_productsyo_investingentity_ida`),
  KEY `yo_investingentity_aos_products_alt` (`yo_investingentity_aos_productsaos_products_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_investingentity_audit`
--

CREATE TABLE IF NOT EXISTS `yo_investingentity_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_yo_investingentity_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_investingentity_campaigns_c`
--

CREATE TABLE IF NOT EXISTS `yo_investingentity_campaigns_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_investingentity_campaignsyo_investingentity_ida` varchar(36) DEFAULT NULL,
  `yo_investingentity_campaignscampaigns_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_investingentity_campaigns_ida1` (`yo_investingentity_campaignsyo_investingentity_ida`),
  KEY `yo_investingentity_campaigns_alt` (`yo_investingentity_campaignscampaigns_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_investingentity_leads_c`
--

CREATE TABLE IF NOT EXISTS `yo_investingentity_leads_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_investingentity_leadsyo_investingentity_ida` varchar(36) DEFAULT NULL,
  `yo_investingentity_leadsleads_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_investingentity_leads_ida1` (`yo_investingentity_leadsyo_investingentity_ida`),
  KEY `yo_investingentity_leads_alt` (`yo_investingentity_leadsleads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_marketing`
--

CREATE TABLE IF NOT EXISTS `yo_marketing` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `analytics` varchar(1024) DEFAULT NULL,
  `analytics_reviewed` date DEFAULT NULL,
  `available_for_sale` date DEFAULT NULL,
  `credit_check` varchar(100) DEFAULT NULL,
  `doc_prep_fee` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_of_month` varchar(255) DEFAULT NULL,
  `down_payment` decimal(26,6) DEFAULT NULL,
  `featured` date DEFAULT NULL,
  `google_analytics` varchar(255) DEFAULT NULL,
  `interest_rate` varchar(255) DEFAULT NULL,
  `landwatch` date DEFAULT NULL,
  `authorize_profile` varchar(100) DEFAULT NULL,
  `list_price` decimal(26,6) DEFAULT NULL,
  `listing_title` varchar(255) DEFAULT NULL,
  `listing_url` varchar(1024) DEFAULT NULL,
  `monthly_payment` decimal(26,6) DEFAULT NULL,
  `page_visits` varchar(255) DEFAULT NULL,
  `pictures` varchar(1024) DEFAULT NULL,
  `postlets` date DEFAULT NULL,
  `pre_payment_penalty` varchar(100) DEFAULT NULL,
  `sold` date DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  `subscribers_emailed` date DEFAULT NULL,
  `zillow` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_marketing_aos_products_c`
--

CREATE TABLE IF NOT EXISTS `yo_marketing_aos_products_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_marketing_aos_productsaos_products_ida` varchar(36) DEFAULT NULL,
  `yo_marketing_aos_productsyo_marketing_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_marketing_aos_products_ida1` (`yo_marketing_aos_productsaos_products_ida`),
  KEY `yo_marketing_aos_products_alt` (`yo_marketing_aos_productsyo_marketing_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_marketing_audit`
--

CREATE TABLE IF NOT EXISTS `yo_marketing_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_yo_marketing_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_marketing_tasks_c`
--

CREATE TABLE IF NOT EXISTS `yo_marketing_tasks_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_marketing_tasksyo_marketing_ida` varchar(36) DEFAULT NULL,
  `yo_marketing_taskstasks_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_marketing_tasks_ida1` (`yo_marketing_tasksyo_marketing_ida`),
  KEY `yo_marketing_tasks_alt` (`yo_marketing_taskstasks_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_marketing_yo_investingentity_c`
--

CREATE TABLE IF NOT EXISTS `yo_marketing_yo_investingentity_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_marketing_yo_investingentityyo_investingentity_ida` varchar(36) DEFAULT NULL,
  `yo_marketing_yo_investingentityyo_marketing_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_marketing_yo_investingentity_ida1` (`yo_marketing_yo_investingentityyo_investingentity_ida`),
  KEY `yo_marketing_yo_investingentity_alt` (`yo_marketing_yo_investingentityyo_marketing_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_sales`
--

CREATE TABLE IF NOT EXISTS `yo_sales` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `automatic_payments` tinyint(1) DEFAULT '0',
  `cash_terms` varchar(100) DEFAULT NULL,
  `competion_of_forfeiture` date DEFAULT NULL,
  `purchase_price` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `late_payment_date` varchar(255) DEFAULT NULL,
  `down_payment` decimal(26,6) DEFAULT NULL,
  `equity` varchar(255) DEFAULT NULL,
  `interest_rate` varchar(255) DEFAULT NULL,
  `living_on_property` tinyint(1) DEFAULT '0',
  `monthly_payment` decimal(26,6) DEFAULT NULL,
  `contract_name` varchar(255) DEFAULT NULL,
  `notice_of_forfeiture_mailed` date DEFAULT NULL,
  `paid_off` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `property_taxes` decimal(26,6) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `total_paid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yo_sales`
--

INSERT INTO `yo_sales` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `automatic_payments`, `cash_terms`, `competion_of_forfeiture`, `purchase_price`, `currency_id`, `late_payment_date`, `down_payment`, `equity`, `interest_rate`, `living_on_property`, `monthly_payment`, `contract_name`, `notice_of_forfeiture_mailed`, `paid_off`, `payment_date`, `property_taxes`, `purchase_date`, `total_paid`) VALUES
('292c792a-8762-2415-1a8f-550ef86b2e5a', '--', '2015-03-22 17:13:38', '2015-03-23 18:27:49', '1', '1', NULL, 0, '1', 0, NULL, NULL, '10000.000000', '', NULL, '2000.000000', '20%', '4', 0, '500.000000', NULL, NULL, NULL, NULL, '2.000000', '2015-03-23', '2000'),
('c7b3da21-95f0-1701-5adf-550f05387255', '--', '2015-03-22 18:11:08', '2015-03-22 18:11:08', '1', '1', '', 0, '1', 0, '', NULL, '0.000000', NULL, '', '0.000000', '0%', '', 0, '0.000000', '', NULL, NULL, NULL, '0.000000', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `yo_sales_accounts_c`
--

CREATE TABLE IF NOT EXISTS `yo_sales_accounts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_sales_accountsaccounts_ida` varchar(36) DEFAULT NULL,
  `yo_sales_accountsyo_sales_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_sales_accounts_ida1` (`yo_sales_accountsaccounts_ida`),
  KEY `yo_sales_accounts_alt` (`yo_sales_accountsyo_sales_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_sales_aos_products_c`
--

CREATE TABLE IF NOT EXISTS `yo_sales_aos_products_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_sales_aos_productsyo_sales_ida` varchar(36) DEFAULT NULL,
  `yo_sales_aos_productsaos_products_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_sales_aos_products_ida1` (`yo_sales_aos_productsyo_sales_ida`),
  KEY `yo_sales_aos_products_idb2` (`yo_sales_aos_productsaos_products_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_sales_audit`
--

CREATE TABLE IF NOT EXISTS `yo_sales_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_yo_sales_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yo_sales_audit`
--

INSERT INTO `yo_sales_audit` (`id`, `parent_id`, `date_created`, `created_by`, `field_name`, `data_type`, `before_value_string`, `after_value_string`, `before_value_text`, `after_value_text`) VALUES
('c2fb7add-b609-5f5e-dec5-55105b70b8d4', '292c792a-8762-2415-1a8f-550ef86b2e5a', '2015-03-23 18:27:49', '1', 'down_payment', 'currency', '20000.000000', '2000', NULL, NULL),
('d09415fa-d3fa-f7a1-b805-55105baecfd3', '292c792a-8762-2415-1a8f-550ef86b2e5a', '2015-03-23 18:27:49', '1', 'equity', 'varchar', '200%', '20%', NULL, NULL),
('d89ff5cf-c12c-ed11-8986-55105b09e059', '292c792a-8762-2415-1a8f-550ef86b2e5a', '2015-03-23 18:27:49', '1', 'monthly_payment', 'currency', '0.000000', '500', NULL, NULL),
('e39b91e3-3459-997e-cbb9-55105bff9637', '292c792a-8762-2415-1a8f-550ef86b2e5a', '2015-03-23 18:27:49', '1', 'purchase_date', 'date', NULL, '2015-03-23', NULL, NULL),
('ee28c28f-5161-807e-631c-55105bc25a2b', '292c792a-8762-2415-1a8f-550ef86b2e5a', '2015-03-23 18:27:49', '1', 'total_paid', 'varchar', '20000', '2000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `yo_sales_tasks_c`
--

CREATE TABLE IF NOT EXISTS `yo_sales_tasks_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_sales_tasksyo_sales_ida` varchar(36) DEFAULT NULL,
  `yo_sales_taskstasks_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_sales_tasks_alt` (`yo_sales_tasksyo_sales_ida`,`yo_sales_taskstasks_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_sales_yo_investingentity_c`
--

CREATE TABLE IF NOT EXISTS `yo_sales_yo_investingentity_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_sales_yo_investingentityyo_investingentity_ida` varchar(36) DEFAULT NULL,
  `yo_sales_yo_investingentityyo_sales_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_sales_yo_investingentity_ida1` (`yo_sales_yo_investingentityyo_investingentity_ida`),
  KEY `yo_sales_yo_investingentity_alt` (`yo_sales_yo_investingentityyo_sales_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_subdivisions`
--

CREATE TABLE IF NOT EXISTS `yo_subdivisions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `elevation` varchar(255) DEFAULT NULL,
  `manufactured_homes` varchar(255) DEFAULT NULL,
  `poa` varchar(255) DEFAULT NULL,
  `poa_website` varchar(255) DEFAULT NULL,
  `property_use_1` varchar(100) DEFAULT NULL,
  `property_use_2` varchar(100) DEFAULT NULL,
  `property_use_3_c` varchar(100) DEFAULT NULL,
  `property_use_4` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `state_region` varchar(100) DEFAULT NULL,
  `subdivision_camping` varchar(100) DEFAULT NULL,
  `subdivision_power` varchar(100) DEFAULT NULL,
  `subdivision_sewer` varchar(100) DEFAULT NULL,
  `subdivision_water` varchar(100) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `zoning` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yo_subdivisions`
--

INSERT INTO `yo_subdivisions` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `county`, `elevation`, `manufactured_homes`, `poa`, `poa_website`, `property_use_1`, `property_use_2`, `property_use_3_c`, `property_use_4`, `state`, `state_region`, `subdivision_camping`, `subdivision_power`, `subdivision_sewer`, `subdivision_water`, `zip_code`, `zoning`) VALUES
('9530ee91-8999-2a2e-7641-550ebbf28d79', 'test', '2015-03-22 12:55:08', '2015-03-22 12:55:08', '1', '1', '', 0, '1', 'Arizona_Apache', 'qweqweqweqw', '', NULL, NULL, 'LongTermLiving_CreativeHousing', 'LongTermLiving_OffGridLiving', 'LongTermLiving_ManufacturedHomes', 'LongTermLiving_SiteBuiltHomes', 'Arizona', 'North_East_Arizona', 'Allowed', 'Solar_Generator', 'Septic', 'Water_haul', '12344', '');

-- --------------------------------------------------------

--
-- Table structure for table `yo_subdivisions_aos_products_c`
--

CREATE TABLE IF NOT EXISTS `yo_subdivisions_aos_products_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_subdivisions_aos_productsyo_subdivisions_ida` varchar(36) DEFAULT NULL,
  `yo_subdivisions_aos_productsaos_products_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_subdivisions_aos_products_ida1` (`yo_subdivisions_aos_productsyo_subdivisions_ida`),
  KEY `yo_subdivisions_aos_products_alt` (`yo_subdivisions_aos_productsaos_products_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_subdivisions_audit`
--

CREATE TABLE IF NOT EXISTS `yo_subdivisions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_yo_subdivisions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `yo_subdivisions_campaigns_c`
--

CREATE TABLE IF NOT EXISTS `yo_subdivisions_campaigns_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `yo_subdivisions_campaignsyo_subdivisions_ida` varchar(36) DEFAULT NULL,
  `yo_subdivisions_campaignscampaigns_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yo_subdivisions_campaigns_ida1` (`yo_subdivisions_campaignsyo_subdivisions_ida`),
  KEY `yo_subdivisions_campaigns_alt` (`yo_subdivisions_campaignscampaigns_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
