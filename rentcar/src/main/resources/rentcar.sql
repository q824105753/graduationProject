/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 100121
Source Host           : localhost:3306
Source Database       : rentcar

Target Server Type    : MYSQL
Target Server Version : 100121
File Encoding         : 65001

Date: 2018-06-10 20:28:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) DEFAULT NULL,
  `apwd` varchar(255) DEFAULT NULL,
  `arealname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', '1', '齐勇');

-- ----------------------------
-- Table structure for t_car
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) DEFAULT NULL,
  `c1id` int(11) DEFAULT NULL,
  `c2id` int(11) DEFAULT NULL,
  `platenumber` varchar(20) DEFAULT NULL,
  `buytime` varchar(20) DEFAULT NULL,
  `cflag` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `carimg` varchar(222) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_Reference_2` (`c2id`),
  KEY `FK_Reference_3` (`c1id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`c2id`) REFERENCES `t_category2` (`c2id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`c1id`) REFERENCES `t_category1` (`c1id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('1', '奥迪Q7', '19', '4', '黑A88888', '2017-01-01', '1', '500', 'http://localhost:8080/uploadimg/奥迪Q7.jpg', '0', null);
INSERT INTO `t_car` VALUES ('2', '奥迪A1', '15', '4', '黑A12354', '2015-06-17', '1', '123', 'http://localhost:8080/uploadimg/奥迪A1.jpg', '0', '1');
INSERT INTO `t_car` VALUES ('3', '奔驰R级', '19', '2', '黑A123456', '2016-06-21', '1', '111', 'http://localhost:8080/uploadimg/奔驰R级.jpg', '0', null);
INSERT INTO `t_car` VALUES ('4', '比亚迪F0', '14', '12', '黑12354', '2016-05-12', '0', '121', 'http://localhost:8080/uploadimg/比亚迪F0.jpg', '0', null);
INSERT INTO `t_car` VALUES ('5', '奇瑞eQ1', '14', '14', '黑12354', '2018-03-06', '1', '121', 'http://localhost:8080/uploadimg/奇瑞eQ1.jpg', '0', '2');
INSERT INTO `t_car` VALUES ('6', '奇瑞QQ', '14', '14', '黑12354', '2017-01-11', '0', '120', 'http://localhost:8080/uploadimg/奇瑞QQ.jpg', '0', '4');
INSERT INTO `t_car` VALUES ('7', '奇瑞eQ', '14', '14', '黑12354', '2017-05-09', '0', '11', 'http://localhost:8080/uploadimg/奇瑞eQ.jpg', '0', null);
INSERT INTO `t_car` VALUES ('8', '江淮iEV6E', '14', '16', '黑12354', '2016-01-13', '0', '12', 'http://localhost:8080/uploadimg/江淮iEV6E.jpg', '0', null);
INSERT INTO `t_car` VALUES ('9', '中华H230', '14', '15', '黑12354', '2017-05-11', '1', '12', 'http://localhost:8080/uploadimg/中华H530.jpg', '0', null);
INSERT INTO `t_car` VALUES ('10', '雪铁龙C5', '16', '10', '黑12354', '2018-03-12', '0', '123', 'http://localhost:8080/uploadimg/雪铁龙C5.jpg', '0', null);
INSERT INTO `t_car` VALUES ('11', '丰田86', '20', '7', '黑A12345', '2016-06-21', '0', '1212', 'http://localhost:8080/uploadimg/丰田86.jpg', '0', null);
INSERT INTO `t_car` VALUES ('12', '奥迪TT', '20', '4', '黑A12345', '2016-01-19', '1', '111', 'http://localhost:8080/uploadimg/奥迪TT.jpg', '0', '1');
INSERT INTO `t_car` VALUES ('13', '宝马2系', '20', '1', '黑A12345', '2017-05-22', '0', '111', 'http://localhost:8080/uploadimg/宝马2系.jpg', '0', null);
INSERT INTO `t_car` VALUES ('14', '宝马X1', '18', '1', '黑12354', '2016-06-15', '1', '111', 'http://localhost:8080/uploadimg/宝马X1.jpg', '0', '1');
INSERT INTO `t_car` VALUES ('15', '北京现代ix35', '18', '6', '黑12354', '2017-05-30', '1', '111', 'http://localhost:8080/uploadimg/北京现代ix35.jpg', '0', null);
INSERT INTO `t_car` VALUES ('16', '宝马4系', '16', '1', '黑12354', '2016-01-05', '0', '1221', 'http://localhost:8080/uploadimg/宝马4系.jpg', '0', null);
INSERT INTO `t_car` VALUES ('17', '宝马3系GT', '16', '1', '黑12354', '2017-06-06', '0', '123', 'http://localhost:8080/uploadimg/宝马3系.jpg', '0', null);
INSERT INTO `t_car` VALUES ('18', '雪铁龙C6', '16', '10', '黑12354', '2016-05-03', '0', '121', 'http://localhost:8080/uploadimg/雪铁龙C6.jpg', '0', null);
INSERT INTO `t_car` VALUES ('19', '奥迪S5', '16', '4', '黑12354', '2016-01-05', '0', '121', 'http://localhost:8080/uploadimg/奥迪Q5.jpg', '0', null);
INSERT INTO `t_car` VALUES ('20', '宝马M3', '16', '1', '黑12354', '2016-05-03', '0', '121', 'http://localhost:8080/uploadimg/宝马M3.jpg', '0', null);
INSERT INTO `t_car` VALUES ('21', '捷豹XE', '16', '11', '黑12354', '2016-02-10', '0', '1212', 'http://localhost:8080/uploadimg/捷豹XE.jpg', '0', null);
INSERT INTO `t_car` VALUES ('22', '奥迪A8', '17', '4', '黑12354', '2016-02-17', '0', '111', 'http://localhost:8080/uploadimg/奥迪A8.jpg', '0', null);
INSERT INTO `t_car` VALUES ('23', '宝马7系', '17', '1', '黑12354', '2016-06-14', '0', '121', 'http://localhost:8080/uploadimg/宝马7系.jpg', '0', null);
INSERT INTO `t_car` VALUES ('24', '捷豹XJ', '17', '11', '黑12354', '2016-08-20', '0', '111', 'http://localhost:8080/uploadimg/捷豹XJ.jpg', '0', null);
INSERT INTO `t_car` VALUES ('25', '奥迪Q5', '18', '4', '黑12354', '2016-06-15', '0', '111', 'http://localhost:8080/uploadimg/奥迪Q5.jpg', '0', null);
INSERT INTO `t_car` VALUES ('26', '马自达CX-4', '18', '9', '黑12354', '2016-06-21', '0', '111', 'http://localhost:8080/uploadimg/马自达CX-4.jpg', '0', null);
INSERT INTO `t_car` VALUES ('27', '本田XR-V', '18', '5', '黑12354', '2017-06-20', '0', '111', 'http://localhost:8080/uploadimg/本田XR-V.jpg', '0', null);
INSERT INTO `t_car` VALUES ('28', '奔驰GLC', '18', '2', '黑12354', '2016-06-20', '0', '111', 'http://localhost:8080/uploadimg/奔驰GLC.jpg', '0', null);
INSERT INTO `t_car` VALUES ('34', '大撒旦', '18', '5', '1', '2016-06-21', '0', '111', 'http://localhost:8080/uploadimg/丰田86.jpg', '1', null);
INSERT INTO `t_car` VALUES ('35', '阿萨德撒打算', '15', '2', '黑111111', '2018-06-11', '0', '1520', 'http://localhost:8080/uploadimg/奥迪A8.jpg', '1', null);

-- ----------------------------
-- Table structure for t_category1
-- ----------------------------
DROP TABLE IF EXISTS `t_category1`;
CREATE TABLE `t_category1` (
  `c1id` int(11) NOT NULL AUTO_INCREMENT,
  `c1name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`c1id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category1
-- ----------------------------
INSERT INTO `t_category1` VALUES ('14', '微型车');
INSERT INTO `t_category1` VALUES ('15', '小型车');
INSERT INTO `t_category1` VALUES ('16', '中型车');
INSERT INTO `t_category1` VALUES ('17', '大型车');
INSERT INTO `t_category1` VALUES ('18', 'SUV');
INSERT INTO `t_category1` VALUES ('19', 'MPV');
INSERT INTO `t_category1` VALUES ('20', '跑车');

-- ----------------------------
-- Table structure for t_category2
-- ----------------------------
DROP TABLE IF EXISTS `t_category2`;
CREATE TABLE `t_category2` (
  `c2id` int(11) NOT NULL AUTO_INCREMENT,
  `c2name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`c2id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category2
-- ----------------------------
INSERT INTO `t_category2` VALUES ('1', '宝马');
INSERT INTO `t_category2` VALUES ('2', '奔驰');
INSERT INTO `t_category2` VALUES ('3', '大众');
INSERT INTO `t_category2` VALUES ('4', '奥迪');
INSERT INTO `t_category2` VALUES ('5', '本田');
INSERT INTO `t_category2` VALUES ('6', '现代');
INSERT INTO `t_category2` VALUES ('7', '丰田');
INSERT INTO `t_category2` VALUES ('8', '红旗');
INSERT INTO `t_category2` VALUES ('9', '马自达');
INSERT INTO `t_category2` VALUES ('10', '雪铁龙');
INSERT INTO `t_category2` VALUES ('11', '捷豹');
INSERT INTO `t_category2` VALUES ('12', '比亚迪');
INSERT INTO `t_category2` VALUES ('13', '金杯');
INSERT INTO `t_category2` VALUES ('14', '奇瑞');
INSERT INTO `t_category2` VALUES ('15', '中华');
INSERT INTO `t_category2` VALUES ('16', '江淮');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '1', '48651248652152');
INSERT INTO `t_message` VALUES ('4', '2', 'sadsadasdada');
INSERT INTO `t_message` VALUES ('5', '2', '阿三的撒旦撒俺是');
INSERT INTO `t_message` VALUES ('8', '1', 'sadasda');
INSERT INTO `t_message` VALUES ('9', '4', '时代大厦');
INSERT INTO `t_message` VALUES ('10', '4', '俺是');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `oflag` int(11) DEFAULT NULL,
  `otime` datetime DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `totalprice` double(10,2) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_Reference_4` (`uid`),
  KEY `FK_Reference_5` (`cid`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`cid`) REFERENCES `t_car` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('17', '2', '1', '1', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '1.00', '1');
INSERT INTO `t_order` VALUES ('18', '2', '1', '1', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '1.00', '1');
INSERT INTO `t_order` VALUES ('19', '2', '1', '1', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '1.00', '1');
INSERT INTO `t_order` VALUES ('20', '2', '1', '1', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '1.00', '1');
INSERT INTO `t_order` VALUES ('21', '2', '1', '1', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '2018-03-13 01:01:00', '1.00', '1');
INSERT INTO `t_order` VALUES ('22', '2', '3', '1', '2018-04-29 00:34:53', '2018-04-29 00:34:53', '2018-05-05 00:49:39', '555.00', 'dsadad');
INSERT INTO `t_order` VALUES ('23', '2', '3', '1', '2018-04-29 00:48:11', '2018-04-29 00:48:11', '2018-05-06 00:49:49', '444.00', 'bkjhbhbj');
INSERT INTO `t_order` VALUES ('24', '2', '6', '1', '2018-04-29 00:50:16', '2018-04-29 00:50:16', '2018-05-04 00:50:16', '600.00', 'ghcvntfhcgnb');
INSERT INTO `t_order` VALUES ('25', '2', '16', '1', '2018-04-29 11:24:34', '2018-04-29 11:24:34', '2018-05-04 11:24:34', '6105.00', '算得上是多');
INSERT INTO `t_order` VALUES ('26', '1', '3', '1', '2018-05-08 20:12:36', '2018-05-08 20:12:36', '2018-05-13 20:12:36', '555.00', '更方便的大幅度发v');
INSERT INTO `t_order` VALUES ('27', '1', '2', '1', '2018-05-08 20:15:03', '2018-05-08 20:15:03', '2018-05-13 20:15:03', '615.00', '撒大大');
INSERT INTO `t_order` VALUES ('28', '1', '2', '1', '2018-05-08 20:16:31', '2018-05-08 20:16:31', '2018-05-14 20:16:31', '738.00', '个梵蒂冈');
INSERT INTO `t_order` VALUES ('29', '1', '3', '1', '2018-05-08 21:05:10', '2018-05-08 21:05:10', '2018-05-14 21:05:10', '666.00', '的撒打算');
INSERT INTO `t_order` VALUES ('30', '1', '3', '1', '2018-05-10 22:41:21', '2018-05-10 22:41:21', '2018-05-15 22:41:21', '555.00', 'ufgvnb');
INSERT INTO `t_order` VALUES ('31', '1', '4', '1', '2018-05-12 13:46:36', '2018-05-12 13:46:36', '2018-05-19 13:46:36', '847.00', '通过预混剂TV一个保护女警');
INSERT INTO `t_order` VALUES ('32', '1', '3', '1', '2018-05-12 14:22:43', '2018-05-12 14:22:43', '2018-05-13 14:22:43', '111.00', '');
INSERT INTO `t_order` VALUES ('33', '1', '9', '1', '2018-05-12 22:07:24', '2018-05-12 22:07:24', '2018-05-18 22:07:24', '72.00', 'fsdsdfs');
INSERT INTO `t_order` VALUES ('34', '1', '3', '1', '2018-05-25 18:19:18', '2018-05-25 18:19:18', '2018-05-31 18:19:18', '666.00', 'sdadas');
INSERT INTO `t_order` VALUES ('35', '2', '15', '1', '2018-05-28 09:47:55', '2018-05-28 09:47:55', '2018-06-05 09:47:55', '888.00', '啊似的撒旦');
INSERT INTO `t_order` VALUES ('36', '2', '1', '1', '2018-05-28 09:48:29', '2018-05-28 09:48:29', '2018-06-03 09:48:29', '3000.00', '问题给对方');
INSERT INTO `t_order` VALUES ('37', '2', '5', '1', '2018-05-28 09:53:44', '2018-05-28 09:53:44', '2018-05-30 09:53:44', '242.00', 'sadsa');
INSERT INTO `t_order` VALUES ('38', '2', '5', '1', '2018-05-28 09:55:32', '2018-05-28 09:55:32', '2018-05-31 09:55:32', '363.00', '');
INSERT INTO `t_order` VALUES ('39', '2', '5', '1', '2018-05-28 09:56:01', '2018-05-28 09:56:01', '2018-05-30 09:56:01', '242.00', '绕弯儿');
INSERT INTO `t_order` VALUES ('40', '4', '6', '1', '2018-05-28 09:56:21', '2018-05-28 09:56:21', '2018-06-01 09:56:21', '480.00', '味儿');
INSERT INTO `t_order` VALUES ('41', '1', '14', '1', '2018-06-08 09:51:55', '2018-06-08 09:51:55', '2018-06-16 09:51:55', '888.00', 'aewrstcyvbhjknl');
INSERT INTO `t_order` VALUES ('42', '1', '12', '1', '2018-06-10 17:29:39', '2018-06-10 17:29:39', '2018-06-13 17:29:39', '333.00', '萨达撒打撒');
INSERT INTO `t_order` VALUES ('43', '1', '2', '1', '2018-06-10 17:30:02', '2018-06-10 17:30:02', '2018-06-17 17:30:02', '861.00', '阿三的撒旦撒大所');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `idnumber` varchar(20) DEFAULT NULL,
  `utel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'qiyong', '1', '齐勇', '232302199606100714', '15645499706');
INSERT INTO `t_user` VALUES ('2', 'huchen', '1', '胡晨', '232302199606100714', '18846762335');
INSERT INTO `t_user` VALUES ('4', 'xiaozhu', '1', '小猪', '232302199606100714', '111');
