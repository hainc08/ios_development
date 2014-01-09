//
//  WeightLBSViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/09/25.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "WeightLBSViewController.h"

@interface WeightLBSViewController ()

@end

@implementation WeightLBSViewController

@synthesize txt_weight;

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
    self.txt_weight.delegate = self;
    self.txt_weight.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.txt_weight becomeFirstResponder];
    
    account = [[MyProfiles alloc] init];
    MyUnit* unit = [[MyUnit alloc] init];
    
    if([account getWeightProfile] != nil){
        //cm - kg -> feet - inch - lb
        int weight = [[account getWeightProfile] intValue];
        if([unit getUnit] == 0){
            weight = weight / 0.45359237;
        }
        self.txt_weight.text = [NSString stringWithFormat:@"%d", weight];
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

- (IBAction)txt_weight_EditingDidEnd:(id)sender {
    if(self.txt_weight.text == nil || [self.txt_weight.text isEqualToString:@""] == YES){
        //入力情報が足りません
        NSString* _message = NSLocalizedString(@"ALERT_PROFILE_SAVE_NG", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:_message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return ;
    }
    int weight = [self.txt_weight.text intValue];
    
    //cm - kg -> feet - inch - lb
    float weightFloat = ceilf( weight * 0.45359237);
    //NSLog(@"weight: %f", weightFloat);
    [account setWeightProfile:[NSString stringWithFormat:@"%d", (int)weightFloat]];
    
    /*
     // NSNotificationの生成（通知名："toNotifiTheChangeProfile"）
     NSNotification *n = [NSNotification notificationWithName:@"toNotifiTheChangeProfile" object:self];
     
     // 通知センターを取得する
     NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
     
     // 通知をする
     [nc postNotification:n];
     */
    [self.txt_weight resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
