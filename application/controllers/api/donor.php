<?php defined('BASEPATH') OR exit('No direct script access allowed');
session_start();

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

class Donor extends REST_Controller{
	
	
	/* 
	 * insert donor information in table - ~
	 * If file exist in request upload it to respective dir and upload filepath -~
	 * get goelocation from Api and update
	 * send sms to user using sms gateway */
	function register_post(){
		
		$this->load->library("form_validation");
		$this->form_validation->set_error_delimiters('<p>', '</p>');
		
		$this->form_validation->set_rules('name', 'UserName', 'trim|required|min_length[2]|max_length[50]|xss_clean');
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[3]|max_length[10]|xss_clean');
		$this->form_validation->set_rules('date_of_birth', 'Date of Birth', 'trim|required');
		$this->form_validation->set_rules('mobile_no', 'Mobile number', 'trim|required|numeric|max_length[10]|xss_clean|is_unique[tbl_donor.mobile_no]');
		$this->form_validation->set_rules('land_line_no', 'Land line number', 'trim|numeric|max_length[12]|xss_clean');
		$this->form_validation->set_rules('gender', 'Gender', 'trim|required');
		$this->form_validation->set_rules('blood_group_id', 'Blood group', 'trim|required');
		$this->form_validation->set_rules('weight', 'Weight', 'trim|numeric');
		$this->form_validation->set_rules('address', 'Address', 'trim|xss_clean');
		$this->form_validation->set_rules('state', 'State', 'trim|numeric');
		$this->form_validation->set_rules('district', 'District', 'trim|numeric');
		$this->form_validation->set_rules('area', 'Area', 'trim|numeric');
		$this->form_validation->set_rules('pincode', 'Pincode', 'trim|required|numeric|max_length[10]|xss_clean');
		$this->form_validation->set_rules('geo_location', 'Geo location', 'trim|numeric|xss_clean');
		$this->form_validation->set_rules('avilable_to_donate', 'avilable_to_donate', 'trim');
		
		
		
		if ($this->form_validation->run() == FALSE){
			//$this->response(array( 'status' => substr( validation_errors(),3,strpos(validation_errors(),'</')-3) ), 406);
			$this->response(array( 'status' =>  validation_errors() ), 406);
		}else{
			//inser entries to db
			//if file is there need to upload it in server then update the respective path
			//get geolocation from pincode
			//send sms
			
			$donor_info = array(
				'name' => $this->input->post('name'),
				'blood_group_id' => $this->input->post('blood_group_id'),
				'gender' => $this->input->post('gender'),
				'weight' => $this->input->post('weight'),
				'date_of_birth' => $this->input->post('date_of_birth'),
				'mobile_no' => $this->input->post('mobile_no'),
				'land_line_no' => $this->input->post('land_line_no'),
				'state' => $this->input->post('state'),
				'district' => $this->input->post('district'),
				'area' => $this->input->post('area'),
				'pincode' => $this->input->post('pincode'),
				'geo_location' => $this->input->post('geo_location'),
				'email' => $this->input->post('email'),
				'address' => $this->input->post('address'),
				'password' => $this->input->post('password'),
				'avilable_to_donate' => $this->input->post('avilable_to_donate'),
				'last_donated_date' => $this->input->post('last_donated_date'),
				'verified' => 0
			);
			
			$this->load->model('Donormodel');
			$donor_id = $this->Donormodel->addDonor($donor_info);
			
			$this->load->helper('string');
			
			$donor_code = array(
				'donor_id' => $donor_id,
				'verification_code' => random_string('nozero', 5)
			);
			
			$this->load->model('Donor_mobile_verification_code');
			$ver_code = $this->Donor_mobile_verification_code->addVerifcationCodeForDonor($donor_code);

			//File upload
			if(isset($_FILES) && $_FILES["profilephoto"]["error"]==0){
				$config['upload_path'] = './uploads/';
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size'] = '1024';
				$config['max_width'] = '1024';
				$config['max_height'] = '768';
				$config['file_name'] = 'profile_'.$donor_id;
				$config['overwrite'] = true;
				$this->load->library("upload",$config);
				
				if($this->upload->do_upload("profilephoto")){
					$upload_fileinfo =  $this->upload->data();
					
					$imgconfig['image_library'] = 'gd2';
					$imgconfig['source_image'] = $upload_fileinfo['full_path'];
					$imgconfig['new_image'] = 'profile_'.$donor_id.$upload_fileinfo['file_ext'];
					$imgconfig['create_thumb'] = TRUE;
					$imgconfig['maintain_ratio'] = TRUE;
					$imgconfig['width'] = 100;
					$imgconfig['height'] = 100;
					
					$this->load->library('image_lib', $imgconfig);
					
					$this->image_lib->resize();	

					$photo_info = array("photo_org_path"=>$upload_fileinfo['full_path'],
					"photo_thumb_path"=>$upload_fileinfo['file_path'].'profile_'.$donor_id."_thumb".$upload_fileinfo['file_ext']); 
					
					$this->Donormodel->udateProfilePhotoPath($photo_info,$donor_id);
					
				}
				
				//send SMS
				//update geolocation

				
			}
			
			$this->response($donor_id, 200);			
		}
	}
	
	function login_post(){
		$this->load->library("form_validation");
		
		$this->form_validation->set_rules('mobile_no', 'Mobile number', 'trim|required|numeric|max_length[10]|xss_clean');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[3]|max_length[10]|xss_clean');
		
		if ($this->form_validation->run() == FALSE){
			//$this->response(array( 'status' => substr( validation_errors(),3,strpos(validation_errors(),'</')-3) ), 406);
			$this->response(array( 'status' =>  validation_errors() ), 406);
		}else{
			$login_data = array(
					'mobile_no' => $this->input->post('mobile_no'),
					'password' => $this->input->post('password')
			);
			
			$this->load->model('Donormodel');
			$login_info = $this->Donormodel->login($login_data);
			if(!empty($login_info)){
					
				if($login_info[0]['verified']==0){
					$this->response(array( 'status' => "Please verify your credentials first",'id'=>$login_info[0]['id'] ), 406);
				}else{
					$_SESSION['userId'] = $login_info[0]['id'];
					$this->response($login_info, 200);
				}
			}else{
				$this->response(array( 'status' => "Invalid credentials" ), 406); //Need to change response formate
			}
		}
	}
	
	function logout_get(){
		if(isset($_SESSION['userId'])){
			session_destroy();
			$this->response("Successfully logout", 200);
		}else{
			$this->response(array( 'status' => "Invalid Access" ), 406); //Need to change response formate
		}
	}
	
	function updateProfile_post(){
		
		if(!isset($_SESSION['userId'])){
			$this->response(array( 'status' => "Not logged in" ), 406);
			return;
		}
				
		$this->load->library("form_validation");
		$this->form_validation->set_error_delimiters('<p>', '</p>');
		
		$this->form_validation->set_rules('name', 'UserName', 'trim|required|min_length[2]|max_length[50]|xss_clean');
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email');
		$this->form_validation->set_rules('date_of_birth', 'Date of Birth', 'trim|required');
		$this->form_validation->set_rules('land_line_no', 'Land line number', 'trim|numeric|max_length[12]|xss_clean');
		$this->form_validation->set_rules('gender', 'Gender', 'trim|required');
		$this->form_validation->set_rules('blood_group_id', 'Blood group', 'trim|required');
		$this->form_validation->set_rules('weight', 'Weight', 'trim|numeric');
		$this->form_validation->set_rules('address', 'Address', 'trim|xss_clean');
		$this->form_validation->set_rules('state', 'State', 'trim|numeric');
		$this->form_validation->set_rules('district', 'District', 'trim|numeric');
		$this->form_validation->set_rules('area', 'Area', 'trim|numeric');
		$this->form_validation->set_rules('pincode', 'Pincode', 'trim|required|numeric|max_length[10]|xss_clean');
		$this->form_validation->set_rules('avilable_to_donate', 'avilable_to_donate', 'trim');
		
		if ($this->form_validation->run() == FALSE){
			//$this->response(array( 'status' => substr( validation_errors(),3,strpos(validation_errors(),'</')-3) ), 406);
			$this->response(array( 'status' =>  validation_errors() ), 406);
		}else{
			$donor_info = array(
				'name' => $this->input->post('name'),
				'blood_group_id' => $this->input->post('blood_group_id'),
				'gender' => $this->input->post('gender'),
				'weight' => $this->input->post('weight'),
				'date_of_birth' => $this->input->post('date_of_birth'),
				'land_line_no' => $this->input->post('land_line_no'),
				'state' => $this->input->post('state'),
				'district' => $this->input->post('district'),
				'area' => $this->input->post('area'),
				'pincode' => $this->input->post('pincode'),
				'email' => $this->input->post('email'),
				'address' => $this->input->post('address'),
				'avilable_to_donate' => $this->input->post('avilable_to_donate')
			);
			
			$this->load->model('Donormodel');
			if($this->Donormodel->updateProfile($donor_info,$_SESSION['userId']) == TRUE){
				$this->response(array( 'status' =>  "Success" ), 406);
			}else{
				$this->response(array( 'status' =>  "Update Fail" ), 406);
			}
		}
		
	}
	
	function changePassword_post(){
		if(!isset($_SESSION['userId'])){
			$this->response(array( 'status' => "Not logged in" ), 406);
			return;
		}
		
		$this->load->library("form_validation");
		$this->form_validation->set_error_delimiters('<p>', '</p>');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[3]|max_length[10]|xss_clean');
		$this->form_validation->set_rules('confirm_password', 'confirm_password', 'trim|required|min_length[3]|max_length[10]|xss_clean');
		
		if($this->input->post('password')!==$this->input->post('confirm_password')){
			$this->response(array( 'status' => "Passwords not matched" ), 400);
			return;
		}
		
		if ($this->form_validation->run() == FALSE){
			//$this->response(array( 'status' => substr( validation_errors(),3,strpos(validation_errors(),'</')-3) ), 406);
			$this->response(array( 'status' =>  validation_errors() ), 406);
		}else{
			$this->load->model('Donormodel');
			if( $this->Donormodel->changePassword($this->input->post('password'),$_SESSION['userId'])==TRUE){
				$this->response("success", 200);
			}else{
				$this->response(array( 'status' =>  "Failed to update" ), 406);
			}
			
		}
		
		
	}
	
	function fogotPassword_get(){
		if($this->get('mobile_no'))
		{
			$this->load->model('Donormodel');
			$user_info = $this->Donormodel->getUserPassword($this->get('mobile_no'));
			if(!empty($user_info)){
				$this->response($user_info, 200);  
				//Need to send an SMS
			}else{
				$this->response(array( 'status' => "Mobile number not exist" ), 406); //Need to change response formate
			}
		}else{
			$this->response(array( 'status' => "Invalid MobileNo" ), 400);
		}
	}
	
	function user_get(){
		
		if(!$this->get('id'))
		{
			$this->response(array( 'status' => "Invalid UserId" ), 400);
		}else{
			$this->load->model('Donormodel');
			$user_info = $this->Donormodel->getUserInfo($this->get('id'));
			if(!empty($user_info)){
				$this->response($user_info, 200);
			}else{
				$this->response(array( 'status' => "Invalid UserId" ), 406); //Need to change response formate
			}
				
		}
	}
	
	function sendVerificationCode_get(){
		//send SMS
		if(!$this->get('id'))
		{
			$this->response(array( 'status' =>  "Missing id" ), 406);
			return;
		}
		$this->load->model('Donor_mobile_verification_code');
		$code = $this->Donor_mobile_verification_code->getVerificationCodeOfDonor($this->get('id'));
		if(!empty($code)){
			//send SMS from here
			$this->response($code, 200);
		}else{
			$this->response(array( 'status' =>  "Invalid access" ), 406);
		}
		
	}
	
	function verifyCode_get(){
		//Need to modify
		if(!$this->get('id'))
		{
			$this->response(array( 'status' =>  "Missing id" ), 406);
			return;
		}
		
		if(!$this->get('code')){
			$this->response(array( 'status' =>  "Missing verificationCode" ), 406);
			return;
		}
		
		$this->load->model('Donor_mobile_verification_code');
		$code = $this->Donor_mobile_verification_code->getVerificationCodeOfDonor($this->get('id'));
		if(!empty($code)){
			if($code['verification_code']===$this->get('code')){
					if($this->Donor_mobile_verification_code->updateVerificationStatus($this->get('id'))==TRUE){
						$_SESSION['userId'] = $code['donor_id'];
						$this->response($code, 200);						
					}else{
						$this->response(array( 'status' =>  "Failed to update" ), 406);
					}
			}else{
				$this->response(array( 'status' =>  "Code not matched" ), 406);
			}
		}else{
			$this->response(array( 'status' =>  "Invalid access" ), 406);
		}
	}
	
	function addLastDonatedDate_get(){
		//Need to check the specify time limit for blood donation
		if(!isset($_SESSION['userId'])){
			$this->response(array( 'status' => "Not logged in" ), 406);
			return;
		}
		if(!$this->get('date'))
		{
			$this->response(array( 'status' => "Date is required" ), 406);
		}else{
			
			$date = date_parse($this->get('date'));
			
			if ($date["error_count"] == 0 && checkdate($date["month"], $date["day"], $date["year"])){
				$this->load->model('Blood_donate_history');
				$data = array("donor_id"=>$_SESSION['userId'],"donated_date"=>$this->get('date'));
				$r = $this->Blood_donate_history->addLastDonatedDate($data);
				if($r!=0){
					$this->response(array( 'status' => "success","data"=>$r ), 406);
				}else{
					$this->response(array( 'status' => "Update fail" ), 406);
				}				
			}else{
				$this->response(array( 'status' => "Invalid date formate" ), 406);
			}
		}
	}
	
	function editLastDonatedDate(){
		
	}
	
	function donatedHistory_get(){
		if(!$this->get('id'))
		{
			$this->response(array( 'status' => "Invalid UserId" ), 400);
		}else{
			$this->load->model('Blood_donate_history');
			$blood_donated_info = $this->Blood_donate_history->getDonatedHistory($this->get('id'));
			if(!empty($blood_donated_info)){
				$this->response($blood_donated_info, 200);
			}else{
				$this->response(array(), 200); //Need to change response formate
			}
		
		}
	}
	
}