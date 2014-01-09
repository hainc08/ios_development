<?php

/**
 * APIs for chat
 * get_server
 * @return JSON Object
 */
App::import('Vendor', 'Predis/Autoloader');
Predis\Autoloader::register();

class ChatController extends AppController {

    public $name = 'Chat';
    public $uses = array('User', 'UserProfile', 'Stamp', 'UserStamp', 'UserFriendInvite', 'UserFriend');
    var $autoRender = false;

    /**
     * get socket server 
     */
    public function get_server() {

        if ($this->request->method() != 'GET') {
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
        if (empty($this->request->query['user_id'])
                || empty($this->request->query['uuid'])) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' req params invalid', LOG_ERR);
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

        $user = $this->User->find('first', array(
            'conditions' => array(
                'id' => $user_id,
                'uuid' => $uuid
            )
                ));
        if (empty($user)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 2,
                "error_msg" => "not found user",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        //TODO: list socket server
        //$listServer = array('localhost:9001', 'localhost:9002');
        $listServer = array('49.212.140.145:9001', '49.212.140.145:9002');

        try {
            $redis = new Predis\Client(array(
                        'host' => '127.0.0.1',
                        'port' => '6379',
                        'password' => 'itell@2012!'
                    ));
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success connection Redis', LOG_DEBUG);
        } catch (Exception $e) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' error connection Redis' . $e->getMessage(), LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 0,
                "error_msg" => "not found server",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit();
        }

        $cc = array();
        foreach ($listServer as $s) {
            $cc[$s] = 0;
        }

        //$countConnection = $redis->get('testkey');
        $countConnection = $redis->lrange('countConnection', 0, -1);
        //var_dump($countConnection);


        if (!empty($countConnection)) {
            foreach ($countConnection as $connection) {
                $server = json_decode($connection);
                //var_dump($server);
                if (!empty($server)) {
                    $cc[$server->server] = $server->cc;
                }
            }
        }
        $min = 100000;
        $socket_server = '';
        foreach ($listServer as $sv) {
            if ($min > $cc[$sv]) {
                $min = $cc[$sv];
                $socket_server = $sv;
            }
        }

        $result = Array(
            "retval" => true,
            "server" => $socket_server,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * Get Free Stamp 
     */
    public function get_list_free_stamp() {
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
                || !isset($this->request->data['updated'])) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' req params invalid', LOG_ERR);
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
        $updated = intval($this->request->data['updated']);
        if ($updated < 0) {
            $updated = 0;
        }
        $updated = date('Y-m-d H:i:s', $updated);
        $stamps = $this->Stamp->find('all', array(
            'conditions' => array('price' => 0, 'modified >' => $updated),
            'fields' => array('id', 'image', 'code'),
            'recursive' => 0
                ));
        $stamp_list = array();
        foreach ($stamps as $row) {
            $item = array();
            $item['id'] = $row['Stamp']['id'];
            $item['code'] = $row['Stamp']['code'];
            $item['image'] = $row['Stamp']['image'];
            $stamp_list[] = $item;
        }
        $result = array(
            'retval' => true,
            'user_id' => $user_id,
            'time_stamp' => time(),
            'stamp_list' => $stamp_list
        );
        echo json_encode($result);
        die;
    }

    public function get_list_user_stamp() {
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
                || !isset($this->request->data['updated'])) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' req params invalid', LOG_ERR);
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
        $updated = intval($this->request->data['updated']);
        if ($updated < 0) {
            $updated = 0;
        }
        $updated = date('Y-m-d H:i:s', $updated);
        $stamps = $this->UserStamp->find('all', array(
            'fields' => array('UserStamp.count', 'Stamp.id', 'Stamp.image', 'Stamp.code'),
            'conditions' => array('UserStamp.modified >' => $updated),
            'recursive' => 1,
            'joins' => array(
                array(
                    'table' => 'stamps',
                    'alias' => 'Stamp',
                    'type' => 'LEFT',
                    'conditions' => array('Stamp.id = UserStamp.stamp_id')
                )
            )
        ));
        $stamp_list = array();
        foreach ($stamps as $row) {
            $item = array();
            $item['id'] = $row['Stamp']['id'];
            $item['code'] = $row['Stamp']['code'];
            $item['image'] = $row['Stamp']['image'];
            $item['count'] = $row['UserStamp']['count'];
            $stamp_list[] = $item;
        }
        $result = array(
            'retval' => true,
            'user_id' => $user_id,
            'time_stamp' => time(),
            'stamp_list' => $stamp_list
        );
        echo json_encode($result);
        die;
    }

}
