//
//  ExpectViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "ExpectViewController.h"

@interface ExpectViewController ()

@end

@implementation ExpectViewController

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
    expectDict = [[account getExpectProfile] mutableCopy];
    
    if(expectDict == nil){
        expectDict = [NSMutableDictionary dictionary];
        [expectDict setValue:NO forKey:@"expectSecretProfile"];
        [expectDict setValue:NO forKey:@"expectpersonalityProfile"];
        [expectDict setValue:NO forKey:@"expectAppearanceProfile"];
        [expectDict setValue:NO forKey:@"expectAtmosphereProfile"];
        [expectDict setValue:NO forKey:@"expectBodyProfile"];
        [expectDict setValue:NO forKey:@"expectSexProfile"];
        [expectDict setValue:NO forKey:@"expectInterestProfile"];
        [expectDict setValue:NO forKey:@"expectCircumstanceProfile"];
        [expectDict setValue:NO forKey:@"expectFinanceProfile"];
        [expectDict setValue:NO forKey:@"expectDistanceProfile"];
    }
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [account setExpectProfile:expectDict];
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
    return 10;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // set title of section here
    NSString* titleHeaderLabelValue = @"";
    switch (section) {
        case 0:
            //@"What do you expect the most in companion?";
            titleHeaderLabelValue = NSLocalizedString(@"Expect_header_title", nil);
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
                                                    @"6", @"7", @"8", @"9", @"10"];
    NSString* CellIdentifier = identifier[indexPath.row];

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
            [cell.textLabel setText:NSLocalizedString(@"expectSecret", nil)];
            flg = [[expectDict valueForKey:@"expectSecretProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"expectpersonality", nil)];
            flg = [[expectDict valueForKey:@"expectpersonalityProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"expectAppearance", nil)];
            flg = [[expectDict valueForKey:@"expectAppearanceProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"expectAtmosphere", nil)];
            flg = [[expectDict valueForKey:@"expectAtmosphereProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"expectBody", nil)];
            flg = [[expectDict valueForKey:@"expectBodyProfile"] boolValue];
            break;
        case 5:
            [cell.textLabel setText:NSLocalizedString(@"expectSex", nil)];
            flg = [[expectDict valueForKey:@"expectSexProfile"] boolValue];
            break;
        case 6:
            [cell.textLabel setText:NSLocalizedString(@"expectInterest", nil)];
            flg = [[expectDict valueForKey:@"expectInterestProfile"] boolValue];
            break;
        case 7:
            [cell.textLabel setText:NSLocalizedString(@"expectCircumstance", nil)];
            flg = [[expectDict valueForKey:@"expectCircumstanceProfile"] boolValue];
            break;
        case 8:
            [cell.textLabel setText:NSLocalizedString(@"expectFinance", nil)];
            flg = [[expectDict valueForKey:@"expectFinanceProfile"] boolValue];
            break;
        case 9:
            [cell.textLabel setText:NSLocalizedString(@"expectDistance", nil)];
            flg = [[expectDict valueForKey:@"expectDistanceProfile"] boolValue];
            break;
            
        default:
            break;
    }
    if(flg)[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
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
            [expectDict setValue:@(selected) forKey:@"expectSecretProfile"];
            break;
        case 1:
            [expectDict setValue:@(selected) forKey:@"expectpersonalityProfile"];
            break;
        case 2:
            [expectDict setValue:@(selected) forKey:@"expectAppearanceProfile"];
            break;
        case 3:
            [expectDict setValue:@(selected) forKey:@"expectAtmosphereProfile"];
            break;
        case 4:
            [expectDict setValue:@(selected) forKey:@"expectBodyProfile"];
            break;
        case 5:
            [expectDict setValue:@(selected) forKey:@"expectSexProfile"];
            break;
        case 6:
            [expectDict setValue:@(selected) forKey:@"expectInterestProfile"];
            break;
        case 7:
            [expectDict setValue:@(selected) forKey:@"expectCircumstanceProfile"];
            break;
        case 8:
            [expectDict setValue:@(selected) forKey:@"expectFinanceProfile"];
            break;
        case 9:
            [expectDict setValue:@(selected) forKey:@"expectDistanceProfile"];
            break;
        default:
            break;
    }
    lastSelectedIndexRow = idx;
}

-(void)resetDictionary
{
    [expectDict setValue:NO forKey:@"expectSecretProfile"];
    [expectDict setValue:NO forKey:@"expectpersonalityProfile"];
    [expectDict setValue:NO forKey:@"expectAppearanceProfile"];
    [expectDict setValue:NO forKey:@"expectAtmosphereProfile"];
    [expectDict setValue:NO forKey:@"expectBodyProfile"];
    [expectDict setValue:NO forKey:@"expectSexProfile"];
    [expectDict setValue:NO forKey:@"expectInterestProfile"];
    [expectDict setValue:NO forKey:@"expectCircumstanceProfile"];
    [expectDict setValue:NO forKey:@"expectFinanceProfile"];
    [expectDict setValue:NO forKey:@"expectDistanceProfile"];
}

-(void)popView
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
