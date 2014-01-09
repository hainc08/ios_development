//
//  MyFootPrintSettings.m
//  Coolio
//
//  Created by hoehoe on 2013/05/06.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyFootPrintSettings.h"

@implementation MyFootPrintSettings
@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MyFootPrintSettings alloc] init];
    }
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void)setFootPrint:(BOOL)_footPrint
{
    [self.defaultObject setBool:YES forKey:@"isAlreadySetFootPrint"];
    [self.defaultObject setBool:_footPrint forKey:@"footPrint"];
    [self.defaultObject synchronize];
}
-(BOOL)getFootPrint
{
    if([self.defaultObject boolForKey:@"isAlreadySetFootPrint"] == YES){
        return [self.defaultObject boolForKey:@"footPrint"];
    }else{
        return YES;
    }
}




@end
