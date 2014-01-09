//
//  MyPicture.h
//  Coolio
//
//  Created by hoehoe on 2013/04/23.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageResizable.h"
#import "GlobalObjects.h"

@interface MyPicture : NSObject
{
    NSUserDefaults* _defaultObject;
}

@property(nonatomic, retain) NSUserDefaults* defaultObject;

- (void)setMyPicture1:(UIImage *)image;
- (UIImage *)getMyPicture1;

- (void)setMyPicture2:(UIImage *)image;
- (UIImage *)getMyPicture2;

- (void)setMyPicture3:(UIImage *)image;
- (UIImage *)getMyPicture3;

- (void)setMyPicture4:(UIImage *)image;
- (UIImage *)getMyPicture4;

- (void)setMyPicture5:(UIImage *)image;
- (UIImage *)getMyPicture5;

-(void)sync:(NSDictionary *)_myInfo;
-(void)reset;

@end
