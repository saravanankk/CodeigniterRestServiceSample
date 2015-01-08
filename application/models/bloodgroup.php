<?php
class Bloodgroup extends CI_Model{
	
	var $id = "";
	var $name = "";
	var $timestamp = "";
	
	function __construct(){
		parent::__construct();
	}
	
	function get_all_bloodgroups(){
		$this->db->select('id, name');
		$query = $this->db->get('tbl_bloodgroup');
		return $query->result_array();
	}
}

?>