/*
Navicat PGSQL Data Transfer

Source Server         : jxjxgo-local
Source Server Version : 90601
Source Host           : localhost:5432
Source Database       : account
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-02-17 02:35:13
*/


-- ----------------------------
-- Sequence structure for seq_account_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_account_id";
CREATE SEQUENCE "public"."seq_account_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for seq_order_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_order_id";
CREATE SEQUENCE "public"."seq_order_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for t_account_order
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_account_order";
CREATE TABLE "public"."t_account_order" (
"account_order_no" varchar(64) COLLATE "default" NOT NULL,
"payment_voucher_no" varchar(64) COLLATE "default" NOT NULL,
"account_id" int8 NOT NULL,
"device_type" int4 NOT NULL,
"member_id" int8 NOT NULL,
"trade_type" int4 NOT NULL,
"trade_status" int4 NOT NULL,
"diamond_amount" int4 NOT NULL,
"amount" numeric(10,2) NOT NULL,
"game_id" int8 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for t_payment_order
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_payment_order";
CREATE TABLE "public"."t_payment_order" (
"payment_voucher_no" varchar(64) COLLATE "default" NOT NULL,
"account_order_no" varchar(64) COLLATE "default" NOT NULL,
"device_type" int4 NOT NULL,
"member_id" int8 NOT NULL,
"account_id" int8 NOT NULL,
"channel_code" varchar(11) COLLATE "default" NOT NULL,
"amount" numeric(10,2) NOT NULL,
"pay_status" int4 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tm_channel
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_channel";
CREATE TABLE "public"."tm_channel" (
"id" int4 NOT NULL,
"code" varchar(32) COLLATE "default" NOT NULL,
"device_type" int4 NOT NULL,
"priority" int2 DEFAULT '0'::smallint NOT NULL,
"status" bit(1) NOT NULL,
"name" varchar(32) COLLATE "default" NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tm_diamod_price
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_diamod_price";
CREATE TABLE "public"."tm_diamod_price" (
"id" int4 NOT NULL,
"code" varchar(32) COLLATE "default" NOT NULL,
"device_type" int4 NOT NULL,
"status" bit(1) NOT NULL,
"amount" int4 NOT NULL,
"price" numeric(10,2) NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tm_diamond_account
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_diamond_account";
CREATE TABLE "public"."tm_diamond_account" (
"account_id" int8 NOT NULL,
"member_id" int8 NOT NULL,
"device_type" int4 NOT NULL,
"amount" int4 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_account_order
-- ----------------------------
ALTER TABLE "public"."t_account_order" ADD PRIMARY KEY ("account_order_no");

-- ----------------------------
-- Primary Key structure for table t_payment_order
-- ----------------------------
ALTER TABLE "public"."t_payment_order" ADD PRIMARY KEY ("payment_voucher_no");

-- ----------------------------
-- Primary Key structure for table tm_channel
-- ----------------------------
ALTER TABLE "public"."tm_channel" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tm_diamod_price
-- ----------------------------
ALTER TABLE "public"."tm_diamod_price" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tm_diamond_account
-- ----------------------------
ALTER TABLE "public"."tm_diamond_account" ADD PRIMARY KEY ("account_id");
