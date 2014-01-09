//
//  ThreadCell.m
//  MessageBubbles
//
//  Created by cwiles on 6/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ThreadCell.h"

#define kDateTimeValueTag 2
#define ALIGHT_LEFT     2
#define ALIGHT_RIGHT    318

@implementation ThreadCell


@synthesize msgText;
@synthesize imgName;
@synthesize imgAva;
@synthesize fromSelf;
@synthesize imgAvatar;
@synthesize dataImageFriend;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
  if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
    
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    self.accessoryType   = UITableViewCellAccessoryNone;
    self.backgroundColor = [UIColor clearColor];
  }
  
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
}
- (void)loadDataForCell {
    CGSize size           = [ThreadCell calcTextHeight:self.msgText];
    // build single chat bubble cell with given text
	UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
	returnView.backgroundColor = [UIColor clearColor];
	
	UIImage *bubble = [[UIImage imageNamed:self.imgName] stretchableImageWithLeftCapWidth:24 topCapHeight:15];
	UIImageView *bubbleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width + 35, size.height + 10)];
	[bubbleImageView setImage:bubble];
	UIFont *font = [UIFont systemFontOfSize:14];
	//CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(150.0f, 1000.0f) lineBreakMode:UILineBreakModeCharacterWrap];
	
	UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, size.width, size.height)];
	bubbleText.backgroundColor = [UIColor clearColor];
	bubbleText.font = font;
	[font release];
	bubbleText.numberOfLines = 0;
	bubbleText.lineBreakMode = UILineBreakModeWordWrap;;
	bubbleText.text = msgText;
	NSLog(@"text = %@", msgText);
	
	//bubbleImageView.frame = CGRectMake(0.0f, 0.0f, 200.0f, size.height+20.0f);
	
	//For Date&Time Display
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    NSLog(@"date = :%@", currentTime);
    [dateFormatter release];
	UILabel *datetimeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
	datetimeLabel.font = [UIFont boldSystemFontOfSize:10];
	datetimeLabel.tag = kDateTimeValueTag;
	datetimeLabel.textAlignment = UITextAlignmentCenter;
	datetimeLabel.text = currentTime;
	datetimeLabel.textColor = [UIColor lightGrayColor];
	[datetimeLabel setBackgroundColor:[UIColor clearColor]];
	
	if(self.fromSelf){
		returnView.frame = CGRectMake(ALIGHT_RIGHT - size.width - 35, 15.0f,size.width + 35, size.height + 10);
		datetimeLabel.frame = CGRectMake(ALIGHT_RIGHT - 50, 0.0f, 50.0f, 20.0f);
	}else{
        UIImageView *imgBordeAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_border.png"]];
        imgBordeAvatar.frame = CGRectMake(ALIGHT_LEFT, 2, 42, 42);
        [self addSubview:imgBordeAvatar];
        [imgBordeAvatar release];
        imgBordeAvatar = nil;
        imgAvatar = [[UIImageView alloc] initWithImage:[UIImage imageWithData:dataImageFriend]];
        imgAvatar.frame = CGRectMake(ALIGHT_LEFT, 2, 42, 42);
        [self addSubview:imgAvatar];
		returnView.frame = CGRectMake(45.0f, 15.0f,size.width + 35, size.height + 10);
		datetimeLabel.frame = CGRectMake(45.0f, 0.0f, 50.0f, 20.0f);
	}
    
	[returnView addSubview:bubbleImageView];
	[bubbleImageView release];
	[returnView addSubview:bubbleText];
	[bubbleText release];
	[self addSubview:datetimeLabel];
	[datetimeLabel release];
    datetimeLabel = nil;
    [self.contentView insertSubview:returnView atIndex:1];
    NSLog(@"===X: === Y");
}
- (void)layoutSubviews {
//
//    CGSize size           = [ThreadCell calcTextHeight:self.msgText];
//    // build single chat bubble cell with given text
//	UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
//	returnView.backgroundColor = [UIColor clearColor];
//	
//	UIImage *bubble = [[UIImage imageNamed:self.imgName] stretchableImageWithLeftCapWidth:24 topCapHeight:15];
//	UIImageView *bubbleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width + 35, size.height + 10)];
//	[bubbleImageView setImage:bubble];
//	UIFont *font = [UIFont systemFontOfSize:14];
//	//CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(150.0f, 1000.0f) lineBreakMode:UILineBreakModeCharacterWrap];
//	
//	UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, size.width, size.height)];
//	bubbleText.backgroundColor = [UIColor clearColor];
//	bubbleText.font = font;
//	[font release];
//	bubbleText.numberOfLines = 0;
//	bubbleText.lineBreakMode = UILineBreakModeWordWrap;;
//	bubbleText.text = msgText;
//	NSLog(@"text = %@", msgText);
//	
//	//bubbleImageView.frame = CGRectMake(0.0f, 0.0f, 200.0f, size.height+20.0f);
//	
//	//For Date&Time Display
//    NSDate *today = [NSDate date];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"HH:mm"];
//    NSString *currentTime = [dateFormatter stringFromDate:today];
//    NSLog(@"date = :%@", currentTime);
//    [dateFormatter release];
//	UILabel *datetimeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
//	datetimeLabel.font = [UIFont boldSystemFontOfSize:10];
//	datetimeLabel.tag = kDateTimeValueTag;
//	datetimeLabel.textAlignment = UITextAlignmentCenter;
//	datetimeLabel.text = currentTime;
//	datetimeLabel.textColor = [UIColor lightGrayColor];
//	[datetimeLabel setBackgroundColor:[UIColor clearColor]];
//	
//	if(self.fromSelf){
//		returnView.frame = CGRectMake(ALIGHT_RIGHT - size.width - 35, 15.0f,size.width + 35, size.height + 10);
//		datetimeLabel.frame = CGRectMake(ALIGHT_RIGHT - 50, 0.0f, 50.0f, 20.0f);
//	}else{
//        UIImageView *imgBordeAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_border.png"]];
//        imgBordeAvatar.frame = CGRectMake(ALIGHT_LEFT, 2, 42, 42);
//        [self addSubview:imgBordeAvatar];
//        [imgBordeAvatar release];
//        imgBordeAvatar = nil;
//        imgAvatar = [[UIImageView alloc] initWithImage:[UIImage imageWithData:dataImageFriend]];
//        imgAvatar.frame = CGRectMake(ALIGHT_LEFT, 2, 42, 42);
//        [self addSubview:imgAvatar];
//		returnView.frame = CGRectMake(45.0f, 15.0f,size.width + 35, size.height + 10);
//		datetimeLabel.frame = CGRectMake(45.0f, 0.0f, 50.0f, 20.0f);
//	}
//    
//	[returnView addSubview:bubbleImageView];
//	[bubbleImageView release];
//	[returnView addSubview:bubbleText];
//	[bubbleText release];
//	[self addSubview:datetimeLabel];
//	[datetimeLabel release];
//    datetimeLabel = nil;
//    [self.contentView insertSubview:returnView atIndex:1];
//    NSLog(@"===X: === Y");
}

+ (CGSize)calcTextHeight:(NSString *)str {
  
  CGSize textSize = {150.0, 20000.0};
  CGSize size     = [str sizeWithFont:[UIFont systemFontOfSize:14.0] 
                    constrainedToSize:textSize];
  
  return size;
}
- (void)dealloc {
  [msgText release];
  [imgName release];
  [super dealloc];
}


@end
