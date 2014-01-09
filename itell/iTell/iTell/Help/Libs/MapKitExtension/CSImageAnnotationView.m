//
//  CSImageAnnotationView.m
//  mapLines
//
//  Created by Craig on 5/15/09.
//  Copyright 2009 Craig Spitzkoff. All rights reserved.
//

#import "CSImageAnnotationView.h"
#import "CSMapAnnotation.h"

#define kHeight 50 
#define kWidth  50
#define kBorder 10
#define kInerImageBorder 1
#define kImageBorder 3
#define kIconWidth 14
#define kIconHeigh 19

@implementation CSImageAnnotationView
@synthesize imageView = _imageView;

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
    [nickNameLb setTextAlignment:UITextAlignmentCenter];
    nickNameLb.numberOfLines = 0;
    nickNameLb.font = [UIFont fontWithName:@"Arial" size:14];
    nickNameLb.textColor = [UIColor whiteColor];
    CGSize nickNameSize = [nickNameLb.text sizeWithFont:nickNameLb.font constrainedToSize:CGSizeMake(250, 9999) lineBreakMode:UILineBreakModeWordWrap];
    nickNameLb.frame = CGRectMake(0, 0, nickNameSize.width + kBorder, nickNameSize.height);
    [self addSubview:nickNameLb];
    yPos = nickNameSize.height;

    
    NSURL *url = [NSURL URLWithString:csAnnotation.userInfo.imageURL];
    _imageView = [[AsyncImageView alloc] init];
    _imageView.backgroundColor = [UIColor whiteColor];
	[_imageView loadImageFromURL:url];
	_imageView.frame = CGRectMake(nickNameLb.frame.size.width/2 - kWidth/2, nickNameLb.frame.size.height +kImageBorder, kWidth, kHeight);
    
    UIView *inerImageView = [[UIView alloc] initWithFrame:CGRectMake(_imageView.frame.origin.x - kInerImageBorder,_imageView.frame.origin.y - kInerImageBorder , _imageView.frame.size.width + 2*kInerImageBorder, _imageView.frame.size.height + 2*kInerImageBorder )];
    inerImageView.backgroundColor = [UIColor whiteColor];
    
    UIView *imageBgView = [[UIView alloc] initWithFrame:CGRectMake(_imageView.frame.origin.x - kImageBorder,nickNameSize.height , _imageView.frame.size.width + 2*kImageBorder, _imageView.frame.size.height + 2*kImageBorder )];
    
	
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"unknow_person.jpg"]];
//    imageView.frame = _imageView.frame;
//    [self addSubview:imageView];
    yPos += kHeight + kInerImageBorder; 
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(nickNameLb.frame.size.width/2 - kIconWidth/2, yPos, kIconWidth, kIconHeigh)];
    NSLog(@"type = %d", csAnnotation.userInfo.type);
    if (csAnnotation.userInfo.type == kTypeFriend) {
        if (csAnnotation.userInfo.isFemale) {
            nickNameLb.backgroundColor = [UIColor redColor];
            imageBgView.backgroundColor = [UIColor redColor];
            iconImageView.image = [UIImage imageNamed:@"location_map_icon-2b.png"];
        } else {
            nickNameLb.backgroundColor = [UIColor blueColor];
            imageBgView.backgroundColor = [UIColor blueColor];
            iconImageView.image = [UIImage imageNamed:@"location_map_icon-1b.png"];
        }
        
    } else if (csAnnotation.userInfo.type == kTypeOther) {
        if (csAnnotation.userInfo.isFemale) {
             nickNameLb.backgroundColor = [UIColor colorWithRed:0.941 green:0.47 blue:0.482 alpha:1.0];
            imageBgView.backgroundColor = [UIColor colorWithRed:0.941 green:0.47 blue:0.482 alpha:1.0];
            iconImageView.image = [UIImage imageNamed:@"location_map_icon-2.png"];
        } else{
             nickNameLb.backgroundColor = [UIColor colorWithRed:68.f/255  green:197.f/255 blue:221.f/255 alpha:1.0];
            imageBgView.backgroundColor = [UIColor colorWithRed:68.f/255  green:197.f/255 blue:221.f/255 alpha:1.0];

            iconImageView.image = [UIImage imageNamed:@"location_map_icon-1.png"];
        }
       
    }    
    [self addSubview:imageBgView];
    [imageBgView release];
    [self addSubview:inerImageView];
    [inerImageView release];
    [self addSubview:_imageView];
    [_imageView release];
    [self addSubview:iconImageView];
    [iconImageView release];
    
  
    UILabel *statusLb = [[UILabel alloc] initWithFrame:CGRectZero];
    statusLb.text = csAnnotation.userInfo.status;
    statusLb.backgroundColor = [UIColor clearColor];
    statusLb.textColor = [UIColor whiteColor];
    statusLb.font = [UIFont fontWithName:@"Arial" size:14];
    statusLb.lineBreakMode = UILineBreakModeWordWrap;
    statusLb.numberOfLines = 0;
    CGSize size = [statusLb.text sizeWithFont:statusLb.font constrainedToSize:CGSizeMake(100, 9999) lineBreakMode:UILineBreakModeWordWrap];
    float ratio =size.height/size.width;
    statusLb.frame = CGRectMake(iconImageView.frame.origin.x + kIconWidth + 5*ratio*kBorder, yPos - size.height/2, size.width + 2*kBorder, size.height);
    
    UIImageView *statusBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map_status.png"]];
    statusBg.frame = CGRectMake(iconImageView.frame.origin.x + kIconWidth + ratio*kBorder , yPos - kBorder  - size.height/2, size.width + 10*ratio*kBorder, size.height + 2*kBorder);
    [self addSubview:statusBg];
    [statusBg release];
    [self addSubview:statusLb];
    [statusLb release];
}
-(void) dealloc
{
	[_imageView release];
	[super dealloc];
}

	 
@end
