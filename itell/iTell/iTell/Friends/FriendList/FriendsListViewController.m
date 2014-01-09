//
//  FriendsListViewController.m
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendsListViewController.h"
#import "UserData.h"
#import "FriendsViewCell.h"
#import "ProfileViewController.h"
#import "FriendsViewController.h"
#import "JSON.h"
#import "Global.h"
#import "ITMarco.h"
#import "AppDelegate.h"
#import "FriendData.h"

#define kTagErrorGetListFriends 104

@interface FriendsListViewController ()
@property(nonatomic, retain)NSMutableArray *friends;
@property (retain, nonatomic) ApiRequest *apiRequest;
@end

@implementation FriendsListViewController
@synthesize table;
@synthesize friends;
@synthesize apiRequest;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
-(void)createFriendsWithArr:(NSArray*)arrData{
    self.friends = [[[NSMutableArray alloc] initWithCapacity:[arrData count]] autorelease];
    
    
    for(int i = 0; i<[arrData count]; i++){
        
        NSDictionary *dic = [arrData objectAtIndex:i];
        FriendData *person = [[FriendData alloc] init];
        person.userID = [[dic objectForKey:@"friend_id"] intValue];
        person.name = [dic objectForKey:@"friend_nick"];
        person.urlAvatar = [dic objectForKey:@"friend_avatar"];
        [friends addObject:person];
        [person release];
    }
    [self.table reloadData];
}

#pragma mark apiRequestDelegate
-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    if ([target isEqualToString:kTargetGetListFriend]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        if (dictionData == nil) {
            //ITLOGERROR(@"Error");
            return;
        }
        NSNumber *retval = [dictionData objectForKey:@"retval"];
        if (![retval boolValue]) {
            UIAlertView *al = [[UIAlertView alloc] initWithTitle:[dictionData objectForKey:@"error_msg"] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            al.tag = kTagErrorGetListFriends;
            [al show];
            [al release];
            ITLOGERROR(@"Error %@",[dictionData objectForKey:@"error_msg"]);
            return;
        }
        NSArray *arr = [dictionData objectForKey:@"friend_data"];
        [self createFriendsWithArr:arr];
    }
}
-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    if ([target isEqualToString:kTargetGetListFriend]) {
        ITLOGERROR(@"Get error");
        [[AppDelegate instance] showBusyView:NO];
    }
}

-(void)getFriendList{
    NSString *uuid = [Global shareGlobal].user.uuid;
    //[Global shareGlobal].user.userID = 62;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *urlStr= [NSString stringWithFormat:@"%@friend/get_list_friend?user_id=%d&uuid=%@", SERVER_URL, userId, uuid];
    ITLOG(@"URl = %@", urlStr);
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetGetListFriend];
    
    [apiRequest requestUsingGetMethod:urlStr];
    
    [[AppDelegate instance] showBusyView:YES withText:@"Loading..."];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"FriendsListTitle", @"title")];
    [self getFriendList];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    
    [super viewDidUnload];
}

#pragma mark table view delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.friends count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"FriendsViewCell";
    FriendsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
    }
    FriendData *friend;
    friend = [friends objectAtIndex:[indexPath row]];
    
    [cell configWithUser:friend];
    NSString *bgName = [NSString stringWithFormat:@"%@%d.png", kNameBgCell, [indexPath row]%kCountBgCell + kMinBgCell];
    [cell.bgImage setImage:[UIImage imageNamed:bgName]];
    cell.controller = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendData *friend = [friends objectAtIndex:[indexPath row]];
    ProfileViewController *profile = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    profile.userData = friend;
    [self.navigationController pushViewController:profile animated:YES];
    [profile release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [table release];
    [friends release];
    [apiRequest release];
    [super dealloc];
}
- (IBAction)btBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark alertView
-(void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}
@end
