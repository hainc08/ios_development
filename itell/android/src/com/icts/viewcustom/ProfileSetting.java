package com.icts.viewcustom;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Base64;
import android.util.Log;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.Transformation;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import android.widget.Toast;

import com.icts.app.ItelApplication;
import com.icts.control.SwipAdapter;
import com.icts.itel.CameraActivity;
import com.icts.itel.MainActivity;
import com.icts.itel.R;
import com.icts.object.CompanyObject;
import com.icts.object.FriendObject;
import com.icts.object.User;
import com.icts.utils.Constant;
import com.icts.utils.DownloadImage;
import com.icts.utils.Utils;

public class ProfileSetting {
	private final int TIME_SLIDE_ANIMATION = 500;
	private final int TIME_UP_DOWN_ANIMATION = 1000;
	private final String TAG = "toggle";
	public static Context mContext;
	private MainActivity mainActivity;
	private LayoutInflater layoutInflater;
	private static View mView = null;
	private RelativeLayout rlMemo, rlAlbum, rlContent;
	private Button btnBack;
	private static ImageView imgViewAvatar;
	private User userObject;
	private TextView tvPhone;
	private EditText tvName, tvNickName, tvYear, tvMonth, tvDate;
	private ImageView imgGender, imgSlideGender;
	private ImageView imgPublic, imgSlidePublic;
	private LinearLayout llGender, llOn;
	private Object mObj;
	private String userID;
	private String uuid;
	private boolean isCurrentUser = false;
	private boolean isMale = false;
	private boolean isOn = false;
	private Handler mHandler = new Handler() {
		public void handleMessage(android.os.Message msg) {
			if (msg.what == 0) {
				if (birthday != null) {
					StringTokenizer tokens = new StringTokenizer(birthday, "-");
					tvYear.setText(tokens.nextToken());
					tvMonth.setText(tokens.nextToken());
					tvDate.setText(tokens.nextToken().subSequence(0, 2));
				}
				tvName.setText(userObject.getName());
				tvNickName.setText(userObject.getUserNick());
				tvPhone.setText(userObject.getPhone());
				isOn = userObject.hide_age;

				if (isOn) {
					Drawable d = mainActivity.getResources().getDrawable(
							R.drawable.on_button);
					if (imgPublic != null) {
						imgPublic.setImageBitmap(Utils.convert2bitmap(d));
					}
				} else {
					Drawable d = mainActivity.getResources().getDrawable(
							R.drawable.off_button);
					if (imgPublic != null) {
						imgPublic.setImageBitmap(Utils.convert2bitmap(d));
					}
				}

				if (userObject.isMale()) {
					Drawable d = mainActivity.getResources().getDrawable(
							R.drawable.extra_slide_boy_bg);
					imgGender.setImageBitmap(Utils.convert2bitmap(d));
					isMale = true;
				} else {
					Drawable d = mainActivity.getResources().getDrawable(
							R.drawable.extra_slide_girl_bg);
					imgGender.setImageBitmap(Utils.convert2bitmap(d));
					isMale = false;
				}
				if (userObject.getImageUrl() != null) {
					DownloadImage down = new DownloadImage(imgViewAvatar, 60,
							60, mContext);
					down.execute(userObject.getImageUrl());
				}
				initEventEditText();
			} else if (msg.what == 1) {
				Toast.makeText(mContext, "Cannot find user with id " + userID,
						Toast.LENGTH_LONG).show();
			} else if (msg.what == 3) {
//				imgViewAvatar = null;
//				Toast.makeText(mContext, "Delete image successfully", Toast.LENGTH_SHORT).show();
			} else if (msg.what == 4) {
				Toast.makeText(mContext, "Error when updating",
						Toast.LENGTH_LONG).show();
			}
		};
	};

	public ProfileSetting(Context context, MainActivity mActivity) {
		mContext = context;
		mainActivity = mActivity;
		mObj = null;
		layoutInflater = (LayoutInflater) context
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		mView = layoutInflater.inflate(R.layout.layout_profile_setting, null);
		userID = String.valueOf(ItelApplication.user_id);
		uuid = ItelApplication.uuid;
		isCurrentUser = true;
		initViewComponent4Current();
	}

	public ProfileSetting(Context context, MainActivity mActivity, Object obj) {
		mContext = context;
		mainActivity = mActivity;
		mObj = obj;
		layoutInflater = (LayoutInflater) context
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		mView = layoutInflater.inflate(R.layout.layout_profile_setting, null);
		isCurrentUser = false;
		if (mObj != null) {
			if (mObj instanceof User) {
				userID = ((User) mObj).getUserId();
			} else if (mObj instanceof FriendObject) {
				userID = String.valueOf(((FriendObject) mObj).getFriendID());
			} else if (mObj instanceof CompanyObject) {
				userID = String.valueOf(((CompanyObject) mObj).getmUserId());
			} else {
				userID = String.valueOf(ItelApplication.user_id);
			}
		}
		initViewComponent();
	}

	/**
	 * Initial view
	 */
	private void initViewComponent() {
		rlMemo = (RelativeLayout) mView.findViewById(R.id.relativeLayout5);
		rlMemo.setOnClickListener(onClickComponent);
		btnBack = (Button) mView.findViewById(R.id.btnBack);
		// tvName = (TextView) mView.findViewById(R.id.tv1);
		tvPhone = (TextView) mView.findViewById(R.id.tv2);
		tvName = (EditText) mView.findViewById(R.id.tv4);
		tvNickName = (EditText) mView.findViewById(R.id.tv5);
		tvYear = (EditText) mView.findViewById(R.id.tvYear);
		tvMonth = (EditText) mView.findViewById(R.id.tvMonth);
		tvDate = (EditText) mView.findViewById(R.id.tvDate);
		btnBack.setOnClickListener(onClickComponent);
		imgViewAvatar = (ImageView) mView.findViewById(R.id.avatar);
		imgViewAvatar.setOnClickListener(onClickComponent);
		rlAlbum = (RelativeLayout) mView.findViewById(R.id.relativeLayout6);
		rlAlbum.setOnClickListener(onClickComponent);
		imgPublic = (ImageView) mView.findViewById(R.id.profile_img_on);
		imgPublic.setOnClickListener(onClickComponent);
		loadProfileData();
	}

	/**
	 * Initial view
	 */
	private void initViewComponent4Current() {
		rlContent = (RelativeLayout) mView
				.findViewById(R.id.setting_profile_rl_content);
		rlMemo = (RelativeLayout) mView.findViewById(R.id.relativeLayout5);
		// rlMemo.setOnClickListener(onClickComponent);
		btnBack = (Button) mView.findViewById(R.id.btnBack);
		// tvName = (TextView) mView.findViewById(R.id.tv1);
		tvPhone = (TextView) mView.findViewById(R.id.tv2);
		tvName = (EditText) mView.findViewById(R.id.tv4);
		tvNickName = (EditText) mView.findViewById(R.id.tv5);
		tvYear = (EditText) mView.findViewById(R.id.tvYear);
		tvMonth = (EditText) mView.findViewById(R.id.tvMonth);
		tvDate = (EditText) mView.findViewById(R.id.tvDate);

		btnBack.setOnClickListener(onClickComponent);
		imgViewAvatar = (ImageView) mView.findViewById(R.id.avatar);
		imgViewAvatar.setOnClickListener(onClickComponent);
		rlAlbum = (RelativeLayout) mView.findViewById(R.id.relativeLayout6);
		// rlAlbum.setOnClickListener(onClickComponent);

		llGender = (LinearLayout) mView.findViewById(R.id.profile_gender);
		imgGender = (ImageView) mView.findViewById(R.id.profile_img_gender);
		imgGender.setOnClickListener(onClickComponent);

		imgSlideGender = (ImageView) mView
				.findViewById(R.id.profile_img_slide_gender);

		llOn = (LinearLayout) mView.findViewById(R.id.profile_on_off);
		imgPublic = (ImageView) mView.findViewById(R.id.profile_img_on);
		imgPublic.setOnClickListener(onClickComponent);

		imgSlidePublic = (ImageView) mView
				.findViewById(R.id.profile_img_slide_on);
		imgSlidePublic.setFocusable(true);
		imgSlidePublic.setFocusableInTouchMode(true);

		rlAlbum.setFocusable(true);
		rlAlbum.setFocusableInTouchMode(true);
		handleEvent(rlAlbum);

		rlMemo.setFocusable(true);
		rlMemo.setFocusableInTouchMode(true);
		handleEvent(rlMemo);

		handleScroll(llOn);
		handleScroll(llGender);
		loadProfileData();
	}

	private void loadProfileData() {
		getJsonProfileData();
	}

	/**
	 * get data user profile
	 */
	String birthday;

	private void getJsonProfileData() {
		new Thread(new Runnable() {

			@Override
			public void run() {
				JSONObject jObject;
				jObject = Constant.getJSONfromURL(String.format(
						Constant.SETTING_GET_PROFILE_NEW,
						ItelApplication.user_id + "", ItelApplication.uuid,
						userID));
				if (jObject != null) {
					try {
						userObject = new User();
						String user_data = String.valueOf(jObject
								.getString("user_data"));
						String timestamp = String.valueOf(jObject
								.getString("timestamp"));
						JSONObject json2 = jObject.getJSONObject("user_data");
						if (isCurrentUser) {
							userObject.setUserId(userID);
							userObject.setUuid(uuid);
						}
						userObject.setUserNick((String) json2.get("nick"));
						userObject.setName((String) json2.get("name"));
						userObject.setMale((boolean) json2.getBoolean("gender"));
						userObject.setImageUrl((String) json2.get("avatar"));
						birthday = (String) json2.get("birth");
						userObject.desc = json2.getString("desc");
						userObject.canSearch = json2.getBoolean("can_search");
						userObject.setPhone(json2.getString("mobile_num"));
						userObject.hide_age = json2.getBoolean("hide_age");
						mHandler.sendEmptyMessage(0);
					} catch (JSONException e) {
						mHandler.sendEmptyMessage(1);
						e.printStackTrace();
					}
				}
				mHandler.sendEmptyMessage(0);
			}
		}).start();
	}

	private OnClickListener onClickComponent = new OnClickListener() {

		public void onClick(View v) {
			// TODO Auto-generated method stub
			switch (v.getId()) {
			case R.id.relativeLayout5:
				MemoSetting memo = new MemoSetting(mContext, mainActivity,
						userObject, uuid);
				mainActivity.changeViewLL(memo.getmView());
				break;
			case R.id.btnBack:
				SettingsScreen setting = new SettingsScreen(mContext,
						mainActivity);
				mainActivity.changeViewLL(setting.getmView());
				break;
			case R.id.avatar:
				createPhoto(mContext);
				break;
			case R.id.relativeLayout6:
				int id = Integer.parseInt(userID);
				AlbumSetting album = new AlbumSetting(mContext, mainActivity,
						id);
				mainActivity.changeViewLL(album.getmView());
				break;
			default:
				break;
			}
		}
	};

	private void handleScroll(View v) {
		v.setOnTouchListener(new OnTouchListener() {
            private float xStart;
            private int direction = 0;
            boolean isChange = false;
            private View vItem;
            public boolean onTouch(final View v, MotionEvent event) {
            	 if(event.getAction() == MotionEvent.ACTION_DOWN){
                     direction = 0;
                     vItem = v.findViewWithTag(TAG);
                     xStart = event.getX();
                 }else if(event.getAction() == MotionEvent.ACTION_MOVE){
                     float offsetX = event.getX() - xStart;
                     if (offsetX<-20){
                    	 offsetX = -20;
                     }
                     if(offsetX < 0){
                         if(direction ==0 ){
                             direction = SwipAdapter.LEFT;
                         }
                     }
                    
                     else{
                         direction = 0;
                     }
                     if (offsetX<0){
                    	 LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) vItem.getLayoutParams();
                    	 params.leftMargin = (int) offsetX;
                    	 params.rightMargin = (int) -offsetX;
                    	 vItem.setLayoutParams(params);
                     }
                 }else if(event.getAction() == MotionEvent.ACTION_OUTSIDE || 
                         event.getAction() == MotionEvent.ACTION_CANCEL ||
                         event.getAction() == MotionEvent.ACTION_UP){
                     final LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) vItem.getLayoutParams();
                     final int leftMargin = params.leftMargin;
                     final int rightMargin = params.rightMargin;
                     Log.i("NDT",leftMargin+" left" );
                     Animation slideBackAnimation = new Animation(){
                         @Override
                         protected void applyTransformation(float interpolatedTime, Transformation t) {
                            if(direction == SwipAdapter.LEFT && Math.abs(leftMargin) > 5){
                                 params.leftMargin = (int) (leftMargin - (Constant.SCREEN_WIDTH + leftMargin) * interpolatedTime);
                                 params.rightMargin = -params.leftMargin;
                                 this.setDuration(Math.abs(Constant.SCREEN_WIDTH + leftMargin)*SwipAdapter.TIME_SLIDE_ANIMATION/Constant.SCREEN_WIDTH);
                                 isChange = true;
                             }
                            else{
                                 params.leftMargin = (int) (leftMargin * (1 - interpolatedTime))-3;
                                 params.rightMargin = (int) (rightMargin*(1 - interpolatedTime));
                                 this.setDuration(Math.abs(leftMargin)*SwipAdapter.TIME_SLIDE_ANIMATION/Constant.SCREEN_WIDTH);
                                 isChange = false;
                             }
                            vItem.setLayoutParams(params);
                         };
                     };
                     vItem.startAnimation(slideBackAnimation);
                     slideBackAnimation.setAnimationListener(new AnimationListener() {
                         
                         public void onAnimationStart(Animation animation) {
                             
                         }
                         
                         public void onAnimationRepeat(Animation animation) {
                             
                         }
                         
                         public void onAnimationEnd(Animation animation) {
                             if(isChange){ //&& onItemSlideChangedListener != null){
                            	 if(direction == SwipAdapter.LEFT){
                            		 mHandler.post(new Runnable() {
										
										@Override
										public void run() {
											LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) vItem.getLayoutParams();
		                            		 params.leftMargin = -3;
		                            		 params.rightMargin = 0;
		                            		 vItem.setLayoutParams(params);
		                            		 handleToggle(v);
											
										}
                            		 });
									} else {
										LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) vItem
												.getLayoutParams();
										params.leftMargin = 0;
										params.rightMargin = 0;
										vItem.setLayoutParams(params);
									}
									direction = 0;
								}
                             }
                         });
                     
				}
				return true;
            }
		});
	}

	private void initEventEditText() {
		tvName.addTextChangedListener(new TextWatcher() {

			@Override
			public void onTextChanged(CharSequence s, int start, int before,
					int count) {
				JSONObject js = new JSONObject();
				try {
					js.put("name", s.toString());
					updateData(js.toString());
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}

			@Override
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) {
			}

			@Override
			public void afterTextChanged(Editable s) {

			}
		});

		tvNickName.addTextChangedListener(new TextWatcher() {

			@Override
			public void onTextChanged(CharSequence s, int start, int before,
					int count) {
				JSONObject js = new JSONObject();
				try {
					js.put("nick", s.toString());
					updateData(js.toString());
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}

			@Override
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) {
				// TODO Auto-generated method stub

			}

			@Override
			public void afterTextChanged(Editable s) {

			}
		});

		tvDate.addTextChangedListener(new TextWatcher() {

			@Override
			public void onTextChanged(CharSequence s, int start, int before,
					int count) {
				JSONObject js = new JSONObject();
				try {
					String year = tvYear.getText().toString();
					String month = tvMonth.getText().toString();
					js.put("birth", String.format("%s-%s-%s", year, month,
							s.toString()));
					updateData(js.toString());
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}

			@Override
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) {
				// TODO Auto-generated method stub

			}

			@Override
			public void afterTextChanged(Editable s) {

			}
		});

		tvMonth.addTextChangedListener(new TextWatcher() {

			@Override
			public void onTextChanged(CharSequence s, int start, int before,
					int count) {
				JSONObject js = new JSONObject();
				try {
					String year = tvYear.getText().toString();
					String date = tvDate.getText().toString();
					js.put("birth",
							String.format("%s-%s-%s", year, s.toString(), date));
					updateData(js.toString());
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}

			@Override
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) {
				// TODO Auto-generated method stub

			}

			@Override
			public void afterTextChanged(Editable s) {

			}
		});

		tvYear.addTextChangedListener(new TextWatcher() {

			@Override
			public void onTextChanged(CharSequence s, int start, int before,
					int count) {
				JSONObject js = new JSONObject();
				try {
					String date = tvDate.getText().toString();
					String month = tvMonth.getText().toString();
					js.put("birth", String.format("%s-%s-%s", s.toString(),
							month, date));
					updateData(js.toString());
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}

			@Override
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) {

			}

			@Override
			public void afterTextChanged(Editable s) {

			}
		});
	}
	public void avatarOption(final Context _context){
		AlertDialog.Builder adb = new AlertDialog.Builder(_context);
		adb.setItems(
				_context.getResources().getStringArray(
						R.array.AvatarOption),
				new DialogInterface.OnClickListener() {

					public void onClick(DialogInterface dialog, int which) {
						// TODO Auto-generated method stub
						switch (which) {
						case 0:
							previewPhoto(userObject.getImageUrl());
							break;
						case 1:
							new Thread(){
								@Override
								public void run() {
									boolean c= false;
									c = Utils.deleteAvatar(String.valueOf(ItelApplication.user_id), ItelApplication.uuid);
									if (c){
										//success
										mHandler.sendEmptyMessage(3);
									}
								}
							}.start();
							break;

						default:
							break;
						}
					}
				});
		AlertDialog alertDialog = adb.create();
		alertDialog.show();
	}
	/**
     *  preview image
     * @param url: link to show image
     */
 	private void previewPhoto(String url) {
         final Dialog dia = new Dialog(mContext,R.style.FullScreenDialog);
         dia.setContentView(R.layout.preview_dialog);
         ImageView imageView = (ImageView) dia.findViewById(R.id.profile_preview_imageview);
         Button okButton = (Button) dia.findViewById(R.id.profile_preview_ok_button);
         okButton.setOnClickListener(new OnClickListener() {
             @Override
             public void onClick(View v) {
                 dia.cancel();
             }
         });

         if (url!=null){
             try {
                
                 WindowManager windowManager = mainActivity.getWindowManager();
                 Display display = windowManager.getDefaultDisplay();
                 int mScreenWidth;
                 int mScreenHeight;
                 mScreenWidth = display.getWidth();
                 mScreenHeight = display.getHeight();
  
                 DownloadImage down = new DownloadImage(imageView,mScreenWidth,mScreenHeight,mContext);
                 down.execute(url);
                 dia.show();
             } catch (OutOfMemoryError e) {
                 Toast.makeText(mContext, mContext.getResources().getString(R.string.message_load_image_error), 
                		 		Toast.LENGTH_LONG).show();
                 e.printStackTrace();
             } catch (Exception e) {}
         }
     }

	public void createPhoto(final Context _context) {
		AlertDialog.Builder adb = new AlertDialog.Builder(_context);
		adb.setItems(
				_context.getResources().getStringArray(
						R.array.cameraUploadItems),
				new DialogInterface.OnClickListener() {

					public void onClick(DialogInterface dialog, int which) {
						// TODO Auto-generated method stub
						switch (which) {
						case 0:
							Intent intent = new Intent(_context,
									CameraActivity.class);
							intent.putExtra("INTENT_CAPTURE_AVATAR",
									"avatarPhotoPath");
							((Activity) _context).startActivityForResult(
									intent, Constant.REQUEST_CAMERA_TAKE);
							break;
						case 1:
							Intent intent1 = new Intent(
									Intent.ACTION_GET_CONTENT);
							intent1.setType("image/*");
							((Activity) _context).startActivityForResult(
									intent1, Constant.REQUEST_PHOTO_SELECT);
							break;

						default:
							break;
						}
					}
				});
		AlertDialog alertDialog = adb.create();
		alertDialog.show();

	}

	public static void updateAvatar(Intent data, Activity m) {
		Uri select = data.getData();
		String[] str = { MediaStore.Images.Media.DATA };
		Cursor cursor = m.managedQuery(select, str, null, null, null);
		int coloumn = cursor.getColumnIndex(MediaStore.Images.Media.DATA);
		cursor.moveToFirst();
		String s = cursor.getString(coloumn);
		uploadAvatarToServer(Constant.SETTING_UPLOAD_AVATAR,
				ItelApplication.user_id, ItelApplication.uuid, s, mContext);
		if (s.endsWith(".jpg") || s.endsWith(".jpeg") || s.endsWith(".png")
				|| s.endsWith(".bmp") || s.endsWith(".gif")) {
			try {
				File imgFile = new File(s);
				if (imgFile.exists()) {
					Bitmap myBitmap = BitmapFactory.decodeFile(imgFile
							.getAbsolutePath());
					myBitmap = CameraActivity.scaleImage(myBitmap, 80, 80);
					if (imgViewAvatar == null) {
						imgViewAvatar = (ImageView) mView
								.findViewById(R.id.avatar);
					}
					imgViewAvatar.setImageBitmap(myBitmap);
				}
			} catch (OutOfMemoryError e) {
			}
		}
	}

	private void handleToggle(View v) {
		if (v.getId() == llGender.getId()) {
			isMale = !isMale;
			mHandler.post(new Runnable() {

				@Override
				public void run() {
					if (isMale) {
						Drawable d = mainActivity.getResources().getDrawable(
								R.drawable.extra_slide_boy_bg);
						imgGender.setImageBitmap(Utils.convert2bitmap(d));
					} else {
						Drawable d = mainActivity.getResources().getDrawable(
								R.drawable.extra_slide_girl_bg);
						imgGender.setImageBitmap(Utils.convert2bitmap(d));
					}
				}
			});
			JSONObject js = new JSONObject();

			try {
				js.put("gender", isMale ? 0 : 1);
				updateData(js.toString());
			} catch (JSONException e) {
				e.printStackTrace();
			}

		} else if (v.getId() == llOn.getId()) {
			isOn = !isOn;
			userObject.hide_age = isOn;
			mHandler.post(new Runnable() {

				@Override
				public void run() {
					if (isOn) {
						Drawable d = mainActivity.getResources().getDrawable(
								R.drawable.on_button);
						imgPublic.setImageBitmap(Utils.convert2bitmap(d));
					} else {
						Drawable d = mainActivity.getResources().getDrawable(
								R.drawable.off_button);
						imgPublic.setImageBitmap(Utils.convert2bitmap(d));
					}

				}
			});
			JSONObject js = new JSONObject();

			try {
				js.put("hide_age", isOn?1:0);
				updateData(js.toString());
			} catch (JSONException e) {
				e.printStackTrace();
			}


		}
	}

	private void updateData(final String data) {
		new Thread() {
			@Override
			public void run() {
				boolean c = Utils.updateInfo(userID, uuid, data);
				if (c) {
					// success
					mHandler.sendEmptyMessage(3);
				} else {
					mHandler.sendEmptyMessage(4);
				}
			}
		}.start();
	}

	public static void updateCameraImage(Intent data) {
		String avatarPhotoPath = (String) data.getExtras().get(
				"INTENT_CAPTURE_AVATAR");
		try {
			uploadAvatarToServer(Constant.SETTING_UPLOAD_AVATAR,
					ItelApplication.user_id, ItelApplication.uuid,
					avatarPhotoPath, mContext);
			File imgFile = new File(avatarPhotoPath);
			if (imgFile.exists()) {
				Bitmap myBitmap = BitmapFactory.decodeFile(imgFile
						.getAbsolutePath());
				myBitmap = CameraActivity.scaleImage(myBitmap, 30, 30);
				imgViewAvatar.setImageBitmap(myBitmap);
			}
		} catch (OutOfMemoryError e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateView(String path) {
		try {
			File imgFile = new File(path);
			if (imgFile.exists()) {
				Bitmap myBitmap = BitmapFactory.decodeFile(imgFile
						.getAbsolutePath());
				myBitmap = CameraActivity.scaleImage(myBitmap, 50, 50);
				imgViewAvatar.setImageBitmap(myBitmap);
			}
		} catch (OutOfMemoryError e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public View getmView() {
		return mView;
	}

	public void setmView(View mView) {
		this.mView = mView;
	}

	/**
	 * create slide animation
	 * 
	 * @param v
	 */
	protected void handleEvent(final View v) {
		v.setOnTouchListener(new OnTouchListener() {
			private float xStart;
			private int direction = 0;
			View itemUp = null;
			private boolean slideFinish = false;

			public boolean onTouch(final View v, MotionEvent event) {
				if (event.getAction() == MotionEvent.ACTION_DOWN) {
					direction = 0;
					itemUp = v.findViewWithTag("item_move");
					xStart = event.getX();
				} else if (event.getAction() == MotionEvent.ACTION_MOVE) {
					float offsetX = event.getX() - xStart;
					if (offsetX < 0) {
						if (direction >= 0) {
							direction = SwipAdapter.LEFT;
							// onItemSlideLeftListener.onItemSlideLeft(v);
						}
					} else if (offsetX > 0) {
						if (direction <= 0) {
							direction = SwipAdapter.RIGHT;
						}
					} else {
						direction = 0;
					}
					// if (offsetX<0){
					RelativeLayout.LayoutParams params = (LayoutParams) itemUp
							.getLayoutParams();
					params.leftMargin = (int) offsetX;
					params.rightMargin = (int) -offsetX;
					itemUp.setLayoutParams(params);
					// }
				} else if (event.getAction() == MotionEvent.ACTION_OUTSIDE
						|| event.getAction() == MotionEvent.ACTION_CANCEL
						|| event.getAction() == MotionEvent.ACTION_UP) {
					final RelativeLayout.LayoutParams params = (LayoutParams) itemUp
							.getLayoutParams();
					final int leftMargin = params.leftMargin;
					final int rightMargin = params.rightMargin;
					Animation slideBackAnimation = new Animation() {
						@Override
						protected void applyTransformation(
								float interpolatedTime, Transformation t) {
							if (direction == SwipAdapter.LEFT
									&& Math.abs(leftMargin) > Constant.SCREEN_WIDTH / 3) {
								params.leftMargin = (int) (leftMargin - (Constant.SCREEN_WIDTH + leftMargin)
										* interpolatedTime);
								params.rightMargin = -params.leftMargin;
								this.setDuration(Math.abs(Constant.SCREEN_WIDTH
										+ leftMargin)
										* TIME_SLIDE_ANIMATION
										/ Constant.SCREEN_WIDTH);
								slideFinish = true;
							} else if (direction == SwipAdapter.RIGHT
									&& Math.abs(leftMargin) > Constant.SCREEN_WIDTH / 3) {
								params.leftMargin = (int) (leftMargin + (Constant.SCREEN_WIDTH - leftMargin)
										* interpolatedTime);
								params.rightMargin = -params.leftMargin;
								this.setDuration(Math.abs(Constant.SCREEN_WIDTH
										- leftMargin)
										* TIME_SLIDE_ANIMATION
										/ Constant.SCREEN_WIDTH);
								slideFinish = true;
							} else {
								params.leftMargin = (int) (leftMargin * (1 - interpolatedTime));
								params.rightMargin = (int) (rightMargin * (1 - interpolatedTime));
								this.setDuration(Math.abs(leftMargin)
										* TIME_SLIDE_ANIMATION
										/ Constant.SCREEN_WIDTH);
								slideFinish = false;
							}
							itemUp.setLayoutParams(params);
						};
					};
					itemUp.startAnimation(slideBackAnimation);
					slideBackAnimation
							.setAnimationListener(new AnimationListener() {

								public void onAnimationStart(Animation animation) {

								}

								public void onAnimationRepeat(
										Animation animation) {

								}

								public void onAnimationEnd(Animation animation) {
									if (slideFinish) { // &&
														// onItemSlideChangedListener
														// != null){
										if (direction == SwipAdapter.LEFT) {
											itemUp.setVisibility(View.INVISIBLE);
											// onItemSlideChangedListener.onItemSlideChanged(v,
											// direction);
											// slideAnimation(v);
											upDownAnimation(v);
										} else if (direction == SwipAdapter.RIGHT) {
											// back
											onClickComponent.onClick(btnBack);
										}
									} else {
										final RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) itemUp
												.getLayoutParams();
										params.leftMargin = 50;
										params.rightMargin = 50;
										itemUp.setLayoutParams(params);
									}
									direction = 0;
								}
							});
				}
				return true;
			}
		});
	}

	private void upDownAnimation(View v) {
		v.setVisibility(View.GONE);
		boolean c = false;
		if (rlMemo.getId() != v.getId()) {
			c = true;
			TranslateAnimation animationUp = new TranslateAnimation(
					TranslateAnimation.RELATIVE_TO_SELF, 0,
					TranslateAnimation.RELATIVE_TO_SELF, 0,
					TranslateAnimation.RELATIVE_TO_SELF, 0,
					TranslateAnimation.RELATIVE_TO_PARENT, -1);
			// TranslateAnimation.RELATIVE_TO_SELF, -1);
			ScaleAnimationListener listener = new ScaleAnimationListener(v);
			animationUp.setFillBefore(true);
			animationUp.setAnimationListener(listener);
			animationUp.setDuration(TIME_UP_DOWN_ANIMATION);
			rlMemo.startAnimation(animationUp);
		}
		if (rlAlbum.getId() != v.getId()) {
			TranslateAnimation animationDown = new TranslateAnimation(
					TranslateAnimation.RELATIVE_TO_SELF, 0,
					TranslateAnimation.RELATIVE_TO_SELF, 0,
					TranslateAnimation.RELATIVE_TO_SELF, 0,
					TranslateAnimation.RELATIVE_TO_PARENT, 1);
			// TranslateAnimation.RELATIVE_TO_SELF, Math.abs(tag1-tag));
			animationDown.setDuration(TIME_UP_DOWN_ANIMATION);
			if (!c) {
				ScaleAnimationListener listener = new ScaleAnimationListener(v);
				animationDown.setFillBefore(true);
				animationDown.setAnimationListener(listener);
			}
			c = true;
			rlAlbum.startAnimation(animationDown);
		}

		// up
		TranslateAnimation animationUp = new TranslateAnimation(
				TranslateAnimation.RELATIVE_TO_SELF, 0,
				TranslateAnimation.RELATIVE_TO_SELF, 0,
				TranslateAnimation.RELATIVE_TO_SELF, 0,
				TranslateAnimation.RELATIVE_TO_PARENT, -1);
		// TranslateAnimation.RELATIVE_TO_SELF, -Math.abs(tag1-tag));
		animationUp.setDuration(TIME_UP_DOWN_ANIMATION);
		if (!c) {
			ScaleAnimationListener listener = new ScaleAnimationListener(v);
			animationUp.setFillBefore(true);
			animationUp.setAnimationListener(listener);
		}
		c = true;
		rlContent.startAnimation(animationUp);

	}

	private class ScaleAnimationListener implements AnimationListener {

		private View v;

		public ScaleAnimationListener(View v) {
			this.v = v;
		}

		@Override
		public void onAnimationEnd(Animation animation) {
			if (v != null) {
				onClickComponent.onClick(v);
			}
		}

		@Override
		public void onAnimationRepeat(Animation animation) {

		}

		@Override
		public void onAnimationStart(Animation animation) {

		}
	}

	public static void uploadAvatarToServer(final String urlUpload,
			final int user_id, final String uuid, final String path,
			final Context context) {
		Thread t = new Thread() {
			public void run() {
				Looper.prepare();
				HttpClient httpclient = new DefaultHttpClient();
				HttpPost httppost = new HttpPost(urlUpload);
				FileInputStream in = null;
				try {
					in = new FileInputStream(path);
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				File file = new File(path);
				Bitmap bitmapOrg1 = BitmapFactory.decodeStream(in);
				ByteArrayOutputStream bao1 = new ByteArrayOutputStream();
				bitmapOrg1.compress(Bitmap.CompressFormat.JPEG, 90, bao1);
				byte[] imagearray1 = bao1.toByteArray();
				String ba1 = Base64.encodeToString(imagearray1, Base64.DEFAULT);
				try {
					List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(
							2);
					nameValuePairs.add(new BasicNameValuePair("user_id", String
							.valueOf(user_id)));
					nameValuePairs.add(new BasicNameValuePair("uuid", uuid));
					nameValuePairs.add(new BasicNameValuePair("image", ba1));
					httppost.addHeader(BasicScheme
							.authenticate(new UsernamePasswordCredentials(
									Constant.ITELL_USERNAME_AUTHEN,
									Constant.ITELL_PASS_AUTHEN), "UTF-8", false));
					httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
					HttpResponse response = httpclient.execute(httppost);
					if (response.getStatusLine().getStatusCode() == 200) {
						Toast.makeText(context, "upload avatar successful",
								Toast.LENGTH_SHORT).show();
					}
				} catch (ClientProtocolException e) {
				} catch (IOException e) {
				}
				Looper.loop();
			}
		};
		t.start();
	}
}
