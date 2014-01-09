package com.coolio.model;

import android.graphics.Bitmap;

public class ObjMenuEntry implements ObjMenu {
	public final String title;
	private Bitmap image;

	public ObjMenuEntry(Bitmap images, String title) {
		this.title = title;
		this.image = images;
	}

	@Override
	public boolean isSection() {
		return false;
	}

	public Bitmap getImage() {
		return image;
	}

	public void setImage(Bitmap image) {
		this.image = image;
	}
}
