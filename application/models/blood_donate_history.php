<?php
class Blood_donate_history extends CI_Model{
	
	var $id = "";
	var $donor_id = "";
	var $donated_date = "";
	var $timestamp = "";
	
	function __construct(){
		parent::__construct();
	}
	
	function addLastDonatedDate($data){
		
		if($this->db->insert('tbl_blood_donate_history',$data)==TRUE){
			return $this->db->insert_id();
		}
		return 0;
		
	}
	
	function getDonatedHistory($id){
		$query = $this->db->get_where('tbl_blood_donate_history', array('donor_id' => $id));
		return $query->row_array(); 
	}
	

}

?>