//
//  SendInviteController.m
//  iTell
//
//  Created by tranduc on 9/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SendInviteController.h"
#import "ApiRequest.h"
#import "InviteFriendCell.h"
#import "AppDelegate.h"
#import "Global.h"
#import "SendAdditionEmailController.h"
#import "MPFoldTransition.h"

@interface SendInviteController ()
@property(nonatomic, retain)ApiRequest *apiRequest;
@property(nonatomic, retain)NSMutableArray *friendArr;
@end

#define kTargetGetMailInvite @"getInvite"

@implementation SendInviteController
@synthesize tbInvite;
@synthesize svInvite;
@synthesize apiRequest;
@synthesize friendArr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - api request
-(void)addInviteList:(NSArray*)arr{
    if (self.friendArr == nil) {
        self.friendArr = [[NSMutableArray alloc] initWithCapacity:[arr count]];
    }
    for (NSDictionary *dic in arr) {
        /*
         id,
         name,
         mobile_num,
         email
         */
        InviteFriendData *data = [[InviteFriendData alloc] init];
        data.name = [dic valueForKey:@"name"];
        data.mobileNum = [[dic valueForKey:@"mobile_num"] intValue];
        data.email = [dic valueForKey:@"email"];
        data.userId = [[dic valueForKey:@"id"] intValue];
        [friendArr addObject:data];
        [data release];
    }
    [tbInvite reloadData];
}
-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    NSNumber *retval = [dictionData valueForKey:@"retval"];
    if ([target isEqualToString:kTargetGetMailInvite]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        if (![retval boolValue]) {
            UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Get data error" message:[dictionData objectForKey:@"error_msg"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [al show];
            [al release];
        }else {
            maxPage = [[dictionData objectForKey:@"total_page"] intValue];
            NSArray *contacts = [dictionData objectForKey:@"contacts"];
            [self addInviteList:contacts];
        }
    }
}

-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    [[AppDelegate instance] showBusyView:NO withText:nil];
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send error" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    [al release];

}
-(void)loadInviteList{
    NSString *url = [SERVER_URL stringByAppendingFormat:@"friend/get_contacts_not_using"];
    UserData *user = [Global shareGlobal].user;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         user.uuid, @"uuid",
                         [NSNumber numberWithInt:user.userID], @"user_id",
                         [NSNumber numberWithInt:currPage], @"page", nil];
    self.apiRequest = [[[ApiRequest alloc] initWithDelegate:self andTarget:kTargetGetMailInvite] autorelease];
    [apiRequest requestUsingPostMethod:url postData:dic];
     [[AppDelegate instance] showBusyView:YES withText:@"loading..."];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    svInvite.contentSize = CGSizeMake(321, 65);
    currPage = 1;
    maxPage = 1;
    [self loadInviteList];
}

- (void)viewDidUnload
{
    [self setSvInvite:nil];
    [self setTbInvite:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [svInvite release];
    [tbInvite release];
    [super dealloc];
}
#pragma mark tableview data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [friendArr count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"InviteFriendCell";
    InviteFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
    }
    InviteFriendData *friend = [friendArr objectAtIndex:[indexPath row]];
    [cell setUpFriend:friend];
    return cell;
}

#pragma mark tableview delegate

#pragma mark scroll
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView == tbInvite) {
        if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.bounds.size.height){
            if (currPage < maxPage) {
                currPage +=1;
                [self loadInviteList];
            }
        }
    }else if (scrollView == svInvite) {
        if (svInvite.contentOffset.x < -80) {
            SendAdditionEmailController *sender = [[SendAdditionEmailController alloc] initWithNibName:@"SendAdditionEmailController" bundle:nil];
            [self.navigationController pushViewController:sender foldStyle:MPFoldStyleFlipFoldBit(MPFoldStyleCubic)];
            [sender release];
        }
    }
}


- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
