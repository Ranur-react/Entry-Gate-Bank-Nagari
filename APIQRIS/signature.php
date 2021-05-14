<?php 
$timestamp = "2020-12-12";
$secretkey = "BIM%B4nd4r4111111==";
$body = array(
    'NOTRANS' => '201909100000008',
    'BIAYA' => "1000"
);
$payload = strtoupper(json_encode($body, true)).":".$timestamp;
// $payload = '{"NOTRANS":"201909100000008","BIAYA":"1000"}'.":".$timestamp;
// $payload = strtoupper('{"NOTRANS":"201909100000008","BIAYA":"1000"}').":".$timestamp;
// $signPayload = "body=$body&timestamp=$timestamp";
$signature = hash_hmac('sha256', $payload, $secretkey,true);
echo base64_encode($signature);
?>