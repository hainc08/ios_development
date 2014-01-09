//
//  UsersChatHistory.h
//  iTell
//
//  Created by mai van hai on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface UsersChatHistory : NSObject {
}
@property (nonatomic, assign) int friednID;
@property (nonatomic, retain) NSString *friendName;
@property (nonatomic, retain) NSString * messageSend;
@property (nonatomic, retain) NSString * messageRecv;
@property (nonatomic, assign) long    dateChat;

+ (void) getInitialDataToDisplay:(NSString *)dbPath;
+ (void) finalizeStatements;


//Instance methods.

- (void) addFriendChat;
- (void) deleteFriendChat;
//new added
+ (void) getHistoryChatOfFriend:(int)idFriend path:(NSString *)dbPath;
@end
