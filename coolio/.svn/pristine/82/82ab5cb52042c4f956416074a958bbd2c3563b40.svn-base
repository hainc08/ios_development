//
//  UnSubscribeViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/04/15.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "UnSubscribeViewController.h"

@interface UnSubscribeViewController ()

@end

@implementation UnSubscribeViewController
@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self openMenue];
    [self openPasscodeView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.txt_email.delegate = self;
    self.txt_password.delegate = self;
    
    [self.txt_email setKeyboardType:UIKeyboardTypeEmailAddress];
    [self.txt_password setSecureTextEntry:YES];
    
    coolio = [[CoolioWebService alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheDoUnSubscribe:) name:@"ToNotifyTheDoUnSubscribe" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    self.slidingViewController.underRightViewController = nil;
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];

    // Start observing
    if (!_observing) {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(keyboardWillShow:)
                       name:UIKeyboardWillShowNotification
                     object:nil];
        [center addObserver:self
                   selector:@selector(keybaordWillHide:)
                       name:UIKeyboardWillHideNotification
                     object:nil];
        
        _observing = YES;
    }

}

- (void)viewWillDisappear:(BOOL)animated
{
    // super
    [super viewWillDisappear:animated];
    
    // Stop observing
    if (_observing) {
        NSNotificationCenter *center;
        center = [NSNotificationCenter defaultCenter];
        [center removeObserver:self
                          name:UIKeyboardWillShowNotification
                        object:nil];
        [center removeObserver:self
                          name:UIKeyboardWillHideNotification
                        object:nil];
        
        _observing = NO;
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
    return 5;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CGFloat cellHeight = 44.0f;
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0: cellHeight = 88.0f; break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = nil;
    //[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0: cell = [tableView dequeueReusableCellWithIdentifier:self.idCellDescription]; break;
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idCellEmail];
                    self.txt_email = (UITextField *)[cell viewWithTag:1];
                    self.txt_email.delegate = self;
                    break;
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:self.idCellPassword];
                    self.txt_password = (UITextField *)[cell viewWithTag:2];
                    self.txt_password.delegate = self;
                    break;
                case 3: cell = [tableView dequeueReusableCellWithIdentifier:self.idCellNone]; break;
                case 4: cell = [tableView dequeueReusableCellWithIdentifier:self.idCellUnsubButton]; break;
                default: break;
            }
            break;
            
        default:
            break;
    }
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

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */









- (void)keyboardWillShow:(NSNotification*)notification
{
    // Get userInfo
    NSDictionary *userInfo;
    userInfo = [notification userInfo];
    
    // Calc overlap of keyboardFrame and textViewFrame
    CGFloat overlap;
    CGRect keyboardFrame;
    CGRect textViewFrame;
    keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey]
                     CGRectValue];
    keyboardFrame = [_tableView.superview
                     convertRect:keyboardFrame
                     fromView:nil];
    textViewFrame = _tableView.frame;
    overlap = MAX(0.0f,
                  CGRectGetMaxY(textViewFrame) - CGRectGetMinY(keyboardFrame));
    
    // Calc insets of _scrollView
    UIEdgeInsets insets;
    insets = UIEdgeInsetsMake(0.0f, 0.0f, overlap, 0.0f);
    
    // Animate insets of _scrollView
    NSTimeInterval duration;
    UIViewAnimationCurve animationCurve;
    void (^animations)(void);
    duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey]
                doubleValue];
    animationCurve = [userInfo[UIKeyboardAnimationCurveUserInfoKey]
                      integerValue];
    animations = ^(void) {
        // Set insets of _scrollView
        self.tableView.contentInset = insets;
        self.tableView.scrollIndicatorInsets = insets;
    };
    [UIView
     animateWithDuration:duration
     delay:0.0
     options:(animationCurve << 16)
     animations:animations
     completion:nil];
    
    // Scroll to bottom
    CGRect rect;
    rect.origin.x = 0.0f;
    rect.origin.y = _tableView.contentSize.height - 1.0f;
    rect.size.width = CGRectGetWidth(_tableView.frame);
    rect.size.height = 1.0f;
    [self.tableView scrollRectToVisible:rect animated:YES];
}


- (void)keybaordWillHide:(NSNotification*)notification
{
    // Get userInfo
    NSDictionary *userInfo;
    userInfo = [notification userInfo];
    
    // Animate insets of _scrollView
    NSTimeInterval duration;
    UIViewAnimationCurve animationCurve;
    void (^animations)(void);
    duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey]
                doubleValue];
    animationCurve = [userInfo[UIKeyboardAnimationCurveUserInfoKey]
                      integerValue];
    animations = ^(void) {
        // Set insets of _scrollView
        self.tableView.contentInset = UIEdgeInsetsZero;
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
    };
    [UIView
     animateWithDuration:duration
     delay:0.0
     options:(animationCurve << 16)
     animations:animations
     completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)revealMenu:(id)sender
{
    NSString* myId = [[[MyProfiles alloc] init] getEmailProfile];
    //CoolioWebService* coolio = [[CoolioWebService alloc] init];
    [coolio getMyUnreadCount:myId];
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)txt_email_EditingDidEnd:(id)sender {
    [self.txt_email resignFirstResponder];
}

- (IBAction)txt_password_EditingDidEnd:(id)sender {
    [self.txt_password resignFirstResponder];
}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* email = self.txt_email.text;
    NSString* password = self.txt_password.text;
    
    switch (buttonIndex) {
        case 0:
            break;
        case 1:
        {
            if( [AppDelegate NetworkCheckConnect] == YES){
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
                [SVProgressHUD show];
                [coolio doUnSubscribe:email password:password];
            }else{
                [AppDelegate showDisconnectAlert];
            }
        }
            break;
        default:
            break;
    }
}

- (IBAction)btn_unSubscribePush:(id)sender {
    NSString* email = self.txt_email.text;
    NSString* password = self.txt_password.text;
    
    if( (email != nil && ![email isEqualToString:@""]) && (password != nil && ![password isEqualToString:@""]) ){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_UNSUB_CONFIRM", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) otherButtonTitles:@"OK", nil];
        [alert show];
    }else{
        //@"Empty password or E-mail address."
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"Empty password or E-mail address", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)toNotifyTheDoUnSubscribe:(NSNotification *)notification
{
    [SVProgressHUD dismiss];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    UIAlertView* alert = nil;
    
    NSString* retString = [notification object];
    if([retString isEqualToString:@"success"]){
        MyProfiles* account = [[MyProfiles alloc] init];
        [account setEmailProfile:nil];
        [account setPasswordProfile:nil];
        
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [account reset];
        });
        
        MySession* session = [[MySession alloc] init];
        [session doLogOut:YES];

        alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_UNSUB_COMP", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        //[self performSelector:@selector(aaa) withObject:nil afterDelay:0.5];
        LoginViewController* loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        [self presentViewController:loginView animated:YES completion:nil];
    }else{
        alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_UNSUB_INCORRECT", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
