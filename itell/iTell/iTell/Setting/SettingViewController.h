//
//  SettingViewController.h
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewCell.h"
#import "PushNotifiViewController.h"
#import "ProfileSettingViewController.h"
#import "PrivacyViewController.h"
#import "HelpViewController.h"
#import "AboutViewController.h"

@interface SettingViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,SettingViewCellDelegate> {
    IBOutlet UITableView *tblView;
    NSMutableArray *arrCells;
    int indexCellSelected;
}
@property(nonatomic, retain) IBOutlet UITableView *tblView;
@end
