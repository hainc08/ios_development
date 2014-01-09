<?php

App::import('model', 'User');
/**
 * UserBlock model
 *  
 */
class UserBlock extends AppModel {
    
    /**
     * insert block
     * @param int $user_id
     * @param int $block_id 
     */
    public function  insertBlock($user_id, $block_id) {
        $this->create();
        
        $data['user_id'] = $user_id;
        $data['block_id'] = $block_id;
        $data['status'] = 1;
        
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * check block
     * @param int $user_id
     * @param int $block_id 
     * @return boolean
     */
    public function  checkBlock($user_id, $block_id) {
        $relation = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'block_id' => $block_id,
            )
        ));
        //var_dump($relation);
        if (empty($relation)) {
            return false;
        }
        if ($relation['UserBlock']['status']) {
            return true;
        }
        return false;
    }
    
    /**
     * set block
     * @param array $user_block 
     */
    public function  setBlock($user_block) {
        $this->id = $user_block['UserBlock']['id'];
        
        $data['status'] = 1;
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * unblock
     * @param array $user_block 
     */
    public function  unBlock($user_block) {
        $this->id = $user_block['UserBlock']['id'];
        
        $data['status'] = 0;
        $result = $this->save($data);
        return $result;
    }
    
    /**
     * get block list
     * @param int $user_id 
     */
    public function getBlockList($user_id) {
        $lists = $this->find('all', array(
            'conditions' => array(
                'user_id' => $user_id,
                'status' => 1
            )
        ));
        
        if (empty($lists)) {
            $this->log(__CLASS__.'::'.__FUNCTION__.' not found block list user_id->'.$user_id, LOG_ERR);
            return null;
        }
        
        $friend_ids = array();
        foreach ($lists as $block) {
            $friend_ids[] = $block['UserBlock']['block_id'];
        }
        
        //var_dump($friend_ids);
        
        $user = new User();
        $result = $user->getUserList($friend_ids);
        return $result;
        
    }
}
