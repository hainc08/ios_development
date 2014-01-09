//
//  FriendsViewCell.m
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsViewCell.h"
#import "UserData.h"
#import "FriendData.h"

#import "ITMarco.h"
#import "UIImage-WebImage.h"
#import <QuartzCore/QuartzCore.h>
#import "ProfileViewController.h"
#import "MPFoldTransition.h"

#define kTimeOutLoadImage 60

@interface FriendsViewCell()
@property(nonatomic, retain)FriendData *userData;
@end

@implementation FriendsViewCell
@synthesize wvImage;
@synthesize lbName;
@synthesize imImage;
@synthesize moveAbleCell;
@synthesize svScrollCell;
@synthesize bgImage;
@synthesize userData;
@synthesize controller;

-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self =[super initWithCoder:aDecoder])) {
        self.imImage.layer.cornerRadius = 8.0;
		self.imImage.layer.masksToBounds = YES;
		self.imImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
		self.imImage.layer.borderWidth = 2.0;
    }
    return self;
}

- (void)cellWasSwiped:(UISwipeGestureRecognizer *)recognizer {
    ProfileViewController *profile = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    profile.userData = self.userData;
    
    
    UIView *fromView = self.controller.view;
    UIView *toView = profile.view;
    toView.alpha = 0;
    [fromView.superview addSubview:toView];
    [UIView animateWithDuration:0.5f animations:^{
        fromView.alpha = 0.5;
        toView.alpha = 0.5;
        self.moveAbleCell.center = CGPointMake(-80, self.moveAbleCell.center.y);
        controller.navigationController.navigationBar.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        if(finished){
            [toView removeFromSuperview];
            [controller.navigationController pushViewController:profile animated:NO];
            profile.view = toView;
            [toView addSubview:fromView];
            controller.navigationController.navigationBar.alpha = 1;
        }
        [UIView animateWithDuration:0.5f animations:^{
            fromView.alpha = 0;
            toView.alpha = 1;
             self.moveAbleCell.center = CGPointMake(-160, self.moveAbleCell.center.y);
        } completion:^(BOOL finished) {
            controller.navigationController.navigationBar.alpha = 1;
            [fromView removeFromSuperview];
            //[controller.navigationController pushViewController:profile animated:NO];
            fromView.alpha = 1;
            self.moveAbleCell.center = CGPointMake(160, self.moveAbleCell.center.y);
        }];
        
    }];
}

-(void)configWithUser:(FriendData*)user{
    self.userData = user;
    self.lbName.text = user.name;
    self.svScrollCell.contentSize = CGSizeMake(320.6, 80);
//    self.svScrollCell.contentInset = UIEdgeInsetsMake(0, 0, 0, 40);
//    self.svScrollCell.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0 );
    
    self.svScrollCell.delegate = self;
    self.imImage.layer.cornerRadius = 4.0;
    self.imImage.layer.masksToBounds = YES;
    //self.imImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //self.imImage.layer.borderWidth = 2.0;
    UIImage *img = user.avatar;
    if (img != nil) {
        self.imImage.image = img;
    }else {
        self.imImage.image = [UIImage imageNamed:@"unknow_person.jpg"];
        [UIImage processImageDataWithURLString:user.urlAvatar andBlock:^(NSData *imageData) {
            user.avatar = [UIImage imageWithData:imageData];
            if (self.userData == user) {
                if (user.avatar != nil) {
                    self.imImage.image = user.avatar;
                }else {
                    ITLOGERROR(@"download error image: %@", user);
                }
            }
        }];
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
        ProfileViewController *profile = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
        profile.userData = self.userData;
        [self.controller.navigationController pushViewController:profile foldStyle:MPFoldStyleFlipFoldBit(MPFoldStyleCubic)];
        [profile release];
    }    
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}


- (void)dealloc {
    [userData release];
    [wvImage release];
    [lbName release];
    [imImage release];
    [moveAbleCell release];
    [svScrollCell release];
    [bgImage release];
    [super dealloc];
}
@end
