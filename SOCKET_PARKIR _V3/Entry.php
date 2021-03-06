<?php 
// Wating Sensor Loop Detector I
include 'koneksi.php';

include 'erorHandler.php';
include 'Read.php';
include 'Write.php';

include 'GenerateId.php';
include 'CaptureImages.php';
include 'PritBarcode.php';


Write($connfig,'MT00004');
//1. Kendaraan Terdeteksi oleh LD1 Sensor (php READ ='IN3ON')
while(true){
	$data= Read($connfig);
	if($data == $msg=chr(0xA6)."IN3ON".chr(0xA9)){
		// 2. Jika Ada Kendaraan "Voice Welcome" Track 001 diputar (php WRITE ='MT00001')
		Write($connfig,'MT00001');
		// 3. Driver MENEKAN  Tombol "HIJAU" (php READ ='IN1ON')
		$i=true;
		while ($i) {
			echo $tombol= Read($connfig);
			if($tombol == $msg=chr(0xA6)."IN1ON".chr(0xA9)){

				// 4. Generate ID Parkir
			
				$id= GenerateID_Entry("01");

				$CameraConfig['folder']=$id;
				// 5. KAMERA Melakukan Capture Hasil Capture Insert ke Folder dengan folder name 'ID' (php Capture_Vehcle())
				CaptureImages($CameraConfig);
				// 6. ID & date log insert to DB 
				mysqli_query($conn, "INSERT INTO `tb_entry` (`id`, `gate_id`,date) VALUES ('$id', '01',now());");
				// 7. PHP mengirim Perintah Print Barcode (php PrintBarcode('Serial-Entry'))
				PrintBarcode($id,$connfig);
				// 8. Setelah Driver Mengambil Kertas Barcode, Controller Membuka Gate (php Write ='OUT1ON')
				Write($connfig,'MT00002');
				echo "Gerbang Terbuka";
				Write($connfig,'OUT1ON');
			}	
			if($tombol == $msg=chr(0xA6)."IN3OFF".chr(0xA9)){
						echo "Gerbang Tertutup";
						Write($connfig,'OUT1OFF');
						Write($connfig,'MT00022');
				$i=false;
			}

		}

	}	

	
}


 ?>