<?php
class Area extends CI_Model{
	
	var $id = "";
	var $district_id = "";
	var $area = "";
	var $pincode = "";
	var $timestamp = "";
	
	function __construct(){
		parent::__construct();
	}
	
	function get_all_areas(){
		$this->db->select('id, area, pincode');
		$query = $this->db->get('tbl_postal_area');
		return $query->result_array();
	}
}

?>