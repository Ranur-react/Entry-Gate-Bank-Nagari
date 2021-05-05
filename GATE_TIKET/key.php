<?php 
	$qry = mysqli_fetch_array(mysqli_query($conn,"SELECT*FROM `tb_config` WHERE OPTIONS='denc_key';"));
	$denc_Key=$qry['value'];
		
 ?>