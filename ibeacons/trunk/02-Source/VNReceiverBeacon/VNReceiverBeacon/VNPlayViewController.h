//
//  VNPlayViewController.h
//  VNReceiverBeacon
//
//  Created by TrinhLD on 12/24/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@class VNContent;

typedef enum
{
    kContentTypeVideo,
    kContentTypeImage,
    kContentTypePDF,
    kContentTypeMusic
}kContentType;

@interface VNPlayViewController : UIViewController
{
    UIImageView *_imageView;
    MPMoviePlayerController *_moviePlayerController;
    BOOL isInternet;
}

@property (retain, nonatomic) VNContent *content;

@end
