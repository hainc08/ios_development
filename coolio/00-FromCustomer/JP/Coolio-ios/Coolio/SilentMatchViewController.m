//
//  SilentMatchViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "SilentMatchViewController.h"

@interface SilentMatchViewController ()

@end

@implementation SilentMatchViewController
@synthesize tblView;

#define DATEFORMAT_UTC @"yyyy-MM-dd'T'HH:mm:ssZZZZ"
#define DATEFORMAT_UTC_Z @"yyyy-MM-dd'T'HH:mm:ss'Z'"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openMenue];
    [self openPasscodeView];

    coolio = [[CoolioWebService alloc] init];
    MyProfiles* account = [[MyProfiles alloc] init];
    
    myId = [account getEmailProfile];
    
    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheGetMySilentMatch:) name:@"ToNotifyTheGetMySilentMatch" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    self.slidingViewController.underRightViewController = nil;
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if( [AppDelegate NetworkCheckConnect] == YES){
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [SVProgressHUD showWithStatus:@"" maskType:SVProgressHUDMaskTypeBlack];

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [coolio getMySilentMatch:myId];
        });
        //[coolio getMyUnreadCount:myId];
    }else{
        [AppDelegate showDisconnectAlert];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    return [silentMatchCollections count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //for (UIView *subview in [cell.contentView subviews]) {
    //    [subview removeFromSuperview];
    //}
    
    UIImageView* imgIcon = (UIImageView *)[cell viewWithTag:1];
    UILabel* nickNameLabel = (UILabel *)[cell viewWithTag:2];
    UITextView* contentTextView = (UITextView *)[cell viewWithTag:3];
    
    imgIcon.image = nil;
    nickNameLabel.text = nil;
    contentTextView.text = nil;
    
    NSDictionary* userDict = [silentMatchCollections[indexPath.row] mutableCopy];
    //userDict = [userDict valueForKey:@"user"];
    UserProfile* users = [[UserProfile alloc] init];
    users.userProfileInfo = userDict;
    
    nickNameLabel.text = [users getNickName];
    /*
     名前
     年齢：身長：体重
     目的
     */
    
    contentTextView.text = [users getTableViewFormatValues];

    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        //UIImage* img = [self pictures:userDict pictName:@"picture1"];
        
        
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^{
            [imgIcon setImageWithURL:[self picturesURL:userDict pictName:@"picture1"] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
            //imgIcon.image = img;
        });
    });
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
    //
}

/*
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"prepareForSegue");
    if ([[segue identifier] isEqualToString:@"SilentMatchToAccountDetail"]) {
        // NSLog(@"FriendToAccountDetail");
        NSIndexPath* indexPath = self.tblView.indexPathForSelectedRow;

        NSDictionary* userInfoDict = [silentMatchCollections objectAtIndex:indexPath.row];
        
        NSMutableDictionary* mDict = [NSMutableDictionary dictionary];
        [mDict setValue:[userInfoDict valueForKey:@"user"] forKey:@"userInfoDict"];
        [mDict setValue:myId forKey:@"myId"];
        userInfoGlobal = mDict;
    }
}
*/

-(NSArray *)sortArrayLastLoginTime:(NSArray *)array{
    
    array = [array sortedArrayUsingComparator: ^(id a, id b) {
        
        NSString* dateStringA = [a valueForKey:@"updated_at"];
        NSString* dateStringB = [b valueForKey:@"updated_at"];
        
        if([dateStringA isEqual:[NSNull null]]){
            return (NSComparisonResult)NSOrderedSame;
        }
        if([dateStringB isEqual:[NSNull null]]){
            return (NSComparisonResult)NSOrderedSame;
        }
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:DATEFORMAT_UTC];
        
        NSDate* dateA = [dateFormatter dateFromString:dateStringA];
        NSDate* dateB = [dateFormatter dateFromString:dateStringB];
        
        NSDate *now = [NSDate date];
        float date_a = [now timeIntervalSinceDate:dateA];
        float date_b = [now timeIntervalSinceDate:dateB];
        
        if ( date_a < date_b ) {
            return (NSComparisonResult)NSOrderedAscending;
        } else if ( date_a > date_b) {
            return (NSComparisonResult)NSOrderedDescending;
        } else {
            return (NSComparisonResult)NSOrderedSame;
        }
    }];
    
    return array;
}

- (void)toNotifyTheGetMySilentMatch:(NSNotification *)notification
{
    silentMatchCollections = [[notification object] mutableCopy];
    silentMatchCollections = [self sortArrayLastLoginTime:silentMatchCollections];

    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        [(UITableView *)self.tblView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        //[self.tblView reloadData];
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [SVProgressHUD dismiss];
    });
}


-(UIImage *)pictures:(NSDictionary *)dict pictName:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendFormat:@"%@", [dict valueForKey:pictName]];
    
    NSURL *url = [NSURL URLWithString:appendIconUrlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc]initWithData:data];
    return  img;
}

-(NSURL *)picturesURL:(NSDictionary *)dict pictName:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendFormat:@"%@", [dict valueForKey:pictName]];
    
    return [NSURL URLWithString:appendIconUrlString];
}

- (IBAction)revealMenu:(id)sender
{
    //NSString* myId = [[[MyProfiles alloc] init] getEmailProfile];
    //CoolioWebService* coolio = [[CoolioWebService alloc] init];
    [coolio getMyUnreadCount:myId];
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"SilentMatchToAccountDetail"]) {
        NSIndexPath* idxPath = self.tblView.indexPathForSelectedRow;
        NSDictionary* userInfoDict = [silentMatchCollections[idxPath.row] mutableCopy];
        NSString* userId = [userInfoDict valueForKey:@"email"];
        
        AccountDetailViewController *detailView = segue.destinationViewController;
        detailView.userId = userId;
    }
}

@end
