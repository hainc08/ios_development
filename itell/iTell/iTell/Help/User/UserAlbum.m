
//
//  UserAlbum.m
//  iTell
//
//  Created by tranduc on 9/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserAlbum.h"
@implementation UserImage
@synthesize imageId, url;
-(void)dealloc{
    [url release];
    [super dealloc];
}
@end

@implementation UserAlbum
@synthesize album;
-(id)init{
    self = [super init];
    if (self) {
        album = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void)addUserAlbum:(NSArray *)arr{
    for (NSDictionary *dic in arr) {
        UserImage *im = [[UserImage alloc] init];
        im.imageId = [[dic objectForKey:@"id"] intValue];
        im.url = [dic objectForKey:@"url"];
        [album addObject:im];
        [im release];
    }
}
-(void)dealloc{
    [album release];
    [super dealloc];
}
@end
