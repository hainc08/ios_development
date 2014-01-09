//
//  EmailViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController
@synthesize txt_email = _txt_email;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.txt_email.delegate = self;
    self.txt_email.keyboardType = UIKeyboardTypeEmailAddress;
    //self.txt_email.keyboardAppearance = UIKeyboardAppearanceDefault;
    
    [self.txt_email becomeFirstResponder];
    
    account = [[MyProfiles alloc] init];
    if([account getEmailProfile] != nil){
        self.txt_email.text = [account getEmailProfile];
    }
    if(self.email != nil){
        self.txt_email.text = self.email;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)txt_email_EditingDidEnd:(id)sender {
    if(self.txt_email.text == nil || [self.txt_email.text isEqualToString:@""] == YES){
        //入力情報が足りません
        NSString* _message = NSLocalizedString(@"ALERT_PROFILE_SAVE_NG", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:_message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return ;
    }else{
        // Email validation
        NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        
        if ([emailTest evaluateWithObject:self.txt_email.text] == NO) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"ALERT_VALID_EMAIL", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return ;
        }
    }
    [account setEmailProfile:self.txt_email.text];
    
    // NSNotificationの生成（通知名："toNotifiTheChangeProfile"）
    //NSNotification *n = [NSNotification notificationWithName:@"toNotifiTheChangeProfile" object:self];
    
    // 通知センターを取得する
    //NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知をする
    //[nc postNotification:n];

    [self.txt_email resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
