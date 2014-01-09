//
//  NotificationSettingsViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/08/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNotification.h"

@interface NotificationSettingsViewController : UITableViewController
{
    MyNotification* notice;
}

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_chat;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_friendRequest;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_match;

@property (weak, nonatomic) IBOutlet UISwitch *sw_chat;
@property (weak, nonatomic) IBOutlet UISwitch *sw_friendRequest;
@property (weak, nonatomic) IBOutlet UISwitch *sw_match;

- (IBAction)sw_chatValueChanged:(id)sender;
- (IBAction)sw_friendRequestValueChanged:(id)sender;
- (IBAction)sw_matchValueChanged:(id)sender;

@end
