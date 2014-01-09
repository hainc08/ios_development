//
//  NSDate-Formater.m
//  iTell
//
//  Created by tranduc on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Formater.h"
#import "ITMarco.h"

@implementation NSDate (NSDate_Formater)
+(NSDate*)dateFromString:(NSString*)str{
//    ITLOG(@"str = %@", str);
//    str = @"2012-08-26 19:26:14";
//    ITLOG(@"new Str = %@", str);
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    
    // "hh for 0-12h", "HH for 0-24h"
    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
//    [dateformater setTimeZone:[NSTimeZone systemTimeZone]];
//    [dateformater setFormatterBehavior:NSDateFormatterBehaviorDefault];
    [dateformater setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+09:00"]];
    NSDate *date = [dateformater dateFromString:str];
    //ITLOG(@"dateformater = %@, date = %@",dateformater, date);
    [dateformater release];
    return date;
}
+(NSTimeInterval)timeInterval1970FromString:(NSString*)str{
    
    return [[NSDate dateFromString:str] timeIntervalSince1970];
}
@end
