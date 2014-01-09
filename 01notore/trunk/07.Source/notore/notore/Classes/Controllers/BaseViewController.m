//
//  BaseViewController.m
//  notore
//
//  Created by TrinhLD on 11/21/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "BaseViewController.h"
#import "Session.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
	// Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor colorWithRed:10.0f/255.0f green:78.0f/255.0f blue:47.0f/255.0f alpha:1.0];
    
    //init background
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg-top-repeat.png"] forBarMetrics:UIBarMetricsDefault];
    
    //
    _btnSound = [[UIButton alloc] init];
    _btnSound.frame=CGRectMake(0,0,32,32);
    }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:17],UITextAttributeFont,[UIColor whiteColor],UITextAttributeTextColor, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    //load BGM
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bgm.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
	_audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	_audioPlayer.numberOfLoops = -1;
	
	if (_audioPlayer == nil){
		NSLog(@"Error sound = %@",[error description]);
	}else{
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
    }
    if ([Session sharedInstance].flagEnableSound == true) {
        //sound on
        [_audioPlayer play];
        
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-on.png"] forState:UIControlStateNormal];
    }else{
        //sound on
        [_audioPlayer stop];
        
        
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-off.png"] forState:UIControlStateNormal];
    }
    
    [_btnSound addTarget:self action:@selector(touchOnOffSounds) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_btnSound];

}

#pragma mark -AVAudioPlayerDelegate Protocol Methods
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if([Session sharedInstance].flagEnableSound)
        [_audioPlayer play];
}
-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    
}
-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{
    
}
-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player{
    
}

#pragma mark - ON/OFF Sound
-(void)touchOnOffSounds{
    
    if ([Session sharedInstance].flagEnableSound == true) {
        [Session sharedInstance].flagEnableSound = false;
        [[Session sharedInstance] save];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-off.png"] forState:UIControlStateNormal];
        NSLog(@"off sound");
        [_audioPlayer stop];
    }else{
        [Session sharedInstance].flagEnableSound = true;
        [[Session sharedInstance] save];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-on.png"] forState:UIControlStateNormal];
        NSLog(@"on sound");
        [_audioPlayer play];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
