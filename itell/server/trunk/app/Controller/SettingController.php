<?php

/**
 * APIs for setting
 * allow_search
 * deny_search
 * get_block_list
 * post_contact
 * @return JSON Object
 */
App::import('Vendor', 'UploadImage');
App::import('Vendor', 'ItellValidator');
App::import('Vendor', 'ToolKit');

class SettingController extends AppController {

    public $name = 'Setting';
    public $uses = array('User', 'UserProfile', 'UserContact', 'UserFriendInvite', 'UserFriend', 'UserBlock', 'UserPicture');
    public $components = array('ItellAuth', 'Session', 'RequestHandler');
    var $autoRender = false;

    public function beforeFilter() {
        parent::beforeFilter();
        //var_dump($this->action);
        $user_id = $this->user['id'];

        if ($this->action == 'upload_img'
                || $this->action == 'upload_avatar'
        ) {
            if (empty($this->request->data['image'])) {
                $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found image upload user_id->' . $user_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 1,
                    "error_msg" => "not found image upload",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit();
            }

            $stringimg = base64_decode($this->request->data['image']);
            $this->upload = ItellValidator::checkRequireUploadFile($stringimg);

            if (empty($this->upload)) {
                $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found image upload user_id->' . $user_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 3,
                    "error_msg" => "not found image",
                    "timestamp" => time()
                );
                echo json_encode($result);
                exit;
            }

            /*
              if (! ItellValidator::checkUploadFileSize($this->request->data['image'])) {
              $this->log(__CLASS__.'::'.__FUNCTION__.' image too big user_id->'.$user_id, LOG_ERR);
              $result = Array(
              "retval" => false,
              "error_code" => 4,
              "error_msg" => "image too big",
              "timestamp" => time()
              );
              echo json_encode($result);
              exit;
              }
             */

            $this->upload_type = ItellValidator::checkUploadFileType($stringimg, itellValidator::getUploadImageType());
            if (empty($this->upload_type)) {
                $this->log(__CLASS__ . '::' . __FUNCTION__ . ' image type invalid user_id->' . $user_id, LOG_ERR);
                $result = Array(
                    "retval" => false,
                    "error_code" => 5,
                    "error_msg" => "image type invalid",
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
     * allow search
     * @param int user_id
     * @param string uuid 
     */
    public function allow_search() {

        $user_id = $this->user['id'];
        $uuid = $this->user['uuid'];

        $allowsearch = $this->User->setAllowSearch($user_id);

        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * deny search
     * @param int user_id
     * @param string uuid 
     */
    public function deny_search() {

        $user_id = $this->user['id'];
        $uuid = $this->user['uuid'];

        $search = $this->User->setDenySearch($user_id);

        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * get block list
     * @param int user_id
     * @param string uuid 
     */
    public function get_block_list() {

        $user_id = $this->user['id'];
        $uuid = $this->user['uuid'];

        $block_list = $this->UserBlock->getBlockList($user_id);

        if (empty($block_list)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found block list user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "not found block list",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success get block list user_id->' . $user_id, LOG_DEBUG);
        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "block_list" => $block_list,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * upload image
     * @param user_id int
     * @param uuid string
     * @param image file 
     */
    public function upload_img() {

        $user_id = $this->user['id'];
        $uuid = $this->user['uuid'];

        //check user's picture reach limit 3 imgs

        $count = $this->UserPicture->find('count', array(
            'conditions' => array(
                'user_id' => $user_id,
                'status' => 1,
                'avatar' => 0
            )
                ));

        //var_dump($count); //return;

        if ($count >= IMG_USER_LIMIT) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' excess count image user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "excess count image",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        //echo 'type '.$this->upload_type;

        $images = UploadImage::saveUploadImage($this->upload, $this->upload_type, 'users');

        if (count($images) == 0) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' save image error user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 6,
                "error_msg" => "save image error",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        //var_dump($images);     return;

        $insert = $this->UserPicture->insertPicture($user_id, $images);

        if (empty($insert)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' save image error user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 7,
                "error_msg" => "save image error",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success upload image user_id->' . $user_id, LOG_DEBUG);
        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "image_id" => $insert['UserPicture']['id'],
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * upload image
     * @param user_id int
     * @param uuid string
     * @param int image_id 
     */
    public function delete_img() {

        if (empty($this->request->data['image_id'])
        ) {
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

        $user_id = $this->user['id'];
        $uuid = $this->user['uuid'];
        $image_id = $this->request->data['image_id'];

        $image = $this->UserPicture->find('first', array(
            'conditions' => array(
                'id' => $image_id,
                'user_id' => $user_id,
                'status' => 1
            )
                ));
        if (empty($image)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found image user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "not found image",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $remove = UploadImage::removeUploadImage($image['UserPicture']['path']);
        if (!$remove) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' delete image fail user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 4,
                "error_msg" => "delete image fail",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $result = $this->UserPicture->deletePicture($image_id);

        $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success delete image user_id->' . $user_id, LOG_DEBUG);
        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "image_id" => $image_id,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * get user's album
     * @param user_id int
     * @param uuid string
     */
    public function get_album() {

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
                    
        $user_id = $this->user['id'];
        $uuid = $this->user['uuid'];
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

        $album = $this->UserPicture->getAlbum($friend_id);

        if (empty($album)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found album user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 4,
                "error_msg" => "not found album",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }
        //var_dump($album);

        $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success get album user_id->' . $user_id, LOG_DEBUG);
        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "album" => $album,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * upload avatar
     * @param user_id int
     * @param uuid string
     * @param image file 
     */
    public function upload_avatar() {

        $user_id = $this->user['id'];
        $uuid = $this->user['uuid'];

        $images = UploadImage::saveUploadImage($this->upload, $this->upload_type, 'users');
        //echo $images;
        if (count($images) == 0) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' save image error user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 6,
                "error_msg" => "save image error",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        //var_dump($images); 

        $insert = $this->UserPicture->insertAvatar($user_id, $images);
        if (empty($insert)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' save image error user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 7,
                "error_msg" => "save image error",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $icon = pathinfo(str_replace('__', '/', $images), PATHINFO_FILENAME) . "_thumb." . pathinfo(str_replace('__', '/', $images), PATHINFO_EXTENSION);
        $avatar = $this->User->insertAvatar($user_id, $insert['UserPicture']['path'], $icon);

        $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success upload avatar user_id->' . $user_id, LOG_DEBUG);
        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "image_id" => $insert['UserPicture']['id'],
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    /**
     * delete avatar
     * @param user_id int
     * @param uuid string
     * @return JSONObject
     */
    public function delete_avatar() {

        $user_id = $this->user['id'];
        $uuid = $this->user['uuid'];

        $image = $this->UserPicture->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'avatar' => 1,
                'status' => 1
            )
                ));
        if (empty($image)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' not found image user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 3,
                "error_msg" => "not found image",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $remove = UploadImage::removeUploadImage($image['UserPicture']['path']);
        if (!$remove) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' delete image fail user_id->' . $user_id, LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 4,
                "error_msg" => "delete image fail",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }

        $result = $this->UserPicture->deletePicture($image['UserPicture']['id']);
        $user_remove = $this->User->deleteAvatar($user_id);

        $this->log(__CLASS__ . '::' . __FUNCTION__ . ' success delete avatar user_id->' . $user_id, LOG_DEBUG);
        $result = Array(
            "retval" => true,
            "user_id" => $user_id,
            "timestamp" => time()
        );
        echo json_encode($result);
    }

    public function post_contact() {


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
        ) {
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
        $names = json_decode($this->request->data['names']);
        $phones = json_decode($this->request->data['phones']);
        $emails = json_decode($this->request->data['emails']);

        if (!is_array($names) || !is_array($phones) || !is_array($emails) ||
                count($phones) != count($names) || count($phones) != count($emails)) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' req params invalid', LOG_ERR);
            $result = Array(
                "retval" => false,
                "error_code" => 2,
                "error_msg" => "req params invalid",
                "timestamp" => time()
            );
            echo json_encode($result);
            exit;
        }
        $data = array(
            'user_id' => $user_id,
            'parse' => 0
        );
        $count = 0;
        for ($i = 0, $len = count($phones); $i < $len; $i++) {
            $data['mobile_num'] = trim($phones[$i]);
            $data['email'] = trim($emails[$i]);
            if (empty($data['mobile_num']) == false) {
                $this->UserContact->create();
                $data['name'] = $names[$i];
                $this->UserContact->save($data);
                $count++;
            }
        }
        $result = array(
            'user_id' => $user_id,
            'count' => $count,
            'retval' => true,
            'time_stamp' => time(),
        );
        echo json_encode($result);
        exit;
    }

}
