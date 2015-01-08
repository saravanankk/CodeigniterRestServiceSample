<?php
class Donormodel extends CI_Model{
	
	var $id = "";
	var $name = "";
	var $blood_group_id = "";
	var $gender = "";
	var $weight = "";
	var $date_of_birth = "";
	var $mobile_no = "";
	var $land_line_no = "";
	var $state = "";
	var $district = "";
	var $area = "";
	var $pincode = "";
	var $geo_location = "";
	var $email = "";
	var $address = "";
	var $password = "";
	var $avilable_to_donate = "";
	var $photo_org_path = "";
	var $photo_thumb_path = "";
	var $last_donated_date = "";
	var $verified = "";
	var $timestamp = "";
	
	
	function __construct(){
		parent::__construct();
	}
	
	function addDonor($donor){
		if($this->db->insert('tbl_donor',$donor)==TRUE){
			return $this->db->insert_id();
		}
		return 0;
	}
	
	function udateProfilePhotoPath($imgArr,$donor_id){
		$this->db->update('tbl_donor', $imgArr, array('id' => $donor_id));
	}
	
	function updateProfile($profile,$donor_id){
		return $this->db->update('tbl_donor', $profile, array('id' => $donor_id));
	}
	
	function login($data){
		$this->db->select('id, name,verified');
		$query = $this->db->get_where('tbl_donor', $data);
		return $query->result_array();
		
	}
	
	function getUserInfo($id){
		$query = $this->db->get_where('tbl_donor', array('id'=>$id));
		return $query->result_array();
	}
	
	function getUserPassword($no){
		$this->db->select('password');
		$query = $this->db->get_where('tbl_donor', array('mobile_no'=>$no));
		return $query->row_array();
	}
	
	function changePassword($pass,$id){
		return $this->db->update('tbl_donor', array("password"=>$pass), array('id' => $id));
	}

}

?>