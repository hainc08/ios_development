<?php
/**
 * APIs for itell
 * post_itell
 * get_itell
 * cancel_itell
 * @return JSON Object
 */
class ItellController extends AppController {

	public $name = 'Itell';

	public $uses = array('User', 'ItellLog');
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
         * post itell 
         * @param int user_id
         * @param string uuid
         * @param string itell
         * @param int itell_policy
         */
        public function post_itell() {
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
            if (empty($this->request->data['user_id'])
                || empty($this->request->data['uuid'])
                || empty($this->request->data['itell'])
                || empty($this->request->data['itell_policy'])) {
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
            
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $itell = $this->request->data['itell'];
            $itell_policy = $this->request->data['itell_policy'];
            
            if (mb_strlen($itell, 'utf-8') > 200) {
                $this->log(__CLASS__ . '::' . __FUNCTION__ . ' itell too long', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "itell too long",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            
            
            try {
                $this->User->begin();
                $user = $this->User->createItell($user_id, $uuid, $itell, $itell_policy);                
                $itell_log = $this->ItellLog->insertItell($user_id, $itell, $itell_policy, $user['User']['itell_start']);
                $this->User->commit();
            } catch (Exception $e) {
                $this->User->rollback();
                $this->log(__CLASS__ . '::' . __FUNCTION__ . ' error create itell ->'.$e->getMessage(), LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 3,
                    "error_msg" => "error create itell",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,
                "start_time" => $user['User']['itell_start'],
                "timestamp" => time()
            );
            echo json_encode($result);
            
        }
        
        /**
         * get itell 
         * @param int user_id
         * @param string uuid 
         */
        public function get_itell() {
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
            
            $itell = $this->User->getItell($user_id, $uuid);
            
            if (empty($itell)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' itell not found user->'.$user_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "itell not found",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,
                "itell" => $itell['User'],
                "timestamp" => time()
            );
            echo json_encode($result);
            
        }
        
        /**
         * cancel itell 
         * @param int user_id
         * @param string uuid 
         */
        public function cancel_itell() {
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
            if (empty($this->request->data['user_id'])
                || empty($this->request->data['uuid'])) {
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
            
            $itell = $this->User->cancelItell($user_id, $uuid);
            
            if (empty($itell)) {
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "error cancel itell",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,                
                "timestamp" => time()
            );
            echo json_encode($result);
        }
}
