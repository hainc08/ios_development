//
//  ShowImageCell.h
//  iTell
//
//  Created by tranduc on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
@interface ShowImageCell : UITableViewCell<UIScrollViewDelegate>
@property(nonatomic, assign)UIViewController *controller;
@property (retain, nonatomic) IBOutlet UIScrollView *svScroller;
@property (retain, nonatomic) IBOutlet AsyncImageView *asImageView;

-(void)viewDidload;
-(void)loadUrl:(NSURL *)url;
@end
