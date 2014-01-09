package com.coolio.activity;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.os.Bundle;
import android.view.View;
import android.widget.ListView;

import com.coolio.R;
import com.coolio.adapter.MyHistoryAdapter;
import com.coolio.baseinterface.IAfterRequestResponseJsonObject;
import com.coolio.model.ObjMemberHistory;
import com.coolio.service.UserService;
import com.coolio.util.Constant;
import com.google.gson.Gson;

public class MyHistoryActivity extends HeaderActivity implements IAfterRequestResponseJsonObject{

	private ArrayList<ObjMemberHistory> listMemberHistory;
	private MyHistoryAdapter myHistoryAdapter;
	private ListView myHistoryListView;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		setContentView(R.layout.myhistory_view);
		View main_view = findViewById(R.id.main_history);
		
		// show progeress bar
		showBarProgress();

		tag = Constant.TAG_HISTORY;
		configHeaderAndSlideMenu(main_view);
		listMemberHistory = new ArrayList<ObjMemberHistory>();
		myHistoryListView = (ListView) findViewById(R.id.list_history);

		// execute get user history from server 
		this.getUserHistory();
	}
	
	/**
	 * get User history from server by using email address 
	 * 
	 * @author Tuyendn<tuyendn@vnext.vn>
	 * @since 2013/12/31
	 * */
	private void getUserHistory() {
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
		userService.getInfo(Constant.API_GET_HISTORY, jsonParams);
	}

	@Override
	public void doAfterPostObjectResponse(JSONArray arrayObject) {
		for (int i = 0; i < arrayObject.length(); i++) {
			JSONObject myJsonInfo;
			try {
				myJsonInfo = arrayObject.getJSONObject(i);
				String stringInfo = myJsonInfo.toString();
				Gson gson = new Gson();
				ObjMemberHistory memberHistory = gson.fromJson(stringInfo, ObjMemberHistory.class);
				listMemberHistory.add(memberHistory);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		
		barProgressDialog.dismiss();
		
		myHistoryAdapter = new MyHistoryAdapter(this, listMemberHistory);
		myHistoryListView.setAdapter(myHistoryAdapter);
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
