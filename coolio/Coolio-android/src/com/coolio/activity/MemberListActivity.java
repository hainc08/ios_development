package com.coolio.activity;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import android.widget.TextView;

import com.coolio.R;
import com.coolio.adapter.MemberViewAdapter;
import com.coolio.baseinterface.IAfterRequestResponseJsonObject;
import com.coolio.model.ObjMemberInfo;
import com.coolio.service.UserService;
import com.coolio.util.Constant;
import com.coolio.util.Utility;
import com.google.gson.Gson;

public class MemberListActivity extends HeaderActivity implements IAfterRequestResponseJsonObject{
	private GridView gridView;
	private MemberViewAdapter memberAdapter;
	private ArrayList<ObjMemberInfo> listMember;
	private static ProgressDialog barProgressDialog;
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.member_view);
		this.tag = Constant.TAG_MEMBER;
		
		//show waiting
		showBarProgress();
		//config left menu and header
		View main_view = findViewById(R.id.main_member);
		this.configHeaderAndSlideMenu(main_view);
		//set title
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.member_title));
		//config view
		listMember = new ArrayList<ObjMemberInfo>();
		gridView =(GridView) findViewById(R.id.gridView);
		//get data from server
		this.getMember();
		gridView.setOnItemClickListener(new OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> parent, View v,
					int position, long id) {
				//Intent intent = new Intent(MemberListActivity.this,MemberDetailActivity.class);
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
	private void getMember() {
		// get data friend from server
		UserService userService = new UserService(this);
		
		// add parameters for using when request to server
		JSONObject jsonParams = new JSONObject();
		try {
			jsonParams.put("email", LoginActivity.myInfo.getEmail());
			jsonParams.put("myAge",  String.valueOf(LoginActivity.myInfo.getAge()));
		} catch (JSONException e) {
			e.printStackTrace();
		}

		// get user history by using email
		userService.getInfo(Constant.API_GET_HISTORY, jsonParams);
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
				listMember.add(member);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		memberAdapter = new MemberViewAdapter(this, listMember );
		gridView.setAdapter(memberAdapter);
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
		Utility.showDialogAlert(MemberListActivity.this.getResources().getString(R.string.error),MemberListActivity.this.getResources().getString(R.string.error_message),MemberListActivity.this);
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
		Utility.showDialogAlert(MemberListActivity.this.getResources().getString(R.string.error),MemberListActivity.this.getResources().getString(R.string.error_message),MemberListActivity.this);
	}

	//destroy function
	@Override
    public void onDestroy()
    {
        super.onDestroy();
    }

}
