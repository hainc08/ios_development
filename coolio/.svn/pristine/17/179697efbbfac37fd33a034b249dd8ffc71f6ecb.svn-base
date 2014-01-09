//
//  MyAgreement.m
//  Coolio
//
//  Created by hoehoe on 2013/10/26.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyAgreement.h"

@implementation MyAgreement
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

-(void)setAgreement:(BOOL)value{
    [self.defaultObject setBool:value forKey:@"agreement"];
}
-(BOOL)getAgreement{
   return [self.defaultObject boolForKey:@"agreement"];
}
@end
