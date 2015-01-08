<?php 
class EventModel extends CI_Model{
	
	var $id = "";
	var $name = "";
	var $date_from = "";
	var $date_to = "";
	var $address = "";
	var $conducted_by = "";
	var $sponsor_by = "";
	var $timestamp = "";
	
	function __construct(){
		parent::__construct();
	}
	
	function getAllEvents(){
		$this->db->select('id, name, date_from,date_to');
		$query = $this->db->get('tbl_blood_donation_events');
		return $query->result_array();
	}
	
	function getEventData($id){
		$query = $this->db->get_where('tbl_blood_donation_events',array('id'=>$id));
		return $query->result_array();		
	}

	
}