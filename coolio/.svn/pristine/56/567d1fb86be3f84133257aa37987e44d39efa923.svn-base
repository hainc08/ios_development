//
//  NSObject+CoolioReport.m
//  Coolio
//
//  Created by hoehoe on 2013/07/13.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSObject+CoolioReport.h"

@implementation NSObject (CoolioReport)

-(void)sendReport:(NSString *)myId reportId:(NSString *)reportId commandId:(int)commandId
{
    NSString* method = @"setReport";
    R9HTTPRequest* request = [self createRequest:method];
    
    
    [request addBody:myId forKey:@"myId"];
    [request addBody:[NSString stringWithFormat:@"%d", commandId] forKey:@"commandId"];
    [request addBody:reportId forKey:@"reportId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            /*
             if([NSThread currentThread] == [NSThread mainThread]){}
             NSLog(@"Send data ok...");
             NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
             NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
             */
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyReportRequest" object:nil userInfo:nil];
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
