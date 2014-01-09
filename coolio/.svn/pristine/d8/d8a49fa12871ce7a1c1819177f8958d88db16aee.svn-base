package com.coolio.activity;

import java.util.ArrayList;

import com.coolio.adapter.FootprintAdapter;
import com.coolio.model.ObjMember;
import com.coolio.util.Constant;
import com.coolio.R;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView;

public class FootPrintActivity extends HeaderActivity{
	private FootprintAdapter myfriend_adapter;
	private ArrayList<ObjMember> list_foot;
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.footprint_view);
		this.tag = Constant.TAG_FOOTPRINT;
		View main_view = findViewById(R.id.main_footprint);
		this.configHeaderAndSlideMenu(main_view);
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.menu_footprint));
		ListView listview_friend = (ListView) findViewById(R.id.list_footprint);
		list_foot = getMember();
		myfriend_adapter = new FootprintAdapter(this ,list_foot);
		listview_friend.setAdapter(myfriend_adapter);
		listview_friend.setOnItemClickListener(new OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
				//Intent intent = new Intent(ChatListActivity.this,MemberDetailActivity.class);
				//startActivity(intent);
			}
		});
		
	}
	private ArrayList<ObjMember> getMember(){
		final ArrayList<ObjMember> list_member = new ArrayList<ObjMember>();
		for(int i =0;i<5;i++){
			//Bitmap bitmap = BitmapFactory.decodeResource(getResources(), R.drawable.avatar_main);
			//list_member.add(new ObjMember(bitmap, "Member_#" + i, "ID#" + i));
		}
		return list_member;
	}
}
