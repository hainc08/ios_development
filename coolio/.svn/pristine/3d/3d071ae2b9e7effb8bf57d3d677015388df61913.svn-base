//
//  CountryViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/07/04.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "CountryViewController.h"

@interface CountryViewController ()

@end

@implementation CountryViewController

@synthesize countryPicker;

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
    [self openPasscodeView];
    
	// Do any additional setup after loading the view.
    account = [[MyProfiles alloc] init];
    
    // ファイル（hoge.plist）からNSArrayを生成する
    //NSArray *languages = [NSLocale preferredLanguages];
    //NSString *currentLanguage = [languages objectAtIndex:0];
    
    NSString* plistFile;
    if([currentLanguage isEqualToString:@"ja"]){
        plistFile = [[NSBundle mainBundle] pathForResource:@"CountryData-ja" ofType:@"plist"];
    }else{
        // if([currentLanguage isEqualToString:@"en"]){
        plistFile = [[NSBundle mainBundle] pathForResource:@"CountryData-en" ofType:@"plist"];
    }
    countryArray = [NSArray arrayWithContentsOfFile:plistFile];
    countryArray = [self sortArrayByCountoryNames:countryArray];
    countryArray = [self changeArrayByCountryLastValue:countryArray];
    
    countryPicker.delegate = self;
    countryPicker.dataSource = self;
    countryPicker.showsSelectionIndicator = YES;
    
    @try{
        NSString* countryValue = [account getCountryProfile];
        if(countryValue != nil &&  ![countryValue isEqualToString:@""]){
            NSDictionary* countryValueDict =  countryArray[[[countryArray valueForKeyPath:@"id"] indexOfObject:countryValue]];
            self.lbl_country.text = [countryValueDict valueForKey:@"name"];
        }
    }@catch (NSException* e) {}
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
    return 1;
}

// 行数を返す例
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    //if(component == 0){
        return [countryArray count];  // 1列目は10行
    //}else{
    //    return 12;  // 2列目は5行
    //}
    
}

// 表示する内容を返す例
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    // 行インデックス番号を返す
    //return [NSString stringWithFormat:@"%d", row];
    switch (component) {
        case 0:
            {
                NSDictionary* dict = countryArray[row];
                return [dict valueForKey:@"name"];
                break;
            }
    //    case 1:
    //        return [a2 objectAtIndex:row];
    //        break;
        default:
            break;
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSDictionary* dict = countryArray[row];
    self.lbl_country.text = [dict valueForKey:@"name"];
    int value = [[dict valueForKey:@"id"] intValue];
    
    [account setCountryProfile:[NSString stringWithFormat:@"%d", value]];
    
    // NSNotificationの生成（通知名："toNotifiTheChangeProfile"）
    NSNotification *n = [NSNotification notificationWithName:@"toNotifiTheChangeProfile" object:self];
    
    // 通知センターを取得する
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 通知をする
    [nc postNotification:n];
}

-(NSArray *)sortArrayByCountoryNames:(NSArray *)array{
    
    array = [array sortedArrayUsingComparator: ^(id a, id b) {
        
        NSString* nameStringA = [a valueForKey:@"name"];
        NSString* nameStringB = [b valueForKey:@"name"];
        return [nameStringA localizedCaseInsensitiveCompare:nameStringB];
    }];
    return array;
}

-(NSArray *)changeArrayByCountryLastValue:(NSArray *)array
{
    NSMutableArray* mArray = [array mutableCopy];
    int idx = [[mArray valueForKeyPath:@"id"] indexOfObject:@"999"];
    [mArray removeObjectAtIndex:idx];
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setValue:@"999" forKey:@"id"];

    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = languages[0];
    
    if([currentLanguage isEqualToString:@"ja"]){
        [dict setValue:@"その他/なし" forKey:@"name"];
    }else{
        [dict setValue:@"Etc/None" forKey:@"name"];
    }
    [mArray addObject:dict];
    return mArray;
}


@end
