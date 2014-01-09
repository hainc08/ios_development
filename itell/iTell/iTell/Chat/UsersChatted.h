//
//  UsersChatted.h
//  iTell
//
//  Created by mai van hai on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface UsersChatted : NSObject {
}
@property (nonatomic, assign) int userID;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userAvatar;
@property (nonatomic, retain) NSString * uuid;
@property (nonatomic, retain) NSString * isp;
@property (nonatomic, retain) NSString * mobileNumber;
@property (nonatomic, retain) NSString * nick;
@property (nonatomic, assign) int gender;
@property (nonatomic, retain) NSString * urlAvatar;
@property (nonatomic, retain) NSString * strStatus;

+ (void) getInitialDataToDisplay:(NSString *)dbPath;
+ (void) finalizeStatements;

//Instance methods.

- (void) addFriendChatted;
- (void) deleteFriendChatted;
@end
