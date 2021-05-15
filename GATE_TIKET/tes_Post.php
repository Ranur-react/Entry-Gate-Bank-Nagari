<?php 
include 'koneksi.php';
include 'AES_DENC.php';
include 'key.php';
include 'dateformat.php';
		echo json_encode("_start_");
// 1. server menerima POST
		if ($_SERVER["REQUEST_METHOD"] == 'POST') {
			$chiper=$_POST['data'];
			$adult=$_POST['adult'];
				
		}else{
			$chiper=$_GET['data'];
			$adult=$_POST['adult'];
			// echo "Nulll";
		}


	// 2. server decnripsi plain teks POST
	$chipperteks=str_replace(" ","+",$chiper);
	$plainteks= decrypt($chipperteks,$denc_Key);
	$data=parsing_react_api($plainteks);
		$serial=$plainteks;
//dewasa state
if($data['levelValue'] =='0001' & $adult=='true'){
	echo "Asli Dewasa ESEKUSI";
}else if($data['levelValue'] =='0001' & $adult=='false'){
	echo "Palsu Dewasa REJECT";
}
//anak-anak state
else if($data['levelValue'] =='0002' & $adult=='true'){
	echo "Palsu anak-anak REJECT";
}else if($data['levelValue'] =='0002' & $adult=='false'){
	echo "Asli anak-anak ESEKUSI";
}
//Touris
else if($data['levelValue'] =='0003' & $adult=='true'){
	echo "Touris ESEKUSI";
}else if($data['levelValue'] =='0003' & $adult=='false'){
	echo "Touris ESEKUSI";

}

 ?>