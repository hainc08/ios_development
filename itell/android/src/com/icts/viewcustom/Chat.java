package com.icts.viewcustom;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.TextView;

import com.icts.adapter.ChatListAdapter;
import com.icts.app.ItelApplication;
import com.icts.control.SwipAdapter;
import com.icts.control.SwipAdapter.OnItemSlideChangedListener;
import com.icts.control.SwipAdapter.OnItemSlideLeftListener;
import com.icts.control.SwipAdapter.OnItemSlideRightListener;
import com.icts.control.SwipListAdapter;
import com.icts.control.SwipListAdapter.ViewHolder;
import com.icts.control.SwipListView;
import com.icts.control.SwipListView.OnSetFinishSwip;
import com.icts.itel.ChatActivity;
import com.icts.itel.MainActivity;
import com.icts.itel.R;
import com.icts.object.FriendObject;
import com.icts.object.MessageObject;
import com.icts.object.User;
import com.icts.utils.Constant;
import com.icts.utils.CountDownTime;
import com.icts.utils.CountDownTime.TimeOutListener;
import com.icts.utils.CountDownTime.UpdateTimeListViewListener;
import com.icts.utils.CountDownTime.UpdateTimeListener;
import com.icts.utils.DatabaseAdapter;
import com.icts.utils.NewMessageCache;
import com.icts.utils.Utils;

public class Chat {
	private final String BACKVIEW_TAG = "Back:Activity"; 
	private DatabaseAdapter database;
	private Context mContext;
	private MainActivity mainActivity;
	private LayoutInflater layoutInflater;
	private View mView = null;
	private ProgressDialog mProgress;
	
	private Handler mHandler = new Handler(){
		public void handleMessage(android.os.Message msg) {
			if (msg.what==0){
				mProgress.dismiss();
				/*countdown.setTimeServer(ItelApplication.timeStamp*1000);
				countdown.setTimeUser(ItelApplication.user.getStatusUpdateTime());
				countdown.calculate();
				countdown.start();
				long time = countdown.getTime();
				if (time>0){
					countdown.addUpdateTimeListener(update);
					countdown.addTimeOutListener(tOut);
				}
				else {
					if (tvTime!=null){
						tvTime.setText("00:00:00");
					}
				}*/
				
				initData();
				initEvent();
			}
		};
	};
	//private CountTime count;
	// User list
	private SwipListView lvUser;
	/*private TextView mTvHour;
	private TextView mTvMinute;
	private TextView mTvSecond;*/
	private TextView tvTime;
	// Icon itell
	private ImageView imgItell;
	private ArrayList<FriendObject> arr;
	private ArrayList<User> mListUser = new ArrayList<User>();
	private ChatListAdapter chatApdapter;
	//private CountDownTime countdown;
	
	private UpdateTimeListViewListener updateLV = new UpdateTimeListViewListener() {
		
		@Override
		public void update(long timeServer, long minute) {
			int first = lvUser.getFirstVisiblePosition();
			int last = lvUser.getLastVisiblePosition();
			for (int i = first;i<=last;i++){
				View v = lvUser.getChildAt(i);
				if (v==null){
					continue;
				}
				ViewHolder holder =(ViewHolder) v.getTag();
				SwipListAdapter adapter = (SwipListAdapter)lvUser.getAdapter();
				long time = Utils.calculate(adapter.timeServer, holder.time, minute);
				if (time<=0){
					holder.tvTime.setText(Constant.THREE_HOUR);
				}
				else {
					long m= time/ 60000;
					holder.tvTime.setText(String.valueOf(m));
				}
			}
			
		}
	};
	
	private UpdateTimeListener update = new UpdateTimeListener() {
		
		@Override
		public void updateText(String s, long timeRemain, TextView tv) {
			if (tvTime!=null){
				tvTime.setText(s);
			}
		}
	};
	
	private TimeOutListener tOut = new TimeOutListener() {
		
		@Override
		public void timeOut() {
			if (tvTime!=null){
				tvTime.setText("00:00:00");
			}
		}
	};
	public Chat(Context context, MainActivity mActivity) {
		database = new DatabaseAdapter(context);
		mContext = context;
		mainActivity = mActivity;
		layoutInflater = (LayoutInflater) context
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		mView = layoutInflater.inflate(R.layout.chat_list, null);
		mProgress = new ProgressDialog(context);
		mProgress.setMessage("Loading...");
		initView();
		//countdown = new CountDownTime();
		if (ItelApplication.user==null){
			mHandler.post(new Runnable() {
				
				@Override
				public void run() {
					mProgress.show();
					ItelApplication.user = Utils.getCheckUser(ItelApplication.uuid);
					mHandler.sendEmptyMessage(0);
				}
			});
		}
		else {
			mHandler.sendEmptyMessage(0);
		}
		
	}

	private void initView() {
		if (mView != null) {
		/*	mTvHour = (TextView) mView.findViewById(R.id.chat_tv_time_hour);
			mTvMinute = (TextView) mView.findViewById(R.id.chat_tv_time_minute);
			mTvSecond = (TextView) mView.findViewById(R.id.chat_tv_time_second);*/
			tvTime = (TextView) mView.findViewById(R.id.chat_tv_time);

			// Change imgage using policy
			imgItell = (ImageView) mView.findViewById(R.id.chat_img_itell);

			// User List
			lvUser = (SwipListView) mView.findViewById(R.id.chat_lv_user);

			ItelApplication.count.addUpdateTimeListener(update);
			ItelApplication.count.addTimeOutListener(tOut);
		}
	}

	private ArrayList<FriendObject> getChatFriends() {
		ArrayList<FriendObject> arr = new ArrayList<FriendObject>();
		FriendObject friend1 = new FriendObject();
		friend1.setFriendID(12);
		friend1.setFriendNick("Khoi ki");
		friend1.setFriendAddress("Ha noi");
		friend1.setMale(true);
		friend1.setFriendiTell("Keke");
		arr.add(friend1);

		FriendObject friend2 = new FriendObject();
		friend2.setFriendID(13);
		friend2.setFriendNick("Hieu xit");
		friend2.setFriendAddress("Ha noi");
		friend2.setMale(true);
		friend2.setFriendiTell("hello");
		arr.add(friend2);
		FriendObject friend3 = new FriendObject();
		friend3.setFriendID(14);
		friend3.setFriendNick("Luong");
		friend3.setFriendAddress("Ha noi");
		friend3.setMale(true);
		friend3.setFriendiTell("tired");
		arr.add(friend3);
		return arr;
	}

	private void initData() {
		database.open();
		// get users in history
		arr = database.getUsers();
		database.close();
		if (NewMessageCache.getCountUSer() > 0) {
			Map<String, List<MessageObject>> Users = NewMessageCache.getUsers();
		}

		// arr = getChatFriends();
		final SwipListAdapter adapter = new SwipListAdapter(mainActivity,
				R.layout.map_list_item, R.id.map_list_tv_name, arr);
		adapter.setOnItemSlideLeftListener(new OnItemSlideLeftListener() {

			public void onItemSlideLeft(View v) {
				ViewHolder holder = (ViewHolder) v.getTag();
				final TextView tvLeft = (TextView) holder.vText
						.findViewById(R.id.list_item_text_left);
				if (tvLeft != null) {
					if (tvLeft.getVisibility() == View.VISIBLE) {
						tvLeft.setVisibility(View.GONE);
					}
				}
				final TextView tvRight = (TextView) holder.vText
						.findViewById(R.id.list_item_text_right);
				if (tvRight != null) {
					if (tvRight.getVisibility() != View.VISIBLE) {
						tvRight.setVisibility(View.VISIBLE);
					}
				}
			}
		});

		adapter.setOnItemSlideRightListener(new OnItemSlideRightListener() {

			public void onItemSlideRight(View v) {
				ViewHolder holder = (ViewHolder) v.getTag();
				final TextView tvLeft = (TextView) holder.vText
						.findViewById(R.id.list_item_text_left);
				if (tvLeft != null) {
					if (tvLeft.getVisibility() != View.VISIBLE) {
						tvLeft.setVisibility(View.VISIBLE);
					}
				}
				final TextView tvRight = (TextView) holder.vText
						.findViewById(R.id.list_item_text_right);
				if (tvRight != null) {
					if (tvRight.getVisibility() == View.VISIBLE) {
						tvRight.setVisibility(View.GONE);
					}
				}
			}
		});

		adapter.setOnItemSlideChangedListener(new OnItemSlideChangedListener() {

			public void onItemSlideChanged(final View v, int direction) {
				ViewHolder holder = (ViewHolder) v.getTag();
				
				SwipListAdapter adapter = (SwipListAdapter) lvUser.getAdapter();
				adapter.setBusy(true);
				TextView tv = (TextView) holder.vContent
						.findViewById(R.id.list_item_text_title);
				if (direction == SwipAdapter.LEFT) {
					holder.vMid.setVisibility(View.GONE);
					holder.vText.setVisibility(View.GONE);
					holder.vContent.setVisibility(View.VISIBLE);
					tv.setText("PROFILE");
					cancelCount();
					lvUser.swip(lvUser.getPositionForView(v), direction);
				}
				if (direction == SwipAdapter.RIGHT) {
					int index = lvUser.getPositionForView(v);
                	FriendObject friend = adapter.getItem(index);
                	if (!Utils.checkValidateTime(ItelApplication.user, friend)){
                		final TextView tvLeft = (TextView) holder.vText
        						.findViewById(R.id.list_item_text_left);
        				if (tvLeft != null) {
        					tvLeft.setVisibility(View.GONE);
        				}
        				final TextView tvRight = (TextView) holder.vText
        						.findViewById(R.id.list_item_text_right);
        				tvRight.setVisibility(View.GONE);
                		tv.setVisibility(View.GONE);
                		holder.vMid.setVisibility(View.VISIBLE);
                		holder.vText.setVisibility(View.GONE);
                		String s = "itell time of friend or yours can be invalid.";
                		Utils.showMessage(mContext, s);
                		adapter.setBusy(false);
                		adapter.resetViewFirstPosition(v);
                		v.clearAnimation();
                		v.requestLayout();
                		return;
                		
                	}
                	holder.vMid.setVisibility(View.GONE);
    				holder.vText.setVisibility(View.GONE);
    				holder.vContent.setVisibility(View.VISIBLE);
					tv.setText("CHAT");
					cancelCount();
					lvUser.swip(lvUser.getPositionForView(v), direction);
				}
			}
		});
		lvUser.setAdapter(adapter);
		if (adapter.getCount()>0){
			//countdown.addUpdateLVListener(updateLV);
			ItelApplication.count.addUpdateLVListener(updateLV);
		}
		lvUser.setClipChildren(false);
		lvUser.setClipToPadding(false);
		lvUser.setDividerHeight(0);
		lvUser.setFinishSwip(new OnSetFinishSwip() {

			@Override
			public void onFinishSwip(int direction, int index) {
				if (direction == SwipAdapter.LEFT) {
					FriendObject friend = adapter.getItem(index);
					ProfileOther profile = new ProfileOther(lvUser.getContext(),
							mainActivity,friend);
					mainActivity.changeViewLL(profile.getmView());
				} else {
					FriendObject friend = adapter.getItem(index);
					ItelApplication.friendChat = friend;
					Intent intent = new Intent(mainActivity, ChatActivity.class);
					Bundle bundle = new Bundle();
					bundle.putString(BACKVIEW_TAG, Constant.CHAT_VIEW);
					intent.putExtras(bundle);
					
					mainActivity.startActivity(intent);
					mainActivity.finish();
					/*if (countdown != null) {
						countdown.cancel();
					}*/
					cancelCount();

				}
			}
		});

		
		if (ItelApplication.user.itellPolicy==Constant.POLICY_ALL){
			imgItell.setImageBitmap(null);
			imgItell.setImageBitmap(Utils.convert2bitmap(mainActivity.getResources().getDrawable(R.drawable.chat_orange_button)));
			//imgItell.setImageBitmap(Utils.convert2bitmap(mainActivity.getResources().getDrawable(R.drawable.chat_pink_button)));
		}
		else if (ItelApplication.user.itellPolicy==Constant.POLICY_FRIEND){
			imgItell.setImageBitmap(null);
			imgItell.setImageBitmap(Utils.convert2bitmap(mainActivity.getResources().getDrawable(R.drawable.chat_pink_button)));
		}
		else if (ItelApplication.user.itellPolicy==Constant.POLICY_OTHER){
			imgItell.setImageBitmap(null);
			imgItell.setImageBitmap(Utils.convert2bitmap(mainActivity.getResources().getDrawable(R.drawable.chat_blue_button)));
			//imgItell.setImageBitmap(Utils.convert2bitmap(mainActivity.getResources().getDrawable(R.drawable.chat_pink_button)));
		}
		else {
			imgItell.setImageBitmap(null);
			imgItell.setImageBitmap(Utils.convert2bitmap(mainActivity.getResources().getDrawable(R.drawable.chat_orange_button)));
			//imgItell.setImageBitmap(Utils.convert2bitmap(mainActivity.getResources().getDrawable(R.drawable.chat_pink_button)));
		}
	}

	private void initEvent() {
		lvUser.setOnItemClickListener(new OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
					long arg3) {
				SwipListAdapter adapter = (SwipListAdapter)lvUser.getAdapter();
				/*FriendObject friend = adapter.getItem(arg2);
				ProfileSetting profile = new ProfileSetting(arg1.getContext(),
						mainActivity,friend);
				mainActivity.changeViewLL(profile.getmView());*/
				FriendObject friend = adapter.getItem(arg2);
				ProfileOther profile = new ProfileOther(arg1.getContext(),
						mainActivity,friend);
				mainActivity.changeViewLL(profile.getmView());

			}
		});
	}

	public View getView() {
		return mView;
	}

	public void setView(View mView) {
		this.mView = mView;
	}
	
	private void cancelCount(){
		ItelApplication.count.removeUpdateTimeListener(update);
		ItelApplication.count.removeTimeOutListener(tOut);
		ItelApplication.count.addUpdateLVListener(null);
	}
	
}
