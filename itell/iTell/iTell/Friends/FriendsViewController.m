//
//  FriendsViewController.m
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendData.h"
#import "FriendsViewCell.h"
#import "ITMarco.h"
#import "JSON.h"
#import "FriendsListViewController.h"
#import "ProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Global.h"
#import "AppDelegate.h"
#import "SendContact.h"
#import "MPFoldTransition.h"


#import "SendInviteController.h"

#define kTargetGetListInviteFriend @"getListInvite"
#define kTagErrorGetListInvite 103

#define kTargetGetContactNotFriend @"getCtNotFriend"
#define kTagErrorGetContNotFriend 104

#define kTargetSearchFriend @"searchFriend"
#define kTagErrorSearchFriend 120

@interface FriendsViewController ()
@property(nonatomic, retain)NSMutableArray *friends;
@property(nonatomic, copy)NSMutableArray *displayFriends;
@property(nonatomic, retain)ApiRequest *apiRequest;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *btFriendsList;
@property(nonatomic, retain)SendContact *contactSender;

- (IBAction)btFriendListPressed:(id)sender;
+ (NSArray*)arraySearchFriendsWithArray:(NSArray*)arrData;
-(void)appendArraySearchFriend:(NSArray*)arr;
-(void)searchFriendComplete:(NSArray*)arr;
-(void)checkSendContact;

@end

// check push contact -> get invite friends -> getFriend

@implementation FriendsViewController
@synthesize btFriendsList;
@synthesize table;
@synthesize searchFriendControl;
@synthesize sbSearchBar;
@synthesize svInvite;
@synthesize friends, displayFriends;
@synthesize apiRequest;
@synthesize contactSender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void)clearCache{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

+(NSArray*)arrayFriendsWithArray:(NSArray*)arrData{
    NSMutableArray *arr = [[[NSMutableArray alloc] initWithCapacity:[arrData count]] autorelease];

    for(int i = 0; i<[arrData count]; i++){
        NSDictionary *dic = [arrData objectAtIndex:i];
        FriendData *person = [[FriendData alloc] init];
        person.userID = [[dic objectForKey:@"friend_id"] intValue];
        person.name = [dic objectForKey:@"friend_nick"];
        person.urlAvatar = [dic objectForKey:@"friend_avatar"];
        person.friendStatus = kFriendStatusInviteMe;
        [arr addObject:person];
        [person release];
    }
    return arr;
}

#pragma mark - contact
- (IBAction)sendContact:(id)sender {
    if (self.contactSender == nil) {
        contactSender = [[SendContact alloc] init];
        contactSender.delegate = self;
    }
    [[AppDelegate instance] showBusyView:YES withText:@"Sending"];
    [contactSender sendContact];
}
-(void)checkSendContact{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if (![[user objectForKey:kKeySendContact] boolValue]) {
        [user setObject:[NSNumber numberWithBool:YES] forKey:kKeySendContact];
        [user synchronize];
        
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Do you want to sent contact to server?" message:nil delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
        al.tag = kTagSendContact;
        [al show];
        [al release];
    }else {
        [self getFriendListInvite];
    }
}

-(void)sendContactComplete:(id)sender{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send complete" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    [al release];
    [[AppDelegate instance] showBusyView:NO withText:nil];
    [self getFriendListInvite];
}
-(void)sendContactError:(id)sender{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send error" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    [al release];
    [[AppDelegate instance] showBusyView:NO withText:nil];
    [self getFriendListInvite];
}


+(NSArray*)arrayContNotFriendsWithArray:(NSArray*)arrData{
    NSMutableArray *arr = [[[NSMutableArray alloc] initWithCapacity:[arrData count]] autorelease];
    
    /*{
        id,
        name,
        mobile_num,
        email
    }//*/
    
    for(int i = 0; i<[arrData count]; i++){
        NSDictionary *dic = [arrData objectAtIndex:i];
        FriendData *person = [[FriendData alloc] init];
        person.userID = [[dic objectForKey:@"id"] intValue];
        person.name = [dic objectForKey:@"name"];
        person.urlAvatar = [dic objectForKey:@"friend_avatar"];
        person.friendStatus = kFriendStatusNoFriend;
        [arr addObject:person];
        [person release];
    }
    return arr;
}

-(void)appendFriendsArray:(NSArray*)arr{
    if (self.friends == nil) {
        self.friends = [NSMutableArray arrayWithCapacity:[arr count]];
    }
    [friends addObjectsFromArray:arr];
    self.displayFriends = self.friends;
    [self.table reloadData];
}

-(void)getFriendListInvite{
    NSString *uuid = [Global shareGlobal].user.uuid;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *urlStr= [NSString stringWithFormat:@"%@friend/get_list_invite?user_id=%d&uuid=%@", SERVER_URL, userId, uuid];
    ITLOG(@"URl = %@", urlStr);
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetGetListInviteFriend];
    
    [apiRequest requestUsingGetMethod:urlStr];
    
    [[AppDelegate instance] showBusyView:YES withText:@"Loading..."];
    
}
-(void)getContactNotFriends{
    NSString *uuid = [Global shareGlobal].user.uuid;
    //[Global shareGlobal].user.userID = 62;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *urlStr= [NSString stringWithFormat:@"%@friend/get_contacts_not_friend", SERVER_URL];
    ITLOG(@"URl = %@", urlStr);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"%d", userId], @"user_id",
                         uuid, @"uuid",
                         [NSString stringWithFormat:@"%d", pageContactNotFriend], @"page", nil];
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetGetContactNotFriend];
    
    [apiRequest requestUsingPostMethod:urlStr postData:dic];
    
    [[AppDelegate instance] showBusyView:YES withText:@"Loading..."];
}
-(void)searchFriendWithString:(NSString*)text{
    NSString *uuid = [Global shareGlobal].user.uuid;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *urlStr= [NSString stringWithFormat:@"%@friend/search_friend", SERVER_URL];
    ITLOG(@"URl = %@", urlStr);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"%d", userId], @"user_id",
                         uuid, @"uuid",
                         text, @"keyword",
                         [NSString stringWithFormat:@"%d", pageSearchFriend], @"page", nil];
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetSearchFriend];
    
    [apiRequest requestUsingPostMethod:urlStr postData:dic];
    
    [[AppDelegate instance] showBusyView:YES withText:@"Loading..."];
}

#pragma mark - api delegate
-(BOOL)isErrorDictionData:(NSDictionary*)dictionData tagError:(int)tagErr{
    if (dictionData == nil) {
        ITLOG(@"dicData is nil");
        return YES;
    }
    NSNumber *retval = [dictionData objectForKey:@"retval"];
    if (![retval boolValue]) {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:[dictionData objectForKey:@"error_msg"] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        al.tag = kTagErrorGetListInvite;
        [al show];
        [al release];
        ITLOGERROR(@"Error %@",[dictionData objectForKey:@"error_msg"]);
        return YES;
    }
    return NO;
}

#pragma mark Friendsearch
-(void)searchFriendComplete:(NSMutableArray *)arr{
    self.displayFriends = arr;
    [searchFriendControl.searchResultsTableView reloadData];
}
-(void)appendArraySearchFriend:(NSArray *)arr{
    if (self.displayFriends == nil) {
        self.displayFriends = [NSMutableArray arrayWithCapacity:[arr count]];
    }
    [displayFriends addObjectsFromArray:arr];
    [searchFriendControl.searchResultsTableView reloadData];
}
+(NSMutableArray*)arraySearchFriendsWithArray:(NSArray *)arrData{
    /*{
        id,
        nick,
        avatar,
        longitude,
        latitude,
        gender,
        itell,
        itell_start,
    }*/
    NSMutableArray *arr = [[[NSMutableArray alloc] initWithCapacity:[arrData count]] autorelease];
    
    for(int i = 0; i<[arrData count]; i++){
        NSDictionary *dic = [arrData objectAtIndex:i];
        FriendData *person = [[FriendData alloc] init];
        person.userID = [[dic objectForKey:@"id"] intValue];
        person.name = [dic objectForKey:@"nick"];
        person.urlAvatar = [dic objectForKey:@"avatar"];
        [arr addObject:person];
        [person release];
    }
    
    return arr;
}

-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    
    if ([target isEqualToString:kTargetGetListInviteFriend]) {
        if ([self isErrorDictionData:dictionData tagError:kTagErrorGetListInvite]) {
            [self getContactNotFriends];
            return;
        }else {
            [self appendFriendsArray:[FriendsViewController arrayFriendsWithArray:[dictionData objectForKey:@"invite_data"]]];
            [self getContactNotFriends];
        }
        
    }else if ([target isEqualToString:kTargetGetContactNotFriend]) {
        if ([self isErrorDictionData:dictionData tagError:kTagErrorGetContNotFriend]) {
            return;
        }
        /*
         { retval: true,
         user_id: user_id,
         current_page,
         total_page,
         total_found,
         contacts: []
         time_stamp: curr_time }  
         //*/
        pageContactNotFriendTotal = [[dictionData objectForKey:@"total_page"] intValue];
        pageContactNotFriend = [[dictionData objectForKey:@"current_page"] intValue];
        [self appendFriendsArray:[FriendsViewController arrayFriendsWithArray:[dictionData objectForKey:@"contacts"]]];
        
        [[AppDelegate instance] showBusyView:NO withText:nil];
        
    }
    else if ([target isEqualToString:kTargetSearchFriend]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        if ([self isErrorDictionData:dictionData tagError:kTagErrorSearchFriend]) {
            return;
        }
        
        
        [self searchFriendComplete:[FriendsViewController arraySearchFriendsWithArray:[dictionData objectForKey:@"friend_data"]]];
    }
}


-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    [[AppDelegate instance] showBusyView:NO withText:nil];
    if ([target isEqualToString:kTargetSearchFriend]) {
        ITLOG(@"Error getListInvite");
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"FriendsTitle", @"title")];
    self.navigationItem.rightBarButtonItem = btFriendsList;
    [self.navigationController setNavigationBarHidden:YES];
    svInvite.contentSize = CGSizeMake(321, 65);
    pageContactNotFriend = 1;
    pageSearchFriend = 1;
    [self checkSendContact];
    //sbSearchBar.backgroundImage = [UIImage imageNamed:@"search-box.png"];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [self setBtFriendsList:nil];
    [self setSearchFriendControl:nil];
    [self setSbSearchBar:nil];
    [self setSvInvite:nil];
    [super viewDidUnload];
}

#pragma mark table view delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (table == tableView) {
        return [self.friends count];
    }else {
        return [self.displayFriends count];
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"FriendsViewCell";
    FriendsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
    }
    FriendData *friend;
    if(tableView == table){
        friend = [friends objectAtIndex:[indexPath row]];
    }else {
        friend = [displayFriends objectAtIndex:[indexPath row]];
    }
    cell.controller = self;
    [cell configWithUser:friend];
    NSString *bgName = [NSString stringWithFormat:@"%@%d.png", kNameBgCell, [indexPath row]%kCountBgCell + kMinBgCell];
    [cell.bgImage setImage:[UIImage imageNamed:bgName]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

//-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return NSLocalizedString(@"FriendsHeader", @"header") ;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UserData *friend;
//    if (tableView == table) {
//        friend = [friends objectAtIndex:[indexPath row]];
//    }else {
//        friend = [displayFriends objectAtIndex:[indexPath row]];
//    }
//    ProfileViewController *profile = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
//    profile.userData = friend;
//    [self.navigationController pushViewController:profile animated:YES];
//    [profile release];
}

#pragma search bar delegate

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return TRUE;
}

#pragma mark - search display control
- (void)filterContentForSearchText:(NSString*)searchText 
                             scope:(NSString*)scope
{
//    NSPredicate *resultPredicate = [NSPredicate 
//                                    predicateWithFormat:@"userName contains[cd] %@",
//                                    searchText];
    
    //self.displayFriends = [self.friends filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller 
shouldReloadTableForSearchString:(NSString *)searchString
{
//    [self filterContentForSearchText:searchString 
//                               scope:nil];
    
    return NO;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller 
shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    return NO;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    pageSearchFriend = 1;
    [self searchFriendWithString:searchBar.text];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [table release];
    [displayFriends release];
    [btFriendsList release];
    [searchFriendControl release];
    [sbSearchBar release];
    [svInvite release];
    [super dealloc];
}
- (IBAction)btFriendListPressed:(id)sender {
    FriendsListViewController *friendsViewController = [[[FriendsListViewController alloc] initWithNibName:@"FriendsListViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:friendsViewController animated:YES];
}

#pragma mark Swipe cell

#pragma mark ScrollView
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView == svInvite) {
        float x = svInvite.contentOffset.x;
        if (x<-80) {
            SendInviteController *sendInvite = [[SendInviteController alloc] initWithNibName:@"SendInviteController" bundle:nil];
            [self.navigationController pushViewController:sendInvite foldStyle:MPFoldStyleFlipFoldBit(MPFoldStyleCubic)];
            [sendInvite release];
        }
    }
}

#pragma mark alert view
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (alertView.tag) {
        case kTagSendContact:
            if (buttonIndex == 0) {
                [self sendContact:nil];
            }else {
                [self getFriendListInvite];
            }
            break;
            
        default:
            break;
    }
}
@end
