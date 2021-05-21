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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_config` */

insert  into `tb_config`(`options`,`value`,`no`,`key`) values 
('denc_key','WmZq4t7w!z%C*F-J',2,NULL),
('cctv_in','192.168.137.61',3,'01'),
('cctv_in','192.168.137.62',4,'02'),
('board','192.168.137.101',5,'01'),
('board','192.168.137.102',6,'02'),
('cctv_out','192.168.137.63',7,'01'),
('cctv_out','192.168.137.65',8,'02'),
('tablet','192.168.252.228',9,'01'),
('tablet','192.168.252.228',10,'02'),
('apikey','BIM%B4nd4r4111111==',11,NULL),
('board','192.168.137.103',12,'03'),
('board','192.168.137.104',13,'04'),
('idparkir','0006',14,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_entry` */

insert  into `tb_entry`(`no`,`id_entry`,`gate_id`,`date`) values 
(372,'',NULL,NULL),
(370,'000699879999936547','01','2021-05-21 23:58:43'),
(365,'00069987999993654787','01','2021-05-10 16:47:56'),
(369,'00069987999993654799','02','2021-05-21 23:53:57'),
(371,'000699879999936548','01','2021-05-22 00:05:45'),
(361,'0199319599210509992246','02','2021-05-09 22:46:55'),
(368,'0199360399210510991959','01','2021-05-10 19:59:41'),
(362,'0199457299210509992247','02','2021-05-09 22:47:47'),
(366,'0199463299210510991649','01','2021-05-10 16:49:42'),
(367,'0199580499210510991842','01','2021-05-10 18:42:40'),
(363,'0199604099210510991645','01','2021-05-10 16:45:55'),
(360,'0199865299210509992243','01','2021-05-09 22:43:41'),
(364,'0299386699210510991646','02','2021-05-10 16:46:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_exit` */

insert  into `tb_exit`(`noplat`,`id_Entry`,`date_exit`,`jenis_kendaraan`,`harga_bayar`,`jenis_bayar`,`keterangan`,`no`) values 
('','000699879999936547','2021-05-22 00:06:00','roda4',400,'qris','',2),
('','000699879999936548','2021-05-22 00:08:16','roda4',400,'qris','',3);

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
('roda2','Kendaraan Roda 2',200,'2021-05-08','admin','02'),
('roda4','Kendaraan Roda 4',400,'2021-05-08','admin','01'),
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
) ENGINE=InnoDB AUTO_INCREMENT=375019 DEFAULT CHARSET=utf8mb4;

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
(374703,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374704,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374705,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374706,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374707,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374708,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374709,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374710,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374711,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374712,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374713,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374714,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374715,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374716,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374717,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374718,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374719,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374720,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374721,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374722,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374723,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374724,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374725,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374726,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374727,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374728,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374729,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374730,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374731,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374732,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374733,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374734,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374735,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374736,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374737,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374738,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374739,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374740,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374741,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374742,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374743,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374744,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374745,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374746,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374747,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374748,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374749,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374750,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374751,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374752,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374753,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374754,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374755,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374756,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374757,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374758,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374759,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374760,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374761,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374762,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374763,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374764,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374765,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374766,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374767,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374768,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374769,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374770,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374771,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374772,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374773,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374774,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374775,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374776,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374777,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374778,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374779,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374780,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374781,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374782,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374783,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374784,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374785,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374786,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374787,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374788,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374789,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374790,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374791,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374792,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374793,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374794,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374795,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374796,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374797,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374798,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374799,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374800,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374801,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374802,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374803,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374804,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374805,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374806,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374807,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374808,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374809,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374810,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374811,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374812,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374813,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374814,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374815,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374816,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374817,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374818,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374819,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374820,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374821,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374822,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374823,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374824,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374825,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374826,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374827,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374828,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374829,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374830,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374831,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374832,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374833,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374834,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374835,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374836,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374837,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374838,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374839,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374840,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374841,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374842,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374843,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374844,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374845,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374846,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374847,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374848,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374849,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374850,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374851,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374852,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374853,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374854,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374855,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374856,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374857,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374858,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374859,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374860,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374861,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374862,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374863,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374864,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374865,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374866,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374867,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374868,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374869,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374870,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374871,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374872,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374873,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374874,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374875,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374876,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374877,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374878,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374879,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374880,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374881,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374882,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374883,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374884,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374885,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374886,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374887,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374888,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374889,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374890,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374891,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374892,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374893,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374894,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374895,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374896,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374897,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374898,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374899,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374900,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374901,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374902,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374903,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374904,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374905,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374906,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374907,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374908,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374909,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374910,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374911,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374912,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374913,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374914,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374915,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374916,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374917,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374918,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374919,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374920,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374921,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374922,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374923,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374924,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374925,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374926,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374927,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374928,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374929,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374930,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374931,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374932,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374933,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374934,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374935,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374936,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374937,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374938,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374939,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374940,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374941,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374942,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374943,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374944,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374945,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374946,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:45'),
(374947,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374948,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374949,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374950,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374951,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374952,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374953,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374954,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374955,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374956,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374957,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374958,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374959,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374960,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374961,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374962,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374963,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374964,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374965,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374966,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374967,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374968,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374969,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374970,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374971,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374972,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374973,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374974,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374975,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374976,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374977,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374978,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374979,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374980,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374981,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374982,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374983,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374984,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374985,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374986,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374987,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374988,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374989,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374990,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374991,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374992,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374993,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374994,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374995,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374996,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374997,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374998,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(374999,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375000,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375001,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375002,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375003,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375004,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375005,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375006,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375007,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375008,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375009,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375010,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375011,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375012,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375013,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375014,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375015,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375016,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375017,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46'),
(375018,'Eror Saat Membaca','erorr','01','2021-05-22 01:10:46');

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
