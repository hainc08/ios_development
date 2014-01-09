//
//  ChattingViewController.m
//  iTell
//
//  Created by mai van hai on 8/10/12.
//
//

#import "ChattingViewController.h"
#import "ChatViewController.h"
#import "StampStoreController.h"
#import "ThreadCell.h"
#import "SBJson.h"
#import "AppDelegate.h"
#import "UsersChatted.h"
#import "UsersChatHistory.h"
#import "Global.h"
#import "JSON.h"


#define kGetTimeRemain @"get_server"

#define kDateTimeValueTag 2
#define kTagButtonSend    11

@interface ChattingViewController ()

@end

@implementation ChattingViewController
@synthesize btEmotion,btSend,viewBar,smsArray;
@synthesize userData;

- (id)chattingWithUser:(FriendData *)user {
    NSLog(@"USER ID %d",user.userID);
   
    userData = user;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UsersChatted *userChatted = [[UsersChatted alloc] init];
    int numberOfUserChatted = [appDelegate.userChattedArray count];
    BOOL isAdded = NO;
    if(numberOfUserChatted > 0) {
        for (int i = 0; i < numberOfUserChatted; i++) {
            UsersChatted *userChattedElement = [appDelegate.userChattedArray objectAtIndex:i];
            if(userChattedElement.userID == user.userID) {
                isAdded = YES;
                break;
            }
        }
    }
    if(!isAdded) {
        userChatted.userID = user.userID;
        userChatted.userAvatar = user.urlAvatar;
        userChatted.userName = user.name;
        userChatted.urlAvatar = user.urlAvatar;
        userChatted.gender = user.gender;
        userChatted.strStatus = @"iTel iTell";//user.statusName;
        [appDelegate addFriendChatted:userChatted];
    }
    if (self = [self initWithNibName:@"ChattingViewController" bundle:nil]) {
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillShow:)
													 name:UIKeyboardWillShowNotification
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillHide:)
													 name:UIApplicationDidFinishLaunchingNotification
												   object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lbTitle.text = userData.name;
     NSLog(@"USER Name %@",userData.name);
    self.navigationController.navigationBarHidden = TRUE;
    self.smsArray = [[NSMutableArray alloc] init];
    
   // [tblView setFrame:CGRectMake(0, 50, 320, 360)];
    textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake((viewBar.frame.size.width - 240)/2, 3, 240, 40)];
    textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
	textView.minNumberOfLines = 1;
	textView.maxNumberOfLines = 6;
	textView.returnKeyType = UIReturnKeyGo; //just as an example
	textView.font = [UIFont systemFontOfSize:15.0f];
	textView.delegate = self;
    textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    textView.backgroundColor = [UIColor clearColor];

    backgroundChatbox.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    backgroundChatbar.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [viewBar addSubview:textView];
    [btSend setEnabled:NO];

}
- (void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target {
    if ([target isEqualToString:kGetTimeRemain]) {
        NSLog(@"%@",[dictionData objectForKey:@"server"]);
        NSString *urlHost = [dictionData objectForKey:@"server"];
        NSArray *arrString = [urlHost componentsSeparatedByString:@":"];
        linkHost = [[arrString objectAtIndex:0] retain];
        port = [[arrString objectAtIndex:1] intValue];
        socketIO = [[SocketIO alloc] initWithDelegate:self];
        //socketIO.useSecure = NO;
        NSLog(@"host:%@ port:%d",linkHost,port);
        [socketIO connectToHost:linkHost onPort:port];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated]; 
    NSTimer *_timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateRemainTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    uuid = [Global shareGlobal].user.uuid;
    userId = [Global shareGlobal].user.userID;
    
    _apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kGetTimeRemain];
    NSString *strUrl = [NSString stringWithFormat:@"%@itell/chat/get_server?user_id=%d&uuid=%@",URL,userId,uuid];
    NSLog(@"URL:%@",strUrl);
    [_apiRequest requestUsingGetMethod:strUrl];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
//    
//    socketIO.delegate = nil;
//    [socketIO close];
//    socketIO = nil;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
/////
- (IBAction)resignTextView:(id)sender
{
    [viewStamps removeFromSuperview];
    viewStamps = nil;
    NSLog(@"text typed:%@",textView.text);
    UIView *smsView = [self bubbleView:[NSString stringWithFormat:@"%@", textView.text]
                                  from:YES];
    [smsArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:textView.text, @"text", smsView, @"view", nil]];
    [tblView reloadData];
    [tblView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[smsArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    [btSend setEnabled:NO];
    
    NSDictionary * dicData = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",userId],@"sender",[NSString stringWithFormat:@"%d",userData.userID],@"receiver",textView.text,@"msg", nil];    
    SBJsonWriter *jsonWriter = [SBJsonWriter new];  
    NSString *jsonString = [jsonWriter stringWithObject:dicData];
    
    [socketIO sendEvent:@"message" withData:jsonString andAcknowledge:^(id argsData) {
        NSDictionary *response = argsData;
        NSLog(@"message send successfully: %@", response);
    }];
    textView.text = @"";
}
- (IBAction)showStamp:(id)sender{
//    CGRect frame = viewBar.frame;
//    [textView resignFirstResponder];
//    viewBar.frame = frame;
//    viewStamps = [[ViewStamps alloc] initWithFrame:CGRectZero];
//    viewStamps.frame = CGRectMake(0, 263, 320, 220);
//    NSLog(@"%f===%f",frame.origin.y,frame.size.height);
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [appDelegate.window.rootViewController.view addSubview:viewStamps];
}
- (void) keyboardWillShow:(NSNotification *)note{
    [tblView setFrame:CGRectMake(0, 72, 320, 127)];
    // get keyboard size and loctaion
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
	// get a rect for the textView frame
	CGRect containerFrame = viewBar.frame;
    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height - 50);
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
	
	// set views with new info
	viewBar.frame = containerFrame;
	
	// commit animations
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
	
	// get a rect for the textView frame
	CGRect containerFrame = viewBar.frame;
    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
	
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
	// set views with new info
	viewBar.frame = containerFrame;
	
	// commit animations
	[UIView commitAnimations];
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    
	CGRect r = viewBar.frame;
    r.size.height -= diff;
    r.origin.y += diff;
	viewBar.frame = r;
}

- (IBAction)viewChat:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)viewSrote:(id)sender {
    StampStoreController *chatting = [[StampStoreController alloc] initWithNibName:@"StampStoreController" bundle:Nil];
    [self.navigationController pushViewController:chatting animated:TRUE];
}
#pragma mark TextView 
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [txtView resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [txtView resignFirstResponder];
    return YES;
}
/*Button send se an khi chua go text, neu go text thi moi enable len*/
- (BOOL)growingTextView:(HPGrowingTextView *)growingTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@""]) {
        [btSend setEnabled:NO];
    }else {
        [btSend setEnabled:YES];
    }
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationBeginsFromCurrentState:YES];
    viewBar.frame = CGRectMake(viewBar.frame.origin.x, (viewBar.frame.origin.y - 165.0), viewBar.frame.size.width, viewBar.frame.size.height);
    [UIView commitAnimations];
}
-(void)textViewDidEndEditing:(UITextView *)textView {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationBeginsFromCurrentState:YES];
    viewBar.frame = CGRectMake(viewBar.frame.origin.x, (viewBar.frame.origin.y + 165.0), viewBar.frame.size.width, viewBar.frame.size.height);
    [UIView commitAnimations];
}
#pragma mark Table view methods
- (UIView *)bubbleView:(NSString *)text from:(BOOL)fromSelf
{
	// build single chat bubble cell with given text
	UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
	returnView.backgroundColor = [UIColor clearColor];
	
	UIImage *bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fromSelf?@"bubbleSelf@2x":@"bubbleBlue@2x" ofType:@"png"]];
	UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:21 topCapHeight:14]];
	if(fromSelf) {
        bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:5 topCapHeight:14]];
    }else {
        bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:21 topCapHeight:14]];
    }
	UIFont *font = [UIFont systemFontOfSize:16];
	CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(150.0f, 1000.0f) lineBreakMode:UILineBreakModeCharacterWrap];
	
	UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 5.0f, size.width+5, size.height+5)];
	bubbleText.backgroundColor = [UIColor clearColor];
	bubbleText.font = font;
	[font release];
	bubbleText.numberOfLines = 0;
	bubbleText.lineBreakMode = UILineBreakModeCharacterWrap;
	bubbleText.text = text;
	NSLog(@"text = %@", text);
	
	
	
	//For Date&Time Display
	//For Date&Time Display
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    NSLog(@"date = :%@", currentTime);
    [dateFormatter release];
	UILabel *datetimeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
	datetimeLabel.font = [UIFont boldSystemFontOfSize:10];
	datetimeLabel.tag = kDateTimeValueTag;
	datetimeLabel.textAlignment = UITextAlignmentCenter;
	datetimeLabel.text = currentTime;
	datetimeLabel.textColor = [UIColor lightGrayColor];
	[datetimeLabel setBackgroundColor:[UIColor clearColor]];
	
	if(fromSelf){
        bubbleImageView.frame = CGRectMake(0.0f, 15.0f, size.width + 20.0f, size.height+20.0f);
		returnView.frame = CGRectMake(ALIGHT_RIGHT - size.width - 20.0f, 0.0f, 200.0f, size.height+20.0f);
		datetimeLabel.frame = CGRectMake(size.width - 30, 0.0f, 50.0f, 20.0f);
	}else{
        
        UIImageView *imgBordeAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_border.png"]];
        imgBordeAvatar.frame = CGRectMake(ALIGHT_LEFT, 2, 42, 42);
        [returnView addSubview:imgBordeAvatar];
        [imgBordeAvatar release];
        imgBordeAvatar = nil;
        UIImageView *imgAvatar = [[UIImageView alloc] initWithImage:[UIImage imageWithData:dataImageFriend]];
        imgAvatar.frame = CGRectMake(ALIGHT_LEFT, 2, 42, 42);
        [returnView addSubview:imgAvatar];
		returnView.frame = CGRectMake(0.0f, 0.0f, 200.0f, size.height+20.0f);
		datetimeLabel.frame = CGRectMake(45.0f, 0.0f, 50.0f, 20.0f);
        bubbleImageView.frame = CGRectMake(45, 15.0f,  size.width + 20.0f, size.height+20.0f);
	}
    
	[returnView addSubview:bubbleImageView];
	[bubbleImageView addSubview:bubbleText];
	[bubbleText release];
    [bubbleImageView release];
	[returnView addSubview:datetimeLabel];
	[datetimeLabel release];
    
	return [returnView autorelease];
}
#pragma mark tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [smsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SMSPreviewCellIdentifier = @"SMSPreviewCellIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SMSPreviewCellIdentifier];
	[tableView setSeparatorColor:[UIColor redColor]];
	//tableView.backgroundColor = [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
	NSLog(@"cellForRowAtIndexPath");
	if (cell == nil) {
		NSLog(@"cell = nil");
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SMSPreviewCellIdentifier] autorelease];
		cell.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	// Set up the cell...
	NSDictionary *chatInfo = [smsArray objectAtIndex:[indexPath row]];
	for(UIView *subview in [cell.contentView subviews]){
		[subview removeFromSuperview];
	}
	[cell.contentView insertSubview:[chatInfo objectForKey:@"view"] atIndex:1];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Change the height if Edit Unknown Contact is the row selected
	NSLog(@"Set Height");
	if ([smsArray count]) {
		self.navigationItem.rightBarButtonItem.enabled = YES;
	}
	UIView *chatView = [[smsArray objectAtIndex:[indexPath row]] objectForKey:@"view"];
	//positionDateTime = chatView.frame.size.height+10.0f;
	return chatView.frame.size.height+15.0f;
}
//for chat
- (void)socketIO:(SocketIO *)socket didReceiveMessage:(SocketIOPacket *)packet {
    NSLog(@"did receive message");
}
- (void)socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet {
    NSDictionary *jsonParse = [packet.data JSONValue];
    //[NSJSONSerialization JSONObjectWithData: [strJson dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: &e];
    NSArray *strData = [jsonParse objectForKey:@"args"];
    NSDictionary *strJson = [strData objectAtIndex:0];
    if ([strJson isKindOfClass:[NSDictionary class]]) {
        NSString *strReceive = [strJson objectForKey:@"msg"];
        //[jsonParse objectForKey:@"name"];
        NSString *strState = [jsonParse objectForKey:@"name"];
        NSLog(@"strReceive %@",[jsonParse objectForKey:@"name"]);
        if([strState isEqualToString:@"logout"]) {}
//        if (![strReceive isKindOfClass:[NSNull class]]) {
//            UIView *smsView = [self bubbleView:[NSString stringWithFormat:@"%@", [strJson objectForKey:@"msg"]] from:NO];
//            [smsArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:[strJson objectForKey:@"msg"], @"text", smsView, @"view", nil]];
//            [tblView reloadData];
//        }
    }else {
        NSDictionary *dictData = [[strData objectAtIndex:0] JSONValue];
        NSLog(@"afdafsdfsfd %@",[dictData objectForKey:@"msg"]);
        UIView *smsView = [self bubbleView:[NSString stringWithFormat:@"%@", [dictData objectForKey:@"msg"]] from:NO];
        [smsArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:[dictData objectForKey:@"msg"], @"text", smsView, @"view", nil]];
        [tblView reloadData];
    }
}
- (void)socketIO:(SocketIO *)socket didSendMessage:(SocketIOPacket *)packet {
    NSLog(@"send Message");
}
- (void)socketIODidConnect:(SocketIO *)socket {
    NSLog(@"aaa Dic connect");
    NSDictionary * dicData = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",userId],@"user_id",uuid,@"uuid", nil];
    SBJsonWriter *jsonWriter = [SBJsonWriter new];  
    NSString *jsonString = [jsonWriter stringWithObject:dicData];  
//    NSString *json = @"{\"args\":[{\"user_id\":\"233479\",\"uuid\":\"58EB77D1-4FC0-4D6B-8E5B-CE922A5F711F\"}],\"name\":\"join_server\"}";
    [socket sendEvent:@"join_server" withData:jsonString andAcknowledge:^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"ack arrived bbbb: %@", response);

    }];
}
- (void)socketIODidDisconnect:(SocketIO *)socket {
    NSLog(@"aaa Dic socketIODidDisconnect");
    NSLog(@"host:%@ port:%d",linkHost,port);
    [socket connectToHost:linkHost onPort:port];
}
- (void)socketIOHandshakeFailed:(SocketIO *)socket {
    NSLog(@"aaa Dic socketIOHandshakeFailed");
    NSLog(@"host:%@ port:%d",linkHost,port);
    [socket connectToHost:linkHost onPort:port];
}
- (void)socketIO:(SocketIO *)socket failedToConnectWithError:(NSError *)error {
    NSLog(@"ERROR: %@",error);
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
