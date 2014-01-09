//
//  FriendsViewCell.m
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingPushViewCell.h"
#import "UserData.h"
#import "ITMarco.h"
#import <QuartzCore/QuartzCore.h>


#define kTimeOutLoadImage 60

@interface SettingPushViewCell()
@property(nonatomic, retain)UserData *userData;
@end

@implementation SettingPushViewCell
@synthesize lbName;
@synthesize imgIcon,imgOnOff;
@synthesize userData;
@synthesize imgBackgound;
@synthesize viewTop;
@synthesize controller;
@synthesize imgBgScroll;
@synthesize indexCell;
@synthesize isOn;
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
        if (self.isOn) {
            self.imgOnOff.image = [UIImage imageNamed:@"off_button.png"];
            self.isOn = NO;
        }else {
            self.imgOnOff.image = [UIImage imageNamed:@"on_button.png"];
            self.isOn = YES;
        }
        if([delegate respondsToSelector:@selector(stateOnOff:isOn:)]) {
            [delegate stateOnOff:self.indexCell isOn:isOn];
        }else {
            [NSException raise:NSInternalInconsistencyException format:@"Delegate doesn't respond to stateOnOff"];
        }
    }
    if (x < -50) {
        [self.controller.navigationController popViewControllerAnimated:YES];
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
