//
//  VNViewController.m
//  VNReceiverBeacon
//
//  Created by TrinhLD on 12/24/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "VNReceiveViewController.h"
#import "VNPlayViewController.h"
#import "Reachability.h"
#import "Util.h"
#import "VNContent.h"


@interface VNReceiveViewController ()

@end

@implementation VNReceiveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Beacon 受信";
    // Button Refresh
    [self.btnRefresh layer].cornerRadius = 5.0f;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSInteger level = [[[NSUserDefaults standardUserDefaults] objectForKey:kKeyNameLevel] intValue];
    switch (level) {
        case kLevelImmediate:
            self.lblLevel.text = @"Immediate";
            break;
        case kLevelNear:
            self.lblLevel.text = @"Near";
            break;
        case kLevelFar:
            self.lblLevel.text = @"Far";
            break;
        default:
            break;
    }

    [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
}

- (IBAction)btnReceiveTapped:(id)sender {
    
}


- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    [self sendLocalNotificationForMessage:@"Start Monitoring Region"];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"Beacon Found");
   [self sendLocalNotificationForMessage:@"Enter Region"];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"Left Region");
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    [self sendLocalNotificationForMessage:@"without Region"];
    
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons firstObject];
    NSInteger minor = [beacon.minor integerValue];
    
    // Get setting
    NSInteger levelBeacon = [[[NSUserDefaults standardUserDefaults] objectForKey:kKeyNameLevel] intValue];
    switch (levelBeacon) {
        case kLevelImmediate:
            if (beacon.proximity == CLProximityImmediate) {
                [self playContent:minor];
            }
            break;
        case kLevelNear:
            if (beacon.proximity == CLProximityImmediate || beacon.proximity == CLProximityNear) {
                [self playContent:minor];
            }
            break;
            
        default:
            if (beacon.proximity != CLProximityUnknown) {
                [self playContent:minor];
            }
            break;
    }
    
    if (beacon.proximity != CLProximityUnknown) {
        // Check app state
        if ([[UIApplication sharedApplication] applicationState] != UIApplicationStateActive) {
//            backupAlarm = [[UILocalNotification alloc] init];
//            NSLog(@"TEST");
//            UILabel *lblTest = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
//            lblTest.text = @"TEST";
//            [self.view addSubview:lblTest];
//            backupAlarm.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
//            backupAlarm.timeZone = [NSTimeZone systemTimeZone];
//            
//            backupAlarm.alertBody = @"Good morning, time to wake up.";
//            backupAlarm.alertAction = @"Show me";
//            backupAlarm.soundName = UILocalNotificationDefaultSoundName;
            
            NSLog(@"TEST");
        }
    }
    
    NSLog(@"MINOR: %@", beacon.minor);
    //send msg
    CLBeacon *nearestBeacon = beacons.firstObject;
    NSString *rangeMessage;
    NSString *message = [NSString stringWithFormat:@"major:%@, minor:%@, accuracy:%f, rssi:%d",
                         nearestBeacon.major, nearestBeacon.minor, nearestBeacon.accuracy, nearestBeacon.rssi];
    [self sendLocalNotificationForMessage:[rangeMessage stringByAppendingString:message]];

}

- (NSArray *)listContent
{
    if (!_listContent) {
        _listContent = [[NSMutableArray alloc] init];
        // Get content URL
        _listContent = [self getListContentFromServer];
    }
    return _listContent;
}

- (NSMutableArray *)getListContentFromServer
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    if ([[Util sharedManager] connectedToNetwork]) {
        NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.sumahodetouch.info/beacon/geturl.php"]];
        NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:kID, @"id", kKey, @"key", nil];
        NSData *postData = [[Util sharedManager] encodeDictionary:dic];
        //        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:postData];
        NSURLResponse *response;
        NSError *error;
        //send it asynchronous
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        //            NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
        // check for an error. If there is a network error, you should handle it here.
        if(!error)
        {
            //log response
            if ([[responseDict valueForKeyPath:@"ret"] boolValue] == YES) {
                NSInteger numberContent = [[responseDict valueForKeyPath:@"datas.total_cnt"] integerValue];
                for (int i = 1; i <= numberContent; i ++) {
                    NSString *keyPath = [NSString stringWithFormat:@"datas.url_data.%d", i];
                    VNContent *content = [VNContent loadFullDataFromDictionary:[responseDict valueForKeyPath:keyPath]];
                    [tempArray addObject:content];
                }
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Server error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
        }
        
    } else {
        UIAlertView *alertNetwork = [[UIAlertView alloc] initWithTitle:@"Network" message:@"Check your network" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertNetwork show];
    }
    return tempArray;
}

- (IBAction)btnRefreshTapped:(id)sender {
    self.listContent = [self getListContentFromServer];
}


- (void)playContent:(NSInteger)contentID
{
    if (self.isViewLoaded && self.view.window) {
        [self locationManager:self.locationManager didExitRegion:self.beaconRegion];
        VNPlayViewController *playViewController = [[VNPlayViewController alloc] initWithNibName:@"VNPlayViewController" bundle:nil];
        if (self.listContent.count >= contentID) {
            VNContent *contentReceive = [self.listContent objectAtIndex:(contentID - 1)];
            playViewController.content = contentReceive;
            [self.navigationController pushViewController:playViewController animated:YES];
        }
    }
}

- (CLBeaconRegion *)beaconRegion
{
    if (!_beaconRegion) {
        NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"23542266-18D1-4FE4-B4A1-23F8195B9D39"];
        _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"vnext"];
        _beaconRegion.notifyEntryStateOnDisplay = YES;
    }
    return _beaconRegion;
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    [self sendLocalNotificationForMessage:@"Exit Region"];
}

#pragma mark - Private methods

- (void)sendLocalNotificationForMessage:(NSString *)message
{
    UILocalNotification *localNotification = [UILocalNotification new];
    localNotification.alertBody = message;
    localNotification.fireDate = [NSDate date];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
