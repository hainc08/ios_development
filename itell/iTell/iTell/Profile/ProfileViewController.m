//
//  ProfileViewController.m
//  iTell
//
//  Created by tranduc on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"
#import "ALTabbarController.h"
#import "ChatViewController.h"
#import "ChattingViewController.h"
#import "ITMarco.h"
#import "Global.h"
#import "ShowImageCell.h"

#define kTargetGetData @"getProfile"
#define kTargetGetAlbum @"getAlbum"
#define kTargetChangeBlock @"changeBlock"
#define kTargetChangeRestricPub @"changeRestrict"

#define kTargetAddFriend @"addFriend"
#define kTagAddFriendError 101

#define kTargetAcceptFriend @"acceptFriend"
#define kTagAcceptFriendError 102


@interface ProfileViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *imImage;
@property (retain, nonatomic) IBOutlet UILabel *lbName;
@property (retain, nonatomic)ApiRequest *apiRequest;

@end

@implementation ProfileViewController
@synthesize imImage;
@synthesize lbName;
@synthesize userData;
@synthesize svChat;
@synthesize csRestrict;
@synthesize csBlock;
@synthesize ivAvatar;
@synthesize ivName;
@synthesize lbSex;
@synthesize lbAge;
@synthesize lbDescription;
@synthesize lbBadgeGood;
@synthesize lbBadgeNormal;
@synthesize lbBadgeBad;
@synthesize tbAlbum;
@synthesize apiRequest;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)getFullData{
    NSString *uuid = [Global shareGlobal].user.uuid;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *urlStr= [NSString stringWithFormat:@"%@profile/get_profile", SERVER_URL];
    ITLOG(@"URl = %@", urlStr);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"%d", userId ], @"user_id",
                         uuid, @"uuid",
                         [NSString stringWithFormat:@"%d", userData.userID], @"friend_id", nil];
    ITLOG(@"dic = %@",dic);
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetGetData];
    
    [apiRequest requestUsingPostMethod:urlStr postData:dic];
    [[AppDelegate instance] showBusyView:YES withText:@"Loading..."];
}
-(void)getAlbum{
    NSString *uuid = [Global shareGlobal].user.uuid;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *urlStr= [NSString stringWithFormat:@"%@setting/get_album", SERVER_URL];
    ITLOG(@"URl = %@", urlStr);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"%d", userId ], @"user_id",
                         uuid, @"uuid",
                         [NSString stringWithFormat:@"%d", userData.userID], @"friend_id", nil];
    ITLOG(@"dic = %@",dic);
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetGetAlbum];
    
    [apiRequest requestUsingPostMethod:urlStr postData:dic];
    [[AppDelegate instance] showBusyView:YES withText:@"Loading..."];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:TRUE];
    self.lbName.text = userData.name;
    if (userData.avatar!= nil) {
        self.imImage.image = userData.avatar;
    }
    self.svChat.contentSize = CGSizeMake(320.6, 54);
    [csBlock setSliderImage:[UIImage imageNamed:@"forbiden_slide.png"]];
    csBlock.delegate = self;
    [csRestrict setSliderImage:[UIImage imageNamed:@"lock_slide.png"]];
    csRestrict.delegate = self;
    [self getFullData];
}

#pragma mark CustomSwitch delegate
-(void)updateChange:(kTypeChange)change{
    NSString *uuid = [Global shareGlobal].user.uuid;
    int userId = [Global shareGlobal].user.userID;

    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"%d", userId], @"user_id",
                         uuid, @"uuid",
                         [NSString stringWithFormat:@"%d", userData.userID], @"friend_id", nil];
    ITLOG(@"dic = %@",dic);
    
    NSString *urlStr;
    if (change == kTypeChangeBlock) {
        if (userData.block) {
            urlStr = [NSString stringWithFormat:@"%@profile/block", SERVER_URL];
        }else {
            urlStr = [NSString stringWithFormat:@"%@profile/unblock", SERVER_URL];
        }
        self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetChangeBlock];
    }else if (change == kTypeChangeRestrict) {
        if (userData.restrictPub) {
            urlStr = [NSString stringWithFormat:@"%@profile/restrict_pub", SERVER_URL];
        }else {
            urlStr = [NSString stringWithFormat:@"%@profile/allow_pub", SERVER_URL];
        }
        
        self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetChangeRestricPub];
    }else {
        return;
    }
    
    [apiRequest requestUsingPostMethod:urlStr postData:dic];
    [[AppDelegate instance] showBusyView:YES withText:@"Sending..."];
}
-(void)valueChanged:(BOOL)switchValue sender:(CustomSwitch *)sender{
    if (sender == csBlock) {
        if (userData.block != switchValue) {
            userData.block = switchValue;
            [self updateChange:kTypeChangeBlock];
        }
        
    }else if (sender == csRestrict) {
        if (userData.restrictPub != switchValue) {
            userData.restrictPub = switchValue;
            [self updateChange:kTypeChangeRestrict];
        }

    }
}


- (void)viewDidUnload
{
    [self setImImage:nil];
    [self setLbName:nil];
    [self setSvChat:nil];
    [self setCsRestrict:nil];
    [self setCsBlock:nil];
    [self setIvAvatar:nil];
    [self setIvName:nil];
    [self setLbSex:nil];
    [self setLbAge:nil];
    [self setLbDescription:nil];
    [self setLbBadgeGood:nil];
    [self setLbBadgeNormal:nil];
    [self setLbBadgeBad:nil];
    [self setTbAlbum:nil];
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc{
    [imImage release];
    [lbName release];
    [svChat release];
    [apiRequest release];
    [csRestrict release];
    [csBlock release];
    [ivAvatar release];
    [ivName release];
    [lbSex release];
    [lbAge release];
    [lbDescription release];
    [lbBadgeGood release];
    [lbBadgeNormal release];
    [lbBadgeBad release];
    [tbAlbum release];
    [super dealloc];
    [userData release];
}
-(void)inviteFriend{
    NSString *uuid = [Global shareGlobal].user.uuid;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *urlStr= [NSString stringWithFormat:@"%@profile/send_invite", SERVER_URL];
    ITLOG(@"URl = %@", urlStr);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"%d", userId], @"user_id",
                         uuid, @"uuid",
                         [NSString stringWithFormat:@"%d", userData.userID], @"friend_id", nil];
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetAddFriend];
    
    [apiRequest requestUsingPostMethod:urlStr postData:dic];
    [[AppDelegate instance] showBusyView:YES withText:@"Sending..."];
}
-(void)acceptFriend{
    NSString *uuid = [Global shareGlobal].user.uuid;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *urlStr= [NSString stringWithFormat:@"%@friend/accept_invite", SERVER_URL];
    ITLOG(@"URl = %@", urlStr);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"%d", userId], @"user_id",
                         uuid, @"uuid",
                         [NSString stringWithFormat:@"%d", userData.userID], @"invite_id", nil];
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetAcceptFriend];
    
    [apiRequest requestUsingPostMethod:urlStr postData:dic];
    [[AppDelegate instance] showBusyView:YES withText:@"Sending..."];
}

- (IBAction)addFriendsBtPressed:(id)sender {
    if (userData.friendStatus == kFriendStatusInviteMe) {
        [self acceptFriend];
    }else {
        [self inviteFriend];
    }
}

- (IBAction)btChatPressed:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    ALTabbarController *tabbar = appDelegate.tabBarController;
    UIViewController *chatViewController = tabbar.chatViewController;
    UINavigationController *naviChatViewController = chatViewController.navigationController;
    if ([chatViewController isKindOfClass:[ChatViewController class]] ) {
        ITLOG(@"chatView class");
        [naviChatViewController popToRootViewControllerAnimated:NO];
        ChattingViewController *chatting = [[[ChattingViewController alloc]chattingWithUser:self.userData] autorelease];
        [naviChatViewController pushViewController:chatting animated:YES];
        [tabbar gotoTabBarIndex:3];
        
    }
    
}

#pragma mark - ScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    ITLOG(@"isDecelerate = %d", decelerate);
    float x = scrollView.contentOffset.x;
    if (scrollView == svChat && x<-80) {
        [self btChatPressed:nil];
    }    
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}

- (IBAction)btBackPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

#pragma mark - apidelegate
-(BOOL)isErrorDictionData:(NSDictionary*)dictionData tagError:(int)tagErr{
    if (dictionData == nil) {
        ITLOG(@"dicData is nil");
        return YES;
    }
    NSNumber *retval = [dictionData objectForKey:@"retval"];
    if (![retval boolValue]) {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:[dictionData objectForKey:@"error_msg"] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        al.tag = tagErr;
        [al show];
        [al release];
        ITLOGERROR(@"Error %@",[dictionData objectForKey:@"error_msg"]);
        return YES;
    }
    return NO;
}
-(void)resetStatus{
    lbName.text = userData.nick;
    if (userData.gender) {
        lbSex.text = @"Male";
    }else {
        lbSex.text = @"Female";
    }
    lbDescription.text = userData.desc;
    lbAge.text = @"25";
    lbBadgeGood.text = [NSString stringWithFormat:@"%d", userData.badgeGood];
    lbBadgeNormal.text = [NSString stringWithFormat:@"%d", userData.badgeNormal];
    lbBadgeBad.text = [NSString stringWithFormat:@"%d", userData.badgeBad];
    
    [csBlock delegateCallOn:userData.block];
    [csRestrict delegateCallOn:userData.restrictPub];
}

-(void)reverstRestrict{
    userData.restrictPub = !userData.restrictPub;
    [csRestrict delegateCallOn:userData.restrictPub];
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Update strict public status error" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    [al release];
}
-(void)reverstBlock{
    userData.block = !userData.block;
    [csBlock delegateCallOn:userData.block];
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Update block status error" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    [al release];
}
-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    
    [[AppDelegate instance] showBusyView:NO
                                withText:nil];
    if ([target isEqualToString:kTargetAddFriend]) {
        if ([self isErrorDictionData:dictionData tagError:kTagAddFriendError]) {
            return;
        }
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send Complete" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
        [al release];
    }else if ([target isEqualToString:kTargetAcceptFriend]) {
        if ([self isErrorDictionData:dictionData tagError:kTagAcceptFriendError]) {
            return;
        }
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Accepted" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
        [al release];
    }else if ([target isEqualToString:kTargetGetData]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        if ([self isErrorDictionData:dictionData tagError:0]) {
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }
        NSDictionary *dic = [dictionData objectForKey:@"user_data"];
        [userData setFriendData:dic];
        [self resetStatus];
        [self getAlbum];
    }else if ([target isEqualToString:kTargetGetAlbum]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        if ([self isErrorDictionData:dictionData tagError:0]) {
            return;
        }
        NSArray *arr = [dictionData objectForKey:@"album"];
        [userData setAlbumData:arr];
        [tbAlbum reloadData];
    }else if ([target isEqualToString:kTargetChangeBlock]) {
        if ([self isErrorDictionData:dictionData tagError:0]) {
            [self reverstBlock];
        }else {
            UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send Complete" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [al show];
            [al release];
        }
    }else if ([target isEqualToString:kTargetChangeRestricPub]) {
        if ([self isErrorDictionData:dictionData tagError:0]) {
            [self reverstRestrict];
        }else {
            UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send Complete" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [al show];
            [al release];
        }
    }
    
}
-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    [[AppDelegate instance] showBusyView:NO
                                withText:nil];
    if ([target isEqualToString:kTargetAddFriend] ||[target isEqualToString:kTargetAcceptFriend] ) {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send Error" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
        [al release];
    }else if ([target isEqualToString:kTargetGetData] || [target isEqualToString:kTargetGetAlbum]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        [self.navigationController popViewControllerAnimated:YES];
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Get data error" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
        [al release];
    }else if ([target isEqualToString:kTargetChangeRestricPub]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        [self reverstRestrict];
    }else if ([target isEqualToString:kTargetChangeBlock]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        [self reverstBlock];
    }
}

#pragma mark tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == tbAlbum) {
        return 3;// [userData.album count];
    }else {
        return 0;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int row = [indexPath row];
    static NSString* cellInditifier = @"ShowImageCell";
    ShowImageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellInditifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShowImageCell" owner:self options:nil] objectAtIndex:0];
    }
    cell.controller = self;
    [cell viewDidload];
    NSArray *temp = [NSArray arrayWithObjects:
                            @"http://anh.24h.com.vn/upload/2-2011/images/2011-04-29/1304091476-tam-biet-anh-1.jpg",
                            @"http://dantri.vcmedia.vn/Uploaded/2009/06/26/ngoc5266009.jpg",
                            @"http://gamethu.vnexpress.net/Files/Subject/3B/9A/F1/49/NgocAnh-7542.jpg", nil];
    NSString *url =[temp objectAtIndex:row];// [userData.album objectAtIndex:row];
    [cell loadUrl:[NSURL URLWithString:url]];
    return cell;
}
@end
