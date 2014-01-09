//
//  OtherCharacteristicsViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "OtherCharacteristicsViewController.h"

@interface OtherCharacteristicsViewController ()

@end

@implementation OtherCharacteristicsViewController

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
    otherCharacterDict = [[account getOtherCharacteristicsProfile] mutableCopy];
    
    if(otherCharacterDict == nil){
        otherCharacterDict = [NSMutableDictionary dictionary];
        [otherCharacterDict setValue:NO forKey:@"otherCharacteristicsMustacheProfile"];
        [otherCharacterDict setValue:NO forKey:@"otherCharacteristicsTanningSkinProfile"];
        [otherCharacterDict setValue:NO forKey:@"otherCharacteristicsGlassesProfile"];
        [otherCharacterDict setValue:NO forKey:@"otherCharacteristicsPiarceProfile"];
        [otherCharacterDict setValue:NO forKey:@"otherCharacteristicsTatooProfile"];
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
            [account setOtherCharacteristicsProfile:otherCharacterDict];
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
            titleHeaderLabelValue = NSLocalizedString(@"Other_characteristics_header_title", nil);
            //@"Other Characteristics";
            break;
            
        default:
            break;
    }
    return titleHeaderLabelValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    NSArray* identifier = @[@"1", @"2", @"3", @"4", @"5"];
    NSString *CellIdentifier = identifier[indexPath.row];

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
            [cell.textLabel setText:NSLocalizedString(@"otherCharacteristicsMustache", nil)];
            flg = [[otherCharacterDict valueForKey:@"otherCharacteristicsMustacheProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"otherCharacteristicsTanningSkin", nil)];
            flg = [[otherCharacterDict valueForKey:@"otherCharacteristicsTanningSkinProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"otherCharacteristicsGlasses", nil)];
            flg = [[otherCharacterDict valueForKey:@"otherCharacteristicsGlassesProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"otherCharacteristicsPiarce", nil)];
            flg = [[otherCharacterDict valueForKey:@"otherCharacteristicsPiarceProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"otherCharacteristicsTatoo", nil)];
            flg = [[otherCharacterDict valueForKey:@"otherCharacteristicsTatooProfile"] boolValue];
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
    /*
    int j = 0;
    for(int i=0; i<COLMAX; i++){
        NSString* str = [cellUpdateArray objectAtIndex:i];
        if([str isEqualToString:@"NO"]){
            j++;
        }
    }
    
    if(j == COLMAX){
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self setIndexAndProfileValue:indexPath.row selected:YES];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please select one." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    */
}

-(void)setIndexAndProfileValue:(int)idx selected:(BOOL)selected
{
    switch (idx) {
        case 0:
            [otherCharacterDict setValue:@(selected) forKey:@"otherCharacteristicsMustacheProfile"];
            break;
        case 1:
            [otherCharacterDict setValue:@(selected) forKey:@"otherCharacteristicsTanningSkinProfile"];
            break;
        case 2:
            [otherCharacterDict setValue:@(selected) forKey:@"otherCharacteristicsGlassesProfile"];
            break;
        case 3:
            [otherCharacterDict setValue:@(selected) forKey:@"otherCharacteristicsPiarceProfile"];
            break;
        case 4:
            [otherCharacterDict setValue:@(selected) forKey:@"otherCharacteristicsTatooProfile"];
            break;
        default:
            break;
    }
}
@end
