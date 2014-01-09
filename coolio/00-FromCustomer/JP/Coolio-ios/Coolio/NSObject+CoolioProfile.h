//
//  NSObject+CoolioProfile.h
//  Coolio
//
//  Created by hoehoe on 2013/07/04.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CoolioData.h"

@interface NSObject (CoolioProfile)
-(R9HTTPRequest *)setRequestBodyToProfile:(R9HTTPRequest *)request;

-(void)sendMyLocation:(NSString *)email latitude:(NSString *)latitude longitude:(NSString *)longitude;

-(void)sendProfile;
-(void)sendProfileImage1;
-(void)sendProfileImage2;
-(void)sendProfileImage3;
-(void)sendProfileImage4;
-(void)sendProfileImage5;

-(void)sendDeviceId;

//-(void)getMyInfo:(NSString *)myId password:(NSString *)password;
-(void)getMyInfo:(NSString *)myId;
-(void)getMasterPassword:(NSString *)myId;

-(void)doNewAccountCheck;

@end
