//
//  AppDelegate.h
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BusyView.h"
#import "ApiRequest.h"
#import "UIApplication+UIID.h"
#import <sqlite3.h>
#import "UsersChatHistory.h"
#import "UsersChatted.h"

@class ALTabbarController;
@class CarrierChooseViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate,ApiRequestDelegate>{

    CLLocationManager *locationManager;
    ApiRequest *_apiRequest;
    
    NSString *filePath;
    sqlite3 *database;
}

@property (retain, nonatomic) UIWindow *window;
@property (nonatomic, retain) CarrierChooseViewController *carrierView;
@property (nonatomic, retain) ALTabbarController *tabBarController;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) CLLocation *currentLocation;
@property (nonatomic, retain) BusyView *busyView;

//for database
@property (nonatomic, retain) NSMutableArray * chatHistoryArray;
@property (nonatomic, retain) NSMutableArray * userChattedArray;
@property (nonatomic, retain) NSMutableArray * chatHistoryOfFrArr;
- (void) goToTabBar;
+ (AppDelegate*) instance;
- (void) initLocationManager;
- (void) showBusyView:(BOOL)bl;
- (void) showBusyView:(BOOL)bl withText:(NSString*)text;

//function for database
-(void) addFriendChatted:(UsersChatted *)frInfo;
-(void) delFriendChatted:(UsersChatted *)frInfo;

-(void) addChatHistory:(UsersChatHistory *) chatHistoryInfo;
-(void) delChatHistory:(UsersChatHistory *) chatHistoryInfo;
-(BOOL)createNewTable:(NSString *)queryInfor;
@end
