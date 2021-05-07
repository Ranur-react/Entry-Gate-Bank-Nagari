<?php 
function CaptureImages($CameraConfig)
{
	

$login = 'admin';
$password = 'Hikvision!!';
$ip=$CameraConfig['ip']
$url = 'http://'.$ip.'/ISAPI/Streaming/channels/101/picture';
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
$newnewfile = "images/$now-r.jpg";
imagejpeg($newnew, $newnewfile);
imagedestroy($im);
imagedestroy($newnew);
echo "<img src=\"images/$now-r.jpg\">";



} 


// ?ScreenShotUrl($url);

// CaptureImages($CameraConfig);
 ?>