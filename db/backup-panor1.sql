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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_config` */

insert  into `tb_config`(`options`,`value`,`no`,`key`) values 
('denc_key','G-KaPdRgUkXp2s5v',2,NULL),
('cctv_in','192.168.137.61',3,'01'),
('cctv_in','192.168.137.62',4,'02'),
('board','192.168.137.101',5,'01'),
('board','192.168.137.102',6,'02'),
('cctv_out','192.168.137.63',7,'01'),
('cctv_out','192.168.137.65',8,'02'),
('tablet','192.168.43.105',9,'01'),
('tablet','192.168.43.105',10,'02'),
('apikey','BIM%B4nd4r4111111==',11,NULL),
('board','192.168.137.103',12,'03'),
('board','192.168.137.104',13,'04');

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
(364,'0299386699210510991646','02','2021-05-10 16:46:37'),
(365,'99999','01','2021-05-10 16:47:56');

/*Table structure for table `tb_exit` */

DROP TABLE IF EXISTS `tb_exit`;

CREATE TABLE `tb_exit` (
  `noplat` varchar(10) DEFAULT NULL,
  `id_Entry` varchar(250) DEFAULT NULL,
  `date_exit` datetime DEFAULT NULL,
  `jenis_kendaraan` varchar(20) DEFAULT NULL,
  `harga_bayar` double DEFAULT NULL,
  `jenis_bayar` enum('tunai','qris') DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `no` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`no`),
  KEY `id_Entry` (`id_Entry`),
  KEY `level_kendaraan` (`jenis_kendaraan`),
  CONSTRAINT `tb_exit_ibfk_1` FOREIGN KEY (`id_Entry`) REFERENCES `tb_entry` (`id_entry`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_exit_ibfk_2` FOREIGN KEY (`jenis_kendaraan`) REFERENCES `tb_level_kendaraan` (`id_level`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

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
('ksajdlakjsdlakdj','2021-05-16');

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
('roda6','Kendaraan Roda 6 Lebih',100,'2021-05-08','admin','01');

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
) ENGINE=InnoDB AUTO_INCREMENT=374712 DEFAULT CHARSET=utf8mb4;

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
(374702,'iD Tiket .12052021014100/0002/12312312321123123. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-12 12:03:22'),
(374703,'iD Tiket .19052021153703/0001/0003202105191537038491. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 15:56:02'),
(374704,'iD Tiket .19052021153703/0001/0003202105191537038491. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 15:56:05'),
(374705,'iD Tiket .19052021153703/0001/0003202105191537038491. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 15:56:06'),
(374706,'iD Tiket .19052021153703/0001/0003202105191537038491. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 15:56:10'),
(374707,'iD Tiket .19052021155737/0001/0003202105191557376721. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 16:05:52'),
(374708,'iD Tiket .19052021160238/0001/0003202105191602382871. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 16:11:37'),
(374709,'iD Tiket .19052021161040/0002/0003202105191610405836. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 16:20:48'),
(374710,'iD Tiket .19052021161040/0002/0003202105191610405839. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 16:21:11'),
(374711,'iD Tiket .19052021161040/0002/0003202105191610405839. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used','05','2021-05-19 16:21:21');

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
('+8FHHAN5r5qX+Iqr+bLjYSE6rd9bt9apr3+w000vya3l0Q4TnyRa/oj4M7nwTZrt','19052021153232/0001/0003202105191532321961','2021-05-19','15:32:32','0001','0003202105191532321961','2021-05-19 15:46:31','05'),
('+8FHHAN5r5qX+Iqr+bLjYSE6rd9bt9apr3+w000vya07fZU0gUHjjmGqaAmtI0TR','19052021153232/0001/0003202105191532321962','2021-05-19','15:32:32','0001','0003202105191532321962','2021-05-19 15:46:45','05'),
('+RGEwmRfSyzb060Jit/kJiE6rd9bt9apr3+w000vya3QLb73ns3JuLxkmJu2bc0+','19052021153703/0001/0003202105191537038491','2021-05-19','15:37:03','0001','0003202105191537038491','2021-05-19 15:55:54','05'),
('BrQ6QoMYixCwNS83FBCMDiE6rd9bt9apr3+w000vya2w2cgRAh4k6IWrLyZGWyIV','19052021155737/0001/0003202105191557376721','2021-05-19','15:57:37','0001','0003202105191557376721','2021-05-19 16:05:25','05'),
('cUGb6G4DGDVrqCVcpxi28SE6rd9bt9apr3+w000vya1RnRdMsIa9VFvDsW2rYslP','19052021160238/0001/0003202105191602382871','2021-05-19','16:02:38','0001','0003202105191602382871','2021-05-19 16:10:27','05'),
('cUGb6G4DGDVrqCVcpxi28SE6rd9bt9apr3+w000vya2r8xrNfnHFFFzxMaFnOokw','19052021160238/0001/0003202105191602382872','2021-05-19','16:02:38','0001','0003202105191602382872','2021-05-19 16:10:13','05'),
('cUGb6G4DGDVrqCVcpxi28UiWZThqyBkAaSVNPsk4ySxzG+b1/z1lDCHcZB5npHSG','19052021160238/0002/0003202105191602382873','2021-05-19','16:02:38','0002','0003202105191602382873','2021-05-19 16:10:48','05'),
('yVTcX0KUGKXsaEGAlGv6AUiWZThqyBkAaSVNPsk4ySwOmgEo4qNV3zqxRFM4hURT','19052021160524/0002/0003202105191605244331','2021-05-19','16:05:24','0002','0003202105191605244331','2021-05-19 16:12:46','05'),
('7SMSwEzJ4MoV76A7861ZRUiWZThqyBkAaSVNPsk4ySzDhedwXd0UMZtJuDEVtV+8','19052021161040/0002/00032021051916104058310','2021-05-19','16:10:40','0002','00032021051916104058310','2021-05-19 16:20:18','05'),
('7SMSwEzJ4MoV76A7861ZRUiWZThqyBkAaSVNPsk4ySy6VV1cONGQXh11Sf9hayVS','19052021161040/0002/0003202105191610405835','2021-05-19','16:10:40','0002','0003202105191610405835','2021-05-19 16:20:51','05'),
('7SMSwEzJ4MoV76A7861ZRUiWZThqyBkAaSVNPsk4ySxYEGi3qJ4AZfWwz2hsC1oe','19052021161040/0002/0003202105191610405836','2021-05-19','16:10:40','0002','0003202105191610405836','2021-05-19 16:20:29','05'),
('7SMSwEzJ4MoV76A7861ZRUiWZThqyBkAaSVNPsk4ySygMM2Os45hl63lQUfkYWMl','19052021161040/0002/0003202105191610405837','2021-05-19','16:10:40','0002','0003202105191610405837','2021-05-19 16:20:38','05'),
('7SMSwEzJ4MoV76A7861ZRUiWZThqyBkAaSVNPsk4ySzDw6GaiQPgwrt5sk4bNrvX','19052021161040/0002/0003202105191610405839','2021-05-19','16:10:40','0002','0003202105191610405839','2021-05-19 16:20:59','05');

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
