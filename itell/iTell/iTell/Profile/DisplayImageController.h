//
//  DisplayImageController.h
//  iTell
//
//  Created by tranduc on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
@interface DisplayImageController : UIViewController<UIScrollViewDelegate>
- (IBAction)backPressed:(id)sender;
@property (retain, nonatomic) IBOutlet AsyncImageView *asImage;
@property (retain, nonatomic) IBOutlet UIImageView *imFullScreen;
@property (retain, nonatomic) IBOutlet UIScrollView *svViewImage;
@property (retain, nonatomic) IBOutlet UIView *viewScroll;

@end
