package com.coolio.activity;

import com.coolio.model.ObjMember;
import com.coolio.util.Constant;
import com.coolio.R;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class MemberDetailActivity extends HeaderActivity{
	public static ObjMember s_member;
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.member_detail);
		this.tag = Constant.TAG_MEMBER;
		View main_view = findViewById(R.id.main_member_detail);
		this.configHeaderAndSlideMenu(main_view);
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.member_detail));
		//MemberItem member = MemberDetailActivity.s_member;
		//final ImageView member_image = (ImageView) findViewById(R.id.member_image);
		//member_image.setImageBitmap(member.getImage());
	}
	//destroy function
		@Override
	    public void onDestroy()
	    {
	        super.onDestroy();
	    }
}
