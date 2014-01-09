//
//  UserData.m
//  iTell
//
//  Created by tranduc on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserData.h"
#import "ITMarco.h"

@implementation UserData
@synthesize userID, birth, gender;
@synthesize uuid, mobileNumber, isp, nick, name, urlAvatar, avatar;
@synthesize desc, itell;

-(void)dealloc{
    ITINFO_FUNC
    [itell release];
    [uuid release];
    [birth release];
    [mobileNumber release];
    [isp release];
    [nick release];
    [name release];
    [urlAvatar release];
    [avatar release];
    [desc release];
    [super dealloc];
}
@end
