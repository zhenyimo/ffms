/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-23 03:26:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xl_good
-- ----------------------------
DROP TABLE IF EXISTS `xl_good`;
CREATE TABLE `xl_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品表（心理测试题表）',
  `tittle` char(25) CHARACTER SET gbk DEFAULT NULL COMMENT '标题',
  `subtittle` char(25) CHARACTER SET gbk DEFAULT NULL COMMENT '副标题',
  `typeId` int(20) DEFAULT NULL COMMENT '类型id',
  `type_name` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '类型名称',
  `price` double(25,1) DEFAULT NULL COMMENT '价格',
  `

original_price` double(25,1) DEFAULT NULL COMMENT '原价',
  `picture_name` char(40) CHARACTER SET gbk DEFAULT NULL,
  `answer_time` int(10) DEFAULT '0' COMMENT '回答的多少时间以内',
  `description` varchar(3000) CHARACTER SET gbk DEFAULT NULL,
  `pay_success_number` int(100) DEFAULT NULL COMMENT '支付成功的数量',
  `flag` varchar(2) CHARACTER SET gbk DEFAULT NULL COMMENT '题目是否有效(1:有效，2：无效)',
  `create_user` int(11) DEFAULT '1' COMMENT '创建者id',
  `create_username` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '创建人名字',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_username` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime(6) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xl_good
-- ----------------------------
INSERT INTO `xl_good` VALUES ('1', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '11.0', '22.0', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
