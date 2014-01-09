//
//  DisplayImageController.m
//  iTell
//
//  Created by tranduc on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayImageController.h"

@interface DisplayImageController ()

@end

@implementation DisplayImageController
@synthesize asImage;
@synthesize imFullScreen;
@synthesize svViewImage;
@synthesize viewScroll;

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
    svViewImage.contentSize = CGSizeMake(320.6, 418.6);
}

- (void)viewDidUnload
{
    [self setAsImage:nil];
    [self setImFullScreen:nil];
    [self setSvViewImage:nil];
    [self setViewScroll:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return viewScroll;
}
- (void)dealloc {
    [asImage release];
    [imFullScreen release];
    [svViewImage release];
    [viewScroll release];
    [super dealloc];
}
@end
