package com.coolio.adapter;


import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.coolio.model.ObjMemberInfo;
import com.coolio.util.Constant;
import com.coolio.util.Utility;
import com.coolio.R;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

public class FriendsAdapter extends ArrayAdapter<ObjMemberInfo> {
	private final Context context;
	private final ArrayList<ObjMemberInfo> list_item;
	private LayoutInflater inflater;
	private static Map<Object, Bitmap> friendImageMap = new HashMap<Object, Bitmap>();
	public FriendsAdapter(Context context,  ArrayList<ObjMemberInfo> items) {
		super(context, 0, items);
		this.context = context;
		this.list_item = items;
		inflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		View rowView = convertView;
		FriendViewHolder viewholder =null;
		if(rowView==null){
			rowView = inflater.inflate(R.layout.friends_item, parent,false);
			viewholder = new FriendViewHolder();
			viewholder.image = (ImageView )rowView.findViewById(R.id.detailImage);
			viewholder.nickname = (TextView)rowView.findViewById(R.id.nickname);
			viewholder.info = (TextView)rowView.findViewById(R.id.info);
			viewholder.status = (TextView)rowView.findViewById(R.id.status);
			viewholder.loadImageProgressBar = (ProgressBar) rowView
					.findViewById(R.id.loadImageProgressBar);
			rowView.setTag(viewholder);
		}
		else{
			viewholder = (FriendViewHolder)rowView.getTag();
		}
		final ObjMemberInfo item = list_item.get(position);
		viewholder.nickname.setText(item.getNickname());
		viewholder.info.setText(Utility.getInfo(context, item));
		viewholder.status.setText(Utility.getStatus(context,item));
		if(FriendsAdapter.friendImageMap.get(item.getEmail())!=null){
			viewholder.image.setImageBitmap(FriendsAdapter.friendImageMap.get(item.getEmail()));
		}
		else{
			if(item.getPicture1()=="" || item.getPicture1()==null) {

			}
			else{
				new DownloadImageTask(viewholder, viewholder.image, item.getEmail()).execute(Constant.ROOT_IMAGE_FOLDER.concat( item.getPicture1()));
			}
		}
		return rowView;
	}
	
	@SuppressWarnings("unused")
	

	/**
	 * Class holder for an friend view item
	 * 
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/29
	 **/
	public static class FriendViewHolder {
		TextView nickname;
		TextView info;
		TextView status;
		ImageView image;
		ProgressBar loadImageProgressBar;

		public ProgressBar getLoadImageProgressBar() {
			return loadImageProgressBar;
		}
	}


	/**
	 * Execute download file
	 * this is private class to help download image of member
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/29
	 * 
	 * */
	private class DownloadImageTask extends AsyncTask<String,Void,Bitmap>{
		String userEmail;
		ImageView imgView;
		FriendViewHolder userViewHolder;
		public DownloadImageTask(FriendViewHolder viewholder,ImageView imgview, String email){
			this.userEmail = email;
			this.userViewHolder = viewholder;
			this.imgView = imgview;
		}
		/**
		 * Before starting background thread Show Progress Bar Dialog
		 */
		@Override
		protected void onPreExecute() {
			super.onPreExecute();
			userViewHolder.getLoadImageProgressBar()
			.setVisibility(View.VISIBLE);
		}

		protected Bitmap doInBackground(String... urls) {
			String url = urls[0];
			Bitmap outBitmap = null;
			try {
				InputStream in = new java.net.URL(url).openStream();
				outBitmap = BitmapFactory.decodeStream(in);
			} catch (Exception e) {
				Log.e("Error", e.getMessage());
				e.printStackTrace();
			}
			return outBitmap;
		}

		protected void onPostExecute(Bitmap result) {
			if (result == null) {
				// imgView.setImageResource(R.drawable.no_image);
			} else {
				imgView.setImageBitmap(result);
				FriendsAdapter.friendImageMap.put(userEmail, result);
			}
			userViewHolder.getLoadImageProgressBar().setVisibility(View.GONE);
			imgView.setVisibility(View.VISIBLE);

		}

	}

}
