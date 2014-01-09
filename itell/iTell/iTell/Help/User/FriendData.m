//
//  FriendData.m
//  iTell
//
//  Created by tranduc on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendData.h"
#import "NSDate+Formater.h"
@implementation FriendData
@synthesize friendStatus;
@synthesize itellStart, itellPolicy, badgeBad, badgeGood, badgeNormal;
@synthesize restrictPub, block;
@synthesize isLoadFullData;
@synthesize album;
@synthesize statusName;


-(void)dealloc{
    [itellStart release];
    [super dealloc];
}

/*
 {
 "id": "233716",
 "nick": "tanao",
 "mobile_num": "134567365734535",
 "avatar": "",
 "gender": true,
 "itell": "",
 "itell_policy": "0",
 "itell_start": "0000-00-00 00:00:00",
 "can_search": true,
 "name": "dfgdfgdfg",
 "birth": "1988-01-31 00:00:00",
 "desc": "",
 "badge_good": "0",
 "badge_normal": "0",
 "badge_bad": "0",
 "restrict_pub": false,
 "block": false
 }
 */
-(void)setFriendData:(NSDictionary *)friendData{
    self.userID = [[friendData objectForKey:@"id"] intValue];
    self.nick = [friendData objectForKey:@"nick"];
    self.mobileNumber = [friendData objectForKey:@"mobile_num"];
    self.avatar = [friendData objectForKey:@"avatar"];
    self.gender = [[friendData objectForKey:@"gender"] boolValue];
    self.itell = [friendData objectForKey:@"itell"];
    self.itellPolicy = [[friendData objectForKey:@"itell_policy"] intValue];
    self.itellStart = [NSDate dateFromString:[friendData objectForKey:@"itell_start"]];
    self.name = [friendData objectForKey:@"name"];
    self.birth = [friendData objectForKey:@"birth"];
    self.desc = [friendData objectForKey:@"desc"];
    self.badgeGood = [[friendData objectForKey:@"badge_good"] intValue];
    self.badgeNormal = [[friendData objectForKey:@"badge_normal"] intValue];
    self.badgeBad = [[friendData objectForKey:@"badge_bad"] intValue];
    self.restrictPub = [[friendData objectForKey:@"restrict_pub"] boolValue];
    self.block = [[friendData objectForKey:@"block"] boolValue];
}
-(void)setAlbumData:(NSArray*)arr{
    self.album = [NSMutableArray arrayWithCapacity:[arr count]];
    for (NSDictionary *dic in arr) {
        [album addObject:[dic objectForKey:@"url"]];
    }
}
@end
