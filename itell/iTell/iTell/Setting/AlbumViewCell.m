//
//  AlbumViewCell.m
//  iTell
//
//  Created by Minh Pham Tuan on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AlbumViewCell.h"

@implementation AlbumViewCell

@synthesize delegate;
@synthesize cellIndex;
@synthesize scroll,imageViewOverlay, imageViewBg;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"AlbumViewCell" owner:self options:nil];
        self = [array objectAtIndex:0];
        
        
        //[scrollView setScrollEnabled:FALSE];
        
    }
    return self;
}
#pragma mark - ScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    float x = scrollView.contentOffset.x;
    if(x > 50) {
        
        if ([delegate respondsToSelector:@selector(imageCellSelected:)]) {
            [delegate imageCellSelected:cellIndex];
        }
    }
}

@end
