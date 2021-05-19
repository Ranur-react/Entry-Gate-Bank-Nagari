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
('denc_key','WmZq4t7w!z%C*F-J',2,NULL),
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
('16052021190400/0001/321312312322222222','2021-05-16');

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
) ENGINE=InnoDB AUTO_INCREMENT=374749 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_log` */

insert  into `tb_log`(`id`,`log`,`jenis_log`,`gate_id`,`date`) values 
(374706,'Test aWQC hx9HfhhzID71OFb788p1X2SrT39 MKsMO O/cOZMK6PZvTD76RNkYWVEAx4','already_used','05','2021-05-15 19:50:13'),
(374707,'Test ','already_used','05','2021-05-15 19:53:02'),
(374708,'Test true','already_used','05','2021-05-15 22:07:46'),
(374709,'Test dewasa= true  kode=aWQC hx9HfhhzID71OFb788p1X2SrT39 MKsMO O/cOZMK6PZvTD76RNkYWVEAx4','already_used','05','2021-05-15 22:10:38'),
(374710,'iD Tiket .15052021190400/0001/321312312322222222. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:02:26'),
(374711,'iD Tiket .15052021190400/0001/3213123123123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:04:03'),
(374712,'iD Tiket .15052021190400/0001/321312312322222222. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:04:18'),
(374713,'iD Tiket .15052021190400/0001/3213123123123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:13:27'),
(374714,'iD Tiket .15052021190400/0001/3213123123123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:13:33'),
(374715,'iD Tiket .15052021190400/0001/3213123123123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:13:34'),
(374716,'iD Tiket .15052021190400/0001/3213123123123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:15:50'),
(374717,'iD Tiket .15052021190400/0001/3213123123123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:23:24'),
(374718,'iD Tiket .15052021190400/0001/321312312322222222. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:23:28'),
(374719,'iD Tiket .15052021190400/0001/321312312322222222. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-15 23:26:47'),
(374720,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:01:31'),
(374721,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:01:33'),
(374722,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:01:42'),
(374723,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:02:05'),
(374724,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:02:14'),
(374725,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:02:24'),
(374726,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:02:27'),
(374727,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:02:35'),
(374728,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:04:06'),
(374729,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:04:10'),
(374730,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:05:16'),
(374731,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:05:31'),
(374732,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:22:43'),
(374733,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:23:02'),
(374734,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:27:04'),
(374735,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:29:02'),
(374736,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:29:07'),
(374737,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:29:15'),
(374738,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:29:23'),
(374739,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:29:45'),
(374740,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:29:50'),
(374741,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:30:28'),
(374742,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:30:39'),
(374743,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:30:47'),
(374744,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:31:05'),
(374745,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:31:56'),
(374746,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:31:58'),
(374747,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:32:01'),
(374748,'iD Tiket .15052021190400/0002/321312312322222222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-16 00:32:14');

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
('HZ5ettokQc8RTSPnIGCvGAtSKxF7bIr8YhgqxEK3k5QJBMu59avEKulpWMNUfvuD','16052021190400/0001/321312312322222222','2021-05-16','19:04:00','0001','321312312322222222','2021-05-16 01:18:46','05'),
('HZ5ettokQc8RTSPnIGCvGCRhqHLsCZlAmjzIHMgjH1QJBMu59avEKulpWMNUfvuD','16052021190400/0002/321312312322222222','2021-05-16','19:04:00','0002','321312312322222222','2021-05-16 01:19:21','05'),
('HZ5ettokQc8RTSPnIGCvGDG6YxSMXR30ntRewLhIZucJBMu59avEKulpWMNUfvuD','16052021190400/0003/321312312322222222','2021-05-16','19:04:00','0003','321312312322222222','2021-05-16 01:19:54','05');

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
