//
//  TermPolicyViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/15.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "TermPolicyViewController.h"

@interface TermPolicyViewController ()

@end

@implementation TermPolicyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openMenue];
    [self openPasscodeView];
    
    if([currentLanguage isEqualToString:@"ja"]){
    
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    self.slidingViewController.underRightViewController = nil;
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)revealMenu:(id)sender
{
    NSString* myId = [[[MyProfiles alloc] init] getEmailProfile];
    CoolioWebService* coolio = [[CoolioWebService alloc] init];
    [coolio getMyUnreadCount:myId];
    [self.slidingViewController anchorTopViewTo:ECRight];
}


@end
