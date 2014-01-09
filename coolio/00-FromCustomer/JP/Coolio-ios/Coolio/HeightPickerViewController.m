//
//  HeightPickerViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/05/06.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "HeightPickerViewController.h"

@interface HeightPickerViewController ()

@end

@implementation HeightPickerViewController
@synthesize heightPicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openPasscodeView];
    account = [[MyProfiles alloc] init];
    
    a1 = @[@"1'", @"2'", @"3'", @"4'", @"5'", @"6'", @"7'", @"8'"];
    a2 = @[@"0\"", @"1\"", @"2\"", @"3\"", @"4\"", @"5\"", @"6\"", @"7\"", @"8\"", @"9\"", @"10\"", @"11\""];
    
    heightPicker.delegate = self;
    heightPicker.dataSource = self;
    heightPicker.showsSelectionIndicator = YES;
    //unit = [[MyUnit alloc] init];
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        
        
        //NSLog(@"popView");
    }
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// デリゲートメソッドの実装
// 列数を返す例
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 2;
}

// 行数を返す例
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if(component == 0){
        return 8;  // 1列目は10行
    }else{
        return 12;  // 2列目は5行
    }
    
}

// 表示する内容を返す例
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    // 行インデックス番号を返す
    //return [NSString stringWithFormat:@"%d", row];
    switch (component) {
        case 0:
            return a1[row];
            break;
        case 1:
            return a2[row];
            break;
        default:
            break;
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1列目の選択された行数を取得
    NSInteger row1 = [pickerView selectedRowInComponent:0];
    
    // 2列目の選択された行数を取得
    NSInteger row2 = [pickerView selectedRowInComponent:1];
    
    //NSLog(@"1列目:%d行目が選択", row1);
    //NSLog(@"2列目:%d行目が選択", row2);
        
    
    int feet = [[a1[row1] substringFromIndex:0] intValue];
    int inch = [[a2[row2] substringFromIndex:0] intValue];
    int height = (feet * 30.48) + (inch * 2.54);
    
    [account setHeightProfile:[NSString stringWithFormat:@"%d", height]];
    
    /*
    // NSNotificationの生成（通知名："toNotifiTheChangeProfile"）
    NSNotification *n = [NSNotification notificationWithName:@"toNotifiTheChangeProfile" object:self];
    
    // 通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知をする
    [nc postNotification:n];
    */
}
@end
