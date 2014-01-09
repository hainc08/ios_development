//
//  EmailViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfiles.h"

@interface EmailViewController : UIViewController<UITextFieldDelegate>
{
    MyProfiles* account;
}
@property(nonatomic) NSString* email;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
- (IBAction)txt_email_EditingDidEnd:(id)sender;

@end
