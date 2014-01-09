//
//  ChatViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController
@synthesize tblView = _tblView;
@synthesize refreshControl = _refreshControl;
@synthesize isDisappear;

#define DATEFORMAT_UTC @"yyyy-MM-dd'T'HH:mm:ssZZZZ"
#define DATEFORMAT_UTC_Z @"yyyy-MM-dd'T'HH:mm:ss'Z'"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    
    [self openMenue];
    [self openPasscodeView];
    if(coolio == nil){
        coolio = [[CoolioWebService alloc] init];
    }
    if(account == nil){
        account = [[MyProfiles alloc] init];
    }
    
    myId = [account getEmailProfile];
    
    //ToNotifyGetChatMessages
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheGetChatMessage:) name:@"ToNotifyGetChatMessage" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyGetChatUnreadCount:) name:@"ToNotifyGetChatUnreadCount" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyThePopViewChatList:) name:@"toNotifiThePopViewChatList" object:nil];
    
    if (&UIApplicationDidBecomeActiveNotification) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(toNotifyDidBecomeActiveNotification:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:[UIApplication sharedApplication]];
    }
    
    
    if(self.refreshControl == nil){
        self.refreshControl = [[UIRefreshControl alloc] init];
    }
    [self.refreshControl addTarget:self action:@selector(reloadCollectionViewDataSource:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.tintColor = [UIColor orangeColor];
    
    [self.tblView addSubview:self.refreshControl];
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

    //if(self.isDisappear == NO){
    #if DEBUG
        //NSLog(@"self.isDisappear is NO");
    #endif
        if( [AppDelegate NetworkCheckConnect] == YES){
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            [SVProgressHUD show];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                if(coolio == nil){
                    coolio = [[CoolioWebService alloc] init];
                }
                if(myId == nil){
                    if(account == nil){
                        account = [[MyProfiles alloc] init];
                    }
                    myId = [account getEmailProfile];
                }
                [coolio getMessages:myId];
                [coolio getMyUnreadCount:myId];
            });
        }else{
            [AppDelegate showDisconnectAlert];
        }
    //}else{
    //    NSLog(@"self.isDisappear is YES");
    //}
    self.isDisappear = NO;
    isSendedChatGlobal = NO;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//アクティブになった時に呼ばれる
/*
-(void)toNotifyDidBecomeActiveNotification:(NSNotification *)notification
{
    if ([[KKPasscodeLock sharedLock] isPasscodeRequired]) {
        KKPasscodeViewController *vc = [[KKPasscodeViewController alloc] initWithNibName:nil bundle:nil];
        vc.mode = KKPasscodeModeEnter;
        vc.delegate = self;
        
        dispatch_async(dispatch_get_main_queue(),^ {
            [self.navigationController presentViewController:vc animated:YES completion:nil];
        });
        
    }

    
    
    MyProfiles* _account = [[MyProfiles alloc] init];
    NSString* _myId = [_account getEmailProfile];
    if(_myId != nil){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [coolio getMessages:_myId];
            
        });
    }

}
*/

#pragma mark - Table view data source

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
    return [chatMessages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary* userDict = chatMessages[indexPath.row];

    UIImageView* imgIcon = (UIImageView *)[cell viewWithTag:1];
    UILabel* nameLabel = (UILabel *)[cell viewWithTag:2];
    UIImageView* noticeIcon = (UIImageView *)[cell viewWithTag:3];
    
    imgIcon.image = nil;
    nameLabel.text = nil;
    noticeIcon.image = nil;
    
    NSString* nickName = [userDict valueForKey:@"nickname"];
    //int count = 0;
    
    //dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //dispatch_async(q_global, ^{
    
    //});
    int count = 0;
    if(![[userDict valueForKey:@"countValue"] isEqual:[NSNull null]]){
        count = [[userDict valueForKey:@"countValue"] intValue];
    }
    //NSLog(@"countValue: %d", count);
    UIImage* badgeImage = nil;
    
    if(count > 0){
        if(count < 20){
            NSString* countImageName = [NSString stringWithFormat:@"%d", count];
            badgeImage = [UIImage imageNamed:countImageName];
        }
        if(count >= 20){
            badgeImage = [UIImage imageNamed:@"20"];
        }
    }

    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        /*
        CGSize newSize;
        newSize.height = 42.0f;
        newSize.width = 42.0f;
        
        UIImage* img =  [ImageResizable imageWithImage:
                         [self pictures:userDict pictName:@"picture1"] scaledToSizeWithSameAspectRatio:newSize];
        */
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^{
            nameLabel.text = nickName;
            //imgIcon.image = img;
            [imgIcon setImageWithURL:[self picturesURL:userDict pictName:@"picture1"] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
            noticeIcon.image = badgeImage;
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
    
    //NSDictionary* userInfoDict = [[chatMessages objectAtIndex:indexPath.row] mutableCopy];
    //userInfoGlobal = userDict;
    //self.userId = [userInfoDict valueForKey:@"email"];
    //[coolio doChatCountReset:myId userId:self.userId];
}

- (void)toNotifyTheGetChatMessage:(NSNotification *)notification
{
    chatMessages = [[notification object] mutableCopy];
    chatMessages = (NSMutableArray *)[self sortArrayLastLoginTime:chatMessages];
    
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        [(UITableView *)self.tblView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        [self.refreshControl endRefreshing];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [SVProgressHUD dismiss];
    });

    
}

-(NSArray *)sortArrayLastLoginTime:(NSArray *)array{
    
    array = [array sortedArrayUsingComparator: ^(id a, id b) {
        @try{
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
        }@catch (NSException* ex) {
            return (NSComparisonResult)NSOrderedSame;
        }
    }];
    
    return array;
}

-(void)toNotifyGetChatUnreadCount:(NSNotification *)notification
{
    NSDictionary* userInfo =  [notification userInfo];
    int count = [[userInfo valueForKey:@"countValue"] intValue];

    for(int i=0; i<[chatMessages count]; i++){
        NSMutableDictionary* userDict = [chatMessages[i] mutableCopy];
        
        #if DEBUG
            //NSLog(@"Count value : %d", count);
        #endif
        [userDict setValue:@(count) forKey:@"countValue"];
        chatMessages[i] = userDict;
    }
    


}

-(void)toNotifyThePopViewChatList:(NSNotification *)notification
{
    self.isDisappear = YES;
}


-(NSURL *)picturesURL:(NSDictionary *)dict pictName:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendFormat:@"%@", [dict valueForKey:pictName]];
    
    return [NSURL URLWithString:appendIconUrlString];
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

#pragma mark - UIRefreshControl
-(void)reloadCollectionViewDataSource:(id)sender
{
    if([AppDelegate NetworkCheckConnect] == YES){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [coolio getMessages:myId];
    }
}


- (IBAction)revealMenu:(id)sender
{
    [coolio getMyUnreadCount:myId];
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"chatMessagesViewDetail"]) {
        NSIndexPath* idxPath = self.tblView.indexPathForSelectedRow;
        NSDictionary* userInfoDict = [chatMessages[idxPath.row] mutableCopy];
        //userInfoGlobal = userDict;
        NSString* userId = [userInfoDict valueForKey:@"email"];

        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [coolio doChatCountReset:myId userId:userId];
        });
        
        ChatMessagesViewController* chatView = segue.destinationViewController;
        chatView.userId = userId;
    }
}

@end
