<?php

/*
 * Socket component
 */
App::import('Vendor', 'Predis/Autoloader');
Predis\Autoloader::register();

class SocketComponent extends Component {
    
    /**
     * constructor 
     */
    public function __construct() {
        try {
            $this->redis = new Predis\Client(array(
                        'host' => '127.0.0.1',
                        'port' => '6379',
                        'password' => 'itell@2012!'
                    ));
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success connection Redis', LOG_DEBUG);
        } catch (Exception $e) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' error connection Redis' . $e->getMessage(), LOG_ERR);
        }
    }
    
    /**
     * publishInvite
     * @param string $user_id
     * @param string $friend_id
     * @param string $timestamp 
     */
    public function publishInvite($user_id, $friend_id, $timestamp) {
        $data = Array(
            'type' => 'invite',
            'receiver' => $friend_id,
            'count' => 1,
            'user_id' => $user_id,
            'friend_id' => $friend_id,
            'timestamp' => $timestamp
        );
        $message = json_encode($data);
        $this->redis->publish('notification', $message);
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
