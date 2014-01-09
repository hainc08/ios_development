//
//  PenisSizeViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "PenisSizeViewController.h"

@interface PenisSizeViewController ()

@end

@implementation PenisSizeViewController
@synthesize txt_penisSize;

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

    self.txt_penisSize.delegate = self;
    self.txt_penisSize.keyboardType = UIKeyboardTypeDecimalPad;
    [self.txt_penisSize becomeFirstResponder];
    
    account = [[MyProfiles alloc] init];
    int peniSize = [account getPenisSizeProfile];
    self.txt_penisSize.text = [NSString stringWithFormat:@"%d", peniSize];
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

- (IBAction)txt_penisSize_EditingDidEnd:(id)sender {
    if(self.txt_penisSize.text == nil || [self.txt_penisSize.text isEqualToString:@""] == YES){
        //入力情報が足りません
        NSString* _message = NSLocalizedString(@"ALERT_PROFILE_SAVE_NG", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:_message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return ;
    }
    [account setPenisSizeProfile:[self.txt_penisSize.text intValue]];
    [self.txt_penisSize resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
