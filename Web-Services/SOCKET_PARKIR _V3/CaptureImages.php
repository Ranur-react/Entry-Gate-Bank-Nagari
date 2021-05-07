<?php 
function CaptureImages($CameraConfig,$id)
{
	

	$login = $CameraConfig['username'];
	$password = $CameraConfig['password'];
	$ip=$CameraConfig['ip']
	$url = 'http://'.$ip.'/ISAPI/Streaming/channels/101/picture';
	$target_dir=$CameraConfig['folder'].$id;

	if (!file_exists($target_dir)) {
	    mkdir($target_dir,777,true);
	}


	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL,$url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY);
	curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
	$result = curl_exec($ch);
	curl_close($ch);
	$im = imagecreatefromstring($result);
	$now = date("U");
	$newfile = "tmp/$now.jpg";
	file_put_contents($newfile, $orig);
	$newnew = imagecreatetruecolor(960,540);
	imagecopyresized($newnew, $im, 0, 0, 0, 0, 960, 540, 1920, 1080);
	$newnewfile = "$target_dir/$now-r.jpg";
	imagejpeg($newnew, $newnewfile);
	imagedestroy($im);
	imagedestroy($newnew);
	echo "<img src=\"images/$now-r.jpg\">";



} 


// ?ScreenShotUrl($url);

// CaptureImages($CameraConfig);
 ?>