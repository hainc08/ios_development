//
//  NSObject+CoolioSilentMatch.m
//  Coolio
//
//  Created by hoehoe on 2013/07/13.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSObject+CoolioSilentMatch.h"

@implementation NSObject (CoolioSilentMatch)
-(void)doSilentMatch:(NSString *)myId silentMatchId:(NSString *)silentMatchId
{
    NSString* method = @"doSilentMatch";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    [request addBody:silentMatchId forKey:@"silentMatchId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            if([NSThread currentThread] == [NSThread mainThread]){}
            //NSLog(@"Send data ok...");
            //NSLog(@"doSilentMatch: %@", responseString);
            
            //NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            //NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            if([responseString isEqualToString:@"success"] == YES){
                NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheIsSilentMatch" object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:n];
            }
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


-(void)sendSilentMatch:(NSString *)myId userId:(NSString *)userId
{
    NSString* method = @"setSilentMatchRequest";
    R9HTTPRequest* request = [self createRequest:method];
    
    
    [request addBody:myId forKey:@"myId"];
    [request addBody:userId forKey:@"userId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            if([NSThread currentThread] == [NSThread mainThread]){}
            //NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifySilentMatchRequest" object:jsonArray userInfo:nil];
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

-(void)sendSilentMatchRemove:(NSString *)myId userId:(NSString *)userId
{
    NSString* method = @"removeSilentMatch";
    R9HTTPRequest* request = [self createRequest:method];
    
    
    [request addBody:myId forKey:@"myId"];
    [request addBody:userId forKey:@"userId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            if([NSThread currentThread] == [NSThread mainThread]){}
            //NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifySilentMatchRemove" object:jsonArray userInfo:nil];
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


-(void)getMySilentMatch:(NSString *)myId
{
    NSString* method = @"getSilentMatch";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheGetMySilentMatch" object:jsonArray userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            
            ////NSLog(@"%@", responseString);
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

-(void)getMyMatch:(NSString *)myId
{
    NSString* method = @"getMatch";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheGetMyMatch" object:jsonArray userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            
            ////NSLog(@"%@", responseString);
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
