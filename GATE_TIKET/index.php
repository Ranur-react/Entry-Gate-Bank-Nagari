<?php 
include 'koneksi.php';
include 'AES_DENC.php';
include 'key.php';
include 'dateformat.php';
		echo json_encode("_start_");

		if ($_SERVER["REQUEST_METHOD"] == 'POST') {
			$chiper=$_POST['data'];
				// echo $chipperteks;
				 $chipperteks=str_replace(" ","+",$chiper);
				$plainteks= decrypt($chipperteks,$denc_Key);
				$data=parsing_react_api($plainteks);

				$serial=$plainteks;
					$qry = mysqli_fetch_array(mysqli_query($conn,"SELECT*FROM `tb_tiketmasuk` WHERE `id_denc_serial`='$serial';"));
						if (!empty($qry['id_denc_serial'])) {
							mysqli_query($conn,"INSERT INTO `tb_log` ( id,log,jenis_log, gate_id,date) VALUES (NULL, 'iD Tiket .$plainteks. yang digunakan sudah Tidak Berlaku karena sudah digunakan','already_used', '05',now());");
						echo "false";	
						}else{
							$level=$data['levelValue'];
							$nomorbuktiValue=$data['nomorbuktiValue'];
							 $date_serial=dateFormat($data['dateValue']);
							 $time_serial=timeFormat($data['dateValue']);
							 if (dateEqualas($date_serial)) {
								mysqli_query($conn,"INSERT INTO `db_banknagari`.`tb_tiketmasuk` (`id_ecn`, `id_denc_serial`, `date_serial`, `time_serial`, `level_tiket`, `nomor_bukti`, `date_in`, `id_gate`) VALUES ('$chipperteks', '$plainteks', '$date_serial', '$time_serial', '$level', '$nomorbuktiValue', NOW(), '05')");
							 	# code...
								echo "true";	
							 }else{
							mysqli_query($conn,"INSERT INTO `tb_log` ( id,log,jenis_log, gate_id,date) VALUES (NULL, 'iD Tiket .$plainteks. yang digunakan sudah Tidak Berlaku /Kdaluarsa','ove_due', '05',now());");

								echo "Kadaluarsa ";	
							 }
						}
		}else{
			echo "Nulll";
		}
 ?>