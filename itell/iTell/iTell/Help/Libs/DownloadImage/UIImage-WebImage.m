//
//  UIImage-WebImage.m
//  iTell
//
//  Created by tranduc on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIImage-WebImage.h"
static char* queueDownloadName = "app.com.downloadimage";

@implementation UIImage(UIImage_WebImage)
+ (void)processImageDataWithURLString:(NSString *)urlString andBlock:(void (^)(NSData *imageData))processImage
{
    dispatch_queue_t callerQueue = dispatch_get_current_queue();
    dispatch_queue_t downloadQueue = dispatch_queue_create(queueDownloadName, NULL);
    dispatch_async(downloadQueue, ^{
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        NSURL *url = [NSURL URLWithString:urlString];
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        dispatch_async(callerQueue, ^{
            NSAutoreleasePool *pool2 = [[NSAutoreleasePool alloc] init];
            processImage(imageData);
            [pool2 release];
        });
        [pool release];
    });
    dispatch_release(downloadQueue);
}
+(void)processImageWithBlock:(UIImage*(^)())downloadImage completeBlock:(void(^)(UIImage *imageData))processImage;{
    dispatch_queue_t callerQueue = dispatch_get_current_queue();
    dispatch_queue_t downloadQueue = dispatch_queue_create(queueDownloadName, NULL);
    dispatch_async(downloadQueue, ^{
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        UIImage *imageData = downloadImage();
        dispatch_async(callerQueue, ^{
            NSAutoreleasePool *pool2 = [[NSAutoreleasePool alloc] init];
            processImage(imageData);
            [pool2 release];
        });
        [pool release];
    });
    dispatch_release(downloadQueue);
}
@end
