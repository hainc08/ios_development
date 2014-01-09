//
//  FriendsViewCell.m
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsChatViewCell.h"
#import "UserData.h"
#import "ITMarco.h"
#import <QuartzCore/QuartzCore.h>
#import "ChattingViewController.h"
#import "ProfileViewController.h"

#define kTimeOutLoadImage 60

@interface FriendsChatViewCell()
@property(nonatomic, retain)UserData *userData;
@end

@implementation FriendsChatViewCell
@synthesize lbName;
@synthesize imImage;
@synthesize userData;
@synthesize imgBackgound;
@synthesize viewStt,viewTop,imgBackgoundTop;
@synthesize controller;

-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self =[super initWithCoder:aDecoder])) {
        
    }
    return self;
}
-(void)initFriendCell:(int)indexColor {
    [viewTop setContentSize:CGSizeMake(308, 63)];
    self.viewTop.delegate = self;
    self.imgBackgound.image = [UIImage imageNamed:[NSString stringWithFormat:@"outer_tabnner-tab_chat_%d.png",indexColor]];
    self.imgBackgoundTop.image = [UIImage imageNamed:[NSString stringWithFormat:@"inner-tab_chat_%d.png",indexColor]];
}

-(void)configWithUser:(UserData*)user{
    self.userData = user;
    self.lbName.text = user.name;
    UIImage *img = user.avatar;
    if (img != nil) {
        self.imImage.image = img;
    }else {
        self.imImage.image = [UIImage imageNamed:@"load-1.png"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - ScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    ITLOG(@"isDecelerate = %d", decelerate);
    float x = scrollView.contentOffset.x;
    if (x<-80) {
        
        ChattingViewController *chatting = [[ChattingViewController alloc] chattingWithUser:self.userData];
       // chatting.userData = self.userData;
        [self.controller.navigationController pushViewController:chatting animated:TRUE];
        [chatting release];
    } 
    if(x > 80) {
        ProfileViewController *profile = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
        profile.userData = self.userData;
        [profile setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.controller.navigationController pushViewController:profile animated:YES];
        [profile release];
        NSLog(@"go to Profile");
    }
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    viewTop.frame = CGRectMake(7, 1, 306, 63);
}

- (UIView *)bubbleView:(NSString *)text {
	// build single chat bubble cell with given text
	UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
	returnView.backgroundColor = [UIColor clearColor];
	
	UIImage *bubble = [UIImage imageNamed:@"bubble_list@2x.png"];
	UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:25 topCapHeight:10]];
	UIFont *font = [UIFont systemFontOfSize:14];
	CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(200.0f, 1000.0f) lineBreakMode:UILineBreakModeCharacterWrap];
	
	UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 0.0f, size.width+5, size.height+5)];
	bubbleText.backgroundColor = [UIColor clearColor];
	bubbleText.font = font;
	[font release];
	bubbleText.numberOfLines = 0;
	bubbleText.lineBreakMode = UILineBreakModeCharacterWrap;
	bubbleText.text = text;
	
    returnView.frame = CGRectMake(0.0f, 0.0f, 200.0f, size.height+10.0f);
    bubbleImageView.frame = CGRectMake(0, 0.0f,  size.width + 30.0f, size.height+10.0f);
    
	[returnView addSubview:bubbleImageView];
	[bubbleImageView addSubview:bubbleText];
	[bubbleText release];
    [bubbleImageView release];
    
	return [returnView autorelease];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Friends chat view");
}
- (void)dealloc {
    [userData release];
    [lbName release];
    [imImage release];
    [super dealloc];
}
@end
