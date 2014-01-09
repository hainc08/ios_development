//
//  NSObject+CoolioInfo.m
//  Coolio
//
//  Created by hoehoe on 2013/07/29.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSObject+CoolioInfo.h"

@implementation NSObject (CoolioInfo)

-(void)getInfo
{
    NSString* method = @"getInfo";
    R9HTTPRequest* request = [self createRequest:method];

    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheGetInfo" object:jsonArray userInfo:nil];
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
