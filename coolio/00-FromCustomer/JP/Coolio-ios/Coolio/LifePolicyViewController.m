//
//  LifePolicyViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "LifePolicyViewController.h"

@interface LifePolicyViewController ()

@end

@implementation LifePolicyViewController

#define COLMAX 5

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
    
    lifePolDict = [[account getLifePolicyProfile] mutableCopy];
    if(lifePolDict == nil){
        lifePolDict = [NSMutableDictionary dictionary];
        [lifePolDict setValue:NO forKey:@"lifePolicyVegetarianProfile"];
        [lifePolDict setValue:NO forKey:@"lifePolicyNoSmokingProfile"];
        [lifePolDict setValue:NO forKey:@"lifePolicyNoDrinkingProfile"];
        [lifePolDict setValue:NO forKey:@"lifePolicyNoGamblingProfile"];
        [lifePolDict setValue:NO forKey:@"lifePolicyNoSexProfile"];
    }
    
    cellUpdateArray = [NSMutableArray arrayWithCapacity:COLMAX];
    for(int i=0; i<COLMAX; i++){
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
            [account setLifePolicyProfile:lifePolDict];
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
    return 5;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // set title of section here
    NSString* titleHeaderLabelValue = @"";
    switch (section) {
        case 0:
            titleHeaderLabelValue = NSLocalizedString(@"LifePolicy_header_title", nil);//@"Life Policy";
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
            [cell.textLabel setText:NSLocalizedString(@"lifePolicyVegetarian", nil)];
            flg = [[lifePolDict valueForKey:@"lifePolicyVegetarianProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"lifePolicyNoSmoking", nil)];
            flg = [[lifePolDict valueForKey:@"lifePolicyNoSmokingProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"lifePolicyNoDrinking", nil)];
            flg = [[lifePolDict valueForKey:@"lifePolicyNoDrinkingProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"lifePolicyNoGambling", nil)];
            flg = [[lifePolDict valueForKey:@"lifePolicyNoGamblingProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"lifePolicyNoSex", nil)];
            flg = [[lifePolDict valueForKey:@"lifePolicyNoSexProfile"] boolValue];
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
            [lifePolDict setValue:@(selected) forKey:@"lifePolicyVegetarianProfile"];
            break;
        case 1:
            [lifePolDict setValue:@(selected) forKey:@"lifePolicyNoSmokingProfile"];
            break;
        case 2:
            [lifePolDict setValue:@(selected) forKey:@"lifePolicyNoDrinkingProfile"];
            break;
        case 3:
            [lifePolDict setValue:@(selected) forKey:@"lifePolicyNoGamblingProfile"];
            break;
        case 4:
            [lifePolDict setValue:@(selected) forKey:@"lifePolicyNoSexProfile"];
            break;
        default:
            break;
    }
}

@end
