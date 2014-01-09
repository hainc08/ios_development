//
//  MyHistoryViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MyHistoryViewController.h"

@interface MyHistoryViewController ()

@end

@implementation MyHistoryViewController

#define DATEFORMAT_UTC @"yyyy-MM-dd'T'HH:mm:ssZZZZ"
#define DATEFORMAT_UTC_Z @"yyyy-MM-dd'T'HH:mm:ss'Z'"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    
    coolio = [[CoolioWebService alloc] init];
    MyProfiles* account = [[MyProfiles alloc] init];
    
    myId = [account getEmailProfile];
    
    [self openMenue];
    [self openPasscodeView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheGetMyHistory:) name:@"ToNotifyTheGetMyHistory" object:nil];
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
            [coolio getMyHistory:myId];
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
    return [historyCollections count];
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
    UILabel* updatedLabel = (UILabel *)[cell viewWithTag:3];
    UITextView* contentTextView = (UITextView *)[cell viewWithTag:4];
    
    imgIcon.image = nil;
    nickNameLabel.text = nil;
    updatedLabel.text = nil;
    contentTextView.text = nil;
    
    NSDictionary* userDict = [historyCollections[indexPath.row] mutableCopy];
    //userDict = [userDict valueForKey:@"user"];
    
    UserProfile* users = [[UserProfile alloc] init];
    users.userProfileInfo = userDict;
    //NSString* countValue = nil;
    
    /*
    if(![[userDict valueForKey:@"countValue"] isEqual:[NSNull null]]){
        countValue = [NSString stringWithFormat:@"Views: %d", [[userDict valueForKey:@"countValue"] intValue]];
        countValueLabel.text = countValue;
    }
    */
    nickNameLabel.text = [users getNickName];
    updatedLabel.text = [self stringFromTime:[users getUpdated_at]];

    //
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
            //[cell.imageView reloadInputViews];
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
    if ([[segue identifier] isEqualToString:@"HistoryToAccountDetail"]) {
        // NSLog(@"FriendToAccountDetail");
        NSIndexPath* indexPath = self.tblView.indexPathForSelectedRow;
        
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

- (NSString *)stringFromTime:(NSString *)updated_at {
    if(updated_at == nil || [updated_at isEqual:[NSNull null]]){ return @""; }
    //NSString *datetimeString = @"2009-12-15T20:00:00+09:00";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:DATEFORMAT_UTC];
    NSDate *updateTime = [dateFormatter dateFromString:updated_at];
    
    
    NSDate* now = [NSDate date];
    float date_a = [now timeIntervalSinceDate:updateTime];
    
    NSInteger ti = (NSInteger)date_a;
    //NSLog(@"ti: %d", ti);
    //NSInteger sec = ti % 60;
    NSInteger min = (ti / 60) % 60;
    NSInteger hour = (ti / 3600);
    //NSLog(@"%02d:%02d:%02d", hour, min, sec);
    
    NSString* retString;
    
    if([currentLanguage isEqualToString:@"ja"]){
        if(hour == 0){
            if(min == 0){
                retString = [NSString stringWithFormat:@"%@", @"たった今"];
            }else{
                retString = [NSString stringWithFormat:@"%d%@", min, @"分前"];
            }
        }else if(hour >= 1 && hour <=24){
            retString = [NSString stringWithFormat:@"%d%@", hour, @"時間前"];
        }else if(hour > 24 && (hour / 24) <= 365 ){
            retString = [NSString stringWithFormat:@"%d%@", (hour / 24) + 1, @"日前"];
        }else{
            retString = [NSString stringWithFormat:@"%@", @"1年以上前"];
        }
    }else{ // if([currentLanguage isEqualToString:@"en"]){
        if(hour == 0){
            if(min == 0){
                retString = [NSString stringWithFormat:@"%@", @"Now"];
            }else{
                retString = [NSString stringWithFormat:@"%d%@", min, @"m ago"];
            }
        }else if(hour >= 1 && hour <=24){
            retString = [NSString stringWithFormat:@"%d%@", hour, @"h ago"];
        }else if(hour > 24 && (hour / 24) <= 365 ){
            retString = [NSString stringWithFormat:@"%d%@", (hour / 24) + 1, @"d ago"];
        }else{
            retString = [NSString stringWithFormat:@"%@", @"over 1 year"];
        }
    }
    
    return retString;
    //[NSString stringWithFormat:@"%02i:%02i:%02i", hours, minutes, seconds];
}


- (void)toNotifyTheGetMyHistory:(NSNotification *)notification
{
    historyCollections = [[notification object] mutableCopy];
    historyCollections = [self sortArrayLastLoginTime:historyCollections];
    
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
    
    if ([segue.identifier isEqualToString:@"HistoryToAccountDetail"]) {
        NSIndexPath* idxPath = self.tblView.indexPathForSelectedRow;
        NSDictionary* userInfoDict = [historyCollections[idxPath.row] mutableCopy];
        NSString* userId = [userInfoDict valueForKey:@"email"];
        
        AccountDetailViewController *detailView = segue.destinationViewController;
        detailView.userId = userId; //.mDict = [_mmDict copy];
    }
}

@end
