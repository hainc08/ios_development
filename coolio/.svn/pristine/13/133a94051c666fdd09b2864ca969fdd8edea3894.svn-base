//
//  NSObject+CoolioChat.h
//  Coolio
//
//  Created by hoehoe on 2013/07/13.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CoolioData.h"

@interface NSObject (CoolioChat)

-(void)sendMessage:(NSString *)myId userId:(NSString *)userId message:(NSString *)message picture:(UIImage *)picture;
-(void)getMessages:(NSString *)myId;
-(void)getMessages:(NSString *)myId userId:(NSString *)userId;

-(void)getChatUnReadCount:(NSString *)myId userId:(NSString *)userId;
-(void)doChatCountReset:(NSString *)myId userId:(NSString *)userId;
@end
