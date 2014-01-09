//
//  ItellViewController.h
//  iTell
//
//  Created by Nguyen Lan Huong on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItellShareStatusController.h"
#import "ApiRequest.h"

#define kGetTimeRemain @"get_time_remain"
#define kTagGetTimeRemain 100

#define kCancelItell @"cancel_itell"
#define kCancelItellTag 101

#define kOffsetScrollViewThreshold 60
#define kFileButtonItell @"btnItell_"

#define kStep 30

@interface ItellViewController : UIViewController<ApiRequestDelegate,
                UIAlertViewDelegate, ItellShareStatusControllerDelegate, UIScrollViewDelegate>{
    NSTimer *_timer;
    ApiRequest *_apiRequest;
    int levelRemainTime;
}

@property (retain, nonatomic) IBOutlet UIImageView *imItellAll;
@property (retain, nonatomic) IBOutlet UIImageView *imItellFriend;
@property (retain, nonatomic) IBOutlet UIImageView *imItellOther;

@property (retain, nonatomic) IBOutlet UIScrollView *svFriends;
@property (retain, nonatomic) IBOutlet UIScrollView *svAllUser;
@property (retain, nonatomic) IBOutlet UIScrollView *svOther;

@property (retain, nonatomic) IBOutlet UIImageView *bgFriendView;

-(kItellPlicy)getItellPolicy; //for view button extension in chat


@end
