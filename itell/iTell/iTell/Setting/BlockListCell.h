//
//  NewsCustomCell.h
//  Istation
//
//  Created by Admin on 26/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserData.h"
#import "FriendData.h"
@protocol BlockListCellDelegate <NSObject>
@optional
- (void)blockUserSelected:(UITableViewCell *)tbCell indexCell:(int)index;
@end
@interface BlockListCell : UITableViewCell<BlockListCellDelegate>{
    // SideSwipe
    BOOL supressDeleteButton;
}

@property (retain, nonatomic) IBOutlet UILabel *lbName;
@property (retain, nonatomic) IBOutlet UIImageView *imgScroll;
@property (retain, nonatomic) IBOutlet UIImageView *imgBackgound;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollCell;
@property (retain, nonatomic) IBOutlet UIImageView *imgAva;
@property (retain, nonatomic) UIViewController *controller;
@property (retain, nonatomic) id delegate;
@property (assign, nonatomic) int indexCell;
///
@property (nonatomic) BOOL supressDeleteButton;

-(void)configWithUser:(UserData*)user;
-(void)initFriendCell:(int)indexColor;

@end
