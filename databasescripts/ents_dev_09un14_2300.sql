/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : ent

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-06-09 23:10:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aclgroup`
-- ----------------------------
DROP TABLE IF EXISTS `aclgroup`;
CREATE TABLE `aclgroup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `datecreated` datetime NOT NULL,
  `createdby` int(11) unsigned NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aclgroup
-- ----------------------------
INSERT INTO `aclgroup` VALUES ('1', 'Administrator', 'Overall system administrator', '2014-06-01 16:59:05', '1', null, null);
INSERT INTO `aclgroup` VALUES ('2', 'Job Coach', 'Logs activities against a client voucher', '2014-06-01 16:59:05', '1', null, null);
INSERT INTO `aclgroup` VALUES ('3', 'Data Clerk', 'Data entry assistant', '2014-06-01 16:59:05', '1', null, null);
INSERT INTO `aclgroup` VALUES ('4', 'Manager', 'Company management and reporting', '2014-06-01 16:59:05', '1', null, null);

-- ----------------------------
-- Table structure for `aclpermission`
-- ----------------------------
DROP TABLE IF EXISTS `aclpermission`;
CREATE TABLE `aclpermission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(11) unsigned DEFAULT NULL,
  `resourceid` int(11) unsigned NOT NULL,
  `create` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `edit` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `list` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `delete` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `export` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `approve` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `createdby` int(11) unsigned NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aclpermission_groupid` (`groupid`),
  KEY `fk_aclpermission_resourceid` (`resourceid`),
  CONSTRAINT `fk_aclpermission_groupid` FOREIGN KEY (`groupid`) REFERENCES `aclgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_aclpermission_resourceid` FOREIGN KEY (`resourceid`) REFERENCES `aclresource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aclpermission
-- ----------------------------
INSERT INTO `aclpermission` VALUES ('6', '1', '7', '1', '1', '1', '1', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('18', '2', '6', '0', '0', '1', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('19', '3', '6', '0', '0', '1', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('21', '4', '6', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('25', '2', '3', '0', '1', '1', '1', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('28', '4', '3', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('38', '2', '9', '1', '1', '1', '1', '0', '1', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('39', '3', '9', '1', '1', '1', '1', '0', '1', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('41', '4', '9', '1', '1', '1', '1', '0', '1', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('73', '3', '7', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('75', '3', '10', '0', '0', '1', '1', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('108', '1', '5', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('116', '1', '8', '0', '0', '1', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('117', '1', '3', '1', '1', '1', '1', '1', '1', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('118', '1', '9', '1', '1', '1', '1', '1', '1', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('120', '1', '6', '0', '0', '1', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('121', '1', '10', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('123', '1', '1', '0', '0', '1', '1', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('124', '1', '2', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('156', '2', '7', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('157', '2', '10', '0', '0', '1', '1', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('159', '2', '1', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('160', '2', '2', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('168', '2', '8', '0', '0', '1', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('169', '2', '5', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('172', '3', '1', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('173', '3', '2', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('183', '3', '8', '0', '0', '1', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('184', '3', '5', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('185', '3', '3', '0', '1', '1', '1', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('186', '4', '7', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('187', '4', '10', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('190', '4', '1', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('191', '4', '2', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('199', '4', '8', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('200', '4', '5', '0', '0', '0', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('201', '1', '11', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('202', '2', '11', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('203', '3', '11', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('204', '4', '11', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('205', '1', '12', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('206', '2', '12', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('207', '3', '12', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('208', '4', '12', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);

-- ----------------------------
-- Table structure for `aclresource`
-- ----------------------------
DROP TABLE IF EXISTS `aclresource`;
CREATE TABLE `aclresource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `create` tinyint(4) NOT NULL DEFAULT '0',
  `edit` tinyint(4) NOT NULL DEFAULT '0',
  `view` tinyint(4) NOT NULL DEFAULT '0',
  `list` tinyint(4) NOT NULL DEFAULT '0',
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  `approve` tinyint(4) NOT NULL DEFAULT '0',
  `export` tinyint(4) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `createdby` int(11) unsigned NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aclresource
-- ----------------------------
INSERT INTO `aclresource` VALUES ('1', 'Lookup Type', 'Look up types', '0', '0', '1', '1', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('2', 'Lookup Value', 'Values for the lookup type', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('3', 'User Account', 'A user within the application', '1', '1', '1', '1', '1', '0', '1', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('5', 'Role', 'Actions a member can execute on resources', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('6', 'Dashboard', 'user dashboard', '0', '0', '1', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('7', 'Application Settings', 'Application Administration', '1', '1', '1', '1', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('8', 'Report Dashboard', 'The different reports in the Application', '0', '0', '1', '0', '0', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('9', 'Client', 'The customer who reports a query', '1', '1', '1', '1', '1', '0', '1', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('10', 'Category', 'Categorisation functionality', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('11', 'Job', 'Client employment feature', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('12', 'Voucher', 'Client voucher module', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);

-- ----------------------------
-- Table structure for `aclusergroup`
-- ----------------------------
DROP TABLE IF EXISTS `aclusergroup`;
CREATE TABLE `aclusergroup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_group` (`groupid`,`userid`),
  KEY `fk_usergroup_userid` (`userid`),
  CONSTRAINT `fk_usergroup_groupid` FOREIGN KEY (`groupid`) REFERENCES `aclgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usergroup_userid` FOREIGN KEY (`userid`) REFERENCES `useraccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aclusergroup
-- ----------------------------
INSERT INTO `aclusergroup` VALUES ('1', '1', '1');
INSERT INTO `aclusergroup` VALUES ('37', '2', '3');
INSERT INTO `aclusergroup` VALUES ('38', '2', '4');
INSERT INTO `aclusergroup` VALUES ('41', '2', '6');
INSERT INTO `aclusergroup` VALUES ('39', '3', '5');
INSERT INTO `aclusergroup` VALUES ('32', '4', '2');

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `voucherid` int(11) unsigned DEFAULT NULL,
  `clientid` int(11) unsigned DEFAULT NULL,
  `employeeid` int(11) unsigned DEFAULT NULL,
  `activitydate` date DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `breakhours` decimal(10,2) unsigned DEFAULT NULL,
  `billablehours` decimal(10,2) unsigned DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  `expectedperformance` varchar(1000) DEFAULT NULL,
  `actualperformance` varchar(1000) DEFAULT NULL,
  `interventionplan` varchar(1000) DEFAULT NULL,
  `progressofintervention` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for `appconfig`
-- ----------------------------
DROP TABLE IF EXISTS `appconfig`;
CREATE TABLE `appconfig` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section` varchar(50) NOT NULL DEFAULT '',
  `sectiondisplay` varchar(50) DEFAULT NULL,
  `optionname` varchar(50) NOT NULL,
  `displayname` varchar(50) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `optionvalue` varchar(255) DEFAULT '',
  `optiontype` varchar(15) DEFAULT '',
  `active` enum('N','Y') DEFAULT 'Y',
  `editable` tinyint(4) unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `createdby` int(11) unsigned NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appconfig
-- ----------------------------
INSERT INTO `appconfig` VALUES ('1', 'backup', 'Backup Settings', 'retentionperiod', 'Backup Rentention Perid', 'Duration for which backups are kept', '30', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 15:34:21', null);
INSERT INTO `appconfig` VALUES ('2', 'backup', 'Backup Settings', 'scriptfolder', 'Folder for Backup Scripts', 'The path relative to the APPLICATION_PATH variable, use a starting / since the variable is a folder name', '/backup/scripts', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 15:34:21', null);
INSERT INTO `appconfig` VALUES ('3', 'backup', 'Backup Settings', 'usegzip', 'Gzip Backups', 'Whether to use gzip compression or not, options are yes and no', 'no', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 15:34:21', null);
INSERT INTO `appconfig` VALUES ('4', 'backup', 'Backup Settings', 'removesqlfile', 'Sql Backups', 'Remove SQL file after processing, options are yes and no', 'no', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 15:34:21', null);
INSERT INTO `appconfig` VALUES ('5', 'backup', 'Backup Settings', 'sendemail', 'Send Backups to Admin Email', 'Send backup via email, options are yes and no', 'no', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 15:34:21', null);
INSERT INTO `appconfig` VALUES ('6', 'country', 'Country Settings', 'currencysymbol', 'Currency Symbol', '', '$', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 18:25:00', null);
INSERT INTO `appconfig` VALUES ('7', 'country', 'Country Settings', 'currencycode', 'Currency Code', '', 'USD', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 18:25:00', null);
INSERT INTO `appconfig` VALUES ('8', 'country', 'Country Settings', 'currencydecimalplaces', 'Currreny decimal places', '', '2', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 18:25:00', null);
INSERT INTO `appconfig` VALUES ('9', 'country', 'Country Settings', 'mincurrencyvalue', 'Minimum currency amount', '', '0.01', 'decimal', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 18:25:00', null);
INSERT INTO `appconfig` VALUES ('10', 'country', 'Country Settings', 'maxcurrencyvalue', 'Maximum currency amount', '', '200', 'decimal', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 18:25:01', null);
INSERT INTO `appconfig` VALUES ('12', 'dateandtime', 'Date and Time Settings', 'shortformat', 'Short date display format', '', 'm/d/Y', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('13', 'dateandtime', 'Date and Time Settings', 'mediumformat', 'Long date display format', '', 'M j, Y', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('14', 'dateandtime', 'Date and Time Settings', 'longformat', 'Long date with week day', '', 'l, j F Y', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('15', 'dateandtime', 'Date and Time Settings', 'mysqlformat', 'Short date database format', '', '%m/%d/%Y', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('16', 'dateandtime', 'Date and Time Settings', 'mysqlmediumformat', 'Long date database format', '', '%d %b, %Y', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('17', 'dateandtime', 'Date and Time Settings', 'mysqldateandtimeformat', 'Long date with timestamp', '', '%m/%d/%Y - %H:%i:%s', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('19', 'password', 'User Profile Settings', 'passwordminlength', 'Minimum password length', 'The minimum length of a password', '6', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-03-25 10:52:59', null);
INSERT INTO `appconfig` VALUES ('20', 'dateandtime', 'Date and Time Settings', 'mindate', 'Date picker number of days ahead of current date', 'The minimum date for the date picker', '2', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('21', 'dateandtime', 'Date and Time Settings', 'maxdate', 'Date picker number of days before current date', 'The maximum date for the date picker', '2', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('22', 'dateandtime', 'Date and Time Settings', 'datepickerformat', 'Javascript long date', 'The format for Javascript dates', 'M dd, yy', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('23', 'dateandtime', 'Date and Time Settings', 'javascriptshortformat', 'Javascript short date', 'Short date for Javascript dates', 'm/dd/yy', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('24', 'uploads', 'File upload Options', 'docallowedformats', 'Allowed formats for document upload', 'Allowed document file formats', 'doc, docx, pdf, txt, rtf, odt', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:09:02', null);
INSERT INTO `appconfig` VALUES ('25', 'uploads', 'File upload Options', 'docmaximumfilesize', 'Maximum allowed size (bytes) for document uploads', 'Maximum size of a document in bytes', '4000000', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:09:02', null);
INSERT INTO `appconfig` VALUES ('26', 'password', 'User Profile Settings', 'passwordmaxlength', 'Maximum password length', 'The maximum length of a password', '20', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-03-25 10:52:59', null);
INSERT INTO `appconfig` VALUES ('30', 'notification', 'Notification and Email Options', 'emailmessagesender', 'Sender of email notifications', 'The email address the application uses to send out notifications', 'notifications@devmail.infomacorp.com', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('31', 'uploads', 'File upload Settings', 'photoallowedformats', 'Profile photo allowed formats', 'Allowed photo file formats', 'jpg, jpeg, png', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:09:02', null);
INSERT INTO `appconfig` VALUES ('32', 'uploads', 'File upload Settings', 'photomaximumfilesize', 'Maximum allowed size (bytes) for profile photo', 'Maximum size of a profile photo in bytes', '4000000', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:09:02', null);
INSERT INTO `appconfig` VALUES ('35', 'notification', 'Notification and Email Options', 'supportemailaddress', 'Contact us, feedback and support email address ', 'The address to which support emails are sent', 'support@devmail.infomacorp.com', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('36', 'dateandtime', 'Date and Time Settings', 'mindateofbirth', 'Date of birth number of years before today', 'The number of years before today for allowable date for the hire date', '100', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-02-12 14:08:46', null);
INSERT INTO `appconfig` VALUES ('37', 'password', 'User Profile Settings', 'usernamemaxlength', 'Minimum username length', '', '15', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-03-25 10:52:59', null);
INSERT INTO `appconfig` VALUES ('38', 'password', 'User Profile Settings', 'usernameminlength', 'Maximum username length', '', '4', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-03-25 10:52:59', null);
INSERT INTO `appconfig` VALUES ('39', 'country', 'Country Settings', 'countryisocode', 'Country standard iso code', '', 'US', 'text', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-02-12 18:25:01', null);
INSERT INTO `appconfig` VALUES ('40', 'country', 'Country Settings', 'phonemaxlength', 'Maximum digits allowed for phone number', '', '11', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-02-12 18:25:01', null);
INSERT INTO `appconfig` VALUES ('41', 'country', 'Country Settings', 'phoneminlength', 'Minimum digits allowed for phone number', '', '10', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-02-12 18:25:01', null);
INSERT INTO `appconfig` VALUES ('42', 'country', 'Country Settings', 'ssnminlength', 'Minimum digits allowed for SSN', '', '9', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-02-12 18:25:01', null);
INSERT INTO `appconfig` VALUES ('43', 'country', 'Country Settings', 'ssnmaxlength', 'Maximum digits allowed for SSN', '', '93', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-02-12 18:25:01', null);
INSERT INTO `appconfig` VALUES ('44', 'password', 'User Profile Settings', 'activationkeylength', 'The length of random account activation key', '', '6', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-03-25 10:52:59', null);
INSERT INTO `appconfig` VALUES ('45', 'notification', 'Notification and Email Options', 'notificationsendername', 'Name of sender for email notifications', '', 'ENT Support', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('46', 'country', 'Country Settings', 'countrycode', 'Phone number code prefix', '', '1', 'integer', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-02-12 18:25:01', null);
INSERT INTO `appconfig` VALUES ('53', 'country', 'Country Settings', 'timezone', 'Country timezone', '', 'UTC-07:00', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', null, null);
INSERT INTO `appconfig` VALUES ('54', 'notification', 'Notification and Email Options', 'errorlogemail', 'Email used to report errors and downtime', '', 'admin@devmail.infomacorp.com', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('55', 'notification', 'Notification and Email Options', 'smtpuser', 'SMPT User email', '', 'admin@devmail.infomacorp.com', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('56', 'notification', 'Notification and Email Options', 'smtphost', 'SMTP host ipaddress/domain', '', '127.0.0.1', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('57', 'notification', 'Notification and Email Options', 'smtppassword', 'SMTP Password', '', 'password', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('58', 'notification', 'Notification and Email Options', 'smtpport', 'SMTP Port', '', '25', 'integer', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('59', 'notification', 'Notification and Email Options', 'defaultadminemail', 'Default Admin email', '', 'admin@devmail.infomacorp.com', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('60', 'notification', 'Notification and Email Options', 'defaultadminname', 'Default Admin name', '', 'ENT Support', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-24 20:00:00', null);
INSERT INTO `appconfig` VALUES ('61', 'system', 'System and UI Settings', 'appname', 'Application name', '', 'ENT', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-22 14:13:15', null);
INSERT INTO `appconfig` VALUES ('62', 'system', 'System and UI Settings', 'companyname', 'Company name', '', 'Employment Network Team Of New Jersey', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-22 14:13:15', null);
INSERT INTO `appconfig` VALUES ('63', 'system', 'System and UI Settings', 'companysignoff', 'Company signoff', '', 'ENT Support', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-22 14:13:15', null);
INSERT INTO `appconfig` VALUES ('64', 'system', 'System and UI Settings', 'logotype', 'Logo Type', '1392299606.jpg', '0', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-22 14:13:15', null);
INSERT INTO `appconfig` VALUES ('65', 'system', 'System and UI Settings', 'copyrightinfo', 'Company Copyright', '', ' Copyright © 2014  |  ENT  |  All Rights Reserved', 'text', 'Y', '1', '2012-02-28 15:59:27', '1', '2014-03-22 14:13:15', null);
INSERT INTO `appconfig` VALUES ('66', 'profile', 'User Profile Settings', 'passwordminlength', 'Minimum password length', 'The minimum length of a password', '6', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-03-17 00:05:02', null);
INSERT INTO `appconfig` VALUES ('67', 'profile', 'User Profile Settings', 'passwordmaxlength', 'Maximum password length', 'The maximum length of a password', '20', 'integer', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-03-17 00:05:02', null);
INSERT INTO `appconfig` VALUES ('68', 'profile', 'User Profile Settings', 'usernamemaxlength', 'Minimum username length', '', '20', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-03-17 00:05:02', null);
INSERT INTO `appconfig` VALUES ('69', 'profile', 'User Profile Settings', 'usernameminlength', 'Maximum username length', '', '4', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-03-17 00:05:02', null);
INSERT INTO `appconfig` VALUES ('70', 'profile', 'User Profile Settings', 'activationkeylength', 'The length of random account activation key', '', '6', 'integer', 'Y', '1', '2011-05-18 09:55:32', '1', '2014-03-17 00:05:02', null);

-- ----------------------------
-- Table structure for `assignment`
-- ----------------------------
DROP TABLE IF EXISTS `assignment`;
CREATE TABLE `assignment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `userid` int(11) unsigned DEFAULT NULL,
  `role` tinyint(4) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `datedeassigned` datetime DEFAULT NULL,
  `deassignedbyid` int(11) unsigned DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assignment_clientid` (`clientid`),
  KEY `fk_assignment_userid` (`userid`),
  CONSTRAINT `fk_assignment_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_assignment_userid` FOREIGN KEY (`userid`) REFERENCES `useraccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assignment
-- ----------------------------
INSERT INTO `assignment` VALUES ('1', '12', '3', '2', '2014-05-28', null, '1', null, '2014-06-01 23:09:46', '1', null, null, null);
INSERT INTO `assignment` VALUES ('2', '11', '4', '2', '2014-05-28', null, '1', null, '2014-05-28 09:55:25', '1', null, null, null);
INSERT INTO `assignment` VALUES ('3', '10', '6', '2', '2014-05-28', null, '1', null, '2014-05-28 09:55:25', '1', null, null, null);
INSERT INTO `assignment` VALUES ('4', '9', '3', '2', '2014-05-28', null, '1', null, '2014-05-28 09:55:25', '1', null, null, null);

-- ----------------------------
-- Table structure for `audittrail`
-- ----------------------------
DROP TABLE IF EXISTS `audittrail`;
CREATE TABLE `audittrail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned DEFAULT NULL,
  `transactiontype` varchar(50) NOT NULL,
  `transactiondetails` mediumtext,
  `transactiondate` datetime NOT NULL,
  `executedby` int(11) unsigned DEFAULT NULL,
  `success` enum('N','Y') NOT NULL DEFAULT 'N',
  `browserdetails` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audittrail_transactiontype` (`transactiontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of audittrail
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `parentid` int(11) unsigned DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_parentid` (`parentid`),
  CONSTRAINT `fk_category_parentid` FOREIGN KEY (`parentid`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `initial` varchar(6) DEFAULT NULL,
  `home` varchar(15) DEFAULT NULL,
  `cell` varchar(15) DEFAULT NULL,
  `work` varchar(15) DEFAULT NULL,
  `ext` varchar(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` tinyint(4) unsigned DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `county` tinyint(4) unsigned DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `addressline1` varchar(250) DEFAULT NULL,
  `addressline2` varchar(250) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  `ssn` varchar(15) DEFAULT NULL,
  `programid` int(11) unsigned DEFAULT NULL,
  `funderid` int(11) unsigned DEFAULT NULL,
  `servicetypeid` int(11) unsigned DEFAULT NULL,
  `coachid` int(11) unsigned DEFAULT NULL,
  `communication` tinyint(4) unsigned DEFAULT NULL,
  `race` tinyint(4) unsigned DEFAULT NULL,
  `maritalstatus` tinyint(4) DEFAULT NULL,
  `housing` tinyint(4) unsigned DEFAULT NULL,
  `allergies` varchar(500) DEFAULT NULL,
  `iscriminal` tinyint(4) unsigned DEFAULT NULL,
  `criminalhistory` varchar(1000) DEFAULT NULL,
  `educationlevel` tinyint(4) unsigned DEFAULT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  `profilephoto` varchar(255) DEFAULT NULL,
  `userid` int(11) unsigned DEFAULT NULL,
  `initialvoucherid` int(11) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `resumefilename` varchar(255) DEFAULT NULL,
  `coverletterfilename` varchar(255) DEFAULT NULL,
  `dvrsref` varchar(15) DEFAULT NULL,
  `dddref` varchar(15) DEFAULT NULL,
  `dvrscounselor` varchar(255) DEFAULT NULL,
  `primarydiagnosis` tinyint(4) unsigned DEFAULT NULL,
  `primarycause` tinyint(4) unsigned DEFAULT NULL,
  `secondarydiagnosis` tinyint(4) unsigned DEFAULT NULL,
  `secondarycause` tinyint(4) unsigned DEFAULT NULL,
  `needsassessment` varchar(1000) DEFAULT NULL,
  `employmentgoal` varchar(1000) DEFAULT NULL,
  `contactperson` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `contactphone` varchar(15) DEFAULT NULL,
  `contactemail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_voucherid` (`initialvoucherid`),
  CONSTRAINT `fk_client_voucherid` FOREIGN KEY (`initialvoucherid`) REFERENCES `voucher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'Zinzi', 'France', null, '(609) 775-6568', '(609) 775-6568', null, null, null, '1', null, 'US', 'Brookfield', 'NJ', '10', '08400', '2 Ralawe Street\r\nLingelihle\r\n5881', '1270 Broadway', '2014-05-14 15:20:37', '1', '2014-05-27 15:53:36', null, '135-15-0001', '2', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2014-03-10', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('6', 'Ronel', 'Meyron', null, '(609) 671-9313', '(609) 671-9313', null, null, null, '1', null, 'US', 'Middletown Springs', 'NJ', '2', '08405', '9 Botterblom\r\nMiddelburg\r\n5900', '302 W. State Street ', '2014-05-23 11:49:14', '1', null, null, '135-15-0006', '3', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2014-03-10', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('9', 'Andrew', 'Belling', null, '(609) 309-1700', '(609) 309-1700', null, null, null, '1', null, 'US', 'Montgomery', 'NJ', '6', '08408', '7 kerk Street\r\nMiddelburg\r\n5900', '10 Ercher Street ', '2014-05-23 12:48:32', '1', null, null, '135-15-0009', '2', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2014-03-10', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('10', 'Venessa', 'Stalenberg', null, '(609) 584-1100', '(609) 584-1100', null, null, null, '2', null, 'US', 'Montgomery Center', 'NJ', '1', '08409', '38 Protea Avenue\r\nMidros \r\nMiddelburg\r\n5900', '77 Ewingville Road Ewing', '2014-05-23 13:53:19', '1', null, null, '135-15-0010', '3', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2014-03-10', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('11', 'Unathi', 'Goerge', null, '(732) 239-0778', '(732) 239-0778', null, null, null, '1', null, 'US', 'Montpelier', 'NJ', '8', '08410', '2572 Simphiwe Bleki\r\nKwanonzame\r\nMiddelburg EC\r\n5900', '78 W. Taylor Avenue Trenton', '2014-05-23 15:05:41', '1', null, null, '135-15-0011', '2', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2014-03-10', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('12', 'Popi', 'Westel', 'PW', '(732) 422-4565', '(732) 422-6521', '(732) 422-4825', '123', 'collin@domain.com', '1', '1976-11-02', 'US', 'Moretown', 'NJ', '6', '08411', '13 DanielsMidrosMiddelburg5900', '862 Yardville-Allentown Road Hamilton', '2014-05-23 15:15:14', '1', '2014-06-03 22:15:45', '1', '135-15-0001', '6', '1', '3', '3', null, '2', '2', null, 'none', '0', '', '4', null, '1401806632.jpg', null, '1', '2014-03-10', '1', 'LoremIpsum.pdf', 'testcover.pdf', '125692', '', 'Mitchell Paterson', '1', '1', null, null, 'Pellentesque elementum risus in eros tempus, nec tincidunt tortor consequat. Nam feugiat leo non enim fermentum condimentum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ut hendrerit magna.', 'ipsum dolor sit amet, consectetur adipiscing elit. Proin placerat.', 'Collin Mathew', 'Uncle', '(732) 542-6632', 'collin@domain.com');

-- ----------------------------
-- Table structure for `clienthistory`
-- ----------------------------
DROP TABLE IF EXISTS `clienthistory`;
CREATE TABLE `clienthistory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `isgoalreached` tinyint(4) unsigned DEFAULT NULL,
  `goaldetails` varchar(1000) DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `assessedbyid` int(11) unsigned DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `dateclosed` datetime DEFAULT NULL,
  `closedbyid` int(11) unsigned DEFAULT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clienthistory_clientid` (`clientid`),
  CONSTRAINT `fk_clienthistory_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clienthistory
-- ----------------------------
INSERT INTO `clienthistory` VALUES ('1', '12', '2014-03-10', null, null, null, null, null, null, '2014-06-03 22:08:46', '1', null, null, '1');

-- ----------------------------
-- Table structure for `clientskill`
-- ----------------------------
DROP TABLE IF EXISTS `clientskill`;
CREATE TABLE `clientskill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `skill` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clientskill_clientid` (`clientid`),
  CONSTRAINT `fk_clientskill_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clientskill
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `contactperson` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `county` tinyint(4) unsigned DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `addressline1` varchar(255) DEFAULT NULL,
  `addressline2` varchar(255) DEFAULT NULL,
  `defaultrate` decimal(10,2) unsigned DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_company_type` (`type`),
  KEY `index_company_county` (`county`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '1', 'Division of Developmental Disabilities', 'DDD', 'Monica Darell', 'ddd@domain.com', '(732) 968-5403', '(732) 968 4331', 'US', 'Greenbook', 'NJ', '9', '08812', 'Greenbook Regional Center', '275 Greenbook Road', '45.00', '2014-05-28 09:13:30', '1', null, null);
INSERT INTO `company` VALUES ('2', '1', 'Division Of Mental Health Services', 'DMHS', 'Monica Linn', 'dmhs@ent.com', '(732) 012-3456', null, 'US', null, 'NJ', '5', '08813', null, null, '50.00', '2014-05-28 09:40:32', '1', null, null);
INSERT INTO `company` VALUES ('3', '2', 'Wallmart', null, 'Jim Kommy', 'jim@wallmart.com', '255 025-5545', null, 'US', 'Grogory', 'NJ', '15', '07850', 'South street 278 Block A', 'asdas asdddad adasd', null, null, null, '2014-06-09 22:41:57', null);
INSERT INTO `company` VALUES ('4', '2', 'clean consults', null, 'asadsd', 'muko@dena.com', '5464161611', null, 'US', 'Junior', 'NJ', '12', '051515', 'sdnsikl sklm lsdsf', null, null, '2014-06-09 12:19:32', '1', '2014-06-09 13:13:51', null);
INSERT INTO `company` VALUES ('5', '2', 'companyname', null, 'contactperson', 'example@example.com', 'phone', null, 'US', 'city', 'NJ', '1', '90210', 'addressline1', 'addressline2', null, '2014-06-09 13:27:32', '1', null, null);
INSERT INTO `company` VALUES ('6', '2', 'asdadad', null, 'sdsfssf', 'sdsd@sdfs.dcfd', '232434', null, 'US', 'zxcxzxczcz', 'NJ', '3', '5446456', 'xzcvzxcz', 'xdcvxvxc', null, '2014-06-09 13:38:58', '1', null, null);
INSERT INTO `company` VALUES ('7', '2', 'Kingundu Systems Inc', null, 'asadasda', 'testsdas@devmail.infomacorp.com', '646162162', null, 'US', 'kampala', 'NJ', '9', '65512', 'asa knakjsdasdad', null, null, '2014-06-09 13:44:10', '1', '2014-06-09 16:05:14', null);

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `voucherid` int(11) unsigned DEFAULT NULL,
  `invoiceno` varchar(15) DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `invoiceamount` decimal(10,2) unsigned DEFAULT NULL,
  `hourstaken` decimal(10,2) unsigned DEFAULT NULL,
  `hoursremaining` decimal(10,2) unsigned DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_voucherid` (`voucherid`),
  CONSTRAINT `fk_invoice_voucherid` FOREIGN KEY (`voucherid`) REFERENCES `voucher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `employerid` int(11) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `jobtitle` varchar(255) DEFAULT NULL,
  `hoursperweek` decimal(10,2) unsigned DEFAULT NULL,
  `rate` decimal(10,2) unsigned DEFAULT NULL,
  `ratetype` tinyint(4) unsigned DEFAULT NULL,
  `medicaltype` tinyint(4) unsigned DEFAULT NULL,
  `medicalstartdate` date DEFAULT NULL,
  `workschedule` varchar(255) DEFAULT NULL,
  `supervisorname` varchar(255) DEFAULT NULL,
  `supervisorphone` varchar(15) DEFAULT NULL,
  `transportation` tinyint(4) unsigned DEFAULT NULL,
  `terminationtype` tinyint(4) unsigned DEFAULT NULL,
  `terminationreason` varchar(255) DEFAULT NULL,
  `islocked` tinyint(4) unsigned DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_clientid` (`clientid`),
  KEY `fk_job_employerid` (`employerid`),
  KEY `index_job_status` (`status`),
  CONSTRAINT `fk_job_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_employerid` FOREIGN KEY (`employerid`) REFERENCES `company` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '12', '3', '2014-05-26', null, '1', 'Grocery Assistant', '30.00', '12.00', '1', '1', '2014-05-28', '9am to 3pm. Mon, Wed, Fri', 'Willy Murefa', '1521516655', '2', '1', '', '0', null, '2014-06-04 19:59:37', '1', '2014-06-09 22:41:57', null);

-- ----------------------------
-- Table structure for `lookupquery`
-- ----------------------------
DROP TABLE IF EXISTS `lookupquery`;
CREATE TABLE `lookupquery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `querystring` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lookupquery
-- ----------------------------
INSERT INTO `lookupquery` VALUES ('1', 'ALL_USERS', 'Returns the list of all Users in the system', 'SELECT u.id as optionvalue, concat(u.firstname,\' \',u.lastname) as optiontext FROM useraccount u ORDER BY optiontext');
INSERT INTO `lookupquery` VALUES ('2', 'ALL_ACL_GROUPS', 'All defined ACL groups', 'SELECT id as optionvalue, name as optiontext FROM aclgroup');
INSERT INTO `lookupquery` VALUES ('3', 'ALL_RESOURCES', 'The resources that are secured within the application', 'SELECT r.name AS optiontext, r.id AS optionvalue FROM aclresource AS r ORDER BY optiontext');

-- ----------------------------
-- Table structure for `lookuptype`
-- ----------------------------
DROP TABLE IF EXISTS `lookuptype`;
CREATE TABLE `lookuptype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `displayname` varchar(50) NOT NULL,
  `listable` tinyint(4) unsigned DEFAULT '1',
  `updatable` tinyint(4) unsigned DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `datecreated` datetime NOT NULL,
  `createdby` int(11) unsigned NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lookuptype
-- ----------------------------
INSERT INTO `lookuptype` VALUES ('1', 'YES_NO', 'Yes No Boolean ', '1', '0', 'Yes, No value options.', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('2', 'TRANSACTION_TYPES', 'Transaction Types', '1', '0', 'System Audit Trail transaction types.', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('3', 'LIST_ITEM_COUNT_OPTIONS', 'Listing Items Per Page Values', '1', '0', 'Available number of items per page on lists', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('4', 'ACTIVE_STATUS', 'Active Status Boolean', '1', '0', 'Whether a user is active or not', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('5', 'GENDER', 'Gender Values', '1', '0', 'The different gender values', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('6', 'ACTION_STATUS', 'Activity Statuses', '1', '1', 'The progress status values', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('7', 'CONTACTUS_CATEGORIES', 'Contact Us Form Categories', '1', '1', 'The contactus form categories', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('8', 'SALUTATION', 'Salutations', '1', '1', 'The different salutations Mr, Mrs, Dr, etc', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('9', 'USER_STATUS', 'User Status Values', '1', '0', 'The user status flags.', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('10', 'NEW_JERSEY_COUNTIES', 'Counties in New Jersey', '1', '1', 'All the counties in New Jersey', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('11', 'MARITAL_STATUS_VALUES', 'Marital Status Values', '1', '1', 'The marital status values', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('12', 'EDUCATION_LEVELS', 'Education Level Values', '1', '1', 'The education level for clients', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('13', 'RACES', 'Client races', '1', '1', 'The race of client', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('14', 'DISABILITY_DIAGNOSIS_CODES', 'Disability Diagnosis Codes', '1', '1', 'Disability Diagnosis Codes', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('15', 'DISABILITY_CAUSE_CODES', 'Causes for Disability Impairment', '1', '1', 'Causes for Disability Impairment', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('16', 'COMMUNICATION_LEVELS', 'The communication levels', '1', '1', 'The communication levels', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('17', 'HOUSING_TYPES', 'The housing type values', '1', '1', 'The housing type values', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('18', 'CLIENT_SKILLS', 'Special client skills', '1', '1', 'The proffessional and vocational skills ', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('19', 'TRANSPORTATION_MODES', 'Client modes of transport', '1', '1', 'The client\'s mode of transportation to work', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('20', 'MEDICAL_TYPES', 'Client medical types', '1', '1', 'The client\'s medical types during job placement', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('21', 'WAGE_RATE_TYPES', 'The client rate type for employment', '1', '1', 'The type of rate used for the client job', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('22', 'JOB_STATUSES', 'The job status values', '1', '1', 'The job status values', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('23', 'JOB_TERMINATION_TYPES', 'The job termination types', '1', '1', 'The job termination types', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('24', 'VOUCHER_STATUS', 'The voucher status values', '1', '1', 'The voucher status values', '2014-06-01 12:00:00', '1', null, null);

-- ----------------------------
-- Table structure for `lookuptypevalue`
-- ----------------------------
DROP TABLE IF EXISTS `lookuptypevalue`;
CREATE TABLE `lookuptypevalue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lookuptypeid` int(11) unsigned DEFAULT NULL,
  `lookuptypevalue` varchar(50) DEFAULT NULL,
  `lookupvaluedescription` varchar(255) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `code` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lookuptypevalue_lookuptypeid` (`lookuptypeid`),
  KEY `index_lookuptypevalue_lookuptypevalue` (`lookuptypevalue`),
  KEY `index_lookuptypevalue_lookupvaluedescription` (`lookupvaluedescription`),
  CONSTRAINT `fk_lookuptypevalue_lookuptypeid` FOREIGN KEY (`lookuptypeid`) REFERENCES `lookuptype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lookuptypevalue
-- ----------------------------
INSERT INTO `lookuptypevalue` VALUES ('1', '1', '1', 'Yes', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('2', '1', '0', 'No', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('3', '2', 'Login', 'User login transaction', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('4', '2', 'Logout', 'User logout transaction', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('5', '2', 'Recover Password', 'User password recovery transaction', null, '1', '2012-03-01 12:00:00', '2013-12-23 14:14:55', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('6', '3', '10', '10', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('7', '3', '25', '25', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('8', '3', '50', '50', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('9', '3', '100', '100', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('10', '4', 'Active', 'Active', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('11', '4', 'In Active', 'In Active', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('12', '3', '250', '100', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('13', '3', '500', '100', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('14', '3', 'All', '100', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('19', '5', '1', 'Male', null, '1', '2012-03-22 12:06:17', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('20', '5', '2', 'Female', null, '1', '2012-03-22 12:06:28', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('21', '6', '1', 'Not Started', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('22', '6', '2', 'In Progress', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('23', '6', '3', 'Completed', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('24', '7', '1', 'Feedback', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('25', '7', '2', 'Ask a Question', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('26', '7', '3', 'Submit a Bug', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('27', '7', '4', 'Sign up Problems', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('28', '7', '5', 'Account compromised', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('29', '7', '6', 'Failed to Login', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('30', '7', '7', 'Suggestion', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('31', '7', '8', 'Need Help', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('32', '7', '9', 'Other', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('33', '8', '1', 'Dr', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('34', '8', '2', 'Ms', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('35', '8', '3', 'Mr', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('36', '8', '4', 'Mrs', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('37', '8', '5', 'Eng', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('38', '8', '6', 'Prof', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('78', '9', '0', 'Pending Activation', null, '1', '2013-12-06 22:16:10', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('79', '9', '1', 'Active', null, '1', '2013-12-06 22:16:24', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('80', '9', '2', 'Deactivated', null, '1', '2013-12-06 22:16:40', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('81', '10', '1', 'Bergen', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('85', '10', '2', 'Burlington', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('86', '10', '3', 'Camden', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('87', '10', '4', 'Cape May', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('88', '10', '5', 'Cumberland', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('89', '10', '6', 'Essex', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('90', '10', '7', 'Gloucester', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('91', '10', '8', 'Hudson', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('92', '10', '9', 'Hunterdon', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('93', '10', '10', 'Mercer', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('94', '10', '11', 'Middlesex', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('95', '10', '12', 'Monmouth', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('96', '10', '13', 'Morris ', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('97', '10', '14', 'Ocean', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('98', '10', '15', 'Passaic', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('99', '10', '16', 'Salem ', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('100', '10', '17', 'Somerset', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('101', '10', '18', 'Sussex ', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('102', '10', '19', 'Union', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('103', '10', '20', 'Warren', null, '1', '2014-05-27 16:01:53', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('104', '11', '1', 'Married', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('105', '11', '2', 'Single', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('106', '11', '3', 'Divorced', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('107', '11', '4', 'Widowed', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('108', '12', '1', 'Preschool', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('109', '12', '2', 'Elementary School', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('110', '12', '3', 'Middle School', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('111', '12', '4', 'High School', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('112', '12', '5', 'College Undergraduate', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('113', '12', '6', 'College Graduate', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('114', '12', '7', 'Vocation School', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('116', '13', '1', 'White American', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('117', '13', '2', 'Black American', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('118', '13', '3', 'Native American', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('119', '13', '4', 'Asian American', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('120', '13', '5', 'Native Hawaiians', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('121', '13', '6', 'Multiracial American', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('122', '13', '7', 'Hispanic or Latino', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('123', '14', '1', 'Hearing Loss', null, '1', '2014-06-01 12:00:00', null, null, '05', null);
INSERT INTO `lookuptypevalue` VALUES ('124', '14', '2', 'Loss of Speech', null, '1', '2014-06-01 12:00:00', null, null, '06', null);
INSERT INTO `lookuptypevalue` VALUES ('125', '15', '1', 'Cause Unknown', null, '1', '2014-06-01 12:00:00', null, null, '00', null);
INSERT INTO `lookuptypevalue` VALUES ('126', '15', '2', 'Road Accident', null, '1', '2014-06-01 12:00:00', null, null, '01', null);
INSERT INTO `lookuptypevalue` VALUES ('127', '16', '1', 'Phone', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('128', '16', '2', 'Email', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('129', '17', '1', 'Housing Type 1', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('132', '17', '2', 'Housing Type 2', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('133', '18', '1', 'Data Entry', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('134', '18', '2', 'Cleaning / Maintenance', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('135', '18', '3', 'Writing', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('136', '18', '4', 'Wood Works', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('137', '18', '5', 'Drama', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('138', '19', '1', 'Ambulance Service', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('139', '19', '2', 'County Bus Service', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('140', '19', '3', 'County Paratransit', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('141', '19', '4', 'Hudson Bergen Light Rail', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('142', '19', '5', 'Municipal Bus Service ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('143', '19', '6', 'Newark City Subway', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('144', '19', '7', 'NJ Local Transit Bus', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('145', '20', '1', 'Medical Type 1', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('146', '20', '2', 'Medical Type 2', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('147', '21', '1', 'Per Hour', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('148', '21', '2', 'Per Day', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('149', '21', '3', 'Per Week', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('150', '21', '4', 'Per Month', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('151', '22', '1', 'In Progress', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('152', '22', '0', 'Completed', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('153', '23', '1', 'Terminate Type 1', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('154', '23', '2', 'Terminate Type 2', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('155', '24', '1', 'In Progress', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('156', '24', '2', 'Pending Approval', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('157', '24', '3', 'Completed', null, '1', '2014-06-01 12:00:00', null, null, null, null);

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) unsigned DEFAULT NULL,
  `paymentdate` date DEFAULT NULL,
  `paymentamount` decimal(10,2) unsigned DEFAULT NULL,
  `checkno` varchar(15) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_invoiceid` (`invoiceid`),
  CONSTRAINT `fk_payment_invoiceid` FOREIGN KEY (`invoiceid`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for `service`
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `defaultrate` decimal(10,2) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('2', '2', 'Time-Limited Job Coaching', 'TLJC', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('3', '2', 'Supported Employment Intensive Job Coaching', 'SEJC', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('4', '2', 'American Sign Language Job Coaching', 'ASL', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('5', '2', 'Long-Term Follow-Along', 'LTFA', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('6', '1', 'SE-DVRS\r\nCDC\r\nTransition\r\nSE-DDD', 'SE-DVRS', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('7', '1', 'CDC', 'CDC', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('8', '1', 'Transition', 'Transition', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('9', '1', 'SE-DDD', 'SE-DDD', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('10', '2', 'Pre-Placement', 'Pre-Placement', null, null, null, '2014-05-28 09:50:57', '1', null, null);

-- ----------------------------
-- Table structure for `session`
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('08bm4dgd4834fog6q27slkb5a5', '1401812663', '21104000', 'Default|a:12:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('39klfv1p8p1shjaebalqhe6820', '1402343414', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('7ib1dtkj8cq642ah1bfc8mv821', '1401824433', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('eeudtg6hpl2kkbaqb26dhirkc1', '1401693181', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('fc7bgrq5ncuiurnef3d6a7pa16', '1401089166', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('gc83vl5d6lp09ool0o668te294', '1401113799', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('j59h7ksrvea2l8hrbuvr90nbc7', '1401089874', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jel4kp2igcm3sbc4mpknrilrf2', '1401109043', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jh468g0lmkp0dq9u3tcacco4u4', '1401099648', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('p2mgk7goj8c17c6ategktgrhs7', '1401194808', '21104000', 'Default|a:13:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('p5tjhckc57tdfkgk4tm6hd2772', '1401295890', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('rrs791nm4s71l4ppidtbjq89l5', '1401952402', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');

-- ----------------------------
-- Table structure for `useraccount`
-- ----------------------------
DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `othernames` varchar(50) DEFAULT NULL,
  `initial` varchar(6) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(50) DEFAULT '',
  `email` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `trx` varchar(50) DEFAULT NULL,
  `home` varchar(15) DEFAULT NULL,
  `work` varchar(15) DEFAULT NULL,
  `cell` varchar(15) DEFAULT NULL,
  `ext` varchar(6) DEFAULT NULL,
  `ssn` varchar(15) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `isactive` tinyint(4) unsigned DEFAULT '0',
  `activationkey` varchar(50) DEFAULT NULL,
  `activationdate` datetime DEFAULT NULL,
  `agreedtoterms` tinyint(1) unsigned DEFAULT '0',
  `bio` mediumtext,
  `profilephoto` varchar(255) DEFAULT '',
  `notes` varchar(1000) DEFAULT NULL,
  `securityquestion` tinyint(4) unsigned DEFAULT NULL,
  `securityanswer` tinyint(4) unsigned DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `county` tinyint(4) unsigned DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `addressline1` varchar(255) DEFAULT NULL,
  `addressline2` varchar(255) DEFAULT NULL,
  `isinvited` tinyint(4) unsigned DEFAULT NULL,
  `hasacceptedinvite` tinyint(4) unsigned DEFAULT NULL,
  `invitedbyid` int(11) unsigned DEFAULT NULL,
  `dateinvited` date DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_useraccount_isactive` (`isactive`) USING BTREE,
  KEY `index_useraccount_username` (`username`),
  KEY `index_useraccount_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraccount
-- ----------------------------
INSERT INTO `useraccount` VALUES ('1', '1', 'Edward ', 'Lawrence', 'Peterson', '', 'admin', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'admin@devmail.infomacorp.com', '', null, '(609) 510-3388', '', '', '', '', '1', '1950-01-01', '1', '', '2013-10-01 00:00:00', '1', '', '1401812058.jpg', '', null, null, 'US', '', 'NJ', '5', '', '', '', null, '0', null, null, '2014-05-00 00:00:00', '1', '2014-06-03 19:21:53', '1');
INSERT INTO `useraccount` VALUES ('2', '4', 'Jin', 'Browning', null, null, 'jbrowning', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'test1@devmail.infomacorp.com', null, null, '(609) 209-1001', null, null, null, null, '1', null, '1', '', '2014-04-04 15:24:29', '1', null, '', null, null, null, 'US', '', 'NJ', '1', null, null, null, null, '0', null, null, '2014-05-21 15:24:38', '1', '2014-05-24 12:53:17', '1');
INSERT INTO `useraccount` VALUES ('3', '2', 'Wing', 'Graves', null, null, 'wgraves', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'test2@devmail.infomacorp.com', null, null, '(609) 209-1002', null, null, null, null, '1', null, '1', '', '2014-04-08 20:20:38', '1', null, null, null, null, null, 'US', null, 'NJ', '14', null, null, null, null, '0', null, null, '2014-05-22 15:23:38', '1', '2014-04-08 23:26:17', null);
INSERT INTO `useraccount` VALUES ('4', '2', 'Brownell', 'Park', null, null, 'bpark', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'test3@devmail.infomacorp.com', null, null, '(609) 209-1003', null, null, null, null, '1', null, '1', '', '2014-04-24 09:14:45', '1', null, '', null, null, null, 'US', null, 'NJ', '9', null, null, null, null, '0', null, null, '2014-05-23 15:23:38', '1', '2014-04-24 09:14:45', '1');
INSERT INTO `useraccount` VALUES ('5', '3', 'Adrine', 'Max', null, null, 'amax', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'test4@devmail.infomacorp.com', null, null, '(609) 209-1004', null, null, null, null, '1', null, '1', '', '2014-04-24 09:04:31', '1', null, '', null, null, null, 'US', null, 'NJ', '2', null, null, null, null, '0', null, null, '2014-05-24 15:23:38', '1', '2014-04-24 09:04:31', '1');
INSERT INTO `useraccount` VALUES ('6', '2', 'Linda', 'Diena', null, null, 'lind', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'test5@devmail.infomacorp.com', null, null, '(609) 209-1005', null, null, null, null, '2', null, '1', '', '2014-05-22 12:23:13', '1', null, '', null, null, null, 'US', null, 'NJ', '9', null, null, null, null, '0', null, null, '2014-05-25 15:23:38', '1', '2014-05-22 12:23:13', '1');

-- ----------------------------
-- Table structure for `voucher`
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(11) unsigned DEFAULT NULL,
  `clientid` int(11) unsigned DEFAULT NULL,
  `servicetypeid` int(11) unsigned DEFAULT NULL,
  `voucherno` varchar(50) DEFAULT NULL,
  `dateapproved` date DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `hours` decimal(10,2) unsigned DEFAULT NULL,
  `days` tinyint(4) unsigned DEFAULT NULL,
  `rate` decimal(10,2) unsigned DEFAULT NULL,
  `employmentgoal` varchar(1000) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `isrenewable` tinyint(4) unsigned DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_voucher_clientid` (`clientid`),
  KEY `fk_voucher_parentid` (`parentid`),
  CONSTRAINT `fk_voucher_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_voucher_parentid` FOREIGN KEY (`parentid`) REFERENCES `voucher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES ('1', null, '12', '3', 'TS0005', '2014-03-04', '2014-03-10', null, '1', '20.00', '30', '55.00', null, null, null, '2014-05-29 17:20:05', '1', '2014-06-09 22:26:05', '1');
