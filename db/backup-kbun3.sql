/*
SQLyog Community v12.3.2 (64 bit)
MySQL - 10.4.11-MariaDB : Database - db_banknagari
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_banknagari` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_banknagari`;

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `options` varchar(250) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_config` */

insert  into `tb_config`(`options`,`value`,`no`,`key`) values 
('denc_key','w!z%C*F-JaNdRgUk',2,NULL),
('cctv_in','192.168.137.61',3,'01'),
('cctv_in','192.168.137.62',4,'02'),
('board','192.168.137.101',5,'01'),
('board','192.168.137.102',6,'02'),
('cctv_out','192.168.137.63',7,'01'),
('cctv_out','192.168.137.65',8,'02');

/*Table structure for table `tb_daftar_gate` */

DROP TABLE IF EXISTS `tb_daftar_gate`;

CREATE TABLE `tb_daftar_gate` (
  `id` char(20) NOT NULL,
  `nama_gate` varchar(250) DEFAULT NULL,
  `lokasi` varchar(250) DEFAULT NULL,
  `biaya` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_daftar_gate` */

insert  into `tb_daftar_gate`(`id`,`nama_gate`,`lokasi`,`biaya`) values 
('01','ENTRY PARKIR MOBIL','ENTRY',5000),
('02','ENTRY PARKIR MOTOR','ENTRY',2000),
('03','EXIT PARKIR MOBIL','EXIT',NULL),
('04','EXIT PARKIR MOTOR','EXIT',NULL),
('05','TOUR ENTRY A','LOKET',NULL),
('06','TOUR EXIT B','LOKET',NULL);

/*Table structure for table `tb_entry` */

DROP TABLE IF EXISTS `tb_entry`;

CREATE TABLE `tb_entry` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id_entry` varchar(250) NOT NULL,
  `gate_id` char(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_entry`),
  KEY `no` (`no`),
  KEY `gate_id` (`gate_id`),
  CONSTRAINT `tb_entry_ibfk_1` FOREIGN KEY (`gate_id`) REFERENCES `tb_daftar_gate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_entry` */

insert  into `tb_entry`(`no`,`id_entry`,`gate_id`,`date`) values 
(361,'0199319599210509992246','02','2021-05-09 22:46:55'),
(368,'0199360399210510991959','01','2021-05-10 19:59:41'),
(362,'0199457299210509992247','02','2021-05-09 22:47:47'),
(366,'0199463299210510991649','01','2021-05-10 16:49:42'),
(367,'0199580499210510991842','01','2021-05-10 18:42:40'),
(363,'0199604099210510991645','01','2021-05-10 16:45:55'),
(360,'0199865299210509992243','01','2021-05-09 22:43:41'),
(365,'0299287999210510991647','02','2021-05-10 16:47:56'),
(364,'0299386699210510991646','02','2021-05-10 16:46:37');

/*Table structure for table `tb_exit` */

DROP TABLE IF EXISTS `tb_exit`;

CREATE TABLE `tb_exit` (
  `noplat` varchar(10) NOT NULL,
  `id_Entry` varchar(250) DEFAULT NULL,
  `date_exit` datetime DEFAULT NULL,
  `level_kendaraan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`noplat`),
  KEY `id_Entry` (`id_Entry`),
  KEY `level_kendaraan` (`level_kendaraan`),
  CONSTRAINT `tb_exit_ibfk_1` FOREIGN KEY (`id_Entry`) REFERENCES `tb_entry` (`id_entry`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_exit_ibfk_2` FOREIGN KEY (`level_kendaraan`) REFERENCES `tb_level_kendaraan` (`id_level`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_exit` */

/*Table structure for table `tb_hitung_dewasa` */

DROP TABLE IF EXISTS `tb_hitung_dewasa`;

CREATE TABLE `tb_hitung_dewasa` (
  `notiket` varchar(250) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`notiket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_hitung_dewasa` */

insert  into `tb_hitung_dewasa`(`notiket`,`date`) values 
('16052021190400/0001/321312312322222222','2021-05-16'),
('19052021170208/0001/0001202105191702084001','2021-05-19'),
('19052021170208/0001/0001202105191702084002','2021-05-19'),
('19052021171855/0001/0001202105191718551211','2021-05-19'),
('19052021172433/0001/0001202105191724333501','2021-05-19'),
('19052021172433/0001/0001202105191724333502','2021-05-19'),
('19052021172841/0001/0001202105191728418161','2021-05-19'),
('19052021173833/0001/0001202105191738338181','2021-05-19'),
('19052021180912/0001/0001202105191809129241','2021-05-19'),
('19052021230100/0001/0001202105192301007911','2021-05-19'),
('20052021002248/0001/0001202105200022486831','2021-05-20'),
('20052021002421/0001/0001202105200024215691','2021-05-20'),
('20052021002421/0001/0001202105200024215692','2021-05-20'),
('20052021002612/0001/0001202105200026120001','2021-05-20'),
('20052021002612/0001/0001202105200026120002','2021-05-20'),
('20052021002838/0001/0001202105200028380021','2021-05-20'),
('20052021002838/0001/00012021052000283800210','2021-05-20'),
('20052021002838/0001/0001202105200028380022','2021-05-20'),
('20052021002838/0001/0001202105200028380024','2021-05-20'),
('20052021002838/0001/0001202105200028380025','2021-05-20'),
('20052021002838/0001/0001202105200028380027','2021-05-20'),
('20052021002838/0001/0001202105200028380028','2021-05-20');

/*Table structure for table `tb_human_entry` */

DROP TABLE IF EXISTS `tb_human_entry`;

CREATE TABLE `tb_human_entry` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `detect_dewasa` int(11) DEFAULT NULL,
  `anakanak` int(11) DEFAULT NULL,
  `ticket_entry` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_human_entry` */

insert  into `tb_human_entry`(`no`,`detect_dewasa`,`anakanak`,`ticket_entry`) values 
(2,0,0,NULL);

/*Table structure for table `tb_level_kendaraan` */

DROP TABLE IF EXISTS `tb_level_kendaraan`;

CREATE TABLE `tb_level_kendaraan` (
  `id_level` varchar(20) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `tanggal_ubah` date DEFAULT NULL,
  `admin` varchar(20) DEFAULT NULL,
  `id_gate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_level`),
  KEY `id_gate` (`id_gate`),
  CONSTRAINT `tb_level_kendaraan_ibfk_1` FOREIGN KEY (`id_gate`) REFERENCES `tb_daftar_gate` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_level_kendaraan` */

insert  into `tb_level_kendaraan`(`id_level`,`nama`,`harga`,`tanggal_ubah`,`admin`,`id_gate`) values 
('roda2','Kendaraan Roda 2',2000,'2021-05-08','admin','02'),
('roda4','Kendaraan Roda 4',4000,'2021-05-08','admin','01'),
('roda6','Kendaraan Roda 6',6000,'2021-05-08','admin','01'),
('roda8','Kendaraan Roda 8',8000,'2021-05-08','admin','01');

/*Table structure for table `tb_level_tiket` */

DROP TABLE IF EXISTS `tb_level_tiket`;

CREATE TABLE `tb_level_tiket` (
  `id_level` varchar(20) NOT NULL,
  `nama_level` varchar(100) DEFAULT NULL,
  `tarif_level` double DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_level_tiket` */

insert  into `tb_level_tiket`(`id_level`,`nama_level`,`tarif_level`) values 
('0001','Dewasa',NULL),
('0002','Anak-Anak',NULL),
('0003','Touris Asing ',NULL);

/*Table structure for table `tb_log` */

DROP TABLE IF EXISTS `tb_log`;

CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` varchar(250) DEFAULT NULL,
  `jenis_log` enum('erorr','on','off','login','failure_ticket','already_used','ove_due','failure_parkir') DEFAULT NULL,
  `gate_id` char(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gate_id` (`gate_id`),
  CONSTRAINT `tb_log_ibfk_1` FOREIGN KEY (`gate_id`) REFERENCES `tb_daftar_gate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=374813 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_log` */

insert  into `tb_log`(`id`,`log`,`jenis_log`,`gate_id`,`date`) values 
(374759,'iD Tiket .19052021233034/0002/0001202105192330347531. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 23:52:34'),
(374760,'iD Tiket .19052021233034/0002/0001202105192330347531. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 23:52:37'),
(374761,'iD Tiket .20052021002421/0001/0001202105200024215692. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:33:26'),
(374762,'iD Tiket .20052021002421/0001/0001202105200024215692. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:33:28'),
(374763,'iD Tiket .20052021002421/0001/0001202105200024215692. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:33:30'),
(374764,'iD Tiket .20052021002421/0001/0001202105200024215692. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:33:34'),
(374765,'iD Tiket .20052021002421/0001/0001202105200024215692. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:33:40'),
(374766,'iD Tiket .20052021002421/0001/0001202105200024215692. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:33:50'),
(374767,'iD Tiket .20052021002421/0001/0001202105200024215691. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:33:57'),
(374768,'iD Tiket .20052021002421/0001/0001202105200024215691. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:34:06'),
(374769,'iD Tiket .20052021002421/0001/0001202105200024215691. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:34:24'),
(374770,'iD Tiket .20052021002421/0001/0001202105200024215691. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:34:45'),
(374771,'iD Tiket .20052021002421/0001/0001202105200024215692. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:34:50'),
(374772,'iD Tiket .20052021002248/0001/0001202105200022486831. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:34:56'),
(374773,'iD Tiket .20052021002838/0001/0001202105200028380025. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:38:12'),
(374774,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:39:38'),
(374775,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:39:41'),
(374776,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:39:48'),
(374777,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:39:51'),
(374778,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:39:53'),
(374779,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:39:55'),
(374780,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:39:56'),
(374781,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:40:02'),
(374782,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:40:30'),
(374783,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:40:43'),
(374784,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:41:00'),
(374785,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:41:05'),
(374786,'iD Tiket .20052021002838/0001/0001202105200028380022. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:41:15'),
(374787,'iD Tiket .20052021002838/0001/0001202105200028380022. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:41:21'),
(374788,'iD Tiket .20052021002838/0001/0001202105200028380022. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:41:46'),
(374789,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:41:49'),
(374790,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:41:51'),
(374791,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:41:53'),
(374792,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:06'),
(374793,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:08'),
(374794,'iD Tiket .20052021002838/0001/0001202105200028380022. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:15'),
(374795,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:17'),
(374796,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:19'),
(374797,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:22'),
(374798,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:27'),
(374799,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:30'),
(374800,'iD Tiket .20052021002838/0001/0001202105200028380022. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:35'),
(374801,'iD Tiket .20052021002838/0001/0001202105200028380022. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:38'),
(374802,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:42:50'),
(374803,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:44:46'),
(374804,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:44:50'),
(374805,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:44:54'),
(374806,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:45:03'),
(374807,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:45:07'),
(374808,'iD Tiket .20052021002838/0001/0001202105200028380024. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:45:13'),
(374809,'iD Tiket .20052021002838/0001/0001202105200028380022. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:50:47'),
(374810,'iD Tiket .20052021002838/0001/0001202105200028380025. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:52:48'),
(374811,'iD Tiket .20052021002838/0001/0001202105200028380025. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 00:57:41'),
(374812,'iD Tiket .20052021002838/0001/0001202105200028380025. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-20 01:02:20');

/*Table structure for table `tb_tiketmasuk` */

DROP TABLE IF EXISTS `tb_tiketmasuk`;

CREATE TABLE `tb_tiketmasuk` (
  `id_ecn` varchar(250) DEFAULT NULL,
  `id_denc_serial` varchar(250) NOT NULL,
  `date_serial` date DEFAULT NULL,
  `time_serial` time DEFAULT NULL,
  `level_tiket` varchar(20) DEFAULT NULL,
  `nomor_bukti` varchar(250) DEFAULT NULL,
  `date_in` datetime DEFAULT NULL,
  `id_gate` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_denc_serial`),
  KEY `id_pelanggan` (`date_serial`),
  KEY `id_jenis_payment` (`time_serial`),
  KEY `level_tiket` (`level_tiket`),
  CONSTRAINT `tb_tiketmasuk_ibfk_1` FOREIGN KEY (`level_tiket`) REFERENCES `tb_level_tiket` (`id_level`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_tiketmasuk` */

insert  into `tb_tiketmasuk`(`id_ecn`,`id_denc_serial`,`date_serial`,`time_serial`,`level_tiket`,`nomor_bukti`,`date_in`,`id_gate`) values 
('W1MvbniJ8pV4rA9WBRodrmM7e2M8TvMyCvzyEeTGg1Agy6NfaolyzHs4yWngi3U9','19052021233034/0002/0001202105192330347531','2021-05-19','23:30:34','0002','0001202105192330347531','2021-05-19 23:52:28','05'),
('SYr/6igL4xYzwBJKs1zeLGLlbQgSXUkPE94wv49VrTMX9uuBLNpvpWxjAQYXCBay','20052021002248/0001/0001202105200022486831','2021-05-20','00:22:48','0001','0001202105200022486831','2021-05-20 00:31:10','05'),
('cBYeVRs7HvorkEaQZoi+MGLlbQgSXUkPE94wv49VrTN9KzAk499uP8LRvPVpd7Z9','20052021002421/0001/0001202105200024215691','2021-05-20','00:24:21','0001','0001202105200024215691','2021-05-20 00:32:13','05'),
('cBYeVRs7HvorkEaQZoi+MGLlbQgSXUkPE94wv49VrTOH61mc+Q2GhI2IrF8HtElE','20052021002421/0001/0001202105200024215692','2021-05-20','00:24:21','0001','0001202105200024215692','2021-05-20 00:32:59','05'),
('lYouI8moQUM31WrEnquoQGLlbQgSXUkPE94wv49VrTOIOkB78y5Pd2/fuSJQGgIN','20052021002612/0001/0001202105200026120001','2021-05-20','00:26:12','0001','0001202105200026120001','2021-05-20 00:35:15','05'),
('lYouI8moQUM31WrEnquoQGLlbQgSXUkPE94wv49VrTMR+CmMN/uW9AIqkcgcDeU1','20052021002612/0001/0001202105200026120002','2021-05-20','00:26:12','0001','0001202105200026120002','2021-05-20 00:34:35','05'),
('TQ6MQdtSjkv//V62OF+r0mLlbQgSXUkPE94wv49VrTOHeH7oIldoWJDC/Oxrm3Ms','20052021002838/0001/0001202105200028380021','2021-05-20','00:28:38','0001','0001202105200028380021','2021-05-20 00:43:39','05'),
('TQ6MQdtSjkv//V62OF+r0mLlbQgSXUkPE94wv49VrTMwux2ZkgdIvXD45al7ui7H','20052021002838/0001/00012021052000283800210','2021-05-20','00:28:38','0001','00012021052000283800210','2021-05-20 00:36:42','05'),
('TQ6MQdtSjkv//V62OF+r0mLlbQgSXUkPE94wv49VrTOp8uZzkuxk4dXKm74/yZga','20052021002838/0001/0001202105200028380022','2021-05-20','00:28:38','0001','0001202105200028380022','2021-05-20 00:38:57','05'),
('TQ6MQdtSjkv//V62OF+r0mLlbQgSXUkPE94wv49VrTMkDzkDZHtHpBXRaQ+2TOaT','20052021002838/0001/0001202105200028380024','2021-05-20','00:28:38','0001','0001202105200028380024','2021-05-20 00:38:21','05'),
('TQ6MQdtSjkv//V62OF+r0mLlbQgSXUkPE94wv49VrTM8GyKsM4HAZ+7nQC+/Q6uY','20052021002838/0001/0001202105200028380025','2021-05-20','00:28:38','0001','0001202105200028380025','2021-05-20 00:37:08','05'),
('TQ6MQdtSjkv//V62OF+r0mLlbQgSXUkPE94wv49VrTPgIdOz+1ppsKkv9cGluhGX','20052021002838/0001/0001202105200028380027','2021-05-20','00:28:38','0001','0001202105200028380027','2021-05-20 01:02:31','05'),
('TQ6MQdtSjkv//V62OF+r0mLlbQgSXUkPE94wv49VrTNO18BG7QGkmYxp76ZC0ZM2','20052021002838/0001/0001202105200028380028','2021-05-20','00:28:38','0001','0001202105200028380028','2021-05-20 00:46:46','05');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `kode_user` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level_user` char(1) DEFAULT NULL,
  `status_user` char(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id_user`,`kode_user`,`email`,`password`,`level_user`,`status_user`,`created_at`) values 
(1,0,'admin@admin.com','202cb962ac59075b964b07152d234b70','1','0','2020-03-17 12:49:32'),
(2,2,'Kasir','202cb962ac59075b964b07152d234b70','2','0','2021-05-05 01:10:53'),
(3,1,'pimpinan','202cb962ac59075b964b07152d234b70','3','0','2021-05-05 01:10:59'),
(4,0,'admin','202cb962ac59075b964b07152d234b70','1','0','2021-05-04 22:25:47');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
