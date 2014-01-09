<?php
/**
 * APIs for user
 * check_user
 * get_code
 * authen_code
 * regist_user
 * get_user_info
 * update_user_info 
 * @return JSON Object
 */
class UserController extends AppController {
	public $name = 'User';
        public $components = array('Sphinx', 'Session', 'RequestHandler');
	public $uses = array('User', 'AuthenCodeLog', 'UserProfile');
        var    $autoRender = false;

        /**
         * index view
         * not show anything 
         */
	public function index() {
            $result = Array(
                "retval" => false,
                "error_code" => 0,
                "error_msg" => "restricted zone"
            );
            echo json_encode($result);
	}
        
        /**
         * check user exists 
         * @param string uuid
         */
        public function check_user() {
            
            if (empty($this->request->query['uuid'])) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' req params uuid not found', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 1,
                    "error_msg" => "req params not found",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            $uuid = $this->request->query['uuid'];
            $data  = $this->User->find('first', array(
                'conditions' => array('uuid' => $uuid)
                ));
            if (empty($data)) {
                $this->log(__CLASS__ . '::' . __FUNCTION__ . ' user not exists', LOG_ERR);
                $result = (object)Array(
                    'retval' => false,
                    'error_code' => 2,
                    'error_msg' => 'user not exists',
                    'timestamp' => time()
                );
            } else {
                
                $user_id = $data['User']['id'];
                $user_data = $this->User->findUser($user_id, $uuid);
                
                $result = (object)Array(
                    'retval' => true,                    
                    'user_data' => $user_data,
                    'timestamp' => time()
                );
            }
            echo json_encode($result);            
        }
        
        
        /**
         * authen code
         * @param string mobile_num
         * @param string authen_code
         * @param int isp
         */
        public function authen_code() {
            if ($this->request->method() != 'POST') {
                $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not allow access', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 0,
                    "error_msg" => "error request",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            if (empty($this->request->data['mobile_num'])
                || empty($this->request->data['authen_code'])
                    || empty($this->request->data['isp'])) {
                $this->log(__CLASS__ . '::' . __FUNCTION__ . ' req params not provided', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 1,
                    "error_msg" => "req params not provided",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            $mobile_num = $this->request->data['mobile_num'];
            $authen_code = $this->request->data['authen_code'];
            $isp = $this->request->data['isp'];
            
            //var_dump($isp, $authen_code); exit();
            //TODO: do authen with SMS server here
            
            
            // do authen code by email
            $valid = true;
            if ((int)$isp === 4) {
                $mobile_sess = $this->Session->read('mobile_num');
                $code_sess = $this->Session->read('authen_code');
                
                //var_dump($mobile_sess, $code_sess); exit();
                
                if ($mobile_num != $mobile_sess
                        || $authen_code != $code_sess) {
                    $valid = false;
                }
            }
            
            if ($valid) {
                try {
                    $this->AuthenCodeLog->insertCode($mobile_num, $authen_code, $isp);
                    $result = Array(
                        "retval" => true,
                        "mobile_num" => $mobile_num,
                        "timestamp" => time()
                    );
                    echo json_encode($result);
                    exit();
                } catch (Exception $e) {
                    $this->log(__CLASS__ . '::' . __FUNCTION__ . ' '. $e->getMessage(), LOG_ERR);
                    $result = Array(
                        "retval" => false,
                        "error_code" => 2,
                        "error_msg" => "could not authen code",
                        "timestamp" => time()
                    );
                    echo json_encode($result);
                    exit;
                }
            } else {
                    $this->log(__CLASS__ . '::' . __FUNCTION__ . '  authen code invalid', LOG_DEBUG);
                    $result = Array(
                        "retval" => false,
                        "error_code" => 2,
                        "error_msg" => "authen code invalid",
                        "timestamp" => time()
                    );
                    echo json_encode($result);
                    exit;
            }
        }
        
        /**
         * get code
         * @param string mobile_num
         * @param int isp
         */
        public function get_code() {
            if ($this->request->method() != 'POST') {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not allow access', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 0,
                    "error_msg" => "error request",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            if (empty($this->request->data['mobile_num'])
                    || empty($this->request->data['isp'])) {                
                $this->log(__CLASS__.'::'.__FUNCTION__.' req params not provided', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 0,
                    "error_msg" => "req params not provided",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $mobile_num = $this->request->data['mobile_num'];
            $isp = $this->request->data['isp'];
            //TODO: do authen with SMS server here
            
            $result = Array(
                "retval" => true,
                "mobile_num" => $mobile_num,
                "timestamp" => time()
            );
            echo json_encode($result);
            
        }
        
        /**
         * regist user
         * @param mobile_num varchar
         * @param authen_code varchar
         * @param user_data JSON object 
         */
        public function regist_user() {
            if ($this->request->method() != 'POST') {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not allow access', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 0,
                    "error_msg" => "error request",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            if (empty($this->request->data['mobile_num'])
                || empty($this->request->data['authen_code'])
                || empty($this->request->data['isp'])
                || empty($this->request->data['user_data'])) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' req params invalid', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 1,
                    "error_msg" => "req params invalid",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $mobile_num = $this->request->data['mobile_num'];
            $authen_code = $this->request->data['authen_code'];
            $isp = $this->request->data['isp'];
            $user_data = json_decode($this->request->data['user_data']);
            //var_dump($user_data);
            
            if (empty($user_data)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' user data is empty', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "user data empty",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $code = $this->AuthenCodeLog->getCode($mobile_num, $authen_code, $isp);
            
            if (empty($code)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' authen code invalid', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 3,
                    "error_msg" => "authen code invalid",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            try {
                $this->User->begin();
                $user = $this->User->insertUser($mobile_num, $user_data);                
                $this->UserProfile->insertUser($user['User']['id'], $isp, $user_data);
                $this->User->commit();
            } catch (Exception $e) {
                $this->User->rollback();
                $this->log(__CLASS__.'::'.__FUNCTION__.' create user error'. $e->getMessage(), LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 4,
                    "error_msg" => "create user error",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
                
            }
           
            $result = Array(
                "retval" => true,
                "user_id" => $user['User']['id'],                
                "timestamp" => time()
            );
            echo json_encode($result);
            
            
        }
        
        /**
         *  get user info function
         *  @param user_id int
         */
        public function get_user_info() {
            if ($this->request->method() != 'GET') {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not allow access', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 0,
                    "error_msg" => "error request",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            if (empty($this->request->query['user_id'])
                || empty($this->request->query['uuid'])) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' req params invalid', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 1,
                    "error_msg" => "req params invalid",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $user_id = $this->request->query['user_id'];
            $uuid = $this->request->query['uuid'];
            $user = $this->User->findUser($user_id, $uuid);
            
            if (empty($user)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not found user', LOG_DEBUG);
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "not found user",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            //create url for avatar
            $avatar = $user['User']['avatar'];
            if (!empty($avatar)) {
                $avatar = str_replace('__', '/', $avatar);
                $avatar = 'http://' . $_SERVER['HTTP_HOST'] . '/img/uploads/'. $avatar;
                $user['User']['avatar'] = $avatar;
            }
            //var_dump($avatar);
            
            $result = Array(
                "retval" => true,
                "user_data" => $user['User'],                
                "timestamp" => time()
            );
            echo json_encode($result);
            
            
        }
        
        /**
         * update user info
         * @param user_id varchar
         * @param authen_code varchar
         * @param update_data JSON object 
         */
        public function update_user_info() {
            if (empty($this->request->data['user_id'])
                || empty($this->request->data['uuid'])    
                || empty($this->request->data['update_info'])) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' req params invalid', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 1,
                    "error_msg" => "req params invalid",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $update_info = json_decode($this->request->data['update_info']);
            //var_dump($update_info);
            
            if (empty($update_info)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' update data is empty', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "update data empty",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $user = $this->User->findUser($user_id, $uuid);
            
            if (empty($user)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not found user', LOG_DEBUG);
                $result = Array(
                    "retval" => false,
                    "error_code" => 3,
                    "error_msg" => "not found user",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            try {
                $this->User->begin();                
                $user = $this->User->updateUserInfo($user_id, $uuid, $update_info);
                $profile = $this->UserProfile->updateUserInfo($user_id, $update_info);
                $this->User->commit();
            } catch (Exception $e) {
                $this->User->rollback();
                $this->log(__CLASS__.'::'.__FUNCTION__.' update user info error->'.$e->getMessage(), LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 4,
                    "error_msg" => "update user info error",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit();
            }
            
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,            
                "timestamp" => time()
            );
            echo json_encode($result);
        }
}
