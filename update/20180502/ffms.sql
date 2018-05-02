/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : ffms

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-02 08:11:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_database`
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
-- Table structure for `t_datadic`
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
-- Table structure for `t_income`
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
-- Table structure for `t_pay`
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
-- Table structure for `t_role`
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
-- Table structure for `t_security`
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
-- Table structure for `t_shares`
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
-- Table structure for `t_trade`
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
-- Table structure for `t_user`
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_user` VALUES ('10', '我是谁', 'MTIzNDU2', 'jack', null, null, null, null, null, null, null, null, '1', '2017-07-08 15:36:04', null);
INSERT INTO `t_user` VALUES ('11', 'jinbang', 'MTIz', '小东', '453465325@qq.com', '13570488568', '广东茂名', '1', null, '阿东', '100000', '95563555635211558', '1', '2018-01-24 16:30:53', '2018-01-25 09:36:44');
INSERT INTO `t_user` VALUES ('12', 'jackie', 'MTIzNDU2', '杰克', '364232252@qq.com', '13580524412', '1231', '1', '27', '12312', '1231', '12312', '1', '2018-05-02 00:22:42', null);

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_user_role` VALUES ('14', '12', '2');

-- ----------------------------
-- Table structure for `xl_ads`
-- ----------------------------
DROP TABLE IF EXISTS `xl_ads`;
CREATE TABLE `xl_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '顶层广告表',
  `goodId` int(11) DEFAULT NULL COMMENT '对应的商品id',
  `adPictureUrl` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_ads
-- ----------------------------
INSERT INTO `xl_ads` VALUES ('1', '1', 'xinli.jpg');
INSERT INTO `xl_ads` VALUES ('2', '1', '14575099373016645.jpg');

-- ----------------------------
-- Table structure for `xl_answer`
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `xl_authority`
-- ----------------------------
DROP TABLE IF EXISTS `xl_authority`;
CREATE TABLE `xl_authority` (
  `authorityid` int(11) NOT NULL AUTO_INCREMENT,
  `authorityname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorityid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_authority
-- ----------------------------
INSERT INTO `xl_authority` VALUES ('1', '管理员');
INSERT INTO `xl_authority` VALUES ('2', '老师');
INSERT INTO `xl_authority` VALUES ('3', '学生');
INSERT INTO `xl_authority` VALUES ('4', '学生111');
INSERT INTO `xl_authority` VALUES ('5', '学生1112222');
INSERT INTO `xl_authority` VALUES ('6', '学生1112222333');
INSERT INTO `xl_authority` VALUES ('7', '学生1112222333444');
INSERT INTO `xl_authority` VALUES ('8', '11111');
INSERT INTO `xl_authority` VALUES ('9', '2222');
INSERT INTO `xl_authority` VALUES ('10', '22223333');
INSERT INTO `xl_authority` VALUES ('11', '2222333344');
INSERT INTO `xl_authority` VALUES ('12', '222233334455');
INSERT INTO `xl_authority` VALUES ('13', '老师111');
INSERT INTO `xl_authority` VALUES ('14', '2222学生');
INSERT INTO `xl_authority` VALUES ('15', '2222学生XXXYYY');
INSERT INTO `xl_authority` VALUES ('16', '2222333344TTTT');
INSERT INTO `xl_authority` VALUES ('17', '管理员T');
INSERT INTO `xl_authority` VALUES ('18', '老师TT');
INSERT INTO `xl_authority` VALUES ('19', '学生VVV');
INSERT INTO `xl_authority` VALUES ('20', 'NNN');

-- ----------------------------
-- Table structure for `xl_comment`
-- ----------------------------
DROP TABLE IF EXISTS `xl_comment`;
CREATE TABLE `xl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员评论表',
  `vipId` int(11) DEFAULT NULL COMMENT 'vipid',
  `goodId` int(11) DEFAULT NULL COMMENT '题目id',
  `good_understandability` varchar(5) DEFAULT '' COMMENT '题目易懂性',
  `good_accuracy` varchar(5) DEFAULT '' COMMENT '准确性',
  `good_practical` varchar(5) DEFAULT NULL COMMENT '实用性',
  `content` varchar(200) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `anonymous` int(2) DEFAULT '0' COMMENT '(0：匿名评论；1：不匿名)默认是0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_comment
-- ----------------------------
INSERT INTO `xl_comment` VALUES ('2', '2', '9', '', '', null, 'asdasfsdsf', '2017-01-09 10:01:16', '0');
INSERT INTO `xl_comment` VALUES ('3', '2', '9', '', '', null, 'qqqqqq', '2017-01-09 10:01:46', '0');

-- ----------------------------
-- Table structure for `xl_evaluation`
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
  `ques_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for `xl_evaluation_detail`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_evaluation_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `xl_evaluation_record`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_evaluation_record
-- ----------------------------

-- ----------------------------
-- Table structure for `xl_good`
-- ----------------------------
DROP TABLE IF EXISTS `xl_good`;
CREATE TABLE `xl_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品表（心理测试题表）',
  `tittle` char(25) DEFAULT NULL COMMENT '标题',
  `subtittle` char(25) DEFAULT NULL COMMENT '副标题',
  `typeId` int(20) DEFAULT NULL COMMENT '类型id',
  `type_name` varchar(10) DEFAULT NULL COMMENT '类型名称',
  `price` double(25,2) DEFAULT NULL COMMENT '价格',
  `

original_price` double(25,2) DEFAULT NULL COMMENT '原价',
  `picture_name` char(40) DEFAULT NULL,
  `answer_time` int(10) DEFAULT '0' COMMENT '回答的多少时间以内',
  `description` varchar(3000) DEFAULT NULL,
  `pay_success_number` int(100) DEFAULT NULL COMMENT '支付成功的数量',
  `flag` varchar(2) DEFAULT NULL COMMENT '题目是否有效(1:有效，2：无效)',
  `create_user` int(11) DEFAULT '1' COMMENT '创建者id',
  `create_username` varchar(20) DEFAULT NULL COMMENT '创建人名字',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_username` varchar(20) DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime(6) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_good
-- ----------------------------
INSERT INTO `xl_good` VALUES ('1', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('2', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('3', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('4', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('5', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('6', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('7', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('8', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('9', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('10', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('11', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('12', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('13', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('14', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');
INSERT INTO `xl_good` VALUES ('15', '测在别人眼中你有多冲动呢？', '测在别人眼中你有多冲动呢？', '1', '性格', '0.01', '22.00', 'test1.jpg', '10', '性格直爽的你或许时常不能控制好自己的情绪，冲动处事，伴随着迅速、剧烈的情绪你所产生的行为可能会完全出乎你的计划和意料，给你带来一些麻烦和悔恨，那么你是否在意别人对此的看法呢？做以下综合测试题会帮助你寻找答案。', '0', '1', '1', 'admin', '2018-03-21 14:02:30.000000', '1', 'admin', '2018-03-21 14:02:39.000000');

-- ----------------------------
-- Table structure for `xl_good_version`
-- ----------------------------
DROP TABLE IF EXISTS `xl_good_version`;
CREATE TABLE `xl_good_version` (
  `id` int(11) NOT NULL,
  `goodId` int(11) DEFAULT NULL COMMENT '产品id',
  `version_name` varchar(30) DEFAULT NULL COMMENT '版本名称',
  `version_code` varchar(30) DEFAULT NULL COMMENT '版本代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_good_version
-- ----------------------------

-- ----------------------------
-- Table structure for `xl_order`
-- ----------------------------
DROP TABLE IF EXISTS `xl_order`;
CREATE TABLE `xl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表（当支付返回成功标志的时候就会产生订单）',
  `order_no` varchar(29) DEFAULT NULL COMMENT '订单编号(都是数字）',
  `time` datetime DEFAULT NULL COMMENT '订单生成时间（支付成功才生成订单）',
  `flag` varchar(11) DEFAULT '0' COMMENT '是否支付',
  `money` double(20,2) DEFAULT NULL COMMENT '金额',
  `vipId` int(20) DEFAULT NULL COMMENT '会员id',
  `goodId` int(20) DEFAULT NULL COMMENT '题目id',
  `commentId` int(20) DEFAULT NULL COMMENT '评价id',
  `order_num` int(11) DEFAULT NULL,
  `claim_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_order
-- ----------------------------
INSERT INTO `xl_order` VALUES ('23', '1', '2017-01-08 19:58:44', '1', '0.10', '1', null, null, null, null);
INSERT INTO `xl_order` VALUES ('24', '2', '2017-01-08 20:41:18', '1', '0.10', '1', null, null, null, null);
INSERT INTO `xl_order` VALUES ('25', '', '2018-04-09 10:17:25', '2', '0.10', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('26', '', '2018-04-09 10:18:16', '2', '0.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('27', '', '2018-04-09 15:05:06', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('28', '', '2018-04-09 15:06:15', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('29', '201804101719235461003WSXs2347', '2018-04-10 17:19:23', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('30', '201804101720533681003WSXs4140', '2018-04-10 17:20:53', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('31', '201804101722128641003WSXs1183', '2018-04-10 17:22:12', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('32', '201804101802013841003WSXs3054', '2018-04-10 18:02:01', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('33', '201804101803523941003WSXs3370', '2018-04-10 18:03:52', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('34', '201804101810217231003WSXs0917', '2018-04-10 18:10:21', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('35', '201804101954581251003WSXs3108', '2018-04-10 19:54:58', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('36', '201804102034019331003WSXs3772', '2018-04-10 20:34:01', '2', '11.00', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('37', '201804102037157511003WSXs4909', '2018-04-10 20:37:15', '1', '0.01', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('38', '201804102040316761003WSXs1848', '2018-04-10 20:40:31', '2', '0.01', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('39', '201804102042237321003WSXs4756', '2018-04-10 20:42:23', '1', '0.01', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('40', '201804111002352171003WSXs3212', '2018-04-11 10:02:35', '2', '0.01', '6', '1', null, '1', '0');
INSERT INTO `xl_order` VALUES ('41', '201804111905100801003WSXs2901', '2018-04-11 19:05:10', '1', '0.01', '5', '3', null, '1', '0');
INSERT INTO `xl_order` VALUES ('42', '201804121135323061003WSXs3880', '2018-04-12 11:35:32', '2', '0.01', '7', '1', null, '1', '0');
INSERT INTO `xl_order` VALUES ('43', '201804121136184451003WSXs1490', '2018-04-12 11:36:18', '2', '0.01', '7', '1', null, '1', '0');
INSERT INTO `xl_order` VALUES ('44', '201804122159210411003WSXs1873', '2018-04-12 21:59:21', '2', '0.01', '6', '1', null, '1', '0');
INSERT INTO `xl_order` VALUES ('45', '201804151228253191003WSXs4122', '2018-04-15 12:28:25', '2', '0.01', '7', '1', null, '1', '0');
INSERT INTO `xl_order` VALUES ('46', '201804190055315411226oHqi2883', '2018-04-19 00:55:31', '1', '0.01', '23', '1', null, '1', '0');
INSERT INTO `xl_order` VALUES ('47', '201804200826478911226oHqi0232', '2018-04-20 08:26:47', '2', '0.01', '24', '3', null, '1', '0');

-- ----------------------------
-- Table structure for `xl_order_send`
-- ----------------------------
DROP TABLE IF EXISTS `xl_order_send`;
CREATE TABLE `xl_order_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(29) DEFAULT NULL COMMENT '订单编号',
  `time` datetime DEFAULT NULL,
  `money` double(20,2) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `is_claim` int(11) NOT NULL DEFAULT '0' COMMENT '是否认领(0未认领，1认领)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_order_send
-- ----------------------------
INSERT INTO `xl_order_send` VALUES ('1', '1', null, null, null, '2', '1', '0');

-- ----------------------------
-- Table structure for `xl_question`
-- ----------------------------
DROP TABLE IF EXISTS `xl_question`;
CREATE TABLE `xl_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) DEFAULT NULL,
  `question_num` int(33) DEFAULT NULL COMMENT '第几题',
  `question_content` varchar(2000) DEFAULT NULL COMMENT '题目内容',
  `ques_type` varchar(10) DEFAULT NULL COMMENT '第几种题型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `xl_type`
-- ----------------------------
DROP TABLE IF EXISTS `xl_type`;
CREATE TABLE `xl_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目类型表(类型有很多种）',
  `name` char(22) DEFAULT NULL COMMENT '类型名称',
  `flag` int(11) DEFAULT '1' COMMENT '1：表示有效 2：表示无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
-- Table structure for `xl_vip`
-- ----------------------------
DROP TABLE IF EXISTS `xl_vip`;
CREATE TABLE `xl_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) DEFAULT NULL COMMENT '用户标示',
  `vip_flag` varchar(2) DEFAULT NULL COMMENT '是否vip(1:就是vip)',
  `subscribeTime` datetime DEFAULT NULL,
  `unsubscribeTime` datetime DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL COMMENT '昵称',
  `unionid` varchar(255) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `privilege` varchar(255) DEFAULT NULL COMMENT '用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '图像',
  `country` varchar(10) DEFAULT NULL COMMENT '国家',
  `city` varchar(10) DEFAULT NULL COMMENT '城市',
  `province` varchar(10) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_vip
-- ----------------------------
INSERT INTO `xl_vip` VALUES ('1', 'orbjZ0aqwtih78KO7jUDQbDLg5vI', '1', '2018-03-22 16:48:51', '2018-03-22 16:48:54', 'Explorer', '1', '1', '1', '1', '1', '1', '1', '2018-03-22 16:49:20', '11');
INSERT INTO `xl_vip` VALUES ('5', 'o-WSXs7MVWJrwNylBRslCUpCxvL0', null, null, null, 'JimYi', 'otjaQwW8KSysvrJZ-SUD8d7Y9dEk', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIN9JryRr3SkZY5ewWXCLAuYCGxfdvsc8MgV67kwB24ueeenjePtEd6YXGsBmop1XMOQ5IIm4SWng/132', '中国', '广州', '广东', '1', null, null);
INSERT INTO `xl_vip` VALUES ('6', 'o-WSXs7DeHS_FmZxGKoM3gsIWdDU', null, null, null, '鸿达-希鲁备', 'otjaQwWuf8sXwryd5snHGNqon_nY', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/aoC8Dib2jlUzYKomM0SCbowWukqQhMbbm6CVeY4RWb6NAQdQc9IfFFSgiae9FjDF2mWFY9v4I5Wibx2wNiahLYSEpQ/132', '中国', '广州', '广东', '1', null, null);
INSERT INTO `xl_vip` VALUES ('7', 'o-WSXs6AunnoDgB4BtnSyKCEwwFs', null, null, null, 'Explorer', 'otjaQwWh5J-iFk5gP-RH_NvmRE1c', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/plqjbPh40gQUzm9PVvT43I3hHWcibBplp8BrIM4zHPDccEHIiaqwXyRot93D2Au2wHhibYNQ6L90WEvtOXj2F0CxA/132', '中国', '广州', '广东', '1', null, null);
INSERT INTO `xl_vip` VALUES ('8', 'o-WSXs_He6l_VeB5cW6HBXPR_dk8', null, null, null, '我心九九', 'otjaQwUL9G5dssE0UPNcxf1O_AOk', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLnh4U8IT9DzEbUxrJ5VVZKL48PaS4HrPR0dfcy8Uib2NcriaiblyRGWbCAQmJEQL2bdgB8MIUSHWiabA/132', '中国', '庆阳', '甘肃', '1', null, null);
INSERT INTO `xl_vip` VALUES ('9', 'o-WSXs3vBekjQUOmaLrflartClwQ', null, null, null, 'Z', 'otjaQwX1-QfPiBzV7ztRx_qRvCKI', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/OZkRSQ3sYZ1cJxfls8rLSiaDnn1vU9J3j5kBwahMzylXjH0R2cgyTgR0ohBcDc5U1mmPs0CGG4fLpRu9ph3YDBw/132', '希腊', '', '', '2', null, null);
INSERT INTO `xl_vip` VALUES ('10', 'o-WSXs-Z9Imhf0znPEismWyA3Eh4', null, null, null, '林燕群', 'otjaQwYGK4RfHZ2jsIJfkg6Atvyo', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/QXSmwc4hDriaj0UHgFFYRDYFPdYicAibiaLRQngUF2hZ5abiaFicC1R8M5dhXibrXxDsBVDcUHuibhO1icx7SZFHgWAghbQ/132', '中国', '广州', '广东', '2', null, null);
INSERT INTO `xl_vip` VALUES ('13', 'o-WSXs5KqxXWzN-xTXpXEMPzPwEE', null, null, null, '你若安好，便是晴天！', 'otjaQwdLHGdv3y8AA7cmNFa8MZ8k', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/lG6EAiaK5qATR2fa0thHiaAmeBt2tmHgicMcXq0zZVhb0torUyyIdIpicficvr2oBqGqPdMnhKD5Od8nY7wiajpgAxFw/132', '', '', '', '1', null, null);
INSERT INTO `xl_vip` VALUES ('14', 'o-WSXs2LP0wYxf4-mjvzdST3IoyM', null, null, null, '彤彤', 'otjaQwS07ZizAahVeHVZD2Eo55tw', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/P2rXleBYAVEVRBMYJN29HQWz4RgjLsmk81IgM0Piapw4yvMKJDw5r8IFRJx3kZheD2DyFtBtfFBd6r8syHTVkww/132', '', '', '', '0', '2018-04-13 01:35:56', null);
INSERT INTO `xl_vip` VALUES ('15', 'o-WSXsyBOhO0Cfocv9Gm-8IuR5BM', null, null, null, 'persist', 'otjaQwefHOC5566cPQqSAK8xN6Cs', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/gCD0ibVQEue5eKfw7PIyXe0kgHFkF0ic0Z3xnEBT8DwNRGk8FLKxY9V0U3F3ibkpja0WEQxFkzRLrFXBkiaonoe7ow/132', '安道尔', '', '', '2', '2018-04-13 15:07:13', null);
INSERT INTO `xl_vip` VALUES ('16', 'o-WSXsyjYbjvmF6XnIug3MrPm1yQ', null, null, null, '专属小笨蛋', 'otjaQwW81twkx7aK3lPD6SrYncdM', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEK4M2ZJicibDFlkqfobsduWgzeJnrRyrniawqD1TlzGCMxzMN5ZbpibrE2yCCX6tPgzWguiccoQKX6pGIw/132', '中国', '泉州', '福建', '1', '2018-04-14 13:01:07', null);
INSERT INTO `xl_vip` VALUES ('17', 'o-WSXs3NW19acTEG8n6D7vaOwADo', null, null, null, 'oath', 'otjaQwckYSLlqOqbYj6C3XYf5jfs', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqLZdHNHDK7hPy9GPFgFSvdjibV7StpwEKnY0KYZsFaoUpWfRWiaTs7pcHYG0JEun2abdIcWCq8t66Q/132', '中国', '杭州', '浙江', '2', '2018-04-15 21:58:46', null);
INSERT INTO `xl_vip` VALUES ('18', 'o-WSXs0zKsIYNnBL2GCnRhSCY0Dk', null, null, null, '玉', 'otjaQwXqsCTEErVMOVdOP1QglG3A', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/iaamkD3v70zF7yFAsM45n5rVzzlHJGL8swXtjltMLialTHGnsoG1fBnTs0hDQoNW6SSjgOwYrZOIBInrguH8FyJw/132', '中国', '高雄市', '台湾', '2', '2018-04-16 09:16:03', null);
INSERT INTO `xl_vip` VALUES ('19', 'o-WSXs0oZLgmnkRwudqygUl8bFuw', null, null, null, '阿童木', 'otjaQwRpnqL8bY3L2Nn7nadanipU', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83errDfSHwMhjCibI1pHiacaZq7ib8phea3jW824uuteNmYEgQnMuAooee7ribpFLwichqRaly680HubcBFg/132', '百慕大', '', '', '2', '2018-04-17 14:04:05', null);
INSERT INTO `xl_vip` VALUES ('20', 'o-WSXs0oZLgmnkRwudqygUl8bFuw', null, null, null, '阿童木', 'otjaQwRpnqL8bY3L2Nn7nadanipU', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83errDfSHwMhjCibI1pHiacaZq7ib8phea3jW824uuteNmYEgQnMuAooee7ribpFLwichqRaly680HubcBFg/132', '百慕大', '', '', '2', '2018-04-17 14:04:05', null);
INSERT INTO `xl_vip` VALUES ('21', 'o-WSXs6J_yaEhy33kMlCXfB7vFYw', null, null, null, '随遇而安', 'otjaQwZIyN7IPDQzkSbmZGE1nKdE', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/2orsWG4yiayGibAOMq2mMvU9ve4jG9umhX3be3j1nh29amFY44PnZPMLmI4jz5WMEoMHjvUjsmJs8AhfNviatUV0Q/132', '中国', '平谷', '北京', '2', '2018-04-17 22:40:08', null);
INSERT INTO `xl_vip` VALUES ('22', 'o-WSXs7VaexhBt538vJxWUt2n5L8', null, null, null, 'A$曼晟资本～孙健17706526231', 'otjaQwR-ntZYaOLbS_lSAGRWL6zQ', '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epbosdyz7JI25ibdF3tpQGnaX4vHiaicUgaEhKAzJMLDOpbWeEEX32juuiaspqEayiahs0zn1FfcT8Q66Q/132', '中国', '杭州', '浙江', '1', '2018-04-18 17:42:57', null);
INSERT INTO `xl_vip` VALUES ('23', 'oHqiPjlRTYVFFDh1Qu3P_RZ_yYhg', null, null, null, 'Explorer', null, '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/qAmFH98V1XkQPTycgKkdeQKVtbaKbkJAgsCr6icJkibt8cd7U6kELziaBsG3EgO1ophlrXScAn9GM7uUIiaYzSJ2FA/132', '中国', '广州', '广东', '1', '2018-04-19 00:55:10', null);
INSERT INTO `xl_vip` VALUES ('24', 'oHqiPjnEwz_2KKsdoLbVE0Lv-T_Q', null, null, null, '鸿达-希鲁备', null, '[]', 'http://thirdwx.qlogo.cn/mmopen/vi_32/4EWTCwognSiaXYbEe6fPhorfYdicDmteUwbE2kECcH2ul4GJABb6glAr4OxxZicAU18iacCe7IgrtQL1JX3d1AqY4A/132', '中国', '广州', '广东', '1', '2018-04-19 23:46:22', null);

-- ----------------------------
-- Table structure for `xl_vip_answer`
-- ----------------------------
DROP TABLE IF EXISTS `xl_vip_answer`;
CREATE TABLE `xl_vip_answer` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '会员答案表',
  `answer_num` int(10) DEFAULT '1' COMMENT '回答的答案是哪个',
  `question_num` int(20) DEFAULT '1' COMMENT '回答的是第几题',
  `good_id` int(11) DEFAULT NULL COMMENT '回答的是哪个测评',
  `vip_id` int(11) DEFAULT NULL COMMENT '对应的会员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_vip_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `xl_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `xl_voucher`;
CREATE TABLE `xl_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '抵用券表',
  `name` char(30) DEFAULT NULL COMMENT '抵用券名称',
  `price` double(10,2) DEFAULT NULL COMMENT '抵用券价格',
  `flag` char(2) DEFAULT '2' COMMENT '抵用券是否有效（1：有效 2：无效）系统应该设定只有一条抵用券记录是有效的，其他都无效',
  `type` char(2) DEFAULT NULL COMMENT '抵用券有两种（1：不指定某题的2：指定某题的）',
  `validate` date DEFAULT NULL COMMENT '有效期',
  `vo_num` int(50) DEFAULT NULL COMMENT '数量',
  `goodId` int(11) DEFAULT NULL COMMENT '如果type为2，则指定的goodId',
  `stipulate_price` double(10,2) DEFAULT NULL COMMENT '到达多少钱才能使用',
  `create_user` varchar(255) DEFAULT '1' COMMENT '添加抵用券的人',
  `update_user` varchar(255) DEFAULT NULL,
  `qus_type_num` int(11) DEFAULT '1' COMMENT '表示该商品下面的question分成几大类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xl_voucher
-- ----------------------------
INSERT INTO `xl_voucher` VALUES ('1', '抵用券', '20.00', '2', '2', '2018-04-28', '20', '1', '100.00', '1', '1', '1');
INSERT INTO `xl_voucher` VALUES ('2', '抵用券2', '20.00', '2', '2', '2018-04-28', '10', '1', '100.00', '1', '1', '1');
INSERT INTO `xl_voucher` VALUES ('3', '抵用券3', '30.00', '2', '2', '2018-04-30', '20', '2', '200.00', 'admin', null, '1');
INSERT INTO `xl_voucher` VALUES ('4', '抵用券4', '40.00', '2', '2', '2018-04-30', '20', '2', '200.00', 'tom', null, '1');
INSERT INTO `xl_voucher` VALUES ('5', '抵用券5', '50.00', '2', '2', '2018-04-30', '20', '2', '100.00', 'jinbang', null, '1');
INSERT INTO `xl_voucher` VALUES ('6', '抵用券6', '60.00', '2', '2', '2018-04-30', '10', '2', '100.00', '普通用户', null, '1');
INSERT INTO `xl_voucher` VALUES ('7', '抵用券7', '10.00', '2', '2', '2018-04-30', '10', '2', '100.00', '田建璐', null, '1');
INSERT INTO `xl_voucher` VALUES ('8', '抵用券8', '10.00', '2', '2', '2018-04-30', '10', '2', '100.00', '我是谁', null, '1');
INSERT INTO `xl_voucher` VALUES ('9', '抵用券9', '20.00', '2', '2', '2018-04-30', '10', '2', '100.00', 'lu', null, '1');
INSERT INTO `xl_voucher` VALUES ('10', '抵用券10', '20.00', '2', '2', '2018-05-01', '10', '2', '100.00', 'jinbang', null, '1');
INSERT INTO `xl_voucher` VALUES ('11', '抵用券11', '30.00', '1', '2', '2018-05-01', '10', '2', '200.00', 'jinbang', null, '1');
INSERT INTO `xl_voucher` VALUES ('12', '抵用券12', '40.00', '1', '2', '2018-05-01', '10', '2', '100.00', 'jinbang', null, '1');
INSERT INTO `xl_voucher` VALUES ('13', '抵用券13', '20.00', '2', '2', '2018-05-01', '10', '2', '100.00', 'tom', null, '1');
INSERT INTO `xl_voucher` VALUES ('14', '抵用券14', '20.00', '1', '2', '2018-05-01', '10', '2', '100.00', 'tom', null, '1');
