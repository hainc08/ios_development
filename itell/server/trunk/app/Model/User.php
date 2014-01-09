<?php

App::import('model', 'UserProfile');
App::import('model', 'UserFriend');
App::import('model', 'UserBlock');
App::import('model', 'UserFriendInvite');
/**
 * User model
 *  
 */
class User extends AppModel {
    
    const ITELL_POLICY_ALL = 0;
    const ITELL_POLICY_ONLY_FRIEND = 1;
    const ITELL_POLICY_ONLY_OTHER = 2;
    /**
     * insert new user
     * @param string $mobile_num
     * @param Object $user_data 
     */
    public function insertUser($mobile_num, $user_data) {
        $this->create();
        
        $data['mobile_num'] = $mobile_num;
        $data['uuid'] = $user_data->uuid;
        $data['nick'] = $user_data->nick;
        $data['gender'] = $user_data->gender;
        $data['can_search'] = 1;
        $data['status'] = 1;
        
        $result = $this->save($data);        
        if ($result) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' create user -> '.$result['User']['id'], LOG_DEBUG);
        }
        return $result;
    }
    
    /**
     * find User
     * @param int $user_id
     * @param string $uuid 
     */
    public function findUser($user_id, $uuid) {
        $result = $this->find('first', array(
            'conditions' => array(
                'id' => $user_id,
                'uuid' => $uuid,
                'status' => 1
            ),
            'fields' => array('id', 'nick', 'mobile_num', 'avatar', 'gender', 'itell', 'itell_policy', 'itell_start')
        ));
        if (empty($result)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        //var_dump($result);
        $profile = new UserProfile();
        $user_profile = $profile->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'status' => 1
            ),
            'fields' => array('name', 'birth', 'desc', 'badge_good', 'badge_normal', 'badge_bad')                 
        ));
        if (empty($user_profile)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        
        if ($result['User']['avatar']) {
            $result['User']['avatar'] = $this->getLinkImage($result['User']['avatar']);
        }
        //var_dump($user_profile);
        $result['User']['name'] = $user_profile['UserProfile']['name'];
        $result['User']['birth'] = $user_profile['UserProfile']['birth'];
        $result['User']['desc'] = $user_profile['UserProfile']['desc'];
        $result['User']['badge_good'] = $user_profile['UserProfile']['badge_good'];
        $result['User']['badge_normal'] = $user_profile['UserProfile']['badge_normal'];
        $result['User']['badge_bad'] = $user_profile['UserProfile']['badge_bad'];
        
        return $result;
        
    }
    
    /**
     * update user info
     * @param int $user_id
     * @param string $uuid
     * @param Object $update_info 
     */
    public function updateUserInfo($user_id, $uuid, $update_info) {
        $user = $this->find('first', array(
            'conditions' => array(
                'id' => $user_id,
                'uuid' => $uuid,
                'status' => 1
            )
        ));
        if (empty($user)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        $update = Array();
        if (!empty($update_info->nick)) {
            $update['User']['nick'] = $update_info->nick;
        }        
        if (!empty($update_info->avatar)) {
            $update['User']['avatar'] = $update_info->avatar;
        }        
        if (!empty($update_info->gender)) {
            $update['User']['gender'] = $update_info->gender;
        }
        
        if (!empty($update_info->hide_age)) {
            $update['User']['hide_age'] = $update_info->hide_age;
        }
        
        if (empty($update)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' no data update user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        $this->id = $user_id;
        $result = $this->save($update);
        //var_dump($result);
        return $result;
        
    }
    
    /**
     * create Itell
     * @param int $user_id
     * @param string $uuid
     * @param string $itell
     * @param int $itell_policy 
     */
    public function createItell($user_id, $uuid, $itell, $itell_policy) {
        $user = $this->find('first', array(
            'conditions' => array(
                'id' => $user_id,
                'uuid' => $uuid,
                'status' => 1
            )
        ));
        if (empty($user)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_ERR);
            throw new Exception('not found user->'.$user_id);
            return null;
        }
        
        $this->id = $user_id;
        $data['User']['itell'] = $itell;
        $data['User']['itell_policy'] = $itell_policy;
        $data['User']['itell_start'] = date('Y-m-d H:i:s',time());        
        $data['User']['itell_status'] = 1;
        
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * get itell
     * @param int $user_id
     * @param string $uuid 
     */
    public function getItell($user_id, $uuid) {
        $result = $this->find('first', array(
            'conditions' => array(
                'id' => $user_id,
                'uuid' => $uuid,
                'status' => 1
            ),
            'fields' => array('itell', 'itell_policy', 'itell_start', 'itell_status')
        ));
        
        return $result;
    }
    
    /**
     * cancel itell
     * @param int $user_id
     * @param string $uuid 
     */
    public function cancelItell($user_id, $uuid) {
        $user = $this->find('first', array(
            'conditions' => array(
                'id' => $user_id,
                'uuid' => $uuid,
                'status' => 1
            )
        ));
        if (empty($user)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_ERR);
            return null;
        }
        
        $this->id = $user_id;
        $data['itell_status'] = 0;
        $result = $this->save($data);
        //var_dump($result);
        return $result;
    }
    
    /**
     * find profile
     * @param int $user_id 
     */
    public function findProfile($user_id) {
        $result = $this->find('first', array(
            'conditions' => array(
                'id' => $user_id,                
                'status' => 1
            ),
            'fields' => array('id', 'nick', 'mobile_num', 'avatar', 'gender', 'itell', 'itell_policy', 'itell_start', 'can_search')
        ));
        if (empty($result)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        
        
        //var_dump($result);
        $profile = new UserProfile();
        $user_profile = $profile->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'status' => 1
            ),
            'fields' => array('name', 'birth', 'desc', 'badge_good', 'badge_normal', 'badge_bad')                 
        ));
        if (empty($user_profile)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        if ($result['User']['avatar']) {
            $result['User']['avatar'] = $this->getLinkImage($result['User']['avatar']);
        }
        //var_dump($user_profile);
        $result['User']['name'] = $user_profile['UserProfile']['name'];
        $result['User']['birth'] = $user_profile['UserProfile']['birth'];
        $result['User']['desc'] = $user_profile['UserProfile']['desc'];
        $result['User']['badge_good'] = $user_profile['UserProfile']['badge_good'];
        $result['User']['badge_normal'] = $user_profile['UserProfile']['badge_normal'];
        $result['User']['badge_bad'] = $user_profile['UserProfile']['badge_bad'];
        
        return $result;
    }
    
    /**
     * get profile friend
     * @param int $user_id 
     */
    public function getProfileFriend($user_id, $friend_id) {
        $result = $this->find('first', array(
            'conditions' => array(
                'id' => $friend_id,                
                'status' => 1
            ),
            'fields' => array('id', 'nick', 'mobile_num', 'avatar', 'gender', 'itell', 'itell_policy', 'itell_start', 'can_search', 'hide_age')
        ));
        if (empty($result)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        //var_dump($result);
        $profile = new UserProfile();
        $user_profile = $profile->find('first', array(
            'conditions' => array(
                'user_id' => $friend_id,
                'status' => 1
            ),
            'fields' => array('name', 'birth', 'desc', 'badge_good', 'badge_normal', 'badge_bad')                 
        ));
        if (empty($user_profile)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        if ($result['User']['avatar']) {
            $result['User']['avatar'] = $this->getLinkImage($result['User']['avatar']);
        }
        //var_dump($user_profile);
        $result['User']['name'] = $user_profile['UserProfile']['name'];
        $result['User']['birth'] = $user_profile['UserProfile']['birth'];
        $result['User']['desc'] = $user_profile['UserProfile']['desc'];
        $result['User']['badge_good'] = $user_profile['UserProfile']['badge_good'];
        $result['User']['badge_normal'] = $user_profile['UserProfile']['badge_normal'];
        $result['User']['badge_bad'] = $user_profile['UserProfile']['badge_bad'];
        
        //restrict pub
        $rest = new UserFriend();
        $result['User']['restrict_pub'] = $rest->checkRestrictPub($user_id, $friend_id);
        //block
        $block = new UserBlock();
        $result['User']['block'] = $block->checkBlock($user_id, $friend_id);
        
        //check if friend
        $befriend = $rest->checkFriend($user_id, $friend_id);
        $result['User']['befriend'] = (boolean)$befriend;
        if (!$befriend) {
            $friend_invite = new UserFriendInvite();
            $check_invite = $friend_invite->getInviteOne($friend_id, $user_id);
            if (!empty($check_invite)) {
                $result['User']['invite'] = true;
                $result['User']['invite_id'] = $check_invite['UserFriendInvite']['id'];
            } else {
                $result['User']['invite'] = false;
            }
        }
        
        return $result;
    }
    
    /**
     * get User List
     * @param array $user_ids 
     */
    public function getUserList($user_ids) {
        $datas = $this->find('all', array(
            'conditions' => array(
                'id' => $user_ids,
                'status' => 1
            ),
            'fields' => array('id', 'nick', 'avatar')
        ));
        //var_dump($datas);
        if (empty($datas)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user from list-> '.$user_ids, LOG_DEBUG);
            return null;
        }
        $result = Array();
        foreach ($datas as $user) {
            $result[$user['User']['id']]['id'] = $user['User']['id'];
            $result[$user['User']['id']]['nick'] = $user['User']['nick'];
            $result[$user['User']['id']]['avatar'] = $user['User']['avatar'];
        }
        //var_dump($result);
        return $result;
        
    }
    
    /**
     * set allow search
     * @param int $user_id 
     */
    public function setAllowSearch($user_id) {
        $this->id = $user_id;
        $data['can_search'] = 1;
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * set deny search
     * @param int $user_id 
     */
    public function setDenySearch($user_id) {
        $this->id = $user_id;
        $data['can_search'] = 0;
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * insert avatar
     * @param array $user
     * @param string $path 
     */
    public function insertAvatar($user_id, $path, $icon) {
        $this->id = $user_id;
        
        $data = array();
        $data['avatar'] = $path;
        $data['icon'] = $icon;
        
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * delete avatar
     * @param array $user
     */
    public function deleteAvatar($user_id) {
        $this->id = $user_id;
        
        $data = array();
        $data['avatar'] = '';
        $data['icon'] = '';
        
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * get list params for pager 
     */
    public function getListParams() {
        $params = array();
        $params['fields'] = array('User.*');
        $params['limit'] = ADM_USER_PER_PAGE;
        $params['order'] = array('User.created' => 'DESC');
        
        $params['conditions'] = array('mobile_num > ' => '');
        
        return $params;
        
        
    }
    
    /**
     * get user by id
     * @param type $user_id 
     */
    public function getUserById($user_id) {
        $result = $this->find('first', array(
            'conditions' => array('id' => $user_id)
        ));
        
        if ($result['User']['avatar']) {
            $result['User']['avatar'] = $this->getLinkImage($result['User']['avatar']);
        }
        
        return $result;
    }
    
    /**
     * change status
     * @param type $user_id 
     */
    public function changeStatus($user_id) {
        $user = $this->find('first', array(
            'conditions' => array('id' => $user_id)
        ));
        //var_dump($user);
        
        $this->id = $user_id;
        $data['status'] = !$user['User']['status'];
        $result = $this->save($data);
        
        $user['User']['status'] = !$user['User']['status'];
        if ($user['User']['avatar']) {
            $user['User']['avatar'] = $this->getLinkImage($user['User']['avatar']);
        }
        return $user;
        
    }
    
    /**
     * get link from image
     * @param type $image 
     */
    private function getLinkImage($image) {
        if (!empty($image)) {
            $image = str_replace('__', '/', $image);
            $image = 'http://' . $_SERVER['HTTP_HOST'] . PATH_ITELL .'/img/uploads/'. $image;
        }
        return $image;
    }
}

