//
//  NSObject+CoolioChat.m
//  Coolio
//
//  Created by hoehoe on 2013/07/13.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSObject+CoolioChat.h"

@implementation NSObject (CoolioChat)

-(void)sendMessage:(NSString *)myId userId:(NSString *)userId message:(NSString *)message picture:(UIImage *)picture
{
    NSString* method = @"setChatMessage";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    [request addBody:userId forKey:@"userId"];
    [request addBody:message forKey:@"message"];
    
    if(picture != nil){
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setTimeStyle:NSDateFormatterFullStyle];
        [formatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *dateString = [formatter stringFromDate:[NSDate date]];
        
        NSString *fileName = [NSString stringWithFormat:@"pict_%@_%@.png", myId, dateString];
        NSData *imgData = [[NSData alloc] initWithData:UIImagePNGRepresentation(picture)];
        [request setData:imgData withFileName:fileName andContentType:@"image/png" forKey:@"picture"];
    }
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        /*
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetChatMessage" object:jsonArray userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            //NSLog(@"%@", responseString);
        }else{
            @try{
                //NSLog(@"%@", responseString);
                //NSNotification* n = [NSNotification notificationWithName:@"ToNotifyError" object:nil userInfo:nil];
                //[[NSNotificationCenter defaultCenter] postNotification:n];
            }@catch (NSException* e) {
                //NSLog(@"%@", e.description);
            }
            //NSLog(@"%@", responseString);
        }
        */
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)getMessages:(NSString *)myId
{
    NSString* method = @"getChatMessage";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetChatMessage" object:jsonArray userInfo:nil];
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


-(void)getMessages:(NSString *)myId userId:(NSString *)userId
{
    NSString* method = @"getChatMessages";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    [request addBody:userId forKey:@"userId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetChatMessages" object:jsonArray userInfo:nil];
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

-(void)getChatUnReadCount:(NSString *)myId userId:(NSString *)userId
{
    NSString* method = @"getChatUnreadCount";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    [request addBody:userId forKey:@"userId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            //NSLog(@"Response String: %@", responseString);
            
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            NSDictionary* jsonDict =  jsonArray[0];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyGetChatUnreadCount" object:nil userInfo:jsonDict];
            [[NSNotificationCenter defaultCenter] postNotification:n];
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


-(void)doChatCountReset:(NSString *)myId userId:(NSString *)userId
{
    NSString* method = @"doChatCountReset";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    [request addBody:userId forKey:@"userId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //NSLog(@"Send data ok...");
            
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyDoChatCountReset" object:jsonArray userInfo:nil];
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
