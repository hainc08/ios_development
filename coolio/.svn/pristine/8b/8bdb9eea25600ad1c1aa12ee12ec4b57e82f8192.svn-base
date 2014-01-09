//
//  ViewController.m
//  Coolio
//
//  Created by hoehoe on 2012/12/11.
//  Copyright (c) 2012年 Gigaworks. corp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize collections = _collections;
@synthesize refreshControl = _refreshControl;
@synthesize locMgr = _locMgr;
@synthesize map = _map;
@synthesize searchBar = _searchBar;
//@synthesize av = _av;

#define GPS_UNADO_ACCURACY 2000.0
#define GPS_OK_ACCURACY 0.00

#define DATEFORMAT_UTC @"yyyy-MM-dd'T'HH:mm:ssZZZZ"
#define DATEFORMAT_UTC_Z @"yyyy-MM-dd'T'HH:mm:ss'Z'"
#define OFFSET_VALUE 300

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

-(id)init{
    if(self == nil) self = [super init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationController.navigationItem.rightBarButtonItem = self.searchButton;
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")){
        ;
    }else{
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self openMenue];
    [self openPasscodeView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheMyInfo:) name:@"ToNotifyGetMyInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheMyPassword:) name:@"ToNotifyGetMyPassword" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyTheRefresh:) name:@"ToNotifyTheRefresh" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyGetUsers:) name:@"ToNotifyGetUsers" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyError:) name:@"ToNotifyError" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toNotifyLogin:) name:@"ToNotifyLogin" object:nil];
    
    account = [[MyProfiles alloc] init];
    coolio = [[CoolioWebService alloc] init];
    session = [[MySession alloc] init];
    addFilter = [[MyAdditionalFilter alloc] init];
    filter = [[MyFilter alloc] init];
    
    //[addFilter reset];
    //[filter setEnabled:NO];

    if([account getEmailProfile] != nil){
        self.myId = [account getEmailProfile];
    }
    
    if(self.refreshControl == nil){
        self.refreshControl = [[UIRefreshControl alloc] init];
    }
    [self.refreshControl addTarget:self action:@selector(reloadCollectionViewDataSource:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.tintColor = [UIColor orangeColor];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView addSubview:self.refreshControl];
    
    self.collections = [NSMutableArray array];
    
    isLocationServicesAllow = NO;
    self.locMgr = [[CLLocationManager alloc] init];
    self.locMgr.delegate = self;
    
    //３km範囲の精度
    self.locMgr.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    //locMgr.desiredAccuracy = kCLLocationAccuracyBest;
    
    //イベントを発生させる最小の距離（デフォルトは距離指定なし）
    //今回は1km移動したら検知
    //kCLDistanceFilterNone;
    //kCLLocationAccuracyHundredMeters
    self.locMgr.distanceFilter = kCLLocationAccuracyKilometer;//(1000.0) * 10.0;//kCLLocationAccuracyThreeKilometers;

    searchBarSingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self.searchBar action:@selector(resignFirstResponder)];
    
    self.searchBar.placeholder = NSLocalizedString(@"SEARCHBAR_TITLE", nil);
    /*
    self.searchBar.barTintColor = [UIColor whiteColor];
    
    for(UIView* subView in self.searchBar.subviews){
        for(UIView* secondSubView in subView.subviews){
            if([secondSubView isKindOfClass:[UIButton class]]){
                UIButton* searchButton = (UIButton *)secondSubView;
                searchButton.tintColor = [UIColor blueColor];
                return;
            }
        }
    }
    */
    //self.searchBar.backgroundColor = [UIColor blueColor];
    //self.searchBar.tintColor = [UIColor blueColor];
    /*
    for (id view in [self.searchBar subviews]){
        if ([NSStringFromClass([view class]) isEqualToString: @"UISearchBarBackground"]){
            if ([view respondsToSelector: @selector(setAlpha:)]){
                [view setAlpha: 0.0f];
                break;
            }
        }
    }
    */
    //self.searchBar.barTintColor = [UIColor blueColor];
    self.searchBar.delegate = self;
    [self.searchBar setHidden:YES];

    if (&UIApplicationDidEnterBackgroundNotification) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(toNotifyBackground:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:[UIApplication sharedApplication]];
    }
    if (&UIApplicationDidBecomeActiveNotification) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(toNotifyDidBecomeActiveNotification:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:[UIApplication sharedApplication]];
    }

    if(&UIApplicationWillResignActiveNotification){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toWillResignActive:) name:UIApplicationWillResignActiveNotification object:[UIApplication sharedApplication]];
    }
    
    UIImageView* naviImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Coolio_logo"]];
    CGRect naviImageFrame = CGRectMake(0, 0, 320.0f, 40.0f);
    naviImageView.frame = naviImageFrame;
    naviImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.navigationItem.titleView = naviImageView;

    MyAgreement* agreement = [[MyAgreement alloc] init];
    if([agreement getAgreement] != YES){
        
        
        NSString* polFileName;
        NSString* filePath;
        
        if([currentLanguage isEqualToString:@"ja"]){
            polFileName = @"terms_ja.txt";
        }else{
            polFileName = @"terms_en.txt";
        }
        
        filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:polFileName];
        
        NSError* error = nil;
        
        // TextFilePath で指定されたテキストファイルを UTF8 形式で開きます。
        NSString* fileData = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        
        
        //"POL_TITLE" = "利用規約に同意";
        //"ALERT_POL_AGREE" = "同意する";
        //"ALERT_POL_DISAGREE" = "同意しない";
        
        //@"Do you agree to the terms?"
        UIAlertView* alert = [UIAlertView alertViewWithTitle:NSLocalizedString(@"AGREEMENT_MESSAGE1", nil) message:fileData];
        [alert addButtonWithTitle:@"OK" handler:^(void){
            [agreement setAgreement:YES];
        }];
        
        [alert setCancelButtonWithTitle:NSLocalizedString(@"CANCEL_BUTTON", nil) handler:^(void){
            [agreement setAgreement:NO];
            //@"Please agree to the terms."
            UIAlertView* _alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"AGREEMENT_MESSAGE2", nil) delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [_alert show];
        }];
        
        [alert show];
    }

}

//フォアグラウンド状態からバックグラウンド状態に変わる直前に呼ばれる
-(void)toWillResignActive:(NSNotification *)notification
{
    self.myId = [account getEmailProfile];
    if(self.myId != nil)[coolio doLogOff:self.myId];
}

//バックグラウンド処理が通知された時(バックグラウンドに入ったとき)に呼ばれる
//-(void)toNotifyBackground:(NSNotification *)notification
//{

//}

//アクティブになった時に呼ばれる
-(void)toNotifyDidBecomeActiveNotification:(NSNotification *)notification
{
    
    if(coolio == nil) coolio = [[CoolioWebService alloc] init];
    if(account == nil) account = [[MyProfiles alloc] init];
    
    if(self.myId == nil) self.myId = [account getEmailProfile];
    if(self.myId == nil || [self.myId isEqual:[NSNull null]]){
        return;
    }
    if(isRegisterEmailGlobal == YES){
        return;
    }

    if([AppDelegate NetworkCheckConnect] == YES){
        [coolio sendDeviceId];
    }
    
    
    MyApp* app = [[MyApp alloc] init];
    if([app getLastUpdate] == nil){
        [app setLastUpdate];
    }else{
        //最終起動日時
        NSDate* lastUpdate = [app getLastUpdate];
        //30日前
        NSDate* day100Ago = [NSDate dateWithTimeIntervalSinceNow:-(100*24*60*60)];
        NSComparisonResult result = [day100Ago compare:lastUpdate];

        //最終起動日時が100日以上前ならアカウントをリセット
        switch (result) {
            case NSOrderedDescending:
                {
                    //[account reset];
                    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                    dispatch_async(q_global, ^{
                        if([account getEmailProfile] != nil && [account getPasswordProfile] != nil){
                            [coolio doLogin:[account getEmailProfile] password:[account getPasswordProfile]];
                        }
                    });
                    return;
                }
                break;
                
            default:
                break;
        }
    }
    //最終起動日時を更新
    [app setLastUpdate];
    
    if([session getLoggedOutFlag] == YES){
        [self performSelector:@selector(aaa) withObject:nil afterDelay:0.0f];
        return;
    }
    
    if ([[KKPasscodeLock sharedLock] isPasscodeRequired]) {
        [SVProgressHUD dismiss];
        KKPasscodeViewController *vc = [[KKPasscodeViewController alloc] initWithNibName:nil bundle:nil];
        vc.mode = KKPasscodeModeEnter;
        vc.delegate = self;
        
        dispatch_async(dispatch_get_main_queue(),^ {
            [self.navigationController presentViewController:vc animated:YES completion:nil];
        });
        
    }else{
        [coolio getMyUnreadCount:self.myId];
        
        NSString *identifier = nil;
        
        if(isShowFriendViewGlobal == YES){
            isShowFriendViewGlobal = NO;
            identifier = @"friendnotification";
        }
        if(isShowMatchViewGlobal == YES){
            isShowMatchViewGlobal = NO;
            identifier = @"matchnotification";
        }
        if(isShowChatViewGlobal == YES){
            isShowChatViewGlobal = NO;
            identifier = @"chat";
        }
        [coolio getMessages:self.myId];
        isSendedChatGlobal = NO;
        
        if(identifier != nil && [identifier length] > 0){
            self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
            
            [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
                CGRect frame = self.slidingViewController.topViewController.view.frame;
                self.slidingViewController.topViewController.view.frame = frame;
                [self.slidingViewController resetTopView];
            }];
        }
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    if([self checkRequireParameter] == NO){
        if(isRegisterEmailGlobal == NO){
            [self performSelector:@selector(aaa) withObject:nil afterDelay:0.0f];
        }else{
            //[self performSelector:@selector(bbb) withObject:nil afterDelay:0.0f];
        }
        return;
    }
    if( [AppDelegate NetworkCheckConnect] == NO){
        UIAlertView* alert  = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"NETWORK_ERROR", nil) delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    
    if([session getLoggedOutFlag] == YES){
        [self performSelector:@selector(aaa) withObject:nil afterDelay:0.5f];
    }else{
        //self.map.showsUserLocation = YES;
        [self startLocationService];
        //[self.locMgr startUpdatingLocation];
    }
    
    if(self.collections == nil || [self.collections isEqual:[NSNull null]] || [self.collections count] == 0){
        @try {
            [SVProgressHUD show];
            if([addFilter getNewUserFlags] == YES){
                [coolio getUsersNew];
            }else if([addFilter getOnlineFlags] == YES){
                [coolio getUsersOnline];
            }else{
                [coolio getUsers];
            }
        }
        @catch (NSException *exception) {
        }
        @finally {
            if([session getLoggedOutFlag] == YES){
                [SVProgressHUD dismiss];
            }
        }
    }
    [self.navigationController setToolbarHidden:NO animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    [self setFlags];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self stopLocationService];

    if(self.locMgr != nil){
        self.locMgr.delegate = nil;
        self.locMgr = nil;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)aaa{
    LoginViewController* loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
    [self presentViewController:loginView animated:YES completion:nil];
}

-(void)bbb{
    //RegistViewController* registView = [self.storyboard instantiateViewControllerWithIdentifier:@"registViewController"];
    //[self presentViewController:registView animated:YES completion:nil];
    //[self.tabBarController presentViewController:accountSelectViewController animated:YES completion:nil];
}

-(BOOL)checkRequireParameter
{
    BOOL retBool = YES;
    if(account == nil){
        account = [[MyProfiles alloc] init];
    }
    
    if([account getEmailProfile] == nil || [[account getEmailProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getPasswordProfile] == nil || [[account getPasswordProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getNickNameProfile] == nil || [[account getNickNameProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getAgeProfile] == nil || [[account getAgeProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getHeightProfile] == nil || [[account getHeightProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getWeightProfile] == nil || [[account getWeightProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    if([account getSexuallityProfile] == nil){
        retBool = NO;
    }else{
        NSDictionary* sexuallityDict = [account getSexuallityProfile];
        if([[sexuallityDict valueForKey:@"sexGayProfile"] boolValue] == NO &&
           [[sexuallityDict valueForKey:@"sexBisexProfile"] boolValue] == NO &&
           [[sexuallityDict valueForKey:@"sexStraightProfile"] boolValue] == NO)
        {
            retBool = NO;
        }
    }
    
    if([account getRaceProfile] == nil){
        retBool = NO;
    }else{
        NSDictionary* raceDict = [account getRaceProfile];
        if([[raceDict valueForKey:@"raceAsianProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceWhiteProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceBlackProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceLatinProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceArabProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"racePolynesianProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceMixProfile"] boolValue] == NO &&
           [[raceDict valueForKey:@"raceEtcProfile"] boolValue] == NO)
        {
            retBool = NO;
        }
    }
    
    if([account getCountryProfile] == nil || [[account getCountryProfile] isEqualToString:@""] == YES){
        retBool = NO;
    }
    
    return retBool;
}



-(void)setFlags
{
    //MyFilter* filter = [[MyFilter alloc] init];
    if([filter getEnabled] == YES){
        [self.btn_filter setImage:[UIImage imageNamed:@"FilterOn"]];
        //[self.btn_filter setStyle:UIBarButtonItemStyleDone];
    }else{
        [self.btn_filter setImage:[UIImage imageNamed:@"FilterOff"]];
        //[self.btn_filter setStyle:UIBarButtonItemStyleBordered];
    }
    
    /*
     YES - LocationDistance ASC,
     NO - LastLoginTime ASC
     */
    
    //Sorted by Distance ?
    
    isDistanceSortedFlag = [addFilter getSortedFlags];
    isNewUserFlag = [addFilter getNewUserFlags];
    isOnlineFlag = [addFilter getOnlineFlags];
    
    if(isDistanceSortedFlag == YES){
        [self.btn_LocationOrLoginTime setImage:[UIImage imageNamed:@"DistanceSort"]];
    }else{
        [self.btn_LocationOrLoginTime setImage:[UIImage imageNamed:@"LoginSort"]];
    }
    
    if(isNewUserFlag == YES){
        [self.btn_newUser setImage:[UIImage imageNamed:@"NewUser"]];
    }else{
        [self.btn_newUser setImage:[UIImage imageNamed:@"AllUser"]];
    }
    
    if(isOnlineFlag == YES){
        [self.btn_online setImage:[UIImage imageNamed:@"OnLine"]];
    }else{
        [self.btn_online setImage:[UIImage imageNamed:@"OffLine"]];
    }
    [self.navigationController.toolbar reloadInputViews];
}

#pragma collectionview deletgate
//セクションの数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    /*
    long collectionCount = [self.collections count];
    if((collectionCount / 300) > 1 ){
        return (collectionCount / 300);
    }
    return 1;//[collections count];
    */
    return 1;
}

//セクション内の行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //NSLog(@"Collections count : %d", [collections count]);
    NSInteger count = [self.collections count];
    if(count == 0){
        return 0;
    }else if(count == OFFSET_VALUE){
        return count + OFFSET_VALUE;
    }else{
        return count;
    }
}

//セルの描画
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"cell_pict";
    UICollectionViewCell *cell =
    [self.collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UICollectionViewCell alloc] init];
    }
    
    UIImageView* imageView = (UIImageView*)[cell viewWithTag:1];
    UILabel* distanceLabel = (UILabel*)[cell viewWithTag:2];
    UIImageView* onlineImageView = (UIImageView*)[cell viewWithTag:3];
    
    
    imageView.image = nil;
    distanceLabel.text = nil;
    onlineImageView.image = nil;
    
    
    @try {
        //NSLog(@"Call collectionView cellForItemAtIndexPath");
        if((self.collections)[indexPath.row] == [NSNull null]){
            return cell;
        }

        if(self.collections != nil && [self.collections count] > 0){
            
            __block NSString* distanceString;
            __block NSString* updated_at;
            
            NSDictionary* _dict = nil;

            _dict = (self.collections)[indexPath.row];
            
            dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_queue_t q_main = dispatch_get_main_queue();
            
            dispatch_async(q_global, ^{
                //latitude longitude
                if([addFilter getSortedFlags] == YES){
                    distanceString = [self stringFromDistance:[_dict valueForKey:@"latitude"]
                                                    longitude:[_dict valueForKey:@"longitude"]];
                }else{
                    updated_at = [self stringFromTime:[_dict valueForKey:@"updated_at"]];
                }
                
                NSMutableString* appendIconUrlString = [[NSMutableString alloc] init];
                [appendIconUrlString appendString:URLSTRING];
                [appendIconUrlString appendString:@"icons/"];
                [appendIconUrlString appendFormat:@"%@", [_dict valueForKey:@"picture1"]];
                
                NSURL *url = [NSURL URLWithString:appendIconUrlString];
                
                BOOL online = NO;
                
                UIImage* offLineImage = [UIImage imageNamed:@"offlineMark"];
                UIImage* onLineImage = [UIImage imageNamed:@"onlineMark"];
                
                NSString* onlineString = [_dict valueForKey:@"online"];
                if(onlineString == nil || [onlineString isEqual:[NSNull null]]){
                    onlineImageView.image = offLineImage;
                }else{
                    
                    online = [onlineString boolValue];
                }
                
                dispatch_async(q_main, ^{
                    if(online == YES){
                        onlineImageView.image = onLineImage;
                    }else{
                        onlineImageView.image = offLineImage;
                    }
                    
                    imageView.layer.cornerRadius = 5;
                    imageView.clipsToBounds = TRUE;

                    //pict_2013-02-12.jpg
                    [imageView setImageWithURL:url placeholderImage:nil options:SDWebImageCacheMemoryOnly];

                    if([addFilter getSortedFlags] == YES){
                        distanceLabel.text = distanceString;
                    }else{
                        
                        distanceLabel.text = updated_at;
                    }
                    cell.layer.cornerRadius = 5;
                });
            });
        }
    }
    @catch (NSException *exception) {
    }
    @finally {
        if(indexPath.row == ([self.collections count]  - 1)){
            [SVProgressHUD dismiss];
        }
    }
    
    return cell;
}

//タップされた時
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MyReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyReusableView" forIndexPath:indexPath];
    
    if(![self.collections isEqual:[NSNull null]]){
        if([self.collections count] == OFFSET_VALUE){
            if ([kind isEqual:UICollectionElementKindSectionFooter]){
                if (collectionView.numberOfSections == indexPath.section + 1) {
                    [self loadNext];
                }
            }
        }
    }
    return headerView;
}

-(void)loadNext
{
    //NSLog(@"loadNextPage");
    if(offset == 0){
        offset += (OFFSET_VALUE + 1);
    }else{
        offset += OFFSET_VALUE;
    }
    //NSLog(@"OffSet: %d", offset);
    [coolio getUsersNextPage:offset];
    //[self.collectionView reloadData];
}

/*
//Intervalごとに新しい位置情報を取得
#pragma mark - NSTimer interval
-(void) timerTargetMethod
{
    //isTimerRun = YES;
    NSLog(@"Timer fire.");
    //NSLog(@"timerTargetMethod message...");
    
    //24時間以上動いていたら停止する
    
    
    // Do the work associated with the task.
    if([account getEmailProfile] == nil || [[account getEmailProfile] isEqualToString:@""]){
        [locationTimer invalidate];
        return;
    }

    
    if(tempNewLocation == nil){
        [self.locMgr startUpdatingLocation];
    }else{
        
        //緯度・経度
        CLLocationDegrees latitude;
        CLLocationDegrees longitude;
        
        latitude = tempNewLocation.coordinate.latitude;
        longitude = tempNewLocation.coordinate.longitude;

        NSString* email = [account getEmailProfile];
        NSString* password = [account getPasswordProfile];
        NSString* strLatitude = [NSString stringWithFormat:@"%f", latitude];
        NSString* strLongitude = [NSString stringWithFormat:@"%f", longitude];
        
        @try{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            [coolio sendMyLocation:email password:password latitude:strLatitude longitude:strLongitude];
        }@catch (NSException* ex) {
            //NSLog(@"%@error", [ex description]);
        }
    }
}
*/


#pragma mark - Private methods

- (void)startLocationService
{
    // このアプリの位置情報サービスへの認証状態を取得する
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    switch (status) {
        // 位置情報サービスへのアクセスが許可されている
        case kCLAuthorizationStatusAuthorized:{
            [self.locMgr startUpdatingLocation];
            isLocationServicesAllow = YES;
        }
            break;
            
        // 位置情報サービスへのアクセスを許可するか選択されていない
        case kCLAuthorizationStatusNotDetermined:{
            // 位置情報サービスへのアクセスを許可するか確認するダイアログを表示する
            [self.locMgr startUpdatingLocation];
        }
            break;
        
        // 設定 > 一般 > 機能制限で利用が制限されている
        case kCLAuthorizationStatusRestricted:{
            /*
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"エラー"
                                      message:@"設定 > 一般 > 機能制限で利用が制限されてるよ！"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
            [alertView show];
            */
            isLocationServicesAllow = NO;
            self.navigationController.navigationBar.barTintColor = [UIColor redColor];
            //self.navigationController.navigationItem.prompt = @"GPS Error";
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"ALERT_LOCATION_SERVICE", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
            break;
        
        // ユーザーがこのアプリでの位置情報サービスへのアクセスを許可していない
        case kCLAuthorizationStatusDenied:{
            /*
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"エラー"
                                      message:@"このアプリでの位置情報サービスへのアクセスを許可されていないよ！"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
            [alertView show];
            */
            isLocationServicesAllow = NO;
            self.navigationController.navigationBar.barTintColor = [UIColor redColor];
            //self.navigationController.navigationItem.prompt = @"GPS Error";
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"ALERT_LOCATION_SERVICE", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
            break;
            
        default:
            break;
    }
}

- (void)stopLocationService
{
    // 位置情報サービスを停止する
    //self.map.showsUserLocation = NO;
    [self.locMgr stopUpdatingLocation];
    [self.locMgr stopUpdatingHeading];
}


#pragma mark - CLLocationManagerDelegate methods

// 位置情報サービスへのアクセスが失敗した場合にこのデリゲートメソッドが呼ばれる
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //NSLog(@"%@", @"位置情報が取得出来ませんでした。");

    switch (error.code) {
        case kCLErrorDenied: // 確認ダイアログで許可しないを選択した
        {
            /*
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"エラー"
                                      message:@"このアプリでの位置情報サービスへのアクセスを許可されなかったよ！"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
            [alertView show];
             */
            isLocationServicesAllow = NO;
            self.navigationController.navigationBar.barTintColor = [UIColor redColor];
            //self.navigationController.navigationItem.prompt = @"GPS Error";
        }
            break;
            
        default:
        {
            //UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"エラー" message:@"位置情報の取得に失敗したよ！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            //[alertView show];
        }
            break;
    }
}

// 位置情報サービスの設定が変更された場合にこのデリゲートメソッドが呼ばれる
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusAuthorized:{
            self.navigationController.navigationBar.barTintColor =nil;
            [self.locMgr startUpdatingLocation];
            isLocationServicesAllow = YES;
        }
            break;

        case kCLAuthorizationStatusRestricted: // 設定 > 一般 > 機能制限で利用が制限されている
        {
            // 位置情報サービスを停止する
            //[self stopLocationService];
            /*
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"エラー"
                                      message:@"設定 > 一般 > 機能制限で利用が制限されてるよ！"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
            [alertView show];
            */
            isLocationServicesAllow = NO;
            self.navigationController.navigationBar.barTintColor = [UIColor redColor];
            //self.navigationController.navigationItem.prompt = @"GPS Error";
        }
            break;
            
        case kCLAuthorizationStatusDenied: // ユーザーがこのアプリでの位置情報サービスへのアクセスを許可していない
        {
            // 位置情報サービスを停止する
            //[self stopLocationService];
            /*
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"エラー"
                                      message:@"このアプリでの位置情報サービスへのアクセスを許可されていないよ！"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
            [alertView show];
             */
            isLocationServicesAllow = NO;
            self.navigationController.navigationBar.barTintColor = [UIColor redColor];
            //self.navigationController.navigationItem.prompt = @"GPS Error";
        }
            break;
            
        default:
            break;
    }
}






#pragma mark - CLLocation manager delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.navigationController.navigationBar.barTintColor = nil;
    if(newLocation.horizontalAccuracy > GPS_UNADO_ACCURACY) return;
    if(newLocation.horizontalAccuracy <= GPS_OK_ACCURACY) return;
    
    if (signbit(newLocation.horizontalAccuracy) ||
        signbit(newLocation.verticalAccuracy)) return;
    //|| signbit(newLocation.speed)) return;
    
    //位置情報が新しい場合、更新してMap上に反映
    if(newLocation != nil && oldLocation != newLocation){
        if(tempNewLocation == nil ||
           newLocation.horizontalAccuracy < tempNewLocation.horizontalAccuracy){
            tempNewLocation = newLocation;
            tempOldLocation = oldLocation;
            
            //tempNewLocationGlobal = newLocation;

            //緯度・経度
            CLLocationDegrees latitude = newLocation.coordinate.latitude;
            CLLocationDegrees longitude = newLocation.coordinate.longitude;
             @try{
                NSString* email = [account getEmailProfile];
                //NSString* password = [account getPasswordProfile];
                NSString* strLatitude = [NSString stringWithFormat:@"%f", latitude];
                NSString* strLongitude = [NSString stringWithFormat:@"%f", longitude];
 
                //NSLog(@"%.5f / %.5f", latitude, longitude);
                //NSLog(@"Send Location data");
                 if(isLocationServicesAllow == YES){
                     if(latitude > 0.0 && longitude > 0.0){
                         [coolio sendMyLocation:email latitude:strLatitude longitude:strLongitude];
                     }
                 }

                //NSLog(@"Send Location data");
                //[self.locMgr stopUpdatingLocation];
                //[self.locMgr stopUpdatingHeading];
            }@catch (NSException* ex) {
                //NSLog(@"%@error", [ex description]);
            }
        }
    }
}

/*
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    @try {
        CLLocationCoordinate2D coordinate = self.map.userLocation.location.coordinate;
        
        if(coordinate.latitude != 0.0 && coordinate.longitude != 0.0){
            [coolio sendMyLocation:[account getEmailProfile] latitude:[NSString stringWithFormat:@"%f", tempNewLocation.coordinate.latitude] longitude:[NSString stringWithFormat:@"%f", tempNewLocation.coordinate.longitude]];
        }
        
        // 一度しか現在地に移動しないなら removeObserver する
        [self.map.userLocation removeObserver:self forKeyPath:@"location"];
        self.map.showsUserLocation = NO;
    }
    @catch (NSException *exception) {
        
    }
    @finally {
    }
}
*/



#pragma mark - UIRefreshControl
-(void)reloadCollectionViewDataSource:(id)sender
{
    //for(int i=0; i<20000; i++){;}
    //for(int i=0; i<20000; i++){;}
    //for(int i=0; i<20000; i++){;}
    //for(int i=0; i<20000; i++){;}
    
    NSNotification* n = [NSNotification notificationWithName:@"ToNotifyTheRefresh" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
}

# pragma searchBar delegate
/*
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //[searchBar setShowsCancelButton:YES animated:YES];
    //NSLog(@"searchBar DidChange");
    [_searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //NSLog(@"searchBarTextDidBeginEditing");
    [_searchBar setShowsCancelButton:YES animated:YES];
}
*/

-(void)searchBarCancelButtonClicked:(UISearchBar*)searchBar
{
    [self.searchBar setText:@""];
    [self.searchBar resignFirstResponder];
    [self.view removeGestureRecognizer:searchBarSingleTap];
    [self.searchBar setHidden:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)searchBarSearchButtonClicked:(UISearchBar*)searchBar
{
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    UIAlertView* alert = nil;
    NSArray* badSearchParam = @[@"!", @"@", @"#", @"$", @"%", @"^", @"&", @"*", @"+", @";", @":", @"?", @"{", @"}", @"[", @"]", @"\\", @"|", @"~", @"`", @"/", @"(", @")", @"=", @"\""];
    NSString* searchText = searchBar.text;
    if(searchText != nil || [searchText length] > 0){
        for (int i=0; i<[badSearchParam count]; i++) {
            NSRange range = [searchText rangeOfString:badSearchParam[i]];
            if (range.location != NSNotFound) {
                alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"Bad Parameter", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                return;
            }
        }
        [SVProgressHUD show];
        dispatch_async(q_global, ^{
            [coolio getUsers:searchText];
        });
    }else{
        if([addFilter getNewUserFlags] == YES){
            [SVProgressHUD show];
            dispatch_async(q_global, ^{
                [coolio getUsersNew];
            });
        }else if([addFilter getOnlineFlags] == YES){
            [SVProgressHUD show];
            dispatch_async(q_global, ^{
                [coolio getUsersOnline];
            });
        }else{
            [SVProgressHUD show];
            dispatch_async(q_global, ^{
                [coolio getUsers];
            });
        }
    }
    [self.searchBar resignFirstResponder];
    [self.searchBar setText:@""];
    [self.searchBar setHidden:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    [self.view removeGestureRecognizer:searchBarSingleTap];
    
    
    //CGRect collectionViewRect = self.collectionView.frame;
    //collectionViewRect.origin.y = 0;
    //self.collectionView.frame = collectionViewRect;
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self searchBarCancelButtonClicked:searchBar];
}







-(void)toNotifyTheRefresh:(NSNotification*)notification
{
    //dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue(), ^{
    if([AppDelegate NetworkCheckConnect] == YES){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [SVProgressHUD showWithStatus:@"" maskType:SVProgressHUDMaskTypeBlack];
        @try {
            if([addFilter getNewUserFlags] == YES){
                [coolio getUsersNew];
            }else if([addFilter getOnlineFlags] == YES){
                [coolio getUsersOnline];
            }else{
                [coolio getUsers];
            }
        }
        @catch (NSException *exception) {
        }
        @finally {
            [self.refreshControl endRefreshing];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }
    }else{
        [self.refreshControl endRefreshing];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}

-(void) toNotifyTheMyInfo:(NSNotification *)notification
{
    NSArray* myInfoArray = [[notification object] mutableCopy];
    
    //NSLog(@"%@ : %d", @"MyInfo Array is", myInfoArray.count);
    
    if(myInfoArray == nil || [myInfoArray count] == 0 || [myInfoArray isEqual:[NSNull null]]){
    
    }else{
        NSDictionary*  myInfo = myInfoArray[0];
        if(![myInfo isEqual:[NSNull null]]){
            BOOL freezeAccount = [[myInfo valueForKey:@"freezeAccount"] boolValue];
            if(freezeAccount == YES){
                //@"This account has been locked."
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:NSLocalizedString(@"ALERT_LOGIN_LOCKED", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                
                [self performSelector:@selector(aaa) withObject:nil afterDelay:0.5];
            }else{
                dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_async(q_global, ^{
                    [self syncAccount:myInfo];
                });
            }
        }
    }
}

-(void)toNotifyTheMyPassword:(NSNotification *)notification
{
    NSArray* myInfoArray = [[notification object] mutableCopy];
    
    //NSLog(@"%@ : %d", @"MyInfo Array is", myInfoArray.count);
    
    if(myInfoArray == nil || myInfoArray.count == 0 || [myInfoArray isEqual:[NSNull null]]){
        
    }else{
        NSString* pass = myInfoArray[0];
        //dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        //dispatch_async(q_global, ^{
            [self syncPassword:pass];
            dispatch_async(dispatch_get_main_queue(), ^{
               // NSLog(@"pass: %@", pass);
            });
        //});
    }
}

- (void) toNotifyGetUsers:(NSNotification*)notification
{
    [SVProgressHUD dismiss];
    
    if([notification object] != nil ){
        //NSLog(@"Collection not null");
        NSString* responseString = [NSString stringWithFormat:@"%@", [notification object]];
        //NSLog(@"%@", responseString);
        
        NSData *jsonData = [responseString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
        NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        
        
        self.collections = [jsonArray mutableCopy];
        
        if([self.collections count] <= 0){
            //[SVProgressHUD dismiss];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

            dispatch_sync(dispatch_get_main_queue(), ^{
                if([notification object] != nil){
                    [self.collectionView reloadData];
                }
                [self.refreshControl endRefreshing];
            });
            return;
        }
        BOOL isCollectionSortFlag = [addFilter getSortedFlags];
        
        if(isCollectionSortFlag == YES){
            self.collections = (NSMutableArray *)[self sortArrayDistance:self.collections];
        }else{
            self.collections = (NSMutableArray *)[self sortArrayLastLoginTime:self.collections];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if([notification object] != nil){
            //[SVProgressHUD dismiss];
            [self.collectionView reloadData];
        }
        [self.refreshControl endRefreshing];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    });
}


-(NSArray *)sortArrayDistance:(NSArray *)array{
    
    @try{
        array = [array sortedArrayUsingComparator: ^(id a, id b) {
            double a_lati = [[a valueForKey:@"latitude"] doubleValue];
            double a_longi = [[a valueForKey:@"longitude"] doubleValue];
            
            double b_lati = [[b valueForKey:@"latitude"] doubleValue];
            double b_longi = [[b valueForKey:@"longitude"] doubleValue];
            
            if(a_lati == 0.0 || b_lati == 0.0){ return (NSComparisonResult)NSOrderedSame; }
            
            
            CLLocation* la = [[CLLocation alloc] initWithLatitude:a_lati longitude:a_longi];
            CLLocation* lb = [[CLLocation alloc] initWithLatitude:b_lati longitude:b_longi];
            
            CLLocationDistance dist_a= [la distanceFromLocation: tempNewLocation];
            CLLocationDistance dist_b= [lb distanceFromLocation: tempNewLocation];
            if ( dist_a <= dist_b ) {
                return (NSComparisonResult)NSOrderedAscending;
            } else if ( dist_a > dist_b) {
                return (NSComparisonResult)NSOrderedDescending;
            } else {
                return (NSComparisonResult)NSOrderedSame;
            }
        }];
    }@catch(NSError* err){
        
    }
    return array;
}

-(NSArray *)sortArrayLastLoginTime:(NSArray *)array{
    
    array = [array sortedArrayUsingComparator: ^(id a, id b) {
        
        NSString* dateStringA = [a valueForKey:@"updated_at"];
        NSString* dateStringB = [b valueForKey:@"updated_at"];

        if([dateStringA isEqual:[NSNull null]]){
            return (NSComparisonResult)NSOrderedSame;
        }
        if([dateStringB isEqual:[NSNull null]]){
            return (NSComparisonResult)NSOrderedSame;
        }
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:DATEFORMAT_UTC];
        
        NSDate* dateA = [dateFormatter dateFromString:dateStringA];
        NSDate* dateB = [dateFormatter dateFromString:dateStringB];
        
        NSDate *now = [NSDate date];
        float date_a = [now timeIntervalSinceDate:dateA];
        float date_b = [now timeIntervalSinceDate:dateB];
        
        if ( date_a < date_b ) {
            return (NSComparisonResult)NSOrderedAscending;
        } else if ( date_a > date_b) {
            return (NSComparisonResult)NSOrderedDescending;
        } else {
            return (NSComparisonResult)NSOrderedSame;
        }
    }];
    
    return array;
}


-(NSMutableArray *)filterByOnline:(NSArray *)sourceArray
{
    NSMutableArray* result = nil;
    NSPredicate* onlinePredicate = [NSPredicate predicateWithFormat:@"online = true"];
    result = [[sourceArray filteredArrayUsingPredicate:onlinePredicate] copy];
    return result;
}

-(NSMutableArray *)filterByNewUser:(NSArray *)sourceArray
{
    // 1ヶ月前とする
    NSDateComponents *dateComp = [[NSDateComponents alloc] init];
    [dateComp setMonth:-1];
    
    // 1ヶ月前のNSDateインスタンスを取得する
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComp toDate:[NSDate date] options:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:DATEFORMAT_UTC_Z];
    NSString* now = [dateFormatter stringFromDate:date];
    
    NSMutableArray* result = nil;
    NSPredicate *newUserPredicate = [NSPredicate predicateWithFormat: @"created_at >= %@", now];
    result = [[sourceArray filteredArrayUsingPredicate:newUserPredicate] copy];
    return result;
}


- (NSString *)stringFromDistance:(NSString *)latitude longitude:(NSString *)longitude {
    

    //if([latitude isEqual:[NSNull null]] &&  [longitude isEqual:[NSNull null]]){ return @"";}
    //if(latitude == nil && longitude == nil){ return @"";}
    
    CLLocationCoordinate2D coordinate;
    CLLocation* userLocation;
    if(latitude != nil && longitude != nil){
        coordinate.latitude = [latitude doubleValue];
        coordinate.longitude = [longitude doubleValue];
        userLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    }else{
        return @"";
    }
    
    CLLocationDistance distance = [tempNewLocation distanceFromLocation:userLocation];

    int distanceIntValue = [[NSNumber numberWithDouble:distance] intValue];
    
    MyUnit* unit = [[MyUnit alloc] init];
    NSString* retCorrdinateString;
    
    //NSLog(@"Distance: %d", distanceIntValue);
    
    if([unit getUnit] == 1){
        if(distanceIntValue < 1000){
            if([currentLanguage isEqualToString:@"ja"]){
                retCorrdinateString = [NSString stringWithFormat:@"%@", @"1km未満"];
            }else if([currentLanguage isEqualToString:@"en"]){
                retCorrdinateString = [NSString stringWithFormat:@"%@", @"1km less"];
            }else{
            
            }
        }else{
            distanceIntValue = distanceIntValue / 1000;
            retCorrdinateString = [NSString stringWithFormat:@"%dkm", distanceIntValue];
        }
    }else{
        if(distanceIntValue < 1600){
            if([currentLanguage isEqualToString:@"ja"]){
                retCorrdinateString = [NSString stringWithFormat:@"%@", @"1mi未満"];
            }else if([currentLanguage isEqualToString:@"en"]){
                retCorrdinateString = [NSString stringWithFormat:@"%@", @"1mi less"];
            }
        }else{
            distanceIntValue = distanceIntValue / 1600;
            retCorrdinateString = [NSString stringWithFormat:@"%dmi", distanceIntValue];
        }
    }
    return retCorrdinateString;
}

- (NSString *)stringFromTime:(NSString *)updated_at {
    if(updated_at == nil || [updated_at isEqual:[NSNull null]]){ return @""; }
    //NSString *datetimeString = @"2009-12-15T20:00:00+09:00";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:DATEFORMAT_UTC];
    NSDate *updateTime = [dateFormatter dateFromString:updated_at];
    
    
    NSDate* now = [NSDate date];
    float date_a = [now timeIntervalSinceDate:updateTime];
    
    NSInteger ti = (NSInteger)date_a;
    //NSLog(@"ti: %d", ti);
    //NSInteger sec = ti % 60;
    NSInteger min = (ti / 60) % 60;
    NSInteger hour = (ti / 3600);
    //NSLog(@"%02d:%02d:%02d", hour, min, sec);
    
    NSString* retString;
        
    if([currentLanguage isEqualToString:@"ja"]){
        if(hour == 0){
            if(min == 0){
                retString = [NSString stringWithFormat:@"%@", @"たった今"];
            }else{
                retString = [NSString stringWithFormat:@"%d%@", min, @"分前"];
            }
        }else if(hour >= 1 && hour <=24){
            retString = [NSString stringWithFormat:@"%d%@", hour, @"時間前"];
        }else if(hour > 24 && (hour / 24) <= 365 ){
            retString = [NSString stringWithFormat:@"%d%@", (hour / 24) + 1, @"日前"];
        }else{
            retString = [NSString stringWithFormat:@"%@", @"1年以上前"];
        }
    }else{ // if([currentLanguage isEqualToString:@"en"]){
        if(hour == 0){
            if(min == 0){
                retString = [NSString stringWithFormat:@"%@", @"Now"];
            }else{
                retString = [NSString stringWithFormat:@"%d%@", min, @"m ago"];
            }
        }else if(hour >= 1 && hour <=24){
            retString = [NSString stringWithFormat:@"%d%@", hour, @"h ago"];
        }else if(hour > 24 && (hour / 24) <= 365 ){
            retString = [NSString stringWithFormat:@"%d%@", (hour / 24) + 1, @"d ago"];
        }else{
            retString = [NSString stringWithFormat:@"%@", @"over 1 year"];
        }
    }
    
    return retString;
    //[NSString stringWithFormat:@"%02i:%02i:%02i", hours, minutes, seconds];
}

-(void) toNotifyError:(NSNotification *)notification
{
    [self.refreshControl endRefreshing];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    //UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Network Error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //[alert show];
}

-(void)syncAccount:(NSDictionary *)_myInfo
{
    [account sync:_myInfo];
    
    MyNotification* notice = [[MyNotification alloc] init];
    [notice sync:_myInfo];
    
    MyPicture* picture = [[MyPicture alloc] init];
    [picture sync:_myInfo];
}

-(void)syncPassword:(NSString *)password
{
    [account setPasswordProfile:password];
}


- (IBAction)revealMenu:(id)sender
{
    
    NSString* myId = [[[MyProfiles alloc] init] getEmailProfile];
    if(myId != nil){
        [coolio getMyUnreadCount:myId];
    }
    [self.slidingViewController anchorTopViewTo:ECRight];
}

//-(void)dismissIndicator
//{
//    [SVProgressHUD dismiss];
//}

- (IBAction)btn_TimeOrLocationPush:(id)sender {
    /*
     YES - LocationDistance ASC,
     NO - LastLoginTime ASC
     */
    
    [SVProgressHUD show];
    //Sorted by Distance ?
    NSString* imageName = nil;
    
    /*
     BOOL isCollectionSortFlag = [addFilter getSortedFlags];
     
     if(isCollectionSortFlag == YES){
     self.collections = (NSMutableArray *)[self sortArrayDistance:self.collections];
     }else{
     self.collections = (NSMutableArray *)[self sortArrayLastLoginTime:self.collections];
     }
     */
    
    isDistanceSortedFlag = [addFilter getSortedFlags];
    if(isDistanceSortedFlag == YES){
        //NSLog(@"DistanceSort");
        imageName = @"LoginSort";
        //self.collections = (NSMutableArray *)[self sortArrayDistance:self.collections];
        //[self.collectionView reloadData];
        isDistanceSortedFlag = NO;
    }else{
        //NSLog(@"LoginSort");
        imageName = @"DistanceSort";
        //self.collections = (NSMutableArray *)[self sortArrayLastLoginTime:self.collections];
        //[self.collectionView reloadData];
        isDistanceSortedFlag = YES;
    }
    [self.btn_LocationOrLoginTime setImage:[UIImage imageNamed:imageName]];
    [self.navigationController.toolbar reloadInputViews];
    
    [addFilter setSortedFlags:isDistanceSortedFlag];
    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_global, ^{
        [coolio getUsers];
    });
    
    //NSIndexSet* idxSet = [NSIndexSet indexSetWithIndex:0];
    //[self.collectionView reloadSections:idxSet];
}

- (IBAction)btn_onlinePush:(id)sender {
    [SVProgressHUD show];
    NSString* imageName = nil;
    if(isOnlineFlag == YES){
        //self.collections = [_oldCollections copy];

        isOnlineFlag = NO;
        imageName = @"OffLine";
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [coolio getUsers];
        });
    }else{
        //_oldCollections = [self.collections copy];
        //self.collections = [self filterByOnline:self.collections];

        isOnlineFlag = YES;
        imageName = @"OnLine";
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [coolio getUsersOnline];
        });
    }
    [addFilter setOnlineFlags:isOnlineFlag];
    [addFilter setNewUserFlags:NO];
    [self.btn_newUser setImage:[UIImage imageNamed:@"AllUser"]];
    
    [self.btn_online setImage:[UIImage imageNamed:imageName]];
    [self.navigationController.toolbar reloadInputViews];

    //[self.collectionView reloadData];
    //[SVProgressHUD dismiss];
    
    //NSIndexSet* idxSet = [NSIndexSet indexSetWithIndex:0];
    //[self.collectionView reloadSections:idxSet];
}

- (IBAction)btn_newUsersPush:(id)sender {
    [SVProgressHUD show];
    NSString* imageName = nil;
    
    isNewUserFlag = [addFilter getNewUserFlags];
    if(isNewUserFlag == YES){
        //self.collections = [_oldCollections copy];

        isNewUserFlag = NO;
        imageName = @"AllUser";
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [coolio getUsers];
        });
    }else{
        //_oldCollections = [self.collections copy];
        //self.collections = [self filterByNewUser:self.collections];

        isNewUserFlag = YES;
        imageName = @"NewUser";
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            [coolio getUsersNew];
        });
    }
    [addFilter setNewUserFlags:isNewUserFlag];
    [addFilter setOnlineFlags:NO];
    
    [self.btn_online setImage:[UIImage imageNamed:@"OffLine"]];
    
    [self.btn_newUser setImage:[UIImage imageNamed:imageName]];
    [self.navigationController.toolbar reloadInputViews];
    
    //[self.collectionView reloadData];
    //[SVProgressHUD dismiss];

    //NSIndexSet* idxSet = [NSIndexSet indexSetWithIndex:0];
    //[self.collectionView reloadSections:idxSet];
}

- (IBAction)btn_search_push:(id)sender {
    self.searchBar.translucent = NO;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.view addGestureRecognizer:searchBarSingleTap];
    [self.searchBar setHidden:NO];
    [self.searchBar becomeFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"goMemberToDetail"]) {
        if(self.myId == nil){
            return;
        }
        NSArray* selectedItems = self.collectionView.indexPathsForSelectedItems;
        NSIndexPath* idxPath =  selectedItems[0];
        
        NSDictionary* userInfoDict = [(self.collections)[idxPath.row] mutableCopy];
        
        NSString* userId = [userInfoDict valueForKey:@"email"];
        self.userId = userId;
        
        if(tempNewLocation != nil){
            tempNewLocationGlobal = tempNewLocation;
        }
        
        MyFootPrintSettings* foot = [[MyFootPrintSettings alloc] init];
        BOOL footPrintFlag = [foot getFootPrint];
        
        //自分のアカウントか？
        BOOL myIdMatchFlag = [self.myId isEqualToString:userId];
        
        
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            
            if(myIdMatchFlag == NO){
                [coolio sendHistory:self.myId historyId:[userInfoDict valueForKey:@"email"]];
                if(footPrintFlag == YES){
                    [coolio sendFootPrint:self.myId footPrintId:[userInfoDict valueForKey:@"email"]];
                }
            }
        });

        [coolio getUserOne:self.myId userId:self.userId];
        AccountDetailViewController *detailView = segue.destinationViewController;
        detailView.userId = self.userId;
    }
}

-(void)toNotifyRegistRedirect:(NSNotification *)notification
{
    if(isRegisterEmailGlobal == YES){
        //NSLog(@"toNotifyRegistRedirect call");
        //settings
        NewAccountSettingsViewController* settingsView = [self.storyboard instantiateViewControllerWithIdentifier:@"newAccountSettingsViewController"];
        [self presentViewController:settingsView animated:YES completion:nil];
    }
    
}

-(void)toNotifyLogin:(NSNotification *)notification
{
    NSString* status = [notification object];
    if([status isEqualToString:@"success"]){
        dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_global, ^{
            if([account getEmailProfile] != nil){
                [coolio getMyInfo:[account getEmailProfile]];
                MyDevice* device = [[MyDevice alloc] init];
                if([device getDeviceId] != nil && ![[device getDeviceId] isEqual:[NSNull null]]){
                    [coolio sendDeviceId];
                }
            }
        });
        return;
    }else{
        [account reset];
        dispatch_sync(dispatch_get_main_queue(), ^{
            LoginViewController* loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
            [self presentViewController:loginView animated:YES completion:nil];
        });
    }
}

@end
