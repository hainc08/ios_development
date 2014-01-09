<?php

App::import('model', 'User');
/**
 * UserFriendInvite model
 *  
 */
class UserFriendInvite extends AppModel {
    
    /**
     * insert invite
     * @param type $user_id
     * @param type $friend_id
     * @return type 
     */
    public function insertInvite($user_id, $friend_id) {
        $invite = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id,
                'status' => 1
            )
        ));
        
        if (empty($invite)) {
            $this->create();

            $data['user_id'] = $user_id;
            $data['friend_id'] = $friend_id;
            $data['status'] = 1;

            $result = $this->save($data);
            return $result;
        } else {
            $this->id = $invite['UserFriendInvite']['id'];
            
            $data['user_id'] = $user_id;
            $data['friend_id'] = $friend_id;
            $data['status'] = 1;
            
            $result = $this->save($data);
            return $result;
            
        }
    }
    
    /**
     * find invites
     * @param type $user_id
     * @return 
     */
    public function getListInvite($user_id) {
        $data = $this->find('all', array(
            'conditions' => array(
                'friend_id' => $user_id,
                'status > ' => 0
            )
        ));
        
        if (empty($data)) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found invite for user_id->'.$user_id, LOG_DEBUG);
            return null;
        }
        
        $friend_ids = Array();
        foreach ($data as $invite) {
            $friend_ids[] = $invite['UserFriendInvite']['user_id'];
        }
        //var_dump($friend_ids);
        $user = new User();
        $friend_datas = $user->getUserList($friend_ids);
        
        $result = Array();
        $count = 0;
        foreach ($data as $invite) {
            if (!empty($friend_datas[$invite['UserFriendInvite']['user_id']])) {
                $result[$count]['invite_id'] = $invite['UserFriendInvite']['id'];
                $result[$count]['invite_time'] = $invite['UserFriendInvite']['created'];
                $result[$count]['friend_id'] = $invite['UserFriendInvite']['user_id'];
                $result[$count]['friend_nick'] = $friend_datas[$invite['UserFriendInvite']['user_id']]['nick'];
                $result[$count]['friend_avatar'] = $friend_datas[$invite['UserFriendInvite']['user_id']]['avatar'];
                $count ++;
            }
        }
        //var_dump($result);
        return $result;
        
    }
    
    /**
     * delete invitation
     * @param int $invite_id 
     */
    public function deleteInvite($invite_id) {
        $this->id = $invite_id;
        $data['status'] = 0;
        $result = $this->save($data);
        return $result;
        
    }
    
    /**
     * get invite
     * @param int $user_id
     * @param int $friend_id 
     */
    public function getInviteOne($user_id, $friend_id) {
        $result = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'friend_id' => $friend_id
            )
        ));
        return $result;
    }
}
