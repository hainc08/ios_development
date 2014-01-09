//
//  AppDelegate.h
//  Coolio
//
//  Created by hoehoe on 2012/12/11.
//  Copyright (c) 2012年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "TestFlight.h"
#import "Reachability.h"
#import "GlobalObjects.h"
#import "CoolioWebService.h"
#import "MyProfiles.h"
#import "InitialSlidingViewController.h"
#import "KKPasscodeLock.h"
#import "MyDevice.h"
#import "NewAccountSettingsViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

    //MyBluetooth* bluetooth;
    Reachability* hostReach;
    Reachability* internetReach;
}

@property (strong, nonatomic) UIWindow *window;


//- (void)saveContext;
+ (void) showDisconnectAlert;
+ (BOOL) NetworkCheckConnect;

@end
