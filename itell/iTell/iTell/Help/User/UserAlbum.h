//
//  UserAlbum.h
//  iTell
//
//  Created by tranduc on 9/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UserImage:NSObject
@property(nonatomic)int imageId;
@property(nonatomic, retain)NSString *url;
@end
@interface UserAlbum : NSObject
@property(nonatomic, retain)NSMutableArray *album;

-(void)addUserAlbum:(NSArray*)arr;
@end
