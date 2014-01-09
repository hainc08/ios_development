//
//  VNViewController.m
//  VNBeacon
//
//  Created by TrinhLD on 12/23/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "VNSendViewController.h"
#import "VNPlayViewController.h"
#import "Util.h"
#import "VNContent.h"

@interface VNSendViewController ()

@end

@implementation VNSendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Beacon送信";
    // corner radius
    CALayer *buttonLayer = [self.btnChoose layer];
    buttonLayer.cornerRadius = 5.0f;
    buttonLayer.borderWidth = 1.0f;
    buttonLayer.borderColor = [[UIColor colorWithRed:27.0f/255.0f green:93.0f/255.0f blue:215.0f/255.0f alpha:0.5f] CGColor];
    [self.btnPlay layer].cornerRadius = 5.0f;
    // Button Refresh
    [self.btnRefresh layer].cornerRadius = 5.0f;
    
    [self.switchView addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Check region monitoring
//    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized) {
//        NSLog(@"alo");
//    } else {
//        NSLog(@"not author");
//    }
    
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
    if (self.peripheralManager.state == CBPeripheralManagerStatePoweredOn) {
        [self startAdvertising];
    }

    
    NSLog(@"AUTHOR: %d", [CLLocationManager authorizationStatus]);
}

- (NSArray *)listContent
{
    if (!_listContent) {
        _listContent = [[NSMutableArray alloc] init];
        // Get content URL
        _listContent = [self getListContentFromServer];
        // Send ibeacon
        _currentContent = [[VNContent alloc] init];
        _currentContent = [self.listContent objectAtIndex:0];
        self.uuid = [[NSUUID alloc] initWithUUIDString:@"23542266-18D1-4FE4-B4A1-23F8195B9D39"];
        CLBeaconRegion *tempBeacon = [[CLBeaconRegion alloc] initWithProximityUUID:self.uuid major:1 minor:_currentContent.contentID identifier:@"vnext"];
        
        self.beaconPeripheralData = [tempBeacon peripheralDataWithMeasuredPower:nil];
        self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
       
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
                NSLog(@"Refresh done");
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


- (void)valueChanged:(UISwitch *)theSwitch {
    if (theSwitch.isOn) {
        [self.peripheralManager startAdvertising:self.beaconPeripheralData];
    } else {
        [self.peripheralManager stopAdvertising];
    }
}


- (IBAction)btnChooseContentTapped:(id)sender {
    self.pickerView.hidden = NO;
//    _contentID = 1;
}

- (IBAction)btnPlayTapped:(id)sender {
    VNPlayViewController *playViewController = [[VNPlayViewController alloc] initWithNibName:@"VNPlayViewController" bundle:nil];
    playViewController.content = _currentContent;
    [self.navigationController pushViewController:playViewController animated:YES];
}

- (IBAction)btnRefreshTapped:(id)sender {
    self.listContent = [self getListContentFromServer];
    [self.pickerView reloadAllComponents];
}


#pragma mark -- Picker datasource & delegate --

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.listContent.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    VNContent *content = [self.listContent objectAtIndex:row];
    return [NSString stringWithFormat:@"%d", content.contentID];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    VNContent *content = [self.listContent objectAtIndex:row];
    _currentContent = content;
    [self.btnChoose setTitle:[NSString stringWithFormat:@"%d", _currentContent.contentID] forState:UIControlStateNormal];
    
    // Switch off
    [self.switchView setOn:YES];
    // Send ibeacon
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"23542266-18D1-4FE4-B4A1-23F8195B9D39"];
    CLBeaconRegion *tempBeacon = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:1 minor:_currentContent.contentID identifier:@"vnext"];
    
    self.beaconPeripheralData = [tempBeacon peripheralDataWithMeasuredPower:nil];
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
    
    // Hide picker view
    [self.pickerView setHidden:YES];
}


#pragma mark -- Beacon delegate --

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    
    NSString *message;
    if (peripheral.state == CBPeripheralManagerStatePoweredOn && self.switchView.isOn) {
        message = @"PoweredOn";
        [self.peripheralManager startAdvertising:self.beaconPeripheralData];
        [self sendLocalNotificationForMessage:[@"PeripheralManager did update state: " stringByAppendingString:message]];
    } else {
        [self.peripheralManager stopAdvertising];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Check bluetooth" message:@"Turning on Bluetooth" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    
}

- (void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error
{
    if (error) {
        [self sendLocalNotificationForMessage:[NSString stringWithFormat:@"%@", error]];
    } else {
        [self sendLocalNotificationForMessage:@"Start Advertising"];
    }
}

#pragma mark --  Core location delegate --
// Check region monitoring
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorized) {
        NSLog(@"Author");
    } else {
        NSLog(@"Not author");
    }
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    if (error.code == kCLErrorRegionMonitoringFailure) {
        NSLog(@" ERROR");

    } else {
        NSLog(@"NOT ERROR");
    }
}


- (void)startAdvertising
{
    CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:self.uuid
                                                                           major:1
                                                                           minor:2
                                                                      identifier:@"jp.adnet.ibeacon"];
    NSDictionary *beaconPeripheralData = [beaconRegion peripheralDataWithMeasuredPower:nil];
    [self.peripheralManager startAdvertising:beaconPeripheralData];
}


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
