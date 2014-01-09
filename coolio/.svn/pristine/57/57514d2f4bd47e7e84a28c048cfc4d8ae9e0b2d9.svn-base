//
//  NotificationSettingsViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/08/01.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "NotificationSettingsViewController.h"

@interface NotificationSettingsViewController ()

@end

@implementation NotificationSettingsViewController

@synthesize cell_chat;
@synthesize cell_friendRequest;
@synthesize cell_match;
@synthesize sw_chat;
@synthesize sw_friendRequest;
@synthesize sw_match;

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
    notice = [[MyNotification alloc] init];
    if([notice isNotificationSettings] == NO){
        self.sw_chat.on = YES;
        self.sw_friendRequest.on = YES;
        self.sw_match.on = YES;
    }else{
        self.sw_chat.on = [notice getChatNotice];
        self.sw_friendRequest.on = [notice getFriendRequestNotice];
        self.sw_match.on = [notice getMatchNotice];
    }

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell = cell_chat;
            break;
        case 1:
            cell = cell_friendRequest;
            break;
        case 2:
            cell = cell_match;
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
}

- (IBAction)sw_chatValueChanged:(id)sender {
    [notice setChatNotice: self.sw_chat.on];
    [notice setNotificationSettings:YES];
}

- (IBAction)sw_friendRequestValueChanged:(id)sender {
    [notice setFriendRequestNotice: self.sw_friendRequest.on];
    [notice setNotificationSettings:YES];
}

- (IBAction)sw_matchValueChanged:(id)sender {
    [notice setMatchNotice: self.sw_match.on];
    [notice setNotificationSettings:YES];
}

@end
