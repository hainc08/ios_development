//
//  FriendData.h
//  iTell
//
//  Created by tranduc on 9/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"
#import "ItellShareStatusController.h"
typedef enum{
    kFriendStatusNoFriend,
    kFriendStatusInviteMe,
    kFriendStatusInviting,
    kFriendStatusNormal
}kFriendStatus;
@interface FriendData : UserData
@property(nonatomic)kFriendStatus friendStatus;
@property(nonatomic)BOOL isLoadFullData;
@property(nonatomic)kItellPlicy itellPolicy;
@property(nonatomic)int badgeNormal;
@property(nonatomic)int badgeGood;
@property(nonatomic)int badgeBad;
@property(nonatomic)BOOL restrictPub;
@property(nonatomic)BOOL block;
@property(nonatomic, retain)NSDate *itellStart;
@property(nonatomic, retain)NSMutableArray *album;
@property(nonatomic, assign)BOOL statusName;

-(void)setFriendData:(NSDictionary*)friendData;
-(void)setAlbumData:(NSArray*)arr;
@end
