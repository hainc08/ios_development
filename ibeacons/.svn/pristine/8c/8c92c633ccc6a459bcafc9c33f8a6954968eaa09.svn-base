//
//  VNAppDelegate.m
//  VNReceiverBeacon
//
//  Created by TrinhLD on 12/24/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "VNAppDelegate.h"

#import "BaseViewController.h"
#import "VNReceiveViewController.h"
#import "VNSettingViewController.h"

@implementation VNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Init default value
    // Check open app first
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"UsedApp"] boolValue] == NO) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kKeyNameLocalContentFlag];
        [[NSUserDefaults standardUserDefaults] setInteger:kLevelImmediate forKey:kKeyNameLevel];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"UsedApp"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    // Override point for customization after application launch.
    VNReceiveViewController *viewController = [[VNReceiveViewController alloc] initWithNibName:@"VNReceiveViewController" bundle:nil];
    UINavigationController *navReceiveController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navReceiveController.tabBarItem.image = [UIImage imageNamed:@"detector.png"];
    
    VNSettingViewController *settingController = [[VNSettingViewController alloc] initWithNibName:@"VNSettingViewController" bundle:nil];
    UINavigationController *navSettingController = [[UINavigationController alloc] initWithRootViewController:settingController];
    navSettingController.tabBarItem.image = [UIImage imageNamed:@"btn-setting.png"];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.viewControllers = @[navReceiveController, navSettingController];
    
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
