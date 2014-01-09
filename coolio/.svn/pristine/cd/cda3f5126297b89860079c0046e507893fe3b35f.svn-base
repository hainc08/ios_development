//
//  YourStyleViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/20.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "YourStyleViewController.h"

@interface YourStyleViewController ()

@end

@implementation YourStyleViewController

#define COLMAX 19

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
    styleDict = [[account getStyleProfile] mutableCopy];

    if(styleDict == nil){
        styleDict = [NSMutableDictionary dictionary];
        [styleDict setValue:NO forKey:@"styleTwinkProfile"];
        [styleDict setValue:NO forKey:@"styleHunkProfile"];
        [styleDict setValue:NO forKey:@"styleSurferProfile"];
        [styleDict setValue:NO forKey:@"styleHipHopProfile"];
        [styleDict setValue:NO forKey:@"styleThugProfile"];
        [styleDict setValue:NO forKey:@"stylePunkProfile"];
        [styleDict setValue:NO forKey:@"styleWhiteCollarProfile"];
        [styleDict setValue:NO forKey:@"styleHardcoreGayProfile"];
        [styleDict setValue:NO forKey:@"stylePotatoProfile"];
        [styleDict setValue:NO forKey:@"styleBearProfile"];
        [styleDict setValue:NO forKey:@"styleGeekProfile"];
        [styleDict setValue:NO forKey:@"styleChubbyProfile"];
        [styleDict setValue:NO forKey:@"styleBeefyProfile"];
        [styleDict setValue:NO forKey:@"styleBodybuilderProfile"];
        [styleDict setValue:NO forKey:@"styleWellMuscledProfile"];
        [styleDict setValue:NO forKey:@"styleSlimSkinnyProfile"];
        [styleDict setValue:NO forKey:@"styleFeminineProfile"];
        [styleDict setValue:NO forKey:@"styleShemaleProfile"];
        [styleDict setValue:NO forKey:@"styleEtcProfile"];
    }
    //lastSelectedIndexRow = -1;
    
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
            [account setStyleProfile:styleDict];

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
    return 19;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // set title of section here
    NSString* titleHeaderLabelValue = @"";
    switch (section) {
        case 0:
            titleHeaderLabelValue = NSLocalizedString(@"Your_style_header_title", nil);
            break;
            
        default:
            break;
    }
    return titleHeaderLabelValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray* identifiers = @[@"1", @"2", @"3", @"4", @"5",
                                                     @"6", @"7", @"8", @"9", @"10",
                                                     @"11", @"12", @"13", @"14", @"15",@"16",@"17",@"18",@"19"];
    
    //static NSString *CellIdentifier = @"Cell";
    NSString* CellIdentifier = identifiers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }

    // Configure the cell...
    /*
     Twink
     Hunk / Jock / Blue-collar
     Surfer
     Hip Hop
     Thug / Bad Boy
     Punk / Emo
     White-collar
     Hardcore Gay / Leather / BDSM
     Potato (Unchic / Unsophisticated)
     Bear
     Geek
     Chubby
     Beefy / Wrestler
     Bodybuilder / Macho
     Slim & Well-Muscled
     Slim & Skinny
     Feminine / Girly
     Shemale / Ladyboy
     Etc     */
    BOOL flg = NO;
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:NSLocalizedString(@"styleTwink", nil)];
            flg = [[styleDict valueForKey:@"styleTwinkProfile"] boolValue];
            break;
        case 1:
            [cell.textLabel setText:NSLocalizedString(@"styleHunk", nil)];
            flg = [[styleDict valueForKey:@"styleHunkProfile"] boolValue];
            break;
        case 2:
            [cell.textLabel setText:NSLocalizedString(@"styleSurfer", nil)];
            flg =  [[styleDict valueForKey:@"styleSurferProfile"] boolValue];
            break;
        case 3:
            [cell.textLabel setText:NSLocalizedString(@"styleHipHop", nil)];
            flg = [[styleDict valueForKey:@"styleHipHopProfile"] boolValue];
            break;
        case 4:
            [cell.textLabel setText:NSLocalizedString(@"styleThug", nil)];
            flg = [[styleDict valueForKey:@"styleThugProfile"] boolValue];
            break;
        case 5:
            [cell.textLabel setText:NSLocalizedString(@"stylePunk", nil)];
            flg = [[styleDict valueForKey:@"stylePunkProfile"] boolValue];
            break;
        case 6:
            [cell.textLabel setText:NSLocalizedString(@"styleWhiteCollar", nil)];
            flg = [[styleDict valueForKey:@"styleWhiteCollarProfile"] boolValue];
            break;
        case 7:
            [cell.textLabel setText:NSLocalizedString(@"styleHardcoreGay", nil)];
            flg = [[styleDict valueForKey:@"styleHardcoreGayProfile"] boolValue];
            break;
        case 8:
            [cell.textLabel setText:NSLocalizedString(@"stylePotato", nil)];
            flg = [[styleDict valueForKey:@"stylePotatoProfile"] boolValue];
            break;
        case 9:
            [cell.textLabel setText:NSLocalizedString(@"styleBear", nil)];
            flg = [[styleDict valueForKey:@"styleBearProfile"] boolValue];
            break;
        case 10:
            [cell.textLabel setText:NSLocalizedString(@"styleGeek", nil)];
            flg = [[styleDict valueForKey:@"styleGeekProfile"] boolValue];
            break;
        case 11:
            [cell.textLabel setText:NSLocalizedString(@"styleChubby", nil)];
            flg = [[styleDict valueForKey:@"styleChubbyProfile"] boolValue];
            break;
        case 12:
            [cell.textLabel setText:NSLocalizedString(@"styleBeefy", nil)];
            flg = [[styleDict valueForKey:@"styleBeefyProfile"] boolValue];
            break;
        case 13:
            [cell.textLabel setText:NSLocalizedString(@"styleBodybuilder", nil)];
            flg = [[styleDict valueForKey:@"styleBodybuilderProfile"] boolValue];
            break;
        case 14:
            [cell.textLabel setText:NSLocalizedString(@"styleWellMuscled", nil)];
            flg = [[styleDict valueForKey:@"styleWellMuscledProfile"] boolValue];
            break;
        case 15:
            [cell.textLabel setText:NSLocalizedString(@"styleSlimSkinny", nil)];
            flg = [[styleDict valueForKey:@"styleSlimSkinnyProfile"] boolValue];
            break;
        case 16:
            [cell.textLabel setText:NSLocalizedString(@"styleFeminine", nil)];
            flg = [[styleDict valueForKey:@"styleFeminineProfile"] boolValue];
            break;
        case 17:
            [cell.textLabel setText:NSLocalizedString(@"styleShemale", nil)];
            flg = [[styleDict valueForKey:@"styleShemaleProfile"] boolValue];
            break;
        case 18:
            [cell.textLabel setText:NSLocalizedString(@"styleEtc", nil)];
            flg = [[styleDict valueForKey:@"styleEtcProfile"] boolValue];
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
    //NSLog(@"%d", indexPath.row);
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
            [styleDict setValue:@(selected) forKey:@"styleTwinkProfile"];
            break;
        case 1:
            [styleDict setValue:@(selected) forKey:@"styleHunkProfile"];
            break;
        case 2:
            [styleDict setValue:@(selected) forKey:@"styleSurferProfile"];
            break;
        case 3:
            [styleDict setValue:@(selected) forKey:@"styleHipHopProfile"];
            break;
        case 4:
            [styleDict setValue:@(selected) forKey:@"styleThugProfile"];
            break;
        case 5:
            [styleDict setValue:@(selected) forKey:@"stylePunkProfile"];
            break;
        case 6:
            [styleDict setValue:@(selected) forKey:@"styleWhiteCollarProfile"];
            break;
        case 7:
            [styleDict setValue:@(selected) forKey:@"styleHardcoreGayProfile"];
            break;
        case 8:
            [styleDict setValue:@(selected) forKey:@"stylePotatoProfile"];
            break;
        case 9:
            [styleDict setValue:@(selected) forKey:@"styleBearProfile"];
            break;
        case 10:
            [styleDict setValue:@(selected) forKey:@"styleGeekProfile"];
            break;
        case 11:
            [styleDict setValue:@(selected) forKey:@"styleChubbyProfile"];
            break;
        case 12:
            [styleDict setValue:@(selected) forKey:@"styleBeefyProfile"];
            break;
        case 13:
            [styleDict setValue:@(selected) forKey:@"styleBodybuilderProfile"];
            break;
        case 14:
            [styleDict setValue:@(selected) forKey:@"styleWellMuscledProfile"];
            break;
        case 15:
            [styleDict setValue:@(selected) forKey:@"styleSlimSkinnyProfile"];
            break;
        case 16:
            [styleDict setValue:@(selected) forKey:@"styleFeminineProfile"];
            break;
        case 17:
            [styleDict setValue:@(selected) forKey:@"styleShemaleProfile"];
            break;
        case 18:
            [styleDict setValue:@(selected) forKey:@"styleEtcProfile"];
            break;
        default:
            break;
    }
    //[account setStyleProfile:styleDict];
}

@end
