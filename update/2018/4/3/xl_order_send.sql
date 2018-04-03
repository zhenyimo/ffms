/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-03 23:10:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xl_order_send
-- ----------------------------
DROP TABLE IF EXISTS `xl_order_send`;
CREATE TABLE `xl_order_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `time` datetime DEFAULT NULL,
  `money` double(20,1) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `order_num` int(20) DEFAULT NULL COMMENT '数量',
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `getStatus` char(2) CHARACTER SET utf8 DEFAULT '0' COMMENT '认领状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_order_send
-- ----------------------------
