<?php

/**
 * UserBadge model
 *  
 */
class UserBadge extends AppModel {
    
    /**
     * insert badge
     * @param int $user_id
     * @param int $friend_id
     * @param int $badge 
     */
    public function insertBadge($user_id, $friend_id, $badge) {
        $this->create();
        
        $data['user_id'] = $user_id;
        $data['friend_id'] = $friend_id;
        $data['badge'] = $badge;
        
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * update badge
     * @param int $user_id
     * @param int $friend_id
     * @param int $badge 
     */
    public function updateBadge($user_badge, $badge) {
        $this->id = $user_badge['UserBadge']['id'];
        
        $data['badge'] = $badge;
        $result = $this->save($data);
        return $result;
        
    }
}
