//
//  CarrierChooseViewController.m
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CarrierChooseViewController.h"
#import "AuthenViewController.h"

@implementation CarrierChooseViewController

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = TRUE;
     carrierNumber = ISP_SOFTBANK;
    
}

- (IBAction)softbankBtnClicked:(id)sender{
    
     carrierNumber = ISP_SOFTBANK;
    [self submit];
}
- (IBAction)auBtnClicked:(id)sender{
   
     carrierNumber = ISP_AU;
    [self submit];
}
- (IBAction)docomoBtnClicked:(id)sender{
   
    carrierNumber = ISP_DOCOMO;
    [self submit];
}
-(void)submit{
    AuthenViewController *authenView = [[AuthenViewController alloc] initWithNibName:@"AuthenViewController" bundle:Nil];
    authenView.ispNumber = carrierNumber;
    [self.navigationController pushViewController:authenView animated:TRUE];
    [authenView release];
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
