/*
Navicat PGSQL Data Transfer

Source Server         : jxjxgo-local
Source Server Version : 90601
Source Host           : localhost:5432
Source Database       : i18n
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90601
File Encoding         : 65001

Date: 2017-02-17 02:36:34
*/


-- ----------------------------
-- Table structure for tm_resource
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_resource";
CREATE TABLE "public"."tm_resource" (
"id" int8 NOT NULL,
"type" int2 NOT NULL,
"code" varchar(32) COLLATE "default" NOT NULL,
"lan" varchar(8) COLLATE "default" NOT NULL,
"desc" varchar(64) COLLATE "default" NOT NULL,
"version" int4 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tm_resource_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."tm_resource_config";
CREATE TABLE "public"."tm_resource_config" (
"id" int4 NOT NULL,
"lan" varchar(16) COLLATE "default" NOT NULL,
"latest_version" int4 NOT NULL,
"gmt_create" timestamp(6) DEFAULT now() NOT NULL,
"gmt_update" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Indexes structure for table tm_resource
-- ----------------------------
CREATE UNIQUE INDEX "tm_resource_code_lan_version_idx" ON "public"."tm_resource" USING btree ("code", "lan", "version");

-- ----------------------------
-- Primary Key structure for table tm_resource
-- ----------------------------
ALTER TABLE "public"."tm_resource" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tm_resource_config
-- ----------------------------
CREATE UNIQUE INDEX "tm_resource_config_lan_idx" ON "public"."tm_resource_config" USING btree ("lan");

-- ----------------------------
-- Primary Key structure for table tm_resource_config
-- ----------------------------
ALTER TABLE "public"."tm_resource_config" ADD PRIMARY KEY ("id");
