//
//  FriendsViewCell.m
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingViewCell.h"
#import "UserData.h"
#import "ITMarco.h"
#import <QuartzCore/QuartzCore.h>
#import "PushNotifiViewController.h"
#import "ProfileSettingViewController.h"
#import "PrivacyViewController.h"
#import "HelpViewController.h"
#import "AboutViewController.h"

#define kTimeOutLoadImage 60

@interface SettingViewCell()
@property(nonatomic, retain)UserData *userData;
@end

@implementation SettingViewCell
@synthesize lbName;
@synthesize imgIcon;
@synthesize userData;
@synthesize imgBackgound;
@synthesize viewTop;
@synthesize controller;
@synthesize imgBgScroll;
@synthesize indexCell;
@synthesize delegate;

-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self =[super initWithCoder:aDecoder])) {
        
    }
    return self;
}
-(void)initSettingCell {
    [viewTop setContentSize:CGSizeMake(321, 65)];
    self.viewTop.delegate = self;

}

-(void)configWithUser:(UserData*)user{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - ScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    ITLOG(@"isDecelerate = %d", decelerate);
    float x = scrollView.contentOffset.x;
    if(x > 50) {
        if([delegate respondsToSelector:@selector(viewCellSelected:indexCell:)]) {
            [delegate viewCellSelected:self indexCell:self.indexCell];
        }else {
            [NSException raise:NSInternalInconsistencyException format:@"Delegate doesn't respond to SettingViewCell"];
        }
    }
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    viewTop.frame = CGRectMake(0, 0, 320, 65);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Friends chat view");
}
- (void)dealloc {
    [userData release];
    [lbName release];
    [imgIcon release];
    [viewTop release];
    [super dealloc];
}
@end
