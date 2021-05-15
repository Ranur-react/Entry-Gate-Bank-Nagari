<?php 
include 'koneksi.php';

		if ($_SERVER["REQUEST_METHOD"] == 'POST') {
			$chiper=$_POST['data'];
			$adult=$_POST['adult'];
				
		}else{
			$chiper=$_GET['data'];
			$adult=$_POST['adult'];
			// echo "Nulll";
		}

mysqli_query($conn,"INSERT INTO `tb_log` ( id,log,jenis_log, gate_id,date) VALUES (NULL, 'Test dewasa= $adult  kode=$chiper','already_used', '05',now());");
	echo "Data Diterima: $chiper";
		
 ?>