//
//  Global.h
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"

#define kMAX_TIME_ITEL 10800

#define BUSSY_TEXT @"Loading"
/*----------------------------------------------------------------------*
 |                      Server api                                      |
 *----------------------------------------------------------------------*/
#define SERVER_URL @"http://49.212.140.145/itell/"

#define CHECK_LOGIN \
[NSString stringWithFormat:@"%@%@", SERVER_URL, @"user/check_user"] 

#define AUTHEN_CODE \
[NSString stringWithFormat:@"%@%@", SERVER_URL, @"user/authen_code"]

#define GET_CODE \
[NSString stringWithFormat:@"%@%@", SERVER_URL, @"user/get_code"] 

#define REGISTER_USER \
[NSString stringWithFormat:@"%@%@", SERVER_URL, @"user/regist_user"]

#define POST_MY_LOCATION \
[NSString stringWithFormat:@"%@%@", SERVER_URL, @"map/post_position"]

#define GET_FRIEND \
[NSString stringWithFormat:@"%@%@", SERVER_URL, @"map/get_map_friend"]

#define GET_OTHER \
[NSString stringWithFormat:@"%@%@", SERVER_URL, @"map/get_map_other"]

#define GET_COMPANY \
[NSString stringWithFormat:@"%@%@", SERVER_URL, @"map/get_map_company"]

/*----------------------------------------------------------------------*
 |             Load file from documents/folder/file                     |
 *----------------------------------------------------------------------*/
#define PATH_SANDBOX(file) \
[NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0],file]

/*----------------------------------------------------------------------*
 |             Load image from documents/folder/file                    |
 *----------------------------------------------------------------------*/
#define IMAGE_SANDBOX(file) \
[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0],file]]



@interface Global : NSObject
@property(nonatomic)NSTimeInterval latestItellTime; /*Time from nearly Itell*/
@property(nonatomic)BOOL isItelling;
@property(nonatomic, retain)UserData *user;
/*
 * @author: Tran Duc
 * Get instance of global object
 */
+(Global*)shareGlobal;

-(void)resetItellTime;
+ (NSString*) getUserUUID;
+ (void)setValueState:(BOOL)flag withKey:(NSString *)strKey;
+ (BOOL)getValueState:(NSString *)strKey;
@end
