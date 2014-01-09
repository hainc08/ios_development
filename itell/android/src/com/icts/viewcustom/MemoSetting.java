package com.icts.viewcustom;

import java.util.StringTokenizer;

import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.icts.itel.MainActivity;
import com.icts.itel.R;
import com.icts.object.User;
import com.icts.utils.Utils;

public class MemoSetting {
	private Context mContext;
	private MainActivity mainActivity;
	private LayoutInflater layoutInflater;
	private View mView = null;
	private Button btnBack,btnUpdate;
	private User mUser;
	private EditText edContent;
	private String uuid;
	private Handler mHandler = new Handler(){
		public void handleMessage(android.os.Message msg) {
			if (msg.what==3){
				Toast.makeText(mContext, "Update succeed", Toast.LENGTH_LONG).show();
				ProfileSetting profile = new ProfileSetting(mContext,
						mainActivity);
				mainActivity.changeViewLL(profile.getmView());
			}
			else if (msg.what==4){
				Toast.makeText(mContext, "Error when updating", Toast.LENGTH_LONG).show();
			}
		};
	};
	public MemoSetting(Context context, MainActivity mActivity,User user,String uuid) {
		mContext = context;
		mainActivity = mActivity;
		layoutInflater = (LayoutInflater) context
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		mView = layoutInflater.inflate(R.layout.layout_memo, null);
		this.mUser = user;
		this.uuid = uuid;
		initViewComponent();
	}

	void initViewComponent() {
		btnBack = (Button) mView.findViewById(R.id.btnBack);
		btnBack.setOnClickListener(onClickComponent);
		btnUpdate = (Button) mView.findViewById(R.id.memoUpdate);
		btnUpdate.setOnClickListener(onClickComponent);
		edContent = (EditText) mView.findViewById(R.id.editText1);
		edContent.setText(mUser.desc);
	}

	OnClickListener onClickComponent = new OnClickListener() {

		public void onClick(View v) {
			switch (v.getId()) {
			case R.id.btnBack:
				ProfileSetting profile = new ProfileSetting(mContext,
						mainActivity);
				mainActivity.changeViewLL(profile.getmView());

				break;
			case R.id.memoUpdate:
				String s = edContent.getText().toString();
				if (s!=null&s.length()>200){
					Toast.makeText(mContext, "The content cannot over 200 characters.", Toast.LENGTH_LONG).show();
					return;
				}
				
				if (!s.equalsIgnoreCase(mUser.desc)){
					JSONObject js = new JSONObject();
					try {
						js.put("desc", s);
						updateData(js.toString());
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				break;
			default:
				break;
			}
		}
	};

	private void updateData(final String data){
		new Thread(){
			@Override
			public void run() {
				boolean c = Utils.updateInfo(mUser.getUserId(), uuid, data);
				if (c){
					//success
					mHandler.sendEmptyMessage(3);
				}
				else {
					mHandler.sendEmptyMessage(4);
				}
			}
		}.start();
	}
	public View getmView() {
		return mView;
	}

	public void setmView(View mView) {
		this.mView = mView;
	}
}
