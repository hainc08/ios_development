package com.coolio.activity;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;

import com.coolio.R;
import com.coolio.adapter.SilentMatchAdapter;
import com.coolio.baseinterface.IAfterRequestResponseJsonObject;
import com.coolio.model.ObjMemberFriend;
import com.coolio.service.UserService;
import com.coolio.util.Constant;
import com.google.gson.Gson;

public class SilentMatchActivity extends HeaderActivity implements IAfterRequestResponseJsonObject{
	private SilentMatchAdapter mySilentMathcAdapter;
	private ArrayList<ObjMemberFriend> listSilent;
	private ListView mySilentMatchListView;
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.silentmatch_view);
		this.tag = Constant.TAG_SILENTMATCH;
		showBarProgress();
		//config left menu
		View main_view = findViewById(R.id.main_silentmatch);
		this.configHeaderAndSlideMenu(main_view);

		//set title
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.menu_slientmatch));

		listSilent = new ArrayList<ObjMemberFriend>();
		mySilentMatchListView = (ListView) findViewById(R.id.list_silent);
		//get data from server
		this.getSilentMath();	
	}
	/**
	 * get User history from server by using email address 
	 * 
	 * @author ThuanHM<thuanhm@vnext.vn>
	 * @since 2013/12/30
	 * */
	private void getSilentMath() {
		// get data friend from server
		UserService userService = new UserService(this);

		// add parameters for using when request to server
		JSONObject jsonParams = new JSONObject();
		try {
			jsonParams.put("myId", String.valueOf(LoginActivity.myInfo.getEmail()));
		} catch (JSONException e) {
			e.printStackTrace();
		}

		// get user history by using email
		userService.getInfo(Constant.API_GET_SILENTMATCH, jsonParams);
	}

	@Override
	public void doAfterPostObjectResponse(JSONArray arrayObject) {
		for (int i = 0; i < arrayObject.length(); i++) {
			JSONObject myJsonInfo;
			try {
				myJsonInfo = arrayObject.getJSONObject(i);
				String stringInfo = myJsonInfo.toString();
				Gson gson = new Gson();
				ObjMemberFriend memberHistory = gson.fromJson(stringInfo, ObjMemberFriend.class);
				listSilent.add(memberHistory);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		barProgressDialog.dismiss();

		mySilentMathcAdapter = new SilentMatchAdapter(this, listSilent);
		mySilentMatchListView.setAdapter(mySilentMathcAdapter);
	}

	@Override
	public void doAfterPostonFailureRequest(Throwable error) {
		// TODO Auto-generated method stub
		barProgressDialog.dismiss();
	}

	@Override
	public void doAfterPostonException(Exception e) {
		// TODO Auto-generated method stub
		barProgressDialog.dismiss();
	}
	//destroy function
	@Override
	public void onDestroy()
	{
		super.onDestroy();
	}
}
