<?php 
	
	//Koneksi ke DBMS
	$severname = "localhost";
	$username = "root";
	$password = "";
	$dbname = "db_banknagari";

	$conn = new mysqli($severname, $username, $password, $dbname);
	$conn2 = new mysqli("114.7.96.242", "root", "Absensi86!!", "db_banknagari_72");
	if(!$conn){
		die("koneksi Database gagal" . mysqli_connect_error());
	}
 ?>