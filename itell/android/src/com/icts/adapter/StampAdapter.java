package com.icts.adapter;

import java.util.ArrayList;

import com.icts.control.StampFragment;
import com.icts.control.StampFragment.OnClickStampImage;
import com.icts.object.StampObject;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.widget.ArrayAdapter;

public class StampAdapter extends FragmentPagerAdapter {
	private ArrayList<StampObject[]> arrStamp;
	private OnClickStampImage onClick;
	public StampAdapter(FragmentManager arg0) {
		super(arg0);
	}
	public StampAdapter(FragmentManager arg0,ArrayList<StampObject[]> arr) {
		super(arg0);
		this.arrStamp = arr;
	}

	@Override
	public Fragment getItem(int arg0) {
		StampFragment stamp = StampFragment.newInstance(arrStamp.get(arg0));
		stamp.setOnClickStampImage(onClick);
		return stamp;
	}

	@Override
	public int getCount() {
		return arrStamp.size();
	}
	
	public void setOnClickStampImage(OnClickStampImage onClick){
		this.onClick = onClick;
	}

}
