//
//  UITableViewController+OpenMenue.m
//  Coolio
//
//  Created by hoehoe on 2013/05/16.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "UITableViewController+OpenMenue.h"

@implementation UITableViewController (OpenMenue)

-(void)openMenue
{
    UISwipeGestureRecognizer* openMenueRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(openMenue:)];
    openMenueRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:openMenueRecognizer];
    
    UISwipeGestureRecognizer* closeMenueRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenue:)];
    closeMenueRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.slidingViewController.topViewController.view addGestureRecognizer:closeMenueRecognizer];
}

-(void)openMenue:(UISwipeGestureRecognizer *)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

-(void)closeMenue:(UISwipeGestureRecognizer *)sender
{
    [self.slidingViewController resetTopView];
}

@end
