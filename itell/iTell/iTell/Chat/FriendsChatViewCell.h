//
//  FriendsViewCell.h
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserData;

@interface FriendsChatViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *lbName;
@property (retain, nonatomic) IBOutlet UIImageView *imImage;
@property (retain, nonatomic) IBOutlet UIImageView *imgBackgound;
@property (retain, nonatomic) IBOutlet UIView *viewStt;
@property (retain, nonatomic) IBOutlet UIScrollView *viewTop;
@property (retain, nonatomic) IBOutlet UIImageView *imgBackgoundTop;
@property (assign, nonatomic) UIViewController *controller;

-(void)configWithUser:(UserData*)user;
-(void)initFriendCell:(int)indexColor;
- (UIView *)bubbleView:(NSString *)text;
@end
