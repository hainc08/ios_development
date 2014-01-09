<?php
App::import('Model', 'UserContact');
/**
 * APIs for friend
 * get_list_invite
 * accept_invite
 * deny_invite
 * get_list_friend
 * @return JSON Object
 */
App::uses('CakeEmail', 'Network/Email');
App::import('Vendor', 'ItellValidator');

class FriendController extends AppController {

    public $name = 'Friend';
    public $components = array('Sphinx', 'ItellAuth');
    public $uses = array('User', 'UserContact', 'UserProfile', 'UserFriendInvite', 'UserFriend');
    var $autoRender = false;
    
    private function get_contacts_data($user_contact_type){
        if($user_contact_type != UserContact::APP_NOT_USING && $user_contact_type != UserContact::APP_USING_FRIEND &&
                $user_contact_type != UserContact::APP_USING_NOT_FRIEND){
            $user_contact_type = UserContact::APP_NOT_USING;
        }
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
                || empty($this->request->data['uuid'])) {
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
        $page = intval($this->request->data['page']);
        $number_per_page = 20;
        if($page <= 0){
            $page = 1;
        }
        $total_found = $this->UserContact->find('count', array(
            'conditions' => array(
                "app_using_friend" => $user_contact_type,
                'user_id' => $user_id
            ),
            'recursive' => 0
        ));
        $total_page = ceil($total_found / $page);
        $offset = ($page -1) * $number_per_page;
        $contact = $this->UserContact->find('all', array(
            'conditions' => array(
                "app_using_friend" => $user_contact_type,
                "user_id" => $user_id
            ),
            'offset' => $offset,
            'limit' => $number_per_page,
            'recursive' => 0
        ));
        $contact_data = array();
        foreach($contact as $row){
            $item = array();
            $item['id'] = $row['UserContact']['id'];
            $item['name'] = $row['UserContact']['name'];
            $item['mobile_num'] = $row['UserContact']['mobile_num'];
            $item['email'] = $row['UserContact']['email'];
            $contact_data[] = $item;
        }
        $result = array(
            'retval' => true,
            'current_page' => $page,
            'total_page' => $total_page,
            'total_found' => $total_found,
            'timestamp' => time(),
            'user_id' => $user_id,
            'contacts' => $contact_data
        );
        return $result;
    }
    
    /**
     * get list invite 
     * @param int user_id
     * @param string uuid 
     */
    public function get_list_invite() {
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

        $invites = $this->UserFriendInvite->getListInvite($user_id);
        //var_dump($invites);

        if (empty($invites)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found invite user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "not found invite",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "invite_data" => $invites,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * accept invitation
     * @param int user_id
     * @param string uuid
     * @param int invite_id 
     */
    public function accept_invite() {
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
                || empty($this->request->data['invite_id'])) {
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
        $invite_id = $this->request->data['invite_id'];

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

        $invite = $this->UserFriendInvite->find('first', array(
            'conditions' => array(
                'id' => $invite_id,
                'status > ' => 0
            )
                ));

        if (empty($invite)
                || ($invite['UserFriendInvite']['friend_id'] != $user_id)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found invite ->' . $invite_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "not found invite",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $friend_id = $invite['UserFriendInvite']['user_id'];
        $friend = $this->User->find('first', array(
            'conditions' => array(
                'id' => $friend_id,
            )
                ));

        if (empty($friend)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found friend ->' . $friend_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 4,
                "error_msg" => "not found friend",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $relation = $this->UserFriend->checkFriend($user_id, $friend_id);
        if ($relation) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' already friend user_id->' . $user_id . ' friend_id->' . $friend_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 5,
                "error_msg" => "already friend",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        try {
            $this->UserFriend->begin();
            $this->UserFriend->addFriend($user_id, $friend_id);
            $this->UserFriendInvite->deleteInvite($invite_id);
            $this->UserFriend->commit();
        } catch (Exception $e) {
            $this->UserFriend->rollback();
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' error make friend ' . $e->getMessage(), LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 6,
                "error_msg" => "error make friend",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success accept invite user->'.$user_id.' friend->'.$friend_id, LOG_DEBUG);
        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "friend_id" => $friend_id,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * deny invitation
     * @param int user_id
     * @param string uuid
     * @param int invite_id 
     */
    public function deny_invite() {
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
                || empty($this->request->data['invite_id'])) {
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
        $invite_id = $this->request->data['invite_id'];

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

        $invite = $this->UserFriendInvite->find('first', array(
            'conditions' => array(
                'id' => $invite_id,
                'status' => 1
            )
                ));

        if (empty($invite)
                || ($invite['UserFriendInvite']['friend_id'] != $user_id)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found invite ->' . $invite_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "not found invite",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $friend_id = $invite['UserFriendInvite']['user_id'];
        $friend = $this->User->find('first', array(
            'conditions' => array(
                'id' => $friend_id,
            )
                ));

        if (empty($friend)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found friend ->' . $friend_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 4,
                "error_msg" => "not found friend",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $relation = $this->UserFriend->checkFriend($user_id, $friend_id);
        if ($relation) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' already friend user_id->' . $user_id . ' friend_id->' . $friend_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 5,
                "error_msg" => "already friend",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $result = $this->UserFriendInvite->deleteInvite($invite_id);

        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * get list friend
     * @param int user_id
     * @param string uuid 
     */
    public function get_list_friend() {
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

        $friends = $this->UserFriend->find('all', array(
            'conditions' => array(
                'user_id' => $user_id,
                'status' => 1
            )
                ));

        if (empty($friends)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found friend user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "not found friend",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }
        $friend_ids = Array();
        foreach ($friends as $user_friend) {
            $friend_ids[] = $user_friend['UserFriend']['friend_id'];
        }

        $friend_data = $this->User->getUserList($friend_ids);

        if (empty($friend_data)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found friend user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "not found friend",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }
        //var_dump($friend_data);
        $list_friend = Array();
        $count = 0;
        foreach ($friends as $user_friend) {
            if (!empty($friend_data[$user_friend['UserFriend']['friend_id']])) {
                $list_friend[$count]['friend_id'] = $user_friend['UserFriend']['friend_id'];
                $list_friend[$count]['friend_nick'] = $friend_data[$user_friend['UserFriend']['friend_id']]['nick'];
                $list_friend[$count]['friend_avatar'] = $friend_data[$user_friend['UserFriend']['friend_id']]['avatar'];
                $list_friend[$count]['restrict_pub'] = $user_friend['UserFriend']['restrict_pub'];
                $count++;
            }
        }

        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "friend_data" => $list_friend,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    public function search_friend() {
        $item_per_page = 20;
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
                || empty($this->request->data['uuid'])) {
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
        $nick = $this->request->data['keyword'];
        $user_id = $this->request->data['user_id'];
        $page = intval($this->request->data['page']);
        if ($page < 1) {
            $page = 1;
        }
        $offset = ($page - 1) * $item_per_page;
        $max_matches = $offset + $item_per_page;
        $sphinx_result = $this->Sphinx->findUserIdByNick($nick, $user_id, SphinxComponent::FRIEND_FALSE, $offset, $item_per_page, $max_matches);
        $total_page = 0;
        $friend_data = array();
        $total_found = 0;

        if ($sphinx_result != NULL) {
            $total_page = ceil($sphinx_result['total_found'] / $item_per_page);
            $total_found = $sphinx_result['total_found'];
            if (empty($sphinx_result['ids']) == false) {
                $users = $this->User->find('all', array(
                    'conditions' => array("id" => $sphinx_result['ids']),
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
                    $friend_data[] = $item;
                }
            }
        }
        $result = array(
            'retval' => true,
            'current_page' => $page,
            'total_page' => $total_page,
            'total_found' => $total_found,
            'user_id' => $user_id,
            'timestamp' => time(),
            'friend_data' => $friend_data
        );
        echo json_encode($result);
        die;
    }

    public function get_contacts_not_friend() {
        $result = $this->get_contacts_data(UserContact::APP_USING_NOT_FRIEND);
        echo json_encode($result);
        die;
    }
    
    public function get_contacts_not_using(){
        $result = $this->get_contacts_data(UserContact::APP_NOT_USING);
        echo json_encode($result);
        die;
    }
    
    public function get_contacts_is_friend(){
        $result = $this->get_contacts_data(UserContact::APP_USING_FRIEND);
        echo json_encode($result);
        die;
    }
    
    /**
     * send invite by email
     * @param string user_id
     * @param string uuid
     * @param string receiver
     */
    public function send_invite_email() {
        if (!isset($this->request->data['name'])
            || !isset($this->request->data['email'])) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' receiver not found', LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 0,
                "error_msg" => "receiver not found",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }
        $name = $this->request->data['name'];
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
        
        //var_dump($this->user); exit();
        $subj = $this->user['nick'].__(' invite you to use App');
        
        try {
            $invite = new CakeEmail('gmail');
            $invite->viewVars(array('sender' => $this->user['nick']));
            $invite->viewVars(array('receiver' => $name));
            $invite->subject($subj);

            $invite->template('invite', 'invite')
                ->emailFormat('html')
                ->to($email)
                ->from('itel.csn2012@gmail.com')
                ->send();
            
            $this->log(__CLASS__.'::'.__FUNCTION__.' send email success', LOG_DEBUG);
            $result = Array(
                "retval" => true,
                "user" => $this->user['id'],
                "email" => $email,
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
