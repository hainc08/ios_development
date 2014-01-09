package com.coolio.activity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.coolio.R;
import com.coolio.baseinterface.IAfterRequestResponseJsonObject;
import com.coolio.baseinterface.IAfterRequestResponseString;
import com.coolio.model.ObjMemberInfo;
import com.coolio.service.LoginService;
import com.coolio.service.UserService;
import com.coolio.util.Constant;
import com.coolio.util.Utility;
import com.coolio.util.Validate;
import com.google.gson.Gson;

public class LoginActivity extends Activity  implements IAfterRequestResponseString,IAfterRequestResponseJsonObject{
	private Button login_button;
	private TextView txtuser_name;
	private TextView txtpassword;
	private static ProgressDialog waitDialog;
	public static ObjMemberInfo myInfo;

	/**
	 * Execute override oncreate activity
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * */
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.login_view);
		SharedPreferences pref = getSharedPreferences(Constant.SP_PARAM_PATH,
				MODE_PRIVATE);
		String loginUser = pref.getString("user_email", "");
		String loginPass = pref.getString("user_pass", "");
		txtuser_name = (TextView ) findViewById(R.id.user_email);
		txtuser_name.setText(loginUser);

		txtpassword = (TextView ) findViewById(R.id.user_password);
		txtpassword.setText(loginPass);

		login_button = (Button ) findViewById(R.id.btn_login);

		login_button.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				if(Utility.checkInternetConnection(LoginActivity.this) == true) {
					if (checkValidation()) {
						waitDialog = new ProgressDialog(LoginActivity.this);
						waitDialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
						waitDialog.setCancelable(false);
						waitDialog.show();
						checkLogin();
					}
				}
			}
		});

	}
	
	/**
	 * Execute check validate email and password
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * */
	
	private boolean checkValidation(){
		boolean flg = true;
		if((txtuser_name.getText().length() == 0 )||(txtpassword.getText().length() == 0)){
			Utility.showDialogAlert(LoginActivity.this.getResources().getString(R.string.require),LoginActivity.this.getResources().getString(R.string.requeire_login),LoginActivity.this);
			flg = false;
		}
		else if(!Validate.checkEmail(txtuser_name.getText().toString().trim())){
			Utility.showDialogAlert(LoginActivity.this.getResources().getString(R.string.error),LoginActivity.this.getResources().getString(R.string.invalid_email),LoginActivity.this);
			flg = false;
		}
		
		return flg;
	}

	/**
	 * Execute login action
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * */
	private void checkLogin() {
		LoginService service = new LoginService(this);
		service.login(txtuser_name.getText().toString().trim(), txtpassword.getText().toString().trim());
	}
	
	
	/**
	 * Execute implement function when success request
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <String> response - response string from server 
	 * */
	@Override
	public void doAfterPostStringResponse(String response){
		
		if(response.equalsIgnoreCase(Constant.SUCCESS_LOGIN)){
			SharedPreferences pref = getSharedPreferences(
					Constant.SP_PARAM_PATH, MODE_PRIVATE);
			Editor edit = pref.edit();
			edit.putString("user_email", txtuser_name.getText().toString().trim());
			edit.putString("user_pass", txtpassword.getText().toString().trim());
			edit.commit();
			UserService service = new UserService(this);
			service.getMyInfo(txtuser_name.getText().toString().trim());
			
			
			
		}
		else if (response.equalsIgnoreCase(Constant.FAILURE_LOGIN)) {
			waitDialog.dismiss();
			Utility.showDialogAlert(LoginActivity.this.getResources().getString(R.string.error),LoginActivity.this.getResources().getString(R.string.error_login),LoginActivity.this);
		}
		else if (response.equalsIgnoreCase(Constant.LOCK_LOGIN)) {
			waitDialog.dismiss();
			Utility.showDialogAlert(LoginActivity.this.getResources().getString(R.string.error),LoginActivity.this.getResources().getString(R.string.error_lock),LoginActivity.this);
		}
		else{
			waitDialog.dismiss();
			Utility.showDialogAlert(LoginActivity.this.getResources().getString(R.string.error),LoginActivity.this.getResources().getString(R.string.error_message),LoginActivity.this);
		}
	}
	
	@Override
	public void doAfterPostObjectResponse(JSONArray arrayObject){
		if (arrayObject.length()>0) {
			JSONObject myJsonInfo;
			try {
				myJsonInfo = arrayObject.getJSONObject(0);
				String stringInfo = myJsonInfo.toString();
				Gson gson = new Gson();
				this.myInfo = gson.fromJson(stringInfo, ObjMemberInfo.class);
				Intent login_intent = new Intent(LoginActivity.this,MemberListActivity.class);
				startActivity(login_intent);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		waitDialog.dismiss();
	}
	
	/**
	 * Execute implement function when fail request
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <Throwable> error - error  from server 
	 * */
	@Override
	public void doAfterPostonFailureRequest(Throwable error) {
		Utility.showDialogAlert(LoginActivity.this.getResources().getString(R.string.error),LoginActivity.this.getResources().getString(R.string.error_message),LoginActivity.this);
		waitDialog.dismiss();
	}
	/**
	 * Execute implement function when fail connect
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * @param <Exception> e - error  when connect server
	 * */
	@Override
	public void doAfterPostonException(Exception e) {
		Utility.showDialogAlert(LoginActivity.this.getResources().getString(R.string.error),LoginActivity.this.getResources().getString(R.string.error_message),LoginActivity.this);
		waitDialog.dismiss();
	}
	//destroy function
		@Override
	    public void onDestroy()
	    {
	        super.onDestroy();
	    }
	
}
