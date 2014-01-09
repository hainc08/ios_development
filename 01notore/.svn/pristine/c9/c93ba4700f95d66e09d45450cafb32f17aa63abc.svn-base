//
//  NTTopViewController.m
//  notore
//
//  Created by TrinhLD on 11/21/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "NTTopViewController.h"
#import "NTHelpViewController.h"
#import "NTNotoreViewController.h"
#import "NTDataControl.h"
@interface NTTopViewController ()

@end

@implementation NTTopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        levelClear = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    self.title = [NSString stringWithFormat:@"トモ・ネコのちょこっと脳トレ！"];
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:17],UITextAttributeFont, nil];
    self.navigationController.navigationBar.titleTextAttributes = size;
    //[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName: [UIFont boldSystemFontOfSize:14]}];
    lblView.layer.zPosition = 1;
    imageView.layer.zPosition = 0;
    _viewClear.layer.zPosition = 2;
    _viewReset.layer.zPosition = 2;
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [self showImageForButtons];
    int numberPlayed = [NTDataControl getNumberPlayed]*10;
    int numberScore = [NTDataControl getScorePlayed];
    if(numberPlayed == 0)
    {
        lbl.text = @"0問/0問正解（正解率0%)";
    }
    else
    {
        lbl.text = [NSString stringWithFormat:@"%d問/%d問正解（正解率%d%@）",numberPlayed,numberScore,(int)(numberScore*100/numberPlayed),@"%"];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onHelp:(id)sender
{
    if(self.audioPlayer != nil)
    {
        [self.audioPlayer stop];
        self.audioPlayer = nil;
    }
    if(IS_IPHONE_5)
    {
        NTHelpViewController* helpController = [[NTHelpViewController alloc] initWithNibName:@"NTHelpViewController_5S" bundle:nil];
        [self.navigationController pushViewController:helpController animated:YES];
    }
    else
    {
        NTHelpViewController* helpController = [[NTHelpViewController alloc] initWithNibName:@"NTHelpViewController" bundle:nil];
        [self.navigationController pushViewController:helpController animated:YES];
    }
   
}

#pragma mark -
#pragma mark - Start NOTORE with level
- (void)startNotoreWithLevel:(NSInteger) level
{
    if(IS_IPHONE_5)
    {
        NTNotoreViewController *notoreStart = [[NTNotoreViewController alloc] initWithNibName:@"NTNotoreViewController_5S" bundle:nil] ;
        notoreStart.level = level;
        [self.navigationController pushViewController:notoreStart animated:YES];
        [self.audioPlayer stop];
        self.audioPlayer = nil;
    }
    else
    {
        NTNotoreViewController *notoreStart = [[NTNotoreViewController alloc] initWithNibName:@"NTNotoreViewController" bundle:nil] ;
        notoreStart.level = level;
        [self.navigationController pushViewController:notoreStart animated:YES];
        [self.audioPlayer stop];
        self.audioPlayer = nil;
    }
   
}

- (IBAction)btnChooseLevelTapped:(UIButton *)sender {
    int level = ((UIButton*)sender).tag;
    int score = [NTDataControl getScoreOfLevel:level];
    if(score <7)
    {
        [self startNotoreWithLevel:level];
    }
    else
    {
        [self.view addSubview:self.viewClear];
//        [self.viewClear setFrame:CGRectMake( self.view.frame.size.width, 0.0f, self.viewReset.frame.size.width, self.viewClear.frame.size.height)]; //notice this is OFF screen!
//        [UIView beginAnimations:@"animateTableView" context:nil];
//        [UIView setAnimationDuration:0.8];
//        [self.viewClear setFrame:CGRectMake( 0.0f, 0.0f, self.viewReset.frame.size.width, self.viewReset.frame.size.height)]; //notice this is ON screen!
//        [UIView commitAnimations];
        [self.view bringSubviewToFront:self.viewClear];
        levelClear = level;
    }
}

- (IBAction)onReset:(id)sender
{
    [self.view addSubview:self.viewReset];
//    [self.viewReset setFrame:CGRectMake( self.view.frame.size.width, 0.0f, self.viewReset.frame.size.width, self.viewReset.frame.size.height)]; //notice this is OFF screen!
//    [UIView beginAnimations:@"animateTableView" context:nil];
//    [UIView setAnimationDuration:0.8];
//    [self.viewReset setFrame:CGRectMake( 0.0f, 0.0f, self.viewReset.frame.size.width, self.viewReset.frame.size.height)]; //notice this is ON screen!
//    [UIView commitAnimations];
    [self.view bringSubviewToFront:self.viewReset];
}

- (IBAction)btReset:(id)sender
{
    [self.viewReset removeFromSuperview];
    [NTDataControl resetAllLevel];
    [self showImageForButtons];
}
- (IBAction)btCancelReset:(id)sender
{
    [self.viewReset removeFromSuperview];
}
- (IBAction)btOKClear:(id)sender
{
    [NTDataControl addClearLevel:levelClear withQNum:0];
    [self.viewClear removeFromSuperview];
    [self showImageForButtons];
}
- (void) showImageForButtons
{
    int score = [NTDataControl getScoreOfLevel:1];
    if(score <7)
    {
        [bt1 setImage:[UIImage imageNamed:@"btn-lv1-home.png"] forState:UIControlStateNormal ];
    }
    else{
        [bt1 setImage:[UIImage imageNamed:@"btn-clean-home.png"] forState:UIControlStateNormal ];
    }
    score = [NTDataControl getScoreOfLevel:2];
    if(score <7)
    {
        [bt2 setImage:[UIImage imageNamed:@"btn-lv2-home.png"] forState:UIControlStateNormal ];
    }
    else{
        [bt2 setImage:[UIImage imageNamed:@"btn-clean-home.png"] forState:UIControlStateNormal ];
    }
    score = [NTDataControl getScoreOfLevel:3];
    if(score <7)
    {
        [bt3 setImage:[UIImage imageNamed:@"btn-lv3-home.png"] forState:UIControlStateNormal ];
    }
    else{
        [bt3 setImage:[UIImage imageNamed:@"btn-clean-home.png"] forState:UIControlStateNormal ];
    }
    score = [NTDataControl getScoreOfLevel:4];
    if(score <7)
    {
        [bt4 setImage:[UIImage imageNamed:@"btn-lv4-home.png"] forState:UIControlStateNormal ];
    }
    else{
        [bt4 setImage:[UIImage imageNamed:@"btn-clean-home.png"] forState:UIControlStateNormal ];
    }
    score = [NTDataControl getScoreOfLevel:5];
    if(score <7)
    {
        [bt5 setImage:[UIImage imageNamed:@"btn-lv5-home.png"] forState:UIControlStateNormal ];
    }
    else{
        [bt5 setImage:[UIImage imageNamed:@"btn-clean-home.png"] forState:UIControlStateNormal ];
    }
    score = [NTDataControl getScoreOfLevel:6];
    if(score <7)
    {
        [bt6 setImage:[UIImage imageNamed:@"btn-lv6-home.png"] forState:UIControlStateNormal ];
    }
    else{
        [bt6 setImage:[UIImage imageNamed:@"btn-clean-home.png"] forState:UIControlStateNormal ];
    }
}




@end
