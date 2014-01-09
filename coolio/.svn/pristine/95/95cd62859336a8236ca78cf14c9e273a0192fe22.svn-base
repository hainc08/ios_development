//
//  ViewController.h
//  Coolio
//
//  Created by hoehoe on 2012/12/11.
//  Copyright (c) 2012年 Gigaworks. corp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import <MapKit/MapKit.h>
#import "UIImageView+WebCache.h"

#import "SVProgressHUD/SVProgressHUD.h"
#import "AppDelegate.h"

#import "BlocksKit.h"
#import "MyApp.h"
#import "MySession.h"
#import "MyProfiles.h"
#import "MyAdditionalFilter.h"
#import "MyUnit.h"
#import "MyFootPrintSettings.h"
#import "MyNotification.h"
//#import "MyDevice.h"
#import "MyFilter.h"

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "ImageResizable.h"
#import "CoolioWebService.h"
#import "AccountDetailViewController.h"
#import "MyReusableView.h"
#import "NewAccountSettingsViewController.h"

#import "GlobalObjects.h"

#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "UIViewController+PassLock.h"
#import "UIViewController+OpenMenue.h"

#import "MyAgreement.h"
@interface ViewController : UIViewController<CLLocationManagerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, MKMapViewDelegate, UISearchBarDelegate>
{
    BOOL isDistanceSortedFlag;
    BOOL isOnlineFlag;
    BOOL isNewUserFlag;
    
    BOOL isLocationServicesAllow;
    
    UIRefreshControl* _refreshControl;
    MKMapView* _map;

    CLLocationManager* _locMgr;
    CLLocation *tempNewLocation;
    CLLocation *tempOldLocation;
    
    CoolioWebService* coolio;
    
    MyProfiles* account;
    MySession* session;
    
    MyAdditionalFilter* addFilter;
    MyFilter* filter;
    
    int offset;
    
    UITapGestureRecognizer* searchBarSingleTap;
}

@property(nonatomic) NSString* myId;
@property(nonatomic) NSString* userId;

@property (nonatomic, strong) NSMutableArray* collections;

//@property (strong, nonatomic) IBOutlet UISegmentedControl *titleSegControll;
@property (strong, nonatomic) IBOutlet UIRefreshControl *refreshControl;
@property(nonatomic, strong) IBOutlet UISearchBar* searchBar;

@property (nonatomic, strong)MKMapView* map;
@property (nonatomic, strong)CLLocationManager* locMgr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *seg_TileOrList;

//@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *btn_LocationOrLoginTime;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *btn_online;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *btn_newUser;
//@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *av;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn_filter;

- (void)toNotifyGetUsers:(NSNotification *)notification;
- (IBAction)revealMenu:(id)sender;
- (IBAction)btn_TimeOrLocationPush:(id)sender;
- (IBAction)btn_onlinePush:(id)sender;
- (IBAction)btn_newUsersPush:(id)sender;
- (IBAction)btn_search_push:(id)sender;

@end
