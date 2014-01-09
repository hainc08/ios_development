//
//  ChatViewController.m
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChatViewController.h"
#import "FriendsChatViewCell.h"
#import "ChattingViewController.h"
#import "UsersChatted.h"
#import "Global.h"

@interface ChatViewController ()

@end

@implementation ChatViewController
@synthesize tblView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Chat";
    self.navigationController.navigationBarHidden = TRUE;
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.tblView setAllowsSelection:YES];
    [self.tblView setAllowsSelectionDuringEditing:YES];
    NSLog(@"delegate:%@ dataSource:%@", self.tblView.delegate, self.tblView.dataSource);
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    NSTimer *_timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateRemainTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [self.tblView reloadData];
   // [self.navigationController setToolbarHidden:YES];
   // self.hidesBottomBarWhenPushed = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
#pragma mark table view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"so user da chat: %d",[appDelegate.userChattedArray count]);
    return [appDelegate.userChattedArray count];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"FriendsChatViewCell";
    FriendsChatViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil] objectAtIndex:0];
    }
    UsersChatted *userChatted = [appDelegate.userChattedArray objectAtIndex:indexPath.row];
    int indexColor = indexPath.row%6;
    [cell initFriendCell:indexColor];
    cell.controller = self;
    UserData *userData = [[UserData alloc] init];
    userData.name = userChatted.userName;
    userData.gender = userChatted.gender;
    userData.nick = userChatted.nick;
    userData.uuid = userChatted.uuid;
    userData.userID = userChatted.userID;
    userData.urlAvatar = userChatted.urlAvatar;
    [cell configWithUser:userData];
    [cell.viewStt addSubview:[cell bubbleView:[NSString stringWithFormat:@"Hallo: %d",indexColor]]];
    [cell.imImage setImage:[UIImage imageNamed:@"unknow_person.jpg"]];
    cell.lbName.text = userChatted.userName;
    NSLog(@"inner: %@ === outner: %@",[NSString stringWithFormat:@"inner-tab-%d.png",indexColor],[NSString stringWithFormat:@"outer_tab-%d.png",indexColor]);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)updateRemainTime {
    NSTimeInterval current = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval distance = current - [Global shareGlobal].latestItellTime;
    int remain = kMAX_TIME_ITEL - distance;
    if (remain < 0) {
        lbTime.text = NSLocalizedString(@"ItellTimeLimited", @"remain time < 0");
        [Global shareGlobal].isItelling = NO;
        remain = 0;
    }else{
        int h = remain/3600;
        int remainS = remain%3600;
        int m = remainS/60;
        int s = (remainS%60);
        lbTime.text = [NSString stringWithFormat:@"%d:%d:%d ", h, m, s];
    }

}
@end
