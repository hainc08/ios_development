//
//  UnSubscribeViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/15.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolioWebService.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"
#import "SVProgressHUD.h"
#import "MyProfiles.h"
#import "MySession.h"

@interface UnSubscribeViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIAlertViewDelegate>
{
    CoolioWebService* coolio;
    BOOL _observing;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) UITextField *txt_email;
@property (retain, nonatomic) UITextField *txt_password;

@property(nonatomic, strong) NSString* idCellDescription;
@property(nonatomic, strong) NSString* idCellEmail;
@property(nonatomic, strong) NSString* idCellPassword;
@property(nonatomic, strong) NSString* idCellUnsubButton;
@property(nonatomic, strong) NSString* idCellNone;



- (IBAction)revealMenu:(id)sender;
- (IBAction)txt_email_EditingDidEnd:(id)sender;
- (IBAction)txt_password_EditingDidEnd:(id)sender;
- (IBAction)btn_unSubscribePush:(id)sender;

@end
