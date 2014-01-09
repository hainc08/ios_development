//
//  JobViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "JobViewController.h"

@interface JobViewController ()

@end

@implementation JobViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self openPasscodeView];
    
    lastSelectedIndexRow = -1;
    account = [[MyProfiles alloc] init];
    jobDict = [[account getJobProfile] mutableCopy];
    
    if(jobDict == nil){
        jobDict = [NSMutableDictionary dictionary];
        [jobDict setValue:NO forKey:@"jobSecretProfile"];
        [jobDict setValue:NO forKey:@"jobStudentProfile"];
        [jobDict setValue:NO forKey:@"jobBetweenJobsProfile"];
        [jobDict setValue:NO forKey:@"jobOfficeWorkProfile"];
        [jobDict setValue:NO forKey:@"jobServicesProfile"];
        [jobDict setValue:NO forKey:@"jobManufacturingProfile"];
        [jobDict setValue:NO forKey:@"jobComputerProfile"];
        [jobDict setValue:NO forKey:@"jobLanguageProfile"];
        [jobDict setValue:NO forKey:@"jobAssetsProfile"];
        [jobDict setValue:NO forKey:@"jobLawProfile"];
        [jobDict setValue:NO forKey:@"jobMediaProfile"];
        [jobDict setValue:NO forKey:@"jobPublishingProfile"];
        [jobDict setValue:NO forKey:@"jobDomesticProfile"];
        [jobDict setValue:NO forKey:@"jobMedicalProfessionProfile"];
        [jobDict setValue:NO forKey:@"jobHealthProfile"];
        [jobDict setValue:NO forKey:@"jobArchitectureProfile"];
        [jobDict setValue:NO forKey:@"jobCreativeProfessionProfile"];
        [jobDict setValue:NO forKey:@"jobCookingProfile"];
        [jobDict setValue:NO forKey:@"jobVehicleProfile"];
        [jobDict setValue:NO forKey:@"jobTravelProfile"];
        [jobDict setValue:NO forKey:@"jobBeautyProfile"];
        [jobDict setValue:NO forKey:@"jobEntertainmentProfile"];
        [jobDict setValue:NO forKey:@"jobReligiousProfessionProfile"];
        [jobDict setValue:NO forKey:@"jobCeremonialOccasionsProfile"];
        [jobDict setValue:NO forKey:@"jobNatureProfile"];
        [jobDict setValue:NO forKey:@"jobSportsProfile"];
        [jobDict setValue:NO forKey:@"jobSexIndustryProfile"];
    }
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [account setJobProfile:jobDict];
        });
        //NSLog(@"popView");
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 27;
}

/*
 Job
 Secret / Unknown
 Student
 Between Jobs
 Office Work
 Services
 Manufacturing
 Computer
 Language / Education
 Assets / Finance
 Law
 Media
 Publishing
 Domestic / International Contribution
 Medical Profession
 Health / Welfare
 Architecture / Interior Design
 Creative Profession / Art
 Cooking / Food Service
 Vehicle / Transportation
 Travel
 Beauty / Fashion
 Entertainment
 Religious Profession
 Ceremonial Occasions
 Nature / Animal
 Sports
 Sex Industry
 */
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // set title of section here
    NSString* titleHeaderLabelValue = @"";
    switch (section) {
        case 0:
            titleHeaderLabelValue = NSLocalizedString(@"Job_header_title", nil);
            //@"Job";
            break;
            
        default:
            break;
    }
    return titleHeaderLabelValue;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    //NSLog(@"Call heightForRowAtIndexPath");
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    float cellHeight = cell.frame.size.height;
    float textHeight = cell.textLabel.frame.size.height;
    
    //NSLog(@"%f", textHeight);
    //return cellHeight;
    return cellHeight + textHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    NSArray* identifier = @[@"1", @"2", @"3", @"4", @"5",
                           @"6", @"7", @"8", @"9", @"10",
                           @"11", @"12", @"13", @"14", @"15",
                           @"16", @"17", @"18", @"19", @"20",
                           @"21", @"22", @"23", @"24", @"25",
                           @"26", @"27"];
    NSString* CellIdentifier = identifier[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    //int value = [[account getJobProfile] intValue];
    //if(value == indexPath.row){ [cell setAccessoryType:UITableViewCellAccessoryCheckmark]; }
    
    BOOL flg = NO;
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:NSLocalizedString(@"jobSecret", nil)];
            flg = [[jobDict valueForKey:@"jobSecretProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"jobStudent", nil)];
            flg = [[jobDict valueForKey:@"jobStudentProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"jobBetweenJobs", nil)];
            flg = [[jobDict valueForKey:@"jobBetweenJobsProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"jobOfficeWork", nil)];
            flg = [[jobDict valueForKey:@"jobOfficeWorkProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"jobServices", nil)];
            flg = [[jobDict valueForKey:@"jobServicesProfile"] boolValue];
            break;
        case 5:
            [cell.textLabel setText:NSLocalizedString(@"jobManufacturing", nil)];
            flg = [[jobDict valueForKey:@"jobManufacturingProfile"] boolValue];
            break;
        case 6:
            [cell.textLabel setText:NSLocalizedString(@"jobComputer", nil)];
            flg = [[jobDict valueForKey:@"jobComputerProfile"] boolValue];
            break;
        case 7:
            [cell.textLabel setText:NSLocalizedString(@"jobLanguage", nil)];
            flg = [[jobDict valueForKey:@"jobLanguageProfile"] boolValue];
            break;
        case 8:
            [cell.textLabel setText:NSLocalizedString(@"jobAssets", nil)];
            flg = [[jobDict valueForKey:@"jobAssetsProfile"] boolValue];
            break;
        case 9:
            [cell.textLabel setText:NSLocalizedString(@"jobLaw", nil)];
            flg = [[jobDict valueForKey:@"jobLawProfile"] boolValue];
            break;
        case 10:
            [cell.textLabel setText:NSLocalizedString(@"jobMedia", nil)];
            flg = [[jobDict valueForKey:@"jobMediaProfile"] boolValue];
            break;
        case 11:
            [cell.textLabel setText:NSLocalizedString(@"jobPublishing", nil)];
            flg = [[jobDict valueForKey:@"jobPublishingProfile"] boolValue];
            break;
        case 12:
            [cell.textLabel setText:NSLocalizedString(@"jobDomestic", nil)];
            flg = [[jobDict valueForKey:@"jobDomesticProfile"]  boolValue];
            break;
        case 13:
            [cell.textLabel setText:NSLocalizedString(@"jobMedicalProfession", nil)];
            flg = [[jobDict valueForKey:@"jobMedicalProfessionProfile"] boolValue];
            break;
        case 14:
            [cell.textLabel setText:NSLocalizedString(@"jobHealth", nil)];
            flg = [[jobDict valueForKey:@"jobHealthProfile"] boolValue];
            break;
        case 15:
            [cell.textLabel setText:NSLocalizedString(@"jobArchitecture", nil)];
            flg = [[jobDict valueForKey:@"jobArchitectureProfile"] boolValue];
            break;
        case 16:
            [cell.textLabel setText:NSLocalizedString(@"jobCreativeProfession", nil)];
            flg = [[jobDict valueForKey:@"jobCreativeProfessionProfile"] boolValue];
            break;
        case 17:
            [cell.textLabel setText:NSLocalizedString(@"jobCooking", nil)];
            flg = [[jobDict valueForKey:@"jobCookingProfile"] boolValue];
            break;
        case 18:
            [cell.textLabel setText:NSLocalizedString(@"jobVehicle", nil)];
            flg = [[jobDict valueForKey:@"jobVehicleProfile"] boolValue];
            break;
        case 19:
            [cell.textLabel setText:NSLocalizedString(@"jobTravel", nil)];
            flg = [[jobDict valueForKey:@"jobTravelProfile"] boolValue];
            break;
        case 20:
            [cell.textLabel setText:NSLocalizedString(@"jobBeauty", nil)];
            flg = [[jobDict valueForKey:@"jobBeautyProfile"] boolValue];
            break;
        case 21:
            [cell.textLabel setText:NSLocalizedString(@"jobEntertainment", nil)];
            flg = [[jobDict valueForKey:@"jobEntertainmentProfile"] boolValue];
            break;
        case 22:
            [cell.textLabel setText:NSLocalizedString(@"jobReligiousProfession", nil)];
            flg = [[jobDict valueForKey:@"jobReligiousProfessionProfile"] boolValue];
            break;
        case 23:
            [cell.textLabel setText:NSLocalizedString(@"jobCeremonialOccasions", nil)];
            flg = [[jobDict valueForKey:@"jobCeremonialOccasionsProfile"] boolValue];
            break;
        case 24:
            [cell.textLabel setText:NSLocalizedString(@"jobNature", nil)];
            flg = [[jobDict valueForKey:@"jobNatureProfile"] boolValue];
            break;
        case 25:
            [cell.textLabel setText:NSLocalizedString(@"jobSports", nil)];
            flg = [[jobDict valueForKey:@"jobSportsProfile"] boolValue];
            break;
        case 26:
            [cell.textLabel setText:NSLocalizedString(@"jobSexIndustry", nil)];
            flg = [[jobDict valueForKey:@"jobSexIndustryProfile"] boolValue];
            break;
            
        default:
            break;
    }
    if(flg){ [cell setAccessoryType:UITableViewCellAccessoryCheckmark]; }
    [cell.textLabel setNumberOfLines:0];
    [cell.textLabel setLineBreakMode:NSLineBreakByWordWrapping];

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
    //dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //dispatch_async(q_global, ^{
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if(lastSelectedIndexRow != -1 && indexPath.row != lastSelectedIndexRow){
            NSIndexPath* indexPathOld = [NSIndexPath indexPathForRow:lastSelectedIndexRow inSection:0];
            UITableViewCell* oldCell = [tableView cellForRowAtIndexPath:indexPathOld];
            oldCell.accessoryType = UITableViewCellAccessoryNone;
            [self setIndexAndProfileValue:indexPathOld.row selected:NO];
        }
        
        if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
            cell.accessoryType = UITableViewCellAccessoryNone;
            [self setIndexAndProfileValue:indexPath.row selected:NO];
        }else{
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [self setIndexAndProfileValue:indexPath.row selected:YES];
        }
    //});
    [self performSelector:@selector(popView) withObject:nil afterDelay:0.1f];
}
-(void)setIndexAndProfileValue:(int)idx selected:(BOOL)selected
{
    [self resetDictionary];
    switch (idx) {
        case 0:
            [jobDict setValue:@(selected) forKey:@"jobSecretProfile"];
            break;
        case 1:
            [jobDict setValue:@(selected) forKey:@"jobStudentProfile"];
            break;
        case 2:
            [jobDict setValue:@(selected) forKey:@"jobBetweenJobsProfile"];
            break;
        case 3:
            [jobDict setValue:@(selected) forKey:@"jobOfficeWorkProfile"];
            break;
        case 4:
            [jobDict setValue:@(selected) forKey:@"jobServicesProfile"];
            break;
        case 5:
            [jobDict setValue:@(selected) forKey:@"jobManufacturingProfile"];
            break;
        case 6:
            [jobDict setValue:@(selected) forKey:@"jobComputerProfile"];
            break;
        case 7:
            [jobDict setValue:@(selected) forKey:@"jobLanguageProfile"];
            break;
        case 8:
            [jobDict setValue:@(selected) forKey:@"jobAssetsProfile"];
            break;
        case 9:
            [jobDict setValue:@(selected) forKey:@"jobLawProfile"];
            break;
        case 10:
            [jobDict setValue:@(selected) forKey:@"jobMediaProfile"];
            break;
        case 11:
            [jobDict setValue:@(selected) forKey:@"jobPublishingProfile"];
            break;
        case 12:
            [jobDict setValue:@(selected) forKey:@"jobDomesticProfile"];
            break;
        case 13:
            [jobDict setValue:@(selected) forKey:@"jobMedicalProfessionProfile"];
            break;
        case 14:
            [jobDict setValue:@(selected) forKey:@"jobHealthProfile"];
            break;
        case 15:
            [jobDict setValue:@(selected) forKey:@"jobArchitectureProfile"];
            break;
        case 16:
            [jobDict setValue:@(selected) forKey:@"jobCreativeProfessionProfile"];
            break;
        case 17:
            [jobDict setValue:@(selected) forKey:@"jobCookingProfile"];
            break;
        case 18:
            [jobDict setValue:@(selected) forKey:@"jobVehicleProfile"];
            break;
        case 19:
            [jobDict setValue:@(selected) forKey:@"jobTravelProfile"];
            break;
        case 20:
            [jobDict setValue:@(selected) forKey:@"jobBeautyProfile"];
            break;
        case 21:
            [jobDict setValue:@(selected) forKey:@"jobEntertainmentProfile"];
            break;
        case 22:
            [jobDict setValue:@(selected) forKey:@"jobReligiousProfessionProfile"];
            break;
        case 23:
            [jobDict setValue:@(selected) forKey:@"jobCeremonialOccasionsProfile"];
            break;
        case 24:
            [jobDict setValue:@(selected) forKey:@"jobNatureProfile"];
            break;
        case 25:
            [jobDict setValue:@(selected) forKey:@"jobSportsProfile"];
            break;
        case 26:
            [jobDict setValue:@(selected) forKey:@"jobSexIndustryProfile"];
            break;
        default:
            break;
    }
    lastSelectedIndexRow = idx;
}

-(void)resetDictionary
{
    [jobDict setValue:NO forKey:@"jobSecretProfile"];
    [jobDict setValue:NO forKey:@"jobStudentProfile"];
    [jobDict setValue:NO forKey:@"jobBetweenJobsProfile"];
    [jobDict setValue:NO forKey:@"jobOfficeWorkProfile"];
    [jobDict setValue:NO forKey:@"jobServicesProfile"];
    [jobDict setValue:NO forKey:@"jobManufacturingProfile"];
    [jobDict setValue:NO forKey:@"jobComputerProfile"];
    [jobDict setValue:NO forKey:@"jobLanguageProfile"];
    [jobDict setValue:NO forKey:@"jobAssetsProfile"];
    [jobDict setValue:NO forKey:@"jobLawProfile"];
    [jobDict setValue:NO forKey:@"jobMediaProfile"];
    [jobDict setValue:NO forKey:@"jobPublishingProfile"];
    [jobDict setValue:NO forKey:@"jobDomesticProfile"];
    [jobDict setValue:NO forKey:@"jobMedicalProfessionProfile"];
    [jobDict setValue:NO forKey:@"jobHealthProfile"];
    [jobDict setValue:NO forKey:@"jobArchitectureProfile"];
    [jobDict setValue:NO forKey:@"jobCreativeProfessionProfile"];
    [jobDict setValue:NO forKey:@"jobCookingProfile"];
    [jobDict setValue:NO forKey:@"jobVehicleProfile"];
    [jobDict setValue:NO forKey:@"jobTravelProfile"];
    [jobDict setValue:NO forKey:@"jobBeautyProfile"];
    [jobDict setValue:NO forKey:@"jobEntertainmentProfile"];
    [jobDict setValue:NO forKey:@"jobReligiousProfessionProfile"];
    [jobDict setValue:NO forKey:@"jobCeremonialOccasionsProfile"];
    [jobDict setValue:NO forKey:@"jobNatureProfile"];
    [jobDict setValue:NO forKey:@"jobSportsProfile"];
    [jobDict setValue:NO forKey:@"jobSexIndustryProfile"];
}

-(void)popView
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
