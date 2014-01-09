//
//  ConfirmRegisterController.m
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ConfirmRegisterController.h"
#import "ResultRegister.h"

#define AUTHEN_CODE @"authen sms code"


@implementation ConfirmRegisterController

@synthesize mobilePhone;
@synthesize isp;

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
    return YES;
}
- (IBAction)sendBtnClicked:(id)sender{
    if (![codeEnterTextField.text isEqualToString:@""]) {
        //send authen code to server
        [[AppDelegate instance] showBusyView:TRUE];
        _apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:AUTHEN_CODE];
        [_apiRequest authenSMSCode:mobilePhone code:codeEnterTextField.text isp:isp];

    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter your code" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
        
}

- (void)requestFinished:(NSDictionary*)dictionData andTarget:(NSString*)target{
    [[AppDelegate instance] showBusyView:NO];
    BOOL result = [[dictionData objectForKey:@"retval"] boolValue];
    if (!result) {
        //Failed
    }
    else if ([target isEqualToString:AUTHEN_CODE]){
        //authen success
        ResultRegister *resultView = [[ResultRegister alloc] initWithNibName:@"ResultRegister" bundle:Nil];
        resultView.isp = isp;
        resultView.authenCode = codeEnterTextField.text;
        resultView.mobilePhone = mobilePhone;
        [self.navigationController pushViewController:resultView animated:TRUE];
        [resultView release];
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
   
    NSArray *array = [NSArray arrayWithObjects:codeEnterTextField, nil];
    keyBoardInput = [[AccessoryKeybroad alloc] initWithTextItems:array parent:scrollView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
