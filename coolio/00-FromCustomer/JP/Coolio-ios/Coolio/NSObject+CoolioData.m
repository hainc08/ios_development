//
//  NSObject+CoolioData.m
//  Coolio
//
//  Created by hoehoe on 2013/05/21.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NSObject+CoolioData.h"

@implementation NSObject (CoolioData)

-(R9HTTPRequest *)createRequest:(NSString *)method
{
    NSMutableString* urlString = [[NSMutableString alloc] init];
    
    [urlString appendString:URLSTRING];
    [urlString appendString:method];
    
    NSURL* url = [NSURL URLWithString:urlString];
    //NSLog(@"%@", urlString);
    R9HTTPRequest* request = [[R9HTTPRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    return request;
}





@end
