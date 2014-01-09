//
//  NewsCustomCell.m
//  Istation
//
//  Created by Admin on 26/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BlockListCell.h"
#import "UIImage-WebImage.h"
#import "ProfileViewController.h"

@interface BlockListCell()
@property(nonatomic, retain)FriendData *frData;
@end
@implementation BlockListCell

@synthesize supressDeleteButton;
@synthesize  lbName,imgScroll,imgBackgound,scrollCell,imgAva;
@synthesize frData;
@synthesize delegate;
@synthesize controller;
@synthesize indexCell;

// Recursively go up the view hierarchy to find our tableView
-(UITableView*)getTableView:(UIView*)theView
{
    if (!theView.superview)
        return nil;
    
    if ([theView.superview isKindOfClass:[UITableView class]])
        return (UITableView*)theView.superview;
    
    return [self getTableView:theView.superview];
}
-(void)initFriendCell:(int)indexColor {
    [scrollCell setContentSize:CGSizeMake(321, 65)];
    self.scrollCell.delegate = self;
    self.imgBackgound.image = [UIImage imageNamed:[NSString stringWithFormat:@"outer_tabnner-tab_chat_%d.png",indexColor]];
    self.imgScroll.image = [UIImage imageNamed:[NSString stringWithFormat:@"inner-tab_chat_%d.png",indexColor]];
}
-(void)configWithUser:(FriendData*)user {
    self.frData = user;
    self.lbName.text = user.name;    
    
    [UIImage processImageDataWithURLString:user.urlAvatar andBlock:^(NSData *imageData) {
        user.avatar = [UIImage imageWithData:imageData];
        if (self.frData == user) {
            if (user.avatar != nil) {
                self.imgAva.image = user.avatar;
            }else {
                self.imgAva.image = [UIImage imageNamed:@"load-1.png"];
                NSLog(@"download error image: %@", user);
            }
        }
    }];
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    // We suppress the Delete button by explicitly not calling
    // super's implementation
    if (supressDeleteButton)
    {
        // Reset the editing state of the table back to NO
        UITableView* tableView = [self getTableView:self];
        tableView.editing = NO;
    }
    else
        [super setEditing:editing animated:animated];
}

#pragma mark - ScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    float x = scrollView.contentOffset.x;
    if (x<-80) {
        ProfileViewController *profileController = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
        profileController.userData = frData;
        [self.controller.navigationController pushViewController:profileController animated:YES];
    } 
    if(x > 50) {
        if([delegate respondsToSelector:@selector(blockUserSelected:indexCell:)]) {
            [delegate blockUserSelected:self indexCell:self.indexCell];
        }else {
            [NSException raise:NSInternalInconsistencyException format:@"Delegate doesn't respond to blockUserSelected"];
        }
    }
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    scrollCell.frame = CGRectMake(0, 0, 320, 65);
}

@end
