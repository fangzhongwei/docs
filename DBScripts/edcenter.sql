/*
Navicat PGSQL Data Transfer

Source Server         : jxjxgo-local
Source Server Version : 90601
Source Host           : localhost:5432
Source Database       : edcenter
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-02-17 02:36:05
*/


-- ----------------------------
-- Sequence structure for seq_ticket_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_ticket_id";
CREATE SEQUENCE "public"."seq_ticket_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."seq_ticket_id"', 1, true);

-- ----------------------------
-- Table structure for tm_encrypted_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_encrypted_data";
CREATE TABLE "public"."tm_encrypted_data" (
"ticket" varchar(16) COLLATE "default" NOT NULL,
"hash" varchar(64) COLLATE "default" NOT NULL,
"encrypt_type" varchar(8) COLLATE "default" NOT NULL,
"encrypt_key" varchar(512) COLLATE "default" NOT NULL,
"encrypt_data" varchar(1024) COLLATE "default" NOT NULL,
"encrypt_version" int4 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tm_encrypted_data
-- ----------------------------
ALTER TABLE "public"."tm_encrypted_data" ADD PRIMARY KEY ("ticket");
