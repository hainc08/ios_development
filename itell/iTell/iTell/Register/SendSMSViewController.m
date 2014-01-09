//
//  SendSMSViewController.m
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SendSMSViewController.h"
#import "ConfirmRegisterController.h"
#import "AppDelegate.h"
#import "Global.h"
#import "StarAlertView.h"

#define SEND_MOBILE_NUMBER @"send mobile number to server"

@implementation SendSMSViewController

@synthesize ispProvider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return NO;
}

- (IBAction)sendBtnClicked:(id)sender{
    if ([phoneNumberTx.text isEqualToString:@""] ||[phoneNumberTx.text length] < 9) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter your mobile number correctly" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    NSString *phone1 = [phoneNumberTx.text substringWithRange:NSMakeRange(0, 3)];
    NSString *phone2 = [phoneNumberTx.text substringWithRange:NSMakeRange(3, 3)];
    NSString *phone3 = [phoneNumberTx.text substringFromIndex:6];
    NSString *phone = [NSString stringWithFormat:@"%@-%@-%@",phone1, phone2, phone3];
    StarAlertView *alertView = [[StarAlertView alloc] initWithPhoneNumber:phone];
    alertView.target = self;
    [alertView show];
    [alertView release];
    
}
-(void)acceptSendMobilePhone{

    //send phone number to server
    [[AppDelegate instance] showBusyView:TRUE];
    _apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:SEND_MOBILE_NUMBER];
    [_apiRequest sendMobileNumber:phoneNumberTx.text isp:ispProvider];
    
}
- (void) requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    [[AppDelegate instance] showBusyView:NO];
  
    BOOL result = [[dictionData objectForKey:@"retval"] boolValue];
    if (!result) {
        //failed to send mobile number
        if([target isEqualToString:SEND_MOBILE_NUMBER]){
        
        }
    }
    else if([target isEqualToString:SEND_MOBILE_NUMBER]){
        ConfirmRegisterController *confirmView = [[ConfirmRegisterController alloc] initWithNibName:@"ConfirmRegisterController" bundle:Nil];
        confirmView.isp = [NSString stringWithFormat:@"%d", ispProvider];
        confirmView.mobilePhone = phoneNumberTx.text;
        [self.navigationController pushViewController:confirmView animated:TRUE];
        [confirmView release];
    }
}
- (void) requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    [[AppDelegate instance] showBusyView:NO];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert release];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *array = [NSArray arrayWithObjects:phoneNumberTx, nil];
    keyBoardInput = [[AccessoryKeybroad alloc] initWithTextItems:array parent:scrollView];
 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (void) textFieldDidBeginEditing:(UITextField *)textField{
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
