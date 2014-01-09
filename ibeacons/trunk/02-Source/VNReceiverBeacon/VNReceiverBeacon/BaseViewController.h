//
//  BaseViewController.h
//  VNReceiverBeacon
//
//  Created by TrinhLD on 12/27/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kKeyNameLocalContentFlag @"LocalContentFlag"
#define kKeyNameLevel @"LevelBeacon"

typedef enum
{
    kLevelImmediate,
    kLevelNear,
    kLevelFar
}kLevel;

@interface BaseViewController : UIViewController

@end
