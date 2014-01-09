//
//  ResultRegister.m
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ResultRegister.h"
#import "NickNameRegister.h"

@implementation ResultRegister

@synthesize isp;
@synthesize mobilePhone;
@synthesize authenCode;

-(void)dealloc{

    [isp release];
    [mobilePhone release];
    [authenCode release];
    [super dealloc];
}

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
-(IBAction)registerBtnClicked:(id)sender{

    NickNameRegister *nickNameView = [[NickNameRegister alloc] initWithNibName:@"NickNameRegister" bundle:Nil];
    nickNameView.isp = isp;
    nickNameView.authenCode = authenCode;
    nickNameView.mobilePhone = mobilePhone;
    [self.navigationController pushViewController:nickNameView animated:TRUE];
    [nickNameView release];

}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
