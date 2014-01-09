//
//  FetishViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "FetishViewController.h"

@interface FetishViewController ()

@end

@implementation FetishViewController

#define COLMAX 15

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
    
    fetiDict = [[account getFetishProfile] mutableCopy];
    if(fetiDict == nil){
        fetiDict = [NSMutableDictionary dictionary];
        [fetiDict setValue:NO forKey:@"fetishBDSMProfile"];
        [fetiDict setValue:NO forKey:@"fetishBigCockProfile"];
        [fetiDict setValue:NO forKey:@"fetishSmallCockProfile"];
        [fetiDict setValue:NO forKey:@"fetishUncutProfile"];
        [fetiDict setValue:NO forKey:@"fetishSmellFetishProfile"];
        [fetiDict setValue:NO forKey:@"fetishUniformFetishProfile"];
        [fetiDict setValue:NO forKey:@"fetishRubberProfile"];
        [fetiDict setValue:NO forKey:@"fetishDragProfile"];
        [fetiDict setValue:NO forKey:@"fetishFlasherProfile"];
        [fetiDict setValue:NO forKey:@"fetishGangbangProfile"];
        [fetiDict setValue:NO forKey:@"fetishHardcorePlayProfile"];
        [fetiDict setValue:NO forKey:@"fetishPhoneSexProfile"];
        [fetiDict setValue:NO forKey:@"fetishTeenLoverProfile"];
        [fetiDict setValue:NO forKey:@"fetishMatureLoverProfile"];
        [fetiDict setValue:NO forKey:@"fetishChubbyLoverProfile"];
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
            [account setFetishProfile:fetiDict];
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
    return 15;
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // set title of section here
    NSString* titleHeaderLabelValue = @"";
    switch (section) {
        case 0:
            //@"Fetish";
            titleHeaderLabelValue = NSLocalizedString(@"Fetish_header_title", nil);
            break;
            
        default:
            break;
    }
    return titleHeaderLabelValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *identifiers = @[@"a", @"b", @"c", @"d", @"e",
                                                     @"f", @"g", @"h", @"i", @"j",
                                                     @"k", @"l", @"m", @"n", @"o"];
    
    NSString *CellIdentifier = identifiers[indexPath.row];
    
    //static NSString *CellIdentifier = @"Cell";
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
            [cell.textLabel setText:NSLocalizedString(@"fetishBDSM", nil)];
            flg = [[fetiDict valueForKey:@"fetishBDSMProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"fetishBigCock", nil)];
            flg = [[fetiDict valueForKey:@"fetishBigCockProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"fetishSmallCock", nil)];
            flg = [[fetiDict valueForKey:@"fetishSmallCockProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"fetishUncut", nil)];
            flg = [[fetiDict valueForKey:@"fetishUncutProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"fetishSmellFetish", nil)];
            flg = [[fetiDict valueForKey:@"fetishSmellFetishProfile"] boolValue];
            break;
        case 5:
            [cell.textLabel setText:NSLocalizedString(@"fetishUniformFetish", nil)];
            flg = [[fetiDict valueForKey:@"fetishUniformFetishProfile"] boolValue];
            break;
        case 6:
            [cell.textLabel setText:NSLocalizedString(@"fetishRubber", nil)];
            flg = [[fetiDict valueForKey:@"fetishRubberProfile"] boolValue];
            break;
        case 7:
            [cell.textLabel setText:NSLocalizedString(@"fetishDrag", nil)];
            flg = [[fetiDict valueForKey:@"fetishDragProfile"] boolValue];
            break;
        case 8:
            [cell.textLabel setText:NSLocalizedString(@"fetishFlasher", nil)];
            flg = [[fetiDict valueForKey:@"fetishFlasherProfile"] boolValue];
            break;
        case 9:
            [cell.textLabel setText:NSLocalizedString(@"fetishGangbang", nil)];
            flg = [[fetiDict valueForKey:@"fetishGangbangProfile"] boolValue];
            break;
        case 10:
            [cell.textLabel setText:NSLocalizedString(@"fetishHardcorePlay", nil)];
            flg = [[fetiDict valueForKey:@"fetishHardcorePlayProfile"] boolValue];
            break;
        case 11:
            [cell.textLabel setText:NSLocalizedString(@"fetishPhoneSex", nil)];
            flg = [[fetiDict valueForKey:@"fetishPhoneSexProfile"] boolValue];
            break;
        case 12:
            [cell.textLabel setText:NSLocalizedString(@"fetishTeenLover", nil)];
            flg = [[fetiDict valueForKey:@"fetishTeenLoverProfile"] boolValue];
            break;
        case 13:
            [cell.textLabel setText:NSLocalizedString(@"fetishMatureLover", nil)];
            flg = [[fetiDict valueForKey:@"fetishMatureLoverProfile"] boolValue];
            break;
        case 14:
            [cell.textLabel setText:NSLocalizedString(@"fetishChubbyLover", nil)];
            flg = [[fetiDict valueForKey:@"fetishChubbyLoverProfile"] boolValue];
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
            [fetiDict setValue:@(selected) forKey:@"fetishBDSMProfile"];
            break;
        case 1:
            [fetiDict setValue:@(selected) forKey:@"fetishBigCockProfile"];
            break;
        case 2:
            [fetiDict setValue:@(selected) forKey:@"fetishSmallCockProfile"];
            break;
        case 3:
            [fetiDict setValue:@(selected) forKey:@"fetishUncutProfile"];
            break;
        case 4:
            [fetiDict setValue:@(selected) forKey:@"fetishSmellFetishProfile"];
            break;
        case 5:
            [fetiDict setValue:@(selected) forKey:@"fetishUniformFetishProfile"];
            break;
        case 6:
            [fetiDict setValue:@(selected) forKey:@"fetishRubberProfile"];
            break;
        case 7:
            [fetiDict setValue:@(selected) forKey:@"fetishDragProfile"];
            break;
        case 8:
            [fetiDict setValue:@(selected) forKey:@"fetishFlasherProfile"];
            break;
        case 9:
            [fetiDict setValue:@(selected) forKey:@"fetishGangbangProfile"];
            break;
        case 10:
            [fetiDict setValue:@(selected) forKey:@"fetishHardcorePlayProfile"];
            break;
        case 11:
            [fetiDict setValue:@(selected) forKey:@"fetishPhoneSexProfile"];
            break;
        case 12:
            [fetiDict setValue:@(selected) forKey:@"fetishTeenLoverProfile"];
            break;
        case 13:
            [fetiDict setValue:@(selected) forKey:@"fetishMatureLoverProfile"];
            break;
        case 14:
            [fetiDict setValue:@(selected) forKey:@"fetishChubbyLoverProfile"];
            break;
        default:
            break;
    }
}

@end
