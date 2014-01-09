//
//  PassLockChildViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKPasscodeSettingsViewController.h"
#import "KKPasscodeLock.h"

@interface PassLockChildViewController : UITableViewController<KKPasscodeSettingsViewControllerDelegate, KKPasscodeViewControllerDelegate>
- (IBAction)doneButtonPressed:(id)sender;

@end
