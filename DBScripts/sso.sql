/*
Navicat PGSQL Data Transfer

Source Server         : jxjxgo-local
Source Server Version : 90601
Source Host           : localhost:5432
Source Database       : sso
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-02-17 02:37:28
*/


-- ----------------------------
-- Sequence structure for seq_session_id
-- ----------------------------
CREATE SEQUENCE "public"."seq_session_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for tm_session
-- ----------------------------
CREATE TABLE "public"."tm_session" (
"token" varchar(32) COLLATE "default" NOT NULL,
"client_id" int2 NOT NULL,
"version" varchar(16) COLLATE "default" NOT NULL,
"ip" int8 NOT NULL,
"device_type" int4 NOT NULL,
"finger_print" varchar(64) COLLATE "default" NOT NULL,
"status" int2 NOT NULL,
"member_id" int8 NOT NULL,
"identity" varchar(11) COLLATE "default" NOT NULL,
"identity_ticket" varchar(32) COLLATE "default" NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tm_session
-- ----------------------------
ALTER TABLE "public"."tm_session" ADD PRIMARY KEY ("token");
