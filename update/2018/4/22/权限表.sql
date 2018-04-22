-- ----------------------------
-- Table structure for xl_authority
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
