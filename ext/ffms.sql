/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-05 21:54:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_database
-- ----------------------------
DROP TABLE IF EXISTS `t_database`;
CREATE TABLE `t_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_database
-- ----------------------------
INSERT INTO `t_database` VALUES ('43', '1', '20170705171442.sql', '2017-07-05 17:14:42', 'E:\\SQLDB122\\20170705171442.sql', '1');

-- ----------------------------
-- Table structure for t_datadic
-- ----------------------------
DROP TABLE IF EXISTS `t_datadic`;
CREATE TABLE `t_datadic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datadicname` varchar(255) DEFAULT NULL,
  `datadicvalue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_datadic
-- ----------------------------
INSERT INTO `t_datadic` VALUES ('1', '数据库管理', '备份');
INSERT INTO `t_datadic` VALUES ('2', '数据库管理', '恢复');
INSERT INTO `t_datadic` VALUES ('3', '数据库管理', '初始化');
INSERT INTO `t_datadic` VALUES ('4', '数据库管理', '数据整理');
INSERT INTO `t_datadic` VALUES ('6', '支出类型', '税收');
INSERT INTO `t_datadic` VALUES ('7', '支出类型', '衣食住行');
INSERT INTO `t_datadic` VALUES ('8', '支出类型', '医疗');
INSERT INTO `t_datadic` VALUES ('9', '支出类型', '债券');
INSERT INTO `t_datadic` VALUES ('10', '收入类型', '工资');
INSERT INTO `t_datadic` VALUES ('11', '收入类型', '股票');
INSERT INTO `t_datadic` VALUES ('12', '收入类型', '分红');
INSERT INTO `t_datadic` VALUES ('13', '收入类型', '奖金');
INSERT INTO `t_datadic` VALUES ('14', '证券流水账类型', '买入');
INSERT INTO `t_datadic` VALUES ('15', '证券流水账类型', '卖出');
INSERT INTO `t_datadic` VALUES ('16', '证券类型', '证据证券');
INSERT INTO `t_datadic` VALUES ('17', '证券类型', '凭证证券');
INSERT INTO `t_datadic` VALUES ('18', '证券类型', '有价证券');
INSERT INTO `t_datadic` VALUES ('19', '支出类型', '股票');
INSERT INTO `t_datadic` VALUES ('20', '支出类型', '其他');

-- ----------------------------
-- Table structure for t_income
-- ----------------------------
DROP TABLE IF EXISTS `t_income`;
CREATE TABLE `t_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `incomer` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `incometime` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_income
-- ----------------------------
INSERT INTO `t_income` VALUES ('1', '1', 'admin', '1', '5000', '10', '无', '2017-07-03 10:25:03', '2017-07-03 10:25:06', '2017-07-04 21:15:08');
INSERT INTO `t_income` VALUES ('3', '1', 'admin', '2', '6000', '10', '无', '2017-07-04 10:25:03', '2017-07-03 10:29:20', '2017-07-04 21:15:20');
INSERT INTO `t_income` VALUES ('4', '1', 'admin', '2', '5000', '10', '无', '2017-07-05 10:25:03', '2017-07-03 10:48:23', '2017-07-04 21:15:35');
INSERT INTO `t_income` VALUES ('6', '2', 'Tom', '1', '10000', '11', '', '2017-07-03 10:25:03', '2017-07-03 15:24:33', '2017-07-04 21:16:07');
INSERT INTO `t_income` VALUES ('8', '2', 'Tom', '1', '4000', '10', '', '2017-07-04 10:25:03', '2017-07-03 15:39:45', '2017-07-04 21:16:29');
INSERT INTO `t_income` VALUES ('32', '2', 'Tom', '1', '3000', '10', '', '2017-07-05 10:25:03', '2017-07-04 13:54:07', '2017-07-04 21:17:39');
INSERT INTO `t_income` VALUES ('33', '2', 'Tom', '3', '1222', '13', '', '2017-07-06 10:25:03', '2017-07-04 13:54:29', '2017-07-04 21:16:58');
INSERT INTO `t_income` VALUES ('34', '7', '普通用户', '3', '1000', '11', '', '2017-07-03 10:25:03', '2017-07-04 22:18:59', null);
INSERT INTO `t_income` VALUES ('35', '7', '普通用户', '2', '2200', '12', null, '2017-07-04 10:25:03', '2017-07-04 22:20:01', null);
INSERT INTO `t_income` VALUES ('36', '7', '普通用户', '2', '3500', '13', '', '2017-07-05 10:25:03', '2017-07-04 22:20:34', '2017-07-04 22:21:00');
INSERT INTO `t_income` VALUES ('37', '7', '普通用户', '2', '7000', '12', '', '2017-07-06 10:25:03', '2017-07-04 22:20:53', null);
INSERT INTO `t_income` VALUES ('38', '1', 'admin', 'wu', '30000', '11', '', '2017-07-10 19:30:53', '2017-07-10 19:30:56', null);
INSERT INTO `t_income` VALUES ('39', '2', 'tom', '3', '20000', '11', '', '2018-02-22 16:37:51', '2018-02-08 16:37:57', '2018-02-08 16:48:49');

-- ----------------------------
-- Table structure for t_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_pay`;
CREATE TABLE `t_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `tword` varchar(255) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `paytime` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay
-- ----------------------------
INSERT INTO `t_pay` VALUES ('1', '1', 'admin', '吃饭', '50000', '6', '1', '2017-07-04 11:10:41', '2017-07-03 11:10:45', '2017-07-08 15:25:49');
INSERT INTO `t_pay` VALUES ('2', '1', '1', '1', '222', '7', '2222', '2017-07-04 11:26:57', '2017-07-03 11:27:06', '2017-07-04 08:42:41');
INSERT INTO `t_pay` VALUES ('3', '1', '123', '1', '123', '6', '123', '2017-07-06 11:28:19', '2017-07-03 11:28:27', null);
INSERT INTO `t_pay` VALUES ('4', '1', '11', '3', '11', '6', '1', '2017-07-03 15:07:46', '2017-07-03 15:07:49', null);
INSERT INTO `t_pay` VALUES ('5', '11', 'jinbang', '投资新易贷', '3330', '9', '反反复复', '2018-01-28 00:02:25', '2018-01-28 00:02:32', null);
INSERT INTO `t_pay` VALUES ('6', '2', 'tom', '购买神州高铁债券', '10000', '9', '购买国债', '2018-02-07 16:44:03', '2018-02-08 16:44:13', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表',
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员');
INSERT INTO `t_role` VALUES ('2', '心理老师');

-- ----------------------------
-- Table structure for t_security
-- ----------------------------
DROP TABLE IF EXISTS `t_security`;
CREATE TABLE `t_security` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `securityname` varchar(255) DEFAULT NULL,
  `securitypassward` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `starttime` varchar(255) DEFAULT NULL,
  `endtime` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security
-- ----------------------------
INSERT INTO `t_security` VALUES ('1', '2', '12323', '231232189', '赵鹏', '17', '2017-07-03 11:14:58', '2017-07-05 11:14:55', '2017-07-05 11:15:02', '2017-07-05 11:15:23');
INSERT INTO `t_security` VALUES ('2', '1', '789', '788', '4561', '16', '2017-07-05 13:52:30', '2017-07-05 13:52:27', '2017-07-05 13:52:47', null);

-- ----------------------------
-- Table structure for t_shares
-- ----------------------------
DROP TABLE IF EXISTS `t_shares`;
CREATE TABLE `t_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `securityid` int(11) NOT NULL,
  `sharesname` varchar(255) DEFAULT NULL,
  `holder` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shares
-- ----------------------------
INSERT INTO `t_shares` VALUES ('1', '1', '1', '赵鹏', 'admin', '2017-07-05 11:16:43', '2017-07-05 15:57:04');
INSERT INTO `t_shares` VALUES ('3', '1', '1', '我哦我我哦', 'Tom', '2017-07-05 15:15:33', null);
INSERT INTO `t_shares` VALUES ('4', '11', '1', '腾讯股', 'jinbang', '2018-01-24 16:31:58', null);
INSERT INTO `t_shares` VALUES ('5', '2', '1', '平安银行', 'tom', '2018-02-08 16:32:19', null);
INSERT INTO `t_shares` VALUES ('6', '2', '1', '平安银行', 'tom', '2018-02-08 16:32:19', null);

-- ----------------------------
-- Table structure for t_trade
-- ----------------------------
DROP TABLE IF EXISTS `t_trade`;
CREATE TABLE `t_trade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `sharesid` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trade
-- ----------------------------
INSERT INTO `t_trade` VALUES ('1', null, null, '69999', '12', '839988', '14', '激活附', '2017-07-04 15:22:21', '2017-07-05 15:22:36', null);
INSERT INTO `t_trade` VALUES ('2', '1', '1', '69999', '2', '139998', '15', '地方', '2017-07-07 15:34:14', '2017-07-05 15:34:24', '2017-07-05 19:43:49');
INSERT INTO `t_trade` VALUES ('3', '2', '4', '22', '100', '2200', '14', '今天买入腾讯b股', '2018-02-08 16:31:02', '2018-02-08 16:31:19', null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表（里面的用户包括超级管理员和心理老师）',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `isvalid` tinyint(2) NOT NULL DEFAULT '1',
  `createtime` datetime NOT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'MTIz', '管理员', '424107420@qq.com', '18713598785', '秦皇岛市海港区燕山大学', '1', '22', '父亲', '5000', '123456', '1', '2017-06-30 11:36:21', '2018-01-24 17:38:59');
INSERT INTO `t_user` VALUES ('2', 'tom', 'MTIz', 'tom', '424107420@qq.com', '22222', '秦皇岛市海港区燕大小区', '2', '35', '母亲', '9000', '623578956', '1', '2017-07-01 15:04:19', '2018-01-24 18:05:17');
INSERT INTO `t_user` VALUES ('3', '12455', 'MTIz', null, null, null, null, null, null, null, null, null, '0', '2017-07-06 15:13:09', null);
INSERT INTO `t_user` VALUES ('4', '12222', 'MTIzNDU2Nzg=', '2222', '424107420@qq.com', '222', '秦皇岛市海港区', '2', '22', '父亲', '5000111', '123456', '0', '2017-07-01 15:24:14', '2017-07-03 10:09:40');
INSERT INTO `t_user` VALUES ('5', '122', 'MTIz', '1', '1@qq.com', '1', '1', '1', '1', '1', '1', '1', '0', '2017-07-03 15:10:15', null);
INSERT INTO `t_user` VALUES ('6', '1', 'MQ==', '1', '1@qq.com', '1', '1', '1', '11', '1', '11', '1', '0', '2017-07-03 15:10:34', null);
INSERT INTO `t_user` VALUES ('7', '普通用户', 'MTIz', '王大爷', '18713598785@163.com', '123456789', '未知', '1', '60', '外祖父', '6000', '622234578', '1', '2017-07-03 22:24:20', '2017-07-03 22:30:44');
INSERT INTO `t_user` VALUES ('8', '田建璐', 'MTIzNDU2', null, null, null, null, null, null, null, null, null, '0', '2017-07-03 22:27:15', null);
INSERT INTO `t_user` VALUES ('9', 'lu', 'MTIz', null, null, null, null, null, null, null, null, null, '1', '2017-07-07 10:02:39', null);
INSERT INTO `t_user` VALUES ('10', '我是谁', 'MTIzNDU2', null, null, null, null, null, null, null, null, null, '1', '2017-07-08 15:36:04', null);
INSERT INTO `t_user` VALUES ('11', 'jinbang', 'MTIz', '小东', '453465325@qq.com', '13570488568', '广东茂名', '1', null, '阿东', '100000', '95563555635211558', '1', '2018-01-24 16:30:53', '2018-01-25 09:36:44');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('4', '2', '2');
INSERT INTO `t_user_role` VALUES ('5', '3', '2');
INSERT INTO `t_user_role` VALUES ('6', '4', '2');
INSERT INTO `t_user_role` VALUES ('7', '5', '1');
INSERT INTO `t_user_role` VALUES ('8', '6', '1');
INSERT INTO `t_user_role` VALUES ('9', '7', '2');
INSERT INTO `t_user_role` VALUES ('10', '8', '2');
INSERT INTO `t_user_role` VALUES ('11', '9', '2');
INSERT INTO `t_user_role` VALUES ('12', '10', '2');
INSERT INTO `t_user_role` VALUES ('13', '11', '2');

-- ----------------------------
-- Table structure for xl_ads
-- ----------------------------
DROP TABLE IF EXISTS `xl_ads`;
CREATE TABLE `xl_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '顶层广告表',
  `goodId` int(11) DEFAULT NULL COMMENT '对应的商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_ads
-- ----------------------------

-- ----------------------------
-- Table structure for xl_answer
-- ----------------------------
DROP TABLE IF EXISTS `xl_answer`;
CREATE TABLE `xl_answer` (
  `id` int(11) NOT NULL,
  `answer_num` varchar(10) DEFAULT NULL COMMENT '第几个答案',
  `answer_content` varchar(255) DEFAULT NULL COMMENT '答案内容',
  `questionId` int(11) DEFAULT NULL,
  `next_quesionId` int(11) DEFAULT NULL COMMENT '下一题Id',
  `answer_score` int(10) DEFAULT NULL COMMENT '答案的分值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_answer
-- ----------------------------

-- ----------------------------
-- Table structure for xl_comment
-- ----------------------------
DROP TABLE IF EXISTS `xl_comment`;
CREATE TABLE `xl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员评论表',
  `vipId` int(11) DEFAULT NULL COMMENT 'vipid',
  `goodId` int(11) DEFAULT NULL COMMENT '题目id',
  `good_understandability` varchar(5) DEFAULT '' COMMENT '题目易懂性',
  `good_accuracy` varchar(5) DEFAULT '' COMMENT '准确性',
  `good_practical` varchar(5) DEFAULT NULL COMMENT '实用性',
  `content` char(200) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `anonymous` char(2) DEFAULT '0' COMMENT '(0：匿名评论；1：不匿名)默认是0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xl_comment
-- ----------------------------
INSERT INTO `xl_comment` VALUES ('2', '2', '9', '', '', null, 'asdasfsdsf', '2017-01-09 10:01:16', '0');
INSERT INTO `xl_comment` VALUES ('3', '2', '9', '', '', null, 'qqqqqq', '2017-01-09 10:01:46', '0');

-- ----------------------------
-- Table structure for xl_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `xl_evaluation`;
CREATE TABLE `xl_evaluation` (
  `id` int(11) NOT NULL,
  `goodId` int(11) DEFAULT NULL,
  `goodname` varchar(30) DEFAULT NULL COMMENT '评测报告描述',
  `report_describe` blob,
  `min_score` int(3) DEFAULT NULL,
  `max_score` int(20) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL COMMENT '程度（测试分数高低程度）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for xl_evaluation_detail
-- ----------------------------
DROP TABLE IF EXISTS `xl_evaluation_detail`;
CREATE TABLE `xl_evaluation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评估测试明细表',
  `eid` int(11) DEFAULT NULL COMMENT '评估测试表id',
  `eval_num` int(30) DEFAULT NULL COMMENT '序号',
  `eval_type` char(2) DEFAULT NULL COMMENT '评估测试内容类型（1：文字；2：图片）',
  `eval_content` blob,
  `eval_url` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_evaluation_detail
-- ----------------------------

-- ----------------------------
-- Table structure for xl_evaluation_record
-- ----------------------------
DROP TABLE IF EXISTS `xl_evaluation_record`;
CREATE TABLE `xl_evaluation_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户测试之后返回的评估记录',
  `goodId` int(11) DEFAULT NULL COMMENT '商品id',
  `vipId` int(11) DEFAULT NULL COMMENT 'vipid',
  `eid` int(11) DEFAULT NULL COMMENT '评测报告表id',
  `vipname` char(20) DEFAULT NULL COMMENT '测试者',
  `start_time` datetime(6) DEFAULT NULL COMMENT '开始测试时间',
  `score` tinyint(10) DEFAULT '0' COMMENT '评测分数（满分100）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_evaluation_record
-- ----------------------------

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
  `answer_time` int(10) DEFAULT NULL COMMENT '回答的多少时间以内',
  `description` char(60) CHARACTER SET gbk DEFAULT NULL,
  `pay_success_number` int(100) DEFAULT NULL COMMENT '支付成功的数量',
  `flag` varchar(2) CHARACTER SET gbk DEFAULT NULL COMMENT '题目是否有效',
  `create_user` int(11) DEFAULT NULL COMMENT '创建者id',
  `create_username` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '创建人名字',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_username` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime(6) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xl_good
-- ----------------------------
INSERT INTO `xl_good` VALUES ('9', '中国哲学史', null, '5', null, '100.0', null, '1482416332286.jpg', null, '一部描述中国上下五千年的哲学史', null, null, '8', null, null, null, null, null);
INSERT INTO `xl_good` VALUES ('10', '国际企业财务管理', null, '6', null, '55555.0', null, '1482416369937.jpg', null, '吃的', null, null, '8', null, null, null, null, null);

-- ----------------------------
-- Table structure for xl_good_version
-- ----------------------------
DROP TABLE IF EXISTS `xl_good_version`;
CREATE TABLE `xl_good_version` (
  `id` int(11) NOT NULL,
  `goodId` int(11) DEFAULT NULL COMMENT '产品id',
  `version_name` varchar(30) DEFAULT NULL COMMENT '版本名称',
  `version_code` varchar(30) DEFAULT NULL COMMENT '版本代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_good_version
-- ----------------------------

-- ----------------------------
-- Table structure for xl_order
-- ----------------------------
DROP TABLE IF EXISTS `xl_order`;
CREATE TABLE `xl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表（当支付返回成功标志的时候就会产生订单）',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单编号(都是数字）',
  `time` datetime DEFAULT NULL COMMENT '订单生成时间（支付成功才生成订单）',
  `flag` varchar(11) DEFAULT '0' COMMENT '是否支付',
  `money` float(20,1) DEFAULT NULL COMMENT '金额',
  `vipId` int(20) DEFAULT NULL COMMENT '会员id',
  `goodId` int(20) DEFAULT NULL COMMENT '题目id',
  `commentId` int(20) DEFAULT NULL COMMENT '评价id',
  `question_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xl_order
-- ----------------------------
INSERT INTO `xl_order` VALUES ('23', null, '2017-01-08 19:58:44', '1', '422.0', '2', null, null, null);
INSERT INTO `xl_order` VALUES ('24', null, '2017-01-08 20:41:18', '1', '213.0', '4', null, null, null);

-- ----------------------------
-- Table structure for xl_order_send
-- ----------------------------
DROP TABLE IF EXISTS `xl_order_send`;
CREATE TABLE `xl_order_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `time` datetime DEFAULT NULL,
  `money` double(20,1) DEFAULT NULL,
  `gvId` int(11) DEFAULT NULL,
  `order_num` int(20) DEFAULT NULL COMMENT '数量',
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_order_send
-- ----------------------------

-- ----------------------------
-- Table structure for xl_question
-- ----------------------------
DROP TABLE IF EXISTS `xl_question`;
CREATE TABLE `xl_question` (
  `id` int(11) NOT NULL,
  `goodId` int(11) DEFAULT NULL,
  `question_num` int(33) DEFAULT NULL COMMENT '第几题',
  `question_content` blob COMMENT '题目内容',
  `qustion_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_question
-- ----------------------------

-- ----------------------------
-- Table structure for xl_type
-- ----------------------------
DROP TABLE IF EXISTS `xl_type`;
CREATE TABLE `xl_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目类型表(类型有很多种）',
  `name` char(22) DEFAULT NULL COMMENT '类型名称',
  `flag` int(11) DEFAULT '1' COMMENT '1：表示有效 2：表示无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xl_type
-- ----------------------------
INSERT INTO `xl_type` VALUES ('5', ' 哲学类', '1');
INSERT INTO `xl_type` VALUES ('6', '财经管理', '1');
INSERT INTO `xl_type` VALUES ('7', '计算机技术', '1');
INSERT INTO `xl_type` VALUES ('9', ' 美术雕塑', '1');
INSERT INTO `xl_type` VALUES ('10', '中国文学', '1');
INSERT INTO `xl_type` VALUES ('11', '外国文学', '1');
INSERT INTO `xl_type` VALUES ('12', '历史地理', '0');
INSERT INTO `xl_type` VALUES ('13', '自然科学', '1');
INSERT INTO `xl_type` VALUES ('14', '', '0');
INSERT INTO `xl_type` VALUES ('15', '金融类', '1');

-- ----------------------------
-- Table structure for xl_vip
-- ----------------------------
DROP TABLE IF EXISTS `xl_vip`;
CREATE TABLE `xl_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员表（当游客支付成功之后才会成为会员）',
  `vip_username` varchar(50) DEFAULT NULL COMMENT '会员账号',
  `vip_name` varchar(20) DEFAULT NULL COMMENT '会员名称',
  `vip_sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `vip_age` varchar(20) DEFAULT NULL COMMENT '年龄',
  `openid` varchar(11) DEFAULT NULL,
  `vip_flag` varchar(2) DEFAULT NULL COMMENT '是否vip(1:就是vip)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_vip
-- ----------------------------

-- ----------------------------
-- Table structure for xl_voucher
-- ----------------------------
DROP TABLE IF EXISTS `xl_voucher`;
CREATE TABLE `xl_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '抵用券表',
  `name` char(30) DEFAULT NULL COMMENT '抵用券名称',
  `price` double(10,2) DEFAULT NULL COMMENT '抵用券价格',
  `flag` char(2) DEFAULT '2' COMMENT '抵用券是否有效（1：有效 2：无效）系统应该设定只有一条抵用券记录是有效的，其他都无效',
  `type` char(2) DEFAULT NULL COMMENT '优惠券有两种（1：不指定某题的2：指定某题的）',
  `validate` datetime(6) DEFAULT NULL COMMENT '有效期',
  `vo_num` int(50) DEFAULT NULL COMMENT '数量',
  `goodId` int(11) DEFAULT NULL COMMENT '如果type为2，则指定的goodId',
  `gvid` int(11) DEFAULT NULL,
  `stipulate_price` double(10,2) DEFAULT NULL COMMENT '到达多少钱才能使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xl_voucher
-- ----------------------------
