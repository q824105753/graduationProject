/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : drug

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-11-26 18:35:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_business
-- ----------------------------
DROP TABLE IF EXISTS `t_business`;
CREATE TABLE `t_business` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '厂商表',
  `bname` varchar(255) DEFAULT NULL COMMENT '厂家名称',
  `btel` varchar(255) DEFAULT NULL COMMENT '厂家联系电话',
  `b_address` varchar(255) DEFAULT NULL COMMENT '厂家地址',
  `is_del` int(11) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_business
-- ----------------------------
INSERT INTO `t_business` VALUES ('1', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('2', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('3', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('4', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('5', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('6', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('7', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('8', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('9', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('10', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('11', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('12', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('13', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('14', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('15', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('16', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('17', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('18', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('19', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('20', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('21', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('22', '1', '1', '1', '0');
INSERT INTO `t_business` VALUES ('23', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别表',
  `cname` varchar(255) DEFAULT NULL COMMENT '类别名称',
  `is_del` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('32', '颗粒剂', '0');
INSERT INTO `t_category` VALUES ('33', '丸剂', '0');
INSERT INTO `t_category` VALUES ('34', '散剂', '0');
INSERT INTO `t_category` VALUES ('35', '酊剂', '0');
INSERT INTO `t_category` VALUES ('36', '片剂', '0');
INSERT INTO `t_category` VALUES ('37', '胶囊剂', '0');

-- ----------------------------
-- Table structure for t_drug
-- ----------------------------
DROP TABLE IF EXISTS `t_drug`;
CREATE TABLE `t_drug` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '药品表',
  `dname` varchar(255) DEFAULT NULL COMMENT '药品名称',
  `is_del` int(11) DEFAULT NULL,
  `dprice` double(10,2) DEFAULT NULL COMMENT '价格',
  `produce_date` date DEFAULT NULL COMMENT '生产日期',
  `use_time` int(11) DEFAULT NULL COMMENT '保质期',
  `cid` int(11) DEFAULT NULL COMMENT '类别id',
  `bid` int(11) DEFAULT NULL COMMENT '厂家id',
  `dsize` varchar(255) DEFAULT NULL COMMENT '规格',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `component` varchar(255) DEFAULT NULL COMMENT '药品成分',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_drug
-- ----------------------------
INSERT INTO `t_drug` VALUES ('1', '1', '1', '1.00', '2018-11-30', '123', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('2', '1', '1', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('3', '1', '1', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('4', '1', '1', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('5', '1', '1', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('6', '1', '0', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('7', '1', '0', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('8', '1', '1', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('9', '1', '1', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('10', '1', '1', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('11', '1', '0', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('12', '1', '0', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('13', '12313213', '0', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('14', '1', '0', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('15', '1', '0', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('16', '1', '0', '1.00', '2018-11-30', '20181129', '1', '1', '1', '1', '1');
INSERT INTO `t_drug` VALUES ('17', '132', '0', '213.00', '2018-11-23', '123', '19', '18', '123', null, '123');

-- ----------------------------
-- Table structure for t_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_stock`;
CREATE TABLE `t_stock` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存表',
  `did` int(11) DEFAULT NULL COMMENT '药品id',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `update_time` datetime DEFAULT NULL,
  `uid` int(255) DEFAULT NULL COMMENT '修改人id',
  `low_limit` int(11) DEFAULT NULL COMMENT '库存低限',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stock
-- ----------------------------
INSERT INTO `t_stock` VALUES ('1', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('2', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('3', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('4', '1', '1123', '2018-11-26 17:39:44', '1', '1123');
INSERT INTO `t_stock` VALUES ('5', '1', '2314', '2018-11-26 17:38:13', '1', '1234');
INSERT INTO `t_stock` VALUES ('6', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('7', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('8', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('9', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('10', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('11', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('12', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('13', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('14', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('15', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('16', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('17', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('18', '1', '1', '2018-12-26 10:58:41', '1', '1');
INSERT INTO `t_stock` VALUES ('19', '7', '132', null, null, '123');
INSERT INTO `t_stock` VALUES ('20', '12', '123', null, null, '123213');
INSERT INTO `t_stock` VALUES ('21', '14', '123', '2018-11-26 18:32:22', null, '1231231');
INSERT INTO `t_stock` VALUES ('22', '11', '123', '2018-11-26 18:32:51', null, '12312312');
INSERT INTO `t_stock` VALUES ('23', '12', '123', '2018-11-26 18:35:16', '1', '1231231');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL COMMENT '用户名',
  `upwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `type` varchar(255) DEFAULT NULL COMMENT '身份（管理员，用户）',
  `is_del` int(11) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `utel` varchar(255) DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', 'admin', '0', 'admin', '12345678910');
INSERT INTO `t_user` VALUES ('5', '1', '1,1', null, null, '1', '1');
INSERT INTO `t_user` VALUES ('6', null, null, 'user', '0', null, null);
