<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Flipbook_model extends CI_Model{

	public function get_flipbook_detail($id){
		$query = $this->db->get_where('flipbooks', array('id' => $id));

		$result = $query->row_array();
		if($result){
			$files = $this->db->get_where('flipbook_files', array('flipbook_id' => $id));
			$result['files'] = $files->result_array();

			$emails = $this->db->select("distinct(email)")->from("email_list")->where("flipbook_id", $id)->get();
			$result['emails'] = $emails->result_array();

			$unique_visitor = $this->db->select("count(distinct(ip_address))")->from("unique_visitor")->where("flipbook_id", $id)->get();
			$result['unique_visitor'] = $unique_visitor->result_array();

			$pages = $this->db->select("*")->from("pages")->where("flipbook_id", $id)->get();
			$result['pages'] = $pages->result_array();
		}
		return $result;
	}
	
	//--------------------------------------------------------------------
	public function get_flipbook_detail_by_slug($slug){
		$query = $this->db->get_where('flipbooks', array('slug' => $slug));
		$result = $query->row_array();
		if($result){
			$files = $this->db->get_where('flipbook_files', array('flipbook_id' => $result['id']));
			$result['files'] = $files->result_array();
		}
		return $result;
	}
	//--------------------------------------------------------------------
	public function update_flipbook($data, $id){
		$this->db->where('id', $id);
		$this->db->update('flipbooks', $data);
		return true;
	}
	
	//-----------------------------------------------------
	function get_flipbooks($limit='',$start=0)
	{
		$this->db->from('flipbooks');
		if ($limit != '' && $start != '') {
           $this->db->limit($limit, $start);
        }
		$query=$this->db->get();		
		return $query->result_array();
	}

	function get_flipbooks_by_user_id($userid,$limit='',$start=0)
	{
		$this->db->from('flipbooks');
		$this->db->where('user_id', $userid);
		if ($limit != '' && $start != '') {
           $this->db->limit($limit, $start);
        }
		$query=$this->db->get();		
		return $query->result_array();
	}

	function get_all()
	{
		$this->db->from('flipbooks');
		$this->db->where('status',1);
		$query=$this->db->get();		
		return $query->result_array();
	}

	//-----------------------------------------------------
	public function add_flipbook($data){
		$this->db->insert('flipbooks', $data);
		return $this->db->insert_id();
	}

	//-----------------------------------------------------
	public function add_flipbook_files($data){
		return $this->db->insert_batch('flipbook_files', $data);
	}

	//-----------------------------------------------------
	function change_status()
	{		
		$this->db->set('status',$this->input->post('status'));
		$this->db->where('id',$this->input->post('id'));
		$this->db->update('flipbooks');
	} 

	//-----------------------------------------------------
	function delete($id)
	{		
		$this->db->where('id',$id);
		$this->db->delete('flipbooks');

		$this->db->where('flipbook_id',$id);
		$this->db->delete('flipbook_files');
	} 

	function store_email_address($id, $email) {
		$this->db->insert('email_list', array("flipbook_id" => $id, "email" => $email));
	}

	function store_ip_address($id, $ip_address) {
		$this->db->insert('unique_visitor', array("flipbook_id" => $id, "ip_address" => $ip_address));
	}

	function add_page_content($data) {
		$this->db->insert('pages', $data);
	}

	function delete_embed_page($id) {
		$this->db->where('id', $id);
		$this->db->delete('pages');
	}
}

?>