/*
Navicat PGSQL Data Transfer

Source Server         : jxjxgo-local
Source Server Version : 90601
Source Host           : localhost:5432
Source Database       : sms
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-02-17 02:37:14
*/


-- ----------------------------
-- Table structure for tm_sms_verify_aggregation
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_sms_verify_aggregation";
CREATE TABLE "public"."tm_sms_verify_aggregation" (
"id" int8 NOT NULL,
"send_date" varchar(10) COLLATE "default" NOT NULL,
"member_id" int8 NOT NULL,
"sms_type" int4 NOT NULL,
"total_count" int4 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_sms_verify_aggregation
-- ----------------------------

-- ----------------------------
-- Table structure for tm_sms_verify_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_sms_verify_record";
CREATE TABLE "public"."tm_sms_verify_record" (
"id" int8 NOT NULL,
"member_id" int8 NOT NULL,
"sms_type" int4 NOT NULL,
"content" varchar(140) COLLATE "default" NOT NULL,
"verify_code" varchar(8) COLLATE "default" NOT NULL,
"channel" int4 NOT NULL,
"ext_id" varchar(64) COLLATE "default" NOT NULL,
"trace_id" varchar(32) COLLATE "default" NOT NULL,
"ip" int8 NOT NULL,
"device_type" int2 NOT NULL,
"finger_print" varchar(64) COLLATE "default" NOT NULL,
"status" int2 DEFAULT '0'::smallint NOT NULL,
"verify_times" int2 NOT NULL,
"max_try_times" int2 NOT NULL,
"expire_time" timestamp(6) NOT NULL,
"resend" bool DEFAULT false NOT NULL,
"last_channel" int4 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_sms_verify_record
-- ----------------------------

-- ----------------------------
-- Table structure for tm_sms_verify_template
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_sms_verify_template";
CREATE TABLE "public"."tm_sms_verify_template" (
"sms_type" int4 NOT NULL,
"min_interval_seconds" int4 NOT NULL,
"content_template" varchar(140) COLLATE "default" NOT NULL,
"day_limit" int4 NOT NULL,
"channel" int4 NOT NULL,
"expire_minutes" int2 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tm_sms_verify_template
-- ----------------------------
INSERT INTO "public"."tm_sms_verify_template" VALUES ('1', '60', '%s（登录验证码，10分钟有效） ，您正在手机上登录久新棋牌，若非本人操作请勿理会。', '3', '1', '10', '2017-01-19 15:44:11', '2017-01-19 15:54:57');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Indexes structure for table tm_sms_verify_aggregation
-- ----------------------------
CREATE UNIQUE INDEX "tm_sms_verify_aggregation_send_date_member_id_sms_type_idx" ON "public"."tm_sms_verify_aggregation" USING btree ("send_date", "member_id", "sms_type");

-- ----------------------------
-- Primary Key structure for table tm_sms_verify_aggregation
-- ----------------------------
ALTER TABLE "public"."tm_sms_verify_aggregation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tm_sms_verify_record
-- ----------------------------
CREATE INDEX "tm_sms_verify_record_member_id_sms_type_idx" ON "public"."tm_sms_verify_record" USING btree ("member_id", "sms_type");

-- ----------------------------
-- Primary Key structure for table tm_sms_verify_record
-- ----------------------------
ALTER TABLE "public"."tm_sms_verify_record" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tm_sms_verify_template
-- ----------------------------
ALTER TABLE "public"."tm_sms_verify_template" ADD PRIMARY KEY ("sms_type");
