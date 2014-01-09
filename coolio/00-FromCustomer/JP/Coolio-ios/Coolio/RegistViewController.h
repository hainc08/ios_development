//
//  RegistViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/10/10.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolioWebService.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "UITableViewController+PassLock.h"

@interface RegistViewController : UITableViewController<UITextFieldDelegate>

//@property(nonatomic, strong) NSString* idCellLabel;
//@property(nonatomic, strong) NSString* idCellTextField;
//@property(nonatomic, strong) NSString* idCellButton;

@property(nonatomic) UITextField* txtField;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellTextField;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellButton;

- (IBAction)btn_cancelPush:(id)sender;
- (IBAction)btn_registPush:(id)sender;

@end
