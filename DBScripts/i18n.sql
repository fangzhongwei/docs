/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : i18n

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-17 09:40:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_resource
-- ----------------------------
DROP TABLE IF EXISTS `tm_resource`;
CREATE TABLE `tm_resource` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `code` varchar(32) NOT NULL,
  `lan` varchar(8) NOT NULL,
  `desc` varchar(64) NOT NULL,
  `version` int(11) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ec` (`code`,`lan`,`version`),
  KEY `idx_v` (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_resource_config
-- ----------------------------
DROP TABLE IF EXISTS `tm_resource_config`;
CREATE TABLE `tm_resource_config` (
  `id` int(11) NOT NULL,
  `lan` varchar(16) NOT NULL,
  `latest_version` int(11) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lan` (`lan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
