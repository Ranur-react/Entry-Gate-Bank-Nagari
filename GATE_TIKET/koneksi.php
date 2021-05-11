<?php 
	
	//Koneksi ke DBMS
	$severname = "114.7.96.242";
	$username = "root";
	$password = "Absensi86!!";
	$dbname = "db_banknagari";

	$conn = new mysqli($severname, $username, $password, $dbname);
	if(!$conn){
		die("koneksi Database gagal" . mysqli_connect_error());
	}
 ?>