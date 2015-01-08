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

class BloodRequest extends  REST_Controller{
	
	function index_get(){
		
	}
	
	function add_post(){
		
		$this->load->library("form_validation");
		$this->form_validation->set_error_delimiters('<p>', '</p>');
		
		$this->form_validation->set_rules('patient_name', 'patient_name', 'trim|required|min_length[2]|max_length[50]|xss_clean');
		$this->form_validation->set_rules('patient_bloodgroup_id', 'Blood group', 'trim|required');
		$this->form_validation->set_rules('patient_age', 'Age', 'trim|numeric');
		$this->form_validation->set_rules('blood_require_date', 'Blood require date', 'trim|required');
		$this->form_validation->set_rules('patient_gender', 'gender', 'trim|alpha');
		$this->form_validation->set_rules('unit_needed', 'Unit of blood needed', 'trim|numeric|required');
		$this->form_validation->set_rules('contact_number', 'Contact number', 'trim|required|numeric|max_length[10]|xss_clean');
		$this->form_validation->set_rules('landline_numaber', 'Landline number', 'trim|numeric|max_length[12]|xss_clean');
		
		$this->form_validation->set_rules('hospital_name', 'Hospital name', 'trim|xss_clean');
		$this->form_validation->set_rules('hospital_address', 'Hospital Address', 'trim|xss_clean');
		$this->form_validation->set_rules('patient_address', 'Patient Address', 'trim|xss_clean');
		$this->form_validation->set_rules('purpose', 'Purpose', 'trim|xss_clean');
		$this->form_validation->set_rules('state', 'State', 'trim|numeric');
		$this->form_validation->set_rules('district', 'District', 'trim|numeric');
		$this->form_validation->set_rules('area', 'Area', 'trim|numeric');
		$this->form_validation->set_rules('pincode', 'Pincode', 'trim|required|numeric|max_length[10]|xss_clean');
		
		if ($this->form_validation->run() == FALSE){
			//$this->response(array( 'status' => substr( validation_errors(),3,strpos(validation_errors(),'</')-3) ), 406);
			$this->response(array( 'status' =>  validation_errors() ), 406);
		}else{
			$this->load->model('BloodRequestmodel');
			$r = array(
					'patient_name' => $this->input->post('patient_name'),
					'patient_bloodgroup_id' => $this->input->post('patient_bloodgroup_id'),
					'blood_require_date' => $this->input->post('blood_require_date'),
					'unit_needed' => $this->input->post('unit_needed'),
					'contact_number' => $this->input->post('contact_number')
			);
			$reqExist = $this->BloodRequestmodel->checkBloodReqExist($r);
			if(!empty($reqExist)){
				$this->response(array( 'status' => "Request already exist" ), 406);
			}else{
				
				$this->load->helper('string');
				
				$r['patient_age'] =  $this->input->post('patient_age');
				$r['patient_gender'] =  $this->input->post('patient_gender');
				$r['landline_numaber'] =  $this->input->post('landline_numaber');
				$r['hospital_name'] =  $this->input->post('hospital_name');
				$r['hospital_address'] =  $this->input->post('hospital_address');
				$r['patient_address'] =  $this->input->post('patient_address');
				$r['purpose'] =  $this->input->post('purpose');
				$r['state'] =  $this->input->post('state');
				$r['district'] =  $this->input->post('district');
				$r['area'] =  $this->input->post('area');
				$r['pinocde'] =  $this->input->post('pinocde');
				$r['unique_code'] =   random_string('unique');
				$r['verified'] =  0;
				
				$req_id = $this->BloodRequestmodel->addBloodRequest($r);
					
				if($req_id!=0){
					$req_sms_code = array(
							'uniquecode' => $r['unique_code'],
							'code' => random_string('nozero', 5)
					);
						
					$this->load->model('Req_mobile_verification_code');
					$ver_code = $this->Req_mobile_verification_code->addVerifcationCodeForRequest($req_sms_code);
					
					//Need to send SMS
					
					
				}else{
					
				}
				$this->response($req_id, 200);
				
			}	
		}
	}
	
	function update_get(){
		
		if($this->post('unique_code'))
		{
			
			$this->load->model('BloodRequestmodel');
			
			$reqId = $this->BloodRequestmodel->getReqIdFromUniqueCode(array("unique_code"=>$this->post('unique_code')));
			
			if(!empty($reqId)){
				
				$this->load->library("form_validation");
				$this->form_validation->set_error_delimiters('<p>', '</p>');
					
				$this->form_validation->set_rules('patient_name', 'patient_name', 'trim|required|min_length[2]|max_length[50]|xss_clean');
				$this->form_validation->set_rules('patient_bloodgroup_id', 'Blood group', 'trim|required');
				$this->form_validation->set_rules('patient_age', 'Age', 'trim|numeric');
				$this->form_validation->set_rules('blood_require_date', 'Blood require date', 'trim|required');
				$this->form_validation->set_rules('patient_gender', 'gender', 'trim|alpha');
				$this->form_validation->set_rules('unit_needed', 'Unit of blood needed', 'trim|numeric|required');
				$this->form_validation->set_rules('contact_number', 'Contact number', 'trim|required|numeric|max_length[10]|xss_clean');
				$this->form_validation->set_rules('landline_numaber', 'Landline number', 'trim|numeric|max_length[12]|xss_clean');
					
				$this->form_validation->set_rules('hospital_name', 'Hospital name', 'trim|xss_clean');
				$this->form_validation->set_rules('hospital_address', 'Hospital Address', 'trim|xss_clean');
				$this->form_validation->set_rules('patient_address', 'Patient Address', 'trim|xss_clean');
				$this->form_validation->set_rules('purpose', 'Purpose', 'trim|xss_clean');
				$this->form_validation->set_rules('state', 'State', 'trim|numeric');
				$this->form_validation->set_rules('district', 'District', 'trim|numeric');
				$this->form_validation->set_rules('area', 'Area', 'trim|numeric');
				$this->form_validation->set_rules('pincode', 'Pincode', 'trim|required|numeric|max_length[10]|xss_clean');


				$req_info = array(
						'patient_name' => $this->input->post('patient_name'),
						'patient_bloodgroup_id' => $this->input->post('patient_bloodgroup_id'),
						'patient_age' => $this->input->post('patient_age'),
						'blood_require_date' => $this->input->post('blood_require_date'),
						'patient_gender' => $this->input->post('patient_gender'),
						'unit_needed' => $this->input->post('unit_needed'),
						'landline_numaber' => $this->input->post('landline_numaber'),
						'hospital_name' => $this->input->post('hospital_name'),
						'hospital_address' => $this->input->post('hospital_address'),
						'patient_address' => $this->input->post('patient_address'),
						'purpose' => $this->input->post('purpose'),
						'state' => $this->input->post('state'),
						'district' => $this->input->post('district'),
						'area' => $this->input->post('area'),
						'pincode' => $this->input->post('pincode')
				);
				
				if($this->BloodRequestmodel->updateBloodRequest($req_info,$reqId)==TRUE){
					$this->response(array( 'status' =>  "Success" ), 406);
				}else{
					$this->response(array( 'status' =>  "Update Fail" ), 406);
				}
				
							
			}else{
				$this->response(array( 'status' => "Invalid Unique code" ), 400);
			}
		}else{
			$this->response(array( 'status' => "Invalid Unique code" ), 400);
		}
		
	}
	
	function delete_get(){
		
	}
	
	function verifyBloodRequestCode_get(){
		
	}
	
	function detail_get(){
		if(!$this->get('id'))
		{
			$this->response(NULL, 400);
		}		
	}
	
	function byDistrict_get(){
	
	}
	
	function byGeolocation_get(){
		
	}
	
}