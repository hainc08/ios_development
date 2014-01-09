//
//  CustomSwitch.h
//
//  Created by Ali Nour on 3/10/10.
//  Copyright 2010 BadrIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CAGradientLayer.h>
#import "GlossyLabel.h"
#import "SwitchSlider.h"
#import "SwitchBorder.h"

@class CustomSwitch;
@protocol CustomSwitchDelegate

- (void)valueChanged:(BOOL)switchValue sender:(CustomSwitch*)sender;

@end

@interface CustomSwitch : UIView {
	GlossyLabel *onLabel;
	GlossyLabel *offLabel;
	BOOL on;
	SwitchSlider *slider;
    CGPoint oldTouchPos;
    BOOL isMoving;
}

@property (nonatomic, assign) id<CustomSwitchDelegate> delegate;
@property (nonatomic, retain) NSString *onText;
@property (nonatomic, retain) NSString *offText;
@property (nonatomic) BOOL on;

+ (int)margin;

- (id)initWithFrame:(CGRect)frame
		onLabelText:(NSString *)onLabelText
	   offLabelText:(NSString *) offLabelText;

- (id)initWithFrame:(CGRect)frame
		onLabelText:(NSString *)onLabelText
	   offLabelText:(NSString *) offLabelText
onLabelBackgroundColor:(UIColor *)onLabelBackgroundColor
offLabelBackgroundColor:(UIColor *)offLabelBackgroundColor
onLabelTextColor:(UIColor *)onLabelTextColor
offLabelTextColor:(UIColor *)offLabelTextColor
		sliderColor:(UIColor *)sliderColor;

- (void)setOnBackgroundColor:(UIColor *)color;
- (void)setOffBackgroundColor:(UIColor *)color;
- (void)setOnTextColor:(UIColor *)color;
- (void)setOffTextColor:(UIColor *)color;
- (void)setSliderColor:(UIColor *)color;
- (void)setSliderImage:(UIImage*)image;
-(void)delegateCallOn:(BOOL)value;
@end
