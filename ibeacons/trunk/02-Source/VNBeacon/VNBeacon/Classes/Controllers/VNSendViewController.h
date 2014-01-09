//
//  VNViewController.h
//  VNBeacon
//
//  Created by TrinhLD on 12/23/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

#define kID @"jazzinterplay"
#define kKey @"LwiBtKcFeWw2FuMI8Wrzfg1RgmU2CKc"

@class VNContent;

@interface VNSendViewController : UIViewController <CBPeripheralManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate>
{
    VNContent *_currentContent;
}

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) NSDictionary *beaconPeripheralData;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

// Subviews

@property (strong, nonatomic) IBOutlet UISwitch *switchView;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSMutableArray *listContent;
@property (strong, nonatomic) IBOutlet UIButton *btnChoose;
@property (strong, nonatomic) IBOutlet UIButton *btnPlay;
@property (strong, nonatomic) IBOutlet UIButton *btnRefresh;
@property (nonatomic) NSUUID *uuid;

@end
