package com.icts.adapter;

import java.util.List;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;

import com.icts.itel.R;
import com.icts.utils.DownloadImage;
import com.icts.utils.Utils;

/**
 * Adapter for list view in stamp category function
 * @author Luong
 *
 */
public class StampCategoryAdapter extends ArrayAdapter<String>{

	public class ViewHolder{
		public ImageView imgCategory;
	}
	
	//private ExecutorService executor;
	private Context context;
	private List<String> list = null;
	
	public StampCategoryAdapter(Context context,List<String> list ) {
		super(context, R.layout.chat_stamp_item);
		this.list = list;
		this.context = context;
		//executor = Executors.newFixedThreadPool(Constant.MAX_EXEC_THREAD);
	}
	
	@Override
	public String getItem(int position) {
		if (list!=null)
			return list.get(position);
		return null;
	}
	
	@Override
	public long getItemId(int position) {
		return position;
	}
	
	@Override
	public int getCount() {
		if (list!=null)
			return list.size();
		return 0;
	}
	

	
	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		String url = (String) getItem(position);
		ViewHolder holder;
		if (convertView ==null){
			LayoutInflater inflater = LayoutInflater.from(this.context); 
			convertView = inflater.inflate(R.layout.chat_stamp_item, null);
			holder = new ViewHolder();
			holder.imgCategory = (ImageView) convertView.findViewById(R.id.chat_stamp_category_img);
			convertView.setTag(holder);
		}
		else {
			holder = (ViewHolder) convertView.getTag();
		}
		//DownloadImage down = new DownloadImage(holder.imgCategory,30,30,context);
		//down.execute(url);
		holder.imgCategory.setImageBitmap(Utils.convert2bitmap(context.getResources().getDrawable(R.drawable.emotion_cat_icon)));
		return convertView;
	}
	

	
}
