//
//  BlockListViewController.m
//  iTell
//
//  Created by mai van hai on 8/9/12.
//
//

#import "BlockListViewController.h"
#import "Global.h"

@interface BlockListViewController ()

@end

@implementation BlockListViewController
@synthesize tblView;
@synthesize supperController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *uuid = [Global shareGlobal].user.uuid;
        int userId = [Global shareGlobal].user.userID;
        apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTagGetBlockList];
        NSString *strUrl = [NSString stringWithFormat:@"%@setting/get_block_list?user_id=%d&uuid=%@",SERVER_URL,userId,uuid];
        NSLog(@"URL:%@",strUrl);
        [apiRequest requestUsingGetMethod:strUrl];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrBlockList = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
#pragma mark tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrBlockList count];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"BlockListCell";
    BlockListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
    }
    [cell initFriendCell:indexPath.row];
    cell.controller = self;
    cell.delegate = self;
    if ([arrBlockList count] > 0 && indexPath.row < [arrBlockList count]) {
        FriendData *useData = [arrBlockList objectAtIndex:indexPath.row];
        [cell configWithUser:useData];
    }
    return cell;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark ApiDelegate
- (void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target {
    if ([target isEqualToString:kTagGetBlockList]) {
        NSMutableDictionary *arrData = [dictionData objectForKey:@"block_list"];
        for (NSString *key in arrData) {
            NSLog(@"Key :%@", key);
            NSDictionary *dicData = [arrData objectForKey:key];
            FriendData *blockUser = [[FriendData alloc] init];
            blockUser.userID = [[dicData objectForKey:@"id"] intValue];
            blockUser.name = [dicData objectForKey:@"nick"];
            blockUser.urlAvatar = [dicData objectForKey:@"avatar"];
            [arrBlockList addObject:blockUser];

        }
        if ([arrBlockList count] <= 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not found user blocked!" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            alert.tag = kTagAlertNotFound;
            [alert show];
            [alert release];
        }
        [tblView reloadData];
    }
}
#pragma mark actions
- (IBAction)actionBack:(id)sender {
    [self.supperController.navigationController popViewControllerAnimated:YES];
}
#pragma mark Delete Block
- (void)blockUserSelected:(UITableViewCell *)tbCell indexCell:(int)index {
    NSString *uuid = [Global shareGlobal].user.uuid;
    int userId = [Global shareGlobal].user.userID;
    FriendData *blockCell = [arrBlockList objectAtIndex:index];
    NSDictionary *dataPost = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",userId],@"user_id",uuid,@"uuid",[NSString stringWithFormat:@"%d",blockCell.userID],@"friend_id", nil];
    apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTagUnBlock];
    [apiRequest requestUsingPostMethod:[NSString stringWithFormat:@"%@profile/unblock/",SERVER_URL] postData:[NSDictionary dictionaryWithDictionary:dataPost]];
    [arrBlockList removeObjectAtIndex:index];
    [tblView reloadData];
}
@end
