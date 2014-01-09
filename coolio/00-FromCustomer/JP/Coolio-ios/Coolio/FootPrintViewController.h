//
//  FootPrintViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/22.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyFootPrintSettings.h"
#import "UITableViewController+PassLock.h"

@interface FootPrintViewController : UITableViewController
{
    MyFootPrintSettings* account;
}

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_foot;
@property (weak, nonatomic) IBOutlet UISwitch *sw_foot;

- (IBAction)sw_footValueChanged:(id)sender;
- (IBAction)btn_donePush:(id)sender;

@end
