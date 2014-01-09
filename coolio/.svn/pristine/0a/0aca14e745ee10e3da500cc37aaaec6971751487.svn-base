//
//  LoginViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/05/16.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfiles.h"
#import "MyNotification.h"
#import "MyPicture.h"
#import "MySession.h"
#import "CoolioWebService.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "NewAccountSettingsViewController.h"
#import "UITableViewController+PassLock.h"
#import "BlocksKit.h"
#import "MyAgreement.h"

@interface LoginViewController : UITableViewController<UITextFieldDelegate>
{
    MyProfiles* account;
    MySession* session;
    UIScrollView* _scrollView;
    BOOL _observing;
    CoolioWebService* coolio;
    BOOL isLoginState;
    
}

@property (weak, nonatomic) IBOutlet UITableViewCell *cell_login;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_regist;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell_forgotPassword;

@property (weak, nonatomic) IBOutlet UITextField *txt_id;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;

- (IBAction)txt_id_EditingDidEnd:(id)sender;
- (IBAction)txt_password_EditingDidEnd:(id)sender;
- (IBAction)btn_loginPush:(id)sender;



@end
