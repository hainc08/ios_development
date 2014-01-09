//
//  RaceViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/19.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "RaceViewController.h"

@interface RaceViewController ()

@end

@implementation RaceViewController

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
    raceDict = [[account getRaceProfile] mutableCopy];    
    
    if(raceDict == nil){
        raceDict = [NSMutableDictionary dictionary];
        [raceDict setValue:NO forKey:@"raceAsianProfile"];
        [raceDict setValue:NO forKey:@"raceWhiteProfile"];
        [raceDict setValue:NO forKey:@"raceBlackProfile"];
        [raceDict setValue:NO forKey:@"raceLatinProfile"];
        [raceDict setValue:NO forKey:@"raceArabProfile"];
        [raceDict setValue:NO forKey:@"racePolynesianProfile"];
        [raceDict setValue:NO forKey:@"raceMixProfile"];
        [raceDict setValue:NO forKey:@"raceEtcProfile"];
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [account setRaceProfile:raceDict];
            
            dispatch_queue_t q_main = dispatch_get_main_queue();
            dispatch_async(q_main, ^{
                // NSNotificationの生成（通知名："toNotifiTheChangeProfile"）
                NSNotification *n = [NSNotification notificationWithName:@"toNotifiTheChangeProfile" object:self];
                
                // 通知センターを取得する
                NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
                
                // 通知をする
                [nc postNotification:n];
            });
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 8;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // set title of section here
    NSString* titleHeaderLabelValue = @"";
    switch (section) {
        case 0:
            //"Race_header_title" = "Race";
            titleHeaderLabelValue = NSLocalizedString(@"Race_header_title", nil);
            break;
            
        default:
            break;
    }
    return titleHeaderLabelValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    BOOL flg = NO;
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:NSLocalizedString(@"raceAsian", nil)];
            flg = [[raceDict valueForKey:@"raceAsianProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"raceWhite", nil)];
            flg = [[raceDict valueForKey:@"raceWhiteProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"raceBlack", nil)];
            flg = [[raceDict valueForKey:@"raceBlackProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"raceLatin", nil)];
            flg = [[raceDict valueForKey:@"raceLatinProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"raceArab", nil)];
            flg = [[raceDict valueForKey:@"raceArabProfile"] boolValue];
            break;
        case 5:
            [cell.textLabel setText:NSLocalizedString(@"racePolynesian", nil)];
            flg = [[raceDict valueForKey:@"racePolynesianProfile"] boolValue];
            break;
        case 6:
            [cell.textLabel setText:NSLocalizedString(@"raceMix", nil)];
            flg = [[raceDict valueForKey:@"raceMixProfile"] boolValue];
            break;
        case 7:
            [cell.textLabel setText:NSLocalizedString(@"raceEtc", nil)];
            flg = [[raceDict valueForKey:@"raceEtcProfile"] boolValue];
            break;
        default:
            break;
    }
    
    if(flg){
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        lastSelectedIndexRow = indexPath.row;
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
            if(indexPath.row != lastSelectedIndexRow){
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setIndexAndProfileValue:indexPath.row selected:NO];
            }
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
            [raceDict setValue:@(selected) forKey:@"raceAsianProfile"];
            break;
        case 1:
            [raceDict setValue:@(selected) forKey:@"raceWhiteProfile"];
            break;
        case 2:
            [raceDict setValue:@(selected) forKey:@"raceBlackProfile"];
            break;
        case 3:
            [raceDict setValue:@(selected) forKey:@"raceLatinProfile"];
            break;
        case 4:
            [raceDict setValue:@(selected) forKey:@"raceArabProfile"];
            break;
        case 5:
            [raceDict setValue:@(selected) forKey:@"racePolynesianProfile"];
            break;
        case 6:
            [raceDict setValue:@(selected) forKey:@"raceMixProfile"];
            break;
        case 7:
            [raceDict setValue:@(selected) forKey:@"raceEtcProfile"];
            break;
        default:
            break;
    }
    //[account setRaceProfile:raceDict];
    lastSelectedIndexRow = idx;
}

-(void)resetDictionary
{
    [raceDict setValue:NO forKey:@"raceAsianProfile"];
    [raceDict setValue:NO forKey:@"raceWhiteProfile"];
    [raceDict setValue:NO forKey:@"raceBlackProfile"];
    [raceDict setValue:NO forKey:@"raceLatinProfile"];
    [raceDict setValue:NO forKey:@"raceArabProfile"];
    [raceDict setValue:NO forKey:@"racePolynesianProfile"];
    [raceDict setValue:NO forKey:@"raceMixProfile"];
    [raceDict setValue:NO forKey:@"raceEtcProfile"];
}
-(void)popView
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
