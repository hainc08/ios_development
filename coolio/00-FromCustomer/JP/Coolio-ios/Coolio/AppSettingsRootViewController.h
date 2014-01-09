//
//  AppSettingsRootViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

#import "MyProfiles.h"
#import "MyFootPrintSettings.h"

#import "MyProfileViewController.h"
#import "ProfilePictureViewController.h"
#import "VisibilityViewController.h"
#import "FootprintNotificationViewController.h"
#import "BlocksViewController.h"
#import "NotificationSettingsViewController.h"

#import "SVProgressHUD.h"
#import "CoolioWebService.h"

#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"

@interface AppSettingsRootViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    MyFootPrintSettings* footPrint;
}

@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (nonatomic, strong) NSArray *sectionItems;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


- (IBAction)btn_savePush:(id)sender;

- (IBAction)revealMenu:(id)sender;

@end
