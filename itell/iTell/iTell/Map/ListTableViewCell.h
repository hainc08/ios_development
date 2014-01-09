//
//  ListTableViewCell.h
//  iTell
//
//  Created by admin trator on 8/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListTableViewCellDelegate;
@class UserInfo;
@interface ListTableViewCell : UITableViewCell<UIScrollViewDelegate>
{
    IBOutlet UIScrollView *_scrollView;   
    IBOutlet UIImageView *avataView;
    IBOutlet UILabel *nickNameLb;
    IBOutlet UILabel *statusLb;
    IBOutlet UILabel *timeStt;
    IBOutlet UIImageView *locationImageView;
    IBOutlet UIImageView *outerImageView;
    IBOutlet UIImageView *interShadowImageView;
    IBOutlet UIImageView *interImageView;
    id <ListTableViewCellDelegate> delegate;
}
@property (nonatomic, retain) UserInfo *userInfo;
@property (nonatomic, retain) id <ListTableViewCellDelegate> delegate;
@property (nonatomic, assign) NSInteger cellIndex;

- (void) showCellInfo;

@end

@protocol ListTableViewCellDelegate<NSObject>

@optional

- (void) switchToLeftView:(NSInteger) cellIndex;
- (void) switchToRightView:(NSInteger) cellIndex;

@end