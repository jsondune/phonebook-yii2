/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : phonebook-yii2

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-08-19 13:01:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gender`
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `id` char(1) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES ('1', 'ชาย', null, null, null, null);
INSERT INTO `gender` VALUES ('2', 'หญิง', null, null, null, null);
INSERT INTO `gender` VALUES ('9', 'อื่นๆ/ไม่ระบุ', null, null, null, null);

-- ----------------------------
-- Table structure for `ministry_organization`
-- ----------------------------
DROP TABLE IF EXISTS `ministry_organization`;
CREATE TABLE `ministry_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ministry_id` varchar(10) DEFAULT NULL,
  `ministry_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ministry_id` (`ministry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ministry_organization
-- ----------------------------
INSERT INTO `ministry_organization` VALUES ('1', '00', 'ไม่ระบุ');
INSERT INTO `ministry_organization` VALUES ('2', '01', 'สำนักนายกรัฐมนตรี');
INSERT INTO `ministry_organization` VALUES ('3', '02', 'กระทรวงกลาโหม');
INSERT INTO `ministry_organization` VALUES ('4', '03', 'กระทรวงการคลัง');
INSERT INTO `ministry_organization` VALUES ('5', '04', 'กระทรวงการต่างประเทศ');
INSERT INTO `ministry_organization` VALUES ('6', '05', 'กระทรวงการท่องเที่ยวและกีฬา');
INSERT INTO `ministry_organization` VALUES ('7', '06', 'กระทรวงการพัฒนาสังคมและความมั่นคงของมนุษย์');
INSERT INTO `ministry_organization` VALUES ('8', '07', 'กระทรวงเกษตรและสหกรณ์');
INSERT INTO `ministry_organization` VALUES ('9', '08', 'กระทรวงคมนาคม');
INSERT INTO `ministry_organization` VALUES ('10', '09', 'กระทรวงทรัพยากรธรรมชาติและสิ่งแวดล้อม');
INSERT INTO `ministry_organization` VALUES ('11', '11', 'กระทรวงเทคโนโลยีสารสนเทศและการสื่อสาร');
INSERT INTO `ministry_organization` VALUES ('12', '12', 'กระทรวงพลังงาน');
INSERT INTO `ministry_organization` VALUES ('13', '13', 'กระทรวงพาณิชย์');
INSERT INTO `ministry_organization` VALUES ('14', '15', 'กระทรวงมหาดไทย');
INSERT INTO `ministry_organization` VALUES ('15', '16', 'กระทรวงยุติธรรม');
INSERT INTO `ministry_organization` VALUES ('16', '17', 'กระทรวงแรงงาน');
INSERT INTO `ministry_organization` VALUES ('17', '18', 'กระทรวงวัฒนธรรม');
INSERT INTO `ministry_organization` VALUES ('18', '19', 'กระทรวงวิทยาศาสตร์และเทคโนโลยี');
INSERT INTO `ministry_organization` VALUES ('19', '20', 'กระทรวงศึกษาธิการ');
INSERT INTO `ministry_organization` VALUES ('20', '21', 'กระทรวงสาธารณสุข');
INSERT INTO `ministry_organization` VALUES ('21', '22', 'กระทรวงอุตสาหกรรม');
INSERT INTO `ministry_organization` VALUES ('22', '25', 'ส่วนราชการไม่สังกัดสำนักนายกรัฐมนตรี กระทรวง หรือทบวง');
INSERT INTO `ministry_organization` VALUES ('23', '26', 'หน่วยงานขององค์กรตามรัฐธรรมนูญ');
INSERT INTO `ministry_organization` VALUES ('24', '50', 'รัฐวิสาหกิจ');
INSERT INTO `ministry_organization` VALUES ('25', '99', 'อื่นๆ');

-- ----------------------------
-- Table structure for `organization`
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) DEFAULT NULL,
  `organization_id` varchar(10) NOT NULL DEFAULT '',
  `organization_name` varchar(255) DEFAULT NULL,
  `moph_organization_id` varchar(5) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('39', '0013700000', 'สสจ.พระนครศรีอยุธยา1', null, 'http://dev.dev1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('40', '0013800000', 'สสจ.พระนครศรีอยุธยา2', null, 'http://dev.dev2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('41', '0013900000', 'สสจ.พระนครศรีอยุธยา3', null, 'http://dev.dev3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('42', '0014000000', 'สสจ.ปราจีนบุรี1', null, 'http://dev.dev4.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('43', '0014100000', 'สสจ.ปราจีนบุรี2', null, 'http://dev.dev5.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('44', '0014200000', 'สสจ.ปราจีนบุรี3', null, 'http://dev.dev6.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('45', '0014300000', 'สสจ.ราชบุรี1', null, 'http://dev.dev7.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('46', '0014400000', 'สสจ.ราชบุรี2', null, 'http://dev.dev8.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('47', '0014500000', 'สสจ.ราชบุรี3', null, 'http://dev.dev9.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('48', '0014600000', 'กรมอนามัย1', null, 'http://dev.dev10.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('49', '0014700000', 'กรมอนามัย2', null, 'http://dev.dev11.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('50', '0014800000', 'กรมอนามัย3', null, 'http://dev.dev12.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('51', '0014900000', 'กรมการแพทย์1', null, 'http://dev.dev13.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('52', '0015000000', 'กรมการแพทย์2', null, 'http://dev.dev14.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('53', '0015100000', 'กรมการแพทย์3', null, 'http://dev.dev15.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('54', '0015200000', 'กรมพัฒนาการแพทย์แผนไทยและการแพทย์ทางเลือก1', null, 'http://dev.dev16.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('55', '0015300000', 'กรมพัฒนาการแพทย์แผนไทยและการแพทย์ทางเลือก2', null, 'http://dev.dev17.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('56', '0015400000', 'กรมพัฒนาการแพทย์แผนไทยและการแพทย์ทางเลือก3', null, 'http://dev.dev18.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('57', '0015500000', 'กรมสุขภาพจิตร1', null, 'http://dev.dev19.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('58', '0015600000', 'กรมสุขภาพจิตร2', null, 'http://dev.dev20.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('59', '0015700000', 'กรมสุขภาพจิตร3', null, 'http://dev.dev21.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('60', '0015800000', 'กรมสนับสนุนบริการสุขภาพ1', null, 'http://dev.dev22.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('61', '0015900000', 'กรมสนับสนุนบริการสุขภาพ2', null, 'http://dev.dev23.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('62', '0016000000', 'กรมสนับสนุนบริการสุขภาพ3', null, 'http://dev.dev24.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('63', '0016100000', 'kw1', null, 'http://dev.dev25.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('64', '0016200000', 'kw2', null, 'http://dev.dev26.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('65', '0016300000', 'kw3', null, 'http://dev.dev27.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('66', '0016400000', 'max saving 1', null, 'http://dev.dev28.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('67', '0016500000', 'max saving 2', null, 'http://dev.dev29.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('68', '0016600000', 'max saving 3', null, 'http://dev.dev30.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('69', '0016700000', 'กรมควบคุมโรค1', null, 'http://dev.dev31.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('70', '0016800000', 'กรมควบคุมโรค2', null, 'http://dev.dev32.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('71', '0016900000', 'กรมควบคุมโรค3', null, 'http://dev.dev33.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('72', '0017000000', 'สสจ.ปทุมธานี1', null, 'http://dev.dev34.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('73', '0017100000', 'สสจ.ปทุมธานี2', null, 'http://dev.dev35.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('74', '0017200000', 'สสจ.ปทุมธานี3', null, 'http://dev.dev36.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('75', '0017300000', 'ที่ปรึกษาโครงการสารบรรณฯกระทรวงสาธารณสุข1', null, 'http://dev.dev37.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('76', '0017400000', 'ที่ปรึกษาโครงการสารบรรณฯกระทรวงสาธารณสุข2', null, 'http://dev.dev38.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('77', '0017500000', 'ที่ปรึกษาโครงการสารบรรณฯกระทรวงสาธารณสุข3', null, 'http://dev.dev39.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('78', '0017600000', 'สำนักงานปลัดกระทรวงวิทยาศาสตร์และเทคโนโลยี1', null, 'http://dev.dev40.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('79', '0017700000', 'สำนักงานปลัดกระทรวงวิทยาศาสตร์และเทคโนโลยี2', null, 'http://dev.dev41.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('80', '0017800000', 'สำนักงานปลัดกระทรวงวิทยาศาสตร์และเทคโนโลยี3', null, 'http://dev.dev42.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('81', '0017900000', 'องค์การจัดการน้ำเสีย1', null, 'http://dev.dev43.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('82', '0018000000', 'องค์การจัดการน้ำเสีย2', null, 'http://dev.dev44.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('83', '0018100000', 'องค์การจัดการน้ำเสีย3', null, 'http://dev.dev45.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('84', '0018200000', 'bizpotential1', null, 'http://dev.bizpotential1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('85', '0018300000', 'bizpotential2', null, 'http://dev.bizpotential2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('86', '0018400000', 'bizpotential3', null, 'http://dev.bizpotential3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('87', '0018600000', 'สำนักงานปลัดกระทรวงอุตสาหกรรม [dev]', null, 'http://excelling1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('88', '0018700000', 'Excelling 2', null, 'http://excelling2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('89', '0018800000', 'Excelling 3', null, 'http://excelling3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('90', '0018900000', 'fusionsol1', null, 'http://dev.fusionsol1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('91', '0019000000', 'fusionsol2', null, 'http://dev.fusionsol2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('92', '0019100000', 'fusionsol3', null, 'http://dev.fusionsol3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('93', '0019200000', 'dsi1', null, 'http://dev.dsi1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('94', '0019300000', 'dsi2', null, 'http://dev.dsi2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('95', '0019400000', 'dsi3', null, 'http://dev.dsi3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('96', '0019500000', 'enterprise1', null, 'http://dev.enterprise1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('97', '0019600000', 'enterprise2', null, 'http://dev.enterprise2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('98', '0019700000', 'enterprise3', null, 'http://dev.enterprise3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('99', '0019800000', 'mensabiz1', null, 'http://dev.mensabiz1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('100', '0019900000', 'mensabiz2', null, 'http://dev.mensabiz2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('101', '0020000000', 'mensabiz3', null, 'http://dev.mensabiz3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('102', '0020100000', 'gttechnologies1', null, 'http://dev.gttechnologies1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('103', '0020200000', 'gttechnologies2', null, 'http://dev.gttechnologies2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('104', '0020300000', 'gttechnologies3', null, 'http://dev.gttechnologies3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('105', '0020400000', 'biotec1', null, 'http://dev.biotec1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('106', '0020500000', 'biotec2', null, 'http://dev.biotec2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('107', '0020600000', 'biotec3', null, 'http://dev.biotec3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('108', '0020700000', 'สำนักงานประกันสังคม1[dev]', null, 'http://dev.sso1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('109', '0020800000', 'สำนักงานประกันสังคม2[dev]', null, 'http://dev.sso2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('110', '0020900000', 'สำนักงานประกันสังคม3[dev]', null, 'http://dev.sso3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('111', '0021000000', 'มหาวิทยาลัยเกษตรศาสตร์1', null, 'http://dev.kasetsart1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('112', '0021100000', 'มหาวิทยาลัยเกษตรศาสตร์2', null, 'http://dev.kasetsart2.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('113', '0021200000', 'มหาวิทยาลัยเกษตรศาสตร์3', null, 'http://dev.kasetsart3.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('114', '0102100000', 'สำนักงานคณะกรรมการพัฒนาระบบราชการ', null, 'http://dev.opdc.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('115', '0102900000', 'สถาบันคุณวุฒิวิชาชีพ(องค์การมหาชน)[dev]', null, 'not active');
INSERT INTO `organization` VALUES ('116', '0200600000', 'กองทัพอากาศ', null, 'http://dev.rtaf.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('117', '0300200000', 'สำนักงานปลัดกระทรวงการคลัง', null, 'http://dev.mof.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('118', '0390100000', 'บรรษัทตลาดรองสินเชื่อที่อยู่อาศัย[dev]', null, 'http://dev.smc.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('119', '0700900000', 'กรมวิชาการเกษตร[dev]', null, 'http://dev.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('120', '0800200000', 'สำนักงานปลัดกระทรวงคมนาคม', null, 'http://dev.mot.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('121', '0900500000', 'กรมทรัพยากรธรณี[dev]', null, 'http://dev.dmr.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('122', '1100600000', 'สำนักงานส่งเสริมอุตสาหกรรมซอฟต์แวร์แห่งชาติ(องค์การมหาชน)', null, 'http://dev.sipa.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('123', '1100700000', 'สำนักงานพัฒนาธุรกรรมทางอิเล็กทรอนิกส์ (องค์การมหาชน)', null, 'http://dev.etda.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('124', '1100800000', 'สำนักงานรัฐบาลอิเล็กทรอนิกส์(องค์การมหาชน)', null, 'http://tester1.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('125', '1300200000', 'สำนักงานปลัดกระทรวงพาณิชย์', null, 'http://dev.moc.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('126', '1800200000', 'สำนักงานปลัดกระทรวงวัฒนธรรม', null, 'http://dev.culture.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('127', '1900200000', 'สำนักงานปลัดกระทรวงวิทยาศาสตร์และเทคโนโลยี[dev]', null, 'http://dev.most.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('128', '1900500000', 'สำนักงานพัฒนาวิทยาศาสตร์และเทคโนโลยีแห่งชาติ', null, 'http://dev.nstda.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('129', '1900600000', 'สำนักงานพัฒนาเทคโนโลยีอวกาศและภูมิสารสนเทศ (องค์การมหาชน)', null, 'http://dev.gistda.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('130', '2111300000', 'สำนักงานสาธารณสุขจังหวัดปทุมธานี[dev]', null, 'http://pte.dev.moph.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('131', '2111400000', 'สำนักงานสาธารณสุขจังหวัดพระนครศรีอยุธยา[dev]', null, 'http://pyo.dev.moph.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('132', '2112500000', 'สำนักงานสาธารณสุขจังหวัดปราจีนบุรี[dev]', null, 'http://pri.dev.moph.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('133', '2117000000', 'สำนักงานสาธารณสุขจังหวัดราชบุรี[dev]', null, 'http://rbr.dev.moph.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('134', '2200200000', 'สำนักงานปลัดกระทรวงอุตสาหกรรม[dev]', null, 'http://dev.industry.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('135', '2200400000', 'กรมส่งเสริมอุตสาหกรรม[dev]', null, 'http://dev.dip.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('136', '2500400000', 'สำนักงานคณะกรรมการพิเศษเพื่อประสานงานโครงการอันเนื่องมาจากพระราชดำริ (กปร.)', null, 'http://dev.rdpb.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('137', '2600300000', 'สำนักงานผู้ตรวจการแผ่นดิน', null, 'http://dev.omb.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('138', '5030700000', 'บริษัท การบินไทย จำกัด (มหาชน)[dev]', null, 'http://dev.tair.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('139', '5031200000', 'การรถไฟแห่งประเทศไทย[dev]', null, 'http://dev.srot.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('140', '5031600000', 'บริษัท กสท โทรคมนาคม จำกัด (มหาชน)', null, 'http://dev.cat.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('141', '5031700000', 'บริษัท ทีโอที จำกัด (มหาชน)', null, 'http://dev.tot.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('142', '5031900000', 'บริษัท ไปรษณีย์ไทย จำกัด', null, 'http://dev.thpo.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('143', '5050100000', 'สถาบันวิจัยวิทยาศาสตร์และเทคโนโลยีแห่งประเทศไทย', null, 'http://dev.tistr.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('144', '5050400000', 'การไฟฟ้าฝ่ายผลิตแห่งประเทศไทย', null, 'http://dev.egat.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('145', '5060100000', 'การประปานครหลวง', null, 'http://dev.mwa.ecms.ega.or.th/ecms-ws01/service2');
INSERT INTO `organization` VALUES ('146', '5060200000', 'การประปาส่วนภูมิภาค[dev]', null, 'http://dev.pwa.ecms.ega.or.th/ecms-ws01/service2');

-- ----------------------------
-- Table structure for `organization_type`
-- ----------------------------
DROP TABLE IF EXISTS `organization_type`;
CREATE TABLE `organization_type` (
  `type_id` varchar(20) NOT NULL DEFAULT '',
  `type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_type
-- ----------------------------
INSERT INTO `organization_type` VALUES ('1', 'สำนักงานสาธารณสุขจังหวัด');
INSERT INTO `organization_type` VALUES ('2', 'โรงพยาบาลศูนย์, โรงพยาบาลทั่วไป');
INSERT INTO `organization_type` VALUES ('3', 'ศูนย์อนามัย');
INSERT INTO `organization_type` VALUES ('4', 'สำนัก/กอง สังกัดกรมอนามัย');

-- ----------------------------
-- Table structure for `phone`
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriber_phone_numbers` (`subscriber_id`),
  CONSTRAINT `subscriber_phone_numbers` FOREIGN KEY (`subscriber_id`) REFERENCES `subscriber` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone
-- ----------------------------
INSERT INTO `phone` VALUES ('1', '1', '431-464-9023 x11949');
INSERT INTO `phone` VALUES ('2', '2', '+1-651-865-8866');
INSERT INTO `phone` VALUES ('3', '3', '559.765.4649 x611');
INSERT INTO `phone` VALUES ('4', '4', '(582) 616-9179 x10756');
INSERT INTO `phone` VALUES ('5', '5', '1-537-596-1790');
INSERT INTO `phone` VALUES ('6', '6', '(794) 221-0901 x5038');
INSERT INTO `phone` VALUES ('8', '7', '362.570.5660');
INSERT INTO `phone` VALUES ('9', '7', '+1 (921) 892-6689');
INSERT INTO `phone` VALUES ('10', '8', '484.584.8956 x9548');
INSERT INTO `phone` VALUES ('11', '8', '+18968121443');
INSERT INTO `phone` VALUES ('12', '9', '(860) 505-0514 x7671');
INSERT INTO `phone` VALUES ('13', '9', '(736) 384-9818 x759');
INSERT INTO `phone` VALUES ('14', '10', '706.944.6415');
INSERT INTO `phone` VALUES ('15', '10', '381.545.3913 x8181');
INSERT INTO `phone` VALUES ('18', '6', '0930730707');
INSERT INTO `phone` VALUES ('19', '12', '0959587728');
INSERT INTO `phone` VALUES ('20', '13', '0203030');

-- ----------------------------
-- Table structure for `prefix_name`
-- ----------------------------
DROP TABLE IF EXISTS `prefix_name`;
CREATE TABLE `prefix_name` (
  `id` char(3) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prefix_name
-- ----------------------------
INSERT INTO `prefix_name` VALUES ('1', 'ชาย', null, null, null, null);
INSERT INTO `prefix_name` VALUES ('2', 'หญิง', null, null, null, null);
INSERT INTO `prefix_name` VALUES ('9', 'อื่นๆ/ไม่ระบุ', null, null, null, null);

-- ----------------------------
-- Table structure for `subscriber`
-- ----------------------------
DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `prefix_name` varchar(50) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `person_type` char(1) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `line_id` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `notes` text,
  `activate_status` char(1) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_subscriber_list` (`user_id`),
  CONSTRAINT `user_subscriber_list` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscriber
-- ----------------------------
INSERT INTO `subscriber` VALUES ('1', '1', null, 'Ms. Sarina Reichert MD', null, '1976-03-19', '1', 'dummy_profilepicture1.jpg', null, null, null, null, null, null, null, 'They were just beginning to feel very queer to ME.\' \'You!\' said the Queen, pointing to the end of trials, \"There was some attempts at applause, which was full of the way YOU manage?\' Alice asked..', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('2', '1', null, 'Grayce Cruickshank', null, '1998-06-24', '1', 'dummy_profilepicture2.jpg', null, null, null, null, null, null, null, 'Dormouse, without considering at all for any lesson-books!\' And so it was only a pack of cards: the Knave of Hearts, carrying the King\'s crown on a little faster?\" said a timid and tremulous sound.].', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('3', '1', null, 'Madie Fay', null, '1975-01-19', '1', 'dummy_profilepicture3.jpg', null, null, null, null, null, null, null, 'Canterbury, found it made no mark; but he now hastily began again, using the ink, that was trickling down his cheeks, he went on muttering over the list, feeling very glad she had somehow fallen.', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('4', '1', null, 'Violette Ullrich', null, '1973-07-30', '1', 'dummy_profilepicture4.jpg', null, null, null, null, null, null, null, 'Cat said, waving its tail when I\'m pleased, and wag my tail when it\'s angry, and wags its tail when I\'m pleased, and wag my tail when I\'m pleased, and wag my tail when I\'m pleased, and wag my tail.', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('5', '1', null, 'Dr. Jayde Paucek MD', null, '1979-04-26', '1', 'dummy_profilepicture5.jpg', null, null, null, null, null, null, null, 'I think I should think very likely true.) Down, down, down. There was a little startled by seeing the Cheshire Cat: now I shall only look up in a great many teeth, so she began fancying the sort of.', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('6', '2', '', 'Kathleen Gottlieb DVM', '', '2006-04-06', '1', 'd2d42c0020e1dec53cd12cf65b9e029b.jpg', 'Computer Technical Officer', 'กองแผนงาน', 'กรมอนามัย', '', 'jsondune@gmail.com', 'jsondune', null, 'Gryphon added \'Come, let\'s hear some of them with one eye, How the Owl had the best of educations--in fact, we went to the executioner: \'fetch her here.\' And the Gryphon remarked: \'because they.', '1', null, null, '2', '0000-00-00 00:00:00');
INSERT INTO `subscriber` VALUES ('7', '2', null, 'Oral King', null, '2005-11-11', '1', 'dummy_profilepicture7.jpg', null, null, null, null, null, null, null, 'While the Panther received knife and fork with a soldier on each side, and opened their eyes and mouths so VERY nearly at the window.\' \'THAT you won\'t\' thought Alice, \'as all the players, except the.', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('8', '2', null, 'Adela Simonis', null, '1990-11-05', '1', 'dummy_profilepicture8.jpg', null, null, null, null, null, null, null, 'Alice called out as loud as she had not gone much farther before she made it out to sea. So they went on growing, and, as the March Hare,) \'--it was at in all my life, never!\' They had not got into.', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('9', '2', null, 'Lemuel Wolff', null, '2012-08-15', '1', 'dummy_profilepicture9.jpg', null, null, null, null, null, null, null, 'I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go after that into a large crowd collected round it: there was a treacle-well.\' \'There\'s no such thing!\' Alice was not even room for YOU, and no.', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('10', '2', null, 'Gerald Boyle MD', null, '1999-05-24', '1', 'dummy_profilepicture1.jpg', null, null, null, null, null, null, null, 'Caterpillar. Here was another long passage, and the fan, and skurried away into the air off all its feet at the righthand bit again, and Alice rather unwillingly took the opportunity of adding,.', null, null, null, null, null);
INSERT INTO `subscriber` VALUES ('12', '2', '', 'ดุลยวัฒน์ มาป้อง', '1', '1971-05-30', '1', 'd2d42c0020e1dec53cd12cf65b9e029b.jpg', 'นวก.คอมฯ', 'กองแผนงาน', 'กรมอนามัย', '12', 'jsondune@gmail.com', 'jsondune', null, 'ทดสอบ', '1', '2', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00');
INSERT INTO `subscriber` VALUES ('13', '2', 'Ms.', 'Pavida Mapong', '1', null, '1', '89e559e69850151c08a5e6bbe8897346.jpg', '', '', '', '', '', '', null, '', '1', '2', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(32) NOT NULL DEFAULT 'user',
  `organization_id` varchar(20) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'paYQPrNLZaDeA9VLtuy3pp7ointw6-h8', '$2y$13$itPS1vEIHKN2vfnFaBUEK.miqC6fyax0n5tHeknSPhK5YMTq8lTC.', 't7UTTrgnKYWLxjo06sxAUAYyrElHWqzE_1471285193', 'admin@myblog.loc', 'admin', null, '10', '1471285193', '1471285193');
INSERT INTO `user` VALUES ('2', 'user1', 'ybvgEfRtPutP5vLiRhA0KBj2kvgYZ8dy', '$2y$13$SzFJwKan8XeejTGV.fifCuntRCnk0wOhuu3u.kCvjV.SGUFyZA0zm', 'GN67KoO9ByzvnEebWrkn8L52FsPALtlg_1471285194', 'user1@myblog.loc', 'user', null, '10', '1471285194', '1471285194');

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(4) unsigned NOT NULL DEFAULT '0',
  `group_id` varchar(15) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', 'ADMIN', 'Administrators');
INSERT INTO `user_group` VALUES ('2', 'SUPER', 'Supervisor');
INSERT INTO `user_group` VALUES ('3', 'USER', 'User');
INSERT INTO `user_group` VALUES ('4', 'EXTUSER', 'External User');
