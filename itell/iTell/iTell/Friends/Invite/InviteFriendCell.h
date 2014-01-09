//
//  InviteFriendCell.h
//  iTell
//
//  Created by tranduc on 9/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InviteFriendData.h"
#import "ApiRequest.h"
@interface InviteFriendCell : UITableViewCell<ApiRequestDelegate, UIAlertViewDelegate>
@property(nonatomic, retain)InviteFriendData *friendData;
@property (retain, nonatomic) IBOutlet UILabel *lbName;
@property (retain, nonatomic) IBOutlet UILabel *lbEmail;
- (IBAction)btInvitePressed:(id)sender;
-(void)setUpFriend:(InviteFriendData*)friends;
@end
