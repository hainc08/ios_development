//
//  ShowImageCell.m
//  iTell
//
//  Created by tranduc on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShowImageCell.h"
#import "DisplayImageController.h"
#import "MPFoldTransition.h"
@interface ShowImageCell()
@property(nonatomic, retain)NSURL *url;
@end
@implementation ShowImageCell
@synthesize svScroller;
@synthesize asImageView;
@synthesize controller;
@synthesize url;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
return self;
}
-(void)viewDidload{
    svScroller.contentSize = CGSizeMake(320.5, 50);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView == svScroller) {
        if (svScroller.contentOffset.x < -40) {
            DisplayImageController *display = [[DisplayImageController alloc] initWithNibName:@"DisplayImageController" bundle:nil];
            [controller.navigationController pushViewController:display foldStyle:MPFoldStyleFlipFoldBit(MPFoldStyleCubic)];
            [display.asImage loadImageFromURL:url];
            [display release];
        }
    }
}
-(void)loadUrl:(NSURL *)u{
    self.url = u;
    [asImageView loadImageFromURL:u];
}
- (void)dealloc {
    [svScroller release];
    [asImageView release];
    [url release];
    [super dealloc];
}
@end
