/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.5-m8 : Database - test3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test3` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `test3`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(40) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`,`role`) values ('aaa','aaa',1),('asd','asd',2),('asdf','asdf',2),('fff','fff',2),('qwe','qwe',1),('qwer','qwer',2),('www','www',2);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseID` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '课程号',
  `courseNAME` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '课程名称',
  `grade` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '年级',
  `hour` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '学时',
  `credit` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `course` */

insert  into `course`(`courseID`,`courseNAME`,`grade`,`hour`,`credit`) values ('001','数据结构a','大二','10','5'),('002','网络编程','大三','15','4'),('003','Struts2','大三','15','5'),('004','计算机组成原理','大一','15','6'),('005','C++面向对象设计','大一','15','5');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `departmentID` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '院系编号',
  `departmentNAME` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '院系名称',
  `departmentHEAD` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '院系主管',
  `address` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `number` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '院系人数',
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `department` */

insert  into `department`(`departmentID`,`departmentNAME`,`departmentHEAD`,`address`,`number`) values ('001','计算机系','张飞','增城区','50'),('002','金融系','赵云','天河区','50'),('003','计算机系','马超','白云区','100'),('004','法政系','黄忠','番禺区','70'),('005','社会体育系','关羽','海珠区','200');

/*Table structure for table `grade` */

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `studentID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `courseID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `semester` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `score` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(40) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `grade` */

insert  into `grade`(`studentID`,`courseID`,`semester`,`score`,`remark`) values ('002','003','1','59','挂科'),('003','004','2','56','白给'),('005','005','1','20','emmmm'),('001','001','1','95','还行'),('004','002','2','57','继续努力');

/*Table structure for table `information` */

DROP TABLE IF EXISTS `information`;

CREATE TABLE `information` (
  `departmentID` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '院系编号',
  `studentID` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '学号',
  `name` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `type` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '学生类型',
  `date` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '入学日期',
  `native` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '籍贯',
  `ID` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `address` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '详细地址',
  `birthday` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '出生日期',
  `major` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '专业',
  `nation` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '民族',
  `phone` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `payment` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '缴费总计',
  `credit` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '已修学分',
  `remark` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `information` */

insert  into `information`(`departmentID`,`studentID`,`name`,`sex`,`type`,`date`,`native`,`ID`,`address`,`birthday`,`major`,`nation`,`phone`,`payment`,`credit`,`remark`) values ('001','001','赵政','男','本科生','12/13/2019','广东','001','河源市','12/13/2019','计算机科学与技术','汉','13725663639','21000','10','程序员'),('002','002','马鹏飞','男','本科生','12/19/2019','广东','002','湛江市','12/17/2019','计算机科学与技术','汉','18154221224','22000','20','湛江三少'),('003','003','林志华','男','本科生','12/12/2019','海南','002','海口市','12/04/2019','计算机科学与技术','汉','14554221224','22000','20','不怕冷'),('004','004','海洋','男','本科生','12/24/2019','内蒙古','004','湛江市','12/05/2019','计算机科学与技术','蒙','14554221565','22000','20','不怕热'),('005','005','陈少华','男','本科生','12/03/2019','福建','005','莆田市','12/17/2019','计算机科学与技术','汉','14554221224','22000','20','全身民牌'),('001','006','钟翔','男','本科生','12/09/2019','海南','005','海口市','12/15/2019','计算机科学与技术','汉','15422122446','22000','20','松田飞人');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
