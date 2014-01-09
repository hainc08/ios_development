<?php

/**
 * UserProfile model
 *  
 */
class UserProfile extends AppModel {
    
    /**
     * insert new user
     * @param int user_id
     * @param int isp
     * @param Array $user_data 
     */
    public function insertUser($user_id, $isp, $user_data) {
        $this->create();
        
        $data['user_id'] = $user_id;
        $data['isp'] = $isp;
        $data['name'] = $user_data->name;
        $data['birth'] = $user_data->birth;
        $data['status'] = 1;
        
        $result = $this->save($data);
        if ($result) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' create profile for user->'. $user_id, LOG_DEBUG);
        }
    }
    
    /**
     * update user info
     * @param int $user_id
     * @param Object $update_info 
     */
    public function updateUserInfo($user_id, $update_info) {
        $user = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'status' => 1
            )
        ));
        if (empty($user)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        $update = Array();
        if (!empty($update_info->name)) {
            $update['UserProfile']['name'] = $update_info->name;
        }        
        if (!empty($update_info->birth)) {
            $update['UserProfile']['birth'] = $update_info->birth;
        }        
        if (!empty($update_info->desc)
                && (mb_strlen($update_info->desc, 'utf-8') <=200)) {
            $update['UserProfile']['desc'] = $update_info->desc;
        }
        
        if (empty($update)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' no data update user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        $this->id = $user['UserProfile']['id'];
        $result = $this->save($update);
        return $result;
        
    }
    
    /**
     * add badge
     * @param int $user_id
     * @param int $friend_id
     * @param int $badge 
     */
    public function addBadge($user_id, $badge) {
        
        $user_pro = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'status' => 1
            )
        ));
        
        if (empty($user_pro)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        $this->id = $user_pro['UserProfile']['id'];
        if ((int)$badge === 0) {
            $data['badge_bad'] = $user_pro['UserProfile']['badge_bad'] + 1;
        } else if ((int)$badge === 1) {
            $data['badge_normal'] = $user_pro['UserProfile']['badge_normal'] + 1;
        } else if ((int)$badge === 2) {
            $data['badge_good'] = $user_pro['UserProfile']['badge_good'] + 1;
        } else {
            $data = array();
        }
        
        //var_dump($data);
        if (empty($data)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' badge invalid user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        $result = $this->save($data);
        return $result;
        
    }
    
    /**
     * update badge
     * @param int $user_id
     * @param int $badge_old
     * @param int $badge 
     */
    public function updateBadge($user_id, $badge_old, $badge) {
        $user_pro = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'status' => 1
            )
        ));
        
        if (empty($user_pro)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        $this->id = $user_pro['UserProfile']['id'];
        switch ($badge_old) {
            case 0:
                $data['badge_bad'] = ($user_pro['UserProfile']['badge_bad'] >1 ) ? ($user_pro['UserProfile']['badge_bad'] - 1) : 0;
                break;
            case 1:
                $data['badge_normal'] = ($user_pro['UserProfile']['badge_normal'] >1 ) ? ($user_pro['UserProfile']['badge_normal'] - 1) : 0;
                break;
            case 2:
                $data['badge_good'] = ($user_pro['UserProfile']['badge_good'] >1 ) ? ($user_pro['UserProfile']['badge_good'] - 1) : 0;
                break;
            default:
                $data = array();
                break;
        }
        
        switch ($badge) {
            case 0:
                $data['badge_bad'] = $user_pro['UserProfile']['badge_bad'] + 1;
                break;
            case 1:
                $data['badge_normal'] = $user_pro['UserProfile']['badge_normal'] + 1;
                break;
            case 2:
                $data['badge_good'] = $user_pro['UserProfile']['badge_good'] + 1;
                break;
            default:
                $data = array();
                break;
        }
        
        if (empty($data)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' badge invalid user-> '.$user_id, LOG_DEBUG);
            return null;
        }
        
        $result = $this->save($data);
        return $result;
        
    }
    
    
    
}
