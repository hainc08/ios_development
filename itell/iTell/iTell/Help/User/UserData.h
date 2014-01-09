//
//  UserData.h
//  iTell
//
//  Created by tranduc on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject
@property(nonatomic)int userID;
@property(nonatomic, retain)NSString* birth; 
@property(nonatomic)BOOL gender;

@property(nonatomic, retain)NSString *uuid;
@property(nonatomic, retain)NSString *mobileNumber;
@property(nonatomic, retain)NSString *isp;
@property(nonatomic, retain)NSString *nick;
@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *urlAvatar;
@property(nonatomic, retain)UIImage *avatar;
@property(nonatomic, retain)NSString *desc;
@property(nonatomic, retain)NSString *itell;
@end
