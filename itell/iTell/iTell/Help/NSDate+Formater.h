//
//  NSDate-Formater.h
//  iTell
//
//  Created by tranduc on 8/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NSDate_Formater)
+(NSDate*)dateFromString:(NSString*)str;
+(NSTimeInterval)timeInterval1970FromString:(NSString*)str;
@end
