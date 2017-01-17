/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : ddz

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-17 09:39:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_game
-- ----------------------------
DROP TABLE IF EXISTS `tm_game`;
CREATE TABLE `tm_game` (
  `id` bigint(20) NOT NULL,
  `game_type` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-playing,9-finished',
  `player1_id` bigint(20) NOT NULL DEFAULT '0',
  `player2_id` bigint(20) NOT NULL DEFAULT '0',
  `player3_id` bigint(20) NOT NULL DEFAULT '0',
  `player1_cards` varchar(60) NOT NULL DEFAULT '',
  `player2_cards` varchar(60) NOT NULL DEFAULT '',
  `player3_cards` varchar(60) NOT NULL DEFAULT '',
  `dz_cards` varchar(3) NOT NULL DEFAULT '',
  `dz_idx` tinyint(4) NOT NULL DEFAULT '1',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_play_cards
-- ----------------------------
DROP TABLE IF EXISTS `tm_play_cards`;
CREATE TABLE `tm_play_cards` (
  `id` bigint(20) NOT NULL,
  `game_id` bigint(20) NOT NULL,
  `seq_in_game` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `cards` varchar(13) NOT NULL DEFAULT '',
  `cards_type` tinyint(4) NOT NULL DEFAULT '0',
  `seq_in_round` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_room
-- ----------------------------
DROP TABLE IF EXISTS `tm_room`;
CREATE TABLE `tm_room` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `game_type` tinyint(4) NOT NULL DEFAULT '0',
  `base_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `min_table_id` bigint(11) NOT NULL DEFAULT '0',
  `max_table_id` bigint(11) NOT NULL DEFAULT '0',
  `seat_capacity` bigint(11) NOT NULL DEFAULT '0',
  `current_players` bigint(11) NOT NULL DEFAULT '0',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sta` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_room_config
-- ----------------------------
DROP TABLE IF EXISTS `tm_room_config`;
CREATE TABLE `tm_room_config` (
  `game_type` int(11) NOT NULL,
  `room_ranges` varchar(64) NOT NULL DEFAULT '',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`game_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_seat
-- ----------------------------
DROP TABLE IF EXISTS `tm_seat`;
CREATE TABLE `tm_seat` (
  `id` bigint(11) NOT NULL,
  `trace_id` varchar(64) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `member_id` bigint(20) NOT NULL DEFAULT '0',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sta` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tm_table
-- ----------------------------
DROP TABLE IF EXISTS `tm_table`;
CREATE TABLE `tm_table` (
  `id` bigint(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `room_capacity` bigint(11) NOT NULL DEFAULT '0',
  `min_seat_id` bigint(11) NOT NULL DEFAULT '0',
  `max_seat_id` bigint(11) NOT NULL DEFAULT '0',
  `current_players` tinyint(11) NOT NULL DEFAULT '0',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sta` (`status`)
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
