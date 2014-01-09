//
//  VNSettingViewController.m
//  VNReceiverBeacon
//
//  Created by TrinhLD on 12/27/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "VNSettingViewController.h"

@interface VNSettingViewController ()

@end

@implementation VNSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setLevel];
    if (self) {
        // Custom initialization
        self.title = @"設定";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CALayer *buttonLayer = [self.btnChooseLevel layer];
    buttonLayer.cornerRadius = 5.0f;
    buttonLayer.borderWidth = 1.0f;
    buttonLayer.borderColor = [[UIColor colorWithRed:27.0f/255.0f green:93.0f/255.0f blue:215.0f/255.0f alpha:0.5f] CGColor];
    // Set title button choose level
    [self setLevel];
    // Set switch view
    [self.switchView setOn:[[[NSUserDefaults standardUserDefaults] objectForKey:kKeyNameLocalContentFlag] boolValue]];
}

- (IBAction)viewTapGesture:(UITapGestureRecognizer *)sender {
    self.pickerView.hidden = YES;
}

- (void)setLevel
{
    NSInteger level = [[[NSUserDefaults standardUserDefaults] objectForKey:kKeyNameLevel] intValue];
    switch (level) {
        case kLevelImmediate:
            [self.btnChooseLevel setTitle:@"Immediate" forState:UIControlStateNormal];
            break;
        case kLevelNear:
            [self.btnChooseLevel setTitle:@"Near" forState:UIControlStateNormal];
            break;
        case kLevelFar:
            [self.btnChooseLevel setTitle:@"Far" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (NSArray *)listLevel
{
    if (!_listLevel) {
        _listLevel = [[NSArray alloc] initWithObjects:@"Immediate", @"Near", @"Far", nil];
    }
    return _listLevel;
}

- (IBAction)btnChooseLevelTapped:(id)sender {
    self.pickerView.hidden ? (self.pickerView.hidden = NO) : (self.pickerView.hidden = YES);
}

- (IBAction)swValueChange:(UISwitch *)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:sender.isOn forKey:kKeyNameLocalContentFlag];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark -- Pickerview delegate --

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.listLevel objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // Save to default
    [[NSUserDefaults standardUserDefaults] setInteger:row forKey:kKeyNameLevel];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self setLevel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
