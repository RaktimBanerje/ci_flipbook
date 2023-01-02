<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	function __construct()
	{
	    parent::__construct();
	    $this->load->model('admin/flipbook_model', 'flipbook');
		$this->load->model('admin/Activity_model', 'activity_model');
		$this->load->library('user_agent');
	}

	public function index()
	{
	    $data['books'] = $this->flipbook->get_flipbooks(4);
		$data['title'] = 'Flipbook | Home';
		$this->load->view('front/home', $data);
	}
	public function login()
	{
		$data['title'] = 'Flipbook | Login';
		$this->load->view('front/login', $data);
	}
	public function register()
	{
		$data['title'] = 'Flipbook | Login';
		$this->load->view('front/register', $data);
	}
	
	function view($slug){
	    $bookData = $this->flipbook->get_flipbook_detail_by_slug($slug);
	    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        $cdata = array('ip_address'=>$ip);
        $cdata['user_id'] = $serial = $this->session->userdata('admin_id') ?? $serial = $this->session->userdata('user_id') ?? 0;
        $cdata['book_id'] = $bookData['id'];
        $cdata['brawser_info'] = $this->agent->browser();
        $cdata['browserVersion'] = $this->agent->version();
        $cdata['platform'] = $this->agent->platform();
        $cdata['full_user_agent_string'] = $_SERVER['HTTP_USER_AGENT'];
        $cdata['created_at'] = date('Y-m-d H:i:s');
        $this->db->insert('flipbook_access_log', $cdata);

		$data['title'] = "View Flipbook";
		$data['flipbook'] = $bookData;		
		$this->load->view('admin/flipbook/view',$data);
	}
	public function front()
	{
		$data['title'] = 'Flipbook | Home';
		$this->load->view('front/home', $data);
	}

	public function site_lang($site_lang) {
		echo $site_lang;
		echo '<br>';
		echo 'you will be redirected to :'.$_SERVER['HTTP_REFERER'];
		$language_data = array(
			'site_lang' => $site_lang
		);

		$this->session->set_userdata($language_data);
		if ($this->session->userdata('site_lang')) {
			echo 'user session language is = '.$this->session->userdata('site_lang');
		}
		redirect($_SERVER['HTTP_REFERER']);

		exit;
	}
}
