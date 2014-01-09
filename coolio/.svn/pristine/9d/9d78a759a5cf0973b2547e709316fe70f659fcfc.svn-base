//
//  VisibilityViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "VisibilityViewController.h"

@interface VisibilityViewController ()

@end

@implementation VisibilityViewController

#define SECTION_MIN 1
#define SECTION_MAX 4

#define AGE_MIN 18
#define AGE_MAX 99

@synthesize lbl_ageUpper;
@synthesize lbl_ageLower;
@synthesize sw_publish;

@synthesize cell_ageUpper;
@synthesize cell_ageLower;

/*
@synthesize cell_lookingBPartner;
@synthesize cell_lookingCircle;
@synthesize cell_lookingEPal;
@synthesize cell_lookingFriend;
@synthesize cell_lookingFriendWithBenefits;
@synthesize cell_lookingLover;
@synthesize cell_lookingMPal;
@synthesize cell_lookingRoommate;
@synthesize cell_lookingTPal;
*/

@synthesize cell_publish;
@synthesize cell_raceArab;
@synthesize cell_raceAsian;
@synthesize cell_raceBlack;
@synthesize cell_raceEtc;
@synthesize cell_raceLatin;
@synthesize cell_raceMix;
@synthesize cell_racePolynesian;
@synthesize cell_raceWhite;
@synthesize cell_sexBisex;
@synthesize cell_sexGay;
@synthesize cell_sexStraight;

/*
@synthesize cell_styleBear;
@synthesize cell_styleBeefy;
@synthesize cell_styleBodybuilder;
@synthesize cell_styleChubby;
@synthesize cell_styleEtc;
@synthesize cell_styleGeek;
@synthesize cell_styleHardcoreGay;
@synthesize cell_styleHipHop;
@synthesize cell_styleHunk;
@synthesize cell_stylePotato;
@synthesize cell_stylePunk;
@synthesize cell_styleShemale;
@synthesize cell_styleSlimSkinny;
@synthesize cell_styleThug;
@synthesize cell_styleTwink;
@synthesize cell_styleWellMuscled;
@synthesize cell_styleWhiteCollar;
@synthesize cell_styleFeminine;
@synthesize cell_styleSurfer;
*/

@synthesize sw_sexGay;
@synthesize sw_sexBisex;
@synthesize sw_sexStraight;

@synthesize sw_raceAsian;
@synthesize sw_raceWhite;
@synthesize sw_raceBlack;
@synthesize sw_raceLatin;
@synthesize sw_raceArab;
@synthesize sw_racePolynesian;
@synthesize sw_raceMix;
@synthesize sw_raceEtc;

/*
@synthesize sw_styleTwink;
@synthesize sw_styleHunk;
@synthesize sw_styleSurfer;
@synthesize sw_styleHipHop;
@synthesize sw_styleThug;
@synthesize sw_stylePunk;
@synthesize sw_styleWhiteCollar;
@synthesize sw_styleHardcoreGay;
@synthesize sw_stylePotato;
@synthesize sw_styleBear;
@synthesize sw_styleGeek;
@synthesize sw_styleChubby;
@synthesize sw_styleBeefy;
@synthesize sw_styleBodybuilder;
@synthesize sw_styleWellMuscled;
@synthesize sw_styleSlimSkinny;
@synthesize sw_styleFeminine;
@synthesize sw_styleShemale;
@synthesize sw_styleEtc;

@synthesize sw_lookingLover;
@synthesize sw_lookingFriend;
@synthesize sw_lookingEPal;
@synthesize sw_lookingMPal;
@synthesize sw_lookingTPal;
@synthesize sw_lookingCircle;
@synthesize sw_lookingRoommate;
@synthesize sw_lookingBPartner;
@synthesize sw_lookingFriendWithBenefits;
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openPasscodeView];
    account = [[MyPublish alloc] init];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        //NSLog(@"Did load");;
        
        int ageLower = [account getAgeLower];
        int ageUpper = [account getAgeUpper];
        
        if(ageLower >= AGE_MIN && ageLower <= AGE_MAX){
            ;
        }else{
            [account setAgeLower:18];
        }
        if(ageUpper >= AGE_MIN && ageUpper <= AGE_MAX){
            ;
        }else{
            [account setAgeUpper:99];
        }
        
        
        //if(([account getAgeLower] > [account getAgeUpper]) || ([account getAgeUpper] < [account getAgeLower])){
        //    [account setAgeLower:18];
        //    [account setAgeUpper:99];
        //}
        
        self.raceDict = [(NSMutableDictionary *)[account getRace] mutableCopy];
        self.sexualityDict = [(NSMutableDictionary *)[account getSexuallity] mutableCopy];
        //self.styleDict = [(NSMutableDictionary *)[account getStyle] mutableCopy];
        //self.lookingDict = [(NSMutableDictionary *)[account getLookingFor] mutableCopy];
        
        
        if(self.sexualityDict == nil){
            self.sexualityDict = [NSMutableDictionary dictionary];
            [self.sexualityDict setValue:NO forKey:@"sexGayPublish"];
            [self.sexualityDict setValue:NO forKey:@"sexBisexPublish"];
            [self.sexualityDict setValue:NO forKey:@"sexStraightPublish"];
            [account setSexualllity:self.sexualityDict];
        }
        if(self.raceDict == nil){
            self.raceDict = [NSMutableDictionary dictionary];
            [self.raceDict setValue:NO forKey:@"raceAsianPublish"];
            [self.raceDict setValue:NO forKey:@"raceWhitePublish"];
            [self.raceDict setValue:NO forKey:@"raceBlackPublish"];
            [self.raceDict setValue:NO forKey:@"raceLatinPublish"];
            [self.raceDict setValue:NO forKey:@"raceArabPublish"];
            [self.raceDict setValue:NO forKey:@"racePolynesianPublish"];
            [self.raceDict setValue:NO forKey:@"raceMixPublish"];
            [self.raceDict setValue:NO forKey:@"raceEtcPublish"];
            [account setRace:self.raceDict];
        }
        /*
        if(self.styleDict == nil){
            self.styleDict = [NSMutableDictionary dictionary];
            [self.styleDict setValue:NO forKey:@"styleTwinkPublish"];
            [self.styleDict setValue:NO forKey:@"styleHunkPublish"];
            [self.styleDict setValue:NO forKey:@"styleSurferPublish"];
            [self.styleDict setValue:NO forKey:@"styleHipHopPublish"];
            [self.styleDict setValue:NO forKey:@"styleThugPublish"];
            [self.styleDict setValue:NO forKey:@"stylePunkPublish"];
            [self.styleDict setValue:NO forKey:@"styleWhiteCollarPublish"];
            [self.styleDict setValue:NO forKey:@"styleHardcoreGayPublish"];
            [self.styleDict setValue:NO forKey:@"stylePotatoPublish"];
            [self.styleDict setValue:NO forKey:@"styleBearPublish"];
            [self.styleDict setValue:NO forKey:@"styleGeekPublish"];
            [self.styleDict setValue:NO forKey:@"styleChubbyPublish"];
            [self.styleDict setValue:NO forKey:@"styleBeefyPublish"];
            [self.styleDict setValue:NO forKey:@"styleBodybuilderPublish"];
            [self.styleDict setValue:NO forKey:@"styleWellMuscledPublish"];
            [self.styleDict setValue:NO forKey:@"styleSlimSkinnyPublish"];
            [self.styleDict setValue:NO forKey:@"styleFemininePublish"];
            [self.styleDict setValue:NO forKey:@"styleShemalePublish"];
            [self.styleDict setValue:NO forKey:@"styleEtcPublish"];
        }
        if(self.lookingDict == nil){
            self.lookingDict = [NSMutableDictionary dictionary];
            [self.lookingDict setValue:NO forKey:@"lookingLoverPublish"];
            [self.lookingDict setValue:NO forKey:@"lookingFriendPublish"];
            [self.lookingDict setValue:NO forKey:@"lookingEPalPublish"];
            [self.lookingDict setValue:NO forKey:@"lookingMPalPublish"];
            [self.lookingDict setValue:NO forKey:@"lookingTPalPublish"];
            [self.lookingDict setValue:NO forKey:@"lookingCirclePublish"];
            [self.lookingDict setValue:NO forKey:@"lookingRoommatePublish"];
            [self.lookingDict setValue:NO forKey:@"lookingBPartnerPublish"];
            [self.lookingDict setValue:NO forKey:@"lookingFriendWithBenefitsPublish"];
        }
        */
        dispatch_async(q_main, ^{
            [self.lbl_ageUpper setText:[NSString stringWithFormat:@"%d", [account getAgeUpper]]];
            [self.lbl_ageLower setText:[NSString stringWithFormat:@"%d", [account getAgeLower]]];
            
            sw_sexGay.on = [[self.sexualityDict valueForKey:@"sexGayPublish"] boolValue];
            sw_sexBisex.on = [[self.sexualityDict valueForKey:@"sexBisexPublish"] boolValue];
            sw_sexStraight.on = [[self.sexualityDict valueForKey:@"sexStraightPublish"] boolValue];
            
            sw_raceAsian.on = [[self.raceDict valueForKey:@"raceAsianPublish"] boolValue];
            sw_raceWhite.on = [[self.raceDict valueForKey:@"raceWhitePublish"] boolValue];
            sw_raceBlack.on = [[self.raceDict valueForKey:@"raceBlackPublish"] boolValue];
            sw_raceLatin.on = [[self.raceDict valueForKey:@"raceLatinPublish"] boolValue];
            sw_raceArab.on = [[self.raceDict valueForKey:@"raceArabPublish"] boolValue];
            sw_racePolynesian.on = [[self.raceDict valueForKey:@"racePolynesianPublish"] boolValue];
            sw_raceMix.on = [[self.raceDict valueForKey:@"raceMixPublish"] boolValue];
            sw_raceEtc.on = [[self.raceDict valueForKey:@"raceEtcPublish"] boolValue];
            
            /*
            sw_styleTwink.on = [[self.styleDict valueForKey:@"styleTwinkPublish"] boolValue];
            sw_styleHunk.on = [[self.styleDict valueForKey:@"styleHunkPublish"] boolValue];
            sw_styleSurfer.on = [[self.styleDict valueForKey:@"styleSurferPublish"] boolValue];
            sw_styleHipHop.on = [[self.styleDict valueForKey:@"styleHipHopPublish"] boolValue];
            sw_styleThug.on = [[self.styleDict valueForKey:@"styleThugPublish"] boolValue];
            sw_stylePunk.on = [[self.styleDict valueForKey:@"stylePunkPublish"] boolValue];
            sw_styleWhiteCollar.on = [[self.styleDict valueForKey:@"styleWhiteCollarPublish"] boolValue];
            sw_styleHardcoreGay.on = [[self.styleDict valueForKey:@"styleHardcoreGayPublish"] boolValue];
            sw_stylePotato.on = [[self.styleDict valueForKey:@"stylePotatoPublish"] boolValue];
            sw_styleBear.on = [[self.styleDict valueForKey:@"styleBearPublish"] boolValue];
            sw_styleGeek.on = [[self.styleDict valueForKey:@"styleGeekPublish"] boolValue];
            sw_styleChubby.on = [[self.styleDict valueForKey:@"styleChubbyPublish"] boolValue];
            sw_styleBeefy.on = [[self.styleDict valueForKey:@"styleBeefyPublish"] boolValue];
            sw_styleBodybuilder.on = [[self.styleDict valueForKey:@"styleBodybuilderPublish"] boolValue];
            sw_styleWellMuscled.on = [[self.styleDict valueForKey:@"styleWellMuscledPublish"] boolValue];
            sw_styleSlimSkinny.on = [[self.styleDict valueForKey:@"styleSlimSkinnyPublish"] boolValue];
            sw_styleFeminine.on = [[self.styleDict valueForKey:@"styleFemininePublish"] boolValue];
            sw_styleShemale.on = [[self.styleDict valueForKey:@"styleShemalePublish"] boolValue];
            sw_styleEtc.on = [[self.styleDict valueForKey:@"styleEtcPublish"] boolValue];
            
            sw_lookingLover.on = [[self.lookingDict valueForKey:@"lookingLoverPublish"] boolValue];
            sw_lookingFriend.on = [[self.lookingDict valueForKey:@"lookingFriendPublish"] boolValue];
            sw_lookingEPal.on = [[self.lookingDict valueForKey:@"lookingEPalPublish"] boolValue];
            sw_lookingMPal.on = [[self.lookingDict valueForKey:@"lookingMPalPublish"] boolValue];
            sw_lookingTPal.on = [[self.lookingDict valueForKey:@"lookingTPalPublish"] boolValue];
            sw_lookingCircle.on = [[self.lookingDict valueForKey:@"lookingCirclePublish"] boolValue];
            sw_lookingRoommate.on = [[self.lookingDict valueForKey:@"lookingRoommatePublish"] boolValue];
            sw_lookingBPartner.on = [[self.lookingDict valueForKey:@"lookingBPartnerPublish"] boolValue];
            sw_lookingFriendWithBenefits.on = [[self.lookingDict valueForKey:@"lookingFriendWithBenefitsPublish"] boolValue];
            */
            
            self.sw_publish.on = [account getEnabled];
            
            // NSLog(@"%@", [account getEnabled]? @"YES" : @"NO");
            
            if(self.sw_publish.on == NO){
                sectionsCount = SECTION_MIN;
            }else{
                sectionsCount = SECTION_MAX;
            }
            [self.tableView reloadData];

            //[self.tableView reloadData];
        });
    });
    //[self.tableView reloadData];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        
        //NSLog(@"popView");
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [account setRace:self.raceDict];
            [account setSexualllity:self.sexualityDict];
            //[account setStyle:self.styleDict];
            //[account setLookingFor:self.lookingDict];
        });
    }

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
    //return 6;
    return sectionsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    int rows = 0;
    switch (section) {
        case 0:
            rows = 1;
            break;
        case 1:
            rows = 2;
            break;
        case 2:
            rows = 3;
            break;
        case 3:
            rows = 8;
            break;
        /*
        case 4:
            rows = 19;
            break;
        case 5:
            rows = 9;
            break;
        */
            
        default:
            break;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            cell = cell_publish;
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell = cell_ageUpper;
                    break;
                case 1:
                    cell = cell_ageLower;
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    cell = cell_sexGay;
                    break;
                case 1:
                    cell = cell_sexBisex;
                    break;
                case 2:
                    cell = cell_sexStraight;
                    break;
                default:
                    break;
            }
            break;
        case 3:
            //row : 8
            switch (indexPath.row) {
                case 0:
                    cell = cell_raceAsian;
                    break;
                case 1:
                    cell = cell_raceWhite;
                    break;
                case 2:
                    cell = cell_raceBlack;
                    break;
                case 3:
                    cell = cell_raceLatin;
                    break;
                case 4:
                    cell = cell_raceArab;
                    break;
                case 5:
                    cell = cell_racePolynesian;
                    break;
                case 6:
                    cell = cell_raceMix;
                    break;
                case 7:
                    cell = cell_raceEtc;
                    break;
                default:
                    break;
            }
            break;
        /*
        case 4:
            //row : 19
            switch (indexPath.row) {
                case 0: cell = cell_styleTwink; break;
                case 1: cell = cell_styleHunk; break;
                case 2: cell = cell_styleSurfer; break;
                case 3: cell = cell_styleHipHop; break;
                case 4: cell = cell_styleThug; break;
                case 5: cell = cell_stylePunk; break;
                case 6: cell = cell_styleWhiteCollar; break;
                case 7: cell = cell_styleHardcoreGay; break;
                case 8: cell = cell_stylePotato; break;
                case 9: cell = cell_styleBear; break;
                case 10: cell = cell_styleGeek; break;
                case 11: cell = cell_styleChubby; break;
                case 12: cell = cell_styleBeefy; break;
                case 13: cell = cell_styleBodybuilder; break;
                case 14: cell = cell_styleWellMuscled; break;
                case 15: cell = cell_styleSlimSkinny; break;
                case 16: cell = cell_styleFeminine; break;
                case 17: cell = cell_styleShemale; break;
                case 18: cell = cell_styleEtc; break;
                default:
                    break;
            }
            break;
        case 5:
            // row : 9
            switch (indexPath.row) {
                case 0: cell = cell_lookingLover; break;
                case 1: cell = cell_lookingFriend; break;
                case 2: cell = cell_lookingEPal; break;
                case 3: cell = cell_lookingMPal; break;
                case 4: cell = cell_lookingTPal; break;
                case 5: cell = cell_lookingCircle; break;
                case 6: cell = cell_lookingRoommate; break;
                case 7: cell = cell_lookingBPartner; break;
                case 8: cell = cell_lookingFriendWithBenefits; break;
                default:
                    break;
            }
            break;
        */
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
    /*
    NSNotification* n;
    NSString* idenfifier;
    
    switch (indexPath.section) {
        case 1:
            switch (indexPath.row) {
                case 0:
                    idenfifier = @"publishUpper";
                    n = [NSNotification notificationWithName:@"ToNotifyTheVisibility" object:idenfifier userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:n];
                    break;
                case 1:
                    idenfifier = @"publishLower";
                    n = [NSNotification notificationWithName:@"ToNotifyTheVisibility" object:idenfifier userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:n];
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    */
}

- (IBAction)sw_publishValueChanged:(id)sender {
    UISwitch* sw = (UISwitch*)sender;
    
    if(sw.on == NO){
        sectionsCount = SECTION_MIN;
    }else{
        sectionsCount = SECTION_MAX;
    }
    [self.tableView reloadData];
    [account setEnabled:sw.on];
}

- (IBAction)sw_sexGay_valueChanged:(id)sender {
    //UISwitch* sw =(UISwitch *)sender;
    [self.sexualityDict setValue:@(((UISwitch *)sender).on) forKey:@"sexGayPublish"];
    [account setSexualllity:self.sexualityDict];
}

- (IBAction)sw_sexBisexual_valueChanged:(id)sender {
    [self.sexualityDict setValue:@(((UISwitch *)sender).on) forKey:@"sexBisexPublish"];
    [account setSexualllity:self.sexualityDict];
}

- (IBAction)sw_sexStraight_valueChanged:(id)sender {
    [self.sexualityDict setValue:@(((UISwitch *)sender).on) forKey:@"sexStraightPublish"];
    [account setSexualllity:self.sexualityDict];
}

- (IBAction)sw_raceAsian_valueChanged:(id)sender {
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceAsianPublish"];
    [account setRace:self.raceDict];
}

- (IBAction)sw_raceWhite_valueChanged:(id)sender {
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceWhitePublish"];
    [account setRace:self.raceDict];
}

- (IBAction)sw_raceBlack_valueChanged:(id)sender {
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceBlackPublish"];
    [account setRace:self.raceDict];
}

- (IBAction)sw_raceLatin_valueChanged:(id)sender {
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceLatinPublish"];
    [account setRace:self.raceDict];
}

- (IBAction)sw_raceArab_valueChanged:(id)sender {
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceArabPublish"];
    [account setRace:self.raceDict];
}

- (IBAction)sw_racePolynesian_valueChanged:(id)sender {
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"racePolynesianPublish"];
    [account setRace:self.raceDict];
}

- (IBAction)sw_raceMix_valueChanged:(id)sender {
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceMixPublish"];
    [account setRace:self.raceDict];
}

- (IBAction)sw_raceEtc_valueChanged:(id)sender {
    [self.raceDict setValue:@(((UISwitch *)sender).on) forKey:@"raceEtcPublish"];
    [account setRace:self.raceDict];
}

/*
- (IBAction)sw_styleTwink_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleTwinkPublish"];
}

- (IBAction)sw_styleHunk_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleHunkPublish"];
}

- (IBAction)sw_styleSurfer_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleSurferPublish"];
}

- (IBAction)sw_styleHipHop_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleHipHopPublish"];
}

- (IBAction)sw_styleThug_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleThugPublish"];
}

- (IBAction)sw_stylePunk_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"stylePunkPublish"];
}

- (IBAction)sw_styleWhiteCollar_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleWhiteCollarPublish"];
}

- (IBAction)sw_styleHardcoreGay_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleHardcoreGayPublish"];
}

- (IBAction)sw_stylePotato_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"stylePotatoPublish"];
}

- (IBAction)sw_styleBear_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleBearPublish"];
}

- (IBAction)sw_styleGeek_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleGeekPublish"];
}

- (IBAction)sw_styleChubby_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleChubbyPublish"];
}

- (IBAction)sw_styleBeefy_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleBeefyPublish"];
}

- (IBAction)sw_styleBodybuilder_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleBodybuilderPublish"];
}

- (IBAction)sw_styleSlimWellMuscled_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleWellMuscledPublish"];
}

- (IBAction)sw_styleSlimSkinny_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleSlimSkinnyPublish"];
}

- (IBAction)sw_styleFeminine_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleFemininePublish"];
}

- (IBAction)sw_styleShemale_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleShemalePublish"];
}

- (IBAction)sw_styleEtc_valueChanged:(id)sender {
    [self.styleDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"styleEtcPublish"];
}

- (IBAction)sw_lookingLover_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingLoverPublish"];
}

- (IBAction)sw_lookingFriend_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingFriendPublish"];
}

- (IBAction)sw_lookingEPal_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingEPalPublish"];
}

- (IBAction)sw_lookingMPal_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingMPalPublish"];
}

- (IBAction)sw_lookingTelPal_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingTPalPublish"];
}

- (IBAction)sw_lookingCircle_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingCirclePublish"];
}

- (IBAction)sw_lookingRoommate_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingRoommatePublish"];
}

- (IBAction)sw_lookingBusinessPartner_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingBPartnerPublish"];
}

- (IBAction)sw_lookingFriendWithBenefits_valueChanged:(id)sender {
    [self.lookingDict setValue:[NSNumber numberWithBool:((UISwitch *)sender).on] forKey:@"lookingFriendWithBenefitsPublish"];
}
*/

- (IBAction)btn_donePush:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AgePublishViewController* ageViewController = segue.destinationViewController;;
    
    if([segue.identifier isEqualToString:@"publishUpper"]){
        ageViewController.notifiValue = @"upper";
    }else if([segue.identifier isEqualToString:@"publishLower"]){
        ageViewController.notifiValue = @"lower";
    }
    /*
     idenfifier = @"publishUpper";
     n = [NSNotification notificationWithName:@"ToNotifyTheVisibility" object:idenfifier userInfo:nil];
     [[NSNotificationCenter defaultCenter] postNotification:n];
     break;
     case 1:
     idenfifier = @"publishLower";
     */
}



@end
