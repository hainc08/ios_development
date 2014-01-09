//
//  MyHistoryViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "AccountDetailViewController.h"
#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"
#import "GlobalObjects.h"
#import "UserProfile.h"
#import "SVProgressHUD.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface MyHistoryViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    CoolioWebService* coolio;
    NSArray* historyCollections;
    NSString* myId;
}
@property (weak, nonatomic) IBOutlet UITableView *tblView;



- (IBAction)revealMenu:(id)sender;
@end
