//
//  ForgotPasswordViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/06/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewController+PassLock.h"
#import "MyProfiles.h"
#import "CoolioWebService.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"

@interface ForgotPasswordViewController : UITableViewController<UITextFieldDelegate>
{
    CoolioWebService* coolio;
    MyProfiles* account;
}

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_email;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_button;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UIButton *btn_send;

- (IBAction)txt_email_EditingDidEnd:(id)sender;
- (IBAction)btn_sendPush:(id)sender;
- (IBAction)btn_donePush:(id)sender;


@end
