/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : bidding

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-11-08 22:09:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressId` bigint(20) NOT NULL AUTO_INCREMENT,
  `addressname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('2', '黑龙江省伊春市南岔区');
INSERT INTO `address` VALUES ('3', '黑龙江省大庆市萨尔图区');
INSERT INTO `address` VALUES ('4', '北京市朝阳区朝阳门350号');
INSERT INTO `address` VALUES ('5', '北京市大兴区');
INSERT INTO `address` VALUES ('6', '北京市海淀区中关村666号');
INSERT INTO `address` VALUES ('7', '北京市海淀区苏州街530号');
INSERT INTO `address` VALUES ('8', '黑龙江省哈尔滨市哈西大街340号');
INSERT INTO `address` VALUES ('9', '北京市东城区220号');
INSERT INTO `address` VALUES ('10', '北京市西城区120号');
INSERT INTO `address` VALUES ('15', '北京市朝阳区国贸230号');
INSERT INTO `address` VALUES ('17', '北京市朝阳区呼家楼670号');
INSERT INTO `address` VALUES ('21', '北京市昌平区230号');
INSERT INTO `address` VALUES ('22', '北京市海淀区永丰屯888号');
INSERT INTO `address` VALUES ('27', '北京市海淀区西二旗888号');
INSERT INTO `address` VALUES ('29', '浙江省杭州市余杭区666号');
INSERT INTO `address` VALUES ('33', '浙江省杭州市萧山区888号');
INSERT INTO `address` VALUES ('34', '北京市海淀区苏州街531号');
INSERT INTO `address` VALUES ('35', '辽宁省大连市甘井子区888号');
INSERT INTO `address` VALUES ('36', '北京市朝阳区朝阳门外大街230号');
INSERT INTO `address` VALUES ('37', '北京市昌平区888号');
INSERT INTO `address` VALUES ('38', '北京市北土城230号');
INSERT INTO `address` VALUES ('39', '北京市石景山区888号');
INSERT INTO `address` VALUES ('40', '北京市海淀区六道口888号');
INSERT INTO `address` VALUES ('41', 'sadsadsa');
INSERT INTO `address` VALUES ('42', '哎傻逼度假吧俺是撒');
INSERT INTO `address` VALUES ('43', '阿萨德俺是');
INSERT INTO `address` VALUES ('44', '萨达');
INSERT INTO `address` VALUES ('45', '哒哒');
INSERT INTO `address` VALUES ('46', '12354656');
INSERT INTO `address` VALUES ('47', '3234567');
INSERT INTO `address` VALUES ('48', '13435');
INSERT INTO `address` VALUES ('49', '11阿萨德财产');
INSERT INTO `address` VALUES ('50', '2532');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(25) DEFAULT NULL,
  `apwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', 'c4ca4238a0b923820dcc509a6f75849b');

-- ----------------------------
-- Table structure for t_check
-- ----------------------------
DROP TABLE IF EXISTS `t_check`;
CREATE TABLE `t_check` (
  `checkId` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`checkId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_check
-- ----------------------------
INSERT INTO `t_check` VALUES ('1', '未审核');
INSERT INTO `t_check` VALUES ('2', '审核中');
INSERT INTO `t_check` VALUES ('3', '已审核');

-- ----------------------------
-- Table structure for t_compact
-- ----------------------------
DROP TABLE IF EXISTS `t_compact`;
CREATE TABLE `t_compact` (
  `compactId` bigint(20) NOT NULL AUTO_INCREMENT,
  `startTime` varchar(255) DEFAULT NULL,
  `stopTime` varchar(255) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `message` text,
  `tenderId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`compactId`),
  KEY `FK_Reference_15` (`tenderId`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`tenderId`) REFERENCES `t_tender` (`tenderId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_compact
-- ----------------------------
INSERT INTO `t_compact` VALUES ('1', '2018-06-04 09:47:56', '2018-06-30 09:48:03', '1000000', '1', '2018-06-01 09:48:15', '测试数据。。。我们一起学猫叫，一起喵喵喵喵喵', '18');
INSERT INTO `t_compact` VALUES ('2', '2018-06-02 19:15:11', '2018-08-31 19:15:11', '500000', '1', '2018-06-02 19:15:11', '本合同订立准则，双方必须按招投法律规定进行交易。手机零件若出现质量问题，经鉴定确认后应由投标方承担责任。如招标方故意损坏，责任由招标方承担。', '1');
INSERT INTO `t_compact` VALUES ('4', '2018-06-04 00:07:47', '2018-09-02 00:07:47', '2000000', '0', '2018-06-05 09:06:04', '本合同订立准则，双方必须按招投法律规定进行交易。电脑若出现质量问题，经鉴定确认后应由投标方承担责任。如招标方故意损坏，责任由招标方承担。', '3');
INSERT INTO `t_compact` VALUES ('12', '2018-06-07 23:41:01', '2018-09-05 23:41:01', '500000', '0', '2018-06-07 23:41:01', '合作愉快', '18');

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `companyId` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(50) DEFAULT NULL,
  `addressId` bigint(20) DEFAULT NULL,
  `tel` varchar(13) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`companyId`),
  KEY `FK_Reference_11` (`userID`),
  KEY `FK_Reference_7` (`addressId`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '中科软科技股份有限公司', '34', '萨达撒打撒', '1');
INSERT INTO `t_company` VALUES ('13', '中国电子口岸数据中心', '36', '01065195500', '2');
INSERT INTO `t_company` VALUES ('15', '北京中复电讯设备有限责任公司', '17', '01065916591', '85');
INSERT INTO `t_company` VALUES ('16', '南天软件', '27', '13866745566', '87');
INSERT INTO `t_company` VALUES ('22', '1', '2', '11111', '86');
INSERT INTO `t_company` VALUES ('34', '北京科瑞杰有限责任公司', '40', '01055667788', '84');
INSERT INTO `t_company` VALUES ('36', '北京华育兴业', '39', '9+5621302', '87');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyId` bigint(20) DEFAULT NULL,
  `noticeBeginTime` datetime DEFAULT NULL,
  `noticeStopTime` datetime DEFAULT NULL,
  `addressId` bigint(20) DEFAULT NULL,
  `itemName` varchar(50) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `isIssue` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `isDelete` tinyint(4) DEFAULT NULL,
  `detail` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`noticeId`),
  KEY `FK_Reference_14` (`userID`),
  KEY `FK_Reference_8` (`addressId`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '1', '2018-03-13 18:07:49', '2018-06-04 18:08:16', '34', 'Dell台式机', '1', '1', '2018-03-12 18:09:25', '0', '本公司欲购入一批Dell台式电脑，500G内存，i5以上处理器，4G以上内存，独立显卡');
INSERT INTO `t_notice` VALUES ('3', '15', '2018-05-01 18:18:07', '2018-08-01 18:18:12', '17', '手机零件', '85', '1', '2018-04-01 18:18:53', '0', '本公司欲购买一批手机零件供组装使用，质量水平优先，北京能供应者优先');
INSERT INTO `t_notice` VALUES ('6', '22', '2018-06-04 18:25:28', '2018-10-01 18:25:32', '2', '小小酥', '86', '1', '2018-06-04 18:26:04', '0', '啦啦啦');
INSERT INTO `t_notice` VALUES ('7', '36', '2018-05-01 18:26:43', '2018-07-01 18:26:47', '2', '测试', '86', '1', '2018-05-29 18:26:54', '0', '测试');
INSERT INTO `t_notice` VALUES ('38', '22', '2018-06-06 03:03:00', '2018-06-06 03:03:00', '47', '3共和国复合弓', '86', '1', '2018-06-07 03:03:00', '1', '                        	                        	                        \r\n                     3333   大润发提高用户及\r\n                        \r\n                        ');
INSERT INTO `t_notice` VALUES ('39', '22', '2018-06-07 01:01:00', '2018-06-07 02:02:00', '49', '11', '86', '1', '2018-06-07 01:01:00', '1', '上大学时     打算                   	                        \r\n                        111\r\n                        ');
INSERT INTO `t_notice` VALUES ('40', '22', '2018-06-07 03:03:00', '2018-06-07 05:05:00', '50', '523', '86', '1', '2018-06-07 21:25:45', '0', '                        \r\n              切尔奇无多无多          ');

-- ----------------------------
-- Table structure for t_tender
-- ----------------------------
DROP TABLE IF EXISTS `t_tender`;
CREATE TABLE `t_tender` (
  `tenderId` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyId` bigint(20) DEFAULT NULL,
  `tenderName` varchar(20) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `isDelete` tinyint(4) DEFAULT NULL,
  `checkId` int(11) DEFAULT NULL,
  `bidId` bigint(20) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `detail` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`tenderId`),
  KEY `FK_Reference_10` (`companyId`),
  KEY `FK_Reference_12` (`checkId`),
  KEY `FK_Reference_13` (`bidId`),
  KEY `FK_Reference_9` (`userID`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`companyId`) REFERENCES `t_company` (`companyId`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`checkId`) REFERENCES `t_check` (`checkId`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tender
-- ----------------------------
INSERT INTO `t_tender` VALUES ('1', '1', '手机零件批发', '1', '2018-06-01 14:52:00', '0', '3', '7', '1', '本公司专营手机零部件，各种厂家均有，价格合理，忘有意者不要错过！asdsadsadda');
INSERT INTO `t_tender` VALUES ('2', '13', '电脑批发', '2', '2018-04-10 01:01:00', '0', '2', '1', '0', '本公司出售台式机、笔记本电脑，各种牌子应有尽有，零配件齐全，i3处理器以上，商务用、游戏用均有大量货源，速速订货叭！');
INSERT INTO `t_tender` VALUES ('3', '34', '三星电脑连锁', '84', '2018-04-03 01:01:00', '0', '1', '1', '0', '本公司专营三星笔记本电脑，超大显示屏，超高内存，不要错过哦！');
INSERT INTO `t_tender` VALUES ('18', '16', '测试哒哒哒', '87', '2018-04-03 02:02:00', '0', '3', '6', '0', '我们一起学猫叫，一起喵喵喵喵喵');
INSERT INTO `t_tender` VALUES ('34', '1', 'Dell台式机', '1', '2018-06-07 23:36:25', '0', '1', '1', '0', '                            	\r\n                     确定是否VB       ');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `tel` varchar(23) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `isDelete` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'huchen', 'huchen', 'c4ca4238a0b923820dcc509a6f75849b', '0', '18846762335', '10904546@qq.com', '0', '2018-01-02 00:00:00', '2');
INSERT INTO `t_user` VALUES ('2', 'huchen1', 'hc', '123', '0', '18846762335', '10904546@qq.com', '0', '2018-01-02 00:00:00', '1');
INSERT INTO `t_user` VALUES ('84', '张三', '张三', 'c4ca4238a0b923820dcc509a6f75849b', '1', '15504050000', '123@163.com', '0', '2018-04-17 16:18:19', '1');
INSERT INTO `t_user` VALUES ('85', '李四', '李四', 'c4ca4238a0b923820dcc509a6f75849b', '0', '13022220000', '1@qq.com', '0', '2018-03-15 00:00:00', '0');
INSERT INTO `t_user` VALUES ('86', '王五', '王五', 'c4ca4238a0b923820dcc509a6f75849b', '0', '18800002222', '1@qq.com', '0', '2018-04-10 16:18:22', '0');
INSERT INTO `t_user` VALUES ('87', '小明', '小明', 'c4ca4238a0b923820dcc509a6f75849b', '1', '13256478976', '123@163.com', '1', '2018-04-13 16:18:25', '1');
INSERT INTO `t_user` VALUES ('121', '112345', '12345', '123456', '1', '1', '1', '1', '2018-06-06 19:06:00', '2');
INSERT INTO `t_user` VALUES ('122', '1ee', '1ee', '1ee', '0', '1ee', '1ee', '0', '2018-06-07 20:27:00', '0');
INSERT INTO `t_user` VALUES ('123', '1', '1', '1', '1', '1', '1', '0', '2018-06-07 20:30:23', '2');
INSERT INTO `t_user` VALUES ('124', 'hqsedxfc', 'h23ert', 'h2w3erfc', '1', 'hswxedfcd', 'hwsxedfc', '0', '2018-06-07 20:33:00', '1');
