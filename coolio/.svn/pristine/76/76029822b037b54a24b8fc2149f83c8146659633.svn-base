//
//  BodyShapeViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "BodyShapeViewController.h"

@interface BodyShapeViewController ()

@end

@implementation BodyShapeViewController

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
    
    [self openPasscodeView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    lastSelectedIndexRow = -1;
    account = [[MyProfiles alloc] init];
    bodyShapeDict = [[account getBodyShapeProfile] mutableCopy];
    
    if(bodyShapeDict == nil){
        bodyShapeDict = [NSMutableDictionary dictionary];
        [bodyShapeDict setValue:NO forKey:@"bodyShapeSecretProfile"];
        [bodyShapeDict setValue:NO forKey:@"bodyShapeSlimProfile"];
        [bodyShapeDict setValue:NO forKey:@"bodyShapeAverageProfile"];
        [bodyShapeDict setValue:NO forKey:@"bodyShapeChubbyProfile"];
        [bodyShapeDict setValue:NO forKey:@"bodyShapeVeryChubbyProfile"];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [account setBodyShapeProfile:bodyShapeDict];
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
    ///#warning Potentially incomplete method implementation.
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
            titleHeaderLabelValue = NSLocalizedString(@"Body_shape_header_title", nil);
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
            [cell.textLabel setText:NSLocalizedString(@"bodyShapeSecret", nil)];
            flg = [[bodyShapeDict valueForKey:@"bodyShapeSecretProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"bodyShapeSlim", nil)];
            flg = [[bodyShapeDict valueForKey:@"bodyShapeSlimProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"bodyShapeAverage", nil)];
            flg = [[bodyShapeDict valueForKey:@"bodyShapeAverageProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"bodyShapeChubby", nil)];
            flg = [[bodyShapeDict valueForKey:@"bodyShapeChubbyProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"bodyShapeVeryChubby", nil)];
            flg = [[bodyShapeDict valueForKey:@"bodyShapeVeryChubbyProfile"] boolValue];
            break;
         default:
            break;
    }
    if(flg){
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
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
            //if(indexPath.row != lastSelectedIndexRow){
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setIndexAndProfileValue:indexPath.row selected:NO];
            //}
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
            [bodyShapeDict setValue:@(selected) forKey:@"bodyShapeSecretProfile"];
            break;
        case 1:
            [bodyShapeDict setValue:@(selected) forKey:@"bodyShapeSlimProfile"];
            break;
        case 2:
            [bodyShapeDict setValue:@(selected) forKey:@"bodyShapeAverageProfile"];
            break;
        case 3:
            [bodyShapeDict setValue:@(selected) forKey:@"bodyShapeChubbyProfile"];
            break;
        case 4:
            [bodyShapeDict setValue:@(selected) forKey:@"bodyShapeVeryChubbyProfile"];
            break;
        default:
            break;
    }
    lastSelectedIndexRow = idx;
}

-(void)resetDictionary{
    [bodyShapeDict setValue:NO forKey:@"bodyShapeSecretProfile"];
    [bodyShapeDict setValue:NO forKey:@"bodyShapeSlimProfile"];
    [bodyShapeDict setValue:NO forKey:@"bodyShapeAverageProfile"];
    [bodyShapeDict setValue:NO forKey:@"bodyShapeChubbyProfile"];
    [bodyShapeDict setValue:NO forKey:@"bodyShapeVeryChubbyProfile"];
}

-(void)popView
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
