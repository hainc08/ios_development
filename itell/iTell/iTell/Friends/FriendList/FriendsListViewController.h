//
//  FriendsListViewController.h
//  iTell
//
//  Created by tranduc on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRequest.h"
#define kTargetGetListFriend @"getListFriends"
@interface FriendsListViewController : UIViewController<ApiRequestDelegate>
@property (retain, nonatomic) IBOutlet UITableView *table;

- (IBAction)btBackPressed:(id)sender;

@end
