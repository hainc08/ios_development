//
//  NewAccountSettingsViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/05/16.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NewAccountSettingsViewController.h"

@interface NewAccountSettingsViewController ()

@end

@implementation NewAccountSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //self.sectionItems = [NSArray arrayWithObjects:@"Meet", @"Chat", @"Notification", @" ", nil];
    footPrint = [[MyFootPrintSettings alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifiTheChangeProfile:) name:@"toNotifiTheChangeProfile" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheNewAccountCheck:) name:@"ToNotifyTheNewAccountCheck" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheSaveProfile:) name:@"ToNotifyTheSave_Profile" object:nil];
    
    if([AppDelegate NetworkCheckConnect] == NO){
        [AppDelegate showDisconnectAlert];
    }
    [self openPasscodeView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    // 3. units
    
    return 2;
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
        //case 2:
        //    return 1;
        //    break;
        default:
            break;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
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
    /*
     cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PICTURE", nil);// @"Picture";
     cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PROFILE", nil);// @"Profile";
     cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PRIVACY", nil);// @"Privacy Settings";
     cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_FOOTPRINT", nil);//@"FootPrint";
     cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_BLOCKS", nil);//@"Blocks";
     cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_NOTIFICATIONS", nil);//@"Notifications";
     */
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PICTURE", nil);
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PROFILE", nil);
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_PRIVACY", nil);
                    break;
                default:
                    cell.textLabel.text = @"";
                    break;
            }
            break;
        case 1:
            cell.textLabel.text = NSLocalizedString(@"SETTINGS_CELL_FOOTPRINT", nil);
            
            if([footPrint getFootPrint] == YES){
                cell.detailTextLabel.text = @"ON";
            }else{
                cell.detailTextLabel.text = @"OFF";
            }
            break;
        //case 2:
        //    cell.textLabel.text = @"Units";
        //
        //    if([unit getUnit] == 0){
        //        cell.detailTextLabel.text = @"mi / lb";
        //    }else{
        //        cell.detailTextLabel.text = @"km / kg";
        //    }
        //
        //    break;
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
    //UnitViewController* unitViewController;
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    pictureViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"profilePictureViewController"];
                    [self presentViewController:pictureViewController animated:YES completion:nil];
                    break;
                case 1:
                    myProfileViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"myProfileViewController"];
                    [self presentViewController:myProfileViewController animated:YES completion:nil];
                    break;
                case 2:
                    visibilityViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"visibilityViewController"];
                    [self presentViewController:visibilityViewController animated:YES completion:nil];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            footPrintViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"footPrintViewController"];
            [self presentViewController:footPrintViewController animated:YES completion:nil];
            break;
        //case 2:
        //    unitViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"unitViewController"];
        //    [self.navigationController pushViewController:unitViewController animated:YES];
        //    break;
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
    if([AppDelegate NetworkCheckConnect] == NO){
        [AppDelegate showDisconnectAlert];
    }else{
        if([self checkRequireParameter] == YES){
            CoolioWebService* coolio = [[CoolioWebService alloc] init];
            //coolio = [[CoolioWebService alloc] init];
            [coolio doNewAccountCheck];
            [SVProgressHUD show];
        }else{
            //@"Please set the required items."
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"ALERT_APPSETTING_REQUIRE", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    isRegisterEmailGlobal = NO;
}

- (IBAction)btn_donePush:(id)sender {
    if([self checkRequireParameter] == NO){
        NSString* message = NSLocalizedString(@"ALERT_APPSETTING_REQUIRE", nil);
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    isRegisterEmailGlobal = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)toNotifiTheChangeProfile:(NSNotification *)notification
{
    //NSLog(@"");
}

-(void)toNotifyTheNewAccountCheck:(NSNotification *)notification
{
    NSString* notiString = [notification object];
    if([notiString isEqualToString:@"success"]){
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            CoolioWebService* coolio = [[CoolioWebService alloc] init];
            [coolio sendProfile];
        });
    }else{
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^{
            [SVProgressHUD dismiss];
            //@"E-mail address or Nickname has already been registered."
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_REGISTERED", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        });
    }
}

-(void)toNotifyTheSaveProfile:(NSNotification *)notification
{
    session = [[MySession alloc] init];
    [session doLogOut:NO];
    //UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"登録完了" message:@"ログイン画面からログインして下さい。" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //[alert show];
    //[self.navigationController popViewControllerAnimated:YES];

    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        CoolioWebService* coolio = [[CoolioWebService alloc] init];
        [coolio sendDeviceId];
        [coolio sendProfileImage1];
        [coolio sendProfileImage2];
        [coolio sendProfileImage3];
        [coolio sendProfileImage4];
        [coolio sendProfileImage5];
        
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^{
            [SVProgressHUD dismiss];
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    });
}

@end
