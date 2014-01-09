//
//  NTHelpViewController.m
//  notore
//
//  Created by Nguyen Phuong Mai on 11/21/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "NTHelpViewController.h"
#import "Macro.h"
#import "Session.h"
@interface NTHelpViewController ()

@end

@implementation NTHelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"使い方";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg-top-repeat.png"] forBarMetrics:UIBarMetricsDefault];
    UIButton *btNaviBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [btNaviBack setImage:[UIImage imageNamed:@"btn-back.png"] forState:UIControlStateNormal];
    [btNaviBack addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btNaviBack];
    _btnSound = [[UIButton alloc] init];
    _btnSound.frame=CGRectMake(0,0,32,32);
    if(IS_IPHONE_5)
    {
        
    }
    else
    {
        UIScrollView* scroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
        scroll.contentSize = CGSizeMake(self.view.frame.size.width, 568);
        scroll.scrollEnabled = YES;
        [self.view addSubview:scroll];
        UIImageView* imgGuid = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img-tut1.png"]];
        imgGuid.frame = CGRectMake(20, 8, 280, 400);
        [scroll addSubview:imgGuid];
        UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img-tut3.png"]];
        img.frame = CGRectMake(20, 435, 280, 54);
        [scroll addSubview:img];
        
        UIButton* btLink = [UIButton buttonWithType:UIButtonTypeCustom];
        [btLink setTitle:@"http://blogs.yahoo.co.jp/qrjcg543" forState:UIControlStateNormal];
        [btLink setTitle:@"http://blogs.yahoo.co.jp/qrjcg543" forState:UIControlStateSelected];
        //btLink.titleLabel.text = @"http://blogs.yahoo.co.jp/qrjcg543";
        [btLink addTarget:self action:@selector(onClickLink:) forControlEvents:UIControlEventTouchDown];
        btLink.titleLabel.font = [UIFont systemFontOfSize:6.0];
        [btLink setTitleColor:[UIColor colorWithRed:8.0f/255.0f green:110.0f/255.0f blue:184.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        btLink.frame = CGRectMake(80, 27+img.frame.origin.y, 140, 24);
        [scroll addSubview:btLink];
        
    }
}
-(void) viewWillAppear:(BOOL)animated
{
    //load BGM
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bgm.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
	sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	sound.numberOfLoops = -1;
    if (sound == nil){
		NSLog(@"Error sound = %@",[error description]);
	}else{
        sound.delegate = self;
        [sound prepareToPlay];
    }
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
#pragma mark - ON/OFF Sound
-(void)touchOnOffSounds{
    
    if ([Session sharedInstance].flagEnableSound == true) {
        [Session sharedInstance].flagEnableSound = false;
        [[Session sharedInstance] save];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-off.png"] forState:UIControlStateNormal];
        NSLog(@"off sound");
        [sound stop];
    }else{
        [Session sharedInstance].flagEnableSound = true;
        [[Session sharedInstance] save];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-on.png"] forState:UIControlStateNormal];
        NSLog(@"on sound");
        [sound play];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)onClickLink:(id)sender
{
    NSString* str = @"";
    str = @"http://blogs.yahoo.co.jp/qrjcg543";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
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
#pragma AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if([Session sharedInstance].flagEnableSound)
        [sound play];
}
@end
