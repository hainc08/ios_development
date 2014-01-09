//
//  MySession.m
//  Coolio
//
//  Created by hoehoe on 2013/05/27.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MySession.h"

@implementation MySession
@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MySession alloc] init];
    }
    
    self.defaultObject = [NSUserDefaults standardUserDefaults];
    
    return self;
}

-(void)doLogOut:(BOOL)logout
{
    [self.defaultObject setBool:logout forKey:@"logout"];
    [self.defaultObject synchronize];
}

-(BOOL)getLoggedOutFlag
{
    return [self.defaultObject boolForKey:@"logout"];
}


@end
