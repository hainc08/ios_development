package com.icts.utils;

import java.util.ArrayList;

import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.Transformation;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;

import com.icts.control.SwipAdapter;

public class AnimationView<T> {
	private final int TIME_SLIDE_ANIMATION = 500;
	private String tag = "itell_move";
	private ArrayList<T> rl = null;
	private int distance = Constant.SCREEN_WIDTH/3;
	private boolean disableLeft = false;
	private boolean disableRight = false;
	private boolean isRelative = true;
	private OnEndAnimation onEndAnimation;
	private OnLeftSlide onLeftSlide;
	private OnRightSlide onRightSlide;
	
	public AnimationView(){
		
	}
	
	public AnimationView(ArrayList<T> rlAnimation,String tag){
		this.rl = rlAnimation; 
		this.tag = tag;
		for (T t : rl) {
			if (t instanceof RelativeLayout){
				RelativeLayout relativeLayout =(RelativeLayout) t;
				relativeLayout.setFocusable(true);
				relativeLayout.setFocusableInTouchMode(true);
				handleEvent(relativeLayout);
			}
			else if (t instanceof LinearLayout){
				LinearLayout relativeLayout =(LinearLayout) t;
				relativeLayout.setFocusable(true);
				relativeLayout.setFocusableInTouchMode(true);
				handleEvent(relativeLayout);
				isRelative = false;
			} 
		}
		
	}
	
	public void setDistance(int dis) {
		distance = dis;
	}

	public void setDisableLeft(boolean disableLeft) {
		this.disableLeft = disableLeft;
	}

	public void setDisableRight(boolean disableRight) {
		this.disableRight = disableRight;
	}

	public void setOnEndAnimation(OnEndAnimation onEndAnimation){
		this.onEndAnimation = onEndAnimation;
	}
	
	public void setOnLeftSlide(OnLeftSlide onLeftSlide){
		this.onLeftSlide = onLeftSlide;
	}
	
	public void setOnRightSlide(OnRightSlide onRightSlide){
		this.onRightSlide = onRightSlide;
	}
	
	protected void handleEvent(final View v){
    	v.setOnTouchListener(new OnTouchListener() {
            private float xStart;
            private int direction = 0;
            View itemUp = null;
            private boolean slideFinish = false;
            public boolean onTouch(final View v, MotionEvent event) {
                if(event.getAction() == MotionEvent.ACTION_DOWN){
                    direction = 0;
                    itemUp = v.findViewWithTag(tag);
                    xStart = event.getX();
                }else if(event.getAction() == MotionEvent.ACTION_MOVE){
                    float offsetX = event.getX() - xStart;
                    if(offsetX < 0){
                        if(direction >=0 ){
                            direction = SwipAdapter.LEFT;
                        }
                    }
                    else if(offsetX > 0){
                        if(direction <=0 ){
                            direction = SwipAdapter.RIGHT;
                        }
                    }
                    else{
                        direction = 0;
                    }
                    //if (offsetX<0){
                    if ((!disableLeft&&direction==SwipAdapter.LEFT)||
                    		(!disableRight&&direction==SwipAdapter.RIGHT)){
                    	if (v instanceof RelativeLayout){
                    		RelativeLayout.LayoutParams params = (LayoutParams) itemUp.getLayoutParams();
                    		params.leftMargin = (int) offsetX;
                        	params.rightMargin = (int) -offsetX;
                        	itemUp.setLayoutParams(params);
                    	}
                    	else if (v instanceof LinearLayout){
                    		LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) itemUp.getLayoutParams();
                         	params.leftMargin = (int) offsetX;
                         	params.rightMargin = (int) -offsetX;
                         	itemUp.setLayoutParams(params);
                    	}
                    	
                    }
                    //}
                }else if(event.getAction() == MotionEvent.ACTION_OUTSIDE || 
                        event.getAction() == MotionEvent.ACTION_CANCEL ||
                        event.getAction() == MotionEvent.ACTION_UP){
                	final int leftMargin;
                    final int rightMargin;
                    final RelativeLayout.LayoutParams params;
                    final LinearLayout.LayoutParams params1;
                	if (v instanceof RelativeLayout){
                		params1 = null;
                		params = (LayoutParams) itemUp.getLayoutParams();
                		leftMargin = params.leftMargin;
                		rightMargin = params.rightMargin;
                	}
                	else {
                		params = null;
                		params1 = (LinearLayout.LayoutParams) itemUp.getLayoutParams();
                		leftMargin = params1.leftMargin;
                		rightMargin = params1.rightMargin;
                	}
                    Animation slideBackAnimation = new Animation(){
                        @Override
                        protected void applyTransformation(float interpolatedTime, Transformation t) {
                           if(direction == SwipAdapter.LEFT && Math.abs(leftMargin) > distance&&!disableLeft){
                        	    if (v instanceof RelativeLayout){
	                                params.leftMargin = (int) (leftMargin - (Constant.SCREEN_WIDTH + leftMargin) * interpolatedTime);
	                                params.rightMargin = -params.leftMargin;
	                                this.setDuration(Math.abs(Constant.SCREEN_WIDTH + leftMargin)*TIME_SLIDE_ANIMATION/Constant.SCREEN_WIDTH);
                        	    }
                        	    else if (v instanceof LinearLayout){
                        	    	params1.leftMargin = (int) (leftMargin - (Constant.SCREEN_WIDTH + leftMargin) * interpolatedTime);
	                                params1.rightMargin = -params1.leftMargin;
	                                this.setDuration(Math.abs(Constant.SCREEN_WIDTH + leftMargin)*TIME_SLIDE_ANIMATION/Constant.SCREEN_WIDTH);
                        	    }
                                slideFinish = true;
                                
                            }
                           else if(direction == SwipAdapter.RIGHT && Math.abs(leftMargin) > distance&&!disableRight){
                        	   if (v instanceof RelativeLayout){
	                               params.leftMargin = (int) (leftMargin+(Constant.SCREEN_WIDTH - leftMargin) * interpolatedTime);
	                               params.rightMargin = -params.leftMargin;
	                               this.setDuration(Math.abs(Constant.SCREEN_WIDTH - leftMargin)*TIME_SLIDE_ANIMATION/Constant.SCREEN_WIDTH);
                        	   }
                        	   else if (v instanceof LinearLayout){
                        		   params1.leftMargin = (int) (leftMargin+(Constant.SCREEN_WIDTH - leftMargin) * interpolatedTime);
	                               params1.rightMargin = -params1.leftMargin;
	                               this.setDuration(Math.abs(Constant.SCREEN_WIDTH - leftMargin)*TIME_SLIDE_ANIMATION/Constant.SCREEN_WIDTH);
                        	   }
                               slideFinish = true;
                           }
                           else{
                        	   if (v instanceof RelativeLayout){
                        		   params.leftMargin = (int) (leftMargin * (1 - interpolatedTime));
                                   params.rightMargin = (int) (rightMargin*(1 - interpolatedTime));
                        	   }
                        	   else if (v instanceof LinearLayout){
                        		   params1.leftMargin = (int) (leftMargin * (1 - interpolatedTime));
                                   params1.rightMargin = (int) (rightMargin*(1 - interpolatedTime));
                        	   }
                                this.setDuration(Math.abs(leftMargin)*TIME_SLIDE_ANIMATION/Constant.SCREEN_WIDTH);
                                slideFinish = false;
                           }
                           
                           if (v instanceof RelativeLayout){
                        	   itemUp.setLayoutParams(params);
                    	   }
                    	   else if (v instanceof LinearLayout){
                    		   itemUp.setLayoutParams(params1);
                    	   }
                            
                        };
                    };
                    itemUp.startAnimation(slideBackAnimation);
                    slideBackAnimation.setAnimationListener(new AnimationListener() {
                        
                        public void onAnimationStart(Animation animation) {
                            
                        }
                        
                        public void onAnimationRepeat(Animation animation) {
                            
                        }
                        
                        public void onAnimationEnd(Animation animation) {
                            if(slideFinish){ //&& onItemSlideChangedListener != null){
                            	if (direction == SwipAdapter.LEFT){
	                                //itemUp.setVisibility(View.INVISIBLE);
	                                if (onLeftSlide!=null){
	                                	onLeftSlide.onLeftSlideFinished(v,itemUp);
	                                }
                            	}
                            	else if (direction == SwipAdapter.RIGHT){
                            		if (onRightSlide!=null){
                            			onRightSlide.onRightSlideFinished(v,itemUp);
                            		}
                            	}
                            }
                            else{
                            	if (v instanceof RelativeLayout){
                            		final RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) itemUp.getLayoutParams();
                	                params.leftMargin = 0;
                	                params.rightMargin = 0;
                	                itemUp.setLayoutParams(params);
                         	   }
                         	   else if (v instanceof LinearLayout){
                         		   final LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) itemUp.getLayoutParams();
                         		   params.leftMargin = 0;
                         		   params.rightMargin = 0;
                         		   itemUp.setLayoutParams(params);
                         	   }
                            }
                            direction = 0;
                        }
                    });
                }
                return true;
            }
        });
    }
    
    public static class CustomAnimationListener implements AnimationListener{

    	private View v;
    	private OnEndAnimation onEndAnimation;
    	public CustomAnimationListener(View v,OnEndAnimation onEndAnimation){
    		this.v = v;
    		this.onEndAnimation = onEndAnimation;
    	}
		@Override
		public void onAnimationEnd(Animation animation) {
			if (v!=null){
				if (onEndAnimation!=null){
					onEndAnimation.onHandle(v);
				}
			}
		}

		@Override
		public void onAnimationRepeat(Animation animation) {
			
		}

		@Override
		public void onAnimationStart(Animation animation) {
			
		}
    }
    
    public interface OnEndAnimation{
    	public abstract void onHandle(View v);
    }
    
    public interface OnLeftSlide{
    	public abstract void onLeftSlideFinished(View v,View itemChild);
    }
    
    public interface OnRightSlide{
    	public abstract void onRightSlideFinished(View v,View itemChild);
    }
}
