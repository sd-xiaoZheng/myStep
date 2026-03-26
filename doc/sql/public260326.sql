/*
 Navicat Premium Dump SQL

 Source Server         : mystep
 Source Server Type    : PostgreSQL
 Source Server Version : 170007 (170007)
 Source Host           : localhost:5432
 Source Catalog        : mystep
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170007 (170007)
 File Encoding         : 65001

 Date: 26/03/2026 22:56:38
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
INSERT INTO "public"."access_record" VALUES (2004404334773014529, '127.0.0.1', 18888, NULL, NULL, 18026, '/step/article/addArticle', '', '未知 未知', NULL);
INSERT INTO "public"."access_record" VALUES (2004404334802374658, '127.0.0.1', 18888, NULL, NULL, 8871, '/step/article/addArticle', '', '未知 未知', NULL);
INSERT INTO "public"."access_record" VALUES (2004404334806568962, '127.0.0.1', 18888, NULL, NULL, 6656, '/step/article/addArticle', '', '未知 未知', NULL);
INSERT INTO "public"."access_record" VALUES (2004404334806568963, '127.0.0.1', 18888, NULL, NULL, 16764, '/step/article/addArticle', '', '未知 未知', NULL);
INSERT INTO "public"."access_record" VALUES (2004404334814957570, '127.0.0.1', 18888, NULL, NULL, 283085, '/step/article/addArticle', '', '未知 未知', NULL);
INSERT INTO "public"."access_record" VALUES (2004404334814957571, '127.0.0.1', 18888, NULL, NULL, 5725, '/step/article/addArticle', '', '未知 未知', NULL);
INSERT INTO "public"."access_record" VALUES (2004446673914707970, '127.0.0.1', 18888, NULL, NULL, 8987, '/step/article/addArticle', '0内网IP', '内网IP', '2025-12-26 14:58:04');
INSERT INTO "public"."access_record" VALUES (2004446674069897217, '127.0.0.1', 18888, NULL, NULL, 16245, '/step/article/addArticle', '0内网IP', '内网IP', '2025-12-26 14:57:47');
INSERT INTO "public"."access_record" VALUES (2004447091218595842, '127.0.0.1', 18888, NULL, NULL, 40750, '/step/article/addArticle', '0内网IP', '内网IP', '2025-12-26 14:59:38');
INSERT INTO "public"."access_record" VALUES (2004449096154652674, '127.0.0.1', 18888, NULL, NULL, 563, '/step/article/addArticle', '未知内网IP', '内网IP', '2025-12-26 15:07:40');
INSERT INTO "public"."access_record" VALUES (2004458407413149697, '127.0.0.1', 18888, NULL, NULL, 1086, '/step/article/addArticle', '未知内网IP', '内网IP', '2025-12-26 15:34:19');
INSERT INTO "public"."access_record" VALUES (2004481056784728065, '127.0.0.1', 18888, NULL, NULL, 664, '/step/article/addArticle', '未知内网IP', '内网IP', '2025-12-26 17:12:52');
INSERT INTO "public"."access_record" VALUES (2004481056784728066, '127.0.0.1', 18888, NULL, NULL, 85313, '/step/article/addArticle', '未知内网IP', '内网IP', '2025-12-26 17:08:41');
INSERT INTO "public"."access_record" VALUES (2004481056784728067, '127.0.0.1', 18888, NULL, NULL, 656, '/step/article/addArticle', '未知内网IP', '内网IP', '2025-12-26 17:04:53');
INSERT INTO "public"."access_record" VALUES (2005809812606447617, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 54, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:41:46');
INSERT INTO "public"."access_record" VALUES (2005809812623224833, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 48, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:41:25');
INSERT INTO "public"."access_record" VALUES (2005809812627419138, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812627419139, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812635807746, 'localhost', 18888, NULL, NULL, 11, '/step/tag/list', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812635807747, 'localhost', 18888, NULL, NULL, 12, '/step/weather/list', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812635807748, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812635807749, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812640002050, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812640002051, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812644196354, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812644196355, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', 'nullnull', NULL, '2025-12-29 17:40:03');
INSERT INTO "public"."access_record" VALUES (2005809812648390658, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 27, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:40:02');
INSERT INTO "public"."access_record" VALUES (2005809812648390659, 'localhost', 18888, NULL, NULL, 10, '/step/type/list', 'nullnull', NULL, '2025-12-29 17:40:02');
INSERT INTO "public"."access_record" VALUES (2005809812648390660, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:39:28');
INSERT INTO "public"."access_record" VALUES (2005809812648390661, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:39:28');
INSERT INTO "public"."access_record" VALUES (2005809812656779266, 'localhost', 18888, NULL, NULL, 8, '/step/tag/list', 'nullnull', NULL, '2025-12-29 17:39:28');
INSERT INTO "public"."access_record" VALUES (2005809812656779267, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812656779268, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812656779269, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812656779270, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812665167874, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812665167875, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812665167876, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812665167877, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 29, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812665167878, 'localhost', 18888, NULL, NULL, 9, '/step/type/list', 'nullnull', NULL, '2025-12-29 17:39:27');
INSERT INTO "public"."access_record" VALUES (2005809812673556482, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812673556483, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812673556484, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812673556485, 'localhost', 18888, NULL, NULL, 11, '/step/tag/list', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812677750785, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812677750786, 'localhost', 18888, NULL, NULL, 10, '/step/weather/list', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812677750787, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812677750788, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812677750789, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812690333698, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', 'nullnull', NULL, '2025-12-29 17:39:17');
INSERT INTO "public"."access_record" VALUES (2005809812690333699, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 16, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:39:16');
INSERT INTO "public"."access_record" VALUES (2005809812694528002, 'localhost', 18888, NULL, NULL, 5, '/step/type/list', 'nullnull', NULL, '2025-12-29 17:39:16');
INSERT INTO "public"."access_record" VALUES (2005809812694528003, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812694528004, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812694528005, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812698722306, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812702916609, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812702916610, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812711305218, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812711305219, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812711305220, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812711305221, 'localhost', 18888, NULL, NULL, 12, '/step/mood/list', 'nullnull', NULL, '2025-12-29 17:38:59');
INSERT INTO "public"."access_record" VALUES (2005809812715499522, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:38:58');
INSERT INTO "public"."access_record" VALUES (2005809812715499523, 'localhost', 18888, NULL, NULL, 26, '/step/type/list', 'nullnull', NULL, '2025-12-29 17:38:58');
INSERT INTO "public"."access_record" VALUES (2005809812715499524, 'localhost', 18888, NULL, NULL, 9, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:35:02');
INSERT INTO "public"."access_record" VALUES (2005809812715499525, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:35:02');
INSERT INTO "public"."access_record" VALUES (2005809812715499526, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:35:02');
INSERT INTO "public"."access_record" VALUES (2005809812715499527, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:35:02');
INSERT INTO "public"."access_record" VALUES (2005809812719693826, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:35:02');
INSERT INTO "public"."access_record" VALUES (2005809812719693827, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:35:02');
INSERT INTO "public"."access_record" VALUES (2005809812719693828, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:35:02');
INSERT INTO "public"."access_record" VALUES (2005809812719693829, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 14, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:35:01');
INSERT INTO "public"."access_record" VALUES (2005809812719693830, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:34:58');
INSERT INTO "public"."access_record" VALUES (2005809812723888129, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:34:58');
INSERT INTO "public"."access_record" VALUES (2005809812723888130, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:34:58');
INSERT INTO "public"."access_record" VALUES (2005809812728082433, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:34:57');
INSERT INTO "public"."access_record" VALUES (2005809812728082434, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:34:57');
INSERT INTO "public"."access_record" VALUES (2005809812728082435, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:34:57');
INSERT INTO "public"."access_record" VALUES (2005809812732276738, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:34:57');
INSERT INTO "public"."access_record" VALUES (2005809812732276739, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 47, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:34:57');
INSERT INTO "public"."access_record" VALUES (2005809812732276740, 'localhost', 18888, NULL, NULL, 10, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:34:50');
INSERT INTO "public"."access_record" VALUES (2005809812732276741, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:34:50');
INSERT INTO "public"."access_record" VALUES (2005809812740665346, 'localhost', 18888, NULL, NULL, 44, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:34:50');
INSERT INTO "public"."access_record" VALUES (2005809812740665347, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:34:50');
INSERT INTO "public"."access_record" VALUES (2005809812740665348, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:34:50');
INSERT INTO "public"."access_record" VALUES (2005809812740665349, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:34:50');
INSERT INTO "public"."access_record" VALUES (2005809812740665350, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:34:50');
INSERT INTO "public"."access_record" VALUES (2005809812740665351, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 18, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:34:49');
INSERT INTO "public"."access_record" VALUES (2005809812740665352, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:34:27');
INSERT INTO "public"."access_record" VALUES (2005809812740665353, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:34:27');
INSERT INTO "public"."access_record" VALUES (2005809812740665354, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:34:27');
INSERT INTO "public"."access_record" VALUES (2005809812744859649, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:34:26');
INSERT INTO "public"."access_record" VALUES (2005809812744859650, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:34:26');
INSERT INTO "public"."access_record" VALUES (2005809812744859651, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:34:26');
INSERT INTO "public"."access_record" VALUES (2005809812744859652, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:34:26');
INSERT INTO "public"."access_record" VALUES (2005809812744859653, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 21, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:34:26');
INSERT INTO "public"."access_record" VALUES (2005809812749053954, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:33:43');
INSERT INTO "public"."access_record" VALUES (2005809812749053955, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:33:43');
INSERT INTO "public"."access_record" VALUES (2005809812749053956, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:33:43');
INSERT INTO "public"."access_record" VALUES (2005809812753248258, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:33:43');
INSERT INTO "public"."access_record" VALUES (2005809812753248259, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:33:43');
INSERT INTO "public"."access_record" VALUES (2005809812753248260, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:33:43');
INSERT INTO "public"."access_record" VALUES (2005809812753248261, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:33:42');
INSERT INTO "public"."access_record" VALUES (2005809812753248262, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 190, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:33:42');
INSERT INTO "public"."access_record" VALUES (2005809812757442561, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 17:33:20');
INSERT INTO "public"."access_record" VALUES (2005809812757442562, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 17:33:20');
INSERT INTO "public"."access_record" VALUES (2005809812757442563, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 17:33:20');
INSERT INTO "public"."access_record" VALUES (2005809812757442564, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 17:33:19');
INSERT INTO "public"."access_record" VALUES (2005809812757442565, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 17:33:19');
INSERT INTO "public"."access_record" VALUES (2005809812757442566, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 17:33:19');
INSERT INTO "public"."access_record" VALUES (2005809812757442567, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 17:33:19');
INSERT INTO "public"."access_record" VALUES (2005809812757442568, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 195, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 17:33:19');
INSERT INTO "public"."access_record" VALUES (2005809812757442569, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 16:31:34');
INSERT INTO "public"."access_record" VALUES (2005809812757442570, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 16:31:33');
INSERT INTO "public"."access_record" VALUES (2005809812757442571, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 16:31:33');
INSERT INTO "public"."access_record" VALUES (2005809812765831170, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 16:31:33');
INSERT INTO "public"."access_record" VALUES (2005809812765831171, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 16:31:33');
INSERT INTO "public"."access_record" VALUES (2005809812765831172, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 16:31:33');
INSERT INTO "public"."access_record" VALUES (2005809812765831173, 'localhost', 18888, NULL, NULL, 12, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 16:31:33');
INSERT INTO "public"."access_record" VALUES (2005809812765831174, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 36, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:31:33');
INSERT INTO "public"."access_record" VALUES (2005809812770025474, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', 'nullnull', NULL, '2025-12-29 16:31:31');
INSERT INTO "public"."access_record" VALUES (2005809812770025475, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', 'nullnull', NULL, '2025-12-29 16:31:31');
INSERT INTO "public"."access_record" VALUES (2005809812770025476, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', 'nullnull', NULL, '2025-12-29 16:31:31');
INSERT INTO "public"."access_record" VALUES (2005809812770025477, 'localhost', 18888, NULL, NULL, 20, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', 'nullnull', NULL, '2025-12-29 16:31:30');
INSERT INTO "public"."access_record" VALUES (2005809812770025478, 'localhost', 18888, NULL, NULL, 19, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', 'nullnull', NULL, '2025-12-29 16:31:30');
INSERT INTO "public"."access_record" VALUES (2005809812770025479, 'localhost', 18888, NULL, NULL, 18, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:31:30');
INSERT INTO "public"."access_record" VALUES (2005809812774219777, 'localhost', 18888, NULL, NULL, 17, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', 'nullnull', NULL, '2025-12-29 16:31:30');
INSERT INTO "public"."access_record" VALUES (2005809812774219778, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', 'nullnull', NULL, '2025-12-29 16:31:30');
INSERT INTO "public"."access_record" VALUES (2005809812774219779, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', 'nullnull', NULL, '2025-12-29 16:31:30');
INSERT INTO "public"."access_record" VALUES (2005809812774219780, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20&isHidden=true', 27, '/step/photoType/getPhotoTypeAndPhrase', 'nullnull', NULL, '2025-12-29 16:31:30');
INSERT INTO "public"."access_record" VALUES (2005809812782608385, 'localhost', 18888, NULL, 'name=aura+Co', 15, '/step/tag/list', 'nullnull', NULL, '2025-12-29 16:31:27');
INSERT INTO "public"."access_record" VALUES (2005809812782608386, 'localhost', 18888, NULL, NULL, 41, '/step/tag/update', 'nullnull', NULL, '2025-12-29 16:31:27');
INSERT INTO "public"."access_record" VALUES (2005809812782608387, 'localhost', 18888, NULL, 'name=aura+Co', 14, '/step/tag/list', 'nullnull', NULL, '2025-12-29 16:31:22');
INSERT INTO "public"."access_record" VALUES (2005809812782608388, 'localhost', 18888, NULL, NULL, 26, '/step/tag/list', 'nullnull', NULL, '2025-12-29 16:31:21');
INSERT INTO "public"."access_record" VALUES (2005809812782608389, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 16:31:05');
INSERT INTO "public"."access_record" VALUES (2005809812782608390, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 16:31:04');
INSERT INTO "public"."access_record" VALUES (2005809812782608391, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 16:31:04');
INSERT INTO "public"."access_record" VALUES (2005809812786802689, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 16:31:04');
INSERT INTO "public"."access_record" VALUES (2005809812786802690, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 16:31:04');
INSERT INTO "public"."access_record" VALUES (2005809812790996993, 'localhost', 18888, NULL, NULL, 9, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 16:31:04');
INSERT INTO "public"."access_record" VALUES (2005809812795191297, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 16:31:04');
INSERT INTO "public"."access_record" VALUES (2005809812799385601, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 37, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:31:04');
INSERT INTO "public"."access_record" VALUES (2005809812811968514, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:30:56');
INSERT INTO "public"."access_record" VALUES (2005809812811968515, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20&typeName=%E8%B7%9D%E6%91%84', 60, '/step/photoType/getPhotoType', 'nullnull', NULL, '2025-12-29 16:30:56');
INSERT INTO "public"."access_record" VALUES (2005809812816162817, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:30:47');
INSERT INTO "public"."access_record" VALUES (2005809812816162818, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', 'nullnull', NULL, '2025-12-29 16:30:47');
INSERT INTO "public"."access_record" VALUES (2005809812816162819, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', 'nullnull', NULL, '2025-12-29 16:30:46');
INSERT INTO "public"."access_record" VALUES (2005809812816162820, 'localhost', 18888, NULL, NULL, 24, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', 'nullnull', NULL, '2025-12-29 16:30:46');
INSERT INTO "public"."access_record" VALUES (2005809812816162821, 'localhost', 18888, NULL, NULL, 22, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', 'nullnull', NULL, '2025-12-29 16:30:46');
INSERT INTO "public"."access_record" VALUES (2005809812816162822, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', 'nullnull', NULL, '2025-12-29 16:30:46');
INSERT INTO "public"."access_record" VALUES (2005809812816162823, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', 'nullnull', NULL, '2025-12-29 16:30:46');
INSERT INTO "public"."access_record" VALUES (2005809812816162824, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', 'nullnull', NULL, '2025-12-29 16:30:46');
INSERT INTO "public"."access_record" VALUES (2005809812816162825, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', 'nullnull', NULL, '2025-12-29 16:30:46');
INSERT INTO "public"."access_record" VALUES (2005809812816162826, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20', 27, '/step/photoType/getPhotoType', 'nullnull', NULL, '2025-12-29 16:30:46');
INSERT INTO "public"."access_record" VALUES (2005809812816162827, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 16:30:41');
INSERT INTO "public"."access_record" VALUES (2005809812816162828, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 16:30:41');
INSERT INTO "public"."access_record" VALUES (2005809812816162829, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 16:30:41');
INSERT INTO "public"."access_record" VALUES (2005809812824551426, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 16:30:41');
INSERT INTO "public"."access_record" VALUES (2005809812824551427, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 16:30:41');
INSERT INTO "public"."access_record" VALUES (2005809812824551428, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 16:30:41');
INSERT INTO "public"."access_record" VALUES (2005809812824551429, 'localhost', 18888, NULL, NULL, 11, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 16:30:41');
INSERT INTO "public"."access_record" VALUES (2005809812824551430, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 61, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:30:41');
INSERT INTO "public"."access_record" VALUES (2005809812824551431, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812824551432, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745730, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745731, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745732, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745733, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745734, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745735, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745736, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745737, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20', 24, '/step/photoType/getPhotoType', 'nullnull', NULL, '2025-12-29 16:30:36');
INSERT INTO "public"."access_record" VALUES (2005809812828745738, 'localhost', 18888, NULL, NULL, 17, '/step/tag/list', 'nullnull', NULL, '2025-12-29 16:30:32');
INSERT INTO "public"."access_record" VALUES (2005809812904243206, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', 'nullnull', NULL, '2025-12-29 15:39:54');
INSERT INTO "public"."access_record" VALUES (2005809812832940034, 'localhost', 18888, NULL, 'pageNum=4&pageSize=20&isHidden=true', 18, '/step/photoType/getPhotoTypeAndPhrase', 'nullnull', NULL, '2025-12-29 16:30:28');
INSERT INTO "public"."access_record" VALUES (2005809812832940035, 'localhost', 18888, NULL, 'pageNum=3&pageSize=20&isHidden=true', 22, '/step/photoType/getPhotoTypeAndPhrase', 'nullnull', NULL, '2025-12-29 16:30:27');
INSERT INTO "public"."access_record" VALUES (2005809812832940036, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:30:17');
INSERT INTO "public"."access_record" VALUES (2005809812832940037, 'localhost', 18888, NULL, 'pageNum=2&pageSize=20&isHidden=true', 49, '/step/photoType/getPhotoTypeAndPhrase', 'nullnull', NULL, '2025-12-29 16:30:17');
INSERT INTO "public"."access_record" VALUES (2005809812832940038, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812832940039, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812832940040, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812837134338, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812837134339, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812837134340, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812837134341, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812837134342, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812837134343, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812841328641, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20&isHidden=true', 24, '/step/photoType/getPhotoTypeAndPhrase', 'nullnull', NULL, '2025-12-29 16:18:50');
INSERT INTO "public"."access_record" VALUES (2005809812841328642, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812841328643, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812841328644, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812841328645, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812841328646, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812841328647, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812841328648, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812841328649, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812845522945, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812845522946, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20&isHidden=true', 36, '/step/photoType/getPhotoTypeAndPhrase', 'nullnull', NULL, '2025-12-29 16:18:19');
INSERT INTO "public"."access_record" VALUES (2005809812845522947, 'localhost', 18888, NULL, NULL, 30, '/step/photo/UnLikePhoto', 'nullnull', NULL, '2025-12-29 16:18:08');
INSERT INTO "public"."access_record" VALUES (2005809812845522948, 'localhost', 18888, NULL, NULL, 41, '/step/photo/likePhoto', 'nullnull', NULL, '2025-12-29 16:18:08');
INSERT INTO "public"."access_record" VALUES (2005809812845522949, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/06/5c5ef373675b415da11d7d29574b437d_1750874954152.webp', 'nullnull', NULL, '2025-12-29 16:18:02');
INSERT INTO "public"."access_record" VALUES (2005809812845522950, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/06/e779e64876f54c36b4f6ac86005d5465_1750874954085.webp', 'nullnull', NULL, '2025-12-29 16:18:02');
INSERT INTO "public"."access_record" VALUES (2005809812845522951, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/06/00a4a04dc1e346a8a0a4240338ac909a_1750874985543.webp', 'nullnull', NULL, '2025-12-29 16:18:02');
INSERT INTO "public"."access_record" VALUES (2005809812845522952, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/photo/06/d76c98aba9ff4ad9943565d7cc3654ca_1750874985530.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522953, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/photo/06/5d2ce632b7a541b9bee5d0807c8ee355_1750874985500.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522954, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/photo/06/ff8125360b254322b8ce0ae8e991880d_1750874954055.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522955, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/photo/06/645ba59a415246ce9794667d29a3e296_1750874985516.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522956, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/photo/06/4df71d3b2e22476ea674333f9cc41bef_1750874953715.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522957, 'localhost', 18888, NULL, NULL, 21, '/step/Zaohu/2025/photo/06/4241a830878b407ab3301a187420abb0_1750874954134.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522958, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/photo/06/f060950980e74c3ca1d1ee7d9ea19ad7_1750874985555.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522959, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/06/69aad7a169724dcd9ef8f5d8c3b5d588_1750874954169.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522960, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/06/8239779cb8294577bad924ce1b7a035e_1750508397544.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522961, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/photo/06/4be7c9b479024628908aa9cb82614610_1750508397331.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812845522962, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/06/92c6a718f33640e4838bd11aaf207b43_1750874954100.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812853911553, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/photo/06/ddb8f0af0e9444babd722890ed26685f_1750874954193.webp', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812853911554, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20&typeId=13', 76, '/step/photo/getPhoto', 'nullnull', NULL, '2025-12-29 16:18:01');
INSERT INTO "public"."access_record" VALUES (2005809812853911555, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911556, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911557, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911558, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911559, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911560, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911561, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911562, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911563, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911564, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20&isHidden=true', 23, '/step/photoType/getPhotoTypeAndPhrase', 'nullnull', NULL, '2025-12-29 16:17:58');
INSERT INTO "public"."access_record" VALUES (2005809812853911565, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', 'nullnull', NULL, '2025-12-29 16:17:51');
INSERT INTO "public"."access_record" VALUES (2005809812853911566, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', 'nullnull', NULL, '2025-12-29 16:17:51');
INSERT INTO "public"."access_record" VALUES (2005809812853911567, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', 'nullnull', NULL, '2025-12-29 16:17:51');
INSERT INTO "public"."access_record" VALUES (2005809812853911568, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', 'nullnull', NULL, '2025-12-29 16:17:50');
INSERT INTO "public"."access_record" VALUES (2005809812866494465, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', 'nullnull', NULL, '2025-12-29 16:17:50');
INSERT INTO "public"."access_record" VALUES (2005809812866494466, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', 'nullnull', NULL, '2025-12-29 16:17:50');
INSERT INTO "public"."access_record" VALUES (2005809812866494467, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', 'nullnull', NULL, '2025-12-29 16:17:50');
INSERT INTO "public"."access_record" VALUES (2005809812866494468, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', 'nullnull', NULL, '2025-12-29 16:17:50');
INSERT INTO "public"."access_record" VALUES (2005809812866494469, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', 'nullnull', NULL, '2025-12-29 16:17:50');
INSERT INTO "public"."access_record" VALUES (2005809812866494470, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20&isHidden=true', 80, '/step/photoType/getPhotoTypeAndPhrase', 'nullnull', NULL, '2025-12-29 16:17:50');
INSERT INTO "public"."access_record" VALUES (2005809812866494471, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 16:16:17');
INSERT INTO "public"."access_record" VALUES (2005809812866494472, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 16:16:17');
INSERT INTO "public"."access_record" VALUES (2005809812866494473, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 16:16:17');
INSERT INTO "public"."access_record" VALUES (2005809812866494474, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 16:16:17');
INSERT INTO "public"."access_record" VALUES (2005809812870688770, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 16:16:17');
INSERT INTO "public"."access_record" VALUES (2005809812870688771, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 16:16:17');
INSERT INTO "public"."access_record" VALUES (2005809812870688772, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 16:16:17');
INSERT INTO "public"."access_record" VALUES (2005809812870688773, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 18, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:16:16');
INSERT INTO "public"."access_record" VALUES (2005809812870688774, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 16:16:16');
INSERT INTO "public"."access_record" VALUES (2005809812870688775, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 17, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:16:15');
INSERT INTO "public"."access_record" VALUES (2005809812874883073, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', 'nullnull', NULL, '2025-12-29 16:15:57');
INSERT INTO "public"."access_record" VALUES (2005809812874883074, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', 'nullnull', NULL, '2025-12-29 16:15:56');
INSERT INTO "public"."access_record" VALUES (2005809812874883075, 'localhost', 18888, NULL, NULL, 28, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', 'nullnull', NULL, '2025-12-29 16:15:56');
INSERT INTO "public"."access_record" VALUES (2005809812874883076, 'localhost', 18888, NULL, NULL, 27, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', 'nullnull', NULL, '2025-12-29 16:15:56');
INSERT INTO "public"."access_record" VALUES (2005809812874883077, 'localhost', 18888, NULL, NULL, 17, '/step/AppsGames', 'nullnull', NULL, '2025-12-29 16:15:56');
INSERT INTO "public"."access_record" VALUES (2005809812879077377, 'localhost', 18888, NULL, NULL, 48, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', 'nullnull', NULL, '2025-12-29 16:15:56');
INSERT INTO "public"."access_record" VALUES (2005809812879077378, 'localhost', 18888, NULL, NULL, 49, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', 'nullnull', NULL, '2025-12-29 16:15:56');
INSERT INTO "public"."access_record" VALUES (2005809812879077379, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 33, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:15:56');
INSERT INTO "public"."access_record" VALUES (2005809812879077380, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 34, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:15:45');
INSERT INTO "public"."access_record" VALUES (2005809812879077381, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 28, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:15:43');
INSERT INTO "public"."access_record" VALUES (2005809812879077382, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 18, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:15:31');
INSERT INTO "public"."access_record" VALUES (2005809812879077383, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 32, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:15:17');
INSERT INTO "public"."access_record" VALUES (2005809812883271682, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 39, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:14:47');
INSERT INTO "public"."access_record" VALUES (2005809812883271683, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 44, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:14:29');
INSERT INTO "public"."access_record" VALUES (2005809812883271684, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 43, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:14:14');
INSERT INTO "public"."access_record" VALUES (2005809812883271685, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 29, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:13:54');
INSERT INTO "public"."access_record" VALUES (2005809812883271686, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 40, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:12:12');
INSERT INTO "public"."access_record" VALUES (2005809812883271687, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 48, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:11:23');
INSERT INTO "public"."access_record" VALUES (2005809812883271688, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 30, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:08:25');
INSERT INTO "public"."access_record" VALUES (2005809812883271689, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 40, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:08:10');
INSERT INTO "public"."access_record" VALUES (2005809812883271690, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 36, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 16:08:04');
INSERT INTO "public"."access_record" VALUES (2005809812891660290, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 50, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:52:35');
INSERT INTO "public"."access_record" VALUES (2005809812891660291, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 39, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:52:20');
INSERT INTO "public"."access_record" VALUES (2005809812891660292, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 37, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:50:01');
INSERT INTO "public"."access_record" VALUES (2005809812891660293, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 56, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:49:53');
INSERT INTO "public"."access_record" VALUES (2005809812900048898, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 33, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:49:39');
INSERT INTO "public"."access_record" VALUES (2005809812900048899, 'localhost', 18888, NULL, NULL, 358, '/step/article/addArticle', 'nullnull', NULL, '2025-12-29 15:49:39');
INSERT INTO "public"."access_record" VALUES (2005809812900048900, 'localhost', 18888, NULL, NULL, 7, '/step/tag/list', 'nullnull', NULL, '2025-12-29 15:40:37');
INSERT INTO "public"."access_record" VALUES (2005809812900048901, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', 'nullnull', NULL, '2025-12-29 15:40:36');
INSERT INTO "public"."access_record" VALUES (2005809812900048902, 'localhost', 18888, NULL, NULL, 32, '/step/mood/list', 'nullnull', NULL, '2025-12-29 15:40:36');
INSERT INTO "public"."access_record" VALUES (2005809812900048903, 'localhost', 18888, NULL, NULL, 125, '/step/type/list', 'nullnull', NULL, '2025-12-29 15:40:36');
INSERT INTO "public"."access_record" VALUES (2005809812904243201, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 35, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:40:35');
INSERT INTO "public"."access_record" VALUES (2005809812904243202, 'localhost', 18888, NULL, NULL, 12, '/step/tag/list', 'nullnull', NULL, '2025-12-29 15:40:31');
INSERT INTO "public"."access_record" VALUES (2005809812904243203, 'localhost', 18888, NULL, NULL, 6, '/step/weather/list', 'nullnull', NULL, '2025-12-29 15:40:31');
INSERT INTO "public"."access_record" VALUES (2005809812904243204, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', 'nullnull', NULL, '2025-12-29 15:40:31');
INSERT INTO "public"."access_record" VALUES (2005809812904243205, 'localhost', 18888, NULL, NULL, 165, '/step/type/list', 'nullnull', NULL, '2025-12-29 15:40:31');
INSERT INTO "public"."access_record" VALUES (2005809812904243207, 'localhost', 18888, NULL, NULL, 8, '/step/weather/list', 'nullnull', NULL, '2025-12-29 15:39:54');
INSERT INTO "public"."access_record" VALUES (2005809812908437505, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', 'nullnull', NULL, '2025-12-29 15:39:54');
INSERT INTO "public"."access_record" VALUES (2005809812908437506, 'localhost', 18888, NULL, NULL, 18, '/step/type/list', 'nullnull', NULL, '2025-12-29 15:39:54');
INSERT INTO "public"."access_record" VALUES (2005809812908437507, 'localhost', 18888, NULL, NULL, 224, '/step/article/addArticle', 'nullnull', NULL, '2025-12-29 15:38:50');
INSERT INTO "public"."access_record" VALUES (2005809812908437508, 'localhost', 18888, NULL, NULL, 544, '/step/article/addArticle', 'nullnull', NULL, '2025-12-29 15:38:31');
INSERT INTO "public"."access_record" VALUES (2005809812908437509, 'localhost', 18888, NULL, NULL, 19, '/step/tag/list', 'nullnull', NULL, '2025-12-29 15:37:35');
INSERT INTO "public"."access_record" VALUES (2005809812908437510, 'localhost', 18888, NULL, NULL, 19, '/step/weather/list', 'nullnull', NULL, '2025-12-29 15:37:34');
INSERT INTO "public"."access_record" VALUES (2005809812908437511, 'localhost', 18888, NULL, NULL, 27, '/step/mood/list', 'nullnull', NULL, '2025-12-29 15:37:34');
INSERT INTO "public"."access_record" VALUES (2005809812916826114, 'localhost', 18888, NULL, NULL, 31, '/step/type/list', 'nullnull', NULL, '2025-12-29 15:37:34');
INSERT INTO "public"."access_record" VALUES (2005809812916826115, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 37, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:34:19');
INSERT INTO "public"."access_record" VALUES (2005809812916826116, '127.0.0.1', 18888, NULL, NULL, 30927, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:34:04');
INSERT INTO "public"."access_record" VALUES (2005809812916826117, '127.0.0.1', 18888, NULL, NULL, 10277, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:33:08');
INSERT INTO "public"."access_record" VALUES (2005809812916826118, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 64, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:31:42');
INSERT INTO "public"."access_record" VALUES (2005809812916826119, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', 'nullnull', NULL, '2025-12-29 15:31:27');
INSERT INTO "public"."access_record" VALUES (2005809812916826120, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', 'nullnull', NULL, '2025-12-29 15:31:27');
INSERT INTO "public"."access_record" VALUES (2005809812916826121, 'localhost', 18888, NULL, NULL, 12, '/step/mood/list', 'nullnull', NULL, '2025-12-29 15:31:27');
INSERT INTO "public"."access_record" VALUES (2005809812921020417, 'localhost', 18888, NULL, NULL, 15, '/step/type/list', 'nullnull', NULL, '2025-12-29 15:31:27');
INSERT INTO "public"."access_record" VALUES (2005809812921020418, '127.0.0.1', 18888, NULL, NULL, 144, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:31:12');
INSERT INTO "public"."access_record" VALUES (2005809812921020419, '127.0.0.1', 18888, NULL, NULL, 66, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:31:11');
INSERT INTO "public"."access_record" VALUES (2005809812921020420, '127.0.0.1', 18888, NULL, NULL, 68, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:31:09');
INSERT INTO "public"."access_record" VALUES (2005809812921020421, 'localhost', 18888, NULL, NULL, 23, '/step/tag/list', 'nullnull', NULL, '2025-12-29 15:29:58');
INSERT INTO "public"."access_record" VALUES (2005809812921020422, 'localhost', 18888, NULL, NULL, 24, '/step/weather/list', 'nullnull', NULL, '2025-12-29 15:29:58');
INSERT INTO "public"."access_record" VALUES (2005809812921020423, 'localhost', 18888, NULL, NULL, 24, '/step/mood/list', 'nullnull', NULL, '2025-12-29 15:29:58');
INSERT INTO "public"."access_record" VALUES (2005809812921020424, 'localhost', 18888, NULL, NULL, 84, '/step/type/list', 'nullnull', NULL, '2025-12-29 15:29:58');
INSERT INTO "public"."access_record" VALUES (2005809812921020425, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 64, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:29:29');
INSERT INTO "public"."access_record" VALUES (2005809812921020426, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 30, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:28:30');
INSERT INTO "public"."access_record" VALUES (2005809812921020427, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 36, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:28:21');
INSERT INTO "public"."access_record" VALUES (2005809812921020428, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 76, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 15:27:05');
INSERT INTO "public"."access_record" VALUES (2005809812921020429, 'localhost', 18888, NULL, NULL, 249, '/step/login', 'nullnull', NULL, '2025-12-29 15:27:02');
INSERT INTO "public"."access_record" VALUES (2005809812921020430, '127.0.0.1', 18888, NULL, NULL, 16004, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:24:48');
INSERT INTO "public"."access_record" VALUES (2005809812921020431, '127.0.0.1', 18888, NULL, NULL, 720, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:24:06');
INSERT INTO "public"."access_record" VALUES (2005809812925214722, '127.0.0.1', 18888, NULL, NULL, 993, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:14:15');
INSERT INTO "public"."access_record" VALUES (2005809812925214723, '127.0.0.1', 18888, NULL, NULL, 29, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:11:26');
INSERT INTO "public"."access_record" VALUES (2005809812925214724, '127.0.0.1', 18888, NULL, NULL, 29, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:11:17');
INSERT INTO "public"."access_record" VALUES (2005809812925214725, '127.0.0.1', 18888, NULL, NULL, 73, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:01:07');
INSERT INTO "public"."access_record" VALUES (2005809812925214726, '127.0.0.1', 18888, NULL, NULL, 55, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 15:00:45');
INSERT INTO "public"."access_record" VALUES (2005809812925214727, '127.0.0.1', 18888, NULL, 'phone=1665285189&password=asd1230.0', 358, '/step/login', '未知内网IP', '内网IP', '2025-12-29 14:59:23');
INSERT INTO "public"."access_record" VALUES (2005809812933603329, '127.0.0.1', 18888, NULL, NULL, 1356, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-29 14:59:15');
INSERT INTO "public"."access_record" VALUES (2005809812933603330, 'localhost', 18888, NULL, NULL, 32, '/step/tag/list', 'nullnull', NULL, '2025-12-29 11:41:06');
INSERT INTO "public"."access_record" VALUES (2005809812933603331, 'localhost', 18888, NULL, NULL, 32, '/step/weather/list', 'nullnull', NULL, '2025-12-29 11:41:06');
INSERT INTO "public"."access_record" VALUES (2005809812933603332, 'localhost', 18888, NULL, NULL, 28, '/step/mood/list', 'nullnull', NULL, '2025-12-29 11:41:06');
INSERT INTO "public"."access_record" VALUES (2005809812933603333, 'localhost', 18888, NULL, NULL, 32, '/step/type/list', 'nullnull', NULL, '2025-12-29 11:41:06');
INSERT INTO "public"."access_record" VALUES (2005809812933603334, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 205, '/step/article/getDairy', 'nullnull', NULL, '2025-12-29 11:39:03');
INSERT INTO "public"."access_record" VALUES (2005809812933603335, 'localhost', 18888, NULL, NULL, 923, '/step/login', 'nullnull', NULL, '2025-12-29 11:38:58');
INSERT INTO "public"."access_record" VALUES (2005809812933603336, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 47, '/step/article/getDairy', 'nullnull', NULL, '2025-12-26 17:48:26');
INSERT INTO "public"."access_record" VALUES (2005809812933603337, 'localhost', 18888, NULL, NULL, 35, '/step/tag/list', 'nullnull', NULL, '2025-12-26 17:48:06');
INSERT INTO "public"."access_record" VALUES (2005809812933603338, 'localhost', 18888, NULL, NULL, 30, '/step/weather/list', 'nullnull', NULL, '2025-12-26 17:48:06');
INSERT INTO "public"."access_record" VALUES (2005809812937797634, 'localhost', 18888, NULL, NULL, 30, '/step/mood/list', 'nullnull', NULL, '2025-12-26 17:48:06');
INSERT INTO "public"."access_record" VALUES (2005809812937797635, 'localhost', 18888, NULL, NULL, 25, '/step/type/list', 'nullnull', NULL, '2025-12-26 17:48:06');
INSERT INTO "public"."access_record" VALUES (2005809812937797636, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 176, '/step/article/getDairy', 'nullnull', NULL, '2025-12-26 17:47:49');
INSERT INTO "public"."access_record" VALUES (2005809812937797637, 'localhost', 18888, NULL, NULL, 333, '/step/login', 'nullnull', NULL, '2025-12-26 17:47:40');
INSERT INTO "public"."access_record" VALUES (2005817362148106242, '127.0.0.1', 18888, NULL, NULL, 443, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 09:36:27');
INSERT INTO "public"."access_record" VALUES (2005832461692870657, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461709647874, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461709647875, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461709647876, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461718036482, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461718036483, 'localhost', 18888, NULL, NULL, 36, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461722230785, 'localhost', 18888, NULL, NULL, 36, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461722230786, 'localhost', 18888, NULL, NULL, 36, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461722230787, 'localhost', 18888, NULL, NULL, 36, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461722230788, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20', 69, '/step/photoType/getPhotoType', '未知内网IP', '内网IP', '2025-12-30 10:44:48');
INSERT INTO "public"."access_record" VALUES (2005832461722230789, 'localhost', 18888, NULL, NULL, 948, '/step/login', '未知内网IP', '内网IP', '2025-12-30 10:44:45');
INSERT INTO "public"."access_record" VALUES (2005836236256092161, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:58:24');
INSERT INTO "public"."access_record" VALUES (2005836236256092162, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:24');
INSERT INTO "public"."access_record" VALUES (2005836236256092163, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:24');
INSERT INTO "public"."access_record" VALUES (2005836236256092164, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:24');
INSERT INTO "public"."access_record" VALUES (2005836236256092165, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:24');
INSERT INTO "public"."access_record" VALUES (2005836236323201025, 'localhost', 18888, NULL, NULL, 23, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:58:24');
INSERT INTO "public"."access_record" VALUES (2005836236323201026, 'localhost', 18888, NULL, NULL, 20, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:58:24');
INSERT INTO "public"."access_record" VALUES (2005836236323201027, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:58:23');
INSERT INTO "public"."access_record" VALUES (2005836236323201028, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:23');
INSERT INTO "public"."access_record" VALUES (2005836236323201029, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:23');
INSERT INTO "public"."access_record" VALUES (2005836236323201030, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:58:23');
INSERT INTO "public"."access_record" VALUES (2005836236323201031, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 44, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:58:23');
INSERT INTO "public"."access_record" VALUES (2005836236348366849, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366850, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366851, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366852, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366853, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366854, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366855, 'localhost', 18888, NULL, NULL, 16, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366856, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366857, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366858, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366859, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:58:06');
INSERT INTO "public"."access_record" VALUES (2005836236348366860, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 39, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:58:05');
INSERT INTO "public"."access_record" VALUES (2005836236348366861, 'localhost', 18888, NULL, NULL, 8, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236348366862, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236348366863, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236348366864, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236348366865, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236348366866, 'localhost', 18888, NULL, NULL, 8, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236348366867, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236411281409, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236411281410, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236411281411, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:57:53');
INSERT INTO "public"."access_record" VALUES (2005836236411281412, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 36, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:57:52');
INSERT INTO "public"."access_record" VALUES (2005836236411281413, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:57:52');
INSERT INTO "public"."access_record" VALUES (2005836236411281414, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:57:45');
INSERT INTO "public"."access_record" VALUES (2005836236411281415, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:45');
INSERT INTO "public"."access_record" VALUES (2005836236411281416, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:45');
INSERT INTO "public"."access_record" VALUES (2005836236411281417, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:45');
INSERT INTO "public"."access_record" VALUES (2005836236411281418, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:44');
INSERT INTO "public"."access_record" VALUES (2005836236411281419, 'localhost', 18888, NULL, NULL, 17, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:57:44');
INSERT INTO "public"."access_record" VALUES (2005836236411281420, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:44');
INSERT INTO "public"."access_record" VALUES (2005836236411281421, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:57:44');
INSERT INTO "public"."access_record" VALUES (2005836236411281422, 'localhost', 18888, NULL, NULL, 13, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:57:44');
INSERT INTO "public"."access_record" VALUES (2005836236411281423, 'localhost', 18888, NULL, NULL, 18, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:57:44');
INSERT INTO "public"."access_record" VALUES (2005836236411281424, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:57:44');
INSERT INTO "public"."access_record" VALUES (2005836236411281425, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 56, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:57:44');
INSERT INTO "public"."access_record" VALUES (2005836236411281426, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:55:42');
INSERT INTO "public"."access_record" VALUES (2005836236411281427, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:42');
INSERT INTO "public"."access_record" VALUES (2005836236411281428, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236411281429, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236411281430, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236411281431, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236411281432, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236474195970, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236474195971, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236474195972, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236474195973, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236474195974, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 36, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:55:41');
INSERT INTO "public"."access_record" VALUES (2005836236474195975, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195976, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195977, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195978, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195979, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195980, 'localhost', 18888, NULL, NULL, 20, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195981, 'localhost', 18888, NULL, NULL, 17, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195982, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195983, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195984, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:55:27');
INSERT INTO "public"."access_record" VALUES (2005836236474195985, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 53, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:55:26');
INSERT INTO "public"."access_record" VALUES (2005836236474195986, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:55:26');
INSERT INTO "public"."access_record" VALUES (2005836236474195987, 'localhost', 18888, NULL, NULL, 9, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:55:16');
INSERT INTO "public"."access_record" VALUES (2005836236474195988, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:16');
INSERT INTO "public"."access_record" VALUES (2005836236474195989, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195990, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195991, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195992, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195993, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195994, 'localhost', 18888, NULL, NULL, 19, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195995, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195996, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195997, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195998, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 38, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:55:15');
INSERT INTO "public"."access_record" VALUES (2005836236474195999, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:55:00');
INSERT INTO "public"."access_record" VALUES (2005836236541304834, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304835, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304836, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304837, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304838, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304839, 'localhost', 18888, NULL, NULL, 15, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304840, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304841, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304842, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304843, 'localhost', 18888, NULL, NULL, 8, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:54:59');
INSERT INTO "public"."access_record" VALUES (2005836236541304844, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 36, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:54:58');
INSERT INTO "public"."access_record" VALUES (2005836236541304845, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304846, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304847, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304848, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304849, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304850, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304851, 'localhost', 18888, NULL, NULL, 10, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304852, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304853, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304854, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:54:46');
INSERT INTO "public"."access_record" VALUES (2005836236541304855, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:54:45');
INSERT INTO "public"."access_record" VALUES (2005836236541304856, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 30, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:54:45');
INSERT INTO "public"."access_record" VALUES (2005836236541304857, 'localhost', 18888, NULL, NULL, 35, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 10:49:06');
INSERT INTO "public"."access_record" VALUES (2005836236541304858, 'localhost', 18888, NULL, NULL, 26, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304859, 'localhost', 18888, NULL, NULL, 34, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304860, 'localhost', 18888, NULL, NULL, 24, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304861, 'localhost', 18888, NULL, NULL, 27, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304862, 'localhost', 18888, NULL, NULL, 32, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304863, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304864, 'localhost', 18888, NULL, NULL, 32, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304865, 'localhost', 18888, NULL, NULL, 24, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304866, 'localhost', 18888, NULL, NULL, 12, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304867, 'localhost', 18888, NULL, NULL, 26, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304868, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 80, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 10:49:05');
INSERT INTO "public"."access_record" VALUES (2005836236541304869, 'localhost', 18888, NULL, NULL, 31, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 10:49:01');
INSERT INTO "public"."access_record" VALUES (2005836236541304870, 'localhost', 18888, NULL, NULL, 25, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 10:49:01');
INSERT INTO "public"."access_record" VALUES (2005836236541304871, 'localhost', 18888, NULL, NULL, 19, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 10:49:01');
INSERT INTO "public"."access_record" VALUES (2005836236541304872, 'localhost', 18888, NULL, NULL, 60, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 10:49:00');
INSERT INTO "public"."access_record" VALUES (2005847561321545730, 'localhost', 18888, NULL, NULL, 90, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2025-12-30 11:43:10');
INSERT INTO "public"."access_record" VALUES (2005847561342517250, 'localhost', 18888, NULL, NULL, 406, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2025-12-30 11:42:55');
INSERT INTO "public"."access_record" VALUES (2005847561342517251, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:44');
INSERT INTO "public"."access_record" VALUES (2005847561342517252, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:44');
INSERT INTO "public"."access_record" VALUES (2005847561342517253, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:44');
INSERT INTO "public"."access_record" VALUES (2005847561342517254, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:44');
INSERT INTO "public"."access_record" VALUES (2005847561342517255, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:44');
INSERT INTO "public"."access_record" VALUES (2005847561342517256, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:44');
INSERT INTO "public"."access_record" VALUES (2005847561342517257, 'localhost', 18888, NULL, NULL, 31, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 11:40:44');
INSERT INTO "public"."access_record" VALUES (2005847561409626114, 'localhost', 18888, NULL, NULL, 18, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 11:40:44');
INSERT INTO "public"."access_record" VALUES (2005847561409626115, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:43');
INSERT INTO "public"."access_record" VALUES (2005847561409626116, 'localhost', 18888, NULL, NULL, 18, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 11:40:43');
INSERT INTO "public"."access_record" VALUES (2005847561409626117, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:43');
INSERT INTO "public"."access_record" VALUES (2005847561409626118, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:43');
INSERT INTO "public"."access_record" VALUES (2005847561409626119, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 468, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:40:43');
INSERT INTO "public"."access_record" VALUES (2005847561409626120, 'localhost', 18888, NULL, NULL, 17, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 11:40:43');
INSERT INTO "public"."access_record" VALUES (2005847561409626121, 'localhost', 18888, NULL, NULL, 187, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 11:40:43');
INSERT INTO "public"."access_record" VALUES (2005847561409626122, 'localhost', 18888, NULL, NULL, 169, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:40:39');
INSERT INTO "public"."access_record" VALUES (2005847561409626123, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:36:02');
INSERT INTO "public"."access_record" VALUES (2005847561409626124, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:36:02');
INSERT INTO "public"."access_record" VALUES (2005847561409626125, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:36:02');
INSERT INTO "public"."access_record" VALUES (2005847561409626126, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 11:35:58');
INSERT INTO "public"."access_record" VALUES (2005847561409626127, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561409626128, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561409626129, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561409626130, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561409626131, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561409626132, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561409626133, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561472540674, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561472540675, 'localhost', 18888, NULL, NULL, 113, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 11:35:57');
INSERT INTO "public"."access_record" VALUES (2005847561472540676, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 11:35:56');
INSERT INTO "public"."access_record" VALUES (2005847561472540677, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 19, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:35:56');
INSERT INTO "public"."access_record" VALUES (2005847561472540678, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:51');
INSERT INTO "public"."access_record" VALUES (2005847561472540679, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:51');
INSERT INTO "public"."access_record" VALUES (2005847561472540680, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:51');
INSERT INTO "public"."access_record" VALUES (2007640625966931969, 'localhost', 18888, NULL, NULL, 103, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 10:22:04');
INSERT INTO "public"."access_record" VALUES (2005847561472540681, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:50');
INSERT INTO "public"."access_record" VALUES (2005847561472540682, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:50');
INSERT INTO "public"."access_record" VALUES (2005847561472540683, 'localhost', 18888, NULL, NULL, 11, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 11:35:50');
INSERT INTO "public"."access_record" VALUES (2005847561472540684, 'localhost', 18888, NULL, NULL, 26, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561472540685, 'localhost', 18888, NULL, NULL, 17, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561472540686, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561510289409, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561510289410, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561510289411, 'localhost', 18888, NULL, NULL, 9, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561510289412, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561510289413, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 27, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561510289414, 'localhost', 18888, NULL, NULL, 12, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 11:35:49');
INSERT INTO "public"."access_record" VALUES (2005847561510289415, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 25, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:35:48');
INSERT INTO "public"."access_record" VALUES (2005847561510289416, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289417, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289418, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289419, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289420, 'localhost', 18888, NULL, NULL, 12, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289421, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289422, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289423, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289424, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289425, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289426, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 40, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289427, 'localhost', 18888, NULL, NULL, 14, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 11:35:08');
INSERT INTO "public"."access_record" VALUES (2005847561510289428, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289429, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289430, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289431, 'localhost', 18888, NULL, NULL, 12, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289432, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289433, 'localhost', 18888, NULL, NULL, 12, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289434, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289435, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289436, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289437, 'localhost', 18888, NULL, NULL, 12, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 11:34:27');
INSERT INTO "public"."access_record" VALUES (2005847561510289438, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 54, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:34:26');
INSERT INTO "public"."access_record" VALUES (2005847561510289439, 'localhost', 18888, NULL, NULL, 31, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 11:34:26');
INSERT INTO "public"."access_record" VALUES (2005847561510289440, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:15');
INSERT INTO "public"."access_record" VALUES (2005847561510289441, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:14');
INSERT INTO "public"."access_record" VALUES (2005847561510289442, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:08');
INSERT INTO "public"."access_record" VALUES (2005847561573203969, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:08');
INSERT INTO "public"."access_record" VALUES (2005847561573203970, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:08');
INSERT INTO "public"."access_record" VALUES (2005847561573203971, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:05');
INSERT INTO "public"."access_record" VALUES (2005847561573203972, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:04');
INSERT INTO "public"."access_record" VALUES (2005847561573203973, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:03');
INSERT INTO "public"."access_record" VALUES (2005847561573203974, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:03');
INSERT INTO "public"."access_record" VALUES (2005847561573203975, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:31:03');
INSERT INTO "public"."access_record" VALUES (2005847561573203976, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:56');
INSERT INTO "public"."access_record" VALUES (2005847561573203977, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 11:30:56');
INSERT INTO "public"."access_record" VALUES (2005847561573203978, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:56');
INSERT INTO "public"."access_record" VALUES (2005847561573203979, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 11:30:56');
INSERT INTO "public"."access_record" VALUES (2007640625966931970, 'localhost', 18888, NULL, NULL, 101, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 10:21:55');
INSERT INTO "public"."access_record" VALUES (2005847561573203980, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:56');
INSERT INTO "public"."access_record" VALUES (2005847561573203981, 'localhost', 18888, NULL, NULL, 9, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 11:30:56');
INSERT INTO "public"."access_record" VALUES (2005847561573203982, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 11:30:56');
INSERT INTO "public"."access_record" VALUES (2005847561573203983, 'localhost', 18888, NULL, NULL, 8, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 11:30:55');
INSERT INTO "public"."access_record" VALUES (2005847561573203984, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:55');
INSERT INTO "public"."access_record" VALUES (2005847561573203985, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:55');
INSERT INTO "public"."access_record" VALUES (2005847561573203986, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:55');
INSERT INTO "public"."access_record" VALUES (2005847561573203987, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 57, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:30:55');
INSERT INTO "public"."access_record" VALUES (2005847561573203988, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:54');
INSERT INTO "public"."access_record" VALUES (2005847561573203989, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:54');
INSERT INTO "public"."access_record" VALUES (2005847561573203990, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:54');
INSERT INTO "public"."access_record" VALUES (2005847561573203991, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:20');
INSERT INTO "public"."access_record" VALUES (2005847561573203992, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:20');
INSERT INTO "public"."access_record" VALUES (2005847561573203993, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', '未知内网IP', '内网IP', '2025-12-30 11:30:20');
INSERT INTO "public"."access_record" VALUES (2005847561573203994, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:20');
INSERT INTO "public"."access_record" VALUES (2005847561573203995, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2025-12-30 11:30:20');
INSERT INTO "public"."access_record" VALUES (2005847561573203996, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:20');
INSERT INTO "public"."access_record" VALUES (2005847561573203997, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:20');
INSERT INTO "public"."access_record" VALUES (2005847561573203998, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2025-12-30 11:30:19');
INSERT INTO "public"."access_record" VALUES (2005847561573203999, 'localhost', 18888, NULL, NULL, 10, '/step/weather/list', '未知内网IP', '内网IP', '2025-12-30 11:30:19');
INSERT INTO "public"."access_record" VALUES (2005847561573204000, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 40, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:30:19');
INSERT INTO "public"."access_record" VALUES (2005847561573204001, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2025-12-30 11:30:19');
INSERT INTO "public"."access_record" VALUES (2005847561573204002, 'localhost', 18888, NULL, NULL, 12, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 11:30:19');
INSERT INTO "public"."access_record" VALUES (2005847561573204003, 'localhost', 18888, NULL, NULL, 30, '/step/type/list', '未知内网IP', '内网IP', '2025-12-30 11:30:19');
INSERT INTO "public"."access_record" VALUES (2005847561573204004, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 53, '/step/article/getDairy', '未知内网IP', '内网IP', '2025-12-30 11:30:18');
INSERT INTO "public"."access_record" VALUES (2007629301564235778, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818690, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818691, 'localhost', 18888, NULL, NULL, 26, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818692, 'localhost', 18888, NULL, NULL, 33, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818693, 'localhost', 18888, NULL, NULL, 39, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818694, 'localhost', 18888, NULL, NULL, 36, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818695, 'localhost', 18888, NULL, NULL, 38, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818696, 'localhost', 18888, NULL, NULL, 35, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818697, 'localhost', 18888, NULL, NULL, 30, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818698, 'localhost', 18888, NULL, NULL, 12, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 09:39:18');
INSERT INTO "public"."access_record" VALUES (2007629301576818699, 'localhost', 18888, NULL, NULL, 26, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818700, 'localhost', 18888, NULL, NULL, 8, '/step/DsV2YBjr5Z', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818701, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 143, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818702, 'localhost', 18888, NULL, NULL, 14, '/step/RBE2QL1hwn', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818703, 'localhost', 18888, NULL, NULL, 12, '/step/0IZZF2wztZ', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818704, 'localhost', 18888, NULL, NULL, 11, '/step/5nmUaXhwqq', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818705, 'localhost', 18888, NULL, NULL, 7, '/step/iYR4poIIsr', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818706, 'localhost', 18888, NULL, NULL, 7, '/step/hX6JIx9qGI', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818707, 'localhost', 18888, NULL, NULL, 22, '/step/G9zyVbi0Gf', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818708, 'localhost', 18888, NULL, NULL, 20, '/step/z11rakoUzQ', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818709, 'localhost', 18888, NULL, NULL, 12, '/step/6QIf2EFc5Y', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818710, 'localhost', 18888, NULL, NULL, 12, '/step/TCkzYg3rXp', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818711, 'localhost', 18888, NULL, NULL, 12, '/step/tvKJJMgyNJ', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818712, 'localhost', 18888, NULL, NULL, 11, '/step/SwarPZFNWw', '未知内网IP', '内网IP', '2026-01-04 09:39:17');
INSERT INTO "public"."access_record" VALUES (2007629301576818713, 'localhost', 18888, NULL, NULL, 23, '/step/wAxJ65FAw3', '未知内网IP', '内网IP', '2026-01-04 09:39:16');
INSERT INTO "public"."access_record" VALUES (2007629301576818714, 'localhost', 18888, NULL, NULL, 62, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 09:39:16');
INSERT INTO "public"."access_record" VALUES (2007629301576818715, 'localhost', 18888, NULL, NULL, 18, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301576818716, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301576818717, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301648121857, 'localhost', 18888, NULL, NULL, 33, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301648121858, 'localhost', 18888, NULL, NULL, 33, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301648121859, 'localhost', 18888, NULL, NULL, 43, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301648121860, 'localhost', 18888, NULL, NULL, 42, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301648121861, 'localhost', 18888, NULL, NULL, 42, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301648121862, 'localhost', 18888, NULL, NULL, 42, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301648121863, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20', 144, '/step/photoType/getPhotoType', '未知内网IP', '内网IP', '2026-01-04 09:39:15');
INSERT INTO "public"."access_record" VALUES (2007629301648121864, 'localhost', 18888, NULL, NULL, 2558, '/step/login', '未知内网IP', '内网IP', '2026-01-04 09:39:11');
INSERT INTO "public"."access_record" VALUES (2007633076207149058, 'localhost', 18888, NULL, NULL, 73, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 09:52:25');
INSERT INTO "public"."access_record" VALUES (2007633076211343361, 'localhost', 18888, NULL, NULL, 706, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 09:52:16');
INSERT INTO "public"."access_record" VALUES (2007633076211343362, 'localhost', 18888, NULL, NULL, 110, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 09:52:05');
INSERT INTO "public"."access_record" VALUES (2007633076211343363, 'localhost', 18888, NULL, NULL, 110, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 09:52:05');
INSERT INTO "public"."access_record" VALUES (2007633076211343364, 'localhost', 18888, NULL, NULL, 110, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 09:52:05');
INSERT INTO "public"."access_record" VALUES (2007640625853685761, 'localhost', 18888, NULL, NULL, 156, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 10:23:20');
INSERT INTO "public"."access_record" VALUES (2007640625862074370, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:18');
INSERT INTO "public"."access_record" VALUES (2007640625862074371, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:18');
INSERT INTO "public"."access_record" VALUES (2007640625862074372, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:18');
INSERT INTO "public"."access_record" VALUES (2007640625870462977, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625870462978, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625870462979, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625878851585, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625883045890, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625883045891, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625891434498, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625891434499, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625895628802, 'localhost', 18888, NULL, NULL, 15, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 10:23:10');
INSERT INTO "public"."access_record" VALUES (2007640625895628803, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 10:23:09');
INSERT INTO "public"."access_record" VALUES (2007640625895628804, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 10:23:09');
INSERT INTO "public"."access_record" VALUES (2007640625904017410, 'localhost', 18888, NULL, NULL, 10, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 10:23:09');
INSERT INTO "public"."access_record" VALUES (2007640625908211714, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625908211715, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625916600322, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625920794626, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625924988930, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625924988931, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625933377537, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625933377538, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625937571841, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625937571842, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625937571843, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 10:23:01');
INSERT INTO "public"."access_record" VALUES (2007640625937571844, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 33, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 10:23:00');
INSERT INTO "public"."access_record" VALUES (2007640625941766146, 'localhost', 18888, NULL, NULL, 39, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 10:22:24');
INSERT INTO "public"."access_record" VALUES (2007640625941766147, 'localhost', 18888, NULL, NULL, 35, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 10:22:24');
INSERT INTO "public"."access_record" VALUES (2007640625941766148, 'localhost', 18888, NULL, NULL, 30, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 10:22:24');
INSERT INTO "public"."access_record" VALUES (2007640625941766149, 'localhost', 18888, NULL, NULL, 22, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 10:22:24');
INSERT INTO "public"."access_record" VALUES (2007640625941766150, 'localhost', 18888, NULL, NULL, 24, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 10:22:24');
INSERT INTO "public"."access_record" VALUES (2007640625941766151, 'localhost', 18888, NULL, NULL, 19, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 10:22:24');
INSERT INTO "public"."access_record" VALUES (2007640625954349057, 'localhost', 18888, NULL, NULL, 10, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 10:22:24');
INSERT INTO "public"."access_record" VALUES (2007640625954349058, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 10:22:23');
INSERT INTO "public"."access_record" VALUES (2007640625958543362, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 10:22:23');
INSERT INTO "public"."access_record" VALUES (2007640625962737665, 'localhost', 18888, NULL, NULL, 18, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 10:22:23');
INSERT INTO "public"."access_record" VALUES (2007640625962737666, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 68, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 10:22:23');
INSERT INTO "public"."access_record" VALUES (2007640625962737667, 'localhost', 18888, NULL, NULL, 33, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 10:22:23');
INSERT INTO "public"."access_record" VALUES (2007640625966931971, 'localhost', 18888, NULL, NULL, 35, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 10:21:53');
INSERT INTO "public"."access_record" VALUES (2007640625966931972, 'localhost', 18888, NULL, NULL, 326, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 10:21:42');
INSERT INTO "public"."access_record" VALUES (2007648178796904449, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:50');
INSERT INTO "public"."access_record" VALUES (2007648178822070273, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:49');
INSERT INTO "public"."access_record" VALUES (2007648178830458882, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:49');
INSERT INTO "public"."access_record" VALUES (2007648178834653186, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 10:58:48');
INSERT INTO "public"."access_record" VALUES (2007648178834653187, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:48');
INSERT INTO "public"."access_record" VALUES (2007648178843041794, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178847236097, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178847236098, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178855624705, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178855624706, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178855624707, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178864013314, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178868207617, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178872401921, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 36, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178876596225, 'localhost', 18888, NULL, NULL, 15, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 10:58:47');
INSERT INTO "public"."access_record" VALUES (2007648178880790529, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:19');
INSERT INTO "public"."access_record" VALUES (2007648178880790530, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 10:58:19');
INSERT INTO "public"."access_record" VALUES (2007648178880790531, 'localhost', 18888, NULL, NULL, 7, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 10:58:19');
INSERT INTO "public"."access_record" VALUES (2007648178889179137, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:19');
INSERT INTO "public"."access_record" VALUES (2007648178889179138, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:19');
INSERT INTO "public"."access_record" VALUES (2007648178893373442, 'localhost', 18888, NULL, NULL, 12, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 10:58:19');
INSERT INTO "public"."access_record" VALUES (2007648178893373443, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:18');
INSERT INTO "public"."access_record" VALUES (2007648178893373444, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:18');
INSERT INTO "public"."access_record" VALUES (2007648178901762049, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 10:58:18');
INSERT INTO "public"."access_record" VALUES (2007648178901762050, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 10:58:18');
INSERT INTO "public"."access_record" VALUES (2007648178901762051, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 39, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 10:58:18');
INSERT INTO "public"."access_record" VALUES (2007648178910150658, 'localhost', 18888, NULL, NULL, 22, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 10:58:18');
INSERT INTO "public"."access_record" VALUES (2007651950499610625, 'localhost', 18888, NULL, NULL, 180, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:14:28');
INSERT INTO "public"."access_record" VALUES (2007651950503804929, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:22');
INSERT INTO "public"."access_record" VALUES (2007651950503804930, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:22');
INSERT INTO "public"."access_record" VALUES (2007651950503804931, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:22');
INSERT INTO "public"."access_record" VALUES (2007651950507999234, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:14:18');
INSERT INTO "public"."access_record" VALUES (2007651950507999235, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:18');
INSERT INTO "public"."access_record" VALUES (2007651950507999236, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:18');
INSERT INTO "public"."access_record" VALUES (2007651950507999237, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:14:18');
INSERT INTO "public"."access_record" VALUES (2007651950507999238, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:18');
INSERT INTO "public"."access_record" VALUES (2007651950512193538, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:14:18');
INSERT INTO "public"."access_record" VALUES (2007651950512193539, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:17');
INSERT INTO "public"."access_record" VALUES (2007651950512193540, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:17');
INSERT INTO "public"."access_record" VALUES (2007651950512193541, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:14:17');
INSERT INTO "public"."access_record" VALUES (2007651950512193542, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:14:17');
INSERT INTO "public"."access_record" VALUES (2007651950516387841, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 23, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:14:17');
INSERT INTO "public"."access_record" VALUES (2007651950520582145, 'localhost', 18888, NULL, NULL, 9, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:14:17');
INSERT INTO "public"."access_record" VALUES (2007651950587691010, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:13:38');
INSERT INTO "public"."access_record" VALUES (2007651950587691011, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:38');
INSERT INTO "public"."access_record" VALUES (2007651950587691012, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:38');
INSERT INTO "public"."access_record" VALUES (2007651950600273921, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:38');
INSERT INTO "public"."access_record" VALUES (2007651950600273922, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:38');
INSERT INTO "public"."access_record" VALUES (2007651950600273923, 'localhost', 18888, NULL, NULL, 12, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:13:37');
INSERT INTO "public"."access_record" VALUES (2007651950600273924, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:13:37');
INSERT INTO "public"."access_record" VALUES (2007651950604468225, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:37');
INSERT INTO "public"."access_record" VALUES (2007651950604468226, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:37');
INSERT INTO "public"."access_record" VALUES (2007651950604468227, 'localhost', 18888, NULL, NULL, 21, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:13:37');
INSERT INTO "public"."access_record" VALUES (2007651950604468228, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:13:37');
INSERT INTO "public"."access_record" VALUES (2007651950604468229, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 46, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:13:37');
INSERT INTO "public"."access_record" VALUES (2007651950608662530, 'localhost', 18888, NULL, NULL, 8, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950608662531, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950612856833, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950612856834, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950612856835, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950612856836, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950612856837, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950612856838, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950625439746, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:13:00');
INSERT INTO "public"."access_record" VALUES (2007651950625439747, 'localhost', 18888, NULL, NULL, 9, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:12:59');
INSERT INTO "public"."access_record" VALUES (2007651950625439748, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 317, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:12:59');
INSERT INTO "public"."access_record" VALUES (2007651950625439749, 'localhost', 18888, NULL, NULL, 249, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:12:59');
INSERT INTO "public"."access_record" VALUES (2007651950629634050, 'localhost', 18888, NULL, NULL, 234, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:10:00');
INSERT INTO "public"."access_record" VALUES (2007651950629634051, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:55');
INSERT INTO "public"."access_record" VALUES (2007651950629634052, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:55');
INSERT INTO "public"."access_record" VALUES (2007651950629634053, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:55');
INSERT INTO "public"."access_record" VALUES (2007651950629634054, 'localhost', 18888, NULL, NULL, 21, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:09:55');
INSERT INTO "public"."access_record" VALUES (2007651950629634055, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634056, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634057, 'localhost', 18888, NULL, NULL, 12, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634058, 'localhost', 18888, NULL, NULL, 17, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634059, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634060, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634061, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634062, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634063, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:09:54');
INSERT INTO "public"."access_record" VALUES (2007651950629634064, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:09:53');
INSERT INTO "public"."access_record" VALUES (2007651950629634065, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:09:53');
INSERT INTO "public"."access_record" VALUES (2007651950638022658, 'localhost', 18888, NULL, NULL, 9, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:08:44');
INSERT INTO "public"."access_record" VALUES (2007651950638022659, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:08:44');
INSERT INTO "public"."access_record" VALUES (2007651950638022660, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:08:44');
INSERT INTO "public"."access_record" VALUES (2007651950638022661, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:08:44');
INSERT INTO "public"."access_record" VALUES (2007651950638022662, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:08:43');
INSERT INTO "public"."access_record" VALUES (2007651950638022663, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:08:43');
INSERT INTO "public"."access_record" VALUES (2007651950642216961, 'localhost', 18888, NULL, NULL, 17, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:08:43');
INSERT INTO "public"."access_record" VALUES (2007651950642216962, 'localhost', 18888, NULL, NULL, 9, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:08:43');
INSERT INTO "public"."access_record" VALUES (2007651950642216963, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:08:43');
INSERT INTO "public"."access_record" VALUES (2007651950642216964, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:08:43');
INSERT INTO "public"."access_record" VALUES (2007651950642216965, 'localhost', 18888, NULL, NULL, 11, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:08:43');
INSERT INTO "public"."access_record" VALUES (2007651950642216966, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 37, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:08:43');
INSERT INTO "public"."access_record" VALUES (2007651950642216967, 'localhost', 18888, NULL, NULL, 8, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:07:48');
INSERT INTO "public"."access_record" VALUES (2007651950642216968, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:07:48');
INSERT INTO "public"."access_record" VALUES (2007651950642216969, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:07:48');
INSERT INTO "public"."access_record" VALUES (2007651950642216970, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:07:48');
INSERT INTO "public"."access_record" VALUES (2007651950646411265, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:07:48');
INSERT INTO "public"."access_record" VALUES (2007651950646411266, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:07:48');
INSERT INTO "public"."access_record" VALUES (2007651950646411267, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:07:47');
INSERT INTO "public"."access_record" VALUES (2007651950646411268, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:07:47');
INSERT INTO "public"."access_record" VALUES (2007651950646411269, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:07:47');
INSERT INTO "public"."access_record" VALUES (2007651950650605569, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:07:47');
INSERT INTO "public"."access_record" VALUES (2007651950650605570, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:07:47');
INSERT INTO "public"."access_record" VALUES (2007651950650605571, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 30, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:07:47');
INSERT INTO "public"."access_record" VALUES (2007651950658994178, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 41, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:02:44');
INSERT INTO "public"."access_record" VALUES (2007651950658994179, 'localhost', 18888, NULL, NULL, 19, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:02:43');
INSERT INTO "public"."access_record" VALUES (2007651950658994180, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:38');
INSERT INTO "public"."access_record" VALUES (2007651950658994181, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:38');
INSERT INTO "public"."access_record" VALUES (2007651950658994182, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:37');
INSERT INTO "public"."access_record" VALUES (2007651950658994183, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994184, 'localhost', 18888, NULL, NULL, 17, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994185, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994186, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994187, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994188, 'localhost', 18888, NULL, NULL, 8, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994189, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994190, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994191, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950658994192, 'localhost', 18888, NULL, NULL, 25, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950667382785, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 30, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950667382786, 'localhost', 18888, NULL, NULL, 14, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:02:35');
INSERT INTO "public"."access_record" VALUES (2007651950667382787, 'localhost', 18888, NULL, NULL, 32, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:02:34');
INSERT INTO "public"."access_record" VALUES (2007651950667382788, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:34');
INSERT INTO "public"."access_record" VALUES (2007651950667382789, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:34');
INSERT INTO "public"."access_record" VALUES (2007651950667382790, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:02:34');
INSERT INTO "public"."access_record" VALUES (2007651950679965697, 'localhost', 18888, NULL, NULL, 16, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:02:34');
INSERT INTO "public"."access_record" VALUES (2007651950679965698, 'localhost', 18888, NULL, NULL, 143, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:02:34');
INSERT INTO "public"."access_record" VALUES (2007651950679965699, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 52, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:02:34');
INSERT INTO "public"."access_record" VALUES (2007651950679965700, 'localhost', 18888, NULL, NULL, 21, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:02:33');
INSERT INTO "public"."access_record" VALUES (2007651950679965701, 'localhost', 18888, NULL, NULL, 55945, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:02:14');
INSERT INTO "public"."access_record" VALUES (2007651950684160001, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:11');
INSERT INTO "public"."access_record" VALUES (2007651950684160002, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:11');
INSERT INTO "public"."access_record" VALUES (2007651950684160003, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:11');
INSERT INTO "public"."access_record" VALUES (2007651950684160004, 'localhost', 18888, NULL, NULL, 23, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:01:11');
INSERT INTO "public"."access_record" VALUES (2007651950684160005, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950684160006, 'localhost', 18888, NULL, NULL, 41, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950684160007, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950684160008, 'localhost', 18888, NULL, NULL, 34, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950684160009, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950684160010, 'localhost', 18888, NULL, NULL, 23, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950688354305, 'localhost', 18888, NULL, NULL, 18, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950688354306, 'localhost', 18888, NULL, NULL, 18, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950688354307, 'localhost', 18888, NULL, NULL, 17, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950688354308, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 373, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007651950688354309, 'localhost', 18888, NULL, NULL, 342, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:01:10');
INSERT INTO "public"."access_record" VALUES (2007655725335461889, 'localhost', 18888, NULL, NULL, 136, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:28:52');
INSERT INTO "public"."access_record" VALUES (2007655725339656193, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:47');
INSERT INTO "public"."access_record" VALUES (2007655725339656194, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:47');
INSERT INTO "public"."access_record" VALUES (2007655725339656195, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:46');
INSERT INTO "public"."access_record" VALUES (2007655725339656196, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656197, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656198, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656199, 'localhost', 18888, NULL, NULL, 6, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656200, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656201, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656202, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656203, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656204, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725339656205, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:28:42');
INSERT INTO "public"."access_record" VALUES (2007655725343850497, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 24, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:28:41');
INSERT INTO "public"."access_record" VALUES (2007655725343850498, 'localhost', 18888, NULL, NULL, 8, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:28:41');
INSERT INTO "public"."access_record" VALUES (2007655725343850499, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:28:39');
INSERT INTO "public"."access_record" VALUES (2007655725343850500, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:39');
INSERT INTO "public"."access_record" VALUES (2007655725343850501, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:39');
INSERT INTO "public"."access_record" VALUES (2007655725343850502, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:39');
INSERT INTO "public"."access_record" VALUES (2007655725343850503, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:39');
INSERT INTO "public"."access_record" VALUES (2007655725343850504, 'localhost', 18888, NULL, NULL, 8, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:28:39');
INSERT INTO "public"."access_record" VALUES (2007655725343850505, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:28:38');
INSERT INTO "public"."access_record" VALUES (2007655725343850506, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:38');
INSERT INTO "public"."access_record" VALUES (2007655725343850507, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:28:38');
INSERT INTO "public"."access_record" VALUES (2007655725343850508, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:28:38');
INSERT INTO "public"."access_record" VALUES (2007655725352239105, 'localhost', 18888, NULL, NULL, 10, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:28:38');
INSERT INTO "public"."access_record" VALUES (2007655725352239106, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 25, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:28:38');
INSERT INTO "public"."access_record" VALUES (2007655725352239107, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:27:41');
INSERT INTO "public"."access_record" VALUES (2007655725352239108, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725352239109, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725352239110, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725352239111, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725352239112, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725352239113, 'localhost', 18888, NULL, NULL, 12, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725356433410, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725356433411, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725356433412, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:40');
INSERT INTO "public"."access_record" VALUES (2007655725356433413, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:27:39');
INSERT INTO "public"."access_record" VALUES (2007655725356433414, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 41, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:27:39');
INSERT INTO "public"."access_record" VALUES (2007655725356433415, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725356433416, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627713, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627714, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627715, 'localhost', 18888, NULL, NULL, 8, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627716, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627717, 'localhost', 18888, NULL, NULL, 8, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627718, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627719, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627720, 'localhost', 18888, NULL, NULL, 94, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:27:08');
INSERT INTO "public"."access_record" VALUES (2007655725360627721, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 122, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:27:07');
INSERT INTO "public"."access_record" VALUES (2007655725364822017, 'localhost', 18888, NULL, NULL, 52, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:27:07');
INSERT INTO "public"."access_record" VALUES (2007655725364822018, 'localhost', 18888, NULL, NULL, 212, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:20:31');
INSERT INTO "public"."access_record" VALUES (2007655725364822019, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:26');
INSERT INTO "public"."access_record" VALUES (2007655725364822020, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:26');
INSERT INTO "public"."access_record" VALUES (2007655725364822021, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:26');
INSERT INTO "public"."access_record" VALUES (2007655725364822022, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016322, 'localhost', 18888, NULL, NULL, 8, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016323, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016324, 'localhost', 18888, NULL, NULL, 21, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016325, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016326, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016327, 'localhost', 18888, NULL, NULL, 9, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016328, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016329, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016330, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:20:24');
INSERT INTO "public"."access_record" VALUES (2007655725369016331, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 27, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:20:23');
INSERT INTO "public"."access_record" VALUES (2007655725369016332, 'localhost', 18888, NULL, NULL, 12, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:20:23');
INSERT INTO "public"."access_record" VALUES (2007655725373210625, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:19:31');
INSERT INTO "public"."access_record" VALUES (2007655725373210626, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:19:31');
INSERT INTO "public"."access_record" VALUES (2007655725373210627, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:19:31');
INSERT INTO "public"."access_record" VALUES (2007655725373210628, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:19:31');
INSERT INTO "public"."access_record" VALUES (2007655725373210629, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:19:31');
INSERT INTO "public"."access_record" VALUES (2007655725373210630, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:19:31');
INSERT INTO "public"."access_record" VALUES (2007655725373210631, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:19:31');
INSERT INTO "public"."access_record" VALUES (2007655725373210632, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:19:30');
INSERT INTO "public"."access_record" VALUES (2007655725373210633, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:19:30');
INSERT INTO "public"."access_record" VALUES (2007655725373210634, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:19:30');
INSERT INTO "public"."access_record" VALUES (2007655725373210635, 'localhost', 18888, NULL, NULL, 10, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:19:30');
INSERT INTO "public"."access_record" VALUES (2007655725373210636, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 42, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:19:30');
INSERT INTO "public"."access_record" VALUES (2007655725373210637, 'localhost', 18888, NULL, NULL, 8, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:18:39');
INSERT INTO "public"."access_record" VALUES (2007655725373210638, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725373210639, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725373210640, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725373210641, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725373210642, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725373210643, 'localhost', 18888, NULL, NULL, 18, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725373210644, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725373210645, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725381599233, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725381599234, 'localhost', 18888, NULL, NULL, 22, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725381599235, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 53, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:18:38');
INSERT INTO "public"."access_record" VALUES (2007655725381599236, 'localhost', 18888, NULL, NULL, 11, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:17:22');
INSERT INTO "public"."access_record" VALUES (2007655725381599237, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:17:22');
INSERT INTO "public"."access_record" VALUES (2007655725381599238, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:17:21');
INSERT INTO "public"."access_record" VALUES (2007655725381599239, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:17:21');
INSERT INTO "public"."access_record" VALUES (2007655725381599240, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:17:21');
INSERT INTO "public"."access_record" VALUES (2007655725381599241, 'localhost', 18888, NULL, NULL, 13, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:17:21');
INSERT INTO "public"."access_record" VALUES (2007655725381599242, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:17:21');
INSERT INTO "public"."access_record" VALUES (2007655725381599243, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:17:21');
INSERT INTO "public"."access_record" VALUES (2007655725381599244, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:17:21');
INSERT INTO "public"."access_record" VALUES (2007655725381599245, 'localhost', 18888, NULL, NULL, 17, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:17:21');
INSERT INTO "public"."access_record" VALUES (2007655725381599246, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 32, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:17:20');
INSERT INTO "public"."access_record" VALUES (2007655725381599247, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:17:20');
INSERT INTO "public"."access_record" VALUES (2007659500162924546, 'localhost', 18888, NULL, NULL, 201, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:38:16');
INSERT INTO "public"."access_record" VALUES (2007659500162924547, 'localhost', 18888, NULL, NULL, 86, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:33:09');
INSERT INTO "public"."access_record" VALUES (2007659500162924548, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:05');
INSERT INTO "public"."access_record" VALUES (2007659500162924549, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:05');
INSERT INTO "public"."access_record" VALUES (2007659500162924550, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:04');
INSERT INTO "public"."access_record" VALUES (2007659500162924551, 'localhost', 18888, NULL, NULL, 11, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500162924552, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227713, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227714, 'localhost', 18888, NULL, NULL, 8, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227715, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227716, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227717, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227718, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227719, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227720, 'localhost', 18888, NULL, NULL, 7, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227721, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 32, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007659500234227722, 'localhost', 18888, NULL, NULL, 15, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:33:00');
INSERT INTO "public"."access_record" VALUES (2007663275208491009, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:59:22');
INSERT INTO "public"."access_record" VALUES (2007663275212685314, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:59:22');
INSERT INTO "public"."access_record" VALUES (2007663275212685315, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:59:22');
INSERT INTO "public"."access_record" VALUES (2007663275212685316, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:59:22');
INSERT INTO "public"."access_record" VALUES (2007663275212685317, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:59:22');
INSERT INTO "public"."access_record" VALUES (2007663275212685318, 'localhost', 18888, NULL, NULL, 22, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:59:21');
INSERT INTO "public"."access_record" VALUES (2007663275221073922, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:59:21');
INSERT INTO "public"."access_record" VALUES (2007663275221073923, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:59:21');
INSERT INTO "public"."access_record" VALUES (2007663275221073924, 'localhost', 18888, NULL, NULL, 18, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:59:21');
INSERT INTO "public"."access_record" VALUES (2007663275221073925, 'localhost', 18888, NULL, NULL, 18, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:59:21');
INSERT INTO "public"."access_record" VALUES (2007663275221073926, 'localhost', 18888, NULL, NULL, 10, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:59:21');
INSERT INTO "public"."access_record" VALUES (2007663275221073927, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 34, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:59:21');
INSERT INTO "public"."access_record" VALUES (2007663275225268225, 'localhost', 18888, NULL, NULL, 106, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:53:18');
INSERT INTO "public"."access_record" VALUES (2007663275225268226, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:14');
INSERT INTO "public"."access_record" VALUES (2007663275225268227, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:14');
INSERT INTO "public"."access_record" VALUES (2007663275225268228, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:14');
INSERT INTO "public"."access_record" VALUES (2007663275229462529, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462530, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462531, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462532, 'localhost', 18888, NULL, NULL, 10, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462533, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462534, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462535, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462536, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462537, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:53:13');
INSERT INTO "public"."access_record" VALUES (2007663275229462538, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:53:12');
INSERT INTO "public"."access_record" VALUES (2007663275229462539, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 22, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:53:12');
INSERT INTO "public"."access_record" VALUES (2007663275229462540, 'localhost', 18888, NULL, NULL, 9, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:53:12');
INSERT INTO "public"."access_record" VALUES (2007663275229462541, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:53:00');
INSERT INTO "public"."access_record" VALUES (2007663275229462542, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275229462543, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275229462544, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275229462545, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275229462546, 'localhost', 18888, NULL, NULL, 10, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275229462547, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275229462548, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275237851138, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275237851139, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275237851140, 'localhost', 18888, NULL, NULL, 7, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275237851141, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 22, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:52:59');
INSERT INTO "public"."access_record" VALUES (2007663275237851142, 'localhost', 18888, NULL, NULL, 314, '/step/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 11:51:30');
INSERT INTO "public"."access_record" VALUES (2007663275237851143, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:20');
INSERT INTO "public"."access_record" VALUES (2007663275237851144, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:20');
INSERT INTO "public"."access_record" VALUES (2007663275237851145, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:20');
INSERT INTO "public"."access_record" VALUES (2007663275237851146, 'localhost', 18888, NULL, NULL, 2, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:51:16');
INSERT INTO "public"."access_record" VALUES (2007663275237851147, 'localhost', 18888, NULL, NULL, 7, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:51:16');
INSERT INTO "public"."access_record" VALUES (2007663275237851148, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:16');
INSERT INTO "public"."access_record" VALUES (2007663275237851149, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:16');
INSERT INTO "public"."access_record" VALUES (2007663275237851150, 'localhost', 18888, NULL, NULL, 17, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:51:16');
INSERT INTO "public"."access_record" VALUES (2007663275237851151, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:16');
INSERT INTO "public"."access_record" VALUES (2007663275237851152, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:16');
INSERT INTO "public"."access_record" VALUES (2007663275237851153, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:16');
INSERT INTO "public"."access_record" VALUES (2007663275237851154, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:51:15');
INSERT INTO "public"."access_record" VALUES (2007663275237851155, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:51:15');
INSERT INTO "public"."access_record" VALUES (2007663275237851156, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 20, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:51:15');
INSERT INTO "public"."access_record" VALUES (2007663275237851157, 'localhost', 18888, NULL, NULL, 9, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:51:15');
INSERT INTO "public"."access_record" VALUES (2007663275237851158, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:49:09');
INSERT INTO "public"."access_record" VALUES (2007663275237851159, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:49:09');
INSERT INTO "public"."access_record" VALUES (2007663275237851160, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:49:09');
INSERT INTO "public"."access_record" VALUES (2007663275237851161, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239746, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239747, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239748, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239749, 'localhost', 18888, NULL, NULL, 8, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239750, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239751, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239752, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239753, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 32, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:49:08');
INSERT INTO "public"."access_record" VALUES (2007663275246239754, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:48:46');
INSERT INTO "public"."access_record" VALUES (2007663275246239755, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:46');
INSERT INTO "public"."access_record" VALUES (2007663275250434050, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:46');
INSERT INTO "public"."access_record" VALUES (2007663275250434051, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434052, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434053, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434054, 'localhost', 18888, NULL, NULL, 6, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434055, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434056, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434057, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434058, 'localhost', 18888, NULL, NULL, 11, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434059, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 43, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:48:45');
INSERT INTO "public"."access_record" VALUES (2007663275250434060, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275250434061, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275250434062, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275250434063, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275250434064, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275250434065, 'localhost', 18888, NULL, NULL, 10, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275250434066, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275250434067, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275258822657, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275258822658, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:48:36');
INSERT INTO "public"."access_record" VALUES (2007663275258822659, 'localhost', 18888, NULL, NULL, 14, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:48:35');
INSERT INTO "public"."access_record" VALUES (2007663275258822660, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:48:35');
INSERT INTO "public"."access_record" VALUES (2007663275258822661, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:48:33');
INSERT INTO "public"."access_record" VALUES (2007663275258822662, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:33');
INSERT INTO "public"."access_record" VALUES (2007663275258822663, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:33');
INSERT INTO "public"."access_record" VALUES (2007663275258822664, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:33');
INSERT INTO "public"."access_record" VALUES (2007663275258822665, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:48:33');
INSERT INTO "public"."access_record" VALUES (2007663275258822666, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:33');
INSERT INTO "public"."access_record" VALUES (2007663275258822667, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:48:32');
INSERT INTO "public"."access_record" VALUES (2007663275258822668, 'localhost', 18888, NULL, NULL, 7, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:48:32');
INSERT INTO "public"."access_record" VALUES (2007663275258822669, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:32');
INSERT INTO "public"."access_record" VALUES (2007663275263016962, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:32');
INSERT INTO "public"."access_record" VALUES (2007663275263016963, 'localhost', 18888, NULL, NULL, 8, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:48:32');
INSERT INTO "public"."access_record" VALUES (2007663275263016964, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 50, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:48:32');
INSERT INTO "public"."access_record" VALUES (2007663275263016965, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:31');
INSERT INTO "public"."access_record" VALUES (2007663275263016966, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:31');
INSERT INTO "public"."access_record" VALUES (2007663275263016967, 'localhost', 18888, NULL, NULL, 2, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:48:31');
INSERT INTO "public"."access_record" VALUES (2007663275263016968, 'localhost', 18888, NULL, NULL, 17, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016969, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016970, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016971, 'localhost', 18888, NULL, NULL, 17, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016972, 'localhost', 18888, NULL, NULL, 9, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016973, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016974, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016975, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016976, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 26, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:48:30');
INSERT INTO "public"."access_record" VALUES (2007663275263016977, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:48:27');
INSERT INTO "public"."access_record" VALUES (2007663275263016978, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:27');
INSERT INTO "public"."access_record" VALUES (2007663275267211266, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:27');
INSERT INTO "public"."access_record" VALUES (2007663275267211267, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:27');
INSERT INTO "public"."access_record" VALUES (2007663275267211268, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:27');
INSERT INTO "public"."access_record" VALUES (2007663275267211269, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:48:26');
INSERT INTO "public"."access_record" VALUES (2007663275267211270, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:48:26');
INSERT INTO "public"."access_record" VALUES (2007663275267211271, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:26');
INSERT INTO "public"."access_record" VALUES (2007663275267211272, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:26');
INSERT INTO "public"."access_record" VALUES (2007663275267211273, 'localhost', 18888, NULL, NULL, 9, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:48:26');
INSERT INTO "public"."access_record" VALUES (2007663275267211274, 'localhost', 18888, NULL, NULL, 12, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:48:26');
INSERT INTO "public"."access_record" VALUES (2007663275267211275, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 32, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:48:26');
INSERT INTO "public"."access_record" VALUES (2007663275267211276, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:48:25');
INSERT INTO "public"."access_record" VALUES (2007663275267211277, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:25');
INSERT INTO "public"."access_record" VALUES (2007663275267211278, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275267211279, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275267211280, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275267211281, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275267211282, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275267211283, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275271405570, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275271405571, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275271405572, 'localhost', 18888, NULL, NULL, 9, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275271405573, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:48:24');
INSERT INTO "public"."access_record" VALUES (2007663275271405574, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 11:48:20');
INSERT INTO "public"."access_record" VALUES (2007663275271405575, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275271405576, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599874, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599875, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599876, 'localhost', 18888, NULL, NULL, 15, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599877, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599878, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599879, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599880, 'localhost', 18888, NULL, NULL, 23, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599881, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 55, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007663275275599882, 'localhost', 18888, NULL, NULL, 11, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 11:48:19');
INSERT INTO "public"."access_record" VALUES (2007667049926901762, 'localhost', 18888, NULL, NULL, 37425, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 12:04:11');
INSERT INTO "public"."access_record" VALUES (2007667049939484673, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 37, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 12:03:16');
INSERT INTO "public"."access_record" VALUES (2007667049939484674, 'localhost', 18888, NULL, NULL, 115, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 12:03:15');
INSERT INTO "public"."access_record" VALUES (2007667049943678978, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 12:03:04');
INSERT INTO "public"."access_record" VALUES (2007667049943678979, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 12:03:04');
INSERT INTO "public"."access_record" VALUES (2007667049943678980, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 12:03:04');
INSERT INTO "public"."access_record" VALUES (2007667049943678981, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 12:02:13');
INSERT INTO "public"."access_record" VALUES (2007667049943678982, 'localhost', 18888, NULL, NULL, 8, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 12:02:13');
INSERT INTO "public"."access_record" VALUES (2007667049943678983, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 12:02:13');
INSERT INTO "public"."access_record" VALUES (2007667049943678984, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 12:02:12');
INSERT INTO "public"."access_record" VALUES (2007667049943678985, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 12:02:12');
INSERT INTO "public"."access_record" VALUES (2007667049943678986, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 12:02:12');
INSERT INTO "public"."access_record" VALUES (2007667049943678987, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 12:02:12');
INSERT INTO "public"."access_record" VALUES (2007667049943678988, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 12:02:12');
INSERT INTO "public"."access_record" VALUES (2007667049943678989, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 12:02:12');
INSERT INTO "public"."access_record" VALUES (2007667049943678990, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 12:02:12');
INSERT INTO "public"."access_record" VALUES (2007667049952067586, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 12:02:12');
INSERT INTO "public"."access_record" VALUES (2007667049952067587, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 19, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 12:02:11');
INSERT INTO "public"."access_record" VALUES (2007667049952067588, 'localhost', 18888, NULL, NULL, 99, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 12:01:36');
INSERT INTO "public"."access_record" VALUES (2007667049952067589, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:32');
INSERT INTO "public"."access_record" VALUES (2007667049952067590, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:31');
INSERT INTO "public"."access_record" VALUES (2007667049960456194, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:31');
INSERT INTO "public"."access_record" VALUES (2007667049960456195, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:30');
INSERT INTO "public"."access_record" VALUES (2007667049960456196, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:30');
INSERT INTO "public"."access_record" VALUES (2007667049964650497, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 12:01:30');
INSERT INTO "public"."access_record" VALUES (2007667049964650498, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049964650499, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049964650500, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049964650501, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049964650502, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049964650503, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049964650504, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049964650505, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 16, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049973039106, 'localhost', 18888, NULL, NULL, 7, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 12:01:29');
INSERT INTO "public"."access_record" VALUES (2007667049973039107, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 12:01:24');
INSERT INTO "public"."access_record" VALUES (2007667049977233409, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:24');
INSERT INTO "public"."access_record" VALUES (2007667049977233410, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:24');
INSERT INTO "public"."access_record" VALUES (2007667049977233411, 'localhost', 18888, NULL, NULL, 6, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 12:01:23');
INSERT INTO "public"."access_record" VALUES (2007667049977233412, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:23');
INSERT INTO "public"."access_record" VALUES (2007667049981427713, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:23');
INSERT INTO "public"."access_record" VALUES (2007667049981427714, 'localhost', 18888, NULL, NULL, 8, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 12:01:23');
INSERT INTO "public"."access_record" VALUES (2007667049981427715, 'localhost', 18888, NULL, NULL, 7, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 12:01:23');
INSERT INTO "public"."access_record" VALUES (2007667049981427716, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:23');
INSERT INTO "public"."access_record" VALUES (2007667049981427717, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 12:01:23');
INSERT INTO "public"."access_record" VALUES (2007667049981427718, 'localhost', 18888, NULL, NULL, 8, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 12:01:23');
INSERT INTO "public"."access_record" VALUES (2007667049989816321, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 19, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 12:01:22');
INSERT INTO "public"."access_record" VALUES (2007667049989816322, 'localhost', 18888, NULL, NULL, 275, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-04 12:00:53');
INSERT INTO "public"."access_record" VALUES (2007667049989816323, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:48');
INSERT INTO "public"."access_record" VALUES (2007667049989816324, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:48');
INSERT INTO "public"."access_record" VALUES (2007667049989816325, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:48');
INSERT INTO "public"."access_record" VALUES (2007667049989816326, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:44');
INSERT INTO "public"."access_record" VALUES (2007667049989816327, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:44');
INSERT INTO "public"."access_record" VALUES (2007667049989816328, 'localhost', 18888, NULL, NULL, 8, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-04 12:00:44');
INSERT INTO "public"."access_record" VALUES (2007667049989816329, 'localhost', 18888, NULL, NULL, 16, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2007667049989816330, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2007667049989816331, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2007667049989816332, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2007667049994010626, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2007667049994010627, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2007667049994010628, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2007667049994010629, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2007667049994010630, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2026-01-04 12:00:43');
INSERT INTO "public"."access_record" VALUES (2008712690102865922, 'localhost', 18888, NULL, NULL, 22, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690119643138, 'localhost', 18888, NULL, NULL, 39, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690119643139, 'localhost', 18888, NULL, NULL, 29, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690128031746, 'localhost', 18888, NULL, NULL, 37, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690128031747, 'localhost', 18888, NULL, NULL, 32, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690128031748, 'localhost', 18888, NULL, NULL, 32, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690128031749, 'localhost', 18888, NULL, NULL, 27, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690128031750, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690128031751, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 107, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690136420354, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690136420355, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690140614657, 'localhost', 18888, NULL, NULL, 45, '/step/type/list', '未知内网IP', '内网IP', '2026-01-07 09:21:44');
INSERT INTO "public"."access_record" VALUES (2008712690140614658, 'localhost', 18888, NULL, NULL, 687, '/step/login', '未知内网IP', '内网IP', '2026-01-07 09:21:39');
INSERT INTO "public"."access_record" VALUES (2013797444938571777, 'localhost', 18888, NULL, NULL, 19, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444959543297, 'localhost', 18888, NULL, NULL, 29, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444963737601, 'localhost', 18888, NULL, NULL, 35, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444967931905, 'localhost', 18888, NULL, NULL, 35, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444972126210, 'localhost', 18888, NULL, NULL, 32, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444972126211, 'localhost', 18888, NULL, NULL, 32, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444972126212, 'localhost', 18888, NULL, NULL, 26, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444984709122, 'localhost', 18888, NULL, NULL, 30, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444984709123, 'localhost', 18888, NULL, NULL, 19, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444988903426, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 178, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444988903427, 'localhost', 18888, NULL, NULL, 27, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797444997292033, 'localhost', 18888, NULL, NULL, 91, '/step/type/list', '未知内网IP', '内网IP', '2026-01-21 10:12:34');
INSERT INTO "public"."access_record" VALUES (2013797445001486337, 'localhost', 18888, NULL, NULL, 1029, '/step/login', '未知内网IP', '内网IP', '2026-01-21 10:12:01');
INSERT INTO "public"."access_record" VALUES (2013797445001486338, 'localhost', 18888, NULL, NULL, 142492, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-15 09:37:30');
INSERT INTO "public"."access_record" VALUES (2013797445001486339, 'localhost', 18888, NULL, NULL, 17, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:58');
INSERT INTO "public"."access_record" VALUES (2013797445009874946, 'localhost', 18888, NULL, NULL, 17, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:58');
INSERT INTO "public"."access_record" VALUES (2013797445009874947, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:58');
INSERT INTO "public"."access_record" VALUES (2013797445014069249, 'localhost', 18888, NULL, NULL, 19, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:50');
INSERT INTO "public"."access_record" VALUES (2013797445014069250, 'localhost', 18888, NULL, NULL, 47, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445014069251, 'localhost', 18888, NULL, NULL, 45, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445014069252, 'localhost', 18888, NULL, NULL, 45, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445014069253, 'localhost', 18888, NULL, NULL, 44, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445014069254, 'localhost', 18888, NULL, NULL, 42, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445026652162, 'localhost', 18888, NULL, NULL, 38, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445030846466, 'localhost', 18888, NULL, NULL, 30, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445035040769, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 246, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445039235074, 'localhost', 18888, NULL, NULL, 23, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445043429378, 'localhost', 18888, NULL, NULL, 49, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445043429379, 'localhost', 18888, NULL, NULL, 97, '/step/type/list', '未知内网IP', '内网IP', '2026-01-15 09:34:49');
INSERT INTO "public"."access_record" VALUES (2013797445043429380, 'localhost', 18888, NULL, NULL, 1621, '/step/login', '未知内网IP', '内网IP', '2026-01-15 09:34:46');
INSERT INTO "public"."access_record" VALUES (2013801219656982529, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 53, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 10:18:15');
INSERT INTO "public"."access_record" VALUES (2013801219661176834, 'localhost', 18888, NULL, NULL, 9244, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-21 10:18:14');
INSERT INTO "public"."access_record" VALUES (2013801219669565442, 'localhost', 18888, NULL, NULL, 25, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 10:17:58');
INSERT INTO "public"."access_record" VALUES (2013801219669565443, 'localhost', 18888, NULL, NULL, 25, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 10:17:58');
INSERT INTO "public"."access_record" VALUES (2013801219669565444, 'localhost', 18888, NULL, NULL, 25, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 10:17:58');
INSERT INTO "public"."access_record" VALUES (2013808769488109570, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 58, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 10:59:59');
INSERT INTO "public"."access_record" VALUES (2013808769488109571, 'localhost', 18888, NULL, NULL, 125, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-21 10:59:59');
INSERT INTO "public"."access_record" VALUES (2013808769488109572, 'localhost', 18888, NULL, NULL, 45, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 10:57:53');
INSERT INTO "public"."access_record" VALUES (2013808769488109573, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 27, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 10:55:56');
INSERT INTO "public"."access_record" VALUES (2013808769488109574, 'localhost', 18888, NULL, NULL, 5892, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-21 10:55:56');
INSERT INTO "public"."access_record" VALUES (2013808769488109575, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 10:55:45');
INSERT INTO "public"."access_record" VALUES (2013808769488109576, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 46, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 10:55:34');
INSERT INTO "public"."access_record" VALUES (2013808769488109577, 'localhost', 18888, NULL, NULL, 14879, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-21 10:55:33');
INSERT INTO "public"."access_record" VALUES (2013808769488109578, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 10:55:12');
INSERT INTO "public"."access_record" VALUES (2013808769542635521, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 132, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 10:54:33');
INSERT INTO "public"."access_record" VALUES (2013808769542635522, 'localhost', 18888, NULL, NULL, 629, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-21 10:54:33');
INSERT INTO "public"."access_record" VALUES (2013808769542635523, 'localhost', 18888, NULL, NULL, 336, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 10:54:21');
INSERT INTO "public"."access_record" VALUES (2013812544156188673, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 41, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 11:02:22');
INSERT INTO "public"."access_record" VALUES (2013812544156188674, 'localhost', 18888, NULL, NULL, 9856, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-21 11:02:22');
INSERT INTO "public"."access_record" VALUES (2013812544181354498, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:01');
INSERT INTO "public"."access_record" VALUES (2013812544181354499, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:01');
INSERT INTO "public"."access_record" VALUES (2013812544181354500, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:01');
INSERT INTO "public"."access_record" VALUES (2013812544181354501, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:00');
INSERT INTO "public"."access_record" VALUES (2013812544185548802, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:00');
INSERT INTO "public"."access_record" VALUES (2013812544185548803, 'localhost', 18888, NULL, NULL, 36, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544185548804, 'localhost', 18888, NULL, NULL, 23, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544185548805, 'localhost', 18888, NULL, NULL, 28, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544185548806, 'localhost', 18888, NULL, NULL, 26, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544189743106, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544198131714, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544198131715, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544202326018, 'localhost', 18888, NULL, NULL, 11, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544202326019, 'localhost', 18888, NULL, NULL, 14, '/step/type/list', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544202326020, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 71, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2013812544202326021, 'localhost', 18888, NULL, NULL, 20, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:33');
INSERT INTO "public"."access_record" VALUES (2013812544206520322, 'localhost', 18888, NULL, NULL, 23, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:33');
INSERT INTO "public"."access_record" VALUES (2013812544206520323, 'localhost', 18888, NULL, NULL, 17, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:33');
INSERT INTO "public"."access_record" VALUES (2013812544210714626, 'localhost', 18888, NULL, NULL, 38, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2013812544210714627, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2013812544210714628, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2013812544210714629, 'localhost', 18888, NULL, NULL, 29, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2013812544210714630, 'localhost', 18888, NULL, NULL, 22, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2013812544210714631, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2013812544210714632, 'localhost', 18888, NULL, NULL, 36, '/step/type/list', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2013812544210714633, 'localhost', 18888, NULL, NULL, 36, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2013812544219103233, 'localhost', 18888, NULL, NULL, 34, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2013812544219103234, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2013812544227491842, 'localhost', 18888, NULL, NULL, 13, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2013812544227491843, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 62, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2013812544227491844, 'localhost', 18888, NULL, NULL, 37, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:26');
INSERT INTO "public"."access_record" VALUES (2015986872213725186, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:01');
INSERT INTO "public"."access_record" VALUES (2015986872356331521, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:01');
INSERT INTO "public"."access_record" VALUES (2015986872427634689, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:01');
INSERT INTO "public"."access_record" VALUES (2015986872436023297, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:00');
INSERT INTO "public"."access_record" VALUES (2015986872436023298, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 11:02:00');
INSERT INTO "public"."access_record" VALUES (2015986872436023299, 'localhost', 18888, NULL, NULL, 36, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872436023300, 'localhost', 18888, NULL, NULL, 23, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872436023301, 'localhost', 18888, NULL, NULL, 28, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872436023302, 'localhost', 18888, NULL, NULL, 26, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872436023303, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872436023304, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872503132161, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872503132162, 'localhost', 18888, NULL, NULL, 11, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872503132163, 'localhost', 18888, NULL, NULL, 14, '/step/type/list', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872503132164, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 71, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 11:01:59');
INSERT INTO "public"."access_record" VALUES (2015986872503132165, 'localhost', 18888, NULL, NULL, 20, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:33');
INSERT INTO "public"."access_record" VALUES (2015986872503132166, 'localhost', 18888, NULL, NULL, 23, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:33');
INSERT INTO "public"."access_record" VALUES (2015986872503132167, 'localhost', 18888, NULL, NULL, 17, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:33');
INSERT INTO "public"."access_record" VALUES (2015986872503132168, 'localhost', 18888, NULL, NULL, 38, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2015986872503132169, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2015986872503132170, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2015986872503132171, 'localhost', 18888, NULL, NULL, 29, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2015986872503132172, 'localhost', 18888, NULL, NULL, 22, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-21 11:01:32');
INSERT INTO "public"."access_record" VALUES (2015986872503132173, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2015986872503132174, 'localhost', 18888, NULL, NULL, 36, '/step/type/list', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2015986872570241025, 'localhost', 18888, NULL, NULL, 36, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2015986872570241026, 'localhost', 18888, NULL, NULL, 34, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2015986872570241027, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2015986872570241028, 'localhost', 18888, NULL, NULL, 13, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2015986872570241029, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 62, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-21 11:01:31');
INSERT INTO "public"."access_record" VALUES (2015986872570241030, 'localhost', 18888, NULL, NULL, 37, '/step/Zaohu/2025/12/29/68b3637030314cb4b8a768c7b6f9392e_1766994579798.jpg', '未知内网IP', '内网IP', '2026-01-21 11:01:26');
INSERT INTO "public"."access_record" VALUES (2015994421327601665, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:44');
INSERT INTO "public"."access_record" VALUES (2015994421348573186, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:44');
INSERT INTO "public"."access_record" VALUES (2015994421352767489, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:44');
INSERT INTO "public"."access_record" VALUES (2015994421356961793, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:42');
INSERT INTO "public"."access_record" VALUES (2015994421361156097, 'localhost', 18888, NULL, NULL, 41, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:42');
INSERT INTO "public"."access_record" VALUES (2015994421361156098, 'localhost', 18888, NULL, NULL, 40, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:42');
INSERT INTO "public"."access_record" VALUES (2015994421361156099, 'localhost', 18888, NULL, NULL, 39, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:42');
INSERT INTO "public"."access_record" VALUES (2015994421369544705, 'localhost', 18888, NULL, NULL, 39, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:42');
INSERT INTO "public"."access_record" VALUES (2015994421369544706, 'localhost', 18888, NULL, NULL, 39, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:40:42');
INSERT INTO "public"."access_record" VALUES (2015994421369544707, 'localhost', 18888, NULL, NULL, 29, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:40:42');
INSERT INTO "public"."access_record" VALUES (2015994421369544708, 'localhost', 18888, NULL, NULL, 25, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:40:42');
INSERT INTO "public"."access_record" VALUES (2015994421369544709, 'localhost', 18888, NULL, NULL, 25, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:40:41');
INSERT INTO "public"."access_record" VALUES (2015994421373739010, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 180, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:40:41');
INSERT INTO "public"."access_record" VALUES (2015994421373739011, 'localhost', 18888, NULL, NULL, 35, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:40:41');
INSERT INTO "public"."access_record" VALUES (2015994421377933313, 'localhost', 18888, NULL, NULL, 74, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:40:41');
INSERT INTO "public"."access_record" VALUES (2015994421386321921, 'localhost', 18888, NULL, NULL, 790, '/step/login', '未知内网IP', '内网IP', '2026-01-27 11:40:38');
INSERT INTO "public"."access_record" VALUES (2015998196016652289, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:53:43');
INSERT INTO "public"."access_record" VALUES (2015998196016652290, 'localhost', 18888, NULL, NULL, 10, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:53:43');
INSERT INTO "public"."access_record" VALUES (2015998196016652291, 'localhost', 18888, NULL, NULL, 12, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:53:43');
INSERT INTO "public"."access_record" VALUES (2015998196025040898, 'localhost', 18888, NULL, NULL, 10, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:53:43');
INSERT INTO "public"."access_record" VALUES (2015998196025040899, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', '未知内网IP', '内网IP', '2026-01-27 11:53:41');
INSERT INTO "public"."access_record" VALUES (2015998196025040900, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/04/30/c15e720386554f31ac2b75eaf845c222_1746003013937.png', '未知内网IP', '内网IP', '2026-01-27 11:53:41');
INSERT INTO "public"."access_record" VALUES (2015998196025040901, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/04/30/e582d4ab52784ae0a059266c5d41ca00_1746003043082.png', '未知内网IP', '内网IP', '2026-01-27 11:53:41');
INSERT INTO "public"."access_record" VALUES (2015998196029235201, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/07/01/c8221be6b8c748fcbb6b7786b1809edb_1751348272951.png', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2016062369190826011, 'localhost', 18888, NULL, NULL, 9, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2015998196029235202, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/photoType/fec950d09681492c8cc0b1f8af4d5933_1750869285743.jpg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196029235203, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/07/01/8f5c2729121545feb51ab9ee12fe8a62_1751348239559.png', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196033429506, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/10/10/1ceae9597a6c4e2296641dfe2c3dc4c8_1760103390403.png', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196033429507, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/04/30/deccc84429824374b8a510bc77a765f0_1746005558866.png', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196033429508, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/07/01/b222f55bb2d8428aa0cbc248a1d9bd03_1751348256529.png', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196033429509, 'localhost', 18888, NULL, NULL, 28, '/step/msgWall/getmsg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196041818113, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/6a6b79419a7445e18c465fafa5f0af38_1750097041874.jpg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196041818114, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/eac3d77c09bc4409a204b10643bcbdc2_1749020219499.jpg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196041818115, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196041818116, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/photo/02b936ef9ad044a796c5e6c5e0960ae2_1750097059114.jpg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196041818117, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/feba685a709e44e797064a785bd69aa6_1750097074484.jpg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196046012418, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photo/a461f175749746c7b08ffa162e41929d_1750097053176.jpg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196046012419, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/photoType/c7e0bd5cc4254d58b15422ba51ad5804_1760104574938.jpg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196050206721, 'localhost', 18888, NULL, NULL, 25, '/step/Zaohu/2025/photo/76f74d634b8440a785a343c0362d57e2_1750097079448.jpg', '未知内网IP', '内网IP', '2026-01-27 11:53:40');
INSERT INTO "public"."access_record" VALUES (2015998196050206722, 'localhost', 18888, NULL, 'pageNum=1&pageSize=20&isHidden=true', 63, '/step/photoType/getPhotoTypeAndPhrase', '未知内网IP', '内网IP', '2026-01-27 11:53:39');
INSERT INTO "public"."access_record" VALUES (2015998196054401026, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 43, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:48:49');
INSERT INTO "public"."access_record" VALUES (2015998196054401027, 'localhost', 18888, NULL, NULL, 91, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 11:48:49');
INSERT INTO "public"."access_record" VALUES (2015998196054401028, 'localhost', 18888, NULL, NULL, 6, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 11:48:40');
INSERT INTO "public"."access_record" VALUES (2015998196066983937, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196066983938, 'localhost', 18888, NULL, NULL, 0, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196066983939, 'localhost', 18888, NULL, NULL, 0, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196071178241, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196071178242, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196075372546, 'localhost', 18888, NULL, NULL, 12, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196075372547, 'localhost', 18888, NULL, NULL, 15, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196075372548, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196075372549, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:48:37');
INSERT INTO "public"."access_record" VALUES (2015998196075372550, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:48:36');
INSERT INTO "public"."access_record" VALUES (2015998196079566850, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:36');
INSERT INTO "public"."access_record" VALUES (2015998196079566851, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:36');
INSERT INTO "public"."access_record" VALUES (2015998196087955457, 'localhost', 18888, NULL, NULL, 9, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:48:36');
INSERT INTO "public"."access_record" VALUES (2015998196087955458, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:48:36');
INSERT INTO "public"."access_record" VALUES (2015998196087955459, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 27, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:48:36');
INSERT INTO "public"."access_record" VALUES (2015998196087955460, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 26, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:48:14');
INSERT INTO "public"."access_record" VALUES (2015998196087955461, 'localhost', 18888, NULL, NULL, 231, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 11:48:14');
INSERT INTO "public"."access_record" VALUES (2015998196096344065, 'localhost', 18888, NULL, NULL, 7, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 11:48:12');
INSERT INTO "public"."access_record" VALUES (2015998196096344066, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 34, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:48:00');
INSERT INTO "public"."access_record" VALUES (2015998196100538370, 'localhost', 18888, NULL, NULL, 63, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 11:48:00');
INSERT INTO "public"."access_record" VALUES (2015998196100538371, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:51');
INSERT INTO "public"."access_record" VALUES (2015998196104732673, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:51');
INSERT INTO "public"."access_record" VALUES (2015998196104732674, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:51');
INSERT INTO "public"."access_record" VALUES (2015998196104732675, 'localhost', 18888, NULL, NULL, 67, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:47:44');
INSERT INTO "public"."access_record" VALUES (2015998196104732676, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:47:43');
INSERT INTO "public"."access_record" VALUES (2015998196104732677, 'localhost', 18888, NULL, NULL, 22, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196104732678, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196104732679, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196104732680, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196113121281, 'localhost', 18888, NULL, NULL, 68, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196113121282, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196113121283, 'localhost', 18888, NULL, NULL, 20, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196113121284, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196113121285, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196113121286, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 52, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:47:42');
INSERT INTO "public"."access_record" VALUES (2015998196113121287, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:38');
INSERT INTO "public"."access_record" VALUES (2015998196113121288, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 33, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:47:38');
INSERT INTO "public"."access_record" VALUES (2015998196121509889, 'localhost', 18888, NULL, NULL, 169, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 11:47:37');
INSERT INTO "public"."access_record" VALUES (2015998196121509890, 'localhost', 18888, NULL, NULL, 6, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 11:47:31');
INSERT INTO "public"."access_record" VALUES (2015998196125704193, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:30');
INSERT INTO "public"."access_record" VALUES (2015998196125704194, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:29');
INSERT INTO "public"."access_record" VALUES (2015998196125704195, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:29');
INSERT INTO "public"."access_record" VALUES (2015998196125704196, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:28');
INSERT INTO "public"."access_record" VALUES (2015998196125704197, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:28');
INSERT INTO "public"."access_record" VALUES (2015998196125704198, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:28');
INSERT INTO "public"."access_record" VALUES (2015998196125704199, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:28');
INSERT INTO "public"."access_record" VALUES (2015998196125704200, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:28');
INSERT INTO "public"."access_record" VALUES (2015998196125704201, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:47:27');
INSERT INTO "public"."access_record" VALUES (2015998196125704202, 'localhost', 18888, NULL, NULL, 10, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:47:27');
INSERT INTO "public"."access_record" VALUES (2015998196125704203, 'localhost', 18888, NULL, NULL, 7, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:47:27');
INSERT INTO "public"."access_record" VALUES (2015998196125704204, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:27');
INSERT INTO "public"."access_record" VALUES (2015998196125704205, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:47:27');
INSERT INTO "public"."access_record" VALUES (2015998196125704206, 'localhost', 18888, NULL, NULL, 15, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:47:27');
INSERT INTO "public"."access_record" VALUES (2015998196125704207, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 48, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:47:27');
INSERT INTO "public"."access_record" VALUES (2015998196142481409, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 39, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:47:23');
INSERT INTO "public"."access_record" VALUES (2015998196142481410, 'localhost', 18888, NULL, NULL, 499, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 11:47:23');
INSERT INTO "public"."access_record" VALUES (2015998196142481411, 'localhost', 18888, NULL, NULL, 7, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 11:47:21');
INSERT INTO "public"."access_record" VALUES (2015998196142481412, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:20');
INSERT INTO "public"."access_record" VALUES (2015998196146675714, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:20');
INSERT INTO "public"."access_record" VALUES (2015998196146675715, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:20');
INSERT INTO "public"."access_record" VALUES (2015998196146675716, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:16');
INSERT INTO "public"."access_record" VALUES (2015998196146675717, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:16');
INSERT INTO "public"."access_record" VALUES (2015998196146675718, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:47:16');
INSERT INTO "public"."access_record" VALUES (2015998196146675719, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:16');
INSERT INTO "public"."access_record" VALUES (2015998196155064321, 'localhost', 18888, NULL, NULL, 17, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:47:16');
INSERT INTO "public"."access_record" VALUES (2015998196155064322, 'localhost', 18888, NULL, NULL, 10, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:47:16');
INSERT INTO "public"."access_record" VALUES (2015998196155064323, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:16');
INSERT INTO "public"."access_record" VALUES (2015998196155064324, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:16');
INSERT INTO "public"."access_record" VALUES (2015998196155064325, 'localhost', 18888, NULL, NULL, 28, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:47:15');
INSERT INTO "public"."access_record" VALUES (2015998196159258625, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:47:15');
INSERT INTO "public"."access_record" VALUES (2015998196159258626, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 59, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:47:15');
INSERT INTO "public"."access_record" VALUES (2015998196159258627, 'localhost', 18888, NULL, NULL, 22, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:47:15');
INSERT INTO "public"."access_record" VALUES (2015998196159258628, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196167647234, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196167647235, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196167647236, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196171841537, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196171841538, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196171841539, 'localhost', 18888, NULL, NULL, 18, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196171841540, 'localhost', 18888, NULL, NULL, 17, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196171841541, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196176035842, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:11');
INSERT INTO "public"."access_record" VALUES (2015998196176035843, 'localhost', 18888, NULL, NULL, 11, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:46:10');
INSERT INTO "public"."access_record" VALUES (2015998196176035844, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 53, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:46:10');
INSERT INTO "public"."access_record" VALUES (2015998196176035845, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:46:06');
INSERT INTO "public"."access_record" VALUES (2016058593918787586, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 49, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:59:16');
INSERT INTO "public"."access_record" VALUES (2015998196176035846, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:06');
INSERT INTO "public"."access_record" VALUES (2015998196176035847, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196176035848, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196176035849, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196184424449, 'localhost', 18888, NULL, NULL, 18, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196184424450, 'localhost', 18888, NULL, NULL, 16, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196184424451, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196184424452, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196184424453, 'localhost', 18888, NULL, NULL, 17, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196184424454, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196184424455, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 39, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:46:05');
INSERT INTO "public"."access_record" VALUES (2015998196184424456, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:45:59');
INSERT INTO "public"."access_record" VALUES (2015998196188618753, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196188618754, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196188618755, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196188618756, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196188618757, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196188618758, 'localhost', 18888, NULL, NULL, 17, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196188618759, 'localhost', 18888, NULL, NULL, 8, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196188618760, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196197007361, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:58');
INSERT INTO "public"."access_record" VALUES (2015998196197007362, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:45:57');
INSERT INTO "public"."access_record" VALUES (2015998196197007363, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 47, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:45:57');
INSERT INTO "public"."access_record" VALUES (2015998196197007364, 'localhost', 18888, NULL, NULL, 11, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196197007365, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196197007366, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196197007367, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196197007368, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196197007369, 'localhost', 18888, NULL, NULL, 19, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196197007370, 'localhost', 18888, NULL, NULL, 20, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196197007371, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196197007372, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196205395969, 'localhost', 18888, NULL, NULL, 12, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:45:53');
INSERT INTO "public"."access_record" VALUES (2015998196205395970, 'localhost', 18888, NULL, NULL, 15, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:45:52');
INSERT INTO "public"."access_record" VALUES (2015998196205395971, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 34, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:45:52');
INSERT INTO "public"."access_record" VALUES (2015998196205395972, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196205395973, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196205395974, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196205395975, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196205395976, 'localhost', 18888, NULL, NULL, 26, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196205395977, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196209590273, 'localhost', 18888, NULL, NULL, 18, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196209590274, 'localhost', 18888, NULL, NULL, 22, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196209590275, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196209590276, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196209590277, 'localhost', 18888, NULL, NULL, 20, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:45:44');
INSERT INTO "public"."access_record" VALUES (2015998196209590278, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 42, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:45:43');
INSERT INTO "public"."access_record" VALUES (2015998196209590279, 'localhost', 18888, NULL, NULL, 10, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196209590280, 'localhost', 18888, NULL, NULL, 32, '/step/Zaohu/2025/12/26/beaa6efc7efc46aa8e9f1df2604f2830_1766740371966.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784578, 'localhost', 18888, NULL, NULL, 21, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784579, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784580, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784581, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784582, 'localhost', 18888, NULL, NULL, 28, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784583, 'localhost', 18888, NULL, NULL, 28, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784584, 'localhost', 18888, NULL, NULL, 19, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784585, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 11:45:39');
INSERT INTO "public"."access_record" VALUES (2015998196213784586, 'localhost', 18888, NULL, NULL, 20, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 11:45:38');
INSERT INTO "public"."access_record" VALUES (2015998196222173185, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 34, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 11:45:38');
INSERT INTO "public"."access_record" VALUES (2016001970814754818, 'localhost', 18888, NULL, NULL, 133, '/step/article/addArticle', '未知内网IP', '内网IP', '2026-01-27 12:04:55');
INSERT INTO "public"."access_record" VALUES (2016051044393885697, 'localhost', 18888, NULL, NULL, 19, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:22:22');
INSERT INTO "public"."access_record" VALUES (2016051044410662913, 'localhost', 18888, NULL, NULL, 19, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:22:22');
INSERT INTO "public"."access_record" VALUES (2016051044414857218, 'localhost', 18888, NULL, NULL, 18, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:22:22');
INSERT INTO "public"."access_record" VALUES (2016051044419051522, 'localhost', 18888, NULL, NULL, 47, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016051044419051523, 'localhost', 18888, NULL, NULL, 36, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016051044419051524, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016051044423245825, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016051044423245826, 'localhost', 18888, NULL, NULL, 31, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016051044431634434, 'localhost', 18888, NULL, NULL, 26, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016051044435828737, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 496, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016051044440023042, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016051044440023043, 'localhost', 18888, NULL, NULL, 451, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:22:21');
INSERT INTO "public"."access_record" VALUES (2016054819108102146, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:43:59');
INSERT INTO "public"."access_record" VALUES (2016054819108102147, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:43:59');
INSERT INTO "public"."access_record" VALUES (2016054819108102148, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:43:59');
INSERT INTO "public"."access_record" VALUES (2016054819108102149, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:43:59');
INSERT INTO "public"."access_record" VALUES (2016054819108102150, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:43:59');
INSERT INTO "public"."access_record" VALUES (2016054819108102151, 'localhost', 18888, NULL, NULL, 7, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:43:59');
INSERT INTO "public"."access_record" VALUES (2016054819108102152, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:43:59');
INSERT INTO "public"."access_record" VALUES (2016054819108102153, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:43:58');
INSERT INTO "public"."access_record" VALUES (2016054819108102154, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:43:58');
INSERT INTO "public"."access_record" VALUES (2016054819108102155, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:43:58');
INSERT INTO "public"."access_record" VALUES (2016054819108102156, 'localhost', 18888, NULL, NULL, 158, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:43:58');
INSERT INTO "public"."access_record" VALUES (2016054819108102157, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 46, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:43:58');
INSERT INTO "public"."access_record" VALUES (2016054819108102158, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:42:00');
INSERT INTO "public"."access_record" VALUES (2016054819108102159, 'localhost', 18888, NULL, NULL, 21464, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:41:59');
INSERT INTO "public"."access_record" VALUES (2016054819108102160, 'localhost', 18888, NULL, NULL, 6, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 15:41:33');
INSERT INTO "public"."access_record" VALUES (2016054819108102161, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:32');
INSERT INTO "public"."access_record" VALUES (2016054819108102162, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:32');
INSERT INTO "public"."access_record" VALUES (2016054819108102163, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:31');
INSERT INTO "public"."access_record" VALUES (2016054819108102164, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102165, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102166, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102167, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102168, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102169, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102170, 'localhost', 18888, NULL, NULL, 22, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102171, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102172, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102173, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102174, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:41:26');
INSERT INTO "public"."access_record" VALUES (2016054819108102175, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 35, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:41:25');
INSERT INTO "public"."access_record" VALUES (2016054819108102176, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 39, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:41:13');
INSERT INTO "public"."access_record" VALUES (2016054819108102177, 'localhost', 18888, NULL, NULL, 109, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:41:13');
INSERT INTO "public"."access_record" VALUES (2016054819108102178, 'localhost', 18888, NULL, NULL, 9, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 15:41:11');
INSERT INTO "public"."access_record" VALUES (2016054819108102179, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:09');
INSERT INTO "public"."access_record" VALUES (2016058593918787587, 'localhost', 18888, NULL, NULL, 143, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:59:16');
INSERT INTO "public"."access_record" VALUES (2016054819108102180, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:09');
INSERT INTO "public"."access_record" VALUES (2016054819108102181, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:09');
INSERT INTO "public"."access_record" VALUES (2016054819108102182, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102183, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102184, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102185, 'localhost', 18888, NULL, NULL, 24, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102186, 'localhost', 18888, NULL, NULL, 7, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102187, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102188, 'localhost', 18888, NULL, NULL, 9, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102189, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102190, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102191, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:41:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102192, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 36, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:41:07');
INSERT INTO "public"."access_record" VALUES (2016054819108102193, 'localhost', 18888, NULL, NULL, 20, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:41:07');
INSERT INTO "public"."access_record" VALUES (2016054819108102194, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 20, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:35:55');
INSERT INTO "public"."access_record" VALUES (2016054819108102195, 'localhost', 18888, NULL, NULL, 64, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:35:54');
INSERT INTO "public"."access_record" VALUES (2016054819108102196, 'localhost', 18888, NULL, NULL, 17, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 15:35:53');
INSERT INTO "public"."access_record" VALUES (2016054819108102197, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:50');
INSERT INTO "public"."access_record" VALUES (2016054819108102198, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:50');
INSERT INTO "public"."access_record" VALUES (2016054819108102199, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:49');
INSERT INTO "public"."access_record" VALUES (2016054819108102200, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:47');
INSERT INTO "public"."access_record" VALUES (2016054819108102201, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102202, 'localhost', 18888, NULL, NULL, 14, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102203, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102204, 'localhost', 18888, NULL, NULL, 16, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102205, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102206, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102207, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102208, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102209, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102210, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 33, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102211, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:35:46');
INSERT INTO "public"."access_record" VALUES (2016054819108102212, 'localhost', 18888, NULL, NULL, 29395, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:35:42');
INSERT INTO "public"."access_record" VALUES (2016054819108102213, 'localhost', 18888, NULL, NULL, 7, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 15:35:11');
INSERT INTO "public"."access_record" VALUES (2016054819108102214, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:08');
INSERT INTO "public"."access_record" VALUES (2016054819108102215, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:08');
INSERT INTO "public"."access_record" VALUES (2016054819166822402, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:35:08');
INSERT INTO "public"."access_record" VALUES (2016054819166822403, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:34:51');
INSERT INTO "public"."access_record" VALUES (2016054819166822404, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819166822405, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819166822406, 'localhost', 18888, NULL, NULL, 8, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819171016706, 'localhost', 18888, NULL, NULL, 19, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819171016707, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819171016708, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819171016709, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819171016710, 'localhost', 18888, NULL, NULL, 3, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819175211010, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:50');
INSERT INTO "public"."access_record" VALUES (2016054819175211011, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 22, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:34:49');
INSERT INTO "public"."access_record" VALUES (2016054819175211012, 'localhost', 18888, NULL, NULL, 8, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:34:49');
INSERT INTO "public"."access_record" VALUES (2016054819175211013, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:34:46');
INSERT INTO "public"."access_record" VALUES (2016054819175211014, 'localhost', 18888, NULL, NULL, 429, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:34:46');
INSERT INTO "public"."access_record" VALUES (2016054819179405314, 'localhost', 18888, NULL, NULL, 5, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 15:34:44');
INSERT INTO "public"."access_record" VALUES (2016062369190826010, 'localhost', 18888, NULL, NULL, 8, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016054819179405315, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:42');
INSERT INTO "public"."access_record" VALUES (2016054819179405316, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:42');
INSERT INTO "public"."access_record" VALUES (2016054819179405317, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:42');
INSERT INTO "public"."access_record" VALUES (2016054819179405318, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819179405319, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819179405320, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819179405321, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819179405322, 'localhost', 18888, NULL, NULL, 8, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819179405323, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819179405324, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819179405325, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819179405326, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819187793921, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:34:39');
INSERT INTO "public"."access_record" VALUES (2016054819187793922, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 33, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:34:38');
INSERT INTO "public"."access_record" VALUES (2016054819187793923, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:34:38');
INSERT INTO "public"."access_record" VALUES (2016054819187793924, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988225, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988226, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988227, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988228, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988229, 'localhost', 18888, NULL, NULL, 12, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988230, 'localhost', 18888, NULL, NULL, 16, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988231, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988232, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988233, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:33:16');
INSERT INTO "public"."access_record" VALUES (2016054819191988234, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:33:15');
INSERT INTO "public"."access_record" VALUES (2016054819200376833, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 32, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:33:15');
INSERT INTO "public"."access_record" VALUES (2016054819200376834, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819200376835, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819200376836, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819200376837, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819200376838, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819200376839, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819200376840, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819200376841, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819208765441, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819208765442, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819208765443, 'localhost', 18888, NULL, NULL, 10, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:33:10');
INSERT INTO "public"."access_record" VALUES (2016054819208765444, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 34, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:33:09');
INSERT INTO "public"."access_record" VALUES (2016054819208765445, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:32:50');
INSERT INTO "public"."access_record" VALUES (2016054819208765446, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:50');
INSERT INTO "public"."access_record" VALUES (2016054819208765447, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:50');
INSERT INTO "public"."access_record" VALUES (2016054819208765448, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:50');
INSERT INTO "public"."access_record" VALUES (2016054819208765449, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:50');
INSERT INTO "public"."access_record" VALUES (2016054819208765450, 'localhost', 18888, NULL, NULL, 7, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:32:50');
INSERT INTO "public"."access_record" VALUES (2016054819208765451, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:32:49');
INSERT INTO "public"."access_record" VALUES (2016054819217154049, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:49');
INSERT INTO "public"."access_record" VALUES (2016054819217154050, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:49');
INSERT INTO "public"."access_record" VALUES (2016054819217154051, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:32:49');
INSERT INTO "public"."access_record" VALUES (2016054819217154052, 'localhost', 18888, NULL, NULL, 12, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:32:49');
INSERT INTO "public"."access_record" VALUES (2016054819217154053, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 38, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:32:49');
INSERT INTO "public"."access_record" VALUES (2016054819217154054, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:32:37');
INSERT INTO "public"."access_record" VALUES (2016054819217154055, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:37');
INSERT INTO "public"."access_record" VALUES (2016054819217154056, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:37');
INSERT INTO "public"."access_record" VALUES (2016054819217154057, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:37');
INSERT INTO "public"."access_record" VALUES (2016054819217154058, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:32:36');
INSERT INTO "public"."access_record" VALUES (2016054819217154059, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:36');
INSERT INTO "public"."access_record" VALUES (2016054819217154060, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:32:36');
INSERT INTO "public"."access_record" VALUES (2016054819217154061, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:32:36');
INSERT INTO "public"."access_record" VALUES (2016054819217154062, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:36');
INSERT INTO "public"."access_record" VALUES (2016054819217154063, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:36');
INSERT INTO "public"."access_record" VALUES (2016054819217154064, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:32:36');
INSERT INTO "public"."access_record" VALUES (2016054819217154065, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 38, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:32:36');
INSERT INTO "public"."access_record" VALUES (2016054819217154066, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819217154067, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819217154068, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819217154069, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819217154070, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819217154071, 'localhost', 18888, NULL, NULL, 12, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819217154072, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819225542657, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819225542658, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819225542659, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819225542660, 'localhost', 18888, NULL, NULL, 13, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:32:15');
INSERT INTO "public"."access_record" VALUES (2016054819225542661, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 35, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:32:14');
INSERT INTO "public"."access_record" VALUES (2016054819225542662, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:32:03');
INSERT INTO "public"."access_record" VALUES (2016054819225542663, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:03');
INSERT INTO "public"."access_record" VALUES (2016054819225542664, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:03');
INSERT INTO "public"."access_record" VALUES (2016054819225542665, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:32:03');
INSERT INTO "public"."access_record" VALUES (2016054819225542666, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:03');
INSERT INTO "public"."access_record" VALUES (2016054819225542667, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:02');
INSERT INTO "public"."access_record" VALUES (2016054819229736962, 'localhost', 18888, NULL, NULL, 13, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:32:02');
INSERT INTO "public"."access_record" VALUES (2016054819229736963, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:32:02');
INSERT INTO "public"."access_record" VALUES (2016054819229736964, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:02');
INSERT INTO "public"."access_record" VALUES (2016054819229736965, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:32:02');
INSERT INTO "public"."access_record" VALUES (2016054819229736966, 'localhost', 18888, NULL, NULL, 19, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:32:02');
INSERT INTO "public"."access_record" VALUES (2016054819229736967, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 42, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:32:02');
INSERT INTO "public"."access_record" VALUES (2016054819229736968, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:31:37');
INSERT INTO "public"."access_record" VALUES (2016054819229736969, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819229736970, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819229736971, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819229736972, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819229736973, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819229736974, 'localhost', 18888, NULL, NULL, 14, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819229736975, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819229736976, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819233931266, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819233931267, 'localhost', 18888, NULL, NULL, 20, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819233931268, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 50, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:31:36');
INSERT INTO "public"."access_record" VALUES (2016054819233931269, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:31:27');
INSERT INTO "public"."access_record" VALUES (2016054819233931270, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:27');
INSERT INTO "public"."access_record" VALUES (2016054819233931271, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:27');
INSERT INTO "public"."access_record" VALUES (2016054819233931272, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:27');
INSERT INTO "public"."access_record" VALUES (2016054819233931273, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:27');
INSERT INTO "public"."access_record" VALUES (2016054819233931274, 'localhost', 18888, NULL, NULL, 19, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:31:27');
INSERT INTO "public"."access_record" VALUES (2016054819233931275, 'localhost', 18888, NULL, NULL, 20, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:31:27');
INSERT INTO "public"."access_record" VALUES (2016054819233931276, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:31:26');
INSERT INTO "public"."access_record" VALUES (2016054819233931277, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:26');
INSERT INTO "public"."access_record" VALUES (2016054819242319874, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:26');
INSERT INTO "public"."access_record" VALUES (2016054819242319875, 'localhost', 18888, NULL, NULL, 17, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:31:26');
INSERT INTO "public"."access_record" VALUES (2016054819242319876, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 46, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:31:26');
INSERT INTO "public"."access_record" VALUES (2016054819242319877, 'localhost', 18888, NULL, NULL, 7, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:31:22');
INSERT INTO "public"."access_record" VALUES (2016054819242319878, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319879, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319880, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319881, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319882, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319883, 'localhost', 18888, NULL, NULL, 16, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319884, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319885, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319886, 'localhost', 18888, NULL, NULL, 15, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319887, 'localhost', 18888, NULL, NULL, 15, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319888, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 64, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:31:21');
INSERT INTO "public"."access_record" VALUES (2016054819242319889, 'localhost', 18888, NULL, NULL, 8, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:31:13');
INSERT INTO "public"."access_record" VALUES (2016054819242319890, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:13');
INSERT INTO "public"."access_record" VALUES (2016054819242319891, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:13');
INSERT INTO "public"."access_record" VALUES (2016054819242319892, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819242319893, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819242319894, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819250708482, 'localhost', 18888, NULL, NULL, 12, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819250708483, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819250708484, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819250708485, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819250708486, 'localhost', 18888, NULL, NULL, 11, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819250708487, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 37, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:31:12');
INSERT INTO "public"."access_record" VALUES (2016054819254902785, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:30:57');
INSERT INTO "public"."access_record" VALUES (2016054819254902786, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:57');
INSERT INTO "public"."access_record" VALUES (2016054819254902787, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:57');
INSERT INTO "public"."access_record" VALUES (2016054819254902788, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:57');
INSERT INTO "public"."access_record" VALUES (2016054819254902789, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:56');
INSERT INTO "public"."access_record" VALUES (2016054819254902790, 'localhost', 18888, NULL, NULL, 13, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:30:56');
INSERT INTO "public"."access_record" VALUES (2016054819254902791, 'localhost', 18888, NULL, NULL, 16, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:30:56');
INSERT INTO "public"."access_record" VALUES (2016054819254902792, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:56');
INSERT INTO "public"."access_record" VALUES (2016054819254902793, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:56');
INSERT INTO "public"."access_record" VALUES (2016054819254902794, 'localhost', 18888, NULL, NULL, 13, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:30:56');
INSERT INTO "public"."access_record" VALUES (2016054819254902795, 'localhost', 18888, NULL, NULL, 19, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:30:56');
INSERT INTO "public"."access_record" VALUES (2016054819254902796, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 42, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:30:56');
INSERT INTO "public"."access_record" VALUES (2016054819254902797, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:32');
INSERT INTO "public"."access_record" VALUES (2016054819263291394, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:30:32');
INSERT INTO "public"."access_record" VALUES (2016054819263291395, 'localhost', 18888, NULL, NULL, 11, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:30:32');
INSERT INTO "public"."access_record" VALUES (2016054819263291396, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:32');
INSERT INTO "public"."access_record" VALUES (2016054819263291397, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:32');
INSERT INTO "public"."access_record" VALUES (2016054819263291398, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:30:32');
INSERT INTO "public"."access_record" VALUES (2016054819263291399, 'localhost', 18888, NULL, NULL, 18, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:30:31');
INSERT INTO "public"."access_record" VALUES (2016054819263291400, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:31');
INSERT INTO "public"."access_record" VALUES (2016054819263291401, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:31');
INSERT INTO "public"."access_record" VALUES (2016054819263291402, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:30:31');
INSERT INTO "public"."access_record" VALUES (2016054819263291403, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 45, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:30:31');
INSERT INTO "public"."access_record" VALUES (2016054819263291404, 'localhost', 18888, NULL, NULL, 30, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:30:31');
INSERT INTO "public"."access_record" VALUES (2016058593910398977, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 54, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:59:29');
INSERT INTO "public"."access_record" VALUES (2016058593918787585, 'localhost', 18888, NULL, NULL, 205, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:59:28');
INSERT INTO "public"."access_record" VALUES (2016058593922981890, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:13');
INSERT INTO "public"."access_record" VALUES (2016058593922981891, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:13');
INSERT INTO "public"."access_record" VALUES (2016058593922981892, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:13');
INSERT INTO "public"."access_record" VALUES (2016058593922981893, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:12');
INSERT INTO "public"."access_record" VALUES (2016058593927176193, 'localhost', 18888, NULL, NULL, 11, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:59:12');
INSERT INTO "public"."access_record" VALUES (2016058593927176194, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:12');
INSERT INTO "public"."access_record" VALUES (2016058593927176195, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:12');
INSERT INTO "public"."access_record" VALUES (2016058593935564801, 'localhost', 18888, NULL, NULL, 11, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:59:12');
INSERT INTO "public"."access_record" VALUES (2016058593935564802, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:12');
INSERT INTO "public"."access_record" VALUES (2016058593935564803, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:59:12');
INSERT INTO "public"."access_record" VALUES (2016058593935564804, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593935564805, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593939759105, 'localhost', 18888, NULL, NULL, 7, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593939759106, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 23, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593939759107, 'localhost', 18888, NULL, NULL, 11, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593939759108, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593939759109, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593939759110, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 23, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593939759111, 'localhost', 18888, NULL, NULL, 11, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:59:11');
INSERT INTO "public"."access_record" VALUES (2016058593939759112, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:57:45');
INSERT INTO "public"."access_record" VALUES (2016058593939759113, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:57:45');
INSERT INTO "public"."access_record" VALUES (2016058593939759114, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:57:44');
INSERT INTO "public"."access_record" VALUES (2016058593939759115, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:57:44');
INSERT INTO "public"."access_record" VALUES (2016058593939759116, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:57:44');
INSERT INTO "public"."access_record" VALUES (2016058593948147713, 'localhost', 18888, NULL, NULL, 7, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:57:44');
INSERT INTO "public"."access_record" VALUES (2016058593948147714, 'localhost', 18888, NULL, NULL, 7, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:57:44');
INSERT INTO "public"."access_record" VALUES (2016058593948147715, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:57:44');
INSERT INTO "public"."access_record" VALUES (2016058593948147716, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:57:44');
INSERT INTO "public"."access_record" VALUES (2016058593948147717, 'localhost', 18888, NULL, NULL, 12, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:57:44');
INSERT INTO "public"."access_record" VALUES (2016058593948147718, 'localhost', 18888, NULL, NULL, 80, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:57:43');
INSERT INTO "public"."access_record" VALUES (2016058593948147719, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 250, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:57:43');
INSERT INTO "public"."access_record" VALUES (2016058593948147720, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 44, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:55:08');
INSERT INTO "public"."access_record" VALUES (2016058593952342018, 'localhost', 18888, NULL, NULL, 98, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:55:08');
INSERT INTO "public"."access_record" VALUES (2016058593952342019, 'localhost', 18888, NULL, NULL, 5, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 15:55:07');
INSERT INTO "public"."access_record" VALUES (2016058593952342020, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:55:05');
INSERT INTO "public"."access_record" VALUES (2016058593952342021, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:55:05');
INSERT INTO "public"."access_record" VALUES (2016058593952342022, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:55:04');
INSERT INTO "public"."access_record" VALUES (2016058593952342023, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:54:42');
INSERT INTO "public"."access_record" VALUES (2016058593952342024, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:54:42');
INSERT INTO "public"."access_record" VALUES (2016058593952342025, 'localhost', 18888, NULL, NULL, 11, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:54:42');
INSERT INTO "public"."access_record" VALUES (2016058593952342026, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:54:42');
INSERT INTO "public"."access_record" VALUES (2016058593952342027, 'localhost', 18888, NULL, NULL, 12, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:54:41');
INSERT INTO "public"."access_record" VALUES (2016058593952342028, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:54:41');
INSERT INTO "public"."access_record" VALUES (2016058593960730625, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:54:41');
INSERT INTO "public"."access_record" VALUES (2016058593960730626, 'localhost', 18888, NULL, NULL, 7, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:54:41');
INSERT INTO "public"."access_record" VALUES (2016058593960730627, 'localhost', 18888, NULL, NULL, 2, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:54:41');
INSERT INTO "public"."access_record" VALUES (2016058593960730628, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:54:41');
INSERT INTO "public"."access_record" VALUES (2016058593960730629, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 32, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:54:41');
INSERT INTO "public"."access_record" VALUES (2016058593960730630, 'localhost', 18888, NULL, NULL, 18, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:54:41');
INSERT INTO "public"."access_record" VALUES (2016058593960730631, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593960730632, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593964924930, 'localhost', 18888, NULL, NULL, 27, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593964924931, 'localhost', 18888, NULL, NULL, 23, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593964924932, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593964924933, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593964924934, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593964924935, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593969119233, 'localhost', 18888, NULL, NULL, 8, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:53:39');
INSERT INTO "public"."access_record" VALUES (2016058593969119234, 'localhost', 18888, NULL, NULL, 7, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:53:38');
INSERT INTO "public"."access_record" VALUES (2016058593969119235, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 37, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:53:38');
INSERT INTO "public"."access_record" VALUES (2016058593969119236, 'localhost', 18888, NULL, NULL, 11, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:53:38');
INSERT INTO "public"."access_record" VALUES (2016058593969119237, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 38, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:49:49');
INSERT INTO "public"."access_record" VALUES (2016058593969119238, 'localhost', 18888, NULL, NULL, 95, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:49:48');
INSERT INTO "public"."access_record" VALUES (2016058593969119239, 'localhost', 18888, NULL, NULL, 6, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 15:49:47');
INSERT INTO "public"."access_record" VALUES (2016058593969119240, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:45');
INSERT INTO "public"."access_record" VALUES (2016058593969119241, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:45');
INSERT INTO "public"."access_record" VALUES (2016058593969119242, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:45');
INSERT INTO "public"."access_record" VALUES (2016058593969119243, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:41');
INSERT INTO "public"."access_record" VALUES (2016058593969119244, 'localhost', 18888, NULL, NULL, 7, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:49:41');
INSERT INTO "public"."access_record" VALUES (2016058593969119245, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:41');
INSERT INTO "public"."access_record" VALUES (2016058593969119246, 'localhost', 18888, NULL, NULL, 8, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:49:41');
INSERT INTO "public"."access_record" VALUES (2016058593969119247, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:41');
INSERT INTO "public"."access_record" VALUES (2016058593969119248, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:40');
INSERT INTO "public"."access_record" VALUES (2016058593969119249, 'localhost', 18888, NULL, NULL, 7, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:49:40');
INSERT INTO "public"."access_record" VALUES (2016058593969119250, 'localhost', 18888, NULL, NULL, 12, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:49:40');
INSERT INTO "public"."access_record" VALUES (2016058593969119251, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:49:40');
INSERT INTO "public"."access_record" VALUES (2016058593969119252, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:40');
INSERT INTO "public"."access_record" VALUES (2016058593969119253, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:40');
INSERT INTO "public"."access_record" VALUES (2016058593969119254, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 28, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:49:40');
INSERT INTO "public"."access_record" VALUES (2016058593969119255, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:38');
INSERT INTO "public"."access_record" VALUES (2016058593969119256, 'localhost', 18888, NULL, NULL, 10, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593969119257, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593969119258, 'localhost', 18888, NULL, NULL, 15, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593977507842, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593977507843, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593977507844, 'localhost', 18888, NULL, NULL, 10, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593981702145, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593981702146, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593981702147, 'localhost', 18888, NULL, NULL, 5, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593981702148, 'localhost', 18888, NULL, NULL, 22, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593981702149, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 31, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:49:37');
INSERT INTO "public"."access_record" VALUES (2016058593981702150, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 51, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:49:28');
INSERT INTO "public"."access_record" VALUES (2016058593981702151, 'localhost', 18888, NULL, NULL, 111, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 15:49:28');
INSERT INTO "public"."access_record" VALUES (2016058593985896450, 'localhost', 18888, NULL, NULL, 6, '/step/api/static/images/deleted.png', '未知内网IP', '内网IP', '2026-01-27 15:49:27');
INSERT INTO "public"."access_record" VALUES (2016058593985896451, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:24');
INSERT INTO "public"."access_record" VALUES (2016058593985896452, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:24');
INSERT INTO "public"."access_record" VALUES (2016058593985896453, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:24');
INSERT INTO "public"."access_record" VALUES (2016058593985896454, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:23');
INSERT INTO "public"."access_record" VALUES (2016058593985896455, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:23');
INSERT INTO "public"."access_record" VALUES (2016058593985896456, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:23');
INSERT INTO "public"."access_record" VALUES (2016058593985896457, 'localhost', 18888, NULL, NULL, 12, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 15:49:23');
INSERT INTO "public"."access_record" VALUES (2016058593985896458, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 15:49:23');
INSERT INTO "public"."access_record" VALUES (2016058593994285057, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 15:49:23');
INSERT INTO "public"."access_record" VALUES (2016058593998479362, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/3e5dcdef31e14df69bee1b3345cc155a_1769485657742.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:22');
INSERT INTO "public"."access_record" VALUES (2016058593998479363, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/2eb7f80435714817a2e31f5389b16299_1766740371962.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:22');
INSERT INTO "public"."access_record" VALUES (2016058593998479364, 'localhost', 18888, NULL, NULL, 11, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 15:49:22');
INSERT INTO "public"."access_record" VALUES (2016058593998479365, 'localhost', 18888, NULL, NULL, 0, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 15:49:22');
INSERT INTO "public"."access_record" VALUES (2016058594006867969, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 38, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 15:49:22');
INSERT INTO "public"."access_record" VALUES (2016058594006867970, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 15:49:22');
INSERT INTO "public"."access_record" VALUES (2016062369127911425, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 46, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:14:39');
INSERT INTO "public"."access_record" VALUES (2016062369127911426, 'localhost', 18888, NULL, NULL, 121, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:14:39');
INSERT INTO "public"."access_record" VALUES (2016062369127911427, 'localhost', 18888, NULL, NULL, 17, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:14:19');
INSERT INTO "public"."access_record" VALUES (2016062369127911428, 'localhost', 18888, NULL, NULL, 14, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:14:19');
INSERT INTO "public"."access_record" VALUES (2016062369127911429, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:14:19');
INSERT INTO "public"."access_record" VALUES (2016062369127911430, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:55');
INSERT INTO "public"."access_record" VALUES (2016062369127911431, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:55');
INSERT INTO "public"."access_record" VALUES (2016062369127911432, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:55');
INSERT INTO "public"."access_record" VALUES (2016062369127911433, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 84, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:13:55');
INSERT INTO "public"."access_record" VALUES (2016062369127911434, 'localhost', 18888, NULL, NULL, 306, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:13:54');
INSERT INTO "public"."access_record" VALUES (2016062369127911435, 'localhost', 18888, NULL, NULL, 48, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:31');
INSERT INTO "public"."access_record" VALUES (2016062369127911436, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 54, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:13:31');
INSERT INTO "public"."access_record" VALUES (2016062369127911437, 'localhost', 18888, NULL, NULL, 163, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:13:31');
INSERT INTO "public"."access_record" VALUES (2016062369127911438, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:26');
INSERT INTO "public"."access_record" VALUES (2016062369127911439, 'localhost', 18888, NULL, NULL, 19, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:16');
INSERT INTO "public"."access_record" VALUES (2016062369127911440, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:16');
INSERT INTO "public"."access_record" VALUES (2016062369127911441, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:16');
INSERT INTO "public"."access_record" VALUES (2016062369127911442, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 44, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:13:16');
INSERT INTO "public"."access_record" VALUES (2016062369127911443, 'localhost', 18888, NULL, NULL, 3270, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:13:15');
INSERT INTO "public"."access_record" VALUES (2016062369127911444, 'localhost', 18888, NULL, NULL, 18, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:08');
INSERT INTO "public"."access_record" VALUES (2016062369127911445, 'localhost', 18888, NULL, NULL, 18, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:08');
INSERT INTO "public"."access_record" VALUES (2016062369127911446, 'localhost', 18888, NULL, NULL, 18, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 16:13:08');
INSERT INTO "public"."access_record" VALUES (2016062369127911447, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 54, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:07:56');
INSERT INTO "public"."access_record" VALUES (2016062369127911448, 'localhost', 18888, NULL, NULL, 106, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:07:55');
INSERT INTO "public"."access_record" VALUES (2016062369127911449, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 57, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:07:31');
INSERT INTO "public"."access_record" VALUES (2016062369127911450, 'localhost', 18888, NULL, NULL, 137, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:07:31');
INSERT INTO "public"."access_record" VALUES (2016062369190825986, 'localhost', 18888, NULL, NULL, 19, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 16:06:52');
INSERT INTO "public"."access_record" VALUES (2016062369190825987, 'localhost', 18888, NULL, NULL, 13, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 16:06:52');
INSERT INTO "public"."access_record" VALUES (2016062369190825988, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 16:06:51');
INSERT INTO "public"."access_record" VALUES (2016062369190825989, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 16:06:51');
INSERT INTO "public"."access_record" VALUES (2016062369190825990, 'localhost', 18888, NULL, NULL, 69, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 16:06:51');
INSERT INTO "public"."access_record" VALUES (2016062369190825991, 'localhost', 18888, NULL, NULL, 52, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 16:06:51');
INSERT INTO "public"."access_record" VALUES (2016062369190825992, 'localhost', 18888, NULL, NULL, 40, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 16:06:51');
INSERT INTO "public"."access_record" VALUES (2016062369190825993, 'localhost', 18888, NULL, NULL, 39, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:06:51');
INSERT INTO "public"."access_record" VALUES (2016062369190825994, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 39, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:06:51');
INSERT INTO "public"."access_record" VALUES (2016062369190825995, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 51, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:06:43');
INSERT INTO "public"."access_record" VALUES (2016062369190825996, 'localhost', 18888, NULL, NULL, 171, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:06:43');
INSERT INTO "public"."access_record" VALUES (2016062369190825997, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 146, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:06:32');
INSERT INTO "public"."access_record" VALUES (2016062369190825998, 'localhost', 18888, NULL, NULL, 911, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:06:32');
INSERT INTO "public"."access_record" VALUES (2016062369190825999, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 30, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:03:54');
INSERT INTO "public"."access_record" VALUES (2016062369190826000, 'localhost', 18888, NULL, NULL, 81, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:03:54');
INSERT INTO "public"."access_record" VALUES (2016062369190826001, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 18, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:02:01');
INSERT INTO "public"."access_record" VALUES (2016062369190826002, 'localhost', 18888, NULL, NULL, 12777, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:02:01');
INSERT INTO "public"."access_record" VALUES (2016062369190826003, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 35, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:01:33');
INSERT INTO "public"."access_record" VALUES (2016062369190826004, 'localhost', 18888, NULL, NULL, 133, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:01:33');
INSERT INTO "public"."access_record" VALUES (2016062369190826005, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 16:01:29');
INSERT INTO "public"."access_record" VALUES (2016062369190826006, 'localhost', 18888, NULL, NULL, 2, '/step/Zaohu/2026/01/21/c8640fa42a0542d3986690fafc476428_1768965748543.jpg', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016062369190826007, 'localhost', 18888, NULL, NULL, 3, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016062369190826008, 'localhost', 18888, NULL, NULL, 9, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016062369190826009, 'localhost', 18888, NULL, NULL, 9, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016062369190826012, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/26/9ae6b9b354db43909b121a79911c2570_1766740371952.jpg', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016062369190826013, 'localhost', 18888, NULL, NULL, 4, '/step/Zaohu/2025/12/29/cdad61dc24134238ad5d0c67d94096ec_1766994579774.jpg', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016062369190826014, 'localhost', 18888, NULL, NULL, 4, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016062369190826015, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 23, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:01:28');
INSERT INTO "public"."access_record" VALUES (2016062369190826016, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 47, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:01:17');
INSERT INTO "public"."access_record" VALUES (2016062369190826017, 'localhost', 18888, NULL, NULL, 99, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:01:16');
INSERT INTO "public"."access_record" VALUES (2016066144613859329, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:47');
INSERT INTO "public"."access_record" VALUES (2016066144634830849, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/b434f0bca2094820ac19c8d4a8bc6ae1_1769502386543.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:47');
INSERT INTO "public"."access_record" VALUES (2016066144634830850, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/f7e5de035d864890adbae24b88795eb2_1769502197233.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:47');
INSERT INTO "public"."access_record" VALUES (2016066144634830851, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:47');
INSERT INTO "public"."access_record" VALUES (2016066144643219457, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:47');
INSERT INTO "public"."access_record" VALUES (2016066144647413762, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 58, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:26:47');
INSERT INTO "public"."access_record" VALUES (2016066144647413763, 'localhost', 18888, NULL, NULL, 130, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:26:46');
INSERT INTO "public"."access_record" VALUES (2016066144647413764, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/27/c1039284391043fda68600b15168f271_1769502400649.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:43');
INSERT INTO "public"."access_record" VALUES (2016066144655802370, 'localhost', 18888, NULL, NULL, 22, '/step/Zaohu/2026/01/27/c1039284391043fda68600b15168f271_1769502400649.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:41');
INSERT INTO "public"."access_record" VALUES (2016066144655802371, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 37, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:26:40');
INSERT INTO "public"."access_record" VALUES (2016066144659996674, 'localhost', 18888, NULL, NULL, 107, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:26:40');
INSERT INTO "public"."access_record" VALUES (2016066144664190978, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/abc7d82251384fdda6fff96ac4110bbd_1769502392177.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:34');
INSERT INTO "public"."access_record" VALUES (2016066144664190979, 'localhost', 18888, NULL, NULL, 41, '/step/Zaohu/2026/01/27/abc7d82251384fdda6fff96ac4110bbd_1769502392177.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:32');
INSERT INTO "public"."access_record" VALUES (2016066144664190980, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 52, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:26:32');
INSERT INTO "public"."access_record" VALUES (2016066144668385281, 'localhost', 18888, NULL, NULL, 181, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:26:32');
INSERT INTO "public"."access_record" VALUES (2016066144672579585, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2026/01/27/b434f0bca2094820ac19c8d4a8bc6ae1_1769502386543.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:28');
INSERT INTO "public"."access_record" VALUES (2016066144672579586, 'localhost', 18888, NULL, NULL, 28, '/step/Zaohu/2026/01/27/b434f0bca2094820ac19c8d4a8bc6ae1_1769502386543.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:27');
INSERT INTO "public"."access_record" VALUES (2016066144680968194, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 72, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:26:27');
INSERT INTO "public"."access_record" VALUES (2016066144680968195, 'localhost', 18888, NULL, NULL, 332, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:26:26');
INSERT INTO "public"."access_record" VALUES (2016066144689356802, 'localhost', 18888, NULL, NULL, 12, '/step/Zaohu/2026/01/27/f7e5de035d864890adbae24b88795eb2_1769502197233.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:22');
INSERT INTO "public"."access_record" VALUES (2016066144689356803, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:14');
INSERT INTO "public"."access_record" VALUES (2016066144689356804, 'localhost', 18888, NULL, NULL, 15, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144689356805, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144689356806, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144697745409, 'localhost', 18888, NULL, NULL, 13, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144697745410, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144701939713, 'localhost', 18888, NULL, NULL, 7, '/step/Zaohu/2026/01/27/f7e5de035d864890adbae24b88795eb2_1769502197233.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144701939714, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144701939715, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 35, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144701939716, 'localhost', 18888, NULL, NULL, 16, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 16:26:13');
INSERT INTO "public"."access_record" VALUES (2016066144701939717, 'localhost', 18888, NULL, NULL, 19, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 16:26:12');
INSERT INTO "public"."access_record" VALUES (2016066144718716929, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2026/01/27/f7e5de035d864890adbae24b88795eb2_1769502197233.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716930, 'localhost', 18888, NULL, NULL, 19, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716931, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716932, 'localhost', 18888, NULL, NULL, 15, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716933, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716934, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716935, 'localhost', 18888, NULL, NULL, 14, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716936, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 476, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716937, 'localhost', 18888, NULL, NULL, 441, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 16:26:11');
INSERT INTO "public"."access_record" VALUES (2016066144718716938, 'localhost', 18888, NULL, NULL, 28536, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:23:17');
INSERT INTO "public"."access_record" VALUES (2016066144718716939, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2026/01/27/fec3d35c8f0e4e918f98a662e09964a7_1769502137039.jpg', '未知内网IP', '内网IP', '2026-01-27 16:22:44');
INSERT INTO "public"."access_record" VALUES (2016066144727105538, 'localhost', 18888, NULL, NULL, 42, '/step/Zaohu/2026/01/27/fec3d35c8f0e4e918f98a662e09964a7_1769502137039.jpg', '未知内网IP', '内网IP', '2026-01-27 16:22:17');
INSERT INTO "public"."access_record" VALUES (2016066144731299841, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 182, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:22:17');
INSERT INTO "public"."access_record" VALUES (2016066144731299842, 'localhost', 18888, NULL, NULL, 873, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:22:17');
INSERT INTO "public"."access_record" VALUES (2016066144731299843, 'localhost', 18888, NULL, NULL, 205, '/step/Zaohu/2026/01/27/8d891e4e88ab4e97b76a95d720bea409_1769502044944.jpg', '未知内网IP', '内网IP', '2026-01-27 16:22:12');
INSERT INTO "public"."access_record" VALUES (2016066144735494146, 'localhost', 18888, NULL, NULL, 16, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 16:20:55');
INSERT INTO "public"."access_record" VALUES (2016066144735494147, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2026/01/27/8d891e4e88ab4e97b76a95d720bea409_1769502044944.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144735494148, 'localhost', 18888, NULL, NULL, 22, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144735494149, 'localhost', 18888, NULL, NULL, 11, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144735494150, 'localhost', 18888, NULL, NULL, 19, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144735494151, 'localhost', 18888, NULL, NULL, 24, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144735494152, 'localhost', 18888, NULL, NULL, 6, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144739688450, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144739688451, 'localhost', 18888, NULL, NULL, 6, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144739688452, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 50, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:20:54');
INSERT INTO "public"."access_record" VALUES (2016066144739688453, 'localhost', 18888, NULL, NULL, 33, '/step/Zaohu/2026/01/27/8d891e4e88ab4e97b76a95d720bea409_1769502044944.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:45');
INSERT INTO "public"."access_record" VALUES (2016066144743882753, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 33, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:20:45');
INSERT INTO "public"."access_record" VALUES (2016066144743882754, 'localhost', 18888, NULL, NULL, 204, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:20:44');
INSERT INTO "public"."access_record" VALUES (2016066144752271361, 'localhost', 18888, NULL, NULL, 5, '/step/Zaohu/2026/01/27/9ce1a9eedc174ccdbce05d1da699a94e_1769502035152.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:40');
INSERT INTO "public"."access_record" VALUES (2016066144760659970, 'localhost', 18888, NULL, NULL, 17, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144760659971, 'localhost', 18888, NULL, NULL, 24, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144764854273, 'localhost', 18888, NULL, NULL, 33, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144764854274, 'localhost', 18888, NULL, NULL, 21, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144769048577, 'localhost', 18888, NULL, NULL, 12, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144769048578, 'localhost', 18888, NULL, NULL, 30, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144769048579, 'localhost', 18888, NULL, NULL, 23, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144769048580, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144769048581, 'localhost', 18888, NULL, NULL, 8, '/step/Zaohu/2026/01/27/9ce1a9eedc174ccdbce05d1da699a94e_1769502035152.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:39');
INSERT INTO "public"."access_record" VALUES (2016066144769048582, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 54, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:20:38');
INSERT INTO "public"."access_record" VALUES (2016066144769048583, 'localhost', 18888, NULL, NULL, 51, '/step/Zaohu/2026/01/27/9ce1a9eedc174ccdbce05d1da699a94e_1769502035152.jpg', '未知内网IP', '内网IP', '2026-01-27 16:20:36');
INSERT INTO "public"."access_record" VALUES (2016066144777437185, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 109, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:20:35');
INSERT INTO "public"."access_record" VALUES (2016066144777437186, 'localhost', 18888, NULL, NULL, 2285, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:20:35');
INSERT INTO "public"."access_record" VALUES (2016066144777437187, 'localhost', 18888, NULL, NULL, 47374, '/step/article/updateArticle', '未知内网IP', '内网IP', '2026-01-27 16:15:57');
INSERT INTO "public"."access_record" VALUES (2016069918736687106, 'localhost', 18888, NULL, NULL, 23, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 16:32:10');
INSERT INTO "public"."access_record" VALUES (2016069918761852930, 'localhost', 18888, NULL, NULL, 19, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918770241538, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918774435842, 'localhost', 18888, NULL, NULL, 20, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918774435843, 'localhost', 18888, NULL, NULL, 9, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918774435844, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2026/01/27/f7e5de035d864890adbae24b88795eb2_1769502197233.jpg', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918774435845, 'localhost', 18888, NULL, NULL, 16, '/step/Zaohu/2026/01/27/b434f0bca2094820ac19c8d4a8bc6ae1_1769502386543.jpg', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918782824450, 'localhost', 18888, NULL, NULL, 15, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918782824451, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918787018754, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 457, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918787018755, 'localhost', 18888, NULL, NULL, 426, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 16:32:09');
INSERT INTO "public"."access_record" VALUES (2016069918791213057, 'localhost', 18888, NULL, NULL, 44, '/step/AppsGames', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918791213058, 'localhost', 18888, NULL, NULL, 28, '/step/Zaohu/2026/01/27/f7e5de035d864890adbae24b88795eb2_1769502197233.jpg', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918791213059, 'localhost', 18888, NULL, NULL, 27, '/step/Zaohu/2026/01/27/35b8d789f2d14a058d3dd56f80e9bf40_1769501595706.jpg', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918795407362, 'localhost', 18888, NULL, NULL, 44, '/step/tag/list', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918795407363, 'localhost', 18888, NULL, NULL, 10, '/step/Zaohu/2026/01/27/b434f0bca2094820ac19c8d4a8bc6ae1_1769502386543.jpg', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918795407364, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918795407365, 'localhost', 18888, NULL, NULL, 13, '/step/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918795407366, 'localhost', 18888, NULL, NULL, 13, '/step/weather/list', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918795407367, 'localhost', 18888, NULL, 'pageNum=1&pageSize=10', 316, '/step/article/getDairy', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918795407368, 'localhost', 18888, NULL, NULL, 16, '/step/mood/list', '未知内网IP', '内网IP', '2026-01-27 16:31:35');
INSERT INTO "public"."access_record" VALUES (2016069918803795970, 'localhost', 18888, NULL, NULL, 285, '/step/type/list', '未知内网IP', '内网IP', '2026-01-27 16:31:35');

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
  "write_time" timestamp(6) DEFAULT now(),
  "memory_time" timestamp(6),
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
INSERT INTO "public"."article" VALUES ('2015999434452017154', 531, '手机丢了', '2025/1/26日把手机丢了，但是感觉没有手机的时光真的会做好多事，我以后要慢慢的学会放下手机，多一些思考', '2026-01-27 12:04:55.27551', '2026-01-26 00:00:00', 113, 180, '铁汉柔情', '1000', 'ceshi', '#3498db', '/Zaohu/2026/01/27/f7e5de035d864890adbae24b88795eb2_1769502197233.jpg,/Zaohu/2026/01/27/b434f0bca2094820ac19c8d4a8bc6ae1_1769502386543.jpg', 'f', '未知内网IP');
INSERT INTO "public"."article" VALUES ('2005546744534163458', 677, '周一上班', '今天直接睡到了14点14分，1414 什么意思？，，，这周只上三天班，爽！', '2025-12-29 15:49:39.76652', '2025-11-04 00:00:00', 905, 230, '铁汉柔情', '1000', 'ceshi', '#51FF00', '/Zaohu/2026/01/27/6874a757326f4d7d830bbdd0dc5ba401_1769501611522.jpg,/Zaohu/2025/12/29/bb7487a5b8a04cb0ab9af8241eb0b6c2_1766994579786.jpg,,/Zaohu/2026/01/27/f507820743024e4d952c130eaaf2160d_1769503687341.jpg', 'f', '未知内网IP');
INSERT INTO "public"."article" VALUES ('2004480519586660353', 825, '测试标题哦', '我的文章内容', '2025-12-26 17:12:51.938987', '2025-11-04 00:00:00', 674, 228, '铁汉柔情', '1000', NULL, '#3498db', '', 'f', '未知内网IP');
INSERT INTO "public"."article" VALUES ('663', 1, 'Mrs.', 'Anyone who has ever made anything of importance was disciplined. SSH serves to prevent such vulnerabilities and allows you to access a remote server''s shell without compromising security. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formatting, and more. All journeys have secret destinations of which the traveler is unaware. Actually it is just in an idea when feel oneself can achieve and cannot achieve. All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration. If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane. To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window. The Synchronize to Database function will give you a full picture of all database differences. How we spend our days is, of course, how we spend our lives. The Main Window consists of several toolbars and panes for you to work on connections, database objects and advanced tools. The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily. The Navigation pane employs tree structure which allows you to take action upon the database and their objects through their pop-up menus quickly and easily. In the Objects tab, you can use the List List, Detail Detail and ER Diagram ER Diagram buttons to change the object view. Typically, it is employed as an encrypted version of Telnet. SQL Editor allows you to create and edit SQL text, prepare and execute selected queries. Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords and data (e.g. tables, views, etc) will not be stored to Navicat Cloud. Navicat Monitor is a safe, simple and agentless remote server monitoring tool that is packed with powerful features to make your monitoring effective as possible. It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP. If opportunity doesn’t knock, build a door. To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the reload privilege to use this feature. A comfort zone is a beautiful place, but nothing ever grows there. Anyone who has never made a mistake has never tried anything new. Optimism is the one quality more associated with success and happiness than any other. Anyone who has ever made anything of importance was disciplined. Navicat authorizes you to make connection to remote servers running on different platforms (i.e. Windows, macOS, Linux and UNIX), and supports PAM and GSSAPI authentication.', '2002-03-31 03:50:24', '2007-10-05 09:11:43', 153, 554, 'Pauline Daniels', '1', 'O7R1dC9DQE', 'Gray', 'https://www.airimori01.us/AppsGames', 'f', '88 Wyngate Dr');

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
INSERT INTO "public"."mood" VALUES (180, 'Sit Tin Wing', '7WtfOc60Jm');
INSERT INTO "public"."mood" VALUES (205, 'Liang Shihan', 'YgoeNiVFgH');
INSERT INTO "public"."mood" VALUES (228, 'Fan Zhiyuan', 'vxAhIpypLu');
INSERT INTO "public"."mood" VALUES (230, 'Yamada Daichi', 'nHC7LrZdrG');
INSERT INTO "public"."mood" VALUES (290, 'Yuen Chi Yuen', 't8SfqZfnO9');
INSERT INTO "public"."mood" VALUES (316, 'Siu Kar Yan', 'Aa43hRqmhV');
INSERT INTO "public"."mood" VALUES (431, 'Lu Lu', 'PXpGfjUVPw');
INSERT INTO "public"."mood" VALUES (440, 'Earl Baker', 'j6derNu4c2');
INSERT INTO "public"."mood" VALUES (484, 'Abe Sakura', 'ejIAE2py8H');
INSERT INTO "public"."mood" VALUES (520, 'Donna Tucker', 'bn6bnM8q2Z');
INSERT INTO "public"."mood" VALUES (529, 'Cynthia Ferguson', 'ptplrYoHuu');
INSERT INTO "public"."mood" VALUES (530, 'Takahashi Daichi', 'ggFucTovaK');
INSERT INTO "public"."mood" VALUES (701, 'Walter Gardner', 'TjjFTqPJdq');
INSERT INTO "public"."mood" VALUES (838, 'Stephen Chavez', 'Z8ep4HBsBv');
INSERT INTO "public"."mood" VALUES (861, 'Robert Bryant', 'UdqadaUffK');
INSERT INTO "public"."mood" VALUES (942, 'Joseph Garza', 'y7DkU2Vv3v');
INSERT INTO "public"."mood" VALUES (991, 'Sheh On Kay', 'XbxhsgI0aG');

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
INSERT INTO "public"."photo" VALUES (45, 'd76c98aba9ff4ad9943565d7cc3654ca_1750874985530.webp', '/Zaohu/2025/photo/06/d76c98aba9ff4ad9943565d7cc3654ca_1750874985530.webp', 13, 'f', '2025-06-26 02:09:45.531242', '不知不觉忘记了目的地', '晨曦微露时，风掠过梧桐叶梢，抖落几滴晶莹露珠。街角的咖啡摊飘来醇厚香气，自行车铃在石板路上清脆回响。云朵像被揉碎的棉絮，在淡蓝天空缓缓舒展，远处钟楼的指针悄悄划过刻度，将晨光剪成细碎的金箔，撒在行人肩头，编织出一天的温柔序章。', 'f', NULL, 'sdf', NULL, NULL);

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
INSERT INTO "public"."tag" VALUES (3, 'Sherry Edwards', 'Chrome Yellow', 192);
INSERT INTO "public"."tag" VALUES (4, 'Qiu Shihan', 'Indian Red', 454);
INSERT INTO "public"."tag" VALUES (6, 'Kaneko Aoi', 'Cream', 201);
INSERT INTO "public"."tag" VALUES (7, 'Allen Rogers', 'Silver', 32);
INSERT INTO "public"."tag" VALUES (8, 'Guo Anqi', 'Silver', 161);
INSERT INTO "public"."tag" VALUES (9, 'Sasaki Miu', 'Camel', 326);
INSERT INTO "public"."tag" VALUES (10, 'Tamura Tsubasa', 'Dim Gray', 695);
INSERT INTO "public"."tag" VALUES (15, 'Liao Xiuying', 'Sepia', 210);
INSERT INTO "public"."tag" VALUES (18, 'Ye Lan', 'Honey Orange', 342);
INSERT INTO "public"."tag" VALUES (5, 'Zha3333', '#00ff4c', 296);
INSERT INTO "public"."tag" VALUES (11, 'Li Yunxi', '#cc1e1e', 914);
INSERT INTO "public"."tag" VALUES (1, 'Tang Sze Yu', '#b52121', 363);
INSERT INTO "public"."tag" VALUES (13, 'Tong Chung Yin', '#ff8800', 774);
INSERT INTO "public"."tag" VALUES (19, '1123', '#0078f0', 0);
INSERT INTO "public"."tag" VALUES (12, 'Yan Zhiyuan', 'Olive', 979);
INSERT INTO "public"."tag" VALUES (14, 'Kato Shino', '#4a5d27', 358);
INSERT INTO "public"."tag" VALUES (17, 'Maria Smith', '#421515', 957);
INSERT INTO "public"."tag" VALUES (20, '999', '#305030', 0);
INSERT INTO "public"."tag" VALUES (16, 'Laura Cox', '#ff0000', 328);

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
INSERT INTO "public"."tag_relation" VALUES ('asd', 2);
INSERT INTO "public"."tag_relation" VALUES ('2004480519586660353', 6);
INSERT INTO "public"."tag_relation" VALUES ('2004480519586660353', 13);
INSERT INTO "public"."tag_relation" VALUES ('2004480519586660353', 1);
INSERT INTO "public"."tag_relation" VALUES ('2005546744534163458', 8);
INSERT INTO "public"."tag_relation" VALUES ('2005546744534163458', 7);
INSERT INTO "public"."tag_relation" VALUES ('2005546744534163458', 6);

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
INSERT INTO "public"."type" VALUES (10, 'Jiang Xiaoming', '0IZZF2wztZ', 371);
INSERT INTO "public"."type" VALUES (19, 'Fong Siu Wai', 'tvKJJMgyNJ', 945);
INSERT INTO "public"."type" VALUES (64, 'Nakamura Aoshi', 'z11rakoUzQ', 696);
INSERT INTO "public"."type" VALUES (135, 'Jean Aguilar', 'wAxJ65FAw3', 551);
INSERT INTO "public"."type" VALUES (136, 'Chang Tak Wah', 'SwarPZFNWw', 969);
INSERT INTO "public"."type" VALUES (239, 'Diana Tran', 'G9zyVbi0Gf', 931);
INSERT INTO "public"."type" VALUES (241, 'Yuen Wing Sze', '6QIf2EFc5Y', 826);
INSERT INTO "public"."type" VALUES (356, 'Kwok Cho Yee', 'hX6JIx9qGI', 191);
INSERT INTO "public"."type" VALUES (380, 'Lucille Lewis', 'TCkzYg3rXp', 874);
INSERT INTO "public"."type" VALUES (531, 'Mo Chi Yuen', 'RBE2QL1hwn', 77);
INSERT INTO "public"."type" VALUES (677, 'Koo Yun Fat', 'DsV2YBjr5Z', 414);
INSERT INTO "public"."type" VALUES (719, 'Luo Rui', '5nmUaXhwqq', 373);
INSERT INTO "public"."type" VALUES (825, 'Fu Wai Yee', 'iYR4poIIsr', 319);

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
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "avatar" varchar(255) COLLATE "pg_catalog"."default"
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
INSERT INTO "public"."user" VALUES (1000, '16652851892', '$2a$10$C/l0kilAwIb5tRohhJGCJOJcrruu0G8QJfpm81VmBZWtW0PB55yZe', '铁汉柔情', NULL, '3331247124@qq.com', 'ceshi');
INSERT INTO "public"."user" VALUES (1004, '16652851893', '$2a$10$1Nt3Z9FYcuAwsOCbX/4eH.jehCy9DAwCm53ay0cqMq7AhCxMLUQZG', '铁汉柔情', NULL, '1231231232@qq.com', 'ceshi');
INSERT INTO "public"."user" VALUES (1, '13202553394', '$2a$10$1g0BCK9q.ylVwv3ZMDzRLuSFfUtzmaWm4/MgvDGYREmUhRf8BPPwq', 'aaa', NULL, '2134484173@qq.com', 'ceshi');
INSERT INTO "public"."user" VALUES (1003, '1111111111', '$2a$10$Bn2Y1b6uU8.TdLRjVhXXdeUo88atqEdH6znxQhdz43I5K3aJnEmFq', '123', NULL, '188688888@qq.com', 'ceshi');

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
INSERT INTO "public"."visit_num" VALUES (1, 26036);

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
INSERT INTO "public"."weather" VALUES (113, 'vPpGKaHdlE', 'VzFXvjSyM0');
INSERT INTO "public"."weather" VALUES (128, 'Pu7pYkcfi1', 'ujAg1FE2eD');
INSERT INTO "public"."weather" VALUES (210, 'orD1rkQGev', 'jUF94RGX26');
INSERT INTO "public"."weather" VALUES (251, 'OCo4Yvz34L', 'yOr9pv31Vt');
INSERT INTO "public"."weather" VALUES (261, 'ApD3g6sO3v', '9GNuIGRRMk');
INSERT INTO "public"."weather" VALUES (265, 'VmRufj1r3O', '04PPR7Lf7S');
INSERT INTO "public"."weather" VALUES (302, '5e7ixayHd8', 'QMWJsrtiEE');
INSERT INTO "public"."weather" VALUES (321, 'vyTFYsoyJB', 'k7Zz16t9hL');
INSERT INTO "public"."weather" VALUES (366, 'ExviPSF3fw', 'femKluvkMS');
INSERT INTO "public"."weather" VALUES (439, 'iUjrScay1N', 'VfIfWzpFMl');
INSERT INTO "public"."weather" VALUES (674, '0hvKJU8MZ6', '8JCTF2gHtr');
INSERT INTO "public"."weather" VALUES (593, '30UtVd6i44', 'JWuQaTfgum');
INSERT INTO "public"."weather" VALUES (596, 'BoZRN32I0j', 'nazIXLGXv2');
INSERT INTO "public"."weather" VALUES (877, 'TXPuOUwvWB', 'Nkbt8deUNl');
INSERT INTO "public"."weather" VALUES (905, 'LjIQhl5pvn', 'fTYYVu1sXr');
INSERT INTO "public"."weather" VALUES (923, 'QhMZwszmxc', 'txnLN326jH');
INSERT INTO "public"."weather" VALUES (931, '2yTjw6Ucco', '41jQ2R9h6A');
INSERT INTO "public"."weather" VALUES (957, 'RohDapuqHi', 'cQhKp1KSnK');
INSERT INTO "public"."weather" VALUES (991, 'QyzEaGI3hI', 'cttN19D5wS');

-- ----------------------------
-- Procedure structure for add_columnstore_policy
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."add_columnstore_policy"("hypertable" regclass, "after" any, "if_not_exists" bool, "schedule_interval" interval, "initial_start" timestamptz, "timezone" text, "created_before" interval);
CREATE PROCEDURE "public"."add_columnstore_policy"("hypertable" regclass, "after" any=NULL::unknown, "if_not_exists" bool=false, "schedule_interval" interval=NULL::interval, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "created_before" interval=NULL::interval)
 AS '$libdir/timescaledb-2.24.0', 'ts_policy_compression_add'
  LANGUAGE c;

-- ----------------------------
-- Function structure for add_compression_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_compression_policy"("hypertable" regclass, "compress_after" any, "if_not_exists" bool, "schedule_interval" interval, "initial_start" timestamptz, "timezone" text, "compress_created_before" interval);
CREATE FUNCTION "public"."add_compression_policy"("hypertable" regclass, "compress_after" any=NULL::unknown, "if_not_exists" bool=false, "schedule_interval" interval=NULL::interval, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "compress_created_before" interval=NULL::interval)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_policy_compression_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for add_continuous_aggregate_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_continuous_aggregate_policy"("continuous_aggregate" regclass, "start_offset" any, "end_offset" any, "schedule_interval" interval, "if_not_exists" bool, "initial_start" timestamptz, "timezone" text, "include_tiered_data" bool, "buckets_per_batch" int4, "max_batches_per_execution" int4, "refresh_newest_first" bool);
CREATE FUNCTION "public"."add_continuous_aggregate_policy"("continuous_aggregate" regclass, "start_offset" any, "end_offset" any, "schedule_interval" interval, "if_not_exists" bool=false, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "include_tiered_data" bool=NULL::boolean, "buckets_per_batch" int4=NULL::integer, "max_batches_per_execution" int4=NULL::integer, "refresh_newest_first" bool=NULL::boolean)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_policy_refresh_cagg_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for add_dimension
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_dimension"("hypertable" regclass, "dimension" "_timescaledb_internal"."dimension_info", "if_not_exists" bool);
CREATE FUNCTION "public"."add_dimension"("hypertable" regclass, "dimension" "_timescaledb_internal"."dimension_info", "if_not_exists" bool=false)
  RETURNS TABLE("dimension_id" int4, "created" bool) AS '$libdir/timescaledb-2.24.0', 'ts_dimension_add_general'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for add_dimension
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_dimension"("hypertable" regclass, "column_name" name, "number_partitions" int4, "chunk_time_interval" anyelement, "partitioning_func" regproc, "if_not_exists" bool);
CREATE FUNCTION "public"."add_dimension"("hypertable" regclass, "column_name" name, "number_partitions" int4=NULL::integer, "chunk_time_interval" anyelement=NULL::bigint, "partitioning_func" regproc=NULL::regproc, "if_not_exists" bool=false)
  RETURNS TABLE("dimension_id" int4, "schema_name" name, "table_name" name, "column_name" name, "created" bool) AS '$libdir/timescaledb-2.24.0', 'ts_dimension_add'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for add_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_job"("proc" regproc, "schedule_interval" interval, "config" jsonb, "initial_start" timestamptz, "scheduled" bool, "check_config" regproc, "fixed_schedule" bool, "timezone" text, "job_name" text);
CREATE FUNCTION "public"."add_job"("proc" regproc, "schedule_interval" interval, "config" jsonb=NULL::jsonb, "initial_start" timestamptz=NULL::timestamp with time zone, "scheduled" bool=true, "check_config" regproc=NULL::regproc, "fixed_schedule" bool=true, "timezone" text=NULL::text, "job_name" text=NULL::text)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_job_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for add_process_hypertable_invalidations_policy
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."add_process_hypertable_invalidations_policy"("hypertable" regclass, "schedule_interval" interval, "if_not_exists" bool, "initial_start" timestamptz, "timezone" text);
CREATE PROCEDURE "public"."add_process_hypertable_invalidations_policy"("hypertable" regclass, "schedule_interval" interval, "if_not_exists" bool=false, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text)
 AS '$libdir/timescaledb-2.24.0', 'ts_policy_process_hyper_inval_add'
  LANGUAGE c;

-- ----------------------------
-- Function structure for add_reorder_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_reorder_policy"("hypertable" regclass, "index_name" name, "if_not_exists" bool, "initial_start" timestamptz, "timezone" text);
CREATE FUNCTION "public"."add_reorder_policy"("hypertable" regclass, "index_name" name, "if_not_exists" bool=false, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_policy_reorder_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for add_retention_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_retention_policy"("relation" regclass, "drop_after" any, "if_not_exists" bool, "schedule_interval" interval, "initial_start" timestamptz, "timezone" text, "drop_created_before" interval);
CREATE FUNCTION "public"."add_retention_policy"("relation" regclass, "drop_after" any=NULL::unknown, "if_not_exists" bool=false, "schedule_interval" interval=NULL::interval, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "drop_created_before" interval=NULL::interval)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_policy_retention_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for alter_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."alter_job"("job_id" int4, "schedule_interval" interval, "max_runtime" interval, "max_retries" int4, "retry_period" interval, "scheduled" bool, "config" jsonb, "next_start" timestamptz, "if_exists" bool, "check_config" regproc, "fixed_schedule" bool, "initial_start" timestamptz, "timezone" text, "job_name" text);
CREATE FUNCTION "public"."alter_job"("job_id" int4, "schedule_interval" interval=NULL::interval, "max_runtime" interval=NULL::interval, "max_retries" int4=NULL::integer, "retry_period" interval=NULL::interval, "scheduled" bool=NULL::boolean, "config" jsonb=NULL::jsonb, "next_start" timestamptz=NULL::timestamp with time zone, "if_exists" bool=false, "check_config" regproc=NULL::regproc, "fixed_schedule" bool=NULL::boolean, "initial_start" timestamptz=NULL::timestamp with time zone, "timezone" text=NULL::text, "job_name" text=NULL::text)
  RETURNS TABLE("job_id" int4, "schedule_interval" interval, "max_runtime" interval, "max_retries" int4, "retry_period" interval, "scheduled" bool, "config" jsonb, "next_start" timestamptz, "check_config" text, "fixed_schedule" bool, "initial_start" timestamptz, "timezone" text, "application_name" name) AS '$libdir/timescaledb-2.24.0', 'ts_job_alter'
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
 AS '$libdir/timescaledb-2.24.0', 'ts_attach_chunk'
  LANGUAGE c;

-- ----------------------------
-- Function structure for attach_tablespace
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."attach_tablespace"("tablespace" name, "hypertable" regclass, "if_not_attached" bool);
CREATE FUNCTION "public"."attach_tablespace"("tablespace" name, "hypertable" regclass, "if_not_attached" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_tablespace_attach'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for by_hash
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."by_hash"("column_name" name, "number_partitions" int4, "partition_func" regproc);
CREATE FUNCTION "public"."by_hash"("column_name" name, "number_partitions" int4, "partition_func" regproc=NULL::regproc)
  RETURNS "_timescaledb_internal"."dimension_info" AS '$libdir/timescaledb-2.24.0', 'ts_hash_dimension'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for by_range
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."by_range"("column_name" name, "partition_interval" anyelement, "partition_func" regproc);
CREATE FUNCTION "public"."by_range"("column_name" name, "partition_interval" anyelement=NULL::bigint, "partition_func" regproc=NULL::regproc)
  RETURNS "_timescaledb_internal"."dimension_info" AS '$libdir/timescaledb-2.24.0', 'ts_range_dimension'
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
  RETURNS "pg_catalog"."regclass" AS '$libdir/timescaledb-2.24.0', 'ts_compress_chunk'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for convert_to_columnstore
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."convert_to_columnstore"("chunk" regclass, "if_not_columnstore" bool, "recompress" bool);
CREATE PROCEDURE "public"."convert_to_columnstore"("chunk" regclass, "if_not_columnstore" bool=true, "recompress" bool=false)
 AS '$libdir/timescaledb-2.24.0', 'ts_compress_chunk'
  LANGUAGE c;

-- ----------------------------
-- Procedure structure for convert_to_rowstore
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."convert_to_rowstore"("chunk" regclass, "if_columnstore" bool);
CREATE PROCEDURE "public"."convert_to_rowstore"("chunk" regclass, "if_columnstore" bool=true)
 AS '$libdir/timescaledb-2.24.0', 'ts_decompress_chunk'
  LANGUAGE c;

-- ----------------------------
-- Function structure for create_hypertable
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."create_hypertable"("relation" regclass, "time_column_name" name, "partitioning_column" name, "number_partitions" int4, "associated_schema_name" name, "associated_table_prefix" name, "chunk_time_interval" anyelement, "create_default_indexes" bool, "if_not_exists" bool, "partitioning_func" regproc, "migrate_data" bool, "chunk_target_size" text, "chunk_sizing_func" regproc, "time_partitioning_func" regproc);
CREATE FUNCTION "public"."create_hypertable"("relation" regclass, "time_column_name" name, "partitioning_column" name=NULL::name, "number_partitions" int4=NULL::integer, "associated_schema_name" name=NULL::name, "associated_table_prefix" name=NULL::name, "chunk_time_interval" anyelement=NULL::bigint, "create_default_indexes" bool=true, "if_not_exists" bool=false, "partitioning_func" regproc=NULL::regproc, "migrate_data" bool=false, "chunk_target_size" text=NULL::text, "chunk_sizing_func" regproc='_timescaledb_functions.calculate_chunk_interval'::regproc, "time_partitioning_func" regproc=NULL::regproc)
  RETURNS TABLE("hypertable_id" int4, "schema_name" name, "table_name" name, "created" bool) AS '$libdir/timescaledb-2.24.0', 'ts_hypertable_create'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for create_hypertable
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."create_hypertable"("relation" regclass, "dimension" "_timescaledb_internal"."dimension_info", "create_default_indexes" bool, "if_not_exists" bool, "migrate_data" bool);
CREATE FUNCTION "public"."create_hypertable"("relation" regclass, "dimension" "_timescaledb_internal"."dimension_info", "create_default_indexes" bool=true, "if_not_exists" bool=false, "migrate_data" bool=false)
  RETURNS TABLE("hypertable_id" int4, "created" bool) AS '$libdir/timescaledb-2.24.0', 'ts_hypertable_create_general'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for decompress_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."decompress_chunk"("uncompressed_chunk" regclass, "if_compressed" bool);
CREATE FUNCTION "public"."decompress_chunk"("uncompressed_chunk" regclass, "if_compressed" bool=true)
  RETURNS "pg_catalog"."regclass" AS '$libdir/timescaledb-2.24.0', 'ts_decompress_chunk'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for delete_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."delete_job"("job_id" int4);
CREATE FUNCTION "public"."delete_job"("job_id" int4)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_job_delete'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Procedure structure for detach_chunk
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."detach_chunk"("chunk" regclass);
CREATE PROCEDURE "public"."detach_chunk"("chunk" regclass)
 AS '$libdir/timescaledb-2.24.0', 'ts_detach_chunk'
  LANGUAGE c;

-- ----------------------------
-- Function structure for detach_tablespace
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."detach_tablespace"("tablespace" name, "hypertable" regclass, "if_attached" bool);
CREATE FUNCTION "public"."detach_tablespace"("tablespace" name, "hypertable" regclass=NULL::regclass, "if_attached" bool=false)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_tablespace_detach'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for detach_tablespaces
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."detach_tablespaces"("hypertable" regclass);
CREATE FUNCTION "public"."detach_tablespaces"("hypertable" regclass)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_tablespace_detach_all_from_hypertable'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for disable_chunk_skipping
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."disable_chunk_skipping"("hypertable" regclass, "column_name" name, "if_not_exists" bool);
CREATE FUNCTION "public"."disable_chunk_skipping"("hypertable" regclass, "column_name" name, "if_not_exists" bool=false)
  RETURNS TABLE("hypertable_id" int4, "column_name" name, "disabled" bool) AS '$libdir/timescaledb-2.24.0', 'ts_chunk_column_stats_disable'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for drop_chunks
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."drop_chunks"("relation" regclass, "older_than" any, "newer_than" any, "verbose" bool, "created_before" any, "created_after" any);
CREATE FUNCTION "public"."drop_chunks"("relation" regclass, "older_than" any=NULL::unknown, "newer_than" any=NULL::unknown, "verbose" bool=false, "created_before" any=NULL::unknown, "created_after" any=NULL::unknown)
  RETURNS SETOF "pg_catalog"."text" AS '$libdir/timescaledb-2.24.0', 'ts_chunk_drop_chunks'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for enable_chunk_skipping
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."enable_chunk_skipping"("hypertable" regclass, "column_name" name, "if_not_exists" bool);
CREATE FUNCTION "public"."enable_chunk_skipping"("hypertable" regclass, "column_name" name, "if_not_exists" bool=false)
  RETURNS TABLE("column_stats_id" int4, "enabled" bool) AS '$libdir/timescaledb-2.24.0', 'ts_chunk_column_stats_enable'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for generate_uuidv7
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."generate_uuidv7"();
CREATE FUNCTION "public"."generate_uuidv7"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/timescaledb-2.24.0', 'ts_uuid_generate_v7'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for get_telemetry_report
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."get_telemetry_report"();
CREATE FUNCTION "public"."get_telemetry_report"()
  RETURNS "pg_catalog"."jsonb" AS '$libdir/timescaledb-2.24.0', 'ts_telemetry_get_report_jsonb'
  LANGUAGE c STABLE
  COST 1;

-- ----------------------------
-- Function structure for hypertable_approximate_detailed_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_approximate_detailed_size"("relation" regclass);
CREATE FUNCTION "public"."hypertable_approximate_detailed_size"("relation" regclass)
  RETURNS TABLE("table_bytes" int8, "index_bytes" int8, "toast_bytes" int8, "total_bytes" int8) AS '$libdir/timescaledb-2.24.0', 'ts_hypertable_approximate_size'
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
DROP FUNCTION IF EXISTS "public"."interpolate"("value" float8, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" float8, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."float8" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int8, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" int8, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int4, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" int4, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int2, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" int2, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" float4, "prev" record, "next" record);
CREATE FUNCTION "public"."interpolate"("value" float4, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."float4" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for locf
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."locf"("value" anyelement, "prev" anyelement, "treat_null_as_missing" bool);
CREATE FUNCTION "public"."locf"("value" anyelement, "prev" anyelement=NULL::unknown, "treat_null_as_missing" bool=false)
  RETURNS "pg_catalog"."anyelement" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for merge_chunks
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."merge_chunks"("chunk1" regclass, "chunk2" regclass, "concurrently" bool);
CREATE PROCEDURE "public"."merge_chunks"("chunk1" regclass, "chunk2" regclass, "concurrently" bool=false)
 AS '$libdir/timescaledb-2.24.0', 'ts_merge_two_chunks'
  LANGUAGE c;

-- ----------------------------
-- Procedure structure for merge_chunks
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."merge_chunks"("chunks" _regclass);
CREATE PROCEDURE "public"."merge_chunks"("chunks" _regclass)
 AS '$libdir/timescaledb-2.24.0', 'ts_merge_chunks'
  LANGUAGE c;

-- ----------------------------
-- Procedure structure for merge_chunks_concurrently
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."merge_chunks_concurrently"("chunks" _regclass);
CREATE PROCEDURE "public"."merge_chunks_concurrently"("chunks" _regclass)
 AS '$libdir/timescaledb-2.24.0', 'ts_merge_chunks_concurrently'
  LANGUAGE c;

-- ----------------------------
-- Function structure for move_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."move_chunk"("chunk" regclass, "destination_tablespace" name, "index_destination_tablespace" name, "reorder_index" regclass, "verbose" bool);
CREATE FUNCTION "public"."move_chunk"("chunk" regclass, "destination_tablespace" name, "index_destination_tablespace" name=NULL::name, "reorder_index" regclass=NULL::regclass, "verbose" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_move_chunk'
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
 AS '$libdir/timescaledb-2.24.0', 'ts_continuous_agg_refresh'
  LANGUAGE c;

-- ----------------------------
-- Procedure structure for remove_columnstore_policy
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."remove_columnstore_policy"("hypertable" regclass, "if_exists" bool);
CREATE PROCEDURE "public"."remove_columnstore_policy"("hypertable" regclass, "if_exists" bool=false)
 AS '$libdir/timescaledb-2.24.0', 'ts_policy_compression_remove'
  LANGUAGE c;

-- ----------------------------
-- Function structure for remove_compression_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_compression_policy"("hypertable" regclass, "if_exists" bool);
CREATE FUNCTION "public"."remove_compression_policy"("hypertable" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."bool" AS '$libdir/timescaledb-2.24.0', 'ts_policy_compression_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for remove_continuous_aggregate_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_continuous_aggregate_policy"("continuous_aggregate" regclass, "if_not_exists" bool, "if_exists" bool);
CREATE FUNCTION "public"."remove_continuous_aggregate_policy"("continuous_aggregate" regclass, "if_not_exists" bool=false, "if_exists" bool=NULL::boolean)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_policy_refresh_cagg_remove'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for remove_process_hypertable_invalidations_policy
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."remove_process_hypertable_invalidations_policy"("hypertable" regclass, "if_exists" bool);
CREATE PROCEDURE "public"."remove_process_hypertable_invalidations_policy"("hypertable" regclass, "if_exists" bool=false)
 AS '$libdir/timescaledb-2.24.0', 'ts_policy_process_hyper_inval_remove'
  LANGUAGE c;

-- ----------------------------
-- Function structure for remove_reorder_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_reorder_policy"("hypertable" regclass, "if_exists" bool);
CREATE FUNCTION "public"."remove_reorder_policy"("hypertable" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_policy_reorder_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for remove_retention_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_retention_policy"("relation" regclass, "if_exists" bool);
CREATE FUNCTION "public"."remove_retention_policy"("relation" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_policy_retention_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for reorder_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."reorder_chunk"("chunk" regclass, "index" regclass, "verbose" bool);
CREATE FUNCTION "public"."reorder_chunk"("chunk" regclass, "index" regclass=NULL::regclass, "verbose" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_reorder_chunk'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for run_job
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."run_job"("job_id" int4);
CREATE PROCEDURE "public"."run_job"("job_id" int4)
 AS '$libdir/timescaledb-2.24.0', 'ts_job_run'
  LANGUAGE c;

-- ----------------------------
-- Function structure for set_adaptive_chunking
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_adaptive_chunking"("hypertable" regclass, "chunk_target_size" text, INOUT "chunk_sizing_func" regproc, OUT "chunk_target_size" int8);
CREATE FUNCTION "public"."set_adaptive_chunking"(IN "hypertable" regclass, IN "chunk_target_size" text, INOUT "chunk_sizing_func" regproc='_timescaledb_functions.calculate_chunk_interval'::regproc, OUT "chunk_target_size" int8)
  RETURNS "pg_catalog"."record" AS '$libdir/timescaledb-2.24.0', 'ts_chunk_adaptive_set'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_chunk_time_interval
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_chunk_time_interval"("hypertable" regclass, "chunk_time_interval" anyelement, "dimension_name" name);
CREATE FUNCTION "public"."set_chunk_time_interval"("hypertable" regclass, "chunk_time_interval" anyelement, "dimension_name" name=NULL::name)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_dimension_set_interval'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_integer_now_func
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_integer_now_func"("hypertable" regclass, "integer_now_func" regproc, "replace_if_exists" bool);
CREATE FUNCTION "public"."set_integer_now_func"("hypertable" regclass, "integer_now_func" regproc, "replace_if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_hypertable_set_integer_now_func'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for set_number_partitions
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_number_partitions"("hypertable" regclass, "number_partitions" int4, "dimension_name" name);
CREATE FUNCTION "public"."set_number_partitions"("hypertable" regclass, "number_partitions" int4, "dimension_name" name=NULL::name)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_dimension_set_num_slices'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_partitioning_interval
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_partitioning_interval"("hypertable" regclass, "partition_interval" anyelement, "dimension_name" name);
CREATE FUNCTION "public"."set_partitioning_interval"("hypertable" regclass, "partition_interval" anyelement, "dimension_name" name=NULL::name)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.24.0', 'ts_dimension_set_interval'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for show_chunks
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."show_chunks"("relation" regclass, "older_than" any, "newer_than" any, "created_before" any, "created_after" any);
CREATE FUNCTION "public"."show_chunks"("relation" regclass, "older_than" any=NULL::unknown, "newer_than" any=NULL::unknown, "created_before" any=NULL::unknown, "created_after" any=NULL::unknown)
  RETURNS SETOF "pg_catalog"."regclass" AS '$libdir/timescaledb-2.24.0', 'ts_chunk_show_chunks'
  LANGUAGE c STABLE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for show_tablespaces
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."show_tablespaces"("hypertable" regclass);
CREATE FUNCTION "public"."show_tablespaces"("hypertable" regclass)
  RETURNS SETOF "pg_catalog"."name" AS '$libdir/timescaledb-2.24.0', 'ts_tablespace_show'
  LANGUAGE c VOLATILE STRICT
  COST 1
  ROWS 1000;

-- ----------------------------
-- Procedure structure for split_chunk
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."split_chunk"("chunk" regclass, "split_at" any);
CREATE PROCEDURE "public"."split_chunk"("chunk" regclass, "split_at" any=NULL::unknown)
 AS '$libdir/timescaledb-2.24.0', 'ts_split_chunk'
  LANGUAGE c;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_timestamptz_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" uuid, "timezone" text, "origin" timestamptz, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" uuid, "timezone" text, "origin" timestamptz=NULL::timestamp with time zone, "offset" interval=NULL::interval)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_uuid_timezone_bucket'
  LANGUAGE c IMMUTABLE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "timezone" text, "origin" timestamptz, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "timezone" text, "origin" timestamptz=NULL::timestamp with time zone, "offset" interval=NULL::interval)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_timestamptz_timezone_bucket'
  LANGUAGE c IMMUTABLE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" uuid, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" uuid, "offset" interval)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_uuid_offset_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date, "offset" interval)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.24.0', 'ts_date_offset_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "offset" interval)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_timestamptz_offset_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "offset" interval);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "offset" interval)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.24.0', 'ts_timestamp_offset_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" uuid, "origin" timestamptz);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" uuid, "origin" timestamptz)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_uuid_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date, "origin" date);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date, "origin" date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.24.0', 'ts_date_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "origin" timestamptz);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "origin" timestamptz)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_timestamptz_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "origin" timestamp);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "origin" timestamp)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.24.0', 'ts_timestamp_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" uuid);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" uuid)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_uuid_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.24.0', 'ts_date_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int2, "ts" int2);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int2, "ts" int2)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.24.0', 'ts_int16_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp);
CREATE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.24.0', 'ts_timestamp_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int8, "ts" int8, "offset" int8);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int8, "ts" int8, "offset" int8)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.24.0', 'ts_int64_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int4, "ts" int4, "offset" int4);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int4, "ts" int4, "offset" int4)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_int32_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int2, "ts" int2, "offset" int2);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int2, "ts" int2, "offset" int2)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.24.0', 'ts_int16_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int8, "ts" int8);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int8, "ts" int8)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.24.0', 'ts_int64_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int4, "ts" int4);
CREATE FUNCTION "public"."time_bucket"("bucket_width" int4, "ts" int4)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_int32_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" date, "start" date, "finish" date);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" date, "start" date=NULL::date, "finish" date=NULL::date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_date_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int8, "ts" int8, "start" int8, "finish" int8);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int8, "ts" int8, "start" int8=NULL::bigint, "finish" int8=NULL::bigint)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_int64_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int4, "ts" int4, "start" int4, "finish" int4);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int4, "ts" int4, "start" int4=NULL::integer, "finish" int4=NULL::integer)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_int32_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int2, "ts" int2, "start" int2, "finish" int2);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int2, "ts" int2, "start" int2=NULL::smallint, "finish" int2=NULL::smallint)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_int16_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "timezone" text, "start" timestamptz, "finish" timestamptz);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "timezone" text, "start" timestamptz=NULL::timestamp with time zone, "finish" timestamptz=NULL::timestamp with time zone)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_timestamptz_timezone_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "start" timestamptz, "finish" timestamptz);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "start" timestamptz=NULL::timestamp with time zone, "finish" timestamptz=NULL::timestamp with time zone)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_timestamptz_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamp, "start" timestamp, "finish" timestamp);
CREATE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamp, "start" timestamp=NULL::timestamp without time zone, "finish" timestamp=NULL::timestamp without time zone)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.24.0', 'ts_gapfill_timestamp_bucket'
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
        RAISE EXCEPTION 'catalog version mismatch, expected "%" seen "%"', '2.24.0', catalog_version;
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
  RETURNS "pg_catalog"."uuid" AS '$libdir/timescaledb-2.24.0', 'ts_uuid_v7_from_timestamptz'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for to_uuidv7_boundary
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."to_uuidv7_boundary"("ts" timestamptz);
CREATE FUNCTION "public"."to_uuidv7_boundary"("ts" timestamptz)
  RETURNS "pg_catalog"."uuid" AS '$libdir/timescaledb-2.24.0', 'ts_uuid_v7_from_timestamptz_boundary'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_timestamp
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_timestamp"("uuid" uuid);
CREATE FUNCTION "public"."uuid_timestamp"("uuid" uuid)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_timestamptz_from_uuid_v7'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_timestamp_micros
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_timestamp_micros"("uuid" uuid);
CREATE FUNCTION "public"."uuid_timestamp_micros"("uuid" uuid)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.24.0', 'ts_timestamptz_from_uuid_v7_with_microseconds'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_version
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_version"("uuid" uuid);
CREATE FUNCTION "public"."uuid_version"("uuid" uuid)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.24.0', 'ts_uuid_version'
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
SELECT setval('"public"."tag_id_seq"', 20, true);

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
SELECT setval('"public"."type_id_seq"', 826, false);

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
SELECT setval('"public"."weather_id_seq"', 1001, true);

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
