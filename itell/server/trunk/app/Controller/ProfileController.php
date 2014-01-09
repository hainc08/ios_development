<?php
/**
 * APIs for profile
 * get_profile
 * invite_friend
 * delete_friend
 * restrict_public
 * allow_public
 * block_acct
 * non_block_acct
 * @return JSON Object
 */
class ProfileController extends AppController {

	public $name = 'Profile';
        public $components = array('ItellAuth', 'Socket');
	public $uses = array('User', 'UserProfile', 'UserFriendInvite', 'UserFriend', 'UserBlock', 'UserBadge');
        var    $autoRender = false;

        public function beforeFilter() {
            parent::beforeFilter();
            //var_dump($this->action);
            
            if (empty($_REQUEST['friend_id'])) {
                        $this->log(__CLASS__.'::'.__FUNCTION__.' not found friend_id', LOG_ERR);
                        $result = Array(
                            "retval" => false,
                            "error_code" => 1,
                            "error_msg" => "not found friend_id",
                            "timestamp" => time()
                        );
                        echo json_encode($result);
                        exit;
                    }
            
            $friend_id = $_REQUEST['friend_id'];
                    
            $friend = $this->User->find('first', array(
                'conditions' => array(
                    'id' => $friend_id,                   
                    )
            ));
            
            if (empty($friend)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not found friend_id->'.$friend_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 4,
                    "error_msg" => "not found friend",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $this->friend = $friend;
                    
            if ($this->action == 'send_invite'
                    || $this->action == 'delete_friend'
                    || $this->action == 'restrict_pub'
                    || $this->action == 'allow_pub'
                    || $this->action == 'block'
                    || $this->action == 'unblock'
                    || $this->action == 'post_badge'
                    ) {
                    
                    $user_id = $this->request->data['user_id'];
                    $uuid = $this->request->data['uuid'];
                    $friend_id = $this->request->data['friend_id'];

                    if ($user_id == $friend_id) {
                        $this->log(__CLASS__.'::'.__FUNCTION__.' could not do with himself user_id->'.$user_id, LOG_ERR);
                        $result = Array(
                            "retval" => false,
                            "error_code" => 2,
                            "error_msg" => "invite invalid",
                            "timestamp" => time()
                        );
                        echo json_encode($result);
                        exit;

                    }
            }
            
            if ($this->action == 'delete_friend'
                    || $this->action == 'restrict_pub'
                    || $this->action == 'allow_pub'
                    ) {
                $relation = $this->UserFriend->checkFriend($user_id, $friend_id);
                if (empty($relation)) {
                    $this->log(__CLASS__.'::'.__FUNCTION__.' not friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
                    $result = Array(
                        "retval" => false,
                        "error_code" => 5,
                        "error_msg" => "not friend yet",
                        "timestamp" => time()
                    );
                    echo json_encode($result);
                    exit;
                }
            }
            
        }
        
        /**
         * index view
         * not show anything 
         */
	public function index() {
            $result = Array(
                "retval" => false,
                "error_code" => 0,
                "error_msg" => "restricted zone"
            );
            echo json_encode($result);
	}
        
        /**
         * get profile
         * @param int user_id 
         * @param string uuid
         * @param int friend_id 
         */
        public function get_profile() {
            
            $user_id = $this->user['id'];            
            $friend_id = $_REQUEST['friend_id'];
            
            $profile = $this->User->getProfileFriend($user_id, $friend_id);
            
            if (empty($profile)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not found user', LOG_DEBUG);
                $result = Array(
                    "retval" => false,
                    "error_code" => 2,
                    "error_msg" => "not found user",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $this->log(__CLASS__.'::'.__FUNCTION__.' get profile friend_id->'.$friend_id, LOG_DEBUG);
            $result = Array(
                "retval" => true,
                "user_data" => $profile['User'],                
                "timestamp" => time()
            );
            echo json_encode($result);
        }
        
        /**
         * send invite
         * @param int user_id
         * @param string uuid
         * @param int friend_id 
         */
        public function send_invite() {
            
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $friend_id = $this->request->data['friend_id'];
            
            $relation = $this->UserFriend->checkFriend($user_id, $friend_id);
            if (!empty($relation)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' friend already user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 5,
                    "error_msg" => "friend already",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $invite = $this->UserFriendInvite->insertInvite($user_id, $friend_id);
            if (empty($invite)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' error create invite user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 5,
                    "error_msg" => "error create invite",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $this->log(__CLASS__.'::'.__FUNCTION__.' send invite user_id->'.$user_id.' friend_id->'.$friend_id, LOG_DEBUG);
            $result = Array(
                "retval" => true,
                "invite_data" => $invite['UserFriendInvite'],                
                "timestamp" => time()
            );
            echo json_encode($result);
            
            //push notification by socket
            $pub = $this->Socket->publishInvite($user_id, $friend_id, time());
            
            
        }
        
        /**
         * delete friend
         * @param int user_id
         * @param string uuid
         * @param int friend_id 
         */
        public function delete_friend() {
            
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $friend_id = $this->request->data['friend_id'];
            
            $delete = $this->UserFriend->deleteFriend($user_id, $friend_id);
            if (empty($delete)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' error delete friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 6,
                    "error_msg" => "error delete friend",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,
                "friend_id" => $friend_id,
                "status" => 0,
                "timestamp" => time()
            );
            echo json_encode($result);
        }
        
        /**
         * retrict public
         * @param int user_id
         * @param string uuid
         * @param int friend_id 
         */
        public function restrict_pub() {
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $friend_id = $this->request->data['friend_id'];
            
            $restrict = $this->UserFriend->restrictPub($user_id, $friend_id);
            if (empty($restrict)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' error restrict friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 6,
                    "error_msg" => "error restrict public",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,
                "friend_id" => $friend_id,                
                "timestamp" => time()
            );
            echo json_encode($result);
            
        }
        
        /**
         * allow public
         * @param int user_id
         * @param string uuid
         * @param int friend_id 
         */
        public function allow_pub() {
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $friend_id = $this->request->data['friend_id'];
            
            $restrict = $this->UserFriend->allowPub($user_id, $friend_id);
            if (empty($restrict)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' error allow friend user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 6,
                    "error_msg" => "error allow public",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,
                "friend_id" => $friend_id,                
                "timestamp" => time()
            );
            echo json_encode($result);
        }
        
        /**
         * block
         * @param int user_id
         * @param string uuid
         * @param int friend_id 
         */
        public function block() {
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $friend_id = $this->request->data['friend_id'];
            
            $user_block = $this->UserBlock->find('first', array(
                'conditions' => array(
                    'user_id' => $user_id,
                    'block_id' => $friend_id
                )
            ));
            
            if (empty($user_block)) {
                $block = $this->UserBlock->insertBlock($user_id, $friend_id);
            } else {
                $block = $this->UserBlock->setBlock($user_block);
            }
            
            $this->log(__CLASS__.'::'.__FUNCTION__.' success block user_id->'.$user_id.' friend_id->'.$friend_id, LOG_DEBUG);
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,
                "friend_id" => $friend_id,                
                "timestamp" => time()
            );
            echo json_encode($result);
        }
        
        /**
         * unblock
         * @param int user_id
         * @param string uuid
         * @param int friend_id 
         */
        public function unblock() {
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $friend_id = $this->request->data['friend_id'];
            
            $user_block = $this->UserBlock->find('first', array(
                'conditions' => array(
                    'user_id' => $user_id,
                    'block_id' => $friend_id
                )
            ));
            
            if (empty($user_block)) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not block yet user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 6,
                    "error_msg" => "not block yet",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            } else {
                $block = $this->UserBlock->unBlock($user_block);
            }
            
            $this->log(__CLASS__.'::'.__FUNCTION__.' success unblock user_id->'.$user_id.' friend_id->'.$friend_id, LOG_DEBUG);
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,
                "friend_id" => $friend_id,                
                "timestamp" => time()
            );
            echo json_encode($result);
        }
        
        /**
         * post badge 
         * @param int user_id
         * @param string uuid
         * @param int friend_id 
         */
        public function post_badge() {
            $user_id = $this->request->data['user_id'];
            $uuid = $this->request->data['uuid'];
            $friend_id = $this->request->data['friend_id'];
            
            if (empty($this->request->data['badge'])
                    || ($this->request->data['badge']<0)
                    || ($this->request->data['badge']>2)
                    ) {
                $this->log(__CLASS__.'::'.__FUNCTION__.' not badge found user_id->'.$user_id.' friend_id->'.$friend_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 6,
                    "error_msg" => "not badge found",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }
            
            $badge = $this->request->data['badge'];
            
            $user_badge = $this->UserBadge->find('first', array(
                    'conditions' => array(
                        'user_id' => $user_id,
                        'friend_id' => $friend_id
                    )
                ));
            
            //var_dump($user_badge, $badge);
            
            if (empty($user_badge)) {
                //badge not exists yet
                try {
                    $this->UserProfile->begin();
                    $this->UserBadge->insertBadge($user_id, $friend_id, $badge);
                    $add = $this->UserProfile->addBadge($friend_id, $badge);
                    $this->UserProfile->commit();
                } catch (Exception $e) {
                    $this->UserProfile->rollback();
                    $this->log(__CLASS__.'::'.__FUNCTION__.' error post badge error->'.$e->getMessage(), LOG_ERR);
                    $result = Array(
                        "retval" => false,
                        "error_code" => 7,
                        "error_msg" => "error post badge",
                        "timestamp" => time()
                    );
                    echo json_encode($result);
                    exit;
                    
                }
            } else {
                //badge existed
                $badge_old = $user_badge['UserBadge']['badge'];
                if ($badge != $badge_old) {
                    try {
                        $this->UserProfile->begin();
                        $this->UserBadge->updateBadge($user_badge, $badge);
                        $this->UserProfile->updateBadge($friend_id, $badge_old, $badge);
                        $this->UserProfile->commit();
                    } catch (Exception $e) {
                        $this->UserProfile->rollback();
                        $this->log(__CLASS__.'::'.__FUNCTION__.' error post badge error->'.$e->getMessage(), LOG_ERR);
                        $result = Array(
                            "retval" => false,
                            "error_code" => 7,
                            "error_msg" => "error post badge",
                            "timestamp" => time()
                        );
                        echo json_encode($result);
                        exit;
                    }
                } 
            }
            
            $this->log(__CLASS__.'::'.__FUNCTION__.' success post badge user_id->'.$user_id.' friend_id->'.$friend_id.' badge->'.$badge, LOG_DEBUG);
            $result = Array(
                "retval" => true,
                "user_id" => $user_id,
                "friend_id" => $friend_id,                
                "timestamp" => time()
            );
            echo json_encode($result);
            
        }
}
