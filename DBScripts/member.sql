/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : member

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-17 09:40:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_member
-- ----------------------------
DROP TABLE IF EXISTS `tm_member`;
CREATE TABLE `tm_member` (
  `member_id` bigint(20) NOT NULL COMMENT 'member id',
  `mobile` varchar(11) NOT NULL COMMENT 'username',
  `mobile_ticket` varchar(16) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL COMMENT 'member status, 0 init, 1 logined, 99 normal',
  `nick_name` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL COMMENT 'login password',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'last update time',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `uq_tm_u` (`mobile_ticket`) USING BTREE
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
