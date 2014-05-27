/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : ents

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-05-27 13:25:47
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aclgroup
-- ----------------------------
INSERT INTO `aclgroup` VALUES ('1', 'Administrator', 'Overall system administrator', '0000-00-00 00:00:00', '1', null, null);
INSERT INTO `aclgroup` VALUES ('2', 'Customer Care', 'Logs new Ticket and Assigns directorate', '0000-00-00 00:00:00', '1', null, null);
INSERT INTO `aclgroup` VALUES ('3', 'Department Official', 'Receives Ticket for Assignment', '0000-00-00 00:00:00', '1', null, null);
INSERT INTO `aclgroup` VALUES ('5', 'Client', 'Reports Ticket to Customer Care', '0000-00-00 00:00:00', '1', null, null);
INSERT INTO `aclgroup` VALUES ('6', 'Accounting Official', 'Monitors Ticket progress reports', '0000-00-00 00:00:00', '1', null, null);
INSERT INTO `aclgroup` VALUES ('7', 'Management', 'Company management and reporting', '0000-00-00 00:00:00', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aclpermission
-- ----------------------------
INSERT INTO `aclpermission` VALUES ('6', '1', '7', '1', '1', '1', '1', '0', '0', '0', '2012-03-01 12:00:00', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('18', '2', '6', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('19', '3', '6', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('21', '5', '6', '0', '0', '0', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', '2014-02-13 17:29:08', '38');
INSERT INTO `aclpermission` VALUES ('22', '6', '6', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('23', '7', '6', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('25', '2', '3', '0', '1', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '0', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('28', '5', '3', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0', '2014-02-13 17:29:08', '38');
INSERT INTO `aclpermission` VALUES ('29', '6', '3', '0', '0', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('30', '7', '3', '0', '1', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('32', '2', '9', '1', '1', '1', '1', '1', '2', '0', '0000-00-00 00:00:00', '0', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('35', '5', '9', '0', '0', '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0', '2014-02-13 17:29:08', '38');
INSERT INTO `aclpermission` VALUES ('36', '6', '9', '0', '0', '1', '1', '2', '2', '0', '0000-00-00 00:00:00', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('37', '7', '9', '0', '0', '1', '1', '0', '1', '0', '0000-00-00 00:00:00', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('38', '2', '10', '1', '1', '1', '1', '0', '2', '0', '0000-00-00 00:00:00', '0', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('39', '3', '10', '0', '0', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('41', '5', '10', '0', '0', '2', '0', '0', '0', '0', '0000-00-00 00:00:00', '0', '2014-02-13 17:29:08', '38');
INSERT INTO `aclpermission` VALUES ('42', '6', '10', '0', '0', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('43', '7', '10', '0', '0', '1', '1', '0', '1', '0', '0000-00-00 00:00:00', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('44', '2', '13', '0', '0', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '0', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('47', '5', '13', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0', '2014-02-13 17:29:08', '38');
INSERT INTO `aclpermission` VALUES ('48', '6', '13', '0', '0', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('49', '7', '13', '0', '0', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('50', '2', '11', '0', '0', '1', '1', '2', '2', '0', '2012-03-01 12:00:00', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('52', '6', '11', '0', '0', '1', '1', '0', '0', '0', '2012-03-01 12:00:00', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('53', '7', '11', '0', '0', '1', '1', '0', '1', '0', '2012-03-01 12:00:00', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('54', '6', '8', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('55', '6', '8', '2', '2', '1', '2', '2', '2', '2', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclpermission` VALUES ('73', '3', '7', '0', '0', '0', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('75', '3', '14', '0', '0', '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('108', '1', '5', '1', '1', '1', '1', '1', '0', '0', '2013-12-16 12:51:35', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('112', '1', '11', '1', '1', '1', '1', '1', '1', '0', '2013-12-16 12:42:08', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('115', '1', '16', '1', '1', '1', '1', '1', '0', '0', '2013-12-16 01:09:38', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('116', '1', '8', '0', '0', '1', '0', '0', '0', '0', '2013-12-16 01:09:38', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('117', '1', '3', '1', '1', '1', '1', '1', '1', '0', '2013-12-16 01:09:38', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('118', '1', '10', '1', '1', '1', '1', '1', '1', '0', '2013-12-16 01:14:53', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('120', '1', '6', '0', '0', '1', '0', '0', '0', '0', '2013-12-16 12:51:35', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('121', '1', '14', '1', '1', '1', '1', '1', '0', '0', '2013-12-16 01:16:20', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('122', '1', '15', '1', '1', '1', '1', '1', '0', '0', '2013-12-16 01:16:20', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('123', '1', '1', '0', '0', '1', '1', '0', '0', '0', '2013-12-16 01:16:20', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('124', '1', '2', '1', '1', '1', '1', '1', '0', '0', '2013-12-16 01:16:20', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('125', '1', '13', '1', '1', '1', '1', '1', '0', '0', '2013-12-16 01:22:26', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('126', '1', '9', '1', '1', '1', '1', '1', '1', '0', '2013-12-16 01:22:26', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('127', '6', '7', '0', '0', '0', '0', '0', '0', '0', '2013-12-16 03:21:35', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('129', '6', '14', '0', '0', '0', '0', '0', '0', '0', '2013-12-16 03:21:35', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('131', '6', '15', '0', '0', '0', '0', '0', '0', '0', '2013-12-16 03:21:35', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('132', '6', '1', '0', '0', '0', '0', '0', '0', '0', '2013-12-16 03:21:35', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('133', '6', '2', '0', '0', '0', '0', '0', '0', '0', '2013-12-16 03:21:35', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('134', '6', '16', '0', '0', '1', '1', '0', '0', '0', '2013-12-16 03:21:35', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('135', '6', '5', '0', '0', '0', '0', '0', '0', '0', '2013-12-16 03:21:35', '1', '2014-02-13 17:30:48', '38');
INSERT INTO `aclpermission` VALUES ('136', '1', '17', '0', '0', '1', '0', '0', '0', '0', '2013-12-16 05:19:15', '1', '2013-12-18 08:39:43', '1');
INSERT INTO `aclpermission` VALUES ('137', '1', '19', '0', '0', '1', '0', '0', '0', '0', '2013-12-18 08:39:43', '1', null, null);
INSERT INTO `aclpermission` VALUES ('138', '1', '20', '0', '0', '1', '0', '0', '0', '0', '2013-12-18 08:39:43', '1', null, null);
INSERT INTO `aclpermission` VALUES ('139', '1', '18', '0', '0', '1', '0', '0', '0', '0', '2013-12-18 08:39:43', '1', null, null);
INSERT INTO `aclpermission` VALUES ('140', '1', '21', '0', '0', '1', '0', '0', '0', '0', '2013-12-18 08:39:43', '1', null, null);
INSERT INTO `aclpermission` VALUES ('141', '1', '22', '0', '0', '1', '0', '0', '0', '0', '2013-12-18 08:39:43', '1', null, null);
INSERT INTO `aclpermission` VALUES ('142', '7', '7', '0', '0', '1', '1', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('143', '7', '14', '0', '0', '1', '1', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('144', '7', '15', '0', '0', '1', '1', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('145', '7', '1', '0', '0', '1', '1', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('146', '7', '2', '0', '0', '1', '1', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('147', '7', '19', '0', '0', '1', '0', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('148', '7', '20', '0', '0', '1', '0', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('149', '7', '18', '0', '0', '1', '0', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('150', '7', '21', '0', '0', '1', '0', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('151', '7', '17', '0', '0', '1', '0', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('152', '7', '22', '0', '0', '1', '0', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('153', '7', '16', '0', '0', '1', '1', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('154', '7', '8', '0', '0', '1', '0', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('155', '7', '5', '0', '0', '1', '1', '0', '0', '0', '2013-12-26 10:10:47', '1', '2014-04-24 16:01:04', '1');
INSERT INTO `aclpermission` VALUES ('156', '2', '7', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('157', '2', '14', '0', '0', '1', '1', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('158', '2', '15', '0', '0', '1', '1', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('159', '2', '1', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('160', '2', '2', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('161', '2', '19', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('162', '2', '20', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('163', '2', '18', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('164', '2', '21', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('165', '2', '17', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('166', '2', '22', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('167', '2', '16', '0', '0', '1', '1', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('168', '2', '8', '0', '0', '1', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('169', '2', '5', '0', '0', '0', '0', '0', '0', '0', '2014-01-07 07:48:48', '1', '2014-02-13 17:36:18', '38');
INSERT INTO `aclpermission` VALUES ('170', '3', '11', '0', '0', '1', '1', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('171', '3', '15', '0', '0', '1', '1', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('172', '3', '1', '0', '0', '0', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('173', '3', '2', '0', '0', '0', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('174', '3', '13', '0', '0', '1', '1', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('175', '3', '19', '0', '0', '1', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('176', '3', '20', '0', '0', '1', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('177', '3', '18', '0', '0', '1', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('178', '3', '21', '0', '0', '1', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('179', '3', '17', '0', '0', '1', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('180', '3', '9', '1', '1', '1', '1', '1', '1', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('181', '3', '22', '0', '0', '1', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('182', '3', '16', '1', '1', '1', '1', '1', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('183', '3', '8', '0', '0', '1', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('184', '3', '5', '0', '0', '0', '0', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('185', '3', '3', '0', '1', '1', '1', '0', '0', '0', '2014-01-24 05:41:35', '1', '2014-05-22 16:45:29', '1');
INSERT INTO `aclpermission` VALUES ('186', '5', '7', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('187', '5', '14', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('188', '5', '11', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('189', '5', '15', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('190', '5', '1', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('191', '5', '2', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('192', '5', '19', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('193', '5', '20', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('194', '5', '18', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('195', '5', '21', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('196', '5', '17', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('197', '5', '22', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('198', '5', '16', '1', '1', '1', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('199', '5', '8', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('200', '5', '5', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:29:08', '38', null, null);
INSERT INTO `aclpermission` VALUES ('201', '6', '19', '0', '0', '1', '0', '0', '0', '0', '2014-02-13 17:30:48', '38', null, null);
INSERT INTO `aclpermission` VALUES ('202', '6', '20', '0', '0', '1', '0', '0', '0', '0', '2014-02-13 17:30:48', '38', null, null);
INSERT INTO `aclpermission` VALUES ('203', '6', '18', '0', '0', '1', '0', '0', '0', '0', '2014-02-13 17:30:48', '38', null, null);
INSERT INTO `aclpermission` VALUES ('204', '6', '21', '0', '0', '1', '0', '0', '0', '0', '2014-02-13 17:30:48', '38', null, null);
INSERT INTO `aclpermission` VALUES ('205', '6', '17', '0', '0', '1', '0', '0', '0', '0', '2014-02-13 17:30:48', '38', null, null);
INSERT INTO `aclpermission` VALUES ('206', '6', '22', '0', '0', '0', '0', '0', '0', '0', '2014-02-13 17:30:48', '38', null, null);
INSERT INTO `aclpermission` VALUES ('207', '1', '23', '0', '0', '1', '0', '0', '0', '0', '2014-04-18 22:46:46', '2', null, null);
INSERT INTO `aclpermission` VALUES ('208', '7', '23', '0', '0', '1', '0', '0', '0', '0', '2014-04-24 16:01:04', '1', null, null);
INSERT INTO `aclpermission` VALUES ('209', '3', '23', '0', '0', '1', '0', '0', '0', '0', '2014-05-22 16:45:29', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aclresource
-- ----------------------------
INSERT INTO `aclresource` VALUES ('1', 'Lookup Type', 'Look up types', '0', '0', '1', '1', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('2', 'Lookup Value', 'Values for the lookup type', '1', '1', '1', '1', '1', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('3', 'User Account', 'A user within the application', '1', '1', '1', '1', '1', '0', '1', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('5', 'Role', 'Actions a member can execute on resources', '1', '1', '1', '1', '1', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('6', 'Dashboard', 'user dashboard', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('7', 'Application Settings', 'Application Administration', '1', '1', '1', '1', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('8', 'Report Dashboard', 'The different reports in the Application', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('9', 'Query', 'The query reported for resolution', '1', '1', '1', '1', '1', '0', '1', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('10', 'Client', 'The customer who reports a query', '1', '1', '1', '1', '1', '0', '1', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('11', 'Department', 'The group assigned or responsible for a ticket', '1', '1', '1', '1', '1', '0', '1', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('13', 'Messaging', 'Messaging functionality', '1', '1', '1', '1', '1', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('14', 'Category', 'Categorisation functionality', '1', '1', '1', '1', '1', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('15', 'Documents', 'Uploads functionality', '1', '1', '1', '1', '1', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('16', 'Query Feedback', 'Query Feedback Functionality', '1', '1', '1', '1', '1', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('17', 'Queries by Status Report', 'Queries by Status Report', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('18', 'Queries by Department Report', 'Queries by Department Report', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('19', 'Queries by Category Report', 'Queries by Category Report', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('20', 'Queries by Client Report', 'Queries by Client Report', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('21', 'Queries by Source Report', 'Queries by Source Report', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('22', 'Query Audit Trail Report', 'Queries Audit Trail Report', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `aclresource` VALUES ('23', 'Queries by Town Report', 'Queries by Town Report', '0', '0', '1', '0', '0', '0', '0', '2012-03-01 12:00:00', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aclusergroup
-- ----------------------------
INSERT INTO `aclusergroup` VALUES ('1', '1', '1');
INSERT INTO `aclusergroup` VALUES ('32', '1', '39');
INSERT INTO `aclusergroup` VALUES ('63', '1', '70');
INSERT INTO `aclusergroup` VALUES ('34', '2', '41');
INSERT INTO `aclusergroup` VALUES ('38', '2', '45');
INSERT INTO `aclusergroup` VALUES ('40', '2', '47');
INSERT INTO `aclusergroup` VALUES ('41', '2', '48');
INSERT INTO `aclusergroup` VALUES ('47', '2', '54');
INSERT INTO `aclusergroup` VALUES ('49', '2', '56');
INSERT INTO `aclusergroup` VALUES ('55', '2', '62');
INSERT INTO `aclusergroup` VALUES ('60', '2', '67');
INSERT INTO `aclusergroup` VALUES ('61', '2', '68');
INSERT INTO `aclusergroup` VALUES ('65', '2', '72');
INSERT INTO `aclusergroup` VALUES ('33', '3', '40');
INSERT INTO `aclusergroup` VALUES ('36', '3', '43');
INSERT INTO `aclusergroup` VALUES ('37', '3', '44');
INSERT INTO `aclusergroup` VALUES ('39', '3', '46');
INSERT INTO `aclusergroup` VALUES ('48', '3', '55');
INSERT INTO `aclusergroup` VALUES ('50', '3', '57');
INSERT INTO `aclusergroup` VALUES ('51', '3', '58');
INSERT INTO `aclusergroup` VALUES ('52', '3', '59');
INSERT INTO `aclusergroup` VALUES ('54', '3', '61');
INSERT INTO `aclusergroup` VALUES ('56', '3', '63');
INSERT INTO `aclusergroup` VALUES ('57', '3', '64');
INSERT INTO `aclusergroup` VALUES ('58', '3', '65');
INSERT INTO `aclusergroup` VALUES ('62', '3', '69');
INSERT INTO `aclusergroup` VALUES ('46', '6', '53');
INSERT INTO `aclusergroup` VALUES ('59', '6', '66');
INSERT INTO `aclusergroup` VALUES ('64', '6', '71');
INSERT INTO `aclusergroup` VALUES ('35', '7', '42');
INSERT INTO `aclusergroup` VALUES ('42', '7', '49');
INSERT INTO `aclusergroup` VALUES ('43', '7', '50');
INSERT INTO `aclusergroup` VALUES ('44', '7', '51');
INSERT INTO `aclusergroup` VALUES ('45', '7', '52');

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

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
INSERT INTO `appconfig` VALUES ('24', 'uploads', 'File upload Options', 'docallowedformats', 'Allowed formats for document upload', 'Allowed document file formats', 'doc, docx, pdf, txt, jpg, jpeg, png, bmp', 'text', 'Y', '1', '2012-03-01 12:00:00', '1', '2014-02-12 14:09:02', null);
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

-- ----------------------------
-- Table structure for `assignment`
-- ----------------------------
DROP TABLE IF EXISTS `assignment`;
CREATE TABLE `assignment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `supervisorid` int(11) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assignment
-- ----------------------------

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
-- Table structure for `blank`
-- ----------------------------
DROP TABLE IF EXISTS `blank`;
CREATE TABLE `blank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blank
-- ----------------------------

-- ----------------------------
-- Table structure for `case`
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `supervisorid` int(11) unsigned DEFAULT NULL,
  `parentid` int(11) unsigned DEFAULT NULL,
  `initialvoucherid` int(11) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `resumefilename` varchar(255) DEFAULT NULL,
  `coverletterfilename` varchar(255) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  `program` tinyint(3) unsigned DEFAULT NULL,
  `dvrsref` varchar(15) DEFAULT NULL,
  `dddref` varchar(15) DEFAULT NULL,
  `dvrscounselor` varchar(255) DEFAULT NULL,
  `primarydiagnosis` tinyint(4) unsigned DEFAULT NULL,
  `secondarydiagnosis` tinyint(4) unsigned DEFAULT NULL,
  `clientneedsassessment` varchar(1000) DEFAULT NULL,
  `employmentgoal` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case
-- ----------------------------

-- ----------------------------
-- Table structure for `casehistory`
-- ----------------------------
DROP TABLE IF EXISTS `casehistory`;
CREATE TABLE `casehistory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `caseid` int(11) unsigned DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `isgoalreached` tinyint(4) unsigned DEFAULT NULL,
  `goaldetails` varchar(500) DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `assessedby` varchar(255) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of casehistory
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
  `program` tinyint(4) unsigned DEFAULT NULL,
  `ssn` varchar(15) DEFAULT NULL,
  `communication` tinyint(4) unsigned DEFAULT NULL,
  `race` tinyint(4) unsigned DEFAULT NULL,
  `maritalstatus` tinyint(4) DEFAULT NULL,
  `housing` tinyint(4) unsigned DEFAULT NULL,
  `initialservicedate` date DEFAULT NULL,
  `allergies` varchar(500) DEFAULT NULL,
  `iscriminal` tinyint(4) unsigned DEFAULT NULL,
  `criminalhistory` varchar(1000) DEFAULT NULL,
  `educationlevel` tinyint(4) unsigned DEFAULT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  `profilephoto` varchar(255) DEFAULT NULL,
  `userid` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('63', 'Zinzi', 'France', null, '27825153191', null, null, null, 'zinziswanobutho@gmail.com', null, null, 'ZA', 'Cradock', null, null, '5880', '2 Ralawe Street\r\nLingelihle\r\n5881', '81', '2014-05-14 15:20:37', '47', null, null, null, '8201310365081', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('64', 'Thandisizwe', 'Moyi', null, '27788110596', null, null, null, null, null, null, 'ZA', 'Middelburg', null, null, '5900', '80 Gemsbok Avenue\r\nMidros\r\nMiddelburg\r\n5900', '84', '2014-05-22 12:40:26', '48', null, null, null, '7606200570080', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('65', 'Thando', 'Bontiya', null, '27840642450', null, null, null, null, null, null, 'ZA', 'Middelburg', null, null, '5900', '19 Nqwemesha \r\nKwanonzame\r\nMiddelburg EC\r\n5900', '84', '2014-05-22 15:09:39', '48', null, null, null, '8811135262089', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('66', 'Neliswa', 'Mbodli', null, '27848773521', null, null, null, null, null, null, 'ZA', 'Middelburg', null, null, '5900', '1810 Allan Boesak\r\nKwanonzame\r\nMiddelburg EC\r\n5900', '84', '2014-05-22 15:48:46', '48', null, null, null, '8906230441081', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('67', 'Vicey', 'Zonke', null, '27745036809', null, null, null, null, null, null, 'ZA', 'Middelburg', null, null, '5900', '7 Zintwana\r\nKwanonzame\r\nMiddelburg EC\r\n5900', '84', '2014-05-23 09:42:47', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('68', 'Ronel', 'Meyron', null, '27845283493', null, null, null, null, null, null, 'ZA', 'Middelburg', null, null, '5900', '9 Botterblom\r\nMiddelburg\r\n5900', '84', '2014-05-23 11:49:14', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('69', 'Nombulelo', 'Maki', null, '27835427077', null, null, null, null, null, null, 'ZA', 'Middelburg', null, null, '5900', '2112 Nzimeni Maseti\r\nKwanonzame\r\nMiddelburg\r\n5900', '84', '2014-05-23 11:58:46', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('70', 'Mzukisi', 'Makeleni', null, '27730829810', null, null, null, null, null, null, 'ZA', 'Lusaka', null, null, '5900', '3326 Athenkosi\r\nLusaka\r\nMiddelburg EC\r\n5900', '84', '2014-05-23 12:24:10', '48', null, null, null, '7804165855089', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('71', 'Andrew', 'Belling', null, '27733058581', null, null, null, null, null, null, 'ZA', 'Town', null, null, '5900', '7 kerk Street\r\nMiddelburg\r\n5900', '84', '2014-05-23 12:48:32', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('72', 'Venessa', 'Stalenberg', null, '27737695335', null, null, null, null, null, null, 'ZA', 'Midros', null, null, '5900', '38 Protea Avenue\r\nMidros \r\nMiddelburg\r\n5900', '84', '2014-05-23 13:53:19', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('73', 'Unathi', 'Goerge', null, '27736010630', null, null, null, null, null, null, 'ZA', 'Kwanonzame', null, null, '5900', '2572 Simphiwe Bleki\r\nKwanonzame\r\nMiddelburg EC\r\n5900', '84', '2014-05-23 15:05:41', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('74', 'Popi', 'Westel', null, '27849996502', null, null, null, '', null, null, 'ZA', 'Middleburg', null, null, '5900', '13 Daniels\r\nMidros\r\nMiddelburg\r\n5900', '87', '2014-05-23 15:15:14', '48', '2014-05-23 15:46:55', '1', null, '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('75', null, null, null, '27833557320', null, null, null, 'cpw.iym@mtnloaded.co.za', null, null, 'ZA', 'Middelburg', null, null, '5900', 'Market Street\r\nMiddelburg\r\n5900', '84', '2014-05-23 15:32:29', '48', '2014-05-23 15:46:03', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('76', 'Dean', 'Gedonas', null, '27737540992', null, null, null, null, null, null, 'ZA', 'Middelburg', null, null, '5900', '109 Smid \r\nMiddelburg\r\n5900', '84', '2014-05-23 15:47:07', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('77', null, null, null, '27824260685', null, null, null, null, null, null, 'ZA', 'Kwanonzame', null, null, '5900', '2 Mjekula\r\nKwanonzame\r\nMiddelburg EC\r\n5900', '84', '2014-05-23 15:58:25', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `client` VALUES ('78', 'Lizzette', 'De Klerk', null, '27248323855', null, null, null, '', null, null, 'ZA', 'Midros', null, null, '5900', '4 Horbert Avenue\r\nMidros\r\nMiddelburg EC\r\n5900', '87', '2014-05-23 16:14:59', '48', '2014-05-24 13:15:17', '39', null, '', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `clientskill`
-- ----------------------------
DROP TABLE IF EXISTS `clientskill`;
CREATE TABLE `clientskill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) unsigned DEFAULT NULL,
  `skill` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `orgname` varchar(255) DEFAULT NULL,
  `contactperson` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `county` tinyint(4) unsigned DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `addressline1` varchar(255) DEFAULT NULL,
  `addressline2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `terminationnotes` varchar(255) DEFAULT NULL,
  `terminationreason` varchar(255) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lookuptype
-- ----------------------------
INSERT INTO `lookuptype` VALUES ('1', 'YES_NO', 'Yes No Boolean ', '1', '0', 'Yes, No value options.', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('2', 'TRANSACTION_TYPES', 'Transaction Types', '1', '0', 'System Audit Trail transaction types.', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('3', 'LIST_ITEM_COUNT_OPTIONS', 'Listing Items Per Page Values', '1', '0', 'Available number of items per page on lists', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('4', 'ACTIVE_STATUS', 'Active Status Boolean', '1', '0', 'Whether a user is active or not', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('5', 'GENDER', 'Gender Values', '1', '0', 'The different gender values', '2012-03-19 18:50:51', '1', null, null);
INSERT INTO `lookuptype` VALUES ('6', 'ACTION_STATUS', 'Activity Statuses', '1', '1', 'The progress status values', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('7', 'CONTACTUS_CATEGORIES', 'Contact Us Form Categories', '1', '1', 'The contactus form categories', '2012-03-01 12:00:00', '1', null, null);
INSERT INTO `lookuptype` VALUES ('8', 'SALUTATION', 'Salutations', '1', '1', 'The different salutations Mr, Mrs, Dr, etc', '2009-05-12 19:18:15', '2012', '0000-00-00 00:00:00', null);
INSERT INTO `lookuptype` VALUES ('9', 'TICKET_SOURCES', 'Query Sources', '1', '1', 'The methods used to report customer queries', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `lookuptype` VALUES ('10', 'TICKET_STATUS', 'Query Status Values', '1', '0', 'The statuses through which a ticket runs through', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `lookuptype` VALUES ('11', 'TICKET_PRIORITIES', 'Query Priority', '1', '1', 'The priority assigned to a Query', '2013-12-06 19:18:15', '1', null, null);
INSERT INTO `lookuptype` VALUES ('12', 'TICKET_FEEDBACK_VALUES', 'Query Feeback Parameters', '1', '1', 'The rating values for Query feedback', '2013-12-06 19:18:15', '1', null, null);
INSERT INTO `lookuptype` VALUES ('13', 'DEPARTMENT_TYPES', 'Department types', '1', '1', 'The types of departments', '2013-12-06 19:18:15', '1', null, null);
INSERT INTO `lookuptype` VALUES ('14', 'DEPARTMENT_CATEGORIES', 'Department Categories', '1', '1', 'The categories assigned to departments', '2013-12-06 19:18:15', '1', null, null);
INSERT INTO `lookuptype` VALUES ('15', 'CLIENT_CATEGORIES', 'Client Categories', '1', '1', 'The categories of clients available', '2013-12-06 19:18:15', '1', null, null);
INSERT INTO `lookuptype` VALUES ('16', 'CLIENT_TYPES', 'Client Types', '1', '0', 'The type of customer.', '2013-12-06 19:18:15', '1', null, null);
INSERT INTO `lookuptype` VALUES ('17', 'USER_STATUS', 'User Status Values', '1', '0', 'The user status flags.', '2013-12-06 19:18:15', '1', null, null);
INSERT INTO `lookuptype` VALUES ('18', 'TOGGLE_ENABLED', 'Toggle Enable/Disable', '1', '0', 'Enabled or disabled', '2013-12-06 22:23:55', '1', null, null);
INSERT INTO `lookuptype` VALUES ('19', 'QUERY_CATEGORIES', 'Query Categories', '1', '1', 'The query categories', '2013-12-06 22:23:55', '1', null, null);
INSERT INTO `lookuptype` VALUES ('20', 'SYSTEM_MUNICIPALITIES', 'Municipalities and Towns', '1', '1', 'The municipalities and towns for querying clients', '2013-12-06 22:23:55', '1', null, null);

-- ----------------------------
-- Table structure for `lookuptypevalue`
-- ----------------------------
DROP TABLE IF EXISTS `lookuptypevalue`;
CREATE TABLE `lookuptypevalue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lookuptypeid` int(11) unsigned NOT NULL,
  `lookuptypevalue` varchar(50) NOT NULL,
  `lookupvaluedescription` varchar(255) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `createdby` int(11) unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lookuptypevalue_lookuptypeid` (`lookuptypeid`),
  KEY `index_lookuptypevalue_lookuptypevalue` (`lookuptypevalue`),
  KEY `index_lookuptypevalue_lookupvaluedescription` (`lookupvaluedescription`),
  CONSTRAINT `fk_lookuptypevalue_lookuptypeid` FOREIGN KEY (`lookuptypeid`) REFERENCES `lookuptype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lookuptypevalue
-- ----------------------------
INSERT INTO `lookuptypevalue` VALUES ('1', '1', '1', 'Yes', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('2', '1', '0', 'No', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('3', '2', 'Login', 'User login transaction', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('4', '2', 'Logout', 'User logout transaction', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('5', '2', 'Recover Password', 'User password recovery transaction', null, '1', '2012-03-01 12:00:00', '2013-12-23 14:14:55', null);
INSERT INTO `lookuptypevalue` VALUES ('6', '3', '10', '10', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('7', '3', '25', '25', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('8', '3', '50', '50', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('9', '3', '100', '100', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('10', '4', 'Active', 'Active', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('11', '4', 'In Active', 'In Active', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('12', '3', '250', '100', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('13', '3', '500', '100', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('14', '3', 'All', '100', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('19', '5', '1', 'Male', null, '1', '2012-03-22 12:06:17', null, null);
INSERT INTO `lookuptypevalue` VALUES ('20', '5', '2', 'Female', null, '1', '2012-03-22 12:06:28', null, null);
INSERT INTO `lookuptypevalue` VALUES ('21', '6', '1', 'Not Started', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('22', '6', '2', 'In Progress', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('23', '6', '3', 'Completed', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('24', '7', '1', 'Feedback', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('25', '7', '2', 'Ask a Question', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('26', '7', '3', 'Submit a Bug', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('27', '7', '4', 'Sign up Problems', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('28', '7', '5', 'Account compromised', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('29', '7', '6', 'Failed to Login', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('30', '7', '7', 'Suggestion', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('31', '7', '8', 'Need Help', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('32', '7', '9', 'Other', null, '1', '2012-03-01 12:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('33', '8', '1', 'Dr', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null);
INSERT INTO `lookuptypevalue` VALUES ('34', '8', '2', 'Ms', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null);
INSERT INTO `lookuptypevalue` VALUES ('35', '8', '3', 'Mr', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null);
INSERT INTO `lookuptypevalue` VALUES ('36', '8', '4', 'Mrs', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null);
INSERT INTO `lookuptypevalue` VALUES ('37', '8', '5', 'Eng', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null);
INSERT INTO `lookuptypevalue` VALUES ('38', '8', '6', 'Prof', null, '1', '2011-10-01 12:00:00', '0000-00-00 00:00:00', null);
INSERT INTO `lookuptypevalue` VALUES ('39', '9', '1', 'Physical Delivery', null, '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('40', '9', '2', 'Phone', null, '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('41', '9', '3', 'Email', null, '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('42', '9', '4', 'Fax', null, '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('43', '10', '1', 'Logged', 'Ticket received at CSR', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('44', '10', '2', 'Assigned', 'Ticket assigned to relevant directorate', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('48', '10', '3', 'Received', 'Ticket received at the assigned directorate', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('49', '10', '4', 'In Progress', 'Ticket allocated to a technician for resolution', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('50', '10', '5', 'Resolved', 'Ticket resolved by technician', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('51', '10', '6', 'Failed', 'Ticket has no resolution for query', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('52', '10', '7', 'Overdue', 'Ticket delivery delayed', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('53', '10', '8', 'Archived', 'Ticket has been archived', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('54', '10', '9', 'Technician Allocated', 'Technician has been assigned', '1', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('55', '11', '1', 'Low', null, '0', '0000-00-00 00:00:00', null, null);
INSERT INTO `lookuptypevalue` VALUES ('56', '11', '2', 'Moderate', null, '1', '2013-12-06 19:34:07', null, null);
INSERT INTO `lookuptypevalue` VALUES ('57', '11', '3', 'Normal', null, '1', '2013-12-06 19:36:11', null, null);
INSERT INTO `lookuptypevalue` VALUES ('58', '11', '4', 'High', null, '1', '2013-12-06 19:36:47', null, null);
INSERT INTO `lookuptypevalue` VALUES ('59', '11', '5', 'Critical', null, '1', '2013-12-06 19:36:59', null, null);
INSERT INTO `lookuptypevalue` VALUES ('60', '12', '1', 'Poor', null, '1', '2013-12-06 19:37:33', null, null);
INSERT INTO `lookuptypevalue` VALUES ('61', '12', '2', 'Fair', null, '1', '2013-12-06 19:37:43', null, null);
INSERT INTO `lookuptypevalue` VALUES ('62', '12', '3', 'Good', null, '1', '2013-12-06 19:37:50', null, null);
INSERT INTO `lookuptypevalue` VALUES ('63', '12', '4', 'Very Good', null, '1', '2013-12-06 19:38:01', null, null);
INSERT INTO `lookuptypevalue` VALUES ('64', '12', '5', 'Excellent', null, '1', '2013-12-06 19:38:15', null, null);
INSERT INTO `lookuptypevalue` VALUES ('68', '14', '1', 'Level 01', null, '1', '2013-12-06 21:59:27', '2014-01-07 19:51:49', null);
INSERT INTO `lookuptypevalue` VALUES ('69', '14', '2', 'Level 02', null, '1', '2013-12-06 21:59:38', '2014-01-07 19:51:49', null);
INSERT INTO `lookuptypevalue` VALUES ('70', '14', '3', 'Level 3', null, '1', '2013-12-06 21:59:50', null, null);
INSERT INTO `lookuptypevalue` VALUES ('71', '13', '1', 'Metropolitan', null, '1', '2013-12-06 22:04:45', null, null);
INSERT INTO `lookuptypevalue` VALUES ('72', '13', '2', 'District', null, '1', '2013-12-06 22:04:54', null, null);
INSERT INTO `lookuptypevalue` VALUES ('73', '13', '3', 'Local', null, '1', '2013-12-06 22:05:05', null, null);
INSERT INTO `lookuptypevalue` VALUES ('74', '16', '1', 'Company', null, '1', '2013-12-06 22:08:22', null, null);
INSERT INTO `lookuptypevalue` VALUES ('75', '16', '2', 'Individual', null, '1', '2013-12-06 22:08:52', null, null);
INSERT INTO `lookuptypevalue` VALUES ('76', '15', '1', 'Community', null, '1', '2013-12-06 22:11:37', null, null);
INSERT INTO `lookuptypevalue` VALUES ('77', '15', '2', 'External', null, '1', '2013-12-06 22:11:48', null, null);
INSERT INTO `lookuptypevalue` VALUES ('78', '17', '0', 'Pending Activation', null, '1', '2013-12-06 22:16:10', null, null);
INSERT INTO `lookuptypevalue` VALUES ('79', '17', '1', 'Active', null, '1', '2013-12-06 22:16:24', null, null);
INSERT INTO `lookuptypevalue` VALUES ('80', '17', '2', 'Deactivated', null, '1', '2013-12-06 22:16:40', null, null);
INSERT INTO `lookuptypevalue` VALUES ('81', '18', '1', 'Enabled', null, '1', '2013-12-06 22:25:40', null, null);
INSERT INTO `lookuptypevalue` VALUES ('82', '18', '2', 'Disabled', null, '1', '2013-12-06 22:25:48', null, null);
INSERT INTO `lookuptypevalue` VALUES ('84', '15', '3', 'Service Provider', null, '1', '2013-12-07 16:33:06', null, null);
INSERT INTO `lookuptypevalue` VALUES ('85', '15', '4', 'Government', null, '1', '2014-01-07 19:50:10', null, null);
INSERT INTO `lookuptypevalue` VALUES ('86', '9', '5', 'Other', null, '1', '2014-03-25 11:11:03', null, null);

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for `servicetype`
-- ----------------------------
DROP TABLE IF EXISTS `servicetype`;
CREATE TABLE `servicetype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `defaultrate` decimal(10,2) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of servicetype
-- ----------------------------

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
INSERT INTO `session` VALUES ('03sbt6tmngf0hqgind53adoec7', '1397551772', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('0g2h5ak0fhabe85iopj15dboc6', '1398914828', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('0mnn7b14r12hcfh7nh8ilibc06', '1398882900', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('0o6uec9521favqlg8ve87vsjn6', '1400486562', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"45\";s:5:\"phone\";s:10:\"0822964667\";s:4:\"type\";s:1:\"2\";}');
INSERT INTO `session` VALUES ('0p1solfosdv6fk6ibl46sv46t7', '1399013677', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('13f4jv41art3keohlu2q8j1qt1', '1397549834', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('1s17ucnentghcsf9e4ct2rr787', '1398994193', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('1ukeppciuae741vm1346htljk6', '1397634789', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('20gqo4i4k3ku9vic7scks68q96', '1398158419', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('268rsl0uu12j9s72j1pv24if40', '1397202859', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('2896mt5g0f574hvut247fne9q7', '1398991378', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('2ig1kak4lcdcqg5jthaoaml6t6', '1400411032', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('2kscvl5jb3vsqaomr9spajjf55', '1398848062', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('2msrtv0qk64vm4i6658svggn20', '1398349727', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('32m2sd2ej1bhitli8cpcj6ugc6', '1398348804', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('33456afpt9mjpe4qdulr5oh1f0', '1398233713', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('33aljlj1p67gls1sd180rheah2', '1397548532', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('34fk4nvmc3bvciu04b5k6312k4', '1398847288', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('34nenqk2kgab3e8ssmsolkma60', '1399015058', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3b9mago87t9fv84n17lvtsmdk6', '1397228902', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3c8uuuh3hs09ird98dkjigc0a6', '1398845857', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3eltglv8su4se1tki9mi2tfbk4', '1397636128', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3evk2o7h3e24r2gvflon896u60', '1398761783', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('3ga9hv1lldfb4lqujrf7k0jca4', '1398853244', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3gn39td0d5651dh2v8no5kdau4', '1400064392', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3mk9quu7pb75771ihf4bo9lcr4', '1398238333', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3n2n1kg8585gu26s3js9b607g5', '1398882901', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3nosdcpetm4ra0crqtdu1ud6l1', '1400141266', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('3rn1itnq3dh1t8pnstoru2bjj7', '1398947849', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('474aqj4c6famjd593fl8od7f33', '1397643851', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('493hnl2t1sovpd6si6is7d48s5', '1400763220', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('49ml59rtu3k1g5lpnc1db174a2', '1397203716', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"48\";s:5:\"phone\";s:10:\"0787758486\";s:4:\"type\";s:1:\"2\";}');
INSERT INTO `session` VALUES ('4c3bucbn5jf7rhjueddhemm0r3', '1400096300', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('4cfnpf1v3badrikulch2jh0hf5', '1398947736', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('4f1g39e1hqag4ecplbrn9agf92', '1398938084', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('4hsb39o0gqrq70edneda3mhqg0', '1397200355', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('4jp9hfke3jv9hlhcsghrdkvn15', '1398170014', '10800', 'Default|a:11:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('4ls0dkmeigi8ssdpnsu4lnlan4', '1398993648', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('4tu4hrrt95o8ds9td9fjhf2ai5', '1398845219', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('55e92hmmq930huoj3edau46m60', '1400073568', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"67\";s:5:\"phone\";s:10:\"0488015119\";s:4:\"type\";s:1:\"2\";}');
INSERT INTO `session` VALUES ('576sicupd3f4labdg8d6evhcp4', '1398850460', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('5b6jpjd4go0dj669eo7mlqden3', '1398759353', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('5c2prl8pn32hdm6ujnhqhoave4', '1398844543', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('5fgnbtnk0q5viap9c9bnphds61', '1398754075', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('5jga215lt0fbu008clf4f0ha37', '1398178377', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('5qth4gsubfktasibvjrr8u1lf0', '1398848313', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('62fdnh2dpnhtdhus8tdmsq43i1', '1398753291', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('64v0kg925pfnf5mpuvml7qm6g7', '1398753246', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"70\";s:5:\"phone\";s:10:\"0732125608\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('6and6mukss91q5tt7uf57omh55', '1398170657', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"66\";s:5:\"phone\";s:10:\"0488015000\";s:4:\"type\";s:1:\"6\";}');
INSERT INTO `session` VALUES ('6g6egb21urivfq1p2q5ah7q2v1', '1398233872', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('6h5snc6ugl34a2psuuhmtr49n5', '1398845887', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('6i11lksntnq6brv04ppbu6g7j1', '1398946298', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('6k8qdgmrv7eafuskvsjhjbetr3', '1398786181', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('6kfto6m46io5ad8mc6e69c3od4', '1398841882', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('6r045b1490lipbag40131slnk1', '1398233818', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('6r8m1lurc86ofqp4v45pr2lq51', '1398233694', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('6tuchij8v23jbnvuaheslgojm5', '1400149253', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('6udgqmv08gk6vqki0309o7f882', '1401184885', '21104000', 'Default|a:13:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('730qr1u4fetqcv2961v1m356l0', '1398842354', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('75oahgfpheev968umusj2k0ms7', '1398882899', '10800', '');
INSERT INTO `session` VALUES ('7bn0qnpke8ogg02ib9djlj3ba1', '1400579494', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"45\";s:5:\"phone\";s:10:\"0822964667\";s:4:\"type\";s:1:\"2\";}');
INSERT INTO `session` VALUES ('7bqt4of5dcnu6bfpl39b144t65', '1398233818', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('7su4efpsfnlu84l9fb5ldtj9g3', '1400141528', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('7t3904op1bseqo1v0nas70o4u2', '1398497223', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"69\";s:5:\"phone\";s:10:\"0733770290\";s:4:\"type\";s:1:\"3\";}');
INSERT INTO `session` VALUES ('7ukpfbb2qsmr0j0o8qp8rrb5b7', '1398993091', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('830kf0iu0er99514iprvrbk060', '1400140696', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('847usjbbaj0ou5i7m8i5eh3ri0', '1400065032', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('878gg7rn0s77p8sbn560d745r7', '1400832527', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('87ts0q3amt9a46afd3ns026l26', '1397206994', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('88smog6b1iplufcmo7rdumda52', '1398159229', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"52\";s:5:\"phone\";s:10:\"0488015000\";s:4:\"type\";s:1:\"7\";}');
INSERT INTO `session` VALUES ('8bc0pjcnl5tc4tga8k4pg63i66', '1399014791', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('8hrvqubqee0rklvqjqlokefeu0', '1398436865', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('8ioo7uhbnj3hmo3ti477v9cpl1', '1398760322', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('8j4kulej3fmoo2lto8o5j1mvl6', '1398914303', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('8ubfggbb8vg1jeue6n5k1thbe4', '1398151038', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('8vhobv3knco3v7h101qrqetci5', '1398762917', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('91u6ubsum6cfvv9g1c6s5u86v7', '1400853317', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('927mubdqaae061dtf4vvf05pa1', '1398236186', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('92jqjidsncevpkis7lrhhp5ev7', '1398408202', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"65\";s:5:\"phone\";s:10:\"0488015031\";s:4:\"type\";s:1:\"3\";}');
INSERT INTO `session` VALUES ('95242garkjrnsd8mdsulekt044', '1400335271', '10800', 'Default|a:15:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('9598mu9lho5bmo7ftuvrou0qd6', '1398928645', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('9av2am9n9tp3d8930h6099rt23', '1398882898', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('9b8jkcdmh7e1qu3ok00p9peca4', '1397994130', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('9dd7ehn41tujcgv19bc0nhg364', '1398913867', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('9donln5scpt0s484st28p4kh02', '1398233701', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('9kkr5sfep18h8rtpmf70f77hg2', '1398254334', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('9nhg9ge9ahlechr84edagk3d87', '1398323064', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('9tf5l4fk8472vsg41gpqgo9f97', '1398233712', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('9v8ftc0s5seekjrborits3dq21', '1398237727', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"39\";s:5:\"phone\";s:0:\"\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('a2s43finb8cuka3tt460658j20', '1398329245', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('a4r4jjcgui7a51gbdhjb77ccq6', '1398845578', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('a87rdegl4mkp1qvglcjv0oi3k4', '1398882897', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('alk0m5rdb8p5ebu5u4l35ahsu3', '1399014612', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('amspghhnonr47gms86tkktffq4', '1398408024', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('b5d00ffjsts0cjqp8m2n3177k2', '1398753291', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('b697irli11qvla8qbf3o6b2sc1', '1398159991', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ba65t2c1udc54ip2pf40gk3cf6', '1398322484', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('bdh2t63sl7mulj09ctbl1t8iv5', '1398170857', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('bgffj1999n0rv8iujp6gdi0bu3', '1398992895', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('bj72cmfbmd2gisjh8lhqa76m94', '1398327540', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('brfgk299vhtu89s1ih1nkpvmg2', '1398847210', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('brlb4fp39r95fkp7vc13nvchp2', '1398861846', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('btad31db5fkf9rlaal06ub8jq1', '1399360732', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('btg3ppjc303mfk3lt7a1krbk23', '1400754154', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('c2au3t6kvuv1rvmltc65mjds20', '1398914359', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('c2gv32js5suqetbm6jus11v316', '1400411401', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('c46rtptdkdktsl3dv0d6hjete0', '1398492719', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('c6c95n04pppvi608pu4ni68ad4', '1397541607', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('c8tmlj437ktm10oj1o64pj2s74', '1398156047', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('c9odqdmcqbbnesde12hsh7pj16', '1398852588', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('caoi868b375hgf0g5r6sj34ur5', '1400845575', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ccu05rk6hpgfd0hl5v9dh7bm17', '1400072581', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('cd44gd1n3moptnk6av01ppkce0', '1397635639', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('cfbg30dc11cmeuhr2lekmnc934', '1400752922', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ck1c6o21nc5jbt1l75t8l5u0v2', '1399300555', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ck5ehvcfs2ughn57hkvg8kki87', '1398945666', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ckk56b17i4p298rnjgpflgh5h7', '1398882900', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('cps2n1v0b20fr7bilmp3eq50q5', '1398870475', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('cpvg2oi5vag6o4behgpmukn8b7', '1398158942', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ct3qfn1ifughl8e1ruai9g3di4', '1399732227', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('d5o8e5s5r4rn72kpahmcpklgh3', '1398408311', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ddvcamm5gffn685nv1mofi7851', '1398786688', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('djbjhjdruemdl6hv6dhlmlmuh3', '1400892713', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('dn19qntv8gmbgrintrlheq27a2', '1398753245', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('dp8lidjjo57e7d9u09t2bsfma7', '1398149720', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('druo2upt35ap818m8hbbhgtkb4', '1398755694', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('dsduu911u6392otdnlnk8ivq20', '1400831860', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('dtf4cqerroeeae81e8nugs8nj5', '1398333678', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"63\";s:5:\"phone\";s:10:\"0835093924\";s:4:\"type\";s:1:\"3\";}');
INSERT INTO `session` VALUES ('e1a7uvusko3lf3lu0srqt81kh5', '1400076811', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('e6mfo0qa4l0q7ah3itjb3a22i0', '1399039039', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('e8tadb494ltqpjs08hqdh7mpt3', '1397286182', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ef6rbi4inoap4m4echsh0tvkv3', '1398846973', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('eljijhafa8dqcdl2o3g7vbfam2', '1398947366', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('em57kemhiri7hv3t6potapd7f5', '1399965930', '10800', 'Default|a:15:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"10\";}');
INSERT INTO `session` VALUES ('fa9kn25pjei4qd8noa3ltblnl3', '1400068423', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('fask9so3phoi0cet1vonf1k7l6', '1398869928', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('fc7bgrq5ncuiurnef3d6a7pa16', '1401089166', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('fe6avl6v3c98u22n8remlbh7n3', '1400772352', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('fhajrg1d4kqjvkvhotcfa5epo7', '1397654069', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('fpgtp94lt67fp7v8gf8h3vasu1', '1398842237', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('fvtnuhi5d7ou1fot8vmqite4s0', '1397398151', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('g3q4r78uum8g3eh3bqb0bdmvr0', '1398882900', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('g7a94odi1tfdgb4ahfsgujcao0', '1398159298', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('gc83vl5d6lp09ool0o668te294', '1401113799', '21104000', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('gem2sshmollsb4724pggo3pqa0', '1398882900', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('ghm02rj3nnr4hq86ddga0a3nn7', '1398842668', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('gi2m9k3kdc8a592p8h1kpf3ev3', '1400175255', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('gjakkf3c8lps531tid878vupd4', '1398844151', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('gjjevmcvd6l3v94bqcn8ccts32', '1398848300', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('gl2j5vj93ruqg1c3hc625iv9o5', '1398872351', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('gmdilf0tpsgfa8pjil00purov7', '1400141994', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('govp74apj6d3cij5bakglt2og5', '1398882898', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('gv0psacd5se7lstgfl7583l4j7', '1400136083', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('h660r5l6gq588qcoo8boat7116', '1400758334', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('h7u3u566gptjauo0fms9r48je3', '1398843805', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ha3kivg07775qq2gtau0jkp7k1', '1399550334', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('hd8bt47bp3jnvqik1nv25d2471', '1397554998', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('hicpfmsk70m359j7hlithvesn0', '1400105966', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('hkk734dr07brj21o8qeo806pv4', '1400892500', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('hv9nm64h34lh7cua4kegu4e573', '1398845309', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('i6ff86130rqq935r6ghaspq7e6', '1398882900', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('i74m7id9nvcnimbh6m027pcv70', '1398233818', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('ia8jjbfv2amjh852886r89c0e2', '1397206567', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"56\";s:5:\"phone\";s:10:\"0488015084\";s:4:\"type\";s:1:\"2\";}');
INSERT INTO `session` VALUES ('icq1rut8lf6stb96ilgq4nqhr6', '1398233817', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('idj7s6pjfsmdd73ocpdh372v02', '1398235679', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('ilmt6t2qrqcibqbl75l687rt77', '1397483488', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('irhfu16fa7c79qjjl6tik0ea91', '1400066284', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"72\";s:5:\"phone\";s:10:\"0835468723\";s:4:\"type\";s:1:\"2\";}');
INSERT INTO `session` VALUES ('iuamqsp6eclt39frg0qvpl11b7', '1400854707', '10800', 'Default|a:19:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"48\";s:5:\"phone\";s:10:\"0787758486\";s:4:\"type\";s:1:\"2\";s:32:\"departmentallocationnotification\";s:0:\"\";s:20:\"logquerynotification\";s:0:\"\";s:28:\"clientallocationnotification\";s:0:\"\";s:30:\"clientstatusupdatenotification\";s:0:\"\";s:9:\"msgreturn\";s:4:\"json\";}');
INSERT INTO `session` VALUES ('iukn4o244remec4g3v5s3o7pu7', '1400064395', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('j59h7ksrvea2l8hrbuvr90nbc7', '1401089874', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('j6j91dhntimbg9l4405ivr1g72', '1398993560', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ja20oa6d95bgsoi7t74mgmdoh4', '1400072888', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jcagd1jdrismn1o639t0c0g3q4', '1398239603', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jel4kp2igcm3sbc4mpknrilrf2', '1401109043', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jge0kvhsqp2l5gv0j69g63lnh3', '1398945009', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jh468g0lmkp0dq9u3tcacco4u4', '1401099648', '21104000', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jjgu4uirci69n10j5fe5c9u835', '1398914309', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jknqbtobao14t1ikpro04b3sc3', '1398158942', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('jmsdpasd39acm6npt1cuhcbav6', '1398841033', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('jtc88i933tai7gr357l8tmgj05', '1397635622', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('k0o2pplp059vkfk84tqmcl3ji7', '1398853550', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('k14ljjj62k70lpk0b2goirtb07', '1400832284', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('k613ak8btr4s20ud2fdn9imaa4', '1399014564', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('k6fpul8lc7tjqqkev31nnqv0i6', '1398332750', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"68\";s:5:\"phone\";s:10:\"0783252997\";s:4:\"type\";s:1:\"2\";}');
INSERT INTO `session` VALUES ('k8j15e5o6ldnjjfqp9hu98h550', '1397472457', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('kbodn9gen34c5n0mngucee99m6', '1400753100', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('kc7q1b6kbtikurc682ordgrgj7', '1398753118', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('kcac61fq9prdgd41d6tdqodla6', '1398852974', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ke5rudjqv80s72libe5jf7uqj4', '1398844723', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('kj49j6rlgjn8n30oip7m80lmh7', '1400844726', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('km6fm0uk6n7225io1iruem6ad2', '1398233694', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('km94lcvt90uvukeq9lc7ts6qp5', '1398854996', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('knq3fjs9c7gauvs4soqkhr51q5', '1398946708', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ks9l3mhvokl1ufi7de24fhv7f0', '1398848240', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('kudnct92rdvqe31g9nv3i014r4', '1397376345', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('l1hve2bon2t45ps7jlr1sp5j97', '1400065528', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('l3pe5jt9a947e488ebd1hdbll0', '1397564114', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('l9injc91a9rfq5d8ode48b19e2', '1398882900', '10800', 'Default|a:3:{s:11:\"initialized\";b:1;s:6:\"errors\";s:26:\"Please enter Email Address\";s:10:\"formvalues\";a:3:{s:10:\"controller\";s:4:\"user\";s:6:\"action\";s:10:\"checklogin\";s:6:\"module\";s:7:\"default\";}}');
INSERT INTO `session` VALUES ('lhb58vl300huoat2cpc46a7fu0', '1398234456', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('lj8sogmd6pfrt3qbpr7bvlhq06', '1398882899', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('llakj1atjlbc3ka2hs4jndaim3', '1400068522', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('lm24afre9q69c6jed1vrkbj5e3', '1400752984', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('lqh7prh9saothrekiahcb5npj1', '1398915072', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('lqkdhfigpf0s35er1q9jenc8q0', '1400832322', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ltnrg41cb56eh8b5smo7e6rri1', '1400073467', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ltovavudds4jrrfia3aifnmss5', '1398239752', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"64\";s:5:\"phone\";s:10:\"0488015015\";s:4:\"type\";s:1:\"3\";}');
INSERT INTO `session` VALUES ('lvc79vq86hovv2vfaifs94s553', '1397207238', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"57\";s:5:\"phone\";s:10:\"0488015094\";s:4:\"type\";s:1:\"3\";}');
INSERT INTO `session` VALUES ('m3a6q88h8tfuj6jpr8cd3bc174', '1398780064', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('m6hepodp0i7ue1n59v0qb4e9g3', '1398918770', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('mdc3mmudnuqnhufns9l1biljc3', '1398917678', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ml6m0r01s0lq8fp99hin7upj83', '1397563006', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ml8ist3jbe7f0k6ks8e1k9ku63', '1397199880', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('mlaabh0dsp1jca6ktjvoi63q54', '1399039842', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('mnprf46nco7a8gkj2mdm6l5356', '1398992498', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('mrub2viek8vg0856o6g3erf4u7', '1399284391', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('mtddun1q2rel8bj4q9ol04bn12', '1400830320', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('n02ib9p9mf6t8egq695n0u57m4', '1397725149', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('n3o2ktk22pahjb40irr9ie8hk7', '1398753291', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('n3pfmvfdfikigmeosae9rubt14', '1400073581', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('n7i422n2aog7r4avnefmu5d1g6', '1397212497', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:1:\"1\";s:5:\"phone\";s:10:\"0836246789\";s:4:\"type\";s:1:\"1\";}');
INSERT INTO `session` VALUES ('njlkltg9mi1irvncgole995b56', '1398845128', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('nk0rou7de55q04ted4amvnen71', '1398845222', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('nl42veoh99baa2a6pv1i3257o7', '1397566069', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"53\";s:5:\"phone\";s:10:\"0488015000\";s:4:\"type\";s:1:\"6\";}');
INSERT INTO `session` VALUES ('nsntmj7t9mtepjopdn0j02icb3', '1398859703', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('o3dp8429dtiu1s5ih7gaekca31', '1398847529', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('o4t65dem1jmu2f1mum5jq3shc2', '1400074854', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('o8qm37bmt9rjjt90u191lil0q0', '1399034005', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ochgsgkmj5acu2pqnigu8fv812', '1398169682', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('odt02mctededromk9pkoubqbb5', '1398233694', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('oe7akahpuhir4u01peub6i1il3', '1398149666', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('of7frmfle41tujbervd2n1m797', '1398159878', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"49\";s:5:\"phone\";s:10:\"0488015000\";s:4:\"type\";s:1:\"7\";}');
INSERT INTO `session` VALUES ('ohtoubf1374jac2egc4n12uke0', '1397827265', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('okfqkuodu0h9rin0016csok985', '1398882901', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('omi31df5meoe0761cnd754m5b6', '1398993806', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ontgcojhmooi1l8hhcphmpmaj4', '1397468246', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('or30bmmq5p4gv9jrn514mi7125', '1398913446', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ot759tu1vc5nmmmk1jegqkdig4', '1400140931', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"49\";s:5:\"phone\";s:10:\"0488015000\";s:4:\"type\";s:1:\"7\";}');
INSERT INTO `session` VALUES ('ovh0qg3m4c11sccat18ql9b9h7', '1397464215', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('p5ss0971rsq7crth4ekgmv12f0', '1400070949', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pbgr26inoo91mj3pfbcsfide90', '1400076236', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pcd673jkb03i2d0nhn9952hjl4', '1397923055', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pciq3816bciekmv4b39e2jahm3', '1399031088', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pcs1fu1si0fgkql6jft6ktem27', '1397921112', '10800', 'Default|a:20:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"39\";s:5:\"phone\";s:0:\"\";s:4:\"type\";s:1:\"1\";s:20:\"logquerynotification\";s:0:\"\";s:16:\"itemcountperpage\";s:2:\"10\";s:30:\"clientstatusupdatenotification\";s:0:\"\";s:6:\"unread\";s:1:\"0\";s:10:\"newmsghtml\";s:137:\"<a title=\"Messages\" href=\"/public/message/list\"><img src=\"/public/images/email.png\">Messages (<label class=\"unread\">0 Unread</label>)</a>\";s:9:\"msgreturn\";s:4:\"json\";}');
INSERT INTO `session` VALUES ('pi3s7rpg1vti1ad1aocknub0h0', '1398233702', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pinn07r77aucl98nfnoeemav81', '1398158248', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pkl23gr389t7cs109a6mhuhen5', '1398233694', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pkqv7aeuavfoq3p870d3ep5db1', '1398882900', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('plgpfdc65cl2gpca4b3uve3j42', '1398235340', '10800', 'Default|a:16:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"67\";s:5:\"phone\";s:10:\"0488015119\";s:4:\"type\";s:1:\"2\";s:32:\"departmentallocationnotification\";s:0:\"\";s:28:\"clientallocationnotification\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ppjo5dnbs5ks94dgn025vmir36', '1400068495', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ppjtfu71v136e3ob0nuv462f70', '1400772328', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pprv2lu9epkgefnhuada0hfag6', '1398882260', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pqccteu33rpe7vpl3l12j25s21', '1398234454', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('pqe90n9hvefd6lsergpck1gdr2', '1398149490', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('prce4p9ajpioq73tf3t1nlae23', '1398882901', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('pt9evh1hvb5m8srr8kposvjbb7', '1398915057', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('q1onds4tn9qpeospddujpabpn1', '1400074583', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('qbqbrtfoe1rk2g35dt5qt811p4', '1400135362', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('qc9qsm2dgroqijjqblppie4de7', '1398779973', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('qe33s8ktuns2iscj1qvl89fkl5', '1397470512', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"59\";s:5:\"phone\";s:10:\"0488015089\";s:4:\"type\";s:1:\"3\";}');
INSERT INTO `session` VALUES ('qtkd3ja0e5ufpa1p261viji3b5', '1400659306', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('r0k0s244j4q7iientjv7eccqj6', '1398322294', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('r2em1iqijvdgimrdf5na529cp4', '1398882901', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('r3mdgaid678jmpkfql4bk8vdm3', '1398882900', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('rcdd9c32pv9j8vj5rr0ehjk8r3', '1399187182', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('re6fjat57rbvte1vcajpcgq951', '1399559253', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('rfq8bgdqofasej140eaobueqg2', '1400074648', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('rkqssie6nan5urhkabu69m90t1', '1399010742', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('rli49psjg53scri6oaesbk4ik5', '1400605586', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('rmfccgdgmn2ptu97pel7d8pt13', '1400840756', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('s0b78tvj4tvsjvod18b6ki8l27', '1398845262', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('s3c01gtoluv62c02u4t51kt3a0', '1398766162', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('s64rdiuvfljo2pt1fcned3ot51', '1400071794', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('s6g9dl0va4s14lu0iffeetbcl0', '1397202500', '10800', 'Default|a:14:{s:14:\"successmessage\";s:0:\"\";s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"55\";s:5:\"phone\";s:10:\"0498021380\";s:4:\"type\";s:1:\"3\";}');
INSERT INTO `session` VALUES ('s935aa0jt83ckl5f2vm5o46337', '1400930119', '10800', 'Default|a:15:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"39\";s:5:\"phone\";s:0:\"\";s:4:\"type\";s:1:\"1\";s:16:\"itemcountperpage\";s:2:\"25\";}');
INSERT INTO `session` VALUES ('sau1m9u075bk3j663j2gl0q2u5', '1397580108', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('skqk3c3bpa2sa91qpmvadb1m03', '1398323063', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('skr9shmvk0bobmq8ha41sdesd5', '1398882897', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('spvq3a22b7kgh7hrkhikedc6n0', '1400752924', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('sqobrmkohokb22qmfflqrnoi27', '1400082148', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('t63de1h54rufj6bsijkb32ado5', '1397411703', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('t6pom2iurnum3hn9nah17c3ha4', '1398841994', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('t80fmfrdfrfn1k0k4bm0ij8em6', '1400068478', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ta19cau5s14ticsnp0cik0j7j0', '1398787324', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('takt6c2f8uot51dd5elfbmgvv0', '1399003432', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('tc1kuaeivmlrfvifremoipda03', '1398844399', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('te5da4ak3s5t0um7h526p88qe7', '1398882901', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('tgqj47gs1l15e12iac6gaktv22', '1398233870', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('tjm2919u741el7mr58mmqddir6', '1397541934', '10800', 'Default|a:14:{s:11:\"initialized\";b:1;s:6:\"errors\";s:47:\"The following errors occured <ul><li></li></ul>\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:3:{s:10:\"controller\";s:7:\"profile\";s:6:\"action\";s:14:\"processpicture\";s:6:\"module\";s:7:\"default\";}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";s:6:\"userid\";s:2:\"63\";s:5:\"phone\";s:10:\"0835468723\";s:4:\"type\";s:1:\"3\";}');
INSERT INTO `session` VALUES ('tqgq57n0rv96fm6holjjk2adi6', '1397733172', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('trtrp1h0dgffpe0hqse2rkaq15', '1400756810', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('uc2dbqic9p43shkopjpb8l1sv5', '1397297430', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('uc3vq4euos06q43megmslfqs44', '1398994450', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('ug9s8l44rs8qgsil2ku6t513o6', '1400075645', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('uj0e1ivhm6q03kfa4jg2ej0h93', '1398882900', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('upfqocp5n2tsd61j559gg11f13', '1397298088', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('v3t0dan9qo9nbjbtaqegg83cr4', '1398332957', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('v9r4jj5b04up3gglugc4hjr9r2', '1398882715', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('vl9iqh5798o2jkncth4kq5v1p4', '1398882898', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('vpcbpbnrqq6tpggb1ond792pq7', '1398237213', '10800', 'Default|a:1:{s:11:\"initialized\";b:1;}');
INSERT INTO `session` VALUES ('vqdcgm4i20r23bfaoqd1av9es4', '1398846109', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('vshcm9jpjc2jemgf485ncumbq4', '1398319401', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('vstmn3m2fkos993d0re1pva0o4', '1397206471', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');
INSERT INTO `session` VALUES ('vv6hn5tk3jktsqehj0ti9e2so3', '1398845678', '10800', 'Default|a:11:{s:11:\"initialized\";b:1;s:6:\"errors\";s:0:\"\";s:14:\"successmessage\";s:0:\"\";s:10:\"formvalues\";a:0:{}s:13:\"invitesuccess\";s:0:\"\";s:13:\"custommessage\";s:0:\"\";s:14:\"custommessage1\";s:0:\"\";s:14:\"custommessage2\";s:0:\"\";s:14:\"custommessage3\";s:0:\"\";s:14:\"custommessage4\";s:0:\"\";s:14:\"custommessage5\";s:0:\"\";}');

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
  `username` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `home` varchar(15) DEFAULT NULL,
  `work` varchar(15) DEFAULT NULL,
  `cell` varchar(15) DEFAULT NULL,
  `password` varchar(50) DEFAULT '',
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
  KEY `index_useraccount_phone` (`home`),
  KEY `index_useraccount_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraccount
-- ----------------------------
INSERT INTO `useraccount` VALUES ('1', '1', 'Unathi', 'Torico', 'Peterson', 'admin', 'admin@devmail.infomacorp.com', '', '0836246789', '', null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', '1950-01-01', '1', '', '2013-10-01 00:00:00', '1', '', '1397411346.jpg', '', null, null, 'ZA', 'East London', 'Ch', null, null, '3 Linden Road Chiselhurst', null, null, '0', null, null, '2013-09-27 15:23:38', '1', '2014-04-13 19:51:12', '1');
INSERT INTO `useraccount` VALUES ('39', '1', 'Jin', 'Browning', null, 'jbrowning', 'm.herman@devmail.infomacorp.com', null, '', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-04 15:24:29', '1', null, '', null, null, null, 'ZA', '', '', null, null, '', null, null, '0', '1', '2014-03-30', '2014-03-30 21:43:57', '1', '2014-05-24 12:53:17', '1');
INSERT INTO `useraccount` VALUES ('40', '3', 'test', 'department', null, 'department', 'hmanmstw@devmail.infomacorp.com', null, '1234567892', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-04 15:29:38', '1', null, '', null, null, null, 'ZA', null, null, null, null, null, null, null, '0', '39', '2014-04-04', '2014-04-04 15:26:30', '1', '2014-04-04 15:29:38', null);
INSERT INTO `useraccount` VALUES ('41', '2', 'test', 'customer care', null, 'custocare', 'hmusiitwa@devmail.infomacorp.com', null, '1254878584', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-04 15:30:32', '1', null, '1396614748.jpg', null, null, null, 'ZA', null, null, null, null, null, null, null, '0', '39', '2014-04-04', '2014-04-04 15:28:46', '1', '2014-04-04 15:32:29', null);
INSERT INTO `useraccount` VALUES ('42', '7', 'Amos', 'Mthetho', null, 'amos001', 'amos@devmail.infomacorp.com', null, '0734678798', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-06 17:06:42', '1', null, '1396796352.jpg', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nP.O. Box 24\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-05', '2014-04-05 09:48:38', '1', '2014-04-30 08:56:53', '1');
INSERT INTO `useraccount` VALUES ('43', '3', 'Mtheza', 'Sipunzi', null, 'mteza001', 'mteza@devmail.infomacorp.com', null, '0715808668', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-07 09:27:35', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nP.O. Box 24\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-07', '2014-04-05 10:05:16', '1', '2014-04-07 09:27:35', '1');
INSERT INTO `useraccount` VALUES ('44', '3', 'Lulama', 'Mashiya', null, 'mashiya001', 'mashiyald@devmail.infomacorp.com', null, '0760783803', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-08 20:20:38', '1', null, '1396992377.jpg', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Ixuba Yethemba Municipality \r\nTechnical Services\r\nHigh Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-07', '2014-04-07 17:36:02', '1', '2014-04-08 23:26:17', null);
INSERT INTO `useraccount` VALUES ('45', '2', 'Nomzamo', 'Myo', null, 'Nomzamo001', 'nomzamo@devmail.infomacorp.com', null, '0822964667', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-24 09:14:45', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Ixuba Yethemba Municipality\r\nTechnical Services\r\nHigh Street Cradock\r\n5880', null, null, '0', '1', '2014-04-14', '2014-04-07 17:39:04', '1', '2014-04-24 09:14:45', '1');
INSERT INTO `useraccount` VALUES ('46', '3', 'Avela', 'Mashaba', null, 'Avela001', 'avelamashaba@devmail.infomacorp.com', null, '0722619996', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-24 09:04:31', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Ixuba Yethemba Municipality\r\nTechnical Services\r\nHigh Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-14', '2014-04-07 17:48:03', '1', '2014-04-24 09:04:31', '1');
INSERT INTO `useraccount` VALUES ('47', '2', 'Ncedisa', 'Sindelo', null, 'ncedisa001', 'ncedisa_sindelo@devmail.infomacorp.com', null, '0796272759', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-10 09:48:09', '1', null, '1397128657.jpg', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nTechnical Services\r\nHigh Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-10', '2014-04-10 08:54:36', '1', '2014-04-10 13:17:37', '1');
INSERT INTO `useraccount` VALUES ('48', '2', 'Linda', 'Diena', null, 'linda001', 'linda@devmail.infomacorp.com', null, '0787758486', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-05-22 12:23:13', '1', null, '', null, null, null, 'ZA', 'Middleburg', 'Mi', null, null, 'Inxuba Yethemba Municipality\r\nTechnical Services Department\r\nMidlleburg', null, null, '0', '1', '2014-04-10', '2014-04-10 09:13:35', '1', '2014-05-22 12:23:13', '1');
INSERT INTO `useraccount` VALUES ('49', '7', 'Lennox', 'Sobahle', null, 'lennox001', 'lennox@devmail.infomacorp.com', null, '0488015000', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-22 11:44:09', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo 1 JA Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-14', '2014-04-10 11:24:43', '1', '2014-04-22 11:44:09', '1');
INSERT INTO `useraccount` VALUES ('50', '7', 'Bafo', 'Sigenu', null, 'Bafo001', 'thanduxolo@devmail.infomacorp.com', null, '0488015045', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-10 16:27:07', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-10', '2014-04-10 15:37:35', '1', '2014-04-10 16:27:07', '1');
INSERT INTO `useraccount` VALUES ('51', '7', 'Lulamile ', 'Joyiyasi', null, 'lulamile001', 'lulamile@devmail.infomacorp.com', null, '0488015000', null, null, '', '1', null, '0', '2bf9c8', null, '0', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, '1', '0', '1', '2014-05-20', '2014-04-10 15:41:31', '1', '2014-05-20 19:05:29', '1');
INSERT INTO `useraccount` VALUES ('52', '7', 'Noluthando', 'Majiba', null, 'noluthando001', 'majiba@devmail.infomacorp.com', null, '0488015000', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-22 11:26:11', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-22', '2014-04-10 15:43:52', '1', '2014-04-22 11:26:11', '1');
INSERT INTO `useraccount` VALUES ('53', '6', 'Mzwandile', 'Tantsi', null, 'mzwandile001', 'mzwandile@devmail.infomacorp.com', null, '0488015000', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-15 14:46:04', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-14', '2014-04-10 15:48:40', '1', '2014-04-15 14:46:04', '1');
INSERT INTO `useraccount` VALUES ('54', '2', 'Khanyisile', 'Claasen', null, 'khanyi001', 'khanyiclaasen@devmail.infomacorp.com', null, '0488015000', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-10 16:08:17', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-10', '2014-04-10 16:00:18', '1', '2014-04-10 16:08:17', '1');
INSERT INTO `useraccount` VALUES ('55', '3', 'Francois', 'Joubert', null, 'francois001', 'francois.iym@devmail.infomacorp.com', null, '0498021380', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-11 09:47:38', '1', null, '', null, null, null, 'ZA', 'Middleburg', 'Mi', null, null, 'Inxuba Yethemba Municipality\r\nElectrical section\r\nVin Niekerk Street\r\nMiddleburg\r\n5900', null, null, '0', '1', '2014-04-11', '2014-04-11 08:56:40', '1', '2014-04-11 09:47:38', '1');
INSERT INTO `useraccount` VALUES ('56', '2', 'Portia', 'Nyembe', null, 'portia001', 'portia@devmail.infomacorp.com', null, '0488015084', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-11 10:55:09', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-11', '2014-04-11 10:23:33', '1', '2014-04-11 10:55:09', null);
INSERT INTO `useraccount` VALUES ('57', '3', 'Siyabulela', 'Salman', null, 'siyabulela001', 'siyabulela@devmail.infomacorp.com', null, '0488015094', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-11 11:06:25', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-11', '2014-04-11 10:26:56', '1', '2014-04-11 11:06:25', '1');
INSERT INTO `useraccount` VALUES ('58', '3', 'Lineo', 'Bebeza', null, 'lineo001', 'lineobebeza@devmail.infomacorp.com', null, '0488015000', null, null, '', '2', null, '0', '7117a4', null, '0', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, '1', '0', '1', '2014-05-20', '2014-04-11 10:38:09', '1', '2014-05-20 19:04:37', '1');
INSERT INTO `useraccount` VALUES ('59', '3', 'Nokuzola', 'James', null, 'nokuzola001', 'zola@devmail.infomacorp.com', null, '0488015089', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-14 12:07:10', '1', null, '1397470216.jpg', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-11', '2014-04-11 10:43:42', '1', '2014-04-14 12:10:16', null);
INSERT INTO `useraccount` VALUES ('61', '3', 'Frieda', 'De Jager', null, 'frieda001', 'frieda@devmail.infomacorp.com', null, '0488015117', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-05-15 10:13:10', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street \r\nCradock\r\n5880', null, '1', '0', '1', '2014-04-14', '2014-04-11 16:18:00', '1', '2014-05-15 10:13:10', '1');
INSERT INTO `useraccount` VALUES ('62', '2', 'Nondumiso', 'Klaas', null, 'nomdumiso001', 'nondumiso@devmail.infomacorp.com', null, '0488015019', null, null, '', '2', null, '0', 'c4ed88', null, '0', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street \r\nCradock\r\n5880', null, '1', '0', '70', '2014-05-14', '2014-04-11 16:28:11', '1', '2014-05-14 12:52:42', '70');
INSERT INTO `useraccount` VALUES ('63', '3', 'Renthia', 'Crouse', null, 'renwil123', 'renthia@devmail.infomacorp.com', null, '0835093924', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-24 12:00:46', '1', null, '1397541834.jpg', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street \r\nCradock\r\n5880', null, null, '0', '1', '2014-04-11', '2014-04-11 16:32:06', '1', '2014-04-24 12:00:46', null);
INSERT INTO `useraccount` VALUES ('64', '3', 'Ludwe', 'Hanana', null, 'ludwe001', 'ludwe@devmail.infomacorp.com', null, '0488015015', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-23 09:54:23', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street \r\nCradock\r\n5880', null, null, '0', '1', '2014-04-14', '2014-04-11 16:40:05', '1', '2014-04-23 09:54:23', '1');
INSERT INTO `useraccount` VALUES ('65', '3', 'Alda-Lea', 'Hufkie', null, 'alda001', 'alda@devmail.infomacorp.com', null, '0488015031', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-25 08:41:22', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street \r\nCradock\r\n5880', null, null, '0', '1', '2014-04-14', '2014-04-11 16:46:10', '1', '2014-04-25 08:41:22', '1');
INSERT INTO `useraccount` VALUES ('66', '6', 'Nyameka', 'Goniwe', null, 'nyameka001', 'nyameka@devmail.infomacorp.com', null, '0488015000', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-22 14:38:14', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street \r\nCradock\r\n5880', null, null, '0', '1', '2014-04-22', '2014-04-11 16:56:16', '1', '2014-04-22 14:38:14', '1');
INSERT INTO `useraccount` VALUES ('67', '2', 'Sonwabise', 'Panziso', null, 'sosh001', 'sosh@devmail.infomacorp.com', null, '0488015119', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-22 08:55:15', '1', null, '1398159533.jpg', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-22', '2014-04-22 08:50:32', '1', '2014-04-22 11:38:53', null);
INSERT INTO `useraccount` VALUES ('68', '2', 'Siviwe', 'Lemoen', null, 'siviwe001', 'slemoen1@devmail.infomacorp.com', null, '0783252997', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-24 11:43:40', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-24', '2014-04-24 10:33:04', '1', '2014-04-24 11:43:40', '1');
INSERT INTO `useraccount` VALUES ('69', '3', 'Lucille', 'Charmaine', null, 'lucille001', 'lucille@devmail.infomacorp.com', null, '0733770290', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '2', null, '1', '', '2014-04-26 09:26:11', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-24', '2014-04-24 10:44:16', '1', '2014-04-26 09:26:11', null);
INSERT INTO `useraccount` VALUES ('70', '1', 'Sonwabo', 'Luzipo', null, 'sonwabo001', 'sonwabo@devmail.infomacorp.com', null, '0732125608', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-04-29 08:32:58', '1', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNumber 1 Calata Street\r\nCradock\r\n5880', null, null, '0', '1', '2014-04-25', '2014-04-25 16:38:37', '1', '2014-04-29 08:32:58', null);
INSERT INTO `useraccount` VALUES ('71', '6', 'Lena', 'Davids', null, 'lena001', 'lena@devmail.infomacorp.com', null, '0743771704', null, null, '', '2', null, '0', '2861a3', null, '0', null, '', null, null, null, 'ZA', 'Cradock', 'Cr', null, null, 'Inxuba Yethemba Municipality\r\nNo. 1 Calata Street\r\nCradock\r\n5880', null, '1', '0', '1', '2014-05-20', '2014-04-29 17:41:55', '1', '2014-05-20 19:03:19', '1');
INSERT INTO `useraccount` VALUES ('72', '2', 'Thando', 'Sindelo', null, 'thando001', 'thando@devmail.infomacorp.com', null, '0835468723', null, null, '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '1', null, '1', '', '2014-05-14 13:08:05', '1', null, '', null, null, null, 'ZA', 'Cradock ', 'Cr', null, null, '24 Qhina Street\r\nLingelihle ', null, null, '0', '1', '2014-05-14', '2014-05-14 13:05:04', '1', '2014-05-14 13:15:06', '1');

-- ----------------------------
-- Table structure for `voucher`
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(11) unsigned DEFAULT NULL,
  `caseid` int(11) unsigned DEFAULT NULL,
  `clientid` int(11) unsigned DEFAULT NULL,
  `servicetypeid` int(11) unsigned DEFAULT NULL,
  `funderid` int(11) unsigned DEFAULT NULL,
  `voucherno` varchar(15) DEFAULT NULL,
  `dateissued` date DEFAULT NULL,
  `datereceived` date DEFAULT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `hours` decimal(10,2) unsigned DEFAULT NULL,
  `days` tinyint(4) unsigned DEFAULT NULL,
  `rate` decimal(10,2) unsigned DEFAULT NULL,
  `employmentgoal` varchar(1000) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher
-- ----------------------------
