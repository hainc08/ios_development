//
//  BusyView.h
//  CouponCard
//
//  Created by bon on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BusyViewDelegate <NSObject>

@end

@interface BusyView : UIView
{
    
}
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (retain, nonatomic) IBOutlet UILabel *textActivity;

- (void)loadding:(BOOL)bl withText:(NSString *)text;
- (void)endLoaddingWithText:(NSString *)text withImage:(UIImage*)image;

@end
