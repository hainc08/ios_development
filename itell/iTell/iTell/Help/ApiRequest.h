//
//  ApiRequest.h
//  iTell
//
//  Created by Thap on 8/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"


@protocol ApiRequestDelegate <NSObject>

@optional
- (void)requestFinished:(NSDictionary*)dictionData andTarget:(NSString*)target;
- (void)requestFailedTarget:(NSString*)target errorMsg:(NSString*)msg;

@end


@interface ApiRequest : NSObject<ASIHTTPRequestDelegate>
{
    NSObject<ApiRequestDelegate> *delegate;
}
@property(nonatomic, retain) NSString *target;
@property(nonatomic, retain) NSObject<ApiRequestDelegate> *delegate;
@property(nonatomic, retain) ASIHTTPRequest *asiRequest;
@property(nonatomic, retain) ASIFormDataRequest *asiFromHttpRequest;

- (void) requestUsingGetMethod:(NSString*)strUrl;
- (void)requestUsingPostMethod:(NSString *)strUrl postData:(NSDictionary *)postData;

- (id)initWithDelegate:(NSObject<ApiRequestDelegate>*)delegate andTarget:(NSString*)target;

/*******Register api*******/
-(void)sendMobileNumber:(NSString *)mobileNumber isp:(NSInteger)isp;
-(void)checkUserLogin:(NSString*)uuid;
-(void)authenSMSCode:(NSString*)mobileNumber code:(NSString*)authenCode isp:(NSString*)isp; 
-(void)registerUser:(NSString *)mobileNumber authenCode:(NSString*)authenCode isp:(NSString*)isp userData:(NSString*)userData;
/*******Map api*******/
-(void)postMyLocation;
-(void)getFriend:(NSInteger)numberResult distance:(float)distance page:(NSInteger)pageNumber;
-(void)getOther:(NSInteger)numberResult distance:(float)distance page:(NSInteger)pageNumber;
-(void)getCompany:(NSInteger)numberResult distance:(float)distance page:(NSInteger)pageNumber;
/*******Setting api****/
- (void)postContactToServer:(NSString *)urlStr names:(NSArray *)arrNames phones:(NSArray*)arrPhones emails:(NSArray*)arrEmails;


@end
