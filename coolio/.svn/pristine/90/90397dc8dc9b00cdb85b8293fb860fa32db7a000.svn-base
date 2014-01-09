package com.coolio.activity;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.coolio.adapter.MatchedAdapter;
import com.coolio.adapter.SilentMatchAdapter;
import com.coolio.baseinterface.IAfterRequestResponseJsonObject;
import com.coolio.model.ObjMember;
import com.coolio.model.ObjMemberFriend;
import com.coolio.service.UserService;
import com.coolio.util.Constant;
import com.coolio.R;
import com.google.gson.Gson;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView;

public class MatchActivity extends HeaderActivity implements IAfterRequestResponseJsonObject{
	private MatchedAdapter matchAdapter;
	private ArrayList<ObjMemberFriend> listMatch;
	private ListView myMatchListView;
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.match_view);
		this.tag = Constant.TAG_MATCH;
		showBarProgress();
		
		View main_view = findViewById(R.id.main_match);
		this.configHeaderAndSlideMenu(main_view);
		
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.menu_matched));
		
		listMatch = new ArrayList<ObjMemberFriend>();
		myMatchListView = (ListView) findViewById(R.id.list_match);
		//get data from server
		this.getMath();	
		
	}
	/**
	 * get User matched from server by using email address 
	 * 
	 * @author ThuanHM<thuanhm@vnext.vn>
	 * @since 2013/12/30
	 * */
	private void getMath() {
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
		userService.getInfo(Constant.API_GET_MATCH, jsonParams);
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
				listMatch.add(memberHistory);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		barProgressDialog.dismiss();
		
		matchAdapter = new MatchedAdapter(this, listMatch);
		myMatchListView.setAdapter(matchAdapter);
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
