<?php
class BloodRequestmodel extends CI_Model{
	
	var $id = "";
	var $patient_name = "";
	var $patient_bloodgroup_id = "";
	var $patient_age = "";
	var $blood_require_date = "";
	var $unit_needed = "";
	var $contact_number = "";
	var $landline_numaber = "";
	var $hospital_name = "";
	var $hospital_address = "";
	var $patient_address = "";
	var $purpose = "";
	var $state = "";
	var $district = "";
	var $area = "";
	var $pinocde = "";
	var $unique_code = "";
	var $verified = "";
	var $timestamp = "";
	
	
	function __construct(){
		parent::__construct();
	}
	
	function addBloodRequest($req){
		if($this->db->insert('tbl_blood_request',$req)==TRUE){
			return $this->db->insert_id();
		}
		return 0;
	}
	
	function checkBloodReqExist($data){
		$this->db->select('id');
		$query = $this->db->get_where('tbl_blood_request', $data);
		return $query->result_array();		
	}
	
	function getReqIdFromUniqueCode($data){
		$this->db->select('id');
		$query = $this->db->get_where('tbl_blood_request', $data);
		return $query->result_array();
	}
	
	function updateBloodRequest($req,$req_id){
		return $this->db->update('tbl_donor', $req, array('id' => $req_id));
	}	
	
}

?>