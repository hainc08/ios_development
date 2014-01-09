package com.coolio.adapter;


import java.util.ArrayList;

import com.coolio.model.ObjMember;
import com.coolio.R;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class FootprintAdapter extends ArrayAdapter<ObjMember> {
	private final Context context;
	private final ArrayList<ObjMember> list_item;
	private LayoutInflater inflater;
	
	public FootprintAdapter(Context context,  ArrayList<ObjMember> items) {
		super(context, 0, items);
		this.context = context;
		this.list_item = items;
		inflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		View rowView = convertView;
		final ObjMember item = list_item.get(position);
			rowView = inflater.inflate(R.layout.footprint_item, null);
			final TextView sectionView = (TextView) rowView.findViewById(R.id.label);
		    //sectionView.setText(item.getTitle());
		    final ImageView detail_image = (ImageView) rowView.findViewById(R.id.detail);
		   // detail_image.setImageBitmap(item.getImage());	
		return rowView;
	}
}
