/****************************************************************************
 *  Utility class
 *  That is class of common functions
 *  
 *  Created by Sky Holdings Vietnam.
 *  Copyright (C) 2013 Sky Holdings Vietnam Co., Ltd. All Rights Reserved.
 ****************************************************************************/
package com.coolio.util;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

import com.coolio.R;
import com.coolio.model.ObjMember;
import com.coolio.model.ObjMemberHistory;
import com.coolio.model.ObjMemberInfo;

public class Utility {
	public static final int progress_bar_type = 0;
	
	/**
	 * Check internet conection by context
	 */
	public static boolean checkInternetConnection(Context context) {
	    ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
	    NetworkInfo netInfo = cm.getActiveNetworkInfo();
	    if (netInfo != null && netInfo.isConnectedOrConnecting()) {
	        return true;
	    }

	    Utility.showDialogAlert(context.getResources().getString(R.string.no_internet_title), context.getResources().getString(R.string.no_internet_content), (Activity)context);
	    return false;
	}
	
	
	/**
	 * Display alert dialog
	 * 
	 * @param title The title of message
	 * @param value The content of message
	 * @param activity The activity of message
	 */
	public static void showDialogAlert(String title, String value, Activity activity ) {
		AlertDialog alertDialog = new AlertDialog.Builder(activity).create();
		alertDialog.setTitle(title);
		alertDialog.setMessage(value);
		alertDialog.setIcon(R.drawable.ic_dialog_alert);
		// Setting OK Button
		alertDialog.setButton(activity.getResources().getString(R.string.close), new DialogInterface.OnClickListener() {
		        public void onClick(DialogInterface dialog, int which) {
		       }
		});

		alertDialog.show();
	}
	
	/**
	 * Get info member another member
	 * 
	 * @param <Context> context for message
	 * @param <ObjMemberInfo> item to get info
	 */
	public static String getInfo(Context context, ObjMemberInfo item){
		String info = context.getResources().getString(R.string.age) + ": "+ item.getAge() + ", ";
		info += context.getResources().getString(R.string.height) + ": "+ item.getHeight() + ", ";
		info += context.getResources().getString(R.string.weight) + ": "+ item.getWeight();
		return info;
	}
	
	/**
	 * Get info connect another member
	 * 
	 * @param <Context> context for message
	 * @param <ObjMemberInfo> item to get info
	 */
	@SuppressWarnings("unused")
	public static String getStatus(Context context, ObjMemberInfo item){
		String connect ="";
		if(item.getLookingLover()){
			connect +=  context.getResources().getString(R.string.lookingLover);
		}
		if(item.getLookingFriend()){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingFriend);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingFriend);
			}
		}
		if(item.getLookingEPal()){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingEPal);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingEPal);
			}
		}
		if(item.getLookingMPal()){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingMPal);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingMPal);
			}
		}
		if(item.getLookingTPal()){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingTPal);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingTPal);
			}
		}
		
		if(item.getLookingCircle()){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingCircle);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingCircle);
			}
		}
		
		if(item.getLookingRoommate()){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingRoommate);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingRoommate);
			}
		}
		
		if(item.getLookingBPartner()){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingBPartner);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingBPartner);
			}
		}
		
		if(item.getLookingFriendWithBenefits()){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingFriendWithBenefits);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingFriendWithBenefits);
			}
		}
		return connect;
	}

	/**
	 * Get info member another member
	 * 
	 * @param <Context> context for message
	 * @param <ObjMemberInfo> item to get info
	 */
	public static String getInfo(Context context, ObjMember item){
		String info = context.getResources().getString(R.string.age) + ": "+ item.getAge() + ", ";
		info += context.getResources().getString(R.string.height) + ": "+ item.getHeight() + ", ";
		info += context.getResources().getString(R.string.weight) + ": "+ item.getWeight();
		return info;
	}
	
	/**
	 * Get info connect another member
	 * 
	 * @param <Context> context for message
	 * @param <ObjMemberInfo> item to get info
	 */
	@SuppressWarnings("unused")
	public static String getStatus(Context context, ObjMember item){
		String connect ="";
		if(item.getLookingLover()!=0){
			connect +=  context.getResources().getString(R.string.lookingLover);
		}
		if(item.getLookingFriend()!=0){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingFriend);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingFriend);
			}
		}
		if(item.getLookingEPal()!=0){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingEPal);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingEPal);
			}
		}
		if(item.getLookingMPal()!=0){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingMPal);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingMPal);
			}
		}
		if(item.getLookingTPal()!=0){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingTPal);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingTPal);
			}
		}
		
		if(item.getLookingCircle()!=0){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingCircle);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingCircle);
			}
		}
		
		if(item.getLookingRoommate()!=0){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingRoommate);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingRoommate);
			}
		}
		
		if(item.getLookingBPartner()!=0){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingBPartner);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingBPartner);
			}
		}
		
		if(item.getLookingFriendWithBenefits()!=0){
			if(connect.length()>0){
				connect += ", " + context.getResources().getString(R.string.lookingFriendWithBenefits);
			}
			else{
				connect +=  context.getResources().getString(R.string.lookingFriendWithBenefits);
			}
		}
		return connect;
	}

}
