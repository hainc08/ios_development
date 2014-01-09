package com.icts.viewcustom;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.icts.itel.ChatActivity;
import com.icts.itel.R;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.provider.ContactsContract;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import android.view.animation.TranslateAnimation;
import android.view.animation.Animation.AnimationListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.icts.adapter.FriendAdapter;
import com.icts.app.ItelApplication;
import com.icts.control.SwipAdapter;
import com.icts.control.SwipListAdapter;
import com.icts.control.SwipAdapter.OnItemSlideChangedListener;
import com.icts.control.SwipAdapter.OnItemSlideLeftListener;
import com.icts.control.SwipAdapter.OnItemSlideRightListener;
import com.icts.control.SwipListAdapter.ViewHolder;
import com.icts.control.SwipListView;
import com.icts.control.SwipListView.OnSetFinishSwip;
import com.icts.database.CheckUser;
import com.icts.itel.MainActivity;
import com.icts.json.JsonAnalysis;
import com.icts.object.FriendObject;
import com.icts.object.ObjContact;
import com.icts.utils.Constant;
import com.icts.utils.Utils;

public class Friend {
	private View mView = null;
	private LayoutInflater layoutInflater;
	private Context mContext;
	private TextView mTxtCoin;
	private Button mBtnFriend;
	private Button mBtnSearch;
	private Button mBtnInvite;
	private EditText mEditText;
	private SwipListView mListViewOfInvited;
	private SwipListView mListViewFriendContac;
	private LinearLayout mLLOfInvited;
	private LinearLayout mLLFriendContact;
	private RelativeLayout mRlL1;
	private ArrayList<FriendObject> mListObjFriend = new ArrayList<FriendObject>();
	private ArrayList<FriendObject> mListObjFriendContact = new ArrayList<FriendObject>();
	private MainActivity mainActivity;
	JsonAnalysis mJsonAlalysis;// = new JsonAnalysis(mContext);
	private CheckUser mCheckUser;
	private Context mContextBtnSearch;
	private TextView mTvLoadMore;
	private TextView mTvLoadMore2;
	private int mPage = 1;
	private int mPageFriendContact = 1;
	private int mPageFriendInvite = 1;
	private FriendAdapter mFriendAdapter;
	private ArrayList<ObjContact> mListContact = new ArrayList<ObjContact>();
	private final int TIME_SLIDE_ANIMATION = 500;
	private final int TIME_UP_DOWN_ANIMATION = 1000;

	public Friend(Context context, MainActivity activity) {
		mContext = context;
		mainActivity = activity;
		layoutInflater = (LayoutInflater) context
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		mView = layoutInflater.inflate(R.layout.friend_search, null);

		initView();
		initData();
		setEvent();
	}

	public void initView() {
		mListViewOfInvited = (SwipListView) mView
				.findViewById(R.id.friendSearch_listView1);
		mListViewFriendContac = (SwipListView) mView
				.findViewById(R.id.friendSearch_listView2);
		mRlL1 = (RelativeLayout) mView.findViewById(R.id.relativeLayout22);
		mBtnFriend = (Button) mView.findViewById(R.id.friendSearch_btnFriend);
		mBtnSearch = (Button) mView.findViewById(R.id.friendSearch_btnSearch);
		mEditText = (EditText) mView.findViewById(R.id.friendSearch_editText);
		// mBtnInvite = (Button)
		// mView.findViewById(R.id.friendSearch_btnInvite);
		mLLOfInvited = (LinearLayout) mView.findViewById(R.id.friendSearch_ll1);
		mTvLoadMore = new TextView(mContext);
		mTvLoadMore.setText("Load More");
		mTvLoadMore.setGravity(Gravity.CENTER);
		mTvLoadMore.setHeight(90);
		mListViewOfInvited.addFooterView(mTvLoadMore);
		mTvLoadMore2 = new TextView(mContext);
		mTvLoadMore2.setText("Load More");
		mTvLoadMore2.setGravity(Gravity.CENTER);
		mTvLoadMore2.setHeight(90);
		mListViewFriendContac.addFooterView(mTvLoadMore2);

		// //
		mRlL1.setFocusable(true);
		mRlL1.setFocusableInTouchMode(true);
		handleEvent(mRlL1);

	}

	public void getContact(List<ObjContact> list) {
		Cursor phones = mainActivity.getContentResolver().query(
				ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null,
				null, null);
		mainActivity.startManagingCursor(phones);
		if (phones != null) {
			int count = 0;
			while (phones.moveToNext()) {
				count++;
				String name = phones
						.getString(phones
								.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME));
				String phoneNumber = phones
						.getString(phones
								.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));
				String mail = phones
						.getString(phones
								.getColumnIndex(ContactsContract.CommonDataKinds.Email.DATA));
				ObjContact objContact = new ObjContact();
				objContact.setmNumber(phoneNumber);
				objContact.setmName(name);
				objContact.setmMail(mail);
				list.add(objContact);
			}
		}
		phones.close();
	}

	public void initData() {

		mCheckUser = new CheckUser(mContext);
		if (mCheckUser.getContact()) {
			showDialog();

		} else {
			loadData();
		}

	}

	public void loadData() {
		mJsonAlalysis = new JsonAnalysis(mContext);

		String url = mainActivity.getString(R.string.url_contactFriend);
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
		nameValuePairs.add(new BasicNameValuePair("user_id",
				ItelApplication.user.getUserId()));// isp
		// authen_code
		nameValuePairs.add(new BasicNameValuePair("uuid", ItelApplication.user
				.getUuid()));
		// nameValuePairs.add(new BasicNameValuePair("keyword", "mau"));
		nameValuePairs.add(new BasicNameValuePair("page", Integer
				.toString(mPageFriendContact)));

		// ////
		// String urlInvite = mainActivity.getString(R.string.url_listInvite);
		// List<NameValuePair> nameValuePairs2 = new
		// ArrayList<NameValuePair>(2);
		// nameValuePairs2.add(new BasicNameValuePair("user_id", "14"));// isp
		// // authen_code
		// nameValuePairs2.add(new BasicNameValuePair("uuid",
		// "ccf4766507a1b47bbc321fa995687d6a"));
		// nameValuePairs.add(new BasicNameValuePair("keyword", "mau"));
		// nameValuePairs2.add(new BasicNameValuePair("page", Integer
		// .toString(mPageFriendContact)));
		mJsonAlalysis.executeLoadData(url, handlerLoadFriendCantact, mContext,
				nameValuePairs);
		++mPageFriendContact;
	}

	public void setEvent() {
		mTvLoadMore.setOnClickListener(new View.OnClickListener() {

			public void onClick(View arg0) {
				mContextBtnSearch = arg0.getContext();
				mJsonAlalysis = new JsonAnalysis(mContext);

				String url = mainActivity
						.getString(R.string.url_listfriend_search);
				List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(
						2);
				nameValuePairs.add(new BasicNameValuePair("user_id",
						ItelApplication.user.getUserId()));// isp
				// authen_code
				nameValuePairs.add(new BasicNameValuePair("uuid",
						ItelApplication.user.getUuid()));
				nameValuePairs.add(new BasicNameValuePair("keyword", mEditText
						.getText().toString()));
				nameValuePairs.add(new BasicNameValuePair("page", Integer
						.toString(mPage)));
				mJsonAlalysis.executeLoadData(url, handlerLoadMore, mContext,
						nameValuePairs);

			}
		});
		mBtnFriend.setOnClickListener(new View.OnClickListener() {

			public void onClick(View v) {
				FriendList friendListView = new FriendList(v.getContext(),
						mainActivity, Friend.this);
				mainActivity.changeViewLL(friendListView.getmView());

			}
		});
		mListViewOfInvited.setOnItemClickListener(new OnItemClickListener() {

			public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
					long arg3) {
				Profile profileView = new Profile(arg1.getContext(),
						mainActivity);
				mainActivity.changeViewLL(profileView.getView());

			}
		});

		mBtnSearch.setOnClickListener(new View.OnClickListener() {

			public void onClick(View arg0) {
				mContextBtnSearch = arg0.getContext();
				mCheckUser = new CheckUser(mContext);
				mJsonAlalysis = new JsonAnalysis(mContext);

				String url = mainActivity
						.getString(R.string.url_listfriend_search);
				List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(
						2);
				nameValuePairs.add(new BasicNameValuePair("user_id",
						ItelApplication.user.getUserId()));// isp
				// authen_code
				nameValuePairs.add(new BasicNameValuePair("uuid",
						ItelApplication.user.getUuid()));
				nameValuePairs.add(new BasicNameValuePair("keyword", mEditText
						.getText().toString()));
				nameValuePairs.add(new BasicNameValuePair("page", Integer
						.toString(mPage)));
				mJsonAlalysis.executeLoadData(url, handlerLoadData, mContext,
						nameValuePairs);
				++mPage;

			}
		});

		// mBtnInvite.setOnClickListener(new View.OnClickListener() {
		//
		// public void onClick(View v) {
		// FriendInviteList friendListInvite = new FriendInviteList(v
		// .getContext(), mainActivity, Friend.this);
		// mainActivity.changeViewLL(friendListInvite.getmView());
		// }
		// });

	}

	public View getmView() {
		return mView;
	}

	public void setmView(View mView) {
		this.mView = mView;
	}

	/*
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
						mListObjFriend = mJsonAlalysis
								.getListFriendSearch(data);
						mFriendAdapter = new FriendAdapter(mContext,R.layout.item_friend_search,
								R.id.friend_list_item_text_left,mListObjFriend);
						
						//TODO disable left
						mFriendAdapter.setOnItemSlideLeftListener(null);
						mFriendAdapter.setOnItemSlideRightListener(new OnItemSlideRightListener() {
					
					            public void onItemSlideRight(View v) {
					                
					            }
					        });
					        
						mFriendAdapter.setOnItemSlideChangedListener(new OnItemSlideChangedListener() {
					        public void onItemSlideChanged(final View v, int direction) {
					        	 SwipListAdapter adapter =  (SwipListAdapter)mListViewFriendContac.getAdapter();
					             adapter.setBusy(true);
					             if (direction==SwipAdapter.RIGHT){
					            	 mListViewFriendContac.swip(mListViewFriendContac.getPositionForView(v),direction);
					             }
					        }
					    });
						mListViewFriendContac.setAdapter(mFriendAdapter);
						mListViewFriendContac.setClipChildren(false);
						mListViewFriendContac.setClipToPadding(false);
						mListViewFriendContac.setDividerHeight(0);
						mListViewFriendContac.setFinishSwip(new OnSetFinishSwip() {
								
							@Override
							public void onFinishSwip(int direction, int index) {
								if (direction==SwipAdapter.RIGHT){
									SwipListAdapter adapter =  (SwipListAdapter)mListViewFriendContac.getAdapter();
									handleSwipFinish(index, direction,adapter);
								}
							}
						});
						mListViewFriendContac.setAdapter(mFriendAdapter);
						Log.e("", "size===" + mListObjFriend.size());

					} catch (JSONException e) {
						Utils.showDialogErorr(mContextBtnSearch,
								"NETWORK ERORR");
						e.printStackTrace();
					}
				} else {
					// Utils.showDialogServerError(json.mContext);
				}
			}
		}
	};

	/**
	 * 
	 * @param index index in array list
	 * @param direction
	 */
	private void handleSwipFinish(int index,int direction,SwipListAdapter adapter) {
		
	}
	/*
	 * 
	 * Handler doi load data tu server
	 */

	final Handler handlerLoadMore = new Handler() {
		public void handleMessage(Message msg) {
			int total = msg.getData().getInt("total");
			String data = msg.getData().getString("data");
			boolean exeption = msg.getData().getBoolean("exeption");
			if (total >= 0) {
				if (exeption) {

					try {
						ArrayList<FriendObject> mListObjFriend2 = mJsonAlalysis
								.getListFriendSearch(data);
						for (int i = 0; i < mListObjFriend2.size(); ++i)
							mListObjFriend.add(mListObjFriend2.get(i));
						// FriendAdapter friendAdapter = new FriendAdapter(
						// mContext, mListObjFriend);
						// mListView.setAdapter(friendAdapter);
						mFriendAdapter.notifyDataSetChanged();
						Log.e("", "size===" + mListObjFriend.size());

					} catch (JSONException e) {
						Utils.showDialogErorr(mContextBtnSearch,
								"NETWORK ERORR");
						e.printStackTrace();
					}
				} else {
					// Utils.showDialogServerError(json.mContext);
				}
			}
		}
	};

	/*
	 * 
	 * Handler get list friend in contact from server
	 */

	final Handler handlerLoadFriendCantact = new Handler() {
		public void handleMessage(Message msg) {
			int total = msg.getData().getInt("total");
			String data = msg.getData().getString("data");
			boolean exeption = msg.getData().getBoolean("exeption");
			if (total >= 0) {
				if (exeption) {
					String urlInvite = String.format(
							mainActivity.getString(R.string.url_listInvite),
							ItelApplication.user_id) + ItelApplication.uuid;
					;

					mJsonAlalysis.executeLoadData(urlInvite,
							handlerLoadFriendInvite, mContext, null);

					try {
						mListObjFriendContact = mJsonAlalysis
								.getListIsFriendContact(data);
						mFriendAdapter = new FriendAdapter(mContext,R.layout.item_friend_search,
								R.id.friend_list_item_text_left,mListObjFriend);
						
						//Disable left
						mFriendAdapter.setOnItemSlideLeftListener(null);
					        
						mFriendAdapter.setOnItemSlideRightListener(new OnItemSlideRightListener() {
				            public void onItemSlideRight(View v) {
				                
				            }
				        });
					        
						mFriendAdapter.setOnItemSlideChangedListener(new OnItemSlideChangedListener() {
					        public void onItemSlideChanged(final View v, int direction) {
					        	 SwipListAdapter adapter =  (SwipListAdapter)mListViewFriendContac.getAdapter();
					             adapter.setBusy(true);
					             if (direction==SwipAdapter.RIGHT){
					            	 mListViewFriendContac.swip(mListViewFriendContac.getPositionForView(v),direction);
					             }
					          }
					    });
						mListViewFriendContac.setClipChildren(false);
						mListViewFriendContac.setClipToPadding(false);
						mListViewFriendContac.setDividerHeight(0);
						mListViewFriendContac.setFinishSwip(new OnSetFinishSwip() {
								
							@Override
							public void onFinishSwip(int direction, int index) {
								if (direction==SwipAdapter.RIGHT){
									SwipListAdapter adapter =  (SwipListAdapter)mListViewFriendContac.getAdapter();
									handleSwipFinish(index, direction,adapter);
								}
							
							}
						});
						mListViewFriendContac.setAdapter(mFriendAdapter);
						Log.e("", "size===" + mListObjFriendContact.size());

					} catch (JSONException e) {
						Utils.showDialogErorr(mContext, "NETWORK ERORR");
						e.printStackTrace();
					}
				} else {
					// Utils.showDialogServerError(json.mContext);
				}
			}
		}
	};

	final Handler handlerPostContact = new Handler() {
		public void handleMessage(Message msg) {
			int total = msg.getData().getInt("total");
			String data = msg.getData().getString("data");
			boolean exeption = msg.getData().getBoolean("exeption");
			if (total >= 0) {
				if (exeption) {

					mCheckUser.addContact(false);
					loadData();

				} else {
					// Utils.showDialogServerError(json.mContext);
				}
			}
		}
	};

	final Handler handlerLoadFriendInvite = new Handler() {
		public void handleMessage(Message msg) {
			int total = msg.getData().getInt("total");
			String data = msg.getData().getString("data");
			boolean exeption = msg.getData().getBoolean("exeption");
			mListViewOfInvited.setVisibility(View.GONE);
			mLLOfInvited.setVisibility(View.GONE);
			if (total >= 0) {
				if (exeption) {

					// try {
					// mListObjFriendContact = mJsonAlalysis
					// .getListFriendFromContact(data);
					// mFriendAdapter = new FriendAdapter(mContext,
					// mListObjFriendContact);
					// mListViewFriendContac.setAdapter(mFriendAdapter);
					// Log.e("", "size===" + mListObjFriendContact.size());
					//
					// } catch (JSONException e) {
					// Utils.showDialogErorr(mContext, "NETWORK ERORR");
					// e.printStackTrace();
					// }
				} else {
					// Utils.showDialogServerError(json.mContext);
				}
			}
		}
	};

	// /////////////////////////////
	public void showDialog() {
		AlertDialog.Builder builder = new AlertDialog.Builder(mContext);
		builder.setMessage("Are you sure you want sysn contact?")
				.setCancelable(false)
				.setTitle("EXIT")
				.setPositiveButton("Yes",
						new DialogInterface.OnClickListener() {
							public void onClick(DialogInterface dialog, int id) {
								getContact(mListContact);
								int count = mListContact.size();
								mJsonAlalysis = new JsonAnalysis(mContext);
								String url = mainActivity
										.getString(R.string.url_postContact);
								List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(
										2);
								nameValuePairs.add(new BasicNameValuePair(
										"user_id", ItelApplication.user
												.getUserId()));// isp
								// authen_code
								nameValuePairs.add(new BasicNameValuePair(
										"uuid", ItelApplication.user.getUuid()));
								JSONArray listName = new JSONArray();
								JSONArray listPhone = new JSONArray();
								JSONArray listMail = new JSONArray();

								for (int i = 0; i < count; ++i) {
									listName.put(mListContact.get(i).getmName());
									listPhone.put(mListContact.get(i)
											.getmNumber());
									listMail.put(mListContact.get(i).getmMail());

								}
								// name = URLEncoder.encode(userName, "UTF-8");

								// try {
								// listName.add(URLEncoder.encode("aaaaaaaa",
								// "UTF-8"));
								// listPhone.add(URLEncoder.encode(
								// "34324324234", "UTF-8"));
								// listMail.add(URLEncoder.encode(
								// "adnajd@gmail.com", "UTF-8"));
								// } catch (UnsupportedEncodingException e) {
								// // TODO Auto-generated catch block
								// e.printStackTrace();
								// }

								// Log.e("", "contact ===" + j.toString());
								// Log.e("", "contact222 ===" + j1.toString());

								nameValuePairs.add(new BasicNameValuePair(

								"names", listName.toString()));
								nameValuePairs.add(new BasicNameValuePair(

								"phones", listPhone.toString()));
								nameValuePairs.add(new BasicNameValuePair(
										"emails", listMail.toString()));
								mJsonAlalysis.executeLoadData(url,
										handlerPostContact, mContext,
										nameValuePairs);

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
						if (direction == 0) {
							direction = SwipAdapter.LEFT;
							// onItemSlideLeftListener.onItemSlideLeft(v);
						}
					} else {
						direction = 0;
					}
					if (offsetX < 0) {
						RelativeLayout.LayoutParams params = (LayoutParams) itemUp
								.getLayoutParams();
						params.leftMargin = (int) offsetX;
						params.rightMargin = (int) -offsetX;
						itemUp.setLayoutParams(params);
					}
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
										itemUp.setVisibility(View.VISIBLE);
										// onItemSlideChangedListener.onItemSlideChanged(v,
										// direction);
										Log.e("", "finishhhhhhhhhh");
										FriendInviteList friendListInvite = new FriendInviteList(
												mContext, mainActivity,
												Friend.this);
										mainActivity
												.changeViewLL(friendListInvite
														.getmView());
										// slideAnimation(v);
										// upDownAnimation(v);
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

	private void slideAnimation(View v) {
		Animation mAnimation = new TranslateAnimation(
				TranslateAnimation.RELATIVE_TO_PARENT, 0f,
				TranslateAnimation.RELATIVE_TO_PARENT, -1.0f,
				TranslateAnimation.ABSOLUTE, 0f, TranslateAnimation.ABSOLUTE,
				0f);
		ScaleAnimationListener listener = new ScaleAnimationListener(v);
		mAnimation.setDuration(TIME_SLIDE_ANIMATION);
		mAnimation.setFillBefore(true);
		mAnimation.setAnimationListener(listener);
		if (mRlL1.getId() != v.getId()) {
			mRlL1.startAnimation(mAnimation);
		}
		// if (rlPrivate.getId() != v.getId()) {
		// rlPrivate.startAnimation(mAnimation);
		// }
		// if (rlPush.getId() != v.getId()) {
		// rlPush.startAnimation(mAnimation);
		// }
		//
		// if (rlHelp.getId() != v.getId()) {
		// rlHelp.startAnimation(mAnimation);
		// }
		//
		// if (rlAbout.getId() != v.getId()) {
		// rlAbout.startAnimation(mAnimation);
		// }
	}

	private class ScaleAnimationListener implements AnimationListener {

		private View v;

		public ScaleAnimationListener(View v) {
			this.v = v;
		}

		@Override
		public void onAnimationEnd(Animation animation) {
			if (v != null) {
				Log.e("", "endddddddddddddddddd");
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

	private OnClickListener onClickComponent = new OnClickListener() {

		public void onClick(View v) {
			switch (v.getId()) {
			case R.id.relativeLayout22:
				FriendInviteList friendListInvite = new FriendInviteList(
						v.getContext(), mainActivity, Friend.this);
				mainActivity.changeViewLL(friendListInvite.getmView());
				break;
			// case R.id.relativeLayout3:
			// PrivateManagement pri = new PrivateManagement(mContext,
			// mainActivity);
			// mainActivity.changeViewLL(pri.getmView());
			// //Utils.animation(pri.getmView(),TIME_SLIDE_ANIMATION);
			// break;
			// case R.id.relativeLayout4:
			// PushSetting push = new PushSetting(mContext, mainActivity);
			// mainActivity.changeViewLL(push.getmView());
			// //Utils.animation(push.getmView(),TIME_SLIDE_ANIMATION);
			// break;
			// case R.id.relativeLayout5:
			// HelpSetting help = new HelpSetting(mContext, mainActivity);
			// mainActivity.changeViewLL(help.getmView());
			// //Utils.animation(push.getmView(),TIME_SLIDE_ANIMATION);
			// break;
			// case R.id.relativeLayout6:
			// AboutSetting about = new AboutSetting(mContext, mainActivity);
			// mainActivity.changeViewLL(about.getmView());
			// //Utils.animation(push.getmView(),TIME_SLIDE_ANIMATION);
			// break;
			default:
				break;
			}
		}
	};

}
