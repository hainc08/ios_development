<?php
/**
 * APIs for registration
 * 
 * @return JSON Object
 */
App::uses('CakeEmail', 'Network/Email');
App::import('Vendor', 'ItellValidator');
App::import('Vendor', 'ToolKit');

class RegistController extends AppController {
	public $name = 'User';
        public $components = array('Session', 'RequestHandler');
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
         * get code by email
         * @param string mobile_num
         * @param int isp
         */
        public function get_code_email() {
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
                    || empty($this->request->data['email'])) {                
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
            $email = $this->request->data['email'];
            
            if (! ItellValidator::isValidEmail($email)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' email invalid', LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 1,
                    "error_msg" => "email invalid",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            } 
            
            //rand invite_code
            $code = ToolKit::randString();
            //loop 100 times to check if inviteCode is duplicated
            $error = true;
            for ($i = 0; $i < 100; $i++) {
                if ($this->AuthenCodeLog->duplicateCode($code)) {
                    $code = ToolKit::randString();
                } else {
                    $error = false;
                    break;
                }
            }
            if ($error) {
                $this->log(__CLASS__ . __FUNCTION__ . ' Could not generate authen code', LOG_DEBUG);
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "could not generate authen code",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            //var_dump($code); exit();
            //write data to session to confirm afterward
            $this->Session->write('authen_code', $code);
            $this->Session->write('mobile_num', $mobile_num);
            
            //send email
            
            $subj = __('Authentication code');
        
            try {
                $invite = new CakeEmail('gmail');
                $invite->viewVars(array('receiver' => $mobile_num));
                $invite->viewVars(array('code' => $code));
                $invite->subject($subj);

                $invite->template('authen_code', 'default')
                    ->emailFormat('html')
                    ->to($email)
                    ->from('itel.csn2012@gmail.com')
                    ->send();

                $this->log(__CLASS__.'::'.__FUNCTION__.' send email success', LOG_DEBUG);
                $result = Array(
                    "retval" => true,
                    "mobile_num" => $mobile_num,
                    "email" => $email,
                    "code" => $code,
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;

            } catch (Exception $e) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' send email fail '. $e->getMessage(), LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "send email fail",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
       }
}
