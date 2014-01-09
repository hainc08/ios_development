//
//  NTResultViewController.m
//  notore
//
//  Created by TrinhLD on 11/21/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "NTResultViewController.h"
#import "OWActivityViewController.h"
#import "Session.h"
#import "Reachability.h"

@interface NTResultViewController ()

@end

@implementation NTResultViewController
@synthesize score,level,isClear;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        score = 6;
        self.strLevel = @"野良猫レベル";
        isClear = NO;
        //isOnSound = YES;
        sound = nil;
        level = 1;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor colorWithRed:10.0f/255.0f green:78.0f/255.0f blue:47.0f/255.0f alpha:1.0];
    //DLog(@"score result%d",score);
    // Do any additional setup after loading the view from its nib.
    self.strLevel = @"野良猫レベル";
	// Do any additional setup after loading the view.
    self.title = [NSString stringWithFormat:@"%@の結果",self.strLevel];
    //self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    // self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //self.navigationController.navigationBar.translucent = NO;
//    UILabel *lblTitle = (UILabel *)self.navigationController.navigationBar.topItem.titleView;
//    if (!lblTitle) {
//        lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
//        lblTitle.backgroundColor = [UIColor clearColor];
//        //lblTitle.font = [UIFont fontWithName:@"Arial-Bold" size:16];
//        lblTitle.font = [UIFont boldSystemFontOfSize:16.0];
//        lblTitle.shadowColor = [UIColor colorWithWhite:0.0 alpha:1];
//        lblTitle.textColor = [UIColor whiteColor];
//        self.navigationController.navigationBar.topItem.titleView = lblTitle;
//        
//        // [lblTitle sizeToFit];
//        // [lblTitle release];
//    }
    // lblTitle.text = [self.title capitalizedString];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg-top-repeat.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    _btnSound = [[UIButton alloc] init];
    _btnSound.frame=CGRectMake(0,0,32,32);
    
    
    
    
//    UIBarButtonItem* btSound = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn-sound-on.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(onSound:)];
//    self.navigationItem.rightBarButtonItem= btSound;
//    if([Session sharedInstance].flagEnableSound)
//    {
//        btSound.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn-sound-on.png" ]];
//    }
//    else
//    {
//        btSound.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn-sound-off.png" ]];
//    }
    
    //Back button
    UIButton *btNaviBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [btNaviBack setImage:[UIImage imageNamed:@"btn-back.png"] forState:UIControlStateNormal];
    [btNaviBack addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    //[btNaviBack setContentEdgeInsets:UIEdgeInsetsMake(0, 7, 0, -7)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btNaviBack];
    
    //init objects
    lblResult = [[UILabel alloc] init];
    btBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btShare = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    //set frame, image for objects
    NSString* strResult = @"";
    if (IS_IPHONE_5) //4inch-done
    {
        if(isClear)
        {
            NSURL* url = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource: @"clear-all.mp3" ofType: nil]];
            sound = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: nil];
            [sound setDelegate:self];
            if([Session sharedInstance].flagEnableSound)
            {
                [sound play];
            }
            strResult = [NSString stringWithFormat:@"10問/%d問正解 ! \n レベル2は クリアーしました。",score];
            [btShare setImage:[UIImage imageNamed:@"btn-retry2.png"] forState:UIControlStateNormal ];
            
            lblResult.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-notice-red.png"]];
            lblResult.frame = CGRectMake(0, self.view.frame.size.height/2+5, self.view.frame.size.width, 100);
            btBack.frame = CGRectMake(12, self.view.frame.size.height-140, self.view.frame.size.width-24, 80);
            imgResult = [[UIImageView alloc] initWithFrame:CGRectMake(35, 34, self.view.frame.size.width-35*2, 110)];
            imgResult.image = [UIImage imageNamed:@"anima-cngratulations.png"];
           
            UILabel *lblTextWin = [[UILabel alloc] initWithFrame:CGRectMake(12, imgResult.frame.size.height+imgResult.frame.origin.y, self.view.frame.size.width-24, 70)];
            lblTextWin.text = @"やったね！全部のレベルをクリアーしました。\nこの喜びをみんなさんに伝えましょう";
            lblTextWin.textAlignment = NSTextAlignmentCenter;
            lblTextWin.textColor = [UIColor whiteColor];
            lblTextWin.numberOfLines = 2;
            lblTextWin.backgroundColor = [UIColor clearColor];
            lblTextWin.font = [UIFont boldSystemFontOfSize:13];
            [self.view addSubview:lblTextWin];
             btShare.frame = CGRectMake(60, lblTextWin.frame.origin.y+lblTextWin.frame.size.height+10, self.view.frame.size.width-60*2, 40);
        }
        else
        {
            if(self.score >=7) //win
            {
                NSURL* url = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource: @"Clear.mp3" ofType: nil]];
                sound = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: nil];
                [sound setDelegate:self];
                if([Session sharedInstance].flagEnableSound)
                {
                    [sound play];
                }
                strResult = [NSString stringWithFormat:@"10問/%d問正解 ! \n レベル2は クリアーしました。",score];
                [btShare setImage:[UIImage imageNamed:@"btn-retry.png"] forState:UIControlStateNormal ];
                imgResult = [[UIImageView alloc] initWithFrame:CGRectMake(50, self.view.frame.size.height/2-220, 193, 200)];
                imgResult.image = [UIImage imageNamed:@"anima-cat-win.png"];
                lblResult.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-notice-red.png"]];
                lblResult.frame = CGRectMake(0, self.view.frame.size.height/2-20, self.view.frame.size.width, 100);
                btShare.frame = CGRectMake(12, self.view.frame.size.height/2+lblResult.frame.size.height-10, self.view.frame.size.width -24, 80);
                btBack.frame = CGRectMake(12, self.view.frame.size.height-110, self.view.frame.size.width-24, 80);
                
                
            }
            else
            {
                NSURL* url = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource: @"bgm.mp3" ofType: nil]];
                sound = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: nil];
                [sound setDelegate:self];
                if([Session sharedInstance].flagEnableSound)
                {
                    [sound play];
                }
                strResult = [NSString stringWithFormat:@"10問/%d問正解 ! \n クリアーできませんでした。",score];
                [btShare setImage:[UIImage imageNamed:@"btn-retry.png"] forState:UIControlStateNormal ];
                
                imgResult = [[UIImageView alloc] initWithFrame:CGRectMake(50, self.view.frame.size.height/2-250+90, 193,200)];
                imgResult.image = [UIImage imageNamed:@"anima-cat-lose.png"];
                lblResult.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-notice-blue.png"]];
                lblResult.frame = CGRectMake(0, self.view.frame.size.height/2+40, self.view.frame.size.width, 100);
                btBack.hidden = YES;
                btShare.frame = CGRectMake(12, self.view.frame.size.height-110, self.view.frame.size.width-24, 80);
                UIImageView *imgTextLose = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"anima-text-lose.png"]];
                UIImageView *imgLineLose = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"anima-line-lose.png"]];
                imgLineLose.frame = CGRectMake(self.view.frame.size.width -80, 55, 50, 120);
                imgTextLose.frame = CGRectMake(50, 84-20, self.view.frame.size.width/2-10, 35);
                [self.view addSubview:imgTextLose];
                [self.view addSubview:imgLineLose];
                
            }
            
        }
    }
    else
    {
        if(isClear)
        {
            NSURL* url = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource: @"clear-all.mp3" ofType: nil]];
            sound = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: nil];
            [sound setDelegate:self];
            if([Session sharedInstance].flagEnableSound)
            {
                [sound play];
            }
            strResult = [NSString stringWithFormat:@"10問/%d問正解 ! \n レベル2は クリアーしました。",score];
            [btShare setImage:[UIImage imageNamed:@"btn-retry2.png"] forState:UIControlStateNormal ];
            
            lblResult.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-notice-red.png"]];
            lblResult.frame = CGRectMake(0, self.view.frame.size.height/2+70-110, self.view.frame.size.width, 98);
            btBack.frame = CGRectMake(12, self.view.frame.size.height-100-75-30, self.view.frame.size.width-24, 80);
            imgResult = [[UIImageView alloc] initWithFrame:CGRectMake(37, 14, self.view.frame.size.width-37*2, 100)];
            imgResult.image = [UIImage imageNamed:@"anima-cngratulations.png"];
           
            UILabel *lblTextWin = [[UILabel alloc] initWithFrame:CGRectMake(12, imgResult.frame.size.height+imgResult.frame.origin.y+5, self.view.frame.size.width-24, 70)];
            lblTextWin.text = @"やったね！全部のレベルをクリアーしました。\n この喜びをみんなさんに伝えましょう";
            lblTextWin.textAlignment = NSTextAlignmentCenter;
            lblTextWin.textColor = [UIColor whiteColor];
            lblTextWin.backgroundColor = [UIColor clearColor];
            lblTextWin.font = [UIFont boldSystemFontOfSize:13];
            lblTextWin.numberOfLines = 2;
            [self.view addSubview:lblTextWin];
             btShare.frame = CGRectMake(60, lblTextWin.frame.size.height+lblTextWin.frame.origin.y-10, self.view.frame.size.width-60*2, 40);
        }
        else
        {
            if(self.score >=7) //win
            {
                NSURL* url = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource: @"Clear.mp3" ofType: nil]];
                sound = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: nil];
                [sound setDelegate:self];
                if([Session sharedInstance].flagEnableSound)
                {
                    [sound play];
                }
                strResult = [NSString stringWithFormat:@"10問/%d問正解 ! \n レベル2は クリアーしました。",score];
                [btShare setImage:[UIImage imageNamed:@"btn-retry.png"] forState:UIControlStateNormal ];
                imgResult = [[UIImageView alloc] initWithFrame:CGRectMake(55, self.view.frame.size.height/2-170-100, 183, 180)];
                imgResult.image = [UIImage imageNamed:@"anima-cat-win.png"];
                lblResult.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-notice-red.png"]];
                lblResult.frame = CGRectMake(0, self.view.frame.size.height/2-90, self.view.frame.size.width, 98);
                btShare.frame = CGRectMake(12, self.view.frame.size.height/2+lblResult.frame.size.height+10-95, self.view.frame.size.width -24, 80);
                btBack.frame = CGRectMake(12, self.view.frame.size.height-90-75-25, self.view.frame.size.width-24, 80);
                
                
            }
            else
            {
                NSURL* url = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource: @"bgm.mp3" ofType: nil]];
                sound = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: nil];
                [sound setDelegate:self];
                if([Session sharedInstance].flagEnableSound)
                {
                    [sound play];
                }
                strResult = [NSString stringWithFormat:@"10問/%d問正解 ! \n クリアーできませんでした。",score];
                [btShare setImage:[UIImage imageNamed:@"btn-retry.png"] forState:UIControlStateNormal ];
                
                imgResult = [[UIImageView alloc] initWithFrame:CGRectMake(55, self.view.frame.size.height/2+70-170-100, 183,170)];
                imgResult.image = [UIImage imageNamed:@"anima-cat-lose.png"];
                lblResult.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-notice-blue.png"]];
                lblResult.frame = CGRectMake(0, self.view.frame.size.height/2+70-100, self.view.frame.size.width, 98);
                btBack.hidden = YES;
                btShare.frame = CGRectMake(12, self.view.frame.size.height-100-75-30, self.view.frame.size.width-24, 80);
                UIImageView *imgTextLose = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"anima-text-lose.png"]];
                UIImageView *imgLineLose = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"anima-line-lose.png"]];
                imgLineLose.frame = CGRectMake(self.view.frame.size.width -50, 65-62, 40, 90);
                imgTextLose.frame = CGRectMake(50, 74-60, self.view.frame.size.width/2-10, 33);
                [self.view addSubview:imgTextLose];
                [self.view addSubview:imgLineLose];
                
            }
            
        }
    }
    
    [btBack setImage:[UIImage imageNamed:@"btn-back-home.png"] forState:UIControlStateNormal ];
    lblResult.text = strResult;
    lblResult.font = [UIFont boldSystemFontOfSize:20];
    lblResult.textAlignment = NSTextAlignmentCenter;
    lblResult.textColor = [UIColor whiteColor];
    lblResult.numberOfLines = 2;
    
    [btBack addTarget:self action:@selector(onShare:) forControlEvents:UIControlEventTouchDown];
    [btShare addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchDown];
    //add objects in view
    [self.view addSubview:btShare];
    [self.view addSubview:btBack];
    [self.view addSubview:imgResult];
    [self.view addSubview:lblResult];
    
}
-(void) viewWillAppear:(BOOL)animated
{
    if ([Session sharedInstance].flagEnableSound == true) {
        //sound on
        [sound play];
        
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-on.png"] forState:UIControlStateNormal];
    }else{
        //sound on
        [sound stop];
        
        
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-off.png"] forState:UIControlStateNormal];
    }
    
    [_btnSound addTarget:self action:@selector(touchOnOffSounds) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_btnSound];
}
-(IBAction)onBack:(id)sender
{
    if(sound != nil)
    {
        [sound stop];
        sound = nil;
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)onShare:(id)sender
{
    Reachability *hostReach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [hostReach currentReachabilityStatus];
    if(netStatus == NotReachable)//no network
    {
        [self.view addSubview:self.viewNetwork];
//        [self.viewNetwork setFrame:CGRectMake( self.view.frame.size.width, 0.0f, self.viewNetwork.frame.size.width, self.viewNetwork.frame.size.height)]; //notice this is OFF screen!
//        [UIView beginAnimations:@"animateTableView" context:nil];
//        [UIView setAnimationDuration:0.8];
//        [self.viewNetwork setFrame:CGRectMake( 0.0f, 0.0f, self.viewNetwork.frame.size.width, self.viewNetwork.frame.size.height)]; //notice this is ON screen!
//        [UIView commitAnimations];
        [self.view bringSubviewToFront:self.viewNetwork];
    }
    else
    {
        OWTwitterActivity *twitterActivity = [[OWTwitterActivity alloc] init];
        OWMailActivity *mailActivity = [[OWMailActivity alloc] init];
        
        // Compile activities into an array, we will pass that array to
        // OWActivityViewController on the next step
        //
        
        NSMutableArray *activities = [[NSMutableArray alloc] init];
        [activities addObject:mailActivity];
        if( NSClassFromString (@"UIActivityViewController") ) {
            // ios 6, add facebook
            OWFacebookActivity *facebookActivity = [[OWFacebookActivity alloc] init];
            
            [activities addObject:facebookActivity];
        }
        // For some device may not support message (ie, Simulator and iPod Touch).
        // There is a bug in the Simulator when you configured iMessage under OS X,
        // for detailed information, refer to: http://stackoverflow.com/questions/9349381/mfmessagecomposeviewcontroller-on-simulator-cansendtext
//        if ([MFMessageComposeViewController canSendText]) {
//            OWMessageActivity *messageActivity = [[OWMessageActivity alloc] init];
//            [activities addObject:messageActivity];
//        }
//        
        [activities addObject:twitterActivity];
        OWActivityViewController *activityViewController = [[OWActivityViewController alloc] initWithViewController:self activities:activities];
        activityViewController.userInfo = @{
                                            
                                            @"text": @"アプリで脳トレはじめました！同じ図形を合わせる単純なんだけど。。。脳がイキイキしてくるアプリだよ！",
                                            @"url": [NSURL URLWithString:@"http://vnext.vn/"],
                                            @"coordinate": @{@"latitude": @(37.751586275), @"longitude": @(-122.447721511)}
                                            };
        //if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        //{
//            if (_activityPopoverController && _activityPopoverController.isPopoverVisible) {
//                [_activityPopoverController dismissPopoverAnimated:YES];
//                _activityPopoverController =  nil;
//                return;
//            }
//            _activityPopoverController = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
//            activityViewController.presentingPopoverController = _activityPopoverController;
//            [_activityPopoverController presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem
//                                               permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//        //}
        //else
       // {
            [activityViewController presentFromRootViewController];
       // }
        
    }
    
    
}
- (IBAction)onOk:(id)sender
{
    [self.viewNetwork removeFromSuperview];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchOnOffSounds{
    
    if ([Session sharedInstance].flagEnableSound == true) {
        [Session sharedInstance].flagEnableSound = false;
        [[Session sharedInstance] save];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-off.png"] forState:UIControlStateNormal];
        [sound stop];
    }else{
        [Session sharedInstance].flagEnableSound = true;
        [[Session sharedInstance] save];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-on.png"] forState:UIControlStateNormal];
        [sound play];
    }
}

#pragma AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if([Session sharedInstance].flagEnableSound)
        [sound play];
}
@end
