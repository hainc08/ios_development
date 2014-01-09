<?php

/**
 * UserPicture model
 *  
 */
class UserPicture extends AppModel {
    
    /**
     * insert user picture
     * @param int $user_id
     * @param string $path 
     */
    public function insertPicture($user_id, $path) {
        $this->create();
        
        $data = array();
        $data['user_id'] = $user_id;
        $data['path'] = $path;
        $data['avatar'] = 0;
        $data['status'] = 1;
        
        $result = $this->save($data);
        return $result;
        
    }
    
    /**
     * delete image
     * @param int $image_id 
     */
    public function deletePicture($image_id) {
        $this->id = $image_id;
        $data = array();
        $data['status'] = 0;
        $result = $this->save($data);
        return $result;
        
    }
    
    /**
     * inseart avatar
     * @param type $user_id
     * @param type $path 
     */
    public function insertAvatar($user_id, $path) {
        $user_picture = $this->find('first', array(
            'conditions' => array(
                'user_id' => $user_id,
                'avatar' => 1,
                'status' => 1
            )
        ));
        
        //var_dump($user_picture);
        
        if (!empty($user_picture)) {
            $this->id = $user_picture['UserPicture']['id'];
            
            $data = array();
            $data['id'] = $user_picture['UserPicture']['id'];
            $data['path'] = $path;
            $data['avatar'] = 1;
            
            $result = $this->save($data);
            return $result;
        } else {
            $this->create();
            $data = array();
            $data['user_id'] = $user_id;
            $data['path'] = $path;
            $data['avatar'] = 1;
            $data['status'] = 1;

            $result = $this->save($data);
            return $result;
        }
    }
    
    /**
     * get album
     * @param int $user_id 
     */
    public function getAlbum($user_id) {
        $album = $this->find('all', array(
            'conditions' => array(
                'user_id' => $user_id,
                'avatar' => 0,
                'status' => 1
            )
        ));
        
        if (empty($album)) {
            return false;
        }
        
        $result = array();
        $count = 0;
        foreach ($album as $picture) {
            $result[$count] = array();
            $result[$count]['id'] = $picture['UserPicture']['id'];
            $result[$count]['url'] = $this->getLinkImage($picture['UserPicture']['path']);
            $count++;
        }
        
        return $result;
        
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
