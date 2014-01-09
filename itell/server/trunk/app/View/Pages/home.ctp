<h1> iTELL - API list </h1>

<? /* check user exists */ ?>
<p style="font-weight: bold">1.1) user/check_user</p>
<form method="GET" action="user/check_user"/>
    uuid:<input type="text" name="uuid" size="20"/><br/>    
    <input type="submit" value="GET"/>
</form>
<hr/>
<? /* get code */ ?>
<p style="font-weight: bold">1.2) user/get_code</p>
<form method="POST" action="user/get_code"/>
    mobile_num:<input type="text" name="mobile_num" size="20"/><br/>    
    isp:<input type="text" name="isp" size="20"/><br/>    
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* get code by email*/ ?>
<p style="font-weight: bold">1.2.1) regist/get_code_email</p>
<form method="POST" action="regist/get_code_email"/>
    mobile_num:<input type="text" name="mobile_num" size="20"/><br/>    
    email:<input type="text" name="email" size="20"/><br/>    
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* authen code */ ?>
<p style="font-weight: bold">1.3) user/authen_code</p>
<form method="POST" action="user/authen_code"/>
    mobile_num:<input type="text" name="mobile_num" size="20"/><br/>
    authen_code:<input type="text" name="authen_code" size="20"/><br/>    
    isp:<input type="text" name="isp" size="20"/><br/>    
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* register user */ ?>
<p style="font-weight: bold">1.4) user/regist_user</p>
<form method="POST" action="user/regist_user"/>
    mobile_num:<input type="text" name="mobile_num" size="20"/><br/>
    authen_code:<input type="text" name="authen_code" size="20"/><br/>
    isp:<input type="text" name="isp" size="20"/><br/>
    user_data:<input type="text" name="user_data" size="50"/><br/>
    <span style="font-style: italic">Ex: user_data = { "uuid" : "2defdfjk-8782dkjk-2938df", "nick" : "itellnick" , "name" : "iTell", "gender": 0, "birth" : "1980-08-08"}</span><br/>
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* get user info */ ?>
<p style="font-weight: bold">1.5) user/get_user_info</p>
<form method="GET" action="user/get_user_info"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>    
    uuid:<input type="text" name="uuid" size="20"/><br/>    
    <input type="submit" value="GET"/>
</form>
<hr/>
<? /* update user info */ ?>
<p style="font-weight: bold">1.6) user/update_user_info</p>
<form method="POST" action="user/update_user_info"/>
    user_id:<input type="text" name="user_id" size="20"/><br/> 
    uuid:<input type="text" name="uuid" size="20"/><br/>        
    update_info:<input type="text" name="update_info" size="50"/><br/>       
    <span style="font-style: italic">Ex: update_info = { "nick" : "newnick" , "name" : "new name", "gender": 0, "birth" : "1980-08-08", "desc": "this is my description"}</span><br/>
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* post itell */ ?>
<p style="font-weight: bold">2.1) itell/post_itell</p>
<form method="POST" action="itell/post_itell"/>
    user_id:<input type="text" name="user_id" size="20"/><br/> 
    uuid:<input type="text" name="uuid" size="20"/><br/>        
    itell:<input type="text" name="itell" size="50"/><br/>       
    itell_policy:<input type="text" name="itell_policy" size="10"/><br/>           
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* get itell */ ?>
<p style="font-weight: bold">2.2) itell/get_itell</p>
<form method="GET" action="itell/get_itell"/>
    user_id:<input type="text" name="user_id" size="20"/><br/> 
    uuid:<input type="text" name="uuid" size="20"/><br/>            
    <input type="submit" value="GET"/>
</form>
<hr/>
<? /* cancel itell */ ?>
<p style="font-weight: bold">2.3) itell/cancel_itell</p>
<form method="POST" action="itell/cancel_itell"/>
    user_id:<input type="text" name="user_id" size="20"/><br/> 
    uuid:<input type="text" name="uuid" size="20"/><br/>            
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* get profile */ ?>
<p style="font-weight: bold">3.1) profile/get_profile</p>
<form method="GET" action="profile/get_profile"/>
    user_id:<input type="text" name="user_id" size="20"/><br/> 
    uuid:<input type="text" name="uuid" size="20"/><br/>            
    friend_id:<input type="text" name="friend_id" size="20"/><br/>     
    <input type="submit" value="GET"/>
</form>
<hr/>
<? /* send invite */ ?>
<p style="font-weight: bold">3.2) profile/send_invite</p>
<form method="POST" action="profile/send_invite"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>     
    friend_id:<input type="text" name="friend_id" size="20"/><br/>     
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* delete friend */ ?>
<p style="font-weight: bold">3.3) profile/delete_friend</p>
<form method="POST" action="profile/delete_friend"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>     
    friend_id:<input type="text" name="friend_id" size="20"/><br/>     
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* retrict public */ ?>
<p style="font-weight: bold">3.4) profile/restrict_pub</p>
<form method="POST" action="profile/restrict_pub"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>     
    friend_id:<input type="text" name="friend_id" size="20"/><br/>     
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* allow public */ ?>
<p style="font-weight: bold">3.5) profile/allow_pub</p>
<form method="POST" action="profile/allow_pub"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>     
    friend_id:<input type="text" name="friend_id" size="20"/><br/>     
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* block */ ?>
<p style="font-weight: bold">3.6) profile/block</p>
<form method="POST" action="profile/block"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>  
    uuid:<input type="text" name="uuid" size="20"/><br/>     
    friend_id:<input type="text" name="friend_id" size="20"/><br/>     
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* unblock */ ?>
<p style="font-weight: bold">3.7) profile/unblock</p>
<form method="POST" action="profile/unblock"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>     
    friend_id:<input type="text" name="friend_id" size="20"/><br/>     
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* post badge */ ?>
<p style="font-weight: bold">3.8) profile/post_badge</p>
<form method="POST" action="profile/post_badge"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>     
    friend_id:<input type="text" name="friend_id" size="20"/><br/>     
    badge:<input type="text" name="badge" size="20"/><br/>     
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* get list invite */ ?>
<p style="font-weight: bold">4.1) friend/get_list_invite</p>
<form method="GET" action="friend/get_list_invite"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>         
    <input type="submit" value="GET"/>
</form>
<hr/>
<? /* accept invite */ ?>
<p style="font-weight: bold">4.2) friend/accept_invite</p>
<form method="POST" action="friend/accept_invite"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>         
    invite_id:<input type="text" name="invite_id" size="20"/><br/>         
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* deny invite */ ?>
<p style="font-weight: bold">4.3) friend/deny_invite</p>
<form method="POST" action="friend/deny_invite"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>         
    invite_id:<input type="text" name="invite_id" size="20"/><br/>         
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* get list friend */ ?>
<p style="font-weight: bold">4.4) friend/get_list_friend</p>
<form method="GET" action="friend/get_list_friend"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>         
    <input type="submit" value="GET"/>
</form>
<hr/>
<? /* search friend */ ?>
<p style="font-weight: bold">4.5) friend/search_friend</p>
<form method="POST" action="friend/search_friend"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>         
    keyword:<input type="text" name="keyword" size="20"/><br/>         
    page:<input type="text" name="page" size="20"/><br/>         
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* search friend */ ?>
<p style="font-weight: bold">4.6) friend/get_contacts_not_friend</p>
<form method="POST" action="friend/get_contacts_not_friend"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>         
    page:<input type="text" name="page" size="20"/><br/>         
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* search friend */ ?>
<p style="font-weight: bold">4.7) friend/get_contacts_not_using</p>
<form method="POST" action="friend/get_contacts_not_using"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>         
    page:<input type="text" name="page" size="20"/><br/>         
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* search friend */ ?>
<p style="font-weight: bold">4.8) friend/get_contacts_is_friend</p>
<form method="POST" action="friend/get_contacts_is_friend"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>         
    page:<input type="text" name="page" size="20"/><br/>         
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* send invite by email */ ?>
<p style="font-weight: bold">4.9) friend/send_invite_email</p>
<form method="POST" action="friend/send_invite_email"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>        
    name:<input type="text" name="name" size="20"/><br/>
    email:<input type="text" name="email" size="20"/><br/>         
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* setting - allow search */ ?>
<p style="font-weight: bold">5.1) setting/allow_search</p>
<form method="POST" action="setting/allow_search"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* setting - deny search */ ?>
<p style="font-weight: bold">5.2) setting/deny_search</p>
<form method="POST" action="setting/deny_search"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* setting - get block list */ ?>
<p style="font-weight: bold">5.3) setting/get_block_list</p>
<form method="GET" action="setting/get_block_list"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    <input type="submit" value="GET"/>
</form>
<hr/>

<? /* setting - upload avatar */ ?>
<p style="font-weight: bold">5.4) setting/upload_avatar</p>
<form method="POST" action="setting/upload_avatar"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    image:<input type="text" name="image" size="50"/><br/>
    <span style="font-style: italic">Note: image is base64 encoding string, accept only jpg/gif/png</span><br/>
    <input type="submit" value="POST"/>
</form>
<hr/>

<? /* setting - delete avatar */ ?>
<p style="font-weight: bold">5.5) setting/delete_avatar</p>
<form method="POST" action="setting/delete_avatar"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    <input type="submit" value="POST"/>
</form>
<hr/>

<? /* setting - upload image */ ?>
<p style="font-weight: bold">5.6) setting/upload_img</p>
<form method="POST" action="setting/upload_img"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    image:<input type="text" name="image" size="50"/><br/>
    <span style="font-style: italic">Note: image is base64 encoding string, accept only jpg/gif/png</span><br/>
    <input type="submit" value="POST"/>
</form>
<hr/>

<? /* setting - delete image */ ?>
<p style="font-weight: bold">5.7) setting/delete_img</p>
<form method="POST" action="setting/delete_img"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    image_id:<input type="text" name="image_id" size="20"/><br/>             
    <input type="submit" value="POST"/>
</form>
<hr/>

<? /* setting - get album */ ?>
<p style="font-weight: bold">5.8) setting/get_album</p>
<form method="GET" action="setting/get_album"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>   
    friend_id:<input type="text" name="friend_id" size="20"/><br/>  
    <input type="submit" value="GET"/>
</form>
<hr/>

<? /* setting - post contact */ ?>
<p style="font-weight: bold">5.9) setting/post_contact</p>
<form method="POST" action="setting/post_contact"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    name:<input type="text" name="names[]" size="20"/>phone:<input type="text" name="phones[]" size="15"/>email:<input type="text" name="emails[]" size="15"/><br/>
    name:<input type="text" name="names[]" size="20"/>phone:<input type="text" name="phones[]" size="15"/>email:<input type="text" name="emails[]" size="15"/><br/>
    name:<input type="text" name="names[]" size="20"/>phone:<input type="text" name="phones[]" size="15"/>email:<input type="text" name="emails[]" size="15"/><br/> 
    name:<input type="text" name="names[]" size="20"/>phone:<input type="text" name="phones[]" size="15"/>email:<input type="text" name="emails[]" size="15"/><br/>
    name:<input type="text" name="names[]" size="20"/>phone:<input type="text" name="phones[]" size="15"/>email:<input type="text" name="emails[]" size="15"/><br/>
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* chat - post list free stamp*/ ?>
<p style="font-weight: bold">6.0) chat/get_list_free_stamp</p>
<form method="POST" action="chat/get_list_free_stamp"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    updated:<input type="text" name="updated" size="20"/><br/>             
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* chat - post list user stamp*/ ?>
<p style="font-weight: bold">6.1) chat/get_list_user_stamp</p>
<form method="POST" action="chat/get_list_user_stamp"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    updated:<input type="text" name="updated" size="20"/><br/>             
    <input type="submit" value="POST"/>
</form>
<hr/>
<? /* chat - get socket sev*/ ?>
<p style="font-weight: bold">6.2) chat/get_server </p>
<form method="GET" action="chat/get_server"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    <input type="submit" value="GET"/>
</form>
<hr/>
<?php /* map - get map other */ ?>
<p style="font-weight: bold">7.1) map/post_position </p>
<form method="POST" action="map/post_position"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    longitude: <input type="text" name="longitude" size="20"/><br/>
    latitude: <input type="text" name="latitude" size="20"/><br/>
    strict: <input type="text" name="strict" size="20"/><br/>
    city: <input type="text" name="city" size="20"/><br/>             
    street: <input type="text" name="street" size="20"/><br/>             
    time_stamp: <input type="text" name="time_stamp" size="20"/><br/>             
    <input type="submit" value="POST"/>
</form>
<hr/>
<?php /* map - get map other */ ?>
<p style="font-weight: bold">7.2) map/get_map_other </p>
<form method="POST" action="map/get_map_other"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    longitude: <input type="text" name="longitude" size="20"/><br/>
    latitude: <input type="text" name="latitude" size="20"/><br/>
    max_matches: <input type="text" name="max_matches" size="20"/><br/>
    distance: <input type="text" name="distance" size="20"/><br/>
    page: <input type="text" name="page" size="20"/><br/>             
    <input type="submit" value="POST"/>
</form>
<hr/>
<?php /* map - get map friend */ ?>
<p style="font-weight: bold">7.3) map/get_map_friend </p>
<form method="POST" action="map/get_map_friend"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    longitude: <input type="text" name="longitude" size="20"/><br/>
    latitude: <input type="text" name="latitude" size="20"/><br/>
    max_matches: <input type="text" name="max_matches" size="20"/><br/>
    distance: <input type="text" name="distance" size="20"/><br/>   
    page: <input type="text" name="page" size="20"/><br/>          
    <input type="submit" value="POST"/>
</form>
<hr/>
<?php /* map - get map company */ ?>
<p style="font-weight: bold">7.4) map/get_map_company </p>
<form method="POST" action="map/get_map_company"/>
    user_id:<input type="text" name="user_id" size="20"/><br/>     
    uuid:<input type="text" name="uuid" size="20"/><br/>             
    longitude: <input type="text" name="longitude" size="20"/><br/>
    latitude: <input type="text" name="latitude" size="20"/><br/>
    max_matches: <input type="text" name="max_matches" size="20"/><br/>
    distance: <input type="text" name="distance" size="20"/><br/>  
    page: <input type="text" name="page" size="20"/><br/>           
    <input type="submit" value="POST"/>
</form>
<hr/>