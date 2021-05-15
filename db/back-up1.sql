/*
SQLyog Ultimate v12.4.3 (64 bit)
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

/*Table structure for table `tb_human_entry` */

DROP TABLE IF EXISTS `tb_human_entry`;

CREATE TABLE `tb_human_entry` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `detect_dewasa` int(11) DEFAULT NULL,
  `anakanak` int(11) DEFAULT NULL,
  `ticket_entry` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_human_entry` */

insert  into `tb_human_entry`(`no`,`detect_dewasa`,`anakanak`,`ticket_entry`) values 
(1,18,-14,4);

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
) ENGINE=InnoDB AUTO_INCREMENT=374703 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_log` */

insert  into `tb_log`(`id`,`log`,`jenis_log`,`gate_id`,`date`) values 
(374680,'iD Tiket .11052021005052/0002/0001202105101450527222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-12 01:39:43'),
(374681,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 01:50:20'),
(374682,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 01:56:24'),
(374683,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 01:59:23'),
(374684,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 02:08:02'),
(374685,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 02:08:29'),
(374686,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 02:08:32'),
(374687,'iD Tiket .11052021145052/0001/0001202105101450527222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-12 02:08:55'),
(374688,'iD Tiket .11052021145052/0001/0001202105101450527222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-12 02:09:02'),
(374689,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 02:10:25'),
(374690,'iD Tiket .11052021145052/0001/0001202105101450527222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-12 02:10:51'),
(374691,'iD Tiket .11052021145052/0001/0001202105101450527222. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due','05','2021-05-12 02:10:55'),
(374692,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 02:11:56'),
(374693,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 02:11:58'),
(374694,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 03:59:12'),
(374695,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 09:20:35'),
(374696,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 09:21:14'),
(374697,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 09:36:59'),
(374698,'iD Tiket .12052021014100/0003/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 10:13:08'),
(374699,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 10:13:17'),
(374700,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 12:02:29'),
(374701,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 12:03:19'),
(374702,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 12:03:22');

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
('nqzVhi9i5Ef0iE4MpgfSy5v8iXm2OJDO54RjX/AUXXYy5OUJKdRtV75tqmYSufMT','12052021014100/0002/12312312321123123','2021-05-12','01:41:00','0002','12312312321123123','2021-05-12 12:02:55','05'),
('nqzVhi9i5Ef0iE4MpgfSy47w17jOHRN4WfgWTxoQHxUy5OUJKdRtV75tqmYSufMT','12052021014100/0003/12312312321123123','2021-05-12','01:41:00','0003','12312312321123123','2021-05-12 12:03:31','05');

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
