//
//  LookingForViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "LookingForViewController.h"

@interface LookingForViewController ()

@end

@implementation LookingForViewController

#define COLMAX 9

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
    
    account = [[MyProfiles alloc] init];
    lookingDict = [[account getLookingForProfile] mutableCopy];
    
    if(lookingDict == nil){
        lookingDict = [NSMutableDictionary dictionary];
        [lookingDict setValue:NO forKey:@"lookingLoverProfile"];
        [lookingDict setValue:NO forKey:@"lookingFriendProfile"];
        [lookingDict setValue:NO forKey:@"lookingEPalProfile"];
        [lookingDict setValue:NO forKey:@"lookingMPalProfile"];
        [lookingDict setValue:NO forKey:@"lookingTPalProfile"];
        [lookingDict setValue:NO forKey:@"lookingCircleProfile"];
        [lookingDict setValue:NO forKey:@"lookingRoommateProfile"];
        [lookingDict setValue:NO forKey:@"lookingBPartnerProfile"];
        [lookingDict setValue:NO forKey:@"lookingFriendWithBenefitsProfile"];
    }
    
    cellUpdateArray = [NSMutableArray arrayWithCapacity:COLMAX];
    for (int i=0; i<COLMAX; i++) {
        [cellUpdateArray addObject:@"NO"];
    }
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        
        //NSLog(@"popView");
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [account setLookingForProfile:lookingDict];
            
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
    return 9;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // set title of section here
    NSString* titleHeaderLabelValue = @"";
    switch (section) {
        case 0:
            titleHeaderLabelValue = NSLocalizedString(@"Looking_for_header_title", nil);
            break;
            
        default:
            break;
    }
    return titleHeaderLabelValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    NSArray* identifier = @[@"1", @"2", @"3", @"4", @"5",
                           @"6", @"7", @"8", @"9"];
    NSString* CellIdentifier = identifier[indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    // Configure the cell...
    BOOL flg = NO;
    
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:NSLocalizedString(@"lookingLover", nil)];
            flg = [[lookingDict valueForKey:@"lookingLoverProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"lookingFriend", nil)];
            flg = [[lookingDict valueForKey:@"lookingFriendProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"lookingEPal", nil)];
            flg = [[lookingDict valueForKey:@"lookingEPalProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"lookingMPal", nil)];
            flg = [[lookingDict valueForKey:@"lookingMPalProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"lookingTPal", nil)];
            flg = [[lookingDict valueForKey:@"lookingTPalProfile"] boolValue];
            break;
        case 5:
            [cell.textLabel setText:NSLocalizedString(@"lookingCircle", nil)];
            flg = [[lookingDict valueForKey:@"lookingCircleProfile"] boolValue];
            break;
        case 6:
            [cell.textLabel setText:NSLocalizedString(@"lookingRoommate", nil)];
            flg = [[lookingDict valueForKey:@"lookingRoommateProfile"] boolValue];
            break;
        case 7:
            [cell.textLabel setText:NSLocalizedString(@"lookingBPartner", nil)];
            flg = [[lookingDict valueForKey:@"lookingBPartnerProfile"] boolValue];
            break;
        case 8:
            [cell.textLabel setText:NSLocalizedString(@"lookingFriendWithBenefits", nil)];
            flg = [[lookingDict valueForKey:@"lookingFriendWithBenefitsProfile"] boolValue];
            break;

        default:
            break;
    }
    if(flg){
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        cellUpdateArray[indexPath.row] = @"YES";
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
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self setIndexAndProfileValue:indexPath.row selected:NO];
        cellUpdateArray[indexPath.row] = @"NO";
    }else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self setIndexAndProfileValue:indexPath.row selected:YES];
        cellUpdateArray[indexPath.row] = @"YES";
    }
}

-(void)setIndexAndProfileValue:(int)idx selected:(BOOL)selected
{
    switch (idx) {
        case 0:
            [lookingDict setValue:@(selected) forKey:@"lookingLoverProfile"];
            break;
        case 1:
            [lookingDict setValue:@(selected) forKey:@"lookingFriendProfile"];
            break;
        case 2:
            [lookingDict setValue:@(selected) forKey:@"lookingEPalProfile"];
            break;
        case 3:
            [lookingDict setValue:@(selected) forKey:@"lookingMPalProfile"];
            break;
        case 4:
            [lookingDict setValue:@(selected) forKey:@"lookingTPalProfile"];
            break;
        case 5:
            [lookingDict setValue:@(selected) forKey:@"lookingCircleProfile"];
            break;
        case 6:
            [lookingDict setValue:@(selected) forKey:@"lookingRoommateProfile"];
            break;
        case 7:
            [lookingDict setValue:@(selected) forKey:@"lookingBPartnerProfile"];
            break;
        case 8:
            [lookingDict setValue:@(selected) forKey:@"lookingFriendWithBenefitsProfile"];
            break;
        default:
            break;
    }
}
@end
