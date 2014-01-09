//
//  ProfileViewController.h
//  iTell
//
//  Created by tranduc on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserData.h"
#import "ApiRequest.h"
#import "FriendData.h"
#import "CustomSwitch.h"

typedef enum {
    kTypeChangeBlock,
    kTypeChangeRestrict
}kTypeChange;

@interface ProfileViewController : UIViewController<ApiRequestDelegate,
    CustomSwitchDelegate, UITabBarDelegate, UITableViewDataSource>


@property(nonatomic, retain)FriendData *userData;
@property (retain, nonatomic) IBOutlet UIScrollView *svChat;
@property (retain, nonatomic) IBOutlet CustomSwitch *csRestrict;
@property (retain, nonatomic) IBOutlet CustomSwitch *csBlock;
@property (retain, nonatomic) IBOutlet UIImageView *ivAvatar;
@property (retain, nonatomic) IBOutlet UILabel *ivName;
@property (retain, nonatomic) IBOutlet UILabel *lbSex;
@property (retain, nonatomic) IBOutlet UILabel *lbAge;
@property (retain, nonatomic) IBOutlet UILabel *lbDescription;
@property (retain, nonatomic) IBOutlet UILabel *lbBadgeGood;
@property (retain, nonatomic) IBOutlet UILabel *lbBadgeNormal;
@property (retain, nonatomic) IBOutlet UILabel *lbBadgeBad;
@property (retain, nonatomic) IBOutlet UITableView *tbAlbum;


- (IBAction)addFriendsBtPressed:(id)sender;
- (IBAction)btChatPressed:(id)sender;
- (IBAction)btBackPressed:(id)sender;

@end
