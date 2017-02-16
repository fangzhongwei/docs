/*
Navicat PGSQL Data Transfer

Source Server         : jxjxgo-local
Source Server Version : 90601
Source Host           : localhost:5432
Source Database       : member
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-02-17 02:36:50
*/


-- ----------------------------
-- Sequence structure for seq_member_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_member_id";
CREATE SEQUENCE "public"."seq_member_id"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for tm_member
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_member";
CREATE TABLE "public"."tm_member" (
"member_id" int8 NOT NULL,
"mobile" varchar(11) COLLATE "default" NOT NULL,
"mobile_ticket" varchar(16) COLLATE "default" DEFAULT ''::character varying NOT NULL,
"status" int2 NOT NULL,
"nick_name" varchar(32) COLLATE "default" NOT NULL,
"password" varchar(128) COLLATE "default" NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Indexes structure for table tm_member
-- ----------------------------
CREATE UNIQUE INDEX "tm_member_mobile_ticket_idx" ON "public"."tm_member" USING btree ("mobile_ticket");

-- ----------------------------
-- Primary Key structure for table tm_member
-- ----------------------------
ALTER TABLE "public"."tm_member" ADD PRIMARY KEY ("member_id");
