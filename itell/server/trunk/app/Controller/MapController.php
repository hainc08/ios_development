<?php

/**
 * APIs for map
 * post_position
 * get_map_data
 * @return JSON Object
 */
class MapController extends AppController {

    public $name = 'Friend';
    public $components = array('Sphinx');
    public $uses = array('User', 'Company', 'PositionLog', 'UserProfile', 'UserFriendInvite', 'UserFriend');
    var $autoRender = false;

    /**
     * Get map data
     * @param int $friend_type
     * @return array 
     */
    private function get_map_data($friend_type) {
        if ($friend_type != SphinxComponent::FRIEND_ALL && $friend_type != SphinxComponent::FRIEND_FALSE &&
                $friend_type != SphinxComponent::FRIEND_TRUE && $friend_type != SphinxComponent::COMPANY) {
            $friend_type = SphinxComponent::FRIEND_ALL;
        }
        $max_matches = 100;
        $distance = 2000;
        $page = 1;
        if ($this->request->method() != 'POST') {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not allow access', LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 0,
                "error_msg" => "error request",
                "timestamp" => time()
            );
            return $result;
        }
        if (empty($this->request->data['user_id'])
                || empty($this->request->data['uuid'])
                || empty($this->request->data['longitude'])
                || empty($this->request->data['latitude'])) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' req params invalid', LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 1,
                "error_msg" => "req params invalid",
                "timestamp" => time()
            );
            return $result;
        }
        $user_id = $this->request->data['user_id'];
        $lon = deg2rad($this->request->data['longitude']);
        $lat = deg2rad($this->request->data['latitude']);
        if (isset($this->request->data['max_matches'])) {
            $max_matches = intval($this->request->data['max_matches']);
            if ($max_matches <= 0) {
                $max_matches = 100;
            }
        }
        if (isset($this->request->data['distance'])) {
            $distance = intval($this->request->data['distance']);
            if ($distance <= 0) {
                $distance = 2000;
            }
        }
        if(isset($this->request->data['page'])){
            $page = intval($this->request->data['page']);
            if($page <= 0){
                $page = 1;
            }
        }
        $offset = ($page -1) * $max_matches;
        $sphinx_result = $this->Sphinx->findUserIdByGeolocation($lon, $lat, $user_id, $friend_type, $distance, $offset, $max_matches, $max_matches + $offset);
        if ($friend_type == SphinxComponent::COMPANY) {
            $result = $this->get_company_map_data($user_id, $sphinx_result);
        } else {
            $result = $this->get_user_map_data($user_id, $sphinx_result);
        }
        $result['current_page'] = $page;
        return $result;
    }

    private function get_company_map_data($user_id, $sphinx_result) {
        echo "<pre>";
        $total_found = 0;
        $company_data = array();
        if ($sphinx_result != NULL) {
            $total_found = $sphinx_result['total_found'];
            if (empty($sphinx_result['ids']) == false) {
                $companies = $this->Company->find('all', array(
                    'conditions' => array("id" => $sphinx_result['ids']),
                    'order' => array('FIELD (id,' . implode(", ", $sphinx_result['ids']) . ')'),
                    'recursive' => 0
                        ));
                foreach ($companies as $row) {
                    $item = array();
                    $item['id'] = $row['Company']['id'];
                    $item['name'] = $row['Company']['name'];
                    $item['address'] = $row['Company']['address'];
                    $item['longitude'] = $row['Company']['longitude'];
                    $item['latitude'] = $row['Company']['latitude'];
                    $item['mobile_num'] = $row['Company']['mobile_num'];
                    $item['email'] = $row['Company']['email'];
                    $item['avatar'] = $row['Company']['avatar'];
                    $item['desc'] = $row['Company']['desc'];
                    $item['distance'] = $sphinx_result['geos'][$item['id']];
                    $company_data[] = $item;
                }
            }
        }
        $result = array(
            'retval' => true,
            'total_found' => $total_found,
            'user_id' => $user_id,
            'timestamp' => time(),
            'company_data' => $company_data
        );
        return $result;
    }

    private function get_user_map_data($user_id, $sphinx_result) {
        $total_found = 0;
        $friend_data = array();
        if ($sphinx_result != NULL) {
            $total_found = $sphinx_result['total_found'];
            if (empty($sphinx_result['ids']) == false) {
                $users = $this->User->find('all', array(
                    'conditions' => array("id" => $sphinx_result['ids']),
                    'order' => array('FIELD (id,' . implode(", ", $sphinx_result['ids']) . ')'),
                    'recursive' => 0
                        ));
                $friends = $this->UserFriend->find('all', array(
                    'conditions' => array('user_id' => $user_id),
                    'fields' => 'friend_id',
                    'recursive' => 0
                        ));
                $friends_id = array();
                foreach ($friends as $row) {
                    $friends_id[$row['UserFriend']['friend_id']] = 1;
                }
                foreach ($users as $row) {
                    $item = array();
                    $item['id'] = $row['User']['id'];
                    $item['nick'] = $row['User']['nick'];
                    $item['avatar'] = $row['User']['avatar'];
                    $item['longitude'] = $row['User']['longitude'];
                    $item['latitude'] = $row['User']['latitude'];
                    $item['gender'] = $row['User']['gender'];
                    if ($row['User']['itell_status']) {
                        switch ($row['User']['itell_policy']) {
                            case User::ITELL_POLICY_ALL:
                                $item['itell'] = $row['User']['itell'];
                                break;
                            case User::ITELL_POLICY_ONLY_FRIEND:
                                if (isset($friends_id[$item['id']])) {
                                    $item['itell'] = $row['User']['itell'];
                                } else {
                                    $item['itell'] = '';
                                }
                                break;
                            case User::ITELL_POLICY_ONLY_OTHER:
                                if (isset($friends_id[$item['id']])) {
                                    $item['itell'] = '';
                                } else {
                                    $item['itell'] = $row['User']['itell'];
                                }
                                break;
                        }
                    } else {
                        $item['itell'] = '';
                    }
                    $item['itell_start'] = $row['User']['itell_start'];
                    $item['distance'] = $sphinx_result['geos'][$item['id']];
                    $friend_data[] = $item;
                }
            }
        }
        $result = array(
            'retval' => true,
            'total_found' => $total_found,
            'user_id' => $user_id,
            'timestamp' => time(),
            'friend_data' => $friend_data
            );
        return $result;
    }

    /**
     * post current user's position 
     */
    public function post_position() {
        if ($this->request->method() != 'POST') {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not allow access', LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 0,
                "error_msg" => "error request",
                "timestamp" => time()
            );
            echo json_encode($result);
            die;
        }
        if (empty($this->request->data['user_id'])
                || empty($this->request->data['uuid'])
                || empty($this->request->data['longitude'])
                || empty($this->request->data['latitude'])
                || empty($this->request->data['time_stamp'])
                || is_numeric($this->request->data['longitude']) == false
                || is_numeric($this->request->data['latitude']) == false) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' req params invalid', LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 1,
                "error_msg" => "req params invalid",
                "timestamp" => time()
            );
            echo json_encode($result);
            die;
        }
        $this->User->id = $this->request->data['user_id'];
        $data = array(
            'uuid' => $this->request->data['uuid'],
            'longitude' => $this->request->data['longitude'],
            'latitude' => $this->request->data['latitude'],
            'position_time' => date('Y-m-d H:i:s', $this->request->data['time_stamp'])
        );
        $update = $this->User->save($data);
        if (empty($update)) {
            $result = Array(
                "retval" => false,
                "error_code" => 2,
                "error_msg" => "cannot update database",
                "timestamp" => time()
            );
            echo json_encode($result);
            die;
        }
        $this->PositionLog->create();
        $pos_data = array(
            'user_id' => $this->request->data['user_id'],
            'longitude' => $data['longitude'],
            'latitude' => $data['latitude'],
            'street' => $this->request->data['street'],
            'strict' => $this->request->data['strict'],
            'city' => $this->request->data['city'],
            'created' => date('Y-m-d H:i:s', time()),
            'updated' => date('Y-m-d H:i:s', time())
        );
        $this->PositionLog->save($pos_data);
        $result = Array(
            "retval" => true,
            "user_id" => $this->request->data['user_id'],
            "timestamp" => time()
        );
        echo json_encode($result);
        die;
    }

    /**
     * get map data 
     */
    public function get_map_other() {
        $result = $this->get_map_data(SphinxComponent::FRIEND_FALSE);
        echo json_encode($result);
        die;
    }

    /**
     * get map friend 
     */
    public function get_map_friend() {
        $result = $this->get_map_data(SphinxComponent::FRIEND_TRUE);
        echo json_encode($result);
        die;
    }

    public function get_map_company() {
        $result = $this->get_map_data(SphinxComponent::COMPANY);
        echo json_encode($result);
        die;
    }

}
