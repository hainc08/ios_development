/*
 * Copyright 2012 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.icts.itel;

import java.util.Set;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;

import com.google.android.gcm.GCMBaseIntentService;
import com.google.android.gcm.GCMRegistrar;
import com.icts.app.ItelApplication;
import com.icts.utils.Constant;
import com.icts.utils.Utils;
import com.icts.utils.Utils.HttpCallback;

/**
 * IntentService responsible for handling GCM messages.
 */
public class GCMIntentService extends GCMBaseIntentService {

	@SuppressWarnings("hiding")
	private static final String TAG = "hieuth";

	public GCMIntentService() {
		super(Constant.SENDER_ID);
	}

	@Override
	protected void onRegistered(Context context, String registrationId) {
		Utils.d(TAG, "Device registered: regId = " + registrationId);
		registerOnServer(context, registrationId);
	}

	@Override
	protected void onUnregistered(Context context, String registrationId) {
		 Utils.d(TAG, "Device unregistered");
		if (GCMRegistrar.isRegisteredOnServer(context)) {
			unRegisterOnServer(context, registrationId);
			// ServerUtilities.unregister(context, registrationId);
		}
	}

	@Override
	protected void onMessage(Context context, Intent intent) {
		// Config.log(TAG, "Received message");
		// notifies user
		String message = "";
		message = intent.getStringExtra(Constant.PUSH_MESSAGE);
		message = (message == null) ? "" : message;
		int id = intent.getIntExtra(Constant.PUSH_ID, 0);
		Set<String> keys = intent.getExtras().keySet();
		for (String key : keys) {
			message += intent.getStringExtra(key);
		}
		generateNotification(context, message, id);
	}

	@Override
	protected void onDeletedMessages(Context context, int total) {
		Utils.d(TAG, "Received deleted messages notification");
	}

	@Override
	public void onError(Context context, String errorId) {
		Utils.d(TAG, "Received error: " + errorId);
		// ACCOUNT_MISSING: has no account on this phone

	}

	@Override
	protected boolean onRecoverableError(Context context, String errorId) {
		Utils.e(TAG, "Received recoverable error: " + errorId);
		return super.onRecoverableError(context, errorId);
	}

	/**
	 * Issues a notification to inform the user that server has sent a message.
	 */
	private static void generateNotification(Context context, String message,
			int id) {
		 int icon = R.drawable.icon;
		 long when = System.currentTimeMillis();
		 NotificationManager notificationManager = (NotificationManager)
		 context.getSystemService(Context.NOTIFICATION_SERVICE);
		 Notification notification = new Notification(icon, message, when);
		 String title = context.getString(R.string.app_name);
		 Intent notificationIntent = new Intent(context, MainActivity.class);
		 // set intent so it does not start a new activity
		 notificationIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP |
		 Intent.FLAG_ACTIVITY_SINGLE_TOP);
		 PendingIntent intent = PendingIntent.getActivity(context, 0, notificationIntent, 0);
		 notification.setLatestEventInfo(context, title, message, intent);
		 notification.flags |= Notification.FLAG_AUTO_CANCEL;
		 notificationManager.notify(id, notification);
	}

	private static void generateNotification(Context context, String message) {
		generateNotification(context, message, 0);
	}

	private static void registerOnServer(final Context context, String regID) {
		Utils.httppost(Utils.urlRegisterToPush, new HttpCallback() {
			@Override
			public void run(String str) {
				Utils.d("hieuth", "Register to server: "+str);
				GCMRegistrar.setRegisteredOnServer(context, true);
			}
		}, "uuid", ItelApplication.uuid, "platform", "android", "token_id", regID);
	}

	private static void unRegisterOnServer(final Context context, String regID) {
		Utils.httppost(Utils.urlUnregisterToPush, new HttpCallback() {
			@Override
			public void run(String str) {
				Utils.d("hieuth", "Unregister to server: "+str);
				GCMRegistrar.setRegisteredOnServer(context, false);
			}
		}, "uuid", ItelApplication.uuid, "platform", "android", "token_id", regID);
	}
}
