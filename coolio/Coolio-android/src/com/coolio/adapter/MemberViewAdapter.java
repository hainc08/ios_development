package com.coolio.adapter;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

import com.coolio.R;
import com.coolio.model.ObjMemberInfo;
import com.coolio.util.Constant;

public class MemberViewAdapter  extends ArrayAdapter<ObjMemberInfo>{
	private Context context;
    private LayoutInflater layoutInflater;
    private ArrayList<ObjMemberInfo> list_member;
    private static Map<Object, Bitmap> memberImageMap = new HashMap<Object, Bitmap>();
 
    public MemberViewAdapter(Context context,
            ArrayList<ObjMemberInfo> items) {
        super(context, 0, items);
        this.layoutInflater = LayoutInflater.from(context);
        this.context = context;
        this.list_member = items;
    }
 
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
    	View row = convertView;
        ViewHolder holder = null;
 
        if (row == null) {
        	row = layoutInflater.inflate(R.layout.member_row, parent, false);
            holder = new ViewHolder();
            holder.title = (TextView) row.findViewById(R.id.text);
            holder.image = (ImageView) row.findViewById(R.id.imageDetail);
            holder.image_online = (ImageView) row.findViewById(R.id.online_status);
            holder.loadImageProgressBar = (ProgressBar) row
					.findViewById(R.id.loadImageProgressBar);
            row.setTag(holder);
        } else {
            holder = (ViewHolder) row.getTag();
        }
 
        ObjMemberInfo item = MemberViewAdapter.this.list_member.get(position);
        holder.title.setText(item.getNickname());
        if(item.getOnline()){
        	Bitmap bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.avatar_main_icon_online);
        	holder.image_online.setImageBitmap(bitmap);
        }
        else{
        	Bitmap bitmap = BitmapFactory.decodeResource(context.getResources(), R.drawable.avatar_main_icon_offline);
        	holder.image_online.setImageBitmap(bitmap);
        }
        
        if(MemberViewAdapter.memberImageMap.get(item.getEmail())!=null){
        	holder.image.setImageBitmap(MemberViewAdapter.memberImageMap.get(item.getEmail()));
        }
        else{
        	if(item.getPicture1()=="" || item.getPicture1()==null) {
        		
        	}
        	else{
        		new DownloadImageTask(holder, holder.image, item.getEmail()).execute(Constant.ROOT_IMAGE_FOLDER.concat( item.getPicture1()));
        	}
        }
        
        return row;
    }
 
    public static class ViewHolder {
        TextView title;
        ImageView image;
        ImageView image_online;
        ProgressBar loadImageProgressBar;

		public ProgressBar getLoadImageProgressBar() {
			return loadImageProgressBar;
		}
    }
    
    
    /**
	 * Execute download file
	 * this is private class to help download image of member
	 * @author ThuanHM <thuanhm@vnext.vn>
	 * @since 2013/12/27
	 * 
	 * */
    private class DownloadImageTask extends AsyncTask<String,Void,Bitmap>{
    	String userEmail;
    	ImageView imgView;
    	ViewHolder userViewHolder;
    	public DownloadImageTask(ViewHolder viewholder,ImageView imgview, String email){
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
				MemberViewAdapter.memberImageMap.put(userEmail, result);
			}
			userViewHolder.getLoadImageProgressBar().setVisibility(View.GONE);
			imgView.setVisibility(View.VISIBLE);
			
		}
	
    }
    
}
