//
//  CustomSwitch.m
//  
//  Created by Ali Nour on 3/10/10.
//  Copyright 2010 BadrIT. All rights reserved.
//

#import "CustomSwitch.h"

static int margin = 4;

@implementation CustomSwitch

@synthesize delegate, on;
@synthesize onText, offText;

+ (int)margin {
	return margin;
}

-(void)showAnimation{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    if (on) {
        CGRect tmpFrame;
        tmpFrame = onLabel.frame;
        tmpFrame.origin.x = 0;
        onLabel.frame = tmpFrame;
		
        tmpFrame = slider.frame;
        tmpFrame.origin.x = onLabel.frame.size.width - margin;
        slider.frame = tmpFrame;
		
        tmpFrame = offLabel.frame;
        tmpFrame.origin.x = slider.frame.origin.x + slider.frame.size.width - margin;
        offLabel.frame = tmpFrame;
		
    } else {
        CGRect tmpFrame = onLabel.frame;
        tmpFrame.origin.x = -tmpFrame.size.width + margin;
        onLabel.frame = tmpFrame;
		
        tmpFrame = slider.frame;
        tmpFrame.origin.x = 0;
        slider.frame = tmpFrame;
		
        tmpFrame = offLabel.frame;
        tmpFrame.origin.x = slider.frame.origin.x + slider.frame.size.width - margin;
        offLabel.frame = tmpFrame;
		
    }
    [UIView commitAnimations];
}
- (void)setOn:(BOOL)switchValue {
    if (on!= switchValue) {
        on = switchValue;
        [self.delegate valueChanged:on sender:self];
    }
    [self showAnimation];
}

-(void)delegateCallOn:(BOOL)value{
    if (on!= value) {
        on = value;
        [self showAnimation];
    }
}

- (id)initWithFrame:(CGRect)frame {
	return [self initWithFrame:frame onLabelText:onText offLabelText:offText];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        static int sliderWidth = 30;
        self.backgroundColor = [UIColor clearColor];
        UIFont *font = [UIFont boldSystemFontOfSize:13];
		int labelWidth = self.frame.size.width-sliderWidth+margin;
		int height  = self.frame.size.height;
		
		slider = [[SwitchSlider alloc] initWithFrame:CGRectMake(0, 0, sliderWidth, height)];
		slider.color = [UIColor clearColor];
		
		onLabel = [[GlossyLabel alloc]
				   initWithFrame:CGRectMake(-labelWidth + margin, 2, labelWidth, height -4)];
		onLabel.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_on.png"]];
		onLabel.textColor = [UIColor whiteColor];
		onLabel.font = font;
		onLabel.textAlignment = UITextAlignmentCenter;
		onLabel.text = @"ON";
		[self addSubview:onLabel];
		
		offLabel = [[GlossyLabel alloc]
					initWithFrame:CGRectMake(slider.frame.size.width - margin, 2,
											 labelWidth, height -4)]; 
		offLabel.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_off.png"]];
		offLabel.textColor = [UIColor whiteColor];
		offLabel.text = @"OFF";
		offLabel.textAlignment = UITextAlignmentCenter;
		offLabel.font = font;
		[self addSubview:offLabel];
		
		[self addSubview:slider];
		
		// Setup the view frame and attributes
		CGRect tmpFrame = self.frame;
		tmpFrame.size.width = labelWidth + slider.frame.size.width - margin;
		tmpFrame.size.height = height;
		self.frame = tmpFrame;
		self.clipsToBounds = YES;
		//self.layer.cornerRadius = 2 * margin;
		
		tmpFrame.origin.x = 0;
		tmpFrame.origin.y = 0;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
		onLabelText:(NSString *)onLabelText
	   offLabelText:(NSString *) offLabelText {
	return [self initWithFrame:frame
				   onLabelText:onLabelText
				  offLabelText:offLabelText
		onLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_on.png"]]
	   offLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_off.png"]]
			  onLabelTextColor:[UIColor whiteColor]
			 offLabelTextColor:[UIColor whiteColor]
				   sliderColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"handle.png"]]];
}

- (id)initWithFrame:(CGRect)frame
		onLabelText:(NSString *)onLabelText
	   offLabelText:(NSString *) offLabelText
onLabelBackgroundColor:(UIColor *)onLabelBackgroundColor
offLabelBackgroundColor:(UIColor *)offLabelBackgroundColor
   onLabelTextColor:(UIColor *)onLabelTextColor
  offLabelTextColor:(UIColor *)offLabelTextColor
		sliderColor:(UIColor *)sliderColor {
	
	if (self = [super initWithFrame:frame]) {
		
		// Initialization code
		UIFont *font = [UIFont boldSystemFontOfSize:13];
		int labelWidth = frame.size.width;
		int height  = frame.size.height;
		
		slider = [[SwitchSlider alloc] initWithFrame:CGRectMake(0, 0, 30, height)];
		slider.color = sliderColor;
		
		onLabel = [[GlossyLabel alloc]
				   initWithFrame:CGRectMake(-labelWidth + margin, 2, labelWidth, height -4)];
		onLabel.backgroundColor = onLabelBackgroundColor;
		onLabel.textColor = onLabelTextColor;
		onLabel.font = font;
		onLabel.textAlignment = UITextAlignmentCenter;
		onLabel.text = onLabelText;
		[self addSubview:onLabel];
		
		offLabel = [[GlossyLabel alloc]
					initWithFrame:CGRectMake(slider.frame.size.width - margin, 2,
											 labelWidth, height -4)]; 
		offLabel.backgroundColor = offLabelBackgroundColor;
		offLabel.textColor = offLabelTextColor;
		offLabel.text = offLabelText;
		offLabel.textAlignment = UITextAlignmentCenter;
		offLabel.font = font;
		[self addSubview:offLabel];
		
		[self addSubview:slider];
		
		// Setup the view frame and attributes
		CGRect tmpFrame = self.frame;
		tmpFrame.size.width = labelWidth + slider.frame.size.width - margin;
		tmpFrame.size.height = height;
		self.frame = tmpFrame;
		self.clipsToBounds = YES;
		//self.layer.cornerRadius = 2 * margin;
		
		tmpFrame.origin.x = 0;
		tmpFrame.origin.y = 0;
		
		// Subview to draw the border.
//		SwitchBorder *border = [[SwitchBorder alloc] initWithFrame:tmpFrame withBorderWidth:2];
//		[self addSubview:border];
//		[border release];
		
    }
    return self;
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	oldTouchPos = [[touches anyObject] locationInView:self];
    isMoving = NO;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    isMoving = YES;
    CGPoint currPos = [[touches anyObject] locationInView:self];
    
    CGRect tmpFrame;    
    float offset = currPos.x - oldTouchPos.x;
    tmpFrame = onLabel.frame;
    if (tmpFrame.origin.x+offset > 0){
        offset =0 - tmpFrame.origin.x;
    }else if (tmpFrame.origin.x + offset < -tmpFrame.size.width + margin){
        offset = -tmpFrame.size.width + margin - tmpFrame.origin.x;
    }
    tmpFrame.origin.x += offset;
    onLabel.frame = tmpFrame;
    
    tmpFrame = slider.frame;
    tmpFrame.origin.x += offset;
    slider.frame = tmpFrame;
    
    tmpFrame = offLabel.frame;
    tmpFrame.origin.x +=offset;
    offLabel.frame = tmpFrame;
    oldTouchPos = currPos;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (isMoving) {
        float middle = (-onLabel.frame.size.width + margin)*0.5f;
        if (onLabel.frame.origin.x < middle) {
            self.on = NO;
        }else {
            self.on = YES;
        }
    }else {
        self.on = !self.on;
    }
	
}

- (void)setOnBackgroundColor:(UIColor *)color {
	onLabel.backgroundColor = color;
	[onLabel setNeedsDisplay];
}

- (void)setOffBackgroundColor:(UIColor *)color {
	offLabel.backgroundColor = color;
	[offLabel setNeedsDisplay];
}

- (void)setOnTextColor:(UIColor *)color {
	onLabel.textColor = color;
	[onLabel setNeedsDisplay];
}

- (void)setOffTextColor:(UIColor *)color {
	offLabel.textColor = color;
	[offLabel setNeedsDisplay];
}

- (void)setSliderColor:(UIColor *)color {
	slider.color = color;
	[slider setNeedsDisplay];
}
-(void)setSliderImage:(UIImage *)image{
    slider.image = image;
    [slider setNeedsDisplay];
}

- (void)dealloc {
	
	self.delegate = nil;
	
	[slider release];
	[onLabel release];
	[offLabel release];
	[super dealloc];
}


@end
