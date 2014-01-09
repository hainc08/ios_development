//
//  NickNameRegister.m
//  iTell
//
//  Created by admin trator on 8/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NickNameRegister.h"
#import "ResultNickNameController.h"
#import "AppDelegate.h"
#import "Global.h"
#import "ITMarco.h"
#import "SBJsonWriter.h"
#import "NSDate+Formater.h"

#define kRegisterUser @" send user info to server"

@implementation NickNameRegister

@synthesize isp, authenCode, mobilePhone;

- (void) dealloc{
    [isp release];
    [mobilePhone release];
    [authenCode release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    nickNameTF = nil;
    yourNameTF = nil;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)agreeBtnClicked:(id)sender{

    if ([nickNameTF.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter your nick name" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    [self sendUserData];
}
- (void) requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    [[AppDelegate instance] showBusyView:NO];
    BOOL result = [[dictionData objectForKey:@"retval"] boolValue];
    if (!result) {
        if ([target isEqualToString:kRegisterUser]) {
            //do something
            [self showAlert:@"Register error"];
                   }
    }
    else if([target isEqualToString:kRegisterUser]) {
        ITLOG(@"dictionData = %@", [dictionData description]);
        
        NSString *userId = [dictionData objectForKey:@"user_id"];
        [Global shareGlobal].user.uuid = [Global getUserUUID];
        [Global shareGlobal].user.nick = nickNameTF.text;
        [Global shareGlobal].user.userID = [userId intValue];
        [Global shareGlobal].user.name = yourNameTF.text;
        [Global shareGlobal].user.birth = birhday;
//        if (birhday) {
//            [birhday release];
//        }
        [Global shareGlobal].user.gender = isFemale;
        [Global shareGlobal].user.mobileNumber = mobilePhone;
        [Global shareGlobal].user.isp = isp;
        ResultNickNameController *resultNickName = [[ResultNickNameController alloc] initWithNibName:@"ResultNickNameController" bundle:Nil];
        [self.navigationController pushViewController:resultNickName animated:TRUE];
        [resultNickName release];
    }
    
}
- (void) requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    [[AppDelegate instance] showBusyView:NO];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert release]; 
}
-(void) sendUserData{
    
    NSString* uuid = [Global getUserUUID];
    NSMutableDictionary *userData = [[NSMutableDictionary alloc] init ];
    [userData setObject:uuid forKey:@"uuid"];
    [userData setObject:nickNameTF.text forKey:@"nick"];
    [userData setObject:yourNameTF.text forKey:@"name"];
    NSString* gender;
    if (isFemale) {
        gender = @"1";
        [userData setObject:@"1" forKey:@"gender"];
    } else {
        gender = @"0";
        [userData setObject:@"0" forKey:@"gender"];
    }
    birhday = [[NSString alloc] initWithFormat:@"%@-%@-%@", yearTF.text, monthTF.text, dayTF.text];
    [userData setObject:birhday forKey:@"birth"];
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:uuid,@"uuid",nickNameTF.text, @"nick", yourNameTF.text, @"name", gender, @"gender",birhday,@"birth", nil];
    SBJsonWriter *jsonWriter = [SBJsonWriter new];
    NSString* userDataStr = [jsonWriter stringWithObject:dic];
    ITLOG(@"userDataSTR %@", userDataStr);
     [userData release];
    
    [[AppDelegate instance] showBusyView:TRUE];
    _apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kRegisterUser];
    [_apiRequest registerUser:mobilePhone authenCode:authenCode isp:isp userData:userDataStr];
   
}


- (IBAction)maleBtnClicked:(id)sender{
    maleImageView.image = [UIImage imageNamed:@"check.png"];
    fremailImageView.image = [UIImage imageNamed:@"uncheck.png"];
    isFemale = FALSE;
}
- (IBAction)fremailBtnClicked:(id)sender{
    maleImageView.image = [UIImage imageNamed:@"uncheck.png"];
    fremailImageView.image = [UIImage imageNamed:@"check.png"];
    isFemale = TRUE;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *array = [NSArray arrayWithObjects:nickNameTF,yourNameTF,yearTF,monthTF,dayTF, nil];
    keyBoardInput = [[AccessoryKeybroad alloc] initWithTextItems:array parent:scrollView];
    nickNameTF.text = @"";

    sexSwitch = [[CustomSwitch alloc] initWithFrame:CGRectMake(240, 243, 40, 26) onLabelText:@"女性" offLabelText:@"男性" onLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_on.png"]] offLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_off.png"]] onLabelTextColor:[UIColor whiteColor] offLabelTextColor:[UIColor whiteColor] sliderColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"handle.png"]]];
    sexSwitch.delegate = self;
    sexSwitch.tag = 1;
    [sexSwitch setOn:TRUE];
    isFemale = TRUE;
    [self.view addSubview:sexSwitch];
    [sexSwitch release];

    birthdaySwitch = [[CustomSwitch alloc] initWithFrame:CGRectMake(240, 304, 40, 26) onLabelText:@"On" offLabelText:@"Off" onLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_on.png"]] offLabelBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"check_box_off.png"]] onLabelTextColor:[UIColor whiteColor] offLabelTextColor:[UIColor whiteColor] sliderColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"handle.png"]]];
    birthdaySwitch.delegate = self;
    birthdaySwitch.tag = 2;
    [birthdaySwitch setOn:TRUE];
    isDisplayBirthday = TRUE;
    [self.view addSubview:birthdaySwitch];
    [birthdaySwitch release];
    
}
-(void)valueChanged:(BOOL)switchValue sender:(CustomSwitch *)sender{

    if (sender.tag == 1) { // sex switch
        isFemale = switchValue;
        NSLog(@"isFe = %d", isFemale);
    } else {
        isDisplayBirthday = switchValue;
        NSLog(@"isDis = %d", isDisplayBirthday);
    }
} 
-(void)showAlert:(NSString*)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert release];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
