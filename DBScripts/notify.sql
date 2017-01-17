/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : notify

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-17 09:40:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_sms_verify_aggregation
-- ----------------------------
DROP TABLE IF EXISTS `tm_sms_verify_aggregation`;
CREATE TABLE `tm_sms_verify_aggregation` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `send_date` varchar(10) COLLATE utf8_bin NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `sms_type` int(11) NOT NULL,
  `total_count` int(11) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_dmt` (`send_date`,`member_id`,`sms_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for tm_sms_verify_record
-- ----------------------------
DROP TABLE IF EXISTS `tm_sms_verify_record`;
CREATE TABLE `tm_sms_verify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL,
  `sms_type` int(11) NOT NULL,
  `content` varchar(140) COLLATE utf8_bin NOT NULL,
  `verify_code` varchar(8) COLLATE utf8_bin NOT NULL,
  `channel` int(11) NOT NULL,
  `trace_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `ip` bigint(20) NOT NULL,
  `device_type` tinyint(4) NOT NULL,
  `finger_print` varchar(64) COLLATE utf8_bin NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 待验证, 1重发失效，2尝试3次失效，3过期 ， 99验证成功',
  `verify_times` tinyint(4) NOT NULL,
  `max_try_times` tinyint(4) NOT NULL,
  `expire_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `resend` bit(1) NOT NULL DEFAULT b'0',
  `last_channel` int(4) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ms` (`member_id`,`sms_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for tm_sms_verify_template
-- ----------------------------
DROP TABLE IF EXISTS `tm_sms_verify_template`;
CREATE TABLE `tm_sms_verify_template` (
  `sms_type` int(11) NOT NULL,
  `min_interval_seconds` int(11) NOT NULL,
  `content_template` varchar(140) COLLATE utf8_bin NOT NULL,
  `day_limit` int(11) NOT NULL,
  `channel` int(11) NOT NULL,
  `expire_minutes` tinyint(4) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sms_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
