//
//  ProfileSettingCellViewController.h
//  iTell
//
//  Created by Thap on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProfileSettingCellDelegate;

@interface ProfileSettingCellViewController : UITableViewCell<UIScrollViewDelegate>
{

    id <ProfileSettingCellDelegate> delegate;
}
@property(nonatomic, retain) IBOutlet UIImageView *iconImageView;
@property(nonatomic, retain) IBOutlet UILabel *textLb;
@property(nonatomic, assign) IBOutlet UIScrollView *scroll;
@property(nonatomic, assign) NSInteger cellIndex;
@property(nonatomic, retain) id <ProfileSettingCellDelegate> delegate;
@end

@protocol ProfileSettingCellDelegate <NSObject>

@optional
-(void)cellSelected:(NSInteger)cellIndex;

@end
