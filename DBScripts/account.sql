/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : account

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-17 09:25:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_channel
-- ----------------------------
DROP TABLE IF EXISTS `tm_channel`;
CREATE TABLE `tm_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL,
  `name` varchar(32) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_diamod_price
-- ----------------------------
DROP TABLE IF EXISTS `tm_diamod_price`;
CREATE TABLE `tm_diamod_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `status` bit(1) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_diamond_account
-- ----------------------------
DROP TABLE IF EXISTS `tm_diamond_account`;
CREATE TABLE `tm_diamond_account` (
  `account_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL COMMENT 'member id',
  `amount` int(11) NOT NULL COMMENT 'remaining amount',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_account_order
-- ----------------------------
DROP TABLE IF EXISTS `t_account_order`;
CREATE TABLE `t_account_order` (
  `account_order_no` varchar(64) NOT NULL,
  `payment_voucher_no` varchar(64) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `trade_type` int(11) NOT NULL,
  `trade_status` int(11) NOT NULL,
  `diamond_amount` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `game_id` bigint(20) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_order_no`),
  KEY `idx_pn` (`payment_voucher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_payment_order
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_order`;
CREATE TABLE `t_payment_order` (
  `payment_voucher_no` varchar(64) NOT NULL,
  `account_order_no` varchar(64) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `channel_code` varchar(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `pay_status` int(11) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_voucher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sequence
-- ----------------------------
DROP TABLE IF EXISTS `t_sequence`;
CREATE TABLE `t_sequence` (
  `name` varchar(64) NOT NULL,
  `current_value` bigint(20) NOT NULL,
  `increment` int(11) NOT NULL DEFAULT '1',
  UNIQUE KEY `uq_ts_n` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='sequence table';

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `currval`(seq_name VARCHAR(64)) RETURNS bigint(20)
    READS SQL DATA
    DETERMINISTIC
BEGIN

DECLARE VALUE BIGINT;

SET VALUE = 0;

SELECT current_value INTO VALUE FROM t_sequence WHERE NAME = seq_name;

RETURN VALUE;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextval`(seq_name VARCHAR(64)) RETURNS bigint(20)
    DETERMINISTIC
BEGIN

UPDATE t_sequence SET current_value = current_value + increment WHERE NAME = seq_name;

RETURN currval(seq_name);

END
;;
DELIMITER ;
