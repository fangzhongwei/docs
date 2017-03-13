/*
Navicat PGSQL Data Transfer

Source Server         : jxjxgo-local
Source Server Version : 90601
Source Host           : localhost:5432
Source Database       : towvsone
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-03-14 02:50:34
*/


-- ----------------------------
-- Sequence structure for seq_game_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_game_id";
CREATE SEQUENCE "public"."seq_game_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 83
 CACHE 1;
SELECT setval('"public"."seq_game_id"', 83, true);

-- ----------------------------
-- Sequence structure for seq_play_cards_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_play_cards_id";
CREATE SEQUENCE "public"."seq_play_cards_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for seq_socket_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_socket_id";
CREATE SEQUENCE "public"."seq_socket_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 147
 CACHE 1;
SELECT setval('"public"."seq_socket_id"', 147, true);

-- ----------------------------
-- Sequence structure for tm_play_cards_record_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tm_play_cards_record_id_seq";
CREATE SEQUENCE "public"."tm_play_cards_record_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 119
 CACHE 1;
SELECT setval('"public"."tm_play_cards_record_id_seq"', 119, true);

-- ----------------------------
-- Table structure for tm_game
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_game";
CREATE TABLE "public"."tm_game" (
"id" int8 NOT NULL,
"game_type" int4 DEFAULT 0 NOT NULL,
"device_type" int4 NOT NULL,
"base_amount" int4 NOT NULL,
"multiples" int4 NOT NULL,
"status" int2 DEFAULT (1)::smallint NOT NULL,
"player1_id" int8 DEFAULT (0)::bigint NOT NULL,
"player2_id" int8 DEFAULT (0)::bigint NOT NULL,
"player3_id" int8 DEFAULT (0)::bigint NOT NULL,
"seat1_id" int8 DEFAULT 0 NOT NULL,
"seat2_id" int8 DEFAULT 0 NOT NULL,
"seat3_id" int8 DEFAULT 0 NOT NULL,
"seq_in_game" int4 DEFAULT 0 NOT NULL,
"active_player_id" int8 DEFAULT 0 NOT NULL,
"player1_cards" varchar(128) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"player2_cards" varchar(128) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"player3_cards" varchar(128) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"outside_cards" varchar(128) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"landlord_id" int8 NOT NULL,
"winner_id" int8 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_game
-- ----------------------------

-- ----------------------------
-- Table structure for tm_online_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_online_record";
CREATE TABLE "public"."tm_online_record" (
"socket_id" int8 NOT NULL,
"device_type" int4 NOT NULL,
"finger_print" varchar(64) COLLATE "default" NOT NULL,
"member_id" int8 NOT NULL,
"ip" int8 NOT NULL,
"rpc_host" varchar(32) COLLATE "default" NOT NULL,
"gmt_online" timestamp(6) DEFAULT now() NOT NULL,
"gmt_offline" timestamp(6),
"online" bool NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_online_record
-- ----------------------------

-- ----------------------------
-- Table structure for tm_play_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_play_record";
CREATE TABLE "public"."tm_play_record" (
"id" int8 DEFAULT nextval('tm_play_cards_record_id_seq'::regclass) NOT NULL,
"play_type" int2 NOT NULL,
"game_id" int8 NOT NULL,
"member_id" int8 NOT NULL,
"seq_in_game" int2 NOT NULL,
"cards_type" varchar(32) COLLATE "default" NOT NULL,
"keys" varchar(64) COLLATE "default" NOT NULL,
"hand_points" varchar(128) COLLATE "default" NOT NULL,
"play_points" varchar(128) COLLATE "default" NOT NULL,
"cards_type_for_next" varchar(32) COLLATE "default" NOT NULL,
"keys_for_next" varchar(64) COLLATE "default" NOT NULL,
"gmt_create" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_play_record
-- ----------------------------

-- ----------------------------
-- Table structure for tm_room
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_room";
CREATE TABLE "public"."tm_room" (
"id" int8 NOT NULL,
"name" varchar(64) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"status" int2 DEFAULT (1)::smallint NOT NULL,
"min_table_id" int8 DEFAULT (0)::bigint NOT NULL,
"max_table_id" int8 DEFAULT (0)::bigint NOT NULL,
"seat_capacity" int8 DEFAULT (0)::bigint NOT NULL,
"current_players" int8 DEFAULT (0)::bigint NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_room
-- ----------------------------
INSERT INTO "public"."tm_room" VALUES ('1', '1', '1', '1', '100', '300', '0', '2017-03-02 15:22:20', '2017-03-02 15:22:24');

-- ----------------------------
-- Table structure for tm_room_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_room_config";
CREATE TABLE "public"."tm_room_config" (
"game_type" int4 NOT NULL,
"device_type" int4 NOT NULL,
"base_amount" int4 NOT NULL,
"min_diamond_amount" int4 NOT NULL,
"max_diamond_amount" int4 NOT NULL,
"room_ranges" varchar(64) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL,
"topic" varchar(128) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_room_config
-- ----------------------------
INSERT INTO "public"."tm_room_config" VALUES ('10', '3', '10', '100', '2000', '1-10', '2017-03-02 15:20:18', '2017-03-02 15:20:20', 'game.join.T1010');

-- ----------------------------
-- Table structure for tm_seat
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_seat";
CREATE TABLE "public"."tm_seat" (
"id" int8 NOT NULL,
"status" int2 DEFAULT (0)::smallint NOT NULL,
"member_id" int8 DEFAULT (0)::bigint NOT NULL,
"cards" varchar(128) COLLATE "default" NOT NULL,
"landlord_cards" varchar(128) COLLATE "default" NOT NULL,
"pro_cards_info" varchar(128) COLLATE "default" NOT NULL,
"finger_print" varchar(64) COLLATE "default" NOT NULL,
"game_id" int8 NOT NULL,
"game_type" int4 NOT NULL,
"device_type" int4 NOT NULL,
"multiples" int4 DEFAULT 1 NOT NULL,
"base_amount" int4 NOT NULL,
"landlord_position" varchar(1) COLLATE "default" NOT NULL,
"previous_nickname" varchar(64) COLLATE "default" NOT NULL,
"previous_cards_count" int2 NOT NULL,
"next_nickname" varchar(64) COLLATE "default" NOT NULL,
"next_cards_count" int2 NOT NULL,
"play_status" varchar(32) COLLATE "default" NOT NULL,
"seq_in_game" int2 NOT NULL,
"landlord" bool DEFAULT false NOT NULL,
"socket_id" int8 NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_seat
-- ----------------------------
INSERT INTO "public"."tm_seat" VALUES ('1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');
INSERT INTO "public"."tm_seat" VALUES ('2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');
INSERT INTO "public"."tm_seat" VALUES ('3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');
INSERT INTO "public"."tm_seat" VALUES ('4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');
INSERT INTO "public"."tm_seat" VALUES ('5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');
INSERT INTO "public"."tm_seat" VALUES ('6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');
INSERT INTO "public"."tm_seat" VALUES ('7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');
INSERT INTO "public"."tm_seat" VALUES ('8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');
INSERT INTO "public"."tm_seat" VALUES ('9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'f', '0', '2017-03-12 12:56:35');

-- ----------------------------
-- Table structure for tm_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_table";
CREATE TABLE "public"."tm_table" (
"id" int8 NOT NULL,
"name" varchar(64) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"status" int2 DEFAULT (0)::smallint NOT NULL,
"seat_capacity" int4 DEFAULT (0)::bigint NOT NULL,
"min_seat_id" int8 DEFAULT (0)::bigint NOT NULL,
"max_seat_id" int8 DEFAULT (0)::bigint NOT NULL,
"current_players" int4 DEFAULT (0)::smallint NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_table
-- ----------------------------
INSERT INTO "public"."tm_table" VALUES ('1', '1', '0', '3', '1', '3', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('2', '2', '0', '3', '4', '6', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('3', '3', '0', '3', '7', '9', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('4', '4', '0', '3', '10', '12', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('5', '5', '0', '3', '13', '15', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('6', '6', '0', '3', '16', '18', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('7', '7', '0', '3', '19', '21', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('8', '8', '0', '3', '22', '24', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('9', '9', '0', '3', '25', '27', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');
INSERT INTO "public"."tm_table" VALUES ('10', '10', '0', '3', '28', '30', '0', '2017-03-02 15:33:27.24479', '2017-03-02 15:33:27.24479');

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tm_game
-- ----------------------------
ALTER TABLE "public"."tm_game" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tm_online_record
-- ----------------------------
ALTER TABLE "public"."tm_online_record" ADD PRIMARY KEY ("socket_id");

-- ----------------------------
-- Primary Key structure for table tm_play_record
-- ----------------------------
ALTER TABLE "public"."tm_play_record" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tm_room
-- ----------------------------
ALTER TABLE "public"."tm_room" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tm_room_config
-- ----------------------------
ALTER TABLE "public"."tm_room_config" ADD PRIMARY KEY ("game_type", "device_type");

-- ----------------------------
-- Primary Key structure for table tm_seat
-- ----------------------------
ALTER TABLE "public"."tm_seat" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tm_table
-- ----------------------------
ALTER TABLE "public"."tm_table" ADD PRIMARY KEY ("id");
