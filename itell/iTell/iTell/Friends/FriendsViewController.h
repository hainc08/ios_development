//
//  FriendsViewController.h
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsViewCell.h"
#import "ApiRequest.h"
#import "SendContact.h"

#define kMinBgCell 1
#define kCountBgCell 7
#define kNameBgCell @"list-friend-"

#define kKeySendContact @"sendContact"
#define kTagSendContact 17

@interface FriendsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate, 
    ApiRequestDelegate, SendContactDelegate, UIAlertViewDelegate, UIScrollViewDelegate >{
    int pageContactNotFriend;
    int pageContactNotFriendTotal;
    int pageSearchFriend;
    int pageSearchFriendTotal;
}
@property (retain, nonatomic) IBOutlet UITableView *table;
@property (retain, nonatomic) IBOutlet UISearchDisplayController *searchFriendControl;
@property (retain, nonatomic) IBOutlet UISearchBar *sbSearchBar;
@property (retain, nonatomic) IBOutlet UIScrollView *svInvite;

+(NSArray*)arrayFriendsWithArray:(NSArray*)arrData;
- (IBAction)sendContact:(id)sender;

@end
