/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : softwaretestsystem

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 16/01/2020 15:59:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bug
-- ----------------------------
DROP TABLE IF EXISTS `bug`;
CREATE TABLE `bug`  (
  `BUG编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BUG名称` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `类型` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `方案` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `执行时间` date NULL DEFAULT NULL,
  PRIMARY KEY (`BUG编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bug
-- ----------------------------
INSERT INTO `bug` VALUES ('BUG001', '前端异常', '安全漏洞', '已解决', '2019-12-30');
INSERT INTO `bug` VALUES ('BUG002', '内存泄漏', '环境错误', '已解决', '2019-10-20');
INSERT INTO `bug` VALUES ('BUG003', '后台错误', '代码错误', '待解决', '2019-10-25');
INSERT INTO `bug` VALUES ('BUG004', '后端异常', '环境错误', '已解决', '2019-10-26');

-- ----------------------------
-- Table structure for bug工作者关系
-- ----------------------------
DROP TABLE IF EXISTS `bug工作者关系`;
CREATE TABLE `bug工作者关系`  (
  `BUG编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `测试者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `开发者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`BUG编号`) USING BTREE,
  INDEX `测试者_bug工作者外键`(`测试者编号`) USING BTREE,
  INDEX `开发者_bug工作者外键`(`开发者编号`) USING BTREE,
  CONSTRAINT `bug_bug工作者外键` FOREIGN KEY (`BUG编号`) REFERENCES `bug` (`BUG编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `开发者_bug工作者外键` FOREIGN KEY (`开发者编号`) REFERENCES `开发者` (`开发者编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `测试者_bug工作者外键` FOREIGN KEY (`测试者编号`) REFERENCES `测试者` (`测试者编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bug工作者关系
-- ----------------------------
INSERT INTO `bug工作者关系` VALUES ('BUG001', 'CSZ003', 'KFZ001');
INSERT INTO `bug工作者关系` VALUES ('BUG002', 'CSZ003', 'KFZ002');
INSERT INTO `bug工作者关系` VALUES ('BUG003', 'CSZ002', 'KFZ003');
INSERT INTO `bug工作者关系` VALUES ('BUG004', 'CSZ001', 'KFZ001');

-- ----------------------------
-- Table structure for 产品经理
-- ----------------------------
DROP TABLE IF EXISTS `产品经理`;
CREATE TABLE `产品经理`  (
  `产品经理编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `产品经理姓名` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `产品经理密码` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `产品经理性别` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `产品经理邮箱` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `部门` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`产品经理编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 产品经理
-- ----------------------------
INSERT INTO `产品经理` VALUES ('CPJL001', 'Nick', '12345', '男', '321@qq.com', 'productManager');
INSERT INTO `产品经理` VALUES ('CPJL002', 'Juddy', '12345', '女', '666@qq.com', 'productManager');
INSERT INTO `产品经理` VALUES ('CPJL003', 'Ben', '12345', '男', '765@qq.com', 'productManager');

-- ----------------------------
-- Table structure for 任务
-- ----------------------------
DROP TABLE IF EXISTS `任务`;
CREATE TABLE `任务`  (
  `任务编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `任务名称` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `完成状态` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `开始日期` date NULL DEFAULT NULL,
  `截止日期` date NULL DEFAULT NULL,
  PRIMARY KEY (`任务编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 任务
-- ----------------------------
INSERT INTO `任务` VALUES ('RW001', '音频维护', '未激活', '2019-10-11', '2019-10-26');
INSERT INTO `任务` VALUES ('RW002', '后端开发', '未激活', '2019-10-11', '2019-10-23');
INSERT INTO `任务` VALUES ('RW003', '服务器搭建', '未激活', '2019-10-11', '2019-10-22');
INSERT INTO `任务` VALUES ('RW004', '数据库开发', '未激活', '2019-10-11', '2019-10-23');
INSERT INTO `任务` VALUES ('RW005', '游戏脚本编写', '未激活', '2019-10-01', '2019-11-30');
INSERT INTO `任务` VALUES ('RW006', '测试脚本编写', '进行中', '2019-10-18', '2019-11-25');
INSERT INTO `任务` VALUES ('RW007', '大数据统计', '已完成', '2019-10-26', '2019-12-28');
INSERT INTO `任务` VALUES ('RW009', '121123123', '正常', '2019-11-18', '2020-01-25');

-- ----------------------------
-- Table structure for 任务员工关系
-- ----------------------------
DROP TABLE IF EXISTS `任务员工关系`;
CREATE TABLE `任务员工关系`  (
  `任务编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `产品经理编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `开发者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `测试者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`任务编号`) USING BTREE,
  INDEX `产品经理_任务员工外键`(`产品经理编号`) USING BTREE,
  INDEX `开发者_任务员工外键`(`开发者编号`) USING BTREE,
  INDEX `测试者_任务员工外键`(`测试者编号`) USING BTREE,
  CONSTRAINT `产品经理_任务员工外键` FOREIGN KEY (`产品经理编号`) REFERENCES `产品经理` (`产品经理编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `任务_任务员工外键` FOREIGN KEY (`任务编号`) REFERENCES `任务` (`任务编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `开发者_任务员工外键` FOREIGN KEY (`开发者编号`) REFERENCES `开发者` (`开发者编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `测试者_任务员工外键` FOREIGN KEY (`测试者编号`) REFERENCES `测试者` (`测试者编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 任务员工关系
-- ----------------------------
INSERT INTO `任务员工关系` VALUES ('RW001', 'CPJL001', 'KFZ002', 'CSZ003');
INSERT INTO `任务员工关系` VALUES ('RW002', 'CPJL002', NULL, NULL);
INSERT INTO `任务员工关系` VALUES ('RW003', 'CPJL002', NULL, NULL);
INSERT INTO `任务员工关系` VALUES ('RW004', 'CPJL002', NULL, NULL);
INSERT INTO `任务员工关系` VALUES ('RW005', 'CPJL001', 'KFZ001', 'CSZ003');
INSERT INTO `任务员工关系` VALUES ('RW006', 'CPJL001', NULL, NULL);
INSERT INTO `任务员工关系` VALUES ('RW007', 'CPJL001', NULL, NULL);
INSERT INTO `任务员工关系` VALUES ('RW009', 'CPJL001', NULL, NULL);

-- ----------------------------
-- Table structure for 开发者
-- ----------------------------
DROP TABLE IF EXISTS `开发者`;
CREATE TABLE `开发者`  (
  `开发者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `开发者姓名` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `开发者密码` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `开发者性别` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `开发者邮箱` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `部门` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`开发者编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 开发者
-- ----------------------------
INSERT INTO `开发者` VALUES ('KFZ001', 'Tony', '12345', '男', '111@qq.com', 'developer');
INSERT INTO `开发者` VALUES ('KFZ002', 'Bob', '12345', '男', '222@qq.com', 'developer');
INSERT INTO `开发者` VALUES ('KFZ003', 'Kitty', '12345', '女', '333@qq.com', 'developer');

-- ----------------------------
-- Table structure for 测试用例
-- ----------------------------
DROP TABLE IF EXISTS `测试用例`;
CREATE TABLE `测试用例`  (
  `测试用例编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `测试用例名称` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `类型` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `结果` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `状态` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `执行时间` date NULL DEFAULT NULL,
  PRIMARY KEY (`测试用例编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 测试用例
-- ----------------------------
INSERT INTO `测试用例` VALUES ('CSYL001', '登录测试', '功能测试', '失败', '正常', '2019-10-27');
INSERT INTO `测试用例` VALUES ('CSYL002', '账户系信息修改测试', '功能测试', '失败', '正常', '2019-10-27');
INSERT INTO `测试用例` VALUES ('CSYL003', '项目信息测试', '程序测试', '成功', '正常', '2019-10-28');
INSERT INTO `测试用例` VALUES ('CSYL004', 'SQL注入', '安全漏洞', '失败', '筹划中', '2019-10-26');
INSERT INTO `测试用例` VALUES ('CSYL005', '内网穿透', '安全漏洞', '正常', '正常', '2019-10-30');
INSERT INTO `测试用例` VALUES ('CSYL006', '123', '安全漏洞', '失败', '筹划中', '2019-10-26');

-- ----------------------------
-- Table structure for 测试用例测试者关系
-- ----------------------------
DROP TABLE IF EXISTS `测试用例测试者关系`;
CREATE TABLE `测试用例测试者关系`  (
  `测试用例编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `测试者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `指定测试者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`测试用例编号`) USING BTREE,
  INDEX `测试者_测试者测试用例外键`(`测试者编号`) USING BTREE,
  INDEX `指定测试者_测试者测试用例外键`(`指定测试者编号`) USING BTREE,
  CONSTRAINT `指定测试者_测试者测试用例外键` FOREIGN KEY (`指定测试者编号`) REFERENCES `测试者` (`测试者编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `测试用例_测试者测试用例外键` FOREIGN KEY (`测试用例编号`) REFERENCES `测试用例` (`测试用例编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `测试者_测试者测试用例外键` FOREIGN KEY (`测试者编号`) REFERENCES `测试者` (`测试者编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 测试用例测试者关系
-- ----------------------------
INSERT INTO `测试用例测试者关系` VALUES ('CSYL001', 'CSZ001', NULL);
INSERT INTO `测试用例测试者关系` VALUES ('CSYL002', 'CSZ002', 'CSZ003');
INSERT INTO `测试用例测试者关系` VALUES ('CSYL003', 'CSZ001', 'CSZ001');
INSERT INTO `测试用例测试者关系` VALUES ('CSYL004', 'CSZ003', 'CSZ001');
INSERT INTO `测试用例测试者关系` VALUES ('CSYL005', 'CSZ001', 'CSZ002');
INSERT INTO `测试用例测试者关系` VALUES ('CSYL006', 'CSZ003', 'CSZ001');

-- ----------------------------
-- Table structure for 测试者
-- ----------------------------
DROP TABLE IF EXISTS `测试者`;
CREATE TABLE `测试者`  (
  `测试者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `测试者姓名` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `测试者密码` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `测试者性别` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `测试者邮箱` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `部门` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`测试者编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 测试者
-- ----------------------------
INSERT INTO `测试者` VALUES ('CSZ001', 'Hala', '12345', '女', '231@qq.com', 'tester');
INSERT INTO `测试者` VALUES ('CSZ002', 'Yola', '12345', '女', '132@qq.com', 'tester');
INSERT INTO `测试者` VALUES ('CSZ003', 'Robby', '12345', '男', '332@qq.com', 'tester');

-- ----------------------------
-- Table structure for 管理员
-- ----------------------------
DROP TABLE IF EXISTS `管理员`;
CREATE TABLE `管理员`  (
  `管理员编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `管理员姓名` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `管理员密码` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `管理员性别` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `管理员邮箱` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `部门` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`管理员编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 管理员
-- ----------------------------
INSERT INTO `管理员` VALUES ('GLY001', 'admin', '12345', '男', '123@qq.com', 'admin');

-- ----------------------------
-- Table structure for 项目
-- ----------------------------
DROP TABLE IF EXISTS `项目`;
CREATE TABLE `项目`  (
  `项目编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `项目名称` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `开始日期` date NULL DEFAULT NULL,
  `截止日期` date NULL DEFAULT NULL,
  `完成状态` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`项目编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 项目
-- ----------------------------
INSERT INTO `项目` VALUES ('XM001', '微信小程序', '2019-10-10', '2019-11-18', '已完成');
INSERT INTO `项目` VALUES ('XM002', '王者荣耀', '2019-10-01', '2019-12-28', '进行中');
INSERT INTO `项目` VALUES ('XM003', '吃鸡', '2019-10-26', '2020-01-08', '筹划中');
INSERT INTO `项目` VALUES ('XM004', 'qq堂', '2019-11-18', '2020-01-25', '筹划中');

-- ----------------------------
-- Table structure for 项目产品经理关系
-- ----------------------------
DROP TABLE IF EXISTS `项目产品经理关系`;
CREATE TABLE `项目产品经理关系`  (
  `项目编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `产品经理编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `项目产品经理索引`(`项目编号`, `产品经理编号`) USING BTREE,
  INDEX `产品经理_项目产品经理外键`(`产品经理编号`) USING BTREE,
  CONSTRAINT `产品经理_项目产品经理外键` FOREIGN KEY (`产品经理编号`) REFERENCES `产品经理` (`产品经理编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `项目_项目产品经理外键` FOREIGN KEY (`项目编号`) REFERENCES `项目` (`项目编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 项目产品经理关系
-- ----------------------------
INSERT INTO `项目产品经理关系` VALUES ('XM001', 'CPJL001');
INSERT INTO `项目产品经理关系` VALUES ('XM002', 'CPJL001');
INSERT INTO `项目产品经理关系` VALUES ('XM001', 'CPJL002');

-- ----------------------------
-- Table structure for 项目任务关系
-- ----------------------------
DROP TABLE IF EXISTS `项目任务关系`;
CREATE TABLE `项目任务关系`  (
  `项目编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `任务编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`任务编号`) USING BTREE,
  INDEX `项目_项目任务外键`(`项目编号`) USING BTREE,
  CONSTRAINT `任务_项目任务外键` FOREIGN KEY (`任务编号`) REFERENCES `任务` (`任务编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `项目_项目任务外键` FOREIGN KEY (`项目编号`) REFERENCES `项目` (`项目编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 项目任务关系
-- ----------------------------
INSERT INTO `项目任务关系` VALUES ('XM001', 'RW001');
INSERT INTO `项目任务关系` VALUES ('XM001', 'RW002');
INSERT INTO `项目任务关系` VALUES ('XM001', 'RW003');
INSERT INTO `项目任务关系` VALUES ('XM001', 'RW004');
INSERT INTO `项目任务关系` VALUES ('XM001', 'RW007');
INSERT INTO `项目任务关系` VALUES ('XM002', 'RW005');
INSERT INTO `项目任务关系` VALUES ('XM002', 'RW006');
INSERT INTO `项目任务关系` VALUES ('XM002', 'RW009');

-- ----------------------------
-- Table structure for 项目开发者关系
-- ----------------------------
DROP TABLE IF EXISTS `项目开发者关系`;
CREATE TABLE `项目开发者关系`  (
  `项目编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `开发者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `项目开发者索引`(`项目编号`, `开发者编号`) USING BTREE,
  INDEX `开发者1_项目开发者外键`(`开发者编号`) USING BTREE,
  CONSTRAINT `开发者1_项目开发者外键` FOREIGN KEY (`开发者编号`) REFERENCES `开发者` (`开发者编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `项目_项目开发者外键` FOREIGN KEY (`项目编号`) REFERENCES `项目` (`项目编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 项目开发者关系
-- ----------------------------
INSERT INTO `项目开发者关系` VALUES ('XM001', 'KFZ001');
INSERT INTO `项目开发者关系` VALUES ('XM002', 'KFZ001');
INSERT INTO `项目开发者关系` VALUES ('XM002', 'KFZ002');
INSERT INTO `项目开发者关系` VALUES ('XM001', 'KFZ003');

-- ----------------------------
-- Table structure for 项目测试者关系
-- ----------------------------
DROP TABLE IF EXISTS `项目测试者关系`;
CREATE TABLE `项目测试者关系`  (
  `项目编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `测试者编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `项目测试者索引`(`项目编号`, `测试者编号`) USING BTREE,
  INDEX `测试者_项目测试者外键`(`测试者编号`) USING BTREE,
  CONSTRAINT `测试者_项目测试者外键` FOREIGN KEY (`测试者编号`) REFERENCES `测试者` (`测试者编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `项目_项目测试者外键` FOREIGN KEY (`项目编号`) REFERENCES `项目` (`项目编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 项目测试者关系
-- ----------------------------
INSERT INTO `项目测试者关系` VALUES ('XM001', 'CSZ001');
INSERT INTO `项目测试者关系` VALUES ('XM001', 'CSZ002');

-- ----------------------------
-- Table structure for 项目经理
-- ----------------------------
DROP TABLE IF EXISTS `项目经理`;
CREATE TABLE `项目经理`  (
  `项目经理编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `项目经理姓名` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `项目经理密码` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `项目经理性别` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `项目经理邮箱` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `部门` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`项目经理编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 项目经理
-- ----------------------------
INSERT INTO `项目经理` VALUES ('XMJL001', 'Roman', '123456', '男', '234@qq.com', 'projectManager');
INSERT INTO `项目经理` VALUES ('XMJL002', 'Alice', '123456', '女', '456@qq.com', 'projectManager');

-- ----------------------------
-- Table structure for 项目经理关系
-- ----------------------------
DROP TABLE IF EXISTS `项目经理关系`;
CREATE TABLE `项目经理关系`  (
  `项目编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `项目经理编号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `项目经理索引`(`项目编号`, `项目经理编号`) USING BTREE,
  INDEX `项目经理_项目经理关系外键`(`项目经理编号`) USING BTREE,
  CONSTRAINT `项目_项目经理关系外键` FOREIGN KEY (`项目编号`) REFERENCES `项目` (`项目编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `项目经理_项目经理关系外键` FOREIGN KEY (`项目经理编号`) REFERENCES `项目经理` (`项目经理编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 项目经理关系
-- ----------------------------
INSERT INTO `项目经理关系` VALUES ('XM001', 'XMJL001');
INSERT INTO `项目经理关系` VALUES ('XM002', 'XMJL002');

-- ----------------------------
-- View structure for bug总视图
-- ----------------------------
DROP VIEW IF EXISTS `bug总视图`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `bug总视图` AS select `bug`.`BUG编号` AS `BUG编号`,`bug`.`BUG名称` AS `BUG名称`,`bug`.`类型` AS `类型`,`测试者`.`测试者编号` AS `测试者编号`,`测试者`.`测试者姓名` AS `测试者姓名`,`开发者`.`开发者编号` AS `开发者编号`,`开发者`.`开发者姓名` AS `开发者姓名`,`bug`.`方案` AS `方案`,`bug`.`执行时间` AS `执行时间` from ((`bug` join `测试者`) join (`bug工作者关系` left join `开发者` on((`开发者`.`开发者编号` = `bug工作者关系`.`开发者编号`)))) where ((`bug`.`BUG编号` = `bug工作者关系`.`BUG编号`) and (`测试者`.`测试者编号` = `bug工作者关系`.`测试者编号`));

-- ----------------------------
-- View structure for 任务总视图
-- ----------------------------
DROP VIEW IF EXISTS `任务总视图`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `任务总视图` AS select `任务`.`任务编号` AS `任务编号`,`项目任务关系`.`项目编号` AS `项目编号`,`任务`.`任务名称` AS `任务名称`,`项目经理`.`项目经理编号` AS `项目经理编号`,`项目经理`.`项目经理姓名` AS `项目经理姓名`,`产品经理`.`产品经理编号` AS `产品经理编号`,`产品经理`.`产品经理姓名` AS `产品经理姓名`,`开发者`.`开发者编号` AS `开发者编号`,`开发者`.`开发者姓名` AS `开发者姓名`,`测试者`.`测试者编号` AS `测试者编号`,`测试者`.`测试者姓名` AS `测试者姓名`,`任务`.`完成状态` AS `完成状态`,`任务`.`开始日期` AS `开始日期`,`任务`.`截止日期` AS `截止日期` from ((((((`任务` join `项目任务关系`) join `项目经理`) join `产品经理`) join `项目经理关系`) join `项目`) join (`任务员工关系` left join (`开发者` join `测试者`) on(((`开发者`.`开发者编号` = `任务员工关系`.`开发者编号`) and (`测试者`.`测试者编号` = `任务员工关系`.`测试者编号`))))) where ((`任务`.`任务编号` = `任务员工关系`.`任务编号`) and (`项目任务关系`.`任务编号` = `任务员工关系`.`任务编号`) and (`项目任务关系`.`项目编号` = `项目`.`项目编号`) and (`项目`.`项目编号` = `项目经理关系`.`项目编号`) and (`项目经理关系`.`项目经理编号` = `项目经理`.`项目经理编号`) and (`产品经理`.`产品经理编号` = `任务员工关系`.`产品经理编号`));

-- ----------------------------
-- View structure for 员工总表
-- ----------------------------
DROP VIEW IF EXISTS `员工总表`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `员工总表` AS select `管理员`.`管理员编号` AS `管理员编号`,`管理员`.`管理员姓名` AS `管理员姓名`,`管理员`.`管理员密码` AS `管理员密码`,`管理员`.`管理员性别` AS `管理员性别`,`管理员`.`管理员邮箱` AS `管理员邮箱`,`管理员`.`部门` AS `部门` from `管理员` union select `项目经理`.`项目经理编号` AS `项目经理编号`,`项目经理`.`项目经理姓名` AS `项目经理姓名`,`项目经理`.`项目经理密码` AS `项目经理密码`,`项目经理`.`项目经理性别` AS `项目经理性别`,`项目经理`.`项目经理邮箱` AS `项目经理邮箱`,`项目经理`.`部门` AS `部门` from `项目经理` union select `产品经理`.`产品经理编号` AS `产品经理编号`,`产品经理`.`产品经理姓名` AS `产品经理姓名`,`产品经理`.`产品经理密码` AS `产品经理密码`,`产品经理`.`产品经理性别` AS `产品经理性别`,`产品经理`.`产品经理邮箱` AS `产品经理邮箱`,`产品经理`.`部门` AS `部门` from `产品经理` union select `开发者`.`开发者编号` AS `开发者编号`,`开发者`.`开发者姓名` AS `开发者姓名`,`开发者`.`开发者密码` AS `开发者密码`,`开发者`.`开发者性别` AS `开发者性别`,`开发者`.`开发者邮箱` AS `开发者邮箱`,`开发者`.`部门` AS `部门` from `开发者` union select `测试者`.`测试者编号` AS `测试者编号`,`测试者`.`测试者姓名` AS `测试者姓名`,`测试者`.`测试者密码` AS `测试者密码`,`测试者`.`测试者性别` AS `测试者性别`,`测试者`.`测试者邮箱` AS `测试者邮箱`,`测试者`.`部门` AS `部门` from `测试者`;

-- ----------------------------
-- View structure for 测试用例总视图
-- ----------------------------
DROP VIEW IF EXISTS `测试用例总视图`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `测试用例总视图` AS select `测试用例`.`测试用例编号` AS `测试用例编号`,`测试用例`.`测试用例名称` AS `测试用例名称`,`测试用例`.`类型` AS `类型`,`c`.`测试者编号` AS `创建人编号`,`c`.`测试者姓名` AS `创建人`,`d`.`测试者编号` AS `执行人编号`,`d`.`测试者姓名` AS `执行人`,`测试用例`.`结果` AS `结果`,`测试用例`.`状态` AS `状态`,`测试用例`.`执行时间` AS `执行时间` from ((`测试用例` join `测试者` `c`) join (`测试用例测试者关系` left join `测试者` `d` on((`d`.`测试者编号` = `测试用例测试者关系`.`指定测试者编号`)))) where ((`测试用例`.`测试用例编号` = `测试用例测试者关系`.`测试用例编号`) and (`c`.`测试者编号` = `测试用例测试者关系`.`测试者编号`));

-- ----------------------------
-- View structure for 项目员工关系视图新版
-- ----------------------------
DROP VIEW IF EXISTS `项目员工关系视图新版`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `项目员工关系视图新版` AS select `项目经理`.`项目经理编号` AS `项目经理编号`,`项目经理`.`项目经理姓名` AS `项目经理姓名`,`项目经理`.`项目经理密码` AS `项目经理密码`,`项目经理`.`项目经理性别` AS `项目经理性别`,`项目经理`.`项目经理邮箱` AS `项目经理邮箱`,`项目经理`.`部门` AS `部门`,`项目经理关系`.`项目编号` AS `项目编号` from (`项目经理` join `项目经理关系`) where (`项目经理`.`项目经理编号` = `项目经理关系`.`项目经理编号`) union select `产品经理`.`产品经理编号` AS `产品经理编号`,`产品经理`.`产品经理姓名` AS `产品经理姓名`,`产品经理`.`产品经理密码` AS `产品经理密码`,`产品经理`.`产品经理性别` AS `产品经理性别`,`产品经理`.`产品经理邮箱` AS `产品经理邮箱`,`产品经理`.`部门` AS `部门`,`项目产品经理关系`.`项目编号` AS `项目编号` from (`产品经理` join `项目产品经理关系`) where (`产品经理`.`产品经理编号` = `项目产品经理关系`.`产品经理编号`) union select `开发者`.`开发者编号` AS `开发者编号`,`开发者`.`开发者姓名` AS `开发者姓名`,`开发者`.`开发者密码` AS `开发者密码`,`开发者`.`开发者性别` AS `开发者性别`,`开发者`.`开发者邮箱` AS `开发者邮箱`,`开发者`.`部门` AS `部门`,`项目开发者关系`.`项目编号` AS `项目编号` from (`开发者` join `项目开发者关系`) where (`开发者`.`开发者编号` = `项目开发者关系`.`开发者编号`) union select `测试者`.`测试者编号` AS `测试者编号`,`测试者`.`测试者姓名` AS `测试者姓名`,`测试者`.`测试者密码` AS `测试者密码`,`测试者`.`测试者性别` AS `测试者性别`,`测试者`.`测试者邮箱` AS `测试者邮箱`,`测试者`.`部门` AS `部门`,`项目测试者关系`.`项目编号` AS `项目编号` from (`测试者` join `项目测试者关系`) where (`测试者`.`测试者编号` = `项目测试者关系`.`测试者编号`);

-- ----------------------------
-- View structure for 项目员工关系视图老版
-- ----------------------------
DROP VIEW IF EXISTS `项目员工关系视图老版`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `项目员工关系视图老版` AS select `项目经理关系`.`项目编号` AS `项目编号`,`员工总表`.`编号` AS `编号`,`员工总表`.`姓名` AS `姓名`,`员工总表`.`密码` AS `密码`,`员工总表`.`性别` AS `性别`,`员工总表`.`邮箱` AS `邮箱` from (`项目经理关系` join `员工总表`) where (`项目经理关系`.`项目经理编号` = `员工总表`.`编号`) union select `项目产品经理关系`.`项目编号` AS `项目编号`,`员工总表`.`编号` AS `编号`,`员工总表`.`姓名` AS `姓名`,`员工总表`.`密码` AS `密码`,`员工总表`.`性别` AS `性别`,`员工总表`.`邮箱` AS `邮箱` from (`项目产品经理关系` join `员工总表`) where (`项目产品经理关系`.`产品经理编号` = `员工总表`.`编号`) union select `项目开发者关系`.`项目编号` AS `项目编号`,`员工总表`.`编号` AS `编号`,`员工总表`.`姓名` AS `姓名`,`员工总表`.`密码` AS `密码`,`员工总表`.`性别` AS `性别`,`员工总表`.`邮箱` AS `邮箱` from (`项目开发者关系` join `员工总表`) where (`项目开发者关系`.`开发者编号` = `员工总表`.`编号`) union select `项目测试者关系`.`项目编号` AS `项目编号`,`员工总表`.`编号` AS `编号`,`员工总表`.`姓名` AS `姓名`,`员工总表`.`密码` AS `密码`,`员工总表`.`性别` AS `性别`,`员工总表`.`邮箱` AS `邮箱` from (`项目测试者关系` join `员工总表`) where (`项目测试者关系`.`测试者编号` = `员工总表`.`编号`);

SET FOREIGN_KEY_CHECKS = 1;
