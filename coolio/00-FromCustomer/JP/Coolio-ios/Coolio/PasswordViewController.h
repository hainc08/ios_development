//
//  PasswordViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfiles.h"
#import "UIViewController+PassLock.h"

@interface PasswordViewController : UIViewController<UITextFieldDelegate>
{
    MyProfiles* account;
}

@property(weak, nonatomic) IBOutlet UITextField* txt_password;
- (IBAction)txt_password_EditingDidEnd:(id)sender;
@end