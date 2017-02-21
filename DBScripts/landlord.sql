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

Date: 2017-02-17 02:37:46
*/


-- ----------------------------
-- Sequence structure for seq_game_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_game_id";
CREATE SEQUENCE "public"."seq_game_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

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
 START 1
 CACHE 1;

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
"player1_cards" varchar(81) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"player2_cards" varchar(81) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"player3_cards" varchar(81) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"dz_cards" varchar(13) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"landlord_idx" int4 NOT NULL,
"winner_idx" int4 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

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
-- Table structure for tm_play_cards
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_play_cards";
CREATE TABLE "public"."tm_play_cards" (
"id" int8 NOT NULL,
"game_id" int8 NOT NULL,
"seq_in_game" int2 DEFAULT (0)::smallint NOT NULL,
"type" int2 DEFAULT (0)::smallint NOT NULL,
"cards" varchar(13) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"cards_type" int2 DEFAULT (0)::smallint NOT NULL,
"seq_in_round" int2 DEFAULT (0)::smallint NOT NULL
)
WITH (OIDS=FALSE)

;

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
-- Table structure for tm_room_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_room_config";
CREATE TABLE "public"."tm_room_config" (
"game_type" int4 NOT NULL,
"device_type" int4 NOT NULL,
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
-- Table structure for tm_seat
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_seat";
CREATE TABLE "public"."tm_seat" (
"id" int8 NOT NULL,
"trace_id" varchar(32) COLLATE "default" NOT NULL,
"status" int2 DEFAULT (0)::smallint NOT NULL,
"member_id" int8 DEFAULT (0)::bigint NOT NULL,
"cards" varchar(81) COLLATE "default" NOT NULL,
"landlord_cards" varchar(13) COLLATE "default" NOT NULL,
"finger_print" varchar(64) COLLATE "default" NOT NULL,
"game_id" int8 NOT NULL,
"game_type" int4 NOT NULL,
"device_type" int4 NOT NULL,
"multiples" int4 NOT NULL,
"base_amount" int4 NOT NULL,
"previous_nickname" varchar(64) COLLATE "default" NOT NULL,
"previous_cards_count" int2 NOT NULL,
"next_nickname" varchar(64) COLLATE "default" NOT NULL,
"next_cards_count" int2 NOT NULL,
"choosing_landlord" bool DEFAULT false NOT NULL,
"landlord" bool DEFAULT false NOT NULL,
"turn_to_play" bool DEFAULT false NOT NULL,
"socket_id" int8 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

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
-- Primary Key structure for table tm_play_cards
-- ----------------------------
ALTER TABLE "public"."tm_play_cards" ADD PRIMARY KEY ("id");

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
