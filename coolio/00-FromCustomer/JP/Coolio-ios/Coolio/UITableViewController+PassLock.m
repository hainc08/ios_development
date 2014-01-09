//
//  UITableViewController+PassLock.m
//  Coolio
//
//  Created by hoehoe on 2013/05/02.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import "UITableViewController+PassLock.h"

@implementation UITableViewController (PassLock)

- (void)openPasscodeView
{
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheRefresh:) name:@"ToNotifyTheRefresh" object:nil];
    
    //if (&UIApplicationDidEnterBackgroundNotification) {
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(toNotifyBackground:)
    //                                                 name:UIApplicationDidEnterBackgroundNotification
    //                                               object:[UIApplication sharedApplication]];
    //}

    //if(&UIApplicationWillResignActiveNotification){
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(toNotifyBackground:)
    //                                                 name:UIApplicationDidEnterBackgroundNotification
    //                                               object:[UIApplication sharedApplication]];
    //}
    
    if (&UIApplicationDidBecomeActiveNotification) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(toNotifyDidBecomeActiveNotification:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:[UIApplication sharedApplication]];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyPasscodeDismiss:) name:@"KKPasscodeDismiss" object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyUnRead:) name:@"ToNotifyUnRead" object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheUnreadCount:) name:@"ToNotifyTheUnreadCount" object:nil];
}

//バックグラウンド処理が通知された時に呼ばれる
/*
-(void)toNotifyBackground:(NSNotification *)notification
{
    CoolioWebService* coolio = [[CoolioWebService alloc] init];
    MyProfiles* account = [[MyProfiles alloc] init];
    
    NSString* myId = [account getEmailProfile];
    [coolio doLogOff:myId];
}
*/

-(void)toNotifyDidBecomeActiveNotification:(NSNotification*)notification{
    if(isRegisterEmailGlobal == NO){
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

/*
-(void)toNotifiUnRead:(NSNotification *)notification
{
    MyProfiles* account = [[MyProfiles alloc] init];
    CoolioWebService* coolio = [[CoolioWebService alloc] init];
    
    [coolio getMyUnreadCount:[account getEmailProfile]];

}

-(void)toNotifyTheUnreadCount:(NSNotification *)notification
{
    NSDictionary* _myUnReadDict = [[notification object] mutableCopy];
    unreadCountDictGlobal = _myUnReadDict;
}
*/

-(void)toNotifyPasscodeDismiss:(NSNotification *)notification
{
    //NSLog(@"dismiss Passcode view.");
    if([self checkRequireParameter] == NO){
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        LoginViewController* loginViewController = [storyBoard instantiateViewControllerWithIdentifier:@"loginViewController"];
        //RegistViewController* registView = [storyBoard instantiateViewControllerWithIdentifier:@"registViewController"];
        //[self.window makeKeyAndVisible];
        //[self.window.rootViewController presentViewController:registView animated:YES completion:nil];
        
        //RegistViewController* registView = [self.storyboard instantiateViewControllerWithIdentifier:@"registViewController"];
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
