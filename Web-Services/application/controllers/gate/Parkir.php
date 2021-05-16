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
		$data = [
			'title' => 'Parkir',
			'page'  => 'parkir',
			'small' => 'Kasir Parkir',
			'urls'  => '<li class="active">Jurusan</li>',
			'entry'  => $this->Mentry->getall(),
			'exit'  => $this->Mexit->getall(),
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
		// $d['harga'] = '';
		// $d['tiket'] = '';
		// $d['waitingtime'] = '';
		// $this->load->view('gate/bayar/index', $d);
	}
	
}
