//
//  FrendsViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/04.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountDetailViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"

#import "CoolioWebService.h"
#import "MyProfiles.h"
#import "GlobalObjects.h"
#import "UserProfile.h"
#import "SVProgressHUD.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface FrendsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    NSArray* friendCollections;
    CoolioWebService* coolio;
    NSString* myId;
}

@property (weak, nonatomic) IBOutlet UITableView *tblView;

-(void)toNotifyTheGetMyFriend:(NSNotification *)notification;
- (IBAction)revealMenu:(id)sender;
@end
