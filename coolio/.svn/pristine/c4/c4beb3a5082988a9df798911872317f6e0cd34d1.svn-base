package com.coolio.baseinterface;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Coolio interface- register call back function after request to serser 
 * interface for json object return from serser
 * @author ThuanHM <thuanhm@vnext.vn>
 * @since 2013/12/27
 **/

public interface IAfterRequestResponseJsonObject {
	
	/**
	 * Execute interface after receiver oject response
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <JSONObject> response object from server
	 * 
	 * */
	
	public void doAfterPostObjectResponse(JSONArray arrayObject);
	/**
	 * Execute interface when error connect to serser
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <String> response string from server
	 * 
	 * */
	public void doAfterPostonFailureRequest(Throwable error);
	
	/**
	 * Execute interface when exception connect
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <String> response string from server
	 * 
	 * */
	public void doAfterPostonException(Exception e) ;
	

}
