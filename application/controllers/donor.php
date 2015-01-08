<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Donor extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->helper('form');
		$this->load->helper('url');		
	}

	function index()
	{
		$this->load->view('donor_registartion');
	}
	
	function login(){
		$this->load->view('donor_login');
	}
	
	function changePassword(){
		$this->load->view('change_password');
	}
	
	function feedback(){
		$this->load->view('feedback');
	}
}

/* End of file welcome.php */
/* Location: ./system/application/controllers/welcome.php */