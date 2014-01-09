<?php

/**
 * AuthenCodeLog model
 *  
 */
class AuthenCodeLog extends AppModel {
    
    /**
     * insert authen code 
     * @param string $mobile_num
     * @param string $authen_code 
     */
    public function insertCode($mobile_num, $authen_code, $isp) {
        $this->create();
        $data['mobile_num'] = $mobile_num;
        $data['authen_code'] = $authen_code;
        $data['isp'] = $isp;
        $result = $this->save($data);
        if ($result) {
            $this->log(__CLASS__ . '::' . __FUNCTION__ . ' save authen_code=> '. $authen_code. ' from mobile_num'. $mobile_num, LOG_DEBUG);
        }
    }
    
    /**
     * get code
     * @param type $mobile_num
     * @param type $authen_code
     * @param type $isp 
     */
    public function getCode($mobile_num, $authen_code, $isp) {
        $result = $this->find('all', array(
            'conditions' => array(
                    'mobile_num' => $mobile_num,
                    'authen_code' => $authen_code,
                    'isp' => $isp
                )
        ));
        return $result;
    }
    
    /**
     * check if code is duplicated
     * @param string $code 
     */
    public function duplicateCode($code) {
        $find = $this->find('first', array(
            'conditions' => array('authen_code' => $code,
                                    'isp' => 4
                )
        ));
        
        return $find;
    }
    
    
}
