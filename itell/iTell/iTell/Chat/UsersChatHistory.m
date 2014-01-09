//
//  UsersChatHistory.m
//  iTell
//
//  Created by mai van hai on 9/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UsersChatHistory.h"
#import "AppDelegate.h"

static sqlite3 *database = nil;
static sqlite3_stmt *addStmt = nil;
static sqlite3_stmt *delStmt = nil;

@implementation UsersChatHistory

@synthesize friednID,messageRecv,messageSend,dateChat,friendName;


+(void) getInitialDataToDisplay:(NSString *)dbPath{
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		
		const char *sql = "select * from userChatHistory";
		sqlite3_stmt *selectstmt;
		if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
			
			while(sqlite3_step(selectstmt) == SQLITE_ROW) {
				
                // Read the data from the result row
                // Create a new diary object with the data from the database
				UsersChatHistory *chatHistory = [[UsersChatHistory alloc] init];
                chatHistory.friednID = sqlite3_column_int(selectstmt, 0);
                if (sqlite3_column_text(selectstmt, 1) != nil)
                    chatHistory.friendName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
                if (sqlite3_column_text(selectstmt, 2) != nil)
                    chatHistory.messageSend = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
                if (sqlite3_column_text(selectstmt, 3) != nil)
                    chatHistory.messageRecv = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)];
                if (sqlite3_column_text(selectstmt, 4) != nil) {
                    chatHistory.dateChat = sqlite3_column_int(selectstmt, 4);
                }
                [appDelegate.chatHistoryArray addObject:chatHistory];
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

-(void) addArcadeScore {
    const char *sql = "insert into userChatHistory('friendID', 'friendName', 'messageSend', 'messageRecv', 'dateChat') Values(?,?,?,?,?)";
    if (sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
    }
	sqlite3_bind_int(addStmt, 1, friednID);	
    sqlite3_bind_text(addStmt, 2, [friendName UTF8String], -1, SQLITE_TRANSIENT);	
    sqlite3_bind_text(addStmt, 3, [messageSend UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 4, [messageRecv UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_int(addStmt, 5, dateChat);	
    if(SQLITE_DONE != sqlite3_step(addStmt)) {
		NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(database));
    }
	
	//Reset the add statement.
	sqlite3_reset(addStmt);  
    NSLog(@"insert Arcade success");
}

- (void) deleteArcadeRow {
    const char *sql = "DELETE FROM userChatHistory Where friendID = ?";
    if(sqlite3_prepare_v2(database, sql, -1, &delStmt, NULL) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert1(0, @"Error while creating update statement. '%s'", sqlite3_errmsg(database));
        
    }
    sqlite3_bind_int(delStmt, 1, friednID);
	
	if (SQLITE_DONE != sqlite3_step(delStmt)) {
		NSAssert1(0, @"Error while updating data. '%s'", sqlite3_errmsg(database));
    }
    
	sqlite3_reset(delStmt);
}
+ (void) getHistoryChatOfFriend:(int)idFriend path:(NSString *)dbPath {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate.chatHistoryOfFrArr removeAllObjects];
    appDelegate.chatHistoryOfFrArr = [[NSMutableArray alloc] init];
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		const char *sql = [[NSString stringWithFormat:@"select * from userChatHistory Where friendID = '%d'",idFriend] cStringUsingEncoding:NSUTF8StringEncoding];
		sqlite3_stmt *selectstmt;
		if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
			
			while(sqlite3_step(selectstmt) == SQLITE_ROW) {
				
                // Read the data from the result row
                // Create a new diary object with the data from the database
				UsersChatHistory *chatHistory = [[UsersChatHistory alloc] init];
                chatHistory.friednID = sqlite3_column_int(selectstmt, 0);
                if (sqlite3_column_text(selectstmt, 1) != nil)
                    chatHistory.friendName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
                if (sqlite3_column_text(selectstmt, 2) != nil)
                    chatHistory.messageSend = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
                if (sqlite3_column_text(selectstmt, 3) != nil)
                    chatHistory.messageRecv = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)];
                if (sqlite3_column_text(selectstmt, 4) != nil) {
                    chatHistory.dateChat = sqlite3_column_int(selectstmt, 4);
                }
                [appDelegate.chatHistoryOfFrArr addObject:chatHistory];
                NSLog(@"get arcade infor");
			}
		}
        // Release the compiled statement from memory
        sqlite3_finalize(selectstmt);
	}
    else
        sqlite3_close(database);
}
@end
