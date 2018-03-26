/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-23 03:26:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xl_ads
-- ----------------------------
DROP TABLE IF EXISTS `xl_ads`;
CREATE TABLE `xl_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '顶层广告表',
  `goodId` int(11) DEFAULT NULL COMMENT '对应的商品id',
  `adPictureUrl` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_ads
-- ----------------------------
INSERT INTO `xl_ads` VALUES ('1', '1', 'xinli.jpg');
INSERT INTO `xl_ads` VALUES ('2', '1', '14575099373016645.jpg');
