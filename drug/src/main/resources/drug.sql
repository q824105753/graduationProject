/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : drug

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-11-27 19:46:14
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_business
-- ----------------------------
INSERT INTO `t_business` VALUES ('27', '修正药业集团', '12345678901', '长春', '0');
INSERT INTO `t_business` VALUES ('28', '仁和药业股份有限公司', '12345678901', '中国 九江', '0');
INSERT INTO `t_business` VALUES ('29', '石家庄制药集团有限公司', '12345678901', '河北省石家庄市', '0');
INSERT INTO `t_business` VALUES ('30', '重庆华邦制药股份有限公司', '12345678901', '重庆市高新技术开发区', '0');
INSERT INTO `t_business` VALUES ('31', '哈药集团', '12345678901', '黑龙江省哈尔滨市', '0');
INSERT INTO `t_business` VALUES ('32', '中国医药集团有限公司', '12345678901', '中国北京', '0');
INSERT INTO `t_business` VALUES ('33', '三九集团', '12345678901', '中国北京', '0');
INSERT INTO `t_business` VALUES ('34', '上海迪赛诺化学制药有限公司', '12345678901', '上海', '1');
INSERT INTO `t_business` VALUES ('35', '鲁南制药集团股份有限公司', '12345678901', '山东省临沂市兰山区', '0');
INSERT INTO `t_business` VALUES ('36', '成都锦华药业有限公司', '12345678901', '成都', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_drug
-- ----------------------------
INSERT INTO `t_drug` VALUES ('19', '三九/999 感冒灵颗粒', '0', '10.00', '2018-11-14', '360', '32', '27', '10g*9袋', null, '岗梅、三叉苦、金盏银盘、野菊花、薄荷油、咖啡因、马来酸氯苯那敏、对乙酰氨基酚。辅料为滑石粉。');
INSERT INTO `t_drug` VALUES ('20', '感冒软胶囊', '0', '6.50', '2018-11-06', '360', '37', '29', '0.425g*24粒/盒', null, '麻黄、桂枝、防风、白芷、川芎、石菖蒲、葛根薄荷、苦杏仁、当归、黄苓、桔梗。辅料为大豆色拉油。');
INSERT INTO `t_drug` VALUES ('21', '复方感冒灵片', '0', '5.60', '2018-11-15', '360', '36', '33', '0.32g*100片/盒', null, '金银花、五指柑、野菊花、三叉苦、南板蓝根、岗梅、对乙酰氨基酚、马来酸氯苯那敏、咖啡因。辅料为淀粉、糊精、硬脂酸镁、薄膜包衣预混剂。');
INSERT INTO `t_drug` VALUES ('22', '四季感冒片', '0', '6.60', '2018-11-13', '360', '36', '29', '0.41g*24片/盒', null, '紫苏叶、荆芥、连翘、大青叶、防风、桔梗、陈皮、香附(炒)、炙甘草。辅料为被他环糊精，硬脂酸镁，薄膜包衣剂。');
INSERT INTO `t_drug` VALUES ('23', '999 气滞胃痛颗粒', '0', '17.00', '2018-11-23', '360', '32', '33', '5g*9袋/盒', null, '柴胡、延胡索（炙）、枳壳、香附（炙）、白芍、炙甘草。辅料为蔗糖和糊精。');
INSERT INTO `t_drug` VALUES ('24', '达喜 铝碳酸镁咀嚼片（OTC）', '0', '19.90', '2018-11-07', '360', '36', '28', '0.5g*20片/盒', null, '本品每片含0.5克铝碳酸镁。辅料为：玉米淀粉、甘露醇、糖精钠、硬脂酸镁、薄荷香精、香蕉香精');
INSERT INTO `t_drug` VALUES ('25', '泰康 丁细牙痛胶囊', '0', '39.90', '2018-11-10', '360', '37', '36', '0.45gx12粒x2板/盒', null, '丁香叶，细辛。');
INSERT INTO `t_drug` VALUES ('26', '同仁堂 京制牛黄解毒片', '0', '25.90', '2018-11-10', '360', '36', '30', '0.6g*8片*10瓶', null, '黄连、黄柏、石膏、金银花、薄荷、桔梗、连翘、大黄、黄芩、栀子（姜炙）、菊花、荆芥穗、防风、旋复花、白芷、川芎、蔓荆子（微炒）、蚕砂、甘草、人工牛黄、冰片。辅料为淀粉、硬脂酸镁。');
INSERT INTO `t_drug` VALUES ('27', '慧宝源 牙痛药水', '0', '10.00', '2018-11-09', '360', '35', '30', '5ml', null, '荜茇、细辛、高良姜、丁香、冰片。辅料为甘油、乙醇、甘油。');
INSERT INTO `t_drug` VALUES ('28', '药信 蒲地蓝消炎片', '0', '15.90', '2018-11-15', '360', '36', '28', '300mg*48片', null, '本品含制川乌、制草乌、制天南星、蒲公英、黄芩、苦地丁、板蓝根。辅料为：淀粉、糊精。');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stock
-- ----------------------------
INSERT INTO `t_stock` VALUES ('24', '19', '123', '2018-11-27 16:40:31', '1', '50');
INSERT INTO `t_stock` VALUES ('25', '24', '464', '2018-11-27 16:41:16', '1', '50');
INSERT INTO `t_stock` VALUES ('27', '26', '123', '2018-11-27 16:41:35', '1', '50');
INSERT INTO `t_stock` VALUES ('28', '27', '678', '2018-11-27 16:41:41', '1', '50');
INSERT INTO `t_stock` VALUES ('29', '28', '464', '2018-11-27 16:41:47', '1', '50');
INSERT INTO `t_stock` VALUES ('30', '23', '343', '2018-11-27 16:41:54', '1', '50');
INSERT INTO `t_stock` VALUES ('31', '20', '234', '2018-11-27 16:42:15', '1', '50');
INSERT INTO `t_stock` VALUES ('32', '21', '234', '2018-11-27 16:42:32', '1', '50');
INSERT INTO `t_stock` VALUES ('33', '22', '324', '2018-11-27 16:42:32', '1', '50');
INSERT INTO `t_stock` VALUES ('34', '25', '132', '2018-11-27 16:42:32', '1', '50');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '0', 'admin', '12345678910');
INSERT INTO `t_user` VALUES ('10', 'user', 'b065858b55aa43208eb7acdd6623316a', 'user', '0', '111', '123');
