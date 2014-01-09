//
//  HeightViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "HeightViewController.h"

@interface HeightViewController ()

@end

@implementation HeightViewController
@synthesize txt_height;

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
    
    self.txt_height.delegate = self;
    self.txt_height.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.txt_height becomeFirstResponder];
    
    account = [[MyProfiles alloc] init];
    if([account getHeightProfile] != nil){
        self.txt_height.text = [account getHeightProfile];
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

- (IBAction)txt_height_EditingDidEnd:(id)sender {
    if(self.txt_height.text == nil || [self.txt_height.text isEqualToString:@""] == YES){
        //入力情報が足りません
        NSString* _message = NSLocalizedString(@"ALERT_PROFILE_SAVE_NG", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:_message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return ;
    }
    [account setHeightProfile:self.txt_height.text];
    
    /*
    // NSNotificationの生成（通知名："toNotifiTheChangeProfile"）
    NSNotification *n = [NSNotification notificationWithName:@"toNotifiTheChangeProfile" object:self];
    
    // 通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知をする
    [nc postNotification:n];
    */
    [self.txt_height resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];

}
@end
