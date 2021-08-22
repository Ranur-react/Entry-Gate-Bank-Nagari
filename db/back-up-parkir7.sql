/*
SQLyog Community v12.3.2 (64 bit)
MySQL - 10.3.30-MariaDB : Database - db_banknagari
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_banknagari` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_banknagari`;

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `options` varchar(250) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_config` */

insert  into `tb_config`(`options`,`value`,`no`,`key`) values 
('denc_key','WmZq4t7w!z%C*F-J',2,NULL),
('cctv_in','192.168.137.61',3,'02'),
('cctv_in','192.168.137.62',4,'01'),
('board','192.168.137.102',5,'01'),
('board','192.168.137.101',6,'02'),
('cctv_out','192.168.137.63',7,'02'),
('cctv_out','192.168.137.64',8,'01'),
('tablet','192.168.71.218',9,'01'),
('tablet','192.168.71.70',10,'02'),
('apikey5','BIM%B4nd4r4111111==',11,NULL),
('board','192.168.137.103',12,'03'),
('board','192.168.137.103',13,'04'),
('apikey4','BN MDAwNg==',14,NULL),
('apikey','MDAwNg==',15,NULL),
(NULL,NULL,16,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4348 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_entry` */

insert  into `tb_entry`(`no`,`id_entry`,`gate_id`,`date`) values 
(4347,'970921082292022','02','2021-08-22 13:22:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4;

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
('roda2','Kendaraan Roda 2',200,'2021-05-08','admin','02'),
('roda4','Kendaraan Roda 4',400,'2021-05-08','admin','01'),
('roda6','Kendaraan Roda 6 Lebih',600,'2021-05-08','admin','01');

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
('K5Fzyed7hvbDklvAxeVMky4GXGiq72HNHHr+s6xjjiQy5OUJKdRtV75tqmYSufMT','02082021014100/0001/12312312321123123','2021-08-02','01:41:00','0001','12312312321123123','2021-08-02 06:18:03','05'),
('K5Fzyed7hvbDklvAxeVMk5v8iXm2OJDO54RjX/AUXXYy5OUJKdRtV75tqmYSufMT','02082021014100/0002/12312312321123123','2021-08-02','01:41:00','0002','12312312321123123','2021-08-02 06:19:07','05'),
('K5Fzyed7hvbDklvAxeVMk47w17jOHRN4WfgWTxoQHxUy5OUJKdRtV75tqmYSufMT','02082021014100/0003/12312312321123123','2021-08-02','01:41:00','0003','12312312321123123','2021-08-02 06:17:45','05');

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
(1,0,'admin@admin.com','202cb962ac59075b964b07152d234b70','1','0','2020-03-17 05:49:32'),
(2,2,'Kasir','202cb962ac59075b964b07152d234b70','2','0','2021-05-04 18:10:53'),
(3,1,'pimpinan','202cb962ac59075b964b07152d234b70','3','0','2021-05-04 18:10:59'),
(4,0,'admin','202cb962ac59075b964b07152d234b70','1','0','2021-05-04 15:25:47');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
