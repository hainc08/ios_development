//
//  InitialSlidingViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "InitialSlidingViewController.h"

@implementation InitialSlidingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    //if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    
    //} else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    //  storyboard = [UIStoryboard storyboardWithName:@"iPad" bundle:nil];
    //}
    // Override point for customization after application launch.
    self.underLeftViewController = [storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"member"];
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return YES;
}

@end
