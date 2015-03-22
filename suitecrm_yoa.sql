/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : suitecrm_yoa

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-03-22 01:14:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
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

-- ----------------------------
-- Records of accounts
-- ----------------------------

-- ----------------------------
-- Table structure for `accounts_audit`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_audit`;
CREATE TABLE `accounts_audit` (
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

-- ----------------------------
-- Records of accounts_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `accounts_bugs`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_bugs`;
CREATE TABLE `accounts_bugs` (
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

-- ----------------------------
-- Records of accounts_bugs
-- ----------------------------

-- ----------------------------
-- Table structure for `accounts_cases`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_cases`;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounts_cases
-- ----------------------------

-- ----------------------------
-- Table structure for `accounts_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_contacts`;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounts_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `accounts_cstm`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_cstm`;
CREATE TABLE `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounts_cstm
-- ----------------------------

-- ----------------------------
-- Table structure for `accounts_opportunities`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_opportunities`;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounts_opportunities
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_actions`
-- ----------------------------
DROP TABLE IF EXISTS `acl_actions`;
CREATE TABLE `acl_actions` (
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

-- ----------------------------
-- Records of acl_actions
-- ----------------------------
INSERT INTO `acl_actions` VALUES ('10210c8b-2923-31ec-fc24-550dc483aac5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOP_Case_Events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('11057ee3-f033-b72a-af30-550dc22d7075', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Cases', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('116b9bab-5be1-51e2-bfa2-550dc3386bd3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Contacts', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('1181c001-da31-06af-b641-550dc3bb3021', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'ProspectLists', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('11e165f1-8e22-eabc-cae2-550dc29cbfae', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Bugs', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('126ee357-bc65-5269-a7f8-550dc34aa664', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Quotes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('12c2611f-43c7-d550-f54c-550dc34a376e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Invoices', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('13436036-d0d6-5763-5872-550dc283cd98', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Users', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('158c2e47-ba70-6dd1-a54f-550dc3c61fcc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Calls', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('1682f67a-0082-7784-588e-550dc4a8e884', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'FP_events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('17873e52-4c11-e525-3cac-550dc43ab87f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOP_Case_Updates', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('18f3228f-b1f8-900f-1a1b-550dc3b2fa93', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Product_Categories', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1a87c008-b724-db7e-025e-550dc3061381', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Products', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1a9c89e4-2f35-b0cd-0ec7-550dc268c98c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Users', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1b362719-21c9-3215-e60e-550dc3788390', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'EmailTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1b3d906d-08b5-b677-fbb0-550dc24c102c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Leads', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1bf2d355-5da4-e9ed-1e42-550dc37ca172', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Campaigns', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('1c121df7-8e64-4536-c95f-550dc35d57cc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Campaigns', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1cf5074d-2918-678d-e382-550dc4d1404f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AM_ProjectHolidays', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1d91c05a-d2b5-1f1d-2ccf-550dc3071784', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Campaigns', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1e1c17d5-a5b6-6d35-19fd-550dc3e52f3f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'EmailMarketing', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1ec9c918-e424-0334-9e33-550dc3ba2da0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Tasks', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('1f221c51-9bd4-8c60-28cc-550dc354739f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Meetings', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('21354c5c-3daa-efa6-2357-550dc4a23872', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'jjwg_Maps', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2196eecd-3a12-1a41-6517-550dc25713aa', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'ProjectTask', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('21be4d84-0f06-8e08-e0a2-550dc3eb5cf6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Tasks', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2228a178-d00b-30a3-44ad-550dc379b30c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'EAPM', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('224b03a1-fe69-2b7e-d7d5-550dc3c29bb8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Contacts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('22ac3272-9e4b-90fa-3106-550dc4d79735', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'jjwg_Areas', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2337cae4-c7d4-4713-dcd3-550dc35241be', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Documents', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('2534ab7a-4fac-67b1-f971-550dc49caf9f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AM_ProjectTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('265d37ce-a046-7143-f498-550dc3283967', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOR_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('26653913-051b-ae0f-764e-550dc2a3fd44', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Bugs', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2745d1bd-71fd-8423-b234-550dc490e9f2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AM_ProjectTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('280579d3-08e4-6011-7ff5-550dc3ba421f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Contracts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('28959a47-bbdb-4277-a37d-550dc3cfb0be', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Contacts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2b21a4e1-23c7-f669-2e16-550dc3ec9728', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'EmailMarketing', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2c579a99-8a5a-89c9-de80-550dc450eaa6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOP_Case_Updates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2cfc4012-364d-a953-16a5-550dc3c8e9fc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Notes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2d2bbf36-4799-42d6-6092-550dc3e6907a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Quotes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2e6de4e5-c3ac-d0c7-10e8-550dc30012ea', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Prospects', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2e82451d-021b-6f69-609c-550dc479fb1d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOD_IndexEvent', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2ebe1739-4d7c-d84e-5e6a-550dc30d3cb6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Contracts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2ecd2778-50de-44d2-39e4-550dc27a233a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Users', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2edf8f87-286a-43b0-4e81-550dc38f5c88', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'ProspectLists', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2f52a235-7357-86c2-a27f-550dc3fe3de8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Products', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('2f54b66e-6979-a348-1f2b-550dc3f20dac', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Invoices', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('33000b5a-930a-91ca-5a20-550dc30e227b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOW_WorkFlow', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('33aaacd3-9dc3-1e78-097b-550dc363db19', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'ProspectLists', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('344ab1ff-2c7f-8637-6455-550dc30b7af9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Accounts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('34990376-d884-b80a-5081-550dc2ba5ac2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'ProjectTask', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('352007a7-1e25-e3ba-85ee-550dc3ef939e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'ProspectLists', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3526c58f-ef84-25df-ffed-550dc2dbe425', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'ProjectTask', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3561daf9-6537-e952-af6e-550dc40fc6f7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'jjwg_Markers', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('35740e58-3fe6-aa94-c2c5-550dc4131efc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOD_Index', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3576dc77-411c-9292-ece0-550dc323db2b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Calls_Reschedule', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('358d4196-5a28-4619-2ace-550dc4049eb9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AM_ProjectHolidays', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('36ac9793-2e6e-c663-cebb-550dc39a414c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Notes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('372a0119-4152-a6e9-f162-550dc3031809', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOW_Processed', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3763f7ca-bc56-accb-abe9-550dc30ecfa6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'EmailTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('382731a9-2b94-385c-38c5-550dc324ce95', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Meetings', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('383239b5-d7a4-598d-bdcd-550dc47cca42', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOP_Case_Events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('38d6cf4c-2b2b-a2da-addb-550dc46ee11f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOD_IndexEvent', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('394de84a-5389-246c-8ffd-550dc43e9c59', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOR_Scheduled_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3a2da711-c9df-ea98-5471-550dc4b63c67', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOD_IndexEvent', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3a81ff80-5b82-d67d-bb1e-550dc43e0d23', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOP_Case_Events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3adae18c-b44d-738b-ceb1-550dc3ed1b03', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOW_Processed', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3adf30d8-2dd5-515d-0196-550dc28580a2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Users', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3b437c42-c682-7ec0-8ba9-550dc494afc7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AM_TaskTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3b60e4d4-032a-9bfb-5a99-550dc4c9f5c5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AM_TaskTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3b80c703-2f08-1fee-e552-550dc4d389a4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOD_IndexEvent', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3bf7a6be-ad46-5690-4556-550dc4bfd54e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'FP_events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3e38d884-b145-0275-c19f-550dc367c432', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Accounts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3eb01e07-fc7c-8518-edbd-550dc30701d4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOW_Processed', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3eba138e-05ea-a595-b078-550dc488c2a3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'FP_Event_Locations', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3ec7905c-2e94-7f51-a923-550dc3e89bde', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOW_WorkFlow', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('3fc81a78-1416-aa15-c166-550dc456902a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'FP_Event_Locations', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('3fd12936-e635-5aa7-5940-550dc496666e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOR_Scheduled_Reports', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('409efde2-9297-accb-1b07-550dc4a8602d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'SecurityGroups', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('40f4f2a3-c092-76db-6630-550dc3ac42dd', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Tasks', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('41f72780-950f-cd4b-f9ef-550dc3ec1878', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Opportunities', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('426c4902-e266-9212-3c26-550dc2e03a57', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Bugs', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('429b01f5-96f8-22a7-dcbe-550dc310f20c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Tasks', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('42a3abff-7091-7ade-9734-550dc2869ef5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Cases', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('42db9755-8d78-7af8-5295-550dc39677e1', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'EAPM', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('430bfb7d-7274-7445-4ffa-550dc3c9945d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Calls', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('4347d0ea-991b-a8e5-cca3-550dc4193647', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'jjwg_Markers', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('43c812b5-b2a4-0d4e-1d7a-550dc331bd65', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Prospects', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('44ad6c09-1817-08aa-cbb2-550dc37b53c9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_PDF_Templates', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('459d0c6f-6663-d426-d0d4-550dc3d483ab', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOW_WorkFlow', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('45a4f43f-0dcd-ae6c-576f-550dc4597c4d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOD_IndexEvent', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('463cc62e-5a8b-60ed-cd75-550dc3977071', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Meetings', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('463f6ef7-94ab-d78f-7e27-550dc3e2d7f3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOW_WorkFlow', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('46545fad-61cf-db86-5260-550dc3ef67cd', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Campaigns', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('46b8f69f-c68c-04e3-a108-550dc390289f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Tasks', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('46f1b850-7037-193b-dd00-550dc3cf96d4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Emails', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('472afaad-4f3c-8b77-d843-550dc376be25', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Contracts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('476037f7-6256-bce6-0324-550dc39713f9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Campaigns', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('4772b313-b975-01fe-d7cd-550dc32440df', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Documents', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('478ddced-9da6-a579-d6a6-550dc4a93c27', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'FP_events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('486822e5-4e7c-f4c9-acec-550dc376b8c7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Emails', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('4903732e-17c2-7530-5f4c-550dc3e2b633', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Contacts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('496c7c06-dbff-82a1-7903-550dc377bd96', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'EAPM', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('49870670-68a6-7398-2022-550dc30ef687', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Campaigns', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('4ac85569-bcbc-9fb6-7eb2-550dc302a192', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Documents', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('4b1f9b57-2ce1-e45b-b7d6-550dc3a8bd4c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_PDF_Templates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('4bd8158e-8e0a-f6f2-cf31-550dc41cba9d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'jjwg_Address_Cache', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('4c049117-171f-89db-779c-550dc397251e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOR_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('4c262314-ef92-f95d-f07e-550dc3aa578b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Prospects', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('4d1cad69-f4a8-cbf3-852f-550dc4882517', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOP_Case_Events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('50680108-b74b-5567-62f6-550dc38bea0f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Opportunities', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('507017f2-a440-cb89-acaf-550dc3d484d6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Quotes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('50b2bb77-a863-4a5e-c6d0-550dc4f854d8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AM_ProjectTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5176999e-8364-7495-d17b-550dc2a00af2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Cases', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('51850a32-4292-2ea5-4f09-550dc3262274', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_PDF_Templates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5294e291-3e85-d6eb-6c27-550dc39bbbff', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Opportunities', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('53192335-ef16-97ab-167c-550dc3f41cc3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'ProspectLists', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('53453594-ab6e-b7ba-c9ba-550dc4a6b349', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'SecurityGroups', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('53719719-007e-2efc-1c64-550dc3441bac', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Calls', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('538905e7-d9f6-5c40-f11f-550dc40627f6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'SecurityGroups', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('55f22e8c-5230-f7cb-16e0-550dc4f92eac', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AM_TaskTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('566c5515-79d2-d43d-0d91-550dc375e8f0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'EmailMarketing', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('56a20275-010e-911f-adbe-550dc4b597f9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'jjwg_Areas', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('571bd682-c5d8-4206-ce42-550dc3fb272f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'EAPM', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('576aabc3-f6c3-f748-07d4-550dc4492e40', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOD_IndexEvent', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('587b0304-1e12-5608-b8ff-550dc41f4a4c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOD_Index', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('58bbd7c6-a278-dc57-f918-550dc414b394', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'jjwg_Maps', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('58eaf1b9-0b13-9738-91a4-550dc20c061c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Bugs', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5995b51d-221e-501b-28a2-550dc3cecf0b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'EmailTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('59e07bc5-5f05-a7d2-1a1e-550dc376fb2a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Emails', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5b8cb3d8-cf3b-15e7-885c-550dc3ce1955', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Calls_Reschedule', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5cd0cd60-fbe3-ec4f-75d9-550dc4542f95', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AM_ProjectHolidays', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5d03b754-bdd1-30dd-e466-550dc30288f8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Calls_Reschedule', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5d20ae0f-0cff-a781-b7af-550dc38381f2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Campaigns', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5d7c6f3c-0b54-9f7b-3e43-550dc424752c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOP_Case_Updates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5dfec1eb-5ac7-7aba-ae0e-550dc3517385', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Invoices', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5e799088-b9c9-443e-0ab3-550dc39d2b51', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOW_Processed', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5ec1b84b-f48a-e176-1f41-550dc46794f4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'SecurityGroups', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('5f0b409b-adfe-0483-4f00-550dc3970405', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Contracts', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('5fffc10b-53b3-4677-f3a8-550dc24bcef3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Users', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('61bc93a0-ff46-8342-325f-550dc3b4b825', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Meetings', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('61f6f58d-b735-0140-8f67-550dc44d6a84', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'jjwg_Address_Cache', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('630dc734-97cf-4348-f3c6-550dc2ff9ff8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Project', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('63dd05a8-828a-25d6-8a44-550dc35339e7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Emails', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('649e6178-7774-c2e2-25cf-550dc31343ad', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOR_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('64dca2c3-0746-e41c-7493-550dc3a22472', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Product_Categories', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('659b6c38-852e-b60d-0cc6-550dc26ae037', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Project', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('66cb67b2-b354-5d72-41ae-550dc47ac130', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AM_TaskTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('66d69e23-c4c6-8a8c-c667-550dc41fa335', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOD_Index', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6768dfdb-8e34-c4c9-61e5-550dc3ddb303', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOW_Processed', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('684dc017-436e-5370-2a44-550dc469c815', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AM_ProjectTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('68618761-7a1d-b8dc-4d54-550dc374d3e7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Quotes', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('6981b8b1-2038-a3e7-7e07-550dc3df8860', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Accounts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('698c09ec-ddd5-2384-e99e-550dc4a2afea', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOD_IndexEvent', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('69d470e6-7ad2-6e06-f211-550dc3a2b4d6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOW_WorkFlow', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('69f8a569-d291-a5ae-ebe6-550dc2795d01', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Project', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6b8ec8a9-9953-2a08-09ec-550dc25aeb5b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Leads', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6be65d40-ce93-9a9a-9074-550dc3fef05f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_PDF_Templates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6c11edf2-8f9e-e0c8-0d59-550dc4819f9e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOP_Case_Events', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('6cd862ad-a3c0-009c-f4cc-550dc3f9a7d9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'ProspectLists', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('6d1f570c-1cfb-e86b-1849-550dc44a0f4c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'jjwg_Areas', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('6da26537-5d00-9bc4-50b4-550dc4980725', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOR_Scheduled_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6ddc5199-5179-f95d-f538-550dc3569d42', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Documents', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6e4f4395-556d-a0a0-c6ca-550dc459d10a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'FP_Event_Locations', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6e592be3-d5eb-188c-f711-550dc4d47ba8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'FP_Event_Locations', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('6e7db3f1-37a2-cdb8-7f0a-550dc2670764', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Cases', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6f48d5da-c9ee-0cfc-1d90-550dc38808f9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Product_Categories', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('6fd6ab1c-233d-771d-6fff-550dc3bbf7de', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Contacts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('708bfb92-b9ec-33f4-e631-550dc485f18d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'FP_events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7102df70-e3d5-6cda-8955-550dc306efd3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'EmailMarketing', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('724768ec-1168-78f7-18a0-550dc40e5de8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOR_Scheduled_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7297b8b9-597a-506b-4a3c-550dc2986370', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Leads', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7346a698-9211-c514-1029-550dc407a8ef', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'jjwg_Markers', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('745b985c-b4d8-3ab7-02f6-550dc32ee210', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Invoices', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('760aafb2-54e7-368e-ae0a-550dc21943e5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Cases', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('760c1409-8808-e5ae-ea26-550dc4900f2e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'jjwg_Address_Cache', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('772f1b7d-3e03-32ea-bce5-550dc3f9088f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Products', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('77652b73-2d12-c2f5-e9b3-550dc435fce8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOP_Case_Events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('77d790f8-4289-44b6-9e76-550dc373508b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Notes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('77f40760-ee69-1a99-df7b-550dc38cb6d6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Tasks', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('79ba1e16-1da6-5811-9c2c-550dc367a5be', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'EmailTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7a870623-564c-d573-7bd6-550dc4104064', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AM_TaskTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7b291f8c-5e32-e21a-a736-550dc4fadfa3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'FP_events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7c355fa5-9bdb-452f-19ee-550dc4b3c1c2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'jjwg_Address_Cache', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7c974872-f64d-2958-2145-550dc3669bbb', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Notes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7d6e536a-0594-f924-94f0-550dc48cb0d7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'jjwg_Maps', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7d86423c-24e0-f74b-c7ab-550dc4f4fb0f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AM_ProjectHolidays', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7e0d9409-ad38-c441-8e38-550dc4859798', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOP_Case_Updates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7e29ae1d-4c6e-a127-32d6-550dc3509951', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Accounts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('7f2b130b-4330-0a2d-ddb1-550dc3a4d2ac', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Tasks', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('80cb393b-3424-46aa-aaac-550dc309cfa5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOW_WorkFlow', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('81bb4730-c997-f188-f332-550dc4cf7df5', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AM_ProjectTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('820baed1-e21e-a8e5-2a82-550dc31ffd18', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Prospects', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('84019500-cc97-6886-8dff-550dc354e8c2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_Quotes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('847273dc-cc65-1512-f9bc-550dc3c7f14a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'ProspectLists', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('848d7a37-4eae-d24f-1974-550dc3bbfd96', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'EmailTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('861d1b40-9902-f8fa-8b0c-550dc40a12a8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'jjwg_Markers', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('87c208c3-ab7c-0ace-d3d8-550dc2b27cdf', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Bugs', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('87c7399f-447a-8f4f-685d-550dc3e0313d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Calls', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('88adb0ef-0690-61d1-668c-550dc3d733b4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Invoices', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('89a9bee2-61fa-8106-d280-550dc48651a8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOD_IndexEvent', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('8aaf0b65-4f54-7642-bc63-550dc455ce8d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'FP_Event_Locations', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8b430d96-7d7c-e8db-852c-550dc3b7dcd7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Calls_Reschedule', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8b8607f7-127e-e2eb-d0d9-550dc38aca01', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Notes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8bb55e98-6fda-a60a-00b1-550dc32eba15', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Calls_Reschedule', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8bba50a9-a5df-216a-ee5b-550dc3028296', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Products', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8c150375-72f6-ae63-c858-550dc4896c21', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AM_TaskTemplates', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('8c86ff2c-5fc3-848a-7748-550dc3f712d3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'EmailMarketing', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8d79641f-46b6-8c2d-caa1-550dc3e1cbff', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Contacts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8e05cc7e-063b-feb0-179a-550dc3d80c58', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'EmailMarketing', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8e3bdebf-dc2f-4a5d-3a03-550dc2a621a7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Cases', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('8f6ea167-246c-eca9-8ef0-550dc4e5f155', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'jjwg_Maps', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('90579949-7aac-5933-78a7-550dc3598025', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Calls', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('924d5829-4a43-1421-8b27-550dc36f5ca8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Meetings', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('93d62256-7dc0-2ecf-1e9e-550dc37945ce', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Accounts', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('93df11e9-4e9e-3df4-e738-550dc4fb9ebf', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'SecurityGroups', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('93e45699-7c20-29e0-0622-550dc21f5928', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'ProjectTask', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('95d2b1b5-faa2-1f6b-5b2e-550dc3631acb', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Opportunities', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('96975dc1-7911-b089-fbba-550dc4d0871c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AM_TaskTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9763830c-3650-acb2-5592-550dc3bbc4da', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Products', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('98080d69-63d1-e2c0-d5a9-550dc4bd81f7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOR_Scheduled_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('98262805-826f-b926-b62b-550dc4596f16', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'jjwg_Address_Cache', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('98dc7b73-c3b0-8ae6-f681-550dc45d7df0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AM_ProjectTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9912c199-1967-b75a-229b-550dc3c9e0b1', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'EAPM', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9948cf08-cbac-2acc-e256-550dc3360d9e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOW_Processed', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('99d427cd-aec6-9e62-18e4-550dc3a11f01', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Contracts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('99f36a85-860c-8d50-3131-550dc31f4e46', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'EAPM', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9a58b7e0-bdd4-6e84-52db-550dc3fdb887', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Prospects', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9a5ea7a2-6cba-4e22-1b75-550dc4233de9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'jjwg_Address_Cache', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9b18342b-c9ef-e403-60fe-550dc33457ae', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Documents', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9b94a0cf-fc35-c6ff-21d8-550dc4328648', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOD_Index', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9bdde347-40db-0fe3-3830-550dc43e102b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOD_Index', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9bfd3584-0e76-5c24-d179-550dc2b83f7f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Bugs', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9dbf9725-b317-a993-25ba-550dc4cd0a23', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'jjwg_Areas', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9ecb38e6-5b88-6b1f-cb72-550dc4193681', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'jjwg_Areas', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9edfd83c-8e98-983e-7ac8-550dc427a21c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'FP_Event_Locations', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('9fa2a87f-634d-bed4-9b71-550dc378e582', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Emails', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('a00de497-6844-fe60-345f-550dc38a144c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Emails', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a043d0c1-a428-0d92-62cb-550dc45a3839', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'SecurityGroups', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a191f273-5f56-d73d-6ef5-550dc4d8ff1b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AM_ProjectHolidays', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a3c95f87-a776-bd32-715c-550dc4896377', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'FP_events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a3e5b437-7d28-f53b-a144-550dc4733859', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'jjwg_Address_Cache', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a463be51-b543-0640-ad23-550dc49ebbd6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'jjwg_Markers', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a5b0d14e-cbe0-1d92-2c6f-550dc325d694', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Prospects', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a704941c-cb1f-e4ed-3003-550dc3747331', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_PDF_Templates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a7055476-e539-16f9-3c39-550dc304e595', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOR_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a7210f59-9990-3a99-07af-550dc3ab1b11', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_PDF_Templates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a7c5f512-93e4-1e4f-4c2e-550dc3c40596', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Opportunities', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('a8d210be-3660-2564-1cbc-550dc368d677', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOR_Reports', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('a952947a-ec79-80ab-6c76-550dc3c32d44', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOW_WorkFlow', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('aa67a818-f138-07f1-a4d3-550dc4cf5675', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'jjwg_Maps', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('aa8c99b8-ea47-e34a-170b-550dc4db4e92', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOP_Case_Events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('ac29da29-4599-2628-9ea8-550dc4ec9c84', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOP_Case_Updates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('acb67560-e8e5-f3e5-f548-550dc2e2c86f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Users', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('acb94d13-9fe7-d1c0-d7ee-550dc35d37ec', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Opportunities', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('aed17319-9edb-dc77-e847-550dc3be31b4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOR_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('af478c17-69de-08e1-b52e-550dc2bb7da0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Users', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('afc0d55b-62e1-694a-23b3-550dc3e88c80', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'EmailTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b047b61a-d019-c078-efbb-550dc3e3f4d3', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Contacts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b0d6981a-1852-2426-dfd7-550dc3527889', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Documents', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b1724698-4a22-8fc1-a84a-550dc45360d9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AM_ProjectHolidays', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b1dc3674-079f-7f0c-c905-550dc4fea6e0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'FP_events', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('b3aa66fe-417b-59a5-3e84-550dc2b42aff', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Project', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('b40f08d9-c3e3-f643-2c16-550dc352b29b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Invoices', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('b4d462a3-7fe7-c37e-ce3f-550dc4a8d626', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'jjwg_Address_Cache', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b5547dad-93a9-08c3-70fb-550dc25a0069', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'ProjectTask', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b5f11169-ae7d-c130-006d-550dc29d5509', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Leads', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b5ffea63-a9cd-8386-3c27-550dc3e74c26', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Quotes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b66d0526-e65c-4b03-94bf-550dc4a348cd', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'jjwg_Areas', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b735bce3-6ed5-efcd-a8b5-550dc349c598', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOW_Processed', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b88a6548-1992-573f-27f7-550dc2a9de7e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Leads', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('b9c99dbb-41cb-66b5-3236-550dc3a13be6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'AOS_Product_Categories', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('b9f9202b-f2f5-bb72-b4ab-550dc3790c58', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Contracts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('ba46eeea-db7d-842a-ad61-550dc4a92ccb', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOP_Case_Updates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('bb0c232e-8b40-e5f8-9370-550dc3823f39', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Meetings', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('bb1431af-5e23-a9fa-8910-550dc3bb49f0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Product_Categories', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('bdf14402-f231-e887-5e71-550dc3187cb6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Accounts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('be7c4b5e-4d35-c51f-94d8-550dc3fbfabc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Campaigns', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('be9fed4e-f46a-7ca3-4aa6-550dc32e0871', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Invoices', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('bec9b3b7-335a-2754-bc41-550dc43354dc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AM_ProjectTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('bf8e2e47-0f1e-a3ed-b047-550dc3e1f43f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOS_Product_Categories', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c1de0bb1-9df6-0255-b7b0-550dc4e549fa', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'FP_Event_Locations', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c26f7c60-cd4e-16df-6cd3-550dc38d0565', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Accounts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c27a56fc-19ae-399d-f0ed-550dc4828715', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'jjwg_Maps', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c30409aa-87a3-9fb9-dbce-550dc3f33d8c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOR_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c4170a7b-66bf-3d9d-52a7-550dc4af93a0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOD_Index', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('c518f402-64fe-b0eb-3aef-550dc3ae8bbe', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'ProspectLists', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c55e1d21-0a89-4e3a-2bfe-550dc2570420', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Project', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c5c100d3-4ca6-8620-a484-550dc264f6a6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Leads', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c6378619-24e2-8613-e74e-550dc4aa5351', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'jjwg_Markers', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c66956d4-1e79-15d3-e26d-550dc4242cb6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AM_TaskTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c674383a-5344-60bc-4478-550dc30cee93', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Meetings', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c6e35c68-5b69-8918-2b78-550dc37aebf7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Notes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c6f63f71-f0b5-e3fc-09ff-550dc3c7dfc9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Calls_Reschedule', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c7083a48-1ba1-22e6-aaeb-550dc2dc6016', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Leads', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c79238d4-7087-edff-0fa4-550dc4c09449', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'SecurityGroups', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('c7f10b57-1c8c-8062-1c67-550dc291a134', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Users', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c8000cd9-53ba-a533-c826-550dc4ff07d9', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOR_Scheduled_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c8e0bef4-fbec-7c5f-064f-550dc35da310', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Tasks', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c932e71a-7415-72b3-5d13-550dc3a34441', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'EmailMarketing', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('c9a307ae-6b46-2c6e-bdf0-550dc3a7506b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Prospects', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('ca735291-2045-e3ce-efcd-550dc4576897', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOD_Index', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('cb1119df-9492-0738-c5ac-550dc361c7c2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Notes', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('cb8b6110-b2bf-3439-06f1-550dc305ba55', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOW_WorkFlow', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('cc34e422-fcc1-78b4-bc25-550dc4cb551f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOR_Scheduled_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('cc3b45e0-5472-a6fa-3a9c-550dc35e9f49', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'EAPM', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('cc7d4326-2adc-8aa7-94bb-550dc421bef0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOD_Index', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('ce1a0405-3a59-b45a-5261-550dc4ca2e10', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'FP_Event_Locations', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('ce3223d9-de20-09df-e5d1-550dc396f40f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Calls', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('cf1d0212-d2aa-9e7a-1165-550dc33ddf29', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'EmailTemplates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d169fbf7-3837-0256-4cc2-550dc31a0c73', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Quotes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d1702085-41b0-2c17-238c-550dc3c91945', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOS_Products', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d239f2cf-5718-0097-54b2-550dc4464e7e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'jjwg_Areas', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d2a5deae-6129-7f0d-d05a-550dc3100f6c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Contacts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d3cc6ec1-27b6-fb6d-ed43-550dc3685927', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Invoices', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d469ac24-4685-5401-38ea-550dc44ad0b0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'jjwg_Markers', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d4c04595-2e77-8e3a-b647-550dc4d47763', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOP_Case_Events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d4c6c2b8-cbc5-22dc-cbea-550dc43aaae4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AM_ProjectHolidays', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('d5acbe86-e171-4086-1d49-550dc42251b1', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOR_Scheduled_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d5cfff28-ebc5-33da-776d-550dc3efe09d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'EmailTemplates', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('d6071bc3-7a61-e554-ed80-550dc3d0578d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'AOR_Reports', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d6ff67a1-c2cc-ca93-e74e-550dc3900b9d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'EmailMarketing', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d7560082-03e9-1e41-962d-550dc4b72701', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'jjwg_Markers', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d7fe3517-5b7e-7a10-797a-550dc2c62421', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Cases', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d8505e22-d29c-1b1c-eea6-550dc4e6146b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'FP_events', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('d8aa7290-7e8e-72a6-9449-550dc26a2150', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'ProjectTask', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('da7a162a-2211-c761-0aac-550dc47dfe40', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'AOP_Case_Updates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('dafec564-d904-bf94-03c7-550dc4b684d1', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'jjwg_Maps', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('dc2d03a0-e024-c19a-581d-550dc39dc11d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'AOS_PDF_Templates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('dc85b658-ef7d-2618-c976-550dc348c0a0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Calls_Reschedule', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('de27edd6-1512-351d-5616-550dc38755be', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Contracts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('de75a099-ff3a-ae16-1c61-550dc34be0f2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Notes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('de7e014b-259e-d555-4b08-550dc30165d2', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Documents', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('de8520a1-5a69-431f-57a6-550dc262fed7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Bugs', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('dea91d1e-6216-1972-6eda-550dc421cf11', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'jjwg_Maps', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('df2bd5e9-d76c-7a02-00b0-550dc48ab77e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'SecurityGroups', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('df9bf845-e7d3-5cd9-731b-550dc255c880', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Project', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('dff37231-70cf-38a9-8a3d-550dc2c722d7', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'Project', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e05d07fa-7dae-9718-a343-550dc3068e5c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'EAPM', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e14314e4-f228-bc40-babc-550dc33411b8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Calls_Reschedule', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e15adca7-7020-2df1-5624-550dc4562b6d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AM_ProjectHolidays', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e1b13442-33bc-4a56-a3ba-550dc3fba6e6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'ProjectTask', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e1b94263-6915-00de-4644-550dc39e2044', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Emails', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e2496d2b-d24a-357b-6ab8-550dc484cf00', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AM_ProjectTemplates', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('e323e3c2-20d5-f938-518f-550dc345756f', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'Opportunities', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('e342653a-91e8-0982-b2b7-550dc31c863b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOW_Processed', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e384ac45-3e29-04af-9943-550dc2f34d09', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Cases', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e4f454ee-d2cd-61dd-6fbb-550dc320de27', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOS_Products', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e53d5482-2d09-2f3a-96e0-550dc3ba89da', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'Emails', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e7a90aed-99de-c34b-ffd8-550dc3c7f41d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_Product_Categories', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e7cea3ab-336f-bc95-be02-550dc3b62569', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Contracts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e941c05a-b828-4bbf-374a-550dc3a701d8', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Documents', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('e9b3229f-fdf8-1557-b209-550dc328791d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Products', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('e9c49d38-ec0c-2b4d-43c3-550dc345a7c4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'access', 'AOS_Product_Categories', 'module', '89', '0');
INSERT INTO `acl_actions` VALUES ('ea3cc61a-15ea-0db6-105e-550dc2741f84', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Project', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('eb948ac8-b04d-7ff3-b9a7-550dc35dc5ea', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Calls', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('ecf7610f-08b3-00e1-a968-550dc32aa169', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'AOS_Quotes', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('ed3dd3d9-b4b4-2ce3-6220-550dc3dc77fc', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'import', 'Calls', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('ef99d8ed-cfa5-32f0-3339-550dc3e29f0b', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'edit', 'Prospects', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('efbc8c6a-bf38-3eca-c245-550dc4e96238', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'jjwg_Areas', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('f002db09-26d2-6c49-99b0-550dc3b7f775', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Accounts', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('f0857057-0d2b-ddb8-1844-550dc4ba5114', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'export', 'AOP_Case_Updates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('f09ee746-8579-c161-f13b-550dc21fa6ce', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'ProjectTask', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('f146fa04-ed01-d04f-172b-550dc363956a', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'massupdate', 'AOS_PDF_Templates', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('f2883776-a952-c3d3-d765-550dc34ffb1e', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Meetings', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('f3c41804-2621-c296-fb23-550dc2d01b50', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'view', 'Leads', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('f3e018c5-de07-342c-f5fa-550dc325211d', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'delete', 'Opportunities', 'module', '90', '0');
INSERT INTO `acl_actions` VALUES ('f9870343-3740-f4c5-f0c8-550dc2a47638', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '', 'list', 'Bugs', 'module', '90', '0');

-- ----------------------------
-- Table structure for `acl_roles`
-- ----------------------------
DROP TABLE IF EXISTS `acl_roles`;
CREATE TABLE `acl_roles` (
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

-- ----------------------------
-- Records of acl_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_roles_actions`
-- ----------------------------
DROP TABLE IF EXISTS `acl_roles_actions`;
CREATE TABLE `acl_roles_actions` (
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

-- ----------------------------
-- Records of acl_roles_actions
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_roles_users`
-- ----------------------------
DROP TABLE IF EXISTS `acl_roles_users`;
CREATE TABLE `acl_roles_users` (
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

-- ----------------------------
-- Records of acl_roles_users
-- ----------------------------

-- ----------------------------
-- Table structure for `address_book`
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_book
-- ----------------------------

-- ----------------------------
-- Table structure for `am_projectholidays`
-- ----------------------------
DROP TABLE IF EXISTS `am_projectholidays`;
CREATE TABLE `am_projectholidays` (
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

-- ----------------------------
-- Records of am_projectholidays
-- ----------------------------

-- ----------------------------
-- Table structure for `am_projectholidays_audit`
-- ----------------------------
DROP TABLE IF EXISTS `am_projectholidays_audit`;
CREATE TABLE `am_projectholidays_audit` (
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

-- ----------------------------
-- Records of am_projectholidays_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `am_projectholidays_project_c`
-- ----------------------------
DROP TABLE IF EXISTS `am_projectholidays_project_c`;
CREATE TABLE `am_projectholidays_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projectholidays_projectproject_ida` varchar(36) DEFAULT NULL,
  `am_projectholidays_projectam_projectholidays_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projectholidays_project_ida1` (`am_projectholidays_projectproject_ida`),
  KEY `am_projectholidays_project_alt` (`am_projectholidays_projectam_projectholidays_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of am_projectholidays_project_c
-- ----------------------------

-- ----------------------------
-- Table structure for `am_projecttemplates`
-- ----------------------------
DROP TABLE IF EXISTS `am_projecttemplates`;
CREATE TABLE `am_projecttemplates` (
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

-- ----------------------------
-- Records of am_projecttemplates
-- ----------------------------

-- ----------------------------
-- Table structure for `am_projecttemplates_audit`
-- ----------------------------
DROP TABLE IF EXISTS `am_projecttemplates_audit`;
CREATE TABLE `am_projecttemplates_audit` (
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

-- ----------------------------
-- Records of am_projecttemplates_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `am_projecttemplates_project_1_c`
-- ----------------------------
DROP TABLE IF EXISTS `am_projecttemplates_project_1_c`;
CREATE TABLE `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of am_projecttemplates_project_1_c
-- ----------------------------

-- ----------------------------
-- Table structure for `am_tasktemplates`
-- ----------------------------
DROP TABLE IF EXISTS `am_tasktemplates`;
CREATE TABLE `am_tasktemplates` (
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

-- ----------------------------
-- Records of am_tasktemplates
-- ----------------------------

-- ----------------------------
-- Table structure for `am_tasktemplates_am_projecttemplates_c`
-- ----------------------------
DROP TABLE IF EXISTS `am_tasktemplates_am_projecttemplates_c`;
CREATE TABLE `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of am_tasktemplates_am_projecttemplates_c
-- ----------------------------

-- ----------------------------
-- Table structure for `am_tasktemplates_audit`
-- ----------------------------
DROP TABLE IF EXISTS `am_tasktemplates_audit`;
CREATE TABLE `am_tasktemplates_audit` (
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

-- ----------------------------
-- Records of am_tasktemplates_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aod_index`
-- ----------------------------
DROP TABLE IF EXISTS `aod_index`;
CREATE TABLE `aod_index` (
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

-- ----------------------------
-- Records of aod_index
-- ----------------------------
INSERT INTO `aod_index` VALUES ('1', 'Index', '2015-03-21 19:30:25', '2015-03-21 19:30:25', '1', '1', null, '0', null, null, 'modules/AOD_Index/Index/Index');

-- ----------------------------
-- Table structure for `aod_indexevent`
-- ----------------------------
DROP TABLE IF EXISTS `aod_indexevent`;
CREATE TABLE `aod_indexevent` (
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

-- ----------------------------
-- Records of aod_indexevent
-- ----------------------------

-- ----------------------------
-- Table structure for `aod_indexevent_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aod_indexevent_audit`;
CREATE TABLE `aod_indexevent_audit` (
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

-- ----------------------------
-- Records of aod_indexevent_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aod_index_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aod_index_audit`;
CREATE TABLE `aod_index_audit` (
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

-- ----------------------------
-- Records of aod_index_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aop_case_events`
-- ----------------------------
DROP TABLE IF EXISTS `aop_case_events`;
CREATE TABLE `aop_case_events` (
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

-- ----------------------------
-- Records of aop_case_events
-- ----------------------------

-- ----------------------------
-- Table structure for `aop_case_events_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aop_case_events_audit`;
CREATE TABLE `aop_case_events_audit` (
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

-- ----------------------------
-- Records of aop_case_events_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aop_case_updates`
-- ----------------------------
DROP TABLE IF EXISTS `aop_case_updates`;
CREATE TABLE `aop_case_updates` (
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

-- ----------------------------
-- Records of aop_case_updates
-- ----------------------------

-- ----------------------------
-- Table structure for `aop_case_updates_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aop_case_updates_audit`;
CREATE TABLE `aop_case_updates_audit` (
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

-- ----------------------------
-- Records of aop_case_updates_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aor_charts`
-- ----------------------------
DROP TABLE IF EXISTS `aor_charts`;
CREATE TABLE `aor_charts` (
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

-- ----------------------------
-- Records of aor_charts
-- ----------------------------

-- ----------------------------
-- Table structure for `aor_conditions`
-- ----------------------------
DROP TABLE IF EXISTS `aor_conditions`;
CREATE TABLE `aor_conditions` (
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

-- ----------------------------
-- Records of aor_conditions
-- ----------------------------

-- ----------------------------
-- Table structure for `aor_fields`
-- ----------------------------
DROP TABLE IF EXISTS `aor_fields`;
CREATE TABLE `aor_fields` (
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

-- ----------------------------
-- Records of aor_fields
-- ----------------------------

-- ----------------------------
-- Table structure for `aor_reports`
-- ----------------------------
DROP TABLE IF EXISTS `aor_reports`;
CREATE TABLE `aor_reports` (
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

-- ----------------------------
-- Records of aor_reports
-- ----------------------------

-- ----------------------------
-- Table structure for `aor_reports_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aor_reports_audit`;
CREATE TABLE `aor_reports_audit` (
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

-- ----------------------------
-- Records of aor_reports_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aor_scheduled_reports`
-- ----------------------------
DROP TABLE IF EXISTS `aor_scheduled_reports`;
CREATE TABLE `aor_scheduled_reports` (
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

-- ----------------------------
-- Records of aor_scheduled_reports
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_contracts`
-- ----------------------------
DROP TABLE IF EXISTS `aos_contracts`;
CREATE TABLE `aos_contracts` (
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

-- ----------------------------
-- Records of aos_contracts
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_contracts_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aos_contracts_audit`;
CREATE TABLE `aos_contracts_audit` (
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

-- ----------------------------
-- Records of aos_contracts_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_contracts_documents`
-- ----------------------------
DROP TABLE IF EXISTS `aos_contracts_documents`;
CREATE TABLE `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aos_contracts_documents
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_invoices`
-- ----------------------------
DROP TABLE IF EXISTS `aos_invoices`;
CREATE TABLE `aos_invoices` (
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

-- ----------------------------
-- Records of aos_invoices
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_invoices_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aos_invoices_audit`;
CREATE TABLE `aos_invoices_audit` (
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

-- ----------------------------
-- Records of aos_invoices_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_line_item_groups`
-- ----------------------------
DROP TABLE IF EXISTS `aos_line_item_groups`;
CREATE TABLE `aos_line_item_groups` (
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

-- ----------------------------
-- Records of aos_line_item_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_line_item_groups_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aos_line_item_groups_audit`;
CREATE TABLE `aos_line_item_groups_audit` (
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

-- ----------------------------
-- Records of aos_line_item_groups_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_pdf_templates`
-- ----------------------------
DROP TABLE IF EXISTS `aos_pdf_templates`;
CREATE TABLE `aos_pdf_templates` (
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

-- ----------------------------
-- Records of aos_pdf_templates
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_pdf_templates_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aos_pdf_templates_audit`;
CREATE TABLE `aos_pdf_templates_audit` (
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

-- ----------------------------
-- Records of aos_pdf_templates_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_products`
-- ----------------------------
DROP TABLE IF EXISTS `aos_products`;
CREATE TABLE `aos_products` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aos_products
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_products_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aos_products_audit`;
CREATE TABLE `aos_products_audit` (
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

-- ----------------------------
-- Records of aos_products_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_products_quotes`
-- ----------------------------
DROP TABLE IF EXISTS `aos_products_quotes`;
CREATE TABLE `aos_products_quotes` (
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

-- ----------------------------
-- Records of aos_products_quotes
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_products_quotes_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aos_products_quotes_audit`;
CREATE TABLE `aos_products_quotes_audit` (
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

-- ----------------------------
-- Records of aos_products_quotes_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_product_categories`
-- ----------------------------
DROP TABLE IF EXISTS `aos_product_categories`;
CREATE TABLE `aos_product_categories` (
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

-- ----------------------------
-- Records of aos_product_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_product_categories_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aos_product_categories_audit`;
CREATE TABLE `aos_product_categories_audit` (
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

-- ----------------------------
-- Records of aos_product_categories_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_quotes`
-- ----------------------------
DROP TABLE IF EXISTS `aos_quotes`;
CREATE TABLE `aos_quotes` (
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

-- ----------------------------
-- Records of aos_quotes
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_quotes_aos_invoices_c`
-- ----------------------------
DROP TABLE IF EXISTS `aos_quotes_aos_invoices_c`;
CREATE TABLE `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aos_quotes_aos_invoices_c
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_quotes_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aos_quotes_audit`;
CREATE TABLE `aos_quotes_audit` (
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

-- ----------------------------
-- Records of aos_quotes_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_quotes_os_contracts_c`
-- ----------------------------
DROP TABLE IF EXISTS `aos_quotes_os_contracts_c`;
CREATE TABLE `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aos_quotes_os_contracts_c
-- ----------------------------

-- ----------------------------
-- Table structure for `aos_quotes_project_c`
-- ----------------------------
DROP TABLE IF EXISTS `aos_quotes_project_c`;
CREATE TABLE `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aos_quotes_project_c
-- ----------------------------

-- ----------------------------
-- Table structure for `aow_actions`
-- ----------------------------
DROP TABLE IF EXISTS `aow_actions`;
CREATE TABLE `aow_actions` (
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

-- ----------------------------
-- Records of aow_actions
-- ----------------------------

-- ----------------------------
-- Table structure for `aow_conditions`
-- ----------------------------
DROP TABLE IF EXISTS `aow_conditions`;
CREATE TABLE `aow_conditions` (
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

-- ----------------------------
-- Records of aow_conditions
-- ----------------------------

-- ----------------------------
-- Table structure for `aow_processed`
-- ----------------------------
DROP TABLE IF EXISTS `aow_processed`;
CREATE TABLE `aow_processed` (
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

-- ----------------------------
-- Records of aow_processed
-- ----------------------------

-- ----------------------------
-- Table structure for `aow_processed_aow_actions`
-- ----------------------------
DROP TABLE IF EXISTS `aow_processed_aow_actions`;
CREATE TABLE `aow_processed_aow_actions` (
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

-- ----------------------------
-- Records of aow_processed_aow_actions
-- ----------------------------

-- ----------------------------
-- Table structure for `aow_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `aow_workflow`;
CREATE TABLE `aow_workflow` (
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

-- ----------------------------
-- Records of aow_workflow
-- ----------------------------

-- ----------------------------
-- Table structure for `aow_workflow_audit`
-- ----------------------------
DROP TABLE IF EXISTS `aow_workflow_audit`;
CREATE TABLE `aow_workflow_audit` (
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

-- ----------------------------
-- Records of aow_workflow_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `bugs`
-- ----------------------------
DROP TABLE IF EXISTS `bugs`;
CREATE TABLE `bugs` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bugs
-- ----------------------------

-- ----------------------------
-- Table structure for `bugs_audit`
-- ----------------------------
DROP TABLE IF EXISTS `bugs_audit`;
CREATE TABLE `bugs_audit` (
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

-- ----------------------------
-- Records of bugs_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `calls`
-- ----------------------------
DROP TABLE IF EXISTS `calls`;
CREATE TABLE `calls` (
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

-- ----------------------------
-- Records of calls
-- ----------------------------

-- ----------------------------
-- Table structure for `calls_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `calls_contacts`;
CREATE TABLE `calls_contacts` (
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

-- ----------------------------
-- Records of calls_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `calls_leads`
-- ----------------------------
DROP TABLE IF EXISTS `calls_leads`;
CREATE TABLE `calls_leads` (
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

-- ----------------------------
-- Records of calls_leads
-- ----------------------------

-- ----------------------------
-- Table structure for `calls_reschedule`
-- ----------------------------
DROP TABLE IF EXISTS `calls_reschedule`;
CREATE TABLE `calls_reschedule` (
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

-- ----------------------------
-- Records of calls_reschedule
-- ----------------------------

-- ----------------------------
-- Table structure for `calls_reschedule_audit`
-- ----------------------------
DROP TABLE IF EXISTS `calls_reschedule_audit`;
CREATE TABLE `calls_reschedule_audit` (
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

-- ----------------------------
-- Records of calls_reschedule_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `calls_users`
-- ----------------------------
DROP TABLE IF EXISTS `calls_users`;
CREATE TABLE `calls_users` (
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

-- ----------------------------
-- Records of calls_users
-- ----------------------------

-- ----------------------------
-- Table structure for `campaigns`
-- ----------------------------
DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for `campaigns_audit`
-- ----------------------------
DROP TABLE IF EXISTS `campaigns_audit`;
CREATE TABLE `campaigns_audit` (
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

-- ----------------------------
-- Records of campaigns_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign_log`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_log`;
CREATE TABLE `campaign_log` (
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

-- ----------------------------
-- Records of campaign_log
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign_trkrs`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_trkrs`;
CREATE TABLE `campaign_trkrs` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campaign_trkrs
-- ----------------------------

-- ----------------------------
-- Table structure for `cases`
-- ----------------------------
DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases
-- ----------------------------

-- ----------------------------
-- Table structure for `cases_audit`
-- ----------------------------
DROP TABLE IF EXISTS `cases_audit`;
CREATE TABLE `cases_audit` (
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

-- ----------------------------
-- Records of cases_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `cases_bugs`
-- ----------------------------
DROP TABLE IF EXISTS `cases_bugs`;
CREATE TABLE `cases_bugs` (
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

-- ----------------------------
-- Records of cases_bugs
-- ----------------------------

-- ----------------------------
-- Table structure for `cases_cstm`
-- ----------------------------
DROP TABLE IF EXISTS `cases_cstm`;
CREATE TABLE `cases_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases_cstm
-- ----------------------------

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('notify', 'fromaddress', 'do_not_reply@example.com');
INSERT INTO `config` VALUES ('notify', 'fromname', 'SuiteCRM');
INSERT INTO `config` VALUES ('notify', 'send_by_default', '1');
INSERT INTO `config` VALUES ('notify', 'on', '1');
INSERT INTO `config` VALUES ('notify', 'send_from_assigning_user', '0');
INSERT INTO `config` VALUES ('info', 'sugar_version', '6.5.20');
INSERT INTO `config` VALUES ('MySettings', 'tab', 'YTozMzp7aTowO3M6NDoiSG9tZSI7aToxO3M6ODoiQWNjb3VudHMiO2k6MjtzOjg6IkNvbnRhY3RzIjtpOjM7czoxMzoiT3Bwb3J0dW5pdGllcyI7aTo0O3M6NToiTGVhZHMiO2k6NTtzOjEwOiJBT1NfUXVvdGVzIjtpOjY7czo4OiJDYWxlbmRhciI7aTo3O3M6OToiRG9jdW1lbnRzIjtpOjg7czo2OiJFbWFpbHMiO2k6OTtzOjk6IkNhbXBhaWducyI7aToxMDtzOjU6IkNhbGxzIjtpOjExO3M6ODoiTWVldGluZ3MiO2k6MTI7czo1OiJUYXNrcyI7aToxMztzOjU6Ik5vdGVzIjtpOjE0O3M6MTI6IkFPU19JbnZvaWNlcyI7aToxNTtzOjEzOiJBT1NfQ29udHJhY3RzIjtpOjE2O3M6NToiQ2FzZXMiO2k6MTc7czo5OiJQcm9zcGVjdHMiO2k6MTg7czoxMzoiUHJvc3BlY3RMaXN0cyI7aToxOTtzOjc6IlByb2plY3QiO2k6MjA7czoxOToiQU1fUHJvamVjdFRlbXBsYXRlcyI7aToyMTtzOjE2OiJBTV9UYXNrVGVtcGxhdGVzIjtpOjIyO3M6OToiRlBfZXZlbnRzIjtpOjIzO3M6MTg6IkZQX0V2ZW50X0xvY2F0aW9ucyI7aToyNDtzOjEyOiJBT1NfUHJvZHVjdHMiO2k6MjU7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7aToyNjtzOjE3OiJBT1NfUERGX1RlbXBsYXRlcyI7aToyNztzOjk6Impqd2dfTWFwcyI7aToyODtzOjEyOiJqandnX01hcmtlcnMiO2k6Mjk7czoxMDoiamp3Z19BcmVhcyI7aTozMDtzOjE4OiJqandnX0FkZHJlc3NfQ2FjaGUiO2k6MzE7czoxMToiQU9SX1JlcG9ydHMiO2k6MzI7czoxMjoiQU9XX1dvcmtGbG93Ijt9');
INSERT INTO `config` VALUES ('portal', 'on', '0');
INSERT INTO `config` VALUES ('tracker', 'Tracker', '1');
INSERT INTO `config` VALUES ('system', 'skypeout_on', '1');
INSERT INTO `config` VALUES ('sugarfeed', 'enabled', '1');
INSERT INTO `config` VALUES ('sugarfeed', 'module_UserFeed', '1');
INSERT INTO `config` VALUES ('sugarfeed', 'module_Cases', '1');
INSERT INTO `config` VALUES ('sugarfeed', 'module_Contacts', '1');
INSERT INTO `config` VALUES ('sugarfeed', 'module_Leads', '1');
INSERT INTO `config` VALUES ('sugarfeed', 'module_Opportunities', '1');
INSERT INTO `config` VALUES ('Update', 'CheckUpdates', 'manual');
INSERT INTO `config` VALUES ('system', 'name', 'SuiteCRM');
INSERT INTO `config` VALUES ('system', 'adminwizard', '1');
INSERT INTO `config` VALUES ('notify', 'allow_default_outbound', '0');

-- ----------------------------
-- Table structure for `contacts`
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
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

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `contacts_audit`
-- ----------------------------
DROP TABLE IF EXISTS `contacts_audit`;
CREATE TABLE `contacts_audit` (
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

-- ----------------------------
-- Records of contacts_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `contacts_bugs`
-- ----------------------------
DROP TABLE IF EXISTS `contacts_bugs`;
CREATE TABLE `contacts_bugs` (
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

-- ----------------------------
-- Records of contacts_bugs
-- ----------------------------

-- ----------------------------
-- Table structure for `contacts_cases`
-- ----------------------------
DROP TABLE IF EXISTS `contacts_cases`;
CREATE TABLE `contacts_cases` (
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

-- ----------------------------
-- Records of contacts_cases
-- ----------------------------

-- ----------------------------
-- Table structure for `contacts_cstm`
-- ----------------------------
DROP TABLE IF EXISTS `contacts_cstm`;
CREATE TABLE `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contacts_cstm
-- ----------------------------

-- ----------------------------
-- Table structure for `contacts_users`
-- ----------------------------
DROP TABLE IF EXISTS `contacts_users`;
CREATE TABLE `contacts_users` (
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

-- ----------------------------
-- Records of contacts_users
-- ----------------------------

-- ----------------------------
-- Table structure for `cron_remove_documents`
-- ----------------------------
DROP TABLE IF EXISTS `cron_remove_documents`;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cron_remove_documents
-- ----------------------------

-- ----------------------------
-- Table structure for `currencies`
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
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

-- ----------------------------
-- Records of currencies
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_fields`
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
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

-- ----------------------------
-- Records of custom_fields
-- ----------------------------

-- ----------------------------
-- Table structure for `documents`
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
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

-- ----------------------------
-- Records of documents
-- ----------------------------

-- ----------------------------
-- Table structure for `documents_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `documents_accounts`;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documents_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for `documents_bugs`
-- ----------------------------
DROP TABLE IF EXISTS `documents_bugs`;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documents_bugs
-- ----------------------------

-- ----------------------------
-- Table structure for `documents_cases`
-- ----------------------------
DROP TABLE IF EXISTS `documents_cases`;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documents_cases
-- ----------------------------

-- ----------------------------
-- Table structure for `documents_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `documents_contacts`;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documents_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `documents_opportunities`
-- ----------------------------
DROP TABLE IF EXISTS `documents_opportunities`;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documents_opportunities
-- ----------------------------

-- ----------------------------
-- Table structure for `document_revisions`
-- ----------------------------
DROP TABLE IF EXISTS `document_revisions`;
CREATE TABLE `document_revisions` (
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

-- ----------------------------
-- Records of document_revisions
-- ----------------------------

-- ----------------------------
-- Table structure for `eapm`
-- ----------------------------
DROP TABLE IF EXISTS `eapm`;
CREATE TABLE `eapm` (
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

-- ----------------------------
-- Records of eapm
-- ----------------------------

-- ----------------------------
-- Table structure for `emailman`
-- ----------------------------
DROP TABLE IF EXISTS `emailman`;
CREATE TABLE `emailman` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emailman
-- ----------------------------

-- ----------------------------
-- Table structure for `emails`
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
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

-- ----------------------------
-- Records of emails
-- ----------------------------

-- ----------------------------
-- Table structure for `emails_beans`
-- ----------------------------
DROP TABLE IF EXISTS `emails_beans`;
CREATE TABLE `emails_beans` (
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

-- ----------------------------
-- Records of emails_beans
-- ----------------------------

-- ----------------------------
-- Table structure for `emails_email_addr_rel`
-- ----------------------------
DROP TABLE IF EXISTS `emails_email_addr_rel`;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emails_email_addr_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `emails_text`
-- ----------------------------
DROP TABLE IF EXISTS `emails_text`;
CREATE TABLE `emails_text` (
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

-- ----------------------------
-- Records of emails_text
-- ----------------------------

-- ----------------------------
-- Table structure for `email_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `email_addresses`;
CREATE TABLE `email_addresses` (
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

-- ----------------------------
-- Records of email_addresses
-- ----------------------------
INSERT INTO `email_addresses` VALUES ('b44791ce-c931-fd52-73b1-550dc7ea98cb', 'test@mailinator.com', 'TEST@MAILINATOR.COM', '0', '0', '2015-03-21 19:31:46', '2015-03-21 19:31:46', '0');

-- ----------------------------
-- Table structure for `email_addr_bean_rel`
-- ----------------------------
DROP TABLE IF EXISTS `email_addr_bean_rel`;
CREATE TABLE `email_addr_bean_rel` (
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

-- ----------------------------
-- Records of email_addr_bean_rel
-- ----------------------------
INSERT INTO `email_addr_bean_rel` VALUES ('b3c4e2e2-bdc6-3cf0-bf2e-550dc747f675', 'b44791ce-c931-fd52-73b1-550dc7ea98cb', '1', 'Users', '1', '0', '2015-03-21 19:31:46', '2015-03-21 19:31:46', '0');

-- ----------------------------
-- Table structure for `email_cache`
-- ----------------------------
DROP TABLE IF EXISTS `email_cache`;
CREATE TABLE `email_cache` (
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

-- ----------------------------
-- Records of email_cache
-- ----------------------------

-- ----------------------------
-- Table structure for `email_marketing`
-- ----------------------------
DROP TABLE IF EXISTS `email_marketing`;
CREATE TABLE `email_marketing` (
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

-- ----------------------------
-- Records of email_marketing
-- ----------------------------

-- ----------------------------
-- Table structure for `email_marketing_prospect_lists`
-- ----------------------------
DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_marketing_prospect_lists
-- ----------------------------

-- ----------------------------
-- Table structure for `email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates` (
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

-- ----------------------------
-- Records of email_templates
-- ----------------------------
INSERT INTO `email_templates` VALUES ('21196694-2997-b018-fef3-550dc525c8fb', '2013-05-24 14:31:45', '2015-03-21 19:13:07', '1', '1', 'off', 'Event Invite Template', 'Default event invite template.', 'You have been invited to $fp_events_name', 'Dear $contact_name,\r\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\r\n$fp_events_description\r\nYours Sincerely,\r\n', '\r\n<p>Dear $contact_name,</p>\r\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\r\n<p>$fp_events_description</p>\r\n<p>If you would like to accept this invititation please click accept.</p>\r\n<p> $fp_events_link or $fp_events_link_declined</p>\r\n<p>Yours Sincerely,</p>\r\n', '0', null, null, 'email');
INSERT INTO `email_templates` VALUES ('2d8a1e9a-3046-e519-04b5-550dc47edce4', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Contact Case Update', 'Template to send to a contact when their case is updated.', '$acase_name update [CASE:$acase_case_number]', 'Hi $user_first_name $user_last_name,\r\n\r\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description', '<p>Hi $contact_first_name $contact_last_name,</p>\r\n					    <p> </p>\r\n					    <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\r\n					    <p style=\"padding-left:30px;\">$aop_case_updates_description</p>', '0', null, null, null);
INSERT INTO `email_templates` VALUES ('46ebc1a3-2b0a-c55e-570c-550dc5b758ab', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'User Case Update', 'Email template to send to a Sugar user when their case is updated.', '$acase_name (# $acase_case_number) update', 'Hi $user_first_name $user_last_name,\r\n\r\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description\r\n                        You may review this Case at:\r\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;', '<p>Hi $user_first_name $user_last_name,</p>\r\n					   <p> </p>\r\n					   <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					   <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\r\n					   <p style=\"padding-left:30px;\">$aop_case_updates_description</p>\r\n					   <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>\r\n					   ', '0', null, null, null);
INSERT INTO `email_templates` VALUES ('4cca32f6-6a3e-ba4d-e997-550dc46c84cf', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Case Closure', 'Template for informing a contact that their case has been closed.', '$acase_name [CASE:$acase_case_number] closed', 'Hi $contact_first_name $contact_last_name,\r\n\r\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\r\n					   Status:				$acase_status\r\n					   Reference:			$acase_case_number\r\n					   Resolution:			$acase_resolution', '<p> Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\r\n					    <table border=\"0\"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Resolution</td><td>$acase_resolution</td></tr></tbody></table>', '0', null, null, null);
INSERT INTO `email_templates` VALUES ('5cc424ab-2b4b-f510-6da0-550dc4ef9aa6', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user\'s account password.', 'Reset your account password', '\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid', '<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', '0', null, '0', null);
INSERT INTO `email_templates` VALUES ('6bd5211e-82f0-84a1-e90a-550dc4e11518', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', '0', null, '0', null);
INSERT INTO `email_templates` VALUES ('7b219fdf-7fc6-be7b-09d9-550dc4cfb237', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Joomla Account Creation', 'Template used when informing a contact that they\'ve been given an account on the joomla portal.', 'Support Portal Account Created', 'Hi $contact_name,\r\n					   An account has been created for you at $portal_address.\r\n					   You may login using this email address and the password $joomla_pass', '<p>Hi $contact_name,</p>\r\n					    <p>An account has been created for you at <a href=\"$portal_address\">$portal_address</a>.</p>\r\n					    <p>You may login using this email address and the password $joomla_pass</p>', '0', null, null, null);
INSERT INTO `email_templates` VALUES ('d29c326e-2ce9-cd4f-6919-550dc4e97a6c', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'off', 'Case Creation', 'Template to send to a contact when a case is received from them.', '$acase_name [CASE:$acase_case_number]', 'Hi $contact_first_name $contact_last_name,\r\n\r\n					   We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\r\n					   Status:		$acase_status\r\n					   Reference:	$acase_case_number\r\n					   Description:	$acase_description', '<p> Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\r\n					    <table border=\"0\"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Description</td><td>$acase_description</td></tr></tbody></table>', '0', null, null, null);

-- ----------------------------
-- Table structure for `fields_meta_data`
-- ----------------------------
DROP TABLE IF EXISTS `fields_meta_data`;
CREATE TABLE `fields_meta_data` (
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

-- ----------------------------
-- Records of fields_meta_data
-- ----------------------------
INSERT INTO `fields_meta_data` VALUES ('Accountsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Accounts', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Accountsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Accounts', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Accountsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Accounts', 'float', '10', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Accountsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Accounts', 'float', '11', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Casesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Cases', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Casesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Cases', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Casesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Cases', 'float', '10', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Casesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Cases', 'float', '11', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Contactsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Contacts', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Contactsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Contacts', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Contactsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Contacts', 'float', '10', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Contactsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Contacts', 'float', '11', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Leadsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Leads', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Leadsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Leads', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Leadsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Leads', 'float', '10', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Leadsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Leads', 'float', '11', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Meetingsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Meetings', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Meetingsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Meetings', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Meetingsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Meetings', 'float', '10', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Meetingsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Meetings', 'float', '11', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Opportunitiesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Opportunities', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Opportunitiesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Opportunities', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Opportunitiesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Opportunities', 'float', '10', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Opportunitiesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Opportunities', 'float', '11', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Projectjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Project', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Projectjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Project', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Projectjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Project', 'float', '10', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Projectjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Project', 'float', '11', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Prospectsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Prospects', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Prospectsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Prospects', 'varchar', '255', '0', null, '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', null, '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Prospectsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Prospects', 'float', '10', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');
INSERT INTO `fields_meta_data` VALUES ('Prospectsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Prospects', 'float', '11', '0', '0.00000000', '2015-03-21 19:13:07', '0', '0', '0', '0', '1', 'true', '8', '', '', '');

-- ----------------------------
-- Table structure for `folders`
-- ----------------------------
DROP TABLE IF EXISTS `folders`;
CREATE TABLE `folders` (
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

-- ----------------------------
-- Records of folders
-- ----------------------------

-- ----------------------------
-- Table structure for `folders_rel`
-- ----------------------------
DROP TABLE IF EXISTS `folders_rel`;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of folders_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `folders_subscriptions`
-- ----------------------------
DROP TABLE IF EXISTS `folders_subscriptions`;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of folders_subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_events`
-- ----------------------------
DROP TABLE IF EXISTS `fp_events`;
CREATE TABLE `fp_events` (
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

-- ----------------------------
-- Records of fp_events
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_events_audit`
-- ----------------------------
DROP TABLE IF EXISTS `fp_events_audit`;
CREATE TABLE `fp_events_audit` (
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

-- ----------------------------
-- Records of fp_events_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_events_contacts_c`
-- ----------------------------
DROP TABLE IF EXISTS `fp_events_contacts_c`;
CREATE TABLE `fp_events_contacts_c` (
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

-- ----------------------------
-- Records of fp_events_contacts_c
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_events_fp_event_delegates_1_c`
-- ----------------------------
DROP TABLE IF EXISTS `fp_events_fp_event_delegates_1_c`;
CREATE TABLE `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fp_events_fp_event_delegates_1_c
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_events_fp_event_locations_1_c`
-- ----------------------------
DROP TABLE IF EXISTS `fp_events_fp_event_locations_1_c`;
CREATE TABLE `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fp_events_fp_event_locations_1_c
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_events_leads_1_c`
-- ----------------------------
DROP TABLE IF EXISTS `fp_events_leads_1_c`;
CREATE TABLE `fp_events_leads_1_c` (
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

-- ----------------------------
-- Records of fp_events_leads_1_c
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_events_prospects_1_c`
-- ----------------------------
DROP TABLE IF EXISTS `fp_events_prospects_1_c`;
CREATE TABLE `fp_events_prospects_1_c` (
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

-- ----------------------------
-- Records of fp_events_prospects_1_c
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_event_locations`
-- ----------------------------
DROP TABLE IF EXISTS `fp_event_locations`;
CREATE TABLE `fp_event_locations` (
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

-- ----------------------------
-- Records of fp_event_locations
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_event_locations_audit`
-- ----------------------------
DROP TABLE IF EXISTS `fp_event_locations_audit`;
CREATE TABLE `fp_event_locations_audit` (
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

-- ----------------------------
-- Records of fp_event_locations_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `fp_event_locations_fp_events_1_c`
-- ----------------------------
DROP TABLE IF EXISTS `fp_event_locations_fp_events_1_c`;
CREATE TABLE `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fp_event_locations_fp_events_1_c
-- ----------------------------

-- ----------------------------
-- Table structure for `import_maps`
-- ----------------------------
DROP TABLE IF EXISTS `import_maps`;
CREATE TABLE `import_maps` (
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

-- ----------------------------
-- Records of import_maps
-- ----------------------------

-- ----------------------------
-- Table structure for `inbound_email`
-- ----------------------------
DROP TABLE IF EXISTS `inbound_email`;
CREATE TABLE `inbound_email` (
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

-- ----------------------------
-- Records of inbound_email
-- ----------------------------

-- ----------------------------
-- Table structure for `inbound_email_autoreply`
-- ----------------------------
DROP TABLE IF EXISTS `inbound_email_autoreply`;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inbound_email_autoreply
-- ----------------------------

-- ----------------------------
-- Table structure for `inbound_email_cache_ts`
-- ----------------------------
DROP TABLE IF EXISTS `inbound_email_cache_ts`;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inbound_email_cache_ts
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_address_cache`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_address_cache`;
CREATE TABLE `jjwg_address_cache` (
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

-- ----------------------------
-- Records of jjwg_address_cache
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_address_cache_audit`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_address_cache_audit`;
CREATE TABLE `jjwg_address_cache_audit` (
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

-- ----------------------------
-- Records of jjwg_address_cache_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_areas`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_areas`;
CREATE TABLE `jjwg_areas` (
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

-- ----------------------------
-- Records of jjwg_areas
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_areas_audit`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_areas_audit`;
CREATE TABLE `jjwg_areas_audit` (
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

-- ----------------------------
-- Records of jjwg_areas_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_maps`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_maps`;
CREATE TABLE `jjwg_maps` (
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

-- ----------------------------
-- Records of jjwg_maps
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_maps_audit`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_maps_audit`;
CREATE TABLE `jjwg_maps_audit` (
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

-- ----------------------------
-- Records of jjwg_maps_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_maps_jjwg_areas_c`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_maps_jjwg_areas_c`;
CREATE TABLE `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jjwg_maps_jjwg_areas_c
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_maps_jjwg_markers_c`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_maps_jjwg_markers_c`;
CREATE TABLE `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jjwg_maps_jjwg_markers_c
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_markers`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_markers`;
CREATE TABLE `jjwg_markers` (
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

-- ----------------------------
-- Records of jjwg_markers
-- ----------------------------

-- ----------------------------
-- Table structure for `jjwg_markers_audit`
-- ----------------------------
DROP TABLE IF EXISTS `jjwg_markers_audit`;
CREATE TABLE `jjwg_markers_audit` (
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

-- ----------------------------
-- Records of jjwg_markers_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `job_queue`
-- ----------------------------
DROP TABLE IF EXISTS `job_queue`;
CREATE TABLE `job_queue` (
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

-- ----------------------------
-- Records of job_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `leads`
-- ----------------------------
DROP TABLE IF EXISTS `leads`;
CREATE TABLE `leads` (
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

-- ----------------------------
-- Records of leads
-- ----------------------------

-- ----------------------------
-- Table structure for `leads_audit`
-- ----------------------------
DROP TABLE IF EXISTS `leads_audit`;
CREATE TABLE `leads_audit` (
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

-- ----------------------------
-- Records of leads_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `leads_cstm`
-- ----------------------------
DROP TABLE IF EXISTS `leads_cstm`;
CREATE TABLE `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leads_cstm
-- ----------------------------

-- ----------------------------
-- Table structure for `linked_documents`
-- ----------------------------
DROP TABLE IF EXISTS `linked_documents`;
CREATE TABLE `linked_documents` (
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

-- ----------------------------
-- Records of linked_documents
-- ----------------------------

-- ----------------------------
-- Table structure for `meetings`
-- ----------------------------
DROP TABLE IF EXISTS `meetings`;
CREATE TABLE `meetings` (
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

-- ----------------------------
-- Records of meetings
-- ----------------------------

-- ----------------------------
-- Table structure for `meetings_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `meetings_contacts`;
CREATE TABLE `meetings_contacts` (
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

-- ----------------------------
-- Records of meetings_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `meetings_cstm`
-- ----------------------------
DROP TABLE IF EXISTS `meetings_cstm`;
CREATE TABLE `meetings_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetings_cstm
-- ----------------------------

-- ----------------------------
-- Table structure for `meetings_leads`
-- ----------------------------
DROP TABLE IF EXISTS `meetings_leads`;
CREATE TABLE `meetings_leads` (
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

-- ----------------------------
-- Records of meetings_leads
-- ----------------------------

-- ----------------------------
-- Table structure for `meetings_users`
-- ----------------------------
DROP TABLE IF EXISTS `meetings_users`;
CREATE TABLE `meetings_users` (
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

-- ----------------------------
-- Records of meetings_users
-- ----------------------------

-- ----------------------------
-- Table structure for `notes`
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
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

-- ----------------------------
-- Records of notes
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_consumer`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_consumer`;
CREATE TABLE `oauth_consumer` (
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

-- ----------------------------
-- Records of oauth_consumer
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_nonce`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_nonce`;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_nonce
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_tokens`;
CREATE TABLE `oauth_tokens` (
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

-- ----------------------------
-- Records of oauth_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `opportunities`
-- ----------------------------
DROP TABLE IF EXISTS `opportunities`;
CREATE TABLE `opportunities` (
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

-- ----------------------------
-- Records of opportunities
-- ----------------------------

-- ----------------------------
-- Table structure for `opportunities_audit`
-- ----------------------------
DROP TABLE IF EXISTS `opportunities_audit`;
CREATE TABLE `opportunities_audit` (
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

-- ----------------------------
-- Records of opportunities_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `opportunities_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `opportunities_contacts`;
CREATE TABLE `opportunities_contacts` (
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

-- ----------------------------
-- Records of opportunities_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `opportunities_cstm`
-- ----------------------------
DROP TABLE IF EXISTS `opportunities_cstm`;
CREATE TABLE `opportunities_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opportunities_cstm
-- ----------------------------

-- ----------------------------
-- Table structure for `outbound_email`
-- ----------------------------
DROP TABLE IF EXISTS `outbound_email`;
CREATE TABLE `outbound_email` (
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

-- ----------------------------
-- Records of outbound_email
-- ----------------------------
INSERT INTO `outbound_email` VALUES ('60624bd7-4072-268f-2dbc-550dc66d1125', 'system', 'system', '1', 'SMTP', 'other', '', '25', '', '', '1', '0');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
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

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for `projects_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `projects_accounts`;
CREATE TABLE `projects_accounts` (
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

-- ----------------------------
-- Records of projects_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for `projects_bugs`
-- ----------------------------
DROP TABLE IF EXISTS `projects_bugs`;
CREATE TABLE `projects_bugs` (
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

-- ----------------------------
-- Records of projects_bugs
-- ----------------------------

-- ----------------------------
-- Table structure for `projects_cases`
-- ----------------------------
DROP TABLE IF EXISTS `projects_cases`;
CREATE TABLE `projects_cases` (
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

-- ----------------------------
-- Records of projects_cases
-- ----------------------------

-- ----------------------------
-- Table structure for `projects_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `projects_contacts`;
CREATE TABLE `projects_contacts` (
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

-- ----------------------------
-- Records of projects_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `projects_opportunities`
-- ----------------------------
DROP TABLE IF EXISTS `projects_opportunities`;
CREATE TABLE `projects_opportunities` (
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

-- ----------------------------
-- Records of projects_opportunities
-- ----------------------------

-- ----------------------------
-- Table structure for `projects_products`
-- ----------------------------
DROP TABLE IF EXISTS `projects_products`;
CREATE TABLE `projects_products` (
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

-- ----------------------------
-- Records of projects_products
-- ----------------------------

-- ----------------------------
-- Table structure for `project_contacts_1_c`
-- ----------------------------
DROP TABLE IF EXISTS `project_contacts_1_c`;
CREATE TABLE `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_contacts_1_c
-- ----------------------------

-- ----------------------------
-- Table structure for `project_cstm`
-- ----------------------------
DROP TABLE IF EXISTS `project_cstm`;
CREATE TABLE `project_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_cstm
-- ----------------------------

-- ----------------------------
-- Table structure for `project_task`
-- ----------------------------
DROP TABLE IF EXISTS `project_task`;
CREATE TABLE `project_task` (
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

-- ----------------------------
-- Records of project_task
-- ----------------------------

-- ----------------------------
-- Table structure for `project_task_audit`
-- ----------------------------
DROP TABLE IF EXISTS `project_task_audit`;
CREATE TABLE `project_task_audit` (
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

-- ----------------------------
-- Records of project_task_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `project_users_1_c`
-- ----------------------------
DROP TABLE IF EXISTS `project_users_1_c`;
CREATE TABLE `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_users_1_c
-- ----------------------------

-- ----------------------------
-- Table structure for `prospects`
-- ----------------------------
DROP TABLE IF EXISTS `prospects`;
CREATE TABLE `prospects` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prospects
-- ----------------------------

-- ----------------------------
-- Table structure for `prospects_cstm`
-- ----------------------------
DROP TABLE IF EXISTS `prospects_cstm`;
CREATE TABLE `prospects_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prospects_cstm
-- ----------------------------

-- ----------------------------
-- Table structure for `prospect_lists`
-- ----------------------------
DROP TABLE IF EXISTS `prospect_lists`;
CREATE TABLE `prospect_lists` (
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

-- ----------------------------
-- Records of prospect_lists
-- ----------------------------

-- ----------------------------
-- Table structure for `prospect_lists_prospects`
-- ----------------------------
DROP TABLE IF EXISTS `prospect_lists_prospects`;
CREATE TABLE `prospect_lists_prospects` (
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

-- ----------------------------
-- Records of prospect_lists_prospects
-- ----------------------------

-- ----------------------------
-- Table structure for `prospect_list_campaigns`
-- ----------------------------
DROP TABLE IF EXISTS `prospect_list_campaigns`;
CREATE TABLE `prospect_list_campaigns` (
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

-- ----------------------------
-- Records of prospect_list_campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for `relationships`
-- ----------------------------
DROP TABLE IF EXISTS `relationships`;
CREATE TABLE `relationships` (
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

-- ----------------------------
-- Records of relationships
-- ----------------------------
INSERT INTO `relationships` VALUES ('10143e1a-24a5-d00b-c37b-550dc9a50bff', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', '0', '0');
INSERT INTO `relationships` VALUES ('101b0257-e814-d83b-3e25-550dc90322ea', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('110af750-bd04-b455-1ef5-550dcaf6d36e', 'aos_products_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('11381450-67e7-1e76-8320-550dca244c32', 'aor_scheduled_reports_created_by', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('11c2e183-2621-e28c-8b9d-550dca60e5c8', 'securitygroups_leads', 'SecurityGroups', 'securitygroups', 'id', 'Leads', 'leads', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('138f41bd-6fd2-2a08-3e16-550dc931df6d', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('13e3ebe4-5246-4474-d62b-550dca616ceb', 'aos_invoices_aos_line_item_groups', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1445998d-7cbc-cbc8-e4d6-550dc9f9f06f', 'account_aos_quotes', 'Accounts', 'accounts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_account_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('145eb597-7c32-1718-2a25-550dc9b773c7', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('150b72ee-5bac-8b04-a633-550dc956cf50', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'ProjectTask', '0', '0');
INSERT INTO `relationships` VALUES ('158e3fb9-3273-7e6f-b393-550dcad74532', 'securitygroups_assigned_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('161b6a95-3f93-8d54-dbbb-550dcaf15792', 'aor_reports_aor_fields', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Fields', 'aor_fields', 'aor_report_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('17acddcc-443f-1270-652b-550dc9cc718b', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('188dbd74-07e1-1c5b-77ab-550dca9a8b3d', 'aow_processed_created_by', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1893d8bb-abd4-0482-3b96-550dcafe5d7c', 'securitygroups_prospects', 'SecurityGroups', 'securitygroups', 'id', 'Prospects', 'prospects', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('18b021c4-43a0-dce3-a8bf-550dc938a9b8', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Opportunities', '0', '0');
INSERT INTO `relationships` VALUES ('18c9eae8-41e1-930c-ee30-550dc931b540', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('19491738-86ce-51b8-fda5-550dcaad9123', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1a104e66-286a-c934-889e-550dca33535b', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1a6c8ab1-be2b-831b-f04b-550dcaf6ac91', 'securitygroups_calls', 'SecurityGroups', 'securitygroups', 'id', 'Calls', 'calls', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Calls', '0', '0');
INSERT INTO `relationships` VALUES ('1ab307d7-b371-1d55-0286-550dc9e5f402', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1b266c13-7e22-a816-4c82-550dc9837cf8', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1bc60237-714b-e3a6-5857-550dca4803a6', 'jjwg_maps_modified_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1c1cae72-9d06-2207-1cf0-550dca756ebe', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', '0', '0');
INSERT INTO `relationships` VALUES ('1c93e451-e585-ad76-74db-550dca8b1798', 'jjwg_maps_jjwg_areas', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Areas', 'jjwg_areas', 'id', 'jjwg_maps_jjwg_areas_c', 'jjwg_maps_5304wg_maps_ida', 'jjwg_maps_41f2g_areas_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1d56f2ed-717f-d7e5-c97c-550dcaafeaae', 'am_tasktemplates_modified_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1dc1bbe1-3b6e-fbb7-1010-550dca8269df', 'am_projecttemplates_project_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Project', 'project', 'id', 'am_projecttemplates_project_1_c', 'am_projecttemplates_project_1am_projecttemplates_ida', 'am_projecttemplates_project_1project_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1e0dd6c9-ed61-5b45-ef81-550dc97e55ac', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('1e1af027-bd80-e564-4b8e-550dca361b51', 'aos_quotes_created_by', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('1fe206e7-b17d-70f5-5c53-550dca89f448', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', '0', '0');
INSERT INTO `relationships` VALUES ('20029933-6695-384a-b4e0-550dca48fdd6', 'aos_contracts_created_by', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('20243838-47af-df09-6ec7-550dcaebd126', 'calls_reschedule_created_by', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('21206d41-c3dc-821b-dd87-550dc9cecb36', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Cases', '0', '0');
INSERT INTO `relationships` VALUES ('232a1327-9be2-3e04-f971-550dc9c68ddd', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('2425d10b-384b-62af-c276-550dc91195ae', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Project', '0', '0');
INSERT INTO `relationships` VALUES ('245b41a1-b047-b6b6-75e3-550dca49ec55', 'aor_conditions_modified_user', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('262fe3a0-a6d9-062b-e2e6-550dc967a248', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('276dea69-881e-8191-3a94-550dca84f325', 'product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Products', 'aos_products', 'aos_product_category_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('278edf27-297b-d375-3981-550dc9b0f4dc', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2949fbe2-5a13-0479-75c4-550dc9b7aed8', 'contact_aos_quotes', 'Contacts', 'contacts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_contact_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2a9ac3ad-f8b6-b6c9-e385-550dcaa3a890', 'aow_workflow_aow_conditions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Conditions', 'aow_conditions', 'aow_workflow_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2b3cec89-ccd9-41ed-7176-550dc95c5063', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2b5b59d4-2b98-d502-9522-550dc9525fb6', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2cf47b43-8e48-30b9-c418-550dc9a4de62', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2d6ef0f6-9f74-af59-5d98-550dc9276512', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('2e35022a-aacf-596e-1801-550dca53c2ba', 'am_projecttemplates_assigned_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2e749d9d-dd21-1867-f035-550dca6f0a59', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', '0', '0');
INSERT INTO `relationships` VALUES ('2f568c3e-3d1c-c231-e872-550dc93ee971', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2f78e2ea-dd57-e80d-53a2-550dc94c7559', 'aod_index_assigned_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('2f801db0-c90b-b4b4-983d-550dc90f4fcc', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('2fcf7d80-84e9-23aa-a8c0-550dca5c2398', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('30fb6e9e-6163-6dd0-2e3c-550dc9d40644', 'aop_case_events_created_by', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3176ab9a-a72c-578d-fa20-550dc9a84148', 'account_aos_invoices', 'Accounts', 'accounts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_account_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3289ff84-0fc8-b94c-7d65-550dc9d16c85', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Bugs', '0', '0');
INSERT INTO `relationships` VALUES ('32dcd04a-16f2-9003-9e18-550dcaed603e', 'aos_pdf_templates_modified_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('32e2a433-e3e2-3503-bbd6-550dc960ac79', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'ProjectTask', '0', '0');
INSERT INTO `relationships` VALUES ('340fa0aa-e53c-3045-5e68-550dca214da2', 'securitygroups_meetings', 'SecurityGroups', 'securitygroups', 'id', 'Meetings', 'meetings', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Meetings', '0', '0');
INSERT INTO `relationships` VALUES ('34e9cae1-f38c-9a6b-2632-550dcadc8999', 'aor_reports_aor_conditions', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Conditions', 'aor_conditions', 'aor_report_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('351bad15-ae02-f85d-37a4-550dc9d241bf', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('35d193c4-4ae0-9240-c5ce-550dcad97cb1', 'aop_case_updates_modified_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3625a2c9-6958-9cb6-8e34-550dca87a66d', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('367670d3-ba5e-fb8b-be92-550dca8bd885', 'securitygroups_tasks', 'SecurityGroups', 'securitygroups', 'id', 'Tasks', 'tasks', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Tasks', '0', '0');
INSERT INTO `relationships` VALUES ('36cb6dab-3579-a71a-8719-550dc92f3f7e', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('39c71d04-76ec-0934-7d68-550dc903b7eb', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3a053726-3c54-699d-f272-550dca8be117', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('3b0153b2-a0ea-f1af-4228-550dc9865e4f', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3b0f0f36-6f11-1e68-4f34-550dca53a1c0', 'aow_processed_aow_actions', 'AOW_Processed', 'aow_processed', 'id', 'AOW_Actions', 'aow_actions', 'id', 'aow_processed_aow_actions', 'aow_processed_id', 'aow_action_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3b22ad9d-4bb9-12fb-8407-550dca4f4f44', 'securitygroups_campaigns', 'SecurityGroups', 'securitygroups', 'id', 'Campaigns', 'campaigns', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Campaigns', '0', '0');
INSERT INTO `relationships` VALUES ('3c8221a2-3daa-92dc-a45d-550dca0fd975', 'aos_products_quotes_created_by', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3e21acb0-35b3-d924-e8d9-550dc9d93d24', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3e3b749a-b8d9-df27-934b-550dc9417c37', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Opportunities', '0', '0');
INSERT INTO `relationships` VALUES ('3eb00655-6e45-0634-cba0-550dc9caa2f4', 'opportunity_aos_contracts', 'Opportunities', 'opportunities', 'id', 'AOS_Contracts', 'aos_contracts', 'opportunity_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3f23d4ca-915d-ee97-fea6-550dca68042d', 'jjwg_maps_jjwg_markers', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Markers', 'jjwg_markers', 'id', 'jjwg_maps_jjwg_markers_c', 'jjwg_maps_b229wg_maps_ida', 'jjwg_maps_2e31markers_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3f618487-98fc-f63a-8cfb-550dcaf9e1ca', 'aos_contracts_assigned_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('3f7e46a1-16ed-9c53-1e75-550dc9a52538', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', '0', '0');
INSERT INTO `relationships` VALUES ('4092d608-60c2-5691-8385-550dcaac5b4a', 'am_tasktemplates_created_by', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('40f83fa1-664a-1118-d20e-550dca37e26d', 'aos_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('4169de4b-4e0a-3eaf-b99e-550dcafdb886', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('41f27e1d-247c-ead7-bf78-550dca5bc533', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('42737d00-00fb-4426-aed0-550dc978fdb0', 'fp_event_locations_created_by', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('436d0155-06a1-6777-aa42-550dc9cb2281', 'cases_created_contact', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'contact_created_by_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('440babb0-5e39-0b0e-4b09-550dca2a2e39', 'jjwg_areas_modified_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('44b09dca-3bcf-db07-921c-550dc96cc85a', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('452a669c-5096-7535-b3f2-550dc9b34dee', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Project', '0', '0');
INSERT INTO `relationships` VALUES ('466aaa54-5f01-20dc-1e90-550dc9c456d6', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('47aa5aa5-cc4a-99c5-5d77-550dca7c97ac', 'am_projectholidays_modified_user', 'Users', 'users', 'id', 'AM_ProjectHolidays', 'am_projectholidays', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('4a37abc3-f8e4-d303-2658-550dcacd69ef', 'am_tasktemplates_am_projecttemplates', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'id', 'am_tasktemplates_am_projecttemplates_c', 'am_tasktemplates_am_projecttemplatesam_projecttemplates_ida', 'am_tasktemplates_am_projecttemplatesam_tasktemplates_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('4a7d92d7-16df-9e6c-326a-550dca329f80', 'calls_reschedule_assigned_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('4b4095b0-a74b-8d43-c802-550dc94670ca', 'contact_aos_invoices', 'Contacts', 'contacts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_contact_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('4c3f1ffa-54b4-5adf-92ae-550dc93b8c38', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('4e34402c-8222-2e9e-741c-550dc939d8c6', 'aop_case_events_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('4ec24872-d0d1-f7d8-81ea-550dca46a967', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', '0', '0');
INSERT INTO `relationships` VALUES ('5073e726-943e-1d9e-64d6-550dc99ef615', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'ProjectTask', '0', '0');
INSERT INTO `relationships` VALUES ('50b50b3e-04f2-da6b-3d20-550dc9541920', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('50b93988-902c-5466-b443-550dca5b31c2', 'aow_workflow_aow_actions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Actions', 'aow_actions', 'aow_workflow_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('515a68dc-a5b2-7b4f-b2f3-550dc9c272f6', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('515aed64-5e39-45f8-bde6-550dca0442b6', 'jjwg_maps_created_by', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('530309fa-cbc6-964f-18d1-550dc9bd261b', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('537d8dee-89d9-ceb3-c33a-550dc9abe940', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('53ba6710-d1cf-575c-dbdf-550dc9ac68ab', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('54022029-c64e-2dc0-fdcd-550dc9144862', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('543ad5de-239e-0ba4-634f-550dc9ab9695', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('54e25448-c22a-131d-7105-550dca773691', 'aor_scheduled_reports_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'aor_report_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('55054f93-3ab5-7caa-6402-550dcab1319a', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('55d2e92e-058c-b1c6-ec8b-550dca917bc8', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('564b654c-1d21-ba1a-14ba-550dcad7c3ce', 'aos_pdf_templates_created_by', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('56510fd0-f8d3-7dda-f06a-550dc9f31025', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Cases', '0', '0');
INSERT INTO `relationships` VALUES ('5722c58b-b517-12a5-6f2d-550dca75ac38', 'securitygroups_users', 'SecurityGroups', 'securitygroups', 'id', 'Users', 'users', 'id', 'securitygroups_users', 'securitygroup_id', 'user_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('590da9b5-6f53-307e-35eb-550dcac34d28', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('595b637b-efb1-18f8-8ac1-550dc9e27455', 'account_aos_contracts', 'Accounts', 'accounts', 'id', 'AOS_Contracts', 'aos_contracts', 'contract_account_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('596cfde9-6d0c-f1f3-51ae-550dcacaaa10', 'aos_products_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('598e8b38-73fe-d516-849b-550dcadc84ef', 'aor_conditions_created_by', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('5a62a12f-6a3e-e845-7c0d-550dc9ddb310', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('5babf305-9a68-fc56-2075-550dca0ff461', 'aop_case_updates_created_by', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('5bb2eeb6-1658-1275-42f5-550dc96d3dd1', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('5ce2e4db-1518-81af-f6cf-550dcac7e284', 'aor_charts_modified_user', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('5d450c1d-6d73-c04d-30ed-550dc9254e10', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('5f95da18-31bf-db72-89b7-550dcaba602d', 'securitygroups_cases', 'SecurityGroups', 'securitygroups', 'id', 'Cases', 'cases', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Cases', '0', '0');
INSERT INTO `relationships` VALUES ('60059467-0e86-b6b1-f7c7-550dc926a040', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', null, null, null, 'one-to-many', 'target_type', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('606ba5e0-4863-e8f2-e25a-550dca2076a9', 'fp_events_contacts', 'FP_events', 'fp_events', 'id', 'Contacts', 'contacts', 'id', 'fp_events_contacts_c', 'fp_events_contactsfp_events_ida', 'fp_events_contactscontacts_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('6079e4fc-0314-17dc-4741-550dc9f46a68', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Bugs', '0', '0');
INSERT INTO `relationships` VALUES ('616963e4-c724-a251-b18a-550dc9a71ea7', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('625f1194-80cc-3a0f-307f-550dca3c643b', 'am_tasktemplates_assigned_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('626b6189-3dd6-b294-8ff7-550dca0b2f7b', 'aos_contracts_aos_products_quotes', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('6282c535-fc31-85ec-6517-550dca2b8be9', 'aos_quotes_aos_product_quotes', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('64939f5b-1e3b-1c13-bf0c-550dca32d98b', 'aos_product_categories_modified_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('6529e49f-61ef-1f10-acb1-550dc98e3f49', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('656e20d6-eb4e-9559-f589-550dc917db3f', 'fp_event_locations_assigned_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('657f0204-dff1-9774-85c0-550dcacad929', 'securitygroups_notes', 'SecurityGroups', 'securitygroups', 'id', 'Notes', 'notes', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Notes', '0', '0');
INSERT INTO `relationships` VALUES ('66c2288d-8a76-deeb-dd5c-550dca08b9b1', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('67644043-23ba-f50f-ad84-550dc906a911', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Project', '0', '0');
INSERT INTO `relationships` VALUES ('6766cc96-cf37-984a-0f06-550dca39674a', 'jjwg_areas_created_by', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('6782f298-067e-97b8-31e8-550dc915ce65', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('68b2d044-ae11-bc74-4280-550dc9574be9', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('690da5af-8e7a-c2f6-6638-550dc91534aa', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('695bed30-8d8d-8d5f-5fa2-550dc959887b', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('69689089-bb14-57d8-4fd3-550dc958715a', 'cases_aop_case_events', 'Cases', 'cases', 'id', 'AOP_Case_Events', 'aop_case_events', 'case_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('6a86795f-048e-c288-5da1-550dca300842', 'am_projectholidays_created_by', 'Users', 'users', 'id', 'AM_ProjectHolidays', 'am_projectholidays', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('6aa525af-bc57-6922-c833-550dc9c97403', 'contact_aos_contracts', 'Contacts', 'contacts', 'id', 'AOS_Contracts', 'aos_contracts', 'contact_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('6d00591e-93a5-153d-165e-550dc91809f1', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('6d7d9530-fd9b-de89-a068-550dc904f60a', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'ProjectTask', '0', '0');
INSERT INTO `relationships` VALUES ('6de865fd-96f6-b1c0-b598-550dca4596a5', 'project_contacts_1', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'project_contacts_1_c', 'project_contacts_1project_ida', 'project_contacts_1contacts_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('701b1e95-d8f5-af4c-3ff5-550dc998802f', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('71281216-e2ef-e10c-12e7-550dc9f52a15', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', null, null, null, 'one-to-one', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('7195592e-dc27-f081-4eac-550dc9e744d5', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('71a509a0-2e52-9243-7b60-550dc9e974b0', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('729362cd-f50b-cd67-ebcd-550dc91fdf7d', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'schedulersjobs', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('72af8406-3ab5-53b4-fbe7-550dca62118d', 'aow_workflow_aow_processed', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Processed', 'aow_processed', 'aow_workflow_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('73886b27-ad53-cb77-5ac8-550dca31ac2d', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('743f8deb-ae9b-8b8f-0f43-550dc9008992', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('74620f81-8b75-6b47-5dcf-550dc9a60986', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('74f950b9-68f7-1dde-30c3-550dcaedc188', 'jjwg_maps_assigned_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('751f099d-c3c8-8df4-3842-550dc97ab2bb', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('77025395-4136-69c5-ef55-550dcaa7f252', 'aos_product_quotes_aos_products', 'AOS_Products', 'aos_products', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'product_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('7727d2f3-e63a-3f52-8544-550dcac3df40', 'jjwg_address_cache_modified_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('77852a68-f9c2-f715-444c-550dc9196ec2', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('779c1a3d-7df6-37bb-86df-550dca184484', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('7800da25-0f3b-e97b-c186-550dcac3ddae', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', '0', '0');
INSERT INTO `relationships` VALUES ('7810ff24-db8e-79c4-0c1b-550dca14a276', 'aop_case_updates_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('782320d3-0589-1fdc-b935-550dca1fff8c', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('78ac0f8d-e41f-b707-2dae-550dca4c6f08', 'aow_actions_created_by', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('78b5bce3-8505-c7b2-e3d9-550dc9b6ff4e', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', '0', '0');
INSERT INTO `relationships` VALUES ('79610741-04f4-fc06-e5ec-550dc9c522a2', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('7aaad55f-af13-bfaf-637b-550dca3f1bef', 'aos_pdf_templates_assigned_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('7c343207-30c6-d157-e450-550dc917fba5', 'aod_indexevent_modified_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('7c6a5281-e049-10c0-c155-550dc98b004f', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('7d4e2c63-7d1d-c5fc-9301-550dcad8ca05', 'aos_invoices_modified_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('7dce0191-ff8d-24da-94f6-550dc9fa40e5', 'fp_event_locations_modified_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('80d9aacc-aea4-4e67-8231-550dca9aece5', 'aos_contracts_aos_line_item_groups', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8120d501-7c71-9712-6fe2-550dcaa332eb', 'securitygroups_contacts', 'SecurityGroups', 'securitygroups', 'id', 'Contacts', 'contacts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Contacts', '0', '0');
INSERT INTO `relationships` VALUES ('82139ddd-569e-eeef-0746-550dc977e0d3', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('82143e59-f0d2-389d-1637-550dc9a80493', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8223d6f2-cc6a-ace4-443d-550dcab95150', 'aos_quotes_aos_line_item_groups', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('82da41ee-38ad-863c-e4b3-550dc90a5cee', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('83452b14-e002-25a5-20ea-550dca201034', 'aos_product_categories_created_by', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('83d0dc93-dbf0-13cc-d366-550dca8fc320', 'fp_events_fp_event_locations_1', 'FP_events', 'fp_events', 'id', 'FP_Event_Locations', 'fp_event_locations', 'id', 'fp_events_fp_event_locations_1_c', 'fp_events_fp_event_locations_1fp_events_ida', 'fp_events_fp_event_locations_1fp_event_locations_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('84b3575a-881d-e1f7-2977-550dc9b2f0a6', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('84d78d16-5df6-c870-6152-550dc91f15e3', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('85bb2779-7d54-0a25-d4ad-550dcab47811', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('85ff6701-933b-de22-bad6-550dc92f05fd', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', '0', '0');
INSERT INTO `relationships` VALUES ('86ac9184-9c3c-a202-c16b-550dca9d986a', 'aos_contracts_documents', 'AOS_Contracts', 'aos_contracts', 'id', 'Documents', 'documents', 'id', 'aos_contracts_documents', 'aos_contracts_id', 'documents_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('870c167d-91d3-aebd-7794-550dc9b0d81b', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', null, null, null, 'one-to-many', 'target_type', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('88979eef-c35a-48d5-5fdd-550dca5980e0', 'securitygroups_opportunities', 'SecurityGroups', 'securitygroups', 'id', 'Opportunities', 'opportunities', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Opportunities', '0', '0');
INSERT INTO `relationships` VALUES ('8965ce66-da71-4d6f-94cf-550dc9103b63', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8ab95011-f1ac-2323-3997-550dc960c33a', 'contacts_aop_case_updates', 'Contacts', 'contacts', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'contact_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8b30bc5c-f2fd-0fb5-2dcd-550dcae3b32b', 'am_projectholidays_assigned_user', 'Users', 'users', 'id', 'AM_ProjectHolidays', 'am_projectholidays', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8b69a107-0eb4-ab4b-d882-550dc910c11a', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8b905fc1-4610-6473-4700-550dc9fa6d16', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8bb2e415-0b53-7ebd-be55-550dc99ce57d', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('8bc8d1d2-4c4a-3256-19cd-550dca6dcffb', 'jjwg_areas_assigned_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8c0879dc-eb13-d3bb-8a4c-550dca7e6a60', 'aos_line_item_groups_modified_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8d1477b2-e0c7-8275-d86f-550dc92534cf', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8d448925-4c60-f775-9dc6-550dc9d4ee39', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8d925f6c-e59c-b7d4-57f8-550dc91d2a90', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8f070d6c-27d6-40b3-b247-550dc915c57b', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8f84908a-7d58-3785-4f1e-550dc9edbfd2', 'optimistic_locking', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0');
INSERT INTO `relationships` VALUES ('8fc64081-7a0d-b904-51c5-550dcad40477', 'project_users_1', 'Project', 'project', 'id', 'Users', 'users', 'id', 'project_users_1_c', 'project_users_1project_ida', 'project_users_1users_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('900380d4-6008-8091-eed5-550dc97d2f21', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('9015958d-4071-3e93-d6eb-550dc9450870', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('90af3279-1fa3-3ce2-40c8-550dca9bcc6b', 'aor_charts_created_by', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('921bbacb-9d44-435e-653d-550dc900dce5', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('937a594b-3ef7-d68f-5ed3-550dcab8acf4', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('938192cf-f6b9-7d76-5156-550dc9bf529c', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Calls', '0', '0');
INSERT INTO `relationships` VALUES ('93d53e98-835c-2203-638c-550dc95dea52', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('93f9b888-242f-5541-318f-550dc929ec5e', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', null, null, null, 'one-to-one', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('945dcbd5-e304-a326-4e88-550dcaf45fe7', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('94eb93d6-ce22-7935-b291-550dcad91ccb', 'cases_aop_case_updates', 'Cases', 'cases', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'case_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('95763d47-4643-03c3-faa4-550dca77beb8', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('960b89ff-7d2c-70f5-7efe-550dc9939248', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Bugs', '0', '0');
INSERT INTO `relationships` VALUES ('96ce41c2-eb80-b2bf-3cf2-550dc9e77e84', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('98a13878-e168-50c5-1cd6-550dca306dcd', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('9a30f5b8-a972-859a-3232-550dc9c41e42', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('9b626fd9-03b9-9e87-dd26-550dc985b406', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('9dc6c65d-f68c-1851-5ea7-550dca8b9c47', 'jjwg_markers_modified_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('9e232c47-4bf2-b4e0-a392-550dcaf71daf', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', '0', '0');
INSERT INTO `relationships` VALUES ('9ee208a5-3b84-ca17-f287-550dcaaded64', 'aow_workflow_assigned_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a1887cb6-e900-196e-0c16-550dc94b678a', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Cases', '0', '0');
INSERT INTO `relationships` VALUES ('a1fc21ba-fadf-24ac-5911-550dca679d0e', 'securitygroups_documents', 'SecurityGroups', 'securitygroups', 'id', 'Documents', 'documents', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Documents', '0', '0');
INSERT INTO `relationships` VALUES ('a2530937-91c1-2778-1a22-550dcac9ad46', 'aos_invoices_created_by', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a271748c-9e82-0d57-5fa1-550dc91c3790', 'aod_indexevent_created_by', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a2fecde6-a420-0915-ce8c-550dc9984caf', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a32591a7-7959-4125-55fe-550dc9647c43', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('a456066c-d2c4-253b-7c72-550dca8af98d', 'aos_products_assigned_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a6957b31-501b-317a-c423-550dc956d46d', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a6d19f0e-962d-5a1e-1354-550dc94c18ac', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a752f75b-5c9a-7636-e555-550dca450300', 'aos_product_categories_assigned_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a79b2036-b75d-57af-f504-550dca7d4359', 'securitygroups_project', 'SecurityGroups', 'securitygroups', 'id', 'Project', 'project', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Project', '0', '0');
INSERT INTO `relationships` VALUES ('a8a5894d-a5c8-ad1b-f331-550dc96d93cb', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a8d25eea-4253-9b68-cd12-550dca07b5f2', 'aow_conditions_modified_user', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a93e4ae9-7c07-deb7-82ff-550dc9a34c88', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('a999bc5f-94fe-6c65-1358-550dc91775ef', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', '0', '0');
INSERT INTO `relationships` VALUES ('aa5220e0-eb7d-92aa-6834-550dc9b47909', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('aa621c59-25a6-a559-23d9-550dc9f62f13', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('aad9326a-67d8-b1eb-35ba-550dca9ad66b', 'fp_events_leads_1', 'FP_events', 'fp_events', 'id', 'Leads', 'leads', 'id', 'fp_events_leads_1_c', 'fp_events_leads_1fp_events_ida', 'fp_events_leads_1leads_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('aadb58dc-a161-3609-be42-550dc9abdb24', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('abc77991-d7e2-c7e6-dc35-550dca0e2030', 'jjwg_address_cache_created_by', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ac28dd85-a96d-abeb-4804-550dc9b28264', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('ad0267f0-1057-1112-4735-550dc95ee821', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Opportunities', '0', '0');
INSERT INTO `relationships` VALUES ('add2a109-3527-401c-28de-550dcaa670ca', 'aor_reports_modified_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('addcd065-f542-b319-cf7f-550dcaef628d', 'aor_charts_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Charts', 'aor_charts', 'aor_report_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('adfceb02-eb2c-ebd7-2139-550dca24a6d3', 'securitygroups_acl_roles', 'SecurityGroups', 'securitygroups', 'id', 'ACLRoles', 'acl_roles', 'id', 'securitygroups_acl_roles', 'securitygroup_id', 'role_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('af9ebb7f-6277-02ec-5a6e-550dc9501629', 'unified_search', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b04d3713-a970-2697-4a05-550dca0bb568', 'aos_quotes_aos_contracts', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'aos_quotes_os_contracts_c', 'aos_quotese81e_quotes_ida', 'aos_quotes4dc0ntracts_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b14962a9-c61e-9755-2581-550dca665be2', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b1532c64-fd74-f0aa-ae0c-550dc982e677', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('b1bf6884-1956-e166-a093-550dc9f8f10c', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b37e8e65-676f-f3fb-4276-550dca29d187', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b3c01b8d-2a9c-73ab-02c6-550dcaa52517', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b4028ea4-a5b0-ed13-9ca0-550dc9da1fb9', 'calls_reschedule', 'Calls', 'calls', 'id', 'Calls_Reschedule', 'calls_reschedule', 'call_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b45392e6-782e-aaac-6db4-550dc9172eb4', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Contacts', '0', '0');
INSERT INTO `relationships` VALUES ('b56a1c53-3dc5-e65d-4532-550dca46300d', 'am_projecttemplates_modified_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b56d6b11-6182-d90a-d9a0-550dcab7b3e5', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b5819a77-026a-8487-0f7e-550dc93f8cd7', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', null, null, null, 'one-to-one', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b5a0f64a-1da5-4265-058a-550dc9e72806', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b5d8bf7d-dcf4-e7d6-2966-550dcab8fd50', 'aow_workflow_modified_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b6140d4d-79c5-bfa9-4ae9-550dca66ab5d', 'aos_line_item_groups_created_by', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b7bc3a61-8e03-4722-3388-550dc9fc8d7a', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b7f1ce43-f292-561b-08e0-550dc99cf37b', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Bugs', '0', '0');
INSERT INTO `relationships` VALUES ('b816f607-6b76-5b3d-3b87-550dc958ddfa', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b8703f62-d0a2-bc93-94f0-550dcaf39125', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('b9644408-7ab6-640f-f5be-550dca35c019', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', '0', '0');
INSERT INTO `relationships` VALUES ('ba717824-95a9-6f5b-50f0-550dc9c35b85', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('bcb4598c-f881-9bb2-73ca-550dc9f92f1a', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('bd531ec4-6978-fd94-5d62-550dc9582eac', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('bd814110-3481-1fa2-cf6d-550dc951f286', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('be0be5d0-6c53-1d06-320c-550dc9c5a874', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('beb007a1-ca71-c0e6-a6e4-550dc9be33f4', 'fp_events_modified_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('bf069142-ecba-10d2-d8f4-550dc9b3af4b', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Cases', '0', '0');
INSERT INTO `relationships` VALUES ('bfd3a5e9-3976-4298-df21-550dc976d20d', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('bff06286-fae8-c942-891f-550dc943e3c6', 'aod_indexevent_assigned_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c0dc4349-cfe6-39d6-3d1c-550dc911bab8', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('c121a938-1b3c-7116-574e-550dca59f265', 'jjwg_markers_created_by', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c13ae1d7-1c2f-0841-b35a-550dca5eaee0', 'aos_products_modified_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c3379403-4855-fd20-4a51-550dc91eff27', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c3e3998f-b9c8-95f7-543f-550dca65677e', 'securitygroups_emails', 'SecurityGroups', 'securitygroups', 'id', 'Emails', 'emails', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Emails', '0', '0');
INSERT INTO `relationships` VALUES ('c526669e-d85a-763f-8f9f-550dc92f3009', 'aod_index_modified_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c64a4ce0-67e9-ce67-1622-550dc963e05c', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c6780910-b2db-21eb-47bf-550dcaebde7a', 'aos_invoices_assigned_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c6c084a3-62d3-4aec-6255-550dca5e479c', 'aor_fields_modified_user', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c6e82dd1-d427-5615-5a68-550dc92e49a3', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c7b7bc3b-d028-b53b-90c7-550dca0b2250', 'securitygroups_modified_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c84dc12d-89e0-5169-8a53-550dc90303c4', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', '0', '0');
INSERT INTO `relationships` VALUES ('c84feb54-d021-4449-f4a1-550dc96f584c', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c8e87763-f914-6e7e-87d5-550dc9663593', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('c8f5da5a-5c38-86fd-34fe-550dc95cbf7e', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Meetings', '0', '0');
INSERT INTO `relationships` VALUES ('c9a4a9cb-7559-9650-e381-550dca19b1fd', 'sub_product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'parent_category_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ca22644f-f35d-f480-03af-550dc9498a71', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('cbbf440a-8455-0250-a7b2-550dca14dd5d', 'securitygroups_project_task', 'SecurityGroups', 'securitygroups', 'id', 'ProjectTask', 'project_task', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProjectTask', '0', '0');
INSERT INTO `relationships` VALUES ('cc95901d-d1f5-5018-5373-550dcafeff86', 'fp_events_prospects_1', 'FP_events', 'fp_events', 'id', 'Prospects', 'prospects', 'id', 'fp_events_prospects_1_c', 'fp_events_prospects_1fp_events_ida', 'fp_events_prospects_1prospects_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('cd56c77d-35bc-af57-d3e2-550dc9a22f69', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Project', '0', '0');
INSERT INTO `relationships` VALUES ('cdf037d1-fd25-c0f3-3f6f-550dcacd5601', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ce56da91-48e5-69e8-0ada-550dca950cfa', 'aor_reports_created_by', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ce8c9459-5aac-a711-9e81-550dca27f8c6', 'securitygroups_accounts', 'SecurityGroups', 'securitygroups', 'id', 'Accounts', 'accounts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('cf1b66a7-c6a2-ea32-675d-550dc9a75efd', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Opportunities', '0', '0');
INSERT INTO `relationships` VALUES ('cf9013a4-1876-8fed-1ba4-550dca842a6b', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('cfd8af66-3507-9574-3f6f-550dc921e7bd', 'contact_notes_parent', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Contacts', '0', '0');
INSERT INTO `relationships` VALUES ('d00810f4-9b39-8476-bc2f-550dc9367392', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d016f37a-01a1-9aea-c0ac-550dca8fd856', 'jjwg_address_cache_assigned_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d0a5ba4c-106f-a5fa-de82-550dca481226', 'aow_conditions_created_by', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d198b82b-d589-cb52-efec-550dca6886bd', 'aos_line_item_groups_assigned_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d2ab2275-5d5a-6ce2-5094-550dca4dcded', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d36a0b41-016e-314a-3dbc-550dc90e0173', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d3fdb731-972d-305b-4b83-550dca153abe', 'aos_quotes_aos_invoices', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Invoices', 'aos_invoices', 'id', 'aos_quotes_aos_invoices_c', 'aos_quotes77d9_quotes_ida', 'aos_quotes6b83nvoices_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d3fff9f1-e7ca-2bf9-fb2e-550dca974936', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d408b21e-9851-a403-226e-550dc9d29169', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d457b672-e9d9-be67-0946-550dca7a7ab0', 'aop_case_updates_notes', 'AOP_Case_Updates', 'aop_case_updates', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'AOP_Case_Updates', '0', '0');
INSERT INTO `relationships` VALUES ('d61339e7-982a-da1d-a161-550dc9f12808', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d652a272-ef7f-00d7-5342-550dc967e398', 'opportunity_aos_quotes', 'Opportunities', 'opportunities', 'id', 'AOS_Quotes', 'aos_quotes', 'opportunity_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d6d775e7-a898-1e8b-3fa1-550dca438b0c', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', '0', '0');
INSERT INTO `relationships` VALUES ('d78923b8-093a-ca68-d041-550dca2fd7de', 'am_projecttemplates_created_by', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d86674e2-9b06-f836-80cf-550dc988dd83', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('d92ecfb3-051f-b865-d29e-550dc9b573ca', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('dbbf08a4-ab98-77d7-6d3f-550dc9b67d72', 'fp_events_assigned_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('dc984138-00f1-0498-e379-550dc92bb5b8', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Cases', '0', '0');
INSERT INTO `relationships` VALUES ('dc9cf2ee-30a9-3653-c0a8-550dc9cfb5d8', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Prospects', '0', '0');
INSERT INTO `relationships` VALUES ('dd135251-e940-6146-0b4d-550dc912b95d', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('dd33daf6-8b4c-5a4b-8e35-550dc9cd82b6', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('de0f8718-951b-3861-980e-550dca772a5c', 'aow_actions_modified_user', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('de44561a-9732-4e27-5de2-550dc91ccbb5', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('df0f0d6d-5999-e0dc-41ca-550dca830ee8', 'aow_workflow_created_by', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('df59df66-b437-d359-f3e4-550dcaa0bdf9', 'jjwg_markers_assigned_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('dfe711da-8ee9-c54f-2b97-550dcad2fa80', 'aos_products_created_by', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e02ddcfa-5587-9f19-d932-550dc90308df', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Bugs', '0', '0');
INSERT INTO `relationships` VALUES ('e182e271-c70d-284f-2159-550dca3c10d5', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e22eb93e-62a5-f426-e118-550dc903c3d3', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e2c127f8-c2c6-3df3-231f-550dca0f8233', 'securitygroups_emailtemplates', 'SecurityGroups', 'securitygroups', 'id', 'EmailTemplates', 'email_templates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'EmailTemplates', '0', '0');
INSERT INTO `relationships` VALUES ('e361ff13-250d-d413-d149-550dca7895f7', 'aor_scheduled_reports_modified_user', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e41ed249-d5a2-cb42-9253-550dc959f462', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', '0', '0');
INSERT INTO `relationships` VALUES ('e46b7af0-8f34-89c6-1f5e-550dc922298a', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', '0', '0');
INSERT INTO `relationships` VALUES ('e53de71b-f9dd-8f21-b013-550dc9634e09', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e59799ed-c737-3870-e135-550dc91cfd02', 'fp_events_created_by', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e5a1c98b-6cbb-4988-db8b-550dcab1d43b', 'aos_invoices_aos_product_quotes', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e68251e0-3a06-652c-ffd3-550dc9867c5b', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e6827b9c-4549-ab24-ad36-550dca9a7fde', 'aor_fields_created_by', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e6b80450-6600-c96b-bf54-550dc986fe1c', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e7cc09bf-e623-c694-9d20-550dc90530a5', 'aop_case_events_modified_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('e9281c83-ec22-ccef-d1a4-550dc9a5f65c', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'ProjectTask', '0', '0');
INSERT INTO `relationships` VALUES ('e930c03d-8fff-84fc-7818-550dcaf4ff0a', 'aow_processed_modified_user', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('eaa90c7d-a40f-ef59-e627-550dcaadbb81', 'aos_quotes_project', 'AOS_Quotes', 'aos_quotes', 'id', 'Project', 'project', 'id', 'aos_quotes_project_c', 'aos_quotes1112_quotes_ida', 'aos_quotes7207project_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('eacf76ed-eaa5-983f-4eda-550dca002ccf', 'securitygroups_prospect_lists', 'SecurityGroups', 'securitygroups', 'id', 'ProspectLists', 'prospect_lists', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProspectLists', '0', '0');
INSERT INTO `relationships` VALUES ('eb08abdb-0050-1b54-fab0-550dca450b8f', 'calls_reschedule_modified_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ec4536df-f89f-031a-126b-550dcacf24d4', 'securitygroups_bugs', 'SecurityGroups', 'securitygroups', 'id', 'Bugs', 'bugs', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Bugs', '0', '0');
INSERT INTO `relationships` VALUES ('ec65b844-3fd2-54e5-d497-550dc9c141a2', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', null, null, null, 'one-to-many', 'target_type', 'Contacts', '0', '0');
INSERT INTO `relationships` VALUES ('ec6ade20-df9c-64d0-48c6-550dcab59cd8', 'am_projectholidays_project', 'Project', 'project', 'id', 'AM_ProjectHolidays', 'am_projectholidays', 'id', 'am_projectholidays_project_c', 'am_projectholidays_projectproject_ida', 'am_projectholidays_projectam_projectholidays_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ec917aa6-b9fb-20d2-3c80-550dc9b6513e', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', null, null, null, 'one-to-many', 'target_type', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('ecae2de1-343a-05c6-dfda-550dc91f190a', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('ececb1dc-9c14-4ee6-e795-550dca891f5d', 'aos_contracts_modified_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ed840952-35c5-578b-5b86-550dcae8a7ee', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ee4e1582-be58-817d-a220-550dca782a12', 'fp_event_locations_fp_events_1', 'FP_Event_Locations', 'fp_event_locations', 'id', 'FP_events', 'fp_events', 'id', 'fp_event_locations_fp_events_1_c', 'fp_event_locations_fp_events_1fp_event_locations_ida', 'fp_event_locations_fp_events_1fp_events_idb', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ee4e9a92-efdb-dc04-c66b-550dca47e499', 'securitygroups_created_by', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ee81bbf8-f9d8-af40-4358-550dcaafdf45', 'aor_reports_assigned_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ee8a4e57-64d7-bd90-4810-550dca2408a2', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('efe9d4d5-ac26-ab09-bf25-550dc91325e5', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Opportunities', '0', '0');
INSERT INTO `relationships` VALUES ('effb071a-593d-f3b9-6d03-550dc98a4d1b', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('f00e7753-257b-da6c-efe1-550dc9b5cbfd', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('f0539bc0-4c8f-7131-ae69-550dc9253f6c', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', null, null, null, 'one-to-many', 'parent_type', 'Project', '0', '0');
INSERT INTO `relationships` VALUES ('f174eab9-4f09-43ba-89fd-550dcaf0e8eb', 'aos_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'modified_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('f1b4f8d8-3768-4312-c956-550dca3bb7fb', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('f220138b-8bf1-157f-6ae1-550dcaf04542', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('f2ba63cd-6841-3c73-c5d5-550dc936dd7c', 'aod_index_created_by', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'created_by', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('f2eda278-97b1-7351-5b66-550dcad9a741', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', '0', '0');
INSERT INTO `relationships` VALUES ('f3289421-e847-eb11-d055-550dc99e7a76', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', '0', '0');
INSERT INTO `relationships` VALUES ('f3de9905-ef67-bc7d-421a-550dca454a37', 'groups_aos_product_quotes', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'group_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('f6fc01d4-fe96-b68b-fe53-550dca4cc6e9', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('f7cd0acd-e489-ae58-ae47-550dc9089f09', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', '0', '0');
INSERT INTO `relationships` VALUES ('fb61012d-f3f3-1ff8-f043-550dc9e92769', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('ff9605b4-25a1-5e7f-3f73-550dc9c51984', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', null, null, null, 'one-to-many', null, null, '0', '0');
INSERT INTO `relationships` VALUES ('fff50b16-15e5-bcad-22be-550dc91b7b49', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', null, null, null, 'one-to-many', null, null, '0', '0');

-- ----------------------------
-- Table structure for `releases`
-- ----------------------------
DROP TABLE IF EXISTS `releases`;
CREATE TABLE `releases` (
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

-- ----------------------------
-- Records of releases
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
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

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for `roles_modules`
-- ----------------------------
DROP TABLE IF EXISTS `roles_modules`;
CREATE TABLE `roles_modules` (
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

-- ----------------------------
-- Records of roles_modules
-- ----------------------------

-- ----------------------------
-- Table structure for `roles_users`
-- ----------------------------
DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_users
-- ----------------------------

-- ----------------------------
-- Table structure for `saved_search`
-- ----------------------------
DROP TABLE IF EXISTS `saved_search`;
CREATE TABLE `saved_search` (
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

-- ----------------------------
-- Records of saved_search
-- ----------------------------

-- ----------------------------
-- Table structure for `schedulers`
-- ----------------------------
DROP TABLE IF EXISTS `schedulers`;
CREATE TABLE `schedulers` (
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

-- ----------------------------
-- Records of schedulers
-- ----------------------------
INSERT INTO `schedulers` VALUES ('3036d4d1-cac1-efd2-d12e-550dc58fe584', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run Scheduled Reports', 'function::aorRunScheduledReports', '2005-01-01 11:15:00', null, '*::*::*::*::*', null, null, null, 'Active', '1');
INSERT INTO `schedulers` VALUES ('4d0ab373-75df-9c74-7c36-550dc4d5f527', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Prune SugarFeed Tables', 'function::trimSugarFeeds', '2005-01-01 12:30:01', '2020-12-31 23:59:59', '0::2::1::*::*', null, null, null, 'Active', '1');
INSERT INTO `schedulers` VALUES ('4e9d77ad-5bdc-a84c-984a-550dc4b789c5', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Removal of documents from filesystem', 'function::removeDocumentsFromFS', '2012-01-01 15:00:01', '2030-12-31 23:59:59', '0::3::1::*::*', null, null, null, 'Active', '0');
INSERT INTO `schedulers` VALUES ('584408b3-1b93-a757-0929-550dc47c90b3', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2005-01-01 16:15:01', '2020-12-31 23:59:59', '0::2::1::*::*', null, null, null, 'Active', '1');
INSERT INTO `schedulers` VALUES ('64796408-60b0-dc84-3c40-550dc40af99b', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2012-01-01 19:00:01', '2030-12-31 23:59:59', '0::5::*::*::*', null, null, null, 'Active', '0');
INSERT INTO `schedulers` VALUES ('65ec5fe4-34b0-1677-36eb-550dc437ba52', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2005-01-01 10:30:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', null, null, null, 'Active', '1');
INSERT INTO `schedulers` VALUES ('6b9352b1-299b-c7dc-dcfa-550dc4b19d10', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxes', '2005-01-01 17:45:01', '2020-12-31 23:59:59', '*::*::*::*::*', null, null, null, 'Inactive', '0');
INSERT INTO `schedulers` VALUES ('6bb4a770-26ba-3a77-96b8-550dc4b1d0cf', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2008-01-01 11:45:01', '2020-12-31 23:59:59', '*::*::*::*::*', null, null, null, 'Active', '0');
INSERT INTO `schedulers` VALUES ('6e9cfa0f-b773-4022-d71c-550dc4a66547', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2005-01-01 06:15:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', null, null, null, 'Active', '1');
INSERT INTO `schedulers` VALUES ('706c7cc1-9577-213e-771b-550dc4e73f96', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2005-01-01 18:00:01', '2020-12-31 23:59:59', '0::4::1::*::*', null, null, null, 'Inactive', '0');
INSERT INTO `schedulers` VALUES ('a26eef8d-ab0e-1b7e-4ae0-550dc5091bcf', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Perform Lucene Index', 'function::aodIndexUnindexed', '2005-01-01 11:15:00', null, '0::0::*::*::*', null, null, null, 'Active', '1');
INSERT INTO `schedulers` VALUES ('bb4f54c9-fd2f-9619-d01f-550dc5954f9b', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'AOP Check Inbound Mailboxes', 'function::pollMonitoredInboxesAOP', '2005-01-01 11:15:00', '2020-12-31 00:00:00', '*/1::*::*::*::*', null, null, null, 'Active', '0');
INSERT INTO `schedulers` VALUES ('d7743263-5b4b-14b3-dbc7-550dc47401cb', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Run AOW WorkFlow', 'function::processAOW_Workflow', '2005-01-01 19:45:01', '2020-12-31 23:59:59', '*::*::*::*::*', null, null, null, 'Active', '0');
INSERT INTO `schedulers` VALUES ('d8f4c323-4a52-777b-5b38-550dc5935d5d', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Optimise AOD Index', 'function::aodOptimiseIndex', '2005-01-01 11:15:00', null, '0::*/3::*::*::*', null, null, null, 'Active', '1');

-- ----------------------------
-- Table structure for `securitygroups`
-- ----------------------------
DROP TABLE IF EXISTS `securitygroups`;
CREATE TABLE `securitygroups` (
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

-- ----------------------------
-- Records of securitygroups
-- ----------------------------

-- ----------------------------
-- Table structure for `securitygroups_acl_roles`
-- ----------------------------
DROP TABLE IF EXISTS `securitygroups_acl_roles`;
CREATE TABLE `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of securitygroups_acl_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `securitygroups_audit`
-- ----------------------------
DROP TABLE IF EXISTS `securitygroups_audit`;
CREATE TABLE `securitygroups_audit` (
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

-- ----------------------------
-- Records of securitygroups_audit
-- ----------------------------

-- ----------------------------
-- Table structure for `securitygroups_default`
-- ----------------------------
DROP TABLE IF EXISTS `securitygroups_default`;
CREATE TABLE `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of securitygroups_default
-- ----------------------------

-- ----------------------------
-- Table structure for `securitygroups_records`
-- ----------------------------
DROP TABLE IF EXISTS `securitygroups_records`;
CREATE TABLE `securitygroups_records` (
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

-- ----------------------------
-- Records of securitygroups_records
-- ----------------------------

-- ----------------------------
-- Table structure for `securitygroups_users`
-- ----------------------------
DROP TABLE IF EXISTS `securitygroups_users`;
CREATE TABLE `securitygroups_users` (
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

-- ----------------------------
-- Records of securitygroups_users
-- ----------------------------

-- ----------------------------
-- Table structure for `sugarfeed`
-- ----------------------------
DROP TABLE IF EXISTS `sugarfeed`;
CREATE TABLE `sugarfeed` (
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

-- ----------------------------
-- Records of sugarfeed
-- ----------------------------

-- ----------------------------
-- Table structure for `tasks`
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
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

-- ----------------------------
-- Records of tasks
-- ----------------------------

-- ----------------------------
-- Table structure for `tracker`
-- ----------------------------
DROP TABLE IF EXISTS `tracker`;
CREATE TABLE `tracker` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tracker
-- ----------------------------

-- ----------------------------
-- Table structure for `upgrade_history`
-- ----------------------------
DROP TABLE IF EXISTS `upgrade_history`;
CREATE TABLE `upgrade_history` (
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

-- ----------------------------
-- Records of upgrade_history
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
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

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '$1$zB4.Ax1.$E43UCtlm9Wx67Xxp/wjIM/', '0', null, null, '1', null, 'Administrator', '1', '0', '1', null, '2015-03-21 19:13:07', '2015-03-21 19:31:46', '1', '', 'Administrator', null, null, null, null, null, null, null, 'Active', null, null, null, null, null, '0', '0', '1', 'Active', null, null, '', '0');

-- ----------------------------
-- Table structure for `users_feeds`
-- ----------------------------
DROP TABLE IF EXISTS `users_feeds`;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_feeds
-- ----------------------------

-- ----------------------------
-- Table structure for `users_last_import`
-- ----------------------------
DROP TABLE IF EXISTS `users_last_import`;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_last_import
-- ----------------------------

-- ----------------------------
-- Table structure for `users_password_link`
-- ----------------------------
DROP TABLE IF EXISTS `users_password_link`;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_password_link
-- ----------------------------

-- ----------------------------
-- Table structure for `users_signatures`
-- ----------------------------
DROP TABLE IF EXISTS `users_signatures`;
CREATE TABLE `users_signatures` (
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

-- ----------------------------
-- Records of users_signatures
-- ----------------------------

-- ----------------------------
-- Table structure for `user_preferences`
-- ----------------------------
DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
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

-- ----------------------------
-- Records of user_preferences
-- ----------------------------
INSERT INTO `user_preferences` VALUES ('298be884-e405-6251-a207-550dc79a5166', 'Home', '0', '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjc6e3M6MzY6IjM1Y2I1ODlhLTRiNzEtMTYzZi00MWJkLTU1MGRjNzBlN2MxZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxMzoiaUZyYW1lRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NDoiSG9tZSI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTM6Im1vZHVsZXMvSG9tZS9EYXNobGV0cy9pRnJhbWVEYXNobGV0L2lGcmFtZURhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6Mzp7czoxMDoidGl0bGVMYWJlbCI7czoxNzoiRGlzY292ZXIgU3VpdGVDUk0iO3M6MzoidXJsIjtzOjIzOiJodHRwOi8vd3d3LnN1aXRlY3JtLmNvbSI7czo2OiJoZWlnaHQiO2k6MzE1O319czozNjoiMzVlZGFlZjgtOTgzMC03Mzc4LTgyNzMtNTUwZGM3MzViMWE5IjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjE2OiJTdWdhckZlZWREYXNobGV0IjtzOjY6Im1vZHVsZSI7czo5OiJTdWdhckZlZWQiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjE7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjcxOiJjdXN0b20vbW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImFhZDExODc5LWNlYzYtYmZlYy1lZGE2LTU1MGRjNzdiZTllMyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjE4ZTZjMWEwLWY0Y2QtYzA5ZC00NTQwLTU1MGRjN2ZmZjE3OSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImIwOWY0ZWYzLWQ4MzEtZWVlNi05Zjk4LTU1MGRjNzVjMTEyOSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMWU5OTM3MTAtYThkZS1hYWFkLWRkMGItNTUwZGM3YjQxY2M4IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNmFmZTc1YWQtN2FhOC04MGY3LTZhODktNTUwZGM3N2I5NjU4IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjY6e2k6MDtzOjM2OiIzNWNiNTg5YS00YjcxLTE2M2YtNDFiZC01NTBkYzcwZTdjMWUiO2k6MTtzOjM2OiJhYWQxMTg3OS1jZWM2LWJmZWMtZWRhNi01NTBkYzc3YmU5ZTMiO2k6MjtzOjM2OiIxOGU2YzFhMC1mNGNkLWMwOWQtNDU0MC01NTBkYzdmZmYxNzkiO2k6MztzOjM2OiJiMDlmNGVmMy1kODMxLWVlZTYtOWY5OC01NTBkYzc1YzExMjkiO2k6NDtzOjM2OiIxZTk5MzcxMC1hOGRlLWFhYWQtZGQwYi01NTBkYzdiNDFjYzgiO2k6NTtzOjM2OiI2YWZlNzVhZC03YWE4LTgwZjctNmE4OS01NTBkYzc3Yjk2NTgiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjM1ZWRhZWY4LTk4MzAtNzM3OC04MjczLTU1MGRjNzM1YjFhOSI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ==');
INSERT INTO `user_preferences` VALUES ('2bb1fdd3-0b54-a54b-bc4f-550dcd7b83cf', 'Accounts2_ACCOUNT', '0', '2015-03-21 19:58:03', '2015-03-21 19:58:03', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
INSERT INTO `user_preferences` VALUES ('4f84536e-76cd-6dbe-2276-550dc743a592', 'Home2_SUGARFEED', '0', '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
INSERT INTO `user_preferences` VALUES ('5e6a1463-5083-e1e5-d918-550dc79eaab9', 'Home2_ACCOUNT', '0', '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
INSERT INTO `user_preferences` VALUES ('6bbc166b-6eb8-ece2-8b1a-550dc759fc35', 'Home2_MEETING', '0', '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
INSERT INTO `user_preferences` VALUES ('9f7949bc-1dbd-ccf4-41c2-550dc46a7de1', 'global', '0', '2015-03-21 19:13:07', '2015-03-21 19:31:46', '1', 'YToyNzp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6IjllY2U3NjgxLWYxYzEtZDI4OC04ZTM2LTU1MGRjNDY5MDM1ZCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVIiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6ODoidGltZXpvbmUiO3M6MTI6IkV1cm9wZS9QYXJpcyI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoxMzoic3VicGFuZWxfdGFicyI7czowOiIiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOi0xO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjt9');
INSERT INTO `user_preferences` VALUES ('c8fc0289-21f9-a907-6709-550dc7d6a930', 'ETag', '0', '2015-03-21 19:31:46', '2015-03-21 19:31:46', '1', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9');
INSERT INTO `user_preferences` VALUES ('cb5c5ae9-2234-9c4f-0c4d-550dc7955fd7', 'Home2_LEAD', '0', '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
INSERT INTO `user_preferences` VALUES ('d8e71dc6-e053-fbb1-1318-550dc7bcae83', 'Home2_CALL', '0', '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
INSERT INTO `user_preferences` VALUES ('e5185ca5-4295-89b9-8396-550dc7a4b7ee', 'Home2_OPPORTUNITY', '0', '2015-03-21 19:32:47', '2015-03-21 19:32:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

-- ----------------------------
-- Table structure for `vcals`
-- ----------------------------
DROP TABLE IF EXISTS `vcals`;
CREATE TABLE `vcals` (
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

-- ----------------------------
-- Records of vcals
-- ----------------------------

-- ----------------------------
-- Table structure for `versions`
-- ----------------------------
DROP TABLE IF EXISTS `versions`;
CREATE TABLE `versions` (
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

-- ----------------------------
-- Records of versions
-- ----------------------------
INSERT INTO `versions` VALUES ('4f7fc268-4358-21a1-133b-550dc4958803', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'htaccess', '3.5.1', '3.5.1');
INSERT INTO `versions` VALUES ('623f09dd-62f5-5466-b7e8-550dca076251', '0', '2015-03-21 19:45:30', '2015-03-21 19:45:30', '1', '1', 'Rebuild Relationships', '4.0.0', '4.0.0');
INSERT INTO `versions` VALUES ('76f4dd1a-0fd5-105a-d8df-550dc475bb18', '0', '2015-03-21 19:13:07', '2015-03-21 19:13:07', '1', '1', 'Chart Data Cache', '3.5.1', '3.5.1');
INSERT INTO `versions` VALUES ('dfa4c53b-60f2-54f8-56fa-550dca8f52d7', '0', '2015-03-21 19:45:30', '2015-03-21 19:45:30', '1', '1', 'Rebuild Extensions', '4.0.0', '4.0.0');
