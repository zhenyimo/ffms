/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-21 15:53:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xl_answer
-- ----------------------------
DROP TABLE IF EXISTS `xl_answer`;
CREATE TABLE `xl_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_num` varchar(10) DEFAULT NULL COMMENT '第几个答案',
  `answer_content` varchar(500) DEFAULT NULL COMMENT '答案内容',
  `questionId` int(11) DEFAULT NULL,
  `next_quesionId` int(11) DEFAULT NULL COMMENT '下一题Id',
  `answer_score` int(10) DEFAULT '0' COMMENT '答案的分值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_answer
-- ----------------------------
INSERT INTO `xl_answer` VALUES ('1', '1', '是的，经常', '1', '2', '3');
INSERT INTO `xl_answer` VALUES ('2', '2', '从不', '1', '2', '5');
INSERT INTO `xl_answer` VALUES ('3', '3', '偶尔', '1', '2', '8');
INSERT INTO `xl_answer` VALUES ('4', '1', '是的，经常', '2', '3', '5');
INSERT INTO `xl_answer` VALUES ('5', '2', '从不', '2', '3', '3');
INSERT INTO `xl_answer` VALUES ('6', '3', '偶尔', '2', '3', '7');
INSERT INTO `xl_answer` VALUES ('7', '1', '是的，经常', '3', '4', '8');
INSERT INTO `xl_answer` VALUES ('8', '2', '从不', '3', '4', '0');
INSERT INTO `xl_answer` VALUES ('9', '3', '偶尔', '3', '4', '3');
INSERT INTO `xl_answer` VALUES ('10', '1', '是的，经常', '4', '5', '10');
INSERT INTO `xl_answer` VALUES ('11', '2', '从不', '4', '5', '2');
INSERT INTO `xl_answer` VALUES ('12', '3', '偶尔', '4', '5', '5');
INSERT INTO `xl_answer` VALUES ('13', '1', '是的，经常', '5', '6', '8');
INSERT INTO `xl_answer` VALUES ('14', '2', '从不', '5', '6', '2');
INSERT INTO `xl_answer` VALUES ('15', '3', '偶尔', '5', '6', '5');
INSERT INTO `xl_answer` VALUES ('16', '1', '经常', '6', '7', '8');
INSERT INTO `xl_answer` VALUES ('17', '2', '从不', '6', '7', '2');
INSERT INTO `xl_answer` VALUES ('18', '3', '偶尔', '6', '7', '5');
INSERT INTO `xl_answer` VALUES ('19', '1', '是的，经常', '7', '8', '9');
INSERT INTO `xl_answer` VALUES ('20', '2', '从不', '7', '8', '2');
INSERT INTO `xl_answer` VALUES ('21', '3', '偶尔', '7', '8', '5');
INSERT INTO `xl_answer` VALUES ('22', '1', '是的', '8', '9', '0');
INSERT INTO `xl_answer` VALUES ('23', '2', '不太能', '8', '9', '0');
INSERT INTO `xl_answer` VALUES ('24', '3', '一般般', '8', '9', '0');
INSERT INTO `xl_answer` VALUES ('25', '1', '是的', '9', '10', '0');
INSERT INTO `xl_answer` VALUES ('26', '2', '不是', '9', '10', '0');
INSERT INTO `xl_answer` VALUES ('27', '3', '一般般', '9', '10', '0');
INSERT INTO `xl_answer` VALUES ('28', '1', '是的', '10', null, '0');
INSERT INTO `xl_answer` VALUES ('29', '2', '不是', '10', null, '0');
INSERT INTO `xl_answer` VALUES ('30', '3', '不清楚', '10', null, '0');
