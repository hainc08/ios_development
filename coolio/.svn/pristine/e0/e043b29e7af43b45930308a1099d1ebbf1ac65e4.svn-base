//
//  SilentMatchViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"

#import "AccountDetailViewController.h"
#import "CoolioWebService.h"
#import "MyProfiles.h"
#import "GlobalObjects.h"
#import "UserProfile.h"
#import "SVProgressHUD.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface SilentMatchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    NSArray* silentMatchCollections;
    NSString* myId;
    CoolioWebService* coolio;
}
//@property (nonatomic)NSString* userId;
@property (weak, nonatomic) IBOutlet UITableView *tblView;

- (void)toNotifyTheGetMySilentMatch:(NSNotification *)notification;
- (IBAction)revealMenu:(id)sender;

@end
