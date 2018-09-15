/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-09-15 13:41:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(10) NOT NULL AUTO_INCREMENT,
  `bname` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `pirce` varchar(255) DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  `printer` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `store` int(10) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('10', '外科风云', '正午阳光影业继《琅琊榜》《欢乐颂》后，又一热播医疗职场励志剧同名小说。直击中国医患矛盾的情感极致力作，温暖而明亮的职场励志小说。老干部靳东演绎的中国医疗精英。', '78', '朱朱', '浙江文艺出版社', '2017-05-01', '治愈', '16.jpg', '2');
INSERT INTO `book` VALUES ('11', '追风筝的人', '中文版，快乐大本营高圆圆感动推荐，奥巴马送给女儿的新年礼物。为你，千千万万遍！', '17', '[美]卡勒德·胡赛尼（Khaled Hosseini）', '上海人民出版社', '2006-05-01', '治愈', '12.jpg', '99');
INSERT INTO `book` VALUES ('12', '从你的全世界路过', '2015央视年度好书，近二十年华语小说销量奇迹，超40亿阅读，每个故事都在变成电影，每一分钟，都有人看到自己。张嘉佳献给你的心动故事！', '19', '张嘉佳 ', '湖南文艺出版社', '2013-07-01', '治愈', '13.jpg', '99');
INSERT INTO `book` VALUES ('13', '解忧杂货店', '《白夜行》后东野圭吾备受欢迎作品：不是推理小说，却更扣人心弦', '27', '(日)东野圭吾', '南海出版公司', '2014-05-01', '小说', '14.jpg', '99');
INSERT INTO `book` VALUES ('14', '小王子', '梅子涵主编，国际水准手绘插画，独一无二创意栏目：揭秘大师长成记和名著诞生记，分享同名影视动画衍生剧作，打造有趣有料、有颜有品的特色大师精选童话。', '11', '(法) 圣-埃克苏佩里', '辽宁少年儿童出版社', '2017-04-01', '童话', '15.jpg', '98');
INSERT INTO `book` VALUES ('16', '阳明心学的力量', '阳明心学在中国的当代商业实践,阳明教育研究院创始人白立新、奥康集团董事长王振滔、北京大学社会科学学部副主任文东茅教授等诸多企业家、教育家学习阳明心学、致良知的生动记录', '35', '北京知行合一阳明教育研究院', '机械工业出版社', '2017-04-01', '管理学', '17.jpg', '33');
INSERT INTO `book` VALUES ('18', '丝绸之路：一部全新的世界史', '关心国家战略，一带一路必读书', '92', '彼得.弗兰科潘 (Peter Frankopan)', '浙江大学出版社', '2016-08-17', '历史', '18.jpg', '10');
INSERT INTO `book` VALUES ('19', '全球通史', '从史前史到21世纪', '87', '斯塔夫里阿诺斯', '北京大学出版社', '2006-10-01', '历史', '19.jpg', '50');
INSERT INTO `book` VALUES ('20', '史记', '(精装全三册)', '75', '司马迁', '岳麓书社', '2011-07-01', '历史', '20.jpg', '39');
INSERT INTO `book` VALUES ('21', '月亮和六便士', '(译文经典.精）', '30', '毛姆', '上海译文出版社', '2015-03-10', '小说', '21.jpg', '5');
INSERT INTO `book` VALUES ('22', '苏菲的世界', '热售榜前50', '23', '乔斯坦.贾德', '作家出版社', '2007-07-07', '小说', '22.jpg', '77');
INSERT INTO `book` VALUES ('23', '悲惨世界', '销量遥遥领先', '67', '[法]维克多·雨果', '作家出版社', '2016-06-14', '小说', '23.jpg', '3');
INSERT INTO `book` VALUES ('24', '海底两万里', '（中小学新课标必读名著）', '32', '儒勒.凡尔纳 ', '国际文化出版公司', '2017-01-17', '小说', '24.jpg', '99');
INSERT INTO `book` VALUES ('25', '钢铁是怎样炼成的', '俄中直译全译本', '29', '奥斯特洛夫斯基 ', '西安交通大学出版社', '2016-11-11', '小说', '25.jpg', '79');
INSERT INTO `book` VALUES ('26', '百年孤独', '加西亚马尔克斯代表作', '38', '加西亚·马尔克斯', '南海出版公司', '2011-06-27', '小说', '26.jpg', '68');
INSERT INTO `book` VALUES ('27', '了不起的盖茨比', '【作家榜推荐】', '26', '菲茨杰拉德', '浙江文艺出版社', '2017-03-15', '小说', '27.jpg', '44');
INSERT INTO `book` VALUES ('28', '三毛：撒哈拉的故事', '满100减50', '17', '三毛', '北京十月文艺出版社', '2013-05-15', '文学', '28.jpg', '99');
INSERT INTO `book` VALUES ('29', '鲁迅全集', '（全20卷，纪念鲁迅先生逝世80周年！）', '370', '鲁迅', '北京日报出版社（原同心出版社）', '2014-10-15', '文学', '29.jpg', '99');
INSERT INTO `book` VALUES ('30', '斯坦福极简经济学', '（当当全国独家精装升级版）', '37', '[美]泰勒', '湖南人民出版社', '2016-08-01', '经济', '30.jpg', '78');
INSERT INTO `book` VALUES ('31', '天才在左疯子在右', '（完整版）', '28', '高铭', '北京联合出版公司', '2016-01-20', '心理', '31.jpg', '88');
INSERT INTO `book` VALUES ('32', '社会心理学', '（第11版）', '111', '（美） 戴维·迈尔斯', '人民邮电出版社', '2016-01-14', '心理', '32.jpg', '48');
INSERT INTO `book` VALUES ('33', '与孤独为友', '如何获得内心世界的轻松和愉悦', '29', '和田秀树', '北京联合出版公司', '2017-04-12', '心理', '33.jpg', '49');
INSERT INTO `book` VALUES ('34', '摄影入门', '拍出美照超简单', '38', '乔旭亮', '化学工业出版社', '2016-06-06', '艺术', '34.jpg', '99');
INSERT INTO `book` VALUES ('35', '艺术的疗效', '治愈了赵薇的书！——赵薇在来往上推荐的治愈系图书。', '116', '（英）德波顿', '广西美术出版社', '2014-07-12', '艺术', '35.jpg', '99');
INSERT INTO `book` VALUES ('36', '胜者思维', '危机领导战略，思维制胜之道，决策核心思考。', '35', '金一南', '北京联合出版公司', '2017-05-10', '政治理论', '36.jpg', '99');
INSERT INTO `book` VALUES ('37', '学习关键词', '社科值得看的好书', '38', '人民日报海外版“学习小组”', '人民出版社', '2016-11-21', '政治理论', '37.jpg', '99');
INSERT INTO `book` VALUES ('38', '必然', '尼古拉·尼葛洛庞帝互联网启蒙读物《数字化生存》20周年再版', '50', '凯文·凯利', '电子工业出版社', '2016-01-16', '社会科学', '38.jpg', '99');
INSERT INTO `book` VALUES ('39', '晚学盲言', '（全两册，第二版）', '87', '钱穆', '生活.读书.新知三联书店', '2014-03-11', '社会科学', '39.jpg', '99');
INSERT INTO `book` VALUES ('40', '江村经济', '销售榜前茅', '29', '费孝通', '北京大学出版社', '2016-07-08', '社会科学', '40.jpg', '99');
INSERT INTO `book` VALUES ('41', '精通Python网络爬虫', '资深专家，以实战为导向，讲透Python网络爬虫各项核心技术和主流框架，深度讲解网络爬虫的抓取技术与反爬攻关技巧', '61', '韦玮', '机械工业出版社', '2017-04-04', '计算机', '41.jpg', '58');
INSERT INTO `book` VALUES ('42', 'Android高级进阶', '满50减10', '84', '顾浩鑫', '电子工业出版社', '2016-09-18', '计算机', '42.jpg', '17');
INSERT INTO `book` VALUES ('43', 'Python大战机器学习', '数据科学家的第一个小目标', '61', '华校专，王正林', '电子工业出版社', '2017-02-16', '计算机', '43.jpg', '88');

-- ----------------------------
-- Table structure for book_order
-- ----------------------------
DROP TABLE IF EXISTS `book_order`;
CREATE TABLE `book_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `oname` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_order
-- ----------------------------
INSERT INTO `book_order` VALUES ('3', '2017-05-27 22:43:37', 'L', '我家超市', '已发货', '7');
INSERT INTO `book_order` VALUES ('4', '2017-06-02 14:45:09', 'L', '广药生活区', '已签收', '7');
INSERT INTO `book_order` VALUES ('5', '2017-06-02 14:57:25', 'L', '王子家', '未发货', '7');
INSERT INTO `book_order` VALUES ('6', '2017-06-02 14:59:40', 'L', '家', '未发货', '7');
INSERT INTO `book_order` VALUES ('8', '2017-06-02 15:06:35', 'L', '???', '未发货', '7');
INSERT INTO `book_order` VALUES ('13', '2017-06-03 02:08:16', 'L', '我的家', '未发货', '7');
INSERT INTO `book_order` VALUES ('14', '2017-06-03 02:18:02', 'L', '你家', '未发货', '7');
INSERT INTO `book_order` VALUES ('15', '2017-06-05 14:30:41', 'L', 'WWWWW', '未发货', '7');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '10', 'L', '2017-06-01 02:03', '不错');
INSERT INTO `comment` VALUES ('2', '12', 'L', '2017-06-01 02:10', '一般般');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `book_num` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('17', '3', '10', '1', '已评价');
INSERT INTO `order_detail` VALUES ('19', '3', '12', '2', '已评价');
INSERT INTO `order_detail` VALUES ('26', '5', '14', '9', '待评价');
INSERT INTO `order_detail` VALUES ('31', '8', '16', '2', '待评价');
INSERT INTO `order_detail` VALUES ('33', '4', '22', '1', '待评价');
INSERT INTO `order_detail` VALUES ('34', '6', '21', '1', '待评价');
INSERT INTO `order_detail` VALUES ('59', '13', '10', '2', '待评价');
INSERT INTO `order_detail` VALUES ('60', '14', '10', '1', '待评价');
INSERT INTO `order_detail` VALUES ('61', '15', '14', '1', '待评价');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'bb', '123', null, null, null, null);
INSERT INTO `user` VALUES ('7', 'L', '123', '男', '12345678900', '123@qq.com', '我家');
INSERT INTO `user` VALUES ('8', '123', '213', '男', '321', '213', '3');
INSERT INTO `user` VALUES ('11', '', '', null, null, null, null);
INSERT INTO `user` VALUES ('12', '111', '222', null, null, null, null);
INSERT INTO `user` VALUES ('13', '333', '333', null, null, null, null);
INSERT INTO `user` VALUES ('14', '666', '666', null, null, null, null);
INSERT INTO `user` VALUES ('15', '777', '777', null, null, null, null);
