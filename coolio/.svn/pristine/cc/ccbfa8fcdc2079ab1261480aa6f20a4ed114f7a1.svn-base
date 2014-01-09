package com.coolio.service;

import org.apache.http.entity.StringEntity;
import org.json.JSONArray;
import org.json.JSONObject;

import android.app.Activity;
import android.util.Log;

import com.coolio.baseinterface.IAfterRequestResponseJsonObject;
import com.coolio.util.Constant;
import com.loopj.android.http.JsonHttpResponseHandler;

/**
 * Get user service - authentication service  
 * 
 * @author ThuanHM <thuanhm@vnext.vn>
 * @since 2013/12/27
 * */
public class UserService extends BaseService {
	private IAfterRequestResponseJsonObject context;

	public UserService(Activity parentActivity) {
		super(parentActivity);
		this.context =(IAfterRequestResponseJsonObject) parentActivity;
	}

	/**
	 * Execute get info of login user
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <String> email - email string 
	 * */
	public void getMyInfo(final String email) {
		try{
			// add email and password parameters for using when request to server 
			JSONObject jsonParams = new JSONObject();
			jsonParams.put("email", email);
			StringEntity entity = new StringEntity(jsonParams.toString());

			// execute post request 
			this.post(Constant.API_GETMYINFO_URL, entity, new JsonHttpResponseHandler() {	
				@Override
				public void onSuccess(JSONArray array) {
					UserService.this.context.doAfterPostObjectResponse(array);
				}
				@Override
				public void onFailure(Throwable error) {
					UserService.this.context.doAfterPostonFailureRequest(error);
				}
			});
		} catch(Exception e){
			UserService.this.context.doAfterPostonException(e);
		}
	}
	
	/**
	 * Get user info by using JSONObject params. this function can be use for get my info or get a 
	 * user info, user history...
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <String> url - request url 
	 * @param <JSONObject> jsonParams - coresponding json params 
	 * */
	public void getInfo( final String url,JSONObject jsonParams) {
		try{
			
			StringEntity entity = new StringEntity(jsonParams.toString());

			// execute post request 
			this.post(url, entity, new JsonHttpResponseHandler() {	
				@Override
				public void onSuccess(JSONArray array) {
					Log.d("service","get service array is " + array.length());
					UserService.this.context.doAfterPostObjectResponse(array);
				}
				@Override
				public void onFailure(Throwable error) {
					UserService.this.context.doAfterPostonFailureRequest(error);
				}
			});
		} catch(Exception e){
			UserService.this.context.doAfterPostonException(e);
		}
	}
}