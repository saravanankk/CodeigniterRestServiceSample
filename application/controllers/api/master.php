<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Example
 *
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array.
 *
 * @package		CodeIgniter
 * @subpackage	Rest Server
 * @category	Controller
 * @author		K.K.Saravanan
 */

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH.'/libraries/REST_Controller.php';

class Master extends REST_Controller{
	
	function bloodGroups_get(){
		$this->load->model('Bloodgroup');
		$areas = $this->Bloodgroup->get_all_bloodgroups();
		$this->response($areas, 200);		
	}
	
	function states_get(){
		
	}
	
	function districts_get(){
		
	}
	
	function area_get(){
		$this->load->model('Area');
		$areas = $this->Area->get_all_areas();
		$this->response($areas, 200);
	}
	
	function addFeedback_post(){
		$this->load->model('Feedback');
		
		$this->load->library("form_validation");
		$this->form_validation->set_error_delimiters('<p>', '</p>');
		
		$this->form_validation->set_rules('name', 'UserName', 'trim|min_length[2]|max_length[50]|xss_clean');
		$this->form_validation->set_rules('mobile_no', 'Mobile number', 'trim|required|numeric|max_length[10]|xss_clean|is_unique[tbl_donor.mobile_no]');
		$this->form_validation->set_rules('message', 'Message', 'trim|required|min_length[2]|xss_clean');
		
		if ($this->form_validation->run() == FALSE){
			//$this->response(array( 'status' => substr( validation_errors(),3,strpos(validation_errors(),'</')-3) ), 406);
			$this->response(array( 'status' =>  validation_errors() ), 406);
		}else{
			$data = array("name"=>$this->input->post("name"),"mobile_no"=>$this->input->post("mobile_no"),"message"=>$this->input->post("message"));
			$res = $this->Feedback->addFeedback($data);
			$this->response($res, 200);
		}		
	}
	
	function feedbacks_get(){
		$this->load->model('Feedback');
		$feed = $this->Feedback->get_all_feedbacks();
		$this->response($feed, 200);
		
	}
	
}