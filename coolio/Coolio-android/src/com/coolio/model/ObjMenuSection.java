package com.coolio.model;

public class ObjMenuSection implements ObjMenu{
	private final String title;
	  
	 public ObjMenuSection(String title) {
	  this.title = title;
	 }
	  
	 public String getTitle(){
	  return title;
	 }
	  
	 @Override
	 public boolean isSection() {
	  return true;
	 }
}
