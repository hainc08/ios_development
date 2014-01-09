//
//  VNContent.m
//  VNBeacon
//
//  Created by TrinhLD on 1/7/14.
//  Copyright (c) 2014 vnext. All rights reserved.
//

#import "VNContent.h"
#import "NSDictionary+Additions.h"

@implementation VNContent



+ (VNContent *)loadFullDataFromDictionary:(NSDictionary *)dict
{
    if (dict) {
        VNContent *content = [[VNContent alloc] init];
        content.contentID = [dict integerForKey:@"no"];
        content.contentURL = [NSURL URLWithString:[dict stringForKey:@"url"]];
        return content;
    }
    return nil;
}

+ (id)objectFullFromDictionary:(NSDictionary *)dict
{
    if (dict) {
        VNContent *content = [[VNContent alloc] init];
//        [content loadFullDataFromDictionary:dict];
        return content;
    }
    return nil;
}

+ (NSArray *)arrayFullFromDictionary:(NSArray *)array
{
    NSDictionary *testDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"a", @"1", nil];
    NSDictionary *testDict1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"b", @"2", nil];
    NSDictionary *testDict2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"c", @"3", nil];
    NSArray *testArray = [[NSArray alloc] initWithObjects:testDict, testDict1, testDict2, nil];
    for (NSDictionary *dic in testArray) {
//        NSLog(@"%@", dic);
    }
    
    if (array) {
        
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in array) {
            NSLog(@"%@", [dictionary valueForKeyPath:@"1.url"]);
            
            VNContent *content = [[VNContent alloc] init];
            
//            [content loadFullDataFromDictionary:[dictionary valueForKeyPath:@"1"]];
            [tempArray addObject:content];
        }
        return tempArray;
    }
    return nil;
}



@end
