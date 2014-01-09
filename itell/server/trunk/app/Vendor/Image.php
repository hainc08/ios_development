<?php
/*Class Zend_Image
http://sdf.com.vn*/

class Image {
   var $image;
   var $image_type;
   
   /**
    * constructor
    * @param image resource $imageres
    * @param string $type 
    */
   function __construct($imageres, $type) {
      $this->image = $imageres;
      $this->image_type = $type;
      /* 
      $image_info = getimagesize($filename);
      //var_dump($image_info);
      $this->image_type = $image_info[2];
      if( $this->image_type == IMAGETYPE_JPEG ) {
         $this->image = imagecreatefromjpeg($filename);
      } elseif( $this->image_type == IMAGETYPE_GIF ) {
         $this->image = imagecreatefromgif($filename);
      } elseif( $this->image_type == IMAGETYPE_PNG ) {
         $this->image = imagecreatefrompng($filename);
      }
       * 
       */
   }
   
   /*function getType($filename){
   		$image_info = getimagesize($filename);
   		return $image_info[2];	
   }*/
   
   function save($filename, $compression=75, $permissions=null) {

      $image_type = $this->image_type;
      if( $image_type == 'jpg' ) {
         imagejpeg($this->image,$filename,$compression);
      } elseif( $image_type == 'gif' ) {
         imagegif($this->image,$filename);         
      } elseif( $image_type == 'png' ) {
         imagepng($this->image,$filename);
      } elseif( $image_type == 'bmp' ) {  
         imagewbmp($this->image,$filename);
      }
      
      if( $permissions != null) {
         chmod($filename,$permissions);
      }
   }
   
   function output($image_type=IMAGETYPE_JPEG) {
      if( $image_type == IMAGETYPE_JPEG ) {
         imagejpeg($this->image);
      } elseif( $image_type == IMAGETYPE_GIF ) {
         imagegif($this->image);         
      } elseif( $image_type == IMAGETYPE_PNG ) {
         imagepng($this->image);
      }   
   }
   
   /*function getImageType($filename){
   		$image_info = getimagesize($filename);
		return $image_info[2];
   }*/
   
   function getWidth() {
      return imagesx($this->image);
   }
   function getHeight() {
      return imagesy($this->image);
   }
   
   function resizeToHeight($height) {
      $ratio = $height / $this->getHeight();
      $width = $this->getWidth() * $ratio;
      $this->resize($width,$height);
   }
   
   function resizeToWidth($width) {
      $ratio = $width / $this->getWidth();
      $height = $this->getheight() * $ratio;
      $this->resize($width,$height);
   }
   
   //Resize theo phan tram
   function scale($scale) {
      $width = $this->getWidth() * $scale/100;
      $height = $this->getheight() * $scale/100; 
      $this->resize($width,$height);
   }
   
   function resize($width,$height) {
        $new_image = imagecreatetruecolor($width, $height);   	  
        imagealphablending($new_image, false);
        imagesavealpha($new_image,true);
        $transparent = imagecolorallocatealpha($new_image, 255, 255, 255, 127);
        imagefilledrectangle($new_image, 0, 0, $width, $height, $transparent);
        imagecopyresampled($new_image, $this->image, 0, 0, 0, 0, $width, $height, $this->getWidth(), $this->getHeight());
        $this->image = $new_image;  
        
        //var_dump($this->image);
   } 
   
   /**
    * decode an image from base64 string
    * @param type $string 
    */
   public static function createFromString($string) {
        //$thefile = base64_decode($string);  
        $img = @imagecreatefromstring($string); 
        /*
        if($img != false) 
        { 
            //echo 'create';
            //imagejpeg($img, WWW_ROOT . "/img/uploads/users/trungnb_ico.jpg"); 
        }*/
        return $img;
       
   }
   
   /**
    * encode an image to base64 string
    * @param file $file 
    */
   function encodeBase64($file) {
       //$img = WWW_ROOT . "/img/uploads/users/trungnb.jpg";
       $img = $file;
        
        //echo $imgbinary;exit();
        try {
            
            $fd = fopen($img, 'rb');
            $size = filesize($img);
            $cont = fread($fd, $size);
            fclose($fd);
            $encimg = chunk_split(base64_encode($cont));
            
        } catch (Exception $e) {
            echo $e->getMessage();
            return false;
            exit();
        }
        return $encimg;
        
       
   }
   
   /**
    * get image type from a base64 decoded string
    * @param base64 decoded string $stringimg 
    * using php_finfo.dll
    */
   public static function getImageType($stringimg) {
        $f = finfo_open();
        $mime_type = finfo_buffer($f, $stringimg, FILEINFO_MIME_TYPE);
        return $mime_type;
   }
}
?>