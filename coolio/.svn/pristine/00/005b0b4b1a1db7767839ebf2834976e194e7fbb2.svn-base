//
//  PersonalityViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/21.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "PersonalityViewController.h"

@interface PersonalityViewController ()

@end

@implementation PersonalityViewController
@synthesize cell0;
@synthesize cell1;
@synthesize cell2;
@synthesize cell3;
@synthesize cell4;
@synthesize cell5;
@synthesize cell6;
@synthesize cell7;
@synthesize cell8;
@synthesize cell9;
@synthesize cell10;
@synthesize cell11;
@synthesize cell12;
@synthesize cell13;
@synthesize cell14;
@synthesize cell15;
@synthesize cell16;
@synthesize cell17;
@synthesize cell18;

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
    return 19;
}

/*
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return NSLocalizedString(@"Personality_header_title", nil);;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell = cell0;
            break;
        case 1:
            cell = cell1;
            break;
        case 2:
            cell = cell2;
            break;
        case 3:
            cell = cell3;
            break;
        case 4:
            cell = cell4;
            break;
        case 5:
            cell = cell5;
            break;
        case 6:
            cell = cell6;
            break;
        case 7:
            cell = cell7;
            break;
        case 8:
            cell = cell8;
            break;
        case 9:
            cell = cell9;
            break;
        case 10:
            cell = cell10;
            break;
        case 11:
            cell = cell11;
            break;
        case 12:
            cell = cell12;
            break;
        case 13:
            cell = cell13;
            break;
        case 14:
            cell = cell14;
            break;
        case 15:
            cell = cell15;
            break;
        case 16:
            cell = cell16;
            break;
        case 17:
            cell = cell17;
            break;
        case 18:
            cell = cell18;
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
    //indexPathRow = indexPath.row;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    //NSLog(@"selectedIndexRow: %d", indexPath.row);
    
    PersonalityParamViewController* view = segue.destinationViewController;
    view.selectedSectionIndex = [NSNumber numberWithInt:indexPath.row];

    //[segue identifier];
    //NSMutableDictionary* userInfo = [NSMutableDictionary dictionary];
    //[userInfo setValue:[NSNumber numberWithInt:indexPath.row] forKey:@"selectedSectionIndex"];

    //NSNotification* n = [NSNotification notificationWithName:@"ToNotifyThePersonalityDetail" object:self userInfo:userInfo];
    //[[NSNotificationCenter defaultCenter] postNotification:n];

}

@end
