//
//  VNViewController.h
//  VNReceiverBeacon
//
//  Created by TrinhLD on 12/24/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>

#define kID @"jazzinterplay"
#define kKey @"LwiBtKcFeWw2FuMI8Wrzfg1RgmU2CKc"

@class VNContent;

@interface VNReceiveViewController : BaseViewController <CLLocationManagerDelegate>
{
    VNContent *_currentContent;

    UILocalNotification *backupAlarm;
}

@property (strong, nonatomic) IBOutlet UILabel *lblLevel;
@property (retain, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *listContent;
@property (strong, nonatomic) IBOutlet UIButton *btnRefresh;

@end
