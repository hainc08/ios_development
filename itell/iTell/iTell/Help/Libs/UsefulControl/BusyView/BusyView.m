//
//  BusyView.m
//  CouponCard
//
//  Created by bon on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BusyView.h"

@implementation BusyView
@synthesize imageView;
@synthesize activity;
@synthesize textActivity;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"BusyView" owner:self options:nil];
        self = [[array objectAtIndex:0] retain];
    }
    return self;
}

- (void) hiden
{
    [self setHidden:YES];
    //imageViewEnd.image = nil;
}

- (void)loadding:(BOOL)bl withText:(NSString *)text
{
    if ([text isEqualToString:@""] || text == nil || text.length == 0) {
        [textActivity setText:@""];
        //imageView.frame = CGRectMake(120, 186, 80, 70);
        //activity.frame = CGRectMake(142, 202, 37, 37);
        activity.center = imageView.center;
        
    } else {
        [textActivity setText:text];
//        imageView.frame = CGRectMake(110, 185, 100, 90);
//        activity.frame = CGRectMake(142, 199, 37, 37);
    }
    if (bl) {
        [activity startAnimating];
        [self setHidden:NO];
    } else {
        [activity stopAnimating];
        [self performSelector:@selector(hiden) withObject:nil afterDelay:0.3];
    }
}

- (void)endLoaddingWithText:(NSString *)text withImage:(UIImage*)image
{
    [activity stopAnimating];
    if ([text isEqualToString:@""] || text == nil || text.length == 0) {
        //imageViewEnd.center = imageView.center;
    } else {
        //imageViewEnd.center = activity.center;
    }
    textActivity.text = text;
    //imageViewEnd.image = image;
    [self performSelector:@selector(hiden) withObject:nil afterDelay:0.3];
}

- (void)dealloc {
    //[imageViewEnd release];
    [imageView release];
    [activity release];
    [textActivity release];
    [super dealloc];
}
@end
