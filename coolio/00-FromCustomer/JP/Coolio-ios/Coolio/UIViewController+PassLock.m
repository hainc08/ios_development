//
//  UIViewController+PassLock.m
//  Coolio
//
//  Created by hoehoe on 2013/05/02.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "UIViewController+PassLock.h"

@implementation UIViewController (PassLock)

- (void)openPasscodeView
{
    //if (&UIApplicationDidEnterBackgroundNotification) {
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(toNotifyBackground:)
    //                                                 name:UIApplicationDidEnterBackgroundNotification
    //                                               object:[UIApplication sharedApplication]];
    //}
    
    if(&UIApplicationWillResignActiveNotification){
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(toNotifyBackground:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:[UIApplication sharedApplication]];
    }
    
    if (&UIApplicationDidBecomeActiveNotification) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(toNotifyDidBecomeActiveNotification:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:[UIApplication sharedApplication]];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyPasscodeDismiss:) name:@"KKPasscodeDismiss" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheHTTPError:) name:@"ToNotifyTheHTTPError" object:nil];
}

//バックグラウンド処理が通知された時に呼ばれる
-(void)toNotifyBackground:(NSNotification *)notification
{
    CoolioWebService* coolio = [[CoolioWebService alloc] init];
    MyProfiles* account = [[MyProfiles alloc] init];
    
    NSString* myId = [account getEmailProfile];
    [coolio doLogOff:myId];
}

-(void)toNotifyDidBecomeActiveNotification:(NSNotification*)notification{
    if ([[KKPasscodeLock sharedLock] isPasscodeRequired]) {
        KKPasscodeViewController *vc = [[KKPasscodeViewController alloc] initWithNibName:nil bundle:nil];
        vc.mode = KKPasscodeModeEnter;
        vc.delegate = self;
        
        dispatch_async(dispatch_get_main_queue(),^ {
            [SVProgressHUD dismiss];
            [self.navigationController presentViewController:vc animated:YES completion:nil];
        });
        
    }
    
}
// - KKPasscodeViewControllerDelegate
- (void)shouldEraseApplicationData:(KKPasscodeViewController*)viewController
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"You have entered an incorrect passcode too many times. All account data in this app has been deleted." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

// - KKPasscodeViewControllerDelegate
- (void)didPasscodeEnteredIncorrectly:(KKPasscodeViewController*)viewController
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"You have entered an incorrect passcode too many times." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}



-(void)NetworkCheck
{
    if( [AppDelegate NetworkCheckConnect] == NO){
        UIAlertView* alert  = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"NETWORK_ERROR", nil) delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

-(void)toNotifyTheHTTPError:(NSNotification *)notification
{
    //NSDictionary* _userInfo = [notification userInfo];
    //NSNumber* errorCode = [_userInfo valueForKey:@"HTTP_ERROR"];
    [SVProgressHUD dismiss];
    UIAlertView* _alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [_alert show];
}


-(void)toNotifyPasscodeDismiss:(NSNotification *)notification
{
   // NSLog(@"dismiss Passcode view.");
    if([self checkRequireParameter] == NO){
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        LoginViewController* loginViewController = [storyBoard instantiateViewControllerWithIdentifier:@"loginViewController"];
        [self presentViewController:loginViewController animated:YES completion:nil];
    }
}


-(BOOL)checkRequireParameter
{
    BOOL retBool = YES;
    MyProfiles* account = [[MyProfiles alloc] init];
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
