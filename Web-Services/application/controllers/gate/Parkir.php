<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Parkir extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('status_login') == true)
			cek_user();
		else
			redirect('logout');
		$this->load->model('gate/Mentry');
		$this->load->model('gate/Mexit');
		$this->load->model('gate/Mconfig');
	}
	public function index()
	{
		$strurl= $this->Mconfig->Apikey();
		$data = [
			'title' => 'Parkir',
			'page'  => 'parkir',
			'small' => 'Kasir Parkir',
			'urls'  => '<li class="active">Jurusan</li>',
			'entry'  => $this->Mentry->getall(),
			'exit'  => $this->Mexit->getall(),
			'signatureKey'  => $strurl['value'],
		];
		$this->template->display('gate/parkir/index', $data);
	}
	public function cekkarcis()
	{
        $kode = trim($this->input->post('kode'));
        $check = $this->Mentry->check_karcis($kode);
        $checkdata=$check->row_array();
        $strurl= $this->Mconfig->check_urlStreaming($checkdata['gate_id']);
        if ($checkdata['gate_id']=='01') {
        	$folder='SOCKET_PARKIR_V3/';
        }else{
        	$folder='SOCKET_PARKIR_V3_Motor/';
        }
        if ($check->num_rows() != 0) {
            $json['status'] = TRUE;
            $json['urlStream'] = $strurl['value'];
            $json['kode'] = $kode;
            $json['folderImages'] = $folder;
            $json['data']=$checkdata;
            
            $json['roda']=$this->level_kendaraan($json['data']['gate_id'])->result_array();;

        } else {
            $json['status'] = FALSE;
        }
        echo json_encode($json);	
	}
	public function level_kendaraan($id)
	{
		if ($id != '01') {
			$qry=$this->db->query("SELECT*FROM `tb_level_kendaraan` WHERE `id_gate` NOT IN (SELECT	id_gate FROM `tb_level_kendaraan` WHERE id_gate='01');");
		}else{
			$qry=$this->db->query("SELECT*FROM `tb_level_kendaraan` WHERE `id_gate` NOT IN (SELECT	id_gate FROM `tb_level_kendaraan` WHERE id_gate='02');");
		}
		// return $qry->result_array();
		return $qry;
	}
	public function Viewcapture($kode,$urlstream)
	{
		$data['id_capture'] = $kode;
		$data['urlstream'] = $urlstream['value'];
		return $this->load->view('gate/parkir/capture',$data);
	}
	public function qrisApi_waiting()
	{
		$obj = json_decode($this->input->post('myData'));
		// echo $obj->signature;
		// $database = $this->input->post('body');
		// $signature = $this->input->post('signature');
		// echo $database;
		$d['harga'] = $obj->harga;
		$d['tiket'] = '';
		$d['waitingtime'] = '';
		$this->load->view('gate/bayar/index', $d);

	}

	
	public function POST_QRIS()
	{
				$json['METOD']="Inquery POST";
				$database = json_decode($this->input->post('jsonData'));
				$json['NOTRANS']=$data["NOTRANS"]=$database->idkarcis;
				 $data["BIAYA"]=$database->harga;
					$array = array_map('trim', $data );
					$body= json_encode($array);
				 $timestamp=$database->Timestamp;
				 $signature=$database->signature;
		$strurl= $this->Mconfig->IP_Server_Gateway_API_BN('01');
				 $ip=$strurl['value'];
				$curl = curl_init();
				curl_setopt_array($curl, array(
				  CURLOPT_PORT => "8080",
				  CURLOPT_URL => "http://$ip:8080",
				  CURLOPT_RETURNTRANSFER => true,
				  CURLOPT_ENCODING => "",
				  CURLOPT_MAXREDIRS => 10,
				  CURLOPT_TIMEOUT => 90,
				  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				  CURLOPT_CUSTOMREQUEST => "POST",
				  CURLOPT_POSTFIELDS => $body,
				  CURLOPT_HTTPHEADER => array(
				    "Authorization: BN OTA5",
				    "Cache-Control: no-cache",
				    "Content-Type: application/x-www-form-urlencoded",
				    "Postman-Token: ac251dbf-3b51-4ebb-aa22-d9337674f391",
				    "Procces-Type: Inquery",
				    "Signature: $signature",
				    "Timestamp: $timestamp"
				  ),
				));
				$response = curl_exec($curl);
				$err = curl_error($curl);
				curl_close($curl);
				if ($err) {
						$json['state']=false;
						$json['messages']=$err;
				} else {
				  // echo $response;
					  $json['state']=true;
						$json['messages']=json_decode($response);
				}
				  	echo json_encode($json);
	}
	public function GET_QRIS()
	{
				$json['METOD']="GetStatus POST";

				$database = json_decode($this->input->post('jsonData'));
				$json['NOTRANS']=$data["NOTRANS"]=$database->idkarcis;
				 $data["BIAYA"]=$database->harga;
					$array = array_map('trim', $data );
					$body= json_encode($array);
				 $timestamp=$database->Timestamp;
				 $signature=$database->signature;
				$strurl= $this->Mconfig->IP_Server_Gateway_API_BN('01');
				 $ip=$strurl['value'];
				$curl = curl_init();
				curl_setopt_array($curl, array(
				  CURLOPT_PORT => "8080",
				  CURLOPT_URL => "http://$ip:8080",
				  CURLOPT_RETURNTRANSFER => true,
				  CURLOPT_ENCODING => "",
				  CURLOPT_MAXREDIRS => 10,
				  CURLOPT_TIMEOUT => 5,
				  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				  CURLOPT_CUSTOMREQUEST => "POST",
				  CURLOPT_POSTFIELDS => $body,
				  CURLOPT_HTTPHEADER => array(
				    "Authorization: BN OTA5",
				    "Cache-Control: no-cache",
				    "Content-Type: application/x-www-form-urlencoded",
				    "Postman-Token: ac251dbf-3b51-4ebb-aa22-d9337674f391",
				    "Procces-Type: GetStatus",
				    "Signature: $signature",
				    "Timestamp: $timestamp"
				  ),
				));

				$response = curl_exec($curl);
				$err = curl_error($curl);

				curl_close($curl);
				if ($err) {
						$json['state']=false;
						$json['messages']=$err;
				  
				} else {
				  // echo $response;
					  $json['state']=true;
						$json['messages']=json_decode($response);
				}
				  	echo json_encode($json);
	}
	public function bayar()
	{
		$database = json_decode($this->input->post('jsonData'));
		if (!empty($database->idkarcis)&& !empty($database->noplat)) {
				$json['status'] = true;
				$json['pesan']	="Bisa";
				$this->Mexit->store($database);
				$this->session->set_flashdata('pesan', sukses('data Karcis  berhasil di simpan'));
			} else {
				$json['status'] = false;
				// $this->session->set_flashdata('pesan', danger('Data Karcis & No Plat Tidak Boleh Kosong'));
			}

			
			echo json_encode($json);
	}
}
