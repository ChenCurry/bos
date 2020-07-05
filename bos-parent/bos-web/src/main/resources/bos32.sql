/*
 Navicat Premium Data Transfer

 Source Server         : 本机MySQL服务器
 Source Server Type    : MySQL
 Source Server Version : 50648
 Source Host           : localhost:3306
 Source Schema         : bos32

 Target Server Type    : MySQL
 Target Server Version : 50648
 File Encoding         : 65001

 Date: 05/07/2020 12:55:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_function
-- ----------------------------
DROP TABLE IF EXISTS `auth_function`;
CREATE TABLE `auth_function`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `generatemenu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zindex` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK33r6np87v1p6gge7t6rpcao5h`(`pid`) USING BTREE,
  CONSTRAINT `FK33r6np87v1p6gge7t6rpcao5h` FOREIGN KEY (`pid`) REFERENCES `auth_function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_function
-- ----------------------------
INSERT INTO `auth_function` VALUES ('11', '基础档案', 'jichudangan', NULL, NULL, '1', '0', NULL);
INSERT INTO `auth_function` VALUES ('112', '收派标准', 'standard', NULL, 'page_base_standard.action', '1', '1', 11);
INSERT INTO `auth_function` VALUES ('113', '取派员设置', 'staff', NULL, 'page_base_staff.action', '1', '2', 11);
INSERT INTO `auth_function` VALUES ('114', '区域设置', 'region', NULL, 'page_base_region.action', '1', '3', 11);
INSERT INTO `auth_function` VALUES ('115', '管理分区', 'subarea', NULL, 'page_base_subarea.action', '1', '4', 11);
INSERT INTO `auth_function` VALUES ('116', '管理定区/调度排班', 'decidedzone', NULL, 'page_base_decidedzone.action', '1', '5', 11);
INSERT INTO `auth_function` VALUES ('12', '受理', 'shouli', NULL, NULL, '1', '1', NULL);
INSERT INTO `auth_function` VALUES ('121', '业务受理', 'noticebill', NULL, 'page_qupai_noticebill_add.action', '1', '0', 12);
INSERT INTO `auth_function` VALUES ('122', '工作单快速录入', 'quickworkordermanage', NULL, 'page_qupai_quickworkorder.action', '1', '1', 12);
INSERT INTO `auth_function` VALUES ('124', '工作单导入', 'workordermanageimport', NULL, 'page_qupai_workorderimport.action', '1', '3', 12);
INSERT INTO `auth_function` VALUES ('13', '调度', 'diaodu', NULL, NULL, '1', '2', NULL);
INSERT INTO `auth_function` VALUES ('131', '查台转单', 'changestaff', NULL, NULL, '1', '0', 13);
INSERT INTO `auth_function` VALUES ('132', '人工调度', 'personalassign', NULL, 'page_qupai_diaodu.action', '1', '1', 13);
INSERT INTO `auth_function` VALUES ('14', '物流配送流程管理', 'zhongzhuan', NULL, NULL, '1', '3', NULL);
INSERT INTO `auth_function` VALUES ('141', '启动配送流程', 'start', NULL, 'workOrderManageAction_list.action', '1', '0', 14);
INSERT INTO `auth_function` VALUES ('142', '查看个人任务', 'personaltask', NULL, 'taskAction_findPersonalTask.action', '1', '1', 14);
INSERT INTO `auth_function` VALUES ('143', '查看我的组任务', 'grouptask', NULL, 'taskAction_findGroupTask.action', '1', '2', 14);
INSERT INTO `auth_function` VALUES ('8a7e843355a4392d0155a43aa7150000', '删除取派员', 'staff.delete', 'xxx', 'staffAction_delete.action', '0', '1', 113);
INSERT INTO `auth_function` VALUES ('8a7e843355a442460155a442bcfc0000', '传智播客', 'itcast', '', 'http://www.itcast.cn', '1', '1', NULL);

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('402881887318d504017318ed79f60000', 'test', 'test', 'test');

-- ----------------------------
-- Table structure for bc_decidedzone
-- ----------------------------
DROP TABLE IF EXISTS `bc_decidedzone`;
CREATE TABLE `bc_decidedzone`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staff_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKh0xplk12o52a6eryw4hcqnfwt`(`staff_id`) USING BTREE,
  CONSTRAINT `FKh0xplk12o52a6eryw4hcqnfwt` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bc_region
-- ----------------------------
DROP TABLE IF EXISTS `bc_region`;
CREATE TABLE `bc_region`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shortcode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `citycode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bc_staff
-- ----------------------------
DROP TABLE IF EXISTS `bc_staff`;
CREATE TABLE `bc_staff`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `haspda` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deltag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `station` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `standard` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bc_subarea
-- ----------------------------
DROP TABLE IF EXISTS `bc_subarea`;
CREATE TABLE `bc_subarea`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `decidedzone_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addresskey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startnum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endnum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `single` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlndbc8oldgbg3k1x63n3n6t7n`(`decidedzone_id`) USING BTREE,
  INDEX `FKcjwxm19mx5njn3xyqgqp431mb`(`region_id`) USING BTREE,
  CONSTRAINT `FKcjwxm19mx5njn3xyqgqp431mb` FOREIGN KEY (`region_id`) REFERENCES `bc_region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKlndbc8oldgbg3k1x63n3n6t7n` FOREIGN KEY (`decidedzone_id`) REFERENCES `bc_decidedzone` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qp_noticebill
-- ----------------------------
DROP TABLE IF EXISTS `qp_noticebill`;
CREATE TABLE `qp_noticebill`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delegater` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pickaddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrivecity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pickdate` datetime(0) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  `volume` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordertype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKl5j3pm969oy1qdc1318jrmbgt`(`user_id`) USING BTREE,
  INDEX `FKhmbqr6qlg0uets978w5xshler`(`staff_id`) USING BTREE,
  CONSTRAINT `FKhmbqr6qlg0uets978w5xshler` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl5j3pm969oy1qdc1318jrmbgt` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qp_workbill
-- ----------------------------
DROP TABLE IF EXISTS `qp_workbill`;
CREATE TABLE `qp_workbill`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noticebill_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pickstate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buildtime` datetime(0) NOT NULL,
  `attachbilltimes` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKggojlcovnpimuukxcueb18apt`(`noticebill_id`) USING BTREE,
  INDEX `FK55ckcnjyvwinnnniu5jpelg7y`(`staff_id`) USING BTREE,
  CONSTRAINT `FK55ckcnjyvwinnnniu5jpelg7y` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKggojlcovnpimuukxcueb18apt` FOREIGN KEY (`noticebill_id`) REFERENCES `qp_noticebill` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qp_workordermanage
-- ----------------------------
DROP TABLE IF EXISTS `qp_workordermanage`;
CREATE TABLE `qp_workordermanage`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `arrivecity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  `floadreqr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prodtimelimit` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prodtype` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendername` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `senderphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `senderaddr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receivername` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiveraddr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `feeitemnum` int(11) NULL DEFAULT NULL,
  `actlweit` double NULL DEFAULT NULL,
  `vol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `managerCheck` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_function
-- ----------------------------
DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function`  (
  `function_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`, `function_id`) USING BTREE,
  INDEX `FK5f8riddotqjpm9vly0b8c5nmf`(`function_id`) USING BTREE,
  CONSTRAINT `FK10qo908yd9evkyb40vf88og85` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5f8riddotqjpm9vly0b8c5nmf` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salary` double NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `station` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('11', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKqqlqhas35obkljn18mrh6mmms`(`role_id`) USING BTREE,
  CONSTRAINT `FKeqon9sx5vssprq67dxm3s7ump` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqqlqhas35obkljn18mrh6mmms` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
