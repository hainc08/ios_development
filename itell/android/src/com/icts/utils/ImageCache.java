package com.icts.utils;

import java.util.HashMap;

import android.graphics.Bitmap;
import android.support.v4.util.LruCache;

import com.icts.app.ItelApplication;
import com.icts.object.StampObject;

public class ImageCache {
	private static final String TAG = "ImageCache";
	private static HashMap<String, String> stampCache = new HashMap<String, String>();
	private static LruCache<String, Bitmap> mMemoryCache = new LruCache<String, Bitmap>(
			ItelApplication.CACHE_SIZE) {
		/**
		 * Measure item size in bytes rather than units which is more practical
		 * for a bitmap cache
		 */
		@Override
		protected int sizeOf(String key, Bitmap bitmap) {
			return getBitmapSize(bitmap);
		}
	};

	public static void addBitmapToCache(String data, Bitmap bitmap) {
		if (data == null || bitmap == null) {
			return;
		}

		// Add to memory cache
		if (mMemoryCache != null && mMemoryCache.get(data) == null) {
			mMemoryCache.put(data, bitmap);
		}

	}

	/**
	 * Get from memory cache.
	 * 
	 * @param data
	 *            Unique identifier for which item to get
	 * @return The bitmap if found in cache, null otherwise
	 */
	public static Bitmap getBitmapFromMemCache(String data) {
		if (mMemoryCache != null) {
			final Bitmap memBitmap = mMemoryCache.get(data);
			if (memBitmap != null) {
				// if (BuildConfig.DEBUG) {
				// Log.d(TAG, "get Memory cache");
				// }
				return memBitmap;
			}
		}
		return null;
	}

	public static void clearCaches() {
		if (mMemoryCache != null) {
			mMemoryCache.evictAll();
		}
		if (stampCache != null) {
			stampCache.clear();
		}
	}

	private static int getBitmapSize(Bitmap bitmap) {
		/*
		 * if (Build.VERSION.SDK_INT >= 11) { return bitmap.getByteCount(); }
		 */
		// Pre HC-MR1
		return bitmap.getRowBytes() * bitmap.getHeight();
	}

	public static void putStamp(StampObject stamp) {
		if (stampCache != null) {
			if (!stampCache.containsKey(stamp.getCode())) {
				stampCache.put(stamp.getCode(), stamp.getImageLink());
			}
		}
	}

	/**
	 * Return link of image
	 * 
	 * @param key
	 * @return
	 */
	public static String getStamp(String key) {
		if (stampCache != null) {
			if (stampCache.containsKey(key)) {
				return stampCache.get(key);
			}
		}
		return null;
	}

	public static boolean hasStamp(String key) {
		return stampCache.containsKey(key);
	}

	/**
	 * remove special in message
	 * 
	 * @param message
	 * @return
	 */
	public static String subMessage(String message) {
		if (message != null) {
			if (message.startsWith(Constant.STAMP_TAG)) {
				return message.substring(Constant.STAMP_TAG.length());
			}
		}
		return null;
	}
}
