//
//  ApiRequest.m
//  iTell
//
//  Created by Thap on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ApiRequest.h"
#import "Global.h"
#import "JSON.h"
#import "ITMarco.h"
#import "AppDelegate.h"

#define kUserName @"itell"
#define kPassWord @"itell@2012"

@implementation ApiRequest

@synthesize asiFromHttpRequest;
@synthesize asiRequest;
@synthesize delegate;
@synthesize target;

- (id)initWithDelegate:(NSObject<ApiRequestDelegate> *)dlgate andTarget:(NSString *)tg
{
    if (self == [self init]) {
        self.delegate = dlgate;
        self.target = tg;
        
    }
    return self;
}


#pragma mark - General
- (void) requestUsingGetMethod:(NSString*)strUrl
{
    self.asiRequest = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:strUrl]];
    [self.asiRequest setDelegate:self];
    asiRequest.username = kUserName;
    asiRequest.password = kPassWord;
    [self.asiRequest startAsynchronous];
}

- (void)requestUsingPostMethod:(NSString *)strUrl postData:(NSDictionary *)postData
{
    self.asiFromHttpRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strUrl]];
    NSArray *array = [postData allKeys];
    for (NSString *key in array) {
        [self.asiFromHttpRequest setPostValue:[postData objectForKey:key] forKey:key];
    }
    self.asiFromHttpRequest.username = kUserName;
    self.asiFromHttpRequest.password = kPassWord;
    [self.asiFromHttpRequest setDelegate:self];
    [self.asiFromHttpRequest startAsynchronous];
}


#pragma ASIHTTP Delegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
  //  ITLOG(@"response = %@, url = %@", responseString, request.url);
    NSDictionary *dictionData = [responseString JSONValue];
    ITLOG(@"responeString = %@", dictionData);
    if ([delegate respondsToSelector:@selector(requestFinished:andTarget:)]) {
        [delegate requestFinished:dictionData andTarget:target];
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    ITLOG(@"request = %@, %@", request.error, request.url);
    if ([delegate respondsToSelector:@selector(requestFailedTarget:errorMsg:)]) {
        [delegate requestFailedTarget:target errorMsg:[request.error localizedDescription]];
    }
    
   
}
#pragma mark -
#pragma register api
- (void)sendMobileNumber:(NSString *)mobileNumber isp:(NSInteger)isp{
    
    NSMutableDictionary *muDic = [[NSMutableDictionary alloc] init];
    [muDic setObject:mobileNumber forKey:@"mobile_num"];
    NSString *ispStr = [NSString stringWithFormat:@"%d", isp];
    [muDic setObject:ispStr forKey:@"isp"];
    
    [self requestUsingPostMethod:GET_CODE postData:[NSDictionary dictionaryWithDictionary:muDic]];
    [muDic release];
    
}
- (void)checkUserLogin:(NSString*)uuid{
    
    NSString *requestURL = [NSString stringWithFormat:@"%@?uuid=%@", CHECK_LOGIN,uuid];
    requestURL = [requestURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"request url = %@ ", requestURL);
    [self requestUsingGetMethod:requestURL];

}

- (void)authenSMSCode:(NSString*)mobileNumber code:(NSString*)authenCode isp:(NSString*)isp{
    
    NSMutableDictionary *muDic = [[NSMutableDictionary alloc] init];
    [muDic setObject:mobileNumber forKey:@"mobile_num"];
    [muDic setObject:authenCode forKey:@"authen_code"];
    [muDic setObject:isp forKey:@"isp"];
    [self requestUsingPostMethod:AUTHEN_CODE postData:[NSDictionary dictionaryWithDictionary:muDic]];
    [muDic release];
}

- (void)registerUser:(NSString *)mobileNumber authenCode:(NSString*)authenCode isp:(NSString*)isp userData:(NSString*)userData{
    self.asiFromHttpRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:REGISTER_USER]];
    
    [self.asiFromHttpRequest setPostValue:mobileNumber forKey:@"mobile_num"];
    [self.asiFromHttpRequest setPostValue:authenCode forKey:@"authen_code"];
    [self.asiFromHttpRequest setPostValue:isp forKey:@"isp"];
    [self.asiFromHttpRequest setPostValue:userData forKey:@"user_data"];

    asiRequest.username = kUserName;
    asiRequest.password = kPassWord;
    [self.asiFromHttpRequest setDelegate:self];
    [self.asiFromHttpRequest startAsynchronous];
   
}

#pragma mark -
#pragma map api
-(void)postMyLocation{

    NSMutableDictionary *muDic = [[NSMutableDictionary alloc] init];
    [muDic setObject:[NSString stringWithFormat:@"%d", [Global shareGlobal].user.userID] forKey:@"user_id"];
    [muDic setObject: [Global shareGlobal].user.uuid forKey:@"uuid"];
    [muDic setObject:[NSString stringWithFormat:@"%f", [AppDelegate instance].currentLocation.coordinate.longitude] forKey:@"longitude"];
    [muDic setObject:[NSString stringWithFormat:@"%f", [AppDelegate instance].currentLocation.coordinate.latitude] forKey:@"latitude"];
    [muDic setObject:@"" forKey:@"strict"];
    [muDic setObject:@"" forKey:@"city"];
    [muDic setObject:@"" forKey:@"street"];
    [muDic setObject:[NSString stringWithFormat:@"%d", [Global shareGlobal].user.userID] forKey:@"time_stamp"];
    [self requestUsingPostMethod:POST_MY_LOCATION postData:[NSDictionary dictionaryWithDictionary:muDic]];
    [muDic release];
    
}
-(void)getFriend:(NSInteger)numberResult distance:(float)distance page:(NSInteger)pageNumber{
    NSMutableDictionary *muDic = [[NSMutableDictionary alloc] init];
    [muDic setObject:[NSString stringWithFormat:@"%d", [Global shareGlobal].user.userID] forKey:@"user_id"];
    [muDic setObject: [NSString stringWithFormat:@"%@",[Global shareGlobal].user.uuid] forKey:@"uuid"];
    [muDic setObject:[NSString stringWithFormat:@"%f", [AppDelegate instance].currentLocation.coordinate.longitude] forKey:@"longitude"];
    [muDic setObject:[NSString stringWithFormat:@"%f", [AppDelegate instance].currentLocation.coordinate.latitude] forKey:@"latitude"];
    [muDic setObject:[NSString stringWithFormat:@"%d", numberResult] forKey:@"max_matches"];
    [muDic setObject:[NSString stringWithFormat:@"%f", distance] forKey:@"distance"];
    [muDic setObject:[NSString stringWithFormat:@"%d", pageNumber] forKey:@"page"];
    NSLog(@"muDic = %@", [muDic description]);
    [self requestUsingPostMethod:GET_FRIEND postData:[NSDictionary dictionaryWithDictionary:muDic]];
    [muDic release];

}
-(void)getOther:(NSInteger)numberResult distance:(float)distance page:(NSInteger)pageNumber{

    NSMutableDictionary *muDic = [[NSMutableDictionary alloc] init];
    [muDic setObject:[NSString stringWithFormat:@"%d", [Global shareGlobal].user.userID] forKey:@"user_id"];
    [muDic setObject: [Global shareGlobal].user.uuid forKey:@"uuid"];
    [muDic setObject:[NSString stringWithFormat:@"%f", [AppDelegate instance].currentLocation.coordinate.longitude] forKey:@"longitude"];
    [muDic setObject:[NSString stringWithFormat:@"%f", [AppDelegate instance].currentLocation.coordinate.latitude] forKey:@"latitude"];
    [muDic setObject:[NSString stringWithFormat:@"%d", numberResult] forKey:@"max_matches"];
    [muDic setObject:[NSString stringWithFormat:@"%f", distance] forKey:@"distance"];
    [muDic setObject:[NSString stringWithFormat:@"%d", pageNumber] forKey:@"page"];
    [self requestUsingPostMethod:GET_OTHER postData:[NSDictionary dictionaryWithDictionary:muDic]];
    [muDic release];

}
-(void)getCompany:(NSInteger)numberResult distance:(float)distance page:(NSInteger)pageNumber{

    NSMutableDictionary *muDic = [[NSMutableDictionary alloc] init];
    [muDic setObject:[NSString stringWithFormat:@"%d", [Global shareGlobal].user.userID] forKey:@"user_id"];
    [muDic setObject: [Global shareGlobal].user.uuid forKey:@"uuid"];
    [muDic setObject:[NSString stringWithFormat:@"%f", [AppDelegate instance].currentLocation.coordinate.longitude] forKey:@"longitude"];
    [muDic setObject:[NSString stringWithFormat:@"%f", [AppDelegate instance].currentLocation.coordinate.latitude] forKey:@"latitude"];
    [muDic setObject:[NSString stringWithFormat:@"%d", numberResult] forKey:@"max_matches"];
    [muDic setObject:[NSString stringWithFormat:@"%f", distance] forKey:@"distance"];
    [muDic setObject:[NSString stringWithFormat:@"%d", pageNumber] forKey:@"page"];
    [self requestUsingPostMethod:GET_COMPANY postData:[NSDictionary dictionaryWithDictionary:muDic]];
    [muDic release];
}
-(void)getChatServer{

}
//post contact to server
- (void)postContactToServer:(NSString *)urlStr names:(NSArray *)arrNames phones:(NSArray*)arrPhones emails:(NSArray*)arrEmails {
    self.asiFromHttpRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self.asiFromHttpRequest setPostValue:[NSString stringWithFormat:@"%d", [Global shareGlobal].user.userID] forKey:@"user_id"];
    [self.asiFromHttpRequest setPostValue:[Global shareGlobal].user.uuid forKey:@"uuid"];
    [self.asiFromHttpRequest setPostValue:[arrNames JSONRepresentation] forKey:@"names"];
    [self.asiFromHttpRequest setPostValue:[arrPhones JSONRepresentation] forKey:@"phones"];
    [self.asiFromHttpRequest setPostValue:[arrEmails JSONRepresentation] forKey:@"emails"];
    
    asiRequest.username = kUserName;
    asiRequest.password = kPassWord;
    [self.asiFromHttpRequest setDelegate:self];
    [self.asiFromHttpRequest startAsynchronous];
}
@end
