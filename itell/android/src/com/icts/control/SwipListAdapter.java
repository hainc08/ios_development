package com.icts.control;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import android.content.Context;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.text.TextUtils.TruncateAt;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.icts.itel.R;
import com.icts.object.FriendObject;
import com.icts.object.MessageObject;
import com.icts.utils.Constant;
import com.icts.utils.CountDownTime;
import com.icts.utils.DownloadImage;

/**
 * Adapter for list view in map and chat view
 * @author Luong
 *
 */
public class SwipListAdapter extends SwipAdapter<FriendObject>{
	public class ViewHolder{
		public TextView tvNewMessage;
		public ImageView imgAvatar;
		public ImageView imgLocationIcon;
		public EllipsizingTextView tvName;
		public EllipsizingTextView tvAddress;
		public EllipsizingTextView tvStatus;
		public EllipsizingTextView tvTime;
		//public View vRight;
		public View vMid;
		public View vText;
		public View vContent;
		public long time;
	}
	public boolean isChat = false;
	public Handler mHandler = null;
	//Resource for background 
	public final static Integer[] imageInnerResIds = new Integer[] {
         R.drawable.list_inner_tab_1, R.drawable.list_inner_tab_2, R.drawable.list_inner_tab_3,
         R.drawable.list_inner_tab_4, R.drawable.list_inner_tab_5, R.drawable.list_inner_tab_6};
	public final static Integer[] imageOutResIds = new Integer[] {
        R.drawable.list_outer_tab_1, R.drawable.list_outer_tab_2, R.drawable.list_outer_tab_3,
        R.drawable.list_outer_tab_4, R.drawable.list_outer_tab_5, R.drawable.list_outer_tab_6};

	private ArrayList<FriendObject> arr;
	private Context mContext;
	private Map<String, List<MessageObject>> messageArr = null;
    public SwipListAdapter(Context context, int textViewResourceId) {
        super(context, textViewResourceId);
        mContext = context;
    }

    public SwipListAdapter(Context context, int resource, int textViewResourceId) {
        super(context, resource, textViewResourceId);
        mContext = context;
    }

    public CountDownTime coundown;
    public long timeServer;
    public SwipListAdapter(Context context, int resource, int textViewResourceId,
            ArrayList<FriendObject> objects) {
        super(context, resource, textViewResourceId, objects);
        mContext = context;
        this.arr = objects;
    }
    
    public void setNewMessagesArray(Map<String, List<MessageObject>> arr){
    	messageArr = arr;
    }
    
    public SwipListAdapter(Context context, int resource, int textViewResourceId,
            ArrayList<FriendObject> objects,Handler handler) {
        super(context, resource, textViewResourceId, objects);
        mContext = context;
        this.arr = objects;
    }

    @Override
    public int getCount() {
    	if (arr==null){
    		return 0;
    	}
    	return arr.size();
    }

   
    @Override
    public FriendObject getItem(int position) {
    	if (arr==null){
    		return null;
    	}
    	if (position<0||position>=arr.size()){
    		return null;
    	}
    	return arr.get(position);
    }
    
    
    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        View v = super.getView(position, convertView, parent);
        ViewHolder holder;
        if (v==null){
        	LayoutInflater inflater = LayoutInflater.from(mContext); 
			convertView = inflater.inflate(R.layout.map_list_item, null);
			holder = new ViewHolder();
			
			holder.imgAvatar = (ImageView) convertView.findViewById(R.id.map_list_item_ava);
			holder.tvNewMessage = (TextView) convertView.findViewById(R.id.map_list_item_img_message);
			holder.imgLocationIcon = (ImageView) convertView.findViewById(R.id.map_list_item_img_acc);
    		holder.tvName = (EllipsizingTextView) convertView.findViewById(R.id.map_list_tv_name);
    		holder.tvName.setEllipsize(TruncateAt.END);
    		holder.tvName.setMaxLines(3);
    	    
    		holder.tvAddress = (EllipsizingTextView) convertView.findViewById(R.id.map_list_tv_address);
    		holder.tvAddress.setEllipsize(TruncateAt.END);
    		holder.tvAddress.setMaxLines(3);
    		
    		holder.tvStatus = (EllipsizingTextView) convertView.findViewById(R.id.map_list_tv_status);
    		holder.tvStatus.setEllipsize(TruncateAt.END);
    		holder.tvStatus.setMaxLines(3);
    		
    		holder.tvTime = (EllipsizingTextView) convertView.findViewById(R.id.map_list_tv_time);
    		holder.tvTime.setEllipsize(TruncateAt.END);
    		holder.tvTime.setMaxLines(3);
    		
    		//holder.vRight = convertView.findViewById(R.id.map_list_item_rl);
    		holder.vMid = convertView.findViewById(R.id.list_item);
    		holder.vText = convertView.findViewById(R.id.list_item_text);
    		holder.vContent = convertView.findViewById(R.id.list_item_layout_content);
    		
			convertView.setTag(holder);
			v = convertView;
        }
        else {
        	holder = (ViewHolder) v.getTag();
        	if (holder ==null){
        		holder = new ViewHolder();
        		holder.tvNewMessage = (TextView) v.findViewById(R.id.map_list_item_img_message);
        		holder.imgLocationIcon = (ImageView) v.findViewById(R.id.map_list_item_img_acc);
    			holder.imgAvatar = (ImageView) v.findViewById(R.id.map_list_item_ava);
        		holder.tvName = (EllipsizingTextView) v.findViewById(R.id.map_list_tv_name);
        		holder.tvName.setEllipsize(TruncateAt.END);
        		holder.tvName.setMaxLines(3);
        	    
        		holder.tvAddress = (EllipsizingTextView) v.findViewById(R.id.map_list_tv_address);
        		holder.tvAddress.setEllipsize(TruncateAt.END);
        		holder.tvAddress.setMaxLines(3);
        		
        		holder.tvStatus = (EllipsizingTextView) v.findViewById(R.id.map_list_tv_status);
        		holder.tvStatus.setEllipsize(TruncateAt.END);
        		holder.tvStatus.setMaxLines(3);
        		
        		holder.tvTime = (EllipsizingTextView) v.findViewById(R.id.map_list_tv_time);
        		holder.tvTime.setEllipsize(TruncateAt.END);
        		holder.tvTime.setMaxLines(3);
        		
        		//holder.vRight = v.findViewById(R.id.map_list_item_rl);
        		holder.vText = v.findViewById(R.id.list_item_text);
        		holder.vMid = v.findViewById(R.id.list_item);
        		holder.vContent = v.findViewById(R.id.list_item_layout_content);
        		
    			v.setTag(holder);
        	}
        	handleEvent(v);
        }
        initData(v,position,holder);
        return v;
    }
    
    /**
     * Initial data for v: background, set text,...
     * @param v
     */
    private void initData(View v,int position,ViewHolder holder){
    	//Right background 
		//holder.vRight.setBackgroundResource(imageOutResIds[position%6]);
    	
    	holder.vText.setBackgroundResource(imageOutResIds[position%6]);
    	holder.vMid.setBackgroundResource(imageInnerResIds[position%6]);
    	
    	FriendObject obj = arr.get(position);
    	if (obj!=null){
    		//at chat screen?
    		if (!isChat){
        		holder.tvNewMessage.setVisibility(View.GONE);
        	}
        	else {
        		//yes->check data
        		if (messageArr!=null){
        			String id = String.valueOf(obj.getFriendID());
        			if (messageArr.containsKey(id)){
        				ArrayList<MessageObject> list =(ArrayList<MessageObject>) messageArr.get(id);
        				int size = list.size();
        				if (size>0){
	        				holder.tvNewMessage.setVisibility(View.VISIBLE);
	        				holder.tvNewMessage.setText(String.valueOf(size));
        				}
        			}
        		}
        	}
    		DownloadImage down = new DownloadImage(holder.imgAvatar,40,40,mContext) ;
    		down.execute(obj.getFriendAva());
    		
    		//Set text 
    		holder.tvName.setText(obj.getFriendNick());
    		
    		if (obj.getFriendAddress()==null){
    			// get address from latitude, longitude
    			holder.tvAddress.setText("");
    		}
    		else {
    			holder.tvAddress.setText(obj.getFriendAddress());
    		}
    		holder.tvStatus.setText(obj.getFriendiTell());
    		/*long curTime = Calendar.getInstance(Locale.JAPAN).getTimeInMillis();
    		long userTime = obj.getFriendStatTime();
    		if (curTime<userTime||userTime<=0){
    			holder.tvTime.setText(String.valueOf(0));
    		}
    		else {
    			long t = (curTime-userTime)/60000;
    			if (t<Constant.THREE_HOUR){
    				holder.tvTime.setText(String.valueOf(t));
    			}
    			else {
    				holder.tvTime.setText(String.valueOf(Constant.THREE_HOUR));
    			}
    		}*/
    		holder.time = obj.getFriendStatTime();
    		View tv = holder.vContent.findViewById(R.id.list_item_text_title);
    		tv.setBackgroundResource(imageOutResIds[position%6]);
    		holder.imgLocationIcon.setImageBitmap(null);
    		Drawable drawable = null;
    		if (obj.isFriend()){
    			drawable = mContext.getResources().getDrawable(R.drawable.list_location_2);
    			holder.imgLocationIcon.setImageBitmap(((BitmapDrawable)drawable).getBitmap());
    		}
    		else {
    			drawable = mContext.getResources().getDrawable(R.drawable.list_location_1);
    			holder.imgLocationIcon.setImageBitmap(((BitmapDrawable)drawable).getBitmap());
    		}
    	}
    	
    }
}
