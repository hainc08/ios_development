//
//  MyAdditionalFilter.m
//  Coolio
//
//  Created by hoehoe on 2013/06/27.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyAdditionalFilter.h"

@implementation MyAdditionalFilter

@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MyAdditionalFilter alloc] init];
    }
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void)setSortedFlags:(BOOL)flg
{
    [self.defaultObject setBool:flg forKey:@"sortedFlags"];
    [self.defaultObject synchronize];
}
-(BOOL)getSortedFlags{ return [self.defaultObject boolForKey:@"sortedFlags"]; }

-(void)setOnlineFlags:(BOOL)flg
{
    [self.defaultObject setBool:flg forKey:@"onlineFlags"];
    [self.defaultObject synchronize];
}

-(BOOL)getOnlineFlags{ return [self.defaultObject boolForKey:@"onlineFlags"]; }

-(void)setNewUserFlags:(BOOL)flg
{
    [self.defaultObject setBool:flg forKey:@"newUserFlags"];
    [self.defaultObject synchronize];
}

-(BOOL)getNewUserFlags{ return [self.defaultObject boolForKey:@"newUserFlags"]; }

-(void)reset
{
    [self.defaultObject setBool:NO forKey:@"sortedFlags"];
    [self.defaultObject setBool:NO forKey:@"onlineFlags"];
    [self.defaultObject setBool:NO forKey:@"newUserFlags"];
    [self.defaultObject synchronize];
}

@end
