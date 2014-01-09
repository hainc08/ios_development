//
//  UserInfo.h
//  iTell
//
//  Created by Thap on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


enum {
    kTypeFriend = 1,
    kTypeOther = 2,
    kTypeCompany = 3,
} kUserType;

@interface UserInfo : NSObject
@property(nonatomic,assign)NSInteger userId;
@property(nonatomic,retain)NSString* nickname;
@property(nonatomic,retain)NSString* imageURL;
@property(nonatomic,retain)NSString* status;
@property(nonatomic,retain)NSString* time;
@property(nonatomic,retain)CLLocation *location;
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,assign)BOOL isFemale;
@property(nonatomic,assign)float distance;

@end
