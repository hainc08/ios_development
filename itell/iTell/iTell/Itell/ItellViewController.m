//
//  ItellViewController.m
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItellViewController.h"
#import "Global.h"
#import "ITMarco.h"
#import "JSON.h"
#import "NSDate+Formater.h"
#import "AppDelegate.h"
#import "ALTabbarController.h"

#define kGetItell @"itell/get_itell"

#define kFullRect CGRectMake(0, 41, 320, 392)

static int indexType[3]={1,2,3};

@interface ItellViewController ()
@property (retain, nonatomic) IBOutlet UILabel *lbRemainTime;
@property (retain, nonatomic)ApiRequest *apiRequest;
@property (retain, nonatomic)UIAlertView *alertView;
@property (nonatomic)kItellPlicy itellPolicy;
@property (nonatomic, retain)NSString *itellString;

- (IBAction)btFriendsPressed:(id)sender;
- (IBAction)btAnotherPressed:(id)sender;

- (IBAction)btCancelPressed:(id)sender;
- (IBAction)btAllPressed:(id)sender;
-(void)showItellStatus;
@end

@implementation ItellViewController
@synthesize imItellAll;
@synthesize imItellFriend;
@synthesize imItellOther;
@synthesize svFriends;
@synthesize svAllUser;
@synthesize svOther;
@synthesize bgFriendView;
@synthesize lbRemainTime;
@synthesize apiRequest = _apiRequest;
@synthesize alertView;
@synthesize itellPolicy = _itellPolicy;
@synthesize itellString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
#pragma mark - time
-(void)updateButtonItell:(int)level{
    levelRemainTime = level;
    NSString *fileName = [kFileButtonItell stringByAppendingFormat:@"%d_%d", indexType[self.itellPolicy -1],levelRemainTime];
    [[AppDelegate instance].tabBarController.btn3 setBackgroundImage: [UIImage imageNamed:fileName] forState:UIControlStateNormal];
    [[AppDelegate instance].tabBarController.btn3 setBackgroundImage: [UIImage imageNamed:fileName] forState:UIControlStateSelected];
}
- (void)updateRemainTime{
    if (![Global shareGlobal].isItelling) {
        lbRemainTime.text = NSLocalizedString(@"ItellTimeLimited", @"noItell");
        if (levelRemainTime!= 1) {
            [self updateButtonItell:1];
        }
        return;
    }
    NSTimeInterval current = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval distance = current - [Global shareGlobal].latestItellTime;
    int remain = kMAX_TIME_ITEL - distance;
    if (remain < 0) {
        lbRemainTime.text = NSLocalizedString(@"ItellTimeLimited", @"remain time < 0");
        [Global shareGlobal].isItelling = NO;
        [self showItellStatus];
        remain = 0;
    }else{
        int h = remain/3600;
        int remainS = remain%3600;
        int m = remainS/60;
        int s = (remainS%60);
        lbRemainTime.text = [NSString stringWithFormat:@"%d:%d:%d ", h, m, s];
    }
    int level = remain/(3600*3/kStep)+1;
    if (level>kStep) {
        level = kStep;
    }else if (level<1) {
        level = 1;
    }
    if (levelRemainTime != level) {
        [self updateButtonItell:level];
    }
}
-(void)itellReturnWithDic:(NSDictionary*)dic{
    ITLOG(@"dic = %@", dic);
}
-(void)getTimeRemain{
    self.apiRequest = [[[ApiRequest alloc] initWithDelegate:self andTarget:kGetTimeRemain] autorelease];
    NSString *uuid = [Global shareGlobal].user.uuid;
    //[Global shareGlobal].user.userID = 62;
    int userId = [Global shareGlobal].user.userID;
    
    NSString *url = [NSString stringWithFormat:@"%@itell/get_itell?user_id=%d&uuid=%@", SERVER_URL, userId, uuid];
    [self.apiRequest requestUsingGetMethod:url];
    [alertView show];
}
-(void)createAlert{
    alertView = [[UIAlertView alloc] initWithTitle:@"Loading..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    UIActivityIndicatorView *indicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] autorelease];
    indicator.center = CGPointMake(139.5, 75.5);
    [indicator startAnimating];
    [alertView addSubview:indicator];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"ItellTitle", @"title")];
    [self createAlert];
    self.navigationController.navigationBarHidden = TRUE;
    [self getTimeRemain];
    
    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateRemainTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    svFriends.contentSize = CGSizeMake(161, 187);
    svOther.contentSize = CGSizeMake(161, 187);
    svAllUser.contentSize = CGSizeMake(161, 187);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setLbRemainTime:nil];
    [self setImItellAll:nil];
    [self setImItellFriend:nil];
    [self setImItellOther:nil];
    [self setSvFriends:nil];
    [self setSvAllUser:nil];
    [self setSvOther:nil];
    [self setBgFriendView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_timer invalidate];
    [lbRemainTime release];
    [_apiRequest release];
    [alertView release];
    [itellString release];
    [imItellAll release];
    [imItellFriend release];
    [imItellOther release];
    [svFriends release];
    [svAllUser release];
    [svOther release];
    [bgFriendView release];
    [super dealloc];
}

#pragma mark - apiDelegate
-(void)showAlertErrorNetWork:(int)tag{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Network error" message:nil delegate:self cancelButtonTitle:@"Retry" otherButtonTitles:@"Cancel", nil];
    al.tag = tag;
    [al show];
    [al release];
}
-(void)showRetryErrorNetWorkWithTag:(int)tag{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Network error" message:nil delegate:self cancelButtonTitle:@"Retry" otherButtonTitles: @"Cancel", nil];
    al.tag = tag;
    [al show];
    [al release];
}
-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    ITLOG(@"%@", target);
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    if ([target isEqualToString:kGetTimeRemain]) {
        [self showAlertErrorNetWork:kTagGetTimeRemain];
    }else {
        [self showRetryErrorNetWorkWithTag:kCancelItellTag];
    }
}
-(void)finishGetItell:(NSDictionary*)dictionData{
    if (dictionData == nil) {
        [self showAlertErrorNetWork:kTagGetTimeRemain];
        return;
    }
    NSNumber *retval = [dictionData valueForKey:@"retval"];
    if (![retval boolValue]) {
        [self showAlertErrorNetWork:kTagGetTimeRemain];
        return;
    }
    NSDictionary *itell = [dictionData valueForKey:@"itell"];
    if (itell == nil) {
        [self showAlertErrorNetWork:kTagGetTimeRemain];
        return;
    }
    
    NSNumber *itell_status = [itell objectForKey:@"itell_status"];
    if (![itell_status boolValue]) {
        [Global shareGlobal].isItelling = NO;
        [self updateRemainTime];
    }else {
        [Global shareGlobal].isItelling = YES;
    }
    
    self.itellPolicy = [[itell objectForKey:@"itell_policy"] intValue];
    self.itellString = [itell objectForKey:@"itell"];
    
    [Global shareGlobal].latestItellTime = [NSDate timeInterval1970FromString:[itell objectForKey:@"itell_start"]];
    ITLOG(@"last = %f", [Global shareGlobal].latestItellTime);
    [self showItellStatus];
}

-(void)finishCancelItell:(NSDictionary*)dictionData{
    if (dictionData == nil) {
        [self showRetryErrorNetWorkWithTag:kCancelItellTag];
        return;
    }
    NSNumber *retval = [dictionData valueForKey:@"retval"];
    if (![retval boolValue]) {
        [self showRetryErrorNetWorkWithTag:kCancelItellTag];
        return;
    }
    [Global shareGlobal].isItelling = NO;
    [self showItellStatus];
}
-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    ITLOG(@"%@, %@", target, dictionData);
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    if ([target isEqualToString:kGetTimeRemain]) {
        [self finishGetItell:dictionData];
    }else if ([target isEqualToString:kCancelItell]) {
        [self finishCancelItell:dictionData];
    }
}
-(void)shareStatus:(kItellPlicy)type{
    ItellShareStatusController *shareController = [[[ItellShareStatusController alloc] initWithNibName:@"ItellShareStatusController" bundle:nil] autorelease];
    shareController.typeSharing = type;
    shareController.delegate = self;
    [self.navigationController pushViewController:shareController animated:NO];
}
-(void)shareItell:(NSString *)itellStr withPolicy:(kItellPlicy)type{
    [Global shareGlobal].isItelling = YES;
    self.itellPolicy = type;
    self.itellString = itellStr;
    
    [self updateRemainTime];
    [self showItellStatus];
    [self updateButtonItell:levelRemainTime];
}

- (IBAction)btAllPressed:(id)sender {
    
    [self shareStatus:kItellPolicy_ALL];
}
- (IBAction)btFriendsPressed:(id)sender {
    [self shareStatus:kItellPolicy_FRIEND_ONLY];
}
- (IBAction)btAnotherPressed:(id)sender {
    [self shareStatus:kItellPolicy_OTHER_ONLY];
}


#pragma mark - cancel Itell
-(void)cancellItell{
    [alertView show];
    [self.apiRequest setTarget:kCancelItell];
    UserData *user = [Global shareGlobal].user;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:user.uuid, @"uuid",
                         [NSNumber numberWithInt:user.userID], @"user_id", nil];
    [self.apiRequest requestUsingPostMethod:[NSString stringWithFormat:@"%@itell/cancel_itell", SERVER_URL] postData:dic];
}

- (IBAction)btCancelPressed:(id)sender{
    [self cancellItell];
}

-(kItellPlicy)getItellPolicy{
    return self.itellPolicy;
}
-(void)showItellStatus{
    imItellAll.hidden = YES;
    imItellFriend.hidden = YES;
    imItellOther.hidden = YES;
    
    if (![Global shareGlobal].isItelling) {
        return;
    }
    if (self.itellPolicy == kItellPolicy_ALL) {
        imItellAll.hidden = NO;
    }else if (self.itellPolicy == kItellPolicy_FRIEND_ONLY) {
        imItellFriend.hidden = NO;
    }else if (self.itellPolicy == kItellPolicy_OTHER_ONLY) {
        imItellOther.hidden = NO;
    }
}

#pragma mark - alert delegate
-(void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alert.tag == kTagGetTimeRemain) {
        if (buttonIndex == 0) {
             [self getTimeRemain];
        }
       
    }else if (alert.tag == kCancelItellTag) {
        if (buttonIndex == 0) {
            [self cancellItell];
        }
    }
}

#pragma mark - Scroll view delegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (ABS(scrollView.contentOffset.x)>kOffsetScrollViewThreshold
        || ABS(scrollView.contentOffset.y)>kOffsetScrollViewThreshold) {
        [self shareStatus:(kItellPlicy)scrollView.tag];
    }
}
@end
