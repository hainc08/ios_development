package com.coolio.activity;

import com.coolio.util.Constant;
import com.coolio.R;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class PassLockActivity extends HeaderActivity{
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.passlock_view);
		View main_view = findViewById(R.id.main_passlock);
		this.tag = Constant.TAG_PASSLOCK;
		this.configHeaderAndSlideMenu(main_view);
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.menu_passlock));
		
		
	}
	
}
