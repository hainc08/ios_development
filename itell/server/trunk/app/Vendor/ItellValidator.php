<?php

App::import('Vendor',' Image');

/**
 * Description of giftValidation
 *
 * @author HoaManLau
 */
class ItellValidator
{
    const IMG_LIMIT_SIZE = 2048000;
    
    public static function getUploadImageType(){
        return array('image/jpg', 'image/jpeg', 'image/gif', 'image/png');
    }
    
    /**
     * Kiểm tra xem nếu file được upload. 
     * Nếu upload một mảng thì chỉ cần một trường hợp thành công cũng trả về true.
     * @param string $name. Tên trường file được upload
     * @return Boon 
     */
    public static function checkRequireUploadFile($string){
        
        $upload = Image::createFromString($string);
        
        if (empty($upload)) {
            return false;
        }
        
        return $upload;
        
    }
    
    /**
     * check upload file size is < 2MB
     * @param string $name
     * @return boolean 
     */
    public static function checkUploadFileSize($image){
                
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
    public static function checkUploadFileType($stringimg, $types)
    {
        //$img = new Image();
        //$mime_type = $img->getImageType($stringimg);
        $mime_type = Image::getImageType($stringimg);
        
        if (! in_array($mime_type, $types)) {
            return false;
        } 
        
        $arr = explode('/', $mime_type);
        $type = $arr[1];
        
        //echo $type; exit();
        
        if ($type == 'jpeg') {
            $type = 'jpg';
        }
        
        
        return $type;
    }
    
    /**
     * check email valid
     * @param string $email
     * @return boolean
     */
    public static function isValidEmail($email){
        return preg_match("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$^", $email);
    }
    
}

?>
