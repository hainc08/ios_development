package com.coolio.service;

import org.apache.http.entity.StringEntity;

import android.app.Activity;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.JsonHttpResponseHandler;

/**
 * Coolio base service - all the service class must be override this class 
 * 
 * @author tuyendn <tuyendn@vnext.vn>
 * @since 2013/12/27
 * */
public abstract class BaseService {

	private static final String ACCEPT_HEADER   = "application/json";
	private static final String CONTENT_TYPE    = "application/json";
	private static final String ACCEPT_ENCODING = "gzip";
	
	protected AsyncHttpClient client;
	protected Activity parentActivity;
	
	/**
	 * Default constructor 
	 * 
	 * @author tuyendn <tuyendn@vnext.vn>
	 * @since 2013/12/27
	 * @param <Activity> parentActivity - The parent activity that call the service 
	 * */
	public BaseService(Activity parentActivity) {
		this.client = new AsyncHttpClient();
		this.client.addHeader("Accept", "application/json");
		this.client.addHeader("Content-type", "application/json");
		this.client.addHeader("Accept-Encoding", "gzip");
		this.parentActivity = parentActivity;
	}
	
	/**
	 * Default detructor, clear all the memory
	 * 
	 * @author tuyendn <tuyendn@vnext.vn> 
	 * @since 2013/12/27
	 * */
	public void finalize ()  {
		this.client = null;
		this.parentActivity = null;
	}
	
	
	/**
	 * Set the parent activity 
	 * 
	 * @author tuyendn <tuyendn@vnext.vn>
	 * @since 2013/12/27 
	 * @param <Activity> parentActivity - The parent activity that call the service 
	 * */
	public void setParentActivity(Activity parentActivity) {
		this.parentActivity = parentActivity;
	}
	
	/**
	 * Get the parent activity 
	 * 
	 * @author tuyendn <tuyendn@vnext.vn>  
	 * @since 2013/12/27
	 * */
	public Activity getParentActivity() {
		return this.parentActivity;
	}
	
	/**
	 * Post a request to server using url service 
	 * 
	 * @author tuyendn <tuyendn@vnext.vn>  
	 * @since 2013/12/27
	 * 
	 * @param <String> url - url service
	 * @param <StringEntity> entity - add parameter to request 
	 * @param <AsyncHttpResponseHandler> handler - callback handler class string 
	 * */
	public void post(String url, StringEntity entity, AsyncHttpResponseHandler handler) {
		if (this.client != null) {
			this.client.post(this.parentActivity, url, entity, CONTENT_TYPE, handler);
		}
	}
	
	/**
	 * Post a request to server using url service 
	 * 
	 * @author tuyendn <tuyendn@vnext.vn>  
	 * @since 2013/12/27
	 * 
	 * @param <String> url - url service
	 * @param <StringEntity> entity - add parameter to request 
	 * @param <JsonHttpResponseHandler> handler - callback handler class json 
	 * */
	public void post(String url, StringEntity entity, JsonHttpResponseHandler handler) {
		if (this.client != null) {
			this.client.post(this.parentActivity, url, entity, CONTENT_TYPE, handler);
		}
	}
}
