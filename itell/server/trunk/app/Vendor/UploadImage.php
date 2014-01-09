<?php

/**
 * Description of UploadImage
 *
 * @author HoaManLau
 */

App::import('Vendor', 'ToolKit');
App::import('Vendor', 'Image');

class UploadImage
{

    /**
     * Xoa cac file da duoc upload dong thoi xoa cache.
     * @param string $file_name
     * @return boon 
     */
    public static function removeUploadImage($file_name)
    {
        try {
            $file_name = str_replace('__', '/', $file_name);
            $file_thumb = pathinfo($file_name, PATHINFO_DIRNAME) . '/' . pathinfo($file_name, PATHINFO_FILENAME) . '_thumb.' . pathinfo($file_name, PATHINFO_EXTENSION);
            
            //var_dump($file_thumb);  return;
            
            if (file_exists(WWW_ROOT . "/img/uploads/$file_name") == false) {
                return;
            }
            unlink(WWW_ROOT . "/img/uploads/$file_name");
            
            if (file_exists(WWW_ROOT . "/img/uploads/$file_thumb")) {
                unlink(WWW_ROOT . "/img/uploads/$file_thumb");
            }
            
            return true;
            
        } catch (Exception $e) {
            return false;
        }
    }

    /**
     * save upload image
     * @param string $name
     * @param string $sub_folder
     * @return file 
     */
    public static function saveUploadImage($image, $type, $sub_folder)
    {
        try {
            if (file_exists(WWW_ROOT . "/img/uploads/$sub_folder") == false) {
                mkdir(WWW_ROOT . "/img/uploads/$sub_folder",  0777, true);
                //chmod(sfConfig::get('sf_web_dir') . "/images/uploads/$sub_folder", 0777);
            }
            
            $filePath = date('Ymd', time()) . '-' . ToolKit::randString(15) . '.'.$type;
            $fileName = "{$sub_folder}__" . $filePath;

            //imagejpeg($image, WWW_ROOT . "/img/uploads/$sub_folder/" . pathinfo(str_replace('__', '/', $fileName), PATHINFO_BASENAME))
            $img = new Image($image, $type);
            $img->save(WWW_ROOT . "/img/uploads/$sub_folder/" . pathinfo(str_replace('__', '/', $fileName), PATHINFO_BASENAME));

            //echo 'create thumb';
            //var_dump($thumb->image);
            $img->resizeToWidth(100);
            $img->save(WWW_ROOT . "/img/uploads/$sub_folder/" . pathinfo(str_replace('__', '/', $fileName), PATHINFO_FILENAME) . "_thumb.".$type);
            
            return $fileName;
        } catch (Exception $e) {
            return null;
            
        }
        
    }

}

?>
