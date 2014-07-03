/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : ent

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-07-03 13:17:29
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
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

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
INSERT INTO `aclpermission` VALUES ('209', '1', '13', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('210', '2', '13', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '0', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
INSERT INTO `aclresource` VALUES ('13', 'Activity', 'Client intervention activities', '1', '1', '1', '1', '1', '0', '0', '2014-06-01 12:00:00', '1', null, null);

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
  `coachid` int(11) unsigned DEFAULT NULL,
  `activitydate` date DEFAULT NULL,
  `activitysummary` varchar(255) DEFAULT NULL,
  `actcode` varchar(15) DEFAULT NULL,
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
  `notes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activity_voucherid` (`voucherid`),
  KEY `fk_activity_clientid` (`clientid`),
  KEY `fk_activity_userid` (`coachid`),
  CONSTRAINT `fk_activity_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_activity_userid` FOREIGN KEY (`coachid`) REFERENCES `useraccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_activity_voucherid` FOREIGN KEY (`voucherid`) REFERENCES `voucher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('4', '1', '12', '3', '2014-06-10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin placerat', null, '08:30:00', '11:30:00', '1.00', '2.00', '2014-06-16 19:39:06', '1', '2014-06-16 19:39:43', null, 'Proin viverra ipsum quis sapien tempor faucibus. Ut feugiat urna sed enim aliquet, sagittis suscipit nulla sodales. Integer bibendum quis elit non interdum. Quisque lorem felis, laoreet consequat sodales a, porta non ligula.', 'Morbi lobortis feugiat orci eu laoreet. Phasellus elementum velit non metus elementum, at dapibus erat mollis. Donec non eros quis orci vulputate vehicula ut quis augue. Phasellus a vestibulum', 'Pellentesque elementum risus in eros tempus, nec tincidunt tortor consequat. Nam feugiat leo non enim fermentum condimentum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ut hendrerit magna', 'Cras congue nisl et ornare dignissim. Proin ut lacus nunc. Sed quis tortor non felis tempus auctor. Ut aliquet arcu elementum risus sagittis, quis malesuada tortor mattis. Curabitur non convallis ligula. Fusce massa nisl, lacinia bibendum accumsan vel, porttitor ut purus. Vestibulum pharetra libero at sapien pretium semper nec quis nibh. Aliquam massa lorem,', null);
INSERT INTO `activity` VALUES ('5', '1', '12', '3', '2014-06-13', 'Pellentesque congue lacus massa, nec convallis sem rutrum tempor. ', null, '14:00:00', '16:00:00', '0.00', '2.00', '2014-06-16 19:41:43', '1', null, null, 'Quisque placerat aliquet magna quis elementum. Curabitur in molestie felis, a vulputate ipsum. Vestibulum pharetra pharetra ante, a molestie mi malesuada id.', 'Donec nec felis sit amet magna faucibus vestibulum. Praesent magna justo, consectetur ut urna sit amet, facilisis sodales tortor. Nulla semper ac lacus et accumsan. ', 'Aenean bibendum gravida lectus id facilisis. Proin ut urna nec turpis feugiat lobortis at vitae lectus. Etiam euismod leo nec pulvinar congue. Maecenas quam tellus, luctus at sollicitudin sit amet', 'Curabitur commodo posuere tellus, vel suscipit metus vulputate eu. Duis convallis, ipsum vitae tristique lobortis, velit leo ultricies enim, id hendrerit diam lorem eu purus.', null);

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
-- Table structure for `assessmentdetails`
-- ----------------------------
DROP TABLE IF EXISTS `assessmentdetails`;
CREATE TABLE `assessmentdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `subtype` tinyint(4) unsigned DEFAULT NULL,
  `parentid` int(11) unsigned DEFAULT NULL,
  `value1` varchar(500) DEFAULT NULL,
  `value2` varchar(500) DEFAULT NULL,
  `value3` varchar(500) DEFAULT NULL,
  `value4` varchar(500) DEFAULT NULL,
  `value5` varchar(500) DEFAULT NULL,
  `value6` varchar(500) DEFAULT NULL,
  `value7` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assessmentdetails_clientid` (`clientid`),
  CONSTRAINT `fk_assessmentdetails_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assessmentdetails
-- ----------------------------
INSERT INTO `assessmentdetails` VALUES ('61', '12', '3', '1', null, '8am', '9am', '10am', '9am', '8am', null, null);
INSERT INTO `assessmentdetails` VALUES ('62', '12', '3', '2', null, '3pm', '4pm', '5pm', '5pm', '5pm', null, null);
INSERT INTO `assessmentdetails` VALUES ('65', '12', '5', null, null, 'John Doe', 'Brother', 'jdoe@domain.com', '732 4510656', null, null, null);
INSERT INTO `assessmentdetails` VALUES ('66', '12', '4', null, null, 'Kimbery High School', 'Mercer', null, 'Information Systems', '2008', null, null);
INSERT INTO `assessmentdetails` VALUES ('68', '12', '1', '1', null, 'Pellentesque congue lacus massa', null, null, null, null, null, null);
INSERT INTO `assessmentdetails` VALUES ('69', '12', '1', '2', null, 'Nec convallis sem rutrum tempor', null, null, null, null, null, null);
INSERT INTO `assessmentdetails` VALUES ('70', '12', '1', '3', null, 'Quisque placerat aliquet magna', null, null, null, null, null, null);
INSERT INTO `assessmentdetails` VALUES ('71', '12', '2', null, null, 'Rihanna', '23', 'spouse', null, null, null, null);
INSERT INTO `assessmentdetails` VALUES ('72', '12', '2', null, null, 'Jessica', '1', 'daughter', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  `middlename` varchar(255) DEFAULT NULL,
  `initial` varchar(6) DEFAULT NULL,
  `home` varchar(15) DEFAULT NULL,
  `cell` varchar(15) DEFAULT NULL,
  `work` varchar(15) DEFAULT NULL,
  `ext` varchar(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
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
  `allergies` varchar(500) DEFAULT NULL,
  `iscriminal` tinyint(4) unsigned DEFAULT NULL,
  `criminalhistory` text,
  `bio` text,
  `profilephoto` varchar(255) DEFAULT NULL,
  `userid` int(11) unsigned DEFAULT NULL,
  `initialvoucherid` int(11) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `referraldate` date DEFAULT NULL,
  `assessmentdate` date DEFAULT NULL,
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
  `contactcell` varchar(15) DEFAULT NULL,
  `contactemail` varchar(255) DEFAULT NULL,
  `contactperson2` varchar(255) DEFAULT NULL,
  `relationship2` varchar(255) DEFAULT NULL,
  `contactphone2` varchar(15) DEFAULT NULL,
  `contactcell2` varchar(15) DEFAULT NULL,
  `contactemail2` varchar(255) DEFAULT NULL,
  `referralinforeceived` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `incomesources` varchar(255) DEFAULT NULL,
  `totalmonthlyincome` decimal(10,2) unsigned DEFAULT NULL,
  `reduceincomebenefit` tinyint(4) unsigned DEFAULT NULL,
  `providedwithbenefitinfo` tinyint(4) unsigned DEFAULT NULL,
  `requiresmedicalaccomodation` tinyint(4) unsigned DEFAULT NULL,
  `therapytreatment` varchar(255) DEFAULT NULL,
  `housing` tinyint(4) unsigned DEFAULT NULL,
  `householdcount` varchar(15) DEFAULT NULL,
  `oncallhousesupport` tinyint(4) unsigned DEFAULT NULL,
  `qualityoflife` tinyint(4) unsigned DEFAULT NULL,
  `partnername` varchar(255) DEFAULT NULL,
  `yearsinrship` varchar(15) DEFAULT NULL,
  `jobpreferred` varchar(50) DEFAULT NULL,
  `jobpreferred1` varchar(50) DEFAULT NULL,
  `workshift` varchar(25) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT NULL,
  `dateavailable` varchar(50) DEFAULT NULL,
  `hoursavailableperweek` decimal(10,2) unsigned DEFAULT NULL,
  `traveldistance` varchar(15) DEFAULT NULL,
  `desiredhourlyrate` varchar(15) DEFAULT NULL,
  `transportation` varchar(15) DEFAULT NULL,
  `educationlevel` tinyint(4) unsigned DEFAULT NULL,
  `contactschooltoverify` tinyint(4) unsigned DEFAULT NULL,
  `experiencedlearningproblems` tinyint(4) unsigned DEFAULT NULL,
  `learningproblems` varchar(255) DEFAULT NULL,
  `academicskillsdetails` text,
  `formaleducinterests` varchar(255) DEFAULT NULL,
  `learningstyles` varchar(500) DEFAULT NULL,
  `typingspeed` varchar(15) DEFAULT NULL,
  `driverslicenseno` varchar(15) DEFAULT NULL,
  `specialinfoforjobapplied` text,
  `cancontactreferences` tinyint(4) unsigned DEFAULT NULL,
  `whynotcontact` varchar(255) DEFAULT NULL,
  `onprobation` tinyint(4) unsigned DEFAULT NULL,
  `convictedoffelony` tinyint(4) unsigned DEFAULT NULL,
  `convictedofmisdemeanor` tinyint(4) unsigned DEFAULT NULL,
  `convictiondetails` varchar(255) DEFAULT NULL,
  `employertheftcase` tinyint(4) unsigned DEFAULT NULL,
  `theftcasedetails` varchar(255) DEFAULT NULL,
  `isveteran` tinyint(4) unsigned DEFAULT NULL,
  `servicebranch` varchar(50) DEFAULT NULL,
  `technicalspeciality` varchar(50) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `dischargetype` tinyint(4) unsigned DEFAULT NULL,
  `iscombat` tinyint(4) unsigned DEFAULT NULL,
  `combatproblems` varchar(255) DEFAULT NULL,
  `combatproblemstreated` tinyint(4) unsigned DEFAULT NULL,
  `employmentdifficulty` varchar(255) DEFAULT NULL,
  `difficultydetails` varchar(500) DEFAULT NULL,
  `currentevents` varchar(255) DEFAULT NULL,
  `pastevents` varchar(255) DEFAULT NULL,
  `supportservices` varchar(255) DEFAULT NULL,
  `jobassistcontact` varchar(255) DEFAULT NULL,
  `awareofopportunities` varchar(255) DEFAULT NULL,
  `assistivedevice` varchar(255) DEFAULT NULL,
  `selfstrengths` text,
  `selfabilities` text,
  `potentialbarriers` text,
  `barriersolutions` text,
  `medicalconditions` varchar(500) DEFAULT NULL,
  `physicallimatations` varchar(500) DEFAULT NULL,
  `psychologicallimitations` varchar(500) DEFAULT NULL,
  `medicationregimen` varchar(500) DEFAULT NULL,
  `nutritionalstatus` varchar(500) DEFAULT NULL,
  `livingconditions` varchar(500) DEFAULT NULL,
  `lifestyle` varchar(500) DEFAULT NULL,
  `medicalaccesssafety` varchar(500) DEFAULT NULL,
  `livingenvironment` varchar(500) DEFAULT NULL,
  `transportationsafety` varchar(500) DEFAULT NULL,
  `socialrships` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_voucherid` (`initialvoucherid`),
  KEY `fk_client_servicetypeid` (`servicetypeid`),
  KEY `fk_client_programid` (`programid`),
  CONSTRAINT `fk_client_programid` FOREIGN KEY (`programid`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_client_servicetypeid` FOREIGN KEY (`servicetypeid`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_client_voucherid` FOREIGN KEY (`initialvoucherid`) REFERENCES `voucher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'Zinzi', 'France', null, null, '(609) 775-6568', '(609) 775-6568', null, null, null, null, '1', null, 'US', 'Brookfield', 'NJ', '10', '08400', '2 Ralawe Street\r\nLingelihle\r\n5881', '1270 Broadway', '2014-05-14 15:20:37', '1', '2014-05-27 15:53:36', null, '135-15-0001', '2', null, null, '3', null, null, null, null, null, null, null, null, null, null, '2014-03-10', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('6', 'Ronel', 'Meyron', null, null, '(609) 671-9313', '(609) 671-9313', null, null, null, null, '1', null, 'US', 'Middletown Springs', 'NJ', '2', '08405', '9 Botterblom\r\nMiddelburg\r\n5900', '302 W. State Street ', '2014-05-23 11:49:14', '1', null, null, '135-15-0006', '3', null, null, '4', null, null, null, null, null, null, null, null, null, null, '2014-03-10', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('9', 'Andrew', 'Belling', null, null, '(609) 309-1700', '(609) 309-1700', null, null, null, null, '1', null, 'US', 'Montgomery', 'NJ', '6', '08408', '7 kerk Street\r\nMiddelburg\r\n5900', '10 Ercher Street ', '2014-05-23 12:48:32', '1', null, null, '135-15-0009', '2', null, null, '6', null, null, null, null, null, null, null, null, null, null, '2014-03-10', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('10', 'Venessa', 'Stalenberg', null, null, '(609) 584-1100', '(609) 584-1100', null, null, null, null, '2', null, 'US', 'Montgomery Center', 'NJ', '1', '08409', '38 Protea Avenue\r\nMidros \r\nMiddelburg\r\n5900', '77 Ewingville Road Ewing', '2014-05-23 13:53:19', '1', null, null, '135-15-0010', '3', null, null, '3', null, null, null, null, null, null, null, null, null, null, '2014-03-10', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('11', 'Unathi', 'Goerge', null, null, '(732) 239-0778', '(732) 239-0778', null, null, null, null, '1', null, 'US', 'Montpelier', 'NJ', '8', '08410', '2572 Simphiwe Bleki\r\nKwanonzame\r\nMiddelburg EC\r\n5900', '78 W. Taylor Avenue Trenton', '2014-05-23 15:05:41', '1', null, null, '135-15-0011', '2', null, null, '4', null, null, null, null, null, null, null, null, null, null, '2014-03-10', null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('12', 'Popi', 'Westel', 'Mike', 'PW', '(732) 422-4565', '(732) 422-6521', '(732) 422-4825', '123', 'collin@domain.com', '', '1', '1976-11-02', 'US', 'Moretown', 'NJ', '6', '08411', '13 DanielsMidrosMiddelburg5900', '862 Yardville-Allentown Road Hamilton', '2014-05-23 15:15:14', '1', '2014-07-03 12:20:29', '1', '135-15-0001', '6', '1', '3', '3', null, '2', '2', 'none', '0', '', null, '1401806632.jpg', null, '1', '2014-03-10', '2014-03-01', '2014-06-03', '1', 'LoremIpsum.pdf', 'LoremIpsum.txt', '125692', '', 'Mitchell Paterson', '15', '7', '19', '25', 'Pellentesque elementum risus in eros tempus, nec tincidunt tortor consequat. Nam feugiat leo non enim fermentum condimentum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ut hendrerit magna.', 'ipsum dolor sit amet, consectetur adipiscing elit. Proin placerat.', 'Collin Mathew', 'Brother', '736 456 5621', null, 'collin@ymail.com', 'Martha', 'Employer', '451 546 2156', null, 'martha@gcos.com', null, 'Wssy', '14', '150.00', '1', '1', '1', '3', '12', '4', '1', '3', 'Rihanna Simpson', '4', '6', '26', '1', '2', '2014-06-02', '40.00', '25', '15', '1', '4', '1', '1', 'Duis in iaculis nisi, in vulputate enim. Nullam auctor est non libero tincidunt sollicitudin. Proin a erat ligula. Aliquam sed neque mattis, ultrices ', 'Praesent sed odio quis lorem pellentesque bibendum quis id nunc. Curabitur ac dui tristique, aliquet enim et, tincidunt neque. Duis et mi feugiat, sagittis nibh eu, porttitor justo.', '1,2,3', '1,3,5', '5.5', '54645615', 'Praesent sed odio quis lorem pellentesque bibendum quis id nunc. Curabitur ac dui tristique, aliquet enim et, tincidunt neque. Duis et mi feugiat, sagittis nibh eu, porttitor justo.', '0', 'Lorem ipsum reason', '0', '0', '0', null, '0', '', '0', '', '', '', '4', '0', null, null, '1', 'Quisque quam odio, gravida fringilla pellentesque consequat, luctus ullamcorper metus.', '3,5', '1,10', '3,4,6', ' Integer condimentum aliquam dui at vestibulum. Curabitur in odio blandit', 'Cras congue nisl et ornare dignissim. Proin ut lacus nunc', '3,4,6', ' Proin viverra ipsum quis sapien tempor faucibus.', 'Quisque lorem felis, laoreet consequat sodales a, porta non ligula.', 'Nam feugiat leo non enim fermentum condimentum. Cum sociis natoque penatibus et magnis dis parturient montes', 'Cras ut hendrerit magna. Mauris sodales et mi non ultrices. Proin ipsum quam, dignissim non ultrices a', '1,0,0,0', '0,1,0,0', '0,1,1,0', '1,0,0,0', '0,0,0,0', '0,1,1,0', '0,1,0,0', '1,0,0,0', '0,1,0,0', '1,0,0,0', '0,1,0,0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clienthistory
-- ----------------------------
INSERT INTO `clienthistory` VALUES ('1', '12', '2014-03-10', null, null, null, null, null, null, '2014-06-03 22:08:46', '1', null, null, '1');

-- ----------------------------
-- Table structure for `clientmedication`
-- ----------------------------
DROP TABLE IF EXISTS `clientmedication`;
CREATE TABLE `clientmedication` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `strength` varchar(500) DEFAULT NULL,
  `dosage` varchar(500) DEFAULT NULL,
  `sidedefects` varchar(500) DEFAULT NULL,
  `purpose` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clientmedication
-- ----------------------------
INSERT INTO `clientmedication` VALUES ('42', '12', 'Lorem ipsum dolor', '250', '3x1', 'Nam feugiat leo', 'Cras congue nisl et ornare');
INSERT INTO `clientmedication` VALUES ('43', '12', 'Pellentesque', '300', '2x1', 'Aenean bibendum', 'Nam feugiat leo non enim');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clientskill
-- ----------------------------
INSERT INTO `clientskill` VALUES ('8', '12', '2');
INSERT INTO `clientskill` VALUES ('11', '12', '1');
INSERT INTO `clientskill` VALUES ('12', '12', '3');
INSERT INTO `clientskill` VALUES ('13', '12', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '1', 'Division of Developmental Disabilities', 'DDD', 'Monica Darell', 'ddd@domain.com', '(732) 968-5403', '(732) 968 4331', 'US', 'Greenbook', 'NJ', '9', '08812', 'Greenbook Regional Center', '275 Greenbook Road', '45.00', '2014-05-28 09:13:30', '1', null, null);
INSERT INTO `company` VALUES ('2', '1', 'Division Of Mental Health Services', 'DMHS', 'Monica Linn', 'dmhs@ent.com', '(732) 012-3456', null, 'US', null, 'NJ', '5', '08813', null, null, '50.00', '2014-05-28 09:40:32', '1', null, null);
INSERT INTO `company` VALUES ('3', '2', 'Wallmart', null, 'Jim Kommy', 'jim@wallmart.com', '255 025-5545', null, 'US', 'Grogory', 'NJ', '15', '07850', 'South street 278 Block A', 'asdas asdddad adasd', null, null, null, '2014-06-18 10:52:42', null);
INSERT INTO `company` VALUES ('4', '2', 'clean consults', null, 'asadsd', 'muko@dena.com', '5464161611', null, 'US', 'Junior', 'NJ', '12', '051515', 'sdnsikl sklm lsdsf', null, null, '2014-06-09 12:19:32', '1', '2014-06-09 13:13:51', null);
INSERT INTO `company` VALUES ('5', '2', 'companyname', null, 'contactperson', 'example@example.com', 'phone', null, 'US', 'city', 'NJ', '1', '90210', 'addressline1', 'addressline2', null, '2014-06-09 13:27:32', '1', null, null);
INSERT INTO `company` VALUES ('6', '2', 'asdadad', null, 'sdsfssf', 'sdsd@sdfs.dcfd', '232434', null, 'US', 'zxcxzxczcz', 'NJ', '3', '5446456', 'xzcvzxcz', 'xdcvxvxc', null, '2014-06-09 13:38:58', '1', null, null);
INSERT INTO `company` VALUES ('7', '2', 'Kingundu Systems Inc', null, 'asadasda', 'testsdas@devmail.infomacorp.com', '646162162', null, 'US', 'kampala', 'NJ', '9', '65512', 'asa knakjsdasdad', null, null, '2014-06-09 13:44:10', '1', '2014-06-09 16:05:14', null);
INSERT INTO `company` VALUES ('8', '2', 'hgvghvh', null, 'opjojop', null, '6848641', null, 'US', 'gvcghvh', 'NJ', null, null, 'ghgvhj', null, null, '2014-06-29 21:00:57', '1', '2014-06-30 11:39:45', null);
INSERT INTO `company` VALUES ('9', '2', 'fd', null, 'asdsada', null, '324524', null, 'US', 'sdadddd', 'NJ', '17', 'dasda', 'adasdadsa', null, null, '2014-06-29 21:02:29', '1', null, null);
INSERT INTO `company` VALUES ('11', '2', 'Global Enterprises LLC', null, 'Mike', null, '732 6522 062', null, 'US', 'Millicent', 'NJ', null, null, 'x', null, null, '2014-06-29 21:47:41', '1', '2014-07-03 12:20:29', null);
INSERT INTO `company` VALUES ('12', '2', 'decada', null, 'dsffsfs', 'weff@EFS.sdsdfs', '3242342', null, 'US', 'sdfdgf', 'NJ', '15', '65465', 'dgfdgd', 'fd', null, '2014-06-29 21:48:59', '1', '2014-06-29 21:50:03', null);

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
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
  KEY `fk_invoice_clientid` (`clientid`),
  CONSTRAINT `fk_invoice_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  `type` tinyint(4) unsigned DEFAULT '1',
  `clientid` int(11) unsigned DEFAULT NULL,
  `employerid` int(11) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `jobtitle` varchar(255) DEFAULT NULL,
  `workdetails` varchar(255) DEFAULT NULL,
  `hoursperweek` decimal(10,2) unsigned DEFAULT NULL,
  `rate` decimal(10,2) unsigned DEFAULT NULL,
  `ratetype` tinyint(4) unsigned DEFAULT NULL,
  `rateoriginal` decimal(10,2) unsigned DEFAULT NULL,
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
INSERT INTO `job` VALUES ('1', '1', '12', '3', '2014-05-26', '0000-00-00', '1', 'Grocery Assistant', '', '30.00', '12.00', '1', null, '1', '2014-05-28', '9am to 3pm. Mon, Wed, Fri', 'Willy Murefa', '1521516655', '2', '1', '', '0', '', '2014-06-04 19:59:37', '1', '2014-07-03 12:20:29', '1');
INSERT INTO `job` VALUES ('4', '2', '12', '11', '2011-12-01', '2012-06-05', '1', 'Data Entry Officer', 'System data entry', null, '8.00', '1', null, null, null, null, 'Mike', null, null, null, 'Contract ended', '0', null, '2014-06-29 21:47:41', '1', '2014-07-03 12:20:29', '1');
INSERT INTO `job` VALUES ('5', '1', '12', '12', '2014-06-02', null, '1', 'aabbcc', null, '24.00', '12.00', '1', null, '1', '2014-06-17', 'dsfss', 'dfgdgdg', 'df', '4', null, '', '0', null, '2014-06-29 21:48:59', '1', '2014-07-03 12:20:29', '1');

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
  `name` varchar(255) NOT NULL,
  `displayname` varchar(255) NOT NULL,
  `listable` tinyint(4) unsigned DEFAULT '1',
  `updatable` tinyint(4) unsigned DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `datecreated` datetime NOT NULL,
  `createdby` int(11) unsigned NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  `addbutnodelete` tinyint(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lookuptype
-- ----------------------------
INSERT INTO `lookuptype` VALUES ('1', 'YES_NO', 'Yes No Boolean ', '0', '0', 'Yes, No value options.', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('2', 'TRANSACTION_TYPES', 'Transaction Types', '0', '0', 'System Audit Trail transaction types.', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('3', 'LIST_ITEM_COUNT_OPTIONS', 'System List Items Per Page', '1', '0', 'Available number of items per page on lists', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('4', 'ACTIVE_STATUS', 'System Active Statuses', '0', '0', 'Whether a user is active or not', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('5', 'GENDER', 'Gender Values', '0', '0', 'The different gender values', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('8', 'SALUTATION', 'Client Salutations', '1', '1', 'The different salutations Mr, Mrs, Dr, etc', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('9', 'USER_STATUS', 'System User Status Values', '1', '0', 'The user status flags.', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('10', 'NEW_JERSEY_COUNTIES', 'System Counties', '1', '1', 'All the counties in New Jersey', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('11', 'MARITAL_STATUS_VALUES', 'Client Marital Status Values', '1', '1', 'The marital status values', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('12', 'EDUCATION_LEVELS', 'Client Education Levels', '1', '1', 'The education level for clients', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('13', 'RACES', 'Client Races', '1', '1', 'The race of client', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('14', 'DISABILITY_DIAGNOSIS_CODES', 'Client Codes for Disability Impairement', '1', '1', 'Disability Diagnosis Codes', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('15', 'DISABILITY_CAUSE_CODES', 'Client Codes for Disability Cause/Source', '1', '1', 'Causes for Disability Impairment', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('16', 'COMMUNICATION_LEVELS', 'Client Communication Levels', '1', '1', 'The communication levels', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('17', 'HOUSING_TYPES', 'Client Current Living/Housing Arrangements', '1', '1', 'The housing type values', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('18', 'CLIENT_SKILLS', 'Client Special Skills', '1', '1', 'The proffessional and vocational skills ', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('19', 'TRANSPORTATION_MODES', 'Client Transportation Modes', '1', '1', 'The client\'s mode of transportation to work', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('20', 'MEDICAL_TYPES', 'Client Medical Types', '1', '1', 'The client\'s medical types during job placement', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('21', 'WAGE_RATE_TYPES', 'Client Employment Wage Types', '1', '1', 'The type of rate used for the client job', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('22', 'JOB_STATUSES', 'Client Employment Job Statuses', '1', '0', 'The job status values', '2014-06-01 12:00:00', '1', null, null, '1');
INSERT INTO `lookuptype` VALUES ('23', 'JOB_TERMINATION_TYPES', 'Client Employment Termination Types', '1', '0', 'The job termination types', '2014-06-01 12:00:00', '1', null, null, '1');
INSERT INTO `lookuptype` VALUES ('24', 'VOUCHER_STATUS', 'Voucher Statuses', '0', '1', 'The voucher status values', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('25', 'CLIENT_EMERGENCY_RELATIONSHIP', 'Client Emergency Relationships', '1', '1', 'The relationship between client and emergency contact', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('26', 'CLIENT_INCOME_SOURCE', 'Client Employment Income Sources', '1', '1', 'The current income source for client', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('27', 'CLIENT_EMPLOYMENT_PREFERRENCE', 'Client Employment Goal Sectors', '1', '1', 'The preferred sectors for client employment', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('28', 'CLIENT_PREFERRED_WORKSHIFT', 'Client Employment Workshifts', '1', '1', 'The preferred mode of employment', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('29', 'CLIENT_JOB_TYPES', 'Client Employment Job Types', '1', '1', 'The Job types preferred by client', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('30', 'CLIENT_EDUC_INTERESTS', 'Client Education Subjects of Interest', '1', '1', 'The subject areas where the client had most interest', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('31', 'CLIENT_EDUC_LEARNINGSTYLES', 'Client Education Preferred Learning Styles', '1', '1', 'If client were learning a new task, the best ways for them to understand', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('32', 'CLIENT_THERAPY_TREATMENTS', 'Client Medication Therapy/Treatment', '1', '1', 'The client medication assessment therapy treatment', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('33', 'CLIENT_LIFE_QUALITY', 'Client Current Quality of Life', '1', '1', 'How the client describes their quality of life currently', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('34', 'CLIENT_EMPLOYMENT_DIFFICULTY', 'Client Employment Reasons for job difficulties', '1', '1', 'Have you ever experienced any difficulties in obtaining employment or in job settings because of:', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('35', 'CLIENT_PASTEVENTS_TYPES', 'Client Participatory Events', '1', '1', 'The social events that client was/is participating in.', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('36', 'CLIENT_SUPPORT_SERVICES', 'Client List of Support Services ', '1', '1', 'The Support services under social / cultural information', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('37', 'CLIENT_EMPLOYMENT_JOBACCOMODATIONS', 'Client Employment Job Accomodations ', '1', '1', 'The list of special areas/conditions that need to be taken into consideration during placement', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('38', 'CLIENT_SAFETY_ASSESSMENT_AREAS', 'Client Personal Health and Safety Assessment Options', '1', '1', 'How the health or safety risks impact life and employment', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('39', 'CLIENT_MILITARY_DISCHARGE_TYPE', 'Client Military Discharge Type', '1', '1', 'The discharge types for military service', '2014-06-01 12:00:00', '1', null, null, '0');
INSERT INTO `lookuptype` VALUES ('40', 'CLIENT_MILITARY _COMBAT_PROBLEMS', 'Client Military Combat Problems', '1', '1', 'The combat problems associated with combat', '2014-06-01 12:00:00', '1', null, null, '0');

-- ----------------------------
-- Table structure for `lookuptypevalue`
-- ----------------------------
DROP TABLE IF EXISTS `lookuptypevalue`;
CREATE TABLE `lookuptypevalue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lookuptypeid` int(11) unsigned DEFAULT NULL,
  `lookuptypevalue` varchar(50) DEFAULT NULL,
  `lookupvaluedescription` varchar(255) DEFAULT NULL,
  `info` blob,
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
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8;

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
INSERT INTO `lookuptypevalue` VALUES ('12', '3', '250', '250', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('13', '3', '500', '500', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('14', '3', 'All', 'All', null, '1', '2012-03-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('19', '5', '1', 'Male', null, '1', '2012-03-22 12:06:17', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('20', '5', '2', 'Female', null, '1', '2012-03-22 12:06:28', null, null, null, null);
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
INSERT INTO `lookuptypevalue` VALUES ('106', '11', '3', 'Divorced', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:00:26', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('107', '11', '4', 'Widowed', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('109', '12', '2', 'Elementary School', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('111', '12', '4', 'High School', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('112', '12', '5', 'College Undergraduate', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('113', '12', '6', 'College Graduate', null, '1', '2014-06-01 12:00:00', '2014-06-19 15:09:57', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('114', '12', '7', 'Vocation School', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('116', '13', '1', 'White', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('117', '13', '2', 'Black', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('118', '13', '3', 'Native', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('119', '13', '4', 'Asian', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('120', '13', '5', 'Native Hawaiian', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('121', '13', '6', 'Multiracial', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('122', '13', '7', 'Hispanic', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('123', '14', '1', 'No Impairement', null, '1', '2014-06-01 12:00:00', '2014-06-19 16:33:20', null, '00', null);
INSERT INTO `lookuptypevalue` VALUES ('124', '14', '2', 'Blindness', null, '1', '2014-06-01 12:00:00', '2014-06-19 16:33:53', null, '01', null);
INSERT INTO `lookuptypevalue` VALUES ('125', '15', '1', 'Cause Unknown', null, '1', '2014-06-01 12:00:00', '2014-06-19 16:14:30', null, '00', null);
INSERT INTO `lookuptypevalue` VALUES ('126', '15', '2', 'Accident/Injury', null, '1', '2014-06-01 12:00:00', '2014-06-19 19:18:24', null, '01', null);
INSERT INTO `lookuptypevalue` VALUES ('127', '16', '1', 'Phone', null, '1', '2014-06-01 12:00:00', '2014-06-19 15:45:58', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('128', '16', '2', 'Email', null, '1', '2014-06-01 12:00:00', '2014-06-19 15:45:53', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('129', '17', '1', 'Living with family of origin', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('132', '17', '2', 'Living with friends', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('133', '18', '1', 'Bookkeeping ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('134', '18', '2', 'Microsoft - Excel ', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:15:38', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('135', '18', '3', 'Cash Office ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('136', '18', '4', 'Fork-Lift ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('137', '18', '5', 'Operator EKG', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('138', '19', '1', 'Public (Bus/Train)', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:21:40', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('139', '19', '2', 'Own Vehicle', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:22:04', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('140', '19', '3', 'Family Member', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:22:55', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('141', '19', '4', 'Friend', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:23:02', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('142', '19', '5', 'Provided by County', null, '1', '2014-06-01 12:00:00', '2014-06-20 12:45:49', null, 'undefined', null);
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
INSERT INTO `lookuptypevalue` VALUES ('158', '11', '5', 'Partnered', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('161', '11', '6', 'Separated', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('162', '13', '8', 'Pacific Islander', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('163', '13', '9', 'American Indian', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('164', '13', '10', 'Alaskan', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('165', '13', '11', 'Other', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:04:42', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('166', '26', '1', 'None ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('167', '26', '2', 'Pension ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('168', '26', '3', 'TANF ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('169', '26', '4', 'Social Security Disability Insurance', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('170', '26', '5', 'General Assistance ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('171', '26', '6', 'Savings ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('172', '26', '7', 'Investments ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('173', '26', '8', 'Social Security Income', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('174', '26', '9', 'Alimony - Child Support ', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:00:08', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('175', '26', '10', 'Other Workers Comp ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('176', '26', '11', 'Veterans Benefits', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('177', '26', '12', 'Unemployment Benefits ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('178', '26', '13', 'Employed ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('179', '26', '14', 'Cash Income (Employment)', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('184', '25', '1', 'Father', null, '1', '2014-06-19 15:20:21', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('185', '25', '2', 'Mother', null, '1', '2014-06-19 15:20:52', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('186', '25', '3', 'Sibling', null, '1', '2014-06-19 15:21:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('187', '25', '4', 'Child', null, '1', '2014-06-19 15:31:40', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('188', '25', '5', 'Grand Child', null, '1', '2014-06-19 15:31:54', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('189', '25', '6', 'Grand Parent', null, '1', '2014-06-19 15:32:01', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('190', '25', '7', 'In-law', null, '1', '2014-06-19 15:32:14', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('191', '25', '8', 'Aunt', null, '1', '2014-06-19 15:32:26', '2014-06-19 15:40:19', null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('192', '25', '9', 'Uncle', null, '1', '2014-06-19 15:42:45', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('194', '25', '0', 'Other', null, '1', '2014-06-19 15:43:13', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('195', '25', '11', 'Partner', null, '1', '2014-06-19 15:43:24', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('196', '25', '12', 'Guardian', null, '1', '2014-06-19 15:44:29', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('197', '25', '13', 'Friend', null, '1', '2014-06-19 15:44:36', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('198', '14', '3', 'Other Visual Impairement', null, '1', '2014-06-19 16:45:37', null, null, '02', null);
INSERT INTO `lookuptypevalue` VALUES ('199', '14', '4', 'Deafness, Primary Communication Visual', null, '1', '2014-06-19 17:00:23', null, null, '03', null);
INSERT INTO `lookuptypevalue` VALUES ('200', '14', '5', 'Deafness, Primary Communication Auditory', null, '1', '2014-06-19 17:01:57', null, null, '04', null);
INSERT INTO `lookuptypevalue` VALUES ('201', '14', '6', 'Hearing Loss, Primary Communication Visual', null, '1', '2014-06-19 17:02:20', '2014-06-19 17:03:01', null, '05', null);
INSERT INTO `lookuptypevalue` VALUES ('202', '14', '7', 'Hearing Loss, Primary Communication Auditory', null, '1', '2014-06-19 17:03:18', null, null, '06', null);
INSERT INTO `lookuptypevalue` VALUES ('203', '14', '8', 'Other Hearing Impairements', null, '1', '2014-06-19 17:03:40', null, null, '07', null);
INSERT INTO `lookuptypevalue` VALUES ('204', '14', '9', 'Deaf Blindness', null, '1', '2014-06-19 17:03:56', null, null, '08', null);
INSERT INTO `lookuptypevalue` VALUES ('205', '14', '10', 'Communicative Impairments (expressive/receptive)', null, '1', '2014-06-19 17:06:35', '2014-06-19 17:12:25', null, '09', null);
INSERT INTO `lookuptypevalue` VALUES ('206', '14', '11', 'Mobility Orthopedic/Neurological Impairments', null, '1', '2014-06-19 17:13:31', null, null, '10', null);
INSERT INTO `lookuptypevalue` VALUES ('207', '14', '12', 'Manipulation/Dexterity Orthopedic/Neurological Impairments', null, '1', '2014-06-19 17:15:04', null, null, '11', null);
INSERT INTO `lookuptypevalue` VALUES ('208', '14', '13', 'Both Mobility Orthopedic/Neurological Impairments and Manipulation/Dexterity Orthopedic/Neurological Impairments', null, '1', '2014-06-19 17:16:05', null, null, '12', null);
INSERT INTO `lookuptypevalue` VALUES ('209', '14', '14', 'Other Orthopedic Impairments', null, '1', '2014-06-19 17:16:52', null, null, '13', null);
INSERT INTO `lookuptypevalue` VALUES ('210', '14', '15', 'Respiratory Impairments', null, '1', '2014-06-19 17:17:07', null, null, '14', null);
INSERT INTO `lookuptypevalue` VALUES ('211', '14', '16', 'General Physical Debilitation (fatigue, weakness, pain, etc)', null, '1', '2014-06-19 17:18:15', null, null, '15', null);
INSERT INTO `lookuptypevalue` VALUES ('212', '14', '17', 'Other Physical Impairments', null, '1', '2014-06-19 17:19:04', null, null, '16', null);
INSERT INTO `lookuptypevalue` VALUES ('213', '14', '18', 'Cognitive Impairments', null, '1', '2014-06-19 17:20:06', null, null, '17', null);
INSERT INTO `lookuptypevalue` VALUES ('214', '14', '19', 'Psychosocial Impairments', null, '1', '2014-06-19 17:21:10', null, null, '18', null);
INSERT INTO `lookuptypevalue` VALUES ('215', '14', '20', 'Other Mental Impairments', null, '1', '2014-06-19 17:21:55', null, null, '19', null);
INSERT INTO `lookuptypevalue` VALUES ('216', '15', '3', 'Alcohol Abuse or Dependence', null, '1', '2014-06-19 17:23:40', null, null, '02', null);
INSERT INTO `lookuptypevalue` VALUES ('217', '15', '4', 'Amputations', null, '1', '2014-06-19 17:23:55', null, null, '03', null);
INSERT INTO `lookuptypevalue` VALUES ('218', '15', '5', 'Anxiery Disorders', null, '1', '2014-06-19 17:24:07', null, null, '04', null);
INSERT INTO `lookuptypevalue` VALUES ('219', '15', '6', 'Athritis and Rheumatism', null, '1', '2014-06-19 17:25:01', null, null, '05', null);
INSERT INTO `lookuptypevalue` VALUES ('220', '15', '7', 'Asthma and Other Allergies', null, '1', '2014-06-19 17:25:36', null, null, '06', null);
INSERT INTO `lookuptypevalue` VALUES ('221', '15', '8', 'Attention Deficit Hyperactive Disorder (ADHD)', null, '1', '2014-06-19 17:26:43', null, null, '07', null);
INSERT INTO `lookuptypevalue` VALUES ('222', '15', '9', 'Autism', null, '1', '2014-06-19 17:27:08', null, null, '08', null);
INSERT INTO `lookuptypevalue` VALUES ('223', '15', '10', 'Blood Disorders', null, '1', '2014-06-19 17:27:29', null, null, '09', null);
INSERT INTO `lookuptypevalue` VALUES ('224', '15', '11', 'Cancer', null, '1', '2014-06-19 17:27:43', null, null, '10', null);
INSERT INTO `lookuptypevalue` VALUES ('225', '15', '12', 'Cardiac and other conditions of circulatory system', null, '1', '2014-06-19 17:28:43', null, null, '11', null);
INSERT INTO `lookuptypevalue` VALUES ('226', '15', '13', 'Celebral Palsy', null, '1', '2014-06-19 17:29:08', null, null, '12', null);
INSERT INTO `lookuptypevalue` VALUES ('227', '15', '14', 'Congenital Condition or Birth Injury', null, '1', '2014-06-19 17:30:28', null, null, '13', null);
INSERT INTO `lookuptypevalue` VALUES ('228', '15', '15', 'Cystic Fibrosis', null, '1', '2014-06-19 17:31:14', null, null, '14', null);
INSERT INTO `lookuptypevalue` VALUES ('229', '15', '16', 'Depressive and Other Mood Disorders', null, '1', '2014-06-19 17:31:59', null, null, '15', null);
INSERT INTO `lookuptypevalue` VALUES ('230', '15', '17', 'Diabetes Mellitus', null, '1', '2014-06-19 17:32:40', null, null, '16', null);
INSERT INTO `lookuptypevalue` VALUES ('231', '15', '18', 'Digestive', null, '1', '2014-06-19 17:38:24', null, null, '17', null);
INSERT INTO `lookuptypevalue` VALUES ('232', '15', '19', 'Drug Abuse or Dependence', null, '1', '2014-06-19 17:39:01', null, null, '18', null);
INSERT INTO `lookuptypevalue` VALUES ('233', '15', '20', 'Eating Disorders', null, '1', '2014-06-19 17:39:40', null, null, '19', null);
INSERT INTO `lookuptypevalue` VALUES ('234', '15', '21', 'End-stage Renal Disease and other GenitourinarySystem Disorders', null, '1', '2014-06-19 17:43:18', null, null, '20', null);
INSERT INTO `lookuptypevalue` VALUES ('235', '15', '22', 'Epilepsy', null, '1', '2014-06-19 18:16:45', null, null, '21', null);
INSERT INTO `lookuptypevalue` VALUES ('236', '15', '23', 'HIV and AIDS', null, '1', '2014-06-19 18:17:15', null, null, '22', null);
INSERT INTO `lookuptypevalue` VALUES ('237', '15', '24', 'Immune Deficiencies excluding HIV', null, '1', '2014-06-19 18:17:54', null, null, '23', null);
INSERT INTO `lookuptypevalue` VALUES ('238', '15', '25', 'Mental Illness', null, '1', '2014-06-19 18:18:26', null, null, '24', null);
INSERT INTO `lookuptypevalue` VALUES ('239', '15', '26', 'Mental Retardation', null, '1', '2014-06-19 18:19:06', null, null, '25', null);
INSERT INTO `lookuptypevalue` VALUES ('240', '15', '27', 'Multiple Sclerosis', null, '1', '2014-06-19 18:19:48', null, null, '26', null);
INSERT INTO `lookuptypevalue` VALUES ('241', '15', '28', 'Muscular Dystrophy', null, '1', '2014-06-19 18:36:32', null, null, '27', null);
INSERT INTO `lookuptypevalue` VALUES ('242', '15', '29', 'Parkinson\\\'s Disease and other Neurological Disorders', null, '1', '2014-06-19 19:07:03', null, null, '28', null);
INSERT INTO `lookuptypevalue` VALUES ('243', '15', '30', 'Personal Disorders', null, '1', '2014-06-19 19:09:39', null, null, '29', null);
INSERT INTO `lookuptypevalue` VALUES ('244', '15', '31', 'Physical Disorders/Conditions', null, '1', '2014-06-19 19:09:53', '2014-06-19 19:10:18', null, '30', null);
INSERT INTO `lookuptypevalue` VALUES ('245', '15', '32', 'Polio', null, '1', '2014-06-19 19:10:27', null, null, '31', null);
INSERT INTO `lookuptypevalue` VALUES ('246', '15', '33', 'Respiratory Disorders other than Cystic Fibrosis', null, '1', '2014-06-19 19:11:19', null, null, '32', null);
INSERT INTO `lookuptypevalue` VALUES ('247', '15', '34', 'Schizophrenia and other Personal Disorders', null, '1', '2014-06-19 19:12:08', null, null, '33', null);
INSERT INTO `lookuptypevalue` VALUES ('248', '15', '35', 'Specific Learning Disabilities', null, '1', '2014-06-19 19:12:30', null, null, '34', null);
INSERT INTO `lookuptypevalue` VALUES ('249', '15', '36', 'Spinal Cord Injury (SCI)', null, '1', '2014-06-19 19:13:01', '2014-06-19 19:13:15', null, '35', null);
INSERT INTO `lookuptypevalue` VALUES ('250', '15', '37', 'Stroke', null, '1', '2014-06-19 19:13:33', null, null, '36', null);
INSERT INTO `lookuptypevalue` VALUES ('251', '15', '38', 'Tramatic Brain Injury (TBI)', null, '1', '2014-06-19 19:14:01', null, null, '37', null);
INSERT INTO `lookuptypevalue` VALUES ('252', '17', '3', 'Living with spouse', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('253', '17', '4', 'Living with relatives( grandparents; cousin etc)', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('254', '17', '5', 'Living with spouse and children', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('255', '17', '6', 'Living in temporary housing', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('256', '17', '7', 'Living by self / independent', null, '1', '2014-06-01 12:00:00', '2014-06-19 19:58:40', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('257', '17', '8', 'Living in shelter', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('258', '17', '9', 'Living in supported housing, permanent', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('259', '17', '10', 'Other', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('260', '17', '11', 'Living in supported housing, transition', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('261', '17', '12', 'Living in residential housing', null, '1', '2014-06-01 12:00:00', '2014-06-19 19:58:59', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('262', '18', '6', 'Calculator ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('263', '18', '7', 'Microsoft - Outlook ', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:15:49', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('264', '18', '8', 'Cashier ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('265', '18', '9', 'General Warehouse ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('266', '18', '10', 'CPR & First Aid', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('267', '18', '11', 'Data Entry ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('268', '18', '12', 'Microsoft - PowerPoint ', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:15:58', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('269', '18', '13', 'Customer Service ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('270', '18', '14', 'Inventory Clerk ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('271', '18', '15', 'CDL License Number ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('272', '18', '16', 'Financial Reports ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('273', '18', '17', 'Microsoft - Word ', null, '1', '2014-06-01 12:00:00', '2014-06-19 20:16:07', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('274', '18', '18', 'Merchandiser ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('275', '18', '19', 'Maintenance ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('276', '18', '20', 'General Clerical ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('277', '18', '21', 'Computer ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('278', '18', '22', 'Sales Associate ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('279', '18', '23', 'Packer ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('280', '18', '24', 'Janitorial', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('281', '18', '25', 'Payroll Internet ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('282', '18', '26', 'Stock Room ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('283', '18', '27', 'CNA', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('284', '18', '28', 'Statistical ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('285', '18', '29', 'Typing ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('286', '18', '30', 'Email ', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('287', '18', '31', 'Switchboard', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('288', '18', '32', 'Bilingual', null, '1', '2014-06-01 12:00:00', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('290', '27', '1', 'Accounting', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('291', '27', '2', 'Customer Service', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('292', '27', '3', 'Janitorial/Custodial', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('293', '27', '4', 'Sales', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('294', '27', '5', 'Automobile', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('295', '27', '6', 'Data Entry', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('296', '27', '7', 'Laboratory', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('297', '27', '8', 'Security', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('298', '27', '9', 'Banking', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('299', '27', '10', 'Driver', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('300', '27', '11', 'Landscaping', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('301', '27', '12', 'Social Services', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('302', '27', '13', 'Bus Aide', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('303', '27', '14', 'Dishwasher', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('304', '27', '15', 'Manufacturing', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('305', '27', '16', 'Stock', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('306', '27', '17', 'Cart attendant', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('307', '27', '18', 'Food Prep', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('308', '27', '19', 'Nurse (CNA, RN, HHA)', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('309', '27', '20', 'Teacher/Aide', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('310', '27', '21', 'Cashier', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('311', '27', '22', 'Home Companion', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('312', '27', '23', 'Office/Clerical', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('313', '27', '24', 'Technician', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('314', '27', '25', 'Child Care', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('315', '27', '26', 'Hotel/Hospitality', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('316', '27', '27', 'Outdoors', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('317', '27', '28', 'Waiter/Hostess', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('318', '27', '29', 'Computers', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('319', '27', '30', 'Housekeeping', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('320', '27', '31', 'Receptionist/Secretarial', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('321', '27', '32', 'Warehouse', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('322', '27', '33', 'Cook', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('323', '27', '34', 'Human Services', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('324', '27', '35', 'Retail', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('325', '27', '36', 'Other', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('326', '27', '37', 'Cosmetologist', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('327', '27', '38', 'Restaurant/Food', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('328', '27', '39', 'Trades ex (Plumbing, Electrician and HVAC)', null, null, null, null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('330', '28', '1', 'Day', null, '1', '2014-06-20 12:27:09', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('331', '28', '2', 'Evening', null, '1', '2014-06-20 12:27:19', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('332', '28', '3', 'Night / Overnight ', null, '1', '2014-06-20 12:27:32', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('333', '28', '4', 'Weekend', null, '1', '2014-06-20 12:27:46', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('334', '28', '5', 'Afternoon', null, '1', '2014-06-20 12:27:53', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('335', '29', '1', 'Part-time', null, '1', '2014-06-20 12:29:59', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('336', '29', '2', 'Full-time', null, '1', '2014-06-20 12:30:12', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('337', '12', '8', 'Certification', null, '1', '2014-06-20 13:15:32', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('338', '30', '1', 'Math ', null, '1', '2014-06-20 13:33:06', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('339', '30', '2', 'Science ', null, '1', '2014-06-20 13:33:12', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('340', '30', '3', 'English ', null, '1', '2014-06-20 13:33:19', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('341', '30', '4', 'Industrial Arts', null, '1', '2014-06-20 13:33:28', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('342', '30', '5', 'Arts', null, '1', '2014-06-20 13:33:35', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('343', '30', '6', 'Social Studies', null, '1', '2014-06-20 13:33:43', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('344', '30', '7', 'Sports', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('345', '31', '1', 'Auditory, giving you verbal directions, explaining to you what I want you to do', null, '1', '2014-06-20 13:39:54', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('346', '31', '2', 'Physical prompting, pointing out and showing you how to do what I want you to do', null, '1', '2014-06-20 13:40:01', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('347', '31', '3', 'Hands on learner, letting you do it yourself with instructions', null, '1', '2014-06-20 13:40:10', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('348', '31', '4', 'Modeling (Demonstration), showing you how to do it', null, '1', '2014-06-20 13:40:18', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('349', '31', '5', 'Visual cues or information, leaving you with instructions or pictures on how to do it', null, '1', '2014-06-20 13:40:28', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('350', '32', '1', 'Behavoral Therapy', null, '1', '2014-06-24 19:44:24', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('351', '32', '2', 'Cognitive Therapy', null, '1', '2014-06-24 19:44:33', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('352', '32', '3', 'Counseling', null, '1', '2014-06-24 19:44:41', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('353', '32', '4', 'Dialysis Treatment', null, '1', '2014-06-24 19:44:50', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('354', '32', '5', 'Physical Therapy', null, '1', '2014-06-24 19:44:59', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('355', '32', '6', 'Psychotherapy Treatment', null, '1', '2014-06-24 19:45:08', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('356', '32', '7', 'Substance Abuse Treatment', null, '1', '2014-06-24 19:45:18', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('357', '33', '1', 'Excellent', null, '1', '2014-06-25 11:27:29', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('358', '33', '2', 'Good', null, '1', '2014-06-25 11:27:35', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('359', '33', '3', 'Fair', null, '1', '2014-06-25 11:27:40', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('360', '33', '4', 'Poor', null, '1', '2014-06-25 11:28:28', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('361', '34', '1', 'Your race', null, '1', '2014-07-01 11:55:08', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('362', '34', '2', 'Your age', null, '1', '2014-07-01 11:55:15', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('363', '34', '3', 'Your gender', null, '1', '2014-07-01 11:55:21', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('364', '34', '4', 'Your sexual orientation', null, '1', '2014-07-01 11:55:28', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('365', '34', '5', 'Your religion', null, '1', '2014-07-01 11:55:34', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('366', '34', '6', 'Your economic status', null, '1', '2014-07-01 11:55:41', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('367', '34', '7', 'Any group/social affiliations', null, '1', '2014-07-01 11:55:48', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('368', '35', '1', 'Participate in church activities', null, '1', '2014-07-01 13:52:36', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('369', '35', '2', 'Participate in social clubs', null, '1', '2014-07-01 13:52:42', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('370', '35', '3', 'Do volunteer work', null, '1', '2014-07-01 13:52:50', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('371', '35', '4', 'Attend sports events with others', null, '1', '2014-07-01 13:53:01', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('372', '35', '5', 'Participate in sports with others', null, '1', '2014-07-01 13:53:18', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('373', '35', '6', 'Attend community events', null, '1', '2014-07-01 13:53:23', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('374', '35', '7', 'Attend family gatherings', null, '1', '2014-07-01 13:53:30', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('375', '35', '8', 'Attend support group meetings', null, '1', '2014-07-01 13:54:08', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('376', '35', '9', 'Belong to a neighborhood association', null, '1', '2014-07-01 13:54:19', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('377', '35', '10', 'Belong to community organizations', null, '1', '2014-07-01 13:54:29', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('378', '36', '1', 'Residential', null, '1', '2014-07-01 14:48:48', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('379', '36', '2', 'Previous SE vendor', null, '1', '2014-07-01 14:48:54', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('380', '36', '3', 'Board of Social Services', null, '1', '2014-07-01 14:49:01', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('381', '36', '4', 'Psychologist/Psychiatrist', null, '1', '2014-07-01 14:49:09', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('382', '36', '5', 'DDD', null, '1', '2014-07-01 14:49:16', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('383', '36', '6', 'Support Groups', null, '1', '2014-07-01 14:49:24', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('384', '36', '7', 'DVR', null, '1', '2014-07-01 14:49:31', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('385', '36', '8', 'Mental/Behavioral Care', null, '1', '2014-07-01 14:49:37', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('386', '36', '9', 'CBVI', null, '1', '2014-07-01 14:49:44', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('387', '36', '10', 'Parole/Probation', null, '1', '2014-07-01 14:49:55', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('389', '37', '2', 'None', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('390', '37', '3', 'Motorized Wheelchair', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('391', '37', '4', 'Manual Wheelchair', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('392', '37', '5', 'Scooter', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('393', '37', '6', 'Chair/Stool', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('394', '37', '7', 'Guide Dog', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('395', '37', '8', 'Personal Aide', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('396', '37', '9', 'Other type:', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('397', '37', '10', 'Electronic Submission', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('398', '37', '11', 'Braille', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('399', '37', '12', 'CD (For Reader Program)', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('400', '37', '13', 'Sign Language Interpreter', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('401', '37', '14', 'Closed Captioning', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('402', '37', '15', 'Large Print', null, '1', '2014-06-20 13:33:51', '2014-07-01 17:46:42', null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('404', '37', '16', 'Assistive Listening Device', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('405', '37', '17', 'Physical Limitations', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('406', '37', '18', 'Lifting & Carrying', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('407', '37', '19', 'Sitting & Standing', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('408', '37', '20', 'Walking', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('409', '37', '21', 'Bending & Stooping', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('410', '37', '22', 'Climbing', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('411', '37', '23', 'Reaching', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('412', '37', '24', 'Hearing', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('414', '37', '25', 'Seeing', null, '1', '2014-06-20 13:33:51', null, null, null, null);
INSERT INTO `lookuptypevalue` VALUES ('415', '38', '1', 'Quality of life/health', null, '1', '2014-07-01 18:34:31', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('416', '38', '2', 'Employment success', null, '1', '2014-07-01 18:34:41', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('417', '38', '3', 'Employment conditions (environmental, physical)', null, '1', '2014-07-01 18:34:58', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('418', '39', '1', 'Honorable ', null, '1', '2014-07-03 10:21:52', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('419', '39', '2', 'General under honorable conditions', null, '1', '2014-07-03 10:21:58', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('420', '39', '3', 'General, less than honorable', null, '1', '2014-07-03 10:22:04', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('421', '39', '4', 'Dishonorable', null, '1', '2014-07-03 10:22:10', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('422', '40', '1', 'Nightmares', null, '1', '2014-07-03 10:39:55', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('423', '40', '2', 'Flashbacks ', null, '1', '2014-07-03 10:40:01', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('424', '40', '3', 'Startle reflex', null, '1', '2014-07-03 10:40:08', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('425', '40', '4', 'Intrusive thoughts/memories ', null, '1', '2014-07-03 10:40:14', null, null, 'undefined', null);
INSERT INTO `lookuptypevalue` VALUES ('426', '40', '5', 'Uncontrollable outbursts of anger', null, '1', '2014-07-03 10:40:20', null, null, 'undefined', null);

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
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
  KEY `fk_payment_clientid` (`clientid`),
  CONSTRAINT `fk_payment_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_invoiceid` FOREIGN KEY (`invoiceid`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for `referral`
-- ----------------------------
DROP TABLE IF EXISTS `referral`;
CREATE TABLE `referral` (
  `id` int(11) unsigned NOT NULL,
  `clientid` int(11) unsigned DEFAULT NULL,
  `initialvoucherid` int(11) unsigned DEFAULT NULL,
  `programid` int(11) unsigned DEFAULT NULL,
  `funderid` int(11) unsigned DEFAULT NULL,
  `servicetypeid` int(11) unsigned DEFAULT NULL,
  `communication` tinyint(4) unsigned DEFAULT NULL,
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
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_referral_voucherid` (`initialvoucherid`) USING BTREE,
  KEY `fk_referral_clientid` (`clientid`),
  CONSTRAINT `fk_referral_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_referral_voucherid` FOREIGN KEY (`initialvoucherid`) REFERENCES `voucher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of referral
-- ----------------------------
INSERT INTO `referral` VALUES ('1', null, null, '2', null, null, null, '2014-03-10', '0', null, null, null, null, null, null, null, null, null, null, null, '2014-05-14 15:20:37', '1', '2014-05-27 15:53:36', null);
INSERT INTO `referral` VALUES ('6', null, null, '3', null, null, null, '2014-03-10', '0', null, null, null, null, null, null, null, null, null, null, null, '2014-05-23 11:49:14', '1', null, null);
INSERT INTO `referral` VALUES ('9', null, null, '2', null, null, null, '2014-03-10', '0', null, null, null, null, null, null, null, null, null, null, null, '2014-05-23 12:48:32', '1', null, null);
INSERT INTO `referral` VALUES ('10', null, null, '3', null, null, null, '2014-03-10', '0', null, null, null, null, null, null, null, null, null, null, null, '2014-05-23 13:53:19', '1', null, null);
INSERT INTO `referral` VALUES ('11', null, null, '2', null, null, null, '2014-03-10', '1', null, null, null, null, null, null, null, null, null, null, null, '2014-05-23 15:05:41', '1', null, null);
INSERT INTO `referral` VALUES ('12', null, '1', '6', '1', '3', null, '2014-03-10', '1', 'LoremIpsum.pdf', 'testcover.pdf', '125692', '', 'Mitchell Paterson', '1', '1', null, null, 'Pellentesque elementum risus in eros tempus, nec tincidunt tortor consequat. Nam feugiat leo non enim fermentum condimentum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras ut hendrerit magna.', 'ipsum dolor sit amet, consectetur adipiscing elit. Proin placerat.', '2014-05-23 15:15:14', '1', '2014-06-03 22:15:45', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('2', '2', 'Time-Limited Job Coaching', 'TLJC', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('3', '2', 'Supported Employment Intensive Job Coaching', 'SEJC', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('4', '2', 'American Sign Language Job Coaching', 'ASL', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('5', '2', 'Long-Term Follow-Along', 'LTFA', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('6', '1', 'Supported Employment', 'SE', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('7', '1', 'Supported Coordination', 'SC', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('9', '1', 'Trial Work Experience', 'TWE', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('10', '2', 'Pre-Placement', 'Pre-Placement', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('11', '3', 'REG-SE-LTFA', 'REG-SE-LTFA', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('12', '3', 'MH-SE-LTFA', 'MH-SE-LTFA', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('13', '3', 'ASL-SE-LTFA', 'ASL-SE-LTFA', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('14', '3', 'GROUP-SE-LTFA', 'GROUP-SE-LTFA', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('15', '3', 'DDD Employment', 'DDD Employment', null, null, null, '2014-05-28 09:50:57', '1', null, null);
INSERT INTO `service` VALUES ('16', '3', 'Transition', 'Transition', null, null, null, '2014-05-28 09:50:57', '1', null, null);

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
INSERT INTO `session` VALUES ('32cs8amrbeq7cc9o8o9t2e96q5', '1403694365', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('39klfv1p8p1shjaebalqhe6820', '1402343414', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('5r5e8666p8p7qsr548prf5bm11', '1403080476', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('6gikrko381o14jhprafsgm8j90', '1404380855', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('7ib1dtkj8cq642ah1bfc8mv821', '1401824433', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('b4tvh3500lo4te73qb2gn3lt36', '1403596667', '21104000', 'Default|a:13:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('eeudtg6hpl2kkbaqb26dhirkc1', '1401693181', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('fc7bgrq5ncuiurnef3d6a7pa16', '1401089166', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('gc83vl5d6lp09ool0o668te294', '1401113799', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('j59h7ksrvea2l8hrbuvr90nbc7', '1401089874', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jel4kp2igcm3sbc4mpknrilrf2', '1401109043', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jh468g0lmkp0dq9u3tcacco4u4', '1401099648', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('p2mgk7goj8c17c6ategktgrhs7', '1401194808', '21104000', 'Default|a:13:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('p5tjhckc57tdfkgk4tm6hd2772', '1401295890', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('ptsv4b4p64ssknv9lm5t66bvt6', '1404155794', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('rrs791nm4s71l4ppidtbjq89l5', '1401952402', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('tnkmmj6hhtuojqq3kvl15a7qd3', '1403542291', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');

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
  `type` tinyint(4) unsigned DEFAULT '1',
  `clientid` int(11) unsigned DEFAULT NULL,
  `referralid` int(11) unsigned DEFAULT NULL,
  `servicetypeid` int(11) unsigned DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `voucherno` varchar(50) DEFAULT NULL,
  `faprefix` varchar(15) DEFAULT NULL,
  `favoucherno` varchar(50) DEFAULT NULL,
  `dateapproved` date DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
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
  KEY `fk_voucher_servicetypeid` (`servicetypeid`),
  KEY `fk_voucher_type` (`type`),
  KEY `fk_voucher_status` (`status`),
  CONSTRAINT `fk_voucher_clientid` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_voucher_parentid` FOREIGN KEY (`parentid`) REFERENCES `voucher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_voucher_servicetypeid` FOREIGN KEY (`servicetypeid`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES ('1', null, '1', '12', null, '3', 'preplacement evaluation and intensive monitoring', 'TS0005', 'FA-', null, '2014-03-04', '2014-03-10', null, '2014-07-31', '1', '20.00', '30', '51.00', null, null, null, '2014-05-29 17:20:05', '1', '2014-07-03 12:14:53', '1');
INSERT INTO `voucher` VALUES ('2', '1', '2', '12', null, '13', null, '', null, 'FA-Jun-2014', '2014-06-10', '2014-06-02', null, '2014-06-30', '2', '12.00', '30', '55.00', null, null, '0', '2014-06-17 16:28:31', '1', '2014-06-17 18:06:59', null);
