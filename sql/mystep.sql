/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : mystep

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 04/07/2025 16:32:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_record
-- ----------------------------
DROP TABLE IF EXISTS `access_record`;
CREATE TABLE `access_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `host` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主机ip',
  `port` int NULL DEFAULT NULL COMMENT '端口',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'url\r\nurl',
  `url_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'url后面的参数',
  `time` bigint NULL DEFAULT NULL COMMENT '访问用时 ms',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问路径',
  `ip_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `cyber_carrier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网络运营商',
  `access_date` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1880536858912317444 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '访问记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of access_record
-- ----------------------------
INSERT INTO `access_record` VALUES (33, 'localhost', 18888, NULL, 'pages=2', 4615, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (34, 'localhost', 18888, NULL, NULL, 60, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (35, 'localhost', 18888, NULL, NULL, 66, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (36, 'localhost', 18888, NULL, NULL, 153, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (37, 'localhost', 18888, NULL, 'pages=2', 4291, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (38, 'localhost', 18888, NULL, NULL, 50, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (39, 'localhost', 18888, NULL, 'pages=1', 2143, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (40, 'localhost', 18888, NULL, 'pages=', 7, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (41, 'localhost', 18888, NULL, NULL, 280, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (42, 'localhost', 18888, NULL, 'pages=', 52, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (43, 'localhost', 18888, NULL, NULL, 49, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (44, 'localhost', 18888, NULL, 'pages=2', 5526, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (45, 'localhost', 18888, NULL, NULL, 40, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (46, 'localhost', 18888, NULL, NULL, 282, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (47, 'localhost', 18888, NULL, NULL, 717, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (48, 'localhost', 18888, NULL, NULL, 290, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (49, 'localhost', 18888, NULL, NULL, 273, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (50, 'localhost', 18888, NULL, NULL, 281, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (51, 'localhost', 18888, NULL, NULL, 282, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (52, 'localhost', 18888, NULL, NULL, 267, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (53, 'localhost', 18888, NULL, NULL, 338, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (54, 'localhost', 18888, NULL, NULL, 251, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (55, 'localhost', 18888, NULL, NULL, 266, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (56, 'localhost', 18888, NULL, NULL, 60, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (57, 'localhost', 18888, NULL, NULL, 541, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (58, 'localhost', 18888, NULL, NULL, 265, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (59, 'localhost', 18888, NULL, NULL, 62, NULL, '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428915163137, 'localhost', 18888, NULL, 'pages=10', 23605, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428915163138, 'localhost', 18888, NULL, NULL, 39, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428915163139, 'localhost', 18888, NULL, NULL, 37, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746050, 'localhost', 18888, NULL, NULL, 37, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746051, 'localhost', 18888, NULL, NULL, 37, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746052, 'localhost', 18888, NULL, NULL, 33, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746053, 'localhost', 18888, NULL, NULL, 35, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746054, 'localhost', 18888, NULL, NULL, 157, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746055, 'localhost', 18888, NULL, NULL, 143, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746056, 'localhost', 18888, NULL, NULL, 43, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746057, 'localhost', 18888, NULL, 'pages=5', 11045, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746058, 'localhost', 18888, NULL, 'pages=3', 7093, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746059, 'localhost', 18888, NULL, NULL, 111, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746060, 'localhost', 18888, NULL, 'pages=3', 7148, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860319428927746061, 'localhost', 18888, NULL, 'pages=2', 5142, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860322410721394689, 'localhost', 18888, NULL, NULL, 164, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1860356383216451586, 'localhost', 18888, NULL, 'pages=10', 20596, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864297352831905793, 'localhost', 18888, NULL, NULL, 298, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864301127747440641, 'localhost', 18888, NULL, NULL, 5, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864301127747440642, 'localhost', 18888, NULL, NULL, 10, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864308677658218497, 'localhost', 18888, NULL, NULL, 206, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864308677658218498, 'localhost', 18888, NULL, NULL, 8, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864308677658218499, 'localhost', 18888, NULL, NULL, 8, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864308677658218500, 'localhost', 18888, NULL, NULL, 8, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864308677658218501, 'localhost', 18888, NULL, NULL, 185, '/step/Login', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864312451374190594, 'localhost', 18888, NULL, NULL, 8, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864312451374190595, 'localhost', 18888, NULL, NULL, 9, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1864312451374190596, 'localhost', 18888, NULL, NULL, 27, '/step/WebBug/killMysql', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1865014580015472641, 'localhost', 18888, NULL, 'pages=1', 10, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1865014580015472642, 'localhost', 18888, NULL, 'pages=1', 7, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1865014580015472643, 'localhost', 18888, NULL, 'pages=1', 357, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1866097967719383041, 'localhost', 18888, NULL, 'pages=1', 612, '/step/WebBug/executeBug', '本机地址', '本机地址', NULL);
INSERT INTO `access_record` VALUES (1873251353472466946, 'localhost', 18888, NULL, 'pages=5', 14, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873251353480855554, 'localhost', 18888, NULL, 'pages=5', 6, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873251353480855555, 'localhost', 18888, NULL, 'pages=5', 451, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873349505315721218, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873349505315721219, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873349505315721220, 'localhost', 18888, NULL, NULL, 5, '/step/Login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873349505315721221, 'localhost', 18888, NULL, NULL, 5, '/step/Login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873349505332498434, 'localhost', 18888, NULL, NULL, 744, '/step/Login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689346, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689347, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689348, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689349, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689350, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689351, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689352, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689353, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689354, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689355, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689356, 'localhost', 18888, NULL, NULL, 101, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689357, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689358, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689359, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689360, 'localhost', 18888, NULL, NULL, 105, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689361, 'localhost', 18888, NULL, NULL, 15, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689362, 'localhost', 18888, NULL, NULL, 240, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689363, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689364, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689365, 'localhost', 18888, NULL, NULL, 156, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873357055813689366, 'localhost', 18888, NULL, NULL, 12, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826295877633, 'localhost', 18888, NULL, NULL, 118, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929538, 'localhost', 18888, NULL, NULL, 145, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929539, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929540, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929541, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929542, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929543, 'localhost', 18888, NULL, NULL, 106, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929544, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929545, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873360826404929546, 'localhost', 18888, NULL, NULL, 11, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873364599860846593, 'localhost', 18888, NULL, NULL, 6, '/step/User/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873364599860846594, 'localhost', 18888, NULL, NULL, 5, '/step/User/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873364599860846595, 'localhost', 18888, NULL, NULL, 158, '/step/User/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873364599860846596, 'localhost', 18888, NULL, 'pages=1', 545, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873364599873429506, 'localhost', 18888, NULL, NULL, 206, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873364599873429507, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873368374570889217, 'localhost', 18888, NULL, 'pages=1', 8, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873368374629609473, 'localhost', 18888, NULL, 'pages=1', 416, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873368374629609474, 'localhost', 18888, NULL, NULL, 5, '/step/WebBug/killMysql', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873368374629609475, 'localhost', 18888, NULL, 'pages=1', 5, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873368374629609476, 'localhost', 18888, NULL, 'pages=1', 107, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695681, '127.0.0.1', 18888, NULL, NULL, 2834, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695682, 'localhost', 18888, NULL, NULL, 239, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695683, 'localhost', 18888, NULL, 'pages=1', 16, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695684, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695685, 'localhost', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695686, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695687, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695688, 'localhost', 18888, NULL, NULL, 110, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695689, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695690, 'localhost', 18888, NULL, NULL, 112, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695691, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695692, 'localhost', 18888, NULL, NULL, 113, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695693, 'localhost', 18888, NULL, NULL, 11, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695694, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695695, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695696, 'localhost', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873372153722695697, 'localhost', 18888, NULL, NULL, 213, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772490235905, '127.0.0.1', 18888, NULL, NULL, 14, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453634, '127.0.0.1', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453635, '127.0.0.1', 18888, NULL, NULL, 16, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453636, '127.0.0.1', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453637, '127.0.0.1', 18888, NULL, NULL, 246, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453638, '127.0.0.1', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453639, '127.0.0.1', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453640, '127.0.0.1', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453641, '127.0.0.1', 18888, NULL, NULL, 956, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453642, '127.0.0.1', 18888, NULL, NULL, 2834, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453643, 'localhost', 18888, NULL, NULL, 239, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453644, 'localhost', 18888, NULL, 'pages=1', 16, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453645, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453646, 'localhost', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453647, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453648, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453649, 'localhost', 18888, NULL, NULL, 110, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453650, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453651, 'localhost', 18888, NULL, NULL, 112, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453652, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453653, 'localhost', 18888, NULL, NULL, 113, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453654, 'localhost', 18888, NULL, NULL, 11, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453655, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453656, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453657, 'localhost', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873730772624453658, 'localhost', 18888, NULL, NULL, 213, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873742086683983874, '127.0.0.1', 18888, NULL, NULL, 33, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873745861922484226, '127.0.0.1', 18888, NULL, NULL, 401, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873745861981204481, '127.0.0.1', 18888, NULL, NULL, 26, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873745861981204482, '127.0.0.1', 18888, NULL, NULL, 133, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873745861989593090, '127.0.0.1', 18888, NULL, NULL, 115, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873745861989593091, '127.0.0.1', 18888, NULL, NULL, 168, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873749636858998785, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873749636858998786, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873749636858998787, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873749636858998788, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873749636858998789, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873749636858998790, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873749636858998791, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873749636858998792, 'localhost', 18888, NULL, NULL, 131, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625409, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625410, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625411, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625412, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625413, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625414, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625415, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625416, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625417, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873753412596625418, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191274471425, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191274471426, 'localhost', 18888, NULL, NULL, 30, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191274471427, '127.0.0.1', 18888, NULL, NULL, 402, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191274471428, '127.0.0.1', 18888, NULL, NULL, 16, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191291248642, '127.0.0.1', 18888, NULL, NULL, 304, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191291248643, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191291248644, 'localhost', 18888, NULL, NULL, 126, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191291248645, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191291248646, 'localhost', 18888, NULL, NULL, 139, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191291248647, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191291248648, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191299637250, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191299637251, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191299637252, 'localhost', 18888, NULL, NULL, 143, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191299637253, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191299637254, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191299637255, 'localhost', 18888, NULL, NULL, 15, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191308025858, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191308025859, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191308025860, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1873757191312220161, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041643225090, '127.0.0.1', 18888, NULL, NULL, 402, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041655808002, '127.0.0.1', 18888, NULL, NULL, 16, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041655808003, '127.0.0.1', 18888, NULL, NULL, 304, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041655808004, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041664196610, 'localhost', 18888, NULL, NULL, 126, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041664196611, 'localhost', 18888, NULL, NULL, 9, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390914, 'localhost', 18888, NULL, NULL, 139, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390915, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390916, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390917, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390918, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390919, 'localhost', 18888, NULL, NULL, 143, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390920, 'localhost', 18888, NULL, NULL, 8, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390921, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390922, 'localhost', 18888, NULL, NULL, 15, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390923, 'localhost', 18888, NULL, NULL, 10, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390924, 'localhost', 18888, NULL, NULL, 5, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390925, 'localhost', 18888, NULL, NULL, 4, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879008041668390926, 'localhost', 18888, NULL, NULL, 6, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879053332685729794, 'localhost', 18888, NULL, NULL, 12, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879053332694118401, 'localhost', 18888, NULL, NULL, 810, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879057107014070273, 'localhost', 18888, NULL, 'pages=3', 25, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879057107014070274, 'localhost', 18888, NULL, NULL, 49, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879177905238372353, 'localhost', 18888, NULL, NULL, 752, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879177905238372354, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879177905238372355, 'localhost', 18888, NULL, NULL, 193, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879177905250955265, 'localhost', 18888, NULL, NULL, 19, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879181679235362817, 'localhost', 18888, NULL, NULL, 134, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879181679243751426, 'localhost', 18888, NULL, NULL, 156, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879181679243751427, '127.0.0.1', 18888, NULL, NULL, 265, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879181679243751428, 'localhost', 18888, NULL, NULL, 141, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879181679243751429, 'localhost', 18888, NULL, NULL, 196, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879181679243751430, 'localhost', 18888, NULL, NULL, 173, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259074, 'localhost', 18888, NULL, 'pages=3', 6, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259075, 'localhost', 18888, NULL, 'pages=3', 4, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259076, 'localhost', 18888, NULL, '3', 7, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259077, 'localhost', 18888, NULL, NULL, 14, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259078, 'localhost', 18888, NULL, NULL, 139, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259079, 'localhost', 18888, NULL, NULL, 186, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259080, 'localhost', 18888, NULL, NULL, 124, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259081, 'localhost', 18888, NULL, NULL, 116, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259082, 'localhost', 18888, NULL, NULL, 144, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879185455216259083, 'localhost', 18888, NULL, NULL, 175, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189232988123137, 'localhost', 18888, NULL, 'pages=3', 7, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843394, 'localhost', 18888, NULL, NULL, 155, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843395, 'localhost', 18888, NULL, 'pages=3', 355, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843396, 'localhost', 18888, NULL, 'pages=3', 17, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843397, 'localhost', 18888, NULL, NULL, 123, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843398, 'localhost', 18888, NULL, NULL, 114, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843399, 'localhost', 18888, NULL, NULL, 125, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843400, 'localhost', 18888, NULL, NULL, 166, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843401, 'localhost', 18888, NULL, NULL, 892, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233046843402, 'localhost', 18888, NULL, 'pages=3', 9, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233105563649, 'localhost', 18888, NULL, 'pages=3', 5, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233105563650, 'localhost', 18888, NULL, 'pages=3', 4, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233105563651, 'localhost', 18888, NULL, 'pages=3', 17, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879189233105563652, 'localhost', 18888, NULL, NULL, 283, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007039700994, 'localhost', 18888, NULL, NULL, 124, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007039700995, 'localhost', 18888, NULL, NULL, 392, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007039700996, 'localhost', 18888, NULL, NULL, 155, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007039700997, 'localhost', 18888, NULL, NULL, 240, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007039700998, 'localhost', 18888, NULL, 'pages=3', 6967, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007048089602, 'localhost', 18888, NULL, 'pages=3', 6131, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007048089603, 'localhost', 18888, NULL, 'pages=3', 5885, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007048089604, 'localhost', 18888, NULL, 'pages=3', 6264, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007048089605, 'localhost', 18888, NULL, 'pages=3', 6335, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007048089606, 'localhost', 18888, NULL, 'pages=3', 13154, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007048089607, 'localhost', 18888, NULL, 'pages=3', 7297, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007060672513, 'localhost', 18888, NULL, 'pages=3', 6469, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007060672514, 'localhost', 18888, NULL, 'pages=3', 8, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879193007060672515, 'localhost', 18888, NULL, NULL, 323, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779782504449, 'localhost', 18888, NULL, NULL, 127, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779782504450, 'localhost', 18888, NULL, NULL, 176, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779782504451, 'localhost', 18888, NULL, 'pages=3', 6050, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779790893057, 'localhost', 18888, NULL, NULL, 127, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779790893058, 'localhost', 18888, NULL, NULL, 262, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779790893059, 'localhost', 18888, NULL, 'pages=3', 6697, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779795087361, 'localhost', 18888, NULL, 'pages=1', 2132, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779795087362, 'localhost', 18888, NULL, 'pages=3', 6733, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879196779795087363, 'localhost', 18888, NULL, NULL, 136, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963970, 'localhost', 18888, NULL, NULL, 202, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963971, 'localhost', 18888, NULL, 'pages=1', 2226, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963972, 'localhost', 18888, NULL, 'pages=1', 2474, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963973, 'localhost', 18888, NULL, 'pages=1', 2259, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963974, 'localhost', 18888, NULL, NULL, 408, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963975, 'localhost', 18888, NULL, 'pages=1', 2145, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963976, 'localhost', 18888, NULL, NULL, 507, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963977, 'localhost', 18888, NULL, 'pages=1', 2468, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963978, 'localhost', 18888, NULL, NULL, 548, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963979, 'localhost', 18888, NULL, 'pages=1', 2394, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963980, 'localhost', 18888, NULL, 'pages=1', 2052, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963981, 'localhost', 18888, NULL, 'pages=1', 2243, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879200556442963982, 'localhost', 18888, NULL, NULL, 124, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879336447912169474, 'localhost', 18888, NULL, 'pages=2', 4251, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879336447912169475, 'localhost', 18888, NULL, NULL, 234, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879770560955604994, 'localhost', 18888, NULL, NULL, 694, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879774333690109953, 'localhost', 18888, NULL, 'pages=1', 2180, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879774333690109954, 'localhost', 18888, NULL, 'pages=1', 2063, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879774333690109955, 'localhost', 18888, NULL, 'pages=3', 7370, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879774333690109956, 'localhost', 18888, NULL, NULL, 458, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879778109612290049, 'localhost', 18888, NULL, 'pages=1', 3166, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879778109612290050, 'localhost', 18888, NULL, 'pages=1', 3513, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879778109612290051, 'localhost', 18888, NULL, 'pages=1', 2701, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879778109612290052, 'localhost', 18888, NULL, 'pages=1', 2556, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879778109612290053, 'localhost', 18888, NULL, 'pages=1', 2388, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907265, 'localhost', 18888, NULL, 'pages=1', 11833, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907266, 'localhost', 18888, NULL, 'pages=1', 2570, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907267, 'localhost', 18888, NULL, NULL, 298, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907268, 'localhost', 18888, NULL, NULL, 137, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907269, 'localhost', 18888, NULL, NULL, 434, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907270, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907271, 'localhost', 18888, NULL, NULL, 29, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907272, 'localhost', 18888, NULL, 'pages=', 168, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907273, 'localhost', 18888, NULL, 'pages=1', 2252, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907274, 'localhost', 18888, NULL, 'pages=1', 2302, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907275, 'localhost', 18888, NULL, 'pages=1', 2472, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907276, 'localhost', 18888, NULL, 'pages=', 29, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907277, 'localhost', 18888, NULL, 'pages=1', 3353, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907278, 'localhost', 18888, NULL, 'pages=1', 2202, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1879782088928907279, 'localhost', 18888, NULL, NULL, 392, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378011521025, 'localhost', 18888, NULL, 'pages=1', 2184, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378011521026, 'localhost', 18888, NULL, 'pages=1', 2127, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378011521027, 'localhost', 18888, NULL, 'pages=1', 2065, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378011521028, 'localhost', 18888, NULL, 'pages=1', 1103, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378011521029, 'localhost', 18888, NULL, 'pages=1', 3631, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909634, 'localhost', 18888, NULL, 'pages=1', 1100, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909635, 'localhost', 18888, NULL, 'pages=1', 2172, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909636, 'localhost', 18888, NULL, 'pages=1', 1702, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909637, 'localhost', 18888, NULL, 'pages=1', 2176, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909638, 'localhost', 18888, NULL, 'pages=1', 5584, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909639, 'localhost', 18888, NULL, NULL, 443, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909640, 'localhost', 18888, NULL, 'pages=1', 11, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909641, 'localhost', 18888, NULL, 'pages=1', 676, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909642, 'localhost', 18888, NULL, NULL, 298, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909643, 'localhost', 18888, NULL, NULL, 137, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378019909644, 'localhost', 18888, NULL, NULL, 434, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378028298241, 'localhost', 18888, NULL, NULL, 7, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378028298242, 'localhost', 18888, NULL, NULL, 29, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378028298243, 'localhost', 18888, NULL, 'pages=', 168, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378032492545, 'localhost', 18888, NULL, 'pages=1', 2252, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378032492546, 'localhost', 18888, NULL, 'pages=1', 2302, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378032492547, 'localhost', 18888, NULL, 'pages=1', 2472, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378032492548, 'localhost', 18888, NULL, 'pages=', 29, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378032492549, 'localhost', 18888, NULL, 'pages=1', 3353, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378032492550, 'localhost', 18888, NULL, 'pages=1', 2202, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880159378032492551, 'localhost', 18888, NULL, NULL, 392, '/step/login', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880163146711150594, 'localhost', 18888, NULL, 'pages=1', 6454, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880163146711150595, 'localhost', 18888, NULL, 'pages=1', 2802, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880163146727927810, 'localhost', 18888, NULL, 'pages=1', 2531, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880163146727927811, 'localhost', 18888, NULL, 'pages=1', 1419, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880163146727927812, 'localhost', 18888, NULL, 'pages=1', 1489, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880166921060405249, 'localhost', 18888, NULL, 'pages=1', 6731, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880166921060405250, 'localhost', 18888, NULL, 'pages=1', 329, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880166921060405251, 'localhost', 18888, NULL, 'pages=1', 2129, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880166921060405252, 'localhost', 18888, NULL, 'pages=1', 6459, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880170694608605185, 'localhost', 18888, NULL, 'pages=1', 2721, '/step/WebBug/executeBug', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880174471822651394, 'localhost', 18888, NULL, NULL, 3222, '/step/WebBug/killMysql', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880174471910731777, 'localhost', 18888, NULL, NULL, 11, '/step/WebBug/killMysql', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880174471910731778, 'localhost', 18888, NULL, NULL, 125, '/step/WebBug/killMysql', '未知', '未知', NULL);
INSERT INTO `access_record` VALUES (1880514211092500482, 'localhost', 18888, NULL, NULL, 212, '/step/login', '未知', '未知', '2025-01-18 15:06:34');
INSERT INTO `access_record` VALUES (1880514211092500483, 'localhost', 18888, NULL, NULL, 1385, '/step/login', '未知', '未知', '2025-01-18 15:06:09');
INSERT INTO `access_record` VALUES (1880525533695938562, 'localhost', 18888, NULL, NULL, 160, '/step/register', '未知', '未知', '2025-01-18 15:53:48');
INSERT INTO `access_record` VALUES (1880533086089744386, 'localhost', 18888, NULL, NULL, 91, '/step/login', '未知', '未知', '2025-01-18 16:28:37');
INSERT INTO `access_record` VALUES (1880533086102327298, 'localhost', 18888, NULL, NULL, 180, '/step/login', '未知', '未知', '2025-01-18 16:28:29');
INSERT INTO `access_record` VALUES (1880533086102327299, 'localhost', 18888, NULL, NULL, 44, '/step/register', '未知', '未知', '2025-01-18 16:28:10');
INSERT INTO `access_record` VALUES (1880533086102327300, 'localhost', 18888, NULL, NULL, 45, '/step/register', '未知', '未知', '2025-01-18 16:27:15');
INSERT INTO `access_record` VALUES (1880533086106521601, 'localhost', 18888, NULL, NULL, 37, '/step/register', '未知', '未知', '2025-01-18 16:26:58');
INSERT INTO `access_record` VALUES (1880533086106521602, 'localhost', 18888, NULL, NULL, 35, '/step/register', '未知', '未知', '2025-01-18 16:26:39');
INSERT INTO `access_record` VALUES (1880533086106521603, 'localhost', 18888, NULL, NULL, 14, '/step/register', '未知', '未知', '2025-01-18 16:26:20');
INSERT INTO `access_record` VALUES (1880533086106521604, 'localhost', 18888, NULL, NULL, 45, '/step/register', '未知', '未知', '2025-01-18 16:26:13');
INSERT INTO `access_record` VALUES (1880533086114910209, 'localhost', 18888, NULL, NULL, 228, '/step/register', '未知', '未知', '2025-01-18 16:24:02');
INSERT INTO `access_record` VALUES (1880533086114910210, 'localhost', 18888, NULL, NULL, 10397, '/step/register', '未知', '未知', '2025-01-18 16:15:50');
INSERT INTO `access_record` VALUES (1880536858912317442, 'localhost', 18888, NULL, NULL, 218, '/step/login', '未知', '未知', '2025-01-18 16:30:58');
INSERT INTO `access_record` VALUES (1880536858912317443, 'localhost', 18888, NULL, NULL, 308, '/step/register', '未知', '未知', '2025-01-18 16:30:49');

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `money` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'fox', 30, '2024-08-07 22:53:01', '2024-11-10 17:10:07');

-- ----------------------------
-- Table structure for baidu_question
-- ----------------------------
DROP TABLE IF EXISTS `baidu_question`;
CREATE TABLE `baidu_question`  (
  `id` bigint NOT NULL,
  `question_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '脑残问题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '百度脑残吧帖子标题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of baidu_question
-- ----------------------------
INSERT INTO `baidu_question` VALUES (-2116167506, '男的已经是男的了为啥还要考公？');
INSERT INTO `baidu_question` VALUES (-2087491212, '为什么达尔文奖都没获奖感言？');
INSERT INTO `baidu_question` VALUES (-2086712752, '关闭深色模式了为什么还是黑的？');
INSERT INTO `baidu_question` VALUES (-2052525652, '梦里我们都扮演着主角对吗？');
INSERT INTO `baidu_question` VALUES (-2050461412, '我爸妈在我出生的时候是怎么知道我未来的名字的？');
INSERT INTO `baidu_question` VALUES (-2037803623, '怎么办啊？？？');
INSERT INTO `baidu_question` VALUES (-2030188501, '短暂的相遇是奖励还是惩罚？');
INSERT INTO `baidu_question` VALUES (-2018420295, '这个洞这么小，是怎么把树套进去的啊？');
INSERT INTO `baidu_question` VALUES (-1990686046, '找小姐时如果发现她不小，可以起诉她虚假宣传吗？');
INSERT INTO `baidu_question` VALUES (-1976806522, '用劳动换取财产，根据智力水平平等分配的小偷为什么会被厌恶？');
INSERT INTO `baidu_question` VALUES (-1959231813, '为什么世界要以一种因为物理的法则运转？');
INSERT INTO `baidu_question` VALUES (-1946032776, '人生如此？');
INSERT INTO `baidu_question` VALUES (-1937070190, '村干部不为人民做该做的事，看不起人，如何投诉？');
INSERT INTO `baidu_question` VALUES (-1856049810, '凭什么商鞅吧没有五个？');
INSERT INTO `baidu_question` VALUES (-1848859578, '现在年轻人的出路是什么？');
INSERT INTO `baidu_question` VALUES (-1840561762, '喷香水是为了让别人鼻子闻到，那为什么不直接给别人鼻子喷香水呢？');
INSERT INTO `baidu_question` VALUES (-1838519445, '单选题是只能选一个的题还是只能选一个的题？');
INSERT INTO `baidu_question` VALUES (-1833574634, '我的头怎么尖尖的？');
INSERT INTO `baidu_question` VALUES (-1802250096, '为什么时钟的指针是顺时针转的？');
INSERT INTO `baidu_question` VALUES (-1800621270, '有没有大佬帮我看看我这个为啥开不了机？');
INSERT INTO `baidu_question` VALUES (-1774334065, '是我们创造了世界，还是世界创造了我们？');
INSERT INTO `baidu_question` VALUES (-1771372160, '既然是先有蛋，后有鸡，那么没有鸡之前人类是怎么繁衍的呢？');
INSERT INTO `baidu_question` VALUES (-1747309254, '苏轼为什么没能考上研究生？');
INSERT INTO `baidu_question` VALUES (-1680471182, '男生雌激素分泌过多会长奶子，那女的雄性激素分泌过多会长牛牛嚒？');
INSERT INTO `baidu_question` VALUES (-1671279654, '罚款-150元是什么意思？');
INSERT INTO `baidu_question` VALUES (-1649917980, '油箱还长个了？');
INSERT INTO `baidu_question` VALUES (-1647438292, '爱有离合，那有离婚市场吗？');
INSERT INTO `baidu_question` VALUES (-1609082755, '猫娘会感染猫瘟吗？');
INSERT INTO `baidu_question` VALUES (-1573908568, '既然未来没有来，那为什么还叫未来呢？');
INSERT INTO `baidu_question` VALUES (-1548543443, '这是抄袭弱智吧的吗？');
INSERT INTO `baidu_question` VALUES (-1548179489, '喝零度的水可以尿出37度的尿，人类的本质就是一个热水器吗？');
INSERT INTO `baidu_question` VALUES (-1508428770, '洋抖没了，会不会有趁机混入贴吧的老外？');
INSERT INTO `baidu_question` VALUES (-1500192444, '考试写个解得一分，那为什么不写六十个解呢？');
INSERT INTO `baidu_question` VALUES (-1460487177, '鱼如果身上痒了该怎么办？');
INSERT INTO `baidu_question` VALUES (-1442288569, '如果我抓到人鱼公主，我只吃人鱼鱼的部分，那我算吃人吗？');
INSERT INTO `baidu_question` VALUES (-1442243259, '为什么新闻只报道名人去世，而不报道名人出生？');
INSERT INTO `baidu_question` VALUES (-1441711433, '福瑞去动物园是不是就和正常人去妓院一样？');
INSERT INTO `baidu_question` VALUES (-1432422358, '既然海拔越高沸点越低，那么马里亚纳海沟的水要多少度才能烧开？');
INSERT INTO `baidu_question` VALUES (-1431324951, '人死后会变成星星，那商鞅死后会不会变成麦克阿瑟？');
INSERT INTO `baidu_question` VALUES (-1426443247, '你只准备了5个领导，但是来了一亿杯水，你会怎么做？');
INSERT INTO `baidu_question` VALUES (-1416528507, '如果蝙蝠吸动物血为生，那蝙蝠侠吸什么血为生？');
INSERT INTO `baidu_question` VALUES (-1389010067, '为什么电视剧和电影可以播杀人镜头，却不能播造人镜头？');
INSERT INTO `baidu_question` VALUES (-1336253573, '香港的币叫港币，朝鲜和日本的币叫什么？');
INSERT INTO `baidu_question` VALUES (-1303467215, '有人四海为家，那鱼儿住哪里？');
INSERT INTO `baidu_question` VALUES (-1285412759, '这鱼怎么不吃东西？');
INSERT INTO `baidu_question` VALUES (-1279363934, '在傻子眼里，其他人是不是都是傻子？');
INSERT INTO `baidu_question` VALUES (-1266494999, '罪该万死的人自杀了是上天堂还是下地狱？');
INSERT INTO `baidu_question` VALUES (-1259037946, '如果我被一个笑话笑死了，那编这个笑话的人会被判刑吗？');
INSERT INTO `baidu_question` VALUES (-1251864275, '一个人要怎么证明他在睡觉？');
INSERT INTO `baidu_question` VALUES (-1187514626, '为什么不在高速服务区开个酒吧？');
INSERT INTO `baidu_question` VALUES (-1180892789, '我们是拥抱世界，还是只拥抱世界的美好？');
INSERT INTO `baidu_question` VALUES (-1180752681, '捧臭脚是不是近几年衍生出了新的意思？');
INSERT INTO `baidu_question` VALUES (-1176891305, '为什么我喜欢女生，但我的男朋友却不喜欢？');
INSERT INTO `baidu_question` VALUES (-1157942311, '仿生学能不能研究一下，让牙膏模仿大便，挤一截自动挤断？');
INSERT INTO `baidu_question` VALUES (-1147655003, '有人拿可乐洗厕所，为什么没人拿洁厕灵当饮料？');
INSERT INTO `baidu_question` VALUES (-1128588207, '皇上降旨赐死，那我已读不回不就行了吗？');
INSERT INTO `baidu_question` VALUES (-1098741680, '人不能在水下呼吸，那我把水杯放头上为什么能呼吸？');
INSERT INTO `baidu_question` VALUES (-1096605791, '突然想到，亲子盖饭算不算是骨肉相连呢？');
INSERT INTO `baidu_question` VALUES (-1045106135, '匡衡凿壁偷光，邻居家会不会小孔成像到自己家里？');
INSERT INTO `baidu_question` VALUES (-1044493406, '喜欢除了人之外的异性动物还算异性恋吗？');
INSERT INTO `baidu_question` VALUES (-1035752985, '小明20岁失忆了，那现在的小明还是原来的小明吗？');
INSERT INTO `baidu_question` VALUES (-1003046662, '为什么猫咪零食不用老鼠肉？');
INSERT INTO `baidu_question` VALUES (-989593189, '弱智吧是什么人创建的？');
INSERT INTO `baidu_question` VALUES (-984756691, '每年春节车票这么难抢，大家为什么不开车回去？');
INSERT INTO `baidu_question` VALUES (-977821966, '路遥知马力，路遥是商鞅吗？');
INSERT INTO `baidu_question` VALUES (-975484159, '设计这个挂钩的人是咋想的？');
INSERT INTO `baidu_question` VALUES (-963424304, '湿兴大发，可否有病友来吟诗作对？');
INSERT INTO `baidu_question` VALUES (-951333478, '鱼在空气中乱蹦算有氧运动算无氧运动？');
INSERT INTO `baidu_question` VALUES (-926428700, '我被暴雨淋感冒了，算不算攻击物是水滴💧？');
INSERT INTO `baidu_question` VALUES (-857545496, '鱼身体里那么多刺，会痛吗？');
INSERT INTO `baidu_question` VALUES (-855498832, '人的颈椎能承受自身重量吗？');
INSERT INTO `baidu_question` VALUES (-851245880, '看见陌生的爷爷可以喊大爷，那看见陌生的奶奶喊什么？');
INSERT INTO `baidu_question` VALUES (-845925426, '下围棋被窥屏了怎么办？');
INSERT INTO `baidu_question` VALUES (-813825758, '机器人就业前景这么广阔，我们为什么不去当机器人？');
INSERT INTO `baidu_question` VALUES (-768331584, '你有五个杯子、来了五个领导，但是本吧持续禁水中，你该怎么办？');
INSERT INTO `baidu_question` VALUES (-761686442, '取消是什么性别？');
INSERT INTO `baidu_question` VALUES (-757847131, '我们是正在活着还是正在死去？');
INSERT INTO `baidu_question` VALUES (-715389869, '没有意义会有意义吗？');
INSERT INTO `baidu_question` VALUES (-712696548, '给汽车加燃油宝算是给汽车喂健身胃消食片吗？');
INSERT INTO `baidu_question` VALUES (-666163720, '孩子的生日是母亲的苦难日 ，那母亲的生日是孩子的什么日？');
INSERT INTO `baidu_question` VALUES (-657462623, '帝都是北京，魔都是上海，那么成都是哪里？');
INSERT INTO `baidu_question` VALUES (-657159001, '被人推荐来弱智吧学中文，我来了，有人教我吗？');
INSERT INTO `baidu_question` VALUES (-642626907, '问，小红去寺庙烧香时心脏病猝发后原地起立，什么原理？');
INSERT INTO `baidu_question` VALUES (-621789860, '西红柿炒番茄要不要放鸡蛋？');
INSERT INTO `baidu_question` VALUES (-610188384, '？？？？？？');
INSERT INTO `baidu_question` VALUES (-536486497, '孙膑已经在水下憋了半个小时，为什么没人救他？');
INSERT INTO `baidu_question` VALUES (-535480594, '我只要把脑袋的洞都堵上，是不是就不会脑子进水了？');
INSERT INTO `baidu_question` VALUES (-528798881, 'exp(t)关于e求导结果是texp(t-1)还是xp(t)？');
INSERT INTO `baidu_question` VALUES (-527373533, '夸父的反义词是不是骂娘？');
INSERT INTO `baidu_question` VALUES (-517632616, '遇到劫匪抢劫，但是忘了支付宝密码怎么办？');
INSERT INTO `baidu_question` VALUES (-499100574, '天平比较两罐气体，两边放砝码平衡罐的重量，但怎样平衡砝码本身？');
INSERT INTO `baidu_question` VALUES (-486602449, '怎么证明火影不存在？');
INSERT INTO `baidu_question` VALUES (-463761244, '如果我现在成了傻子，是不是以后都不用傻了？');
INSERT INTO `baidu_question` VALUES (-430952271, '大佬们帮我看看这是什么型号的CPU，值钱吗？');
INSERT INTO `baidu_question` VALUES (-414448373, '朋友欠饭钱不给怎么办？');
INSERT INTO `baidu_question` VALUES (-370255875, '鼻屎天天在鼻子里待着，为什么闻不到它的味道🤔？');
INSERT INTO `baidu_question` VALUES (-362750495, '他说爱我，她说爱我，谁爱我？');
INSERT INTO `baidu_question` VALUES (-310968380, '天上以前有九个太阳的时候，向日葵到底往哪边看呢？');
INSERT INTO `baidu_question` VALUES (-309884714, '我吃了狗拉的屎后拉出来的屎还是狗屎吗？');
INSERT INTO `baidu_question` VALUES (-296637152, '蓝牙耳机坏了，去医院挂牙科还是耳科？');
INSERT INTO `baidu_question` VALUES (-263700203, '宋江在浔阳楼题反诗时抄袭施耐庵，他不会感到羞愧吗？');
INSERT INTO `baidu_question` VALUES (-254432995, '公务舱是不是只有公务员能坐？');
INSERT INTO `baidu_question` VALUES (-229803684, '美国人辛辛苦苦创办了感恩节，印第安人为什么不领情？');
INSERT INTO `baidu_question` VALUES (-226903613, '红灯区是不是无人区？');
INSERT INTO `baidu_question` VALUES (-210172812, '为什么没有耐青蛙的蝗虫？');
INSERT INTO `baidu_question` VALUES (-204254025, '一闻到屎就想吐是不是怀了啊？');
INSERT INTO `baidu_question` VALUES (-201282997, '这种图可以进疗养院吗？');
INSERT INTO `baidu_question` VALUES (-182528129, '为什么人要认字，而不是字来认人呢？');
INSERT INTO `baidu_question` VALUES (-148779957, '象姑馆算是传统零售（受）行业吗？');
INSERT INTO `baidu_question` VALUES (-135058738, '公寓失火，别人家的狗和你的孩子先救哪个？');
INSERT INTO `baidu_question` VALUES (-109854203, '刚吃了点蒜后去老板办公室居然被赶了出来，我老板是不是吸血鬼啊？');
INSERT INTO `baidu_question` VALUES (-103250064, '变形金刚地球上变车有地球人开，赛博坦上变车谁来开？');
INSERT INTO `baidu_question` VALUES (-97373144, '为什么老师不会发今年的期末真题来训练？');
INSERT INTO `baidu_question` VALUES (-82900375, '不是说现在很难找工作？为什么我去几个单位问了一圈大家都有工作？');
INSERT INTO `baidu_question` VALUES (-69491575, '挖耳屎太舒服了，有什么办法让耳屎长得快一点？');
INSERT INTO `baidu_question` VALUES (-68254386, '我的手机为什么不会飞？');
INSERT INTO `baidu_question` VALUES (-68227637, '书中自有黄金屋，那为什么还有人租房啊？');
INSERT INTO `baidu_question` VALUES (-24603797, '孟婆汤是如何通过血脑屏障的？');
INSERT INTO `baidu_question` VALUES (-10454839, '老师拖堂为什么不给我加班费？');
INSERT INTO `baidu_question` VALUES (-4616556, '为什么人产的牛奶会有鱼腥味？');
INSERT INTO `baidu_question` VALUES (65311, '？');
INSERT INTO `baidu_question` VALUES (4907158, '女生喜欢你会说讨厌你，那女生跟你说喜欢你是不是讨厌你的意思？');
INSERT INTO `baidu_question` VALUES (12961468, '你只有四个杯子，但是五个领导同时掉进水里，你先救哪个？');
INSERT INTO `baidu_question` VALUES (39584513, '1万亿存银行每天都有6000万利息，这不是最简单的赚钱方法吗？');
INSERT INTO `baidu_question` VALUES (60941385, '为什么小红书没有人去教老外网购能仅退款？');
INSERT INTO `baidu_question` VALUES (67976983, '为什么大家都喜欢杜甫的肚子，说杜甫肚子美？');
INSERT INTO `baidu_question` VALUES (91970960, '明明早八是8:00，为什么我4:00睡觉7:99起床还是很困？');
INSERT INTO `baidu_question` VALUES (105852245, '我喊内耗的人生的孩子叫内耗子为啥他爸妈要揍我？');
INSERT INTO `baidu_question` VALUES (108051680, '人们习惯将【毛里求斯】简称为【毛求】，那【基里巴斯】简称什么？');
INSERT INTO `baidu_question` VALUES (109430687, '我已经到了，你人呢？');
INSERT INTO `baidu_question` VALUES (116080095, '多人格的人谈多个对象算出轨吗？');
INSERT INTO `baidu_question` VALUES (132075466, '为什么地球就喜欢围着太阳转？');
INSERT INTO `baidu_question` VALUES (182642934, '你们会养石头吗？');
INSERT INTO `baidu_question` VALUES (189725367, '戴表的左手总是隐隐发疼，是被表勒太紧了，还是被时间勒太紧了？');
INSERT INTO `baidu_question` VALUES (207537219, '2500元，自己暑假工剩的，我想用这些改变自己，该怎么用？');
INSERT INTO `baidu_question` VALUES (257557568, '我想到一个发财的路子，广告里能不能植入广告？');
INSERT INTO `baidu_question` VALUES (266553669, '种地需要矿物质。那为什么不直接浇矿泉水？');
INSERT INTO `baidu_question` VALUES (294802651, '希腊奶是啥意思啊，各位8u？');
INSERT INTO `baidu_question` VALUES (330227539, '尿液是无菌的，怎么不在尿里做手术？');
INSERT INTO `baidu_question` VALUES (332364322, '物质世界里的运动是绝对的，那不就说明世界是一个巨大的yd机吗？');
INSERT INTO `baidu_question` VALUES (334382651, '光之国的人见过猪吗？');
INSERT INTO `baidu_question` VALUES (376708709, '小明压力太大连续喝酒死了，那杀死小明是酒精还是过去？');
INSERT INTO `baidu_question` VALUES (409234175, '同样是十三个小时，朝九晚五大家觉得正常，朝五晚九却不行？');
INSERT INTO `baidu_question` VALUES (486521476, '九五是至尊，为啥八五是弱智呢？');
INSERT INTO `baidu_question` VALUES (503251676, '到底谁是正常人，谁是sjb？');
INSERT INTO `baidu_question` VALUES (504762147, '秦始皇陵建的这么复杂，秦始皇怎么出来？');
INSERT INTO `baidu_question` VALUES (514912874, '牙科是内科还是外科？');
INSERT INTO `baidu_question` VALUES (580586310, '炼的神经网络有问题，能去神经病院挂号吗？');
INSERT INTO `baidu_question` VALUES (588128897, '全是脏话的英语是美国西海岸英语，那汉语呢？');
INSERT INTO `baidu_question` VALUES (598485306, '我即不是小孩又没到大人，是不是叫小人？');
INSERT INTO `baidu_question` VALUES (611729440, '大家天天用洗衣粉洗衣服，为什么不说用什么东西洗洗衣粉？');
INSERT INTO `baidu_question` VALUES (719609720, '逗人笑的叫小丑，惹人嫌的是不是叫小美？');
INSERT INTO `baidu_question` VALUES (737604655, '悲困之人，谁能共识？');
INSERT INTO `baidu_question` VALUES (744805004, '有没有会盲文的摸一下什么意思？');
INSERT INTO `baidu_question` VALUES (769590157, '敌人的敌人就是朋友，那朋友的朋友是不是就是敌人？');
INSERT INTO `baidu_question` VALUES (784621577, '古代小说中治病用的无根水要去哪里找？');
INSERT INTO `baidu_question` VALUES (799178558, '饭卡是啥游戏？');
INSERT INTO `baidu_question` VALUES (850796173, '我国这么多先进武器，台湾为什么不向大陆购买军火？');
INSERT INTO `baidu_question` VALUES (867123803, '为什么消极是向下的，而积极是向上的？');
INSERT INTO `baidu_question` VALUES (920245212, '细思极恐，我女友说我不成熟，她难道想吃我？');
INSERT INTO `baidu_question` VALUES (923160728, '零添加酱油，一点酱油没有那还是酱油吗？');
INSERT INTO `baidu_question` VALUES (927413145, '为什么全国大部分城市要站着？');
INSERT INTO `baidu_question` VALUES (941761573, '蟹黄是公蟹的镜子，那么魅魔会拿蟹黄当应急食品吗？');
INSERT INTO `baidu_question` VALUES (962897952, '第1个喝酒的人，他为什么喜欢那个度数？');
INSERT INTO `baidu_question` VALUES (977842219, '程序员算不算赛博德鲁伊？');
INSERT INTO `baidu_question` VALUES (1045839100, '神经元等于多少美元？');
INSERT INTO `baidu_question` VALUES (1059511278, '为什么赚人民币最多的不是人民？');
INSERT INTO `baidu_question` VALUES (1065134997, '跑步到底是减肥还是增肥？');
INSERT INTO `baidu_question` VALUES (1092157923, '我的旺仔牛奶为什么没有旺仔？');
INSERT INTO `baidu_question` VALUES (1118354323, '我们究竟活着的还是死亡的？');
INSERT INTO `baidu_question` VALUES (1120481936, '为什么吧务把2026年后的帖子都删了？');
INSERT INTO `baidu_question` VALUES (1143403728, '自己过的苦找比自己过的差人去安慰自己，算不算是掩耳盗铃？');
INSERT INTO `baidu_question` VALUES (1145838491, '躺下感觉背上好痒发现是充电线的口子电到我了，我这是对电过敏吗？');
INSERT INTO `baidu_question` VALUES (1150942666, '是不是不举的法国人，才是真正的雄起？');
INSERT INTO `baidu_question` VALUES (1200843195, '为什么装了显卡还是卡？');
INSERT INTO `baidu_question` VALUES (1203297811, '问:是读银行还是读银行？');
INSERT INTO `baidu_question` VALUES (1225376287, '孕妇打我算群殴吗？');
INSERT INTO `baidu_question` VALUES (1233795863, '西瓜这么好吃，为什么不做成西瓜干呢？');
INSERT INTO `baidu_question` VALUES (1264091363, '半夜是晚上十二点，那全夜是几点？');
INSERT INTO `baidu_question` VALUES (1276367594, '睡觉到底是活的更久还是活的更短？');
INSERT INTO `baidu_question` VALUES (1295012349, '欠了一屁股债为什么不能用屁股还？');
INSERT INTO `baidu_question` VALUES (1307146790, '我家遥控器放哪了？');
INSERT INTO `baidu_question` VALUES (1327148278, '落后就要挨打那我主动打别人是不是就领先了？');
INSERT INTO `baidu_question` VALUES (1332239687, '人棍的母亲可以叫棍母吗？');
INSERT INTO `baidu_question` VALUES (1394730100, '世界上是先有生物还是非生物？');
INSERT INTO `baidu_question` VALUES (1399494000, '文学家死后会成为天文学家吗？');
INSERT INTO `baidu_question` VALUES (1408031283, '过年庆祝什么？');
INSERT INTO `baidu_question` VALUES (1412990339, '非洲的死神不应该是农场主吗？为什么会是阿努比斯？');
INSERT INTO `baidu_question` VALUES (1452013089, '我有个问题搞不明白，为什么人类需要繁衍？');
INSERT INTO `baidu_question` VALUES (1469959919, '人会创造一个完全没有意义的詞吗？');
INSERT INTO `baidu_question` VALUES (1475998510, '既然叫直肠，为什么直的人反而用不了？');
INSERT INTO `baidu_question` VALUES (1482395263, '十年如一日是活了十年还是活了一日？');
INSERT INTO `baidu_question` VALUES (1485299982, '语文考试最后一道写作题读作什么？');
INSERT INTO `baidu_question` VALUES (1498527933, '我八秒之内将魔方打乱，岂不是相当于我八秒之内拧好了？');
INSERT INTO `baidu_question` VALUES (1539532549, '哑巴被瞎子用手语骂了，哑巴怎么骂回去？');
INSERT INTO `baidu_question` VALUES (1554012144, '曹植被五步蛇咬了，走七步能免疫五步蛇的毒吗？');
INSERT INTO `baidu_question` VALUES (1564181986, '不洗手就吃屎会得胃病吗？');
INSERT INTO `baidu_question` VALUES (1592813375, '恶霸经常找人算账，为什么不去当会计？');
INSERT INTO `baidu_question` VALUES (1594797766, '先砍头，再五马分尸，那五只马绑的是哪里？');
INSERT INTO `baidu_question` VALUES (1637695992, '我穿越到未来了，这样创业能赚到钱吗？');
INSERT INTO `baidu_question` VALUES (1646666746, '鱼上岸了不会死吗？');
INSERT INTO `baidu_question` VALUES (1650112573, '如果穷人都不生孩子，不就只有富人了？');
INSERT INTO `baidu_question` VALUES (1669999181, '怎么在吧里发帖子啊？');
INSERT INTO `baidu_question` VALUES (1670949296, '竟然坐地日行八万里，那发明飞机汽车干什么？');
INSERT INTO `baidu_question` VALUES (1690708007, '干燥剂算不算治脑袋进水的特效药？');
INSERT INTO `baidu_question` VALUES (1738611073, '后妈叫继妈，后爸呢？');
INSERT INTO `baidu_question` VALUES (1763925117, '鸡柳是鸡身上哪个部位啊？');
INSERT INTO `baidu_question` VALUES (1827725490, '我走路被石头绊到坑里了，是石头负全责还是坑负全责？');
INSERT INTO `baidu_question` VALUES (1847544890, '孙悟空得了肾结石，那他是生病了还是怀孕了？');
INSERT INTO `baidu_question` VALUES (1875729615, '明明喝酒不能开车，那为什么还有这么多人酒后乱性呢？');
INSERT INTO `baidu_question` VALUES (1883855676, '我3000块一个月把自己租赁给了老板，所以是我自己在剥削自己？');
INSERT INTO `baidu_question` VALUES (1888303923, '弱国无外交，那他们的外交部是做什么的？');
INSERT INTO `baidu_question` VALUES (1891470415, '吧主和吧务都掉进水里了，你是先抄段子还是先水贴？');
INSERT INTO `baidu_question` VALUES (1898163239, '丹麦商品在国内这么被认可吗？');
INSERT INTO `baidu_question` VALUES (1899243689, '分手后真的愿她过得更好吗？');
INSERT INTO `baidu_question` VALUES (1902940901, '为什么说加州大火烧不到中国呀？');
INSERT INTO `baidu_question` VALUES (1905229639, '我妈的儿子房间乱，又不是我的儿子房间乱，关我啥事，还要我收拾？');
INSERT INTO `baidu_question` VALUES (1949901220, '一斤棉花和一斤铁，同时掉进水里你先救谁？');
INSERT INTO `baidu_question` VALUES (1949997531, '电梯上又没有座位，为什么要叫坐电梯？');
INSERT INTO `baidu_question` VALUES (1963781646, '蛇油膏够用吗？');
INSERT INTO `baidu_question` VALUES (1976015788, '来弱智吧看笑话的到底是不是弱智，不是弱智为什么来弱智吧？');
INSERT INTO `baidu_question` VALUES (2024564244, '元宵节不是一月十五吗，怎么一年才过一次？');
INSERT INTO `baidu_question` VALUES (2029357509, '你这辈子听到过最恐怖的话是什么？');
INSERT INTO `baidu_question` VALUES (2057617898, '明星网红那么想要粉丝，那他们为什么不去超市买粉丝呢？');
INSERT INTO `baidu_question` VALUES (2067587394, '为什么不能点差评？');
INSERT INTO `baidu_question` VALUES (2078525783, '飞机没办法繁殖后代，哪来的五代六代？');
INSERT INTO `baidu_question` VALUES (2093076190, '我们到底是生活在这个时代？还是生活在被历史书上记载的过去？');
INSERT INTO `baidu_question` VALUES (2109721360, '学校翻墙出去是扣分，那我翻进来是不是得加分？');
INSERT INTO `baidu_question` VALUES (2112240365, '仿生机器狗会害怕电子潘宏吗？');

-- ----------------------------
-- Table structure for fun_question
-- ----------------------------
DROP TABLE IF EXISTS `fun_question`;
CREATE TABLE `fun_question`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `classify` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类\r\n',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '测试' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fun_question
-- ----------------------------
INSERT INTO `fun_question` VALUES (1, '测试类', '有一个测试哦~');

-- ----------------------------
-- Table structure for msg_wall
-- ----------------------------
DROP TABLE IF EXISTS `msg_wall`;
CREATE TABLE `msg_wall`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `leave_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `leave_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发表人',
  `leave_time` datetime NULL DEFAULT NULL COMMENT '发表时间',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地点',
  `anonymity` tinyint NULL DEFAULT NULL COMMENT '0否 1匿名',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msg_wall
-- ----------------------------
INSERT INTO `msg_wall` VALUES (18, '666', '66', '2025-04-30 16:50:14', '0 内网IP', NULL, '127.0.0.1', '/Zaohu/2025/04/30/c15e720386554f31ac2b75eaf845c222_1746003013937.png');
INSERT INTO `msg_wall` VALUES (19, '你！', '治疗', '2025-04-30 16:50:43', '0 内网IP', NULL, '127.0.0.1', '/Zaohu/2025/04/30/e582d4ab52784ae0a059266c5d41ca00_1746003043082.png');
INSERT INTO `msg_wall` VALUES (20, '开局自带反甲', '害怕骆驼', '2025-04-30 16:59:50', '0 内网IP', NULL, '127.0.0.1', '/Zaohu/2025/04/30/63c57612893c402b91eb57b9b960e933_1746003589624.png');
INSERT INTO `msg_wall` VALUES (21, '性别男，爱好女', '牛牛', '2025-04-30 17:32:39', '0 内网IP', NULL, '127.0.0.1', '/Zaohu/2025/04/30/deccc84429824374b8a510bc77a765f0_1746005558866.png');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `commodity_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  `money` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (16, 'fox', '1', 1, 2, '2024-11-02 22:02:17', '2024-11-02 22:02:17');
INSERT INTO `order` VALUES (17, 'fox', '1', 1, 2, '2024-11-02 22:03:42', '2024-11-02 22:03:42');
INSERT INTO `order` VALUES (18, 'fox', '1', 1, 2, '2024-11-02 22:06:52', '2024-11-02 22:06:52');
INSERT INTO `order` VALUES (19, 'fox', '1', 1, 2, '2024-11-02 22:07:58', '2024-11-02 22:07:58');
INSERT INTO `order` VALUES (20, 'fox', '1', 1, 2, '2024-11-02 22:08:01', '2024-11-02 22:08:01');
INSERT INTO `order` VALUES (21, 'fox', '1', 1, 2, '2024-11-02 22:08:02', '2024-11-02 22:08:02');
INSERT INTO `order` VALUES (22, 'fox', '1', 1, 2, '2024-11-02 22:08:07', '2024-11-02 22:08:07');
INSERT INTO `order` VALUES (23, 'fox', '1', 1, 2, '2024-11-02 22:11:16', '2024-11-02 22:11:16');
INSERT INTO `order` VALUES (24, 'fox', '1', 1, 2, '2024-11-02 22:11:25', '2024-11-02 22:11:25');
INSERT INTO `order` VALUES (25, 'fox', '1', 1, 2, '2024-11-02 22:11:28', '2024-11-02 22:11:28');
INSERT INTO `order` VALUES (26, 'fox', '1', 1, 2, '2024-11-02 22:11:28', '2024-11-02 22:11:28');
INSERT INTO `order` VALUES (27, 'fox', '1', 1, 2, '2024-11-02 22:11:28', '2024-11-02 22:11:28');
INSERT INTO `order` VALUES (28, 'fox', '1', 1, 2, '2024-11-02 22:11:28', '2024-11-02 22:11:28');
INSERT INTO `order` VALUES (29, 'fox', '1', 1, 2, '2024-11-02 22:11:28', '2024-11-02 22:11:28');
INSERT INTO `order` VALUES (30, 'fox', '1', 1, 2, '2024-11-02 22:11:37', '2024-11-02 22:11:37');
INSERT INTO `order` VALUES (31, 'fox', '1', 1, 2, '2024-11-02 22:11:59', '2024-11-02 22:11:59');
INSERT INTO `order` VALUES (32, 'fox', '1', 1, 2, '2024-11-02 22:12:04', '2024-11-02 22:12:04');
INSERT INTO `order` VALUES (33, 'fox', '1', 1, 2, '2024-11-02 22:12:08', '2024-11-02 22:12:08');
INSERT INTO `order` VALUES (34, 'fox', '1', 1, 2, '2024-11-02 22:12:11', '2024-11-02 22:12:11');
INSERT INTO `order` VALUES (35, 'fox', '1', 1, 2, '2024-11-02 22:12:16', '2024-11-02 22:12:16');
INSERT INTO `order` VALUES (36, 'fox', '1', 1, 2, '2024-11-02 22:12:17', '2024-11-02 22:12:17');
INSERT INTO `order` VALUES (37, 'fox', '1', 1, 2, '2024-11-02 22:12:18', '2024-11-02 22:12:18');
INSERT INTO `order` VALUES (38, 'fox', '1', 1, 2, '2024-11-02 22:12:24', '2024-11-02 22:12:24');
INSERT INTO `order` VALUES (39, 'fox', '1', 1, 2, '2024-11-02 22:12:25', '2024-11-02 22:12:25');
INSERT INTO `order` VALUES (40, 'fox', '1', 1, 2, '2024-11-02 22:12:25', '2024-11-02 22:12:25');
INSERT INTO `order` VALUES (41, 'fox', '1', 1, 2, '2024-11-02 22:12:25', '2024-11-02 22:12:25');
INSERT INTO `order` VALUES (42, 'fox', '1', 1, 2, '2024-11-06 21:17:55', '2024-11-06 21:17:55');
INSERT INTO `order` VALUES (43, 'fox', '1', 1, 2, '2024-11-06 21:17:57', '2024-11-06 21:17:57');
INSERT INTO `order` VALUES (44, 'fox', '1', 1, 2, '2024-11-08 22:01:59', '2024-11-08 22:01:59');
INSERT INTO `order` VALUES (45, 'fox', '1', 1, 2, '2024-11-08 22:02:18', '2024-11-08 22:02:18');
INSERT INTO `order` VALUES (46, 'fox', '1', 1, 2, '2024-11-08 22:02:35', '2024-11-08 22:02:35');
INSERT INTO `order` VALUES (47, 'fox', '1', 1, 2, '2024-11-08 22:36:08', '2024-11-08 22:36:08');
INSERT INTO `order` VALUES (48, 'fox', '1', 1, 2, '2024-11-08 22:56:39', '2024-11-08 22:56:39');
INSERT INTO `order` VALUES (49, 'fox', '1', 1, 2, '2024-11-10 17:06:38', '2024-11-10 17:06:38');
INSERT INTO `order` VALUES (50, 'fox', '1', 1, 2, '2024-11-10 17:08:08', '2024-11-10 17:08:08');
INSERT INTO `order` VALUES (51, 'fox', '1', 1, 2, '2024-11-10 17:08:08', '2024-11-10 17:08:08');
INSERT INTO `order` VALUES (52, 'fox', '1', 1, 2, '2024-11-10 17:09:45', '2024-11-10 17:09:45');
INSERT INTO `order` VALUES (53, 'fox', '1', 1, 2, '2024-11-10 17:10:07', '2024-11-10 17:10:07');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` bigint NOT NULL AUTO_INCREMENT COMMENT '权限ID主键',
  `permission_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '权限名',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1000, 'del');
INSERT INTO `permission` VALUES (1001, 'edit');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID主键',
  `role_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1000, 'admin');
INSERT INTO `role` VALUES (1001, 'cto');
INSERT INTO `role` VALUES (1002, 'cfo');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `permission_id` bigint NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1001, 1000);
INSERT INTO `role_permission` VALUES (1001, 1001);

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `commodity_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `count` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `commodity_code`(`commodity_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES (1, '1', 59, '2024-08-07 22:48:29', '2024-11-10 17:10:07');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid` ASC, `branch_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID主键',
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '手机号，唯一',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `login_date` datetime NULL DEFAULT NULL COMMENT '上次登陆时间',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1000, '16652851892', '$2a$10$1Nt3Z9FYcuAwsOCbX/4eH.jehCy9DAwCm53ay0cqMq7AhCxMLUQZG', '铁汉柔情', NULL, '3331247124@qq.com');
INSERT INTO `user` VALUES (1003, '1111111111', '$2a$10$Bn2Y1b6uU8.TdLRjVhXXdeUo88atqEdH6znxQhdz43I5K3aJnEmFq', '123', NULL, '188688888@qq.com');
INSERT INTO `user` VALUES (1004, '16652851893', '$2a$10$1Nt3Z9FYcuAwsOCbX/4eH.jehCy9DAwCm53ay0cqMq7AhCxMLUQZG', '铁汉柔情', NULL, '1231231232@qq.com');
INSERT INTO `user` VALUES (1005, '13202553394', '$2a$10$rwAQgQhTgralZUlwx5Bg7OijEDxlqw9e2vtrllk.JMRIx/nTOD9li', 'lichangkun', NULL, '14569694@qq.com');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1000, 1000);
INSERT INTO `user_role` VALUES (1000, 1001);
INSERT INTO `user_role` VALUES (1000, 1002);

-- ----------------------------
-- Table structure for visit_num
-- ----------------------------
DROP TABLE IF EXISTS `visit_num`;
CREATE TABLE `visit_num`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `visit_num` int NULL DEFAULT NULL COMMENT '接口访问次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '访问数量' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of visit_num
-- ----------------------------
INSERT INTO `visit_num` VALUES (1, 315);

SET FOREIGN_KEY_CHECKS = 1;
