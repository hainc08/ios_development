//
//  NTNotoreViewController.h
//  notore
//
//  Created by TrinhLD on 11/21/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "BaseViewController.h"

@interface NTNotoreViewController : UIViewController<AVAudioPlayerDelegate>
{
    int currentIndex;
    NSInteger kTagCurrentQuestion;
    int     score;
    NSTimer*       timerCount;
    int     iRecordTime;
    int    iScreen;//=0 if background, =1 if true, = 2 if false
    
    //array image animation
    NSMutableArray *falseImageArray;
    NSMutableArray *trueImageArray;
    BOOL isBack;
    
}
@property(nonatomic,copy) UIButton* btnSound;
//@property (strong, nonatomic) AVAudioPlayer *audioPlayerResultTrue;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, retain) NSArray *listQuiz;
@property (strong, nonatomic) IBOutlet UIButton *btnQuestion;
@property (strong, nonatomic) IBOutlet UIButton *btnAnswerA;
@property (strong, nonatomic) IBOutlet UIButton *btnAnswerB;
@property (strong, nonatomic) IBOutlet UIButton *btnAnswerC;
@property (strong, nonatomic) IBOutlet UIButton *btnAnswerD;
@property (strong, nonatomic) IBOutlet UILabel  *lblTime;

// Popup view
@property (strong, nonatomic) IBOutlet UIView *viewAnswerFalse;
@property (strong, nonatomic) IBOutlet UIView *viewAnswerTrue;
@property (strong, nonatomic) IBOutlet UIImageView *false_image;
@property (strong, nonatomic) IBOutlet UIImageView *true_image;

@property (strong, nonatomic) IBOutlet UIView *viewBackQuestion;
- (IBAction)onCancelBack:(id)sender;
- (IBAction)onOkBack:(id)sender;


@end
