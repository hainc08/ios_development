//
//  CoolioWebService.h
//  Coolio
//
//  Created by hoehoe on 2012/12/14.
//  Copyright (c) 2012年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+CoolioData.h"

#import "NSObject+CoolioSearch.h"
#import "NSObject+CoolioProfile.h"
#import "NSObject+CoolioFriend.h"
#import "NSObject+CoolioSilentMatch.h"
#import "NSObject+CoolioHistory.h"
#import "NSObject+CoolioFootPrint.h"
#import "NSObject+CoolioBlock.h"
#import "NSObject+CoolioReport.h"
#import "NSObject+CoolioChat.h"
#import "NSObject+CoolioAlert.h"
#import "NSObject+CoolioInfo.h"

@interface CoolioWebService : NSObject
-(R9HTTPRequest *)createRequest:(NSString *)method;

-(void)doLogin:(NSString *)loginId password:(NSString *)password;
-(void)doLogOff:(NSString *)loginId;
//-(void)getState:(NSString *)myId userId:(NSString *)userId;
-(void)getMyUnreadCount:(NSString *)myId;
//-(void)getUserOne:(NSString *)userId;
-(void)getUserOne:(NSString *)myId userId:(NSString *)userId;

-(void)forgotPassword:(NSString *)myId;
-(void)doUnSubscribe:(NSString *)myId password:(NSString *)password;

-(void)doNoticeCountReset:(NSString *)myId command:(NSString *)command;

-(void)sendRegistEmail:(NSString *)email;

-(void)noticeTest:(NSString *)myId;

@end
