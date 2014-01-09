<?php
/**
 * Description of Company
 *
 * @author TuanNguyen
 */
class Company extends AppModel {
    const STATUS_ENABLE = 1;
    const STATUS_DISABLE = 0;
    
    /**
     * create new company
     * @param Object $company_info 
     */
    public function insertCompany($company_info) {
        $this->create();
        $company_info['status'] = 1;  
        
        $result = $this->save($company_info);
        return $result;
    }
    
    /**
     * modify company
     * @param Object $company_info 
     */
    public function saveCompany($company_info) {
        $this->id = $company_info['id'];
        
        $result = $this->save($company_info);
        return $result;
    }
    
    /**
     * change status
     * @param type $id
     */
    public function changeStatus($id) {
        $comp = $this->find('first', array(
            'conditions' => array('id' => $id)
        ));
        //var_dump($user);
        
        $this->id = $id;
        $data['status'] = !$comp['Company']['status'];
        $result = $this->save($data);
        
        $comp['Company']['status'] = !$comp['Company']['status'];
        if ($comp['Company']['avatar']) {
            $comp['Company']['avatar'] = $this->getLinkImage($comp['Company']['avatar']);
        }
        return $comp;
        
    }
    
    /**
     * get list params for pager 
     */
    public function getListParams() {
        $params = array();
        $params['fields'] = array('Company.*');
        $params['limit'] = ADM_COMPANY_PER_PAGE;
        $params['order'] = array('Company.created' => 'DESC');
        
        //$params['conditions'] = array('mobile_num > ' => '');
        
        return $params;
    }
    
    /**
     * get company info
     * @param type $id 
     */
    public function getCompanyInfo($id) {
        $result = $this->find('first',array(
            'conditions' => array('id' => $id)
        ));
        
        if ($result['Company']['avatar']) {
            $result['Company']['avatar'] = $this->getLinkImage($result['Company']['avatar']);
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

?>
