//
//  CoolioWebService.m
//  Coolio
//
//  Created by hoehoe on 2012/12/14.
//  Copyright (c) 2012年 Gigaworks. corp. All rights reserved.
//

#import "CoolioWebService.h"

@implementation CoolioWebService

-(id)init
{
    if(self == nil){
        self = [super init];
    }
    return self;
}


-(R9HTTPRequest *)createRequest:(NSString *)method
{
    NSMutableString* urlString = [[NSMutableString alloc] init];
    
    [urlString appendString:URLSTRING];
    [urlString appendString:method];
    
    NSURL* url = [NSURL URLWithString:urlString];
    //NSLog(@"%@", urlString);
    R9HTTPRequest* request = [[R9HTTPRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    return request;
}


-(void)doLogin:(NSString *)loginId password:(NSString *)password
{
    NSString* method = @"doLogin";
    R9HTTPRequest* request = [self createRequest:method];
    
    
    [request addBody:loginId forKey:@"email"];
    [request addBody:password forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            if([NSThread currentThread] == [NSThread mainThread]){}
            #if DEBUG
                NSLog(@"Send data ok...");
            #endif
            /*
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            */
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyLogin" object:responseString userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            //if(DEBUG == 1) NSLog(@"%@", responseString);
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

-(void)doLogOff:(NSString *)loginId
{
    if(loginId == nil) return;
    
    NSString* method = @"doLogout";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:loginId forKey:@"email"];
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            if([NSThread currentThread] == [NSThread mainThread]){}
            
            #if DEBUG
                NSLog(@"Send data ok...");
                NSLog(@"%@", responseString);
            #endif
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

/*
-(void)getState:(NSString *)myId userId:(NSString *)userId
{
    NSString* method = @"getState";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    [request addBody:userId forKey:@"userId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSDictionary* jsonHash = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheIsState" object:jsonHash userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            
            //NSLog(@"%@", responseString);
        }else{
            //NSLog(@"%@", responseString);
        }
    }];
    [request startRequest];
}
*/

-(void)getMyUnreadCount:(NSString *)myId
{
    if(myId == nil) return;
    
    NSString* method = @"getMyUnreadCount";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //if(DEBUG == 1){NSLog(@"Send data ok...");}
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSDictionary* jsonHash = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheUnreadCount" object:jsonHash userInfo:nil];
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

/*
-(void)getUserOne:(NSString *)userId
{
    NSString* method = @"getUserOne";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:userId forKey:@"email"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            NSLog(@"Send data ok...");
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            NSDictionary* jsonHash = [jsonArray objectAtIndex:0];
            
            //NSLog(@"%@", jsonHash);
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheUserOne" object:jsonHash userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
            
            //NSLog(@"%@", responseString);
        }else{
            //NSLog(@"%@", responseString);
        }
    }];
    [request startRequest];
}
*/

-(void)getUserOne:(NSString *)myId userId:(NSString *)userId
{
    NSString* method = @"getUserOne";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    [request addBody:userId forKey:@"userId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //if(DEBUG == 1){NSLog(@"Send data ok...");}
            NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            NSObject* jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            //NSObject* userObject = [[notification object] mutableCopy];
            //NSLog(@"%@", userObject);
            
            NSDictionary* userDict = (NSDictionary *)jsonObject;
            
            NSDictionary* responseDict = [userDict valueForKey:@"status"];
            //NSLog(@"%@", responseDict);
            
            NSArray* userArray = [userDict valueForKey:@"profile"];
            NSDictionary* profileDict = userArray[0];

            NSMutableDictionary* retDict = [NSMutableDictionary dictionary];
            [retDict setValue:responseDict forKey:@"status"];
            [retDict setValue:profileDict forKey:@"profile"];

            //NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            //NSDictionary* jsonHash = [jsonArray objectAtIndex:0];
            
            //NSLog(@"%@", jsonHash);
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheUserOne" object:retDict userInfo:nil];
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

-(void)forgotPassword:(NSString *)myId
{
    NSString* method = @"sendMailForgotPass";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            //if(DEBUG == 1){NSLog(@"Send data ok...");}
            //NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
            //NSDictionary* jsonHash = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
            
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheForgotPass" object:nil userInfo:nil];
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

-(void)doUnSubscribe:(NSString *)myId password:(NSString *)password
{
    NSString* method = @"doUnSubscribe";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"email"];
    [request addBody:password forKey:@"password"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheDoUnSubscribe" object:responseString userInfo:nil];
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

-(void)doNoticeCountReset:(NSString *)myId command:(NSString *)command
{
    NSString* method = @"doNoticeCountReset";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    [request addBody:command forKey:@"command"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] != 200){
            NSMutableDictionary* _userInfo = [NSMutableDictionary dictionary];
            [_userInfo setValue:[NSNumber numberWithInt:[responseHeader statusCode]] forKey:@"HTTP_ERROR"];
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheHTTPError" object:self userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotification:n];
        }
    }];
    [request startRequest];
}

-(void)sendRegistEmail:(NSString *)email
{
    NSString* method = @"sendRegistEmail";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:email forKey:@"email"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        if([responseHeader statusCode] == 200){
            NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheRegistEmail" object:responseString userInfo:nil];
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

-(void)noticeTest:(NSString *)myId
{
    NSString* method = @"hello";
    R9HTTPRequest* request = [self createRequest:method];
    [request addBody:myId forKey:@"myId"];
    
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
    }];
    [request startRequest];
}

@end
