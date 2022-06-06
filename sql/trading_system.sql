/*
 Navicat Premium Data Transfer

 Source Server         : 1.116.208.200_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 1.116.208.200:3306
 Source Schema         : trading_system

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 06/06/2022 17:42:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `uid` bigint NULL DEFAULT NULL COMMENT '操作人',
  `operate_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `operation_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作类型',
  `operation_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作记录',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`uid` ASC) USING BTREE,
  CONSTRAINT `admin_log_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员操作表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for chat_record
-- ----------------------------
DROP TABLE IF EXISTS `chat_record`;
CREATE TABLE `chat_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息主键 ID',
  `from_id` bigint NULL DEFAULT NULL COMMENT '发送者 ID',
  `to_id` bigint NULL DEFAULT NULL COMMENT '接收者 ID',
  `to_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接收者用户名',
  `from_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者用户名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '消息内容',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `content_type_id` bigint NULL DEFAULT NULL COMMENT '消息类型',
  `is_read` tinyint(2) UNSIGNED ZEROFILL NOT NULL COMMENT '是否已读 0未读 1已读',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `from_id`(`from_id` ASC) USING BTREE,
  INDEX `to_id`(`to_id` ASC) USING BTREE,
  INDEX `content_type_id`(`content_type_id` ASC) USING BTREE,
  CONSTRAINT `chat_record_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chat_record_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chat_record_ibfk_3` FOREIGN KEY (`content_type_id`) REFERENCES `content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '聊天记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_record
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `goods_id` bigint NOT NULL COMMENT '所属商品 ID',
  `from_uid` bigint NULL DEFAULT NULL COMMENT '评论者 ID',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论内容',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(3) UNSIGNED ZEROFILL NULL DEFAULT 000 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id` ASC) USING BTREE,
  INDEX `user_id`(`from_uid` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`from_uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (4, 9, 95, '秦杰宏', 'FtGRH8icL9', '这里是一级评论的内容', '2022-06-02 06:31:24', '2022-06-01 06:38:00', 000);
INSERT INTO `comment` VALUES (5, 10, 2, '余云熙', 'b4A3hn37N6', '这里是一级评论的内容', '2022-05-30 12:00:55', '2022-06-03 14:37:24', 000);
INSERT INTO `comment` VALUES (6, 11, 54, '唐致远', 'oo8njwLWxH', '这里是一级评论的内容', '2022-06-03 13:00:46', '2022-06-04 21:12:35', 000);

-- ----------------------------
-- Table structure for content_type
-- ----------------------------
DROP TABLE IF EXISTS `content_type`;
CREATE TABLE `content_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `type_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息类型',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '消息类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of content_type
-- ----------------------------
INSERT INTO `content_type` VALUES (1, '文本', '2022-06-05 01:51:16');
INSERT INTO `content_type` VALUES (2, '图片', '2022-06-05 01:51:29');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品主键 ID',
  `user_id` bigint NOT NULL COMMENT '从属用户 ID',
  `goods_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名',
  `category_id` bigint NULL DEFAULT NULL COMMENT '商品类别',
  `goods_price` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '商品价格',
  `detail_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品详细信息',
  `stared_times` int(10) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000000000 COMMENT '被关注次数',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `status` tinyint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000 COMMENT '0在售 1已售出 2已删除 3下架 4审核未通过',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `goods_name`(`goods_name` ASC) USING BTREE,
  INDEX `status`(`status` ASC) USING BTREE,
  INDEX `goods_price`(`goods_price` ASC) USING BTREE,
  INDEX `id`(`id` ASC, `goods_name` ASC, `goods_price` ASC, `status` ASC) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `goods_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (9, 1, '91-百香果青椰气泡水', 75, 00000070.20, '填写详细信息', 0000000000, '2022-06-01 07:47:40', '2022-06-05 02:03:55', 0, 0001);
INSERT INTO `goods` VALUES (10, 2, '74-百香果青椰气泡水', 29, 00000046.86, '填写详细信息', 0000000000, '2022-06-03 01:21:05', '2022-06-05 02:03:55', 0, 0000);
INSERT INTO `goods` VALUES (11, 1, '24-百香果青椰气泡水', 14, 00000033.09, '填写详细信息', 0000000000, '2022-06-04 08:08:47', '2022-06-05 02:03:55', 0, 0000);

-- ----------------------------
-- Table structure for goods_collection
-- ----------------------------
DROP TABLE IF EXISTS `goods_collection`;
CREATE TABLE `goods_collection`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户 ID',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '关注商品 ID',
  `goods_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注商品名称',
  `goods_status` tinyint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000 COMMENT '关注商品状态',
  `goods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '关注商品价格',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id_2`(`user_id` ASC, `goods_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `goods_id`(`goods_id` ASC) USING BTREE,
  INDEX `goods_name`(`goods_name` ASC) USING BTREE,
  INDEX `goods_status`(`goods_status` ASC) USING BTREE,
  INDEX `goods_price`(`goods_price` ASC) USING BTREE,
  INDEX `goods_collection_ibfk_2`(`goods_id` ASC, `goods_name` ASC, `goods_price` ASC, `goods_status` ASC) USING BTREE,
  CONSTRAINT `goods_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_collection_ibfk_2` FOREIGN KEY (`goods_id`, `goods_name`, `goods_price`, `goods_status`) REFERENCES `goods` (`id`, `goods_name`, `goods_price`, `status`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `goods_collection_ibfk_3` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_collection
-- ----------------------------
INSERT INTO `goods_collection` VALUES (1, 1, 9, '91-百香果青椰气泡水', 0001, 70.20, '2022-06-06 15:55:24', '2022-06-06 15:55:31');

-- ----------------------------
-- Table structure for goods_img
-- ----------------------------
DROP TABLE IF EXISTS `goods_img`;
CREATE TABLE `goods_img`  (
  `img_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '商品 ID',
  `img_url` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片 url',
  PRIMARY KEY (`img_id`) USING BTREE,
  INDEX `goods_id`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `goods_img_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_img
-- ----------------------------

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `type_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `weight` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '权重',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品类别标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (2, '食品', 0000000001, '2022-04-24 20:28:14', '2022-06-05 01:43:14');
INSERT INTO `goods_type` VALUES (3, '婴儿用品', 0000000001, '2022-05-01 18:21:05', '2022-06-05 01:43:14');
INSERT INTO `goods_type` VALUES (4, '其他', 0000000001, '2022-03-29 22:30:55', '2022-06-05 01:43:14');
INSERT INTO `goods_type` VALUES (5, '电子游戏', 0000000001, '2022-05-02 17:08:24', '2022-06-05 01:43:14');
INSERT INTO `goods_type` VALUES (6, '宠物用品', 0000000001, '2022-03-19 06:47:56', '2022-06-05 01:43:14');
INSERT INTO `goods_type` VALUES (7, '手工制作', 0000000001, '2022-01-12 05:45:00', '2022-06-05 01:43:14');
INSERT INTO `goods_type` VALUES (8, '电子游戏', 0000000001, '2022-05-22 02:40:09', '2022-06-05 01:43:14');
INSERT INTO `goods_type` VALUES (9, '婴儿用品', 0000000001, '2022-05-07 02:08:03', '2022-06-05 01:43:14');
INSERT INTO `goods_type` VALUES (10, '乐器用品', 0000000001, '2022-03-17 00:48:50', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (11, '运动与户外用品', 0000000001, '2022-05-26 00:44:47', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (12, '电子游戏', 0000000001, '2022-06-04 08:01:54', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (13, '应用程式及游戏', 0000000001, '2022-02-16 02:40:53', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (14, 'CD及黑胶唱片', 0000000001, '2022-05-22 11:13:46', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (15, '工具与家居装饰', 0000000001, '2022-01-07 14:09:50', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (16, '家电', 0000000001, '2022-02-14 08:26:46', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (17, '花园与户外', 0000000001, '2022-04-06 03:10:06', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (18, '应用程式及游戏', 0000000001, '2022-05-26 03:14:47', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (19, '玩具与游戏', 0000000001, '2022-04-23 09:02:13', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (20, '家电', 0000000001, '2022-01-22 13:52:18', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (21, '工业及科学用品', 0000000001, '2022-03-03 21:27:20', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (22, '收藏品及美术用品', 0000000001, '2022-03-08 23:06:15', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (23, '婴儿用品', 0000000001, '2022-03-19 03:04:17', '2022-06-05 01:43:15');
INSERT INTO `goods_type` VALUES (24, '应用程式及游戏', 0000000001, '2022-03-20 21:30:48', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (25, '其他', 0000000001, '2022-02-09 16:22:12', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (26, '电子游戏', 0000000001, '2022-04-02 11:14:33', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (27, '优质美容', 0000000001, '2022-01-01 03:10:29', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (28, '宠物用品', 0000000001, '2022-02-03 14:37:57', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (29, '花园与户外', 0000000001, '2022-02-10 22:35:56', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (30, '保健，家庭及婴儿护理', 0000000001, '2022-02-01 01:31:11', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (31, '花园与户外', 0000000001, '2022-04-12 13:29:25', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (32, 'CD及黑胶唱片', 0000000001, '2022-01-19 06:49:38', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (33, '行李及旅行装备', 0000000001, '2022-05-10 07:19:58', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (34, '美容与个人护理', 0000000001, '2022-03-17 20:48:17', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (35, '食品', 0000000001, '2022-01-13 03:11:45', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (36, '电脑与电子用品', 0000000001, '2022-01-24 07:49:35', '2022-06-05 01:43:16');
INSERT INTO `goods_type` VALUES (37, '工具与家居装饰', 0000000001, '2022-04-24 21:25:41', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (38, '影视用品', 0000000001, '2022-01-05 18:48:20', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (39, '艺术，手工艺品及缝纫', 0000000001, '2022-03-21 15:02:22', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (40, '玩具与游戏', 0000000001, '2022-04-08 04:53:54', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (41, '工业及科学用品', 0000000001, '2022-01-19 18:00:20', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (42, '乐器用品', 0000000001, '2022-02-26 05:32:16', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (43, '应用程式及游戏', 0000000001, '2022-03-09 23:20:28', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (44, '工业及科学用品', 0000000001, '2022-03-02 02:46:53', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (45, '工具与家居装饰', 0000000001, '2022-03-12 08:12:33', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (46, '服装，鞋子和珠宝', 0000000001, '2022-02-24 21:52:40', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (47, '电子游戏', 0000000001, '2022-04-07 05:56:59', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (48, '运动与户外用品', 0000000001, '2022-05-10 19:56:08', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (49, '手机及配件', 0000000001, '2022-05-23 02:08:40', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (50, '乐器用品', 0000000001, '2022-01-07 19:28:02', '2022-06-05 01:43:17');
INSERT INTO `goods_type` VALUES (51, '玩具与游戏', 0000000001, '2022-03-17 17:30:40', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (52, '优质美容', 0000000001, '2022-04-14 02:46:36', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (53, '书本', 0000000001, '2022-01-21 12:44:20', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (54, '手机及配件', 0000000001, '2022-05-18 19:27:25', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (55, '食品', 0000000001, '2022-04-24 18:51:01', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (56, '书本', 0000000001, '2022-01-11 11:35:23', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (57, '乐器用品', 0000000001, '2022-02-07 10:32:08', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (58, '食品', 0000000001, '2022-02-26 22:42:14', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (59, '手工制作', 0000000001, '2022-01-30 03:48:23', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (60, '服装，鞋子和珠宝', 0000000001, '2022-05-26 05:38:16', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (61, '乐器用品', 0000000001, '2022-01-23 11:10:05', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (62, '食品', 0000000001, '2022-01-03 03:47:20', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (63, '应用程式及游戏', 0000000001, '2022-01-03 07:52:03', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (64, '影视用品', 0000000001, '2022-06-05 12:03:04', '2022-06-05 01:43:18');
INSERT INTO `goods_type` VALUES (65, '服装，鞋子和珠宝', 0000000001, '2022-02-15 11:56:27', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (66, '其他', 0000000001, '2022-03-15 05:14:55', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (67, '婴儿用品', 0000000001, '2022-04-08 22:50:57', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (68, '保健，家庭及婴儿护理', 0000000001, '2022-04-26 11:56:16', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (69, '艺术，手工艺品及缝纫', 0000000001, '2022-01-20 08:18:07', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (70, '影视用品', 0000000001, '2022-04-23 11:54:10', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (71, '书本', 0000000001, '2022-04-18 20:36:33', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (72, '家居及厨房用具', 0000000001, '2022-04-01 14:18:08', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (73, '家居及厨房用具', 0000000001, '2022-03-17 00:21:36', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (74, 'CD及黑胶唱片', 0000000001, '2022-02-06 02:24:22', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (75, '手机及配件', 0000000001, '2022-04-04 20:38:53', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (76, '应用程式及游戏', 0000000001, '2022-04-28 18:54:56', '2022-06-05 01:43:19');
INSERT INTO `goods_type` VALUES (77, '乐器用品', 0000000001, '2022-05-13 05:15:43', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (78, '应用程式及游戏', 0000000001, '2022-02-05 02:35:30', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (79, '美容与个人护理', 0000000001, '2022-01-01 20:43:34', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (80, '收藏品及美术用品', 0000000001, '2022-02-15 23:37:53', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (81, '汽车零配件', 0000000001, '2022-02-28 23:07:02', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (82, '艺术，手工艺品及缝纫', 0000000001, '2022-04-17 00:20:23', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (83, '乐器用品', 0000000001, '2022-02-12 20:21:41', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (84, '乐器用品', 0000000001, '2022-01-01 01:07:59', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (85, '行李及旅行装备', 0000000001, '2022-05-28 06:58:30', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (86, '电子游戏', 0000000001, '2022-03-04 02:40:59', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (87, '行李及旅行装备', 0000000001, '2022-02-20 16:30:30', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (88, '手工制作', 0000000001, '2022-04-04 00:06:59', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (89, '工具与家居装饰', 0000000001, '2022-05-04 15:43:46', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (90, '收藏品及美术用品', 0000000001, '2022-01-25 01:10:50', '2022-06-05 01:43:20');
INSERT INTO `goods_type` VALUES (91, '电子游戏', 0000000001, '2022-01-10 15:01:32', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (92, '玩具与游戏', 0000000001, '2022-02-13 12:08:06', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (93, '运动与户外用品', 0000000001, '2022-04-03 13:08:10', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (94, '宠物用品', 0000000001, '2022-02-06 20:42:40', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (95, '手机及配件', 0000000001, '2022-04-29 01:54:40', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (96, '婴儿用品', 0000000001, '2022-01-08 09:08:08', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (97, '影视用品', 0000000001, '2022-02-13 14:47:08', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (98, '其他', 0000000001, '2022-05-29 01:03:15', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (99, '电脑与电子用品', 0000000001, '2022-02-19 03:11:02', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (100, '乐器用品', 0000000001, '2022-03-31 13:55:33', '2022-06-05 01:43:21');
INSERT INTO `goods_type` VALUES (101, '艺术，手工艺品及缝纫', 0000000001, '2022-01-20 01:44:17', '2022-06-05 01:43:21');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单 ID',
  `remitter_id` bigint NOT NULL COMMENT '汇款方 ID',
  `payee_id` bigint NOT NULL COMMENT '支付方 ID',
  `goods_id` bigint NOT NULL COMMENT '商品 ID',
  `tot_price` decimal(10, 2) UNSIGNED ZEROFILL NOT NULL COMMENT '总价格',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `status` int NOT NULL DEFAULT 0 COMMENT '订单状态 0新建 1已支付 2已取消',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `remitter_id`(`remitter_id` ASC) USING BTREE,
  INDEX `order_info_ibfk_2`(`payee_id` ASC) USING BTREE,
  INDEX `goods_id`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`remitter_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_info_ibfk_2` FOREIGN KEY (`payee_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_info_ibfk_3` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (15, 1, 1, 9, 00000053.90, '2022-05-30 14:48:16', 0);
INSERT INTO `order_info` VALUES (53, 1, 2, 9, 00000070.20, '2022-06-06 16:50:52', 1);
INSERT INTO `order_info` VALUES (54, 1, 2, 9, 00000070.20, '2022-06-06 16:51:57', 1);
INSERT INTO `order_info` VALUES (55, 1, 2, 9, 00000070.20, '2022-06-06 17:30:46', 1);

-- ----------------------------
-- Table structure for sub_comment
-- ----------------------------
DROP TABLE IF EXISTS `sub_comment`;
CREATE TABLE `sub_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `comment_id` bigint NULL DEFAULT NULL COMMENT '评论 ID',
  `from_uid` bigint NULL DEFAULT NULL COMMENT '评论用户 ID',
  `from_nick_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论用户的昵称',
  `target_uid` bigint NULL DEFAULT NULL COMMENT '目标用户 ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复内容',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` tinyint(3) UNSIGNED ZEROFILL NULL DEFAULT 000 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `from_uid`(`from_uid` ASC) USING BTREE,
  INDEX `to_uid`(`target_uid` ASC) USING BTREE,
  INDEX `comment_id`(`comment_id` ASC) USING BTREE,
  CONSTRAINT `sub_comment_ibfk_2` FOREIGN KEY (`from_uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sub_comment_ibfk_3` FOREIGN KEY (`target_uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sub_comment_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 513 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '二级评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sub_comment
-- ----------------------------
INSERT INTO `sub_comment` VALUES (3, 4, 16, '顾宇宁', 16, '这里是二级评论的内容', '2022-05-30 09:58:30', 000);
INSERT INTO `sub_comment` VALUES (4, 5, 95, '曾致远', 95, '这里是二级评论的内容', '2022-06-02 04:25:53', 000);
INSERT INTO `sub_comment` VALUES (5, 6, 61, '任璐', 61, '这里是二级评论的内容', '2022-05-30 06:27:56', 000);

-- ----------------------------
-- Table structure for trade_record
-- ----------------------------
DROP TABLE IF EXISTS `trade_record`;
CREATE TABLE `trade_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '交易记录主键 ID',
  `order_id` bigint NOT NULL COMMENT '对应订单 ID',
  `remitter_id` bigint NOT NULL COMMENT '汇款方 ID',
  `payee_id` bigint NOT NULL COMMENT '收款方 ID',
  `tot_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付价格',
  `trading_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `trade_record_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '交易记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of trade_record
-- ----------------------------
INSERT INTO `trade_record` VALUES (1, 15, 1, 96, 21.75, '2022-06-06 16:45:17');
INSERT INTO `trade_record` VALUES (22, 15, 1, 1, 53.90, '2022-06-06 16:15:25');
INSERT INTO `trade_record` VALUES (23, 15, 1, 1, 53.90, '2022-06-06 16:46:47');

-- ----------------------------
-- Table structure for trading_review
-- ----------------------------
DROP TABLE IF EXISTS `trading_review`;
CREATE TABLE `trading_review`  (
  `id` bigint NOT NULL COMMENT '主键 ID',
  `uid` bigint NULL DEFAULT NULL COMMENT '评价用户 ID',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '被评商品 ID',
  `score` decimal(10, 2) NOT NULL DEFAULT 5.00 COMMENT '评分 满分5.0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评价内容',
  `content_type_id` bigint NULL DEFAULT NULL COMMENT '评价类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  INDEX `goods_id`(`goods_id` ASC) USING BTREE,
  INDEX `content_type_id`(`content_type_id` ASC) USING BTREE,
  CONSTRAINT `trading_review_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `trading_review_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `trading_review_ibfk_3` FOREIGN KEY (`content_type_id`) REFERENCES `content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '交易评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trading_review
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户主键 ID',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码 SHA256加密',
  `role` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(3) UNSIGNED ZEROFILL NOT NULL DEFAULT 000 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2723724163@qq.com', 'Gerry', '/static/94617433)jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-28 14:05:25', '2022-06-05 01:32:33', 000);
INSERT INTO `user` VALUES (2, '1006923707@qq.com', 'steve', '/static/94617433)jpg', '$2a$10$pjnGgegmMfh7DdJTiwExq.QY1WsiV4AVCegeSdAXGzKl3Sj9pY2dC', 'USER', '2022-06-04 07:38:49', '2022-06-05 01:32:35', 000);
INSERT INTO `user` VALUES (3, 'xionru4@gmail.com', '熊睿', '/static/94617433)jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 20:03:44', '2022-06-05 01:32:51', 000);
INSERT INTO `user` VALUES (4, 'ljiehong@gmail.com', '廖杰宏', '/static/466293765jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 07:55:29', '2022-06-05 01:32:53', 000);
INSERT INTO `user` VALUES (5, 'jiang79@gmail.com', '蒋詩涵', '/static/62241932\"jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 17:57:29', '2022-06-05 01:32:56', 000);
INSERT INTO `user` VALUES (6, 'yan5@gmail.com', '严秀英', '/static/02854250yjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 09:49:38', '2022-06-05 01:32:58', 000);
INSERT INTO `user` VALUES (7, 'ziyi4@qq.com', '马子异', '/static/75348289kjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 06:35:11', '2022-06-05 01:32:59', 000);
INSERT INTO `user` VALUES (8, 'gongy422@qq.com', '龚宇宁', '/static/34725444[jpg', 'LQwwjJymNx$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 04:13:06', '2022-06-05 01:33:00', 000);
INSERT INTO `user` VALUES (9, 'yao115@gmail.com', '姚晓明', '/static/67141589^jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 11:22:00', '2022-06-05 01:33:01', 000);
INSERT INTO `user` VALUES (10, 'lalong@qq.com', '龙岚', '/static/619120486jpg', 'X83l9Z6yjK$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 17:33:38', '2022-06-05 01:33:02', 000);
INSERT INTO `user` VALUES (11, 'yuningqia@gmail.com', '钱宇宁', '/static/35272043Ojpg', 'CW25OPn3vD$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 01:22:29', '2022-06-05 01:33:03', 000);
INSERT INTO `user` VALUES (12, 'dujialu4@gmail.com', '杜嘉伦', '/static/48879123Ejpg', 'xuIpx3JMpN$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 18:59:59', '2022-06-05 01:33:05', 000);
INSERT INTO `user` VALUES (13, 'dlan1212@163.com', '董岚', '/static/91983308<jpg', 'KvNNAji48s$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 10:28:13', '2022-06-05 01:33:05', 000);
INSERT INTO `user` VALUES (14, 'dengxiaoming1954@gmail.com', '邓晓明', '/static/63126308;jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 23:50:42', '2022-06-05 01:33:06', 000);
INSERT INTO `user` VALUES (15, 'sun1221@163.com', '孙安琪', '/static/03462277Sjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 11:16:17', '2022-06-05 01:33:07', 000);
INSERT INTO `user` VALUES (16, 'mo1126@gmail.com', '莫睿', '/static/12292252}jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 17:04:24', '2022-06-05 01:33:09', 000);
INSERT INTO `user` VALUES (17, 'anqisong@qq.com', '宋安琪', '/static/38486808Ajpg', 'cbOxLF9fB8$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 21:28:26', '2022-06-05 01:33:10', 000);
INSERT INTO `user` VALUES (18, 'zitazeng@163.com', '曾子韬', '/static/418560673jpg', 'V1rTH7DlDl$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 17:00:21', '2022-06-05 01:33:11', 000);
INSERT INTO `user` VALUES (19, 'anqimeng@gmail.com', '孟安琪', '/static/94928090sjpg', 'wHipGbLGMm$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 17:22:04', '2022-06-05 01:33:13', 000);
INSERT INTO `user` VALUES (20, 'peng1@163.com', '彭子异', '/static/31585948Xjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 20:32:52', '2022-06-05 01:33:15', 000);
INSERT INTO `user` VALUES (21, 'lanqian@gmail.com', '钱岚', '/static/268390031jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 16:19:07', '2022-06-05 01:33:15', 000);
INSERT INTO `user` VALUES (22, 'zitaolu@163.com', '吕子韬', '/static/83581596/jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 15:51:50', '2022-06-05 01:33:16', 000);
INSERT INTO `user` VALUES (23, 'pengyuning@163.com', '彭宇宁', '/static/26683713rjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 07:01:52', '2022-06-05 01:33:20', 000);
INSERT INTO `user` VALUES (24, 'yazitao@gmail.com', '阎子韬', '/static/74957474*jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 07:19:01', '2022-06-05 01:33:21', 000);
INSERT INTO `user` VALUES (25, 'lu730@gmail.com', '孔璐', '/static/03165302Djpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 02:36:13', '2022-06-05 01:33:22', 000);
INSERT INTO `user` VALUES (26, 'zhol@gmail.com', '钟璐', '/static/113295191jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 11:54:38', '2022-06-05 01:33:23', 000);
INSERT INTO `user` VALUES (27, 'zitaogu306@gmail.com', '顾子韬', '/static/20493250Pjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 11:10:49', '2022-06-05 01:33:24', 000);
INSERT INTO `user` VALUES (28, 'lanjia57@qq.com', '贾岚', '/static/40024466Ijpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 07:01:02', '2022-06-05 01:33:25', 000);
INSERT INTO `user` VALUES (29, 'zrui60@gmail.com', '曾睿', '/static/98772296<jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 01:49:19', '2022-06-05 01:33:26', 000);
INSERT INTO `user` VALUES (30, 'jha8@gmail.com', '郝嘉伦', '/static/11935801?jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 08:18:17', '2022-06-05 01:33:26', 000);
INSERT INTO `user` VALUES (31, 'fenglu@gmail.com', '冯璐', '/static/40249144gjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 22:00:28', '2022-06-05 01:33:27', 000);
INSERT INTO `user` VALUES (32, 'cherui8@gmail.com', '陈睿', '/static/54036386 jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 08:43:54', '2022-06-05 01:33:30', 000);
INSERT INTO `user` VALUES (33, 'zhiyuanzhen@gmail.com', '郑致远', '/static/38251211vjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 05:39:30', '2022-06-05 01:33:29', 000);
INSERT INTO `user` VALUES (34, 'wei220@qq.com', '韦晓明', '/static/95613915Ojpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 22:40:34', '2022-06-05 01:33:28', 000);
INSERT INTO `user` VALUES (35, 'jiejiang@163.com', '蒋杰宏', '/static/37431579$jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 12:19:11', '2022-06-05 01:33:32', 000);
INSERT INTO `user` VALUES (36, 'sushiha8@gmail.com', '苏詩涵', '/static/63331091^jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 19:42:19', '2022-06-05 01:33:33', 000);
INSERT INTO `user` VALUES (37, 'ziytan@gmail.com', '谭子异', '/static/16026303zjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 04:02:23', '2022-06-05 01:33:34', 000);
INSERT INTO `user` VALUES (38, 'jialu210@qq.com', '卢嘉伦', '/static/00029982\'jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 17:22:26', '2022-06-05 01:33:34', 000);
INSERT INTO `user` VALUES (39, 'shihzou@gmail.com', '邹詩涵', '/static/03749209Ajpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 17:09:22', '2022-06-05 01:33:35', 000);
INSERT INTO `user` VALUES (40, 'lu65@gmail.com', '陆璐', '/static/23804811?jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 11:30:44', '2022-06-05 01:33:36', 000);
INSERT INTO `user` VALUES (41, 'yzitao@gmail.com', '尹子韬', '/static/64231905Ajpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 09:25:11', '2022-06-05 01:33:37', 000);
INSERT INTO `user` VALUES (42, 'wuyunxi@gmail.com', '武云熙', '/static/60336803Qjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 07:50:26', '2022-06-05 01:33:37', 000);
INSERT INTO `user` VALUES (43, 'xiuying2@163.com', '邓秀英', '/static/03435621]jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 06:59:25', '2022-06-05 01:33:38', 000);
INSERT INTO `user` VALUES (44, 'dingzhi@163.com', '丁致远', '/static/26964470#jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 11:28:03', '2022-06-05 01:33:39', 000);
INSERT INTO `user` VALUES (45, 'tianjialun@163.com', '田嘉伦', '/static/97655490jjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 09:27:06', '2022-06-05 01:33:39', 000);
INSERT INTO `user` VALUES (46, 'wu1@gmail.com', '吴詩涵', '/static/09442015Ljpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 22:25:41', '2022-06-05 01:33:42', 000);
INSERT INTO `user` VALUES (47, 'yan88@163.com', '阎晓明', '/static/60063655(jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 14:47:45', '2022-06-05 01:33:44', 000);
INSERT INTO `user` VALUES (48, 'xuzitao4@163.com', '薛子韬', '/static/98474576Qjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 06:29:05', '2022-06-05 01:33:44', 000);
INSERT INTO `user` VALUES (49, 'jig116@163.com', '顾嘉伦', '/static/29909421cjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 01:19:33', '2022-06-05 01:33:46', 000);
INSERT INTO `user` VALUES (50, 'jiem@qq.com', '毛杰宏', '/static/02552917kjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 00:17:29', '2022-06-05 01:33:47', 000);
INSERT INTO `user` VALUES (51, 'qinru@163.com', '秦睿', '/static/82621873\"jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 21:06:02', '2022-06-05 01:33:47', 000);
INSERT INTO `user` VALUES (52, 'xiang46@gmail.com', '向杰宏', '/static/60200434fjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 09:46:02', '2022-06-05 01:33:48', 000);
INSERT INTO `user` VALUES (53, 'han327@gmail.com', '韩秀英', '/static/29742393!jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 08:53:29', '2022-06-05 01:33:49', 000);
INSERT INTO `user` VALUES (54, 'shi330@gmail.com', '石安琪', '/static/40306603#jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 21:15:45', '2022-06-05 01:33:51', 000);
INSERT INTO `user` VALUES (55, 'gongrui@163.com', '龚睿', '/static/16284158.jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 15:33:26', '2022-06-05 01:33:52', 000);
INSERT INTO `user` VALUES (56, 'zhonzh@163.com', '钟震南', '/static/97842866ijpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 11:17:21', '2022-06-05 01:33:52', 000);
INSERT INTO `user` VALUES (57, 'tan3@qq.com', '谭云熙', '/static/79792564Yjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 08:30:23', '2022-06-05 01:33:53', 000);
INSERT INTO `user` VALUES (58, 'zhennanjiang9@gmail.com', '江震南', '/static/91635497;jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 22:32:26', '2022-06-05 01:33:54', 000);
INSERT INTO `user` VALUES (59, 'ziyili519@qq.com', '黎子异', '/static/39016464?jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 17:18:56', '2022-06-05 01:33:55', 000);
INSERT INTO `user` VALUES (60, 'xiliu@qq.com', '刘秀英', '/static/69599286*jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 03:28:01', '2022-06-05 01:33:56', 000);
INSERT INTO `user` VALUES (61, 'ruizhang56@gmail.com', '张睿', '/static/83088960xjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 02:18:13', '2022-06-05 01:33:57', 000);
INSERT INTO `user` VALUES (62, 'yunil@gmail.com', '刘宇宁', '/static/62154391qjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 05:33:24', '2022-06-05 01:33:58', 000);
INSERT INTO `user` VALUES (63, 'luo523@gmail.com', '罗嘉伦', '/static/90524843yjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 07:55:10', '2022-06-05 01:33:59', 000);
INSERT INTO `user` VALUES (64, 'zhiyuan1971@gmail.com', '贺致远', '/static/65511462~jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 16:46:33', '2022-06-05 01:34:00', 000);
INSERT INTO `user` VALUES (65, 'xuejialu@163.com', '薛嘉伦', '/static/631673066jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 03:47:27', '2022-06-05 01:34:00', 000);
INSERT INTO `user` VALUES (66, 'donglan4@qq.com', '董岚', '/static/03224439Gjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 12:32:11', '2022-06-05 01:34:02', 000);
INSERT INTO `user` VALUES (67, 'zitaokong@gmail.com', '孔子韬', '/static/80652102\'jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 12:09:33', '2022-06-05 01:34:04', 000);
INSERT INTO `user` VALUES (68, 'shenyuning10@gmail.com', '沈宇宁', '/static/48301310qjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 21:42:24', '2022-06-05 01:34:05', 000);
INSERT INTO `user` VALUES (69, 'menj7@163.com', '孟嘉伦', '/static/84629151Jjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 12:03:37', '2022-06-05 01:34:06', 000);
INSERT INTO `user` VALUES (70, 'yuw@163.com', '武云熙', '/static/29850568ojpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 03:27:51', '2022-06-05 01:34:06', 000);
INSERT INTO `user` VALUES (71, 'jiehongsha@gmail.com', '邵杰宏', '/static/29733332`jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 19:40:00', '2022-06-05 01:34:07', 000);
INSERT INTO `user` VALUES (72, 'dai723@gmail.com', '戴晓明', '/static/70830069:jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 00:23:54', '2022-06-05 01:34:08', 000);
INSERT INTO `user` VALUES (73, 'jialunqin9@gmail.com', '秦嘉伦', '/static/22404594Bjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 20:27:31', '2022-06-05 01:34:09', 000);
INSERT INTO `user` VALUES (74, 'zhennshi1955@qq.com', '石震南', '/static/610945534jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 17:30:48', '2022-06-05 01:34:10', 000);
INSERT INTO `user` VALUES (75, 'chen1995@gmail.com', '陈嘉伦', '/static/45045678%jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 05:11:27', '2022-06-05 01:34:11', 000);
INSERT INTO `user` VALUES (76, 'yuninglei922@gmail.com', '雷宇宁', '/static/009981058jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 12:12:13', '2022-06-05 01:34:11', 000);
INSERT INTO `user` VALUES (77, 'canqi@qq.com', '常安琪', '/static/04539156\'jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 07:27:20', '2022-06-05 01:34:12', 000);
INSERT INTO `user` VALUES (78, 'xiaomli@163.com', '李晓明', '/static/85400271Pjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 17:00:20', '2022-06-05 01:34:14', 000);
INSERT INTO `user` VALUES (79, 'yunxi11@gmail.com', '金云熙', '/static/81199596Ljpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 09:28:43', '2022-06-05 01:34:15', 000);
INSERT INTO `user` VALUES (80, 'zitaoli@gmail.com', '梁子韬', '/static/93018583;jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 10:14:04', '2022-06-05 01:34:16', 000);
INSERT INTO `user` VALUES (81, 'wang3@163.com', '汪岚', '/static/23030229Pjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 19:04:44', '2022-06-05 01:34:16', 000);
INSERT INTO `user` VALUES (82, 'wei9@gmail.com', '魏詩涵', '/static/37919014gjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 06:45:52', '2022-06-05 01:34:17', 000);
INSERT INTO `user` VALUES (83, 'luxiuying@163.com', '卢秀英', '/static/14761993Vjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 20:25:52', '2022-06-05 01:34:18', 000);
INSERT INTO `user` VALUES (84, 'yuzo2@gmail.com', '邹云熙', '/static/96640093Njpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 18:19:54', '2022-06-05 01:34:19', 000);
INSERT INTO `user` VALUES (85, 'hejialun310@qq.com', '贺嘉伦', '/static/25283835\'jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 15:13:55', '2022-06-05 01:34:19', 000);
INSERT INTO `user` VALUES (86, 'zhsh@gmail.com', '郑詩涵', '/static/69303444}jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 15:34:25', '2022-06-05 01:34:20', 000);
INSERT INTO `user` VALUES (87, 'xul3@gmail.com', '许璐', '/static/77536309Cjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 03:35:02', '2022-06-05 01:34:21', 000);
INSERT INTO `user` VALUES (88, 'he7@gmail.com', '贺子韬', '/static/50251134&jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 04:08:01', '2022-06-05 01:34:22', 000);
INSERT INTO `user` VALUES (89, 'chenziyi48@gmail.com', '陈子异', '/static/20156404Ajpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 22:24:09', '2022-06-05 01:34:22', 000);
INSERT INTO `user` VALUES (90, 'jiarui@gmail.com', '贾睿', '/static/55280393Jjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 12:55:50', '2022-06-05 01:34:24', 000);
INSERT INTO `user` VALUES (91, 'any1974@gmail.com', '姚安琪', '/static/15774362\'jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-02 02:49:42', '2022-06-05 01:34:25', 000);
INSERT INTO `user` VALUES (92, 'taoa@gmail.com', '陶安琪', '/static/57478013*jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 10:39:28', '2022-06-05 01:34:26', 000);
INSERT INTO `user` VALUES (93, 'luyuning94@qq.com', '陆宇宁', '/static/14645511-jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 06:47:45', '2022-06-05 01:34:26', 000);
INSERT INTO `user` VALUES (94, 'cuyuni916@qq.com', '崔宇宁', '/static/87945400Cjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 22:19:56', '2022-06-05 01:34:27', 000);
INSERT INTO `user` VALUES (95, 'ziyilu10@gmail.com', '卢子异', '/static/70017684ujpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 03:25:20', '2022-06-05 01:34:28', 000);
INSERT INTO `user` VALUES (96, 'jishihan@gmail.com', '金詩涵', '/static/771860496jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-01 08:12:20', '2022-06-05 01:34:29', 000);
INSERT INTO `user` VALUES (97, 'yizhiy@qq.com', '尹致远', '/static/47239173<jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-04 12:50:04', '2022-06-05 01:34:29', 000);
INSERT INTO `user` VALUES (98, 'jialunfu@qq.com', '傅嘉伦', '/static/89216860Djpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 16:07:25', '2022-06-05 01:34:30', 000);
INSERT INTO `user` VALUES (99, 'xiuyingw6@gmail.com', '武秀英', '/static/12193379rjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-05 19:27:44', '2022-06-05 01:34:31', 000);
INSERT INTO `user` VALUES (100, 'panjia93@qq.com', '潘嘉伦', '/static/19027358Ujpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-06-03 16:58:42', '2022-06-05 01:34:32', 000);
INSERT INTO `user` VALUES (101, 'xr55@gmail.com', '向睿', '/static/08234226`jpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 05:18:12', '2022-06-05 01:34:33', 000);
INSERT INTO `user` VALUES (102, 'maanqi@gmail.com', '毛安琪', '/static/17143903Wjpg', '$2a$10$Dsgvrt65i/XdahSGJljZCurMFD/cBJx9WUWVtG/LOrYtk2bg37XKq', 'USER', '2022-05-31 02:43:58', '2022-06-05 01:34:34', 000);
INSERT INTO `user` VALUES (103, 'xxx@gmail', 'xxx', NULL, '$2a$10$.6RbX06dHk.LRGxuL2cdcucc41SHxwLJQt23CPNrAqqre90XVWbQi', 'USER', '2022-06-05 08:23:17', '2022-06-05 18:44:39', 000);

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` bigint NOT NULL COMMENT '用户 ID',
  `onsale_count` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '在售商品数',
  `integrity` double UNSIGNED NOT NULL DEFAULT 10 COMMENT '信誉度 满为10.0',
  `star_count` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '商品被关注次数',
  `trade_count` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '交易成功次数',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_update` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户详细消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_detail
-- ----------------------------
INSERT INTO `user_detail` VALUES (1, 1, 0000000000, 10, 0000000000, 0000000000, '2022-05-28 16:56:26', '2022-05-28 16:56:29');
INSERT INTO `user_detail` VALUES (2, 2, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 07:38:49', '2022-06-04 07:38:49');
INSERT INTO `user_detail` VALUES (3, 3, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 20:03:44', '2022-05-31 20:03:44');
INSERT INTO `user_detail` VALUES (4, 4, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 07:55:29', '2022-06-04 07:55:29');
INSERT INTO `user_detail` VALUES (5, 5, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 17:57:29', '2022-06-04 17:57:29');
INSERT INTO `user_detail` VALUES (6, 6, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 09:49:38', '2022-05-31 09:49:38');
INSERT INTO `user_detail` VALUES (7, 7, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 06:35:11', '2022-05-31 06:35:11');
INSERT INTO `user_detail` VALUES (8, 8, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 04:13:06', '2022-06-02 04:13:06');
INSERT INTO `user_detail` VALUES (9, 9, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 11:22:00', '2022-06-02 11:22:00');
INSERT INTO `user_detail` VALUES (10, 10, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 17:33:38', '2022-06-03 17:33:38');
INSERT INTO `user_detail` VALUES (11, 11, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 01:22:29', '2022-06-04 01:22:29');
INSERT INTO `user_detail` VALUES (12, 12, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 18:59:59', '2022-05-31 18:59:59');
INSERT INTO `user_detail` VALUES (13, 13, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 10:28:13', '2022-05-31 10:28:13');
INSERT INTO `user_detail` VALUES (14, 14, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 23:50:42', '2022-06-05 23:50:42');
INSERT INTO `user_detail` VALUES (15, 15, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 11:16:17', '2022-06-03 11:16:17');
INSERT INTO `user_detail` VALUES (16, 16, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 17:04:24', '2022-06-04 17:04:24');
INSERT INTO `user_detail` VALUES (17, 17, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 21:28:26', '2022-06-03 21:28:26');
INSERT INTO `user_detail` VALUES (18, 18, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 17:00:21', '2022-06-01 17:00:21');
INSERT INTO `user_detail` VALUES (19, 19, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 17:22:04', '2022-06-02 17:22:04');
INSERT INTO `user_detail` VALUES (20, 20, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 20:32:52', '2022-06-02 20:32:52');
INSERT INTO `user_detail` VALUES (21, 21, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 16:19:07', '2022-06-02 16:19:07');
INSERT INTO `user_detail` VALUES (22, 22, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 15:51:50', '2022-06-01 15:51:50');
INSERT INTO `user_detail` VALUES (23, 23, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 07:01:52', '2022-05-31 07:01:52');
INSERT INTO `user_detail` VALUES (24, 24, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 07:19:01', '2022-05-31 07:19:01');
INSERT INTO `user_detail` VALUES (25, 25, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 02:36:13', '2022-06-04 02:36:13');
INSERT INTO `user_detail` VALUES (26, 26, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 11:54:38', '2022-05-31 11:54:38');
INSERT INTO `user_detail` VALUES (27, 27, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 11:10:49', '2022-05-31 11:10:49');
INSERT INTO `user_detail` VALUES (28, 28, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 07:01:02', '2022-06-04 07:01:02');
INSERT INTO `user_detail` VALUES (29, 29, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 01:49:19', '2022-06-01 01:49:19');
INSERT INTO `user_detail` VALUES (30, 30, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 08:18:17', '2022-06-01 08:18:17');
INSERT INTO `user_detail` VALUES (31, 31, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 22:00:28', '2022-06-03 22:00:28');
INSERT INTO `user_detail` VALUES (32, 32, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 08:43:54', '2022-06-04 08:43:54');
INSERT INTO `user_detail` VALUES (33, 33, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 05:39:30', '2022-05-31 05:39:30');
INSERT INTO `user_detail` VALUES (34, 34, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 22:40:34', '2022-06-03 22:40:34');
INSERT INTO `user_detail` VALUES (35, 35, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 12:19:11', '2022-06-01 12:19:11');
INSERT INTO `user_detail` VALUES (36, 36, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 19:42:19', '2022-06-02 19:42:19');
INSERT INTO `user_detail` VALUES (37, 37, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 04:02:23', '2022-06-04 04:02:23');
INSERT INTO `user_detail` VALUES (38, 38, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 17:22:26', '2022-05-31 17:22:26');
INSERT INTO `user_detail` VALUES (39, 39, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 17:09:22', '2022-06-04 17:09:22');
INSERT INTO `user_detail` VALUES (40, 40, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 11:30:44', '2022-06-02 11:30:44');
INSERT INTO `user_detail` VALUES (41, 41, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 09:25:11', '2022-05-31 09:25:11');
INSERT INTO `user_detail` VALUES (42, 42, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 07:50:26', '2022-06-05 07:50:26');
INSERT INTO `user_detail` VALUES (43, 43, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 06:59:25', '2022-06-04 06:59:25');
INSERT INTO `user_detail` VALUES (44, 44, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 11:28:03', '2022-06-03 11:28:03');
INSERT INTO `user_detail` VALUES (45, 45, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 09:27:06', '2022-06-05 09:27:06');
INSERT INTO `user_detail` VALUES (46, 46, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 22:25:41', '2022-06-02 22:25:41');
INSERT INTO `user_detail` VALUES (47, 47, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 14:47:45', '2022-05-31 14:47:45');
INSERT INTO `user_detail` VALUES (48, 48, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 06:29:05', '2022-06-02 06:29:05');
INSERT INTO `user_detail` VALUES (49, 49, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 01:19:33', '2022-06-02 01:19:33');
INSERT INTO `user_detail` VALUES (50, 50, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 00:17:29', '2022-06-01 00:17:29');
INSERT INTO `user_detail` VALUES (51, 51, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 21:06:02', '2022-06-04 21:06:02');
INSERT INTO `user_detail` VALUES (52, 52, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 09:46:02', '2022-06-02 09:46:02');
INSERT INTO `user_detail` VALUES (53, 53, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 08:53:29', '2022-06-04 08:53:29');
INSERT INTO `user_detail` VALUES (54, 54, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 21:15:45', '2022-06-01 21:15:45');
INSERT INTO `user_detail` VALUES (55, 55, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 15:33:26', '2022-06-02 15:33:26');
INSERT INTO `user_detail` VALUES (56, 56, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 11:17:21', '2022-06-04 11:17:21');
INSERT INTO `user_detail` VALUES (57, 57, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 08:30:23', '2022-06-05 08:30:23');
INSERT INTO `user_detail` VALUES (58, 58, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 22:32:26', '2022-06-01 22:32:26');
INSERT INTO `user_detail` VALUES (59, 59, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 17:18:56', '2022-06-05 17:18:56');
INSERT INTO `user_detail` VALUES (60, 60, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 03:28:01', '2022-05-31 03:28:01');
INSERT INTO `user_detail` VALUES (61, 61, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 02:18:13', '2022-06-05 02:18:13');
INSERT INTO `user_detail` VALUES (62, 62, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 05:33:24', '2022-05-31 05:33:24');
INSERT INTO `user_detail` VALUES (63, 63, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 07:55:10', '2022-06-04 07:55:10');
INSERT INTO `user_detail` VALUES (64, 64, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 16:46:33', '2022-06-01 16:46:33');
INSERT INTO `user_detail` VALUES (65, 65, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 03:47:27', '2022-06-01 03:47:27');
INSERT INTO `user_detail` VALUES (66, 66, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 12:32:11', '2022-05-31 12:32:11');
INSERT INTO `user_detail` VALUES (67, 67, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 12:09:33', '2022-05-31 12:09:33');
INSERT INTO `user_detail` VALUES (68, 68, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 21:42:24', '2022-06-04 21:42:24');
INSERT INTO `user_detail` VALUES (69, 69, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 12:03:37', '2022-06-01 12:03:37');
INSERT INTO `user_detail` VALUES (70, 70, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 03:27:51', '2022-06-05 03:27:51');
INSERT INTO `user_detail` VALUES (71, 71, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 19:40:00', '2022-06-04 19:40:00');
INSERT INTO `user_detail` VALUES (72, 72, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 00:23:54', '2022-06-05 00:23:54');
INSERT INTO `user_detail` VALUES (73, 73, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 20:27:31', '2022-05-31 20:27:31');
INSERT INTO `user_detail` VALUES (74, 74, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 17:30:48', '2022-06-03 17:30:48');
INSERT INTO `user_detail` VALUES (75, 75, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 05:11:27', '2022-06-01 05:11:27');
INSERT INTO `user_detail` VALUES (76, 76, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 12:12:13', '2022-05-31 12:12:13');
INSERT INTO `user_detail` VALUES (77, 77, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 07:27:20', '2022-06-05 07:27:20');
INSERT INTO `user_detail` VALUES (78, 78, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 17:00:20', '2022-06-05 17:00:20');
INSERT INTO `user_detail` VALUES (79, 79, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 09:28:43', '2022-06-04 09:28:43');
INSERT INTO `user_detail` VALUES (80, 80, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 10:14:04', '2022-06-01 10:14:04');
INSERT INTO `user_detail` VALUES (81, 81, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 19:04:44', '2022-06-02 19:04:44');
INSERT INTO `user_detail` VALUES (82, 82, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 06:45:52', '2022-06-04 06:45:52');
INSERT INTO `user_detail` VALUES (83, 83, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 20:25:52', '2022-05-31 20:25:52');
INSERT INTO `user_detail` VALUES (84, 84, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 18:19:54', '2022-06-01 18:19:54');
INSERT INTO `user_detail` VALUES (85, 85, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 15:13:55', '2022-06-04 15:13:55');
INSERT INTO `user_detail` VALUES (86, 86, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 15:34:25', '2022-06-01 15:34:25');
INSERT INTO `user_detail` VALUES (87, 87, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 03:35:02', '2022-06-03 03:35:02');
INSERT INTO `user_detail` VALUES (88, 88, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 04:08:01', '2022-05-31 04:08:01');
INSERT INTO `user_detail` VALUES (89, 89, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 22:24:09', '2022-06-02 22:24:09');
INSERT INTO `user_detail` VALUES (90, 90, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 12:55:50', '2022-06-04 12:55:50');
INSERT INTO `user_detail` VALUES (91, 91, 0000000000, 10, 0000000000, 0000000000, '2022-06-02 02:49:42', '2022-06-02 02:49:42');
INSERT INTO `user_detail` VALUES (92, 92, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 10:39:28', '2022-05-31 10:39:28');
INSERT INTO `user_detail` VALUES (93, 93, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 06:47:45', '2022-06-03 06:47:45');
INSERT INTO `user_detail` VALUES (94, 94, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 22:19:56', '2022-06-04 22:19:56');
INSERT INTO `user_detail` VALUES (95, 95, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 03:25:20', '2022-06-04 03:25:20');
INSERT INTO `user_detail` VALUES (96, 96, 0000000000, 10, 0000000000, 0000000000, '2022-06-01 08:12:20', '2022-06-01 08:12:20');
INSERT INTO `user_detail` VALUES (97, 97, 0000000000, 10, 0000000000, 0000000000, '2022-06-04 12:50:04', '2022-06-04 12:50:04');
INSERT INTO `user_detail` VALUES (98, 98, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 16:07:25', '2022-05-31 16:07:25');
INSERT INTO `user_detail` VALUES (99, 99, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 19:27:44', '2022-06-05 19:27:44');
INSERT INTO `user_detail` VALUES (100, 100, 0000000000, 10, 0000000000, 0000000000, '2022-06-03 16:58:42', '2022-06-03 16:58:42');
INSERT INTO `user_detail` VALUES (101, 101, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 05:18:12', '2022-05-31 05:18:12');
INSERT INTO `user_detail` VALUES (102, 102, 0000000000, 10, 0000000000, 0000000000, '2022-05-31 02:43:58', '2022-05-31 02:43:58');
INSERT INTO `user_detail` VALUES (103, 103, 0000000000, 10, 0000000000, 0000000000, '2022-06-05 08:23:17', '2022-06-05 08:23:17');

-- ----------------------------
-- Procedure structure for get_tot_amount
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_tot_amount`;
delimiter ;;
CREATE PROCEDURE `get_tot_amount`(IN `begin_time` datetime,IN `end_time` datetime,OUT `tot_amount` decimal)
BEGIN
SELECT SUM(tot_price) FROM trade_record 
	WHERE gmt_create BETWEEN begin_time and end_time 
	INTO tot_amount;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for goods_update_recently
-- ----------------------------
DROP PROCEDURE IF EXISTS `goods_update_recently`;
delimiter ;;
CREATE PROCEDURE `goods_update_recently`(IN `begin_time` datetime,IN `end_time` datetime)
BEGIN
DECLARE done BOOLEAN DEFAULT 0;
DECLARE u BIGINT;
DECLARE n CHAR(50);
DECLARE p DECIMAL(10,2);
DECLARE d LONGTEXT;
DECLARE time_cursor CURSOR FOR SELECT user_id,goods_name,goods_price,detail_message FROM goods WHERE gmt_create BETWEEN begin_time AND end_time;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
CREATE TABLE IF NOT EXISTS unaudited_goods(uid BIGINT,name CHAR(50),price DECIMAL(10,2),detail LONGTEXT);

open time_cursor;
REPEAT
    FETCH time_cursor INTO u,n,p,d;
    INSERT INTO unaudited_goods VALUES(u,n,p,d);
    UNTIL done END REPEAT;
CLOSE time_cursor;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table comment
-- ----------------------------
DROP TRIGGER IF EXISTS `comment_update_trig`;
delimiter ;;
CREATE TRIGGER `comment_update_trig` AFTER UPDATE ON `comment` FOR EACH ROW begin
update sub_comment sc set sc.deleted = 1
where sc.comment_id = NEW.id and NEW.deleted = 1;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order_info
-- ----------------------------
DROP TRIGGER IF EXISTS `orderinfo_update_trig`;
delimiter ;;
CREATE TRIGGER `orderinfo_update_trig` AFTER UPDATE ON `order_info` FOR EACH ROW begin
insert into trade_record(order_id,remitter_id,payee_id,tot_price,trading_time)
values(NEW.id,NEW.remitter_id,NEW.payee_id,NEW.tot_price,NOW());
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `user_insert_trig`;
delimiter ;;
CREATE TRIGGER `user_insert_trig` AFTER INSERT ON `user` FOR EACH ROW begin
insert into user_detail(user_id,onsale_count,integrity,star_count,trade_count,gmt_create,gmt_update)
values(NEW.id,0,10,0,0,NEW.gmt_create,gmt_create)
;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
