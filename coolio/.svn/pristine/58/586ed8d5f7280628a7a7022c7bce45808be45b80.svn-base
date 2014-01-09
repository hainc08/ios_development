//
//  LoginViewController.m
//  Coolio
//
//  Created by hoehoe on 2013/05/16.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize cell_login;
@synthesize cell_regist;
@synthesize cell_forgotPassword;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    account = [[MyProfiles alloc] init];
    coolio = [[CoolioWebService alloc] init];
    
    self.txt_id.delegate = self;
    self.txt_password.delegate = self;
    
    self.txt_id.keyboardType = UIKeyboardTypeEmailAddress;
    self.txt_password.keyboardType = UIKeyboardTypeASCIICapable;
    [self.txt_password setSecureTextEntry:YES];
    
    //ToNotifyLogin
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyLogin:) name:@"ToNotifyLogin" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheMyInfo:) name:@"ToNotifyGetMyInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyRegistRedirect:) name:@"ToNotifyRegistRedirect" object:nil];

    if([AppDelegate NetworkCheckConnect] == NO){
        [AppDelegate showDisconnectAlert];
    }
    
    /*
    if (&UIApplicationLaunchOptionsAnnotationKey) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(toNotifyLaunchOptionsAnnotationKey:)
                                                     name:UIApplicationLaunchOptionsAnnotationKey
                                                   object:[UIApplication sharedApplication]];
    }
    if (&UIApplicationDidBecomeActiveNotification) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(toNotifyDidBecomeActiveNotification:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:[UIApplication sharedApplication]];
    }
    */
    [self openPasscodeView];
    //NSLog(@"Login View did load.");

    if(isRegisterEmailGlobal == YES){
        return;
    }
    if(isRegisterEmailGlobal == NO){
        [SVProgressHUD dismiss];
        [self performSelector:@selector(aaa) withObject:nil afterDelay:1.0f];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    // super
    [super viewWillAppear:animated];
    
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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //NSLog(@"Login View did appear.");
    if(isRegisterEmailGlobal == YES){
        [self toNotifyRegistRedirect:nil];
    }//else{
        //[self performSelector:@selector(aaa) withObject:nil afterDelay:1.0f];
    //}
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

-(void)aaa
{
    if(isRegisterEmailGlobal == YES){
        return;
    }
    if(isRegisterEmailGlobal == NO){
        if ([[KKPasscodeLock sharedLock] isPasscodeRequired]) {
            KKPasscodeViewController *vc = [[KKPasscodeViewController alloc] initWithNibName:nil bundle:nil];
            vc.mode = KKPasscodeModeEnter;
            vc.delegate = self;
            [self.navigationController presentViewController:vc animated:YES completion:nil];
        }
    }
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
    if([account getEmailProfile] == nil){
        return 2;
    }else{
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell = cell_login;
            break;
        case 1:
            if([account getEmailProfile] == nil){
                cell = cell_regist;
            }else{
                cell = cell_forgotPassword;
            }
            break;
        case 2:
            cell = cell_regist;
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
    keyboardFrame = [_scrollView.superview
                     convertRect:keyboardFrame
                     fromView:nil];
    textViewFrame = _scrollView.frame;
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
    rect.origin.y = _scrollView.contentSize.height - 1.0f;
    rect.size.width = CGRectGetWidth(_scrollView.frame);
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

- (IBAction)txt_id_EditingDidEnd:(id)sender {
    [self.txt_id resignFirstResponder];
}

- (IBAction)txt_password_EditingDidEnd:(id)sender {
    [self.txt_password resignFirstResponder];
}

- (IBAction)btn_loginPush:(id)sender {
    
    MyAgreement* agreement = [[MyAgreement alloc] init];
    if([agreement getAgreement] != YES){

        
        NSString* polFileName;
        NSString* filePath;
        
        
        if([currentLanguage isEqualToString:@"ja"]){
            polFileName = @"terms_ja.txt";
        }else{
            polFileName = @"terms_en.txt";
        }
        
        filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:polFileName];
        
        NSError* error = nil;
        
        // TextFilePath で指定されたテキストファイルを UTF8 形式で開きます。
        NSString* fileData = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        
        
        //"POL_TITLE" = "利用規約に同意";
        //"ALERT_POL_AGREE" = "同意する";
        //"ALERT_POL_DISAGREE" = "同意しない";
        
        //@"Do you agree to the terms?"
        UIAlertView* alert = [UIAlertView alertViewWithTitle:NSLocalizedString(@"AGREEMENT_MESSAGE1", nil) message:fileData];
        [alert addButtonWithTitle:@"OK" handler:^(void){
            [agreement setAgreement:YES];
        }];
        
        [alert setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){
            // @"Please agree to the terms."
            UIAlertView* _alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"AGREEMENT_MESSAGE2", nil) delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [_alert show];
        }];
        
        [alert show];
    }else{
        NSString* loginID = self.txt_id.text;
        NSString* loginPass= self.txt_password.text;
        
        //@"Login ID or Password is empty."
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"ALERT_LOGIN_EMPTY", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        if([loginID length] < 1 || [loginPass length] < 1){
            [alert show];
        }else{
            if([AppDelegate NetworkCheckConnect] == NO){
                [AppDelegate showDisconnectAlert];
            }else{
                [coolio doLogin:loginID password:loginPass];
                [SVProgressHUD show];
            }
        }
    }
}

-(void)toNotifyLogin:(NSNotification *)notification
{
    NSString* loginState = [notification object];
    //NSLog(@"loginState: %@", loginState);
    
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        if([loginState isEqualToString:@"success"]){
            isLoginState = YES;
            
            [account setPasswordProfile:self.txt_password.text];
            [coolio getMyInfo:self.txt_id.text];
        }else if([loginState isEqualToString:@"lock"]){
            [SVProgressHUD dismiss];
            isLoginState = NO;
            //@"This account locked."
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_LOGIN_LOCKED", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else{
            [SVProgressHUD dismiss];
            isLoginState = NO;
            //@"Login ID or Password is different."
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_LOGIN_DIFFERENT", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    });
}


-(void)toNotifyTheMyInfo:(NSNotification *)notification
{
    @try {
        NSArray* myArray = [[notification object] mutableCopy];
        
        if([myArray isEqual:[NSNull null]]) return;
        
        NSMutableDictionary* myInfo = [myArray[0] mutableCopy];
        
        if([myInfo isEqual:[NSNull null]]) return;
        
        //NSLog(@"%@", myInfo);
        [myInfo removeObjectForKey:@"password"];
        [myInfo setValue:self.txt_password.text forKey:@"password"];
        //NSDictionary* myInfo = [[notification object] mutableCopy];
        //NSLog(@"%@", myInfo);
        [self syncAccount:myInfo];
        
    } @catch (NSException* ex) {
        //NSLog(@"%@", ex.description);
    } @finally {
    }
}

-(void)syncAccount:(NSDictionary *)myInfo
{
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        [account sync:myInfo];
        
        MyNotification* notice = [[MyNotification alloc] init];
        [notice sync:myInfo];
        
        MyPicture* picture = [[MyPicture alloc] init];
        [picture sync:myInfo];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            session = [[MySession alloc] init];
            [session doLogOut:NO];
            if(isLoginState == YES){
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
            }
        });
    });
}

-(void)toNotifyRegistRedirect:(NSNotification *)notification
{
    if(isRegisterEmailGlobal == YES){
        //NSLog(@"toNotifyRegistRedirect call");
        //settings
        NewAccountSettingsViewController* settingsView = [self.storyboard instantiateViewControllerWithIdentifier:@"newAccountSettingsViewController"];
        [self presentViewController:settingsView animated:YES completion:nil];
    }
    
}

-(BOOL)checkRequireParameter
{
    BOOL retBool = YES;
    if(account == nil){
        account = [[MyProfiles alloc] init];
    }
    
    if([account getEmailProfile] == nil || [[account getEmailProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getPasswordProfile] == nil || [[account getPasswordProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getNickNameProfile] == nil || [[account getNickNameProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getAgeProfile] == nil || [[account getAgeProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getHeightProfile] == nil || [[account getHeightProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getWeightProfile] == nil || [[account getWeightProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getSexuallityProfile] == nil){
        retBool = NO;
    }else{
        NSDictionary* sexuallityDict = [account getSexuallityProfile];
        if([[sexuallityDict valueForKey:@"sexGayProfile"] boolValue] == NO &&
           [[sexuallityDict valueForKey:@"sexBisexProfile"] boolValue] == NO &&
           [[sexuallityDict valueForKey:@"sexStraightProfile"] boolValue] == NO)
        {
            retBool = NO;
        }
    }
    
    if([account getRaceProfile] == nil){
        retBool = NO;
    }else{
        NSDictionary* raceDict = [account getRaceProfile];
        if([[raceDict valueForKey:@"raceAsianProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceWhiteProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceBlackProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceLatinProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceArabProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"racePolynesianProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceMixProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceEtcProfile"] boolValue] == NO)
        {
            retBool = NO;
        }
    }
    
    if([account getCountryProfile] == nil || [[account getCountryProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    return retBool;
}


@end
