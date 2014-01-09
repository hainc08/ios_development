//
//  NTDataControl.m
//  notore
//
//  Created by haimv on 2013/11/21.
//  Copyright (c) 2013年 vnext. All rights reserved.
//

#import "NTDataControl.h"
#import "FMDatabase.h"
#import "NTQuestionObject.h"
#import "NTQuizObject.h"
#import "Util.h"

#define DATABASE_FILE @"notore.sqlite"
#define SQL_FILE @"notore.sql"


@implementation NTDataControl

#pragma mark -
#pragma mark - DATABASE handler

+ (NSString *) getFilePath:(NSString*)filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    return [docsPath stringByAppendingPathComponent:filePath];
}

+ (void) copyDatabaseIfNeeded
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSString *dbPath = [self getFilePath:DATABASE_FILE];
	BOOL success = [fileManager fileExistsAtPath:dbPath];
    
	if(!success) {
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DATABASE_FILE];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
		
		if (!success) {
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
		}
	}
}

+ (void)runSqlFileScript
{
    FMDatabase *db = [FMDatabase databaseWithPath:[self getFilePath:DATABASE_FILE]];
    
    if (![db open]) {
        NSLog(@"Could not open db.");
        return;
    }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"notore" ofType:@"sql"];
    NSString *query = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    [db executeUpdate:query];
    [db close];
}


#pragma mark -
#pragma mark - Query methods

+ (NSMutableArray*) getRandomDataByLevel:(NSInteger)level
{
    NSMutableArray *resultList = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[self getFilePath:DATABASE_FILE]];
    
    if (![db open]) {
        NSLog(@"Could not open db.");
    }
    
    NSString* query = @"SELECT * FROM question_mst";
    
    if (level != 0)
    {
        query = [NSString stringWithFormat:@"%@ WHERE q_level = '%d' ORDER BY q_id",query,level];
    }
    else
    {
        query = [NSString stringWithFormat:@"%@",query];
    }
    
    FMResultSet *rs = [db executeQuery:query];
    
    while ([rs next]) {
        NTQuestionObject *objQuestion = [[NTQuestionObject alloc] init];
        
        objQuestion.q_id = [rs intForColumn:@"q_id"];
        objQuestion.q_name = [rs stringForColumn:@"q_name"];
        objQuestion.q_tag = [rs intForColumn:@"q_tag"];
        objQuestion.q_kind = [rs intForColumn:@"q_kind"];
        objQuestion.q_level = [rs intForColumn:@"q_level"];
        objQuestion.q_number = [rs intForColumn:@"q_number"];
        objQuestion.q_stt = [rs intForColumn:@"q_stt"];
        [resultList addObject:objQuestion];
    }
    [db close];
    
    return resultList;

}

+ (NSArray *)getListQuizByLevel:(NSInteger)level
{
    // Get all data by level
    NSArray *listData = [[NSArray alloc] initWithArray:[NTDataControl getRandomDataByLevel:level]];
    // Alloc
    NSMutableArray *listQuiz = [[NSMutableArray alloc] init];
    // Set data
    for (int i = 0; i < (listData.count / (kNumberAnswer + 1)); i ++) {
        // Create quiz object
        NTQuizObject *tempQuiz = [[NTQuizObject alloc] init];
        NTQuestionObject *tempQuestion = (NTQuestionObject *)[listData objectAtIndex:(i * (kNumberAnswer +1))];
        tempQuiz.question = tempQuestion;
        NSMutableArray *tempListAnswer = [[NSMutableArray alloc] init];
        for (int j = 1; j <= kNumberAnswer; j ++) {
            NTQuestionObject *tempAnswer = (NTQuestionObject *)[listData objectAtIndex:((i* (kNumberAnswer + 1)) + j)];
            [tempListAnswer addObject:tempAnswer];
        }
        // Shuffle list answers
        tempListAnswer = [Util shuffleArray:tempListAnswer];
        tempQuiz.listAnswer = [[NSArray alloc] initWithArray:tempListAnswer];
        [listQuiz addObject:tempQuiz];
    }
    // Shuffle list quizs
    listQuiz = [Util shuffleArray:listQuiz];
    return listQuiz;
}


+ (void)addClearLevel:(NSInteger)levelID withQNum:(NSInteger)qnum
{
//    FMDatabase *db = [FMDatabase databaseWithPath:[self getFilePath:DATABASE_FILE]];
//    if (![db open]) {
//        NSLog(@"Could not open db.");
//        return;
//    }
//    NSString* query = [NSString stringWithFormat:@"UPDATE score_mst SET qnum = '%d' WHERE level = '%d'",qnum,levelID];
//    [db executeUpdate:query];
//    [db close];
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setInteger:qnum forKey:[NSString stringWithFormat:@"lv%d",levelID]];
}
+ (void) resetAllLevel
{
//    FMDatabase *db = [FMDatabase databaseWithPath:[self getFilePath:DATABASE_FILE]];
//    if (![db open]) {
//        NSLog(@"Could not open db.");
//        return;
//    }
//    NSString* query = [NSString stringWithFormat:@"UPDATE score_mst SET qnum = '0'"];
//    [db executeUpdate:query];
//    [db close];
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    for(int i =1; i<=6;i++)
    {
        [standardUserDefaults setInteger:0 forKey:[NSString stringWithFormat:@"lv%d",i]];
    }
}
+ (int) getScoreOfLevel: (NSInteger) level
{
//    FMDatabase *db = [FMDatabase databaseWithPath:[self getFilePath:DATABASE_FILE]];
//    if (![db open]) {
//        NSLog(@"Could not open db.");
//        
//    }
//    NSString* query = [NSString stringWithFormat:@"SELECT qnum FROM score_mst WHERE level = '%d'",level];
//    FMResultSet *rs = [db executeQuery:query];
//    int score = [rs intForColumn:@"qnum"];
//    [db close];
//    return score;
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    int score = [[standardUserDefaults valueForKey:[NSString stringWithFormat:@"lv%d",level]] intValue];
    return score;
}
+ (void) setNumberPlayed:(int) i
{
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setInteger:i forKey:@"numberPlayed"];
}
+ (int) getNumberPlayed
{
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    int number = [[standardUserDefaults valueForKey:@"numberPlayed"] intValue];
    return number;
}
+ (void) setScorePlayed:(int) i
{
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setInteger:i forKey:@"ScorePlayed"];
    
}
+ (int) getScorePlayed
{
    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    int number = [[standardUserDefaults valueForKey:@"ScorePlayed"] intValue];
    return number;
}
@end
