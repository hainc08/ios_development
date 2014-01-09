<?php

/**
 * Admin Panel
 */

App::import('Vendor', 'giftValidation');
App::import('Vendor', 'ImageFile');
App::import('Vendor', 'UploadImageFile');

class AdminController extends AppController {

    public $name = 'Admin';
    public $uses = array('User', 'UserProfile', 'Stamp', 'UserStamp', 'UserFriendInvite', 'UserFriend', 'Company');
    public $components = array('AdminAuth', 'Session', 'RequestHandler', 'Paginator');
    public $helpers = array('Paginator');
    
    public function index() {
        $this->layout = "admin";
        $this->set('header', __('Dashboard'));
    }
    
    /**
     * user action 
     * show current list user
     */
    public function list_user() {
        $this->layout = 'admin';
        $this->set('header', __('User'));
                
        //$page = $this->request->query['page'];
        
        $this->Paginator->settings = $this->User->getListParams();
        $users = $this->paginate('User');
        
        $this->set('users', $users);
        
    }
    
    /**
     * edit user
     * @param string user_id
     */
    public function edit_user() {
        if (!isset($this->request->query['user_id'])) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found user_id', LOG_ERR);
            exit();
        }
        
        $this->layout = 'admin';
        $this->set('header', __('Edit_user'));
        
        $user_id = $this->request->query['user_id'];
        
        $user_data = $this->User->getUserById($user_id);
        
        //var_dump($user_data);
        
        $this->set('user_data', $user_data);
    }
    
    /**
     * edit user
     * @param string user_id
     */
    public function change_status() {
        if (!isset($this->request->query['user_id'])) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found user_id', LOG_ERR);
            exit();
        }
        
        $this->layout = 'admin';
        $this->set('header', __('Change_status_user'));
        
        $user_id = $this->request->query['user_id'];
        
        $user_data = $this->User->changeStatus($user_id);
        
        //var_dump($user_data);
        
        $this->set('user_data', $user_data);
    }
    
            
    /**
     * login action 
     */
    public function login() {
        $this->layout = "login";
    }

    /**
     * logout action
     * @return type 
     */
    public function logout() {
        $admin = $this->Session->read('admin_id');
        if ($admin)
            $this->Session->delete('admin_id');
        return $this->redirect('/admin/login');
    }
    
    /**
     * create new company 
     */
    public function create_company() {
        $this->layout = "admin";
        $this->set('header', __('Create_company'));
        
    }
    
    /**
     * add company 
     */
    public function add_company() {
        if (!isset($this->request->data['name'])
            || !isset($this->request->data['tel'])   
            || !isset($this->request->data['email'])       
            || !isset($this->request->data['address'])       
            || !isset($this->request->data['desc'])       
            || !isset($this->request->data['long'])           
            || !isset($this->request->data['lat'])               
                ) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found company data', LOG_ERR);
            exit();
        }
        
        if (giftValidation::checkRequireUploadFile('avatar') == false) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found image', LOG_ERR);
            exit();
        }
        if (giftValidation::checkUploadFileType('avatar', giftValidation::getUploadImageType()) == false) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' image type invalid', LOG_ERR);
            exit();
        }
        
        $company['name'] = $this->request->data['name'];
        $company['mobile_num'] = $this->request->data['tel'];
        $company['email'] = $this->request->data['email'];
        $company['address'] = $this->request->data['address'];
        $company['desc'] = $this->request->data['desc'];
        $company['longitude'] = $this->request->data['long'];
        $company['latitude'] = $this->request->data['lat'];
        
        $iconImages = UploadImageFile::saveUploadImage('avatar', 'company');
        if (count($iconImages) > 0) {
            $company['avatar'] = $iconImages[0];
        }
        
        $insert = $this->Company->insertCompany($company);
        
        if (empty($insert)) {            
            $this->Session->setFlash(__('Create_company_error'));
        }
        
        $this->redirect('/admin/list_company');
    }
    
    /**
     * list company 
     */
    public function list_company() {
        $this->layout = "admin";
        $this->set('header','List_company');
        
        
        $this->Paginator->settings = $this->Company->getListParams();
        $companies = $this->paginate('Company');
        
        $this->set('companies', $companies);
    }
    
    /**
     * edit company
     * @param int comp_id 
     */
    public function edit_company() {
        $this->layout = "admin";
        $this->set('header','Edit_company');
        
        
        if (!isset($this->request->query['comp_id'])) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found company_id', LOG_ERR);
            exit();
        }
        
        $company_id = $this->request->query['comp_id'];
        
        $data = $this->Company->getCompanyInfo($company_id);
        
        $this->set('data', $data);
        
    }
    
    /**
     * add company 
     */
    public function modify_company() {
        if (!isset($this->request->data['name'])
            || !isset($this->request->data['tel'])   
            || !isset($this->request->data['email'])       
            || !isset($this->request->data['address'])       
            || !isset($this->request->data['desc'])       
            || !isset($this->request->data['long'])           
            || !isset($this->request->data['lat'])               
                ) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found company data', LOG_ERR);
            exit();
        }
        
        $company['id'] = $this->request->data['comp_id'];
        $company['name'] = $this->request->data['name'];
        $company['mobile_num'] = $this->request->data['tel'];
        $company['email'] = $this->request->data['email'];
        $company['address'] = $this->request->data['address'];
        $company['desc'] = $this->request->data['desc'];
        $company['longitude'] = $this->request->data['long'];
        $company['latitude'] = $this->request->data['lat'];
        
        if (giftValidation::checkRequireUploadFile('avatar') == true
            && giftValidation::checkUploadFileType('avatar', giftValidation::getUploadImageType()) == true
                ) {
                $iconImages = UploadImageFile::saveUploadImage('avatar', 'company');
                if (count($iconImages) > 0) {
                    $company['avatar'] = $iconImages[0];
                }
                }
        
        $insert = $this->Company->saveCompany($company);
        
        if (empty($insert)) {            
            $this->Session->setFlash(__('Modify_company_error'));
        }
        
        $this->redirect('/admin/list_company');
    }
    
    /**
     * change status company
     * @param string user_id
     */
    public function change_status_comp() {
        
        if (!isset($this->request->query['comp_id'])) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found user_id', LOG_ERR);
            exit();
        }
        
        $comp_id = $this->request->query['comp_id'];
        
        $insert = $this->Company->changeStatus($comp_id);
        
        if (empty($insert)) {            
            $this->Session->setFlash(__('Modify_company_error'));
        }
        
        $this->redirect('/admin/list_company');
    }
            
    
}
