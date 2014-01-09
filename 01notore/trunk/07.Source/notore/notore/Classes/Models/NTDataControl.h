//
//  NTDataControl.h
//  notore
//
//  Created by haimv on 2013/11/21.
//  Copyright (c) 2013年 vnext. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kNumberAnswer 4

@interface NTDataControl : NSObject

+ (void) copyDatabaseIfNeeded;
+ (NSMutableArray*) getRandomDataByLevel:(NSInteger)level;
+ (void)addClearLevel:(NSInteger)levelID withQNum:(NSInteger)qnum;
+ (NSArray *)getListQuizByLevel:(NSInteger)level;
+ (void) resetAllLevel;
+ (int) getScoreOfLevel: (NSInteger) level;
+ (void) setNumberPlayed:(int) i;
+ (int) getNumberPlayed;
+ (void) setScorePlayed:(int) i;
+ (int) getScorePlayed;
@end
