/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-21 14:30:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xl_vip_answer
-- ----------------------------
DROP TABLE IF EXISTS `xl_vip_answer`;
CREATE TABLE `xl_vip_answer` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '会员答案表',
  `answer_num` int(10) DEFAULT '1' COMMENT '回答的答案是哪个',
  `question_num` int(20) DEFAULT '1' COMMENT '回答的是第几题',
  `good_id` int(11) DEFAULT NULL COMMENT '回答的是哪个测评',
  `vip_id` int(11) DEFAULT NULL COMMENT '对应的会员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_vip_answer
-- ----------------------------
