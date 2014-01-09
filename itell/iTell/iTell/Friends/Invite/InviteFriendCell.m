//
//  InviteFriendCell.m
//  iTell
//
//  Created by tranduc on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InviteFriendCell.h"
#import "ITMarco.h"
#import "ApiRequest.h"
#import "Global.h"
#import "AppDelegate.h"
#import "UserData.h"

#define kTargetInviteEmail @"inviteEmail"

@interface InviteFriendCell()
@property(nonatomic, retain)ApiRequest *apiRequest;
@end

@implementation InviteFriendCell
@synthesize lbName;
@synthesize lbEmail;
@synthesize friendData;
@synthesize apiRequest;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [lbName release];
    [lbEmail release];
    [friendData release];
    [super dealloc];
}
- (IBAction)btInvitePressed:(id)sender {
    UserData *user = [Global shareGlobal].user;
    self.apiRequest = [[ApiRequest alloc] initWithDelegate:self andTarget:kTargetInviteEmail];
    NSString *url = [SERVER_URL stringByAppendingFormat:@"friend/send_invite_email"];
    
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:
                           user.uuid, @"uuid",
                           [NSNumber numberWithInt:user.userID], @"user_id",
                           friendData.name, @"name",
                           friendData.email, @"email", nil];
    [apiRequest requestUsingPostMethod:url postData:param];
    [[AppDelegate instance] showBusyView:YES withText:@"Sending..."];
}

-(void)setUpFriend:(InviteFriendData *)friends{
    self.friendData = friends;
    lbName.text = friendData.name;
    lbEmail.text = friendData.email;
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
