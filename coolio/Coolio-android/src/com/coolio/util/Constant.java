package com.coolio.util;
/**
 * Define all constant variable in project
 **/
public class Constant {
	/**
	 *  very important
	 */
	/*define tag value in left menu
	 do not change any value because value of tag is position in listview */
	public static final int TAG_MEMBER =1;
	public static final int TAG_MYFRIENDS =2;
	public static final int TAG_SILENTMATCH =3;
	public static final int TAG_HISTORY =4;
	public static final int TAG_CHATLIST =6;
	public static final int TAG_FRIENDS=8;
	public static final int TAG_MATCH =9;
	public static final int TAG_FOOTPRINT =10;
	public static final int TAG_ALERT =12;
	public static final int TAG_INFORMATION =14;
	public static final int TAG_PROFILE =15;
	public static final int TAG_PASSLOCK =16;
	public static final int TAG_TERM =18;
	public static final int TAG_UNSUBCRIBE =19;
	
	//define param
	public static String SP_PARAM_PATH = "COOLIO";
	
	//define URL
	public static String HTTP ="http://";
	public static String HOST_NAME ="coolio.coolboys.jp/";
	public static String HTTP_ADDRESS = HTTP.concat(HOST_NAME);
	public static String API_LOGIN_URL = HTTP_ADDRESS.concat("doLogin");
	public static String API_GETMYINFO_URL =  HTTP_ADDRESS.concat("getMyInfo");
	public static String API_GETINFO_URL=HTTP_ADDRESS.concat("getInfo");
	public static String API_GET_USER= HTTP_ADDRESS.concat("getUser");
	public static String API_GET_FRIEND= HTTP_ADDRESS.concat("getFriendRequest");
	public static String API_GET_MYFRIEND= HTTP_ADDRESS.concat("getFriend");
	public static String API_GET_SILENTMATCH= HTTP_ADDRESS.concat("getSilentMatch");
	public static String API_GET_HISTORY = HTTP_ADDRESS.concat("getHistory");
	public static String API_GET_MATCH = HTTP_ADDRESS.concat("getMatch");
	public static String ROOT_IMAGE_FOLDER = HTTP_ADDRESS.concat("icons/");
	
	//define check
	public static String SUCCESS_LOGIN="success";
	public static String FAILURE_LOGIN="failure";
	public static String LOCK_LOGIN="lock";
}
