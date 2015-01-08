<?php
class Donor_mobile_verification_code extends CI_Model{
	
	var $id = "";
	var $donor_id = "";
	var $verification_code = "";
	var $timestamp = "";
	
	function __construct(){
		parent::__construct();
	}
	
	function addVerifcationCodeForDonor($random_no){
		$this->db->insert('tbl_donor_mobile_verification_code',$random_no);
		return $this->db->insert_id();
	}
	
	function getVerificationCodeOfDonor($id){
		$this->db->select('verification_code,donor_id');
		$query = $this->db->get_where('tbl_donor_mobile_verification_code', array('donor_id' => $id));
		return $query->row_array(); 
	}
	
	function updateVerificationStatus($user_id){
		return $this->db->update('tbl_donor', array("verified"=>1), array('id' => $user_id));
	}
	

}

?>