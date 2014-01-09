//
//  AppDelegate.m
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ALTabbarController.h"
#import "CarrierChooseViewController.h"
#import "ITMarco.h"
#import "Global.h"
#import "NSDate+Formater.h"
#import "UsersChatHistory.h"
#import "UsersChatted.h"

#define kCheckUserLogin @"check user login"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController, navigationController,carrierView;
@synthesize currentLocation;
@synthesize busyView;
@synthesize chatHistoryArray,userChattedArray,chatHistoryOfFrArr;
- (void)dealloc
{
    [_window release];
    [tabBarController release];
    [super dealloc];
}

//Check database, if not exist then create new database
- (void)checkAndCreateDatabase {
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFile = [array objectAtIndex:0];
    
    filePath = [documentFile stringByAppendingPathComponent:@"iTellFriendChat.sqlite"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL success = NO;
    if ([manager fileExistsAtPath:filePath]) 
    {
        success =YES;
    }
    if (!success) 
    {
        /*create database*/
        NSString *path2=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"iTellFriendChat.sqlite"];
        NSLog(@"file Path2: %@", path2);
        success =[manager copyItemAtPath:path2 toPath:filePath error:nil];
    }
    NSLog(@"file Path: %@", filePath);
    /*create tables*/
    NSString *tableName1 = @"userChatHistory";
    NSString *tableName2 = @"userListChatted";
    NSString *chatHistory=[NSString stringWithFormat:@"create table %@(friendID integer,friendName text, messageSend text, messageRecv text, dateChat long)",tableName1];
    NSString *listChatted = [NSString stringWithFormat:@"create table %@(userID integer, userName text, userAvatar text, uuid text, gender integer, nick text, mobileNumber text, isp text, urlAvatar text, status text)",tableName2];
    
    
    BOOL result = [self createNewTable:chatHistory ];
    result = [self createNewTable:listChatted ];
}
-(BOOL)createNewTable:(NSString *)queryInfor 
{
    sqlite3_stmt * createStmt = nil;
    
    if (sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
        if (createStmt == nil) {
            
            if (sqlite3_prepare_v2(database, [queryInfor UTF8String], -1, &createStmt, NULL) != SQLITE_OK) {
                return NO;
            }
            sqlite3_exec(database, [queryInfor UTF8String], NULL, NULL, NULL);
            return YES;
        }
    }
    return YES;
}

- (void)initDatabase {
    self.chatHistoryArray = [[NSMutableArray alloc] init];
    self.userChattedArray = [[NSMutableArray alloc] init];
    filePath = [[[NSString alloc] init] autorelease];
    [self checkAndCreateDatabase];
    [UsersChatHistory getInitialDataToDisplay:filePath];
    [UsersChatted getInitialDataToDisplay:filePath];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    //init database
    [self initDatabase];
    //init location manager
    [self initLocationManager];
   
    [self showBusyView:TRUE];
     NSString *userId = [Global getUserUUID];
    _apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kCheckUserLogin];
    [_apiRequest checkUserLogin:userId];
    
    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    background.backgroundColor = [UIColor blueColor];
    self.window.rootViewController.view = background;
    [self goToTabBar];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void) requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    [self showBusyView:NO];
    BOOL result = [[dictionData objectForKey:@"retval"] boolValue];
    if (!result) { //Skip login to test Itell.
        //not login
        if(!self.carrierView) {
            self.carrierView = [[CarrierChooseViewController alloc] initWithNibName:@"CarrierChooseViewController" bundle:Nil];
        }
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.carrierView];
        self.navigationController.navigationBarHidden = TRUE;
        //sleep(2);
        self.window.rootViewController = self.navigationController;
        [self.navigationController release];
        [self.window makeKeyAndVisible];
    } else {
        //get user info //233539;
        [Global shareGlobal].user.userID =[[[[dictionData objectForKey:@"user_data"] objectForKey:@"User"]objectForKey:@"id"] intValue];
        [Global shareGlobal].user.nick = [NSString stringWithFormat:@"%@", [[[dictionData objectForKey:@"user_data"] objectForKey:@"User"]objectForKey:@"nick"]] ;
        NSLog(@"nick = %@",  [Global shareGlobal].user.nick);
        [Global shareGlobal].user.avatar = [NSString stringWithFormat:@"%@",[[[dictionData objectForKey:@"user_data"] objectForKey:@"User"] objectForKey:@"avatar"]];
        [Global shareGlobal].user.gender = [[[[dictionData objectForKey:@"user_data"] objectForKey:@"User" ]objectForKey:@"gender"] boolValue];
        [Global shareGlobal].user.name = [NSString stringWithFormat:@"%@", [[[dictionData objectForKey:@"user_data"] objectForKey:@"User"] objectForKey:@"name"]] ;
        [Global shareGlobal].user.birth = [[[dictionData objectForKey:@"user_data"] objectForKey:@"User"]objectForKey:@"birth"];
        [Global shareGlobal].user.mobileNumber = [[[dictionData objectForKey:@"user_data"] objectForKey:@"User"]objectForKey:@"mobile_num"];
    
        //show tab bar
        [self goToTabBar];
    }
}
- (void) requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    [[AppDelegate instance] showBusyView:NO];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert release]; 
    
    //test for no internet
    [self requestFinished:nil andTarget:nil];
}
- (void) initLocationManager{

    //// Declare location manager
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    //<== Maunb
}
- (void) goToTabBar{
    
    if (!tabBarController) {
        self.tabBarController = [[ALTabbarController alloc] init];
    }
    [self.tabBarController setModalPresentationStyle:UIModalPresentationFullScreen];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.tabBarController];
    self.navigationController.navigationBarHidden = TRUE;
    //sleep(2);
    self.window.rootViewController = self.navigationController;
    
    [self.navigationController release];
    [self.window makeKeyAndVisible];
    
}

#pragma mark -
#pragma mark location manager delegate
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    
    currentLocation = [newLocation retain];
    
    
    CLLocation *fadeLocation = [[CLLocation alloc] initWithLatitude:21.007 longitude:105.843];
    currentLocation = fadeLocation;
    
}


+ (AppDelegate *)instance
{
    static AppDelegate *app;
    @synchronized (self) {
        if (app == nil) {
            app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        }
    }
    return app;
    
}

- (void)showBusyView:(BOOL)bl withText:(NSString *)text
{
    text = BUSSY_TEXT;
    if (!busyView) {
        self.busyView = [[BusyView alloc] init];
        [self.window addSubview:busyView];
    }
    [busyView loadding:bl withText:text];
}

- (void)showBusyView:(BOOL)bl
{
//    if (!busyView) {
//        self.busyView = [[BusyView alloc] init];
//        [self.window addSubview:busyView];
//    }
//    [self showBusyView:bl withText:BUSSY_TEXT];
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
    [locationManager release];
    [currentLocation release];
}
#pragma mark database
-(void) addFriendChatted:(UsersChatted *)frInfo {
    [self.userChattedArray addObject:frInfo];
    [frInfo addFriendChatted];
}
-(void) delFriendChatted:(UsersChatted *)frInfo {
    [self.userChattedArray removeObject:frInfo];
    [frInfo deleteFriendChatted];
}

-(void) addChatHistory:(UsersChatHistory *) chatHistoryInfo {
    [self.chatHistoryArray addObject:chatHistoryInfo];
    [chatHistoryInfo addFriendChat];
}
-(void) delChatHistory:(UsersChatHistory *) chatHistoryInfo {
    [self.chatHistoryArray removeObject:chatHistoryInfo];
    [chatHistoryInfo deleteFriendChat];
}

@end
