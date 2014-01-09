package com.coolio.activity;

import com.coolio.util.Constant;
import com.coolio.R;

import thirdparty.TextViewEx;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class TermAndPolicyActivity extends HeaderActivity{
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.term_policy_view);
		this.tag = Constant.TAG_TERM;
		View main_view = findViewById(R.id.main_term);
		this.configHeaderAndSlideMenu(main_view);
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.menu_term));
		TextViewEx term = (TextViewEx) findViewById(R.id.text_policy);
		term.setText(getResources().getString(R.string.term_policy),true);
		View btnSearch = main_view.findViewById(R.id.bt_search);
		btnSearch.setVisibility(View.GONE);
	}
	//destroy function
	@Override
	public void onDestroy()
	{
		super.onDestroy();
	}
}
