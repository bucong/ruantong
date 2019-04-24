/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50633
Source Host           : 47.100.51.191:3306
Source Database       : egg

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2019-04-24 20:31:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'bucong');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(2) DEFAULT NULL COMMENT '1主食，2海鲜，3配菜，4饮品',
  `name` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `discount` int(2) DEFAULT NULL COMMENT '折扣',
  `praise` int(10) DEFAULT NULL COMMENT '点赞',
  `desc` varchar(100) DEFAULT NULL COMMENT '简介',
  `salesVolume` int(10) DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '1', '米饭', '2.00', 'BC20190202163732793158491.jpeg', null, '49', '苏北大米，香飘万里', '652');
INSERT INTO `commodity` VALUES ('2', '2', '剁椒鱼头', '28.00', 'BC20190202163143401249789.jpeg', '8', '39', null, '32');
INSERT INTO `commodity` VALUES ('3', '2', '蒜蓉小龙虾', '52.00', 'BC20190202163804989438449.jpeg', null, '47', null, '41');
INSERT INTO `commodity` VALUES ('4', '2', '暴走皮皮虾', '60.00', 'BC20190202163836819406647.jpeg', '9', '73', null, '61');
INSERT INTO `commodity` VALUES ('6', '2', '蒜蓉粉丝鲍鱼', '40.00', 'BC20190202163911162935688.jpeg', '4', '76', '开胃鲍鱼，润喉好吃', '26');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgURL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'http://qiniu.kankanvideo.com/');

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `cId` int(6) DEFAULT NULL,
  `userId` int(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `imgs` longtext,
  `times` varchar(20) DEFAULT NULL,
  `star` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cId` (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '1', '3', '米饭不错，不干', null, '1539853345362', '5');
INSERT INTO `evaluate` VALUES ('2', '2', '5', '苏北大米，就是好吃', null, '1539953549362', '5');
INSERT INTO `evaluate` VALUES ('3', '1', '5', '米饭的很好，呦西', '', '1539953549362', '4');
INSERT INTO `evaluate` VALUES ('4', '3', '3', '正宗小龙虾，绝对美味', '', '1541050464522', '4');
INSERT INTO `evaluate` VALUES ('8', '4', '3', '皮皮虾，我们走', '', '1541055583129', '5');
INSERT INTO `evaluate` VALUES ('9', '3', '3', '挺不错的，蒜味十足，估计下午要有口气了', '', '1541065608198', '5');
INSERT INTO `evaluate` VALUES ('10', '1', '5', '米饭香喷喷', '', '1541496893094', '5');
INSERT INTO `evaluate` VALUES ('11', '4', '5', '好吃不腻，美食家', '', '1541497587839', '5');
INSERT INTO `evaluate` VALUES ('12', '1', '5', '米饭很正宗', 'BC20190202160639913394841.png', '1549094822206', '5');

-- ----------------------------
-- Table structure for imgs
-- ----------------------------
DROP TABLE IF EXISTS `imgs`;
CREATE TABLE `imgs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `type` int(2) DEFAULT NULL COMMENT '1首页展示图，2待定',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs
-- ----------------------------
INSERT INTO `imgs` VALUES ('1', '1', '5', 'BC20190202153443948343930.png');
INSERT INTO `imgs` VALUES ('2', '1', '3', 'BC20190202153454995982921.png');
INSERT INTO `imgs` VALUES ('3', '1', '1', 'BC20190202153340910177224.png');
INSERT INTO `imgs` VALUES ('4', '1', '6', 'BC20190202153449160559074.png');
INSERT INTO `imgs` VALUES ('5', '1', '2', 'BC20190202153345650480322.png');
INSERT INTO `imgs` VALUES ('6', '1', '4', 'BC20190202153458971814605.png');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL,
  `times` varchar(20) DEFAULT NULL,
  `state` int(2) DEFAULT NULL COMMENT '1未接单，2接单，3取消，4待评价，5结束',
  `list` longtext,
  `price` varchar(10) DEFAULT NULL,
  `store` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('10', '3', '1540950952784', '5', '[{\"id\":4,\"num\":1}]', '54', '虹桥店');
INSERT INTO `order` VALUES ('11', '3', '1540975595420', '5', '[{\"id\":3,\"num\":2}]', '104', '人民广场店');
INSERT INTO `order` VALUES ('12', '3', '1541122996272', '3', '[{\"id\":1,\"num\":1},{\"id\":3,\"num\":1}]', '54', '人民广场店');
INSERT INTO `order` VALUES ('16', '3', '1541470993154', '4', '[{\"id\":1,\"num\":1},{\"id\":3,\"num\":1},{\"id\":4,\"num\":1}]', '108', '人民广场店');
INSERT INTO `order` VALUES ('17', '6', '1541492666436', '3', '[{\"id\":1,\"num\":1},{\"id\":3,\"num\":1},{\"id\":6,\"num\":1}]', '70', '人民广场店');
INSERT INTO `order` VALUES ('18', '5', '1541496001127', '5', '[{\"id\":1,\"num\":1},{\"id\":4,\"num\":1},{\"id\":6,\"num\":1}]', '72', '人民广场店');
INSERT INTO `order` VALUES ('19', '5', '1541496310383', '5', '[{\"id\":1,\"num\":1},{\"id\":4,\"num\":1}]', '56', '人民广场店');
INSERT INTO `order` VALUES ('21', '5', '1541496502757', '1', '[{\"id\":1,\"num\":1},{\"id\":2,\"num\":2},{\"id\":3,\"num\":2}]', '150.8', '人民广场店');
INSERT INTO `order` VALUES ('25', '5', '1542250483359', '1', '[{\"id\":2,\"num\":1},{\"id\":4,\"num\":1}]', '76.4', '人民广场店');
INSERT INTO `order` VALUES ('26', '5', '1546507028018', '1', '[{\"id\":6,\"num\":1}]', '16', '人民广场店');
INSERT INTO `order` VALUES ('27', '5', '1549096974710', '1', '[{\"id\":3,\"num\":1}]', '52', '人民广场店');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `qqOpenId` varchar(36) DEFAULT NULL,
  `wxOpenId` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `figureurl` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '2807A306B0445956F956F2E29815E0B9', null, '时间ю说了真话∮', 'http://qzapp.qlogo.cn/qzapp/101479867/2807A306B0445956F956F2E29815E0B9/30', null);
INSERT INTO `user` VALUES ('5', '9B6C01E2ACF80B2D8307FD8125AFDAA7', null, '★不求※甚解', 'http://qzapp.qlogo.cn/qzapp/101479867/9B6C01E2ACF80B2D8307FD8125AFDAA7/30', null);
INSERT INTO `user` VALUES ('6', '2CF4184B2A6908068281A60E55D8FC0B', null, 'ℒ，梦月', 'http://qzapp.qlogo.cn/qzapp/101479867/2CF4184B2A6908068281A60E55D8FC0B/30', null);
