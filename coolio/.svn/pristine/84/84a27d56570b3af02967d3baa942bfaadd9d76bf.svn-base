//
//  AgeViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "AgeViewController.h"

@interface AgeViewController ()

@end

@implementation AgeViewController
@synthesize txt_age;

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
    [self openPasscodeView];
    self.txt_age.delegate = self;
    self.txt_age.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.txt_age becomeFirstResponder];
    
    account = [[MyProfiles alloc] init];
    if([account getAgeProfile] != nil){
        self.txt_age.text = [account getAgeProfile];
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

- (IBAction)txt_age_EditingDidEnd:(id)sender {
    if(self.txt_age.text == nil || [self.txt_age.text isEqualToString:@""] == YES){
        //入力情報が足りません
        NSString* _message = NSLocalizedString(@"ALERT_PROFILE_SAVE_NG", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:_message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return ;
    }
    [account setAgeProfile:self.txt_age.text];
    
    /*
    // NSNotificationの生成（通知名："toNotifiTheChangeProfile"）
    NSNotification *n = [NSNotification notificationWithName:@"toNotifiTheChangeProfile" object:self];
    
    // 通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知をする
    [nc postNotification:n];
    */
    [self.txt_age resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
