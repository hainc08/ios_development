//
//  ChatMessagesViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "ChatMessagesViewController.h"

@interface ChatMessagesViewController ()

@end

@implementation ChatMessagesViewController
@synthesize refreshControl = _refreshControl;

#define kFontSize 14
#define DATEFORMAT_UTC @"yyyy-MM-dd'T'HH:mm:ssZZZZ"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openPasscodeView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheChatMessages:) name:@"ToNotifyGetChatMessages" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheSendReport:) name:@"ToNotifyReportRequest" object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheUserOne:) name:@"ToNotifyTheUserOne" object:nil];
    
    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
    
    coolio = [[CoolioWebService alloc] init];
    account = [[MyProfiles alloc] init];
    myId = [account getEmailProfile];

    //iconCache
    /*
    if(iconCache == nil){
        iconCache = [NSMutableDictionary dictionary];
    }
    
    if(pictCache == nil){
        pictCache = [NSMutableDictionary dictionary];
    }
    */
    
    if(self.refreshControl == nil){
        self.refreshControl = [[UIRefreshControl alloc] init];
    }
    [self.refreshControl addTarget:self action:@selector(reloadCollectionViewDataSource:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.tintColor = [UIColor orangeColor];
    [self.tableView addSubview:self.refreshControl];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //[self.navigationController.toolbar setBarStyle:[UIBarStyleBlack]];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:NO];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    //UIToolbar* toolBar = self.navigationController.toolbar;
    //[toolBar setBarStyle:UIBarStyleBlackOpaque];
    [self.navigationController setToolbarHidden:NO animated:NO];

    /*
    if([chatTimer isValid] == NO){
        
        SEL sel = @selector(timerTargetMethod);
        NSInvocation* inv = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:sel]];
        [inv setTarget:self];
        [inv setSelector:sel];
        
        //インターバル5秒
        int interval = 15;
        chatTimer = [NSTimer scheduledTimerWithTimeInterval:interval invocation:inv repeats:true];
        [chatTimer fire];
    }
    */

    if( [AppDelegate NetworkCheckConnect] == YES){
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [SVProgressHUD showWithStatus:@"" maskType:SVProgressHUDMaskTypeBlack];
        
        if(self.userId != nil){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [coolio getMessages:myId userId:self.userId];
            });
            //[coolio doChatCountReset:myId userId:userIdGlobal];
        }
    }else{
        [AppDelegate showDisconnectAlert];
    }

}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.toolbarHidden = YES;

    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        NSNotification *n = [NSNotification notificationWithName:@"toNotifiThePopViewChatList" object:self];
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotification:n];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    return [messageList count];
}


- (CGFloat)cellHeight:(NSString*)text{
    float cellHeight = 0.0f;
    
    float _textHeight = [NSString chatStringWithHeight:text];
    /*
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont systemFontOfSize:kFontSize], NSFontAttributeName,
                                          nil];
    CGRect _textContentFrame = [text boundingRectWithSize:CGSizeMake(234, 999999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
    CGSize _textContentSize = _textContentFrame.size;
    
    //CGSize _size = CGSizeMake(234, 999999.0f);
    //CGSize _textContentSize = [text sizeWithFont:[UIFont systemFontOfSize:kFontSize] constrainedToSize:_size lineBreakMode:NSLineBreakByWordWrapping];
    */
    cellHeight = 21.0f + 10.0f + _textHeight;

    if(_textHeight < 100){
        cellHeight += 24.0f;
    }else if(_textHeight >= 100 && _textHeight < 1300){
        cellHeight += 80.0f;
    }else{
        cellHeight += 300.0f;
    }

    //cellHeight = _textContentSize.height + verticalPadding;
    //NSLog(@"CellHeight: %f", cellHeight);
    return cellHeight;
}

- (CGFloat)cellHeightWithImage:(NSString*)text
{
    CGFloat cellHeight = [self cellHeight:text];
    cellHeight = cellHeight + 340.0f;
    return cellHeight;
}

- (CGFloat)textHeight:(NSString*)text{
    return [NSString chatStringWithHeight:text];
    /*
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont systemFontOfSize:kFontSize], NSFontAttributeName,
                                          nil];
    CGRect _textContentFrame = [text boundingRectWithSize:CGSizeMake(234, 999999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
    CGSize _textContentSize = _textContentFrame.size;
    
    //CGSize _size = CGSizeMake(234, 999999.0f);
    //CGSize _textContentSize = [text sizeWithFont:[UIFont systemFontOfSize:kFontSize] constrainedToSize:_size lineBreakMode:NSLineBreakByWordWrapping];
    
    textHeight = _textContentSize.height;
    
    return textHeight;
    */
}


- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    //UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    //UITextView* txtMessage = (UITextView *)[cell viewWithTag:4];
    float verticalPadding = 24.0f;
    NSDictionary*  dict = messageList[indexPath.row];
    NSString* message = [dict valueForKey:@"message"];
    NSString* pict = [dict valueForKey:@"pict"];
    
    CGFloat cellFloat;// = cell.frame.size.height;
    
    if(pict == nil || [pict isEqual:[NSNull null]]){
        cellFloat = [self cellHeight:message];
    }else{
        cellFloat = [self cellHeightWithImage:message];
    }
    return cellFloat + verticalPadding;
}

/*
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Call cellForRowAtIndexPath");

    static NSString* CellIdentifier = @"CustomChatCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    UIImageView* iconImage = (UIImageView *)[cell viewWithTag:1];
    UILabel* nameLabel = (UILabel *)[cell viewWithTag:2];
    UILabel* dateLabel = (UILabel *)[cell viewWithTag:3];
    UITextView* txtMessage = (UITextView *)[cell viewWithTag:4];
    //UIImageView* stretchImageView = (UIImageView *)[cell viewWithTag:5];
    UIImageView* pictImage = (UIImageView *)[cell viewWithTag:6];
    
    iconImage.image = nil;
    nameLabel.text = nil;
    dateLabel.text = nil;
    txtMessage.text = nil;
    //stretchImageView.image = nil;
    pictImage.image = nil;

    
    //CGRect stretchImageFrame = stretchImageView.frame;
    //stretchImageFrame.size.width = 0.0f;
    //stretchImageFrame.size.height = 0.0f;
    //stretchImageView.frame = stretchImageFrame;
    
    NSDictionary* userDict = messageList[indexPath.row];
    NSString* _name = [userDict valueForKey:@"nickname"];
    NSString* _date = [userDict valueForKey:@"updated_at"];
    NSString* _message = [userDict valueForKey:@"message"];
    
    nameLabel.text = _name;
    dateLabel.text = [self stringFromTime:_date];
    txtMessage.backgroundColor = [UIColor clearColor];
    
    txtMessage.text = _message;
    
    //NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:kFontSize], NSFontAttributeName, nil];
    //CGRect _frame = [_message boundingRectWithSize:CGSizeMake(234, 999999.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
    //CGSize _size = _frame.size;
    
    //__block UIImage* _iconImage = nil;
    //__block NSString* _pict = [userDict valueForKey:@"pict"];
    //__block UIImage* _pictImage = nil;
    
    //__block UIImage* balloon = nil;
    
    UITapGestureRecognizer* taps = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIcon:)];
    [iconImage addGestureRecognizer:taps];

    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        /*
        if([iconCache valueForKey:[userDict valueForKey:@"picture1"]] == nil){
            _iconImage = [self pictures:userDict pictName:@"picture1"];
            CGSize newSize;
            newSize.width = 48.0f;
            newSize.height = 48.0f;
            
            _iconImage = [ImageResizable imageWithImage:_iconImage scaledToSizeWithSameAspectRatio:newSize];
            
            NSData* _iconData = [[NSData alloc] initWithData:UIImagePNGRepresentation(_iconImage)];
            [iconCache setValue:_iconData forKey:[userDict valueForKey:@"picture1"]];
        }else{
            NSData* _iconData = [iconCache valueForKey:[userDict valueForKey:@"picture1"]];
            _iconImage = [[UIImage alloc] initWithData:_iconData];
        }
        */

        //if(![_pict isEqual:[NSNull null]] && _pict != nil){
            /*
            if(![[pictCache valueForKey:_pict] isEqual:[NSNull null]] && [pictCache valueForKey:_pict] == nil){
                _pictImage = [self messagePicture:_pict];
                if(_pictImage != nil && ![_pictImage isEqual:[NSNull null]]){
                    CGSize _pictSize;
                    _pictSize.height = 280.0f;
                    _pictSize.width = 280.0f;
                    _pictImage = [ImageResizable imageWithImage:_pictImage scaledToSizeWithSameAspectRatio:_pictSize];
                    
                    NSData* _pictData = [[NSData alloc] initWithData:UIImagePNGRepresentation(_pictImage)];
                    [pictCache setValue:_pictData forKey:_pict];
                }
            }else{
                NSData* _pictData = [pictCache valueForKey:_pict];
                _pictImage = [[UIImage alloc] initWithData:_pictData];
            }
            */
        //}
        
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^{
            
            NSString * _pict = [userDict valueForKey:@"pict"];
            
            if(_pict == nil || [_pict isEqual:[NSNull null]]){
                //iconImage.image = _iconImage;
                [iconImage setImageWithURL:[self picturesURL:userDict pictName:@"picture1"] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
            }else{
                //iconImage.image = _iconImage;
                [iconImage setImageWithURL:[self picturesURL:userDict pictName:@"picture1"] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
                [pictImage setImageWithURL:[self messagePictureURL:_pict] placeholderImage:nil options:SDWebImageCacheMemoryOnly];
                /*
                __block UIImageView* img404View = pictImage;
                
                
                [pictImage setImageWithURL:[self messagePictureURL:_pict] placeholderImage:nil options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    NSLog(@"error: %@", [error description]);
                    if(error != nil){
                        if([error code] == 404){
                            [img404View setImage:[UIImage imageNamed:@"404"]];
                        };
                    }
                }];
                */
            }
            
            CGRect _textRect = txtMessage.frame;
            _textRect.size.height = txtMessage.contentSize.height + 8.0f;
            txtMessage.frame = _textRect;

            //stretchImageView.frame = CGRectMake(txtMessage.frame.origin.x - 10, txtMessage.frame.origin.y, _size.width + 28.0, _size.height + 25);

            //NSString* __userId = [userDict valueForKey:@"email"];
            //NSString* _myId = [account getEmailProfile];
            //if([_myId isEqualToString:__userId]){
            //    balloon = [[UIImage imageNamed:@"aqua.png"] stretchableImageWithLeftCapWidth:24 topCapHeight:15];
            //}else{
            //    balloon = [[UIImage imageNamed:@"grey.png"] stretchableImageWithLeftCapWidth:24 topCapHeight:15];
            //}
            //stretchImageView.image = balloon;

            CGRect pictRect = pictImage.frame;
            pictRect.origin.y = _textRect.origin.y + _textRect.size.height + 16.0f;
            pictImage.frame = pictRect;
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
}

-(void)toNotifyTheSendReport:(NSNotification *)notification
{
    //@"Thank you for Reporting."
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_REPORT_SENDED", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btn_chatReportPush:(id)sender {
    UIActionSheet* sheet = [UIActionSheet actionSheetWithTitle:nil];
    
    [sheet addButtonWithTitle:NSLocalizedString(@"REPORT_BUTTON", nil) handler:^(void){
        NSString* reportId = self.userId;
        UIActionSheet* reportSheet = [UIActionSheet actionSheetWithTitle:nil];
        
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_UNCENSORED_PICTURES", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:0]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_SPAM_TEXT", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:1]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_PROSTITUTES", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:2]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_FISHING_SITE", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:3]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_COPYRIGHT_PICTURES", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:4]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_I_FOUND_MINORS", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:5]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_UNLAWFUL_ACTION", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:6]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_VIOLENT_CONTENTS", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:7]; }];
        [reportSheet addButtonWithTitle:NSLocalizedString(@"REPORT_OTHERS", nil) handler:^(void){ [coolio sendReport:myId reportId:reportId commandId:8]; }];
        [reportSheet setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){}];
        [reportSheet showInView:self.navigationController.view];
    }];
    
    
    [sheet setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){}];
    [sheet showInView:self.navigationController.view];
}

- (void)toNotifyTheChatMessages:(NSNotification *)notification
{
    messageList = [[notification object] mutableCopy];
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        [self.refreshControl endRefreshing];
        [(UITableView *)self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [SVProgressHUD dismiss];
    });
}

-(NSURL *)picturesURL:(NSDictionary *)dict pictName:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"icons/"];
    [appendIconUrlString appendFormat:@"%@", [dict valueForKey:pictName]];
    
    NSURL* url = [NSURL URLWithString:appendIconUrlString];
    return url;
}

-(NSURL *)messagePictureURL:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"picture/"];
    [appendIconUrlString appendFormat:@"%@", pictName];
    
    return [NSURL URLWithString:appendIconUrlString];
    //NSLog(@"%@", appendIconUrlString);
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

-(UIImage *)messagePicture:(NSString *)pictName
{
    NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
    [appendIconUrlString appendString:URLSTRING];
    [appendIconUrlString appendString:@"picture/"];
    [appendIconUrlString appendFormat:@"%@", pictName];
    
    NSURL *url = [NSURL URLWithString:appendIconUrlString];
    //NSLog(@"%@", appendIconUrlString);
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc]initWithData:data];
    return  img;
}

-(void)tapIcon:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded){
        CGPoint point = [sender locationInView:self.tableView];
        NSIndexPath* indexPath = [self.tableView indexPathForRowAtPoint:point];
        
        
        NSDictionary* _userInfoDict = [messageList[indexPath.row] mutableCopy];
        //NSLog(@"%@", _userInfoDict);
        NSString* _email = [_userInfoDict valueForKey:@"email"];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        AccountDetailViewController* ad = [storyboard instantiateViewControllerWithIdentifier:@"AccountDetailViewController"];

        if([myId isEqualToString:_email] == YES){
            ad.isMyIdTaped = YES;
            ad.userId = _email;
            //return;
        }else{
            //self.userId= _email;
            ad.isMyIdTaped = NO;
            ad.userId= _email;
        }
        [self.navigationController pushViewController:ad animated:YES];
    }
}

#pragma mark - UIRefreshControl
-(void)reloadCollectionViewDataSource:(id)sender
{
    if([AppDelegate NetworkCheckConnect] == YES){
        if(self.userId != nil){
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            [SVProgressHUD showWithStatus:@"" maskType:SVProgressHUDMaskTypeBlack];

            [coolio getMessages:myId userId:self.userId];
        }
    }
}

/*
//Intervalごとに新しい位置情報を取得
#pragma mark - NSTimer interval
-(void) timerTargetMethod
{
    NSLog(@"Timer fire.");
    if([account getEmailProfile] == nil || [[account getEmailProfile] isEqualToString:@""]){
        [chatTimer invalidate];
        return;
    }
    if([AppDelegate NetworkCheckConnect] == YES){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        if(userInfoGlobal != nil){
            [coolio getMessages:myId userId:[userInfoGlobal valueForKey:@"email"]];
        }
    }
}
*/

- (NSString *)stringFromTime:(NSString *)updated_at {
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"chatSendMessageSegue"]) {
        ChatSendMessageViewController* chatSendView = segue.destinationViewController;
        chatSendView.userId = self.userId;
    }
}

@end
