//
//  AppSettingsRootViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "AppSettingsRootViewController.h"

@interface AppSettingsRootViewController ()

@end

@implementation AppSettingsRootViewController
@synthesize tblView;
@synthesize sectionItems;
//@synthesize activityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tblView.delegate = self;
    self.tblView.dataSource = self;

    NSString* sectionProfile = NSLocalizedString(@"SETTINGS_CELL_PROFILE", nil);
    NSString* sectionFootPrint = NSLocalizedString(@"SETTINGS_CELL_FOOTPRINT", nil);
    NSString* sectionBlock = NSLocalizedString(@"SETTINGS_CELL_BLOCKS", nil);
    NSString* sectionNotice = NSLocalizedString(@"SETTINGS_CELL_NOTIFICATIONS", nil);
    
    
    self.sectionItems = @[sectionProfile, sectionFootPrint, sectionBlock, sectionNotice];

    footPrint = [[MyFootPrintSettings alloc] init];
    
    [self openMenue];
    [self openPasscodeView];
    
    //ToNotifyTheSaveImageFile_05
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheSave_ProfileImageFile:) name:@"ToNotifyTheSave_ProfileImageFile" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    self.slidingViewController.underRightViewController = nil;
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tblView reloadData];
    //self.activityIndicator.hidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
    // 1. profile image / profile / visibility
    // 2. foot pring
    // 3. block
    // 4. notifications
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    // 1. profile image / profile / visibility
    // 2. foot print
    // 3. block
    // 4. units
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return (self.sectionItems)[section];
            break;
        case 1:
            return (self.sectionItems)[section];
            break;
        case 2:
            return (self.sectionItems)[section];
            break;
        case 3:
            return (self.sectionItems)[section];
            break;
        default:
            return (self.sectionItems)[0];
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PICTURE", nil);// @"Picture";
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PROFILE", nil);// @"Profile";
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PRIVACY", nil);// @"Privacy Settings";
                    break;
                default:
                    cell.textLabel.text = @"";
                    break;
            }
            break;
        case 1:
            cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_FOOTPRINT", nil);//@"FootPrint";
            
            if([footPrint getFootPrint] == YES){
                cell.detailTextLabel.text = @"ON";
            }else{
                cell.detailTextLabel.text = @"OFF";
            }
            break;
        case 2:
            cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_BLOCKS", nil);//@"Blocks";
            break;
        case 3:
            cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_NOTIFICATIONS", nil);//@"Notifications";
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
    
    MyProfileViewController* myProfileViewController;
    ProfilePictureViewController* pictureViewController;
    VisibilityViewController* visibilityViewController;
    FootprintNotificationViewController* footPrintViewController;
    BlocksViewController* blocksViewController;
    NotificationSettingsViewController* notificationsViewController;
    //UnitViewController* unitViewController;
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    pictureViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"profilePictureViewController"];
                    [self.navigationController presentViewController:pictureViewController animated:YES completion:nil];
                    //[self.navigationController pushViewController:pictureViewController animated:YES];
                    break;
                case 1:
                    myProfileViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"myProfileViewController"];
                    [self.navigationController presentViewController:myProfileViewController animated:YES completion:nil];
                    //[self.navigationController pushViewController:myProfileViewController animated:YES];
                    break;
                case 2:
                    visibilityViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"visibilityViewController"];
                    [self.navigationController presentViewController:visibilityViewController animated:YES completion:nil];
                    //[self.navigationController pushViewController:visibilityViewController animated:YES];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            footPrintViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"footPrintViewController"];
            [self.navigationController presentViewController:footPrintViewController animated:YES completion:nil];
            //[self.navigationController pushViewController:footPrintViewController animated:YES];
            break;
        case 2:
            blocksViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"blocksViewController"];
            [self.navigationController presentViewController:blocksViewController animated:YES completion:nil];
            //[self.navigationController pushViewController:blocksViewController animated:YES];
            break;
        case 3:
            notificationsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"notificationsViewController"];
            [self.navigationController presentViewController:notificationsViewController animated:YES completion:nil];
            //[self.navigationController pushViewController:notificationsViewController animated:YES];
            break;
        default:
            break;
    }
}

-(BOOL)checkRequireParameter
{
    BOOL retBool = YES;
    MyProfiles* account = [[MyProfiles alloc] init];
    
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

- (IBAction)btn_savePush:(id)sender {
    if([self checkRequireParameter] == YES){
        if([AppDelegate NetworkCheckConnect] == NO){
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"NETWORK_ERROR", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            return;
         }
        
        [SVProgressHUD show];

        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            CoolioWebService* coolio = [[CoolioWebService alloc] init];
            
            [coolio sendProfile];
            [coolio sendDeviceId];
            
            [coolio sendProfileImage1];
            [coolio sendProfileImage2];
            [coolio sendProfileImage3];
            [coolio sendProfileImage4];
            [coolio sendProfileImage5];
        });
        //[self.activityIndicator stopAnimating];
        //self.activityIndicator.hidden = YES;
    }else{
        //@"Please set the required items."
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"ALERT_APPSETTING_REQUIRE", nil)  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)toNotifyTheSave_ProfileImageFile:(NSNotification *)notification
{
    [SVProgressHUD dismiss];
    //@"Saved"
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"ALERT_SAVED", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)revealMenu:(id)sender
{
    NSString* myId = [[[MyProfiles alloc] init] getEmailProfile];
    CoolioWebService* coolio = [[CoolioWebService alloc] init];
    [coolio getMyUnreadCount:myId];
    [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
