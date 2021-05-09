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

        if ($check->num_rows() != 0) {
            $json['status'] = TRUE;
            $json['data']=$check->row_array();
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
	
}
