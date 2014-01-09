package com.coolio.activity;

import java.util.ArrayList;

import com.coolio.adapter.MenuListAdapter;
import com.coolio.model.ObjMenu;
import com.coolio.model.ObjMenuEntry;
import com.coolio.model.ObjMenuSection;
import com.coolio.R;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.Display;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView;
import android.widget.ListView;
import slidingmenu.lib.SlidingMenu;

public class HeaderActivity extends Activity {
	private SlidingMenu slideMenu;
	protected  static ProgressDialog barProgressDialog;
	public int tag;
	private void configureSlideMenu(){
		slideMenu = new SlidingMenu(this);
		slideMenu.setMode(SlidingMenu.LEFT);
		slideMenu.setTouchModeAbove(SlidingMenu.TOUCHMODE_FULLSCREEN);
		slideMenu.setShadowWidthRes(R.dimen.shadow_width);
		slideMenu.setShadowDrawable(R.drawable.shadow);
		slideMenu.setFadeDegree(0.35f);
		slideMenu.attachToActivity(this, SlidingMenu.SLIDING_CONTENT);
		slideMenu.setMenu(R.layout.left_slide_menu);
		ListView listView = (ListView) slideMenu.findViewById(R.id.menu_list_view);
		LayoutParams listview_params = (LayoutParams) listView.getLayoutParams();
		Display display = getWindowManager().getDefaultDisplay();
		@SuppressWarnings("deprecation")
		int width = display.getWidth();
		if (width > listview_params.width) {
			slideMenu.setBehindOffset(width - listview_params.width);
		} else {
			slideMenu.setBehindOffsetRes(R.dimen.slidingmenu_offset);
		}
		/* add menu item*/
		Bitmap bitmap = BitmapFactory.decodeResource(getResources(), R.drawable.btn_leftmenu_friend);

		/* add meetup section*/
		ObjMenuSection meetup_section = new ObjMenuSection(getResources().getString(R.string.menu_meetup));
		ObjMenuEntry member_entry = new ObjMenuEntry( bitmap,getResources().getString(R.string.menu_member));
		ObjMenuEntry myfriend_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_myfriend));
		ObjMenuEntry slient_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_slientmatch));
		ObjMenuEntry history_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_history));
		/* add Chats */
		ObjMenuSection chat_section = new ObjMenuSection(getResources().getString(R.string.menu_chats));
		ObjMenuEntry chat_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_chat));
		
		/* add Notification section */
		ObjMenuSection notification_section = new ObjMenuSection(getResources().getString(R.string.menu_notification));
		ObjMenuEntry friend_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_friend));
		ObjMenuEntry matched_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_matched));
		ObjMenuEntry foot_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_footprint));
		/* add Alert section */
		ObjMenuSection alert_section = new ObjMenuSection(getResources().getString(R.string.menu_alert));
		ObjMenuEntry alert_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_alert));
		/* add General section */
		ObjMenuSection general_section = new ObjMenuSection(getResources().getString(R.string.menu_general));
		ObjMenuEntry infor_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_information));
		ObjMenuEntry profile_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_profile));
		ObjMenuEntry passlock_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_passlock));
		ObjMenuEntry logout_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_logout));
		ObjMenuEntry term_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_term));
		ObjMenuEntry unsub_entry = new ObjMenuEntry(bitmap,getResources().getString(R.string.menu_unsubcribe));
		
		ArrayList<ObjMenu> list_menu = new ArrayList<ObjMenu>();
		list_menu.add(meetup_section);
		list_menu.add(member_entry);
		list_menu.add(myfriend_entry);
		list_menu.add(slient_entry);
		list_menu.add(history_entry);
		list_menu.add(chat_section);
		list_menu.add(chat_entry);
		list_menu.add(notification_section);
		list_menu.add(friend_entry);
		list_menu.add(matched_entry);
		list_menu.add(foot_entry);
		list_menu.add(alert_section);
		list_menu.add(alert_entry);
		list_menu.add(general_section);
		list_menu.add(infor_entry);
		list_menu.add(profile_entry);
		list_menu.add(passlock_entry);
		list_menu.add(logout_entry);
		list_menu.add(term_entry);
		list_menu.add(unsub_entry);
		
		MenuListAdapter adapter = new MenuListAdapter(this, list_menu);
		ListView left_menu = (ListView) slideMenu.findViewById(R.id.menu_list_view);
		left_menu.setAdapter(adapter);
		left_menu.setOnItemClickListener(new OnItemClickListener() {
			@Override
			public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
				if (position != tag) {
					switch (position) {
					case 0:
						
						break;
					case 1:
						Intent i = new Intent(HeaderActivity.this, MemberListActivity.class);
						startActivity(i);
						break;
					case 2:
						Intent myfriend_intent = new Intent(HeaderActivity.this, MyfriendsListActivity.class);
						startActivity(myfriend_intent);
						break;
					case 3:
						Intent silent_intent = new Intent(HeaderActivity.this, SilentMatchActivity.class);
						startActivity(silent_intent);
						break;
					case 4:
						Intent history_intent = new Intent(HeaderActivity.this, MyHistoryActivity.class);
						startActivity(history_intent);
						break;
					case 6:
						Intent chat_intent = new Intent(HeaderActivity.this, ChatListActivity.class);
						startActivity(chat_intent);
						break;
					case 8:
						Intent friend_intent = new Intent(HeaderActivity.this, FriendsListActivity.class);
						startActivity(friend_intent);
						break;
					case 9:
						Intent match_intent = new Intent(HeaderActivity.this, MatchActivity.class);
						startActivity(match_intent);
						break;
					case 10:
						Intent foot_intent = new Intent(HeaderActivity.this, FootPrintActivity.class);
						startActivity(foot_intent);
						break;
					case 12:
						Intent alert_intent = new Intent(HeaderActivity.this, AlertActivity.class);
						startActivity(alert_intent);
						break;
					case 14:
						Intent infor_intent = new Intent(HeaderActivity.this, InformationActivity.class);
						startActivity(infor_intent);
						break;
					case 15:
						Intent profile_intent = new Intent(HeaderActivity.this, ProfileAndSettingActivity.class);
						startActivity(profile_intent);
						break;
					case 16:
						Intent pass_intent = new Intent(HeaderActivity.this, PassLockActivity.class);
						startActivity(pass_intent);
						break;
					case 17:
						//Logout
						break;
					case 18:
						Intent term_intent = new Intent(HeaderActivity.this, TermAndPolicyActivity.class);
						startActivity(term_intent);
						break;
					case 19:
						Intent unsub_intent = new Intent(HeaderActivity.this, UnsubcribeActivity.class);
						startActivity(unsub_intent);
						break;
					default:
						break;
					}
				}
			}
		});
	}
	
	protected void showBarProgress(){
		barProgressDialog = new ProgressDialog(this);
		barProgressDialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
		barProgressDialog.setCancelable(false);
		barProgressDialog.show();
	}
	
	private void setOnClickListenerForBtnMenuAndBtnSearch(View btnMenu, View btnSearch) {
		btnMenu.setOnClickListener(new MenuClickListener());
		btnSearch.setOnClickListener(new SearchActivity());
	}

	public void configHeaderAndSlideMenu(View mainView) {
		View btnMenu = mainView.findViewById(R.id.bt_menu);
		View btnSearch = mainView.findViewById(R.id.bt_search);
		this.configureSlideMenu();
		this.setOnClickListenerForBtnMenuAndBtnSearch(btnMenu, btnSearch);
	}

	class MenuClickListener implements OnClickListener {
		@Override
		public void onClick(View v) {
			slideMenu.showMenu();
		}
	}

	class SearchActivity implements OnClickListener {
		@Override
		public void onClick(View v) {
			//Intent i = new Intent(HeaderActivity.this, SearchPassActivity.class);
			//startActivity(i);
		}
	}
	//destroy function
		@Override
	    public void onDestroy()
	    {
	        super.onDestroy();
	    }
}
