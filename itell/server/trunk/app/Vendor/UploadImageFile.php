<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UploadImage
 *
 * @author HoaManLau
 */

App::import('Vendor', 'ToolKit');
App::import('Vendor', 'ImageFile');

class UploadImageFile
{

    /**
     * Xoa cac file da duoc upload dong thoi xoa cache.
     * @param string $file_name
     * @return boon 
     */
    public static function removeUploadImage($file_name)
    {
        $file_name = str_replace('__', '/', $file_name);
        if (file_exists(sfConfig::get('sf_web_dir') . "/images/uploads/$file_name") == false) {
            return;
        }
        unlink(sfConfig::get('sf_web_dir') . "/images/uploads/$file_name");
        $fileName = pathinfo($file_name, PATHINFO_BASENAME);
        foreach (scandir(sfConfig::get('sf_web_dir') . "/images/uploads/cache") as $dir) {
            if (trim($dir, '.') && is_dir(sfConfig::get('sf_web_dir') . "/images/uploads/cache/$dir")
                    && file_exists(sfConfig::get('sf_web_dir') . "/images/uploads/cache/$dir/$fileName")) {
                unlink(sfConfig::get('sf_web_dir') . "/images/uploads/cache/$dir/$fileName");
            }
        }
    }

    public static function saveUploadImage($name, $sub_folder)
    {
        $uploadName = array();
        //var_dump($_FILES);
        
        if (is_array($_FILES[$name]['name'])) {
            foreach ($_FILES[$name]['name'] as $key => $fileName) {
                if ($fileName && $_FILES[$name]['error'][$key] == 0) {
                    if ($randomName = self::save($fileName, $_FILES[$name]['tmp_name'][$key], $sub_folder)) {
                        $uploadName[] = $randomName;
                    }
                }
            }
        }
        else if ($_FILES[$name]['name'] && $_FILES[$name]['error'] == 0) {
            if ($randomName = self::save($_FILES[$name]['name'], $_FILES[$name]['tmp_name'], $sub_folder)) {
                $uploadName[] = $randomName;
            }
        }
        return $uploadName;
    }

    private static function save($old_file_name, $path, $sub_folder)
    {
        if (file_exists(WWW_ROOT . "/img/uploads/$sub_folder") == false) {
            mkdir(WWW_ROOT . "/img/uploads/$sub_folder",  0777, true);
            //chmod(sfConfig::get('sf_web_dir') . "/images/uploads/$sub_folder", 0777);
        }
        $fileName = "{$sub_folder}__" . date('Ymd', time()) . '-' . ToolKit::randString(15) . '.' . pathinfo($old_file_name, PATHINFO_EXTENSION);
        
        if (copy($path, WWW_ROOT . "/img/uploads/$sub_folder/" . pathinfo(str_replace('__', '/', $fileName), PATHINFO_BASENAME)) == false) {
            return '';
        }
        return $fileName;
    }

}

?>
