//
//  NTResultViewController.h
//  notore
//
//  Created by TrinhLD on 11/21/13.
//  Copyright (c) 2013 vnext. All rights reserved.
//

#import "BaseViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface NTResultViewController : UIViewController<AVAudioPlayerDelegate>
{
    UIButton* btBack;
    UIButton* btShare;
    UIImageView* imgResult;
    UILabel* lblResult;
    int score;
    NSString* _strLevel;
    BOOL isClear;//check if all level cleared
   // BOOL isOnSound;//check if sound is on/off
    AVAudioPlayer      *sound;
    
    UIPopoverController *_activityPopoverController;
    int level;
}

@property (nonatomic,retain) NSString *strLevel;
@property (nonatomic, assign) int score;
@property (nonatomic, assign) int level;
@property (nonatomic, assign) BOOL isClear;
@property (strong, nonatomic) IBOutlet UIView *viewNetwork;
@property(nonatomic,copy) UIButton* btnSound;
- (IBAction)onOk:(id)sender;
@end
