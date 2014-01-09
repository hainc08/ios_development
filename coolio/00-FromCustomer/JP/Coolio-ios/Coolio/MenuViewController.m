//
//  MenueViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/03/23.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize chatSumBadgeCount = _chatSumBadgeCount;
@synthesize friendRequestBadgeCount = _friendRequestBadgeCount;
@synthesize matchBadgeCount = _matchBadgeCount;
@synthesize footPrintBadgeCount = _footPrintBadgeCount;
@synthesize alertBadgeCount = _alertBadgeCount;
@synthesize infomationBadgeCount = _infomationBadgeCount;

@synthesize navigationBar;
@synthesize tblView;
@synthesize idMemberCell;
@synthesize sectionItems;
@synthesize meetItems;
@synthesize chatItems;
@synthesize notificationItems;
@synthesize alertItems;
@synthesize settingsItems;
@synthesize sectionHeaderHeight;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self openPasscodeView];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheUnreadCount:) name:@"ToNotifyTheUnreadCount" object:nil];

    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    
    NSString* menuMeet = NSLocalizedString(@"MENU_SECTIONITEM_MEET", nil);
    NSString* menuChat = NSLocalizedString(@"MENU_SECTIONITEM_CHAT", nil);
    NSString* menuNotice = NSLocalizedString(@"MENU_SECTIONITEM_NOTICE", nil);
    NSString* menuAlert = NSLocalizedString(@"MENU_SECTIONITEM_ALERT", nil);
    NSString* menuSpace = NSLocalizedString(@"MENU_SECTIONITEM_GENERAL", nil);
    
    self.sectionItems = @[menuMeet, menuChat, menuNotice, menuAlert, menuSpace];

    [self.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationBar setTranslucent:YES];
    [self.navigationBar setTintColor:[UIColor colorWithRed:63.0f green:58.0f blue:57.0f alpha:1.0f]];
    [self.navigationBar setBackgroundColor:[UIColor colorWithRed:63.0f green:58.0f blue:57.0f alpha:1.0f]];
    
    //Section items row count parameter.
    self.meetItems = @[@"Member", @"MyFriends", @"SilentMatch", @"History"];
    self.chatItems = @[@"Chat"];
    self.notificationItems = @[@"Friends", @"Match", @"Footprints"];
    self.alertItems = @[@"Alert"];
    self.settingsItems = @[@"Information", @"Settings", @"PassLock", @"Term&Policy", @"Unsubscribe", @"Logout"];
    
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    //[self updateVisibleCells];
    [self.tblView reloadData];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    /*
     retHash['friendRequestCount'] = 0
     retHash['matchCount'] = 0
     retHash['footPrintCount'] = 0
     retHash['alertCount'] = 0
     retHash['infomationCount'] = 0
     retHash['chatSumCount'] = 0
     */
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 0;
    switch (section) {
        case 0:
            return  self.meetItems.count;
            break;
        case 1:
            return  self.chatItems.count;
            break;
        case 2:
            return  self.notificationItems.count;
            break;
        case 3:
            return  self.alertItems.count;
            break;
        case 4:
            return self.settingsItems.count;
            break;
        default:
            return  self.meetItems.count;
            break;
    }
}

/*
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    headerView.backgroundColor = [UIColor colorWithRed:200.0f green:200.0f blue:90.0f alpha:1.0f];
    //headerView.backgroundColor = [UIColor redColor];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 20.0f)];
    lbl.backgroundColor = [UIColor colorWithRed:200.0f green:200.0f blue:90.0f alpha:1.0f];
    //lbl.textColor = [UIColor whiteColor];
    
    NSString* labelText = nil;
    switch (section) {
        case 0:
            labelText = [self.sectionItems objectAtIndex:section];
            break;
        case 1:
            labelText = [self.sectionItems objectAtIndex:section];
            break;
        case 2:
            labelText = [self.sectionItems objectAtIndex:section];
            break;
        case 3:
            labelText = [self.sectionItems objectAtIndex:section];
            break;
        case 4:
            labelText = [self.sectionItems objectAtIndex:section];
            break;
        default:
            labelText = [self.sectionItems objectAtIndex:0];
            break;
    }
    lbl.text = labelText;
    
    [v addSubview:lbl];
    return headerView;

}
*/

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return (self.sectionItems)[section];
            break;
        case 1:
            return (self.sectionItems)[section];
            break;
        case 2:
            return (self.sectionItems)[section];
            break;
        case 3:
            return (self.sectionItems)[section];
            break;
        case 4:
            return (self.sectionItems)[section];
            break;
        default:
            return (self.sectionItems)[0];
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y<=self.sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=self.sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-self.sectionHeaderHeight, 0, 0, 0);
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
/*
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.contentView.backgroundColor = [UIColor colorWithRed:52.0f green:53.0f blue:52.0f alpha:1.0f];
    cell.backgroundView.backgroundColor = [UIColor colorWithRed:52.0f green:53.0f blue:52.0f alpha:1.0f];
    cell.backgroundColor = [UIColor colorWithRed:52.0f green:53.0f blue:52.0f alpha:1.0f];
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil;

    switch (indexPath.section) {
        // Meet Section
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idMemberCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idMemberCell];
                    }
                    break;
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idMyFriendCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idMyFriendCell];
                    }
                    break;
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idSilentMatchCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idSilentMatchCell];
                    }
                    break;
                case 3:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idHistoryCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idHistoryCell];
                    }
                    break;
                default:
                    break;
            }
            break;
        // Chat Section
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idChatCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idChatCell];
                    }
                    break;
                default:
                    break;
            }
            break;
        // Notification Section
        case 2:
            switch (indexPath.row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idFriendNotificationCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idFriendNotificationCell];
                    }
                    break;
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idMatchNotificationCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idMatchNotificationCell];
                    }
                    break;
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idFootprintNotificationCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idFootprintNotificationCell];
                    }
                    break;
                    
                default:
                    break;
            }
            break;
        // Alert Section
        case 3:
            switch (indexPath.row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idAlertCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idAlertCell];
                    }
                    break;
                    
                default:
                    break;
            }
            break;
        // Settings Section
        case 4:
            switch (indexPath.row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idInfoCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idInfoCell];
                    }
                    break;
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idSettingCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idSettingCell];
                    }
                    break;
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idPassLockCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idPassLockCell];
                    }
                    break;
                case 3:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idLogoutCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idLogoutCell];
                    }
                    break;
                case 4:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idTermPolicyCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idTermPolicyCell];
                    }
                    break;
                case 5:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idUnsubCell];
                    if (cell == nil) {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.idUnsubCell];
                    }
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    
    
    UIImageView* cellIcon = (UIImageView *)[cell viewWithTag:1];
    UILabel* cellLabel = (UILabel *)[cell viewWithTag:2];
    UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];

    img_notifiIcon.image = nil;
    
    switch (indexPath.section) {
            // Meet Section
        case 0:
            switch (indexPath.row) {
                case 0:
                    cellLabel.text = NSLocalizedString(@"MENU_MEMBER", nil);// @"Member";
                    cellIcon.image = [UIImage imageNamed:@"Member"];
                    break;
                case 1:
                    cellLabel.text = NSLocalizedString(@"MENU_MYFRIENDS", nil);//@"MyFriends";
                    cellIcon.image = [UIImage imageNamed:@"MyFriends"];
                    break;
                case 2:
                    cellLabel.text = NSLocalizedString(@"MENU_SILENTMATCH", nil);//@"SilentMatch";
                    cellIcon.image = [UIImage imageNamed:@"SilentMatch"];
                    break;
                case 3:
                    cellLabel.text = NSLocalizedString(@"MENU_HISTORY", nil);//@"History";
                    cellIcon.image = [UIImage imageNamed:@"History"];
                    break;
                default:
                    break;
            }
            break;
            // Chat Section
        case 1:
            switch (indexPath.row) {
                case 0:
                    cellLabel.text = NSLocalizedString(@"MENU_CHAT", nil);//@"Chat";
                    cellIcon.image = [UIImage imageNamed:@"Chat"];
                    if(self.chatSumBadgeCount > 0){
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = [self cellNotifiNumberIcon:self.chatSumBadgeCount];
                    }else{
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = nil;
                    }
                    break;
                default:
                    break;
            }
            break;
            // Notification Section
        case 2:
            switch (indexPath.row) {
                case 0:
                    cellLabel.text = NSLocalizedString(@"MENU_FRIENDS", nil);//@"Friends";
                    cellIcon.image = [UIImage imageNamed:@"Friends"];
                    if(self.friendRequestBadgeCount > 0){
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = [self cellNotifiNumberIcon:self.friendRequestBadgeCount];
                    }else{
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = nil;
                    }

                    break;
                case 1:
                    cellLabel.text = NSLocalizedString(@"MENU_MATCH", nil);//@"Match";
                    cellIcon.image = [UIImage imageNamed:@"Match"];
                    if(self.matchBadgeCount > 0){
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = [self cellNotifiNumberIcon:self.matchBadgeCount];
                    }else{
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = nil;
                    }

                    break;
                case 2:
                    cellLabel.text = NSLocalizedString(@"MENU_FOOTPRINT", nil);//@"FootPrint";
                    cellIcon.image = [UIImage imageNamed:@"FootPrint"];
                    if(self.footPrintBadgeCount > 0){
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = [self cellNotifiNumberIcon:self.footPrintBadgeCount];
                    }else{
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = nil;
                    }

                    break;
                    
                default:
                    break;
            }
            break;
            // Alert Section
        case 3:
            switch (indexPath.row) {
                case 0:
                    cellLabel.text = NSLocalizedString(@"MENU_ALERT", nil);//@"Alert";
                    cellIcon.image = [UIImage imageNamed:@"Alert"];
                    if(self.alertBadgeCount > 0){
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = [self cellNotifiNumberIcon:self.alertBadgeCount];
                        isAlertGlobal = NO;
                    }else{
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = nil;
                    }
                    break;
                    
                default:
                    break;
            }
            break;
            // Settings Section
        case 4:
            switch (indexPath.row) {
                case 0:
                    cellLabel.text = NSLocalizedString(@"MENU_INFORMATION", nil);//@"Information";
                    cellIcon.image = [UIImage imageNamed:@"Information"];
                    if(self.infomationBadgeCount> 0){
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = [self cellNotifiNumberIcon:self.infomationBadgeCount];
                        isInfoGlobal = NO;
                    }else{
                        //UIImageView* img_notifiIcon = (UIImageView*)[cell viewWithTag:3];
                        img_notifiIcon.image = nil;
                    }
                    break;
                case 1:
                    cellLabel.text = NSLocalizedString(@"MENU_SETTINGS", nil);//@"Settings";
                    cellIcon.image = [UIImage imageNamed:@"Settings"];
                    break;
                case 2:
                    cellLabel.text = NSLocalizedString(@"MENU_PASSLOCK", nil);//@"PassLock";
                    cellIcon.image = [UIImage imageNamed:@"PassLock"];
                    break;
                case 3:
                    cellLabel.text = NSLocalizedString(@"MENU_LOGOUT", nil);//@"Logout";
                    cellIcon.image = [UIImage imageNamed:@"Logout"];
                    break;
                case 4:
                    cellLabel.text = NSLocalizedString(@"MENU_TERMPOLICY", nil);//@"Term&Policy";
                    cellIcon.image = [UIImage imageNamed:@"TermPolicy"];
                    break;
                case 5:
                    cellLabel.text = NSLocalizedString(@"MENU_UNSUB", nil);//@"Unsubscribe";
                    cellIcon.image = [UIImage imageNamed:@"Unsubscribe"];
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    /*
    cell.contentView.backgroundColor = [UIColor colorWithRed:52.0f green:53.0f blue:52.0f alpha:1.0f];
    cell.backgroundView.backgroundColor = [UIColor colorWithRed:52.0f green:53.0f blue:52.0f alpha:1.0f];
    cell.backgroundColor = [UIColor colorWithRed:52.0f green:53.0f blue:52.0f alpha:1.0f];
    */
    //[cell reloadInputViews];
    [img_notifiIcon reloadInputViews];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier;
    UIActionSheet* logOutSheet;
    
    switch (indexPath.section) {
        //Member views
        case 0:
            switch (indexPath.row) {
                case 0:
                    identifier = @"member";
                    break;
                case 1:
                    identifier = @"myfrends";
                    break;
                case 2:
                    identifier = @"silentmatch";
                    break;
                case 3:
                    identifier = @"history";
                    break;
                default:
                    break;
            }
            break;
        //Chat views
        case 1:
            switch (indexPath.row) {
                case 0:
                    identifier = @"chat";
                    break;
                    
                default:
                    break;
            }
            break;
        //Notification views
        case 2:
            switch (indexPath.row) {
                case 0:
                    identifier = @"friendnotification";
                    break;
                case 1:
                    identifier = @"matchnotification";
                    break;
                case 2:
                    identifier = @"footprintsnotification";
                    break;
                default:
                    break;
            }
            break;
        //Alert
        case 3:
            switch (indexPath.row) {
                case 0:
                    identifier = @"alert";
                    break;
                    
                default:
                    break;
            }
            break;
        //Settings views
        case 4:
            switch (indexPath.row) {
                case 0:
                    identifier = @"information";
                    break;
                case 1:
                    identifier = @"settings";
                    break;
                case 2:
                    identifier = @"passlock";
                    break;
                case 3:
                    logOutSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) destructiveButtonTitle:NSLocalizedString(@"LOGOUT_BUTTON", nil) otherButtonTitles:nil, nil];
                    [logOutSheet showInView:self.view];
                    break;
                case 4:
                    identifier = @"termpolicy";
                    break;
                case 5:
                    identifier = @"unsubscribe";
                    break;
                 default:
                    break;
            }
            break;
        default:
            identifier = @"";
            break;
    }
    
    if([identifier length] > 0){
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newTopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];
        }];

    }

}


#pragma mark - UIActionSheet Delegate
-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            MySession* session = [[MySession alloc] init];
            [session doLogOut:YES];
            
            [self performSelector:@selector(aaa) withObject:nil afterDelay:0.5];
        }
            break;
            
        default:
            break;
    }
}

-(void)aaa
{
    [self.slidingViewController resetTopView];
    
    LoginViewController* loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
    [self presentViewController:loginView animated:YES completion:nil];
}

-(UIImage *)cellNotifiNumberIcon:(int)i
{
    NSString* fileName = nil;
    
    if(i >= 20){
        fileName = @"20";
    }else{
        fileName = [NSString stringWithFormat:@"%d", i];
    }
    return [UIImage imageNamed:fileName];
}

-(void)toNotifyTheUnreadCount:(NSNotification *)notification
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSDictionary* _unreadCountDict = [[notification object] mutableCopy];
    //NSLog(@"UnReadCount: %@", _unreadCountDict);
        
    self.chatSumBadgeCount = [[_unreadCountDict valueForKey:@"chatSumCount"] intValue];
    self.friendRequestBadgeCount = [[_unreadCountDict valueForKey:@"friendRequestCount"] intValue];
    self.matchBadgeCount = [[_unreadCountDict valueForKey:@"matchCount"] intValue];
    self.footPrintBadgeCount = [[_unreadCountDict valueForKey:@"footPrintCount"] intValue];
    self.alertBadgeCount = [[_unreadCountDict valueForKey:@"alertCount"] intValue];
    self.infomationBadgeCount = [[_unreadCountDict valueForKey:@"infomationCount"] intValue];
    
}

@end
