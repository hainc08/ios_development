<?php

class ToolKit
{

    /**
     * randon user_id
     * @author Hoang
     * Enter description here ...
     * @param unknown_type $length
     * @param unknown_type $chars
     * @return unknown
     */
    public static function randString($length = 5, $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890')
    {
        $chars_length = (strlen($chars) - 1);
        $string = $chars{rand(0, $chars_length)};
        for ($i = 1; $i < $length; $i = strlen($string)) {
            $r = $chars{rand(0, $chars_length)};
            if ($r != $string{$i - 1})
                $string .= $r;
        }
        return $string;
    }
    
}