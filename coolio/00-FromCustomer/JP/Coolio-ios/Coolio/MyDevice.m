//
//  MyDevice.m
//  Coolio
//
//  Created by hoehoe on 2013/07/21.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyDevice.h"

@implementation MyDevice
@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MyDevice alloc] init];
    }
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(void)setDeviceId:(NSString *)deviceId
{
    [self.defaultObject setValue:deviceId forKey:@"myDeviceId"];
    [self.defaultObject synchronize];
}

-(NSString *)getDeviceId{return [self.defaultObject valueForKey:@"myDeviceId"];}


@end
