//
//  NTNotoreViewController.m
//  notore
//
//  Created by TrinhLD on 11/21/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "NTNotoreViewController.h"
#import "NTDataControl.h"
#import "NTQuizObject.h"
#import "NTResultViewController.h"
#import "Session.h"

@interface NTNotoreViewController ()

@end

@implementation NTNotoreViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        score = 0;
        iScreen = 0;
        isBack = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //add image for false image
    falseImageArray = [[NSMutableArray alloc] initWithCapacity:10];
    // Build array of images, cycling through image names
    for (int i = 1; i < 11 ; i ++)
    {
        [falseImageArray addObject: [UIImage imageNamed: [NSString stringWithFormat:@"popup-table-lose-%d.png", i]]];
    }
    
    //add image for true array
    trueImageArray = [[NSMutableArray alloc] initWithCapacity:10];
    // Build array of images, cycling through image names
    for (int i = 1; i < 11 ; i ++)
    {
        [trueImageArray addObject: [UIImage imageNamed: [NSString stringWithFormat:@"popup-table-win-%d.png", i]]];
    }
    
    //Back button
    UIButton *btNaviBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [btNaviBack setImage:[UIImage imageNamed:@"btn-back.png"] forState:UIControlStateNormal];
    [btNaviBack addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
//    [btNaviBack setContentEdgeInsets:UIEdgeInsetsMake(0, 7, 0, -7)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btNaviBack];
    
    // Title
    self.title = [NSString stringWithFormat:@"  野良猫レベル（10問/%d問）",currentIndex+1];
    // Background
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg-top-repeat.png"] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor colorWithRed:10.0f/255.0f green:78.0f/255.0f blue:47.0f/255.0f alpha:1.0];
    
    _btnSound = [[UIButton alloc] init];
    _btnSound.frame=CGRectMake(0,0,32,32);
    
    [self displayQuiz];
    iScreen = 0;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    if ([Session sharedInstance].flagEnableSound == true) {
        //sound on
        [_audioPlayer play];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-on.png"] forState:UIControlStateNormal];
    } else {
        //sound on
        [_audioPlayer stop];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-off.png"] forState:UIControlStateNormal];
    }
    
    [_btnSound addTarget:self action:@selector(touchOnOffSounds) forControlEvents:UIControlEventTouchUpInside];
    [_btnSound setContentEdgeInsets:UIEdgeInsetsMake(0, 20, 0, -20)];
//    UIView *viewRightBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _btnSound.frame.size.width + 7.0, _btnSound.frame.size.height)];
//    [viewRightBar addSubview:_btnSound];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_btnSound];
}

#pragma mark - Timer
- (void) onTimerCountFired: (NSTimer*) timer
{
    if(iRecordTime >=0)
    {
        if(iRecordTime == 10)
        {
            self.lblTime.text = [NSString stringWithFormat:@"残り%d秒",iRecordTime];
        }
        else
        {
            self.lblTime.text = [NSString stringWithFormat:@"残り0%d秒",iRecordTime];
        }
        if(!isBack)
        {
            iRecordTime --;
        }
        
    }
    else
    {
        // Pausing, do nothing
        if(iScreen == 0 && !isBack)
        {
            [self loadFalseAnimation];
            [self.view addSubview:self.viewAnswerFalse];
//            self.false_image.image = [UIImage imageNamed:@"popup-table-lose-10.png"];
//            [self.viewAnswerFalse setFrame:CGRectMake( self.view.frame.size.width, 0.0f, self.viewAnswerFalse.frame.size.width, self.viewAnswerFalse.frame.size.height)]; //notice this is OFF screen!
//            [UIView beginAnimations:@"animateTableView" context:nil];
//            [UIView setAnimationDuration:0.8];
//            [self.viewAnswerFalse setFrame:CGRectMake( 0.0f, 0.0f, self.viewAnswerFalse.frame.size.width, self.viewAnswerFalse.frame.size.height)]; //notice this is ON screen!
//            [UIView commitAnimations];
            
            [self performSelector:@selector(loadFalseAnimation) withObject:nil afterDelay:0.8];

            [self.view bringSubviewToFront:self.viewAnswerFalse];
            iScreen = 2;
            NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/incorect.mp3", [[NSBundle mainBundle] resourcePath]]];
            
            NSError *error;
            if(_audioPlayer != nil)
            {
                [_audioPlayer stop];
                _audioPlayer = nil;
            }
            _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            _audioPlayer.numberOfLoops = 0;
            
            if (_audioPlayer == nil){
                NSLog(@"Error sound = %@",[error description]);
            }else{
                _audioPlayer.delegate = self;
                if ([Session sharedInstance].flagEnableSound ) [_audioPlayer play];
            }
        }
        
    }
}
- (NSArray *)listQuiz
{
    if (!_listQuiz) {
        _listQuiz = [[NSMutableArray alloc] init];
        _listQuiz = [NTDataControl getListQuizByLevel:self.level];
        
    }
    return _listQuiz;
}

- (void)displayQuiz
{
    //    if([Session sharedInstance].flagEnableSound && iScreen == 0 && !self.audioPlayer.play)
    //    {
    //        if( !self.audioPlayer.play)[self.audioPlayer play];
    //        if(_audioPlayerResultFalse.play) [_audioPlayerResultFalse stop];
    //        if(_audioPlayerResultTrue.play) [_audioPlayerResultTrue stop];
    //    }
    if(timerCount)
    {
        [timerCount invalidate];
        timerCount = nil;
        
    }
    //load BGM
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bgm.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
    if(_audioPlayer != nil)
    {
        [_audioPlayer stop];
        _audioPlayer = nil;
    }
	_audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	_audioPlayer.numberOfLoops = -1;
	
	if (_audioPlayer == nil){
		NSLog(@"Error sound = %@",[error description]);
	}else{
        _audioPlayer.delegate = self;
        if([Session sharedInstance].flagEnableSound) [_audioPlayer play];
    }
    
    iRecordTime = 10;
    timerCount = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(onTimerCountFired:) userInfo: nil repeats: YES];
    
    self.title = [NSString stringWithFormat:@"  野良猫レベル（10問/%d問）",currentIndex+1];
    
    NTQuizObject *quizObject = [self.listQuiz objectAtIndex:currentIndex];
    // Display question
    NTQuestionObject *questionObject = quizObject.question;
    kTagCurrentQuestion = questionObject.q_tag;
    
    [self.btnQuestion setImage:[UIImage imageNamed:questionObject.q_name] forState:UIControlStateNormal];
    [self.btnQuestion.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    // Display answer
    NSArray *listAnswer = quizObject.listAnswer;
    if (listAnswer.count == kNumberAnswer) {
        NTQuestionObject *firstAnswer = [listAnswer objectAtIndex:0];
        
        [self.btnAnswerA setImage:[UIImage imageNamed:firstAnswer.q_name] forState:UIControlStateNormal];
        [self.btnAnswerA.imageView setContentMode:UIViewContentModeScaleAspectFit];
        self.btnAnswerA.tag = firstAnswer.q_tag;
        
        NTQuestionObject *secondAnswer = [listAnswer objectAtIndex:1];
        [self.btnAnswerB setImage:[UIImage imageNamed:secondAnswer.q_name] forState:UIControlStateNormal];
        [self.btnAnswerB.imageView setContentMode:UIViewContentModeScaleAspectFit];
        self.btnAnswerB.tag = secondAnswer.q_tag;
        
        NTQuestionObject *thirdAnswer = [listAnswer objectAtIndex:2];
        [self.btnAnswerC setImage:[UIImage imageNamed:thirdAnswer.q_name] forState:UIControlStateNormal];
        [self.btnAnswerC.imageView setContentMode:UIViewContentModeScaleAspectFit];
        self.btnAnswerC.tag = thirdAnswer.q_tag;
        
        NTQuestionObject *fourAnswer = [listAnswer objectAtIndex:3];
        [self.btnAnswerD setImage:[UIImage imageNamed:fourAnswer.q_name] forState:UIControlStateNormal];
        [self.btnAnswerD.imageView setContentMode:UIViewContentModeScaleAspectFit];
        self.btnAnswerD.tag = fourAnswer.q_tag;
    }
}

- (IBAction)btnAnswerTapped:(UIButton *)sender
{
    if(timerCount)
    {
        [timerCount invalidate];
        timerCount = nil;
        
    }
    NSInteger tag = sender.tag;
    if(_audioPlayer !=nil)
    {
        [_audioPlayer stop];
        _audioPlayer = nil;
        //
    }
    if (tag == kTagCurrentQuestion) {
        // True
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/corect.mp3", [[NSBundle mainBundle] resourcePath]]];
        
        NSError *error;
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        _audioPlayer.numberOfLoops = 0;
        
        if (_audioPlayer == nil){
            NSLog(@"Error sound = %@",[error description]);
        }else{
            _audioPlayer.delegate = self;
            if ([Session sharedInstance].flagEnableSound )[_audioPlayer play];
        }
        iScreen = 1;
        [self loadTrueAnimation];
        [self.view addSubview:self.viewAnswerTrue];
        [self.view bringSubviewToFront:self.viewAnswerTrue];
        score ++;
    } else
    {
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/incorect.mp3", [[NSBundle mainBundle] resourcePath]]];
        
        NSError *error;
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        _audioPlayer.numberOfLoops = 0;
        
        if (_audioPlayer == nil){
            NSLog(@"Error sound = %@",[error description]);
        }else{
            _audioPlayer.delegate = self;
            if ([Session sharedInstance].flagEnableSound ) [_audioPlayer play];
        }
        iScreen = 2;
        [self loadFalseAnimation];
        [self.view addSubview:self.viewAnswerFalse];
        [self.view bringSubviewToFront:self.viewAnswerFalse];
    }
}


-(void) loadFalseAnimation{
    self.false_image.animationImages = [NSArray arrayWithArray:falseImageArray];
    
    // One cycle through all the images takes 1.5 seconds
    
    self.false_image.animationDuration = 1.0;
    // Repeat forever
    self.false_image.animationRepeatCount = 1;
    self.false_image.image = [UIImage imageNamed:@"popup-table-lose-10.png"];
    [self.false_image startAnimating];
}
-(void) loadTrueAnimation{
    
    self.true_image.animationImages = [NSArray arrayWithArray:trueImageArray];
    
    // One cycle through all the images takes 1.5 seconds
    
    self.true_image.animationDuration = 1.0;
    // Repeat forever
    self.true_image.animationRepeatCount = 1;
    self.true_image.image = [UIImage imageNamed:@"popup-table-win-10.png"];
    [self.true_image startAnimating];
}

- (IBAction)btnNextQuizTapped:(id)sender {
    if(_audioPlayer!=nil&&_audioPlayer.play)
    {
        [_audioPlayer stop];
        _audioPlayer = nil;
    }
    [self.viewAnswerFalse removeFromSuperview];
    [self.viewAnswerTrue removeFromSuperview];
    currentIndex ++;
    if(currentIndex < 10)
    {
        [self displayQuiz];
    }
    else if (currentIndex == 10)
    {
        [NTDataControl addClearLevel:_level withQNum:score];
        [self displayResult];
    }
    
    iScreen = 0;
}
- (void) displayResult
{
    NTResultViewController* result = [[NTResultViewController alloc] initWithNibName:@"NTResultViewController" bundle:nil];
    result.level = _level;
    result.score = score;
    //save number played and score played
    int numberPlayed = [NTDataControl getNumberPlayed];
    int numberScore = [NTDataControl getScorePlayed];
    [NTDataControl setNumberPlayed:numberPlayed+1];
    [NTDataControl setScorePlayed:numberScore+score];
    //
    BOOL isClearAll = YES;
    for(int i = 1; i<= 6; i++)
    {
        if([NTDataControl getScoreOfLevel:i] <7) isClearAll = NO;
    }
    result.isClear = isClearAll;
    [self.navigationController pushViewController:result animated:YES];
}
-(IBAction)onBack:(id)sender
{
    isBack = YES;
    if(iScreen == 2 )
    {
        self.viewAnswerFalse.hidden = YES;
    }
    if(iScreen == 1)
    {
        self.viewAnswerTrue.hidden = YES;
    }
    
    [self.view addSubview:self.viewBackQuestion];
//    [self.viewBackQuestion setFrame:CGRectMake( self.view.frame.size.width, 0.0f, self.viewBackQuestion.frame.size.width, self.viewBackQuestion.frame.size.height)]; //notice this is OFF screen!
//    [UIView beginAnimations:@"animateTableView" context:nil];
//    [UIView setAnimationDuration:0.8];
//    [self.viewBackQuestion setFrame:CGRectMake( 0.0f, 0.0f, self.viewBackQuestion.frame.size.width, self.viewBackQuestion.frame.size.height)]; //notice this is ON screen!
//    [UIView commitAnimations];
    [self.view bringSubviewToFront:self.viewBackQuestion];
}
- (IBAction)onCancelBack:(id)sender
{
    [self.viewBackQuestion removeFromSuperview];
    if(iScreen == 2 )
    {
        self.viewAnswerFalse.hidden = NO;
    }
    if(iScreen == 1)
    {
        self.viewAnswerTrue.hidden = NO;
    }
    isBack = NO;
}
- (IBAction)onOkBack:(id)sender
{
    isBack = YES;
    [self.viewBackQuestion removeFromSuperview];
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[NTDataControl addClearLevel:_level withQNum:score];
    
    if(_audioPlayer != nil)
    {
        [_audioPlayer stop];
        _audioPlayer = nil;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -AVAudioPlayerDelegate Protocol Methods
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if([Session sharedInstance].flagEnableSound)
        if(iScreen == 0)
        {
            [_audioPlayer play];
        }
        
    
    
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
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-off.png"] forState:UIControlStateNormal];
        [_audioPlayer stop];
    }else{
        [Session sharedInstance].flagEnableSound = true;
        [[Session sharedInstance] save];
        [_btnSound setBackgroundImage:[UIImage imageNamed: @"btn-sound-on.png"] forState:UIControlStateNormal];
        NSLog(@"on sound");
        [_audioPlayer play];
    }
}
@end
