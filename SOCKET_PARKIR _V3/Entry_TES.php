<?php 
// Wating Sensor Loop Detector I
include 'koneksi.php';
include 'Read.php';
include 'Write.php';

include 'GenerateId.php';
include 'CaptureImages.php';
include 'PritBarcode.php';

	$id= GenerateID_Entry("01");
	PrintBarcode($id,$connfig);	
	mysqli_query($conn, "INSERT INTO `tb_gate` (`id`, `gate`,date) VALUES ('$id', 'GATE MOBIL',now());");



 ?>