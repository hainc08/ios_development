//
//  MenueViewController.h
//  Coolio
//
//  Created by hoehoe on 2013/03/23.
//  Copyright (c) 2013年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MySession.h"
#import "LoginViewController.h"
#import "GlobalObjects.h"
#import "UIViewController+PassLock.h"
//#import "MyNotificationCountValue.h"

@interface MenuViewController : UIViewController<UITableViewDataSource, UITabBarControllerDelegate, UITableViewDelegate, UIActionSheetDelegate>
{
    NSInteger _chatSumBadgeCount;
    NSInteger _friendRequestBadgeCount;
    NSInteger _matchBadgeCount;
    NSInteger _footPrintBadgeCount;
    NSInteger _alertBadgeCount;
    NSInteger _infomationBadgeCount;
}


@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@property (weak, nonatomic) IBOutlet UITableView *tblView;

@property (nonatomic) NSInteger chatSumBadgeCount;
@property (nonatomic) NSInteger friendRequestBadgeCount;
@property (nonatomic) NSInteger matchBadgeCount;
@property (nonatomic) NSInteger footPrintBadgeCount;
@property (nonatomic) NSInteger alertBadgeCount;
@property (nonatomic) NSInteger infomationBadgeCount;

@property(nonatomic, strong) NSString* idMemberCell;
@property(nonatomic, strong) NSString* idMyFriendCell;
@property(nonatomic, strong) NSString* idSilentMatchCell;
@property(nonatomic, strong) NSString* idHistoryCell;
@property(nonatomic, strong) NSString* idChatCell;
@property(nonatomic, strong) NSString* idFriendNotificationCell;
@property(nonatomic, strong) NSString* idMatchNotificationCell;
@property(nonatomic, strong) NSString* idFootprintNotificationCell;
@property(nonatomic, strong) NSString* idAlertCell;
@property(nonatomic, strong) NSString* idSettingCell;
@property(nonatomic, strong) NSString* idPassLockCell;
@property(nonatomic, strong) NSString* idTermPolicyCell;
@property(nonatomic, strong) NSString* idUnsubCell;
@property(nonatomic, strong) NSString* idLogoutCell;
@property(nonatomic, strong) NSString* idInfoCell;

@property (nonatomic, strong) NSArray *sectionItems;

@property (nonatomic, strong) NSArray *meetItems;
@property (nonatomic, strong) NSArray *chatItems;
@property (nonatomic, strong) NSArray *notificationItems;
@property (nonatomic, strong) NSArray *alertItems;
@property (nonatomic, strong) NSArray *settingsItems;

@property CGFloat sectionHeaderHeight;
//@property (nonatomic, retain) UINavigationBar *naviBar;


@end
