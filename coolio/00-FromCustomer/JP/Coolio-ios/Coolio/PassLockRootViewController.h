//
//  PassLockRootViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"

@interface PassLockRootViewController : UIViewController<UINavigationControllerDelegate>

- (IBAction)revealMenu:(id)sender;

@end
