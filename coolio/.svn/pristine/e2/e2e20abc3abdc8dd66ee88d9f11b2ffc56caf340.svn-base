//
//  NickNameViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NickNameViewController.h"

@interface NickNameViewController ()

@end

@implementation NickNameViewController
@synthesize txt_nickName;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openPasscodeView];
    self.txt_nickName.delegate = self;
    //self.txt_lastName.keyboardType = UIKeyboardTypeDefault;
    
    [self.txt_nickName becomeFirstResponder];
    
    account = [[MyProfiles alloc] init];
    if([account getNickNameProfile] != nil){
        self.txt_nickName.text = [account getNickNameProfile];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //NSLog(@"call return");
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)txt_nickName_EditingDidEnd:(id)sender {
    if(self.txt_nickName.text == nil || [self.txt_nickName.text isEqualToString:@""] == YES){
        //入力情報が足りません
        NSString* _message = NSLocalizedString(@"ALERT_PROFILE_SAVE_NG", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:_message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return ;
    }else{
        UIAlertView* alert = nil;
        NSArray* badSearchParam = @[@"!", @"@", @"#", @"$", @"%", @"^", @"&", @"*", @"+", @";", @":", @"?", @"{", @"}", @"[", @"]", @"\\", @"|", @"~", @"`", @"/", @"(", @")", @"=", @"\""];
        NSString* nickNameString = self.txt_nickName.text;
        for (int i=0; i<[badSearchParam count]; i++) {
            NSRange range = [nickNameString rangeOfString:badSearchParam[i]];
            if (range.location != NSNotFound) {
                alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"Bad Parameter", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                return;
            }
        }
    }
    [account setNickNameProfile:self.txt_nickName.text];
    /*
    // NSNotificationの生成（通知名："toNotifiTheChangeProfile"）
    NSNotification *n = [NSNotification notificationWithName:@"toNotifiTheChangeProfile" object:self];
    
    // 通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知をする
    [nc postNotification:n];
    */
    [self.txt_nickName resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
