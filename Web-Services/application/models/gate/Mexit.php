	<?php
class Mexit extends CI_Model
{
	public function getall()
	{
		return $this->db->query("SELECT*FROM `tb_exit`
 JOIN `tb_entry` ON `tb_entry`.id_entry=`tb_exit`.`id_Entry`
 JOIN `tb_daftar_gate` ON `tb_daftar_gate`.id=`tb_entry`.`gate_id`")->result_array();
	}
}
?>