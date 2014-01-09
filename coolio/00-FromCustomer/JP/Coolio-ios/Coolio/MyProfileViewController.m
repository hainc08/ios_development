//
//  MyProfileViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyProfileViewController.h"

@interface MyProfileViewController ()

@end

@implementation MyProfileViewController

@synthesize cell_email;
@synthesize cell_pass;
@synthesize cell_lastname;
@synthesize cell_unit;

@synthesize cell_1;
@synthesize cell_2;
@synthesize cell_3;
@synthesize cell_4;
@synthesize cell_5;
@synthesize cell_6;
@synthesize cell_7;
@synthesize cell_8;
@synthesize cell_9;
@synthesize cell_10;
@synthesize cell_11;
@synthesize cell_12;
@synthesize cell_13;
@synthesize cell_14;
@synthesize cell_15;
@synthesize cell_16;
@synthesize cell_17;
@synthesize cell_18;
@synthesize cell_19;
@synthesize cell_20;
@synthesize cell_21;
@synthesize cell_22;
@synthesize cell_23;
@synthesize cell_24;
@synthesize cell_25;
@synthesize cell_26;
@synthesize cell_27;
@synthesize cell_28;
@synthesize cell_29;

@synthesize lbl_age;
@synthesize lbl_email;
@synthesize lbl_height;
@synthesize lbl_lastname;
@synthesize lbl_password;
@synthesize lbl_weight;
@synthesize lbl_sexuallity;
@synthesize lbl_race;
@synthesize lbl_country;

-(id)init
{
    if(self == nil){
        self = [super init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openPasscodeView];
    
    account = [[MyProfiles alloc] init];
    unit = [[MyUnit alloc] init];
    
    if(tempRegisterMyID_Global != nil){
        self.myId = tempRegisterMyID_Global;
        [account setEmailProfile:self.myId];
    }
    ///NSLog(@"Call ViewDidLoad");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //NSLog(@"Call viewDidAppear");
    
    if([account getEmailProfile] != nil){
        self.lbl_email.text = [account getEmailProfile];
    }
    if(self.myId != nil){
        self.lbl_email.text = self.myId;
    }
    if([account getPasswordProfile] != nil){
        self.lbl_password.text = @"●●●●●●●●●●";
        //[account getPasswordProfile];
    }
    
    if([account getNickNameProfile] != nil){
        self.lbl_lastname.text = [account getNickNameProfile];
    }
    
    if([account getAgeProfile] != nil){
        //NSArray *languages = [NSLocale preferredLanguages];
        //NSString *currentLanguage = [languages objectAtIndex:0];
        
        if([currentLanguage isEqualToString:@"ja"]){
            self.lbl_age.text = [NSString stringWithFormat:@"%@ 歳", [account getAgeProfile]];
        }else{
            self.lbl_age.text = [account getAgeProfile];
        }
    }
    
    if([account getHeightProfile] != nil){
        self.lbl_height.text = [account getHeightProfile];
    }
    
    if([account getWeightProfile] != nil){
        self.lbl_weight.text = [account getWeightProfile];
    }
    
    if([account getSexuallityProfile] != nil){
        NSString* sexuallity;
        NSDictionary* sexuallityDict = [account getSexuallityProfile];
        if([[sexuallityDict valueForKey:@"sexGayProfile"] boolValue] == YES){
            sexuallity = NSLocalizedString(@"sexGay", nil);
        }
        if([[sexuallityDict valueForKey:@"sexBisexProfile"] boolValue] == YES){
            sexuallity = NSLocalizedString(@"sexBisex", nil);
        }
        if([[sexuallityDict valueForKey:@"sexStraightProfile"] boolValue] == YES){
            sexuallity = NSLocalizedString(@"sexStraight", nil);
        }
        self.lbl_sexuallity.text = sexuallity;
    }
    
    if([account getRaceProfile] != nil){
        NSString* race;
        NSDictionary* raceDict = [account getRaceProfile];
        if([[raceDict valueForKey:@"raceAsianProfile"] boolValue] == YES){
            race = NSLocalizedString(@"raceAsian", nil);
        }
        if([[raceDict valueForKey:@"raceWhiteProfile"] boolValue] == YES){
            race = NSLocalizedString(@"raceWhite", nil);
        }
        if([[raceDict valueForKey:@"raceBlackProfile"] boolValue] == YES){
            race = NSLocalizedString(@"raceBlack", nil);
        }
        if([[raceDict valueForKey:@"raceLatinProfile"] boolValue] == YES){
            race = NSLocalizedString(@"raceLatin", nil);
        }
        if([[raceDict valueForKey:@"raceArabProfile"] boolValue] == YES){
            race = NSLocalizedString(@"raceArab", nil);
        }
        if([[raceDict valueForKey:@"racePolynesianProfile"] boolValue] == YES){
            race = NSLocalizedString(@"racePolynesian", nil);
        }
        if([[raceDict valueForKey:@"raceMixProfile"] boolValue] == YES){
            race = NSLocalizedString(@"raceMix", nil);
        }
        if([[raceDict valueForKey:@"raceEtcProfile"] boolValue] == YES){
            race = NSLocalizedString(@"raceEtc", nil);
        }
        self.lbl_race.text = race;
    }
    
    if([account getCountryProfile] != nil){
        [self didChangeCountryValue];
    }
    
    if([unit getUnit] == 0){
        self.seg_unit.selectedSegmentIndex = 0;
    }else{
        self.seg_unit.selectedSegmentIndex = 1;
    }
    [self didChangeUnitValue];
    //[self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        //if(isSettingOkFlag == YES){
            //dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            //dispatch_async(q_global, ^{
                // Send web server my profile
            //});
        //}
        //[self.tableView reloadData];
    }
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 6;
            break;
        case 4:
            return 23;
            break;
        default:
            return 2;
            break;
    }
    //return 27;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell = cell_email;
                    break;
                case 1:
                    cell = cell_pass;
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell = cell_lastname;
                    break;
                //case 1:
                //    cell = cell_firstname;
                //    break;
                default:
                    break;
            }
            break;
        case 2:
            cell = cell_unit;
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                    cell = cell_1;
                    break;
                case 1:
                    cell = cell_2;
                    break;
                case 2:
                    cell = cell_3;
                    break;
                case 3:
                    cell = cell_4;
                    break;
                case 4:
                    cell = cell_5;
                    break;
                case 5:
                    cell = cell_6;
                    break;

                default:
                    break;
            }
            break;
        case 4:
            switch (indexPath.row) {
                case 0:
                    cell = cell_7;
                    break;
                case 1:
                    cell = cell_8;
                    break;
                case 2:
                    cell = cell_9;
                    break;
                case 3:
                    cell = cell_10;
                    break;
                case 4:
                    cell = cell_11;
                    break;
                case 5:
                    cell = cell_12;
                    break;
                case 6:
                    cell = cell_13;
                    break;
                case 7:
                    cell = cell_14;
                    break;
                case 8:
                    cell = cell_15;
                    break;
                case 9:
                    cell = cell_16;
                    break;
                case 10:
                    cell = cell_17;
                    break;
                case 11:
                    cell = cell_18;
                    break;
                case 12:
                    cell = cell_19;
                    break;
                case 13:
                    cell = cell_20;
                    break;
                case 14:
                    cell = cell_21;
                    break;
                case 15:
                    cell = cell_22;
                    break;
                case 16:
                    cell = cell_23;
                    break;
                case 17:
                    cell = cell_24;
                    break;
                case 18:
                    cell = cell_25;
                    break;
                case 19:
                    cell = cell_26;
                    break;
                case 20:
                    cell = cell_27;
                    break;
                case 21:
                    cell = cell_28;
                    break;
                case 22:
                    cell = cell_29;
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */

    NSString* identifier = @"";
    UIViewController* viewController;
    
    if(unit == nil){
        unit = [[MyUnit alloc] init];
    }
    
    switch (indexPath.section) {
        case 3:
            switch (indexPath.row) {
                case 1:
                    if([unit getUnit] == 0){
                        identifier = @"heightPickerViewController";
                    }else{
                        identifier = @"heightViewController";
                    }
                    viewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
                    [self.navigationController pushViewController:viewController animated:YES];
                    break;
                case 2:
                    if([unit getUnit] == 0){
                        identifier = @"lbsWeightViewController";
                    }else{
                        identifier = @"kgWeightViewController";
                    }
                    viewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
                    [self.navigationController pushViewController:viewController animated:YES];
                    break;
                default:
                    break;
            }
            break;
            
        default:
            break;
    }

}


// 通知を受けるhogeメソッド
//-(void)toNotifiTheChangeProfile{
    // ここに何かの処理を記述する
    //NSLog(@"toNotifiTheChangeProfile");
//}


- (void)didChangeUnitValue
{
    if([unit getUnit]==0){
        //cm, kg -> feet,inch lb
        int height = [[account getHeightProfile] intValue];
        int weight = [[account getWeightProfile] intValue];
        
        NSString* feet = [NSString stringWithFormat:@"%.1f", (height / 30.48)];
        
        NSString* inch = [feet componentsSeparatedByString:@"."][1];
        feet = [feet componentsSeparatedByString:@"."][0];
        
        self.lbl_height.text = [NSString stringWithFormat:@"%@'%@\"", feet, inch];
        [self.lbl_height reloadInputViews];
        
        weight = weight / 0.45359237;
        self.lbl_weight.text = [NSString stringWithFormat:@"%d lbs", weight];
        [self.lbl_weight reloadInputViews];
    }else{
        int height = [[account getHeightProfile] intValue];
        int weight = [[account getWeightProfile] intValue];
        self.lbl_height.text = [NSString stringWithFormat:@"%d cm", height];
        self.lbl_weight.text = [NSString stringWithFormat:@"%d kg", weight];
        [self.lbl_height reloadInputViews];
        [self.lbl_weight reloadInputViews];
    }
}

-(void)didChangeCountryValue
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = languages[0];
    
    NSString* plistFile;
    if([currentLanguage isEqualToString:@"ja"]){
        plistFile = [[NSBundle mainBundle] pathForResource:@"CountryData-ja" ofType:@"plist"];
    }else{
        // if([currentLanguage isEqualToString:@"en"]){
        plistFile = [[NSBundle mainBundle] pathForResource:@"CountryData-en" ofType:@"plist"];
    }
    NSArray* countryArray = [NSArray arrayWithContentsOfFile:plistFile];
    
    
    NSString* countryValue = [account getCountryProfile];
    if(countryValue != nil &&  ![countryValue isEqualToString:@""]){
        @try{
            NSDictionary* countryValueDict =  countryArray[[[countryArray valueForKeyPath:@"id"] indexOfObject:countryValue]];
            self.lbl_country.text = [countryValueDict valueForKey:@"name"];
        }@catch(NSException* e){
        }
    }

}

- (IBAction)seg_unitValueChanged:(id)sender {
    UISegmentedControl* seg = (UISegmentedControl *)sender;
    [unit setUnit:seg.selectedSegmentIndex];
    [self didChangeUnitValue];
    
}

- (IBAction)btn_donePush:(id)sender {
    //if([self checkRequireParameter] == YES){
        [self dismissViewControllerAnimated:YES completion:nil];
    //}else{
    //    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please set the required items." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //    [alert show];
    //}
}



-(BOOL)checkRequireParameter
{
    BOOL retBool = YES;
    if(account == nil){
        account = [[MyProfiles alloc] init];
    }
    
    if([account getEmailProfile] == nil || [[account getEmailProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getPasswordProfile] == nil || [[account getPasswordProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getNickNameProfile] == nil || [[account getNickNameProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getAgeProfile] == nil || [[account getAgeProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getHeightProfile] == nil || [[account getHeightProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getWeightProfile] == nil || [[account getWeightProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getSexuallityProfile] == nil){
        retBool = NO;
    }else{
        NSDictionary* sexuallityDict = [account getSexuallityProfile];
        if([[sexuallityDict valueForKey:@"sexGayProfile"] boolValue] == NO &&
           [[sexuallityDict valueForKey:@"sexBisexProfile"] boolValue] == NO &&
           [[sexuallityDict valueForKey:@"sexStraightProfile"] boolValue] == NO)
        {
            retBool = NO;
        }
    }
    
    if([account getRaceProfile] == nil){
        retBool = NO;
    }else{
        NSDictionary* raceDict = [account getRaceProfile];
        if([[raceDict valueForKey:@"raceAsianProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceWhiteProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceBlackProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceLatinProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceArabProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"racePolynesianProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceMixProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceEtcProfile"] boolValue] == NO)
        {
            retBool = NO;
        }
    }
    
    if([account getCountryProfile] == nil || [[account getCountryProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    return retBool;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //emailProfileSegue
    /*
    if([segue.identifier isEqualToString:@"emailProfileSegue"]){
        if(self.myId != nil){
            NSLog(@"Segue Email profile");
            EmailViewController* emailView = [segue destinationViewController];
            emailView.email = self.myId;
        }
    }
    */
}

@end
