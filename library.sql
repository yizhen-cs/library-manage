/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 06/22/2022 13:18:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `adminType` int NULL DEFAULT NULL COMMENT '管理员类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;
-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '12345', 1);
INSERT INTO `admin` VALUES (2, 'zyz', '12345', 0);
INSERT INTO `admin` VALUES (4, 'stc', '12345', 0);

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `publish` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `isbn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书籍编号',
  `introduction` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `publish_date` date NULL DEFAULT NULL COMMENT '出版时间',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '书籍类型',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：0未借出，1已借出',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES (1, '算法导论', '托马斯·科尔曼', '麻省理工学院出版社', '100011', '关于计算机中数据结构与算法的图书', '英文', 142, '2009-07-01', 7, 0);
INSERT INTO `book_info` VALUES (2, '三国演义', '罗贯中', '清华大学出版社', '100012', '东汉末年分三国。。。', '中文', 48, '2018-03-30', 1, 1);
INSERT INTO `book_info` VALUES (3, '中华上下五千年', '程帆', '中国戏剧出版社', '100013', '我们伟大的祖国有非常悠久的历史。', '中文', 39, '2019-04-04', 2, 1);
INSERT INTO `book_info` VALUES (4, '资本论', '马克思', '原子能出版社', '100014', '马克思的剩余价值理论', '英文', 42, '2019-04-05', 5, 0);
INSERT INTO `book_info` VALUES (5, '经济学原理', '马歇尔', '机械工业出版社', '100015', '西方经济学界公认为划时代的著作', '英文', 45, '2020-04-06', 5, 0);
INSERT INTO `book_info` VALUES (6, '大变局下的中国法治', '李卫东', '北京大学出版社', '100016', '十大经典法学著作', '中文', 42, '2015-04-05', 4, 1);
INSERT INTO `book_info` VALUES (7, '如何创建图书管理系统', '张怡桢', '南开大学', '101011', '数据库与java的应用之图书管理系统', '中文', 0, '2022-06-03', 7, 0);

-- ----------------------------
-- Table structure for lend_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bookId` int(11) NULL DEFAULT NULL COMMENT '图书id',
  `readerId` int(11) NULL DEFAULT NULL COMMENT '读者id',
  `lendDate` datetime(0) NULL DEFAULT NULL COMMENT '借书时间',
  `backDate` datetime(0) NULL DEFAULT NULL COMMENT '还书时间',
  `backType` int(11) NULL DEFAULT NULL,
  `exceptRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借阅记录（谁在何时借走了什么书，并且有没有归还，归还时间多少）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_list
-- ----------------------------
INSERT INTO `lend_list` VALUES (15, 1, 1, '2022-07-04 10:07:31', '2022-07-04 21:09:27', 0, NULL);
INSERT INTO `lend_list` VALUES (36, 2, 2, '2022-07-04 21:48:17', '2022-07-04 21:50:00', 2, NULL);
INSERT INTO `lend_list` VALUES (37, 3, 3, '2022-07-04 21:50:22', '2022-07-04 21:50:32', 3, NULL);
INSERT INTO `lend_list` VALUES (38, 5, 1, '2022-07-05 21:35:35', '2022-07-05 21:35:47', 1, NULL);
INSERT INTO `lend_list` VALUES (39, 6, 3, '2022-07-05 21:42:35', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '公告发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (7, '数据库大作业之图书管理系统', '使用java与mysql结合生成图书管理系统的数据库java应用！', 'admin', '2022-06-21 20:41:38');
INSERT INTO `notice` VALUES (8, '2013747张怡桢的作业', '南开大学软件学院2013747张怡桢的作业', 'admin', '2022-06-21 20:42:29');
INSERT INTO `notice` VALUES (9, '使用普通管理员账号进行公告编写测试', '如题', 'admin', '2022-06-21 20:46:55');


-- ----------------------------
-- Table structure for reader_info
-- ----------------------------
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `registerDate` datetime(0) NULL DEFAULT NULL COMMENT '注册日期',
  `readerNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '读者编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '读者信息（包括登录账号密码等）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader_info
-- ----------------------------
INSERT INTO `reader_info` VALUES (1, 'zhangsan', '12345', '张三', '男', '2001-04-01', '江西南昌', '13767134834', 'yu123@163.com', '2021-04-02 13:18:59', '8120116041');
INSERT INTO `reader_info` VALUES (2, 'mary', '12345', '李四', '女', '2004-04-01', '湖北武汉', '15270839599', 'yx123@163.com', '2021-03-06 07:57:56', '8120116044');
INSERT INTO `reader_info` VALUES (3, 'cindy', '12345', '王五', '女', '2010-04-04', '北京海淀', '13834141133', 'zs1314@163.com', '2021-04-04 13:36:42', '8120116042');

-- ----------------------------
-- Table structure for type_info
-- ----------------------------
DROP TABLE IF EXISTS `type_info`;
CREATE TABLE `type_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书分类名称',
  `remarks` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_info
-- ----------------------------
INSERT INTO `type_info` VALUES (1, '文学类', '陶冶情操');
INSERT INTO `type_info` VALUES (2, '历史类', '了解历史文化');
INSERT INTO `type_info` VALUES (3, '工学类', '造火箭');
INSERT INTO `type_info` VALUES (4, '法学类', '学习法律，打官司');
INSERT INTO `type_info` VALUES (5, '经济学类', '搞经济');
INSERT INTO `type_info` VALUES (6, '统计学类', '学习统计，天下无敌');
INSERT INTO `type_info` VALUES (7, '计算机类', '越秃越聪明');

SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `book_info` ADD CONSTRAINT `book_type` FOREIGN KEY (`type_id`) REFERENCES `type_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `lend_list` ADD CONSTRAINT `bookid` FOREIGN KEY (`bookId`) REFERENCES `book_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `lend_list` ADD CONSTRAINT `readerid` FOREIGN KEY (`readerId`) REFERENCES `reader_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `notice` ADD CONSTRAINT `adminname` FOREIGN KEY (`author`) REFERENCES `admin` (`username`) ON DELETE RESTRICT ON UPDATE SET NULL;