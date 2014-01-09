package com.coolio.adapter;


import java.util.ArrayList;

import com.coolio.model.ObjMenu;
import com.coolio.model.ObjMenuEntry;
import com.coolio.model.ObjMenuSection;
import com.coolio.R;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class MenuListAdapter extends ArrayAdapter<ObjMenu> {
	private final Context context;
	private final ArrayList<ObjMenu> list_item;
	private LayoutInflater inflater;
	
	public MenuListAdapter(Context context,  ArrayList<ObjMenu> items) {
		super(context, 0, items);
		this.context = context;
		this.list_item = items;
		inflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		View rowView = convertView;
		final ObjMenu item = list_item.get(position);
		if(item.isSection()){
			ObjMenuSection section = (ObjMenuSection) item;
			rowView = inflater.inflate(R.layout.menu_section_item, null);
			final TextView sectionView = (TextView) rowView.findViewById(R.id.label);
		    sectionView.setText(section.getTitle());
		}
		else{
			ObjMenuEntry entry = (ObjMenuEntry) item;
			rowView = inflater.inflate(R.layout.menu_item, null);
			final TextView sectionView = (TextView) rowView.findViewById(R.id.label);
		    sectionView.setText(entry.title);
		    final ImageView detail_image = (ImageView) rowView.findViewById(R.id.detail);
		    detail_image.setImageBitmap(entry.getImage());
		}		
		return rowView;
	}
}
