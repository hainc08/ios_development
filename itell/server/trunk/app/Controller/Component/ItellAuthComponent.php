<?php

/**
 * Authentication component
 */
class ItellAuthComponent extends Component {

    var $components = array('Session', 'RequestHandler');
    var $uses = array('User');
    var $controller = null;
    var $settings = array();

    //The initialize method is called before the controller’s beforeFilter method.
    public function initialize($controller) {
        $this->log('AuthComponent start', LOG_DEBUG);
        //Can’t use method return value in write context
        $user_id = $this->Session->read('user_id');
        // use request data if session data has not existed
        
        /*if (empty($user_id)) {
            $this->log('AuthComponent verify by request data', LOG_DEBUG);
        }*/
        
        if (empty($_REQUEST['uuid'])
            || empty($_REQUEST['user_id'])) {
                $this->log('AuthComponent not found user auth data', LOG_ERR);
                $controller->autoRender = false;
                $this->RequestHandler->respondAs('application/json; charset=UTF-8'); #TODO
                header("HTTP/1.0 401 Unauthorized");
                
                $result = Array(
                    "retval" => false,
                    "error_code" => 1,
                    "error_msg" => "req params invalid",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
                
            }
        
        $uuid = $_REQUEST['uuid'];
        $user_id = $_REQUEST['user_id'];
            
        $user = $controller->User->find('first', array(
                        'conditions' => array(
                            'id' => $user_id,
                            'uuid' => $uuid
                            )
            ));
        
        if (empty($user)) {
            $this->log('AuthComponent not found user->'.$user_id.' uuid->'.$uuid, LOG_ERR);
            $controller->autoRender = false;
            $this->RequestHandler->respondAs('application/json; charset=UTF-8');
            header("HTTP/1.0 401 Unauthorized");
            $result = Array(
                        "retval" => false,
                        "error_code" => 2,
                        "error_msg" => "not found user",
                        "timestamp" => time()
                    );
            echo json_encode($result);
            exit;
        }

        $user_id = $user['User']['id'];
        $this->Session->write('user_id', $user_id);
        $controller->user = $user['User'];
        $this->log('AuthComponent verify by request data OK user->'.$user_id, LOG_DEBUG);
        
    }
}

?>