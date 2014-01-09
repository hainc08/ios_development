//
//  CSCompanyAnnotationView.m
//  iTell
//
//  Created by Thap on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CSCompanyAnnotationView.h"
#import "CSMapAnnotation.h"

#define kHeight 50 
#define kWidth  50
#define kBorder 10
#define kIconWidth 14
#define kIconHeigh 19

@implementation CSCompanyAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
	self.frame = CGRectMake(0, 0, 150, 50);
	self.backgroundColor = [UIColor clearColor];
    
	
	csAnnotation = (CSMapAnnotation*)annotation;
    
	return self;
	
}
-(void)showAnotationInfo{
    
    float yPos = 0;
    UILabel *nickNameLb = [[UILabel alloc] initWithFrame:CGRectZero];
    nickNameLb.text = csAnnotation.userInfo.nickname;
    NSLog(@"nickname = %@", nickNameLb.text);
    nickNameLb.lineBreakMode = UILineBreakModeWordWrap;
    nickNameLb.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    nickNameLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    nickNameLb.numberOfLines = 0;
    nickNameLb.font = [UIFont fontWithName:@"Arial" size:14];
    nickNameLb.textColor = [UIColor whiteColor];
    CGSize nickNameSize = [nickNameLb.text sizeWithFont:nickNameLb.font constrainedToSize:CGSizeMake(250, 9999) lineBreakMode:UILineBreakModeWordWrap];
    nickNameLb.frame = CGRectMake(0, 0, nickNameSize.width, nickNameSize.height);
    [self addSubview:nickNameLb];
        
    yPos = nickNameSize.height;
    
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(nickNameSize.width/2 - kIconWidth/2, yPos, kIconWidth, kIconHeigh)];
    iconImageView.image = [UIImage imageNamed:@"sale-location_icon.png"];
    [self addSubview:iconImageView];
    [iconImageView release];
        
}
-(void) dealloc
{
	
	[super dealloc];
}

@end
