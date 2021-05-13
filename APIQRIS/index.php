<?php 

$body = '{"NOTRANS":"201909100000008","BIAYA":"1000"}';
$data["NOTRANS"]="201909100000008";
$data["BIAYA"]="1000";
$array = array_map('trim', $data );
// $body= json_encode($array);


$timestamp = "2020-12-12";
$secretkey = "BIM%B4nd4r4111111==";
$salt=strtoupper('NOTRANS:201909100000008,BIAYA:1000').":".$timestamp;

echo $signature = hash_hmac('sha256',strtoupper($body).":".$timestamp,$secretkey);

echo base64_encode($signature);

$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_PORT => "8080",
  CURLOPT_URL => "http://192.168.100.39:8080",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 10,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => array(
    "NOTRANS:201909100000008",
    "BIAYA:1000"),
  CURLOPT_HTTPHEADER => array(
    "Authorization: BN OTA5",
    "Cache-Control: no-cache",
    "Content-Type: application/x-www-form-urlencoded",
    "Postman-Token: ac251dbf-3b51-4ebb-aa22-d9337674f391",
    "Procces-Type: Inquery",
    // "Signature: ".$signature,
    "Signature: k4dTe4N1n/RH5YxNSPHwPSKIc8NNgkvXxmasPz2In6M=",
    "Timestamp: $timestamp"
  ),
));
//Output signature seharusnya jika dengan body ( {"NOTRANS":"201909100000008", "BIAYA":"1000"})           k4dTe4N1n/RH5YxNSPHwPSKIc8NNgkvXxmasPz2In6M=

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
 ?>