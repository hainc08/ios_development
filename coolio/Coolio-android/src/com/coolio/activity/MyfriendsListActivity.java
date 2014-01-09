package com.coolio.activity;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.TextView;

import com.coolio.R;
import com.coolio.adapter.MyfriendAdapter;
import com.coolio.baseinterface.IAfterRequestResponseJsonObject;
import com.coolio.model.ObjMemberFriend;
import com.coolio.model.ObjMemberHistory;
import com.coolio.service.UserService;
import com.coolio.util.Constant;
import com.coolio.util.Utility;
import com.google.gson.Gson;

public class MyfriendsListActivity extends HeaderActivity implements IAfterRequestResponseJsonObject{
	
	private MyfriendAdapter myfriend_adapter;
	private ArrayList<ObjMemberFriend> listFriend;
	private ListView listViewFriend ;
	
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.myfriend_view);
		//show wait dialog
		this.showBarProgress();
				
		this.tag = Constant.TAG_MYFRIENDS;
		View mainView = findViewById(R.id.main_myfriend);
		this.configHeaderAndSlideMenu(mainView);
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.my_friends));
		listViewFriend = (ListView) findViewById(R.id.list_friends);
		listFriend = new ArrayList<ObjMemberFriend>();
		
		//get data friend from server
		UserService getUser = new UserService(this);
		// add parameters for using when request to server 
		JSONObject jsonParams = new JSONObject();
		try {
			jsonParams.put("myId",String.valueOf(LoginActivity.myInfo.getEmail()));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		getUser.getInfo(Constant.API_GET_MYFRIEND, jsonParams);

		listViewFriend.setOnItemClickListener(new OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
				Intent intent = new Intent(MyfriendsListActivity.this,MemberDetailActivity.class);
				startActivity(intent);
			}
		});

	}
	
	@Override
	public void doAfterPostObjectResponse(JSONArray arrayObject){
		for (int i = 0; i < arrayObject.length(); i++) {
			JSONObject myJsonInfo;
			try {
				myJsonInfo = arrayObject.getJSONObject(i);
				String stringInfo = myJsonInfo.toString();
				Gson gson = new Gson();
				ObjMemberFriend member = gson.fromJson(stringInfo, ObjMemberFriend.class);
				listFriend.add(member);
			} catch (JSONException e) {
				e.printStackTrace();
			}

		}
		
		myfriend_adapter = new MyfriendAdapter(this ,listFriend);
		listViewFriend.setAdapter(myfriend_adapter);
		barProgressDialog.dismiss();
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
		barProgressDialog.dismiss();
		Utility.showDialogAlert(MyfriendsListActivity.this.getResources().getString(R.string.error),MyfriendsListActivity.this.getResources().getString(R.string.error_message),MyfriendsListActivity.this);
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
		barProgressDialog.dismiss();
		Utility.showDialogAlert(MyfriendsListActivity.this.getResources().getString(R.string.error),MyfriendsListActivity.this.getResources().getString(R.string.error_message),MyfriendsListActivity.this);
	}
}
