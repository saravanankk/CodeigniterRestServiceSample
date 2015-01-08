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

class Events extends REST_Controller{
	
	function addEvent_get(){
		
	}
	
	function updateEvent_get(){
		
	}
	
	function deleteEvent_get(){
		
	}
	
	function index_get(){
		$this->load->model('EventModel');
		$events = $this->EventModel->getAllEvents();
		$this->response($events, 200);
		
	}
	
	function event_get(){
		if(!$this->get('id'))
		{
			$this->response(array( 'status' => "Invalid Event Id" ), 400);
		}else{
			$this->load->model('EventModel');
			$event_info = $this->EventModel->getEventData($this->get('id'));
			if(!empty($event_info)){
				$this->response($event_info, 200);
			}else{
				$this->response(array( 'status' => "Invalid Event Id" ), 406); //Need to change response formate
			}
		
		}		
	}
	
}