//
//  GlobalObjects.h
//  SocialMuscle
//
//  Created by hoehoe on 2012/09/07.
//  Copyright (c) 2012年 hoehoe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

CLLocation *tempNewLocationGlobal;

BOOL isShowFriendViewGlobal;
BOOL isShowMatchViewGlobal;
BOOL isShowChatViewGlobal;
BOOL isSendedChatGlobal;

BOOL isAlertGlobal;
BOOL isInfoGlobal;
BOOL isRegisterEmailGlobal;

NSString* tempRegisterMyID_Global;
NSString *currentLanguage;

//#define URLSTRING @"http://192.168.102.110:3000/"
#define URLSTRING @"http://coolio.coolboys.jp/"

@interface GlobalObjects : NSObject

@end
