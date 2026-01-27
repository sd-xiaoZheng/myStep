/*
 Navicat Premium Dump SQL

 Source Server         : mystep
 Source Server Type    : PostgreSQL
 Source Server Version : 170006 (170006)
 Source Host           : 127.0.0.1:5432
 Source Catalog        : mystep
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170006 (170006)
 File Encoding         : 65001

 Date: 26/11/2025 16:04:10
*/


-- ----------------------------
-- Sequence structure for access_record_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."access_record_id_seq";
CREATE SEQUENCE "public"."access_record_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for account_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."account_id_seq";
CREATE SEQUENCE "public"."account_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for comment_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."comment_id_seq";
CREATE SEQUENCE "public"."comment_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for fun_question_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."fun_question_id_seq";
CREATE SEQUENCE "public"."fun_question_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for mood_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."mood_id_seq";
CREATE SEQUENCE "public"."mood_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for msg_wall_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."msg_wall_id_seq";
CREATE SEQUENCE "public"."msg_wall_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for order_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_id_seq";
CREATE SEQUENCE "public"."order_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permission_permission_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permission_permission_id_seq";
CREATE SEQUENCE "public"."permission_permission_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for photo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."photo_id_seq";
CREATE SEQUENCE "public"."photo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for photo_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."photo_type_id_seq";
CREATE SEQUENCE "public"."photo_type_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_role_id_seq";
CREATE SEQUENCE "public"."role_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for storage_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."storage_id_seq";
CREATE SEQUENCE "public"."storage_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tag_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tag_id_seq";
CREATE SEQUENCE "public"."tag_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for todo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."todo_id_seq";
CREATE SEQUENCE "public"."todo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."type_id_seq";
CREATE SEQUENCE "public"."type_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for undo_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."undo_log_id_seq";
CREATE SEQUENCE "public"."undo_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_user_id_seq";
CREATE SEQUENCE "public"."user_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for visit_num_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."visit_num_id_seq";
CREATE SEQUENCE "public"."visit_num_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for weather_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."weather_id_seq";
CREATE SEQUENCE "public"."weather_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for access_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."access_record";
CREATE TABLE "public"."access_record" (
  "id" int8 NOT NULL DEFAULT nextval('access_record_id_seq'::regclass),
  "host" varchar(100) COLLATE "pg_catalog"."default",
  "port" int4,
  "url" varchar(100) COLLATE "pg_catalog"."default",
  "url_param" varchar(255) COLLATE "pg_catalog"."default",
  "time" int8,
  "path" varchar(100) COLLATE "pg_catalog"."default",
  "ip_addr" varchar(255) COLLATE "pg_catalog"."default",
  "cyber_carrier" varchar(50) COLLATE "pg_catalog"."default",
  "access_date" timestamp(6)
)
;
COMMENT ON COLUMN "public"."access_record"."host" IS '主机ip';
COMMENT ON COLUMN "public"."access_record"."port" IS '端口';
COMMENT ON COLUMN "public"."access_record"."url" IS 'url\nurl';
COMMENT ON COLUMN "public"."access_record"."url_param" IS 'url后面的参数';
COMMENT ON COLUMN "public"."access_record"."time" IS '访问用时 ms';
COMMENT ON COLUMN "public"."access_record"."path" IS '访问路径';
COMMENT ON COLUMN "public"."access_record"."ip_addr" IS 'ip地址';
COMMENT ON COLUMN "public"."access_record"."cyber_carrier" IS '网络运营商';
COMMENT ON COLUMN "public"."access_record"."access_date" IS '访问时间';
COMMENT ON TABLE "public"."access_record" IS '访问记录表';

-- ----------------------------
-- Records of access_record
-- ----------------------------
INSERT INTO "public"."access_record" VALUES (33, 'localhost', 18888, NULL, 'pages=2', 4615, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (34, 'localhost', 18888, NULL, NULL, 60, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (35, 'localhost', 18888, NULL, NULL, 66, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (36, 'localhost', 18888, NULL, NULL, 153, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (37, 'localhost', 18888, NULL, 'pages=2', 4291, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (38, 'localhost', 18888, NULL, NULL, 50, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (39, 'localhost', 18888, NULL, 'pages=1', 2143, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (40, 'localhost', 18888, NULL, 'pages=', 7, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (41, 'localhost', 18888, NULL, NULL, 280, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (42, 'localhost', 18888, NULL, 'pages=', 52, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (43, 'localhost', 18888, NULL, NULL, 49, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (44, 'localhost', 18888, NULL, 'pages=2', 5526, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (45, 'localhost', 18888, NULL, NULL, 40, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (46, 'localhost', 18888, NULL, NULL, 282, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (47, 'localhost', 18888, NULL, NULL, 717, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (48, 'localhost', 18888, NULL, NULL, 290, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (49, 'localhost', 18888, NULL, NULL, 273, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (50, 'localhost', 18888, NULL, NULL, 281, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (51, 'localhost', 18888, NULL, NULL, 282, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (52, 'localhost', 18888, NULL, NULL, 267, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (53, 'localhost', 18888, NULL, NULL, 338, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (54, 'localhost', 18888, NULL, NULL, 251, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (55, 'localhost', 18888, NULL, NULL, 266, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (56, 'localhost', 18888, NULL, NULL, 60, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (57, 'localhost', 18888, NULL, NULL, 541, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (58, 'localhost', 18888, NULL, NULL, 265, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (59, 'localhost', 18888, NULL, NULL, 62, NULL, '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428915163137, 'localhost', 18888, NULL, 'pages=10', 23605, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428915163138, 'localhost', 18888, NULL, NULL, 39, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428915163139, 'localhost', 18888, NULL, NULL, 37, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746050, 'localhost', 18888, NULL, NULL, 37, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746051, 'localhost', 18888, NULL, NULL, 37, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746052, 'localhost', 18888, NULL, NULL, 33, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746053, 'localhost', 18888, NULL, NULL, 35, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746054, 'localhost', 18888, NULL, NULL, 157, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746055, 'localhost', 18888, NULL, NULL, 143, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746056, 'localhost', 18888, NULL, NULL, 43, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746057, 'localhost', 18888, NULL, 'pages=5', 11045, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746058, 'localhost', 18888, NULL, 'pages=3', 7093, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746059, 'localhost', 18888, NULL, NULL, 111, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746060, 'localhost', 18888, NULL, 'pages=3', 7148, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860319428927746061, 'localhost', 18888, NULL, 'pages=2', 5142, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860322410721394689, 'localhost', 18888, NULL, NULL, 164, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1860356383216451586, 'localhost', 18888, NULL, 'pages=10', 20596, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864297352831905793, 'localhost', 18888, NULL, NULL, 298, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864301127747440641, 'localhost', 18888, NULL, NULL, 5, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864301127747440642, 'localhost', 18888, NULL, NULL, 10, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864308677658218497, 'localhost', 18888, NULL, NULL, 206, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864308677658218498, 'localhost', 18888, NULL, NULL, 8, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864308677658218499, 'localhost', 18888, NULL, NULL, 8, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864308677658218500, 'localhost', 18888, NULL, NULL, 8, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864308677658218501, 'localhost', 18888, NULL, NULL, 185, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864312451374190594, 'localhost', 18888, NULL, NULL, 8, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864312451374190595, 'localhost', 18888, NULL, NULL, 9, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1864312451374190596, 'localhost', 18888, NULL, NULL, 27, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1865014580015472641, 'localhost', 18888, NULL, 'pages=1', 10, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1865014580015472642, 'localhost', 18888, NULL, 'pages=1', 7, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1865014580015472643, 'localhost', 18888, NULL, 'pages=1', 357, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1866097967719383041, 'localhost', 18888, NULL, 'pages=1', 612, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO "public"."access_record" VALUES (1873251353472466946, 'localhost', 18888, NULL, 'pages=5', 14, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873251353480855554, 'localhost', 18888, NULL, 'pages=5', 6, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873251353480855555, 'localhost', 18888, NULL, 'pages=5', 451, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873349505315721218, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873349505315721219, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873349505315721220, 'localhost', 18888, NULL, NULL, 5, '/step/Login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873349505315721221, 'localhost', 18888, NULL, NULL, 5, '/step/Login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873349505332498434, 'localhost', 18888, NULL, NULL, 744, '/step/Login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689346, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689347, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689348, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689349, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689350, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689351, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689352, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689353, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689354, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689355, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689356, 'localhost', 18888, NULL, NULL, 101, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689357, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689358, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689359, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689360, 'localhost', 18888, NULL, NULL, 105, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689361, 'localhost', 18888, NULL, NULL, 15, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689362, 'localhost', 18888, NULL, NULL, 240, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689363, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689364, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689365, 'localhost', 18888, NULL, NULL, 156, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873357055813689366, 'localhost', 18888, NULL, NULL, 12, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826295877633, 'localhost', 18888, NULL, NULL, 118, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929538, 'localhost', 18888, NULL, NULL, 145, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929539, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929540, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929541, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929542, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929543, 'localhost', 18888, NULL, NULL, 106, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929544, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929545, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873360826404929546, 'localhost', 18888, NULL, NULL, 11, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873364599860846593, 'localhost', 18888, NULL, NULL, 6, '/step/User/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873364599860846594, 'localhost', 18888, NULL, NULL, 5, '/step/User/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873364599860846595, 'localhost', 18888, NULL, NULL, 158, '/step/User/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873364599860846596, 'localhost', 18888, NULL, 'pages=1', 545, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873364599873429506, 'localhost', 18888, NULL, NULL, 206, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873364599873429507, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873368374570889217, 'localhost', 18888, NULL, 'pages=1', 8, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873368374629609473, 'localhost', 18888, NULL, 'pages=1', 416, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873368374629609474, 'localhost', 18888, NULL, NULL, 5, '/step/WebBug/killMysql', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873368374629609475, 'localhost', 18888, NULL, 'pages=1', 5, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873368374629609476, 'localhost', 18888, NULL, 'pages=1', 107, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695681, '127.0.0.1', 18888, NULL, NULL, 2834, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695682, 'localhost', 18888, NULL, NULL, 239, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695683, 'localhost', 18888, NULL, 'pages=1', 16, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695684, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695685, 'localhost', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695686, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695687, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695688, 'localhost', 18888, NULL, NULL, 110, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695689, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695690, 'localhost', 18888, NULL, NULL, 112, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695691, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695692, 'localhost', 18888, NULL, NULL, 113, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695693, 'localhost', 18888, NULL, NULL, 11, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695694, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695695, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695696, 'localhost', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873372153722695697, 'localhost', 18888, NULL, NULL, 213, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772490235905, '127.0.0.1', 18888, NULL, NULL, 14, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453634, '127.0.0.1', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453635, '127.0.0.1', 18888, NULL, NULL, 16, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453636, '127.0.0.1', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453637, '127.0.0.1', 18888, NULL, NULL, 246, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453638, '127.0.0.1', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453639, '127.0.0.1', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453640, '127.0.0.1', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453641, '127.0.0.1', 18888, NULL, NULL, 956, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453642, '127.0.0.1', 18888, NULL, NULL, 2834, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453643, 'localhost', 18888, NULL, NULL, 239, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453644, 'localhost', 18888, NULL, 'pages=1', 16, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453645, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453646, 'localhost', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453647, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453648, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453649, 'localhost', 18888, NULL, NULL, 110, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453650, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453651, 'localhost', 18888, NULL, NULL, 112, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453652, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453653, 'localhost', 18888, NULL, NULL, 113, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453654, 'localhost', 18888, NULL, NULL, 11, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453655, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453656, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453657, 'localhost', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873730772624453658, 'localhost', 18888, NULL, NULL, 213, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873742086683983874, '127.0.0.1', 18888, NULL, NULL, 33, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873745861922484226, '127.0.0.1', 18888, NULL, NULL, 401, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873745861981204481, '127.0.0.1', 18888, NULL, NULL, 26, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873745861981204482, '127.0.0.1', 18888, NULL, NULL, 133, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873745861989593090, '127.0.0.1', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873745861989593091, '127.0.0.1', 18888, NULL, NULL, 168, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873749636858998785, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873749636858998786, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873749636858998787, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873749636858998788, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873749636858998789, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873749636858998790, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873749636858998791, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873749636858998792, 'localhost', 18888, NULL, NULL, 131, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625409, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625410, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625411, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625412, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625413, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625414, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625415, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625416, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625417, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873753412596625418, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191274471425, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191274471426, 'localhost', 18888, NULL, NULL, 30, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191274471427, '127.0.0.1', 18888, NULL, NULL, 402, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191274471428, '127.0.0.1', 18888, NULL, NULL, 16, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191291248642, '127.0.0.1', 18888, NULL, NULL, 304, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191291248643, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191291248644, 'localhost', 18888, NULL, NULL, 126, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191291248645, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191291248646, 'localhost', 18888, NULL, NULL, 139, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191291248647, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191291248648, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191299637250, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191299637251, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191299637252, 'localhost', 18888, NULL, NULL, 143, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191299637253, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191299637254, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191299637255, 'localhost', 18888, NULL, NULL, 15, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191308025858, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191308025859, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191308025860, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1873757191312220161, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041643225090, '127.0.0.1', 18888, NULL, NULL, 402, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041655808002, '127.0.0.1', 18888, NULL, NULL, 16, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041655808003, '127.0.0.1', 18888, NULL, NULL, 304, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041655808004, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041664196610, 'localhost', 18888, NULL, NULL, 126, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041664196611, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390914, 'localhost', 18888, NULL, NULL, 139, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390915, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390916, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390917, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390918, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390919, 'localhost', 18888, NULL, NULL, 143, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390920, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390921, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390922, 'localhost', 18888, NULL, NULL, 15, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390923, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390924, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390925, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879008041668390926, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879053332685729794, 'localhost', 18888, NULL, NULL, 12, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879053332694118401, 'localhost', 18888, NULL, NULL, 810, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879057107014070273, 'localhost', 18888, NULL, 'pages=3', 25, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879057107014070274, 'localhost', 18888, NULL, NULL, 49, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879177905238372353, 'localhost', 18888, NULL, NULL, 752, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879177905238372354, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879177905238372355, 'localhost', 18888, NULL, NULL, 193, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879177905250955265, 'localhost', 18888, NULL, NULL, 19, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879181679235362817, 'localhost', 18888, NULL, NULL, 134, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879181679243751426, 'localhost', 18888, NULL, NULL, 156, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879181679243751427, '127.0.0.1', 18888, NULL, NULL, 265, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879181679243751428, 'localhost', 18888, NULL, NULL, 141, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879181679243751429, 'localhost', 18888, NULL, NULL, 196, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879181679243751430, 'localhost', 18888, NULL, NULL, 173, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259074, 'localhost', 18888, NULL, 'pages=3', 6, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259075, 'localhost', 18888, NULL, 'pages=3', 4, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259076, 'localhost', 18888, NULL, '3', 7, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259077, 'localhost', 18888, NULL, NULL, 14, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259078, 'localhost', 18888, NULL, NULL, 139, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259079, 'localhost', 18888, NULL, NULL, 186, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259080, 'localhost', 18888, NULL, NULL, 124, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259081, 'localhost', 18888, NULL, NULL, 116, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259082, 'localhost', 18888, NULL, NULL, 144, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879185455216259083, 'localhost', 18888, NULL, NULL, 175, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189232988123137, 'localhost', 18888, NULL, 'pages=3', 7, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843394, 'localhost', 18888, NULL, NULL, 155, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843395, 'localhost', 18888, NULL, 'pages=3', 355, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843396, 'localhost', 18888, NULL, 'pages=3', 17, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843397, 'localhost', 18888, NULL, NULL, 123, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843398, 'localhost', 18888, NULL, NULL, 114, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843399, 'localhost', 18888, NULL, NULL, 125, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843400, 'localhost', 18888, NULL, NULL, 166, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843401, 'localhost', 18888, NULL, NULL, 892, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233046843402, 'localhost', 18888, NULL, 'pages=3', 9, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233105563649, 'localhost', 18888, NULL, 'pages=3', 5, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233105563650, 'localhost', 18888, NULL, 'pages=3', 4, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233105563651, 'localhost', 18888, NULL, 'pages=3', 17, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879189233105563652, 'localhost', 18888, NULL, NULL, 283, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007039700994, 'localhost', 18888, NULL, NULL, 124, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007039700995, 'localhost', 18888, NULL, NULL, 392, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007039700996, 'localhost', 18888, NULL, NULL, 155, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007039700997, 'localhost', 18888, NULL, NULL, 240, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007039700998, 'localhost', 18888, NULL, 'pages=3', 6967, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007048089602, 'localhost', 18888, NULL, 'pages=3', 6131, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007048089603, 'localhost', 18888, NULL, 'pages=3', 5885, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007048089604, 'localhost', 18888, NULL, 'pages=3', 6264, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007048089605, 'localhost', 18888, NULL, 'pages=3', 6335, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007048089606, 'localhost', 18888, NULL, 'pages=3', 13154, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007048089607, 'localhost', 18888, NULL, 'pages=3', 7297, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007060672513, 'localhost', 18888, NULL, 'pages=3', 6469, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007060672514, 'localhost', 18888, NULL, 'pages=3', 8, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879193007060672515, 'localhost', 18888, NULL, NULL, 323, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779782504449, 'localhost', 18888, NULL, NULL, 127, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779782504450, 'localhost', 18888, NULL, NULL, 176, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779782504451, 'localhost', 18888, NULL, 'pages=3', 6050, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779790893057, 'localhost', 18888, NULL, NULL, 127, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779790893058, 'localhost', 18888, NULL, NULL, 262, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779790893059, 'localhost', 18888, NULL, 'pages=3', 6697, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779795087361, 'localhost', 18888, NULL, 'pages=1', 2132, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779795087362, 'localhost', 18888, NULL, 'pages=3', 6733, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879196779795087363, 'localhost', 18888, NULL, NULL, 136, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963970, 'localhost', 18888, NULL, NULL, 202, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963971, 'localhost', 18888, NULL, 'pages=1', 2226, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963972, 'localhost', 18888, NULL, 'pages=1', 2474, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963973, 'localhost', 18888, NULL, 'pages=1', 2259, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963974, 'localhost', 18888, NULL, NULL, 408, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963975, 'localhost', 18888, NULL, 'pages=1', 2145, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963976, 'localhost', 18888, NULL, NULL, 507, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963977, 'localhost', 18888, NULL, 'pages=1', 2468, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963978, 'localhost', 18888, NULL, NULL, 548, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963979, 'localhost', 18888, NULL, 'pages=1', 2394, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963980, 'localhost', 18888, NULL, 'pages=1', 2052, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963981, 'localhost', 18888, NULL, 'pages=1', 2243, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879200556442963982, 'localhost', 18888, NULL, NULL, 124, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879336447912169474, 'localhost', 18888, NULL, 'pages=2', 4251, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879336447912169475, 'localhost', 18888, NULL, NULL, 234, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879770560955604994, 'localhost', 18888, NULL, NULL, 694, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879774333690109953, 'localhost', 18888, NULL, 'pages=1', 2180, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879774333690109954, 'localhost', 18888, NULL, 'pages=1', 2063, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879774333690109955, 'localhost', 18888, NULL, 'pages=3', 7370, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879774333690109956, 'localhost', 18888, NULL, NULL, 458, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879778109612290049, 'localhost', 18888, NULL, 'pages=1', 3166, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879778109612290050, 'localhost', 18888, NULL, 'pages=1', 3513, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879778109612290051, 'localhost', 18888, NULL, 'pages=1', 2701, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879778109612290052, 'localhost', 18888, NULL, 'pages=1', 2556, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879778109612290053, 'localhost', 18888, NULL, 'pages=1', 2388, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907265, 'localhost', 18888, NULL, 'pages=1', 11833, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907266, 'localhost', 18888, NULL, 'pages=1', 2570, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907267, 'localhost', 18888, NULL, NULL, 298, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907268, 'localhost', 18888, NULL, NULL, 137, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907269, 'localhost', 18888, NULL, NULL, 434, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907270, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907271, 'localhost', 18888, NULL, NULL, 29, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907272, 'localhost', 18888, NULL, 'pages=', 168, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907273, 'localhost', 18888, NULL, 'pages=1', 2252, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907274, 'localhost', 18888, NULL, 'pages=1', 2302, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907275, 'localhost', 18888, NULL, 'pages=1', 2472, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907276, 'localhost', 18888, NULL, 'pages=', 29, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907277, 'localhost', 18888, NULL, 'pages=1', 3353, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907278, 'localhost', 18888, NULL, 'pages=1', 2202, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1879782088928907279, 'localhost', 18888, NULL, NULL, 392, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378011521025, 'localhost', 18888, NULL, 'pages=1', 2184, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378011521026, 'localhost', 18888, NULL, 'pages=1', 2127, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378011521027, 'localhost', 18888, NULL, 'pages=1', 2065, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378011521028, 'localhost', 18888, NULL, 'pages=1', 1103, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378011521029, 'localhost', 18888, NULL, 'pages=1', 3631, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909634, 'localhost', 18888, NULL, 'pages=1', 1100, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909635, 'localhost', 18888, NULL, 'pages=1', 2172, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909636, 'localhost', 18888, NULL, 'pages=1', 1702, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909637, 'localhost', 18888, NULL, 'pages=1', 2176, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909638, 'localhost', 18888, NULL, 'pages=1', 5584, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909639, 'localhost', 18888, NULL, NULL, 443, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909640, 'localhost', 18888, NULL, 'pages=1', 11, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909641, 'localhost', 18888, NULL, 'pages=1', 676, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909642, 'localhost', 18888, NULL, NULL, 298, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909643, 'localhost', 18888, NULL, NULL, 137, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378019909644, 'localhost', 18888, NULL, NULL, 434, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378028298241, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378028298242, 'localhost', 18888, NULL, NULL, 29, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378028298243, 'localhost', 18888, NULL, 'pages=', 168, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378032492545, 'localhost', 18888, NULL, 'pages=1', 2252, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378032492546, 'localhost', 18888, NULL, 'pages=1', 2302, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378032492547, 'localhost', 18888, NULL, 'pages=1', 2472, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378032492548, 'localhost', 18888, NULL, 'pages=', 29, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378032492549, 'localhost', 18888, NULL, 'pages=1', 3353, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378032492550, 'localhost', 18888, NULL, 'pages=1', 2202, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880159378032492551, 'localhost', 18888, NULL, NULL, 392, '/step/login', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880163146711150594, 'localhost', 18888, NULL, 'pages=1', 6454, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880163146711150595, 'localhost', 18888, NULL, 'pages=1', 2802, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880163146727927810, 'localhost', 18888, NULL, 'pages=1', 2531, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880163146727927811, 'localhost', 18888, NULL, 'pages=1', 1419, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880163146727927812, 'localhost', 18888, NULL, 'pages=1', 1489, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880166921060405249, 'localhost', 18888, NULL, 'pages=1', 6731, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880166921060405250, 'localhost', 18888, NULL, 'pages=1', 329, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880166921060405251, 'localhost', 18888, NULL, 'pages=1', 2129, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880166921060405252, 'localhost', 18888, NULL, 'pages=1', 6459, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880170694608605185, 'localhost', 18888, NULL, 'pages=1', 2721, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880174471822651394, 'localhost', 18888, NULL, NULL, 3222, '/step/WebBug/killMysql', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880174471910731777, 'localhost', 18888, NULL, NULL, 11, '/step/WebBug/killMysql', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880174471910731778, 'localhost', 18888, NULL, NULL, 125, '/step/WebBug/killMysql', '未知', '未知', NULL);
INSERT INTO "public"."access_record" VALUES (1880514211092500482, 'localhost', 18888, NULL, NULL, 212, '/step/login', '未知', '未知', '2025-01-18 15:06:34');
INSERT INTO "public"."access_record" VALUES (1880514211092500483, 'localhost', 18888, NULL, NULL, 1385, '/step/login', '未知', '未知', '2025-01-18 15:06:09');
INSERT INTO "public"."access_record" VALUES (1880525533695938562, 'localhost', 18888, NULL, NULL, 160, '/step/register', '未知', '未知', '2025-01-18 15:53:48');
INSERT INTO "public"."access_record" VALUES (1880533086089744386, 'localhost', 18888, NULL, NULL, 91, '/step/login', '未知', '未知', '2025-01-18 16:28:37');
INSERT INTO "public"."access_record" VALUES (1880533086102327298, 'localhost', 18888, NULL, NULL, 180, '/step/login', '未知', '未知', '2025-01-18 16:28:29');
INSERT INTO "public"."access_record" VALUES (1880533086102327299, 'localhost', 18888, NULL, NULL, 44, '/step/register', '未知', '未知', '2025-01-18 16:28:10');
INSERT INTO "public"."access_record" VALUES (1880533086102327300, 'localhost', 18888, NULL, NULL, 45, '/step/register', '未知', '未知', '2025-01-18 16:27:15');
INSERT INTO "public"."access_record" VALUES (1880533086106521601, 'localhost', 18888, NULL, NULL, 37, '/step/register', '未知', '未知', '2025-01-18 16:26:58');
INSERT INTO "public"."access_record" VALUES (1880533086106521602, 'localhost', 18888, NULL, NULL, 35, '/step/register', '未知', '未知', '2025-01-18 16:26:39');
INSERT INTO "public"."access_record" VALUES (1880533086106521603, 'localhost', 18888, NULL, NULL, 14, '/step/register', '未知', '未知', '2025-01-18 16:26:20');
INSERT INTO "public"."access_record" VALUES (1880533086106521604, 'localhost', 18888, NULL, NULL, 45, '/step/register', '未知', '未知', '2025-01-18 16:26:13');
INSERT INTO "public"."access_record" VALUES (1880533086114910209, 'localhost', 18888, NULL, NULL, 228, '/step/register', '未知', '未知', '2025-01-18 16:24:02');
INSERT INTO "public"."access_record" VALUES (1880533086114910210, 'localhost', 18888, NULL, NULL, 10397, '/step/register', '未知', '未知', '2025-01-18 16:15:50');
INSERT INTO "public"."access_record" VALUES (1880536858912317442, 'localhost', 18888, NULL, NULL, 218, '/step/login', '未知', '未知', '2025-01-18 16:30:58');
INSERT INTO "public"."access_record" VALUES (1880536858912317443, 'localhost', 18888, NULL, NULL, 308, '/step/register', '未知', '未知', '2025-01-18 16:30:49');

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS "public"."account";
CREATE TABLE "public"."account" (
  "id" int8 NOT NULL DEFAULT nextval('account_id_seq'::regclass),
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "money" int4 DEFAULT 0,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO "public"."account" VALUES (1, 'fox', 30, '2024-08-07 22:53:01', '2024-11-10 17:10:07');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS "public"."article";
CREATE TABLE "public"."article" (
  "id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "type_id" int4 NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "write_time" timestamptz(6) DEFAULT now(),
  "memory_time" timestamptz(6),
  "weather_id" int4,
  "mood_id" int4,
  "author_name" varchar(100) COLLATE "pg_catalog"."default",
  "author_id" varchar(64) COLLATE "pg_catalog"."default",
  "author_avatar" varchar(255) COLLATE "pg_catalog"."default",
  "color" varchar(20) COLLATE "pg_catalog"."default",
  "image_urls" varchar(1000) COLLATE "pg_catalog"."default",
  "is_star" bool DEFAULT false,
  "address" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."article"."id" IS '文章ID';
COMMENT ON COLUMN "public"."article"."type_id" IS '类型ID';
COMMENT ON COLUMN "public"."article"."title" IS '标题';
COMMENT ON COLUMN "public"."article"."content" IS '内容';
COMMENT ON COLUMN "public"."article"."write_time" IS '写作时间';
COMMENT ON COLUMN "public"."article"."memory_time" IS '记忆中的时间';
COMMENT ON COLUMN "public"."article"."weather_id" IS '天气ID';
COMMENT ON COLUMN "public"."article"."mood_id" IS '心情ID';
COMMENT ON COLUMN "public"."article"."author_name" IS '写作者名称';
COMMENT ON COLUMN "public"."article"."author_id" IS '写作者ID';
COMMENT ON COLUMN "public"."article"."author_avatar" IS '写作者头像';
COMMENT ON COLUMN "public"."article"."color" IS '展示颜色';
COMMENT ON COLUMN "public"."article"."image_urls" IS '图片地址，逗号分割';
COMMENT ON COLUMN "public"."article"."is_star" IS '是否星标';
COMMENT ON COLUMN "public"."article"."address" IS '发生地址';
COMMENT ON TABLE "public"."article" IS '文章表';

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for baidu_question
-- ----------------------------
DROP TABLE IF EXISTS "public"."baidu_question";
CREATE TABLE "public"."baidu_question" (
  "id" int8 NOT NULL,
  "question_text" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."baidu_question"."question_text" IS '脑残问题';
COMMENT ON TABLE "public"."baidu_question" IS '百度脑残吧帖子标题';

-- ----------------------------
-- Records of baidu_question
-- ----------------------------
INSERT INTO "public"."baidu_question" VALUES (-2116167506, '男的已经是男的了为啥还要考公？');
INSERT INTO "public"."baidu_question" VALUES (-2087491212, '为什么达尔文奖都没获奖感言？');
INSERT INTO "public"."baidu_question" VALUES (-2086712752, '关闭深色模式了为什么还是黑的？');
INSERT INTO "public"."baidu_question" VALUES (-2052525652, '梦里我们都扮演着主角对吗？');
INSERT INTO "public"."baidu_question" VALUES (-2050461412, '我爸妈在我出生的时候是怎么知道我未来的名字的？');
INSERT INTO "public"."baidu_question" VALUES (-2037803623, '怎么办啊？？？');
INSERT INTO "public"."baidu_question" VALUES (-2030188501, '短暂的相遇是奖励还是惩罚？');
INSERT INTO "public"."baidu_question" VALUES (-2018420295, '这个洞这么小，是怎么把树套进去的啊？');
INSERT INTO "public"."baidu_question" VALUES (-1990686046, '找小姐时如果发现她不小，可以起诉她虚假宣传吗？');
INSERT INTO "public"."baidu_question" VALUES (-1976806522, '用劳动换取财产，根据智力水平平等分配的小偷为什么会被厌恶？');
INSERT INTO "public"."baidu_question" VALUES (-1959231813, '为什么世界要以一种因为物理的法则运转？');
INSERT INTO "public"."baidu_question" VALUES (-1946032776, '人生如此？');
INSERT INTO "public"."baidu_question" VALUES (-1937070190, '村干部不为人民做该做的事，看不起人，如何投诉？');
INSERT INTO "public"."baidu_question" VALUES (-1856049810, '凭什么商鞅吧没有五个？');
INSERT INTO "public"."baidu_question" VALUES (-1848859578, '现在年轻人的出路是什么？');
INSERT INTO "public"."baidu_question" VALUES (-1840561762, '喷香水是为了让别人鼻子闻到，那为什么不直接给别人鼻子喷香水呢？');
INSERT INTO "public"."baidu_question" VALUES (-1838519445, '单选题是只能选一个的题还是只能选一个的题？');
INSERT INTO "public"."baidu_question" VALUES (-1833574634, '我的头怎么尖尖的？');
INSERT INTO "public"."baidu_question" VALUES (-1802250096, '为什么时钟的指针是顺时针转的？');
INSERT INTO "public"."baidu_question" VALUES (-1800621270, '有没有大佬帮我看看我这个为啥开不了机？');
INSERT INTO "public"."baidu_question" VALUES (-1774334065, '是我们创造了世界，还是世界创造了我们？');
INSERT INTO "public"."baidu_question" VALUES (-1771372160, '既然是先有蛋，后有鸡，那么没有鸡之前人类是怎么繁衍的呢？');
INSERT INTO "public"."baidu_question" VALUES (-1747309254, '苏轼为什么没能考上研究生？');
INSERT INTO "public"."baidu_question" VALUES (-1680471182, '男生雌激素分泌过多会长奶子，那女的雄性激素分泌过多会长牛牛嚒？');
INSERT INTO "public"."baidu_question" VALUES (-1671279654, '罚款-150元是什么意思？');
INSERT INTO "public"."baidu_question" VALUES (-1649917980, '油箱还长个了？');
INSERT INTO "public"."baidu_question" VALUES (-1647438292, '爱有离合，那有离婚市场吗？');
INSERT INTO "public"."baidu_question" VALUES (-1609082755, '猫娘会感染猫瘟吗？');
INSERT INTO "public"."baidu_question" VALUES (-1573908568, '既然未来没有来，那为什么还叫未来呢？');
INSERT INTO "public"."baidu_question" VALUES (-1548543443, '这是抄袭弱智吧的吗？');
INSERT INTO "public"."baidu_question" VALUES (-1548179489, '喝零度的水可以尿出37度的尿，人类的本质就是一个热水器吗？');
INSERT INTO "public"."baidu_question" VALUES (-1508428770, '洋抖没了，会不会有趁机混入贴吧的老外？');
INSERT INTO "public"."baidu_question" VALUES (-1500192444, '考试写个解得一分，那为什么不写六十个解呢？');
INSERT INTO "public"."baidu_question" VALUES (-1460487177, '鱼如果身上痒了该怎么办？');
INSERT INTO "public"."baidu_question" VALUES (-1442288569, '如果我抓到人鱼公主，我只吃人鱼鱼的部分，那我算吃人吗？');
INSERT INTO "public"."baidu_question" VALUES (-1442243259, '为什么新闻只报道名人去世，而不报道名人出生？');
INSERT INTO "public"."baidu_question" VALUES (-1441711433, '福瑞去动物园是不是就和正常人去妓院一样？');
INSERT INTO "public"."baidu_question" VALUES (-1432422358, '既然海拔越高沸点越低，那么马里亚纳海沟的水要多少度才能烧开？');
INSERT INTO "public"."baidu_question" VALUES (-1431324951, '人死后会变成星星，那商鞅死后会不会变成麦克阿瑟？');
INSERT INTO "public"."baidu_question" VALUES (-1426443247, '你只准备了5个领导，但是来了一亿杯水，你会怎么做？');
INSERT INTO "public"."baidu_question" VALUES (-1416528507, '如果蝙蝠吸动物血为生，那蝙蝠侠吸什么血为生？');
INSERT INTO "public"."baidu_question" VALUES (-1389010067, '为什么电视剧和电影可以播杀人镜头，却不能播造人镜头？');
INSERT INTO "public"."baidu_question" VALUES (-1336253573, '香港的币叫港币，朝鲜和日本的币叫什么？');
INSERT INTO "public"."baidu_question" VALUES (-1303467215, '有人四海为家，那鱼儿住哪里？');
INSERT INTO "public"."baidu_question" VALUES (-1285412759, '这鱼怎么不吃东西？');
INSERT INTO "public"."baidu_question" VALUES (-1279363934, '在傻子眼里，其他人是不是都是傻子？');
INSERT INTO "public"."baidu_question" VALUES (-1266494999, '罪该万死的人自杀了是上天堂还是下地狱？');
INSERT INTO "public"."baidu_question" VALUES (-1259037946, '如果我被一个笑话笑死了，那编这个笑话的人会被判刑吗？');
INSERT INTO "public"."baidu_question" VALUES (-1251864275, '一个人要怎么证明他在睡觉？');
INSERT INTO "public"."baidu_question" VALUES (-1187514626, '为什么不在高速服务区开个酒吧？');
INSERT INTO "public"."baidu_question" VALUES (-1180892789, '我们是拥抱世界，还是只拥抱世界的美好？');
INSERT INTO "public"."baidu_question" VALUES (-1180752681, '捧臭脚是不是近几年衍生出了新的意思？');
INSERT INTO "public"."baidu_question" VALUES (-1176891305, '为什么我喜欢女生，但我的男朋友却不喜欢？');
INSERT INTO "public"."baidu_question" VALUES (-1157942311, '仿生学能不能研究一下，让牙膏模仿大便，挤一截自动挤断？');
INSERT INTO "public"."baidu_question" VALUES (-1147655003, '有人拿可乐洗厕所，为什么没人拿洁厕灵当饮料？');
INSERT INTO "public"."baidu_question" VALUES (-1128588207, '皇上降旨赐死，那我已读不回不就行了吗？');
INSERT INTO "public"."baidu_question" VALUES (-1098741680, '人不能在水下呼吸，那我把水杯放头上为什么能呼吸？');
INSERT INTO "public"."baidu_question" VALUES (-1096605791, '突然想到，亲子盖饭算不算是骨肉相连呢？');
INSERT INTO "public"."baidu_question" VALUES (-1045106135, '匡衡凿壁偷光，邻居家会不会小孔成像到自己家里？');
INSERT INTO "public"."baidu_question" VALUES (-1044493406, '喜欢除了人之外的异性动物还算异性恋吗？');
INSERT INTO "public"."baidu_question" VALUES (-1035752985, '小明20岁失忆了，那现在的小明还是原来的小明吗？');
INSERT INTO "public"."baidu_question" VALUES (-1003046662, '为什么猫咪零食不用老鼠肉？');
INSERT INTO "public"."baidu_question" VALUES (-989593189, '弱智吧是什么人创建的？');
INSERT INTO "public"."baidu_question" VALUES (-984756691, '每年春节车票这么难抢，大家为什么不开车回去？');
INSERT INTO "public"."baidu_question" VALUES (-977821966, '路遥知马力，路遥是商鞅吗？');
INSERT INTO "public"."baidu_question" VALUES (-975484159, '设计这个挂钩的人是咋想的？');
INSERT INTO "public"."baidu_question" VALUES (-963424304, '湿兴大发，可否有病友来吟诗作对？');
INSERT INTO "public"."baidu_question" VALUES (-951333478, '鱼在空气中乱蹦算有氧运动算无氧运动？');
INSERT INTO "public"."baidu_question" VALUES (-926428700, '我被暴雨淋感冒了，算不算攻击物是水滴💧？');
INSERT INTO "public"."baidu_question" VALUES (-857545496, '鱼身体里那么多刺，会痛吗？');
INSERT INTO "public"."baidu_question" VALUES (-855498832, '人的颈椎能承受自身重量吗？');
INSERT INTO "public"."baidu_question" VALUES (-851245880, '看见陌生的爷爷可以喊大爷，那看见陌生的奶奶喊什么？');
INSERT INTO "public"."baidu_question" VALUES (-845925426, '下围棋被窥屏了怎么办？');
INSERT INTO "public"."baidu_question" VALUES (-813825758, '机器人就业前景这么广阔，我们为什么不去当机器人？');
INSERT INTO "public"."baidu_question" VALUES (-768331584, '你有五个杯子、来了五个领导，但是本吧持续禁水中，你该怎么办？');
INSERT INTO "public"."baidu_question" VALUES (-761686442, '取消是什么性别？');
INSERT INTO "public"."baidu_question" VALUES (-757847131, '我们是正在活着还是正在死去？');
INSERT INTO "public"."baidu_question" VALUES (-715389869, '没有意义会有意义吗？');
INSERT INTO "public"."baidu_question" VALUES (-712696548, '给汽车加燃油宝算是给汽车喂健身胃消食片吗？');
INSERT INTO "public"."baidu_question" VALUES (-666163720, '孩子的生日是母亲的苦难日 ，那母亲的生日是孩子的什么日？');
INSERT INTO "public"."baidu_question" VALUES (-657462623, '帝都是北京，魔都是上海，那么成都是哪里？');
INSERT INTO "public"."baidu_question" VALUES (-657159001, '被人推荐来弱智吧学中文，我来了，有人教我吗？');
INSERT INTO "public"."baidu_question" VALUES (-642626907, '问，小红去寺庙烧香时心脏病猝发后原地起立，什么原理？');
INSERT INTO "public"."baidu_question" VALUES (-621789860, '西红柿炒番茄要不要放鸡蛋？');
INSERT INTO "public"."baidu_question" VALUES (-610188384, '？？？？？？');
INSERT INTO "public"."baidu_question" VALUES (-536486497, '孙膑已经在水下憋了半个小时，为什么没人救他？');
INSERT INTO "public"."baidu_question" VALUES (-535480594, '我只要把脑袋的洞都堵上，是不是就不会脑子进水了？');
INSERT INTO "public"."baidu_question" VALUES (-528798881, 'exp(t)关于e求导结果是texp(t-1)还是xp(t)？');
INSERT INTO "public"."baidu_question" VALUES (-527373533, '夸父的反义词是不是骂娘？');
INSERT INTO "public"."baidu_question" VALUES (-517632616, '遇到劫匪抢劫，但是忘了支付宝密码怎么办？');
INSERT INTO "public"."baidu_question" VALUES (-499100574, '天平比较两罐气体，两边放砝码平衡罐的重量，但怎样平衡砝码本身？');
INSERT INTO "public"."baidu_question" VALUES (-486602449, '怎么证明火影不存在？');
INSERT INTO "public"."baidu_question" VALUES (-463761244, '如果我现在成了傻子，是不是以后都不用傻了？');
INSERT INTO "public"."baidu_question" VALUES (-430952271, '大佬们帮我看看这是什么型号的CPU，值钱吗？');
INSERT INTO "public"."baidu_question" VALUES (-414448373, '朋友欠饭钱不给怎么办？');
INSERT INTO "public"."baidu_question" VALUES (-370255875, '鼻屎天天在鼻子里待着，为什么闻不到它的味道🤔？');
INSERT INTO "public"."baidu_question" VALUES (-362750495, '他说爱我，她说爱我，谁爱我？');
INSERT INTO "public"."baidu_question" VALUES (-310968380, '天上以前有九个太阳的时候，向日葵到底往哪边看呢？');
INSERT INTO "public"."baidu_question" VALUES (-309884714, '我吃了狗拉的屎后拉出来的屎还是狗屎吗？');
INSERT INTO "public"."baidu_question" VALUES (-296637152, '蓝牙耳机坏了，去医院挂牙科还是耳科？');
INSERT INTO "public"."baidu_question" VALUES (-263700203, '宋江在浔阳楼题反诗时抄袭施耐庵，他不会感到羞愧吗？');
INSERT INTO "public"."baidu_question" VALUES (-254432995, '公务舱是不是只有公务员能坐？');
INSERT INTO "public"."baidu_question" VALUES (-229803684, '美国人辛辛苦苦创办了感恩节，印第安人为什么不领情？');
INSERT INTO "public"."baidu_question" VALUES (-226903613, '红灯区是不是无人区？');
INSERT INTO "public"."baidu_question" VALUES (-210172812, '为什么没有耐青蛙的蝗虫？');
INSERT INTO "public"."baidu_question" VALUES (-204254025, '一闻到屎就想吐是不是怀了啊？');
INSERT INTO "public"."baidu_question" VALUES (-201282997, '这种图可以进疗养院吗？');
INSERT INTO "public"."baidu_question" VALUES (-182528129, '为什么人要认字，而不是字来认人呢？');
INSERT INTO "public"."baidu_question" VALUES (-148779957, '象姑馆算是传统零售（受）行业吗？');
INSERT INTO "public"."baidu_question" VALUES (-135058738, '公寓失火，别人家的狗和你的孩子先救哪个？');
INSERT INTO "public"."baidu_question" VALUES (-109854203, '刚吃了点蒜后去老板办公室居然被赶了出来，我老板是不是吸血鬼啊？');
INSERT INTO "public"."baidu_question" VALUES (-103250064, '变形金刚地球上变车有地球人开，赛博坦上变车谁来开？');
INSERT INTO "public"."baidu_question" VALUES (-97373144, '为什么老师不会发今年的期末真题来训练？');
INSERT INTO "public"."baidu_question" VALUES (-82900375, '不是说现在很难找工作？为什么我去几个单位问了一圈大家都有工作？');
INSERT INTO "public"."baidu_question" VALUES (-69491575, '挖耳屎太舒服了，有什么办法让耳屎长得快一点？');
INSERT INTO "public"."baidu_question" VALUES (-68254386, '我的手机为什么不会飞？');
INSERT INTO "public"."baidu_question" VALUES (-68227637, '书中自有黄金屋，那为什么还有人租房啊？');
INSERT INTO "public"."baidu_question" VALUES (-24603797, '孟婆汤是如何通过血脑屏障的？');
INSERT INTO "public"."baidu_question" VALUES (-10454839, '老师拖堂为什么不给我加班费？');
INSERT INTO "public"."baidu_question" VALUES (-4616556, '为什么人产的牛奶会有鱼腥味？');
INSERT INTO "public"."baidu_question" VALUES (65311, '？');
INSERT INTO "public"."baidu_question" VALUES (4907158, '女生喜欢你会说讨厌你，那女生跟你说喜欢你是不是讨厌你的意思？');
INSERT INTO "public"."baidu_question" VALUES (12961468, '你只有四个杯子，但是五个领导同时掉进水里，你先救哪个？');
INSERT INTO "public"."baidu_question" VALUES (39584513, '1万亿存银行每天都有6000万利息，这不是最简单的赚钱方法吗？');
INSERT INTO "public"."baidu_question" VALUES (60941385, '为什么小红书没有人去教老外网购能仅退款？');
INSERT INTO "public"."baidu_question" VALUES (67976983, '为什么大家都喜欢杜甫的肚子，说杜甫肚子美？');
INSERT INTO "public"."baidu_question" VALUES (91970960, '明明早八是8:00，为什么我4:00睡觉7:99起床还是很困？');
INSERT INTO "public"."baidu_question" VALUES (105852245, '我喊内耗的人生的孩子叫内耗子为啥他爸妈要揍我？');
INSERT INTO "public"."baidu_question" VALUES (108051680, '人们习惯将【毛里求斯】简称为【毛求】，那【基里巴斯】简称什么？');
INSERT INTO "public"."baidu_question" VALUES (109430687, '我已经到了，你人呢？');
INSERT INTO "public"."baidu_question" VALUES (116080095, '多人格的人谈多个对象算出轨吗？');
INSERT INTO "public"."baidu_question" VALUES (132075466, '为什么地球就喜欢围着太阳转？');
INSERT INTO "public"."baidu_question" VALUES (182642934, '你们会养石头吗？');
INSERT INTO "public"."baidu_question" VALUES (189725367, '戴表的左手总是隐隐发疼，是被表勒太紧了，还是被时间勒太紧了？');
INSERT INTO "public"."baidu_question" VALUES (207537219, '2500元，自己暑假工剩的，我想用这些改变自己，该怎么用？');
INSERT INTO "public"."baidu_question" VALUES (257557568, '我想到一个发财的路子，广告里能不能植入广告？');
INSERT INTO "public"."baidu_question" VALUES (266553669, '种地需要矿物质。那为什么不直接浇矿泉水？');
INSERT INTO "public"."baidu_question" VALUES (294802651, '希腊奶是啥意思啊，各位8u？');
INSERT INTO "public"."baidu_question" VALUES (330227539, '尿液是无菌的，怎么不在尿里做手术？');
INSERT INTO "public"."baidu_question" VALUES (332364322, '物质世界里的运动是绝对的，那不就说明世界是一个巨大的yd机吗？');
INSERT INTO "public"."baidu_question" VALUES (334382651, '光之国的人见过猪吗？');
INSERT INTO "public"."baidu_question" VALUES (376708709, '小明压力太大连续喝酒死了，那杀死小明是酒精还是过去？');
INSERT INTO "public"."baidu_question" VALUES (409234175, '同样是十三个小时，朝九晚五大家觉得正常，朝五晚九却不行？');
INSERT INTO "public"."baidu_question" VALUES (486521476, '九五是至尊，为啥八五是弱智呢？');
INSERT INTO "public"."baidu_question" VALUES (503251676, '到底谁是正常人，谁是sjb？');
INSERT INTO "public"."baidu_question" VALUES (504762147, '秦始皇陵建的这么复杂，秦始皇怎么出来？');
INSERT INTO "public"."baidu_question" VALUES (514912874, '牙科是内科还是外科？');
INSERT INTO "public"."baidu_question" VALUES (580586310, '炼的神经网络有问题，能去神经病院挂号吗？');
INSERT INTO "public"."baidu_question" VALUES (588128897, '全是脏话的英语是美国西海岸英语，那汉语呢？');
INSERT INTO "public"."baidu_question" VALUES (598485306, '我即不是小孩又没到大人，是不是叫小人？');
INSERT INTO "public"."baidu_question" VALUES (611729440, '大家天天用洗衣粉洗衣服，为什么不说用什么东西洗洗衣粉？');
INSERT INTO "public"."baidu_question" VALUES (719609720, '逗人笑的叫小丑，惹人嫌的是不是叫小美？');
INSERT INTO "public"."baidu_question" VALUES (737604655, '悲困之人，谁能共识？');
INSERT INTO "public"."baidu_question" VALUES (744805004, '有没有会盲文的摸一下什么意思？');
INSERT INTO "public"."baidu_question" VALUES (769590157, '敌人的敌人就是朋友，那朋友的朋友是不是就是敌人？');
INSERT INTO "public"."baidu_question" VALUES (784621577, '古代小说中治病用的无根水要去哪里找？');
INSERT INTO "public"."baidu_question" VALUES (799178558, '饭卡是啥游戏？');
INSERT INTO "public"."baidu_question" VALUES (850796173, '我国这么多先进武器，台湾为什么不向大陆购买军火？');
INSERT INTO "public"."baidu_question" VALUES (867123803, '为什么消极是向下的，而积极是向上的？');
INSERT INTO "public"."baidu_question" VALUES (920245212, '细思极恐，我女友说我不成熟，她难道想吃我？');
INSERT INTO "public"."baidu_question" VALUES (923160728, '零添加酱油，一点酱油没有那还是酱油吗？');
INSERT INTO "public"."baidu_question" VALUES (927413145, '为什么全国大部分城市要站着？');
INSERT INTO "public"."baidu_question" VALUES (941761573, '蟹黄是公蟹的镜子，那么魅魔会拿蟹黄当应急食品吗？');
INSERT INTO "public"."baidu_question" VALUES (962897952, '第1个喝酒的人，他为什么喜欢那个度数？');
INSERT INTO "public"."baidu_question" VALUES (977842219, '程序员算不算赛博德鲁伊？');
INSERT INTO "public"."baidu_question" VALUES (1045839100, '神经元等于多少美元？');
INSERT INTO "public"."baidu_question" VALUES (1059511278, '为什么赚人民币最多的不是人民？');
INSERT INTO "public"."baidu_question" VALUES (1065134997, '跑步到底是减肥还是增肥？');
INSERT INTO "public"."baidu_question" VALUES (1092157923, '我的旺仔牛奶为什么没有旺仔？');
INSERT INTO "public"."baidu_question" VALUES (1118354323, '我们究竟活着的还是死亡的？');
INSERT INTO "public"."baidu_question" VALUES (1120481936, '为什么吧务把2026年后的帖子都删了？');
INSERT INTO "public"."baidu_question" VALUES (1143403728, '自己过的苦找比自己过的差人去安慰自己，算不算是掩耳盗铃？');
INSERT INTO "public"."baidu_question" VALUES (1145838491, '躺下感觉背上好痒发现是充电线的口子电到我了，我这是对电过敏吗？');
INSERT INTO "public"."baidu_question" VALUES (1150942666, '是不是不举的法国人，才是真正的雄起？');
INSERT INTO "public"."baidu_question" VALUES (1200843195, '为什么装了显卡还是卡？');
INSERT INTO "public"."baidu_question" VALUES (1203297811, '问:是读银行还是读银行？');
INSERT INTO "public"."baidu_question" VALUES (1225376287, '孕妇打我算群殴吗？');
INSERT INTO "public"."baidu_question" VALUES (1233795863, '西瓜这么好吃，为什么不做成西瓜干呢？');
INSERT INTO "public"."baidu_question" VALUES (1264091363, '半夜是晚上十二点，那全夜是几点？');
INSERT INTO "public"."baidu_question" VALUES (1276367594, '睡觉到底是活的更久还是活的更短？');
INSERT INTO "public"."baidu_question" VALUES (1295012349, '欠了一屁股债为什么不能用屁股还？');
INSERT INTO "public"."baidu_question" VALUES (1307146790, '我家遥控器放哪了？');
INSERT INTO "public"."baidu_question" VALUES (1327148278, '落后就要挨打那我主动打别人是不是就领先了？');
INSERT INTO "public"."baidu_question" VALUES (1332239687, '人棍的母亲可以叫棍母吗？');
INSERT INTO "public"."baidu_question" VALUES (1394730100, '世界上是先有生物还是非生物？');
INSERT INTO "public"."baidu_question" VALUES (1399494000, '文学家死后会成为天文学家吗？');
INSERT INTO "public"."baidu_question" VALUES (1408031283, '过年庆祝什么？');
INSERT INTO "public"."baidu_question" VALUES (1412990339, '非洲的死神不应该是农场主吗？为什么会是阿努比斯？');
INSERT INTO "public"."baidu_question" VALUES (1452013089, '我有个问题搞不明白，为什么人类需要繁衍？');
INSERT INTO "public"."baidu_question" VALUES (1469959919, '人会创造一个完全没有意义的詞吗？');
INSERT INTO "public"."baidu_question" VALUES (1475998510, '既然叫直肠，为什么直的人反而用不了？');
INSERT INTO "public"."baidu_question" VALUES (1482395263, '十年如一日是活了十年还是活了一日？');
INSERT INTO "public"."baidu_question" VALUES (1485299982, '语文考试最后一道写作题读作什么？');
INSERT INTO "public"."baidu_question" VALUES (1498527933, '我八秒之内将魔方打乱，岂不是相当于我八秒之内拧好了？');
INSERT INTO "public"."baidu_question" VALUES (1539532549, '哑巴被瞎子用手语骂了，哑巴怎么骂回去？');
INSERT INTO "public"."baidu_question" VALUES (1554012144, '曹植被五步蛇咬了，走七步能免疫五步蛇的毒吗？');
INSERT INTO "public"."baidu_question" VALUES (1564181986, '不洗手就吃屎会得胃病吗？');
INSERT INTO "public"."baidu_question" VALUES (1592813375, '恶霸经常找人算账，为什么不去当会计？');
INSERT INTO "public"."baidu_question" VALUES (1594797766, '先砍头，再五马分尸，那五只马绑的是哪里？');
INSERT INTO "public"."baidu_question" VALUES (1637695992, '我穿越到未来了，这样创业能赚到钱吗？');
INSERT INTO "public"."baidu_question" VALUES (1646666746, '鱼上岸了不会死吗？');
INSERT INTO "public"."baidu_question" VALUES (1650112573, '如果穷人都不生孩子，不就只有富人了？');
INSERT INTO "public"."baidu_question" VALUES (1669999181, '怎么在吧里发帖子啊？');
INSERT INTO "public"."baidu_question" VALUES (1670949296, '竟然坐地日行八万里，那发明飞机汽车干什么？');
INSERT INTO "public"."baidu_question" VALUES (1690708007, '干燥剂算不算治脑袋进水的特效药？');
INSERT INTO "public"."baidu_question" VALUES (1738611073, '后妈叫继妈，后爸呢？');
INSERT INTO "public"."baidu_question" VALUES (1763925117, '鸡柳是鸡身上哪个部位啊？');
INSERT INTO "public"."baidu_question" VALUES (1827725490, '我走路被石头绊到坑里了，是石头负全责还是坑负全责？');
INSERT INTO "public"."baidu_question" VALUES (1847544890, '孙悟空得了肾结石，那他是生病了还是怀孕了？');
INSERT INTO "public"."baidu_question" VALUES (1875729615, '明明喝酒不能开车，那为什么还有这么多人酒后乱性呢？');
INSERT INTO "public"."baidu_question" VALUES (1883855676, '我3000块一个月把自己租赁给了老板，所以是我自己在剥削自己？');
INSERT INTO "public"."baidu_question" VALUES (1888303923, '弱国无外交，那他们的外交部是做什么的？');
INSERT INTO "public"."baidu_question" VALUES (1891470415, '吧主和吧务都掉进水里了，你是先抄段子还是先水贴？');
INSERT INTO "public"."baidu_question" VALUES (1898163239, '丹麦商品在国内这么被认可吗？');
INSERT INTO "public"."baidu_question" VALUES (1899243689, '分手后真的愿她过得更好吗？');
INSERT INTO "public"."baidu_question" VALUES (1902940901, '为什么说加州大火烧不到中国呀？');
INSERT INTO "public"."baidu_question" VALUES (1905229639, '我妈的儿子房间乱，又不是我的儿子房间乱，关我啥事，还要我收拾？');
INSERT INTO "public"."baidu_question" VALUES (1949901220, '一斤棉花和一斤铁，同时掉进水里你先救谁？');
INSERT INTO "public"."baidu_question" VALUES (1949997531, '电梯上又没有座位，为什么要叫坐电梯？');
INSERT INTO "public"."baidu_question" VALUES (1963781646, '蛇油膏够用吗？');
INSERT INTO "public"."baidu_question" VALUES (1976015788, '来弱智吧看笑话的到底是不是弱智，不是弱智为什么来弱智吧？');
INSERT INTO "public"."baidu_question" VALUES (2024564244, '元宵节不是一月十五吗，怎么一年才过一次？');
INSERT INTO "public"."baidu_question" VALUES (2029357509, '你这辈子听到过最恐怖的话是什么？');
INSERT INTO "public"."baidu_question" VALUES (2057617898, '明星网红那么想要粉丝，那他们为什么不去超市买粉丝呢？');
INSERT INTO "public"."baidu_question" VALUES (2067587394, '为什么不能点差评？');
INSERT INTO "public"."baidu_question" VALUES (2078525783, '飞机没办法繁殖后代，哪来的五代六代？');
INSERT INTO "public"."baidu_question" VALUES (2093076190, '我们到底是生活在这个时代？还是生活在被历史书上记载的过去？');
INSERT INTO "public"."baidu_question" VALUES (2109721360, '学校翻墙出去是扣分，那我翻进来是不是得加分？');
INSERT INTO "public"."baidu_question" VALUES (2112240365, '仿生机器狗会害怕电子潘宏吗？');
INSERT INTO "public"."baidu_question" VALUES (2016991368, '写故事，讲故事，听故事三者谁最受欢迎？');
INSERT INTO "public"."baidu_question" VALUES (70132429, '如何在不穿👖的情况下走在大街上不被引起注意？');
INSERT INTO "public"."baidu_question" VALUES (-1390483704, '危地马拉为什么不翻译成悬崖勒马？');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."comment";
CREATE TABLE "public"."comment" (
  "id" int4 NOT NULL DEFAULT nextval('comment_id_seq'::regclass),
  "ref_id" int4 NOT NULL,
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamptz(6) DEFAULT now(),
  "user_name" varchar(100) COLLATE "pg_catalog"."default",
  "user_avatar" varchar(255) COLLATE "pg_catalog"."default",
  "parent_id" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."comment"."id" IS '主键ID';
COMMENT ON COLUMN "public"."comment"."ref_id" IS '关联ID（对应业务表的数据主键）';
COMMENT ON COLUMN "public"."comment"."content" IS '评论内容';
COMMENT ON COLUMN "public"."comment"."create_time" IS '评论时间';
COMMENT ON COLUMN "public"."comment"."user_name" IS '评论人名称';
COMMENT ON COLUMN "public"."comment"."user_avatar" IS '评论人头像路径或URL';
COMMENT ON COLUMN "public"."comment"."parent_id" IS '父评论ID，0 表示一级评论';
COMMENT ON TABLE "public"."comment" IS '评论表';

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for fun_question
-- ----------------------------
DROP TABLE IF EXISTS "public"."fun_question";
CREATE TABLE "public"."fun_question" (
  "id" int4 NOT NULL DEFAULT nextval('fun_question_id_seq'::regclass),
  "classify" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "content" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of fun_question
-- ----------------------------
INSERT INTO "public"."fun_question" VALUES (1, '测试类', '有一个测试哦~');

-- ----------------------------
-- Table structure for mood
-- ----------------------------
DROP TABLE IF EXISTS "public"."mood";
CREATE TABLE "public"."mood" (
  "id" int4 NOT NULL DEFAULT nextval('mood_id_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "icon" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."mood"."id" IS '主键ID';
COMMENT ON COLUMN "public"."mood"."name" IS '心情名称';
COMMENT ON COLUMN "public"."mood"."icon" IS '心情表情图标路径或URL';
COMMENT ON TABLE "public"."mood" IS '心情表';

-- ----------------------------
-- Records of mood
-- ----------------------------

-- ----------------------------
-- Table structure for msg_wall
-- ----------------------------
DROP TABLE IF EXISTS "public"."msg_wall";
CREATE TABLE "public"."msg_wall" (
  "id" int4 NOT NULL DEFAULT nextval('msg_wall_id_seq'::regclass),
  "leave_msg" varchar(255) COLLATE "pg_catalog"."default",
  "leave_from" varchar(255) COLLATE "pg_catalog"."default",
  "leave_time" timestamp(6),
  "place" varchar(255) COLLATE "pg_catalog"."default",
  "anonymity" int2,
  "ip" varchar(50) COLLATE "pg_catalog"."default",
  "head" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."msg_wall"."leave_msg" IS '内容';
COMMENT ON COLUMN "public"."msg_wall"."leave_from" IS '发表人';
COMMENT ON COLUMN "public"."msg_wall"."leave_time" IS '发表时间';
COMMENT ON COLUMN "public"."msg_wall"."place" IS '地点';
COMMENT ON COLUMN "public"."msg_wall"."anonymity" IS '0否 1匿名';
COMMENT ON COLUMN "public"."msg_wall"."ip" IS 'IP地址';
COMMENT ON COLUMN "public"."msg_wall"."head" IS '头像地址';
COMMENT ON TABLE "public"."msg_wall" IS '留言墙';

-- ----------------------------
-- Records of msg_wall
-- ----------------------------
INSERT INTO "public"."msg_wall" VALUES (18, '666', '66', '2025-04-30 16:50:14', '0 内网IP', NULL, '127.0.0.1', '/Zaohu/2025/04/30/c15e720386554f31ac2b75eaf845c222_1746003013937.png');
INSERT INTO "public"."msg_wall" VALUES (19, '你！', '治疗', '2025-04-30 16:50:43', '0 内网IP', NULL, '127.0.0.1', '/Zaohu/2025/04/30/e582d4ab52784ae0a059266c5d41ca00_1746003043082.png');
INSERT INTO "public"."msg_wall" VALUES (20, '开局自带反甲', '害怕骆驼', '2025-04-30 16:59:50', '0 内网IP', NULL, '127.0.0.1', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."msg_wall" VALUES (21, '性别男，爱好女', '牛牛', '2025-04-30 17:32:39', '0 内网IP', NULL, '127.0.0.1', '/Zaohu/2025/04/30/deccc84429824374b8a510bc77a765f0_1746005558866.png');
INSERT INTO "public"."msg_wall" VALUES (1, 'nb', 'aaa', '2025-07-01 13:37:19.553', '未知 未知', NULL, '192.168.1.13', '/Zaohu/2025/07/01/8f5c2729121545feb51ab9ee12fe8a62_1751348239559.png');
INSERT INTO "public"."msg_wall" VALUES (2, '12123213321123', '121111', '2025-07-01 13:37:36.528', '未知 未知', NULL, '192.168.1.13', '/Zaohu/2025/07/01/b222f55bb2d8428aa0cbc248a1d9bd03_1751348256529.png');
INSERT INTO "public"."msg_wall" VALUES (3, '<script>alert(111)</script>', 'asdasd', '2025-07-01 13:37:52.95', '未知 未知', NULL, '192.168.1.13', '/Zaohu/2025/07/01/c8221be6b8c748fcbb6b7786b1809edb_1751348272951.png');
INSERT INTO "public"."msg_wall" VALUES (4, '辅导费刚刚好', '弟弟', '2025-10-10 21:36:30.396', '未知 未知', NULL, '127.0.0.1', '/Zaohu/2025/10/10/1ceae9597a6c4e2296641dfe2c3dc4c8_1760103390403.png');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS "public"."order";
CREATE TABLE "public"."order" (
  "id" int8 NOT NULL DEFAULT nextval('order_id_seq'::regclass),
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "commodity_code" varchar(255) COLLATE "pg_catalog"."default",
  "count" int4,
  "money" int4 DEFAULT 0,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."order"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."order"."commodity_code" IS '商品编号';
COMMENT ON COLUMN "public"."order"."count" IS '数量';
COMMENT ON COLUMN "public"."order"."money" IS '金额';
COMMENT ON COLUMN "public"."order"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."order"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."order" IS '订单表';

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission";
CREATE TABLE "public"."permission" (
  "permission_id" int8 NOT NULL DEFAULT nextval('permission_permission_id_seq'::regclass),
  "permission_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."permission"."permission_id" IS '权限ID主键';
COMMENT ON COLUMN "public"."permission"."permission_name" IS '权限名';
COMMENT ON TABLE "public"."permission" IS '权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO "public"."permission" VALUES (1000, 'del');
INSERT INTO "public"."permission" VALUES (1001, 'edit');

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS "public"."photo";
CREATE TABLE "public"."photo" (
  "id" int4 NOT NULL DEFAULT nextval('photo_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "file_path" varchar(255) COLLATE "pg_catalog"."default",
  "type_id" int4,
  "is_favorite" bool DEFAULT false,
  "upload_time" timestamp(6),
  "phrase" varchar(255) COLLATE "pg_catalog"."default",
  "memory" text COLLATE "pg_catalog"."default",
  "is_deleted" bool DEFAULT false,
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "device" varchar(100) COLLATE "pg_catalog"."default",
  "altitude" numeric(8,2),
  "shot_time" varchar(32) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."photo"."id" IS '照片主键ID，自增';
COMMENT ON COLUMN "public"."photo"."name" IS '照片名称，可选';
COMMENT ON COLUMN "public"."photo"."file_path" IS '照片存放地址';
COMMENT ON COLUMN "public"."photo"."type_id" IS '所属类型ID，对应类型表';
COMMENT ON COLUMN "public"."photo"."is_favorite" IS '珍藏标识，TRUE为珍藏';
COMMENT ON COLUMN "public"."photo"."upload_time" IS '上传时间，文本格式';
COMMENT ON COLUMN "public"."photo"."phrase" IS '与照片相关的短语';
COMMENT ON COLUMN "public"."photo"."memory" IS '关于照片的回忆故事内容';
COMMENT ON COLUMN "public"."photo"."is_deleted" IS '回收站标识，TRUE表示已删除';
COMMENT ON COLUMN "public"."photo"."location" IS '照片拍摄地址';
COMMENT ON COLUMN "public"."photo"."device" IS '拍摄设备名称';
COMMENT ON COLUMN "public"."photo"."altitude" IS '照片拍摄海拔（米）';
COMMENT ON COLUMN "public"."photo"."shot_time" IS '拍摄时间，文本格式';
COMMENT ON TABLE "public"."photo" IS '照片信息表';

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO "public"."photo" VALUES (34, '6be6615630254482b14fd19054cc4923_1750845475192.webp', '/Zaohu/2025/photo/06/6be6615630254482b14fd19054cc4923_1750845475192.webp', 17, 'f', '2025-06-25 17:57:55.193081', '我不是我', NULL, 'f', NULL, '3123', NULL, NULL);
INSERT INTO "public"."photo" VALUES (30, '4be7c9b479024628908aa9cb82614610_1750508397331.webp', '/Zaohu/2025/photo/06/4be7c9b479024628908aa9cb82614610_1750508397331.webp', 13, 'f', '2025-07-01 13:28:47.703983', '终于等到你', '我数过三百次月圆月缺，在每个失眠的午夜对着星子问过你的踪迹；穿过人潮汹涌的街市时，总怕错过那个相似的背影，猛地回头却只剩满眼陌生。那些辗转反侧的期待，那些快要熄灭又重新燃起的念想，像根系在心底盘虬卧龙，每一次呼吸都带着轻微的疼。', 'f', NULL, '66', 245.00, '2025:05:29 20:30:05');
INSERT INTO "public"."photo" VALUES (36, 'ff8125360b254322b8ce0ae8e991880d_1750874954055.webp', '/Zaohu/2025/photo/06/ff8125360b254322b8ce0ae8e991880d_1750874954055.webp', 13, 'f', '2025-06-26 02:09:14.061269', '不在放弃不再哭泣', '格式与编码：原图片为 MJPEG 格式（mjpeg (Baseline)），处理后格式不变，编码参数（如 q=2-31）影响压缩质量。', 'f', NULL, 'NIKON D5100', NULL, '2012:01:02 13:31:33');
INSERT INTO "public"."photo" VALUES (31, '8239779cb8294577bad924ce1b7a035e_1750508397544.webp', '/Zaohu/2025/photo/06/8239779cb8294577bad924ce1b7a035e_1750508397544.webp', 13, 'f', '2025-06-21 20:19:57.548379', '那我也是13', '0 次提交为灰色。
1 - 24 次提交为一种绿色。
25 - 49 次提交为较深一点的绿色。
50 - 74 次提交为更较深的绿色。
75 次及以上提交为最深的绿色。', 'f', '22.62079427777778,114.02550505555556', 'OnePlus Ace', 0.00, '2025:05:29 17:11:07');
INSERT INTO "public"."photo" VALUES (38, '92c6a718f33640e4838bd11aaf207b43_1750874954100.webp', '/Zaohu/2025/photo/06/92c6a718f33640e4838bd11aaf207b43_1750874954100.webp', 13, 'f', '2025-06-26 02:09:14.104563', '如果没有以后', 'GitHub 上连击绿色的颜色深浅与提交次数有关。通常情况下，提交次数越多，颜色越深。

一般来说，可大致分为以下几个级别：', 'f', NULL, 'Canon EOS 5D Mark III', NULL, '2020:03:26 13:19:02');
INSERT INTO "public"."photo" VALUES (35, '4df71d3b2e22476ea674333f9cc41bef_1750874953715.webp', '/Zaohu/2025/photo/06/4df71d3b2e22476ea674333f9cc41bef_1750874953715.webp', 13, 'f', '2025-06-26 02:09:13.760143', '从此看不到你的脸', '四、其他关键信息', 'f', NULL, 'Canon EOS Rebel T6', NULL, '2019:07:12 07:51:32');
INSERT INTO "public"."photo" VALUES (37, 'e779e64876f54c36b4f6ac86005d5465_1750874954085.webp', '/Zaohu/2025/photo/06/e779e64876f54c36b4f6ac86005d5465_1750874954085.webp', 13, 'f', '2025-06-26 02:09:14.087354', '你已走都我面前', '代码逻辑：代码中仅使用了 scale 参数调整像素尺寸，未涉及 -density 或 -resample 等设置分辨率的参数（如之前优化建议中提到的 -density 300）。
输出验证：输出信息中未提及分辨率（PPI/DPI）的变化，且 FFmpeg 默认不会修改原图片的分辨率参数。
结论：图片的分辨率（每英寸像素数）保持不变，仅像素尺寸和文件体积改变', 'f', NULL, 'sdf', NULL, NULL);
INSERT INTO "public"."photo" VALUES (40, '5c5ef373675b415da11d7d29574b437d_1750874954152.webp', '/Zaohu/2025/photo/06/5c5ef373675b415da11d7d29574b437d_1750874954152.webp', 13, 'f', '2025-06-26 02:09:14.155593', '听我说：', 'Output #0, image2, to ''D:\step\file\image\2025\photoType\Temp\cb2482f5caf749adb6d03967d7a9b09e.jpg'':', 'f', NULL, 'dfgfh', NULL, NULL);
INSERT INTO "public"."photo" VALUES (39, '4241a830878b407ab3301a187420abb0_1750874954134.webp', '/Zaohu/2025/photo/06/4241a830878b407ab3301a187420abb0_1750874954134.webp', 13, 'f', '2025-06-26 02:09:14.137819', '我发现你和我的视线', '定期维护：
使用磁盘清理工具（Windows 自带）删除临时文件。
对 SSD 开启 TRIM 功能，保持剩余空间在 20% 以上。', 'f', NULL, 'erwerw', NULL, NULL);
INSERT INTO "public"."photo" VALUES (47, 'f060950980e74c3ca1d1ee7d9ea19ad7_1750874985555.webp', '/Zaohu/2025/photo/06/f060950980e74c3ca1d1ee7d9ea19ad7_1750874985555.webp', 13, 'f', '2025-06-26 02:09:45.564241', '是哪个雨天让我们忘记了誓言', '合理分配空间：
500GB C 盘：系统 + 软件占用控制在 200GB 内，剩余空间留作缓存和临时文件。
1TB C 盘：可划分一部分空间（如 200GB）作为系统分区，其余作为数据盘（提升文件管理效率）。', 'f', '22.599319444444443,114.03425555555556', '2112123AC', 0.00, '2025:06:06 17:55:24');
INSERT INTO "public"."photo" VALUES (46, '00a4a04dc1e346a8a0a4240338ac909a_1750874985543.webp', '/Zaohu/2025/photo/06/00a4a04dc1e346a8a0a4240338ac909a_1750874985543.webp', 13, 'f', '2025-06-26 02:09:45.545244', '我似乎梦见', '当 C 盘空间使用率超过 80% 时，SSD 的剩余可用空间减少，可能因垃圾回收机制（GC）效率下降导致速度轻微变慢。1TB 硬盘因初始空间更大，可延缓这一现象。
若 C 盘用于存储大量临时文件或频繁读写的数据（如虚拟机文件），1TB 空间可减少碎片化存储，间接提升文件访问效率。', 'f', NULL, 'asd', NULL, NULL);
INSERT INTO "public"."photo" VALUES (44, '645ba59a415246ce9794667d29a3e296_1750874985516.webp', '/Zaohu/2025/photo/06/645ba59a415246ce9794667d29a3e296_1750874985516.webp', 13, 'f', '2025-06-26 02:09:45.519334', '灰蒙蒙的视线', '存）频繁读写，尤其对多开软件、游戏多线程运行有帮助。
系统更新与备份：Windows 更新或系统还原点占用空间较大，1TB 可避免因空间不足导致的更新失败，间接提升系统稳定性。
大型文件操作：如视频剪辑、3D 渲染时，临时文件存储在 C 盘，1TB 空间可减少因空间不足导致的操作中断。', 'f', NULL, 'erwerwr', NULL, NULL);
INSERT INTO "public"."photo" VALUES (45, 'd76c98aba9ff4ad9943565d7cc3654ca_1750874985530.webp', '/Zaohu/2025/photo/06/d76c98aba9ff4ad9943565d7cc3654ca_1750874985530.webp', 13, 'f', '2025-06-26 02:09:45.531242', '不知不觉忘记了目的地', '晨曦微露时，风掠过梧桐叶梢，抖落几滴晶莹露珠。街角的咖啡摊飘来醇厚香气，自行车铃在石板路上清脆回响。云朵像被揉碎的棉絮，在淡蓝天空缓缓舒展，远处钟楼的指针悄悄划过刻度，将晨光剪成细碎的金箔，撒在行人肩头，编织出一天的温柔序章。', 'f', NULL, 'sdf', NULL, NULL);
INSERT INTO "public"."photo" VALUES (43, '5d2ce632b7a541b9bee5d0807c8ee355_1750874985500.webp', '/Zaohu/2025/photo/06/5d2ce632b7a541b9bee5d0807c8ee355_1750874985500.webp', 13, 't', '2025-06-26 02:09:45.504242', '我爱你', 'video:41kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: unknown', 'f', NULL, 'dsgertw', NULL, NULL);
INSERT INTO "public"."photo" VALUES (41, '69aad7a169724dcd9ef8f5d8c3b5d588_1750874954169.webp', '/Zaohu/2025/photo/06/69aad7a169724dcd9ef8f5d8c3b5d588_1750874954169.webp', 13, 'f', '2025-06-26 02:09:14.175594', 'Love You Baby', '      cpb: bitrate max/min/avg: 0/0/200000 buffer size: 0 vbv_delay: N/A', 'f', NULL, 'ILCE-7S', NULL, '2017:02:19 14:53:52');
INSERT INTO "public"."photo" VALUES (42, 'ddb8f0af0e9444babd722890ed26685f_1750874954193.webp', '/Zaohu/2025/photo/06/ddb8f0af0e9444babd722890ed26685f_1750874954193.webp', 13, 'f', '2025-06-26 02:09:14.198311', '再次爱上你', 'frame=    1 fps=0.0 q=6.2 Lsize=N/A time=00:00:00.04 bitrate=N/A speed=0.286x    ', 'f', NULL, 'iPhone 8 Plus', NULL, '2019:12:23 15:19:02');
INSERT INTO "public"."photo" VALUES (48, '水果', '/Zaohu/2025/photo/06/7d4bb0027e6c46c389b22b781730e336_1751056589730.webp', 29, 'f', '2025-06-28 04:36:29.948791', '是你让我拍的水果', '你让我拍的', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."photo" VALUES (49, '123', '/Zaohu/2025/photo/06/dcbfcbdbf8e74d148889c8c72a0488ac_1751056663562.webp', 29, 'f', '2025-06-28 04:37:43.688073', '123', '33333', 'f', NULL, 'Canon EOS 5D Mark III', NULL, '2020:03:26 13:19:02');
INSERT INTO "public"."photo" VALUES (50, '311be8d7a11c41c8aa27e74d5409d703_1751056773511.webp', '/Zaohu/2025/photo/06/311be8d7a11c41c8aa27e74d5409d703_1751056773511.webp', 29, 'f', '2025-06-28 04:39:33.515844', NULL, NULL, 'f', NULL, 'iPhone 8 Plus', NULL, '2019:12:23 15:19:02');
INSERT INTO "public"."photo" VALUES (51, 'ba4296773e06464996dfd4fe4df3c19f_1751056773528.webp', '/Zaohu/2025/photo/06/ba4296773e06464996dfd4fe4df3c19f_1751056773528.webp', 29, 'f', '2025-06-28 04:39:33.530845', NULL, NULL, 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."photo" VALUES (52, '34f32f892fd74ace848e969f21430176_1751056773541.webp', '/Zaohu/2025/photo/06/34f32f892fd74ace848e969f21430176_1751056773541.webp', 29, 'f', '2025-06-28 04:39:33.543845', NULL, NULL, 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."photo" VALUES (54, '的', '/Zaohu/2025/photo/06/abd1032aa7bf4885b50198bd1aa2e820_1751211349432.webp', 31, 'f', '2025-06-29 23:35:49.445807', '231', '3123', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."photo" VALUES (57, 'dasd', '/Zaohu/2025/photo/06/66515e07d93543deb765dca4d7b80f06_1751212168534.webp', 31, 'f', '2025-06-29 23:49:28.742334', 'a放到asdf', 'sdf', 'f', NULL, 'ILCE-7M2', NULL, '2020:09:26 09:01:01');
INSERT INTO "public"."photo" VALUES (58, 'dasd', '/Zaohu/2025/photo/06/a7a2dd83546940a49bb5e51a79e4c8ca_1751212247202.webp', 31, 'f', '2025-06-29 23:50:47.367907', 'a放到asdf', 'sdf', 'f', NULL, 'ILCE-7M2', NULL, '2020:09:26 09:01:01');
INSERT INTO "public"."photo" VALUES (59, '7cd79068de0c45e0a24a6c3f4d748f01_1751212280321.webp', '/Zaohu/2025/photo/06/7cd79068de0c45e0a24a6c3f4d748f01_1751212280321.webp', 31, 'f', '2025-06-29 23:51:20.323017', NULL, NULL, 'f', NULL, 'NIKON D5100', NULL, '2015:11:03 17:32:41');
INSERT INTO "public"."photo" VALUES (60, '489a8e5f35ea40b3a455d54b11da4c1c_1751212280334.webp', '/Zaohu/2025/photo/06/489a8e5f35ea40b3a455d54b11da4c1c_1751212280334.webp', 31, 'f', '2025-06-29 23:51:20.33758', NULL, NULL, 'f', NULL, 'Canon EOS 5D Mark III', NULL, '2020:03:18 15:36:27');
INSERT INTO "public"."photo" VALUES (61, 'fd8effece68043e3b6ec8a0000a70619_1751212280348.webp', '/Zaohu/2025/photo/06/fd8effece68043e3b6ec8a0000a70619_1751212280348.webp', 31, 'f', '2025-06-29 23:51:20.351533', NULL, NULL, 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."photo" VALUES (55, 'dasd', '/Zaohu/2025/photo/07/8331863935ca48b0addef60b0ae89e73_1751345416270.webp', 31, 'f', '2025-07-01 12:50:16.467543', 'a放到asdf', 'sdf', 'f', NULL, 'ILCE-7M2', NULL, '2020:09:26 09:01:01');
INSERT INTO "public"."photo" VALUES (56, 'dasd', '/Zaohu/2025/photo/07/8393e3fc914d463eb7a8d4bf6abc8959_1751345436103.webp', 31, 'f', '2025-07-01 12:50:36.131422', 'a放到asdf', 'sdf', 'f', NULL, 'ILCE-7M2', NULL, '2020:09:26 09:01:01');
INSERT INTO "public"."photo" VALUES (53, '测试1', '/Zaohu/2025/photo/07/1094abbd6cd147c595d3080e29164743_1751345477738.webp', 31, 'f', '2025-07-01 12:51:17.752354', '测试短语', '测试回忆', 'f', NULL, 'FC6310', NULL, '2019:09:15 17:12:26');
INSERT INTO "public"."photo" VALUES (87, '雨后清晨阳光', '/Zaohu/2025/photo/10/a9aa022e3c97482cbd6ee28f8b658cd9_1760557324064.webp', 268, 'f', '2025-10-16 03:42:04.128239', '粉紫色天空', '去阳台山被雨淋回来了 但是一会天晴了 看到了粉紫色的倾城', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."photo" VALUES (88, '粉紫色天空1', '/Zaohu/2025/photo/10/57c88d885fef46d0862996cac32e4958_1760557354556.webp', 268, 'f', '2025-10-16 03:42:34.564746', '粉紫色天空另一个视角', '去阳台山被雨淋回来了 但是一会天晴了 看到了粉紫色的倾城', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."photo" VALUES (89, '粉紫色天空2', '/Zaohu/2025/photo/10/da8b886e38884427bbe36130128151c3_1760557407221.webp', 268, 'f', '2025-10-16 03:43:27.227181', '粉紫色天空第三个时间', '去阳台山被雨淋回来了 但是一会天晴了 看到了粉紫色的倾城', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."photo" VALUES (90, '雨中中国', '/Zaohu/2025/photo/10/fba2463a6119431ea59ab563d4668c37_1760557449704.webp', 268, 'f', '2025-10-16 03:44:09.710535', '坚毅不倒', '去阳台山，下雨在公交车厅躲雨', 'f', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for photo_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."photo_type";
CREATE TABLE "public"."photo_type" (
  "id" int4 NOT NULL DEFAULT nextval('photo_type_id_seq'::regclass),
  "type_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "phrase" varchar(255) COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "photo_count" int4 DEFAULT 0,
  "favorite_count" int4 DEFAULT 0,
  "sort_order" int4 DEFAULT 0,
  "is_hidden" bool DEFAULT false,
  "main_photo" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."photo_type"."id" IS '类型ID';
COMMENT ON COLUMN "public"."photo_type"."type_name" IS '类型名称';
COMMENT ON COLUMN "public"."photo_type"."phrase" IS '短语';
COMMENT ON COLUMN "public"."photo_type"."update_time" IS '更新时间（格式：yyyy-MM-dd HH:mm:ss）';
COMMENT ON COLUMN "public"."photo_type"."photo_count" IS '照片数量';
COMMENT ON COLUMN "public"."photo_type"."favorite_count" IS '珍藏数量';
COMMENT ON COLUMN "public"."photo_type"."sort_order" IS '排序';
COMMENT ON COLUMN "public"."photo_type"."is_hidden" IS '是否隐藏该类型';
COMMENT ON COLUMN "public"."photo_type"."main_photo" IS '类型的主照片路径，用于封面展示';
COMMENT ON TABLE "public"."photo_type" IS '照片类型表，用于分类照片（如风景、人像等）';

-- ----------------------------
-- Records of photo_type
-- ----------------------------
INSERT INTO "public"."photo_type" VALUES (173, '航拍摄影_167', '专业构图', '2023-01-11 06:11:04.306699', 549, 881, 167, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (239, '城市摄影_233', '怀旧表达', '2023-12-03 01:49:58.835323', 549, 693, 233, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (35, '纪实摄影_29', '大师级灵感', '2023-04-23 17:24:28.666081', 549, 37, 29, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (77, '静物摄影_71', '珍贵发现', '2024-01-30 14:09:32.235969', 549, 1413, 71, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (175, '植物摄影_169', '大师级灵感', '2023-05-20 12:18:52.155746', 549, 1319, 169, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (233, '航拍摄影_227', '专业构图', '2024-02-14 03:49:06.075367', 549, 1489, 227, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (179, '城市摄影_173', '怀旧表达', '2023-12-30 18:46:41.585483', 549, 971, 173, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (235, '植物摄影_229', '大师级灵感', '2024-06-05 08:51:25.972413', 549, 823, 229, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (119, '城市摄影_113', '怀旧表达', '2023-07-11 22:57:12.006205', 549, 757, 113, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (205, '植物摄影_199', '细腻美学', '2023-11-16 22:08:35.367814', 549, 673, 199, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (79, '婚礼摄影_73', '怀旧表达', '2023-08-11 15:49:13.603194', 549, 1306, 73, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (211, '科技摄影_205', '独特色彩', '2023-02-23 17:36:13.459583', 549, 394, 205, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (5, '珍忆', '"看到你好开心"', NULL, 549, 0, 99, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (113, '航拍摄影_107', '专业构图', '2024-02-10 20:01:32.471786', 549, 269, 107, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (109, '婚礼摄影_103', '唯美记忆', '2023-06-15 10:47:42.038153', 549, 1131, 103, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (203, '航拍摄影_197', '柔和技术', '2023-09-03 21:20:05.797739', 549, 1353, 197, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (199, '婚礼摄影_193', '怀旧表达', '2023-08-06 09:32:20.547708', 549, 952, 193, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (197, '静物摄影_191', '珍贵发现', '2023-04-09 00:28:12.286201', 549, 1528, 191, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (107, '静物摄影_101', '震撼世界', '2023-12-25 21:55:14.928209', 549, 1125, 101, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (25, '植物摄影_19', '细腻美学', '2024-04-04 07:26:58.658807', 549, 568, 19, 't', '/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg');
INSERT INTO "public"."photo_type" VALUES (29, '城市摄影_23', '唯美记忆', '2023-10-22 09:10:52.903607', 549, 692, 23, 't', '/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg');
INSERT INTO "public"."photo_type" VALUES (41, '街拍摄影_35', '清新视角', '2023-02-17 20:45:37.543559', 549, 1883, 35, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (37, '人像摄影_31', '珍贵发现', '2024-08-20 00:53:04.080558', 549, 1820, 31, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (53, '航拍摄影_47', '专业构图', '2024-03-03 08:30:51.112957', 549, 63, 47, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (181, '科技摄影_175', '清新视角', '2023-01-26 15:12:46.309659', 549, 1008, 175, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (61, '科技摄影_55', '清新视角', '2023-10-06 13:17:59.763172', 549, 594, 55, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (133, '微距摄影_127', '专业构图', '2023-03-10 20:12:54.973131', 549, 632, 127, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (229, '婚礼摄影_223', '唯美记忆', '2024-05-26 16:58:50.442615', 549, 483, 223, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (245, '纪实摄影_239', '细腻美学', '2023-09-01 18:15:35.13196', 549, 1642, 239, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (185, '纪实摄影_179', '细腻美学', '2024-03-18 16:57:39.45146', 549, 1417, 179, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (161, '街拍摄影_155', '清新视角', '2024-02-28 01:05:41.529767', 549, 308, 155, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (137, '静物摄影_131', '珍贵发现', '2024-04-04 12:24:48.379105', 549, 30, 131, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (257, '静物摄影_251', '珍贵发现', '2023-07-28 08:56:33.287542', 549, 276, 251, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (169, '婚礼摄影_163', '唯美记忆', '2023-07-11 02:07:57.349593', 549, 1141, 163, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (209, '城市摄影_203', '唯美记忆', '2023-12-09 10:49:07.618811', 549, 1877, 203, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (55, '植物摄影_49', '大师级灵感', '2024-04-07 00:36:22.92679', 549, 623, 49, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (17, '静物摄影_11', '珍贵发现', '2024-01-18 11:19:15.660301', 549, 269, 11, 't', '/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg');
INSERT INTO "public"."photo_type" VALUES (13, '微距摄影_7', '专业构图', '2023-05-08 16:43:17.943215', 549, 692, 7, 't', '/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg');
INSERT INTO "public"."photo_type" VALUES (223, '微距摄影_217', '柔和技术', '2023-09-30 19:19:55.500103', 549, 132, 217, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (23, '航拍摄影_17', '柔和技术', '2023-06-02 05:01:36.197731', 549, 1907, 17, 't', '/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg');
INSERT INTO "public"."photo_type" VALUES (157, '人像摄影_151', '珍贵发现', '2023-08-15 07:04:22.383576', 549, 1453, 151, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (253, '微距摄影_247', '专业构图', '2023-01-02 20:17:11.979928', 549, 675, 247, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (131, '街拍摄影_125', '独特色彩', '2024-06-12 12:24:20.052292', 549, 1181, 125, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (217, '人像摄影_211', '珍贵发现', '2024-07-29 04:51:37.179118', 549, 606, 211, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (221, '街拍摄影_215', '清新视角', '2024-05-18 08:01:04.41322', 549, 751, 215, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (193, '微距摄影_187', '专业构图', '2023-04-05 16:40:43.503977', 549, 1680, 187, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (191, '街拍摄影_185', '独特色彩', '2023-03-14 01:36:36.944367', 549, 190, 185, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (19, '婚礼摄影_13', '怀旧表达', '2024-02-06 09:37:10.564383', 549, 1900, 13, 't', '/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg');
INSERT INTO "public"."photo_type" VALUES (49, '婚礼摄影_43', '唯美记忆', '2023-04-14 03:32:29.381418', 549, 358, 43, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (103, '微距摄影_97', '柔和技术', '2023-09-29 15:59:25.688115', 549, 1757, 97, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (95, '纪实摄影_89', '大师级灵感', '2023-03-17 01:00:49.170207', 549, 1291, 89, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (227, '静物摄影_221', '震撼世界', '2023-09-17 01:43:06.327293', 549, 850, 221, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (263, 'fff', 'fff', NULL, 549, 0, 102, 'f', '/Zaohu/2025/photo/fea5299e71594442bde7510e795655b6_1749018937900.jpg');
INSERT INTO "public"."photo_type" VALUES (43, '微距摄影_37', '柔和技术', '2024-01-19 21:41:06.03699', 549, 1850, 37, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (47, '静物摄影_41', '震撼世界', '2024-02-24 00:11:30.45487', 549, 1734, 41, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (89, '城市摄影_83', '唯美记忆', '2024-04-02 23:34:59.12734', 549, 1860, 83, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (127, '人像摄影_121', '震撼世界', '2023-09-07 21:57:02.391287', 549, 261, 121, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (125, '纪实摄影_119', '细腻美学', '2023-03-06 09:40:58.526076', 549, 304, 119, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (101, '街拍摄影_95', '清新视角', '2023-01-07 09:07:25.007653', 549, 615, 95, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (121, '科技摄影_115', '清新视角', '2024-06-02 11:24:35.718355', 549, 635, 115, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (97, '人像摄影_91', '珍贵发现', '2024-02-08 20:30:58.372667', 549, 645, 91, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (247, '人像摄影_241', '震撼世界', '2023-01-04 06:26:50.306864', 549, 298, 241, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (91, '科技摄影_85', '独特色彩', '2024-03-07 09:20:05.641706', 549, 24, 85, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (215, '纪实摄影_209', '大师级灵感', '2024-03-14 03:28:37.059946', 549, 1572, 209, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (187, '人像摄影_181', '震撼世界', '2023-04-03 04:41:40.222571', 549, 6, 181, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (59, '城市摄影_53', '怀旧表达', '2023-10-04 01:28:54.952664', 549, 270, 53, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (265, 'we', 'we', NULL, 549, 0, 12, 't', '/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg');
INSERT INTO "public"."photo_type" VALUES (251, '街拍摄影_245', '独特色彩', '2024-02-26 19:40:03.609336', 549, 1252, 245, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (31, '科技摄影_25', '独特色彩', '2023-10-29 06:05:28.556047', 553, 1060, 25, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (139, '婚礼摄影_133', '怀旧表达', '2023-05-24 00:17:32.707415', 549, 1183, 133, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (259, '婚礼摄影_253', '怀旧表达', '2023-08-26 11:19:16.528937', 549, 622, 253, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (167, '静物摄影_161', '震撼世界', '2024-06-28 10:02:17.62601', 549, 848, 161, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (163, '微距摄影_157', '柔和技术', '2024-05-02 18:09:43.383749', 549, 1321, 157, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (143, '航拍摄影_137', '柔和技术', '2024-06-25 22:14:54.899938', 549, 730, 137, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (67, '人像摄影_61', '震撼世界', '2023-12-16 13:22:33.413597', 549, 1764, 61, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (155, '纪实摄影_149', '大师级灵感', '2024-08-08 15:39:07.716741', 549, 1024, 149, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (151, '科技摄影_145', '独特色彩', '2023-01-04 07:15:55.232665', 549, 168, 145, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (115, '植物摄影_109', '大师级灵感', '2023-09-08 20:13:16.45538', 549, 691, 109, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (85, '植物摄影_79', '细腻美学', '2024-08-08 11:00:38.512371', 549, 1332, 79, 't', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (241, '科技摄影_235', '清新视角', '2023-12-12 05:48:08.559201', 549, 1067, 235, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (145, '植物摄影_139', '细腻美学', '2023-10-24 22:37:39.835637', 549, 1856, 139, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (149, '城市摄影_143', '唯美记忆', '2024-02-16 12:08:06.238162', 549, 334, 143, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (83, '航拍摄影_77', '柔和技术', '2023-03-20 07:15:09.193804', 549, 621, 77, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (71, '街拍摄影_65', '独特色彩', '2023-09-05 14:48:21.665747', 549, 1068, 65, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (73, '微距摄影_67', '专业构图', '2023-07-02 13:54:14.203663', 549, 674, 67, 'f', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO "public"."photo_type" VALUES (268, '我的手机oppo ACE', '高度散光患者', NULL, 4, 0, 10, 't', '/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS "public"."role";
CREATE TABLE "public"."role" (
  "role_id" int8 NOT NULL DEFAULT nextval('role_role_id_seq'::regclass),
  "role_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."role"."role_id" IS '角色ID主键';
COMMENT ON COLUMN "public"."role"."role_name" IS '角色名';
COMMENT ON TABLE "public"."role" IS '角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO "public"."role" VALUES (1000, 'admin');
INSERT INTO "public"."role" VALUES (1001, 'cto');
INSERT INTO "public"."role" VALUES (1002, 'cfo');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_permission";
CREATE TABLE "public"."role_permission" (
  "role_id" int8 NOT NULL,
  "permission_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."role_permission"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."role_permission"."permission_id" IS '权限ID';
COMMENT ON TABLE "public"."role_permission" IS '角色权限关联表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO "public"."role_permission" VALUES (1001, 1000);
INSERT INTO "public"."role_permission" VALUES (1001, 1001);

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS "public"."storage";
CREATE TABLE "public"."storage" (
  "id" int8 NOT NULL DEFAULT nextval('storage_id_seq'::regclass),
  "commodity_code" varchar(255) COLLATE "pg_catalog"."default",
  "count" int4 DEFAULT 0,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."storage"."id" IS '主键ID';
COMMENT ON COLUMN "public"."storage"."commodity_code" IS '商品编码';
COMMENT ON COLUMN "public"."storage"."count" IS '库存数量';
COMMENT ON COLUMN "public"."storage"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."storage"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."storage" IS '库存表';

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO "public"."storage" VALUES (1, '1', 59, '2024-08-07 22:48:29', '2024-11-10 17:10:07');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."tag";
CREATE TABLE "public"."tag" (
  "id" int4 NOT NULL DEFAULT nextval('tag_id_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "color" varchar(20) COLLATE "pg_catalog"."default",
  "sort_no" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."tag"."id" IS '主键ID';
COMMENT ON COLUMN "public"."tag"."name" IS '标签名称';
COMMENT ON COLUMN "public"."tag"."color" IS '展示颜色';
COMMENT ON COLUMN "public"."tag"."sort_no" IS '展示顺序';
COMMENT ON TABLE "public"."tag" IS '标签表';

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for tag_relation
-- ----------------------------
DROP TABLE IF EXISTS "public"."tag_relation";
CREATE TABLE "public"."tag_relation" (
  "article_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "tag_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."tag_relation"."article_id" IS '其他ID';
COMMENT ON COLUMN "public"."tag_relation"."tag_id" IS '标签ID';
COMMENT ON TABLE "public"."tag_relation" IS '标签关联表';

-- ----------------------------
-- Records of tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for todo
-- ----------------------------
DROP TABLE IF EXISTS "public"."todo";
CREATE TABLE "public"."todo" (
  "id" int4 NOT NULL DEFAULT nextval('todo_id_seq'::regclass),
  "content" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "is_done" bool NOT NULL DEFAULT false,
  "sort_no" int4 DEFAULT 0,
  "type_id" int4 NOT NULL,
  "extra_info" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamptz(6) NOT NULL DEFAULT now()
)
;
COMMENT ON COLUMN "public"."todo"."id" IS '主键ID';
COMMENT ON COLUMN "public"."todo"."content" IS '代办内容';
COMMENT ON COLUMN "public"."todo"."is_done" IS '是否完成';
COMMENT ON COLUMN "public"."todo"."sort_no" IS '展示顺序';
COMMENT ON COLUMN "public"."todo"."type_id" IS '分类：1开发，2生活';
COMMENT ON COLUMN "public"."todo"."extra_info" IS '补充信息';
COMMENT ON COLUMN "public"."todo"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."todo" IS '待办表';

-- ----------------------------
-- Records of todo
-- ----------------------------

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS "public"."type";
CREATE TABLE "public"."type" (
  "id" int4 NOT NULL DEFAULT nextval('type_id_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "sort_no" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."type"."id" IS '主键ID';
COMMENT ON COLUMN "public"."type"."name" IS '类型名称';
COMMENT ON COLUMN "public"."type"."icon" IS '类型图标路径或URL';
COMMENT ON COLUMN "public"."type"."sort_no" IS '展示顺序';
COMMENT ON TABLE "public"."type" IS '类型表';

-- ----------------------------
-- Records of type
-- ----------------------------

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."undo_log";
CREATE TABLE "public"."undo_log" (
  "id" int8 NOT NULL DEFAULT nextval('undo_log_id_seq'::regclass),
  "branch_id" int8 NOT NULL,
  "xid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "context" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "rollback_info" bytea NOT NULL,
  "log_status" int4 NOT NULL,
  "log_created" timestamp(6) NOT NULL,
  "log_modified" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."undo_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."undo_log"."branch_id" IS '分支事务ID';
COMMENT ON COLUMN "public"."undo_log"."xid" IS '全局事务ID';
COMMENT ON COLUMN "public"."undo_log"."context" IS '上下文信息';
COMMENT ON COLUMN "public"."undo_log"."rollback_info" IS '回滚信息';
COMMENT ON COLUMN "public"."undo_log"."log_status" IS '日志状态';
COMMENT ON COLUMN "public"."undo_log"."log_created" IS '日志创建时间';
COMMENT ON COLUMN "public"."undo_log"."log_modified" IS '日志修改时间';
COMMENT ON TABLE "public"."undo_log" IS '全局事务回滚日志表';

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
  "user_id" int8 NOT NULL DEFAULT nextval('user_user_id_seq'::regclass),
  "phone" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "login_date" timestamp(6),
  "email" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."user"."user_id" IS '用户ID主键';
COMMENT ON COLUMN "public"."user"."phone" IS '手机号，唯一';
COMMENT ON COLUMN "public"."user"."password" IS '密码';
COMMENT ON COLUMN "public"."user"."username" IS '用户名';
COMMENT ON COLUMN "public"."user"."login_date" IS '上次登陆时间';
COMMENT ON COLUMN "public"."user"."email" IS '邮箱';
COMMENT ON TABLE "public"."user" IS '用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "public"."user" VALUES (1003, '1111111111', '$2a$10$Bn2Y1b6uU8.TdLRjVhXXdeUo88atqEdH6znxQhdz43I5K3aJnEmFq', '123', NULL, '188688888@qq.com');
INSERT INTO "public"."user" VALUES (1004, '16652851893', '$2a$10$1Nt3Z9FYcuAwsOCbX/4eH.jehCy9DAwCm53ay0cqMq7AhCxMLUQZG', '铁汉柔情', NULL, '1231231232@qq.com');
INSERT INTO "public"."user" VALUES (1, '13202553394', '$2a$10$1g0BCK9q.ylVwv3ZMDzRLuSFfUtzmaWm4/MgvDGYREmUhRf8BPPwq', 'aaa', NULL, '2134484173@qq.com');
INSERT INTO "public"."user" VALUES (1000, '16652851892', '$2a$10$C/l0kilAwIb5tRohhJGCJOJcrruu0G8QJfpm81VmBZWtW0PB55yZe', '铁汉柔情', NULL, '3331247124@qq.com');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_role";
CREATE TABLE "public"."user_role" (
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."user_role"."role_id" IS '角色ID';
COMMENT ON TABLE "public"."user_role" IS '用户角色关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO "public"."user_role" VALUES (1000, 1000);
INSERT INTO "public"."user_role" VALUES (1000, 1001);
INSERT INTO "public"."user_role" VALUES (1000, 1002);

-- ----------------------------
-- Table structure for visit_num
-- ----------------------------
DROP TABLE IF EXISTS "public"."visit_num";
CREATE TABLE "public"."visit_num" (
  "id" int8 NOT NULL DEFAULT nextval('visit_num_id_seq'::regclass),
  "visit_num" int4
)
;
COMMENT ON COLUMN "public"."visit_num"."id" IS '主键ID';
COMMENT ON COLUMN "public"."visit_num"."visit_num" IS '接口访问次数';
COMMENT ON TABLE "public"."visit_num" IS '访问数量';

-- ----------------------------
-- Records of visit_num
-- ----------------------------
INSERT INTO "public"."visit_num" VALUES (1, 315);

-- ----------------------------
-- Table structure for weather
-- ----------------------------
DROP TABLE IF EXISTS "public"."weather";
CREATE TABLE "public"."weather" (
  "id" int4 NOT NULL DEFAULT nextval('weather_id_seq'::regclass),
  "label" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "icon" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."weather"."id" IS '主键ID';
COMMENT ON COLUMN "public"."weather"."label" IS '天气描述';
COMMENT ON COLUMN "public"."weather"."icon" IS '天气图标路径或URL';
COMMENT ON TABLE "public"."weather" IS '天气表';

-- ----------------------------
-- Records of weather
-- ----------------------------

-- ----------------------------
-- Procedure structure for add_columnstore_policy
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."add_columnstore_policy"("hypertable" regclass, "after" any, "if_not_exists" bool, "schedule_interval" interval, "initial_start" timestamptz, "timezone" text, "created_before" interval);
CREATE PROCEDURE "public"."add_columnstore_policy"("hypertable" regclass, "after" any=NULL::unknown, "if_not_exists" bool=false, "schedule_interval" interval=NULL::interval, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "created_before" interval=NULL::interval)
 AS '$libdir/timescaledb-2.23.1', 'ts_policy_compression_add'
  LANGUAGE c;

-- ----------------------------
-- Function structure for add_compression_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_compression_policy"("hypertable" regclass, "compress_after" any, "if_not_exists" bool, "schedule_interval" interval, "initial_start" timestamptz, "timezone" text, "compress_created_before" interval);
CREATE FUNCTION "public"."add_compression_policy"("hypertable" regclass, "compress_after" any=NULL::unknown, "if_not_exists" bool=false, "schedule_interval" interval=NULL::interval, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "compress_created_before" interval=NULL::interval)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_policy_compression_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for add_continuous_aggregate_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_continuous_aggregate_policy"("continuous_aggregate" regclass, "start_offset" any, "end_offset" any, "schedule_interval" interval, "if_not_exists" bool, "initial_start" timestamptz, "timezone" text, "include_tiered_data" bool, "buckets_per_batch" int4, "max_batches_per_execution" int4, "refresh_newest_first" bool);
CREATE FUNCTION "public"."add_continuous_aggregate_policy"("continuous_aggregate" regclass, "start_offset" any, "end_offset" any, "schedule_interval" interval, "if_not_exists" bool=false, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "include_tiered_data" bool=NULL::boolean, "buckets_per_batch" int4=NULL::integer, "max_batches_per_execution" int4=NULL::integer, "refresh_newest_first" bool=NULL::boolean)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_policy_refresh_cagg_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for add_dimension
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_dimension"("hypertable" regclass, "column_name" name, "number_partitions" int4, "chunk_time_interval" anyelement, "partitioning_func" regproc, "if_not_exists" bool);
CREATE FUNCTION "public"."add_dimension"("hypertable" regclass, "column_name" name, "number_partitions" int4=NULL::integer, "chunk_time_interval" anyelement=NULL::bigint, "partitioning_func" regproc=NULL::regproc, "if_not_exists" bool=false)
  RETURNS TABLE("dimension_id" int4, "schema_name" name, "table_name" name, "column_name" name, "created" bool) AS '$libdir/timescaledb-2.23.1', 'ts_dimension_add'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for add_dimension
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_dimension"("hypertable" regclass, "dimension" "_timescaledb_internal"."dimension_info", "if_not_exists" bool);
CREATE FUNCTION "public"."add_dimension"("hypertable" regclass, "dimension" "_timescaledb_internal"."dimension_info", "if_not_exists" bool=false)
  RETURNS TABLE("dimension_id" int4, "created" bool) AS '$libdir/timescaledb-2.23.1', 'ts_dimension_add_general'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for add_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_job"("proc" regproc, "schedule_interval" interval, "config" jsonb, "initial_start" timestamptz, "scheduled" bool, "check_config" regproc, "fixed_schedule" bool, "timezone" text, "job_name" text);
CREATE FUNCTION "public"."add_job"("proc" regproc, "schedule_interval" interval, "config" jsonb=NULL::jsonb, "initial_start" timestamptz=NULL::timestamp with time zone, "scheduled" bool=true, "check_config" regproc=NULL::regproc, "fixed_schedule" bool=true, "timezone" text=NULL::text, "job_name" text=NULL::text)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_job_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for add_process_hypertable_invalidations_policy
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."add_process_hypertable_invalidations_policy"("hypertable" regclass, "schedule_interval" interval, "if_not_exists" bool, "initial_start" timestamptz, "timezone" text);
CREATE PROCEDURE "public"."add_process_hypertable_invalidations_policy"("hypertable" regclass, "schedule_interval" interval, "if_not_exists" bool=false, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text)
 AS '$libdir/timescaledb-2.23.1', 'ts_policy_process_hyper_inval_add'
  LANGUAGE c;

-- ----------------------------
-- Function structure for add_reorder_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_reorder_policy"("hypertable" regclass, "index_name" name, "if_not_exists" bool, "initial_start" timestamptz, "timezone" text);
CREATE FUNCTION "public"."add_reorder_policy"("hypertable" regclass, "index_name" name, "if_not_exists" bool=false, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_policy_reorder_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for add_retention_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_retention_policy"("relation" regclass, "drop_after" any, "if_not_exists" bool, "schedule_interval" interval, "initial_start" timestamptz, "timezone" text, "drop_created_before" interval);
CREATE FUNCTION "public"."add_retention_policy"("relation" regclass, "drop_after" any=NULL::unknown, "if_not_exists" bool=false, "schedule_interval" interval=NULL::interval, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "drop_created_before" interval=NULL::interval)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_policy_retention_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for alter_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."alter_job"("job_id" int4, "schedule_interval" interval, "max_runtime" interval, "max_retries" int4, "retry_period" interval, "scheduled" bool, "config" jsonb, "next_start" timestamptz, "if_exists" bool, "check_config" regproc, "fixed_schedule" bool, "initial_start" timestamptz, "timezone" text, "job_name" text);
CREATE FUNCTION "public"."alter_job"("job_id" int4, "schedule_interval" interval=NULL::interval, "max_runtime" interval=NULL::interval, "max_retries" int4=NULL::integer, "retry_period" interval=NULL::interval, "scheduled" bool=NULL::boolean, "config" jsonb=NULL::jsonb, "next_start" timestamptz=NULL::timestamp with time zone, "if_exists" bool=false, "check_config" regproc=NULL::regproc, "fixed_schedule" bool=NULL::boolean, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "job_name" text=NULL::text)
  RETURNS TABLE("job_id" int4, "schedule_interval" interval, "max_runtime" interval, "max_retries" int4, "retry_period" interval, "scheduled" bool, "config" jsonb, "next_start" timestamptz, "check_config" text, "fixed_schedule" bool, "initial_start" timestamptz, "timezone" text, "application_name" name) AS '$libdir/timescaledb-2.23.1', 'ts_job_alter'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for approximate_row_count
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."approximate_row_count"("relation" regclass);
CREATE FUNCTION "public"."approximate_row_count"("relation" regclass)
  RETURNS "pg_catalog"."int8" AS $BODY$
DECLARE
    v_mat_ht REGCLASS = NULL;
    v_name NAME = NULL;
    v_schema NAME = NULL;
    v_hypertable_id INTEGER;
BEGIN
    -- Check if input relation is continuous aggregate view then
    -- get the corresponding materialized hypertable and schema name
    SELECT format('%I.%I', ht.schema_name, ht.table_name)::regclass INTO v_mat_ht
      FROM pg_class c
      JOIN pg_namespace n ON (n.OID = c.relnamespace)
      JOIN _timescaledb_catalog.continuous_agg a ON (a.user_view_schema = n.nspname AND a.user_view_name = c.relname)
      JOIN _timescaledb_catalog.hypertable ht ON (a.mat_hypertable_id = ht.id)
      WHERE c.OID = relation;

    IF FOUND THEN
        relation = v_mat_ht;
    END IF;

    SELECT nspname, relname FROM pg_class c
    INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
    INTO v_schema, v_name
    WHERE c.OID = relation;

    -- for hypertables return the sum of the row counts of all chunks
    SELECT id FROM _timescaledb_catalog.hypertable INTO v_hypertable_id WHERE table_name = v_name AND schema_name = v_schema;
    IF FOUND THEN
        RETURN (SELECT coalesce(sum(_timescaledb_functions.get_approx_row_count(format('%I.%I',schema_name,table_name))),0)
          FROM _timescaledb_catalog.chunk
          WHERE hypertable_id = v_hypertable_id AND NOT dropped);
    END IF;

		IF EXISTS (SELECT FROM pg_inherits WHERE inhparent = relation) THEN
		RETURN (
        SELECT _timescaledb_functions.get_approx_row_count(relation) + COALESCE(SUM(public.approximate_row_count(i.inhrelid)),0) FROM pg_inherits i
        WHERE i.inhparent = relation
     );
    END IF;

    -- Check for input relation is Plain RELATION
    RETURN _timescaledb_functions.get_approx_row_count(relation);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Procedure structure for attach_chunk
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."attach_chunk"("hypertable" regclass, "chunk" regclass, "slices" jsonb);
CREATE PROCEDURE "public"."attach_chunk"("hypertable" regclass, "chunk" regclass, "slices" jsonb)
 AS '$libdir/timescaledb-2.23.1', 'ts_attach_chunk'
  LANGUAGE c;

-- ----------------------------
-- Function structure for attach_tablespace
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."attach_tablespace"("tablespace" name, "hypertable" regclass, "if_not_attached" bool);
CREATE FUNCTION "public"."attach_tablespace"("tablespace" name, "hypertable" regclass, "if_not_attached" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_tablespace_attach'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for by_hash
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."by_hash"("column_name" name, "number_partitions" int4, "partition_func" regproc);
CREATE FUNCTION "public"."by_hash"("column_name" name, "number_partitions" int4, "partition_func" regproc=NULL::regproc)
  RETURNS "_timescaledb_internal"."dimension_info" AS '$libdir/timescaledb-2.23.1', 'ts_hash_dimension'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for by_range
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."by_range"("column_name" name, "partition_interval" anyelement, "partition_func" regproc);
CREATE FUNCTION "public"."by_range"("column_name" name, "partition_interval" anyelement=NULL::bigint, "partition_func" regproc=NULL::regproc)
  RETURNS "_timescaledb_internal"."dimension_info" AS '$libdir/timescaledb-2.23.1', 'ts_range_dimension'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for cagg_migrate
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."cagg_migrate"("cagg" regclass, "override" bool, "drop_old" bool);
CREATE PROCEDURE "public"."cagg_migrate"("cagg" regclass, "override" bool=false, "drop_old" bool=false)
 AS $BODY$
DECLARE
    _cagg_schema TEXT;
    _cagg_name TEXT;
    _cagg_name_new TEXT;
    _cagg_data _timescaledb_catalog.continuous_agg;
BEGIN
    -- procedures with SET clause cannot execute transaction
    -- control so we adjust search_path in procedure body
    SET LOCAL search_path TO pg_catalog, pg_temp;

    SELECT nspname, relname
    INTO _cagg_schema, _cagg_name
    FROM pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON pg_namespace.oid OPERATOR(pg_catalog.=) pg_class.relnamespace
    WHERE pg_class.oid OPERATOR(pg_catalog.=) cagg::pg_catalog.oid;

    -- maximum size of an identifier in Postgres is 63 characters, se we need to left space for '_new'
    _cagg_name_new := pg_catalog.format('%s_new', pg_catalog.substr(_cagg_name, 1, 59));

    -- pre-validate the migration and get some variables
    _cagg_data := _timescaledb_functions.cagg_migrate_pre_validation(_cagg_schema, _cagg_name, _cagg_name_new);

    -- create new migration plan
    CALL _timescaledb_functions.cagg_migrate_create_plan(_cagg_data, _cagg_name_new, override, drop_old);
    COMMIT;

    -- SET LOCAL is only active until end of transaction.
    -- While we could use SET at the start of the function we do not
    -- want to bleed out search_path to caller, so we do SET LOCAL
    -- again after COMMIT
    SET LOCAL search_path TO pg_catalog, pg_temp;

    -- execute the migration plan
    CALL _timescaledb_functions.cagg_migrate_execute_plan(_cagg_data);

    -- Remove chunk metadata when marked as dropped
    PERFORM _timescaledb_functions.remove_dropped_chunk_metadata(_cagg_data.raw_hypertable_id);

    -- finish the migration plan
    UPDATE _timescaledb_catalog.continuous_agg_migrate_plan
    SET end_ts = pg_catalog.clock_timestamp()
    WHERE mat_hypertable_id OPERATOR(pg_catalog.=) _cagg_data.mat_hypertable_id;
END;
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Function structure for chunk_columnstore_stats
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."chunk_columnstore_stats"("hypertable" regclass);
CREATE FUNCTION "public"."chunk_columnstore_stats"("hypertable" regclass)
  RETURNS TABLE("chunk_schema" name, "chunk_name" name, "compression_status" text, "before_compression_table_bytes" int8, "before_compression_index_bytes" int8, "before_compression_toast_bytes" int8, "before_compression_total_bytes" int8, "after_compression_table_bytes" int8, "after_compression_index_bytes" int8, "after_compression_toast_bytes" int8, "after_compression_total_bytes" int8, "node_name" name) AS $BODY$SELECT * FROM public.chunk_compression_stats($1)$BODY$
  LANGUAGE sql STABLE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for chunk_compression_stats
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."chunk_compression_stats"("hypertable" regclass);
CREATE FUNCTION "public"."chunk_compression_stats"("hypertable" regclass)
  RETURNS TABLE("chunk_schema" name, "chunk_name" name, "compression_status" text, "before_compression_table_bytes" int8, "before_compression_index_bytes" int8, "before_compression_toast_bytes" int8, "before_compression_total_bytes" int8, "after_compression_table_bytes" int8, "after_compression_index_bytes" int8, "after_compression_toast_bytes" int8, "after_compression_total_bytes" int8, "node_name" name) AS $BODY$
DECLARE
    table_name name;
    schema_name name;
BEGIN
    SELECT
      relname, nspname
    INTO
	    table_name, schema_name
    FROM
        pg_class c
        INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
        INNER JOIN _timescaledb_catalog.hypertable ht ON (ht.schema_name = n.nspname
                AND ht.table_name = c.relname)
    WHERE
        c.OID = hypertable;

    IF table_name IS NULL THEN
	    RETURN;
	END IF;

  RETURN QUERY
  SELECT
      *,
      NULL::name
  FROM
      _timescaledb_functions.compressed_chunk_local_stats(schema_name, table_name);
END;
$BODY$
  LANGUAGE plpgsql STABLE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for chunks_detailed_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."chunks_detailed_size"("hypertable" regclass);
CREATE FUNCTION "public"."chunks_detailed_size"("hypertable" regclass)
  RETURNS TABLE("chunk_schema" name, "chunk_name" name, "table_bytes" int8, "index_bytes" int8, "toast_bytes" int8, "total_bytes" int8, "node_name" name) AS $BODY$
DECLARE
        table_name       NAME;
        schema_name      NAME;
BEGIN
        SELECT relname, nspname
        INTO table_name, schema_name
        FROM pg_class c
        INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
        INNER JOIN _timescaledb_catalog.hypertable ht ON (ht.schema_name = n.nspname AND ht.table_name = c.relname)
        WHERE c.OID = hypertable;

        IF table_name IS NULL THEN
            SELECT h.schema_name, h.table_name
            INTO schema_name, table_name
            FROM pg_class c
            INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
            INNER JOIN _timescaledb_catalog.continuous_agg a ON (a.user_view_schema = n.nspname AND a.user_view_name = c.relname)
            INNER JOIN _timescaledb_catalog.hypertable h ON h.id = a.mat_hypertable_id
            WHERE c.OID = hypertable;

            IF table_name IS NULL THEN
                RETURN;
            END IF;
		END IF;

    RETURN QUERY SELECT chl.chunk_schema, chl.chunk_name, chl.table_bytes, chl.index_bytes,
                        chl.toast_bytes, chl.total_bytes, NULL::NAME
            FROM _timescaledb_functions.chunks_local_size(schema_name, table_name) chl;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for compress_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."compress_chunk"("uncompressed_chunk" regclass, "if_not_compressed" bool, "recompress" bool);
CREATE FUNCTION "public"."compress_chunk"("uncompressed_chunk" regclass, "if_not_compressed" bool=true, "recompress" bool=false)
  RETURNS "pg_catalog"."regclass" AS '$libdir/timescaledb-2.23.1', 'ts_compress_chunk'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for convert_to_columnstore
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."convert_to_columnstore"("chunk" regclass, "if_not_columnstore" bool, "recompress" bool);
CREATE PROCEDURE "public"."convert_to_columnstore"("chunk" regclass, "if_not_columnstore" bool=true, "recompress" bool=false)
 AS '$libdir/timescaledb-2.23.1', 'ts_compress_chunk'
  LANGUAGE c;

-- ----------------------------
-- Procedure structure for convert_to_rowstore
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."convert_to_rowstore"("chunk" regclass, "if_columnstore" bool);
CREATE PROCEDURE "public"."convert_to_rowstore"("chunk" regclass, "if_columnstore" bool=true)
 AS '$libdir/timescaledb-2.23.1', 'ts_decompress_chunk'
  LANGUAGE c;

-- ----------------------------
-- Function structure for create_hypertable
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."create_hypertable"("relation" regclass, "time_column_name" name, "partitioning_column" name, "number_partitions" int4, "associated_schema_name" name, "associated_table_prefix" name, "chunk_time_interval" anyelement, "create_default_indexes" bool, "if_not_exists" bool, "partitioning_func" regproc, "migrate_data" bool, "chunk_target_size" text, "chunk_sizing_func" regproc, "time_partitioning_func" regproc);
CREATE FUNCTION "public"."create_hypertable"("relation" regclass, "time_column_name" name, "partitioning_column" name=NULL::name, "number_partitions" int4=NULL::integer, "associated_schema_name" name=NULL::name, "associated_table_prefix" name=NULL::name, "chunk_time_interval" anyelement=NULL::bigint, "create_default_indexes" bool=true, "if_not_exists" bool=false, "partitioning_func" regproc=NULL::regproc, "migrate_data" bool=false, "chunk_target_size" text=NULL::text, "chunk_sizing_func" regproc='_timescaledb_functions.calculate_chunk_interval'::regproc, "time_partitioning_func" regproc=NULL::regproc)
  RETURNS TABLE("hypertable_id" int4, "schema_name" name, "table_name" name, "created" bool) AS '$libdir/timescaledb-2.23.1', 'ts_hypertable_create'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for create_hypertable
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."create_hypertable"("relation" regclass, "dimension" "_timescaledb_internal"."dimension_info", "create_default_indexes" bool, "if_not_exists" bool, "migrate_data" bool);
CREATE FUNCTION "public"."create_hypertable"("relation" regclass, "dimension" "_timescaledb_internal"."dimension_info", "create_default_indexes" bool=true, "if_not_exists" bool=false, "migrate_data" bool=false)
  RETURNS TABLE("hypertable_id" int4, "created" bool) AS '$libdir/timescaledb-2.23.1', 'ts_hypertable_create_general'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for decompress_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."decompress_chunk"("uncompressed_chunk" regclass, "if_compressed" bool);
CREATE FUNCTION "public"."decompress_chunk"("uncompressed_chunk" regclass, "if_compressed" bool=true)
  RETURNS "pg_catalog"."regclass" AS '$libdir/timescaledb-2.23.1', 'ts_decompress_chunk'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for delete_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."delete_job"("job_id" int4);
CREATE FUNCTION "public"."delete_job"("job_id" int4)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_job_delete'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Procedure structure for detach_chunk
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."detach_chunk"("chunk" regclass);
CREATE PROCEDURE "public"."detach_chunk"("chunk" regclass)
 AS '$libdir/timescaledb-2.23.1', 'ts_detach_chunk'
  LANGUAGE c;

-- ----------------------------
-- Function structure for detach_tablespace
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."detach_tablespace"("tablespace" name, "hypertable" regclass, "if_attached" bool);
CREATE FUNCTION "public"."detach_tablespace"("tablespace" name, "hypertable" regclass=NULL::regclass, "if_attached" bool=false)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_tablespace_detach'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for detach_tablespaces
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."detach_tablespaces"("hypertable" regclass);
CREATE FUNCTION "public"."detach_tablespaces"("hypertable" regclass)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_tablespace_detach_all_from_hypertable'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for disable_chunk_skipping
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."disable_chunk_skipping"("hypertable" regclass, "column_name" name, "if_not_exists" bool);
CREATE FUNCTION "public"."disable_chunk_skipping"("hypertable" regclass, "column_name" name, "if_not_exists" bool=false)
  RETURNS TABLE("hypertable_id" int4, "column_name" name, "disabled" bool) AS '$libdir/timescaledb-2.23.1', 'ts_chunk_column_stats_disable'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for drop_chunks
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."drop_chunks"("relation" regclass, "older_than" any, "newer_than" any, "verbose" bool, "created_before" any, "created_after" any);
CREATE FUNCTION "public"."drop_chunks"("relation" regclass, "older_than" any=NULL::unknown, "newer_than" any=NULL::unknown, "verbose" bool=false, "created_before" any=NULL::unknown, "created_after" any=NULL::unknown)
  RETURNS SETOF "pg_catalog"."text" AS '$libdir/timescaledb-2.23.1', 'ts_chunk_drop_chunks'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for enable_chunk_skipping
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."enable_chunk_skipping"("hypertable" regclass, "column_name" name, "if_not_exists" bool);
CREATE FUNCTION "public"."enable_chunk_skipping"("hypertable" regclass, "column_name" name, "if_not_exists" bool=false)
  RETURNS TABLE("column_stats_id" int4, "enabled" bool) AS '$libdir/timescaledb-2.23.1', 'ts_chunk_column_stats_enable'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for generate_uuidv7
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."generate_uuidv7"();
CREATE FUNCTION "public"."generate_uuidv7"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/timescaledb-2.23.1', 'ts_uuid_generate_v7'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for get_telemetry_report
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."get_telemetry_report"();
CREATE FUNCTION "public"."get_telemetry_report"()
  RETURNS "pg_catalog"."jsonb" AS '$libdir/timescaledb-2.23.1', 'ts_telemetry_get_report_jsonb'
  LANGUAGE c STABLE
  COST 1;

-- ----------------------------
-- Function structure for hypertable_approximate_detailed_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_approximate_detailed_size"("relation" regclass);
CREATE FUNCTION "public"."hypertable_approximate_detailed_size"("relation" regclass)
  RETURNS TABLE("table_bytes" int8, "index_bytes" int8, "toast_bytes" int8, "total_bytes" int8) AS '$libdir/timescaledb-2.23.1', 'ts_hypertable_approximate_size'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for hypertable_approximate_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_approximate_size"("hypertable" regclass);
CREATE FUNCTION "public"."hypertable_approximate_size"("hypertable" regclass)
  RETURNS "pg_catalog"."int8" AS $BODY$
   SELECT sum(total_bytes)::bigint
   FROM public.hypertable_approximate_detailed_size(hypertable);
$BODY$
  LANGUAGE sql VOLATILE STRICT
  COST 100
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for hypertable_columnstore_stats
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_columnstore_stats"("hypertable" regclass);
CREATE FUNCTION "public"."hypertable_columnstore_stats"("hypertable" regclass)
  RETURNS TABLE("total_chunks" int8, "number_compressed_chunks" int8, "before_compression_table_bytes" int8, "before_compression_index_bytes" int8, "before_compression_toast_bytes" int8, "before_compression_total_bytes" int8, "after_compression_table_bytes" int8, "after_compression_index_bytes" int8, "after_compression_toast_bytes" int8, "after_compression_total_bytes" int8, "node_name" name) AS $BODY$SELECT * FROM public.hypertable_compression_stats($1)$BODY$
  LANGUAGE sql STABLE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for hypertable_compression_stats
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_compression_stats"("hypertable" regclass);
CREATE FUNCTION "public"."hypertable_compression_stats"("hypertable" regclass)
  RETURNS TABLE("total_chunks" int8, "number_compressed_chunks" int8, "before_compression_table_bytes" int8, "before_compression_index_bytes" int8, "before_compression_toast_bytes" int8, "before_compression_total_bytes" int8, "after_compression_table_bytes" int8, "after_compression_index_bytes" int8, "after_compression_toast_bytes" int8, "after_compression_total_bytes" int8, "node_name" name) AS $BODY$
	SELECT
        count(*)::bigint AS total_chunks,
        (count(*) FILTER (WHERE ch.compression_status = 'Compressed'))::bigint AS number_compressed_chunks,
        sum(ch.before_compression_table_bytes)::bigint AS before_compression_table_bytes,
        sum(ch.before_compression_index_bytes)::bigint AS before_compression_index_bytes,
        sum(ch.before_compression_toast_bytes)::bigint AS before_compression_toast_bytes,
        sum(ch.before_compression_total_bytes)::bigint AS before_compression_total_bytes,
        sum(ch.after_compression_table_bytes)::bigint AS after_compression_table_bytes,
        sum(ch.after_compression_index_bytes)::bigint AS after_compression_index_bytes,
        sum(ch.after_compression_toast_bytes)::bigint AS after_compression_toast_bytes,
        sum(ch.after_compression_total_bytes)::bigint AS after_compression_total_bytes,
        ch.node_name
    FROM
	    public.chunk_compression_stats(hypertable) ch
    GROUP BY
        ch.node_name;
$BODY$
  LANGUAGE sql STABLE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for hypertable_detailed_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_detailed_size"("hypertable" regclass);
CREATE FUNCTION "public"."hypertable_detailed_size"("hypertable" regclass)
  RETURNS TABLE("table_bytes" int8, "index_bytes" int8, "toast_bytes" int8, "total_bytes" int8, "node_name" name) AS $BODY$
DECLARE
        table_name       NAME = NULL;
        schema_name      NAME = NULL;
BEGIN
        SELECT relname, nspname
        INTO table_name, schema_name
        FROM pg_class c
        INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
        INNER JOIN _timescaledb_catalog.hypertable ht ON (ht.schema_name = n.nspname AND ht.table_name = c.relname)
        WHERE c.OID = hypertable;

        IF table_name IS NULL THEN
                SELECT h.schema_name, h.table_name
                INTO schema_name, table_name
                FROM pg_class c
                INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
                INNER JOIN _timescaledb_catalog.continuous_agg a ON (a.user_view_schema = n.nspname AND a.user_view_name = c.relname)
                INNER JOIN _timescaledb_catalog.hypertable h ON h.id = a.mat_hypertable_id
                WHERE c.OID = hypertable;

	        IF table_name IS NULL THEN
                        RETURN;
                END IF;
        END IF;

			RETURN QUERY
			SELECT *, NULL::name
			FROM _timescaledb_functions.hypertable_local_size(schema_name, table_name);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for hypertable_index_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_index_size"("index_name" regclass);
CREATE FUNCTION "public"."hypertable_index_size"("index_name" regclass)
  RETURNS "pg_catalog"."int8" AS $BODY$
  SELECT
  	pg_relation_size(ht_i.indexrelid) + COALESCE(sum(pg_relation_size(ch_i.indexrelid)), 0)
  FROM pg_index ht_i
  LEFT JOIN pg_inherits ch on ch.inhparent = ht_i.indrelid
  LEFT JOIN pg_index ch_i on ch_i.indrelid = ch.inhrelid and _timescaledb_functions.index_matches(ht_i.indexrelid, ch_i.indexrelid)
  WHERE ht_i.indexrelid = index_name
  GROUP BY ht_i.indexrelid;
$BODY$
  LANGUAGE sql VOLATILE STRICT
  COST 100
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for hypertable_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_size"("hypertable" regclass);
CREATE FUNCTION "public"."hypertable_size"("hypertable" regclass)
  RETURNS "pg_catalog"."int8" AS $BODY$
   SELECT total_bytes::bigint FROM public.hypertable_detailed_size(hypertable);
$BODY$
  LANGUAGE sql VOLATILE STRICT
  COST 100
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int4, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" int4, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" float8, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" float8, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."float8" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" float4, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" float4, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."float4" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int2, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" int2, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int8, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" int8, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for locf
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."locf"("value" anyelement, "prev" anyelement, "treat_null_as_missing" bool);
CREATE FUNCTION "public"."locf"("value" anyelement, "prev" anyelement=NULL::unknown, "treat_null_as_missing" bool=false)
  RETURNS "pg_catalog"."anyelement" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for merge_chunks
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."merge_chunks"("chunks" _regclass);
CREATE PROCEDURE "public"."merge_chunks"("chunks" _regclass)
 AS '$libdir/timescaledb-2.23.1', 'ts_merge_chunks'
  LANGUAGE c;

-- ----------------------------
-- Procedure structure for merge_chunks
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."merge_chunks"("chunk1" regclass, "chunk2" regclass);
CREATE PROCEDURE "public"."merge_chunks"("chunk1" regclass, "chunk2" regclass)
 AS '$libdir/timescaledb-2.23.1', 'ts_merge_two_chunks'
  LANGUAGE c;

-- ----------------------------
-- Function structure for move_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."move_chunk"("chunk" regclass, "destination_tablespace" name, "index_destination_tablespace" name, "reorder_index" regclass, "verbose" bool);
CREATE FUNCTION "public"."move_chunk"("chunk" regclass, "destination_tablespace" name, "index_destination_tablespace" name=NULL::name, "reorder_index" regclass=NULL::regclass, "verbose" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_move_chunk'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for recompress_chunk
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."recompress_chunk"("chunk" regclass, "if_not_compressed" bool);
CREATE PROCEDURE "public"."recompress_chunk"("chunk" regclass, "if_not_compressed" bool=true)
 AS $BODY$
BEGIN
  IF current_setting('timescaledb.enable_deprecation_warnings', true)::bool THEN
    RAISE WARNING 'procedure public.recompress_chunk(regclass,boolean) is deprecated and the functionality is now included in public.compress_chunk. this compatibility function will be removed in a future version.';
  END IF;
  PERFORM public.compress_chunk(chunk, if_not_compressed);
END$BODY$
  LANGUAGE plpgsql
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Procedure structure for refresh_continuous_aggregate
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."refresh_continuous_aggregate"("continuous_aggregate" regclass, "window_start" any, "window_end" any, "force" bool, "options" jsonb);
CREATE PROCEDURE "public"."refresh_continuous_aggregate"("continuous_aggregate" regclass, "window_start" any, "window_end" any, "force" bool=false, "options" jsonb=NULL::jsonb)
 AS '$libdir/timescaledb-2.23.1', 'ts_continuous_agg_refresh'
  LANGUAGE c;

-- ----------------------------
-- Procedure structure for remove_columnstore_policy
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."remove_columnstore_policy"("hypertable" regclass, "if_exists" bool);
CREATE PROCEDURE "public"."remove_columnstore_policy"("hypertable" regclass, "if_exists" bool=false)
 AS '$libdir/timescaledb-2.23.1', 'ts_policy_compression_remove'
  LANGUAGE c;

-- ----------------------------
-- Function structure for remove_compression_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_compression_policy"("hypertable" regclass, "if_exists" bool);
CREATE FUNCTION "public"."remove_compression_policy"("hypertable" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."bool" AS '$libdir/timescaledb-2.23.1', 'ts_policy_compression_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for remove_continuous_aggregate_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_continuous_aggregate_policy"("continuous_aggregate" regclass, "if_not_exists" bool, "if_exists" bool);
CREATE FUNCTION "public"."remove_continuous_aggregate_policy"("continuous_aggregate" regclass, "if_not_exists" bool=false, "if_exists" bool=NULL::boolean)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_policy_refresh_cagg_remove'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for remove_process_hypertable_invalidations_policy
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."remove_process_hypertable_invalidations_policy"("hypertable" regclass, "if_exists" bool);
CREATE PROCEDURE "public"."remove_process_hypertable_invalidations_policy"("hypertable" regclass, "if_exists" bool=false)
 AS '$libdir/timescaledb-2.23.1', 'ts_policy_process_hyper_inval_remove'
  LANGUAGE c;

-- ----------------------------
-- Function structure for remove_reorder_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_reorder_policy"("hypertable" regclass, "if_exists" bool);
CREATE FUNCTION "public"."remove_reorder_policy"("hypertable" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_policy_reorder_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for remove_retention_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_retention_policy"("relation" regclass, "if_exists" bool);
CREATE FUNCTION "public"."remove_retention_policy"("relation" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_policy_retention_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for reorder_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."reorder_chunk"("chunk" regclass, "index" regclass, "verbose" bool);
CREATE FUNCTION "public"."reorder_chunk"("chunk" regclass, "index" regclass=NULL::regclass, "verbose" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_reorder_chunk'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for run_job
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."run_job"("job_id" int4);
CREATE PROCEDURE "public"."run_job"("job_id" int4)
 AS '$libdir/timescaledb-2.23.1', 'ts_job_run'
  LANGUAGE c;

-- ----------------------------
-- Function structure for set_adaptive_chunking
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_adaptive_chunking"("hypertable" regclass, "chunk_target_size" text, INOUT "chunk_sizing_func" regproc, OUT "chunk_target_size" int8);
CREATE FUNCTION "public"."set_adaptive_chunking"(IN "hypertable" regclass, IN "chunk_target_size" text, INOUT "chunk_sizing_func" regproc='_timescaledb_functions.calculate_chunk_interval'::regproc, OUT "chunk_target_size" int8)
  RETURNS "pg_catalog"."record" AS '$libdir/timescaledb-2.23.1', 'ts_chunk_adaptive_set'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_chunk_time_interval
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_chunk_time_interval"("hypertable" regclass, "chunk_time_interval" anyelement, "dimension_name" name);
CREATE FUNCTION "public"."set_chunk_time_interval"("hypertable" regclass, "chunk_time_interval" anyelement, "dimension_name" name=NULL::name)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_dimension_set_interval'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_integer_now_func
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_integer_now_func"("hypertable" regclass, "integer_now_func" regproc, "replace_if_exists" bool);
CREATE FUNCTION "public"."set_integer_now_func"("hypertable" regclass, "integer_now_func" regproc, "replace_if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_hypertable_set_integer_now_func'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for set_number_partitions
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_number_partitions"("hypertable" regclass, "number_partitions" int4, "dimension_name" name);
CREATE FUNCTION "public"."set_number_partitions"("hypertable" regclass, "number_partitions" int4, "dimension_name" name=NULL::name)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_dimension_set_num_slices'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_partitioning_interval
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_partitioning_interval"("hypertable" regclass, "partition_interval" anyelement, "dimension_name" name);
CREATE FUNCTION "public"."set_partitioning_interval"("hypertable" regclass, "partition_interval" anyelement, "dimension_name" name=NULL::name)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.23.1', 'ts_dimension_set_interval'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for show_chunks
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."show_chunks"("relation" regclass, "older_than" any, "newer_than" any, "created_before" any, "created_after" any);
CREATE FUNCTION "public"."show_chunks"("relation" regclass, "older_than" any=NULL::unknown, "newer_than" any=NULL::unknown, "created_before" any=NULL::unknown, "created_after" any=NULL::unknown)
  RETURNS SETOF "pg_catalog"."regclass" AS '$libdir/timescaledb-2.23.1', 'ts_chunk_show_chunks'
  LANGUAGE c STABLE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for show_tablespaces
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."show_tablespaces"("hypertable" regclass);
CREATE FUNCTION "public"."show_tablespaces"("hypertable" regclass)
  RETURNS SETOF "pg_catalog"."name" AS '$libdir/timescaledb-2.23.1', 'ts_tablespace_show'
  LANGUAGE c VOLATILE STRICT
  COST 1
  ROWS 1000;

-- ----------------------------
-- Procedure structure for split_chunk
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."split_chunk"("chunk" regclass, "split_at" any);
CREATE PROCEDURE "public"."split_chunk"("chunk" regclass, "split_at" any=NULL::unknown)
 AS '$libdir/timescaledb-2.23.1', 'ts_split_chunk'
  LANGUAGE c;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "origin" timestamptz);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "origin" timestamptz)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.23.1', 'ts_timestamptz_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.23.1', 'ts_timestamp_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.23.1', 'ts_timestamptz_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.23.1', 'ts_date_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int8, "ts" int8, "offset" int8);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int8, "ts" int8, "offset" int8)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.23.1', 'ts_int64_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int4, "ts" int4, "offset" int4);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int4, "ts" int4, "offset" int4)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_int32_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int2, "ts" int2, "offset" int2);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int2, "ts" int2, "offset" int2)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.23.1', 'ts_int16_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int8, "ts" int8);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int8, "ts" int8)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.23.1', 'ts_int64_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int4, "ts" int4);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int4, "ts" int4)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_int32_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int2, "ts" int2);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int2, "ts" int2)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.23.1', 'ts_int16_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "timezone" text, "origin" timestamptz, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "timezone" text, "origin" timestamptz=NULL::timestamp with time zone, "offset" interval=NULL::interval)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.23.1', 'ts_timestamptz_timezone_bucket'
  LANGUAGE c IMMUTABLE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date, "offset" interval)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.23.1', 'ts_date_offset_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "offset" interval)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.23.1', 'ts_timestamptz_offset_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "offset" interval)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.23.1', 'ts_timestamp_offset_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date, "origin" date);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date, "origin" date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.23.1', 'ts_date_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "origin" timestamp);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "origin" timestamp)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.23.1', 'ts_timestamp_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" date, "start" date, "finish" date);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" date, "start" date=NULL::date, "finish" date=NULL::date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_date_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int8, "ts" int8, "start" int8, "finish" int8);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int8, "ts" int8, "start" int8=NULL::bigint, "finish" int8=NULL::bigint)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_int64_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "start" timestamptz, "finish" timestamptz);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "start" timestamptz=NULL::timestamp with time zone, "finish" timestamptz=NULL::timestamp with time zone)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_timestamptz_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int4, "ts" int4, "start" int4, "finish" int4);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int4, "ts" int4, "start" int4=NULL::integer, "finish" int4=NULL::integer)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_int32_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int2, "ts" int2, "start" int2, "finish" int2);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int2, "ts" int2, "start" int2=NULL::smallint, "finish" int2=NULL::smallint)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_int16_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "timezone" text, "start" timestamptz, "finish" timestamptz);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "timezone" text, "start" timestamptz=NULL::timestamp with time zone, "finish" timestamptz=NULL::timestamp with time zone)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_timestamptz_timezone_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamp, "start" timestamp, "finish" timestamp);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamp, "start" timestamp=NULL::timestamp without time zone, "finish" timestamp=NULL::timestamp without time zone)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.23.1', 'ts_gapfill_timestamp_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for timescaledb_post_restore
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."timescaledb_post_restore"();
CREATE FUNCTION "public"."timescaledb_post_restore"()
  RETURNS "pg_catalog"."bool" AS $BODY$
DECLARE
    db text;
    catalog_version text;
BEGIN
    SELECT m.value INTO catalog_version FROM pg_extension x
    JOIN _timescaledb_catalog.metadata m ON m.key='timescaledb_version'
    WHERE x.extname='timescaledb' AND x.extversion <> m.value;

    -- check that a loaded dump is compatible with the currently running code
    IF FOUND THEN
        RAISE EXCEPTION 'catalog version mismatch, expected "%" seen "%"', '2.23.1', catalog_version;
    END IF;

    SELECT current_database() INTO db;
    EXECUTE format($$ALTER DATABASE %I RESET timescaledb.restoring $$, db);
    -- we cannot use reset here because the reset_val might not be off
    SET timescaledb.restoring TO off;
    PERFORM _timescaledb_functions.restart_background_workers();

    RETURN true;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for timescaledb_pre_restore
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."timescaledb_pre_restore"();
CREATE FUNCTION "public"."timescaledb_pre_restore"()
  RETURNS "pg_catalog"."bool" AS $BODY$
DECLARE
    db text;
BEGIN
    SELECT current_database() INTO db;
    EXECUTE format($$ALTER DATABASE %I SET timescaledb.restoring ='on'$$, db);
    SET SESSION timescaledb.restoring = 'on';
    PERFORM _timescaledb_functions.stop_background_workers();
    RETURN true;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  SET "search_path"="pg_catalog, pg_temp";

-- ----------------------------
-- Function structure for to_uuidv7
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."to_uuidv7"("ts" timestamptz);
CREATE FUNCTION "public"."to_uuidv7"("ts" timestamptz)
  RETURNS "pg_catalog"."uuid" AS '$libdir/timescaledb-2.23.1', 'ts_uuid_v7_from_timestamptz'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for to_uuidv7_boundary
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."to_uuidv7_boundary"("ts" timestamptz);
CREATE FUNCTION "public"."to_uuidv7_boundary"("ts" timestamptz)
  RETURNS "pg_catalog"."uuid" AS '$libdir/timescaledb-2.23.1', 'ts_uuid_v7_from_timestamptz_boundary'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_timestamp
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_timestamp"("uuid" uuid);
CREATE FUNCTION "public"."uuid_timestamp"("uuid" uuid)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.23.1', 'ts_timestamptz_from_uuid_v7'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_timestamp_micros
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_timestamp_micros"("uuid" uuid);
CREATE FUNCTION "public"."uuid_timestamp_micros"("uuid" uuid)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.23.1', 'ts_timestamptz_from_uuid_v7_with_microseconds'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_version
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_version"("uuid" uuid);
CREATE FUNCTION "public"."uuid_version"("uuid" uuid)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.23.1', 'ts_uuid_version'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."access_record_id_seq"
OWNED BY "public"."access_record"."id";
SELECT setval('"public"."access_record_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."account_id_seq"
OWNED BY "public"."account"."id";
SELECT setval('"public"."account_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."comment_id_seq"
OWNED BY "public"."comment"."id";
SELECT setval('"public"."comment_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."fun_question_id_seq"
OWNED BY "public"."fun_question"."id";
SELECT setval('"public"."fun_question_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mood_id_seq"
OWNED BY "public"."mood"."id";
SELECT setval('"public"."mood_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."msg_wall_id_seq"
OWNED BY "public"."msg_wall"."id";
SELECT setval('"public"."msg_wall_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."order_id_seq"
OWNED BY "public"."order"."id";
SELECT setval('"public"."order_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permission_permission_id_seq"
OWNED BY "public"."permission"."permission_id";
SELECT setval('"public"."permission_permission_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."photo_id_seq"
OWNED BY "public"."photo"."id";
SELECT setval('"public"."photo_id_seq"', 90, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."photo_type_id_seq"
OWNED BY "public"."photo_type"."id";
SELECT setval('"public"."photo_type_id_seq"', 268, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_role_id_seq"
OWNED BY "public"."role"."role_id";
SELECT setval('"public"."role_role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."storage_id_seq"
OWNED BY "public"."storage"."id";
SELECT setval('"public"."storage_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tag_id_seq"
OWNED BY "public"."tag"."id";
SELECT setval('"public"."tag_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."todo_id_seq"
OWNED BY "public"."todo"."id";
SELECT setval('"public"."todo_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."type_id_seq"
OWNED BY "public"."type"."id";
SELECT setval('"public"."type_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."undo_log_id_seq"
OWNED BY "public"."undo_log"."id";
SELECT setval('"public"."undo_log_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_user_id_seq"
OWNED BY "public"."user"."user_id";
SELECT setval('"public"."user_user_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."visit_num_id_seq"
OWNED BY "public"."visit_num"."id";
SELECT setval('"public"."visit_num_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."weather_id_seq"
OWNED BY "public"."weather"."id";
SELECT setval('"public"."weather_id_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table access_record
-- ----------------------------
ALTER TABLE "public"."access_record" ADD CONSTRAINT "access_record_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table account
-- ----------------------------
ALTER TABLE "public"."account" ADD CONSTRAINT "account_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table article
-- ----------------------------
ALTER TABLE "public"."article" ADD CONSTRAINT "article_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table baidu_question
-- ----------------------------
ALTER TABLE "public"."baidu_question" ADD CONSTRAINT "baidu_question_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table comment
-- ----------------------------
ALTER TABLE "public"."comment" ADD CONSTRAINT "comment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fun_question
-- ----------------------------
ALTER TABLE "public"."fun_question" ADD CONSTRAINT "fun_question_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mood
-- ----------------------------
ALTER TABLE "public"."mood" ADD CONSTRAINT "mood_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table msg_wall
-- ----------------------------
ALTER TABLE "public"."msg_wall" ADD CONSTRAINT "msg_wall_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE "public"."order" ADD CONSTRAINT "order_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table permission
-- ----------------------------
ALTER TABLE "public"."permission" ADD CONSTRAINT "permission_pkey" PRIMARY KEY ("permission_id");

-- ----------------------------
-- Primary Key structure for table photo
-- ----------------------------
ALTER TABLE "public"."photo" ADD CONSTRAINT "photo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table photo_type
-- ----------------------------
ALTER TABLE "public"."photo_type" ADD CONSTRAINT "photo_type_type_name_key" UNIQUE ("type_name");

-- ----------------------------
-- Primary Key structure for table photo_type
-- ----------------------------
ALTER TABLE "public"."photo_type" ADD CONSTRAINT "photo_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE "public"."role" ADD CONSTRAINT "role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table role_permission
-- ----------------------------
ALTER TABLE "public"."role_permission" ADD CONSTRAINT "role_permission_pkey" PRIMARY KEY ("role_id", "permission_id");

-- ----------------------------
-- Uniques structure for table storage
-- ----------------------------
ALTER TABLE "public"."storage" ADD CONSTRAINT "storage_commodity_code_key" UNIQUE ("commodity_code");

-- ----------------------------
-- Primary Key structure for table storage
-- ----------------------------
ALTER TABLE "public"."storage" ADD CONSTRAINT "storage_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tag
-- ----------------------------
ALTER TABLE "public"."tag" ADD CONSTRAINT "tag_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tag_relation
-- ----------------------------
ALTER TABLE "public"."tag_relation" ADD CONSTRAINT "tag_relation_pkey" PRIMARY KEY ("article_id", "tag_id");

-- ----------------------------
-- Primary Key structure for table todo
-- ----------------------------
ALTER TABLE "public"."todo" ADD CONSTRAINT "todo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table type
-- ----------------------------
ALTER TABLE "public"."type" ADD CONSTRAINT "type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table undo_log
-- ----------------------------
ALTER TABLE "public"."undo_log" ADD CONSTRAINT "undo_log_xid_branch_id_key" UNIQUE ("xid", "branch_id");

-- ----------------------------
-- Primary Key structure for table undo_log
-- ----------------------------
ALTER TABLE "public"."undo_log" ADD CONSTRAINT "undo_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_phone_key" UNIQUE ("phone");

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table user_role
-- ----------------------------
ALTER TABLE "public"."user_role" ADD CONSTRAINT "user_role_pkey" PRIMARY KEY ("user_id", "role_id");

-- ----------------------------
-- Primary Key structure for table visit_num
-- ----------------------------
ALTER TABLE "public"."visit_num" ADD CONSTRAINT "visit_num_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table weather
-- ----------------------------
ALTER TABLE "public"."weather" ADD CONSTRAINT "weather_pkey" PRIMARY KEY ("id");
