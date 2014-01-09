//
//  AppDelegate.m
//  Coolio
//
//  Created by hoehoe on 2012/12/11.
//  Copyright (c) 2012年 Gigaworks. corp. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Override point for customization after application launch.
    NSArray *languages = [NSLocale preferredLanguages];
    currentLanguage = languages[0];
    
    [[KKPasscodeLock sharedLock] setDefaultSettings];
    [KKPasscodeLock sharedLock].eraseOption = NO;

    //TestFlight SDK
    //[TestFlight takeOff:@"995f124e-d48e-44eb-80f5-e4f5b32dd54e"];

    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    //Network接続確認
    [Reachability reachabilityWithHostName:@"coolio.coolboys.jp"];
    // Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the
    // method "reachabilityChanged" will be called.
    
    //Change the host name here to change the server your monitoring
	[hostReach startNotifier];

    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeBadge |
     UIRemoteNotificationTypeAlert |
     UIRemoteNotificationTypeSound];

    
    NSDictionary *userInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    if(userInfo){
        //プッシュ通知から呼ばれた
    }
    
    //アプリケーションがActiveになったら、アプリケーション・アイコン・バッジを消す
    UIApplication* app = [UIApplication sharedApplication];
    [app setApplicationIconBadgeNumber:0];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if([url.scheme isEqualToString:@"coolio"]){
        //NSLog(@"Call openURL");
        //NSLog(@"%@", url.absoluteString);
        //NSLog(@"%@", url.description);
        //NSLog(@"%@", url.host);
        //NSLog(@"%@", url.parameterString);
        //NSLog(@"%@", url.query);
        
        NSString* myId = [url.query componentsSeparatedByString:@"="][1];
        //NSLog(@"%@", myId);
        tempRegisterMyID_Global = myId;

        //if([self checkRequireParameter] == NO){
            [self performSelector:@selector(notifiCall) withObject:nil afterDelay:1.0f];
        //}
        return  YES;
    }
    return NO;
}

-(void)notifiCall
{
    isRegisterEmailGlobal = YES;

    NSNotification* n = [NSNotification notificationWithName:@"ToNotifyRegistRedirect" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    NewAccountSettingsViewController* newAccountSettingsView = [storyBoard instantiateViewControllerWithIdentifier:@"newAccountSettingsViewController"];
    [self.window makeKeyAndVisible];
    [self.window.rootViewController presentViewController:newAccountSettingsView animated:YES completion:nil];
}

-(BOOL)checkRequireParameter
{
    BOOL retBool = YES;
    MyProfiles* account = [[MyProfiles alloc]init];
    
    if(account == nil){
        account = [[MyProfiles alloc] init];
    }
    
    if([account getEmailProfile] == nil || [[account getEmailProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getPasswordProfile] == nil || [[account getPasswordProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getNickNameProfile] == nil || [[account getNickNameProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getAgeProfile] == nil || [[account getAgeProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getHeightProfile] == nil || [[account getHeightProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getWeightProfile] == nil || [[account getWeightProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getSexuallityProfile] == nil){
        retBool = NO;
    }else{
        NSDictionary* sexuallityDict = [account getSexuallityProfile];
        if([[sexuallityDict valueForKey:@"sexGayProfile"] boolValue] == NO &&
           [[sexuallityDict valueForKey:@"sexBisexProfile"] boolValue] == NO &&
           [[sexuallityDict valueForKey:@"sexStraightProfile"] boolValue] == NO)
        {
            retBool = NO;
        }
    }
    
    if([account getRaceProfile] == nil){
        retBool = NO;
    }else{
        NSDictionary* raceDict = [account getRaceProfile];
        if([[raceDict valueForKey:@"raceAsianProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceWhiteProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceBlackProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceLatinProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceArabProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"racePolynesianProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceMixProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceEtcProfile"] boolValue] == NO)
        {
            retBool = NO;
        }
    }
    
    if([account getCountryProfile] == nil || [[account getCountryProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    return retBool;
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL*)url {
//    if ([url.scheme isEqualToString:@"coolio"]) {
//        //NSLog(@"%@ [%@|%@|%@|%@]", url, url.scheme, url.host, url.path, url.query);
//        return YES;
//    }
//    return NO;
//}

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

    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - ReceiveNotification
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [[UIApplication sharedApplication] cancelLocalNotification:notification];
    
}


+ (void) showDisconnectAlert{
    Reachability *reachablity = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reachablity currentReachabilityStatus];
    switch (status) {
        case NotReachable:
        {
            UIAlertView* alert  = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"NETWORK_ERROR", nil) delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
            //NSLog(@"インターネット接続出来ません");
            break;
        case ReachableViaWWAN:
            //NSLog(@"3G接続中");
            break;
        case ReachableViaWiFi:
            //NSLog(@"WiFi接続中");
            break;
        default:
            //NSLog(@"？？[%d]", status);
            break;
    }
}

+ (BOOL) NetworkCheckConnect{
    Reachability *reachablity = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reachablity currentReachabilityStatus];
    BOOL retBool = NO;
    
    switch (status) {
        case NotReachable:
            /*
             UIAlertView* alert  = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"NETWORK_ERROR", nil) delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
             [alert show];
             */
            //NSLog(@"インターネット接続出来ません");
            retBool = NO;
            break;
        case ReachableViaWWAN:
            //NSLog(@"3G接続中");
            retBool = YES;
            break;
        case ReachableViaWiFi:
            //NSLog(@"WiFi接続中");
            retBool = YES;
            break;
        default:
            //NSLog(@"？？[%d]", status);
            break;
    }
    return retBool;
}


void uncaughtExceptionHandler(NSException *exception)
{
    // ここで、例外発生時の情報を出力します。
    #if DEBUG
        NSLog(@"%@", exception.name);
        NSLog(@"%@", exception.reason);
        NSLog(@"%@", exception.callStackSymbols);
    #endif
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken
{
    // Store the deviceToken in the current installation and save it to Parse.
    //NSLog(@"newDeviceToken: %@", newDeviceToken);
    NSString *str = [NSString stringWithFormat:@"%@",newDeviceToken];
    MyDevice* device = [[MyDevice alloc] init];
    [device setDeviceId:str];
    
    #if DEBUG
        NSLog(@"DeviceId: %@", str);
    #endif
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)err{
    #if DEBUG
        NSLog(@"Error : Fail Regist to APNS. (%@)", err);
    #endif
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //NSLog(@"サーバーから届いている中身一覧: %@",[userInfo description]);
    //    NSLog(@"%@", userInfo);
    if(application.applicationState == UIApplicationStateInactive){
        //バックグラウンドにいる状態
        
        NSString* command = [userInfo valueForKey:@"sent"];
        if([command isEqualToString:@"friend"]){
            isShowFriendViewGlobal = YES;
        }
        if([command isEqualToString:@"match"]){
            isShowMatchViewGlobal = YES;
        }
        if([command isEqualToString:@"chat"]){
            isSendedChatGlobal = YES;
            isShowChatViewGlobal = YES;
            if( [AppDelegate NetworkCheckConnect] == YES){
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
                
                MyProfiles* account = [[MyProfiles alloc] init];
                NSString* _myId = [account getEmailProfile];
                NSString* _userId = [userInfo valueForKey:@"user"];
                
                //myIdGlobal = _myId;
                //userIdGlobal = _userId;
                
                if(_userId != nil && _myId != nil){
                    CoolioWebService* coolio = [[CoolioWebService alloc] init];
                    [coolio getMessages:_myId];
                    [coolio getMessages:_myId userId:_userId];
                }
            }
            
        }
        if([command isEqualToString:@"alert"]){
            isAlertGlobal = YES;
        }
        if([command isEqualToString:@"infomation"])
        {
            isInfoGlobal = YES;
        }
        if( [AppDelegate NetworkCheckConnect] == YES){
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            MyProfiles* account = [[MyProfiles alloc] init];
            NSString* myId = [account getEmailProfile];
            if(myId != nil)
            {
                CoolioWebService* coolio = [[CoolioWebService alloc] init];
                [coolio getMyUnreadCount:myId];
            }
            
        }
    }else if(application.applicationState == UIApplicationStateActive){
        //ばりばり動いている時
        NSString* command = [userInfo valueForKey:@"sent"];
        if([command isEqualToString:@"friend"]){
        }
        if([command isEqualToString:@"match"]){
        }
        if([command isEqualToString:@"chat"]){
            isSendedChatGlobal = YES;
            if( [AppDelegate NetworkCheckConnect] == YES){
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
                
                MyProfiles* account = [[MyProfiles alloc] init];
                NSString* _myId = [account getEmailProfile];
                NSString* _userId = [userInfo valueForKey:@"user"];

                #if DEBUG
                    NSLog(@"UserId: %@", _userId);
                #endif
                if(_userId != nil && _myId != nil){
                    CoolioWebService* coolio = [[CoolioWebService alloc] init];
                    [coolio getMessages:_myId];
                    [coolio getMessages:_myId userId:_userId];
                }
            }
        }
        if([command isEqualToString:@"alert"]){
            isAlertGlobal = YES;
        }
        if([command isEqualToString:@"infomation"])
        {
            isInfoGlobal = YES;
        }
        if([AppDelegate NetworkCheckConnect] == YES){
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            MyProfiles* account = [[MyProfiles alloc] init];
            NSString* myId = [account getEmailProfile];
            if(myId != nil){
                CoolioWebService* coolio = [[CoolioWebService alloc] init];
                [coolio getMyUnreadCount:myId];
            }
        }

    }
}

@end
