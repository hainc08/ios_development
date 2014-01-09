//
//  MyNotification.h
//  Coolio
//
//  Created by hoehoe on 2013/08/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNotification : NSObject
{
    NSUserDefaults* _defaultObject;
}

@property(nonatomic, retain) NSUserDefaults* defaultObject;

-(BOOL)isNotificationSettings;
-(void)setNotificationSettings:(BOOL)value;

-(void)setChatNotice:(BOOL)value;
-(BOOL)getChatNotice;

-(void)setFriendRequestNotice:(BOOL)value;
-(BOOL)getFriendRequestNotice;

-(void)setMatchNotice:(BOOL)value;
-(BOOL)getMatchNotice;

//-(void)setFootPrintNotice:(BOOL)value;
//-(BOOL)getFootPrintNotice;

-(void)sync:(NSDictionary *)_myInfo;
-(void)reset;

@end
