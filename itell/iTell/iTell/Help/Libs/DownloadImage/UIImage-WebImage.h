//
//  UIImage-WebImage.h
//  iTell
//
//  Created by tranduc on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage(UIImage_WebImage)
+ (void)processImageDataWithURLString:(NSString *)urlString andBlock:(void (^)(NSData *imageData))processImage;
+(void)processImageWithBlock:(UIImage*(^)())downloadImage completeBlock:(void(^)(UIImage *imageData))processImage;
@end
