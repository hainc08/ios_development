//
//  FootprintNotificationViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountDetailViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"
#import "GlobalObjects.h"
#import "CoolioWebService.h"
#import "UserProfile.h"
#import "SVProgressHUD.h"

@interface FootprintNotificationViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    CoolioWebService* coolio;
    NSArray* footPrintCollections;
    NSString* myId;
}
@property (weak, nonatomic) IBOutlet UITableView *tblView;

- (IBAction)revealMenu:(id)sender;

@end
