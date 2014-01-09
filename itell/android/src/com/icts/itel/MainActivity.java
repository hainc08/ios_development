package com.icts.itel;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gcm.GCMRegistrar;
import com.google.android.maps.MapActivity;
import com.icts.app.ItelApplication;
import com.icts.database.CheckUser;
import com.icts.json.JsonAnalysis;
import com.icts.object.MessageObject;
import com.icts.object.User;
import com.icts.socket.ChatCallbackAdapter;
import com.icts.socket.ChatConnect;
import com.icts.socket.SocketIOException;
import com.icts.utils.Constant;
import com.icts.utils.Constant.ViewMode;
import com.icts.utils.CountDownTime.ChangeMenuListener;
import com.icts.utils.NewMessageCache;
import com.icts.utils.Utils;
import com.icts.viewcustom.AlbumSetting;
import com.icts.viewcustom.Chat;
import com.icts.viewcustom.Friend;
import com.icts.viewcustom.ITell;
import com.icts.viewcustom.Map;
import com.icts.viewcustom.ProfileSetting;
import com.icts.viewcustom.SettingsScreen;

public class MainActivity extends MapActivity {
	private RelativeLayout btnFriend;
	private Button btnSetting;
	private Button btnItell;
	private Button btnMap;
	private RelativeLayout btnChat;
	private TextView tvNewChat;
	private TextView tvNewFriendInvite;

	private LinearLayout llMain;
	public User mUser = new User();
	private CheckUser mCheckUser;

	private ChangeMenuListener changeMenuListener = new ChangeMenuListener() {
		@Override
		public void changeMenu(long frame) {
			if (ItelApplication.user.itellPolicy == Constant.POLICY_ALL) {
				btnItell.setBackgroundDrawable(getResources().getDrawable(
						Constant.ALL_ITELL_BUTTON_IMAGES[(int) frame]));
			} else if (ItelApplication.user.itellPolicy == Constant.POLICY_FRIEND) {
				btnItell.setBackgroundDrawable(getResources().getDrawable(
						Constant.FRIEND_ITELL_BUTTON_IMAGES[(int) frame]));
			} else if (ItelApplication.user.itellPolicy == Constant.POLICY_OTHER) {
				btnItell.setBackgroundDrawable(getResources().getDrawable(
						Constant.OTHER_ITELL_BUTTON_IMAGES[(int) frame]));
			} else {
				btnItell.setBackgroundDrawable(getResources().getDrawable(
						Constant.ALL_ITELL_BUTTON_IMAGES[29]));
			}
		}
	};
	private JsonAnalysis mJsonAlalysis = new JsonAnalysis(this);
	private ChatConnect chatConnect;
	private ITell itell;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		DisplayMetrics displaymetrics = new DisplayMetrics();
		getWindowManager().getDefaultDisplay().getMetrics(displaymetrics);
		Constant.SCREEN_WIDTH = displaymetrics.widthPixels;
		setContentView(R.layout.main);
		initView();
		Bundle b = getIntent().getExtras();
		if (b == null) {
			itell = new ITell(llMain.getContext(), this);
			changeViewLL(itell.getmView());
		} else {
			String view = b.getString("Activity");
			if (view.equalsIgnoreCase("Chat")) {
				Chat chatView = new Chat(llMain.getContext(), MainActivity.this);
				changeViewLL(chatView.getView());
			} else if (view.equalsIgnoreCase("Map")) {
				if (mView == null) {
					LayoutInflater layoutInflater = (LayoutInflater) llMain
							.getContext().getSystemService(
									Context.LAYOUT_INFLATER_SERVICE);
					mView = layoutInflater.inflate(R.layout.map, null);
				}
				Map mapView = new Map(llMain.getContext(), MainActivity.this,
						mView);
				changeViewLL(mapView.getView());
			} else if (view.equalsIgnoreCase("Friend")) {
				Friend friendView = new Friend(llMain.getContext(),
						MainActivity.this);
				changeViewLL(friendView.getmView());
			} else if (view.equalsIgnoreCase("Itell")) {
				ITell itell = new ITell(llMain.getContext(), this);
				changeViewLL(itell.getmView());
				setEvent();
				initData();
			} else if (view.equalsIgnoreCase("Setting")) {
				SettingsScreen setting = new SettingsScreen(
						llMain.getContext(), MainActivity.this);
				changeViewLL(setting.getmView());
			} else {
				ITell itell = new ITell(llMain.getContext(), this);
				changeViewLL(itell.getmView());
			}
		}
		setEvent();
		initData();
		new Thread(){
			public void run() {
				ItelApplication.initSocket(chatCallBackApdapter);
				chatConnect = ItelApplication.getChatConnect();
			}
		}.start();

		
		Utils.d("hieuth", "uuid in MainActivity: " + ItelApplication.uuid);
		// TODO
		// Check registration of push notification
		if (checkRegistrationPush()) {
			String regId = GCMRegistrar.getRegistrationId(this);
			if (regId.equals("")) { // Not registered
				Utils.d("hieuth", "Register device on GCM");
				Intent registrationIntent = new Intent(
						"com.google.android.c2dm.intent.REGISTER");
				registrationIntent.putExtra("app",
						PendingIntent.getBroadcast(this, 0, new Intent(), 0));
				registrationIntent.putExtra("sender", Constant.SENDER_ID);
				startService(registrationIntent);
			}else{
				Utils.d("hieuth", "regID: "+regId);
			}
		}
		/*
		 * new Thread(){ public void run() {
		 * ItelApplication.initSocket(chatCallBackApdapter); chatConnect =
		 * ItelApplication.getChatConnect(); } }.start();
		 */

	}

	/**
	 * Initial view
	 */
	public void initView() {
		btnChat = (RelativeLayout) findViewById(R.id.menu_button_chat);
		btnSetting = (Button) findViewById(R.id.menu_button_setting);
		btnMap = (Button) findViewById(R.id.menu_button_map);
		btnItell = (Button) findViewById(R.id.menu_button_iTell);
		btnFriend = (RelativeLayout) findViewById(R.id.menu_button_friend);
		tvNewChat = (TextView) findViewById(R.id.menu_chat_tv_number);
		tvNewFriendInvite = (TextView) findViewById(R.id.menu_friend_tv_number);

		llMain = (LinearLayout) findViewById(R.id.main_llmain);

		if (!ItelApplication.count.hasChangeMenuListener(changeMenuListener)) {
			ItelApplication.count.addChangeMenuListener(changeMenuListener);
		}

		long frame = ItelApplication.count.getFrame();
		if (ItelApplication.user != null) {
			if (ItelApplication.user.itellPolicy == Constant.POLICY_ALL) {
				btnItell.setBackgroundDrawable(getResources().getDrawable(
						Constant.ALL_ITELL_BUTTON_IMAGES[(int) frame]));
			} else if (ItelApplication.user.itellPolicy == Constant.POLICY_FRIEND) {
				btnItell.setBackgroundDrawable(getResources().getDrawable(
						Constant.FRIEND_ITELL_BUTTON_IMAGES[(int) frame]));
			} else if (ItelApplication.user.itellPolicy == Constant.POLICY_OTHER) {
				btnItell.setBackgroundDrawable(getResources().getDrawable(
						Constant.OTHER_ITELL_BUTTON_IMAGES[(int) frame]));
			} else {
				btnItell.setBackgroundDrawable(getResources().getDrawable(
						Constant.ALL_ITELL_BUTTON_IMAGES[29]));
			}
		} else {
			btnItell.setBackgroundDrawable(getResources().getDrawable(
					Constant.ALL_ITELL_BUTTON_IMAGES[29]));
		}

		/*
		 * ITell itell = new ITell(llMain.getContext(), this);
		 * changeViewLL(itell.getmView());
		 */
		// initData();

	}

	public void displayNumberInMenu(int number, boolean newChat) {
		if (newChat) {
			if (number > 0) {
				tvNewChat.setVisibility(View.VISIBLE);
				tvNewChat.setText(String.valueOf(number));
			} else {
				tvNewChat.setVisibility(View.GONE);
				tvNewChat.setText("0");
			}
		} else {
			if (number > 0) {
				tvNewFriendInvite.setVisibility(View.VISIBLE);
				tvNewFriendInvite.setText(String.valueOf(number));
			} else {
				tvNewFriendInvite.setVisibility(View.GONE);
				tvNewFriendInvite.setText("0");
			}

		}
	}

	/*
	 * 
	 * Init Data
	 */
	public void initData() {
		mCheckUser = new CheckUser(getBaseContext());
		String url = getString(R.string.url_checkUser) + mCheckUser.getUuid();// "80A4FAA6-4012-4789-840B-0A6047D3C207";//
		mJsonAlalysis.executeLoadData(url, handlerLoadData, this, null);
	}

	/*
	 * Set Event
	 */
	public void setEvent() {
		btnChat.setOnClickListener(onClickChat);
		btnFriend.setOnClickListener(onClickFriend);
		btnItell.setOnClickListener(onClickItell);
		btnMap.setOnClickListener(onClickMap);
		btnSetting.setOnClickListener(onClickSetting);

	}

	public OnClickListener onClickChat = new OnClickListener() {

		public void onClick(View v) {
			if (ItelApplication.currentView == ViewMode.CHAT) {
				return;
			}
			destroyMap();
			ItelApplication.currentView = ViewMode.CHAT;
			/*
			 * btnFriend
			 * .setBackgroundResource(R.drawable.menu_friend_button_selector);
			 * btnChat
			 * .setBackgroundResource(R.drawable.menu_chat_button_active);
			 * btnSetting
			 * .setBackgroundResource(R.drawable.menu_setting_button_selector);
			 * btnMap
			 * .setBackgroundResource(R.drawable.menu_map_button_selector);
			 */
			btnFriend.setSelected(false);
			btnChat.setSelected(true);
			btnMap.setSelected(false);
			btnSetting.setSelected(false);
			Chat chatView = new Chat(MainActivity.this, MainActivity.this);
			changeViewLL(chatView.getView());

		}
	};
	public OnClickListener onClickFriend = new OnClickListener() {

		public void onClick(View v) {
			if (ItelApplication.currentView == ViewMode.FRIEND) {
				return;
			}
			destroyMap();
			ItelApplication.currentView = ViewMode.FRIEND;
			btnFriend.setSelected(true);
			btnChat.setSelected(false);
			btnMap.setSelected(false);
			btnSetting.setSelected(false);
			/*
			 * btnFriend
			 * .setBackgroundResource(R.drawable.menu_friend_button_active);
			 * btnChat
			 * .setBackgroundResource(R.drawable.menu_chat_button_selector);
			 * btnSetting
			 * .setBackgroundResource(R.drawable.menu_setting_button_selector);
			 * btnMap
			 * .setBackgroundResource(R.drawable.menu_map_button_selector);
			 */

			Friend friendView = new Friend(MainActivity.this, MainActivity.this);
			changeViewLL(friendView.getmView());

		}
	};
	public OnClickListener onClickSetting = new OnClickListener() {

		public void onClick(View v) {
			if (ItelApplication.currentView == ViewMode.SETTING) {
				return;
			}
			destroyMap();
			ItelApplication.currentView = ViewMode.SETTING;
			/*
			 * btnFriend
			 * .setBackgroundResource(R.drawable.menu_friend_button_selector);
			 * btnChat
			 * .setBackgroundResource(R.drawable.menu_chat_button_selector);
			 * btnSetting
			 * .setBackgroundResource(R.drawable.menu_setting_button_active);
			 * btnMap
			 * .setBackgroundResource(R.drawable.menu_map_button_selector);
			 */
			btnFriend.setSelected(false);
			btnChat.setSelected(false);
			btnMap.setSelected(false);
			btnSetting.setSelected(true);
			SettingsScreen setting = new SettingsScreen(MainActivity.this,
					MainActivity.this);
			changeViewLL(setting.getmView());
		}
	};
	private View mView = null;
	private Map mapView = null;

	private void destroyMap() {
		if (ItelApplication.currentView == ViewMode.MAP) {
			if (mapView != null) {
				mapView.destroy();
			}
		}
	}

	public OnClickListener onClickMap = new OnClickListener() {

		public void onClick(View v) {
			if (ItelApplication.currentView == ViewMode.MAP) {
				return;
			}
			/*
			 * btnFriend
			 * .setBackgroundResource(R.drawable.menu_friend_button_selector);
			 * btnChat
			 * .setBackgroundResource(R.drawable.menu_chat_button_selector);
			 * btnSetting
			 * .setBackgroundResource(R.drawable.menu_setting_button_selector);
			 * btnMap.setBackgroundResource(R.drawable.menu_map_button_active);
			 */
			btnFriend.setSelected(false);
			btnChat.setSelected(false);
			btnMap.setSelected(true);
			btnSetting.setSelected(false);
			// if (mView == null) {
			LayoutInflater layoutInflater = (LayoutInflater) MainActivity.this
					.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			mView = layoutInflater.inflate(R.layout.map, null);
			// }
			mapView = new Map(MainActivity.this, MainActivity.this, mView);
			changeViewLL(mapView.getView());
			ItelApplication.currentView = ViewMode.MAP;
		}
	};
	public OnClickListener onClickItell = new OnClickListener() {

		public void onClick(View v) {
			if (ItelApplication.currentView == ViewMode.ITELL) {
				return;
			}
			destroyMap();
			/*
			 * btnFriend
			 * .setBackgroundResource(R.drawable.menu_friend_button_selector);
			 * btnChat
			 * .setBackgroundResource(R.drawable.menu_chat_button_selector);
			 * btnSetting
			 * .setBackgroundResource(R.drawable.menu_setting_button_selector);
			 * btnMap
			 * .setBackgroundResource(R.drawable.menu_map_button_selector);
			 */
			btnFriend.setSelected(false);
			btnChat.setSelected(false);
			btnMap.setSelected(false);
			btnSetting.setSelected(false);
			setContentView(R.layout.main);
			initView();

			ITell itell = new ITell(llMain.getContext(), MainActivity.this);
			changeViewLL(itell.getmView());

			setEvent();
			initData();
			ItelApplication.currentView = ViewMode.ITELL;
		}
	};

	// add View
	public void changeViewLL(View view) {
		llMain.removeAllViews();
		LayoutParams pParrams = new LayoutParams(
				ViewGroup.LayoutParams.FILL_PARENT,
				ViewGroup.LayoutParams.FILL_PARENT);
		llMain.addView(view, pParrams);

	}

	@Override
	public boolean onKeyDown(int pKeyCode, KeyEvent pEvent) {
		if (pKeyCode == KeyEvent.KEYCODE_HOME
				&& pEvent.getAction() == KeyEvent.ACTION_DOWN) {

		} else if (pKeyCode == KeyEvent.KEYCODE_BACK
				&& pEvent.getAction() == KeyEvent.ACTION_DOWN) {
			showExitDialog();

			return true;
		}
		return super.onKeyDown(pKeyCode, pEvent);
	}

	// /////////////////////////////
	public void showExitDialog() {
		AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
		builder.setMessage("Are you sure you want to exit?")
				.setCancelable(false)
				.setTitle("EXIT")
				.setPositiveButton("Yes",
						new DialogInterface.OnClickListener() {
							public void onClick(DialogInterface dialog, int id) {

								MainActivity.this.finish();
							}
						})
				.setNegativeButton("No", new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int id) {
						dialog.cancel();
					}
				});

		AlertDialog alert = builder.create();
		alert.setIcon(R.drawable.ic_launcher);
		alert.show();
	}

	@Override
	protected boolean isRouteDisplayed() {
		return false;
	}

	/**
	 * 
	 * Handler doi load data tu server
	 */
	final Handler handlerLoadData = new Handler() {
		public void handleMessage(Message msg) {
			int total = msg.getData().getInt("total");
			String data = msg.getData().getString("data");
			boolean exeption = msg.getData().getBoolean("exeption");
			if (total >= 0) {
				if (exeption) {
					try {
						mUser = mJsonAlalysis.getUser(data);
						if (mUser != null) {
							Log.i("NDT", "Main activity load success");
							mUser.setUuid(mCheckUser.getUuid());
							// mUser.setUuid("ccf4766507a1b47bbc321fa995687d6a");
							// mUser.setUserId(Integer.toString(14));
							// mUser.setUserId("233544");
							// mUser.setUuid("0F689D79-0454-49CB-93D7-CD55845A93EA");
							ItelApplication.user = mUser;
							ItelApplication.timeStamp = mUser.getmTimeCurrent();
							if (!String.valueOf(ItelApplication.user_id)
									.equalsIgnoreCase(mUser.getUserId())) {
								mCheckUser.addserId(mUser.getUserId());
								ItelApplication.user_id = Integer
										.parseInt(mUser.getUserId());
							}

							ItelApplication.uuid = mUser.getUuid();
							ItelApplication
									.setTime(mUser.getStatusUpdateTime());
							ItelApplication.count.setUpdate(true);
						} else {
							Toast.makeText(
									MainActivity.this,
									"Cannot find this user with user id"
											+ ItelApplication.user_id + " "
											+ ItelApplication.uuid,
									Toast.LENGTH_LONG).show();
						}
					} catch (JSONException e) {
						Toast.makeText(
								MainActivity.this,
								"Cannot find this user with user id"
										+ ItelApplication.user_id + " error "
										+ e.getMessage(), Toast.LENGTH_LONG)
								.show();
						e.printStackTrace();
					}
				} else {
					Toast.makeText(
							MainActivity.this,
							"Cannot find this user with user id"
									+ ItelApplication.user_id + " "
									+ ItelApplication.uuid, Toast.LENGTH_LONG)
							.show();
				}
			} else if (msg.what == 2) {
				// MessageObject obj = msg.getData().getParcelable("Message");
				// Toast.makeText(MainActivity.this,
				// String.format("New message from %s to %s with content %s",
				// obj.getSenderID(),obj.getReceiverID(),obj.getMessage()),
				// Toast.LENGTH_LONG).show();
				handlerLoadData.post(new Runnable() {

					@Override
					public void run() {
						displayNumberInMenu(
								NewMessageCache.getCountNewMessage(), true);
					}
				});

			}
		}
	};

	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (data != null) {
			if (requestCode == Constant.REQUEST_PHOTO_SELECT) {
				ProfileSetting.updateAvatar(data, MainActivity.this);
			} else if (requestCode == Constant.REQUEST_CAMERA_TAKE) {
				ProfileSetting.updateCameraImage(data);
			} else if (requestCode == 6) {
				AlbumSetting album = new AlbumSetting(this, MainActivity.this,
						ItelApplication.user_id);
				album.updateAvatar(data, MainActivity.this);
			}
		}
	};

	private void initSocket(ChatCallbackAdapter chatCallBackAdapter) {
		boolean c = Utils.getServerInfo(ItelApplication.user_id,
				ItelApplication.uuid);
		String s = ItelApplication.server;
		if (s != null) {
			s = "http://" + s.trim();
			if ((chatConnect == null)
					|| ((chatConnect != null) && (!chatConnect.getSocket()
							.isConnected()))) {
				chatConnect = new ChatConnect(chatCallBackAdapter, s);
				chatConnect.start();
			}
		}
	}

	private boolean join = false;
	private ChatCallbackAdapter chatCallBackApdapter = new ChatCallbackAdapter() {

		@Override
		public void onMessage(JSONObject json) {
			Log.i("NDT", "on message 1 " + json.toString());
		}

		@Override
		public void onMessage(String message) {
			Log.i("NDT", "on message 2 " + message);
		}

		@Override
		public void onDisconnect() {
			Log.i("NDT", "on Disconnect ");
			join = false;
		}

		@Override
		public void onConnectFailure(SocketIOException socketIOException) {

		}

		@Override
		public void onConnect() {
			if (!join) {
				chatConnect.joinServer(String.valueOf(ItelApplication.user_id),
						ItelApplication.uuid);
				Log.i("NDT", "join server ");
			}
			join = true;
		}

		@Override
		public void on(String event, String data) {
		}

		@Override
		public void on(String event, JSONObject data) {
			try {
				if (event.equals("logout")) {
					String user = data.getString("user");
					if (user.equalsIgnoreCase(String
							.valueOf(ItelApplication.user_id))) {
						join = false;
						chatConnect.getSocket().reconnect();
					}
				} else if (event.equalsIgnoreCase("message")) {
					final MessageObject message = Utils.getMessage(data);
					message.setTimestamp(data.getLong("timestamp"));
					NewMessageCache.addMessageToCache(message,
							String.valueOf(ItelApplication.user_id));
					Log.i("NDT",
							"new message "
									+ NewMessageCache.getCountNewMessage()
									+ " " + message.getMessage());
					// if (BuildConfig.DEBUG){
					// Log.i("NDT","new message "+NewMessageCache.getCountNewMessage()+" "+message.getMessage());
					// }
					Message msg = Message.obtain();
					msg.what = 2;
					Bundle b = new Bundle();
					b.putParcelable("Message", message);
					msg.setData(b);

					handlerLoadData.sendMessage(msg);
				}
			} catch (Exception ex) {
				Log.i("NDT", "error on " + ex.getMessage());
			}
		}

		@Override
		public void callback(JSONArray data) throws JSONException {
			if (join) {
				Log.i("NDT", "callback1 join" + data.toString());
			} else {
				Log.i("NDT", "callback1 " + data.toString());
			}
		}
	};

	/*
	 * private Messenger messenger = null;
	 * 
	 * private Handler handler = new Handler() { public void
	 * handleMessage(Message message) { Bundle data = message.getData(); if
	 * (message.arg1 == Activity.RESULT_OK && data != null) { String text = data
	 * .getString(SocketService.DATA); Log.i("NDT", "text1"+ text); } } };
	 * 
	 * private void startService(){ Intent intent = null; //intent = new
	 * Intent(this, SocketService.class); intent = new
	 * Intent(SocketService.class.getName()); // Create a new Messenger for the
	 * communication back // From the Service to the Activity Messenger
	 * messenger = new Messenger(handler); intent.putExtra("MESSENGER",
	 * messenger);
	 * 
	 * this.startService(intent); //bindService(intent, serviceConnect,
	 * Context.BIND_AUTO_CREATE); }
	 * 
	 * public void stopService(){ Intent intent = null; //intent = new
	 * Intent(this, SocketService.class); intent = new
	 * Intent(SocketService.class.getName()); this.stopService(intent);
	 * //unbindService(serviceConnect); }
	 * 
	 * public void test(){ Message msg = Message.obtain();
	 * 
	 * try { Bundle bundle = new Bundle();
	 * bundle.putString(SocketService.USER_ID, "123456 ");
	 * bundle.putString(SocketService.UUID, "abcd"); msg.setData(bundle);
	 * messenger.send(msg); } catch (RemoteException e) { e.printStackTrace(); }
	 * catch (Exception r){
	 * 
	 * } }
	 */
	public void countDowTime(long time) {
		CountDownTimer cont = new CountDownTimer(time * 1000, 1000) {
			@Override
			public void onTick(long millisUntilFinished) {
				Log.e("", "timeeeeee===" + millisUntilFinished);
				// if ((millisUntilFinished / 1000 % 60) < 10) {
				// String time2 = millisUntilFinished / 60000 + ":0"
				// + (millisUntilFinished / 1000) % 60;
				// itell.mTvCancel.setText(time2);
				// } else {
				// String time2 = millisUntilFinished / 60000 + ":"
				// + (millisUntilFinished / 1000) % 60;
				// itell.mTvCancel.setText(time2);
				// }
				Log.e("",
						"second===="
								+ ((millisUntilFinished - (millisUntilFinished / 3600 * 3600))));
				if ((millisUntilFinished / 1000 % 60) < 10) {
					String time2 = "0"
							+ (millisUntilFinished / 3600000)
							+ ":0"
							+ ((millisUntilFinished - (millisUntilFinished / 3600 * 3600)) / 60000)
							+ ((millisUntilFinished - (millisUntilFinished / 3600 * 3600)) % 60000);
					// itell.mTvCancel.setText(time2);
				} else {
					String time2 = "0"
							+ (millisUntilFinished / 3600000)
							+ ":0"
							+ ((millisUntilFinished - (millisUntilFinished / 3600 * 3600)) / 60000)
							+ ((millisUntilFinished - (millisUntilFinished / 3600 * 3600)) % 60000);
					// itell.mTvCancel.setText(time2);
				}
				// if (mCheckUser.getStaminar() >= sObjUser.getStaminaMax()) {
				// this.onFinish();
				// }

			}

			@Override
			public void onFinish() {
				// itell.mTvCancel.setText("00:00:00");
				// AddTeam.mModeClick = true;
				// ObjUser objUser = MonterActivity.mUserData.getUserInfo();
				// int staminar = mCheckUser.getStaminar() + 1;
				// if (staminar <= objUser.getStaminaMax()) {
				// mCheckUser.addStaminar(staminar);
				// }
				// mCheckUser.addTimeStaminar(180000);
				// mTxtStaminar.setText(mCheckUser.getStaminar() + "/"
				// + objUser.getStaminaMax());
				// objUser.setStamina(mCheckUser.getStaminar());
				// mTxtTimeStaminar.setText("3:00");
				// MonterActivity.mProBarStaminar
				// .setMax(objUser.getStaminaMax() * 30);
				// MonterActivity.mProBarStaminar.setProgress(mCheckUser
				// .getStaminar() * 30);
				// sModeStamina = false;
				// if (mCheckUser.getStaminar() <= sObjUser.getStaminaMax()) {
				// mCheckUser.addCountStamina(1);
				// getTimeStaminar();
				// }
			}
		}.start();
	}

	private boolean checkRegistrationPush() {
		try {
			GCMRegistrar.checkDevice(this);
			GCMRegistrar.checkManifest(this);
		} catch (Exception e) {
			Utils.d("hieuth",
					"Device is not supported push notification" + e.toString());
			return false;
		}
		return true;
	}
}
