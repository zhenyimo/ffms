/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-21 14:56:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xl_question
-- ----------------------------
DROP TABLE IF EXISTS `xl_question`;
CREATE TABLE `xl_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) DEFAULT NULL,
  `question_num` int(33) DEFAULT NULL COMMENT '第几题',
  `question_content` varchar(2000) DEFAULT NULL COMMENT '题目内容',
  `ques_type` varchar(10) DEFAULT NULL COMMENT '第几种题型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_question
-- ----------------------------
INSERT INTO `xl_question` VALUES ('1', '1', '1', '你是否经常发火？', '1');
INSERT INTO `xl_question` VALUES ('2', '1', '2', '你是否经常说话不经过大脑思考？', '1');
INSERT INTO `xl_question` VALUES ('3', '1', '3', '你是否时常不能考虑到别人的想法？', '1');
INSERT INTO `xl_question` VALUES ('4', '1', '4', '你是否经常表现出急躁的性格？', '1');
INSERT INTO `xl_question` VALUES ('5', '1', '5', '你是否总是想一件事就做一件事？', '1');
INSERT INTO `xl_question` VALUES ('6', '1', '6', '你是否经常打断别人的谈话？', '1');
INSERT INTO `xl_question` VALUES ('7', '1', '7', '你是否经常与别人产生冲突？', '1');
INSERT INTO `xl_question` VALUES ('8', '1', '8', '你是否能与别人很好的沟通？', '1');
INSERT INTO `xl_question` VALUES ('9', '1', '9', '你是一个容易接纳别人观点的人吗？', '1');
INSERT INTO `xl_question` VALUES ('10', '1', '10', '你是一个细心的人吗？', '1');
