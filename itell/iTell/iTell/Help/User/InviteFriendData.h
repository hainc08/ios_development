//
//  InviteFriendData.h
//  iTell
//
//  Created by tranduc on 9/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InviteFriendData : NSObject
@property(nonatomic)int userId;
@property(nonatomic)int mobileNum;
@property(nonatomic, copy)NSString *email;
@property(nonatomic, copy)NSString *name;

@end
