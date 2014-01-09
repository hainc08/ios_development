//
//  FriendsViewCell.h
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserData;
@class FriendData;

@protocol SwipeCellDelegate <NSObject>

- (void)tableView:(UITableView *)tableView willSwipeCellAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSwipeCellAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface FriendsViewCell : UITableViewCell<UIScrollViewDelegate>

@property (assign, nonatomic) UIViewController *controller;

@property (retain, nonatomic) IBOutlet UIWebView *wvImage;
@property (retain, nonatomic) IBOutlet UILabel *lbName;
@property (retain, nonatomic) IBOutlet UIImageView *imImage;
@property (retain, nonatomic) IBOutlet UIView *moveAbleCell;

@property (retain, nonatomic) IBOutlet UIScrollView *svScrollCell;

@property (retain, nonatomic) IBOutlet UIImageView *bgImage;

-(void)configWithUser:(FriendData*)user;
@end
