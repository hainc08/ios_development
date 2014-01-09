package com.coolio.baseinterface;



/**
 * Coolio interface- register call back function after request to serser 
 * interface for string return from serser
 * @author ThuanHM <thuanhm@vnext.vn>
 * @since 2013/12/27
 **/

public interface IAfterRequestResponseString {
	/**
	 * Execute interface after receiver string response
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <String> response string from server
	 * 
	 * */
	public void doAfterPostStringResponse(String response);
	
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
