package com.coolio.service;

import org.apache.http.entity.StringEntity;
import org.json.JSONObject;

import com.coolio.activity.LoginActivity;
import com.coolio.baseinterface.IAfterRequestResponseString;
import com.coolio.util.Constant;
import com.loopj.android.http.AsyncHttpResponseHandler;

/**
 * Login service - authentication service  
 * 
 * @author ThuanHM <thuanhm@vnext.vn>
 * @since 2013/12/27
 * */
public class LoginService extends BaseService {
	private IAfterRequestResponseString context;
	
	public LoginService(LoginActivity parentActivity) {
		super(parentActivity);
		this.context = parentActivity;
	}

	/**
	 * Execute login action
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <String> email - email string
	 * @param <String> password - password string  
	 * */
	public void login(final String email, final String password) {
		try{
			// add email and password parameters for using when request to server 
			JSONObject jsonParams = new JSONObject();
	        jsonParams.put("email", email);
	        jsonParams.put("password", password);
	        StringEntity entity = new StringEntity(jsonParams.toString());
	        
	        // execute post request 
			this.post(Constant.API_LOGIN_URL, entity, new AsyncHttpResponseHandler() {	
				@Override
				public void onSuccess(String response) {
					//LoginService.this.parentActivity.onSuccessRequest(response);
					LoginService.this.context.doAfterPostStringResponse(response);
				}
				@Override
				public void onFailure(Throwable error) {
					LoginService.this.context.doAfterPostonFailureRequest(error);
				}
			});
        } catch(Exception e){
        	LoginService.this.context.doAfterPostonException(e);
		}
	}
}