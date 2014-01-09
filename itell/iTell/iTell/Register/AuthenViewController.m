//
//  AuthenViewController.m
//  iTell
//
//  Created by Thap on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AuthenViewController.h"
#import "SendEmailViewController.h"
#import "SendSMSViewController.h"

@interface AuthenViewController ()

@end

@implementation AuthenViewController

@synthesize ispNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)emailBtnClicked:(id)sender{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"under construction" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}
-(IBAction)smsBtnClicked:(id)sender{

    SendSMSViewController *sendSMSController = [[SendSMSViewController alloc] initWithNibName:@"SendSMSViewController" bundle:Nil];
    sendSMSController.ispProvider = ispNumber;
    [self.navigationController pushViewController:sendSMSController animated:TRUE];
    [sendSMSController release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = TRUE;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
