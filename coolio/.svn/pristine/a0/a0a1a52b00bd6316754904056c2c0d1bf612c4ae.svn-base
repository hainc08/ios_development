//
//  MyUnit.m
//  Coolio
//
//  Created by hoehoe on 2013/05/06.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyUnit.h"

@implementation MyUnit
@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MyUnit alloc] init];
    }
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void)setUnit:(int)_unit
{
    [self.defaultObject setInteger:_unit forKey:@"unit"];
    [self.defaultObject synchronize];
}
-(int)getUnit{ return [[self.defaultObject valueForKey:@"unit"] intValue]; }

@end
