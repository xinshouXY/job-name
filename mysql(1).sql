/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.53 : Database - wchospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yuyue` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yuyue`;

/*Table structure for table `wc_admin` */

DROP TABLE IF EXISTS `wc_admin`;

CREATE TABLE `wc_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '登录名称',
  `nickname` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '昵称',
  `password` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '登录密码',
  `groupid` smallint(5) NOT NULL COMMENT '用户组别id',
  `createtime` int(15) DEFAULT NULL COMMENT '创建时间',
  `updatatime` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '修改时间',
  `logintime` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '最后一次登录时间',
  `state` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1正常。',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

/*Data for the table `wc_admin` */

insert  into `wc_admin`(`id`,`username`,`nickname`,`password`,`groupid`,`createtime`,`updatatime`,`logintime`,`state`) values (1,'admin','admin','e10adc3949ba59abbe56e057f20f883e',3,1501980667,'1501980667','1509261216',1),(11,'测试4','','e10adc3949ba59abbe56e057f20f883e',5,1508571735,'','1509255684',1);

/*Table structure for table `wc_auth_group` */

DROP TABLE IF EXISTS `wc_auth_group`;

CREATE TABLE `wc_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `update_time` varchar(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户组别表';

/*Data for the table `wc_auth_group` */

insert  into `wc_auth_group`(`id`,`title`,`status`,`rules`,`update_time`) values (1,'咨询3',1,'65,66,67,27,28,6,7,8,16,18,23,20,22','1509246472'),(2,'咨询主管',1,'65,27,6,16,23,20','1508750355'),(3,'管理员',1,'65,66,67,68,27,28,29,30,6,7,8,9,16,17,18,19,23,24,25,26,20,22,41,42','1508574664'),(5,'网络总监',1,'65,27,6,16,23,20,22','1509247852'),(6,'测试',1,'27,6','');

/*Table structure for table `wc_auth_group_access` */

DROP TABLE IF EXISTS `wc_auth_group_access`;

CREATE TABLE `wc_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户、组别ID表';

/*Data for the table `wc_auth_group_access` */

insert  into `wc_auth_group_access`(`uid`,`group_id`) values (1,3),(2,1),(3,2),(6,2),(9,2),(10,5),(11,5);

/*Table structure for table `wc_auth_rule` */

DROP TABLE IF EXISTS `wc_auth_rule`;

CREATE TABLE `wc_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL,
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='组别权限表';

/*Data for the table `wc_auth_rule` */

insert  into `wc_auth_rule`(`id`,`name`,`title`,`type`,`status`,`condition`) values (1,'g','预约管理',1,1,0),(2,'y','用户管理',1,1,0),(3,'j','角色管理',1,1,0),(6,'check_role','查看角色',1,1,3),(7,'add_role','添加角色',1,1,3),(8,'update_role','修改角色',1,1,3),(9,'del_role','删除角色',1,1,3),(13,'a','疾病管理',1,1,0),(14,'b','媒体管理',1,1,0),(15,'f','医生管理',1,1,0),(16,'check_sickness','查看疾病',1,1,13),(17,'add_sickness','添加疾病',1,1,13),(18,'update_sickness','修改疾病',1,1,13),(19,'del_sickness','删除疾病',1,1,13),(20,'check_doctor','查看医生',1,1,15),(22,'add_doctor','添加医生',1,1,15),(23,'check_media','查看媒体',1,1,14),(24,'add_media','添加媒体',1,1,14),(25,'update_media','修改媒体',1,1,14),(26,'del_media','删除媒体',1,1,14),(27,'check_user','查看用户',1,1,2),(28,'add_user','添加用户',1,1,2),(29,'update_user','修改用户',1,1,2),(30,'del_user','删除用户',1,1,2),(41,'del_doctor','删除医生',1,1,15),(42,'update_doctor','修改医生信息',1,1,15),(65,'check_order','查看预约',1,1,1),(66,'add_order','添加预约',1,1,1),(67,'del_order','删除预约',1,1,1),(68,'update_order','修改预约',1,1,1);

/*Table structure for table `wc_doctor` */

DROP TABLE IF EXISTS `wc_doctor`;

CREATE TABLE `wc_doctor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(50) NOT NULL COMMENT '医生姓名',
  `add_time` int(15) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(15) DEFAULT NULL COMMENT '修改时间',
  `admin` int(11) DEFAULT NULL COMMENT '修改人',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态 0 关闭 1 开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `wc_doctor` */

insert  into `wc_doctor`(`id`,`doctor_name`,`add_time`,`update_time`,`admin`,`state`) values (1,'王二',1508488235,1508550665,NULL,1),(14,'张四',1508722496,1508722785,NULL,1),(23,'王医生',1509243211,NULL,1,0),(15,'张五',1508723074,NULL,1,1),(24,'测试',1509247894,NULL,11,1);

/*Table structure for table `wc_log` */

DROP TABLE IF EXISTS `wc_log`;

CREATE TABLE `wc_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_content` text NOT NULL COMMENT '日志内容',
  `admin` int(11) NOT NULL COMMENT '操作人',
  `ip` varchar(30) DEFAULT NULL COMMENT 'ip',
  `area` varchar(50) DEFAULT NULL COMMENT '所在地',
  `add_time` int(15) NOT NULL COMMENT '日志添加时间',
  `state` tinyint(1) DEFAULT '1' COMMENT '日志状态 1为未删除 0为删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

/*Data for the table `wc_log` */

insert  into `wc_log`(`id`,`log_content`,`admin`,`ip`,`area`,`add_time`,`state`) values (1,'成功添加一条疾病信息',1,NULL,NULL,1509158763,1),(2,'成功添加一条疾病信息',1,NULL,NULL,1509160659,1),(3,'成功添加一条疾病信息',1,'0.0.0.0','IANA保留地址',1509160770,1),(4,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509168562,1),(5,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509169592,1),(6,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509169599,1),(7,'删除一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509169616,1),(8,'删除一条名称为[测试1,测试3,]的疾病信息',1,'0.0.0.0','IANA保留地址',1509169729,1),(9,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509169998,1),(10,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170007,1),(11,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170015,1),(12,'删除一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170021,1),(13,'删除一条名称为[测试2]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170062,1),(14,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170082,1),(15,'删除多条条名称为[测试3,疾病5,]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170089,1),(16,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170165,1),(17,'添加一条名称为[]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170174,1),(18,'删除多条条名称为[测试74,测试25,]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170182,1),(19,'添加一条名称为[速度大]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170327,1),(20,'添加一条名称为[呃呃呃]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170333,1),(21,'删除多条条名称为[速度大,呃呃呃,]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170340,1),(22,'添加一条名称为[傻吊]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170426,1),(23,'添加一条名称为[对对对]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170462,1),(24,'添加一条名称为[大厦大厦]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170507,1),(25,'添加一条名称为[对对对]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170514,1),(26,'添加一条名称为[十大]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170554,1),(27,'添加一条名称为[通天塔]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170575,1),(28,'添加一条名称为[fgggdfg]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170582,1),(29,'添加一条名称为[圣诞节卡]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170620,1),(30,'添加一条名称为[烦烦烦]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170628,1),(31,'删除多条条名称为[圣诞节卡烦烦烦,]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170636,1),(32,'添加一条名称为[方法]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170669,1),(33,'删除多条条名称为[方法]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170678,1),(34,'添加一条名称为[测试]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170695,1),(35,'添加一条名称为[大厦方法]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170703,1),(36,'删除多条条名称为[测试,大厦方法]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170713,1),(37,'管理员：admin添加一条名称为[实打实]的疾病信息',1,'0.0.0.0','IANA保留地址',1509170845,1),(38,'管理员:admin删除多条条名称为[实打实实打实实打实]的疾病信息',1,'0.0.0.0','IANA保留地址',1509174277,1),(39,'管理员:admin<span class=\"text-success\">添加</span>一条名称为',1,'0.0.0.0','IANA保留地址',1509176263,1),(40,'管理员:admin<span class=\"text-success\">添加</span>一条名称为<span class=\"text-warning\">[适当的]</span>的媒体信息',1,'0.0.0.0','IANA保留地址',1509176333,1),(41,'管理员:admin<span class=\"text-danger\">删除了</span>一条名称为[<span class=\"text-warning\">大厦大厦</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509176619,1),(42,'管理员:admin<span class=\"text-primary\">修改了</span>一条名称为[<span class=\"text-warning\">适当的2</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509176702,1),(43,'管理员:admin<span class=\"text-primary\">修改了</span>一条名称为[<span class=\"text-warning\">适当的3</span>]的媒体信息为适当的3',1,'0.0.0.0','IANA保留地址',1509176897,1),(44,'管理员:admin<span class=\"text-primary\">修改了</span>一条名称为[<span class=\"text-warning\"></span>]的媒体信息为[<span class=\"text-warning\">适当的4</span>',1,'0.0.0.0','IANA保留地址',1509176962,1),(45,'管理员:admin<span class=\"text-primary\">修改了</span>一条名称为[<span class=\"text-warning\">时代</span>]的媒体信息为[<span class=\"text-warning\">时代2]</span>',1,'0.0.0.0','IANA保留地址',1509177010,1),(46,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">适当的4</span>]的媒体状态为[<span class=\"text-warning\">关闭</span>]',1,'0.0.0.0','IANA保留地址',1509177455,1),(47,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">适当的4</span>]的媒体状态为[<span class=\"text-warning\">关闭</span>]',1,'0.0.0.0','IANA保留地址',1509177482,1),(48,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">适当的3</span>]的媒体状态为[<span class=\"text-warning\">关闭</span>]',1,'0.0.0.0','IANA保留地址',1509177537,1),(49,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">时代2</span>]的媒体状态为[<span class=\"text-warning\">开启</span>]',1,'0.0.0.0','IANA保留地址',1509177802,1),(50,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">时代2</span>]的媒体状态为[<span class=\"text-warning\">关闭</span>]',1,'0.0.0.0','IANA保留地址',1509177826,1),(51,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">时代2</span>]的媒体状态为[<span class=\"text-warning\">关闭</span>]',1,'0.0.0.0','IANA保留地址',1509177886,1),(52,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">多媒体</span>]的媒体状态为[<span class=\"text-warning\">开启</span>]',1,'0.0.0.0','IANA保留地址',1509177909,1),(53,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">多媒体2</span>]的媒体状态为[<span class=\"text-warning\">开启</span>]',1,'0.0.0.0','IANA保留地址',1509177947,1),(54,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">多媒体1</span>]的媒体信息为[<span class=\"text-warning\">多媒体1]</span>',1,'0.0.0.0','IANA保留地址',1509178168,1),(55,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">多媒体1</span>]的媒体状态为[<span class=\"text-warning\">关闭</span>]',1,'0.0.0.0','IANA保留地址',1509178194,1),(56,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">多媒体1</span>]的媒体信息为[<span class=\"text-warning\">多媒体12]</span>',1,'0.0.0.0','IANA保留地址',1509178212,1),(57,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">时代3</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509178588,1),(58,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">时代3</span>]的媒体信息为[<span class=\"text-warning\">时代4]</span>',1,'0.0.0.0','IANA保留地址',1509178612,1),(59,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">适当的4</span>]的媒体信息,状态改为[<span class=\"text-warning\">开启]</span>',1,'0.0.0.0','IANA保留地址',1509182124,1),(60,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">时代4</span>]的媒体信息,名称改为[<span class=\"text-warning\">时代3]</span>,状态改为[<span class=\"text-warning\">关闭]</span>',1,'0.0.0.0','IANA保留地址',1509182148,1),(61,'管理员:admin<span class=\"text-danger\">删除了</span>一条名称为[<span class=\"text-warning\">时代3</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509182247,1),(62,'管理员:admin<span class=\"text-danger\">删除了</span>多条条名称为[<span class=\"text-warning\">多媒体12,适当的4</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509182268,1),(63,'管理员:admin<span class=\"text-success\">添加了</span>一条名称为[<span class=\"text-warning\">营销QQ</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509182328,1),(64,'管理员:admin<span class=\"text-success\">添加了</span>一条名称为[<span class=\"text-warning\">电话</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509182343,1),(65,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">百度健康</span>]的媒体信息,名称改为[<span class=\"text-warning\">QQ]</span>,状态改为[<span class=\"text-warning\">开启]</span>',1,'0.0.0.0','IANA保留地址',1509182381,1),(66,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">百度网盟</span>]的媒体信息,名称改为[<span class=\"text-warning\">微信]</span>,状态改为[<span class=\"text-warning\">开启]</span>',1,'0.0.0.0','IANA保留地址',1509182392,1),(67,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">百度竞价</span>]的媒体信息,名称改为[<span class=\"text-warning\">商务通]</span>,状态改为[<span class=\"text-warning\">开启]</span>',1,'0.0.0.0','IANA保留地址',1509182402,1),(68,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">电话</span>]的媒体信息,状态改为[<span class=\"text-warning\">开启]</span>',1,'0.0.0.0','IANA保留地址',1509182469,1),(69,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">电话</span>]的媒体信息,状态改为[<span class=\"text-warning\">开启]</span>',1,'0.0.0.0','IANA保留地址',1509182492,1),(70,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">电话</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509182601,1),(71,'管理员:admin添加一条名称为[风湿病]的疾病信息',1,'0.0.0.0','IANA保留地址',1509182807,1),(72,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">妇科</span>]的疾病信息,名称改为[<span class=\"text-warning\">关节炎]</span>',1,'0.0.0.0','IANA保留地址',1509183059,1),(73,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">产科</span>]的疾病信息,名称改为[<span class=\"text-warning\">前列腺]</span>,状态改为[<span class=\"text-warning\">关闭]</span>',1,'0.0.0.0','IANA保留地址',1509183074,1),(74,'管理员:admin<span class=\"text-primary\">修改了</span>名称为[<span class=\"text-warning\">人流</span>]的疾病信息,名称改为[<span class=\"text-warning\">关节炎]</span>',1,'0.0.0.0','IANA保留地址',1509183088,1),(75,'管理员:admin<span class=\"text-success\">添加了</span>一条名称为[<span class=\"text-warning\">测试</span>]的疾病信息',1,'0.0.0.0','IANA保留地址',1509183110,1),(76,'管理员:admin<span class=\"text-success\">添加了</span>一条名称为[<span class=\"text-warning\">测试1</span>]的疾病信息',1,'0.0.0.0','IANA保留地址',1509183120,1),(77,'管理员:admin<span class=\"text-success\">添加了</span>一条名称为[<span class=\"text-warning\">测试集</span>]的疾病信息',1,'0.0.0.0','IANA保留地址',1509183128,1),(78,'管理员:admin<span class=\"text-danger\">删除了</span>一条名称为[<span class=\"text-warning\">测试</span>]的疾病信息',1,'0.0.0.0','IANA保留地址',1509183141,1),(79,'管理员:admin<span class=\"text-danger\">删除了</span>多条条名称为[<span class=\"text-warning\">测试1,测试集</span>]的疾病信息',1,'0.0.0.0','IANA保留地址',1509183147,1),(80,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">麻子</span>]的医生',1,'0.0.0.0','IANA保留地址',1509238744,1),(81,'管理员:admin<span class=\"text-primary\">修改了</span>医生信息[<span class=\"text-warning\">麻子</span>],名称改为[<span class=\"text-warning\">麻二子]</span>,状态改为[<span class=\"text-warning\">开启]</span>',1,'0.0.0.0','IANA保留地址',1509238833,1),(82,'管理员:admin<span class=\"text-primary\">修改了</span>医生[<span class=\"text-warning\">麻二子</span>]的信息',1,'0.0.0.0','IANA保留地址',1509238888,1),(83,'管理员:admin<span class=\"text-primary\">修改了</span>医生[<span class=\"text-warning\">麻二子</span>]的信息,状态改为[<span class=\"text-warning\">关闭]</span>',1,'0.0.0.0','IANA保留地址',1509238905,1),(84,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">测试</span>]的医生',1,'0.0.0.0','IANA保留地址',1509238931,1),(85,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">测试</span>]的医生',1,'0.0.0.0','IANA保留地址',1509238938,1),(86,'管理员:admin<span class=\"text-danger\">删除了</span>一个姓名为[<span class=\"text-warning\"></span>]的医生',1,'0.0.0.0','IANA保留地址',1509238944,1),(87,'管理员:admin<span class=\"text-danger\">删除了</span>多个医生,名称为[<span class=\"text-warning\"></span>]',1,'0.0.0.0','IANA保留地址',1509238951,1),(88,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">测试</span>]的医生',1,'0.0.0.0','IANA保留地址',1509238998,1),(89,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">张医生</span>]的医生',1,'0.0.0.0','IANA保留地址',1509239008,1),(90,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">傻医生</span>]的医生',1,'0.0.0.0','IANA保留地址',1509239019,1),(91,'管理员:admin<span class=\"text-danger\">删除了</span>一个姓名为[<span class=\"text-warning\"></span>]的医生',1,'0.0.0.0','IANA保留地址',1509239027,1),(92,'管理员:admin<span class=\"text-danger\">删除了</span>多个医生,名称为[<span class=\"text-warning\">张医生,傻医生</span>]',1,'0.0.0.0','IANA保留地址',1509239034,1),(93,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">豆豆</span>]的医生',1,'0.0.0.0','IANA保留地址',1509239085,1),(94,'管理员:admin<span class=\"text-danger\">删除了</span>一个姓名为[<span class=\"text-warning\">豆豆</span>]的医生',1,'0.0.0.0','IANA保留地址',1509239091,1),(95,'管理员:admin<span class=\"text-success\">添加了</span>一名为[<span class=\"text-warning\">发发</span>]的病人',1,'0.0.0.0','IANA保留地址',1509241777,1),(96,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">发发</span>]的病人信息,地区[<span class=\"text-warning\">贵州省-贵阳市-南明区]</span>改为[<span class=\"text-warning\">1]</span>,地区[<span class=\"text-warning\">贵州省-贵阳市-南明区]</span>改为[<span class=\"text-warning\">1]</span>,状态改为[<span class=\"text-warning\">关闭]</span>',1,'0.0.0.0','IANA保留地址',1509242183,1),(97,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">发发</span>]的病人信息,地区[<span class=\"text-warning\">1]</span>改为[<span class=\"text-warning\">贵州省-贵阳市-南明区]</span>,地区[<span class=\"text-warning\">1]</span>改为[<span class=\"text-warning\">贵州省-贵阳市-南明区]</span>',1,'0.0.0.0','IANA保留地址',1509242305,1),(98,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">发发</span>]的病人信息',1,'0.0.0.0','IANA保留地址',1509242373,1),(99,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">发发</span>]的病人信息,部门[<span class=\"text-warning\">咨询]</span>改为[<span class=\"text-warning\">]</span>',1,'0.0.0.0','IANA保留地址',1509242400,1),(100,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">天天</span>]的病人信息',1,'0.0.0.0','IANA保留地址',1509242499,1),(101,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">天天</span>]的病人信息,医生[<span class=\"text-warning\">张四]</span>改为[<span class=\"text-warning\">王二]</span>,疾病[<span class=\"text-warning\">艾滋病]</span>改为[<span class=\"text-warning\">关节炎]</span>,媒体[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>,部门[<span class=\"text-warning\">咨询]</span>改为[<span class=\"text-warning\">网络总监]</span>',1,'0.0.0.0','IANA保留地址',1509242536,1),(102,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">天天</span>]的病人信息,名称改为[<span class=\"text-warning\">偷偷]</span>,电话[<span class=\"text-warning\">18785686379]</span>改为[<span class=\"text-warning\">18785686378]</span>,备用电话[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">18785686379]</span>,微信[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">jsm18785686379]</span>,QQ[<span class=\"text-warning\">0]</span>改为[<span class=\"text-warning\">1105508021]</span>,身份证号[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">522221199512120856]</span>,年龄[<span class=\"text-warning\">0]</span>改为[<span class=\"text-warning\">21]</span>,专家号[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">007]</span>,医生[<span class=\"text-warning\">王二]</span>改为[<span class=\"text-warning\">张五]</span>,疾病[<span class=\"text-warning\">关节炎]</span>改为[<span class=\"text-warning\">艾滋病]</span>,媒体[<span class=\"text-warning\">QQ]</span>改为[<span class=\"text-warning\">商务通]</span>,部门[<span class=\"text-warning\">网络总监]</span>改为[<span class=\"text-warning\">咨询主管]</span>',1,'0.0.0.0','IANA保留地址',1509242676,1),(103,'管理员:admin<span class=\"text-success\">添加了</span>一名为[<span class=\"text-warning\">测试</span>]的病人',1,'0.0.0.0','IANA保留地址',1509242810,1),(104,'管理员:admin<span class=\"text-danger\">删除了</span>一名为[<span class=\"text-warning\">测试</span>]的病人',1,'0.0.0.0','IANA保留地址',1509243005,1),(105,'管理员:admin<span class=\"text-success\">添加了</span>一条名称为[<span class=\"text-warning\">册是</span>]的疾病信息',1,'0.0.0.0','IANA保留地址',1509243172,1),(106,'管理员:admin<span class=\"text-success\">添加了</span>一条名称为[<span class=\"text-warning\">测试</span>]的媒体信息',1,'0.0.0.0','IANA保留地址',1509243194,1),(107,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">王医生</span>]的医生',1,'0.0.0.0','IANA保留地址',1509243211,1),(108,'管理员:admin<span class=\"text-primary\">修改了</span>用户[<span class=\"text-warning\">测试</span>]的信息,部门[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">咨询]</span>',1,'0.0.0.0','IANA保留地址',1509244111,1),(109,'管理员:admin<span class=\"text-primary\">修改了</span>用户[<span class=\"text-warning\">测试</span>]的信息,部门[<span class=\"text-warning\">咨询]</span>改为[<span class=\"text-warning\">网络总监]</span>',1,'0.0.0.0','IANA保留地址',1509244171,1),(110,'管理员:admin<span class=\"text-primary\">修改了</span>用户[<span class=\"text-warning\">测试</span>]的信息修改了用户密码',1,'0.0.0.0','IANA保留地址',1509244951,1),(111,'管理员:admin<span class=\"text-primary\">修改了</span>用户[<span class=\"text-warning\">测试</span>]的信息,修改了用户密码',1,'0.0.0.0','IANA保留地址',1509244993,1),(112,'管理员:admin<span class=\"text-primary\">修改了</span>用户[<span class=\"text-warning\">测试</span>]的信息',1,'0.0.0.0','IANA保留地址',1509245057,1),(113,'管理员:admin<span class=\"text-primary\">修改了</span>用户[<span class=\"text-warning\">测试</span>]的信息,名称改为[<span class=\"text-warning\">测试t]</span>,部门[<span class=\"text-warning\">网络总监]</span>改为[<span class=\"text-warning\">咨询主管]</span>,状态改为[<span class=\"text-warning\">开启]</span>',1,'0.0.0.0','IANA保留地址',1509245092,1),(114,'管理员:admin<span class=\"text-primary\">修改了</span>用户[<span class=\"text-warning\">测试t</span>]的信息,修改了用户密码',1,'0.0.0.0','IANA保留地址',1509245130,1),(115,'管理员:admin<span class=\"text-danger\">删除了</span>一名用户[<span class=\"text-warning\">测试t</span>]',1,'0.0.0.0','IANA保留地址',1509245287,1),(116,'管理员:admin<span class=\"text-danger\">删除了</span>多名用户[<span class=\"text-warning\">测试2,测试3</span>]',1,'0.0.0.0','IANA保留地址',1509245306,1),(117,'管理员:admin<span class=\"text-primary\">修改了</span>部门名称为[<span class=\"text-warning\"></span>]的信息,名称改为[<span class=\"text-warning\">咨询2]</span>',1,'0.0.0.0','IANA保留地址',1509246433,1),(118,'管理员:admin<span class=\"text-primary\">修改了</span>部门名称为[<span class=\"text-warning\">咨询2</span>]的信息,名称改为[<span class=\"text-warning\">咨询3]</span>',1,'0.0.0.0','IANA保留地址',1509246472,1),(119,'管理员:admin<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">草草草</span>]的部门',1,'0.0.0.0','IANA保留地址',1509246690,1),(120,'管理员:admin<span class=\"text-danger\">删除了</span>一个名称为[<span class=\"text-warning\">草草草</span>]的部门',1,'0.0.0.0','IANA保留地址',1509246814,1),(121,'管理员:admin<span class=\"text-primary\">修改了</span>部门名称为[<span class=\"text-warning\">网络总监</span>]的信息',1,'0.0.0.0','IANA保留地址',1509247063,1),(122,'管理员:admin<span class=\"text-primary\">修改了</span>部门名称为[<span class=\"text-warning\">网络总监</span>]的信息,修改了部门权限',1,'0.0.0.0','IANA保留地址',1509247852,1),(123,'管理员:测试4<span class=\"text-success\">添加了</span>一个名称为[<span class=\"text-warning\">测试</span>]的医生',11,'0.0.0.0','IANA保留地址',1509247894,1),(124,'管理员:admin在2017-10-29 13:40:19<span class=\"text-muted\">退出了</span>登陆',1,'0.0.0.0','IANA保留地址',1509255619,1),(125,'管理员:admin在2017-10-29 13:40:48<span class=\"text-muted orange\">登陆了</span>后台',1,'0.0.0.0','IANA保留地址',1509255648,1),(126,'管理员:admin在2017-10-29 13:41:09<span class=\"text-muted\">退出了</span>登陆',1,'0.0.0.0','IANA保留地址',1509255669,1),(127,'管理员:测试4在2017-10-29 13:41:24<span class=\"text-muted orange\">登陆了</span>后台',11,'0.0.0.0','IANA保留地址',1509255684,1),(128,'管理员:测试4在2017-10-29 14:20:06<span class=\"text-muted\">退出了</span>登陆',11,'0.0.0.0','IANA保留地址',1509258006,1),(129,'管理员:admin在2017-10-29 14:20:23<span class=\"text-muted orange\">登陆了</span>后台',1,'0.0.0.0','IANA保留地址',1509258023,1),(130,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">偷偷</span>]的病人信息',1,'0.0.0.0','IANA保留地址',1509258046,1),(131,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">偷偷</span>]的病人信息,地区[<span class=\"text-warning\">贵州省-贵阳市-南明区]</span>改为[<span class=\"text-warning\">贵州省-贵阳市-云岩区]</span>',1,'0.0.0.0','IANA保留地址',1509258518,1),(132,'管理员:admin<span class=\"text-success\">添加了</span>一名为[<span class=\"text-warning\">十大</span>]的病人预约',1,'0.0.0.0','IANA保留地址',1509258700,1),(133,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息,医生[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>,疾病[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>,媒体[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>,部门[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>,地区[<span class=\"text-warning\">--]</span>改为[<span class=\"text-warning\">北京市-北京市市辖区-东城区]</span>',1,'0.0.0.0','IANA保留地址',1509258848,1),(134,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息,医生[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>,疾病[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>,媒体[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>,部门[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">]</span>',1,'0.0.0.0','IANA保留地址',1509258857,1),(135,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息,地区[<span class=\"text-warning\">北京市-北京市市辖区-东城区]</span>改为[<span class=\"text-warning\">贵州省-贵阳市-花溪区]</span>',1,'0.0.0.0','IANA保留地址',1509259052,1),(136,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息,医生[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">王二]</span>,疾病[<span class=\"text-warning\">]</span>改为[<span class=\"text-warning\">关节炎]</span>',1,'0.0.0.0','IANA保留地址',1509259081,1),(137,'管理员:admin<span class=\"text-danger\">删除了</span>一名为[<span class=\"text-warning\">豆豆</span>]的病人',1,'0.0.0.0','IANA保留地址',1509259148,1),(138,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息,QQ[<span class=\"text-warning\">0]</span>改为[<span class=\"text-warning\">5655845]</span>,年龄[<span class=\"text-warning\">0]</span>改为[<span class=\"text-warning\">]</span>',1,'0.0.0.0','IANA保留地址',1509259339,1),(139,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息,年龄[<span class=\"text-warning\">0]</span>改为[<span class=\"text-warning\">21]</span>',1,'0.0.0.0','IANA保留地址',1509259366,1),(140,'管理员:admin<span class=\"text-success\">添加了</span>一名为[<span class=\"text-warning\">测试</span>]的病人预约',1,'0.0.0.0','IANA保留地址',1509259402,1),(141,'管理员:admin<span class=\"text-danger\">删除了</span>一名为[<span class=\"text-warning\">测试</span>]的病人',1,'0.0.0.0','IANA保留地址',1509259439,1),(142,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息',1,'0.0.0.0','IANA保留地址',1509259947,1),(143,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息',1,'0.0.0.0','IANA保留地址',1509259991,1),(144,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息',1,'0.0.0.0','IANA保留地址',1509260858,1),(145,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">十大</span>]的病人信息,预约状态[<span class=\"text-warning\">已到]</span>改为[<span class=\"text-warning\">等待]</span>',1,'0.0.0.0','IANA保留地址',1509260947,1),(146,'管理员:admin<span class=\"text-primary\">修改了</span>姓名为[<span class=\"text-warning\">偷偷</span>]的病人信息,预约状态[<span class=\"text-warning\">未到]</span>改为[<span class=\"text-warning\">已到]</span>',1,'0.0.0.0','IANA保留地址',1509260966,1),(147,'管理员:admin在2017-10-29 15:13:01<span class=\"text-muted orange\">登陆了</span>后台',1,'192.168.0.2','局域网',1509261181,1),(148,'管理员:admin在2017-10-29 15:13:19<span class=\"text-muted\">退出了</span>登陆',1,'192.168.0.2','局域网',1509261199,1),(149,'管理员:admin在2017-10-29 15:13:36<span class=\"text-muted orange\">登陆了</span>后台',1,'192.168.0.2','局域网',1509261216,1);

/*Table structure for table `wc_media` */

DROP TABLE IF EXISTS `wc_media`;

CREATE TABLE `wc_media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `media_name` varchar(50) NOT NULL COMMENT '媒体名称',
  `add_time` int(15) DEFAULT NULL COMMENT '添加时间',
  `admin` int(11) DEFAULT NULL,
  `update_time` int(15) DEFAULT NULL COMMENT '修改时间',
  `state` tinyint(1) DEFAULT '0' COMMENT '媒体状态 0为关闭 1为开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `wc_media` */

insert  into `wc_media`(`id`,`media_name`,`add_time`,`admin`,`update_time`,`state`) values (1,'商务通',1508547495,NULL,1509182402,1),(2,'微信',1508547506,NULL,1509182392,1),(3,'QQ',1508547516,NULL,1509182381,1),(18,'电话',1509182343,1,1509182601,1),(19,'测试',1509243194,1,NULL,0),(17,'营销QQ',1509182328,1,NULL,1);

/*Table structure for table `wc_order` */

DROP TABLE IF EXISTS `wc_order`;

CREATE TABLE `wc_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL COMMENT '姓名',
  `age` smallint(3) DEFAULT NULL COMMENT '年龄',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `backup_tel` varchar(20) DEFAULT NULL COMMENT '备用电话',
  `qq` int(12) DEFAULT NULL COMMENT 'qq',
  `weixin` varchar(30) DEFAULT NULL COMMENT '微信',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证',
  `savant_num` varchar(30) DEFAULT NULL COMMENT '专家号',
  `doctor` int(11) DEFAULT NULL COMMENT '医生',
  `sickness` int(11) DEFAULT NULL COMMENT '疾病',
  `media` int(11) DEFAULT NULL COMMENT '媒体来源',
  `section` int(11) DEFAULT NULL COMMENT '部门',
  `diqu` varchar(50) DEFAULT NULL COMMENT '地区',
  `order_time` int(15) DEFAULT NULL COMMENT '预约时间',
  `come_time` int(15) DEFAULT NULL COMMENT '到院时间',
  `come_state` tinyint(1) DEFAULT '0' COMMENT '赴约状态 0未赴约 1等待 2已到',
  `chat_note` text COMMENT '聊天记录',
  `msg` varchar(255) DEFAULT NULL COMMENT '备注',
  `admin` int(11) DEFAULT NULL COMMENT '添加人',
  `add_time` int(15) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(15) DEFAULT NULL COMMENT '修改时间',
  `state` tinyint(1) DEFAULT '1' COMMENT '状态 0 禁用 1 开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `wc_order` */

insert  into `wc_order`(`id`,`username`,`age`,`sex`,`tel`,`backup_tel`,`qq`,`weixin`,`idcard`,`savant_num`,`doctor`,`sickness`,`media`,`section`,`diqu`,`order_time`,`come_time`,`come_state`,`chat_note`,`msg`,`admin`,`add_time`,`update_time`,`state`) values (15,'王宝强',NULL,NULL,'18785686379',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1508342400,1508827545,0,NULL,'7777',1,1508813091,NULL,1),(16,'蒋世明',21,0,'18785686379',NULL,1105508021,'jsm18785686379','522221199512120856','001',14,2,NULL,NULL,'--',1507564800,NULL,0,'123456','盛大盛大',1,1509008991,NULL,1),(17,'揉揉',0,NULL,'18785686379',NULL,0,'','','',1,1,NULL,NULL,'山西省-大同市-南郊区',0,NULL,0,'','',1,1509009238,NULL,1),(18,'测试',21,1,'187856886379',NULL,1105508021,'jsm18785686379','522221199512120856','007',14,9,NULL,NULL,'贵州省-铜仁市-碧江区',1507564800,NULL,0,'这是测试的聊天记录','备注信息',1,1509152315,NULL,1),(19,'豆豆',21,1,'18785686379',NULL,1105508021,'jsm18785686379','522221199512120856','007',14,17,2,2,'贵州省-贵阳市-白云区',1508169600,NULL,0,'切切切','123456',1,1509239664,NULL,1),(20,'偷偷',21,NULL,'18785686378','18785686379',1105508021,'jsm18785686379','522221199512120856','007',15,17,1,2,'贵州省-贵阳市-云岩区',1506960000,NULL,2,'','',1,1509241777,1509260966,1),(22,'十大',21,0,'18785686379','',5655845,'','','',1,1,0,0,'贵州省-贵阳市-花溪区',1508083200,NULL,1,'','',1,1509258700,1509260947,1);

/*Table structure for table `wc_sickness` */

DROP TABLE IF EXISTS `wc_sickness`;

CREATE TABLE `wc_sickness` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sickness_name` varchar(50) NOT NULL COMMENT '疾病名称',
  `add_time` int(15) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(15) DEFAULT NULL COMMENT '修改时间',
  `admin` int(11) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0' COMMENT '状态 0为关闭，1为开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Data for the table `wc_sickness` */

insert  into `wc_sickness`(`id`,`sickness_name`,`add_time`,`update_time`,`admin`,`state`) values (1,'关节炎',1508546669,1509183088,NULL,1),(2,'前列腺',1508546774,1509183074,NULL,0),(9,'关节炎',1508576919,1509183059,NULL,1),(52,'册是',1509243172,NULL,1,0),(17,'艾滋病',1509158391,NULL,1,1),(48,'风湿病',1509182807,NULL,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
