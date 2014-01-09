<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of giftValidation
 *
 * @author HoaManLau
 */
class ItellValidator
{
    const IMG_LIMIT_SIZE = 2048000;
    
    public static function getUploadImageType(){
        return array('gif', 'jpg', 'jpeg', 'bmp', 'png', 'svg');
    }
    
    /**
     * Kiểm tra xem nếu file được upload. 
     * Nếu upload một mảng thì chỉ cần một trường hợp thành công cũng trả về true.
     * @param string $name. Tên trường file được upload
     * @return Boon 
     */
    public static function checkRequireUploadFile($name){
        if (is_array($_FILES[$name]['name'])) {
            foreach($_FILES[$name]['name'] as $key => $fileName) {
                if($fileName != null && $_FILES[$name]['error'][$key] == 0){
                    return true;
                }
            }
            return false;
        }
        else if($_FILES[$name]['name'] != null && $_FILES[$name]['error'] == 0) {
            return true;
        }
        return false;
    }
    
    /**
     * check upload file size is < 2MB
     * @param string $name
     * @return boolean 
     */
    public static function checkUploadFileSize($name){
        if($_FILES[$name]['size'] > self::IMG_LIMIT_SIZE){
            return false;
        }
        return true;
    }

    /**
     * Kiểm tra nếu có file upload lên được thì extension của nó có thỏa mãn ko.
     * Với các file không upload thì ko có name bỏ qua không kiểm tra
     * @param string $name. Tên trường file được upload
     * @param array $types
     * @return type 
     */
    public static function checkUploadFileType($name, $types)
    {
        if (is_array($types) == false) {
            $types = array($types);
        }
        if (is_array($_FILES[$name]['name'])) {
            foreach($_FILES[$name]['name'] as $fileName) {
                if($fileName != null && self::checkFileType($fileName, $types) == false){
                    return false;
                }
            }
            return true;
        }
        else if($_FILES[$name]['name']){
            return self::checkFileType($_FILES[$name]['name'], $types);
        }
    }

    public static function checkFileType($name, $types)
    {
        $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION));
        if (in_array($ext, $types)) {
            return true;
        }
        return false;
    }

}

?>
