<?php

/**
 * ItellLog model
 *  
 */
class ItellLog extends AppModel {
    
    
    /**
     * insert Itell Log
     * @param int $user_id
     * @param string $itell
     * @param int $itell_policy
     * @param timestamp $start_time 
     */
    public function insertItell($user_id, $itell, $itell_policy, $start_time) {
        $this->create();
        
        $data['user_id'] = $user_id;
        $data['itell'] = $itell;
        $data['policy'] = $itell_policy;
        $data['start_time'] = date('Y-m-d H:i:s',strtotime($start_time)); 
        
        $result = $this->save($data);
        return $result;
    }
}
