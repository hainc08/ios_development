//
//  MyApp.m
//  Coolio
//
//  Created by hoehoe on 2013/10/15.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyApp.h"

@implementation MyApp
@synthesize defaultObject;

-(id)init
{
    if(self == nil){
        self = [super init];
    }
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void)setLastUpdate
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *lastUpdateString = [fmt stringFromDate:[NSDate date]];
    [self.defaultObject setValue:lastUpdateString forKey:@"lastUpdate"];
}

-(NSDate *)getLastUpdate
{
    NSDate* lastUpdate = nil;
    NSString* lastUpdateString = [self.defaultObject valueForKey:@"lastUpdate"];
    if(lastUpdateString != nil){
        NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
        [fmt setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        lastUpdate = [fmt dateFromString:lastUpdateString];
    }
    return lastUpdate;
}

@end
