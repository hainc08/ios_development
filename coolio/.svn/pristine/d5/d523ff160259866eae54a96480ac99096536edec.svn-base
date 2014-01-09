//
//  MyNotification.m
//  Coolio
//
//  Created by hoehoe on 2013/08/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyNotification.h"

@implementation MyNotification
@synthesize defaultObject = _defaultObject;

-(id)init
{
    if(self == nil){
        self = [[MyNotification alloc] init];
    }
    if(self.defaultObject == nil){
        self.defaultObject = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

-(BOOL)isNotificationSettings
{
    return [self.defaultObject boolForKey:@"isNotificationSettings"];
}

-(void)setNotificationSettings:(BOOL)value{
    [self.defaultObject setBool:YES forKey:@"isNotificationSettings"];
}

-(void)setChatNotice:(BOOL)value{
    BOOL isNotificationSettings = [self.defaultObject boolForKey:@"isNotificationSettings"];
    
    if(isNotificationSettings == NO)
    {
        [self.defaultObject setBool:YES forKey:@"isNotificationSettings"];
    }
    
    [self.defaultObject setBool:value forKey:@"chatNotice"];
    [self.defaultObject synchronize];
}
-(BOOL)getChatNotice{
    return [self.defaultObject boolForKey:@"chatNotice"];
}

-(void)setFriendRequestNotice:(BOOL)value{
    BOOL isNotificationSettings = [self.defaultObject boolForKey:@"isNotificationSettings"];
    
    if(isNotificationSettings == NO)
    {
        [self.defaultObject setBool:YES forKey:@"isNotificationSettings"];
    }
    
    [self.defaultObject setBool:value forKey:@"friendRequestNotice"];
    [self.defaultObject synchronize];
}
-(BOOL)getFriendRequestNotice{
    return [self.defaultObject boolForKey:@"friendRequestNotice"];
}

-(void)setMatchNotice:(BOOL)value{
    BOOL isNotificationSettings = [self.defaultObject boolForKey:@"isNotificationSettings"];
    
    if(isNotificationSettings == NO)
    {
        [self.defaultObject setBool:YES forKey:@"isNotificationSettings"];
    }
    
    [self.defaultObject setBool:value forKey:@"matchNotice"];
    [self.defaultObject synchronize];
}
-(BOOL)getMatchNotice{
    return [self.defaultObject boolForKey:@"matchNotice"];
}

//-(void)setFootPrintNotice:(BOOL)value{}
//-(BOOL)getFootPrintNotice{
//    return [self.defaultObject boolForKey:@""];
//}

-(void)sync:(NSDictionary *)_myInfo
{
    BOOL isNotificationSettings = [self.defaultObject boolForKey:@"isNotificationSettings"];
    
    if(isNotificationSettings == NO)
    {
        [self.defaultObject setBool:YES forKey:@"isNotificationSettings"];
    }
    
    [self setChatNotice: [[_myInfo valueForKey:@"chatNotice"] boolValue]];
    [self setFriendRequestNotice: [[_myInfo valueForKey:@"friendRequestNotice"] boolValue]];
    [self setMatchNotice: [[_myInfo valueForKey:@"matchNotice"] boolValue]];
}

-(void)reset
{

}
@end
