//
//  FriendsViewCell.h
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SettingViewCellDelegate <NSObject>
@optional
- (void)viewCellSelected:(UITableViewCell *)tbCell indexCell:(int)index;
@end

@class UserData;

@interface SettingViewCell : UITableViewCell<SettingViewCellDelegate>
@property (retain, nonatomic) IBOutlet UILabel *lbName;
@property (retain, nonatomic) IBOutlet UIImageView *imgIcon;
@property (retain, nonatomic) IBOutlet UIImageView *imgBackgound;
@property (retain, nonatomic) IBOutlet UIImageView *imgBgScroll;
@property (retain, nonatomic) IBOutlet UIScrollView *viewTop;
@property (assign, nonatomic) UIViewController *controller;
@property (assign, nonatomic) int indexCell;
@property (retain, nonatomic) id delegate;

-(void)configWithUser:(UserData*)user;
-(void)initSettingCell;

@end


