//
//  ChatViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/04/07.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageResizable.h"
#import "MyProfiles.h"
#import "CoolioWebService.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import "ChatMessagesViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ChatViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    MyProfiles* account;
    CoolioWebService* coolio;
    NSMutableArray* chatMessages;
    NSString* myId;
    UIRefreshControl* _refreshControl;
    //    static BOOL ____isDisappear;
}

@property BOOL isDisappear;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (strong, nonatomic) IBOutlet UIRefreshControl *refreshControl;

- (IBAction)revealMenu:(id)sender;

@end
