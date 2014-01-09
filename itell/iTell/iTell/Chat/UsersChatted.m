//
//  UsersChatted.m
//  iTell
//
//  Created by mai van hai on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UsersChatted.h"
#import "AppDelegate.h"

@implementation UsersChatted

static sqlite3 *database = nil;
static sqlite3_stmt *addStmt = nil;
static sqlite3_stmt *delStmt = nil;

@synthesize userID,userName,userAvatar,uuid,gender,nick,mobileNumber,isp,urlAvatar,strStatus;

+(void) getInitialDataToDisplay:(NSString *)dbPath{
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		
		const char *sql = "select * from userListChatted";
		sqlite3_stmt *selectstmt;
		if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
			
			while(sqlite3_step(selectstmt) == SQLITE_ROW) {
				
                // Read the data from the result row
                // Create a new diary object with the data from the database
				UsersChatted *listChatted = [[UsersChatted alloc] init];
                listChatted.userID = sqlite3_column_int(selectstmt, 0);
                if (sqlite3_column_text(selectstmt, 1) != nil)
                    listChatted.userName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
                if (sqlite3_column_text(selectstmt, 2) != nil)
                    listChatted.userAvatar = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
                if (sqlite3_column_text(selectstmt, 3) != nil)
                    listChatted.uuid = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)];
                if (sqlite3_column_text(selectstmt, 4) != nil)
                    listChatted.gender = sqlite3_column_int(selectstmt, 4);
                if (sqlite3_column_text(selectstmt, 5) != nil)
                    listChatted.nick = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 5)];
                if (sqlite3_column_text(selectstmt, 6) != nil)
                    listChatted.mobileNumber = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 6)];
                if (sqlite3_column_text(selectstmt, 7) != nil)
                    listChatted.isp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 7)];
                if (sqlite3_column_text(selectstmt, 8) != nil)
                    listChatted.urlAvatar = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 8 )];
                if (sqlite3_column_text(selectstmt, 9) != nil)
                    listChatted.strStatus = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 9 )];
                [appDelegate.userChattedArray addObject:listChatted];
                NSLog(@"get arcade infor");
			}
		}
        // Release the compiled statement from memory
        sqlite3_finalize(selectstmt);
	}
    else
        sqlite3_close(database);
    //Even though the open call failed, close the database connection to release all the memory.
}
+ (void) finalizeStatements{
    if(database) sqlite3_close(database);
	if(addStmt) sqlite3_finalize(addStmt);
    if(delStmt) sqlite3_finalize(delStmt);
}

- (void) addFriendChatted {
    const char *sql = "insert into userListChatted('userID', 'userName', 'userAvatar','uuid','gender','nick','mobileNumber','isp','urlAvatar','status') Values(?,?,?,?,?,?,?,?,?,?)";
    if (sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
    }//(userID integer, userName text, userAvatar text, uuid text, gender integer, nick text, mobileNumber text, isp text, urlAvatar text)
	sqlite3_bind_int(addStmt, 1, userID);	
    sqlite3_bind_text(addStmt, 2, [userName UTF8String], -1, SQLITE_TRANSIENT);	
    sqlite3_bind_text(addStmt, 3, [userAvatar UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 4, [uuid UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_int(addStmt, 5, gender);
    sqlite3_bind_text(addStmt, 6, [nick UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 7, [mobileNumber UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 8, [isp UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 9, [urlAvatar UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 10, [strStatus UTF8String], -1, SQLITE_TRANSIENT);
    if(SQLITE_DONE != sqlite3_step(addStmt)) {
		NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(database));
    }
	
	//Reset the add statement.
	sqlite3_reset(addStmt);  
    NSLog(@"insert Arcade success");
}

- (void) deleteFriendChatted {
    const char *sql = "DELETE FROM userListChatted Where userID = ?";
    if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert1(0, @"Error while creating update statement. '%s'", sqlite3_errmsg(database));
        
    }
    sqlite3_bind_int(delStmt, 1, userID);
	
	if (SQLITE_DONE != sqlite3_step(delStmt)) {
		NSAssert1(0, @"Error while updating data. '%s'", sqlite3_errmsg(database));
    }
    
	sqlite3_reset(delStmt);
}

@end
