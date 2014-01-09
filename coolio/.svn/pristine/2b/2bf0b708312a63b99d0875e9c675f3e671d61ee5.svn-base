package com.coolio.activity;

import com.coolio.util.Constant;
import com.coolio.R;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class UnsubcribeActivity extends HeaderActivity{
	private TextView txt_user_email;
	private TextView txt_user_password;
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.unsubscribe_view);
		this.tag = Constant.TAG_UNSUBCRIBE;
		View main_view = findViewById(R.id.main_unsub);
		this.configHeaderAndSlideMenu(main_view);
		TextView title = (TextView) findViewById(R.id.top_title);
		title.setText(getResources().getString(R.string.menu_unsubcribe));
		//TextView unsubscribe = (TextView) findViewById(R.id.text_unsub_rule);
		//unsubscribe.setText(getResources().getString(R.string.unsubscribe_rule));
		View btnSearch = main_view.findViewById(R.id.bt_search);
		btnSearch.setVisibility(View.GONE);
		txt_user_email = (TextView ) findViewById(R.id.user_email);
		txt_user_password = (TextView) findViewById(R.id.user_password);

		Button unsubcribe = (Button) findViewById(R.id.btn_unsubcribe);
		unsubcribe.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				if(txt_user_email.getText().length()<=0){
					Log.d("subcribe ", "no user email");
				}
				else {
					if (txt_user_password.getText().length()<=0) {
						Log.d("subcribe", "no password");
					}
					else{
						Log.d("subcribe", "sen request to server");
					}
				}

			}
		});

	}
	//destroy function
	@Override
	public void onDestroy()
	{
		super.onDestroy();
	}
}
