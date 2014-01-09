//
//  SendAdditionEmailController.m
//  iTell
//
//  Created by tranduc on 9/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SendAdditionEmailController.h"
#import "ITMarco.h"
#import "ApiRequest.h"
#import "Global.h"
#import "AppDelegate.h"
#import "UserData.h"

#define kTargetInviteEmail @"inviteEmail"

@interface SendAdditionEmailController ()
@property(nonatomic, retain)ApiRequest *apiRequest;
@end

@implementation SendAdditionEmailController
@synthesize tfEmail;
@synthesize apiRequest;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTfEmail:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [tfEmail release];
    [apiRequest release];
    [super dealloc];
}
- (IBAction)sendEmailPressed:(id)sender {
    [tfEmail resignFirstResponder];
    UserData *user = [Global shareGlobal].user;
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetInviteEmail];
    NSString *url = [SERVER_URL stringByAppendingFormat:@"friend/send_invite_email"];
    
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:
                           user.uuid, @"uuid",
                           [NSNumber numberWithInt:user.userID], @"user_id",
                           @"noname", @"name",
                           tfEmail.text, @"email", nil];
    [apiRequest requestUsingPostMethod:url postData:param];
    [[AppDelegate instance] showBusyView:YES withText:@"Sending..."];
}

- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - apidelegate
-(void)requestFinished:(NSDictionary *)dictionData andTarget:(NSString *)target{
    NSNumber *retval = [dictionData valueForKey:@"retval"];
    if ([target isEqualToString:kTargetInviteEmail]) {
        [[AppDelegate instance] showBusyView:NO withText:nil];
        if (![retval boolValue]) {
            UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send error" message:[dictionData objectForKey:@"error_msg"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [al show];
            [al release];
        }else {
            
        }
    }
    
}
-(void)requestFailedTarget:(NSString *)target errorMsg:(NSString *)msg{
    [[AppDelegate instance] showBusyView:NO withText:nil];
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Send error" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    [al release];
}

#pragma mark UIalert delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}
@end
