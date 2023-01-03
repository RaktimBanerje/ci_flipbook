<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Flipbook extends MY_Controller
{
    function __construct(){

        parent::__construct();
        auth_check(); // check login auth
        $this->rbac->check_module_access();

		$this->load->model('admin/flipbook_model', 'flipbook');
		$this->load->model('admin/Activity_model', 'activity_model');
    }
    //--------------------------------------------------------------
    function view($id){
		$data['title'] = "View Flipbook";
		$data['flipbook'] = $this->flipbook->get_flipbook_detail($id);	
		// echo "<pre>";
		// print_r($data);
		// return;
		if($data["flipbook"]["collect_email"]) {

			$this->load->view('admin/flipbook/email_form', array("flipbook" => $data["flipbook"]));
		}
		else if (!$data["flipbook"]["password"] == NULL) {
			$this->load->view('admin/flipbook/password_form', array("flipbook" => $data["flipbook"]));
		}
		else {
			$this->flipbook->store_ip_address($id, $_SERVER['REMOTE_ADDR']);	
			$this->load->view('admin/flipbook/view', $data);
		}
	}

	//-----------------------------------------------------		
	function list($type=''){
		if($this->session->userdata('admin_role_id') ==1):
		$data['flipbook'] = $this->flipbook->get_flipbooks();
		else:
			$data['flipbook'] = $this->flipbook->get_flipbooks_by_user_id($this->session->userdata('admin_id'));
		endif;
		$data['title'] = 'Flipbook List';

		$this->load->view('admin/includes/_header');
		$this->load->view('admin/flipbook/list', $data);
		$this->load->view('admin/includes/_footer');
	}

	//---------------------------------------------------------
	function filterdata(){

		$this->session->set_userdata('filter_type',$this->input->post('type'));
		$this->session->set_userdata('filter_status',$this->input->post('status'));
		$this->session->set_userdata('filter_keyword',$this->input->post('keyword'));
	}

	//--------------------------------------------------		
	function new(){
		$data['title'] = "Add New Flipbook";
		$this->load->view('admin/includes/_header');
		$this->load->view('admin/flipbook/new',$data);
		$this->load->view('admin/includes/_footer');
	}


	public function datatable_json(){				   					   
		//$records['data'] = $this->flipbook->get_flipbooks();
		if($this->session->userdata('admin_role_id') ==1):
			$records['data'] = $this->flipbook->get_flipbooks();
		else:
			$records['data'] = $this->flipbook->get_flipbooks_by_user_id($this->session->userdata('admin_id'));
		endif;
		$data = array();

		$i=0;
		foreach ($records['data']   as $row) 
		{  
			$status = ($row['status'] == 1)? 'checked': '';
			$data[]= array(
				++$i,
				$row['title'],
				$row['description'],
				'<img src="'.base_url($row['cover_image']).'" width="70">',
				date_time($row['created_at']),					
				'<input class="tgl_checkbox tgl-ios" 
				data-id="'.$row['id'].'" 
				id="cb_'.$row['id'].'"
				type="checkbox"  
				'.$status.'><label for="cb_'.$row['id'].'"></label>',		

				'<a title="View" target="_blank" class="view btn btn-sm btn-info" href="'.base_url('admin/flipbook/view/'.$row['id']).'"> <i class="fa fa-eye"></i></a>
				<a title="Delete" class="delete btn btn-sm btn-danger" href='.base_url("admin/flipbook/delete/".$row['id']).' title="Delete" onclick="return confirm(\'Do you want to delete ?\')"> <i class="fa fa-trash-o"></i></a>'
			);
			/*<a title="Edit" class="update btn btn-sm btn-warning" href="'.base_url('admin/flipbook/edit/'.$row['id']).'"> <i class="fa fa-pencil-square-o"></i></a>*/
		}
		$records['data']=$data;
		echo json_encode($records);						   
	}

	//-----------------------------------------------------------
	function change_status(){

		$this->rbac->check_operation_access(); // check opration permission

		$this->flipbook->change_status();
	}
	
	//--------------------------------------------------
	function add(){

		$this->rbac->check_operation_access(); // check opration permission


		if($this->input->post('submit')){
				$this->form_validation->set_rules('title', 'Title', 'trim|xss_clean|is_unique[flipbooks.title]|required');
				$this->form_validation->set_rules('description', 'Description', 'trim|required');
				$this->form_validation->set_rules('slug', 'Slug', 'trim|required|is_unique[flipbooks.slug]');

				if($_FILES):
				// 	echo $extension;
				// print_r($_FILES['flipbook_files']);
				// die;
				foreach ($_FILES as $key=> $value) { 
					$file_name = $_FILES['flipbook_files']['name'][0];

					$extension = trim(pathinfo($file_name, PATHINFO_EXTENSION));
						//echo $extension;
						if($this->input->post('file_type') == 'pdf' && $extension !='pdf'){
							$this->session->set_flashdata('errors', $data['errors']='Selected File Should be in pdf Format');
								redirect(base_url('admin/flipbook/new'),'refresh');
						}
						// switch ($this->input->post('file_type')) {
						// 	case 'images':
						// 		if(strtolower($extension) !='jpeg')){
						// 		$this->session->set_flashdata('errors', $data['errors']='Selected File Should be in png/jpg/jpeg Format');
						// 		redirect(base_url('admin/flipbook/new'),'refresh');
						// 		}
						// 		break;
						// }
						$image_type = array('png','jpg','jpeg');

						if($this->input->post('file_type') === 'images' && !in_array($extension, $image_type)){
							$this->session->set_flashdata('errors', $data['errors']='Selected File Should be in png/jpg/jpeg Format');
								redirect(base_url('admin/flipbook/new'),'refresh');
						}
				}
				

				endif;

				if ($this->form_validation->run() == FALSE) {
					$data = array(
						'errors' => validation_errors()
					);
					$this->session->set_flashdata('errors', $data['errors']);
					redirect(base_url('admin/flipbook/new'),'refresh');
				}
				else{
					$logo = $this->upload_img_file("logo", time(), "uploads/logo/");
					$cover = '';
					$path = 'uploads/books/';
					$files = $this->upload_files($path,$this->input->post('slug'),$_FILES['flipbook_files']);
					$cover = $this->upload_file($path,$this->input->post('slug').'Cover',$_FILES['cover_image']);
					$data = array(
						'title' 				=> $this->input->post('title'),
						'description' 			=> $this->input->post('description'),
						'user_id' 				=> $this->session->userdata('admin_id'),
						'file_type'				=> $this->input->post('file_type'),
						'slug' 					=> $this->input->post('slug'),
						'cover_image' 			=> $path.$cover,
						"disable_right_click" 	=> $this->input->post('disable_right_click'),
						"share_content" 		=> $this->input->post('share_content'),
						"collect_email" 		=> $this->input->post('collect_email'),
						"password" 				=> NULL,
						"logo"					=> $logo,
						'created_at' 			=> date('Y-m-d : h:m:s'),
						'updated_at' 			=> date('Y-m-d : h:m:s'),
					);
					
					$password = $this->input->post('password');

					if($password != "") {
						$data["password"] =  password_hash($password, PASSWORD_BCRYPT);
					}

					$data = $this->security->xss_clean($data);
					$result = $this->flipbook->add_flipbook($data);
					if($result){
						$book_files = array();
						if($files):
						foreach ($files as $key => $value) {
							$book_files[$key]['flipbook_id'] = $result;
							$book_files[$key]['title'] = $this->input->post('title');
							$book_files[$key]['file'] = $path.$value;
							$book_files[$key]['created_at'] =date('Y-m-d H:i:s');
						}
						$reds = $this->flipbook->add_flipbook_files($book_files);
						endif;
						// Activity Log 
						$this->activity_model->add_log(7);

						$this->session->set_flashdata('success', 'Flipbook has been added successfully!');
						redirect(base_url('admin/flipbook/list'));
					}
				}
			}
			else
			{
				$this->load->view('admin/includes/_header', $data);
        		$this->load->view('admin/admin/add');
        		$this->load->view('admin/includes/_footer');
			}
	}

	//--------------------------------------------------
	function edit($id=""){

		$this->rbac->check_operation_access(); // check opration permission

		$data['admin_roles'] = $this->admin->get_admin_roles();

		if($this->input->post('submit')){
			$this->form_validation->set_rules('title', 'Title', 'trim|xss_clean|is_unique[flipbooks.title]|required');
				$this->form_validation->set_rules('description', 'Description', 'trim|required');
				$this->form_validation->set_rules('slug', 'Slug', 'trim|required|is_unique[flipbooks.slug]');

			if($_FILES):
				// 	echo $extension;
				// print_r($_FILES['flipbook_files']);
				// die;
				foreach ($_FILES as $key=> $value) { 
					$file_name = $_FILES['flipbook_files']['name'][0];

					$extension = trim(pathinfo($file_name, PATHINFO_EXTENSION));
						//echo $extension;
						if($this->input->post('file_type') == 'pdf' && $extension !='pdf'){
							$this->session->set_flashdata('errors', $data['errors']='Selected File Should be in pdf Format');
								redirect(base_url('admin/flipbook/new'),'refresh');
						}

						$image_type = array('png','jpg','jpeg');

						if($this->input->post('file_type') === 'images' && !in_array($extension, $image_type)){
							$this->session->set_flashdata('errors', $data['errors']='Selected File Should be in png/jpg/jpeg Format');
								redirect(base_url('admin/flipbook/new'),'refresh');
						}
				}
				

				endif;

			if ($this->form_validation->run() == FALSE) {
				$data = array(
					'errors' => validation_errors()
				);
				$this->session->set_flashdata('errors', $data['errors']);
				redirect(base_url('admin/admin/edit/'.$id),'refresh');
			}
			else{
				$cover = '';
					$path = 'uploads/books/';
					$files = $this->upload_files($path,$this->input->post('slug'),$_FILES['flipbook_files']);
					$cover = $this->upload_file($path,$this->input->post('slug').'Cover',$_FILES['cover_image']);
					$data = array(
						'title' 		=> $this->input->post('title'),
						'description' 	=> $this->input->post('description'),
						'user_id' 		=> $this->session->userdata('admin_id'),
						'file_type'		=> $this->input->post('file_type'),
						'slug' 			=> $this->input->post('slug'),
						'cover_image' 	=> $path.$cover,
						'updated_at' 	=> date('Y-m-d : h:m:s'),
					);
					$data = $this->security->xss_clean($data);
					$result = $this->flipbook->add_flipbook($data,$id);
					if($result){
						$book_files = array();
						if($files):
						foreach ($files as $key => $value) {
							$book_files[$key]['flipbook_id'] = $id;
							$book_files[$key]['title'] = $this->input->post('title');
							$book_files[$key]['file'] = $path.$value;
							$book_files[$key]['created_at'] =date('Y-m-d H:i:s');
						}
						$reds = $this->flipbook->add_flipbook_files($book_files);
						endif;
						// Activity Log 
						$this->activity_model->add_log(7);

						$this->session->set_flashdata('success', 'Flipbook has been updated successfully!');
						redirect(base_url('admin/flipbook/list'));
					}
			}
		}
		elseif($id==""){
			redirect('admin/admin');
		}
		else{
			$data['admin'] = $this->admin->get_admin_by_id($id);
			
			$this->load->view('admin/includes/_header');
			$this->load->view('admin/admin/edit', $data);
			$this->load->view('admin/includes/_footer');
		}		
	}

	//--------------------------------------------------
	function check_username($id=0){

		$this->db->from('admin');
		$this->db->where('username', $this->input->post('username'));
		$this->db->where('admin_id !='.$id);
		$query=$this->db->get();
		if($query->num_rows() >0)
			echo 'false';
		else 
	    	echo 'true';
    }

    //------------------------------------------------------------
	function delete($id=''){
	   
		$this->rbac->check_operation_access(); // check opration permission

		$this->flipbook->delete($id);

		// Activity Log 
		$this->activity_model->add_log(9);

		$this->session->set_flashdata('success','Flipbook has been Deleted Successfully.');	
		redirect('admin/flipbook/list');
	}

	function email_store() {
		$email = $this->input->post("email");
		$id = $this->input->post("id");

		$this->flipbook->store_email_address($id, $email);		

		$data['title'] = "View Flipbook";
		$data['flipbook'] = $this->flipbook->get_flipbook_detail($id);		

		if ($data["flipbook"]["password"] == NULL) {
			$this->flipbook->store_ip_address($id, $_SERVER['REMOTE_ADDR']);	
			$this->load->view('admin/flipbook/view', $data);
		}
		else {
			$this->load->view('admin/flipbook/password_form', array("flipbook" => $data["flipbook"]));
		}
	}

	function password_check() {
		$password = $this->input->post("password");
		$id = $this->input->post("id");

		$data['title'] = "View Flipbook";
		$data['flipbook'] = $this->flipbook->get_flipbook_detail($id);		


		if($data["flipbook"]["password"] == $password) {
			$this->flipbook->store_ip_address($id, $_SERVER['REMOTE_ADDR']);
			$this->load->view('admin/flipbook/view', $data);
		}
		else {
			$this->load->view('admin/flipbook/password_form_error', array("flipbook" => $data["flipbook"]));
		}
	}

	function add_page_content() {
		$content_type = $this->input->post("content_type");
		$flipbook_id = $this->input->post("flipbook_id");
		$page = $this->input->post("page");
		$content = $this->input->post("content");

		$this->flipbook->add_page_content(array(
			"page" => $page, 
			"content_type" => $content_type, 
			"flipbook_id" => $flipbook_id, "content" => $content)
		);	

		$data['flipbook'] = $this->flipbook->get_flipbook_detail($flipbook_id);		
		$this->load->view('admin/flipbook/view', $data);
	} 

	public function page_embed_delete() {
		$id = $this->input->get("id");
		$flipbook_id = $this->input->get("flipbook");
		// print_r(["id" => $id, "flipbook_id" => $flipbook_id]);
		// echo "<pre>";
		// return;
		$this->flipbook->delete_embed_page($id);
		$data['flipbook'] = $this->flipbook->get_flipbook_detail($flipbook_id);		
		$this->load->view('admin/flipbook/view', $data);

	}

	private function upload_files($path, $title, $files) {
        $config = array(
            'upload_path'   => $path,
            'allowed_types' => 'jpg|pdf|png|jpeg',
            'overwrite'     => 1,                       
        );

        $this->load->library('upload', $config);

        $images = array();

        foreach ($files['name'] as $key => $image) {
        	
            $_FILES['images[]']['name']= $files['name'][$key];
            $_FILES['images[]']['type']= $files['type'][$key];
            $_FILES['images[]']['tmp_name']= $files['tmp_name'][$key];
            $_FILES['images[]']['error']= $files['error'][$key];
            $_FILES['images[]']['size']= $files['size'][$key];
			// print_r($_FILES);
            $extension = pathinfo($image, PATHINFO_EXTENSION);
            $fileName = $title.'_'.time().'_'.'_file.'.trim($extension);

            $images[] = $fileName;

            $config['file_name'] = $fileName;

            $this->upload->initialize($config);

            if ($this->upload->do_upload('images[]')) {
                $this->upload->data();
            } else {
                return false;
            }
        }

        return $images;
    }

    private function upload_file($path, $title, $files) {
        $config = array(
            'upload_path'   => $path,
            'allowed_types' => 'jpg|png|jpeg',
            'overwrite'     => 1,                       
        );
        // print_r($files);
        // die;
        $this->load->library('upload', $config);

        $images = array();

        	//print_r($image); die;
            $_FILES['images[]']['name']= $files['name'];
            $_FILES['images[]']['type']= $files['type'];
            $_FILES['images[]']['tmp_name']= $files['tmp_name'];
            $_FILES['images[]']['error']= $files['error'];
            $_FILES['images[]']['size']= $files['size'];
			// print_r($_FILES);
            $extension = pathinfo($files['name'], PATHINFO_EXTENSION);
            $fileName = $title.'_'.time().'_'.'_.'.trim($extension);

            $images[] = $fileName;

            $config['file_name'] = $fileName;

            $this->upload->initialize($config);

            if ($this->upload->do_upload('images[]')) {
                $this->upload->data();
            } else {
                return false;
            }

        return $images[0];
    }
	
	function upload_img_file($name, $new_name, $path) {
    
		if(count($_FILES[$name]) > 0) {
		   
			$file_name = $_FILES[$name]['name'];
			$file_tmp = $_FILES[$name]['tmp_name'];
			$file_size = $_FILES[$name]['size'];
			$file_error = $_FILES[$name]['error'];
			$file_type = $_FILES[$name]['type'];
			$file_ext = explode('.', $file_name);
			$file_act_ext = strtolower(end($file_ext));
			$allowed = ['jpg', "png", "jpeg"];
		   
		
			if( !in_array($file_act_ext, $allowed) )
				throw new Exception("File type is not allowed! Only JPG, PNG and JPEG images are allowed.");
		
			$new_file_name = $new_name . "." . $file_act_ext;
			$file_des = $path . '/' . $new_file_name;
		
			$move = move_uploaded_file($file_tmp, $file_des);
		
			if(!$move){
				throw new Exception("Sorry Failed To Upload Image");
			}else{ 
				$image_name = [$new_file_name];
				return $image_name[0]; 
			}
		}
	}
	
}

?>