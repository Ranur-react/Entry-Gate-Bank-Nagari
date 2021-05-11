<?php 
			if ($_SERVER["REQUEST_METHOD"] == 'POST') {
			$chiper=$_POST['data'];
				
		}else{
			$chiper=$_GET['data'];
			// echo "Nulll";
		}
		echo "$chiper";
	mysqli_query($conn,"INSERT INTO `tb_log` ( id,log,jenis_log, gate_id,date) VALUES (NULL, 'Coba ESP QR-CodeValue---->$chiper','error', '05',now());");

 ?>