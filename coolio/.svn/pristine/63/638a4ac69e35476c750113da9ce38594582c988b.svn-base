//
//  NSObject+CoolioFootPrint.m
//  Coolio
//
//  Created by hoehoe on 2013/07/13.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSObject+CoolioFootPrint.h"

@implementation NSObject (CoolioFootPrint)

-(void)sendFootPrint:(NSString *)myId footPrintId:(NSString *)footPrintId
{
    NSString* method = @"setFootPrint";
    R9HTTPRequest* request = [self createRequest:method];
    
    
    [request addBody:myId forKey:@"myId"];
    [request addBody:footPrintId forKey:@"footPrintId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            /*
             if([NSThread currentThread] == [NSThread mainThread]){}
             NSLog(@"Send data ok...");
             NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
             NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
             
             NSNotification* n = [NSNotification notificationWithName:@"ToNotifySilentMatchRequest" object:jsonArray userInfo:nil];
             [[NSNotificationCenter defaultCenter] postNotification:n];
             NSLog(@"%@", responseString);
             */
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)getMyFootPrint:(NSString *)myId
{
    NSString* method = @"getFootPrint";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheGetMyFootPrint" object:jsonArray userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            
            //NSLog(@"%@", responseString);
        }
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

@end
