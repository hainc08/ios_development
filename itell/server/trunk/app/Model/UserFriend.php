<?php

/**
 * UserFriend model
 *  
 */
class UserFriend extends AppModel {
    
    /**
     * check friend relationship
     * @param int $user_id
     * @param int $friend_id 
     */
    public function checkFriend($user_id, $friend_id) {
        $result = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id,
                'status' => 1
            )
        ));
        return $result;
    }
    
    /**
     * add friend
     * @param type $user_id
     * @param type $friend_id 
     */
    public function addFriend($user_id, $friend_id) {
        //create 2 record
        $this->create();
        $data['user_id'] = $user_id;
        $data['friend_id'] = $friend_id;
        $data['restrict_pub'] = 0;
        $data['block'] = 0;
        $data['status'] = 1;
        $result = $this->save($data);
        
        $this->create();
        $data['user_id'] = $friend_id;
        $data['friend_id'] = $user_id;
        $data['restrict_pub'] = 0;
        $data['block'] = 0;
        $data['status'] = 1;
        $result = $this->save($data);
        
        return $result;
    }
    
    /**
     * delete friend relationship
     * @param int $user_id
     * @param int $friend_id 
     */
    public function deleteFriend($user_id, $friend_id) {
        $relation1 = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id
            )
        ));
        $relation2 = $this->find('first', array(
            'conditions' => array(
                'user_id' => $friend_id,
                'friend_id' => $user_id
            )
        ));
        if (empty($relation1)
                || empty($relation2)) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
            return null;
        }
        
        $this->id = $relation1['UserFriend']['id'];
        $data['status'] = 0;
        $result = $this->save($data);
        
        $this->id = $relation2['UserFriend']['id'];        
        $result = $this->save($data);
        
        return $result;
        
    }
    
    /**
     * restrict public
     * @param int $user_id
     * @param int $friend_id 
     */
    public function restrictPub($user_id, $friend_id) {
        $relation = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id,
                'status' => 1
            )
        ));
        if (empty($relation)) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
            return null;
        }
        //var_dump($relation);
        $this->id = $relation['UserFriend']['id'];
        $data['restrict_pub'] = 1;
        $result = $this->save($data);
        return $result;
        
    }
    
    /**
     * check restrict public
     * @param int $user_id
     * @param int $friend_id 
     * @return boolean
     */
    public function checkRestrictPub($user_id, $friend_id) {
        $relation = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id,
            )
        ));
        
        //var_dump($relation);
        if (empty($relation)) {
            return false;
        }
        if ($relation['UserFriend']['restrict_pub']) {
            return true;
        }
        return false;
    }
    
    /**
     * allow public
     * @param int $user_id
     * @param int $friend_id 
     */
    public function allowPub($user_id, $friend_id) {
        $relation = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id,
                'status' => 1
            )
        ));
        if (empty($relation)) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
            return null;
        }
        
        $this->id = $relation['UserFriend']['id'];
        $data['restrict_pub'] = 0;
        $result = $this->save($data);
        return $result;
        
    }
    
    /**
     * block
     * @param int $user_id
     * @param int $friend_id 
     */
    public function blockFriend($user_id, $friend_id) {
        $relation = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id,
                'status' => 1
            )
        ));
        if (empty($relation)) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
            return null;
        }
        
        $this->id = $relation['UserFriend']['id'];
        $data['block'] = 1;
        $result = $this->save($data);
        return $result;
        
    }
    
    /**
     * unblock
     * @param int $user_id
     * @param int $friend_id 
     */
    public function unblockFriend($user_id, $friend_id) {
        $relation = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id,
                'status' => 1
            )
        ));
        if (empty($relation)) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
            return null;
        }
        
        $this->id = $relation['UserFriend']['id'];
        $data['block'] = 0;
        $result = $this->save($data);
        return $result;
        
    }
    
    /**
     * get list friend
     * @param int $user_id 
     */
    public function getListFriend($user_id) {
        
    }
}
