package com.coolio.activity;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.TextView;

import com.coolio.R;
import com.coolio.adapter.FriendsAdapter;
import com.coolio.baseinterface.IAfterRequestResponseJsonObject;
import com.coolio.model.ObjMemberInfo;
import com.coolio.service.UserService;
import com.coolio.util.Constant;
import com.coolio.util.Utility;
import com.google.gson.Gson;

public class FriendsListActivity extends HeaderActivity implements IAfterRequestResponseJsonObject{
	private FriendsAdapter friendAdapter;
	private ArrayList<ObjMemberInfo> listFriend;
	private ListView friendListview;
	
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.friends_view);
		//show waiting dialog
		this.showBarProgress();
		
		this.tag = Constant.TAG_FRIENDS;
		//config left menu and header
		View main_view = findViewById(R.id.main_friend);
		this.configHeaderAndSlideMenu(main_view);
		//set title
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.menu_friend));
		
		listFriend = new ArrayList<ObjMemberInfo>();
		friendListview = (ListView) findViewById(R.id.list_friends);
		//get data friend from server
		this.getUserFriend();
		

		
		friendListview.setOnItemClickListener(new OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
				//Intent intent = new Intent(ChatListActivity.this,MemberDetailActivity.class);
				//startActivity(intent);
			}
		});
		
	}
	
	/**
	 * get User history from server by using email address 
	 * 
	 * @author ThuanHM<thuanhm@vnext.vn>
	 * @since 2013/12/30
	 * */
	private void getUserFriend() {
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
		userService.getInfo(Constant.API_GET_FRIEND, jsonParams);
	}
	
	@Override
	public void doAfterPostObjectResponse(JSONArray arrayObject){
		for (int i = 0; i < arrayObject.length(); i++) {
			JSONObject myJsonInfo;
			try {
				myJsonInfo = arrayObject.getJSONObject(i);
				String stringInfo = myJsonInfo.toString();
				Gson gson = new Gson();
				ObjMemberInfo member = gson.fromJson(stringInfo, ObjMemberInfo.class);
				listFriend.add(member);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		friendAdapter = new FriendsAdapter(this ,listFriend);
		friendListview.setAdapter(friendAdapter);
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
		Utility.showDialogAlert(FriendsListActivity.this.getResources().getString(R.string.error),FriendsListActivity.this.getResources().getString(R.string.error_message),FriendsListActivity.this);
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
		Utility.showDialogAlert(FriendsListActivity.this.getResources().getString(R.string.error),FriendsListActivity.this.getResources().getString(R.string.error_message),FriendsListActivity.this);
	}
	//destroy function
		@Override
	    public void onDestroy()
	    {
	        super.onDestroy();
	    }
}
